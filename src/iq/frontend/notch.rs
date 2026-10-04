// SPDX-License-Identifier: AGPL-3.0-only
//! Adaptive notch filter for a narrowband component in complex baseband.
//!
//! The structure is the complex single-zero, single-pole notch used for GNSS continuous-wave
//! mitigation (Borio, Camoriano & Lo Presti 2008, "Two-pole and multi-pole notch filters: a
//! computationally effective solution for GNSS interference detection and mitigation"):
//!
//! ```text
//! x_f[n] = x[n] + r·z₀·x_f[n−1]          (pole at r·z₀, 0 < r < 1)
//! y[n]   = x_f[n] − z₀·x_f[n−1]          (zero at z₀)
//! ```
//!
//! The zero `z₀` is adapted by normalised LMS to minimise the output power:
//! `z₀ ← z₀ + μ·y[n]·conj(x_f[n−1]) / P̂`, with `P̂` a running mean of `|x_f[n−1]|²`, and
//! `|z₀|` kept at most 1. With a strong tone at frequency `f`, `z₀` converges near
//! `exp(j2π f/f_s)`, placing the zero on the tone; `r` sets the notch width (closer to 1 is
//! narrower). The estimated frequency is `arg(z₀)·f_s/2π`.

use super::{conj, norm_sqr, Cf64, Stage};

/// An LMS-adapted complex notch (see the module documentation).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AdaptiveNotch {
    r: f64,
    mu: f64,
    power_alpha: f64,
    z0: Cf64,
    xf_prev: Cf64,
    power: f64,
}

impl AdaptiveNotch {
    /// A notch with pole contraction `r ∈ (0, 1)`, normalised step `mu ∈ (0, 1)` and an
    /// initial zero `z0` (use `Cf64::default()` when the interferer frequency is unknown).
    pub fn new(r: f64, mu: f64, z0: Cf64) -> Self {
        assert!(0.0 < r && r < 1.0, "r must be in (0, 1)");
        assert!(0.0 < mu && mu < 1.0, "mu must be in (0, 1)");
        Self {
            r,
            mu,
            power_alpha: mu.min(0.01),
            z0,
            xf_prev: Cf64::default(),
            power: 0.0,
        }
    }
    /// Current zero `z₀`.
    pub fn zero(&self) -> Cf64 {
        self.z0
    }
    /// Frequency of the zero, `arg(z₀)·f_s/2π` (Hz), in `(−f_s/2, f_s/2]`.
    pub fn frequency_hz(&self, fs_hz: f64) -> f64 {
        self.z0.im.atan2(self.z0.re) * fs_hz / (2.0 * std::f64::consts::PI)
    }
    /// Magnitude response `|H(f)|` of the notch with its current zero at `f_hz`.
    pub fn gain_at(&self, f_hz: f64, fs_hz: f64) -> f64 {
        let zi = super::cis(-2.0 * std::f64::consts::PI * f_hz / fs_hz);
        let num = super::sub(Cf64::new(1.0, 0.0), self.z0 * zi);
        let den = super::sub(Cf64::new(1.0, 0.0), self.z0 * zi * self.r);
        num.abs() / den.abs()
    }
}

impl Stage for AdaptiveNotch {
    fn process(&mut self, block: &mut [Cf64]) {
        for x in block.iter_mut() {
            let xf = *x + self.z0 * self.xf_prev * self.r;
            let y = super::sub(xf, self.z0 * self.xf_prev);
            self.power += self.power_alpha * (norm_sqr(self.xf_prev) - self.power);
            if self.power > 0.0 {
                self.z0 = self.z0 + y * conj(self.xf_prev) * (self.mu / self.power);
                let m = self.z0.abs();
                if m > 1.0 {
                    self.z0 = self.z0 * (1.0 / m);
                }
            }
            self.xf_prev = xf;
            *x = y;
        }
    }
}
