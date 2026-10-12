// SPDX-License-Identifier: AGPL-3.0-only
//! Position error ≈ σ_UERE × DOP: a seeded Monte Carlo consistency check of the engine's
//! least-squares fix against the analytic covariance of the DOP kernel.
//!
//! Under the stated model (independent, zero-mean Gaussian range errors of equal variance σ²)
//! the unweighted least-squares estimate of position and clock has covariance `σ²·Q` with
//! `Q = (HᵀH)⁻¹`, so the RMS error along each axis is σ times the matching DOP (Kaplan and
//! Hegarty, *Understanding GPS/GNSS*, ch. 7). [`run_geometry`] checks that the engine's solver,
//! [`crate::pvt::solve_spp`], with its seeded noise realises that covariance on one geometry:
//! it places the satellites at their elevation and azimuth 20,000 km from the user, draws `N`
//! epochs of range errors, solves each epoch from the true position, and returns the error
//! statistics beside `σ²·Q` from [`crate::orbit::dop_cofactor`], the covariance factor of the
//! DOP kernel VALIDATED against gnss_lib_py (`tests/dop_reference.rs`). No second DOP
//! implementation is involved: `Q` is that kernel's, projected onto its own East-North-Up
//! frame.
//!
//! [`check`] applies the tolerances of the 0.36 geometry design note
//! (`docs/design/2026-10-12-geometry-and-skyline-design.md`, section 5.2), fixed in a
//! pre-registration commit before the first run; each is a number of standard errors of the
//! statistic it bounds, stated with it in [`TOLERANCES`].
//!
//! The estimator is nonlinear (ranges, not their linearisation); at metre-level noise and
//! 2 × 10⁷ m range the second-order term is of order σ²/R ≈ 1e-7 m, far below the tolerances.
//!
//! **Status: a consistency check, MODELLED.** It shows the engine's estimator and noise
//! realise σ·DOP under the textbook model; it does not show that any receiver's error follows
//! that model, and σ_UERE is an input.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};
use serde::Serialize;

use crate::orbit::{dop, dop_cofactor, enu_basis, Dop};
use crate::pvt::{solve_spp, SppMeasurement};

/// What to run.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct McConfig {
    /// Epochs per geometry.
    pub trials: usize,
    /// Range error standard deviation σ_UERE, m (an input; the check is of the relation).
    pub sigma_m: f64,
    /// Base seed; geometry `i` (from 0) draws from `ChaCha8Rng::seed_from_u64(seed + i)`.
    pub seed: u64,
    /// Negative control: each satellite's error has standard deviation `sigma_m / sin(el)`,
    /// which breaks the equal-variance model the unweighted `Q` assumes.
    pub elevation_dependent_errors: bool,
    /// Negative control: the prediction uses `scale² · Q` (a DOP `scale` times too large).
    /// 1 for the real check.
    pub dop_scale: f64,
}

impl Default for McConfig {
    /// The pre-registered run: N 20,000, σ 1.5 m, seed 36.
    fn default() -> Self {
        Self {
            trials: 20_000,
            sigma_m: 1.5,
            seed: 36,
            elevation_dependent_errors: false,
            dop_scale: 1.0,
        }
    }
}

/// The error statistics of one geometry beside the analytic covariance.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GeometryResult {
    /// The geometry's label.
    pub label: String,
    /// Satellites.
    pub n_sats: usize,
    /// The kernel's DOP for the geometry (unscaled).
    pub dop: Dop,
    /// Predicted variances `σ²·Q` (times `dop_scale²`) of east, north, up and clock, m².
    pub predicted_var: [f64; 4],
    /// Empirical mean squared errors of east, north, up and clock about the truth, m².
    pub empirical_var: [f64; 4],
    /// Empirical mean errors of east, north, up and clock, m.
    pub mean: [f64; 4],
    /// Predicted east-north correlation.
    pub predicted_corr_en: f64,
    /// Empirical east-north correlation.
    pub empirical_corr_en: f64,
    /// RMS horizontal, vertical and 3-D errors, m.
    pub rms_hvp: [f64; 3],
    /// σ × HDOP, σ × VDOP, σ × PDOP (times `dop_scale`), m.
    pub predicted_rms_hvp: [f64; 3],
    /// Fraction of epochs inside the predicted 95 % horizontal error ellipse.
    pub frac_in_ellipse95: f64,
    /// Epochs.
    pub trials: usize,
    /// Most Gauss-Newton iterations any epoch took.
    pub max_iterations: usize,
}

/// One tolerance of the pre-registration: what it bounds, the bound, and its basis.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Tolerance {
    /// What is bounded.
    pub quantity: &'static str,
    /// The bound.
    pub bound: f64,
    /// Why this bound.
    pub basis: &'static str,
}

