// SPDX-License-Identifier: AGPL-3.0-only
//! **Weighted Sum Model (WSM).**
//!
//! The workhorse MCDA aggregator: each alternative is scored on each criterion, the
//! raw criterion values are mapped onto a common `[0, 1]` preference scale by a
//! per-criterion *value function*, and the alternative's overall score is the
//! weight-normalised sum of its preference values. Criteria may additionally carry
//! a hard *knock-out constraint* on the raw value (a minimum and/or maximum any
//! acceptable alternative must satisfy); a violating alternative is eliminated and
//! excluded from the ranking rather than merely scored low.
//!
//! The aggregate, the min–max normalisation and the (sum-to-one) weight handling
//! reproduce the third-party `pymcdm` `WSM` + `minmax_normalization` to < 1e-9 (see
//! `tests/mcda_wsm_reference.rs`), and a single benefit/cost criterion reproduces a
//! plain descending/ascending sort exactly (the back-compatibility golden below).

use super::Objective;
use std::collections::BTreeMap;

/// Whether higher or lower raw values of a criterion are preferred.
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub enum Direction {
    /// Higher raw value is better.
    Benefit,
    /// Lower raw value is better.
    Cost,
}

impl From<Direction> for Objective {
    fn from(d: Direction) -> Self {
        match d {
            Direction::Benefit => Objective::Max,
            Direction::Cost => Objective::Min,
        }
    }
}

/// How a criterion's raw values are mapped onto the `[0, 1]` preference scale.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub enum ValueFn {
    /// Linear min–max scaling over the observed range, oriented by [`Direction`]:
    /// benefit maps `min → 0, max → 1`; cost maps `min → 1, max → 0`. A degenerate
    /// (zero-range) criterion maps every alternative to `1.0` (it cannot
    /// discriminate, so it is preference-neutral). This is the classic WSM
    /// normalisation and the one `pymcdm`'s `minmax_normalization` implements.
    MinMax,
    /// Triangular *target* preference: value `1.0` at `target`, falling linearly to
    /// `0.0` at `target ± spread` (and clamped to `0.0` beyond). Direction-agnostic
    /// — used when a mid-range value is ideal (e.g. an inclination or a duty cycle).
    Target { target: f64, spread: f64 },
    /// Logistic (sigmoid) preference centred at `midpoint` with slope `steepness`
    /// (> 0): `1 / (1 + exp(-steepness·(x − midpoint)))` for a benefit, mirrored for
    /// a cost. Saturating "soft threshold" behaviour around a target level.
    Sigmoid { midpoint: f64, steepness: f64 },
}

/// A hard constraint on a criterion's **raw** value. An alternative is eliminated
/// if its raw value on this criterion is below `min` or above `max` (inclusive
/// bounds are accepted). Either bound may be left open.
#[derive(Clone, Copy, Debug, Default, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Constraint {
    /// Lowest acceptable raw value (inclusive); `None` = no lower bound.
    pub min: Option<f64>,
    /// Highest acceptable raw value (inclusive); `None` = no upper bound.
    pub max: Option<f64>,
}

impl Constraint {
    /// `true` iff `x` satisfies both bounds (NaN never satisfies a constraint).
    fn accepts(&self, x: f64) -> bool {
        if x.is_nan() {
            return false;
        }
        // Explicit matches (not `map_or`/`is_none_or`) keep this MSRV-1.75 clean and
        // free of the newer clippy `unnecessary_map_or` lint under `-D warnings`.
        let lo_ok = match self.min {
            Some(lo) => x >= lo,
            None => true,
        };
        let hi_ok = match self.max {
            Some(hi) => x <= hi,
            None => true,
        };
        lo_ok && hi_ok
    }
}

/// One decision criterion: a name, a non-negative importance weight, a preference
/// direction, a value function, and an optional knock-out constraint.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Criterion {
    pub name: String,
    /// Importance weight (≥ 0). Weights are normalised to sum to one at scoring
    /// time, so only their *ratios* matter.
    pub weight: f64,
    pub direction: Direction,
    pub value_fn: ValueFn,
    /// Optional hard knock-out on the raw value; `None` = no constraint.
    #[serde(default)]
    pub constraint: Option<Constraint>,
}

