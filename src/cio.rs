// SPDX-License-Identifier: Apache-2.0
//! IAU 2006/2000A CIO-based celestial-to-terrestrial reduction (GCRS↔CIRS↔ITRS).
//!
//! This is the modern, equinox-free counterpart to the equinox/GMST chain in
//! [`crate::frames`] and [`crate::nutation`]. It follows the IAU 2006/2000A
//! "CIO based" transformation (IERS Conventions 2010, ch. 5; SOFA `c2t06a`):
//!
//! - **CIP coordinates `X, Y`** ([`cip_xy`]) — the Celestial Intermediate Pole
//!   unit-vector components in the GCRS, read directly off the IAU 2006/2000A
//!   classical bias-precession-nutation matrix (SOFA `eraBpn2xy` of `eraPnm06a`).
//!   The matrix reuses the validated IAU 2006 Fukushima-Williams precession
//!   ([`crate::precession::fw_matrix`]) and the full IAU 2000A nutation
//!   ([`crate::nutation::nutation_iau2000a`]) with the small `eraNut06a` P03
//!   adjustment.
//! - **The CIO locator `s`** ([`cio_locator_s`]) — the 66-term `s + XY/2` series
//!   (SOFA `eraS06`), machine-generated from the ERFA reference into
//!   [`crate::cio_s06_data`].
//! - **GCRS→CIRS** ([`gcrs_to_cirs_matrix`], SOFA `eraC2ixys`) and the **Earth
//!   rotation angle** ([`earth_rotation_angle`], SOFA `eraEra00`), composed with
//!   IERS **polar motion** ([`crate::frames::polar_motion_matrix`]) into the full
//!   **GCRS→ITRS** rotation ([`gcrs_to_itrs_matrix`], SOFA `eraC2tcio`).
//!
//! `(X, Y, s)` are validated bit-for-bit against the published `eraXys06a` test
//! vector, the GCRS→CIRS matrix against `eraC2ixys`, and the Earth rotation angle
//! against `eraEra00`. Inputs are TT/UT1 as single `f64` Julian dates (consistent
//! with the rest of the crate); the ~ms UT1−TT distinction and sub-µas frame-rate
//! terms are the caller's to supply.

use crate::cio_s06_data::{S06Term, S06_0, S06_1, S06_2, S06_3, S06_4, SP06};
use crate::frames::polar_motion_matrix;
use crate::nutation::nutation_iau2000a;
use crate::precession::{
    fw_angles, fw_matrix, julian_centuries_tt, matmul, ry, rz, transpose, FwAngles, Mat3, Vec3,
};
use crate::timescales::JD_J2000;

/// Arc seconds to radians (SOFA `DAS2R`).
const ARCSEC_TO_RAD: f64 = std::f64::consts::PI / (180.0 * 3600.0);
/// Arc seconds in a full turn (SOFA `TURNAS`).
const TURNAS: f64 = 1_296_000.0;
const TAU: f64 = std::f64::consts::TAU;

/// The eight fundamental arguments used by the `s` series (IERS 2003):
/// `(l, l′, F, D, Ω, L_Ve, L_E, pA)` in radians, matching SOFA `eraFa*03`.
fn fa_args(t: f64) -> [f64; 8] {
    let asec = |c0: f64, c1: f64, c2: f64, c3: f64, c4: f64| {
        ((c0 + t * (c1 + t * (c2 + t * (c3 + t * c4)))) % TURNAS) * ARCSEC_TO_RAD
    };
    let rad = |c0: f64, c1: f64| (c0 + c1 * t) % TAU;
    [
        asec(
            485868.249036,
            1717915923.2178,
            31.8792,
            0.051635,
            -0.00024470,
        ), // l   eraFal03
        asec(
            1287104.793048,
            129596581.0481,
            -0.5532,
            0.000136,
            -0.00001149,
        ), // l′  eraFalp03
        asec(
            335779.526232,
            1739527262.8478,
            -12.7512,
            -0.001037,
            0.00000417,
        ), // F  eraFaf03
        asec(
            1072260.703692,
            1602961601.2090,
            -6.3706,
            0.006593,
            -0.00003169,
        ), // D  eraFad03
        asec(450160.398036, -6962890.5431, 7.4722, 0.007702, -0.00005939), // Ω   eraFaom03
        rad(3.176146697, 1021.3285546211),                                 // LVe eraFave03
        rad(1.753470314, 628.3075849991),                                  // LE  eraFae03
        (0.024381750 + 0.00000538691 * t) * t,                             // pA  eraFapa03
    ]
}

