// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana timing-stack`: the fixtures of tests/fixtures/timing_stack/ (gen_fixtures.py) and the
//! acceptance that a stopped SHM unit and a stale PPS alarm within 10 s of their last sample.

use serde_json::Value;
use std::process::Command;

const T0: f64 = 1_700_000_000.0;
const D: &str = "tests/fixtures/timing_stack/";

fn run(args: &[&str]) -> (i32, Value, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("timing-stack")
        .args(args)
        .current_dir(env!("CARGO_MANIFEST_DIR"))
        .output()
        .expect("run kshana");
    let v = serde_json::from_slice(&out.stdout).unwrap_or(Value::Null);
    (
        out.status.code().unwrap_or(-1),
        v,
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

fn f(name: &str) -> String {
    format!("{D}{name}")
}

#[test]
fn a_stopped_shm_unit_alarms_within_10_s() {
    let end = format!("{}", T0 + 40.0);
    let (code, v, err) = run(&["shm", &f("ntpshmmon_stopped.txt"), "--end", &end]);
    assert_eq!(code, 1, "{err}");
    let a = v["stale_alarms"].as_array().unwrap();
    assert_eq!(a.len(), 1, "{v}");
    assert_eq!(a[0]["source"], "NTP0");
    let lag = a[0]["alarm_t"].as_f64().unwrap() - a[0]["last_t"].as_f64().unwrap();
    assert!(lag <= 10.0, "{lag}");
    assert!((a[0]["last_t"].as_f64().unwrap() - (T0 + 19.000123)).abs() < 1e-3);
}

#[test]
fn a_stale_pps_alarms_within_10_s_and_the_paths_are_told_apart() {
    let end = format!("{}", T0 + 60.0);
    let (code, v, _) = run(&["pps", &f("pps_stale.txt"), "--end", &end]);
    assert_eq!(code, 1);
    let a = &v["stale_alarms"][0];
    let lag = a["alarm_t"].as_f64().unwrap() - a["last_t"].as_f64().unwrap();
    assert!(lag <= 10.0, "{lag}");
    let (code, v, _) = run(&["pps", &f("pps_kernel.txt")]);
    assert_eq!(code, 0, "{v}");
    assert_eq!(v["path"], "kernel-pps");
    let (_, v, _) = run(&["pps", &f("pps_polled.txt")]);
    assert_eq!(v["path"], "dcd-polling-likely");
}

#[test]
fn ts2phc_stale_ntpq_misreport_and_nts_matrix() {
    let (code, v, _) = run(&["ts2phc", &f("ts2phc_stale.log"), "--end", "1000080"]);
    assert_eq!(code, 1);
    assert_eq!(v["locked_readings"], 56);
    assert_eq!(v["stale_alarms"][0]["alarm_t"], 1_000_062.0);
    let (code, v, _) = run(&[
        "ntpq",
        &f("ntpq_peers_misreport.txt"),
        "--rv",
        &f("ntpq_rv.txt"),
    ]);
    assert_eq!(code, 1);
    let s = v["findings"].to_string();
    assert!(
        s.contains("selected-peer-unreachable") && s.contains("selected-peer-silent"),
        "{s}"
    );
    assert!(
        s.contains("system-offset-disagrees-with-selected-peer"),
        "{s}"
    );
    let (code, v, _) = run(&[
        "nts",
        "--client",
        &format!("chrony-a={}", f("authdata_chrony_a.txt")),
    ]);
    assert_eq!(code, 1);
    assert_eq!(v["servers"].as_array().unwrap().len(), 3);
    assert_eq!(v["not_ok"], 2);
}

#[test]
fn usage_errors_exit_2() {
    for args in [
        &["shm"][..],
        &["shm", "no/such.txt"],
        &["pps", "x", "--end", "abc"],
        &["tai"],
        &["nts"],
        &["ntpq", "x", "--bogus", "1"],
        &["fly"],
        &[],
    ] {
        let (code, _, err) = run(args);
        assert_eq!(code, 2, "{args:?}");
        assert!(!err.is_empty(), "{args:?}");
    }
}
