// SPDX-License-Identifier: AGPL-3.0-only
//! Hand-derived statistics for the impairment-evaluation study.
//!
//! Percentile-bootstrap confidence intervals, DeLong AUC variance, Spearman rank
//! correlation and ridge regression — the toolkit the optimism-gap study needs.
//! Every routine is checked in the tests against a closed form or a worked
//! example; no third-party statistics dependency is pulled into the engine.
//! Bootstrap routines are seeded (`ChaCha8Rng`) so a reported interval is
//! reproducible from `(inputs, seed)`.

use crate::impairment_eval::auc;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;

// ── Percentile bootstrap ────────────────────────────────────────────────────

/// The two-sided percentile interval of `v` at level `alpha` (e.g. `alpha = 0.05`
/// → the 2.5th and 97.5th percentiles). Sorts `v` in place; `(NaN, NaN)` if empty.
fn percentile_interval(v: &mut [f64], alpha: f64) -> (f64, f64) {
    if v.is_empty() {
        return (f64::NAN, f64::NAN);
    }
    v.sort_by(|a, b| a.partial_cmp(b).expect("no NaN in bootstrap replicates"));
    let n = v.len();
    let a = alpha.clamp(0.0, 1.0);
    let lo = (((a / 2.0) * n as f64).floor() as usize).min(n - 1);
    let hi = (((1.0 - a / 2.0) * n as f64).ceil() as usize)
        .saturating_sub(1)
        .min(n - 1);
    (v[lo], v[hi])
}

/// Percentile-bootstrap confidence interval for the **mean** of `samples` at
/// confidence `1 - alpha`, over `b` resamples (seeded). `(NaN, NaN)` if empty.
pub fn bootstrap_ci(samples: &[f64], b: usize, seed: u64, alpha: f64) -> (f64, f64) {
    if samples.is_empty() {
        return (f64::NAN, f64::NAN);
    }
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let n = samples.len();
    let mut means = Vec::with_capacity(b.max(1));
    for _ in 0..b.max(1) {
        let mut s = 0.0;
        for _ in 0..n {
            s += samples[rng.gen_range(0..n)];
        }
        means.push(s / n as f64);
    }
    percentile_interval(&mut means, alpha)
}

/// Percentile-bootstrap CI for the Mann–Whitney **AUC** of `pos` vs `neg`,
/// resampling cases with replacement within each class (seeded). `(NaN, NaN)` for
/// a degenerate one-class input.
pub fn bootstrap_auc_ci(pos: &[f64], neg: &[f64], b: usize, seed: u64, alpha: f64) -> (f64, f64) {
    if pos.is_empty() || neg.is_empty() {
        return (f64::NAN, f64::NAN);
    }
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let (np, nn) = (pos.len(), neg.len());
    let mut prs = vec![0.0; np];
    let mut nrs = vec![0.0; nn];
    let mut aucs = Vec::with_capacity(b.max(1));
    for _ in 0..b.max(1) {
        for slot in prs.iter_mut() {
            *slot = pos[rng.gen_range(0..np)];
        }
        for slot in nrs.iter_mut() {
            *slot = neg[rng.gen_range(0..nn)];
        }
        aucs.push(auc(&prs, &nrs));
    }
    percentile_interval(&mut aucs, alpha)
}

// ── DeLong AUC variance ─────────────────────────────────────────────────────

#[inline]
fn psi(a: f64, b: f64) -> f64 {
    if a > b {
        1.0
    } else if a == b {
        0.5
    } else {
        0.0
    }
}

/// The AUC and DeLong structural components: `V10[i]` is the placement of positive
/// `i` among the negatives, `V01[j]` the placement of negative `j` among positives
/// (Sun & Xu fast form; DeLong, DeLong & Clarke-Pearson 1988).
fn auc_delong_components(pos: &[f64], neg: &[f64]) -> (f64, Vec<f64>, Vec<f64>) {
    let (m, n) = (pos.len(), neg.len());
    let mut v10 = vec![0.0; m];
    let mut v01 = vec![0.0; n];
    for (slot, &p) in v10.iter_mut().zip(pos.iter()) {
        *slot = neg.iter().map(|&q| psi(p, q)).sum::<f64>() / n as f64;
    }
    for (slot, &q) in v01.iter_mut().zip(neg.iter()) {
        *slot = pos.iter().map(|&p| psi(p, q)).sum::<f64>() / m as f64;
    }
    let auc = v10.iter().sum::<f64>() / m as f64;
    (auc, v10, v01)
}

