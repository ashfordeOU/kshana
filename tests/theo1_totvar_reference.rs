// SPDX-License-Identifier: AGPL-3.0-only
//! Numeric-parity check of Kshana's **Theo1** and **TOTDEV (total deviation)**
//! estimators against an **independent third-party implementation**, allantools
//! (<https://github.com/aewallin/allantools>, version 2024.06) — the same kind of
//! cross-implementation validation DOP gets against gnss_lib_py and the ML metrics
//! against scikit-learn.
//!
//! The data set is the hermetic **NIST SP 1065 §12.4 1000-point frequency data
//! set** (W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST Special
//! Publication 1065, 2008, pp. 107-109), generated in code from the prime-modulus
//! (MINSTD) linear congruential generator SP 1065 Eq. (73) defines for exactly
//! this purpose — so the whole reference is reproducible offline, no fixture file
//! and no network, identical to the sibling `allan_nist_sp1065_1000point.rs`.
//!
//! allantools implements the *same uniquely-defined quantities*:
//!   * `allantools.theo1`  — NIST SP 1065 Eq. (30), p. 29 (0.75 normalisation;
//!     effective tau `0.75*m*tau0`);
//!   * `allantools.totdev` — NIST SP 1065 Eq. (25), p. 23 (reflected/mirrored
//!     phase extension at both ends).
//!
//! The reference deviations below were produced by the committed generator
//! `tests/fixtures/theo1_totvar/generate_theo1_totvar_reference.py` (allantools
//! 2024.06, numpy 2.5.0) and are hard-coded here with that provenance. Kshana's
//! `theo1` / `total_deviation` reproduce them to <1e-9 relative with no
//! third-party code in the build. This is the external oracle that backs the
//! "Extended-range Theo1/TOTDEV" VALIDATED row in `src/verification.rs`. The plain
//! `allan_nist_sp1065_1000point.rs` deliberately *excludes* the SP 1065 Theo1 /
//! Total columns because Kshana did not implement them; this file is what now
//! makes asserting against that quantity honest.

use kshana::allan::{theo1, total_deviation};

/// Build the SP 1065 §12.4 (Eq. 73) MINSTD generator's 1000-point frequency set.
fn nbs14_1000_freq() -> Vec<f64> {
    const MODULUS: i64 = 2_147_483_647; // 2^31 - 1, prime
    const MULTIPLIER: i64 = 16_807;
    let mut n: i64 = 1_234_567_890;
    let mut freq = Vec::with_capacity(1000);
    for _ in 0..1000 {
        freq.push(n as f64 / MODULUS as f64);
        n = (MULTIPLIER * n) % MODULUS;
    }
    freq
}

/// Frequency -> phase by the SP 1065 p. 108 convention: cumulative sum with a
/// prepended zero (averaging time 1), yielding `freq.len() + 1` phase points.
fn freq_to_phase(freq: &[f64], tau0: f64) -> Vec<f64> {
    let mut phase = Vec::with_capacity(freq.len() + 1);
    phase.push(0.0);
    let mut acc = 0.0;
    for &f in freq {
        acc += f * tau0;
        phase.push(acc);
    }
    phase
}

fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

/// Kshana runs the identical arithmetic as the allantools reference, so the
/// agreement is to machine precision; 1e-9 is a comfortable regression bound.
const TOL: f64 = 1e-9;

#[test]
fn theo1_matches_allantools_on_sp1065_1000point() {
    // Oracle: allantools 2024.06 `theo1` on the SP 1065 §12.4 LCG data set
    // (averaging factor m, effective tau 0.75*m*tau0, tau0 = 1).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    assert_eq!(phase.len(), 1001, "freq->phase must yield 1001 points");
    let cases = [
        (10usize, 1.0757398887e-01),
        (20, 7.2762344589e-02),
        (50, 4.4920438193e-02),
        (100, 3.1789312601e-02),
        (200, 2.4340566836e-02),
        (500, 1.2654987260e-02),
    ];
    for (m, want) in cases {
        let got = theo1(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "Theo1(m={m}) = {got}, allantools 2024.06 wants {want}"
        );
    }
}

#[test]
fn total_deviation_matches_allantools_on_sp1065_1000point() {
    // Oracle: allantools 2024.06 `totdev` on the SP 1065 §12.4 LCG data set
    // (averaging factor m up to N-1, tau0 = 1).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    let cases = [
        (1usize, 2.9223187811e-01),
        (2, 2.0088508814e-01),
        (10, 9.1347432617e-02),
        (100, 3.4065302522e-02),
        (500, 8.2026866439e-03),
        (998, 3.2834103243e-03),
    ];
    for (m, want) in cases {
        let got = total_deviation(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "TOTDEV(m={m}) = {got}, allantools 2024.06 wants {want}"
        );
    }
}

#[test]
fn totdev_equals_overlapping_adev_reference_at_m1() {
    // Consistency anchor: at m = 1 TOTDEV equals the overlapping Allan deviation,
    // and allantools reports the same 2.922319e-1 here that SP 1065 Table 31 prints
    // for the overlapping ADEV of this data set (checked in allan_nist_sp1065_*).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    let tot1 = total_deviation(&phase, 1.0, 1);
    assert!(
        rel_err(tot1, 2.9223187811e-01) < TOL,
        "TOTDEV(1) = {tot1}, allantools/SP1065 want 2.9223187811e-1"
    );
}
