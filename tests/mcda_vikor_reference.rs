// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for VIKOR.**
//!
//! The Kshana `mcda::vikor` compromise index `Q` is checked against the independent
//! third-party Python MCDA library **pymcdm** (`VIKOR(v=0.5)`) — the same range-
//! normalised S/R aggregation with consensus strategy weight `v = 0.5`. The reference
//! `Q` values below are produced by the committed generator
//! `tests/fixtures/mcda_vikor/generate_vikor_reference.py` and reproduced here to
//! < 1e-12 (well inside < 1e-9) with no third-party code in the loop.
//!
//! Provenance — pymcdm methods.VIKOR(v=0.5) on the fixed matrix rows = alternatives,
//! cols = (price[cost], performance, range), weights = [0.40, 0.35, 0.25],
//! types = [cost, benefit, benefit]:
//!     Q0 = 0.7499999999999998, Q1 = 0.6136363636363633,
//!     Q2 = 0.5000000000000000, Q3 = 0.4772727272727273
//!     rank (1 = best, lowest Q): A0→4, A1→3, A2→2, A3→1 (order A3, A2, A1, A0).

use kshana::mcda::vikor::vikor;
use kshana::mcda::Objective;

/// pymcdm VIKOR reference Q (see module header / fixture generator).
const PYMCDM_Q: [f64; 4] = [
    0.7499999999999998,
    0.6136363636363633,
    0.5,
    0.4772727272727273,
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
fn vikor_q_matches_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = vikor(&reference_matrix(), &weights, &types, 0.5).expect("scoring succeeds");
    for (i, want) in PYMCDM_Q.iter().enumerate() {
        let got = r.q[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana VIKOR Q {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn vikor_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = vikor(&reference_matrix(), &weights, &types, 0.5).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→4, A1→3, A2→2, A3→1 ⇒ order A3, A2, A1, A0.
    assert_eq!(r.ranking, vec![3, 2, 1, 0]);
    assert_eq!(r.winner(), Some(3));
}
