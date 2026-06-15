// SPDX-License-Identifier: Apache-2.0
//! Three-state onboard clock error model: phase, fractional-frequency, frequency drift.
//!
//! This extends the two-state [`crate::kalman::KalmanClock`] (phase, frequency) with a
//! third **frequency-drift** (aging) state, the model an onboard oscillator on a deep-space
//! cruise needs once the holdover interval is long enough that linear aging dominates the
//! random-walk-FM growth. The error state is
//!
//! ```text
//!   x = [ phase error (s), fractional-frequency error (1/s = s/s), frequency drift (1/s^2) ]
//! ```
//!
//! with the continuous model (Brown & Hwang, *Introduction to Random Signals and Applied
//! Kalman Filtering*; Bar-Shalom, Li & Kirubarajan, *Estimation with Applications to Tracking
//! and Navigation*, §6; Zucca & Tavella, *Metrologia* 2005 for the clock specialisation):
//!
//! ```text
//!   d(phase)/dt = freq  + white-FM driving             (PSD q_wf)
//!   d(freq)/dt  = drift + random-walk-FM driving        (PSD q_rw)
//!   d(drift)/dt =         random-run/drift driving       (PSD q_drift)
//! ```
//!
//! The continuous dynamics matrix is `A = [[0,1,0],[0,0,1],[0,0,0]]` and the process-noise
//! spectral density is `Qc = diag(q_wf, q_rw, q_drift)`. Over a step `dt` the state transition
//! is the matrix exponential `F = exp(A·dt) = [[1, dt, dt^2/2], [0, 1, dt], [0, 0, 1]]`.
//!
//! ## Exact (van Loan) discrete process noise
//!
//! The exact discrete process-noise covariance is `Q = ∫₀^{dt} F(τ)·Qc·F(τ)ᵀ dτ`. Because
//! `F(τ)` is the polynomial `[[1,τ,τ²/2],[0,1,τ],[0,0,1]]` and `Qc` is diagonal, the integral is
//! a polynomial in `dt` (Bar-Shalom §6.2.3; this is the discrete white-noise-jerk / continuous
//! white-noise-acceleration family specialised to a clock). Writing `Q[i][j] =
//! ∫₀^{dt} Σ_k q_k·F[i][k]·F[j][k] dτ` with `q = (q_wf, q_rw, q_drift)`:
//!
//! ```text
//!   Q00 = q_wf·dt + q_rw·dt^3/3 + q_drift·dt^5/20
//!   Q01 = Q10    =  q_rw·dt^2/2 + q_drift·dt^4/8
//!   Q02 = Q20    =                q_drift·dt^3/6
//!   Q11 =          q_rw·dt      + q_drift·dt^3/3
//!   Q12 = Q21    =                q_drift·dt^2/2
//!   Q22 =                         q_drift·dt
//! ```
//!
//! With `q_drift = 0` this reduces **exactly** to the two-state [`crate::kalman::KalmanClock`]
//! Q (`Q00 = q_wf·dt + q_rw·dt^3/3`, `Q01 = q_rw·dt^2/2`, `Q11 = q_rw·dt`), so the three-state
//! model is a strict superset of the validated two-state one. Coasting from a known state
//! (`P = 0`, no measurements) grows the phase-error variance to exactly `Q00(T)` — the analytic
//! holdover error of NIST SP 1065's random-walk-FM (`q_rw·T^3/3`) and random-run-FM
//! (`q_drift·T^5/20`) relations.
//!
//! The estimator is fully deterministic — no random sampling — so a given sequence of
//! `predict`/`update` calls is bit-for-bit reproducible.

