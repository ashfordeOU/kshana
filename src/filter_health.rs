// SPDX-License-Identifier: AGPL-3.0-only
//! Kalman filter-consistency health monitoring (NIS / NEES).
//!
//! A Kalman filter is only trustworthy when its reported covariance actually
//! matches the spread of its errors — i.e. it is *consistent*. Two standard tests
//! (Bar-Shalom, *Estimation with Applications to Tracking and Navigation*, §5.4)
//! check this from data:
//!
//! * **NIS** — Normalised Innovation Squared, `ν² / S`. Under a correctly-tuned
//!   filter the (whitened) innovations are independent with `NIS ∼ χ²(n_z)`; for a
//!   scalar phase measurement `n_z = 1`, so `E[NIS] = 1`. NIS uses only observable
//!   quantities, so it is available in deployment.
//! * **NEES** — Normalised Estimation Error Squared, `ẽᵀ P⁻¹ ẽ` with `ẽ = x_true −
//!   x̂`. Under a consistent filter `NEES ∼ χ²(n_x)` (`n_x = 2` here, so `E[NEES] =
//!   2`). NEES needs the truth, so it is a *validation-time* statistic, computed
//!   here from a Monte-Carlo ensemble whose truth is known.
//!
//! The harness below simulates the two-state clock truth with process noise drawn
//! from the true `Q` (the same van-Loan covariance the filter assumes at unit
//! tuning), feeds the filter noisy phase measurements `z = phase_true + N(0, r)`,
//! and pools NIS and NEES across an ensemble of independent seeds. Independence
//! across the ensemble's seeds is what justifies treating the pool as χ²; the mild
//! within-run time-correlation of NEES is the usual, documented approximation.
//!
//! A deliberate **`q_factor`** mis-tunes the filter's process noise relative to the
//! truth (`Q_filter = q_factor · Q_true`): at `q_factor = 1` the filter is matched
//! and the pooled means land inside their χ² bands; away from 1 the predicted `S`
//! and `P` are mis-scaled, the means leave the bands, and `consistent` flips to
//! `false` — an objectively checkable health gate.

use crate::clock_state::{ClockModelExt, ClockStateExt, FlickerFmBank};
use crate::detection::chi2_inv_cdf;
use crate::kalman::KalmanClock;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::Serialize;

/// Filter-consistency health summary, surfaced in the result JSON.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct FilterHealth {
    /// Mean Normalised Innovation Squared over the ensemble (target ≈ 1.0).
    pub nis_mean: f64,
    /// Lower 95 % χ² band on the NIS mean (pooled samples).
    pub nis_chi2_lower_95: f64,
    /// Upper 95 % χ² band on the NIS mean.
    pub nis_chi2_upper_95: f64,
    /// Mean Normalised Estimation Error Squared over the ensemble (target ≈ 2.0).
    pub nees_mean: f64,
    /// Lower 95 % χ² band on the NEES mean (pooled samples).
    pub nees_chi2_lower_95: f64,
    /// Upper 95 % χ² band on the NEES mean.
    pub nees_chi2_upper_95: f64,
    /// Whether both means fall inside their 95 % bands — the filter is self-consistent.
    pub consistent: bool,
}

/// Configuration for the Monte-Carlo consistency assessment.
#[derive(Clone, Copy, Debug)]
pub struct HealthConfig {
    pub q_wf: f64,
    pub q_rw: f64,
    pub r: f64,
    pub dt: f64,
    pub steps: usize,
    pub seeds: usize,
    /// Mis-tuning multiplier applied to the *filter's* process noise (1.0 = matched).
    pub q_factor: f64,
    pub base_seed: u64,
}

/// Initial state uncertainty `P₀` used for both the truth draw and the filter, so
/// the ensemble is consistent from the first step at unit tuning (no warm-up bias).
const PHASE_VAR0: f64 = 1e-18; // (1 ns)² phase
const FREQ_VAR0: f64 = 1e-24; // fractional-frequency

