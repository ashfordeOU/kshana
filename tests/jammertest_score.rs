// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana jammertest score` on a synthetic NMEA log whose tests are known by construction.
//!
//! PIN-SCOPE:    per-test outcome, latency, recovery and false-alarm accounting on a log with one
//!               real C/N0 drop, one scheduled test where nothing happens, one test too close to
//!               calibration, and a signed evidence pack that carries the scorecard
//! PIN-EXCLUDES: any claim about real receivers; the 2024 dataset run is in
//!               `xval/jammertest-score/RESULTS.md`

use kshana::evidence::bundle::public_key_hex;
use kshana::jammertest::score::ScoreOptions;
use kshana::jammertest::{score_log, score_pack, Schedule, ScoreRequest};
use kshana::receiver_trust::scenario::ReceiverTrustScenario;

fn cs(body: &str) -> u8 {
    body.bytes().fold(0, |a, b| a ^ b)
}

fn s(body: &str) -> String {
    format!("${body}*{:02X}\r\n", cs(body))
}

/// One second per cycle from 12:00:00, 8 GPS satellites; C/N0 `drop` dB lower in `[a, b]`.
fn log(secs: u32, jam: &[(u32, u32)], drop: f64) -> String {
    let mut o = String::new();
    for t in 0..secs {
        let (h, m, sec) = (12 + t / 3600, t / 60 % 60, t % 60);
        let tod = format!("{h:02}{m:02}{sec:02}.00");
        o += &s(&format!(
            "GPRMC,{tod},A,6900.0000,N,01600.0000,E,0.0,0.0,150925,,,A"
        ));
        o += &s(&format!(
            "GPGGA,{tod},6900.0000,N,01600.0000,E,1,08,1.0,10.0,M,0.0,M,,"
        ));
        let hit = jam.iter().any(|&(a, b)| t >= a && t <= b);
        for set in 0..2 {
            let mut body = format!("GPGSV,2,{},08", set + 1);
            for k in 0..4 {
                let sv = set * 4 + k + 1;
                let snr = 45.0 - f64::from(sv % 3) - if hit { drop } else { 0.0 };
                body += &format!(",{sv:02},{:02},{:03},{:02.0}", 30 + sv * 5, sv * 40, snr);
            }
            o += &s(&body);
        }
    }
    o
}

const CATALOG: &str = r#"{"test_types":[{"type":"Jamming","type_id":1,"test_groups":[
  {"group_id":2,"group_name":"CW","tests":[{"test_id":5,"name":"CW jammer"}]}]}]}"#;

fn plan(slots: &[(&str, &str)]) -> String {
    let tests: Vec<String> = slots
        .iter()
        .map(|(a, b)| {
            format!(r#"{{"start_time":"2025-09-15T{a}","end_time":"2025-09-15T{b}","test_id":"1.2.5","power_w":0,"status":""}}"#)
        })
        .collect();
    format!(
        r#"{{"locations":[{{"location_id":1,"location_name":"Test Area 1","tests":[{}]}}]}}"#,
        tests.join(",")
    )
}

fn scenario() -> ReceiverTrustScenario {
    toml::from_str("[log]\nformat = \"nmea\"\ntext = \"\"\n").unwrap()
}

fn request<'a>(
    scn: &'a ReceiverTrustScenario,
    nmea: &'a str,
    catalog: &'a str,
    plans: &'a [&'a str],
) -> ScoreRequest<'a> {
    ScoreRequest {
        scenario: scn,
        log_bytes: nmea.as_bytes(),
        schedule: Schedule::Plan {
            catalog_json: catalog,
            plan_jsons: plans,
            location: Some(1),
            local_offset_h: 0.0,
            year: None,
        },
        log_start_utc: None,
        options: ScoreOptions::default(),
    }
}

