// SPDX-License-Identifier: AGPL-3.0-only
//! Two-part (high-precision) Julian dates.
//!
//! A Julian date held in a single `f64` carries ~15–16 significant digits, so near JD
//! 2 451 545 (J2000) the least significant bit is ~50 µs — too coarse for sub-µs timing,
//! phase, and frequency-transfer work. Splitting the date into an integer **day** part and
//! a fractional **frac** part (the SOFA / hifitime two-part convention) keeps the full
//! precision of the fraction regardless of the size of the day count, so differences of
//! nearby epochs are exact to the `f64` floor.

/// Seconds in a day.
const SEC_PER_DAY: f64 = 86_400.0;

/// A Julian date as an integer day plus a fractional remainder in `[0, 1)`.
/// `JD = day + frac`, but arithmetic keeps `frac` precise independent of `day`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Jd2 {
    /// Integer Julian day (the bulk of the magnitude).
    pub day: f64,
    /// Fractional day in `[0, 1)`.
    pub frac: f64,
}

impl Jd2 {
    /// Split a single-`f64` Julian date into its two-part form.
    pub fn new(jd: f64) -> Self {
        let day = jd.floor();
        Self {
            day,
            frac: jd - day,
        }
    }

    /// Construct from explicit parts, renormalising so `frac ∈ [0, 1)`.
    pub fn from_parts(day: f64, frac: f64) -> Self {
        let mut j = Self { day, frac };
        j.normalize();
        j
    }

    fn normalize(&mut self) {
        let carry = self.frac.floor();
        self.day += carry;
        self.frac -= carry;
    }

    /// Advance by `seconds` (which may be negative), keeping full precision.
    pub fn add_seconds(self, seconds: f64) -> Self {
        Self::from_parts(self.day, self.frac + seconds / SEC_PER_DAY)
    }

    /// The full Julian date as a single `f64` (loses sub-`f64`-floor precision for large
    /// day counts — use [`Jd2::diff_seconds`] when precision matters).
    pub fn total(self) -> f64 {
        self.day + self.frac
    }

    /// Difference `self − other` in seconds, computed part-by-part so a small difference of
    /// two large dates does not lose precision (the integer days cancel exactly).
    pub fn diff_seconds(self, other: Jd2) -> f64 {
        ((self.day - other.day) + (self.frac - other.frac)) * SEC_PER_DAY
    }
}

/// Gregorian calendar date `(year, month, day)` of the integer Julian day number `jdn`
/// (the Julian date of that day's noon), by the Fliegel and Van Flandern (1968) integer
/// algorithm.
fn calendar_of_jdn(jdn: i64) -> (i32, u32, u32) {
    let l = jdn + 68_569;
    let n = 4 * l / 146_097;
    let l = l - (146_097 * n + 3) / 4;
    let i = 4_000 * (l + 1) / 1_461_001;
    let l = l - 1_461 * i / 4 + 31;
    let j = 80 * l / 2_447;
    let day = l - 2_447 * j / 80;
    let l = j / 11;
    let month = j + 2 - 12 * l;
    let year = 100 * (n - 49) + i + l;
    (year as i32, month as u32, day as u32)
}

/// Integer Julian day number (the Julian date of noon) of a Gregorian calendar date, by the
/// Fliegel and Van Flandern (1968) integer algorithm.
fn jdn_of_calendar(year: i32, month: u32, day: u32) -> i64 {
    let (y, m, d) = (year as i64, month as i64, day as i64);
    let a = (m - 14) / 12;
    (1_461 * (y + 4_800 + a)) / 4 + (367 * (m - 2 - 12 * a)) / 12
        - (3 * ((y + 4_900 + a) / 100)) / 4
        + d
        - 32_075
}

/// TAI − UTC (s) in effect from 00:00 UTC of the day whose noon is Julian day number `jdn`
/// (the integer leap-second table of [`crate::timescales`], from 1972-01-01).
fn tai_minus_utc_on(jdn: i64) -> f64 {
    let (y, m, d) = calendar_of_jdn(jdn);
    crate::timescales::tai_minus_utc(crate::timescales::julian_date(y, m, d, 0, 0, 0.0))
}

/// Length in seconds of the UTC day whose noon is Julian day number `jdn`: 86 400 s, plus
/// the leap second inserted at its end (86 401 s) or minus one removed.
fn utc_day_length_s(jdn: i64) -> f64 {
    SEC_PER_DAY + tai_minus_utc_on(jdn + 1) - tai_minus_utc_on(jdn)
}

