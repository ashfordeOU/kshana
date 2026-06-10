// SPDX-License-Identifier: Apache-2.0
//! Time scales and the Julian-date API.
//!
//! A small, dependency-free foundation for the astronomical time scales that
//! frame reduction needs: the Julian Date, the leap-second relationship between
//! UTC and TAI, the fixed TAI→TT offset, the UT1 small-angle correction, and the
//! IAU-2000 Earth Rotation Angle. All conversions are between *instants*
//! expressed as Julian Dates in the named scale (e.g. a "JD in UTC").
//!
//! References:
//! - Meeus, *Astronomical Algorithms* (2nd ed.), ch. 7 (Julian Day).
//! - IERS Conventions (2010); the leap-second history is IERS Bulletin C.
//! - IAU 2000 resolution B1.8: Earth Rotation Angle
//!   `theta(Tu) = 2*pi*(0.7790572732640 + 1.00273781191135448 * Tu)`,
//!   `Tu = JD(UT1) - 2451545.0`.
//!
//! Precision note: instants are carried as a single `f64` Julian Date. Near the
//! present epoch (JD ~2.46e6) that gives ~50 microseconds of resolution
//! (`eps(2.46e6) ≈ 5e-5 s`), which is ample for frame reduction and the
//! sub-millisecond timing this engine reports, but means a *difference* of two
//! scales (e.g. TT−UTC) recovered by subtracting JDs is only good to ~1e-4 s.
//! A two-part (integer day + fraction) JD would remove that floor; it is on the
//! roadmap and not needed at the current fidelity.
//!
//! Scope (honest): the integer-second leap history is modelled from 1972-01-01
//! onward (the modern UTC step regime). Dates before 1972 used a different
//! rubber-second scheme that is **not** modelled — `tai_minus_utc` clamps to the
//! 1972 value there. UT1−UTC (DUT1) is an observed quantity supplied by the
//! caller (IERS Bulletin A/B); it is not predicted here.

/// Julian Date of the J2000.0 epoch (2000-01-01 12:00:00 TT).
pub const JD_J2000: f64 = 2_451_545.0;
/// Offset between Julian Date and Modified Julian Date: `MJD = JD - 2400000.5`.
pub const MJD_OFFSET: f64 = 2_400_000.5;
/// TT − TAI, a defined constant (seconds).
pub const TT_MINUS_TAI: f64 = 32.184;
/// Seconds in a day.
pub const SECONDS_PER_DAY: f64 = 86_400.0;

// Earth Rotation Angle coefficients, IAU 2000 resolution B1.8. The literals are
// quoted at the full published precision (more digits than f64 represents) for
// provenance; they round to the nearest representable value on use.
#[allow(clippy::excessive_precision)]
pub const ERA_TURNS_AT_J2000: f64 = 0.7790572732640;
#[allow(clippy::excessive_precision)]
pub const ERA_TURNS_PER_UT1_DAY: f64 = 1.00273781191135448;

/// Convert a Gregorian civil date and time of day to a Julian Date. The result
/// is the JD of that instant *in whatever scale the civil fields are expressed*
/// (this routine is purely calendrical). Valid for Gregorian dates (1582-10-15
/// onward); inputs are not range-checked beyond what the algorithm requires.
///
/// Algorithm: Meeus eq. 7.1 with the Gregorian century correction.
pub fn julian_date(year: i32, month: u32, day: u32, hour: u32, minute: u32, second: f64) -> f64 {
    let (y, m) = if month <= 2 {
        (year - 1, month as i32 + 12)
    } else {
        (year, month as i32)
    };
    let a = (y as f64 / 100.0).floor();
    let b = 2.0 - a + (a / 4.0).floor();
    let day_fraction =
        day as f64 + (hour as f64 * 3600.0 + minute as f64 * 60.0 + second) / SECONDS_PER_DAY;
    (365.25 * (y as f64 + 4716.0)).floor() + (30.6001 * (m as f64 + 1.0)).floor() + day_fraction + b
        - 1524.5
}

/// A civil date/time broken out from a Julian Date.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CivilTime {
    pub year: i32,
    pub month: u32,
    pub day: u32,
    pub hour: u32,
    pub minute: u32,
    pub second: f64,
}

