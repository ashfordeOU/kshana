// SPDX-License-Identifier: AGPL-3.0-only
//! The per-phase error budget, the margin against a requirement, and the weakest link of a
//! thread.
//!
//! Every number carries its unit in its field name or its `unit` field. A frame or timescale
//! conversion at a handover is its own [`BudgetRow`], so the budget shows what each conversion
//! cost.

use serde::{Deserialize, Serialize};

use super::phase::{EvidenceLabel, NavSource, Requirement, TimeSource};

/// One line of a phase's budget: a contribution with its 1-sigma, unit and label.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct BudgetRow {
    /// What the contribution is (a navigation source, a frame conversion, a handover rule).
    pub source: String,
    /// The 1-sigma of the contribution.
    pub sigma: f64,
    /// The unit of `sigma`: `m`, `m/s` or `s`.
    pub unit: String,
    /// The evidence label of this line.
    pub label: EvidenceLabel,
}

impl BudgetRow {
    /// A line for a frame or timescale conversion, named `conversion: <from> -> <to>`.
    pub fn conversion(from: &str, to: &str, sigma: f64, unit: &str) -> Self {
        BudgetRow {
            source: format!("conversion: {from} -> {to}"),
            sigma,
            unit: unit.to_string(),
            label: EvidenceLabel::modelled(),
        }
    }
}

/// The error budget of one phase.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct PhaseBudget {
    /// The phase id.
    pub phase_id: String,
    /// The phase kind.
    pub kind: String,
    /// 1-sigma position at phase entry, metres.
    pub entry_sigma_pos_m: f64,
    /// 1-sigma velocity at phase entry, metres per second.
    pub entry_sigma_vel_mps: f64,
    /// 1-sigma time at phase entry, seconds.
    pub entry_sigma_time_s: f64,
    /// 1-sigma position at phase exit, metres.
    pub exit_sigma_pos_m: f64,
    /// 1-sigma velocity at phase exit, metres per second.
    pub exit_sigma_vel_mps: f64,
    /// 1-sigma time at phase exit, seconds.
    pub exit_sigma_time_s: f64,
    /// Largest 1-sigma position over the phase, metres.
    pub peak_sigma_pos_m: f64,
    /// Largest 1-sigma velocity over the phase, metres per second.
    pub peak_sigma_vel_mps: f64,
    /// Largest 1-sigma time over the phase, seconds.
    pub peak_sigma_time_s: f64,
    /// The navigation sources the phase used.
    pub nav_sources: Vec<NavSource>,
    /// The time source the phase used.
    pub time_source: TimeSource,
    /// The source that limits the phase's accuracy, if one dominates.
    pub limiting_source: Option<String>,
    /// The budget lines, including every frame and timescale conversion.
    pub rows: Vec<BudgetRow>,
    /// The label of the phase's own numbers.
    pub label: EvidenceLabel,
}

/// The margin of a phase against its requirement: the smallest ratio of limit to peak over the
/// limits that are stated (above 1 meets the requirement). `None` when no limit is stated, or
/// when every stated limit faces a zero peak.
pub fn margin(b: &PhaseBudget, r: &Requirement) -> Option<f64> {
    let mut m: Option<f64> = None;
    for (limit, peak) in [
        (r.max_pos_m, b.peak_sigma_pos_m),
        (r.max_vel_mps, b.peak_sigma_vel_mps),
        (r.max_time_s, b.peak_sigma_time_s),
    ] {
        if let Some(l) = limit {
            if peak > 0.0 {
                let ratio = l / peak;
                m = Some(m.map_or(ratio, |x| x.min(ratio)));
            }
        }
    }
    m
}

/// Why a phase was named the weakest link.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum WeakestBasis {
    /// The smallest margin against a stated requirement.
    SmallestMargin,
    /// No requirement was stated anywhere; the largest peak position sigma.
    LargestPeakPosition,
}

/// The weakest phase of a thread.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct WeakestLink {
    /// The phase id.
    pub phase_id: String,
    /// The source limiting that phase, if one dominates.
    pub limiting_source: Option<String>,
    /// The margin, when the basis is the margin.
    pub margin: Option<f64>,
    /// How the weakest link was chosen.
    pub basis: WeakestBasis,
}

