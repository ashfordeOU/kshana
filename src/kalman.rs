// SPDX-License-Identifier: AGPL-3.0-only
//! Two-state Kalman clock estimator.
//!
//! State `x = [phase error (s), fractional-frequency error (1/s)]`. The clock is
//! the standard two-state model (Brown & Hwang; Zucca & Tavella, Metrologia 2005):
//!
//! ```text
//!   d(phase)/dt = freq + white-FM driving   (PSD q_wf)
//!   d(freq)/dt  = random-walk-FM driving     (PSD q_rw)
//! ```
//!
//! Over a step `dt` the transition is `F = [[1, dt], [0, 1]]` and the exact
//! (van Loan) process-noise covariance is
//!
//! ```text
//!   Q = q_wf * [[dt, 0], [0, 0]] + q_rw * [[dt^3/3, dt^2/2], [dt^2/2, dt]].
//! ```
//!
//! These `Q` terms are exactly the per-step noise the simulator injects (phase
//! white-FM increment variance `q_wf*dt`; frequency random-walk increment
//! variance `q_rw*dt`), so the filter is consistent with the truth model.
//!
//! Coasting from a known state (`P = 0`, no measurements) the phase-error variance
//! grows to `P[0,0](T) = q_wf*T + q_rw*T^3/3` — exactly the analytic holdover error
//! growth (the `q_rw*T^3/3` term is the random-walk-FM relation of NIST SP 1065).
//! The filter therefore reproduces the analytic limit while also yielding an
//! online uncertainty (1-sigma) bound usable for integrity.
//!
//! The estimator is fully deterministic: no random sampling, so a given sequence
//! of `predict`/`update` calls is bit-for-bit reproducible.

/// Two-state (phase, frequency) Kalman clock estimator.
#[derive(Clone, Debug)]
pub struct KalmanClock {
    x: [f64; 2],      // [phase error (s), frequency error (1/s)]
    p: [[f64; 2]; 2], // state covariance
    q_wf: f64,        // white-FM PSD (s^2/s)
    q_rw: f64,        // random-walk-FM PSD ((1/s)^2/s)
    r: f64,           // phase-measurement noise variance (s^2)
}

impl KalmanClock {
    /// New filter for white-FM PSD `q_wf`, random-walk-FM PSD `q_rw`, and phase
    /// measurement-noise variance `r` (s^2). Starts from a perfectly known state
    /// (zero covariance); seed an initial uncertainty with [`with_initial_cov`].
    ///
    /// [`with_initial_cov`]: Self::with_initial_cov
    pub fn new(q_wf: f64, q_rw: f64, r: f64) -> Self {
        Self {
            x: [0.0, 0.0],
            p: [[0.0, 0.0], [0.0, 0.0]],
            q_wf,
            q_rw,
            r,
        }
    }

    /// Builder: set the initial phase- and frequency-error variances (diagonal P).
    pub fn with_initial_cov(mut self, phase_var: f64, freq_var: f64) -> Self {
        self.p = [[phase_var, 0.0], [0.0, freq_var]];
        self
    }

    /// Time update over `dt`: propagate state and covariance, adding process noise.
    pub fn predict(&mut self, dt: f64) {
        if dt <= 0.0 {
            return;
        }
        // x = F x, with F = [[1, dt], [0, 1]].
        self.x[0] += dt * self.x[1];

        // P = F P F^T.
        let p = self.p;
        // F P:
        let fp = [
            [p[0][0] + dt * p[1][0], p[0][1] + dt * p[1][1]],
            [p[1][0], p[1][1]],
        ];
        // (F P) F^T, with F^T = [[1, 0], [dt, 1]]:
        let mut np = [
            [fp[0][0] + dt * fp[0][1], fp[0][1]],
            [fp[1][0] + dt * fp[1][1], fp[1][1]],
        ];

        // + Q (exact van Loan discretisation).
        let (dt2, dt3) = (dt * dt, dt * dt * dt);
        np[0][0] += self.q_wf * dt + self.q_rw * dt3 / 3.0;
        np[0][1] += self.q_rw * dt2 / 2.0;
        np[1][0] += self.q_rw * dt2 / 2.0;
        np[1][1] += self.q_rw * dt;
        self.p = np;
    }

    /// Measurement update from a phase observation `z` (s). Scalar update with
    /// observation matrix `H = [1, 0]` and the filter's measurement-noise
    /// variance `r`.
    pub fn update(&mut self, z: f64) {
        self.update_with_r(z, self.r);
    }

