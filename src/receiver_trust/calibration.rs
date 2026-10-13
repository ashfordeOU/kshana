// SPDX-License-Identifier: AGPL-3.0-only
//! Threshold calibration of the measurement-domain trust monitors against published event truth.
//!
//! The C/N0-drop, AGC and jamming-indicator monitors of [`super::monitors`] decide on three
//! statistics that do not depend on their thresholds (`cn0_drop_db`, `|agc_z|`, `jam_ind` of
//! [`EpochTrust`]). This module runs the monitors once per receiver log, labels each
//! post-calibration epoch clean or attacked from the log's published attack windows, and sweeps
//! each threshold over a fixed grid to give the detection and false-alarm probabilities (the ROC
//! curve) at every value, so the alarm at any threshold is reproduced exactly.
//!
//! [`run_dataset`] does this for the JammerTest 2024 dataset ("GNSS Dataset Under Jamming,
//! Spoofing, and Meaconing Conditions (JammerTest 2024)", Zenodo record 15911589,
//! doi:10.5281/zenodo.15910563, GPL-3.0-or-later), whose folders each hold a `scenario.json`
//! with an `attack_log`, a `mon_rf.csv`, a `rinex.csv` and sometimes a `.ubx`. The dataset is
//! not vendored: point the harness at an extracted copy
//! (`examples/jammertest_trust_calibration.rs`, `tests/receiver_trust_jammertest_calibration.rs`).
//! Method, event truth, selection rule and bars are fixed in
//! `xval/jammertest-trust/PREREGISTRATION.md`; the numbers are in `xval/jammertest-trust/RESULTS.md`.
//!
//! Nothing here changes the default rule: the calibrated values ship only as the opt-in
//! [`super::monitors::ThresholdProfile::Jammertest2024Calibrated`].

use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

use serde::Serialize;
use serde_json::Value;

use super::ingest::{days_from_civil, read_ubx, timeline_from};
use super::monitors::{run_monitors, MonitorConfig, TrustResult};
use super::{LogEpoch, SatCn0, Timeline};
use crate::realdata::jammertest::{mon_rf_records, rinex_cn0_records};

/// The dataset's `attack_log` stamps are tagged `Z` but are local time (CEST, UTC+2); this
/// shift (s) takes them to UTC. Fixed in the pre-registration; no other shift is tried.
pub const TZ_SHIFT_S: f64 = -7200.0;
/// Guard band around each attack-window edge, s: epochs closer than this to an edge are
/// neither clean nor attacked (the windows are scheduled slots at one-minute resolution).
pub const GUARD_S: f64 = 60.0;
/// Largest pooled clean-epoch false-alarm probability the selection rule accepts.
pub const ALPHA: f64 = 0.01;
/// Bar B1: largest held-out false-alarm probability of each calibrated threshold.
pub const B1_MAX_PFA: f64 = 0.02;
/// Bar B2: largest held-out false-alarm probability of the union of the three monitors.
pub const B2_MAX_PFA: f64 = 0.05;
/// Bar B2: smallest held-out detection probability of the union on jamming epochs.
pub const B2_MIN_PD: f64 = 0.50;
/// Minimum data: evaluable folders with a jamming attack.
pub const MIN_JAMMING_FOLDERS: usize = 3;
/// Minimum data: clean epochs.
pub const MIN_CLEAN_EPOCHS: usize = 1000;

/// One of the three calibrated statistics.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Stat {
    /// Mean C/N0 drop against the baseline, dB; alarm when `>= cn0_drop_db`.
    Cn0Drop,
    /// AGC deviation in baseline standard deviations (absolute); alarm when `> agc_k_sigma`.
    Agc,
    /// u-blox jamming indicator; alarm when `> jam_ind_threshold`.
    JamInd,
}

impl Stat {
    /// All three, in report order.
    pub const ALL: [Stat; 3] = [Stat::Cn0Drop, Stat::Agc, Stat::JamInd];

    /// The [`MonitorConfig`] field the threshold sets.
    pub fn config_field(self) -> &'static str {
        match self {
            Stat::Cn0Drop => "cn0_drop_db",
            Stat::Agc => "agc_k_sigma",
            Stat::JamInd => "jam_ind_threshold",
        }
    }

    /// The 0.35 default threshold.
    pub fn default_threshold(self) -> f64 {
        let d = MonitorConfig::default();
        match self {
            Stat::Cn0Drop => d.cn0_drop_db,
            Stat::Agc => d.agc_k_sigma,
            Stat::JamInd => d.jam_ind_threshold,
        }
    }

    /// The pre-registered threshold grid, ascending.
    pub fn grid(self) -> Vec<f64> {
        match self {
            Stat::Cn0Drop => (1..=60).map(|i| f64::from(i) * 0.5).collect(),
            Stat::Agc => (1..=40)
                .map(|i| f64::from(i) * 0.5)
                .chain((21..=100).map(f64::from))
                .chain((11..=100).map(|i| f64::from(i) * 10.0))
                .collect(),
            Stat::JamInd => (0..=254).map(f64::from).collect(),
        }
    }

    /// Whether the monitor alarms on statistic `v` at threshold `thr` (the same comparison as
    /// [`run_monitors`]).
    pub fn alarms(self, v: Option<f64>, thr: f64) -> bool {
        match (self, v) {
            (_, None) => false,
            (Stat::Cn0Drop, Some(v)) => v >= thr,
            (Stat::Agc | Stat::JamInd, Some(v)) => v > thr,
        }
    }
}

