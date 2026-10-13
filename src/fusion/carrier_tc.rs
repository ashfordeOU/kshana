// SPDX-License-Identifier: AGPL-3.0-only
//! Carrier-phase tightly-coupled GNSS/INS: an error-state EKF with an explicit
//! receiver-clock state and one float carrier ambiguity per tracked satellite,
//! driven by SGP4 Walker geometry with broadcast ionosphere and troposphere.
//!
//! # State
//!
//! ```text
//! x = [ δp(3) δv(3) ψ(3) b_a(3) b_g(3) | c·δt  c·δṫ | A_1 … A_m ]
//!        15 INS error states             clock (m, m/s)  float ambiguities (m)
//! ```
//!
//! The first fifteen are the INS error states of [`super::gnss_ins_ekf`] with the same
//! convention as [`super::closed_loop`]: `δp`, `δv` are INS minus truth (NED, m and m/s),
//! `ψ` the nav-frame attitude error, `b_a`, `b_g` the residual biases (true minus the
//! running estimate). After every measurement update they are fed back into the strapdown
//! [`NavState`] and the bias estimates and their mean is reset to zero. The clock and
//! ambiguity states are *total* states: their mean is carried by the filter and never
//! reset. The ambiguity `A_i = λ·N_i` is in metres, one per tracked satellite; a state is
//! appended when a satellite rises (or is re-acquired, or slips) and deleted when it sets.
//! Covariances are dense, dynamically sized ([`DMat`]); the measurement update is in
//! Joseph form.
//!
//! # Clock model
//!
//! The receiver clock is the standard two-state random walk: `ḃ = d + w_b`, `ḋ = w_d`
//! with white-noise PSDs `q_b` (m²/s) and `q_d` (m²/s³); the discrete process noise is the
//! exact one, `Q = [[q_b·Δt + q_d·Δt³/3, q_d·Δt²/2], [q_d·Δt²/2, q_d·Δt]]`. The
//! oscillator-coefficient form is available through [`ClockTcCfg::from_allan`]
//! (`q_b = c²·h₀/2`, `q_d = 2π²·c²·h₋₂`). The simulated truth clock is driven by the same
//! discrete model, so the filter's clock model is exact for the synthetic data.
//!
//! # Measurement model
//!
//! For satellite `i` at receive time `t` (GPS-like L1, `λ = c/1575.42 MHz`):
//!
//! ```text
//! P_i = ρ_i + c·δt + I_i + T_i + ε_P
//! Φ_i = ρ_i + c·δt − I_i + T_i + λ·N_i + ε_Φ        (carrier phase in metres)
//! Ṗ_i = ρ̇_i + c·δṫ + ε_D                            (optional range rate / Doppler)
//! ```
//!
//! `I_i` is the Klobuchar L1 group delay ([`klobuchar_delay_m`], a code delay and an equal
//! phase advance) and `T_i` the Saastamoinen zenith delays mapped with the Niell functions
//! ([`tropo_delay_m`]). The filter applies the broadcast corrections — `P − Î − T̂`,
//! `Φ + Î − T̂` — evaluated at its own position estimate; either can be switched off
//! ([`IonoTcCfg::correct`], [`TropoTcCfg::correct`]) so the uncorrected error is visible.
//! The truth delay is the same model times a `truth_scale` (default 1, i.e. the broadcast
//! model is the truth and the corrected residual is only the position-estimate effect).
//!
//! **Geometry.** Satellites come from the SGP4 Walker constellation of
//! [`crate::walker::WalkerSgp4`] (TEME), rotated to ECEF by Greenwich mean sidereal time
//! ([`teme_to_ecef`]) exactly as [`crate::gnss_sim`] does. The geometric range is
//! light-time corrected and Sagnac corrected: the transmit time is found by iterating
//! `τ = |r_s(t − τ) − r_u|/c` twice (sub-millimetre), the satellite's ECEF position at
//! `t − τ` is rotated about the z axis by `ω_E·τ` into the ECEF frame of the receive
//! instant, and `ρ` is the distance in that frame. Satellite clocks are perfect. The truth
//! measurements use the true receiver position; the filter uses its INS position, so the
//! treatment is identical on both sides. The user ECEF position is
//! [`geodetic_to_ecef`] of the [`NavState`] geodetic position; the unit line-of-sight
//! vector is rotated into NED for the `δp` (and, for Doppler, `δv`) rows.
//!
//! Linearised about the INS solution (innovation = measured − predicted):
//! `ν_P ≈ −uᵀδp + δb`, `ν_Φ ≈ −uᵀδp + δb + δA_i`, `ν_D ≈ −uᵀδv + δd`, where `u` is the
//! NED unit vector from satellite to user and `δb`, `δd`, `δA` are true minus estimate.
//!
//! # Cycle slips
//!
//! A simulator slip schedule ([`SlipCfg`]) adds whole or fractional cycles to a satellite's
//! carrier from a given time on. The detector is a time-differenced carrier (TDCP)
//! innovation test: for each satellite tracked at the previous GNSS epoch,
//! `w_i = ΔΦ̃_i − Δρ̂_i − Δĉδt`, the change in corrected phase minus the predicted change in
//! range (prior INS position now, posterior INS position then) and in clock bias. A
//! common-mode term (clock-drift error) is removed by subtracting the median of `w` across
//! satellites when three or more are tracked in common; with fewer the raw `w` is tested
//! against a threshold widened by the predicted clock-change uncertainty (5σ). A satellite
//! is flagged when `|w_i − median(w)| > slip_threshold_cycles · λ` (default 0.5 cycle,
//! 9.5 cm), widened per satellite to 5σ of the change the velocity uncertainty predicts over
//! the interval, `Δt·sqrt(uᵀ P_vv u)`, so a converging filter does not read its own velocity
//! error as slips (a slip below the widened threshold is then not detected). On a flag (or a re-acquisition after any gap) that satellite's ambiguity is
//! re-initialised from code-minus-carrier with the large variance `sigma_amb_init_m²`
//! and its cross-covariances zeroed. The smallest slip detected with certainty is
//! therefore `threshold + max|non-slip statistic|`; [`CarrierTcSummary::max_tdcp_stat_m`]
//! reports the non-slip statistic so the margin can be read off a run. A slip smaller than
//! the threshold is NOT detected and biases that ambiguity until it is re-acquired.
//!
//! # Evidence
//!
//! Every test of this module is MODELLED / InternalConsistency: the measurements are
//! synthesised by the same models the filter uses, so the tests show the estimator is
//! implemented consistently (convergence, χ² consistency, slip handling), not that it
//! matches a real receiver.

use crate::frames::{geodetic_to_ecef, look_angles, teme_to_ecef, Geodetic, Vec3};
use crate::fusion::pack::{ImuCfg, DEFAULT_SIGMA_ACCEL_BIAS, DEFAULT_SIGMA_GYRO_BIAS};
use crate::fusion::truth::TruthEpoch;
use crate::gnss_sim::{klobuchar_delay_m, tropo_delay_m, KlobucharCoeffs, Meteo, C_M_PER_S, L1_HZ};
use crate::inertial::attitude::Quaternion;
use crate::inertial::imu_errors::ImuErrorModel;
use crate::inertial::mechanization::{radii_of_curvature, NavState};
use crate::orbit::Propagator;
use crate::walker::{walker_epoch_jd, WalkerSgp4};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};
use serde::{Deserialize, Serialize};

/// L1 carrier wavelength (m).
pub const LAMBDA_L1_M: f64 = C_M_PER_S / L1_HZ;
/// WGS-84 Earth rotation rate (rad/s) used for the Sagnac rotation.
pub const OMEGA_E_WGS84: f64 = 7.292_115_146_7e-5;

/// Number of INS error states.
const NI: usize = 15;
/// Index of the clock-bias state (m).
const CB: usize = 15;
/// Index of the clock-drift state (m/s).
const CD: usize = 16;
/// Number of non-ambiguity states.
const NB: usize = 17;

// ----------------------------------------------------------------------------
// Dense dynamic matrix.
// ----------------------------------------------------------------------------

/// A small dense row-major matrix whose size changes as ambiguity states are added and
/// removed. No external linear-algebra dependency.
#[derive(Clone, Debug, PartialEq)]
pub struct DMat {
    rows: usize,
    cols: usize,
    d: Vec<f64>,
}

