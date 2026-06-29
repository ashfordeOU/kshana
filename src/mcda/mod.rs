// SPDX-License-Identifier: AGPL-3.0-only
//! **Multi-Criteria Decision Analysis (MCDA).**
//!
//! A small, dependency-light, deterministic toolkit for the recurring trade-study
//! question that sits on top of every Kshana simulation: *given several candidate
//! architectures scored on several incommensurate criteria, which do we pick, and
//! how stable is that choice?* The simulator already produces the per-criterion
//! numbers (coverage, PDOP, holdover, cost, mass, …); this module turns a table of
//! them into a defensible, reproducible decision — and, crucially, quantifies how
//! fragile that decision is to the weighting and value-judgement choices that no
//! amount of simulation can settle.
//!
//! The five pieces:
//!
//! * [`wsm`] — Weighted Sum Model: a [`wsm::DecisionMatrix`] of alternatives ×
//!   criteria, per-criterion value-function normalisation (benefit/cost, min–max,
//!   target peak, logistic), hard knock-out constraints, and a weighted aggregate
//!   score + ranking.
//! * [`ahp`] — Analytic Hierarchy Process: a reciprocal pairwise-comparison matrix
//!   → principal-eigenvector priority weights (power iteration), Consistency Index
//!   and Consistency Ratio against Saaty's Random Index table, with the CR < 0.10
//!   acceptance gate.
//! * [`pareto`] — general non-dominated (Pareto) set over N objectives, each
//!   independently minimised or maximised, plus a knee-point estimate
//!   (max-distance-to-chord, after Branke et al.).
//! * [`sensitivity`] — decision-stability analysis: a tornado over criterion
//!   weights, a Monte-Carlo / SMAA rank-1 acceptability index under weight
//!   uncertainty, and the minimum weight change that flips the winner.
//! * [`utility`] — Multi-Attribute Utility Theory value functions with an explicit
//!   risk attitude (averse / neutral / seeking, exponential utility) and additive
//!   aggregation.
//!
//! **Honesty scope (load-bearing).** This is decision *bookkeeping over* the
//! simulator's outputs, not a new physical measurement: WSM/AHP/Pareto/MAUT are
//! textbook closed-form methods, so the strongest claim any of them can carry is
//! "reproduces an independent reference implementation / published worked example
//! to a stated tolerance." Two pieces clear that bar against an external oracle:
//! the WSM aggregate + min–max normalisation reproduce the third-party `pymcdm`
//! library to < 1e-9, and the AHP priority vector + Consistency Ratio reproduce
//! Saaty's canonical Random Index table exactly and the SciPy/LAPACK principal
//! eigensolver to < 1e-9 (see `tests/mcda_wsm_reference.rs`,
//! `tests/mcda_ahp_reference.rs`). The Pareto, sensitivity, and utility pieces are
//! property- and known-answer-checked closed form — honestly *Modelled*, not
//! externally validated. None of this is a claim about the *correctness of the
//! inputs*: garbage criteria in, garbage decision out. The module's real product is
//! the [`sensitivity`] caution — a single-number ranking is only as trustworthy as
//! its robustness to the weights, and this module measures that robustness instead
//! of hiding it.

pub mod ahp;
pub mod pareto;
pub mod sensitivity;
pub mod utility;
pub mod wsm;

/// Whether a criterion / objective is to be **maximised** or **minimised**. Used by
/// [`pareto`] (dominance direction) and, via [`wsm::Direction`], by the WSM scorer.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub enum Objective {
    /// Larger is better (coverage, availability, utility …).
    Max,
    /// Smaller is better (cost, mass, PDOP, revisit gap …).
    Min,
}

impl Objective {
    /// The sign that turns this objective into a *minimisation* of `sign * value`
    /// (so a single code path can treat every objective as "smaller is better").
    pub fn min_sign(self) -> f64 {
        match self {
            Objective::Min => 1.0,
            Objective::Max => -1.0,
        }
    }
}
