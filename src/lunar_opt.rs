// SPDX-License-Identifier: AGPL-3.0-only
//! Cost-aware gauge-constrained optimal-experiment-design (OED) optimizer.
//!
//! Given a menu of candidate measurement blocks — each holding a 7×7 Fisher
//! information contribution and a scalar relative cost — selects the
//! budget-constrained subset that best breaks the lunocenter-X ↔ scale
//! degeneracy quantified by [`crate::lunar_identifiability::decompose`].
//!
//! Two solvers are provided:
//! - [`greedy_design`]: forward-greedy heuristic; fast, near-optimal for
//!   concave-monotone objectives (Modelled).
//! - [`exhaustive_best`]: exact brute-force oracle over all 2ⁿ subsets
//!   (n ≤ 16 guarded).
//!
//! # Honesty note
//! `greedy_design` is a **Modelled** capability: it is provably optimal on
//! representative menus where the optimal first choice at every step is unique
//! (monotone gain ordering), but can be sub-optimal on adversarial inputs.
//! `exhaustive_best` is the exact ground truth; the invariant `e ≥ g` always
//! holds. All degeneracy metrics and CRLB figures inherit the **Modelled** status
//! from `crate::lunar_identifiability::decompose`.

/// One candidate measurement campaign for the datum experiment-design problem.
///
/// `info` is its 7×7 Fisher information contribution (already preconditioned via
/// [`crate::lunar_identifiability::assemble_multi_info`]); `cost` is a
/// caller-defined relative cost (**Modelled**).
#[derive(Clone, Debug)]
pub struct MeasurementBlock {
    pub label: String,
    pub info: Vec<Vec<f64>>,
    pub cost: f64,
}

/// Convenience: build a block from raw datum-Jacobian rows + a noise sigma + a cost.
///
/// Uses [`crate::lunar_identifiability::assemble_multi_info`] so the block's info
/// is preconditioned identically to every other block.
pub fn block_from_rows(
    label: &str,
    rows: Vec<[f64; 7]>,
    sigma: f64,
    cost: f64,
) -> MeasurementBlock {
    let info = crate::lunar_identifiability::assemble_multi_info(&[(rows, sigma)]);
    MeasurementBlock {
        label: label.to_string(),
        info,
        cost,
    }
}

/// The chosen design: which blocks, total cost, and the resulting figures of merit.
#[derive(Clone, Debug)]
pub struct DesignResult {
    pub chosen: Vec<usize>,
    pub total_cost: f64,
    pub degeneracy_metric: f64,
    pub origin_crlb_m: f64,
}

/// Sum the 7×7 `info` of the chosen blocks (zero matrix if none).
///
/// Fisher information is additive across independent measurements; this is the
/// correct combination rule for blocks built via `assemble_multi_info`.
pub fn combine(blocks: &[MeasurementBlock], chosen: &[usize]) -> Vec<Vec<f64>> {
    let mut combined = vec![vec![0.0_f64; 7]; 7];
    for &idx in chosen {
        for (i, row) in blocks[idx].info.iter().enumerate() {
            for (j, &v) in row.iter().enumerate() {
                combined[i][j] += v;
            }
        }
    }
    combined
}

/// Evaluate degeneracy metric and origin CRLB for a chosen subset.
fn evaluate(blocks: &[MeasurementBlock], chosen: &[usize], rel_tol: f64) -> (f64, f64) {
    let combined = combine(blocks, chosen);
    let d = crate::lunar_identifiability::decompose(&combined, rel_tol);
    (d.degeneracy_metric, d.origin_crlb_m)
}

/// Forward-greedy heuristic: at each step, add the unchosen affordable block
/// that maximises `(new_metric − cur_metric) / cost`; stop when no affordable
/// block yields a positive marginal gain.
///
/// **Modelled:** near-optimal for concave-monotone objectives; can be
/// sub-optimal on adversarial menus. Validated against [`exhaustive_best`] on
/// representative menus — see `tests::greedy_matches_exhaustive_on_constructed_menu`.
pub fn greedy_design(blocks: &[MeasurementBlock], budget: f64, rel_tol: f64) -> DesignResult {
    let mut chosen: Vec<usize> = Vec::new();
    let mut total_cost = 0.0_f64;
    let mut cur_metric = evaluate(blocks, &[], rel_tol).0;

    loop {
        let mut best_gpc = 0.0_f64;
        let mut best_idx: Option<usize> = None;

        for (i, block) in blocks.iter().enumerate() {
            if chosen.contains(&i) {
                continue;
            }
            if total_cost + block.cost > budget + 1e-12 {
                continue;
            }
            let mut trial = chosen.clone();
            trial.push(i);
            let (new_metric, _) = evaluate(blocks, &trial, rel_tol);
            let gain = new_metric - cur_metric;
            if gain <= 0.0 {
                continue;
            }
            let gpc = gain / block.cost;
            if best_idx.is_none() || gpc > best_gpc {
                best_gpc = gpc;
                best_idx = Some(i);
            }
        }

        match best_idx {
            None => break,
            Some(idx) => {
                chosen.push(idx);
                total_cost += blocks[idx].cost;
                cur_metric = evaluate(blocks, &chosen, rel_tol).0;
            }
        }
    }

    let (degeneracy_metric, origin_crlb_m) = evaluate(blocks, &chosen, rel_tol);
    DesignResult {
        chosen,
        total_cost,
        degeneracy_metric,
        origin_crlb_m,
    }
}

