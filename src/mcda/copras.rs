// SPDX-License-Identifier: AGPL-3.0-only
//! **COPRAS** — COmplex PRoportional ASsessment (Zavadskas & Kaklauskas 1996).
//!
//! An outranking-flavoured proportional method that scores each alternative by
//! summing its *benefit* significance and adding a *cost* significance that is
//! inversely proportional to its own weighted cost total. Concretely, after
//! column-sum normalisation `nᵢⱼ = xᵢⱼ / Σᵢ xᵢⱼ` and weighting `vᵢⱼ = wⱼ nᵢⱼ`:
//!
//! * `S⁺ᵢ = Σ_{j∈benefit} vᵢⱼ` — the "the more the better" total,
//! * `S⁻ᵢ = Σ_{j∈cost} vᵢⱼ` — the "the less the better" total,
//! * the relative significance
//!   `Qᵢ = S⁺ᵢ + (min_k S⁻_k · Σ_k S⁻_k) / (S⁻ᵢ · Σ_k (min_k S⁻_k / S⁻_k))`, and
//! * the utility degree `Uᵢ = Qᵢ / max_k Q_k ∈ (0, 1]`.
//!
//! COPRAS requires at least one cost criterion (the `S⁻` term is otherwise
//! degenerate).
//!
//! **Oracle choice (load-bearing).** The `Qᵢ` cost term is the piece implementations
//! disagree on. `pymcdm` 1.4.0's `COPRAS._method` collapses algebraically to the
//! trivial `Qᵢ = S⁺ᵢ + S⁻ᵢ` and is therefore **not** a faithful COPRAS reference, so
//! it is deliberately *not* used here. This module is instead validated to < 1e-9
//! against **pyDecision**'s `copras_method`, which implements the canonical
//! relative-significance formula above (see `tests/mcda_copras_reference.rs`).
//!
//! **Honesty scope.** A textbook closed-form aggregation; the strongest claim is
//! "reproduces the independent third-party `pyDecision` reference to a stated
//! tolerance." Column-sum normalisation divides, so COPRAS requires strictly positive
//! data. Like every method here it validates nothing about the inputs — see
//! [`super::sensitivity`].

use super::Objective;

/// The outcome of a [`copras`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct CoprasResult {
    /// Utility degree `Uᵢ = Qᵢ / max Q ∈ (0, 1]` per alternative (original row order);
    /// higher is better. This is what pyDecision reports.
    pub utility: Vec<f64>,
    /// Relative-significance value `Qᵢ` per alternative, before the `/max` scaling.
    pub q: Vec<f64>,
    /// Benefit significance `S⁺ᵢ` per alternative.
    pub s_plus: Vec<f64>,
    /// Cost significance `S⁻ᵢ` per alternative.
    pub s_minus: Vec<f64>,
    /// Alternative indices best (highest utility) first; ties broken by ascending index.
    pub ranking: Vec<usize>,
}

impl CoprasResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Score a raw decision matrix with COPRAS.
///
/// `matrix` is `alternatives × criteria` and must be **strictly positive** (column-sum
/// normalisation divides). `weights` are per criterion (used as given), `types` marks
/// each criterion [`Objective::Max`] (benefit) or [`Objective::Min`] (cost); at least
/// one criterion must be a cost. Errors on a shape mismatch, empty matrix, non-positive
/// value, or the absence of any cost criterion.
pub fn copras(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
) -> Result<CoprasResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("COPRAS: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("COPRAS: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "COPRAS: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    if !types.contains(&Objective::Min) {
        return Err("COPRAS: requires at least one cost (Min) criterion".into());
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "COPRAS: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        for (j, &x) in row.iter().enumerate() {
            if !x.is_finite() || x <= 0.0 {
                return Err(format!(
                    "COPRAS: alternative {i} criterion {j} value {x} must be finite and > 0"
                ));
            }
        }
    }

    // Column-sum normalisation, then weight.
    let mut weighted = vec![vec![0.0f64; n]; m];
    for j in 0..n {
        let sum: f64 = matrix.iter().map(|r| r[j]).sum();
        for i in 0..m {
            weighted[i][j] = weights[j] * (matrix[i][j] / sum);
        }
    }

    let mut s_plus = vec![0.0f64; m];
    let mut s_minus = vec![0.0f64; m];
    for i in 0..m {
        for j in 0..n {
            match types[j] {
                Objective::Max => s_plus[i] += weighted[i][j],
                Objective::Min => s_minus[i] += weighted[i][j],
            }
        }
    }

    // Relative significance. min(S⁻) is guaranteed > 0 (positive data, ≥1 cost).
    let min_sm = s_minus.iter().copied().fold(f64::INFINITY, f64::min);
    let sum_sm: f64 = s_minus.iter().sum();
    let sum_ratio: f64 = s_minus.iter().map(|sm| min_sm / sm).sum();
    let q: Vec<f64> = (0..m)
        .map(|i| s_plus[i] + (min_sm * sum_sm) / (s_minus[i] * sum_ratio))
        .collect();

    let max_q = q.iter().copied().fold(f64::NEG_INFINITY, f64::max);
    let utility: Vec<f64> = q.iter().map(|qi| qi / max_q).collect();

    let ranking = super::topsis::rank_desc(&utility);
    Ok(CoprasResult {
        utility,
        q,
        s_plus,
        s_minus,
        ranking,
    })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with [`copras`], reusing its criterion directions and
    /// sum-to-one normalised weights. Requires strictly positive raw values and at
    /// least one cost criterion.
    pub fn copras(&self) -> Result<CoprasResult, String> {
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
        copras(&matrix, &weights, &types)
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
    fn utility_in_unit_interval_and_ranked() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = copras(&ref_matrix(), &w, &t).unwrap();
        for u in &r.utility {
            assert!((0.0..=1.0 + 1e-12).contains(u), "utility {u} out of (0,1]");
        }
        // Best alternative has utility exactly 1.
        assert!((r.utility[r.winner().unwrap()] - 1.0).abs() < 1e-12);
        assert_eq!(r.winner(), Some(2));
        assert_eq!(r.ranking, vec![2, 3, 1, 0]);
    }

    #[test]
    fn all_benefit_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(copras(&[vec![1.0, 2.0], vec![3.0, 4.0]], &w, &t).is_err());
    }

    #[test]
    fn non_positive_value_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Min, Objective::Max];
        assert!(copras(&[vec![1.0, 0.0], vec![2.0, 3.0]], &w, &t).is_err());
    }
}
