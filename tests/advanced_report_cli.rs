// SPDX-License-Identifier: AGPL-3.0-only
//! The reproducibility record of the advanced run report, tested by doing what it says.
//!
//! A run writes `report.json` beside `result.json`. The test reads the recorded command
//! (`reproducibility.argv`) back out of that report, checks the scenario file against the
//! recorded SHA-256, runs the command in a fresh directory holding only a copy of the
//! scenario (and of any further input file the record lists), and requires:
//!
//! * the reproduced `result.json` is byte-identical to the original, and its SHA-256 is
//!   the `result_sha256` the report recorded;
//! * the reproduced `report.json` and `report.html` are byte-identical to the originals
//!   (the report carries no timestamp when `--study-name` is not given);
//! * the `--eop` file the run read is listed with its SHA-256, and the recorded command
//!   carries the flag.
//!
//! One chained campaign, one sweep campaign, a clock scenario and an orbit run with an
//! Earth-orientation file cover the shapes the record takes.

use std::path::{Path, PathBuf};
use std::process::Command;

fn bin() -> &'static str {
    env!("CARGO_BIN_EXE_kshana")
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(bytes);
    hex::encode(h.finalize())
}

/// Per-call working directory under the system temp dir. The sequence makes it unique
/// per call: every test in this binary shares the process id.
fn temp_workdir(label: &str) -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-{label}-{}-{seq}", std::process::id()));
    let _ = std::fs::remove_dir_all(&dir);
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

fn run_in(dir: &Path, args: &[String]) {
    let o = Command::new(bin())
        .args(args)
        .current_dir(dir)
        .output()
        .expect("run kshana binary");
    assert!(
        o.status.success(),
        "kshana {args:?} failed in {}: {}",
        dir.display(),
        String::from_utf8_lossy(&o.stderr)
    );
}

/// Run `scenario` (a path under the repository) as `<stem>.toml` from a fresh directory,
/// with `extra` further arguments and `extra_files` (source, name) copied beside it; then
/// reproduce it from the command its report records.
fn reproduce(scenario: &str, extra: &[&str], extra_files: &[(&str, &str)]) -> serde_json::Value {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let file = Path::new(scenario)
        .file_name()
        .unwrap()
        .to_str()
        .unwrap()
        .to_string();
    let stem = file.trim_end_matches(".toml").to_string();
    let bytes = std::fs::read(root.join(scenario)).unwrap();

    let a = temp_workdir("report-a");
    std::fs::write(a.join(&file), &bytes).unwrap();
    for (src, name) in extra_files {
        std::fs::copy(root.join(src), a.join(name)).unwrap();
    }
    let mut args = vec![file.clone()];
    args.extend(extra.iter().map(|s| s.to_string()));
    run_in(&a, &args);

    let result_a = std::fs::read(a.join(format!("{stem}.result.json"))).unwrap();
    let report_a = std::fs::read(a.join(format!("{stem}.report.json"))).unwrap();
    let html_a = std::fs::read(a.join(format!("{stem}.report.html"))).unwrap();
    let rep: serde_json::Value = serde_json::from_slice(&report_a).unwrap();
    let rec = &rep["reproducibility"];

    // The record's digests are the files' digests.
    assert_eq!(
        rec["scenario_sha256"],
        sha256_hex(&bytes),
        "{scenario}: scenario digest"
    );
    assert_eq!(
        rec["result_sha256"],
        sha256_hex(&result_a),
        "{scenario}: result digest"
    );
    assert_eq!(rec["scenario_file"], file.as_str());

    // Do what the record says, in a directory that holds only the recorded inputs.
    let argv: Vec<String> = rec["argv"]
        .as_array()
        .expect("argv")
        .iter()
        .map(|v| v.as_str().unwrap().to_string())
        .collect();
    assert_eq!(argv[0], "kshana");
    let b = temp_workdir("report-b");
    std::fs::write(b.join(&file), &bytes).unwrap();
    assert_eq!(
        sha256_hex(&std::fs::read(b.join(&file)).unwrap()),
        rec["scenario_sha256"].as_str().unwrap(),
        "the copied scenario must match the recorded digest before it is run"
    );
    for f in rec["input_files"].as_array().unwrap() {
        let name = f["path"].as_str().unwrap();
        std::fs::copy(a.join(name), b.join(name)).unwrap();
        assert_eq!(
            sha256_hex(&std::fs::read(b.join(name)).unwrap()),
            f["sha256"].as_str().unwrap()
        );
    }
    run_in(&b, &argv[1..]);

    let result_b = std::fs::read(b.join(format!("{stem}.result.json"))).unwrap();
    assert!(
        result_a == result_b,
        "{scenario}: the recorded command did not reproduce result.json byte for byte"
    );
    assert_eq!(
        sha256_hex(&result_b),
        rec["result_sha256"].as_str().unwrap()
    );
    let report_b = std::fs::read(b.join(format!("{stem}.report.json"))).unwrap();
    assert!(
        report_a == report_b,
        "{scenario}: report.json differs on reproduction"
    );
    let html_b = std::fs::read(b.join(format!("{stem}.report.html"))).unwrap();
    assert!(
        html_a == html_b,
        "{scenario}: report.html differs on reproduction"
    );

    std::fs::remove_dir_all(&a).ok();
    std::fs::remove_dir_all(&b).ok();
    rep
}

