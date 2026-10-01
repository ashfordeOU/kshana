// SPDX-License-Identifier: AGPL-3.0-only
//! Shared pipeline for the JammerTest 2024 spoofing oracles
//! (`tests/spoof_detection_jammertest_oracle.rs`, `tests/tpl_jammertest_coverage_oracle.rs`).
//!
//! Everything here was fixed in the promotion records (M010, M011) before the first run: the
//! slices, the windows, the monitors and their parameters. The fixture is cut by
//! `tests/fixtures/spoof_detection_jammertest_oracle/generate_spoof_detection_jammertest_oracle.py`
//! from the JammerTest 2024 dataset (GPL-3.0-or-later, see the NOTICE there) and the IGS merged
//! broadcast navigation file; the published onsets come from the JammerTest 2024 transmission plan.

#![allow(dead_code)]

use kshana::allan::overlapping_adev;
use kshana::gnss_sim::{Meteo, C_M_PER_S};
use kshana::orbit::los_unit;
use kshana::pvt::{assemble_epoch, solve_spp, AtmosModel};
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;
use kshana::security::{min_detectable_offset_ns, monitor_sigma_s, SPOOF_DETECT_K};
use kshana::spoof_monitors::parity_raim_test;

pub const FIXTURE_DIR: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/spoof_detection_jammertest_oracle"
);

/// Elevation mask, degrees.
pub const MASK_DEG: f64 = 10.0;
/// RAIM pseudorange sigma, metres.
pub const RAIM_SIGMA_M: f64 = 3.0;
/// RAIM false-alert probability per epoch.
pub const RAIM_PFA: f64 = 1e-5;
/// Calibration length, seconds.
pub const CAL_S: f64 = 60.0;
/// Minimum pre-onset false-alarm window, seconds.
pub const MIN_PRE_S: f64 = 15.0;
/// Detection tolerance after the published onset, seconds (M010).
pub const DETECT_TOL_S: f64 = 10.0;
/// Post-onset horizon for M011, seconds.
pub const HORIZON_S: f64 = 300.0;
/// Trailing clock-prediction window (epochs) and its minimum.
pub const PRED_MAX: usize = 60;
pub const PRED_MIN: usize = 10;
/// A clock step within this distance of a whole number of milliseconds is a receiver reset.
pub const RESET_TOL_M: f64 = 100.0;

/// Seconds of day from `YYYY-MM-DD HH:MM:SS`.
fn sod(s: &str) -> f64 {
    let t = s.split(' ').nth(1).expect("time");
    let mut it = t.split(':').map(|x| x.parse::<f64>().expect("hms"));
    let (h, m, sec) = (it.next().unwrap(), it.next().unwrap(), it.next().unwrap());
    h * 3600.0 + m * 60.0 + sec
}

pub struct Onset {
    pub id: String,
    pub file: String,
    pub onset: f64,
    pub slot_end: f64,
    pub cal_start: f64,
}

pub fn onsets() -> Vec<Onset> {
    let text = std::fs::read_to_string(format!("{FIXTURE_DIR}/onsets.tsv")).expect("onsets.tsv");
    text.lines()
        .skip(1)
        .filter(|l| !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split('\t').collect();
            Onset {
                id: f[0].to_string(),
                file: f[1].to_string(),
                onset: sod(f[2]),
                slot_end: sod(f[3]),
                cal_start: sod(f[4]),
            }
        })
        .collect()
}

#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum AlarmKind {
    Raim,
    SolveFailure,
    Clock,
}

#[derive(Clone, Debug)]
pub struct EpochOut {
    pub t: f64,
    pub n_sats: usize,
    /// Unwrapped receiver clock bias, seconds (None when no solve).
    pub clock_s: Option<f64>,
    pub raim_stat: Option<f64>,
    pub raim_thr: Option<f64>,
    pub clock_innov_s: Option<f64>,
    pub alarm: Option<AlarmKind>,
}

