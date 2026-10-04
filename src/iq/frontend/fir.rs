// SPDX-License-Identifier: AGPL-3.0-only
//! Windowed-sinc FIR design with a Kaiser window, and a streaming FIR filter.
//!
//! Design follows Kaiser's empirical formulas (Kaiser 1974; Oppenheim & Schafer,
//! *Discrete-Time Signal Processing*, 3rd ed., §7.6): for a stopband attenuation `A` dB the
//! shape parameter is
//!
//! ```text
//! β = 0.1102·(A − 8.7)                          A > 50
//! β = 0.5842·(A − 21)^0.4 + 0.07886·(A − 21)    21 ≤ A ≤ 50
//! β = 0                                         A < 21
//! ```
//!
//! and the order for a transition width `Δω` (rad/sample) is `M = (A − 8)/(2.285·Δω)`. The
//! window gives equal peak ripple `δ = 10^(−A/20)` in passband and stopband, so the
//! passband ripple is `±20·log10(1 + δ)` dB. The ideal low-pass cutoff sits at the middle of
//! the transition band. A band-pass at complex baseband is the low-pass of half the
//! bandwidth shifted to the band centre, which gives complex taps passing only the stated
//! band (positive or negative frequencies).

use super::{Cf64, Stage};
use std::f64::consts::PI;

/// Modified Bessel function of the first kind, order zero, by its power series
/// `Σ ((x/2)^k / k!)²`, summed until the term is below `1e-17` of the total.
pub fn bessel_i0(x: f64) -> f64 {
    let h = 0.25 * x * x;
    let (mut sum, mut term, mut k) = (1.0f64, 1.0f64, 1.0f64);
    loop {
        term *= h / (k * k);
        sum += term;
        if term < 1e-17 * sum {
            return sum;
        }
        k += 1.0;
    }
}

/// Kaiser window shape parameter `β` for a stopband attenuation of `atten_db` dB (Kaiser's
/// formula, see the module documentation).
pub fn kaiser_beta(atten_db: f64) -> f64 {
    if atten_db > 50.0 {
        0.1102 * (atten_db - 8.7)
    } else if atten_db >= 21.0 {
        0.5842 * (atten_db - 21.0).powf(0.4) + 0.07886 * (atten_db - 21.0)
    } else {
        0.0
    }
}

/// Odd filter length (taps) for `atten_db` dB of stopband attenuation over a transition
/// width of `transition` cycles/sample (Kaiser's order formula `M = (A − 8)/(2.285·Δω)`,
/// rounded up and made even so the length `M + 1` is odd and the delay a whole sample).
pub fn kaiser_len(atten_db: f64, transition: f64) -> usize {
    let dw = 2.0 * PI * transition;
    let m = ((atten_db - 8.0) / (2.285 * dw)).ceil().max(2.0) as usize;
    let m = m + (m & 1);
    m + 1
}

/// Kaiser window of `len` points with shape `beta`.
pub fn kaiser_window(len: usize, beta: f64) -> Vec<f64> {
    if len == 1 {
        return vec![1.0];
    }
    let m = (len - 1) as f64;
    let i0b = bessel_i0(beta);
    (0..len)
        .map(|n| {
            let r = 2.0 * n as f64 / m - 1.0;
            bessel_i0(beta * (1.0 - r * r).max(0.0).sqrt()) / i0b
        })
        .collect()
}

/// A Kaiser-windowed FIR design: its taps and the specification it was built for.
#[derive(Clone, Debug, PartialEq)]
pub struct FirDesign {
    /// Filter taps `h[0..len]` (complex so a band-pass can sit off zero frequency).
    pub taps: Vec<Cf64>,
    /// Stated stopband attenuation (dB); the design ripple is `δ = 10^(−A/20)`.
    pub atten_db: f64,
    /// Kaiser shape parameter used.
    pub beta: f64,
}

impl FirDesign {
    /// Design ripple `δ = 10^(−A/20)` in passband and stopband (linear).
    pub fn ripple(&self) -> f64 {
        10f64.powf(-self.atten_db / 20.0)
    }
    /// Group delay of the linear-phase design (samples): `(len − 1)/2`.
    pub fn delay(&self) -> usize {
        (self.taps.len() - 1) / 2
    }
}

