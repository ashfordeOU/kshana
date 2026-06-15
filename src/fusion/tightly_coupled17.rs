// SPDX-License-Identifier: Apache-2.0
//! Full 17-state tightly-coupled GNSS/INS navigator with quantum-CAI dead-reckoning.
//!
//! [`super::tightly_coupled`] carries the compact 8-state `[p, v, b, d]` pseudorange/Doppler
//! filter. This module is the full inertial-navigation state a tightly-coupled GNSS/INS
//! filter estimates: position, velocity, **attitude error**, **accelerometer bias**,
//! **gyro bias**, and the receiver clock — 17 states in all:
//!
//! ```text
//!   x = [ pₓ pᵧ p_z | vₓ vᵧ v_z | ψₓ ψᵧ ψ_z | bₐₓ bₐᵧ bₐ_z | b_gₓ b_gᵧ b_g_z | b  d ]
//!         position     velocity    attitude     accel bias       gyro bias       clock
//! ```
//!
//! The state is propagated through the strapdown mechanization driven by the IMU's
//! measured specific force `f_b` and angular rate `ω_b` (the **dead-reckoning** step): the
//! body→inertial rotation is the small-angle `C ≈ I + [ψ×]`, so attitude error couples into
//! horizontal acceleration through `ψ × (f_b − bₐ)` — the standard INS tilt coupling that
//! makes attitude weakly observable during GNSS aiding. During a GNSS outage the filter
//! coasts on the IMU alone; with a **cold-atom-interferometer (CAI)** accelerometer the
//! velocity-random-walk process noise is the CAI's `q_va` ([`crate::inertial::quantum_imu`]),
//! so the dead-reckoning drift is the quantum-sensor-limited one. The measurement is the
//! same nonlinear pseudorange/range-rate model as the 8-state filter, run through the shared
//! [`crate::fusion::ukf::Ukf`] unscented filter.

use super::tightly_coupled::Sat;
use crate::fusion::ukf::Ukf;

/// State indices.
const P: usize = 0; // position 0..3
const V: usize = 3; // velocity 3..6
const PSI: usize = 6; // attitude error 6..9
const BA: usize = 9; // accel bias 9..12
const BG: usize = 12; // gyro bias 12..15
const CB: usize = 15; // clock bias
const CD: usize = 16; // clock drift
/// Full state dimension.
pub const N: usize = 17;

