// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana sil-obsgen`: deterministic RINEX observations for continuous integration
//! (docs/SIL-OBSGEN.md). Output files use a per-call unique name.

use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

static N: AtomicUsize = AtomicUsize::new(0);

fn tmp(ext: &str) -> std::path::PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-sil-obsgen-{}-{}.{ext}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ))
}

fn run(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("sil-obsgen")
        .args(args)
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .expect("run kshana");
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

#[test]
fn the_example_generates_the_same_bytes_twice_and_parses_back() {
    let (a, b, t) = (tmp("rnx"), tmp("rnx"), tmp("json"));
    let ex = "examples/sil-obsgen/urban-canyon.toml";
    let (code, err) = run(&[
        ex,
        "--out",
        a.to_str().unwrap(),
        "--truth",
        t.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let (code, _) = run(&[ex, "--out", b.to_str().unwrap()]);
    assert_eq!(code, 0);
    let ra = std::fs::read_to_string(&a).unwrap();
    assert_eq!(ra, std::fs::read_to_string(&b).unwrap());
    let obs = kshana::rinex_obs::parse_obs(&ra).unwrap();
    assert_eq!(obs.epochs.len(), 21);
    let truth: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&t).unwrap()).unwrap();
    assert!(truth["label"].as_str().unwrap().starts_with("MODELLED"));
    let rows = truth["truth"].as_array().unwrap().len();
    let n: usize = obs.epochs.iter().map(|e| e.sats.len()).sum();
    assert_eq!(rows, n);
    for p in [a, b, t] {
        let _ = std::fs::remove_file(p);
    }
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &[][..],
        &["examples/sil-obsgen/urban-canyon.toml"],
        &["no/such.toml", "--out", "x.rnx"],
        &["Cargo.toml", "--out", "x.rnx"],
        &["--bogus"],
        &["x", "--out"],
    ] {
        let (code, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
