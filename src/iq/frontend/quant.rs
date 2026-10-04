// SPDX-License-Identifier: AGPL-3.0-only
//! Uniform mid-rise quantiser and its correlation loss in Gaussian noise.
//!
//! I and Q are quantised independently. A `b`-bit quantiser with step `Δ` has thresholds
//! at `kΔ` (`k = −(L−1)…L−1`, `L = 2^(b−1)`) and output levels `±(k + ½)Δ`, saturating at
//! `±(L − ½)Δ`. One bit is the sign (`±Δ/2`); two bits give the classic `±1, ±3` levels
//! with the magnitude threshold at `Δ`.
//!
//! **Correlation loss.** For a weak signal in zero-mean Gaussian noise of standard
//! deviation `σ` per component, the post-correlation SNR after a quantiser `Q` relative to
//! an unquantised correlator is (Van Vleck & Middleton 1966; Chang 1982; Hegarty 2011,
//! "Analysis of the effects of quantization on GNSS receivers")
//!
//! ```text
//! η = (Σ_k J_k · φ(t_k/σ) / σ)² · σ² / E[Q(n)²]
//! ```
//!
//! where `t_k` are the thresholds, `J_k` the output jump at each and `φ` the standard normal
//! density. [`correlation_loss_db`] evaluates it in closed form. The published values at
//! the optimum step are 1.96 dB for one bit (`10·log10(π/2)`), 0.55 dB for two bits
//! (threshold ≈ 1.0σ) and 0.17 dB for three bits.

use super::{Cf64, Stage};

/// A uniform mid-rise quantiser of `bits` bits per component with step `step`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Quantiser {
    bits: u32,
    /// Step `Δ` (input units): the spacing of thresholds and output levels. For two bits it
    /// is the magnitude threshold.
    pub step: f64,
}

impl Quantiser {
    /// A quantiser of `bits` bits (1 to 16; 1, 2, 3, 8 and 14 are the usual front-end
    /// widths) with step `step > 0`.
    pub fn new(bits: u32, step: f64) -> Self {
        assert!((1..=16).contains(&bits), "bits must be 1..=16");
        assert!(step > 0.0, "step must be positive");
        Self { bits, step }
    }
    /// A quantiser whose step is the loss-minimising step for Gaussian noise of standard
    /// deviation `sigma` per component (from [`optimum_step_sigma`]).
    pub fn optimum_for(bits: u32, sigma: f64) -> Self {
        Self::new(bits, optimum_step_sigma(bits).0 * sigma)
    }
    /// Bits per component.
    pub fn bits(&self) -> u32 {
        self.bits
    }
    /// Number of output levels per component, `2^bits`.
    pub fn levels(&self) -> u32 {
        1 << self.bits
    }
    /// Signed level index `k ∈ [−L, L − 1]` of `x`; the output is `(k + ½)·Δ`.
    pub fn code(&self, x: f64) -> i32 {
        let l = 1i64 << (self.bits - 1);
        let k = (x / self.step).floor();
        let k = if k.is_nan() {
            0
        } else {
            k.clamp(-(l as f64), (l - 1) as f64) as i64
        };
        k as i32
    }
    /// Reconstructed value of one component.
    pub fn quantise(&self, x: f64) -> f64 {
        (self.code(x) as f64 + 0.5) * self.step
    }
}

impl Stage for Quantiser {
    fn process(&mut self, block: &mut [Cf64]) {
        for x in block.iter_mut() {
            *x = Cf64::new(self.quantise(x.re), self.quantise(x.im));
        }
    }
}

fn phi(t: f64) -> f64 {
    (-0.5 * t * t).exp() / (2.0 * std::f64::consts::PI).sqrt()
}

/// Upper tail of the standard normal, `P(N > t)`.
fn upper_tail(t: f64) -> f64 {
    0.5 * libm::erfc(t / std::f64::consts::SQRT_2)
}

/// Closed-form correlation loss (dB, positive) of a `bits`-bit uniform mid-rise quantiser
/// with step `step_sigma·σ` for a weak signal in Gaussian noise (see the module
/// documentation for the formula and its sources).
pub fn correlation_loss_db(bits: u32, step_sigma: f64) -> f64 {
    assert!((1..=16).contains(&bits) && step_sigma > 0.0);
    let l = 1usize << (bits - 1);
    let t = step_sigma;
    // Jumps of Δ at every threshold kΔ; by symmetry the k and −k terms are equal.
    let mut slope = phi(0.0);
    for k in 1..l {
        slope += 2.0 * phi(k as f64 * t);
    }
    slope *= t;
    let mut power = 0.0;
    for k in 0..l {
        let lo = upper_tail(k as f64 * t);
        let hi = if k + 1 < l {
            upper_tail((k + 1) as f64 * t)
        } else {
            0.0
        };
        let level = (k as f64 + 0.5) * t;
        power += 2.0 * level * level * (lo - hi);
    }
    -10.0 * (slope * slope / power).log10()
}

/// The step (in units of the noise `σ`) that minimises [`correlation_loss_db`] for `bits`,
/// and that minimum loss (dB), by golden-section search on `(0, 4σ]`. For one bit the
/// loss does not depend on the step.
pub fn optimum_step_sigma(bits: u32) -> (f64, f64) {
    if bits == 1 {
        return (1.0, correlation_loss_db(1, 1.0));
    }
    // The loss is unimodal in the step; search the log of the step, upper bound 4σ/(L−1)
    // so the outer threshold stays inside the noise distribution.
    let l = (1u64 << (bits - 1)) as f64;
    let (mut a, mut b) = ((1e-4f64).ln(), (4.0 / (l - 1.0)).ln());
    let g = 0.5 * (5f64.sqrt() - 1.0);
    let f = |x: f64| correlation_loss_db(bits, x.exp());
    let (mut c, mut d) = (b - g * (b - a), a + g * (b - a));
    let (mut fc, mut fd) = (f(c), f(d));
    for _ in 0..200 {
        if fc < fd {
            b = d;
            d = c;
            fd = fc;
            c = b - g * (b - a);
            fc = f(c);
        } else {
            a = c;
            c = d;
            fc = fd;
            d = a + g * (b - a);
            fd = f(d);
        }
    }
    let x = 0.5 * (a + b);
    (x.exp(), f(x))
}
