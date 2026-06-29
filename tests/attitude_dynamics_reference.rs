// SPDX-License-Identifier: AGPL-3.0-only
//! Physical-invariant reference tests for torque-free rigid-body attitude
//! dynamics (`kshana::attitude_dynamics`).
//!
//! These are **internal-consistency** oracles, not an external dataset. Over a
//! long torque-free propagation the coupled Euler-equation + quaternion-kinematics
//! integrator must preserve the conserved quantities of a free rigid body:
//!
//! (i)   the quaternion norm stays 1 (re-normalised each step);
//! (ii)  the rotational kinetic energy `T = ½ ωᵀIω` is conserved;
//! (iii) the body-frame angular-momentum magnitude `|Iω|` is conserved (the
//!       inertial momentum *vector* is conserved, which we also check); and
//! (iv)  for an axisymmetric (symmetric-top) body the body-cone polhode
//!       precesses at the analytic rate `λ = ω₃(I_a − I_t)/I_t`.
//!
//! Tolerances are stated explicitly per assertion. They are RK4 truncation-error
//! budgets, not measurement uncertainties — this is a MODELLED capability.

use kshana::attitude_dynamics::{propagate, symmetric_top_body_rate, AttitudeState, Inertia};
use kshana::inertial::attitude::Quaternion;
use std::f64::consts::PI;

fn norm3(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// (i) Quaternion norm stays unit over a long, fully tumbling (tri-axial)
/// propagation, to ~1e-10.
#[test]
fn quaternion_norm_stays_unit_over_long_tumble() {
    // A tri-axial body in a generic tumble exercises all three Euler couplings.
    let inertia = Inertia::principal(4.0, 9.0, 12.0);
    let s0 = AttitudeState::new(
        Quaternion::from_axis_angle([0.3, -0.7, 0.5], 0.9),
        [0.8, -0.5, 0.35],
    );
    // 200 s at 1 ms → 200_000 steps: a genuinely long propagation.
    let dt = 1e-3;
    let steps = 200_000;
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);
    let norm = s.q.norm();
    assert!(
        (norm - 1.0).abs() <= 1e-10,
        "quaternion norm drifted: |q| = {norm}, |q|-1 = {:e}",
        norm - 1.0
    );
}

/// (ii) Rotational kinetic energy `T = ½ ωᵀIω` is conserved over a long
/// tri-axial torque-free propagation, to a stated relative tolerance.
#[test]
fn kinetic_energy_conserved_tri_axial() {
    let inertia = Inertia::principal(4.0, 9.0, 12.0);
    let s0 = AttitudeState::new(Quaternion::identity(), [0.8, -0.5, 0.35]);
    let t0 = s0.kinetic_energy(&inertia);

    let dt = 1e-3;
    let steps = 200_000; // 200 s
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);
    let t1 = s.kinetic_energy(&inertia);

    // RK4 at this step holds energy to far better than 1e-9 relative.
    let rel = (t1 - t0).abs() / t0.abs();
    assert!(
        rel <= 1e-9,
        "kinetic energy not conserved: T0={t0}, T1={t1}, rel={rel:e}"
    );
}

/// (iii) Body-frame angular-momentum magnitude `|Iω|` is conserved, and the
/// *inertial* angular-momentum vector is conserved, over a long tri-axial
/// propagation, to stated tolerances.
#[test]
fn angular_momentum_conserved_tri_axial() {
    let inertia = Inertia::principal(4.0, 9.0, 12.0);
    let s0 = AttitudeState::new(
        Quaternion::from_axis_angle([1.0, 0.2, -0.4], 0.6),
        [0.8, -0.5, 0.35],
    );
    let h0_mag = s0.angular_momentum_magnitude(&inertia);
    let h0_vec = s0.angular_momentum_inertial(&inertia);

    let dt = 1e-3;
    let steps = 200_000; // 200 s
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

    // Body-frame magnitude invariant.
    let h1_mag = s.angular_momentum_magnitude(&inertia);
    let rel_mag = (h1_mag - h0_mag).abs() / h0_mag.abs();
    assert!(
        rel_mag <= 1e-9,
        "|Iω| not conserved: |h|0={h0_mag}, |h|1={h1_mag}, rel={rel_mag:e}"
    );

    // Inertial-frame angular-momentum vector invariant (every component).
    let h1_vec = s.angular_momentum_inertial(&inertia);
    let dh = [
        h1_vec[0] - h0_vec[0],
        h1_vec[1] - h0_vec[1],
        h1_vec[2] - h0_vec[2],
    ];
    let rel_vec = norm3(dh) / norm3(h0_vec);
    assert!(
        rel_vec <= 1e-8,
        "inertial angular-momentum vector drifted: rel={rel_vec:e} (h0={h0_vec:?}, h1={h1_vec:?})"
    );
}

/// Same conservation laws on a **general (non-diagonal)** inertia tensor — the
/// off-diagonal products of inertia must not break the invariants.
#[test]
fn conservation_holds_for_general_inertia() {
    let inertia = Inertia::general([[8.0, 1.2, -0.6], [1.2, 11.0, 0.9], [-0.6, 0.9, 14.0]]);
    let s0 = AttitudeState::new(
        Quaternion::from_axis_angle([0.5, 0.5, 0.5], 1.1),
        [0.7, -0.45, 0.3],
    );
    let t0 = s0.kinetic_energy(&inertia);
    let h0 = s0.angular_momentum_magnitude(&inertia);

    let dt = 1e-3;
    let steps = 100_000; // 100 s
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

    assert!((s.q.norm() - 1.0).abs() <= 1e-10, "norm drift on general I");
    let rel_t = (s.kinetic_energy(&inertia) - t0).abs() / t0.abs();
    assert!(
        rel_t <= 1e-9,
        "energy not conserved on general I: rel={rel_t:e}"
    );
    let rel_h = (s.angular_momentum_magnitude(&inertia) - h0).abs() / h0.abs();
    assert!(
        rel_h <= 1e-9,
        "|Iω| not conserved on general I: rel={rel_h:e}"
    );
}

