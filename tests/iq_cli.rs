// SPDX-License-Identifier: AGPL-3.0-only
//! The `kshana iq` signal-processing commands (`kshana::iq::cli`): `scene`, `acquire`,
//! `track`, `sweep` and `labfit`.
//!
//! References: the scene's own truth sidecar is the independent oracle for the receiver
//! commands — acquisition must recover each injected code phase and Doppler, and tracking
//! must converge to the injected Doppler. The sweep's lock metrics must order sensibly with
//! loop bandwidth (a wider carrier loop locks at least as often). The labfit command is
//! driven end to end from a synthetic RINEX log whose generating parameters are known, and
//! its four report files must be written.

use kshana::iq::cli::run;
use kshana::iq::scene::truth_from_csv;
use std::path::PathBuf;

/// A fresh scratch folder for one test.
fn scratch(name: &str) -> PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!(
        "kshana-iq-cli-{}-{uniq}-{name}",
        std::process::id()
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn args(v: &[&str]) -> Vec<String> {
    v.iter().map(|s| s.to_string()).collect()
}

/// `scene` writes the samples, the sidecar and the truth; `info` reads it back.
#[test]
fn scene_writes_samples_sidecar_and_truth() {
    let dir = scratch("scene");
    let out = dir.join("s.cf32").display().to_string();
    let truth = format!("{out}.truth.csv");
    assert_eq!(
        run(&args(&[
            "scene",
            &out,
            "--rate",
            "2046000",
            "--duration",
            "0.1",
            "--signal",
            "gps-l1ca",
            "--prn",
            "3,11",
            "--doppler",
            "1000,-1500",
            "--cn0",
            "48",
            "--no-noise",
            "--seed",
            "5",
        ])),
        0
    );
    // The IQ file holds duration * rate interleaved cf32 samples (8 bytes each).
    let bytes = std::fs::metadata(&out).unwrap().len();
    assert_eq!(bytes, (0.1 * 2_046_000.0) as u64 * 8);
    // The sidecar describes the format.
    let sc: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(format!("{out}.json")).unwrap()).unwrap();
    assert_eq!(sc["format"], "cf32_le");
    assert_eq!(sc["sample_rate_hz"], 2.046e6);
    // Two satellites in the truth, both visible at t = 0.
    let records = truth_from_csv(&std::fs::read_to_string(&truth).unwrap()).unwrap();
    let t0: Vec<_> = records.iter().filter(|r| r.t_s == 0.0).collect();
    assert_eq!(t0.len(), 2);
    assert!(t0.iter().all(|r| r.visible));
}

/// The injected code phase and Doppler read back from the truth at t = 0, per PRN.
fn truth_at_zero(path: &str) -> std::collections::HashMap<u32, (f64, f64)> {
    truth_from_csv(&std::fs::read_to_string(path).unwrap())
        .unwrap()
        .into_iter()
        .filter(|r| r.t_s == 0.0)
        .map(|r| (r.sat_id, (r.code_phase_chips, r.doppler_hz)))
        .collect()
}

