// SPDX-License-Identifier: AGPL-3.0-only
//! LEO-assisted time transfer to Coordinated Universal Time (UTC).
//!
//! A timing receiver at a known position recovers its clock offset from each LEO satellite in
//! view: with the geometry known, one pseudorange is one clock measurement of one-sigma
//! `σ_ρ / c`, and the satellites in view at an epoch combine by inverse-variance weighting.
//! Between passes the receiver's own oscillator holds the time. The pack runs a two-state
//! (phase, frequency) Kalman filter on those measurements with the oscillator's process noise
//! taken from the engine's clock models ([`crate::slot_timing::ClockNoise`], the same levels
//! the `slot-timing` kind and the `clock_state` classes use): white frequency noise `q_wf`
//! and random-walk frequency noise `q_rw` give the phase variance `q_wf t + q_rw t³/3` over a
//! coast, the same expression as [`crate::holdover::coast_phase_variance`]. The truth clock is
//! simulated from the same levels with a seeded generator, so the filter is consistent by
//! construction; flicker frequency noise is not simulated.
//!
//! The receiver's time scale is then the LEO system time. UTC follows from the broadcast
//! system-time-to-UTC offset, evaluated as in IS-GPS-200 section 20.3.3.5.2.4:
//! `Δt_UTC = Δt_LS + A0 + A1 (t_E − t_ot + 604800 (WN − WN_t))`, `t_UTC = t_E − Δt_UTC`
//! ([`utc_offset_s`]). The uncertainty of the broadcast offset is a constant bias per run
//! (it is not observable from the satellites) and is added to the time error.
//!
//! ## Label
//!
//! MODELLED. The offset formula is the published one; the error budget (loop noise at C/N0,
//! range error, oscillator levels, UTC-offset uncertainty) is a model. The NIST figure for
//! Iridium timing receivers (under 40 ns from UTC(NIST) with a miniature atomic clock) is a
//! comparison, not a reproduction of that test.

use crate::slot_timing::ClockNoise;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

/// Seconds in a GPS-style week.
pub const WEEK_S: f64 = 604_800.0;

/// Broadcast system-time-to-UTC parameters (the IS-GPS-200 set).
#[derive(Clone, Copy, Debug, Default, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct UtcParams {
    /// Constant term `A0` (s).
    #[serde(default)]
    pub a0_s: f64,
    /// First-order term `A1` (s/s).
    #[serde(default)]
    pub a1_s_per_s: f64,
    /// Reference time of week `t_ot` (s).
    #[serde(default)]
    pub t_ot_s: f64,
    /// Reference week `WN_t`.
    #[serde(default)]
    pub wn_t: i64,
    /// Leap seconds `Δt_LS` (s).
    #[serde(default)]
    pub delta_t_ls_s: f64,
    /// One-sigma uncertainty of the broadcast offset (s).
    #[serde(default)]
    pub sigma_s: f64,
}

/// `Δt_UTC` (s) at system time of week `t_e` in week `wn`.
pub fn utc_offset_s(p: &UtcParams, t_e: f64, wn: i64) -> f64 {
    p.delta_t_ls_s + p.a0_s + p.a1_s_per_s * (t_e - p.t_ot_s + WEEK_S * (wn - p.wn_t) as f64)
}

/// UTC time of week (s, modulo a day as IS-GPS-200 states it) for system time `t_e`, week
/// `wn`.
pub fn system_to_utc_s(p: &UtcParams, t_e: f64, wn: i64) -> f64 {
    (t_e - utc_offset_s(p, t_e, wn)).rem_euclid(86_400.0)
}

/// Statistics of one simulated time-transfer run.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TimeTransferStats {
    /// Root-mean-square time error against UTC over the run after the first fix (s).
    pub rms_s: f64,
    /// 95th percentile of the absolute time error (s).
    pub p95_s: f64,
    /// Largest absolute time error (s).
    pub max_abs_s: f64,
    /// Median of the filter's predicted one-sigma, UTC-offset term included (s).
    pub median_predicted_sigma_s: f64,
    /// Largest predicted one-sigma (s).
    pub max_predicted_sigma_s: f64,
    /// Fraction of epochs with a satellite in view.
    pub fraction_in_view: f64,
    /// Longest interval without a satellite (s).
    pub longest_gap_s: f64,
    /// Root-mean-square of the error over its predicted sigma (near 1 when consistent).
    pub rms_normalised: f64,
}