/// Event-truth class of one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Class {
    /// Post-calibration and more than [`GUARD_S`] outside every window of its folder.
    Clean,
    /// Inside a window by at least [`GUARD_S`], in a folder whose attack type includes jamming.
    Jamming,
    /// The same in a spoofing or meaconing folder: reported, never used for selection or bars.
    OtherAttack,
}

/// The three statistics of one labelled post-calibration epoch.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Sample {
    /// Event-truth class.
    pub class: Class,
    /// `cn0_drop_db` of the epoch, where defined.
    pub cn0_drop: Option<f64>,
    /// `|agc_z|`, where defined.
    pub agc_absz: Option<f64>,
    /// `jam_ind`, where defined.
    pub jam_ind: Option<f64>,
}

impl Sample {
    /// The value of one statistic.
    pub fn get(&self, s: Stat) -> Option<f64> {
        match s {
            Stat::Cn0Drop => self.cn0_drop,
            Stat::Agc => self.agc_absz,
            Stat::JamInd => self.jam_ind,
        }
    }
}

/// Seconds since 1970-01-01T00:00:00 of a time stamp written `YYYY-MM-DD[ T]HH:MM:SS[.f][Z]`
/// (with an optional trailing ` UTC`). `None` when it does not parse.
pub fn utc_seconds(ts: &str) -> Option<f64> {
    let ts = ts.trim().trim_end_matches(" UTC").trim_end_matches('Z');
    let (date, time) = ts.split_once([' ', 'T'])?;
    let mut d = date.split('-');
    let y: i64 = d.next()?.parse().ok()?;
    let mo: i64 = d.next()?.parse().ok()?;
    let da: i64 = d.next()?.parse().ok()?;
    let mut t = time.trim().split(':');
    let h: f64 = t.next()?.parse().ok()?;
    let mi: f64 = t.next()?.parse().ok()?;
    let s: f64 = t.next()?.parse().ok()?;
    if !(1..=12).contains(&mo) || !(1..=31).contains(&da) || !(0.0..24.0).contains(&h) {
        return None;
    }
    Some(days_from_civil(y, mo, da) as f64 * 86_400.0 + h * 3600.0 + mi * 60.0 + s)
}

/// Attack windows `[start, end]` in UTC seconds from a `scenario.json` `attack_log`: an event
/// containing "start" opens a window, the next one containing "end" or "stop" closes it;
/// [`TZ_SHIFT_S`] is applied.
pub fn attack_windows(meta: &Value) -> Vec<(f64, f64)> {
    let mut wins = Vec::new();
    let mut open = None;
    for ev in meta
        .get("attack_log")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
    {
        let (Some(ts), Some(text)) = (
            ev.get("timestamp_utc").and_then(Value::as_str),
            ev.get("event").and_then(Value::as_str),
        ) else {
            continue;
        };
        let Some(t) = utc_seconds(ts) else { continue };
        let t = t + TZ_SHIFT_S;
        let e = text.to_lowercase();
        if e.contains("start") {
            open = Some(t);
        } else if e.contains("end") || e.contains("stop") {
            if let Some(s) = open.take() {
                wins.push((s, t));
            }
        }
    }
    wins
}

/// Event-truth class of an epoch at UTC time `t` (`None`: inside a guard band).
pub fn label(t: f64, windows: &[(f64, f64)], jamming_folder: bool) -> Option<Class> {
    if windows
        .iter()
        .any(|&(s, e)| t >= s + GUARD_S && t <= e - GUARD_S)
    {
        return Some(if jamming_folder {
            Class::Jamming
        } else {
            Class::OtherAttack
        });
    }
    if windows
        .iter()
        .all(|&(s, e)| t < s - GUARD_S || t > e + GUARD_S)
    {
        return Some(Class::Clean);
    }
    None
}

/// Whether the calibration window `[t0, t0 + calibration_s)` starts less than [`GUARD_S`]
/// before a window, or inside one (the folder-exclusion rule).
pub fn calibration_contaminated(t0: f64, calibration_s: f64, windows: &[(f64, f64)]) -> bool {
    windows
        .iter()
        .any(|&(s, e)| t0 + calibration_s > s - GUARD_S && t0 < e)
}