/// Three-state (phase, frequency, frequency-drift) Kalman clock estimator.
///
/// State `x = [phase (s), fractional frequency (1/s), drift (1/s^2)]`, covariance `P` (3×3),
/// and the three driving-noise PSDs. Build with [`new`](Self::new); seed an initial
/// uncertainty with [`with_initial_cov`](Self::with_initial_cov); advance with
/// [`predict`](Self::predict) and correct with [`update_phase`](Self::update_phase).
#[derive(Clone, Debug)]
pub struct ClockState3 {
    /// `[phase (s), fractional frequency (1/s), drift (1/s^2)]`.
    pub x: [f64; 3],
    /// State covariance `P` (3×3).
    pub p: [[f64; 3]; 3],
    q_wf: f64,    // white-FM PSD on phase (s^2/s)
    q_rw: f64,    // random-walk-FM PSD on frequency ((1/s)^2/s)
    q_drift: f64, // random-run/drift PSD on drift ((1/s^2)^2/s)
}

impl ClockState3 {
    /// New filter for white-FM PSD `q_wf`, random-walk-FM PSD `q_rw`, and drift (random-run)
    /// PSD `q_drift`. Starts from a perfectly known zero state (zero covariance); seed an
    /// initial uncertainty with [`with_initial_cov`](Self::with_initial_cov).
    pub fn new(q_wf: f64, q_rw: f64, q_drift: f64) -> Self {
        Self {
            x: [0.0; 3],
            p: [[0.0; 3]; 3],
            q_wf,
            q_rw,
            q_drift,
        }
    }

    /// Builder: set the initial phase-, frequency- and drift-error variances (diagonal `P`).
    pub fn with_initial_cov(mut self, phase_var: f64, freq_var: f64, drift_var: f64) -> Self {
        self.p = [
            [phase_var, 0.0, 0.0],
            [0.0, freq_var, 0.0],
            [0.0, 0.0, drift_var],
        ];
        self
    }

    /// Time update over `dt`: propagate state and covariance, adding the exact van Loan
    /// process noise. `F = [[1, dt, dt^2/2], [0, 1, dt], [0, 0, 1]]`.
    pub fn predict(&mut self, dt: f64) {
        if dt <= 0.0 {
            return;
        }
        let (dt2, dt3, dt4, dt5) = {
            let d2 = dt * dt;
            (d2, d2 * dt, d2 * d2, d2 * d2 * dt)
        };
        let half_dt2 = 0.5 * dt2;

        // x = F x.
        self.x[0] += dt * self.x[1] + half_dt2 * self.x[2];
        self.x[1] += dt * self.x[2];

        // P = F P F^T, F = [[1, dt, dt^2/2], [0, 1, dt], [0, 0, 1]].
        let p = self.p;
        // FP = F · P (row-combine the lower rows into the upper ones).
        let fp = [
            [
                p[0][0] + dt * p[1][0] + half_dt2 * p[2][0],
                p[0][1] + dt * p[1][1] + half_dt2 * p[2][1],
                p[0][2] + dt * p[1][2] + half_dt2 * p[2][2],
            ],
            [
                p[1][0] + dt * p[2][0],
                p[1][1] + dt * p[2][1],
                p[1][2] + dt * p[2][2],
            ],
            [p[2][0], p[2][1], p[2][2]],
        ];
        // (FP) F^T: result[i][j] = Σ_k FP[i][k]·F^T[k][j] = Σ_k FP[i][k]·F[j][k] = FP[i]·(row j
        // of F). With F's rows row0 = [1, dt, dt^2/2], row1 = [0, 1, dt], row2 = [0, 0, 1]:
        //   np[i][0] = fp[i][0] + dt·fp[i][1] + (dt^2/2)·fp[i][2],
        //   np[i][1] =            fp[i][1] + dt·fp[i][2],
        //   np[i][2] =                          fp[i][2].
        let mut np = [[0.0f64; 3]; 3];
        for i in 0..3 {
            np[i][0] = fp[i][0] + dt * fp[i][1] + half_dt2 * fp[i][2];
            np[i][1] = fp[i][1] + dt * fp[i][2];
            np[i][2] = fp[i][2];
        }

        // + Q (exact van Loan discretisation; see module docs for the derivation).
        let (qwf, qrw, qd) = (self.q_wf, self.q_rw, self.q_drift);
        np[0][0] += qwf * dt + qrw * dt3 / 3.0 + qd * dt5 / 20.0;
        let q01 = qrw * dt2 / 2.0 + qd * dt4 / 8.0;
        np[0][1] += q01;
        np[1][0] += q01;
        let q02 = qd * dt3 / 6.0;
        np[0][2] += q02;
        np[2][0] += q02;
        np[1][1] += qrw * dt + qd * dt3 / 3.0;
        let q12 = qd * dt2 / 2.0;
        np[1][2] += q12;
        np[2][1] += q12;
        np[2][2] += qd * dt;

        self.p = np;
    }

