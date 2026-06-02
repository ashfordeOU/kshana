// SPDX-License-Identifier: Apache-2.0
//! Three-axis attitude representation for strapdown inertial navigation.
//!
//! Orientation is carried as a unit quaternion (scalar-first, Hamilton
//! convention) representing the rotation from the **body** frame to the
//! **navigation** frame, i.e. `v_nav = q ⊗ v_body ⊗ q*`, equivalently
//! `v_nav = C * v_body` where `C = q.to_dcm()` is the body-to-nav direction
//! cosine matrix `C_n^b`.
//!
//! The quaternion is the numerically robust state for high-rate attitude
//! propagation: it is free of gimbal lock and stays on the rotation manifold
//! with a single renormalisation. The DCM view is provided for resolving
//! specific force from body to nav frame in the mechanization.
//!
//! References:
//! - P. D. Groves, *Principles of GNSS, Inertial, and Multisensor Integrated
//!   Navigation Systems*, 2nd ed., §2.2 (attitude), §5.5 (coning/sculling).
//! - P. G. Savage, "Strapdown Inertial Navigation Integration Algorithm
//!   Design Part 1," *J. Guidance, Control, and Dynamics* 21(1), 1998.

use crate::frames::Vec3;

#[inline]
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

#[inline]
fn norm3(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// Unit quaternion (scalar-first: `w + xi + yj + zk`) carrying body→nav rotation.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Quaternion {
    pub w: f64,
    pub x: f64,
    pub y: f64,
    pub z: f64,
}

impl Default for Quaternion {
    fn default() -> Self {
        Self::identity()
    }
}

impl Quaternion {
    /// The identity rotation.
    pub const fn identity() -> Self {
        Self {
            w: 1.0,
            x: 0.0,
            y: 0.0,
            z: 0.0,
        }
    }

    /// Construct from raw components (not assumed normalised).
    pub const fn new(w: f64, x: f64, y: f64, z: f64) -> Self {
        Self { w, x, y, z }
    }

    /// Right-handed rotation of `angle` radians about a (not necessarily unit)
    /// `axis`. A zero axis yields the identity.
    pub fn from_axis_angle(axis: Vec3, angle: f64) -> Self {
        let n = norm3(axis);
        if n == 0.0 {
            return Self::identity();
        }
        let half = 0.5 * angle;
        let s = half.sin() / n;
        Self {
            w: half.cos(),
            x: axis[0] * s,
            y: axis[1] * s,
            z: axis[2] * s,
        }
        .normalized()
    }

    /// Exact exponential map from a rotation vector `phi` (axis × angle, rad).
    /// Robust for the small angles seen at strapdown sub-step rates; reduces to
    /// `(1, phi/2)` as `|phi| → 0`.
    pub fn from_rotation_vector(phi: Vec3) -> Self {
        let m = norm3(phi);
        if m < 1e-12 {
            // Second-order series: cos(m/2) ≈ 1 - m²/8, sinc(m/2)/2 ≈ 1/2.
            return Self {
                w: 1.0 - m * m / 8.0,
                x: 0.5 * phi[0],
                y: 0.5 * phi[1],
                z: 0.5 * phi[2],
            }
            .normalized();
        }
        let half = 0.5 * m;
        let s = half.sin() / m;
        Self {
            w: half.cos(),
            x: phi[0] * s,
            y: phi[1] * s,
            z: phi[2] * s,
        }
    }

    /// Squared Euclidean norm of the 4-vector.
    pub fn norm_sq(&self) -> f64 {
        self.w * self.w + self.x * self.x + self.y * self.y + self.z * self.z
    }

    /// Euclidean norm of the 4-vector.
    pub fn norm(&self) -> f64 {
        self.norm_sq().sqrt()
    }

    /// Return the quaternion scaled to unit norm. A zero quaternion maps to the
    /// identity rather than producing NaNs.
    pub fn normalized(&self) -> Self {
        let n = self.norm();
        if n == 0.0 {
            return Self::identity();
        }
        Self {
            w: self.w / n,
            x: self.x / n,
            y: self.y / n,
            z: self.z / n,
        }
    }