/// `acquire` recovers each injected code phase and Doppler from a noise-free scene.
#[test]
fn acquire_recovers_injected_code_phase_and_doppler() {
    let dir = scratch("acq");
    let iq = dir.join("s.cf32").display().to_string();
    let truth = format!("{iq}.truth.csv");
    let acq_json = dir.join("acq.json").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.05",
            "--signal",
            "gps-l1ca",
            "--prn",
            "5,12",
            "--doppler",
            "1000,-1500",
            "--cn0",
            "50",
            "--no-noise",
        ])),
        0
    );
    assert_eq!(
        run(&args(&[
            "acquire",
            &iq,
            "--signal",
            "gps-l1ca",
            "--prn",
            "5,12",
            "--doppler-max",
            "4000",
            "--doppler-step",
            "250",
            "--json",
            &acq_json,
        ])),
        0
    );
    let want = truth_at_zero(&truth);
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&acq_json).unwrap()).unwrap();
    let dets = v["detections"].as_array().unwrap();
    assert_eq!(dets.len(), 2);
    // PRN order follows --prn: 5 then 12.
    for (det, prn) in dets.iter().zip([5u32, 12]) {
        assert!(det["acquired"].as_bool().unwrap(), "{det}");
        let (want_phase, want_dopp) = want[&prn];
        let dopp = det["doppler_hz"].as_f64().unwrap();
        assert!(
            (dopp - want_dopp).abs() <= 250.0,
            "doppler {dopp} vs {want_dopp}"
        );
        // Code phase within one chip (acquisition resolves to 0.5 chip at 2x oversampling),
        // wrapped on the 1023-chip period.
        let phase = det["code_phase_chips"].as_f64().unwrap();
        let err = ((phase - want_phase + 511.5).rem_euclid(1023.0) - 511.5).abs();
        assert!(err <= 1.0, "code phase {phase} vs {want_phase} (err {err})");
    }
}

/// A broadcast-ephemeris scene (`--nav`) recovers the true per-satellite geometry: the truth
/// sidecar lists several visible GPS satellites with physically sensible pseudorange and
/// Doppler, matching the library broadcast-scene path.
#[test]
fn broadcast_nav_scene_recovers_geometry() {
    let dir = scratch("nav");
    let iq = dir.join("b.cf32").display().to_string();
    let truth = format!("{iq}.truth.csv");
    let nav = "tests/fixtures/igs/BRDC00WRD_R_20181330000_01D_GN.rnx";
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--window",
            "0.002",
            "--nav",
            nav,
            "--rx-pos",
            "50.09,8.66,150",
            "--start",
            "600",
            "--cn0",
            "50",
            "--no-noise",
            "--mask",
            "10",
        ])),
        0
    );
    let recs = truth_from_csv(&std::fs::read_to_string(&truth).unwrap()).unwrap();
    let epoch0: Vec<_> = recs.iter().filter(|r| r.t_s == 0.0 && r.visible).collect();
    assert!(epoch0.len() >= 6, "{} visible", epoch0.len());
    for r in &epoch0 {
        assert!(
            r.pseudorange_m > 1.9e7 && r.pseudorange_m < 2.7e7,
            "PRN {} pseudorange {}",
            r.sat_id,
            r.pseudorange_m
        );
        assert!(
            r.doppler_hz.abs() < 5000.0,
            "PRN {} doppler {}",
            r.sat_id,
            r.doppler_hz
        );
    }
}

/// The `frontend` command filters a recording and the result is still acquirable, and the
/// inline front-end flags on `acquire` apply the same stages before processing.
#[test]
fn frontend_command_and_inline_flags_filter_and_acquire() {
    let dir = scratch("fe");
    let iq = dir.join("s.cf32").display().to_string();
    let filt = dir.join("f.cf32").display().to_string();
    let acq_json = dir.join("acq.json").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.05",
            "--signal",
            "gps-l1ca",
            "--prn",
            "11",
            "--doppler",
            "900",
            "--cn0",
            "50",
        ])),
        0
    );
    // frontend command: 3-bit quantiser with AGC, writes a new recording + sidecar.
    assert_eq!(
        run(&args(&["frontend", &iq, &filt, "--bits", "3", "--agc",])),
        0
    );
    assert!(std::path::Path::new(&filt).exists());
    assert!(std::path::Path::new(&format!("{filt}.json")).exists());
    assert_eq!(
        run(&args(&[
            "acquire",
            &filt,
            "--signal",
            "gps-l1ca",
            "--prn",
            "11",
            "--doppler-max",
            "4000",
            "--doppler-step",
            "250",
            "--json",
            &acq_json,
        ])),
        0
    );
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&acq_json).unwrap()).unwrap();
    assert!(v["detections"][0]["acquired"].as_bool().unwrap(), "{v}");

    // Inline front-end flags on acquire give an equivalent detection from the raw recording.
    let acq2 = dir.join("acq2.json").display().to_string();
    assert_eq!(
        run(&args(&[
            "acquire",
            &iq,
            "--signal",
            "gps-l1ca",
            "--prn",
            "11",
            "--doppler-max",
            "4000",
            "--doppler-step",
            "250",
            "--bits",
            "3",
            "--agc",
            "--json",
            &acq2,
        ])),
        0
    );
    let v2: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&acq2).unwrap()).unwrap();
    assert!(v2["detections"][0]["acquired"].as_bool().unwrap(), "{v2}");
}

