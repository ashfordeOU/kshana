// SPDX-License-Identifier: AGPL-3.0-only
//! IAU 2015 / WGCCRE lunar body-fixed orientation — the **Mean-Earth/polar-axis (ME)** frame.
//!
//! The rotation from inertial ICRF/J2000 to the Moon-fixed frame at an epoch, from the
//! analytic trigonometric-polynomial model of the IAU Working Group on Cartographic
//! Coordinates and Rotational Elements (Archinal et al. 2018, *Report of the IAU WGCCRE:
//! 2015*, Celest. Mech. Dyn. Astr. 130:22), transcribed verbatim from the NAIF generic
//! text PCK `pck00011.tpc` (`BODY301_*`). This is the precessing-pole, physically-librating
//! lunar orientation the simple uniform spin of [`crate::lunar::mci_to_mcmf`] omits — the
//! frame needed to evaluate a Moon-fixed gravity field for lunar orbit determination
//! (`tests/agency_lro.rs`).
//!
//! The pole right ascension `α₀`, declination `δ₀`, and prime meridian `W` (degrees) are
//!
//! ```text
//!   α₀ = 269.9949 + 0.0031·T            + Σ aᵢ·sin Eᵢ
//!   δ₀ =  66.5392 + 0.0130·T            + Σ dᵢ·cos Eᵢ
//!   W  =  38.3213 + 13.17635815·d − 1.4e-12·d² + Σ wᵢ·sin Eᵢ
//! ```
//!
//! with `T` = Julian centuries and `d` = days past J2000 TDB, and the 13 lunar libration
//! arguments `Eᵢ = cᵢ + rᵢ·T` (the [`E_CONST`]/[`E_RATE`] tables, rates per Julian century).
//! The body-fixed rotation is the standard IAU 3-1-3 sequence
//! `R = R_z(W)·R_x(90°−δ₀)·R_z(90°+α₀)`, so `r_bodyfixed = R · r_icrf` — the same
//! inertial→body-fixed convention [`crate::cio::gcrs_to_itrs_matrix`] uses for the Earth, so
//! the geopotential evaluation path ([`crate::gravity_sh`]) is reused unchanged.
//!
//! ## Scope (honest)
//!
//! [`icrf_to_iau_moon`] realizes the lunar **ME** frame (NAIF `IAU_MOON`), as the source PCK
//! states. The GRAIL gravity fields (GRGM*) are strictly in the **principal-axis (PA)** frame, so
//! [`icrf_to_moon_pa`] composes the analytic ME orientation with the fixed DE421 ME→PA offset
//! (`moon_080317.tf`); that is the rotation lunar OD uses to evaluate the field. The remaining
//! limit is that the *analytic* IAU libration series is itself an approximation (tens of arc-
//! seconds) of the JPL DE numerically-integrated lunar libration (`MOON_PA` from a binary PCK),
//! the higher-fidelity follow-on — the dominant residual in `tests/agency_lro.rs`, alongside the
//! low-precision built-in ephemeris.

use crate::precession::{transpose, Mat3};

/// Julian Date of the J2000.0 epoch (TT).
const JD_J2000: f64 = 2_451_545.0;

/// The 13 lunar libration argument constants `cᵢ` (degrees) — `BODY301` nutation/precession
/// angles of `pck00011.tpc`. `Eᵢ(T) = E_CONST[i] + E_RATE[i]·T`, `T` in Julian centuries.
pub const E_CONST: [f64; 13] = [
    125.045, 250.089, 260.008, 176.625, 357.529, 311.589, 134.963, 276.617, 34.226, 15.134,
    119.743, 239.961, 25.053,
];

/// The 13 lunar libration argument rates `rᵢ` (degrees per Julian century) — `BODY301`
/// nutation/precession angle rates of `pck00011.tpc`.
pub const E_RATE: [f64; 13] = [
    -1935.5364525,
    -3871.072905,
    475263.3328725,
    487269.629985,
    35999.0509575,
    964468.49931,
    477198.869325,
    12006.300765,
    63863.5132425,
    -5806.6093575,
    131.84064,
    6003.1503825,
    473327.79642,
];

/// Pole-RA periodic amplitudes `aᵢ` (degrees), multiplying `sin Eᵢ` — `BODY301_NUT_PREC_RA`.
const RA_AMP: [f64; 13] = [
    -3.8787, -0.1204, 0.0700, -0.0172, 0.0, 0.0072, 0.0, 0.0, 0.0, -0.0052, 0.0, 0.0, 0.0043,
];

/// Pole-DEC periodic amplitudes `dᵢ` (degrees), multiplying `cos Eᵢ` — `BODY301_NUT_PREC_DEC`.
const DEC_AMP: [f64; 13] = [
    1.5419, 0.0239, -0.0278, 0.0068, 0.0, -0.0029, 0.0009, 0.0, 0.0, 0.0008, 0.0, 0.0, -0.0009,
];

