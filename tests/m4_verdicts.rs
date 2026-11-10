// SPDX-License-Identifier: AGPL-3.0-only
//! M4 scored run (`docs/design/evidence/m4-dark-vessel-ais-integrity/RESULTS.md`): the recorded
//! verdicts of seeds 1000-1009 at `M4Params::v1` (B1, B3, B5 MET; B2, B4 NOT MET, pinned), and B6 for
//! the decision: seed 1000 decided twice gives the same decision and its recorded confusion matrix.

use kshana::m4_dark_vessel::generate;
use kshana::m4_logic::{decide, decided_classes, metrics, M4Params};
use serde_json::Value;

fn scored() -> Value {
    serde_json::from_str(&std::fs::read_to_string("xval/m4-dark-vessel/scored.json").expect("file"))
        .expect("json")
}

#[test]
fn recorded_verdicts() {
    let s = scored();
    assert_eq!(s["m"], 3);
    assert_eq!(s["c_m"], 5000.0);
    let m = &s["metrics"];
    let pc = |c: &str, k: &str| m["per_class"][c][k].as_f64().expect("number");
    // B1 MET: FA <= 0.01.
    assert!(m["false_alarm"].as_f64().unwrap() <= 0.01);
    // B2 NOT MET, pinned: dark recall 0.848 (bar >= 0.95); precision 0.999 meets its part.
    assert!((pc("DARK", "recall") - 1187.0 / 1400.0).abs() < 1e-12 && pc("DARK", "recall") < 0.95);
    assert!(pc("DARK", "precision") >= 0.80);
    // B3 MET and B5 MET.
    assert_eq!(pc("GAP", "recall"), 1.0);
    assert_eq!(pc("IDENTITY-DUPLICATE", "recall"), 1.0);
    // B4 NOT MET, pinned: 0.807 at 5 km (bar 0.85); 0.846, 0.825, 0.871 at 10, 20, 50 km (bar 0.98).
    let r = |d: &str| m["offset_recall_by_km"][d]["recall"].as_f64().unwrap();
    assert!((r("5") - 226.0 / 280.0).abs() < 1e-12 && r("5") < 0.85);
    for d in ["10", "20", "50"] {
        assert!(r(d) < 0.98, "{d}");
    }
}

#[test]
fn seed_1000_decision_is_deterministic_and_as_recorded() {
    let s = generate(1000);
    let p = M4Params::v1();
    let (a, b) = (decide(&s, &p), decide(&s, &p));
    assert_eq!(a.class, b.class);
    assert_eq!(a.dark_fix, b.dark_fix);
    let conf = metrics(&decided_classes(&s, &a))["confusion"].clone();
    let want: Value = serde_json::from_str(
        "[[1594,0,0,6,0],[15,125,0,0,0],[0,0,60,0,0],[47,0,0,93,0],[0,0,0,0,60]]",
    )
    .unwrap();
    assert_eq!(conf, want);
}

fn scored_v2() -> Value {
    serde_json::from_str(
        &std::fs::read_to_string("xval/m4-dark-vessel/scored-v2.json").expect("file"),
    )
    .expect("json")
}

/// M4 v2 (`RESULTS-v2.md`): seeds 2000-2009 at `M4Params::v2` (B1, B3, B5 MET; B2, B4 NOT MET, pinned).
#[test]
fn recorded_verdicts_v2() {
    let s = scored_v2();
    assert_eq!(s["m"], 3);
    assert_eq!(s["c_m"], 5000.0);
    assert_eq!(M4Params::v2().m, 3);
    let m = &s["metrics"];
    let pc = |c: &str, k: &str| m["per_class"][c][k].as_f64().expect("number");
    assert!(m["false_alarm"].as_f64().unwrap() <= 0.01);
    // B2 NOT MET, pinned: 1228 of 1400 (bar >= 0.95); precision >= 0.80.
    assert!((pc("DARK", "recall") - 1228.0 / 1400.0).abs() < 1e-12 && pc("DARK", "recall") < 0.95);
    assert!(pc("DARK", "precision") >= 0.80);
    assert_eq!(pc("GAP", "recall"), 1.0);
    assert_eq!(pc("IDENTITY-DUPLICATE", "recall"), 1.0);
    // B4 NOT MET, pinned: 111 of 280 at 5 km (bar 0.85); 10, 20, 50 km below 0.98.
    let r = |d: &str| m["offset_recall_by_km"][d]["recall"].as_f64().unwrap();
    assert!((r("5") - 111.0 / 280.0).abs() < 1e-12 && r("5") < 0.85);
    for d in ["10", "20", "50"] {
        assert!(r(d) < 0.98, "{d}");
    }
}

