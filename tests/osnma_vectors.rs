// SPDX-License-Identifier: AGPL-3.0-only
//! The open synthetic OSNMA vector sets (`conformance/osnma/v1` and `v2`, `docs/OSNMA-VECTORS.md`):
//! the committed files are exactly what the generator makes, the bar file hash is the pinned
//! one, every vector meets its fixed bar through the library and the command line, and the
//! runner refuses a changed bar file and fails a changed input.
//!
//! Regenerate the committed files (from the repository root) with
//! `KSHANA_WRITE_OSNMA_VECTORS=1 cargo test --test osnma_vectors committed_set`.

use kshana::osnma::vectors::{self, LoadedSet};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn set_dir() -> PathBuf {
    root().join("conformance/osnma/v1")
}

fn set_dir_v(major: u32) -> PathBuf {
    root().join(format!("conformance/osnma/v{major}"))
}

fn kshana(args: &[&str]) -> (i32, String, String) {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    (
        o.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&o.stdout).into_owned(),
        String::from_utf8_lossy(&o.stderr).into_owned(),
    )
}

static SEQ: AtomicU64 = AtomicU64::new(0);

fn tmp(tag: &str) -> PathBuf {
    let dir = std::env::temp_dir().join(format!(
        "kshana-osnma-vectors-{tag}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&dir);
    dir
}

fn copy_set(to: &Path) {
    std::fs::create_dir_all(to.join("inputs")).unwrap();
    for f in ["manifest.json", "bars.json"] {
        std::fs::copy(set_dir().join(f), to.join(f)).unwrap();
    }
    for e in std::fs::read_dir(set_dir().join("inputs")).unwrap() {
        let p = e.unwrap().path();
        std::fs::copy(&p, to.join("inputs").join(p.file_name().unwrap())).unwrap();
    }
}

fn check_committed(major: u32) {
    if std::env::var_os("KSHANA_WRITE_OSNMA_VECTORS").is_some() {
        vectors::write_set_version(&set_dir_v(major), major).unwrap();
    }
    let (manifest, bars, gens) = vectors::generate_version(major);
    let read = |p: &str| std::fs::read_to_string(set_dir_v(major).join(p)).unwrap();
    assert_eq!(
        read("manifest.json"),
        vectors::to_text(&manifest),
        "conformance/osnma/v{major}/manifest.json differs from the generator"
    );
    assert_eq!(
        read("bars.json"),
        bars,
        "bars.json differs from the generator"
    );
    for g in &gens {
        let p = g.entry["input"].as_str().unwrap();
        assert_eq!(read(p), g.input, "{p} differs from the generator");
    }
    // No file in the set that the manifest does not name.
    let named: Vec<String> = gens
        .iter()
        .map(|g| g.entry["input"].as_str().unwrap().to_string())
        .collect();
    for e in std::fs::read_dir(set_dir_v(major).join("inputs")).unwrap() {
        let name = format!("inputs/{}", e.unwrap().file_name().to_string_lossy());
        assert!(named.contains(&name), "{name} is not in the manifest");
    }
}

#[test]
fn the_committed_set_v1_is_current() {
    check_committed(1);
}

#[test]
fn the_committed_set_v2_is_current() {
    check_committed(2);
}

#[test]
fn the_bar_file_hash_is_the_pinned_one() {
    for (major, pin) in [(1, vectors::BARS_SHA256_V1), (2, vectors::BARS_SHA256_V2)] {
        let (manifest, bars, _) = vectors::generate_version(major);
        let h = hex::encode(Sha256::digest(bars.as_bytes()));
        assert_eq!(h, pin, "set version {major}");
        assert_eq!(manifest["bars_sha256"], h);
    }
}

#[test]
fn version_2_keeps_every_version_1_vector_and_bar_unchanged() {
    let (m1, b1, g1) = vectors::generate_version(1);
    let (m2, b2, g2) = vectors::generate_version(2);
    assert_eq!(m1["set_version"], vectors::SET_VERSION_V1);
    assert_eq!(m2["set_version"], vectors::SET_VERSION);
    let (b1, b2): (Value, Value) = (
        serde_json::from_str(&b1).unwrap(),
        serde_json::from_str(&b2).unwrap(),
    );
    for (g, h) in g1.iter().zip(&g2) {
        assert_eq!(g.entry, h.entry);
        assert_eq!(g.input, h.input);
        let id = g.entry["id"].as_str().unwrap();
        assert_eq!(b1["bars"][id], b2["bars"][id], "{id}");
    }
    assert_eq!(
        g2.len(),
        g1.len() + vectors::set_v2::added().len(),
        "version 2 is version 1 plus the added vectors"
    );
    // The default the command runs and writes is the latest version.
    assert_eq!(vectors::generate().0["set_version"], vectors::SET_VERSION);
}

#[test]
fn the_set_covers_every_category_with_unique_ids_and_citations() {
    let defs = vectors::set_v2::vectors();
    let mut ids: Vec<&str> = defs.iter().map(|d| d.id).collect();
    ids.sort();
    ids.dedup();
    assert_eq!(ids.len(), defs.len(), "duplicate vector ids");
    for cat in [
        "valid",
        "key-chain",
        "keys",
        "mack-tags",
        "renewal-revocation",
        "alert",
        "replay",
        "corruption",
        "time",
        "maclt",
    ] {
        assert!(
            defs.iter().any(|d| d.category == cat),
            "no vector for {cat}"
        );
    }
    for d in &defs {
        assert!(!d.refs.is_empty(), "{} cites nothing", d.id);
        assert!(
            d.refs
                .iter()
                .all(|r| r.starts_with("ICD ") || r.starts_with("RG ")),
            "{}: {:?}",
            d.id,
            d.refs
        );
    }
}

#[test]
fn every_built_in_vector_meets_its_bar() {
    let r = vectors::run_set(&LoadedSet::builtin(), &[]).unwrap();
    let missed: Vec<&Value> = r["results"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|v| v["pass"] != true)
        .collect();
    assert!(missed.is_empty(), "{missed:#?}");
    assert_eq!(r["total"], vectors::set_v2::vectors().len());
    assert_eq!(r["set_version"], vectors::SET_VERSION);
    assert_eq!(r["format"], vectors::RESULT_FORMAT);
    let scope = r["scope"].as_str().unwrap();
    assert!(scope.contains("not a certification") && scope.contains("not conformance"));
}

#[test]
fn the_command_line_runs_the_committed_set_with_a_table_and_json() {
    let dir = set_dir();
    let d = dir.to_str().unwrap();
    let (code, out, _) = kshana(&["osnma", "vectors", "run", d, "--json"]);
    assert_eq!(code, 0, "{out}");
    let r: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["failed"], 0);
    assert_eq!(r["bars_sha256"], vectors::BARS_SHA256_V1);
    let (code, out, _) = kshana(&["osnma", "vectors", "run", d]);
    assert_eq!(code, 0);
    assert!(out.contains("V01-nominal") && out.contains("PASS") && !out.contains("FAIL"));
    assert!(out.starts_with("Advisory:"));
    // One vector only.
    let (code, out, _) = kshana(&[
        "osnma",
        "vectors",
        "run",
        d,
        "--only",
        "A01-alert-message",
        "--json",
    ]);
    assert_eq!(code, 0);
    let r: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["total"], 1);
    // Each vector's own command line works with `kshana osnma verify` as written.
    let m: Value =
        serde_json::from_str(&std::fs::read_to_string(dir.join("manifest.json")).unwrap()).unwrap();
    let v = &m["vectors"][0];
    let cmd = v["command"].as_str().unwrap();
    let args: Vec<String> = cmd
        .split_whitespace()
        .skip(1)
        .map(|a| {
            if a.starts_with("inputs/") {
                dir.join(a).display().to_string()
            } else {
                a.to_string()
            }
        })
        .collect();
    let args: Vec<&str> = args.iter().map(String::as_str).collect();
    let (code, out, _) = kshana(&args);
    assert_eq!(code, 0);
    let rep: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(rep["overall"], "authenticated");
    // The committed version 2 set runs the same way, under its own pin.
    let d2 = set_dir_v(2);
    let (code, out, _) = kshana(&["osnma", "vectors", "run", d2.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0, "{out}");
    let r: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["failed"], 0);
    assert_eq!(r["bars_sha256"], vectors::BARS_SHA256_V2);
    assert_eq!(r["total"], vectors::set_v2::vectors().len());
}

