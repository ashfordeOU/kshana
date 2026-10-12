// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust on the synthetic vessel demo: a sky masked on one side reads as
//! degraded by geometry, not as an attack; the same loss of satellites with a power drop, and
//! the demo's position drag-off, stay attack-like inconsistency; a stream without satellite
//! geometry says so. The logs are the committed synthetic demo, edited as text here; they
//! model no radio signal and say nothing about how any receiver does on real data.

use std::path::Path;

use kshana::receiver_trust::assess::{assess_stream_excerpt, assess_vessel_log};
use kshana::receiver_trust::geometry::{Degradation, GeometryReason, GeometryStatus};
use kshana::receiver_trust::monitors::{EpochTrust, Monitor};
use kshana::receiver_trust::scenario::ReceiverTrustResult;

const DIR: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/examples/maritime-trust");

fn session() -> String {
    std::fs::read_to_string(Path::new(DIR).join("session.toml")).unwrap()
}

fn demo() -> String {
    std::fs::read_to_string(Path::new(DIR).join("tallinn-helsinki.nmea")).unwrap()
}

fn checksum(body: &str) -> String {
    format!("{:02X}", body.bytes().fold(0u8, |a, b| a ^ b))
}

/// The demo with every GSV satellite at an azimuth of 180 degrees or more reported as not
/// tracked (SNR emptied) from `from_s` seconds on, and the C/N0 of the rest lowered by
/// `drop_db`: a wall or a hull to the west, and optionally a power drop as well. From then on
/// GGA reports HDOP `gga_hdop` (a receiver's HDOP rises when half its sky goes; the remaining
/// sky's HDOP is 2.87).
fn masked_with(from_s: f64, drop_db: f64, gga_hdop: &str) -> String {
    let mut out = String::new();
    let mut t = 0.0;
    let mut t0: Option<f64> = None;
    for line in demo().lines() {
        let body = line.trim_start_matches('$').split('*').next().unwrap();
        let f: Vec<&str> = body.split(',').collect();
        if f[0].ends_with("GGA") {
            let s = f[1];
            let secs = s[0..2].parse::<f64>().unwrap() * 3600.0
                + s[2..4].parse::<f64>().unwrap() * 60.0
                + s[4..].parse::<f64>().unwrap();
            t = secs - *t0.get_or_insert(secs);
        }
        if f[0].ends_with("GGA") && t >= from_s {
            let mut g: Vec<String> = f.iter().map(|x| x.to_string()).collect();
            g[8] = gga_hdop.to_string();
            let b = g.join(",");
            out.push_str(&format!("${b}*{}\n", checksum(&b)));
        } else if f[0].ends_with("GSV") && t >= from_s {
            let mut g: Vec<String> = f.iter().map(|x| x.to_string()).collect();
            let mut i = 4;
            while i + 3 < g.len() {
                let az: f64 = g[i + 2].parse().unwrap_or(0.0);
                if az >= 180.0 {
                    g[i + 3].clear();
                } else if let Ok(snr) = g[i + 3].parse::<f64>() {
                    g[i + 3] = format!("{:.0}", snr - drop_db);
                }
                i += 4;
            }
            let b = g.join(",");
            out.push_str(&format!("${b}*{}\n", checksum(&b)));
        } else {
            out.push_str(line);
            out.push('\n');
        }
    }
    out
}

fn masked(from_s: f64, drop_db: f64) -> String {
    masked_with(from_s, drop_db, "2.9")
}

fn run(log: &str) -> ReceiverTrustResult {
    assess_vessel_log(&session(), log.as_bytes()).unwrap()
}

/// Epochs from 620 s (the mask from 600 s, plus the evidence hold) to 1400 s, before the
/// demo's drag-off starts at 1500 s.
fn window(r: &ReceiverTrustResult) -> Vec<&EpochTrust> {
    r.epochs
        .iter()
        .filter(|e| (620.0..=1400.0).contains(&e.t_s))
        .collect()
}

#[test]
fn a_sky_masked_on_one_side_is_geometry_not_an_attack() {
    let r = run(&masked(600.0, 0.0));
    let w = window(&r);
    assert!(!w.is_empty());
    for e in &w {
        assert_eq!(e.geometry.status, GeometryStatus::Degraded, "{e:?}");
        assert!(
            e.geometry.reasons.contains(&GeometryReason::SkyBlocked),
            "{:?}",
            e.geometry
        );
        let ded: Vec<Monitor> = e
            .score
            .as_ref()
            .unwrap()
            .deductions
            .iter()
            .map(|d| d.monitor)
            .collect();
        // The lost satellites cost points (the score is unchanged by the geometry) and the
        // geometry explains them.
        assert!(ded.contains(&Monitor::LossOfLock), "{ded:?}");
        assert_eq!(e.degradation, Degradation::Geometry, "{e:?}");
        assert!(e.explained_by_geometry.contains(&Monitor::LossOfLock));
    }
    // Before the mask the geometry is good and nothing is attributed.
    let before: Vec<&EpochTrust> = r
        .epochs
        .iter()
        .filter(|e| (300.0..600.0).contains(&e.t_s))
        .collect();
    assert!(before
        .iter()
        .all(|e| e.geometry.status == GeometryStatus::Good && e.degradation == Degradation::None));
    assert!(r.geometry_summary.attributed_geometry >= w.len());
}

