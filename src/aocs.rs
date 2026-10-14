// SPDX-License-Identifier: AGPL-3.0-only
//! **Attitude and orbit control (AOCS): closed-loop MRP feedback with reaction wheels.**
//!
//! A rigid spacecraft hub with balanced reaction wheels is driven to an inertial target
//! attitude by the modified-Rodrigues-parameter (MRP) feedback law of Schaub and Junkins
//! (*Analytical Mechanics of Space Systems*, the MRP steering and feedback chapter), in the
//! form Basilisk's `mrpFeedback` module documents. The wheel motor torques come from the
//! minimum-norm inverse of the spin-axis matrix, each clipped to the wheel's limit.
//!
//! ## Conventions
//!
//! * `q` is the body→inertial unit quaternion of [`crate::inertial::attitude::Quaternion`]
//!   (scalar first, Hamilton). Its components are the Euler parameters of `[BN]`, the
//!   inertial-to-body direction cosine matrix. The MRP set is `σ_BN = q_v / (1 + q_w)` with the
//!   quaternion sign chosen so `q_w ≥ 0`, which keeps `|σ| ≤ 1`.
//! * `ω` is the body angular velocity relative to inertial space, in body axes (rad/s).
//! * The hub inertia `I` (body axes, about the centre of mass) **includes** each wheel's spin
//!   inertia `J_s ĝ ĝᵀ`. Balanced wheels add no other mass property.
//! * `Ω_i` is wheel `i`'s spin rate relative to the body (rad/s), about its unit axis `ĝ_i`.
//!
//! ## Control law (inertial pointing, so `σ_BR = σ_BN` and `ω_BR = ω`)
//!
//! ```text
//!   L_r = −K σ_BR − P ω_BR              (required torque on the body)
//!   u   = G_sᵀ (G_s G_sᵀ)⁻¹ (−L_r)       (wheel motor torques), then u_i ∈ [−u_max, u_max]
//! ```
//!
//! ## Dynamics
//!
//! ```text
//!   (I − Σ J_s ĝ ĝᵀ) ω̇ = −ω × (I ω) − Σ (ĝ u + J_s Ω ω × ĝ)
//!   Ω̇_i = u_i / J_s − ĝ_iᵀ ω̇
//!   q̇ = ½ q ⊗ (0, ω)
//! ```
//!
//! The control is evaluated from the state at each step and held over the step (zero-order
//! hold), and the state is integrated with fixed-step RK4.
//!
//! What is not modelled: wheel friction, jitter, speed limits and power, sensor noise in the
//! loop, integral feedback, and tracking guidance.

// Dense 3x3 and 6x6 matrix arithmetic reads clearest with index loops.
#![allow(clippy::needless_range_loop)]

use crate::attitude_dynamics::Inertia;
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

fn mat_vec(m: &[[f64; 3]; 3], v: Vec3) -> Vec3 {
    [dot(m[0], v), dot(m[1], v), dot(m[2], v)]
}

fn inv3(m: &[[f64; 3]; 3]) -> Option<[[f64; 3]; 3]> {
    let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
    if !det.is_finite() || det.abs() < 1e-300 {
        return None;
    }
    let c =
        |r0: usize, c0: usize, r1: usize, c1: usize| m[r0][c0] * m[r1][c1] - m[r0][c1] * m[r1][c0];
    Some([
        [
            c(1, 1, 2, 2) / det,
            -c(0, 1, 2, 2) / det,
            c(0, 1, 1, 2) / det,
        ],
        [
            -c(1, 0, 2, 2) / det,
            c(0, 0, 2, 2) / det,
            -c(0, 0, 1, 2) / det,
        ],
        [
            c(1, 0, 2, 1) / det,
            -c(0, 0, 2, 1) / det,
            c(0, 0, 1, 1) / det,
        ],
    ])
}

/// The MRP set `σ_BN` of a body→inertial quaternion, on the branch with `|σ| ≤ 1`.
pub fn mrp_from_quaternion(q: &Quaternion) -> Vec3 {
    let q = q.normalized();
    let s = if q.w < 0.0 { -1.0 } else { 1.0 };
    let d = 1.0 + s * q.w;
    [s * q.x / d, s * q.y / d, s * q.z / d]
}

