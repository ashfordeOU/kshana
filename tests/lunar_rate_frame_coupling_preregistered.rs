// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered comparison (round 2, second pre-registration) of all three entries of the
//! lunar rate-frame coupling `lunar_gauge::rate_frame_jacobian_with`, with every input traced to
//! a publication or an independent oracle.
//!
//! # Pre-registration (written 2026-10-02, before the gravity-field files, the pyshtools
//! values or the Horizons velocities were fetched or computed)
//!
//! **Why a new pre-registration.** Round 2 (commit 3d1442c9) changed the comparison of
//! `tests/lunar_rate_frame_coupling_oracle.rs` (a new function, new inputs and a new closed form)
//! without a new pre-registration, and it used Kshana's own J2 (`body::MOON_ZONALS_J2_J3`), which
//! is not the publication's input. This file replaces it as the promotion basis.
//!
//! **Disclosure (outcome already known for entry 1).** Kshana's d_alpha/d_scale against the
//! published L_m has been seen three times: round 1, point mass at 1737.4 km, 3.18e-4 relative;
//! round 2 with the paper's GM, a_m, omega_m and Kshana's J2, 2.79e-6; the same without J2,
//! 1.044e-4. A J2 from the cited field will differ from Kshana's by about 1e-6 of itself times
//! a few, so the entry-1 outcome is predictable (about 3e-6). Entries 2 and 3 have not been
//! compared with any external value before. The tolerance of entry 1 stays 1e-4.
//!
//! **Basis.** Reference (a published value of the quantity), not P1: the paper evaluates a
//! degree-350 potential, Kshana the degree-2 closed form (the residual is the degree 3 to 350
//! part of the field); whether that counts as the "same closed form" is left to the integrator,
//! and the comparison is declared as Reference.
//!
//! ## Inputs common to entries 1 and 2
//!
//! * Ashby and Patla 2024, AJ 167:149, arXiv:2402.11150 (copy SHA-256
//!   4a0bc4dec56d185add3ba112c1b2dc8e1cd87f18e1ab43e745595804cd47984b), as already transcribed in
//!   `tests/fixtures/lunar_rate_frame_coupling_oracle/reference.txt`: GM = 4.90280031e12 m^3/s^2,
//!   a_m = 1738140 m, omega_m = 2.661621e-6 /s, L_m = 3.13881(15)e-11.
//! * J2 from the field the paper cites for Phi_m, its reference [8], Bertone et al. 2021, Earth
//!   and Space Science, doi:10.1029/2020EA001454: the two degree-350 solutions of that paper on
//!   the International Centre for Global Earth Models (ICGEM), AIUB-GRL350A and AIUB-GRL350B
//!   (<https://icgem.gfz-potsdam.de/tom_celestial>; files
//!   `/getmodel/gfc/0431c2d2.../AIUB-GRL350A.gfc` and `/getmodel/gfc/f17df1b5.../AIUB-GRL350B.gfc`).
//!   The paper does not say which of the two it used, so both are run and **both** must pass.
//!   From each header and its degree-2 order-0 line: reference radius R, and
//!   J2 = -sqrt(5) C20bar (fully normalised). Kshana's closed form takes J2 referred to the
//!   evaluation radius, so the test passes J2_a = J2 (R / a_m)^2.
//! * Kshana: `LunarSurfacePotential { gm_m3_s2: GM, radius_m: a_m, j2: J2_a, omega_rad_s:
//!   omega_m }`, `rate_frame_jacobian_with(t, &that)`.
//!
//! ## Entry 1: d_alpha/d_scale against the published L_m
//!
//! Relative difference at most **1e-4** (unchanged from the round-1 plan), for each field.
//!
//! ## Entry 2: d_alpha/d_r_radial against the degree-350 field
//!
//! Oracle: pyshtools 4.14.1 (BSD-3-Clause), `SHGravCoeffs.from_file(<gfc>, format='icgem')`,
//! `expand(a=a_m, f=0, lmax=350)`: the radial gravity component on the sphere of radius a_m,
//! averaged over the longitudes of the equator row of the Driscoll-Healy grid; g_oracle = the
//! magnitude of that mean minus omega_m^2 a_m (the centrifugal term on the equator, the same
//! effective potential as Eq. (10)). Quantity: Kshana's `d_alpha_d_radial` against g_oracle / c^2
//! (c = 299 792 458 m/s). Tolerance: relative difference at most **1e-4** for each field, the
//! bar of entry 1 (same closed form, same truncation). The longitude-mean equatorial potential
//! from the same expansion is printed beside the paper's Phi_m, not gating.
//!
//! ## Entry 3: d_alpha/d_velocity against the DE441 lunar speed
//!
//! Oracle: JPL Horizons API 1.2, DE441 (US Government work): the geometric geocentric velocity of
//! the Moon, `COMMAND='301'`, `CENTER='500@399'`, `EPHEM_TYPE=VECTORS`, `VEC_TABLE=2`,
//! `VEC_CORR=NONE`, `REF_PLANE=FRAME`, `REF_SYSTEM=ICRF`, `OUT_UNITS=KM-S`, TDB, at JD 2451545.25 +
//! 7.31 k, k = 0 to 1999 (2000 to 2040, fresh). Quantity: Kshana's `d_alpha_d_velocity` at
//! t = (JD - 2451545)/36525 (TDB taken as TT, within 2 ms) against -|v_oracle| / c^2. Tolerance:
//! the relative difference at every epoch at most **4.5e-3**, half a unit in the last printed
//! digit of the claimed "about -1.11e-14" (three significant figures). The RMS and the maximum
//! are printed.
//!
//! ## Not compared
//!
//! The row's "about 2e-17" rate perturbation is the radial entry times a 1 m datum shift; it is
//! an arithmetic consequence of entry 2 and is not compared separately.
//!
//! **Outcome rule.** All three entries within their bars for both fields: the row is supported
//! on this test. Any miss: the strict test stays ignored with the measured gap and a gated test
//! pins the finding.
//!
//! Fixture: `tests/fixtures/lunar_rate_frame_coupling_preregistered/` (generator, NOTICE,
//! extracted field numbers, pyshtools output, Horizons velocities), produced only after this
//! header was committed.
//!
//! # Result (run 2026-10-02, after the pre-registration commit 5590ab21)
//!
//! * Entry 1: J2 referred to a_m 2.031887e-4 (A) and 2.031891e-4 (B); Kshana 3.1388012e-11
//!   against 3.13881e-11, relative 2.80e-6 for both fields (0.028 of the bar).
//! * Entry 2: Kshana 1.8061855e-17 /m against 1.8063350e-17 (A, g_eff 1.6234529 m/s^2) and
//!   1.8063058e-17 (B), relative 8.28e-5 and 6.66e-5 (bar 1e-4; the degree 3 to 350 part of the
//!   field, amplified by n + 1 in the gradient). The field's longitude-mean equatorial potential
//!   is 2.821012e6 m^2/s^2 for both, matching the paper's Phi_m = -2.82101(7)e6.
//! * Entry 3: 2000 epochs, RMS relative 8.0e-4, max 2.54e-3 (bar 4.5e-3).
//! * Mutations (reverted by editing back): dropping J2 from `LunarSurfacePotential` turns entries
//!   1 (1.044e-4) and 2 (3.9e-4) red; a constant lunar speed of 1022 m/s in place of the series
//!   velocity turns entry 3 red (max 7.4e-2).

