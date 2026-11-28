// SPDX-License-Identifier: AGPL-3.0-only
//! The open space evidence pack profile (`kshana.space-evidence-pack/1`, docs/SPACE-EVIDENCE-PACK.md)
//! on the fictional pack in tests/fixtures/space-evidence/pack: one item of each of the six kinds,
//! an embedded `kshana-evidence/1` pack (a copy of the receiver-trust oracle's static pack), and a
//! CycloneDX HBOM. Each test copies the pack to a temporary directory before changing it.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

use kshana::evidence::signed_dir::sign_dir;
use kshana::evidence::space_pack::{validate_dir, validate_manifest, FORMAT, KINDS, SCHEMA};
use serde_json::Value;

fn fixture() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/space-evidence/pack")
}

fn copy(from: &Path, to: &Path) {
    std::fs::create_dir_all(to).unwrap();
    for e in std::fs::read_dir(from).unwrap().flatten() {
        let p = e.path();
        if p.is_dir() {
            copy(&p, &to.join(e.file_name()));
        } else {
            std::fs::copy(&p, to.join(e.file_name())).unwrap();
        }
    }
}

fn scratch(name: &str) -> PathBuf {
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-space-pack-{name}-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&dir);
    copy(&fixture(), &dir);
    dir
}

fn codes(r: &kshana::evidence::space_pack::Report) -> Vec<&'static str> {
    r.errors.iter().map(|e| e.code).collect()
}

fn edit_manifest(dir: &Path, f: impl FnOnce(&mut Value)) {
    let p = dir.join("space-evidence.json");
    let mut v: Value = serde_json::from_slice(&std::fs::read(&p).unwrap()).unwrap();
    f(&mut v);
    std::fs::write(&p, serde_json::to_string_pretty(&v).unwrap()).unwrap();
}

#[test]
fn the_fixture_pack_is_valid_and_covers_every_kind() {
    let r = validate_dir(&fixture(), &[]).unwrap();
    assert!(r.valid, "{:#?}", r.errors);
    assert_eq!(r.label, "MODELLED");
    assert_eq!(r.pack_label.as_deref(), Some("MODELLED"));
    // One VALIDATED item and five MODELLED: the weakest is MODELLED.
    assert_eq!(r.computed_label.as_deref(), Some("MODELLED"));
    let mut kinds: Vec<&str> = r.items.iter().map(|i| i.kind.as_str()).collect();
    kinds.sort_unstable();
    let mut all = KINDS.to_vec();
    all.sort_unstable();
    assert_eq!(kinds, all);
    // The embedded receiver-trust pack verifies (against the key it names: not pinned).
    assert_eq!(r.embedded_packs.len(), 1);
    assert!(r.embedded_packs[0].ok, "{:?}", r.embedded_packs[0].failures);
    // Warnings, not errors: unsigned, and one HBOM part from an independent distributor.
    let w: Vec<&str> = r.warnings.iter().map(|w| w.code).collect();
    assert!(w.contains(&"unsigned"), "{w:?}");
    assert!(w.contains(&"non-authorised-source"), "{w:?}");
    assert!(r.signature.is_none());
}