#[test]
fn the_recorded_command_reproduces_a_clock_run() {
    let rep = reproduce("scenarios/clock-holdover.toml", &[], &[]);
    assert_eq!(rep["reproducibility"]["seed"], 42);
    assert_eq!(
        rep["reproducibility"]["command"],
        "kshana clock-holdover.toml"
    );
    assert!(rep["reproducibility"].get("generated_utc").is_none());
}

#[test]
fn the_recorded_command_reproduces_a_chained_campaign() {
    let rep = reproduce(
        "scenarios/campaign-jam-spoof-holdover-integrity.toml",
        &[],
        &[],
    );
    assert_eq!(rep["aggregation"]["mode"], "chain");
}

#[test]
fn the_recorded_command_reproduces_a_sweep_campaign() {
    let rep = reproduce("scenarios/campaign-sweep-jammer-power.toml", &[], &[]);
    assert_eq!(rep["aggregation"]["mode"], "sweep");
    assert_eq!(
        rep["aggregation"]["tables"][0]["rows"]
            .as_array()
            .unwrap()
            .len(),
        13
    );
}

#[test]
fn the_recorded_command_carries_an_earth_orientation_file_and_its_digest() {
    let rep = reproduce(
        "scenarios/orbit-sgp4-gps.toml",
        &["--eop", "finals.txt"],
        &[(
            "tests/fixtures/agency/eop/finals2000A_2022001.txt",
            "finals.txt",
        )],
    );
    let rec = &rep["reproducibility"];
    assert_eq!(
        rec["command"],
        "kshana orbit-sgp4-gps.toml --eop finals.txt"
    );
    let files = rec["input_files"].as_array().unwrap();
    assert_eq!(files.len(), 1);
    let fixture = std::fs::read(
        Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/agency/eop/finals2000A_2022001.txt"),
    )
    .unwrap();
    assert_eq!(files[0]["sha256"], sha256_hex(&fixture));
}

#[test]
fn a_study_name_run_records_its_flag_and_says_its_stamp_is_the_one_difference() {
    let dir = temp_workdir("report-study");
    std::fs::write(
        dir.join("s.toml"),
        include_str!("../scenarios/clock-holdover.toml"),
    )
    .unwrap();
    run_in(
        &dir,
        &[
            "s.toml".to_string(),
            "--study-name".to_string(),
            "My Study".to_string(),
        ],
    );
    let rep: serde_json::Value =
        serde_json::from_slice(&std::fs::read(dir.join("my-study.report.json")).unwrap()).unwrap();
    let rec = &rep["reproducibility"];
    assert_eq!(rec["command"], "kshana s.toml --study-name 'My Study'");
    assert!(rec["generated_utc"]
        .as_str()
        .is_some_and(|s| s.ends_with('Z')));
    assert!(rec["determinism"]
        .as_str()
        .unwrap()
        .contains("generated_utc"));
    let html = std::fs::read_to_string(dir.join("my-study.report.html")).unwrap();
    assert!(html.contains("<title>My Study \u{2014} Kshana</title>"));
    std::fs::remove_dir_all(&dir).ok();
}