/// Inverse of [`julian_date`]: recover the Gregorian civil date/time from a
/// Julian Date (Meeus ch. 7). The returned fields are in the same scale as the
/// input JD.
pub fn civil_from_jd(jd: f64) -> CivilTime {
    let jd2 = jd + 0.5;
    let z = jd2.floor();
    let f = jd2 - z;
    let a = if z < 2_299_161.0 {
        z
    } else {
        let alpha = ((z - 1_867_216.25) / 36_524.25).floor();
        z + 1.0 + alpha - (alpha / 4.0).floor()
    };
    let b = a + 1524.0;
    let c = ((b - 122.1) / 365.25).floor();
    let d = (365.25 * c).floor();
    let e = ((b - d) / 30.6001).floor();
    let day_with_frac = b - d - (30.6001 * e).floor() + f;
    let day = day_with_frac.floor();
    let month = if e < 14.0 { e - 1.0 } else { e - 13.0 };
    let year = if month > 2.0 { c - 4716.0 } else { c - 4715.0 };

    let mut secs = (day_with_frac - day) * SECONDS_PER_DAY;
    // Guard against a tiny negative from rounding right at midnight.
    if secs < 0.0 {
        secs = 0.0;
    }
    let hour = (secs / 3600.0).floor();
    secs -= hour * 3600.0;
    let minute = (secs / 60.0).floor();
    secs -= minute * 60.0;
    CivilTime {
        year: year as i32,
        month: month as u32,
        day: day as u32,
        hour: hour as u32,
        minute: minute as u32,
        second: secs,
    }
}

/// Modified Julian Date from Julian Date.
pub fn mjd_from_jd(jd: f64) -> f64 {
    jd - MJD_OFFSET
}

/// The modern leap-second history as `(year, month, day, TAI-UTC seconds)`, each
/// row the integer value of TAI−UTC that takes effect at 00:00:00 UTC on that
/// date. Source: IERS Bulletin C (UTC-TAI history). Current value 37 s since
/// 2017-01-01.
const LEAP_TABLE: &[(i32, u32, u32, f64)] = &[
    (1972, 1, 1, 10.0),
    (1972, 7, 1, 11.0),
    (1973, 1, 1, 12.0),
    (1974, 1, 1, 13.0),
    (1975, 1, 1, 14.0),
    (1976, 1, 1, 15.0),
    (1977, 1, 1, 16.0),
    (1978, 1, 1, 17.0),
    (1979, 1, 1, 18.0),
    (1980, 1, 1, 19.0),
    (1981, 7, 1, 20.0),
    (1982, 7, 1, 21.0),
    (1983, 7, 1, 22.0),
    (1985, 7, 1, 23.0),
    (1988, 1, 1, 24.0),
    (1990, 1, 1, 25.0),
    (1991, 1, 1, 26.0),
    (1992, 7, 1, 27.0),
    (1993, 7, 1, 28.0),
    (1994, 7, 1, 29.0),
    (1996, 1, 1, 30.0),
    (1997, 7, 1, 31.0),
    (1999, 1, 1, 32.0),
    (2006, 1, 1, 33.0),
    (2009, 1, 1, 34.0),
    (2012, 7, 1, 35.0),
    (2015, 7, 1, 36.0),
    (2017, 1, 1, 37.0),
];

/// TAI − UTC (seconds) at a given instant expressed as a JD in UTC. Returns the
/// value of the latest leap-second entry in effect at that instant. For dates
/// before 1972-01-01 (outside the modern integer-leap regime) this clamps to the
/// first tabulated value (10 s) — pre-1972 UTC is not modelled.
pub fn tai_minus_utc(jd_utc: f64) -> f64 {
    let mut secs = LEAP_TABLE[0].3;
    for &(y, m, d, s) in LEAP_TABLE {
        let jd_entry = julian_date(y, m, d, 0, 0, 0.0);
        if jd_utc >= jd_entry {
            secs = s;
        } else {
            break;
        }
    }
    secs
}

/// JD(TAI) from JD(UTC), inserting the leap-second offset.
pub fn utc_to_tai(jd_utc: f64) -> f64 {
    jd_utc + tai_minus_utc(jd_utc) / SECONDS_PER_DAY
}