impl DMat {
    /// A `rows × cols` zero matrix.
    pub fn zeros(rows: usize, cols: usize) -> Self {
        Self {
            rows,
            cols,
            d: vec![0.0; rows * cols],
        }
    }
    /// The `n × n` identity.
    pub fn identity(n: usize) -> Self {
        let mut m = Self::zeros(n, n);
        for i in 0..n {
            m.set(i, i, 1.0);
        }
        m
    }
    /// Row count.
    pub fn rows(&self) -> usize {
        self.rows
    }
    /// Column count.
    pub fn cols(&self) -> usize {
        self.cols
    }
    /// Element `(r, c)`.
    #[inline]
    pub fn at(&self, r: usize, c: usize) -> f64 {
        self.d[r * self.cols + c]
    }
    /// Set element `(r, c)`.
    #[inline]
    pub fn set(&mut self, r: usize, c: usize, v: f64) {
        self.d[r * self.cols + c] = v;
    }
    /// Transpose.
    pub fn transpose(&self) -> DMat {
        let mut t = DMat::zeros(self.cols, self.rows);
        for r in 0..self.rows {
            for c in 0..self.cols {
                t.set(c, r, self.at(r, c));
            }
        }
        t
    }
    /// Matrix product.
    pub fn mul(&self, o: &DMat) -> DMat {
        assert_eq!(self.cols, o.rows, "dimension mismatch in DMat::mul");
        let mut m = DMat::zeros(self.rows, o.cols);
        for r in 0..self.rows {
            for k in 0..self.cols {
                let a = self.at(r, k);
                if a == 0.0 {
                    continue;
                }
                let orow = &o.d[k * o.cols..(k + 1) * o.cols];
                let mrow = &mut m.d[r * o.cols..(r + 1) * o.cols];
                for (mv, &ov) in mrow.iter_mut().zip(orow) {
                    *mv += a * ov;
                }
            }
        }
        m
    }
    /// Matrix–vector product.
    pub fn mul_vec(&self, v: &[f64]) -> Vec<f64> {
        assert_eq!(self.cols, v.len(), "dimension mismatch in DMat::mul_vec");
        (0..self.rows)
            .map(|r| {
                self.d[r * self.cols..(r + 1) * self.cols]
                    .iter()
                    .zip(v)
                    .map(|(a, b)| a * b)
                    .sum()
            })
            .collect()
    }
    /// Element-wise sum.
    pub fn add(&self, o: &DMat) -> DMat {
        assert_eq!((self.rows, self.cols), (o.rows, o.cols));
        let mut m = self.clone();
        for (a, b) in m.d.iter_mut().zip(&o.d) {
            *a += b;
        }
        m
    }
    /// Element-wise difference.
    pub fn sub(&self, o: &DMat) -> DMat {
        assert_eq!((self.rows, self.cols), (o.rows, o.cols));
        let mut m = self.clone();
        for (a, b) in m.d.iter_mut().zip(&o.d) {
            *a -= b;
        }
        m
    }
    /// Average with the transpose (square matrices).
    pub fn symmetrize(&mut self) {
        for r in 0..self.rows {
            for c in (r + 1)..self.cols {
                let v = 0.5 * (self.at(r, c) + self.at(c, r));
                self.set(r, c, v);
                self.set(c, r, v);
            }
        }
    }
    /// Inverse by Gauss–Jordan elimination with partial pivoting; `None` if singular.
    pub fn inverse(&self) -> Option<DMat> {
        assert_eq!(self.rows, self.cols);
        let n = self.rows;
        let mut a = self.clone();
        let mut inv = DMat::identity(n);
        for col in 0..n {
            let mut piv = col;
            let mut best = a.at(col, col).abs();
            for r in (col + 1)..n {
                let v = a.at(r, col).abs();
                if v > best {
                    best = v;
                    piv = r;
                }
            }
            if best.is_nan() || best <= 1e-300 {
                return None;
            }
            if piv != col {
                for c in 0..n {
                    a.d.swap(col * n + c, piv * n + c);
                    inv.d.swap(col * n + c, piv * n + c);
                }
            }
            let dv = a.at(col, col);
            for c in 0..n {
                a.set(col, c, a.at(col, c) / dv);
                inv.set(col, c, inv.at(col, c) / dv);
            }
            for r in 0..n {
                if r == col {
                    continue;
                }
                let f = a.at(r, col);
                if f == 0.0 {
                    continue;
                }
                for c in 0..n {
                    a.set(r, c, a.at(r, c) - f * a.at(col, c));
                    inv.set(r, c, inv.at(r, c) - f * inv.at(col, c));
                }
            }
        }
        Some(inv)
    }
    /// Copy of the sub-block `rows r0..r0+nr`, `cols c0..c0+nc`.
    pub fn block(&self, r0: usize, c0: usize, nr: usize, nc: usize) -> DMat {
        let mut b = DMat::zeros(nr, nc);
        for r in 0..nr {
            for c in 0..nc {
                b.set(r, c, self.at(r0 + r, c0 + c));
            }
        }
        b
    }
    /// Write `b` into this matrix with its top-left at `(r0, c0)`.
    pub fn set_block(&mut self, r0: usize, c0: usize, b: &DMat) {
        for r in 0..b.rows {
            for c in 0..b.cols {
                self.set(r0 + r, c0 + c, b.at(r, c));
            }
        }
    }
    /// Delete row and column `k` of a square matrix.
    pub fn remove_index(&self, k: usize) -> DMat {
        let n = self.rows;
        let mut m = DMat::zeros(n - 1, n - 1);
        let mut ri = 0;
        for r in 0..n {
            if r == k {
                continue;
            }
            let mut ci = 0;
            for c in 0..n {
                if c == k {
                    continue;
                }
                m.set(ri, ci, self.at(r, c));
                ci += 1;
            }
            ri += 1;
        }
        m
    }
    /// Append one row and column (zero cross terms) with diagonal value `var`.
    pub fn grow(&self, var: f64) -> DMat {
        let n = self.rows;
        let mut m = DMat::zeros(n + 1, n + 1);
        m.set_block(0, 0, self);
        m.set(n, n, var);
        m
    }
}

// ----------------------------------------------------------------------------
// Configuration.
// ----------------------------------------------------------------------------

/// Coupling mode: code-only (pseudorange [+ Doppler]) or carrier (pseudorange + carrier
/// phase [+ Doppler] with float ambiguities).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum TcMode {
    /// Pseudorange (and optional Doppler) only.
    Code,
    /// Pseudorange + carrier phase (and optional Doppler).
    #[default]
    Carrier,
}

/// Receiver clock: true initial state, filter prior, and two-state random-walk PSDs.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(default, deny_unknown_fields)]
pub struct ClockTcCfg {
    /// Clock-bias white-noise PSD `q_b` (m²/s).
    pub q_b: f64,
    /// Clock-drift white-noise PSD `q_d` (m²/s³).
    pub q_d: f64,
    /// True initial clock bias `c·δt` (m).
    pub bias0_m: f64,
    /// True initial clock drift `c·δṫ` (m/s).
    pub drift0_mps: f64,
    /// Filter prior 1-σ on the bias (m); the prior mean is zero.
    pub sigma_bias0_m: f64,
    /// Filter prior 1-σ on the drift (m/s); the prior mean is zero.
    pub sigma_drift0_mps: f64,
}

impl ClockTcCfg {
    /// PSDs from the oscillator power-law coefficients `h₀` (white frequency) and `h₋₂`
    /// (random-walk frequency): `q_b = c²·h₀/2`, `q_d = 2π²·c²·h₋₂`.
    pub fn from_allan(h0: f64, hm2: f64) -> (f64, f64) {
        let c2 = C_M_PER_S * C_M_PER_S;
        (c2 * h0 / 2.0, 2.0 * std::f64::consts::PI.powi(2) * c2 * hm2)
    }
}

impl Default for ClockTcCfg {
    /// A temperature-compensated crystal (`h₀ = 2e-19`, `h₋₂ = 2e-20`).
    fn default() -> Self {
        let (q_b, q_d) = Self::from_allan(2e-19, 2e-20);
        Self {
            q_b,
            q_d,
            bias0_m: 50.0,
            drift0_mps: 0.2,
            sigma_bias0_m: 100.0,
            sigma_drift0_mps: 1.0,
        }
    }
}

