// SPDX-License-Identifier: AGPL-3.0-only
//! Numeric-parity check of the Allan-family estimators against the **1000-point
//! frequency data set** of W. J. Riley, *Handbook of Frequency Stability
//! Analysis* (NIST Special Publication 1065, 2008), §12.4, pp. 107-109 — read
//! directly from the official NIST PDF
//! (<https://nvlpubs.nist.gov/nistpubs/Legacy/SP/nistspecialpublication1065.pdf>;
//! mirror <https://tf.nist.gov/general/pdf/2220.pdf>).
//!
//! Unlike the 10-point NBS14 cross-check in `allan_reference.rs`, this data set
//! is **generated in code** from the prime-modulus (MINSTD) linear congruential
//! generator that SP 1065 §12.4 (Eq. 73) defines for exactly this purpose, so
//! the test is hermetic and offline — no fixture file, no network. The point of
//! the SP 1065 portable test suite is that any implementation can regenerate the
//! identical data set and reproduce the printed deviations.
//!
//! Every assertion below is anchored to a value **printed in SP 1065**, cited by
//! table and page:
//!   * the generator's own verification sequence (p. 108) guards the data set;
//!   * Table 31 (p. 108) gives the overlapping ADEV, modified ADEV, time
//!     deviation, and overlapping Hadamard deviation at averaging factors
//!     1 / 10 / 100;
//!   * Table 32 (p. 109) gives the effective degrees of freedom and the 95 %
//!     confidence-interval bounds for the overlapping ADEV at averaging factor
//!     10, which validate the EDF (SP 1065 Table 5) port and the χ² band.
//!
//! Only the estimators Kshana actually implements are checked, and only against
//! the matching SP 1065 columns: overlapping ADEV, modified ADEV, time
//! deviation, and **overlapping** Hadamard deviation. The non-overlapping
//! ("Normal Allan Dev" / "Hadamard Deviation"), total-deviation, and Theo1
//! columns are deliberately excluded — Kshana implements none of them, so
//! asserting against those columns would be a false oracle.
//!
//! Independent cross-check (cited, not vendored): the same generated data and the
//! same Table-31 numbers are the regression target in aewallin/allantools,
//! `tests/nbs14/test_nbs14_1000point.py` (`data_type="freq"`, `rate=1.0`,
//! `frequency2phase` = cumulative sum with a prepended zero); AllanTools matches
//! Stable32 and SP 1065 to 1e-4. Kshana matches the same SP 1065 primary-source
//! numbers to the same tolerance with no third-party code.

use kshana::allan::{
    deviation_ci, edf_overlapping_adev, hadamard_adev, modified_adev, overlapping_adev,
    time_deviation, PowerLawNoise,
};

/// Build the 1000-point frequency data set from the SP 1065 §12.4 (Eq. 73)
/// prime-modulus linear congruential generator (Lehmer / MINSTD):
///
/// ```text
///   n[0]   = 1234567890
///   n[i+1] = (16807 * n[i]) mod 2147483647        (2147483647 = 2^31 - 1, prime)
///   freq[i] = n[i] / 2147483647.0
/// ```
///
/// `16807 * n` reaches ≈ 3.6e13, so the state and product MUST be 64-bit; a
/// 32-bit accumulator would overflow. The returned vector is `freq[0..1000]`.
fn nbs14_1000_freq() -> Vec<f64> {
    const MODULUS: i64 = 2_147_483_647; // 2^31 - 1, prime (Mersenne)
    const MULTIPLIER: i64 = 16_807;
    let mut n: i64 = 1_234_567_890;
    let mut freq = Vec::with_capacity(1000);
    for _ in 0..1000 {
        freq.push(n as f64 / MODULUS as f64);
        n = (MULTIPLIER * n) % MODULUS;
    }
    freq
}

/// Convert a frequency series to phase by the SP 1065 p. 108 convention:
/// "converted to phase data by assuming an averaging time of 1, yielding a set
/// of 1001 phase data points." `phase[0] = 0`, `phase[k] = phase[k-1] +
/// freq[k-1] * tau0` — i.e. a cumulative sum with a prepended zero, length
/// `freq.len() + 1`. This matches AllanTools' `frequency2phase`. No mean removal:
/// the second/third phase differences the estimators take annihilate the
/// constant ≈0.5 frequency offset, so plain cumulative summation reproduces the
/// NIST numbers exactly (Kshana's own `adev_ignores_constant_offset_and_
/// frequency_offset` unit test proves this invariance).
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

/// Relative error against a reference value.
fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

/// The relative tolerance the NIST / Stable32 / AllanTools regression suites use
/// for this data set. Kshana reproduces the SP 1065 numbers to ~6-7 significant
/// figures, far inside it.
const TOL: f64 = 1e-4;

#[test]
fn nbs14_1000_lcg_matches_sp1065_verification_values() {
    // Guard the generator before any deviation is computed: SP 1065 p. 108 prints
    // the first elements of the recurrence and the first normalized frequency.
    // Oracle: NIST SP 1065 §12.4, p. 108 (verification sequence for Eq. 73).
    const MODULUS: i64 = 2_147_483_647;
    const MULTIPLIER: i64 = 16_807;
    let n0: i64 = 1_234_567_890;
    let n1 = (MULTIPLIER * n0) % MODULUS;
    let n2 = (MULTIPLIER * n1) % MODULUS;
    let n3 = (MULTIPLIER * n2) % MODULUS;
    assert_eq!(n1, 395_529_916, "SP 1065 p.108: n[1]");
    assert_eq!(n2, 1_209_410_747, "SP 1065 p.108: n[2]");
    assert_eq!(n3, 633_705_974, "SP 1065 p.108: n[3]");

    let freq = nbs14_1000_freq();
    assert_eq!(freq.len(), 1000);
    assert!(
        (freq[0] - 0.574_890_473_2).abs() < 1e-9,
        "SP 1065 p.108: freq[0] = {} want 0.5748904732",
        freq[0]
    );
}

