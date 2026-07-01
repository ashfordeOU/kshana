// SPDX-License-Identifier: AGPL-3.0-only
//! **ELECTRE I** — ELimination Et Choix Traduisant la REalité (Roy 1968):
//! outranking by concordance / discordance with a choice **kernel**.
//!
//! The second outranking member of the [`super`] toolkit (alongside
//! [`super::promethee`]), and the one that answers a different question: not "rank
//! every alternative" but "which minimal *set* of alternatives is defensible, and
//! which are outranked out of contention?" ELECTRE I builds, for every ordered pair,
//!
//! * a **concordance** `C(a,b) ∈ [0,1]` — the weighted fraction of criteria on which
//!   `a` is at least as good as `b`; and
//! * a **discordance** `D(a,b) ∈ [0,1]` — the worst single-criterion disadvantage of
//!   `a` versus `b`, scaled by the global value range.
//!
//! `a` **outranks** `b` when `C(a,b) ≥ ĉ` (enough agreement) *and* `D(a,b) ≤ d̂` (no
//! veto). The outranking graph's **kernel** is the choice set: no member outranks
//! another, and every non-member is outranked by some member.
//!
//! This implementation reproduces the widely-used **pyDecision** `electre_i`
//! convention (all-benefit dataset, sum-normalised weights, a single global
//! discordance scale `Δ = maxₖ(maxᵢ xᵢₖ − minᵢ xᵢₖ)`), against which the concordance,
//! discordance, dominance matrices and the kernel are validated element-for-element
//! to < 1e-9 (see `tests/mcda_electre_reference.rs`).
//!
//! **Honesty scope.** A textbook closed-form outranking method; the strongest claim
//! is "reproduces the independent third-party `pyDecision` reference to a stated
//! tolerance." The concordance/discordance thresholds `ĉ`, `d̂` are analyst choices
//! the method cannot settle — see [`super::sensitivity`] for the robustness caveat.

/// The outcome of an [`electre_i`] run over an all-benefit dataset.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct ElectreResult {
    /// Concordance matrix `C(a,b) ∈ [0,1]` (row `a`, column `b`).
    pub concordance: Vec<Vec<f64>>,
    /// Discordance matrix `D(a,b) ∈ [0,1]`.
    pub discordance: Vec<Vec<f64>>,
    /// Outranking (dominance) matrix: `true` where `a` outranks `b`.
    pub dominance: Vec<Vec<bool>>,
    /// The choice **kernel** — alternative indices in the outranking kernel.
    pub kernel: Vec<usize>,
    /// Alternatives outranked out of contention by a kernel member.
    pub dominated: Vec<usize>,
}