/// Exact two-state van-Loan process-noise covariance `Q` over `dt`.
fn process_q(q_wf: f64, q_rw: f64, dt: f64) -> [[f64; 2]; 2] {
    let (dt2, dt3) = (dt * dt, dt * dt * dt);
    [
        [q_wf * dt + q_rw * dt3 / 3.0, q_rw * dt2 / 2.0],
        [q_rw * dt2 / 2.0, q_rw * dt],
    ]
}

/// Lower-triangular Cholesky factor of a symmetric PSD 2×2 (zeros where singular).
fn cholesky_2x2(m: [[f64; 2]; 2]) -> [[f64; 2]; 2] {
    let l00 = m[0][0].max(0.0).sqrt();
    let l10 = if l00 > 0.0 { m[1][0] / l00 } else { 0.0 };
    let l11 = (m[1][1] - l10 * l10).max(0.0).sqrt();
    [[l00, 0.0], [l10, l11]]
}

/// `NEES = ẽᵀ P⁻¹ ẽ` for a 2×2 `P` and error `e`; returns `None` if `P` is singular.
fn nees(e: [f64; 2], p: [[f64; 2]; 2]) -> Option<f64> {
    let det = p[0][0] * p[1][1] - p[0][1] * p[1][0];
    if det.abs() <= 0.0 {
        return None;
    }
    // P⁻¹ = (1/det)·[[p11, −p01], [−p10, p00]].
    let i00 = p[1][1] / det;
    let i01 = -p[0][1] / det;
    let i10 = -p[1][0] / det;
    let i11 = p[0][0] / det;
    Some(e[0] * (i00 * e[0] + i01 * e[1]) + e[1] * (i10 * e[0] + i11 * e[1]))
}

/// Run the Monte-Carlo filter-consistency assessment and summarise the pooled
/// NIS/NEES against their 95 % χ² bands. Deterministic in `base_seed`.
pub fn assess(cfg: HealthConfig) -> FilterHealth {
    let steps = cfg.steps.max(1);
    let seeds = cfg.seeds.max(1);
    let dt = cfg.dt.max(1e-12);
    let r = cfg.r.max(1e-300);

    // Truth uses the unscaled Q; the filter mis-tunes it by q_factor.
    let lq = cholesky_2x2(process_q(cfg.q_wf, cfg.q_rw, dt));
    let l0 = cholesky_2x2([[PHASE_VAR0, 0.0], [0.0, FREQ_VAR0]]);

    let n01 = Normal::new(0.0, 1.0)
        .expect("std_dev is the finite literal 1.0, which Normal::new always accepts");
    // `Normal::new` (rand_distr 0.4) rejects only a non-finite std_dev; a `cfg.r` of
    // `inf` would yield `r.sqrt() == inf`, so floor the measurement std_dev to a finite,
    // strictly-positive value before constructing the distribution.
    let meas_sigma = {
        let s = r.sqrt();
        if s.is_finite() {
            s.max(1e-300)
        } else {
            1e-300
        }
    };
    let meas = Normal::new(0.0, meas_sigma)
        .expect("meas_sigma is finite and strictly positive, which Normal::new always accepts");

    let mut nis_sum = 0.0;
    let mut nis_n = 0u64;
    let mut nees_sum = 0.0;
    let mut nees_n = 0u64;

    for s in 0..seeds {
        let mut rng = ChaCha8Rng::seed_from_u64(
            cfg.base_seed ^ (0x9E37_79B9_7F4A_7C15u64).wrapping_mul(s as u64 + 1),
        );
        // Truth drawn from P₀; filter initialised to the same prior.
        let (z0, z1) = (n01.sample(&mut rng), n01.sample(&mut rng));
        let mut x_true = [l0[0][0] * z0, l0[1][0] * z0 + l0[1][1] * z1];
        let mut kf = KalmanClock::new(cfg.q_wf * cfg.q_factor, cfg.q_rw * cfg.q_factor, r)
            .with_initial_cov(PHASE_VAR0, FREQ_VAR0);

        for _ in 0..steps {
            // Propagate truth: x = F x + w, w ~ N(0, Q_true).
            let (w0, w1) = (n01.sample(&mut rng), n01.sample(&mut rng));
            x_true[0] += dt * x_true[1] + lq[0][0] * w0;
            x_true[1] += lq[1][0] * w0 + lq[1][1] * w1;

            // Filter predict; NIS uses the predicted innovation (pre-update).
            kf.predict(dt);
            let z = x_true[0] + meas.sample(&mut rng);
            let innov = z - kf.phase_est();
            let s_innov = kf.innovation_var(r);
            if s_innov > 0.0 {
                nis_sum += innov * innov / s_innov;
                nis_n += 1;
            }

            // Filter update; NEES uses the posterior error and covariance.
            kf.update_with_r(z, r);
            let e = [x_true[0] - kf.phase_est(), x_true[1] - kf.freq_est()];
            if let Some(v) = nees(e, kf.covariance()) {
                nees_sum += v;
                nees_n += 1;
            }
        }
    }

    summarise(nis_sum, nis_n, nees_sum, nees_n, seeds)
}

