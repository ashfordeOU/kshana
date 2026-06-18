// SPDX-License-Identifier: AGPL-3.0-only
//! IERS Earth-orientation parameters from the official `finals2000A` product.
//!
//! The precise-orbit-determination harness (`precise_od.rs`) rotates between the
//! Earth-fixed (ITRS) frame the geopotential and SP3 observations live in and the
//! inertial (GCRS) frame it integrates in, through the validated IAU 2006/2000A CIO
//! chain in `cio.rs`. That chain needs three Earth-orientation quantities per epoch:
//! UT1−UTC (Earth-rotation phase) and the polar-motion pole `x_p`, `y_p`. This module
//! reads them from the IERS `finals2000A` series and serves them, interpolated, to the
//! frame rotation — replacing the nominal `UT1 = TT, x_p = y_p = 0` used for synthetic
//! self-recovery with the real values a precise real-data fit requires.
//!
//! Parses the fixed-column `finals.all.iau2000.txt` (a.k.a. `finals2000A.all`) format
//! published by the IERS Rapid Service. Column map (1-indexed, per the IERS
//! `readme.finals2000A`), verified against real rows:
//!
//! | field        | columns | 0-indexed slice |
//! |--------------|---------|-----------------|
//! | MJD          | 8–15    | `[7..15]`       |
//! | PM-x (arcsec)| 19–27   | `[18..27]`      |
//! | PM-y (arcsec)| 38–46   | `[37..46]`      |
//! | UT1−UTC (s)  | 59–68   | `[58..68]`      |

use crate::timescales::{tai_minus_utc, MJD_OFFSET, SECONDS_PER_DAY, TT_MINUS_TAI};

/// Arc seconds to radians (π / (180 · 3600)).
pub const ARCSEC_TO_RAD: f64 = std::f64::consts::PI / (180.0 * 3600.0);

/// One day of IERS Earth-orientation parameters.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct EopRecord {
    /// Modified Julian Date (UTC) of the entry.
    pub mjd: f64,
    /// UT1 − UTC, seconds.
    pub ut1_utc_s: f64,
    /// Polar-motion pole x, arc seconds.
    pub xp_arcsec: f64,
    /// Polar-motion pole y, arc seconds.
    pub yp_arcsec: f64,
}

/// Parse one `finals2000A` data line into an [`EopRecord`], or `None` if the line is
/// too short or the Bulletin A final fields are blank (a prediction-only / future row).
pub fn parse_line(line: &str) -> Option<EopRecord> {
    if line.len() < 68 {
        return None;
    }
    let mjd = line.get(7..15)?.trim().parse::<f64>().ok()?;
    let xp = line.get(18..27)?.trim().parse::<f64>().ok()?;
    let yp = line.get(37..46)?.trim().parse::<f64>().ok()?;
    let ut1 = line.get(58..68)?.trim().parse::<f64>().ok()?;
    Some(EopRecord {
        mjd,
        ut1_utc_s: ut1,
        xp_arcsec: xp,
        yp_arcsec: yp,
    })
}

/// Parse every readable Bulletin A final row from a `finals2000A` file body.
pub fn parse_all(body: &str) -> Vec<EopRecord> {
    body.lines().filter_map(parse_line).collect()
}

/// A time-ordered IERS Earth-orientation series, queried by epoch for the CIO frame
/// rotation. Records are sorted ascending by MJD at construction.
#[derive(Clone, Debug)]
pub struct EopSeries {
    records: Vec<EopRecord>,
}

impl EopSeries {
    /// Build from already-parsed records (sorted ascending by MJD).
    pub fn new(mut records: Vec<EopRecord>) -> Self {
        records.sort_by(|a, b| {
            a.mjd
                .partial_cmp(&b.mjd)
                .unwrap_or(std::cmp::Ordering::Equal)
        });
        Self { records }
    }

    /// Parse a `finals2000A` file body into a series.
    pub fn from_finals2000a(body: &str) -> Self {
        Self::new(parse_all(body))
    }

    /// Number of daily records.
    pub fn len(&self) -> usize {
        self.records.len()
    }

    /// True when no records parsed.
    pub fn is_empty(&self) -> bool {
        self.records.is_empty()
    }

    /// Linearly interpolate `(UT1−UTC [s], x_p [arcsec], y_p [arcsec])` at a UTC MJD,
    /// clamping to the endpoints outside the tabulated span.
    pub fn interp_utc_mjd(&self, mjd_utc: f64) -> (f64, f64, f64) {
        let r = &self.records;
        let tuple = |e: &EopRecord| (e.ut1_utc_s, e.xp_arcsec, e.yp_arcsec);
        match r.first() {
            None => (0.0, 0.0, 0.0),
            Some(first) if mjd_utc <= first.mjd => tuple(first),
            Some(_) => {
                let last = r.last().expect("non-empty");
                if mjd_utc >= last.mjd {
                    return tuple(last);
                }
                // Bracket: r[i-1].mjd < mjd_utc < r[i].mjd (clamps handled above).
                let i = r.partition_point(|e| e.mjd <= mjd_utc);
                let (lo, hi) = (&r[i - 1], &r[i]);
                let f = (mjd_utc - lo.mjd) / (hi.mjd - lo.mjd);
                let lerp = |a: f64, b: f64| a + f * (b - a);
                (
                    lerp(lo.ut1_utc_s, hi.ut1_utc_s),
                    lerp(lo.xp_arcsec, hi.xp_arcsec),
                    lerp(lo.yp_arcsec, hi.yp_arcsec),
                )
            }
        }
    }

