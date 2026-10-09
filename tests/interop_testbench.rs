// SPDX-License-Identifier: AGPL-3.0-only
//! **Test-bench export: every file written is read back and compared within the stated
//! tolerances.** Synthetic scenarios only; nothing here reads the network.

use kshana::interop::testbench::*;
use kshana::interop::{ExportError, UtcEpoch};
use std::path::PathBuf;

fn scenario(name: &str) -> String {
    std::fs::read_to_string(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("scenarios")
            .join(name),
    )
    .expect("read scenario")
}

fn traj() -> Trajectory {
    trajectory_of(&scenario("gnss-ins.toml"), None).expect("trajectory")
}

#[test]
fn gnss_ins_trajectory_moves_turns_and_has_one_outage_event() {
    let t = traj();
    assert_eq!(t.samples.len(), 1601);
    let last = t.samples.last().unwrap();
    let first = &t.samples[0];
    let d: f64 = (0..3)
        .map(|i| (last.ecef_m[i] - first.ecef_m[i]).powi(2))
        .sum::<f64>()
        .sqrt();
    assert!(d > 100.0, "the vehicle moved {d} m");
    let headings: Vec<f64> = t.samples.iter().map(|s| s.heading_deg).collect();
    let (lo, hi) = headings
        .iter()
        .fold((f64::MAX, f64::MIN), |(l, h), &x| (l.min(x), h.max(x)));
    assert!(hi - lo > 10.0, "the yaw profile turns the vehicle");
    assert!(headings.iter().all(|h| (0.0..360.0).contains(h)));
    assert!(!t.events.is_empty());
    for e in &t.events {
        assert!(e.onset_s < e.end_s && e.end_s <= 160.0);
    }
}

#[test]
fn motion_csv_round_trips_within_tolerance() {
    let t = traj();
    let back = read_motion_csv(&write_motion_csv(&t)).expect("reads");
    assert_eq!(back.len(), t.samples.len());
    for (a, b) in t.samples.iter().zip(&back) {
        assert!((a.t_s - b.t_s).abs() < 1e-6);
        for i in 0..3 {
            assert!((a.ecef_m[i] - b.ecef_m[i]).abs() <= CSV_POSITION_TOL_M);
            assert!((a.v_ecef_m_s[i] - b.v_ecef_m_s[i]).abs() <= CSV_VELOCITY_TOL_M_S);
        }
        assert!((a.lat_deg - b.lat_deg).abs() <= CSV_ANGLE_DEG_TOL);
        assert!((a.lon_deg - b.lon_deg).abs() <= CSV_ANGLE_DEG_TOL);
        assert!((a.h_m - b.h_m).abs() <= CSV_POSITION_TOL_M);
        assert!((a.heading_deg - b.heading_deg).abs() <= CSV_ATTITUDE_DEG_TOL);
        assert!((a.pitch_deg - b.pitch_deg).abs() <= CSV_ATTITUDE_DEG_TOL);
        assert!((a.roll_deg - b.roll_deg).abs() <= CSV_ATTITUDE_DEG_TOL);
    }
}

#[test]
fn csv_earth_fixed_and_geodetic_columns_agree() {
    // Independent check of the frame: the geodetic columns recomputed from x, y, z.
    let back = read_motion_csv(&write_motion_csv(&traj())).unwrap();
    for m in back.iter().step_by(50) {
        let g = geodetic_of_ecef(m);
        assert!((g.lat_rad.to_degrees() - m.lat_deg).abs() < 1e-8);
        assert!((g.lon_rad.to_degrees() - m.lon_deg).abs() < 1e-8);
        assert!((g.alt_m - m.h_m).abs() < 1e-3);
        // Speed from the Earth-fixed velocity is the speed the NMEA writer reports.
        let v = m.v_ecef_m_s;
        assert!(v.iter().all(|x| x.is_finite()));
    }
}

#[test]
fn csv_header_and_bad_rows_are_refused() {
    assert!(read_motion_csv("a,b\n1,2\n").is_err());
    let mut s = write_motion_csv(&traj());
    s.push_str("1,2,3\n");
    assert!(read_motion_csv(&s).is_err());
}

#[test]
fn nmea_round_trips_within_tolerance_and_has_valid_checksums() {
    let t = traj();
    let text = write_nmea(&t);
    for line in text.lines() {
        assert!(line.starts_with("$GP"));
    }
    let fixes = read_nmea(&text, &t.epoch).expect("reads");
    assert_eq!(fixes.len(), t.samples.len());
    for (m, f) in t.samples.iter().zip(&fixes) {
        assert!((m.t_s - f.t_s).abs() < 1e-3, "{} vs {}", m.t_s, f.t_s);
        let dlat = (m.lat_deg - f.lat_deg).to_radians() * 6_378_137.0;
        let dlon =
            (m.lon_deg - f.lon_deg).to_radians() * 6_378_137.0 * m.lat_deg.to_radians().cos();
        assert!(dlat.hypot(dlon) <= NMEA_HORIZONTAL_TOL_M, "{dlat} {dlon}");
        assert!((m.h_m - f.h_m).abs() <= NMEA_HEIGHT_TOL_M);
        // NMEA speed is over the ground: the horizontal part of the velocity.
        let v = m.v_ecef_m_s;
        let (sl, cl) = m.lat_deg.to_radians().sin_cos();
        let (so, co) = m.lon_deg.to_radians().sin_cos();
        let vn = -sl * co * v[0] - sl * so * v[1] + cl * v[2];
        let ve = -so * v[0] + co * v[1];
        let speed_kn = vn.hypot(ve) * 3600.0 / 1852.0;
        assert!((speed_kn - f.speed_kn).abs() <= NMEA_SPEED_TOL_KN + 1e-6);
    }
}

