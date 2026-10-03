// SPDX-License-Identifier: AGPL-3.0-only
//! The `receiver-trust` scenario on real receiver logs: the JammerTest 2024 stationary
//! u-blox ZED-F9P spoofing sessions (GPL-3.0-or-later extract, see the fixture NOTICE).
//!
//! Two checks:
//!
//! 1. **Same answer as the pre-registered pipeline.** With the measurement-domain
//!    monitors switched off by thresholds no log can reach, the scenario's engine path
//!    (single-point fix, parity receiver autonomous integrity monitoring (RAIM), the
//!    clock-aided monitor) must raise its first alarm in each onset window at the same
//!    epoch, and of the same kind, as `tests/jammertest_spoof_oracle_support` (the M010
//!    oracle pipeline), and so give the same detected / late / missed outcome. This pins
//!    that the user-facing kind and the oracle are one computation, not two.
//! 2. **The whole kind runs end to end** on the same files through the command line,
//!    from a scenario that names them by relative path, and through inline base64.

#[path = "jammertest_spoof_oracle_support/mod.rs"]
mod support;

use kshana::receiver_trust::monitors::{Monitor, MonitorConfig};
use kshana::receiver_trust::scenario::{
    run_receiver_trust, CompareCfg, EventCfg, EventKind, FileSource, LogCfg, ReceiverTrustScenario,
};
use kshana::receiver_trust::LogFormat;
use std::sync::atomic::{AtomicUsize, Ordering};

static SCRATCH: AtomicUsize = AtomicUsize::new(0);

fn fixture(name: &str) -> String {
    format!("{}/{name}", support::FIXTURE_DIR)
}

/// Seconds of day of the observation file's first epoch.
fn first_epoch_sod(obs_file: &str) -> f64 {
    let text = std::fs::read_to_string(fixture(obs_file)).expect("obs");
    let obs = kshana::rinex_obs::parse_obs(&text).expect("parse obs");
    let e = &obs.epochs[0].time;
    e.hour as f64 * 3600.0 + e.minute as f64 * 60.0 + e.second
}

fn nav_for(obs_file: &str) -> String {
    let text = std::fs::read_to_string(fixture(obs_file)).expect("obs");
    let obs = kshana::rinex_obs::parse_obs(&text).expect("parse obs");
    let d = &obs.epochs[0].time;
    fixture(&format!(
        "brdc_gps_{:04}{:02}{:02}.rnx",
        d.year, d.month, d.day
    ))
}

/// Thresholds no log reaches: only the engine-path monitors can alarm.
fn engine_only(calibration_s: f64) -> MonitorConfig {
    MonitorConfig {
        calibration_s,
        cn0_drop_db: 1.0e6,
        sats_lost: 1_000_000,
        ..MonitorConfig::default()
    }
}

fn kind_of(m: &[Monitor]) -> Option<support::AlarmKind> {
    if m.contains(&Monitor::Raim) {
        Some(support::AlarmKind::Raim)
    } else if m.contains(&Monitor::SolveFailure) {
        Some(support::AlarmKind::SolveFailure)
    } else if m.contains(&Monitor::Clock) {
        Some(support::AlarmKind::Clock)
    } else {
        None
    }
}

#[test]
fn receiver_trust_reproduces_the_pre_registered_spoofing_pipeline() {
    let onsets = support::onsets();
    assert_eq!(onsets.len(), 8, "the round-1 onset table");
    for o in &onsets {
        let start = first_epoch_sod(&o.file);
        let expected = support::run_onset(o);
        let cal_s = expected.cal_end - start;
        let scn = ReceiverTrustScenario {
            kind: Some("receiver-trust".into()),
            name: Some(format!("JammerTest 2024 {}", o.id)),
            log: LogCfg {
                format: LogFormat::Rinex,
                source: FileSource {
                    path: Some(fixture(&o.file)),
                    ..Default::default()
                },
                nav: Some(FileSource {
                    path: Some(nav_for(&o.file)),
                    ..Default::default()
                }),
            },
            monitors: engine_only(cal_s),
            events: vec![EventCfg {
                label: o.id.clone(),
                kind: EventKind::Spoofing,
                onset_s: o.onset - start,
                end_s: Some(expected.horizon_end - start),
                predicted_cn0_drop_db: None,
            }],
            compare: CompareCfg {
                detect_tol_s: support::DETECT_TOL_S,
                ..CompareCfg::default()
            },
        };
        let r = run_receiver_trust(&scn).unwrap_or_else(|e| panic!("{}: {e}", o.id));
        assert!(r.log.engine_fix, "{}: the engine fix ran", o.id);
        let ev = &r.events[0];
        match expected.detection {
            Some((t, k)) => {
                let got = ev.first_alarm_s.unwrap_or_else(|| {
                    panic!("{}: the oracle alarms at {t}, the kind does not", o.id)
                });
                assert!(
                    (got - (t - start)).abs() < 1e-3,
                    "{}: first alarm {got} s, oracle {} s",
                    o.id,
                    t - start
                );
                assert_eq!(kind_of(&ev.first_monitors), Some(k), "{}: alarm kind", o.id);
                let detected = t - o.onset <= support::DETECT_TOL_S;
                assert_eq!(
                    ev.outcome == "detected",
                    detected,
                    "{}: outcome {}",
                    o.id,
                    ev.outcome
                );
            }
            None => assert!(
                ev.first_alarm_s.is_none(),
                "{}: the oracle raises no alarm in the window",
                o.id
            ),
        }
    }
}

