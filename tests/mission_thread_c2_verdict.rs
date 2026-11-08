// SPDX-License-Identifier: AGPL-3.0-only
//! The recorded C2 verdict (`xval/mission-thread-c2/RESULTS.md`), including the miss: C2 is NOT MET on W1 (C2a 17.3 km
//! against 2 km; C2b 0.0177 m/s against 0.01 m/s), and W2 is not run. A change to the verdict is a new result, not a
//! fix. The reference files are not vendored, so this pins the committed record.

use serde_json::Value;

fn load(n: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("xval/mission-thread-c2/{n}")).unwrap())
        .unwrap()
}

#[test]
fn the_events_and_impulses_are_the_committed_ones() {
    let i = load("impulses.json");
    let hours: Vec<i64> = i["event_hours_after_start"]
        .as_array()
        .unwrap()
        .iter()
        .map(|h| h.as_f64().unwrap().round() as i64)
        .collect();
    assert_eq!(hours, [1, 17, 23, 34, 57]);
    assert_eq!(i["impulses"].as_array().unwrap().len(), 5);
}

#[test]
fn the_recorded_verdict_holds_including_the_miss() {
    let r = load("result.json");
    let (p, v) = (
        r["max_position_difference_m"].as_f64().unwrap(),
        r["velocity_difference_at_last_h_mps"].as_f64().unwrap(),
    );
    assert_eq!(r["bars"]["C2a_position_m"], 2000.0);
    assert_eq!(r["bars"]["C2b_velocity_mps"], 0.01);
    assert_eq!(r["C2a_met"], p <= 2000.0);
    assert_eq!(r["C2b_met"], v <= 0.01);
    assert_eq!(r["C2"], "NOT MET");
    assert_eq!(r["per_state"].as_array().unwrap().len(), 72);
    assert_eq!(format!("{:.1}", p / 1e3), "17.3");
    assert_eq!(format!("{v:.4}"), "0.0177");
    assert!(r["w2"].as_str().unwrap().starts_with("not run"));
}