/// A receiver-trust [`Timeline`] from a JammerTest folder's `mon_rf.csv` and `rinex.csv`, in
/// 1 s bins of the UTC stamps: AGC averaged, jamming indicator maximum, C/N0 per (satellite,
/// band) averaged. Returns the timeline and the UTC time (s) of its first epoch.
pub fn timeline_from_csv(mon_rf: &str, rinex: &str) -> Option<(Timeline, f64)> {
    #[derive(Default)]
    struct Bin {
        agc: (f64, usize),
        jam: Option<f64>,
        cn0: BTreeMap<(String, &'static str), (f64, usize)>,
    }
    let mut bins: BTreeMap<i64, Bin> = BTreeMap::new();
    for r in mon_rf_records(mon_rf) {
        let Some(t) = utc_seconds(&r.time) else {
            continue;
        };
        let b = bins.entry(t.floor() as i64).or_default();
        if let Some(a) = r.agc {
            b.agc.0 += a;
            b.agc.1 += 1;
        }
        if let Some(j) = r.jam_ind {
            b.jam = Some(b.jam.map_or(j, |x: f64| x.max(j)));
        }
    }
    for r in rinex_cn0_records(rinex) {
        let Some(t) = utc_seconds(&r.time) else {
            continue;
        };
        let acc = bins
            .entry(t.floor() as i64)
            .or_default()
            .cn0
            .entry((r.sat, r.band))
            .or_default();
        acc.0 += r.cn0_dbhz;
        acc.1 += 1;
    }
    let first = *bins.keys().next()?;
    let epochs: Vec<LogEpoch> = bins
        .into_iter()
        .map(|(k, b)| LogEpoch {
            t_s: (k - first) as f64,
            agc: (b.agc.1 > 0).then(|| b.agc.0 / b.agc.1 as f64),
            jam_ind: b.jam,
            cn0: b
                .cn0
                .into_iter()
                .map(|((sat, band), (s, n))| SatCn0 {
                    sat,
                    band: band.to_string(),
                    cn0_dbhz: s / n as f64,
                })
                .collect(),
            ..LogEpoch::default()
        })
        .collect();
    Some((timeline_from(epochs, 0), first as f64))
}

/// UTC time (s) of the first epoch of a timeline whose epochs carry ISO-8601 UTC labels (the
/// UBX reader's NAV-PVT labels): the first labelled epoch's time minus its `t_s`.
pub fn timeline_origin_utc(tl: &Timeline) -> Option<f64> {
    tl.epochs.iter().find_map(|e| {
        let l = e.time_label.as_deref()?;
        if l.starts_with("GPS") {
            return None;
        }
        utc_seconds(l).map(|t| t - e.t_s)
    })
}

/// Labelled post-calibration samples of one monitor run.
pub fn samples_from(
    trust: &TrustResult,
    t0: f64,
    calibration_s: f64,
    windows: &[(f64, f64)],
    jamming_folder: bool,
) -> Vec<Sample> {
    trust
        .epochs
        .iter()
        .filter(|e| e.t_s >= calibration_s)
        .filter_map(|e| {
            let class = label(t0 + e.t_s, windows, jamming_folder)?;
            Some(Sample {
                class,
                cn0_drop: e.cn0_drop_db,
                agc_absz: e.agc_z.map(f64::abs),
                jam_ind: e.jam_ind,
            })
        })
        .collect()
}

/// Alarm counts of one rule over a set of samples.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize)]
pub struct Counts {
    /// Clean epochs.
    pub clean: usize,
    /// Clean epochs alarmed.
    pub clean_alarmed: usize,
    /// Jamming epochs.
    pub jamming: usize,
    /// Jamming epochs alarmed.
    pub jamming_alarmed: usize,
    /// Spoofing or meaconing epochs.
    pub other: usize,
    /// Spoofing or meaconing epochs alarmed.
    pub other_alarmed: usize,
}

impl Counts {
    /// Tally `samples` under the alarm rule `alarm`.
    pub fn of(samples: &[Sample], alarm: impl Fn(&Sample) -> bool) -> Self {
        let mut c = Counts::default();
        for s in samples {
            let a = alarm(s) as usize;
            match s.class {
                Class::Clean => (c.clean += 1, c.clean_alarmed += a),
                Class::Jamming => (c.jamming += 1, c.jamming_alarmed += a),
                Class::OtherAttack => (c.other += 1, c.other_alarmed += a),
            };
        }
        c
    }

    /// Add another tally.
    pub fn add(&mut self, o: &Counts) {
        self.clean += o.clean;
        self.clean_alarmed += o.clean_alarmed;
        self.jamming += o.jamming;
        self.jamming_alarmed += o.jamming_alarmed;
        self.other += o.other;
        self.other_alarmed += o.other_alarmed;
    }

    /// False-alarm probability on clean epochs (`None` without clean epochs).
    pub fn pfa(&self) -> Option<f64> {
        (self.clean > 0).then(|| self.clean_alarmed as f64 / self.clean as f64)
    }

    /// Detection probability on jamming epochs.
    pub fn pd(&self) -> Option<f64> {
        (self.jamming > 0).then(|| self.jamming_alarmed as f64 / self.jamming as f64)
    }

    /// Detection probability on spoofing or meaconing epochs.
    pub fn pd_other(&self) -> Option<f64> {
        (self.other > 0).then(|| self.other_alarmed as f64 / self.other as f64)
    }
}

/// One point of a ROC curve.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct RocPoint {
    /// Threshold.
    pub threshold: f64,
    /// Clean-epoch false-alarm probability.
    pub pfa: Option<f64>,
    /// Jamming-epoch detection probability.
    pub pd: Option<f64>,
    /// Spoofing or meaconing detection probability (reported only).
    pub pd_other: Option<f64>,
}

