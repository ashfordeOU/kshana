// SPDX-License-Identifier: AGPL-3.0-only
//! Torque-free rigid-body attitude dynamics: Euler's rotational equations of
//! motion coupled to quaternion attitude kinematics, integrated with a
//! fixed-step RK4 propagator.
//!
//! The state is `(q, ω)`:
//! - `q` is the body→inertial unit quaternion (scalar-first, Hamilton
//!   convention) reusing [`crate::inertial::attitude::Quaternion`], so the same
//!   rotation conventions as the strapdown mechanization apply here.
//! - `ω` is the body-frame angular velocity (rad/s).
//!
//! **Euler's equations** for a rigid body with inertia tensor `I` (taken in the
//! body frame, expressed about the centre of mass on principal-or-general axes)
//! under an external body torque `τ` are
//!
//! ```text
//!   I ω̇ = τ − ω × (I ω)
//!   ω̇   = I⁻¹ ( τ − ω × (I ω) )
//! ```
//!
//! In the **torque-free** case (`τ = 0`) this reduces to
//! `ω̇ = I⁻¹ ( −ω × Iω )`. The free rigid body then conserves two scalars:
//! the rotational kinetic energy `T = ½ ωᵀ I ω` and the *body-frame*
//! angular-momentum magnitude `|h| = |I ω|` (the inertial angular-momentum
//! vector is conserved; its body-frame components rotate, but the magnitude is
//! invariant). These are the invariants the reference tests assert.
//!
//! **Quaternion kinematics.** With `ω` resolved in the body frame and `q` the
//! body→inertial rotation, the attitude evolves as
//! `q̇ = ½ q ⊗ (0, ω)`. The quaternion is re-normalised every step so it stays
//! on the unit 3-sphere.
//!
//! **Symmetric top.** For an axisymmetric body (`I₁ = I₂ = I_t ≠ I₃ = I_a`) the
//! transverse angular velocity traces a circle in the body frame — the
//! *body-cone* polhode — at the analytic precession rate
//! `λ = ω₃ (I_a − I_t) / I_t` (Euler's free-top solution). The reference test
//! reproduces this rate, closing the loop on the dynamics independently of the
//! conservation laws.
//!
//! This is a **MODELLED** first-principles capability: the tests check physical
//! self-consistency invariants (norm, energy, angular-momentum magnitude) and a
//! closed-form precession rate, *not* an external dataset. They are honest
//! internal-consistency oracles, not a validation against an authoritative
//! third party.
//!
//! References:
//! - H. Goldstein, C. Poole, J. Safko, *Classical Mechanics*, 3rd ed., §5.6–5.7
//!   (Euler's equations; torque-free symmetric top).
//! - J. R. Wertz (ed.), *Spacecraft Attitude Determination and Control*, §16
//!   (rigid-body dynamics, quaternion kinematics).
//! - B. Wie, *Space Vehicle Dynamics and Control*, 2nd ed., §6 (attitude
//!   dynamics and the polhode).

use crate::frames::Vec3;
use crate::inertial::attitude::Quaternion;

#[inline]
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

#[inline]
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

#[inline]
fn norm3(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// A rigid body's inertia tensor about the centre of mass, expressed in the body
/// frame (row-major 3×3, kg·m²). Must be symmetric positive-definite.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Inertia {
    /// Row-major 3×3 inertia tensor `I` (kg·m²).
    pub matrix: [[f64; 3]; 3],
}

impl Inertia {
    /// Build a diagonal (principal-axis) inertia tensor from its principal
    /// moments `(I₁, I₂, I₃)`.
    ///
    /// # Panics
    /// Panics if any principal moment is non-positive (an unphysical body).
    pub fn principal(i1: f64, i2: f64, i3: f64) -> Self {
        assert!(
            i1 > 0.0 && i2 > 0.0 && i3 > 0.0,
            "principal moments of inertia must be strictly positive: ({i1}, {i2}, {i3})"
        );
        Self {
            matrix: [[i1, 0.0, 0.0], [0.0, i2, 0.0], [0.0, 0.0, i3]],
        }
    }

