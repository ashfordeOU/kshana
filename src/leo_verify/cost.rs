// SPDX-License-Identifier: AGPL-3.0-only
//! Subscription cost against resilience: for each timing option (an oscillator, optionally with a LEO
//! timing subscription) and each GNSS outage length, whether the option holds a time-error threshold,
//! next to its cost of ownership.
//!
//! An option without LEO coasts on its oscillator from the GNSS-locked state for the whole outage:
//! it holds when the predicted error of [`super::burst::predicted_error_s`] (coverage factor times the
//! one-sigma coast error, flicker floor included, plus the uncompensated ageing) at the outage length
//! is under the threshold. An option with LEO receives a LEO time measurement every `interval_s`
//! during the outage with the stated probability that the LEO service is usable through the event
//! (`availability`, a stated input: it is the share of outage events the buyer expects not to affect
//! the LEO signal too); while usable, the error is bounded by the coast over one interval from the LEO
//! measurement's one-sigma. The probability of holding is then
//! `availability · [LEO bound holds] + (1 − availability) · [clock alone holds]`.
//!
//! Cost of ownership is `capex + annual · years` in the currency of the inputs; no discounting. The
//! report is unranked: it lists the options that no other option beats on both cost and the mean
//! probability of holding over the stated outages (the non-dominated set) and leaves the choice to the
//! reader. MODELLED.

use super::burst::{clock_noise, longest_coast_s, predicted_error_s};
use super::{field_err, list_len, non_negative, positive, within};
use crate::oscillator::ClockRef;
use serde::{Deserialize, Serialize};

/// LEO timing aiding of one option.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LeoAiding {
    /// Longest time between LEO time measurements (s).
    pub interval_s: f64,
    /// One-sigma of one LEO time measurement (ns).
    pub sigma_ns: f64,
    /// Probability that the LEO service stays usable through a GNSS outage event (0 to 1).
    pub availability: f64,
}

/// One timing option.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct CostOption {
    /// A short name.
    pub id: String,
    /// The oscillator: a preset id or a datasheet.
    pub clock: ClockRef,
    /// One-off cost.
    pub capex: f64,
    /// Yearly cost (subscription, maintenance).
    #[serde(default)]
    pub annual: f64,
    /// LEO timing aiding, when the option has it.
    #[serde(default)]
    pub leo: Option<LeoAiding>,
}

fn d_k() -> f64 {
    2.0
}
fn d_locked() -> f64 {
    10.0
}

/// Input of `kshana leo-verify cost`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct CostInput {
    /// Time-error threshold (ns).
    pub threshold_ns: f64,
    /// Coverage factor on the predicted one-sigma.
    #[serde(default = "d_k")]
    pub coverage_factor: f64,
    /// One-sigma of the time error while GNSS-locked, the state an outage starts from (ns).
    #[serde(default = "d_locked")]
    pub locked_sigma_ns: f64,
    /// Years of ownership.
    pub years: f64,
    /// GNSS outage lengths to test (hours).
    pub outage_hours: Vec<f64>,
    /// The options.
    pub options: Vec<CostOption>,
}

/// One option against one outage length.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OutageRow {
    /// Outage length (h).
    pub outage_h: f64,
    /// Predicted error after coasting the whole outage on the clock alone (ns).
    pub clock_only_error_ns: f64,
    /// Whether the clock alone holds the threshold.
    pub clock_only_holds: bool,
    /// Probability of holding the threshold, LEO aiding included.
    pub probability_holds: f64,
}

/// One option's results.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OptionReport {
    /// The option.
    pub id: String,
    /// The oscillator.
    pub clock: String,
    /// Cost of ownership over the stated years.
    pub cost_of_ownership: f64,
    /// Longest outage the clock alone holds (h).
    pub clock_only_holdover_h: f64,
    /// Predicted bound between LEO measurements (ns), when the option has LEO aiding.
    pub leo_bound_ns: Option<f64>,
    /// Whether that bound is under the threshold.
    pub leo_bound_holds: Option<bool>,
    /// Per outage length.
    pub outages: Vec<OutageRow>,
    /// Mean probability of holding over the stated outage lengths.
    pub mean_probability_holds: f64,
    /// Whether no other option is at most as costly and at least as likely to hold, with one of the
    /// two strictly better.
    pub non_dominated: bool,
}

