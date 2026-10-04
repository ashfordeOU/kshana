// SPDX-License-Identifier: AGPL-3.0-only
//! Pulse blanking on a sample-magnitude threshold.
//!
//! A sample whose magnitude exceeds the threshold is set to zero, and so are the `hold`
//! samples after it; a further exceedance during the hold restarts it. The hold counter
//! persists across blocks.

use super::{Cf64, Stage};

/// A magnitude-threshold pulse blanker with a hold time.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PulseBlanker {
    /// Magnitude threshold: samples with `|x| > threshold` trigger blanking.
    pub threshold: f64,
    /// Samples blanked after each triggering sample.
    pub hold: usize,
    remaining: usize,
    blanked: u64,
    seen: u64,
}

impl PulseBlanker {
    /// A blanker with magnitude `threshold` and `hold` samples of hold.
    pub fn new(threshold: f64, hold: usize) -> Self {
        assert!(threshold >= 0.0, "threshold must be non-negative");
        Self {
            threshold,
            hold,
            remaining: 0,
            blanked: 0,
            seen: 0,
        }
    }
    /// Samples blanked so far.
    pub fn blanked(&self) -> u64 {
        self.blanked
    }
    /// Fraction of samples blanked so far (0 before any sample).
    pub fn blanking_duty(&self) -> f64 {
        if self.seen == 0 {
            0.0
        } else {
            self.blanked as f64 / self.seen as f64
        }
    }
}

impl Stage for PulseBlanker {
    fn process(&mut self, block: &mut [Cf64]) {
        for x in block.iter_mut() {
            self.seen += 1;
            if x.abs() > self.threshold {
                self.remaining = self.hold + 1;
            }
            if self.remaining > 0 {
                *x = Cf64::default();
                self.remaining -= 1;
                self.blanked += 1;
            }
        }
    }
}