    /// Measurement update from a phase observation `z` (s) using an explicit
    /// measurement-noise variance `r` (s^2) for this update only — e.g. a noisier
    /// re-anchor (optical time-transfer) versus GNSS disciplining.
    pub fn update_with_r(&mut self, z: f64, r: f64) {
        let s = self.p[0][0] + r;
        if s <= 0.0 {
            return;
        }
        let k = [self.p[0][0] / s, self.p[1][0] / s]; // Kalman gain
        let innov = z - self.x[0];
        self.x[0] += k[0] * innov;
        self.x[1] += k[1] * innov;

        // Covariance update in **Joseph stabilised form**:
        //   P⁺ = (I − K H) P (I − K H)ᵀ + K R Kᵀ,   H = [1, 0].
        // Unlike the algebraically-equivalent naive `P⁺ = (I − K H) P`, the Joseph
        // form is a congruence transform of a PSD matrix plus a PSD rank-1 term, so
        // it stays positive-semidefinite under finite-precision arithmetic even at
        // extreme Q/R ratios where the naive form can lose symmetry/PSD-ness.
        let p = self.p;
        // A = I − K H = [[1 − k0, 0], [−k1, 1]].
        let a = [[1.0 - k[0], 0.0], [-k[1], 1.0]];
        // AP = A · P.
        let ap = [
            [
                a[0][0] * p[0][0] + a[0][1] * p[1][0],
                a[0][0] * p[0][1] + a[0][1] * p[1][1],
            ],
            [
                a[1][0] * p[0][0] + a[1][1] * p[1][0],
                a[1][0] * p[0][1] + a[1][1] * p[1][1],
            ],
        ];
        // APAᵀ = (A P) · Aᵀ.
        let mut np = [
            [
                ap[0][0] * a[0][0] + ap[0][1] * a[0][1],
                ap[0][0] * a[1][0] + ap[0][1] * a[1][1],
            ],
            [
                ap[1][0] * a[0][0] + ap[1][1] * a[0][1],
                ap[1][0] * a[1][0] + ap[1][1] * a[1][1],
            ],
        ];
        // + K R Kᵀ = r · [[k0², k0·k1], [k0·k1, k1²]].
        np[0][0] += r * k[0] * k[0];
        np[0][1] += r * k[0] * k[1];
        np[1][0] += r * k[0] * k[1];
        np[1][1] += r * k[1] * k[1];
        self.p = np;
    }

    /// The 2×2 state covariance `P`.
    pub fn covariance(&self) -> [[f64; 2]; 2] {
        self.p
    }

    /// Innovation (predicted-measurement) variance `S = H P Hᵀ + r` for a phase
    /// update with measurement-noise variance `r` — the denominator of the
    /// Normalised Innovation Squared statistic.
    pub fn innovation_var(&self, r: f64) -> f64 {
        self.p[0][0] + r
    }

    /// Whether `P` is numerically positive-semidefinite, tested by attempting a
    /// Cholesky factorisation (with a small relative tolerance for the rounding of
    /// an exactly-singular matrix). A `false` here means an update has driven the
    /// covariance non-PSD — the failure mode the Joseph form exists to prevent.
    pub fn is_psd(&self) -> bool {
        let p = self.p;
        // Scale-relative tolerance for "≥ 0" on the Cholesky pivots.
        let scale = p[0][0].abs().max(p[1][1].abs()).max(1e-300);
        let tol = -1e-9 * scale;
        if p[0][0] < tol {
            return false;
        }
        let l00 = p[0][0].max(0.0).sqrt();
        if l00 == 0.0 {
            // First pivot is (numerically) zero: PSD iff the rest is non-negative.
            return p[1][1] >= tol;
        }
        let l10 = p[1][0] / l00;
        p[1][1] - l10 * l10 >= tol
    }

