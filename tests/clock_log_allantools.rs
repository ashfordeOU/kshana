// SPDX-License-Identifier: AGPL-3.0-only
//! The clock-log comparison pre-registered in tests/fixtures/clock_log/PREREGISTRATION.md.
//!
//! Three seeded synthetic logs (TimeLab ASCII, TAPR TICC with a three-epoch gap, RINEX 3.04
//! clock with a second clock to ignore) written by `scripts/gen_clock_log_ref.py`, which
//! also reads them back with an independent reader written from docs/CLOCK-LOG-FORMATS.md
//! and runs allantools 2024.6 `oadev`, `tdev` and `mtie` on that reader's phase.
//!
//! B1: the engine's grid counts equal the reader's and every phase sample agrees within
//! 1e-13 s. B2: ADEV, TDEV and MTIE agree with allantools within a relative 1e-10 at every
//! averaging factor the engine reports (recorded: met wherever allantools evaluates, not at
//! the whole-record MTIE, which it does not; see RESULTS.md). B3: a telecom-timing series read through
//! `[series.clock_log]` gives the same curves, bit for bit, as the same values given as
//! samples, and the clock kind's `measured` block is opt-in.
use kshana::clock_log::{read_input, ClockLogInput, MeasuredPhaseReport, MEASURED_UNITS};
use serde_json::Value;

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/clock_log");

fn reference() -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{DIR}/reference.json")).unwrap())
        .unwrap()
}

fn input(file: &str) -> ClockLogInput {
    let mut i = ClockLogInput {
        format: match file {
            f if f.starts_with("timelab") => "timelab",
            f if f.starts_with("ticc") => "ticc",
            _ => "rinex-clk",
        }
        .into(),
        path: Some(format!("{DIR}/{file}")),
        ..Default::default()
    };
    match i.format.as_str() {
        "ticc" => {
            i.channel = Some("chA".into());
            i.gaps = Some("linear".into());
        }
        "rinex-clk" => i.clock = Some("G08".into()),
        _ => {}
    }
    i
}

const LOGS: [&str; 3] = [
    "timelab_phase_ns.txt",
    "ticc_timestamp.txt",
    "rinex_clk_304.clk",
];

#[test]
fn b1_each_log_reads_to_the_reference_phase() {
    let r = reference();
    for file in LOGS {
        let want = &r["logs"][file];
        let got = read_input(&input(file)).unwrap();
        assert_eq!(got.tau0_s, want["tau0_s"].as_f64().unwrap(), "{file} tau0");
        assert_eq!(
            got.n_grid as u64,
            want["n_grid"].as_u64().unwrap(),
            "{file} n_grid"
        );
        assert_eq!(
            got.n_missing as u64,
            want["n_missing"].as_u64().unwrap(),
            "{file}"
        );
        assert_eq!(
            got.n_gaps as u64,
            want["n_gaps"].as_u64().unwrap(),
            "{file}"
        );
        assert_eq!(
            got.n_interpolated as u64,
            want["n_interpolated"].as_u64().unwrap(),
            "{file}"
        );
        let phase: Vec<f64> = want["phase_s"]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_f64().unwrap())
            .collect();
        assert_eq!(got.n_used, phase.len(), "{file} n_used");
        let worst = got
            .phase_s
            .iter()
            .zip(&phase)
            .map(|(a, b)| (a - b).abs())
            .fold(0.0_f64, f64::max);
        eprintln!("{file}: largest phase difference {worst:.3e} s");
        assert!(worst <= 1e-13, "{file}: phase differs by {worst:e} s");
    }
}

/// The reference value at `tau`, if allantools reported one there.
fn at(curve: &Value, tau: f64) -> Option<f64> {
    curve.as_array().unwrap().iter().find_map(|p| {
        let t = p[0].as_f64().unwrap();
        ((t - tau).abs() <= 1e-9 * tau).then(|| p[1].as_f64().unwrap())
    })
}

