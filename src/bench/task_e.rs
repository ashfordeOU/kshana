// SPDX-License-Identifier: AGPL-3.0-only
//! kshana-bench task (e): four-class labelling of interference (`nominal`, `jamming`, `spoofing`,
//! `meaconing`) on the JammerTest 2024 receiver logs, with its truth, scorer and the open-core
//! baseline B-log (B4a, `docs/design/evidence/b4a-benchmark-classes/PREREGISTRATION.md`; the readings
//! fixed before this code are `xval/bench-e/README.md`, cited below as R1 to R15).
//!
//! The scorer is checked against an independent numpy script (`xval/bench-e/oracle.py`, bar E1).
//! Every score is MODELLED: the truth is the scheduled attack slots of the campaign's event logs.

use std::collections::{BTreeMap, BTreeSet};
use std::path::Path;

use serde_json::{json, Map, Value};

use super::{err, sha256_hex, BenchError, Split, PREDICTIONS_SCHEMA, TRUTH_SCHEMA};
use crate::impairment_eval::auc;
use crate::receiver_trust::calibration::{
    attack_windows, calibration_contaminated, find_scenarios, label, timeline_from_csv,
    utc_seconds, Class,
};
use crate::receiver_trust::monitors::{run_monitors, EpochTrust, Monitor, MonitorConfig};
use crate::receiver_trust::{ReportedFix, Timeline};

/// The specification version of task (e) (task (e) was added in 2.1.0; tasks a to d keep 2.0.0).
pub const SPEC_VERSION_E: &str = "kshana-bench/2.1.0";
/// The four classes, in the order of every matrix and of the event-level tie-break (R12).
pub const CLASSES: [&str; 4] = ["nominal", "jamming", "spoofing", "meaconing"];
/// Fewest folders contributing a class for it to enter BA, macro-F1 and the bars (R6).
pub const MIN_FOLDERS: usize = 2;
/// Fewest units of a class for it to enter (R6).
pub const MIN_UNITS: usize = 300;
/// Fewest events of `meaconing` for it to enter (sign-off of 3 November 2026).
pub const MIN_MEACONING_EVENTS: usize = 20;
/// A score that ranks below every real value (R11).
pub const UNDEFINED: f64 = -1.0e300;
/// Largest clock-step change still read as one constant delay, ns (section 4, meaconing branch).
const MEACONING_STEP_NS: f64 = 1000.0;

fn class_index(c: &str) -> Option<usize> {
    CLASSES.iter().position(|x| *x == c)
}

/// The class of an attack window from the folder's `attack_type` (R2).
pub fn window_class(attack_type: &str) -> &'static str {
    let a = attack_type.to_lowercase();
    if a.contains("meaconing") {
        "meaconing"
    } else if a.contains("spoofing") {
        "spoofing"
    } else if a.contains("jamming") {
        "jamming"
    } else {
        "nominal"
    }
}