    /// Estimated phase error (s).
    pub fn phase_est(&self) -> f64 {
        self.x[0]
    }
    /// Estimated fractional-frequency error (1/s).
    pub fn freq_est(&self) -> f64 {
        self.x[1]
    }
    /// Phase-error variance (s^2) — the filter's online uncertainty.
    pub fn phase_var(&self) -> f64 {
        self.p[0][0]
    }
    /// Phase-error 1-sigma uncertainty (s).
    pub fn phase_sigma(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn coasting_covariance_matches_analytic_holdover() {
        // From a known state (P=0), coasting N steps with no measurement must grow
        // the phase-error variance to exactly q_wf*T + q_rw*T^3/3, the frequency
        // variance to q_rw*T, and the cross term to q_rw*T^2/2.
        let (q_wf, q_rw, r) = (1e-24, 1e-30, 1e-20);
        let dt = 1.0;
        let n = 100usize;
        let t = n as f64 * dt;
        let mut kf = KalmanClock::new(q_wf, q_rw, r);
        for _ in 0..n {
            kf.predict(dt);
        }
        let expected_phase_var = q_wf * t + q_rw * t.powi(3) / 3.0;
        let rel = (kf.phase_var() - expected_phase_var).abs() / expected_phase_var;
        assert!(
            rel < 1e-9,
            "phase_var={} expected={expected_phase_var}",
            kf.phase_var()
        );
    }

    #[test]
    fn pure_random_walk_fm_coast_is_q_rw_t_cubed_over_three() {
        // With white FM off, the coast variance is exactly q_rw*T^3/3 — the
        // random-walk-FM holdover relation (sigma_x^2(T) = q_rw*T^3/3).
        let q_rw = 2e-31;
        let dt = 0.5;
        let n = 200usize;
        let t = n as f64 * dt;
        let mut kf = KalmanClock::new(0.0, q_rw, 1e-20);
        for _ in 0..n {
            kf.predict(dt);
        }
        let expected = q_rw * t.powi(3) / 3.0;
        let rel = (kf.phase_var() - expected).abs() / expected;
        assert!(
            rel < 1e-9,
            "phase_var={} expected={expected}",
            kf.phase_var()
        );
    }

    #[test]
    fn measurement_pulls_estimate_and_shrinks_covariance() {
        // After a coast, a precise measurement (small r) corrects the estimate
        // towards the observation and reduces the phase-error variance.
        let mut kf = KalmanClock::new(1e-24, 1e-30, 1e-26);
        for _ in 0..50 {
            kf.predict(1.0);
        }
        let var_before = kf.phase_var();
        kf.update(3e-12);
        assert!(kf.phase_var() < var_before, "covariance did not shrink");
        // With r << P, the estimate should sit close to the measurement.
        assert!(
            (kf.phase_est() - 3e-12).abs() < 3e-13,
            "phase_est={}",
            kf.phase_est()
        );
    }

    #[test]
    fn perfect_repeated_measurements_drive_variance_down() {
        // Repeated zero-noise-limit measurements at a stationary truth converge the
        // phase variance towards the measurement floor.
        let mut kf = KalmanClock::new(1e-26, 1e-32, 1e-24).with_initial_cov(1e-18, 1e-24);
        for _ in 0..200 {
            kf.predict(1.0);
            kf.update(0.0);
        }
        assert!(kf.phase_var() < 1e-22, "phase_var={}", kf.phase_var());
        assert!(kf.phase_est().abs() < 1e-9);
    }

    #[test]
    fn joseph_update_stays_psd_at_extreme_q_over_r() {
        // The finding's worst case: a colossal Q/R ratio (R=1e-26, Q≈1e-30 per
        // step) where the naive (I−KH)P update can lose positive-semidefiniteness
        // to rounding. The Joseph form must keep P Cholesky-decomposable through a
        // long predict/update sequence.
        let r = 1e-26;
        let mut kf = KalmanClock::new(1e-30, 1e-34, r).with_initial_cov(1e-18, 1e-24);
        for i in 0..500 {
            kf.predict(1.0);
            kf.update(1e-13 * (i as f64).sin());
            assert!(
                kf.is_psd(),
                "covariance lost PSD-ness at step {i}: P={:?}",
                kf.covariance()
            );
            // Variances are non-negative and the cross term obeys Cauchy–Schwarz.
            let p = kf.covariance();
            assert!(p[0][0] >= 0.0 && p[1][1] >= 0.0);
            assert!(p[0][1] * p[1][0] <= p[0][0] * p[1][1] * (1.0 + 1e-6));
        }
    }

    #[test]
    fn joseph_form_matches_naive_update_when_well_conditioned() {
        // Where the naive form is numerically fine, Joseph must agree with it (they
        // are algebraically identical). Check the posterior variance against the
        // closed form P⁺[0][0] = (1−k0)·P⁻[0][0] for one scalar update.
        let mut kf = KalmanClock::new(1e-24, 1e-30, 1e-22);
        for _ in 0..20 {
            kf.predict(1.0);
        }
        let p_before = kf.covariance();
        let r = 1e-22;
        let s = p_before[0][0] + r;
        let k0 = p_before[0][0] / s;
        let expected_p00 = (1.0 - k0) * p_before[0][0]; // = r·P/(P+r)
        kf.update(0.0);
        let got = kf.covariance()[0][0];
        let rel = (got - expected_p00).abs() / expected_p00;
        assert!(rel < 1e-9, "joseph P00={got} expected={expected_p00}");
    }

    #[test]
    fn predict_update_sequence_is_deterministic() {
        let run = || {
            let mut kf = KalmanClock::new(1e-24, 1e-30, 1e-22);
            for i in 0..100 {
                kf.predict(1.0);
                if i % 5 == 0 {
                    kf.update(1e-13 * i as f64);
                }
            }
            (kf.phase_est(), kf.phase_var())
        };
        assert_eq!(run(), run());
    }
}
