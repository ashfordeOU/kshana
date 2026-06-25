// SPDX-License-Identifier: AGPL-3.0-only
//! **Unified quantum-vs-classical trade evidence.**
//!
//! Every quantum-PNT application area answers the same question in the same way:
//! *fix one comparison frame (scenario + seed + engine version), route a quantum
//! candidate and a classical baseline through one neutral code path, score them on
//! common figures of merit, and report — with a confidence interval and an honest
//! validated/modelled label — where quantum wins and where it does not.* This
//! module gives that answer a single shape, [`TradeEvidence`], so the timing,
//! navigation and anomaly-detection verticals all emit the **same** reproducible,
//! honestly-labelled object.
//!
//! It does not re-implement any trade: the per-FoM numbers come from the existing
//! engines (`quantum_trade`, `crossover`, and the vertical modules). This is the
//! contract + the reproducibility/representativeness wrapper around them, built on
//! the [`crate::representativeness`] ledger and the [`crate::verification`] labels.

use crate::representativeness::Representativeness;
use crate::verification::VerificationStatus;

/// The fixed comparison frame: what makes a trade reproducible.
#[derive(Clone, Debug, serde::Serialize)]
pub struct TradeFrame {
    /// The scenario / use-case identifier.
    pub scenario: String,
    /// The RNG seed (deterministic reproduction).
    pub seed: u64,
    /// The engine version that produced the evidence.
    pub engine_version: String,
}

impl TradeFrame {
    /// Construct a frame, stamping the current engine version.
    pub fn new(scenario: &str, seed: u64) -> Self {
        TradeFrame {
            scenario: scenario.to_string(),
            seed,
            engine_version: env!("CARGO_PKG_VERSION").to_string(),
        }
    }
}

/// Which side wins a figure of merit.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum Winner {
    /// The quantum candidate is materially better.
    Quantum,
    /// The classical baseline is materially better.
    Classical,
    /// Within the tie band — no material difference.
    Tie,
}

/// Relative tie band: benefits within ±1% count as a tie.
const TIE_EPS: f64 = 0.01;

/// One common figure of merit, scored for both the quantum and classical sides.
#[derive(Clone, Debug, serde::Serialize)]
pub struct TradeFom {
    /// FoM name (e.g. "timing holdover", "outage position error").
    pub name: String,
    /// Physical unit (e.g. "s", "m").
    pub unit: String,
    /// The quantum-candidate value.
    pub quantum: f64,
    /// The classical-baseline value.
    pub classical: f64,
    /// Whether a larger value is better (e.g. holdover) or smaller (e.g. error).
    pub higher_is_better: bool,
    /// Optional 95% CI on the quantum value `(lo, hi)`.
    pub ci95: Option<(f64, f64)>,
    /// Honest label for this FoM's evidence.
    pub status: VerificationStatus,
}

impl TradeFom {
    /// The benefit ratio oriented so that `> 1` always means the quantum side is
    /// better, regardless of FoM polarity. Non-finite-safe.
    pub fn benefit_x(&self) -> f64 {
        let (num, den) = if self.higher_is_better {
            (self.quantum, self.classical)
        } else {
            (self.classical, self.quantum)
        };
        if !den.is_finite() || den == 0.0 {
            if num.is_finite() && num > 0.0 {
                f64::INFINITY
            } else {
                1.0
            }
        } else {
            num / den
        }
    }

    /// Which side wins this FoM (within the tie band).
    pub fn winner(&self) -> Winner {
        let b = self.benefit_x();
        if b > 1.0 + TIE_EPS {
            Winner::Quantum
        } else if b < 1.0 - TIE_EPS {
            Winner::Classical
        } else {
            Winner::Tie
        }
    }
}

/// A complete, reproducible, honestly-labelled quantum-vs-classical trade result.
#[derive(Clone, Debug, serde::Serialize)]
pub struct TradeEvidence {
    /// The fixed comparison frame.
    pub frame: TradeFrame,
    /// The common figures of merit.
    pub foms: Vec<TradeFom>,
    /// The representativeness + gaps-to-flight record for the whole trade.
    pub representativeness: Representativeness,
}

