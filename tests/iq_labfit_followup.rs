// SPDX-License-Identifier: AGPL-3.0-only
//! The lab-fit follow-up campaigns (`docs/design/evidence/labfit-followup/PREREGISTRATION.md`):
//! a stepped-J/S campaign S (seed 2026_1014) testing HA and HD, and a fresh ramp campaign R
//! (seed 2026_1015) testing the dwell-corrected (d). The registration was committed before this
//! file existed; nothing in it, and nothing in `docs/design/LABFIT-FROM-IQ.md` §13, changes here.
//!
//! **Synthetic only.** The machinery is that of `tests/iq_labfit_campaign.rs`, copied unchanged
//! (scenes, conditions writer, campaign builder, `recipe`, `truth_of`, the fit scenario), with
//! one addition the registration names: a recording may state its J/S as a **step** profile,
//! `js(t)` piecewise constant, written to the conditions file as `interpolation = "step"` with
//! one point per step, and imposed by the scene the same way.
//!
//! How the stepped recipe reads the registration ("from `js0` to 45 dB in 3 dB steps, each held
//! 4 s; then it holds 1 s and ends"): the levels are `js0 + 3k` for `k = 0, 1, ...` while below
//! 45 dB, then 45 dB; every level, 45 dB included, is held 4 s; then 45 dB is held 1 s more
//! (`hold_s = 1`, as in `recipe`) and the event ends, with 6 s after. Everything else is
//! `recipe(2026_1014, 6)`, its draws consumed in the same order (the drawn ramp duration is
//! unused).
//!
//! PIN-SCOPE: the recorded verdicts of bars S1, S2 and R1 (RESULTS.md beside the registration).
//! PIN-EXCLUDES: every output hash.

use kshana::iq::campaign::{run, LoadedCampaign, RunOptions};
use kshana::iq::io::inventory::{write_sidecar, RawSidecar};
use kshana::iq::io::stream::create_raw;
use kshana::iq::io::SampleFormat;
use kshana::iq::scene::{
    direct_path, CsvTruthWriter, NavData, RangeProfile, Scene, SceneConfig, SceneSatellite,
    TruthRecord,
};
use kshana::iq::{ChannelSnapshot, PathState, SampleSpec};
use kshana::jamming::effective_cn0_dbhz;
use std::path::{Path, PathBuf};

const FS: f64 = 2.5e6;
const RC: f64 = 1.023e6;
/// The scene's reference C/N0; each satellite's own baseline is set relative to it.
const SCENE_REF: f64 = 45.0;

