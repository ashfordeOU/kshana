// SPDX-License-Identifier: AGPL-3.0-only
//! Trust monitors over a receiver [`Timeline`].
//!
//! Two families run here:
//!
//! * **Measurement-domain monitors** on what the receiver itself logged: a drop in
//!   carrier-to-noise density (C/N0) against a per-satellite baseline, a step in the
//!   automatic gain control (AGC) reading, the u-blox continuous-wave jamming indicator,
//!   a loss of tracked satellites, and a jump of the receiver's own reported position.
//! * **Engine-fix monitors**, only when RINEX observations and broadcast navigation are
//!   both supplied: the engine forms its own single-point fix every epoch
//!   ([`crate::pvt::solve_spp`]), tests it with parity receiver autonomous integrity
//!   monitoring (RAIM, [`crate::spoof_monitors::parity_raim_test`]), unwraps the
//!   receiver clock across millisecond resets, and runs a clock-aided monitor whose
//!   bound comes from the calibration-window noise ([`crate::allan::overlapping_adev`],
//!   [`crate::security::min_detectable_offset_ns`]).
//!
//! Every parameter is in [`MonitorConfig`] and stated before the run. The baseline comes
//! only from the calibration window at the start of the log, so nothing is tuned on the
//! events being scored. Outputs are deterministic: ordered maps and sets only.

use std::collections::{BTreeMap, BTreeSet};

use serde::{Deserialize, Serialize};

use super::{LogEpoch, ReportedFix, Timeline};
use crate::allan::overlapping_adev;
use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::gnss_sim::{Meteo, C_M_PER_S};
use crate::orbit::los_unit;
use crate::pvt::{assemble_epoch, solve_spp, AtmosModel};
use crate::rinex::RinexEphemeris;
use crate::rinex_obs::RinexObs;
use crate::security::{min_detectable_offset_ns, SPOOF_DETECT_K};
use crate::spoof_monitors::parity_raim_test;

/// Most recent accepted clock samples the line prediction uses.
const PRED_MAX: usize = 60;
/// Fewest accepted clock samples before the clock-aided monitor decides.
const PRED_MIN: usize = 10;
/// A clock step within this range (m) of a whole number of milliseconds is a receiver
/// millisecond reset, not a real clock change.
const RESET_TOL_M: f64 = 100.0;
/// Timeline and engine epochs closer than this (s) are the same instant.
const MERGE_TOL_S: f64 = 1e-3;
/// A gap between two decisions of one monitor wider than this many times its median
/// decision spacing (one missing epoch or more) closes an alarm run.
const RUN_GAP_FACTOR: f64 = 1.5;

/// Every monitor parameter, stated up front in the scenario (pre-registered). Each
/// default is documented with the reason for its value.
#[derive(Clone, Debug, Serialize, Deserialize, PartialEq)]
#[serde(deny_unknown_fields, default)]
pub struct MonitorConfig {
    /// Baseline window from the log start, s. Default 60: a minute at the usual 1 Hz
    /// gives enough samples for stable medians and for the clock noise fit (which needs
    /// more than 21 samples), while staying short against typical test logs.
    pub calibration_s: f64,
    /// Mean C/N0 drop against the baseline that raises [`Monitor::Cn0Drop`], dB. Default
    /// 6: twice the few-dB scatter of a static antenna's C/N0, and a quarter of the
    /// signal power, which is the order of the drop an in-band jammer causes before
    /// lock is lost. Twice this value makes the epoch untrusted.
    pub cn0_drop_db: f64,
    /// Fewest satellites common with the baseline for a C/N0 drop decision. Default 4:
    /// the fewest satellites a fix needs, and enough that one satellite's multipath fade
    /// does not dominate the mean.
    pub cn0_min_sats: usize,
    /// AGC alarm threshold in baseline standard deviations: [`Monitor::Agc`] is raised
    /// when `|agc - mean| > k * sd`. The standard deviation is floored at one count and at
    /// 1 % of the mean so a perfectly quiet calibration does not alarm on quantisation.
    /// Default 5: the same five-sigma multiplier the clock-aided monitor uses.
    pub agc_k_sigma: f64,
    /// u-blox jamming indicator (`jamInd`, 0–255) above which [`Monitor::JamInd`] is
    /// raised. Default 80: well above the single-digit to low-tens readings of a clean
    /// sky, below the saturating values a strong continuous-wave interferer produces.
    pub jam_ind_threshold: f64,
    /// Tracked-satellite loss that raises [`Monitor::LossOfLock`]: the count falling below
    /// the baseline median by at least this many. Default 4: as many satellites as a fix
    /// needs, well beyond what rising and setting satellites change in seconds.
    pub sats_lost: usize,
    /// Horizontal distance of the reported fix from the calibration mean that raises
    /// [`Monitor::PositionJump`], m. Default 50: an order of magnitude above the
    /// few-metre scatter of a static single-point fix, so a static receiver only exceeds
    /// it under a forced position.
    pub position_jump_m: f64,
    /// Elevation mask for the engine fix, degrees. Default 10: the common mask that
    /// excludes the noisiest, most multipath-prone low satellites.
    pub mask_deg: f64,
    /// Pseudorange standard deviation for RAIM, m. Default 3: the usual single-frequency
    /// code-noise plus residual-atmosphere level of a broadcast-ephemeris fix.
    pub raim_sigma_m: f64,
    /// RAIM false-alert probability per epoch. Default 1e-5: the per-sample false-alert
    /// budget conventional for fault detection.
    pub raim_pfa: f64,
    /// Run the clock-aided monitor (only when the engine fix runs). Default true: the
    /// receiver clock is the observable a consistent spoofer moves that RAIM cannot see.
    pub clock_monitor: bool,
}

