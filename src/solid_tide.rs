// SPDX-License-Identifier: AGPL-3.0-only
//! Station displacement by the solid Earth tide, IERS Conventions (2010), section 7.1.1.
//!
//! Implemented from the Conventions text (chapter 7, the 2015-06-19 version of the chapter),
//! equation by equation; the IERS reference routine is not ported.
//!
//! **Step 1** (time domain), summed over the Moon and the Sun:
//! - degree 2 in phase, eq. (5), with the latitude-dependent nominal Love and Shida numbers
//!   `h(φ) = 0.6078 − 0.0006·P₂(sin φ)` and `l(φ) = 0.0847 + 0.0002·P₂(sin φ)`;
//! - degree 3 in phase, eq. (6), `h₃ = 0.292`, `l₃ = 0.015`;
//! - the transverse contributions of `l⁽¹⁾` from the diurnal and semidiurnal bands, eqs (8) and (9),
//!   `l⁽¹⁾ = 0.0012` and `0.0024`;
//! - the out-of-phase contributions of the imaginary parts, diurnal eq. (10) with
//!   `h^I = −0.0025`, `l^I = −0.0007`, semidiurnal eq. (11) with `h^I = −0.0022`, `l^I = −0.0007`.
//!
//! **Step 2** (frequency domain): the corrections for the frequency dependence of the Love and
//! Shida numbers, eq. (12) over the eleven diurnal constituents of Table 7.3a and eq. (13) over
//! the five long-period constituents of Table 7.3b, in millimetres as tabulated. The tidal
//! argument is `θ_f = m(θ_g + π) − Σ N_k F_k` with `m = 1` (diurnal) or `0` (long period), `θ_g`
//! the Greenwich mean sidereal time and `F_k` the Delaunay arguments `(l, l′, F, D, Ω)` with the
//! multipliers the tables print.
//!
//! The result is the displacement of a "conventional tide free" position (the permanent part of
//! the degree 2 tide is included, section 7.1.1.2), in the terrestrial frame of the station and
//! body positions, in metres.
//!
//! MODELLED: checked against its own structure (the degree 2 part against
//! [`crate::ppp_real::solid_tide_ecef`], the Delaunay form of each tidal argument against its
//! Doodson form, and every term against the magnitudes the Conventions text states), not yet
//! against an external oracle. The comparison with the IERS test cases is pre-registered in
//! `docs/design/evidence/r1-4-loading-tides/PREREGISTRATION.md` and waits for its sign-off.

use crate::frames::Vec3;
use crate::jd2::Jd2;
use crate::portable_math::PortableFloat;

/// Earth's gravitational parameter (m³/s², IERS Conventions 2010, Table 1.1).
const GM_EARTH: f64 = 3.986_004_418e14;
/// Moon-to-Earth mass ratio (IERS Conventions 2010, Table 1.1).
const MOON_EARTH_MASS_RATIO: f64 = 0.012_300_037_1;
/// Sun's gravitational parameter (m³/s², IERS Conventions 2010, Table 1.1, TCB-compatible).
const GM_SUN: f64 = 1.327_124_420_99e20;
/// Earth's equatorial radius (m, IERS Conventions 2010, Table 1.1).
const RE: f64 = 6_378_136.6;

/// One constituent of Tables 7.3a and 7.3b: Doodson multipliers `(τ, s, h, p, N′, p_s)`,
/// Delaunay multipliers `(l, l′, F, D, Ω)`, and `ΔR^(ip)`, `ΔR^(op)`, `ΔT^(ip)`, `ΔT^(op)` (mm).
#[derive(Clone, Copy, Debug)]
pub struct Constituent {
    /// Name, where the table gives one.
    pub name: &'static str,
    /// Doodson multipliers `(τ, s, h, p, N′, p_s)`.
    pub doodson: [i8; 6],
    /// Delaunay multipliers `(l, l′, F, D, Ω)`.
    pub delaunay: [i8; 5],
    /// Radial in-phase, radial out-of-phase, transverse in-phase, transverse out-of-phase (mm).
    pub d_mm: [f64; 4],
}

const fn c(name: &'static str, doodson: [i8; 6], delaunay: [i8; 5], d_mm: [f64; 4]) -> Constituent {
    Constituent {
        name,
        doodson,
        delaunay,
        d_mm,
    }
}

