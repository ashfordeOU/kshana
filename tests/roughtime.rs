// SPDX-License-Identifier: AGPL-3.0-only
//! Roughtime (RFC 10049) checks (`kshana roughtime`). No test uses the network.
//!
//! * Every built-in vector passes: the synthetic packets (one valid exchange through a four-leaf
//!   Merkle tree at index 2, one defect per negative vector), the RFC's Appendix B example as
//!   published, and the replacement of erratum 9238.
//! * The Appendix B example fails Section 5.4 validation with the RFC's context strings and
//!   verifies with the pre-RFC "RoughTime v1 ..." strings; its first response is the
//!   inconsistent one. The erratum's replacement is valid and proves the third inconsistent.
//! * A request built by the client is well formed, 1024 bytes of message, with SRV for its key.

use std::path::PathBuf;
use std::process::Command;

use kshana::roughtime::{
    build_request, check_report, check_request, h, run_builtin, run_vector, Transport, BUILTIN,
};
use serde_json::Value;

fn vectors() -> Vec<Value> {
    let doc: Value = serde_json::from_str(BUILTIN[0].1).unwrap();
    doc["vectors"].as_array().unwrap().clone()
}

fn vector(id: &str) -> Value {
    vectors().into_iter().find(|v| v["id"] == id).unwrap()
}

#[test]
fn every_builtin_vector_passes() {
    let out = run_builtin().unwrap();
    let failed: Vec<_> = out.iter().filter(|o| !o.pass).collect();
    assert!(failed.is_empty(), "{failed:#?}");
    assert_eq!(out.len(), 42);
    for v in vectors() {
        assert!(v["source"]["url"]
            .as_str()
            .unwrap()
            .starts_with("https://www.rfc-editor.org/"));
    }
}

#[test]
fn the_published_example_and_the_erratum() {
    let r = check_report(&vector("rfc10049-appb-report")["report"]);
    assert!(!r.errors.is_empty());
    assert!(r.nonce_chain);
    assert_eq!(r.legacy_context_signatures, vec![true, true, true]);
    assert_eq!(r.inconsistent_pairs, vec![[0, 1], [0, 2]]);
    assert!(!r.proves_inconsistency);
    let e = check_report(&vector("erratum-9238-report")["report"]);
    assert!(e.errors.is_empty(), "{:?}", e.errors);
    assert_eq!(e.inconsistent_pairs, vec![[0, 2], [1, 2]]);
    assert!(e.proves_inconsistency);
    // The third server is a day behind the first two.
    let m: Vec<u64> = e
        .responses
        .iter()
        .map(|x| x.findings.midp.unwrap())
        .collect();
    assert_eq!(m[0] - m[2], 86_400);
}

#[test]
fn a_changed_expectation_fails() {
    let mut v = vector("resp-valid-path2");
    v["expect"]["midp"] = Value::from(1);
    assert!(!run_vector("t", &v).pass);
    let mut v = vector("req-type-1");
    v["expect"]["errors"] = serde_json::json!([]);
    assert!(!run_vector("t", &v).pass);
}

#[test]
fn the_client_request_is_well_formed() {
    let key = [7u8; 32];
    let nonce = h(&[b"nonce"]);
    let req = build_request(&key, &nonce);
    assert_eq!(req.len(), 12 + 1024);
    let (f, offered) = check_request(&req, Some(&key), Transport::Udp);
    assert!(f.errors.is_empty() && f.warnings.is_empty(), "{f:?}");
    assert_eq!(offered, Some(vec![1]));
    assert_eq!(f.nonce.as_deref(), Some(hex::encode(nonce).as_str()));
}

fn unique_dir(tag: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-roughtime-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_command_line_checks_reports_and_vectors() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let dir = unique_dir("cli");
    for (id, code) in [("erratum-9238-report", 0), ("rfc10049-appb-report", 1)] {
        let p = dir.join(format!("{id}.json"));
        std::fs::write(&p, vector(id)["report"].to_string()).unwrap();
        let out = Command::new(bin)
            .args(["roughtime", "check-report"])
            .arg(&p)
            .output()
            .unwrap();
        assert_eq!(out.status.code(), Some(code), "{id}");
        let v: Value = serde_json::from_slice(&out.stdout).unwrap();
        assert_eq!(v["label"], "MODELLED");
    }
    let out = Command::new(bin)
        .args(["roughtime", "vectors"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0));
    let _ = std::fs::remove_dir_all(&dir);
}