/// The channel flags parse and apply: a scene with ionosphere, scintillation and multipath
/// runs, and `--nlos` without a reflected path is a usage error.
#[test]
fn scene_channel_flags_apply_and_validate() {
    let dir = scratch("chan");
    let iq = dir.join("c.cf32").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.01",
            "--signal",
            "gps-l1ca",
            "--prn",
            "5",
            "--cn0",
            "48",
            "--no-noise",
            "--iono-stec",
            "25",
            "--tropo",
            "--s4",
            "0.5",
            "--multipath-height",
            "2.0",
            "--multipath-ground",
            "wet",
        ])),
        0
    );
    // --nlos needs a reflected path.
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.01",
            "--signal",
            "gps-l1ca",
            "--prn",
            "5",
            "--no-noise",
            "--nlos",
        ])),
        2
    );
    // Two ionosphere sources at once is a usage error.
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.01",
            "--signal",
            "gps-l1ca",
            "--prn",
            "5",
            "--no-noise",
            "--iono-stec",
            "10",
            "--iono-klobuchar",
        ])),
        2
    );
}

/// A scene written as SigMF (`--format sigmf`) round-trips: `acquire` reads the
/// `.sigmf-meta`/`.sigmf-data` pair back and recovers the injected Doppler and code phase.
#[test]
fn scene_sigmf_round_trips_through_acquire() {
    let dir = scratch("sigmf");
    let meta = dir.join("s.sigmf-meta").display().to_string();
    let data = dir.join("s.sigmf-data").display().to_string();
    let truth = format!("{meta}.truth.csv");
    let acq_json = dir.join("acq.json").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &meta,
            "--rate",
            "2046000",
            "--duration",
            "0.05",
            "--signal",
            "gps-l1ca",
            "--prn",
            "7,19",
            "--doppler",
            "800,-1200",
            "--cn0",
            "50",
            "--no-noise",
            "--format",
            "sigmf",
        ])),
        0
    );
    // The SigMF pair and a readable metadata document exist.
    assert!(std::path::Path::new(&data).exists(), "no sigmf-data");
    let meta_json: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&meta).unwrap()).unwrap();
    assert_eq!(meta_json["global"]["core:datatype"], "cf32_le");
    assert!(meta_json["annotations"].as_array().unwrap().len() >= 2);

    assert_eq!(
        run(&args(&[
            "acquire",
            &meta,
            "--signal",
            "gps-l1ca",
            "--prn",
            "7,19",
            "--doppler-max",
            "4000",
            "--doppler-step",
            "250",
            "--json",
            &acq_json,
        ])),
        0
    );
    let want = truth_at_zero(&truth);
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&acq_json).unwrap()).unwrap();
    let dets = v["detections"].as_array().unwrap();
    assert_eq!(dets.len(), 2);
    for (det, prn) in dets.iter().zip([7u32, 19]) {
        assert!(det["acquired"].as_bool().unwrap(), "{det}");
        let (want_phase, want_dopp) = want[&prn];
        let dopp = det["doppler_hz"].as_f64().unwrap();
        assert!(
            (dopp - want_dopp).abs() <= 250.0,
            "doppler {dopp} vs {want_dopp}"
        );
        let phase = det["code_phase_chips"].as_f64().unwrap();
        let err = ((phase - want_phase + 511.5).rem_euclid(1023.0) - 511.5).abs();
        assert!(err <= 1.0, "code phase {phase} vs {want_phase} (err {err})");
    }
}