/// JD(TT) from JD(TAI): TT = TAI + 32.184 s exactly.
pub fn tai_to_tt(jd_tai: f64) -> f64 {
    jd_tai + TT_MINUS_TAI / SECONDS_PER_DAY
}

/// JD(TT) from JD(UTC) via TAI.
pub fn utc_to_tt(jd_utc: f64) -> f64 {
    tai_to_tt(utc_to_tai(jd_utc))
}

/// TAI − GPS time is a fixed 19 s (GPS time has carried no leap seconds since its
/// 1980-01-06 epoch, where it coincided with UTC; TAI − UTC was 19 s then).
pub const TAI_MINUS_GPS: f64 = 19.0;

/// JD(TT) from a GPS-time Julian Date: TT = GPS + (TAI − GPS) + (TT − TAI) = GPS + 51.184 s.
/// SP3 epochs are stamped in GPS time; integration runs in TT.
pub fn gps_to_tt(jd_gps: f64) -> f64 {
    jd_gps + (TAI_MINUS_GPS + TT_MINUS_TAI) / SECONDS_PER_DAY
}

/// JD(UT1) from JD(UTC) given the observed UT1−UTC (DUT1, seconds, |DUT1| < 0.9).
/// DUT1 comes from IERS Bulletin A/B; it cannot be derived from civil time.
pub fn utc_to_ut1(jd_utc: f64, dut1_seconds: f64) -> f64 {
    jd_utc + dut1_seconds / SECONDS_PER_DAY
}

/// Earth Rotation Angle (radians, in [0, 2*pi)) for a JD in UT1, per IAU 2000
/// resolution B1.8. ERA is the modern replacement for Greenwich Mean Sidereal
/// Time as the link between UT1 and the rotational orientation of the Earth.
pub fn earth_rotation_angle(jd_ut1: f64) -> f64 {
    let tu = jd_ut1 - JD_J2000;
    let turns = ERA_TURNS_AT_J2000 + ERA_TURNS_PER_UT1_DAY * tu;
    let frac = turns - turns.floor(); // reduce to [0, 1) turns
    2.0 * std::f64::consts::PI * frac
}

#[cfg(test)]
mod tests {
    use super::*;

    const EPS_JD: f64 = 1e-9; // ~1e-4 s

    #[test]
    fn j2000_epoch_is_2451545() {
        // J2000.0 = 2000-01-01 12:00:00.
        assert!((julian_date(2000, 1, 1, 12, 0, 0.0) - JD_J2000).abs() < EPS_JD);
        // Midnight that day is half a day earlier.
        assert!((julian_date(2000, 1, 1, 0, 0, 0.0) - 2_451_544.5).abs() < EPS_JD);
    }

    #[test]
    fn known_julian_dates() {
        // Meeus worked examples / standard references.
        assert!((julian_date(1957, 10, 4, 19, 26, 24.0) - 2_436_116.31).abs() < 1e-2); // Sputnik 1
        assert!((julian_date(2000, 1, 1, 0, 0, 0.0) - 2_451_544.5).abs() < EPS_JD);
        assert!((julian_date(1999, 1, 1, 0, 0, 0.0) - 2_451_179.5).abs() < EPS_JD);
        assert!((julian_date(1987, 1, 27, 0, 0, 0.0) - 2_446_822.5).abs() < EPS_JD);
        // MJD of the MJD epoch (1858-11-17) is 0.
        assert!(mjd_from_jd(julian_date(1858, 11, 17, 0, 0, 0.0)).abs() < EPS_JD);
    }

    #[test]
    fn julian_date_round_trips_through_civil() {
        for &(y, mo, d, h, mi, s) in &[
            (2000, 1, 1, 12, 0, 0.0),
            (2026, 6, 2, 17, 45, 30.0),
            (1972, 1, 1, 0, 0, 0.0),
            (1999, 12, 31, 23, 59, 59.0),
            (2024, 2, 29, 6, 30, 0.0), // leap day
        ] {
            let jd = julian_date(y, mo, d, h, mi, s);
            let c = civil_from_jd(jd);
            assert_eq!(
                (c.year, c.month, c.day, c.hour, c.minute),
                (y, mo, d, h, mi)
            );
            assert!(
                (c.second - s).abs() < 1e-3,
                "second mismatch for {y}-{mo}-{d}: {} vs {s}",
                c.second
            );
        }
    }