/// Table 7.3a: diurnal constituents.
pub const DIURNAL: [Constituent; 11] = [
    c(
        "Q1",
        [1, -2, 0, 1, 0, 0],
        [1, 0, 2, 0, 2],
        [-0.08, 0.00, -0.01, 0.01],
    ),
    c(
        "145,545",
        [1, -1, 0, 0, -1, 0],
        [0, 0, 2, 0, 1],
        [-0.10, 0.00, 0.00, 0.00],
    ),
    c(
        "O1",
        [1, -1, 0, 0, 0, 0],
        [0, 0, 2, 0, 2],
        [-0.51, 0.00, -0.02, 0.03],
    ),
    c(
        "NO1",
        [1, 0, 0, 1, 0, 0],
        [1, 0, 0, 0, 0],
        [0.06, 0.00, 0.00, 0.00],
    ),
    c(
        "π1",
        [1, 1, -3, 0, 0, 1],
        [0, 1, 2, -2, 2],
        [-0.06, 0.00, 0.00, 0.00],
    ),
    c(
        "P1",
        [1, 1, -2, 0, 0, 0],
        [0, 0, 2, -2, 2],
        [-1.23, -0.07, 0.06, 0.01],
    ),
    c(
        "165,545",
        [1, 1, 0, 0, -1, 0],
        [0, 0, 0, 0, -1],
        [-0.22, 0.01, 0.01, 0.00],
    ),
    c(
        "K1",
        [1, 1, 0, 0, 0, 0],
        [0, 0, 0, 0, 0],
        [12.00, -0.78, -0.67, -0.03],
    ),
    c(
        "165,565",
        [1, 1, 0, 0, 1, 0],
        [0, 0, 0, 0, 1],
        [1.73, -0.12, -0.10, 0.00],
    ),
    c(
        "ψ1",
        [1, 1, 1, 0, 0, -1],
        [0, -1, 0, 0, 0],
        [-0.50, -0.01, 0.03, 0.00],
    ),
    c(
        "φ1",
        [1, 1, 2, 0, 0, 0],
        [0, 0, -2, 2, -2],
        [-0.11, 0.01, 0.01, 0.00],
    ),
];

/// Table 7.3b: long-period (zonal) constituents.
pub const LONG_PERIOD: [Constituent; 5] = [
    c(
        "55,565",
        [0, 0, 0, 0, 1, 0],
        [0, 0, 0, 0, 1],
        [0.47, 0.16, 0.23, 0.07],
    ),
    c(
        "Ssa",
        [0, 0, 2, 0, 0, 0],
        [0, 0, -2, 2, -2],
        [-0.20, -0.11, -0.12, -0.05],
    ),
    c(
        "Mm",
        [0, 1, 0, -1, 0, 0],
        [-1, 0, 0, 0, 0],
        [-0.11, -0.09, -0.08, -0.04],
    ),
    c(
        "Mf",
        [0, 2, 0, 0, 0, 0],
        [0, 0, -2, 0, -2],
        [-0.13, -0.15, -0.11, -0.07],
    ),
    c(
        "75,565",
        [0, 2, 0, 0, 1, 0],
        [0, 0, -2, 0, -1],
        [-0.05, -0.06, -0.05, -0.03],
    ),
];

/// The station's geocentric frame: `sin φ`, `cos φ`, `λ`, and the unit vectors `r̂`, `ê`, `n̂`.
struct Site {
    sp: f64,
    cp: f64,
    lam: f64,
    r: Vec3,
    e: Vec3,
    n: Vec3,
}

fn site(r: Vec3) -> Site {
    let rho = (r[0] * r[0] + r[1] * r[1]).sqrt();
    let nr = (rho * rho + r[2] * r[2]).sqrt();
    let (sp, cp) = (r[2] / nr, rho / nr);
    let lam = r[1].patan2(r[0]);
    let (sl, cl) = lam.psin_cos();
    Site {
        sp,
        cp,
        lam,
        r: [cp * cl, cp * sl, sp],
        e: [-sl, cl, 0.0],
        n: [-sp * cl, -sp * sl, cp],
    }
}

fn add_scaled(d: &mut Vec3, v: Vec3, k: f64) {
    for i in 0..3 {
        d[i] += k * v[i];
    }
}

