// SPDX-License-Identifier: AGPL-3.0-only
//! **Interference and spoofing detection monitors on received IQ.**
//!
//! Every monitor here *observes* a recording or the tracking bank's outputs and reports
//! time series plus flagged events; nothing here generates or alters a signal.
//!
//! * [`power::PowerMonitor`] — total received power per block and the gain an ideal AGC
//!   would apply to hold the baseline level; flags a rise or a drop.
//! * [`spectral::SpectralMonitor`] — pre-correlation spectrum (Welch PSD per block against
//!   a baseline PSD), complex kurtosis and a pulse (impulse) detector.
//! * [`cn0::Cn0Monitor`] — per-channel C/N0 series with two one-sided CUSUM change
//!   detectors (drop and rise).
//! * [`sqm::SqmMonitor`] — signal-quality monitoring from the correlator outputs: the delta
//!   `(I_E − I_L)/I_P` and ratio `(I_E + I_L)/(2 I_P)` tests, plus symmetric-pair
//!   asymmetry tests from extra correlators when a channel supplies them.
//! * [`lock::LockMonitor`] — lock-indicator time series (phase lock indicator, a frequency
//!   lock indicator from successive prompts, lock flags) with loss-of-lock and re-lock
//!   events and their durations.
//!
//! The pre-correlation monitors are fed samples ([`power::PowerMonitor::push`],
//! [`spectral::SpectralMonitor::push`]); the post-correlation ones are fed the per-epoch
//! outputs of [`crate::iq::track`] ([`EpochMonitors::push_epoch`] routes an
//! [`crate::iq::track::EpochOutput`] to all three). Each monitor learns its reference from
//! the first `baseline_s` seconds it sees, then flags departures; [`MonitorReport`]
//! collects the series and events of all of them.
//!
//! Status: MODELLED. Each statistic is checked by seeded simulation against its closed
//! form ([`stats`]): the block-power false-alarm probability (Gamma tail), the
//! spectral-excess false-alarm rate (an approximate Gamma closed form, measured at 1.3
//! times the formula), the complex
//! kurtosis of Gaussian noise (2, standard deviation `2/√N`), the exponential tail of
//! `|x|²` behind the pulse detector, Siegmund's CUSUM average run length, the Rician-phase
//! mean of `cos 2θ` behind the phase lock indicator, and the delta and ratio test noise
//! from the early/prompt/late noise correlation. No comparison with an external receiver's
//! monitors is claimed. Thresholds are statistical (false-alarm figures follow from the
//! closed forms for white Gaussian noise); real front ends add filtering and quantisation
//! that move the baselines, which is why every monitor learns its baseline from the data.

pub mod cn0;
pub mod lock;
pub mod power;
pub mod spectral;
pub mod sqm;
pub mod stats;

use serde::{Deserialize, Serialize};

/// `|s|²`.
pub(crate) fn norm_sqr(s: crate::iq::Cf64) -> f64 {
    s.re * s.re + s.im * s.im
}

/// One named time series.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Series {
    /// Which monitor and quantity, e.g. `power_db` or `sqm_ratio`.
    pub name: String,
    /// Unit of the values (`dB`, `dB-Hz`, `1`, `Hz`).
    pub unit: String,
    /// The channel (satellite) label for a post-correlation series; `None` for the
    /// whole recording.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// Time of each value (s from the start of the recording).
    pub t_s: Vec<f64>,
    /// The values.
    pub value: Vec<f64>,
}

impl Series {
    /// An empty series.
    pub fn new(name: &str, unit: &str, channel: Option<&str>) -> Self {
        Series {
            name: name.to_string(),
            unit: unit.to_string(),
            channel: channel.map(str::to_string),
            t_s: Vec::new(),
            value: Vec::new(),
        }
    }

    /// Append one value.
    pub fn push(&mut self, t_s: f64, v: f64) {
        self.t_s.push(t_s);
        self.value.push(v);
    }
}

/// One flagged event: a span during which a monitor's statistic stayed past its
/// threshold.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct MonitorEvent {
    /// The event kind, e.g. `power_rise`, `cn0_drop`, `loss_of_phase_lock`.
    pub kind: String,
    /// The channel (satellite) label for a post-correlation event.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<String>,
    /// Start of the span (s): the first sample past the threshold, or for a CUSUM the
    /// estimated change time (the last time the statistic left zero).
    pub t_start_s: f64,
    /// When the monitor raised the alarm (s): `t_start_s` plus the samples the
    /// confirmation rule needed.
    pub t_alarm_s: f64,
    /// End of the span (s), `None` if it lasted to the end of the data.
    pub t_end_s: Option<f64>,
    /// The most extreme value of the statistic during the span.
    pub peak: f64,
    /// The threshold it crossed.
    pub threshold: f64,
}

impl MonitorEvent {
    /// `t_end_s − t_start_s`, when the span ended.
    pub fn duration_s(&self) -> Option<f64> {
        self.t_end_s.map(|e| e - self.t_start_s)
    }
}