    /// The CIO-frame rotation inputs `(jd_ut1, x_p [rad], y_p [rad])` for a TT Julian
    /// Date: convert TT→TAI→UTC (leap seconds), interpolate the EOP at that UTC, and
    /// form UT1 = UTC + (UT1−UTC).
    pub fn frame_args_tt(&self, jd_tt: f64) -> (f64, f64, f64) {
        let jd_tai = jd_tt - TT_MINUS_TAI / SECONDS_PER_DAY;
        // Leap seconds are piecewise-constant; one refinement step lands the argument
        // squarely inside the correct UTC day (TAI leads UTC by ~37 s).
        let leap0 = tai_minus_utc(jd_tai);
        let leap = tai_minus_utc(jd_tai - leap0 / SECONDS_PER_DAY);
        let jd_utc = jd_tai - leap / SECONDS_PER_DAY;
        let mjd_utc = jd_utc - MJD_OFFSET;
        let (dut1, xp_as, yp_as) = self.interp_utc_mjd(mjd_utc);
        let jd_ut1 = jd_utc + dut1 / SECONDS_PER_DAY;
        (jd_ut1, xp_as * ARCSEC_TO_RAD, yp_as * ARCSEC_TO_RAD)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::timescales::{julian_date, utc_to_tt, utc_to_ut1};

    // Real IERS finals2000A rows (Bulletin A final, flag `I`), MJD 59579 & 59580.
    const ROW_59579: &str = "211231 59579.00 I  0.056257 0.000030  0.275943 0.000035  I-0.1104179 0.0000019  0.1927 0.0016  I     0.073    0.060    -0.273    0.299  0.056304  0.275973 -0.1104355     0.040    -0.287  ";
    const ROW_59580: &str = "22 1 1 59580.00 I  0.054644 0.000026  0.276986 0.000032  I-0.1104988 0.0000023 -0.0267 0.0022  I     0.095    0.060    -0.250    0.299  0.054574  0.276983 -0.1105197     0.059    -0.259  ";

    fn two_day_series() -> EopSeries {
        EopSeries::from_finals2000a(&format!("{ROW_59579}\n{ROW_59580}\n"))
    }

    #[test]
    fn interp_returns_the_exact_entry_on_a_tabulated_day() {
        let s = two_day_series();
        let (ut1, xp, yp) = s.interp_utc_mjd(59580.0);
        assert!((ut1 - (-0.1104988)).abs() < 1e-12);
        assert!((xp - 0.054644).abs() < 1e-12);
        assert!((yp - 0.276986).abs() < 1e-12);
    }

    #[test]
    fn interp_is_the_midpoint_average_between_two_days() {
        let s = two_day_series();
        let (ut1, xp, yp) = s.interp_utc_mjd(59579.5);
        assert!((ut1 - 0.5 * (-0.1104179 - 0.1104988)).abs() < 1e-12);
        assert!((xp - 0.5 * (0.056257 + 0.054644)).abs() < 1e-12);
        assert!((yp - 0.5 * (0.275943 + 0.276986)).abs() < 1e-12);
    }

    #[test]
    fn interp_clamps_outside_the_tabulated_span() {
        let s = two_day_series();
        // below the first day → first entry; above the last → last entry.
        assert!((s.interp_utc_mjd(59000.0).0 - (-0.1104179)).abs() < 1e-12);
        assert!((s.interp_utc_mjd(60000.0).0 - (-0.1104988)).abs() < 1e-12);
    }

    #[test]
    fn frame_args_converts_tt_to_real_ut1_and_polar_motion() {
        let s = two_day_series();
        // 2022-01-01 00:00:00 UTC → MJD 59580 exactly.
        let jd_utc = julian_date(2022, 1, 1, 0, 0, 0.0);
        let jd_tt = utc_to_tt(jd_utc);
        let (jd_ut1, xp_rad, yp_rad) = s.frame_args_tt(jd_tt);
        // UT1 = UTC + (UT1-UTC); the EOP at this UTC is the 59580 row.
        assert!((jd_ut1 - utc_to_ut1(jd_utc, -0.1104988)).abs() < 1e-10);
        assert!((xp_rad - 0.054644 * ARCSEC_TO_RAD).abs() < 1e-15);
        assert!((yp_rad - 0.276986 * ARCSEC_TO_RAD).abs() < 1e-15);
    }

    #[test]
    fn parses_the_documented_columns_of_a_real_row() {
        let r = parse_line(ROW_59580).expect("row must parse");
        assert_eq!(r.mjd, 59580.0);
        assert_eq!(r.xp_arcsec, 0.054644);
        assert_eq!(r.yp_arcsec, 0.276986);
        assert_eq!(r.ut1_utc_s, -0.1104988);
    }

    #[test]
    fn rejects_a_short_or_blank_line() {
        assert!(parse_line("").is_none());
        assert!(parse_line("too short").is_none());
    }
}
