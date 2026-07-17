// SPDX-License-Identifier: AGPL-3.0-only
//! Gauss–Newton weighted batch least squares — the batch differential corrector.
//!
//! This is the estimation core a batch *orbit determination* (or any parameter-fit)
//! uses: given measurements `z` that depend on an unknown state `x` through a model
//! `h(x)`, it linearises `h` about the current estimate (a finite-difference Jacobian
//! `H = ∂h/∂x`), forms and solves the weighted normal equations
//! `(HᵀWH)·Δx = HᵀW·(z − h(x))`, and iterates to convergence.
//!
//! It is deliberately generic over the model closure, so it is independent of any
//! particular measurement set. For orbit determination the state would be the
//! satellite epoch state (and a receiver clock bias) and `h` the range / range-rate /
//! azimuth-elevation model from a ground station; here the engine and its convergence
//! are delivered and tested, while the orbit-specific measurement model, the analytic
//! state-transition matrix, and the published-case validation are follow-ons
//! (see `ROADMAP.md`).
//!
//! **References.** The weighted-normal-equation batch corrector is the standard
//! batch processor of Tapley, Schutz & Born, *Statistical Orbit Determination*
//! (2004), §4; the underlying Gauss–Newton / weighted-least-squares numerics follow
//! Björck, *Numerical Methods for Least Squares Problems* (1996).

use crate::fusion::ukf::inverse;

/// The outcome of a batch least-squares solve.
#[derive(Clone, Debug)]
pub struct LsqResult {
    /// Converged (or last) state estimate.
    pub x: Vec<f64>,
    /// Iterations actually run.
    pub iterations: usize,
    /// RMS of the post-fit measurement residual `z − h(x)`.
    pub rms_residual: f64,
    /// `true` when the step norm fell below `tol` before `max_iter`.
    pub converged: bool,
}

/// Central finite-difference Jacobian `H` (`m × n`) of `h` at `x`.
fn fd_jacobian<H>(h: &H, x: &[f64], m: usize) -> Vec<Vec<f64>>
where
    H: Fn(&[f64]) -> Vec<f64>,
{
    let n = x.len();
    let mut jac = vec![vec![0.0; n]; m];
    for (p, &xp_val) in x.iter().enumerate() {
        let step = 1e-6 * xp_val.abs().max(1.0);
        let mut xp = x.to_vec();
        let mut xm = x.to_vec();
        xp[p] += step;
        xm[p] -= step;
        let hp = h(&xp);
        let hm = h(&xm);
        for i in 0..m {
            jac[i][p] = (hp[i] - hm[i]) / (2.0 * step);
        }
    }
    jac
}

