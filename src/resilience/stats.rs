// SPDX-License-Identifier: AGPL-3.0-only
//! Statistics for the resilience instability study: seeded weight-simplex
//! sampling and rank-stability metrics. Dependency-light (reuses the `rand`
//! family already in the tree) and deterministic; every routine has a
//! hand-derived oracle test.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Gamma};

/// Sample a weight vector on the probability simplex from a Dirichlet(`alpha`)
/// distribution, deterministically from `seed`. The result has the same length
/// as `alpha`, every component is non-negative, and the components sum to 1.
///
/// Implemented as normalized independent Gamma(`alpha_i`, 1) draws (the standard
/// construction), so the per-component mean is `alpha_i / sum(alpha)`. Any
/// non-positive `alpha_i` is treated as a tiny positive shape to keep the draw
/// well defined.
pub fn dirichlet_weights(alpha: &[f64], seed: u64) -> Vec<f64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut raw: Vec<f64> = Vec::with_capacity(alpha.len());
    for &a in alpha {
        let shape = if a > 0.0 { a } else { 1e-9 };
        // `shape` is `a` only when `a > 0.0` (so positive), else the positive `1e-9`, and
        // is never NaN; the scale is the positive literal `1.0`. `Gamma::new` (rand_distr
        // 0.4) errors only on a non-positive/NaN shape or a non-positive/non-finite
        // scale, none of which can occur here.
        let g = Gamma::new(shape, 1.0)
            .expect("shape is strictly positive (never NaN) and scale is the literal 1.0, which Gamma::new always accepts");
        // Guard the degenerate all-zero draw so normalization is well defined.
        raw.push(g.sample(&mut rng).max(f64::MIN_POSITIVE));
    }
    let sum: f64 = raw.iter().sum();
    raw.iter().map(|x| x / sum).collect()
}

fn sgn(x: f64) -> i32 {
    if x > 0.0 {
        1
    } else if x < 0.0 {
        -1
    } else {
        0
    }
}

/// Kendall's tau-b rank correlation between two equal-length samples, in
/// `[-1, 1]`. Identical orderings give `+1`, reversed give `-1`. Ties are
/// handled by the tau-b denominator; a degenerate (all-tied) input returns 0.
pub fn kendall_tau(a: &[f64], b: &[f64]) -> f64 {
    assert_eq!(a.len(), b.len(), "kendall_tau: length mismatch");
    let (mut conc, mut disc, mut tie_a, mut tie_b) = (0i64, 0i64, 0i64, 0i64);
    for (i, (&ai, &bi)) in a.iter().zip(b.iter()).enumerate() {
        for (&aj, &bj) in a[i + 1..].iter().zip(b[i + 1..].iter()) {
            let sa = sgn(ai - aj);
            let sb = sgn(bi - bj);
            if sa == 0 {
                tie_a += 1;
            }
            if sb == 0 {
                tie_b += 1;
            }
            if sa != 0 && sb != 0 {
                if sa == sb {
                    conc += 1;
                } else {
                    disc += 1;
                }
            }
        }
    }
    // tau-b denominator uses the exact pair total n(n-1)/2 and the per-variable
    // tie counts: sqrt((n_pairs - ties_a)(n_pairs - ties_b)).
    let n = a.len() as i64;
    let n_pairs = n * (n - 1) / 2;
    let denom = (((n_pairs - tie_a) * (n_pairs - tie_b)) as f64).sqrt();
    if denom == 0.0 {
        0.0
    } else {
        (conc - disc) as f64 / denom
    }
}

/// Competition ranks of `scores`, with rank 0 = best (highest score). Returns a
/// vector `r` where `r[i]` is the rank of item `i`. Ties are broken by index so
/// the mapping is a permutation (deterministic, total order).
pub fn rank_of(scores: &[f64]) -> Vec<usize> {
    let mut idx: Vec<usize> = (0..scores.len()).collect();
    // Best (largest) first; ties broken by original index for stability.
    idx.sort_by(|&i, &j| scores[j].total_cmp(&scores[i]).then(i.cmp(&j)));
    let mut rank = vec![0usize; scores.len()];
    for (position, &item) in idx.iter().enumerate() {
        rank[item] = position;
    }
    rank
}

/// Fraction of rankings whose top item (the one with rank 0) differs from the
/// modal top item across all rankings. 0.0 = the same architecture wins every
/// time; higher = the winner flips. Each ranking is a `rank_of` vector.
pub fn top1_flip_rate(rankings: &[Vec<usize>]) -> f64 {
    if rankings.is_empty() {
        return 0.0;
    }
    let tops: Vec<usize> = rankings
        .iter()
        .map(|r| r.iter().position(|&x| x == 0).unwrap_or(0))
        .collect();
    // Modal top item.
    let n_items = rankings[0].len();
    let mut counts = vec![0usize; n_items];
    for &t in &tops {
        counts[t] += 1;
    }
    let modal = counts
        .iter()
        .enumerate()
        .max_by_key(|(_, &c)| c)
        .map(|(i, _)| i)
        .unwrap_or(0);
    let flips = tops.iter().filter(|&&t| t != modal).count();
    flips as f64 / tops.len() as f64
}

