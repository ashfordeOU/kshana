// SPDX-License-Identifier: AGPL-3.0-only
//! Covariance toolkit for orbit states (position and velocity, 6x6).
//!
//! * [`pd_check`](super::pd_check): positive definiteness on the correlation matrix, so that a
//!   covariance with position terms in km² and velocity terms in km²/s² is judged fairly; checked
//!   again after every frame rotation ([`to_rtn`], [`from_rtn`]).
//! * [`propagate`]: the covariance at any other epoch (earlier or later), `P(t) = Φ P(t0) Φᵀ`, with
//!   `Φ` the variational state-transition matrix of the two-body + J2 dynamics integrated by RK4
//!   ([`crate::orbit_determination::propagate_with_stm`]).
//! * [`monte_carlo`]: the same propagation by sampling: draws from `N(x0, P0)`, propagates each draw
//!   with the same dynamics, and compares the sample covariance with the linear one. Where the two
//!   agree the linear propagation is adequate for that span; where they part, the span is too long
//!   (or the covariance too large) for a linear mapping.
//! * [`synthetic`]: a covariance built from stated 1-sigma values in RTN, for an ephemeris that
//!   carries none. The sigmas are the caller's statement; the result is only as good as they are.
//! * [`realism`]: covariance-realism statistics from predicted states, their covariances and
//!   reference states: the squared Mahalanobis distances, their mean against the degrees of
//!   freedom, the share inside the 95 % chi-square bound, a variance scale factor and the
//!   Kolmogorov-Smirnov distance to the chi-square distribution.
//!
//! Everything here is MODELLED: the dynamics are two-body + J2 only (no drag, third bodies or solar
//! pressure), so propagated covariances say how a covariance maps under that model, not how a real
//! orbit's uncertainty grows.

use super::cdm::rtn_axes;
use super::{pd_check, PdCheck};
use crate::orbit_determination::propagate_with_stm;
use rand::SeedableRng;
use rand_distr::{Distribution, StandardNormal};
use serde::Serialize;

/// A 6x6 covariance, row-major.
pub type Cov6 = [[f64; 6]; 6];

/// `B P Bᵀ` with `B = diag(R, R)` for a 3x3 rotation `R`.
fn rotate(p: &Cov6, r: &[[f64; 3]; 3]) -> Cov6 {
    let mut b = [[0.0; 6]; 6];
    for i in 0..3 {
        for j in 0..3 {
            b[i][j] = r[i][j];
            b[i + 3][j + 3] = r[i][j];
        }
    }
    sandwich(&b, p)
}

/// `A P Aᵀ`.
pub fn sandwich(a: &Cov6, p: &Cov6) -> Cov6 {
    let mut ap = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            ap[i][j] = (0..6).map(|k| a[i][k] * p[k][j]).sum();
        }
    }
    let mut out = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            out[i][j] = (0..6).map(|k| ap[i][k] * a[j][k]).sum();
        }
    }
    out
}

/// An inertial covariance expressed in the RTN axes of `state` (annex E of CCSDS 508.0-B-1: R
/// radial, N along the angular momentum, T = N x R). The axes are taken as fixed at the epoch
/// (velocity components are rotated, not corrected for the rotation of the frame).
pub fn to_rtn(state: &[f64; 6], p: &Cov6) -> Cov6 {
    rotate(p, &rtn_axes(state))
}

/// An RTN covariance (axes of `state`) expressed in the inertial frame of `state`.
pub fn from_rtn(state: &[f64; 6], p: &Cov6) -> Cov6 {
    let a = rtn_axes(state);
    let at = [
        [a[0][0], a[1][0], a[2][0]],
        [a[0][1], a[1][1], a[2][1]],
        [a[0][2], a[1][2], a[2][2]],
    ];
    rotate(p, &at)
}

/// [`pd_check`](super::pd_check) of a 6x6.
pub fn check(p: &Cov6) -> PdCheck {
    pd_check(&p.iter().map(|r| r.to_vec()).collect::<Vec<_>>())
}

fn steps(dt_s: f64, max_step_s: f64) -> (f64, usize) {
    let n = (dt_s.abs() / max_step_s.max(1e-3)).ceil().max(1.0) as usize;
    (dt_s / n as f64, n)
}

/// Propagate a state (m, m/s, inertial) and its covariance by `dt_s` seconds (negative goes
/// back), with RK4 steps no longer than `max_step_s`. Returns the state and covariance at the new
/// epoch.
pub fn propagate(x0: &[f64; 6], p0: &Cov6, dt_s: f64, max_step_s: f64) -> ([f64; 6], Cov6) {
    let (h, n) = steps(dt_s, max_step_s);
    let out = propagate_with_stm(x0, h, n);
    let (x, phi) = out.last().copied().expect("at least the initial state");
    (x, sandwich(&phi, p0))
}

