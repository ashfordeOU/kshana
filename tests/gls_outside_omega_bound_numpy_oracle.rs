// SPDX-License-Identifier: AGPL-3.0-only
//! P2 oracle: the undetectable common-mode ceiling `min(alpha_ss, alpha_cm)` against numpy
//! (LAPACK, the Linear Algebra PACKage).
//!
//! **Quantity.** The value returned by
//! [`kshana::integrity::gls_commonmode::residual_outside_omega_bound`] for a modelled covariance
//! `Omega`, a fault direction `d` and the two detection thresholds `T_ss` (whitened separation)
//! and `T_cm` (common-mode chi-square): `min(alpha_ss, alpha_cm)` with
//! - `mu = (1^T Omega^-1 d) / (1^T Omega^-1 1)`, the GLS (generalised least squares) common-mode
//!   coefficient of `d`, and `v = d - mu 1`, its contrast part;
//! - `alpha_ss = T_ss / sqrt(v^T Omega^-1 v)`, the threshold over the whitened contrast norm
//!   (for any `L` with `L L^T = Omega`, `||L^-1 v||^2 = v^T Omega^-1 v`, so the quantity does not
//!   depend on the factor);
//! - `alpha_cm = sqrt(T_cm (1^T Omega^-1 1)) / |1^T Omega^-1 d|`.
//!
//! Each ceiling is also read on its own through the public function by disabling the other
//! detector with an infinite threshold: `residual_outside_omega_bound(Omega, d, T_ss, +inf)` is
//! `alpha_ss`, and `residual_outside_omega_bound(Omega, d, +inf, T_cm)` is `alpha_cm`.
//!
//! **Oracle (P2, an independent numerical library).** numpy 2.3.5 (BSD-3-Clause), in
//! `tests/fixtures/gls_outside_omega_bound_numpy_oracle/gen_reference.py`, computes every
//! `Omega^-1 x` with `numpy.linalg.solve` (LAPACK gesv, an LU factorisation with partial
//! pivoting: no Cholesky anywhere) and the quadratic form `v^T Omega^-1 v` directly from
//! `solve(Omega, v)` with `v` formed from numpy's own `mu`. Positive-definiteness is decided by
//! `numpy.linalg.cholesky` raising `LinAlgError`, confirmed by `numpy.linalg.eigvalsh`.
//!
//! **Inputs, committed with the fixture** (seed 20261002; thresholds are inputs: `T_ss` uniform
//! in [1, 8], `T_cm = scipy.stats.chi2.isf(p, 1)` with `p` log-uniform in [1e-9, 1e-2]):
//! - Tier A, 200 well-conditioned SPD cases (row-149 recipe, N in 2..8, condition number at
//!   most 100, else redrawn); `d` is redrawn until the whitened cosine between `1` and `d`,
//!   `cos_w = (1^T Omega^-1 d) / sqrt((1^T Omega^-1 1)(d^T Omega^-1 d))`, has `|cos_w|` in
//!   [0.1, 0.9], so neither ceiling sits at its degenerate edge.
//! - Tier B, 40 ill-conditioned SPD cases (30 `Q diag(lambda) Q^T`, condition number log-uniform
//!   in [1e3, 1e8]; 10 shared-reference `Omega_ij = s_i s_j (rho + (1 - rho) delta_ij)`, `rho`
//!   in [0.999, 0.9999999]), same `|cos_w|` rule.
//! - Tier P (pure common mode), 5 cases `d = k 1`, `k` in {1, 2, -0.5, 3, 0.1}: separation is
//!   blind (`alpha_ss` infinite in exact arithmetic), so the minimum is `alpha_cm`; the minimum
//!   and `alpha_cm` are compared, the isolated `alpha_ss` is not (it is not an output of the
//!   function, and its exact-arithmetic infinity is not representable after rounding `d`).
//! - Tier O (outside the modelled common axis), 5 cases with `d = w - mu_w 1`, so that
//!   `1^T Omega^-1 d = 0` in exact arithmetic: the common-mode statistic is blind, the minimum
//!   is `alpha_ss`; the minimum and `alpha_ss` are compared, the isolated `alpha_cm` is not.
//! - Tier Z (no finite ceiling), 6 cases: `d = 0` for N = 1, 3, 5, and three indefinite
//!   `Omega` (one eigenvalue at most -1e-3 of the largest) with a random `d`. The function must
//!   return exactly `+inf`.
//!
//! **Tolerance, fixed before the first comparison.** Tiers A, P and O: relative error at most
//! 1e-12 against numpy on every compared ceiling and on the minimum. Tier B: relative error at
//! most `1e-12 + 6 (3N+1) N u cond_2(Omega) (1/|cos_w| + 1/(1 - cos_w^2))` with `u = 2^-53`,
//! the first-order bound for a backward-stable Cholesky and solve (Higham, *Accuracy and
//! Stability of Numerical Algorithms*, 2nd ed., Theorem 10.4) times the sensitivity of the two
//! ceilings to a perturbation of `Omega`, doubled because the engine and numpy each carry it.
//! Tier Z: exactly `f64::INFINITY`. Every case must pass.
//!
//! **What this validates.** The linear algebra of the ceiling on the committed inputs: under a
//! positive-definite `Omega` the minimum is finite for every nonzero `d`, and it is infinite only
//! for a zero direction or a `Omega` that is not positive-definite. Whether this idealised
//! single whitened-contrast detector is a lower bound on a real subset detector's undetectable
//! magnitude is a modelling statement and is not tested here.