#[derive(Clone, Debug)]
pub struct OnsetResult {
    pub id: String,
    pub onset: f64,
    pub cal_start: f64,
    pub cal_end: f64,
    pub horizon_end: f64,
    pub evaluable: bool,
    pub cal_samples: usize,
    pub q_wf: f64,
    pub q_rw: f64,
    pub r: f64,
    pub sigma_mon_s: f64,
    pub bound_ns: f64,
    pub pre_onset_epochs: usize,
    pub pre_onset_alarms: Vec<(f64, AlarmKind)>,
    pub detection: Option<(f64, AlarmKind)>,
    pub epochs: Vec<EpochOut>,
}

fn line_fit(ts: &[f64], ys: &[f64]) -> (f64, f64, f64) {
    // y = a + b (t - t0); returns (a, b, t0)
    let n = ts.len() as f64;
    let t0 = ts.iter().sum::<f64>() / n;
    let y0 = ys.iter().sum::<f64>() / n;
    let (mut sxx, mut sxy) = (0.0, 0.0);
    for (t, y) in ts.iter().zip(ys) {
        sxx += (t - t0) * (t - t0);
        sxy += (t - t0) * (y - y0);
    }
    let b = if sxx > 0.0 { sxy / sxx } else { 0.0 };
    (y0, b, t0)
}

/// The least-squares line through `(ts, ys)`, evaluated at `t`.
pub fn line_predict(ts: &[f64], ys: &[f64], t: f64) -> f64 {
    let (a, b, t0) = line_fit(ts, ys);
    a + b * (t - t0)
}