impl Criterion {
    /// A plain benefit criterion with min–max scaling and no constraint.
    pub fn benefit(name: impl Into<String>, weight: f64) -> Self {
        Self {
            name: name.into(),
            weight,
            direction: Direction::Benefit,
            value_fn: ValueFn::MinMax,
            constraint: None,
        }
    }

    /// A plain cost criterion with min–max scaling and no constraint.
    pub fn cost(name: impl Into<String>, weight: f64) -> Self {
        Self {
            name: name.into(),
            weight,
            direction: Direction::Cost,
            value_fn: ValueFn::MinMax,
            constraint: None,
        }
    }

    /// Builder: attach a knock-out constraint.
    pub fn with_constraint(mut self, c: Constraint) -> Self {
        self.constraint = Some(c);
        self
    }

    /// Builder: set the value function.
    pub fn with_value_fn(mut self, vf: ValueFn) -> Self {
        self.value_fn = vf;
        self
    }
}

/// One alternative: a name and one raw value per criterion (column order matches
/// the [`DecisionMatrix`] criteria).
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Alternative {
    pub name: String,
    pub values: Vec<f64>,
}

impl Alternative {
    pub fn new(name: impl Into<String>, values: Vec<f64>) -> Self {
        Self {
            name: name.into(),
            values,
        }
    }
}

/// A decision matrix: the criteria (columns) and the alternatives (rows).
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct DecisionMatrix {
    pub criteria: Vec<Criterion>,
    pub alternatives: Vec<Alternative>,
}

/// The score and disposition of one alternative.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct AlternativeScore {
    /// Row index in the original [`DecisionMatrix`].
    pub index: usize,
    pub name: String,
    /// Weighted-sum aggregate over the surviving criteria, in `[0, 1]`. For an
    /// eliminated alternative this is still reported (the score it *would* have had)
    /// but it does not participate in the ranking.
    pub score: f64,
    /// `true` if a knock-out constraint eliminated this alternative.
    pub eliminated: bool,
    /// Name of the first criterion whose constraint eliminated it, if any.
    pub eliminated_by: Option<String>,
}

/// The result of scoring a [`DecisionMatrix`].
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct WsmReport {
    /// Per-alternative scores in the original row order.
    pub scores: Vec<AlternativeScore>,
    /// Indices of the *surviving* alternatives, best (highest score) first; ties
    /// broken by ascending index so the ordering is a deterministic total order.
    pub ranking: Vec<usize>,
}

impl WsmReport {
    /// The winning (rank-0) alternative index, or `None` if every alternative was
    /// knocked out.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Map a single raw value through a value function onto `[0, 1]`.
fn preference(vf: ValueFn, dir: Direction, x: f64, lo: f64, hi: f64) -> f64 {
    match vf {
        ValueFn::MinMax => {
            let range = hi - lo;
            if range <= 0.0 {
                // Zero-range criterion cannot discriminate; treat as neutral-best.
                return 1.0;
            }
            let t = (x - lo) / range;
            match dir {
                Direction::Benefit => t,
                Direction::Cost => 1.0 - t,
            }
        }
        ValueFn::Target { target, spread } => {
            if spread <= 0.0 {
                return if x == target { 1.0 } else { 0.0 };
            }
            (1.0 - (x - target).abs() / spread).clamp(0.0, 1.0)
        }
        ValueFn::Sigmoid {
            midpoint,
            steepness,
        } => {
            let s = 1.0 / (1.0 + (-steepness * (x - midpoint)).exp());
            match dir {
                Direction::Benefit => s,
                Direction::Cost => 1.0 - s,
            }
        }
    }
}

impl DecisionMatrix {
    /// Construct and validate a decision matrix in one step.
    pub fn new(criteria: Vec<Criterion>, alternatives: Vec<Alternative>) -> Result<Self, String> {
        let dm = Self {
            criteria,
            alternatives,
        };
        dm.validate()?;
        Ok(dm)
    }