/// Eq. (5): degree 2, in phase, with the latitude-dependent nominal Love and Shida numbers.
pub fn degree2_in_phase(r: Vec3, bodies: &[(Vec3, f64)]) -> Vec3 {
    let s = site(r);
    let p2 = (3.0 * s.sp * s.sp - 1.0) / 2.0;
    let h2 = 0.6078 - 0.0006 * p2;
    let l2 = 0.0847 + 0.0002 * p2;
    let mut d = [0.0; 3];
    for &(b, gm) in bodies {
        let rb = (b[0] * b[0] + b[1] * b[1] + b[2] * b[2]).sqrt();
        let bh = [b[0] / rb, b[1] / rb, b[2] / rb];
        let k = gm * RE.ppowi(4) / (GM_EARTH * rb.ppowi(3));
        let cz = bh[0] * s.r[0] + bh[1] * s.r[1] + bh[2] * s.r[2];
        add_scaled(&mut d, s.r, k * h2 * (3.0 * cz * cz - 1.0) / 2.0);
        let t = [
            bh[0] - cz * s.r[0],
            bh[1] - cz * s.r[1],
            bh[2] - cz * s.r[2],
        ];
        add_scaled(&mut d, t, k * 3.0 * l2 * cz);
    }
    d
}

/// Eq. (6): degree 3, in phase, `h₃ = 0.292`, `l₃ = 0.015`, summed over the bodies given.
pub fn degree3_in_phase(r: Vec3, bodies: &[(Vec3, f64)]) -> Vec3 {
    const H3: f64 = 0.292;
    const L3: f64 = 0.015;
    let s = site(r);
    let mut d = [0.0; 3];
    for &(b, gm) in bodies {
        let rb = (b[0] * b[0] + b[1] * b[1] + b[2] * b[2]).sqrt();
        let bh = [b[0] / rb, b[1] / rb, b[2] / rb];
        let k = gm * RE.ppowi(5) / (GM_EARTH * rb.ppowi(4));
        let cz = bh[0] * s.r[0] + bh[1] * s.r[1] + bh[2] * s.r[2];
        add_scaled(&mut d, s.r, k * H3 * (2.5 * cz * cz * cz - 1.5 * cz));
        let t = [
            bh[0] - cz * s.r[0],
            bh[1] - cz * s.r[1],
            bh[2] - cz * s.r[2],
        ];
        add_scaled(&mut d, t, k * L3 * (7.5 * cz * cz - 1.5));
    }
    d
}

/// A body's degree-2 factor `GM_j R_e⁴ / (GM_⊕ R_j³)` and its Legendre combinations from its
/// Cartesian coordinates, eqs (7a–c): `P₂¹ cos λ_j`, `P₂¹ sin λ_j`, `P₂² cos 2λ_j`,
/// `P₂² sin 2λ_j`, plus `sin 2Φ_j cos λ_j`, `sin 2Φ_j sin λ_j`, `cos² Φ_j cos 2λ_j`,
/// `cos² Φ_j sin 2λ_j`.
struct BodyTerms {
    k: f64,
    p21c: f64,
    p21s: f64,
    p22c: f64,
    p22s: f64,
    s2c: f64,
    s2s: f64,
    c2c: f64,
    c2s: f64,
}

fn body_terms(b: Vec3, gm: f64) -> BodyTerms {
    let (x, y, z) = (b[0], b[1], b[2]);
    let r2 = x * x + y * y + z * z;
    let rb = r2.sqrt();
    BodyTerms {
        k: gm * RE.ppowi(4) / (GM_EARTH * rb.ppowi(3)),
        p21c: 3.0 * x * z / r2,
        p21s: 3.0 * y * z / r2,
        p22c: 3.0 * (x * x - y * y) / r2,
        p22s: 6.0 * x * y / r2,
        // sin 2Φ = 2 sin Φ cos Φ = 2 z ρ / R², with cos λ = x/ρ, sin λ = y/ρ.
        s2c: 2.0 * z * x / r2,
        s2s: 2.0 * z * y / r2,
        // cos² Φ = ρ²/R², with cos 2λ = (x² − y²)/ρ², sin 2λ = 2xy/ρ².
        c2c: (x * x - y * y) / r2,
        c2s: 2.0 * x * y / r2,
    }
}

