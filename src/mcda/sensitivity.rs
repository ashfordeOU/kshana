// SPDX-License-Identifier: AGPL-3.0-only
//! **Decision-stability / sensitivity analysis for a weighted-sum ranking.**
//!
//! The single most important — and most often skipped — question in any MCDA trade
//! study is *how fragile is the winner?* A ranking that flips under a 1 % nudge to a
//! weight nobody can justify to two decimal places is not a decision, it is a
//! coin-flip dressed up as one. This module measures that fragility three ways, all
//! over a **preference matrix** (alternatives × criteria, each entry already on a
//! common `[0, 1]` scale — e.g. [`super::wsm::DecisionMatrix::preference_matrix`]):
//!
//! * [`tornado`] — vary each criterion weight by ±`delta` (renormalising the rest)
//!   and record the swing in the incumbent winner's aggregate score, sorted into the
//!   classic tornado ordering (widest swing first).
//! * [`smaa_rank1`] — SMAA-style rank-acceptability: sample weight vectors from a
//!   Dirichlet distribution (the crate's seeded [`crate::resilience::stats`] RNG) and
//!   report each alternative's probability of being the winner under weight
//!   uncertainty.
//! * [`min_weight_change_to_flip`] — the smallest single-criterion weight change
//!   (measured as the `L1` distance between the old and new normalised weight
//!   vectors) that dethrones the current winner.
//!
//! Closed-form / Monte-Carlo and tested on a synthetic study with an analytically
//! known flip point and a known SMAA probability — honestly *Modelled*.

use crate::resilience::stats::dirichlet_weights;

/// Aggregate weighted-sum scores of every alternative for `weights` over the
/// preference matrix `vm` (`vm[i]` = the criterion preferences of alternative `i`).
/// `weights` need not be normalised; only their ratios matter for the ranking.
pub fn scores(weights: &[f64], vm: &[Vec<f64>]) -> Vec<f64> {
    let wsum: f64 = weights.iter().sum();
    let inv = if wsum > 0.0 { 1.0 / wsum } else { 0.0 };
    vm.iter()
        .map(|row| {
            row.iter()
                .zip(weights.iter())
                .map(|(v, w)| v * w * inv)
                .sum()
        })
        .collect()
}

/// Index of the winning (highest-scoring) alternative; ties broken by lowest index.
/// `None` only for an empty matrix.
pub fn winner(weights: &[f64], vm: &[Vec<f64>]) -> Option<usize> {
    let s = scores(weights, vm);
    let mut best: Option<usize> = None;
    for (i, &sc) in s.iter().enumerate() {
        match best {
            Some(b) if s[b].total_cmp(&sc) != std::cmp::Ordering::Less => {}
            _ => best = Some(i),
        }
    }
    best
}

/// One bar of a tornado diagram: the criterion, the incumbent winner's **margin
/// over the base runner-up** when that criterion's weight is pushed `down`/`up` by
/// the relative `delta`, and the resulting absolute `swing` in that margin.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct TornadoBar {
    pub criterion: usize,
    pub margin_low: f64,
    pub margin_high: f64,
    pub swing: f64,
}

