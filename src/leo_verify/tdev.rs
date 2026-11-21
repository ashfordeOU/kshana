// SPDX-License-Identifier: AGPL-3.0-only
//! Holdover TDEV predictor: the time deviation (TDEV) an oscillator's datasheet Allan deviation
//! implies, term by term, so a timing designer can see which noise sets the holdover wander at each
//! observation interval.
//!
//! With the power-law levels of [`crate::slot_timing::ClockNoise`] (Allan variance
//! `σ_y²(τ) = q_wf/τ + h_F + q_rw τ/3`) and a linear fractional-frequency drift `D` (the datasheet
//! ageing per day over 86 400 s), the prediction is `TDEV²(τ) = (τ²/3) · Mod σ_y²(τ)` with
//!
//! `Mod σ_y²(τ) = R_W q_wf/τ + R_F h_F + R_RW q_rw τ/3 + D² τ²/2`,
//!
//! where `R_W = 1/2`, `R_F = 0.6747` and `R_RW = 33/40` are the large-averaging-factor ratios of the
//! modified to the normal Allan variance for white, flicker and random-walk frequency noise (Riley,
//! NIST SP 1065, section 5.2.5; the flicker figure is this module's numerical evaluation of the two
//! transfer functions at an averaging factor of 64) and the drift term is the modified Allan variance
//! of a quadratic phase, which averaging leaves unchanged.
//!
//! With `simulate` set, a phase record of the same white and random-walk frequency noise is generated
//! from a seeded generator and its TDEV is computed with [`crate::allan::time_deviation`]; the report
//! gives the ratio at each interval. The acceptance test of the backlog item ("TDEV prediction matches
//! the analytic model") is that comparison (tests below and in `tests/leo_verify.rs`).
//!
//! MODELLED. The prediction is a model of the datasheet figures, which are maxima, not a measurement.

use super::burst::clock_noise;
use super::{field_err, list_len, positive, work_limit};
use crate::oscillator::ClockRef;
use crate::portable_distr::{Distribution, Normal};
use crate::telecom_timing::{check_curve, mask_by_id, CheckResult, CurvePoint};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};

/// Modified-to-normal Allan variance ratio for white frequency noise.
pub const MOD_RATIO_WHITE_FM: f64 = 0.5;
/// Modified-to-normal Allan variance ratio for flicker frequency noise (large averaging factor).
pub const MOD_RATIO_FLICKER_FM: f64 = 0.6747;
/// Modified-to-normal Allan variance ratio for random-walk frequency noise (33/40).
pub const MOD_RATIO_RW_FM: f64 = 0.825;

/// A seeded simulation of the same noise model, for the comparison.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SimulateCfg {
    /// Sample interval (s).
    #[serde(default = "d_tau0")]
    pub tau0_s: f64,
    /// Number of phase samples.
    pub samples: usize,
    /// Seed.
    #[serde(default)]
    pub seed: u64,
}

fn d_tau0() -> f64 {
    1.0
}
fn d_true() -> bool {
    true
}

/// Input of `kshana leo-verify holdover-tdev`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TdevInput {
    /// The oscillator: a preset id or a datasheet.
    pub clock: ClockRef,
    /// Observation intervals (s); default 1 s to 100 000 s in a 1-2-5 sequence.
    #[serde(default)]
    pub taus_s: Vec<f64>,
    /// Include the ageing drift term.
    #[serde(default = "d_true")]
    pub include_drift: bool,
    /// A telecom-timing mask id whose TDEV mask the prediction is compared with.
    #[serde(default)]
    pub mask: Option<String>,
    /// A simulated record of the white and random-walk terms to compare with.
    #[serde(default)]
    pub simulate: Option<SimulateCfg>,
}

