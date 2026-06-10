// SPDX-License-Identifier: Apache-2.0
//! Precise-OD engine validation on **synthetic** data: the RTN residual frame, the variational
//! state-transition matrix against whole-arc finite difference, and batch-LS self-recovery of a
//! Kshana-propagated arc back to its own initial state. No external data — the truth is Kshana's
//! own integrator, so any non-zero residual is the estimator's, not the dynamics'.

use kshana::precise_od::{self, ric_from_state, ForceModel};

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

// --- a tiny deterministic Gaussian for reproducible measurement noise ---

/// A fixed-seed linear congruential generator + Box–Muller — no `rand` dependency, identical on
/// every run, so the noisy self-recovery test is reproducible.
struct Lcg(u64);
impl Lcg {
    fn next_u(&mut self) -> f64 {
        self.0 = self
            .0
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1);
        // top 53 bits → [0,1).
        ((self.0 >> 11) as f64) / ((1u64 << 53) as f64)
    }
    fn gauss(&mut self) -> f64 {
        let u1 = self.next_u().max(1e-12);
        let u2 = self.next_u();
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

/// Build a synthetic observation track by sampling the truth force model every `step` seconds for
/// `n` points, optionally adding zero-mean Gaussian position noise of 1σ = `sigma` (m).
#[allow(clippy::too_many_arguments)]
fn synth_track(
    fm: &kshana::precise_od::PreciseForceModel,
    r0: [f64; 3],
    v0: [f64; 3],
    n: usize,
    step: f64,
    sigma: f64,
    tol: &kshana::integrator::Tolerance,
    rng: &mut Lcg,
) -> Vec<kshana::precise_od::Observation> {
    use kshana::precise_od::{propagate, Observation};
    (1..=n)
        .map(|k| {
            let t = k as f64 * step;
            let (r, _v) = propagate(fm, r0, v0, t, tol);
            let pos = if sigma > 0.0 {
                [
                    r[0] + sigma * rng.gauss(),
                    r[1] + sigma * rng.gauss(),
                    r[2] + sigma * rng.gauss(),
                ]
            } else {
                r
            };
            Observation {
                t,
                pos,
                sigma: sigma.max(1.0),
            }
        })
        .collect()
}

/// Batch-LS self-recovery, the estimator's core correctness gate: generate a 1-hour Kshana arc
/// (degree-6 geopotential + Sun + Moon), observe its position noise-free, start the fit from a
/// state offset by ~150 m / 0.1 m/s, and recover the epoch state to the millimetre with a
/// near-zero post-fit RMS. Any residual is the estimator's, not the dynamics' (same model).
#[test]
fn batch_ls_recovers_a_noise_free_arc_to_the_millimetre() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let fm = PreciseForceModel::egm2008(6, epoch).third_body(true, true);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let mut rng = Lcg(0xC0FFEE);
    let obs = synth_track(&fm, r0t, v0t, 60, 60.0, 0.0, &tol, &mut rng);

    let initial = EstimatedParams {
        r0: [r0t[0] + 150.0, r0t[1] - 100.0, r0t[2] + 50.0],
        v0: [v0t[0] + 0.10, v0t[1] - 0.05, v0t[2] + 0.08],
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        tol,
        ..FitConfig::default()
    };
    let rep = fit(&fm, initial, &obs, &cfg).expect("fit converges");
    assert!(rep.converged, "did not converge: {rep:?}");
    assert!(
        vnorm(sub(rep.params.r0, r0t)) < 1e-2,
        "epoch position not recovered: {:e} m",
        vnorm(sub(rep.params.r0, r0t))
    );
    assert!(
        vnorm(sub(rep.params.v0, v0t)) < 1e-5,
        "epoch velocity not recovered: {:e} m/s",
        vnorm(sub(rep.params.v0, v0t))
    );
    assert!(
        rep.rms_3d < 1e-2,
        "noise-free post-fit RMS {} m too high",
        rep.rms_3d
    );
    assert_eq!(rep.n_params, 6);
    assert_eq!(rep.n_obs, 60);
}