fn scratch(name: &str) -> PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!(
        "kshana-labfit-iq-followup-{}-{uniq}-{name}",
        std::process::id()
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

/// The truth a synthetic campaign is built from.
#[derive(Clone, Copy, Debug)]
pub struct Truth {
    /// The `Q` the stated C/N0 profile is computed with.
    pub q: f64,
    /// The J/S calibration offset (dB) the profile is computed with.
    pub delta_db: f64,
}

/// One recording of a synthetic campaign: a linear J/S ramp from `js0` at the onset to `js1`
/// `ramp_s` later, held until the event's end; or, with `step`, a staircase (see [`Step`]).
#[derive(Clone, Debug)]
pub struct RecSpec {
    pub id: String,
    pub seed: u64,
    /// (PRN, Doppler Hz, baseline C/N0 dB-Hz).
    pub sats: Vec<(u8, f64, f64)>,
    pub onset_s: f64,
    pub ramp_s: f64,
    pub hold_s: f64,
    pub after_s: f64,
    pub js0_db: f64,
    pub js1_db: f64,
    /// A step profile in place of the linear ramp.
    pub step: Option<Step>,
}

/// A step profile: from `js0` at the onset, up by `step_db` every `dwell_s`, never above
/// `js1`; the last level (`js1`) is reached at `ramp_s - dwell_s` after the onset.
#[derive(Clone, Copy, Debug)]
pub struct Step {
    pub step_db: f64,
    pub dwell_s: f64,
}

impl RecSpec {
    fn offset_s(&self) -> f64 {
        self.onset_s + self.ramp_s + self.hold_s
    }
    fn duration_s(&self) -> f64 {
        self.offset_s() + self.after_s
    }
    /// The stated profile's points `(t, J/S)`: the two ends of the ramp, or one per step.
    fn points(&self) -> Vec<(f64, f64)> {
        match self.step {
            None => vec![
                (self.onset_s, self.js0_db),
                (self.onset_s + self.ramp_s, self.js1_db),
            ],
            Some(s) => {
                let n = (self.ramp_s / s.dwell_s).round() as usize;
                (0..n)
                    .map(|k| {
                        let t = self.onset_s + k as f64 * s.dwell_s;
                        (t, self.js(t))
                    })
                    .collect()
            }
        }
    }
    /// The stated J/S at `t` inside the event.
    fn js(&self, t: f64) -> f64 {
        if let Some(s) = self.step {
            let k = ((t - self.onset_s) / s.dwell_s).floor().max(0.0);
            return (self.js0_db + k * s.step_db).min(self.js1_db);
        }
        let u = ((t - self.onset_s) / self.ramp_s).clamp(0.0, 1.0);
        self.js0_db + u * (self.js1_db - self.js0_db)
    }
}

/// Write one scene: GPS L1 C/A satellites whose C/N0 follows the stated profile computed
/// from `truth` through the §3.1 formula. Returns the truth records.
fn scene(dir: &Path, r: &RecSpec, truth: Truth) -> Vec<TruthRecord> {
    let spec = SampleSpec {
        fs_hz: FS,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    };
    let mut cfg = SceneConfig::new(spec, r.duration_s());
    cfg.seed = r.seed;
    cfg.threads = 2;
    let mut sc = Scene::new(cfg).unwrap();
    let lambda = kshana::iq::C_M_PER_S / 1_575.42e6;
    for (i, &(prn, dop, _)) in r.sats.iter().enumerate() {
        let profile = RangeProfile {
            range_m: 2.0e7 + i as f64 * 3.1e5,
            range_rate_mps: -dop * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        sc.add_satellite(
            SceneSatellite::gps_l1ca_profile(prn, profile, Some(SCENE_REF), NavData::None).unwrap(),
        );
    }
    let rr = r.clone();
    sc.set_channel(Box::new(move |id: u32, t: f64| {
        let c0 = rr
            .sats
            .iter()
            .find(|s| u32::from(s.0) == id)
            .map_or(SCENE_REF, |s| s.2);
        let c = if t >= rr.onset_s && t < rr.offset_s() {
            effective_cn0_dbhz(c0, rr.js(t) + truth.delta_db, truth.q, RC)
        } else {
            c0
        };
        ChannelSnapshot {
            t_s: t,
            paths: vec![PathState {
                amplitude: 10f64.powf((c - SCENE_REF) / 20.0),
                ..direct_path()
            }],
        }
    }));
    let data = dir.join(format!("{}.cf32", r.id));
    let mut sink = create_raw(&data, SampleFormat::parse("cf32_le").unwrap()).unwrap();
    let mut tw = CsvTruthWriter::new(std::io::BufWriter::new(
        std::fs::File::create(dir.join(format!("{}.truth.csv", r.id))).unwrap(),
    ));
    let mut records: Vec<TruthRecord> = Vec::new();
    struct Tee<'a, A: kshana::iq::scene::TruthSink>(&'a mut A, &'a mut Vec<TruthRecord>);
    impl<A: kshana::iq::scene::TruthSink> kshana::iq::scene::TruthSink for Tee<'_, A> {
        fn record(&mut self, r: &TruthRecord) -> Result<(), kshana::iq::IqError> {
            self.1.push(*r);
            self.0.record(r)
        }
        fn finish(&mut self) -> Result<(), kshana::iq::IqError> {
            self.0.finish()
        }
    }
    sc.generate(&mut sink, &mut Tee(&mut tw, &mut records))
        .unwrap();
    write_sidecar(
        &data,
        &RawSidecar {
            format: "cf32_le".into(),
            sample_rate_hz: FS,
            center_hz: Some(1_575.42e6),
            if_hz: Some(0.0),
            header_bytes: None,
            channels: None,
            channel: None,
            datetime: None,
            description: None,
        },
    )
    .unwrap();
    records
}

/// Write the test-condition file of one recording: a broadband event with the stated J/S
/// profile (linear ramp, or one point per step), and hand-off hints from the scene's truth.
fn conditions(dir: &Path, r: &RecSpec, truth: &[TruthRecord], event_type: &str) {
    let hint = |prn: u8| {
        let t = truth.iter().find(|x| x.sat_id == u32::from(prn)).unwrap();
        (t.doppler_hz, t.code_phase_chips)
    };
    let ids: Vec<String> = r.sats.iter().map(|s| s.0.to_string()).collect();
    let dops: Vec<String> = r.sats.iter().map(|s| hint(s.0).0.to_string()).collect();
    let phs: Vec<String> = r.sats.iter().map(|s| hint(s.0).1.to_string()).collect();
    let text = format!(
        r#"schema = "kshana.test-conditions/1"
[recording]
id = "{id}"
path = "../{id}.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [{ids}]
doppler_hz = [{dops}]
code_phase_chips = [{phs}]
truth = "../{id}.truth.csv"
[[event]]
id = "ramp"
kind = "interference"
type = "{event_type}"
onset_s = {on}
offset_s = {off}
[event.power]
quantity = "js_db"
interpolation = "{interp}"
points = [{points}]
"#,
        id = r.id,
        ids = ids.join(", "),
        dops = dops.join(", "),
        phs = phs.join(", "),
        on = r.onset_s,
        off = r.offset_s(),
        interp = if r.step.is_some() { "step" } else { "linear" },
        points = r
            .points()
            .iter()
            .map(|(t, j)| format!("[{t}, {j}]"))
            .collect::<Vec<_>>()
            .join(", "),
    );
    std::fs::write(dir.join("conds").join(format!("{}.toml", r.id)), text).unwrap();
}

/// Build, track and score a synthetic campaign; returns its output folder. With `epochs`, the
/// campaign also keeps each cell's per-update records (`[run] epochs = "csv"`), an output
/// only: the scorer reads the same updates either way.
pub fn build_campaign(
    name: &str,
    recs: &[RecSpec],
    truth: Truth,
    workers: usize,
    estimator: &str,
    epochs: bool,
) -> PathBuf {
    let dir = scratch(name);
    std::fs::create_dir_all(dir.join("conds")).unwrap();
    for r in recs {
        let t = scene(&dir, r, truth);
        conditions(&dir, r, &t, "broadband");
    }
    std::fs::write(
        dir.join("designs.toml"),
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"fll-pll-reacq\"\n\
         [design.lock]\nreacquire = true\nreacq_window_s = 8.0\n",
    )
    .unwrap();
    let campaign = dir.join("campaign.toml");
    std::fs::write(
        &campaign,
        r#"schema = "kshana.campaign/1"
name = "labfit-iq synthetic"
data_class = "synthetic"
[inputs]
conditions = ["conds/*.toml"]
designs = "designs.toml"
[[frontend]]
name = "raw"
[scoring]
baseline_window_s = 2.0
reacq_grace_s = 10.0
cn0_estimator = "{estimator}"
"#
        .replace("{estimator}", estimator)
            + if epochs {
                "[run]\nepochs = \"csv\"\n"
            } else {
                ""
            },
    )
    .unwrap();
    let c = LoadedCampaign::load(&campaign).unwrap();
    let out = dir.join("out");
    let s = run(
        &c,
        &out,
        &RunOptions {
            workers,
            ..Default::default()
        },
    )
    .unwrap();
    assert!(s.cells_failed.is_empty(), "{:?}", s.cells_failed);
    // The recordings are no longer needed once scored; the fit reads only the out folder.
    for r in recs {
        let _ = std::fs::remove_file(dir.join(format!("{}.cf32", r.id)));
    }
    out
}

// --- the machinery of the bar-(a') campaign, unchanged ---------------------------------------

/// Q of the scenes: the table's value for the stated type (`broadband`).
const Q_TRUE: f64 = 2.0;

/// One seeded campaign of `n_rec` recordings of three satellites each.
fn recipe(seed: u64, n_rec: usize) -> Vec<RecSpec> {
    use rand::{Rng, SeedableRng};
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
    let pool: [(u8, f64); 8] = [
        (3, 1200.0),
        (11, -800.0),
        (19, 300.0),
        (7, 2300.0),
        (24, -1700.0),
        (14, 650.0),
        (28, -150.0),
        (31, 1750.0),
    ];
    (0..n_rec)
        .map(|i| {
            let k = rng.gen_range(0..pool.len());
            let sats = (0..3)
                .map(|j| {
                    let (prn, dop) = pool[(k + 3 * j) % pool.len()];
                    (prn, dop, rng.gen_range(42.0..48.0))
                })
                .collect();
            RecSpec {
                id: format!("r{i}"),
                seed: seed.wrapping_mul(1000) + i as u64,
                sats,
                onset_s: 3.0,
                ramp_s: rng.gen_range(10.0..16.0),
                hold_s: 1.0,
                after_s: 6.0,
                js0_db: rng.gen_range(0.0..5.0),
                js1_db: 45.0,
                step: None,
            }
        })
        .collect()
}

/// The truth of a seeded campaign: `delta` uniform in [-2, 2] dB.
fn truth_of(seed: u64) -> Truth {
    use rand::{Rng, SeedableRng};
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed ^ 0x0074_7275_7468); // "truth"
    Truth {
        q: Q_TRUE,
        delta_db: rng.gen_range(-2.0..2.0),
    }
}

