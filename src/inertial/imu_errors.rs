// SPDX-License-Identifier: AGPL-3.0-only
//! Deterministic IMU error model for the three-axis strapdown navigator.
//!
//! A real inertial measurement unit does not report the true body-frame angular
//! rate and specific force: each triad output is distorted by a chain of
//! systematic errors. [`ImuErrorModel`] simulates that chain so a scenario can
//! drive [`NavState`](super::mechanization::NavState) with *measured* IMU
//! samples synthesised from a known truth, and the resulting navigation error
//! can be attributed to specific error sources.
//!
//! Five systematic categories are modelled (IEEE Std 952-1997 §A.2; Groves
//! 2013 §4.3, Table 4.1):
//!
//! 1. **Scale-factor error** — a diagonal gain error `S` (ppm) on each axis.
//! 2. **Misalignment / cross-coupling** — off-diagonal terms `M` (rad) from the
//!    factory-calibrated non-orthogonality residual of the sensor triad.
//! 3. **g-sensitivity** — a gyro rate bias proportional to specific force,
//!    `g_s · f_body` (the dominant acceleration-induced gyro error).
//! 4. **Quantization** — the finite LSB of the digital output, modelled as
//!    rounding to the nearest LSB.
//! 5. **Rate-ramp** — a deterministic linear-in-time drift (the third Allan
//!    region, slope +1; IEEE Std 952-1997 §A.2).
//!
//! plus the constant turn-on **bias** of each triad. The composed measurement
//! equation, applied symmetrically to gyro and accelerometer, is
//!
//! ```text
//! measured_ω = quantize[ (I + M_g)(I + S_g) ω_true + b_g + g_s·f_true + r_g·t ]
//! measured_f = quantize[ (I + M_a)(I + S_a) f_true + b_a            + r_a·t ]
//! ```
//!
//! All parameters default to zero, so [`ImuErrorModel::ideal`] is a transparent
//! pass-through and existing scenarios are unaffected. Random walks
//! (ARW/VRW/bias-instability) are modelled separately by the stochastic
//! [`AccelModel`](super::AccelModel); this type covers the *deterministic*,
//! repeatable error sources. **Not modelled here:** vibration rectification
//! error and temperature-gradient drift (see `docs/VALIDATION.md`).

use crate::frames::Vec3;

/// Conversion: parts-per-million to a dimensionless fraction.
const PPM: f64 = 1e-6;

#[inline]
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}

/// Apply `(I + scale_diag) · v`, where `scale_diag` holds the per-axis
/// fractional scale-factor errors.
#[inline]
fn apply_scale(scale: Vec3, v: Vec3) -> Vec3 {
    [
        v[0] * (1.0 + scale[0]),
        v[1] * (1.0 + scale[1]),
        v[2] * (1.0 + scale[2]),
    ]
}

/// Apply `(I + M) · v`, where `M` is the off-diagonal misalignment matrix
/// (its diagonal is ignored — the identity is added explicitly).
#[inline]
fn apply_misalignment(m: [[f64; 3]; 3], v: Vec3) -> Vec3 {
    [
        v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + v[2],
    ]
}

/// Round each component to the nearest multiple of `lsb` (no-op when `lsb == 0`).
#[inline]
fn quantize(lsb: Vec3, v: Vec3) -> Vec3 {
    let q = |step: f64, x: f64| {
        if step > 0.0 {
            (x / step).round() * step
        } else {
            x
        }
    };
    [q(lsb[0], v[0]), q(lsb[1], v[1]), q(lsb[2], v[2])]
}

/// Deterministic IMU error model for one gyro+accelerometer triad pair.
#[derive(Clone, Debug)]
pub struct ImuErrorModel {
    pub provenance: String,
    /// Per-axis gyro scale-factor error (fractional).
    pub scale_gyro: Vec3,
    /// Per-axis accelerometer scale-factor error (fractional).
    pub scale_accel: Vec3,
    /// Gyro misalignment / cross-coupling matrix (rad, off-diagonal).
    pub misalignment_gyro: [[f64; 3]; 3],
    /// Accelerometer misalignment / cross-coupling matrix (rad, off-diagonal).
    pub misalignment_accel: [[f64; 3]; 3],
    /// Gyro g-sensitivity (rad/s per m/s²), mapping specific force to rate bias.
    pub g_sensitivity: Vec3,
    /// Constant gyro turn-on bias (rad/s).
    pub bias_gyro: Vec3,
    /// Constant accelerometer turn-on bias (m/s²).
    pub bias_accel: Vec3,
    /// Gyro output quantization step (rad/s; 0 disables).
    pub quant_gyro: Vec3,
    /// Accelerometer output quantization step (m/s²; 0 disables).
    pub quant_accel: Vec3,
    /// Gyro rate-ramp (rad/s²) — linear-in-time drift.
    pub rate_ramp_gyro: Vec3,
    /// Accelerometer rate-ramp (m/s³) — linear-in-time drift.
    pub rate_ramp_accel: Vec3,
}