/// With 1σ = 5 m white position noise the post-fit 3-D RMS settles at the noise floor (≈ σ·√3 for
/// a 3-axis position residual, well within a factor of two of 5 m) and the recovered epoch state
/// lands within a few metres of truth — the estimator is unbiased, not overfitting the noise.
#[test]
fn batch_ls_recovers_a_noisy_arc_to_the_noise_floor() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let fm = PreciseForceModel::egm2008(6, epoch).third_body(true, true);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let sigma = 5.0;
    let mut rng = Lcg(0x1234_5678);
    let obs = synth_track(&fm, r0t, v0t, 90, 40.0, sigma, &tol, &mut rng);

    let initial = EstimatedParams {
        r0: [r0t[0] + 80.0, r0t[1] + 60.0, r0t[2] - 40.0],
        v0: [v0t[0] - 0.05, v0t[1] + 0.07, v0t[2] - 0.03],
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        tol,
        ..FitConfig::default()
    };
    let rep = fit(&fm, initial, &obs, &cfg).expect("fit converges");
    assert!(rep.converged, "did not converge");
    // Post-fit RMS at the noise floor: σ·√3 ≈ 8.7 m for a 3-axis residual; allow 3..15 m.
    assert!(
        (3.0..15.0).contains(&rep.rms_3d),
        "post-fit RMS {} m not at the ~5 m noise floor",
        rep.rms_3d
    );
    // Recovered epoch position within a few metres (the fit averages down the noise).
    assert!(
        vnorm(sub(rep.params.r0, r0t)) < 10.0,
        "epoch position off by {:e} m",
        vnorm(sub(rep.params.r0, r0t))
    );
    // RTN decomposition is populated and physical.
    assert!(rep.rms_rtn.iter().all(|&x| x.is_finite() && x >= 0.0));
}

/// SRP `C_R` is recoverable: generate truth with solar-radiation pressure at C_R = 1.4, then fit
/// [r, v, C_R] starting from C_R = 1.0 and recover the coefficient to ~1 % alongside the state.
#[test]
fn batch_ls_estimates_the_srp_coefficient() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let cr_true = 1.4;
    let aom = 0.02;
    let fm = PreciseForceModel::egm2008(6, epoch)
        .third_body(true, true)
        .solar_radiation(cr_true, aom);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let mut rng = Lcg(0xABCD_EF01);
    // A longer arc gives SRP a clearer signature.
    let obs = synth_track(&fm, r0t, v0t, 120, 60.0, 0.0, &tol, &mut rng);

    let initial = EstimatedParams {
        r0: [r0t[0] + 50.0, r0t[1] - 30.0, r0t[2] + 20.0],
        v0: [v0t[0] + 0.03, v0t[1] - 0.02, v0t[2] + 0.01],
        cr: Some(1.0),
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_cr: true,
        tol,
        ..FitConfig::default()
    };
    let rep = fit(&fm, initial, &obs, &cfg).expect("fit converges");
    assert!(rep.converged, "did not converge");
    let cr = rep.params.cr.expect("C_R estimated");
    assert!(
        (cr - cr_true).abs() < 0.014,
        "C_R recovered {cr} vs truth {cr_true}"
    );
    assert_eq!(rep.n_params, 7);
    assert!(
        rep.rms_3d < 1e-2,
        "noise-free post-fit RMS {} m",
        rep.rms_3d
    );
}

/// n-sigma outlier editing: corrupt one observation of an otherwise clean arc by 500 m and the
/// estimator rejects it (n_edited ≥ 1) and still recovers the epoch state to the millimetre with a
/// near-zero post-fit RMS. With editing off the single gross residual would dominate the RMS.
#[test]
fn batch_ls_edits_a_gross_outlier() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let fm = PreciseForceModel::egm2008(6, epoch).third_body(true, true);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let mut rng = Lcg(0x55AA_55AA);
    let mut obs = synth_track(&fm, r0t, v0t, 60, 60.0, 0.0, &tol, &mut rng);
    // Corrupt the 30th observation with a gross 500 m blunder.
    obs[30].pos[0] += 500.0;

    let initial = EstimatedParams {
        r0: [r0t[0] + 120.0, r0t[1] - 80.0, r0t[2] + 40.0],
        v0: [v0t[0] + 0.08, v0t[1] - 0.04, v0t[2] + 0.06],
        cr: None,
        empirical: None,
    };

    // Without editing the gross residual dominates the post-fit RMS.
    let rep_noedit = fit(
        &fm,
        initial,
        &obs,
        &FitConfig {
            tol,
            ..FitConfig::default()
        },
    )
    .expect("fit converges");
    assert!(
        rep_noedit.rms_3d > 10.0,
        "without editing the 500 m blunder should inflate RMS, got {}",
        rep_noedit.rms_3d
    );

    // With 5-sigma editing the blunder is rejected and the fit is clean again.
    let rep = fit(
        &fm,
        initial,
        &obs,
        &FitConfig {
            outlier_sigma: 5.0,
            tol,
            ..FitConfig::default()
        },
    )
    .expect("fit converges");
    assert!(rep.n_edited >= 1, "the gross outlier was not edited");
    assert_eq!(
        rep.n_edited, 1,
        "only the one blunder should be edited, not {}",
        rep.n_edited
    );
    assert!(rep.rms_3d < 1e-2, "post-edit RMS {} m too high", rep.rms_3d);
    assert!(
        vnorm(sub(rep.params.r0, r0t)) < 1e-2,
        "epoch position not recovered after editing"
    );
}

