// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the Weighted Sum Model.**
//!
//! The Kshana `mcda::wsm` aggregate + min–max normalisation is checked against the
//! independent third-party Python MCDA library **pymcdm** (`WSM` composed with
//! `minmax_normalization`). The reference scores below are produced by the committed
//! generator `tests/fixtures/mcda_wsm/generate_wsm_reference.py` and reproduced here
//! to < 1e-12 (well inside the < 1e-9 acceptance) with no third-party code.
//!
//! Provenance — pymcdm 1.x / numpy 2.x on the fixed decision matrix
//!   rows = alternatives, cols = (price[cost], performance, range),
//!   weights = [0.40, 0.35, 0.25], types = [cost, benefit, benefit]:
//!     score 0 = 0.325, score 1 = 0.400, score 2 = 0.600, score 3 = 0.3375
//!     rank (1 = best): A0→4, A1→2, A2→1, A3→3.

use kshana::mcda::wsm::{Alternative, Criterion, DecisionMatrix};

/// pymcdm reference scores (see module header / fixture generator).
const PYMCDM_SCORES: [f64; 4] = [0.325, 0.400, 0.600, 0.3375];

fn reference_matrix() -> DecisionMatrix {
    DecisionMatrix::new(
        vec![
            Criterion::cost("price", 0.40),
            Criterion::benefit("performance", 0.35),
            Criterion::benefit("range", 0.25),
        ],
        vec![
            Alternative::new("A0", vec![250.0, 16.0, 12.0]),
            Alternative::new("A1", vec![200.0, 16.0, 8.0]),
            Alternative::new("A2", vec![300.0, 32.0, 16.0]),
            Alternative::new("A3", vec![275.0, 24.0, 10.0]),
        ],
    )
    .expect("well-formed reference decision matrix")
}

#[test]
fn wsm_scores_match_pymcdm_to_1e9() {
    let report = reference_matrix().score().expect("scoring succeeds");
    for (i, want) in PYMCDM_SCORES.iter().enumerate() {
        let got = report.scores[i].score;
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana WSM score {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn wsm_ranking_matches_pymcdm() {
    let report = reference_matrix().score().expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→4, A1→2, A2→1, A3→3, i.e. order A2,A1,A3,A0.
    assert_eq!(report.ranking, vec![2, 1, 3, 0]);
    assert_eq!(report.winner(), Some(2));
}
