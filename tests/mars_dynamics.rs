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
