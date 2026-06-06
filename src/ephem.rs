// SPDX-License-Identifier: Apache-2.0
//! Built-in **low-precision analytical ephemerides** for the third-body perturbing bodies, so
//! the numerical propagator's third-body force ([`crate::forces::third_body_accel`]) needs no
//! external DE/SPK kernel for a low-fidelity run.
//!
//! The Sun model is the closed-form series of Montenbruck & Gill, *Satellite Orbits*
//! (§3.3.2), accurate to ~0.005° in geocentric ecliptic longitude and ~few·10⁻⁴ AU in
//! distance over a few decades around J2000 — adequate for the third-body *perturbation* on a
//! near-Earth orbit (itself only ~5·10⁻⁷ m/s²), where the body direction matters far more
//! than sub-arcsecond position. For DE405/DE440-grade positions (a high-fidelity run) an
//! external ephemeris kernel is the path; that, and the Moon's longer series, are follow-ons
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
}