/// The ROC curve of one statistic over its grid.
pub fn roc(samples: &[Sample], s: Stat) -> Vec<RocPoint> {
    s.grid()
        .into_iter()
        .map(|thr| {
            let c = Counts::of(samples, |x| s.alarms(x.get(s), thr));
            RocPoint {
                threshold: thr,
                pfa: c.pfa(),
                pd: c.pd(),
                pd_other: c.pd_other(),
            }
        })
        .collect()
}

/// The selection rule: the smallest grid threshold whose pooled clean-epoch false-alarm
/// probability is at most `alpha`. `None` when no grid value meets it or there is no clean epoch.
pub fn select(samples: &[Sample], s: Stat, alpha: f64) -> Option<f64> {
    s.grid().into_iter().find(|&thr| {
        Counts::of(samples, |x| s.alarms(x.get(s), thr))
            .pfa()
            .is_some_and(|p| p <= alpha)
    })
}

/// Area under the ROC curve of jamming against clean epochs (Mann-Whitney, ties counted half;
/// an undefined statistic ranks below every value).
pub fn auc(samples: &[Sample], s: Stat) -> Option<f64> {
    let key = |x: &Sample| x.get(s).unwrap_or(f64::NEG_INFINITY);
    let mut v: Vec<(f64, bool)> = samples
        .iter()
        .filter(|x| x.class != Class::OtherAttack)
        .map(|x| (key(x), x.class == Class::Jamming))
        .collect();
    let n_pos = v.iter().filter(|x| x.1).count();
    let n_neg = v.len() - n_pos;
    if n_pos == 0 || n_neg == 0 {
        return None;
    }
    v.sort_by(|a, b| a.0.total_cmp(&b.0));
    let mut rank_sum = 0.0;
    let mut i = 0;
    while i < v.len() {
        let mut j = i;
        while j + 1 < v.len() && v[j + 1].0 == v[i].0 {
            j += 1;
        }
        let avg = (i + j) as f64 / 2.0 + 1.0;
        rank_sum += avg * v[i..=j].iter().filter(|x| x.1).count() as f64;
        i = j + 1;
    }
    let np = n_pos as f64;
    Some((rank_sum - np * (np + 1.0) / 2.0) / (np * n_neg as f64))
}

/// The three thresholds of one rule, in [`Stat::ALL`] order.
pub type Thresholds = [f64; 3];

/// The 0.35 default thresholds.
pub fn default_thresholds() -> Thresholds {
    Stat::ALL.map(Stat::default_threshold)
}

/// Counts of the union (any of the three monitors alarms) at `thr`.
pub fn union_counts(samples: &[Sample], thr: &Thresholds) -> Counts {
    Counts::of(samples, |x| {
        Stat::ALL
            .iter()
            .zip(thr)
            .any(|(s, t)| s.alarms(x.get(*s), *t))
    })
}

/// One dataset folder after the monitors ran.
#[derive(Clone, Debug, Serialize)]
pub struct Folder {
    /// Path relative to the dataset root.
    pub path: String,
    /// `attack_type` of `scenario.json`.
    pub attack_type: String,
    /// `stationary` or `dynamic` (from the folder path).
    pub rover_state: String,
    /// Whether the attack type includes jamming.
    pub jamming: bool,
    /// Attack windows, UTC seconds since 1970, after the time-zone shift.
    pub windows_utc_s: Vec<(f64, f64)>,
    /// UTC time of the log's first epoch, s since 1970.
    pub log_start_utc_s: Option<f64>,
    /// Why the folder is not used, if it is not.
    pub excluded: Option<String>,
    /// Clean, jamming and other-attack epoch counts (no alarm counted).
    pub epochs: Counts,
    /// The labelled samples (not serialised).
    #[serde(skip)]
    pub samples: Vec<Sample>,
    /// The `.ubx` file in the folder, if any.
    pub ubx: Option<PathBuf>,
}

fn find_scenarios(dir: &Path, out: &mut Vec<PathBuf>) {
    let Ok(rd) = std::fs::read_dir(dir) else {
        return;
    };
    let mut entries: Vec<_> = rd.flatten().map(|e| e.path()).collect();
    entries.sort();
    if entries.iter().any(|p| p.ends_with("scenario.json")) {
        out.push(dir.to_path_buf());
    }
    for p in entries {
        if p.is_dir() {
            find_scenarios(&p, out);
        }
    }
}