/// Tornado over criterion weights, measuring the local sensitivity of the
/// **decision margin** (the incumbent winner's lead over the base runner-up) to each
/// criterion weight. For each criterion the weight is scaled by `(1 − delta)` and
/// `(1 + delta)` (one-at-a-time, others held at their baseline) and the winner-minus-
/// runner-up margin `Σ_j w_j·(v_winner,j − v_rival,j)` is recorded at each end. The
/// swing is therefore `2·delta·w_k·|v_winner,k − v_rival,k|`, so a criterion on which
/// the winner and runner-up are tied has exactly zero swing — it cannot threaten the
/// decision. Bars are returned **sorted by descending swing** (the tornado ordering).
/// `delta` is a relative fraction in `(0, 1]`. An empty/single-alternative matrix
/// yields no bars.
pub fn tornado(weights: &[f64], vm: &[Vec<f64>], delta: f64) -> Vec<TornadoBar> {
    let base_winner = match winner(weights, vm) {
        Some(w) => w,
        None => return Vec::new(),
    };
    // Base runner-up: the highest-scoring alternative other than the winner.
    let base_scores = scores(weights, vm);
    let mut rival: Option<usize> = None;
    let mut rival_sc = f64::NEG_INFINITY;
    for (i, &sc) in base_scores.iter().enumerate() {
        if i != base_winner && sc > rival_sc {
            rival_sc = sc;
            rival = Some(i);
        }
    }
    let rival = match rival {
        Some(r) => r,
        None => return Vec::new(), // no rival -> the decision cannot flip
    };

    // Margin contribution per criterion: v_winner,j − v_rival,j.
    let dv: Vec<f64> = (0..weights.len())
        .map(|j| vm[base_winner][j] - vm[rival][j])
        .collect();
    let margin = |w: &[f64]| -> f64 { w.iter().zip(dv.iter()).map(|(a, b)| a * b).sum() };

    let mut bars: Vec<TornadoBar> = (0..weights.len())
        .map(|k| {
            let mut w_lo = weights.to_vec();
            let mut w_hi = weights.to_vec();
            w_lo[k] *= 1.0 - delta;
            w_hi[k] *= 1.0 + delta;
            let lo = margin(&w_lo);
            let hi = margin(&w_hi);
            TornadoBar {
                criterion: k,
                margin_low: lo,
                margin_high: hi,
                swing: (hi - lo).abs(),
            }
        })
        .collect();
    bars.sort_by(|a, b| {
        b.swing
            .total_cmp(&a.swing)
            .then(a.criterion.cmp(&b.criterion))
    });
    bars
}

/// SMAA-style rank-1 acceptability index: the probability that each alternative is
/// the winner when the weight vector is drawn from a Dirichlet distribution with
/// concentration `alpha` (one entry per criterion). Returns one probability per
/// alternative (they sum to one up to ties). Uses `n_samples` deterministic draws
/// seeded from `seed` via the crate's [`crate::resilience::stats::dirichlet_weights`].
///
/// A symmetric `alpha = [1, 1, …]` samples the weight simplex uniformly (the classic
/// "no preference information" SMAA case); larger, asymmetric `alpha` concentrates
/// around a central weighting.
pub fn smaa_rank1(alpha: &[f64], vm: &[Vec<f64>], n_samples: usize, seed: u64) -> Vec<f64> {
    let n_alts = vm.len();
    if n_alts == 0 || n_samples == 0 {
        return vec![0.0; n_alts];
    }
    let mut wins = vec![0u64; n_alts];
    for s in 0..n_samples {
        let w = dirichlet_weights(alpha, seed.wrapping_add(s as u64));
        if let Some(idx) = winner(&w, vm) {
            wins[idx] += 1;
        }
    }
    wins.into_iter()
        .map(|c| c as f64 / n_samples as f64)
        .collect()
}

/// The minimal single-criterion weight change that flips the winner.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct FlipResult {
    /// Which criterion's weight was changed.
    pub criterion: usize,
    /// The normalised weight vector at the flip boundary.
    pub new_weights: Vec<f64>,
    /// `L1` distance between the original and flipped normalised weight vectors —
    /// the "how far did we have to move the weights" robustness number.
    pub l1_change: f64,
    /// The alternative that becomes the winner just past the boundary.
    pub new_winner: usize,
}

/// Find the smallest single-criterion weight perturbation that changes the winner.
///
/// For each criterion `k` the routine sweeps that criterion's (renormalised) weight
/// from 0 upward, locating the first crossover at which the incumbent winner is
/// overtaken, refines it by bisection, and measures the `L1` distance between the
/// original and boundary weight vectors. The criterion giving the smallest such
/// distance is returned. `None` if no single-criterion change can flip the winner
/// (e.g. an alternative that dominates on every criterion).
pub fn min_weight_change_to_flip(weights: &[f64], vm: &[Vec<f64>]) -> Option<FlipResult> {
    let base_w = normalise(weights);
    let base_winner = winner(&base_w, vm)?;
    let m = weights.len();
    let mut best: Option<FlipResult> = None;

    for k in 0..m {
        if let Some((boundary_w, new_winner)) = flip_along_criterion(&base_w, vm, k, base_winner) {
            let l1 = base_w
                .iter()
                .zip(boundary_w.iter())
                .map(|(a, b)| (a - b).abs())
                .sum::<f64>();
            let cand = FlipResult {
                criterion: k,
                new_weights: boundary_w,
                l1_change: l1,
                new_winner,
            };
            best = Some(match best {
                Some(prev) if prev.l1_change <= cand.l1_change => prev,
                _ => cand,
            });
        }
    }
    best
}

