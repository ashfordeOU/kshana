// SPDX-License-Identifier: AGPL-3.0-only
//! **MOORA** — Multi-Objective Optimisation by Ratio Analysis, ratio system
//! (Brauers & Zavadskas 2006).
//!
//! The vector-normalised ratio member of the toolkit. Each column is put on a
//! dimensionless footing by its Euclidean (L2) norm, `nᵢⱼ = xᵢⱼ / √(Σᵢ xᵢⱼ²)`, and
//! each alternative's composite score is the weighted benefit total minus the weighted
//! cost total: `yᵢ = Σ_{j∈benefit} wⱼ nᵢⱼ − Σ_{j∈cost} wⱼ nᵢⱼ`. Higher is better, and
//! unlike the closeness / preference indices of TOPSIS or PROMETHEE the MOORA score is
//! a signed quantity on the normalised scale.
//!
//! **Normalisation.** Vector (L2) normalisation. That is exactly
//! `pymcdm.methods.MOORA` (whose ratio-system `_method` uses `matrix / √Σ matrix²`),
//! against which [`moora`] is validated to < 1e-9 (see `tests/mcda_moora_reference.rs`).
//! `pymcdm` additionally *requires* at least one cost criterion; this implementation
//! does not impose that (an all-benefit ratio system is still well defined), but the
//! validated fixture includes a cost criterion so the cross-check exercises both
//! branches.
//!
//! **Honesty scope.** A textbook closed-form aggregation; the strongest claim is
//! "reproduces the independent third-party `pymcdm` reference to a stated tolerance."
//! It says nothing about whether the inputs are right — see [`super::sensitivity`].

use super::Objective;

/// The outcome of a [`moora`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct MooraResult {
    /// Composite ratio score `yᵢ` (benefit total − cost total) per alternative, in the
    /// original row order; higher is better. Signed.
    pub scores: Vec<f64>,
    /// Alternative indices best (highest score) first; ties broken by ascending index.
    pub ranking: Vec<usize>,
}

impl MooraResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Score a raw decision matrix with the vector-normalised MOORA ratio system.
///
/// `matrix` is `alternatives × criteria`, `weights` are per criterion (used as given),
/// `types` marks each criterion [`Objective::Max`] (benefit, added) or
/// [`Objective::Min`] (cost, subtracted). Errors on a shape mismatch, empty matrix,
/// non-finite value, or a criterion whose column has zero L2 norm (indiscriminable).
pub fn moora(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
) -> Result<MooraResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("MOORA: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("MOORA: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "MOORA: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "MOORA: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        if row.iter().any(|v| !v.is_finite()) {
            return Err(format!("MOORA: alternative {i} has a non-finite value"));
        }
    }

    // Vector (L2) normalisation per column.
    let mut norm = vec![vec![0.0f64; n]; m];
    for j in 0..n {
        let l2 = matrix.iter().map(|r| r[j] * r[j]).sum::<f64>().sqrt();
        if l2 <= 0.0 {
            return Err(format!("MOORA: criterion {j} has zero L2 norm"));
        }
        for i in 0..m {
            norm[i][j] = matrix[i][j] / l2;
        }
    }

    let scores: Vec<f64> = norm
        .iter()
        .map(|row| {
            (0..n)
                .map(|j| {
                    let term = weights[j] * row[j];
                    match types[j] {
                        Objective::Max => term,
                        Objective::Min => -term,
                    }
                })
                .sum::<f64>()
        })
        .collect();

    let ranking = super::topsis::rank_desc(&scores);
    Ok(MooraResult { scores, ranking })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with the vector-normalised [`moora`] ratio system,
    /// reusing its criterion directions and sum-to-one normalised weights.
    pub fn moora(&self) -> Result<MooraResult, String> {
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
        moora(&matrix, &weights, &types)
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
    fn ratio_scores_ranked() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = moora(&ref_matrix(), &w, &t).unwrap();
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 3, 0, 1]);
    }

    #[test]
    fn zero_column_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Min];
        let bad = vec![vec![0.0, 1.0], vec![0.0, 2.0]];
        assert!(moora(&bad, &w, &t).is_err());
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(moora(&[vec![1.0, 2.0], vec![3.0]], &w, &t).is_err());
    }
}
