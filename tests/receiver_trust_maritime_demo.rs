// SPDX-License-Identifier: AGPL-3.0-only
//! The synthetic Baltic demo of `examples/maritime-trust/`, pinned.
//!
//! The log is made up: a vessel on a Gdynia to Klaipeda route with a position drag-off from
//! 1500 s, generated as text by `receiver_trust::synth::baltic_demo_spec` (no radio signal, no
//! recording). The receiver reports a valid fix throughout; the trust score is what falls. These
//! pins are regression guards on the synthetic data and the pipeline, not a measure of how any
//! monitor does on real interference.

use std::path::Path;

use sha2::{Digest, Sha256};

use kshana::receiver_trust::ingest::read_nmea;
use kshana::receiver_trust::monitors::{Monitor, TrustState};
use kshana::receiver_trust::scenario::{resolve_paths, run_receiver_trust, ReceiverTrustScenario};

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/examples/maritime-trust");

fn load() -> ReceiverTrustScenario {
    let path = Path::new(DIR).join("session.toml");
    let mut scn: ReceiverTrustScenario =
        toml::from_str(&std::fs::read_to_string(&path).unwrap()).unwrap();
    resolve_paths(&mut scn, Path::new(DIR));
    scn
}

#[test]
fn the_committed_log_is_the_one_the_pins_were_taken_on() {
    let text = std::fs::read_to_string(Path::new(DIR).join("gdynia-klaipeda.nmea")).unwrap();
    // Line endings are normalised so a checkout that rewrites them hashes the same.
    let normal: String = text.lines().map(|l| format!("{l}\n")).collect();
    assert_eq!(normal.lines().count(), 18_010);
    assert_eq!(
        format!("{:x}", Sha256::digest(normal.as_bytes())),
        "f419d9d729ea2ec482ec81b16b6cbd9f9f9c78e73a6fdf21244c8fecb1733db2"
    );
}

#[test]
fn the_receiver_reports_a_valid_fix_at_every_epoch_of_the_log() {
    let text = std::fs::read_to_string(Path::new(DIR).join("gdynia-klaipeda.nmea")).unwrap();
    let tl = read_nmea(&text).unwrap();
    assert_eq!(tl.skipped_records, 0);
    assert_eq!(tl.epochs.len(), 3001);
    assert!(tl
        .epochs
        .iter()
        .all(|e| e.marine.as_ref().unwrap().fix_valid == Some(true) && e.fix.is_some()));
}

#[test]
fn the_score_falls_through_the_bands_after_the_drag_off_starts() {
    let r = run_receiver_trust(&load()).unwrap();
    let state_of = |t: f64| r.epochs.iter().find(|e| e.t_s == t).unwrap();
    let score = |t: f64| state_of(t).score.as_ref().unwrap().score;

    // Calibration, then a clean passage: nothing deducted until the onset.
    assert_eq!(r.baseline.calibration_epochs, 300);
    assert_eq!(state_of(299.0).state, TrustState::Calibrating);
    for e in r.epochs.iter().filter(|e| (300.0..1500.0).contains(&e.t_s)) {
        let s = e.score.as_ref().unwrap();
        assert_eq!(
            (s.score, e.state),
            (100.0, TrustState::Nominal),
            "t = {}",
            e.t_s
        );
        assert!(s.deductions.is_empty() && e.alarms.is_empty());
    }

    // After it: the first deduction, the first degraded epoch, the first untrusted epoch,
    // and no recovery.
    let first = |pred: &dyn Fn(&kshana::receiver_trust::monitors::EpochTrust) -> bool| {
        r.epochs.iter().find(|e| pred(e)).map(|e| e.t_s)
    };
    assert_eq!(
        first(&|e| e.score.as_ref().is_some_and(|s| s.score < 100.0)),
        Some(1535.0)
    );
    assert_eq!(first(&|e| e.state == TrustState::Degraded), Some(1550.0));
    assert_eq!(first(&|e| e.state == TrustState::Untrusted), Some(1600.0));
    assert!(r
        .epochs
        .iter()
        .filter(|e| e.t_s >= 1600.0)
        .all(|e| e.state == TrustState::Untrusted));
    assert_eq!(
        (
            r.states.nominal_epochs,
            r.states.degraded_epochs,
            r.states.untrusted_epochs
        ),
        (1250, 50, 1401)
    );
    assert_eq!(r.first_alarm_s, Some(1560.0));

    // Scores at stated epochs (rounding to 0.1 is the score's own; allow one step for
    // platform differences in the last digit of a transcendental function).
    for (t, want) in [(1560.0, 79.6), (1600.0, 54.8), (2000.0, 7.3), (3000.0, 4.5)] {
        assert!(
            (score(t) - want).abs() <= 0.15,
            "t = {t}: {} vs {want}",
            score(t)
        );
    }

    // The reasons at the end: three independent checks and a little kinematics.
    let last = r.epochs.last().unwrap().score.as_ref().unwrap();
    let who: Vec<Monitor> = last.deductions.iter().map(|d| d.monitor).collect();
    assert_eq!(
        who,
        [
            Monitor::SpeedLog,
            Monitor::Cn0Spread,
            Monitor::HeadingCourse,
            Monitor::Kinematic
        ]
    );
    assert_eq!(r.score_model.as_ref().unwrap().nominal_min, 90.0);
    assert!(r.verdict.contains("trust score lowest"));
}

#[test]
fn every_threshold_the_run_used_is_in_the_session_file() {
    // The session states the vessel limits, every moving-platform threshold and every score
    // weight; the stated values are the documented defaults, so nothing was tuned for this log.
    let scn = load();
    let m = &scn.monitors;
    assert_eq!(m.platform.max_speed_kn, Some(20.0));
    assert_eq!(m.platform.antenna_height_m, Some(18.0));
    assert!(m.platform.heading_sensor);
    assert_eq!(
        m.maritime,
        kshana::receiver_trust::maritime::MaritimeConfig::default()
    );
    assert_eq!(m.score.weights.len(), 18, "every weight is written out");
    for (mon, w) in &m.score.weights {
        assert_eq!(
            *w,
            kshana::receiver_trust::score::default_weight(*mon),
            "{mon:?}"
        );
    }
}
