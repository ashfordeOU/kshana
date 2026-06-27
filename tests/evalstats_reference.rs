// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the `eval_stats` numerical kernels — the statistics
//! toolkit behind the AI/ML RF-impairment optimism-gap study — against
//! **independent third-party authorities**: scipy 1.17.0 (Virtanen et al.,
//! *Nature Methods* 2020) and scikit-learn 1.8.0 (Pedregosa et al., JMLR 2011),
//! plus a self-contained fast-DeLong (Sun & Xu, *IEEE Signal Processing Letters*
//! 2014) implementation.
//!
//! Three uniquely-defined statistics are checked against an oracle that is a
//! *different codebase* fed byte-identical inputs — the same kind of
//! library-vs-library validation DOP gets against gnss_lib_py and the
//! quantum-trade kernels get against scipy:
//!
//!   * `eval_stats::spearman` (rho) vs `scipy.stats.spearmanr`, including
//!     tie-heavy vectors (fractional-rank Pearson correlation);
//!   * `eval_stats::delong_auc_variance` vs the fast-DeLong analytic variance,
//!     and `eval_stats::delong_ci` half-width vs `z·√var` with
//!     `z = scipy.stats.norm.ppf(1−α/2)` (an independent authority for kshana's
//!     bisection-on-`normal_cdf` z critical value);
//!   * `eval_stats::ridge_fit` coefficients vs `sklearn.linear_model.Ridge`
//!     (cross-checked against `scipy.linalg.lstsq` on the Tikhonov system).
//!     kshana's intercept-unpenalised normal equations
//!     `(DᵀD + λI)β = Dᵀy` are algebraically identical to scikit-learn's centred
//!     `Ridge(alpha=λ)`, and agree to ~1e-15.
//!
//! Honest scope: this validates the study's *computational spine* — the
//! rank-correlation, the AUC-uncertainty quantification and the regularised
//! regression that the ID-only gap predictor and the optimism-gap ranking are
//! built on. It does NOT validate the synthetic optimism-gap STUDY itself (the
//! impairment grid, the train/test split design, the headline gap numbers),
//! which stays honestly MODELLED — see `src/verification.rs`.
//!
//! NOT validated here: the seeded percentile bootstrap (`bootstrap_ci` /
//! `bootstrap_auc_ci`). Its output is a function of kshana's ChaCha8 RNG stream,
//! which is not reproducible from Python — a Python resample would be a different
//! random draw, not an oracle. The bootstrap keeps its own in-crate closed-form
//! bracketing tests and stays out of this external check by design.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/evalstats/`.

use kshana::eval_stats::{delong_auc_variance, delong_ci, ridge_fit, spearman};

const REF: &str = include_str!("fixtures/evalstats/evalstats_reference.txt");

/// `got` is within tolerance of the oracle `want`: a relative bound plus a small
/// absolute floor so a quantity the oracle reports as a numerical zero matches
/// kshana's exact 0.0.
fn approx(got: f64, want: f64, rel_tol: f64, abs_tol: f64) -> bool {
    (got - want).abs() <= rel_tol * want.abs() + abs_tol
}

fn csv_f64(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect()
}

#[test]
fn spearman_matches_scipy_spearmanr() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("SPEARMAN ") {
            continue;
        }
        // SPEARMAN name | x(,) | y(,) | rho
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "SPEARMAN row needs 4 |-fields: {line}");
        let name = parts[0].trim_start_matches("SPEARMAN").trim();
        let x = csv_f64(parts[1]);
        let y = csv_f64(parts[2]);
        let want: f64 = parts[3].trim().parse().unwrap();

        // Only rho is the universally-defined quantity. kshana's p-value is a
        // bespoke large-sample normal approximation, NOT scipy's t-distribution
        // p-value, so it is deliberately not compared here.
        let (rho, _p) = spearman(&x, &y);
        let d = (rho - want).abs();
        worst = worst.max(d);
        assert!(
            approx(rho, want, 1e-9, 1e-12),
            "SPEARMAN {name}: rho {rho:.15e} vs scipy {want:.15e} (|Δ|={d:.2e})"
        );
        n += 1;
    }
    assert!(n >= 6, "expected >= 6 Spearman cases, got {n}");
    eprintln!("spearman: {n} cases vs scipy.stats.spearmanr, worst |Δrho| = {worst:.3e}");
}

