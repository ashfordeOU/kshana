// SPDX-License-Identifier: AGPL-3.0-only
//! M5 run (`docs/design/evidence/m5-jammers-from-orbit-hybrid/RESULTS.md`): the recorded verdicts of
//! the one full run (B1, B2, B3 NOT MET, pinned), B5 from the geometry-only bounds, and B6: a two-placement
//! run gives pinned bytes on every platform (it is in the reproducibility matrix).

use serde_json::Value;

fn file(p: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(p).expect("file")).expect("json")
}

#[test]
fn recorded_e30_verdicts() {
    let r = file("xval/m5-jammers-from-orbit/result.json");
    let e = &r["classes"]["E30"];
    let s = |k: &str| e["success"][k].as_f64().unwrap();
    // B1 NOT MET: hybrid 0.63 against max(space 0.63, ground 0.0) + 0.05.
    assert!(s("hybrid") < s("space").max(s("ground")) + 0.05);
    // B2 NOT MET: median hybrid 56.08 m against 0.8 x min(56.07, 213 273) m.
    let med = |k: &str| e["median_m"][k].as_f64().unwrap();
    assert!(med("hybrid") > 0.8 * med("space").min(med("ground")));
    // B3 NOT MET: p95 hybrid 359 184 m against min(359 184, 263 235) m.
    let p95 = |k: &str| e["p95_m"][k].as_f64().unwrap();
    assert!(p95("hybrid") > p95("space").min(p95("ground")));
    assert_eq!(e["common_set"], 114);
}

#[test]
fn b5_no_violation_and_it_reproduces() {
    let b = file("xval/m5-jammers-from-orbit/bounds.json");
    assert_eq!(b["violations"].as_array().unwrap().len(), 0);
    assert_eq!(b["cases"], 600);
}

#[test]
fn b6_two_placements_give_the_pinned_bytes() {
    let v = kshana::m5_hybrid::run(2);
    let text = format!("{}\n", serde_json::to_string(&v).unwrap());
    // PIN-SCOPE:    the SHA-256 of the M5 result of the first two placements (all classes and draws).
    // PIN-EXCLUDES: the other 198 placements (pinned through result.json's recorded values).
    assert_eq!(
        kshana::bench::sha256_hex(text.as_bytes()),
        "d7fa245ee2657cc0e6a5fc5e1e5886d78eb2861d361e45bd7bd1f8f10d8fe383"
    );
}

/// M5 v2 (`RESULTS-v2.md`): seeds 4600 and 4601, run once. E30: B1, B2, B3 NOT MET, pinned.
#[test]
fn recorded_e30_verdicts_v2() {
    let r = file("xval/m5-jammers-from-orbit/result-v2.json");
    assert_eq!(r["seeds"], serde_json::json!([4600, 4601]));
    let e = &r["classes"]["E30"];
    let s = |k: &str| e["success"][k].as_f64().unwrap();
    // B1 NOT MET: hybrid 0.99 against max(space 0.99, ground 0.00025) + 0.05.
    assert!((s("space") - 0.99).abs() < 1e-12 && (s("hybrid") - 0.99).abs() < 1e-12);
    assert!(s("hybrid") < s("space").max(s("ground")) + 0.05);
    // B2 NOT MET: median hybrid 7.352 m against 0.8 x min(7.351, 81 874) m.
    let med = |k: &str| e["median_m"][k].as_f64().unwrap();
    assert!(med("hybrid") > 0.8 * med("space").min(med("ground")));
    // B3 NOT MET: p95 hybrid 71.300 m against min(71.297, 255 265) m.
    let p95 = |k: &str| e["p95_m"][k].as_f64().unwrap();
    assert!(p95("hybrid") > p95("space").min(p95("ground")));
    assert_eq!(e["common_set"], 262);
    assert_eq!(e["estimates"]["space"], 4000);
}

#[test]
fn b5_v2_no_violation() {
    let b = file("xval/m5-jammers-from-orbit/bounds-v2.json");
    assert_eq!(b["violations"].as_array().unwrap().len(), 0);
    assert_eq!(b["cases"], 600);
}

#[test]
fn b6_v2_two_placements_give_the_pinned_bytes() {
    let v = kshana::m5_hybrid::run_v2(2, kshana::m5_hybrid::V2_SEEDS);
    let text = format!("{}\n", serde_json::to_string(&v).unwrap());
    // PIN-SCOPE:    the SHA-256 of the M5 v2 result of the first two placements of seeds 4600 and 4601.
    // PIN-EXCLUDES: the other 198 placements (pinned through result-v2.json's recorded values).
    let got = kshana::bench::sha256_hex(text.as_bytes());
    assert_eq!(
        got,
        "12e1581c989abeb90a97e0140cfc5b2da5094611da5f6173ab79aaa3e0751241"
    );
}
