// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana drone`: the pre-arm check on logs in the formats an autopilot SITL writes (PX4 ULog,
//! ArduPilot DataFlash), the published thresholds' false-alarm rates (docs/DRONE-PNT.md), the
//! estimator behaviour cases, the dead-reckoning budget and the failover harness through the CLI.

use kshana::drone_pnt::epochs::{encode_dataflash, encode_ulog, load, GnssEpoch};
use kshana::drone_pnt::prearm::{calibrate, check, PrearmConfig, Verdict};
use std::path::PathBuf;
use std::process::Command;

fn kshana(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr),
    )
}

fn temp_dir() -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-drone-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

/// A still vehicle for 40 s at 5 Hz, arming at 40 s; `spoof_from` raises the receiver's spoofing
/// state to 2 from that time; `jump_at` moves the solution 25 m north from that time.
fn rows(spoof_from: Option<f64>, jump_at: Option<f64>) -> Vec<GnssEpoch> {
    (0..=200)
        .map(|k| {
            let t = 5.0 + k as f64 * 0.2;
            let wobble = 1e-6 * ((k as f64) * 0.37).sin();
            let north = if jump_at.is_some_and(|j| t >= j) {
                25.0 / 111_195.0
            } else {
                0.0
            };
            GnssEpoch {
                t_s: t,
                instance: 0,
                fix_type: 3,
                lat_deg: Some(47.397_742 + wobble + north),
                lon_deg: Some(8.545_594 + wobble),
                alt_m: Some(488.0),
                sats: Some(14.0),
                eph_m: Some(1.4),
                epv_m: Some(2.2),
                hdop: Some(0.8),
                speed_m_s: Some(0.04),
                sacc_m_s: Some(0.2),
                jamming_state: Some(1),
                spoofing_state: Some(if spoof_from.is_some_and(|s| t >= s) {
                    2
                } else {
                    1
                }),
                auth_state: None,
                jam_ind: Some(35.0),
                noise: Some(90.0),
                agc: Some(5000.0),
                rx_time_s: Some(1_700_000_000.0 + t),
            }
        })
        .collect()
}

