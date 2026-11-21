// SPDX-License-Identifier: AGPL-3.0-only
//! LEO-burst timing simulator: a timing receiver that sees its LEO time source only in short bursts
//! (a pass, a paging slot, a subscription window), coasting on its own oscillator in between.
//!
//! Each epoch carries one clock measurement of the stated one-sigma while a burst is open and none
//! otherwise (and none during a stated outage, for example indoors or under interference). The run is
//! the two-state (phase, frequency) Kalman filter and seeded truth clock of
//! [`crate::leo_fusion::timing::simulate_traced`], with the oscillator's white and random-walk
//! frequency levels from its datasheet Allan deviation ([`crate::slot_timing::ClockNoise::from_datasheet`]).
//! The report gives the time-error statistics over several seeds, the filter's predicted bound, the
//! TDEV and MTIE of the first run's time error ([`crate::telecom_timing`]), and the longest gap between
//! bursts after which the predicted error (coverage factor `k` times the one-sigma, plus the
//! uncompensated ageing `D t² / 2`) stays under the threshold, where the coast variance includes the
//! flicker floor ([`crate::slot_timing::ClockNoise::coast_variance`]).
//!
//! MODELLED. The simulated truth clock has no flicker frequency noise and no ageing (the filter's own
//! model), so the gap budget, which includes both, is the more conservative of the two figures.

use super::{field_err, list_len, non_negative, positive, work_limit};
use crate::oscillator::{ClockRef, OscSpec};
use crate::slot_timing::ClockNoise;
use crate::telecom_timing::{mtie_curve_ns, tdev_curve_ns, CurvePoint};
use serde::{Deserialize, Serialize};

/// A clock resolved to its datasheet and its noise levels.
pub(crate) fn clock_noise(c: &ClockRef) -> Result<(OscSpec, ClockNoise), String> {
    let spec = c.resolve()?;
    let noise = ClockNoise::from_datasheet(
        &spec.source,
        &spec.adev_points,
        spec.aging_per_day,
        spec.temp_coeff_per_k.unwrap_or(0.0),
    )?;
    Ok((spec, noise))
}

/// The time error (s) predicted after coasting `t` seconds from a state known to `sigma0_s`:
/// `k · sqrt(σ0² + σ_coast²(t)) + D t² / 2`.
pub(crate) fn predicted_error_s(noise: &ClockNoise, sigma0_s: f64, k: f64, t: f64) -> f64 {
    let d = noise.aging_per_day / 86_400.0;
    k * (sigma0_s * sigma0_s + noise.coast_variance(t))
        .max(0.0)
        .sqrt()
        + 0.5 * d * t * t
}

/// The longest coast (s) whose [`predicted_error_s`] stays at or under `threshold_s`: zero when the
/// starting state already exceeds it, capped at ten years.
pub(crate) fn longest_coast_s(noise: &ClockNoise, sigma0_s: f64, k: f64, threshold_s: f64) -> f64 {
    const CAP_S: f64 = 10.0 * 365.25 * 86_400.0;
    if predicted_error_s(noise, sigma0_s, k, 0.0) > threshold_s {
        return 0.0;
    }
    if predicted_error_s(noise, sigma0_s, k, CAP_S) <= threshold_s {
        return CAP_S;
    }
    let (mut lo, mut hi) = (0.0_f64, CAP_S);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if predicted_error_s(noise, sigma0_s, k, mid) <= threshold_s {
            lo = mid;
        } else {
            hi = mid;
        }
        if hi - lo < 1e-3 {
            break;
        }
    }
    lo
}

/// A regular burst pattern: a burst of `length_s` every `period_s`, the first at `offset_s`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RegularBursts {
    /// Time between burst starts (s).
    pub period_s: f64,
    /// Burst length (s).
    pub length_s: f64,
    /// One-sigma of one clock measurement during a burst (ns).
    pub sigma_ns: f64,
    /// Start of the first burst (s).
    #[serde(default)]
    pub offset_s: f64,
}

/// One explicit burst window.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct BurstWindow {
    /// Start (s from the run start).
    pub start_s: f64,
    /// Length (s).
    pub length_s: f64,
    /// One-sigma of one clock measurement in this window (ns).
    pub sigma_ns: f64,
}

/// A window with no LEO measurement at all (indoor, interference, a subscription lapse).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Outage {
    /// Start (s from the run start).
    pub start_s: f64,
    /// Length (s).
    pub length_s: f64,
}

fn d_step() -> f64 {
    1.0
}
fn d_k() -> f64 {
    2.0
}
fn d_runs() -> u64 {
    20
}
fn d_seed() -> u64 {
    1
}

