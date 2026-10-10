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
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!(
        "kshana-evidence-{name}-{}-{}",
        std::process::id(),
        uniq
    ));
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

// ---- critic-review behaviours --------------------------------------------------------

fn enc(tag: u8, content: &[u8]) -> Vec<u8> {
    let mut o = vec![tag];
    if content.len() < 0x80 {
        o.push(content.len() as u8);
    } else {
        o.extend([0x82, (content.len() >> 8) as u8, content.len() as u8]);
    }
    o.extend(content);
    o
}

/// An unsigned, synthetic RFC 3161 response over `digest` (not any authority's output).
fn token_over(digest: &[u8]) -> Vec<u8> {
    use sha2::Digest as _;
    let _ = sha2::Sha256::new();
    let sha256 = [0x60, 0x86, 0x48, 0x01, 0x65, 0x03, 0x04, 0x02, 0x01];
    let alg = enc(0x30, &enc(0x06, &sha256));
    let imprint = enc(0x30, &[alg, enc(0x04, digest)].concat());
    let tst = enc(
        0x30,
        &[
            enc(0x02, &[1]),
            enc(0x06, &[0x2a, 0x03]),
            imprint,
            enc(0x02, &[7]),
            enc(0x18, b"20260102030405Z"),
        ]
        .concat(),
    );
    let tst_info = [
        0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x09, 0x10, 0x01, 0x04,
    ];
    let signed_data = [0x2a, 0x86, 0x48, 0x86, 0xf7, 0x0d, 0x01, 0x07, 0x02];
    let encap = enc(
        0x30,
        &[enc(0x06, &tst_info), enc(0xA0, &enc(0x04, &tst))].concat(),
    );
    let signed = enc(0x30, &[enc(0x02, &[3]), enc(0x31, &[]), encap].concat());
    let ci = [enc(0x06, &signed_data), enc(0xA0, &signed)].concat();
    enc(
        0x30,
        &[enc(0x30, &enc(0x02, &[0])), enc(0x30, &ci)].concat(),
    )
}