/// The scenario of the fit: the campaign folder, the settings, the synthetic study's
/// `[validation]` table (the illustrative values of §5.2) and one prediction.
fn scenario(out: &Path, bootstrap: usize, lock_models: bool) -> String {
    format!(
        r#"kind = "iq-labfit"
name = "synthetic campaign"
mode = "validation"
[input]
campaign = "{}"
[campaign_fit]
seed = 7
bootstrap = {bootstrap}
lock_models = {lock_models}
[validation]
registered = "2026-10-12"
cn0_rms_db_max = 1.0
pi90_coverage = [0.80, 0.98]
loss_time_rms_s_max = 2.0
[[predict]]
label = "ramp to 40 dB over 12 s at 45 dB-Hz"
nominal_cn0_dbhz = 45.0
run_end_s = 30.0
[predict.conditions]
onset_s = 3.0
offset_s = 16.0
level_kind = "j-over-s"
interp = "linear"
jammer_type = "broadband"
levels = [{{ t_s = 3.0, level_db = 2.0 }}, {{ t_s = 15.0, level_db = 40.0 }}]
"#,
        out.display()
    )
}

fn fit(out: &Path, bootstrap: usize, lock_models: bool) -> kshana::iq::labfit::LabFitIqOutput {
    let sc: kshana::iq::labfit::LabFitScenario =
        toml::from_str(&scenario(out, bootstrap, lock_models)).unwrap();
    kshana::iq::labfit::run_campaign_scenario(&sc).unwrap()
}