/// Which side of the threshold counts as "past" it.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Side {
    /// Values above the threshold.
    Above,
    /// Values below the threshold.
    Below,
}

/// A threshold detector with a confirmation count: a span opens once `min_count`
/// consecutive values are past the threshold (the span starts at the first of them) and
/// closes at the first value back on the other side.
#[derive(Clone, Debug)]
pub struct SpanDetector {
    kind: String,
    channel: Option<String>,
    side: Side,
    threshold: f64,
    min_count: usize,
    run: Option<(f64, usize, f64)>,
    open: Option<MonitorEvent>,
    events: Vec<MonitorEvent>,
}

impl SpanDetector {
    /// A detector named `kind` flagging values past `threshold` on `side` for at least
    /// `min_count` (at least 1) consecutive samples.
    pub fn new(
        kind: &str,
        channel: Option<&str>,
        side: Side,
        threshold: f64,
        min_count: usize,
    ) -> Self {
        SpanDetector {
            kind: kind.to_string(),
            channel: channel.map(str::to_string),
            side,
            threshold,
            min_count: min_count.max(1),
            run: None,
            open: None,
            events: Vec::new(),
        }
    }

    fn past(&self, v: f64) -> bool {
        match self.side {
            Side::Above => v > self.threshold,
            Side::Below => v < self.threshold,
        }
    }

    fn more_extreme(&self, a: f64, b: f64) -> f64 {
        match self.side {
            Side::Above => a.max(b),
            Side::Below => a.min(b),
        }
    }

    /// Feed one value at time `t_s`.
    pub fn push(&mut self, t_s: f64, v: f64) {
        if !v.is_finite() {
            return;
        }
        if self.past(v) {
            if let Some(ev) = self.open.as_mut() {
                ev.peak = match self.side {
                    Side::Above => ev.peak.max(v),
                    Side::Below => ev.peak.min(v),
                };
                return;
            }
            let (t0, n, peak) = match self.run {
                Some((t0, n, p)) => (t0, n + 1, self.more_extreme(p, v)),
                None => (t_s, 1, v),
            };
            if n >= self.min_count {
                self.open = Some(MonitorEvent {
                    kind: self.kind.clone(),
                    channel: self.channel.clone(),
                    t_start_s: t0,
                    t_alarm_s: t_s,
                    t_end_s: None,
                    peak,
                    threshold: self.threshold,
                });
                self.run = None;
            } else {
                self.run = Some((t0, n, peak));
            }
        } else {
            self.run = None;
            if let Some(mut ev) = self.open.take() {
                ev.t_end_s = Some(t_s);
                self.events.push(ev);
            }
        }
    }

    /// The events so far, including a span still open (with no end).
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = self.events.clone();
        v.extend(self.open.clone());
        v
    }
}

/// Mean and sample standard deviation of a baseline, accumulated one value at a time
/// (Welford).
#[derive(Clone, Copy, Debug, Default)]
pub struct Baseline {
    n: u64,
    mean: f64,
    m2: f64,
}

impl Baseline {
    /// Add one value (non-finite values are skipped).
    pub fn push(&mut self, v: f64) {
        if !v.is_finite() {
            return;
        }
        self.n += 1;
        let d = v - self.mean;
        self.mean += d / self.n as f64;
        self.m2 += d * (v - self.mean);
    }

    /// Values accumulated.
    pub fn count(&self) -> u64 {
        self.n
    }

    /// The mean (0 when empty).
    pub fn mean(&self) -> f64 {
        self.mean
    }

    /// The sample standard deviation (0 with fewer than two values).
    pub fn std(&self) -> f64 {
        if self.n < 2 {
            0.0
        } else {
            (self.m2 / (self.n - 1) as f64).sqrt()
        }
    }
}

/// The series and events of a set of monitors.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct MonitorReport {
    /// Every time series.
    pub series: Vec<Series>,
    /// Every event, sorted by start time.
    pub events: Vec<MonitorEvent>,
    /// Spectra (frequency-domain series), e.g. the baseline and max-hold PSDs.
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub spectra: Vec<Spectrum>,
    /// Per-monitor settings and baselines as learned (name → value), for provenance.
    pub notes: Vec<(String, String)>,
}

/// One spectrum: values against frequency.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Spectrum {
    /// What it is, e.g. `psd_baseline_db`.
    pub name: String,
    /// Bin frequencies relative to the recording centre (Hz).
    pub freq_hz: Vec<f64>,
    /// Values (dB).
    pub value_db: Vec<f64>,
}

impl MonitorReport {
    /// Merge `other` into this report.
    pub fn extend(&mut self, other: MonitorReport) {
        self.series.extend(other.series);
        self.events.extend(other.events);
        self.spectra.extend(other.spectra);
        self.notes.extend(other.notes);
        self.events
            .sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
    }

    /// The series named `name` (for channel `channel`, when given).
    pub fn series_named(&self, name: &str, channel: Option<&str>) -> Option<&Series> {
        self.series
            .iter()
            .find(|s| s.name == name && (channel.is_none() || s.channel.as_deref() == channel))
    }

