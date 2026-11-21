// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS and computer time-scale arithmetic with exact integers: the conversions that keep
//! breaking in navigation software (week rollovers, leap seconds, the NTP and 32-bit Unix eras,
//! two-digit years), written once and checked by the open vectors in `data/conformance/time/`
//! ([`crate::time_vectors`], `kshana time-vectors`).
//!
//! Instants are carried as whole nanoseconds in an `i128`, so no conversion here loses
//! precision or rounds a second. Conventions:
//!
//! * **UTC** is a civil date and time whose seconds may read `60` during a positive leap second
//!   (`23:59:60`, accepted only on the days the IERS inserted one, see
//!   [`crate::timescales::leap_second_table`]). TAI−UTC is the integer value in force at 00:00
//!   of the UTC day, which also holds through that day's `23:59:60`. UTC before 1972-01-01 is
//!   refused (the rubber-second era is not an integer offset).
//! * **TAI** is counted in seconds from its own 1970-01-01T00:00:00 label; **GPST** = TAI − 19 s,
//!   **GST** (Galileo) = GPST, **BDT** (BeiDou) = TAI − 33 s, **TT** = TAI + 32.184 s;
//!   **GLONASST** = UTC(SU) + 3 h and so carries the leap seconds (its inserted second reads
//!   `02:59:60`).
//! * **Weeks:** GPS week 0 starts 1980-01-06T00:00:00 GPST; Galileo GST week 0 starts
//!   1999-08-22T00:00:00 GST (GPS week 1024); BeiDou BDT week 0 starts 2006-01-01T00:00:00 BDT
//!   (GPS week 1356 plus 14 s). A broadcast week field of `bits` bits (GPS LNAV 10, GPS CNAV
//!   and BeiDou 13, Galileo 12) is resolved to the full week nearest a reference week by
//!   [`resolve_week`].
//! * **GLONASS days:** `N4` is the four-year interval from 1996 (1996-1999 is `N4 = 1`) and `NT`
//!   the day in it (1 to 1461), both on the Moscow (UTC+3 h) date.
//! * **NTP** timestamps count seconds from 1900-01-01T00:00:00 in 32 bits per era; era 0 ends at
//!   2036-02-07T06:28:16 UTC. [`ntp_to_unix`] picks the era nearest a pivot (RFC 5905 §6).
//! * **32-bit Unix time** overflows a signed counter after 2038-01-19T03:14:07 UTC and an
//!   unsigned one after 2106-02-07T06:28:15 UTC; [`unix_i32_wrap`] shows what a signed counter
//!   reads and [`resolve_unix_u32`] recovers a full count near a pivot.
//! * **Two-digit years:** RINEX 2 (`80-99` → 1980-1999, `00-79` → 2000-2079), TLE (`57-99` →
//!   19xx, `00-56` → 20xx) and NMEA `ddmmyy` (no century: the year within 50 years of a
//!   reference year), by [`two_digit_year`].
//!
//! Like every UTC conversion, the result for a future date assumes no leap second beyond the
//! table (the table is current to IERS Bulletin C).

use crate::timescales::leap_second_table;

/// Nanoseconds per second.
pub const NS: i128 = 1_000_000_000;
/// Seconds per day.
pub const DAY_S: i64 = 86_400;
/// Seconds per week.
pub const WEEK_S: i64 = 604_800;
/// TAI − GPST (s).
pub const TAI_MINUS_GPST_S: i64 = 19;
/// TAI − BDT (s).
pub const TAI_MINUS_BDT_S: i64 = 33;
/// TT − TAI (ns): 32.184 s.
pub const TT_MINUS_TAI_NS: i128 = 32_184_000_000;
/// GPS week of Galileo GST week 0.
pub const GST_WEEK0_IN_GPS_WEEKS: i64 = 1024;
/// GPS week of BeiDou BDT week 0 (BDT week 0 begins 14 s after this GPS week begins).
pub const BDT_WEEK0_IN_GPS_WEEKS: i64 = 1356;
/// Seconds from 1900-01-01 (NTP) to 1970-01-01 (Unix).
pub const NTP_UNIX_OFFSET_S: i64 = 2_208_988_800;

