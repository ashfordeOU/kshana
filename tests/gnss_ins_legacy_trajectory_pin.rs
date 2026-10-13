// SPDX-License-Identifier: AGPL-3.0-only
//! **The `gnss-ins` kind without a `[trajectory]` table is unchanged by the trajectory
//! library.**
//!
//! The trajectory library (`fusion::trajectory`) added an optional `[trajectory]` table to
//! the `gnss-ins` scenario. When the table is absent the pack must take exactly the code
//! path it took before, with the same floating-point operations in the same order. This
//! file pins, for each bundled scenario of the kind, a SHA-256 of the pack's result JSON
//! and of the test-bench truth trajectory, taken on `a7c4cf8` (branch `feat/fusion-ins-0.36`, the rc merged; `src/fusion/pack.rs`
//! identical to the rc) BEFORE the library existed, and checks the current tree
//! reproduces them bit for bit.
//!
//! PIN-SCOPE:    `serde_json::to_string(&run_gnss_ins(scn))` with `engine_version` and
//!               `schema_version` blanked (every number, series sample, FoM, spec echo and
//!               the scenario hash), and every `(t, NavState)` of `truth_trajectory(scn)`
//!               formatted with `{:?}` (full f64 round-trip precision), for the bundled
//!               scenarios gnss-ins, automotive-urban-canyon and small-uas-jammed-nav.
//! PIN-EXCLUDES: the `engine_version` and `schema_version` strings (they move on every
//!               release and say nothing about the trajectory), the UNITS block the CLI
//!               attaches, the SVG and the summary line.
//!
//! Re-pin only for a change that is *meant* to move the legacy path, and say so in the
//! CHANGELOG; a trajectory-library change must never need to.

use kshana::fusion::pack::{run_gnss_ins, truth_trajectory, GnssInsScenario};
use sha2::{Digest, Sha256};

fn sha(s: &str) -> String {
    let mut h = Sha256::new();
    h.update(s.as_bytes());
    hex::encode(h.finalize())
}

fn load(name: &str) -> GnssInsScenario {
    let path = format!("{}/scenarios/{name}.toml", env!("CARGO_MANIFEST_DIR"));
    let src = std::fs::read_to_string(&path).expect("bundled scenario");
    toml::from_str(&src).expect("valid gnss-ins scenario")
}

fn result_hash(scn: &GnssInsScenario) -> String {
    let mut v = serde_json::to_value(run_gnss_ins(scn)).unwrap();
    v["engine_version"] = serde_json::Value::String(String::new());
    v["schema_version"] = serde_json::Value::String(String::new());
    sha(&serde_json::to_string(&v).unwrap())
}

fn truth_hash(scn: &GnssInsScenario) -> String {
    let mut s = String::new();
    for (t, n) in truth_trajectory(scn) {
        s.push_str(&format!("{t:?} {n:?}\n"));
    }
    sha(&s)
}

const PINS: &[(&str, &str, &str)] = &[
    (
        "gnss-ins",
        "acb9347aa45fcba3705f7b4733fe7260e125011b96e4d82b605bd88190d62486",
        "1e23d78ec10e51cd1ca086fae6e69bbfc7e3b93b6288e16a7dbaf07176433338",
    ),
    (
        "automotive-urban-canyon",
        "9c7fd428de14f726e0f5ef4a2bc715c41921434c5aac158ec27a95c6f9f5944a",
        "72d7afc17386fb6087172a8bb00d7265633e4a4bcc03c986178a2ff72dbe5660",
    ),
    (
        "small-uas-jammed-nav",
        "c8330bc99f298d7febe3cb2879509180f42c99db26a86f039f2fe6afccc0c6ae",
        "78d1ca1ff77f186203cd74c84ee33618746155d3eb3ac08b08af1cde66debf2d",
    ),
];

#[test]
fn bundled_gnss_ins_scenarios_are_bit_identical_to_the_base_commit() {
    let mut bad = Vec::new();
    for (name, want_result, want_truth) in PINS {
        let scn = load(name);
        let (r, t) = (result_hash(&scn), truth_hash(&scn));
        println!("{name}: result {r} truth {t}");
        if r != *want_result || t != *want_truth {
            bad.push(format!("{name}: result {r} truth {t}"));
        }
    }
    assert!(bad.is_empty(), "legacy path moved:\n{}", bad.join("\n"));
}