    /// Build from a general (possibly non-diagonal) symmetric tensor.
    ///
    /// The tensor is symmetrised (`½(I + Iᵀ)`) to absorb round-off in the
    /// caller's off-diagonal terms, then checked for symmetry of the input and
    /// positive-definiteness via leading-minor (Sylvester) criteria.
    ///
    /// # Panics
    /// Panics if the supplied tensor is materially non-symmetric or not
    /// positive-definite.
    pub fn general(matrix: [[f64; 3]; 3]) -> Self {
        // Reject a materially non-symmetric input (a transcription error), but
        // tolerate round-off by symmetrising afterwards.
        #[allow(clippy::needless_range_loop)] // paired i,j upper-triangle indexing reads clearer than enumerate
        for i in 0..3 {
            for j in (i + 1)..3 {
                let asym = (matrix[i][j] - matrix[j][i]).abs();
                let scale = matrix[i][j].abs().max(matrix[j][i].abs()).max(1.0);
                assert!(
                    asym <= 1e-9 * scale,
                    "inertia tensor must be symmetric: I[{i}][{j}]={} != I[{j}][{i}]={}",
                    matrix[i][j],
                    matrix[j][i]
                );
            }
        }
        let mut m = [[0.0; 3]; 3];
        #[allow(clippy::needless_range_loop)] // transpose read matrix[j][i] cannot be expressed via enumerate
        for i in 0..3 {
            for j in 0..3 {
                m[i][j] = 0.5 * (matrix[i][j] + matrix[j][i]);
            }
        }
        // Sylvester's criterion for positive-definiteness via leading minors.
        let d1 = m[0][0];
        let d2 = m[0][0] * m[1][1] - m[0][1] * m[1][0];
        let d3 = det3(m);
        assert!(
            d1 > 0.0 && d2 > 0.0 && d3 > 0.0,
            "inertia tensor must be positive-definite (leading minors {d1}, {d2}, {d3})"
        );
        Self { matrix: m }
    }

    /// Apply the tensor to a body-frame vector: `I ω`.
    #[inline]
    pub fn apply(&self, w: Vec3) -> Vec3 {
        let m = &self.matrix;
        [
            m[0][0] * w[0] + m[0][1] * w[1] + m[0][2] * w[2],
            m[1][0] * w[0] + m[1][1] * w[1] + m[1][2] * w[2],
            m[2][0] * w[0] + m[2][1] * w[1] + m[2][2] * w[2],
        ]
    }

    /// Solve `I x = b` for `x` (i.e. apply `I⁻¹`) via Cramer's rule on the 3×3.
    #[inline]
    pub fn solve(&self, b: Vec3) -> Vec3 {
        let m = &self.matrix;
        let det = det3(*m);
        // Replace each column with b and take the ratio of determinants.
        let col0 = [
            [b[0], m[0][1], m[0][2]],
            [b[1], m[1][1], m[1][2]],
            [b[2], m[2][1], m[2][2]],
        ];
        let col1 = [
            [m[0][0], b[0], m[0][2]],
            [m[1][0], b[1], m[1][2]],
            [m[2][0], b[2], m[2][2]],
        ];
        let col2 = [
            [m[0][0], m[0][1], b[0]],
            [m[1][0], m[1][1], b[1]],
            [m[2][0], m[2][1], b[2]],
        ];
        [det3(col0) / det, det3(col1) / det, det3(col2) / det]
    }
}

#[inline]
fn det3(m: [[f64; 3]; 3]) -> f64 {
    m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
}

/// The combined attitude-dynamics state: body→inertial orientation `q` and
/// body-frame angular velocity `ω` (rad/s).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AttitudeState {
    /// Body→inertial unit quaternion (scalar-first, Hamilton).
    pub q: Quaternion,
    /// Body-frame angular velocity (rad/s).
    pub omega: Vec3,
}

impl AttitudeState {
    /// Construct a state, normalising the quaternion.
    pub fn new(q: Quaternion, omega: Vec3) -> Self {
        Self {
            q: q.normalized(),
            omega,
        }
    }

    /// Rotational kinetic energy `T = ½ ωᵀ I ω` (J) for the given inertia.
    pub fn kinetic_energy(&self, inertia: &Inertia) -> f64 {
        0.5 * dot(self.omega, inertia.apply(self.omega))
    }

