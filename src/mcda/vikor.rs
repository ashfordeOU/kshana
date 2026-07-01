// SPDX-License-Identifier: AGPL-3.0-only
//! **VIKOR** — VlseKriterijumska Optimizacija I Kompromisno Resenje (Opricovic &
//! Tzeng 2004): multi-criteria *compromise* ranking.
//!
//! The compromise-programming member of the [`super`] toolkit. Where TOPSIS scores
//! closeness to an ideal, VIKOR ranks by an aggregate *regret* from the ideal that
//! blends two views:
//!
//! * `Sᵢ` — the **group utility** (sum of weighted, range-normalised per-criterion
//!   regrets); minimising `S` favours the majority of criteria.
//! * `Rᵢ` — the **individual regret** (the single worst weighted regret); minimising
//!   `R` protects against an unacceptable outcome on any one criterion.
//!
//! These are combined into `Qᵢ = v·(Sᵢ−S*)/(S⁻−S*) + (1−v)·(Rᵢ−R*)/(R⁻−R*)` with the
//! strategy weight `v` (default `0.5` — "consensus"). **Lower `Q` is better.** This
//! is exactly `pymcdm.methods.VIKOR(v=0.5)` (no pre-normalisation; the method's own
//! range normalisation of regrets), against which [`vikor`] is validated to < 1e-9
//! (see `tests/mcda_vikor_reference.rs`).
//!
//! **Honesty scope.** A textbook closed-form aggregation; the strongest claim is
//! "reproduces the independent third-party `pymcdm` reference to a stated tolerance."
//! It does not validate the inputs — see [`super::sensitivity`] for the robustness
//! caveat that is the module's real product.

use super::Objective;

/// The outcome of a [`vikor`] run.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct VikorResult {
    /// Group-utility measure `Sᵢ` per alternative (original row order).
    pub s: Vec<f64>,
    /// Individual-regret measure `Rᵢ` per alternative.
    pub r: Vec<f64>,
    /// Compromise index `Qᵢ` per alternative; **lower is better**.
    pub q: Vec<f64>,
    /// Alternative indices best (lowest `Q`) first; ties broken by ascending index.
    pub ranking: Vec<usize>,
}

impl VikorResult {
    /// The winning (rank-0) alternative index, or `None` if there were no rows.
    pub fn winner(&self) -> Option<usize> {
        self.ranking.first().copied()
    }
}

/// Rank row indices by *ascending* `key` (VIKOR: lower `Q` is better), ties broken by
/// ascending index.
fn rank_asc(key: &[f64]) -> Vec<usize> {
    let mut idx: Vec<usize> = (0..key.len()).collect();
    idx.sort_by(|&a, &b| {
        key[a]
            .partial_cmp(&key[b])
            .unwrap_or(std::cmp::Ordering::Equal)
            .then(a.cmp(&b))
    });
    idx
}

/// Score a raw decision matrix with VIKOR at strategy weight `v` (`0.5` is the
/// conventional consensus value).
///
/// `matrix` is `alternatives × criteria`, `weights` per criterion (used as given),
/// `types` marks each criterion [`Objective::Max`] (benefit) or [`Objective::Min`]
/// (cost). Errors on a shape mismatch or empty matrix.
pub fn vikor(
    matrix: &[Vec<f64>],
    weights: &[f64],
    types: &[Objective],
    v: f64,
) -> Result<VikorResult, String> {
    let m = matrix.len();
    if m == 0 {
        return Err("VIKOR: empty decision matrix".into());
    }
    let n = weights.len();
    if n == 0 {
        return Err("VIKOR: no criteria".into());
    }
    if types.len() != n {
        return Err(format!(
            "VIKOR: {} weights but {} criterion types",
            n,
            types.len()
        ));
    }
    for (i, row) in matrix.iter().enumerate() {
        if row.len() != n {
            return Err(format!(
                "VIKOR: alternative {i} has {} values but there are {n} criteria",
                row.len()
            ));
        }
        if row.iter().any(|x| !x.is_finite()) {
            return Err(format!("VIKOR: alternative {i} has a non-finite value"));
        }
    }

    // Per-criterion best (f*) and worst (f-) with regret oriented by direction:
    // for a benefit, regret = (best − x)/(best − worst); for a cost, regret =
    // (x − best)/(worst − best). Both reduce to distance-from-ideal / range.
    let mut best = vec![0.0f64; n];
    let mut worst = vec![0.0f64; n];
    for j in 0..n {
        let mut lo = f64::INFINITY;
        let mut hi = f64::NEG_INFINITY;
        for row in matrix {
            lo = lo.min(row[j]);
            hi = hi.max(row[j]);
        }
        match types[j] {
            Objective::Max => {
                best[j] = hi;
                worst[j] = lo;
            }
            Objective::Min => {
                best[j] = lo;
                worst[j] = hi;
            }
        }
    }

    let mut s = vec![0.0; m];
    let mut r = vec![0.0; m];
    for (i, row) in matrix.iter().enumerate() {
        let mut si = 0.0;
        let mut ri = 0.0f64;
        for j in 0..n {
            let range = best[j] - worst[j];
            // A zero-range criterion contributes no regret (cannot discriminate).
            let regret = if range == 0.0 {
                0.0
            } else {
                weights[j] * (best[j] - row[j]) / range
            };
            si += regret;
            ri = ri.max(regret);
        }
        s[i] = si;
        r[i] = ri;
    }

    let s_star = s.iter().cloned().fold(f64::INFINITY, f64::min);
    let s_minus = s.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let r_star = r.iter().cloned().fold(f64::INFINITY, f64::min);
    let r_minus = r.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    let s_span = s_minus - s_star;
    let r_span = r_minus - r_star;

    let q: Vec<f64> = (0..m)
        .map(|i| {
            let qs = if s_span == 0.0 {
                0.0
            } else {
                v * (s[i] - s_star) / s_span
            };
            let qr = if r_span == 0.0 {
                0.0
            } else {
                (1.0 - v) * (r[i] - r_star) / r_span
            };
            qs + qr
        })
        .collect();

    let ranking = rank_asc(&q);
    Ok(VikorResult { s, r, q, ranking })
}

impl super::wsm::DecisionMatrix {
    /// Score this decision matrix with [`vikor`] at the consensus strategy `v = 0.5`,
    /// reusing its criterion directions and sum-to-one normalised weights.
    pub fn vikor(&self) -> Result<VikorResult, String> {
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
        vikor(&matrix, &weights, &types, 0.5)
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
    fn q_lower_is_better_and_ranked() {
        let w = [0.40, 0.35, 0.25];
        let t = [Objective::Min, Objective::Max, Objective::Max];
        let r = vikor(&ref_matrix(), &w, &t, 0.5).unwrap();
        // A3 has the lowest Q here (best compromise); A0 the highest.
        assert_eq!(r.winner(), Some(3));
        assert_eq!(r.ranking, vec![3, 2, 1, 0]);
        // Q of the S/R-best alternative (A2, the argmin of S) is exactly v·0 + (1−v)·1.
        assert!((r.q[2] - 0.5).abs() < 1e-12);
    }

    #[test]
    fn shape_mismatch_is_an_error() {
        let w = [0.5, 0.5];
        let t = [Objective::Max, Objective::Max];
        assert!(vikor(&[vec![1.0, 2.0], vec![3.0]], &w, &t, 0.5).is_err());
    }
}
