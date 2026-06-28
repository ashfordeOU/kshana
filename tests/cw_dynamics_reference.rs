// SPDX-License-Identifier: AGPL-3.0-only
//! Reference tests for Clohessy–Wiltshire / Hill relative-motion dynamics
//! (`kshana::cw_dynamics`).
//!
//! These are **internal-consistency** oracles, not an external dataset:
//!
//! (i)   the closed-form state-transition matrix `Φ(n,t)` reproduces an *independent*
//!       fixed-step RK4 integration of the same Hill ODEs to the RK4 truncation budget;
//! (ii)  `Φ(n,t)·Φ(n,−t) = I` (the flow is invertible / time-reversible);
//! (iii) the bounded-orbit condition `ẏ₀ = −2 n x₀` (with `ẋ₀ = 0`) yields a closed
//!       relative orbit — the full state returns to its start after one period `T`;
//! (iv)  a pure radial offset drifts along-track by the analytic `−12π x₀` per orbit,
//!       distinguishing the unbounded case from the bounded one.
//!
//! Tolerances are stated per assertion and are integrator-truncation / round-off
//! budgets, not measurement uncertainties — this is a MODELLED capability.

use kshana::cw_dynamics::{
    apply, bounded_along_track_rate, mean_motion, propagate, rate, stm, State6,
};
use std::f64::consts::PI;

/// Independent oracle: classical RK4 of the Hill ODEs over `steps` steps of `dt`.
fn rk4(n: f64, s0: &State6, dt: f64, steps: usize) -> State6 {
    let mut s = *s0;
    let add = |a: &State6, k: &State6, h: f64| -> State6 {
        let mut o = [0.0; 6];
        for i in 0..6 {
            o[i] = a[i] + h * k[i];
        }
        o
    };
    for _ in 0..steps {
        let k1 = rate(n, &s);
        let k2 = rate(n, &add(&s, &k1, 0.5 * dt));
        let k3 = rate(n, &add(&s, &k2, 0.5 * dt));
        let k4 = rate(n, &add(&s, &k3, dt));
        for i in 0..6 {
            s[i] += dt / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
        }
    }
    s
}

fn max_abs_diff(a: &State6, b: &State6) -> f64 {
    (0..6).map(|i| (a[i] - b[i]).abs()).fold(0.0, f64::max)
}

#[test]
fn closed_form_stm_matches_independent_numeric_integration() {
    // LEO-ish reference orbit (a ≈ 7000 km) → n ≈ 1.08e-3 rad/s.
    let n = mean_motion(3.986_004_418e14, 7.0e6);
    let s0: State6 = [25.0, -40.0, 15.0, 0.05, 0.12, -0.03];
    // Propagate ~a third of an orbit; fine RK4 step so truncation is tiny.
    let t = 0.30 * (2.0 * PI / n);
    let steps = 60_000;
    let dt = t / steps as f64;

    let analytic = propagate(n, t, &s0);
    let numeric = rk4(n, &s0, dt, steps);
    let d = max_abs_diff(&analytic, &numeric);
    assert!(
        d < 1e-6,
        "closed-form Φ disagrees with independent RK4 by {d} (state {analytic:?} vs {numeric:?})"
    );
}

#[test]
fn stm_is_time_reversible() {
    // Φ(t)·Φ(−t) must be the identity for any n, t.
    let n = 0.0011;
    let t = 900.0;
    let fwd = stm(n, t);
    let bwd = stm(n, -t);
    // product P = fwd · bwd
    let mut p = [[0.0f64; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            let mut acc = 0.0;
            for k in 0..6 {
                acc += fwd[i][k] * bwd[k][j];
            }
            p[i][j] = acc;
        }
    }
    for (i, row) in p.iter().enumerate() {
        for (j, &val) in row.iter().enumerate() {
            let expected = if i == j { 1.0 } else { 0.0 };
            assert!(
                (val - expected).abs() < 1e-9,
                "Φ(t)Φ(−t)[{i}][{j}] = {val} (expected {expected})"
            );
        }
    }
}

#[test]
fn bounded_orbit_condition_closes_after_one_period() {
    // With ẏ₀ = −2 n x₀ and ẋ₀ = 0 the in-plane orbit is bounded; cross-track is SHM
    // with the same period — so the whole state returns to its start after T.
    let n = 0.0011;
    let x0 = 30.0;
    let s0: State6 = [x0, -12.0, 8.0, 0.0, bounded_along_track_rate(n, x0), 0.05];
    let period = 2.0 * PI / n;
    let after = propagate(n, period, &s0);
    let d = max_abs_diff(&after, &s0);
    assert!(
        d < 1e-9,
        "bounded relative orbit did not close after one period: |Δ| = {d} ({after:?} vs {s0:?})"
    );
}

#[test]
fn bounded_orbit_has_no_secular_along_track_drift() {
    // Sample along-track position over several orbits; with the bounded condition it
    // must stay within the ellipse envelope (no linear growth).
    let n = 0.0011;
    let x0 = 20.0;
    let s0: State6 = [x0, 0.0, 0.0, 0.0, bounded_along_track_rate(n, x0), 0.0];
    let period = 2.0 * PI / n;
    // |y| is bounded by 2·|semi-major of the 2:1 ellipse| ~ a few × x0; assert it never
    // grows past a generous envelope across 10 orbits.
    let envelope = 6.0 * x0.abs();
    for k in 0..=1000 {
        let t = 10.0 * period * (k as f64 / 1000.0);
        let y = propagate(n, t, &s0)[1];
        assert!(
            y.abs() <= envelope,
            "bounded orbit drifted: |y|={} > envelope {envelope} at t={t}",
            y.abs()
        );
    }
}

#[test]
fn pure_radial_offset_drifts_minus_twelve_pi_x0_per_orbit() {
    // A pure radial offset (zero relative velocity) is the canonical UNbounded case:
    // the along-track displacement after one orbit is the analytic −12π x₀.
    let n = 0.0011;
    let x0 = 10.0;
    let s0: State6 = [x0, 0.0, 0.0, 0.0, 0.0, 0.0];
    let period = 2.0 * PI / n;
    let y_after = propagate(n, period, &s0)[1];
    let expected = -12.0 * PI * x0;
    assert!(
        (y_after - expected).abs() < 1e-6,
        "radial-offset along-track drift {y_after} != analytic {expected}"
    );
    // And it really is unbounded: the drift grows each orbit.
    let y_two = propagate(n, 2.0 * period, &s0)[1];
    assert!(
        (y_two - 2.0 * expected).abs() < 1e-5,
        "drift not linear across orbits: {y_two} != {}",
        2.0 * expected
    );
}

#[test]
fn propagate_agrees_with_explicit_stm_application() {
    let n = 0.0009;
    let s0: State6 = [1.0, 2.0, 3.0, 0.01, -0.02, 0.03];
    let t = 555.0;
    let a = propagate(n, t, &s0);
    let b = apply(&stm(n, t), &s0);
    assert_eq!(a, b, "propagate must equal Φ·s");
}
