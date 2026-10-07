// SPDX-License-Identifier: AGPL-3.0-only
//! Per-channel C/N0 change detection.
//!
//! The channel's C/N0 estimates form the `cn0_dbhz` series. After a baseline of
//! `baseline_s` seconds sets the mean `μ0` and spread `σ0` (at least `sigma_floor_db`),
//! every `stride`-th estimate feeds two one-sided CUSUM detectors on the normalised
//! departure `z = (x − μ0)/σ0`:
//!
//! * drop: `g⁻ ← max(0, g⁻ − z − k)`; rise: `g⁺ ← max(0, g⁺ + z − k)`, with the reference
//!   value `k = shift_db/(2σ0)` tuned to a change of `shift_db`;
//! * an alarm when `g > h` opens a `cn0_drop` or `cn0_rise` event whose start is the
//!   change-time estimate (the last time `g` left zero); it closes when `g` returns to zero.
//!
//! The CUSUM statistics are series `cn0_cusum_drop` and `cn0_cusum_rise`. On independent
//! Gaussian estimates the mean time to a false alarm is Siegmund's
//! [`super::stats::cusum_arl0`]`(k, h)` samples, and the mean delay to detect a step of
//! `shift_db` is [`super::stats::cusum_arl`]`(k, h, shift_db/σ0)`. A tracking channel's
//! sliding-window C/N0 estimates are correlated over the estimator's window; set
//! `stride` to the window length in loop updates to feed the detector independent values
//! (`kshana iq monitor` does this from the loop design).

use super::{stats, Baseline, MonitorEvent, MonitorReport, Series};
use serde::{Deserialize, Serialize};

/// Settings of [`Cn0Monitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct Cn0Settings {
    /// Length of the baseline from the first estimate (s).
    pub baseline_s: f64,
    /// Feed every `stride`-th estimate to the detectors (1 = every estimate).
    pub stride: usize,
    /// The change the detectors are tuned to (dB).
    pub shift_db: f64,
    /// Decision interval `h` (in units of `σ0`).
    pub h: f64,
    /// Lower bound on `σ0` (dB).
    pub sigma_floor_db: f64,
}

impl Default for Cn0Settings {
    /// 2 s baseline, every estimate, tuned to 3 dB, `h = 5`, `σ0 ≥ 0.1 dB`.
    fn default() -> Self {
        Cn0Settings {
            baseline_s: 2.0,
            stride: 1,
            shift_db: 3.0,
            h: 5.0,
            sigma_floor_db: 0.1,
        }
    }
}

/// One-sided CUSUM with change-time estimate and span bookkeeping.
#[derive(Clone, Debug)]
struct Cusum {
    kind: &'static str,
    g: f64,
    left_zero_at: f64,
    open: Option<MonitorEvent>,
    events: Vec<MonitorEvent>,
}

impl Cusum {
    fn new(kind: &'static str) -> Self {
        Cusum {
            kind,
            g: 0.0,
            left_zero_at: 0.0,
            open: None,
            events: Vec::new(),
        }
    }

    fn push(&mut self, channel: &str, t: f64, z: f64, k: f64, h: f64, prev_t: f64) {
        let was_zero = self.g == 0.0;
        self.g = (self.g + z - k).max(0.0);
        if was_zero && self.g > 0.0 {
            // The change happened after the previous sample.
            self.left_zero_at = prev_t;
        }
        if let Some(ev) = self.open.as_mut() {
            ev.peak = ev.peak.max(self.g);
            if self.g == 0.0 {
                let mut ev = self.open.take().expect("open");
                ev.t_end_s = Some(t);
                self.events.push(ev);
            }
        } else if self.g > h {
            self.open = Some(MonitorEvent {
                kind: self.kind.to_string(),
                channel: Some(channel.to_string()),
                t_start_s: self.left_zero_at,
                t_alarm_s: t,
                t_end_s: None,
                peak: self.g,
                threshold: h,
            });
        }
    }

