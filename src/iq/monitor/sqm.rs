// SPDX-License-Identifier: AGPL-3.0-only
//! Signal-quality monitoring (SQM) from correlator outputs.
//!
//! Per loop update the in-phase parts of the early, prompt and late correlators give
//!
//! * the **delta** test `Δ = (I_E − I_L)/I_P` (0 for a symmetric correlation peak), and
//! * the **ratio** test `R = (I_E + I_L)/(2 I_P)` (`1 − d/2` for the ideal triangle at
//!   early-late spacing `d`),
//!
//! the two metrics of the classic SQM literature (Phelts, *Multicorrelator Techniques for
//! Robust Mitigation of Threats to GPS Signal Quality*, Stanford PhD thesis, 2001;
//! Mubarak & Dempster, 2010). When a channel supplies extra correlators at symmetric
//! offsets `±x` (see [`SqmMonitor::push`]), each pair adds an **asymmetry** test
//! `A_x = (I_{+x} − I_{−x})/I_P`. A Costas loop's 180° ambiguity flips every in-phase part
//! together, so the tests are unaffected by it.
//!
//! The per-update values are series `sqm_delta`, `sqm_ratio` (and `sqm_pair_<x>`). For
//! detection, each metric is averaged over `avg_epochs` updates; the baseline (the first
//! `baseline_s` seconds) sets its mean and the spread of the averaged metric, and an
//! averaged value further than `k_sigma` spreads from the mean for `min_count` updates
//! raises an `sqm_delta`, `sqm_ratio` or `sqm_pair` event. The spread used is the larger
//! of the baseline's measured spread and the closed-form thermal-noise spread
//! ([`super::stats::sqm_delta_sd`], [`super::stats::sqm_ratio_sd`]) at the channel's
//! C/N0, divided by `√avg_epochs`. (The delta test also sees the code loop's tracking
//! error, which the closed form leaves out; the measured spread covers it.)

use super::{stats, Baseline, MonitorEvent, MonitorReport, Series, Side, SpanDetector};
use crate::iq::Cf64;
use serde::{Deserialize, Serialize};
use std::collections::VecDeque;

/// Settings of [`SqmMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct SqmSettings {
    /// Updates averaged for detection.
    pub avg_epochs: usize,
    /// Length of the baseline (s from the first update).
    pub baseline_s: f64,
    /// Departure (in spreads) that counts.
    pub k_sigma: f64,
    /// Consecutive averaged values past the threshold needed.
    pub min_count: usize,
}

impl Default for SqmSettings {
    /// 100-update average, 2 s baseline, 6 spreads, 10 updates.
    fn default() -> Self {
        SqmSettings {
            avg_epochs: 100,
            baseline_s: 2.0,
            k_sigma: 6.0,
            min_count: 10,
        }
    }
}

/// One metric: per-update series, running average, baseline and detector.
struct Metric {
    name: String,
    series: Series,
    avg: VecDeque<f64>,
    sum: f64,
    base_avg: Baseline,
    base_cn0t: Baseline,
    reference: Option<(f64, f64)>,
    det: Option<SpanDetector>,
    /// Closed-form per-update spread at a given C/N0·T.
    thermal: Box<dyn Fn(f64) -> f64 + Send>,
}

impl Metric {
    fn new(name: &str, label: &str, thermal: Box<dyn Fn(f64) -> f64 + Send>) -> Self {
        Metric {
            name: name.to_string(),
            series: Series::new(name, "1", Some(label)),
            avg: VecDeque::new(),
            sum: 0.0,
            base_avg: Baseline::default(),
            base_cn0t: Baseline::default(),
            reference: None,
            det: None,
            thermal,
        }
    }

    #[allow(clippy::too_many_arguments)]
    fn push(
        &mut self,
        label: &str,
        st: &SqmSettings,
        t: f64,
        in_baseline: bool,
        v: f64,
        cn0t: Option<f64>,
        kind: &str,
    ) {
        if !v.is_finite() {
            return;
        }
        self.series.push(t, v);
        self.avg.push_back(v);
        self.sum += v;
        if self.avg.len() > st.avg_epochs.max(1) {
            self.sum -= self.avg.pop_front().expect("non-empty");
        }
        if self.avg.len() < st.avg_epochs.max(1) {
            return;
        }
        let m = self.sum / self.avg.len() as f64;
        match self.reference {
            None if in_baseline => {
                self.base_avg.push(m);
                if let Some(c) = cn0t {
                    self.base_cn0t.push(c);
                }
            }
            None => {
                if self.base_avg.count() < 2 {
                    return;
                }
                let thermal = if self.base_cn0t.count() > 0 {
                    (self.thermal)(self.base_cn0t.mean()) / (st.avg_epochs.max(1) as f64).sqrt()
                } else {
                    0.0
                };
                let sd = self.base_avg.std().max(thermal).max(1e-12);
                self.reference = Some((self.base_avg.mean(), sd));
                self.det = Some(SpanDetector::new(
                    kind,
                    Some(label),
                    Side::Above,
                    st.k_sigma,
                    st.min_count,
                ));
                self.detect(t, m);
            }
            Some(_) => self.detect(t, m),
        }
    }

