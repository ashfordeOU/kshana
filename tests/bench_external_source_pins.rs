// SPDX-License-Identifier: AGPL-3.0-only
//! D18, item 2 (docs/design/evidence/d18-bench-leftovers/PREREGISTRATION.md): the bench checks
//! the files of an external source (TEXBAT) against the hashes its manifest pins.
//!
//! PIN-SCOPE:    `kshana bench verify-manifest` reads `sources[].files` (path, bytes, SHA-256),
//!               refuses a file whose hash or size differs and a malformed or missing hash on a
//!               pinned source, and counts the files of an unpinned source as unpinned; the
//!               shipped `bench/manifests/b-iq.json` keeps its TEXBAT source well formed
//! PIN-EXCLUDES: the TEXBAT hashes themselves (not yet obtained: `sha256_pinned` is false until
//!               the first fetch records them)

use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn tmp() -> PathBuf {
    let d = std::env::temp_dir().join(format!(
        "kshana-bench-sources-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn verify(dir: &std::path::Path, manifest: &serde_json::Value) -> (i32, String) {
    let m = dir.join("manifest.json");
    std::fs::write(&m, serde_json::to_string_pretty(manifest).unwrap()).unwrap();
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["bench", "verify-manifest"])
        .arg(&m)
        .arg("--root")
        .arg(dir)
        .output()
        .unwrap();
    let text =
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr);
    (out.status.code().unwrap_or(-1), text)
}

fn manifest(pinned: bool, files: serde_json::Value) -> serde_json::Value {
    serde_json::json!({
        "sources": [{
            "name": "TEXBAT (UT Radionavigation Lab)",
            "sha256_pinned": pinned,
            "files": files
        }]
    })
}

#[test]
fn a_texbat_file_whose_hash_differs_is_refused() {
    let dir = tmp();
    let body = b"stand-in for a TEXBAT recording\n";
    std::fs::write(dir.join("ds2.bin"), body).unwrap();
    let good = kshana::bench::sha256_hex(body);
    let entry = |sha: &str, bytes: usize| serde_json::json!([{ "path": "ds2.bin", "bytes": bytes, "sha256": sha }]);

    let (code, out) = verify(&dir, &manifest(true, entry(&good, body.len())));
    assert_eq!(code, 0, "the right file passes: {out}");

    // The file changed under its pinned hash.
    std::fs::write(dir.join("ds2.bin"), b"another recording\n").unwrap();
    let (code, out) = verify(&dir, &manifest(true, entry(&good, body.len())));
    assert_eq!(code, 1, "a different file must be refused: {out}");
    std::fs::write(dir.join("ds2.bin"), body).unwrap();

    // The right hash with the wrong size is refused too.
    let (code, _) = verify(&dir, &manifest(true, entry(&good, body.len() + 1)));
    assert_eq!(code, 1);

    // A malformed hash, or a pinned file with none, is an error, not a pass.
    let (code, out) = verify(
        &dir,
        &manifest(true, entry(&good.to_uppercase(), body.len())),
    );
    assert_ne!(code, 0, "{out}");
    let (code, out) = verify(
        &dir,
        &manifest(true, serde_json::json!([{ "path": "ds2.bin" }])),
    );
    assert_ne!(code, 0, "{out}");

    // An unpinned source's files are counted, not checked.
    let (code, out) = verify(&dir, &manifest(false, entry(&good, body.len())));
    assert_eq!(code, 0, "{out}");
    assert!(out.contains("ds2.bin"), "{out}");

    // A missing file fails.
    std::fs::remove_file(dir.join("ds2.bin")).unwrap();
    let (code, _) = verify(&dir, &manifest(true, entry(&good, body.len())));
    assert_eq!(code, 1);
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_shipped_texbat_source_is_well_formed() {
    let m: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("bench/manifests/b-iq.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let texbat = m["sources"]
        .as_array()
        .unwrap()
        .iter()
        .find(|s| s["name"].as_str().unwrap_or("").starts_with("TEXBAT"))
        .expect("the TEXBAT source");
    let pinned = texbat["sha256_pinned"].as_bool().expect("sha256_pinned");
    let files = texbat["files"].as_array().expect("files");
    for f in files {
        let sha = f["sha256"].as_str().unwrap_or("");
        assert!(kshana::bench::is_sha256_hex(sha), "{f}");
        assert!(f["bytes"].as_u64().is_some_and(|b| b > 0), "{f}");
        assert!(f["path"].as_str().is_some_and(|p| !p.is_empty()), "{f}");
    }
    // Pinned exactly when it lists files.
    assert_eq!(pinned, !files.is_empty());
}