impl Default for MonitorConfig {
    fn default() -> Self {
        Self {
            calibration_s: 60.0,
            cn0_drop_db: 6.0,
            cn0_min_sats: 4,
            agc_k_sigma: 5.0,
            jam_ind_threshold: 80.0,
            sats_lost: 4,
            position_jump_m: 50.0,
            mask_deg: 10.0,
            raim_sigma_m: 3.0,
            raim_pfa: 1e-5,
            clock_monitor: true,
        }
    }
}

impl MonitorConfig {
    /// Reject parameters no monitor can use (non-finite, non-positive, out of range).
    pub fn validate(&self) -> Result<(), String> {
        let pos = |name: &str, v: f64| -> Result<(), String> {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!(
                    "monitor config: {name} must be finite and > 0 (got {v})"
                ))
            }
        };
        pos("calibration_s", self.calibration_s)?;
        pos("cn0_drop_db", self.cn0_drop_db)?;
        pos("agc_k_sigma", self.agc_k_sigma)?;
        pos("position_jump_m", self.position_jump_m)?;
        pos("raim_sigma_m", self.raim_sigma_m)?;
        if !self.jam_ind_threshold.is_finite() {
            return Err("monitor config: jam_ind_threshold must be finite".into());
        }
        if !(self.mask_deg.is_finite() && (-90.0..90.0).contains(&self.mask_deg)) {
            return Err(format!(
                "monitor config: mask_deg must be in [-90, 90) (got {})",
                self.mask_deg
            ));
        }
        if !(self.raim_pfa > 0.0 && self.raim_pfa < 1.0) {
            return Err(format!(
                "monitor config: raim_pfa must be in (0, 1) (got {})",
                self.raim_pfa
            ));
        }
        if self.cn0_min_sats == 0 {
            return Err("monitor config: cn0_min_sats must be at least 1".into());
        }
        if self.sats_lost == 0 {
            return Err("monitor config: sats_lost must be at least 1".into());
        }
        Ok(())
    }
}

/// One trust monitor.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, Serialize, Deserialize, PartialOrd, Ord)]
#[serde(rename_all = "kebab-case")]
pub enum Monitor {
    /// Mean C/N0 over satellites common with the baseline dropped by at least
    /// [`MonitorConfig::cn0_drop_db`].
    Cn0Drop,
    /// AGC reading outside [`MonitorConfig::agc_k_sigma`] baseline standard deviations.
    Agc,
    /// u-blox jamming indicator above [`MonitorConfig::jam_ind_threshold`].
    JamInd,
    /// Tracked satellites fell [`MonitorConfig::sats_lost`] or more below the baseline
    /// median.
    LossOfLock,
    /// The receiver's reported fix moved more than [`MonitorConfig::position_jump_m`]
    /// horizontally from the calibration mean.
    PositionJump,
    /// The engine fix failed the parity RAIM consistency test.
    Raim,
    /// The unwrapped receiver clock left its predicted line by more than the
    /// calibration-derived bound.
    Clock,
    /// Five or more usable satellites but the engine solve (or its RAIM test) failed.
    SolveFailure,
}

/// The trust verdict for one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum TrustState {
    /// Inside the calibration window: the baseline is being formed, nothing alarms.
    Calibrating,
    /// No monitor alarmed.
    Nominal,
    /// A measurement-domain alarm (C/N0 drop, AGC, jamming indicator, loss of lock):
    /// the environment is degraded but the fix itself is not shown wrong.
    Degraded,
    /// An alarm on the fix itself (RAIM, clock, solve failure, position jump), or a C/N0
    /// drop of twice the configured threshold.
    Untrusted,
}

/// Monitor statistics and verdict at one epoch. Fields a source cannot supply are `None`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochTrust {
    /// Seconds since the first epoch of the log.
    pub t_s: f64,
    /// Distinct satellites with a C/N0 reading this epoch.
    pub n_sats: usize,
    /// Mean C/N0 over every reading this epoch, dB-Hz.
    pub cn0_mean_dbhz: Option<f64>,
    /// Mean over (satellite, band) keys common with the baseline of
    /// `baseline_median - now`, dB; `None` when fewer than
    /// [`MonitorConfig::cn0_min_sats`] keys are common.
    pub cn0_drop_db: Option<f64>,
    /// AGC reading, receiver units.
    pub agc: Option<f64>,
    /// AGC deviation from the baseline mean in (floored) baseline standard deviations.
    pub agc_z: Option<f64>,
    /// u-blox jamming indicator, 0–255.
    pub jam_ind: Option<f64>,
    /// Reported fix horizontal distance from the calibration mean, m.
    pub position_offset_m: Option<f64>,
    /// RAIM test statistic (weighted residual sum of squares) of the engine fix.
    pub raim_stat: Option<f64>,
    /// RAIM chi-square threshold for the configured false-alert probability.
    pub raim_thr: Option<f64>,
    /// Clock-aided monitor innovation (unwrapped clock minus line prediction), ns.
    pub clock_innov_ns: Option<f64>,
    /// Clock-aided monitor bound, ns (present where the monitor decided).
    pub clock_bound_ns: Option<f64>,
    /// Monitors that alarmed at this epoch, in [`Monitor`] order.
    pub alarms: Vec<Monitor>,
    /// The epoch's trust verdict.
    pub state: TrustState,
}

