// SPDX-License-Identifier: AGPL-3.0-only
//! The lab-replay campaign runner and scoring engine (`kshana::iq::campaign`), end to end
//! on a synthetic campaign whose truth is known.
//!
//! Kshana scenes stand in for lab recordings. Each satellite's C/N0 follows a stated
//! profile, applied as a per-satellite amplitude through the scene's channel hook. That is
//! a signal-power profile, not an interference waveform: nothing here synthesises a jammer
//! or spoofer. The test-condition files then state the events a lab would have stated:
//!
//! * `ramp`: a broadband event whose stated J/S steps from 20 dB to 30 dB. The scene's C/N0
//!   follows the analytic spectral-separation value for that J/S, so the measured
//!   degradation must sit on the MODELLED reference.
//! * `gap`: an outage, where the signal is absent for 1.5 s. Lock must be lost shortly
//!   after the onset, and the loss and re-acquisition times must agree with the injected
//!   gap.
//! * `alias`: a correctly handed-off channel scored against a truth sidecar whose Doppler
//!   is shifted by 300 Hz (more than the 1/(4T) = 250 Hz threshold). Every locked update is
//!   then off the stated truth, so the false-lock check must score an episode. Against the
//!   true sidecar, the `ramp` channels score none. (A hand-off at the ±1/(2T) Costas alias
//!   does not work as a stimulus with this tracker: the coherent sum in the NWPR C/N0
//!   estimator cancels at that alias, so code lock is never declared.)
//!
//! The runner must also resume. A partial run on one worker, completed by a run on three
//! workers, must give byte-identical cells and the same digest as one uninterrupted run on
//! four workers.

use kshana::iq::campaign::runner::{cell_key, CellKeyInputs};
use kshana::iq::campaign::score::reference_q;
use kshana::iq::campaign::spec::DataClass;
use kshana::iq::campaign::Plan;
use kshana::iq::campaign::{report, run, CellResult, LoadedCampaign, RunOptions, RunSummary};
use kshana::iq::io::inventory::{write_sidecar, RawSidecar};
use kshana::iq::io::stream::create_raw;
use kshana::iq::io::SampleFormat;
use kshana::iq::scene::{
    direct_path, CsvTruthWriter, NavData, RangeProfile, Scene, SceneConfig, SceneSatellite,
    TruthRecord,
};
use kshana::iq::track::design::DesignFile;
use kshana::iq::{ChannelSnapshot, PathState, SampleSpec};
use kshana::jamming::effective_cn0_dbhz;
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};
use std::sync::OnceLock;

// 2.5 MHz, not 2.046 MHz: at exactly 2 samples per chip the code discriminator's S-curve is
// a step (commensurate sampling, docs/design/evidence/dll-jitter/RESULTS.md), which would
// hide the DLL jitter's growth with falling C/N0.
const FS: f64 = 2.5e6;
const NOMINAL: f64 = 45.0;
const RC: f64 = 1.023e6;

