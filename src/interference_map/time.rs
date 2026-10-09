// SPDX-License-Identifier: AGPL-3.0-only
//! Timestamps in the input files: Unix epoch seconds or `YYYY-MM-DDTHH:MM:SS[.fff]Z`
//! (a space may replace `T`, and the `Z` is optional; all times are UTC).

/// Days since 1970-01-01 of a proleptic-Gregorian date (Hinnant's algorithm).
pub fn days_from_civil(y: i64, m: u32, d: u32) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = if y >= 0 { y } else { y - 399 } / 400;
    let yoe = (y - era * 400) as u64;
    let mp = (m as u64 + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d as u64 - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe as i64 - 719_468
}

/// `(year, month, day)` from days since the epoch.
pub fn civil_from_days(z: i64) -> (i64, u32, u32) {
    let z = z + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let doe = (z - era * 146_097) as u64;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe as i64 + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    (if m <= 2 { y + 1 } else { y }, m, d)
}

/// Parse a timestamp to Unix seconds.
pub fn parse_timestamp(s: &str) -> Option<f64> {
    let s = s.trim();
    if let Ok(v) = s.parse::<f64>() {
        return (v.is_finite() && v > 0.0).then_some(v);
    }
    let s = s.strip_suffix('Z').unwrap_or(s);
    let (date, time) = s.split_once(['T', ' '])?;
    let mut dp = date.split('-');
    let y: i64 = dp.next()?.parse().ok()?;
    let m: u32 = dp.next()?.parse().ok()?;
    let d: u32 = dp.next()?.parse().ok()?;
    if dp.next().is_some() || !(1..=12).contains(&m) || !(1..=31).contains(&d) {
        return None;
    }
    let mut tp = time.split(':');
    let hh: f64 = tp.next()?.parse().ok()?;
    let mm: f64 = tp.next()?.parse().ok()?;
    let ss: f64 = tp.next().unwrap_or("0").parse().ok()?;
    if tp.next().is_some()
        || !(0.0..24.0).contains(&hh)
        || !(0.0..60.0).contains(&mm)
        || !(0.0..61.0).contains(&ss)
    {
        return None;
    }
    Some(days_from_civil(y, m, d) as f64 * 86_400.0 + hh * 3600.0 + mm * 60.0 + ss)
}

/// UTC calendar day `YYYY-MM-DD` of a Unix time.
pub fn day_of(t: f64) -> String {
    let (y, m, d) = civil_from_days((t / 86_400.0).floor() as i64);
    format!("{y:04}-{m:02}-{d:02}")
}

/// Parse a `YYYY-MM-DD` date string to a day number, for range comparisons.
pub fn parse_day(s: &str) -> Option<i64> {
    parse_timestamp(&format!("{}T00:00:00Z", s.trim())).map(|t| (t / 86_400.0) as i64)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn iso_and_epoch_agree() {
        let t = parse_timestamp("2026-03-01T12:30:15Z").unwrap();
        assert_eq!(day_of(t), "2026-03-01");
        assert_eq!(parse_timestamp(&format!("{t}")).unwrap(), t);
        assert_eq!(parse_timestamp("2026-03-01 12:30:15").unwrap(), t);
        assert_eq!(parse_timestamp("1970-01-02T00:00:00Z").unwrap(), 86_400.0);
    }

    #[test]
    fn leap_day_and_bad_input() {
        assert_eq!(
            day_of(parse_timestamp("2028-02-29T23:59:59Z").unwrap()),
            "2028-02-29"
        );
        for bad in [
            "",
            "nonsense",
            "2026-13-01T00:00:00Z",
            "2026-01-01T25:00:00Z",
            "-5",
            "nan",
        ] {
            assert!(parse_timestamp(bad).is_none(), "{bad}");
        }
        assert_eq!(
            parse_day("2026-03-02").unwrap() - parse_day("2026-03-01").unwrap(),
            1
        );
    }

    #[test]
    fn civil_round_trip() {
        for z in [-1000, 0, 19_000, 25_000] {
            let (y, m, d) = civil_from_days(z);
            assert_eq!(days_from_civil(y, m, d), z);
        }
    }
}