fn propagate_state(x0: &[f64; 6], dt_s: f64, max_step_s: f64) -> [f64; 6] {
    let (h, n) = steps(dt_s, max_step_s);
    propagate_with_stm(x0, h, n).last().expect("state").0
}

/// Lower Cholesky factor, `None` when not positive definite.
pub fn cholesky(p: &Cov6) -> Option<Cov6> {
    let mut l = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..=i {
            let s: f64 = p[i][j] - (0..j).map(|k| l[i][k] * l[j][k]).sum::<f64>();
            if i == j {
                if s <= 0.0 || !s.is_finite() {
                    return None;
                }
                l[i][i] = s.sqrt();
            } else {
                l[i][j] = s / l[j][j];
            }
        }
    }
    Some(l)
}

/// The comparison of a linear covariance propagation with Monte Carlo sampling.
#[derive(Clone, Debug, Serialize)]
pub struct MonteCarlo {
    /// Number of draws.
    pub samples: usize,
    /// Propagation span, seconds.
    pub dt_s: f64,
    /// Linear (STM) covariance at the end, m and m/s.
    pub linear: Cov6,
    /// Sample covariance of the propagated draws.
    pub sampled: Cov6,
    /// Largest `|sampled_ii / linear_ii - 1|` over the six variances.
    pub max_variance_ratio_error: f64,
    /// Largest `|corr_sampled_ij - corr_linear_ij|` over the off-diagonal correlations.
    pub max_correlation_error: f64,
    /// Expected 1-sigma sampling error of a variance ratio, `sqrt(2 / (samples - 1))`.
    pub variance_sampling_sigma: f64,
    /// Evidence label.
    pub evidence: &'static str,
}

/// Draw `samples` states from `N(x0, p0)` (seeded ChaCha8), propagate each by `dt_s` and compare
/// the sample covariance with the STM propagation. `None` when `p0` is not positive definite or
/// `samples < 10`.
pub fn monte_carlo(
    x0: &[f64; 6],
    p0: &Cov6,
    dt_s: f64,
    max_step_s: f64,
    samples: usize,
    seed: u64,
) -> Option<MonteCarlo> {
    if samples < 10 {
        return None;
    }
    let l = cholesky(p0)?;
    let (_, linear) = propagate(x0, p0, dt_s, max_step_s);
    let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
    let mut pts = Vec::with_capacity(samples);
    for _ in 0..samples {
        let z: [f64; 6] = std::array::from_fn(|_| StandardNormal.sample(&mut rng));
        let mut x = *x0;
        for i in 0..6 {
            x[i] += (0..=i).map(|k| l[i][k] * z[k]).sum::<f64>();
        }
        pts.push(propagate_state(&x, dt_s, max_step_s));
    }
    let mut mean = [0.0; 6];
    for p in &pts {
        for i in 0..6 {
            mean[i] += p[i] / samples as f64;
        }
    }
    let mut s = [[0.0; 6]; 6];
    for p in &pts {
        for i in 0..6 {
            for j in 0..6 {
                s[i][j] += (p[i] - mean[i]) * (p[j] - mean[j]) / (samples as f64 - 1.0);
            }
        }
    }
    let mut var_err: f64 = 0.0;
    let mut corr_err: f64 = 0.0;
    for i in 0..6 {
        var_err = var_err.max((s[i][i] / linear[i][i] - 1.0).abs());
        for j in 0..i {
            let cs = s[i][j] / (s[i][i] * s[j][j]).sqrt();
            let cl = linear[i][j] / (linear[i][i] * linear[j][j]).sqrt();
            corr_err = corr_err.max((cs - cl).abs());
        }
    }
    Some(MonteCarlo {
        samples,
        dt_s,
        linear,
        sampled: s,
        max_variance_ratio_error: var_err,
        max_correlation_error: corr_err,
        variance_sampling_sigma: (2.0 / (samples as f64 - 1.0)).sqrt(),
        evidence: "MODELLED",
    })
}

/// A covariance from 1-sigma values in RTN (`[R, T, N]` in m, `[R_dot, T_dot, N_dot]` in m/s),
/// uncorrelated in RTN, expressed in the inertial frame of `state`.
pub fn synthetic(state: &[f64; 6], sigma_rtn: &[f64; 6]) -> Cov6 {
    let mut d = [[0.0; 6]; 6];
    for i in 0..6 {
        d[i][i] = sigma_rtn[i] * sigma_rtn[i];
    }
    from_rtn(state, &d)
}