/// Run the monitors on one timeline and label its epochs; `Err` names why the folder is
/// excluded.
fn label_timeline(
    tl: &Timeline,
    t0: f64,
    windows: &[(f64, f64)],
    jamming: bool,
) -> Result<Vec<Sample>, String> {
    let cfg = MonitorConfig::default();
    if calibration_contaminated(t0, cfg.calibration_s, windows) {
        return Err(
            "calibration window less than the guard before, or inside, an attack window".into(),
        );
    }
    let trust = run_monitors(tl, None, &cfg).map_err(|e| format!("run_monitors: {e}"))?;
    Ok(samples_from(
        &trust,
        t0,
        cfg.calibration_s,
        windows,
        jamming,
    ))
}

/// Read one folder (CSV pipeline).
pub fn read_folder(root: &Path, dir: &Path) -> Folder {
    let rel = dir
        .strip_prefix(root)
        .unwrap_or(dir)
        .to_string_lossy()
        .into_owned();
    let meta: Value = std::fs::read_to_string(dir.join("scenario.json"))
        .ok()
        .and_then(|t| serde_json::from_str(&t).ok())
        .unwrap_or(Value::Null);
    let attack_type = meta
        .get("attack_type")
        .and_then(Value::as_str)
        .unwrap_or("unknown")
        .to_string();
    let jamming = attack_type.to_lowercase().contains("jamming");
    let lower = rel.to_lowercase();
    let rover_state = if lower.contains("stationary") {
        "stationary"
    } else if lower.contains("dynamic") {
        "dynamic"
    } else {
        "unknown"
    }
    .to_string();
    let windows = attack_windows(&meta);
    let ubx = std::fs::read_dir(dir).ok().and_then(|rd| {
        let mut v: Vec<PathBuf> = rd
            .flatten()
            .map(|e| e.path())
            .filter(|p| p.extension().is_some_and(|x| x == "ubx"))
            .collect();
        v.sort();
        v.into_iter().next()
    });
    let mut f = Folder {
        path: rel,
        attack_type,
        rover_state,
        jamming,
        windows_utc_s: windows.clone(),
        log_start_utc_s: None,
        excluded: None,
        epochs: Counts::default(),
        samples: Vec::new(),
        ubx,
    };
    if windows.is_empty() {
        f.excluded = Some("no attack window in attack_log".into());
        return f;
    }
    let mon = std::fs::read_to_string(dir.join("mon_rf.csv")).unwrap_or_default();
    let rnx = std::fs::read_to_string(dir.join("rinex.csv")).unwrap_or_default();
    let Some((tl, t0)) = timeline_from_csv(&mon, &rnx) else {
        f.excluded = Some("no readable epoch in mon_rf.csv or rinex.csv".into());
        return f;
    };
    f.log_start_utc_s = Some(t0);
    match label_timeline(&tl, t0, &windows, jamming) {
        Ok(s) => {
            f.epochs = Counts::of(&s, |_| false);
            f.samples = s;
        }
        Err(e) => f.excluded = Some(e),
    }
    f
}

/// The same folder through the UBX reader ([`read_ubx`]), for the reader cross-check.
pub fn read_folder_ubx(f: &Folder) -> Option<Result<Vec<Sample>, String>> {
    let path = f.ubx.as_ref()?;
    Some((|| {
        let bytes = std::fs::read(path).map_err(|e| format!("read: {e}"))?;
        let tl = read_ubx(&bytes);
        let t0 = timeline_origin_utc(&tl).ok_or("no UTC-labelled epoch in the UBX log")?;
        label_timeline(&tl, t0, &f.windows_utc_s, f.jamming)
    })())
}

/// One statistic's results.
#[derive(Clone, Debug, Serialize)]
pub struct StatReport {
    /// The statistic.
    pub stat: Stat,
    /// The [`MonitorConfig`] field.
    pub config_field: &'static str,
    /// The 0.35 default threshold.
    pub default_threshold: f64,
    /// Counts at the default threshold, all evaluable folders.
    pub at_default: Counts,
    /// Area under the ROC curve (jamming against clean), all evaluable folders.
    pub auc: Option<f64>,
    /// The selection on all evaluable folders: the shipped threshold (`None`: not calibrated).
    pub selected: Option<f64>,
    /// Counts at the selected threshold, all evaluable folders (in-sample).
    pub at_selected: Option<Counts>,
    /// Leave-one-folder-out: the threshold chosen without each folder, by folder path.
    pub loso_thresholds: BTreeMap<String, Option<f64>>,
    /// Leave-one-folder-out held-out counts, pooled.
    pub loso_heldout: Counts,
    /// Per rover state: counts at the default and at the selected threshold.
    pub by_state: BTreeMap<String, (Counts, Option<Counts>)>,
    /// The ROC curve over the grid.
    pub roc: Vec<RocPoint>,
}

/// One bar's outcome.
#[derive(Clone, Debug, Serialize)]
pub struct Bar {
    /// Bar id and statement.
    pub bar: String,
    /// The measured value(s).
    pub measured: String,
    /// Whether it holds.
    pub pass: bool,
}