/// Report of `kshana leo-verify cost`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CostReport {
    /// Threshold (ns).
    pub threshold_ns: f64,
    /// Coverage factor.
    pub coverage_factor: f64,
    /// Years of ownership.
    pub years: f64,
    /// The options, in input order.
    pub options: Vec<OptionReport>,
}

/// Run the calculator.
pub fn run(inp: &CostInput) -> Result<CostReport, String> {
    positive("threshold_ns", inp.threshold_ns)?;
    positive("coverage_factor", inp.coverage_factor)?;
    non_negative("locked_sigma_ns", inp.locked_sigma_ns)?;
    within("years", inp.years, 0.0, 100.0)?;
    list_len("outage_hours", inp.outage_hours.len(), 100)?;
    list_len("options", inp.options.len(), 100)?;
    for &h in &inp.outage_hours {
        within("outage_hours", h, 0.0, 87_660.0)?;
    }
    let (thr, k) = (inp.threshold_ns * 1e-9, inp.coverage_factor);
    let locked = inp.locked_sigma_ns * 1e-9;
    let mut out = Vec::with_capacity(inp.options.len());
    for o in &inp.options {
        non_negative("options.capex", o.capex)?;
        non_negative("options.annual", o.annual)?;
        let (spec, noise) = clock_noise(&o.clock)?;
        let leo = match &o.leo {
            Some(l) => {
                positive("options.leo.interval_s", l.interval_s)?;
                positive("options.leo.sigma_ns", l.sigma_ns)?;
                within("options.leo.availability", l.availability, 0.0, 1.0)?;
                let b = predicted_error_s(&noise, l.sigma_ns * 1e-9, k, l.interval_s);
                Some((l.availability, b))
            }
            None => None,
        };
        let outages: Vec<OutageRow> = inp
            .outage_hours
            .iter()
            .map(|&h| {
                let e = predicted_error_s(&noise, locked, k, h * 3600.0);
                let clock_holds = e <= thr;
                let c = if clock_holds { 1.0 } else { 0.0 };
                let p = match leo {
                    Some((a, b)) => a * if b <= thr { 1.0 } else { 0.0 } + (1.0 - a) * c,
                    None => c,
                };
                OutageRow {
                    outage_h: h,
                    clock_only_error_ns: e * 1e9,
                    clock_only_holds: clock_holds,
                    probability_holds: p,
                }
            })
            .collect();
        let mean = outages.iter().map(|r| r.probability_holds).sum::<f64>() / outages.len() as f64;
        out.push(OptionReport {
            id: o.id.clone(),
            clock: spec.id,
            cost_of_ownership: o.capex + o.annual * inp.years,
            clock_only_holdover_h: longest_coast_s(&noise, locked, k, thr) / 3600.0,
            leo_bound_ns: leo.map(|(_, b)| b * 1e9),
            leo_bound_holds: leo.map(|(_, b)| b <= thr),
            outages,
            mean_probability_holds: mean,
            non_dominated: true,
        });
    }
    let pts: Vec<(f64, f64)> = out
        .iter()
        .map(|o| (o.cost_of_ownership, o.mean_probability_holds))
        .collect();
    for (i, o) in out.iter_mut().enumerate() {
        let (ci, pi) = pts[i];
        o.non_dominated = !pts
            .iter()
            .enumerate()
            .any(|(j, &(cj, pj))| j != i && cj <= ci && pj >= pi && (cj < ci || pj > pi));
    }
    if out.is_empty() {
        return Err(field_err("options", 0.0));
    }
    Ok(CostReport {
        threshold_ns: inp.threshold_ns,
        coverage_factor: k,
        years: inp.years,
        options: out,
    })
}
