// SPDX-License-Identifier: AGPL-3.0-only
//! A robust solver for the elliptic **Kepler equation** `M = E − e·sin E`, shared by new code.
//!
//! The solver ([`solve_kepler_markley`]) is valid for every `0 ≤ e < 1` and every finite `M`:
//!
//! 1. `M` is reduced to `[−π, π]` (a value already there is used as is) and the odd symmetry
//!    `E(−M) = −E(M)` folds it to `[0, π]`.
//! 2. **Markley's starter** (F. L. Markley, "Kepler equation solver", *Celestial Mechanics and
//!    Dynamical Astronomy* 63, 101–111, 1995): a rational approximation of `sin E` turns the
//!    equation into a cubic, solved in closed form, followed by Markley's single fifth-order
//!    (Householder-type) correction. The paper reports this reaches close to double-precision
//!    accuracy everywhere without iteration.
//! 3. **Newton polishing** to a few units in the last place: at most [`MAX_POLISH`] steps, each
//!    stopping once the correction is below `4ε·|E|`. The checked solver returns `Err` if that
//!    does not happen, never a silently wrong `E`.
//!
//! **Accuracy near the parabolic limit.** For `e → 1` and `M → 0` the root is ill-conditioned in
//! the naive residual `E − e·sin E − M`: its two large terms cancel, so their rounding error
//! (`~ε·|E|`) swamps `M`. The residual is therefore evaluated as
//! `(1 − e)·E + e·(E − sin E) − M` for `e ≥ 0.5` (where `1 − e` is exact), with `E − sin E` from
//! its Taylor series for `|E| < 0.75`, and the derivative as `(1 − e) + 2e·sin²(E/2)`. Both terms
//! of `M` then carry their own sign-consistent relative accuracy, and since
//! `M ≤ E·(1 − e·cos E)` on `[0, π]` a residual accurate to `~ε·|M|` bounds the root's error at
//! `~ε·|E|` — a relative accuracy of a few ulps in `E` across the whole domain, including
//! `e = 0.999999` with `M = 1e-12`.
//!
//! **Legacy solvers.** [`crate::propagator::solve_kepler_checked`] (Newton from `E₀ = M`, the
//! convergence-guard demonstration), `crate::orbit::solve_kepler` and [`crate::ephem::solve_kepler`]
//! are kept unchanged because committed goldens depend on their exact outputs; new code should use
//! this module ([`crate::propagator::solve_kepler_robust`] is the propagator-facing wrapper).

use crate::portable_math::PortableFloat;
use std::f64::consts::{PI, TAU};

/// Newton polishing steps allowed after Markley's starter and correction.
pub const MAX_POLISH: usize = 4;

/// The outcome of [`solve_kepler_markley`].
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct KeplerSolution {
    /// The eccentric anomaly `E` (rad), with the same `2π` winding as the input `M`.
    pub ecc_anomaly: f64,
    /// Newton polishing steps taken after Markley's starter and fifth-order correction.
    pub iterations: usize,
    /// The final residual `(1 − e)E + e(E − sin E) − M` for the reduced `M` (rad).
    pub residual: f64,
}

/// Why [`solve_kepler_markley`] gave no answer.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum KeplerError {
    /// `M` is not finite, or `e` is outside `[0, 1)` or not finite.
    InvalidInput,
    /// The Newton correction was still above `4ε·|E|` after [`MAX_POLISH`] steps.
    NonConvergence {
        /// The residual at the last iterate (rad).
        residual: f64,
        /// Polishing steps spent.
        iters: usize,
    },
}

impl core::fmt::Display for KeplerError {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        match self {
            KeplerError::InvalidInput => write!(f, "Kepler equation: M or e out of domain"),
            KeplerError::NonConvergence { residual, iters } => write!(
                f,
                "Kepler equation did not converge in {iters} steps (residual {residual:e})"
            ),
        }
    }
}

impl std::error::Error for KeplerError {}

/// `E − sin E`, accurate to a few ulps relative for every `E` (Taylor series for `|E| < 0.75`,
/// where the direct difference cancels).
pub fn e_minus_sin_e(ea: f64) -> f64 {
    if ea.abs() < 0.75 {
        // Σ_{k≥1} (−1)^{k+1} E^{2k+1}/(2k+1)!, summed smallest-first for accuracy.
        let x2 = ea * ea;
        let mut terms = [0.0_f64; 11];
        let mut term = ea * x2 / 6.0; // E³/3!
        for (k, slot) in terms.iter_mut().enumerate() {
            *slot = term;
            let n = 2.0 * (k as f64) + 4.0; // next factorial factors (2k+4)(2k+5)
            term *= -x2 / (n * (n + 1.0));
        }
        terms.iter().rev().sum()
    } else {
        ea - ea.psin()
    }
}