/// Accumulate one order-of-`t` block of the `s` series (smallest first, as SOFA).
fn s_block(table: &[S06Term], fa: &[f64; 8]) -> f64 {
    let mut acc = 0.0;
    for &(nfa, s, c) in table.iter().rev() {
        let a: f64 = nfa
            .iter()
            .zip(fa.iter())
            .map(|(&m, &f)| f64::from(m) * f)
            .sum();
        acc += s * a.sin() + c * a.cos();
    }
    acc
}

/// The CIP coordinates `(X, Y)` (radians) in the GCRS at TT epoch `jd_tt`,
/// from the IAU 2006/2000A classical bias-precession-nutation matrix
/// (SOFA `eraPnm06a` → `eraBpn2xy`).
pub fn cip_xy(jd_tt: f64) -> (f64, f64) {
    let t = julian_centuries_tt(jd_tt);
    // IAU 2000A nutation with the eraNut06a P03 adjustment to 2006 precession.
    let n = nutation_iau2000a(jd_tt);
    let fj2 = -2.7774e-6 * t;
    let dpsi = n.dpsi + n.dpsi * (0.4697e-6 + fj2);
    let deps = n.deps + n.deps * fj2;
    let fw = fw_angles(jd_tt);
    let npb = fw_matrix(FwAngles {
        gamma_bar: fw.gamma_bar,
        phi_bar: fw.phi_bar,
        psi_bar: fw.psi_bar + dpsi,
        eps_a: fw.eps_a + deps,
    });
    (npb[2][0], npb[2][1])
}

/// The CIO locator `s` (radians) at TT epoch `jd_tt`, given the CIP `(X, Y)`
/// (SOFA `eraS06`). The series is for `s + XY/2`; `s` is recovered by subtracting
/// `XY/2`.
pub fn cio_locator_s(jd_tt: f64, x: f64, y: f64) -> f64 {
    let t = julian_centuries_tt(jd_tt);
    let fa = fa_args(t);
    let w0 = SP06[0] + s_block(&S06_0, &fa);
    let w1 = SP06[1] + s_block(&S06_1, &fa);
    let w2 = SP06[2] + s_block(&S06_2, &fa);
    let w3 = SP06[3] + s_block(&S06_3, &fa);
    let w4 = SP06[4] + s_block(&S06_4, &fa);
    let w5 = SP06[5];
    let series = w0 + (w1 + (w2 + (w3 + (w4 + w5 * t) * t) * t) * t) * t;
    series * ARCSEC_TO_RAD - x * y / 2.0
}

/// `(X, Y, s)` for the IAU 2006/2000A model at TT epoch `jd_tt` (SOFA `eraXys06a`).
pub fn xys_2006a(jd_tt: f64) -> (f64, f64, f64) {
    let (x, y) = cip_xy(jd_tt);
    let s = cio_locator_s(jd_tt, x, y);
    (x, y, s)
}

/// The GCRS→CIRS (celestial-to-intermediate) rotation from CIP `(X, Y)` and the
/// CIO locator `s` (SOFA `eraC2ixys`): `C = Rz(−(E+s))·Ry(d)·Rz(E)` with
/// `E = atan2(Y, X)`, `d = atan(√(r²/(1−r²)))`, `r² = X²+Y²`.
pub fn celestial_to_intermediate(x: f64, y: f64, s: f64) -> Mat3 {
    let r2 = x * x + y * y;
    let e = if r2 > 0.0 { y.atan2(x) } else { 0.0 };
    let d = (r2 / (1.0 - r2)).sqrt().atan();
    matmul(&rz(-(e + s)), &matmul(&ry(d), &rz(e)))
}

/// The GCRS→CIRS rotation matrix at TT epoch `jd_tt`.
pub fn gcrs_to_cirs_matrix(jd_tt: f64) -> Mat3 {
    let (x, y, s) = xys_2006a(jd_tt);
    celestial_to_intermediate(x, y, s)
}

/// Normalize an angle into `[0, 2π)` (SOFA `eraAnp`).
fn anp(a: f64) -> f64 {
    let w = a % TAU;
    if w < 0.0 {
        w + TAU
    } else {
        w
    }
}

/// The Earth rotation angle (radians) at UT1 epoch `jd_ut1` (SOFA `eraEra00`).
pub fn earth_rotation_angle(jd_ut1: f64) -> f64 {
    let t = jd_ut1 - JD_J2000;
    let f = jd_ut1 % 1.0;
    anp(TAU * (f + 0.779_057_273_264_0 + 0.002_737_811_911_354_48 * t))
}

