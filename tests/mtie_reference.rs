// SPDX-License-Identifier: AGPL-3.0-only
//! **External-oracle cross-check for MTIE (Maximum Time Interval Error).**
//!
//! Kshana's `allan::mtie` is checked against **allantools** (an independent
//! third-party frequency-stability library) `mtie`, on the hermetic **NIST SP 1065
//! §12.4 1000-point data set** (W. J. Riley): the MINSTD (Park–Miller) LCG generates
//! 1000 normalised frequencies, mean-removed and cumulatively summed into 1001 phase
//! points. MTIE at `tau = m·tau0` is the peak-to-peak time-error swing over a sliding
//! window of `m+1` consecutive phase samples, maximised over all window positions —
//! the ITU-T G.810/G.823/G.8261 wander metric.
//!
//! The phase series is rebuilt here in Rust with the same naive sequential float
//! arithmetic the generator uses (`tests/fixtures/mtie/generate_mtie_reference.py`),
//! so Kshana's `mtie` output is bit-identical to allantools' on the shared phase
//! array (MTIE just selects two phase samples). The committed constants below are
//! 15-significant-figure serialisations, so the assertion is `< 1e-9` (observed
//! ≤ 4e-15). No third-party code runs in this test.

use kshana::allan::mtie;

/// allantools MTIE reference values on the NIST LCG phase series (see module header).
/// Averaging factors m and MTIE(m) in the phase's own units (tau0 = 1).
const MTIE_REF: [(usize, f64); 9] = [
    (1, 5.039331146501622e-01),
    (2, 9.966861362488411e-01),
    (4, 1.746478854361213e+00),
    (8, 2.560421549111802e+00),
    (16, 4.027828642314221e+00),
    (32, 5.175346023216539e+00),
    (64, 6.949277421656195e+00),
    (128, 1.123276896864584e+01),
    (256, 1.258804496420642e+01),
];

/// Rebuild the hermetic NIST SP 1065 §12.4 1001-point phase series with naive
/// sequential arithmetic matching the fixture generator.
fn nbs14_1000_phase() -> Vec<f64> {
    let mut n: i64 = 1234567;
    let mut freq: Vec<f64> = Vec::with_capacity(1000);
    for _ in 0..1000 {
        n = (16807 * n) % 2147483647;
        freq.push(n as f64 / 2147483647.0);
    }
    let mean: f64 = freq.iter().sum::<f64>() / freq.len() as f64;
    for f in &mut freq {
        *f -= mean;
    }
    let mut phase: Vec<f64> = Vec::with_capacity(1001);
    phase.push(0.0);
    let mut acc = 0.0;
    for f in &freq {
        acc += *f;
        phase.push(acc);
    }
    phase
}

#[test]
fn mtie_matches_allantools_on_nist_sp1065() {
    let phase = nbs14_1000_phase();
    assert_eq!(phase.len(), 1001);
    for (m, want) in MTIE_REF {
        let got = mtie(&phase, m);
        assert!(
            (got - want).abs() < 1e-9,
            "MTIE(m={m}): Kshana {got} vs allantools {want} (|Δ| = {:.3e})",
            (got - want).abs()
        );
    }
}
