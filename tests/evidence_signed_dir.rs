// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana evidence verify-dir`: offline verification of a signed directory
//! (`kshana-dossier-signature/1`, `src/evidence/signed_dir.rs`, docs/SIGNED-DIRECTORY.md).
//!
//! * The committed synthetic pack `tests/fixtures/signed_dir/pack/` was signed by an independent
//!   Python implementation (`gen_pack.py`) with a test key from a published seed; the Rust
//!   verifier accepts it, and the Rust signer reproduces its signature byte for byte.
//! * Tamper cases on copies: a changed, missing or extra file, a wrong key, a bad key id, an
//!   altered `utc`, a changed format; `longterm.json` is ignored.
//!
//! PIN-SCOPE:    the public key of the published test seed and the committed synthetic pack.
//! PIN-EXCLUDES: any real product output or signer key.

use kshana::evidence::signed_dir::{key_id_of, sign_dir, verify_dir, Problem, FORMAT};
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

const TEST_KEY: &str = "a729ef7c772d4bf0da7a88d434bc2d4003084c548641bdfa1e5bbc3c7fb2b209";
static SEQ: AtomicU64 = AtomicU64::new(0);

fn seed() -> [u8; 32] {
    Sha256::digest(b"signed directory test vector").into()
}

fn key() -> [u8; 32] {
    let mut k = [0u8; 32];
    hex::decode_to_slice(TEST_KEY, &mut k).unwrap();
    k
}

fn pack() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/signed_dir/pack")
}

fn copy_dir(from: &Path, to: &Path) {
    std::fs::create_dir_all(to).unwrap();
    for e in std::fs::read_dir(from).unwrap() {
        let e = e.unwrap();
        let t = to.join(e.file_name());
        if e.file_type().unwrap().is_dir() {
            copy_dir(&e.path(), &t);
        } else {
            std::fs::copy(e.path(), t).unwrap();
        }
    }
}