/// The Kepler residual `E − e·sin E − M`, evaluated in the cancellation-free form
/// `(1 − e)·E + e·(E − sin E) − M` when `e ≥ 0.5` (see the module notes).
pub fn kepler_residual(ea: f64, e: f64, m: f64) -> f64 {
    if e >= 0.5 {
        (1.0 - e) * ea + e * e_minus_sin_e(ea) - m
    } else {
        ea - e * ea.psin() - m
    }
}

/// `dM/dE = 1 − e·cos E`, as `(1 − e) + 2e·sin²(E/2)` (no cancellation near `E = 0`, `e → 1`).
fn kepler_derivative(ea: f64, e: f64) -> f64 {
    let s = (0.5 * ea).psin();
    (1.0 - e) + 2.0 * e * s * s
}

/// Markley's (1995) cubic starter for `0 ≤ M ≤ π`, followed by his fifth-order correction.
fn markley_start(m: f64, e: f64) -> f64 {
    let pi2 = PI * PI;
    let alpha = (3.0 * pi2 + 1.6 * PI * (PI - m) / (1.0 + e)) / (pi2 - 6.0);
    let d = 3.0 * (1.0 - e) + alpha * e;
    let q = 2.0 * alpha * d * (1.0 - e) - m * m;
    let r = 3.0 * alpha * d * (d - 1.0 + e) * m + m * m * m;
    let w = (r.abs() + (q * q * q + r * r).sqrt()).ppowf(2.0 / 3.0);
    let denom = w * w + w * q + q * q;
    let e1 = if denom > 0.0 {
        (2.0 * r * w / denom + m) / d
    } else {
        m / d
    };
    // Fifth-order correction (Markley eqs. 29–32), on the accurate residual and derivative.
    let f0 = kepler_residual(e1, e, m);
    let f1 = kepler_derivative(e1, e);
    let f2 = e * e1.psin();
    let f3 = 1.0 - f1;
    let f4 = -f2;
    let d3 = -f0 / (f1 - 0.5 * f0 * f2 / f1);
    let d4 = -f0 / (f1 + 0.5 * d3 * f2 + d3 * d3 * f3 / 6.0);
    let d5 = -f0 / (f1 + 0.5 * d4 * f2 + d4 * d4 * f3 / 6.0 + d4 * d4 * d4 * f4 / 24.0);
    let ea = e1 + d5;
    if ea.is_finite() {
        ea
    } else {
        // Not reached for valid inputs; a safe bracket-interior start keeps Newton honest.
        m + e
    }
}

/// Solve `M = E − e·sin E` for the eccentric anomaly `E` (rad), for any finite `M` and
/// `0 ≤ e < 1`: Markley's (1995) starter and fifth-order correction, then Newton polishing to a
/// few ulps. Returns `Err` on invalid input or (never observed) non-convergence.
pub fn solve_kepler_markley(m: f64, e: f64) -> Result<KeplerSolution, KeplerError> {
    if !m.is_finite() || !e.is_finite() || !(0.0..1.0).contains(&e) {
        return Err(KeplerError::InvalidInput);
    }
    // Reduce to [−π, π] (a value already in range is used exactly).
    let (m_red, winds) = if m.abs() <= PI {
        (m, 0.0)
    } else {
        let k = (m / TAU).round();
        let mr = m - k * TAU;
        (mr.clamp(-PI, PI), k)
    };
    let sign = if m_red < 0.0 { -1.0 } else { 1.0 };
    let ma = m_red.abs();
    if e == 0.0 || ma == 0.0 {
        return Ok(KeplerSolution {
            ecc_anomaly: m_red + winds * TAU,
            iterations: 0,
            residual: 0.0,
        });
    }
    let mut ea = markley_start(ma, e).clamp(0.0, PI);
    let mut iterations = 0;
    let mut converged = false;
    for _ in 0..MAX_POLISH {
        let f0 = kepler_residual(ea, e, ma);
        let delta = -f0 / kepler_derivative(ea, e);
        if !delta.is_finite() {
            break;
        }
        if delta.abs() <= 4.0 * f64::EPSILON * ea.abs() {
            converged = true;
            break;
        }
        ea += delta;
        iterations += 1;
    }
    let residual = kepler_residual(ea, e, ma);
    if !converged || !ea.is_finite() {
        return Err(KeplerError::NonConvergence {
            residual: residual.abs(),
            iters: iterations,
        });
    }
    Ok(KeplerSolution {
        ecc_anomaly: sign * ea + winds * TAU,
        iterations,
        residual: sign * residual,
    })
}