/// A fresh scratch folder.
fn scratch(name: &str) -> PathBuf {
    let d = std::env::temp_dir().join(format!("kshana-iq-campaign-{}-{name}", std::process::id()));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

/// Write a GPS L1 C/A scene of `sats` (PRN, Doppler) whose C/N0 follows `cn0` (`None` is
/// no signal), with a raw sidecar and a CSV truth sidecar. Returns the truth records.
fn scene(
    dir: &Path,
    name: &str,
    duration_s: f64,
    sats: &[(u8, f64)],
    cn0: impl Fn(u32, f64) -> Option<f64> + Send + 'static,
) -> Vec<TruthRecord> {
    let spec = SampleSpec {
        fs_hz: FS,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    };
    let mut cfg = SceneConfig::new(spec, duration_s);
    cfg.seed = 7;
    cfg.threads = 2;
    let mut sc = Scene::new(cfg).unwrap();
    let lambda = kshana::iq::C_M_PER_S / 1_575.42e6;
    for (i, &(prn, dop)) in sats.iter().enumerate() {
        let profile = RangeProfile {
            range_m: 2.0e7 + i as f64 * 3.1e5,
            range_rate_mps: -dop * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        let s =
            SceneSatellite::gps_l1ca_profile(prn, profile, Some(NOMINAL), NavData::None).unwrap();
        sc.add_satellite(s);
    }
    // The C/N0 profile: a relative amplitude per satellite over time.
    sc.set_channel(Box::new(move |id: u32, t: f64| ChannelSnapshot {
        t_s: t,
        paths: match cn0(id, t) {
            None => Vec::new(),
            Some(c) => vec![PathState {
                amplitude: 10f64.powf((c - NOMINAL) / 20.0),
                ..direct_path()
            }],
        },
    }));
    let data = dir.join(format!("{name}.cf32"));
    let mut sink = create_raw(&data, SampleFormat::parse("cf32_le").unwrap()).unwrap();
    let mut truth = CsvTruthWriter::new(std::io::BufWriter::new(
        std::fs::File::create(dir.join(format!("{name}.truth.csv"))).unwrap(),
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
    sc.generate(&mut sink, &mut Tee(&mut truth, &mut records))
        .unwrap();
    write_sidecar(
        &data,
        &RawSidecar {
            format: "cf32_le".into(),
            sample_rate_hz: FS,
            center_hz: Some(1_575.42e6),
            if_hz: Some(0.0),
            header_bytes: None,
            datetime: None,
            description: None,
        },
    )
    .unwrap();
    records
}

/// The stated J/S of the `ramp` event at `t`.
fn ramp_js(t: f64) -> f64 {
    if t < 6.0 {
        20.0
    } else {
        30.0
    }
}

/// The scenes, condition files, designs and campaign file, and one reference run.
struct Fixture {
    dir: PathBuf,
    campaign: PathBuf,
    reference_out: PathBuf,
    reference: RunSummary,
}

fn fixture() -> &'static Fixture {
    static F: OnceLock<Fixture> = OnceLock::new();
    F.get_or_init(|| {
        let dir = scratch("fixture");
        let q = kshana::jamming::q_factor("broadband", None);

        // ramp: two satellites, broadband event 3-9 s, stated J/S 20 then 30 dB.
        let truth = scene(&dir, "ramp", 10.0, &[(3, 1200.0), (11, -800.0)], move |_, t| {
            Some(if (3.0..9.0).contains(&t) {
                effective_cn0_dbhz(NOMINAL, ramp_js(t), q, RC)
            } else {
                NOMINAL
            })
        });
        let hint = |prn: u32| {
            let r = truth.iter().find(|r| r.sat_id == prn).unwrap();
            (r.doppler_hz, r.code_phase_chips)
        };
        let (d3, p3) = hint(3);
        let (d11, p11) = hint(11);
        std::fs::write(
            dir.join("ramp.toml"),
            format!(
                r#"schema = "kshana.test-conditions/1"
[recording]
id = "ramp"
path = "ramp.cf32"
settle_s = 1.0
[receiver]
dut = "synthetic scene"
[[expected]]
signal = "gps-l1ca"
ids = [3, 11]
nominal_cn0_dbhz = 45.0
doppler_hz = [{d3}, {d11}]
code_phase_chips = [{p3}, {p11}]
truth = "ramp.truth.csv"
[[event]]
id = "bb-1"
kind = "interference"
type = "broadband"
onset_s = 3.0
offset_s = 9.0
[event.power]
quantity = "js_db"
interpolation = "step"
points = [[3.0, 20.0], [6.0, 30.0]]
"#
            ),
        )
        .unwrap();

        // gap: one satellite, absent 3.0-4.5 s; acquired, not hinted.
        scene(&dir, "gap", 8.0, &[(7, 2300.0)], |_, t| {
            (!(3.0..4.5).contains(&t)).then_some(NOMINAL)
        });
        std::fs::write(
            dir.join("gap.toml"),
            r#"schema = "kshana.test-conditions/1"
[recording]
id = "gap"
path = "gap.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [7]
[[event]]
id = "off-1"
kind = "outage"
type = "unknown"
onset_s = 3.0
offset_s = 4.5
[bars]
max_reacq_s = 0.001
"#,
        )
        .unwrap();

        // alias: one satellite, scored against a truth sidecar shifted by 300 Hz.
        let truth = scene(&dir, "alias", 6.0, &[(19, 150.0)], |_, _| Some(NOMINAL));
        let r = truth.iter().find(|r| r.sat_id == 19).unwrap();
        let mut shifted = format!("{}\n", TruthRecord::CSV_HEADER);
        for t in &truth {
            let mut t = *t;
            t.doppler_hz += 300.0;
            shifted.push_str(&t.csv_row());
            shifted.push('\n');
        }
        std::fs::write(dir.join("alias.truth.csv"), shifted).unwrap();
        std::fs::write(
            dir.join("alias.toml"),
            format!(
                r#"schema = "kshana.test-conditions/1"
[recording]
id = "alias"
path = "alias.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [19]
doppler_hz = [{}]
code_phase_chips = [{}]
truth = "alias.truth.csv"
"#,
                r.doppler_hz, r.code_phase_chips
            ),
        )
        .unwrap();

        std::fs::write(
            dir.join("designs.toml"),
            r#"schema = "kshana.loop-design/1"
[[design]]
name = "fll-pll"
[[design]]
name = "pll-only"
[design.carrier]
kind = "pll"
pll_order = 2
pll_bw_hz = 15.0
"#,
        )
        .unwrap();
        let campaign = dir.join("campaign.toml");
        std::fs::write(
            &campaign,
            r#"schema = "kshana.campaign/1"
name = "synthetic"
data_class = "synthetic"
[inputs]
conditions = ["*.toml"]
designs = "designs.toml"
[[frontend]]
name = "raw"
[[frontend]]
name = "agc-3bit"
bits = 3
[scoring]
baseline_window_s = 2.0
false_lock_min_epochs = 200
[scoring.bars]
min_availability = 0.5
"#,
        )
        .unwrap();
        // The glob also matches campaign.toml and designs.toml; keep conditions apart.
        std::fs::create_dir_all(dir.join("conds")).unwrap();
        for n in ["ramp", "gap", "alias"] {
            let t = std::fs::read_to_string(dir.join(format!("{n}.toml"))).unwrap();
            std::fs::write(
                dir.join("conds").join(format!("{n}.toml")),
                t.replace(&format!("path = \"{n}.cf32\""), &format!("path = \"../{n}.cf32\""))
                    .replace("truth = \"", "truth = \"../"),
            )
            .unwrap();
        }
        std::fs::write(
            &campaign,
            std::fs::read_to_string(&campaign)
                .unwrap()
                .replace("[\"*.toml\"]", "[\"conds/*.toml\"]"),
        )
        .unwrap();

        let reference_out = dir.join("out-reference");
        let c = LoadedCampaign::load(&campaign).unwrap();
        let t0 = std::time::Instant::now();
        let reference = run(
            &c,
            &reference_out,
            &RunOptions {
                workers: 4,
                ..Default::default()
            },
        )
        .unwrap();
        let wall = t0.elapsed().as_secs_f64();
        eprintln!(
            "campaign performance: {} cells, {} samples read in {wall:.1} s ({:.2} Msample/s over all work items)",
            reference.cells_run,
            reference.samples_processed,
            reference.samples_processed as f64 / wall / 1e6
        );
        Fixture {
            dir,
            campaign,
            reference_out,
            reference,
        }
    })
}

fn cells(out: &Path) -> BTreeMap<String, (String, CellResult)> {
    let mut m = BTreeMap::new();
    for e in std::fs::read_dir(out.join("cells")).unwrap().flatten() {
        let p = e.path();
        if p.extension().is_some_and(|x| x == "json") {
            let text = std::fs::read_to_string(&p).unwrap();
            let c: CellResult = serde_json::from_str(&text).unwrap();
            m.insert(c.key.clone(), (text, c));
        }
    }
    m
}

fn cell<'a>(
    all: &'a BTreeMap<String, (String, CellResult)>,
    rec: &str,
    fe: &str,
    design: &str,
) -> &'a CellResult {
    &all.values()
        .find(|(_, c)| c.recording.id == rec && c.frontend.name == fe && c.design.name == design)
        .unwrap_or_else(|| panic!("no cell {rec}/{fe}/{design}"))
        .1
}

#[test]
fn the_reference_run_completes_every_cell_and_stamps_provenance() {
    let f = fixture();
    let r = &f.reference;
    assert_eq!(r.cells_total, 12, "3 recordings x 2 front ends x 2 designs");
    assert_eq!(r.cells_run, 12);
    assert!(r.cells_failed.is_empty(), "{:?}", r.cells_failed);
    assert_eq!(r.cells_pending, 0);
    let digest = r.digest.clone().expect("a complete campaign has a digest");
    assert_eq!(
        std::fs::read_to_string(f.reference_out.join("DIGEST"))
            .unwrap()
            .trim(),
        digest
    );
    let all = cells(&f.reference_out);
    assert_eq!(all.len(), 12);
    let designs =
        DesignFile::parse(&std::fs::read_to_string(f.dir.join("designs.toml")).unwrap()).unwrap();
    let plan: Plan = serde_json::from_str(
        &std::fs::read_to_string(f.reference_out.join("campaign.json")).unwrap(),
    )
    .unwrap();
    assert_eq!(plan.data_class, DataClass::Synthetic);
    // The public key and digest functions reproduce what the runner wrote.
    for pc in &plan.cells {
        let rec = &plan.recordings[pc.recording];
        let (fe, fe_hash) = &plan.frontends[pc.frontend];
        let d = &plan.designs[pc.design];
        let key = cell_key(&CellKeyInputs {
            recording_id: &rec.id,
            recording_sha256: &rec.sha256,
            conditions_hash: &rec.conditions_hash,
            frontend: &fe.name,
            frontend_hash: fe_hash,
            design: d["name"].as_str().unwrap(),
            design_hash: d["hash"].as_str().unwrap(),
            run_hash: &plan.run_hash,
            scoring_hash: &plan.scoring_hash,
            data_class: plan.data_class.as_str(),
            engine_version: &plan.engine_version,
        });
        assert_eq!(key, pc.key);
    }
    assert_eq!(report::digest(&f.reference_out).unwrap(), r.digest);
    for (_, c) in all.values() {
        assert_eq!(
            c.data_class,
            DataClass::Synthetic,
            "data_class on every cell"
        );
        assert_eq!(c.lock_source, "track-session");
        assert!(c.epochs.is_none(), "epochs are not kept by default");
        assert_eq!(c.engine_version, env!("CARGO_PKG_VERSION"));
        assert_eq!(c.recording.sha256.len(), 64);
        assert_eq!(c.design.hash, designs.get(&c.design.name).unwrap().hash());
        assert_eq!(c.run_hash.len(), 64);
        let rec = f.dir.join(format!("{}.cf32", c.recording.id));
        assert_eq!(
            c.recording.sha256,
            kshana::iq::campaign::hash::sha256_file(&rec).unwrap()
        );
    }
    for name in [
        "campaign.json",
        "scorecard.csv",
        "scorecard.json",
        "report.html",
        "runs.jsonl",
    ] {
        assert!(f.reference_out.join(name).is_file(), "{name}");
    }
    let html = std::fs::read_to_string(f.reference_out.join("report.html")).unwrap();
    assert!(html.contains("MODELLED"));
    assert!(!html.contains("<script") && !html.contains("http://") && !html.contains("https://"));
}

#[test]
fn ramp_degradation_follows_the_stated_js_and_sits_on_the_modelled_reference() {
    let f = fixture();
    let all = cells(&f.reference_out);
    // Whether and when a channel loses lock is the tracker's lock state machine's call
    // (phase or code lock down for `loss_dwell_s`). The scoring must agree with that
    // timeline: a loss carries the stated J/S at that moment, and a held channel is fully
    // available. At least one channel holds lock through the whole event.
    let mut held = 0;
    for (design, s) in ["pll-only", "fll-pll"].iter().flat_map(|d| {
        cell(&all, "ramp", "raw", d)
            .satellites
            .iter()
            .map(move |s| (*d, s))
    }) {
        assert_eq!(s.handoff.source, "hint");
        let e = &s.score.events[0];
        assert!(e.locked_at_onset, "{design}");
        match e.time_to_loss_s {
            None => {
                held += 1;
                assert!((e.availability.unwrap() - 1.0).abs() < 1e-9, "{design}");
            }
            Some(ttl) => {
                assert!((0.0..6.0 + 30.0).contains(&ttl), "{design}: {ttl}");
                let js = e.js_at_loss_db.unwrap();
                assert_eq!(js, if ttl < 3.0 { 20.0 } else { 30.0 }, "{design}");
                assert!(e.availability.unwrap() < 1.0);
            }
        }
        // The measured baseline sits within a few tenths of a dB of the scene's stated C/N0 on
        // these scenes; degradation is measured from it, so a constant offset cancels.
        let base = e.baseline_cn0_dbhz.unwrap();
        assert!((base - NOMINAL).abs() < 3.0, "baseline {base}");
        assert_eq!(e.baseline_source.as_deref(), Some("measured"));
        let m = e.modelled.as_ref().expect("broadband has a reference");
        assert_eq!(m.label, "MODELLED");
        assert_eq!(m.chip_rate_hz, RC);
        let bins: Vec<f64> = e.cn0_curve.iter().map(|b| b.js_db).collect();
        assert_eq!(bins, vec![20.0, 30.0]);
        for b in &e.cn0_curve {
            let measured = b.measured_degradation_db.unwrap();
            if b.n < 2000 {
                continue; // a bin cut short by losses of lock
            }
            let modelled = b.modelled_degradation_db.unwrap();
            let truth = NOMINAL - effective_cn0_dbhz(NOMINAL, b.js_db, m.q, RC);
            assert!(
                (measured - truth).abs() < 2.0,
                "PRN {} J/S {}: measured {measured:.2} vs injected {truth:.2}",
                s.score.id,
                b.js_db
            );
            // The reference is drawn from the measured baseline (a few tenths of a dB from the
            // scene's), which moves it by up to that much at high J/S.
            assert!(
                (modelled - truth).abs() < 2.5,
                "modelled {modelled} vs {truth}"
            );
        }
        // Carrier and code jitter both grow as C/N0 falls.
        assert!(
            e.pll_jitter_deg.unwrap() > 2.0 * e.baseline_pll_jitter_deg.unwrap(),
            "{design}"
        );
        assert!(
            e.dll_jitter_chips.unwrap() > 1.3 * e.baseline_dll_jitter_chips.unwrap(),
            "{design}: DLL {:?} vs baseline {:?}",
            e.dll_jitter_chips,
            e.baseline_dll_jitter_chips
        );
        assert_eq!(s.score.whole_run.false_lock_episodes, 0);
    }
    assert!(held >= 1, "no channel held lock through the event");
}

#[test]
fn the_reference_q_comes_from_the_jamming_table() {
    let tc = &LoadedCampaign::load(&fixture().campaign)
        .unwrap()
        .conditions;
    let ramp = &tc.iter().find(|(_, t)| t.recording.id == "ramp").unwrap().1;
    let (q, src) = reference_q(&ramp.events[0]).unwrap();
    assert_eq!(q, kshana::jamming::q_factor("broadband", None));
    assert_eq!(src, "type-table");
    let gap = &tc.iter().find(|(_, t)| t.recording.id == "gap").unwrap().1;
    assert!(reference_q(&gap.events[0]).is_none(), "no Q for an outage");
}

#[test]
fn an_outage_loses_lock_after_the_onset_and_the_times_agree_with_the_gap() {
    let f = fixture();
    let all = cells(&f.reference_out);
    for design in ["fll-pll", "pll-only"] {
        let c = cell(&all, "gap", "raw", design);
        let s = &c.satellites[0];
        assert_eq!(s.handoff.source, "acquired", "{design}");
        let e = &s.score.events[0];
        assert!(e.locked_at_onset && e.lost, "{design}: {e:?}");
        let ttl = e.time_to_loss_s.unwrap();
        // Lost no sooner than the loss dwell (0.2 s) and before the signal returns.
        assert!((0.2..1.5).contains(&ttl), "{design}: time to loss {ttl}");
        assert!(e.cn0_curve.is_empty() && e.modelled.is_none());
        if let (Some(re), Some(out)) = (e.reacq_time_s, e.outage_s) {
            assert!(re >= 0.0 && out >= re, "{design}: reacq {re}, outage {out}");
            // Relock needs the locks to hold for cn0_windows updates after the signal is back.
            assert!((out - (1.5 - ttl) - re).abs() < 1e-9);
        }
        assert_eq!(s.score.whole_run.loss_count, 1);
    }
}

#[test]
fn tracking_off_the_stated_truth_doppler_is_scored_as_a_false_lock() {
    let f = fixture();
    let all = cells(&f.reference_out);
    for design in ["fll-pll", "pll-only"] {
        let w = &cell(&all, "alias", "raw", design).satellites[0]
            .score
            .whole_run;
        assert!(w.availability.unwrap() > 0.9, "{design}: {w:?}");
        assert_eq!(w.false_lock_episodes, 1, "{design}: one continuous episode");
        assert!(w.false_lock_per_hour.unwrap() > 0.0);
    }
    // Against their true sidecar, the ramp channels never trip the check, even at 30 dB-Hz.
    for design in ["fll-pll", "pll-only"] {
        let ramp = cell(&all, "ramp", "raw", design);
        assert!(ramp
            .satellites
            .iter()
            .all(|s| s.score.whole_run.false_lock_episodes == 0));
    }
}

#[test]
fn scorecard_rows_carry_bars_and_the_per_recording_override() {
    let f = fixture();
    let csv = std::fs::read_to_string(f.reference_out.join("scorecard.csv")).unwrap();
    let header = csv.lines().next().unwrap();
    assert!(header.starts_with("recording,frontend,design,signal,sat,scope,event_id"));
    // 12 cells: ramp 2 sats x (run + event), gap 1 x (run + event), alias 1 x run.
    assert_eq!(csv.lines().count() - 1, 4 * (4 + 2 + 1));
    // The gap recording's own bar (re-acquire within 1 ms) fails its event rows.
    let gap_events: Vec<&str> = csv
        .lines()
        .filter(|l| l.starts_with("gap,") && l.contains(",event,"))
        .collect();
    assert_eq!(gap_events.len(), 4);
    assert!(
        gap_events.iter().all(|l| l.contains(",FAIL,max_reacq_s,")),
        "{gap_events:?}"
    );
    // The campaign bar (availability >= 0.5) passes every whole-run row of ramp.
    assert!(csv
        .lines()
        .filter(|l| l.starts_with("ramp,") && l.contains(",run,"))
        .all(|l| l.contains(",PASS,")));
}

#[test]
fn resuming_after_a_partial_single_worker_run_gives_identical_cells_and_digest() {
    let f = fixture();
    let out = f.dir.join("out-resumed");
    let _ = std::fs::remove_dir_all(&out);
    let c = LoadedCampaign::load(&f.campaign).unwrap();
    let first = run(
        &c,
        &out,
        &RunOptions {
            workers: 1,
            max_cells: Some(5),
            ..Default::default()
        },
    )
    .unwrap();
    assert_eq!(first.cells_run, 5);
    assert_eq!(first.cells_pending, 7);
    assert!(first.digest.is_none());
    assert!(!out.join("DIGEST").exists());
    // A corrupt cell file (as a crash mid-write could leave) is recomputed, not trusted.
    let corrupt = cells(&out).keys().next().unwrap().clone();
    std::fs::write(out.join("cells").join(format!("{corrupt}.json")), "{").unwrap();

    let dry = run(
        &c,
        &out,
        &RunOptions {
            dry_run: true,
            ..Default::default()
        },
    )
    .unwrap();
    assert_eq!((dry.cells_skipped, dry.cells_pending), (4, 8));

    let second = run(
        &c,
        &out,
        &RunOptions {
            workers: 3,
            ..Default::default()
        },
    )
    .unwrap();
    assert_eq!(second.cells_skipped, 4);
    assert_eq!(second.cells_run, 8);
    assert_eq!(second.digest, f.reference.digest);
    let (a, b) = (cells(&f.reference_out), cells(&out));
    assert_eq!(a.len(), b.len());
    for (k, (text, _)) in &a {
        assert_eq!(text, &b[k].0, "cell {k} differs after resume");
    }
    for name in [
        "campaign.json",
        "scorecard.csv",
        "scorecard.json",
        "report.html",
    ] {
        assert_eq!(
            std::fs::read(f.reference_out.join(name)).unwrap(),
            std::fs::read(out.join(name)).unwrap(),
            "{name} differs"
        );
    }

    // A third run has nothing to do; changing only a bar re-judges without re-running.
    let third = run(&c, &out, &RunOptions::default()).unwrap();
    assert_eq!((third.cells_run, third.cells_skipped), (0, 12));
    let text = std::fs::read_to_string(&f.campaign)
        .unwrap()
        .replace("min_availability = 0.5", "min_availability = 0.9999");
    let c2 = LoadedCampaign::load_text(&text, &f.campaign).unwrap();
    let fourth = run(&c2, &out, &RunOptions::default()).unwrap();
    assert_eq!(fourth.cells_run, 0);
    assert_eq!(
        fourth.digest, f.reference.digest,
        "bars are not part of results"
    );
    let s = report::build(&out).unwrap();
    assert!(s.rows_failed > 0);
}

/// The canonical hash of every cell's scored results (`satellites`), taken in (recording,
/// front end, design) order. It leaves out the keys, hashes and provenance fields, so it is
/// unchanged by anything that does not change a result.
fn metrics_digest(out: &Path, strip_added: bool) -> String {
    use kshana::iq::campaign::hash::canonical_hash;
    let mut rows: Vec<(String, serde_json::Value)> = cells(out)
        .values()
        .map(|(_, c)| {
            (
                format!("{}/{}/{}", c.recording.id, c.frontend.name, c.design.name),
                {
                    let mut v = serde_json::to_value(&c.satellites).unwrap();
                    if strip_added {
                        without_added(&mut v);
                    }
                    v
                },
            )
        })
        .collect();
    rows.sort_by(|a, b| a.0.cmp(&b.0));
    canonical_hash(&serde_json::Value::Array(
        rows.into_iter()
            .map(|(k, v)| serde_json::json!([k, v]))
            .collect(),
    ))
    .to_string()
}

/// Pre-registered before the `cn0_estimator` change (commit `b6cf9766`): the scored results of
/// the 12 reference cells at the tree that carries #45 `010b30b9`, #64 `21210183` and main
/// `51dce137`, where the only C/N0 estimator the scorer read was NWPR. The reference DIGEST at
/// that tree was `64e701cb8710f9bbfa614be16cb9430dceb5f52ed12a20063c38df21be420734`.
const PRE_M2M4_METRICS: &str = "b3c2d8a01164760899341692e3bc7d552c5a38ddfd7a947873c6b4aa915c340b";

/// The per-estimator fields the `cn0_estimator` change added to the scored results.
const ADDED_FIELDS: [&str; 6] = [
    "median_cn0_nwpr_dbhz",
    "median_cn0_m2m4_dbhz",
    "baseline_cn0_nwpr_dbhz",
    "baseline_cn0_m2m4_dbhz",
    "measured_cn0_nwpr_dbhz",
    "measured_cn0_m2m4_dbhz",
];

fn without_added(v: &mut serde_json::Value) {
    match v {
        serde_json::Value::Object(m) => {
            for k in ADDED_FIELDS {
                m.remove(k);
            }
            m.values_mut().for_each(without_added);
        }
        serde_json::Value::Array(a) => a.iter_mut().for_each(without_added),
        _ => {}
    }
}

/// The reference campaign run with `cn0_estimator = "nwpr"`.
fn nwpr_out() -> &'static PathBuf {
    static OUT: OnceLock<PathBuf> = OnceLock::new();
    OUT.get_or_init(|| {
        let f = fixture();
        let text = std::fs::read_to_string(&f.campaign)
            .unwrap()
            .replace("[scoring]\n", "[scoring]\ncn0_estimator = \"nwpr\"\n");
        assert!(text.contains("cn0_estimator = \"nwpr\""));
        let c = LoadedCampaign::load_text(&text, &f.campaign).unwrap();
        let out = f.dir.join("out-nwpr");
        let _ = std::fs::remove_dir_all(&out);
        let s = run(
            &c,
            &out,
            &RunOptions {
                workers: 4,
                ..Default::default()
            },
        )
        .unwrap();
        assert_eq!(s.cells_run, 12);
        out
    })
}

