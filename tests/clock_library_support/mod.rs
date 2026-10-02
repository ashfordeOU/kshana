// SPDX-License-Identifier: AGPL-3.0-only
//! Shared inputs of the clock-library oracles (`tests/clock_library_device_cards_oracle.rs`,
//! `tests/clock_library_tcxo_card_jammertest_oracle.rs`): the IGS GPS Block IIF clock fixture,
//! the data-gated caesium and OCXO records, and the receiver-clock extraction from the
//! JammerTest 2024 training sessions. Every rule here was fixed in the pre-registration of those
//! tests before any of their data was fetched.

#![allow(dead_code)]

use kshana::clock_library::PhaseSeries;
use kshana::gnss_sim::{Meteo, C_M_PER_S};
use kshana::orbit::los_unit;
use kshana::pvt::{assemble_epoch, solve_spp, AtmosModel};
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;
use kshana::spoof_monitors::parity_raim_test;
use std::path::PathBuf;

pub const ROOT: &str = env!("CARGO_MANIFEST_DIR");
pub const CARD_DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/clock_library_device_cards_oracle"
);
pub const TCXO_DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/clock_library_tcxo_card_jammertest_oracle"
);

/// The held-out ratio bar: predicted / measured within [1/BAR, BAR].
pub const BAR: f64 = 1.5;
/// IGS epoch spacing, seconds.
pub const IGS_TAU0: f64 = 30.0;
/// Epochs in the 14-day IGS window.
pub const IGS_EPOCHS: usize = 14 * 2880;
/// Receiver-clock extraction constants (round 1 of M010, unchanged).
pub const MASK_DEG: f64 = 10.0;
pub const RAIM_SIGMA_M: f64 = 3.0;
pub const RAIM_PFA: f64 = 1e-5;
pub const RESET_TOL_M: f64 = 100.0;
/// A gap longer than this (s) splits a training session into separate records.
pub const SPLIT_GAP_S: f64 = 10.0;
/// Records shorter than this (s) are dropped.
pub const MIN_STRETCH_S: f64 = 120.0;
/// Minimum training epochs for the receiver card to be fitted at all.
pub const MIN_TRAIN_EPOCHS: usize = 3600;

pub fn require_realdata() -> bool {
    std::env::var("KSHANA_REQUIRE_REALDATA").is_ok_and(|v| v == "1")
}

fn path_or(env: &str, rel: &str) -> PathBuf {
    std::env::var_os(env)
        .map(PathBuf::from)
        .unwrap_or_else(|| PathBuf::from(ROOT).join(rel))
}

/// The 5071A caesium phase record (s, 1 s), or `None` when absent.
pub fn cs5071a() -> Option<PhaseSeries> {
    let text = std::fs::read_to_string(path_or(
        "KSHANA_CS5071A_PATH",
        "realdata-cache/cs5071a/5071A_phase.txt",
    ))
    .ok()?;
    let x: Vec<f64> = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(|l| l.parse::<f64>().expect("phase sample"))
        .collect();
    Some(PhaseSeries {
        t0: 0.0,
        tau0: 1.0,
        x,
    })
}

/// The OCXO record as phase (s, 1 s): the one-second fractional-frequency readings
/// `(f - 10 MHz) / 10 MHz` integrated from zero. `None` when absent.
pub fn ocxo() -> Option<PhaseSeries> {
    let text = std::fs::read_to_string(path_or(
        "KSHANA_OCXO_PATH",
        "realdata-cache/ocxo/ocxo_frequency.txt",
    ))
    .ok()?;
    let mut x = vec![0.0];
    let mut acc = 0.0;
    for l in text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
    {
        acc += (l.parse::<f64>().expect("frequency reading") - 1.0e7) / 1.0e7;
        x.push(acc);
    }
    Some(PhaseSeries {
        t0: 0.0,
        tau0: 1.0,
        x,
    })
}

