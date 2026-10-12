// SPDX-License-Identifier: AGPL-3.0-only
//! The lab fit from IQ campaigns (`kshana::iq::labfit::{campaign, cn0, iqfit}`,
//! `docs/design/LABFIT-FROM-IQ.md`) on synthetic campaigns whose truth is known.
//!
//! **Synthetic only (§8).** Every campaign here is built from Kshana's own scenes carrying
//! legitimate GPS L1 C/A signals only. A stated J/S is imposed as a stated **C/N0 profile**
//! on each satellite, computed from the §3.1 formula with a known `Q` and `δ` and applied as
//! a per-satellite amplitude through the scene's channel hook. Nothing here synthesises a
//! jammer waveform. The campaigns are then tracked and scored by `kshana iq campaign`, and
//! the lab fit reads only the campaign's output folder.
//!
//! PIN-SCOPE: none. The tests check recovery of known truth against the pre-registered §5.1
//! bars, and that a fit reproduces from the same campaign and seed.
//! PIN-EXCLUDES: everything (no hash of an output is pinned here).

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
        "kshana-labfit-iq-{}-{uniq}-{name}",
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
/// `ramp_s` later, held until the event's end.
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
}

impl RecSpec {
    fn offset_s(&self) -> f64 {
        self.onset_s + self.ramp_s + self.hold_s
    }
    fn duration_s(&self) -> f64 {
        self.offset_s() + self.after_s
    }
    /// The stated J/S at `t` inside the event.
    fn js(&self, t: f64) -> f64 {
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

/// Write the test-condition file of one recording: a broadband event with the stated linear
/// J/S ramp, and hand-off hints from the scene's truth.
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
interpolation = "linear"
points = [[{on}, {j0}], [{t1}, {j1}]]
"#,
        id = r.id,
        ids = ids.join(", "),
        dops = dops.join(", "),
        phs = phs.join(", "),
        on = r.onset_s,
        off = r.offset_s(),
        t1 = r.onset_s + r.ramp_s,
        j0 = r.js0_db,
        j1 = r.js1_db,
    );
    std::fs::write(dir.join("conds").join(format!("{}.toml", r.id)), text).unwrap();
}

/// Build, track and score a synthetic campaign; returns its output folder.
pub fn build_campaign(
    name: &str,
    recs: &[RecSpec],
    truth: Truth,
    workers: usize,
    estimator: &str,
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
        .replace("{estimator}", estimator),
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

/// A probe of the tracked C/N0 against the imposed profile; prints, asserts nothing.
#[test]
#[ignore = "diagnostic: run in release with --nocapture"]
fn probe_tracked_cn0_against_the_imposed_profile() {
    let truth = Truth {
        q: 2.0,
        delta_db: 1.0,
    };
    let rec = RecSpec {
        id: "probe".into(),
        seed: 11,
        sats: vec![(3, 1200.0, 45.0), (11, -800.0, 47.0), (19, 300.0, 43.0)],
        onset_s: 3.0,
        ramp_s: 12.0,
        hold_s: 2.0,
        after_s: 6.0,
        js0_db: 5.0,
        js1_db: 45.0,
    };
    let t0 = std::time::Instant::now();
    let est = std::env::var("PROBE_EST").unwrap_or_else(|_| "m2m4".into());
    let out = build_campaign("probe", std::slice::from_ref(&rec), truth, 3, &est);
    eprintln!(
        "built + tracked {:.1} s of IQ in {:.1} s",
        rec.duration_s(),
        t0.elapsed().as_secs_f64()
    );
    let data = kshana::iq::labfit::campaign::load(&out).unwrap();
    for u in &data.units {
        for r in &u.recordings {
            for e in &r.events {
                eprintln!(
                    "sat {} base {:?} lost {} ttl {:?} js@loss {:?} reacq {} {:?}",
                    e.sat,
                    e.baseline_cn0_dbhz,
                    e.lost,
                    e.time_to_loss_s,
                    e.js_at_loss_db,
                    e.reacquired,
                    e.reacq_time_s
                );
                let c0 = rec.sats.iter().find(|s| i64::from(s.0) == e.sat).unwrap().2;
                for b in &e.bins {
                    let t = effective_cn0_dbhz(c0, b.js_db + truth.delta_db, truth.q, RC);
                    eprintln!(
                        "  js {:5.1} n {:5} meas {:7.3} truth {:7.3} err {:+.3} lf {:.2} cens {}",
                        b.js_db,
                        b.n,
                        b.measured_cn0_dbhz.unwrap_or(f64::NAN),
                        t,
                        b.measured_cn0_dbhz.unwrap_or(f64::NAN) - t,
                        b.locked_fraction,
                        b.censored
                    );
                }
            }
        }
    }
}

// --- the pre-registered campaigns ------------------------------------------------------------
//
// Fixed here before any fit was run (docs/design/LABFIT-FROM-IQ.md §13). Every recording ramps
// the stated J/S linearly from a low level to 45 dB, which takes each satellite through the knee
// of the C/N0 curve to loss of lock, holds it for 1 s, and ends the event; re-acquisition is
// scored afterwards. The scenes are built at the type table's Q for `broadband` (2), so the true
// identifiable offset is `delta_eff = delta - 10 log10 2`. The campaign scorer uses its default
// C/N0 estimator (M2M4): NWPR read no closer to the imposed profile in the diagnostic run.

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

/// Seed of the bar-(a') campaign, and its recordings.
const A_SEED: u64 = 2026_1012;
const A_RECORDINGS: usize = 6;

fn campaign_a() -> &'static PathBuf {
    static OUT: std::sync::OnceLock<PathBuf> = std::sync::OnceLock::new();
    OUT.get_or_init(|| {
        let t0 = std::time::Instant::now();
        let out = build_campaign(
            "bar-a",
            &recipe(A_SEED, A_RECORDINGS),
            truth_of(A_SEED),
            4,
            "m2m4",
        );
        eprintln!(
            "bar-(a') campaign built and tracked in {:.1} s",
            t0.elapsed().as_secs_f64()
        );
        out
    })
}

