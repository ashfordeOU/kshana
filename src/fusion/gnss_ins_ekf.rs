// SPDX-License-Identifier: Apache-2.0
//! Loosely-coupled GNSS/INS extended Kalman filter (15-state error-state).
//!
//! This is the estimator that replaces the hybrid pack's open-loop
//! dead-reckoning-with-truth-snap with a real closed-loop blend of a strapdown
//! inertial solution and GNSS position/velocity fixes. It is an **error-state**
//! (indirect) EKF: rather than estimating the full navigation state, it
//! estimates the *error* in a strapdown solution and feeds those corrections
//! back, which keeps the linearisation valid and the numerics well-conditioned
//! (Groves 2013 §14.1–14.2).
//!
//! The 15-element error state is
//!
//! ```text
//! δx = [ δp(3)  δv(3)  ψ(3)  b_a(3)  b_g(3) ]ᵀ
//! ```
//!
//! position error (NED, m), velocity error (NED, m/s), attitude error angles
//! (rad), accelerometer bias (m/s²), gyro bias (rad/s). The continuous
//! error-state dynamics (Groves eq. 14.48–14.49, local-navigation frame,
//! dropping the second-order gravity-gradient term) are
//!
//! ```text
//! δṗ = δv
//! δv̇ = −[f_n×] ψ − 2[ω_ie×] δv + C_b^n b_a
//! ψ̇  = −[ω_in×] ψ − C_b^n b_g
//! ḃ_a = −(1/τ_a) b_a            (first-order Gauss–Markov; τ→∞ ⇒ random walk)
//! ḃ_g = −(1/τ_g) b_g
//! ```
//!
//! The loosely-coupled measurement is the difference between the INS and GNSS
//! position and velocity, `z = H δx + ν` with `H = [I₃ 0 0 0 0; 0 I₃ 0 0 0]`.
//! The covariance update uses the Joseph form for numerical stability.
//!
//! Tightly-coupled operation (pseudorange/Doppler measurements rather than a PVT
//! solution) is a documented but unimplemented extension — see
//! [`update_tightly_coupled`].
//!
//! No external linear-algebra dependency: the small dense matrices are handled
//! by the helpers in this module.

use crate::frames::Vec3;

const N: usize = 15; // error-state dimension

/// A dense `rows × cols` matrix stored row-major.
#[derive(Clone, Debug)]
struct Mat {
    rows: usize,
    cols: usize,
    d: Vec<f64>,
}