impl TradeEvidence {
    /// Start an evidence object from a frame and its representativeness record.
    pub fn new(frame: TradeFrame, representativeness: Representativeness) -> Self {
        TradeEvidence {
            frame,
            foms: Vec::new(),
            representativeness,
        }
    }

    /// Builder: add a scored figure of merit.
    pub fn with_fom(mut self, fom: TradeFom) -> Self {
        self.foms.push(fom);
        self
    }

    /// Per-FoM winners, in order.
    pub fn winners(&self) -> Vec<Winner> {
        self.foms.iter().map(TradeFom::winner).collect()
    }

    /// Count of FoMs the quantum side wins.
    pub fn quantum_wins(&self) -> usize {
        self.foms
            .iter()
            .filter(|f| f.winner() == Winner::Quantum)
            .count()
    }

    /// Honesty check: the representativeness record must be valid, and a FoM may be
    /// labelled `Validated` only inside an evidence object whose representativeness
    /// carries an external anchor (a validated FoM cannot ride on a record that has
    /// nothing external behind it). Returns the list of violations.
    pub fn honesty_violations(&self) -> Vec<String> {
        let mut v = self.representativeness.check();
        if self
            .foms
            .iter()
            .any(|f| f.status == VerificationStatus::Validated)
            && !self.representativeness.has_external_anchor()
        {
            v.push(
                "A Validated FoM requires the trade's representativeness to carry an external anchor"
                    .to_string(),
            );
        }
        v
    }

    /// True if the evidence is internally honest.
    pub fn is_honest(&self) -> bool {
        self.honesty_violations().is_empty()
    }

    /// Pretty JSON for embedding in a scenario report / artifact.
    pub fn to_json(&self) -> String {
        serde_json::to_string_pretty(self).expect("trade evidence serialises")
    }

