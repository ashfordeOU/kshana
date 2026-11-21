// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunar-ref`: the command line (docs/LUNAR-REF.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("lunar-ref")
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

fn json(args: &[&str]) -> Value {
    let (code, out, err) = run(args);
    assert_eq!(code, 0, "{args:?}: {err}");
    serde_json::from_str(&out).unwrap()
}

#[test]
fn tcb_tcl_report_checks_against_l_c() {
    let v = json(&[
        "tcb-tcl",
        "--jd",
        "2451545.0",
        "--window",
        "2451545.0,2462502.5",
    ]);
    assert_eq!(v["schema"], "kshana.lunar-tcb-tcl/1");
    let lc = v["l_c_computed"].as_f64().unwrap();
    assert!((lc - 1.480_826_867_41e-8).abs() < v["rate_bound"].as_f64().unwrap());
    let d = v["tcb_minus_tcl_s"].as_f64().unwrap();
    assert!(d > 10.7 && d < 10.8, "{d}");
}

#[test]
fn convert_and_transform() {
    let v = json(&[
        "convert",
        "--from",
        "tt",
        "--to",
        "tcg",
        "--jd",
        "2451545.0",
    ]);
    let s = v["output"]["s"].as_f64().unwrap() - v["input"]["s"].as_f64().unwrap();
    assert!((s - 0.5058).abs() < 1e-4, "{s}");
    let v = json(&[
        "transform",
        "--from",
        "MOON_ME",
        "--to",
        "ILURF",
        "--xyz",
        "1737400,0,0",
    ]);
    assert!((v["output_m"][0].as_f64().unwrap() - 1_737_400.0).abs() < 1e-6);
    assert_eq!(v["to"], "ILURF");
    assert!(v["ilurf_source"].as_str().unwrap().contains("to confirm"));
}

#[test]
fn registries() {
    let v = json(&["terms"]);
    assert_eq!(v["format"], "kshana.lunar-terminology/1");
    let (code, out, _) = run(&["models", "--check"]);
    assert_eq!(code, 0, "{out}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert!(v["checks"]
        .as_array()
        .unwrap()
        .iter()
        .all(|c| c["ok"] == true));
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["convert", "--from", "utc"][..],
        &["transform", "--from", "MOON_XY"],
        &["transform", "--xyz", "1,2"],
        &["tcb-tcl", "--jd", "2480000"],
        &["approx", "--grid-days", "0"],
        &["terms", "--bogus", "1"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