impl Mat {
    fn zeros(rows: usize, cols: usize) -> Self {
        Self {
            rows,
            cols,
            d: vec![0.0; rows * cols],
        }
    }
    fn identity(n: usize) -> Self {
        let mut m = Self::zeros(n, n);
        for i in 0..n {
            m.set(i, i, 1.0);
        }
        m
    }
    #[inline]
    fn at(&self, r: usize, c: usize) -> f64 {
        self.d[r * self.cols + c]
    }
    #[inline]
    fn set(&mut self, r: usize, c: usize, v: f64) {
        self.d[r * self.cols + c] = v;
    }
    /// Write a 3×3 block with top-left corner at (r0, c0).
    fn set_block3(&mut self, r0: usize, c0: usize, b: [[f64; 3]; 3]) {
        for (i, row) in b.iter().enumerate() {
            for (j, &v) in row.iter().enumerate() {
                self.set(r0 + i, c0 + j, v);
            }
        }
    }
    fn transpose(&self) -> Mat {
        let mut t = Mat::zeros(self.cols, self.rows);
        for r in 0..self.rows {
            for c in 0..self.cols {
                t.set(c, r, self.at(r, c));
            }
        }
        t
    }
    fn mul(&self, o: &Mat) -> Mat {
        assert_eq!(self.cols, o.rows);
        let mut m = Mat::zeros(self.rows, o.cols);
        for r in 0..self.rows {
            for k in 0..self.cols {
                let a = self.at(r, k);
                if a == 0.0 {
                    continue;
                }
                for c in 0..o.cols {
                    let v = m.at(r, c) + a * o.at(k, c);
                    m.set(r, c, v);
                }
            }
        }
        m
    }
    fn mul_vec(&self, v: &[f64]) -> Vec<f64> {
        assert_eq!(self.cols, v.len());
        let mut out = vec![0.0; self.rows];
        for (r, o) in out.iter_mut().enumerate() {
            let mut s = 0.0;
            for (c, &vc) in v.iter().enumerate() {
                s += self.at(r, c) * vc;
            }
            *o = s;
        }
        out
    }
    fn sub(&self, o: &Mat) -> Mat {
        let mut m = self.clone();
        for i in 0..self.d.len() {
            m.d[i] -= o.d[i];
        }
        m
    }
    fn add(&self, o: &Mat) -> Mat {
        let mut m = self.clone();
        for i in 0..self.d.len() {
            m.d[i] += o.d[i];
        }
        m
    }
    /// Symmetrise in place (averages with the transpose) to suppress numerical drift.
    fn symmetrize(&mut self) {
        for r in 0..self.rows {
            for c in (r + 1)..self.cols {
                let avg = 0.5 * (self.at(r, c) + self.at(c, r));
                self.set(r, c, avg);
                self.set(c, r, avg);
            }
        }
    }
    /// Dense inverse via Gauss–Jordan with partial pivoting (small matrices only).
    fn inverse(&self) -> Option<Mat> {
        assert_eq!(self.rows, self.cols);
        let n = self.rows;
        let mut a = self.clone();
        let mut inv = Mat::identity(n);
        for col in 0..n {
            // Pivot: largest magnitude in this column at/below the diagonal.
            let mut piv = col;
            let mut best = a.at(col, col).abs();
            for r in (col + 1)..n {
                let v = a.at(r, col).abs();
                if v > best {
                    best = v;
                    piv = r;
                }
            }
            if best < 1e-300 {
                return None; // singular
            }
            if piv != col {
                for c in 0..n {
                    let (x, y) = (a.at(col, c), a.at(piv, c));
                    a.set(col, c, y);
                    a.set(piv, c, x);
                    let (x, y) = (inv.at(col, c), inv.at(piv, c));
                    inv.set(col, c, y);
                    inv.set(piv, c, x);
                }
            }
            let d = a.at(col, col);
            for c in 0..n {
                a.set(col, c, a.at(col, c) / d);
                inv.set(col, c, inv.at(col, c) / d);
            }
            for r in 0..n {
                if r == col {
                    continue;
                }
                let factor = a.at(r, col);
                if factor == 0.0 {
                    continue;
                }
                for c in 0..n {
                    a.set(r, c, a.at(r, c) - factor * a.at(col, c));
                    inv.set(r, c, inv.at(r, c) - factor * inv.at(col, c));
                }
            }
        }
        Some(inv)
    }
}

/// Skew-symmetric (cross-product) matrix `[v×]` such that `[v×] w = v × w`.
fn skew(v: Vec3) -> [[f64; 3]; 3] {
    [[0.0, -v[2], v[1]], [v[2], 0.0, -v[0]], [-v[1], v[0], 0.0]]
}

fn neg3(m: [[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let mut o = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            o[i][j] = -m[i][j];
        }
    }
    o
}

/// A loosely-coupled GNSS fix: ECEF/NED position and velocity with 1-σ accuracies.
#[derive(Clone, Copy, Debug)]
pub struct GnssMeasurement {
    /// Position in the working frame (NED, m).
    pub pos: Vec3,
    /// Velocity in the working frame (NED, m/s).
    pub vel: Vec3,
    /// 1-σ position accuracy (m), applied isotropically.
    pub sigma_pos_m: f64,
    /// 1-σ velocity accuracy (m/s), applied isotropically.
    pub sigma_vel_mps: f64,
}

