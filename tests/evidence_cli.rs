//! `kshana receiver-trust evidence` and `kshana evidence verify`, end to end on the bundled
//! synthetic example log.

use std::path::{Path, PathBuf};
use std::process::{Command, Output};

fn kshana(args: &[&str]) -> Output {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap()
}

fn scratch(name: &str) -> PathBuf {
    let d = std::env::temp_dir().join(format!("kshana-evidence-{name}-{}", std::process::id()));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn text(o: &Output) -> String {
    format!(
        "{}{}",
        String::from_utf8_lossy(&o.stdout),
        String::from_utf8_lossy(&o.stderr)
    )
}

fn scenario() -> String {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("examples/receiver-trust/session.toml")
        .display()
        .to_string()
}

fn make_pack(dir: &Path) -> (PathBuf, PathBuf) {
    let key = dir.join("signer.key");
    let o = kshana(&["evidence", "keygen", "--out", key.to_str().unwrap()]);
    assert!(o.status.success(), "{}", text(&o));
    let pack = dir.join("pack");
    let o = kshana(&[
        "receiver-trust",
        "evidence",
        &scenario(),
        "--from",
        "100",
        "--to",
        "260",
        "--key",
        key.to_str().unwrap(),
        "--out",
        pack.to_str().unwrap(),
        "--title",
        "Example jamming session",
        "--created-utc",
        "none",
    ]);
    assert!(o.status.success(), "{}", text(&o));
    (key, pack)
}

#[test]
fn make_verify_and_tamper() {
    let dir = scratch("e2e");
    let (key, pack) = make_pack(&dir);
    let pubkey = format!("{}.pub", key.display());
    for f in [
        "manifest.json",
        "manifest.sig",
        "log-slice.bin",
        "config.json",
        "epochs.json",
        "summary.html",
    ] {
        assert!(pack.join(f).is_file(), "{f}");
    }
    let key_text = std::fs::read_to_string(&key).unwrap();
    assert!(
        !std::fs::read_to_string(pack.join("manifest.json"))
            .unwrap()
            .contains(key_text.trim()),
        "private key must never enter a pack"
    );

    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
    ]);
    assert!(o.status.success(), "{}", text(&o));
    assert!(text(&o).contains("VERIFIED"));

    // Config is portable: no local directory names.
    let cfg = std::fs::read_to_string(pack.join("config.json")).unwrap();
    assert!(!cfg.contains(env!("CARGO_MANIFEST_DIR")));
    assert!(cfg.contains("cn0_drop_db"));
    let html = std::fs::read_to_string(pack.join("summary.html")).unwrap();
    assert!(html.contains("not a legal opinion"));

    // With the original log the slice is checked against it.
    let log = Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("examples/receiver-trust/illustrative-jamming.nmea");
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
        "--log",
        log.to_str().unwrap(),
    ]);
    assert!(o.status.success(), "{}", text(&o));

    // The NMEA reader reports source spans, so the slice is the window's bytes, not the log.
    let manifest = std::fs::read_to_string(pack.join("manifest.json")).unwrap();
    assert!(manifest.contains("\"byte-range\""), "{manifest}");
    let slice = std::fs::read(pack.join("log-slice.bin")).unwrap();
    assert!(slice.len() < std::fs::read(&log).unwrap().len());

    // One changed byte in epochs.json.
    let p = pack.join("epochs.json");
    let mut b = std::fs::read(&p).unwrap();
    let mid = b.len() / 2;
    b[mid] ^= 1;
    std::fs::write(&p, &b).unwrap();
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
    ]);
    assert_eq!(o.status.code(), Some(1), "{}", text(&o));
    let t = text(&o);
    assert!(
        t.contains("file-hash-mismatch") && t.contains("epochs.json") && t.contains("NOT VERIFIED"),
        "{t}"
    );
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn refuses_to_overwrite_and_bad_windows() {
    let dir = scratch("refuse");
    let (key, pack) = make_pack(&dir);
    // Second run into the same directory, and a second keygen over the same key, are refused.
    let o = kshana(&[
        "receiver-trust",
        "evidence",
        &scenario(),
        "--from",
        "100",
        "--to",
        "260",
        "--key",
        key.to_str().unwrap(),
        "--out",
        pack.to_str().unwrap(),
    ]);
    assert!(!o.status.success());
    let o = kshana(&["evidence", "keygen", "--out", key.to_str().unwrap()]);
    assert!(!o.status.success());
    let o = kshana(&[
        "receiver-trust",
        "evidence",
        &scenario(),
        "--from",
        "9000",
        "--to",
        "9100",
        "--key",
        key.to_str().unwrap(),
        "--out",
        dir.join("p2").to_str().unwrap(),
    ]);
    assert!(!o.status.success() && text(&o).contains("no epoch"));
    let _ = std::fs::remove_dir_all(&dir);
}
