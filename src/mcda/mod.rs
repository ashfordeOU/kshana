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
//! The toolkit spans the four canonical MCDA families — value aggregation, distance
//! to ideal, compromise programming and outranking — plus the priority-derivation
//! and robustness machinery that surrounds them:
//!
//! * [`wsm`] — **Weighted Sum Model** (value): a [`wsm::DecisionMatrix`] of
//!   alternatives × criteria, per-criterion value-function normalisation
//!   (benefit/cost, min–max, target peak, logistic), hard knock-out constraints, and
//!   a weighted additive aggregate score + ranking.
//! * [`wpm`] — **Weighted Product Model** (value): the multiplicative sibling,
//!   `Πⱼ nᵢⱼ^wⱼ` over sum-normalised values — scale-invariant, no additive unit-mixing,
//!   with hard-zero annihilation.
//! * [`waspas`] — **WASPAS** (value): the convex blend `λ·WSM + (1−λ)·WPM` over
//!   linear-normalised values, the stability-hardened middle ground between the two.
//! * [`moora`] — **MOORA** (ratio): vector-normalised weighted benefit total minus
//!   weighted cost total — a signed ratio-system score.
//! * [`copras`] — **COPRAS** (proportional): benefit significance plus a cost
//!   significance inversely proportional to the alternative's own weighted cost, and
//!   the utility degree `Q / max Q`.
//! * [`topsis`] — **TOPSIS** (distance): relative closeness to the weighted positive
//!   / negative ideal solutions under min–max normalisation.
//! * [`vikor`] — **VIKOR** (compromise): group-utility `S`, individual-regret `R` and
//!   the compromise index `Q` at strategy weight `v`.
//! * [`promethee`] — **PROMETHEE II** (outranking): pairwise preference with the six
//!   standard generalised-criterion shapes, positive/negative flows and a complete
//!   net-flow ranking.
//! * [`electre`] — **ELECTRE I** (outranking): concordance / discordance, the
//!   concordance-and-non-veto dominance relation, and the choice **kernel**.
//! * [`ahp`] — **Analytic Hierarchy Process**: a reciprocal pairwise-comparison matrix
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
//! simulator's outputs, not a new physical measurement: every method here is a
//! textbook closed-form procedure, so the strongest claim any of them can carry is
//! "reproduces an independent reference implementation / published worked example to
//! a stated tolerance." Nine aggregators clear that bar against an external oracle to
//! < 1e-9: **WSM, WPM, WASPAS, MOORA, TOPSIS, VIKOR, PROMETHEE II** against the
//! third-party `pymcdm` library, and **ELECTRE I** (concordance/discordance/dominance/
//! kernel, element for element) plus **COPRAS** against the third-party `pyDecision`
//! library (see the `tests/mcda_*_reference.rs` cross-checks). COPRAS uses `pyDecision`
//! deliberately: `pymcdm` 1.4.0's `COPRAS` collapses to the trivial `S⁺+S⁻` and is
//! not a faithful reference, whereas `pyDecision` implements the canonical
//! relative-significance formula. The **AHP** priority vector + Consistency Ratio
//! reproduce Saaty's
//! canonical Random Index table exactly and the SciPy/LAPACK principal eigensolver to
//! < 1e-9. The Pareto, sensitivity, and utility pieces are property- and
//! known-answer-checked closed form — honestly *Modelled*, not externally validated.
//! None of this is a claim about the *correctness of the inputs*: garbage criteria in,
//! garbage decision out. The module's real product is the [`sensitivity`] caution —
//! a single-number ranking is only as trustworthy as its robustness to the weights,
//! and this module measures that robustness instead of hiding it. Running several
//! families and checking they agree (the pro overlay's multi-method concordance) is
//! the honest way to earn confidence a single method cannot give.

pub mod ahp;
pub mod copras;
pub mod electre;
pub mod moora;
pub mod pareto;
pub mod promethee;
pub mod sensitivity;
pub mod topsis;
pub mod utility;
pub mod vikor;
pub mod waspas;
pub mod wpm;
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