    /// One-line human summary.
    pub fn summary(&self) -> String {
        format!(
            "{} | seed {} | v{} | quantum wins {}/{} FoMs | {}",
            self.frame.scenario,
            self.frame.seed,
            self.frame.engine_version,
            self.quantum_wins(),
            self.foms.len(),
            self.representativeness.status.tag(),
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::quantum_trade::{TradeResult, TradeRow};
    use crate::representativeness::{Anchor, Gap};
    use crate::verification::OracleKind;

    fn modelled_rep() -> Representativeness {
        Representativeness::modelled("quantum-vs-classical trade", (3, 4))
            .with_assumption("seeded synthetic comparison frame")
            .with_gap(Gap::new("real hardware-in-the-loop", "Phase B2"))
    }

    #[test]
    fn benefit_orientation_is_polarity_correct() {
        // Higher-is-better FoM (holdover): quantum 100 vs classical 10 -> 10x quantum.
        let hold = TradeFom {
            name: "holdover".into(),
            unit: "s".into(),
            quantum: 100.0,
            classical: 10.0,
            higher_is_better: true,
            ci95: None,
            status: VerificationStatus::Modelled,
        };
        assert!((hold.benefit_x() - 10.0).abs() < 1e-9);
        assert_eq!(hold.winner(), Winner::Quantum);

        // Lower-is-better FoM (error): quantum 2 vs classical 20 -> 10x quantum.
        let err = TradeFom {
            name: "error".into(),
            unit: "m".into(),
            quantum: 2.0,
            classical: 20.0,
            higher_is_better: false,
            ci95: None,
            status: VerificationStatus::Modelled,
        };
        assert!((err.benefit_x() - 10.0).abs() < 1e-9);
        assert_eq!(err.winner(), Winner::Quantum);

        // Classical better, lower-is-better: quantum 20 vs classical 2 -> 0.1x.
        let bad = TradeFom {
            quantum: 20.0,
            classical: 2.0,
            ..err.clone()
        };
        assert!(bad.benefit_x() < 1.0);
        assert_eq!(bad.winner(), Winner::Classical);

        // Tie band.
        let tie = TradeFom {
            quantum: 10.0,
            classical: 10.02,
            ..hold.clone()
        };
        assert_eq!(tie.winner(), Winner::Tie);
    }

    #[test]
    fn wraps_a_real_trade_result_faithfully() {
        // Build a TradeResult as the existing engine would emit it and wrap it.
        let tr = TradeResult {
            timing_threshold_s: 1e-6,
            position_threshold_m: 100.0,
            baseline: TradeRow {
                label: "classical".into(),
                timing_holdover_s: 100.0,
                inertial_holdover_s: 50.0,
                floor_assumed: false,
            },
            candidate: TradeRow {
                label: "quantum".into(),
                timing_holdover_s: 1000.0,
                inertial_holdover_s: 500.0,
                floor_assumed: false,
            },
            timing_benefit_x: 10.0,
            inertial_benefit_x: 10.0,
            floor_caveat: None,
        };
        let ev = TradeEvidence::new(TradeFrame::new("trade", 7), modelled_rep())
            .with_fom(TradeFom {
                name: "timing holdover".into(),
                unit: "s".into(),
                quantum: tr.candidate.timing_holdover_s,
                classical: tr.baseline.timing_holdover_s,
                higher_is_better: true,
                ci95: None,
                status: VerificationStatus::Modelled,
            })
            .with_fom(TradeFom {
                name: "inertial holdover".into(),
                unit: "s".into(),
                quantum: tr.candidate.inertial_holdover_s,
                classical: tr.baseline.inertial_holdover_s,
                higher_is_better: true,
                ci95: None,
                status: VerificationStatus::Modelled,
            });
        // The wrapped benefit matches the engine's own benefit ratio.
        assert!((ev.foms[0].benefit_x() - tr.timing_benefit_x).abs() < 1e-9);
        assert!((ev.foms[1].benefit_x() - tr.inertial_benefit_x).abs() < 1e-9);
        assert_eq!(ev.quantum_wins(), 2);
        assert!(ev.is_honest(), "violations: {:?}", ev.honesty_violations());
    }

    #[test]
    fn dishonest_evidence_is_rejected() {
        // Modelled representativeness with no gap is invalid -> evidence not honest.
        let bad_rep = Representativeness::modelled("x", (3, 4));
        let ev = TradeEvidence::new(TradeFrame::new("s", 1), bad_rep);
        assert!(!ev.is_honest());

        // A Validated FoM without an external anchor on the record is rejected.
        let ev2 = TradeEvidence::new(TradeFrame::new("s", 1), modelled_rep()).with_fom(TradeFom {
            name: "x".into(),
            unit: "m".into(),
            quantum: 1.0,
            classical: 2.0,
            higher_is_better: false,
            ci95: None,
            status: VerificationStatus::Validated,
        });
        assert!(ev2
            .honesty_violations()
            .iter()
            .any(|m| m.contains("external anchor")));
    }

    #[test]
    fn validated_fom_ok_with_external_anchor() {
        let rep = Representativeness::validated("x", (2, 3)).with_anchor(Anchor::new(
            "ADEV",
            "Stable32/NIST",
            OracleKind::ExternalDataset,
        ));
        let ev = TradeEvidence::new(TradeFrame::new("s", 1), rep).with_fom(TradeFom {
            name: "x".into(),
            unit: "m".into(),
            quantum: 1.0,
            classical: 2.0,
            higher_is_better: false,
            ci95: Some((0.8, 1.2)),
            status: VerificationStatus::Validated,
        });
        assert!(ev.is_honest(), "violations: {:?}", ev.honesty_violations());
    }

    #[test]
    fn deterministic_json_and_fields() {
        let ev =
            TradeEvidence::new(TradeFrame::new("demo", 42), modelled_rep()).with_fom(TradeFom {
                name: "holdover".into(),
                unit: "s".into(),
                quantum: 100.0,
                classical: 10.0,
                higher_is_better: true,
                ci95: Some((90.0, 110.0)),
                status: VerificationStatus::Modelled,
            });
        let j1 = ev.to_json();
        let j2 = ev.to_json();
        assert_eq!(j1, j2, "same evidence must serialise identically");
        for f in [
            "frame",
            "scenario",
            "seed",
            "engine_version",
            "foms",
            "representativeness",
        ] {
            assert!(j1.contains(f), "json missing {f}");
        }
        assert!(ev.summary().contains("quantum wins 1/1"));
    }
}