    /// Body-frame angular-momentum vector `h_b = I ω` (kg·m²/s).
    pub fn angular_momentum_body(&self, inertia: &Inertia) -> Vec3 {
        inertia.apply(self.omega)
    }

    /// Magnitude of the angular-momentum vector `|I ω|` (kg·m²/s); invariant
    /// under torque-free motion.
    pub fn angular_momentum_magnitude(&self, inertia: &Inertia) -> f64 {
        norm3(self.angular_momentum_body(inertia))
    }

    /// Inertial-frame angular-momentum vector `h_i = q ⊗ (I ω) ⊗ q*`
    /// (kg·m²/s); the full vector (not just its magnitude) is conserved under
    /// torque-free motion.
    pub fn angular_momentum_inertial(&self, inertia: &Inertia) -> Vec3 {
        self.q.rotate(self.angular_momentum_body(inertia))
    }
}

/// The two pieces of the state derivative: `q̇` (as a raw 4-vector, not yet a
/// unit quaternion) and `ω̇`.
#[derive(Clone, Copy, Debug)]
struct StateDot {
    q_dot: Quaternion,
    omega_dot: Vec3,
}

/// Euler's rotational equation: `ω̇ = I⁻¹ ( τ − ω × (I ω) )`.
///
/// Pass `torque = [0.0; 3]` for the torque-free case.
pub fn euler_omega_dot(inertia: &Inertia, omega: Vec3, torque: Vec3) -> Vec3 {
    let h = inertia.apply(omega);
    let gyro = cross(omega, h); // ω × Iω
    let rhs = [torque[0] - gyro[0], torque[1] - gyro[1], torque[2] - gyro[2]];
    inertia.solve(rhs)
}

/// Quaternion kinematics: `q̇ = ½ q ⊗ (0, ω)` (body-frame `ω`).
///
/// Returned as a raw (un-normalised) quaternion 4-vector — it is a tangent
/// vector, not a rotation.
fn quat_dot(q: &Quaternion, omega: Vec3) -> Quaternion {
    let omega_q = Quaternion::new(0.0, omega[0], omega[1], omega[2]);
    let p = q.mul(&omega_q);
    Quaternion::new(0.5 * p.w, 0.5 * p.x, 0.5 * p.y, 0.5 * p.z)
}

/// Full state derivative for the rigid-body attitude dynamics under `torque`.
fn state_dot(inertia: &Inertia, s: &AttitudeState, torque: Vec3) -> StateDot {
    StateDot {
        q_dot: quat_dot(&s.q, s.omega),
        omega_dot: euler_omega_dot(inertia, s.omega, torque),
    }
}

#[inline]
fn q_add_scaled(base: &Quaternion, k: &Quaternion, h: f64) -> Quaternion {
    Quaternion::new(
        base.w + h * k.w,
        base.x + h * k.x,
        base.y + h * k.y,
        base.z + h * k.z,
    )
}

#[inline]
fn v_add_scaled(base: Vec3, k: Vec3, h: f64) -> Vec3 {
    [base[0] + h * k[0], base[1] + h * k[1], base[2] + h * k[2]]
}