    fn detect(&mut self, t: f64, m: f64) {
        if let (Some((mu, sd)), Some(d)) = (self.reference, self.det.as_mut()) {
            d.push(t, ((m - mu) / sd).abs());
        }
    }
}

/// The SQM monitor of one channel (see the module docs).
pub struct SqmMonitor {
    label: String,
    settings: SqmSettings,
    spacing: f64,
    t0: Option<f64>,
    delta: Metric,
    ratio: Metric,
    pairs: Vec<(f64, Metric)>,
}

impl SqmMonitor {
    /// A monitor for channel `label` of a loop with early-late spacing `spacing_chips`.
    pub fn new(label: &str, spacing_chips: f64, settings: SqmSettings) -> Self {
        let d = spacing_chips;
        SqmMonitor {
            label: label.to_string(),
            settings,
            spacing: d,
            t0: None,
            delta: Metric::new(
                "sqm_delta",
                label,
                Box::new(move |c| stats::sqm_delta_sd(d, c)),
            ),
            ratio: Metric::new(
                "sqm_ratio",
                label,
                Box::new(move |c| stats::sqm_ratio_sd(d, c)),
            ),
            pairs: Vec::new(),
        }
    }

    /// The early-late spacing (chips).
    pub fn spacing_chips(&self) -> f64 {
        self.spacing
    }

    /// The baseline (mean, spread of the averaged metric) of the delta and ratio tests.
    pub fn references(&self) -> (Option<(f64, f64)>, Option<(f64, f64)>) {
        (self.delta.reference, self.ratio.reference)
    }

    /// Feed one loop update at time `t_s` with integration time `t_coh_s`, its early,
    /// prompt and late correlators, the channel's C/N0 estimate (for the closed-form
    /// spread), and any extra correlators as `(offset_chips, value)`: each pair of
    /// offsets `±x` adds an asymmetry test (unpaired taps are ignored).
    #[allow(clippy::too_many_arguments)]
    pub fn push(
        &mut self,
        t_s: f64,
        t_coh_s: f64,
        early: Cf64,
        prompt: Cf64,
        late: Cf64,
        cn0_dbhz: Option<f64>,
        extra: &[(f64, Cf64)],
    ) {
        if prompt.re == 0.0 {
            return;
        }
        let t0 = *self.t0.get_or_insert(t_s);
        let in_baseline = t_s - t0 < self.settings.baseline_s;
        let cn0t = cn0_dbhz.map(|c| 10f64.powf(c / 10.0) * t_coh_s);
        let ip = prompt.re;
        let st = self.settings;
        let label = self.label.clone();
        self.delta.push(
            &label,
            &st,
            t_s,
            in_baseline,
            (early.re - late.re) / ip,
            cn0t,
            "sqm_delta",
        );
        self.ratio.push(
            &label,
            &st,
            t_s,
            in_baseline,
            (early.re + late.re) / (2.0 * ip),
            cn0t,
            "sqm_ratio",
        );
        for &(x, vp) in extra.iter().filter(|(x, _)| *x > 0.0) {
            let Some(&(_, vm)) = extra.iter().find(|(y, _)| (y + x).abs() < 1e-9) else {
                continue;
            };
            let idx = match self.pairs.iter().position(|(px, _)| (px - x).abs() < 1e-9) {
                Some(i) => i,
                None => {
                    let name = format!("sqm_pair_{x}");
                    self.pairs.push((
                        x,
                        Metric::new(&name, &label, Box::new(move |c| stats::sqm_pair_sd(x, c))),
                    ));
                    self.pairs.len() - 1
                }
            };
            self.pairs[idx].1.push(
                &label,
                &st,
                t_s,
                in_baseline,
                (vp.re - vm.re) / ip,
                cn0t,
                "sqm_pair",
            );
        }
    }

    /// The events so far.
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = Vec::new();
        for m in [&self.delta, &self.ratio]
            .into_iter()
            .chain(self.pairs.iter().map(|(_, m)| m))
        {
            if let Some(d) = &m.det {
                v.extend(d.events());
            }
        }
        v
    }

    /// The series, events and notes.
    pub fn report(&self) -> MonitorReport {
        let mut series = vec![self.delta.series.clone(), self.ratio.series.clone()];
        series.extend(self.pairs.iter().map(|(_, m)| m.series.clone()));
        let mut notes = vec![(
            format!("sqm.{}.spacing_chips", self.label),
            format!("{}", self.spacing),
        )];
        for m in [&self.delta, &self.ratio]
            .into_iter()
            .chain(self.pairs.iter().map(|(_, m)| m))
        {
            if let Some((mu, sd)) = m.reference {
                notes.push((
                    format!("sqm.{}.{}.baseline", self.label, m.name),
                    format!("{mu:.6} ± {sd:.2e} (averaged)"),
                ));
            }
        }
        let mut r = MonitorReport {
            series,
            events: self.events(),
            spectra: Vec::new(),
            notes,
        };
        r.events.sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
        r
    }
}
