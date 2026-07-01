// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the Weighted Product Model.**
//!
//! The Kshana `mcda::wpm` weighted-product scores are checked against the independent
//! third-party Python MCDA library **pymcdm** (`WPM` composed with its default
//! `sum_normalization`) — the same reciprocal-for-cost sum normalisation and
//! weighted-product aggregation. The reference scores below are produced by the
//! committed generator `tests/fixtures/mcda_wpm/generate_wpm_reference.py` and
//! reproduced here to < 1e-12 (well inside < 1e-9) with no third-party code in the
//! loop.
//!
//! Provenance — pymcdm methods.WPM + normalizations.sum_normalization on the fixed
//! matrix rows = alternatives, cols = (price[cost], performance, range),
//! weights = [0.40, 0.35, 0.25], types = [cost, benefit, benefit]:
//!     S0 = 0.22619564477794370, S1 = 0.22347319034390630,
//!     S2 = 0.28800957273097190, S3 = 0.23975285845931340
//!     rank (1 = best): A0→3, A1→4, A2→1, A3→2 (order A2, A3, A0, A1).

use kshana::mcda::wpm::wpm;
use kshana::mcda::Objective;

/// pymcdm WPM reference scores (see module header / fixture generator).
const PYMCDM_SCORES: [f64; 4] = [
    0.226_195_644_777_943_7,
    0.223_473_190_343_906_3,
    0.288_009_572_730_971_9,
    0.239_752_858_459_313_4,
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
fn wpm_scores_match_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = wpm(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    for (i, want) in PYMCDM_SCORES.iter().enumerate() {
        let got = r.scores[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana WPM score {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn wpm_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = wpm(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→3, A1→4, A2→1, A3→2 ⇒ order A2, A3, A0, A1.
    assert_eq!(r.ranking, vec![2, 3, 0, 1]);
    assert_eq!(r.winner(), Some(2));
}