/// Pooled means and their 95 % chi-square bands (the comments in the body explain the two
/// different effective sample counts).
fn summarise(nis_sum: f64, nis_n: u64, nees_sum: f64, nees_n: u64, seeds: usize) -> FilterHealth {
    let nis_mean = if nis_n > 0 {
        nis_sum / nis_n as f64
    } else {
        0.0
    };
    let nees_mean = if nees_n > 0 {
        nees_sum / nees_n as f64
    } else {
        0.0
    };

    // Confidence bands. The two statistics have *different* effective independence:
    //
    //  * NIS — the optimal filter's innovations form a **white** (temporally
    //    independent) sequence, so the K = seeds·steps pooled NIS samples are iid
    //    χ²(1); their sum ∼ χ²(K) and the mean's 95 % band is χ²_{.025,.975}(K)/K.
    //  * NEES — the estimation errors are temporally **correlated** within a run, so
    //    the independent count is the number of Monte-Carlo runs, not the pooled
    //    sample count (Bar-Shalom §5.4.2). With n_x = 2 states over `seeds` runs the
    //    acceptance region for the mean is χ²_{.025,.975}(2·seeds)/seeds. (Time-
    //    averaging only shrinks the spread further, so this run-based band is the
    //    conservative, honest choice — it never false-rejects a matched filter.)
    let knis = nis_n as f64;
    let nis_lo = chi2_inv_cdf(0.025, knis) / knis;
    let nis_hi = chi2_inv_cdf(0.975, knis) / knis;
    let dof_nees = 2.0 * seeds as f64;
    let nees_lo = chi2_inv_cdf(0.025, dof_nees) / seeds as f64;
    let nees_hi = chi2_inv_cdf(0.975, dof_nees) / seeds as f64;

    let consistent =
        nis_mean >= nis_lo && nis_mean <= nis_hi && nees_mean >= nees_lo && nees_mean <= nees_hi;

    FilterHealth {
        nis_mean,
        nis_chi2_lower_95: nis_lo,
        nis_chi2_upper_95: nis_hi,
        nees_mean,
        nees_chi2_lower_95: nees_lo,
        nees_chi2_upper_95: nees_hi,
        consistent,
    }
}

