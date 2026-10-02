// SPDX-License-Identifier: AGPL-3.0-only
//! P2 oracle: the GLS (generalised least squares) common-mode consistency statistic against
//! numpy (LAPACK, the Linear Algebra PACKage).
//!
//! **Quantity.** The value returned by
//! [`kshana::integrity::gls_commonmode::common_mode_consistency`] for a covariance `Omega` and a
//! residual vector `r`: `s = (1^T Omega^-1 r)^2 / (1^T Omega^-1 1)`, the squared known-scale
//! Wald (score) statistic of a GLS intercept-only regression, with degrees of freedom 1. The
//! engine computes it from its hand-rolled Cholesky factor and two forward substitutions.
//!
//! **Oracle (P2, an independent numerical library).** numpy 2.3.5 (BSD-3-Clause), in
//! `tests/fixtures/gls_common_mode_statistic_numpy_oracle/gen_reference.py`, computes
//! `x1 = numpy.linalg.solve(Omega, 1)` and `xr = numpy.linalg.solve(Omega, r)` (LAPACK gesv, an
//! LU factorisation with partial pivoting: no Cholesky anywhere) and
//! `s = (1 . xr)^2 / (1 . x1)`. The fixture also records, per case, the 2-norm condition number
//! of `Omega` (`numpy.linalg.cond`) and the whitened cosine
//! `cos_w = (1^T Omega^-1 r) / sqrt((1^T Omega^-1 1)(r^T Omega^-1 r))`, both from numpy.
//!
//! **Inputs, committed with the fixture.**
//! - Case 0: the 3x3 case of `tests/fixtures/gls/reference.json`.
//! - Tier A, 200 well-conditioned symmetric positive-definite (SPD) cases from seed 20261001 with
//!   the row-149 recipe (N in 2..8, per-case scale log-uniform in [1e-2, 1e2]); a draw whose
//!   condition number exceeds 100 is redrawn; `r` is redrawn until `|cos_w| >= 0.1` (a rule on
//!   the inputs, stated here, so a case is never chosen by the engine's answer).
//! - Tier C, 20 common-mode shift cases: for the first 20 Tier-A cases, `r' = r + mu 1` with
//!   `mu = sign(1^T Omega^-1 r) * 3 / sqrt(1^T Omega^-1 1)`, which by construction makes
//!   `s' >= 9`, a shift common to every source.
//! - Tier B, 40 ill-conditioned SPD cases: 30 of the form `Q diag(lambda) Q^T` (Q from the QR of
//!   a Gaussian matrix, eigenvalues log-spaced, condition number log-uniform in [1e3, 1e8]) and
//!   10 shared-reference matrices `Omega_ij = s_i s_j (rho + (1 - rho) delta_ij)` (every pair of
//!   sources correlated at `rho`, `rho` in [0.999, 0.9999999]); the same `|cos_w| >= 0.1` rule
//!   applies.
//!
//! **Tolerance, fixed before the first comparison.** Case 0 and Tiers A and C: relative error at
//! most 1e-12 against the numpy value. Tier B: relative error at most
//! `1e-12 + 6 (3N+1) N u cond_2(Omega) / |cos_w|` with `u = 2^-53`, the first-order bound for a
//! backward-stable Cholesky and solve (Higham, *Accuracy and Stability of Numerical
//! Algorithms*, 2nd ed., Theorem 10.4: backward error at most `(3N+1) N u ||Omega||` per
//! factor-and-solve; the statistic's relative sensitivity to a perturbation of `Omega` is at most
//! `3 cond_2(Omega) / |cos_w|`; the factor 2 covers the engine and numpy each carrying it).
//! Every case must pass, and the reported degrees of freedom must be exactly 1.
//!
//! **What this validates, and what it does not.** The value of the statistic on the committed
//! `(Omega, r)`: the linear algebra. The chi-square law with one degree of freedom under the
//! null is the score/Wald theorem (Cited, not tested here); that a common-mode shift leaves the
//! pairwise separations unchanged is an algebraic identity (`(r_i + mu) - (r_j + mu) = r_i -
//! r_j`), and the engine has no separation output for it to be compared on.

use std::path::PathBuf;

use kshana::integrity::gls_commonmode::common_mode_consistency;

/// Relative tolerance for case 0 and Tiers A and C, fixed before the first comparison.
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
        .join("tests/fixtures/gls_common_mode_statistic_numpy_oracle/reference.json");
    let raw =
        std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {}: {e}", path.display()));
    serde_json::from_str(&raw).expect("parse reference.json")
}

/// The tolerance a case is held to, as written in the header.
fn allowed_relative(tier: &str, n: usize, cond: f64, cos_w: f64) -> f64 {
    match tier {
        "B" => {
            let nf = n as f64;
            REL_TOL + 6.0 * (3.0 * nf + 1.0) * nf * UNIT_ROUNDOFF * cond / cos_w.abs()
        }
        _ => REL_TOL,
    }
}

#[test]
fn common_mode_statistic_matches_numpy_lapack() {
    let reference = load_reference();
    let cases = reference["cases"].as_array().expect("cases");
    assert_eq!(
        cases.len(),
        261,
        "the committed fixture carries 1 + 200 + 20 + 40 cases"
    );

    let mut worst = std::collections::BTreeMap::<String, f64>::new();
    let mut worst_share_of_allowance = 0.0_f64;
    let mut failures = Vec::new();
    for (idx, case) in cases.iter().enumerate() {
        let tier = case["tier"].as_str().expect("tier");
        let omega = matrix(&case["omega"]);
        let r = vector(&case["residual"]);
        let n = r.len();
        let cond = case["cond"].as_f64().expect("cond");
        let cos_w = case["cos_w"].as_f64().expect("cos_w");
        let want = case["statistic"].as_f64().expect("statistic");

        let got = common_mode_consistency(&omega, &r).expect("SPD input gives a statistic");
        if got.dof != 1 {
            failures.push(format!("case {idx}: dof {} (want 1)", got.dof));
        }
        let rel = (got.value - want).abs() / want.abs();
        let allowed = allowed_relative(tier, n, cond, cos_w);
        let w = worst.entry(tier.to_string()).or_insert(0.0);
        *w = w.max(rel);
        worst_share_of_allowance = worst_share_of_allowance.max(rel / allowed);
        if rel.is_nan() || rel > allowed {
            failures.push(format!(
                "case {idx} (tier {tier}, N={n}, cond {cond:.3e}, cos_w {cos_w:.3}): engine \
                 {:.17e} vs numpy {want:.17e}, relative {rel:.3e} > allowed {allowed:.3e}",
                got.value
            ));
        }
        // Tier C carries the unshifted partner's index: the shift must inflate the statistic.
        if let Some(partner) = case["shift_of"].as_u64() {
            let base = &cases[partner as usize];
            let base_got =
                common_mode_consistency(&matrix(&base["omega"]), &vector(&base["residual"]))
                    .expect("SPD")
                    .value;
            if !(got.value > base_got && got.value >= 9.0 * (1.0 - 1e-12)) {
                failures.push(format!(
                    "case {idx}: common-mode shift of case {partner} did not inflate the \
                     statistic ({base_got:.6e} -> {:.6e})",
                    got.value
                ));
            }
        }
    }
    eprintln!(
        "common-mode statistic vs numpy: {} cases, worst relative error per tier {worst:?}, \
         largest share of a case's allowance {worst_share_of_allowance:.3e}",
        cases.len()
    );
    assert!(
        failures.is_empty(),
        "{} disagreement(s):\n{}",
        failures.len(),
        failures.join("\n")
    );
}
