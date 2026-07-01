// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for WASPAS.**
//!
//! The Kshana `mcda::waspas` blended preferences are checked against the independent
//! third-party Python MCDA library **pymcdm** (`WASPAS` with its default
//! `linear_normalization` and blend `l = 0.5`) — the same `0.5·Σ(n·w) + 0.5·Π(n^w)`
//! over max-normalised values. The reference scores below are produced by the
//! committed generator `tests/fixtures/mcda_waspas/generate_waspas_reference.py` and
//! reproduced here to well inside < 1e-9 with no third-party code in the loop.
//!
//! Provenance — pymcdm methods.WASPAS(linear_normalization, l=0.5) on the fixed
//! matrix rows = alternatives, cols = (price[cost], performance, range),
//! weights = [0.40, 0.35, 0.25], types = [cost, benefit, benefit]:
//!     P0 = 0.6751456925969028, P1 = 0.6798769776932235,
//!     P2 = 0.8584748335419303, P3 = 0.7087375387138637
//!     rank (1 = best): A0→4, A1→3, A2→1, A3→2 (order A2, A3, A1, A0).

use kshana::mcda::waspas::waspas;
use kshana::mcda::Objective;

/// pymcdm WASPAS reference preferences (see module header / fixture generator).
const PYMCDM_SCORES: [f64; 4] = [
    0.675_145_692_596_902_8,
    0.679_876_977_693_223_5,
    0.858_474_833_541_930_3,
    0.708_737_538_713_863_7,
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
fn waspas_scores_match_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = waspas(&reference_matrix(), &weights, &types, 0.5).expect("scoring succeeds");
    for (i, want) in PYMCDM_SCORES.iter().enumerate() {
        let got = r.scores[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana WASPAS score {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn waspas_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = waspas(&reference_matrix(), &weights, &types, 0.5).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→4, A1→3, A2→1, A3→2 ⇒ order A2, A3, A1, A0.
    assert_eq!(r.ranking, vec![2, 3, 1, 0]);
    assert_eq!(r.winner(), Some(2));
}