/// The empirical-acceleration tier "runs" on a clean arc without corrupting it: enabling the
/// nine RTN constant + once-per-rev empirical parameters (a-priori constrained) on truth that has
/// no empirical force still converges, recovers the epoch state, keeps every empirical amplitude
/// small, and leaves a clean post-fit RMS — the "without vs with empirical both run" requirement.
#[test]
fn batch_ls_empirical_tier_stays_small_on_clean_truth() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let fm = PreciseForceModel::egm2008(4, epoch).third_body(true, false);
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let mut rng = Lcg(0x0BAD_F00D);
    // ~2.5 revolutions so the once-per-rev terms are observable.
    let obs = synth_track(&fm, r0t, v0t, 70, 210.0, 0.0, &tol, &mut rng);

    let initial = EstimatedParams {
        r0: [r0t[0] + 60.0, r0t[1] - 40.0, r0t[2] + 30.0],
        v0: [v0t[0] + 0.04, v0t[1] - 0.03, v0t[2] + 0.02],
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_empirical: true,
        empirical_sigma: 1e-7,
        tol,
        ..FitConfig::default()
    };
    let rep = fit(&fm, initial, &obs, &cfg).expect("fit converges");
    assert!(rep.converged, "did not converge: {rep:?}");
    assert_eq!(rep.n_params, 15, "6 state + 9 empirical");
    let e = rep.params.empirical.expect("empirical reported");
    let max_amp = e
        .radial
        .iter()
        .chain(&e.transverse)
        .chain(&e.normal)
        .fold(0.0_f64, |m, &x| m.max(x.abs()));
    assert!(
        max_amp < 1e-8,
        "clean-truth empirical amplitudes should stay near zero, max {max_amp:e} m/s²"
    );
    assert!(
        vnorm(sub(rep.params.r0, r0t)) < 1.0,
        "epoch position drifted under the empirical tier: {:e} m",
        vnorm(sub(rep.params.r0, r0t))
    );
    assert!(rep.rms_3d < 0.1, "post-fit RMS {} m too high", rep.rms_3d);
}