/// (iv) Symmetric-top body-cone precession reproduces the analytic rate for an
/// **oblate** body (I_a > I_t): the transverse ω rotates in the body x–y plane
/// at λ = ω₃(I_a − I_t)/I_t over a full cone period.
#[test]
fn symmetric_top_oblate_precession_matches_analytic() {
    let i_t = 6.0;
    let i_a = 10.0; // oblate
    let inertia = Inertia::principal(i_t, i_t, i_a);
    let w_axial = 2.0;
    let w_perp = 0.5;
    let s0 = AttitudeState::new(Quaternion::identity(), [w_perp, 0.0, w_axial]);

    let lambda = symmetric_top_body_rate(i_t, i_a, w_axial);
    assert!(lambda > 0.0, "oblate body should give positive body rate");
    let period = 2.0 * PI / lambda.abs();

    let dt = 1e-4;
    // Propagate a full body-cone period; the transverse vector should return.
    let steps = (period / dt).round() as usize;
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

    let angle = lambda * (steps as f64 * dt);
    let wx_expected = w_perp * angle.cos();
    let wy_expected = w_perp * angle.sin();
    assert!(
        (s.omega[0] - wx_expected).abs() <= 1e-6,
        "ωx {} vs analytic {}",
        s.omega[0],
        wx_expected
    );
    assert!(
        (s.omega[1] - wy_expected).abs() <= 1e-6,
        "ωy {} vs analytic {}",
        s.omega[1],
        wy_expected
    );
    // Axial spin is a constant of the symmetric-top motion.
    assert!(
        (s.omega[2] - w_axial).abs() <= 1e-9,
        "axial spin drifted: {} vs {}",
        s.omega[2],
        w_axial
    );
    // The transverse speed magnitude is exactly preserved.
    let perp_mag = (s.omega[0] * s.omega[0] + s.omega[1] * s.omega[1]).sqrt();
    assert!(
        (perp_mag - w_perp).abs() <= 1e-7,
        "transverse |ω| changed: {perp_mag} vs {w_perp}"
    );
}

/// (iv) Same precession law for a **prolate** body (I_a < I_t): the analytic
/// rate is negative and the transverse ω rotates the other way.
#[test]
fn symmetric_top_prolate_precession_matches_analytic() {
    let i_t = 12.0;
    let i_a = 5.0; // prolate
    let inertia = Inertia::principal(i_t, i_t, i_a);
    let w_axial = 1.5;
    let w_perp = 0.4;
    let s0 = AttitudeState::new(Quaternion::identity(), [w_perp, 0.0, w_axial]);

    let lambda = symmetric_top_body_rate(i_t, i_a, w_axial);
    assert!(lambda < 0.0, "prolate body should give negative body rate");

    // A quarter-period check (avoids any accidental full-period symmetry hiding sign).
    let period = 2.0 * PI / lambda.abs();
    let t = 0.25 * period;
    let dt = 1e-4;
    let steps = (t / dt).round() as usize;
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

    let angle = lambda * (steps as f64 * dt); // negative → ωy goes negative
    let wx_expected = w_perp * angle.cos();
    let wy_expected = w_perp * angle.sin();
    assert!(
        wy_expected < 0.0,
        "prolate quarter-turn should drive ωy < 0"
    );
    assert!(
        (s.omega[0] - wx_expected).abs() <= 1e-6,
        "ωx {} vs analytic {}",
        s.omega[0],
        wx_expected
    );
    assert!(
        (s.omega[1] - wy_expected).abs() <= 1e-6,
        "ωy {} vs analytic {}",
        s.omega[1],
        wy_expected
    );
}

/// A pure spin about a principal axis is an exact fixed point of the dynamics —
/// the attitude is a steady rotation and ω is constant, verified over a long
/// run as a regression on the coupling sign conventions.
#[test]
fn principal_axis_spin_is_steady() {
    let inertia = Inertia::principal(3.0, 5.0, 7.0);
    let w = [0.0, 0.0, 1.2];
    let s0 = AttitudeState::new(Quaternion::identity(), w);

    let dt = 1e-3;
    let steps = 50_000; // 50 s
    let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

    // ω is unchanged.
    assert!((s.omega[0]).abs() <= 1e-12);
    assert!((s.omega[1]).abs() <= 1e-12);
    assert!((s.omega[2] - 1.2).abs() <= 1e-12);

    // The attitude is the exact closed-form spin about z.
    let total_angle = 1.2 * (steps as f64 * dt);
    let exact = Quaternion::from_axis_angle([0.0, 0.0, 1.0], total_angle);
    let v = [1.0, 0.0, 0.0];
    let got = s.q.rotate(v);
    let want = exact.rotate(v);
    for k in 0..3 {
        assert!(
            (got[k] - want[k]).abs() <= 1e-6,
            "attitude diverged from closed-form spin at component {k}: {} vs {}",
            got[k],
            want[k]
        );
    }
}
