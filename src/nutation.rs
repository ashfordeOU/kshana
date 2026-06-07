// SPDX-License-Identifier: Apache-2.0
//! IAU 2000B nutation and the full TEME→GCRS/J2000 inertial reduction.
//!
//! [`crate::precession`] supplies the IAU 2006 bias-precession (GCRS→mean-of-date).
//! This module adds the second and third pieces of a true inertial reduction:
//!
//! - **IAU 2000B nutation** ([`nutation_iau2000b`]) — the 77-term luni-solar
//!   MHB2000 series of McCarthy & Luzum (2003), the standard truncation of the
//!   full IAU 2000A series that agrees with it to better than 1 mas over
//!   1995–2050, plus the two fixed planetary offsets that stand in for the
//!   omitted planetary terms. The series, the Delaunay fundamental arguments
//!   (Simon et al. 1994), and the unit constants are transcribed from the
//!   IAU SOFA / ERFA `nut00b` reference and validated bit-for-bit against the
//!   published `eraNut00b` test vector.
//! - **The full TEME→GCRS chain** ([`teme_to_gcrs`]) following Vallado
//!   AIAA-2006-6980: TEME→TOD (equation of the equinoxes), TOD→MOD (nutation),
//!   MOD→GCRS (bias-precession). This upgrades the GMST-only TEME↔ECEF reduction
//!   in [`crate::frames`] to a genuine inertial-frame output.
//!
//! Scope (honest): nutation is the IAU 2000B truncation (~1 mas), not the full
//! 2000A (<0.1 mas); the equation of the equinoxes carries the two leading IAU
//! 1994 complementary terms only; the TEME→GCRS rotation is applied to velocity
//! as well as position, neglecting the ~7e-12 rad/s precession-nutation frame
//! rotation (a < 1e-4 m/s error at orbital speeds). An ANISE/SPICE numerical
//! cross-check to the < 10 m level is a follow-on (see `ROADMAP.md`).

use crate::precession::{
    fw_angles, mat_vec, matmul, precession_matrix, rx, rz, transpose, Mat3, Vec3,
};
use crate::timescales::JD_J2000;

/// Arc seconds to radians (same value as SOFA `DAS2R`).
const ARCSEC_TO_RAD: f64 = std::f64::consts::PI / (180.0 * 3600.0);
/// Arc seconds in a full turn (SOFA `TURNAS`), for reducing the Delaunay arguments.
const TURNAS: f64 = 1_296_000.0;
/// Days in a Julian century.
const DAYS_PER_CENTURY: f64 = 36_525.0;
/// 0.1 micro-arcsecond (the series coefficient unit) to radians (SOFA `U2R`).
const U2R: f64 = ARCSEC_TO_RAD / 1e7;
/// Milli-arcsecond to radians (SOFA `DMAS2R`).
const MAS_TO_RAD: f64 = ARCSEC_TO_RAD / 1e3;

/// Fixed offsets standing in for the planetary terms omitted by the 2000B
/// truncation (SOFA `nut00b` `DPPLAN`/`DEPLAN`).
const DPPLAN: f64 = -0.135 * MAS_TO_RAD;
const DEPLAN: f64 = 0.388 * MAS_TO_RAD;

/// One luni-solar term: the five Delaunay multipliers `(l, l′, F, D, Ω)` and the
/// six series coefficients `(ps, pst, pc, ec, ect, es)` in units of 0.1 µas (and
/// 0.1 µas/century for the `·t` coefficients).
type LsTerm = (i8, i8, i8, i8, i8, f64, f64, f64, f64, f64, f64);