/// Input of `kshana leo-verify burst-timing`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct BurstInput {
    /// The receiver oscillator: a preset id (`ocxo`, `rubidium`, `caesium`, `csac`) or a datasheet.
    pub clock: ClockRef,
    /// Length of the run (s).
    pub duration_s: f64,
    /// Epoch spacing (s).
    #[serde(default = "d_step")]
    pub step_s: f64,
    /// A regular burst pattern.
    #[serde(default)]
    pub bursts: Option<RegularBursts>,
    /// Explicit burst windows (added to the regular pattern).
    #[serde(default)]
    pub schedule: Vec<BurstWindow>,
    /// Windows with no measurement.
    #[serde(default)]
    pub outages: Vec<Outage>,
    /// Time-error threshold (ns), for example a stated application budget.
    pub threshold_ns: f64,
    /// Coverage factor applied to the predicted one-sigma.
    #[serde(default = "d_k")]
    pub coverage_factor: f64,
    /// One-sigma of the broadcast system-to-UTC offset (ns), a constant bias per run.
    #[serde(default)]
    pub utc_sigma_ns: f64,
    /// Number of seeded runs.
    #[serde(default = "d_runs")]
    pub runs: u64,
    /// First seed.
    #[serde(default = "d_seed")]
    pub seed: u64,
}

/// Report of `kshana leo-verify burst-timing`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BurstReport {
    /// The oscillator.
    pub clock: String,
    /// Where its figures come from.
    pub clock_source: String,
    /// Epochs per run.
    pub epochs: usize,
    /// Seeded runs.
    pub runs: u64,
    /// Fraction of epochs with a measurement.
    pub fraction_in_view: f64,
    /// Longest interval without a measurement (s).
    pub longest_gap_s: f64,
    /// Median over runs of the RMS time error after the first fix (ns).
    pub median_rms_ns: f64,
    /// Median over runs of the 95th percentile of the absolute time error (ns).
    pub median_p95_ns: f64,
    /// Largest absolute time error of any run (ns).
    pub worst_max_abs_ns: f64,
    /// Runs whose largest absolute time error exceeded the threshold.
    pub runs_over_threshold: u64,
    /// Fraction of all epochs (all runs) with an absolute time error above the threshold.
    pub epoch_fraction_over_threshold: f64,
    /// The filter's largest predicted one-sigma (ns), the UTC-offset term included.
    pub predicted_max_sigma_ns: f64,
    /// Coverage factor times that one-sigma (ns).
    pub predicted_bound_ns: f64,
    /// The threshold (ns).
    pub threshold_ns: f64,
    /// Coverage factor used.
    pub coverage_factor: f64,
    /// Whether the predicted bound is at or under the threshold.
    pub predicted_bound_within_threshold: bool,
    /// The filter's smallest predicted one-sigma during a burst (ns): the state a gap starts from.
    pub post_burst_sigma_ns: f64,
    /// Longest gap after a burst whose predicted error, flicker and ageing included, stays under
    /// the threshold (s).
    pub longest_gap_allowed_s: f64,
    /// Whether the longest gap of the schedule is within that.
    pub schedule_gap_within_allowed: bool,
    /// Ratio of the observed RMS normalised error to one (near one when the filter is consistent),
    /// median over runs.
    pub median_normalised_rms: f64,
    /// TDEV of the first run's time error (ns).
    pub tdev_ns: Vec<CurvePoint>,
    /// MTIE of the first run's time error (ns).
    pub mtie_ns: Vec<CurvePoint>,
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(|a, b| a.total_cmp(b));
    if v.is_empty() {
        return 0.0;
    }
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

impl BurstInput {
    fn validate(&self) -> Result<usize, String> {
        positive("duration_s", self.duration_s)?;
        positive("step_s", self.step_s)?;
        positive("threshold_ns", self.threshold_ns)?;
        positive("coverage_factor", self.coverage_factor)?;
        non_negative("utc_sigma_ns", self.utc_sigma_ns)?;
        if self.runs == 0 || self.runs > 1000 {
            return Err(field_err("runs", self.runs as f64));
        }
        if self.bursts.is_none() && self.schedule.is_empty() {
            return Err(field_err("schedule", 0.0));
        }
        if let Some(b) = &self.bursts {
            positive("bursts.period_s", b.period_s)?;
            positive("bursts.length_s", b.length_s)?;
            positive("bursts.sigma_ns", b.sigma_ns)?;
            non_negative("bursts.offset_s", b.offset_s)?;
        }
        if !self.schedule.is_empty() {
            list_len("schedule", self.schedule.len(), 100_000)?;
        }
        for w in &self.schedule {
            non_negative("schedule.start_s", w.start_s)?;
            positive("schedule.length_s", w.length_s)?;
            positive("schedule.sigma_ns", w.sigma_ns)?;
        }
        for o in &self.outages {
            non_negative("outages.start_s", o.start_s)?;
            positive("outages.length_s", o.length_s)?;
        }
        let epochs = (self.duration_s / self.step_s).floor() + 1.0;
        work_limit(epochs, 1.0e6)?;
        work_limit(epochs * self.runs as f64, 2.0e6)?;
        Ok(epochs as usize)
    }