const DAY_NS: i128 = DAY_S as i128 * NS;

/// Days from 1970-01-01 to the proleptic Gregorian date `y-m-d`.
pub fn days_from_civil(y: i64, m: u32, d: u32) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let m = i64::from(m);
    let mp = if m > 2 { m - 3 } else { m + 9 };
    let doy = (153 * mp + 2) / 5 + i64::from(d) - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// The proleptic Gregorian date of day `z` from 1970-01-01.
pub fn civil_from_days(z: i64) -> (i64, u32, u32) {
    let z = z + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let y = yoe + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    (if m <= 2 { y + 1 } else { y }, m, d)
}

fn is_leap_year(y: i64) -> bool {
    (y % 4 == 0 && y % 100 != 0) || y % 400 == 0
}

fn days_in_month(y: i64, m: u32) -> u32 {
    match m {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        2 if is_leap_year(y) => 29,
        2 => 28,
        _ => 0,
    }
}

/// The time scales [`utc_to_scale`] renders.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Scale {
    /// Coordinated Universal Time.
    Utc,
    /// International Atomic Time.
    Tai,
    /// Terrestrial Time.
    Tt,
    /// GPS Time.
    Gpst,
    /// Galileo System Time.
    Gst,
    /// BeiDou Time.
    Bdt,
    /// GLONASS Time (UTC(SU) + 3 h).
    Glonasst,
}

impl Scale {
    /// The scale named `s` (`UTC`, `TAI`, `TT`, `GPST`, `GST`, `BDT`, `GLONASST`).
    pub fn from_name(s: &str) -> Result<Self, String> {
        Ok(match s {
            "UTC" => Scale::Utc,
            "TAI" => Scale::Tai,
            "TT" => Scale::Tt,
            "GPST" | "GPS" => Scale::Gpst,
            "GST" | "GAL" => Scale::Gst,
            "BDT" | "BDS" => Scale::Bdt,
            "GLONASST" | "GLO" => Scale::Glonasst,
            _ => return Err(crate::terr!("e-gnss-time-unknown-scale", name = s)),
        })
    }

    /// Scale − TAI (ns) for the uniform scales; `None` for UTC and GLONASST.
    fn minus_tai_ns(self) -> Option<i128> {
        match self {
            Scale::Tai => Some(0),
            Scale::Tt => Some(TT_MINUS_TAI_NS),
            Scale::Gpst | Scale::Gst => Some(-i128::from(TAI_MINUS_GPST_S) * NS),
            Scale::Bdt => Some(-i128::from(TAI_MINUS_BDT_S) * NS),
            Scale::Utc | Scale::Glonasst => None,
        }
    }
}

/// A civil date and time of day. `ns_of_day` runs to `86_401 × 10⁹` exclusive so a UTC leap
/// second (`23:59:60.x`) can be held.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Civil {
    /// Year.
    pub year: i64,
    /// Month, 1-12.
    pub month: u32,
    /// Day of month.
    pub day: u32,
    /// Nanoseconds since 00:00:00 of the day.
    pub ns_of_day: i128,
}

impl Civil {
    /// Days from 1970-01-01.
    pub fn days(&self) -> i64 {
        days_from_civil(self.year, self.month, self.day)
    }