/// Write a bar result line to stderr and to the results file named by
/// `KSHANA_LABFIT_IQ_RESULTS`, when set.
fn record(line: &str) {
    eprintln!("BAR {line}");
    if let Ok(p) = std::env::var("KSHANA_LABFIT_IQ_RESULTS") {
        use std::io::Write;
        let mut f = std::fs::OpenOptions::new()
            .create(true)
            .append(true)
            .open(p)
            .unwrap();
        writeln!(f, "{line}").unwrap();
    }
}

fn unit0(f: &kshana::iq::labfit::LabFitIqOutput) -> &kshana::iq::labfit::iqfit::UnitReport {
    assert_eq!(
        f.report.fit_units.len(),
        1,
        "one unit: one signal, design, front end, type"
    );
    let u = &f.report.fit_units[0];
    assert_eq!(u.status, "fitted", "{}", u.status);
    u
}

// --- the registered campaigns -----------------------------------------------------------------

/// Campaign S: seed, recordings, steps.
const S_SEED: u64 = 2026_1014;
const R_SEED: u64 = 2026_1015;
const RECORDINGS: usize = 6;
const STEP_DB: f64 = 3.0;
const STEP_DWELL_S: f64 = 4.0;
/// Bins of the settled-bias report start this long after each step.
const SETTLE_AFTER_STEP_S: f64 = 1.5;

/// `recipe(seed, n)` with each linear ramp replaced by the registered staircase.
fn stepped_recipe(seed: u64, n_rec: usize) -> Vec<RecSpec> {
    recipe(seed, n_rec)
        .into_iter()
        .map(|mut r| {
            let below = ((r.js1_db - r.js0_db) / STEP_DB).ceil() as usize;
            r.ramp_s = (below + 1) as f64 * STEP_DWELL_S;
            r.step = Some(Step {
                step_db: STEP_DB,
                dwell_s: STEP_DWELL_S,
            });
            r
        })
        .collect()
}