/// The reference DIGESTs after the `cn0_estimator` change, pinned the way the pre-change one was
/// (`64e701cb8710f9bbfa614be16cb9430dceb5f52ed12a20063c38df21be420734`).
const DIGEST_M2M4: &str = "48a64a85f7ba97ccf286495a9d58a14fbf3c9bf61f2da06b9bf92734a84c090f";
const DIGEST_NWPR: &str = "57c52a06e9727ec1cc159302e48fd215ca1247a8b0edb8df4915565c0977b890";

#[test]
fn the_reference_digests_are_pinned() {
    let f = fixture();
    assert_eq!(f.reference.digest.as_deref(), Some(DIGEST_M2M4));
    let nwpr = std::fs::read_to_string(nwpr_out().join("DIGEST")).unwrap();
    assert_eq!(nwpr.trim(), DIGEST_NWPR);
}

#[test]
fn nwpr_reproduces_the_pre_m2m4_results_exactly() {
    let out = nwpr_out();
    // Every scored result, minus the per-estimator fields this change added, hashes to the
    // value pinned before the change.
    assert_eq!(metrics_digest(out, true), PRE_M2M4_METRICS);
    // In an NWPR run the primary C/N0 fields are the NWPR ones.
    for (_, c) in cells(out).values() {
        assert_eq!(c.cn0_estimator, "nwpr");
        for s in &c.satellites {
            let w = &s.score.whole_run;
            assert_eq!(w.median_cn0_dbhz, w.median_cn0_nwpr_dbhz);
            for e in &s.score.events {
                assert_eq!(e.baseline_cn0_dbhz, e.baseline_cn0_nwpr_dbhz);
                for b in &e.cn0_curve {
                    assert_eq!(b.measured_cn0_dbhz, b.measured_cn0_nwpr_dbhz);
                }
            }
        }
    }
}

