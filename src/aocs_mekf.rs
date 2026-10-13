// SPDX-License-Identifier: AGPL-3.0-only
//! **Multiplicative extended Kalman filter (MEKF) for spacecraft attitude from a gyro and a star
//! tracker.**
//!
//! The filter of Lefferts, Markley and Shuster (1982), in the form of Crassidis and Junkins
//! (*Optimal Estimation of Dynamic Systems*, the attitude-estimation chapter). The global
//! attitude is the body→inertial quaternion of [`crate::inertial::attitude::Quaternion`]. The
//! filter carries a six-state error: the attitude error `δθ` (body axes, rad, with
//! `q_true = q̂ ⊗ δq(δθ)`) and the gyro bias error `δb` (rad/s).
//!
//! ## Sensor models
//!
//! * **Gyro:** `ω_m = ω + b + η_v`, with bias random walk `ḃ = η_u`. `σ_v` is the angle random
//!   walk (rad/√s) and `σ_u` the rate random walk (rad/s^1.5).
//! * **Star tracker:** a body→inertial attitude with an independent small-angle error of
//!   `σ_st` rad per body axis.
//!
//! ## Filter
//!
//! **Propagation.** The rate estimate is `ω̂ = ω_m − b̂`, and `q̂ ← q̂ ⊗ exp(ω̂ Δt)`. The
//! transition matrix is `Φ = [[R(ω̂Δt)ᵀ, −Δt·I], [0, I]]`, and the process noise is Farrenkopf's
//! discrete form:
//!
//! ```text
//!   Q = [[(σ_v² Δt + σ_u² Δt³/3) I, −σ_u² Δt²/2 I], [−σ_u² Δt²/2 I, σ_u² Δt I]]
//! ```
//!
//! **Update.** The residual is `z = 2·vec(q̂⁻¹ ⊗ q_st)`, with `H = [I 0]` and `R = σ_st² I`.
//! After the update, `q̂ ← q̂ ⊗ δq(δθ̂)` and `b̂ ← b̂ + δb̂`, and the error state is reset to zero.
//!
//! This is MODELLED. The test checks the filter's consistency (normalised estimation error
//! squared over Monte Carlo seeds) on truth simulated from the same sensor models. It is not
//! compared with an external estimator.

// Dense 3x3 and 6x6 matrix arithmetic reads clearest with index loops.
#![allow(clippy::needless_range_loop)]

use crate::frames::Vec3;
use crate::inertial::attitude::Quaternion;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};

type M6 = [[f64; 6]; 6];

/// Sensor noise parameters.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct MekfNoise {
    /// Gyro angle random walk `σ_v` (rad/√s).
    pub sigma_v: f64,
    /// Gyro rate random walk `σ_u` (rad/s^1.5).
    pub sigma_u: f64,
    /// Star-tracker error per axis `σ_st` (rad).
    pub sigma_st: f64,
}

/// The filter.
#[derive(Clone, Debug)]
pub struct Mekf {
    /// Attitude estimate (body→inertial).
    pub q: Quaternion,
    /// Gyro bias estimate (rad/s).
    pub bias: Vec3,
    /// Error covariance, `[δθ, δb]`.
    pub p: M6,
    /// Noise model.
    pub noise: MekfNoise,
}

fn small_angle_quat(dtheta: Vec3) -> Quaternion {
    Quaternion::from_rotation_vector(dtheta)
}

/// The attitude error `δθ` (body axes, rad) with `q_true = q_est ⊗ δq(δθ)`, as twice the vector
/// part of `q_est⁻¹ ⊗ q_true` on the short branch.
pub fn attitude_error(q_est: &Quaternion, q_true: &Quaternion) -> Vec3 {
    let d = q_est.conjugate().mul(q_true).normalized();
    let s = if d.w < 0.0 { -2.0 } else { 2.0 };
    [s * d.x, s * d.y, s * d.z]
}

