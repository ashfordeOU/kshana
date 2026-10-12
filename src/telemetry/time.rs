// SPDX-License-Identifier: AGPL-3.0-only
//! UTC date arithmetic shared by the syslog formatter and the evidence-pack command line:
//! RFC 3339 formatting and a validating parser. Uses the days-from-civil algorithm on the
//! proleptic Gregorian calendar, with checked arithmetic and a year range of 1 to 9999 so
//! absurd input is an error, not an overflow.

fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y.rem_euclid(400);
    let doy = (153 * ((m + 9) % 12) + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

fn civil_from_days(z: i64) -> (i64, i64, i64) {
    let z = z + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    (if m <= 2 { y + 1 } else { y }, m, d)
}

fn is_leap(y: i64) -> bool {
    (y % 4 == 0 && y % 100 != 0) || y % 400 == 0
}

fn days_in_month(y: i64, m: i64) -> i64 {
    match m {
        2 if is_leap(y) => 29,
        2 => 28,
        4 | 6 | 9 | 11 => 30,
        _ => 31,
    }
}

/// RFC 3339 UTC timestamp for a Unix time in whole seconds.
pub fn rfc3339_utc(unix_s: i64) -> String {
    let (y, m, d) = civil_from_days(unix_s.div_euclid(86_400));
    let rem = unix_s.rem_euclid(86_400);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}Z",
        rem / 3600,
        rem % 3600 / 60,
        rem % 60
    )
}

/// Seconds since 1970 for `YYYY-MM-DDTHH:MM:SS[.f][Z]` (UTC only). `None` for anything
/// that is not a real calendar time in years 1 to 9999.
pub fn parse_rfc3339_utc(s: &str) -> Option<f64> {
    let s = s.trim();
    let s = s.strip_suffix('Z').unwrap_or(s);
    let (d, t) = s.split_once('T')?;
    let mut dp = d.split('-');
    let y: i64 = dp.next()?.parse().ok()?;
    let m: i64 = dp.next()?.parse().ok()?;
    let day: i64 = dp.next()?.parse().ok()?;
    if dp.next().is_some() || !(1..=9999).contains(&y) || !(1..=12).contains(&m) {
        return None;
    }
    if !(1..=days_in_month(y, m)).contains(&day) {
        return None;
    }
    let mut tp = t.split(':');
    let hh: i64 = tp.next()?.parse().ok()?;
    let mm: i64 = tp.next()?.parse().ok()?;
    let ss: f64 = tp.next()?.parse().ok()?;
    if tp.next().is_some()
        || !(0..24).contains(&hh)
        || !(0..60).contains(&mm)
        || !ss.is_finite()
        || !(0.0..61.0).contains(&ss)
    {
        return None;
    }
    Some(days_from_civil(y, m, day) as f64 * 86_400.0 + (hh * 3600 + mm * 60) as f64 + ss)
}

/// True for a timestamp in the exact form `YYYY-MM-DDTHH:MM:SS[.f]Z` that is a real time.
pub fn is_rfc3339_utc_z(s: &str) -> bool {
    s.ends_with('Z') && parse_rfc3339_utc(s).is_some()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn formats_known_instants() {
        assert_eq!(rfc3339_utc(0), "1970-01-01T00:00:00Z");
        assert_eq!(rfc3339_utc(951_782_400), "2000-02-29T00:00:00Z");
        assert_eq!(rfc3339_utc(1_767_225_599), "2025-12-31T23:59:59Z");
    }

    #[test]
    fn parses_and_round_trips() {
        assert_eq!(parse_rfc3339_utc("1970-01-01T00:00:00Z"), Some(0.0));
        assert_eq!(
            parse_rfc3339_utc("2000-02-29T00:00:00Z"),
            Some(951_782_400.0)
        );
        assert_eq!(
            parse_rfc3339_utc("2025-12-31T23:59:59.5Z"),
            Some(1_767_225_599.5)
        );
        for t in [0i64, 86_399, 951_782_400, 1_767_225_599, 4_102_444_800] {
            assert_eq!(parse_rfc3339_utc(&rfc3339_utc(t)), Some(t as f64));
        }
    }

    #[test]
    fn rejects_non_times() {
        for bad in [
            "hh:mm:ss.mmm UTC (date not in log)",
            "2025-13-01T00:00:00Z",
            "2025-02-29T00:00:00Z",
            "2025-04-31T00:00:00Z",
            "2025-01-01T24:00:00Z",
            "2025-01-01T00:60:00Z",
            "2025-01-01T00:00:61Z",
            "yesterday-ish",
            "99999-01-01T00:00:00Z",
            "0000-01-01T00:00:00Z",
            "-5000-01-01T00:00:00Z",
            "",
        ] {
            assert_eq!(parse_rfc3339_utc(bad), None, "{bad}");
        }
        assert!(is_rfc3339_utc_z("2026-01-01T00:00:00Z"));
        assert!(!is_rfc3339_utc_z("2026-01-01T00:00:00"));
    }
}