/// The reader cross-check of one folder (UBX against CSV).
#[derive(Clone, Debug, Serialize)]
pub struct UbxCheck {
    /// Folder path.
    pub path: String,
    /// The UBX pipeline's error, if it failed.
    pub error: Option<String>,
    /// CSV counts of the union at the default thresholds.
    pub csv_default: Counts,
    /// UBX counts of the union at the default thresholds.
    pub ubx_default: Option<Counts>,
    /// CSV counts of the union at the calibrated thresholds.
    pub csv_calibrated: Counts,
    /// UBX counts of the union at the calibrated thresholds.
    pub ubx_calibrated: Option<Counts>,
}

/// The whole calibration.
#[derive(Clone, Debug, Serialize)]
pub struct CalibrationReport {
    /// Schema tag.
    pub schema: &'static str,
    /// The dataset.
    pub dataset: &'static str,
    /// Fixed method constants.
    pub method: BTreeMap<&'static str, f64>,
    /// Every folder.
    pub folders: Vec<Folder>,
    /// Evaluable folders with a jamming attack.
    pub n_jamming_folders: usize,
    /// Per statistic.
    pub stats: Vec<StatReport>,
    /// The shipped thresholds (a statistic that was not calibrated keeps its default).
    pub calibrated: Thresholds,
    /// Union at the default thresholds, all evaluable folders.
    pub union_default: Counts,
    /// Union at the calibrated thresholds, all evaluable folders (in-sample).
    pub union_calibrated: Counts,
    /// Union, leave-one-folder-out held-out counts, pooled.
    pub union_loso_heldout: Counts,
    /// The pre-registered bars.
    pub bars: Vec<Bar>,
    /// Whether the minimum data held.
    pub minimum_data: bool,
    /// VALIDATED only if every bar and the minimum data hold.
    pub verdict: &'static str,
    /// The UBX reader cross-check (descriptive).
    pub ubx_check: Vec<UbxCheck>,
}

fn pooled(folders: &[&Folder]) -> Vec<Sample> {
    folders
        .iter()
        .flat_map(|f| f.samples.iter().copied())
        .collect()
}

fn fmt_p(p: Option<f64>) -> String {
    p.map_or("n/a".into(), |p| format!("{p:.4}"))
}