/// The empirical tier captures a real unmodelled force: inject a constant cross-track (normal)
/// acceleration into the truth — cleanly observable, unlike along-track which trades with the
/// velocity — and the estimator recovers it to ~20 % while bringing the post-fit RMS down to the
/// clean level it would have with no empirical mismodelling.
#[test]
fn batch_ls_recovers_an_injected_cross_track_empirical_acceleration() {
    use kshana::integrator::Tolerance;
    use kshana::precise_od::{fit, EmpiricalAccel, EstimatedParams, FitConfig, PreciseForceModel};
    use kshana::timescales::JD_J2000;

    let (r0t, v0t, _p) = circular_leo();
    let epoch = JD_J2000;
    let a_n = 3.0e-8; // constant cross-track empirical acceleration (m/s²)
    let emp_true = EmpiricalAccel {
        normal: [a_n, 0.0, 0.0],
        ..Default::default()
    };
    let tol = Tolerance {
        rtol: 1e-11,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let fm_truth = PreciseForceModel::egm2008(4, epoch)
        .third_body(true, false)
        .with_empirical(emp_true);
    let mut rng = Lcg(0xFEED_BEEF);
    let obs = synth_track(&fm_truth, r0t, v0t, 70, 210.0, 0.0, &tol, &mut rng);

    // Fit with a force model that has NO empirical force, but estimate the empirical tier.
    let fm_fit = PreciseForceModel::egm2008(4, epoch).third_body(true, false);
    let initial = EstimatedParams {
        r0: [r0t[0] + 40.0, r0t[1] - 20.0, r0t[2] + 15.0],
        v0: [v0t[0] + 0.02, v0t[1] - 0.015, v0t[2] + 0.01],
        cr: None,
        empirical: None,
    };
    let cfg = FitConfig {
        estimate_empirical: true,
        empirical_sigma: 1e-6, // loose a-priori so the data drives the estimate
        tol,
        ..FitConfig::default()
    };
    let rep = fit(&fm_fit, initial, &obs, &cfg).expect("fit converges");
    assert!(rep.converged, "did not converge");
    let e = rep.params.empirical.expect("empirical reported");
    assert!(
        (e.normal[0] - a_n).abs() < 0.2 * a_n,
        "cross-track empirical recovered {:e} vs injected {a_n:e}",
        e.normal[0]
    );
    assert!(
        rep.rms_3d < 0.5,
        "with the empirical tier the fit should be clean, RMS {} m",
        rep.rms_3d
    );
}

// --- W3 real-EOP frame plumbing (still synthetic geometry; verifies the wiring) ------------

// Real IERS finals2000A rows (Bulletin A final), MJD 59579 & 59580 — same bytes as the
// vendored agency fixture, inlined here so the wiring test needs no file.
const EOP_ROW_59579: &str = "211231 59579.00 I  0.056257 0.000030  0.275943 0.000035  I-0.1104179 0.0000019  0.1927 0.0016  I     0.073    0.060    -0.273    0.299  0.056304  0.275973 -0.1104355     0.040    -0.287  ";
const EOP_ROW_59580: &str = "22 1 1 59580.00 I  0.054644 0.000026  0.276986 0.000032  I-0.1104988 0.0000023 -0.0267 0.0022  I     0.095    0.060    -0.250    0.299  0.054574  0.276983 -0.1105197     0.059    -0.259  ";

/// Attaching real EOP must move the GCRS↔ITRS rotation off the nominal one (UT1≠TT and a
/// non-zero pole), and the resolved per-epoch args must round-trip a position through the
/// validated CIO chain to the metre.
#[test]
fn real_eop_moves_the_frame_and_round_trips_through_cio() {
    use kshana::cio::{gcrs_to_itrs, itrs_to_gcrs};
    use kshana::eop::EopSeries;
    use kshana::precise_od::PreciseForceModel;
    use kshana::timescales::{julian_date, utc_to_tt, utc_to_ut1};

    let eop = EopSeries::from_finals2000a(&format!("{EOP_ROW_59579}\n{EOP_ROW_59580}\n"));
    let epoch = utc_to_tt(julian_date(2022, 1, 1, 0, 0, 0.0));
    let jd_tt = epoch + 3600.0 / 86_400.0; // one hour into the arc

    let nominal = PreciseForceModel::egm2008(8, epoch);
    let with_eop = PreciseForceModel::egm2008(8, epoch).with_eop(eop);

    // Nominal model: UT1 = TT, no polar motion.
    let (u_nom, xp_nom, yp_nom) = nominal.frame_args(jd_tt);
    assert!((u_nom - jd_tt).abs() < 1e-15 && xp_nom == 0.0 && yp_nom == 0.0);

    // Real EOP: UT1 = UTC + (UT1−UTC) (≈ −0.11 s of day), and a ~0.05–0.28″ pole.
    let (u_eop, xp_eop, yp_eop) = with_eop.frame_args(jd_tt);
    let jd_utc = julian_date(2021, 12, 31, 23, 59, 42.0); // 2022-01-01 00:00 GPS − 18 s, +1 h
                                                          // dut1 here interpolates between 59579 and 59580; just assert it left the nominal value.
    assert!(
        (u_eop - jd_tt).abs() > 1.0 / 86_400.0,
        "UT1 must differ from TT by ~0.1 s"
    );
    assert!(
        xp_eop > 0.0 && yp_eop > 0.0,
        "polar motion must be non-zero"
    );
    let _ = (utc_to_ut1(jd_utc, -0.110), u_nom);

    // Round-trip a position through the resolved args: ITRS → GCRS → ITRS is identity.
    let r_itrs = [1.0e7, 2.0e7, -1.5e7];
    let r_gcrs = itrs_to_gcrs(r_itrs, jd_tt, u_eop, xp_eop, yp_eop);
    let back = gcrs_to_itrs(r_gcrs, jd_tt, u_eop, xp_eop, yp_eop);
    for k in 0..3 {
        assert!((back[k] - r_itrs[k]).abs() < 1e-6, "round-trip axis {k}");
    }
    // The rotation actually did something (GCRS ≠ ITRS at this epoch).
    let moved: f64 = (0..3)
        .map(|k| (r_gcrs[k] - r_itrs[k]).abs())
        .fold(0.0, f64::max);
    assert!(
        moved > 1.0e6,
        "Earth rotation should move the vector by megametres"
    );
}

/// GPS time is a fixed 51.184 s behind TT (TAI − GPS = 19 s, TT − TAI = 32.184 s).
#[test]
fn gps_to_tt_is_the_fixed_offset() {
    use kshana::timescales::{gps_to_tt, julian_date};
    // Exact at small JD magnitude: the conversion constant is 51.184 s.
    assert!((gps_to_tt(0.0) * 86_400.0 - 51.184).abs() < 1e-9);
    // On a real 2022 epoch the JD is ~2.46e6, where one f64 ULP is ~4.7e-5 s, so the
    // (sum − jd) differencing loses ~5 digits — 1e-4 s here is float noise, not physics
    // (4.7e-5 s of UT1 error rotates a MEO position by ~0.1 mm).
    let jd_gps = julian_date(2022, 1, 1, 0, 0, 0.0);
    let secs = (gps_to_tt(jd_gps) - jd_gps) * 86_400.0;
    assert!((secs - 51.184).abs() < 1e-4, "GPS→TT offset {secs} s");
}
