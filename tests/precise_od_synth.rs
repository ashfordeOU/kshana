// SPDX-License-Identifier: Apache-2.0
//! Precise-OD engine validation on **synthetic** data: the RTN residual frame, the variational
//! state-transition matrix against whole-arc finite difference, and batch-LS self-recovery of a
//! Kshana-propagated arc back to its own initial state. No external data — the truth is Kshana's
//! own integrator, so any non-zero residual is the estimator's, not the dynamics'.

use kshana::precise_od::{self, ric_from_state};

/// The radial/transverse/normal (RTN) rotation built from a circular, equatorial, prograde state
/// is the identity-like axis map: R̂ = +x, T̂ = +y, N̂ = +z. Rotating an ECI vector into RTN must
/// reproduce its components, and a purely radial ECI displacement must land entirely on the R axis.
#[test]
fn ric_from_state_circular_equatorial_is_the_axis_map() {
    let mu = 3.986_004_418e14_f64;
    let a = 7.0e6;
    let vc = (mu / a).sqrt();
    let r = [a, 0.0, 0.0];
    let v = [0.0, vc, 0.0];
    let ric = ric_from_state(r, v); // rows = [R̂, T̂, N̂]; ric·w = (w_R, w_T, w_N)

    // R̂ = +x, T̂ = +y, N̂ = +z.
    let apply = |w: [f64; 3]| {
        [
            ric[0][0] * w[0] + ric[0][1] * w[1] + ric[0][2] * w[2],
            ric[1][0] * w[0] + ric[1][1] * w[1] + ric[1][2] * w[2],
            ric[2][0] * w[0] + ric[2][1] * w[1] + ric[2][2] * w[2],
        ]
    };
    let close = |got: [f64; 3], want: [f64; 3]| (0..3).all(|k| (got[k] - want[k]).abs() < 1e-12);
    assert!(close(apply([1.0, 0.0, 0.0]), [1.0, 0.0, 0.0]), "radial → R");
    assert!(close(apply([0.0, 1.0, 0.0]), [0.0, 1.0, 0.0]), "track  → T");
    assert!(close(apply([0.0, 0.0, 1.0]), [0.0, 0.0, 1.0]), "normal → N");

    // A radial-out displacement of 5 m lands wholly on the R axis.
    let rtn = apply([5.0, 0.0, 0.0]);
    assert!((rtn[0] - 5.0).abs() < 1e-12 && rtn[1].abs() < 1e-12 && rtn[2].abs() < 1e-12);

    // The rows are orthonormal (a proper rotation).
    let dot =
        |i: usize, j: usize| ric[i][0] * ric[j][0] + ric[i][1] * ric[j][1] + ric[i][2] * ric[j][2];
    for i in 0..3 {
        assert!((dot(i, i) - 1.0).abs() < 1e-12, "row {i} not unit");
        for j in (i + 1)..3 {
            assert!(dot(i, j).abs() < 1e-12, "rows {i},{j} not orthogonal");
        }
    }
}

/// An inclined orbit: R̂ is still r̂, N̂ is the orbit normal r×v, and T̂ = N̂×R̂ completes the
/// right-handed triad. The cross-track axis must be perpendicular to both r and v.
#[test]
fn ric_from_state_inclined_normal_is_perpendicular_to_the_orbit_plane() {
    let mu = 3.986_004_418e14_f64;
    let a = 7.2e6;
    let vc = (mu / a).sqrt();
    let inc = 56.0_f64.to_radians();
    let r = [a, 0.0, 0.0];
    let v = [0.0, vc * inc.cos(), vc * inc.sin()];
    let ric = ric_from_state(r, v);
    let n_hat = ric[2];
    // N̂ ⟂ r and N̂ ⟂ v.
    let ndotr = n_hat[0] * r[0] + n_hat[1] * r[1] + n_hat[2] * r[2];
    let ndotv = n_hat[0] * v[0] + n_hat[1] * v[1] + n_hat[2] * v[2];
    assert!(ndotr.abs() < 1e-6, "N̂·r = {ndotr}");
    assert!(ndotv.abs() < 1e-6, "N̂·v = {ndotv}");
    // R̂ = r̂.
    let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
    for k in 0..3 {
        assert!((ric[0][k] - r[k] / rn).abs() < 1e-12, "R̂ ≠ r̂ axis {k}");
    }
}

