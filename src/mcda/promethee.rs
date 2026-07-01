// SPDX-License-Identifier: AGPL-3.0-only
//! **PROMETHEE II** — Preference Ranking Organization METHod for Enrichment
//! Evaluations, complete ranking (Brans & Vincke 1985).
//!
//! The *outranking* member of the [`super`] toolkit. Rather than aggregating scores,
//! PROMETHEE compares every ordered pair of alternatives criterion-by-criterion
//! through a **preference function** that maps the (direction-oriented) pairwise
//! difference `d` onto a degree of preference in `[0, 1]`. The weighted preference
//! degrees give a pairwise preference index `π(a,b) = Σⱼ wⱼ Pⱼ(a,b)`, from which each
//! alternative's positive (`φ⁺`) and negative (`φ⁻`) outranking flows follow, and the
//! **net flow** `φ = φ⁺ − φ⁻ ∈ [−1, 1]` gives the complete PROMETHEE II ranking
//! (higher is better).
//!
//! This module implements the six standard [`PreferenceFunction`] shapes (Brans &
//! Mareschal). The **usual** criterion (a strict step: any positive difference is
//! full preference) is validated against `pymcdm.methods.PROMETHEE_II('usual')` to
//! < 1e-9 (see `tests/mcda_promethee_reference.rs`); the thresholded shapes reduce to
//! the same generalised-criterion algebra.
//!
//! **Honesty scope.** A textbook closed-form outranking method; the strongest claim
//! is "reproduces the independent third-party `pymcdm` reference to a stated
//! tolerance." Preference-function shape and thresholds are modelling choices the
//! analyst must justify; see [`super::sensitivity`] for the robustness caveat.

use super::Objective;

/// A PROMETHEE generalised-criterion preference function `P(d)` mapping a
/// direction-oriented pairwise difference `d ≥ 0` onto `[0, 1]` (differences `≤ 0`
/// always map to `0`). Parameters are in the criterion's own units.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum PreferenceFunction {
    /// Type I — strict step: `P = 1` for any `d > 0`, else `0`.
    Usual,
    /// Type II — quasi-criterion: `P = 1` for `d > q`, else `0`.
    UShape { q: f64 },
    /// Type III — linear up to `p`: `P = d/p` for `0 < d ≤ p`, else `1`.
    VShape { p: f64 },
    /// Type IV — level: `0` for `d ≤ q`, `0.5` for `q < d ≤ p`, `1` for `d > p`.
    Level { q: f64, p: f64 },
    /// Type V — linear with indifference: `0` for `d ≤ q`, `(d−q)/(p−q)` for
    /// `q < d ≤ p`, `1` for `d > p`.
    Linear { q: f64, p: f64 },
    /// Type VI — Gaussian: `P = 1 − exp(−d²/(2σ²))` for `d > 0`.
    Gaussian { sigma: f64 },
}

impl PreferenceFunction {
    /// The preference degree `P(d)` for a pairwise difference `d`; differences `≤ 0`
    /// always yield `0`.
    pub fn degree(self, d: f64) -> f64 {
        if d <= 0.0 {
            return 0.0;
        }
        match self {
            PreferenceFunction::Usual => 1.0,
            PreferenceFunction::UShape { q } => {
                if d > q {
                    1.0
                } else {
                    0.0
                }
            }
            PreferenceFunction::VShape { p } => {
                if p <= 0.0 || d > p {
                    1.0
                } else {
                    d / p
                }
            }
            PreferenceFunction::Level { q, p } => {
                if d <= q {
                    0.0
                } else if d <= p {
                    0.5
                } else {
                    1.0
                }
            }
            PreferenceFunction::Linear { q, p } => {
                if d <= q {
                    0.0
                } else if d <= p {
                    (d - q) / (p - q)
                } else {
                    1.0
                }
            }
            PreferenceFunction::Gaussian { sigma } => {
                if sigma <= 0.0 {
                    1.0
                } else {
                    1.0 - (-(d * d) / (2.0 * sigma * sigma)).exp()
                }
            }
        }
    }
}

/// The outcome of a [`promethee_ii`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct PrometheeResult {
    /// Positive outranking flow `φ⁺ᵢ` per alternative (original row order).
    pub phi_plus: Vec<f64>,
    /// Negative outranking flow `φ⁻ᵢ` per alternative.
    pub phi_minus: Vec<f64>,
    /// Net outranking flow `φᵢ = φ⁺ᵢ − φ⁻ᵢ ∈ [−1, 1]`; **higher is better**.
    pub net_flow: Vec<f64>,
    /// Alternative indices best (highest net flow) first; ties broken by ascending
    /// index.
    pub ranking: Vec<usize>,
}

