// SPDX-License-Identifier: AGPL-3.0-only
//! A UTC epoch that formats itself plus an offset, exactly, for every export format.

/// Julian Date of the Unix epoch, 1970-01-01T00:00:00 UTC.
const JD_UNIX_EPOCH: f64 = 2_440_587.5;

/// A Coordinated Universal Time (UTC) instant: whole days since 1970-01-01 plus seconds
/// into that day. Kept in two parts so a calendar epoch given to the second is carried
/// without the ~40 microsecond rounding a single Julian Date `f64` would add.
///
/// Leap seconds are not modelled: an offset that crosses a leap second is counted as if
/// every UTC day had 86 400 seconds, which is how the engine's time grids count too.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct UtcEpoch {
    days: i64,
    sec_of_day: f64,
}

const MONTHS: [&str; 12] = [
    "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
];

/// Days since 1970-01-01 of a proleptic-Gregorian date (Howard Hinnant's
/// `days_from_civil`).
fn days_from_civil(y: i64, m: u32, d: u32) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = if y >= 0 { y } else { y - 399 } / 400;
    let yoe = y - era * 400;
    let mp = (m as i64 + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d as i64 - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// The date of a day count since 1970-01-01 (Hinnant's `civil_from_days`).
fn civil_from_days(z: i64) -> (i64, u32, u32) {
    let z = z + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    (if m <= 2 { y + 1 } else { y }, m, d)
}

/// A broken-down instant rounded to the microsecond.
struct Civil {
    y: i64,
    mo: u32,
    d: u32,
    h: i64,
    mi: i64,
    s: i64,
    us: i64,
}

impl UtcEpoch {
    /// From a calendar date and time of day (UTC).
    pub fn from_calendar(
        year: i32,
        month: u32,
        day: u32,
        hour: u32,
        minute: u32,
        second: f64,
    ) -> Self {
        let days = days_from_civil(year as i64, month, day);
        Self::normalised(days, hour as f64 * 3600.0 + minute as f64 * 60.0 + second)
    }

    /// From the engine's calendar epoch type.
    pub fn from_epoch_utc(e: &crate::rinex::EpochUtc) -> Self {
        Self::from_calendar(e.year, e.month, e.day, e.hour, e.minute, e.second)
    }

    /// From a UTC Julian Date.
    pub fn from_jd_utc(jd: f64) -> Self {
        let x = jd - JD_UNIX_EPOCH;
        let days = x.floor();
        Self::normalised(days as i64, (x - days) * 86_400.0)
    }

    fn normalised(days: i64, sec: f64) -> Self {
        let carry = (sec / 86_400.0).floor();
        Self {
            days: days + carry as i64,
            sec_of_day: sec - carry * 86_400.0,
        }
    }

    /// The UTC Julian Date `offset_s` seconds after this epoch.
    pub fn jd_utc(&self, offset_s: f64) -> f64 {
        JD_UNIX_EPOCH + self.days as f64 + (self.sec_of_day + offset_s) / 86_400.0
    }

    fn civil(&self, offset_s: f64) -> Civil {
        let total_us = ((self.sec_of_day + offset_s) * 1e6).round() as i64;
        let day_us = 86_400_000_000i64;
        let carry = total_us.div_euclid(day_us);
        let rem = total_us.rem_euclid(day_us);
        let (y, mo, d) = civil_from_days(self.days + carry);
        let us = rem % 1_000_000;
        let secs = rem / 1_000_000;
        Civil {
            y,
            mo,
            d,
            h: secs / 3600,
            mi: (secs % 3600) / 60,
            s: secs % 60,
            us,
        }
    }

    /// ISO 8601 UTC, to the microsecond: `2018-06-06T00:00:00.000000Z`.
    pub fn iso(&self, offset_s: f64) -> String {
        let c = self.civil(offset_s);
        format!(
            "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}.{:06}Z",
            c.y, c.mo, c.d, c.h, c.mi, c.s, c.us
        )
    }

    /// The STK date form (`UTCG`), to the microsecond: `6 Jun 2018 00:00:00.000000`.
    pub fn stk(&self, offset_s: f64) -> String {
        let c = self.civil(offset_s);
        format!(
            "{} {} {:04} {:02}:{:02}:{:02}.{:06}",
            c.d,
            MONTHS[(c.mo - 1) as usize],
            c.y,
            c.h,
            c.mi,
            c.s,
            c.us
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calendar_round_trips_through_iso_and_stk() {
        let e = UtcEpoch::from_calendar(2024, 2, 29, 23, 59, 59.5);
        assert_eq!(e.iso(0.0), "2024-02-29T23:59:59.500000Z");
        assert_eq!(e.iso(0.5), "2024-03-01T00:00:00.000000Z");
        assert_eq!(e.stk(0.5), "1 Mar 2024 00:00:00.000000");
        assert_eq!(e.iso(-86_400.0), "2024-02-28T23:59:59.500000Z");
    }

    #[test]
    fn julian_date_matches_the_engine_convention() {
        let e = UtcEpoch::from_calendar(2000, 1, 1, 12, 0, 0.0);
        assert_eq!(e.jd_utc(0.0), 2_451_545.0);
        let f = UtcEpoch::from_jd_utc(2_451_545.0);
        assert_eq!(f.iso(0.0), "2000-01-01T12:00:00.000000Z");
        let w = UtcEpoch::from_jd_utc(crate::walker::walker_epoch_jd());
        assert_eq!(w.iso(0.0), "2018-06-12T00:00:00.000000Z");
        assert_eq!(
            crate::timescales::julian_date(2018, 6, 12, 0, 0, 0.0),
            crate::walker::walker_epoch_jd()
        );
    }
}
