// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana arctic-plan`: the command line (docs/ARCTIC-PLAN.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("arctic-plan")
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
fn a_plan_at_a_named_place() {
    let (code, out, err) = run(&[
        "--place",
        "alert",
        "--hours",
        "4",
        "--step-min",
        "30",
        "--compare",
        "--kp",
        "3",
        "--epochs",
    ]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["schema"], "kshana.arctic-plan/1");
    assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
    assert_eq!(v["summaries"].as_array().unwrap().len(), 5);
    assert_eq!(v["summaries"][0]["epochs"].as_array().unwrap().len(), 9);
    assert_eq!(v["elevation_bounds"].as_array().unwrap().len(), 4);
    assert!(v["auroral_oval"]["inside"].is_boolean());
}

#[test]
fn places_and_errors() {
    let (code, out, _) = run(&["--places"]);
    assert_eq!(code, 0);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert!(v
        .as_array()
        .unwrap()
        .iter()
        .any(|p| p["name"] == "longyearbyen"));
    for args in [
        &["--hours", "2"][..],
        &["--place", "paris"],
        &["--site", "78,abc"],
        &["--place", "alert", "--hours", "0"],
        &["--place", "alert", "--bogus", "1"],
        &["--place", "alert", "--clock", "two"],
        &["--place", "alert", "--systems", "no-such-gnss"],
        &["--place"],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
    let (code, out, _) = run(&["--help"]);
    assert_eq!(code, 0);
    assert!(out.contains("kshana arctic-plan"));
}