/// A contiguous run of one monitor's alarm.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct AlarmRun {
    /// The monitor that alarmed.
    pub monitor: Monitor,
    /// Time of the first alarmed epoch of the run, s.
    pub start_s: f64,
    /// Time of the last alarmed epoch of the run, s.
    pub end_s: f64,
    /// Alarmed epochs in the run.
    pub epochs: usize,
}

/// What the calibration window established.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Baseline {
    /// Epochs (timeline and engine, merged) inside the calibration window.
    pub calibration_epochs: usize,
    /// Median C/N0 across every satellite sample in the window, dB-Hz.
    pub cn0_median_dbhz: Option<f64>,
    /// Median tracked-satellite count in the window.
    pub tracked_median: Option<f64>,
    /// Mean AGC reading in the window.
    pub agc_mean: Option<f64>,
    /// AGC standard deviation in the window, after the floor (one count, 1 % of the mean)
    /// that the monitor actually uses.
    pub agc_sd: Option<f64>,
    /// Median jamming indicator in the window.
    pub jam_ind_median: Option<f64>,
    /// Minimum detectable clock offset from the calibration noise, ns, when the engine fix
    /// runs and the clock-aided monitor could be calibrated.
    pub clock_bound_ns: Option<f64>,
}

/// The monitors' output over a whole log.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct TrustResult {
    /// Only monitors whose input data (and baseline) existed, in [`Monitor`] order.
    pub monitors_run: Vec<Monitor>,
    /// The calibration baseline.
    pub baseline: Baseline,
    /// One entry per epoch (timeline and engine epochs merged by time).
    pub epochs: Vec<EpochTrust>,
    /// Contiguous alarm runs per monitor, ordered by start time then monitor. A gap of one
    /// missing epoch (in that monitor's decisions) closes a run.
    pub runs: Vec<AlarmRun>,
    /// Time of the first alarm after calibration, s.
    pub first_alarm_s: Option<f64>,
}

/// Inputs for the engine's own fix: RINEX observations and broadcast navigation. Only
/// when both are given do RAIM, solve-failure and the clock-aided monitor run.
pub struct EngineFixInput<'a> {
    /// Parsed RINEX observation file (the same file the timeline was read from).
    pub obs: &'a RinexObs,
    /// Broadcast ephemerides covering the observation span.
    pub ephs: &'a [RinexEphemeris],
}

/// The engine-fix monitors at one observation epoch.
#[derive(Clone, Debug, Default)]
struct EngineEpoch {
    t_s: f64,
    clock_s: Option<f64>,
    raim_stat: Option<f64>,
    raim_thr: Option<f64>,
    raim_alarm: bool,
    solve_failure: bool,
    clock_innov_s: Option<f64>,
    clock_decided: bool,
    clock_alarm: bool,
}

