// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana claim-check`: the command line (docs/CLAIM-CHECK.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("claim-check")
        .args(args)
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .expect("run kshana");
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).into_owned(),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

#[test]
fn the_shipped_dataset_checks_clean_and_cites_its_sources() {
    let (code, out, err) = run(&[]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    let r = &v[0];
    assert_eq!(r["schema"], "kshana.claims-check/1");
    assert_eq!(r["refused"], 0);
    assert_eq!(r["inconsistent"], 0);
    let polar = r["verdicts"]
        .as_array()
        .unwrap()
        .iter()
        .find(|x| x["id"] == "orbit-altitude")
        .unwrap();
    assert_eq!(polar["verdict"], "consistent");
    assert!(polar["sources"][0]
        .as_str()
        .unwrap()
        .starts_with("https://www.esa.int/"));
    assert!(polar["label"].as_str().unwrap().starts_with("MODELLED"));
}

#[test]
fn template_and_errors() {
    let (code, out, _) = run(&["--template"]);
    assert_eq!(code, 0);
    let (code, out2, _) = run(&["data/claims/template.json"]);
    assert_eq!(code, 0);
    let v: Value = serde_json::from_str(&out2).unwrap();
    assert_eq!(v[0]["refused"], 5);
    assert!(out.contains("kshana.claims/1"));
    for args in [
        &["no/such.json"][..],
        &["--bogus"],
        &["--out"],
        &["Cargo.toml"],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty());
    }
}