#[test]
fn b2_adev_tdev_and_mtie_agree_with_allantools() {
    let r = reference();
    for file in LOGS {
        let c = &r["logs"][file]["curves"];
        let m = MeasuredPhaseReport::from_phase(read_input(&input(file)).unwrap());
        let mut worst = 0.0_f64;
        let mut unevaluated = Vec::new();
        let mut check = |name: &str, tau: f64, got: f64| {
            let Some(want) = at(&c[name], tau) else {
                unevaluated.push(format!("{name}@{tau}"));
                return;
            };
            let rel = ((got - want) / want).abs();
            worst = worst.max(rel);
            assert!(
                rel <= 1e-10,
                "{file} {name} at {tau} s: {got:e} vs {want:e} ({rel:e})"
            );
        };
        for p in &m.adev {
            check("adev", p.tau_s, p.adev);
        }
        for p in &m.tdev {
            check("tdev", p.tau_s, p.tdev_s);
        }
        for p in &m.mtie {
            check("mtie", p.tau_s, p.mtie_s);
        }
        assert!(!m.adev.is_empty() && !m.tdev.is_empty() && !m.mtie.is_empty());
        eprintln!("{file}: largest relative estimator difference {worst:.3e}; not evaluated by allantools: {unevaluated:?}");
        // Recorded in RESULTS.md: allantools 2024.6 does not evaluate MTIE over the whole
        // record (m = n - 1), which the engine reports, so that one point per log has no
        // oracle value; B2 as worded is not met there.
        let last = m.mtie.last().unwrap().tau_s;
        assert_eq!(unevaluated, vec![format!("mtie@{last}")], "{file}");
    }
}

fn curves(json: &str) -> (Value, Value) {
    let v: Value = serde_json::from_str(json).unwrap();
    (v["mtie"].clone(), v["tdev"].clone())
}

#[test]
fn b3_a_telecom_series_read_from_a_log_equals_the_same_samples() {
    let log = read_input(&input("timelab_phase_ns.txt")).unwrap();
    let samples: Vec<String> = log
        .time_s
        .iter()
        .zip(&log.phase_s)
        .map(|(t, x)| format!("[{t:?}, {:?}]", x * 1e9))
        .collect();
    let base = "kind = \"telecom-timing\"\nmasks = [\"g8262-eec-option-1\"]\nbudgets = []\n";
    let by_log = format!(
        "{base}[series.clock_log]\nformat = \"timelab\"\npath = \"{DIR}/timelab_phase_ns.txt\"\n"
    );
    let by_samples = format!("{base}[series]\nsamples = [{}]\n", samples.join(", "));
    let a = kshana::api::run_toml(&by_log).unwrap();
    let b = kshana::api::run_toml(&by_samples).unwrap();
    assert_eq!(curves(&a.json), curves(&b.json));
    let va: Value = serde_json::from_str(&a.json).unwrap();
    let vb: Value = serde_json::from_str(&b.json).unwrap();
    assert_eq!(va["clock_log"]["format"], "timelab");
    assert_eq!(va["clock_log"]["n_used"], 4097);
    assert!(va["units"]["clock_log.n_used"].is_object());
    assert!(vb.get("clock_log").is_none(), "no log, no block");
    assert!(vb["units"].get("clock_log.n_used").is_none());
    // A log and samples together are refused.
    let both = format!(
        "{base}[series]\nsamples = [[0.0, 1.0], [1.0, 2.0]]\n[series.clock_log]\nformat = \"timelab\"\ntext = \"1\\n2\\n\"\n"
    );
    assert!(kshana::api::run_toml(&both).is_err());
}

fn clock_scenario() -> String {
    std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/scenarios/clock-holdover.toml"
    ))
    .unwrap()
}

#[test]
fn b3_the_clock_kind_measured_block_is_opt_in() {
    let plain = kshana::api::run_toml(&clock_scenario()).unwrap();
    let v: Value = serde_json::from_str(&plain.json).unwrap();
    assert!(v.get("measured").is_none());
    let with = format!(
        "{}\n[clock_log]\nformat = \"ticc\"\npath = \"{DIR}/ticc_timestamp.txt\"\nchannel = \"chA\"\ngaps = \"linear\"\n",
        clock_scenario()
    );
    let out = kshana::api::run_toml(&with).unwrap();
    let w: Value = serde_json::from_str(&out.json).unwrap();
    let m = &w["measured"];
    assert_eq!(m["log"]["format"], "ticc");
    assert_eq!(m["log"]["n_interpolated"], 3);
    assert_eq!(m["input_sha256"].as_str().unwrap().len(), 64);
    // The simulated run is the same with or without the log.
    assert_eq!(w["quantum"], v["quantum"]);
    assert_eq!(w["classical"], v["classical"]);
    assert_eq!(w["scenario_hash"], v["scenario_hash"]);
    for p in kshana::field_schema::numeric_leaf_paths(&serde_json::json!({ "measured": m })) {
        assert!(
            MEASURED_UNITS.iter().any(|u| u.path == p),
            "no unit for {p}"
        );
        assert!(
            w["units"].get(&p).is_some(),
            "{p} missing from the report's units"
        );
    }
    // A measured log is one record: an ensemble is refused.
    let ens = format!("runs = 3\n{with}");
    assert!(kshana::api::run_toml(&ens)
        .unwrap_err()
        .contains("runs = 1"));
}