/// One prediction to score: predicted state, its covariance, and a reference ("truth") state at
/// the same epoch and in the same frame and units.
#[derive(Clone, Debug)]
pub struct Prediction {
    /// Predicted state.
    pub predicted: [f64; 6],
    /// Covariance of the prediction.
    pub cov: Cov6,
    /// Reference state.
    pub reference: [f64; 6],
}

/// Covariance-realism statistics over a set of predictions.
#[derive(Clone, Debug, Serialize)]
pub struct Realism {
    /// Predictions scored (those whose covariance block is positive definite).
    pub n: usize,
    /// Predictions skipped: covariance block not positive definite.
    pub skipped: usize,
    /// Degrees of freedom: 3 (position) or 6 (position and velocity).
    pub dof: usize,
    /// Mean squared Mahalanobis distance; equals `dof` for a realistic covariance.
    pub mean_m2: f64,
    /// Share of predictions with `m2` at or under the 95 % chi-square bound (0.95 when realistic).
    pub within_95: f64,
    /// The 95 % chi-square bound for `dof`.
    pub chi2_95: f64,
    /// `mean_m2 / dof`: the factor by which the covariance would have to be scaled.
    pub scale_factor: f64,
    /// Kolmogorov-Smirnov distance between the `m2` values and the chi-square distribution.
    pub ks_distance: f64,
    /// Evidence label.
    pub evidence: &'static str,
}

/// Chi-square CDF for 3 or 6 degrees of freedom (closed forms).
fn chi2_cdf(x: f64, dof: usize) -> f64 {
    if x <= 0.0 {
        return 0.0;
    }
    match dof {
        3 => {
            libm::erf((x / 2.0).sqrt()) - (2.0 * x / std::f64::consts::PI).sqrt() * (-x / 2.0).exp()
        }
        _ => 1.0 - (-x / 2.0).exp() * (1.0 + x / 2.0 + x * x / 8.0),
    }
}

/// Inverse of `A` (symmetric positive definite, `n` = 3 or 6) through its Cholesky factor.
fn spd_inverse(a: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = a.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let s: f64 = a[i][j] - (0..j).map(|k| l[i][k] * l[j][k]).sum::<f64>();
            if i == j {
                if s <= 0.0 || !s.is_finite() {
                    return None;
                }
                l[i][i] = s.sqrt();
            } else {
                l[i][j] = s / l[j][j];
            }
        }
    }
    // inv(A) = inv(L)ᵀ inv(L)
    let mut li = vec![vec![0.0; n]; n];
    for i in 0..n {
        li[i][i] = 1.0 / l[i][i];
        for j in 0..i {
            let s: f64 = (j..i).map(|k| l[i][k] * li[k][j]).sum();
            li[i][j] = -s / l[i][i];
        }
    }
    let mut inv = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            inv[i][j] = (0..n).map(|k| li[k][i] * li[k][j]).sum();
        }
    }
    Some(inv)
}