/// Eqs (8) to (11): the transverse `l⁽¹⁾` contributions and the out-of-phase contributions of
/// the imaginary parts, diurnal and semidiurnal.
pub fn step1_corrections(r: Vec3, bodies: &[(Vec3, f64)]) -> Vec3 {
    const L1_DIURNAL: f64 = 0.0012;
    const L1_SEMIDIURNAL: f64 = 0.0024;
    const HI_DIURNAL: f64 = -0.0025;
    const LI_DIURNAL: f64 = -0.0007;
    const HI_SEMIDIURNAL: f64 = -0.0022;
    const LI_SEMIDIURNAL: f64 = -0.0007;
    let s = site(r);
    let (sl, cl) = s.lam.psin_cos();
    let (s2l, c2l) = (2.0 * s.lam).psin_cos();
    let (sp, cp) = (s.sp, s.cp);
    let s2p = 2.0 * sp * cp;
    let c2p = cp * cp - sp * sp;
    let mut d = [0.0; 3];
    for &(b, gm) in bodies {
        let t = body_terms(b, gm);
        // P₂¹ cos(λ − λ_j) and P₂¹ sin(λ − λ_j).
        let p21_cos = cl * t.p21c + sl * t.p21s;
        let p21_sin = sl * t.p21c - cl * t.p21s;
        // P₂² cos 2(λ − λ_j) and P₂² sin 2(λ − λ_j).
        let p22_cos = c2l * t.p22c + s2l * t.p22s;
        let p22_sin = s2l * t.p22c - c2l * t.p22s;
        // Eq. (8).
        let k8 = -L1_DIURNAL * sp * t.k;
        add_scaled(&mut d, s.n, k8 * sp * p21_cos);
        add_scaled(&mut d, s.e, -k8 * c2p * p21_sin);
        // Eq. (9).
        let k9 = -0.5 * L1_SEMIDIURNAL * sp * cp * t.k;
        add_scaled(&mut d, s.n, k9 * p22_cos);
        add_scaled(&mut d, s.e, k9 * sp * p22_sin);
        // Eq. (10): sin 2Φ_j sin(λ − λ_j) and sin 2Φ_j cos(λ − λ_j).
        let s2_sin = sl * t.s2c - cl * t.s2s;
        let s2_cos = cl * t.s2c + sl * t.s2s;
        add_scaled(&mut d, s.r, -0.75 * HI_DIURNAL * t.k * s2_sin * s2p);
        let k10 = -1.5 * LI_DIURNAL * t.k;
        add_scaled(&mut d, s.n, k10 * s2_sin * c2p);
        add_scaled(&mut d, s.e, k10 * s2_cos * sp);
        // Eq. (11): cos² Φ_j sin 2(λ − λ_j) and cos² Φ_j cos 2(λ − λ_j).
        let c2_sin = s2l * t.c2c - c2l * t.c2s;
        let c2_cos = c2l * t.c2c + s2l * t.c2s;
        add_scaled(&mut d, s.r, -0.75 * HI_SEMIDIURNAL * t.k * c2_sin * cp * cp);
        let k11 = 0.75 * LI_SEMIDIURNAL * t.k;
        add_scaled(&mut d, s.n, k11 * c2_sin * s2p);
        add_scaled(&mut d, s.e, -k11 * 2.0 * cp * c2_cos);
    }
    d
}

/// The tidal argument `θ_f = m(θ_g + π) − Σ N_k F_k` (rad) of a constituent, from its Delaunay
/// multipliers, the Delaunay arguments `F` and Greenwich mean sidereal time `θ_g`.
pub fn tidal_argument(con: &Constituent, m: u8, f: &[f64; 5], theta_g: f64) -> f64 {
    let nf: f64 = con
        .delaunay
        .iter()
        .zip(f)
        .map(|(&n, &a)| f64::from(n) * a)
        .sum();
    f64::from(m) * (theta_g + std::f64::consts::PI) - nf
}

/// Eqs (12) and (13): Step 2, the frequency dependence of the Love and Shida numbers.
pub fn step2(r: Vec3, f: &[f64; 5], theta_g: f64) -> Vec3 {
    let s = site(r);
    let (sp, cp) = (s.sp, s.cp);
    let s2p = 2.0 * sp * cp;
    let c2p = cp * cp - sp * sp;
    let mut d = [0.0; 3];
    for con in &DIURNAL {
        let [rip, rop, tip, top] = con.d_mm.map(|v| v * 1e-3);
        let (sa, ca) = (tidal_argument(con, 1, f, theta_g) + s.lam).psin_cos();
        add_scaled(&mut d, s.r, (rip * sa + rop * ca) * s2p);
        add_scaled(&mut d, s.e, (tip * ca - top * sa) * sp);
        add_scaled(&mut d, s.n, (tip * sa + top * ca) * c2p);
    }
    for con in &LONG_PERIOD {
        let [rip, rop, tip, top] = con.d_mm.map(|v| v * 1e-3);
        let (sa, ca) = tidal_argument(con, 0, f, theta_g).psin_cos();
        add_scaled(&mut d, s.r, (1.5 * sp * sp - 0.5) * (rip * ca + rop * sa));
        add_scaled(&mut d, s.n, (tip * ca + top * sa) * s2p);
    }
    d
}

