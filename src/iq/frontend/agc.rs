// SPDX-License-Identifier: AGPL-3.0-only
//! Log-domain automatic gain control.
//!
//! The loop multiplies each sample by `g = exp(ℓ)` and updates the log-gain from the
//! instantaneous output power `p = |y|²`:
//!
//! ```text
//! ℓ ← ℓ − μ·(ln p + γ − ln P_target),   μ = 1/(2 τ f_s)
//! ```
//!
//! For a circular complex Gaussian input (noise-dominated, as GNSS front ends are),
//! `p/E[p]` is unit exponential and `E[ln p] = ln E[p] − γ` with `γ` the Euler-Mascheroni
//! constant, so the `+γ` term makes the loop settle on `E[|y|²] = P_target` without bias.
//! Since `ln p = 2ℓ + ln|x|²`, the mean log-gain error obeys `e ← (1 − 2μ)·e`: a first-order
//! loop with time constant `τ` seconds, the same in decibels for any size of level step.
//! Exact-zero samples carry no level information and leave the gain unchanged.
//!
//! Placed before a [`super::quant::Quantiser`] the loop sets the ratio of the noise level
//! to the quantiser step, which is the same as scaling the quantiser threshold to the
//! input level; [`Agc::for_quantiser`] picks the loss-minimising target.

use super::quant::{optimum_step_sigma, Quantiser};
use super::{norm_sqr, Cf64, Stage};

/// Euler-Mascheroni constant `γ`.
const EULER_GAMMA: f64 = 0.577_215_664_901_532_9;

/// A log-domain AGC loop (see the module documentation).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Agc {
    log_gain: f64,
    mu: f64,
    ln_target: f64,
}

impl Agc {
    /// A loop at sample rate `fs_hz` with time constant `tau_s` seconds, settling on mean
    /// output power `target_power` (`E[|y|²]`, both components), starting at gain
    /// `initial_gain`.
    pub fn new(fs_hz: f64, tau_s: f64, target_power: f64, initial_gain: f64) -> Self {
        assert!(fs_hz > 0.0 && tau_s > 0.0 && target_power > 0.0 && initial_gain > 0.0);
        let mu = 1.0 / (2.0 * tau_s * fs_hz);
        assert!(mu < 0.5, "time constant must be longer than one sample");
        Self {
            log_gain: initial_gain.ln(),
            mu,
            ln_target: target_power.ln(),
        }
    }
    /// A loop that drives Gaussian noise to the loss-minimising level for `q`: per-component
    /// standard deviation `q.step / s*` with `s*` from [`optimum_step_sigma`].
    pub fn for_quantiser(q: &Quantiser, fs_hz: f64, tau_s: f64) -> Self {
        let sigma = q.step / optimum_step_sigma(q.bits()).0;
        Self::new(fs_hz, tau_s, 2.0 * sigma * sigma, 1.0)
    }
    /// Current linear gain.
    pub fn gain(&self) -> f64 {
        self.log_gain.exp()
    }
    /// Current gain in decibels (`20·log10 g`).
    pub fn gain_db(&self) -> f64 {
        self.log_gain * 20.0 / std::f64::consts::LN_10
    }
    /// Target mean output power.
    pub fn target_power(&self) -> f64 {
        self.ln_target.exp()
    }
}

impl Stage for Agc {
    fn process(&mut self, block: &mut [Cf64]) {
        for x in block.iter_mut() {
            let y = *x * self.log_gain.exp();
            let p = norm_sqr(y);
            if p > 0.0 && p.is_finite() {
                self.log_gain -= self.mu * (p.ln() + EULER_GAMMA - self.ln_target);
            }
            *x = y;
        }
    }
}