/// Record where `a` and `b` differ, skipping the keys in `allowed`.
fn differences(
    a: &serde_json::Value,
    b: &serde_json::Value,
    at: &str,
    allowed: &[&str],
    out: &mut Vec<String>,
) {
    use serde_json::Value as V;
    match (a, b) {
        (V::Object(x), V::Object(y)) => {
            let keys: std::collections::BTreeSet<&String> = x.keys().chain(y.keys()).collect();
            for k in keys {
                // `n` is allowed to differ only as a curve bin's count.
                if allowed.contains(&k.as_str()) || (k == "n" && at.contains(".cn0_curve[")) {
                    continue;
                }
                match (x.get(k), y.get(k)) {
                    (Some(p), Some(q)) => differences(p, q, &format!("{at}.{k}"), allowed, out),
                    _ => out.push(format!("{at}.{k} present in one run only")),
                }
            }
        }
        (V::Array(x), V::Array(y)) if x.len() == y.len() => {
            for (i, (p, q)) in x.iter().zip(y).enumerate() {
                differences(p, q, &format!("{at}[{i}]"), allowed, out);
            }
        }
        _ if a == b => {}
        _ => out.push(at.to_string()),
    }
}

#[test]
fn m2m4_changes_only_the_cn0_derived_fields() {
    let f = fixture();
    let (nwpr, m2m4) = (cells(nwpr_out()), cells(&f.reference_out));
    assert_eq!(nwpr.len(), 12);
    assert_eq!(m2m4.len(), 12);
    // What may differ between the two runs: the cell's identity (the estimator is in the scoring
    // hash, so the key moves) and the figures that follow the primary estimator. Everything else
    // (lock, loss, re-acquisition, availability, jitter, false locks, hand-off, the per-estimator
    // figures themselves) must be identical.
    let allowed = [
        "key",
        "scoring_hash",
        "cn0_estimator",
        "median_cn0_dbhz",
        "baseline_cn0_dbhz",
        "measured_cn0_dbhz",
        "measured_degradation_db",
        "modelled_cn0_dbhz",
        "modelled_degradation_db",
    ];
    let by_name = |m: &BTreeMap<String, (String, CellResult)>| {
        m.values()
            .map(|(_, c)| {
                (
                    format!("{}/{}/{}", c.recording.id, c.frontend.name, c.design.name),
                    serde_json::to_value(c).unwrap(),
                )
            })
            .collect::<BTreeMap<_, _>>()
    };
    let (a, b) = (by_name(&nwpr), by_name(&m2m4));
    let mut diffs = Vec::new();
    for (k, v) in &a {
        differences(v, &b[k], k, &allowed, &mut diffs);
    }
    assert!(diffs.is_empty(), "{diffs:#?}");
    // The two runs really did use different estimators, and the figures moved.
    let mut moved = 0;
    for (k, v) in &a {
        assert_eq!(v["cn0_estimator"], "nwpr");
        assert_eq!(b[k]["cn0_estimator"], "m2m4");
        let at =
            |x: &serde_json::Value| x["satellites"][0]["whole_run"]["median_cn0_dbhz"].as_f64();
        if at(v) != at(&b[k]) {
            moved += 1;
        }
    }
    assert!(moved > 0, "the estimators gave identical medians");
}

