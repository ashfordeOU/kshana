// SPDX-License-Identifier: AGPL-3.0-only
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

/// `Body::mars_gmm3` carries a fully-normalized Mars tesseral field with the right `GM`/`Re`, and
/// its `C̄20` round-trips to the shipped Mars `J2`: `J2 = −C̄20·√5` to ±1e-6. This pins the
/// zonal→normalized conversion the field is built from.
#[test]
fn mars_gmm3_loads_and_j2_matches() {
    use kshana::body::MARS_ZONALS_J2_J4;

    let mars = Body::mars_gmm3(8);
    let field = mars
        .gravity
        .as_ref()
        .expect("mars_gmm3 must carry a gravity field");
    // GM and Re are the Mars values.
    assert!(
        (field.gm - 4.282_837e13).abs() / field.gm < 1e-12,
        "GM {} (want 4.282837e13)",
        field.gm
    );
    assert!(
        (field.re - 3_396_200.0).abs() < 1e-3,
        "Re {} (want 3.3962e6)",
        field.re
    );
    // nmax clamps to the shipped degree 4 even when 8 is requested.
    assert_eq!(field.nmax, 4, "field clamps to the shipped degree 4");

    // Round-trip C̄20 → J2. The field is built with C̄20 = −J2/√5, so −C̄20·√5 must recover J2.
    let cbar20 = field.cbar(2, 0).expect("C̄20 present");
    let j2_recovered = -cbar20 * 5.0_f64.sqrt();
    let j2_expected = MARS_ZONALS_J2_J4[0]; // 1.96045e-3
    assert!(
        (j2_recovered - j2_expected).abs() < 1e-6,
        "round-trip J2 {j2_recovered} vs shipped {j2_expected} (Δ {})",
        (j2_recovered - j2_expected).abs()
    );
    // And it really is ≈ 1.9604e-3.
    assert!(
        (j2_recovered - 1.960_45e-3).abs() < 1e-6,
        "Mars J2 {j2_recovered} (want ≈ 1.9604e-3)"
    );
    // The J4 zonal (C̄40) is shipped too (field degree raised to 4); round-trip it.
    let cbar40 = field.cbar(4, 0).expect("C̄40 present (nmax=4)");
    let j4_recovered = -cbar40 * 9.0_f64.sqrt();
    let j4_expected = MARS_ZONALS_J2_J4[2]; // -1.538e-5
    assert!(
        (j4_recovered - j4_expected).abs() < 1e-9,
        "round-trip J4 {j4_recovered} vs shipped {j4_expected}"
    );
}

/// The Mars SH gravity (mars_gmm3) differs from a pure Mars two-body acceleration by the expected
/// J2-scale magnitude at a low Mars orbit, and is finite/sane. J2 ≈ 1.96e-3, so the oblateness
/// perturbation is ~1e-3 of the central term.
#[test]
fn mars_sh_gravity_differs_from_point_mass() {
    use kshana::forces::two_body_accel_body;
    use kshana::propagator::ForceModel;

    let mars = Body::mars_gmm3(3);
    // A low Mars orbit point (~400 km altitude), off all axes so the tesserals are exercised.
    let r = [2.8e6, 1.2e6, 1.4e6];
    let model = ForceModel::two_body().with_body(mars);
    let a_sh = model.accel(r);
    let a_tb = two_body_accel_body(r, &Body::mars());

    assert!(
        a_sh.iter().all(|x| x.is_finite()),
        "SH accel must be finite: {a_sh:?}"
    );

    let pert =
        ((a_sh[0] - a_tb[0]).powi(2) + (a_sh[1] - a_tb[1]).powi(2) + (a_sh[2] - a_tb[2]).powi(2))
            .sqrt();
    let central = (a_tb[0].powi(2) + a_tb[1].powi(2) + a_tb[2].powi(2)).sqrt();
    let rel = pert / central;
    // The Mars oblateness (J2 ≈ 1.96e-3) plus the (smaller) tesserals: a real, J2-scale
    // perturbation — bounded well below the central term but far above numerical noise.
    assert!(
        (1e-4..2e-2).contains(&rel),
        "Mars SH perturbation rel {rel} off the expected J2 scale (pert {pert}, central {central})"
    );
}

/// The Mars field carries non-zonal tesserals (C̄22/S̄22, C̄32/S̄32) fixed to the rotating planet,
/// so the gravitational acceleration at a *fixed inertial* point changes as Mars turns under it.
/// Evaluating the central gravity at the base epoch and a quarter-Mars-day later (Mars rotates
/// ~88°) must give a *different* inertial acceleration — proving the body-fixed rotation is
/// actually applied (a bug that skipped it would give an identical, rotation-invariant result).
#[test]
fn mars_sh_is_body_fixed() {
    use kshana::propagator::ForceModel;

    // A fixed inertial position off the equator and off the axes, so the sectoral/tesseral terms
    // contribute (a purely polar point would mute the longitude dependence).
    let r = [2.8e6, 1.2e6, 1.4e6];
    // One sidereal Mars day ≈ 88 642 s (ω = 7.088218e-5 rad/s ⇒ 2π/ω). A quarter day rotates the
    // body ~88° in longitude under the fixed inertial point.
    let quarter_mars_day = std::f64::consts::PI / 2.0 / 7.088_218e-5;

    let base_epoch = 2_459_580.5;
    let model0 = ForceModel::two_body()
        .with_body(Body::mars_gmm3(3))
        .third_body(false, false, base_epoch); // sets epoch_jd_tt without enabling perturbers
                                               // accel_at(t, r): the central SH gravity is evaluated at the advanced epoch base + t/86400.
    let a0 = model0.accel_at(0.0, r);
    let a1 = model0.accel_at(quarter_mars_day, r);

    let d = ((a0[0] - a1[0]).powi(2) + (a0[1] - a1[1]).powi(2) + (a0[2] - a1[2]).powi(2)).sqrt();
    // The tesseral signal is ~1e-5 m/s² at this radius; a quarter-turn reorientation must move the
    // acceleration by a real, well-above-noise amount. (If the rotation were not applied, d ≈ 0.)
    assert!(
        d > 1e-7,
        "body-fixed Mars field over a quarter Mars-day changed accel by only {d} m/s² \
         (expected a real reorientation — is the body-fixed rotation wired in?)"
    );
    assert!(a0.iter().chain(a1.iter()).all(|x| x.is_finite()));
}