    /// Structural validation: at least one criterion and one alternative, every row
    /// has one value per criterion, weights are finite and non-negative with a
    /// positive sum, and every raw value is finite.
    pub fn validate(&self) -> Result<(), String> {
        if self.criteria.is_empty() {
            return Err("decision matrix has no criteria".into());
        }
        if self.alternatives.is_empty() {
            return Err("decision matrix has no alternatives".into());
        }
        let mut wsum = 0.0;
        for c in &self.criteria {
            if !c.weight.is_finite() || c.weight < 0.0 {
                return Err(format!(
                    "criterion '{}' has an invalid weight {}",
                    c.name, c.weight
                ));
            }
            wsum += c.weight;
        }
        if wsum <= 0.0 {
            return Err("criterion weights sum to zero".into());
        }
        let n = self.criteria.len();
        for a in &self.alternatives {
            if a.values.len() != n {
                return Err(format!(
                    "alternative '{}' has {} values but there are {} criteria",
                    a.name,
                    a.values.len(),
                    n
                ));
            }
            for (j, &v) in a.values.iter().enumerate() {
                if !v.is_finite() {
                    return Err(format!(
                        "alternative '{}' has a non-finite value on criterion '{}'",
                        a.name, self.criteria[j].name
                    ));
                }
            }
        }
        Ok(())
    }

    /// Per-criterion (min, max) of the raw values over all alternatives.
    fn ranges(&self) -> Vec<(f64, f64)> {
        (0..self.criteria.len())
            .map(|j| {
                let mut lo = f64::INFINITY;
                let mut hi = f64::NEG_INFINITY;
                for a in &self.alternatives {
                    let v = a.values[j];
                    lo = lo.min(v);
                    hi = hi.max(v);
                }
                (lo, hi)
            })
            .collect()
    }

    /// The `alternatives × criteria` matrix of `[0, 1]` preference values (before
    /// weighting). Useful on its own and the input the [`super::sensitivity`] tools
    /// consume.
    pub fn preference_matrix(&self) -> Vec<Vec<f64>> {
        let ranges = self.ranges();
        self.alternatives
            .iter()
            .map(|a| {
                self.criteria
                    .iter()
                    .enumerate()
                    .map(|(j, c)| {
                        let (lo, hi) = ranges[j];
                        preference(c.value_fn, c.direction, a.values[j], lo, hi)
                    })
                    .collect()
            })
            .collect()
    }

    /// The criterion weights, normalised to sum to one (validation guarantees a
    /// positive sum).
    pub fn normalized_weights(&self) -> Vec<f64> {
        let sum: f64 = self.criteria.iter().map(|c| c.weight).sum();
        self.criteria.iter().map(|c| c.weight / sum).collect()
    }

    /// Score and rank the alternatives.
    pub fn score(&self) -> Result<WsmReport, String> {
        self.validate()?;
        let weights = self.normalized_weights();
        let prefs = self.preference_matrix();

        let mut scores: Vec<AlternativeScore> = Vec::with_capacity(self.alternatives.len());
        for (i, a) in self.alternatives.iter().enumerate() {
            // Knock-out: first violated constraint, in criterion order.
            let mut eliminated_by = None;
            for (j, c) in self.criteria.iter().enumerate() {
                if let Some(con) = c.constraint {
                    if !con.accepts(a.values[j]) {
                        eliminated_by = Some(c.name.clone());
                        break;
                    }
                }
            }
            let score: f64 = prefs[i]
                .iter()
                .zip(weights.iter())
                .map(|(p, w)| p * w)
                .sum();
            scores.push(AlternativeScore {
                index: i,
                name: a.name.clone(),
                score,
                eliminated: eliminated_by.is_some(),
                eliminated_by,
            });
        }

        // Rank the survivors, best first; ties broken by ascending original index.
        let mut ranking: Vec<usize> = scores
            .iter()
            .filter(|s| !s.eliminated)
            .map(|s| s.index)
            .collect();
        ranking.sort_by(|&i, &j| scores[j].score.total_cmp(&scores[i].score).then(i.cmp(&j)));

        Ok(WsmReport { scores, ranking })
    }