/// The 77-term luni-solar nutation series, IAU 2000B (MHB2000), transcribed from
/// the IAU SOFA / ERFA `nut00b` reference table.
#[rustfmt::skip]
const LS_TERMS: [LsTerm; 77] = [
    ( 0, 0, 0, 0, 1, -172064161.0, -174666.0,  33386.0,  92052331.0,  9086.0,  15377.0),
    ( 0, 0, 2,-2, 2,  -13170906.0,   -1675.0, -13696.0,   5730336.0, -3015.0,  -4587.0),
    ( 0, 0, 2, 0, 2,   -2276413.0,    -234.0,   2796.0,    978459.0,  -485.0,   1374.0),
    ( 0, 0, 0, 0, 2,    2074554.0,     207.0,   -698.0,   -897492.0,   470.0,   -291.0),
    ( 0, 1, 0, 0, 0,    1475877.0,   -3633.0,  11817.0,     73871.0,  -184.0,  -1924.0),
    ( 0, 1, 2,-2, 2,    -516821.0,    1226.0,   -524.0,    224386.0,  -677.0,   -174.0),
    ( 1, 0, 0, 0, 0,     711159.0,      73.0,   -872.0,     -6750.0,     0.0,    358.0),
    ( 0, 0, 2, 0, 1,    -387298.0,    -367.0,    380.0,    200728.0,    18.0,    318.0),
    ( 1, 0, 2, 0, 2,    -301461.0,     -36.0,    816.0,    129025.0,   -63.0,    367.0),
    ( 0,-1, 2,-2, 2,     215829.0,    -494.0,    111.0,    -95929.0,   299.0,    132.0),
    ( 0, 0, 2,-2, 1,     128227.0,     137.0,    181.0,    -68982.0,    -9.0,     39.0),
    (-1, 0, 2, 0, 2,     123457.0,      11.0,     19.0,    -53311.0,    32.0,     -4.0),
    (-1, 0, 0, 2, 0,     156994.0,      10.0,   -168.0,     -1235.0,     0.0,     82.0),
    ( 1, 0, 0, 0, 1,      63110.0,      63.0,     27.0,    -33228.0,     0.0,     -9.0),
    (-1, 0, 0, 0, 1,     -57976.0,     -63.0,   -189.0,     31429.0,     0.0,    -75.0),
    (-1, 0, 2, 2, 2,     -59641.0,     -11.0,    149.0,     25543.0,   -11.0,     66.0),
    ( 1, 0, 2, 0, 1,     -51613.0,     -42.0,    129.0,     26366.0,     0.0,     78.0),
    (-2, 0, 2, 0, 1,      45893.0,      50.0,     31.0,    -24236.0,   -10.0,     20.0),
    ( 0, 0, 0, 2, 0,      63384.0,      11.0,   -150.0,     -1220.0,     0.0,     29.0),
    ( 0, 0, 2, 2, 2,     -38571.0,      -1.0,    158.0,     16452.0,   -11.0,     68.0),
    ( 0,-2, 2,-2, 2,      32481.0,       0.0,      0.0,    -13870.0,     0.0,      0.0),
    (-2, 0, 0, 2, 0,     -47722.0,       0.0,    -18.0,       477.0,     0.0,    -25.0),
    ( 2, 0, 2, 0, 2,     -31046.0,      -1.0,    131.0,     13238.0,   -11.0,     59.0),
    ( 1, 0, 2,-2, 2,      28593.0,       0.0,     -1.0,    -12338.0,    10.0,     -3.0),
    (-1, 0, 2, 0, 1,      20441.0,      21.0,     10.0,    -10758.0,     0.0,     -3.0),
    ( 2, 0, 0, 0, 0,      29243.0,       0.0,    -74.0,      -609.0,     0.0,     13.0),
    ( 0, 0, 2, 0, 0,      25887.0,       0.0,    -66.0,      -550.0,     0.0,     11.0),
    ( 0, 1, 0, 0, 1,     -14053.0,     -25.0,     79.0,      8551.0,    -2.0,    -45.0),
    (-1, 0, 0, 2, 1,      15164.0,      10.0,     11.0,     -8001.0,     0.0,     -1.0),
    ( 0, 2, 2,-2, 2,     -15794.0,      72.0,    -16.0,      6850.0,   -42.0,     -5.0),
    ( 0, 0,-2, 2, 0,      21783.0,       0.0,     13.0,      -167.0,     0.0,     13.0),
    ( 1, 0, 0,-2, 1,     -12873.0,     -10.0,    -37.0,      6953.0,     0.0,    -14.0),
    ( 0,-1, 0, 0, 1,     -12654.0,      11.0,     63.0,      6415.0,     0.0,     26.0),
    (-1, 0, 2, 2, 1,     -10204.0,       0.0,     25.0,      5222.0,     0.0,     15.0),
    ( 0, 2, 0, 0, 0,      16707.0,     -85.0,    -10.0,       168.0,    -1.0,     10.0),
    ( 1, 0, 2, 2, 2,      -7691.0,       0.0,     44.0,      3268.0,     0.0,     19.0),
    (-2, 0, 2, 0, 0,     -11024.0,       0.0,    -14.0,       104.0,     0.0,      2.0),
    ( 0, 1, 2, 0, 2,       7566.0,     -21.0,    -11.0,     -3250.0,     0.0,     -5.0),
    ( 0, 0, 2, 2, 1,      -6637.0,     -11.0,     25.0,      3353.0,     0.0,     14.0),
    ( 0,-1, 2, 0, 2,      -7141.0,      21.0,      8.0,      3070.0,     0.0,      4.0),
    ( 0, 0, 0, 2, 1,      -6302.0,     -11.0,      2.0,      3272.0,     0.0,      4.0),
    ( 1, 0, 2,-2, 1,       5800.0,      10.0,      2.0,     -3045.0,     0.0,     -1.0),
    ( 2, 0, 2,-2, 2,       6443.0,       0.0,     -7.0,     -2768.0,     0.0,     -4.0),
    (-2, 0, 0, 2, 1,      -5774.0,     -11.0,    -15.0,      3041.0,     0.0,     -5.0),
    ( 2, 0, 2, 0, 1,      -5350.0,       0.0,     21.0,      2695.0,     0.0,     12.0),
    ( 0,-1, 2,-2, 1,      -4752.0,     -11.0,     -3.0,      2719.0,     0.0,     -3.0),
    ( 0, 0, 0,-2, 1,      -4940.0,     -11.0,    -21.0,      2720.0,     0.0,     -9.0),
    (-1,-1, 0, 2, 0,       7350.0,       0.0,     -8.0,       -51.0,     0.0,      4.0),
    ( 2, 0, 0,-2, 1,       4065.0,       0.0,      6.0,     -2206.0,     0.0,      1.0),
    ( 1, 0, 0, 2, 0,       6579.0,       0.0,    -24.0,      -199.0,     0.0,      2.0),
    ( 0, 1, 2,-2, 1,       3579.0,       0.0,      5.0,     -1900.0,     0.0,      1.0),
    ( 1,-1, 0, 0, 0,       4725.0,       0.0,     -6.0,       -41.0,     0.0,      3.0),
    (-2, 0, 2, 0, 2,      -3075.0,       0.0,     -2.0,      1313.0,     0.0,     -1.0),
    ( 3, 0, 2, 0, 2,      -2904.0,       0.0,     15.0,      1233.0,     0.0,      7.0),
    ( 0,-1, 0, 2, 0,       4348.0,       0.0,    -10.0,       -81.0,     0.0,      2.0),
    ( 1,-1, 2, 0, 2,      -2878.0,       0.0,      8.0,      1232.0,     0.0,      4.0),
    ( 0, 0, 0, 1, 0,      -4230.0,       0.0,      5.0,       -20.0,     0.0,     -2.0),
    (-1,-1, 2, 2, 2,      -2819.0,       0.0,      7.0,      1207.0,     0.0,      3.0),
    (-1, 0, 2, 0, 0,      -4056.0,       0.0,      5.0,        40.0,     0.0,     -2.0),
    ( 0,-1, 2, 2, 2,      -2647.0,       0.0,     11.0,      1129.0,     0.0,      5.0),
    (-2, 0, 0, 0, 1,      -2294.0,       0.0,    -10.0,      1266.0,     0.0,     -4.0),
    ( 1, 1, 2, 0, 2,       2481.0,       0.0,     -7.0,     -1062.0,     0.0,     -3.0),
    ( 2, 0, 0, 0, 1,       2179.0,       0.0,     -2.0,     -1129.0,     0.0,     -2.0),
    (-1, 1, 0, 1, 0,       3276.0,       0.0,      1.0,        -9.0,     0.0,      0.0),
    ( 1, 1, 0, 0, 0,      -3389.0,       0.0,      5.0,        35.0,     0.0,     -2.0),
    ( 1, 0, 2, 0, 0,       3339.0,       0.0,    -13.0,      -107.0,     0.0,      1.0),
    (-1, 0, 2,-2, 1,      -1987.0,       0.0,     -6.0,      1073.0,     0.0,     -2.0),
    ( 1, 0, 0, 0, 2,      -1981.0,       0.0,      0.0,       854.0,     0.0,      0.0),
    (-1, 0, 0, 1, 0,       4026.0,       0.0,   -353.0,      -553.0,     0.0,   -139.0),
    ( 0, 0, 2, 1, 2,       1660.0,       0.0,     -5.0,      -710.0,     0.0,     -2.0),
    (-1, 0, 2, 4, 2,      -1521.0,       0.0,      9.0,       647.0,     0.0,      4.0),
    (-1, 1, 0, 1, 1,       1314.0,       0.0,      0.0,      -700.0,     0.0,      0.0),
    ( 0,-2, 2,-2, 1,      -1283.0,       0.0,      0.0,       672.0,     0.0,      0.0),
    ( 1, 0, 2, 2, 1,      -1331.0,       0.0,      8.0,       663.0,     0.0,      4.0),
    (-2, 0, 2, 2, 2,       1383.0,       0.0,     -2.0,      -594.0,     0.0,     -2.0),
    (-1, 0, 0, 0, 2,       1405.0,       0.0,      4.0,      -610.0,     0.0,      2.0),
    ( 1, 1, 2,-2, 2,       1290.0,       0.0,      0.0,      -556.0,     0.0,      0.0),
];

