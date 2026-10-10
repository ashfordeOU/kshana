// SPDX-License-Identifier: AGPL-3.0-only
//! Total received power and the gain an ideal AGC would apply.
//!
//! Samples are taken in blocks of `block_s`; each block's mean power `P = mean |x|²` gives
//! two series: `power_db` (`10·log10 P`, in the recording's units) and `agc_gain_db`, the
//! gain that brings the block back to the baseline level (`baseline_db − power_db`, what
//! an ideal AGC holding a constant level would apply). The first `baseline_s` seconds set
//! the baseline (the mean of their block powers, in linear units); afterwards a block
//! whose power departs from it by more than `threshold_db` for `min_blocks` consecutive
//! blocks raises a `power_rise` or `power_drop` event.
//!
//! On white Gaussian noise the per-block false-alarm probability of that test is
//! [`super::stats::power_block_pfa`]; the report notes it for the block length used.

use super::{stats, Baseline, MonitorEvent, MonitorReport, Series, Side, SpanDetector};
use crate::iq::Cf64;
use serde::{Deserialize, Serialize};

/// Settings of [`PowerMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct PowerSettings {
    /// Block length (s).
    pub block_s: f64,
    /// Length of the baseline at the start of the data (s).
    pub baseline_s: f64,
    /// Departure from the baseline that counts (dB, either way).
    pub threshold_db: f64,
    /// Consecutive blocks past the threshold needed to raise an event.
    pub min_blocks: usize,
}

impl Default for PowerSettings {
    /// 10 ms blocks, a 1 s baseline, ±1 dB, two blocks.
    fn default() -> Self {
        PowerSettings {
            block_s: 0.01,
            baseline_s: 1.0,
            threshold_db: 1.0,
            min_blocks: 2,
        }
    }
}

/// The total-power / AGC monitor (see the module docs).
pub struct PowerMonitor {
    settings: PowerSettings,
    fs_hz: f64,
    block_len: usize,
    acc: f64,
    in_block: usize,
    sample: u64,
    baseline: Baseline,
    baseline_blocks: usize,
    reference_db: Option<f64>,
    power: Series,
    gain: Series,
    rise: Option<SpanDetector>,
    drop: Option<SpanDetector>,
}

impl PowerMonitor {
    /// A monitor for samples at `fs_hz`.
    pub fn new(fs_hz: f64, settings: PowerSettings) -> Self {
        let block_len = ((settings.block_s * fs_hz).round() as usize).max(1);
        let baseline_blocks =
            ((settings.baseline_s / (block_len as f64 / fs_hz)).round() as usize).max(1);
        PowerMonitor {
            settings,
            fs_hz,
            block_len,
            acc: 0.0,
            in_block: 0,
            sample: 0,
            baseline: Baseline::default(),
            baseline_blocks,
            reference_db: None,
            power: Series::new("power_db", "dB", None),
            gain: Series::new("agc_gain_db", "dB", None),
            rise: None,
            drop: None,
        }
    }

    /// Samples per block.
    pub fn block_len(&self) -> usize {
        self.block_len
    }

    /// The baseline level (dB), once learned.
    pub fn reference_db(&self) -> Option<f64> {
        self.reference_db
    }

    /// Feed samples.
    pub fn push(&mut self, x: &[Cf64]) {
        for s in x {
            self.acc += super::norm_sqr(*s);
            self.in_block += 1;
            self.sample += 1;
            if self.in_block == self.block_len {
                let p = self.acc / self.block_len as f64;
                // The block's time is its centre.
                let t = (self.sample as f64 - self.block_len as f64 / 2.0) / self.fs_hz;
                self.block(t, p);
                self.acc = 0.0;
                self.in_block = 0;
            }
        }
    }

    fn block(&mut self, t: f64, p: f64) {
        let db = 10.0 * p.max(1e-300).log10();
        self.power.push(t, db);
        match self.reference_db {
            None => {
                self.baseline.push(p);
                if self.baseline.count() as usize >= self.baseline_blocks {
                    let r = 10.0 * self.baseline.mean().max(1e-300).log10();
                    self.reference_db = Some(r);
                    let th = self.settings.threshold_db;
                    self.rise = Some(SpanDetector::new(
                        "power_rise",
                        None,
                        Side::Above,
                        th,
                        self.settings.min_blocks,
                    ));
                    self.drop = Some(SpanDetector::new(
                        "power_drop",
                        None,
                        Side::Below,
                        -th,
                        self.settings.min_blocks,
                    ));
                }
            }
            Some(r) => {
                self.gain.push(t, r - db);
                let dev = db - r;
                if let Some(d) = self.rise.as_mut() {
                    d.push(t, dev);
                }
                if let Some(d) = self.drop.as_mut() {
                    d.push(t, dev);
                }
            }
        }
    }

    /// The events so far.
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = Vec::new();
        for d in [&self.rise, &self.drop].into_iter().flatten() {
            v.extend(d.events());
        }
        v
    }

    /// The series, events and notes.
    pub fn report(&self) -> MonitorReport {
        let mut r = MonitorReport {
            series: vec![self.power.clone(), self.gain.clone()],
            events: self.events(),
            spectra: Vec::new(),
            notes: vec![
                ("power.block_samples".into(), self.block_len.to_string()),
                (
                    "power.baseline_db".into(),
                    self.reference_db
                        .map(|v| format!("{v:.4}"))
                        .unwrap_or_else(|| "not reached".into()),
                ),
                (
                    "power.pfa_per_block_white_noise".into(),
                    format!(
                        "{:.3e}",
                        stats::power_block_pfa(self.block_len, self.settings.threshold_db)
                    ),
                ),
            ],
        };
        r.events.sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
        r
    }
}