/// The split of each folder: the `bench/SPEC.md` section 4 rule within each class stratum (R4).
pub fn assign_splits_by_class(folders: &[(String, &'static str)]) -> BTreeMap<String, Split> {
    let mut out = BTreeMap::new();
    for stratum in CLASSES {
        let mut v: Vec<(String, &str)> = folders
            .iter()
            .filter(|(_, c)| *c == stratum)
            .map(|(p, _)| (sha256_hex(p.as_bytes()), p.as_str()))
            .collect();
        v.sort();
        let n = v.len();
        let q = ((n + 2) / 4).max(1);
        for (i, (_, p)) in v.iter().enumerate() {
            let s = if i < q {
                Split::Holdout
            } else if i < 2 * q {
                Split::Test
            } else {
                Split::Dev
            };
            out.insert((*p).to_string(), s);
        }
    }
    out
}

/// Reported fixes from a `nav_pvt.csv`, keyed by UTC second (R3): `fixType` 2 to 4, `lat` and
/// `lon` in units of 1e-7 degree (so degrees are the value times 1e7), the last row of a second.
pub fn fixes_from_nav_pvt(csv: &str) -> BTreeMap<i64, ReportedFix> {
    let mut out = BTreeMap::new();
    let mut lines = csv.lines();
    let Some(head) = lines.next() else {
        return out;
    };
    let cols: Vec<&str> = head.split(',').map(str::trim).collect();
    let at = |n: &str| cols.iter().position(|c| *c == n);
    let (Some(it), Some(ift), Some(ila), Some(ilo)) =
        (at("real_time"), at("fixType"), at("lat"), at("lon"))
    else {
        return out;
    };
    let ih = at("height");
    let inum = at("numSV");
    for line in lines {
        let f: Vec<&str> = line.split(',').collect();
        let num = |i: usize| f.get(i).and_then(|s| s.trim().parse::<f64>().ok());
        let Some(t) = f.get(it).and_then(|s| utc_seconds(s)) else {
            continue;
        };
        let Some(ft) = num(ift) else { continue };
        if !(2.0..=4.0).contains(&ft) {
            continue;
        }
        let (Some(la), Some(lo)) = (num(ila), num(ilo)) else {
            continue;
        };
        let (lat, lon) = (la * 1e7, lo * 1e7);
        if lat.abs() > 90.0 || lon.abs() > 180.0 {
            continue;
        }
        out.insert(
            t.floor() as i64,
            ReportedFix {
                lat_deg: lat,
                lon_deg: lon,
                height_m: ih.and_then(num).unwrap_or(0.0),
                n_used: inum.and_then(num).map(|n| n as u32),
            },
        );
    }
    out
}

/// One labelled unit of task (e) with what B-log needs.
#[derive(Clone, Debug)]
pub struct EUnit {
    /// `<folder>#<n>` (R1).
    pub id: String,
    /// True class (R2).
    pub class: &'static str,
    /// The attack window the unit is in, `<folder>@<k>`, for the event level.
    pub event: Option<String>,
    /// Monitor output of the primary run (PositionJump on stationary folders only, R9).
    pub trust: EpochTrust,
    /// Monitor output with PositionJump on every folder (the descriptive variant).
    pub trust_pj_all: EpochTrust,
    /// Median tracked count of the calibration window.
    pub tracked_median: Option<f64>,
}

/// One evaluable folder.
#[derive(Clone, Debug)]
pub struct EFolder {
    /// Path relative to the dataset root, `/`-separated.
    pub path: String,
    /// The class of its windows (its stratum).
    pub stratum: &'static str,
    /// `stationary`, `dynamic` or `unknown`.
    pub rover_state: &'static str,
    /// Units per class, in [`CLASSES`] order.
    pub units: [usize; 4],
    /// Post-calibration epochs dropped in a guard band.
    pub guard_excluded: usize,
    /// Units inside a window of a folder whose attack type names spoofing and jamming.
    pub mixed_spoofing_jamming: usize,
    /// Number of attack windows.
    pub windows: usize,
}

/// The truth of task (e) over the evaluable folders.
pub struct ETruth {
    /// Units, sorted by id.
    pub units: Vec<EUnit>,
    /// Evaluable folders, sorted by path.
    pub folders: Vec<EFolder>,
    /// Excluded folders and why.
    pub excluded: Vec<(String, String)>,
    /// The split of each evaluable folder.
    pub split_of: BTreeMap<String, Split>,
}

fn rel_path(root: &Path, dir: &Path) -> String {
    let rel = dir.strip_prefix(root).unwrap_or(dir);
    rel.components()
        .map(|c| c.as_os_str().to_string_lossy().into_owned())
        .collect::<Vec<_>>()
        .join("/")
}

fn with_fixes(tl: &Timeline, first: f64, fixes: &BTreeMap<i64, ReportedFix>) -> Timeline {
    let mut epochs = tl.epochs.clone();
    for e in &mut epochs {
        let key = first as i64 + e.t_s.round() as i64;
        if let Some(f) = fixes.get(&key) {
            e.fix = Some(*f);
        }
    }
    crate::receiver_trust::ingest::timeline_from(epochs, tl.skipped_records)
}

/// Read the extracted dataset at `root`: every folder, the evaluable ones labelled (R1 to R4).
pub fn e_load(root: &Path) -> Result<ETruth, BenchError> {
    let mut dirs = Vec::new();
    find_scenarios(root, &mut dirs);
    if dirs.is_empty() {
        return err(crate::t!(
            "bench-cli-no-scenario-json-under",
            root = root.display()
        ));
    }
    let cfg = MonitorConfig::default();
    let mut units = Vec::new();
    let mut folders = Vec::new();
    let mut excluded = Vec::new();
    for dir in &dirs {
        let path = rel_path(root, dir);
        let meta: Value = std::fs::read_to_string(dir.join("scenario.json"))
            .ok()
            .and_then(|t| serde_json::from_str(&t).ok())
            .unwrap_or(Value::Null);
        let attack_type = meta
            .get("attack_type")
            .and_then(Value::as_str)
            .unwrap_or("unknown");
        let stratum = window_class(attack_type);
        let mixed = {
            let a = attack_type.to_lowercase();
            a.contains("spoofing") && a.contains("jamming")
        };
        let lower = path.to_lowercase();
        let rover_state = if lower.contains("stationary") {
            "stationary"
        } else if lower.contains("dynamic") {
            "dynamic"
        } else {
            "unknown"
        };
        let windows = attack_windows(&meta);
        if windows.is_empty() || stratum == "nominal" {
            excluded.push((path, "no attack window in attack_log".to_string()));
            continue;
        }
        let mon = std::fs::read_to_string(dir.join("mon_rf.csv")).unwrap_or_default();
        let rnx = std::fs::read_to_string(dir.join("rinex.csv")).unwrap_or_default();
        let Some((tl, t0)) = timeline_from_csv(&mon, &rnx) else {
            excluded.push((path, "no readable epoch in mon_rf.csv or rinex.csv".into()));
            continue;
        };
        if calibration_contaminated(t0, cfg.calibration_s, &windows) {
            excluded.push((
                path,
                "calibration window less than the 60 s guard before, or inside, an attack window"
                    .into(),
            ));
            continue;
        }
        let pvt = std::fs::read_to_string(dir.join("nav_pvt.csv")).unwrap_or_default();
        let fixes = fixes_from_nav_pvt(&pvt);
        let tl_all = with_fixes(&tl, t0, &fixes);
        let tl_primary = if rover_state == "stationary" {
            tl_all.clone()
        } else {
            tl.clone()
        };
        let (Ok(primary), Ok(pj_all)) = (
            run_monitors(&tl_primary, None, &cfg),
            run_monitors(&tl_all, None, &cfg),
        ) else {
            excluded.push((path, "run_monitors failed".into()));
            continue;
        };
        let mut f = EFolder {
            path: path.clone(),
            stratum,
            rover_state,
            units: [0; 4],
            guard_excluded: 0,
            mixed_spoofing_jamming: 0,
            windows: windows.len(),
        };
        let mut n = 0usize;
        for (k, e) in primary.epochs.iter().enumerate() {
            if e.t_s < cfg.calibration_s {
                continue;
            }
            let t = t0 + e.t_s;
            let Some(c) = label(t, &windows, true) else {
                f.guard_excluded += 1;
                continue;
            };
            let (class, event) = match c {
                Class::Clean => ("nominal", None),
                _ => {
                    let w = windows
                        .iter()
                        .position(|&(s, e2)| t >= s && t <= e2)
                        .unwrap_or(0);
                    if mixed {
                        f.mixed_spoofing_jamming += 1;
                    }
                    (stratum, Some(format!("{path}@{w}")))
                }
            };
            f.units[class_index(class).unwrap_or(0)] += 1;
            units.push(EUnit {
                id: format!("{path}#{n}"),
                class,
                event,
                trust: e.clone(),
                trust_pj_all: pj_all.epochs.get(k).cloned().unwrap_or_else(|| e.clone()),
                tracked_median: primary.baseline.tracked_median,
            });
            n += 1;
        }
        folders.push(f);
    }
    units.sort_by(|a, b| a.id.cmp(&b.id));
    folders.sort_by(|a, b| a.path.cmp(&b.path));
    excluded.sort();
    let split_of = assign_splits_by_class(
        &folders
            .iter()
            .map(|f| (f.path.clone(), f.stratum))
            .collect::<Vec<_>>(),
    );
    Ok(ETruth {
        units,
        folders,
        excluded,
        split_of,
    })
}

fn folder_of(id: &str) -> &str {
    id.rsplit_once('#').map_or(id, |(f, _)| f)
}

impl ETruth {
    /// The units of one split.
    pub fn units_in(&self, split: Split) -> impl Iterator<Item = &EUnit> {
        self.units
            .iter()
            .filter(move |u| self.split_of.get(folder_of(&u.id)) == Some(&split))
    }
}

/// The truth file of one split (R14): compact JSON, keys sorted, ending in a newline.
pub fn e_truth_text(t: &ETruth, split: Split) -> String {
    let labels: Vec<Value> = t
        .units_in(split)
        .map(|u| {
            let mut m = Map::new();
            m.insert("id".into(), json!(u.id));
            m.insert("class".into(), json!(u.class));
            if let Some(e) = &u.event {
                m.insert("event".into(), json!(e));
            }
            Value::Object(m)
        })
        .collect();
    let in_split: Vec<&EFolder> = t
        .folders
        .iter()
        .filter(|f| t.split_of.get(&f.path) == Some(&split))
        .collect();
    let mut events = Map::new();
    for c in CLASSES {
        let n: usize = in_split
            .iter()
            .filter(|f| f.stratum == c)
            .map(|f| f.windows)
            .sum();
        events.insert(c.into(), json!(n));
    }
    let folders: Vec<Value> = in_split
        .iter()
        .map(|f| {
            json!({
                "path": f.path,
                "stratum": f.stratum,
                "rover_state": f.rover_state,
                "units": {"nominal": f.units[0], "jamming": f.units[1], "spoofing": f.units[2], "meaconing": f.units[3]},
                "guard_excluded": f.guard_excluded,
                "mixed_spoofing_jamming": f.mixed_spoofing_jamming,
                "windows": f.windows,
            })
        })
        .collect();
    let doc = json!({
        "schema": TRUTH_SCHEMA,
        "task": "e",
        "split": split.name(),
        "spec_version": SPEC_VERSION_E,
        "labels": labels,
        "events_per_class": events,
        "folders": folders,
        "excluded_folders": t.excluded.iter().map(|(p, w)| json!({"path": p, "why": w})).collect::<Vec<_>>(),
    });
    format!("{}\n", serde_json::to_string(&doc).unwrap_or_default())
}

/// Which B-log variant: the primary (PositionJump on stationary folders) or every folder.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum BLogVariant {
    /// R9 primary.
    Primary,
    /// R9 descriptive variant.
    PositionJumpEverywhere,
}

/// The B-log label of one epoch (R10). `prev_clock_ns` is the previous epoch's clock innovation.
pub fn b_log_label(e: &EpochTrust, prev_clock_ns: Option<f64>) -> &'static str {
    let a = &e.alarms;
    if a.is_empty() {
        return "nominal";
    }
    let is_m = |m: &Monitor| {
        matches!(
            m,
            Monitor::Cn0Drop | Monitor::Agc | Monitor::JamInd | Monitor::LossOfLock
        )
    };
    let is_f = |m: &Monitor| {
        matches!(
            m,
            Monitor::Raim | Monitor::Clock | Monitor::PositionJump | Monitor::SolveFailure
        )
    };
    let any_f = a.iter().any(is_f);
    if !any_f && a.iter().all(is_m) {
        return "jamming";
    }
    let pj = a.contains(&Monitor::PositionJump);
    if a.contains(&Monitor::Clock) && !pj {
        if let (Some(now), Some(prev)) = (e.clock_innov_ns, prev_clock_ns) {
            if (now - prev).abs() <= MEACONING_STEP_NS {
                return "meaconing";
            }
        }
    }
    if any_f && !a.contains(&Monitor::Agc) {
        return "spoofing";
    }
    "jamming"
}