/// One epoch of a time-transfer run, after the first fix.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct TimeTransferEpoch {
    /// Seconds after the start of the run.
    pub t_s: f64,
    /// Time error against UTC (ns), the UTC-offset error included.
    pub error_ns: f64,
    /// The filter's predicted one-sigma, UTC-offset term included (ns).
    pub sigma_ns: f64,
    /// Whether a satellite was in view at this epoch.
    pub in_view: bool,
}

/// Simulate LEO time transfer over epochs spaced `dt` seconds. `meas_sigma_s[k]` is the
/// combined clock-measurement one-sigma at epoch `k` (`None` when no satellite is in view).
pub fn simulate(
    meas_sigma_s: &[Option<f64>],
    dt: f64,
    clock: &ClockNoise,
    sigma_utc_s: f64,
    seed: u64,
) -> Result<TimeTransferStats, String> {
    simulate_traced(meas_sigma_s, dt, clock, sigma_utc_s, seed).map(|(s, _)| s)
}

/// [`simulate`], also returning the time error and predicted sigma at every epoch from the
/// first fix on. The random draws are the same, so the statistics are identical.
pub fn simulate_traced(
    meas_sigma_s: &[Option<f64>],
    dt: f64,
    clock: &ClockNoise,
    sigma_utc_s: f64,
    seed: u64,
) -> Result<(TimeTransferStats, Vec<TimeTransferEpoch>), String> {
    if !(dt.is_finite() && dt > 0.0) {
        return Err("the epoch spacing must be positive".into());
    }
    if meas_sigma_s.is_empty() {
        return Err("no epochs".into());
    }
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let n01 = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
    let (qwf, qrw) = (clock.q_wf, clock.q_rw);
    // Process noise of [phase, frequency] over one step (van Loan for white and random-walk FM).
    let q11 = qwf * dt + qrw * dt.powi(3) / 3.0;
    let q12 = qrw * dt * dt / 2.0;
    let q22 = qrw * dt;
    // Cholesky factor of Q for the truth simulation.
    let l11 = q11.max(0.0).sqrt();
    let l21 = if l11 > 0.0 { q12 / l11 } else { 0.0 };
    let l22 = (q22 - l21 * l21).max(0.0).sqrt();
    let utc_bias = sigma_utc_s * n01.sample(&mut rng);
    // Truth starts at an unknown phase and a frequency offset of 1e-9 (a free-running
    // oscillator); the filter starts with a diffuse phase and that frequency uncertainty.
    let mut truth = [1.0e-3 * n01.sample(&mut rng), 1.0e-9 * n01.sample(&mut rng)];
    let mut x = [0.0, 0.0];
    let mut p = [[1.0, 0.0], [0.0, 1.0e-18]];
    let mut started = false;
    let mut errs = Vec::new();
    let mut sig = Vec::new();
    let mut norm_sq = Vec::new();
    let mut trace = Vec::new();
    let (mut in_view, mut gap, mut longest_gap) = (0usize, 0.0_f64, 0.0_f64);
    for (k, m) in meas_sigma_s.iter().enumerate() {
        if k > 0 {
            let (w1, w2) = (n01.sample(&mut rng), n01.sample(&mut rng));
            truth = [
                truth[0] + truth[1] * dt + l11 * w1,
                truth[1] + l21 * w1 + l22 * w2,
            ];
            x = [x[0] + x[1] * dt, x[1]];
            let p00 = p[0][0] + 2.0 * dt * p[0][1] + dt * dt * p[1][1] + q11;
            let p01 = p[0][1] + dt * p[1][1] + q12;
            let p11 = p[1][1] + q22;
            p = [[p00, p01], [p01, p11]];
        }
        match m {
            Some(s) if s.is_finite() && *s > 0.0 => {
                in_view += 1;
                gap = 0.0;
                let z = truth[0] + s * n01.sample(&mut rng);
                let r = s * s;
                let sv = p[0][0] + r;
                let (k0, k1) = (p[0][0] / sv, p[0][1] / sv);
                let y = z - x[0];
                x = [x[0] + k0 * y, x[1] + k1 * y];
                p = [
                    [(1.0 - k0) * p[0][0], (1.0 - k0) * p[0][1]],
                    [(1.0 - k0) * p[0][1], p[1][1] - k1 * p[0][1]],
                ];
                started = true;
            }
            _ => {
                gap += dt;
                longest_gap = longest_gap.max(gap);
            }
        }
        if started {
            let e = truth[0] - x[0] + utc_bias;
            let s = (p[0][0].max(0.0) + sigma_utc_s * sigma_utc_s).sqrt();
            trace.push(TimeTransferEpoch {
                t_s: k as f64 * dt,
                error_ns: e * 1e9,
                sigma_ns: s * 1e9,
                in_view: m.is_some_and(|s| s.is_finite() && s > 0.0),
            });
            errs.push(e);
            sig.push(s);
            if s > 0.0 {
                norm_sq.push((e / s).powi(2));
            }
        }
    }
    if errs.is_empty() {
        return Err("no satellite was ever in view: the receiver never acquired time".into());
    }
    let mut abs: Vec<f64> = errs.iter().map(|e| e.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let p95 = abs[((abs.len() as f64 * 0.95).ceil() as usize).clamp(1, abs.len()) - 1];
    Ok((
        TimeTransferStats {
            rms_s: super::geom::rms(&errs).unwrap_or(0.0),
            p95_s: p95,
            max_abs_s: *abs.last().unwrap_or(&0.0),
            median_predicted_sigma_s: super::geom::median(sig.clone()).unwrap_or(0.0),
            max_predicted_sigma_s: sig.iter().copied().fold(0.0, f64::max),
            fraction_in_view: in_view as f64 / meas_sigma_s.len() as f64,
            longest_gap_s: longest_gap,
            rms_normalised: (norm_sq.iter().sum::<f64>() / norm_sq.len().max(1) as f64).sqrt(),
        },
        trace,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::clock_state::ClockClass;

    #[test]
    fn the_utc_offset_follows_the_is_gps_200_expression() {
        // By hand: dt_LS = 18 s, A0 = 5 ns, A1 = 1e-14, t_ot = 405504 s, WN_t = 2300; at
        // t_E = 1000 s of week 2301: A1 * (1000 - 405504 + 604800) = 1e-14 * 200296 =
        // 2.00296e-9 s, so dt_UTC = 18 + 5e-9 + 2.00296e-9 s.
        let p = UtcParams {
            a0_s: 5e-9,
            a1_s_per_s: 1e-14,
            t_ot_s: 405_504.0,
            wn_t: 2300,
            delta_t_ls_s: 18.0,
            sigma_s: 0.0,
        };
        let d = utc_offset_s(&p, 1000.0, 2301);
        assert!((d - (18.0 + 5e-9 + 2.00296e-9)).abs() < 1e-15, "{d}");
        let u = system_to_utc_s(&p, 1000.0, 2301);
        assert!((u - (86_400.0 + 1000.0 - d)).abs() < 1e-9 || (u - (1000.0 - d)).abs() < 1e-9);
    }

    #[test]
    fn continuous_tracking_approaches_the_measurement_floor_and_gaps_cost_time() {
        let clock = ClockNoise::from_class(ClockClass::Ocxo);
        let full: Vec<Option<f64>> = vec![Some(10e-9); 600];
        let a = simulate(&full, 1.0, &clock, 0.0, 1).unwrap();
        assert!(a.rms_s < 10e-9, "{}", a.rms_s);
        // One minute in view every 20 minutes: the error between passes grows.
        let gappy: Vec<Option<f64>> = (0..3600)
            .map(|k| if k % 1200 < 60 { Some(10e-9) } else { None })
            .collect();
        let b = simulate(&gappy, 1.0, &clock, 0.0, 1).unwrap();
        assert!(b.max_predicted_sigma_s > a.max_predicted_sigma_s);
        assert!((b.longest_gap_s - 1140.0).abs() < 1e-9);
    }

    #[test]
    fn the_filter_is_consistent_over_seeds() {
        // Mean squared normalised error over 40 seeds within the chi-square band.
        let clock = ClockNoise::from_class(ClockClass::Csac);
        let meas: Vec<Option<f64>> = (0..1800)
            .map(|k| if k % 600 < 200 { Some(20e-9) } else { None })
            .collect();
        let mut sum = 0.0;
        let seeds = 40;
        for s in 0..seeds {
            let r = simulate(&meas, 1.0, &clock, 3e-9, s).unwrap();
            sum += r.rms_normalised.powi(2);
        }
        let mean = sum / seeds as f64;
        assert!((0.6..1.5).contains(&mean), "{mean}");
    }

    #[test]
    fn the_utc_offset_uncertainty_sets_a_floor() {
        let clock = ClockNoise::from_class(ClockClass::Rafs);
        let full: Vec<Option<f64>> = vec![Some(1e-9); 300];
        let r = simulate(&full, 1.0, &clock, 20e-9, 5).unwrap();
        assert!(r.median_predicted_sigma_s >= 20e-9);
    }
}