    /// Conjugate (inverse rotation for a unit quaternion).
    pub fn conjugate(&self) -> Self {
        Self {
            w: self.w,
            x: -self.x,
            y: -self.y,
            z: -self.z,
        }
    }

    /// Hamilton product `self ⊗ other`. Rotation composition: applying `other`
    /// then `self` to a body vector.
    pub fn mul(&self, o: &Quaternion) -> Self {
        Self {
            w: self.w * o.w - self.x * o.x - self.y * o.y - self.z * o.z,
            x: self.w * o.x + self.x * o.w + self.y * o.z - self.z * o.y,
            y: self.w * o.y - self.x * o.z + self.y * o.w + self.z * o.x,
            z: self.w * o.z + self.x * o.y - self.y * o.x + self.z * o.w,
        }
    }

    /// Rotate a vector from body to nav frame: `v_nav = q ⊗ v_body ⊗ q*`.
    pub fn rotate(&self, v: Vec3) -> Vec3 {
        let dcm = self.to_dcm();
        [
            dcm[0][0] * v[0] + dcm[0][1] * v[1] + dcm[0][2] * v[2],
            dcm[1][0] * v[0] + dcm[1][1] * v[1] + dcm[1][2] * v[2],
            dcm[2][0] * v[0] + dcm[2][1] * v[1] + dcm[2][2] * v[2],
        ]
    }

    /// Body→nav direction cosine matrix `C_n^b` (row-major 3×3). Columns are the
    /// body axes expressed in the nav frame.
    pub fn to_dcm(&self) -> [[f64; 3]; 3] {
        let q = self.normalized();
        let (w, x, y, z) = (q.w, q.x, q.y, q.z);
        [
            [
                1.0 - 2.0 * (y * y + z * z),
                2.0 * (x * y - w * z),
                2.0 * (x * z + w * y),
            ],
            [
                2.0 * (x * y + w * z),
                1.0 - 2.0 * (x * x + z * z),
                2.0 * (y * z - w * x),
            ],
            [
                2.0 * (x * z - w * y),
                2.0 * (y * z + w * x),
                1.0 - 2.0 * (x * x + y * y),
            ],
        ]
    }

    /// Recover a quaternion from a body→nav DCM (Shepperd's method: pivot on the
    /// largest diagonal term for numerical conditioning).
    pub fn from_dcm(c: [[f64; 3]; 3]) -> Self {
        let trace = c[0][0] + c[1][1] + c[2][2];
        let q = if trace > 0.0 {
            let s = (trace + 1.0).sqrt() * 2.0;
            Self {
                w: 0.25 * s,
                x: (c[2][1] - c[1][2]) / s,
                y: (c[0][2] - c[2][0]) / s,
                z: (c[1][0] - c[0][1]) / s,
            }
        } else if c[0][0] > c[1][1] && c[0][0] > c[2][2] {
            let s = (1.0 + c[0][0] - c[1][1] - c[2][2]).sqrt() * 2.0;
            Self {
                w: (c[2][1] - c[1][2]) / s,
                x: 0.25 * s,
                y: (c[0][1] + c[1][0]) / s,
                z: (c[0][2] + c[2][0]) / s,
            }
        } else if c[1][1] > c[2][2] {
            let s = (1.0 + c[1][1] - c[0][0] - c[2][2]).sqrt() * 2.0;
            Self {
                w: (c[0][2] - c[2][0]) / s,
                x: (c[0][1] + c[1][0]) / s,
                y: 0.25 * s,
                z: (c[1][2] + c[2][1]) / s,
            }
        } else {
            let s = (1.0 + c[2][2] - c[0][0] - c[1][1]).sqrt() * 2.0;
            Self {
                w: (c[1][0] - c[0][1]) / s,
                x: (c[0][2] + c[2][0]) / s,
                y: (c[1][2] + c[2][1]) / s,
                z: 0.25 * s,
            }
        };
        q.normalized()
    }