/// The B-log class scores of one epoch (R11), in [`CLASSES`] order.
pub fn b_log_scores(e: &EpochTrust, tracked_median: Option<f64>) -> [f64; 4] {
    let cfg = MonitorConfig::default();
    let lost = tracked_median.map(|m| (m - e.n_sats as f64) / cfg.sats_lost as f64);
    let jam: Vec<f64> = [
        e.cn0_drop_db.map(|x| x / cfg.cn0_drop_db),
        e.agc_z.map(|x| x.abs() / cfg.agc_k_sigma),
        e.jam_ind.map(|x| x / cfg.jam_ind_threshold),
        lost,
    ]
    .into_iter()
    .flatten()
    .collect();
    let spo: Vec<f64> = e
        .position_offset_m
        .map(|x| x / cfg.position_jump_m)
        .into_iter()
        .collect();
    let max = |v: &[f64]| {
        v.iter()
            .copied()
            .fold(None, |m: Option<f64>, x| Some(m.map_or(x, |m| m.max(x))))
    };
    let j = max(&jam);
    let s = max(&spo);
    let all: Vec<f64> = jam.iter().chain(spo.iter()).copied().collect();
    [
        max(&all).map_or(UNDEFINED, |x| -x),
        j.unwrap_or(UNDEFINED),
        s.unwrap_or(UNDEFINED),
        UNDEFINED,
    ]
}

