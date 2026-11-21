// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana afs-interop`: the command line (docs/AFS-INTEROP.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("afs-interop")
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
fn a_small_study() {
    let (code, out, err) = run(&[
        "study",
        "--afs-prns",
        "1-2",
        "--gps-prns",
        "1,2",
        "--galileo-prns",
        "",
        "--max-doppler",
        "1000",
        "--sweep-pairs",
        "1",
    ]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["schema"], "kshana.afs-interop-study/1");
    assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
    assert_eq!(v["sweeps"][0]["bins"].as_array().unwrap().len(), 3);
    let ca = v["autocorrelation_db"]
        .as_array()
        .unwrap()
        .iter()
        .find(|a| a[0] == "gps-l1ca")
        .unwrap()[1]
        .as_f64()
        .unwrap();
    // The Gold-code bound 65/1023.
    assert!(
        (ca - 20.0 * (65.0f64 / 1023.0).log10()).abs() < 0.05,
        "{ca}"
    );
}

#[test]
fn register_and_errors() {
    let (code, out, _) = run(&["ue-register"]);
    assert_eq!(code, 0);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["valid"], true);
    let (code, out, _) = run(&["ue-register", "--template"]);
    assert_eq!(code, 0);
    assert!(out.contains("kshana.lunar-ue-register/1"));
    for args in [
        &["study", "--afs-prns", "x"][..],
        &["study", "--integration-ms", "0"],
        &["study", "--bogus", "1"],
        &["ue-register", "no/such.json"],
        &["ue-register", "Cargo.toml"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
