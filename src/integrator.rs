// SPDX-License-Identifier: Apache-2.0
//! Adaptive numerical ODE integration (classical RK4 with step-doubling control).
//!
//! Kshana's orbit propagation is analytic (SGP4/SDP4). This module adds the first
//! piece of a *numerical* propagator: a generic fixed-step fourth-order Runge–Kutta
//! step and an adaptive driver that controls local error by **step doubling**
//! (Richardson extrapolation) — take one step `h` and two steps `h/2`, compare, and
//! shrink or grow `h` to hold the error near a tolerance. It integrates any
//! first-order system `y' = f(t, y)`, so an orbit force model would supply
//! `f(t, [r; v]) = [v; a(r, v)]`.
//!
//! Scope (honest): this is the integrator core and its error control. The
//! Dormand–Prince RK5(4) / RKF7(8) embedded Butcher-tableau pairs (cheaper error
//! estimates than step doubling), and the hierarchical orbit force model
//! (two-body + J2–J6 + drag + SRP + third-body) that turns it into a
//! `NumericalPropagator`, are follow-ons (see `ROADMAP.md`).

/// One classical fourth-order Runge–Kutta step of size `h` from `(t, y)` for the
/// system `y' = f(t, y)`. The state is any fixed-length vector.
pub fn rk4_step<F>(f: &F, t: f64, y: &[f64], h: f64) -> Vec<f64>
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let n = y.len();
    let k1 = f(t, y);
    let y2: Vec<f64> = (0..n).map(|i| y[i] + 0.5 * h * k1[i]).collect();
    let k2 = f(t + 0.5 * h, &y2);
    let y3: Vec<f64> = (0..n).map(|i| y[i] + 0.5 * h * k2[i]).collect();
    let k3 = f(t + 0.5 * h, &y3);
    let y4: Vec<f64> = (0..n).map(|i| y[i] + h * k3[i]).collect();
    let k4 = f(t + h, &y4);
    (0..n)
        .map(|i| y[i] + (h / 6.0) * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]))
        .collect()
}

/// Tolerances and step bounds for the adaptive driver.
#[derive(Clone, Copy, Debug)]
pub struct Tolerance {
    /// Relative tolerance per component.
    pub rtol: f64,
    /// Absolute tolerance per component (guards components passing through zero).
    pub atol: f64,
    /// Smallest step the controller will take before giving up.
    pub h_min: f64,
    /// Largest step the controller will take.
    pub h_max: f64,
}

impl Default for Tolerance {
    fn default() -> Self {
        Self {
            rtol: 1e-9,
            atol: 1e-12,
            h_min: 1e-12,
            h_max: f64::INFINITY,
        }
    }
}

/// One adaptive step by step doubling. Computes a full step `h` and two half steps,
/// estimates the local error from their difference (the two-half-step result is the
/// returned, more accurate, state), and proposes the next step size. Returns
/// `(y_next, error_norm, h_next)`.
///
/// For a 4th-order method the two-half-step error is ~`1/15` of the full-vs-half
/// difference; the next step targets the tolerance with the standard `0.9·(tol/err)^(1/5)`
/// controller (5 = order + 1), clamped to a 0.2×–5× change and the `[h_min, h_max]` bounds.
pub fn step_doubling<F>(f: &F, t: f64, y: &[f64], h: f64, tol: &Tolerance) -> (Vec<f64>, f64, f64)
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let big = rk4_step(f, t, y, h);
    let half = rk4_step(f, t, y, 0.5 * h);
    let two_half = rk4_step(f, t + 0.5 * h, &half, 0.5 * h);
    // Richardson local-error estimate: (two_half − big) / (2^p − 1), p = 4.
    let mut err = 0.0_f64;
    for i in 0..y.len() {
        let diff = (two_half[i] - big[i]) / 15.0;
        let scale = tol.atol + tol.rtol * two_half[i].abs().max(y[i].abs());
        let r = diff / scale;
        err += r * r;
    }
    err = (err / y.len() as f64).sqrt();
    // Step controller: grow when err < 1, shrink when err > 1.
    let factor = if err > 0.0 { 0.9 * err.powf(-0.2) } else { 5.0 };
    let h_next = (h * factor.clamp(0.2, 5.0)).clamp(tol.h_min, tol.h_max);
    (two_half, err, h_next)
}

/// The outcome of an adaptive integration.
#[derive(Clone, Debug)]
pub struct Solution {
    /// Final time reached.
    pub t: f64,
    /// Final state.
    pub y: Vec<f64>,
    /// Number of accepted steps.
    pub accepted: usize,
    /// Number of rejected (error-too-large) steps.
    pub rejected: usize,
}

