// SPDX-License-Identifier: AGPL-3.0-only
//! The recorded C3 verdicts (`docs/design/evidence/c3-capstone-nrho-force-model/RESULTS.md`), including
//! the misses: C3-R MET; C3-H NOT MET on E, H1 and H2; C3-S met on H1 and NOT MET on H2. A change to any
//! verdict is a new result, not a fix. The scored numbers come from `examples/c3_run.rs` on data the
//! pre-registration does not vendor, so this test pins the committed record.

use serde_json::Value;

const DIR: &str = "xval/c3-capstone-nrho";
const END_M: f64 = 25_000.0;
const PERI_M: f64 = 10_000.0;

fn load(n: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{DIR}/{n}")).unwrap()).unwrap()
}

#[test]
fn the_windows_and_k_are_the_committed_ones() {
    let w = load("windows.json");
    let starts: Vec<u64> = w["windows"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x["start_index"].as_u64().unwrap())
        .collect();
    assert_eq!(starts, [0, 169, 808]);
    assert_eq!(w["manoeuvre_hours"].as_array().unwrap().len(), 11);
    let k = load("k.json")["k_m2_per_kg"].as_f64().unwrap();
    assert!((k - 0.027_937).abs() < 1e-6, "{k}");
}

#[test]
fn the_recorded_verdicts_hold_including_the_misses() {
    let r = load("result.json");
    let met = |id: &str| {
        let x = &r[id];
        let (e, p) = (
            x["end_position_difference_m"].as_f64().unwrap(),
            x["periapsis_radius_difference_m"].as_f64().unwrap(),
        );
        assert_eq!(x["end_position_met"], e <= END_M, "{id}");
        assert_eq!(x["periapsis_met"], p <= PERI_M, "{id}");
        e <= END_M && p <= PERI_M
    };
    assert!(met("C3-R_M1_W0"));
    for w in ["E", "H1", "H2"] {
        assert!(!met(&format!("C3-H_M1_{w}")), "C3-H {w} is a recorded miss");
    }
    assert!(met("C3-S_M2_H1"));
    assert!(!met("C3-S_M2_H2"), "C3-S H2 is a recorded miss");
    // The printed digits of RESULTS.md.
    let km = |id: &str| {
        format!(
            "{:.2}",
            r[id]["end_position_difference_m"].as_f64().unwrap() / 1e3
        )
    };
    assert_eq!(km("C3-R_M1_W0"), "21.66");
    assert_eq!(km("C3-H_M1_E"), "37.25");
    assert_eq!(km("C3-H_M1_H1"), "36.23");
    assert_eq!(km("C3-H_M1_H2"), "49.65");
    assert_eq!(km("C3-S_M2_H1"), "12.92");
    assert_eq!(km("C3-S_M2_H2"), "57.13");
}