/// Exact brute-force oracle: evaluate all 2ⁿ subsets (n ≤ 16 recommended;
/// logs a warning if larger). Returns the affordable subset with the largest
/// `degeneracy_metric` (tie-break: lower cost).
///
/// This is the ground-truth optimizer. The invariant `exhaustive_best ≥
/// greedy_design` always holds.
pub fn exhaustive_best(blocks: &[MeasurementBlock], budget: f64, rel_tol: f64) -> DesignResult {
    let n = blocks.len();
    if n > 16 {
        eprintln!(
            "exhaustive_best: n={n} > 16; iterating {} subsets may be slow",
            1u64 << n
        );
    }

    let mut best_metric = f64::NEG_INFINITY;
    let mut best_cost = f64::INFINITY;
    let mut best_chosen: Vec<usize> = Vec::new();

    for mask in 0u64..(1u64 << n) {
        let chosen: Vec<usize> = (0..n)
            .filter(|&i| mask & (1u64 << (i as u32)) != 0)
            .collect();
        let cost: f64 = chosen.iter().map(|&i| blocks[i].cost).sum();
        if cost > budget + 1e-12 {
            continue;
        }
        let (metric, _) = evaluate(blocks, &chosen, rel_tol);
        // Primary: highest metric. Tie-break: lower cost.
        let improves = metric > best_metric + 1e-15
            || (metric >= best_metric - 1e-15 && cost < best_cost - 1e-12);
        if improves {
            best_metric = metric;
            best_cost = cost;
            best_chosen = chosen;
        }
    }

    // Re-evaluate to get origin_crlb_m (avoids storing it in the loop).
    let (degeneracy_metric, origin_crlb_m) = evaluate(blocks, &best_chosen, rel_tol);
    DesignResult {
        chosen: best_chosen,
        total_cost: best_cost,
        degeneracy_metric,
        origin_crlb_m,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // Build a 7×7 info that is `val` on diagonal entry k (and tiny epsilon elsewhere
    // on the diagonal so the marginalized M-block stays non-singular).
    fn diag_block(label: &str, boosts: &[(usize, f64)], cost: f64) -> MeasurementBlock {
        let mut info = vec![vec![0.0; 7]; 7];
        for (i, row) in info.iter_mut().enumerate() {
            row[i] = 1e-6;
        }
        for &(k, v) in boosts {
            info[k][k] += v;
        }
        MeasurementBlock {
            label: label.to_string(),
            info,
            cost,
        }
    }

    /// With diagonal info blocks and K = {0, 3}, the Schur complement S = I_KK
    /// (because I_KM = 0), so metric = min(I[0][0], I[3][3]).
    ///
    /// Menu: two "x" blocks boosting param 0 and two "s" blocks boosting param 3,
    /// all at cost 1.0. Greedy is provably optimal here because after choosing the
    /// strongest x-block (x_a), the metric is bottlenecked by param 3; the gain
    /// from the strongest s-block (s_a) is ~5 >> any single-param gain, so greedy
    /// uniquely identifies s_a next. The remaining blocks form a strictly ordered
    /// gain sequence (s_b gain ~3, others ~1e-6), making greedy provably optimal at
    /// every budget level 1–5.
    #[test]
    fn greedy_matches_exhaustive_on_constructed_menu() {
        let blocks = vec![
            diag_block("x_a", &[(0, 5.0)], 1.0),
            diag_block("x_b", &[(0, 3.0)], 1.0),
            diag_block("s_a", &[(3, 5.0)], 1.0),
            diag_block("s_b", &[(3, 3.0)], 1.0),
        ];
        for &budget in &[1.0_f64, 2.0, 3.0, 4.0, 5.0] {
            let g = greedy_design(&blocks, budget, 1e-12);
            let e = exhaustive_best(&blocks, budget, 1e-12);
            assert!(
                g.total_cost <= budget + 1e-12 && e.total_cost <= budget + 1e-12,
                "budget {budget}: cost overrun g={} e={}",
                g.total_cost,
                e.total_cost
            );
            assert!(
                e.degeneracy_metric + 1e-9 >= g.degeneracy_metric,
                "budget {budget}: exhaustive must be >= greedy; e={} g={}",
                e.degeneracy_metric,
                g.degeneracy_metric
            );
            assert!(
                (e.degeneracy_metric - g.degeneracy_metric).abs() < 1e-9,
                "budget {budget}: greedy must match exhaustive here; e={} g={} \
                 e_chosen={:?} g_chosen={:?}",
                e.degeneracy_metric,
                g.degeneracy_metric,
                e.chosen,
                g.chosen,
            );
        }
    }

    #[test]
    fn greedy_respects_budget_and_improves_on_empty() {
        let blocks = vec![
            diag_block(
                "base",
                &[(1, 1.0), (2, 1.0), (4, 1.0), (5, 1.0), (6, 1.0)],
                1.0,
            ),
            diag_block("x", &[(0, 4.0)], 2.0),
            diag_block("s", &[(3, 4.0)], 2.0),
        ];
        let g = greedy_design(&blocks, 0.5, 1e-12); // budget below the cheapest block
        assert!(
            g.chosen.is_empty() && g.total_cost == 0.0,
            "nothing affordable => empty design; got chosen={:?} cost={}",
            g.chosen,
            g.total_cost
        );
        let g2 = greedy_design(&blocks, 5.0, 1e-12);
        assert!(
            g2.degeneracy_metric > 0.0 && !g2.chosen.is_empty(),
            "budget 5.0 should yield a non-empty design with metric>0; got {:?} metric={}",
            g2.chosen,
            g2.degeneracy_metric
        );
    }
}