fn median(v: &[f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    let n = s.len();
    Some(if n % 2 == 1 {
        s[n / 2]
    } else {
        0.5 * (s[n / 2 - 1] + s[n / 2])
    })
}

fn mean(v: &[f64]) -> Option<f64> {
    if v.is_empty() {
        None
    } else {
        Some(v.iter().sum::<f64>() / v.len() as f64)
    }
}

/// Least-squares line `y = a + b (t - t0)` through `(ts, ys)`; returns `(a, b, t0)`.
fn line_fit(ts: &[f64], ys: &[f64]) -> (f64, f64, f64) {
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

fn line_predict(ts: &[f64], ys: &[f64], t: f64) -> f64 {
    let (a, b, t0) = line_fit(ts, ys);
    a + b * (t - t0)
}

/// Horizontal distance of `fix` from the reference `(lat_deg, lon_deg, height_m)`,
/// in the local east-north plane at the reference. Both points are placed at the
/// reference height so a height change does not leak into the horizontal distance.
fn horizontal_offset_m(reference: (f64, f64, f64), fix: &ReportedFix) -> f64 {
    let (lat0, lon0, h0) = reference;
    let r = geodetic_to_ecef(Geodetic {
        lat_rad: lat0.to_radians(),
        lon_rad: lon0.to_radians(),
        alt_m: h0,
    });
    let p = geodetic_to_ecef(Geodetic {
        lat_rad: fix.lat_deg.to_radians(),
        lon_rad: fix.lon_deg.to_radians(),
        alt_m: h0,
    });
    let d = [p[0] - r[0], p[1] - r[1], p[2] - r[2]];
    let (sl, cl) = lat0.to_radians().sin_cos();
    let (so, co) = lon0.to_radians().sin_cos();
    let east = -so * d[0] + co * d[1];
    let north = -sl * co * d[0] - sl * so * d[1] + cl * d[2];
    east.hypot(north)
}

/// Whether the loss-of-lock monitor decides at this timeline epoch: when it carries a
/// satellite list, or when it carries nothing else at all (a satellite record that
/// listed nothing tracked). An epoch that only carries an RF-status reading (AGC,
/// jamming indicator) or a position is not a statement about tracked satellites.
fn tracks_satellites(e: &LogEpoch) -> bool {
    !e.cn0.is_empty() || (e.agc.is_none() && e.jam_ind.is_none() && e.fix.is_none())
}

fn distinct_sats(e: &LogEpoch) -> usize {
    e.cn0
        .iter()
        .map(|c| c.sat.as_str())
        .collect::<BTreeSet<_>>()
        .len()
}

/// The engine's own per-epoch fix, RAIM, clock unwrapping and clock-aided monitor.
/// Returns the per-epoch results (time relative to the first observation epoch) and the
/// clock bound in ns when the clock-aided monitor could be calibrated.
fn engine_pass(
    input: &EngineFixInput<'_>,
    cfg: &MonitorConfig,
) -> Result<(Vec<EngineEpoch>, Option<f64>), String> {
    let obs = input.obs;
    let apriori = obs.header.approx_xyz.ok_or_else(|| {
        "engine fix: the RINEX observation header has no APPROX POSITION XYZ to start the \
         solve from"
            .to_string()
    })?;
    let Some(first) = obs.epochs.first() else {
        return Ok((Vec::new(), None));
    };
    let t_first = first.time.seconds_from_gps_epoch();
    let atmos = AtmosModel {
        iono: Default::default(),
        meteo: Meteo::default(),
    };

    // Pass 1: per-epoch solve, RAIM, unwrapped clock.
    let mut epochs = Vec::with_capacity(obs.epochs.len());
    let mut reset_offset = 0.0_f64;
    let mut prev_raw: Option<f64> = None;
    for idx in 0..obs.epochs.len() {
        let t_s = obs.epochs[idx].time.seconds_from_gps_epoch() - t_first;
        let meas: Vec<_> =
            assemble_epoch(obs, idx, input.ephs, apriori, &atmos, cfg.mask_deg, true)
                .into_iter()
                .map(|(_, m)| m)
                .collect();
        let n = meas.len();
        let mut out = EngineEpoch {
            t_s,
            ..Default::default()
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
                        match parity_raim_test(&rows, &resid, cfg.raim_sigma_m, cfg.raim_pfa) {
                            Some(r) => {
                                out.raim_stat = Some(r.statistic);
                                out.raim_thr = Some(r.threshold);
                                out.raim_alarm = r.alert;
                            }
                            None => out.solve_failure = true,
                        }
                    }
                }
                None => {
                    if n >= 5 {
                        out.solve_failure = true;
                    }
                }
            }
        }
        epochs.push(out);
    }

    if !cfg.clock_monitor {
        return Ok((epochs, None));
    }

    // Calibration of the clock-aided monitor over the calibration window.
    let cal: Vec<(f64, f64)> = epochs
        .iter()
        .filter(|e| e.t_s < cfg.calibration_s)
        .filter_map(|e| e.clock_s.map(|c| (e.t_s, c)))
        .collect();
    let (ts, ys): (Vec<f64>, Vec<f64>) = cal.iter().copied().unzip();
    // Sampling interval: the median spacing of the calibration samples (1 s for a
    // 1 Hz log, which makes every expression below reduce to the 1 Hz form).
    let tau0 = median(&ts.windows(2).map(|w| w[1] - w[0]).collect::<Vec<_>>())
        .filter(|d| d.is_finite() && *d > 0.0)
        .unwrap_or(1.0);
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
        overlapping_adev(&ys, tau0, 1)
    } else {
        f64::NAN
    };
    let adev10 = if ys.len() > 21 {
        overlapping_adev(&ys, tau0, 10)
    } else {
        f64::NAN
    };
    // White frequency noise level from ADEV(tau0) and random-walk level from ADEV(10 tau0),
    // as spectral densities so that the one-step variance is q_wf tau0 + q_rw tau0^3 / 3.
    let q_wf = adev1 * adev1 * tau0;
    let rw_level = adev10 / (10.0_f64 / 3.0).sqrt();
    let q_rw = 3.0 * rw_level * rw_level / tau0;
    let bound_ns = min_detectable_offset_ns(q_wf, q_rw, r, tau0, 1.0, SPOOF_DETECT_K);
    if !(bound_ns.is_finite() && ts.len() >= PRED_MIN) {
        return Ok((epochs, None));
    }

    // Pass 2: line-predict innovation after calibration; alarmed epochs (any engine
    // alarm) do not join the prediction history.
    let mut history = cal;
    for e in epochs.iter_mut() {
        if e.t_s < cfg.calibration_s {
            continue;
        }
        if let Some(c) = e.clock_s {
            if history.len() >= PRED_MIN {
                let tail = &history[history.len().saturating_sub(PRED_MAX)..];
                let (hts, hys): (Vec<f64>, Vec<f64>) = tail.iter().copied().unzip();
                let innov = c - line_predict(&hts, &hys, e.t_s);
                e.clock_innov_s = Some(innov);
                e.clock_decided = true;
                e.clock_alarm = innov.abs() * 1e9 > bound_ns;
            }
            if !(e.clock_alarm || e.raim_alarm || e.solve_failure) {
                history.push((e.t_s, c));
            }
        }
    }
    Ok((epochs, Some(bound_ns)))
}

/// One merged instant: a timeline epoch, an engine epoch, or both.
struct Slot {
    t_s: f64,
    tl: Option<usize>,
    en: Option<usize>,
}

