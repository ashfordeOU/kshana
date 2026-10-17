// SPDX-License-Identifier: AGPL-3.0-only
//! **Timing and ranging continuity through optical outages.** An optical link drops for the
//! duration of a cloud event; while it is down the user's clock coasts. This module couples the
//! outage-duration distribution of [`crate::optical_weather::OutageModel`] to the closed-form
//! coast variance of [`crate::holdover`], so every outage maps to a timing error
//! `σ_x(D) = coast_phase_sigma(q, D)` and a ranging error `c·σ_x`, with no new clock model.
//!
//! Outputs: the error at stated outage-duration quantiles, the holdover time `T_h` to the timing
//! threshold, the fraction of outages (and of outage time) that stay inside it, and the **timing
//! availability** — the fraction of all time the timing error is within the threshold:
//! `A_t = A + U · E[min(D, T_h)]/E[D]` (inside an outage the first `T_h` seconds are still good).

use crate::clock_state::ClockClass;
use crate::holdover::{coast_phase_sigma, holdover_seconds, phase_to_range_m, QuantumClockClass};
use crate::optical_weather::OutageModel;

/// Process-noise PSDs of a named clock: a [`ClockClass`] id or a [`QuantumClockClass`] id
/// (`optical-lattice`, `trapped-ion`, `mercury-ion`).
pub fn clock_psds(id: &str) -> Option<(f64, f64, f64)> {
    if let Some(c) = ClockClass::from_id(id) {
        return Some(c.psds());
    }
    match id.to_ascii_lowercase().as_str() {
        "optical-lattice" => Some(QuantumClockClass::OpticalLattice.psds()),
        "trapped-ion" => Some(QuantumClockClass::TrappedIon.psds()),
        "mercury-ion" => Some(QuantumClockClass::MercuryIon.psds()),
        _ => None,
    }
}

/// Error growth at one outage duration.
#[derive(Debug, Clone, PartialEq)]
pub struct OutageError {
    /// Label of the duration (`median`, `p90`, …).
    pub label: String,
    /// Outage duration (s).
    pub duration_s: f64,
    /// Timing error 1-σ (s).
    pub timing_sigma_s: f64,
    /// Ranging error 1-σ (m).
    pub range_sigma_m: f64,
}

/// Holdover coupling for one clock at one site.
#[derive(Debug, Clone, PartialEq)]
pub struct HoldoverCoupling {
    /// Clock id.
    pub clock: String,
    /// Timing threshold (s).
    pub threshold_s: f64,
    /// Holdover to the threshold (s).
    pub holdover_s: f64,
    /// Fraction of outages no longer than the holdover.
    pub fraction_outages_within: f64,
    /// Fraction of outage time spent in outages no longer than the holdover.
    pub fraction_outage_time_within: f64,
    /// Fraction of all time the timing error is within the threshold.
    pub timing_availability: f64,
    /// Error at the outage-duration quantiles.
    pub errors: Vec<OutageError>,
}

/// Couple an outage model and an optical availability `a` to a clock.
pub fn couple(
    clock: &str,
    availability: f64,
    outages: &OutageModel,
    threshold_s: f64,
) -> Option<HoldoverCoupling> {
    let (q_wf, q_rw, q_drift) = clock_psds(clock)?;
    let t_h = holdover_seconds(q_wf, q_rw, q_drift, threshold_s);
    let u = 1.0 - availability;
    let within = 1.0 - outages.exceedance(t_h);
    let time_within = 1.0 - outages.time_fraction_longer_than(t_h);
    let timing_availability = availability + u * outages.mean_min(t_h) / outages.mean_s;
    let per_year = outages.outages_per_year(u).max(1.0);
    let quantiles = [
        ("median", outages.quantile(0.5)),
        ("p90", outages.quantile(0.9)),
        ("p99", outages.quantile(0.99)),
        ("worst_in_year", outages.quantile(1.0 - 1.0 / per_year)),
    ];
    let errors = quantiles
        .into_iter()
        .map(|(label, d)| {
            let sx = coast_phase_sigma(q_wf, q_rw, q_drift, d);
            OutageError {
                label: label.to_string(),
                duration_s: d,
                timing_sigma_s: sx,
                range_sigma_m: phase_to_range_m(sx),
            }
        })
        .collect();
    Some(HoldoverCoupling {
        clock: clock.to_string(),
        threshold_s,
        holdover_s: t_h,
        fraction_outages_within: within,
        fraction_outage_time_within: time_within,
        timing_availability: timing_availability.clamp(0.0, 1.0),
        errors,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn matches_holdover_module_exactly() {
        let o = OutageModel {
            mean_s: 3600.0,
            sigma_ln: 1.0,
        };
        let c = couple("ocxo", 0.7, &o, 1e-6).unwrap();
        let (a, b, d) = ClockClass::Ocxo.psds();
        for e in &c.errors {
            assert_eq!(
                e.timing_sigma_s.to_bits(),
                coast_phase_sigma(a, b, d, e.duration_s).to_bits()
            );
            assert_eq!(
                e.range_sigma_m.to_bits(),
                phase_to_range_m(e.timing_sigma_s).to_bits()
            );
        }
        assert_eq!(
            c.holdover_s.to_bits(),
            holdover_seconds(a, b, d, 1e-6).to_bits()
        );
    }

    #[test]
    fn better_clock_better_timing_availability_and_bounds() {
        let o = OutageModel {
            mean_s: 7200.0,
            sigma_ln: 1.2,
        };
        let tcxo = couple("tcxo", 0.6, &o, 1e-6).unwrap();
        let dsac = couple("dsac", 0.6, &o, 1e-6).unwrap();
        assert!(dsac.timing_availability >= tcxo.timing_availability);
        assert!(tcxo.timing_availability >= 0.6 && dsac.timing_availability <= 1.0);
        assert!(couple("nonsense", 0.6, &o, 1e-6).is_none());
    }
}
