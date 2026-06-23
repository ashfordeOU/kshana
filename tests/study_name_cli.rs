// SPDX-License-Identifier: AGPL-3.0-only
//! O4 — `--study-name` CLI flag end-to-end.
//!
//! Running the binary with `--study-name "My Study"` must (1) name the output
//! files after the slug `my-study` (not the scenario stem), and (2) stamp
//! `StudyMeta.study_title` (plus a UTC generation time) into the result JSON,
//! which the HTML report then surfaces. Without the flag the output is unchanged.

use std::process::Command;

fn bin() -> &'static str {
    env!("CARGO_BIN_EXE_kshana")
}

#[test]
fn study_name_slugs_filenames_and_stamps_meta() {
    let dir = std::env::temp_dir().join(format!("kshana-studyname-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let scn = dir.join("scenario-input.toml");
    std::fs::write(&scn, include_str!("../scenarios/clock-holdover.toml")).unwrap();

    let status = Command::new(bin())
        .arg(&scn)
        .arg("--study-name")
        .arg("My Study")
        .status()
        .expect("run kshana binary");
    assert!(status.success(), "kshana exited non-zero");

    // Files are named after the slug, in the scenario's directory.
    let json_path = dir.join("my-study.result.json");
    let html_path = dir.join("my-study.report.html");
    let svg_path = dir.join("my-study.chart.svg");
    assert!(json_path.exists(), "expected {}", json_path.display());
    assert!(html_path.exists(), "expected {}", html_path.display());
    assert!(svg_path.exists(), "expected {}", svg_path.display());
    // The scenario-stem-named outputs must NOT be produced when --study-name is set.
    assert!(!dir.join("scenario-input.result.json").exists());

    // study_title propagated into the result JSON's meta block.
    let json = std::fs::read_to_string(&json_path).unwrap();
    let v: serde_json::Value = serde_json::from_str(&json).unwrap();
    assert_eq!(v["meta"]["study_title"], "My Study");
    // A UTC ISO-8601 generation stamp was added (caller/CLI-supplied clock).
    let stamp = v["meta"]["generated_utc"].as_str().unwrap();
    assert!(
        stamp.ends_with('Z') && stamp.contains('T'),
        "bad stamp: {stamp}"
    );
    assert_eq!(stamp.len(), 20, "expected YYYY-MM-DDTHH:MM:SSZ: {stamp}");

    // The HTML report surfaces the study title and the stamp.
    let html = std::fs::read_to_string(&html_path).unwrap();
    assert!(html.contains("<title>My Study \u{2014} Kshana</title>"));
    assert!(html.contains(&format!("Study generated {stamp}")));

    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn no_study_name_keeps_scenario_stem_and_no_meta() {
    let dir = std::env::temp_dir().join(format!("kshana-nostudyname-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let scn = dir.join("plain.toml");
    std::fs::write(&scn, include_str!("../scenarios/clock-holdover.toml")).unwrap();

    let status = Command::new(bin()).arg(&scn).status().expect("run binary");
    assert!(status.success());

    let json_path = dir.join("plain.result.json");
    assert!(json_path.exists());
    let json = std::fs::read_to_string(&json_path).unwrap();
    // Back-compat: no meta key when --study-name is absent.
    assert!(
        !json.contains("\"meta\""),
        "meta-less run must carry no meta key"
    );

    std::fs::remove_dir_all(&dir).ok();
}
