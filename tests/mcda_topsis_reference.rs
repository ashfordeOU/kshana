// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for TOPSIS.**
//!
//! The Kshana `mcda::topsis` closeness coefficients are checked against the
//! independent third-party Python MCDA library **pymcdm**
//! (`TOPSIS` composed with its default `minmax_normalization`) — exactly the
//! normalisation + ideal-solution aggregation Kshana implements. The reference
//! coefficients below are produced by the committed generator
//! `tests/fixtures/mcda_topsis/generate_topsis_reference.py` and reproduced here to
//! < 1e-12 (well inside the < 1e-9 acceptance) with no third-party code in the loop.
//!
//! Provenance — pymcdm methods.TOPSIS + normalizations.minmax_normalization on the
//! fixed matrix rows = alternatives, cols = (price[cost], performance, range),
//! weights = [0.40, 0.35, 0.25], types = [cost, benefit, benefit]:
//!     C0 = 0.3584894484013478, C1 = 0.4818602136341015,
//!     C2 = 0.5181397863658986, C3 = 0.3483883851747757
//!     rank (1 = best): A0→3, A1→2, A2→1, A3→4  (order A2, A1, A0, A3).

use kshana::mcda::topsis::topsis;
use kshana::mcda::Objective;

/// pymcdm TOPSIS reference closeness (see module header / fixture generator).
const PYMCDM_CLOSENESS: [f64; 4] = [
    0.3584894484013478,
    0.4818602136341015,
    0.5181397863658986,
    0.3483883851747757,
];

fn reference_matrix() -> Vec<Vec<f64>> {
    vec![
        vec![250.0, 16.0, 12.0],
        vec![200.0, 16.0, 8.0],
        vec![300.0, 32.0, 16.0],
        vec![275.0, 24.0, 10.0],
    ]
}

#[test]
fn topsis_closeness_matches_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = topsis(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    for (i, want) in PYMCDM_CLOSENESS.iter().enumerate() {
        let got = r.closeness[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana TOPSIS C {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn topsis_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = topsis(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→3, A1→2, A2→1, A3→4 ⇒ order A2, A1, A0, A3.
    assert_eq!(r.ranking, vec![2, 1, 0, 3]);
    assert_eq!(r.winner(), Some(2));
}