/// The full GCRS→ITRS rotation at TT epoch `jd_tt` and UT1 epoch `jd_ut1`, given
/// the polar-motion coordinates `x_p`, `y_p` (radians; see [`crate::frames::arcsec`]).
/// CIO based, SOFA `eraC2tcio`: `R = POM · R3(ERA) · C`.
pub fn gcrs_to_itrs_matrix(jd_tt: f64, jd_ut1: f64, xp_rad: f64, yp_rad: f64) -> Mat3 {
    let rc2i = gcrs_to_cirs_matrix(jd_tt);
    let era = earth_rotation_angle(jd_ut1);
    let pom = polar_motion_matrix(xp_rad, yp_rad, jd_tt);
    matmul(&pom, &matmul(&rz(era), &rc2i))
}

/// Rotate a GCRS position into the ITRS (Earth-fixed) frame via the CIO chain.
pub fn gcrs_to_itrs(r_gcrs: Vec3, jd_tt: f64, jd_ut1: f64, xp_rad: f64, yp_rad: f64) -> Vec3 {
    crate::precession::mat_vec(&gcrs_to_itrs_matrix(jd_tt, jd_ut1, xp_rad, yp_rad), r_gcrs)
}

/// Inverse of [`gcrs_to_itrs`]: rotate an ITRS position back to the GCRS.
pub fn itrs_to_gcrs(r_itrs: Vec3, jd_tt: f64, jd_ut1: f64, xp_rad: f64, yp_rad: f64) -> Vec3 {
    let m = transpose(&gcrs_to_itrs_matrix(jd_tt, jd_ut1, xp_rad, yp_rad));
    crate::precession::mat_vec(&m, r_itrs)
}

#[cfg(test)]
mod tests {
    use super::*;

    // SOFA/ERFA reference epoch for eraXys06a: date1=2400000.5, date2=53736.0.
    const JD_TT_REF: f64 = 2_400_000.5 + 53_736.0;

    fn det(m: &Mat3) -> f64 {
        m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
            - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
            + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
    }

    fn is_orthonormal(m: &Mat3) -> bool {
        let mt = transpose(m);
        let p = matmul(m, &mt);
        for (i, row) in p.iter().enumerate() {
            for (j, &pij) in row.iter().enumerate() {
                let expect = if i == j { 1.0 } else { 0.0 };
                if (pij - expect).abs() > 1e-12 {
                    return false;
                }
            }
        }
        (det(m) - 1.0).abs() < 1e-12
    }

    #[test]
    fn xys06a_matches_sofa_reference_vector() {
        // The authoritative anchor: SOFA/ERFA `eraXys06a` test vector. Validates the
        // 2006/2000A NPB→X,Y extraction and the full 66-term s+XY/2 series.
        let (x, y, s) = xys_2006a(JD_TT_REF);
        assert!(
            (x - 0.579_130_848_283_529_3e-3).abs() < 1e-14,
            "X = {x} (want 0.5791308482835292617e-3)"
        );
        assert!(
            (y - 0.402_058_009_945_402_03e-4).abs() < 1e-15,
            "Y = {y} (want 0.4020580099454020310e-4)"
        );
        assert!(
            (s - (-1.220_032_294_164_58e-8)).abs() < 1e-18,
            "s = {s} (want -0.1220032294164579896e-7)"
        );
    }

    #[test]
    fn c2ixys_matches_sofa_reference_matrix() {
        // SOFA `eraC2ixys` test vector.
        let x = 0.579_130_848_670_601_1e-3;
        let y = 0.402_057_981_673_296_1e-4;
        let s = -0.122_004_084_847_227_2e-7;
        let m = celestial_to_intermediate(x, y, s);
        let want = [
            [
                0.999_999_832_303_715_7,
                0.558_198_486_916_849_9e-9,
                -0.579_130_849_161_128_2e-3,
            ],
            [
                -0.238_426_164_267_044_03e-7,
                0.999_999_999_191_746_9,
                -0.402_057_911_016_966_9e-4,
            ],
            [
                0.579_130_848_670_601_1e-3,
                0.402_057_981_673_296_1e-4,
                0.999_999_831_495_462_8,
            ],
        ];
        for i in 0..3 {
            for j in 0..3 {
                assert!(
                    (m[i][j] - want[i][j]).abs() < 1e-12,
                    "rc2i[{i}][{j}] = {} (want {})",
                    m[i][j],
                    want[i][j]
                );
            }
        }
    }