/// How many cells a dry run against a copy of the reference output would run. The copy keeps
/// the shared reference untouched, since a run rewrites `campaign.json` and the digest.
fn pending_against_reference(campaign_text: &str, base: &Path) -> (usize, usize) {
    let f = fixture();
    let copy = scratch("stale-copy");
    std::fs::create_dir_all(copy.join("cells")).unwrap();
    for e in std::fs::read_dir(f.reference_out.join("cells"))
        .unwrap()
        .flatten()
    {
        std::fs::copy(e.path(), copy.join("cells").join(e.file_name())).unwrap();
    }
    std::fs::copy(
        f.reference_out.join("hashes.json"),
        copy.join("hashes.json"),
    )
    .unwrap();
    let c = LoadedCampaign::load_text(campaign_text, base).unwrap();
    let dry = run(
        &c,
        &copy,
        &RunOptions {
            dry_run: true,
            ..Default::default()
        },
    )
    .unwrap();
    std::fs::remove_dir_all(&copy).ok();
    (dry.cells_pending, dry.cells_skipped)
}

#[test]
fn changing_the_design_the_conditions_or_the_scoring_reruns_the_affected_cells() {
    let f = fixture();
    let base = f.dir.join("campaign-variant.toml");
    let text = std::fs::read_to_string(&f.campaign).unwrap();
    // Nothing changed: every cell is found.
    assert_eq!(pending_against_reference(&text, &base), (0, 12));

    // A design edit re-runs the cells of that design only (3 recordings x 2 front ends).
    let designs = std::fs::read_to_string(f.dir.join("designs.toml")).unwrap();
    assert!(designs.contains("pll_bw_hz = 15.0"));
    std::fs::write(
        f.dir.join("designs-v2.toml"),
        designs.replace("pll_bw_hz = 15.0", "pll_bw_hz = 14.0"),
    )
    .unwrap();
    let changed = text.replace("designs.toml", "designs-v2.toml");
    assert_eq!(pending_against_reference(&changed, &base), (6, 6));

    // A conditions edit re-runs that recording's cells only (2 front ends x 2 designs). The
    // copies keep every path as written, so only the edited recording's hash moves.
    let v2 = f.dir.join("conds-v2");
    std::fs::create_dir_all(&v2).unwrap();
    for n in ["ramp", "gap", "alias"] {
        let t = std::fs::read_to_string(f.dir.join("conds").join(format!("{n}.toml"))).unwrap();
        let t = if n == "gap" {
            assert!(t.contains("settle_s = 1.0"));
            t.replace("settle_s = 1.0", "settle_s = 1.5")
        } else {
            t
        };
        std::fs::write(v2.join(format!("{n}.toml")), t).unwrap();
    }
    let changed = text.replace("conds/*.toml", "conds-v2/*.toml");
    assert_eq!(pending_against_reference(&changed, &base), (4, 8));

    // A scoring edit re-runs everything; a bar edit re-runs nothing.
    let changed = text.replace("baseline_window_s = 2.0", "baseline_window_s = 2.5");
    assert_eq!(pending_against_reference(&changed, &base), (12, 0));
    let changed = text.replace("min_availability = 0.5", "min_availability = 0.9");
    assert_eq!(pending_against_reference(&changed, &base), (0, 12));
}

