// SPDX-License-Identifier: AGPL-3.0-only
//! Second-order IIR sections (biquads) and a streaming cascade.
//!
//! The designs are the bilinear transform of the analogue second-order prototypes with
//! the centre or cutoff frequency pre-warped, in the normalised form of R. Bristow-Johnson's
//! "Audio EQ cookbook": with `ω₀ = 2π f₀/f_s` and `α = sin ω₀ / (2Q)`,
//!
//! ```text
//! low-pass   b = [(1 − cos ω₀)/2, 1 − cos ω₀, (1 − cos ω₀)/2]   a = [1 + α, −2 cos ω₀, 1 − α]
//! high-pass  b = [(1 + cos ω₀)/2, −(1 + cos ω₀), (1 + cos ω₀)/2] a = as low-pass
//! band-pass  b = [α, 0, −α]  (0 dB peak)                       a = as low-pass
//! notch      b = [1, −2 cos ω₀, 1]                             a = as low-pass
//! ```
//!
//! normalised so `a₀ = 1`. With `Q = 1/√2` the low-pass is the second-order Butterworth,
//! whose magnitude is `1/√(1 + (tan(ω/2)/tan(ω₀/2))⁴)`; the tests check the coefficients
//! against that closed form. The coefficients are real and filter I and Q independently.

use super::{Cf64, Stage};
use std::f64::consts::PI;

/// One second-order section `H(z) = (b₀ + b₁z⁻¹ + b₂z⁻²)/(1 + a₁z⁻¹ + a₂z⁻²)`, run in
/// transposed direct form II on each of I and Q.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Biquad {
    /// Numerator `[b₀, b₁, b₂]`.
    pub b: [f64; 3],
    /// Denominator `[a₁, a₂]` (`a₀ = 1`).
    pub a: [f64; 2],
    s1: Cf64,
    s2: Cf64,
}

impl Biquad {
    /// A section from coefficients `b` and `a = [a₀, a₁, a₂]` (normalised here by `a₀`).
    pub fn new(b: [f64; 3], a: [f64; 3]) -> Self {
        assert!(a[0] != 0.0, "a0 must be non-zero");
        Self {
            b: [b[0] / a[0], b[1] / a[0], b[2] / a[0]],
            a: [a[1] / a[0], a[2] / a[0]],
            s1: Cf64::default(),
            s2: Cf64::default(),
        }
    }

    fn proto(fs_hz: f64, f0_hz: f64, q: f64) -> (f64, f64) {
        assert!(
            0.0 < f0_hz && f0_hz < fs_hz / 2.0 && q > 0.0,
            "biquad needs 0 < f0 < fs/2 and Q > 0"
        );
        let w0 = 2.0 * PI * f0_hz / fs_hz;
        (w0.cos(), w0.sin() / (2.0 * q))
    }

    /// Second-order low-pass with cutoff `f0_hz` and quality `q` (`1/√2` is Butterworth).
    pub fn lowpass(fs_hz: f64, f0_hz: f64, q: f64) -> Self {
        let (c, al) = Self::proto(fs_hz, f0_hz, q);
        Self::new(
            [(1.0 - c) / 2.0, 1.0 - c, (1.0 - c) / 2.0],
            [1.0 + al, -2.0 * c, 1.0 - al],
        )
    }
    /// Second-order high-pass with cutoff `f0_hz` and quality `q`.
    pub fn highpass(fs_hz: f64, f0_hz: f64, q: f64) -> Self {
        let (c, al) = Self::proto(fs_hz, f0_hz, q);
        Self::new(
            [(1.0 + c) / 2.0, -(1.0 + c), (1.0 + c) / 2.0],
            [1.0 + al, -2.0 * c, 1.0 - al],
        )
    }
    /// Second-order band-pass centred on `f0_hz`, unit gain at the centre, with 3 dB
    /// bandwidth `f0/Q` (in the pre-warped sense).
    pub fn bandpass(fs_hz: f64, f0_hz: f64, q: f64) -> Self {
        let (c, al) = Self::proto(fs_hz, f0_hz, q);
        Self::new([al, 0.0, -al], [1.0 + al, -2.0 * c, 1.0 - al])
    }
    /// Second-order notch with zeros on the unit circle at `±f0_hz` and quality `q`.
    pub fn notch(fs_hz: f64, f0_hz: f64, q: f64) -> Self {
        let (c, al) = Self::proto(fs_hz, f0_hz, q);
        Self::new([1.0, -2.0 * c, 1.0], [1.0 + al, -2.0 * c, 1.0 - al])
    }

    /// Frequency response `H(exp(j2π f/f_s))` evaluated from the coefficients.
    pub fn response(&self, f_hz: f64, fs_hz: f64) -> Cf64 {
        let z1 = super::cis(-2.0 * PI * f_hz / fs_hz);
        let z2 = z1 * z1;
        let num = Cf64::new(self.b[0], 0.0) + z1 * self.b[1] + z2 * self.b[2];
        let den = Cf64::new(1.0, 0.0) + z1 * self.a[0] + z2 * self.a[1];
        let d2 = super::norm_sqr(den);
        num * super::conj(den) * (1.0 / d2)
    }

    /// True when both poles lie strictly inside the unit circle (Jury conditions
    /// `|a₂| < 1` and `|a₁| < 1 + a₂`).
    pub fn is_stable(&self) -> bool {
        self.a[1].abs() < 1.0 && self.a[0].abs() < 1.0 + self.a[1]
    }

    /// Clear the section's state.
    pub fn reset(&mut self) {
        self.s1 = Cf64::default();
        self.s2 = Cf64::default();
    }
}

impl Stage for Biquad {
    fn process(&mut self, block: &mut [Cf64]) {
        let [b0, b1, b2] = self.b;
        let [a1, a2] = self.a;
        for x in block.iter_mut() {
            let xi = *x;
            let y = xi * b0 + self.s1;
            self.s1 = xi * b1 + self.s2 + y * (-a1);
            self.s2 = xi * b2 + y * (-a2);
            *x = y;
        }
    }
}

/// A cascade of [`Biquad`] sections applied in order.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct BiquadCascade {
    /// The sections, first applied first.
    pub sections: Vec<Biquad>,
}

impl BiquadCascade {
    /// A cascade of `sections`.
    pub fn new(sections: Vec<Biquad>) -> Self {
        Self { sections }
    }
    /// Product of the sections' responses at `f_hz`.
    pub fn response(&self, f_hz: f64, fs_hz: f64) -> Cf64 {
        self.sections
            .iter()
            .fold(Cf64::new(1.0, 0.0), |acc, s| acc * s.response(f_hz, fs_hz))
    }
}

impl Stage for BiquadCascade {
    fn process(&mut self, block: &mut [Cf64]) {
        for s in &mut self.sections {
            s.process(block);
        }
    }
}