#[test]
fn a_changed_bar_file_is_refused_and_a_changed_input_fails_its_vector() {
    let d = tmp("tamper");
    copy_set(&d);
    // Loosen one bar: the hash no longer matches the manifest, nothing runs.
    let bars = std::fs::read_to_string(d.join("bars.json")).unwrap();
    std::fs::write(
        d.join("bars.json"),
        bars.replace("\"failed_max\": 0", "\"failed_max\": 9"),
    )
    .unwrap();
    let (code, _, err) = kshana(&["osnma", "vectors", "run", d.to_str().unwrap()]);
    assert_eq!(code, 2);
    assert!(err.contains("SHA-256"), "{err}");
    // Re-hash it in the manifest too: the built-in set's pinned hash still refuses it.
    let new = std::fs::read_to_string(d.join("bars.json")).unwrap();
    let mut m: Value =
        serde_json::from_str(&std::fs::read_to_string(d.join("manifest.json")).unwrap()).unwrap();
    m["bars_sha256"] = json!(hex::encode(Sha256::digest(new.as_bytes())));
    std::fs::write(d.join("manifest.json"), vectors::to_text(&m)).unwrap();
    let (code, _, err) = kshana(&["osnma", "vectors", "run", d.to_str().unwrap()]);
    assert_eq!(code, 2, "{err}");
    assert!(err.contains("pre-registered"), "{err}");
    // A changed input: that vector fails on its input hash, the others pass.
    let d = tmp("input");
    copy_set(&d);
    let p = d.join("inputs/V01-nominal.txt");
    let t = std::fs::read_to_string(&p).unwrap();
    std::fs::write(&p, t.replacen("# V01", "# changed V01", 1)).unwrap();
    let (code, out, _) = kshana(&["osnma", "vectors", "run", d.to_str().unwrap(), "--json"]);
    assert_eq!(code, 1);
    let r: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["failed"], 1);
    let v01 = &r["results"][0];
    assert_eq!(v01["id"], "V01-nominal");
    assert_eq!(v01["checks"][0]["bar"], "input_sha256");
    assert_eq!(v01["checks"][0]["pass"], false);
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn a_set_may_not_reach_outside_its_directory() {
    let d = tmp("escape");
    copy_set(&d);
    let mut m: Value =
        serde_json::from_str(&std::fs::read_to_string(d.join("manifest.json")).unwrap()).unwrap();
    m["vectors"][0]["input"] = json!("../outside.txt");
    std::fs::write(d.join("manifest.json"), vectors::to_text(&m)).unwrap();
    let (code, out, _) = kshana(&["osnma", "vectors", "run", d.to_str().unwrap(), "--json"]);
    assert_eq!(code, 1);
    let r: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["results"][0]["pass"], false);
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn the_bar_check_fails_unknown_bars_and_reads_reports_as_documented() {
    let report = json!({
        "overall": "failed", "alert": false, "nma_status": 2, "freshness_enforced": false,
        "satellites": [{"sat": "E02", "status": "failed"}],
        "events": [
            {"kind": "kroot_rejected", "reason": "Signature(BadSignature)", "count": 2},
            {"kind": "bad_crc", "count": 3}
        ],
        "tags": [
            {"adkd": 0, "status": {"state": "failed", "reason": "tag_mismatch"}},
            {"adkd": 4, "status": {"state": "authenticated"}},
            {"adkd": 7, "status": {"state": "discarded", "reason": "reserved_field"}}
        ]
    });
    let all = |bar: Value, exit: i32| {
        vectors::evaluate(&bar, &report, exit)
            .iter()
            .all(|c| c["pass"] == true)
    };
    assert!(all(json!({"overall": "failed", "exit": 3}), 3));
    assert!(!all(json!({"exit": 0}), 3));
    assert!(!all(json!({"no_such_bar": 1}), 3));
    assert!(!all(json!({"tags": {"no_such_count": 1}}), 3));
    assert!(all(
        json!({"events_present": [{"kind": "kroot_rejected", "reason": "Signature"}]}),
        3
    ));
    assert!(!all(
        json!({"events_present": [{"kind": "kroot_rejected", "reason": "Sig"}]}),
        3
    ));
    assert!(all(
        json!({"event_counts": [{"match": {"kind": "bad_crc"}, "min": 3, "max": 3}]}),
        3
    ));
    assert!(all(
        json!({"tags": {"failed_min": 1, "authenticated_max": 1}, "adkd_authenticated": [4]}),
        3
    ));
    assert!(!all(json!({"adkd_authenticated": [0]}), 3));
    assert!(all(json!({"fail_reasons": ["tag_mismatch"]}), 3));
    assert!(!all(json!({"fail_reasons_absent": ["tag_mismatch"]}), 3));
    assert!(all(json!({"fail_reasons_absent": ["macseq_mismatch"]}), 3));
    assert!(all(json!({"discard_reasons": ["reserved_field"]}), 3));
    assert!(!all(json!({"discard_reasons": ["adkd_not_in_table"]}), 3));
    // A satellite the report does not list is "not authenticated".
    assert!(all(json!({"satellites_not": {"E05": "authenticated"}}), 3));
    assert!(!all(json!({"satellites": {"E05": "authenticated"}}), 3));
}