fn merge_slots(tl: &Timeline, en: &[EngineEpoch]) -> Vec<Slot> {
    let mut a: Vec<usize> = (0..tl.epochs.len()).collect();
    a.sort_by(|&i, &j| tl.epochs[i].t_s.total_cmp(&tl.epochs[j].t_s));
    let mut b: Vec<usize> = (0..en.len()).collect();
    b.sort_by(|&i, &j| en[i].t_s.total_cmp(&en[j].t_s));
    let mut out = Vec::with_capacity(a.len().max(b.len()));
    let (mut i, mut j) = (0, 0);
    loop {
        match (a.get(i), b.get(j)) {
            (Some(&ia), Some(&jb)) => {
                let (ta, tb) = (tl.epochs[ia].t_s, en[jb].t_s);
                if (ta - tb).abs() <= MERGE_TOL_S {
                    out.push(Slot {
                        t_s: ta,
                        tl: Some(ia),
                        en: Some(jb),
                    });
                    i += 1;
                    j += 1;
                } else if ta < tb {
                    out.push(Slot {
                        t_s: ta,
                        tl: Some(ia),
                        en: None,
                    });
                    i += 1;
                } else {
                    out.push(Slot {
                        t_s: tb,
                        tl: None,
                        en: Some(jb),
                    });
                    j += 1;
                }
            }
            (Some(&ia), None) => {
                out.push(Slot {
                    t_s: tl.epochs[ia].t_s,
                    tl: Some(ia),
                    en: None,
                });
                i += 1;
            }
            (None, Some(&jb)) => {
                out.push(Slot {
                    t_s: en[jb].t_s,
                    tl: None,
                    en: Some(jb),
                });
                j += 1;
            }
            (None, None) => break,
        }
    }
    out
}