fn mat6_mul(a: &M6, b: &M6) -> M6 {
    let mut c = [[0.0; 6]; 6];
    for i in 0..6 {
        for k in 0..6 {
            if a[i][k] == 0.0 {
                continue;
            }
            for j in 0..6 {
                c[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    c
}

fn transpose6(a: &M6) -> M6 {
    let mut t = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            t[j][i] = a[i][j];
        }
    }
    t
}

fn inv3(m: [[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
    let c =
        |r0: usize, c0: usize, r1: usize, c1: usize| m[r0][c0] * m[r1][c1] - m[r0][c1] * m[r1][c0];
    [
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
    ]
}

/// Solve the symmetric positive-definite `A x = b` (6×6) by Cholesky; `None` if not SPD.
pub fn spd_solve6(a: &M6, b: &[f64; 6]) -> Option<[f64; 6]> {
    let mut l = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..=i {
            let mut s = a[i][j];
            for k in 0..j {
                s -= l[i][k] * l[j][k];
            }
            if i == j {
                if s <= 0.0 || !s.is_finite() {
                    return None;
                }
                l[i][i] = s.sqrt();
            } else {
                l[i][j] = s / l[j][j];
            }
        }
    }
    let mut y = [0.0; 6];
    for i in 0..6 {
        let mut s = b[i];
        for k in 0..i {
            s -= l[i][k] * y[k];
        }
        y[i] = s / l[i][i];
    }
    let mut x = [0.0; 6];
    for i in (0..6).rev() {
        let mut s = y[i];
        for k in (i + 1)..6 {
            s -= l[k][i] * x[k];
        }
        x[i] = s / l[i][i];
    }
    Some(x)
}

impl Mekf {
    /// A filter at `q0`, `bias0` with 1-sigma attitude and bias uncertainties.
    pub fn new(
        q0: Quaternion,
        bias0: Vec3,
        sigma_att: f64,
        sigma_bias: f64,
        noise: MekfNoise,
    ) -> Self {
        let mut p = [[0.0; 6]; 6];
        for i in 0..3 {
            p[i][i] = sigma_att * sigma_att;
            p[i + 3][i + 3] = sigma_bias * sigma_bias;
        }
        Mekf {
            q: q0.normalized(),
            bias: bias0,
            p,
            noise,
        }
    }

    /// Estimated body rate from a gyro sample: `ω_m − b̂`.
    pub fn rate(&self, omega_m: Vec3) -> Vec3 {
        [
            omega_m[0] - self.bias[0],
            omega_m[1] - self.bias[1],
            omega_m[2] - self.bias[2],
        ]
    }

    /// Propagate over `dt` with the gyro sample `omega_m` held over the interval.
    pub fn propagate(&mut self, omega_m: Vec3, dt: f64) {
        let w = self.rate(omega_m);
        let phi_rot = [w[0] * dt, w[1] * dt, w[2] * dt];
        self.q = self
            .q
            .mul(&Quaternion::from_rotation_vector(phi_rot))
            .normalized();
        // R(ω̂Δt)ᵀ: the error rotates into the new body frame.
        let r = Quaternion::from_rotation_vector(phi_rot).to_dcm();
        let mut phi = [[0.0; 6]; 6];
        for i in 0..3 {
            for j in 0..3 {
                phi[i][j] = r[j][i];
            }
            phi[i][i + 3] = -dt;
            phi[i + 3][i + 3] = 1.0;
        }
        let (sv2, su2) = (self.noise.sigma_v.powi(2), self.noise.sigma_u.powi(2));
        let q11 = sv2 * dt + su2 * dt.powi(3) / 3.0;
        let q12 = -su2 * dt * dt / 2.0;
        let q22 = su2 * dt;
        let mut p = mat6_mul(&mat6_mul(&phi, &self.p), &transpose6(&phi));
        for i in 0..3 {
            p[i][i] += q11;
            p[i][i + 3] += q12;
            p[i + 3][i] += q12;
            p[i + 3][i + 3] += q22;
        }
        self.p = symmetrize(p);
    }

    /// Update with a star-tracker attitude.
    pub fn update(&mut self, q_st: &Quaternion) {
        let z = attitude_error(&self.q, q_st);
        let r = self.noise.sigma_st.powi(2);
        let mut s = [[0.0; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                s[i][j] = self.p[i][j];
            }
            s[i][i] += r;
        }
        let s_inv = inv3(s);
        // K = P Hᵀ S⁻¹, Hᵀ selects the first three columns of P.
        let mut k = [[0.0; 3]; 6];
        for i in 0..6 {
            for j in 0..3 {
                for m in 0..3 {
                    k[i][j] += self.p[i][m] * s_inv[m][j];
                }
            }
        }
        let mut dx = [0.0; 6];
        for i in 0..6 {
            for j in 0..3 {
                dx[i] += k[i][j] * z[j];
            }
        }
        // Joseph form: P = (I − K H) P (I − K H)ᵀ + K R Kᵀ.
        let mut ikh = [[0.0; 6]; 6];
        for i in 0..6 {
            ikh[i][i] = 1.0;
            for j in 0..3 {
                ikh[i][j] -= k[i][j];
            }
        }
        let mut p = mat6_mul(&mat6_mul(&ikh, &self.p), &transpose6(&ikh));
        for i in 0..6 {
            for j in 0..6 {
                for m in 0..3 {
                    p[i][j] += k[i][m] * r * k[j][m];
                }
            }
        }
        self.p = symmetrize(p);
        self.q = self
            .q
            .mul(&small_angle_quat([dx[0], dx[1], dx[2]]))
            .normalized();
        for i in 0..3 {
            self.bias[i] += dx[i + 3];
        }
    }

    /// Normalised estimation error squared against a true attitude and bias (6 degrees of
    /// freedom).
    pub fn nees(&self, q_true: &Quaternion, bias_true: Vec3) -> Option<f64> {
        let e = attitude_error(&self.q, q_true);
        let x = [
            e[0],
            e[1],
            e[2],
            bias_true[0] - self.bias[0],
            bias_true[1] - self.bias[1],
            bias_true[2] - self.bias[2],
        ];
        let y = spd_solve6(&self.p, &x)?;
        Some(x.iter().zip(&y).map(|(a, b)| a * b).sum())
    }
}

fn symmetrize(p: M6) -> M6 {
    let mut s = p;
    for i in 0..6 {
        for j in 0..i {
            let m = 0.5 * (p[i][j] + p[j][i]);
            s[i][j] = m;
            s[j][i] = m;
        }
    }
    s
}

/// A gyro simulator with Farrenkopf's discrete model: over a step `Δt` the bias walks
/// `b⁺ = b + σ_u √Δt n₂`, and the averaged rate output is
/// `ω_m = ω + ½(b⁺ + b) + √(σ_v²/Δt + σ_u² Δt/12) n₁`.
#[derive(Clone, Debug)]
pub struct GyroSim {
    /// Current true bias (rad/s).
    pub bias: Vec3,
    noise: MekfNoise,
    rng: ChaCha8Rng,
}

impl GyroSim {
    /// A gyro with initial true bias `bias0`, seeded.
    pub fn new(bias0: Vec3, noise: MekfNoise, seed: u64) -> Self {
        GyroSim {
            bias: bias0,
            noise,
            rng: ChaCha8Rng::seed_from_u64(seed),
        }
    }

    /// One output over a step of `dt` for the true mean rate `omega`.
    pub fn sample(&mut self, omega: Vec3, dt: f64) -> Vec3 {
        let mut out = [0.0; 3];
        let s1 = (self.noise.sigma_v.powi(2) / dt + self.noise.sigma_u.powi(2) * dt / 12.0).sqrt();
        let s2 = self.noise.sigma_u * dt.sqrt();
        for (a, o) in out.iter_mut().enumerate() {
            let n1: f64 = StandardNormal.sample(&mut self.rng);
            let n2: f64 = StandardNormal.sample(&mut self.rng);
            let b_next = self.bias[a] + s2 * n2;
            *o = omega[a] + 0.5 * (b_next + self.bias[a]) + s1 * n1;
            self.bias[a] = b_next;
        }
        out
    }

    /// A star-tracker reading of `q_true` with independent body-axis errors of `σ_st`.
    pub fn star_tracker(&mut self, q_true: &Quaternion) -> Quaternion {
        let mut draw = || -> f64 {
            let n: f64 = StandardNormal.sample(&mut self.rng);
            self.noise.sigma_st * n
        };
        let e: Vec3 = [draw(), draw(), draw()];
        q_true.mul(&small_angle_quat(e)).normalized()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const NOISE: MekfNoise = MekfNoise {
        sigma_v: 1e-5,  // rad/√s (about 0.034 deg/√h)
        sigma_u: 1e-8,  // rad/s^1.5
        sigma_st: 2e-5, // rad (about 4 arcsec)
    };

    /// Run one seed: a slow tumble, 1 Hz gyro, a star-tracker update every `every` steps.
    fn run(seed: u64, every: usize) -> Vec<f64> {
        let dt = 1.0;
        let n = 3000;
        let bias0 = [3e-6, -2e-6, 1e-6];
        let mut gyro = GyroSim::new(bias0, NOISE, seed);
        let mut q_true = Quaternion::from_axis_angle([1.0, 2.0, -0.5], 0.7);
        let omega = |t: f64| [1e-3 * (0.01 * t).sin(), 5e-4, -8e-4 * (0.007 * t).cos()];
        let q0 = q_true.mul(&small_angle_quat([1e-4, -1e-4, 5e-5]));
        let mut f = Mekf::new(q0, [0.0; 3], 2e-4, 1e-5, NOISE);
        let mut nees = Vec::new();
        for k in 0..n {
            let t = k as f64 * dt;
            // Truth over the step: fine sub-steps of the true rate.
            let sub = 20;
            let mut mean = [0.0; 3];
            for j in 0..sub {
                let tj = t + (j as f64 + 0.5) * dt / sub as f64;
                let w = omega(tj);
                for a in 0..3 {
                    mean[a] += w[a] / sub as f64;
                }
                q_true = q_true
                    .mul(&Quaternion::from_rotation_vector([
                        w[0] * dt / sub as f64,
                        w[1] * dt / sub as f64,
                        w[2] * dt / sub as f64,
                    ]))
                    .normalized();
            }
            let wm = gyro.sample(mean, dt);
            f.propagate(wm, dt);
            if (k + 1) % every == 0 {
                let st = gyro.star_tracker(&q_true);
                f.update(&st);
            }
            if k >= n / 2 {
                nees.push(f.nees(&q_true, gyro.bias).unwrap());
            }
        }
        nees
    }

    #[test]
    fn mekf_is_consistent_over_monte_carlo_seeds() {
        let seeds = 40;
        let mut sum = 0.0;
        let mut count = 0usize;
        for s in 0..seeds {
            for v in run(1000 + s, 10) {
                sum += v;
                count += 1;
            }
        }
        let mean = sum / count as f64;
        // Six degrees of freedom; correlated samples, so a generous band around 6.
        assert!((4.5..=7.5).contains(&mean), "mean NEES {mean}");
    }

    #[test]
    fn star_tracker_updates_bound_the_attitude_error() {
        let dt = 1.0;
        let mut gyro = GyroSim::new([5e-6, 0.0, -5e-6], NOISE, 7);
        let q_true = Quaternion::from_axis_angle([0.0, 0.0, 1.0], 0.3);
        let mut f = Mekf::new(q_true, [0.0; 3], 1e-3, 1e-5, NOISE);
        for k in 0..2000 {
            let wm = gyro.sample([0.0; 3], dt);
            f.propagate(wm, dt);
            if k % 10 == 9 {
                f.update(&gyro.star_tracker(&q_true));
            }
        }
        let e = attitude_error(&f.q, &q_true);
        let n = (e[0] * e[0] + e[1] * e[1] + e[2] * e[2]).sqrt();
        assert!(n < 1e-4, "attitude error {n} rad");
        for a in 0..3 {
            assert!(
                (f.bias[a] - gyro.bias[a]).abs() < 1e-6,
                "bias {:?} vs {:?}",
                f.bias,
                gyro.bias
            );
        }
    }

    #[test]
    fn attitude_error_is_the_body_frame_small_angle() {
        let q = Quaternion::from_axis_angle([0.3, -1.0, 0.2], 1.1);
        let d = [1e-4, -2e-4, 3e-4];
        let e = attitude_error(&q, &q.mul(&small_angle_quat(d)));
        for a in 0..3 {
            assert!((e[a] - d[a]).abs() < 1e-11);
        }
    }
}
