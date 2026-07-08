// SPDX-License-Identifier: AGPL-3.0-only
//! L38 golden reference — the committed `scenarios/realtime-frame-eop.toml` reproduces the
//! P4 Table 1 (frame-error consistency) and Table 2 (UT1 prediction error vs horizon).
//!
//! Two oracles, both platform-invariant:
//! * **Closed form + real data.** Every scenario number equals the L19 lever arm applied to
//!   the L13 predicted covariance (Table 1) and to the L18 curve read off the real
//!   `finals2000A` fixture (Table 2), to machine precision.
//! * **Byte-stable CSV.** The committed `tests/golden/realtime-frame-eop.csv` is reproduced
//!   byte-for-byte (fixed-precision formatting absorbs last-ULP libm jitter).
//!
//! Re-baseline the CSV with:
//!   `cargo test --test realtime_frame_eop_scenario_reference zzz_emit_golden_csv -- --ignored`

use kshana::api::run_toml;
use kshana::frame_eop::{
    lunar_position_to_ut1, prediction_error_vs_horizon, ut1_error_to_lunar, Horizon, C_M_S,
};
use kshana::lunar_frame_predict::{predict_frame_error, OdCovariance, REALTIME_LATENCY_S};
use kshana::realtime_frame_eop::RealtimeFrameEopScenario;
use serde_json::Value;

const TOML: &str = include_str!("../scenarios/realtime-frame-eop.toml");
const GOLDEN_CSV: &str = include_str!("golden/realtime-frame-eop.csv");
const FIXTURE: &str = include_str!("fixtures/agency/eop/finals2000A_2022001.txt");

fn scenario() -> RealtimeFrameEopScenario {
    toml::from_str(TOML).expect("realtime-frame-eop scenario parses")
}

#[test]
fn committed_scenario_csv_is_byte_stable() {
    assert_eq!(
        scenario().to_csv().unwrap(),
        GOLDEN_CSV,
        "the committed golden CSV must be reproduced byte-for-byte; re-baseline with \
         `cargo test --test realtime_frame_eop_scenario_reference zzz_emit_golden_csv -- --ignored`"
    );
}

#[test]
fn table1_equals_the_l13_prediction_and_l19_lever_arm() {
    let out = run_toml(TOML).unwrap();
    let v: Value = serde_json::from_str(&out.json).unwrap();
    // Independent oracle: the representative OD covariance propagated through the 1 h latency.
    let predict = predict_frame_error(OdCovariance::representative(), REALTIME_LATENCY_S);

    let pp = &v["table1_consistency"][0];
    let rt = &v["table1_consistency"][1];
    assert_eq!(pp["regime"], "post-processed");
    assert_eq!(rt["regime"], "real-time");

    // Frame positions equal the L13 predicted / post-processed 1σ exactly.
    assert!(
        (pp["frame_position_m"].as_f64().unwrap() - predict.postproc_pos_sigma_m).abs() < 1e-12
    );
    assert!(
        (rt["frame_position_m"].as_f64().unwrap() - predict.predicted_pos_sigma_m).abs() < 1e-12
    );
    // Light-times equal position/c exactly.
    assert!((pp["light_time_ns"].as_f64().unwrap() - predict.postproc_time_ns).abs() < 1e-9);
    assert!((rt["light_time_ns"].as_f64().unwrap() - predict.predicted_time_ns).abs() < 1e-9);

    // UT1 equivalents are the exact L19 lever-arm image of the frame position.
    for row in [pp, rt] {
        let pos = row["frame_position_m"].as_f64().unwrap();
        let ut1_ms = row["ut1_equiv_ms"].as_f64().unwrap();
        assert!((ut1_ms - lunar_position_to_ut1(pos) * 1e3).abs() < 1e-12);
        // Round-trip: the UT1 error maps back to the same position.
        assert!((ut1_error_to_lunar(ut1_ms * 1e-3).0 - pos).abs() < 1e-9);
    }

    // The P4 headline: post-proc ~0.27 m ↔ ~0.010 ms, real-time ~15 m ↔ ~0.5 ms.
    assert!((0.005..0.015).contains(&pp["ut1_equiv_ms"].as_f64().unwrap()));
    assert!((13.0..17.0).contains(&rt["frame_position_m"].as_f64().unwrap()));
    assert!((0.45..0.60).contains(&rt["ut1_equiv_ms"].as_f64().unwrap()));
}

#[test]
fn table2_equals_the_l18_curve_mapped_by_l19() {
    let out = run_toml(TOML).unwrap();
    let v: Value = serde_json::from_str(&out.json).unwrap();
    // Independent oracle: the L18 prediction-error curve over the real fixture.
    let curve = prediction_error_vs_horizon(
        FIXTURE,
        &[
            Horizon::Final,
            Horizon::Days(1),
            Horizon::Days(2),
            Horizon::Days(3),
        ],
    );
    let rows = v["table2_error_vs_horizon"].as_array().unwrap();
    assert_eq!(rows.len(), curve.len());
    for (row, h) in rows.iter().zip(curve.iter()) {
        assert_eq!(row["n"].as_u64().unwrap() as usize, h.n);
        assert!((row["ut1_rms_ms"].as_f64().unwrap() - h.rms_ms()).abs() < 1e-12);
        assert!((row["ut1_p50_ms"].as_f64().unwrap() - h.p50_ms()).abs() < 1e-12);
        assert!((row["ut1_p95_ms"].as_f64().unwrap() - h.p95_ms()).abs() < 1e-12);
        // The Moon position is exactly the L19 image of the RMS UT1 error.
        let moon = row["moon_position_m"].as_f64().unwrap();
        assert!((moon - ut1_error_to_lunar(h.rms_s).0).abs() < 1e-12);
        assert!((row["moon_light_time_ns"].as_f64().unwrap() - moon / C_M_S * 1e9).abs() < 1e-9);
    }
    // The final floor lands in the IERS-published ~0.01-0.02 ms band.
    let floor = rows[0]["ut1_rms_ms"].as_f64().unwrap();
    assert!((0.005..0.05).contains(&floor), "final floor {floor} ms");
}

#[test]
fn committed_scenario_is_deterministic() {
    assert_eq!(run_toml(TOML).unwrap().json, run_toml(TOML).unwrap().json);
}

#[test]
#[ignore = "run with --ignored to re-baseline the committed golden CSV"]
fn zzz_emit_golden_csv() {
    let csv = scenario().to_csv().unwrap();
    std::fs::write("tests/golden/realtime-frame-eop.csv", csv).expect("write golden CSV");
    eprintln!("wrote tests/golden/realtime-frame-eop.csv");
}