/// The UTC day of a two-part quasi Julian date: its Julian day number and the fraction of
/// that day elapsed since 00:00 UTC, in `[0, 1)`.
fn utc_day_and_fraction(jd: Jd2) -> (i64, f64) {
    if jd.frac >= 0.5 {
        (jd.day as i64 + 1, jd.frac - 0.5)
    } else {
        (jd.day as i64, jd.frac + 0.5)
    }
}

impl Jd2 {
    /// A UTC calendar date and time as a two-part UTC quasi Julian date, with the
    /// convention of SOFA (Standards of Fundamental Astronomy) `iauDtf2d` for days that end in
    /// a leap second: such a day is 86 401 s long, `23:59:60.x` is a valid time, and the
    /// fraction of the day is counted in units of its own length. Scope: UTC from 1972-01-01
    /// (the integer leap-second era); the earlier drifting-rate UTC is not modelled.
    ///
    /// Errors on a month, day, hour or minute out of range, or a second outside `[0, 60)`
    /// (`[0, 61)` in the last minute of a day that ends in a leap second).
    pub fn from_utc_calendar(
        year: i32,
        month: u32,
        day: u32,
        hour: u32,
        minute: u32,
        second: f64,
    ) -> Result<Self, String> {
        if !(1..=12).contains(&month) || day == 0 || day > 31 || hour > 23 || minute > 59 {
            return Err(format!(
                "UTC calendar date out of range: {year}-{month}-{day} {hour}:{minute}"
            ));
        }
        let jdn = jdn_of_calendar(year, month, day);
        if calendar_of_jdn(jdn) != (year, month, day) {
            return Err(format!("no such calendar date: {year}-{month}-{day}"));
        }
        let length = utc_day_length_s(jdn);
        let last_minute = hour == 23 && minute == 59;
        let second_limit = if last_minute {
            60.0 + (length - SEC_PER_DAY)
        } else {
            60.0
        };
        if !(0.0..second_limit).contains(&second) {
            return Err(format!(
                "UTC second {second} out of range at {hour}:{minute}"
            ));
        }
        let elapsed = 60.0 * (60.0 * hour as f64 + minute as f64) + second;
        // 00:00 UTC of the day is Julian date (jdn - 1) + 0.5.
        Ok(Self::from_parts((jdn - 1) as f64, 0.5 + elapsed / length))
    }
}

/// UTC (a two-part quasi Julian date, the [`Jd2::from_utc_calendar`] convention) to TAI
/// (International Atomic Time), the convention of SOFA `iauUtctai`: the fraction of a
/// leap-second day is scaled by that day's 86 401 s length before TAI − UTC is added.
pub fn utc_to_tai(utc: Jd2) -> Jd2 {
    let (jdn, fd) = utc_day_and_fraction(utc);
    let elapsed = fd * utc_day_length_s(jdn);
    Jd2::from_parts(
        (jdn - 1) as f64,
        0.5 + (elapsed + tai_minus_utc_on(jdn)) / SEC_PER_DAY,
    )
}

/// TAI to the UTC quasi Julian date, inverting [`utc_to_tai`] by the fixed-point iteration
/// of SOFA `iauTaiutc` (three corrections, each the TAI residual of the current guess).
pub fn tai_to_utc(tai: Jd2) -> Jd2 {
    let mut guess = tai;
    for _ in 0..3 {
        let back = utc_to_tai(guess);
        guess = Jd2::from_parts(
            guess.day + (tai.day - back.day),
            guess.frac + (tai.frac - back.frac),
        );
    }
    guess
}

/// TT (Terrestrial Time) from TAI: TT = TAI + 32.184 s exactly.
pub fn tai_to_tt(tai: Jd2) -> Jd2 {
    tai.add_seconds(crate::timescales::TT_MINUS_TAI)
}

