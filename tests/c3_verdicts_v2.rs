// SPDX-License-Identifier: AGPL-3.0-only
//! The recorded C3 v2 verdict (`docs/design/evidence/c3-capstone-nrho-force-model/RESULTS.md`, v2):
//! C3-S v2 MET on G1, G2 and G3, with G1 low-information. A change to any verdict is a new result,
//! not a fix. The scored numbers come from `examples/c3_run_v2.rs` on data the pre-registration does
//! not vendor, so this test pins the committed record.
//!
//! PIN-SCOPE:    the G windows, the per-window `k`, the scored verdicts and their printed digits, the
//!               low-information marks.
//! PIN-EXCLUDES: the propagation itself (not rerun here).

use serde_json::Value;

const DIR: &str = "xval/c3-capstone-nrho-v2";
const END_M: f64 = 25_000.0;
const PERI_M: f64 = 10_000.0;

fn load(n: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{DIR}/{n}")).unwrap()).unwrap()
}

#[test]
fn the_g_windows_and_k_are_the_committed_ones() {
    let w = load("windows_g.json");
    let starts: Vec<u64> = w["windows"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x["start_index"].as_u64().unwrap())
        .collect();
    assert_eq!(starts, [0, 292, 756]);
    assert_eq!(w["manoeuvre_hours"].as_array().unwrap().len(), 8);
    let k = load("k_v2.json");
    for (n, want) in [
        ("G1", 0.027_285),
        ("G2", 0.026_674),
        ("G3", 0.027_773),
        ("E", 0.027_947),
        ("H1", 0.026_768),
        ("H2", 0.029_362),
        ("W0", 0.026_936),
    ] {
        let got = k[n]["k_m2_per_kg"].as_f64().unwrap();
        assert!((got - want).abs() < 1e-6, "{n}: {got}");
    }
}

#[test]
fn the_recorded_v2_verdict_holds() {
    let r = load("score_v2.json");
    let s = load("sensitivity_v2.json");
    for (n, km, peri_m, low) in [
        ("G1", "0.21", 11.0, true),
        ("G2", "0.60", 4.0, false),
        ("G3", "0.73", 87.0, false),
    ] {
        let x = &r[format!("C3-S-v2_M3_{n}")];
        let (e, p) = (
            x["end_position_difference_m"].as_f64().unwrap(),
            x["periapsis_radius_difference_m"].as_f64().unwrap(),
        );
        assert!(e <= END_M && p <= PERI_M, "C3-S v2 {n} is recorded as met");
        assert_eq!(format!("{:.2}", e / 1e3), km, "{n}");
        assert!((p - peri_m).abs() < 1.0, "{n}: {p}");
        assert_eq!(s[format!("M3_{n}")]["low_information"], low, "{n}");
    }
    // The no-bar H2 miss with its own k.
    let h2 = r["noBar_M3_H2"]["end_position_difference_m"]
        .as_f64()
        .unwrap();
    assert_eq!(format!("{:.2}", h2 / 1e3), "57.82");
}