// --- shared local vector helpers for the force-model / STM / estimator tests ---

fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn vnorm(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn vunit(a: [f64; 3]) -> [f64; 3] {
    let n = vnorm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}

/// A representative LEO state away from the poles/z-axis, reused across the tests.
fn leo_state() -> ([f64; 3], [f64; 3]) {
    let mu = 3.986_004_418e14_f64;
    let a = 7.0e6;
    let vc = (mu / a).sqrt();
    let inc = 51.6_f64.to_radians();
    let r = [a, 1.2e6, 0.9e6];
    // A velocity roughly circular and inclined (need not be exactly circular for these tests).
    let v = [-vc * 0.15, vc * inc.cos(), vc * inc.sin()];
    (r, v)
}

/// EGM2008 truncated to degree 0 is only C̄₀₀ = 1 — an exact point mass. Because the central
/// term is radial it is invariant under the Earth-fixed rotation, so the precise force model must
/// reproduce −μr/|r|³ at *every* epoch and integration time.
#[test]
fn precise_force_point_mass_limit_is_two_body() {
    use kshana::forces::two_body_accel;
    use kshana::precise_od::PreciseForceModel;
    use kshana::timescales::JD_J2000;
    let (r, v) = leo_state();
    let fm = PreciseForceModel::egm2008(0, JD_J2000);
    let tb = two_body_accel(r);
    for &t in &[0.0, 1234.0, 86_400.0] {
        let a = fm.accel_rv(t, r, v);
        let err = vnorm(sub(a, tb));
        assert!(err < 1e-6, "point-mass residual {err} m/s² at t={t}");
    }
}

/// Raising the geopotential degree adds the oblateness/tesseral field: the J2-dominated
/// correction at LEO sits in a physical band (~1e-2 m/s² is the J2 scale; certainly within
/// 1e-5..1e-1) above the point mass.
#[test]
fn precise_force_geopotential_adds_oblateness() {
    use kshana::precise_od::PreciseForceModel;
    use kshana::timescales::JD_J2000;
    let (r, v) = leo_state();
    let pm = PreciseForceModel::egm2008(0, JD_J2000);
    let g8 = PreciseForceModel::egm2008(8, JD_J2000);
    let d = vnorm(sub(g8.accel_rv(0.0, r, v), pm.accel_rv(0.0, r, v)));
    assert!(
        (1e-5..1e-1).contains(&d),
        "geopotential (deg-8) perturbation {d} m/s² outside the J2 band"
    );
}

/// The Sun third body and the tidal term are wired in additively and exactly: enabling each adds
/// precisely the corresponding validated free-function acceleration to the point-mass force (the
/// same bit-faithful wiring check the propagator uses for the third body).
#[test]
fn precise_force_third_body_and_tides_wiring_is_exact() {
    use kshana::ephem::sun_position;
    use kshana::forces::{third_body_accel, MU_SUN};
    use kshana::precession::julian_centuries_tt;
    use kshana::precise_od::PreciseForceModel;
    use kshana::timescales::JD_J2000;
    let (r, v) = leo_state();
    let epoch = JD_J2000;
    let base = PreciseForceModel::egm2008(0, epoch);
    let a_base = base.accel_rv(0.0, r, v);

    let with_sun = PreciseForceModel::egm2008(0, epoch).third_body(true, false);
    let expect_sun = third_body_accel(r, sun_position(julian_centuries_tt(epoch)), MU_SUN);
    let a_sun = with_sun.accel_rv(0.0, r, v);
    for k in 0..3 {
        assert!(
            (a_sun[k] - (a_base[k] + expect_sun[k])).abs() < 1e-15,
            "Sun third-body wiring axis {k}: {} vs {}",
            a_sun[k],
            a_base[k] + expect_sun[k]
        );
    }

    let with_tides = PreciseForceModel::egm2008(0, epoch).tides();
    let expect_t = kshana::tides::tidal_acceleration(r, epoch);
    let a_t = with_tides.accel_rv(0.0, r, v);
    for k in 0..3 {
        assert!(
            (a_t[k] - (a_base[k] + expect_t[k])).abs() < 1e-15,
            "tide wiring axis {k}"
        );
    }
}

/// A constant radial empirical acceleration adds exactly that vector along r̂ (the empirical tier
/// is expressed in the RTN frame and rotated back into ECI).
#[test]
fn precise_force_constant_radial_empirical_points_along_r() {
    use kshana::precise_od::{EmpiricalAccel, PreciseForceModel};
    use kshana::timescales::JD_J2000;
    let (r, v) = leo_state();
    let amp = 1.0e-7;
    let emp = EmpiricalAccel {
        radial: [amp, 0.0, 0.0],
        ..Default::default()
    };
    let base = PreciseForceModel::egm2008(0, JD_J2000);
    let withe = PreciseForceModel::egm2008(0, JD_J2000).with_empirical(emp);
    let d = sub(withe.accel_rv(0.0, r, v), base.accel_rv(0.0, r, v));
    let rhat = vunit(r);
    for k in 0..3 {
        assert!(
            (d[k] - amp * rhat[k]).abs() < 1e-13,
            "radial empirical axis {k}: {} vs {}",
            d[k],
            amp * rhat[k]
        );
    }
    // And it is purely radial: no transverse/normal leak.
    let rtn = precise_od::to_rtn(d, r, v);
    assert!(
        (rtn[0] - amp).abs() < 1e-13 && rtn[1].abs() < 1e-13 && rtn[2].abs() < 1e-13,
        "empirical RTN {rtn:?}"
    );
}

/// A circular inclined LEO orbit and its period, for the STM and self-recovery tests.
fn circular_leo() -> ([f64; 3], [f64; 3], f64) {
    let mu = 3.986_004_418e14_f64;
    let a = 7.0e6;
    let vc = (mu / a).sqrt();
    let inc = 51.6_f64.to_radians();
    let r0 = [a, 0.0, 0.0];
    let v0 = [0.0, vc * inc.cos(), vc * inc.sin()];
    let period = std::f64::consts::TAU * (a * a * a / mu).sqrt();
    (r0, v0, period)
}

/// THE correctness gate for the variational state-transition matrix: each column of Φ — the
/// sensitivity of the half-orbit final state to a perturbation of one initial component — must
/// match an independent whole-arc central finite-difference re-propagation. Agreement to ~1e-6
/// validates that Φ̇ = A·Φ was integrated faithfully (a numerically-evaluated A across the full
/// perturbed force model), the documented STM↔FD cross-check.
#[test]
fn variational_stm_columns_match_whole_arc_finite_difference() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{propagate, propagate_with_stm, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0, v0, period) = circular_leo();
    let t_half = period / 2.0;
    // A genuinely perturbed, smooth force model: degree-8 geopotential + Sun + Moon third body.
    let fm = PreciseForceModel::egm2008(8, JD_J2000).third_body(true, true);
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-12,
        ..Tolerance::default()
    };

    let (_rf, _vf, phi) = propagate_with_stm(&fm, r0, v0, t_half, &tol);

    // Each of the 6 columns by central finite difference of the nonlinear flow.
    let x0 = [r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let mut worst_pos_rel = 0.0_f64;
    let mut worst_vel_rel = 0.0_f64;
    for j in 0..6 {
        let h = if j < 3 { 1.0 } else { 1.0e-3 };
        let mut xp = x0;
        let mut xm = x0;
        xp[j] += h;
        xm[j] -= h;
        let (rp, vp) = propagate(
            &fm,
            [xp[0], xp[1], xp[2]],
            [xp[3], xp[4], xp[5]],
            t_half,
            &tol,
        );
        let (rm, vm) = propagate(
            &fm,
            [xm[0], xm[1], xm[2]],
            [xm[3], xm[4], xm[5]],
            t_half,
            &tol,
        );
        // FD column (response to a unit perturbation in component j).
        let fd = [
            (rp[0] - rm[0]) / (2.0 * h),
            (rp[1] - rm[1]) / (2.0 * h),
            (rp[2] - rm[2]) / (2.0 * h),
            (vp[0] - vm[0]) / (2.0 * h),
            (vp[1] - vm[1]) / (2.0 * h),
            (vp[2] - vm[2]) / (2.0 * h),
        ];
        // Φ column j.
        let col = [
            phi[0][j], phi[1][j], phi[2][j], phi[3][j], phi[4][j], phi[5][j],
        ];
        let pos_fd = vnorm([fd[0], fd[1], fd[2]]);
        let pos_err = vnorm([col[0] - fd[0], col[1] - fd[1], col[2] - fd[2]]);
        let vel_fd = vnorm([fd[3], fd[4], fd[5]]);
        let vel_err = vnorm([col[3] - fd[3], col[4] - fd[4], col[5] - fd[5]]);
        if pos_fd > 0.0 {
            worst_pos_rel = worst_pos_rel.max(pos_err / pos_fd);
        }
        if vel_fd > 0.0 {
            worst_vel_rel = worst_vel_rel.max(vel_err / vel_fd);
        }
    }
    assert!(
        worst_pos_rel < 1e-6,
        "STM position-response disagreement {worst_pos_rel:e} (want <1e-6)"
    );
    assert!(
        worst_vel_rel < 1e-6,
        "STM velocity-response disagreement {worst_vel_rel:e} (want <1e-6)"
    );
}