/// Solve `z ≈ h(x)` by Gauss–Newton iteration with per-measurement weights
/// `weights` (e.g. `1/σ²`), starting from `x0`. Returns `None` on a dimension
/// mismatch or a singular normal matrix (rank-deficient geometry).
///
/// For a *linear* model `h(x) = Ax` this reaches the exact weighted-least-squares
/// solution `(AᵀWA)⁻¹AᵀWz` in a single step (the second iteration then confirms a
/// zero update); for a nonlinear model it converges quadratically near the solution.
pub fn gauss_newton<H>(
    h: H,
    z: &[f64],
    weights: &[f64],
    x0: &[f64],
    max_iter: usize,
    tol: f64,
) -> Option<LsqResult>
where
    H: Fn(&[f64]) -> Vec<f64>,
{
    let n = x0.len();
    let m = z.len();
    if weights.len() != m || n == 0 || m < n {
        return None;
    }
    let mut x = x0.to_vec();
    let mut iterations = 0;
    let mut converged = false;
    for it in 0..max_iter {
        iterations = it + 1;
        let hx = h(&x);
        if hx.len() != m {
            return None;
        }
        let r: Vec<f64> = (0..m).map(|i| z[i] - hx[i]).collect();
        let jac = fd_jacobian(&h, &x, m);
        // Weighted normal equations: a = HᵀWH (n×n), b = HᵀW r (n).
        let mut a = vec![vec![0.0; n]; n];
        let mut b = vec![0.0; n];
        for i in 0..m {
            let w = weights[i];
            for p in 0..n {
                b[p] += jac[i][p] * w * r[i];
                for q in 0..n {
                    a[p][q] += jac[i][p] * w * jac[i][q];
                }
            }
        }
        let a_inv = inverse(&a)?;
        let dx: Vec<f64> = (0..n)
            .map(|p| (0..n).map(|q| a_inv[p][q] * b[q]).sum())
            .collect();
        for (xp, &d) in x.iter_mut().zip(&dx) {
            *xp += d;
        }
        let dx_norm = dx.iter().map(|v| v * v).sum::<f64>().sqrt();
        if dx_norm < tol {
            converged = true;
            break;
        }
    }
    let hx = h(&x);
    let rms = (z
        .iter()
        .zip(&hx)
        .map(|(&zi, &hi)| (zi - hi).powi(2))
        .sum::<f64>()
        / m as f64)
        .sqrt();
    Some(LsqResult {
        x,
        iterations,
        rms_residual: rms,
        converged,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn linear_line_fit_recovers_exact_solution() {
        // Fit y = a + b·t to points exactly on the line a=2, b=3. A linear model must
        // reach the exact weighted-least-squares answer (residual 0).
        let ts = [0.0, 1.0, 2.0, 3.0, 4.0];
        let z: Vec<f64> = ts.iter().map(|&t| 2.0 + 3.0 * t).collect();
        let w = vec![1.0; ts.len()];
        let model = move |x: &[f64]| ts.iter().map(|&t| x[0] + x[1] * t).collect::<Vec<_>>();
        let r = gauss_newton(model, &z, &w, &[0.0, 0.0], 10, 1e-12).expect("solves");
        assert!((r.x[0] - 2.0).abs() < 1e-9, "a = {}", r.x[0]);
        assert!((r.x[1] - 3.0).abs() < 1e-9, "b = {}", r.x[1]);
        assert!(r.rms_residual < 1e-9 && r.converged);
    }

    #[test]
    fn nonlinear_exponential_fit_converges() {
        // Fit y = a·exp(b·t); recover a=1.5, b=0.5 from noise-free samples.
        let ts = [0.0f64, 0.5, 1.0, 1.5, 2.0, 2.5];
        let z: Vec<f64> = ts.iter().map(|&t| 1.5 * (0.5 * t).exp()).collect();
        let w = vec![1.0; ts.len()];
        let model = move |x: &[f64]| {
            ts.iter()
                .map(|&t| x[0] * (x[1] * t).exp())
                .collect::<Vec<_>>()
        };
        let r = gauss_newton(model, &z, &w, &[1.0, 1.0], 50, 1e-12).expect("solves");
        assert!((r.x[0] - 1.5).abs() < 1e-6, "a = {}", r.x[0]);
        assert!((r.x[1] - 0.5).abs() < 1e-6, "b = {}", r.x[1]);
        assert!(r.rms_residual < 1e-6, "rms = {}", r.rms_residual);
    }

    #[test]
    fn range_multilateration_recovers_a_known_position() {
        // Orbit-determination flavour: recover a 3-D position from ranges to four known
        // stations. Noise-free measurements ⇒ exact recovery (residual ≈ 0).
        let stations = [
            [0.0, 0.0, 0.0],
            [1000.0, 0.0, 0.0],
            [0.0, 1000.0, 0.0],
            [0.0, 0.0, 1000.0],
            [1000.0, 1000.0, 1000.0],
        ];
        let truth = [350.0, -120.0, 640.0];
        let range = |s: &[f64; 3], p: &[f64]| {
            ((p[0] - s[0]).powi(2) + (p[1] - s[1]).powi(2) + (p[2] - s[2]).powi(2)).sqrt()
        };
        let z: Vec<f64> = stations.iter().map(|s| range(s, &truth)).collect();
        let w = vec![1.0; stations.len()];
        let model = move |x: &[f64]| stations.iter().map(|s| range(s, x)).collect::<Vec<_>>();
        let r = gauss_newton(model, &z, &w, &[0.0, 0.0, 0.0], 50, 1e-10).expect("solves");
        for (k, (&got, &want)) in r.x.iter().zip(&truth).enumerate() {
            assert!((got - want).abs() < 1e-4, "x[{k}] = {got} vs {want}");
        }
        assert!(r.rms_residual < 1e-4, "rms = {}", r.rms_residual);
    }

    #[test]
    fn rejects_underdetermined_or_mismatched_inputs() {
        let model = |x: &[f64]| vec![x[0], x[0] + x[1]];
        // Fewer measurements than unknowns (m < n).
        assert!(gauss_newton(model, &[1.0], &[1.0], &[0.0, 0.0], 5, 1e-9).is_none());
        // Weight/measurement length mismatch.
        assert!(gauss_newton(model, &[1.0, 2.0], &[1.0], &[0.0, 0.0], 5, 1e-9).is_none());
    }
}