/// [`solve_kepler_markley`]'s eccentric anomaly, or `NaN` on invalid input / non-convergence
/// (fail closed).
pub fn eccentric_anomaly(m: f64, e: f64) -> f64 {
    solve_kepler_markley(m, e).map_or(f64::NAN, |s| s.ecc_anomaly)
}

#[cfg(test)]
mod tests {
    use super::*;

    const ES: [f64; 9] = [0.0, 1e-6, 0.1, 0.5, 0.9, 0.99, 0.999, 0.9999, 0.999999];

    fn m_grid() -> Vec<f64> {
        let mut g = vec![1e-12, 1e-6, 1e-3, PI - 1e-6, PI];
        for k in 0..=64 {
            g.push(PI * k as f64 / 64.0);
        }
        g
    }

    #[test]
    fn e_minus_sin_e_matches_the_direct_form_where_both_are_accurate() {
        for &x in &[0.5_f64, 0.7, 0.749_999] {
            let direct = x - x.psin();
            // The direct difference itself carries ~ε·x/(x³/6) ≤ 24ε relative error here.
            assert!((e_minus_sin_e(x) - direct).abs() < 1e-14 * direct.abs());
        }
        // Small argument: leading term E³/6.
        let x = 1e-5_f64;
        assert!((e_minus_sin_e(x) / (x * x * x / 6.0) - 1.0).abs() < 1e-9);
        assert_eq!(e_minus_sin_e(0.0), 0.0);
        assert_eq!(e_minus_sin_e(-0.3), -e_minus_sin_e(0.3));
    }

    #[test]
    fn converges_across_the_grid_with_a_tiny_relative_residual() {
        for &e in &ES {
            for &m in &m_grid() {
                for s in [1.0, -1.0] {
                    let sol = solve_kepler_markley(s * m, e).expect("converges");
                    let ea = sol.ecc_anomaly;
                    assert!(
                        sol.iterations <= 2,
                        "e {e} M {m}: {} iterations",
                        sol.iterations
                    );
                    // M ≤ E(1 − e cos E): the residual relative to E·f'(E) is a few ulps.
                    let scale = ea.abs() * kepler_derivative(ea, e);
                    let r = kepler_residual(ea, e, s * m).abs();
                    assert!(
                        r <= 8.0 * f64::EPSILON * scale.max(f64::MIN_POSITIVE),
                        "e {e} M {m}: residual {r:e} scale {scale:e}"
                    );
                    assert!(ea * s >= 0.0 && ea.abs() <= PI);
                }
            }
        }
    }

    #[test]
    fn winds_and_validates_input() {
        let a = solve_kepler_markley(1.0, 0.3).unwrap().ecc_anomaly;
        let b = solve_kepler_markley(1.0 + 4.0 * TAU, 0.3)
            .unwrap()
            .ecc_anomaly;
        assert!((b - a - 4.0 * TAU).abs() < 1e-13);
        let c = solve_kepler_markley(1.0 - 3.0 * TAU, 0.3)
            .unwrap()
            .ecc_anomaly;
        assert!((c - a + 3.0 * TAU).abs() < 1e-13);
        assert_eq!(
            solve_kepler_markley(f64::NAN, 0.3),
            Err(KeplerError::InvalidInput)
        );
        assert_eq!(
            solve_kepler_markley(1.0, 1.0),
            Err(KeplerError::InvalidInput)
        );
        assert_eq!(
            solve_kepler_markley(1.0, -0.1),
            Err(KeplerError::InvalidInput)
        );
        assert!(eccentric_anomaly(1.0, 1.5).is_nan());
        assert_eq!(solve_kepler_markley(0.7, 0.0).unwrap().ecc_anomaly, 0.7);
    }

    #[test]
    fn succeeds_where_the_legacy_checked_solver_reports_non_convergence() {
        // propagator::solve_kepler_checked fails at e = 0.999, M = 0.3 (the guard's own test).
        assert!(crate::propagator::solve_kepler_checked(0.3, 0.999, 30).is_err());
        let sol = solve_kepler_markley(0.3, 0.999).unwrap();
        assert!(kepler_residual(sol.ecc_anomaly, 0.999, 0.3).abs() < 1e-15);
    }
}
