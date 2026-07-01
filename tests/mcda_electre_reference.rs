// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for ELECTRE I.**
//!
//! The Kshana `mcda::electre` concordance, discordance and dominance matrices and the
//! choice kernel are checked against the independent third-party Python library
//! **pyDecision** (`algorithm.electre_i`) — the same all-benefit, sum-normalised-
//! weight concordance/discordance/dominance/kernel convention (single global
//! discordance scale). The reference matrices below are produced by the committed
//! generator `tests/fixtures/mcda_electre/generate_electre_reference.py` and
//! reproduced here element-for-element to < 1e-12 (well inside < 1e-9) with no
//! third-party code in the loop.
//!
//! Provenance — pyDecision electre_i(c_hat=0.65, d_hat=0.40) on the fixed all-benefit
//! dataset rows = alternatives, cols = criteria = [[0.80,0.60,0.90],[0.70,0.90,0.50],
//! [0.50,0.80,0.70],[0.90,0.40,0.60]], weights = [0.40, 0.35, 0.25]. Kernel = {a1, a2,
//! a4} (indices 0,1,3); a3 (index 2) is outranked out of contention.

use kshana::mcda::electre::electre_i;

fn reference_dataset() -> Vec<Vec<f64>> {
    vec![
        vec![0.80, 0.60, 0.90],
        vec![0.70, 0.90, 0.50],
        vec![0.50, 0.80, 0.70],
        vec![0.90, 0.40, 0.60],
    ]
}

/// pyDecision concordance matrix.
const C: [[f64; 4]; 4] = [
    [1.00, 0.65, 0.65, 0.60],
    [0.35, 1.00, 0.75, 0.35],
    [0.35, 0.25, 1.00, 0.60],
    [0.40, 0.65, 0.40, 1.00],
];

/// pyDecision discordance matrix.
const D: [[f64; 4]; 4] = [
    [0.0, 0.6, 0.4, 0.2],
    [0.8, 0.0, 0.4, 0.4],
    [0.6, 0.4, 0.0, 0.8],
    [0.6, 1.0, 0.8, 0.0],
];

#[test]
fn electre_concordance_matches_pydecision_to_1e9() {
    let w = [0.40, 0.35, 0.25];
    let r = electre_i(&reference_dataset(), &w, 0.65, 0.40).expect("scoring succeeds");
    for (a, (got_row, want_row)) in r.concordance.iter().zip(C.iter()).enumerate() {
        for (b, (got, want)) in got_row.iter().zip(want_row.iter()).enumerate() {
            assert!(
                (got - want).abs() < 1e-9,
                "C[{a}][{b}] Kshana {got} vs pyDecision {want} (|Δ|={:.3e})",
                (got - want).abs()
            );
        }
    }
}

#[test]
fn electre_discordance_matches_pydecision_to_1e9() {
    let w = [0.40, 0.35, 0.25];
    let r = electre_i(&reference_dataset(), &w, 0.65, 0.40).expect("scoring succeeds");
    for (a, (got_row, want_row)) in r.discordance.iter().zip(D.iter()).enumerate() {
        for (b, (got, want)) in got_row.iter().zip(want_row.iter()).enumerate() {
            assert!(
                (got - want).abs() < 1e-9,
                "D[{a}][{b}] Kshana {got} vs pyDecision {want} (|Δ|={:.3e})",
                (got - want).abs()
            );
        }
    }
}

#[test]
fn electre_dominance_and_kernel_match_pydecision() {
    let w = [0.40, 0.35, 0.25];
    let r = electre_i(&reference_dataset(), &w, 0.65, 0.40).expect("scoring succeeds");
    // pyDecision dominance: only a2 (idx 1) outranks a3 (idx 2).
    for a in 0..4 {
        for b in 0..4 {
            let want = a == 1 && b == 2;
            assert_eq!(r.dominance[a][b], want, "dominance[{a}][{b}]");
        }
    }
    // Kernel = {a1, a2, a4}; a3 outranked out.
    assert_eq!(r.kernel, vec![0, 1, 3]);
    assert_eq!(r.dominated, vec![2]);
}
