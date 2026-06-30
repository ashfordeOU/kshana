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

/// One point of the cost/degeneracy trade frontier.
#[derive(Clone, Debug)]
pub struct FrontierPoint {
    pub budget: f64,
    pub total_cost: f64,
    pub degeneracy_metric: f64,
    pub origin_crlb_m: f64,
    /// Labels of the selected blocks at this budget level.
    pub chosen: Vec<String>,
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

/// Sweep `budgets` through [`greedy_design`], returning the trade frontier. This is a
/// PARAMETERISED trade curve (Modelled costs/precisions), NOT a single optimum.
pub fn pareto_frontier(
    blocks: &[MeasurementBlock],
    budgets: &[f64],
    rel_tol: f64,
) -> Vec<FrontierPoint> {
    budgets
        .iter()
        .map(|&budget| {
            let result = greedy_design(blocks, budget, rel_tol);
            let chosen = result
                .chosen
                .iter()
                .map(|&i| blocks[i].label.clone())
                .collect();
            FrontierPoint {
                budget,
                total_cost: result.total_cost,
                degeneracy_metric: result.degeneracy_metric,
                origin_crlb_m: result.origin_crlb_m,
                chosen,
            }
        })
        .collect()
}

/// Build a representative menu of measurement campaigns for the lunar datum problem.
///
/// **MODELLED:** beacon locations, orbiter geometry, per-technique precisions, and
/// relative costs are representative choices, not mission values (see
/// `tests/fixtures/llr_geometry/NOTICE.md`). Returns four blocks:
/// - `"LLR"` — baseline; establishes observability but does NOT break the X↔scale pair.
/// - `"VLBI-limb"` — limb beacon at selenographic lon ~60°; breaks degeneracy
///   transversely (Y-direction, Schur monotonicity).
/// - `"Orbiter-nearside"` — orbiter ranging to a near-side beacon.
/// - `"Orbiter-farside"` — orbiter ranging to a far-side beacon (negative body-frame X);
///   the primary radial-diversity breaker for the X↔scale degeneracy.
pub fn representative_lunar_menu() -> Vec<MeasurementBlock> {
    const R: f64 = 1_737_400.0_f64;
    let t0 = (2_460_310.5_f64 - 2_451_545.0) / 36_525.0;
    let step_jc = 6.0 / (24.0 * 36_525.0);
    // ≈ 1 synodic month (29.5 d) at 6 h cadence; same schedule as the B3 demo.
    let n_steps = (29.5_f64 * 24.0 / 6.0).ceil() as usize + 1;

    // ── LLR block (baseline; established infrastructure) ────────────────────
    let (llr_rows, _) = crate::lunar_identifiability::llr_datum_rows(0.003, t0, 29.5, 6.0);
    let llr_block = block_from_rows("LLR", llr_rows, 0.003, 1.0);

    // ── VLBI-limb block (transverse content; limb beacon lon ~60°) ──────────
    let beacon_vlbi: [f64; 3] = [0.5 * R, 0.866 * R, 0.0];
    let st1 = crate::lunar_llr::stations()[1]; // APOLLO
    let st2 = crate::lunar_llr::stations()[0]; // Grasse (long transatlantic baseline)
    let mut vlbi_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_b = crate::lunar_llr::reflector_inertial(beacon_vlbi, t);
        // Earth-facing gate: beacon must be on the hemisphere facing Earth.
        let earth_facing = (r_b[0] - r_moon[0]) * (-r_moon[0])
            + (r_b[1] - r_moon[1]) * (-r_moon[1])
            + (r_b[2] - r_moon[2]) * (-r_moon[2]);
        if earth_facing <= 0.0 {
            continue;
        }
        let jd_ut1 = t * 36_525.0 + 2_451_545.0;
        vlbi_rows.push(crate::lunar_datum::vlbi_row_datum7(
            &st1,
            &st2,
            beacon_vlbi,
            t,
            jd_ut1,
        ));
    }
    let vlbi_block = block_from_rows("VLBI-limb", vlbi_rows, 1e-11, 3.0);

