// SPDX-License-Identifier: AGPL-3.0-only
//! Evidence-pack verification against an independent clean-room implementation.
//!
//! The oracle is `scripts/evidence_verify_cleanroom.py`, a verifier written from the
//! normative section of `docs/EVIDENCE-PACKS.md` alone, using Python's `hashlib` and the
//! `cryptography` package's Ed25519 (a different language, a different SHA-256 and a different
//! Ed25519 implementation from this crate's `sha2` and `ed25519-dalek`). The script runs on
//! the packs and tamper cases of `tests/fixtures/evidence_pack_oracle/` and writes
//! `reference.json`; this test applies the same cases to `kshana::evidence::verify_bundle`
//! and compares. CI needs no Python.
//!
//! # PRE-REGISTERED comparison rules
//!
//! Registered in this file's first commit, before the oracle was run on any case. Not to be
//! loosened after seeing a result; a disagreement is reported, not tuned away.
//!
//! For **every** case (intact packs and each tamper case), all four must agree EXACTLY
//! (tolerance zero, no partial credit):
//!
//! 1. the verdict `ok` (the failure set is empty);
//! 2. the set of failures, each as the pair (`code`, file `name` or null), as a set;
//! 3. the signature verdict `signature_valid` (true, false, or null for "not checked");
//! 4. the hash-chain head recomputed from the files of the (tampered) pack as stored, and
//!    the chain head the manifest records (null where the manifest cannot be read).
//!
//! At least 40 cases must be present, covering: intact packs; a changed byte in each of the
//! four artifacts, in the manifest and in the signature; truncation and extension; a removed,
//! renamed, added and swapped file; a reordered manifest; a manifest re-hashed and re-chained
//! without the key; a wrong pinned key; a stripped, replaced, junk and valid timestamp token;
//! and the full-log check.

use kshana::evidence::bundle::{chain_link, chain_start};
use kshana::evidence::{verify_bundle, Files, VerifyOptions};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};
use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

const MIN_CASES: usize = 40;

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/evidence_pack_oracle")
}

fn read_json(name: &str) -> Value {
    let p = dir().join(name);
    let t = std::fs::read_to_string(&p).unwrap_or_else(|e| {
        panic!(
            "fixture {} missing ({e}); run scripts/gen_evidence_pack_ref.py",
            p.display()
        )
    });
    serde_json::from_str(&t).unwrap()
}

fn read_pack(rel: &str) -> Files {
    let mut f = Files::new();
    for e in std::fs::read_dir(dir().join(rel)).unwrap() {
        let e = e.unwrap();
        f.insert(
            e.file_name().to_string_lossy().to_string(),
            std::fs::read(e.path()).unwrap(),
        );
    }
    f
}

fn hexv(v: &Value) -> Vec<u8> {
    hex::decode(v.as_str().unwrap()).unwrap()
}

fn apply(files: &mut Files, op: &Value) {
    let name = |k: &str| op[k].as_str().unwrap().to_string();
    match op["op"].as_str().unwrap() {
        "flip" => {
            let b = files.get_mut(&name("file")).unwrap();
            let off = op["offset"].as_u64().unwrap() as usize;
            b[off] ^= 1 << op["bit"].as_u64().unwrap();
        }
        "truncate" => files
            .get_mut(&name("file"))
            .unwrap()
            .truncate(op["len"].as_u64().unwrap() as usize),
        "append" => files
            .get_mut(&name("file"))
            .unwrap()
            .extend(hexv(&op["hex"])),
        "remove" => {
            files.remove(&name("file")).unwrap();
        }
        "rename" => {
            let b = files.remove(&name("from")).unwrap();
            files.insert(name("to"), b);
        }
        "swap" => {
            let (a, b) = (name("a"), name("b"));
            let (x, y) = (files[&a].clone(), files[&b].clone());
            files.insert(a, y);
            files.insert(b, x);
        }
        "add" => {
            files.insert(name("file"), hexv(&op["hex"]));
        }
        "replace" => {
            files.insert(
                name("file"),
                std::fs::read(dir().join(name("with"))).unwrap(),
            );
        }
        other => panic!("unknown op {other}"),
    }
}

/// The chain head recomputed from the artifact files as stored (null if any is absent).
fn chain_head_of_files(files: &Files) -> Value {
    let mut prev = chain_start();
    for name in [
        "log-slice.bin",
        "config.json",
        "epochs.json",
        "summary.html",
    ] {
        let Some(b) = files.get(name) else {
            return Value::Null;
        };
        let d: [u8; 32] = Sha256::digest(b).into();
        prev = chain_link(&prev, name, &d);
    }
    json!(hex::encode(prev))
}

