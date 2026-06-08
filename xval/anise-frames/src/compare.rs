// SPDX-License-Identifier: Apache-2.0
//! Rotation-matrix comparison metrics, frame-realization agnostic.
//!
//! Both sides of the cross-check produce an inertial -> Earth-fixed rotation as a
//! plain `[[f64; 3]; 3]`. These helpers quantify how far apart two such rotations
//! are in a way that is independent of any external library type:
//!
//! - [`relative_angle_rad`] / [`relative_angle_arcsec`] — the single rotation angle
//!   of `A·Bᵀ` (the rotation that carries `B`'s frame onto `A`'s). Direction-free,
//!   the cleanest scalar measure of frame disagreement.
//! - [`displacement_m`] — the physical separation of one concrete position vector
//!   rotated by `A` vs by `B` (what a user on the ground actually sees).
//! - [`worst_case_ground_m`] — `2·R·sin(θ/2)`, the largest possible displacement of
//!   any point at radius `R` under the relative rotation `θ` (the honest upper bound).

/// A 3x3 row-major rotation matrix, matching `kshana::precession::Mat3`.
pub type Mat3 = [[f64; 3]; 3];
/// A 3-vector, matching `kshana::frames::Vec3`.
pub type Vec3 = [f64; 3];

/// Radians in one arc second (`π / (180·3600)` inverted): 1 rad = 206264.806… arcsec.
pub const RAD_TO_ARCSEC: f64 = 648_000.0 / std::f64::consts::PI;

/// Matrix product `A·B`.
pub fn mat_mul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for (i, mi) in m.iter_mut().enumerate() {
        for (j, mij) in mi.iter_mut().enumerate() {
            *mij = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    m
}

/// Transpose.
pub fn transpose(m: &Mat3) -> Mat3 {
    let mut t = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            t[i][j] = m[j][i];
        }
    }
    t
}

/// Apply a rotation to a vector: `m·v`.
pub fn mat_vec(m: &Mat3, v: Vec3) -> Vec3 {
    [
        m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
    ]
}

/// Euclidean norm.
pub fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// The single rotation angle (radians) of `R = A·Bᵀ`, via the numerically stable
/// `θ = atan2(sinθ, cosθ)` with `sinθ = ½‖[R₃₂−R₂₃, R₁₃−R₃₁, R₂₁−R₁₂]‖` (the axis
/// vector length) and `cosθ = (tr R − 1)/2`. Zero when `A == B`; direction-independent.
///
/// The naive `arccos((tr−1)/2)` is unusable here: this cross-check produces
/// milliarcsecond-scale angles (~5e-9 rad), and near `θ=0` `arccos` of a value rounded
/// to ~1 amplifies the f64 rounding by `1/sinθ`, giving an error LARGER than the signal.
/// The `atan2` form recovers tiny angles to ~machine relative precision.
pub fn relative_angle_rad(a: &Mat3, b: &Mat3) -> f64 {
    let r = mat_mul(a, &transpose(b));
    let axis = [r[2][1] - r[1][2], r[0][2] - r[2][0], r[1][0] - r[0][1]];
    let sin_theta = 0.5 * norm(axis);
    let cos_theta = (r[0][0] + r[1][1] + r[2][2] - 1.0) / 2.0;
    sin_theta.atan2(cos_theta)
}

/// The relative rotation angle in arc seconds (see [`relative_angle_rad`]).
pub fn relative_angle_arcsec(a: &Mat3, b: &Mat3) -> f64 {
    relative_angle_rad(a, b) * RAD_TO_ARCSEC
}

/// Physical separation (same units as `r`) of the position `r` after rotating it by
/// `A` versus by `B`: `‖A·r − B·r‖`. This is what a user at position `r` experiences
/// as the frame disagreement — direction-dependent (a point on the relative-rotation
/// axis does not move).
pub fn displacement_m(a: &Mat3, b: &Mat3, r: Vec3) -> f64 {
    let pa = mat_vec(a, r);
    let pb = mat_vec(b, r);
    norm([pa[0] - pb[0], pa[1] - pb[1], pa[2] - pb[2]])
}

/// The worst-case displacement of any point at radius `radius_m` under the relative
/// rotation between `A` and `B`: `2·R·sin(θ/2)` with `θ` the [`relative_angle_rad`].
/// This is the honest upper bound on the ground/orbit position disagreement.
pub fn worst_case_ground_m(a: &Mat3, b: &Mat3, radius_m: f64) -> f64 {
    let theta = relative_angle_rad(a, b);
    2.0 * radius_m * (theta / 2.0).sin()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rz(theta: f64) -> Mat3 {
        let (s, c) = theta.sin_cos();
        [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]]
    }
    const I3: Mat3 = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];

    #[test]
    fn identity_vs_identity_is_zero() {
        assert!(relative_angle_rad(&I3, &I3) < 1e-15);
        assert!(relative_angle_arcsec(&I3, &I3) < 1e-9);
        assert_eq!(worst_case_ground_m(&I3, &I3, 6_378_137.0), 0.0);
    }

    #[test]
    fn relative_angle_recovers_a_known_rotation() {
        // tr(Rz(θ)·Iᵀ) = 2cosθ + 1 ⇒ arccos((tr−1)/2) = θ, for both a small and a
        // moderate angle, and the sense (A·Bᵀ) is symmetric in magnitude.
        for &theta in &[1e-6, 1e-3, 0.3_f64] {
            let m = rz(theta);
            assert!(
                (relative_angle_rad(&m, &I3) - theta).abs() < 1e-12,
                "θ = {theta}"
            );
            assert!((relative_angle_rad(&I3, &m) - theta).abs() < 1e-12);
        }
    }

    #[test]
    fn arcsec_conversion_is_correct() {
        // 1 arc second of rotation must read back as 1.0 arcsec.
        let one_arcsec_rad = 1.0 / RAD_TO_ARCSEC;
        assert!((relative_angle_arcsec(&rz(one_arcsec_rad), &I3) - 1.0).abs() < 1e-9);
    }

    #[test]
    fn displacement_matches_closed_form_for_a_perpendicular_point() {
        // A point on +y (⊥ to the z rotation axis) under Rz(θ) vs identity separates by
        // exactly 2R·sin(θ/2). For small θ this is ≈ R·θ.
        let r_radius = 6_378_137.0;
        let theta = 1e-6;
        let r = [0.0, r_radius, 0.0];
        let got = displacement_m(&rz(theta), &I3, r);
        let want = 2.0 * r_radius * (theta / 2.0).sin();
        assert!((got - want).abs() < 1e-6, "got {got}, want {want}");
        // ≈ R·θ ≈ 6.378 m for a 1 µrad rotation at Earth radius.
        assert!((got - r_radius * theta).abs() < 1e-3);
    }

    #[test]
    fn worst_case_bounds_any_concrete_displacement() {
        // The worst-case ground figure must bound the displacement of an arbitrary
        // point at the same radius, with equality only when the point is ⊥ to the axis.
        let r_radius = 7_000_000.0;
        let theta = 2.5e-6;
        let m = rz(theta);
        let wc = worst_case_ground_m(&m, &I3, r_radius);
        // On the axis (+z): no displacement; off-axis: bounded by wc.
        assert!(displacement_m(&m, &I3, [0.0, 0.0, r_radius]) < 1e-6);
        let oblique = [r_radius / 3.0_f64.sqrt(); 3];
        assert!(displacement_m(&m, &I3, oblique) <= wc + 1e-6);
    }
}