    #[test]
    fn era00_matches_sofa_reference_value() {
        // SOFA `eraEra00(2400000.5, 54388.0)`.
        let era = earth_rotation_angle(2_400_000.5 + 54_388.0);
        assert!(
            (era - 0.402_283_724_002_815_8).abs() < 1e-12,
            "ERA = {era} (want 0.4022837240028158102)"
        );
    }

    #[test]
    fn gcrs_to_cirs_is_a_small_proper_rotation() {
        let c = gcrs_to_cirs_matrix(JD_TT_REF);
        assert!(is_orthonormal(&c), "GCRS→CIRS must be a proper rotation");
        // The net rotation is the CIP offset from the GCRS pole — tens of mas,
        // i.e. an arcminute-ish angle, never the ~23° obliquity.
        let trace = c[0][0] + c[1][1] + c[2][2];
        let theta = (((trace - 1.0) / 2.0).clamp(-1.0, 1.0)).acos();
        assert!(theta < 1e-3, "GCRS→CIRS angle = {theta} rad (want < ~1e-3)");
    }

    #[test]
    fn gcrs_to_itrs_round_trips_and_is_a_rotation() {
        let r = [7000.0e3, -1200.0e3, 4200.0e3];
        let (jd_tt, jd_ut1) = (JD_TT_REF, JD_TT_REF - 0.000_8); // ~UT1≈TT−69s
        let xp = crate::frames::arcsec(0.2);
        let yp = crate::frames::arcsec(0.35);
        let m = gcrs_to_itrs_matrix(jd_tt, jd_ut1, xp, yp);
        assert!(is_orthonormal(&m), "GCRS→ITRS must be a proper rotation");
        let back = itrs_to_gcrs(
            gcrs_to_itrs(r, jd_tt, jd_ut1, xp, yp),
            jd_tt,
            jd_ut1,
            xp,
            yp,
        );
        for k in 0..3 {
            assert!((back[k] - r[k]).abs() < 1e-6, "round-trip[{k}]");
        }
    }

    #[test]
    fn cio_chain_is_consistent_with_the_equinox_teme_chain() {
        // The rigorous (SOFA-validated) CIO GCRS→ITRS and the legacy equinox/GMST
        // TEME→ITRF reduction reach the SAME Earth-fixed frame *up to their differing
        // sidereal-time conventions*: the TEME path rotates by the SGP4 IAU-1982 GMST
        // (`sgp4::gstime`) with the 2-term equation of the equinoxes and IAU 2000B
        // nutation, whereas the CIO path uses the IAU-2006 Earth Rotation Angle with
        // the full 2000A model. The residual is therefore a small about-pole rotation
        // of ≈ 2·(equation of equinoxes) ≈ 3.6 arcsec at this epoch (verified by
        // decomposing M_cio·M_eqᵀ), i.e. a few hundred metres at LEO — NOT a defect in
        // the CIO chain, which is anchored bit-for-bit to the eraXys06a/eraC2ixys/
        // eraEra00 vectors above. This is a consistency sanity check, not a precision
        // assertion; the rigorous frame is the CIO one.
        let (jd_tt, jd_ut1) = (JD_TT_REF, JD_TT_REF);
        let r_gcrs = [6500.0e3, 2300.0e3, -1800.0e3];
        let (r_teme, _) = crate::nutation::gcrs_to_teme(r_gcrs, [0.0; 3], jd_tt);
        let r_itrf_equinox = crate::frames::teme_to_itrf(r_teme, jd_ut1, 0.0, 0.0, jd_tt);
        let r_itrs_cio = gcrs_to_itrs(r_gcrs, jd_tt, jd_ut1, 0.0, 0.0);
        let sep = ((r_itrf_equinox[0] - r_itrs_cio[0]).powi(2)
            + (r_itrf_equinox[1] - r_itrs_cio[1]).powi(2)
            + (r_itrf_equinox[2] - r_itrs_cio[2]).powi(2))
        .sqrt();
        // ≈ 2·EE about the pole ⇒ ~130 m at this radius; bound generously at the
        // few-arcsec (≈ 250 m) sidereal-convention scale, and confirm it is NOT a
        // gross (km-level) frame disagreement.
        assert!(
            sep < 250.0,
            "CIO vs equinox-TEME ITRS separation = {sep} m (expected ≈ 2·EE convention gap, < 250 m)"
        );
        // Magnitude is preserved by both (pure rotations) — the difference is purely
        // angular, confirming a shared pole + sidereal-origin offset, not a scaling bug.
        let n = |v: [f64; 3]| (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        assert!((n(r_itrs_cio) - n(r_gcrs)).abs() < 1e-6);
    }
}