/// One fixed-step classical RK4 step of the coupled `(q, ω)` dynamics under a
/// constant body `torque` over `dt` seconds. The quaternion is integrated as a
/// 4-vector and **re-normalised** at the end of the step so the state stays on
/// the unit 3-sphere.
pub fn rk4_step(inertia: &Inertia, s: &AttitudeState, torque: Vec3, dt: f64) -> AttitudeState {
    // The RK4 stages are evaluated on the *raw* (un-normalised) quaternion so the
    // tangent directions are consistent; we renormalise only once, after the step.
    let raw = AttitudeState {
        q: s.q,
        omega: s.omega,
    };

    let k1 = state_dot(inertia, &raw, torque);

    let s2 = AttitudeState {
        q: q_add_scaled(&raw.q, &k1.q_dot, 0.5 * dt),
        omega: v_add_scaled(raw.omega, k1.omega_dot, 0.5 * dt),
    };
    let k2 = state_dot(inertia, &s2, torque);

    let s3 = AttitudeState {
        q: q_add_scaled(&raw.q, &k2.q_dot, 0.5 * dt),
        omega: v_add_scaled(raw.omega, k2.omega_dot, 0.5 * dt),
    };
    let k3 = state_dot(inertia, &s3, torque);

    let s4 = AttitudeState {
        q: q_add_scaled(&raw.q, &k3.q_dot, dt),
        omega: v_add_scaled(raw.omega, k3.omega_dot, dt),
    };
    let k4 = state_dot(inertia, &s4, torque);

    let h6 = dt / 6.0;
    let q_new = Quaternion::new(
        raw.q.w + h6 * (k1.q_dot.w + 2.0 * k2.q_dot.w + 2.0 * k3.q_dot.w + k4.q_dot.w),
        raw.q.x + h6 * (k1.q_dot.x + 2.0 * k2.q_dot.x + 2.0 * k3.q_dot.x + k4.q_dot.x),
        raw.q.y + h6 * (k1.q_dot.y + 2.0 * k2.q_dot.y + 2.0 * k3.q_dot.y + k4.q_dot.y),
        raw.q.z + h6 * (k1.q_dot.z + 2.0 * k2.q_dot.z + 2.0 * k3.q_dot.z + k4.q_dot.z),
    );
    let omega_new = [
        raw.omega[0]
            + h6 * (k1.omega_dot[0]
                + 2.0 * k2.omega_dot[0]
                + 2.0 * k3.omega_dot[0]
                + k4.omega_dot[0]),
        raw.omega[1]
            + h6 * (k1.omega_dot[1]
                + 2.0 * k2.omega_dot[1]
                + 2.0 * k3.omega_dot[1]
                + k4.omega_dot[1]),
        raw.omega[2]
            + h6 * (k1.omega_dot[2]
                + 2.0 * k2.omega_dot[2]
                + 2.0 * k3.omega_dot[2]
                + k4.omega_dot[2]),
    ];

    AttitudeState {
        q: q_new.normalized(),
        omega: omega_new,
    }
}

/// Propagate the coupled dynamics for `steps` fixed RK4 steps of size `dt` under
/// a constant body `torque`, returning the final state.
pub fn propagate(
    inertia: &Inertia,
    initial: &AttitudeState,
    torque: Vec3,
    dt: f64,
    steps: usize,
) -> AttitudeState {
    let mut s = AttitudeState {
        q: initial.q.normalized(),
        omega: initial.omega,
    };
    for _ in 0..steps {
        s = rk4_step(inertia, &s, torque, dt);
    }
    s
}

