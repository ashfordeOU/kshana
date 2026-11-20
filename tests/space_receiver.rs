// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana space-receiver`: the command line, the labelled timestamp fixture and the
//! upper-SSV benchmark's pinned figures (docs/SPACE-RECEIVER.md).

use serde_json::Value;
use std::process::Command;

fn run(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("space-receiver")
        .args(args)
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
    serde_json::from_str(&out).expect("json")
}

#[test]
fn clock_report_carries_the_label_and_the_gps_check_holds_for_a_gps_orbit() {
    let v = json(&["clock", "--orbit", "26559.7,0.0,55", "--oscillator", "rafs"]);
    assert_eq!(v["schema"], "kshana.space-receiver-clock/1");
    assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));
    let us = v["relativity"]["secular_us_per_day"].as_f64().unwrap();
    assert!((us - 38.58).abs() < 0.05, "{us}");
    assert_eq!(v["holdover"].as_array().unwrap().len(), 5);
    let v = json(&[
        "clock",
        "--orbit",
        "heo",
        "--outage-min",
        "90",
        "--temp-swing",
        "10",
    ]);
    assert_eq!(v["holdover"].as_array().unwrap().len(), 6);
    assert!(v["relativity"]["periodic_amplitude_ns"].as_f64().unwrap() > 1000.0);
}

#[test]
fn the_labelled_fixture_faults_are_found() {
    let v = json(&["timestamps", "tests/fixtures/space_receiver/tags.csv"]);
    let ev: Vec<(u64, String)> = v["events"]
        .as_array()
        .unwrap()
        .iter()
        .map(|e| {
            (
                e["row"].as_u64().unwrap(),
                e["kind"].as_str().unwrap().to_string(),
            )
        })
        .collect();
    // The rows as gen_fixture.py labels them (rows 216 to 219 removed, so later rows shift by 4).
    for want in [
        (60, "leap_second"),
        (120, "millisecond_jump"),
        (180, "outlier"),
        (200, "clock_bias_jump"),
        (216, "gap"),
        (246, "week_rollover_1024"),
        (246, "time_reversal"),
    ] {
        assert!(
            ev.contains(&(want.0, want.1.to_string())),
            "{want:?} not in {ev:?}"
        );
    }
    assert_eq!(ev.len(), 7, "{ev:?}");
    assert_eq!(v["rows"], 296);
}

#[test]
fn dynamics_and_limits() {
    let v = json(&[
        "dynamics",
        "--orbit",
        "gto",
        "--duration-min",
        "120",
        "--step-s",
        "60",
        "--max-doppler",
        "40000",
    ]);
    assert_eq!(v["schema"], "kshana.space-receiver-dynamics/1");
    assert!(v["doppler_hz"]["max_abs"].as_f64().unwrap() > 40_000.0);
    assert!(v["links_beyond_doppler"].as_u64().unwrap() > 0);
}

#[test]
fn bench_lists_its_versioned_cases() {
    let v = json(&["bench", "--list"]);
    assert_eq!(v["version"], "upper-ssv-bench/1");
    let ids: Vec<&str> = v["cases"]
        .as_array()
        .unwrap()
        .iter()
        .map(|c| c["id"].as_str().unwrap())
        .collect();
    assert_eq!(
        ids,
        ["meo-8000", "geo", "gto", "heo", "mms-2b", "lunar-transfer"]
    );
}

#[test]
fn bench_geo_case_figures() {
    // PIN-SCOPE:    the geo case of upper-ssv-bench/1 at 20 dB-Hz with the OCXO class
    // PIN-EXCLUDES: every other case; the JSON layout
    let v = json(&[
        "bench",
        "--case",
        "geo",
        "--max-doppler",
        "20000",
        "--max-doppler-rate",
        "5",
        "--time-budget",
        "1e-9",
    ]);
    let c = &v["cases"][0];
    assert_eq!(c["case"]["id"], "geo");
    assert_eq!(c["at_least_1_pct"].as_f64().unwrap(), 100.0);
    let a4 = c["at_least_4_pct"].as_f64().unwrap();
    assert!((a4 - 89.3).abs() < 0.1, "{a4}");
    assert_eq!(c["max_outage_4_min"].as_f64().unwrap(), 40.0);
    assert_eq!(c["doppler"], "pass");
    assert_eq!(c["doppler_rate"], "pass");
    assert_eq!(c["time_error"], "fail");
    assert_eq!(v["passed"], 2);
    assert_eq!(v["failed"], 1);
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["clock", "--orbit", "mars"][..],
        &["clock", "--oscillator", "hydrogen"],
        &["clock", "--temp-swing"],
        &["clock", "--bogus", "1"],
        &["dynamics", "--step-s", "abc"],
        &["bench", "--case", "nope"],
        &["timestamps", "no/such/file.csv"],
        &["timestamps"],
        &["od-vs-tle", "x.oem"],
        &["od-vs-tle", "no/such.oem", "--tle", "no/such.tle"],
        &["fly"],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
    let (code, out, _) = run(&["--help"]);
    assert_eq!(code, 0);
    assert!(out.contains("kshana space-receiver clock"));
}

#[test]
fn mms_case_reports_the_published_values_and_a_verdict() {
    let v = json(&["mms", "--orbits", "1", "--step-min", "10"]);
    assert_eq!(v["schema"], "kshana.space-receiver-mms/1");
    assert_eq!(v["published"][0], 99.0);
    assert!(v["source"].as_str().unwrap().contains("NTRS 20170009487"));
    assert_eq!(v["sensitivity"].as_array().unwrap().len(), 6);
    let verdict = v["verdict"].as_str().unwrap();
    assert!(verdict == "reproduced" || verdict == "not_reproduced");
}

#[test]
fn bench_sidelobes_counts_more_signals() {
    let a = json(&["bench", "--case", "geo"]);
    let b = json(&["bench", "--case", "geo", "--sidelobes"]);
    let pa = a["cases"][0]["at_least_4_pct"].as_f64().unwrap();
    let pb = b["cases"][0]["at_least_4_pct"].as_f64().unwrap();
    assert!(pb >= pa, "{pa} {pb}");
    assert_eq!(b["profile"]["sidelobes"], true);
}