use kshana::lunar_gauge::{rate_frame_jacobian_with, LunarSurfacePotential};

const PAPER: &str = include_str!("fixtures/lunar_rate_frame_coupling_oracle/reference.txt");
const C_M_S: f64 = 299_792_458.0;
const TOL_SCALE: f64 = 1.0e-4;
const TOL_RADIAL: f64 = 1.0e-4;
const TOL_VELOCITY: f64 = 4.5e-3;

fn fixture(file: &str) -> String {
    let path = format!(
        "{}/tests/fixtures/lunar_rate_frame_coupling_preregistered/{file}",
        env!("CARGO_MANIFEST_DIR")
    );
    std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read {path}: {e}"))
}

/// `key | value | ...` lookup in a pipe-separated reference file.
fn value_in(text: &str, key: &str) -> f64 {
    for line in text.lines() {
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
    panic!("{key} not found");
}

const FIELDS: [&str; 2] = ["AIUB-GRL350A", "AIUB-GRL350B"];

/// The potential built from the paper's GM, a_m, omega_m and the field's J2 referred to a_m.
fn potential(field: &str) -> LunarSurfacePotential {
    let f = fixture("fields.txt");
    let c20 = value_in(&f, &format!("{field}.C20bar"));
    let r = value_in(&f, &format!("{field}.radius_m"));
    let a = value_in(PAPER, "a_m_equatorial_radius");
    let j2 = -(5.0_f64).sqrt() * c20;
    LunarSurfacePotential {
        gm_m3_s2: value_in(PAPER, "GM_moon"),
        radius_m: a,
        j2: j2 * (r / a).powi(2),
        omega_rad_s: value_in(PAPER, "omega_m"),
    }
}

#[test]
fn entry1_d_alpha_d_scale_matches_the_published_l_m_for_both_cited_fields() {
    let l_m = value_in(PAPER, "L_m");
    let mut worst: f64 = 0.0;
    for field in FIELDS {
        let p = potential(field);
        let k = rate_frame_jacobian_with(0.0, &p).d_alpha_d_scale;
        let rel = (k - l_m).abs() / l_m;
        println!(
            "entry 1 {field}: J2_a {:.6e}, Kshana {k:.7e}, paper {l_m:.5e}, relative {rel:.3e} (bar {TOL_SCALE:.0e})",
            p.j2
        );
        worst = worst.max(rel);
    }
    assert!(worst <= TOL_SCALE, "entry 1: {worst:.3e} > {TOL_SCALE:.0e}");
}

#[test]
fn entry2_d_alpha_d_radial_matches_the_degree_350_equatorial_gravity_for_both_fields() {
    let o = fixture("pyshtools_equatorial.txt");
    let omega = value_in(PAPER, "omega_m");
    let a = value_in(PAPER, "a_m_equatorial_radius");
    let mut worst: f64 = 0.0;
    for field in FIELDS {
        let g_r = value_in(&o, &format!("{field}.mean_radial_gravity_m_s2")).abs();
        let g_eff = g_r - omega * omega * a;
        let oracle = g_eff / (C_M_S * C_M_S);
        let k = rate_frame_jacobian_with(0.0, &potential(field)).d_alpha_d_radial;
        let rel = (k - oracle).abs() / oracle;
        let phi = value_in(&o, &format!("{field}.mean_potential_m2_s2"));
        println!(
            "entry 2 {field}: Kshana {k:.7e} /m, oracle {oracle:.7e} /m (g_eff {g_eff:.7} m/s^2), relative {rel:.3e} (bar {TOL_RADIAL:.0e}); field mean potential {phi:.6e} vs paper Phi_m {:.5e} (not gating)",
            value_in(PAPER, "Phi_m_equator")
        );
        worst = worst.max(rel);
    }
    assert!(
        worst <= TOL_RADIAL,
        "entry 2: {worst:.3e} > {TOL_RADIAL:.0e}"
    );
}

#[test]
fn entry3_d_alpha_d_velocity_matches_the_de441_lunar_speed() {
    let text = fixture("horizons_moon_velocity.csv");
    let p = potential("AIUB-GRL350A");
    let (mut sum, mut max, mut n) = (0.0_f64, 0.0_f64, 0usize);
    for line in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
    {
        let c: Vec<f64> = line
            .split(',')
            .map(|s| s.trim().parse().expect("number"))
            .collect();
        let (jd, v_km_s) = (c[0], [c[1], c[2], c[3]]);
        let speed = 1e3 * (v_km_s[0].powi(2) + v_km_s[1].powi(2) + v_km_s[2].powi(2)).sqrt();
        let oracle = -speed / (C_M_S * C_M_S);
        let t = (jd - 2_451_545.0) / 36_525.0;
        let k = rate_frame_jacobian_with(t, &p).d_alpha_d_velocity;
        let rel = (k - oracle).abs() / oracle.abs();
        sum += rel * rel;
        max = max.max(rel);
        n += 1;
    }
    assert_eq!(n, 2000, "pre-registered epoch count");
    let rms = (sum / n as f64).sqrt();
    println!(
        "entry 3: n={n}, RMS relative {rms:.3e}, max relative {max:.3e} (bar {TOL_VELOCITY:.1e})"
    );
    assert!(
        max <= TOL_VELOCITY,
        "entry 3: max {max:.3e} > {TOL_VELOCITY:.1e}"
    );
}