/// One row of the prediction.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TdevRow {
    /// Observation interval (s).
    pub tau_s: f64,
    /// Predicted TDEV, all terms (ns).
    pub tdev_ns: f64,
    /// Contribution of white frequency noise alone (ns).
    pub white_fm_ns: f64,
    /// Contribution of flicker frequency noise alone (ns).
    pub flicker_fm_ns: f64,
    /// Contribution of random-walk frequency noise alone (ns).
    pub random_walk_fm_ns: f64,
    /// Contribution of the ageing drift alone (ns).
    pub drift_ns: f64,
    /// The term with the largest contribution.
    pub dominant: &'static str,
    /// Predicted TDEV of the white and random-walk terms only, the model the simulation draws (ns).
    pub simulated_model_ns: f64,
    /// TDEV of the simulated record (ns), when simulated, at an averaging factor of at least four
    /// and supported by the record length.
    pub simulated_ns: Option<f64>,
    /// Simulated over predicted (white and random-walk terms), when simulated.
    pub simulated_ratio: Option<f64>,
}

/// Report of `kshana leo-verify holdover-tdev`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct TdevReport {
    /// The oscillator.
    pub clock: String,
    /// Where its figures come from.
    pub clock_source: String,
    /// The levels used: `q_wf` (s), the flicker floor, `q_rw` (1/s) and the drift (1/s).
    pub q_wf_s: f64,
    /// Flicker floor (Allan variance).
    pub flicker: f64,
    /// Random-walk level (1/s).
    pub q_rw_per_s: f64,
    /// Linear fractional-frequency drift used (1/s); zero when excluded.
    pub drift_per_s: f64,
    /// The prediction.
    pub rows: Vec<TdevRow>,
    /// The mask comparison, when a mask was named.
    pub mask_check: Option<CheckResult>,
    /// Largest |ratio − 1| over the simulated rows, when simulated.
    pub simulated_worst_deviation: Option<f64>,
}

/// The four TDEV contributions (s) at `tau_s`: white FM, flicker FM, random-walk FM and drift.
pub fn tdev_terms_s(q_wf: f64, flicker: f64, q_rw: f64, drift: f64, tau_s: f64) -> [f64; 4] {
    let k = tau_s * tau_s / 3.0;
    [
        (k * MOD_RATIO_WHITE_FM * q_wf / tau_s).max(0.0).sqrt(),
        (k * MOD_RATIO_FLICKER_FM * flicker).max(0.0).sqrt(),
        (k * MOD_RATIO_RW_FM * q_rw * tau_s / 3.0).max(0.0).sqrt(),
        (k * drift * drift * tau_s * tau_s / 2.0).max(0.0).sqrt(),
    ]
}

/// A phase record (s) of white and random-walk frequency noise with levels `q_wf` and `q_rw`.
pub fn simulate_phase(q_wf: f64, q_rw: f64, tau0: f64, n: usize, seed: u64) -> Vec<f64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let Ok(n01) = Normal::new(0.0, 1.0) else {
        return Vec::new();
    };
    let (sw, sr) = ((q_wf / tau0).max(0.0).sqrt(), (q_rw * tau0).max(0.0).sqrt());
    let (mut x, mut rw) = (0.0_f64, 0.0_f64);
    let mut out = Vec::with_capacity(n);
    for _ in 0..n {
        out.push(x);
        let y = sw * n01.sample(&mut rng) + rw;
        rw += sr * n01.sample(&mut rng);
        x += y * tau0;
    }
    out
}

fn default_taus() -> Vec<f64> {
    let mut v = Vec::new();
    let mut dec = 1.0;
    while dec <= 1.0e5 {
        for m in [1.0, 2.0, 5.0] {
            if m * dec <= 1.0e5 {
                v.push(m * dec);
            }
        }
        dec *= 10.0;
    }
    v
}