/// Nutation in longitude and obliquity (radians), referred to the ecliptic of date.
#[derive(Clone, Copy, Debug)]
pub struct Nutation {
    /// `Δψ` — nutation in longitude.
    pub dpsi: f64,
    /// `Δε` — nutation in obliquity.
    pub deps: f64,
}

/// Julian centuries of TT since J2000.0.
fn julian_centuries_tt(jd_tt: f64) -> f64 {
    (jd_tt - JD_J2000) / DAYS_PER_CENTURY
}

/// The five Delaunay fundamental arguments `[l, l′, F, D, Ω]` (radians) at TT epoch
/// `jd_tt`, in the linear IAU 2000B form (Simon et al. 1994) used by SOFA `eraNut00b`.
pub fn delaunay_args(jd_tt: f64) -> [f64; 5] {
    let t = julian_centuries_tt(jd_tt);
    // Reduce each (arc-second) argument modulo a full turn before converting to
    // radians, exactly as SOFA `eraNut00b` does (truncated remainder, `%`).
    let arg = |c0: f64, c1: f64| ((c0 + c1 * t) % TURNAS) * ARCSEC_TO_RAD;
    let el = arg(485868.249036, 1717915923.2178); // Moon mean anomaly
    let elp = arg(1287104.79305, 129596581.0481); // Sun mean anomaly
    let f = arg(335779.526232, 1739527262.8478); // Moon mean argument of latitude
    let d = arg(1072260.70369, 1602961601.2090); // Moon elongation from the Sun
    let om = arg(450160.398036, -6962890.5431); // Moon ascending-node longitude
    [el, elp, f, d, om]
}