    /// Convenience: the per-alternative scores keyed by name (eliminated ones
    /// included). A `BTreeMap` (not `HashMap`) to stay `no_std`/WASM-friendly and
    /// deterministically ordered.
    pub fn score_map(&self) -> Result<BTreeMap<String, f64>, String> {
        Ok(self
            .score()?
            .scores
            .into_iter()
            .map(|s| (s.name, s.score))
            .collect())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    /// Back-compat golden: a single **benefit** criterion must reproduce a plain
    /// descending sort of that criterion, and a single **cost** criterion an
    /// ascending sort — exactly, for any input order.
    #[test]
    fn single_criterion_reproduces_plain_sort() {
        let raw = [3.0, 1.0, 4.0, 1.0, 5.0, 9.0, 2.0, 6.0];
        let alts: Vec<Alternative> = raw
            .iter()
            .enumerate()
            .map(|(i, &v)| Alternative::new(format!("a{i}"), vec![v]))
            .collect();

        // Benefit -> descending by value (ties by index).
        let dm = DecisionMatrix::new(vec![Criterion::benefit("x", 1.0)], alts.clone()).unwrap();
        let got = dm.score().unwrap().ranking;
        let mut expect: Vec<usize> = (0..raw.len()).collect();
        expect.sort_by(|&i, &j| raw[j].total_cmp(&raw[i]).then(i.cmp(&j)));
        assert_eq!(got, expect, "benefit ranking must equal a descending sort");

        // Cost -> ascending by value (ties by index).
        let dm = DecisionMatrix::new(vec![Criterion::cost("x", 1.0)], alts).unwrap();
        let got = dm.score().unwrap().ranking;
        let mut expect: Vec<usize> = (0..raw.len()).collect();
        expect.sort_by(|&i, &j| raw[i].total_cmp(&raw[j]).then(i.cmp(&j)));
        assert_eq!(got, expect, "cost ranking must equal an ascending sort");
    }

    /// Known-answer cross-check against the `pymcdm` WSM + min–max reference
    /// (the same numbers asserted to < 1e-9 in `tests/mcda_wsm_reference.rs`):
    /// matrix rows = alternatives, criteria = (cost, benefit, benefit),
    /// weights (0.40, 0.35, 0.25). Expected scores 0.325, 0.400, 0.600, 0.3375.
    #[test]
    fn matches_pymcdm_minmax_wsm_reference() {
        let dm = DecisionMatrix::new(
            vec![
                Criterion::cost("price", 0.40),
                Criterion::benefit("perf", 0.35),
                Criterion::benefit("range", 0.25),
            ],
            vec![
                Alternative::new("A0", vec![250.0, 16.0, 12.0]),
                Alternative::new("A1", vec![200.0, 16.0, 8.0]),
                Alternative::new("A2", vec![300.0, 32.0, 16.0]),
                Alternative::new("A3", vec![275.0, 24.0, 10.0]),
            ],
        )
        .unwrap();
        let rep = dm.score().unwrap();
        let s: Vec<f64> = rep.scores.iter().map(|x| x.score).collect();
        for (got, want) in s.iter().zip([0.325, 0.400, 0.600, 0.3375]) {
            assert!(approx(*got, want, 1e-12), "score {got} != {want}");
        }
        assert_eq!(rep.ranking, vec![2, 1, 3, 0]);
        assert_eq!(rep.winner(), Some(2));
    }

    #[test]
    fn knockout_constraint_eliminates_and_excludes_from_ranking() {
        // Two criteria; alt "bad" violates a max on criterion 0.
        let dm = DecisionMatrix::new(
            vec![
                Criterion::cost("mass_kg", 0.5).with_constraint(Constraint {
                    min: None,
                    max: Some(100.0),
                }),
                Criterion::benefit("perf", 0.5),
            ],
            vec![
                Alternative::new("ok_a", vec![50.0, 10.0]),
                Alternative::new("bad", vec![150.0, 99.0]), // best perf but over mass cap
                Alternative::new("ok_b", vec![80.0, 8.0]),
            ],
        )
        .unwrap();
        let rep = dm.score().unwrap();
        let bad = &rep.scores[1];
        assert!(bad.eliminated);
        assert_eq!(bad.eliminated_by.as_deref(), Some("mass_kg"));
        // The eliminated, highest-perf alternative must not win — it is not ranked.
        assert!(!rep.ranking.contains(&1));
        assert_eq!(rep.winner(), Some(0)); // ok_a beats ok_b
    }

    #[test]
    fn weights_are_ratio_invariant() {
        let mk = |w: [f64; 2]| {
            DecisionMatrix::new(
                vec![Criterion::benefit("a", w[0]), Criterion::benefit("b", w[1])],
                vec![
                    Alternative::new("x", vec![1.0, 0.0]),
                    Alternative::new("y", vec![0.0, 1.0]),
                ],
            )
            .unwrap()
            .score()
            .unwrap()
        };
        let r1 = mk([0.6, 0.4]);
        let r2 = mk([6.0, 4.0]); // same ratio, unnormalised
        for (a, b) in r1.scores.iter().zip(r2.scores.iter()) {
            assert!(approx(a.score, b.score, 1e-15));
        }
    }

    #[test]
    fn target_and_sigmoid_value_functions_peak_and_saturate() {
        // Target peaks at the target, falls off symmetrically.
        let p = preference(
            ValueFn::Target {
                target: 55.0,
                spread: 10.0,
            },
            Direction::Benefit,
            55.0,
            0.0,
            100.0,
        );
        assert!(approx(p, 1.0, 1e-15));
        let p = preference(
            ValueFn::Target {
                target: 55.0,
                spread: 10.0,
            },
            Direction::Benefit,
            60.0,
            0.0,
            100.0,
        );
        assert!(approx(p, 0.5, 1e-12));
        let p = preference(
            ValueFn::Target {
                target: 55.0,
                spread: 10.0,
            },
            Direction::Benefit,
            80.0,
            0.0,
            100.0,
        );
        assert!(approx(p, 0.0, 1e-15)); // beyond spread -> clamped to 0

        // Sigmoid: 0.5 at the midpoint, monotone increasing for a benefit.
        let mid = preference(
            ValueFn::Sigmoid {
                midpoint: 5.0,
                steepness: 2.0,
            },
            Direction::Benefit,
            5.0,
            0.0,
            10.0,
        );
        assert!(approx(mid, 0.5, 1e-15));
        let hi = preference(
            ValueFn::Sigmoid {
                midpoint: 5.0,
                steepness: 2.0,
            },
            Direction::Benefit,
            9.0,
            0.0,
            10.0,
        );
        assert!(hi > mid);
    }

    #[test]
    fn degenerate_zero_range_criterion_is_neutral() {
        // Every alternative identical on the only criterion -> equal scores, stable order.
        let dm = DecisionMatrix::new(
            vec![Criterion::benefit("flat", 1.0)],
            vec![
                Alternative::new("a", vec![7.0]),
                Alternative::new("b", vec![7.0]),
            ],
        )
        .unwrap();
        let rep = dm.score().unwrap();
        assert!(approx(rep.scores[0].score, rep.scores[1].score, 1e-15));
        assert_eq!(rep.ranking, vec![0, 1]);
    }

    #[test]
    fn validation_rejects_malformed_matrices() {
        // Row width mismatch.
        let e = DecisionMatrix::new(
            vec![Criterion::benefit("a", 1.0), Criterion::benefit("b", 1.0)],
            vec![Alternative::new("x", vec![1.0])],
        );
        assert!(e.is_err());
        // Zero total weight.
        let e = DecisionMatrix::new(
            vec![Criterion::benefit("a", 0.0)],
            vec![Alternative::new("x", vec![1.0])],
        );
        assert!(e.is_err());
        // Non-finite value.
        let e = DecisionMatrix::new(
            vec![Criterion::benefit("a", 1.0)],
            vec![Alternative::new("x", vec![f64::NAN])],
        );
        assert!(e.is_err());
    }
}