    /// Parse `YYYY-MM-DD[Thh:mm:ss[.fffffffff]][Z]` with every field range-checked. A second of
    /// `60` is accepted only as `23:59:60` (where a UTC leap second goes); whether that day had
    /// one is decided by [`utc_valid`].
    pub fn parse(s: &str) -> Result<Civil, String> {
        let bad = || crate::terr!("e-gnss-time-bad-time", value = format!("{s:?}"));
        let t = s.trim();
        let t = t.strip_suffix('Z').unwrap_or(t);
        if !t.is_ascii() || t.len() > 40 {
            return Err(bad());
        }
        let (date, time) = t.split_once('T').unwrap_or((t, "00:00:00"));
        let dp: Vec<&str> = date.split('-').collect();
        let tp: Vec<&str> = time.split(':').collect();
        if dp.len() != 3 || tp.len() != 3 {
            return Err(bad());
        }
        let digits = |x: &str, n: usize| x.len() == n && x.bytes().all(|c| c.is_ascii_digit());
        if !(digits(dp[0], 4)
            && digits(dp[1], 2)
            && digits(dp[2], 2)
            && digits(tp[0], 2)
            && digits(tp[1], 2))
        {
            return Err(bad());
        }
        let (ss, frac) = tp[2].split_once('.').unwrap_or((tp[2], ""));
        if !digits(ss, 2)
            || frac.len() > 9
            || !frac.bytes().all(|c| c.is_ascii_digit())
            || tp[2].ends_with('.')
        {
            return Err(bad());
        }
        let year: i64 = dp[0].parse().map_err(|_| bad())?;
        let month: u32 = dp[1].parse().map_err(|_| bad())?;
        let day: u32 = dp[2].parse().map_err(|_| bad())?;
        let hh: i128 = tp[0].parse().map_err(|_| bad())?;
        let mm: i128 = tp[1].parse().map_err(|_| bad())?;
        let ss: i128 = ss.parse().map_err(|_| bad())?;
        let mut fns: i128 = 0;
        for (k, c) in frac.bytes().enumerate() {
            fns += i128::from(c - b'0') * 10i128.pow(8 - k as u32);
        }
        if !(1..=12).contains(&month)
            || day < 1
            || day > days_in_month(year, month)
            || hh > 23
            || mm > 59
            || ss > 60
            || (ss == 60 && (hh != 23 || mm != 59))
        {
            return Err(bad());
        }
        Ok(Civil {
            year,
            month,
            day,
            ns_of_day: ((hh * 60 + mm) * 60 + ss) * NS + fns,
        })
    }

    /// `YYYY-MM-DDThh:mm:ss[.f]` (the fraction only when not zero, without trailing zeros).
    pub fn format(&self) -> String {
        let s = self.ns_of_day.div_euclid(NS);
        let f = self.ns_of_day.rem_euclid(NS);
        let (hh, mm, ss) = if s >= DAY_S as i128 {
            (23, 59, 60 + (s - DAY_S as i128))
        } else {
            (s / 3600, (s / 60) % 60, s % 60)
        };
        let mut out = format!(
            "{:04}-{:02}-{:02}T{hh:02}:{mm:02}:{ss:02}",
            self.year, self.month, self.day
        );
        push_fraction(&mut out, f);
        out
    }

    fn from_count_ns(count: i128) -> Civil {
        let days = count.div_euclid(DAY_NS);
        let (year, month, day) = civil_from_days(days as i64);
        Civil {
            year,
            month,
            day,
            ns_of_day: count.rem_euclid(DAY_NS),
        }
    }

    /// The count (ns from the 1970-01-01 label) of this civil time, a leap second counted as
    /// the first second of the next day.
    fn count_ns(&self) -> i128 {
        i128::from(self.days()) * DAY_NS + self.ns_of_day
    }
}

fn push_fraction(out: &mut String, f: i128) {
    if f != 0 {
        out.push('.');
        out.push_str(format!("{f:09}").trim_end_matches('0'));
    }
}

/// TAI − UTC (s) in force through the UTC day `days` (from 1970-01-01), or `None` before
/// 1972-01-01.
pub fn tai_minus_utc_on_day(days: i64) -> Option<i64> {
    let mut v = None;
    for (y, m, d, s) in leap_second_table() {
        if days_from_civil(i64::from(y), m, d) <= days {
            v = Some(i64::from(s));
        } else {
            break;
        }
    }
    v
}

/// True if the IERS inserted a positive leap second (`23:59:60`) at the end of UTC day `days`.
pub fn is_leap_second_day(days: i64) -> bool {
    match (tai_minus_utc_on_day(days), tai_minus_utc_on_day(days + 1)) {
        (Some(a), Some(b)) => b > a,
        _ => false,
    }
}

/// Length (s) of UTC day `days`: 86 401 on a leap-second day, 86 400 otherwise.
pub fn utc_day_length_s(days: i64) -> i64 {
    DAY_S + i64::from(is_leap_second_day(days))
}