#[test]
fn a_drop_is_detected_a_quiet_slot_is_missed_and_a_baseline_clash_is_flagged() {
    // Jam 300..=360 s; tests scheduled 300..360 (real), 500..560 (quiet), none inside calibration.
    let nmea = log(700, &[(300, 360)], 20.0);
    let p = plan(&[("12:05:00", "12:06:00"), ("12:08:20", "12:09:20")]);
    let (scn, plans) = (scenario(), [p.as_str()]);
    let out = score_log(&request(&scn, &nmea, CATALOG, &plans)).unwrap();
    let c = &out.scorecard;
    assert_eq!(c.tests.len(), 2);
    let (a, b) = (&c.tests[0], &c.tests[1]);
    assert_eq!(
        (a.test_id.as_str(), a.evaluable, a.outcome.as_str()),
        ("1.2.5", true, "detected")
    );
    assert!(a.latency_s.unwrap() <= 10.0, "{:?}", a.latency_s);
    assert_eq!(a.recovered, Some(true));
    assert!(
        a.time_to_recover_s.unwrap() >= 0.0 && a.time_to_recover_s.unwrap() <= 30.0,
        "{:?}",
        a.time_to_recover_s
    );
    assert_eq!(b.outcome, "missed");
    assert_eq!(b.recovered, None);
    assert_eq!(c.summary.evaluable, 2);
    assert_eq!((c.summary.detected, c.summary.missed), (1, 1));
    assert_eq!(c.summary.detection_rate, Some(0.5));
    assert_eq!(c.summary.false_alarm_runs, 0, "{:?}", c.summary);
    assert!(!c.baseline_contaminated);
    assert!(c.label.starts_with("MODELLED") && c.advisory.contains("Advisory"));

    // A test 90 s into the log starts inside calibration + guard: not scorable, baseline flagged.
    let early = plan(&[("12:01:30", "12:02:30")]);
    let plans = [early.as_str()];
    let out = score_log(&request(&scn, &nmea, CATALOG, &plans)).unwrap();
    assert!(out.scorecard.baseline_contaminated);
    assert_eq!(out.scorecard.tests[0].outcome, "not-evaluable");
    assert_eq!(out.scorecard.summary.evaluable, 0);
    assert_eq!(out.scorecard.summary.detection_rate, None);
}

#[test]
fn an_alarm_outside_every_slot_is_a_false_alarm() {
    // The log drops at 400..=440 s but the only scheduled test is at 600..660 s.
    let nmea = log(800, &[(400, 440)], 20.0);
    let p = plan(&[("12:10:00", "12:11:00")]);
    let (scn, plans) = (scenario(), [p.as_str()]);
    let c = score_log(&request(&scn, &nmea, CATALOG, &plans))
        .unwrap()
        .scorecard;
    assert_eq!(c.tests[0].outcome, "missed");
    assert_eq!(c.summary.false_alarm_runs, 1, "{:?}", c.summary);
    assert!(c.summary.false_alarm_epochs >= 20 && c.summary.false_alarm_epoch_rate.unwrap() > 0.0);
    assert!(c.summary.false_alarm_runs_per_hour.unwrap() > 0.0);
}

#[test]
fn the_signed_pack_carries_the_scorecard_and_is_reproducible() {
    let nmea = log(700, &[(300, 360)], 20.0);
    let p = plan(&[("12:05:00", "12:06:00")]);
    let (scn, plans) = (scenario(), [p.as_str()]);
    let seed = [5u8; 32];
    let (out, pack) = score_pack(
        &request(&scn, &nmea, CATALOG, &plans),
        "x.nmea",
        "t",
        None,
        &seed,
    )
    .unwrap();
    let cfg: serde_json::Value = serde_json::from_slice(&pack.files["config.json"]).unwrap();
    assert_eq!(cfg["jammertest_score"]["summary"]["detected"], 1);
    assert_eq!(cfg["jammertest_schedule"][0]["test_id"], "1.2.5");
    assert!(cfg["scenario"]["events"][0]["label"]
        .as_str()
        .unwrap()
        .starts_with("scheduled truth"));
    let (_, again) = score_pack(
        &request(&scn, &nmea, CATALOG, &plans),
        "x.nmea",
        "t",
        None,
        &seed,
    )
    .unwrap();
    assert_eq!(pack.files, again.files);
    let v = kshana::surface::evidence_verify(
        &pack.files,
        Some(&public_key_hex(&seed)),
        Some(nmea.as_bytes()),
        false,
    )
    .unwrap();
    assert_eq!(v["verdict"], "verified", "{v}");
    assert_eq!(out.scorecard.summary.detected, 1);
}