    /// Measurement update from a phase observation `z` (s) with measurement-noise variance
    /// `r` (s^2). Scalar update with observation matrix `H = [1, 0, 0]`, in the **Joseph
    /// stabilised** form `P⁺ = (I − K H) P (I − K H)ᵀ + K R Kᵀ` so the covariance stays
    /// positive-semidefinite under finite-precision arithmetic even at extreme Q/R ratios
    /// (the same stabilisation [`crate::kalman::KalmanClock::update`] uses).
    pub fn update_phase(&mut self, z: f64, r: f64) {
        let s = self.p[0][0] + r;
        if s <= 0.0 {
            return;
        }
        // Kalman gain K = P Hᵀ / S, H = [1,0,0] picks the first column of P.
        let k = [self.p[0][0] / s, self.p[1][0] / s, self.p[2][0] / s];
        let innov = z - self.x[0];
        for (xi, &ki) in self.x.iter_mut().zip(k.iter()) {
            *xi += ki * innov;
        }

        // A = I − K H = I − K·[1,0,0]: subtracts K from the first column only.
        //   A = [[1−k0, 0, 0], [−k1, 1, 0], [−k2, 0, 1]].
        let a = [[1.0 - k[0], 0.0, 0.0], [-k[1], 1.0, 0.0], [-k[2], 0.0, 1.0]];
        let p = self.p;
        // AP = A · P.
        let mut ap = [[0.0f64; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                ap[i][j] = a[i][0] * p[0][j] + a[i][1] * p[1][j] + a[i][2] * p[2][j];
            }
        }
        // APAᵀ = (A P) · Aᵀ.
        let mut np = [[0.0f64; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                np[i][j] = ap[i][0] * a[j][0] + ap[i][1] * a[j][1] + ap[i][2] * a[j][2];
            }
        }
        // + K R Kᵀ = r · k kᵀ (rank-1 PSD term).
        for i in 0..3 {
            for j in 0..3 {
                np[i][j] += r * k[i] * k[j];
            }
        }
        self.p = np;
    }

    /// The 3×3 state covariance `P`.
    pub fn covariance(&self) -> [[f64; 3]; 3] {
        self.p
    }

    /// Estimated phase error (s).
    pub fn phase_est(&self) -> f64 {
        self.x[0]
    }
    /// Estimated fractional-frequency error (1/s).
    pub fn freq_est(&self) -> f64 {
        self.x[1]
    }
    /// Estimated frequency drift / aging (1/s^2).
    pub fn drift_est(&self) -> f64 {
        self.x[2]
    }
    /// Phase-error 1-sigma uncertainty (s).
    pub fn phase_sigma(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }

