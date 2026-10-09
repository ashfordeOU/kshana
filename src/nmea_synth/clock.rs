// SPDX-License-Identifier: AGPL-3.0-only
//! UTC arithmetic on integer milliseconds since the Unix epoch.

/// Days since 1970-01-01 for a proleptic-Gregorian date (Hinnant's algorithm).
pub fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = if y >= 0 { y } else { y - 399 } / 400;
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// Proleptic-Gregorian `(year, month, day)` for days since 1970-01-01.
pub fn civil_from_days(z: i64) -> (i64, i64, i64) {
    let z = z + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    (if m <= 2 { y + 1 } else { y }, m, d)
}

/// Parse `YYYY-MM-DDTHH:MM:SSZ` into milliseconds since the Unix epoch.
pub fn parse_utc(s: &str) -> Result<i64, String> {
    let b = s.as_bytes();
    let ok = b.len() == 20
        && b[4] == b'-'
        && b[7] == b'-'
        && b[10] == b'T'
        && b[13] == b':'
        && b[16] == b':'
        && b[19] == b'Z';
    if !ok {
        return Err("expected YYYY-MM-DDTHH:MM:SSZ".into());
    }
    let n = |a: usize, z: usize| {
        s[a..z]
            .parse::<i64>()
            .map_err(|_| "not numeric".to_string())
    };
    let (y, mo, d, h, mi, se) = (
        n(0, 4)?,
        n(5, 7)?,
        n(8, 10)?,
        n(11, 13)?,
        n(14, 16)?,
        n(17, 19)?,
    );
    if !(1980..=2099).contains(&y)
        || !(1..=12).contains(&mo)
        || !(1..=31).contains(&d)
        || h > 23
        || mi > 59
        || se > 59
    {
        return Err("date or time out of range (years 1980 to 2099)".into());
    }
    let days = days_from_civil(y, mo, d);
    if civil_from_days(days) != (y, mo, d) {
        return Err("no such calendar date".into());
    }
    Ok(((days * 24 + h) * 60 + mi) * 60_000 + se * 1000)
}

/// Broken-down UTC time.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Utc {
    /// Year.
    pub year: i64,
    /// Month 1-12.
    pub month: i64,
    /// Day 1-31.
    pub day: i64,
    /// Hour.
    pub hour: i64,
    /// Minute.
    pub min: i64,
    /// Second.
    pub sec: i64,
    /// Milliseconds.
    pub ms: i64,
}

/// Break milliseconds since the Unix epoch into calendar fields.
pub fn split(ms: i64) -> Utc {
    let days = ms.div_euclid(86_400_000);
    let r = ms.rem_euclid(86_400_000);
    let (year, month, day) = civil_from_days(days);
    Utc {
        year,
        month,
        day,
        hour: r / 3_600_000,
        min: r / 60_000 % 60,
        sec: r / 1000 % 60,
        ms: r % 1000,
    }
}

/// `YYYY-MM-DDTHH:MM:SS.mmmZ`, or without the fraction when whole seconds.
pub fn iso(ms: i64) -> String {
    let u = split(ms);
    if u.ms == 0 {
        format!(
            "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}Z",
            u.year, u.month, u.day, u.hour, u.min, u.sec
        )
    } else {
        format!(
            "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}.{:03}Z",
            u.year, u.month, u.day, u.hour, u.min, u.sec, u.ms
        )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn round_trip_and_known_instant() {
        // 2017-01-01T00:00:00Z is 1483228800 s after the Unix epoch.
        assert_eq!(
            parse_utc("2017-01-01T00:00:00Z").unwrap(),
            1_483_228_800_000
        );
        let ms = parse_utc("2026-05-14T06:30:15Z").unwrap() + 250;
        assert_eq!(iso(ms), "2026-05-14T06:30:15.250Z");
        assert_eq!(split(ms).day, 14);
    }

    #[test]
    fn rejects_bad_dates() {
        assert!(parse_utc("2026-02-30T00:00:00Z").is_err());
        assert!(parse_utc("2026-05-14 06:30:15").is_err());
        assert!(parse_utc("2026-13-01T00:00:00Z").is_err());
    }

    #[test]
    fn midnight_rolls_the_date() {
        let ms = parse_utc("2026-12-31T23:59:59Z").unwrap() + 1000;
        assert_eq!(iso(ms), "2027-01-01T00:00:00Z");
    }
}
