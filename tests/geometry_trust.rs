// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust on the synthetic vessel demo (0.36 geometry design note, section 4):
//! a sky masked on one side costs the geometry monitor's points, classed `geometry`; satellites
//! lost low in the sky make `loss-of-lock` a `geometry` deduction; a stated HDOP that the stated
//! sky does not explain makes the geometry deduction an `inconsistency`; the demo's drag-off
//! stays `inconsistency` with good geometry; a stream without satellite geometry says so. The
//! logs are the committed synthetic demo, edited as text here; they model no radio signal and
//! say nothing about how any receiver does on real data.

use std::path::Path;

use kshana::receiver_trust::assess::{assess_stream_excerpt, assess_vessel_log};
use kshana::receiver_trust::geometry::{GeometryReason, GeometryStatus};
use kshana::receiver_trust::monitors::{EpochTrust, Monitor, TrustState};
use kshana::receiver_trust::scenario::ReceiverTrustResult;
use kshana::receiver_trust::score::{Deduction, DeductionClass};

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

/// Epochs from 620 s (the edit from 600 s, plus the evidence hold) to 1400 s, before the
/// demo's drag-off starts at 1500 s.
fn window(r: &ReceiverTrustResult) -> Vec<&EpochTrust> {
    r.epochs
        .iter()
        .filter(|e| (620.0..=1400.0).contains(&e.t_s))
        .collect()
}

fn deductions(e: &EpochTrust) -> &[Deduction] {
    &e.score.as_ref().unwrap().deductions
}

fn class_of(e: &EpochTrust, m: Monitor) -> Option<DeductionClass> {
    deductions(e)
        .iter()
        .find(|d| d.monitor == m)
        .and_then(|d| d.class)
}