#[test]
fn the_cli_runs_checks_and_rebuilds() {
    let f = fixture();
    let exec =
        |v: &[&str]| kshana::iq::cli::execute(&v.iter().map(|s| s.to_string()).collect::<Vec<_>>());
    let msg = exec(&[
        "conditions",
        f.dir.join("conds/ramp.toml").to_str().unwrap(),
    ])
    .unwrap();
    assert!(
        msg.contains("OK: 1 event(s), 2 expected satellite(s)"),
        "{msg}"
    );
    let bad = f.dir.join("bad.json");
    std::fs::write(&bad, "{\"schema\":\"kshana.test-conditions/1\"}").unwrap();
    assert!(matches!(
        exec(&["conditions", bad.to_str().unwrap()]),
        Err(kshana::iq::cli::CommandError::Usage(_))
    ));
    let out = f.reference_out.to_str().unwrap();
    let msg = exec(&[
        "campaign",
        f.campaign.to_str().unwrap(),
        "--out",
        out,
        "--dry-run",
    ])
    .unwrap();
    assert!(msg.contains("12 already done, 0 run now"), "{msg}");
    let msg = exec(&["campaign", "report", out]).unwrap();
    assert!(
        msg.contains(f.reference.digest.as_deref().unwrap()),
        "{msg}"
    );
}

/// A memory figure of this process (kB) from `/proc/self/status` (Linux only).
fn status_kb(key: &str) -> Option<u64> {
    std::fs::read_to_string("/proc/self/status")
        .ok()?
        .lines()
        .find(|l| l.starts_with(key))?
        .split_whitespace()
        .nth(1)?
        .parse()
        .ok()
}

/// Peak resident memory (kB).
fn vm_hwm_kb() -> Option<u64> {
    status_kb("VmHWM:")
}

/// Current resident memory (kB).
fn vm_rss_kb() -> Option<u64> {
    status_kb("VmRSS:")
}