/// The IGS GPS Block IIF satellite clocks of the window, one gridded record per PRN
/// (`IGS_EPOCHS` epochs at 30 s, missing epochs NaN), from the committed fixture: per PRN an
/// `@PRN ...` header, then `k d` lines (epoch index, increment of the bias in 1e-14 s since
/// the previous listed epoch; the first listed value is relative to `first_bias_s`).
pub fn igs_iif() -> Vec<(String, PhaseSeries)> {
    let text = std::fs::read_to_string(format!("{CARD_DIR}/igs_iif_30s.txt"))
        .expect("tests/fixtures/clock_library_device_cards_oracle/igs_iif_30s.txt");
    let mut out: Vec<(String, PhaseSeries)> = Vec::new();
    let mut acc: i64 = 0;
    let mut base = 0.0;
    for l in text.lines().filter(|l| !l.starts_with('#')) {
        if let Some(h) = l.strip_prefix('@') {
            let prn = h.split_whitespace().next().expect("prn").to_string();
            base = h
                .split_whitespace()
                .find_map(|f| f.strip_prefix("first_bias_s="))
                .expect("first_bias_s")
                .parse()
                .expect("bias");
            acc = 0;
            out.push((
                prn,
                PhaseSeries {
                    t0: 0.0,
                    tau0: IGS_TAU0,
                    x: vec![f64::NAN; IGS_EPOCHS],
                },
            ));
            continue;
        }
        let mut f = l.split_whitespace();
        let k: usize = f.next().expect("k").parse().expect("k");
        let d: i64 = f.next().expect("d").parse().expect("d");
        acc += d;
        out.last_mut().expect("header").1.x[k] = base + acc as f64 * 1e-14;
    }
    out
}

/// GPS seconds of a calendar epoch, counted from 2024-09-01 00:00 (the JammerTest week only).
fn secs(y: i32, mo: u32, d: u32, h: u32, mi: u32, s: f64) -> f64 {
    assert!(
        y == 2024 && mo == 9,
        "JammerTest dates are in September 2024"
    );
    (d as f64 - 1.0) * 86_400.0 + h as f64 * 3600.0 + mi as f64 * 60.0 + s
}

/// The receiver clock bias (s) of every epoch of a RINEX observation file, by the M010 round-1
/// pass 1: single-point solution with at least four satellites above the mask, millisecond
/// resets unwrapped, and the epoch dropped (None) when it has no solution, a solve failure, or
/// a RAIM parity alarm. Times are seconds from 2024-09-01 00:00 GPS time.
pub fn receiver_clock(obs_text: &str, nav_text: &str) -> Vec<(f64, Option<f64>)> {
    let obs = parse_obs(obs_text).expect("parse obs");
    let ephs = parse_nav(nav_text).expect("parse nav");
    let apriori = obs.header.approx_xyz.expect("approx xyz");
    let atmos = AtmosModel {
        iono: Default::default(),
        meteo: Meteo::default(),
    };
    let mut out = Vec::with_capacity(obs.epochs.len());
    let mut reset_offset = 0.0_f64;
    let mut prev_raw: Option<f64> = None;
    for idx in 0..obs.epochs.len() {
        let e = &obs.epochs[idx].time;
        let t = secs(e.year, e.month, e.day, e.hour, e.minute, e.second);
        let meas: Vec<_> = assemble_epoch(&obs, idx, &ephs, apriori, &atmos, MASK_DEG, true)
            .into_iter()
            .map(|(_, m)| m)
            .collect();
        let n = meas.len();
        let mut clock = None;
        if n >= 4 {
            if let Some(fix) = solve_spp(&meas, apriori) {
                let raw = fix.clock_bias_m / C_M_PER_S;
                if let Some(p) = prev_raw {
                    let d = raw - p;
                    let k = (d / 1e-3).round();
                    if k != 0.0 && ((d - k * 1e-3) * C_M_PER_S).abs() < RESET_TOL_M {
                        reset_offset -= k * 1e-3;
                    }
                }
                prev_raw = Some(raw);
                let mut alarm = false;
                if n >= 5 {
                    let mut rows = Vec::with_capacity(n);
                    let mut resid = Vec::with_capacity(n);
                    for m in &meas {
                        let Some(u) = los_unit(fix.ecef, m.sat_ecef) else {
                            continue;
                        };
                        let dx = m.sat_ecef[0] - fix.ecef[0];
                        let dy = m.sat_ecef[1] - fix.ecef[1];
                        let dz = m.sat_ecef[2] - fix.ecef[2];
                        let pred = (dx * dx + dy * dy + dz * dz).sqrt() + fix.clock_bias_m
                            - m.sat_clock_m
                            + m.iono_m
                            + m.tropo_m;
                        rows.push([u[0], u[1], u[2], 1.0]);
                        resid.push(m.pseudorange_m - pred);
                    }
                    match parity_raim_test(&rows, &resid, RAIM_SIGMA_M, RAIM_PFA) {
                        Some(r) => alarm = r.alert,
                        None => alarm = true,
                    }
                }
                if !alarm {
                    clock = Some(raw + reset_offset);
                }
            }
        }
        out.push((t, clock));
    }
    out
}

