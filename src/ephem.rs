// SPDX-License-Identifier: AGPL-3.0-only
//! Built-in **low-precision analytical ephemerides** for the third-body perturbing bodies, so
//! the numerical propagator's third-body force ([`crate::forces::third_body_accel`]) needs no
//! external DE/SPK kernel for a low-fidelity run.
//!
//! Both models are the closed-form series of Montenbruck & Gill, *Satellite Orbits* (§3.3.2):
//! the Sun to ~0.005° in geocentric ecliptic longitude and ~few·10⁻⁴ AU in distance, the Moon
//! to ~0.3° / ~few·10² km over a few decades around J2000. That is ample for the third-body
//! *perturbation* on a near-Earth orbit (only ~5·10⁻⁷ m/s² for the Sun, ~1·10⁻⁶ m/s² for the
//! Moon), where the body direction matters far more than sub-arcsecond position. For
//! DE405/DE440-grade positions (a high-fidelity run) an external ephemeris kernel is the path
//! (see `ROADMAP.md`).
//!
//! Positions are returned in metres in the **geocentric mean-equator/equinox of date** frame,
//! a close approximation to the ECI frame the propagator integrates in (the
//! precession/nutation difference is well below the model's own truncation error).

type Vec3 = [f64; 3];

/// J2000.0 mean obliquity of the ecliptic (rad), `23.43929111°`.
const OBLIQUITY_J2000: f64 = 23.439_291_11 * std::f64::consts::PI / 180.0;
/// One astronomical unit (m), IAU 2012 definition — for reference/scale.
pub const AU_M: f64 = 1.495_978_707e11;

/// Geocentric Sun position (m, mean-equator/equinox of date) from the Montenbruck & Gill
/// low-precision series. `t_tt_jc` is the time in Julian centuries of Terrestrial Time since
/// J2000.0 (`(JD_TT − 2451545.0) / 36525`).
pub fn sun_position(t_tt_jc: f64) -> Vec3 {
    let deg = std::f64::consts::PI / 180.0;
    let t = t_tt_jc;
    // Solar mean anomaly (deg → rad).
    let m = (357.5256 + 35999.049 * t) * deg;
    // Geocentric ecliptic longitude (the 6892″ and 72″ terms are the equation of centre).
    let lambda = (282.94) * deg + m + (6892.0 * m.sin() + 72.0 * (2.0 * m).sin()) * (deg / 3600.0);
    // Geocentric distance (m): 1 AU modulated by the Earth's orbital eccentricity.
    let r = (149.619 - 2.499 * m.cos() - 0.021 * (2.0 * m).cos()) * 1e9;
    // Ecliptic → equatorial rotation about the x-axis by the obliquity.
    let (sl, cl) = lambda.sin_cos();
    let (se, ce) = OBLIQUITY_J2000.sin_cos();
    [r * cl, r * sl * ce, r * sl * se]
}