#[test]
fn an_unpinned_signer_is_not_a_clean_pass() {
    let dir = scratch("unpinned");
    let (key, pack) = make_pack(&dir);
    let o = kshana(&["evidence", "verify", pack.to_str().unwrap()]);
    assert_eq!(o.status.code(), Some(3), "{}", text(&o));
    assert!(text(&o).contains("NOT PINNED"), "{}", text(&o));
    assert!(
        !text(&o).contains("VERIFIED:"),
        "must not claim a plain pass"
    );

    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--allow-unpinned",
    ]);
    assert_eq!(o.status.code(), Some(0), "{}", text(&o));
    assert!(text(&o).contains("signer NOT pinned"), "{}", text(&o));

    // The fingerprint printed by keygen is the 128-bit one the pack names.
    let m = std::fs::read_to_string(pack.join("manifest.json")).unwrap();
    let fp = text(&kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--allow-unpinned",
        "--json",
    ]));
    assert!(fp.contains("\"signer_fingerprint\""), "{fp}");
    assert!(m.matches("\"fingerprint\"").count() == 1);
    let _ = key;
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn pubkey_mistakes_are_told_apart() {
    let dir = scratch("pubkey");
    let (key, pack) = make_pack(&dir);
    // A path that does not exist is not "not hex".
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        "/no/such/key.pub",
    ]);
    assert_eq!(o.status.code(), Some(2));
    assert!(
        text(&o).contains("neither 64 hex digits nor a readable file"),
        "{}",
        text(&o)
    );
    // The private key passed by mistake is recognised and refused.
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        key.to_str().unwrap(),
    ]);
    assert_eq!(o.status.code(), Some(2));
    assert!(text(&o).contains("PRIVATE key"), "{}", text(&o));
    assert!(
        !text(&o).contains("fingerprint"),
        "must not echo anything derived from it"
    );
    // The public key as a literal hex argument works.
    let pk = std::fs::read_to_string(format!("{}.pub", key.display())).unwrap();
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        pk.trim(),
    ]);
    assert!(o.status.success(), "{}", text(&o));
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn timestamp_attach_is_explicit_and_removal_is_detectable() {
    use sha2::Digest as _;
    let dir = scratch("tsr");
    let (key, pack) = make_pack(&dir);
    let pubkey = format!("{}.pub", key.display());
    let manifest = std::fs::read(pack.join("manifest.json")).unwrap();
    let tok = dir.join("good.tsr");
    std::fs::write(&tok, token_over(&sha2::Sha256::digest(&manifest))).unwrap();

    let o = kshana(&[
        "evidence",
        "attach-timestamp",
        pack.to_str().unwrap(),
        tok.to_str().unwrap(),
    ]);
    assert!(o.status.success(), "{}", text(&o));
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
        "--require-timestamp",
    ]);
    assert!(o.status.success(), "{}", text(&o));
    assert!(text(&o).contains("timestamp authority signature not verified by Kshana"));

    // A second attach does not silently replace the first.
    let o = kshana(&[
        "evidence",
        "attach-timestamp",
        pack.to_str().unwrap(),
        tok.to_str().unwrap(),
    ]);
    assert!(
        !o.status.success() && text(&o).contains("--replace"),
        "{}",
        text(&o)
    );
    let o = kshana(&[
        "evidence",
        "attach-timestamp",
        pack.to_str().unwrap(),
        tok.to_str().unwrap(),
        "--replace",
    ]);
    assert!(o.status.success(), "{}", text(&o));

    // A token over something else is not attached.
    let bad = dir.join("bad.tsr");
    std::fs::write(&bad, token_over(&[0u8; 32])).unwrap();
    let o = kshana(&[
        "evidence",
        "attach-timestamp",
        pack.to_str().unwrap(),
        bad.to_str().unwrap(),
        "--replace",
    ]);
    assert!(!o.status.success());

    // Stripping the token: invisible by default, caught with --require-timestamp.
    std::fs::remove_file(pack.join("timestamp.tsr")).unwrap();
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
    ]);
    assert!(o.status.success(), "{}", text(&o));
    let o = kshana(&[
        "evidence",
        "verify",
        pack.to_str().unwrap(),
        "--pubkey",
        &pubkey,
        "--require-timestamp",
    ]);
    assert_eq!(o.status.code(), Some(1), "{}", text(&o));
    assert!(text(&o).contains("timestamp-missing"));
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn a_creation_time_that_is_not_a_time_is_refused() {
    let dir = scratch("created");
    let key = dir.join("signer.key");
    assert!(
        kshana(&["evidence", "keygen", "--out", key.to_str().unwrap()])
            .status
            .success()
    );
    for bad in ["yesterday-ish", "2026-02-30T00:00:00Z"] {
        let o = kshana(&[
            "receiver-trust",
            "evidence",
            &scenario(),
            "--from",
            "100",
            "--to",
            "130",
            "--key",
            key.to_str().unwrap(),
            "--out",
            dir.join("p").to_str().unwrap(),
            "--created-utc",
            bad,
        ]);
        assert!(!o.status.success(), "{bad}");
        assert!(text(&o).contains("bad creation time"), "{}", text(&o));
    }
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn an_absurd_iso_year_is_an_error_not_a_panic() {
    let dir = scratch("year");
    let key = dir.join("signer.key");
    assert!(
        kshana(&["evidence", "keygen", "--out", key.to_str().unwrap()])
            .status
            .success()
    );
    let o = kshana(&[
        "receiver-trust",
        "evidence",
        &scenario(),
        "--from",
        "99999999999-01-01T00:00:00Z",
        "--to",
        "130",
        "--key",
        key.to_str().unwrap(),
        "--out",
        dir.join("p").to_str().unwrap(),
    ]);
    assert_eq!(o.status.code(), Some(2), "{}", text(&o));
    assert!(!text(&o).contains("panicked"));
    let _ = std::fs::remove_dir_all(&dir);
}