/// Covariance-realism statistics. `position_only` scores the 3x3 position block (3 degrees of
/// freedom); otherwise the full state (6).
pub fn realism(preds: &[Prediction], position_only: bool) -> Realism {
    let dof = if position_only { 3 } else { 6 };
    let mut m2 = Vec::new();
    let mut skipped = 0;
    for p in preds {
        let a: Vec<Vec<f64>> = (0..dof).map(|i| p.cov[i][..dof].to_vec()).collect();
        let Some(inv) = spd_inverse(&a) else {
            skipped += 1;
            continue;
        };
        let d: Vec<f64> = (0..dof).map(|i| p.reference[i] - p.predicted[i]).collect();
        let q: f64 = (0..dof)
            .map(|i| (0..dof).map(|j| d[i] * inv[i][j] * d[j]).sum::<f64>())
            .sum();
        m2.push(q);
    }
    let n = m2.len();
    // Chi-square 95 % quantiles (any statistics table): 7.8147 for 3 and 12.5916 for 6 degrees of freedom.
    let chi2_95 = if dof == 3 {
        7.814_727_903
    } else {
        12.591_587_24
    };
    let mean = if n > 0 {
        m2.iter().sum::<f64>() / n as f64
    } else {
        f64::NAN
    };
    let within = if n > 0 {
        m2.iter().filter(|&&x| x <= chi2_95).count() as f64 / n as f64
    } else {
        f64::NAN
    };
    m2.sort_by(f64::total_cmp);
    let mut ks: f64 = 0.0;
    for (i, &x) in m2.iter().enumerate() {
        let f = chi2_cdf(x, dof);
        ks = ks
            .max((i as f64 + 1.0) / n as f64 - f)
            .max(f - i as f64 / n as f64);
    }
    Realism {
        n,
        skipped,
        dof,
        mean_m2: mean,
        within_95: within,
        chi2_95,
        scale_factor: mean / dof as f64,
        ks_distance: if n > 0 { ks } else { f64::NAN },
        evidence: "MODELLED",
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn leo() -> [f64; 6] {
        // About 700 km altitude, inclined.
        [7_078_137.0, 0.0, 0.0, 0.0, 6_500.0, 3_700.0]
    }

    fn cov0() -> Cov6 {
        synthetic(&leo(), &[30.0, 100.0, 20.0, 0.05, 0.03, 0.02])
    }

    #[test]
    fn rtn_round_trip_keeps_the_matrix_and_definiteness() {
        let p = cov0();
        let r = to_rtn(&leo(), &p);
        assert!((r[0][0] - 900.0).abs() < 1e-6 && (r[1][1] - 1e4).abs() < 1e-6);
        let back = from_rtn(&leo(), &r);
        for i in 0..6 {
            for j in 0..6 {
                assert!((back[i][j] - p[i][j]).abs() < 1e-9 * (1.0 + p[i][i].abs()));
            }
        }
        assert!(check(&p).positive_definite && check(&r).positive_definite);
    }

    #[test]
    fn propagation_forward_then_back_returns_the_covariance() {
        let p = cov0();
        let (x1, p1) = propagate(&leo(), &p, 3_000.0, 10.0);
        let (x2, p2) = propagate(&x1, &p1, -3_000.0, 10.0);
        for i in 0..6 {
            let tol = if i < 3 { 1e-2 } else { 1e-5 };
            assert!(
                (x2[i] - leo()[i]).abs() < tol,
                "{i}: {} {}",
                x2[i],
                leo()[i]
            );
            assert!((p2[i][i] / p[i][i] - 1.0).abs() < 1e-6, "{i}");
        }
        assert!(check(&p1).positive_definite);
    }

    #[test]
    fn linear_propagation_agrees_with_monte_carlo_over_a_short_span() {
        let mc = monte_carlo(&leo(), &cov0(), 1_800.0, 20.0, 400, 7).unwrap();
        // 400 draws: a variance ratio scatters by sqrt(2/399) = 7 %; allow four sigma.
        assert!(
            mc.max_variance_ratio_error < 4.0 * mc.variance_sampling_sigma,
            "{}",
            mc.max_variance_ratio_error
        );
        assert!(
            mc.max_correlation_error < 0.2,
            "{}",
            mc.max_correlation_error
        );
    }

    #[test]
    fn realism_of_draws_from_the_stated_covariance() {
        let p = cov0();
        let l = cholesky(&p).unwrap();
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(3);
        let preds: Vec<Prediction> = (0..2000)
            .map(|_| {
                let z: [f64; 6] = std::array::from_fn(|_| StandardNormal.sample(&mut rng));
                let mut r = leo();
                for i in 0..6 {
                    r[i] += (0..=i).map(|k| l[i][k] * z[k]).sum::<f64>();
                }
                Prediction {
                    predicted: leo(),
                    cov: p,
                    reference: r,
                }
            })
            .collect();
        for pos in [true, false] {
            let r = realism(&preds, pos);
            assert!((r.scale_factor - 1.0).abs() < 0.1, "{}", r.scale_factor);
            assert!((r.within_95 - 0.95).abs() < 0.02, "{}", r.within_95);
            assert!(r.ks_distance < 0.05, "{}", r.ks_distance);
        }
        // Halving the stated sigmas makes the covariance optimistic: scale factor near 4.
        let opt: Vec<Prediction> = preds
            .iter()
            .map(|p| {
                let mut c = p.cov;
                c.iter_mut().flatten().for_each(|v| *v /= 4.0);
                Prediction {
                    cov: c,
                    ..p.clone()
                }
            })
            .collect();
        let r = realism(&opt, true);
        assert!((r.scale_factor - 4.0).abs() < 0.4, "{}", r.scale_factor);
    }

    #[test]
    fn chi_square_cdf_at_the_95_percent_points() {
        assert!((chi2_cdf(7.814_727_903, 3) - 0.95).abs() < 1e-8);
        assert!((chi2_cdf(12.591_587_24, 6) - 0.95).abs() < 1e-8);
    }
}