fn sample_var(v: &[f64]) -> f64 {
    let n = v.len();
    if n < 2 {
        return 0.0;
    }
    let mean = v.iter().sum::<f64>() / n as f64;
    v.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n as f64 - 1.0)
}

/// DeLong variance of a single AUC: `Var = S10/m + S01/n`. `NaN` if either class
/// has fewer than two cases.
pub fn delong_auc_variance(pos: &[f64], neg: &[f64]) -> f64 {
    if pos.len() < 2 || neg.len() < 2 {
        return f64::NAN;
    }
    let (_, v10, v01) = auc_delong_components(pos, neg);
    sample_var(&v10) / pos.len() as f64 + sample_var(&v01) / neg.len() as f64
}

/// Two-sided z critical value Φ⁻¹(1 − alpha/2), by bisection on [`normal_cdf`].
fn z_for(alpha: f64) -> f64 {
    let target = 1.0 - alpha.clamp(1e-9, 1.0) / 2.0;
    let (mut lo, mut hi) = (0.0_f64, 12.0_f64);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if crate::detection::normal_cdf(mid) < target {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Normal (Wald) AUC confidence interval from the DeLong variance, clamped to
/// `[0, 1]`. `(NaN, NaN)` if the variance is undefined.
pub fn delong_ci(pos: &[f64], neg: &[f64], alpha: f64) -> (f64, f64) {
    let var = delong_auc_variance(pos, neg);
    if var.is_nan() {
        return (f64::NAN, f64::NAN);
    }
    let (auc, _, _) = auc_delong_components(pos, neg);
    let h = z_for(alpha) * var.sqrt();
    ((auc - h).max(0.0), (auc + h).min(1.0))
}

// ── Spearman rank correlation ───────────────────────────────────────────────

/// Fractional (tie-averaged) ranks of `v`, 1-based.
fn ranks(v: &[f64]) -> Vec<f64> {
    let n = v.len();
    let mut idx: Vec<usize> = (0..n).collect();
    idx.sort_by(|&a, &b| v[a].partial_cmp(&v[b]).expect("no NaN in ranks"));
    let mut r = vec![0.0; n];
    let mut i = 0;
    while i < n {
        let mut j = i;
        while j + 1 < n && v[idx[j + 1]] == v[idx[i]] {
            j += 1;
        }
        let avg = ((i + 1) + (j + 1)) as f64 / 2.0; // average 1-based rank of the tie group
        for &k in &idx[i..=j] {
            r[k] = avg;
        }
        i = j + 1;
    }
    r
}

/// Spearman rank correlation `(rho, p)`. `p` is a two-sided large-sample normal
/// approximation `2·(1 − Φ(|rho|·√(n−1)))`. `(NaN, NaN)` if `n < 2` or lengths
/// differ; `(0, 1)` if either input is constant.
pub fn spearman(x: &[f64], y: &[f64]) -> (f64, f64) {
    let n = x.len();
    if n < 2 || y.len() != n {
        return (f64::NAN, f64::NAN);
    }
    let (rx, ry) = (ranks(x), ranks(y));
    let mx = rx.iter().sum::<f64>() / n as f64;
    let my = ry.iter().sum::<f64>() / n as f64;
    let (mut cov, mut vx, mut vy) = (0.0, 0.0, 0.0);
    for (&a, &b) in rx.iter().zip(ry.iter()) {
        let (dx, dy) = (a - mx, b - my);
        cov += dx * dy;
        vx += dx * dx;
        vy += dy * dy;
    }
    if vx == 0.0 || vy == 0.0 {
        return (0.0, 1.0);
    }
    let rho = cov / (vx * vy).sqrt();
    let z = rho.abs() * (n as f64 - 1.0).sqrt();
    let p = 2.0 * (1.0 - crate::detection::normal_cdf(z));
    (rho, p.clamp(0.0, 1.0))
}

// ── Ridge regression ────────────────────────────────────────────────────────

/// Solve `A x = b` for a square `A` by Gauss–Jordan elimination with partial
/// pivoting. `None` if `A` is (numerically) singular.
fn solve_linear(mut a: Vec<Vec<f64>>, mut b: Vec<f64>) -> Option<Vec<f64>> {
    let n = b.len();
    for col in 0..n {
        let mut piv = col;
        for r in (col + 1)..n {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].abs() < 1e-12 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        let d = a[col][col];
        for r in 0..n {
            if r == col {
                continue;
            }
            let f = a[r][col] / d;
            if f != 0.0 {
                for c in col..n {
                    a[r][c] -= f * a[col][c];
                }
                b[r] -= f * b[col];
            }
        }
    }
    Some((0..n).map(|i| b[i] / a[i][i]).collect())
}

/// Ridge regression via the normal equations `(DᵀD + λI)β = Dᵀy`, where `D` is the
/// design matrix with a leading intercept column. The intercept is **not**
/// penalised. `x` holds one feature row per sample (without the intercept).
/// Returns `[intercept, w_1, …, w_p]`; an all-zero vector if the system is
/// singular. `λ = 0` reduces to ordinary least squares.
pub fn ridge_fit(x: &[Vec<f64>], y: &[f64], lambda: f64) -> Vec<f64> {
    let n = x.len();
    let p = if n > 0 { x[0].len() } else { 0 };
    let d = p + 1;
    let mut a = vec![vec![0.0; d]; d];
    let mut bvec = vec![0.0; d];
    let mut xi = vec![0.0; d];
    for (row, &yi) in x.iter().zip(y.iter()) {
        xi[0] = 1.0;
        xi[1..].copy_from_slice(row);
        for r in 0..d {
            for c in 0..d {
                a[r][c] += xi[r] * xi[c];
            }
            bvec[r] += xi[r] * yi;
        }
    }
    for (k, row) in a.iter_mut().enumerate().skip(1) {
        row[k] += lambda; // penalise features, not the intercept
    }
    solve_linear(a, bvec).unwrap_or_else(|| vec![0.0; d])
}

/// Prediction `intercept + Σ wₖ·xₖ` from [`ridge_fit`] coefficients.
pub fn ridge_predict(coeffs: &[f64], x: &[f64]) -> f64 {
    coeffs[0]
        + x.iter()
            .zip(coeffs[1..].iter())
            .map(|(xv, w)| xv * w)
            .sum::<f64>()
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::detection::normal_cdf;
    use rand_distr::{Distribution, Normal};

    #[test]
    fn bootstrap_ci_brackets_a_known_mean() {
        let xs: Vec<f64> = (1..=100).map(|i| i as f64).collect(); // mean = 50.5
        let (lo, hi) = bootstrap_ci(&xs, 2000, 7, 0.05);
        assert!(lo < 50.5 && 50.5 < hi, "CI [{lo}, {hi}] must bracket 50.5");
        assert!(hi - lo < 20.0, "CI width {} unexpectedly wide", hi - lo);
        assert!(bootstrap_ci(&[], 100, 1, 0.05).0.is_nan());
    }

    #[test]
    fn bootstrap_auc_ci_brackets_sample_and_binormal_value() {
        let mut rng = ChaCha8Rng::seed_from_u64(0x5141_4e41_b007);
        let d = Normal::new(0.0_f64, 1.0).unwrap();
        let dprime = 2.0_f64;
        let pos: Vec<f64> = (0..200).map(|_| dprime + d.sample(&mut rng)).collect();
        let neg: Vec<f64> = (0..200).map(|_| d.sample(&mut rng)).collect();
        let point = auc(&pos, &neg);
        let (lo, hi) = bootstrap_auc_ci(&pos, &neg, 2000, 99, 0.05);
        assert!(
            lo <= point && point <= hi,
            "CI [{lo}, {hi}] must bracket the sample AUC {point}"
        );
        let analytic = normal_cdf(dprime / std::f64::consts::SQRT_2); // ≈ 0.921
        assert!(
            lo < analytic && analytic < hi,
            "CI [{lo}, {hi}] must bracket the binormal AUC {analytic}"
        );
        assert!(bootstrap_auc_ci(&[], &neg, 100, 1, 0.05).0.is_nan());
    }

    #[test]
    fn delong_variance_matches_hand_worked_example() {
        // pos = {1,2,3}, neg = {0.5,1.5}: V10 = {0.5,1,1}, V01 = {1, 2/3}.
        // AUC = 5/6; S10 = 1/12, S01 = 1/18; Var = S10/3 + S01/2 = 1/18 ≈ 0.055556.
        let pos = [1.0, 2.0, 3.0];
        let neg = [0.5, 1.5];
        let (a, _, _) = auc_delong_components(&pos, &neg);
        assert!((a - 5.0 / 6.0).abs() < 1e-12, "auc {a}");
        let var = delong_auc_variance(&pos, &neg);
        assert!((var - 1.0 / 18.0).abs() < 1e-9, "var {var}");
        let (lo, hi) = delong_ci(&pos, &neg, 0.05);
        assert!(
            lo < a && a < hi && (0.0..=1.0).contains(&lo) && (0.0..=1.0).contains(&hi),
            "ci [{lo}, {hi}]"
        );
        assert!(delong_auc_variance(&[1.0], &neg).is_nan());
    }

    #[test]
    fn spearman_monotone_reversed_and_tied() {
        let (rho, p) = spearman(&[1.0, 2.0, 3.0, 4.0, 5.0], &[2.0, 4.0, 6.0, 8.0, 10.0]);
        assert!((rho - 1.0).abs() < 1e-12 && p < 0.05, "rho {rho} p {p}");
        let (rr, _) = spearman(&[1.0, 2.0, 3.0, 4.0, 5.0], &[10.0, 8.0, 6.0, 4.0, 2.0]);
        assert!((rr + 1.0).abs() < 1e-12, "reversed rho {rr}");
        // Tied y → textbook rho = 4.5/√22.5 = 0.9486832981.
        let (rt, _) = spearman(&[1.0, 2.0, 3.0, 4.0], &[1.0, 2.0, 2.0, 3.0]);
        assert!((rt - 0.948_683_298_1).abs() < 1e-6, "tied rho {rt}");
    }

    #[test]
    fn ridge_recovers_ols_and_shrinks_features() {
        // y = 1 + 2x exactly.
        let x = vec![vec![1.0], vec![2.0], vec![3.0], vec![4.0]];
        let y = [3.0, 5.0, 7.0, 9.0];
        let c = ridge_fit(&x, &y, 0.0);
        assert!(
            (c[0] - 1.0).abs() < 1e-9 && (c[1] - 2.0).abs() < 1e-9,
            "coeffs {c:?}"
        );
        assert!((ridge_predict(&c, &[5.0]) - 11.0).abs() < 1e-9);
        // y = 0.5 + x1 - x2 exactly.
        let x2 = vec![
            vec![1.0, 0.0],
            vec![0.0, 1.0],
            vec![1.0, 1.0],
            vec![2.0, 1.0],
        ];
        let y2 = [1.5, -0.5, 0.5, 1.5];
        let c2 = ridge_fit(&x2, &y2, 0.0);
        assert!(
            (c2[0] - 0.5).abs() < 1e-9 && (c2[1] - 1.0).abs() < 1e-9 && (c2[2] + 1.0).abs() < 1e-9,
            "coeffs {c2:?}"
        );
        // Heavy λ shrinks the feature slope toward zero.
        let c3 = ridge_fit(&x, &y, 1e6);
        assert!(c3[1].abs() < 0.01, "shrunk slope {}", c3[1]);
    }
}
