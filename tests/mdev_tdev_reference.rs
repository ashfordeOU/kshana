// SPDX-License-Identifier: AGPL-3.0-only
//! Numeric-parity check of Kshana's **MDEV (modified Allan deviation)** and **TDEV
//! (time deviation)** estimators against an **independent third-party
//! implementation**, allantools (<https://github.com/aewallin/allantools>, version
//! 2024.06) — the same cross-implementation validation the sibling
//! `theo1_totvar_reference.rs` uses for Theo1 / TOTDEV.
//!
//! The data set is the hermetic **NIST SP 1065 §12.4 1000-point frequency data set**
//! (W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST Special Publication
//! 1065, 2008, pp. 107-109), generated in code from the prime-modulus (MINSTD) linear
//! congruential generator SP 1065 Eq. (73) defines — so the whole reference is
//! reproducible offline, no fixture file and no network.
//!
//! allantools implements the *same uniquely-defined quantities*:
//!   * `allantools.mdev` — the overlapping modified Allan deviation (NIST SP 1065
//!     Eq. (14)), matching Kshana's `allan::modified_adev`;
//!   * `allantools.tdev` — `TDEV(τ) = τ/√3 · MDEV(τ)` (NIST SP 1065 Eq. (21)),
//!     matching Kshana's `allan::time_deviation`.
//!
//! The reference deviations below were produced by the committed generator
//! `tests/fixtures/mdev_tdev/generate_mdev_tdev_reference.py` (allantools 2024.06,
//! numpy 2.5.0) and are hard-coded here with that provenance. Kshana reproduces them
//! to <1e-9 relative with no third-party code in the build. This is the external
//! oracle that backs the "MDEV / TDEV" VALIDATED row in `src/verification.rs`.
//! (The `phasedat_reference.rs` file also checks MDEV/TDEV, but against Stable32 to
//! 1e-3 and data-gated behind a fetch script; this hermetic allantools cross-check is
//! the tight, always-on parity test.)

use kshana::allan::{modified_adev, time_deviation};

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
fn mdev_matches_allantools_on_sp1065_1000point() {
    // Oracle: allantools 2024.06 `mdev` on the SP 1065 §12.4 LCG data set (tau0 = 1).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    assert_eq!(phase.len(), 1001, "freq->phase must yield 1001 points");
    let cases = [
        (1usize, 2.9223187811e-01),
        (2, 1.5820719830e-01),
        (5, 9.7166391742e-02),
        (10, 6.1723763825e-02),
        (20, 3.7813715044e-02),
        (50, 2.8742436869e-02),
        (100, 2.1709209137e-02),
        (200, 6.9915337084e-03),
    ];
    for (m, want) in cases {
        let got = modified_adev(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "MDEV(m={m}) = {got}, allantools 2024.06 wants {want}"
        );
    }
}

#[test]
fn tdev_matches_allantools_on_sp1065_1000point() {
    // Oracle: allantools 2024.06 `tdev` on the SP 1065 §12.4 LCG data set (tau0 = 1).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    let cases = [
        (1usize, 1.6872015349e-01),
        (2, 1.8268193705e-01),
        (5, 2.8049521214e-01),
        (10, 3.5636231659e-01),
        (20, 4.3663517119e-01),
        (50, 8.2972268318e-01),
        (100, 1.2533817739e+00),
        (200, 8.0731277372e-01),
    ];
    for (m, want) in cases {
        let got = time_deviation(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "TDEV(m={m}) = {got}, allantools 2024.06 wants {want}"
        );
    }
}

#[test]
fn tdev_is_tau_over_sqrt3_times_mdev_on_the_reference_series() {
    // The defining identity, checked on the real series (not just a toy case):
    // allantools computes tdev independently, and it must equal τ/√3 · mdev.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    for m in [1usize, 2, 5, 10, 20, 50, 100, 200] {
        let tau = m as f64;
        let expected = tau / 3.0_f64.sqrt() * modified_adev(&phase, 1.0, m);
        let got = time_deviation(&phase, 1.0, m);
        assert!(
            (got - expected).abs() < 1e-15,
            "TDEV(m={m}) = {got} must equal τ/√3·MDEV = {expected}"
        );
    }
}