/// Run every monitor whose input exists over the timeline (and the engine's own fix when
/// `engine` is given).
///
/// Epochs before [`MonitorConfig::calibration_s`] are [`TrustState::Calibrating`], form
/// the baseline and never alarm. Errors when the configuration is invalid, when the
/// calibration window holds fewer than three epochs, or when the engine fix is requested
/// but the observation header has no approximate position.
pub fn run_monitors(
    tl: &Timeline,
    engine: Option<EngineFixInput<'_>>,
    cfg: &MonitorConfig,
) -> Result<TrustResult, String> {
    cfg.validate()?;
    if tl.epochs.iter().any(|e| !e.t_s.is_finite()) {
        return Err("receiver timeline has a non-finite epoch time".into());
    }
    let (en, clock_bound_ns) = match &engine {
        Some(input) => engine_pass(input, cfg)?,
        None => (Vec::new(), None),
    };
    let slots = merge_slots(tl, &en);
    let cal_s = cfg.calibration_s;
    let calibration_epochs = slots.iter().filter(|s| s.t_s < cal_s).count();
    if calibration_epochs < 3 {
        let span = slots.last().map(|s| s.t_s).unwrap_or(0.0);
        return Err(format!(
            "the log is shorter than the calibration window: {calibration_epochs} epoch(s) \
             before {cal_s} s (log spans {span:.1} s); at least 3 are needed to form the baseline"
        ));
    }
    let cal_tl: Vec<&LogEpoch> = slots
        .iter()
        .filter(|s| s.t_s < cal_s)
        .filter_map(|s| s.tl.map(|i| &tl.epochs[i]))
        .collect();

    // Baseline: C/N0 per (satellite, band), tracked count, AGC, jamming indicator, fix.
    let mut key_samples: BTreeMap<(String, String), Vec<f64>> = BTreeMap::new();
    let mut all_cn0 = Vec::new();
    for e in &cal_tl {
        for c in &e.cn0 {
            key_samples
                .entry((c.sat.clone(), c.band.clone()))
                .or_default()
                .push(c.cn0_dbhz);
            all_cn0.push(c.cn0_dbhz);
        }
    }
    let key_median: BTreeMap<(String, String), f64> = key_samples
        .iter()
        .filter_map(|(k, v)| median(v).map(|m| (k.clone(), m)))
        .collect();
    let tracked: Vec<f64> = cal_tl
        .iter()
        .filter(|e| tracks_satellites(e))
        .map(|e| distinct_sats(e) as f64)
        .collect();
    let agc_cal: Vec<f64> = cal_tl.iter().filter_map(|e| e.agc).collect();
    let agc_mean = mean(&agc_cal);
    let agc_sd = agc_mean.map(|m| {
        let sd = if agc_cal.len() > 1 {
            (agc_cal.iter().map(|x| (x - m).powi(2)).sum::<f64>() / (agc_cal.len() - 1) as f64)
                .sqrt()
        } else {
            0.0
        };
        sd.max(1.0).max(0.01 * m.abs())
    });
    let jam_cal: Vec<f64> = cal_tl.iter().filter_map(|e| e.jam_ind).collect();
    let fixes_cal: Vec<ReportedFix> = cal_tl.iter().filter_map(|e| e.fix).collect();
    let fix_ref = fixes_cal.first().map(|f0| {
        let n = fixes_cal.len() as f64;
        let lat = fixes_cal.iter().map(|f| f.lat_deg).sum::<f64>() / n;
        // Longitudes relative to the first so a log across the antimeridian averages right.
        let dlon = fixes_cal
            .iter()
            .map(|f| (f.lon_deg - f0.lon_deg + 540.0).rem_euclid(360.0) - 180.0)
            .sum::<f64>()
            / n;
        let h = fixes_cal.iter().map(|f| f.height_m).sum::<f64>() / n;
        (lat, f0.lon_deg + dlon, h)
    });
    let baseline = Baseline {
        calibration_epochs,
        cn0_median_dbhz: median(&all_cn0),
        tracked_median: median(&tracked),
        agc_mean,
        agc_sd,
        jam_ind_median: median(&jam_cal),
        clock_bound_ns,
    };

    // Which monitors have data (and, where they need one, a baseline).
    let has_cn0 = tl.epochs.iter().any(|e| !e.cn0.is_empty());
    let has_jam = tl.epochs.iter().any(|e| e.jam_ind.is_some());
    let mut run_set = BTreeSet::new();
    if has_cn0 && !key_median.is_empty() {
        run_set.insert(Monitor::Cn0Drop);
    }
    if has_cn0 && baseline.tracked_median.is_some() {
        run_set.insert(Monitor::LossOfLock);
    }
    if agc_mean.is_some() {
        run_set.insert(Monitor::Agc);
    }
    if has_jam {
        run_set.insert(Monitor::JamInd);
    }
    if fix_ref.is_some() {
        run_set.insert(Monitor::PositionJump);
    }
    if engine.is_some() {
        run_set.insert(Monitor::Raim);
        run_set.insert(Monitor::SolveFailure);
        if clock_bound_ns.is_some() {
            run_set.insert(Monitor::Clock);
        }
    }

    // Per-epoch statistics, decisions and alarms.
    let mut epochs = Vec::with_capacity(slots.len());
    let mut decided: Vec<BTreeSet<Monitor>> = Vec::with_capacity(slots.len());
    for s in &slots {
        let post = s.t_s >= cal_s;
        let mut alarms = BTreeSet::new();
        let mut dec = BTreeSet::new();
        let mut et = EpochTrust {
            t_s: s.t_s,
            n_sats: 0,
            cn0_mean_dbhz: None,
            cn0_drop_db: None,
            agc: None,
            agc_z: None,
            jam_ind: None,
            position_offset_m: None,
            raim_stat: None,
            raim_thr: None,
            clock_innov_ns: None,
            clock_bound_ns: None,
            alarms: Vec::new(),
            state: TrustState::Calibrating,
        };
        let mut decide = |m: Monitor, alarm: bool, alarms: &mut BTreeSet<Monitor>| {
            if post && run_set.contains(&m) {
                dec.insert(m);
                if alarm {
                    alarms.insert(m);
                }
            }
        };
        if let Some(i) = s.tl {
            let e = &tl.epochs[i];
            et.n_sats = distinct_sats(e);
            et.cn0_mean_dbhz = mean(&e.cn0.iter().map(|c| c.cn0_dbhz).collect::<Vec<_>>());
            let diffs: Vec<f64> = e
                .cn0
                .iter()
                .filter_map(|c| {
                    key_median
                        .get(&(c.sat.clone(), c.band.clone()))
                        .map(|b| b - c.cn0_dbhz)
                })
                .collect();
            if diffs.len() >= cfg.cn0_min_sats {
                let d = mean(&diffs).unwrap_or(0.0);
                et.cn0_drop_db = Some(d);
                decide(Monitor::Cn0Drop, d >= cfg.cn0_drop_db, &mut alarms);
            }
            if let Some(med) = baseline.tracked_median {
                if tracks_satellites(e) {
                    let lost = med - et.n_sats as f64;
                    decide(
                        Monitor::LossOfLock,
                        lost >= cfg.sats_lost as f64,
                        &mut alarms,
                    );
                }
            }
            et.agc = e.agc;
            if let (Some(a), Some(m), Some(sd)) = (e.agc, agc_mean, agc_sd) {
                let z = (a - m) / sd;
                et.agc_z = Some(z);
                decide(Monitor::Agc, z.abs() > cfg.agc_k_sigma, &mut alarms);
            }
            et.jam_ind = e.jam_ind;
            if let Some(j) = e.jam_ind {
                decide(Monitor::JamInd, j > cfg.jam_ind_threshold, &mut alarms);
            }
            if let (Some(f), Some(r)) = (e.fix, fix_ref) {
                let off = horizontal_offset_m(r, &f);
                et.position_offset_m = Some(off);
                decide(
                    Monitor::PositionJump,
                    off > cfg.position_jump_m,
                    &mut alarms,
                );
            }
        }
        if let Some(j) = s.en {
            let e = &en[j];
            et.raim_stat = e.raim_stat;
            et.raim_thr = e.raim_thr;
            if e.raim_stat.is_some() {
                decide(Monitor::Raim, e.raim_alarm, &mut alarms);
            }
            decide(Monitor::SolveFailure, e.solve_failure, &mut alarms);
            et.clock_innov_ns = e.clock_innov_s.map(|x| x * 1e9);
            if e.clock_decided {
                et.clock_bound_ns = clock_bound_ns;
                decide(Monitor::Clock, e.clock_alarm, &mut alarms);
            }
        }
        if post {
            let fix_alarm = alarms.iter().any(|m| {
                matches!(
                    m,
                    Monitor::Raim | Monitor::Clock | Monitor::SolveFailure | Monitor::PositionJump
                )
            });
            let severe_cn0 = run_set.contains(&Monitor::Cn0Drop)
                && et.cn0_drop_db.is_some_and(|d| d >= 2.0 * cfg.cn0_drop_db);
            et.state = if fix_alarm || severe_cn0 {
                TrustState::Untrusted
            } else if !alarms.is_empty() {
                TrustState::Degraded
            } else {
                TrustState::Nominal
            };
        }
        et.alarms = alarms.into_iter().collect();
        epochs.push(et);
        decided.push(dec);
    }

    let runs = alarm_runs(&run_set, &epochs, &decided);
    let first_alarm_s = epochs
        .iter()
        .find(|e| e.t_s >= cal_s && !e.alarms.is_empty())
        .map(|e| e.t_s);
    Ok(TrustResult {
        monitors_run: run_set.into_iter().collect(),
        baseline,
        epochs,
        runs,
        first_alarm_s,
    })
}

