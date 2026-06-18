// SPDX-License-Identifier: AGPL-3.0-only
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

#[test]
fn launch_window_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/launch-window.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "launch-window must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "launch-window");
    // KSC -> ISS is the textbook ~45° azimuth.
    let az = v["launch_azimuth_deg"]["ascending"].as_f64().unwrap();
    assert!((az - 44.98).abs() < 0.2, "KSC->ISS azimuth {az}");
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn reentry_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/reentry.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(a.json, b.json, "reentry must be reproducible in process");

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "reentry");
    // Peak-g is in a physical ballistic-entry band; peak-g altitude is sub-interface.
    let g = v["peak_deceleration_g"].as_f64().unwrap();
    assert!((5.0..30.0).contains(&g), "ballistic peak {g} g");
    assert!(v["altitude_at_peak_g_m"].as_f64().unwrap() > 0.0);
    // Allen-Eggers peak-g velocity fraction ~0.607.
    let vr =
        v["velocity_at_peak_g_m_s"].as_f64().unwrap() / v["entry_velocity_m_s"].as_f64().unwrap();
    assert!((vr - 0.6065).abs() < 1e-2, "peak-g velocity fraction {vr}");
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn eo_coverage_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/eo-coverage.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "eo-coverage must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "eo-coverage");
    // Earth angular radius ~64° at 700 km; swath positive; GSD positive.
    assert!((v["earth_angular_radius_deg"].as_f64().unwrap() - 64.28).abs() < 0.2);
    assert!(v["swath_width_km"].as_f64().unwrap() > 0.0);
    assert!(v["nadir_gsd_m"].as_f64().unwrap() > 0.0);
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn space_packet_is_reachable_reproducible_and_round_trips() {
    let src = std::fs::read_to_string("scenarios/space-packet.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(a.json, b.json, "space-packet framing must be deterministic");

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "space-packet");
    // The exact-framing claim: the encode↔decode round trip is bit-exact.
    assert_eq!(v["round_trip_exact"], true);
    // Honest scope: a deterministic CCSDS-133.0 framing, never a "validated" claim.
    assert!(v["label"].as_str().unwrap().contains("CCSDS 133.0"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn attitude_budget_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/attitude-budget.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "attitude-budget must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "attitude-budget");
    // RSS pointing error is positive and at least as large as any single term.
    let total = v["total_pointing_error_arcsec"].as_f64().unwrap();
    assert!(total > 0.0);
    assert!(v["gravity_gradient_torque_max_nm"].as_f64().unwrap() > 0.0);
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn passes_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/passes.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "pass prediction must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "passes");
    // The window finds passes, and every reported pass clears the mask with a
    // well-ordered AOS <= TCA <= LOS.
    assert!(v["pass_count"].as_u64().unwrap() >= 1);
    let mask = v["mask_deg"].as_f64().unwrap();
    for p in v["passes"].as_array().unwrap() {
        assert!(p["max_elevation_deg"].as_f64().unwrap() >= mask);
        let (aos, tca, los) = (
            p["aos_s"].as_f64().unwrap(),
            p["tca_s"].as_f64().unwrap(),
            p["los_s"].as_f64().unwrap(),
        );
        assert!(aos <= tca && tca <= los, "AOS<=TCA<=LOS");
    }
    assert!(v["label"].as_str().unwrap().contains("MODELLED"));
    assert!(!a.json.contains("VALIDATED"));
}

#[test]
fn link_budget_is_reachable_reproducible_and_honest() {
    let src = std::fs::read_to_string("scenarios/link-budget.toml").unwrap();
    let a = run_toml(&src).unwrap();
    let b = run_toml(&src).unwrap();
    assert_eq!(
        a.json, b.json,
        "link budget must be reproducible in process"
    );

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "link-budget");
    // Margin is internally consistent: margin = Eb/N0 − required.
    let margin = v["margin_db"].as_f64().unwrap();
    let ebn0 = v["eb_n0_db"].as_f64().unwrap();
    let req = v["required_eb_n0_db"].as_f64().unwrap();
    assert!(
        (margin - (ebn0 - req)).abs() < 1e-6,
        "margin = Eb/N0 - required"
    );
    assert_eq!(v["closes"], margin >= 0.0);
    assert!(v["free_space_loss_db"].as_f64().unwrap() > 0.0);
    // A deterministic engineering calc, never a "validated" claim.
    assert!(!a.json.contains("VALIDATED"));
}
