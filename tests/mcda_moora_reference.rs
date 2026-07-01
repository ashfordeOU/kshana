// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for the MOORA ratio system.**
//!
//! The Kshana `mcda::moora` ratio-system scores are checked against the independent
//! third-party Python MCDA library **pymcdm** (`MOORA`) — the same vector (L2)
//! normalisation `n = x / √Σx²` and weighted benefit-minus-cost total. The reference
//! scores below are produced by the committed generator
//! `tests/fixtures/mcda_moora/generate_moora_reference.py` and reproduced here to well
//! inside < 1e-9 with no third-party code in the loop.
//!
//! Provenance — pymcdm methods.MOORA on the fixed matrix rows = alternatives,
//! cols = (price[cost], performance, range), weights = [0.40, 0.35, 0.25],
//! types = [cost, benefit, benefit]:
//!     y0 = 0.05505532749485931, y1 = 0.05157209540835475,
//!     y2 = 0.18039291875035230, y3 = 0.07561652706927985
//!     rank (1 = best): A0→3, A1→4, A2→1, A3→2 (order A2, A3, A0, A1).

use kshana::mcda::moora::moora;
use kshana::mcda::Objective;

/// pymcdm MOORA reference scores (see module header / fixture generator).
const PYMCDM_SCORES: [f64; 4] = [
    0.055_055_327_494_859_31,
    0.051_572_095_408_354_75,
    0.180_392_918_750_352_3,
    0.075_616_527_069_279_85,
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
fn moora_scores_match_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = moora(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    for (i, want) in PYMCDM_SCORES.iter().enumerate() {
        let got = r.scores[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana MOORA score {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn moora_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = moora(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→3, A1→4, A2→1, A3→2 ⇒ order A2, A3, A0, A1.
    assert_eq!(r.ranking, vec![2, 3, 0, 1]);
    assert_eq!(r.winner(), Some(2));
}