/// Integrate `y' = f(t, y)` from `t0` to `t_end` with adaptive step-doubling control,
/// starting from step `h0`. Steps that exceed the tolerance are rejected and retried
/// with the smaller proposed step; the final step is clipped exactly to `t_end`.
pub fn integrate<F>(f: &F, t0: f64, y0: &[f64], t_end: f64, h0: f64, tol: &Tolerance) -> Solution
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let mut t = t0;
    let mut y = y0.to_vec();
    let mut h = h0.max(tol.h_min).min(tol.h_max);
    let (mut accepted, mut rejected) = (0, 0);
    while t < t_end {
        if t + h > t_end {
            h = t_end - t;
        }
        let (y_next, err, h_next) = step_doubling(f, t, &y, h, tol);
        if err <= 1.0 || h <= tol.h_min {
            t += h;
            y = y_next;
            accepted += 1;
            h = h_next;
        } else {
            rejected += 1;
            h = h_next;
        }
    }
    Solution {
        t,
        y,
        accepted,
        rejected,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rk4_integrates_exponential_growth() {
        // y' = y, y(0) = 1 → y(1) = e. RK4 with a small fixed step is near-exact.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let mut y = vec![1.0];
        let h = 0.001;
        let mut t = 0.0;
        while t < 1.0 - 1e-9 {
            y = rk4_step(&f, t, &y, h);
            t += h;
        }
        assert!((y[0] - std::f64::consts::E).abs() < 1e-9, "y(1) = {}", y[0]);
    }

    #[test]
    fn rk4_is_fourth_order() {
        // Halving the step must cut the global error of a 4th-order method ~16×.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let err_at = |h: f64| {
            let mut y = vec![1.0];
            let mut t = 0.0;
            let steps = (1.0 / h).round() as usize;
            for _ in 0..steps {
                y = rk4_step(&f, t, &y, h);
                t += h;
            }
            (y[0] - std::f64::consts::E).abs()
        };
        let ratio = err_at(0.05) / err_at(0.025);
        assert!((12.0..20.0).contains(&ratio), "4th-order ratio = {ratio}");
    }

    #[test]
    fn harmonic_oscillator_conserves_energy() {
        // y'' = −y as [pos, vel]' = [vel, −pos]; energy pos² + vel² is invariant.
        let f = |_t: f64, y: &[f64]| vec![y[1], -y[0]];
        let mut y = vec![1.0, 0.0]; // E = 1
                                    // Step exactly one period 2π with a step that divides it evenly, so the state
                                    // must return to the start (not stop a fraction of a step past 2π).
        let n_steps = 10_000usize;
        let h = std::f64::consts::TAU / n_steps as f64;
        let mut t = 0.0;
        for _ in 0..n_steps {
            y = rk4_step(&f, t, &y, h);
            t += h;
        }
        // After one full period the state returns to the start, energy preserved.
        let energy = y[0] * y[0] + y[1] * y[1];
        assert!((energy - 1.0).abs() < 1e-8, "energy drift {energy}");
        assert!(
            (y[0] - 1.0).abs() < 1e-6 && y[1].abs() < 1e-6,
            "state {:?}",
            y
        );
    }

    #[test]
    fn adaptive_integration_meets_tolerance_with_variable_steps() {
        // y' = y to t = 1 at a tight tolerance must land near e and take >1 step.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-10,
            atol: 1e-12,
            ..Tolerance::default()
        };
        let sol = integrate(&f, 0.0, &[1.0], 1.0, 0.1, &tol);
        assert!((sol.t - 1.0).abs() < 1e-12);
        assert!(
            (sol.y[0] - std::f64::consts::E).abs() < 1e-8,
            "y = {}",
            sol.y[0]
        );
        assert!(
            sol.accepted >= 1,
            "should take real steps: {}",
            sol.accepted
        );
    }

    #[test]
    fn adaptive_takes_larger_steps_on_an_easy_problem() {
        // A near-constant slope (y' = small) needs fewer steps than a stiff growth at
        // the same tolerance — the controller must adapt, not march at the initial h.
        let easy = integrate(
            &|_t, _y| vec![0.01],
            0.0,
            &[0.0],
            10.0,
            0.01,
            &Tolerance::default(),
        );
        let hard = integrate(
            &|_t, y: &[f64]| vec![y[0]],
            0.0,
            &[1.0],
            10.0,
            0.01,
            &Tolerance::default(),
        );
        assert!(
            easy.accepted < hard.accepted,
            "easy {} should need fewer steps than hard {}",
            easy.accepted,
            hard.accepted
        );
    }

    #[test]
    fn step_doubling_error_estimate_shrinks_with_step() {
        // The local error estimate of a 4th-order step scales ~h⁵: a 2× smaller step
        // gives a much smaller estimate.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance::default();
        let (_, e1, _) = step_doubling(&f, 0.0, &[1.0], 0.2, &tol);
        let (_, e2, _) = step_doubling(&f, 0.0, &[1.0], 0.1, &tol);
        assert!(
            e2 < e1,
            "smaller step should have smaller error: {e2} !< {e1}"
        );
    }
}