fn fitted_a() -> &'static kshana::iq::labfit::LabFitIqOutput {
    static FIT: std::sync::OnceLock<kshana::iq::labfit::LabFitIqOutput> =
        std::sync::OnceLock::new();
    FIT.get_or_init(|| {
        let t0 = std::time::Instant::now();
        let f = fit(campaign_a(), 1000, true);
        eprintln!(
            "bar-(a') fit (1000 replicates, lock models, hold-outs) in {:.1} s",
            t0.elapsed().as_secs_f64()
        );
        f
    })
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

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn bar_a_prime_delta_eff_is_recovered_and_q_is_stated_not_fitted() {
    let f = fitted_a();
    let u = unit0(f);
    let c = u.cn0_model.as_ref().unwrap();
    assert!(c.span_db >= 12.0, "uncensored span {} dB", c.span_db);
    // Q is stated, never fitted (§13): the original (a) Q clause is NOT MET by construction.
    match &c.q_eff {
        kshana::iq::labfit::iqfit::QReport::Stated {
            value,
            status,
            source,
        } => {
            assert_eq!(*value, Q_TRUE);
            assert_eq!(status, "stated, not fitted");
            assert_eq!(source, "type-table");
        }
        other => panic!("Q must be stated, not fitted: {other:?}"),
    }
    assert_eq!(c.q_mode, "fixed-stated");
    assert!(c.corr_q_delta.unwrap().abs() >= 0.999);
    let t = truth_of(A_SEED);
    let truth_eff = t.delta_db - 10.0 * t.q.log10();
    let err = c.delta_eff_db.estimate - truth_eff;
    record(&format!(
        "a' delta_eff estimate {:.4} truth {:.4} error {:+.4} dB (bar 0.5) ci95 {:?} span {:.1} dB; \
         original (a): Q clause NOT MET (not identifiable), delta part |{:+.4}| dB",
        c.delta_eff_db.estimate,
        truth_eff,
        err,
        c.delta_eff_db.ci95,
        c.span_db,
        c.delta_db.estimate - t.delta_db
    ));
    assert!(
        err.abs() <= 0.5,
        "bar a': |delta_eff error| {err:.4} dB > 0.5 dB"
    );
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn bar_c_holdout_prediction_intervals_cover_between_80_and_98_percent() {
    let u = unit0(fitted_a());
    let h = u.holdout.as_ref().unwrap();
    let i = &h.interpolation;
    let mut groups = vec![("bins".to_string(), i.bins, i.bins_pi90_coverage)];
    for g in &i.events {
        groups.push((
            format!("time-to-loss {}", g.model.as_str()),
            g.n,
            g.pi90_coverage,
        ));
    }
    let mut bad = Vec::new();
    for (g, n, cov) in &groups {
        record(&format!(
            "c {g}: {n} interpolation items, PI90 coverage {cov:?} (bar [0.80, 0.98])"
        ));
        if !cov.is_some_and(|c| (0.80..=0.98).contains(&c)) {
            bad.push(format!("{g}: {cov:?} over {n}"));
        }
    }
    assert!(bad.is_empty(), "bar (c) fails: {bad:?}");
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn bar_d_closed_form_threshold_matches_the_direct_estimate_within_1_db() {
    let u = unit0(fitted_a());
    let t = u.threshold.as_ref().unwrap();
    let direct = t.direct.median_js_db.expect("losses observed");
    assert!(t.direct.n >= 5, "{} losses", t.direct.n);
    let mut bad = Vec::new();
    for v in &t.via_model {
        let m = v.median_at_lost_events_db;
        record(&format!(
            "d {}: closed form {:?} vs direct {:.3} over {} losses (bar 1 dB)",
            v.model.as_str(),
            m,
            direct,
            t.direct.n
        ));
        if !m.is_some_and(|m| (m - direct).abs() <= 1.0) {
            bad.push(format!("{}: {m:?} vs {direct:.3}", v.model.as_str()));
        }
    }
    assert!(bad.is_empty(), "bar (d) fails: {bad:?}");
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn the_report_carries_its_inputs_censoring_validation_and_labels() {
    let f = fitted_a();
    let r = &f.report;
    assert_eq!(r.schema, "kshana.labfit-iq/1");
    assert_eq!(r.label, "MODELLED");
    assert!(r.advisory.starts_with("Advisory"));
    let digest = std::fs::read_to_string(campaign_a().join("DIGEST")).unwrap();
    assert_eq!(r.inputs.campaign_digest, digest.trim());
    assert_eq!(r.inputs.cells.len(), A_RECORDINGS);
    assert_eq!(r.inputs.test_conditions.len(), A_RECORDINGS);
    let u = unit0(f);
    // Bins near each loss are censored and listed.
    assert!(u.data.bins_censored > 0);
    assert_eq!(u.data.censored.len(), u.data.bins_censored);
    assert!(u.data.censored.iter().all(|b| b.locked_fraction < 0.9));
    // The validation table is hashed and every bar is judged.
    let v = u.validation.as_ref().unwrap();
    assert_eq!(v.table_sha256.len(), 64);
    assert!(v
        .bars
        .iter()
        .all(|b| b.verdict == "PASS" || b.verdict == "FAIL"));
    for b in &v.bars {
        record(&format!(
            "validation {} {} value {:?}: {}",
            b.bar, b.limit, b.value, b.verdict
        ));
    }
    // Predictions are labelled, with an interval and the nearest tested recording.
    assert!(!r.predictions.is_empty());
    for p in &r.predictions {
        assert_eq!(p.label, "PREDICTION");
        assert!(p.nearest_recording.is_some());
    }
    assert!(r
        .predictions
        .iter()
        .any(|p| p.quantity == "cn0_dbhz" && p.pi90.is_some()));
    // Every numeric field carries a unit and a provenance class (the field-units contract).
    let audit = kshana::field_schema::audit_document(&serde_json::from_str(&f.json).unwrap());
    assert!(
        audit.missing.is_empty() && audit.malformed.is_empty(),
        "fields without units {:?}, malformed {:?}",
        audit.missing,
        audit.malformed
    );
    // The views are generated from the report.
    assert!(f.markdown.contains("stated, not fitted"));
    assert!(f.markdown.contains("not identifiable"));
    assert!(f.residuals_csv.lines().count() > u.data.bins_used);
    assert!(f.predictions_csv.starts_with("label,unit,query"));
    assert_eq!(
        serde_json::from_str::<serde_json::Value>(&f.json).unwrap()["schema"],
        "kshana.labfit-iq/1"
    );
}

#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn the_cluster_bootstrap_reproduces_from_the_campaign_and_seed() {
    let a = fit(campaign_a(), 40, true);
    let b = fit(campaign_a(), 40, true);
    assert_eq!(a.json, b.json);
    assert_eq!(a.residuals_csv, b.residuals_csv);
    assert_eq!(a.predictions_csv, b.predictions_csv);
    // Another seed moves the intervals, not the full-data fit.
    let sc = scenario(campaign_a(), 40, true).replace("seed = 7", "seed = 8");
    let sc: kshana::iq::labfit::LabFitScenario = toml::from_str(&sc).unwrap();
    let c = kshana::iq::labfit::run_campaign_scenario(&sc).unwrap();
    let (ua, uc) = (unit0(&a), unit0(&c));
    let (ca, cc) = (
        ua.cn0_model.as_ref().unwrap(),
        uc.cn0_model.as_ref().unwrap(),
    );
    assert_eq!(ca.delta_eff_db.estimate, cc.delta_eff_db.estimate);
    assert_ne!(ca.delta_eff_db.ci95, cc.delta_eff_db.ci95);
}

#[test]
fn a_validation_mode_fit_refuses_to_start_without_its_table() {
    let dir = scratch("no-table");
    let text = scenario(&dir, 10, false);
    let cut = text.find("[validation]").unwrap();
    let end = text.find("[[predict]]").unwrap();
    let text = format!("{}{}", &text[..cut], &text[end..]);
    let sc: kshana::iq::labfit::LabFitScenario = toml::from_str(&text).unwrap();
    let data = kshana::iq::labfit::campaign::CampaignData {
        digest: String::new(),
        campaign_json_sha256: String::new(),
        cells: Vec::new(),
        test_conditions: Vec::new(),
        reacq_grace_s: 0.0,
        units: Vec::new(),
    };
    let e = kshana::iq::labfit::iqfit::analyse(&data, &sc).unwrap_err();
    assert!(e.contains("[validation]"), "{e}");
}

/// Bar (b'): the 95 % interval of `delta_eff` covers its truth in at least 45 of 50 seeded
/// campaigns. Each campaign takes minutes in release, so CI runs the pinned subset below
/// and the full set runs before release (`--ignored`), its result recorded in the design.
fn coverage_of(seeds: std::ops::Range<u64>) -> (usize, usize) {
    let mut covered = 0;
    let mut n = 0;
    for s in seeds {
        let seed = 7_000 + s;
        let t0 = std::time::Instant::now();
        let out = build_campaign(
            &format!("bar-b-{s}"),
            &recipe(seed, 5),
            truth_of(seed),
            4,
            "m2m4",
        );
        let f = fit(&out, 1000, false);
        let c = unit0(&f).cn0_model.clone().unwrap();
        let t = truth_of(seed);
        let truth_eff = t.delta_db - 10.0 * t.q.log10();
        let [lo, hi] = c.delta_eff_db.ci95.unwrap();
        let inside = (lo..=hi).contains(&truth_eff);
        covered += usize::from(inside);
        n += 1;
        record(&format!(
            "b' campaign {s}: delta_eff {:.4} ci95 [{lo:.4}, {hi:.4}] truth {truth_eff:.4} {} ({:.0} s)",
            c.delta_eff_db.estimate,
            if inside { "covered" } else { "MISSED" },
            t0.elapsed().as_secs_f64()
        ));
        let _ = std::fs::remove_dir_all(out.parent().unwrap());
    }
    record(&format!("b' coverage {covered} of {n}"));
    (covered, n)
}

/// The CI subset of bar (b'): the first 2 of the 50 seeded campaigns. Both must be covered (a
/// subset cannot show the 90 % rate; the full set below decides the bar).
#[test]
#[cfg_attr(
    debug_assertions,
    ignore = "IQ campaign: run in release (ci.yml labfit-iq job)"
)]
fn bar_b_prime_ci_subset() {
    let (c, n) = coverage_of(0..2);
    assert_eq!(c, n, "bar (b') CI subset: {c} of {n} covered");
}

#[test]
#[ignore = "bar (b') full set, 50 campaigns: run in release before every release"]
fn bar_b_prime_full_set_of_50_campaigns() {
    let (c, n) = coverage_of(0..50);
    assert_eq!(n, 50);
    assert!(c >= 45, "bar (b'): {c} of 50 covered (needs 45)");
}
