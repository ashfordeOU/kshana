// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-lib`: generate, baseline and score through the command line
//! (docs/INTERFERENCE-LIB.md). Output directories use a per-call unique name.

use serde_json::Value;
use std::process::Command;
use std::sync::atomic::{AtomicUsize, Ordering};

static N: AtomicUsize = AtomicUsize::new(0);

fn tmp() -> std::path::PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-interference-lib-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ))
}

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("interference-lib")
        .args(args)
        .output()
        .expect("run kshana");
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).into_owned(),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

#[test]
fn generate_baseline_score() {
    let (a, b) = (tmp(), tmp());
    let small = ["--per-class", "6", "--samples", "1024", "--seed", "4"];
    for d in [&a, &b] {
        let mut args = vec!["generate", "--out", d.to_str().unwrap()];
        args.extend(small);
        let (code, _, err) = run(&args);
        assert_eq!(code, 0, "{err}");
    }
    assert_eq!(
        std::fs::read(a.join("samples.cf32")).unwrap(),
        std::fs::read(b.join("samples.cf32")).unwrap()
    );
    let meta: Value =
        serde_json::from_str(&std::fs::read_to_string(a.join("dataset.json")).unwrap()).unwrap();
    assert_eq!(meta["examples"], 48);
    let pred = a.join("pred.csv");
    let (code, _, err) = run(&[
        "baseline",
        "--dataset",
        a.to_str().unwrap(),
        "--out",
        pred.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let (code, out, err) = run(&[
        "score",
        "--dataset",
        a.to_str().unwrap(),
        "--predictions",
        pred.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let s: Value = serde_json::from_str(&out).unwrap();
    assert!(s["primary_metric"]
        .as_str()
        .unwrap()
        .contains("pre-registered"));
    assert_eq!(s["missing"], 0);
    assert_eq!(s["confusion"].as_array().unwrap().len(), 8);
    // A damaged sample file is refused.
    std::fs::write(a.join("samples.cf32"), b"xxxxxxxx").unwrap();
    let (code, _, _) = run(&["baseline", "--dataset", a.to_str().unwrap()]);
    assert_eq!(code, 2);
    for d in [a, b] {
        let _ = std::fs::remove_dir_all(d);
    }
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["generate"][..],
        &["generate", "--out", "x", "--per-class", "0"],
        &["generate", "--out", "x", "--fs", "abc"],
        &["score", "--dataset", "no/such"],
        &["baseline", "--bogus", "1"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
    let (code, out, _) = run(&["classes"]);
    assert_eq!(code, 0);
    assert!(out.contains("fm-tone"));
}