#[test]
fn delong_variance_and_ci_match_fast_delong_and_norm_ppf() {
    let mut n_var = 0usize;
    let mut n_half = 0usize;
    let mut worst_var = 0.0_f64;
    let mut worst_half = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("DELONG ") {
            continue;
        }
        // DELONG name | pos(,) | neg(,) | auc var alpha halfwidth
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "DELONG row needs 4 |-fields: {line}");
        let name = parts[0].trim_start_matches("DELONG").trim();
        let pos = csv_f64(parts[1]);
        let neg = csv_f64(parts[2]);
        let tail: Vec<f64> = parts[3]
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();
        assert_eq!(tail.len(), 4, "{name}: need auc var alpha halfwidth");
        let (auc_want, var_want, alpha, half_want) = (tail[0], tail[1], tail[2], tail[3]);

        // (b) variance vs fast-DeLong (relative 1e-6) — checked on every case.
        let var = delong_auc_variance(&pos, &neg);
        let rd = (var - var_want).abs() / var_want.abs();
        worst_var = worst_var.max(rd);
        assert!(
            approx(var, var_want, 1e-6, 1e-15),
            "DELONG {name}: var {var:.12e} vs fast-DeLong {var_want:.12e} (rel {rd:.2e})"
        );

        // delong_ci half-width vs z·√var, with z = norm.ppf(1−α/2). kshana's z
        // comes from a bisection on normal_cdf; scipy's norm.ppf is the
        // independent inverse-normal authority. The public delong_ci clamps the
        // bounds to [0,1], so the recovered half-width (hi−lo)/2 only equals the
        // true z·√var when NEITHER bound clamps; the half-width comparison is
        // therefore scoped to the clamp-free cases (the others still exercise the
        // variance check above). Clamp-freeness is read from the oracle row's own
        // (auc ± half) — independent of kshana — then re-confirmed on kshana's
        // own returned bounds.
        let interior_oracle = (auc_want - half_want) > 0.0 && (auc_want + half_want) < 1.0;
        if interior_oracle {
            let (lo, hi) = delong_ci(&pos, &neg, alpha);
            assert!(
                lo > 0.0 && hi < 1.0,
                "DELONG {name}: oracle-interior case but kshana CI [{lo},{hi}] clamped"
            );
            let half = 0.5 * (hi - lo);
            let rh = (half - half_want).abs() / half_want.abs();
            worst_half = worst_half.max(rh);
            assert!(
                approx(half, half_want, 1e-6, 1e-12),
                "DELONG {name}: CI half-width {half:.12e} vs z·√var {half_want:.12e} (rel {rh:.2e})"
            );
            n_half += 1;
        }
        n_var += 1;
    }
    assert!(
        n_var >= 8,
        "expected >= 8 DeLong variance cases, got {n_var}"
    );
    assert!(
        n_half >= 6,
        "expected >= 6 clamp-free DeLong CI half-width cases, got {n_half}"
    );
    eprintln!(
        "delong: {n_var} variance cases (worst rel {worst_var:.3e}), \
         {n_half} clamp-free CI half-width cases (worst rel {worst_half:.3e})"
    );
}

#[test]
fn ridge_fit_matches_sklearn_ridge() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("RIDGE ") {
            continue;
        }
        // RIDGE name | n p lambda | rows(; , ) | y(,) | coeffs(,)
        let parts: Vec<&str> = line.splitn(5, '|').collect();
        assert_eq!(parts.len(), 5, "RIDGE row needs 5 |-fields: {line}");
        let name = parts[0].trim_start_matches("RIDGE").trim();
        let head: Vec<&str> = parts[1].split_whitespace().collect();
        assert_eq!(head.len(), 3, "{name}: head is `n p lambda`");
        let nrows: usize = head[0].parse().unwrap();
        let p: usize = head[1].parse().unwrap();
        let lambda: f64 = head[2].parse().unwrap();

        let x: Vec<Vec<f64>> = parts[2].trim().split(';').map(csv_f64).collect();
        assert_eq!(x.len(), nrows, "{name}: expected {nrows} rows");
        for (i, row) in x.iter().enumerate() {
            assert_eq!(
                row.len(),
                p,
                "{name}: row {i} has {} feats, want {p}",
                row.len()
            );
        }
        let y = csv_f64(parts[3]);
        assert_eq!(y.len(), nrows, "{name}: y length mismatch");
        let want = csv_f64(parts[4]);
        assert_eq!(want.len(), p + 1, "{name}: need intercept + {p} coeffs");

        let got = ridge_fit(&x, &y, lambda);
        assert_eq!(got.len(), want.len(), "{name}: coeff count");
        // Scale the absolute floor to the dominant coefficient magnitude so a
        // coefficient near zero matches without masking a real disagreement.
        let scale = want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        let abs_tol = 1e-9 * scale;
        for (k, (&g, &w)) in got.iter().zip(want.iter()).enumerate() {
            let lbl = if k == 0 {
                "b0".to_string()
            } else {
                format!("w{k}")
            };
            worst = worst.max((g - w).abs());
            assert!(
                approx(g, w, 1e-6, abs_tol),
                "RIDGE {name} (λ={lambda}): {lbl} {g:.12e} vs sklearn {w:.12e}"
            );
        }
        n += 1;
    }
    assert!(n >= 6, "expected >= 6 ridge cases, got {n}");
    eprintln!("ridge: {n} cases vs sklearn Ridge, worst |Δcoeff| = {worst:.3e}");
}