/// Process-noise spectral densities driving the error state.
#[derive(Clone, Copy, Debug)]
pub struct EkfNoise {
    /// Velocity random walk — accelerometer white-noise PSD ((m/s²)²/Hz).
    pub vrw_psd: f64,
    /// Angle random walk — gyro white-noise PSD ((rad/s)²/Hz).
    pub arw_psd: f64,
    /// Accelerometer bias random-walk PSD ((m/s²)²·Hz).
    pub accel_bias_rw_psd: f64,
    /// Gyro bias random-walk PSD ((rad/s)²·Hz).
    pub gyro_bias_rw_psd: f64,
    /// Accelerometer bias Gauss–Markov correlation time (s); `f64::INFINITY` ⇒ random walk.
    pub accel_bias_tau: f64,
    /// Gyro bias Gauss–Markov correlation time (s); `f64::INFINITY` ⇒ random walk.
    pub gyro_bias_tau: f64,
}

impl Default for EkfNoise {
    fn default() -> Self {
        // Tactical-grade-ish defaults; callers should set from the IMU datasheet.
        Self {
            vrw_psd: 1e-4,
            arw_psd: 1e-8,
            accel_bias_rw_psd: 1e-10,
            gyro_bias_rw_psd: 1e-14,
            accel_bias_tau: f64::INFINITY,
            gyro_bias_tau: f64::INFINITY,
        }
    }
}

/// 15-state error-state EKF for loosely-coupled GNSS/INS fusion.
pub struct GnssInsEkf {
    /// Error-state estimate `δx` (15). Reset to zero after closed-loop feedback.
    x: [f64; N],
    /// Error-state covariance `P` (15×15).
    p: Mat,
    noise: EkfNoise,
}

impl GnssInsEkf {
    /// Construct with diagonal initial covariance from 1-σ uncertainties.
    pub fn new(
        sigma_pos_m: f64,
        sigma_vel_mps: f64,
        sigma_att_rad: f64,
        sigma_accel_bias: f64,
        sigma_gyro_bias: f64,
        noise: EkfNoise,
    ) -> Self {
        let mut p = Mat::zeros(N, N);
        let var = [
            sigma_pos_m.powi(2),
            sigma_vel_mps.powi(2),
            sigma_att_rad.powi(2),
            sigma_accel_bias.powi(2),
            sigma_gyro_bias.powi(2),
        ];
        for (block, &v) in var.iter().enumerate() {
            for k in 0..3 {
                let i = block * 3 + k;
                p.set(i, i, v);
            }
        }
        Self {
            x: [0.0; N],
            p,
            noise,
        }
    }

    /// The current error-state estimate (15).
    pub fn error_state(&self) -> [f64; N] {
        self.x
    }

    /// Trace of the position-error covariance block (m²) — a scalar uncertainty proxy.
    pub fn position_cov_trace(&self) -> f64 {
        self.p.at(0, 0) + self.p.at(1, 1) + self.p.at(2, 2)
    }

    /// Diagonal of `P` (15) — per-state variance.
    pub fn covariance_diagonal(&self) -> [f64; N] {
        let mut d = [0.0; N];
        for (i, di) in d.iter_mut().enumerate() {
            *di = self.p.at(i, i);
        }
        d
    }

