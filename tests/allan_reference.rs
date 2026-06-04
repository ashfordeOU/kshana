// SPDX-License-Identifier: Apache-2.0
//! Numeric-parity check of the Allan-family estimators against a published
//! reference dataset and the deviations the reference tool (Stable32) computes
//! for it — not just against the estimators' own analytic self-consistency.
//!
//! The dataset is **NBS14**, the canonical 10-point frequency-stability
//! cross-check: a short phase series with hand-tabulated reference deviations,
//! published in W. J. Riley, *Handbook of Frequency Stability Analysis*
//! (NIST Special Publication 1065, 2008), around p. 107, and on the long-standing
//! UFFC / W. Riley reference pages. The reference deviations below were computed
//! with Stable32, the de-facto reference implementation; the same dataset and
//! values are the standard regression target used by independent tools (e.g.
//! allantools), to a 1e-4 relative tolerance.
//!
//! Matching them shows Kshana's overlapping ADEV, modified ADEV, time deviation,
//! and overlapping Hadamard deviation agree with the reference implementations to
//! that tolerance — the "Stable32/AllanTools numeric parity" the Allan milestones
//! call for. Only the public reference numbers are reproduced here; no third-party
//! code is used.

use kshana::allan::{hadamard_adev, modified_adev, overlapping_adev, time_deviation};

/// NBS14 10-point phase dataset (dimensionless phase samples, `tau0 = 1`).
const NBS14_PHASE: [f64; 10] = [
    0.00000, 103.11111, 123.22222, 157.33333, 166.44444, 48.55555, -96.33333, -2.22222, 111.88889,
    0.00000,
];

/// Relative error against a reference value.
fn rel_err(got: f64, want: f64) -> f64 {
    ((got - want) / want).abs()
}

/// The same relative tolerance the reference regression suites use for NBS14.
const TOL: f64 = 1e-4;

#[test]
fn overlapping_adev_matches_stable32_nbs14() {
    // Stable32 OADEV at tau = 1 and tau = 2 (averaging factors m = 1, 2).
    let a1 = overlapping_adev(&NBS14_PHASE, 1.0, 1);
    let a2 = overlapping_adev(&NBS14_PHASE, 1.0, 2);
    assert!(
        rel_err(a1, 91.22945) < TOL,
        "OADEV(1) = {a1}, want 91.22945"
    );
    assert!(
        rel_err(a2, 85.95287) < TOL,
        "OADEV(2) = {a2}, want 85.95287"
    );
}

#[test]
fn modified_adev_matches_stable32_nbs14() {
    let m1 = modified_adev(&NBS14_PHASE, 1.0, 1);
    let m2 = modified_adev(&NBS14_PHASE, 1.0, 2);
    assert!(rel_err(m1, 91.22945) < TOL, "MDEV(1) = {m1}, want 91.22945");
    assert!(rel_err(m2, 74.78849) < TOL, "MDEV(2) = {m2}, want 74.78849");
}

#[test]
fn time_deviation_matches_stable32_nbs14() {
    // TDEV = tau/sqrt(3) * MDEV.
    let t1 = time_deviation(&NBS14_PHASE, 1.0, 1);
    let t2 = time_deviation(&NBS14_PHASE, 1.0, 2);
    assert!(rel_err(t1, 52.67135) < TOL, "TDEV(1) = {t1}, want 52.67135");
    assert!(rel_err(t2, 86.35831) < TOL, "TDEV(2) = {t2}, want 86.35831");
}

#[test]
fn overlapping_hadamard_matches_stable32_nbs14() {
    // `hadamard_adev` is the OVERLAPPING Hadamard (OHDEV); it is compared to the
    // OHDEV reference, not the non-overlapping HDEV (which differs at tau = 2:
    // 116.798 vs the overlapping 85.61487).
    let h1 = hadamard_adev(&NBS14_PHASE, 1.0, 1);
    let h2 = hadamard_adev(&NBS14_PHASE, 1.0, 2);
    assert!(
        rel_err(h1, 70.80607) < TOL,
        "OHDEV(1) = {h1}, want 70.80607"
    );
    assert!(
        rel_err(h2, 85.61487) < TOL,
        "OHDEV(2) = {h2}, want 85.61487"
    );
}