fn built(name: &str, env: &str, recs: Vec<RecSpec>, seed: u64, epochs: bool) -> PathBuf {
    // A folder already built from this recipe may be named to skip the tracking.
    if let Ok(d) = std::env::var(env) {
        return PathBuf::from(d);
    }
    let t0 = std::time::Instant::now();
    let out = build_campaign(name, &recs, truth_of(seed), 4, "m2m4", epochs);
    eprintln!(
        "campaign {name} built and tracked in {:.1} s",
        t0.elapsed().as_secs_f64()
    );
    out
}

fn campaign_s() -> &'static PathBuf {
    static OUT: std::sync::OnceLock<PathBuf> = std::sync::OnceLock::new();
    OUT.get_or_init(|| {
        built(
            "s",
            "KSHANA_LABFIT_IQ_CAMPAIGN_S",
            stepped_recipe(S_SEED, RECORDINGS),
            S_SEED,
            true,
        )
    })
}

fn campaign_r() -> &'static PathBuf {
    static OUT: std::sync::OnceLock<PathBuf> = std::sync::OnceLock::new();
    OUT.get_or_init(|| {
        built(
            "r",
            "KSHANA_LABFIT_IQ_CAMPAIGN_R",
            recipe(R_SEED, RECORDINGS),
            R_SEED,
            false,
        )
    })
}

/// The bar-(a') fit: 1000 replicates, both lock models, the hold-outs.
fn fitted(out: &Path, name: &str) -> kshana::iq::labfit::LabFitIqOutput {
    let t0 = std::time::Instant::now();
    let f = fit(out, 1000, true);
    eprintln!(
        "campaign {name} fit (1000 replicates, lock models, hold-outs) in {:.1} s",
        t0.elapsed().as_secs_f64()
    );
    f
}

fn fitted_s() -> &'static kshana::iq::labfit::LabFitIqOutput {
    static FIT: std::sync::OnceLock<kshana::iq::labfit::LabFitIqOutput> =
        std::sync::OnceLock::new();
    FIT.get_or_init(|| fitted(campaign_s(), "s"))
}

fn fitted_r() -> &'static kshana::iq::labfit::LabFitIqOutput {
    static FIT: std::sync::OnceLock<kshana::iq::labfit::LabFitIqOutput> =
        std::sync::OnceLock::new();
    FIT.get_or_init(|| fitted(campaign_r(), "r"))
}

/// `(estimate - truth, span)` of `delta_eff`, with Q stated (never fitted) at the truth's Q.
fn delta_eff_error(f: &kshana::iq::labfit::LabFitIqOutput, seed: u64) -> (f64, f64, String) {
    let c = unit0(f).cn0_model.as_ref().unwrap();
    match &c.q_eff {
        kshana::iq::labfit::iqfit::QReport::Stated { value, .. } => assert_eq!(*value, Q_TRUE),
        other => panic!("Q must be stated, not fitted: {other:?}"),
    }
    let t = truth_of(seed);
    let truth_eff = t.delta_db - 10.0 * t.q.log10();
    let err = c.delta_eff_db.estimate - truth_eff;
    let line = format!(
        "delta_eff estimate {:.4} truth {:.4} error {:+.4} dB ci95 {:?} span {:.1} dB",
        c.delta_eff_db.estimate, truth_eff, err, c.delta_eff_db.ci95, c.span_db
    );
    (err, c.span_db, line)
}

/// Bar (d) as written (§13.4): per lock model, `(model, closed-form median, direct median,
/// losses)`.
fn d_as_written(f: &kshana::iq::labfit::LabFitIqOutput) -> Vec<(String, Option<f64>, f64, usize)> {
    let t = unit0(f).threshold.as_ref().unwrap();
    let direct = t.direct.median_js_db.expect("losses observed");
    t.via_model
        .iter()
        .map(|v| {
            (
                v.model.as_str().to_string(),
                v.median_at_lost_events_db,
                direct,
                t.direct.n,
            )
        })
        .collect()
}