/// The body→inertial quaternion of an MRP set `σ_BN` (either branch).
pub fn quaternion_from_mrp(sigma: Vec3) -> Quaternion {
    let s2 = dot(sigma, sigma);
    let d = 1.0 + s2;
    Quaternion::new(
        (1.0 - s2) / d,
        2.0 * sigma[0] / d,
        2.0 * sigma[1] / d,
        2.0 * sigma[2] / d,
    )
    .normalized()
}

/// One balanced reaction wheel.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Wheel {
    /// Spin axis in body axes (unit vector).
    pub gs: Vec3,
    /// Spin-axis inertia (kg m²).
    pub js: f64,
    /// Motor torque limit (N m).
    pub u_max: f64,
}

/// The spacecraft and its controller.
#[derive(Clone, Debug)]
pub struct AocsConfig {
    /// Hub inertia including every wheel's `J_s ĝ ĝᵀ` (kg m², body axes, symmetric).
    pub inertia: [[f64; 3]; 3],
    /// The wheels.
    pub wheels: Vec<Wheel>,
    /// Proportional MRP gain `K` (N m).
    pub k: f64,
    /// Rate gain `P` (N m s).
    pub p: f64,
}

/// The closed-loop state.
#[derive(Clone, Debug, PartialEq)]
pub struct AocsState {
    /// Body→inertial attitude.
    pub q: Quaternion,
    /// Body rate relative to inertial, body axes (rad/s).
    pub omega: Vec3,
    /// Wheel spin rates relative to the body (rad/s).
    pub wheel_speed: Vec<f64>,
}

impl AocsConfig {
    /// Check the configuration: finite positive gains, at least three wheels spanning the
    /// three body axes, unit spin axes, positive inertias and limits, and an inertia whose
    /// wheel-reduced form is positive-definite.
    pub fn validate(&self) -> Result<(), String> {
        if !(self.k.is_finite() && self.k > 0.0 && self.p.is_finite() && self.p > 0.0) {
            return Err("gains K and P must be finite and positive".into());
        }
        if self.wheels.len() < 3 {
            return Err("at least three reaction wheels are required".into());
        }
        for (i, w) in self.wheels.iter().enumerate() {
            let n = dot(w.gs, w.gs).sqrt();
            if (n - 1.0).abs().is_nan() || (n - 1.0).abs() >= 1e-9 {
                return Err(format!("wheel {i}: spin axis must be a unit vector"));
            }
            if !(w.js.is_finite() && w.js > 0.0 && w.u_max.is_finite() && w.u_max > 0.0) {
                return Err(format!(
                    "wheel {i}: js and u_max must be finite and positive"
                ));
            }
        }
        if inv3(&self.gs_gst()).is_none() {
            return Err("the wheel spin axes do not span three dimensions".into());
        }
        let m = self.reduced_inertia();
        let d1 = m[0][0];
        let d2 = m[0][0] * m[1][1] - m[0][1] * m[1][0];
        let d3 = inv3(&m).map(|_| {
            m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
                - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
                + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
        });
        if !(d1 > 0.0 && d2 > 0.0 && d3.is_some_and(|d| d > 0.0)) {
            return Err("inertia minus the wheels' spin inertia must be positive-definite".into());
        }
        for r in 0..3 {
            for c in 0..3 {
                if !self.inertia[r][c].is_finite()
                    || (self.inertia[r][c] - self.inertia[c][r]).abs() > 1e-9
                {
                    return Err("inertia must be finite and symmetric".into());
                }
            }
        }
        Ok(())
    }

    fn gs_gst(&self) -> [[f64; 3]; 3] {
        let mut m = [[0.0; 3]; 3];
        for w in &self.wheels {
            for r in 0..3 {
                for c in 0..3 {
                    m[r][c] += w.gs[r] * w.gs[c];
                }
            }
        }
        m
    }

