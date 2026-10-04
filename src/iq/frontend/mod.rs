// SPDX-License-Identifier: AGPL-3.0-only
//! **Receiver front end and interference-mitigation DSP as streaming stages.**
//!
//! Every stage implements [`Stage`]: `process` filters a block of complex baseband samples
//! in place and keeps its state (delay lines, loop states, hold counters, overlap buffers)
//! across calls, so a stream processed in chunks of any size gives bit-identical output to
//! the same stream processed in one call.
//!
//! * [`fir`] - windowed-sinc FIR design (Kaiser window from a stated stopband attenuation
//!   and transition width, low-pass and complex band-pass) and a streaming FIR filter.
//! * [`iir`] - second-order IIR sections (biquads) from the bilinear-transform designs
//!   and a streaming cascade.
//! * [`quant`] - uniform mid-rise quantiser of 1, 2, 3, 8 or 14 bits per I and Q
//!   component, with the closed-form correlation loss in Gaussian noise.
//! * [`agc`] - a log-domain automatic gain control loop with a stated time constant that
//!   sets the level the quantiser sees.
//! * [`notch`] - an adaptive notch filter whose complex zero is adapted by normalised LMS
//!   to the strongest narrowband component.
//! * [`blank`] - pulse blanking on a sample-magnitude threshold with a hold time.
//! * [`fdaf`] - frequency-domain adaptive filtering: overlapped windowed FFT frames, bins
//!   above a threshold set from the frame's own noise floor are excised, then overlap-add.
//!
//! These are generic filter stages tested on generic inputs (tones, Gaussian noise,
//! threshold test vectors); they do not model any particular receiver or device. Results
//! are MODELLED except where a test names its independent reference (a closed form or a
//! published value). Interference waveforms are not synthesised here: test inputs are
//! plain sinusoids and noise.

pub mod agc;
pub mod blank;
pub mod fdaf;
pub mod fir;
pub mod iir;
pub mod notch;
pub mod quant;

use super::Cf64;

/// A streaming signal-processing stage over complex baseband samples.
///
/// `process` replaces each sample of `block` with the stage's output and carries its state
/// to the next call, so chunked and one-shot processing give identical output.
pub trait Stage {
    /// Filter `block` in place.
    fn process(&mut self, block: &mut [Cf64]);
}

/// A sequence of stages applied in order, itself a [`Stage`].
#[derive(Default)]
pub struct Chain {
    stages: Vec<Box<dyn Stage>>,
}

impl Chain {
    /// An empty chain (passes samples through unchanged).
    pub fn new() -> Self {
        Self::default()
    }
    /// Append `stage` to the end of the chain.
    pub fn push(mut self, stage: impl Stage + 'static) -> Self {
        self.stages.push(Box::new(stage));
        self
    }
    /// Number of stages.
    pub fn len(&self) -> usize {
        self.stages.len()
    }
    /// True when the chain has no stages.
    pub fn is_empty(&self) -> bool {
        self.stages.is_empty()
    }
}

impl Stage for Chain {
    fn process(&mut self, block: &mut [Cf64]) {
        for s in &mut self.stages {
            s.process(block);
        }
    }
}

/// Complex conjugate.
#[inline]
pub(crate) fn conj(z: Cf64) -> Cf64 {
    Cf64::new(z.re, -z.im)
}

/// Complex difference `a − b`.
#[inline]
pub(crate) fn sub(a: Cf64, b: Cf64) -> Cf64 {
    Cf64::new(a.re - b.re, a.im - b.im)
}

/// Squared magnitude `re² + im²`.
#[inline]
pub(crate) fn norm_sqr(z: Cf64) -> f64 {
    z.re * z.re + z.im * z.im
}

/// `exp(jθ)`.
#[inline]
pub(crate) fn cis(theta: f64) -> Cf64 {
    Cf64::new(theta.cos(), theta.sin())
}