/// Sweep criterion `k`'s weight (renormalising) and return the boundary weight
/// vector + the new winner at the first crossover away from `base_winner`, if any.
fn flip_along_criterion(
    base_w: &[f64],
    vm: &[Vec<f64>],
    k: usize,
    base_winner: usize,
) -> Option<(Vec<f64>, usize)> {
    // The "margin" of the incumbent over the best rival as a function of the raw
    // weight `s` placed on criterion `k` (others fixed at base, then renormalised).
    let margin = |s: f64| -> (f64, usize) {
        let mut w = base_w.to_vec();
        w[k] = s;
        let sc = scores(&w, vm);
        // best rival score (excluding the incumbent) and its index
        let mut rival = usize::MAX;
        let mut rival_sc = f64::NEG_INFINITY;
        for (i, &v) in sc.iter().enumerate() {
            if i != base_winner && v > rival_sc {
                rival_sc = v;
                rival = i;
            }
        }
        (sc[base_winner] - rival_sc, rival)
    };

    // Scan s over a wide multiplicative range around the base weight; the base value
    // is base_w[k]. Look for the first sign change of the incumbent's margin.
    let base_s = base_w[k];
    // Candidate sweep points: from 0 up to a large multiple of the total weight.
    let hi = 1.0_f64.max(base_s) * 64.0;
    let steps = 4096usize;
    let mut prev_s = 0.0;
    let (mut prev_margin, _) = margin(prev_s);
    // If the margin is already non-positive at s=0, the boundary is between 0 and base.
    for i in 1..=steps {
        let s = hi * (i as f64) / (steps as f64);
        let (mrg, _) = margin(s);
        if (prev_margin > 0.0) != (mrg > 0.0) {
            // Bracketed a crossover in (prev_s, s); bisect.
            let (lo_s, hi_s) = (prev_s, s);
            let boundary_s = bisect_margin(&margin, lo_s, hi_s);
            let mut w = base_w.to_vec();
            w[k] = boundary_s;
            let wn = normalise(&w);
            // Winner strictly beyond the boundary (nudge a hair past).
            let nudged = boundary_s + (hi_s - lo_s).max(1e-9) * 1e-3;
            let mut w2 = base_w.to_vec();
            w2[k] = nudged;
            let nw = winner(&w2, vm).unwrap_or(base_winner);
            let nw = if nw == base_winner {
                // fall back to the rival identified at the boundary
                margin(boundary_s).1
            } else {
                nw
            };
            return Some((wn, nw));
        }
        prev_s = s;
        prev_margin = mrg;
    }
    None
}

/// Bisect a margin function to the sign-change point in `[lo, hi]`.
fn bisect_margin<F: Fn(f64) -> (f64, usize)>(f: &F, mut lo: f64, mut hi: f64) -> f64 {
    let (mut f_lo, _) = f(lo);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        let (f_mid, _) = f(mid);
        if (f_lo > 0.0) != (f_mid > 0.0) {
            hi = mid;
        } else {
            lo = mid;
            f_lo = f_mid;
        }
        if (hi - lo).abs() < 1e-15 {
            break;
        }
    }
    0.5 * (lo + hi)
}

