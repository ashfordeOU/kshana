// SPDX-License-Identifier: AGPL-3.0-only
//! Independent clock-tamper detector on the fictional record in tests/fixtures/clock-tamper:
//! samples every 600 s from 08:00 to 18:00 UTC on three days, two references (an authenticated
//! NTS server and a GNSS-disciplined NTP server, offsets of a few ms), one boot.
//!
//! Hand-derived expectations:
//! * 2026-11-19: clean; the token requested at OS 11:59:59.998 has genTime 12:00:00.3, an offset
//!   of +0.302 s (within 1 + 1 s). No finding.
//! * 2026-11-20: the clock is set back 3600 s between the 13:50 and 14:00 samples (OS time
//!   13:00:00 at true 14:00), logged at OS 12:58 (within 300 s of 13:00); forward 3600 s between
//!   15:50 and 16:00 with nothing logged. While back, the 12 samples (true 14:00 to 15:50) show
//!   a median offset of +3600 s. The token requested at OS 13:59:59.998 (true 15:00) has
//!   genTime 15:00:00.2: +3600.202 s. So 1 step-back + 12 offset + 1 step-forward + 1
//!   token-offset = 15 findings.
//! * 2026-11-21: the OS clock runs 60 ppm slow from 08:00 to 12:00: the offset grows by
//!   60e-6 x 14 400 s = 0.864 s (below 1 s), a fitted rate of -60 ppm (beyond 50); at 10:00
//!   the references read 0.5 s and 0.0 s apart (none within 0.1 s of their median). So 1 drift
//!   + 1 references-disagree = 2 findings.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

use kshana::clock_tamper::{analyse, parse_samples, FORMAT, TEMPLATE};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/clock-tamper")
}

fn inputs() -> (Vec<u8>, Vec<(String, Vec<u8>)>) {
    let b = std::fs::read(dir().join("samples.json")).unwrap();
    let t = ["day1.tsr", "day2.tsr"]
        .iter()
        .map(|n| (n.to_string(), std::fs::read(dir().join(n)).unwrap()))
        .collect();
    (b, t)
}

#[test]
fn the_three_days_match_the_hand_derivation() {
    let (b, t) = inputs();
    let r = analyse("samples.json", &b, &t).unwrap();
    assert_eq!(r.format, FORMAT);
    assert_eq!((r.label, r.signature), ("MODELLED", "unsigned"));
    assert_eq!(r.inputs.len(), 3);
    assert!(r.inputs.iter().all(|i| i.sha256.len() == 64));
    let days: Vec<_> = r
        .days
        .iter()
        .map(|d| (d.date.as_str(), d.verdict, d.findings.len()))
        .collect();
    assert_eq!(
        days,
        vec![
            ("2026-11-19", "no-findings", 0),
            ("2026-11-20", "findings", 15),
            ("2026-11-21", "findings", 2),
        ]
    );
    assert_eq!(r.findings, 17);
    let d1 = &r.days[0];
    assert_eq!(d1.samples, 61);
    assert_eq!(d1.references, ["gnss-lab", "nts-a"]);
    assert_eq!(d1.authenticated_references, ["nts-a"]);
    assert_eq!(d1.tokens, 1);
    assert!(d1.max_abs_drift_ppm.unwrap() < 1.0);

    let d2 = &r.days[1];
    let kinds = |k: &str| d2.findings.iter().filter(|f| f.kind == k).count();
    assert_eq!(
        (
            kinds("step-back"),
            kinds("offset"),
            kinds("step-forward"),
            kinds("token-offset")
        ),
        (1, 12, 1, 1)
    );
    let back = d2.findings.iter().find(|f| f.kind == "step-back").unwrap();
    assert!((back.value + 3600.0).abs() < 1e-6, "{}", back.value);
    assert_eq!(back.os_utc, "2026-11-20T12:59:59.998Z");
    assert!(
        back.detail.contains("the references saw the same jump"),
        "{}",
        back.detail
    );
    assert!(
        back.detail
            .contains("logged: 2026-11-20T12:58:00Z clock-set"),
        "{}",
        back.detail
    );
    let fwd = d2
        .findings
        .iter()
        .find(|f| f.kind == "step-forward")
        .unwrap();
    assert!(
        fwd.detail.contains("no clock change logged"),
        "{}",
        fwd.detail
    );
    let tok = d2
        .findings
        .iter()
        .find(|f| f.kind == "token-offset")
        .unwrap();
    assert!((tok.value - 3600.202).abs() < 1e-6, "{}", tok.value);
    assert_eq!(d2.clock_change_events, 1);

    let d3 = &r.days[2];
    let drift = d3.findings.iter().find(|f| f.kind == "drift").unwrap();
    // The fit is over 25 samples whose offsets carry the fixture's +-0.4 ms pattern.
    assert!((drift.value + 60.0).abs() < 0.5, "{}", drift.value);
    let dis = d3
        .findings
        .iter()
        .find(|f| f.kind == "references-disagree")
        .unwrap();
    assert_eq!(dis.os_utc, "2026-11-21T09:59:59.566Z");
    assert!(d3.max_abs_offset_s.unwrap() < 1.0);
}