pub fn run_onset(o: &Onset) -> OnsetResult {
    let obs_text = std::fs::read_to_string(format!("{FIXTURE_DIR}/{}", o.file)).expect("obs");
    let nav_text =
        std::fs::read_to_string(format!("{FIXTURE_DIR}/brdc_gps_20240911.rnx")).expect("nav");
    let obs = parse_obs(&obs_text).expect("parse obs");
    let ephs = parse_nav(&nav_text).expect("parse nav");
    let apriori = obs.header.approx_xyz.expect("approx xyz");
    let atmos = AtmosModel {
        iono: Default::default(),
        meteo: Meteo::default(),
    };
    let cal_end = o.cal_start + CAL_S;
    let horizon_end = o.slot_end.min(o.onset + HORIZON_S);

    // Pass 1: per-epoch solve, RAIM, unwrapped clock.
    let mut epochs = Vec::new();
    let mut reset_offset = 0.0_f64;
    let mut prev_raw: Option<f64> = None;
    for idx in 0..obs.epochs.len() {
        let e = &obs.epochs[idx].time;
        let t = e.hour as f64 * 3600.0 + e.minute as f64 * 60.0 + e.second;
        let meas: Vec<_> = assemble_epoch(&obs, idx, &ephs, apriori, &atmos, MASK_DEG, true)
            .into_iter()
            .map(|(_, m)| m)
            .collect();
        let n = meas.len();
        let mut out = EpochOut {
            t,
            n_sats: n,
            clock_s: None,
            raim_stat: None,
            raim_thr: None,
            clock_innov_s: None,
            alarm: None,
        };
        if n >= 4 {
            match solve_spp(&meas, apriori) {
                Some(fix) => {
                    let raw = fix.clock_bias_m / C_M_PER_S;
                    if let Some(p) = prev_raw {
                        let d = raw - p;
                        let k = (d / 1e-3).round();
                        if k != 0.0 && ((d - k * 1e-3) * C_M_PER_S).abs() < RESET_TOL_M {
                            reset_offset -= k * 1e-3;
                        }
                    }
                    prev_raw = Some(raw);
                    out.clock_s = Some(raw + reset_offset);
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
                            Some(r) => {
                                out.raim_stat = Some(r.statistic);
                                out.raim_thr = Some(r.threshold);
                                if r.alert {
                                    out.alarm = Some(AlarmKind::Raim);
                                }
                            }
                            None => out.alarm = Some(AlarmKind::SolveFailure),
                        }
                    }
                }
                None => {
                    if n >= 5 {
                        out.alarm = Some(AlarmKind::SolveFailure);
                    }
                }
            }
        }
        epochs.push(out);
    }

    // Calibration of the clock monitor.
    let cal: Vec<(f64, f64)> = epochs
        .iter()
        .filter(|e| e.t >= o.cal_start && e.t < cal_end)
        .filter_map(|e| e.clock_s.map(|c| (e.t, c)))
        .collect();
    let (ts, ys): (Vec<f64>, Vec<f64>) = cal.iter().copied().unzip();
    let (a, b, t0) = if ts.len() >= 2 {
        line_fit(&ts, &ys)
    } else {
        (0.0, 0.0, 0.0)
    };
    let r = if ts.len() > 2 {
        ts.iter()
            .zip(&ys)
            .map(|(t, y)| (y - (a + b * (t - t0))).powi(2))
            .sum::<f64>()
            / (ts.len() as f64 - 2.0)
    } else {
        f64::NAN
    };
    let adev1 = if ys.len() > 3 {
        overlapping_adev(&ys, 1.0, 1)
    } else {
        f64::NAN
    };
    let adev10 = if ys.len() > 21 {
        overlapping_adev(&ys, 1.0, 10)
    } else {
        f64::NAN
    };
    let q_wf = adev1 * adev1;
    let rw_level = adev10 / (10.0_f64 / 3.0).sqrt();
    let q_rw = 3.0 * rw_level * rw_level;
    let sigma_mon_s = monitor_sigma_s(q_wf, q_rw, r, 1.0, 1.0);
    let bound_ns = min_detectable_offset_ns(q_wf, q_rw, r, 1.0, 1.0, SPOOF_DETECT_K);

    let evaluable =
        (o.onset - cal_end) >= MIN_PRE_S && ts.len() >= PRED_MIN && bound_ns.is_finite();

    // Pass 2: clock-aided monitor from the end of calibration.
    let mut history: Vec<(f64, f64)> = cal.clone();
    for e in epochs.iter_mut() {
        if e.t < cal_end {
            continue;
        }
        if let Some(c) = e.clock_s {
            if history.len() >= PRED_MIN && bound_ns.is_finite() {
                let tail = &history[history.len().saturating_sub(PRED_MAX)..];
                let (hts, hys): (Vec<f64>, Vec<f64>) = tail.iter().copied().unzip();
                let innov = c - line_predict(&hts, &hys, e.t);
                e.clock_innov_s = Some(innov);
                if innov.abs() * 1e9 > bound_ns && e.alarm.is_none() {
                    e.alarm = Some(AlarmKind::Clock);
                }
            }
            if e.alarm.is_none() {
                history.push((e.t, c));
            }
        }
    }

    let pre_onset_epochs = epochs
        .iter()
        .filter(|e| e.t >= cal_end && e.t < o.onset)
        .count();
    let pre_onset_alarms = epochs
        .iter()
        .filter(|e| e.t >= cal_end && e.t < o.onset)
        .filter_map(|e| e.alarm.map(|k| (e.t, k)))
        .collect();
    let detection = epochs
        .iter()
        .filter(|e| e.t >= o.onset && e.t <= horizon_end)
        .find_map(|e| e.alarm.map(|k| (e.t, k)));

    OnsetResult {
        id: o.id.clone(),
        onset: o.onset,
        cal_start: o.cal_start,
        cal_end,
        horizon_end,
        evaluable,
        cal_samples: ts.len(),
        q_wf,
        q_rw,
        r,
        sigma_mon_s,
        bound_ns,
        pre_onset_epochs,
        pre_onset_alarms,
        detection,
        epochs,
    }
}
