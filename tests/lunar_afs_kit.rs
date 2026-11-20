// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana lunar-afs-kit`: the command line (docs/LUNAR-AFS-KIT.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("lunar-afs-kit")
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
fn the_builtin_vectors_pass() {
    let (code, out, err) = run(&["vectors"]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["vectors"], 219);
    assert_eq!(v["passed"], 219);
}

#[test]
fn the_interim_registry_is_valid_and_a_collision_fails() {
    let (code, out, err) = run(&["registry", "--no-correlation"]);
    assert_eq!(code, 0, "{err}");
    let v: Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["nodes"], 12);
    assert_eq!(v["valid"], true);
    let (code, out, _) = run(&["registry", "tests/fixtures/lunar_afs_kit/colliding.toml"]);
    assert_eq!(code, 1);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert!(v["findings"]
        .as_array()
        .unwrap()
        .iter()
        .any(|f| f["kind"] == "shared_q_prn"));
    assert!(v["cross_correlation"].as_array().unwrap().len() == 1);
}

#[test]
fn output_profile_round_trip() {
    let (code, stream, _) = run(&["output-example", "--n", "4"]);
    assert_eq!(code, 0);
    assert_eq!(stream.lines().count(), 4);
    let (code, out, _) = run(&["output-check", "tests/fixtures/lunar_afs_kit/stream.jsonl"]);
    assert_eq!(code, 0, "{out}");
    let (code, out, err) = run(&[
        "output-reexpress",
        "tests/fixtures/lunar_afs_kit/stream.jsonl",
        "--scale",
        "tt",
        "--frame",
        "ICRF",
    ]);
    assert_eq!(code, 0, "{err}");
    let first: Value = serde_json::from_str(out.lines().next().unwrap()).unwrap();
    assert_eq!(first["epoch"]["scale"], "TT");
    assert_eq!(first["frame"], "ICRF");
    let (code, out, _) = run(&["output-check", "tests/fixtures/lunar_afs_kit/broken.jsonl"]);
    assert_eq!(code, 1);
    let v: Value = serde_json::from_str(&out).unwrap();
    assert!(!v["findings"].as_array().unwrap().is_empty());
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["registry", "no/such.toml"][..],
        &["registry", "--limit-db", "x"],
        &["output-check"],
        &[
            "output-reexpress",
            "tests/fixtures/lunar_afs_kit/stream.jsonl",
            "--scale",
            "utc",
        ],
        &["output-example", "--n", "0"],
        &["vectors", "--bogus", "1"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