#[test]
fn an_unexplained_logged_change_is_a_finding() {
    let (b, t) = inputs();
    let mut v: serde_json::Value = serde_json::from_slice(&b).unwrap();
    v["events"]
        .as_array_mut()
        .unwrap()
        .push(serde_json::json!({"os_utc": "2026-11-19T09:31:00Z", "kind": "clock-set", "detail": "small change"}));
    let b2 = serde_json::to_vec(&v).unwrap();
    let r = analyse("samples.json", &b2, &t).unwrap();
    let d1 = &r.days[0];
    assert_eq!(d1.findings.len(), 1);
    assert_eq!(d1.findings[0].kind, "unexplained-clock-change");
}

#[test]
fn without_a_monotonic_clock_the_references_find_the_step() {
    let (b, t) = inputs();
    let mut v: serde_json::Value = serde_json::from_slice(&b).unwrap();
    for s in v["samples"].as_array_mut().unwrap() {
        s.as_object_mut().unwrap().remove("monotonic_s");
    }
    let r = analyse("samples.json", &serde_json::to_vec(&v).unwrap(), &t).unwrap();
    let d2 = &r.days[1];
    assert_eq!(
        d2.findings.iter().filter(|f| f.kind == "step-back").count(),
        1
    );
    assert_eq!(
        d2.findings
            .iter()
            .filter(|f| f.kind == "step-forward")
            .count(),
        1
    );
}

#[test]
fn bad_input_is_refused() {
    assert!(parse_samples(TEMPLATE).is_ok());
    for (from, to) in [
        ("kshana.clock-samples/1", "kshana.clock-samples/9"),
        ("\"step_s\": 0.5", "\"step_s\": -1"),
        ("2026-11-20T08:00:00.000Z", "2026-11-31T08:00:00.000Z"),
    ] {
        assert!(TEMPLATE.contains(from));
        assert!(parse_samples(&TEMPLATE.replace(from, to)).is_err(), "{to}");
    }
}

#[test]
fn cli_text_json_and_exit_codes() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let s = dir().join("samples.json").to_string_lossy().to_string();
    let out = Command::new(bin)
        .args(["clock-tamper", "check", &s])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(1));
    let t = String::from_utf8_lossy(&out.stdout);
    assert!(t.contains("2026-11-19  no-findings"), "{t}");
    assert!(t.contains("step-back"));
    let out = Command::new(bin)
        .args(["clock-tamper", "check", &s, "--json"])
        .output()
        .unwrap();
    let v: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    assert_eq!(v["findings"], 17);
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let tmp = std::env::temp_dir().join(format!(
        "kshana-clock-template-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    std::fs::create_dir_all(&tmp).unwrap();
    let out = Command::new(bin)
        .args(["clock-tamper", "template"])
        .output()
        .unwrap();
    std::fs::write(tmp.join("t.json"), &out.stdout).unwrap();
    let out = Command::new(bin)
        .args([
            "clock-tamper",
            "check",
            &tmp.join("t.json").to_string_lossy(),
        ])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(0), "one clean sample: no finding");
    let out = Command::new(bin)
        .args(["clock-tamper", "check"])
        .output()
        .unwrap();
    assert_eq!(out.status.code(), Some(2));
    let _ = std::fs::remove_dir_all(&tmp);
}