    #[test]
    fn leap_seconds_match_iers_history() {
        let at = |y, m, d| tai_minus_utc(julian_date(y, m, d, 0, 0, 0.0));
        assert_eq!(at(1972, 1, 1), 10.0);
        assert_eq!(at(1999, 1, 1), 32.0);
        assert_eq!(at(2006, 1, 1), 33.0);
        assert_eq!(at(2009, 1, 1), 34.0);
        assert_eq!(at(2015, 7, 1), 36.0);
        assert_eq!(at(2017, 1, 1), 37.0);
        assert_eq!(at(2026, 6, 2), 37.0); // current
                                          // Just before a step still reports the old value.
        assert_eq!(at(2016, 12, 31), 36.0);
        // Mid-1998 (after Jan-1996 step, before Jul-1997... actually 31 since 1997-07).
        assert_eq!(at(1998, 6, 1), 31.0);
        // Pre-1972 clamps to the first tabulated value (not modelled).
        assert_eq!(at(1970, 1, 1), 10.0);
    }

    #[test]
    fn tt_minus_utc_is_leap_plus_offset() {
        // TT − UTC = (TAI − UTC) + 32.184 s. In 2020, TAI−UTC = 37 s.
        let jd_utc = julian_date(2020, 1, 1, 0, 0, 0.0);
        let tt = utc_to_tt(jd_utc);
        let delta_s = (tt - jd_utc) * SECONDS_PER_DAY;
        // ~1e-4 s reflects the single-f64 JD resolution near 2020 (see module note).
        assert!(
            (delta_s - (37.0 + 32.184)).abs() < 1e-4,
            "TT-UTC = {delta_s}"
        );
        // TT − TAI is the defined constant (recovered to the single-f64 JD floor).
        let jd_tai = utc_to_tai(jd_utc);
        assert!(((tai_to_tt(jd_tai) - jd_tai) * SECONDS_PER_DAY - 32.184).abs() < 1e-4);
    }

    #[test]
    fn ut1_applies_dut1() {
        let jd_utc = julian_date(2020, 1, 1, 0, 0, 0.0);
        let dut1 = -0.1772; // example IERS value (seconds)
        let jd_ut1 = utc_to_ut1(jd_utc, dut1);
        // ~1e-4 s: single-f64 JD resolution near 2020 (see module note).
        assert!(((jd_ut1 - jd_utc) * SECONDS_PER_DAY - dut1).abs() < 1e-4);
    }

    #[test]
    fn era_at_j2000_matches_iau_value() {
        // ERA(J2000) = 2*pi * 0.7790572732640 rev = 4.894961212... rad ~ 280.46 deg.
        let era = earth_rotation_angle(JD_J2000);
        let expect = 2.0 * std::f64::consts::PI * ERA_TURNS_AT_J2000;
        assert!((era - expect).abs() < 1e-12, "ERA(J2000) = {era}");
        let deg = era.to_degrees();
        assert!((deg - 280.4606).abs() < 1e-3, "ERA(J2000) = {deg} deg");
    }

    #[test]
    fn era_advances_one_sidereal_turn_per_ut1_day() {
        // Over one UT1 day ERA advances by 1.00273781191135448 revolutions, so the
        // net change modulo a full turn is the sidereal excess.
        let jd = JD_J2000 + 100.0;
        let d0 = earth_rotation_angle(jd);
        let d1 = earth_rotation_angle(jd + 1.0);
        let two_pi = 2.0 * std::f64::consts::PI;
        let mut delta = d1 - d0;
        if delta < 0.0 {
            delta += two_pi; // wrapped past 2*pi
        }
        let expect = two_pi * ERA_TURNS_PER_UT1_DAY.fract();
        assert!(
            (delta - expect).abs() < 1e-9,
            "daily ERA advance = {delta}, want {expect}"
        );
        // ERA is always reduced into [0, 2*pi).
        assert!((0.0..two_pi).contains(&d0) && (0.0..two_pi).contains(&d1));
    }
}