/// Run the predictor.
pub fn run(inp: &TdevInput) -> Result<TdevReport, String> {
    let taus = if inp.taus_s.is_empty() {
        default_taus()
    } else {
        list_len("taus_s", inp.taus_s.len(), 1000)?;
        for &t in &inp.taus_s {
            positive("taus_s", t)?;
        }
        inp.taus_s.clone()
    };
    let mask = match &inp.mask {
        Some(id) => Some(mask_by_id(id).ok_or_else(|| {
            crate::terr!("e-leo-verify-unknown-id", field = "mask", id = id.as_str())
        })?),
        None => None,
    };
    let (spec, noise) = clock_noise(&inp.clock)?;
    let drift = if inp.include_drift {
        noise.aging_per_day / 86_400.0
    } else {
        0.0
    };
    let sim = match &inp.simulate {
        Some(s) => {
            positive("simulate.tau0_s", s.tau0_s)?;
            if s.samples < 64 {
                return Err(field_err("simulate.samples", s.samples as f64));
            }
            work_limit(s.samples as f64, 2.0e6)?;
            Some((
                s.tau0_s,
                simulate_phase(noise.q_wf, noise.q_rw, s.tau0_s, s.samples, s.seed),
            ))
        }
        None => None,
    };
    let mut rows = Vec::with_capacity(taus.len());
    let mut worst: Option<f64> = None;
    for &tau in &taus {
        let t = tdev_terms_s(noise.q_wf, noise.flicker, noise.q_rw, drift, tau);
        let total = t.iter().map(|v| v * v).sum::<f64>().sqrt();
        let model = (t[0] * t[0] + t[2] * t[2]).sqrt();
        let names = ["white_fm", "flicker_fm", "random_walk_fm", "drift"];
        let dom = (0..4).max_by(|&a, &b| t[a].total_cmp(&t[b])).unwrap_or(0);
        let simulated = sim.as_ref().and_then(|(tau0, x)| {
            let m = (tau / tau0).round();
            // The ratios are asymptotic in the averaging factor, so the comparison starts at four
            // samples; twelve intervals of record per point, as the telecom-timing curves require.
            if m < 4.0 || (m * tau0 - tau).abs() > 1e-9 * tau || x.len() < (12.0 * m) as usize {
                return None;
            }
            Some(crate::allan::time_deviation(x, *tau0, m as usize))
        });
        let ratio = simulated.filter(|_| model > 0.0).map(|s| s / model);
        if let Some(r) = ratio {
            let d = (r - 1.0).abs();
            worst = Some(worst.map_or(d, |w: f64| w.max(d)));
        }
        rows.push(TdevRow {
            tau_s: tau,
            tdev_ns: total * 1e9,
            white_fm_ns: t[0] * 1e9,
            flicker_fm_ns: t[1] * 1e9,
            random_walk_fm_ns: t[2] * 1e9,
            drift_ns: t[3] * 1e9,
            dominant: names[dom],
            simulated_model_ns: model * 1e9,
            simulated_ns: simulated.map(|s| s * 1e9),
            simulated_ratio: ratio,
        });
    }
    let mask_check = mask.and_then(|m| m.tdev.as_ref()).map(|curve| {
        let pts: Vec<CurvePoint> = rows
            .iter()
            .map(|r| CurvePoint {
                tau_s: r.tau_s,
                value_ns: r.tdev_ns,
            })
            .collect();
        check_curve("tdev", &pts, curve)
    });
    Ok(TdevReport {
        clock: spec.id,
        clock_source: spec.source,
        q_wf_s: noise.q_wf,
        flicker: noise.flicker,
        q_rw_per_s: noise.q_rw,
        drift_per_s: drift,
        rows,
        mask_check,
        simulated_worst_deviation: worst,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn white_fm_tdev_follows_the_closed_form() {
        // White FM only: TDEV² = τ q_wf / 6.
        let t = tdev_terms_s(1e-22, 0.0, 0.0, 0.0, 100.0);
        assert!((t[0] - (100.0 * 1e-22 / 6.0_f64).sqrt()).abs() < 1e-20);
    }

    #[test]
    fn a_simulated_record_matches_the_prediction() {
        let (qwf, qrw) = (1e-22, 1e-26);
        let x = simulate_phase(qwf, qrw, 1.0, 200_000, 7);
        for m in [4usize, 16, 64, 256, 1024] {
            let tau = m as f64;
            let t = tdev_terms_s(qwf, 0.0, qrw, 0.0, tau);
            let model = (t[0] * t[0] + t[2] * t[2]).sqrt();
            let sim = crate::allan::time_deviation(&x, 1.0, m);
            let r = sim / model;
            assert!((0.8..1.2).contains(&r), "m={m} ratio={r}");
        }
    }
}