/// A parsed UTC time that exists: from 1972-01-01, and a `:60` second only in the
/// `23:59:60` of a leap-second day.
pub fn utc_valid(s: &str) -> Result<Civil, String> {
    let c = Civil::parse(s)?;
    let days = c.days();
    if tai_minus_utc_on_day(days).is_none() {
        return Err(crate::terr!(
            "e-gnss-time-before-1972",
            value = format!("{s:?}")
        ));
    }
    // 23:59:60 (the only :60 the parse accepts) exists only on a leap-second day.
    if c.ns_of_day >= DAY_NS && !is_leap_second_day(days) {
        return Err(crate::terr!(
            "e-gnss-time-no-leap-second",
            value = format!("{s:?}")
        ));
    }
    Ok(c)
}

/// TAI (ns from 1970-01-01T00:00:00 TAI) of a valid UTC time.
pub fn utc_to_tai_ns(c: &Civil) -> Result<i128, String> {
    let dat = tai_minus_utc_on_day(c.days()).ok_or_else(|| {
        crate::terr!(
            "e-gnss-time-before-1972",
            value = format!("{:?}", c.format())
        )
    })?;
    Ok(c.count_ns() + i128::from(dat) * NS)
}

/// The UTC time of a TAI count (ns from 1970-01-01T00:00:00 TAI), with the leap second
/// rendered as `23:59:60`. `None` before 1972-01-01.
pub fn tai_ns_to_utc(tai: i128) -> Option<Civil> {
    // The latest table row whose leap second (or, for 1972, whose first instant) is not after
    // `tai`: the inserted second before row D starts at TAI = U_D + N − 1.
    let mut found: Option<(i64, i64)> = None;
    for (y, m, d, n) in leap_second_table() {
        let ud = days_from_civil(i64::from(y), m, d) * DAY_S;
        if tai >= i128::from(ud + i64::from(n) - 1) * NS {
            found = Some((ud, i64::from(n)));
        } else {
            break;
        }
    }
    let (ud, n) = found?;
    let first_row = ud == days_from_civil(1972, 1, 1) * DAY_S;
    if tai < i128::from(ud + n) * NS {
        if first_row {
            return None; // before 1972-01-01T00:00:00 UTC
        }
        // Inside the inserted second: 23:59:60.x of the day before.
        let into = tai - i128::from(ud + n - 1) * NS;
        let mut c = Civil::from_count_ns(i128::from(ud - DAY_S) * NS);
        c.ns_of_day = DAY_NS + into;
        return Some(c);
    }
    Some(Civil::from_count_ns(tai - i128::from(n) * NS))
}

/// The Moscow (UTC + 3 h) civil time of a UTC time; during a leap second, the Moscow date with
/// the fraction (ns) of the inserted second.
fn moscow(c: &Civil) -> (Civil, Option<i128>) {
    if c.ns_of_day >= DAY_NS {
        let mut g = Civil::from_count_ns(i128::from(c.days() + 1) * DAY_NS);
        g.ns_of_day = (2 * 3600 + 59 * 60 + 59) as i128 * NS;
        (g, Some(c.ns_of_day - DAY_NS))
    } else {
        (Civil::from_count_ns(c.count_ns() + 3 * 3600 * NS), None)
    }
}

/// A UTC time rendered in `scale`.
pub fn utc_to_scale(utc: &str, scale: Scale) -> Result<String, String> {
    let c = utc_valid(utc)?;
    let tai = utc_to_tai_ns(&c)?;
    Ok(match scale {
        Scale::Utc => c.format(),
        Scale::Glonasst => match moscow(&c) {
            // The inserted second reads 02:59:60 in GLONASS time.
            (g, Some(f)) => {
                let mut s = format!("{:04}-{:02}-{:02}T02:59:60", g.year, g.month, g.day);
                push_fraction(&mut s, f);
                s
            }
            (g, None) => g.format(),
        },
        s => Civil::from_count_ns(tai + s.minus_tai_ns().unwrap_or(0)).format(),
    })
}