/// Throughput and memory on a longer recording: 60 s, 4 satellites, 4 designs. Run it
/// with `cargo test --release --test iq_campaign -- --ignored --nocapture`. The scorer
/// streams, so peak memory must not grow with the recording length the way keeping every
/// epoch would (about 230 MB for 60 s x 8 channels).
#[test]
#[ignore = "long: run in release on demand"]
fn throughput_and_bounded_memory_on_a_long_recording() {
    let dir = scratch("perf");
    scene(
        &dir,
        "long",
        60.0,
        &[(1, 900.0), (6, -1300.0), (14, 2100.0), (22, -400.0)],
        |_, _| Some(NOMINAL),
    );
    std::fs::write(
        dir.join("long.toml"),
        "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"long\"\npath = \"long.cf32\"\n\
         [[expected]]\nsignal = \"gps-l1ca\"\nids = [1, 6, 14, 22]\n",
    )
    .unwrap();
    std::fs::write(
        dir.join("d.toml"),
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"a\"\n[[design]]\nname = \"b\"\n\
         [design.carrier]\npll_bw_hz = 10.0\n[[design]]\nname = \"c\"\n[design.code]\nbw_hz = 1.0\n\
         [[design]]\nname = \"d\"\n[design.integration]\nspacing_chips = 0.25\n",
    )
    .unwrap();
    std::fs::write(
        dir.join("c.toml"),
        "schema = \"kshana.campaign/1\"\nname = \"perf\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"long.toml\"]\n\
         designs = \"d.toml\"\n",
    )
    .unwrap();
    // Reset the peak-RSS mark so it measures the campaign alone, not the scene synthesis.
    let _ = std::fs::write("/proc/self/clear_refs", "5");
    let before = vm_rss_kb();
    let c = LoadedCampaign::load(&dir.join("c.toml")).unwrap();
    let t0 = std::time::Instant::now();
    let s = run(&c, &dir.join("out"), &RunOptions::default()).unwrap();
    let wall = t0.elapsed().as_secs_f64();
    let channel_samples = 60.0 * FS * 4.0 * 4.0;
    eprintln!(
        "60 s x 4 satellites x 4 designs: {wall:.1} s wall, {:.1} Mchannel-samples/s, {:.2}x real time per (design, satellite) channel set",
        channel_samples / wall / 1e6,
        60.0 / wall
    );
    assert_eq!(s.cells_run, 4);
    if let (Some(a), Some(b)) = (before, vm_hwm_kb()) {
        let grew_mb = (b.saturating_sub(a)) as f64 / 1024.0;
        eprintln!("peak RSS during the campaign: {grew_mb:.0} MB above the RSS before it");
        assert!(grew_mb < 200.0, "peak RSS grew by {grew_mb:.0} MB");
    }
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn epoch_files_are_written_per_cell_and_bound_into_the_cell() {
    use kshana::iq::track::sink::BinaryEpochReader;
    let f = fixture();
    let mut text = std::fs::read_to_string(&f.campaign).unwrap();
    text = text
        .replace("[\"conds/*.toml\"]", "[\"conds/alias.toml\"]")
        .replace("[[frontend]]\nname = \"agc-3bit\"\nbits = 3\n", "")
        .replace("[scoring]", "[run]\nepochs = \"binary\"\n[scoring]");
    let c = LoadedCampaign::load_text(&text, &f.campaign).unwrap();
    let out = f.dir.join("out-epochs");
    let _ = std::fs::remove_dir_all(&out);
    let s = run(&c, &out, &RunOptions::default()).unwrap();
    assert_eq!(s.cells_run, 2);
    for (_, (_, cell)) in cells(&out) {
        let ep = cell.epochs.expect("epochs kept");
        assert_eq!(ep.format, "binary");
        assert_eq!(ep.path, format!("epochs/{}.bin", cell.key));
        let path = out.join(&ep.path);
        assert_eq!(
            kshana::iq::campaign::hash::sha256_file(&path).unwrap(),
            ep.sha256
        );
        let r =
            BinaryEpochReader::new(std::io::BufReader::new(std::fs::File::open(&path).unwrap()))
                .unwrap();
        let h = r.header().clone();
        assert_eq!(h.channels.len(), 1);
        assert_eq!(h.channels[0].design, cell.design.name);
        assert_eq!(h.channels[0].design_hash, cell.design.hash);
        assert_eq!(
            h.recording_sha256.as_deref(),
            Some(cell.recording.sha256.as_str())
        );
        let mut n = 0;
        for rec in r {
            assert_eq!(rec.unwrap().channel, 0);
            n += 1;
        }
        // About one update per millisecond over the 6 s recording.
        assert!((5_500..=6_100).contains(&n), "{n} records");
        assert!(out.join(&ep.events_path).is_file());
    }
    let leftovers: Vec<_> = std::fs::read_dir(out.join("epochs"))
        .unwrap()
        .flatten()
        .filter(|e| e.file_name().to_string_lossy().starts_with('.'))
        .collect();
    assert!(leftovers.is_empty(), "temporary files left: {leftovers:?}");
}

/// The re-acquisition regression scenario: three satellites at 45 dB-Hz with a 2 s
/// noise-only gap (8-10 s) in a 20 s recording, two front ends, and two designs that differ
/// only in `reacquire`. The session's re-acquisition searches run back to back, about 50 ms
/// each, so the built-in limit of 3 failed searches retires a channel about 0.2 s into a
/// gap. The `reacq` design therefore allows 60 searches, about 3 s, to span the gap.
struct Gap20 {
    out: PathBuf,
}

fn gap20() -> &'static Gap20 {
    static G: OnceLock<Gap20> = OnceLock::new();
    G.get_or_init(|| {
        let dir = scratch("gap20");
        scene(
            &dir,
            "gap20",
            20.0,
            &[(3, 1200.0), (11, -2300.0), (22, 800.0)],
            |_, t| (!(8.0..10.0).contains(&t)).then_some(NOMINAL),
        );
        std::fs::write(
            dir.join("gap20.toml"),
            r#"schema = "kshana.test-conditions/1"
[recording]
id = "gap20"
path = "gap20.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [3, 11, 22]
[[event]]
id = "gap"
kind = "outage"
type = "unknown"
onset_s = 8.0
offset_s = 10.0
"#,
        )
        .unwrap();
        std::fs::write(
            dir.join("d.toml"),
            "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"observe\"\n\
             [[design]]\nname = \"reacq\"\n[design.lock]\nreacquire = true\n\
             reacq_window_s = 5.0\n",
        )
        .unwrap();
        std::fs::write(
            dir.join("c.toml"),
            "schema = \"kshana.campaign/1\"\nname = \"gap20\"\ndata_class = \"synthetic\"\n\
             [inputs]\nconditions = [\"gap20.toml\"]\ndesigns = \"d.toml\"\n\
             [[frontend]]\nname = \"raw\"\n[[frontend]]\nname = \"agc-3bit\"\nbits = 3\n",
        )
        .unwrap();
        let out = dir.join("out");
        let c = LoadedCampaign::load(&dir.join("c.toml")).unwrap();
        let s = run(&c, &out, &RunOptions::default()).unwrap();
        assert_eq!(s.cells_run, 4);
        Gap20 { out }
    })
}