/// Prime-meridian periodic amplitudes `wᵢ` (degrees), multiplying `sin Eᵢ` —
/// `BODY301_NUT_PREC_PM`.
const PM_AMP: [f64; 13] = [
    3.5610, 0.1208, -0.0642, 0.0158, 0.0252, -0.0066, -0.0047, -0.0046, 0.0028, 0.0052, 0.0040,
    0.0019, -0.0044,
];

/// Days and Julian centuries past J2000 TDB at `jd_tdb` (TT≈TDB to <2 ms, negligible here).
fn days_and_centuries(jd_tdb: f64) -> (f64, f64) {
    let d = jd_tdb - JD_J2000;
    (d, d / 36525.0)
}

/// The 13 libration arguments `Eᵢ` (radians) at Julian-century time `t`.
fn libration_args(t: f64) -> [f64; 13] {
    let mut e = [0.0; 13];
    for i in 0..13 {
        e[i] = (E_CONST[i] + E_RATE[i] * t).to_radians();
    }
    e
}

/// The lunar pole right ascension `α₀` and declination `δ₀` (radians, ICRF) at `jd_tdb`,
/// from the IAU 2015 model including the libration series.
pub fn lunar_pole_ra_dec(jd_tdb: f64) -> (f64, f64) {
    let (_d, t) = days_and_centuries(jd_tdb);
    let e = libration_args(t);
    let mut ra = 269.9949 + 0.0031 * t;
    let mut dec = 66.5392 + 0.0130 * t;
    for i in 0..13 {
        ra += RA_AMP[i] * e[i].sin();
        dec += DEC_AMP[i] * e[i].cos();
    }
    (ra.to_radians(), dec.to_radians())
}

/// The lunar prime-meridian angle `W` (radians) at `jd_tdb`, from the IAU 2015 model
/// including the libration series. Not reduced to `[0, 2π)` (the caller takes sin/cos).
pub fn lunar_prime_meridian(jd_tdb: f64) -> f64 {
    let (d, t) = days_and_centuries(jd_tdb);
    let e = libration_args(t);
    let mut w = 38.3213 + 13.176_358_15 * d - 1.4e-12 * d * d;
    for i in 0..13 {
        w += PM_AMP[i] * e[i].sin();
    }
    w.to_radians()
}

/// Frame rotation about +z by `theta` (rotates the coordinate axes; `crate::lunar::rot3`
/// convention).
fn rz(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[c, s, 0.0], [-s, c, 0.0], [0.0, 0.0, 1.0]]
}

/// Frame rotation about +x by `theta`.
fn rx(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[1.0, 0.0, 0.0], [0.0, c, s], [0.0, -s, c]]
}

/// Frame rotation about +y by `theta`.
fn ry(theta: f64) -> Mat3 {
    let (s, c) = theta.sin_cos();
    [[c, 0.0, -s], [0.0, 1.0, 0.0], [s, 0.0, c]]
}

/// 3×3 matrix product `a·b`.
fn matmul(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut m = [[0.0; 3]; 3];
    for (i, mrow) in m.iter_mut().enumerate() {
        for (j, e) in mrow.iter_mut().enumerate() {
            *e = a[i][0] * b[0][j] + a[i][1] * b[1][j] + a[i][2] * b[2][j];
        }
    }
    m
}

/// The rotation from inertial ICRF/J2000 to the Moon-fixed **ME** frame at `jd_tdb`, as the
/// IAU 3-1-3 sequence `R_z(W)·R_x(90°−δ₀)·R_z(90°+α₀)`. Apply with
/// [`crate::precession::mat_vec`]: `r_bodyfixed = R · r_icrf`; the inverse (body-fixed →
/// inertial) is its transpose. The rows of `R` are the Moon-fixed axes expressed in ICRF, so
/// row 2 is the lunar pole `(cos δ₀ cos α₀, cos δ₀ sin α₀, sin δ₀)`.
pub fn icrf_to_iau_moon(jd_tdb: f64) -> Mat3 {
    let (ra, dec) = lunar_pole_ra_dec(jd_tdb);
    let w = lunar_prime_meridian(jd_tdb);
    let half_pi = std::f64::consts::FRAC_PI_2;
    // R = Rz(W) · Rx(90°−δ) · Rz(90°+α).
    matmul(&matmul(&rz(w), &rx(half_pi - dec)), &rz(half_pi + ra))
}