#[test]
fn overlapping_adev_matches_sp1065_table31() {
    // Oracle: NIST SP 1065 Table 31, "Overlap Allan Dev" row, p. 108
    // (averaging factors 1 / 10 / 100, tau0 = 1).
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    assert_eq!(phase.len(), 1001, "freq->phase must yield 1001 points");
    for (m, want) in [(1usize, 2.922319e-1), (10, 9.159953e-2), (100, 3.241343e-2)] {
        let got = overlapping_adev(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "OADEV(m={m}) = {got}, SP 1065 Table 31 wants {want}"
        );
    }
}

#[test]
fn modified_adev_matches_sp1065_table31() {
    // Oracle: NIST SP 1065 Table 31, "Mod Allan Dev" row, p. 108.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    for (m, want) in [(1usize, 2.922319e-1), (10, 6.172376e-2), (100, 2.170921e-2)] {
        let got = modified_adev(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "MDEV(m={m}) = {got}, SP 1065 Table 31 wants {want}"
        );
    }
}

#[test]
fn time_deviation_matches_sp1065_table31() {
    // Oracle: NIST SP 1065 Table 31, "Time Deviation" row, p. 108.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    for (m, want) in [(1usize, 1.687202e-1), (10, 3.563623e-1), (100, 1.253382e0)] {
        let got = time_deviation(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "TDEV(m={m}) = {got}, SP 1065 Table 31 wants {want}"
        );
    }
}

#[test]
fn overlapping_hadamard_matches_sp1065_table31() {
    // `hadamard_adev` is the OVERLAPPING Hadamard (OHDEV). It is checked against
    // the SP 1065 Table 31 "Overlap Had Dev" column, NOT the non-overlapping
    // "Hadamard Deviation" column (a different binning convention Kshana does not
    // implement).
    // Oracle: NIST SP 1065 Table 31, "Overlap Had Dev" row, p. 108.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    for (m, want) in [(1usize, 2.943883e-1), (10, 9.581083e-2), (100, 3.237638e-2)] {
        let got = hadamard_adev(&phase, 1.0, m);
        assert!(
            rel_err(got, want) < TOL,
            "OHDEV(m={m}) = {got}, SP 1065 Table 31 wants {want}"
        );
    }
}

#[test]
fn mdev_equals_adev_at_m1() {
    // SP 1065 consistency rule: the normal/overlapping and modified Allan
    // variances are identical at averaging factor 1 (the modified inner average
    // is a single term). Both must also equal the Table-31 value.
    // Oracle: NIST SP 1065 §12.1 consistency check + Table 31 (m=1) = 2.922319e-1.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    let oadev = overlapping_adev(&phase, 1.0, 1);
    let mdev = modified_adev(&phase, 1.0, 1);
    assert!(
        (mdev - oadev).abs() < 1e-12,
        "MDEV(1) {mdev} must equal OADEV(1) {oadev}"
    );
    assert!(
        rel_err(oadev, 2.922319e-1) < TOL,
        "OADEV(1) = {oadev}, SP 1065 Table 31 wants 2.922319e-1"
    );
}

#[test]
fn edf_white_fm_matches_sp1065_table32() {
    // Headline non-circular EDF validation: SP 1065 Table 32 (p. 109) prints the
    // chi-squared effective degrees of freedom for the overlapping ADEV of this
    // 1000-point data set at averaging factor 10 (white FM) as 146.177. Kshana's
    // Table-5 EDF port must reproduce that printed value (N = 1001 phase points,
    // m = 10).
    // Oracle: NIST SP 1065 Table 32, "# chi2 df = 146.177", p. 109.
    let edf = edf_overlapping_adev(PowerLawNoise::WhiteFm, 1001, 10);
    assert!(
        (edf - 146.177).abs() < 5e-3,
        "EDF(WhiteFM, N=1001, m=10) = {edf}, SP 1065 Table 32 wants 146.177"
    );
}

#[test]
fn confidence_interval_matches_sp1065_table32() {
    // SP 1065 Table 32 (p. 109) prints the 95% confidence-interval bounds for the
    // overlapping ADEV at averaging factor 10: Min sy(tau) = 8.223942e-2, Max
    // sy(tau) = 1.035201e-1 (chi-squared p = 0.025 / 0.975 at df = 146.177).
    // Tolerance is 2e-3 (not 1e-4) to absorb the Wilson-Hilferty chi-squared
    // approximation Kshana uses versus NIST's exact chi-squared inverse; even so
    // the agreement is < 0.2%.
    // Oracle: NIST SP 1065 Table 32, Min/Max sy(tau), p. 109.
    let phase = freq_to_phase(&nbs14_1000_freq(), 1.0);
    let dev = overlapping_adev(&phase, 1.0, 10);
    let ci = deviation_ci(dev, 146.177, 0.95);
    assert!(
        rel_err(ci.lo, 8.223942e-2) < 2e-3,
        "CI lower = {}, SP 1065 Table 32 wants 8.223942e-2",
        ci.lo
    );
    assert!(
        rel_err(ci.hi, 1.035201e-1) < 2e-3,
        "CI upper = {}, SP 1065 Table 32 wants 1.035201e-1",
        ci.hi
    );
}