impl PrometheeResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Score a raw decision matrix with PROMETHEE II using one preference function per
/// criterion.
///
/// `matrix` is `alternatives × criteria`, `weights` per criterion (used as given —
/// normalise to sum to one for the classic convention), `types` marks each criterion
/// [`Objective::Max`] / [`Objective::Min`], and `prefs` gives the per-criterion
/// [`PreferenceFunction`]. Errors on a shape mismatch or empty matrix.
pub fn promethee_ii(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
    prefs: &[PreferenceFunction],
) -> Result<PrometheeResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("PROMETHEE II: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("PROMETHEE II: no criteria".into());
    }
    if types.len() != n || prefs.len() != n {
        return Err(format!(
            "PROMETHEE II: {n} weights but {} types / {} preference functions",
            types.len(),
            prefs.len()
        ));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "PROMETHEE II: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        if row.iter().any(|x| !x.is_finite()) {
            return Err(format!(
                "PROMETHEE II: alternative {i} has a non-finite value"
            ));
        }
    }
    if m == 1 {
        return Ok(PrometheeResult {
            phi_plus: vec![0.0],
            phi_minus: vec![0.0],
            net_flow: vec![0.0],
            ranking: vec![0],
        });
    }

    // Pairwise preference index π(a,b) = Σⱼ wⱼ Pⱼ(orient(x_aj − x_bj)).
    let pi = |a: usize, b: usize| -> f64 {
        (0..n)
            .map(|j| {
                let raw = matrix[a][j] - matrix[b][j];
                // Orient so that "more preferred on this criterion" is a positive d.
                let d = match types[j] {
                    Objective::Max => raw,
                    Objective::Min => -raw,
                };
                weights[j] * prefs[j].degree(d)
            })
            .sum()
    };

    let denom = (m - 1) as f64;
    let mut phi_plus = vec![0.0; m];
    let mut phi_minus = vec![0.0; m];
    for a in 0..m {
        let mut plus = 0.0;
        let mut minus = 0.0;
        for b in 0..m {
            if a == b {
                continue;
            }
            plus += pi(a, b);
            minus += pi(b, a);
        }
        phi_plus[a] = plus / denom;
        phi_minus[a] = minus / denom;
    }
    let net_flow: Vec<f64> = (0..m).map(|i| phi_plus[i] - phi_minus[i]).collect();
    let ranking = super::topsis::rank_desc(&net_flow);
    Ok(PrometheeResult {
        phi_plus,
        phi_minus,
        net_flow,
        ranking,
    })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with PROMETHEE II using the **usual** criterion on
    /// every column, reusing its directions and sum-to-one normalised weights.
    pub fn promethee_ii_usual(&self) -> Result<PrometheeResult, String> {
        self.validate()?;
        let weights = self.normalized_weights();
        let types: Vec<Objective> = self
            .criteria
            .iter()
            .map(|c| match c.direction {
                super::wsm::Direction::Benefit => Objective::Max,
                super::wsm::Direction::Cost => Objective::Min,
            })
            .collect();
        let prefs = vec![PreferenceFunction::Usual; self.criteria.len()];
        let matrix: Vec<Vec<f64>> = self.alternatives.iter().map(|a| a.values.clone()).collect();
        promethee_ii(&matrix, &weights, &types, &prefs)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ref_matrix() -> Vec<Vec<f64>> {
        vec![
            vec![250.0, 16.0, 12.0],
            vec![200.0, 16.0, 8.0],
            vec![300.0, 32.0, 16.0],
            vec![275.0, 24.0, 10.0],
        ]
    }

    #[test]
    fn net_flows_sum_to_zero_and_rank() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let p = [PreferenceFunction::Usual; 3];
        let r = promethee_ii(&ref_matrix(), &w, &t, &p).unwrap();
        // Net flows of a complete PROMETHEE II ranking always sum to zero.
        let sum: f64 = r.net_flow.iter().sum();
        assert!(sum.abs() < 1e-12, "net flows sum to {sum}");
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 0, 1, 3]);
    }

    #[test]
    fn preference_function_shapes() {
        assert_eq!(PreferenceFunction::Usual.degree(0.0), 0.0);
        assert_eq!(PreferenceFunction::Usual.degree(3.0), 1.0);
        assert_eq!(PreferenceFunction::VShape { p: 4.0 }.degree(2.0), 0.5);
        assert_eq!(
            PreferenceFunction::Level { q: 1.0, p: 3.0 }.degree(2.0),
            0.5
        );
        assert_eq!(
            PreferenceFunction::Linear { q: 1.0, p: 3.0 }.degree(2.0),
            0.5
        );
        // Gaussian is monotone increasing in d.
        let g = PreferenceFunction::Gaussian { sigma: 1.0 };
        assert!(g.degree(0.5) < g.degree(2.0));
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        let p = [PreferenceFunction::Usual; 2];
        assert!(promethee_ii(&[vec![1.0, 2.0], vec![3.0]], &w, &t, &p).is_err());
    }
}