    /// First-order kinematic update from a body angular-rate vector `omega_b`
    /// (rad/s) over `dt` seconds: `q̇ = ½ q ⊗ (0, ω_b)`, integrated as
    /// `q ← normalize(q + q̇·dt)`. Suitable for high-rate sub-step propagation
    /// where `|ω_b|·dt` is small; for whole-interval increments prefer
    /// [`Quaternion::integrate_rotation_vector`].
    pub fn propagate_rate(&self, omega_b: Vec3, dt: f64) -> Self {
        let omega = Quaternion::new(0.0, omega_b[0], omega_b[1], omega_b[2]);
        let qd = self.mul(&omega);
        Self {
            w: self.w + 0.5 * qd.w * dt,
            x: self.x + 0.5 * qd.x * dt,
            y: self.y + 0.5 * qd.y * dt,
            z: self.z + 0.5 * qd.z * dt,
        }
        .normalized()
    }

    /// Update attitude by composing with the exact rotation of `phi` (a
    /// coning-corrected body-frame rotation vector over one interval):
    /// `q ← q ⊗ exp(½ φ)`.
    pub fn integrate_rotation_vector(&self, phi: Vec3) -> Self {
        self.mul(&Quaternion::from_rotation_vector(phi))
            .normalized()
    }
}