/// Ionosphere: Klobuchar broadcast model in the truth and (optionally) as a correction.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(default, deny_unknown_fields)]
pub struct IonoTcCfg {
    /// Put the ionospheric delay into the synthetic measurements.
    pub truth: bool,
    /// Apply the broadcast Klobuchar correction in the filter.
    pub correct: bool,
    /// Truth delay = `truth_scale` × Klobuchar (1 ⇒ the broadcast model is exact).
    pub truth_scale: f64,
    /// Klobuchar α coefficients.
    pub alpha: [f64; 4],
    /// Klobuchar β coefficients.
    pub beta: [f64; 4],
    /// GPS seconds of day at the start of the run.
    pub gps_sod0: f64,
}

impl Default for IonoTcCfg {
    fn default() -> Self {
        let k = KlobucharCoeffs::default();
        Self {
            truth: true,
            correct: true,
            truth_scale: 1.0,
            alpha: k.alpha,
            beta: k.beta,
            gps_sod0: 50_400.0,
        }
    }
}

/// Troposphere: Saastamoinen + Niell mapping in the truth and (optionally) as a correction.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(default, deny_unknown_fields)]
pub struct TropoTcCfg {
    /// Put the tropospheric delay into the synthetic measurements.
    pub truth: bool,
    /// Apply the Saastamoinen + Niell correction in the filter.
    pub correct: bool,
    /// Truth delay = `truth_scale` × model.
    pub truth_scale: f64,
    /// Surface pressure (hPa).
    pub pressure_hpa: f64,
    /// Surface temperature (K).
    pub temp_k: f64,
    /// Relative humidity (fraction).
    pub humidity: f64,
    /// Day of year for the Niell seasonal term.
    pub day_of_year: f64,
}

impl Default for TropoTcCfg {
    fn default() -> Self {
        let m = Meteo::default();
        Self {
            truth: true,
            correct: true,
            truth_scale: 1.0,
            pressure_hpa: m.pressure_hpa,
            temp_k: m.temp_k,
            humidity: m.humidity,
            day_of_year: 180.0,
        }
    }
}

/// One scheduled cycle slip: from time `t` (s, run time) on, satellite `sat`'s carrier
/// carries `cycles` extra cycles (fractional values allowed for detector tests).
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct SlipCfg {
    /// Satellite index in the Walker constellation (plane-major).
    pub sat: usize,
    /// Run time of the slip (s).
    pub t: f64,
    /// Size of the slip (cycles).
    pub cycles: f64,
}

/// Configuration of a carrier-phase / code tightly-coupled run.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(default, deny_unknown_fields)]
pub struct CarrierTcCfg {
    /// `"code"` or `"carrier"`.
    pub mode: TcMode,
    /// SGP4 Walker constellation (default GPS-like 55°: 24/6/1 at 20 200 km).
    pub constellation: WalkerSgp4,
    /// Seconds after the common Walker epoch at which the run starts.
    pub t0_offset_s: f64,
    /// Elevation mask (deg).
    pub mask_deg: f64,
    /// Track at most this many satellites (highest true elevation first); `None` = all.
    pub max_sats: Option<usize>,
    /// GNSS measurement interval (s).
    pub gnss_interval_s: f64,
    /// Pseudorange 1-σ (m), zenith value when `elevation_weighting`.
    pub sigma_pr_m: f64,
    /// Carrier-phase 1-σ (m), zenith value when `elevation_weighting`.
    pub sigma_phase_m: f64,
    /// Range-rate (Doppler) 1-σ (m/s); `None` disables Doppler.
    pub sigma_rr_mps: Option<f64>,
    /// Scale every σ by `1/sin(el)` (truth and filter alike).
    pub elevation_weighting: bool,
    /// Ionosphere.
    pub iono: IonoTcCfg,
    /// Troposphere.
    pub tropo: TropoTcCfg,
    /// Receiver clock.
    pub clock: ClockTcCfg,
    /// Cycle-slip schedule (simulator side).
    pub slips: Vec<SlipCfg>,
    /// Slip-detection threshold on the TDCP statistic (cycles).
    pub slip_threshold_cycles: f64,
    /// 1-σ of a freshly (re)initialised float ambiguity (m).
    pub sigma_amb_init_m: f64,
    /// Ambiguity process-noise PSD (m²/s); 0 = constant ambiguity.
    pub q_amb: f64,
    /// INS initial position 1-σ (m); the initial error is drawn from it.
    pub init_sigma_pos_m: f64,
    /// INS initial velocity 1-σ (m/s).
    pub init_sigma_vel_mps: f64,
    /// INS initial attitude 1-σ (rad).
    pub init_sigma_att_rad: f64,
    /// Accelerometer white-noise PSD ((m/s²)²/Hz): injected into the simulated IMU and
    /// used as the filter's velocity random walk.
    pub vrw_psd: f64,
    /// Gyro white-noise PSD ((rad/s)²/Hz): injected and used as angle random walk.
    pub arw_psd: f64,
    /// Filter accelerometer-bias random-walk PSD.
    pub accel_bias_rw_psd: f64,
    /// Filter gyro-bias random-walk PSD.
    pub gyro_bias_rw_psd: f64,
    /// Multiplies every random draw of the truth (measurement, clock and IMU noise, the
    /// initial INS error). 0 gives a deterministic, noise-free truth.
    pub noise_scale: f64,
}

impl Default for CarrierTcCfg {
    fn default() -> Self {
        Self {
            mode: TcMode::Carrier,
            constellation: WalkerSgp4 {
                altitude_km: 20_200.0,
                inclination_deg: 55.0,
                planes: 6,
                sats_per_plane: 4,
                phasing_f: 1.0,
            },
            t0_offset_s: 0.0,
            mask_deg: 10.0,
            max_sats: None,
            gnss_interval_s: 1.0,
            sigma_pr_m: 1.0,
            sigma_phase_m: 0.003,
            sigma_rr_mps: None,
            elevation_weighting: false,
            iono: IonoTcCfg::default(),
            tropo: TropoTcCfg::default(),
            clock: ClockTcCfg::default(),
            slips: Vec::new(),
            slip_threshold_cycles: 0.5,
            sigma_amb_init_m: 10.0,
            q_amb: 0.0,
            init_sigma_pos_m: 5.0,
            init_sigma_vel_mps: 0.5,
            init_sigma_att_rad: 1e-3,
            vrw_psd: 1e-5,
            arw_psd: 1e-10,
            accel_bias_rw_psd: 1e-12,
            gyro_bias_rw_psd: 1e-16,
            noise_scale: 1.0,
        }
    }
}

impl CarrierTcCfg {
    /// Reject configurations the filter cannot run.
    pub fn validate(&self) -> Result<(), String> {
        let pos = |name: &str, v: f64| -> Result<(), String> {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{name} must be finite and > 0, got {v}"))
            }
        };
        let nonneg = |name: &str, v: f64| -> Result<(), String> {
            if v.is_finite() && v >= 0.0 {
                Ok(())
            } else {
                Err(format!("{name} must be finite and >= 0, got {v}"))
            }
        };
        pos("gnss_interval_s", self.gnss_interval_s)?;
        pos("sigma_pr_m", self.sigma_pr_m)?;
        pos("sigma_phase_m", self.sigma_phase_m)?;
        if let Some(s) = self.sigma_rr_mps {
            pos("sigma_rr_mps", s)?;
        }
        pos("slip_threshold_cycles", self.slip_threshold_cycles)?;
        pos("sigma_amb_init_m", self.sigma_amb_init_m)?;
        pos("init_sigma_pos_m", self.init_sigma_pos_m)?;
        pos("init_sigma_vel_mps", self.init_sigma_vel_mps)?;
        pos("init_sigma_att_rad", self.init_sigma_att_rad)?;
        pos("clock.sigma_bias0_m", self.clock.sigma_bias0_m)?;
        pos("clock.sigma_drift0_mps", self.clock.sigma_drift0_mps)?;
        for (n, v) in [
            ("q_amb", self.q_amb),
            ("vrw_psd", self.vrw_psd),
            ("arw_psd", self.arw_psd),
            ("accel_bias_rw_psd", self.accel_bias_rw_psd),
            ("gyro_bias_rw_psd", self.gyro_bias_rw_psd),
            ("noise_scale", self.noise_scale),
            ("clock.q_b", self.clock.q_b),
            ("clock.q_d", self.clock.q_d),
        ] {
            nonneg(n, v)?;
        }
        if !(self.mask_deg.is_finite() && (-90.0..90.0).contains(&self.mask_deg)) {
            return Err(format!(
                "mask_deg must be in [-90, 90), got {}",
                self.mask_deg
            ));
        }
        if self.constellation.total() == 0 {
            return Err("constellation has no satellites".into());
        }
        if self.max_sats == Some(0) {
            return Err("max_sats must be >= 1 when set".into());
        }
        for s in &self.slips {
            if s.sat >= self.constellation.total() {
                return Err(format!("slip satellite {} out of range", s.sat));
            }
        }
        Ok(())
    }
}