/// The Earth rotation angle (rad, in `[0, 2π)`) at a two-part UT1 Julian date, the IAU 2000
/// expression of SOFA `iauEra00` evaluated on the two parts so the angle keeps the
/// microsecond a single-`f64` Julian date would lose (about 3e-9 rad of rotation).
pub fn earth_rotation_angle(ut1: Jd2) -> f64 {
    let t = (ut1.day - crate::timescales::JD_J2000) + ut1.frac;
    let turns = ut1.frac + crate::timescales::ERA_TURNS_AT_J2000 + 0.002_737_811_911_354_48 * t;
    std::f64::consts::TAU * turns.rem_euclid(1.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn round_trips_a_single_f64_date() {
        let jd = 2_451_545.523_4;
        let j = Jd2::new(jd);
        assert_eq!(j.day, 2_451_545.0);
        // The fraction only carries the input's own f64 precision (~1e-9 at JD 2.45e6) —
        // which is exactly the coarseness this two-part form exists to escape.
        assert!((j.frac - 0.523_4).abs() < 1e-9);
        assert!((j.total() - jd).abs() < 1e-9);
    }

    #[test]
    fn from_parts_normalizes_the_fraction() {
        let j = Jd2::from_parts(2_451_545.0, 1.25); // 1.25 days of fraction
        assert_eq!(j.day, 2_451_546.0);
        assert!((j.frac - 0.25).abs() < 1e-15);
        let k = Jd2::from_parts(2_451_545.0, -0.25);
        assert_eq!(k.day, 2_451_544.0);
        assert!((k.frac - 0.75).abs() < 1e-15);
    }

    #[test]
    fn preserves_microsecond_precision_a_single_f64_loses() {
        // One microsecond at J2000.
        let t0 = Jd2::new(2_451_545.0);
        let t1 = t0.add_seconds(1.0e-6);
        // The two-part difference recovers the microsecond exactly…
        assert!(
            (t1.diff_seconds(t0) - 1.0e-6).abs() < 1e-15,
            "Δ = {}",
            t1.diff_seconds(t0)
        );
        // …whereas the naive single-f64 JD round-trip cannot resolve it near 2.45e6.
        let naive = (2_451_545.0_f64 + 1.0e-6 / SEC_PER_DAY) - 2_451_545.0;
        assert!(
            (naive * SEC_PER_DAY - 1.0e-6).abs() > 1.0e-7,
            "single-f64 unexpectedly kept the µs: {}",
            naive * SEC_PER_DAY
        );
    }

    #[test]
    fn add_seconds_is_additive_and_reversible() {
        let t = Jd2::new(2_460_000.0);
        let forward = t.add_seconds(3600.0).add_seconds(-3600.0);
        assert!(forward.diff_seconds(t).abs() < 1e-9);
        // A day of seconds advances the day count by one.
        let plus_day = t.add_seconds(SEC_PER_DAY);
        assert_eq!(plus_day.day, 2_460_001.0);
        assert!(plus_day.frac.abs() < 1e-9);
    }

    #[test]
    fn a_leap_second_day_is_86401_seconds_long_and_tai_steps_once() {
        // 2016-12-31 ended in a leap second: 23:59:60.5 is valid, 00:00:60 is not.
        let a = Jd2::from_utc_calendar(2016, 12, 31, 23, 59, 60.5).unwrap();
        assert!(Jd2::from_utc_calendar(2016, 12, 30, 23, 59, 60.5).is_err());
        assert!(Jd2::from_utc_calendar(2017, 2, 29, 0, 0, 0.0).is_err());
        let b = Jd2::from_utc_calendar(2017, 1, 1, 0, 0, 0.0).unwrap();
        // TAI advances 0.5 s from 23:59:60.5 to the next midnight; TAI - UTC goes 36 -> 37 s.
        let (ta, tb) = (utc_to_tai(a), utc_to_tai(b));
        assert!((tb.diff_seconds(ta) - 0.5).abs() < 1e-9);
        let noon = Jd2::from_utc_calendar(2017, 1, 1, 12, 0, 0.0).unwrap();
        assert_eq!((noon.day, noon.frac), (2_457_755.0, 0.0));
        assert!((utc_to_tai(noon).diff_seconds(noon) - 37.0).abs() < 1e-9);
    }

    #[test]
    fn tai_to_utc_inverts_utc_to_tai_to_the_microsecond_across_a_leap_second() {
        for s in [59.0, 59.999_999, 60.0, 60.5, 60.999_999] {
            let u = Jd2::from_utc_calendar(2015, 6, 30, 23, 59, s).unwrap();
            let back = tai_to_utc(utc_to_tai(u));
            assert!(
                back.diff_seconds(u).abs() < 1e-6,
                "{s}: {}",
                back.diff_seconds(u)
            );
        }
    }

    #[test]
    fn the_two_part_earth_rotation_angle_matches_the_single_f64_one() {
        let ut1 = Jd2::from_parts(2_460_000.0, 0.273_4);
        let a = earth_rotation_angle(ut1);
        let b = crate::timescales::earth_rotation_angle(ut1.total());
        let d =
            (a - b + std::f64::consts::PI).rem_euclid(std::f64::consts::TAU) - std::f64::consts::PI;
        assert!(d.abs() < 1e-8, "{d}");
    }
}
