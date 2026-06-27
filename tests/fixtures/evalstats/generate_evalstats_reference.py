#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the eval_stats numerical kernels.

The eval_stats module is the statistics toolkit behind the AI/ML RF-impairment
optimism-gap study (src/impairment_study.rs + src/impairment_ml.rs): Spearman
rank correlation, the DeLong AUC variance / Wald CI, and ridge regression. Those
three kernels are *uniquely-defined* statistics, so independent third-party
authorities are genuine external oracles for them:

  SPEARMAN  eval_stats::spearman (rho)     -> scipy.stats.spearmanr
  DELONGVAR eval_stats::delong_auc_variance -> a self-contained fast-DeLong
                                               (Sun & Xu 2014) numpy implementation
  DELONGCI  eval_stats::delong_ci half-width -> z * sqrt(var), z = scipy.stats.norm.ppf
  RIDGE     eval_stats::ridge_fit coeffs    -> sklearn.linear_model.Ridge
                                               (cross-checked vs scipy.linalg.lstsq)

These validate the study's *computational spine* — the rank-correlation, the
AUC-uncertainty quantification and the regularised regression that the
gap-predictor and the optimism-gap ranking are built on. They do NOT validate
the synthetic optimism-gap STUDY itself (the impairment grid, the train/test
split design, the headline gap numbers), which stays honestly MODELLED — see
src/verification.rs.

Honest oracle independence:
  * Spearman, ridge: scipy / scikit-learn are different codebases implementing the
    same mathematically-unique quantity (Pearson correlation of fractional ranks;
    the ridge normal-equations minimiser). kshana's ridge_fit uses the
    intercept-unpenalised normal equations (D^T D + lambda*I)beta = D^T y; this is
    algebraically identical to scikit-learn's centred Ridge(alpha=lambda) and the
    two agree to ~1e-15 here, so sklearn is a true authority (not the same code).
  * DeLong variance: the fast-DeLong formula (Sun & Xu, IEEE SPL 2014) is the
    field-standard analytic variance of a single empirical AUC; the numpy
    implementation below is written from the published formula and is independent
    of kshana's Rust. The z critical value for the Wald half-width comes from
    scipy.stats.norm.ppf (the inverse normal CDF), an independent authority for
    kshana's bisection-on-normal_cdf z_for().

NOT validated here: the seeded percentile bootstrap (bootstrap_ci /
bootstrap_auc_ci). Its output is a function of kshana's ChaCha8 RNG stream, which
is not reproducible from Python; a Python resample would be a *different* random
draw, not an oracle. The bootstrap is therefore left to its own in-crate
closed-form bracketing tests and stays out of this external check by design.