/// Run ELECTRE I over an **all-benefit** dataset (every criterion "larger is better")
/// with sum-normalised weights and the concordance / discordance thresholds `c_hat`,
/// `d_hat`.
///
/// `dataset` is `alternatives × criteria`. To score a matrix with cost criteria, use
/// the [`super::wsm::DecisionMatrix::electre_i`] bridge, which orients cost columns
/// first. Errors on a shape mismatch, empty dataset, or non-finite value.
pub fn electre_i(
    dataset: &[Vec<f64>],
    weights: &[f64],
    c_hat: f64,
    d_hat: f64,
) -> Result<ElectreResult, String> {
    let m = dataset.len();
    if m == 0 {
        return Err("ELECTRE I: empty dataset".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("ELECTRE I: no criteria".into());
    }
    for (i, row) in dataset.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "ELECTRE I: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        if row.iter().any(|x| !x.is_finite()) {
            return Err(format!("ELECTRE I: alternative {i} has a non-finite value"));
        }
    }
    let wsum: f64 = weights.iter().sum();

    // Concordance C(a,b) = Σ_{k: x_ak ≥ x_bk} w_k / Σw.
    let mut concordance = vec![vec![0.0f64; m]; m];
    for a in 0..m {
        for b in 0..m {
            let mut acc = 0.0;
            for k in 0..n {
                if dataset[a][k] >= dataset[b][k] {
                    acc += weights[k];
                }
            }
            concordance[a][b] = if wsum != 0.0 { acc / wsum } else { 0.0 };
        }
    }

    // Discordance D(a,b) = max_k(x_bk − x_ak) / Δ, clamped ≥ 0, with a single global
    // scale Δ = max_k(max_i x_ik − min_i x_ik).
    let mut delta = 0.0f64;
    for k in 0..n {
        let mut lo = f64::INFINITY;
        let mut hi = f64::NEG_INFINITY;
        for row in dataset {
            lo = lo.min(row[k]);
            hi = hi.max(row[k]);
        }
        delta = delta.max(hi - lo);
    }
    let mut discordance = vec![vec![0.0f64; m]; m];
    for a in 0..m {
        for b in 0..m {
            let worst = dataset[b]
                .iter()
                .zip(dataset[a].iter())
                .map(|(bk, ak)| bk - ak)
                .fold(f64::NEG_INFINITY, f64::max);
            let d = if delta != 0.0 { worst / delta } else { 0.0 };
            discordance[a][b] = if d < 0.0 { 0.0 } else { d };
        }
    }

    // Dominance: a outranks b iff C ≥ ĉ and D ≤ d̂ and a ≠ b.
    let mut dominance = vec![vec![false; m]; m];
    for a in 0..m {
        for b in 0..m {
            if a != b && concordance[a][b] >= c_hat && discordance[a][b] <= d_hat {
                dominance[a][b] = true;
            }
        }
    }

    // Kernel: columns with no dominator, then the pyDecision coverage pass.
    let mut kernel: Vec<usize> = (0..m)
        .filter(|&j| (0..m).all(|i| !dominance[i][j]))
        .collect();
    // A column outranked by any current kernel member is dominated out of contention.
    let dominated: Vec<usize> = (0..m)
        .filter(|&j| kernel.iter().any(|&ki| dominance[ki][j]))
        .collect();
    // Coverage pass (pyDecision): an alternative that has a dominator but is not
    // dominated by any current kernel member joins the kernel.
    let additions: Vec<usize> = (0..m)
        .filter(|&j| {
            !kernel.contains(&j)
                && !dominated.contains(&j)
                && (0..m).any(|i| dominance[i][j])
                && kernel.iter().any(|&ki| !dominance[ki][j])
        })
        .collect();
    kernel.extend(additions);
    kernel.sort_unstable();

    Ok(ElectreResult {
        concordance,
        discordance,
        dominance,
        kernel,
        dominated,
    })
}

impl super::wsm::DecisionMatrix {
    /// Run [`electre_i`] on this decision matrix, orienting cost criteria to
    /// all-benefit (by negation) and using its sum-to-one normalised weights, with the
    /// supplied concordance / discordance thresholds.
    pub fn electre_i(&self, c_hat: f64, d_hat: f64) -> Result<ElectreResult, String> {
        self.validate()?;
        let weights = self.normalized_weights();
        let dataset: Vec<Vec<f64>> = self
            .alternatives
            .iter()
            .map(|a| {
                a.values
                    .iter()
                    .zip(&self.criteria)
                    .map(|(&x, c)| match c.direction {
                        super::wsm::Direction::Benefit => x,
                        super::wsm::Direction::Cost => -x,
                    })
                    .collect()
            })
            .collect();
        electre_i(&dataset, &weights, c_hat, d_hat)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ref_dataset() -> Vec<Vec<f64>> {
        vec![
            vec![0.80, 0.60, 0.90],
            vec![0.70, 0.90, 0.50],
            vec![0.50, 0.80, 0.70],
            vec![0.90, 0.40, 0.60],
        ]
    }

    #[test]
    fn diagonal_and_ranges() {
        let w = [0.40, 0.35, 0.25];
        let r = electre_i(&ref_dataset(), &w, 0.65, 0.40).unwrap();
        // Concordance diagonal is 1 (an alternative is ≥ itself everywhere);
        // discordance diagonal is 0.
        for i in 0..4 {
            assert!((r.concordance[i][i] - 1.0).abs() < 1e-12);
            assert!(r.discordance[i][i].abs() < 1e-12);
        }
        // Every entry in [0,1].
        for a in 0..4 {
            for b in 0..4 {
                assert!((0.0..=1.0).contains(&r.concordance[a][b]));
                assert!((0.0..=1.0).contains(&r.discordance[a][b]));
            }
        }
    }

    #[test]
    fn kernel_is_a3_dropped() {
        let w = [0.40, 0.35, 0.25];
        let r = electre_i(&ref_dataset(), &w, 0.65, 0.40).unwrap();
        assert_eq!(r.kernel, vec![0, 1, 3]);
        assert_eq!(r.dominated, vec![2]);
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        assert!(electre_i(&[vec![1.0, 2.0], vec![3.0]], &w, 0.6, 0.4).is_err());
    }
}
