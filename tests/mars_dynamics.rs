// SPDX-License-Identifier: Apache-2.0
//! Deep-space dynamics: the body-parameterised central-gravity seam.
//!
//! The whole point of the [`kshana::body::Body`] seam is that the **Earth path stays
//! byte-identical**. These tests pin that: the new body-parameterised force routines, handed
//! `Body::earth()`, must reproduce the legacy Earth arithmetic to **exact** (bit-for-bit)
//! equality — not "approximately equal", `==`. The reproducibility goldens
//! (`cross_platform_golden`, `golden`) are the end-to-end version of the same invariant.

use kshana::body::Body;
use kshana::forces::{
    two_body_accel, two_body_accel_body, zonal_accel, zonal_accel_body, EARTH_ZONALS_J2_J6,
};

/// Ten fixed inertial positions (m) spanning LEO → GEO and several geometries (equatorial,
/// polar, inclined, off-axis), the sample set the byte-identical assertions sweep over.
fn sample_positions() -> Vec<[f64; 3]> {
    vec![
        [7.0e6, 0.0, 0.0],
        [0.0, 7.0e6, 0.0],
        [0.0, 0.0, 7.0e6],
        [7.0e6, 1.0e6, 2.0e6],
        [-6.8e6, 3.0e6, -1.0e6],
        [4.2e7, 0.0, 0.0],
        [3.0e7, -2.0e7, 1.0e7],
        [-1.5e7, -1.5e7, 1.5e7],
        [6.6e6, 0.0, 3.3e6],
        [1.0e6, -2.0e6, 6.9e6],
    ]
}

/// The body-parameterised two-body acceleration, handed `Body::earth()`, must equal the legacy
/// `two_body_accel` to **exact** bit equality — proving the Earth path is byte-identical through
/// the new seam.
#[test]
fn two_body_body_earth_equals_legacy() {
    let earth = Body::earth();
    for r in sample_positions() {
        let legacy = two_body_accel(r);
        let bodied = two_body_accel_body(r, &earth);
        for k in 0..3 {
            assert_eq!(
                legacy[k], bodied[k],
                "axis {k} at r={r:?}: two_body_accel {} != two_body_accel_body {}",
                legacy[k], bodied[k]
            );
        }
    }
}

/// The body-parameterised zonal acceleration, handed `Body::earth()`, must equal the legacy
/// `zonal_accel(r, EARTH_ZONALS_J2_J6)` to **exact** bit equality.
#[test]
fn zonal_body_earth_equals_legacy() {
    let earth = Body::earth();
    for r in sample_positions() {
        let legacy = zonal_accel(r, &EARTH_ZONALS_J2_J6);
        let bodied = zonal_accel_body(r, &earth);
        for k in 0..3 {
            assert_eq!(
                legacy[k], bodied[k],
                "axis {k} at r={r:?}: zonal_accel {} != zonal_accel_body {}",
                legacy[k], bodied[k]
            );
        }
    }
}

/// Independent of the byte-identical assertions above: the body seam must actually re-target the
/// gravity at a *different* body. Mars two-body gravity at the same position differs from Earth's
/// (different μ) — the seam is real, not a constant alias.
#[test]
fn two_body_body_retargets_to_mars() {
    let earth = Body::earth();
    let mars = Body::mars();
    let r = [4.0e6, 0.0, 0.0];
    let ae = two_body_accel_body(r, &earth);
    let am = two_body_accel_body(r, &mars);
    // Earth μ ≈ 9.3× Mars μ, so Earth's pull at the same r is larger.
    assert!(
        ae[0].abs() > am[0].abs(),
        "Earth gravity must exceed Mars at equal r"
    );
    // And the magnitudes track the μ ratio (point-mass −μ/r² along x̂).
    let ratio = ae[0] / am[0];
    let mu_ratio = earth.mu / mars.mu;
    assert!(
        (ratio / mu_ratio - 1.0).abs() < 1e-12,
        "two-body accel ratio {ratio} must equal the μ ratio {mu_ratio}"
    );
}

/// The propagator's [`ForceModel`] defaults its central body to Earth, and routing the central
/// gravity through that body must change nothing for Earth: the default model and the same model
/// with an explicit `with_body(Body::earth())` must give the **exact same** acceleration and the
/// **exact same** propagated Earth LEO arc — byte-identical, the whole point of the seam.
#[test]
fn forcemodel_default_body_is_earth() {
    use kshana::integrator::Tolerance;
    use kshana::propagator::{propagate, ForceModel};

    // The default body is Earth.
    assert_eq!(ForceModel::two_body().body.name, "Earth");
    assert_eq!(ForceModel::two_body().body.mu, Body::earth().mu);

    let r = [7.0e6, 1.0e6, 2.0e6];
    // accel() through the default body == accel() with an explicit Earth body, exactly, across
    // the two-body, J2-only and full-zonal central-gravity branches.
    for (label, model) in [
        ("two_body", ForceModel::two_body()),
        ("with_j2", ForceModel::with_j2()),
        ("with_zonals_j2_j6", ForceModel::with_zonals_j2_j6()),
    ] {
        let default_a = model.clone().accel(r);
        let earth_a = model.with_body(Body::earth()).accel(r);
        for k in 0..3 {
            assert_eq!(
                default_a[k], earth_a[k],
                "{label} axis {k}: default-body accel {} != explicit-Earth accel {}",
                default_a[k], earth_a[k]
            );
        }
    }

    // And the same over a full propagated LEO arc (the end-to-end byte-identical check).
    let r0 = [7.0e6, 0.0, 0.0];
    let v0 = [0.0, 7.5e3, 1.0e3];
    let arc = 5400.0; // ~one LEO orbit.
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let default_model = ForceModel::with_zonals_j2_j6();
    let earth_model = ForceModel::with_zonals_j2_j6().with_body(Body::earth());
    let (rd, vd) = propagate(r0, v0, arc, &default_model, &tol);
    let (re, ve) = propagate(r0, v0, arc, &earth_model, &tol);
    for k in 0..3 {
        assert_eq!(
            rd[k], re[k],
            "propagated position axis {k} must be byte-identical"
        );
        assert_eq!(
            vd[k], ve[k],
            "propagated velocity axis {k} must be byte-identical"
        );
    }
}

/// The `with_body` seam re-targets the propagator's central gravity: a Mars two-body arc differs
/// from the Earth two-body arc from the same state — the body field actually drives the dynamics.
#[test]
fn forcemodel_with_body_retargets_to_mars() {
    use kshana::integrator::Tolerance;
    use kshana::propagator::{propagate, ForceModel};

    let r0 = [5.0e6, 0.0, 0.0];
    let v0 = [0.0, 3.0e3, 0.0];
    let arc = 2000.0;
    let tol = Tolerance::default();
    let (re, _) = propagate(r0, v0, arc, &ForceModel::two_body(), &tol);
    let (rm, _) = propagate(
        r0,
        v0,
        arc,
        &ForceModel::two_body().with_body(Body::mars()),
        &tol,
    );
    let sep = ((re[0] - rm[0]).powi(2) + (re[1] - rm[1]).powi(2) + (re[2] - rm[2]).powi(2)).sqrt();
    assert!(
        sep > 1.0,
        "Mars vs Earth two-body arcs must diverge, sep {sep} m"
    );
}
