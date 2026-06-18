// SPDX-License-Identifier: AGPL-3.0-only
//! Adaptive numerical ODE integration: classical RK4 with step-doubling control, and a
//! Dormand–Prince RK5(4) embedded pair.
//!
//! Kshana's orbit propagation is analytic (SGP4/SDP4); this module is the *numerical* propagator's
//! integrator core. It offers two adaptive drivers for any first-order system `y' = f(t, y)` (an
//! orbit force model supplies `f(t, [r; v]) = [v; a(t, r, v)]`):
//!
//! * **Step doubling** ([`integrate`] / [`step_doubling`]) — a generic fixed-step fourth-order
//!   Runge–Kutta step ([`rk4_step`]) with Richardson local-error control: take one step `h` and
//!   two steps `h/2`, compare, and shrink or grow `h` to hold the error near tolerance.
//! * **Dormand–Prince RK5(4)** ([`integrate_dopri`] / [`dopri54_step`]) — the standard embedded
//!   Butcher-tableau pair: seven FSAL stages give a 5th-order solution and a 4th-order error
//!   estimate from one set of evaluations (7 vs 11 function calls per step), a cheaper error
//!   estimate than step doubling.
//!
//! Scope (honest): higher-order embedded pairs (RKF7(8) / DOP853) remain a follow-on
//! (see `ROADMAP.md`); the hierarchical orbit force model that turns this into a propagator lives
//! in [`crate::forces`] / [`crate::propagator`].

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

/// One **Dormand–Prince RK5(4)** embedded step of size `h` from `(t, y)`. Seven stages (FSAL)
/// produce a 5th-order solution `y_next` (the propagated value, local extrapolation) and an
/// embedded 4th-order solution; their difference `y₅ − y₄ = h·Σ eᵢ kᵢ` is the local-error
/// estimate — **one set of stage evaluations gives both orders**, far cheaper than step
/// doubling's three RK4 steps (7 vs 11 function evaluations per step). Returns
/// `(y_next, error_norm, h_next)` with the same RMS-error and `0.9·(1/err)^(1/5)` step controller
/// as [`step_doubling`], so it is a drop-in alternative. Coefficients are the standard
/// Dormand–Prince (1980) tableau.
pub fn dopri54_step<F>(f: &F, t: f64, y: &[f64], h: f64, tol: &Tolerance) -> (Vec<f64>, f64, f64)
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let n = y.len();
    let k1 = f(t, y);
    let y2: Vec<f64> = (0..n).map(|i| y[i] + h * (k1[i] / 5.0)).collect();
    let k2 = f(t + h / 5.0, &y2);
    let y3: Vec<f64> = (0..n)
        .map(|i| y[i] + h * (3.0 / 40.0 * k1[i] + 9.0 / 40.0 * k2[i]))
        .collect();
    let k3 = f(t + 3.0 * h / 10.0, &y3);
    let y4: Vec<f64> = (0..n)
        .map(|i| y[i] + h * (44.0 / 45.0 * k1[i] - 56.0 / 15.0 * k2[i] + 32.0 / 9.0 * k3[i]))
        .collect();
    let k4 = f(t + 4.0 * h / 5.0, &y4);
    let y5: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (19372.0 / 6561.0 * k1[i] - 25360.0 / 2187.0 * k2[i] + 64448.0 / 6561.0 * k3[i]
                    - 212.0 / 729.0 * k4[i])
        })
        .collect();
    let k5 = f(t + 8.0 * h / 9.0, &y5);
    let y6: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (9017.0 / 3168.0 * k1[i] - 355.0 / 33.0 * k2[i]
                    + 46732.0 / 5247.0 * k3[i]
                    + 49.0 / 176.0 * k4[i]
                    - 5103.0 / 18656.0 * k5[i])
        })
        .collect();
    let k6 = f(t + h, &y6);
    // 5th-order solution (b₂ = b₇ = 0); the a₇ row equals these weights, so k₇ = f(t+h, y_next).
    let y_next: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (35.0 / 384.0 * k1[i] + 500.0 / 1113.0 * k3[i] + 125.0 / 192.0 * k4[i]
                    - 2187.0 / 6784.0 * k5[i]
                    + 11.0 / 84.0 * k6[i])
        })
        .collect();
    let k7 = f(t + h, &y_next);
    // Embedded error y₅ − y₄ = h·Σ eᵢ kᵢ, e = b − b* (the standard Dormand–Prince differences).
    let mut err = 0.0_f64;
    for i in 0..n {
        let ei = h
            * (71.0 / 57600.0 * k1[i] - 71.0 / 16695.0 * k3[i] + 71.0 / 1920.0 * k4[i]
                - 17253.0 / 339200.0 * k5[i]
                + 22.0 / 525.0 * k6[i]
                - 1.0 / 40.0 * k7[i]);
        let scale = tol.atol + tol.rtol * y_next[i].abs().max(y[i].abs());
        let r = ei / scale;
        err += r * r;
    }
    err = (err / n as f64).sqrt();
    let factor = if err > 0.0 { 0.9 * err.powf(-0.2) } else { 5.0 };
    let h_next = (h * factor.clamp(0.2, 5.0)).clamp(tol.h_min, tol.h_max);
    (y_next, err, h_next)
}