/// The solid Earth tide displacement (m, terrestrial frame) of the station at `r` (m), with the
/// Sun and Moon at `sun` and `moon` (m, same frame), at UT1 `ut1` (for `θ_g`, GMST, IAU 1982) and
/// TT `jd_tt` (for the Delaunay arguments): Step 1 plus Step 2 of section 7.1.1.
pub fn displacement(r: Vec3, sun: Vec3, moon: Vec3, ut1: Jd2, jd_tt: f64) -> Vec3 {
    let bodies = [(moon, GM_EARTH * MOON_EARTH_MASS_RATIO), (sun, GM_SUN)];
    let f = crate::nutation::delaunay_args(jd_tt);
    let theta_g = crate::jd2::gmst82(ut1);
    let mut d = degree2_in_phase(r, &bodies);
    for part in [
        degree3_in_phase(r, &bodies),
        step1_corrections(r, &bodies),
        step2(r, &f, theta_g),
    ] {
        add_scaled(&mut d, part, 1.0);
    }
    d
}

/// The gravitational parameters (Moon, Sun) this module uses, m³/s².
pub fn body_gm() -> (f64, f64) {
    (GM_EARTH * MOON_EARTH_MASS_RATIO, GM_SUN)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    /// A deterministic spread of stations and epochs, with the engine's Sun and Moon.
    fn cases() -> Vec<(Vec3, Vec3, Vec3, Jd2, f64)> {
        let mut out = Vec::new();
        for i in 0..400u32 {
            let lat = (-85.0 + 170.0 * f64::from(i % 17) / 16.0).to_radians();
            let lon = (-180.0 + 360.0 * f64::from((i * 7) % 29) / 29.0).to_radians();
            let (sla, cla) = lat.psin_cos();
            let (slo, clo) = lon.psin_cos();
            let r = [6.371e6 * cla * clo, 6.371e6 * cla * slo, 6.371e6 * sla];
            // GPS seconds over about 19 years from 2006, every 41.3 hours.
            let t = 8.0e8 + f64::from(i) * 148_680.0 * 4.0;
            let sun = crate::precise_products::sun_ecef(t);
            let moon = crate::ppp_real::moon_ecef(t);
            let jd = 2_444_244.5 + t / 86_400.0;
            out.push((
                r,
                sun,
                moon,
                Jd2::new(jd - 18.0 / 86_400.0),
                jd + 51.184 / 86_400.0,
            ));
        }
        out
    }

    #[test]
    fn degree_2_matches_the_ppp_path_up_to_the_constants() {
        // ppp_real::solid_tide_ecef is eq. (5) with its own GM values; the two agree to the
        // relative difference of those constants.
        for (r, sun, moon, _, _) in cases().into_iter().take(50) {
            let (gm_moon, gm_sun) = body_gm();
            let a = degree2_in_phase(r, &[(moon, gm_moon), (sun, gm_sun)]);
            let b = crate::ppp_real::solid_tide_ecef(r, sun, moon);
            let diff = norm([a[0] - b[0], a[1] - b[1], a[2] - b[2]]);
            assert!(diff < 1e-7 * norm(b).max(1e-3), "{diff}");
        }
    }

    #[test]
    fn delaunay_and_doodson_forms_of_every_argument_agree() {
        // Doodson arguments from the Delaunay ones and θ_g: s = F + Ω, h = s − D, p = s − l,
        // N′ = −Ω, p_s = h − l′, τ = θ_g + π − s. A transcription error in either multiplier set
        // of Table 7.3a or 7.3b shows up here.
        let f = crate::nutation::delaunay_args(2_460_000.5);
        let theta_g = 1.234;
        let [l, lp, ff, d, om] = f;
        let s = ff + om;
        let h = s - d;
        let beta = [theta_g + std::f64::consts::PI - s, s, h, s - l, -om, h - lp];
        for (table, m) in [(&DIURNAL[..], 1u8), (&LONG_PERIOD[..], 0)] {
            for con in table {
                let a = tidal_argument(con, m, &f, theta_g);
                let b: f64 = con
                    .doodson
                    .iter()
                    .zip(&beta)
                    .map(|(&n, &x)| f64::from(n) * x)
                    .sum();
                let diff = (a - b).rem_euclid(std::f64::consts::TAU);
                let diff = diff.min(std::f64::consts::TAU - diff);
                assert!(diff < 1e-9, "{}: {a} vs {b}", con.name);
            }
        }
    }

    #[test]
    fn every_term_stays_within_the_magnitudes_the_conventions_state() {
        // Section 7.1.1: degree 3 radial up to 1.7 mm (see below) and transverse up to 0.2 mm; the l(1)
        // transverse terms up to 0.8 mm (diurnal) and 1.0 mm (semidiurnal); Step 2 is dominated by
        // K1 (12.00 mm radial, times sin 2φ ≤ 1). The whole Step 1 degree 2 radial part stays
        // within about 0.45 m. Margins of 10 % cover rounding in the stated figures.
        let (mut d3r, mut d3t, mut s1, mut s2, mut d2) = (0.0f64, 0.0f64, 0.0f64, 0.0f64, 0.0f64);
        for (r, sun, moon, ut1, tt) in cases() {
            let (gm_moon, gm_sun) = body_gm();
            let bodies = [(moon, gm_moon), (sun, gm_sun)];
            let s = site(r);
            let v = degree3_in_phase(r, &bodies);
            let radial = v[0] * s.r[0] + v[1] * s.r[1] + v[2] * s.r[2];
            d3r = d3r.max(radial.abs());
            d3t = d3t.max(norm([
                v[0] - radial * s.r[0],
                v[1] - radial * s.r[1],
                v[2] - radial * s.r[2],
            ]));
            s1 = s1.max(norm(step1_corrections(r, &bodies)));
            let f = crate::nutation::delaunay_args(tt);
            s2 = s2.max(norm(step2(r, &f, crate::jd2::gmst82(ut1))));
            d2 = d2.max(norm(degree2_in_phase(r, &bodies)));
        }
        // The text's 1.7 mm is the Moon's term at its mean distance (h₃·GM_M·R_e⁵/(GM_⊕·R⁴) is
        // 1.74 mm at 384 400 km); at perigee, about 356 400 km, eq. (6) gives 2.36 mm.
        let (gm_moon, _) = body_gm();
        let at = |d: f64| 0.292 * gm_moon * RE.ppowi(5) / (GM_EARTH * d.ppowi(4));
        assert!((at(384_400e3) - 1.74e-3).abs() < 0.01e-3);
        assert!(
            d3r <= at(356_400e3) * 1.01 && d3r > 1.0e-3,
            "degree 3 radial {d3r}"
        );
        // The same holds for the transverse 0.2 mm: at perigee it scales by (384 400/356 400)⁴.
        let perigee = (384_400.0_f64 / 356_400.0).ppowi(4);
        assert!(d3t <= 0.2e-3 * perigee * 1.05, "degree 3 transverse {d3t}");
        // l(1) up to 0.8 and 1.0 mm plus the out-of-phase terms (each below 1 mm).
        assert!(s1 <= 3.0e-3 && s1 > 0.5e-3, "step 1 corrections {s1}");
        // The sum of the absolute tabulated values bounds Step 2: 19.6 mm.
        assert!(s2 <= 19.6e-3 && s2 > 5.0e-3, "step 2 {s2}");
        assert!(d2 <= 0.45 && d2 > 0.2, "degree 2 {d2}");
    }

    #[test]
    fn the_unit_vectors_are_orthonormal() {
        for (r, ..) in cases().into_iter().take(20) {
            let s = site(r);
            for (a, b, want) in [
                (s.r, s.r, 1.0),
                (s.e, s.e, 1.0),
                (s.n, s.n, 1.0),
                (s.r, s.e, 0.0),
                (s.r, s.n, 0.0),
                (s.e, s.n, 0.0),
            ] {
                let d = a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
                assert!((d - want).abs() < 1e-14);
            }
            // n̂ points north: its z component is cos φ ≥ 0.
            assert!(s.n[2] >= 0.0);
        }
    }
}