/// Minimum and maximum rank each of `n_items` attains across the `rankings`.
/// An item that is ever best and ever worst spans `(0, n_items - 1)`.
pub fn rank_ranges(rankings: &[Vec<usize>], n_items: usize) -> Vec<(usize, usize)> {
    let mut out = vec![(usize::MAX, usize::MIN); n_items];
    for r in rankings {
        for (item, &rank) in r.iter().enumerate() {
            if item < n_items {
                out[item].0 = out[item].0.min(rank);
                out[item].1 = out[item].1.max(rank);
            }
        }
    }
    for pair in out.iter_mut() {
        if pair.0 == usize::MAX {
            *pair = (0, 0);
        }
    }
    out
}

/// Percentile confidence interval at level `alpha` (two-sided): returns the
/// `alpha/2` and `1 - alpha/2` sample percentiles by the nearest-rank method.
/// Empty input returns `(NaN, NaN)`.
pub fn percentile_ci(samples: &[f64], alpha: f64) -> (f64, f64) {
    if samples.is_empty() {
        return (f64::NAN, f64::NAN);
    }
    let mut s = samples.to_vec();
    s.sort_by(f64::total_cmp);
    let n = s.len();
    let idx = |p: f64| -> usize {
        let i = (p * (n - 1) as f64).round() as isize;
        i.clamp(0, n as isize - 1) as usize
    };
    (s[idx(alpha / 2.0)], s[idx(1.0 - alpha / 2.0)])
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dirichlet_is_a_normalized_nonneg_simplex_point() {
        let w = dirichlet_weights(&[1.0, 1.0, 1.0, 1.0], 42);
        assert_eq!(w.len(), 4);
        assert!(w.iter().all(|&x| x >= 0.0));
        let sum: f64 = w.iter().sum();
        assert!((sum - 1.0).abs() < 1e-9, "sum = {sum}");
    }

    #[test]
    fn dirichlet_is_seed_deterministic() {
        assert_eq!(
            dirichlet_weights(&[2.0, 3.0, 5.0], 7),
            dirichlet_weights(&[2.0, 3.0, 5.0], 7)
        );
        assert_ne!(
            dirichlet_weights(&[2.0, 3.0, 5.0], 7),
            dirichlet_weights(&[2.0, 3.0, 5.0], 8)
        );
    }

    #[test]
    fn dirichlet_mean_concentrates_on_alpha_ratio() {
        // Large symmetric alpha -> components concentrate near 1/3.
        let k = 3;
        let mut acc = vec![0.0f64; k];
        let n = 4000;
        for seed in 0..n {
            let w = dirichlet_weights(&[50.0, 50.0, 50.0], seed as u64);
            for (a, x) in acc.iter_mut().zip(w) {
                *a += x;
            }
        }
        for a in acc {
            let mean = a / n as f64;
            assert!((mean - 1.0 / 3.0).abs() < 0.01, "mean = {mean}");
        }
    }

    #[test]
    fn kendall_tau_extremes_and_hand_example() {
        let a = [1.0, 2.0, 3.0, 4.0];
        assert!((kendall_tau(&a, &a) - 1.0).abs() < 1e-12);
        let rev = [4.0, 3.0, 2.0, 1.0];
        assert!((kendall_tau(&a, &rev) + 1.0).abs() < 1e-12);
        // One discordant pair (3,4 vs 4,3) out of six: tau = (5 - 1)/6 = 0.6667.
        let b = [1.0, 2.0, 4.0, 3.0];
        assert!((kendall_tau(&a, &b) - 4.0 / 6.0).abs() < 1e-9);
    }

    #[test]
    fn rank_of_orders_best_first_with_stable_ties() {
        assert_eq!(rank_of(&[0.3, 0.9, 0.5]), vec![2, 0, 1]);
        // Ties resolved by index: equal scores keep input order.
        assert_eq!(rank_of(&[0.5, 0.5, 0.9]), vec![1, 2, 0]);
    }

    #[test]
    fn top1_flip_rate_bounds() {
        let stable = vec![vec![0, 1, 2], vec![0, 2, 1], vec![0, 1, 2]];
        assert!((top1_flip_rate(&stable) - 0.0).abs() < 1e-12);
        // Two rankings: item 0 tops one, item 1 tops the other -> 0.5 flip.
        let split = vec![vec![0, 1], vec![1, 0]];
        assert!((top1_flip_rate(&split) - 0.5).abs() < 1e-12);
    }

    #[test]
    fn rank_ranges_span_best_to_worst() {
        // item 0: rank 0 then rank 2 -> (0,2); item 2: rank 2 then 0 -> (0,2).
        let rankings = vec![vec![0, 1, 2], vec![2, 1, 0]];
        let rr = rank_ranges(&rankings, 3);
        assert_eq!(rr[0], (0, 2));
        assert_eq!(rr[1], (1, 1));
        assert_eq!(rr[2], (0, 2));
    }

    #[test]
    fn percentile_ci_brackets_known_median() {
        let xs: Vec<f64> = (1..=100).map(|i| i as f64).collect();
        let (lo, hi) = percentile_ci(&xs, 0.05);
        assert!(lo <= 50.0 && hi >= 51.0, "lo={lo} hi={hi}");
        assert!(lo < 10.0 && hi > 90.0, "lo={lo} hi={hi}");
    }
}
