// SPDX-License-Identifier: AGPL-3.0-only
//! **WASPAS** — Weighted Aggregated Sum Product ASSessment (Zavadskas et al. 2012).
//!
//! The convex blend of the two value-aggregation members of the toolkit: WASPAS
//! forms `Pᵢ = λ·(Σⱼ nᵢⱼ wⱼ) + (1−λ)·(Πⱼ nᵢⱼ^wⱼ)` — the [`super::wsm`] weighted sum
//! and the [`super::wpm`] weighted product of the *same* normalised matrix, mixed by
//! the strategy parameter `λ ∈ [0, 1]` (the canonical default is `λ = 0.5`). It keeps
//! the compensatory character of the sum while borrowing some of the product's
//! resistance to it, and empirically ranks more stably than either half alone.
//!
//! **Normalisation.** Linear (max) normalisation, oriented by direction: for a
//! benefit `nᵢⱼ = xᵢⱼ / maxᵢ xᵢⱼ`, for a cost `nᵢⱼ = minᵢ xᵢⱼ / xᵢⱼ`. That is exactly
//! `pymcdm.methods.WASPAS(normalization_function=linear_normalization, l=0.5)`,
//! against which [`waspas`] is validated to < 1e-9 (see
//! `tests/mcda_waspas_reference.rs`).
//!
//! **Honesty scope.** A textbook closed-form aggregation; the strongest claim is
//! "reproduces the independent third-party `pymcdm` reference to a stated tolerance."
//! Linear normalisation divides, so WASPAS requires strictly positive data, and like
//! every value method it validates nothing about the inputs — see
//! [`super::sensitivity`].

use super::Objective;

/// The outcome of a [`waspas`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct WaspasResult {
    /// Blended WASPAS preference `Pᵢ` per alternative (original row order); higher is
    /// better.
    pub scores: Vec<f64>,
    /// The additive (WSM) half `Σⱼ nᵢⱼ wⱼ` per alternative.
    pub q_sum: Vec<f64>,
    /// The multiplicative (WPM) half `Πⱼ nᵢⱼ^wⱼ` per alternative.
    pub q_prod: Vec<f64>,
    /// The blend parameter `λ` actually used.
    pub lambda: f64,
    /// Alternative indices best (highest score) first; ties broken by ascending index.
    pub ranking: Vec<usize>,
}

impl WaspasResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Score a raw decision matrix with linear-normalised WASPAS at blend `lambda`.
///
/// `matrix` is `alternatives × criteria` and must be **strictly positive** (linear
/// normalisation divides by column max / by each cost value). `weights` are per
/// criterion (used as given), `types` marks each criterion [`Objective::Max`] /
/// [`Objective::Min`], and `lambda ∈ [0, 1]` mixes the sum (`λ`) and product (`1−λ`)
/// halves. Errors on a shape mismatch, empty matrix, non-positive value, or a `lambda`
/// outside `[0, 1]`.
pub fn waspas(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
    lambda: f64,
) -> Result<WaspasResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("WASPAS: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("WASPAS: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "WASPAS: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    if !(0.0..=1.0).contains(&lambda) || !lambda.is_finite() {
        return Err(format!("WASPAS: lambda {lambda} must lie in [0, 1]"));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "WASPAS: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        for (j, &x) in row.iter().enumerate() {
            if !x.is_finite() || x <= 0.0 {
                return Err(format!(
                    "WASPAS: alternative {i} criterion {j} value {x} must be finite and > 0"
                ));
            }
        }
    }

    // Linear (max) normalisation oriented by direction.
    let mut norm = vec![vec![0.0f64; n]; m];
    for j in 0..n {
        match types[j] {
            Objective::Max => {
                let hi = matrix
                    .iter()
                    .map(|r| r[j])
                    .fold(f64::NEG_INFINITY, f64::max);
                for i in 0..m {
                    norm[i][j] = matrix[i][j] / hi;
                }
            }
            Objective::Min => {
                let lo = matrix.iter().map(|r| r[j]).fold(f64::INFINITY, f64::min);
                for i in 0..m {
                    norm[i][j] = lo / matrix[i][j];
                }
            }
        }
    }

    let q_sum: Vec<f64> = norm
        .iter()
        .map(|row| (0..n).map(|j| row[j] * weights[j]).sum::<f64>())
        .collect();
    let q_prod: Vec<f64> = norm
        .iter()
        .map(|row| (0..n).map(|j| row[j].powf(weights[j])).product::<f64>())
        .collect();
    let scores: Vec<f64> = (0..m)
        .map(|i| lambda * q_sum[i] + (1.0 - lambda) * q_prod[i])
        .collect();

    let ranking = super::topsis::rank_desc(&scores);
    Ok(WaspasResult {
        scores,
        q_sum,
        q_prod,
        lambda,
        ranking,
    })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with linear-normalised [`waspas`] at the canonical
    /// blend `λ = 0.5`, reusing its criterion directions and sum-to-one normalised
    /// weights. Requires strictly positive raw values.
    pub fn waspas(&self) -> Result<WaspasResult, String> {
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
        waspas(&matrix, &weights, &types, 0.5)
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
    fn blend_lies_between_its_halves_and_ranks() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = waspas(&ref_matrix(), &w, &t, 0.5).unwrap();
        for i in 0..4 {
            let lo = r.q_sum[i].min(r.q_prod[i]);
            let hi = r.q_sum[i].max(r.q_prod[i]);
            assert!(
                r.scores[i] >= lo - 1e-12 && r.scores[i] <= hi + 1e-12,
                "blend {} outside [{lo}, {hi}]",
                r.scores[i]
            );
        }
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 3, 1, 0]);
    }

    #[test]
    fn lambda_zero_is_wpm_lambda_one_is_wsm() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r0 = waspas(&ref_matrix(), &w, &t, 0.0).unwrap();
        let r1 = waspas(&ref_matrix(), &w, &t, 1.0).unwrap();
        for i in 0..4 {
            assert!((r0.scores[i] - r0.q_prod[i]).abs() < 1e-12);
            assert!((r1.scores[i] - r1.q_sum[i]).abs() < 1e-12);
        }
    }

    #[test]
    fn out_of_range_lambda_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(waspas(&[vec![1.0, 2.0], vec![3.0, 4.0]], &w, &t, 1.5).is_err());
    }

    #[test]
    fn non_positive_value_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(waspas(&[vec![1.0, 0.0], vec![2.0, 3.0]], &w, &t, 0.5).is_err());
    }
}
