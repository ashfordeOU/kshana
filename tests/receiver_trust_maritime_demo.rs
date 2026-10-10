// SPDX-License-Identifier: AGPL-3.0-only
//! The synthetic demo of `examples/maritime-trust/`, pinned.
//!
//! The log is made up: a ferry on a Tallinn to Helsinki route with a position drag-off from
//! 1500 s, generated as text by `receiver_trust::synth::gulf_of_finland_demo_spec` (no radio signal, no
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
    let text = std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.nmea")).unwrap();
    // Line endings are normalised so a checkout that rewrites them hashes the same.
    let normal: String = text.lines().map(|l| format!("{l}\n")).collect();
    assert_eq!(normal.lines().count(), 18_010);
    assert_eq!(
        format!("{:x}", Sha256::digest(normal.as_bytes())),
        "8f35a3073df78068604625fbb09fa6a50a70c71ebabf0f96ed412165e56421a9"
    );
}

#[test]
fn the_receiver_reports_a_valid_fix_at_every_epoch_of_the_log() {
    let text = std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.nmea")).unwrap();
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
    // The score moves smoothly through its band edges, so a last-digit difference in a
    // transcendental function between platforms can move a crossing by an epoch: two epochs
    // are allowed on each crossing, and three on the counts.
    let near = |got: Option<f64>, want: f64| got.is_some_and(|g| (g - want).abs() <= 2.0);
    assert!(near(
        first(&|e| e.score.as_ref().is_some_and(|s| s.score < 100.0)),
        1535.0
    ));
    assert!(near(first(&|e| e.state == TrustState::Degraded), 1550.0));
    let untrusted = first(&|e| e.state == TrustState::Untrusted);
    assert!(near(untrusted, 1619.0), "{untrusted:?}");
    assert!(r
        .epochs
        .iter()
        .filter(|e| e.t_s >= untrusted.unwrap() + 2.0)
        .all(|e| e.state == TrustState::Untrusted));
    for (got, want) in [
        (r.states.nominal_epochs, 1250usize),
        (r.states.degraded_epochs, 69),
        (r.states.untrusted_epochs, 1382),
    ] {
        assert!(got.abs_diff(want) <= 3, "{got} vs {want}");
    }
    assert!(near(r.first_alarm_s, 1560.0));

    // Scores at stated epochs (rounding to 0.1 is the score's own; allow one step for
    // platform differences in the last digit of a transcendental function).
    for (t, want) in [(1560.0, 84.2), (1600.0, 64.2), (2000.0, 7.3), (3000.0, 5.9)] {
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
    assert_eq!(m.platform.max_speed_kn, Some(22.0));
    assert_eq!(m.platform.antenna_height_m, Some(18.0));
    assert!(m.platform.heading_sensor);
    assert_eq!(
        m.maritime,
        kshana::receiver_trust::maritime::MaritimeConfig::default()
    );
    assert_eq!(m.score.weights.len(), 16, "every weight is written out");
    for (mon, w) in &m.score.weights {
        assert_eq!(
            *w,
            kshana::receiver_trust::score::default_weight(*mon),
            "{mon:?}"
        );
    }
}

#[test]
fn the_chart_shows_the_reported_track_by_band_and_the_score() {
    use kshana::palette::chart::{AMBER, CORAL, LIME};
    let out = kshana::receiver_trust::scenario::run_scenario(&load()).unwrap();
    let svg = &out.svg;
    assert!(svg.starts_with("<svg ") && svg.ends_with("</svg>"));
    assert!(svg.contains("receiver-reported track") && svg.contains("trust score, 0 to 100"));
    // The track has a run in each band the log passes through; the score is one more line.
    for c in [LIME, AMBER, CORAL] {
        assert!(
            svg.contains(&format!("stroke=\"{c}\" stroke-width=\"2\"")),
            "{c}"
        );
    }
    assert!(svg.matches("<polyline").count() >= 4);
    // The CSV of a vessel carries the score and its reasons.
    let mut lines = out.csv.lines();
    assert!(lines
        .next()
        .unwrap()
        .starts_with("# Advisory software, not type-approved"));
    let header = lines.next().unwrap();
    assert!(header.ends_with(",alarms,score,score_reasons"));
    assert!(svg.contains("not type-approved navigation equipment"));
    let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    assert!(v["advisory"].as_str().unwrap().contains("IEC 61108"));
    let last = out.csv.lines().last().unwrap();
    assert!(
        last.contains(",5.9,speed-log:40.0;cn0-spread:30.0;heading-course:19.6;kinematic:4.5"),
        "{last}"
    );
}

#[test]
fn the_truth_file_shows_the_reported_track_leaving_the_real_one_only_after_the_onset() {
    use kshana::receiver_trust::maritime::en_offset_m;
    let truth = std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.truth.csv")).unwrap();
    let rows: Vec<Vec<f64>> = truth
        .lines()
        .skip(1)
        .map(|l| l.split(',').map(|v| v.parse().unwrap()).collect())
        .collect();
    assert_eq!(rows.len(), 3001);
    let text = std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.nmea")).unwrap();
    let tl = read_nmea(&text).unwrap();
    let off = |i: usize| {
        let f = tl.epochs[i].fix.unwrap();
        let (e, n) = en_offset_m(rows[i][1], rows[i][2], f.lat_deg, f.lon_deg);
        e.hypot(n)
    };
    // Before the onset the receiver's own error (a few metres); at the end, far from the vessel.
    assert!((0..1500).all(|i| off(i) < 20.0));
    assert!(off(3000) > 1000.0, "{}", off(3000));
}

#[test]
fn the_committed_log_and_truth_are_what_the_generator_writes() {
    // Directly, not through a hash: the generator is the source of the files.
    use kshana::receiver_trust::synth::{gulf_of_finland_demo_spec, synth_voyage_with_truth};
    let (log, truth) = synth_voyage_with_truth(&gulf_of_finland_demo_spec());
    let committed = std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.nmea")).unwrap();
    let norm = |s: &str| s.lines().collect::<Vec<_>>().join("\n");
    assert_eq!(
        norm(&committed),
        norm(&log),
        "regenerate with the example generator"
    );
    let committed_truth =
        std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.truth.csv")).unwrap();
    let expected: Vec<String> = truth
        .iter()
        .enumerate()
        .map(|(t, p)| format!("{t},{:.7},{:.7}", p[0], p[1]))
        .collect();
    let got: Vec<&str> = committed_truth.lines().skip(1).collect();
    assert_eq!(got, expected.iter().map(String::as_str).collect::<Vec<_>>());
}