/// The demo with the satellites `lose` emptied of signal from 600 s and, from 500 s, their
/// elevation reported as `low_el` when given (a setting satellite).
fn lose_low(lose: &[&str], low_el: f64) -> String {
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
        if f[0].ends_with("GSV") && t >= 500.0 {
            let mut g: Vec<String> = f.iter().map(|x| x.to_string()).collect();
            let mut i = 4;
            while i + 3 < g.len() {
                let id = format!("{}{}", &f[0][..2], g[i]);
                if lose.contains(&id.as_str()) {
                    g[i + 1] = format!("{low_el:.0}");
                    if t >= 600.0 {
                        g[i + 3].clear();
                    }
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

#[test]
fn a_sky_masked_on_one_side_costs_geometry_points_classed_geometry() {
    let r = run(&masked(600.0, 0.0));
    let w = window(&r);
    assert!(!w.is_empty());
    for e in &w {
        assert_eq!(e.geometry.status, GeometryStatus::Degraded, "{e:?}");
        assert!(e.geometry.reasons.contains(&GeometryReason::SkyBlocked));
        assert!(!e.geometry.reported_derived_mismatch);
        assert_eq!(
            class_of(e, Monitor::Geometry),
            Some(DeductionClass::Geometry),
            "{e:?}"
        );
        // High satellites were lost too, so the loss of lock stays environment (design 4.3).
        assert_eq!(
            class_of(e, Monitor::LossOfLock),
            Some(DeductionClass::Environment)
        );
        assert!(
            deductions(e)
                .iter()
                .all(|d| d.class != Some(DeductionClass::Inconsistency)),
            "{e:?}"
        );
        assert!(e
            .geometry
            .note
            .as_deref()
            .unwrap()
            .ends_with("not an inconsistency"));
        assert_ne!(e.state, TrustState::Untrusted);
        assert!(
            !e.alarms.contains(&Monitor::Geometry),
            "the geometry monitor raises no alarm"
        );
    }
    assert!(!r.monitors_run.contains(&Monitor::Geometry));
    assert!(r.geometry_summary.class_geometry >= w.len());
    assert_eq!(
        r.geometry_summary.class_inconsistency,
        r.epochs
            .iter()
            .filter(|e| e.t_s >= 1500.0)
            .filter(|e| e.score.as_ref().is_some_and(|s| s
                .deductions
                .iter()
                .any(|d| d.class == Some(DeductionClass::Inconsistency))))
            .count()
    );
}

#[test]
fn satellites_lost_low_in_the_sky_make_loss_of_lock_a_geometry_deduction() {
    // Five satellites set below 15 deg from 500 s and are lost from 600 s.
    let lost = ["GP11", "GP22", "GP28", "GA24", "GA31"];
    let r = run(&lose_low(&lost, 10.0));
    for e in window(&r) {
        assert_eq!(
            class_of(e, Monitor::LossOfLock),
            Some(DeductionClass::Geometry),
            "{e:?}"
        );
    }
    // The same satellites lost at their real elevations (21 to 24 deg for three of them)
    // stay environment.
    let r = run(&lose_low(&lost, 20.0));
    for e in window(&r) {
        assert_eq!(
            class_of(e, Monitor::LossOfLock),
            Some(DeductionClass::Environment)
        );
    }
}

#[test]
fn the_same_mask_with_a_power_drop_is_environment_as_well() {
    let r = run(&masked(600.0, 10.0));
    for e in window(&r) {
        assert_eq!(
            class_of(e, Monitor::Cn0Drop),
            Some(DeductionClass::Environment),
            "{e:?}"
        );
        assert_eq!(
            class_of(e, Monitor::Geometry),
            Some(DeductionClass::Geometry)
        );
    }
}

#[test]
fn a_stated_hdop_the_masked_sky_does_not_explain_is_an_inconsistency() {
    // The same mask, but GGA keeps reporting HDOP 0.9 as if the sky were open: the geometry
    // deduction is classed inconsistency (the guard against a forged poor sky).
    let r = run(&masked_with(600.0, 0.0, "0.9"));
    for e in window(&r) {
        assert!(e.geometry.reported_derived_mismatch, "{:?}", e.geometry);
        assert_eq!(
            class_of(e, Monitor::Geometry),
            Some(DeductionClass::Inconsistency)
        );
    }
}

#[test]
fn total_signal_loss_is_the_environment_not_the_sky() {
    // Every GSV SNR emptied from 600 s: the satellites stay listed in view but nothing is
    // tracked. The geometry deduction is environment, with a note saying why.
    let all_lost: String = {
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
            if f[0].ends_with("GSV") && t >= 600.0 {
                let mut g: Vec<String> = f.iter().map(|x| x.to_string()).collect();
                let mut i = 4;
                while i + 3 < g.len() {
                    g[i + 3].clear();
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
    };
    let r = run(&all_lost);
    let w = window(&r);
    assert!(!w.is_empty());
    for e in &w {
        assert!(e.geometry.signal_loss, "{:?}", e.geometry);
        assert!(e
            .geometry
            .note
            .as_deref()
            .unwrap()
            .contains("signal environment, not geometry"));
        assert_eq!(
            class_of(e, Monitor::Geometry),
            Some(DeductionClass::Environment),
            "{e:?}"
        );
    }
}

#[test]
fn a_drag_off_during_poor_geometry_still_reaches_untrusted_as_an_inconsistency() {
    // The western sky masked from 600 s and the demo's drag-off from 1500 s.
    let r = run(&masked(600.0, 0.0));
    let late: Vec<&EpochTrust> = r.epochs.iter().filter(|e| e.t_s >= 2500.0).collect();
    assert!(!late.is_empty());
    assert!(late
        .iter()
        .all(|e| e.geometry.status == GeometryStatus::Degraded));
    assert!(late.iter().any(|e| e.state == TrustState::Untrusted));
    for e in late.iter().filter(|e| e.state == TrustState::Untrusted) {
        assert!(deductions(e)
            .iter()
            .any(|d| d.class == Some(DeductionClass::Inconsistency)));
    }
}

#[test]
fn the_drag_off_is_inconsistency_with_good_geometry() {
    let r = run(&demo());
    assert_eq!(
        (r.geometry_summary.degraded, r.geometry_summary.unknown),
        (0, 0)
    );
    assert_eq!(r.geometry_summary.class_geometry, 0);
    for e in r.epochs.iter().filter(|e| e.t_s >= 2000.0) {
        assert!(deductions(e)
            .iter()
            .any(|d| d.class == Some(DeductionClass::Inconsistency)));
        assert!(deductions(e).iter().all(|d| d.monitor != Monitor::Geometry));
    }
}

#[test]
fn the_geometry_moves_the_score_only_through_the_geometry_monitor() {
    // The masked log and the same log with the lost satellites' azimuths spread round the
    // horizon lose the same satellites: every deduction but the geometry monitor's is the same.
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
    let others = |e: &EpochTrust| -> Vec<Deduction> {
        e.score
            .as_ref()
            .map(|s| {
                s.deductions
                    .iter()
                    .filter(|d| d.monitor != Monitor::Geometry)
                    .copied()
                    .collect()
            })
            .unwrap_or_default()
    };
    for (x, y) in a.epochs.iter().zip(&b.epochs) {
        assert_eq!(others(x), others(y));
        assert_eq!(x.alarms, y.alarms);
    }
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
        .all(|e| e.geometry.status == GeometryStatus::Unknown
            && e.geometry
                .note
                .as_deref()
                .unwrap()
                .starts_with("geometry unknown")
            && e.score
                .as_ref()
                .is_none_or(|s| s.deductions.iter().all(|d| d.monitor != Monitor::Geometry))));
    let ex = assess_stream_excerpt(&session(), no_sky.as_bytes()).unwrap();
    let line = ex.epochs[0].to_json_line();
    assert!(line.contains(r#""geometry":{"status":"unknown""#), "{line}");
}

#[test]
fn live_lines_carry_the_geometry_and_classes() {
    let ex = assess_stream_excerpt(&session(), masked(600.0, 0.0).as_bytes()).unwrap();
    assert_eq!(ex.schema, "1.3");
    let e = ex.epochs.iter().find(|e| e.t_s == 700.0).unwrap();
    let line = e.to_json_line();
    let adv = line.find("\"advisory\"").unwrap();
    let geo = line.find("\"geometry\":{").unwrap();
    assert!(adv < geo, "{line}");
    assert!(
        line.contains(r#""monitor":"geometry""#) && line.contains(r#""class":"geometry""#),
        "{line}"
    );
    assert!(ex.summary.geometry.class_geometry > 0);
}