/// Two-sample coning correction (Savage / Bryan–Lewantowski).
///
/// When the body angular-velocity vector rotates within an interval (coning
/// motion), naive summation of the per-sub-interval angle increments
/// under-integrates the true rotation. Given the previous and current gyro
/// angle increments `Δθ_prev`, `Δθ_cur` (rad), the coning contribution that
/// must be added to the summed increment is `½ (Δθ_prev × Δθ_cur)`.
///
/// The correction vanishes for any single-axis (non-coning) motion, where the
/// two increments are parallel.
pub fn coning_increment(dtheta_prev: Vec3, dtheta_cur: Vec3) -> Vec3 {
    let c = cross(dtheta_prev, dtheta_cur);
    [0.5 * c[0], 0.5 * c[1], 0.5 * c[2]]
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::{FRAC_PI_2, PI};

    fn close(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }
    fn vclose(a: Vec3, b: Vec3, tol: f64) -> bool {
        (0..3).all(|i| close(a[i], b[i], tol))
    }

    #[test]
    #[allow(clippy::needless_range_loop)] // paired i,j matrix indexing reads clearer than enumerate
    fn identity_leaves_vectors_unchanged() {
        let q = Quaternion::identity();
        let v = [1.0, -2.0, 3.0];
        assert!(vclose(q.rotate(v), v, 1e-15));
        let c = q.to_dcm();
        for i in 0..3 {
            for j in 0..3 {
                assert!(close(c[i][j], if i == j { 1.0 } else { 0.0 }, 1e-15));
            }
        }
    }

    #[test]
    fn ninety_degrees_about_z_is_active_rotation() {
        // Active rotation of +90° about nav z maps body-x → nav-y.
        let q = Quaternion::from_axis_angle([0.0, 0.0, 1.0], FRAC_PI_2);
        assert!(vclose(q.rotate([1.0, 0.0, 0.0]), [0.0, 1.0, 0.0], 1e-12));
        assert!(vclose(q.rotate([0.0, 1.0, 0.0]), [-1.0, 0.0, 0.0], 1e-12));
        assert!(vclose(q.rotate([0.0, 0.0, 1.0]), [0.0, 0.0, 1.0], 1e-12));
    }

    #[test]
    #[allow(clippy::needless_range_loop)] // paired i,j matrix indexing reads clearer than enumerate
    fn dcm_is_orthonormal_with_unit_determinant() {
        let q = Quaternion::from_axis_angle([1.0, 2.0, -0.5], 0.9).normalized();
        let c = q.to_dcm();
        // C Cᵀ = I.
        for i in 0..3 {
            for j in 0..3 {
                let d: f64 = (0..3).map(|k| c[i][k] * c[j][k]).sum();
                assert!(close(d, if i == j { 1.0 } else { 0.0 }, 1e-12));
            }
        }
        // det(C) = +1.
        let det = c[0][0] * (c[1][1] * c[2][2] - c[1][2] * c[2][1])
            - c[0][1] * (c[1][0] * c[2][2] - c[1][2] * c[2][0])
            + c[0][2] * (c[1][0] * c[2][1] - c[1][1] * c[2][0]);
        assert!(close(det, 1.0, 1e-12));
    }

    #[test]
    fn composition_matches_combined_rotation() {
        // 90° about x then 90° about y, applied to body-z.
        let qx = Quaternion::from_axis_angle([1.0, 0.0, 0.0], FRAC_PI_2);
        let qy = Quaternion::from_axis_angle([0.0, 1.0, 0.0], FRAC_PI_2);
        let combined = qy.mul(&qx); // apply qx first, then qy
        let v = [0.0, 0.0, 1.0];
        let step = qy.rotate(qx.rotate(v));
        assert!(vclose(combined.rotate(v), step, 1e-12));
    }

    #[test]
    fn rotation_vector_matches_axis_angle() {
        let axis = [0.3, -0.7, 0.2];
        let n = norm3(axis);
        let angle = 1.234;
        let unit = [axis[0] / n, axis[1] / n, axis[2] / n];
        let phi = [unit[0] * angle, unit[1] * angle, unit[2] * angle];
        let a = Quaternion::from_axis_angle(axis, angle);
        let b = Quaternion::from_rotation_vector(phi);
        // Quaternions equal up to sign; compare the action on a test vector.
        let v = [1.0, 0.5, -0.25];
        assert!(vclose(a.rotate(v), b.rotate(v), 1e-12));
    }

    #[test]
    fn dcm_round_trip_recovers_rotation() {
        let q = Quaternion::from_axis_angle([0.2, 1.0, -0.4], 2.5).normalized();
        let back = Quaternion::from_dcm(q.to_dcm());
        let v = [0.7, -0.3, 1.1];
        assert!(vclose(q.rotate(v), back.rotate(v), 1e-12));
    }

    #[test]
    fn constant_rate_propagation_matches_closed_form() {
        // Spin at 0.5 rad/s about z for 4 s via many small first-order steps.
        let omega = [0.0, 0.0, 0.5];
        let total = 4.0;
        let n = 40_000;
        let dt = total / n as f64;
        let mut q = Quaternion::identity();
        for _ in 0..n {
            q = q.propagate_rate(omega, dt);
        }
        let exact = Quaternion::from_axis_angle([0.0, 0.0, 1.0], 0.5 * total);
        let v = [1.0, 0.0, 0.0];
        assert!(vclose(q.rotate(v), exact.rotate(v), 1e-6));
    }

    #[test]
    fn coning_term_vanishes_for_single_axis_motion() {
        // Two parallel (single-axis) increments → no coning.
        let a = [0.0, 0.0, 0.01];
        let b = [0.0, 0.0, 0.013];
        assert!(vclose(coning_increment(a, b), [0.0, 0.0, 0.0], 1e-18));
    }

    #[test]
    fn coning_term_is_nonzero_for_coning_motion() {
        // Successive increments about orthogonal axes (the canonical cone).
        let a = [0.01, 0.0, 0.0];
        let b = [0.0, 0.01, 0.0];
        let c = coning_increment(a, b);
        // ½ (x̂ × ŷ)·|a||b| = ½·0.0001 ẑ.
        assert!(vclose(c, [0.0, 0.0, 0.5e-4], 1e-18));
        assert!(norm3(c) > 0.0);
    }

    #[test]
    fn half_turn_is_self_inverse() {
        let q = Quaternion::from_axis_angle([0.0, 1.0, 0.0], PI);
        let back = q.mul(&q); // 360° == identity (up to sign)
        let v = [1.0, 2.0, 3.0];
        assert!(vclose(back.rotate(v), v, 1e-12));
    }
}
