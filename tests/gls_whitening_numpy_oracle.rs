// SPDX-License-Identifier: AGPL-3.0-only
//! P2 oracle: GLS common-mode whitening and the Mahalanobis identity against numpy (LAPACK).
//!
//! **Oracle (P2, an independent numerical library).** numpy 2.3.5 (BSD-3-Clause) computes, in
//! `tests/fixtures/gls_whitening_numpy_oracle/gen_reference.py`, by its own LAPACK routines:
//! the Cholesky factor `L` of `Omega` (`numpy.linalg.cholesky`, potrf), the whitened residual
//! `z = L^-1 r` (`numpy.linalg.solve(L, r)`, gesv), the whitening operator `L^-1`
//! (`numpy.linalg.inv(L)`), and the Mahalanobis square `r^T Omega^-1 r` through
//! `numpy.linalg.solve(Omega, r)` with no Cholesky at all, so the identity
//! `z^T z = r^T Omega^-1 r` is checked against an independent route. Kshana's side is the
//! hand-rolled [`kshana::integrity::gls_commonmode::cholesky_lower`],
//! [`kshana::integrity::gls_commonmode::whiten`] and
//! [`kshana::integrity::gls_commonmode::mahalanobis_sq`].
//!
//! **Inputs.** The 3x3 case of `tests/fixtures/gls/reference.json` plus 200 committed random
//! symmetric positive-definite cases from seed 20260930 (N in 2..8, per-case scale
//! log-uniform in [1e-2, 1e2]; condition numbers are in the fixture).
//!
//! **Tolerance, fixed before the first comparison:** for `L`, `z` and `L^-1`, the
//! infinity-norm of the difference at most 1e-12 times the infinity-norm of the numpy value;
//! for the Mahalanobis square, relative error at most 1e-12. Every case must pass.

use kshana::integrity::gls_commonmode::{cholesky_lower, mahalanobis_sq, whiten};

const REFERENCE_JSON: &str = include_str!("fixtures/gls_whitening_numpy_oracle/reference.json");

/// Relative tolerance, fixed before the first comparison.
const REL_TOL: f64 = 1e-12;

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

fn inf_norm(rows: &[Vec<f64>]) -> f64 {
    rows.iter()
        .map(|r| r.iter().map(|x| x.abs()).sum::<f64>())
        .fold(0.0, f64::max)
}

fn vec_inf_norm(v: &[f64]) -> f64 {
    v.iter().map(|x| x.abs()).fold(0.0, f64::max)
}

fn matrix_rel(got: &[Vec<f64>], want: &[Vec<f64>]) -> f64 {
    assert_eq!(got.len(), want.len(), "matrix dimension");
    let diff: Vec<Vec<f64>> = got
        .iter()
        .zip(want)
        .map(|(g, w)| {
            assert_eq!(g.len(), w.len(), "row dimension");
            g.iter().zip(w).map(|(a, b)| a - b).collect()
        })
        .collect();
    inf_norm(&diff) / inf_norm(want)
}

fn vector_rel(got: &[f64], want: &[f64]) -> f64 {
    assert_eq!(got.len(), want.len(), "vector dimension");
    let diff: Vec<f64> = got.iter().zip(want).map(|(a, b)| a - b).collect();
    vec_inf_norm(&diff) / vec_inf_norm(want)
}

#[test]
fn whitening_and_mahalanobis_match_numpy_lapack() {
    let reference: serde_json::Value =
        serde_json::from_str(REFERENCE_JSON).expect("parse reference.json");
    let cases = reference["cases"].as_array().expect("cases");
    assert_eq!(cases.len(), 201, "the committed fixture carries 201 cases");

    let (mut worst_l, mut worst_z, mut worst_linv, mut worst_maha) =
        (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
    let mut failures = Vec::new();
    for (idx, case) in cases.iter().enumerate() {
        let omega = matrix(&case["omega"]);
        let r = vector(&case["residual"]);
        let n = omega.len();

        let l = cholesky_lower(&omega).expect("SPD input factors");
        let e_l = matrix_rel(&l, &matrix(&case["l"]));

        let z = whiten(&omega, &r).expect("SPD input whitens");
        let e_z = vector_rel(&z, &vector(&case["z"]));

        // Columns of L^-1 are the whitened unit vectors.
        let mut l_inv = vec![vec![0.0; n]; n];
        for j in 0..n {
            let mut e = vec![0.0; n];
            e[j] = 1.0;
            let col = whiten(&omega, &e).expect("SPD input whitens");
            for (i, value) in col.into_iter().enumerate() {
                l_inv[i][j] = value;
            }
        }
        let e_linv = matrix_rel(&l_inv, &matrix(&case["l_inv"]));

        let maha = mahalanobis_sq(&omega, &r).expect("SPD input");
        let want_maha = case["mahalanobis_sq"].as_f64().expect("mahalanobis_sq");
        let e_maha = (maha - want_maha).abs() / want_maha.abs();

        worst_l = worst_l.max(e_l);
        worst_z = worst_z.max(e_z);
        worst_linv = worst_linv.max(e_linv);
        worst_maha = worst_maha.max(e_maha);
        for (name, err) in [
            ("L", e_l),
            ("z", e_z),
            ("L^-1", e_linv),
            ("Mahalanobis", e_maha),
        ] {
            if err > REL_TOL {
                failures.push(format!(
                    "case {idx} (N={n}, cond {:.3}): {name} relative {err:.3e}",
                    case["cond"].as_f64().unwrap_or(f64::NAN)
                ));
            }
        }
    }
    eprintln!(
        "GLS whitening vs numpy: {} cases, worst relative L {worst_l:.3e}, z {worst_z:.3e}, \
         L^-1 {worst_linv:.3e}, Mahalanobis {worst_maha:.3e} (tolerance {REL_TOL:e})",
        cases.len()
    );
    assert!(
        failures.is_empty(),
        "{} disagreement(s):\n{}",
        failures.len(),
        failures.join("\n")
    );
}
