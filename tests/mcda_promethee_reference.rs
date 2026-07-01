// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for PROMETHEE II.**
//!
//! The Kshana `mcda::promethee` net outranking flow (usual criterion) is checked
//! against the independent third-party Python MCDA library **pymcdm**
//! (`PROMETHEE_II('usual')`) — the same weighted pairwise-preference net-flow
//! computation. The reference net flows below are produced by the committed generator
//! `tests/fixtures/mcda_promethee/generate_promethee_reference.py` and reproduced here
//! to < 1e-12 (well inside < 1e-9) with no third-party code in the loop.
//!
//! Provenance — pymcdm methods.PROMETHEE_II('usual') on the fixed matrix
//! rows = alternatives, cols = (price[cost], performance, range),
//! weights = [0.40, 0.35, 0.25], types = [cost, benefit, benefit]:
//!     φ0 = -0.016666666666666663, φ1 = -0.08333333333333326,
//!     φ2 =  0.19999999999999990, φ3 = -0.09999999999999992
//!     rank (1 = best): A0→2, A1→3, A2→1, A3→4 (order A2, A0, A1, A3).

use kshana::mcda::promethee::{promethee_ii, PreferenceFunction};
use kshana::mcda::Objective;

/// pymcdm PROMETHEE II reference net flows (see module header / fixture generator).
const PYMCDM_NETFLOW: [f64; 4] = [
    -0.016666666666666663,
    -0.08333333333333326,
    0.199_999_999_999_999_9,
    -0.09999999999999992,
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
fn promethee_netflow_matches_pymcdm_to_1e9() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let prefs = [PreferenceFunction::Usual; 3];
    let r = promethee_ii(&reference_matrix(), &weights, &types, &prefs).expect("scoring succeeds");
    for (i, want) in PYMCDM_NETFLOW.iter().enumerate() {
        let got = r.net_flow[i];
        assert!(
            (got - want).abs() < 1e-9,
            "alternative {i}: Kshana PROMETHEE φ {got} vs pymcdm {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}

#[test]
fn promethee_ranking_matches_pymcdm() {
    let weights = [0.40, 0.35, 0.25];
    let types = [Objective::Min, Objective::Max, Objective::Max];
    let prefs = [PreferenceFunction::Usual; 3];
    let r = promethee_ii(&reference_matrix(), &weights, &types, &prefs).expect("scoring succeeds");
    // pymcdm rank positions (1 = best): A0→2, A1→3, A2→1, A3→4 ⇒ order A2, A0, A1, A3.
    assert_eq!(r.ranking, vec![2, 0, 1, 3]);
    assert_eq!(r.winner(), Some(2));
}