/// Split a session's `(t, clock)` epochs into records at every gap longer than
/// [`SPLIT_GAP_S`] (missing or dropped epochs), keep the records of at least
/// [`MIN_STRETCH_S`], each gridded at 1 s.
pub fn stretches(epochs: &[(f64, Option<f64>)]) -> Vec<PhaseSeries> {
    let present: Vec<(f64, f64)> = epochs
        .iter()
        .filter_map(|(t, c)| c.map(|c| (*t, c)))
        .collect();
    let mut out = Vec::new();
    let mut cur: Vec<(f64, f64)> = Vec::new();
    let flush = |cur: &mut Vec<(f64, f64)>, out: &mut Vec<PhaseSeries>| {
        if cur.len() >= 2 && cur[cur.len() - 1].0 - cur[0].0 >= MIN_STRETCH_S {
            out.push(PhaseSeries::from_samples(cur, 1.0).0);
        }
        cur.clear();
    };
    for p in present {
        if let Some(last) = cur.last() {
            if p.0 - last.0 > SPLIT_GAP_S {
                flush(&mut cur, &mut out);
            }
        }
        cur.push(p);
    }
    flush(&mut cur, &mut out);
    out
}

/// The receiver training records: every `train_*.obs` of the TCXO fixture (with its
/// `brdc_gps_YYYYMMDD.rnx`), the excluded epochs already removed by the generator, as
/// stretches ordered by start time. `None` when the fixture holds no training file.
pub fn tcxo_training() -> Option<Vec<PhaseSeries>> {
    let mut files: Vec<PathBuf> = std::fs::read_dir(TCXO_DIR)
        .ok()?
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| {
            p.file_name()
                .and_then(|n| n.to_str())
                .is_some_and(|n| n.starts_with("train_") && n.ends_with(".obs"))
        })
        .collect();
    files.sort();
    if files.is_empty() {
        return None;
    }
    let mut out = Vec::new();
    for f in files {
        let obs_text = std::fs::read_to_string(&f).expect("training obs");
        let obs = parse_obs(&obs_text).expect("parse obs");
        let day = &obs.epochs[0].time;
        let nav = format!(
            "{TCXO_DIR}/brdc_gps_{:04}{:02}{:02}.rnx",
            day.year, day.month, day.day
        );
        let nav_text = std::fs::read_to_string(&nav).expect("training nav");
        out.extend(stretches(&receiver_clock(&obs_text, &nav_text)));
    }
    out.sort_by(|a, b| a.t0.total_cmp(&b.t0));
    Some(out)
}

/// The fit/score split of the receiver records: in start order, records go to the fit set
/// until its present epochs reach a third of the total (the record that crosses the third goes
/// to the fit set); the rest are held out.
pub fn split_records_by_third(recs: &[PhaseSeries]) -> (Vec<PhaseSeries>, Vec<PhaseSeries>) {
    let total: usize = recs.iter().map(|r| r.valid()).sum();
    let mut acc = 0usize;
    let (mut fit, mut held) = (Vec::new(), Vec::new());
    for r in recs {
        if 3 * acc < total {
            acc += r.valid();
            fit.push(r.clone());
        } else {
            held.push(r.clone());
        }
    }
    (fit, held)
}
