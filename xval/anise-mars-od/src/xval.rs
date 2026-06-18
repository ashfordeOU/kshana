// SPDX-License-Identifier: AGPL-3.0-only
//! The DE-grade heliocentric-Mars cross-check: seed Kshana's **Sun-central two-body** propagator
//! from a DE440 Mars-barycenter state and measure the position/velocity residual against the DE440
//! Mars ephemeris at a sequence of arc lengths. Same propagator, same Sun μ, same integrator that
//! the core `tests/mars_propagation.rs` self-consistency tests exercise — the only new input is the
//! DE440 truth the analytic, kernel-free core cannot supply.

use kshana::body::Body;
use kshana::integrator::Tolerance;
use kshana::propagator::{propagate, ForceModel};

use crate::anise_env::AniseMarsEnvironment;
use crate::report::{ArcResidual, Report};

type Vec3 = [f64; 3];

fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// The arc lengths (days) the residual is sampled at — short (the two-body model is accurate) to
/// longer (the unmodelled planetary perturbations accumulate, an honest growing residual).
pub const ARC_DAYS: [f64; 5] = [1.0, 5.0, 10.0, 30.0, 90.0];

/// Run the cross-check at `seed_jd_tdb`: pull the DE440 heliocentric Mars-barycenter state, seed the
/// Sun-central two-body propagator with it, and for each arc in [`ARC_DAYS`] compare the propagated
/// state against the DE440 truth at that later epoch.
pub fn run(
    env: &AniseMarsEnvironment,
    seed_jd_tdb: f64,
    kernel_sha256: Vec<(String, String)>,
) -> Result<Report, String> {
    // Seed: the DE440 Mars-barycenter state relative to the Sun (position + velocity), in SI.
    let seed = env.try_mars_wrt_sun(seed_jd_tdb)?;
    let helio_r0 = norm(seed.r);

    // Kshana's Sun-central two-body force model — the same propagator path the core tests validate.
    let model = ForceModel::two_body().with_body(Body::sun());
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-3, // 1 mm absolute on a ~2e11 m heliocentric state
        ..Tolerance::default()
    };

    let mut arcs = Vec::with_capacity(ARC_DAYS.len());
    for &arc_days in &ARC_DAYS {
        let arc_s = arc_days * 86_400.0;
        let (r_prop, v_prop) = propagate(seed.r, seed.v, arc_s, &model, &tol);
        let truth = env.try_mars_wrt_sun(seed_jd_tdb + arc_days)?;
        let pos_err = norm([
            r_prop[0] - truth.r[0],
            r_prop[1] - truth.r[1],
            r_prop[2] - truth.r[2],
        ]);
        let vel_err = norm([
            v_prop[0] - truth.v[0],
            v_prop[1] - truth.v[1],
            v_prop[2] - truth.v[2],
        ]);
        arcs.push(ArcResidual {
            arc_days,
            pos_err_m: pos_err,
            rel_to_helio_r: pos_err / helio_r0,
            vel_err_m_s: vel_err,
        });
    }

    Ok(Report {
        scenario:
            "Heliocentric Mars barycenter, seeded from DE440, propagated Sun-central two-body"
                .to_string(),
        truth: "JPL DE440 Mars barycenter relative to the Sun (de440s.bsp, via ANISE)".to_string(),
        model: "kshana ForceModel::two_body().with_body(Body::sun()), adaptive RK".to_string(),
        seed_jd_tdb,
        helio_r0_m: helio_r0,
        arcs,
        kernel_sha256,
    })
}