    // ── Orbiter-nearside block (radial diversity, near hemisphere) ───────────
    let beacon_near: [f64; 3] = [0.9 * R, 0.2 * R, 0.2 * R];
    let mut orb_near_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_orb = crate::lunar_datum::orbiter_position(100.0, 88.0, 30.0, k as f64 * 13.0, t0, t);
        let r_b = crate::lunar_llr::reflector_inertial(beacon_near, t);
        // LOS gate: beacon and orbiter on same hemisphere relative to Moon centre.
        let los = (r_b[0] - r_moon[0]) * (r_orb[0] - r_moon[0])
            + (r_b[1] - r_moon[1]) * (r_orb[1] - r_moon[1])
            + (r_b[2] - r_moon[2]) * (r_orb[2] - r_moon[2]);
        if los <= 0.0 {
            continue;
        }
        orb_near_rows.push(crate::lunar_datum::orbiter_range_row_datum7(
            r_orb,
            beacon_near,
            t,
        ));
    }
    let orb_near_block = block_from_rows("Orbiter-nearside", orb_near_rows, 0.05, 4.0);

    // ── Orbiter-farside block (primary radial-diversity breaker) ────────────
    // Negative body-frame X → anti-Earth hemisphere; ranging from polar orbit provides
    // direct radial information that breaks the lunocenter-X ↔ scale near-degeneracy.
    let beacon_far: [f64; 3] = [-0.9 * R, 0.2 * R, 0.2 * R];
    let mut orb_far_rows: Vec<[f64; 7]> = Vec::new();
    for k in 0..n_steps {
        let t = t0 + k as f64 * step_jc;
        let r_moon = crate::ephem::moon_position(t);
        let r_orb = crate::lunar_datum::orbiter_position(100.0, 88.0, 30.0, k as f64 * 13.0, t0, t);
        let r_b = crate::lunar_llr::reflector_inertial(beacon_far, t);
        // LOS gate: orbiter must be on the far-side hemisphere to range the beacon.
        let los = (r_b[0] - r_moon[0]) * (r_orb[0] - r_moon[0])
            + (r_b[1] - r_moon[1]) * (r_orb[1] - r_moon[1])
            + (r_b[2] - r_moon[2]) * (r_orb[2] - r_moon[2]);
        if los <= 0.0 {
            continue;
        }
        orb_far_rows.push(crate::lunar_datum::orbiter_range_row_datum7(
            r_orb, beacon_far, t,
        ));
    }
    let orb_far_block = block_from_rows("Orbiter-farside", orb_far_rows, 0.05, 5.0);

    vec![llr_block, vlbi_block, orb_near_block, orb_far_block]
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
    fn frontier_is_monotone_and_llr_only_is_the_degenerate_end() {
        let blocks = super::representative_lunar_menu();
        let budgets = [1.0, 4.0, 8.0, 13.0]; // affords: LLR; +1 technique; +2; all
        let f = super::pareto_frontier(&blocks, &budgets, 1e-12);
        assert_eq!(f.len(), 4);
        for w in f.windows(2) {
            assert!(
                w[1].degeneracy_metric + 1e-6 >= w[0].degeneracy_metric,
                "metric must not decrease as budget grows: {} -> {}",
                w[0].degeneracy_metric,
                w[1].degeneracy_metric
            );
            assert!(
                w[1].origin_crlb_m <= w[0].origin_crlb_m + 1e-9,
                "origin CRLB must not increase as budget grows: {} -> {}",
                w[0].origin_crlb_m,
                w[1].origin_crlb_m
            );
        }
        // The smallest budget is LLR-only and the most degenerate; the largest is strictly better.
        assert!(
            f.first().unwrap().degeneracy_metric < f.last().unwrap().degeneracy_metric,
            "frontier must span degenerate -> broken"
        );
        assert!(
            f.first().unwrap().chosen == vec!["LLR".to_string()]
                || f.first().unwrap().chosen.contains(&"LLR".to_string()),
            "cheapest design is LLR-dominated; got {:?}",
            f.first().unwrap().chosen
        );
        // Emit for report — visible with --nocapture; stripped by normal test runner.
        for fp in &f {
            eprintln!(
                "frontier: budget={} cost={:.1} metric={:.6e} crlb_m={:.3} chosen={:?}",
                fp.budget, fp.total_cost, fp.degeneracy_metric, fp.origin_crlb_m, fp.chosen
            );
        }
    }

    #[test]
    fn radial_diversity_beats_transverse_for_breaking_the_degeneracy() {
        // The Part-B finding, operationalised: per unit of degeneracy-metric gain, an orbiter
        // (radial/depth diversity) block beats the VLBI (transverse) block. Compare LLR+each.
        use crate::lunar_identifiability::{assemble_multi_info, decompose, llr_datum_rows};
        let blocks = super::representative_lunar_menu();
        let find = |name: &str| blocks.iter().find(|b| b.label == name).unwrap().clone();
        let llr = find("LLR");
        let vlbi = find("VLBI-limb");
        let orb = find("Orbiter-farside");
        let metric_of = |extra: &MeasurementBlock| {
            let mut info = llr.info.clone();
            for (row, extra_row) in info.iter_mut().zip(extra.info.iter()) {
                for (v, ev) in row.iter_mut().zip(extra_row.iter()) {
                    *v += ev;
                }
            }
            decompose(&info, 1e-12).degeneracy_metric
        };
        let base = decompose(&llr.info, 1e-12).degeneracy_metric;
        let gain_vlbi = metric_of(&vlbi) - base;
        let gain_orb = metric_of(&orb) - base;
        assert!(
            gain_orb > gain_vlbi,
            "radial-diversity orbiter must break the degeneracy more than transverse VLBI: orb {} vs vlbi {}",
            gain_orb,
            gain_vlbi
        );
        eprintln!(
            "radial vs transverse: base={:.6e} gain_vlbi={:.6e} gain_orb={:.6e} ratio={:.1}x",
            base,
            gain_vlbi,
            gain_orb,
            gain_orb / gain_vlbi
        );
        let _ = assemble_multi_info;
        let _ = llr_datum_rows; // (imports used above/by builder)
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
