// SPDX-License-Identifier: AGPL-3.0-only
//! Lunar time-scale vectors (`kshana lunar-time-vectors`, docs/LUNAR-TIME-VECTORS.md).
//!
//! * Every built-in vector passes against kshana's implementation, cites a source with a title
//!   and URL, and carries a status; every vector that is not `defined` says why.
//! * Coordinated Lunar Time (LTC) has no published definition: its tag vector and its surface-rate
//!   vector are `provisional`, and the tag is reported as not defined.
//! * A vector without a source, with an unknown status, or provisional without a reason fails;
//!   a changed expected value fails.

use std::process::Command;

use kshana::lunar_time_vectors::{run_builtin, run_file, run_vector, BUILTIN, FORMAT};
use serde_json::{json, Value};

#[test]
fn every_builtin_vector_passes_and_cites_its_source() {
    let out = run_builtin().unwrap();
    let failed: Vec<_> = out.iter().filter(|o| !o.pass).collect();
    assert!(failed.is_empty(), "{failed:#?}");
    assert_eq!(out.len(), 21);
    let doc: Value = serde_json::from_str(BUILTIN[0].1).unwrap();
    assert_eq!(doc["format"], FORMAT);
    for v in doc["vectors"].as_array().unwrap() {
        assert!(
            v["source"]["url"]
                .as_str()
                .is_some_and(|u| u.starts_with("https://")),
            "{v}"
        );
        assert!(v["source"]["fetched"].as_str().is_some(), "{v}");
        if v["status"] != "defined" {
            assert!(
                v["status_reason"].as_str().is_some_and(|r| !r.is_empty()),
                "{v}"
            );
        }
    }
}

#[test]
fn ltc_is_provisional_and_tcl_is_defined() {
    let out = run_builtin().unwrap();
    let status = |id: &str| out.iter().find(|o| o.id == id).unwrap().status.clone();
    assert_eq!(status("tag-ltc"), "provisional");
    assert_eq!(status("ltc-surface-rate-provisional"), "provisional");
    assert_eq!(status("tag-tcl"), "defined");
    assert_eq!(status("tcl-origin"), "defined");
    assert_eq!(status("tcl-mean-rate-tcb"), "published-model");
    assert!(out
        .iter()
        .filter(|o| o.status == "provisional")
        .all(|o| o.id.contains("ltc")));
}

fn base() -> Value {
    json!({
        "id": "x", "op": "tcg_minus_tt", "input": {"jd0": 2451544.5, "s": 43200.0},
        "expect": {"seconds": 0.5058332860211294}, "tolerance": 1e-9, "status": "defined",
        "source": {"title": "IAU 2000 Resolution B1.9", "url": "https://example.org/b19", "fetched": "2026-11-28"}
    })
}

#[test]
fn incomplete_or_changed_vectors_fail() {
    assert!(run_vector("t", &base()).pass);
    let mut v = base();
    v["source"]["url"] = json!("");
    assert!(!run_vector("t", &v).pass);
    let mut v = base();
    v["status"] = json!("final");
    assert!(!run_vector("t", &v).pass);
    let mut v = base();
    v["status"] = json!("provisional");
    assert!(!run_vector("t", &v).pass);
    v["status_reason"] = json!("no published definition");
    assert!(run_vector("t", &v).pass);
    let mut v = base();
    v["expect"]["seconds"] = json!(0.5059);
    let o = run_vector("t", &v);
    assert!(!o.pass && o.detail.contains("seconds"));
    assert!(run_file("t", "{\"format\": \"other\", \"vectors\": []}").is_err());
}

#[test]
fn the_command_runs_the_builtin_set() {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["lunar-time-vectors", "--json"])
        .output()
        .unwrap();
    assert_eq!(
        out.status.code(),
        Some(0),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let v: Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["label"], "MODELLED");
    assert_eq!(v["outcomes"].as_array().unwrap().len(), 21);
}
