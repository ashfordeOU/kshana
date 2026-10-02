// SPDX-License-Identifier: AGPL-3.0-only
//! Published-value (P1) comparison for the relativistic clock-rate to frame coupling,
//! `lunar_gauge::rate_frame_jacobian`, entry `d_alpha_d_scale = +U_moon / c^2`.
//!
//! ## Pre-registration (fixed 2026-09-30 in the validation plan, before this comparison)
//!
//! * Oracle (P1, a published worked value): Ashby and Patla 2024, The Astronomical Journal
//!   167:149, arXiv:2402.11150, Eq. (10) and Table I: L_m = -Phi0m / c^2 = 3.13881(15)e-11.
//!   The five printed numbers this test reads are in
//!   `tests/fixtures/lunar_rate_frame_coupling_oracle/reference.txt` (provenance in `NOTICE.md`).
//! * Kshana value: `rate_frame_jacobian(t).d_alpha_d_scale`, which is epoch-independent.
//! * Tolerance: relative difference at most **1e-4**.
//! * P1 precondition: Kshana must compute the value from the publication's inputs.
//!   `rate_frame_jacobian` takes no GM or radius argument; it uses Kshana's own
//!   `forces::MU_MOON` and `lunar_time::RE_MOON_M`, so the precondition is not met.
//!
//! ## First result (round 1, recorded, not tuned)
//!
//! Kshana gave 3.139807e-11 against the printed 3.13881(15)e-11: 3.18e-4 relative, three times
//! the tolerance. Cause: Kshana evaluated a point-mass potential GM/R at the 1737.4 km mean radius;
//! the paper evaluates the lunar potential on the equator (a_m = 1738.14 km) and adds the
//! rotation term. The function took no GM or radius, so the P1 precondition was not met either.
//!
//! ## Round 2 (2026-10-01): engine fix, re-run at the same 1e-4 tolerance
//!
//! `lunar_gauge::rate_frame_jacobian_with` now takes the lunar surface potential
//! (`LunarSurfacePotential`: GM, equatorial radius, J2, rotation rate) and forms
//! `L_m = [GM/a (1 + J2/2) + omega^2 a^2 / 2] / c^2`, the paper's Eq. (10) with the equatorial
//! potential truncated at degree 2. The test passes the paper's printed GM, a_m and omega_m; the
//! paper prints no J2, so Kshana's own GRAIL / Lunar Prospector J2 (2.0321e-4) is used. That is
//! the remaining difference from the paper's degree-350 evaluation and is disclosed in the
//! record. Disclosure: the expected outcome (about 1e-6 relative) was estimated by hand before
//! this re-run, from the same closed form; the tolerance was not changed.
//!
//! Result: see the record; the strict test below asserts the pre-registered 1e-4.
//!
//! ## Note (2026-10-02)
//!
//! The round-2 change above altered the comparison without a new pre-registration and used
//! Kshana's own J2. These two tests stay as regression checks of the shipped closed form; the
//! promotion basis is `tests/lunar_rate_frame_coupling_preregistered.rs` (J2 from the cited
//! AIUB-GRL350A/B fields, all three Jacobian entries).

use kshana::lunar_gauge::{rate_frame_jacobian, rate_frame_jacobian_with, LunarSurfacePotential};

const REF: &str = include_str!("fixtures/lunar_rate_frame_coupling_oracle/reference.txt");

/// The tolerance stated before the comparison (relative).
const TOL_REL: f64 = 1.0e-4;

fn value(key: &str) -> f64 {
    for line in REF.lines() {
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.split('|').map(str::trim).collect();
        if f[0] == key {
            return f[1]
                .parse()
                .unwrap_or_else(|e| panic!("{key}: bad value {}: {e}", f[1]));
        }
    }
    panic!("{key} not in reference.txt");
}

/// Kshana's J2 (`kshana::body::MOON_ZONALS_J2_J3[0]`): the paper prints none.
const KSHANA_J2: f64 = kshana::body::MOON_ZONALS_J2_J3[0];

#[test]
fn rate_frame_coupling_from_the_papers_inputs_matches_the_published_l_m_within_1e_4() {
    let l_m = value("L_m");
    let sigma = value("L_m_uncertainty");
    assert_eq!(l_m, 3.13881e-11, "the fixture is the printed value");
    let paper = LunarSurfacePotential {
        gm_m3_s2: value("GM_moon"),
        radius_m: value("a_m_equatorial_radius"),
        j2: KSHANA_J2,
        omega_rad_s: value("omega_m"),
    };

    // Epoch-independent: check two epochs give the same entry before comparing.
    let k0 = rate_frame_jacobian_with(0.0, &paper).d_alpha_d_scale;
    let k1 = rate_frame_jacobian_with(0.25, &paper).d_alpha_d_scale;
    assert_eq!(k0, k1, "d_alpha_d_scale must not depend on the epoch");

    let rot = 0.5 * (paper.omega_rad_s * paper.radius_m).powi(2);
    let rel = (k0 - l_m).abs() / l_m;
    eprintln!(
        "M093: kshana L_m from the paper's GM, a_m, omega_m and Kshana's J2 = {k0:.7e}; \
         Ashby-Patla L_m = {l_m:.5e} +/- {sigma:.1e}; relative gap {rel:.3e} (tolerance \
         {TOL_REL:.0e}); gap / paper sigma = {:.2}; rotation term {rot:.5} m^2/s^2 (printed {})",
        (k0 - l_m).abs() / sigma,
        value("rotation_term")
    );
    assert!(
        rel <= TOL_REL,
        "relative gap {rel:.3e} exceeds the pre-registered {TOL_REL:.0e}"
    );
}

/// With Kshana's own constants (MU_MOON, 1738.14 km, the Moon's rotation rate in body.rs) the
/// default coupling used by `rate_tie_row` is reported against the same printed value. Not the
/// P1 comparison (the inputs are Kshana's, not the paper's); it shows the shipped default.
#[test]
fn shipped_default_coupling_is_reported_against_the_published_l_m() {
    let l_m = value("L_m");
    let k = rate_frame_jacobian(0.0).d_alpha_d_scale;
    let rel = (k - l_m).abs() / l_m;
    eprintln!("M093 default: kshana {k:.7e} vs L_m {l_m:.5e}, relative {rel:.3e}");
    assert_eq!(k, LunarSurfacePotential::KSHANA.l_m());
    assert!(
        rel <= TOL_REL,
        "shipped default {rel:.3e} from the printed L_m"
    );
}