/// Lower-triangular Cholesky factor (row-major `n x n`) of a symmetric PSD matrix; a
/// column whose pivot is not positive is left zero, as in [`cholesky_2x2`].
fn cholesky_psd(m: &[f64], n: usize) -> Vec<f64> {
    let mut l = vec![0.0; n * n];
    for j in 0..n {
        let mut d = m[j * n + j];
        for k in 0..j {
            d -= l[j * n + k] * l[j * n + k];
        }
        let ljj = d.max(0.0).sqrt();
        l[j * n + j] = ljj;
        if ljj > 0.0 {
            for i in j + 1..n {
                let mut v = m[i * n + j];
                for k in 0..j {
                    v -= l[i * n + k] * l[j * n + k];
                }
                l[i * n + j] = v / ljj;
            }
        }
    }
    l
}

/// The filter-consistency assessment for a clock whose truth includes a flicker-FM bank:
/// the truth is drawn from the extended model (two clock states, no drift, plus `bank`'s
/// Gauss-Markov frequency processes at their stationary variance) and the filter is the
/// matched [`ClockStateExt`]. NIS is the pooled innovation statistic as in [`assess`]; NEES
/// is taken on the (phase, frequency) block of the full covariance, a marginal of the
/// filter's Gaussian state, so it keeps two degrees of freedom and the same bands.
///
/// `cfg.q_wf` and `cfg.q_rw` drive both truth and filter; `bank` is the flicker truth. Use
/// the bank of the truth clock model (`ClockModel::flicker_bank`) so truth and filter share
/// one set of flicker parameters. Deterministic in `cfg.base_seed`.
pub fn assess_with_flicker(cfg: HealthConfig, bank: &FlickerFmBank) -> FilterHealth {
    assess_ext(cfg, bank, true)
}

/// As [`assess_with_flicker`] but the filter does not model the flicker (the two-state
/// filter against a flicker truth): the pooled statistics leave their bands and
/// `consistent` is `false`. It is the check that the assessment sees the flicker truth.
pub fn assess_flicker_unmodelled(cfg: HealthConfig, bank: &FlickerFmBank) -> FilterHealth {
    assess_ext(cfg, bank, false)
}