/// Contiguous alarm runs per monitor over that monitor's own decisions. A decision without
/// the alarm, or a gap wider than [`RUN_GAP_FACTOR`] times the monitor's median decision
/// spacing, closes the run.
fn alarm_runs(
    run_set: &BTreeSet<Monitor>,
    epochs: &[EpochTrust],
    decided: &[BTreeSet<Monitor>],
) -> Vec<AlarmRun> {
    let mut runs = Vec::new();
    for &m in run_set {
        let pts: Vec<(f64, bool)> = epochs
            .iter()
            .zip(decided)
            .filter(|(_, d)| d.contains(&m))
            .map(|(e, _)| (e.t_s, e.alarms.contains(&m)))
            .collect();
        let spacing = median(&pts.windows(2).map(|w| w[1].0 - w[0].0).collect::<Vec<_>>());
        let gap_limit = spacing.map_or(f64::INFINITY, |s| RUN_GAP_FACTOR * s);
        let mut cur: Option<AlarmRun> = None;
        let mut prev_t: Option<f64> = None;
        for &(t, alarm) in &pts {
            let contiguous = prev_t.is_some_and(|p| t - p <= gap_limit);
            if alarm {
                match cur.as_mut() {
                    Some(r) if contiguous => {
                        r.end_s = t;
                        r.epochs += 1;
                    }
                    _ => {
                        if let Some(r) = cur.take() {
                            runs.push(r);
                        }
                        cur = Some(AlarmRun {
                            monitor: m,
                            start_s: t,
                            end_s: t,
                            epochs: 1,
                        });
                    }
                }
            } else if let Some(r) = cur.take() {
                runs.push(r);
            }
            prev_t = Some(t);
        }
        if let Some(r) = cur {
            runs.push(r);
        }
    }
    runs.sort_by(|a, b| {
        a.start_s
            .total_cmp(&b.start_s)
            .then(a.monitor.cmp(&b.monitor))
    });
    runs
}

#[cfg(test)]
mod tests {
    use super::super::SatCn0;
    use super::*;

    const LAT: f64 = 69.29;
    const LON: f64 = 16.03;

    /// A 1 Hz epoch with `n` GPS satellites at a per-satellite C/N0 of
    /// `40 + (k mod 5) - drop(k)` dB-Hz.
    fn epoch(t: f64, n: usize, drop: impl Fn(usize) -> f64) -> LogEpoch {
        LogEpoch {
            t_s: t,
            cn0: (0..n)
                .map(|k| SatCn0 {
                    sat: format!("G{:02}", k + 1),
                    band: "L1".into(),
                    cn0_dbhz: 40.0 + (k % 5) as f64 - drop(k),
                })
                .collect(),
            ..Default::default()
        }
    }

    fn timeline(epochs: Vec<LogEpoch>) -> Timeline {
        let mut obs = BTreeSet::new();
        for e in &epochs {
            if !e.cn0.is_empty() {
                obs.insert("cn0");
            }
            if e.agc.is_some() {
                obs.insert("agc");
            }
            if e.jam_ind.is_some() {
                obs.insert("jam_ind");
            }
            if e.fix.is_some() {
                obs.insert("fix");
            }
        }
        Timeline {
            epochs,
            start_label: None,
            observables: obs.into_iter().map(String::from).collect(),
            skipped_records: 0,
        }
    }

    fn fix(north_m: f64) -> ReportedFix {
        ReportedFix {
            lat_deg: LAT + north_m / 111_200.0,
            lon_deg: LON,
            height_m: 50.0,
            n_used: Some(8),
        }
    }

    /// A clean 240 s log: 8 satellites, AGC, jamming indicator and a static fix, with
    /// small deterministic wobbles.
    fn clean(t: usize) -> LogEpoch {
        let mut e = epoch(t as f64, 8, |k| 0.3 * (((t + k) % 3) as f64 - 1.0));
        e.agc = Some(3000.0 + ((t % 7) as f64 - 3.0) * 2.0);
        e.jam_ind = Some(10.0 + (t % 4) as f64);
        e.fix = Some(fix(((t % 5) as f64 - 2.0) * 0.8));
        e
    }

    fn state_at(r: &TrustResult, t: f64) -> TrustState {
        r.epochs.iter().find(|e| e.t_s == t).unwrap().state
    }

    fn runs_of(r: &TrustResult, m: Monitor) -> Vec<&AlarmRun> {
        r.runs.iter().filter(|x| x.monitor == m).collect()
    }

    #[test]
    fn clean_log_raises_no_alarm() {
        let tl = timeline((0..240).map(clean).collect());
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        assert!(r.runs.is_empty(), "{:?}", r.runs);
        assert_eq!(r.first_alarm_s, None);
        assert_eq!(r.baseline.calibration_epochs, 60);
        assert_eq!(r.baseline.tracked_median, Some(8.0));
        for e in &r.epochs {
            let want = if e.t_s < 60.0 {
                TrustState::Calibrating
            } else {
                TrustState::Nominal
            };
            assert_eq!(e.state, want, "t = {}", e.t_s);
            assert!(e.alarms.is_empty());
        }
        assert_eq!(
            r.monitors_run,
            vec![
                Monitor::Cn0Drop,
                Monitor::Agc,
                Monitor::JamInd,
                Monitor::LossOfLock,
                Monitor::PositionJump
            ]
        );
    }

