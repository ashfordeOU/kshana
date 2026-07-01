// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for COPRAS.**
//!
//! The Kshana `mcda::copras` utility degrees are checked against the independent
//! third-party Python MCDA library **pyDecision** (`copras_method`). pyDecision — not
//! pymcdm — is the oracle *by design*: pymcdm 1.4.0's `COPRAS` collapses algebraically
//! to the trivial `Q = S⁺ + S⁻` and is not a faithful COPRAS reference, whereas
//! pyDecision implements the canonical relative-significance formula
//! `Q = S⁺ + (min(S⁻)·ΣS⁻)/(S⁻·Σ(min(S⁻)/S⁻))` with utility `U = Q / max Q`. The
//! reference values below are produced by the committed generator
//! `tests/fixtures/mcda_copras/generate_copras_reference.py` and reproduced here to
//! well inside < 1e-9 with no third-party code in the loop.
//!
//! Provenance — pyDecision copras_method on the fixed matrix rows = alternatives,
//! cols = (price[min], performance[max], range[max]), weights = [0.40, 0.35, 0.25]:
//!     U0 = 0.7693233976732821, U1 = 0.7804355164578264,
//!     U2 = 1.0000000000000000, U3 = 0.8090937488978572
//!     order (1 = best): A2, A3, A1, A0.

use kshana::mcda::copras::copras;
use kshana::mcda::Objective;

/// pyDecision COPRAS reference utility degrees (see module header / fixture generator).
const PYDECISION_UTILITY: [f64; 4] = [
    0.769_323_397_673_282_1,
    0.780_435_516_457_826_4,
    1.000_000_000_000_000_0,
    0.809_093_748_897_857_2,
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
fn copras_utility_matches_pydecision_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = copras(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    for (i, want) in PYDECISION_UTILITY.iter().enumerate() {
        let got = r.utility[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana COPRAS utility {got} vs pyDecision {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn copras_ranking_matches_pydecision() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let r = copras(&reference_matrix(), &weights, &types).expect("scoring succeeds");
    // pyDecision utility order (1 = best): A2 (1.0), A3, A1, A0.
    assert_eq!(r.ranking, vec![2, 3, 1, 0]);
    assert_eq!(r.winner(), Some(2));
}