/// The fixed DE421 rotation from the lunar **principal-axis (PA)** frame to the **mean-Earth
/// (ME)** frame, `r_ME = R · r_PA`: the 1-2-3 Euler sequence (67.92″, 78.56″, 0.30″) about axes
/// (3, 2, 1), transcribed from the NAIF frame kernel `moon_080317.tf` (`MOON_ME_DE421` relative
/// to `MOON_PA_DE421`, `TKFRAME_31007`). SPICE `AXES = (3,2,1)` builds the matrix innermost-first,
/// so `R = R_x(0.30″)·R_y(78.56″)·R_z(67.92″)` in the frame-rotation elementaries above.
fn me_from_pa() -> Mat3 {
    let a = (67.92_f64 / 3600.0).to_radians(); // about +z (axis 3), applied first
    let b = (78.56_f64 / 3600.0).to_radians(); // about +y (axis 2)
    let c = (0.30_f64 / 3600.0).to_radians(); // about +x (axis 1), applied last
    matmul(&matmul(&rx(c), &ry(b)), &rz(a))
}

/// The rotation from inertial ICRF/J2000 to the lunar **principal-axis (PA / DE421)** frame at
/// `jd_tdb` — the frame the GRAIL GRGM gravity fields are defined in. The IAU mean-Earth
/// orientation ([`icrf_to_iau_moon`]) composed with the fixed DE421 ME→PA offset
/// ([`me_from_pa`] transposed): `r_PA = (ME→PA) · (ICRF→ME) · r_icrf`. Use this — not the bare
/// ME orientation — to evaluate a PA-frame lunar field, so the C₂₂ bulge sits at the right
/// selenographic longitude (the ~arc-minute ME↔PA offset is otherwise a ~10 m along-track error
/// over a few-revolution lunar arc).
pub fn icrf_to_moon_pa(jd_tdb: f64) -> Mat3 {
    let pa_from_me = transpose(&me_from_pa());
    matmul(&pa_from_me, &icrf_to_iau_moon(jd_tdb))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::ephem::moon_position;
    use crate::precession::{julian_centuries_tt, mat_vec, transpose};

    type Vec3 = [f64; 3];

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    fn dot(a: Vec3, b: Vec3) -> f64 {
        a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
    }

    /// JD (TT) for a UTC-ish calendar date at 00:00, good enough for the lunar orientation
    /// (sub-second time error ⇒ sub-µas orientation error).
    fn jd_2022_001() -> f64 {
        2_459_580.5 // 2022-01-01 00:00 TT
    }

    #[test]
    fn rotation_is_orthonormal_and_proper() {
        // A body-fixed orientation must be a proper rotation: Rᵀ·R = I and det = +1.
        let m = icrf_to_iau_moon(jd_2022_001());
        let mt = transpose(&m);
        let prod = matmul(&mt, &m);
        for (i, row) in prod.iter().enumerate() {
            for (j, &e) in row.iter().enumerate() {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!(
                    (e - want).abs() < 1e-12,
                    "RᵀR[{i}][{j}] = {e} (want {want})"
                );
            }
        }
        let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
            - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
            + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
        assert!(
            (det - 1.0).abs() < 1e-12,
            "det = {det} (want +1, proper rotation)"
        );
    }

    #[test]
    fn pole_row_matches_ra_dec_and_known_j2000_value() {
        // The matrix is ICRF→body-fixed, so its row 2 is the lunar pole expressed in ICRF:
        // (cos δ cos α, cos δ sin α, sin δ). This ties the 3-1-3 assembly to (α₀, δ₀).
        let jd = JD_J2000;
        let (ra, dec) = lunar_pole_ra_dec(jd);
        let m = icrf_to_iau_moon(jd);
        let pole = [m[2][0], m[2][1], m[2][2]];
        let want = [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()];
        for k in 0..3 {
            assert!(
                (pole[k] - want[k]).abs() < 1e-12,
                "pole[{k}] {} vs {}",
                pole[k],
                want[k]
            );
        }
        // Independent physical sanity: the J2000 lunar ME pole is RA ≈ 266.86°, Dec ≈ 65.64°
        // (the known value; a gross transcription error in the libration series would miss it).
        let ra_deg = ra.to_degrees().rem_euclid(360.0);
        let dec_deg = dec.to_degrees();
        assert!(
            (ra_deg - 266.86).abs() < 0.2,
            "J2000 pole RA {ra_deg}° (want ≈ 266.86)"
        );
        assert!(
            (dec_deg - 65.64).abs() < 0.2,
            "J2000 pole Dec {dec_deg}° (want ≈ 65.64)"
        );
    }

    #[test]
    fn prime_meridian_advances_one_turn_per_sidereal_month() {
        // W advances at 13.17635815°/day, ≈ 360° over the 27.321661-day sidereal month.
        let jd = jd_2022_001();
        let daily = (lunar_prime_meridian(jd + 1.0) - lunar_prime_meridian(jd)).to_degrees();
        assert!(
            (daily - 13.176_358).abs() < 0.05,
            "W rate {daily}°/day (want ≈ 13.176)"
        );
    }

    #[test]
    fn sub_earth_point_tracks_the_near_side() {
        // The physical content of the lunar rotation: the Moon keeps one face toward Earth,
        // so the Earth direction expressed in the Moon-fixed frame sits near the +x prime
        // meridian, within the optical libration (≤ ~8° in longitude, ~7° in latitude). This
        // validates W (the rotation phase) against an independent ephemeris — if W or the pole
        // were wrong by tens of degrees the sub-Earth point would wander off the near side.
        // Checked across a month so it is not an epoch coincidence.
        for day in [0.0, 7.0, 14.0, 21.0, 28.0] {
            let jd = jd_2022_001() + day;
            // Earth direction from the Moon (ICRF): −(geocentric Moon position).
            let mp = moon_position(julian_centuries_tt(jd));
            let earth_dir = [-mp[0], -mp[1], -mp[2]];
            let m = icrf_to_iau_moon(jd);
            let bf = mat_vec(&m, earth_dir);
            let bf = [bf[0] / norm(bf), bf[1] / norm(bf), bf[2] / norm(bf)];
            let lon = bf[1].atan2(bf[0]).to_degrees(); // selenographic longitude of sub-Earth pt
            let lat = bf[2].asin().to_degrees();
            assert!(
                lon.abs() < 10.0,
                "day {day}: sub-Earth longitude {lon}° off near side (libration ≤ ~8°)"
            );
            assert!(
                lat.abs() < 9.0,
                "day {day}: sub-Earth latitude {lat}° off near side (libration ≤ ~7°)"
            );
            // And it really is the near side: +x component dominates.
            assert!(
                bf[0] > 0.95,
                "day {day}: Earth not toward +x (cos = {})",
                bf[0]
            );
        }
    }

    #[test]
    fn principal_axis_frame_is_a_small_fixed_offset_from_mean_earth() {
        // icrf_to_moon_pa = (ME→PA) · (ICRF→ME): a proper rotation that differs from the bare ME
        // orientation by the fixed DE421 offset — small (the composite of 67.92″/78.56″/0.30″,
        // ~arc-minute), constant in time, and orthonormal.
        let jd = jd_2022_001();
        let pa = icrf_to_moon_pa(jd);
        let me = icrf_to_iau_moon(jd);
        // Proper rotation.
        let prod = matmul(&transpose(&pa), &pa);
        for (i, row) in prod.iter().enumerate() {
            for (j, &e) in row.iter().enumerate() {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!((e - want).abs() < 1e-12, "PAᵀPA[{i}][{j}] = {e}");
            }
        }
        // Difference from ME: apply both to a test vector; the angle between them is the fixed
        // offset, of order arc-minutes (between 50″ ≈ 2.4e-4 rad and 3′ ≈ 9e-4 rad).
        let r = [1.50e6, 0.70e6, 0.55e6];
        let rp = mat_vec(&pa, r);
        let rm = mat_vec(&me, r);
        let n = norm(r);
        let diff = norm([rp[0] - rm[0], rp[1] - rm[1], rp[2] - rm[2]]) / n;
        assert!(
            (1e-4..1e-3).contains(&diff),
            "ME↔PA offset {diff} rad off the ~arc-minute band"
        );
        // The offset *rotation* PA·MEᵀ is the fixed DE421 ME→PA matrix, identical at any epoch
        // (its manifestation on a fixed inertial vector rotates with the Moon, but the matrix
        // itself does not).
        let off1 = matmul(&pa, &transpose(&me));
        let pa2 = icrf_to_moon_pa(jd + 28.0);
        let me2 = icrf_to_iau_moon(jd + 28.0);
        let off2 = matmul(&pa2, &transpose(&me2));
        for (r1, r2) in off1.iter().zip(off2.iter()) {
            for (a, b) in r1.iter().zip(r2.iter()) {
                assert!(
                    (a - b).abs() < 1e-12,
                    "ME→PA offset matrix not time-invariant"
                );
            }
        }
    }

    #[test]
    fn me_frame_pole_consistent_with_inverse() {
        // iau_moon→icrf is the transpose: applying it to the body +z must return the pole.
        let jd = jd_2022_001();
        let m = icrf_to_iau_moon(jd);
        let mt = transpose(&m);
        let pole_icrf = mat_vec(&mt, [0.0, 0.0, 1.0]);
        let (ra, dec) = lunar_pole_ra_dec(jd);
        let want = [dec.cos() * ra.cos(), dec.cos() * ra.sin(), dec.sin()];
        for k in 0..3 {
            assert!((pole_icrf[k] - want[k]).abs() < 1e-12, "pole[{k}]");
        }
        assert!((norm(pole_icrf) - 1.0).abs() < 1e-12);
        assert!((dot(pole_icrf, want) - 1.0).abs() < 1e-12);
    }
}
