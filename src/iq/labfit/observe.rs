// SPDX-License-Identifier: AGPL-3.0-only
//! Per-satellite observations read from a receiver-trust [`Timeline`]: nominal C/N0,
//! the observed first loss of lock after onset, the reacquisition after it, and the
//! reported C/N0 samples under interference.
//!
//! A satellite is **tracked** at an epoch when the log reports a C/N0 for it there. Only
//! satellites tracked at the last epoch before onset are followed. Because the log is
//! sampled, an observed event time is the midpoint between the last epoch in the old
//! state and the first epoch in the new one; the true time lies within half an epoch
//! interval of it, and that quantisation is part of every reported residual.

use serde::Serialize;
use std::collections::BTreeMap;

use super::schema::{Conditions, ObserveCfg};
use crate::receiver_trust::Timeline;

/// What one satellite did in one run.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatObservation {
    /// Satellite identifier (`G05`).
    pub sat: String,
    /// Median reported C/N0 before onset (dB-Hz).
    pub nominal_cn0_dbhz: f64,
    /// Observed first loss of lock after onset (s, epoch midpoint).
    pub loss_s: Option<f64>,
    /// Observed reacquisition after that loss (s, epoch midpoint).
    pub reacq_s: Option<f64>,
    /// Last reported C/N0 before the loss (dB-Hz).
    pub last_cn0_before_loss_dbhz: Option<f64>,
    /// First reported C/N0 after the reacquisition (dB-Hz).
    pub first_cn0_after_reacq_dbhz: Option<f64>,
    /// Reported C/N0 at tracked epochs inside the event `(t_s, cn0_dbhz)`.
    #[serde(skip)]
    pub event_cn0: Vec<(f64, f64)>,
}

/// What was read from one run's timeline.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RunObservation {
    /// Epochs in the timeline.
    pub epochs: usize,
    /// Median spacing of epochs (s).
    pub epoch_interval_s: f64,
    /// Time of the last epoch (s): the end of the run.
    pub run_end_s: f64,
    /// Followed satellites, in identifier order.
    pub sats: Vec<SatObservation>,
    /// Why the run cannot be used, if it cannot.
    pub unusable: Option<String>,
}

fn median(mut v: Vec<f64>) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

/// C/N0 per satellite at one epoch, honouring the band filter.
fn epoch_map(ep: &crate::receiver_trust::LogEpoch, band: Option<&str>) -> BTreeMap<String, f64> {
    let mut m = BTreeMap::new();
    for s in &ep.cn0 {
        if band.is_some_and(|b| b != s.band) {
            continue;
        }
        m.entry(s.sat.clone()).or_insert(s.cn0_dbhz);
    }
    m
}

/// Read the observations of one run.
pub fn observe(timeline: &Timeline, cond: &Conditions, cfg: &ObserveCfg) -> RunObservation {
    let n = timeline.epochs.len();
    let run_end_s = timeline.epochs.last().map_or(0.0, |e| e.t_s);
    let dts: Vec<f64> = timeline
        .epochs
        .windows(2)
        .map(|w| w[1].t_s - w[0].t_s)
        .collect();
    let epoch_interval_s = median(dts).unwrap_or(0.0);
    let mut out = RunObservation {
        epochs: n,
        epoch_interval_s,
        run_end_s,
        sats: Vec::new(),
        unusable: None,
    };
    let maps: Vec<BTreeMap<String, f64>> = timeline
        .epochs
        .iter()
        .map(|e| epoch_map(e, cfg.band.as_deref()))
        .collect();
    if maps.iter().all(|m| m.is_empty()) {
        out.unusable = Some(format!(
            "the log carries no per-satellite C/N0{} (observables: [{}])",
            cfg.band
                .as_ref()
                .map_or(String::new(), |b| format!(" in band {b}")),
            timeline.observables.join(", ")
        ));
        return out;
    }
    let onset = cond.onset_s;
    let k_on = timeline.epochs.partition_point(|e| e.t_s < onset);
    if k_on == 0 {
        out.unusable = Some(format!("no epoch before the onset at {onset} s"));
        return out;
    }
    if k_on >= n {
        out.unusable = Some(format!("no epoch at or after the onset at {onset} s"));
        return out;
    }
    let pre_start = cfg.pre_window_s.map_or(f64::NEG_INFINITY, |w| onset - w);
    for (sat, _) in maps[k_on - 1].iter() {
        let pre: Vec<f64> = (0..k_on)
            .filter(|&k| timeline.epochs[k].t_s >= pre_start)
            .filter_map(|k| maps[k].get(sat).copied())
            .collect();
        let Some(nominal) = median(pre) else {
            continue;
        };
        let mut o = SatObservation {
            sat: sat.clone(),
            nominal_cn0_dbhz: nominal,
            loss_s: None,
            reacq_s: None,
            last_cn0_before_loss_dbhz: None,
            first_cn0_after_reacq_dbhz: None,
            event_cn0: Vec::new(),
        };
        let mut prev_t = timeline.epochs[k_on - 1].t_s;
        let mut prev_cn0 = maps[k_on - 1].get(sat).copied();
        let mut lost = false;
        for (ep, m) in timeline.epochs[k_on..].iter().zip(&maps[k_on..]) {
            let t = ep.t_s;
            let c = m.get(sat).copied();
            if let Some(c) = c {
                if cond.level_at(t).is_some() {
                    o.event_cn0.push((t, c));
                }
            }
            if !lost {
                if c.is_none() {
                    lost = true;
                    o.loss_s = Some(0.5 * (prev_t + t));
                    o.last_cn0_before_loss_dbhz = prev_cn0;
                }
            } else if o.reacq_s.is_none() {
                if let Some(c) = c {
                    o.reacq_s = Some(0.5 * (prev_t + t));
                    o.first_cn0_after_reacq_dbhz = Some(c);
                }
            }
            prev_t = t;
            prev_cn0 = c;
        }
        out.sats.push(o);
    }
    if out.sats.is_empty() {
        out.unusable = Some("no satellite tracked at the last epoch before onset".into());
    }
    out
}