#[test]
fn receiver_trust_runs_end_to_end_from_the_command_line() {
    let o = &support::onsets()[0];
    let dir = std::env::temp_dir().join(format!(
        "kshana-receiver-trust-{}-{}",
        std::process::id(),
        SCRATCH.fetch_add(1, Ordering::SeqCst)
    ));
    std::fs::create_dir_all(&dir).expect("scratch dir");
    std::fs::copy(fixture(&o.file), dir.join("session.obs")).expect("copy obs");
    std::fs::copy(nav_for(&o.file), dir.join("brdc.rnx")).expect("copy nav");
    let start = first_epoch_sod(&o.file);
    let toml = format!(
        "kind = \"receiver-trust\"\nname = \"JammerTest 2024 {id}\"\n\n[log]\nformat = \"rinex\"\npath = \"session.obs\"\nnav = {{ path = \"brdc.rnx\" }}\n\n[[events]]\nlabel = \"{id}\"\nkind = \"spoofing\"\nonset_s = {onset}\n",
        id = o.id,
        onset = o.onset - start
    );
    std::fs::write(dir.join("session.toml"), toml).expect("write scenario");
    // Run from a different working directory: the scenario's relative paths must
    // resolve against its own folder.
    let out = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("receiver-trust")
        .arg(dir.join("session.toml"))
        .current_dir(std::env::temp_dir())
        .output()
        .expect("run kshana");
    assert!(
        out.status.success(),
        "stderr: {}",
        String::from_utf8_lossy(&out.stderr)
    );
    let summary = String::from_utf8_lossy(&out.stdout);
    assert!(summary.contains("receiver-trust"), "{summary}");
    let json: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(dir.join("session.result.json")).expect("result"),
    )
    .expect("json");
    assert_eq!(json["log"]["engine_fix"], true);
    assert!(json["log"]["epochs"].as_u64().unwrap_or(0) > 100);
    let run: Vec<&str> = json["monitors_run"]
        .as_array()
        .expect("monitors_run")
        .iter()
        .filter_map(|v| v.as_str())
        .collect();
    for m in ["raim", "solve-failure"] {
        assert!(
            run.contains(&m),
            "monitor {m} ran on a RINEX log with navigation: {run:?}"
        );
    }
    // The extract carries pseudoranges only (C1C, C2L), no S codes, and no RINEX log
    // carries AGC: a monitor without its data must not claim to have run.
    for m in ["cn0-drop", "loss-of-lock", "agc", "jam-ind"] {
        assert!(
            !run.contains(&m),
            "monitor {m} has no data in this log: {run:?}"
        );
    }
    assert_eq!(json["events"].as_array().map(|a| a.len()), Some(1));
    let csv = std::fs::read_to_string(dir.join("session.trust.csv")).expect("csv");
    assert!(csv.starts_with("t_s,state,"));
    let svg = std::fs::read_to_string(dir.join("session.trust.svg")).expect("svg");
    assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn inline_base64_gives_the_same_result_as_a_path() {
    let o = &support::onsets()[0];
    let bytes = std::fs::read(fixture(&o.file)).expect("obs");
    let by_path = ReceiverTrustScenario {
        kind: None,
        name: None,
        log: LogCfg {
            format: LogFormat::Rinex,
            source: FileSource {
                path: Some(fixture(&o.file)),
                ..Default::default()
            },
            nav: None,
        },
        monitors: MonitorConfig::default(),
        events: Vec::new(),
        compare: CompareCfg::default(),
    };
    let mut inline = by_path.clone();
    inline.log.source = FileSource {
        base64: Some(kshana::permalink::base64_encode(&bytes)),
        ..Default::default()
    };
    let a = run_receiver_trust(&by_path).expect("path");
    let b = run_receiver_trust(&inline).expect("inline");
    assert_eq!(a.log.sha256, b.log.sha256);
    assert_eq!(a.epochs, b.epochs);
    assert_eq!(a.verdict, b.verdict);
}