/// IAU 2000B nutation `(Δψ, Δε)` at TT epoch `jd_tt`.
pub fn nutation_iau2000b(jd_tt: f64) -> Nutation {
    let t = julian_centuries_tt(jd_tt);
    let [el, elp, f, d, om] = delaunay_args(jd_tt);
    // Accumulate in 0.1 µas units, summing smallest terms first (the SOFA order).
    let mut dp = 0.0_f64;
    let mut de = 0.0_f64;
    for &(nl, nlp, nf, nd, nom, ps, pst, pc, ec, ect, es) in LS_TERMS.iter().rev() {
        let arg = (f64::from(nl) * el
            + f64::from(nlp) * elp
            + f64::from(nf) * f
            + f64::from(nd) * d
            + f64::from(nom) * om)
            % std::f64::consts::TAU;
        let (sarg, carg) = arg.sin_cos();
        dp += (ps + pst * t) * sarg + pc * carg;
        de += (ec + ect * t) * carg + es * sarg;
    }
    Nutation {
        dpsi: dp * U2R + DPPLAN,
        deps: de * U2R + DEPLAN,
    }
}

/// Mean obliquity of the ecliptic of date (radians), the IAU 2006 value (`obl06`,
/// identical to the `ε̄_A` carried by [`crate::precession::fw_angles`]).
pub fn mean_obliquity(jd_tt: f64) -> f64 {
    fw_angles(jd_tt).eps_a
}