fn scratch() -> PathBuf {
    let root = std::env::temp_dir().join(format!(
        "kshana-signed-dir-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&root);
    copy_dir(&pack(), &root);
    root
}

fn edit_signature(dir: &Path, f: impl FnOnce(&mut Value)) {
    let p = dir.join("signature.json");
    let mut v: Value = serde_json::from_str(&std::fs::read_to_string(&p).unwrap()).unwrap();
    f(&mut v);
    std::fs::write(&p, serde_json::to_string_pretty(&v).unwrap()).unwrap();
}

#[test]
fn the_independently_signed_pack_verifies() {
    assert_eq!(kshana::evidence::bundle::public_key_hex(&seed()), TEST_KEY);
    let r = verify_dir(&pack(), &[key()]).unwrap();
    assert!(r.passed, "{r:#?}");
    assert_eq!(r.format, FORMAT);
    assert_eq!(r.key_id, key_id_of(&key()));
    assert_eq!(r.files_listed, 5);
    assert_eq!(r.files_found, 5);
    assert_eq!(r.envelope["family"], "example");
    assert_eq!(r.envelope["format"], "example-pack/1");
    // Without --trust: intact, not trusted, key reported.
    let r = verify_dir(&pack(), &[]).unwrap();
    assert!(r.signature_valid && r.problems.is_empty() && !r.trusted && !r.passed);
    assert_eq!(r.public_key, TEST_KEY);
}

#[test]
fn the_rust_signer_reproduces_the_python_signature() {
    let d = scratch();
    let before = std::fs::read_to_string(d.join("signature.json")).unwrap();
    let v: Value = serde_json::from_str(&before).unwrap();
    sign_dir(
        &d,
        &seed(),
        "Test signer (synthetic)",
        "2026-11-21T09:00:00Z",
    )
    .unwrap();
    let after: Value =
        serde_json::from_str(&std::fs::read_to_string(d.join("signature.json")).unwrap()).unwrap();
    assert_eq!(after, v);
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn tampering_is_found() {
    // A changed file.
    let d = scratch();
    std::fs::write(d.join("data/series.csv"), "t,x\n0,1\n1,3\n").unwrap();
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(r.signature_valid && !r.passed);
    assert!(
        matches!(&r.problems[..], [Problem::Changed { path, .. }] if path == "data/series.csv")
    );
    let _ = std::fs::remove_dir_all(&d);

    // A missing file.
    let d = scratch();
    std::fs::remove_file(d.join("data/nested/notes.txt")).unwrap();
    let r = verify_dir(&d, &[key()]).unwrap();
    assert_eq!(
        r.problems,
        [Problem::Missing {
            path: "data/nested/notes.txt".into()
        }]
    );
    let _ = std::fs::remove_dir_all(&d);

    // An extra file, nested.
    let d = scratch();
    std::fs::write(d.join("data/extra.txt"), "x").unwrap();
    let r = verify_dir(&d, &[key()]).unwrap();
    assert_eq!(
        r.problems,
        [Problem::NotCovered {
            path: "data/extra.txt".into()
        }]
    );
    let _ = std::fs::remove_dir_all(&d);

    // longterm.json is ignored (added after signing).
    let d = scratch();
    std::fs::write(d.join("longterm.json"), "{}").unwrap();
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(r.passed && r.longterm_present);
    let _ = std::fs::remove_dir_all(&d);

    // A wrong trusted key: intact but not trusted.
    let other: [u8; 32] = Sha256::digest(b"another key").into();
    let other_pk = kshana::evidence::bundle::public_key_hex(&other);
    let mut ok = [0u8; 32];
    hex::decode_to_slice(&other_pk, &mut ok).unwrap();
    let r = verify_dir(&pack(), &[ok]).unwrap();
    assert!(r.signature_valid && !r.trusted && !r.passed);

    // The statement re-keyed to another public key: the signature fails.
    let d = scratch();
    edit_signature(&d, |v| {
        v["public_key"] = Value::String(other_pk.clone());
        v["key_id"] = Value::String(key_id_of(&ok));
    });
    let r = verify_dir(&d, &[ok]).unwrap();
    assert!(!r.signature_valid && !r.passed);
    let _ = std::fs::remove_dir_all(&d);

    // A bad key id: a problem, and the signature (which covers it) fails too.
    let d = scratch();
    edit_signature(&d, |v| {
        v["key_id"] = Value::String("0000000000000000".into())
    });
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(matches!(r.problems[..], [Problem::KeyId { .. }]));
    assert!(!r.signature_valid);
    let _ = std::fs::remove_dir_all(&d);

    // An altered utc.
    let d = scratch();
    edit_signature(&d, |v| {
        v["utc"] = Value::String("2026-11-22T09:00:00Z".into())
    });
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(!r.signature_valid && r.problems.is_empty() && !r.passed);
    let _ = std::fs::remove_dir_all(&d);

    // Another format: a problem (and the signature, which covers it, fails).
    let d = scratch();
    edit_signature(&d, |v| v["format"] = Value::String("other/1".into()));
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(matches!(&r.problems[..], [Problem::Format { found }] if found == "other/1"));
    let _ = std::fs::remove_dir_all(&d);

    // An extra field outside the signed statement is reported; it does not change the verdict.
    let d = scratch();
    edit_signature(&d, |v| v["comment"] = Value::String("added later".into()));
    let r = verify_dir(&d, &[key()]).unwrap();
    assert!(r.passed);
    assert_eq!(r.unsigned_fields, ["comment"]);
    let _ = std::fs::remove_dir_all(&d);
}

#[cfg(unix)]
#[test]
fn a_symbolic_link_is_not_covered() {
    let d = scratch();
    std::os::unix::fs::symlink("/etc/hostname", d.join("link")).unwrap();
    let r = verify_dir(&d, &[key()]).unwrap();
    assert_eq!(
        r.problems,
        [Problem::NotRegular {
            path: "link".into()
        }]
    );
    let _ = std::fs::remove_dir_all(&d);
}

#[test]
fn the_command_line_and_its_exit_codes() {
    let run = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .arg("evidence")
            .args(args)
            .output()
            .unwrap()
    };
    let p = pack();
    let p = p.to_str().unwrap();
    let o = run(&["verify-dir", p, "--trust", TEST_KEY, "--json"]);
    assert_eq!(
        o.status.code(),
        Some(0),
        "{}",
        String::from_utf8_lossy(&o.stderr)
    );
    let doc: Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(doc["schema"], "kshana.signed-dir-verify/1");
    assert_eq!(doc["passed"], true);
    assert_eq!(run(&["verify-dir", p]).status.code(), Some(3));
    let d = scratch();
    std::fs::write(d.join("README.txt"), "changed\n").unwrap();
    let o = run(&["verify-dir", d.to_str().unwrap(), "--trust", TEST_KEY]);
    assert_eq!(o.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&o.stdout).contains("README.txt"));
    let _ = std::fs::remove_dir_all(&d);
    assert_eq!(run(&["verify-dir"]).status.code(), Some(2));
    assert_eq!(run(&["verify-dir", p, "--bogus"]).status.code(), Some(2));
    assert_eq!(
        run(&["verify-dir", p, "--trust", "zz"]).status.code(),
        Some(2)
    );
    // The existing pack verifier is unchanged: it still refuses a directory without manifest.json.
    assert_eq!(
        run(&["verify", p, "--pubkey", TEST_KEY]).status.code(),
        Some(1)
    );
}

/// One synthetic pack per operating-envelope family, each signed by the independent Python
/// signer: every one verifies, reports its family, and is reproduced by the Rust signer.
#[test]
fn one_synthetic_pack_per_envelope_family_round_trips() {
    const FAMILIES: [&str; 9] = [
        "interference-and-forensics",
        "maritime",
        "aviation-and-airspace",
        "land-transport-agriculture-and-cellular",
        "timing",
        "insurance-and-finance",
        "eloran-and-terrestrial",
        "receivers-space-and-test",
        "evidence-and-governance",
    ];
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/signed_dir/families");
    let on_disk = std::fs::read_dir(&root).unwrap().count();
    assert_eq!(on_disk, FAMILIES.len());
    for (i, fam) in FAMILIES.iter().enumerate() {
        let dir = root.join(fam);
        let r = verify_dir(&dir, &[key()]).unwrap();
        assert!(r.passed, "{fam}: {r:#?}");
        assert_eq!(r.envelope["family"], *fam);
        assert_eq!(r.envelope["format"], format!("example-{fam}/1"));
        assert_eq!(r.files_listed, 3);
        // The Rust signer gives the same statement for the same files and time.
        let tmp = std::env::temp_dir().join(format!(
            "kshana-signed-dir-family-{}-{}",
            std::process::id(),
            SEQ.fetch_add(1, Relaxed)
        ));
        let _ = std::fs::remove_dir_all(&tmp);
        copy_dir(&dir, &tmp);
        sign_dir(
            &tmp,
            &seed(),
            "Test signer (synthetic)",
            &format!("2026-11-21T10:{i:02}:00Z"),
        )
        .unwrap();
        let a: Value =
            serde_json::from_str(&std::fs::read_to_string(dir.join("signature.json")).unwrap())
                .unwrap();
        let b: Value =
            serde_json::from_str(&std::fs::read_to_string(tmp.join("signature.json")).unwrap())
                .unwrap();
        assert_eq!(a, b, "{fam}");
        // And a changed report in that family is refused.
        std::fs::write(tmp.join("report.json"), "{}").unwrap();
        assert!(!verify_dir(&tmp, &[key()]).unwrap().passed, "{fam}");
        let _ = std::fs::remove_dir_all(&tmp);
    }
}