    fn events(&self) -> Vec<MonitorEvent> {
        let mut v = self.events.clone();
        v.extend(self.open.clone());
        v
    }
}

/// The C/N0 change monitor of one channel (see the module docs).
pub struct Cn0Monitor {
    label: String,
    settings: Cn0Settings,
    t0: Option<f64>,
    baseline: Baseline,
    reference: Option<(f64, f64)>,
    n_seen: u64,
    prev_t: f64,
    series: Series,
    s_drop: Series,
    s_rise: Series,
    drop: Cusum,
    rise: Cusum,
}

impl Cn0Monitor {
    /// A monitor for channel `label`.
    pub fn new(label: &str, settings: Cn0Settings) -> Self {
        Cn0Monitor {
            label: label.to_string(),
            settings,
            t0: None,
            baseline: Baseline::default(),
            reference: None,
            n_seen: 0,
            prev_t: 0.0,
            series: Series::new("cn0_dbhz", "dB-Hz", Some(label)),
            s_drop: Series::new("cn0_cusum_drop", "1", Some(label)),
            s_rise: Series::new("cn0_cusum_rise", "1", Some(label)),
            drop: Cusum::new("cn0_drop"),
            rise: Cusum::new("cn0_rise"),
        }
    }

    /// The baseline mean and spread (dB-Hz, dB), once learned.
    pub fn reference(&self) -> Option<(f64, f64)> {
        self.reference
    }

    /// Feed one C/N0 estimate (dB-Hz) at time `t_s`.
    pub fn push(&mut self, t_s: f64, cn0_dbhz: f64) {
        if !cn0_dbhz.is_finite() {
            return;
        }
        self.series.push(t_s, cn0_dbhz);
        let t0 = *self.t0.get_or_insert(t_s);
        let take = self.n_seen % self.settings.stride.max(1) as u64 == 0;
        self.n_seen += 1;
        if !take {
            return;
        }
        match self.reference {
            None => {
                self.baseline.push(cn0_dbhz);
                if t_s - t0 >= self.settings.baseline_s && self.baseline.count() >= 2 {
                    self.reference = Some((
                        self.baseline.mean(),
                        self.baseline.std().max(self.settings.sigma_floor_db),
                    ));
                }
            }
            Some((mu, sd)) => {
                let z = (cn0_dbhz - mu) / sd;
                let k = self.settings.shift_db / (2.0 * sd);
                let h = self.settings.h;
                self.drop.push(&self.label, t_s, -z, k, h, self.prev_t);
                self.rise.push(&self.label, t_s, z, k, h, self.prev_t);
                self.s_drop.push(t_s, self.drop.g);
                self.s_rise.push(t_s, self.rise.g);
            }
        }
        self.prev_t = t_s;
    }

    /// The events so far.
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = self.drop.events();
        v.extend(self.rise.events());
        v
    }

    /// The series, events and notes.
    pub fn report(&self) -> MonitorReport {
        let mut notes = Vec::new();
        let l = &self.label;
        match self.reference {
            Some((mu, sd)) => {
                let k = self.settings.shift_db / (2.0 * sd);
                notes.push((format!("cn0.{l}.baseline_dbhz"), format!("{mu:.3}")));
                notes.push((format!("cn0.{l}.sigma_db"), format!("{sd:.3}")));
                notes.push((
                    format!("cn0.{l}.arl0_samples_independent"),
                    format!("{:.0}", stats::cusum_arl0(k, self.settings.h)),
                ));
                notes.push((
                    format!("cn0.{l}.arl1_samples_independent"),
                    format!(
                        "{:.1}",
                        stats::cusum_arl(k, self.settings.h, self.settings.shift_db / sd)
                    ),
                ));
            }
            None => notes.push((format!("cn0.{l}.baseline"), "not reached".into())),
        }
        let mut r = MonitorReport {
            series: vec![
                self.series.clone(),
                self.s_drop.clone(),
                self.s_rise.clone(),
            ],
            events: self.events(),
            spectra: Vec::new(),
            notes,
        };
        r.events.sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
        r
    }
}