/// The nutation rotation matrix (SOFA `iauNumat`): rotates a mean-of-date (MOD)
/// vector into the true equator and equinox of date (TOD), `r_TOD = N · r_MOD`.
pub fn nutation_matrix(jd_tt: f64) -> Mat3 {
    // SOFA `iauNumat`: N = Rx(−(ε̄+Δε)) · Rz(Δψ) · Rx(ε̄).
    let eps = mean_obliquity(jd_tt);
    let n = nutation_iau2000b(jd_tt);
    let r = matmul(&rz(n.dpsi), &rx(eps));
    matmul(&rx(-(eps + n.deps)), &r)
}

/// Equation of the equinoxes (radians): `Δψ·cos(ε̄_A)` plus the two leading IAU
/// 1994 complementary terms. This is the small angle between the TEME (mean-equinox)
/// frame and TOD (true equinox of date) about the of-date pole.
pub fn equation_of_equinoxes(jd_tt: f64) -> f64 {
    let n = nutation_iau2000b(jd_tt);
    let eps = mean_obliquity(jd_tt);
    let om = delaunay_args(jd_tt)[4];
    // Δψ·cos(ε̄) plus the two leading IAU 1994 complementary terms.
    n.dpsi * eps.cos()
        + 0.002_640_96 * ARCSEC_TO_RAD * om.sin()
        + 0.000_063_52 * ARCSEC_TO_RAD * (2.0 * om).sin()
}

/// The composite TEME→GCRS rotation matrix at TT epoch `jd_tt`:
/// `R = Pᵀ · Nᵀ · R3(−EE)`.
pub fn teme_to_gcrs_matrix(jd_tt: f64) -> Mat3 {
    let r3_minus_ee = rz(-equation_of_equinoxes(jd_tt));
    let n_t = transpose(&nutation_matrix(jd_tt));
    let p_t = transpose(&precession_matrix(jd_tt));
    matmul(&p_t, &matmul(&n_t, &r3_minus_ee))
}

/// Rotate a TEME position and velocity into the GCRS/J2000 inertial frame at TT
/// epoch `jd_tt`. The same rotation is applied to both (the of-date frame's
/// rotation relative to GCRS is negligible at orbital speeds — see the module note).
pub fn teme_to_gcrs(r_teme: Vec3, v_teme: Vec3, jd_tt: f64) -> (Vec3, Vec3) {
    let m = teme_to_gcrs_matrix(jd_tt);
    (mat_vec(&m, r_teme), mat_vec(&m, v_teme))
}

