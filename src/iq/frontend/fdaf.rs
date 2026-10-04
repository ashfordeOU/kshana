// SPDX-License-Identifier: AGPL-3.0-only
//! Frequency-domain adaptive filtering: overlapped FFT frames with per-bin excision.
//!
//! The stream is cut into frames of `N` samples (a power of two) every `N/2` samples, each
//! weighted by the square-root periodic Hann window `w[n] = sin(πn/N)` and transformed
//! (the crate's radix-2 FFT, [`crate::spectrum::fft_in_place`]). The frame's noise floor is
//! estimated robustly as `median(|X_k|²)/ln 2` (the mean of an exponential distribution,
//! which is what `|X_k|²` follows for complex Gaussian noise); every bin with `|X_k|²` above
//! `T` times that floor is set to zero, with `T = −ln(p_fa)` so a noise-only bin is excised
//! with probability `p_fa`. The frame is transformed back, weighted by the same window and
//! overlap-added. Since `sin² + cos² = 1` the analysis-synthesis pair reconstructs the input
//! exactly when nothing is excised. The threshold adapts to each frame, so a change in the
//! noise level needs no tuning.
//!
//! The output is the input delayed by `N − 1` samples ([`FreqExcision::delay`]); the first
//! `N − 1` outputs are zeros.

use super::{norm_sqr, Cf64, Stage};
use crate::spectrum::fft_in_place;
use std::collections::VecDeque;

/// Overlapped-FFT per-bin excision (see the module documentation).
#[derive(Clone, Debug)]
pub struct FreqExcision {
    n: usize,
    window: Vec<f64>,
    threshold: f64,
    hist: VecDeque<Cf64>,
    since: usize,
    ola: Vec<Cf64>,
    out: VecDeque<Cf64>,
    buf: Vec<Cf64>,
    mags: Vec<f64>,
    frames: u64,
    excised: u64,
}

impl FreqExcision {
    /// Excision with frames of `n` samples (a power of two, at least 4) and a per-bin
    /// false-excision probability `pfa ∈ (0, 1)` on noise-only bins.
    pub fn new(n: usize, pfa: f64) -> Self {
        assert!(
            n >= 4 && n.is_power_of_two(),
            "frame length must be a power of two ≥ 4"
        );
        assert!(0.0 < pfa && pfa < 1.0, "pfa must be in (0, 1)");
        let window = (0..n)
            .map(|k| (std::f64::consts::PI * k as f64 / n as f64).sin())
            .collect();
        let h = n / 2;
        Self {
            n,
            window,
            threshold: -pfa.ln(),
            hist: std::iter::repeat_n(Cf64::default(), n).collect(),
            since: 0,
            ola: vec![Cf64::default(); n],
            out: std::iter::repeat_n(Cf64::default(), h - 1).collect(),
            buf: vec![Cf64::default(); n],
            mags: vec![0.0; n],
            frames: 0,
            excised: 0,
        }
    }
    /// Latency of the stage (samples): output `k` is input `k − delay()`.
    pub fn delay(&self) -> usize {
        self.n - 1
    }
    /// Threshold factor `T = −ln(p_fa)` applied to the frame's noise floor.
    pub fn threshold_factor(&self) -> f64 {
        self.threshold
    }
    /// Frames processed so far.
    pub fn frames(&self) -> u64 {
        self.frames
    }
    /// Bins excised so far, over all frames.
    pub fn bins_excised(&self) -> u64 {
        self.excised
    }

    fn run_frame(&mut self) {
        let n = self.n;
        for (k, (b, &x)) in self.buf.iter_mut().zip(self.hist.iter()).enumerate() {
            *b = x * self.window[k];
        }
        fft_in_place(&mut self.buf, false);
        for (m, b) in self.mags.iter_mut().zip(&self.buf) {
            *m = norm_sqr(*b);
        }
        let mut sorted = self.mags.clone();
        sorted.sort_by(f64::total_cmp);
        let median = 0.5 * (sorted[n / 2 - 1] + sorted[n / 2]);
        let limit = self.threshold * median / std::f64::consts::LN_2;
        for (b, &m) in self.buf.iter_mut().zip(&self.mags) {
            if m > limit {
                *b = Cf64::default();
                self.excised += 1;
            }
        }
        fft_in_place(&mut self.buf, true);
        let scale = 1.0 / n as f64;
        for (k, o) in self.ola.iter_mut().enumerate() {
            *o = *o + self.buf[k] * (self.window[k] * scale);
        }
        let h = n / 2;
        if self.frames == 0 {
            // The first frame's leading half covers the zero history before the stream
            // started; emit exact zeros rather than its round-off.
            self.ola.drain(..h);
            self.out.extend(std::iter::repeat_n(Cf64::default(), h));
        } else {
            self.out.extend(self.ola.drain(..h));
        }
        self.ola.resize(n, Cf64::default());
        self.frames += 1;
    }
}

impl Stage for FreqExcision {
    fn process(&mut self, block: &mut [Cf64]) {
        let h = self.n / 2;
        for x in block.iter_mut() {
            self.hist.pop_front();
            self.hist.push_back(*x);
            self.since += 1;
            if self.since == h {
                self.since = 0;
                self.run_frame();
            }
            *x = self.out.pop_front().unwrap_or_default();
        }
    }
}