/// Low-pass FIR at sample rate `fs_hz` passing `|f| ≤ pass_hz` and attenuating `|f| ≥
/// stop_hz` by at least `atten_db` dB (to the accuracy of Kaiser's formulas, which the
/// tests check on the designed coefficients). The taps are real.
pub fn lowpass(fs_hz: f64, pass_hz: f64, stop_hz: f64, atten_db: f64) -> FirDesign {
    assert!(
        0.0 < pass_hz && pass_hz < stop_hz && stop_hz < fs_hz / 2.0,
        "low-pass needs 0 < pass < stop < fs/2"
    );
    let fc = 0.5 * (pass_hz + stop_hz) / fs_hz;
    let len = kaiser_len(atten_db, (stop_hz - pass_hz) / fs_hz);
    let beta = kaiser_beta(atten_db);
    let w = kaiser_window(len, beta);
    let mid = ((len - 1) / 2) as f64;
    let taps = (0..len)
        .map(|n| {
            let t = n as f64 - mid;
            let ideal = if t == 0.0 {
                2.0 * fc
            } else {
                (2.0 * PI * fc * t).sin() / (PI * t)
            };
            Cf64::new(ideal * w[n], 0.0)
        })
        .collect();
    FirDesign {
        taps,
        atten_db,
        beta,
    }
}

/// Complex band-pass FIR at sample rate `fs_hz` passing `lo_hz ≤ f ≤ hi_hz` (either may
/// be negative) with transition bands of `transition_hz` outside each edge and at least
/// `atten_db` dB of attenuation beyond them: the [`lowpass`] of half-width
/// `(hi − lo)/2` shifted to the band centre by `exp(j2π f_c n/f_s)`.
pub fn bandpass(
    fs_hz: f64,
    lo_hz: f64,
    hi_hz: f64,
    transition_hz: f64,
    atten_db: f64,
) -> FirDesign {
    assert!(lo_hz < hi_hz, "band-pass needs lo < hi");
    let half = 0.5 * (hi_hz - lo_hz);
    let centre = 0.5 * (hi_hz + lo_hz);
    let mut d = lowpass(fs_hz, half, half + transition_hz, atten_db);
    let mid = d.delay() as f64;
    for (n, h) in d.taps.iter_mut().enumerate() {
        *h = *h * super::cis(2.0 * PI * centre / fs_hz * (n as f64 - mid));
    }
    d
}

/// Frequency response `H(f) = Σ h[n]·exp(−j2π f n/f_s)` of `taps` at `f_hz`.
pub fn freq_response(taps: &[Cf64], f_hz: f64, fs_hz: f64) -> Cf64 {
    let w = -2.0 * PI * f_hz / fs_hz;
    taps.iter()
        .enumerate()
        .fold(Cf64::default(), |acc, (n, &h)| {
            acc + h * super::cis(w * n as f64)
        })
}

/// A streaming direct-form FIR filter `y[n] = Σ h[k]·x[n − k]`, starting from a zero
/// delay line.
#[derive(Clone, Debug)]
pub struct Fir {
    taps: Vec<Cf64>,
    line: Vec<Cf64>,
    pos: usize,
}

impl Fir {
    /// A filter with taps `taps` (at least one).
    pub fn new(taps: Vec<Cf64>) -> Self {
        assert!(!taps.is_empty(), "FIR needs at least one tap");
        let n = taps.len();
        Self {
            taps,
            line: vec![Cf64::default(); n],
            pos: 0,
        }
    }
    /// A filter from a [`FirDesign`].
    pub fn from_design(d: &FirDesign) -> Self {
        Self::new(d.taps.clone())
    }
    /// The filter taps.
    pub fn taps(&self) -> &[Cf64] {
        &self.taps
    }
    /// Clear the delay line.
    pub fn reset(&mut self) {
        self.line.iter_mut().for_each(|z| *z = Cf64::default());
        self.pos = 0;
    }
}

impl Stage for Fir {
    fn process(&mut self, block: &mut [Cf64]) {
        let n = self.taps.len();
        for x in block.iter_mut() {
            self.line[self.pos] = *x;
            let mut acc = Cf64::default();
            let mut j = self.pos;
            for &h in &self.taps {
                acc = acc + h * self.line[j];
                j = if j == 0 { n - 1 } else { j - 1 };
            }
            *x = acc;
            self.pos = if self.pos + 1 == n { 0 } else { self.pos + 1 };
        }
    }
}