    /// Whether `P` is numerically positive-semidefinite, tested by an explicit 3×3 Cholesky
    /// (`L Lᵀ`) with a scale-relative tolerance on the pivots — the direct generalisation of
    /// the 2×2 [`crate::kalman::KalmanClock::is_psd`] check. A `false` means an update drove
    /// the covariance non-PSD, the failure mode the Joseph form exists to prevent. Requires
    /// (approximate) symmetry first, then non-negative Cholesky pivots; a numerically-zero
    /// pivot is admitted only when its row's off-diagonal contribution also vanishes (the
    /// PSD completion of a singular leading minor).
    pub fn is_psd(&self) -> bool {
        let p = self.p;
        let scale = p[0][0]
            .abs()
            .max(p[1][1].abs())
            .max(p[2][2].abs())
            .max(1e-300);
        let tol = -1e-9 * scale;
        let sym_tol = 1e-9 * scale + 1e-300;
        // Symmetry of the three off-diagonal pairs.
        if (p[0][1] - p[1][0]).abs() > sym_tol
            || (p[0][2] - p[2][0]).abs() > sym_tol
            || (p[1][2] - p[2][1]).abs() > sym_tol
        {
            return false;
        }
        // Cholesky pivot/off-diagonal helpers (zero-pivot-tolerant).
        let pivot = |sum: f64| -> Option<f64> {
            if sum < tol {
                None
            } else {
                Some(sum.max(0.0).sqrt())
            }
        };
        let off = |sum: f64, diag: f64| -> Option<f64> {
            if diag > 0.0 {
                Some(sum / diag)
            } else if sum.abs() > 1e-6 * scale + 1e-300 {
                None // singular pivot but a non-vanishing off-diagonal: not PSD
            } else {
                Some(0.0)
            }
        };
        // L[0][0]; L[1][0]; L[1][1]; L[2][0]; L[2][1]; L[2][2].
        let Some(l00) = pivot(p[0][0]) else {
            return false;
        };
        let Some(l10) = off(p[1][0], l00) else {
            return false;
        };
        let Some(l11) = pivot(p[1][1] - l10 * l10) else {
            return false;
        };
        let Some(l20) = off(p[2][0], l00) else {
            return false;
        };
        let Some(l21) = off(p[2][1] - l20 * l10, l11) else {
            return false;
        };
        pivot(p[2][2] - l20 * l20 - l21 * l21).is_some()
    }
}

/// Map a clock **class** (its Allan-deviation profile) to the three driving-noise PSDs of the
/// [`ClockState3`] model. Returns `(q_wf, q_rw, q_drift)`.
///
/// The relations are the standard NIST SP 1065 (Riley, *Handbook of Frequency Stability
/// Analysis*) power-law identities, the same ones [`crate::kalman::KalmanClock`] and the
/// clock simulator [`crate::models::ClockModel`] use:
///
/// * **White FM** dominates the short-tau Allan deviation as `σ_y(τ) = a_wfm / √τ`, and the
///   two-state coast relation gives the phase white-FM PSD `q_wf = a_wfm²` (so `σ_y²(1 s) =
///   q_wf`). Pass `white_fm_adev_1s = a_wfm = σ_y(1 s)`.
/// * **Random-walk FM** rises as `σ_y(τ) = b_rwfm · √(τ/3)`, i.e. `σ_y²(τ) = q_rw·τ/3`, so the
///   frequency random-walk PSD is `q_rw = 3·b_rwfm²` where `b_rwfm = σ_y(τ)/√(τ/3)` is the
///   random-walk-FM ADEV level (its value at τ = 1 s on the +1/2 slope). Pass
///   `rw_fm_level = b_rwfm`.
/// * **Random-run FM / drift** (the integral of random-walk FM, ADEV slope +3/2 —
///   i.e. `σ_y ∝ τ^{3/2}`; +1 is the slope of *deterministic* linear drift, a
///   different process) has
///   `σ_y(τ) = c · τ·√(τ/20)`, i.e. `σ_y²(τ) = q_drift·τ³/20`, so the drift PSD is
///   `q_drift = 20·c²` where `c` is the drift ADEV level at τ = 1 s. Pass `drift_level = c`.
///   Pass `0.0` to disable the drift state's process noise.
///
/// All three arguments are Allan **deviations** (dimensionless `σ_y` levels); the function
/// squares and scales them into the PSDs the predict step expects.
pub fn q_from_allan(white_fm_adev_1s: f64, rw_fm_level: f64, drift_level: f64) -> (f64, f64, f64) {
    let q_wf = white_fm_adev_1s * white_fm_adev_1s;
    let q_rw = 3.0 * rw_fm_level * rw_fm_level;
    let q_drift = 20.0 * drift_level * drift_level;
    (q_wf, q_rw, q_drift)
}