/// The tolerances of the 0.36 geometry design note, section 5.2, fixed before the first run.
pub const TOLERANCES: [Tolerance; 5] = [
    Tolerance {
        quantity:
            "relative error of each of the east, north, up and clock variances against sigma^2 Q_ii",
        bound: 0.05,
        basis: "5 standard errors of a sample variance at N = 20,000 (sqrt(2/N) = 1.0 %)",
    },
    Tolerance {
        quantity: "relative error of the RMS against sigma x HDOP, sigma x VDOP, sigma x PDOP",
        bound: 0.025,
        basis: "half the variance bound",
    },
    Tolerance {
        quantity: "absolute error of the east-north correlation against Q",
        bound: 0.035,
        basis: "5/sqrt(N)",
    },
    Tolerance {
        quantity: "mean error per axis, in standard errors sigma_i/sqrt(N)",
        bound: 5.0,
        basis: "unbiasedness, 5 standard errors",
    },
    Tolerance {
        quantity: "fraction inside the 95 % horizontal error ellipse, absolute error against 0.95",
        bound: 0.0077,
        basis: "5 binomial standard errors at N = 20,000",
    },
];

/// χ²₂ quantile at 0.95: `-2 ln 0.05`, the squared Mahalanobis radius of the 95 % ellipse.
pub const CHI2_2_95: f64 = 5.991_464_547_107_979;

/// One check's outcome.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Check {
    /// `var-e`, `var-n`, `var-u`, `var-t`, `rms-h`, `rms-v`, `rms-p`, `corr-en`, `mean-e`,
    /// `mean-n`, `mean-u`, `mean-t`, `ellipse95`.
    pub name: &'static str,
    /// The statistic in the units of its bound (relative error, absolute error, or standard
    /// errors).
    pub value: f64,
    /// The bound from [`TOLERANCES`].
    pub bound: f64,
    /// `|value| <= bound`.
    pub pass: bool,
}