    fn reduced_inertia(&self) -> [[f64; 3]; 3] {
        let mut m = self.inertia;
        for w in &self.wheels {
            for r in 0..3 {
                for c in 0..3 {
                    m[r][c] -= w.js * w.gs[r] * w.gs[c];
                }
            }
        }
        m
    }

    /// Required control torque on the body `L_r = −K σ_BN − P ω` (inertial pointing).
    pub fn required_torque(&self, s: &AocsState) -> Vec3 {
        let sigma = mrp_from_quaternion(&s.q);
        [
            -self.k * sigma[0] - self.p * s.omega[0],
            -self.k * sigma[1] - self.p * s.omega[1],
            -self.k * sigma[2] - self.p * s.omega[2],
        ]
    }

    /// Minimum-norm wheel motor torques with `G_s u = −L_r`, before the wheel limits.
    pub fn motor_torques_unclipped(&self, lr: Vec3) -> Vec<f64> {
        let inv = inv3(&self.gs_gst()).expect("checked by validate");
        let v = mat_vec(&inv, [-lr[0], -lr[1], -lr[2]]);
        self.wheels.iter().map(|w| dot(w.gs, v)).collect()
    }

    /// The motor torques the wheels apply: [`Self::motor_torques_unclipped`] clipped to
    /// `±u_max` per wheel.
    pub fn motor_torques(&self, s: &AocsState) -> Vec<f64> {
        self.motor_torques_unclipped(self.required_torque(s))
            .into_iter()
            .zip(&self.wheels)
            .map(|(u, w)| u.clamp(-w.u_max, w.u_max))
            .collect()
    }

    /// `(ω̇, Ω̇)` for applied motor torques `u` and an external body torque.
    pub fn rates(
        &self,
        omega: Vec3,
        wheel_speed: &[f64],
        u: &[f64],
        torque_ext: Vec3,
    ) -> (Vec3, Vec<f64>) {
        let i_w = mat_vec(&self.inertia, omega);
        let mut rhs = cross(omega, i_w);
        rhs = [
            torque_ext[0] - rhs[0],
            torque_ext[1] - rhs[1],
            torque_ext[2] - rhs[2],
        ];
        for ((w, &om), &ui) in self.wheels.iter().zip(wheel_speed).zip(u) {
            let wxg = cross(omega, w.gs);
            for a in 0..3 {
                rhs[a] -= w.gs[a] * ui + w.js * om * wxg[a];
            }
        }
        let m = self.reduced_inertia();
        let omega_dot = Inertia::general(m).solve(rhs);
        let wheel_dot = self
            .wheels
            .iter()
            .zip(u)
            .map(|(w, &ui)| ui / w.js - dot(w.gs, omega_dot))
            .collect();
        (omega_dot, wheel_dot)
    }

    /// Total angular momentum about the centre of mass in inertial axes:
    /// `[NB] (I ω + Σ J_s Ω ĝ)`. Conserved when no external torque acts.
    pub fn angular_momentum_inertial(&self, s: &AocsState) -> Vec3 {
        let mut h = mat_vec(&self.inertia, s.omega);
        for (w, &om) in self.wheels.iter().zip(&s.wheel_speed) {
            for a in 0..3 {
                h[a] += w.js * om * w.gs[a];
            }
        }
        s.q.rotate(h)
    }
}

fn quat_dot(q: &Quaternion, omega: Vec3) -> Quaternion {
    let w = q.mul(&Quaternion::new(0.0, omega[0], omega[1], omega[2]));
    Quaternion::new(0.5 * w.w, 0.5 * w.x, 0.5 * w.y, 0.5 * w.z)
}

fn add_scaled(s: &AocsState, d: &(Quaternion, Vec3, Vec<f64>), h: f64) -> AocsState {
    AocsState {
        q: Quaternion::new(
            s.q.w + h * d.0.w,
            s.q.x + h * d.0.x,
            s.q.y + h * d.0.y,
            s.q.z + h * d.0.z,
        ),
        omega: [
            s.omega[0] + h * d.1[0],
            s.omega[1] + h * d.1[1],
            s.omega[2] + h * d.1[2],
        ],
        wheel_speed: s
            .wheel_speed
            .iter()
            .zip(&d.2)
            .map(|(a, b)| a + h * b)
            .collect(),
    }
}