/// `to − from` (s) at the UTC instant `utc`, for two of the scales (GLONASST − UTC is 10 800).
pub fn scale_offset_s(from: Scale, to: Scale, utc: &str) -> Result<f64, String> {
    let c = utc_valid(utc)?;
    let tai = utc_to_tai_ns(&c)?;
    let utc_minus_tai = c.count_ns() - tai;
    let minus_tai = |s: Scale| -> i128 {
        match s {
            Scale::Utc => utc_minus_tai,
            Scale::Glonasst => utc_minus_tai + 3 * 3600 * NS,
            s => s.minus_tai_ns().unwrap_or(0),
        }
    };
    Ok((minus_tai(to) - minus_tai(from)) as f64 / NS as f64)
}

/// Start of each system's week 0, in that system's own count (ns from its 1970 label).
fn week0_ns(system: Scale) -> Result<i128, String> {
    let gps0 = i128::from(days_from_civil(1980, 1, 6)) * DAY_NS;
    Ok(match system {
        Scale::Gpst => gps0,
        Scale::Gst => gps0 + i128::from(GST_WEEK0_IN_GPS_WEEKS * WEEK_S) * NS,
        Scale::Bdt => i128::from(days_from_civil(2006, 1, 1)) * DAY_NS,
        other => {
            return Err(crate::terr!(
                "e-gnss-time-no-weeks",
                name = format!("{other:?}")
            ))
        }
    })
}

/// Full week and time of week (s) of a UTC instant in GPST, GST or BDT.
pub fn gnss_week_tow(utc: &str, system: Scale) -> Result<(i64, f64), String> {
    let c = utc_valid(utc)?;
    let tai = utc_to_tai_ns(&c)?;
    let own = tai + system.minus_tai_ns().unwrap_or(0);
    let since = own - week0_ns(system)?;
    let wk = i128::from(WEEK_S) * NS;
    Ok((
        since.div_euclid(wk) as i64,
        since.rem_euclid(wk) as f64 / NS as f64,
    ))
}

/// The UTC time of a GPS week and time of week (s, to the nanosecond).
pub fn gps_to_utc(week: i64, tow_s: f64) -> Result<String, String> {
    if !(0.0..WEEK_S as f64).contains(&tow_s) || !(0..=100_000).contains(&week) {
        return Err(crate::terr!(
            "e-gnss-time-out-of-range",
            value = format!("{week} {tow_s}")
        ));
    }
    let tow_ns = (tow_s * 1e9).round() as i128;
    let gpst = week0_ns(Scale::Gpst)? + i128::from(week) * i128::from(WEEK_S) * NS + tow_ns;
    let tai = gpst + i128::from(TAI_MINUS_GPST_S) * NS;
    tai_ns_to_utc(tai)
        .map(|c| c.format())
        .ok_or_else(|| crate::terr!("e-gnss-time-before-1972", value = format!("{week} {tow_s}")))
}

/// The GPST label at which full GPS week `week` starts (no leap seconds involved).
pub fn gps_week_start(week: i64) -> String {
    let gps0 = i128::from(days_from_civil(1980, 1, 6)) * DAY_NS;
    Civil::from_count_ns(gps0 + i128::from(week) * i128::from(WEEK_S) * NS).format()
}

/// The `bits`-bit broadcast form of a full week.
pub fn truncate_week(week: u32, bits: u32) -> u32 {
    if bits >= 32 {
        week
    } else {
        week & ((1u32 << bits) - 1)
    }
}

/// The full week whose low `bits` bits are `truncated` and which is nearest `reference_week`
/// (a tie, exactly half a cycle away, goes to the later week). `bits` is 1 to 20.
pub fn resolve_week(truncated: u32, bits: u32, reference_week: u32) -> Result<u32, String> {
    let bad = || crate::terr!("e-gnss-time-bad-week", truncated = truncated, bits = bits);
    if !(1..=20).contains(&bits) || truncated >= (1u32 << bits) {
        return Err(bad());
    }
    let cycle = 1i64 << bits;
    let r = i64::from(reference_week);
    let base = r - r.rem_euclid(cycle) + i64::from(truncated);
    let best = [base - cycle, base, base + cycle]
        .into_iter()
        .filter(|w| *w >= 0)
        .min_by_key(|w| ((w - r).abs(), -w))
        .unwrap_or(base);
    u32::try_from(best).map_err(|_| bad())
}

