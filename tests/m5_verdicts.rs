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