/// Reference onboard-clock classes, by their τ = 1 s Allan deviation — the spaceborne
/// oscillators a deep-space PNT estimator must model.
///
/// Figures are representative order-of-magnitude values from the open literature
/// (Riley, NIST SP 1065; the JPL Deep Space Atomic Clock results, Burt et al.,
/// *Nature* 2021); they bracket the achievable one-way Doppler precision rather than
/// specifying any one flight unit.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ClockClass {
    /// **CSAC** — a chip-scale atomic clock, the small low-power class: white-FM ADEV
    /// `σ_y(1 s) ≈ 3e-10` (e.g. Microsemi SA.45s class). The least stable here.
    Csac,
    /// **USO** — an ultra-stable (quartz) oscillator, the workhorse deep-space clock:
    /// `σ_y(1 s) ≈ 1e-12` (1e-12…1e-13 band).
    Uso,
    /// **DSAC** — a deep-space atomic clock (trapped-ion mercury), the most stable class:
    /// `σ_y(1 s) ≈ 1e-13` (reaching 1e-14…1e-15 at long tau; Burt et al., *Nature* 2021).
    Dsac,
}

impl ClockClass {
    /// The class's representative white-FM Allan deviation at τ = 1 s (dimensionless).
    pub fn adev_1s(self) -> f64 {
        match self {
            ClockClass::Csac => 3.0e-10,
            ClockClass::Uso => 1.0e-12,
            ClockClass::Dsac => 1.0e-13,
        }
    }

    /// Representative `(q_wf, q_rw, q_drift)` PSDs for this class, via [`q_from_allan`].
    /// The random-walk-FM and drift levels are set two and four decades below the white-FM
    /// `σ_y(1 s)` respectively — a conservative, representative long-tau red-noise floor for a
    /// well-behaved spaceborne oscillator (not a per-unit specification).
    pub fn psds(self) -> (f64, f64, f64) {
        let a = self.adev_1s();
        q_from_allan(a, a * 1.0e-2, a * 1.0e-4)
    }

