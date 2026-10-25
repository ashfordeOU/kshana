// SPDX-License-Identifier: AGPL-3.0-only
//! The recorded verdict of the pre-registered oracle row C1 of `xval/mission-thread/PREREGISTRATION.md`, as amended:
//! the mean state of the `tli-and-cruise` phase against the JPL Horizons trajectory of Artemis I / Orion over a 72 h
//! coast arc.
//!
//! The reference file is never vendored. Ungated: the committed Moon kernel cut matches its recorded SHA-256, the
//! stored results apply the registered bars to the stored numbers, and the verdict is the one recorded, **including
//! the miss**: C1 is NOT MET. A change to the verdict is a new result, not a fix to this test. The stored diagnostic
//! (each tabulated state propagated one hour against the next) is pinned too: it places the miss in five impulsive
//! events in the reference and shows the force model reproducing the hours between them to a fraction of a metre.
//!
//! Gated by `KSHANA_MISSION_THREAD_ORACLE_DATA=<dir>` (a directory written by `xval/mission-thread/fetch_data.sh`):
//! the fetched file matches the recorded SHA-256. To recompute the numbers:
//! `cargo run --release --example mission_thread_oracle -- <dir>`.
//!
//! The row tests the propagation of one mean state and nothing else. Advisory software, not certified navigation
//! equipment.

use serde_json::Value;
use sha2::{Digest, Sha256};

const RESULTS: &str = "xval/mission-thread/results_oracle.json";
const DIAGNOSTIC: &str = "xval/mission-thread/results_diagnostic.json";
const KERNEL: &str = "tests/fixtures/mission_thread/de440s_moon_2022-11-16_2022-12-12.bsp";

// The registered bars.
const BAR_POSITION_M: f64 = 5_000.0;
const BAR_VELOCITY_MPS: f64 = 0.05;
const HORIZONS_SHA256: &str = "9494dc81cc8599a6519bf92d4198f2ffe5d149acf496788713b863a0b34029f9";

fn sha(path: &str) -> String {
    hex::encode(Sha256::digest(
        std::fs::read(path).unwrap_or_else(|e| panic!("{path}: {e}")),
    ))
}

fn read(path: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}")))
        .unwrap_or_else(|e| panic!("{path}: {e}"))
}

#[test]
fn the_kernel_cut_and_the_recorded_inputs_match_their_hashes() {
    let r = read(RESULTS);
    assert_eq!(r["inputs"]["moon_kernel_sha256"], sha(KERNEL));
    assert_eq!(r["inputs"]["horizons_sha256"], HORIZONS_SHA256);
    assert_eq!(r["inputs"]["horizons_file"], "c1_artemis1_horizons.json");
}

#[test]
fn the_stored_numbers_miss_the_registered_bars_as_recorded() {
    let r = read(RESULTS);
    assert_eq!(r["bars"]["position_m"], BAR_POSITION_M);
    assert_eq!(r["bars"]["velocity_mps"], BAR_VELOCITY_MPS);
    assert_eq!(r["window"]["hours"], 72);
    let k = &r["kernel_moon"];
    let per = k["per_epoch"].as_array().expect("per-epoch rows");
    assert_eq!(per.len(), 6);
    let worst = per
        .iter()
        .map(|e| e["position_difference_m"].as_f64().unwrap())
        .fold(0.0, f64::max);
    assert_eq!(k["max_position_difference_m"].as_f64().unwrap(), worst);
    let vel_end = per[5]["velocity_difference_mps"].as_f64().unwrap();
    assert_eq!(
        k["velocity_difference_at_end_mps"].as_f64().unwrap(),
        vel_end
    );
    // Both bars are missed, by the factors recorded in RESULTS.md.
    assert!(worst > BAR_POSITION_M && vel_end > BAR_VELOCITY_MPS);
    assert_eq!(k["position_met"], false);
    assert_eq!(k["velocity_met"], false);
    assert_eq!(k["status"], "NOT MET");
    // The analytic-Moon comparison is reported without a bar and carries no verdict.
    assert!(r["secondary_analytic_moon"].get("status").is_none());
}

#[test]
fn the_diagnostic_places_the_miss_in_five_impulsive_events_not_in_the_force_model() {
    let d = read(DIAGNOSTIC);
    let arcs = d.as_array().expect("hourly arcs");
    assert_eq!(arcs.len(), 72);
    let v = |a: &Value| a["velocity_residual_mps"].as_f64().unwrap();
    let p = |a: &Value| a["position_residual_m"].as_f64().unwrap();
    let hours: Vec<i64> = arcs
        .iter()
        .filter(|a| v(a) > 0.05)
        .map(|a| a["hour_after_start"].as_f64().unwrap() as i64)
        .collect();
    assert_eq!(hours, vec![1, 17, 23, 34, 57]);
    // The other 67 hours are reproduced to well under a few metres and a millimetre per second.
    let quiet: Vec<&Value> = arcs.iter().filter(|a| v(a) <= 0.05).collect();
    assert_eq!(quiet.len(), 67);
    assert!(quiet.iter().all(|a| p(a) < 5.0 && v(a) < 0.002));
    let mut ps: Vec<f64> = quiet.iter().map(|a| p(a)).collect();
    ps.sort_by(f64::total_cmp);
    assert!(ps[ps.len() / 2] < 1.0);
}

#[test]
fn the_fetched_reference_matches_its_hash_when_a_data_directory_is_given() {
    let Ok(dir) = std::env::var("KSHANA_MISSION_THREAD_ORACLE_DATA") else {
        return;
    };
    assert_eq!(
        sha(&format!("{dir}/c1_artemis1_horizons.json")),
        HORIZONS_SHA256
    );
}