/// `track` converges to the injected Doppler and holds phase lock on a noise-free scene.
#[test]
fn track_converges_to_injected_doppler() {
    let dir = scratch("track");
    let iq = dir.join("s.cf32").display().to_string();
    let json = dir.join("track.json").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "0.8",
            "--signal",
            "gps-l1ca",
            "--prn",
            "9",
            "--doppler",
            "1200",
            "--cn0",
            "50",
            "--no-noise",
        ])),
        0
    );
    assert_eq!(
        run(&args(&[
            "track", &iq, "--signal", "gps-l1ca", "--prn", "9", "--json", &json,
        ])),
        0
    );
    let v: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&json).unwrap()).unwrap();
    let epochs = v["channels"][0]["epochs"].as_array().unwrap();
    assert!(epochs.len() > 500);
    // The last epoch's Doppler is within a few Hz of the injected 1200 Hz.
    let last = epochs.last().unwrap();
    assert!(
        (last["doppler_hz"].as_f64().unwrap() - 1200.0).abs() < 5.0,
        "final doppler {last}"
    );
    // After convergence the loop reports phase lock at the end of the run.
    assert!(last["phase_lock"].as_bool().unwrap(), "{last}");
}

/// `track` and `sweep` apply the front-end flags: running either with `--notch --bits 2`
/// gives exactly the output of running it without flags on the file `iq frontend` writes
/// for the same flags (the 2-bit quantiser's levels are exact in cf32), and differs from
/// running it on the unfiltered recording.
#[test]
fn track_and_sweep_apply_the_front_end_flags() {
    let dir = scratch("fe-track");
    let raw = dir.join("s.cf32").display().to_string();
    let filtered = dir.join("f.cf32").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &raw,
            "--rate",
            "2046000",
            "--duration",
            "0.5",
            "--signal",
            "gps-l1ca",
            "--prn",
            "9",
            "--doppler",
            "1200",
            "--cn0",
            "50",
            "--seed",
            "3",
        ])),
        0
    );
    let fe = ["--notch", "--bits", "2"];
    let mut fe_args = vec!["frontend", raw.as_str(), filtered.as_str()];
    fe_args.extend(fe);
    assert_eq!(run(&args(&fe_args)), 0);

    for cmd in ["track", "sweep"] {
        let out = |name: &str| dir.join(format!("{cmd}.{name}.json")).display().to_string();
        let (plain, inline, offline) = (out("plain"), out("inline"), out("offline"));
        let base = |input: &str, json: &str, with_fe: bool| {
            let mut v = vec![
                cmd,
                input,
                "--signal",
                "gps-l1ca",
                "--prn",
                "9",
                "--acq-coherent",
                "4",
            ];
            if with_fe {
                v.extend(fe);
            }
            v.extend(["--json", json]);
            run(&args(&v))
        };
        assert_eq!(base(&raw, &plain, false), 0, "{cmd} plain");
        assert_eq!(base(&raw, &inline, true), 0, "{cmd} with front end");
        assert_eq!(
            base(&filtered, &offline, false),
            0,
            "{cmd} on filtered file"
        );
        let read = |p: &str| std::fs::read_to_string(p).unwrap();
        assert_eq!(
            read(&inline),
            read(&offline),
            "{cmd}: inline front end differs from the iq frontend output"
        );
        assert_ne!(
            read(&inline),
            read(&plain),
            "{cmd}: the front-end flags had no effect"
        );
    }
}

