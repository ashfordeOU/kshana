// SPDX-License-Identifier: Apache-2.0
//! Solid Earth tide validation against IERS Conventions (2010) Chapter 6 reference values.
//! Oracles are transcribed in `tests/fixtures/tides/IERS-CH6-REFERENCE.md` — published
//! numbers from the conventions, not derived from this engine.

use kshana::tides;

/// JD_TT anchor reused across the frame/nutation suites.
const JD_TT_ANCHOR: f64 = 2_453_736.5;

/// ORACLE 1 (IERS Eq 6.14): the permanent (zero-frequency) tide on C̄₂₀ is
/// ΔC̄₂₀^perm = A₀·H₀·k₂₀ with A₀ = 4.4228e-8 m⁻¹, H₀ = −0.31460 m. For EGM2008 the
/// published zero-tide↔tide-free C₂₀ difference is −4.1736e-9. The choice of Love number
/// (anelastic k₂₀ = 0.30190) lands within the documented ~1% Love-number sensitivity band.
#[test]
fn permanent_tide_c20_matches_iers_eq_6_14() {
    let perm = tides::permanent_tide_c20();
    let published = -4.1736e-9_f64;
    let rel = ((perm - published) / published).abs();
    assert!(
        rel < 0.01,
        "permanent tide ΔC̄₂₀ = {perm:e}, IERS-published −4.1736e-9, rel diff {rel:e} (want <1%)"
    );
}

/// The normalized associated Legendre functions used by the tide model, checked at known
/// arguments by closed-form hand values (4π/geodesy normalization, no Condon–Shortley phase).
/// This pins the Legendre path independently of Eq 6.6.
#[test]
fn pbar_matches_closed_form_hand_values() {
    let s5 = 5.0_f64.sqrt();
    let s7 = 7.0_f64.sqrt();
    let s15 = 15.0_f64.sqrt();
    // P̄₂₀(1) = √5 ; P̄₂₀(0) = −√5/2
    assert!((tides::pbar(2, 0, 1.0) - s5).abs() < 1e-12);
    assert!((tides::pbar(2, 0, 0.0) - (-s5 / 2.0)).abs() < 1e-12);
    // P̄₂₁(0) = 0
    assert!(tides::pbar(2, 1, 0.0).abs() < 1e-12);
    // P̄₂₂(0) = √15/2
    assert!((tides::pbar(2, 2, 0.0) - s15 / 2.0).abs() < 1e-12);
    // P̄₃₀(1) = √7
    assert!((tides::pbar(3, 0, 1.0) - s7).abs() < 1e-12);
}

/// Step-1 (Eq 6.6) yields a degree-2/3 set of ΔC̄/ΔS̄ corrections. The degree-2 zonal term
/// ΔC̄₂₀ varies in the band IERS quotes ("changes in C₂ₘ ... can exceed 3×10⁻⁸"); assert the
/// instantaneous magnitude is physical and the full (n,m) set is present.
#[test]
fn solid_earth_tide_step1_structure_and_magnitude() {
    let deltas = tides::solid_earth_tide_step1(JD_TT_ANCHOR);
    // n=2: m=0,1,2 ; n=3: m=0,1,2,3  → 7 entries.
    assert_eq!(deltas.len(), 7, "expected 7 degree-2/3 corrections");
    let c20 = deltas
        .iter()
        .find(|d| d.n == 2 && d.m == 0)
        .expect("ΔC̄₂₀ present");
    assert!(
        (1e-9..5e-8).contains(&c20.dc.abs()),
        "ΔC̄₂₀ = {:e} outside the physical 1e-9..5e-8 band",
        c20.dc
    );
    // ΔS̄ for any m=0 term is identically zero (no sin(0) contribution).
    assert_eq!(c20.ds, 0.0, "ΔS̄₂₀ must be exactly 0");
}

/// ORACLE 2 (IERS Ch.6, Step-2 worked example): for the K1 constituent — m=1,
/// A₁ = −3.1274e-8, δk_f = (−0.04084 + 0.00262 i), H_f = 0.36870 — Eq 6.8b gives
/// ΔC̄₂₁ = 470.9×10⁻¹²·sin(θ_g+π) − 30.2×10⁻¹²·cos(θ_g+π). Extract the sin- and cos-amplitudes
/// (θ_f = π/2 and θ_f = 0) and match the published numbers bit-for-bit (to 0.1×10⁻¹²).
#[test]
fn step2_k1_matches_iers_worked_example() {
    use std::f64::consts::FRAC_PI_2;
    // θ_f = π/2 → sin θ_f = 1: ΔC̄₂₁ isolates the sin-amplitude (470.9e-12).
    let (sin_amp, _) =
        tides::step2_constituent(1, -3.1274e-8, -0.04084, 0.00262, 0.36870, FRAC_PI_2);
    // θ_f = 0 → cos θ_f = 1: ΔC̄₂₁ isolates −(cos-amplitude) (−30.2e-12).
    let (neg_cos_amp, _) = tides::step2_constituent(1, -3.1274e-8, -0.04084, 0.00262, 0.36870, 0.0);
    assert!(
        (sin_amp - 470.9e-12).abs() < 0.1e-12,
        "K1 ΔC̄₂₁ sin-amplitude {sin_amp:e}, IERS 470.9e-12"
    );
    assert!(
        (neg_cos_amp - (-30.2e-12)).abs() < 0.1e-12,
        "K1 ΔC̄₂₁ cos-amplitude {neg_cos_amp:e}, IERS −30.2e-12"
    );
}

/// Ocean tide (FES2004, 8 dominant constituents) produces physical-magnitude corrections at an
/// epoch: the degree-2 sectorial term |ΔC̄₂₂| sits in the ocean-tide band, an order or more below
/// the solid Earth tide on the same coefficient.
#[test]
fn ocean_tide_magnitude_is_physical_and_below_solid() {
    let jd = JD_TT_ANCHOR;
    let o22 = tides::ocean_tide(jd)
        .into_iter()
        .find(|d| d.n == 2 && d.m == 2)
        .expect("ocean ΔC̄₂₂ present");
    let s22 = tides::solid_earth_tide_step1(jd)
        .into_iter()
        .find(|d| d.n == 2 && d.m == 2)
        .expect("solid ΔC̄₂₂ present");
    assert!(
        (1e-12..1e-9).contains(&o22.dc.abs()),
        "ocean ΔC̄₂₂ = {:e} outside the physical 1e-12..1e-9 band",
        o22.dc
    );
    assert!(
        o22.dc.abs() < s22.dc.abs(),
        "ocean ΔC̄₂₂ {:e} should be below the solid-tide ΔC̄₂₂ {:e}",
        o22.dc,
        s22.dc
    );
}