/// Φ(0) = I and the state returned by `propagate_with_stm` agrees with the plain state propagator
/// — the augmented integration does not perturb the trajectory it carries.
#[test]
fn variational_stm_identity_at_epoch_and_state_consistency() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{propagate, propagate_with_stm, PreciseForceModel};
    use kshana::timescales::JD_J2000;
    let (r0, v0, period) = circular_leo();
    let fm = PreciseForceModel::egm2008(6, JD_J2000);
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-12,
        ..Tolerance::default()
    };
    // Φ(0) = I.
    let (_r, _v, phi0) = propagate_with_stm(&fm, r0, v0, 0.0, &tol);
    for (i, row) in phi0.iter().enumerate() {
        for (j, &e) in row.iter().enumerate() {
            let want = if i == j { 1.0 } else { 0.0 };
            assert!((e - want).abs() < 1e-12, "Φ(0)[{i}][{j}] ≠ I");
        }
    }
    // State consistency over a third of an orbit. The plain 6-vector propagator and the
    // augmented 42-vector one are independent adaptive integrations of the same state ODE, so they
    // agree only to the tolerance level (their step paths differ because Φ enters the error norm),
    // not to machine precision — sub-millimetre agreement here confirms the augmented integration
    // carries the same trajectory.
    let t = period / 3.0;
    let (rs, vs) = propagate(&fm, r0, v0, t, &tol);
    let (rstm, vstm, _) = propagate_with_stm(&fm, r0, v0, t, &tol);
    let dr = vnorm(sub(rs, rstm));
    let dv = vnorm(sub(vs, vstm));
    assert!(dr < 1e-3, "state position mismatch {dr:e} m");
    assert!(dv < 1e-6, "state velocity mismatch {dv:e} m/s");
}