// ----------------------------------------------------------------------------
// Geometry.
// ----------------------------------------------------------------------------

/// The SGP4 Walker constellation positioned on the run's time axis.
pub struct Constellation {
    sats: Vec<Propagator>,
    t0_offset_s: f64,
}

impl Constellation {
    /// Build from a Walker design; `t0_offset_s` is the run start after the Walker epoch.
    pub fn new(w: &WalkerSgp4, t0_offset_s: f64) -> Self {
        Self {
            sats: w.satellites(),
            t0_offset_s,
        }
    }
    /// Number of satellites.
    pub fn len(&self) -> usize {
        self.sats.len()
    }
    /// True when the constellation is empty.
    pub fn is_empty(&self) -> bool {
        self.sats.is_empty()
    }
    /// ECEF position (m) of satellite `i` at run time `t` (s): SGP4 TEME rotated by GMST,
    /// identical to [`crate::gnss_sim`]'s geometry.
    pub fn sat_ecef(&self, i: usize, t: f64) -> Vec3 {
        let ts = self.t0_offset_s + t;
        teme_to_ecef(
            self.sats[i].position_eci(ts),
            walker_epoch_jd() + ts / 86_400.0,
        )
    }
    /// ECEF velocity (m/s, rotating frame) by a ±0.5 s central difference.
    pub fn sat_ecef_vel(&self, i: usize, t: f64) -> Vec3 {
        let a = self.sat_ecef(i, t - 0.5);
        let b = self.sat_ecef(i, t + 0.5);
        [b[0] - a[0], b[1] - a[1], b[2] - a[2]]
    }
    /// Light-time- and Sagnac-corrected satellite position for a receiver at `r_u` (ECEF)
    /// receiving at run time `t`, expressed in the ECEF frame of the receive instant, and
    /// the geometric range. Two light-time iterations.
    pub fn sat_at_reception(&self, i: usize, t: f64, r_u: Vec3) -> (Vec3, f64) {
        let mut tau = norm(sub3(self.sat_ecef(i, t), r_u)) / C_M_PER_S;
        let mut rs = [0.0; 3];
        for _ in 0..2 {
            let r_tx = self.sat_ecef(i, t - tau);
            let th = OMEGA_E_WGS84 * tau;
            let (s, c) = th.sin_cos();
            rs = [
                c * r_tx[0] + s * r_tx[1],
                -s * r_tx[0] + c * r_tx[1],
                r_tx[2],
            ];
            tau = norm(sub3(rs, r_u)) / C_M_PER_S;
        }
        let rho = norm(sub3(rs, r_u));
        (rs, rho)
    }
}