/// GLONASS `N4` (four-year interval from 1996), `NT` (day in the interval) and the Moscow time
/// (UTC + 3 h) of a UTC instant.
pub fn glonass_day(utc: &str) -> Result<(i64, i64, String), String> {
    let u = utc_valid(utc)?;
    let (c, _) = moscow(&u);
    let n4 = (c.year - 1996).div_euclid(4) + 1;
    let first = 1996 + 4 * (n4 - 1);
    let nt = c.days() - days_from_civil(first, 1, 1) + 1;
    Ok((n4, nt, utc_to_scale(utc, Scale::Glonasst)?))
}

/// NTP era and 32-bit seconds of a Unix time.
pub fn unix_to_ntp(unix_s: i64) -> (i64, u32) {
    let ntp = i128::from(unix_s) + i128::from(NTP_UNIX_OFFSET_S);
    (
        ntp.div_euclid(1 << 32) as i64,
        ntp.rem_euclid(1 << 32) as u32,
    )
}

/// The Unix time and NTP era of a 32-bit NTP seconds field, taking the era that puts it
/// nearest `pivot_unix_s` (RFC 5905 §6: the era is not on the wire).
pub fn ntp_to_unix(ntp_s: u32, pivot_unix_s: i64) -> (i64, i64) {
    let (pivot_era, _) = unix_to_ntp(pivot_unix_s);
    let at = |era: i64| era * (1i64 << 32) + i64::from(ntp_s) - NTP_UNIX_OFFSET_S;
    let era = [pivot_era - 1, pivot_era, pivot_era + 1]
        .into_iter()
        .min_by_key(|&e| ((at(e) - pivot_unix_s).abs(), -e))
        .unwrap_or(pivot_era);
    (at(era), era)
}

/// What a signed 32-bit counter holds for Unix time `unix_s` (two's-complement wrap) and
/// whether it fits.
pub fn unix_i32_wrap(unix_s: i64) -> (i64, bool) {
    let w = unix_s as i32;
    (i64::from(w), i64::from(w) == unix_s)
}

/// The Unix time nearest `pivot_unix_s` whose low 32 bits are `raw` (an unsigned 32-bit
/// counter read across its 2106 wrap, or a signed one read as unsigned across 2038).
pub fn resolve_unix_u32(raw: u32, pivot_unix_s: i64) -> i64 {
    let cycle = 1i64 << 32;
    let base = pivot_unix_s - pivot_unix_s.rem_euclid(cycle) + i64::from(raw);
    [base - cycle, base, base + cycle]
        .into_iter()
        .min_by_key(|&t| ((t - pivot_unix_s).abs(), -t))
        .unwrap_or(base)
}

/// The UTC civil time of a Unix count (no leap seconds, as Unix time has none).
pub fn unix_to_utc(unix_s: i64) -> String {
    Civil::from_count_ns(i128::from(unix_s) * NS).format()
}

/// Conventions for a two-digit year.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum YearConvention {
    /// RINEX 2: `80-99` → 1980-1999, `00-79` → 2000-2079.
    Rinex2,
    /// TLE epoch and international designator: `57-99` → 1957-1999, `00-56` → 2000-2056.
    Tle,
    /// NMEA `ddmmyy` (no century in the sentence): the year within −50/+49 years of a
    /// reference year.
    Nmea,
}

impl YearConvention {
    /// The convention named `s` (`rinex2`, `tle`, `nmea`).
    pub fn from_name(s: &str) -> Result<Self, String> {
        Ok(match s {
            "rinex2" => YearConvention::Rinex2,
            "tle" => YearConvention::Tle,
            "nmea" => YearConvention::Nmea,
            _ => return Err(crate::terr!("e-gnss-time-unknown-convention", name = s)),
        })
    }
}