/// Regression for the tracking hand-off default. With a one-period (1 ms) initialising
/// search the Doppler bins are ~667 Hz wide, and on this scene PRN 17 (injected -2400 Hz)
/// is handed off ~267 Hz off, outside the FLL's pull-in: it false-locks ~500 Hz away while
/// reporting a clean track. The default is now auto (≈4 ms coherent, 4 periods for this
/// 1 ms code, ~167 Hz bins), which locks it. Both halves are asserted, so the test fails if
/// the default ever reverts to one period, and `--acq-coherent 1` is pinned as the opt-out
/// that reproduces the old behaviour. (`docs/design/evidence/iq-track-acq-default/` has
/// the seeded 180-channel sweep behind the change.)
#[test]
fn track_default_handoff_does_not_false_lock_where_one_period_did() {
    let dir = scratch("track-default");
    let iq = dir.join("s.cf32").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "1.5",
            "--signal",
            "gps-l1ca",
            "--prn",
            "3,17",
            "--doppler",
            "1250,-2400",
            "--cn0",
            "45",
            "--seed",
            "7",
        ])),
        0
    );
    let final_doppler = |extra: &[&str], name: &str| -> f64 {
        let json = dir.join(name).display().to_string();
        let mut a = vec![
            "track", &iq, "--signal", "gps-l1ca", "--prn", "17", "--json", &json,
        ];
        a.extend_from_slice(extra);
        assert_eq!(run(&args(&a)), 0, "track {extra:?}");
        let v: serde_json::Value =
            serde_json::from_str(&std::fs::read_to_string(&json).unwrap()).unwrap();
        let epochs = v["channels"][0]["epochs"].as_array().unwrap();
        epochs.last().unwrap()["doppler_hz"].as_f64().unwrap()
    };
    let auto = final_doppler(&[], "auto.json");
    assert!(
        (auto + 2400.0).abs() < 25.0,
        "default hand-off: final Doppler {auto} Hz, injected -2400 Hz"
    );
    let one = final_doppler(&["--acq-coherent", "1"], "one.json");
    assert!(
        (one + 2400.0).abs() > 400.0,
        "--acq-coherent 1 no longer false-locks this channel (final {one} Hz); the scene no \
         longer exercises the regression"
    );
}

/// The auto hand-off length per signal family. Acquisition integrates in FULL code periods
/// (primary times secondary length: its replica is the whole tiered code), so the auto rule
/// counts those: 4 periods for the untiered 1 ms codes, 1 for every code whose full period
/// is already 4 ms or longer, including the tiered GPS L5, Galileo E5a and E1-C codes whose
/// PRIMARY period is shorter. Every signal ends up with at least ~4 ms coherent, and none
/// with more than one full period beyond what reaches 4 ms.
#[test]
fn auto_handoff_coherent_length_per_signal_family() {
    use kshana::iq::acq::{auto_coherent_periods, AUTO_COHERENT_S};
    use kshana::iq::cli::{build_code, signal_names};
    use kshana::iq::SpreadingCode;
    let expected: &[(&str, usize)] = &[
        ("gps-l1ca", 4),
        ("beidou-b1i", 4),
        ("glonass-l1of", 4),
        ("galileo-e1b", 1),
        ("beidou-b1c", 1),
        ("gps-l2c", 1),
        ("gps-l5i", 1),
        ("gps-l5q", 1),
        ("galileo-e5a-i", 1),
        ("galileo-e5a-q", 1),
        ("galileo-e1c", 1),
    ];
    // Every accepted signal is pinned here, so a new signal must state its expectation.
    let mut named: Vec<&str> = expected.iter().map(|(s, _)| *s).collect();
    let mut all: Vec<&str> = signal_names().to_vec();
    named.sort_unstable();
    all.sort_unstable();
    assert_eq!(named, all, "pin the auto hand-off length of every signal");
    for &(signal, periods) in expected {
        let code = build_code(signal, 1).unwrap();
        let t = code.period_s();
        let n = auto_coherent_periods(t);
        assert_eq!(n, periods, "{signal}: full period {t} s");
        let coherent = n as f64 * t;
        assert!(
            coherent >= AUTO_COHERENT_S - 1e-9,
            "{signal}: {coherent} s coherent is below the ~4 ms hand-off"
        );
        assert!(
            n == 1 || coherent < AUTO_COHERENT_S + t,
            "{signal}: {n} periods overshoot ~4 ms by a whole period"
        );
    }
}