fn assess_ext(
    cfg: HealthConfig,
    bank: &FlickerFmBank,
    filter_models_flicker: bool,
) -> FilterHealth {
    let steps = cfg.steps.max(1);
    let seeds = cfg.seeds.max(1);
    let dt = cfg.dt.max(1e-12);
    let r = cfg.r.max(1e-300);

    let truth_model = ClockModelExt {
        q_wf: cfg.q_wf,
        q_rw: cfg.q_rw,
        q_drift: 0.0,
        flicker: Some(bank.clone()),
        harmonics: Vec::new(),
        q_harmonic: 0.0,
    };
    let filter_model = ClockModelExt {
        q_wf: cfg.q_wf * cfg.q_factor,
        q_rw: cfg.q_rw * cfg.q_factor,
        q_drift: 0.0,
        flicker: filter_models_flicker.then(|| FlickerFmBank {
            h_minus1: bank.h_minus1 * cfg.q_factor,
            ..bank.clone()
        }),
        harmonics: Vec::new(),
        q_harmonic: 0.0,
    };
    let n = truth_model.dim();
    let (f, q) = truth_model.transition(dt);
    let lq = cholesky_psd(&q, n);
    // Truth prior: phase and frequency as in `assess`, no drift, flicker at its stationary
    // variance.
    let s2 = bank.process_variance();
    let mut sd0 = vec![0.0; n];
    sd0[0] = PHASE_VAR0.sqrt();
    sd0[1] = FREQ_VAR0.sqrt();
    for v in sd0.iter_mut().skip(3) {
        *v = s2.sqrt();
    }

    let n01 = Normal::new(0.0, 1.0)
        .expect("std_dev is the finite literal 1.0, which Normal::new always accepts");
    let meas_sigma = {
        let s = r.sqrt();
        if s.is_finite() {
            s.max(1e-300)
        } else {
            1e-300
        }
    };
    let meas = Normal::new(0.0, meas_sigma)
        .expect("meas_sigma is finite and strictly positive, which Normal::new always accepts");

    let (mut nis_sum, mut nis_n, mut nees_sum, mut nees_n) = (0.0, 0u64, 0.0, 0u64);
    for s in 0..seeds {
        let mut rng = ChaCha8Rng::seed_from_u64(
            cfg.base_seed ^ (0x9E37_79B9_7F4A_7C15u64).wrapping_mul(s as u64 + 1),
        );
        let mut x_true: Vec<f64> = sd0.iter().map(|sd| sd * n01.sample(&mut rng)).collect();
        let mut kf = ClockStateExt::new(filter_model.clone())
            .with_initial_cov(PHASE_VAR0, FREQ_VAR0, 0.0, 0.0);
        for _ in 0..steps {
            let w: Vec<f64> = (0..n).map(|_| n01.sample(&mut rng)).collect();
            let mut nx = vec![0.0; n];
            for i in 0..n {
                let mut v = 0.0;
                for k in 0..n {
                    v += f[i * n + k] * x_true[k];
                }
                for k in 0..=i {
                    v += lq[i * n + k] * w[k];
                }
                nx[i] = v;
            }
            x_true = nx;

            kf.predict(dt);
            let z = x_true[0] + meas.sample(&mut rng);
            let (innov, s_innov) = kf.update_phase(z, r);
            if s_innov > 0.0 {
                nis_sum += innov * innov / s_innov;
                nis_n += 1;
            }
            let e = [x_true[0] - kf.x[0], x_true[1] - kf.x[1]];
            let dim = kf.dim();
            let p = [[kf.p[0], kf.p[1]], [kf.p[dim], kf.p[dim + 1]]];
            if let Some(v) = nees(e, p) {
                nees_sum += v;
                nees_n += 1;
            }
        }
    }
    summarise(nis_sum, nis_n, nees_sum, nees_n, seeds)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn cfg(q_factor: f64) -> HealthConfig {
        // Process-noise-dominated (q_wf·dt = 1e-18 ≫ r = 1e-20): the innovation
        // variance S ≈ P⁻[0][0] tracks Q, so a Q mistuning by `q_factor` scales S
        // (and hence NIS ≈ 1/q_factor) starkly — the regime that makes the health
        // gate discriminating.
        HealthConfig {
            q_wf: 1e-18,
            q_rw: 1e-26,
            r: 1e-20,
            dt: 1.0,
            steps: 200,
            seeds: 64,
            q_factor,
            base_seed: 20260604,
        }
    }

    #[test]
    fn matched_filter_is_consistent() {
        // At unit tuning the filter's covariance matches its errors: NIS → 1,
        // NEES → 2, both inside their narrow χ² bands.
        let h = assess(cfg(1.0));
        assert!(h.consistent, "matched filter flagged inconsistent: {h:?}");
        assert!(
            h.nis_mean > 0.9 && h.nis_mean < 1.1,
            "nis_mean={}",
            h.nis_mean
        );
        assert!(
            h.nees_mean > 1.8 && h.nees_mean < 2.2,
            "nees_mean={}",
            h.nees_mean
        );
        // The bands bracket the targets and are tight (thousands of pooled samples).
        assert!(h.nis_chi2_lower_95 < 1.0 && h.nis_chi2_upper_95 > 1.0);
        assert!(h.nees_chi2_lower_95 < 2.0 && h.nees_chi2_upper_95 > 2.0);
    }

    #[test]
    fn q_r_mismatch_sweep_flips_consistency() {
        // The done-gate sweep: matched (1.0) is consistent; every factor outside
        // [0.7, 1.4] is rejected. Under-tuned Q (filter over-confident, S too small)
        // pushes NIS above the band; over-tuned Q (S too large) pushes it below.
        assert!(
            assess(cfg(1.0)).consistent,
            "factor 1.0 should be consistent"
        );
        for &f in &[0.1, 0.5, 2.0, 10.0] {
            let h = assess(cfg(f));
            assert!(!h.consistent, "factor {f} should be inconsistent: {h:?}");
        }
        // Direction: too-small Q ⇒ NIS above 1; too-large Q ⇒ NIS below 1.
        assert!(assess(cfg(0.5)).nis_mean > assess(cfg(1.0)).nis_mean);
        assert!(assess(cfg(2.0)).nis_mean < assess(cfg(1.0)).nis_mean);
    }

    #[test]
    fn assess_is_deterministic_in_the_seed() {
        assert_eq!(assess(cfg(1.0)), assess(cfg(1.0)));
    }

    /// The shipped clocks: (q_wf, flicker floor).
    const CSAC: (f64, f64) = (9.0e-20, 2.0e-11);
    const OPTICAL: (f64, f64) = (1.0e-30, 1.0e-16);

    fn flicker_cfg(q_wf: f64, steps: usize, seeds: usize) -> HealthConfig {
        HealthConfig {
            q_wf,
            q_rw: 0.0,
            r: 1e-20,
            dt: 10.0,
            steps,
            seeds,
            q_factor: 1.0,
            base_seed: 0xD11,
        }
    }

    fn bank(floor: f64) -> FlickerFmBank {
        FlickerFmBank::log_spaced(floor * floor / (2.0 * std::f64::consts::LN_2), 1.0, 1e5, 4)
    }

    /// D11 / B3: with the flicker in the truth, the matched extended filter is consistent,
    /// at the ensemble size the scenario run uses (16 x 60) and at the full 64 x 200.
    #[test]
    fn the_matched_extended_filter_is_consistent_with_flicker_truth() {
        for (q_wf, floor) in [CSAC, OPTICAL] {
            for (steps, seeds) in [(60, 16), (200, 64)] {
                let h = assess_with_flicker(flicker_cfg(q_wf, steps, seeds), &bank(floor));
                assert!(
                    h.consistent,
                    "floor {floor}, {seeds}x{steps}: NIS {} [{}, {}], NEES {} [{}, {}]",
                    h.nis_mean,
                    h.nis_chi2_lower_95,
                    h.nis_chi2_upper_95,
                    h.nees_mean,
                    h.nees_chi2_lower_95,
                    h.nees_chi2_upper_95
                );
            }
        }
    }

    /// D11 / B3: the two-state filter against the classical flicker truth is NOT consistent,
    /// so the assessment sees the flicker (before this, NIS/NEES were bit-identical with and
    /// without the floor). The optical floor is below the 0.1 ns phase noise during sync and
    /// is not detectable this way, so only the classical clock is asserted.
    #[test]
    fn the_two_state_filter_fails_against_the_classical_flicker_truth() {
        let (q_wf, floor) = CSAC;
        for (steps, seeds) in [(60, 16), (200, 64)] {
            let h = assess_flicker_unmodelled(flicker_cfg(q_wf, steps, seeds), &bank(floor));
            assert!(
                !h.consistent,
                "{seeds}x{steps}: two-state filter reported consistent: NIS {} [{}, {}], NEES {} [{}, {}]",
                h.nis_mean,
                h.nis_chi2_lower_95,
                h.nis_chi2_upper_95,
                h.nees_mean,
                h.nees_chi2_lower_95,
                h.nees_chi2_upper_95
            );
        }
    }

    /// The health numbers with and without the flicker truth differ (they were identical).
    #[test]
    fn the_flicker_truth_changes_the_health_numbers() {
        let (q_wf, floor) = CSAC;
        let cfg = flicker_cfg(q_wf, 60, 16);
        let plain = assess(cfg);
        let with = assess_with_flicker(cfg, &bank(floor));
        let unmodelled = assess_flicker_unmodelled(cfg, &bank(floor));
        assert_ne!(plain.nis_mean, with.nis_mean);
        assert!(
            unmodelled.nis_mean > 1.2 * with.nis_mean,
            "{unmodelled:?} vs {with:?}"
        );
    }
}