/// The analytic body-frame (polhode) precession rate of a torque-free
/// **symmetric top** (`I_transverse` about the two equal axes, `I_axial` about
/// the symmetry axis): `λ = ω_axial (I_axial − I_transverse) / I_transverse`.
///
/// The transverse component of `ω` rotates about the symmetry axis at this
/// (signed) rate. Provided as the closed-form oracle the reference test checks
/// the propagated dynamics against.
pub fn symmetric_top_body_rate(i_transverse: f64, i_axial: f64, omega_axial: f64) -> f64 {
    omega_axial * (i_axial - i_transverse) / i_transverse
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::PI;

    fn close(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn inertia_apply_and_solve_are_inverse() {
        let inertia = Inertia::general([[8.0, 1.0, -0.5], [1.0, 12.0, 0.7], [-0.5, 0.7, 15.0]]);
        let w = [0.3, -0.2, 0.5];
        let h = inertia.apply(w);
        let back = inertia.solve(h);
        assert!(close(back[0], w[0], 1e-12));
        assert!(close(back[1], w[1], 1e-12));
        assert!(close(back[2], w[2], 1e-12));
    }

    #[test]
    fn principal_solve_is_componentwise() {
        let inertia = Inertia::principal(2.0, 4.0, 8.0);
        let x = inertia.solve([2.0, 4.0, 8.0]);
        assert!(close(x[0], 1.0, 1e-15));
        assert!(close(x[1], 1.0, 1e-15));
        assert!(close(x[2], 1.0, 1e-15));
    }

    #[test]
    fn spherical_top_has_zero_euler_torque() {
        // A spherical top (I = k·1) has ω × Iω = k (ω × ω) = 0, so ω̇ = 0.
        let inertia = Inertia::principal(5.0, 5.0, 5.0);
        let dot = euler_omega_dot(&inertia, [0.1, 0.2, 0.3], [0.0; 3]);
        assert!(close(dot[0], 0.0, 1e-15));
        assert!(close(dot[1], 0.0, 1e-15));
        assert!(close(dot[2], 0.0, 1e-15));
    }

    #[test]
    fn spin_about_principal_axis_is_steady() {
        // Pure spin about a single principal axis is a fixed point of Euler's eqs.
        let inertia = Inertia::principal(3.0, 5.0, 7.0);
        for axis in 0..3 {
            let mut w = [0.0; 3];
            w[axis] = 1.3;
            let dot = euler_omega_dot(&inertia, w, [0.0; 3]);
            assert!(close(dot[0], 0.0, 1e-15));
            assert!(close(dot[1], 0.0, 1e-15));
            assert!(close(dot[2], 0.0, 1e-15));
        }
    }

    #[test]
    fn torque_free_conserves_energy_and_momentum_short() {
        let inertia = Inertia::principal(4.0, 9.0, 12.0);
        let s0 = AttitudeState::new(Quaternion::identity(), [0.6, -0.4, 0.2]);
        let t0 = s0.kinetic_energy(&inertia);
        let h0 = s0.angular_momentum_magnitude(&inertia);
        let s = propagate(&inertia, &s0, [0.0; 3], 1e-3, 5_000);
        assert!(close(s.kinetic_energy(&inertia), t0, 1e-10 * t0.abs()));
        assert!(close(s.angular_momentum_magnitude(&inertia), h0, 1e-10 * h0.abs()));
        assert!(close(s.q.norm(), 1.0, 1e-12));
    }

    #[test]
    fn quat_dot_is_half_q_times_omega() {
        let q = Quaternion::from_axis_angle([0.2, -0.3, 0.5], 0.7);
        let omega = [0.1, 0.2, -0.3];
        let qd = quat_dot(&q, omega);
        // Compare against an explicit ½ q⊗(0,ω).
        let oq = Quaternion::new(0.0, omega[0], omega[1], omega[2]);
        let p = q.mul(&oq);
        assert!(close(qd.w, 0.5 * p.w, 1e-15));
        assert!(close(qd.x, 0.5 * p.x, 1e-15));
        assert!(close(qd.y, 0.5 * p.y, 1e-15));
        assert!(close(qd.z, 0.5 * p.z, 1e-15));
    }

    #[test]
    fn symmetric_top_rate_sign_matches_prolate_oblate() {
        // Prolate (I_a < I_t): rate negative; oblate (I_a > I_t): rate positive.
        assert!(symmetric_top_body_rate(10.0, 4.0, 1.0) < 0.0);
        assert!(symmetric_top_body_rate(4.0, 10.0, 1.0) > 0.0);
        // Symmetric→sphere about that axis: zero rate.
        assert!(close(symmetric_top_body_rate(5.0, 5.0, 1.0), 0.0, 1e-15));
    }

    #[test]
    fn symmetric_top_body_cone_precesses_at_analytic_rate() {
        // Axisymmetric body: I1 = I2 = I_t, I3 = I_a.
        let i_t = 6.0;
        let i_a = 10.0;
        let inertia = Inertia::principal(i_t, i_t, i_a);
        let w_axial = 2.0;
        let w_perp0 = 0.5;
        let s0 = AttitudeState::new(Quaternion::identity(), [w_perp0, 0.0, w_axial]);

        let lambda = symmetric_top_body_rate(i_t, i_a, w_axial);
        // Propagate a quarter of the body-cone period and check the transverse
        // ω has rotated by ~λ·t in the body x–y plane.
        let period = 2.0 * PI / lambda.abs();
        let t = 0.25 * period;
        let dt = 1e-4;
        let steps = (t / dt).round() as usize;
        let s = propagate(&inertia, &s0, [0.0; 3], dt, steps);

        let angle_expected = lambda * (steps as f64 * dt);
        let wx = w_perp0 * angle_expected.cos();
        let wy = w_perp0 * angle_expected.sin();
        assert!(close(s.omega[0], wx, 1e-6), "wx {} vs {}", s.omega[0], wx);
        assert!(close(s.omega[1], wy, 1e-6), "wy {} vs {}", s.omega[1], wy);
        assert!(close(s.omega[2], w_axial, 1e-9), "w_axial drifted");
    }
}