/// The B-log predictions document of one split.
pub fn b_log_predictions(t: &ETruth, split: Split, variant: BLogVariant) -> Value {
    let mut labels = Map::new();
    let mut scores = Map::new();
    let mut prev: Option<(String, Option<f64>)> = None;
    for u in t.units_in(split) {
        let e = match variant {
            BLogVariant::Primary => &u.trust,
            BLogVariant::PositionJumpEverywhere => &u.trust_pj_all,
        };
        let folder = folder_of(&u.id).to_string();
        let pc = match &prev {
            Some((f, c)) if *f == folder => *c,
            _ => None,
        };
        labels.insert(u.id.clone(), json!(b_log_label(e, pc)));
        let s = b_log_scores(e, u.tracked_median);
        scores.insert(
            u.id.clone(),
            json!({"nominal": s[0], "jamming": s[1], "spoofing": s[2], "meaconing": s[3]}),
        );
        prev = Some((folder, e.clock_innov_ns));
    }
    let name = match variant {
        BLogVariant::Primary => "B-log: kshana receiver-trust monitors at the 0.35 defaults, class rule of B4a section 4 (PositionJump on stationary folders)",
        BLogVariant::PositionJumpEverywhere => "B-log (descriptive variant): as B-log with PositionJump on every folder",
    };
    json!({
        "schema": PREDICTIONS_SCHEMA,
        "task": "e",
        "split": split.name(),
        "system": {"name": name, "version": SPEC_VERSION_E},
        "labels": labels,
        "class_scores": scores,
    })
}