/// `sweep` reports one row per (design, PRN), and a wider carrier loop locks at least as
/// often as a narrower one on the same recording.
#[test]
fn sweep_orders_lock_fraction_with_carrier_bandwidth() {
    let dir = scratch("sweep");
    let iq = dir.join("s.cf32").display().to_string();
    let csv = dir.join("sweep.csv").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &iq,
            "--rate",
            "2046000",
            "--duration",
            "1.0",
            "--signal",
            "gps-l1ca",
            "--prn",
            "6",
            "--doppler",
            "800",
            "--cn0",
            "44",
            "--seed",
            "2",
        ])),
        0
    );
    assert_eq!(
        run(&args(&[
            "sweep",
            &iq,
            "--signal",
            "gps-l1ca",
            "--prn",
            "6",
            "--pll-bw",
            "6,20",
            "--json",
            &dir.join("sweep.json").display().to_string(),
            "--csv",
            &csv,
        ])),
        0
    );
    let rows: Vec<String> = std::fs::read_to_string(&csv)
        .unwrap()
        .lines()
        .skip(1)
        .map(str::to_string)
        .collect();
    assert_eq!(rows.len(), 2, "two designs");
    let lock = |row: &str| -> f64 { row.split(',').nth(5).unwrap().parse().unwrap() };
    // Rows are design-major: pll6 first, pll20 second.
    assert!(lock(&rows[1]) >= lock(&rows[0]), "{rows:?}");
}

/// `labfit` runs end to end from a synthetic RINEX scenario and writes its four reports.
#[test]
fn labfit_runs_from_a_synthetic_rinex_scenario() {
    use kshana::iq::labfit::schema::{Conditions, FitCfg, LabFitScenario};
    use kshana::iq::labfit::synth::{synthesize_timeline, SynthSpec};
    use kshana::iq::labfit::{model::ModelKind, schema::RunCfg};
    use kshana::receiver_trust::scenario::{FileSource, LogCfg};
    use kshana::receiver_trust::LogFormat;

    let dir = scratch("labfit");
    let sats: Vec<(String, f64)> = [(0usize, 42.0), (1, 45.0), (2, 48.0)]
        .iter()
        .map(|&(i, n)| (format!("G{:02}", i + 3), n))
        .collect();
    let conds: Vec<Conditions> = [(1.0f64, 0.5f64), (2.0, 1.0), (0.5, 1.5)]
        .iter()
        .map(|&(up, down)| ramp(up, down))
        .collect();
    let mut runs = Vec::new();
    for (i, c) in conds.iter().enumerate() {
        let tl = synthesize_timeline(
            ModelKind::Empirical,
            &[30.0, 4.0, 1.5, 3.0],
            &Default::default(),
            2.0,
            c,
            &SynthSpec {
                sats: sats.clone(),
                epoch_s: 1.0,
                run_end_s: 200.0,
                cn0_noise_db: 0.0,
                threshold_jitter_db: 0.0,
                seed: i as u64 + 1,
            },
        );
        runs.push(RunCfg {
            label: format!("run-{i}"),
            log: LogCfg {
                format: LogFormat::Rinex,
                source: FileSource {
                    text: Some(rinex_text(&tl)),
                    ..FileSource::default()
                },
                nav: None,
            },
            conditions: c.clone(),
        });
    }
    let scenario = LabFitScenario {
        kind: Some("iq-labfit".into()),
        name: Some("cli smoke".into()),
        fit: FitCfg {
            bootstrap: 0,
            folds: 0,
            ..FitCfg::default()
        },
        runs,
        ..LabFitScenario::default()
    };
    let toml_path = dir.join("labfit.toml");
    std::fs::write(&toml_path, toml::to_string(&scenario).unwrap()).unwrap();

    assert_eq!(run(&args(&["labfit", &toml_path.display().to_string()])), 0);
    for ext in [
        "labfit.json",
        "residuals.csv",
        "predictions.csv",
        "labfit.md",
    ] {
        let p = dir.join(format!("labfit.{ext}"));
        assert!(p.exists(), "missing {}", p.display());
    }
    let report: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(dir.join("labfit.labfit.json")).unwrap())
            .unwrap();
    assert_eq!(report["kind"], "iq-labfit");
}