/// The four-digit year of the two-digit `yy` (0-99) under `convention`; `reference_year` is
/// used only by [`YearConvention::Nmea`].
pub fn two_digit_year(
    yy: u32,
    convention: YearConvention,
    reference_year: i64,
) -> Result<i64, String> {
    if yy > 99 {
        return Err(crate::terr!("e-gnss-time-bad-yy", yy = yy));
    }
    let yy = i64::from(yy);
    Ok(match convention {
        YearConvention::Rinex2 if yy >= 80 => 1900 + yy,
        YearConvention::Rinex2 => 2000 + yy,
        YearConvention::Tle if yy >= 57 => 1900 + yy,
        YearConvention::Tle => 2000 + yy,
        YearConvention::Nmea => {
            let lo = reference_year - 50;
            let c = lo - lo.rem_euclid(100) + yy;
            if c < lo {
                c + 100
            } else {
                c
            }
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn calendar_round_trips() {
        for z in (-800_000..800_000).step_by(997) {
            let (y, m, d) = civil_from_days(z);
            assert_eq!(days_from_civil(y, m, d), z);
        }
        assert_eq!(days_from_civil(1980, 1, 6), 3657);
    }

    #[test]
    fn leap_second_is_monotonic_in_tai() {
        let a = utc_to_tai_ns(&utc_valid("2016-12-31T23:59:59").unwrap()).unwrap();
        let b = utc_to_tai_ns(&utc_valid("2016-12-31T23:59:60").unwrap()).unwrap();
        let c = utc_to_tai_ns(&utc_valid("2017-01-01T00:00:00").unwrap()).unwrap();
        assert_eq!(b - a, NS);
        assert_eq!(c - b, NS);
        assert_eq!(tai_ns_to_utc(b).unwrap().format(), "2016-12-31T23:59:60");
        assert_eq!(
            tai_ns_to_utc(b + NS / 2).unwrap().format(),
            "2016-12-31T23:59:60.5"
        );
        assert!(utc_valid("2015-12-31T23:59:60").is_err());
        assert!(utc_valid("2016-12-31T23:58:60").is_err());
        assert!(utc_valid("1971-12-31T00:00:00").is_err());
    }

    #[test]
    fn every_tai_second_round_trips_through_utc_near_each_leap() {
        for (y, m, d, _) in leap_second_table().skip(1) {
            let ud = days_from_civil(i64::from(y), m, d);
            let t0 = utc_to_tai_ns(&Civil::from_count_ns(i128::from(ud - 1) * DAY_NS)).unwrap();
            for k in 86_390..86_412 {
                let t = t0 + k * NS;
                let c = tai_ns_to_utc(t).unwrap();
                assert_eq!(utc_to_tai_ns(&c).unwrap(), t, "{}", c.format());
            }
        }
    }

    #[test]
    fn week_rollovers() {
        assert_eq!(resolve_week(0, 10, 2047).unwrap(), 2048);
        assert_eq!(resolve_week(1023, 10, 2048).unwrap(), 2047);
        assert_eq!(resolve_week(0, 13, 8191).unwrap(), 8192);
        assert_eq!(resolve_week(512, 10, 0).unwrap(), 512);
        assert!(resolve_week(1024, 10, 0).is_err());
        assert_eq!(gps_week_start(3072), "2038-11-21T00:00:00");
    }

    #[test]
    fn eras_and_years() {
        assert_eq!(unix_to_ntp(2_085_978_496), (1, 0));
        assert_eq!(ntp_to_unix(0, 2_085_978_000).0, 2_085_978_496);
        assert_eq!(unix_i32_wrap(2_147_483_648), (-2_147_483_648, false));
        assert_eq!(resolve_unix_u32(0, 4_294_967_000), 4_294_967_296);
        assert_eq!(two_digit_year(79, YearConvention::Rinex2, 0).unwrap(), 2079);
        assert_eq!(two_digit_year(57, YearConvention::Tle, 0).unwrap(), 1957);
        assert_eq!(
            two_digit_year(99, YearConvention::Nmea, 2026).unwrap(),
            1999
        );
        assert_eq!(
            two_digit_year(75, YearConvention::Nmea, 2026).unwrap(),
            2075
        );
        assert_eq!(
            two_digit_year(76, YearConvention::Nmea, 2026).unwrap(),
            1976
        );
    }
}