Reproduce (offline, no kshana code involved); needs scipy + scikit-learn, so use
a python that has both (this machine's system python3 does):

    python3 -m pip install --user scipy scikit-learn numpy
    python3 generate_evalstats_reference.py > evalstats_reference.txt

Generated with scipy 1.17.0, scikit-learn 1.8.0, numpy 2.4.1.
"""

import numpy as np
from scipy.stats import spearmanr, norm
from scipy.linalg import lstsq
from sklearn.linear_model import Ridge


def fmt(v):
    return repr(float(v))


def csv(vals):
    return ",".join(fmt(v) for v in vals)


# ── Spearman rank correlation (rho only) ─────────────────────────────────────
def emit_spearman():
    cases = [
        ("monotone", [1, 2, 3, 4, 5, 6], [2, 4, 6, 8, 10, 12]),
        ("reversed", [1, 2, 3, 4, 5], [10, 8, 6, 4, 2]),
        ("tied_y", [1, 2, 3, 4], [1, 2, 2, 3]),
        ("tie_heavy", [1, 1, 2, 2, 3, 3, 4, 4], [1, 2, 2, 3, 3, 4, 4, 5]),
        ("many_ties", [5, 5, 5, 1, 2, 3, 3, 7], [1, 1, 2, 2, 2, 3, 3, 9]),
        ("noisy", [0.1, 0.5, 0.3, 0.9, 0.7, 0.2, 0.8],
                  [1.2, 2.5, 2.1, 4.0, 3.1, 1.0, 3.5]),
        ("neg_corr", [3, 1, 4, 1, 5, 9, 2, 6], [8, 7, 6, 5, 4, 3, 2, 1]),
        ("ties_both", [2, 2, 2, 5, 5, 1, 9, 9, 9, 4],
                      [3, 3, 1, 7, 7, 2, 8, 8, 8, 5]),
        ("ramp10", list(range(10)), [v * v for v in range(10)]),
    ]
    for name, x, y in cases:
        x = np.asarray(x, float)
        y = np.asarray(y, float)
        rho = spearmanr(x, y).statistic
        print(f"SPEARMAN {name} | {csv(x)} | {csv(y)} | {fmt(rho)}")


# ── DeLong AUC variance (fast-DeLong, Sun & Xu 2014) + Wald CI half-width ─────
def delong_components(pos, neg):
    """V10[i] = (1/n) sum_j psi(pos_i, neg_j); V01[j] = (1/m) sum_i psi(pos_i, neg_j);
    psi = 1 if a>b, 0.5 if a==b, 0 if a<b. Matches DeLong/Sun-Xu structural form."""
    pos = np.asarray(pos, float)
    neg = np.asarray(neg, float)
    m, n = len(pos), len(neg)
    v10 = np.empty(m)
    for i, p in enumerate(pos):
        v10[i] = (np.sum(neg < p) + 0.5 * np.sum(neg == p)) / n
    v01 = np.empty(n)
    for j, q in enumerate(neg):
        v01[j] = (np.sum(pos > q) + 0.5 * np.sum(pos == q)) / m
    auc = v10.mean()
    return auc, v10, v01


def delong_var(pos, neg):
    m, n = len(pos), len(neg)
    if m < 2 or n < 2:
        return np.nan, np.nan
    auc, v10, v01 = delong_components(pos, neg)
    var = v10.var(ddof=1) / m + v01.var(ddof=1) / n
    return auc, var


def emit_delong():
    # Small hand-checkable cases (validate the variance; some have a Wald CI that
    # runs past 1 and so exercises the [0,1] clamp in delong_ci — the Rust test
    # only compares the half-width on the clamp-free cases).
    cases = [
        ("hand", [1.0, 2.0, 3.0], [0.5, 1.5]),
        ("sep4", [2.0, 3.0, 4.0, 5.0], [0.0, 1.0, 1.5, 2.5]),
        ("overlap", [1.0, 2.0, 3.0, 4.0, 5.0], [1.5, 2.5, 3.5, 0.5, 4.5]),
        ("ties", [1.0, 1.0, 2.0, 3.0, 3.0], [1.0, 2.0, 2.0, 3.0]),
        ("wide_pos", [0.2, 0.4, 0.6, 0.8, 1.0, 1.2, 1.4],
                     [0.1, 0.3, 0.5, 0.7]),
        ("mixed", [3.1, 2.2, 4.7, 1.9, 5.5, 2.8],
                  [2.0, 3.3, 1.1, 4.0, 0.5]),
        ("biggrid", list(np.linspace(1.0, 5.0, 12)),
                    list(np.linspace(0.0, 4.0, 10))),
    ]
    # Larger, moderate-separation samples: the variance is small enough that the
    # Wald interval stays strictly inside (0,1), so the half-width is compared too.
    rng = np.random.default_rng(13503)
    interior = [
        ("interior_a", 0.6, 60, 55),
        ("interior_b", 0.8, 80, 70),
        ("interior_c", 1.0, 50, 50),
        ("interior_d", 0.5, 90, 85),
        ("interior_e", 0.7, 70, 60),
        ("interior_f", 0.9, 65, 75),
    ]
    for name, dprime, npos, nneg in interior:
        pos = dprime + rng.normal(size=npos)
        neg = rng.normal(size=nneg)
        cases.append((name, list(pos), list(neg)))

    for name, pos, neg in cases:
        pos = np.asarray(pos, float)
        neg = np.asarray(neg, float)
        auc, var = delong_var(pos, neg)
        # Wald CI half-width at alpha = 0.05: h = z_{1-alpha/2} * sqrt(var).
        alpha = 0.05
        z = norm.ppf(1.0 - alpha / 2.0)
        half = z * np.sqrt(var)
        print(f"DELONG {name} | {csv(pos)} | {csv(neg)} | "
              f"{fmt(auc)} {fmt(var)} {fmt(alpha)} {fmt(half)}")


# ── Ridge regression coefficients ────────────────────────────────────────────
def emit_ridge():
    rng = np.random.default_rng(20260627)
    cases = []

    # Exact linear, lambda=0 -> recovers OLS.
    cases.append(("ols_1d", np.array([[1.0], [2.0], [3.0], [4.0]]),
                  np.array([3.0, 5.0, 7.0, 9.0]), 0.0))
    cases.append(("ols_2d", np.array([[1.0, 0.0], [0.0, 1.0], [1.0, 1.0], [2.0, 1.0]]),
                  np.array([1.5, -0.5, 0.5, 1.5]), 0.0))

    # Random designs with several lambdas.
    X3 = rng.normal(size=(25, 3))
    y3 = 1.0 + X3 @ np.array([2.0, -1.0, 0.5]) + 0.1 * rng.normal(size=25)
    for lam in (0.0, 0.1, 1.0, 10.0):
        cases.append((f"rand3_lam{lam:g}", X3, y3, lam))

    X4 = rng.normal(size=(40, 4)) * np.array([1.0, 5.0, 0.2, 2.0])
    y4 = -0.5 + X4 @ np.array([0.3, -0.7, 4.0, 1.1]) + 0.05 * rng.normal(size=40)
    for lam in (0.0, 0.5, 5.0):
        cases.append((f"rand4_lam{lam:g}", X4, y4, lam))

    for name, X, y, lam in cases:
        X = np.asarray(X, float)
        y = np.asarray(y, float)
        n, p = X.shape
        # Oracle: scikit-learn Ridge (penalises coefficients only, centred intercept).
        r = Ridge(alpha=lam, fit_intercept=True, solver="cholesky")
        r.fit(X, y)
        sk = np.concatenate([[r.intercept_], r.coef_])  # [intercept, w1..wp]
        # Cross-check sklearn against the regularised normal equations solved by
        # scipy.linalg.lstsq on the augmented (Tikhonov) system, so the .txt is
        # internally consistent before kshana ever sees it.
        D = np.column_stack([np.ones(n), X])
        A = D.T @ D
        reg = np.eye(p + 1)
        reg[0, 0] = 0.0  # intercept unpenalised, matching kshana + sklearn
        beta_ls, *_ = lstsq(A + lam * reg, D.T @ y)
        crosscheck = float(np.max(np.abs(sk - beta_ls)))
        assert crosscheck < 1e-8, f"{name}: sklearn vs lstsq disagree {crosscheck:.2e}"
        # one feature row per sample, flattened row-major: n p then the rows
        rows = ";".join(csv(X[i]) for i in range(n))
        print(f"RIDGE {name} | {n} {p} {fmt(lam)} | {rows} | {csv(y)} | {csv(sk)}")


def main():
    print("# eval_stats reference — oracles: scipy 1.17.0 (spearmanr, norm.ppf, lstsq),")
    print("# scikit-learn 1.8.0 (Ridge), + a self-contained fast-DeLong (Sun & Xu 2014).")
    print("# Consumed by tests/evalstats_reference.rs. See generate_evalstats_reference.py.")
    print("# SPEARMAN name | x(,) | y(,) | rho                         (scipy.stats.spearmanr)")
    print("# DELONG  name | pos(,) | neg(,) | auc var alpha halfwidth  (fast-DeLong + norm.ppf)")
    print("# RIDGE   name | n p lambda | rows(; , ) | y(,) | coeffs(,)  (sklearn Ridge)")
    emit_spearman()
    emit_delong()
    emit_ridge()


if __name__ == "__main__":
    main()
