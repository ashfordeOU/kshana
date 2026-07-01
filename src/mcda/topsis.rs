// SPDX-License-Identifier: AGPL-3.0-only
//! **TOPSIS** — Technique for Order of Preference by Similarity to Ideal Solution
//! (Hwang & Yoon 1981).
//!
//! The distance-to-ideal family member of the [`super`] toolkit. Each alternative
//! is scored by how close it sits to the *positive ideal solution* (the best value
//! achievable on every criterion at once) versus the *negative ideal solution* (the
//! worst on every criterion). The **relative closeness** `Cᵢ = d⁻ᵢ / (d⁺ᵢ + d⁻ᵢ)`
//! lands in `[0, 1]` — `1` is the ideal, `0` the anti-ideal — and the ranking sorts
//! the alternatives by descending closeness.
//!
//! **Normalisation.** This implementation uses **min–max** normalisation, oriented
//! by criterion direction (benefit: `(x−min)/(max−min)`, cost: `(max−x)/(max−min)`),
//! which makes every normalised column "larger is better" so the ideal solutions are
//! a plain per-column max / min of the weighted matrix. That is exactly the
//! composition `pymcdm.methods.TOPSIS(normalization_function=minmax_normalization)`,
//! against which [`topsis`] is validated to < 1e-9 (see
//! `tests/mcda_topsis_reference.rs`).
//!
//! **Honesty scope.** TOPSIS is a textbook closed-form aggregation; the strongest
//! claim it carries is "reproduces the independent third-party `pymcdm` reference
//! implementation to a stated tolerance." It says nothing about whether the *inputs*
//! are right — garbage criteria in, garbage decision out — which is why the
//! [`super::sensitivity`] robustness tools remain the module's real product.

use super::Objective;

/// The outcome of a [`topsis`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct TopsisResult {
    /// Relative closeness `Cᵢ ∈ [0, 1]` per alternative, in the original row order.
    pub closeness: Vec<f64>,
    /// Distance to the positive ideal solution `d⁺ᵢ`, per alternative.
    pub d_plus: Vec<f64>,
    /// Distance to the negative ideal solution `d⁻ᵢ`, per alternative.
    pub d_minus: Vec<f64>,
    /// Alternative indices best (highest closeness) first; ties broken by ascending
    /// index so the order is a deterministic total order.
    pub ranking: Vec<usize>,
}

impl TopsisResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Rank row indices by descending `key`, ties broken by ascending index.
pub(super) fn rank_desc(key: &[f64]) -> Vec<usize> {
    let mut idx: Vec<usize> = (0..key.len()).collect();
    idx.sort_by(|&a, &b| {
        key[b]
            .partial_cmp(&key[a])
            .unwrap_or(std::cmp::Ordering::Equal)
            .then(a.cmp(&b))
    });
    idx
}

/// Score a raw decision matrix with min–max TOPSIS.
///
/// `matrix` is `alternatives × criteria` (row per alternative), `weights` are the
/// per-criterion weights (used as given — normalise them to sum to one beforehand if
/// you want the classic convention), and `types` marks each criterion
/// [`Objective::Max`] (benefit) or [`Objective::Min`] (cost). Returns an error on a
/// shape mismatch or an empty matrix.
pub fn topsis(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
) -> Result<TopsisResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("TOPSIS: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("TOPSIS: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "TOPSIS: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "TOPSIS: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        if row.iter().any(|v| !v.is_finite()) {
            return Err(format!("TOPSIS: alternative {i} has a non-finite value"));
        }
    }

    // Min–max normalise, oriented by direction, then weight. A zero-range column
    // cannot discriminate, so it is treated as neutral (1.0) — a Kshana convention,
    // not exercised by the external oracle.
    let mut weighted = vec![vec![0.0f64; n]; m];
    for j in 0..n {
        let mut lo = f64::INFINITY;
        let mut hi = f64::NEG_INFINITY;
        for row in matrix {
            lo = lo.min(row[j]);
            hi = hi.max(row[j]);
        }
        let range = hi - lo;
        for (i, row) in matrix.iter().enumerate() {
            let norm = if range <= 0.0 {
                1.0
            } else {
                match types[j] {
                    Objective::Max => (row[j] - lo) / range,
                    Objective::Min => (hi - row[j]) / range,
                }
            };
            weighted[i][j] = weights[j] * norm;
        }
    }

    // Positive / negative ideal solutions: per-column max / min of the weighted,
    // direction-oriented matrix (every column is now "larger is better").
    let mut pis = vec![f64::NEG_INFINITY; n];
    let mut nis = vec![f64::INFINITY; n];
    for row in &weighted {
        for j in 0..n {
            pis[j] = pis[j].max(row[j]);
            nis[j] = nis[j].min(row[j]);
        }
    }

    let mut closeness = vec![0.0; m];
    let mut d_plus = vec![0.0; m];
    let mut d_minus = vec![0.0; m];
    for (i, row) in weighted.iter().enumerate() {
        let mut dp = 0.0;
        let mut dm = 0.0;
        for j in 0..n {
            dp += (row[j] - pis[j]).powi(2);
            dm += (row[j] - nis[j]).powi(2);
        }
        let dp = dp.sqrt();
        let dm = dm.sqrt();
        d_plus[i] = dp;
        d_minus[i] = dm;
        let denom = dp + dm;
        closeness[i] = if denom > 0.0 { dm / denom } else { 0.0 };
    }

    let ranking = rank_desc(&closeness);
    Ok(TopsisResult {
        closeness,
        d_plus,
        d_minus,
        ranking,
    })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with min–max [`topsis`], reusing its criterion
    /// directions and sum-to-one normalised weights.
    pub fn topsis(&self) -> Result<TopsisResult, String> {
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
        let matrix: Vec<Vec<f64>> = self.alternatives.iter().map(|a| a.values.clone()).collect();
        topsis(&matrix, &weights, &types)
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
    fn closeness_in_unit_interval_and_ranked() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = topsis(&ref_matrix(), &w, &t).unwrap();
        assert_eq!(r.closeness.len(), 4);
        for c in &r.closeness {
            assert!((0.0..=1.0).contains(c), "closeness {c} out of [0,1]");
        }
        // A2 dominates on both benefits at low-ish cost → the winner.
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 1, 0, 3]);
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        let bad = vec![vec![1.0, 2.0], vec![3.0]];
        assert!(topsis(&bad, &w, &t).is_err());
    }

    #[test]
    fn zero_range_column_is_neutral_not_nan() {
        // Every alternative identical on criterion 0 → that column cannot discriminate.
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        let m = vec![vec![5.0, 1.0], vec![5.0, 2.0], vec![5.0, 3.0]];
        let r = topsis(&m, &w, &t).unwrap();
        assert!(r.closeness.iter().all(|c| c.is_finite()));
        assert_eq!(r.winner(), Some(2));
    }
}