/// Pseudorange `ρ = |p − sᵢ| + b` (m) from a 17-state vector.
pub fn pseudorange(state: &[f64], sat: &Sat) -> f64 {
    let dx = [
        state[P] - sat.pos[0],
        state[P + 1] - sat.pos[1],
        state[P + 2] - sat.pos[2],
    ];
    (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt() + state[CB]
}

/// Range rate `ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d` (m/s) from a 17-state vector.
pub fn range_rate(state: &[f64], sat: &Sat) -> f64 {
    let dx = [
        state[P] - sat.pos[0],
        state[P + 1] - sat.pos[1],
        state[P + 2] - sat.pos[2],
    ];
    let rng = (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt();
    let dv = [
        state[V] - sat.vel[0],
        state[V + 1] - sat.vel[1],
        state[V + 2] - sat.vel[2],
    ];
    (dx[0] * dv[0] + dx[1] * dv[1] + dx[2] * dv[2]) / rng + state[CD]
}

/// A 17-state tightly-coupled GNSS/INS navigator over the shared unscented filter.
pub struct TightlyCoupled17 {
    /// The underlying unscented Kalman filter (state `x`, covariance `p`).
    pub ukf: Ukf,
    /// Process-noise covariance added each `propagate_imu` step (17×17).
    pub q: Vec<Vec<f64>>,
    /// Inertial gravity vector (m/s²) added to the mechanized specific force.
    pub gravity: [f64; 3],
}

impl TightlyCoupled17 {
    /// Build from an initial state mean, covariance, process noise, and gravity vector.
    pub fn new(x0: Vec<f64>, p0: Vec<Vec<f64>>, q: Vec<Vec<f64>>, gravity: [f64; 3]) -> Self {
        assert_eq!(x0.len(), N);
        let mut ukf = Ukf::new(x0, p0);
        // The default α = 1e-3 makes λ ≈ −n for a 17-state filter, so the central
        // unscented weight blows up to ~−10⁶ and amplifies floating-point rounding. α = 1
        // (λ = 0) keeps the weights ~1/2n and the transform well-conditioned at this size.
        ukf.alpha = 1.0;
        TightlyCoupled17 { ukf, q, gravity }
    }

    /// Dead-reckoning predict: advance `dt` seconds through the strapdown mechanization
    /// driven by the measured body specific force `f_b` (m/s²) and angular rate `omega_b`
    /// (rad/s). Returns `false` if the covariance is not positive-definite.
    pub fn propagate_imu(&mut self, dt: f64, f_b: [f64; 3], omega_b: [f64; 3]) -> bool {
        let g = self.gravity;
        let f = move |x: &[f64]| -> Vec<f64> {
            let psi = [x[PSI], x[PSI + 1], x[PSI + 2]];
            // Bias-corrected specific force, then small-angle body→inertial rotation
            // a_inertial = (I + [ψ×])·(f_b − bₐ) + g.
            let fc = [f_b[0] - x[BA], f_b[1] - x[BA + 1], f_b[2] - x[BA + 2]];
            let cross = [
                psi[1] * fc[2] - psi[2] * fc[1],
                psi[2] * fc[0] - psi[0] * fc[2],
                psi[0] * fc[1] - psi[1] * fc[0],
            ];
            let a = [
                fc[0] + cross[0] + g[0],
                fc[1] + cross[1] + g[1],
                fc[2] + cross[2] + g[2],
            ];
            let mut out = vec![0.0; N];
            for k in 0..3 {
                out[P + k] = x[P + k] + x[V + k] * dt + 0.5 * a[k] * dt * dt;
                out[V + k] = x[V + k] + a[k] * dt;
                out[PSI + k] = x[PSI + k] + (omega_b[k] - x[BG + k]) * dt;
                out[BA + k] = x[BA + k];
                out[BG + k] = x[BG + k];
            }
            out[CB] = x[CB] + x[CD] * dt;
            out[CD] = x[CD];
            out
        };
        self.ukf.predict(f, &self.q)
    }

    /// GNSS update from per-satellite pseudoranges `pr` and range-rates `rr` (interleaved
    /// `[ρ₀, ρ̇₀, ρ₁, ρ̇₁, …]`), with white σ on each. Returns `false` on a singular update.
    pub fn update_gnss(
        &mut self,
        sats: &[Sat],
        pr: &[f64],
        rr: &[f64],
        sigma_pr: f64,
        sigma_rr: f64,
    ) -> bool {
        self.update_gnss_nis(sats, pr, rr, sigma_pr, sigma_rr)
            .is_some()
    }

    /// GNSS update exactly as [`update_gnss`](Self::update_gnss), additionally returning
    /// the **Normalised Innovation Squared** of the measurement vector — the observable
    /// innovation-whiteness statistic, distributed `χ²(2·n_sat)` under a consistent
    /// filter. `None` (state untouched) on a singular update.
    pub fn update_gnss_nis(
        &mut self,
        sats: &[Sat],
        pr: &[f64],
        rr: &[f64],
        sigma_pr: f64,
        sigma_rr: f64,
    ) -> Option<f64> {
        let m = sats.len() * 2;
        let sats = sats.to_vec();
        let h = move |x: &[f64]| -> Vec<f64> {
            let mut z = Vec::with_capacity(m);
            for s in &sats {
                z.push(pseudorange(x, s));
                z.push(range_rate(x, s));
            }
            z
        };
        let mut z = Vec::with_capacity(m);
        for i in 0..pr.len() {
            z.push(pr[i]);
            z.push(rr[i]);
        }
        let mut r = vec![vec![0.0; m]; m];
        for i in 0..sats_len_from(m) {
            r[2 * i][2 * i] = sigma_pr * sigma_pr;
            r[2 * i + 1][2 * i + 1] = sigma_rr * sigma_rr;
        }
        self.ukf.update_stats(h, &z, &r)
    }

    /// **Normalised Estimation Error Squared** `NEES = ẽᵀ P⁻¹ ẽ` of the current estimate
    /// against a full 17-state truth vector `x_true` (`ẽ = x_true − x̂`). Under a
    /// consistent filter `NEES ∼ χ²(17)` (`E[NEES] = 17`). This is the validation-time
    /// statistic (it needs the truth). Returns `None` if `P` is singular.
    pub fn nees(&self, x_true: &[f64]) -> Option<f64> {
        let idx: Vec<usize> = (0..N).collect();
        self.nees_subset(x_true, &idx)
    }

    /// **Normalised Estimation Error Squared over a chosen state subset** — `NEES =
    /// ẽ_Sᵀ (P_SS)⁻¹ ẽ_S` for the index set `idx` (the marginal sub-block of `P` and the
    /// corresponding error components). Under a consistent filter this is `χ²(|idx|)`.
    ///
    /// Why a subset matters: on a constant-velocity, level trajectory the attitude and
    /// IMU-bias error states are only **weakly observable**, so their marginal covariance
    /// stays at its (tiny) prior while the truth error is a prior draw — and the full
    /// 17×17 `P` then spans ~12 orders of magnitude in scale, so a direct inverse is
    /// numerically meaningless. Assessing NEES over the **estimable** subset (position,
    /// velocity, clock) is the honest, well-conditioned consistency statistic. Returns
    /// `None` if the sub-block is singular.
    pub fn nees_subset(&self, x_true: &[f64], idx: &[usize]) -> Option<f64> {
        assert_eq!(x_true.len(), N);
        let k = idx.len();
        let e: Vec<f64> = idx.iter().map(|&i| x_true[i] - self.ukf.x[i]).collect();
        // Marginal covariance sub-block P_SS.
        let mut sub = vec![vec![0.0; k]; k];
        for (a, &i) in idx.iter().enumerate() {
            for (b, &j) in idx.iter().enumerate() {
                sub[a][b] = self.ukf.p[i][j];
            }
        }
        let p_inv = super::ukf::inverse(&sub)?;
        let pe = (0..k)
            .map(|a| (0..k).map(|b| p_inv[a][b] * e[b]).sum::<f64>())
            .collect::<Vec<_>>();
        Some(e.iter().zip(&pe).map(|(&a, &b)| a * b).sum())
    }

    /// Position error (m) of the current estimate against a known truth.
    pub fn position_error(&self, truth: [f64; 3]) -> f64 {
        let x = &self.ukf.x;
        let d = [x[P] - truth[0], x[P + 1] - truth[1], x[P + 2] - truth[2]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }
}

fn sats_len_from(m: usize) -> usize {
    m / 2
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::inertial::quantum_imu::CaiAccelerometer;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    // A surface user near the equator; gravity points toward Earth centre (−x).
    const G: f64 = 9.81;
    fn p0_truth() -> [f64; 3] {
        [6.378_137e6, 0.0, 0.0]
    }
    fn gravity() -> [f64; 3] {
        [-G, 0.0, 0.0]
    }

    // Six GNSS satellites at MEO range with spread geometry (fixed positions).
    fn sats() -> Vec<Sat> {
        let r = 2.6e7;
        let dirs: [[f64; 3]; 6] = [
            [0.9, 0.3, 0.3],
            [0.8, -0.4, 0.45],
            [0.85, 0.1, -0.5],
            [0.7, 0.5, -0.5],
            [0.95, -0.2, -0.24],
            [0.75, -0.5, 0.43],
        ];
        dirs.iter()
            .map(|d| {
                let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
                Sat {
                    pos: [r * d[0] / n, r * d[1] / n, r * d[2] / n],
                    vel: [0.0, 0.0, 0.0],
                }
            })
            .collect()
    }

    fn truth_state(t: f64, v0: [f64; 3], ba: [f64; 3], bg: [f64; 3]) -> Vec<f64> {
        let p = p0_truth();
        let mut x = vec![0.0; N];
        x[P..P + 3].copy_from_slice(&[p[0] + v0[0] * t, p[1] + v0[1] * t, p[2] + v0[2] * t]);
        x[V..V + 3].copy_from_slice(&v0);
        x[BA..BA + 3].copy_from_slice(&ba);
        x[BG..BG + 3].copy_from_slice(&bg);
        x
    }

    // Diagonal helper.
    fn diag(vals: &[f64]) -> Vec<Vec<f64>> {
        let n = vals.len();
        let mut m = vec![vec![0.0; n]; n];
        for (i, &v) in vals.iter().enumerate() {
            m[i][i] = v;
        }
        m
    }

    #[test]
    fn measurement_model_is_consistent_with_a_known_state() {
        // Pseudorange and range-rate evaluated by hand for one satellite.
        let mut x = vec![0.0; N];
        x[P] = 6.4e6;
        x[V + 1] = 100.0; // moving +y at 100 m/s
        x[CB] = 30.0; // 30 m clock bias
        x[CD] = 2.0; // 2 m/s clock drift
        let s = Sat {
            pos: [2.6e7, 0.0, 0.0],
            vel: [0.0, 0.0, 0.0],
        };
        // |p − s| = 2.6e7 − 6.4e6 = 1.96e7 along x; + clock bias.
        assert!((pseudorange(&x, &s) - (1.96e7 + 30.0)).abs() < 1e-6);
        // line of sight is purely −x; velocity is +y ⇒ no radial rate; only clock drift.
        assert!((range_rate(&x, &s) - 2.0).abs() < 1e-9);
    }

    #[test]
    fn dead_reckoning_holds_constant_velocity_with_perfect_imu() {
        // Level constant-velocity truth, zero bias, perfect specific force f_b = −g ⇒ the
        // mechanized acceleration is exactly zero, so position advances p0 + v0·t with no
        // drift. Pure deterministic check of the strapdown integration.
        let v0 = [0.0, 150.0, 0.0];
        let x0 = truth_state(0.0, v0, [0.0; 3], [0.0; 3]);
        // A tight initial covariance keeps the sigma points near the mean, so the unscented
        // transform reproduces the deterministic mechanization (the scaled-UT weights are
        // large for a 17-state filter, so a wide spread injects a tiny numerical floor).
        let p0 = diag(&[1e-6; N]);
        let q = diag(&[0.0; N]);
        let mut nav = TightlyCoupled17::new(x0, p0, q, gravity());
        let f_b = [G, 0.0, 0.0]; // specific force balances gravity for CV
        let dt = 1.0;
        for _ in 0..120 {
            assert!(nav.propagate_imu(dt, f_b, [0.0; 3]));
        }
        let err = nav.position_error([p0_truth()[0], p0_truth()[1] + 150.0 * 120.0, p0_truth()[2]]);
        // Perfect IMU + constant velocity ⇒ no drift over the 18 km path (the residual is the
        // unscented-transform numerical floor, ~1e-5 relative).
        assert!(err < 1e-2, "perfect-IMU CV drift {err} m");
    }

    #[test]
    fn gnss_update_pulls_the_estimate_toward_truth() {
        let v0 = [0.0, 100.0, 0.0];
        let ba = [0.02, 0.0, 0.0];
        let bg = [0.0; 3];
        // Start the filter 50 m off in position and ignorant of the bias.
        let mut x0 = truth_state(0.0, v0, [0.0; 3], bg);
        x0[P] += 50.0;
        let p0 = diag(&[
            1e4, 1e4, 1e4, 1.0, 1.0, 1.0, 1e-4, 1e-4, 1e-4, 1e-2, 1e-2, 1e-2, 1e-8, 1e-8, 1e-8,
            1e2, 1.0,
        ]);
        let q = diag(&[1e-4; N]);
        let mut nav = TightlyCoupled17::new(x0, p0, q, gravity());
        let sats = sats();
        let f_b = [G + ba[0], ba[1], ba[2]];
        let err_before = nav.position_error(p0_truth());
        let dt = 0.5;
        for i in 1..=40 {
            assert!(nav.propagate_imu(dt, f_b, bg));
            let t = i as f64 * dt;
            let xt = truth_state(t, v0, ba, bg);
            let pr: Vec<f64> = sats.iter().map(|s| pseudorange(&xt, s)).collect();
            let rr: Vec<f64> = sats.iter().map(|s| range_rate(&xt, s)).collect();
            assert!(nav.update_gnss(&sats, &pr, &rr, 1.0, 0.05));
        }
        let truth_end = [p0_truth()[0], p0_truth()[1] + 100.0 * 20.0, p0_truth()[2]];
        let err_after = nav.position_error(truth_end);
        assert!(err_after < err_before, "{err_after} !< {err_before}");
        assert!(err_after < 10.0, "post-aiding error {err_after} m");
    }

    #[test]
    fn estimates_accelerometer_bias_during_aiding() {
        let v0 = [0.0, 120.0, 0.0];
        let ba = [0.03, -0.02, 0.015]; // m/s² truth accel bias
        let bg = [0.0; 3];
        let mut x0 = truth_state(0.0, v0, [0.0; 3], bg); // filter starts bias-ignorant
        x0[CB] = 0.0;
        let p0 = diag(&[
            1e2, 1e2, 1e2, 1.0, 1.0, 1.0, 1e-4, 1e-4, 1e-4, 1e-1, 1e-1, 1e-1, 1e-8, 1e-8, 1e-8,
            1e2, 1.0,
        ]);
        let q = diag(&[1e-5; N]);
        let mut nav = TightlyCoupled17::new(x0, p0, q, gravity());
        let sats = sats();
        let f_b = [G + ba[0], ba[1], ba[2]];
        let dt = 0.5;
        for i in 1..=200 {
            assert!(nav.propagate_imu(dt, f_b, bg));
            let t = i as f64 * dt;
            let xt = truth_state(t, v0, ba, bg);
            let pr: Vec<f64> = sats.iter().map(|s| pseudorange(&xt, s)).collect();
            let rr: Vec<f64> = sats.iter().map(|s| range_rate(&xt, s)).collect();
            assert!(nav.update_gnss(&sats, &pr, &rr, 1.0, 0.05));
        }
        // Accel bias estimate should approach truth within a few mg.
        for (k, &b) in ba.iter().enumerate() {
            let e = (nav.ukf.x[BA + k] - b).abs();
            assert!(e < 5e-3, "accel bias[{k}] error {e} m/s²");
        }
    }

    #[test]
    fn nees_matches_hand_derived_value_for_a_diagonal_covariance() {
        // With a diagonal P, NEES = Σ eₖ²/Pₖₖ. Build a known offset on three states
        // and a unit-on-those, large-elsewhere diagonal P so the sum is exact.
        let mut x0 = vec![0.0; N];
        let p0 = diag(&[1e30; N]); // huge variance ⇒ those terms contribute ~0
        let q = diag(&[0.0; N]);
        let mut nav = TightlyCoupled17::new(x0.clone(), p0, q, gravity());
        // Set three diagonal entries to known values via direct covariance write.
        nav.ukf.p[P][P] = 4.0; // err 6 ⇒ 36/4 = 9
        nav.ukf.p[V][V] = 1.0; // err 2 ⇒ 4/1 = 4
        nav.ukf.p[CB][CB] = 9.0; // err 3 ⇒ 9/9 = 1
        x0[P] = 6.0;
        x0[V] = 2.0;
        x0[CB] = 3.0;
        let nees = nav.nees(&x0).expect("P invertible");
        // Hand-derived: 9 + 4 + 1 = 14, plus ~0 from the 1e30-variance states.
        assert!((nees - 14.0).abs() < 1e-6, "NEES = {nees}, expected 14");
    }

    #[test]
    fn nees_subset_uses_only_the_chosen_block() {
        // With a diagonal P, the subset NEES = Σ_{k∈idx} eₖ²/Pₖₖ — independent of the
        // off-subset states. Put a huge error on an EXCLUDED state and confirm it is ignored.
        let mut x0 = vec![0.0; N];
        let p0 = diag(&[1.0; N]);
        let q = diag(&[0.0; N]);
        let mut nav = TightlyCoupled17::new(x0.clone(), p0, q, gravity());
        nav.ukf.p[P][P] = 4.0;
        nav.ukf.p[V][V] = 1.0;
        x0[P] = 6.0; // 36/4 = 9
        x0[V] = 2.0; // 4/1 = 4
        x0[PSI] = 1e6; // EXCLUDED state with a massive error — must not appear.
                       // Subset = {position-x, velocity-x} ⇒ NEES = 9 + 4 = 13 exactly.
        let nees = nav.nees_subset(&x0, &[P, V]).expect("block invertible");
        assert!(
            (nees - 13.0).abs() < 1e-9,
            "subset NEES = {nees}, expected 13"
        );
    }

    #[test]
    fn update_gnss_nis_is_returned_and_nonnegative() {
        // A well-initialised filter at truth returns a finite, non-negative NIS for a
        // noiseless measurement (the measurement equals the prediction ⇒ small NIS).
        let v0 = [0.0, 50.0, 0.0];
        let x0 = truth_state(0.0, v0, [0.0; 3], [0.0; 3]);
        let p0 = diag(&[1.0; N]);
        let q = diag(&[0.0; N]);
        let mut nav = TightlyCoupled17::new(x0.clone(), p0, q, gravity());
        let sats = sats();
        let pr: Vec<f64> = sats.iter().map(|s| pseudorange(&x0, s)).collect();
        let rr: Vec<f64> = sats.iter().map(|s| range_rate(&x0, s)).collect();
        let nis = nav
            .update_gnss_nis(&sats, &pr, &rr, 1.0, 0.05)
            .expect("update succeeds");
        assert!(nis.is_finite() && nis >= 0.0, "NIS = {nis}");
        // Measuring exactly the prediction leaves a tiny innovation ⇒ NIS ≪ the χ²(12)
        // mean of 12 for six satellites.
        assert!(nis < 12.0, "noiseless NIS should be small, got {nis}");
    }

    #[test]
    fn cai_dead_reckoning_bounds_a_120s_gnss_outage() {
        // 100 s of GNSS aiding converges position, velocity, and accelerometer bias; then a
        // 120 s outage is coasted on the CAI-quality IMU alone. The CAI velocity-random-walk
        // is negligible over 120 s (q_va·t ≪ 1 mm/s), so the coast drift is set by the
        // residual accel-bias estimate (~mg) → metres, not the kilometres a navigation-grade
        // free-INS would reach.
        let cai = CaiAccelerometer {
            wavelength_m: 780.241_209e-9,
            pulse_sep_t: 0.02,
            atom_number: 1.0e6,
            contrast: 0.5,
            cycle_time_s: 0.5,
        };
        let q_va = cai.q_va(); // white acceleration PSD (m²/s³)
        assert!(q_va > 0.0 && q_va < 1e-8, "CAI q_va = {q_va}");

        let v0 = [0.0, 200.0, 0.0];
        let ba = [0.01, 0.006, -0.008];
        let bg = [1e-6, -1e-6, 2e-6];
        let mut x0 = truth_state(0.0, v0, [0.0; 3], [0.0; 3]); // bias-ignorant start
        x0[P] += 5.0;
        let p0 = diag(&[
            1e2, 1e2, 1e2, 1.0, 1.0, 1.0, 1e-6, 1e-6, 1e-6, 1e-2, 1e-2, 1e-2, 1e-10, 1e-10, 1e-10,
            1e2, 1.0,
        ]);
        // Process noise: velocity states carry the CAI white-acceleration contribution q_va·dt;
        // small terms keep the other states alive.
        let dt = 0.5;
        let mut qd = vec![1e-9; N];
        for k in 0..3 {
            qd[V + k] = q_va * dt; // CAI-limited velocity random walk
            qd[BA + k] = 1e-10;
            qd[PSI + k] = 1e-12;
        }
        let q = diag(&qd);
        let mut nav = TightlyCoupled17::new(x0, p0, q, gravity());
        let sats = sats();

        let mut rng = ChaCha8Rng::seed_from_u64(0x17_5747);
        let n_pr = Normal::new(0.0, 1.0).unwrap();
        let n_rr = Normal::new(0.0, 0.05).unwrap();
        // CAI accelerometer measurement noise per step: σ_a = √(q_va/dt).
        let sig_a = (q_va / dt).sqrt();
        let n_a = Normal::new(0.0, sig_a).unwrap();

        let imu = |rng: &mut ChaCha8Rng| -> [f64; 3] {
            [
                G + ba[0] + n_a.sample(rng),
                ba[1] + n_a.sample(rng),
                ba[2] + n_a.sample(rng),
            ]
        };

        // 100 s of aiding (200 steps).
        for i in 1..=200 {
            assert!(nav.propagate_imu(dt, imu(&mut rng), bg));
            let t = i as f64 * dt;
            let xt = truth_state(t, v0, ba, bg);
            let pr: Vec<f64> = sats
                .iter()
                .map(|s| pseudorange(&xt, s) + n_pr.sample(&mut rng))
                .collect();
            let rr: Vec<f64> = sats
                .iter()
                .map(|s| range_rate(&xt, s) + n_rr.sample(&mut rng))
                .collect();
            assert!(nav.update_gnss(&sats, &pr, &rr, 1.0, 0.05));
        }

        // 120 s outage: coast on the CAI IMU only.
        let t_out_start = 100.0;
        let n_coast = 240; // 120 s at 0.5 s
        for j in 1..=n_coast {
            assert!(nav.propagate_imu(dt, imu(&mut rng), bg));
            let _ = j;
        }
        let t_end = t_out_start + 120.0;
        let truth_end = [
            p0_truth()[0] + v0[0] * t_end,
            p0_truth()[1] + v0[1] * t_end,
            p0_truth()[2] + v0[2] * t_end,
        ];
        let err = nav.position_error(truth_end);
        assert!(
            err < 200.0,
            "120-s CAI dead-reckoning outage drift {err} m (expected ≲ 200 m)"
        );
    }
}