    /// Build the discrete transition `Φ ≈ I + F·dt` from the current navigation
    /// context: specific force in nav frame `f_n`, body→nav DCM `c_bn`, Earth-rate
    /// `omega_ie_n`, and total inertial-to-nav rate `omega_in_n` (all in the NED frame).
    fn transition(
        &self,
        f_n: Vec3,
        c_bn: [[f64; 3]; 3],
        omega_ie_n: Vec3,
        omega_in_n: Vec3,
        dt: f64,
    ) -> Mat {
        let mut f = Mat::zeros(N, N);
        // δṗ = δv
        f.set_block3(0, 3, [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]]);
        // δv̇ = −[f_n×] ψ − 2[ω_ie×] δv + C_b^n b_a
        f.set_block3(3, 6, neg3(skew(f_n)));
        let two_wie = [
            2.0 * omega_ie_n[0],
            2.0 * omega_ie_n[1],
            2.0 * omega_ie_n[2],
        ];
        f.set_block3(3, 3, neg3(skew(two_wie)));
        f.set_block3(3, 9, c_bn);
        // ψ̇ = −[ω_in×] ψ − C_b^n b_g
        f.set_block3(6, 6, neg3(skew(omega_in_n)));
        f.set_block3(6, 12, neg3(c_bn));
        // Bias Gauss–Markov: ḃ = −(1/τ) b
        let ka = if self.noise.accel_bias_tau.is_finite() {
            -1.0 / self.noise.accel_bias_tau
        } else {
            0.0
        };
        let kg = if self.noise.gyro_bias_tau.is_finite() {
            -1.0 / self.noise.gyro_bias_tau
        } else {
            0.0
        };
        for k in 0..3 {
            f.set(9 + k, 9 + k, ka);
            f.set(12 + k, 12 + k, kg);
        }
        // Φ = I + F·dt.
        let mut phi = Mat::identity(N);
        for i in 0..N {
            for j in 0..N {
                phi.set(i, j, phi.at(i, j) + f.at(i, j) * dt);
            }
        }
        phi
    }

    /// Discrete process-noise covariance `Q` (first-order, diagonal blocks).
    fn process_noise(&self, dt: f64) -> Mat {
        let mut q = Mat::zeros(N, N);
        let qv = self.noise.vrw_psd * dt;
        let qpsi = self.noise.arw_psd * dt;
        let qba = self.noise.accel_bias_rw_psd * dt;
        let qbg = self.noise.gyro_bias_rw_psd * dt;
        for k in 0..3 {
            q.set(3 + k, 3 + k, qv);
            q.set(6 + k, 6 + k, qpsi);
            q.set(9 + k, 9 + k, qba);
            q.set(12 + k, 12 + k, qbg);
        }
        q
    }

    /// Time-propagate the error state and covariance one step:
    /// `δx ← Φ δx`, `P ← Φ P Φᵀ + Q`.
    pub fn predict(
        &mut self,
        f_n: Vec3,
        c_bn: [[f64; 3]; 3],
        omega_ie_n: Vec3,
        omega_in_n: Vec3,
        dt: f64,
    ) {
        let phi = self.transition(f_n, c_bn, omega_ie_n, omega_in_n, dt);
        self.x = {
            let xv = phi.mul_vec(&self.x);
            let mut a = [0.0; N];
            a.copy_from_slice(&xv);
            a
        };
        let q = self.process_noise(dt);
        let mut p = phi.mul(&self.p).mul(&phi.transpose()).add(&q);
        p.symmetrize();
        self.p = p;
    }

    /// Loosely-coupled measurement update from a GNSS position+velocity fix and
    /// the current INS position+velocity (same NED frame). Returns the 15-element
    /// error-state correction that should be fed back to the strapdown solution
    /// (after which the caller resets the error state via [`reset_error_state`]).
    ///
    /// The innovation is `z = (INS − GNSS)`; the measurement matrix selects the
    /// position and velocity error blocks.
    pub fn update_loosely_coupled(
        &mut self,
        ins_pos: Vec3,
        ins_vel: Vec3,
        gnss: GnssMeasurement,
    ) -> [f64; N] {
        // Measurement matrix H (6×15): observes δp and δv.
        let mut h = Mat::zeros(6, N);
        for k in 0..3 {
            h.set(k, k, 1.0); // δp
            h.set(3 + k, 3 + k, 1.0); // δv
        }
        // Innovation z − H x̂.
        let z = [
            ins_pos[0] - gnss.pos[0],
            ins_pos[1] - gnss.pos[1],
            ins_pos[2] - gnss.pos[2],
            ins_vel[0] - gnss.vel[0],
            ins_vel[1] - gnss.vel[1],
            ins_vel[2] - gnss.vel[2],
        ];
        let hx = h.mul_vec(&self.x);
        let nu: Vec<f64> = (0..6).map(|i| z[i] - hx[i]).collect();

        // R (6×6 diagonal).
        let mut r = Mat::zeros(6, 6);
        let rp = gnss.sigma_pos_m.powi(2);
        let rv = gnss.sigma_vel_mps.powi(2);
        for k in 0..3 {
            r.set(k, k, rp);
            r.set(3 + k, 3 + k, rv);
        }

        let ht = h.transpose();
        let pht = self.p.mul(&ht); // 15×6
        let s = h.mul(&pht).add(&r); // 6×6 innovation covariance
        let s_inv = match s.inverse() {
            Some(si) => si,
            None => return [0.0; N], // ill-conditioned; skip update
        };
        let k_gain = pht.mul(&s_inv); // 15×6

        // δx ← δx + K ν.
        let dk = k_gain.mul_vec(&nu);
        for (xi, &dki) in self.x.iter_mut().zip(dk.iter()) {
            *xi += dki;
        }

        // Joseph form: P ← (I − K H) P (I − K H)ᵀ + K R Kᵀ.
        let kh = k_gain.mul(&h); // 15×15
        let i_kh = Mat::identity(N).sub(&kh);
        let mut p = i_kh
            .mul(&self.p)
            .mul(&i_kh.transpose())
            .add(&k_gain.mul(&r).mul(&k_gain.transpose()));
        p.symmetrize();
        self.p = p;

        self.x
    }

    /// Reset the error-state mean to zero after its correction has been applied to
    /// the strapdown solution (closed-loop feedback). The covariance is retained.
    pub fn reset_error_state(&mut self) {
        self.x = [0.0; N];
    }

    /// Tightly-coupled update (pseudorange/Doppler measurements). **Not yet
    /// implemented** — documented interface contract only. A tightly-coupled
    /// filter forms the innovation in the range domain (predicted range from the
    /// INS position to each satellite vs the measured pseudorange) and so keeps
    /// working with fewer than four satellites, where a loosely-coupled PVT
    /// solution is unavailable.
    #[cfg(feature = "tight_coupling")]
    pub fn update_tightly_coupled(
        &mut self,
        _sat_positions: &[Vec3],
        _pseudoranges_m: &[f64],
        _dopplers_mps: &[f64],
        _sigma_range_m: f64,
    ) -> Result<[f64; N], &'static str> {
        Err("tightly-coupled GNSS/INS update is not implemented (roadmap)")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn default_ekf() -> GnssInsEkf {
        GnssInsEkf::new(10.0, 1.0, 0.01, 0.1, 0.01, EkfNoise::default())
    }

    #[test]
    fn skew_matrix_reproduces_the_cross_product() {
        let a = [1.0, 2.0, 3.0];
        let b = [-0.5, 0.7, 0.2];
        let s = skew(a);
        let sb = [
            s[0][0] * b[0] + s[0][1] * b[1] + s[0][2] * b[2],
            s[1][0] * b[0] + s[1][1] * b[1] + s[1][2] * b[2],
            s[2][0] * b[0] + s[2][1] * b[1] + s[2][2] * b[2],
        ];
        let cross = [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ];
        for i in 0..3 {
            assert!((sb[i] - cross[i]).abs() < 1e-15);
        }
    }

    #[test]
    fn gauss_jordan_inverse_is_correct() {
        let mut m = Mat::zeros(3, 3);
        m.set_block3(0, 0, [[2.0, 1.0, 0.0], [1.0, 3.0, 1.0], [0.0, 1.0, 2.0]]);
        let inv = m.inverse().unwrap();
        let prod = m.mul(&inv);
        for i in 0..3 {
            for j in 0..3 {
                let expect = if i == j { 1.0 } else { 0.0 };
                assert!((prod.at(i, j) - expect).abs() < 1e-12);
            }
        }
    }

    #[test]
    fn predict_keeps_covariance_symmetric_and_psd() {
        let mut ekf = default_ekf();
        let c_bn = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
        let f_n = [0.1, -0.2, -9.81];
        let w_ie = [5e-5, 0.0, -5e-5];
        for _ in 0..50 {
            ekf.predict(f_n, c_bn, w_ie, w_ie, 0.1);
        }
        // Symmetric.
        for i in 0..N {
            for j in 0..N {
                assert!((ekf.p.at(i, j) - ekf.p.at(j, i)).abs() < 1e-12);
            }
        }
        // Diagonal non-negative (necessary PSD condition).
        for v in ekf.covariance_diagonal() {
            assert!(v >= 0.0, "negative variance {v}");
        }
        // Position uncertainty grows without aiding.
        assert!(ekf.position_cov_trace() > 3.0 * 10.0_f64.powi(2));
    }

    #[test]
    fn position_update_reduces_position_covariance() {
        let mut ekf = default_ekf();
        let before = ekf.position_cov_trace();
        let gnss = GnssMeasurement {
            pos: [0.0, 0.0, 0.0],
            vel: [0.0, 0.0, 0.0],
            sigma_pos_m: 1.0,
            sigma_vel_mps: 0.1,
        };
        ekf.update_loosely_coupled([0.0; 3], [0.0; 3], gnss);
        let after = ekf.position_cov_trace();
        assert!(
            after < before,
            "covariance did not shrink: {before} -> {after}"
        );
        // A 1 m GNSS sigma should pull the 10 m prior well below the prior.
        assert!(after < before * 0.1);
    }

    #[test]
    fn filter_recovers_a_known_position_error() {
        // Diagonal prior (from new): per-axis δp correction = P_p/(P_p+R_p)·z.
        let mut ekf = default_ekf();
        let true_pos_err = [3.0, -4.0, 1.5];
        // INS reads truth + error; GNSS reads truth ⇒ innovation = error.
        let ins_pos = true_pos_err;
        let gnss = GnssMeasurement {
            pos: [0.0; 3],
            vel: [0.0; 3],
            sigma_pos_m: 1.0,
            sigma_vel_mps: 0.1,
        };
        let dx = ekf.update_loosely_coupled(ins_pos, [0.0; 3], gnss);
        let pp = 10.0_f64.powi(2); // initial position variance
        let rp = 1.0_f64.powi(2);
        let gain = pp / (pp + rp);
        for k in 0..3 {
            assert!(
                (dx[k] - gain * true_pos_err[k]).abs() < 1e-9,
                "axis {k}: {} vs {}",
                dx[k],
                gain * true_pos_err[k]
            );
        }
    }

    #[test]
    fn larger_measurement_noise_means_smaller_correction() {
        let innov = [5.0, 0.0, 0.0];
        let mut tight = default_ekf();
        let mut loose = default_ekf();
        let dx_tight = tight.update_loosely_coupled(
            innov,
            [0.0; 3],
            GnssMeasurement {
                pos: [0.0; 3],
                vel: [0.0; 3],
                sigma_pos_m: 0.5,
                sigma_vel_mps: 0.1,
            },
        );
        let dx_loose = loose.update_loosely_coupled(
            innov,
            [0.0; 3],
            GnssMeasurement {
                pos: [0.0; 3],
                vel: [0.0; 3],
                sigma_pos_m: 50.0,
                sigma_vel_mps: 0.1,
            },
        );
        assert!(dx_tight[0] > dx_loose[0]);
        assert!(dx_loose[0] > 0.0 && dx_loose[0] < dx_tight[0]);
    }

    #[test]
    fn reset_zeros_the_error_state_but_keeps_covariance() {
        let mut ekf = default_ekf();
        ekf.update_loosely_coupled(
            [5.0, 0.0, 0.0],
            [0.0; 3],
            GnssMeasurement {
                pos: [0.0; 3],
                vel: [0.0; 3],
                sigma_pos_m: 1.0,
                sigma_vel_mps: 0.1,
            },
        );
        let cov_before = ekf.position_cov_trace();
        assert!(ekf.error_state()[0].abs() > 0.0);
        ekf.reset_error_state();
        assert_eq!(ekf.error_state(), [0.0; N]);
        assert_eq!(ekf.position_cov_trace(), cov_before);
    }
}