#[test]
fn the_same_loss_with_a_power_drop_stays_attack_like() {
    let r = run(&masked(600.0, 10.0));
    for e in window(&r) {
        assert_eq!(e.geometry.status, GeometryStatus::Degraded);
        assert_eq!(
            e.degradation,
            Degradation::GeometryAndInconsistency,
            "{e:?}"
        );
        assert!(e.explained_by_geometry.is_empty());
    }
}

#[test]
fn a_reported_hdop_the_masked_sky_does_not_explain_stays_attack_like() {
    // The same mask, but GGA keeps reporting HDOP 0.9 as if the sky were open: the stream's
    // own sky does not explain its stated precision, so nothing is put down to geometry.
    let r = run(&masked_with(600.0, 0.0, "0.9"));
    for e in window(&r) {
        assert!(e.geometry.hdop_report_mismatch, "{:?}", e.geometry);
        assert_eq!(e.degradation, Degradation::GeometryAndInconsistency);
        assert!(e.explained_by_geometry.is_empty());
    }
}

#[test]
fn the_drag_off_is_inconsistency_with_good_geometry() {
    let r = run(&demo());
    assert_eq!(r.geometry_summary.degraded, 0);
    assert_eq!(r.geometry_summary.unknown, 0);
    let late: Vec<&EpochTrust> = r.epochs.iter().filter(|e| e.t_s >= 2000.0).collect();
    assert!(late
        .iter()
        .all(|e| e.degradation == Degradation::Inconsistency));
}

#[test]
fn the_score_does_not_move_with_the_geometry() {
    // The masked log and the same log with the mask's satellites reported at different
    // azimuths (so the sky is not blocked) lose the same satellites: identical scores.
    let masked_log = masked(600.0, 0.0);
    let spread: String = masked_log
        .lines()
        .map(|l| {
            if !l.contains("GSV") {
                return format!("{l}\n");
            }
            let body = l.trim_start_matches('$').split('*').next().unwrap();
            let mut g: Vec<String> = body.split(',').map(str::to_string).collect();
            let mut i = 4;
            let mut k = 0;
            while i + 3 < g.len() {
                // Spread the azimuths round the horizon: 0, 90, 180, 270, 45, ...
                g[i + 2] = format!("{}", (k * 90 + (k / 4) * 45) % 360);
                k += 1;
                i += 4;
            }
            let b = g.join(",");
            format!("${b}*{}\n", checksum(&b))
        })
        .collect();
    let a = run(&masked_log);
    let b = run(&spread);
    for (x, y) in a.epochs.iter().zip(&b.epochs) {
        assert_eq!(x.score, y.score);
        assert_eq!(x.state, y.state);
        assert_eq!(x.alarms, y.alarms);
    }
    assert!(a
        .epochs
        .iter()
        .any(|e| e.degradation == Degradation::Geometry));
}

#[test]
fn a_stream_without_gsv_or_gsa_says_geometry_unknown() {
    let no_sky: String = demo()
        .lines()
        .filter(|l| !l.contains("GSV") && !l.contains("GSA"))
        .map(|l| format!("{l}\n"))
        .collect();
    let r = run(&no_sky);
    assert_eq!(r.geometry_summary.unknown, r.epochs.len());
    assert!(r
        .epochs
        .iter()
        .all(|e| e.geometry.status == GeometryStatus::Unknown && e.geometry.pdop.is_none()));
    let ex = assess_stream_excerpt(&session(), no_sky.as_bytes()).unwrap();
    let line = ex.epochs[0].to_json_line();
    assert!(line.contains(r#""geometry":{"status":"unknown""#), "{line}");
}

#[test]
fn live_lines_carry_the_geometry_at_the_end() {
    let ex = assess_stream_excerpt(&session(), masked(600.0, 0.0).as_bytes()).unwrap();
    assert_eq!(ex.schema, "1.3");
    let e = ex.epochs.iter().find(|e| e.t_s == 700.0).unwrap();
    let line = e.to_json_line();
    let adv = line.find("\"advisory\"").unwrap();
    let geo = line.find("\"geometry\"").unwrap();
    let deg = line.find("\"degradation\"").unwrap();
    assert!(adv < geo && geo < deg, "{line}");
    assert!(
        line.contains(r#""degradation":"geometry","explained_by_geometry":["loss-of-lock""#),
        "{line}"
    );
    assert!(ex.summary.geometry.attributed_geometry > 0);
}
