// SPDX-License-Identifier: AGPL-3.0-only
//! Lock-indicator time series.
//!
//! Per loop update the monitor records the channel's smoothed phase lock indicator
//! (`pli`, the windowed `NBD/NBP = cos 2φ` of [`crate::iq::track::cn0::phase_lock_indicator`])
//! and a **frequency lock indicator** computed here from successive prompts:
//! `fli = cos 2∠(P_k·P*_{k−1})`, smoothed with the exponential factor `smoothing` (1 for a
//! stable frequency lock, near 0 when the carrier slips). These are raw signals for
//! scoring and plotting; this monitor raises no events and keeps no lock state. Lock and
//! loss-of-lock decisions belong to the tracking engine's lock state machine.
//!
//! On a perfectly tracked carrier the expected per-update `cos 2θ` is
//! [`super::stats::pli_mean`] of the coherent signal-to-noise ratio, the reference for
//! both indicators.

use super::{MonitorReport, Series};
use crate::iq::Cf64;
use serde::{Deserialize, Serialize};

/// Settings of [`LockMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct LockSettings {
    /// Exponential smoothing factor of the frequency lock indicator (0 to 1].
    pub smoothing: f64,
}

impl Default for LockSettings {
    /// Smoothing 0.05.
    fn default() -> Self {
        LockSettings { smoothing: 0.05 }
    }
}

/// The lock-indicator series of one channel (see the module docs).
pub struct LockMonitor {
    settings: LockSettings,
    prev_prompt: Option<Cf64>,
    fli: f64,
    pli: Series,
    fli_s: Series,
}

impl LockMonitor {
    /// A monitor for channel `label`.
    pub fn new(label: &str, settings: LockSettings) -> Self {
        LockMonitor {
            settings,
            prev_prompt: None,
            fli: 0.0,
            pli: Series::new("pli", "1", Some(label)),
            fli_s: Series::new("fli", "1", Some(label)),
        }
    }

    /// The per-update frequency lock indicator `cos 2∠(P_k·P*_{k−1})` (unsmoothed); 0
    /// when either prompt is zero.
    pub fn instantaneous_fli(prev: Cf64, cur: Cf64) -> f64 {
        let d = Cf64::new(
            cur.re * prev.re + cur.im * prev.im,
            cur.im * prev.re - cur.re * prev.im,
        );
        let p = super::norm_sqr(d);
        if p == 0.0 {
            0.0
        } else {
            (d.re * d.re - d.im * d.im) / p
        }
    }

    /// Feed one loop update: its time, prompt and the channel's smoothed PLI.
    pub fn push(&mut self, t_s: f64, prompt: Cf64, pli: f64) {
        if let Some(prev) = self.prev_prompt {
            let f = Self::instantaneous_fli(prev, prompt);
            self.fli += self.settings.smoothing * (f - self.fli);
            self.fli_s.push(t_s, self.fli);
        }
        self.prev_prompt = Some(prompt);
        self.pli.push(t_s, pli);
    }

    /// The series.
    pub fn report(&self) -> MonitorReport {
        MonitorReport {
            series: vec![self.pli.clone(), self.fli_s.clone()],
            ..MonitorReport::default()
        }
    }
}
