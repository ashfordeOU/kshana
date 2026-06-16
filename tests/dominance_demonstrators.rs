// SPDX-License-Identifier: Apache-2.0
//! The two FutureNAV demonstrator scenario kinds — 13494 `impairment-eval` and 13503
//! `quantum-trade` — must be reachable from the engine, reproducible in process, and
//! HONEST: MODELLED-labelled, never claiming validation, with the distribution-shift
//! optimism gap (13494) and the assumed-floor caveat (13503) always surfaced. These
//! are the no-overclaim guards for the bid-facing demonstrators.

use kshana::api::run_toml;
use serde_json::Value;

fn run(src: &str) -> Value {
    let out = run_toml(src).expect("scenario runs");
    serde_json::from_str(&out.json).expect("valid JSON")
}

#[test]
fn impairment_eval_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/impairment-eval.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "impairment-eval must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "impairment-eval");

    // A real detector beats chance (but need not be a perfect oracle on a noisy corpus).
    let auc = v["auc"].as_f64().unwrap();
    assert!((0.5..=1.0).contains(&auc), "AUC {auc} out of [0.5, 1]");

    // Distribution-shift honesty: the optimism gap is reported and self-consistent.
    let ds = &v["distribution_shift"];
    let gap = ds["optimism_gap"].as_f64().unwrap();
    let ai = ds["auc_in"].as_f64().unwrap();
    let ao = ds["auc_out"].as_f64().unwrap();
    assert!(
        (gap - (ai - ao)).abs() < 1e-9,
        "optimism_gap must equal auc_in - auc_out"
    );

    // Honest label: MODELLED + synthetic; never validated / field.
    let label = v["label"].as_str().unwrap();
    assert!(label.contains("MODELLED") && label.to_lowercase().contains("synthetic"));
    assert!(
        !a.json.contains("VALIDATED"),
        "a MODELLED demonstrator must never claim VALIDATED"
    );
}

#[test]
fn quantum_trade_measured_adev_is_data_driven_and_honest() {
    let src = std::fs::read_to_string("scenarios/quantum-trade.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "quantum-trade must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "quantum-trade");
    assert_eq!(v["candidate_source"], "measured-ADEV");

    // The measured candidate floor is DATA-DRIVEN, not an assumed class default.
    assert_eq!(
        v["trade"]["candidate"]["floor_assumed"],
        Value::Bool(false),
        "a measured-ADEV candidate must not be flagged floor_assumed"
    );
    // The classical baseline uses an assumed class → the floor caveat MUST render.
    assert!(
        v["trade"]["floor_caveat"].is_string(),
        "assumed-floor caveat must be present when any row uses an assumed floor"
    );

    let benefit = v["trade"]["timing_benefit_x"].as_f64().unwrap();
    assert!(benefit.is_finite() && benefit > 0.0);
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn quantum_trade_assumed_floor_class_flags_floor_assumed() {
    let src = "kind = \"quantum-trade\"\n\
               timing_threshold_s = 20.0e-9\n\
               position_threshold_m = 100.0\n\
               baseline_clock_class = \"csac\"\n\
               candidate_clock_class = \"optical-lattice\"\n";
    let v = run(src);
    assert_eq!(v["candidate_source"], "quantum-class");
    assert_eq!(
        v["trade"]["candidate"]["floor_assumed"],
        Value::Bool(true),
        "an assumed quantum-class candidate must be flagged floor_assumed"
    );
    assert!(v["trade"]["floor_caveat"].is_string());
}

#[test]
fn quantum_trade_rejects_a_malformed_adev_curve() {
    // Mismatched-length ADEV curve must be a clean error, not a silent bad number.
    let src = "kind = \"quantum-trade\"\n\
               timing_threshold_s = 20.0e-9\n\
               position_threshold_m = 100.0\n\
               baseline_clock_class = \"csac\"\n\
               candidate_adev_taus = [1.0, 10.0]\n\
               candidate_adev_values = [5.0e-16]\n";
    assert!(
        run_toml(src).is_err(),
        "mismatched ADEV curve lengths must error"
    );
}

#[test]
fn space_weather_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/space-weather.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "space-weather must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "space-weather");

    // The exospheric temperature is physical (warm thermosphere, not absurd).
    let t = v["exospheric_temperature_k"].as_f64().unwrap();
    assert!(
        (500.0..2500.0).contains(&t),
        "exospheric T {t} K out of band"
    );

    // Honest label: MODELLED + a calibrated (not data-validated) density model.
    let label = v["label"].as_str().unwrap();
    assert!(label.contains("MODELLED"));
    assert!(
        !a.json.contains("VALIDATED"),
        "a MODELLED model must never claim VALIDATED"
    );

    // The activity density correction is a real, finite, positive multiplier.
    let rows = v["altitudes"].as_array().unwrap();
    assert!(!rows.is_empty());
    for r in rows {
        let f = r["activity_factor"].as_f64().unwrap();
        assert!(f.is_finite() && f > 0.0, "activity_factor {f}");
    }
}

#[test]
fn oem_interop_round_trip_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/oem-interop.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "oem-interop must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "oem-interop");
    assert_eq!(v["source"], "round-trip");

    // The import is the exact inverse of the export, to OEM print precision.
    let p = v["round_trip_max_pos_error_km"].as_f64().unwrap();
    let vel = v["round_trip_max_vel_error_km_s"].as_f64().unwrap();
    assert!(p < 1e-5, "round-trip pos error {p} km");
    assert!(vel < 1e-8, "round-trip vel error {vel} km/s");

    // Honest label: an interop ingest check, never an orbit-accuracy validation.
    let label = v["label"].as_str().unwrap();
    assert!(label.contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}