/// Inverse of [`teme_to_gcrs`]: rotate a GCRS position and velocity back to TEME.
pub fn gcrs_to_teme(r_gcrs: Vec3, v_gcrs: Vec3, jd_tt: f64) -> (Vec3, Vec3) {
    let m = transpose(&teme_to_gcrs_matrix(jd_tt));
    (mat_vec(&m, r_gcrs), mat_vec(&m, v_gcrs))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::precession::gcrs_to_mod;

    // SOFA/ERFA `eraNut00b` reference epoch: date1=2400000.5, date2=53736.0.
    const JD_TT_REF: f64 = 2_400_000.5 + 53_736.0;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

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
    fn nut00b_matches_sofa_reference_vector() {
        // The authoritative anchor: SOFA/ERFA `eraNut00b` test vector validates the
        // entire 77-term transcription + Delaunay arguments + unit constants.
        let n = nutation_iau2000b(JD_TT_REF);
        assert!(
            (n.dpsi - (-9.632_552_291_148_363e-6)).abs() < 1e-13,
            "Δψ = {} (want -0.9632552291148362783e-5)",
            n.dpsi
        );
        assert!(
            (n.deps - 4.063_197_106_621_16e-5).abs() < 1e-13,
            "Δε = {} (want 0.4063197106621159367e-4)",
            n.deps
        );
    }

    #[test]
    fn delaunay_node_at_j2000_is_125_degrees() {
        // Ω, the mean longitude of the Moon's ascending node, is ≈ 125.045° at J2000
        // (constant term 450160.398036″). l′ (Sun mean anomaly) ≈ 357.5° (1287104.79305″).
        let [l, lp, _f, _d, om] = delaunay_args(JD_J2000);
        let to_deg = |r: f64| (r / ARCSEC_TO_RAD / 3600.0).rem_euclid(360.0);
        assert!(
            (to_deg(om) - 125.044_555).abs() < 1e-3,
            "Ω = {}°",
            to_deg(om)
        );
        assert!(
            (to_deg(lp) - 357.529_109).abs() < 1e-3,
            "l′ = {}°",
            to_deg(lp)
        );
        // l (Moon mean anomaly) ≈ 134.963° at J2000 (485868.249036″).
        assert!((to_deg(l) - 134.963_403).abs() < 1e-3, "l = {}°", to_deg(l));
    }

    #[test]
    fn nutation_matrix_is_a_small_proper_rotation() {
        let n = nutation_matrix(JD_TT_REF);
        assert!(
            is_orthonormal(&n),
            "nutation matrix must be a proper rotation"
        );
        // The net rotation is the nutation magnitude — tens of arc seconds, never the
        // ~23° obliquity (which would mean ε was not cancelled). cos θ = (tr − 1)/2.
        let trace = n[0][0] + n[1][1] + n[2][2];
        let theta = (((trace - 1.0) / 2.0).clamp(-1.0, 1.0)).acos();
        let theta_arcsec = theta / ARCSEC_TO_RAD;
        assert!(
            (1.0..60.0).contains(&theta_arcsec),
            "nutation angle = {theta_arcsec}″ (want tens of arcsec)"
        );
    }

    #[test]
    fn equation_of_equinoxes_tracks_dpsi_cos_eps() {
        // EE = Δψ·cos(ε̄) + (≤ ~3 mas complementary terms). It must agree with the
        // dominant term to within those few-mas terms, and be non-trivial.
        let ee = equation_of_equinoxes(JD_TT_REF);
        let n = nutation_iau2000b(JD_TT_REF);
        let dominant = n.dpsi * mean_obliquity(JD_TT_REF).cos();
        assert!(ee.abs() > 1e-6, "EE should be ~arcsec scale, got {ee}");
        assert!(
            (ee - dominant).abs() < 2e-8,
            "EE − Δψ·cosε = {} (should be ≤ a few mas)",
            ee - dominant
        );
    }

    #[test]
    fn teme_gcrs_round_trips() {
        let r = [7000.0e3, -1200.0e3, 4200.0e3];
        let v = [1.5e3, 7.0e3, -0.8e3];
        let (rg, vg) = teme_to_gcrs(r, v, JD_TT_REF);
        let (rb, vb) = gcrs_to_teme(rg, vg, JD_TT_REF);
        for k in 0..3 {
            assert!((rb[k] - r[k]).abs() < 1e-6, "r round-trip[{k}]");
            assert!((vb[k] - v[k]).abs() < 1e-9, "v round-trip[{k}]");
        }
        // The transform preserves magnitude (it is a pure rotation).
        assert!((norm(rg) - norm(r)).abs() < 1e-6);
    }

    #[test]
    fn teme_gcrs_adds_nutation_on_top_of_precession() {
        // The full chain must differ from a precession-only reduction by the
        // nutation + equation-of-the-equinoxes contribution: at a 7000 km radius the
        // ~tens-of-arcsec nutation displaces the position by ~tens to hundreds of
        // metres — small versus precession, but not zero.
        let r = [7000.0e3, -1200.0e3, 4200.0e3];
        let (rg, _) = teme_to_gcrs(r, [0.0; 3], JD_TT_REF);
        // Precession-only: treat the input as MOD and undo precession to GCRS.
        let prec_only = crate::precession::mod_to_gcrs(r, JD_TT_REF);
        let diff = ((rg[0] - prec_only[0]).powi(2)
            + (rg[1] - prec_only[1]).powi(2)
            + (rg[2] - prec_only[2]).powi(2))
        .sqrt();
        assert!(
            (5.0..5000.0).contains(&diff),
            "nutation+EE contribution = {diff} m (want tens–hundreds of m)"
        );
        // Sanity: the GCRS vector is not identical to the TEME input either.
        let _ = gcrs_to_mod(r, JD_TT_REF);
    }
}