    #[test]
    fn cn0_drop_degrades_then_untrusts() {
        let tl = timeline(
            (0..240)
                .map(|t| {
                    let d = if t >= 180 {
                        20.0
                    } else if t >= 120 {
                        10.0
                    } else {
                        0.0
                    };
                    epoch(t as f64, 8, |k| if k < 6 { d } else { 0.0 })
                })
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let runs = runs_of(&r, Monitor::Cn0Drop);
        assert_eq!(runs.len(), 1, "{runs:?}");
        assert_eq!(runs[0].start_s, 120.0);
        assert_eq!(runs[0].end_s, 239.0);
        assert_eq!(runs[0].epochs, 120);
        assert_eq!(r.first_alarm_s, Some(120.0));
        assert_eq!(state_at(&r, 119.0), TrustState::Nominal);
        assert_eq!(state_at(&r, 150.0), TrustState::Degraded);
        assert_eq!(state_at(&r, 200.0), TrustState::Untrusted);
        let e = r.epochs.iter().find(|e| e.t_s == 150.0).unwrap();
        assert!((e.cn0_drop_db.unwrap() - 7.5).abs() < 1e-9);
    }

    #[test]
    fn agc_step_raises_agc() {
        let tl = timeline(
            (0..240)
                .map(|t| {
                    let mut e = clean(t);
                    if t >= 150 {
                        e.agc = Some(2400.0);
                    }
                    e
                })
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let runs = runs_of(&r, Monitor::Agc);
        assert_eq!(runs.len(), 1);
        assert_eq!(runs[0].start_s, 150.0);
        assert_eq!(r.first_alarm_s, Some(150.0));
        assert_eq!(state_at(&r, 160.0), TrustState::Degraded);
        // Floored at 1 % of the mean (30 counts), above the raw scatter.
        assert!((r.baseline.agc_sd.unwrap() - 30.0).abs() < 1.0);
    }

    #[test]
    fn jam_indicator_raises_jam_ind() {
        let tl = timeline(
            (0..240)
                .map(|t| {
                    let mut e = clean(t);
                    if (130..170).contains(&t) {
                        e.jam_ind = Some(200.0);
                    }
                    e
                })
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let runs = runs_of(&r, Monitor::JamInd);
        assert_eq!(runs.len(), 1);
        assert_eq!(
            (runs[0].start_s, runs[0].end_s, runs[0].epochs),
            (130.0, 169.0, 40)
        );
        assert_eq!(state_at(&r, 140.0), TrustState::Degraded);
        assert_eq!(state_at(&r, 200.0), TrustState::Nominal);
    }

    #[test]
    fn lost_satellites_raise_loss_of_lock() {
        let tl = timeline(
            (0..240)
                .map(|t| epoch(t as f64, if t >= 100 { 4 } else { 10 }, |_| 0.0))
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        assert_eq!(r.baseline.tracked_median, Some(10.0));
        let runs = runs_of(&r, Monitor::LossOfLock);
        assert_eq!(runs.len(), 1);
        assert_eq!(runs[0].start_s, 100.0);
        assert!(runs_of(&r, Monitor::Cn0Drop).is_empty());
        assert_eq!(state_at(&r, 120.0), TrustState::Degraded);
    }

    #[test]
    fn position_jump_is_untrusted() {
        let tl = timeline(
            (0..240)
                .map(|t| {
                    let mut e = clean(t);
                    if t >= 140 {
                        e.fix = Some(fix(500.0));
                    }
                    e
                })
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let runs = runs_of(&r, Monitor::PositionJump);
        assert_eq!(runs.len(), 1);
        assert_eq!(runs[0].start_s, 140.0);
        assert_eq!(state_at(&r, 150.0), TrustState::Untrusted);
        let off = r
            .epochs
            .iter()
            .find(|e| e.t_s == 150.0)
            .unwrap()
            .position_offset_m
            .unwrap();
        assert!((off - 500.0).abs() < 5.0, "{off}");
    }

    #[test]
    fn short_log_is_an_error() {
        let tl = timeline((0..2).map(clean).collect());
        let err = run_monitors(&tl, None, &MonitorConfig::default()).unwrap_err();
        assert!(err.contains("shorter than the calibration window"), "{err}");
    }

    #[test]
    fn monitors_run_lists_only_present_observables() {
        // C/N0 only (as from RINEX observations without navigation): no AGC, jamming
        // indicator, position or engine monitors.
        let tl = timeline((0..120).map(|t| epoch(t as f64, 8, |_| 0.0)).collect());
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        assert_eq!(r.monitors_run, vec![Monitor::Cn0Drop, Monitor::LossOfLock]);
        assert_eq!(r.baseline.agc_mean, None);
        assert_eq!(r.baseline.clock_bound_ns, None);
        assert!(r.epochs.iter().all(|e| e.agc_z.is_none()));
    }

    #[test]
    fn missing_epoch_splits_a_run() {
        let tl = timeline(
            (0..240)
                .filter(|&t| t != 150)
                .map(|t| {
                    let mut e = clean(t);
                    if t >= 140 {
                        e.jam_ind = Some(200.0);
                    }
                    e
                })
                .collect(),
        );
        let r = run_monitors(&tl, None, &MonitorConfig::default()).unwrap();
        let runs = runs_of(&r, Monitor::JamInd);
        assert_eq!(runs.len(), 2);
        assert_eq!((runs[0].start_s, runs[0].end_s), (140.0, 149.0));
        assert_eq!(runs[1].start_s, 151.0);
    }

    #[test]
    fn config_round_trips_and_rejects_unknown_fields() {
        let cfg: MonitorConfig = serde_json::from_str(r#"{"cn0_drop_db": 8.0}"#).unwrap();
        assert_eq!(cfg.cn0_drop_db, 8.0);
        assert_eq!(cfg.calibration_s, 60.0);
        assert!(serde_json::from_str::<MonitorConfig>(r#"{"bogus": 1}"#).is_err());
        let bad = MonitorConfig {
            raim_pfa: 0.0,
            ..Default::default()
        };
        assert!(bad.validate().is_err());
    }
}