fn opt(x: Option<f64>) -> Value {
    x.filter(|v| v.is_finite())
        .map_or(Value::Null, |v| json!(v))
}

fn mean_over(v: &[f64]) -> Option<f64> {
    (v.len() >= 2).then(|| v.iter().sum::<f64>() / v.len() as f64)
}

/// One scored unit: id, true class, predicted class, class scores, event.
type ScoredRow = (String, usize, usize, [f64; 4], Option<String>);

/// Score task (e) (section 3 and R6, R7, R12): returns `(metrics, label)`.
pub fn score_e(truth: &Value, preds: &Value) -> Result<(Value, String), BenchError> {
    let arr = truth
        .get("labels")
        .and_then(Value::as_array)
        .ok_or_else(|| BenchError(crate::terr!("e-bench-tasks-truth-has-no-labels-array")))?;
    let plabels = preds
        .get("labels")
        .and_then(Value::as_object)
        .ok_or_else(|| BenchError(crate::terr!("e-bench-task-e-predictions-labels")))?;
    let pscores = preds
        .get("class_scores")
        .and_then(Value::as_object)
        .ok_or_else(|| BenchError(crate::terr!("e-bench-task-e-predictions-labels")))?;
    let mut rows: Vec<ScoredRow> = Vec::new();
    for l in arr {
        let id = l
            .get("id")
            .and_then(Value::as_str)
            .ok_or_else(|| BenchError(crate::terr!("e-bench-tasks-label-has-no-id")))?;
        let tc = l
            .get("class")
            .and_then(Value::as_str)
            .and_then(class_index)
            .ok_or_else(|| BenchError(crate::terr!("e-bench-task-e-bad-class", id = id)))?;
        let pc = plabels
            .get(id)
            .and_then(Value::as_str)
            .and_then(class_index)
            .ok_or_else(|| BenchError(crate::terr!("e-bench-task-e-missing-prediction", id = id)))?;
        let sc = pscores
            .get(id)
            .ok_or_else(|| BenchError(crate::terr!("e-bench-task-e-missing-prediction", id = id)))?;
        let mut s = [0.0; 4];
        for (k, c) in CLASSES.iter().enumerate() {
            s[k] = sc.get(*c).and_then(Value::as_f64).ok_or_else(|| {
                BenchError(crate::terr!("e-bench-task-e-missing-prediction", id = id))
            })?;
        }
        let ev = l.get("event").and_then(Value::as_str).map(str::to_string);
        rows.push((id.to_string(), tc, pc, s, ev));
    }
    rows.sort_by(|a, b| a.0.cmp(&b.0));
    let mut m = [[0usize; 4]; 4];
    for r in &rows {
        m[r.1][r.2] += 1;
    }
    let row: Vec<usize> = (0..4).map(|a| m[a].iter().sum()).collect();
    let col: Vec<usize> = (0..4).map(|b| (0..4).map(|a| m[a][b]).sum()).collect();
    let present: Vec<usize> = (0..4).filter(|&a| row[a] > 0).collect();
    let events = truth.get("events_per_class");
    let ev_n = |c: &str| {
        events
            .and_then(|e| e.get(c))
            .and_then(Value::as_u64)
            .unwrap_or(0) as usize
    };
    let entered: Vec<usize> = present
        .iter()
        .copied()
        .filter(|&a| {
            let fs: BTreeSet<&str> = rows
                .iter()
                .filter(|r| r.1 == a)
                .map(|r| folder_of(&r.0))
                .collect();
            let mut ok = fs.len() >= MIN_FOLDERS && row[a] >= MIN_UNITS;
            if CLASSES[a] == "meaconing" {
                ok = ok && ev_n("meaconing") >= MIN_MEACONING_EVENTS;
            }
            ok
        })
        .collect();
    let recall: Vec<Option<f64>> = (0..4)
        .map(|a| (row[a] > 0).then(|| m[a][a] as f64 / row[a] as f64))
        .collect();
    let precision: Vec<Option<f64>> = (0..4)
        .map(|b| (col[b] > 0).then(|| m[b][b] as f64 / col[b] as f64))
        .collect();
    let f1 = |a: usize| match (precision[a], recall[a]) {
        (Some(p), Some(r)) if p + r != 0.0 => 2.0 * p * r / (p + r),
        _ => 0.0,
    };
    let ba = |cs: &[usize]| {
        mean_over(
            &cs.iter()
                .map(|&a| recall[a].unwrap_or(0.0))
                .collect::<Vec<_>>(),
        )
    };
    let mf1 = |cs: &[usize]| mean_over(&cs.iter().map(|&a| f1(a)).collect::<Vec<_>>());
    let mut aucs = Map::new();
    for (k, c) in CLASSES.iter().enumerate() {
        let pos: Vec<f64> = rows.iter().filter(|r| r.1 == k).map(|r| r.3[k]).collect();
        let neg: Vec<f64> = rows.iter().filter(|r| r.1 != k).map(|r| r.3[k]).collect();
        aucs.insert((*c).into(), opt(Some(auc(&pos, &neg))));
    }
    let (j, s, me) = (1, 2, 3);
    let jam_as_sm = m[j][s] + m[j][me];
    let sm_as_jam = m[s][j] + m[me][j];
    let sm = row[s] + row[me];
    let names = |v: &[usize]| v.iter().map(|&a| CLASSES[a]).collect::<Vec<_>>();
    let by_class = |v: &[Option<f64>]| {
        let mut o = Map::new();
        for (k, c) in CLASSES.iter().enumerate() {
            o.insert((*c).into(), opt(v[k]));
        }
        Value::Object(o)
    };
    // Event level (R12): majority label per window, ties to the earliest class.
    let mut per_event: BTreeMap<&str, (usize, [usize; 4])> = BTreeMap::new();
    for r in &rows {
        if let Some(e) = &r.4 {
            let x = per_event.entry(e.as_str()).or_insert((r.1, [0; 4]));
            x.1[r.2] += 1;
        }
    }
    let mut ev_m = [[0usize; 4]; 4];
    for (tc, counts) in per_event.values() {
        let mut best = 0;
        for k in 1..4 {
            if counts[k] > counts[best] {
                best = k;
            }
        }
        ev_m[*tc][best] += 1;
    }
    let metrics = json!({
        "classes": CLASSES,
        "confusion": m,
        "present": names(&present),
        "entered": names(&entered),
        "recall": by_class(&recall),
        "precision": by_class(&precision),
        "balanced_accuracy": opt(ba(&entered)),
        "macro_f1": opt(mf1(&entered)),
        "balanced_accuracy_descriptive": opt(ba(&present)),
        "macro_f1_descriptive": opt(mf1(&present)),
        "auc": aucs,
        "jamming_labelled_spoofing_or_meaconing": opt((row[j] > 0).then(|| jam_as_sm as f64 / row[j] as f64)),
        "spoofing_meaconing_labelled_jamming": opt((sm > 0).then(|| sm_as_jam as f64 / sm as f64)),
        "event_confusion": ev_m,
        "n_events": per_event.len(),
        "n_units": rows.len(),
    });
    Ok((
        metrics,
        "MODELLED: truth is the scheduled attack slots of the JammerTest 2024 event logs at one-minute resolution, the class read from each folder's attack_type; a nominal epoch means outside the logged windows".to_string(),
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn window_class_follows_the_reading() {
        assert_eq!(window_class("Spoofing + Jamming"), "spoofing");
        assert_eq!(window_class("Meaconing"), "meaconing");
        assert_eq!(window_class("Jamming"), "jamming");
        assert_eq!(window_class("Spoofing"), "spoofing");
        assert_eq!(window_class("other"), "nominal");
    }

    #[test]
    fn splits_follow_spec_section_4_per_stratum() {
        let f: Vec<(String, &'static str)> = (0..7)
            .map(|i| (format!("s{i}"), "spoofing"))
            .chain((0..3).map(|i| (format!("j{i}"), "jamming")))
            .collect();
        let s = assign_splits_by_class(&f);
        let count = |c: &str, sp: Split| f.iter().filter(|(p, k)| *k == c && s[p] == sp).count();
        assert_eq!(
            (
                count("spoofing", Split::Holdout),
                count("spoofing", Split::Test),
                count("spoofing", Split::Dev)
            ),
            (2, 2, 3)
        );
        assert_eq!(
            (
                count("jamming", Split::Holdout),
                count("jamming", Split::Test),
                count("jamming", Split::Dev)
            ),
            (1, 1, 1)
        );
    }

    #[test]
    fn nav_pvt_scale_and_fix_type() {
        let csv = "timestamp,identity,real_time,fixType,lat,lon,height\n\
                   ,NAV-PVT,2024-09-12 10:14:27.000000,3,6.9136333e-06,1.5680540e-06,37.0\n\
                   ,NAV-PVT,2024-09-12 10:14:28.000000,0,4.4e-06,5.7e-06,0\n";
        let f = fixes_from_nav_pvt(csv);
        assert_eq!(f.len(), 1);
        let x = f.values().next().copied().unwrap_or(ReportedFix {
            lat_deg: 0.0,
            lon_deg: 0.0,
            height_m: 0.0,
            n_used: None,
        });
        assert!((x.lat_deg - 69.136333).abs() < 1e-9 && (x.lon_deg - 15.68054).abs() < 1e-9);
    }

    fn epoch(alarms: Vec<Monitor>) -> EpochTrust {
        EpochTrust {
            t_s: 100.0,
            n_sats: 10,
            cn0_mean_dbhz: None,
            cn0_drop_db: None,
            agc: None,
            agc_z: None,
            jam_ind: None,
            position_offset_m: None,
            raim_stat: None,
            raim_thr: None,
            clock_innov_ns: None,
            clock_bound_ns: None,
            marine: None,
            score: None,
            alarms,
            state: crate::receiver_trust::monitors::TrustState::Nominal,
            geometry: crate::receiver_trust::geometry::EpochGeometry::unknown(),
            self_report: None,
        }
    }

    #[test]
    fn b_log_mapping_rule() {
        use Monitor::*;
        assert_eq!(b_log_label(&epoch(vec![]), None), "nominal");
        assert_eq!(b_log_label(&epoch(vec![Cn0Drop, JamInd]), None), "jamming");
        assert_eq!(b_log_label(&epoch(vec![PositionJump]), None), "spoofing");
        assert_eq!(
            b_log_label(&epoch(vec![Cn0Drop, PositionJump]), None),
            "spoofing"
        );
        assert_eq!(
            b_log_label(&epoch(vec![Agc, PositionJump]), None),
            "jamming"
        );
        let mut c = epoch(vec![Clock]);
        c.clock_innov_ns = Some(5000.0);
        assert_eq!(b_log_label(&c, Some(4500.0)), "meaconing");
        assert_eq!(b_log_label(&c, Some(1000.0)), "spoofing");
    }
}