fn median(v: &mut [f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(|a, b| a.total_cmp(b));
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// Bar R1: per lock model, the closed form at each lost event's own baseline plus that model's
/// fitted drop dwell times the event's own stated ramp rate; `(model, corrected median,
/// uncorrected median, direct median, losses, drop dwell)`. The lost events are those the fit's
/// threshold uses (locked at onset, a baseline, a stated profile, a scored `js_at_loss_db`).
#[allow(clippy::type_complexity)]
fn d_dwell_corrected(
    f: &kshana::iq::labfit::LabFitIqOutput,
    out: &Path,
) -> Vec<(String, Option<f64>, Option<f64>, f64, usize, f64)> {
    use kshana::iq::labfit::cn0::threshold_js_db;
    let u = unit0(f);
    let c = u.cn0_model.as_ref().unwrap();
    let t = u.threshold.as_ref().unwrap();
    let direct = t.direct.median_js_db.expect("losses observed");
    let data = kshana::iq::labfit::campaign::load(out).unwrap();
    assert_eq!(data.units.len(), 1);
    let lost: Vec<(f64, f64)> = data.units[0]
        .recordings
        .iter()
        .flat_map(|r| r.events.iter())
        .filter(|e| e.locked_at_onset && e.power.is_some() && e.lost)
        .filter(|e| e.time_to_loss_s.is_some() && e.js_at_loss_db.is_some())
        .filter_map(|e| Some((e.baseline_cn0_dbhz?, e.ramp_db_per_s())))
        .collect();
    assert_eq!(lost.len(), t.direct.n, "the fit's lost events");
    t.via_model
        .iter()
        .map(|v| {
            let m = u
                .lock_model
                .iter()
                .find(|m| m.model == v.model)
                .expect("lock model fitted");
            let dwell = m
                .params
                .iter()
                .find(|p| p.name == "drop_dwell_s")
                .expect("drop dwell")
                .value
                .estimate;
            let drop = v.drop_cn0_dbhz.unwrap_or(f64::NAN);
            let base = |c0: f64| threshold_js_db(c0, drop, Q_TRUE, c.delta_db.estimate, RC);
            let mut plain: Vec<f64> = lost.iter().filter_map(|&(c0, _)| base(c0)).collect();
            let mut corr: Vec<f64> = lost
                .iter()
                .filter_map(|&(c0, rate)| base(c0).map(|j| j + dwell * rate))
                .collect();
            let plain = median(&mut plain);
            // The uncorrected median must be the fit's own (d) median: same events, same form.
            match (plain, v.median_at_lost_events_db) {
                (Some(a), Some(b)) => assert!((a - b).abs() < 1e-9, "{a} vs {b}"),
                (a, b) => assert_eq!(a.is_some(), b.is_some()),
            }
            (
                v.model.as_str().to_string(),
                median(&mut corr),
                plain,
                direct,
                t.direct.n,
                dwell,
            )
        })
        .collect()
}

/// The settled bias of the measured (M2M4) C/N0 on campaign S: per 3 dB-Hz band of the imposed
/// C/N0, `(band low edge, epochs, median measured - imposed)`, over locked epochs at least
/// 1.5 s after the start of their step and before the event's end.
fn settled_bias_s(out: &Path) -> Vec<(f64, usize, f64)> {
    let recs = stepped_recipe(S_SEED, RECORDINGS);
    let truth = truth_of(S_SEED);
    let mut bands: std::collections::BTreeMap<i64, Vec<f64>> = Default::default();
    // Each cell names its recording, its epoch file and its satellites in channel order.
    let mut cells: Vec<(String, PathBuf, Vec<u8>)> = Vec::new();
    for e in std::fs::read_dir(out.join("cells")).unwrap() {
        let v: serde_json::Value =
            serde_json::from_str(&std::fs::read_to_string(e.unwrap().path()).unwrap()).unwrap();
        let sats = v["satellites"]
            .as_array()
            .unwrap()
            .iter()
            .map(|s| s["id"].as_u64().unwrap() as u8)
            .collect();
        cells.push((
            v["recording"]["id"].as_str().unwrap().to_string(),
            out.join(v["epochs"]["path"].as_str().unwrap()),
            sats,
        ));
    }
    let mut files = 0;
    for r in &recs {
        let (_, path, chan_sats) = cells
            .iter()
            .find(|c| c.0 == r.id)
            .unwrap_or_else(|| panic!("epochs of {}", r.id));
        files += 1;
        let text = std::fs::read_to_string(path).unwrap();
        let mut lines = text.lines();
        let head: Vec<&str> = lines.next().unwrap().split(',').collect();
        let col = |n: &str| head.iter().position(|h| *h == n).unwrap();
        let (ch, ts, cn0, st) = (
            col("channel"),
            col("code_epoch_s"),
            col("cn0_m2m4_dbhz"),
            col("state"),
        );
        let mut pre: Vec<Vec<f64>> = vec![Vec::new(); chan_sats.len()];
        for l in lines {
            let f: Vec<&str> = l.split(',').collect();
            if f[st] != "LOCKED" {
                continue;
            }
            let t: f64 = f[ts].parse().unwrap();
            if (1.0..r.onset_s).contains(&t) {
                if let Ok(m) = f[cn0].parse::<f64>() {
                    pre[f[ch].parse::<usize>().unwrap()].push(m);
                }
            }
            if t < r.onset_s || t >= r.offset_s() {
                continue;
            }
            // The last level is held its step and then `hold_s` more.
            let last = (r.ramp_s / STEP_DWELL_S).round() - 1.0;
            let k = ((t - r.onset_s) / STEP_DWELL_S).floor().min(last);
            if t - r.onset_s - k * STEP_DWELL_S < SETTLE_AFTER_STEP_S {
                continue;
            }
            let Ok(m) = f[cn0].parse::<f64>() else {
                continue;
            };
            if !m.is_finite() {
                continue;
            }
            let prn = chan_sats[f[ch].parse::<usize>().unwrap()];
            let c0 = r.sats.iter().find(|s| s.0 == prn).unwrap().2;
            let imposed = effective_cn0_dbhz(c0, r.js(t) + truth.delta_db, truth.q, RC);
            bands
                .entry((imposed / 3.0).floor() as i64)
                .or_default()
                .push(m - imposed);
        }
        // The channel order is the cell's satellite order: each channel's pre-onset C/N0
        // reads its own satellite's baseline.
        for (k, v) in pre.iter_mut().enumerate() {
            let c0 = r.sats.iter().find(|s| s.0 == chan_sats[k]).unwrap().2;
            let m = median(v).expect("pre-onset epochs");
            assert!((m - c0).abs() < 1.5, "{} channel {k}: {m} vs {c0}", r.id);
        }
    }
    assert_eq!(files, recs.len());
    bands
        .into_iter()
        .map(|(k, mut v)| (k as f64 * 3.0, v.len(), median(&mut v).unwrap()))
        .collect()
}

// --- the bars -----------------------------------------------------------------------------------
//
// Run 2026-10-14 (RESULTS.md beside the registration). Each test asserts the recorded verdict,
// MET or NOT MET, and the recorded values within RECORDED_TOL_DB.

/// How far a re-run may move a recorded value (dB) before the record is stale.
const RECORDED_TOL_DB: f64 = 0.05;

fn near(got: Option<f64>, recorded: f64, what: &str) {
    let g = got.unwrap_or_else(|| panic!("{what}: no value"));
    assert!(
        (g - recorded).abs() <= RECORDED_TOL_DB,
        "{what}: {g:.4} against the recorded {recorded:.4}"
    );
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq-followup job)"
)]
fn s1_delta_eff_on_the_stepped_campaign() {
    let (err, span, line) = delta_eff_error(fitted_s(), S_SEED);
    let met = span >= 12.0 && err.abs() <= 0.5;
    record(&format!(
        "S1 {line} (bar 0.5 dB, span >= 12 dB): {}",
        if met { "MET" } else { "NOT MET" }
    ));
    // Recorded: MET, error +0.1849 dB over a 34.0 dB span.
    assert!(met, "S1: error {err:+.4} dB, span {span:.1} dB");
    near(Some(err), 0.1849, "S1 delta_eff error");
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq-followup job)"
)]
fn s2_d_as_written_on_the_stepped_campaign() {
    let rows = d_as_written(fitted_s());
    let mut met = true;
    for (model, m, direct, n) in &rows {
        let ok = *n >= 5 && m.is_some_and(|m| (m - direct).abs() <= 1.0);
        met &= ok;
        record(&format!(
            "S2 {model}: closed form {m:?} vs direct {direct:.3} over {n} losses (bar 1 dB, >= 5 losses): {}",
            if ok { "MET" } else { "NOT MET" }
        ));
    }
    // Recorded: NOT MET. The tracking-loop model is within the bar (33.817 against 34.265 dB),
    // the empirical model is not (27.848 dB, 6.42 dB low); 18 losses.
    assert!(!met, "S2 is recorded NOT MET: {rows:?}");
    let row = |m: &str| rows.iter().find(|r| r.0 == m).unwrap().clone();
    let (_, tl, direct, n) = row("tracking-loop");
    let (_, em, _, _) = row("empirical");
    assert_eq!(n, 18);
    near(Some(direct), 34.265, "S2 direct median");
    near(tl, 33.817, "S2 tracking-loop closed form");
    near(em, 27.848, "S2 empirical closed form");
    assert!(
        (tl.unwrap() - direct).abs() <= 1.0,
        "tracking-loop is recorded MET"
    );
    assert!(
        (em.unwrap() - direct).abs() > 1.0,
        "empirical is recorded NOT MET"
    );
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq-followup job)"
)]
fn r1_dwell_corrected_d_on_the_fresh_ramp_campaign() {
    let rows = d_dwell_corrected(fitted_r(), campaign_r());
    let mut met = true;
    for (model, corr, plain, direct, n, dwell) in &rows {
        let ok = *n >= 5 && corr.is_some_and(|m| (m - direct).abs() <= 1.0);
        met &= ok;
        record(&format!(
            "R1 {model}: dwell-corrected closed form {corr:?} (uncorrected {plain:?}, drop dwell {dwell:.3} s) \
             vs direct {direct:.3} over {n} losses (bar 1 dB, >= 5 losses): {}",
            if ok { "MET" } else { "NOT MET" }
        ));
    }
    // Recorded: MET for both models, 18 losses, direct median 36.112 dB.
    assert!(met, "R1: {rows:?}");
    let row = |m: &str| rows.iter().find(|r| r.0 == m).unwrap().clone();
    let (_, tl, _, direct, n, _) = row("tracking-loop");
    let (_, em, _, _, _, _) = row("empirical");
    assert_eq!(n, 18);
    near(Some(direct), 36.112, "R1 direct median");
    near(tl, 35.565, "R1 tracking-loop corrected closed form");
    near(em, 35.363, "R1 empirical corrected closed form");
}

