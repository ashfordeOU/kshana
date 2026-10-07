// SPDX-License-Identifier: AGPL-3.0-only
//! Lock-indicator time series and loss-of-lock events.
//!
//! Per loop update the monitor records the channel's smoothed phase lock indicator
//! (`pli`, the windowed `NBD/NBP = cos 2φ` of [`crate::iq::track::cn0::phase_lock_indicator`]),
//! its lock flags (`phase_lock`, `code_lock` as 0/1) and a **frequency lock indicator**
//! computed here from successive prompts: `fli = cos 2∠(P_k·P*_{k−1})`, smoothed with the
//! same exponential factor `smoothing` (1 for a stable frequency lock, near 0 when the
//! carrier slips). A flag that falls after having been set, and stays down for
//! `min_epochs` updates, opens a `loss_of_phase_lock` or `loss_of_code_lock` event that
//! closes when the flag is set again: the event's duration is the time to re-lock.
//!
//! On a perfectly tracked carrier the expected per-update `cos 2θ` is
//! [`super::stats::pli_mean`] of the coherent signal-to-noise ratio, the reference for
//! both indicators.

use super::{MonitorEvent, MonitorReport, Series};
use crate::iq::Cf64;
use serde::{Deserialize, Serialize};

/// Settings of [`LockMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct LockSettings {
    /// Updates a flag must stay down to count as a loss of lock.
    pub min_epochs: usize,
    /// Exponential smoothing factor of the frequency lock indicator (0 to 1].
    pub smoothing: f64,
}

impl Default for LockSettings {
    /// Five updates; smoothing 0.05.
    fn default() -> Self {
        LockSettings {
            min_epochs: 5,
            smoothing: 0.05,
        }
    }
}

/// Loss-of-lock bookkeeping for one flag.
#[derive(Clone, Debug)]
struct Flag {
    kind: &'static str,
    was_locked: bool,
    down_since: Option<(f64, usize)>,
    open: Option<MonitorEvent>,
    events: Vec<MonitorEvent>,
    locked_updates: u64,
    updates: u64,
}

impl Flag {
    fn new(kind: &'static str) -> Self {
        Flag {
            kind,
            was_locked: false,
            down_since: None,
            open: None,
            events: Vec::new(),
            locked_updates: 0,
            updates: 0,
        }
    }

    fn push(&mut self, channel: &str, t: f64, locked: bool, min_epochs: usize) {
        self.updates += 1;
        if locked {
            self.locked_updates += 1;
            self.was_locked = true;
            self.down_since = None;
            if let Some(mut ev) = self.open.take() {
                ev.t_end_s = Some(t);
                self.events.push(ev);
            }
            return;
        }
        if !self.was_locked || self.open.is_some() {
            if let Some(ev) = self.open.as_mut() {
                ev.peak = t - ev.t_start_s;
            }
            return;
        }
        let (t0, n) = match self.down_since {
            Some((t0, n)) => (t0, n + 1),
            None => (t, 1),
        };
        if n >= min_epochs.max(1) {
            self.open = Some(MonitorEvent {
                kind: self.kind.to_string(),
                channel: Some(channel.to_string()),
                t_start_s: t0,
                t_alarm_s: t,
                t_end_s: None,
                peak: t - t0,
                threshold: min_epochs as f64,
            });
            self.down_since = None;
        } else {
            self.down_since = Some((t0, n));
        }
    }

    fn events(&self) -> Vec<MonitorEvent> {
        let mut v = self.events.clone();
        v.extend(self.open.clone());
        v
    }
}

/// The lock monitor of one channel (see the module docs).
pub struct LockMonitor {
    label: String,
    settings: LockSettings,
    prev_prompt: Option<Cf64>,
    fli: f64,
    pli: Series,
    fli_s: Series,
    phase: Series,
    code: Series,
    phase_flag: Flag,
    code_flag: Flag,
}

impl LockMonitor {
    /// A monitor for channel `label`.
    pub fn new(label: &str, settings: LockSettings) -> Self {
        LockMonitor {
            label: label.to_string(),
            settings,
            prev_prompt: None,
            fli: 0.0,
            pli: Series::new("pli", "1", Some(label)),
            fli_s: Series::new("fli", "1", Some(label)),
            phase: Series::new("phase_lock", "1", Some(label)),
            code: Series::new("code_lock", "1", Some(label)),
            phase_flag: Flag::new("loss_of_phase_lock"),
            code_flag: Flag::new("loss_of_code_lock"),
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

    /// Feed one loop update.
    pub fn push(&mut self, t_s: f64, prompt: Cf64, pli: f64, phase_lock: bool, code_lock: bool) {
        if let Some(prev) = self.prev_prompt {
            let f = Self::instantaneous_fli(prev, prompt);
            self.fli += self.settings.smoothing * (f - self.fli);
            self.fli_s.push(t_s, self.fli);
        }
        self.prev_prompt = Some(prompt);
        self.pli.push(t_s, pli);
        self.phase.push(t_s, phase_lock as u8 as f64);
        self.code.push(t_s, code_lock as u8 as f64);
        let m = self.settings.min_epochs;
        self.phase_flag.push(&self.label, t_s, phase_lock, m);
        self.code_flag.push(&self.label, t_s, code_lock, m);
    }

    /// The events so far (each event's `peak` is its duration so far, s).
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = self.phase_flag.events();
        v.extend(self.code_flag.events());
        v
    }

    /// The fraction of updates with phase lock and with code lock.
    pub fn lock_fractions(&self) -> (f64, f64) {
        let f = |fl: &Flag| {
            if fl.updates == 0 {
                0.0
            } else {
                fl.locked_updates as f64 / fl.updates as f64
            }
        };
        (f(&self.phase_flag), f(&self.code_flag))
    }

    /// The series, events and notes.
    pub fn report(&self) -> MonitorReport {
        let (pf, cf) = self.lock_fractions();
        let l = &self.label;
        let mut r = MonitorReport {
            series: vec![
                self.pli.clone(),
                self.fli_s.clone(),
                self.phase.clone(),
                self.code.clone(),
            ],
            events: self.events(),
            spectra: Vec::new(),
            notes: vec![
                (format!("lock.{l}.phase_lock_fraction"), format!("{pf:.4}")),
                (format!("lock.{l}.code_lock_fraction"), format!("{cf:.4}")),
            ],
        };
        r.events.sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
        r
    }
}