fn normalise(w: &[f64]) -> Vec<f64> {
    let s: f64 = w.iter().sum();
    if s <= 0.0 {
        return w.to_vec();
    }
    w.iter().map(|x| x / s).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    /// Synthetic 2×2 study with an analytically known flip point. Preferences
    /// vm = [[1,0],[0,1]]; with weights [0.6,0.4] alternative 0 wins (score 0.6).
    /// Renormalised, the winner flips exactly at weights [0.5,0.5], an L1 move of
    /// 0.2 from the baseline.
    #[test]
    fn min_weight_change_to_flip_hits_the_known_point() {
        let vm = vec![vec![1.0, 0.0], vec![0.0, 1.0]];
        let w = [0.6, 0.4];
        assert_eq!(winner(&w, &vm), Some(0));
        let flip = min_weight_change_to_flip(&w, &vm).unwrap();
        assert_eq!(flip.new_winner, 1);
        assert!(
            approx(flip.new_weights[0], 0.5, 1e-6),
            "{:?}",
            flip.new_weights
        );
        assert!(approx(flip.new_weights[1], 0.5, 1e-6));
        assert!(approx(flip.l1_change, 0.2, 1e-6), "l1 {}", flip.l1_change);
    }

    /// A dominant alternative cannot be flipped by any single weight change.
    #[test]
    fn dominant_alternative_never_flips() {
        let vm = vec![vec![1.0, 1.0], vec![0.2, 0.3]];
        let w = [0.5, 0.5];
        assert_eq!(winner(&w, &vm), Some(0));
        assert!(min_weight_change_to_flip(&w, &vm).is_none());
    }

    /// SMAA over the uniform simplex (Dirichlet[1,1]) on the symmetric 2×2 study:
    /// P(winner = 0) = P(w0 > 0.5) = 0.5. Deterministic seed, large sample.
    #[test]
    fn smaa_uniform_simplex_is_a_coin_flip_on_the_symmetric_study() {
        let vm = vec![vec![1.0, 0.0], vec![0.0, 1.0]];
        let acc = smaa_rank1(&[1.0, 1.0], &vm, 20_000, 12345);
        assert!(approx(acc[0], 0.5, 0.02), "P0 = {}", acc[0]);
        assert!(approx(acc[1], 0.5, 0.02), "P1 = {}", acc[1]);
        assert!(approx(acc[0] + acc[1], 1.0, 1e-12));
    }

    /// Concentrating the Dirichlet mass toward criterion 0 makes alternative 0
    /// (which is best on criterion 0) the much more likely winner.
    #[test]
    fn smaa_is_seed_deterministic_and_tracks_concentration() {
        let vm = vec![vec![1.0, 0.0], vec![0.0, 1.0]];
        let a = smaa_rank1(&[8.0, 2.0], &vm, 8_000, 7);
        let b = smaa_rank1(&[8.0, 2.0], &vm, 8_000, 7);
        assert_eq!(a, b, "same seed -> identical");
        assert!(a[0] > 0.7, "alt0 should usually win: {a:?}");
    }

    /// Tornado: the criterion the incumbent winner most relies on shows the widest
    /// margin swing; a criterion on which winner and runner-up are tied has zero
    /// swing; bars come back sorted widest-first.
    #[test]
    fn tornado_orders_by_swing_and_flags_the_dominant_criterion() {
        // Winner (alt0) is far ahead on criterion 0, exactly level on criterion 1.
        let vm = vec![vec![1.0, 0.5], vec![0.0, 0.5]];
        let w = [0.5, 0.5];
        let bars = tornado(&w, &vm, 0.2);
        assert_eq!(bars.len(), 2);
        // Sorted widest swing first.
        assert!(bars[0].swing >= bars[1].swing);
        // Criterion 0 (where alt0's advantage lives) dominates the swing:
        // swing = 2*0.2*0.5*|1-0| = 0.2.
        assert_eq!(bars[0].criterion, 0);
        assert!(
            approx(bars[0].swing, 0.2, 1e-12),
            "swing0 {}",
            bars[0].swing
        );
        // Criterion 1: winner and rival tied -> exactly zero swing.
        assert_eq!(bars[1].criterion, 1);
        assert!(
            bars[1].swing <= 1e-12,
            "tied criterion cannot threaten the decision"
        );
    }
}