/// Geocentric Moon position (m, mean-equator/equinox of date) from the Montenbruck & Gill
/// low-precision lunar series (§3.3.2). `t_tt_jc` is the time in Julian centuries of
/// Terrestrial Time since J2000.0. The series carries the dominant evection, variation and
/// annual-equation terms, so the geocentric distance respects the real perigee/apogee envelope
/// (~356 500–406 700 km) and the ecliptic latitude the lunar-orbit inclination (≤ ~5.3°).
pub fn moon_position(t_tt_jc: f64) -> Vec3 {
    let deg = std::f64::consts::PI / 180.0;
    let asec = deg / 3600.0; // one arcsecond in radians
    let t = t_tt_jc;
    // Fundamental arguments (mean longitude L0, Moon's anomaly l, Sun's anomaly lp, argument of
    // latitude f, mean elongation d), all in radians.
    let l0 = (218.31617 + 481_267.880_88 * t - 1.3972 * t) * deg;
    let l = (134.96292 + 477_198.867_53 * t) * deg;
    let lp = (357.52543 + 35_999.049_44 * t) * deg;
    let f = (93.27283 + 483_202.018_73 * t) * deg;
    let d = (297.85027 + 445_267.111_35 * t) * deg;

    // Ecliptic longitude: mean longitude plus the periodic series (coefficients in arcseconds).
    let dlon = 22640.0 * l.sin() + 769.0 * (2.0 * l).sin() - 4586.0 * (l - 2.0 * d).sin()
        + 2370.0 * (2.0 * d).sin()
        - 668.0 * lp.sin()
        - 412.0 * (2.0 * f).sin()
        - 212.0 * (2.0 * l - 2.0 * d).sin()
        - 206.0 * (l + lp - 2.0 * d).sin()
        + 192.0 * (l + 2.0 * d).sin()
        - 165.0 * (lp - 2.0 * d).sin()
        + 148.0 * (l - lp).sin()
        - 125.0 * d.sin()
        - 110.0 * (l + lp).sin()
        - 55.0 * (2.0 * f - 2.0 * d).sin();
    let lambda = l0 + dlon * asec;

    // Ecliptic latitude (the leading 18520″ ≈ 5.14° term carries the lunar inclination).
    let beta = 18520.0
        * (f + (lambda - l0) + (412.0 * (2.0 * f).sin() + 541.0 * lp.sin()) * asec).sin()
        - 526.0 * (f - 2.0 * d).sin()
        + 44.0 * (l + f - 2.0 * d).sin()
        - 31.0 * (-l + f - 2.0 * d).sin()
        - 23.0 * (lp + f - 2.0 * d).sin()
        + 11.0 * (-2.0 * l + f - 2.0 * d).sin()
        - 25.0 * (-2.0 * l + f).sin()
        + 21.0 * (-l + f).sin();
    let beta = beta * asec;

    // Geocentric distance (km → m).
    let r = (385_000.0
        - 20905.0 * l.cos()
        - 3699.0 * (2.0 * d - l).cos()
        - 2956.0 * (2.0 * d).cos()
        - 570.0 * (2.0 * l).cos()
        + 246.0 * (2.0 * l - 2.0 * d).cos()
        - 205.0 * (lp - 2.0 * d).cos()
        - 171.0 * (l + 2.0 * d).cos()
        - 152.0 * (l + lp - 2.0 * d).cos())
        * 1e3;

    // Spherical ecliptic → Cartesian ecliptic → equatorial (rotate about x by the obliquity).
    let (sb, cb) = beta.sin_cos();
    let (sl, cl) = lambda.sin_cos();
    let (se, ce) = OBLIQUITY_J2000.sin_cos();
    let (xe, ye, ze) = (r * cb * cl, r * cb * sl, r * sb);
    [xe, ce * ye - se * ze, se * ye + ce * ze]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: Vec3) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    #[test]
    fn sun_is_at_perihelion_distance_near_j2000() {
        // J2000.0 (2000-01-01.5 TT) is ~2 days before the Earth's perihelion (~Jan 3), so the
        // Sun's geocentric distance is near the perihelion value ≈ 1.471·10¹¹ m (0.983 AU).
        let r = norm(sun_position(0.0));
        assert!(
            (1.469e11..1.473e11).contains(&r),
            "Sun distance at J2000 = {r} m (expected ~1.471e11, perihelion)"
        );
    }

    #[test]
    fn sun_declination_at_j2000_is_near_the_winter_solstice() {
        // J2000.0 is ~11 days after the December solstice, so the Sun is deep in the southern
        // sky: declination δ ≈ −23.0° (sin δ = z/r ≈ −0.39), just off the −23.44° extreme.
        let s = sun_position(0.0);
        let sin_dec = s[2] / norm(s);
        assert!(
            (-0.41..-0.37).contains(&sin_dec),
            "sin(Sun declination) at J2000 = {sin_dec} (expected ≈ −0.39)"
        );
    }

    #[test]
    fn sun_apparent_motion_is_about_one_degree_per_day() {
        // The Sun sweeps ~360°/365.25 d ≈ 0.986°/day along the ecliptic; near perihelion the
        // true (anomalistic) rate is a touch faster. The great-circle angle between successive
        // daily unit vectors measures it directly (the Sun's ecliptic latitude is ~0).
        let day = 1.0 / 36525.0; // one day in Julian centuries
        let u0 = sun_position(0.0);
        let u1 = sun_position(day);
        let dot = (u0[0] * u1[0] + u0[1] * u1[1] + u0[2] * u1[2]) / (norm(u0) * norm(u1));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            (0.90..1.10).contains(&ang),
            "Sun daily motion = {ang}°/day (expected ≈ 0.99–1.02 near perihelion)"
        );
    }

    #[test]
    fn sun_sweeps_a_quarter_circle_in_a_quarter_year() {
        // Over a quarter year (~91.3 days) the Sun advances ~90° — validates the series over a
        // longer arc, not just the local rate.
        let quarter = 91.31 / 36525.0;
        let u0 = sun_position(0.0);
        let uq = sun_position(quarter);
        let dot = (u0[0] * uq[0] + u0[1] * uq[1] + u0[2] * uq[2]) / (norm(u0) * norm(uq));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            (85.0..95.0).contains(&ang),
            "Sun moved {ang}° in a quarter year (expected ≈ 90°)"
        );
    }

    #[test]
    fn sun_distance_stays_within_the_earth_orbit_bounds_over_a_year() {
        // Across a full year the geocentric distance must stay inside the perihelion/aphelion
        // envelope (0.983–1.017 AU ≈ 1.470e11–1.521e11 m) — a guard against a runaway series.
        for k in 0..366 {
            let t = (k as f64) / 36525.0;
            let r = norm(sun_position(t));
            assert!(
                (1.468e11..1.523e11).contains(&r),
                "Sun distance {r} m at day {k} outside Earth-orbit bounds"
            );
        }
    }

    // ---- Moon ---------------------------------------------------------------------------

    #[test]
    fn moon_distance_stays_within_the_perigee_apogee_envelope_over_a_month() {
        // The geocentric Moon distance oscillates between perigee ≈ 356 500 km and apogee
        // ≈ 406 700 km. Over a full synodic-ish month every sample must land inside a band that
        // brackets those physical extremes — a guard against a mis-summed distance series.
        for k in 0..30 {
            let t = (k as f64) / 36525.0;
            let r = norm(moon_position(t));
            assert!(
                (3.50e8..4.10e8).contains(&r),
                "Moon distance {r} m at day {k} outside the perigee/apogee envelope"
            );
        }
    }

    #[test]
    fn moon_mean_distance_over_a_month_is_the_textbook_semi_major_axis() {
        // Averaged over a month the periodic terms cancel and the mean geocentric distance must
        // recover the textbook ~384 400 km lunar semi-major axis.
        let mut sum = 0.0;
        let n = 240; // ~ every 3 h over 30 days
        for k in 0..n {
            let t = (k as f64) * (30.0 / n as f64) / 36525.0;
            sum += norm(moon_position(t));
        }
        let mean = sum / n as f64;
        assert!(
            (3.80e8..3.89e8).contains(&mean),
            "Moon mean distance {mean} m (expected ≈ 3.844e8, the lunar semi-major axis)"
        );
    }

    #[test]
    fn moon_never_strays_beyond_the_lunar_orbit_inclination_from_the_ecliptic() {
        // The Moon's ecliptic latitude is bounded by the orbital inclination (~5.14°) plus the
        // periodic terms (≤ ~0.2°), so |β| ≤ ~5.35°. Project each position onto the ecliptic-pole
        // direction n = (0, −sinε, cosε) in equatorial coordinates and check the latitude bound —
        // this validates the latitude series *and* the ecliptic→equatorial rotation together.
        let (se, ce) = OBLIQUITY_J2000.sin_cos();
        let n = [0.0, -se, ce];
        for k in 0..60 {
            let t = (k as f64) * 0.5 / 36525.0; // every 12 h for a month
            let p = moon_position(t);
            let r = norm(p);
            let sin_lat = (p[0] * n[0] + p[1] * n[1] + p[2] * n[2]) / r;
            let lat = sin_lat.clamp(-1.0, 1.0).asin().to_degrees();
            assert!(
                lat.abs() <= 5.4,
                "Moon ecliptic latitude {lat}° at day {} exceeds the lunar-orbit inclination",
                k / 2
            );
        }
    }

    #[test]
    fn moon_returns_to_the_same_direction_after_one_sidereal_month() {
        // After one sidereal month (27.3217 d) the Moon's *direction* returns to within a degree:
        // the mean longitude advances exactly 360° (its rate is 481267.88°/cy = 13.176°/d), and
        // the periodic terms nearly repeat. This validates the sidereal period embedded in the
        // mean-longitude rate, not just the local motion.
        let sidereal = 27.321_7 / 36525.0;
        let u0 = moon_position(0.0);
        let u1 = moon_position(sidereal);
        let dot = (u0[0] * u1[0] + u0[1] * u1[1] + u0[2] * u1[2]) / (norm(u0) * norm(u1));
        let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
        assert!(
            ang < 2.0,
            "Moon direction moved {ang}° over one sidereal month (expected ≈ 0, a return)"
        );
    }

    #[test]
    fn moon_daily_motion_stays_in_the_physical_lunar_band() {
        // The Moon sweeps ~360°/27.32 d ≈ 13.18°/day on average, varying ~12–15°/day with the
        // anomalistic distance. Every daily great-circle step must fall in that physical band —
        // distinguishing genuine lunar motion from a solar-rate or runaway series.
        let day = 1.0 / 36525.0;
        for k in 0..27 {
            let t0 = (k as f64) * day;
            let p0 = moon_position(t0);
            let p1 = moon_position(t0 + day);
            let dot = (p0[0] * p1[0] + p0[1] * p1[1] + p0[2] * p1[2]) / (norm(p0) * norm(p1));
            let ang = dot.clamp(-1.0, 1.0).acos().to_degrees();
            assert!(
                (11.0..16.0).contains(&ang),
                "Moon daily motion {ang}°/day at day {k} outside the physical 12–15°/day band"
            );
        }
    }

    #[test]
    fn lunar_third_body_perturbation_on_leo_has_the_textbook_magnitude() {
        // The Moon's tidal perturbation on a LEO satellite is ~2·GM_moon·r/d³
        // = 2·4.903e12·6.6e6/(3.84e8)³ ≈ 1.1·10⁻⁶ m/s² — roughly twice the Sun's. Drive the
        // body-agnostic third-body accel with the new lunar ephemeris and check that band.
        use crate::forces::{third_body_accel, MU_MOON};
        let r = [6.6e6, 0.0, 0.0];
        let a = norm(third_body_accel(r, moon_position(0.0), MU_MOON));
        assert!(
            (4.0e-7..2.5e-6).contains(&a),
            "Lunar perturbation on LEO = {a} m/s² (expected ≈ 1.1e-6)"
        );
    }
}