/// Usage errors return exit code 2; a missing scenario file returns 1.
#[test]
fn error_paths_return_the_documented_codes() {
    let dir = scratch("errs");
    // No positional argument.
    assert_eq!(run(&args(&["scene", "--rate", "2046000"])), 2);
    // Unknown signal.
    let out = dir.join("x.cf32").display().to_string();
    assert_eq!(
        run(&args(&[
            "scene",
            &out,
            "--rate",
            "2046000",
            "--duration",
            "0.01",
            "--signal",
            "nope",
            "--prn",
            "1",
        ])),
        2
    );
    // A missing recording for acquire is a run error.
    assert_eq!(
        run(&args(&[
            "acquire",
            &dir.join("missing.cf32").display().to_string(),
            "--signal",
            "gps-l1ca",
            "--prn",
            "1",
            "--format",
            "cf32_le",
            "--rate",
            "2046000",
        ])),
        1
    );
    // labfit on a missing scenario is a run error.
    assert_eq!(
        run(&args(&[
            "labfit",
            &dir.join("none.toml").display().to_string()
        ])),
        1
    );
}

// --- helpers mirroring the synthetic scenario in tests/iq_labfit.rs ---

/// A ramp up at `up` dB/s to a 40 dB peak, a hold, and a ramp down at `down` dB/s, onset
/// 20 s, offset 150 s (C/N0-drop level).
fn ramp(up: f64, down: f64) -> kshana::iq::labfit::schema::Conditions {
    use kshana::iq::labfit::schema::{Conditions, Interp, LevelKind, LevelPoint};
    let (onset, offset, peak) = (20.0, 150.0, 40.0);
    Conditions {
        onset_s: onset,
        offset_s: Some(offset),
        level_kind: LevelKind::Cn0Drop,
        levels: vec![
            LevelPoint {
                t_s: onset,
                level_db: 0.0,
            },
            LevelPoint {
                t_s: onset + peak / up,
                level_db: peak,
            },
            LevelPoint {
                t_s: offset - peak / down,
                level_db: peak,
            },
            LevelPoint {
                t_s: offset,
                level_db: 0.0,
            },
        ],
        interp: Interp::Linear,
        jammer_type: None,
        doppler_rate_hz_per_s: 0.0,
        code_slew_chips_per_s: 0.0,
    }
}

/// A minimal RINEX 3.04 observation file carrying one S1C (C/N0) column per epoch, matching
/// the `receiver-trust` RINEX reader.
fn rinex_text(tl: &kshana::receiver_trust::Timeline) -> String {
    let mut s = String::new();
    let h = |s: &mut String, body: &str, label: &str| s.push_str(&format!("{body:<60}{label}\n"));
    h(
        &mut s,
        "     3.04           OBSERVATION DATA    G (GPS)",
        "RINEX VERSION / TYPE",
    );
    h(&mut s, "G    1 S1C", "SYS / # / OBS TYPES");
    h(&mut s, "     1.000", "INTERVAL");
    h(
        &mut s,
        "  2024     9    11     0     0    0.0000000     GPS",
        "TIME OF FIRST OBS",
    );
    h(&mut s, "", "END OF HEADER");
    for e in &tl.epochs {
        let (hh, mm, ss) = (
            (e.t_s / 3600.0).floor(),
            ((e.t_s % 3600.0) / 60.0).floor(),
            e.t_s % 60.0,
        );
        s.push_str(&format!(
            "> 2024 09 11 {:02} {:02} {:10.7}  0 {:2}\n",
            hh as u32,
            mm as u32,
            ss,
            e.cn0.len()
        ));
        for c in &e.cn0 {
            s.push_str(&format!("{}{:14.3}  \n", c.sat, c.cn0_dbhz));
        }
    }
    s
}