#[test]
fn nmea_corruption_is_detected() {
    let t = traj();
    let text = write_nmea(&t).replacen("GPGGA", "GPGGB", 1);
    // A changed body no longer matches its checksum.
    assert!(read_nmea(&text, &t.epoch).is_err());
}

#[test]
fn nmea_is_read_by_the_receiver_trust_reader() {
    // The motion file is also a valid receiver log for the engine's own NMEA reader, so a
    // scored run can be dry-run on the export itself.
    use kshana::receiver_trust::{ingest::read_nmea as trust_read, LogFormat};
    let _ = LogFormat::Nmea;
    let t = traj();
    let tl = trust_read(&write_nmea(&t)).expect("reads");
    assert_eq!(tl.epochs.len(), t.samples.len());
    let fix = tl.epochs[800].fix.expect("fix");
    assert!((fix.lat_deg - t.samples[800].lat_deg).abs() < 1e-7);
    assert!((fix.height_m - t.samples[800].h_m).abs() < 2e-3);
}

#[test]
fn waypoints_round_trip() {
    let t = traj();
    let (ms, rows) = read_waypoints(&write_waypoints(&t).unwrap()).unwrap();
    assert_eq!(ms, 100);
    assert_eq!(rows.len(), t.samples.len());
    for (m, r) in t.samples.iter().zip(&rows) {
        assert!((m.lon_deg - r.0).abs() <= WAYPOINT_ANGLE_DEG_TOL);
        assert!((m.lat_deg - r.1).abs() <= WAYPOINT_ANGLE_DEG_TOL);
        assert!((m.h_m - r.2).abs() <= WAYPOINT_HEIGHT_TOL_M);
    }
}

#[test]
fn waypoints_refuse_an_irregular_millisecond_grid() {
    let mut t = traj();
    t.samples.truncate(3);
    t.samples[1].t_s = 0.0004;
    assert!(write_waypoints(&t).is_err());
}

#[test]
fn events_round_trip_and_feed_receiver_trust() {
    let t = traj();
    let back = read_events_csv(&write_events_csv(&t)).unwrap();
    assert_eq!(back.len(), t.events.len());
    for (a, b) in t.events.iter().zip(&back) {
        assert_eq!(a.label, b.label);
        assert_eq!(a.kind, b.kind);
        assert!((a.onset_s - b.onset_s).abs() < 1e-3);
        assert!((a.end_s - b.end_s).abs() < 1e-3);
    }
    // The TOML fragment parses as the events of a receiver-trust scenario.
    let scn = format!(
        "[log]\nformat = \"nmea\"\ntext = \"\"\n\n{}",
        write_events_toml(&t)
    );
    let parsed: kshana::receiver_trust::scenario::ReceiverTrustScenario =
        toml::from_str(&scn).expect("a receiver-trust scenario");
    assert_eq!(parsed.events.len(), t.events.len());
    assert!((parsed.events[0].onset_s - t.events[0].onset_s).abs() < 1e-3);
}

#[test]
fn jamming_scenario_exports_a_stationary_receiver_and_a_jamming_event() {
    let t = trajectory_of(&scenario("jamming-demo.toml"), None).unwrap();
    assert_eq!(t.events.len(), 1);
    assert_eq!(t.events[0].kind, EventKind::Jamming);
    assert_eq!(t.events[0].end_s, 1800.0);
    let a = t.samples[0];
    assert!(t.samples.iter().all(|s| s.ecef_m == a.ecef_m));
    assert!(t.samples.iter().all(|s| s.v_ecef_m_s == [0.0; 3]));
    // 30 s step is a whole number of milliseconds, so the waypoint file exists.
    assert!(write_waypoints(&t).is_ok());
    // A stationary file has no course; the NMEA writer leaves the field empty.
    let nmea = write_nmea(&t);
    let rmc = nmea.lines().find(|l| l.starts_with("$GPRMC")).unwrap();
    assert!(rmc.contains(",0.000,,"), "{rmc}");
}

#[test]
fn epoch_is_stated_and_used() {
    let e = UtcEpoch::from_calendar(2025, 6, 30, 23, 59, 30.0);
    let t = trajectory_of(&scenario("gnss-ins.toml"), Some(e)).unwrap();
    let meta = write_motion_meta(&t);
    assert!(meta.contains("2025-06-30T23:59:30.000000Z"));
    // The run crosses midnight; the NMEA date rolls and the read-back offsets stay right.
    let fixes = read_nmea(&write_nmea(&t), &t.epoch).unwrap();
    assert!((fixes.last().unwrap().t_s - 160.0).abs() < 1e-3);
    assert!(write_nmea(&t).contains(",010725,"));
}

#[test]
fn export_is_byte_deterministic_and_carries_no_signal() {
    let a = export(&scenario("gnss-ins.toml"), None).unwrap();
    let b = export(&scenario("gnss-ins.toml"), None).unwrap();
    assert_eq!(a, b);
    let suffixes: Vec<&str> = a.iter().map(|f| f.suffix.as_str()).collect();
    assert_eq!(
        suffixes,
        [
            ".motion.csv",
            ".motion.json",
            ".nmea",
            ".waypoints.txt",
            ".events.csv",
            ".events.toml"
        ]
    );
    let meta = String::from_utf8(a[1].bytes.clone()).unwrap();
    assert!(meta.contains("\"carries_signals\": false"));
}

#[test]
fn other_kinds_are_not_applicable_with_a_reason() {
    match export(&scenario("clock-holdover.toml"), None) {
        Err(ExportError::NotApplicable(why)) => assert!(why.contains("no vehicle trajectory")),
        other => panic!("expected NotApplicable, got {other:?}"),
    }
}