#[test]
fn seed_2000_v2_decision_is_deterministic_and_as_recorded() {
    let s = generate(2000);
    let p = M4Params::v2();
    let (a, b) = (decide(&s, &p), decide(&s, &p));
    assert_eq!(a.class, b.class);
    assert_eq!(a.dark_fix, b.dark_fix);
    assert_eq!(a.taken, b.taken);
    let conf = metrics(&decided_classes(&s, &a))["confusion"].clone();
    let want: Value = serde_json::from_str(SEED_2000_V2).unwrap();
    assert_eq!(conf, want);
}

const SEED_2000_V2: &str =
    "[[1600,0,0,0,0],[18,122,0,0,0],[0,0,60,0,0],[60,16,0,64,0],[0,0,0,0,60]]";

fn scored_v3() -> Value {
    serde_json::from_str(
        &std::fs::read_to_string("xval/m4-dark-vessel/scored-v3.json").expect("file"),
    )
    .expect("json")
}

/// M4 v3 (`RESULTS-v3.md`): seeds 3000-3009 at `M4Params::v3` (B1, B2, B3, B5 MET; B4 NOT MET, pinned).
#[test]
fn recorded_verdicts_v3() {
    let s = scored_v3();
    assert_eq!(s["m"], 3);
    assert_eq!(s["new_track_cost"], 9.21);
    assert_eq!(M4Params::v3().m, 3);
    let m = &s["metrics"];
    let pc = |c: &str, k: &str| m["per_class"][c][k].as_f64().expect("number");
    assert!(m["false_alarm"].as_f64().unwrap() <= 0.01);
    // B2 MET: 1392 of 1400 (bar >= 0.95); precision >= 0.80.
    assert!((pc("DARK", "recall") - 1392.0 / 1400.0).abs() < 1e-12 && pc("DARK", "recall") >= 0.95);
    assert!(pc("DARK", "precision") >= 0.80);
    assert_eq!(pc("GAP", "recall"), 1.0);
    assert_eq!(pc("IDENTITY-DUPLICATE", "recall"), 1.0);
    // B4 NOT MET, pinned: 137 of 280 at 5 km (bar 0.85); 10, 20, 50 km below 0.98.
    let r = |d: &str| m["offset_recall_by_km"][d]["recall"].as_f64().unwrap();
    assert!((r("5") - 137.0 / 280.0).abs() < 1e-12 && r("5") < 0.85);
    for d in ["10", "20", "50"] {
        assert!(r(d) < 0.98, "{d}");
    }
}

#[test]
fn seed_3000_v3_decision_is_deterministic_and_as_recorded() {
    let s = generate(3000);
    let p = M4Params::v3();
    let (a, b) = (decide(&s, &p), decide(&s, &p));
    assert_eq!(a.class, b.class);
    assert_eq!(a.dark_fix, b.dark_fix);
    assert_eq!(a.taken, b.taken);
    let conf = metrics(&decided_classes(&s, &a))["confusion"].clone();
    let want: Value = serde_json::from_str(SEED_3000_V3).unwrap();
    assert_eq!(conf, want);
}

const SEED_3000_V3: &str =
    "[[1600,0,0,0,0],[2,138,0,0,0],[0,0,60,0,0],[54,24,0,62,0],[0,0,0,0,60]]";
