// SPDX-License-Identifier: AGPL-3.0-only
//! **WPM** — Weighted Product Model (Bridgman 1922; Miller & Starr 1969).
//!
//! The multiplicative sibling of [`super::wsm`] and the second value-aggregation
//! member of the toolkit. Where WSM forms a weighted *sum*, WPM forms a weighted
//! *product* `Sᵢ = Πⱼ (nᵢⱼ)^wⱼ` of sum-normalised per-criterion values. Because it
//! multiplies dimensionless ratios, WPM is naturally scale-invariant and never mixes
//! units additively — a criterion an alternative scores zero on annihilates its whole
//! score, which is exactly the "no compensation across a hard-zero" behaviour some
//! trade studies want.
//!
//! **Normalisation.** Sum normalisation, oriented by direction: for a benefit
//! `nᵢⱼ = xᵢⱼ / Σᵢ xᵢⱼ`; for a cost `nᵢⱼ = (1/xᵢⱼ) / Σᵢ (1/xᵢⱼ)`. That is exactly
//! `pymcdm.methods.WPM(normalization_function=sum_normalization)`, against which
//! [`wpm`] is validated to < 1e-9 (see `tests/mcda_wpm_reference.rs`).
//!
//! **Honesty scope.** A textbook closed-form aggregation; the strongest claim is
//! "reproduces the independent third-party `pymcdm` reference to a stated tolerance."
//! WPM requires strictly positive data (it takes logs/reciprocals) and, like WSM,
//! validates nothing about the inputs — see [`super::sensitivity`].

use super::Objective;

/// The outcome of a [`wpm`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct WpmResult {
    /// Weighted-product score `Sᵢ` per alternative (original row order); higher is
    /// better.
    pub scores: Vec<f64>,
    /// Alternative indices best (highest score) first; ties broken by ascending index.
    pub ranking: Vec<usize>,
}

impl WpmResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Score a raw decision matrix with the sum-normalised Weighted Product Model.
///
/// `matrix` is `alternatives × criteria` and must be **strictly positive** (WPM takes
/// reciprocals of cost columns and raises to fractional powers). `weights` are per
/// criterion (used as given), `types` marks each criterion [`Objective::Max`] /
/// [`Objective::Min`]. Errors on a shape mismatch, empty matrix, or non-positive
/// value.
pub fn wpm(matrix: &[Vec<f64>], weights: &[f64], types: &[Objective]) -> Result<WpmResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("WPM: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("WPM: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "WPM: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "WPM: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        for (j, &x) in row.iter().enumerate() {
            if !x.is_finite() || x <= 0.0 {
                return Err(format!(
                    "WPM: alternative {i} criterion {j} value {x} must be finite and > 0"
                ));
            }
        }
    }

    // Sum normalisation oriented by direction. For a cost, normalise reciprocals.
    let mut norm = vec![vec![0.0f64; n]; m];
    for j in 0..n {
        match types[j] {
            Objective::Max => {
                let sum: f64 = matrix.iter().map(|r| r[j]).sum();
                for i in 0..m {
                    norm[i][j] = matrix[i][j] / sum;
                }
            }
            Objective::Min => {
                let sum_recip: f64 = matrix.iter().map(|r| 1.0 / r[j]).sum();
                for i in 0..m {
                    norm[i][j] = (1.0 / matrix[i][j]) / sum_recip;
                }
            }
        }
    }

    let scores: Vec<f64> = norm
        .iter()
        .map(|row| (0..n).map(|j| row[j].powf(weights[j])).product::<f64>())
        .collect();

    let ranking = super::topsis::rank_desc(&scores);
    Ok(WpmResult { scores, ranking })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with the sum-normalised [`wpm`], reusing its
    /// criterion directions and sum-to-one normalised weights. Requires strictly
    /// positive raw values.
    pub fn wpm(&self) -> Result<WpmResult, String> {
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
        wpm(&matrix, &weights, &types)
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
    fn scores_positive_and_ranked() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = wpm(&ref_matrix(), &w, &t).unwrap();
        assert!(r.scores.iter().all(|s| *s > 0.0));
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 3, 0, 1]);
    }

    #[test]
    fn non_positive_value_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(wpm(&[vec![1.0, 0.0], vec![2.0, 3.0]], &w, &t).is_err());
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(wpm(&[vec![1.0, 2.0], vec![3.0]], &w, &t).is_err());
    }
}