impl Default for ImuErrorModel {
    fn default() -> Self {
        Self::ideal()
    }
}

impl ImuErrorModel {
    /// A transparent (error-free) model: every term zero, so `distort` returns
    /// its inputs unchanged.
    pub fn ideal() -> Self {
        Self {
            provenance: "ideal (no error sources)".into(),
            scale_gyro: [0.0; 3],
            scale_accel: [0.0; 3],
            misalignment_gyro: [[0.0; 3]; 3],
            misalignment_accel: [[0.0; 3]; 3],
            g_sensitivity: [0.0; 3],
            bias_gyro: [0.0; 3],
            bias_accel: [0.0; 3],
            quant_gyro: [0.0; 3],
            quant_accel: [0.0; 3],
            rate_ramp_gyro: [0.0; 3],
            rate_ramp_accel: [0.0; 3],
        }
    }

    /// Set the provenance string (e.g. the datasheet or standard the parameters
    /// were taken from). References should cite Groves 2013 §4.3 / Table 4.1 and
    /// IEEE Std 952-1997 for the rate-ramp region.
    pub fn with_provenance(mut self, s: &str) -> Self {
        self.provenance = s.into();
        self
    }

    /// Per-axis gyro scale-factor error in **ppm**.
    pub fn with_scale_gyro_ppm(mut self, ppm: Vec3) -> Self {
        self.scale_gyro = [ppm[0] * PPM, ppm[1] * PPM, ppm[2] * PPM];
        self
    }

    /// Per-axis accelerometer scale-factor error in **ppm**.
    pub fn with_scale_accel_ppm(mut self, ppm: Vec3) -> Self {
        self.scale_accel = [ppm[0] * PPM, ppm[1] * PPM, ppm[2] * PPM];
        self
    }

    /// Gyro misalignment matrix (rad). The diagonal is ignored.
    pub fn with_misalignment_gyro(mut self, m: [[f64; 3]; 3]) -> Self {
        self.misalignment_gyro = m;
        self
    }

    /// Accelerometer misalignment matrix (rad). The diagonal is ignored.
    pub fn with_misalignment_accel(mut self, m: [[f64; 3]; 3]) -> Self {
        self.misalignment_accel = m;
        self
    }

    /// Gyro g-sensitivity (rad/s per m/s²).
    pub fn with_g_sensitivity(mut self, g_s: Vec3) -> Self {
        self.g_sensitivity = g_s;
        self
    }

    /// Constant turn-on biases: gyro (rad/s) and accelerometer (m/s²).
    pub fn with_bias(mut self, gyro: Vec3, accel: Vec3) -> Self {
        self.bias_gyro = gyro;
        self.bias_accel = accel;
        self
    }

    /// Output quantization steps: gyro (rad/s) and accelerometer (m/s²).
    pub fn with_quantization(mut self, gyro: Vec3, accel: Vec3) -> Self {
        self.quant_gyro = gyro;
        self.quant_accel = accel;
        self
    }

    /// Rate-ramp slopes: gyro (rad/s²) and accelerometer (m/s³).
    pub fn with_rate_ramp(mut self, gyro: Vec3, accel: Vec3) -> Self {
        self.rate_ramp_gyro = gyro;
        self.rate_ramp_accel = accel;
        self
    }