/// Integrate `y' = f(t, y)` from `t0` to `t_end` with the adaptive **Dormand–Prince RK5(4)**
/// driver ([`dopri54_step`]) — the embedded-pair counterpart of [`integrate`] (which uses step
/// doubling). Same accept/reject logic and exact final-step clipping; returns the same
/// [`Solution`]. For the same tolerance this reaches the endpoint in fewer function evaluations
/// than the step-doubling driver (embedded error estimate vs three RK4 sub-steps).
pub fn integrate_dopri<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
) -> Solution
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
        let (y_next, err, h_next) = dopri54_step(f, t, &y, h, tol);
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

    #[test]
    fn dopri54_adaptive_meets_a_tight_tolerance_on_exponential_growth() {
        // y' = y to t = 1 with the embedded DP5(4) driver lands on e to high accuracy and takes
        // real adaptive steps.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-14,
            ..Tolerance::default()
        };
        let sol = integrate_dopri(&f, 0.0, &[1.0], 1.0, 0.1, &tol);
        assert!((sol.t - 1.0).abs() < 1e-12);
        assert!(
            (sol.y[0] - std::f64::consts::E).abs() < 1e-9,
            "DP5(4) y(1) = {} vs e",
            sol.y[0]
        );
        assert!(
            sol.accepted >= 1,
            "should take real steps: {}",
            sol.accepted
        );
    }

    #[test]
    fn dopri54_embedded_error_estimate_is_fifth_order() {
        // The embedded 4th-order error estimate of the DP5(4) step is O(h⁵): halving the step
        // must cut it by ~2⁵ = 32×. (The tolerance scaling is ~constant across the two steps from
        // the same start, so the normalized-error ratio tracks the raw h⁵ scaling.)
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance::default();
        let (_, e1, _) = dopri54_step(&f, 0.0, &[1.0], 0.2, &tol);
        let (_, e2, _) = dopri54_step(&f, 0.0, &[1.0], 0.1, &tol);
        let ratio = e1 / e2;
        assert!(
            (20.0..=50.0).contains(&ratio),
            "DP5(4) error should scale ~h⁵ (ratio ~32): {ratio}"
        );
    }

    #[test]
    fn dopri54_harmonic_oscillator_conserves_energy_over_many_periods() {
        // y'' = −y over 50 periods at a tight tolerance: DP5(4) keeps energy pos²+vel² ≈ 1 and
        // returns the state to its start — the orbital-motion proxy the propagator relies on.
        let f = |_t: f64, y: &[f64]| vec![y[1], -y[0]];
        let tol = Tolerance {
            rtol: 1e-11,
            atol: 1e-13,
            ..Tolerance::default()
        };
        let t_end = 50.0 * std::f64::consts::TAU;
        let sol = integrate_dopri(&f, 0.0, &[1.0, 0.0], t_end, 0.1, &tol);
        let energy = sol.y[0] * sol.y[0] + sol.y[1] * sol.y[1];
        assert!((energy - 1.0).abs() < 1e-6, "energy drift {energy}");
        assert!(
            (sol.y[0] - 1.0).abs() < 1e-4 && sol.y[1].abs() < 1e-4,
            "state should return to start: {:?}",
            sol.y
        );
    }

    #[test]
    fn dopri54_is_cheaper_than_step_doubling_at_the_same_tolerance() {
        // The whole point of the embedded pair: reach the same endpoint at the same tolerance in
        // fewer function evaluations. DP5(4) is 7 evals/step and (being 5th order) takes fewer
        // steps; step doubling is 11 evals/step. Compare total evals on y' = y to t = 10.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-10,
            atol: 1e-12,
            ..Tolerance::default()
        };
        let sd = integrate(&f, 0.0, &[1.0], 10.0, 0.1, &tol);
        let dp = integrate_dopri(&f, 0.0, &[1.0], 10.0, 0.1, &tol);
        let sd_evals = (sd.accepted + sd.rejected) * 11;
        let dp_evals = (dp.accepted + dp.rejected) * 7;
        assert!(
            dp_evals < sd_evals,
            "DP5(4) {dp_evals} evals should beat step-doubling {sd_evals}"
        );
        // Both must actually be accurate (this isn't cheaper-by-being-wrong).
        for sol in [&sd, &dp] {
            assert!(
                (sol.y[0] - 10.0_f64.exp()).abs() / 10.0_f64.exp() < 1e-7,
                "y(10) = {} vs e¹⁰",
                sol.y[0]
            );
        }
    }
}