    /// The one-way line-of-sight Doppler velocity error (m/s) a `σ_y(1 s)` instability maps to:
    /// `Δv = c · σ_y`, with `c` the speed of light. CSAC's 3e-10 → ~0.09 m/s; a USO's 1e-12 →
    /// ~3e-4 m/s (0.3 mm/s); a DSAC's 1e-13 → ~3e-5 m/s (0.03 mm/s) — the mm/s → 0.01 mm/s
    /// progression that makes the better clock worth its mass.
    pub fn doppler_floor_1s(self) -> f64 {
        const C: f64 = 299_792_458.0;
        C * self.adev_1s()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::allan::overlapping_adev;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    #[test]
    fn van_loan_q_3state_matches_analytic() {
        // Predicting once from a zero covariance must deposit exactly the hand-derived van
        // Loan Q for the [phase, freq, drift] model. Pick distinct PSDs so every term is
        // exercised (no accidental cancellation), and a non-unit dt so every dt power shows.
        let (q_wf, q_rw, q_drift) = (1e-24, 1e-30, 1e-36);
        let dt = 0.7;
        let mut kf = ClockState3::new(q_wf, q_rw, q_drift);
        kf.predict(dt);
        let p = kf.covariance();

        let (dt2, dt3, dt4, dt5) = (dt * dt, dt.powi(3), dt.powi(4), dt.powi(5));
        let q00 = q_wf * dt + q_rw * dt3 / 3.0 + q_drift * dt5 / 20.0;
        let q01 = q_rw * dt2 / 2.0 + q_drift * dt4 / 8.0;
        let q02 = q_drift * dt3 / 6.0;
        let q11 = q_rw * dt + q_drift * dt3 / 3.0;
        let q12 = q_drift * dt2 / 2.0;
        let q22 = q_drift * dt;
        let want = [[q00, q01, q02], [q01, q11, q12], [q02, q12, q22]];

        for i in 0..3 {
            for j in 0..3 {
                let scale = want[i][j].abs().max(1e-300);
                assert!(
                    (p[i][j] - want[i][j]).abs() / scale < 1e-12,
                    "Q[{i}][{j}] = {} vs analytic {} (rel {})",
                    p[i][j],
                    want[i][j],
                    (p[i][j] - want[i][j]).abs() / scale
                );
            }
        }
    }

    #[test]
    fn van_loan_q_reduces_to_two_state_when_drift_off() {
        // With q_drift = 0 the three-state Q must collapse to the validated two-state
        // KalmanClock Q (Q00 = q_wf·dt + q_rw·dt^3/3, Q01 = q_rw·dt^2/2, Q11 = q_rw·dt),
        // and the drift row/column must stay exactly zero from a zero start.
        let (q_wf, q_rw) = (2e-24, 3e-30);
        let dt = 1.3;
        let mut kf = ClockState3::new(q_wf, q_rw, 0.0);
        kf.predict(dt);
        let p = kf.covariance();
        let (dt2, dt3) = (dt * dt, dt.powi(3));
        assert!((p[0][0] - (q_wf * dt + q_rw * dt3 / 3.0)).abs() / p[0][0] < 1e-12);
        assert!((p[0][1] - q_rw * dt2 / 2.0).abs() / p[0][1].abs() < 1e-12);
        assert!((p[1][1] - q_rw * dt).abs() / p[1][1] < 1e-12);
        assert_eq!(p[0][2], 0.0);
        assert_eq!(p[1][2], 0.0);
        assert_eq!(p[2][2], 0.0);
    }

    #[test]
    fn coasting_phase_variance_matches_analytic_holdover() {
        // Coasting N steps from a known state (P = 0) must grow P00 to exactly
        // q_wf·T + q_rw·T^3/3 + q_drift·T^5/20 — the NIST SP 1065 holdover relation through
        // the drift (random-run, T^5) term, accumulated step-by-step. Pins the dt-power
        // bookkeeping over a multi-step coast, not just a single predict.
        let (q_wf, q_rw, q_drift) = (1e-24, 1e-30, 1e-38);
        let dt = 1.0;
        let n = 100usize;
        let t = n as f64 * dt;
        let mut kf = ClockState3::new(q_wf, q_rw, q_drift);
        for _ in 0..n {
            kf.predict(dt);
        }
        let expected = q_wf * t + q_rw * t.powi(3) / 3.0 + q_drift * t.powi(5) / 20.0;
        let rel = (kf.covariance()[0][0] - expected).abs() / expected;
        assert!(
            rel < 1e-9,
            "P00 = {} expected {expected}",
            kf.covariance()[0][0]
        );
    }

    #[test]
    fn drift_state_tracks_a_pure_aging_ramp() {
        // A clock with a constant frequency drift (aging) produces a quadratic phase ramp.
        // Feeding precise phase measurements of that ramp, the third state must converge to
        // the true drift rate — the capability the two-state model lacks.
        let true_drift = 5.0e-13; // 1/s^2 (fractional-frequency aging per second)
        let dt = 1.0;
        let (q_wf, q_rw, q_drift) = q_from_allan(1e-13, 1e-15, 1e-16);
        let mut kf = ClockState3::new(q_wf, q_rw, q_drift).with_initial_cov(1e-18, 1e-20, 1e-24);
        let r = 1e-24; // (10 ps)^2 phase measurement
        for i in 0..400 {
            kf.predict(dt);
            let t = (i + 1) as f64 * dt;
            let truth_phase = 0.5 * true_drift * t * t; // ∫∫ drift dt = ½·drift·t²
            kf.update_phase(truth_phase, r);
        }
        let rel = (kf.drift_est() - true_drift).abs() / true_drift;
        assert!(
            rel < 0.05,
            "recovered drift {} vs true {true_drift} (rel {rel})",
            kf.drift_est()
        );
    }

    #[test]
    fn clock_state_matches_uso_allan() {
        // Inject a USO-class Allan profile (white FM at σ_y(1 s) plus a random-walk-FM term),
        // synthesise the phase series the way ClockModel does, and check two things:
        //   (a) the simulated clock's recovered overlapping ADEV at τ = 1 s matches the
        //       injected white-FM σ_y(1 s) within the ~20-25% calibration gate used elsewhere;
        //   (b) the three-state estimator, run on noisy phase measurements of that clock,
        //       keeps the truth inside its 3-sigma phase covariance (a NEES-style consistency
        //       sanity), i.e. its online uncertainty is honest, not optimistic.
        let adev_1s = 1.0e-12; // USO white-FM σ_y(1 s)
        let rw_level = 1.0e-14; // random-walk-FM level (well below white FM at τ = 1 s)
        let (q_wf, q_rw, _q_d) = q_from_allan(adev_1s, rw_level, 0.0);
        let dt = 1.0;
        let n = 1 << 14;

        // (a) Synthesise the truth clock phase (same construction as ClockModel::step):
        //     freq does a random walk (q_rw·dt variance), phase gets the integrated freq
        //     plus a white-FM increment (q_wf·dt variance).
        let mut rng = ChaCha8Rng::seed_from_u64(20260614);
        let rw = Normal::new(0.0, (q_rw * dt).sqrt()).unwrap();
        let wf = Normal::new(0.0, (q_wf * dt).sqrt()).unwrap();
        let mut freq = 0.0f64;
        let mut phase = 0.0f64;
        let mut truth = Vec::with_capacity(n);
        truth.push(0.0);
        for _ in 1..n {
            freq += rw.sample(&mut rng);
            phase += freq * dt + wf.sample(&mut rng);
            truth.push(phase);
        }

        // (a) The recovered short-tau ADEV must match the injected white-FM σ_y(1 s).
        let recovered_1s = overlapping_adev(&truth, dt, 1);
        let rel = (recovered_1s - adev_1s).abs() / adev_1s;
        assert!(
            rel < 0.25,
            "recovered ADEV(1 s) = {recovered_1s} vs injected {adev_1s} (rel {rel})"
        );

        // (b) Run the estimator on noisy phase measurements of the truth and accumulate the
        //     normalised phase-error consistency. The estimator is given the SAME PSDs that
        //     generated the truth, so it is correctly tuned and must be consistent.
        let r = (5.0e-13_f64).powi(2); // 0.5 ps phase measurement noise variance
        let meas = Normal::new(0.0, r.sqrt()).unwrap();
        let mut kf = ClockState3::new(q_wf, q_rw, 0.0).with_initial_cov(1e-20, 1e-24, 1e-30);
        let mut inside = 0usize;
        let mut total = 0usize;
        for &tp in truth.iter().skip(1) {
            kf.predict(dt);
            kf.update_phase(tp + meas.sample(&mut rng), r);
            let err = (kf.phase_est() - tp).abs();
            let sigma = kf.phase_sigma();
            if err <= 3.0 * sigma {
                inside += 1;
            }
            total += 1;
            assert!(kf.is_psd(), "covariance lost PSD-ness mid-run");
        }
        // A consistent filter keeps the truth inside 3-sigma the overwhelming majority of the
        // time (the Gaussian expectation is ~99.7%); allow margin for the finite run.
        let frac = inside as f64 / total as f64;
        assert!(
            frac > 0.95,
            "estimator inconsistent: only {:.1}% of steps inside 3-sigma",
            100.0 * frac
        );
    }

    #[test]
    fn covariance_stays_psd() {
        // Through a long predict/update sequence at a harsh Q/R ratio the Joseph form must
        // keep P symmetric and positive-semidefinite — the three-state analogue of the
        // KalmanClock Joseph-stability test.
        let (q_wf, q_rw, q_drift) = (1e-30, 1e-34, 1e-40);
        let r = 1e-26;
        let mut kf = ClockState3::new(q_wf, q_rw, q_drift).with_initial_cov(1e-18, 1e-24, 1e-30);
        for i in 0..500 {
            kf.predict(1.0);
            kf.update_phase(1e-13 * (i as f64).sin(), r);
            assert!(
                kf.is_psd(),
                "covariance lost PSD-ness at step {i}: P = {:?}",
                kf.covariance()
            );
            let p = kf.covariance();
            // Symmetry and non-negative diagonal.
            for a in 0..3 {
                assert!(
                    p[a][a] >= 0.0,
                    "negative variance P[{a}][{a}] = {}",
                    p[a][a]
                );
                for b in (a + 1)..3 {
                    let scale = p[a][a].abs().max(p[b][b].abs()).max(1e-300);
                    assert!(
                        (p[a][b] - p[b][a]).abs() <= 1e-9 * scale,
                        "P not symmetric at ({a},{b})"
                    );
                }
            }
        }
    }

    #[test]
    fn measurement_pulls_estimate_and_shrinks_phase_variance() {
        // After a coast, a precise phase measurement (small r) corrects the estimate towards
        // the observation and reduces the phase-error variance.
        let mut kf = ClockState3::new(1e-24, 1e-30, 1e-36).with_initial_cov(1e-18, 1e-22, 1e-28);
        for _ in 0..50 {
            kf.predict(1.0);
        }
        let var_before = kf.covariance()[0][0];
        kf.update_phase(3e-12, 1e-26);
        assert!(
            kf.covariance()[0][0] < var_before,
            "phase variance did not shrink"
        );
        assert!(
            (kf.phase_est() - 3e-12).abs() < 3e-13,
            "phase_est = {}",
            kf.phase_est()
        );
    }

    #[test]
    fn predict_update_sequence_is_deterministic() {
        let run = || {
            let mut kf = ClockState3::new(1e-24, 1e-30, 1e-36);
            for i in 0..100 {
                kf.predict(1.0);
                if i % 5 == 0 {
                    kf.update_phase(1e-13 * i as f64, 1e-22);
                }
            }
            (kf.phase_est(), kf.freq_est(), kf.drift_est())
        };
        assert_eq!(run(), run());
    }

    #[test]
    fn clock_classes_carry_their_cited_figures() {
        // The class ADEV(1 s) figures and the Doppler-floor mapping Δv = c·σ_y.
        assert_eq!(ClockClass::Csac.adev_1s(), 3.0e-10);
        assert_eq!(ClockClass::Uso.adev_1s(), 1.0e-12);
        assert_eq!(ClockClass::Dsac.adev_1s(), 1.0e-13);
        // Stability ordering: CSAC worst, DSAC best.
        assert!(ClockClass::Csac.adev_1s() > ClockClass::Uso.adev_1s());
        assert!(ClockClass::Uso.adev_1s() > ClockClass::Dsac.adev_1s());
        // Doppler floor: a USO sits at ~0.3 mm/s, a DSAC at ~0.03 mm/s.
        let uso = ClockClass::Uso.doppler_floor_1s();
        assert!((2e-4..4e-4).contains(&uso), "USO Doppler floor {uso} m/s");
        let dsac = ClockClass::Dsac.doppler_floor_1s();
        assert!(
            (2e-5..4e-5).contains(&dsac),
            "DSAC Doppler floor {dsac} m/s"
        );
        // q_from_allan squares/scales correctly: q_wf = a^2, q_rw = 3·b^2, q_drift = 20·c^2.
        let (q_wf, q_rw, q_drift) = q_from_allan(2.0e-12, 1.0e-14, 1.0e-16);
        assert!((q_wf - 4.0e-24).abs() / q_wf < 1e-12); // (2e-12)^2
        assert!((q_rw - 3.0e-28).abs() / q_rw < 1e-12); // 3·(1e-14)^2
        assert!((q_drift - 2.0e-31).abs() / q_drift < 1e-12); // 20·(1e-16)^2
    }
}