/// One fixed RK4 step of length `dt` with the motor torques `u` and external torque held.
pub fn rk4_step(
    cfg: &AocsConfig,
    s: &AocsState,
    u: &[f64],
    torque_ext: Vec3,
    dt: f64,
) -> AocsState {
    let f = |x: &AocsState| {
        let (wd, od) = cfg.rates(x.omega, &x.wheel_speed, u, torque_ext);
        (quat_dot(&x.q, x.omega), wd, od)
    };
    let k1 = f(s);
    let k2 = f(&add_scaled(s, &k1, 0.5 * dt));
    let k3 = f(&add_scaled(s, &k2, 0.5 * dt));
    let k4 = f(&add_scaled(s, &k3, dt));
    let n = s.wheel_speed.len();
    let comb = (
        Quaternion::new(
            k1.0.w + 2.0 * k2.0.w + 2.0 * k3.0.w + k4.0.w,
            k1.0.x + 2.0 * k2.0.x + 2.0 * k3.0.x + k4.0.x,
            k1.0.y + 2.0 * k2.0.y + 2.0 * k3.0.y + k4.0.y,
            k1.0.z + 2.0 * k2.0.z + 2.0 * k3.0.z + k4.0.z,
        ),
        [
            k1.1[0] + 2.0 * k2.1[0] + 2.0 * k3.1[0] + k4.1[0],
            k1.1[1] + 2.0 * k2.1[1] + 2.0 * k3.1[1] + k4.1[1],
            k1.1[2] + 2.0 * k2.1[2] + 2.0 * k3.1[2] + k4.1[2],
        ],
        (0..n)
            .map(|i| k1.2[i] + 2.0 * k2.2[i] + 2.0 * k3.2[i] + k4.2[i])
            .collect::<Vec<f64>>(),
    );
    let mut out = add_scaled(s, &comb, dt / 6.0);
    out.q = out.q.normalized();
    out
}

/// One recorded instant of a closed-loop run.
#[derive(Clone, Debug, PartialEq)]
pub struct AocsSample {
    /// Time (s).
    pub t_s: f64,
    /// `σ_BN` on the `|σ| ≤ 1` branch.
    pub sigma: Vec3,
    /// Body rate (rad/s).
    pub omega: Vec3,
    /// Wheel speeds (rad/s).
    pub wheel_speed: Vec<f64>,
    /// Motor torques applied over the step that starts here (N m).
    pub u: Vec<f64>,
}