    /// Distort a true body-frame angular rate `omega_true` (rad/s) and specific
    /// force `f_true` (m/s²) into the IMU's measured outputs at time `t` (s).
    ///
    /// Returns `(measured_omega, measured_f)`. The gyro picks up the
    /// g-sensitivity term `g_s · f_true`; the accelerometer has no analogous
    /// rate cross-term in this model.
    pub fn distort(&self, omega_true: Vec3, f_true: Vec3, t: f64) -> (Vec3, Vec3) {
        // Gyro chain.
        let mut g = apply_scale(self.scale_gyro, omega_true);
        g = apply_misalignment(self.misalignment_gyro, g);
        g = add(g, self.bias_gyro);
        let g_sens = [
            self.g_sensitivity[0] * f_true[0],
            self.g_sensitivity[1] * f_true[1],
            self.g_sensitivity[2] * f_true[2],
        ];
        g = add(g, g_sens);
        g = add(
            g,
            [
                self.rate_ramp_gyro[0] * t,
                self.rate_ramp_gyro[1] * t,
                self.rate_ramp_gyro[2] * t,
            ],
        );
        let measured_omega = quantize(self.quant_gyro, g);

        // Accelerometer chain.
        let mut a = apply_scale(self.scale_accel, f_true);
        a = apply_misalignment(self.misalignment_accel, a);
        a = add(a, self.bias_accel);
        a = add(
            a,
            [
                self.rate_ramp_accel[0] * t,
                self.rate_ramp_accel[1] * t,
                self.rate_ramp_accel[2] * t,
            ],
        );
        let measured_f = quantize(self.quant_accel, a);

        (measured_omega, measured_f)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn vclose(a: Vec3, b: Vec3, tol: f64) -> bool {
        (0..3).all(|i| (a[i] - b[i]).abs() <= tol)
    }

    #[test]
    fn ideal_model_is_a_transparent_passthrough() {
        let m = ImuErrorModel::ideal();
        let w = [0.01, -0.02, 0.005];
        let f = [0.1, 0.2, -9.8];
        let (mw, mf) = m.distort(w, f, 12.34);
        assert!(vclose(mw, w, 0.0) && vclose(mf, f, 0.0));
    }

    #[test]
    fn gyro_scale_factor_is_linear_to_within_0_01_percent() {
        // 500 ppm on x: measured_x = true_x · (1 + 5e-4) exactly.
        let m = ImuErrorModel::ideal().with_scale_gyro_ppm([500.0, 0.0, 0.0]);
        let w = [0.3, 0.0, 0.0];
        let (mw, _) = m.distort(w, [0.0; 3], 0.0);
        let expected = 0.3 * (1.0 + 500.0 * PPM);
        // Relative error well under 0.01% (1e-4).
        assert!((mw[0] - expected).abs() / expected < 1e-4);
        assert_eq!(mw[1], 0.0);
        assert_eq!(mw[2], 0.0);
    }

    #[test]
    fn accel_scale_factor_is_linear() {
        let m = ImuErrorModel::ideal().with_scale_accel_ppm([0.0, 1000.0, 0.0]);
        let f = [0.0, 2.0, 0.0];
        let (_, mf) = m.distort([0.0; 3], f, 0.0);
        let expected = 2.0 * (1.0 + 1000.0 * PPM);
        assert!((mf[1] - expected).abs() / expected < 1e-4);
    }

    #[test]
    fn misalignment_produces_cross_axis_signal() {
        // m_xy couples a true y-rate onto the measured x channel.
        let mut mis = [[0.0; 3]; 3];
        mis[0][1] = 1e-3; // 1 mrad cross-coupling
        let m = ImuErrorModel::ideal().with_misalignment_gyro(mis);
        let w = [0.0, 0.5, 0.0];
        let (mw, _) = m.distort(w, [0.0; 3], 0.0);
        // Cross-axis x reads m_xy · ω_y; far above any VRW floor (~µrad/s).
        assert!((mw[0] - 1e-3 * 0.5).abs() < 1e-12);
        assert!(mw[0] > 1e-6);
        assert_eq!(mw[1], 0.5); // y unchanged (diagonal is identity)
    }

    #[test]
    fn g_sensitivity_biases_the_gyro_under_specific_force() {
        // 1 (rad/s)/(m/s²) on z, under 9.8 m/s² → 9.8 rad/s bias on z.
        let m = ImuErrorModel::ideal().with_g_sensitivity([0.0, 0.0, 1.0]);
        let f = [0.0, 0.0, 9.8];
        let (mw, _) = m.distort([0.0; 3], f, 0.0);
        assert!((mw[2] - 9.8).abs() < 1e-12);
        // No g-sensitivity cross to x/y, and the accelerometer is unaffected.
        assert_eq!(mw[0], 0.0);
    }

    #[test]
    fn quantization_rounds_to_the_lsb_grid() {
        let lsb = 1e-3;
        let m = ImuErrorModel::ideal().with_quantization([lsb, lsb, lsb], [0.0; 3]);
        let w = [0.012_345_6, -0.000_4, 0.0];
        let (mw, _) = m.distort(w, [0.0; 3], 0.0);
        for i in 0..3 {
            // Output sits exactly on the LSB grid, within half an LSB of truth.
            let k = (mw[i] / lsb).round();
            assert!((mw[i] - k * lsb).abs() < 1e-15);
            assert!((mw[i] - w[i]).abs() <= 0.5 * lsb + 1e-15);
        }
        assert_eq!(mw[0], 0.012); // 0.0123456 → nearest 1e-3
        assert_eq!(mw[1], 0.0); // -0.0004 → 0
    }

    #[test]
    fn rate_ramp_grows_linearly_with_time() {
        // 1e-4 rad/s² ramp on x: bias at t is 1e-4 · t.
        let m = ImuErrorModel::ideal().with_rate_ramp([1e-4, 0.0, 0.0], [0.0; 3]);
        let (w10, _) = m.distort([0.0; 3], [0.0; 3], 10.0);
        let (w100, _) = m.distort([0.0; 3], [0.0; 3], 100.0);
        assert!((w10[0] - 1e-3).abs() < 1e-15);
        assert!((w100[0] - 1e-2).abs() < 1e-15);
        // Strictly linear: 10× the time → 10× the bias.
        assert!((w100[0] / w10[0] - 10.0).abs() < 1e-9);
    }

    #[test]
    fn error_model_drives_a_navigation_error_through_the_mechanization() {
        // End-to-end wiring: a true static trajectory, distorted by a gyro bias,
        // fed to the 3-axis navigator, produces a growing position error — while
        // the ideal model leaves the navigator stationary.
        use super::super::mechanization::{normal_gravity, NavState};
        use crate::frames::{geodetic_to_ecef, Geodetic};
        use crate::inertial::attitude::Quaternion;

        let lat = 0.6;
        let start = Geodetic {
            lat_rad: lat,
            lon_rad: 0.1,
            alt_m: 0.0,
        };
        // True IMU of a platform held level and still on the rotating Earth.
        let omega_ie = super::super::mechanization::OMEGA_IE;
        let true_omega = [omega_ie * lat.cos(), 0.0, -omega_ie * lat.sin()];
        let g = normal_gravity(lat, 0.0);
        let true_f = [0.0, 0.0, -g];

        let dt = 0.01;
        let n = 3_000; // 30 s

        let run = |model: &ImuErrorModel| -> f64 {
            let mut nav = NavState::new(Quaternion::identity(), [0.0; 3], start);
            for i in 0..n {
                let t = i as f64 * dt;
                let (mw, mf) = model.distort(true_omega, true_f, t);
                nav.step(mw, mf, dt);
            }
            let p0 = geodetic_to_ecef(start);
            let p1 = geodetic_to_ecef(nav.p_llh);
            ((p1[0] - p0[0]).powi(2) + (p1[1] - p0[1]).powi(2) + (p1[2] - p0[2]).powi(2)).sqrt()
        };

        let ideal_drift = run(&ImuErrorModel::ideal());
        // 1 mrad/s residual gyro bias on east → a classic Schuler-bounded tilt
        // that drives a horizontal position error.
        let biased = ImuErrorModel::ideal().with_bias([0.0, 1e-3, 0.0], [0.0; 3]);
        let biased_drift = run(&biased);

        assert!(
            ideal_drift < 1e-3,
            "ideal model should stay put: {ideal_drift}"
        );
        assert!(
            biased_drift > 1.0,
            "gyro bias should drive a navigation error: {biased_drift} m"
        );
    }

    #[test]
    fn scale_and_misalignment_compose_in_order() {
        // (I + M)(I + S): scale first, then cross-couple. Verifies the chain.
        let m = ImuErrorModel::ideal()
            .with_scale_gyro_ppm([1e6, 0.0, 0.0]) // s_x = 1.0 → doubles x
            .with_misalignment_gyro({
                let mut mm = [[0.0; 3]; 3];
                mm[1][0] = 0.5; // y picks up 0.5 · (scaled x)
                mm
            });
        let (mw, _) = m.distort([1.0, 0.0, 0.0], [0.0; 3], 0.0);
        assert!((mw[0] - 2.0).abs() < 1e-12); // (1+1)·1
        assert!((mw[1] - 1.0).abs() < 1e-12); // 0.5 · 2.0
    }
}
