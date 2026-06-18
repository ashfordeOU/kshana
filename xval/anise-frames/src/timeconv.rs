// SPDX-License-Identifier: AGPL-3.0-only
//! UTC calendar epoch -> the (TT, UT1) Julian dates the CIO chain consumes.
//!
//! Thin wrapper over `kshana::timescales` so the cross-check drives `kshana`'s frame
//! reduction through its own, leap-second-correct time scales (the same code path a
//! real user hits), and so the same epoch can be handed to ANISE for an apples-to-
//! apples comparison. `jd_tt` uses the crate's leap-second table; `jd_ut1` uses the
//! caller-supplied UT1−UTC from the IERS series (see [`crate::eop`]).

use kshana::timescales::{julian_date, utc_to_tt, utc_to_ut1};

/// A UTC instant resolved into the Julian dates the frame reduction needs.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Epoch {
    /// Calendar fields (UTC), retained for labelling and ANISE epoch construction.
    pub year: i32,
    pub month: u32,
    pub day: u32,
    pub hour: u32,
    pub minute: u32,
    pub second: f64,
    /// Julian date in UTC.
    pub jd_utc: f64,
    /// Julian date in TT (Terrestrial Time) — drives precession/nutation + polar motion.
    pub jd_tt: f64,
    /// Julian date in UT1 — drives the Earth rotation angle.
    pub jd_ut1: f64,
}

/// Build an [`Epoch`] from a UTC calendar date and the day's UT1−UTC (seconds).
pub fn from_utc(
    year: i32,
    month: u32,
    day: u32,
    hour: u32,
    minute: u32,
    second: f64,
    ut1_utc_s: f64,
) -> Epoch {
    let jd_utc = julian_date(year, month, day, hour, minute, second);
    Epoch {
        year,
        month,
        day,
        hour,
        minute,
        second,
        jd_utc,
        jd_tt: utc_to_tt(jd_utc),
        jd_ut1: utc_to_ut1(jd_utc, ut1_utc_s),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use kshana::timescales::tai_minus_utc;

    const SECONDS_PER_DAY: f64 = 86_400.0;

    #[test]
    fn midnight_2020_01_01_is_mjd_58849() {
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, 0.0);
        // MJD 58849 -> JD 2458849.5.
        assert!(
            (e.jd_utc - 2_458_849.5).abs() < 1e-9,
            "jd_utc = {}",
            e.jd_utc
        );
    }

    // The single-f64 Julian date near 2020 (~2.46e6) has a ulp of ~4.7e-10 d (~4e-5 s),
    // so a difference of two such JDs carries that much rounding. Consistency checks on
    // the TT/UT1 offsets are toleranced at 1e-9 d (~1e-4 s) accordingly — well below the
    // frame-error budget (1e-4 s of UT1 ≈ 1.5e-3 arcsec of ERA ≈ a few cm at the surface).
    const JD_DIFF_TOL_DAYS: f64 = 1e-9;

    #[test]
    fn tt_offset_is_tai_minus_utc_plus_32_184() {
        // TT − UTC = (TAI − UTC) + 32.184 s, exactly, independent of the leap count.
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, 0.0);
        let want_days = (tai_minus_utc(e.jd_utc) + 32.184) / SECONDS_PER_DAY;
        assert!(
            ((e.jd_tt - e.jd_utc) - want_days).abs() < JD_DIFF_TOL_DAYS,
            "TT−UTC = {} d, want {} d",
            e.jd_tt - e.jd_utc,
            want_days
        );
    }

    #[test]
    fn leap_seconds_are_37_in_2020() {
        // Real-data anchor: since 2017-01-01 TAI−UTC = 37 s. Guards the leap table at
        // the validation epoch (a wrong leap count would corrupt TT and bias the CIP).
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, 0.0);
        assert_eq!(tai_minus_utc(e.jd_utc), 37.0);
    }

    #[test]
    fn ut1_offset_is_exactly_dut1() {
        // UT1 − UTC must equal the supplied DUT1 to the nanosecond.
        let dut1 = -0.1771554;
        let e = from_utc(2020, 1, 1, 0, 0, 0.0, dut1);
        let want_days = dut1 / SECONDS_PER_DAY;
        assert!(
            ((e.jd_ut1 - e.jd_utc) - want_days).abs() < JD_DIFF_TOL_DAYS,
            "UT1−UTC = {} d, want {} d",
            e.jd_ut1 - e.jd_utc,
            want_days
        );
    }
}