fn manifest_chain_head(files: &Files) -> Value {
    files
        .get("manifest.json")
        .and_then(|m| serde_json::from_slice::<Value>(m).ok())
        .and_then(|m| m.get("chain_head").cloned())
        .filter(Value::is_string)
        .unwrap_or(Value::Null)
}

fn failure_set(report: &kshana::evidence::VerifyReport) -> BTreeSet<(String, Option<String>)> {
    report
        .failures
        .iter()
        .map(|f| {
            let v = serde_json::to_value(f).unwrap();
            (
                v["code"].as_str().unwrap().to_string(),
                v.get("name").and_then(Value::as_str).map(str::to_string),
            )
        })
        .collect()
}

fn oracle_failure_set(v: &Value) -> BTreeSet<(String, Option<String>)> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|f| {
            (
                f["code"].as_str().unwrap().to_string(),
                f["name"].as_str().map(str::to_string),
            )
        })
        .collect()
}

#[test]
fn kshana_and_the_clean_room_verifier_agree_on_every_case() {
    let cases = read_json("cases.json");
    let reference = read_json("reference.json");
    let packs = cases["packs"].as_object().unwrap();
    let list = cases["cases"].as_array().unwrap();
    assert!(
        list.len() >= MIN_CASES,
        "{} cases, at least {MIN_CASES} are pre-registered",
        list.len()
    );
    assert_eq!(reference["cases"].as_object().unwrap().len(), list.len());

    let mut disagreements = Vec::new();
    for c in list {
        let id = c["id"].as_str().unwrap();
        let pack = &packs[c["pack"].as_str().unwrap()];
        let mut files = read_pack(pack["dir"].as_str().unwrap());
        for op in c["ops"].as_array().unwrap() {
            apply(&mut files, op);
        }
        let opts = &c["options"];
        let pin: Option<[u8; 32]> = match opts["pin"].as_str() {
            Some("right") => Some(hexv(&pack["public_key"]).try_into().unwrap()),
            Some("wrong") => Some(hexv(&cases["wrong_public_key"]).try_into().unwrap()),
            _ => None,
        };
        let full_log = if opts["full_log"].as_bool().unwrap_or(false) {
            Some(std::fs::read(dir().join(pack["full_log"].as_str().unwrap())).unwrap())
        } else {
            None
        };
        let r = verify_bundle(
            &files,
            &VerifyOptions {
                expected_public_key: pin,
                full_log: full_log.as_deref(),
                require_timestamp: opts["require_timestamp"].as_bool().unwrap_or(false),
            },
        );
        let o = &reference["cases"][id];
        let mut bad: Vec<String> = Vec::new();
        if r.ok != o["ok"].as_bool().unwrap() {
            bad.push(format!("ok: kshana {} oracle {}", r.ok, o["ok"]));
        }
        let (ours, theirs) = (failure_set(&r), oracle_failure_set(&o["failures"]));
        if ours != theirs {
            bad.push(format!("failures: kshana {ours:?} oracle {theirs:?}"));
        }
        let sig = r.signature_valid.map_or(Value::Null, Value::Bool);
        if sig != o["signature_valid"] {
            bad.push(format!(
                "signature_valid: kshana {sig} oracle {}",
                o["signature_valid"]
            ));
        }
        if chain_head_of_files(&files) != o["chain_head_of_files"] {
            bad.push(format!(
                "chain head of files: kshana {} oracle {}",
                chain_head_of_files(&files),
                o["chain_head_of_files"]
            ));
        }
        if manifest_chain_head(&files) != o["manifest_chain_head"] {
            bad.push(format!(
                "manifest chain head: kshana {} oracle {}",
                manifest_chain_head(&files),
                o["manifest_chain_head"]
            ));
        }
        if !bad.is_empty() {
            disagreements.push(format!("{id}: {}", bad.join("; ")));
        }
    }
    assert!(
        disagreements.is_empty(),
        "{} of {} cases disagree:\n{}",
        disagreements.len(),
        list.len(),
        disagreements.join("\n")
    );
}

#[test]
fn the_intact_packs_verify_in_both() {
    let cases = read_json("cases.json");
    let reference = read_json("reference.json");
    for c in cases["cases"].as_array().unwrap() {
        if c["expect"].as_str() == Some("intact") {
            let id = c["id"].as_str().unwrap();
            assert_eq!(reference["cases"][id]["ok"], true, "{id}");
            assert_eq!(reference["cases"][id]["signature_valid"], true, "{id}");
        }
    }
}