/// Run the loop for `n_steps` of `dt`, recording every `sample_every` steps (and the start).
/// The motor torques are computed from the state at the start of each step and held over it.
pub fn simulate(
    cfg: &AocsConfig,
    initial: &AocsState,
    dt: f64,
    n_steps: usize,
    sample_every: usize,
) -> Vec<AocsSample> {
    let every = sample_every.max(1);
    let mut s = initial.clone();
    let mut out = Vec::with_capacity(n_steps / every + 1);
    for k in 0..=n_steps {
        let u = cfg.motor_torques(&s);
        if k % every == 0 {
            out.push(AocsSample {
                t_s: k as f64 * dt,
                sigma: mrp_from_quaternion(&s.q),
                omega: s.omega,
                wheel_speed: s.wheel_speed.clone(),
                u: u.clone(),
            });
        }
        if k < n_steps {
            s = rk4_step(cfg, &s, &u, [0.0; 3], dt);
        }
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    fn pyramid() -> AocsConfig {
        let b = 54.7356_f64.to_radians();
        let wheels = [45.0_f64, 135.0, 225.0, 315.0]
            .iter()
            .map(|az| {
                let a = az.to_radians();
                Wheel {
                    gs: [b.sin() * a.cos(), b.sin() * a.sin(), b.cos()],
                    js: 0.08,
                    u_max: 0.2,
                }
            })
            .collect::<Vec<_>>();
        let mut inertia = [[900.0, 0.0, 0.0], [0.0, 800.0, 0.0], [0.0, 0.0, 600.0]];
        for w in &wheels {
            for r in 0..3 {
                for c in 0..3 {
                    inertia[r][c] += w.js * w.gs[r] * w.gs[c];
                }
            }
        }
        AocsConfig {
            inertia,
            wheels,
            k: 3.5,
            p: 30.0,
        }
    }

    #[test]
    fn mrp_round_trips_and_stays_on_the_short_branch() {
        for sigma in [[0.1, 0.2, -0.3], [0.5, -0.4, 0.3], [0.0, 0.0, 0.0]] {
            let q = quaternion_from_mrp(sigma);
            let back = mrp_from_quaternion(&q);
            for a in 0..3 {
                assert!((back[a] - sigma[a]).abs() < 1e-14);
            }
            let neg = Quaternion::new(-q.w, -q.x, -q.y, -q.z);
            assert_eq!(mrp_from_quaternion(&neg), back);
        }
        // A long-branch set maps to its shadow.
        let s = [0.9, 0.6, 0.0];
        let back = mrp_from_quaternion(&quaternion_from_mrp(s));
        assert!(dot(back, back) <= 1.0 + 1e-12);
    }

    #[test]
    fn minimum_norm_torques_produce_the_requested_body_torque() {
        let cfg = pyramid();
        let lr = [0.01, -0.02, 0.03];
        let u = cfg.motor_torques_unclipped(lr);
        let mut g_u = [0.0; 3];
        for (w, ui) in cfg.wheels.iter().zip(&u) {
            for a in 0..3 {
                g_u[a] += w.gs[a] * ui;
            }
        }
        for a in 0..3 {
            assert!((g_u[a] + lr[a]).abs() < 1e-15);
        }
    }

    #[test]
    fn angular_momentum_is_conserved_under_internal_torques() {
        let cfg = pyramid();
        let s0 = AocsState {
            q: quaternion_from_mrp([0.5, -0.4, 0.3]),
            omega: [0.01, -0.02, 0.005],
            wheel_speed: vec![10.0, -20.0, 30.0, -40.0],
        };
        let h0 = cfg.angular_momentum_inertial(&s0);
        let mut s = s0;
        for _ in 0..3000 {
            let u = cfg.motor_torques(&s);
            s = rk4_step(&cfg, &s, &u, [0.0; 3], 0.1);
        }
        let h1 = cfg.angular_momentum_inertial(&s);
        for a in 0..3 {
            assert!((h1[a] - h0[a]).abs() < 1e-9, "{h0:?} {h1:?}");
        }
    }

    #[test]
    fn the_loop_converges_to_the_target_and_saturates_when_limited() {
        let mut cfg = pyramid();
        for w in &mut cfg.wheels {
            w.u_max = 0.05;
        }
        let s0 = AocsState {
            q: quaternion_from_mrp([0.5, -0.4, 0.3]),
            omega: [0.0; 3],
            wheel_speed: vec![0.0; 4],
        };
        let run = simulate(&cfg, &s0, 0.1, 30000, 10);
        assert!(run[1..=10]
            .iter()
            .any(|r| r.u.iter().any(|u| (u.abs() - 0.05).abs() < 1e-15)));
        let last = run.last().unwrap();
        assert!(
            dot(last.sigma, last.sigma).sqrt() < 1e-3,
            "{:?}",
            last.sigma
        );
    }

    #[test]
    fn validate_rejects_bad_configurations() {
        let mut cfg = pyramid();
        assert!(cfg.validate().is_ok());
        cfg.wheels.truncate(2);
        assert!(cfg.validate().is_err());
        let mut cfg = pyramid();
        cfg.k = -1.0;
        assert!(cfg.validate().is_err());
        let mut cfg = pyramid();
        for w in &mut cfg.wheels {
            w.gs = [0.0, 0.0, 1.0];
        }
        assert!(cfg.validate().is_err());
    }
}