use std::path::PathBuf;

use kshana::integrity::gls_commonmode::residual_outside_omega_bound;

/// Relative tolerance for Tiers A, P and O, fixed before the first comparison.
const REL_TOL: f64 = 1e-12;
/// Unit roundoff of binary64, `2^-53`.
const UNIT_ROUNDOFF: f64 = 1.110_223_024_625_156_5e-16;

fn vector(v: &serde_json::Value) -> Vec<f64> {
    v.as_array()
        .expect("array")
        .iter()
        .map(|x| x.as_f64().expect("number"))
        .collect()
}

fn matrix(v: &serde_json::Value) -> Vec<Vec<f64>> {
    v.as_array().expect("array").iter().map(vector).collect()
}

fn load_reference() -> serde_json::Value {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/gls_outside_omega_bound_numpy_oracle/reference.json");
    let raw = std::fs::read_to_string(&path)
        .unwrap_or_else(|e| panic!("read {}: {e}", path.display()));
    serde_json::from_str(&raw).expect("parse reference.json")
}

fn allowed_relative(tier: &str, n: usize, cond: f64, cos_w: f64) -> f64 {
    match tier {
        "B" => {
            let nf = n as f64;
            REL_TOL
                + 6.0
                    * (3.0 * nf + 1.0)
                    * nf
                    * UNIT_ROUNDOFF
                    * cond
                    * (1.0 / cos_w.abs() + 1.0 / (1.0 - cos_w * cos_w))
        }
        _ => REL_TOL,
    }
}

type Tally<'a> = (
    &'a mut std::collections::BTreeMap<String, f64>,
    &'a mut Vec<String>,
);

/// Compare one ceiling against numpy and record the outcome.
fn check(
    (worst, failures): Tally<'_>,
    idx: usize,
    tier: &str,
    what: &str,
    got: f64,
    want: f64,
    allowed: f64,
) {
    let rel = (got - want).abs() / want.abs();
    let w = worst.entry(format!("{tier}/{what}")).or_insert(0.0);
    *w = w.max(rel);
    if !(rel <= allowed) {
        failures.push(format!(
            "case {idx} (tier {tier}) {what}: engine {got:.17e} vs numpy {want:.17e}, \
             relative {rel:.3e} > allowed {allowed:.3e}"
        ));
    }
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn undetectable_common_mode_ceiling_matches_numpy_lapack() {
    let reference = load_reference();
    let cases = reference["cases"].as_array().expect("cases");
    assert_eq!(
        cases.len(),
        256,
        "the committed fixture carries 200 + 40 + 5 + 5 + 6 cases"
    );

    let mut worst = std::collections::BTreeMap::<String, f64>::new();
    let mut failures = Vec::new();
    for (idx, case) in cases.iter().enumerate() {
        let tier = case["tier"].as_str().expect("tier");
        let omega = matrix(&case["omega"]);
        let d = vector(&case["direction"]);
        let t_ss = case["t_ss"].as_f64().expect("t_ss");
        let t_cm = case["t_cm"].as_f64().expect("t_cm");
        let n = d.len();

        let min = residual_outside_omega_bound(&omega, &d, t_ss, t_cm);
        if tier == "Z" {
            if min != f64::INFINITY {
                failures.push(format!(
                    "case {idx} (tier Z, {}): engine {min:e}, want +inf",
                    case["why"].as_str().unwrap_or("")
                ));
            }
            continue;
        }
        let cond = case["cond"].as_f64().expect("cond");
        let cos_w = case["cos_w"].as_f64().expect("cos_w");
        let allowed = allowed_relative(tier, n, cond, cos_w);
        let alpha_ss = residual_outside_omega_bound(&omega, &d, t_ss, f64::INFINITY);
        let alpha_cm = residual_outside_omega_bound(&omega, &d, f64::INFINITY, t_cm);
        check(
            (&mut worst, &mut failures),
            idx,
            tier,
            "min",
            min,
            case["min"].as_f64().expect("min"),
            allowed,
        );
        if tier != "P" {
            check(
                (&mut worst, &mut failures),
                idx,
                tier,
                "alpha_ss",
                alpha_ss,
                case["alpha_ss"].as_f64().expect("alpha_ss"),
                allowed,
            );
        }
        if tier != "O" {
            check(
                (&mut worst, &mut failures),
                idx,
                tier,
                "alpha_cm",
                alpha_cm,
                case["alpha_cm"].as_f64().expect("alpha_cm"),
                allowed,
            );
        }
    }
    eprintln!(
        "undetectable common-mode ceiling vs numpy: {} cases, worst relative error {worst:?}",
        cases.len()
    );
    assert!(
        failures.is_empty(),
        "{} disagreement(s):\n{}",
        failures.len(),
        failures.join("\n")
    );
}