    /// The measurement one-sigma (s) at every epoch, `None` with no measurement.
    pub fn measurements(&self, epochs: usize) -> Vec<Option<f64>> {
        (0..epochs)
            .map(|k| {
                let t = k as f64 * self.step_s;
                if self
                    .outages
                    .iter()
                    .any(|o| t >= o.start_s && t < o.start_s + o.length_s)
                {
                    return None;
                }
                let mut best: Option<f64> = None;
                let mut take = |s: f64| {
                    best = Some(best.map_or(s, |b: f64| b.min(s)));
                };
                if let Some(b) = &self.bursts {
                    if t >= b.offset_s && (t - b.offset_s).rem_euclid(b.period_s) < b.length_s {
                        take(b.sigma_ns * 1e-9);
                    }
                }
                for w in &self.schedule {
                    if t >= w.start_s && t < w.start_s + w.length_s {
                        take(w.sigma_ns * 1e-9);
                    }
                }
                best
            })
            .collect()
    }
}

/// Run the simulator.
pub fn run(inp: &BurstInput) -> Result<BurstReport, String> {
    let epochs = inp.validate()?;
    let (spec, noise) = clock_noise(&inp.clock)?;
    let meas = inp.measurements(epochs);
    let utc = inp.utc_sigma_ns * 1e-9;
    let thr = inp.threshold_ns;
    let (mut rms, mut p95, mut nrms) = (Vec::new(), Vec::new(), Vec::new());
    let (mut worst, mut runs_over, mut over, mut total) = (0.0_f64, 0u64, 0usize, 0usize);
    let mut first: Option<(crate::leo_fusion::timing::TimeTransferStats, Vec<f64>, f64)> = None;
    for r in 0..inp.runs {
        let (stats, trace) = crate::leo_fusion::timing::simulate_traced(
            &meas,
            inp.step_s,
            &noise,
            utc,
            inp.seed.wrapping_add(r),
        )?;
        rms.push(stats.rms_s * 1e9);
        p95.push(stats.p95_s * 1e9);
        nrms.push(stats.rms_normalised);
        worst = worst.max(stats.max_abs_s * 1e9);
        if stats.max_abs_s * 1e9 > thr {
            runs_over += 1;
        }
        over += trace.iter().filter(|e| e.error_ns.abs() > thr).count();
        total += trace.len();
        if first.is_none() {
            let post = trace
                .iter()
                .filter(|e| e.in_view)
                .map(|e| e.sigma_ns)
                .fold(f64::INFINITY, f64::min);
            first = Some((stats, trace.iter().map(|e| e.error_ns).collect(), post));
        }
    }
    let (stats, te, post_ns) = first.ok_or_else(|| field_err("runs", 0.0))?;
    let post_ns = if post_ns.is_finite() { post_ns } else { 0.0 };
    let k = inp.coverage_factor;
    let allowed = longest_coast_s(&noise, post_ns * 1e-9, k, thr * 1e-9);
    Ok(BurstReport {
        clock: spec.id,
        clock_source: spec.source,
        epochs,
        runs: inp.runs,
        fraction_in_view: stats.fraction_in_view,
        longest_gap_s: stats.longest_gap_s,
        median_rms_ns: median(rms),
        median_p95_ns: median(p95),
        worst_max_abs_ns: worst,
        runs_over_threshold: runs_over,
        epoch_fraction_over_threshold: over as f64 / total.max(1) as f64,
        predicted_max_sigma_ns: stats.max_predicted_sigma_s * 1e9,
        predicted_bound_ns: k * stats.max_predicted_sigma_s * 1e9,
        threshold_ns: thr,
        coverage_factor: k,
        predicted_bound_within_threshold: k * stats.max_predicted_sigma_s * 1e9 <= thr,
        post_burst_sigma_ns: post_ns,
        longest_gap_allowed_s: allowed,
        schedule_gap_within_allowed: stats.longest_gap_s <= allowed,
        median_normalised_rms: median(nrms),
        tdev_ns: tdev_curve_ns(&te, inp.step_s),
        mtie_ns: mtie_curve_ns(&te, inp.step_s),
    })
}