/// Run the pre-registered calibration on an extracted JammerTest 2024 dataset root.
/// `with_ubx` also runs the UBX reader cross-check (slower: reads every `.ubx`).
pub fn run_dataset(root: &Path, with_ubx: bool) -> Result<CalibrationReport, String> {
    let mut dirs = Vec::new();
    find_scenarios(root, &mut dirs);
    if dirs.is_empty() {
        return Err(format!("no scenario.json under {}", root.display()));
    }
    let folders: Vec<Folder> = dirs.iter().map(|d| read_folder(root, d)).collect();
    let ev: Vec<&Folder> = folders.iter().filter(|f| f.excluded.is_none()).collect();
    let all = pooled(&ev);
    let n_jamming_folders = ev
        .iter()
        .filter(|f| f.jamming && f.epochs.jamming > 0)
        .count();

    let mut stats = Vec::new();
    let mut calibrated = default_thresholds();
    let mut loso_thr: BTreeMap<String, Thresholds> = BTreeMap::new();
    for (k, s) in Stat::ALL.into_iter().enumerate() {
        let selected = select(&all, s, ALPHA);
        if let Some(t) = selected {
            calibrated[k] = t;
        }
        let mut loso_thresholds = BTreeMap::new();
        let mut loso_heldout = Counts::default();
        for (i, f) in ev.iter().enumerate() {
            let others: Vec<&Folder> = ev
                .iter()
                .enumerate()
                .filter(|(j, _)| *j != i)
                .map(|(_, g)| *g)
                .collect();
            let t = select(&pooled(&others), s, ALPHA);
            loso_thresholds.insert(f.path.clone(), t);
            let thr = t.unwrap_or_else(|| s.default_threshold());
            loso_thr
                .entry(f.path.clone())
                .or_insert_with(default_thresholds)[k] = thr;
            loso_heldout.add(&Counts::of(&f.samples, |x| s.alarms(x.get(s), thr)));
        }
        let mut by_state = BTreeMap::new();
        for st in ["stationary", "dynamic"] {
            let sub = pooled(
                &ev.iter()
                    .filter(|f| f.rover_state == st)
                    .copied()
                    .collect::<Vec<_>>(),
            );
            let d = Counts::of(&sub, |x| s.alarms(x.get(s), s.default_threshold()));
            let c = selected.map(|t| Counts::of(&sub, |x| s.alarms(x.get(s), t)));
            by_state.insert(st.to_string(), (d, c));
        }
        stats.push(StatReport {
            stat: s,
            config_field: s.config_field(),
            default_threshold: s.default_threshold(),
            at_default: Counts::of(&all, |x| s.alarms(x.get(s), s.default_threshold())),
            auc: auc(&all, s),
            selected,
            at_selected: selected.map(|t| Counts::of(&all, |x| s.alarms(x.get(s), t))),
            loso_thresholds,
            loso_heldout,
            by_state,
            roc: roc(&all, s),
        });
    }
    let mut union_loso_heldout = Counts::default();
    for f in &ev {
        union_loso_heldout.add(&union_counts(&f.samples, &loso_thr[&f.path]));
    }

    let mut bars = Vec::new();
    for r in &stats {
        let p = r.loso_heldout.pfa();
        bars.push(Bar {
            bar: format!(
                "B1 {}: held-out clean Pfa <= {B1_MAX_PFA} (calibrated: {})",
                r.config_field,
                r.selected.is_some()
            ),
            measured: format!(
                "Pfa {} ({}/{})",
                fmt_p(p),
                r.loso_heldout.clean_alarmed,
                r.loso_heldout.clean
            ),
            pass: r.selected.is_some() && p.is_some_and(|p| p <= B1_MAX_PFA),
        });
    }
    let (up, ud) = (union_loso_heldout.pfa(), union_loso_heldout.pd());
    bars.push(Bar {
        bar: format!("B2 union: held-out clean Pfa <= {B2_MAX_PFA} and jamming Pd >= {B2_MIN_PD}"),
        measured: format!(
            "Pfa {} ({}/{}), Pd {} ({}/{})",
            fmt_p(up),
            union_loso_heldout.clean_alarmed,
            union_loso_heldout.clean,
            fmt_p(ud),
            union_loso_heldout.jamming_alarmed,
            union_loso_heldout.jamming
        ),
        pass: up.is_some_and(|p| p <= B2_MAX_PFA) && ud.is_some_and(|p| p >= B2_MIN_PD),
    });
    let n_clean = all.iter().filter(|s| s.class == Class::Clean).count();
    let minimum_data = n_jamming_folders >= MIN_JAMMING_FOLDERS && n_clean >= MIN_CLEAN_EPOCHS;
    let verdict = if !minimum_data {
        "MODELLED (insufficient data)"
    } else if bars.iter().all(|b| b.pass) {
        "VALIDATED"
    } else {
        "MODELLED (a pre-registered bar failed)"
    };

    let mut ubx_check = Vec::new();
    if with_ubx {
        for f in &ev {
            let Some(r) = read_folder_ubx(f) else {
                continue;
            };
            let dflt = default_thresholds();
            let (error, ubx_default, ubx_calibrated) = match r {
                Ok(s) => (
                    None,
                    Some(union_counts(&s, &dflt)),
                    Some(union_counts(&s, &calibrated)),
                ),
                Err(e) => (Some(e), None, None),
            };
            ubx_check.push(UbxCheck {
                path: f.path.clone(),
                error,
                csv_default: union_counts(&f.samples, &dflt),
                ubx_default,
                csv_calibrated: union_counts(&f.samples, &calibrated),
                ubx_calibrated,
            });
        }
    }

    let method = BTreeMap::from([
        ("tz_shift_s", TZ_SHIFT_S),
        ("guard_s", GUARD_S),
        ("alpha", ALPHA),
        ("b1_max_pfa", B1_MAX_PFA),
        ("b2_max_pfa", B2_MAX_PFA),
        ("b2_min_pd", B2_MIN_PD),
        ("calibration_s", MonitorConfig::default().calibration_s),
    ]);
    Ok(CalibrationReport {
        schema: "kshana-receiver-trust-jammertest-calibration/1",
        dataset:
            "GNSS Dataset Under Jamming, Spoofing, and Meaconing Conditions (JammerTest 2024), \
                  Zenodo record 15911589, doi:10.5281/zenodo.15910563, GPL-3.0-or-later",
        method,
        union_default: union_counts(&all, &default_thresholds()),
        union_calibrated: union_counts(&all, &calibrated),
        folders,
        n_jamming_folders,
        stats,
        calibrated,
        union_loso_heldout,
        bars,
        minimum_data,
        verdict,
        ubx_check,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn s(class: Class, v: f64) -> Sample {
        Sample {
            class,
            cn0_drop: Some(v),
            agc_absz: Some(v),
            jam_ind: Some(v),
        }
    }

    #[test]
    fn utc_seconds_reads_both_stamp_styles() {
        let a = utc_seconds("2024-09-10 13:57:53.600000").unwrap();
        let b = utc_seconds("2024-09-10T13:57:53.600Z").unwrap();
        assert!((a - b).abs() < 1e-9);
        assert_eq!(utc_seconds("1970-01-02T00:00:01Z").unwrap(), 86_401.0);
        assert!(utc_seconds("GPS week 2331 TOW 1.000 s").is_none());
    }

    #[test]
    fn attack_windows_pair_start_and_end_and_shift_to_utc() {
        let meta: Value = serde_json::from_str(
            r#"{"attack_log":[
                {"timestamp_utc":"2024-09-10T16:00:00Z","event":"Jamming started"},
                {"timestamp_utc":"2024-09-10T16:40:00Z","event":"Jamming end"},
                {"timestamp_utc":"2024-09-10T17:00:00Z","event":"Meaconing started"},
                {"timestamp_utc":"2024-09-10T17:10:00Z","event":"Meaconing ended"}]}"#,
        )
        .unwrap();
        let w = attack_windows(&meta);
        let t = utc_seconds("2024-09-10T14:00:00Z").unwrap();
        assert_eq!(w.len(), 2);
        assert_eq!(w[0], (t, t + 2400.0));
        assert_eq!(w[1], (t + 3600.0, t + 4200.0));
    }

    #[test]
    fn labels_respect_the_guard_band_and_the_folder_class() {
        let w = [(1000.0, 2000.0)];
        assert_eq!(label(939.0, &w, true), Some(Class::Clean));
        assert_eq!(label(941.0, &w, true), None);
        assert_eq!(label(1060.0, &w, true), Some(Class::Jamming));
        assert_eq!(label(1500.0, &w, false), Some(Class::OtherAttack));
        assert_eq!(label(1950.0, &w, true), None);
        assert_eq!(label(2061.0, &w, true), Some(Class::Clean));
        assert!(calibration_contaminated(900.0, 60.0, &w));
        assert!(calibration_contaminated(1500.0, 60.0, &w));
        assert!(!calibration_contaminated(870.0, 60.0, &w));
        assert!(!calibration_contaminated(2000.0, 60.0, &w));
    }

    #[test]
    fn roc_selection_and_auc_on_a_hand_built_set() {
        // 100 clean epochs at 0..99 (statistic = index / 10), 10 jamming epochs at 20.
        let mut v: Vec<Sample> = (0..100).map(|i| s(Class::Clean, i as f64 / 10.0)).collect();
        v.extend((0..10).map(|_| s(Class::Jamming, 20.0)));
        // C/N0 rule is >=: at 9.5 one clean epoch (9.9 > 9.5... 9.5..9.9 = 5) alarms.
        let c = Counts::of(&v, |x| Stat::Cn0Drop.alarms(x.cn0_drop, 9.5));
        assert_eq!((c.clean_alarmed, c.jamming_alarmed), (5, 10));
        // Smallest grid value with Pfa <= 0.01: >= 9.9 needs thr in (9.8, 9.9]; grid 0.5 steps
        // gives 10.0 (Pfa 0).
        assert_eq!(select(&v, Stat::Cn0Drop, 0.01), Some(10.0));
        // jamInd rule is >: thr 9 leaves 9.1..9.9 = 9 alarms; thr 9 Pfa 0.09; thr 10 Pfa 0.
        assert_eq!(select(&v, Stat::JamInd, 0.01), Some(10.0));
        assert_eq!(auc(&v, Stat::Agc), Some(1.0));
        let r = roc(&v, Stat::Cn0Drop);
        assert_eq!(r.len(), 60);
        assert!(r
            .windows(2)
            .all(|p| p[1].pfa <= p[0].pfa && p[1].pd <= p[0].pd));
    }

    #[test]
    fn undefined_statistics_never_alarm_and_rank_lowest() {
        let none = Sample {
            class: Class::Jamming,
            cn0_drop: None,
            agc_absz: None,
            jam_ind: None,
        };
        assert!(!Stat::Cn0Drop.alarms(None, 0.0));
        let v = vec![none, s(Class::Clean, 1.0)];
        assert_eq!(auc(&v, Stat::Cn0Drop), Some(0.0));
    }

    #[test]
    fn csv_timeline_bins_by_second_and_feeds_the_monitors() {
        let mut mon = String::from("identity,real_time,agcCnt_01,agcCnt_02,jamInd_01,jamInd_02\n");
        let mut rnx = String::from("time,satellite,snr_L1,snr_L2\n");
        for t in 0..200 {
            let (hh, mm, ss) = (10 + t / 3600, t / 60 % 60, t % 60);
            let jam = if t >= 150 { 200 } else { 10 };
            mon.push_str(&format!(
                "MON-RF,2024-09-10 {hh:02}:{mm:02}:{ss:02}.600000,5000,4000,{jam},5\n"
            ));
            for sat in ["G01", "G02", "E03", "E04"] {
                let c = if t >= 150 { 30.0 } else { 45.0 };
                rnx.push_str(&format!(
                    "2024-09-10 {hh:02}:{mm:02}:{ss:02}.0,{sat},{c},{}\n",
                    c - 3.0
                ));
            }
        }
        let (tl, t0) = timeline_from_csv(&mon, &rnx).unwrap();
        assert_eq!(tl.epochs.len(), 200);
        assert_eq!(t0, utc_seconds("2024-09-10 10:00:00").unwrap());
        assert_eq!(tl.epochs[0].agc, Some(4500.0));
        assert_eq!(tl.epochs[0].cn0.len(), 8);
        let trust = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let w = [(t0 + 140.0, t0 + 400.0)];
        let samples = samples_from(&trust, t0, 60.0, &w, true);
        // Clean: 60..79 (t < 140 - 60); jamming: 200 + ... none (t <= 199 < 140 + 60); so only
        // clean samples, none alarmed.
        assert_eq!(samples.len(), 20);
        assert!(samples.iter().all(|s| s.class == Class::Clean));
        let last = trust.epochs.last().unwrap();
        assert_eq!(last.jam_ind, Some(200.0));
        assert!((last.cn0_drop_db.unwrap() - 15.0).abs() < 1e-9);
    }
}