/// The pre-registered checks of one geometry.
pub fn check(r: &GeometryResult) -> Vec<Check> {
    let mk = |name, value: f64, bound| Check {
        name,
        value,
        bound,
        pass: value.abs() <= bound,
    };
    let n = r.trials as f64;
    let mut out = Vec::new();
    for (i, name) in ["var-e", "var-n", "var-u", "var-t"].into_iter().enumerate() {
        out.push(mk(
            name,
            r.empirical_var[i] / r.predicted_var[i] - 1.0,
            TOLERANCES[0].bound,
        ));
    }
    for (i, name) in ["rms-h", "rms-v", "rms-p"].into_iter().enumerate() {
        out.push(mk(
            name,
            r.rms_hvp[i] / r.predicted_rms_hvp[i] - 1.0,
            TOLERANCES[1].bound,
        ));
    }
    out.push(mk(
        "corr-en",
        r.empirical_corr_en - r.predicted_corr_en,
        TOLERANCES[2].bound,
    ));
    for (i, name) in ["mean-e", "mean-n", "mean-u", "mean-t"]
        .into_iter()
        .enumerate()
    {
        out.push(mk(
            name,
            r.mean[i] / (r.predicted_var[i] / n).sqrt(),
            TOLERANCES[3].bound,
        ));
    }
    out.push(mk(
        "ellipse95",
        r.frac_in_ellipse95 - 0.95,
        TOLERANCES[4].bound,
    ));
    out
}

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Run one geometry: satellites at `dirs` (`(elevation, azimuth)`, degrees) seen from `user`
/// (an inertial position; the local frame is [`crate::orbit::enu_basis`] there), with seed
/// `cfg.seed + index`.
pub fn run_geometry(
    label: &str,
    user: [f64; 3],
    dirs: &[(f64, f64)],
    index: u64,
    cfg: &McConfig,
) -> Result<GeometryResult, String> {
    if cfg.trials < 2 || !(cfg.sigma_m.is_finite() && cfg.sigma_m > 0.0) {
        return Err("need at least 2 trials and a finite sigma_m > 0".into());
    }
    const RANGE: f64 = 2.0e7;
    let (east, north, up) = enu_basis(user).ok_or("no local frame at the user")?;
    let sats: Vec<[f64; 3]> = dirs
        .iter()
        .map(|&(el, az)| {
            let (el, az) = (el.to_radians(), az.to_radians());
            let l = [el.cos() * az.sin(), el.cos() * az.cos(), el.sin()];
            [
                user[0] + RANGE * (l[0] * east[0] + l[1] * north[0] + l[2] * up[0]),
                user[1] + RANGE * (l[0] * east[1] + l[1] * north[1] + l[2] * up[1]),
                user[2] + RANGE * (l[0] * east[2] + l[1] * north[2] + l[2] * up[2]),
            ]
        })
        .collect();
    let d = dop(user, &sats).ok_or_else(|| format!("{label}: singular geometry"))?;
    let q = dop_cofactor(user, &sats).ok_or_else(|| format!("{label}: singular geometry"))?;
    // Q in the local frame, clock last.
    let qpos = |a: [f64; 3], b: [f64; 3]| -> f64 {
        let mut v = 0.0;
        for i in 0..3 {
            for j in 0..3 {
                v += a[i] * q[i][j] * b[j];
            }
        }
        v
    };
    let k2 = cfg.dop_scale * cfg.dop_scale;
    let s2 = cfg.sigma_m * cfg.sigma_m * k2;
    let (q_ee, q_nn, q_en) = (qpos(east, east), qpos(north, north), qpos(east, north));
    let predicted_var = [s2 * q_ee, s2 * q_nn, s2 * qpos(up, up), s2 * q[3][3]];
    // Inverse of the predicted horizontal covariance, for the 95 % ellipse.
    let det = s2 * (q_ee * q_nn - q_en * q_en);
    let inv = [[q_nn / det, -q_en / det], [-q_en / det, q_ee / det]];
    let ranges: Vec<f64> = sats
        .iter()
        .map(|s| {
            ((s[0] - user[0]).powi(2) + (s[1] - user[1]).powi(2) + (s[2] - user[2]).powi(2)).sqrt()
        })
        .collect();
    let scale: Vec<f64> = dirs
        .iter()
        .map(|(el, _)| {
            if cfg.elevation_dependent_errors {
                1.0 / el.to_radians().sin().max(0.05)
            } else {
                1.0
            }
        })
        .collect();
    // A clock offset of 30 km (100 µs), so the clock state is exercised.
    let clock_m = 30_000.0;
    let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed.wrapping_add(index));
    let (mut sq, mut sum) = ([0.0_f64; 4], [0.0_f64; 4]);
    let (mut cross_en, mut inside, mut max_it) = (0.0_f64, 0usize, 0usize);
    for _ in 0..cfg.trials {
        let meas: Vec<SppMeasurement> = sats
            .iter()
            .zip(&ranges)
            .zip(&scale)
            .map(|((s, r), k)| {
                let eps: f64 = StandardNormal.sample(&mut rng);
                SppMeasurement {
                    sat_ecef: *s,
                    pseudorange_m: r + clock_m + cfg.sigma_m * k * eps,
                    sat_clock_m: 0.0,
                    iono_m: 0.0,
                    tropo_m: 0.0,
                    weight: 1.0,
                }
            })
            .collect();
        let fix = solve_spp(&meas, user).ok_or_else(|| format!("{label}: no fix"))?;
        max_it = max_it.max(fix.iterations);
        let dx = [
            fix.ecef[0] - user[0],
            fix.ecef[1] - user[1],
            fix.ecef[2] - user[2],
        ];
        let e = [
            dot(dx, east),
            dot(dx, north),
            dot(dx, up),
            fix.clock_bias_m - clock_m,
        ];
        for i in 0..4 {
            sq[i] += e[i] * e[i];
            sum[i] += e[i];
        }
        cross_en += e[0] * e[1];
        let m2 = e[0] * (inv[0][0] * e[0] + inv[0][1] * e[1])
            + e[1] * (inv[1][0] * e[0] + inv[1][1] * e[1]);
        if m2 <= CHI2_2_95 {
            inside += 1;
        }
    }
    let n = cfg.trials as f64;
    let empirical_var = sq.map(|x| x / n);
    let s = cfg.sigma_m * cfg.dop_scale;
    Ok(GeometryResult {
        label: label.to_string(),
        n_sats: dirs.len(),
        dop: d,
        predicted_var,
        empirical_var,
        mean: sum.map(|x| x / n),
        predicted_corr_en: q_en / (q_ee * q_nn).sqrt(),
        empirical_corr_en: (cross_en / n) / (empirical_var[0] * empirical_var[1]).sqrt(),
        rms_hvp: [
            (empirical_var[0] + empirical_var[1]).sqrt(),
            empirical_var[2].sqrt(),
            (empirical_var[0] + empirical_var[1] + empirical_var[2]).sqrt(),
        ],
        predicted_rms_hvp: [s * d.hdop, s * d.vdop, s * d.pdop],
        frac_in_ellipse95: inside as f64 / n,
        trials: cfg.trials,
        max_iterations: max_it,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_ellipse_quantile_is_minus_two_ln_alpha() {
        assert!((CHI2_2_95 - (-2.0 * 0.05_f64.ln())).abs() < 1e-12);
        assert!((crate::raim::chi2_quantile(0.95, 2.0) - CHI2_2_95).abs() < 1e-6);
    }

    #[test]
    fn a_short_run_is_deterministic_and_rejects_bad_input() {
        let user = [6_371_000.0, 0.0, 0.0];
        let dirs = [
            (90.0, 0.0),
            (20.0, 0.0),
            (20.0, 120.0),
            (20.0, 240.0),
            (45.0, 60.0),
        ];
        let cfg = McConfig {
            trials: 200,
            ..McConfig::default()
        };
        let a = run_geometry("t", user, &dirs, 0, &cfg).unwrap();
        assert_eq!(a, run_geometry("t", user, &dirs, 0, &cfg).unwrap());
        assert_eq!(check(&a).len(), 13);
        let bad = McConfig {
            trials: 1,
            ..McConfig::default()
        };
        assert!(run_geometry("t", user, &dirs, 0, &bad).is_err());
    }
}