/// Each satellite's (lost, reacquired, reacq_time_s) for the gap event of one cell.
fn gap_outcomes(design: &str, fe: &str) -> Vec<(i64, bool, bool, Option<f64>)> {
    let all = cells(&gap20().out);
    cell(&all, "gap20", fe, design)
        .satellites
        .iter()
        .map(|s| {
            let e = &s.score.events[0];
            (s.score.id, e.lost, e.reacquired, e.reacq_time_s)
        })
        .collect()
}

#[test]
fn with_reacquire_on_every_channel_is_back_within_two_seconds_of_the_gap() {
    // The bar: one search (about 50 ms) plus a restarted channel's C/N0 estimator filling
    // (50 windows of 20 ms = 1 s) plus the 0.2 s lock dwell, with margin.
    for fe in ["raw", "agc-3bit"] {
        for (id, lost, reacquired, t) in gap_outcomes("reacq", fe) {
            assert!(lost, "{fe} PRN {id}: a 2 s noise-only gap must lose lock");
            assert!(reacquired, "{fe} PRN {id}: not re-acquired");
            let t = t.unwrap();
            eprintln!("reacq {fe} PRN {id}: {t:.3} s after the gap");
            assert!(
                (0.0..=2.0).contains(&t),
                "{fe} PRN {id}: re-acquired {t} s after the gap"
            );
        }
    }
}

#[test]
fn with_reacquire_off_the_observe_only_outcome_is_pinned() {
    // Pinned from the tracker as it stands (relock without a search is the session's
    // `recovered` transition). If this changes, the tracker changed: update it deliberately.
    for fe in ["raw", "agc-3bit"] {
        let got: Vec<(i64, bool, bool)> = gap_outcomes("observe", fe)
            .into_iter()
            .map(|(id, lost, re, _)| (id, lost, re))
            .collect();
        eprintln!("{fe}: {got:?}");
        assert!(got.iter().all(|&(_, lost, _)| lost), "{fe}: {got:?}");
        let pinned: &[(i64, bool, bool)] = match fe {
            "raw" => &PINNED_OBSERVE_RAW,
            _ => &PINNED_OBSERVE_Q3,
        };
        assert_eq!(got, pinned, "{fe}");
    }
}

// Observe-only (reacquire off). Re-pinned at #45 f3a8ca8b (FLL assist gated to pull-in).
// Before: PRN 22 never relocked in either front end. Now it relocks on the raw chain and
// still does not on the 3-bit AGC chain; PRNs 3 and 11 recover in both.
const PINNED_OBSERVE_RAW: [(i64, bool, bool); 3] =
    [(3, true, true), (11, true, true), (22, true, true)];
const PINNED_OBSERVE_Q3: [(i64, bool, bool); 3] =
    [(3, true, true), (11, true, true), (22, true, false)];

/// GB scale: a single recording of at least 4 GB (200 s of `cf32_le` at 2.5 MHz, one
/// satellite) through one design. Run it with
/// `cargo test --release --test iq_campaign gb_scale -- --ignored --nocapture`.
/// `KSHANA_GB_SECONDS` changes the length. Bars: the campaign completes and tracks
/// throughout; throughput is at least real time (2.5 Msample/s) for one channel; peak
/// memory rises by under 64 MB however long the recording is.
#[test]
#[ignore = "GB scale: run in release on demand (needs ~4 GB of free disk)"]
fn gb_scale_recording_streams_in_bounded_memory() {
    let seconds: f64 = std::env::var("KSHANA_GB_SECONDS")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(200.0);
    let dir = scratch("gb");
    scene(&dir, "big", seconds, &[(9, 1500.0)], |_, _| Some(NOMINAL));
    let bytes = std::fs::metadata(dir.join("big.cf32")).unwrap().len();
    eprintln!("recording: {:.2} GB", bytes as f64 / 1e9);
    if seconds >= 200.0 {
        assert!(bytes >= 4_000_000_000, "{bytes} bytes");
    }
    std::fs::write(
        dir.join("big.toml"),
        "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"big\"\npath = \"big.cf32\"\n\
         [[expected]]\nsignal = \"gps-l1ca\"\nids = [9]\n",
    )
    .unwrap();
    std::fs::write(
        dir.join("c.toml"),
        "schema = \"kshana.campaign/1\"\nname = \"gb\"\ndata_class = \"synthetic\"\n\
         [inputs]\nconditions = [\"big.toml\"]\n",
    )
    .unwrap();
    let c = LoadedCampaign::load(&dir.join("c.toml")).unwrap();
    let _ = std::fs::write("/proc/self/clear_refs", "5");
    let before = vm_rss_kb();
    let t0 = std::time::Instant::now();
    let s = run(&c, &dir.join("out"), &RunOptions::default()).unwrap();
    let wall = t0.elapsed().as_secs_f64();
    let rate = s.samples_processed as f64 / wall;
    eprintln!(
        "GB scale: {} samples in {wall:.1} s = {:.2} Msample/s ({:.2}x real time), incl. hashing",
        s.samples_processed,
        rate / 1e6,
        rate / FS
    );
    assert_eq!(s.cells_run, 1);
    let all = cells(&dir.join("out"));
    let w = &all.values().next().unwrap().1.satellites[0].score.whole_run;
    assert!(w.availability.unwrap() > 0.95, "{w:?}");
    assert!(
        rate >= FS,
        "slower than real time: {:.2} Msample/s",
        rate / 1e6
    );
    if let (Some(a), Some(b)) = (before, vm_hwm_kb()) {
        let grew_mb = b.saturating_sub(a) as f64 / 1024.0;
        eprintln!("peak RSS during the campaign: {grew_mb:.0} MB above the RSS before it");
        assert!(grew_mb < 64.0, "peak RSS grew by {grew_mb:.0} MB");
    }
    std::fs::remove_dir_all(&dir).ok();
}