    /// The events of kind `kind`.
    pub fn events_of(&self, kind: &str) -> Vec<&MonitorEvent> {
        self.events.iter().filter(|e| e.kind == kind).collect()
    }

    /// JSON of the whole report.
    pub fn to_json(&self) -> Result<String, crate::iq::IqError> {
        serde_json::to_string_pretty(self).map_err(|e| crate::iq::IqError::Format(e.to_string()))
    }

    /// The series as long-format CSV: `series,channel,unit,t_s,value`.
    pub fn series_csv(&self) -> String {
        let mut out = String::from("series,channel,unit,t_s,value\n");
        for s in &self.series {
            let ch = s.channel.as_deref().unwrap_or("");
            for (t, v) in s.t_s.iter().zip(&s.value) {
                out.push_str(&format!("{},{ch},{},{t},{v}\n", s.name, s.unit));
            }
        }
        out
    }

    /// The events as CSV: `kind,channel,t_start_s,t_alarm_s,t_end_s,peak,threshold`.
    pub fn events_csv(&self) -> String {
        let mut out = String::from("kind,channel,t_start_s,t_alarm_s,t_end_s,peak,threshold\n");
        for e in &self.events {
            out.push_str(&format!(
                "{},{},{},{},{},{},{}\n",
                e.kind,
                e.channel.as_deref().unwrap_or(""),
                e.t_start_s,
                e.t_alarm_s,
                e.t_end_s.map(|v| v.to_string()).unwrap_or_default(),
                e.peak,
                e.threshold
            ));
        }
        out
    }
}

/// The post-correlation monitors of one tracking channel, fed one
/// [`crate::iq::track::EpochOutput`] at a time.
pub struct EpochMonitors {
    /// The C/N0 change detector.
    pub cn0: cn0::Cn0Monitor,
    /// The signal-quality monitor.
    pub sqm: sqm::SqmMonitor,
    /// The lock monitor.
    pub lock: lock::LockMonitor,
}

impl EpochMonitors {
    /// Monitors for channel `label` of a loop with early-late spacing `spacing_chips`,
    /// with the given settings.
    pub fn new(label: &str, spacing_chips: f64, settings: &EpochMonitorSettings) -> Self {
        EpochMonitors {
            cn0: cn0::Cn0Monitor::new(label, settings.cn0),
            sqm: sqm::SqmMonitor::new(label, spacing_chips, settings.sqm),
            lock: lock::LockMonitor::new(label, settings.lock),
        }
    }

    /// Feed one tracking-loop update. The C/N0 monitor takes the NWPR estimate.
    pub fn push_epoch(&mut self, e: &crate::iq::track::EpochOutput) {
        let t = e.code_epoch_s;
        if let Some(c) = e.cn0_nwpr_dbhz {
            self.cn0.push(t, c);
        }
        self.sqm.push(
            t,
            e.t_coh_s,
            e.early,
            e.prompt,
            e.late,
            e.cn0_nwpr_dbhz,
            &[],
        );
        self.lock
            .push(t, e.prompt, e.pli, e.phase_lock, e.code_lock);
    }

    /// The report of the three monitors.
    pub fn report(&self) -> MonitorReport {
        let mut r = self.cn0.report();
        r.extend(self.sqm.report());
        r.extend(self.lock.report());
        r
    }
}

/// Settings of the three post-correlation monitors.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct EpochMonitorSettings {
    /// C/N0 change detection.
    #[serde(default)]
    pub cn0: cn0::Cn0Settings,
    /// Signal-quality monitoring.
    #[serde(default)]
    pub sqm: sqm::SqmSettings,
    /// Lock monitoring.
    #[serde(default)]
    pub lock: lock::LockSettings,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn span_detector_confirms_and_closes() {
        let mut d = SpanDetector::new("x", None, Side::Above, 1.0, 3);
        for (k, v) in [0.0, 2.0, 2.0, 0.5, 2.0, 3.0, 2.5, 4.0, 0.0, 2.0]
            .iter()
            .enumerate()
        {
            d.push(k as f64, *v);
        }
        let ev = d.events();
        assert_eq!(ev.len(), 1);
        assert_eq!(ev[0].t_start_s, 4.0);
        assert_eq!(ev[0].t_alarm_s, 6.0);
        assert_eq!(ev[0].t_end_s, Some(8.0));
        assert_eq!(ev[0].peak, 4.0);
        let mut b = SpanDetector::new("y", Some("G01"), Side::Below, 0.0, 1);
        b.push(0.0, -1.0);
        b.push(1.0, -3.0);
        let ev = b.events();
        assert_eq!(ev[0].t_end_s, None);
        assert_eq!(ev[0].peak, -3.0);
    }

    #[test]
    fn baseline_is_welford() {
        let mut b = Baseline::default();
        for v in [1.0, 2.0, 3.0, 4.0, f64::NAN] {
            b.push(v);
        }
        assert_eq!(b.count(), 4);
        assert!((b.mean() - 2.5).abs() < 1e-15);
        assert!((b.std() - (5.0f64 / 3.0).sqrt()).abs() < 1e-15);
    }
}
