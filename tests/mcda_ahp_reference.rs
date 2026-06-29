// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the Analytic Hierarchy Process.**
//!
//! Two independent external anchors, both reproduced by the committed generator
//! `tests/fixtures/mcda_ahp/generate_ahp_reference.py`:
//!
//!  1. **Saaty's canonical Random Index table** (T. L. Saaty, *The Analytic
//!     Hierarchy Process*, McGraw-Hill, 1980): RI(n), n = 1..10. Kshana's
//!     `saaty_random_index` must equal these published constants exactly.
//!  2. **SciPy / LAPACK** (`scipy.linalg.eig`) as an independent principal
//!     eigensolver: the AHP priority vector is the normalised Perron eigenvector and
//!     λ_max the principal eigenvalue of the reciprocal pairwise matrix. Kshana
//!     derives them by power iteration; agreement to < 1e-9 with LAPACK's dense QR
//!     algorithm cross-validates the Kshana solver, and the Consistency Index /
//!     Consistency Ratio follow.
//!
//! All reference numbers below carry that provenance and are reproduced with no
//! third-party Rust code.

use kshana::mcda::ahp::{saaty_random_index, PairwiseMatrix};

const TOL: f64 = 1e-9;

fn close(a: f64, b: f64) -> bool {
    (a - b).abs() < TOL
}

#[test]
fn random_index_matches_saaty_1980_table_exactly() {
    // Saaty 1980 canonical RI(n), n = 1..10.
    let saaty = [0.0, 0.0, 0.58, 0.90, 1.12, 1.24, 1.32, 1.41, 1.45, 1.49];
    for (k, &ri) in saaty.iter().enumerate() {
        let n = k + 1;
        assert_eq!(
            saaty_random_index(n),
            Some(ri),
            "RI({n}) must be the published Saaty value {ri}"
        );
    }
}

#[test]
fn consistent_3x3_matches_lapack_exactly() {
    // Perfectly consistent geometric matrix: λ_max = n exactly, CR = 0.
    let a = PairwiseMatrix::new(vec![
        vec![1.0, 2.0, 4.0],
        vec![0.5, 1.0, 2.0],
        vec![0.25, 0.5, 1.0],
    ])
    .unwrap();
    let r = a.analyse();
    // SciPy/LAPACK priority = [0.5714285714285715, 0.2857142857142856, 0.1428571428571429]
    let pv = [
        5.714285714285715e-01,
        2.857142857142856e-01,
        1.428571428571429e-01,
    ];
    for (g, w) in r.priorities.iter().zip(pv) {
        assert!(close(*g, w), "priority {g} vs LAPACK {w}");
    }
    assert!(close(r.lambda_max, 3.0), "lambda_max {}", r.lambda_max);
    assert!(r.consistency_ratio.unwrap().abs() < TOL);
    assert!(r.acceptable);
}

#[test]
fn inconsistent_3x3_matches_lapack() {
    let a = PairwiseMatrix::new(vec![
        vec![1.0, 2.0, 5.0],
        vec![0.5, 1.0, 3.0],
        vec![0.2, 1.0 / 3.0, 1.0],
    ])
    .unwrap();
    let r = a.analyse();
    assert!(close(r.lambda_max, 3.003694598063639), "lambda_max {}", r.lambda_max);
    let pv = [
        5.815520668516161e-01,
        3.089956436328641e-01,
        1.094522895155198e-01,
    ];
    for (g, w) in r.priorities.iter().zip(pv) {
        assert!(close(*g, w), "priority {g} vs LAPACK {w}");
    }
    assert!(close(r.consistency_index, 1.847299031819682e-03));
    assert!(close(r.consistency_ratio.unwrap(), 3.184998330723591e-03));
    assert!(r.acceptable);
}

#[test]
fn inconsistent_4x4_matches_lapack() {
    let a = PairwiseMatrix::new(vec![
        vec![1.0, 3.0, 7.0, 9.0],
        vec![1.0 / 3.0, 1.0, 5.0, 7.0],
        vec![1.0 / 7.0, 1.0 / 5.0, 1.0, 3.0],
        vec![1.0 / 9.0, 1.0 / 7.0, 1.0 / 3.0, 1.0],
    ])
    .unwrap();
    let r = a.analyse();
    assert!(close(r.lambda_max, 4.164576705149029), "lambda_max {}", r.lambda_max);
    let pv = [
        5.830887827444874e-01,
        2.895299468218655e-01,
        8.489604773075643e-02,
        4.248522270289060e-02,
    ];
    for (g, w) in r.priorities.iter().zip(pv) {
        assert!(close(*g, w), "priority {g} vs LAPACK {w}");
    }
    assert!(close(r.consistency_index, 5.485890171634308e-02));
    assert!(close(r.consistency_ratio.unwrap(), 6.095433524038119e-02));
    assert!(r.acceptable, "CR 0.061 < 0.10 must be accepted");
}

#[test]
fn reject_3x3_matches_lapack_and_fails_the_gate() {
    let a = PairwiseMatrix::new(vec![
        vec![1.0, 9.0, 5.0],
        vec![1.0 / 9.0, 1.0, 3.0],
        vec![0.2, 1.0 / 3.0, 1.0],
    ])
    .unwrap();
    let r = a.analyse();
    assert!(close(r.lambda_max, 3.324402625153282), "lambda_max {}", r.lambda_max);
    assert!(close(r.consistency_ratio.unwrap(), 2.796574354769674e-01));
    assert!(!r.acceptable, "CR 0.28 > 0.10 must be rejected by the gate");
}