fn sub3(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot3(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn norm(a: Vec3) -> f64 {
    dot3(a, a).sqrt()
}

/// ECEF → NED rotation of a vector at geodetic latitude/longitude.
fn ecef_to_ned(v: Vec3, lat: f64, lon: f64) -> Vec3 {
    let (sl, cl) = lat.sin_cos();
    let (so, co) = lon.sin_cos();
    [
        -sl * co * v[0] - sl * so * v[1] + cl * v[2],
        -so * v[0] + co * v[1],
        -cl * co * v[0] - cl * so * v[1] - sl * v[2],
    ]
}

/// NED → ECEF rotation of a vector.
fn ned_to_ecef(v: Vec3, lat: f64, lon: f64) -> Vec3 {
    let (sl, cl) = lat.sin_cos();
    let (so, co) = lon.sin_cos();
    [
        -sl * co * v[0] - so * v[1] - cl * co * v[2],
        -sl * so * v[0] + co * v[1] - cl * so * v[2],
        cl * v[0] - sl * v[2],
    ]
}

/// INS-minus-truth position difference in NED (m), consistent with the feedback mapping.
fn pos_err_ned(ins: Geodetic, truth: Geodetic) -> Vec3 {
    let (rn, re) = radii_of_curvature(truth.lat_rad);
    let h = truth.alt_m;
    [
        (ins.lat_rad - truth.lat_rad) * (rn + h),
        (ins.lon_rad - truth.lon_rad) * (re + h) * truth.lat_rad.cos(),
        -(ins.alt_m - truth.alt_m),
    ]
}

fn sigma_el(sigma: f64, el: f64, weighting: bool) -> f64 {
    if weighting {
        sigma / el.sin().max(0.05)
    } else {
        sigma
    }
}

fn iono_m(cfg: &IonoTcCfg, p: Geodetic, el: f64, az: f64, t: f64) -> f64 {
    let k = KlobucharCoeffs {
        alpha: cfg.alpha,
        beta: cfg.beta,
    };
    klobuchar_delay_m(&k, p.lat_rad, p.lon_rad, el, az, cfg.gps_sod0 + t)
}

fn tropo_m(cfg: &TropoTcCfg, p: Geodetic, el: f64) -> f64 {
    let m = Meteo {
        pressure_hpa: cfg.pressure_hpa,
        temp_k: cfg.temp_k,
        humidity: cfg.humidity,
    };
    tropo_delay_m(&m, p.lat_rad, p.alt_m, el, cfg.day_of_year)
}

/// Exact discrete two-state clock process noise over `dt`.
fn clock_q(q_b: f64, q_d: f64, dt: f64) -> [[f64; 2]; 2] {
    [
        [q_b * dt + q_d * dt.powi(3) / 3.0, q_d * dt * dt / 2.0],
        [q_d * dt * dt / 2.0, q_d * dt],
    ]
}

// ----------------------------------------------------------------------------
// Simulator.
// ----------------------------------------------------------------------------

/// One satellite's synthetic observables at one GNSS epoch.
#[derive(Clone, Debug)]
struct SimObs {
    sat: usize,
    pr_m: f64,
    phase_m: f64,
    rr_mps: f64,
}

/// One GNSS epoch of synthetic observables.
#[derive(Clone, Debug)]
struct SimEpoch {
    obs: Vec<SimObs>,
}

/// Synthetic truth: clock per truth epoch and observables at the GNSS epochs.
struct SimData {
    clk: Vec<[f64; 2]>,
    gnss: Vec<Option<SimEpoch>>,
}

fn simulate(cfg: &CarrierTcCfg, con: &Constellation, truth: &[TruthEpoch], seed: u64) -> SimData {
    let ns = cfg.noise_scale;
    let mut meas_rng = ChaCha8Rng::seed_from_u64(seed ^ 0x6d65_6173_0000_0001);
    let mut clk_rng = ChaCha8Rng::seed_from_u64(seed ^ 0x636c_6b00_0000_0002);
    let mut amb_rng = ChaCha8Rng::seed_from_u64(seed ^ 0x616d_6200_0000_0003);
    let g = |r: &mut ChaCha8Rng| -> f64 { StandardNormal.sample(r) };

    // Truth clock on the truth grid.
    let mut clk = Vec::with_capacity(truth.len());
    let mut b = cfg.clock.bias0_m;
    let mut d = cfg.clock.drift0_mps;
    for (k, e) in truth.iter().enumerate() {
        if k > 0 {
            let dt = e.t - truth[k - 1].t;
            let q = clock_q(cfg.clock.q_b, cfg.clock.q_d, dt);
            // Cholesky of the 2×2 Q.
            let l11 = q[0][0].max(0.0).sqrt();
            let l21 = if l11 > 0.0 { q[1][0] / l11 } else { 0.0 };
            let l22 = (q[1][1] - l21 * l21).max(0.0).sqrt();
            let (n1, n2) = (g(&mut clk_rng), g(&mut clk_rng));
            b += d * dt + ns * l11 * n1;
            d += ns * (l21 * n1 + l22 * n2);
        }
        clk.push([b, d]);
    }

    // Per-satellite running integer ambiguity (cycles, incl. slips), and whether the
    // satellite was tracked at the previous GNSS epoch.
    let nsat = con.len();
    let mut amb_cycles: Vec<Option<f64>> = vec![None; nsat];
    let mut gnss = Vec::with_capacity(truth.len());
    let mut last_fix = f64::NEG_INFINITY;
    let mut t_prev_gnss = f64::NEG_INFINITY;
    let dt_nom = if truth.len() > 1 {
        truth[1].t - truth[0].t
    } else {
        0.0
    };
    for (k, e) in truth.iter().enumerate() {
        let t = e.t;
        if t - last_fix < cfg.gnss_interval_s - 0.5 * dt_nom {
            gnss.push(None);
            continue;
        }
        last_fix = t;
        let p = e.nav.p_llh;
        let r_u = geodetic_to_ecef(p);
        let v_u = ned_to_ecef(e.nav.v_ned, p.lat_rad, p.lon_rad);
        // Visibility from the true position.
        let mut vis: Vec<(usize, f64, f64)> = (0..nsat)
            .filter_map(|i| {
                let la = look_angles(p, con.sat_ecef(i, t));
                (la.el_rad >= cfg.mask_deg.to_radians()).then_some((i, la.el_rad, la.az_rad))
            })
            .collect();
        if let Some(m) = cfg.max_sats {
            vis.sort_by(|a, b| b.1.total_cmp(&a.1));
            vis.truncate(m);
            vis.sort_by_key(|v| v.0);
        }
        let tracked: Vec<usize> = vis.iter().map(|v| v.0).collect();
        for (i, a) in amb_cycles.iter_mut().enumerate() {
            if !tracked.contains(&i) {
                *a = None;
            }
        }
        let mut obs = Vec::with_capacity(vis.len());
        for &(i, el, az) in &vis {
            let (rs, rho) = con.sat_at_reception(i, t, r_u);
            let iono = if cfg.iono.truth {
                cfg.iono.truth_scale * iono_m(&cfg.iono, p, el, az, t)
            } else {
                0.0
            };
            let trop = if cfg.tropo.truth {
                cfg.tropo.truth_scale * tropo_m(&cfg.tropo, p, el)
            } else {
                0.0
            };
            let n_cyc = amb_cycles[i].get_or_insert_with(|| {
                // A fresh acquisition: an arbitrary integer ambiguity.
                let u: f64 = g(&mut amb_rng);
                (u * 1.0e4).round()
            });
            for s in &cfg.slips {
                if s.sat == i && s.t > t_prev_gnss && s.t <= t {
                    *n_cyc += s.cycles;
                }
            }
            let n_cyc = *n_cyc;
            let s_pr = sigma_el(cfg.sigma_pr_m, el, cfg.elevation_weighting);
            let s_ph = sigma_el(cfg.sigma_phase_m, el, cfg.elevation_weighting);
            let s_rr = cfg
                .sigma_rr_mps
                .map_or(0.0, |s| sigma_el(s, el, cfg.elevation_weighting));
            let clk_k = clk[k];
            let pr_m = rho + clk_k[0] + iono + trop + ns * s_pr * g(&mut meas_rng);
            let phase_m =
                rho + clk_k[0] - iono + trop + LAMBDA_L1_M * n_cyc + ns * s_ph * g(&mut meas_rng);
            let u = sub3(r_u, rs);
            let u = [u[0] / rho, u[1] / rho, u[2] / rho];
            let rr_mps = dot3(u, sub3(v_u, con.sat_ecef_vel(i, t)))
                + clk_k[1]
                + ns * s_rr * g(&mut meas_rng);
            obs.push(SimObs {
                sat: i,
                pr_m,
                phase_m,
                rr_mps,
            });
        }
        t_prev_gnss = t;
        gnss.push(Some(SimEpoch { obs }));
    }
    SimData { clk, gnss }
}

// ----------------------------------------------------------------------------
// Filter.
// ----------------------------------------------------------------------------

fn skew(v: Vec3) -> [[f64; 3]; 3] {
    [[0.0, -v[2], v[1]], [v[2], 0.0, -v[0]], [-v[1], v[0], 0.0]]
}

/// Per-satellite record kept for the TDCP slip test.
#[derive(Clone, Copy, Debug)]
struct PhaseRecord {
    t: f64,
    phase_corr_m: f64,
    rho_post_m: f64,
    bias_post_m: f64,
}

/// The carrier/code tightly-coupled navigator.
struct Navigator {
    nav: NavState,
    b_a: Vec3,
    b_g: Vec3,
    /// State mean: 15 INS errors (zero between updates), clock, ambiguities.
    x: Vec<f64>,
    p: DMat,
    /// Satellite index of each ambiguity state (state `NB + j`).
    amb_sats: Vec<usize>,
    records: Vec<Option<PhaseRecord>>,
    last_gnss_t: f64,
}

/// One filter-side satellite geometry.
struct FiltGeom {
    rs: Vec3,
    rho: f64,
    u_ned: Vec3,
    u_ecef: Vec3,
    el: f64,
    az: f64,
}

impl Navigator {
    fn amb_index(&self, sat: usize) -> Option<usize> {
        self.amb_sats.iter().position(|&s| s == sat).map(|j| NB + j)
    }

    fn remove_amb(&mut self, sat: usize) {
        if let Some(k) = self.amb_index(sat) {
            self.p = self.p.remove_index(k);
            self.x.remove(k);
            self.amb_sats.remove(k - NB);
        }
    }

    /// (Re)initialise `sat`'s ambiguity to `value` with variance `var`, zeroing its
    /// cross-covariances; appends a state if the satellite has none.
    fn reset_amb(&mut self, sat: usize, value: f64, var: f64) {
        match self.amb_index(sat) {
            Some(k) => {
                let n = self.x.len();
                for j in 0..n {
                    self.p.set(k, j, 0.0);
                    self.p.set(j, k, 0.0);
                }
                self.p.set(k, k, var);
                self.x[k] = value;
            }
            None => {
                self.p = self.p.grow(var);
                self.x.push(value);
                self.amb_sats.push(sat);
            }
        }
    }

    fn propagate(&mut self, cfg: &CarrierTcCfg, gyro_raw: Vec3, accel_raw: Vec3, dt: f64) {
        let gyro = sub3(gyro_raw, self.b_g);
        let accel = sub3(accel_raw, self.b_a);
        let c_bn = self.nav.q.to_dcm();
        let f_n = self.nav.q.rotate(accel);
        let w_ie = self.nav.omega_ie_n();
        let w_en = self.nav.omega_en_n();
        let w_in = [w_ie[0] + w_en[0], w_ie[1] + w_en[1], w_ie[2] + w_en[2]];

        // Φ for the 17 non-ambiguity states: I + F·dt for the INS block (the
        // gnss_ins_ekf error model) and the exact clock transition.
        let mut a = DMat::identity(NB);
        let add = |a: &mut DMat, r0: usize, c0: usize, m: [[f64; 3]; 3], s: f64| {
            for (i, row) in m.iter().enumerate() {
                for (j, &v) in row.iter().enumerate() {
                    let cur = a.at(r0 + i, c0 + j);
                    a.set(r0 + i, c0 + j, cur + s * v * dt);
                }
            }
        };
        let eye = [[1.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 1.0]];
        add(&mut a, 0, 3, eye, 1.0);
        add(&mut a, 3, 6, skew(f_n), -1.0);
        add(
            &mut a,
            3,
            3,
            skew([2.0 * w_ie[0], 2.0 * w_ie[1], 2.0 * w_ie[2]]),
            -1.0,
        );
        add(&mut a, 3, 9, c_bn, 1.0);
        add(&mut a, 6, 6, skew(w_in), -1.0);
        add(&mut a, 6, 12, c_bn, 1.0);
        a.set(CB, CD, dt);

        let n = self.x.len();
        let m = n - NB;
        // Mean.
        let xa = a.mul_vec(&self.x[..NB]);
        self.x[..NB].copy_from_slice(&xa);
        // Covariance, exploiting Φ = diag(A, I).
        let paa = self.p.block(0, 0, NB, NB);
        let mut paa = a.mul(&paa).mul(&a.transpose());
        for k in 0..3 {
            let v = paa.at(3 + k, 3 + k) + cfg.vrw_psd * dt;
            paa.set(3 + k, 3 + k, v);
            let v = paa.at(6 + k, 6 + k) + cfg.arw_psd * dt;
            paa.set(6 + k, 6 + k, v);
            let v = paa.at(9 + k, 9 + k) + cfg.accel_bias_rw_psd * dt;
            paa.set(9 + k, 9 + k, v);
            let v = paa.at(12 + k, 12 + k) + cfg.gyro_bias_rw_psd * dt;
            paa.set(12 + k, 12 + k, v);
        }
        let qc = clock_q(cfg.clock.q_b, cfg.clock.q_d, dt);
        for i in 0..2 {
            for j in 0..2 {
                let v = paa.at(CB + i, CB + j) + qc[i][j];
                paa.set(CB + i, CB + j, v);
            }
        }
        self.p.set_block(0, 0, &paa);
        if m > 0 {
            let pab = a.mul(&self.p.block(0, NB, NB, m));
            self.p.set_block(0, NB, &pab);
            self.p.set_block(NB, 0, &pab.transpose());
            if cfg.q_amb > 0.0 {
                for j in NB..n {
                    let v = self.p.at(j, j) + cfg.q_amb * dt;
                    self.p.set(j, j, v);
                }
            }
        }
        self.p.symmetrize();
        self.nav.step(gyro, accel, dt);
    }

    fn geometry(&self, con: &Constellation, sat: usize, t: f64) -> FiltGeom {
        let p = self.nav.p_llh;
        let r_u = geodetic_to_ecef(p);
        let (rs, rho) = con.sat_at_reception(sat, t, r_u);
        let d = sub3(r_u, rs);
        let u_ecef = [d[0] / rho, d[1] / rho, d[2] / rho];
        let la = look_angles(p, rs);
        FiltGeom {
            rs,
            rho,
            u_ned: ecef_to_ned(u_ecef, p.lat_rad, p.lon_rad),
            u_ecef,
            el: la.el_rad,
            az: la.az_rad,
        }
    }

    fn feedback(&mut self) {
        let dx: Vec<f64> = self.x[..NI].to_vec();
        let (rn, re) = radii_of_curvature(self.nav.p_llh.lat_rad);
        let h = self.nav.p_llh.alt_m;
        self.nav.p_llh.lat_rad -= dx[0] / (rn + h);
        self.nav.p_llh.lon_rad -= dx[1] / ((re + h) * self.nav.p_llh.lat_rad.cos());
        self.nav.p_llh.alt_m += dx[2];
        for k in 0..3 {
            self.nav.v_ned[k] -= dx[3 + k];
        }
        let dq = Quaternion::from_rotation_vector([-dx[6], -dx[7], -dx[8]]);
        self.nav.q = dq.mul(&self.nav.q).normalized();
        for k in 0..3 {
            self.b_a[k] += dx[9 + k];
            self.b_g[k] += dx[12 + k];
        }
        for v in &mut self.x[..NI] {
            *v = 0.0;
        }
    }
}

// ----------------------------------------------------------------------------
// Outputs.
// ----------------------------------------------------------------------------

/// One detected cycle slip.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct SlipDetection {
    /// Run time (s).
    pub t: f64,
    /// Satellite index.
    pub sat: usize,
    /// TDCP test statistic `|w − median(w)|` (m).
    pub stat_m: f64,
}

/// Per-epoch output of one run (every truth epoch).
#[derive(Clone, Debug, Serialize)]
pub struct CarrierTcEpoch {
    /// Run time (s).
    pub t: f64,
    /// Horizontal position error (m).
    pub horiz_err_m: f64,
    /// 3-D position error (m).
    pub err_3d_m: f64,
    /// Estimated minus true clock bias (m).
    pub clock_bias_err_m: f64,
    /// Estimated minus true clock drift (m/s).
    pub clock_drift_err_mps: f64,
    /// Filter 1-σ on the clock bias (m).
    pub sigma_clock_bias_m: f64,
    /// Filter 1-σ on the clock drift (m/s).
    pub sigma_clock_drift_mps: f64,
    /// Filter 3-D position 1-σ, `sqrt(tr P_pp)` (m).
    pub sigma_pos_3d_m: f64,
    /// Satellites used at this epoch (0 when no GNSS update).
    pub n_sats: usize,
    /// Ambiguity states carried after this epoch.
    pub n_amb: usize,
    /// Satellites whose slip was detected at this epoch.
    pub slips_detected: Vec<usize>,
    /// Normalised innovation squared of this epoch's update, if any.
    pub nis: Option<f64>,
    /// Degrees of freedom of `nis` (number of scalar measurements).
    pub nis_dof: usize,
    /// NEES over the 8 estimable states `[δp, δv, c·δt, c·δṫ]` after this epoch.
    pub nees8: Option<f64>,
}

/// Summary statistics of one run.
#[derive(Clone, Debug, Serialize)]
pub struct CarrierTcSummary {
    /// RMS horizontal error over all epochs (m).
    pub rms_horiz_m: f64,
    /// RMS 3-D error over all epochs (m).
    pub rms_3d_m: f64,
    /// RMS 3-D error over the second half of the run (steady state, m).
    pub steady_rms_3d_m: f64,
    /// RMS horizontal error over the second half (m).
    pub steady_rms_horiz_m: f64,
    /// RMS clock-bias error over the second half (m).
    pub steady_rms_clock_bias_m: f64,
    /// Number of GNSS measurement updates.
    pub n_updates: usize,
    /// Σ NIS / Σ dof over all updates (1 for a consistent filter).
    pub nis_per_dof: f64,
    /// Total scalar measurements used.
    pub total_dof: usize,
    /// Mean NEES over the second half divided by its 8 dof.
    pub steady_nees_per_dof: f64,
    /// Every detected slip.
    pub slip_detections: Vec<SlipDetection>,
    /// Largest TDCP statistic among satellites NOT flagged (m): the non-slip noise floor.
    pub max_tdcp_stat_m: f64,
}

/// One mode's run.
#[derive(Clone, Debug, Serialize)]
pub struct CarrierTcModeRun {
    /// The mode this run used.
    pub mode: TcMode,
    /// Per-epoch outputs.
    pub epochs: Vec<CarrierTcEpoch>,
    /// Summary.
    pub summary: CarrierTcSummary,
}

/// The requested run and a code-only run on identical truth and measurements.
#[derive(Clone, Debug, Serialize)]
pub struct CarrierTcRun {
    /// The configured mode.
    pub primary: CarrierTcModeRun,
    /// Code-only (pseudorange) tight coupling for comparison.
    pub code_only: CarrierTcModeRun,
}

// ----------------------------------------------------------------------------
// Runner.
// ----------------------------------------------------------------------------

/// Build the IMU's deterministic error chain (the same chain as the gnss-ins pack).
fn imu_error_model(cfg: &ImuCfg) -> ImuErrorModel {
    let mut m = ImuErrorModel::ideal()
        .with_provenance(&cfg.provenance)
        .with_bias(cfg.gyro_bias, cfg.accel_bias);
    if let Some(e) = &cfg.error_model {
        m = m
            .with_scale_gyro_ppm(e.scale_gyro_ppm)
            .with_scale_accel_ppm(e.scale_accel_ppm)
            .with_misalignment_gyro(e.misalignment_gyro)
            .with_misalignment_accel(e.misalignment_accel)
            .with_g_sensitivity(e.g_sensitivity)
            .with_quantization(e.quant_gyro, e.quant_accel)
            .with_rate_ramp(e.rate_ramp_gyro, e.rate_ramp_accel);
    }
    m
}

/// Run the configured coupling and a code-only coupling over `truth`, GNSS available
/// throughout. See [`run_carrier_tc_with`].
pub fn run_carrier_tc(
    cfg: &CarrierTcCfg,
    truth: &[TruthEpoch],
    imu: &ImuCfg,
    seed: u64,
) -> CarrierTcRun {
    run_carrier_tc_with(cfg, truth, imu, seed, &|_| true)
}

/// Run the configured coupling and a code-only coupling over `truth` with a GNSS
/// availability predicate `available(t)` (e.g. a scenario's `GnssTimeline`). Both runs see
/// the identical truth, IMU samples and synthetic observables (the random streams depend
/// only on `seed`). Panics if `cfg` fails [`CarrierTcCfg::validate`] or `truth` is empty.
pub fn run_carrier_tc_with(
    cfg: &CarrierTcCfg,
    truth: &[TruthEpoch],
    imu: &ImuCfg,
    seed: u64,
    available: &dyn Fn(f64) -> bool,
) -> CarrierTcRun {
    if let Err(e) = cfg.validate() {
        panic!("invalid CarrierTcCfg: {e}");
    }
    assert!(!truth.is_empty(), "truth must have at least one epoch");
    let con = Constellation::new(&cfg.constellation, cfg.t0_offset_s);
    let sim = simulate(cfg, &con, truth, seed);
    let primary = run_mode(cfg, cfg.mode, &con, &sim, truth, imu, seed, available);
    let code_only = if cfg.mode == TcMode::Code {
        primary.clone()
    } else {
        run_mode(cfg, TcMode::Code, &con, &sim, truth, imu, seed, available)
    };
    CarrierTcRun { primary, code_only }
}

#[allow(clippy::too_many_arguments)]
fn run_mode(
    cfg: &CarrierTcCfg,
    mode: TcMode,
    con: &Constellation,
    sim: &SimData,
    truth: &[TruthEpoch],
    imu: &ImuCfg,
    seed: u64,
    available: &dyn Fn(f64) -> bool,
) -> CarrierTcModeRun {
    let ns = cfg.noise_scale;
    let mut init_rng = ChaCha8Rng::seed_from_u64(seed ^ 0x696e_6974_0000_0004);
    let mut imu_rng = ChaCha8Rng::seed_from_u64(seed ^ 0x696d_7500_0000_0005);
    let g = |r: &mut ChaCha8Rng| -> f64 { StandardNormal.sample(r) };

    // Initial INS state: truth plus a draw from the prior.
    let t0 = truth[0].nav;
    let mut nav0 = t0;
    {
        let (rn, re) = radii_of_curvature(t0.p_llh.lat_rad);
        let h = t0.p_llh.alt_m;
        let dp = [
            ns * cfg.init_sigma_pos_m * g(&mut init_rng),
            ns * cfg.init_sigma_pos_m * g(&mut init_rng),
            ns * cfg.init_sigma_pos_m * g(&mut init_rng),
        ];
        nav0.p_llh.lat_rad += dp[0] / (rn + h);
        nav0.p_llh.lon_rad += dp[1] / ((re + h) * t0.p_llh.lat_rad.cos());
        nav0.p_llh.alt_m -= dp[2];
        for k in 0..3 {
            nav0.v_ned[k] += ns * cfg.init_sigma_vel_mps * g(&mut init_rng);
        }
        let psi = [
            ns * cfg.init_sigma_att_rad * g(&mut init_rng),
            ns * cfg.init_sigma_att_rad * g(&mut init_rng),
            ns * cfg.init_sigma_att_rad * g(&mut init_rng),
        ];
        nav0.q = Quaternion::from_rotation_vector(psi)
            .mul(&nav0.q)
            .normalized();
    }
    let (sab, sgb) = imu
        .filter_prior
        .as_ref()
        .map_or((DEFAULT_SIGMA_ACCEL_BIAS, DEFAULT_SIGMA_GYRO_BIAS), |p| {
            (p.sigma_accel_bias, p.sigma_gyro_bias)
        });
    let mut p0 = DMat::zeros(NB, NB);
    for k in 0..3 {
        p0.set(k, k, cfg.init_sigma_pos_m.powi(2));
        p0.set(3 + k, 3 + k, cfg.init_sigma_vel_mps.powi(2));
        p0.set(6 + k, 6 + k, cfg.init_sigma_att_rad.powi(2));
        p0.set(9 + k, 9 + k, sab * sab);
        p0.set(12 + k, 12 + k, sgb * sgb);
    }
    p0.set(CB, CB, cfg.clock.sigma_bias0_m.powi(2));
    p0.set(CD, CD, cfg.clock.sigma_drift0_mps.powi(2));
    let mut f = Navigator {
        nav: nav0,
        b_a: [0.0; 3],
        b_g: [0.0; 3],
        x: vec![0.0; NB],
        p: p0,
        amb_sats: Vec::new(),
        records: vec![None; con.len()],
        last_gnss_t: f64::NEG_INFINITY,
    };

    let em = imu_error_model(imu);
    let lam = LAMBDA_L1_M;
    let mut epochs = Vec::with_capacity(truth.len());
    let mut detections = Vec::new();
    let mut max_stat = 0.0_f64;
    let (mut nis_sum, mut dof_sum, mut n_updates) = (0.0, 0usize, 0usize);

    for (k, te) in truth.iter().enumerate() {
        let t = te.t;
        if k > 0 {
            let dt = t - truth[k - 1].t;
            let (gm, am) = em.distort(te.gyro, te.accel, t);
            let sa = ns * (cfg.vrw_psd / dt).sqrt();
            let sg = ns * (cfg.arw_psd / dt).sqrt();
            let am = [
                am[0] + sa * g(&mut imu_rng),
                am[1] + sa * g(&mut imu_rng),
                am[2] + sa * g(&mut imu_rng),
            ];
            let gm = [
                gm[0] + sg * g(&mut imu_rng),
                gm[1] + sg * g(&mut imu_rng),
                gm[2] + sg * g(&mut imu_rng),
            ];
            f.propagate(cfg, gm, am, dt);
        }

        let mut n_used = 0usize;
        let mut slips_here = Vec::new();
        let mut nis = None;
        let mut nis_dof = 0usize;
        if let (Some(ep), true) = (&sim.gnss[k], available(t)) {
            let sats: Vec<usize> = ep.obs.iter().map(|o| o.sat).collect();
            // Ambiguity bookkeeping: drop satellites no longer tracked.
            if mode == TcMode::Carrier {
                let stale: Vec<usize> = f
                    .amb_sats
                    .iter()
                    .copied()
                    .filter(|s| !sats.contains(s))
                    .collect();
                for s in stale {
                    f.remove_amb(s);
                }
            }
            // Filter-side geometry and corrected observables.
            let p_est = f.nav.p_llh;
            let geo: Vec<FiltGeom> = ep.obs.iter().map(|o| f.geometry(con, o.sat, t)).collect();
            let mut pr_c = Vec::with_capacity(geo.len());
            let mut ph_c = Vec::with_capacity(geo.len());
            for (o, gm) in ep.obs.iter().zip(&geo) {
                let i_hat = if cfg.iono.correct {
                    iono_m(&cfg.iono, p_est, gm.el, gm.az, t)
                } else {
                    0.0
                };
                let t_hat = if cfg.tropo.correct {
                    tropo_m(&cfg.tropo, p_est, gm.el)
                } else {
                    0.0
                };
                pr_c.push(o.pr_m - i_hat - t_hat);
                ph_c.push(o.phase_m + i_hat - t_hat);
            }

            if mode == TcMode::Carrier {
                // TDCP slip test over satellites tracked at the previous GNSS epoch.
                let b_prior = f.x[CB];
                let mut w: Vec<(usize, f64)> = Vec::new();
                for (j, o) in ep.obs.iter().enumerate() {
                    if let Some(r) = f.records[o.sat] {
                        if r.t == f.last_gnss_t && f.amb_index(o.sat).is_some() {
                            let wi = (ph_c[j] - r.phase_corr_m)
                                - (geo[j].rho - r.rho_post_m)
                                - (b_prior - r.bias_post_m);
                            w.push((j, wi));
                        }
                    }
                }
                let mut flagged = vec![false; ep.obs.len()];
                let mut fresh = vec![true; ep.obs.len()];
                for &(j, _) in &w {
                    fresh[j] = false;
                }
                if !w.is_empty() {
                    let (centre, thr) = if w.len() >= 3 {
                        let mut v: Vec<f64> = w.iter().map(|x| x.1).collect();
                        v.sort_by(f64::total_cmp);
                        let n = v.len();
                        let med = if n % 2 == 1 {
                            v[n / 2]
                        } else {
                            0.5 * (v[n / 2 - 1] + v[n / 2])
                        };
                        (med, cfg.slip_threshold_cycles * lam)
                    } else {
                        let dt = t - f.last_gnss_t;
                        let var = f.p.at(CD, CD) * dt * dt
                            + cfg.clock.q_b * dt
                            + cfg.clock.q_d * dt.powi(3) / 3.0;
                        (0.0, (cfg.slip_threshold_cycles * lam).max(5.0 * var.sqrt()))
                    };
                    let dt_g = t - f.last_gnss_t;
                    for &(j, wi) in &w {
                        let s = (wi - centre).abs();
                        // Widen the threshold by 5 sigma of the TDCP change the velocity
                        // uncertainty alone predicts over the interval, `Δt·sqrt(uᵀ P_vv u)`:
                        // while the filter converges a velocity error moves each line of
                        // sight differently and would otherwise read as a slip. Once
                        // converged the fixed threshold applies.
                        let u = geo[j].u_ned;
                        let mut var_v = 0.0;
                        for a in 0..3 {
                            for b in 0..3 {
                                var_v += u[a] * f.p.at(3 + a, 3 + b) * u[b];
                            }
                        }
                        let thr = thr.max(5.0 * dt_g * var_v.max(0.0).sqrt());
                        if s > thr {
                            flagged[j] = true;
                            slips_here.push(ep.obs[j].sat);
                            detections.push(SlipDetection {
                                t,
                                sat: ep.obs[j].sat,
                                stat_m: s,
                            });
                        } else {
                            max_stat = max_stat.max(s);
                        }
                    }
                }
                // (Re)initialise new, re-acquired and slipped ambiguities from
                // code-minus-carrier.
                let var0 = cfg.sigma_amb_init_m.powi(2);
                for (j, o) in ep.obs.iter().enumerate() {
                    if fresh[j] || flagged[j] {
                        f.reset_amb(o.sat, ph_c[j] - pr_c[j], var0);
                    }
                }
            }

            // Build the stacked measurement.
            let n = f.x.len();
            let use_rr = cfg.sigma_rr_mps.is_some();
            let per = 1 + usize::from(mode == TcMode::Carrier) + usize::from(use_rr);
            let mrows = per * ep.obs.len();
            let mut h = DMat::zeros(mrows, n);
            let mut nu = vec![0.0; mrows];
            let mut r = DMat::zeros(mrows, mrows);
            let v_u = ned_to_ecef(f.nav.v_ned, p_est.lat_rad, p_est.lon_rad);
            let mut row = 0;
            for (j, o) in ep.obs.iter().enumerate() {
                let gm = &geo[j];
                // Code.
                for c in 0..3 {
                    h.set(row, c, -gm.u_ned[c]);
                }
                h.set(row, CB, 1.0);
                nu[row] = pr_c[j] - (gm.rho + f.x[CB]);
                r.set(
                    row,
                    row,
                    sigma_el(cfg.sigma_pr_m, gm.el, cfg.elevation_weighting).powi(2),
                );
                row += 1;
                if mode == TcMode::Carrier {
                    let ka = f
                        .amb_index(o.sat)
                        .expect("every tracked satellite has an ambiguity in carrier mode");
                    for c in 0..3 {
                        h.set(row, c, -gm.u_ned[c]);
                    }
                    h.set(row, CB, 1.0);
                    h.set(row, ka, 1.0);
                    nu[row] = ph_c[j] - (gm.rho + f.x[CB] + f.x[ka]);
                    r.set(
                        row,
                        row,
                        sigma_el(cfg.sigma_phase_m, gm.el, cfg.elevation_weighting).powi(2),
                    );
                    row += 1;
                }
                if let Some(s_rr) = cfg.sigma_rr_mps {
                    for c in 0..3 {
                        h.set(row, 3 + c, -gm.u_ned[c]);
                    }
                    h.set(row, CD, 1.0);
                    let rr_hat = dot3(gm.u_ecef, sub3(v_u, con.sat_ecef_vel(o.sat, t))) + f.x[CD];
                    nu[row] = o.rr_mps - rr_hat;
                    r.set(
                        row,
                        row,
                        sigma_el(s_rr, gm.el, cfg.elevation_weighting).powi(2),
                    );
                    row += 1;
                }
            }

            // Joseph-form update.
            let ht = h.transpose();
            let pht = f.p.mul(&ht);
            let s = h.mul(&pht).add(&r);
            if let Some(si) = s.inverse() {
                let kg = pht.mul(&si);
                let dx = kg.mul_vec(&nu);
                for (xi, d) in f.x.iter_mut().zip(&dx) {
                    *xi += d;
                }
                let ikh = DMat::identity(n).sub(&kg.mul(&h));
                let mut pn = ikh
                    .mul(&f.p)
                    .mul(&ikh.transpose())
                    .add(&kg.mul(&r).mul(&kg.transpose()));
                pn.symmetrize();
                f.p = pn;
                let siv = si.mul_vec(&nu);
                let q: f64 = nu.iter().zip(&siv).map(|(a, b)| a * b).sum();
                nis = Some(q);
                nis_dof = mrows;
                nis_sum += q;
                dof_sum += mrows;
                n_updates += 1;
                n_used = ep.obs.len();
                f.feedback();
            }

            // Records for the next slip test (posterior ranges).
            if mode == TcMode::Carrier {
                let r_u = geodetic_to_ecef(f.nav.p_llh);
                for (j, o) in ep.obs.iter().enumerate() {
                    f.records[o.sat] = Some(PhaseRecord {
                        t,
                        phase_corr_m: ph_c[j],
                        rho_post_m: norm(sub3(geo[j].rs, r_u)),
                        bias_post_m: f.x[CB],
                    });
                }
            }
            f.last_gnss_t = t;
        }

        // Errors and consistency.
        let e_p = pos_err_ned(f.nav.p_llh, te.nav.p_llh);
        let e_v = sub3(f.nav.v_ned, te.nav.v_ned);
        let clk = sim.clk[k];
        let e8 = [
            e_p[0],
            e_p[1],
            e_p[2],
            e_v[0],
            e_v[1],
            e_v[2],
            clk[0] - f.x[CB],
            clk[1] - f.x[CD],
        ];
        let idx = [0, 1, 2, 3, 4, 5, CB, CD];
        let mut sub = DMat::zeros(8, 8);
        for (a, &i) in idx.iter().enumerate() {
            for (b, &j) in idx.iter().enumerate() {
                sub.set(a, b, f.p.at(i, j));
            }
        }
        let nees8 = sub.inverse().map(|si| {
            let v = si.mul_vec(&e8);
            e8.iter().zip(&v).map(|(a, b)| a * b).sum()
        });
        epochs.push(CarrierTcEpoch {
            t,
            horiz_err_m: (e_p[0] * e_p[0] + e_p[1] * e_p[1]).sqrt(),
            err_3d_m: norm(e_p),
            clock_bias_err_m: f.x[CB] - clk[0],
            clock_drift_err_mps: f.x[CD] - clk[1],
            sigma_clock_bias_m: f.p.at(CB, CB).sqrt(),
            sigma_clock_drift_mps: f.p.at(CD, CD).sqrt(),
            sigma_pos_3d_m: (f.p.at(0, 0) + f.p.at(1, 1) + f.p.at(2, 2)).sqrt(),
            n_sats: n_used,
            n_amb: f.amb_sats.len(),
            slips_detected: slips_here,
            nis,
            nis_dof,
            nees8,
        });
    }

    let rms = |sel: &dyn Fn(&CarrierTcEpoch) -> f64, from: usize| -> f64 {
        let s = &epochs[from..];
        if s.is_empty() {
            return 0.0;
        }
        (s.iter().map(|e| sel(e).powi(2)).sum::<f64>() / s.len() as f64).sqrt()
    };
    let half = epochs.len() / 2;
    let steady_nees: Vec<f64> = epochs[half..].iter().filter_map(|e| e.nees8).collect();
    let summary = CarrierTcSummary {
        rms_horiz_m: rms(&|e| e.horiz_err_m, 0),
        rms_3d_m: rms(&|e| e.err_3d_m, 0),
        steady_rms_3d_m: rms(&|e| e.err_3d_m, half),
        steady_rms_horiz_m: rms(&|e| e.horiz_err_m, half),
        steady_rms_clock_bias_m: rms(&|e| e.clock_bias_err_m, half),
        n_updates,
        nis_per_dof: if dof_sum > 0 {
            nis_sum / dof_sum as f64
        } else {
            0.0
        },
        total_dof: dof_sum,
        steady_nees_per_dof: if steady_nees.is_empty() {
            0.0
        } else {
            steady_nees.iter().sum::<f64>() / steady_nees.len() as f64 / 8.0
        },
        slip_detections: detections,
        max_tdcp_stat_m: max_stat,
    };
    CarrierTcModeRun {
        mode,
        epochs,
        summary,
    }
}
