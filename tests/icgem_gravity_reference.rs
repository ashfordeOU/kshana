// SPDX-License-Identifier: AGPL-3.0-only
//! ICGEM gravity-functional synthesis — the "map reader" for gravity-aided / GNSS-free
//! navigation — validated against the **GRS80 normal-gravity standard**.
//!
//! A gravity-aided navigator matches a measured local gravity field against a stored
//! gravity map synthesised from a spherical-harmonic model (the ICGEM models:
//! EGM2008, EIGEN-6C4, GOCO…). This island validates the **synthesis engine** that
//! produces that map. The external oracle is the **Geodetic Reference System 1980**
//! (Moritz 1980, IAG-adopted) — an exact international standard whose normal gravity has
//! the closed-form **Somigliana** expression and exact published equator/pole values.
//!
//! Test 1 builds the GRS80 normal field from its published zonal harmonics `J₂…J₈`,
//! synthesises gravity (gravitation + centrifugal) on the ellipsoid via the Kshana
//! `gravity_magnitude` kernel, and shows it reproduces the Somigliana reference — and the
//! published γ_e / γ_p — across all latitudes.
//!
//! Test 2 loads the flagship **real ICGEM Earth model, EGM2008** (NGA, public domain, via
//! ICGEM; bundled to d/o 70, and loadable from any ICGEM `.gfc` via `from_gfc`) and checks
//! the synthesised **gravity-disturbance map** is finite and physically bounded.
//!
//! Honest scope: this validates the **map-reader / SH-synthesis code correctness** against an
//! exact external standard. Gravity-aided *navigation fix accuracy* stays MODELLED — no public
//! dataset provides a real gravimeter-on-a-moving-platform stream with ground-truth trajectory.

use kshana::gravity_sh::{
    grs80_normal_field, grs80_normal_gravity, grs80_surface_point, SphericalHarmonicField,
    GRS80_GAMMA_E, GRS80_GAMMA_P, GRS80_OMEGA,
};
use std::f64::consts::FRAC_PI_2;

#[test]
fn grs80_sh_synthesis_reproduces_somigliana_normal_gravity() {
    let field = grs80_normal_field();

    // Equator and pole anchored to the published GRS80 normal-gravity values.
    let g_eq = field.gravity_magnitude(grs80_surface_point(0.0, 0.0), GRS80_OMEGA);
    let g_pole = field.gravity_magnitude(grs80_surface_point(FRAC_PI_2, 0.0), GRS80_OMEGA);
    assert!(
        (g_eq - GRS80_GAMMA_E).abs() < 1e-7,
        "equator gravity {g_eq:.9} vs published γ_e {GRS80_GAMMA_E}"
    );
    assert!(
        (g_pole - GRS80_GAMMA_P).abs() < 1e-7,
        "pole gravity {g_pole:.9} vs published γ_p {GRS80_GAMMA_P}"
    );

    // Full Somigliana curve across latitudes; a non-zero longitude confirms axisymmetry.
    let mut worst = 0f64;
    let mut checked = 0;
    for deg in (0..=90).step_by(5) {
        let phi = (deg as f64).to_radians();
        let g = field.gravity_magnitude(grs80_surface_point(phi, 0.7), GRS80_OMEGA);
        let gamma = grs80_normal_gravity(phi);
        let rel = ((g - gamma) / gamma).abs();
        worst = worst.max(rel);
        assert!(
            rel < 1e-9,
            "lat {deg}°: synthesised {g:.9} vs Somigliana {gamma:.9} (rel {rel:.2e})"
        );
        checked += 1;
    }
    assert_eq!(checked, 19, "expected 19 latitudes");
    eprintln!(
        "[icgem] GRS80 synthesis vs Somigliana: worst rel = {worst:.2e} over {checked} latitudes"
    );
}

#[test]
fn real_icgem_egm2008_gravity_disturbance_map_is_physical() {
    // EGM2008 — the flagship real ICGEM Earth model. The same `from_gfc` reader loads any
    // ICGEM `.gfc` (already exercised on the GRAIL lunar field in tests/agency_lro.rs).
    let egm = SphericalHarmonicField::egm2008();
    assert_eq!(egm.nmax, 70, "bundled EGM2008 degree/order");

    let mut maxabs = 0f64;
    let mut sumsq = 0.0;
    let mut n = 0u32;
    for la in (-80..=80).step_by(10) {
        for lo in (0..360).step_by(20) {
            let dg = egm.gravity_disturbance_mgal(
                (la as f64).to_radians(),
                (lo as f64).to_radians(),
                GRS80_OMEGA,
            );
            assert!(dg.is_finite(), "δg not finite at lat {la}, lon {lo}");
            maxabs = maxabs.max(dg.abs());
            sumsq += dg * dg;
            n += 1;
        }
    }
    let rms = (sumsq / n as f64).sqrt();
    // Physical plausibility for a long-wavelength (d/o 70) gravity-disturbance field: the signal
    // is non-trivial (tens of mGal) but bounded — no point reaches the kGal scale.
    assert!(
        (1.0..1000.0).contains(&maxabs),
        "max |δg| {maxabs:.1} mGal out of physical range"
    );
    assert!(
        (1.0..300.0).contains(&rms),
        "δg RMS {rms:.1} mGal out of physical range"
    );
    eprintln!("[icgem] EGM2008 d/o70 gravity-disturbance map: RMS {rms:.1} mGal, max |δg| {maxabs:.1} mGal");
}