#[test]
fn a_ulog_with_a_spoofing_flag_before_arming_fails_pre_arm_and_the_gate() {
    let dir = temp_dir();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let bad = dir.join("spoofed.ulg");
    std::fs::write(&bad, encode_ulog(&rows(Some(38.0), None), Some(40.0))).unwrap();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let good = dir.join("clean.ulg");
    std::fs::write(&good, encode_ulog(&rows(None, None), Some(40.0))).unwrap();

    let (code, text) = kshana(&["drone", "prearm", good.to_str().unwrap(), "--gate"]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["verdict"], "PASS", "{text}");
    assert_eq!(v["ends_at_arming"], true);
    assert_eq!(v["log_format"], "ulog");
    assert_eq!(v["evidence"], "MODELLED");

    let (code, text) = kshana(&["drone", "prearm", bad.to_str().unwrap()]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["verdict"], "FAIL");
    assert_eq!(v["playbook"][0], "F1");
    let spoof = v["checks"]
        .as_array()
        .unwrap()
        .iter()
        .find(|c| c["id"] == "spoof_flag")
        .unwrap();
    assert_eq!(spoof["verdict"], "FAIL");
    let (code, _) = kshana(&["drone", "prearm", bad.to_str().unwrap(), "--gate"]);
    assert_eq!(code, 2, "the gate exits non-zero on FAIL");
    // The flag raised after arming is outside the pre-arm window.
    let after = load(&encode_ulog(&rows(Some(41.0), None), Some(40.0))).unwrap();
    assert_eq!(
        check(&after, &PrearmConfig::default()).verdict,
        Verdict::Pass
    );
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn a_dataflash_log_with_a_position_jump_is_caught_and_a_clean_one_passes() {
    let clean = load(&encode_dataflash(&rows(None, None), Some(40.0))).unwrap();
    assert_eq!(clean.format, "dataflash");
    assert_eq!(clean.arm_times_s, vec![40.0]);
    assert_eq!(clean.epochs.len(), 201);
    assert_eq!(clean.epochs[0].eph_m, Some(1.4f32 as f64));
    assert_eq!(clean.epochs[0].jam_ind, Some(35.0));
    let r = check(&clean, &PrearmConfig::default());
    assert_eq!(r.verdict, Verdict::Pass, "{:#?}", r.checks);
    let jumped = load(&encode_dataflash(&rows(None, Some(30.0)), Some(40.0))).unwrap();
    let r = check(&jumped, &PrearmConfig::default());
    let jump = r.checks.iter().find(|c| c.id == "position_jump").unwrap();
    assert_eq!(jump.verdict, Verdict::Fail, "{jump:?}");
    assert_eq!(r.verdict, Verdict::Fail);
}

/// The false-alarm and detection rates docs/DRONE-PNT.md publishes for the default thresholds
/// (seed 1, 1000 windows per row); this run uses 400 windows and the documented bounds.
#[test]
fn published_thresholds_hold_their_stated_false_alarm_rate() {
    let c = calibrate(&PrearmConfig::default(), 400, 1);
    let clean = &c.rows[0];
    assert!(clean.not_pass_rate <= 0.01, "{clean:?}");
    assert_eq!(clean.fail_rate, 0.0, "{clean:?}");
    let by = |i: usize| c.rows[i].fail_rate;
    assert_eq!(by(1), 1.0, "a raised spoofing flag always fails");
    assert!(by(4) >= 0.99, "a 1 m/s drag fails: {}", by(4));
    assert!(by(6) >= 0.99, "a 2 s time push fails: {}", by(6));
    assert!(by(7) >= 0.99, "a 20 m jump fails: {}", by(7));
}

#[test]
fn estimator_cases_reproduce_their_issues_and_run_on_a_user_trace() {
    let (code, text) = kshana(&["drone", "estimator-cases"]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["all_reproduced"], true, "{text}");
    assert_eq!(v["cases"].as_array().unwrap().len(), 8);
    for c in v["cases"].as_array().unwrap() {
        assert!(!c["cites"].as_array().unwrap().is_empty());
    }
    let dir = temp_dir();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let tr = dir.join("trace.jsonl");
    let mut s = String::new();
    for k in 0..50 {
        let est = if k == 30 { "null" } else { "1.0" };
        s += &format!("{{\"t\":{},\"pos_x\":{est}}}\n", k as f64 * 0.1);
    }
    std::fs::write(&tr, s).unwrap();
    let (code, text) = kshana(&[
        "drone",
        "estimator-cases",
        "--case",
        "nan-guard",
        "--trace",
        tr.to_str().unwrap(),
        "--params",
        r#"{"prefix":"pos_"}"#,
    ]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["verdict"], "FAIL");
    assert_eq!(v["detail"]["non_finite_after_finite"]["pos_x"], 1);
    let (code, _) = kshana(&[
        "drone",
        "estimator-cases",
        "--case",
        "no-such",
        "--trace",
        tr.to_str().unwrap(),
    ]);
    assert_eq!(code, 2);
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn budget_failover_and_zonotope_run_from_the_cli() {
    let (code, text) = kshana(&["drone", "dr-budget", "--airframe", "fixed-wing"]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    for row in v["crossings"].as_array().unwrap() {
        let (a, c) = (
            row["aided_s"].as_f64().unwrap(),
            row["aided_closed_form_s"].as_f64().unwrap(),
        );
        assert!((a - c).abs() <= 1e-6 * c, "{row}");
    }
    let (code, text) = kshana(&["drone", "failover"]);
    assert_eq!(code, 0, "{text}");
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    assert_eq!(v["failovers"], 3);
    let (code, text) = kshana(&["drone", "quad-loss"]);
    assert_eq!(code, 0, "{text}");
    assert!(text.contains("\"attitude\""));
    let (code, _) = kshana(&["drone", "dr-budget", "--airframe", "blimp"]);
    assert_eq!(code, 2);
    let (code, text) = kshana(&["drone"]);
    assert_eq!(code, 2);
    assert!(text.contains("usage: kshana drone"), "{text}");
}