/// The weakest link of a thread: the phase with the smallest margin among those that state a
/// requirement; if none state one, the phase with the largest peak position sigma. `None` for an
/// empty thread. Ties keep the earlier phase.
pub fn weakest_link(budgets: &[(PhaseBudget, Requirement)]) -> Option<WeakestLink> {
    let mut best: Option<(usize, f64)> = None;
    for (i, (b, r)) in budgets.iter().enumerate() {
        if let Some(m) = margin(b, r) {
            if best.is_none_or(|(_, bm)| m < bm) {
                best = Some((i, m));
            }
        }
    }
    if let Some((i, m)) = best {
        let b = &budgets[i].0;
        return Some(WeakestLink {
            phase_id: b.phase_id.clone(),
            limiting_source: b.limiting_source.clone(),
            margin: Some(m),
            basis: WeakestBasis::SmallestMargin,
        });
    }
    let mut worst: Option<(usize, f64)> = None;
    for (i, (b, _)) in budgets.iter().enumerate() {
        if worst.is_none_or(|(_, w)| b.peak_sigma_pos_m > w) {
            worst = Some((i, b.peak_sigma_pos_m));
        }
    }
    worst.map(|(i, _)| {
        let b = &budgets[i].0;
        WeakestLink {
            phase_id: b.phase_id.clone(),
            limiting_source: b.limiting_source.clone(),
            margin: None,
            basis: WeakestBasis::LargestPeakPosition,
        }
    })
}

/// The label of a thread: the weakest label of its phases (Partner < Modelled < Validated). An
/// empty thread is MODELLED.
pub fn thread_label(budgets: &[PhaseBudget]) -> EvidenceLabel {
    let mut it = budgets.iter().map(|b| b.label.clone());
    match it.next() {
        None => EvidenceLabel::modelled(),
        Some(first) => it.fold(first, |a, l| a.weaker(l)),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::mission_thread::phase::LabelTier;

    fn budget(id: &str, pos: f64, vel: f64, t: f64, label: EvidenceLabel) -> PhaseBudget {
        PhaseBudget {
            phase_id: id.into(),
            kind: "x".into(),
            entry_sigma_pos_m: pos,
            entry_sigma_vel_mps: vel,
            entry_sigma_time_s: t,
            exit_sigma_pos_m: pos,
            exit_sigma_vel_mps: vel,
            exit_sigma_time_s: t,
            peak_sigma_pos_m: pos,
            peak_sigma_vel_mps: vel,
            peak_sigma_time_s: t,
            nav_sources: vec![NavSource::Gnss],
            time_source: TimeSource::Gnss,
            limiting_source: Some("gnss".into()),
            rows: vec![],
            label,
        }
    }

    #[test]
    fn the_margin_is_the_smallest_limit_to_peak_ratio_and_none_without_limits() {
        let b = budget("a", 10.0, 0.1, 1e-6, EvidenceLabel::modelled());
        let r = Requirement {
            max_pos_m: Some(30.0),
            max_vel_mps: Some(0.1),
            max_time_s: None,
        };
        assert!((margin(&b, &r).unwrap() - 1.0).abs() < 1e-12);
        assert!(margin(&b, &Requirement::default()).is_none());
    }

    #[test]
    fn the_weakest_link_is_the_smallest_margin_then_the_largest_peak_when_no_limits() {
        let m = EvidenceLabel::modelled();
        let a = budget("a", 10.0, 0.1, 1e-6, m.clone());
        let b = budget("b", 50.0, 0.1, 1e-6, m.clone());
        let ra = Requirement {
            max_pos_m: Some(100.0),
            ..Default::default()
        };
        let rb = Requirement {
            max_pos_m: Some(60.0),
            ..Default::default()
        };
        let w = weakest_link(&[(a.clone(), ra), (b.clone(), rb)]).unwrap();
        assert_eq!(w.phase_id, "b");
        assert_eq!(w.basis, WeakestBasis::SmallestMargin);
        let w = weakest_link(&[(a, Requirement::default()), (b, Requirement::default())]).unwrap();
        assert_eq!(w.phase_id, "b");
        assert_eq!(w.basis, WeakestBasis::LargestPeakPosition);
        assert!(weakest_link(&[]).is_none());
    }

    #[test]
    fn the_thread_label_is_the_weakest_phase_label() {
        let v = budget("a", 1.0, 1.0, 1.0, EvidenceLabel::validated("r"));
        let m = budget("b", 1.0, 1.0, 1.0, EvidenceLabel::modelled());
        assert_eq!(
            thread_label(std::slice::from_ref(&v)).tier,
            LabelTier::Validated
        );
        assert_eq!(thread_label(&[v, m]).tier, LabelTier::Modelled);
        assert_eq!(thread_label(&[]).tier, LabelTier::Modelled);
    }

    #[test]
    fn a_conversion_row_names_both_ends() {
        let r = BudgetRow::conversion("GCRF", "MCI", 2.5, "m");
        assert_eq!(r.source, "conversion: GCRF -> MCI");
        assert_eq!(r.unit, "m");
    }
}