/// Replications, not bars: (a') and (d) as written on campaign R. They assert nothing.
#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq-followup job)"
)]
fn replications_on_the_fresh_ramp_campaign() {
    let (_, _, line) = delta_eff_error(fitted_r(), R_SEED);
    record(&format!("replication a' on R: {line} (bar 0.5 dB)"));
    for (model, m, direct, n) in d_as_written(fitted_r()) {
        record(&format!(
            "replication d on R {model}: closed form {m:?} vs direct {direct:.3} over {n} losses (bar 1 dB)"
        ));
    }
}

/// Reported beside the bars: the per-step settled bias on campaign S. Asserts nothing.
#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq-followup job)"
)]
fn settled_bias_on_the_stepped_campaign() {
    for (lo, n, b) in settled_bias_s(campaign_s()) {
        record(&format!(
            "settled bias S: imposed C/N0 [{lo:.0}, {:.0}) dB-Hz, {n} epochs, median measured - imposed {b:+.3} dB",
            lo + 3.0
        ));
    }
}

#[test]
fn the_stepped_recipe_is_the_registered_staircase() {
    for r in stepped_recipe(S_SEED, RECORDINGS) {
        let s = r.step.unwrap();
        assert_eq!((s.step_db, s.dwell_s), (3.0, 4.0));
        assert!((0.0..5.0).contains(&r.js0_db));
        assert_eq!((r.onset_s, r.hold_s, r.after_s), (3.0, 1.0, 6.0));
        let p = r.points();
        assert_eq!(p[0], (r.onset_s, r.js0_db));
        for w in p.windows(2) {
            assert!((w[1].0 - w[0].0 - 4.0).abs() < 1e-12);
        }
        let (t_last, j_last) = *p.last().unwrap();
        assert_eq!(j_last, 45.0);
        assert!(p[p.len() - 2].1 < 45.0 && p[p.len() - 2].1 >= 42.0);
        assert!((r.onset_s + r.ramp_s - t_last - 4.0).abs() < 1e-12);
        // Piecewise constant: each level holds across its whole step and through the hold.
        for (t, j) in &p {
            assert_eq!(r.js(t + 3.999), *j);
        }
        assert_eq!(r.js(r.offset_s() - 1e-9), 45.0);
    }
    // The fresh ramp campaign is exactly `recipe(seed, 6)`.
    assert!(recipe(R_SEED, RECORDINGS).iter().all(|r| r.step.is_none()));
}