#[test]
fn a_changed_or_extra_file_is_found() {
    let d = scratch("changed");
    std::fs::write(d.join("ifx-001/spectrum.csv"), "changed\n").unwrap();
    std::fs::write(d.join("extra.txt"), "not listed\n").unwrap();
    let r = validate_dir(&d, &[]).unwrap();
    assert!(!r.valid);
    let c = codes(&r);
    assert!(c.contains(&"file-mismatch"), "{c:?}");
    assert!(c.contains(&"unlisted-file"), "{c:?}");
    // A changed byte in the embedded pack fails that pack's own verification.
    std::fs::write(d.join("sensor-001/gnss-pack/config.json"), "{}").unwrap();
    let r = validate_dir(&d, &[]).unwrap();
    assert!(codes(&r).contains(&"embedded-pack-failed"));
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn labels_must_be_consistent() {
    let d = scratch("labels");
    edit_manifest(&d, |v| {
        v["label"] = "VALIDATED".into();
        v["items"][0].as_object_mut().unwrap().remove("oracle");
        v["items"][1]["label"] = "CERTIFIED".into();
        v["items"][2]["related"] = serde_json::json!(["nope"]);
    });
    let r = validate_dir(&d, &[]).unwrap();
    let c = codes(&r);
    for want in [
        "label-mismatch",
        "validated-without-oracle",
        "bad-label",
        "unknown-related",
    ] {
        assert!(c.contains(&want), "{want} not in {c:?}");
    }
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn kind_rules_and_unsafe_paths_are_checked() {
    let fb = std::fs::read(fixture().join("space-evidence.json")).unwrap();
    let mut v: Value = serde_json::from_slice(&fb).unwrap();
    v["items"][1]["body"]["end_utc"] = "2026-11-20T09:00:00Z".into();
    v["items"][1]["body"]["confidence"] = 1.5.into();
    v["items"][1]["body"]["geolocation"]["semi_minor_km"] = 500.0.into();
    v["items"][2]["files"][0]["path"] = "../outside.txt".into();
    v["items"][3]["body"]["closure"] = "done".into();
    v["items"][4]["body"]["tests"][0]["result"] = "ok".into();
    v["items"][5]["files"][0]["role"] = "json".into();
    v["items"][2]["title"] = "Fully compliant telecommand authentication".into();
    let r = validate_manifest(&v, None, &[]);
    let c = codes(&r);
    for want in [
        "bad-window",
        "out-of-range",
        "bad-value",
        "unsafe-path",
        "hbom-file",
    ] {
        assert!(c.contains(&want), "{want} not in {c:?}");
    }
    assert!(r.warnings.iter().any(|w| w.code == "assertion-word"));
}

#[test]
fn a_signed_pack_is_checked_with_the_existing_signed_directory_format() {
    let d = scratch("signed");
    let seed = [7u8; 32];
    sign_dir(
        &d,
        &seed,
        "Example operator (test key)",
        "2026-11-27T12:00:00Z",
    )
    .unwrap();
    let pk_hex = kshana::evidence::public_key_hex(&seed);
    let mut pk = [0u8; 32];
    hex::decode_to_slice(&pk_hex, &mut pk).unwrap();
    // Trusted: valid, no warning about the signer.
    let r = validate_dir(&d, &[pk]).unwrap();
    assert!(r.valid, "{:#?}", r.errors);
    let s = r.signature.as_ref().unwrap();
    assert!(s.signature_valid && s.trusted);
    // Not trusted: still valid, with a warning.
    let r = validate_dir(&d, &[]).unwrap();
    assert!(r.valid);
    assert!(r.warnings.iter().any(|w| w.code == "signer-not-trusted"));
    // Re-hashing a changed file into the manifest does not help: the signature covers it.
    std::fs::write(d.join("anm-001/telemetry.csv"), "changed\n").unwrap();
    edit_manifest(&d, |v| {
        let b = std::fs::read(d.join("anm-001/telemetry.csv")).unwrap();
        v["items"][3]["files"][0]["sha256"] =
            hex::encode(<sha2::Sha256 as sha2::Digest>::digest(&b)).into();
        v["items"][3]["files"][0]["bytes"] = b.len().into();
    });
    let r = validate_dir(&d, &[pk]).unwrap();
    assert!(!r.valid);
    assert_eq!(codes(&r), ["signature"]);
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn the_schema_names_the_kinds_and_labels() {
    let s: Value = serde_json::from_str(SCHEMA).unwrap();
    assert_eq!(s["properties"]["format"]["const"], FORMAT);
    let kinds: Vec<&str> = s["definitions"]["item"]["properties"]["kind"]["enum"]
        .as_array()
        .unwrap()
        .iter()
        .map(|k| k.as_str().unwrap())
        .collect();
    assert_eq!(kinds, KINDS);
    assert_eq!(
        s["properties"]["disclaimer"]["const"],
        kshana::evidence::space_pack::DISCLAIMER
    );
}

#[test]
fn cli_validate_hash_schema_and_exit_codes() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let f = fixture().to_string_lossy().to_string();
    let out = Command::new(bin)
        .args(["evidence", "space-pack", "validate", &f, "--json"])
        .output()
        .unwrap();
    assert_eq!(
        out.status.code(),
        Some(0),
        "{}",
        String::from_utf8_lossy(&out.stdout)
    );
    let v: Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["valid"], true);
    assert_eq!(v["label"], "MODELLED");
    // `hash` reproduces the manifest's own hashes.
    let out = Command::new(bin)
        .args(["evidence", "space-pack", "hash", &f])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0));
    let hashed: Value = serde_json::from_slice(&out.stdout).unwrap();
    let stored: Value =
        serde_json::from_slice(&std::fs::read(fixture().join("space-evidence.json")).unwrap())
            .unwrap();
    assert_eq!(hashed, stored);
    let out = Command::new(bin)
        .args(["evidence", "space-pack", "schema"])
        .output()
        .unwrap();
    assert_eq!(String::from_utf8_lossy(&out.stdout), SCHEMA);
    let d = scratch("cli");
    std::fs::write(d.join("extra.txt"), "x").unwrap();
    let out = Command::new(bin)
        .args(["evidence", "space-pack", "validate", &d.to_string_lossy()])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1));
    let out = Command::new(bin)
        .args(["evidence", "space-pack", "validate"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    let _ = std::fs::remove_dir_all(&d);
}
