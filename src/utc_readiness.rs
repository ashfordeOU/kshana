// SPDX-License-Identifier: AGPL-3.0-only
//! Continuous-UTC readiness scanner: finds the leap-second assumptions in configuration files,
//! logs, code and data that will break or drift once continuous UTC takes effect.
//!
//! CGPM 2026 Resolution 5 (<https://www.bipm.org/en/cgpm-2026/resolution-5>): continuous UTC will
//! become effective on 20 May 2027, and the maximum |UT1-UTC| becomes 3600 s. From that date no
//! leap second is to be inserted, so TAI-UTC stays at the value then in force and UT1-UTC is
//! free to grow past the 0.9 s that software has long assumed.
//!
//! [`scan_text`] applies the rules below to one file's text and [`scan_paths`] walks files and
//! directories. Every finding names the rule, the file and line, the text matched, and what
//! happens after the effective date, in one of four classes:
//!
//! * `breaks`: will fail or reject valid input (an expired leap-second table that software
//!   checks; a check, clamp or field range that holds |UT1-UTC| within 0.9 s);
//! * `drifts`: a value that is or will be wrong (a stale TAI-UTC or GPS-UTC constant, a
//!   leap-second table missing entries);
//! * `review`: leap-second handling whose behaviour to check (NTP leap-indicator handling, leap
//!   smearing, leap-second files and feeds, `23:59:60` handling, DUT1 fields);
//! * `holds`: a constant that stays right after the date if no further leap second is inserted
//!   before it (TAI-UTC = 37 s, GPS-UTC = 18 s; none announced when this was written, to
//!   confirm with IERS Bulletin C).
//!
//! The scanner reads text only; it changes nothing. A finding is a pointer for a person to
//! check, not proof that the software misbehaves. Docs: docs/UTC-READINESS.md.

use std::path::{Path, PathBuf};

use serde::Serialize;

use crate::gnss_time::days_from_civil;

/// The format tag of the JSON report.
pub const FORMAT: &str = "kshana.utc-readiness/1";
/// The date continuous UTC takes effect (CGPM 2026 Resolution 5).
pub const EFFECTIVE_DATE: &str = "2027-05-20";
/// The source of [`EFFECTIVE_DATE`] and of the new UT1-UTC limit.
pub const SOURCE: &str = "CGPM 2026 Resolution 5, https://www.bipm.org/en/cgpm-2026/resolution-5: continuous UTC will become effective on 20 May 2027; maximum |UT1-UTC| 3600 s";
/// TAI-UTC in force since 2017-01-01 (s).
pub const TAI_MINUS_UTC_S: i64 = 37;
/// GPS-UTC in force since 2017-01-01 (s).
pub const GPS_MINUS_UTC_S: i64 = 18;
/// Files larger than this are skipped (bytes).
pub const MAX_FILE_BYTES: u64 = 8 * 1024 * 1024;
/// At most this many files are read in one scan.
pub const MAX_FILES: usize = 20_000;

/// One finding.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// Rule id.
    pub rule: &'static str,
    /// `breaks`, `drifts`, `review` or `holds`.
    pub class: &'static str,
    /// File as given or found.
    pub file: String,
    /// 1-based line number.
    pub line: usize,
    /// The line, trimmed and cut to 160 characters.
    pub excerpt: String,
    /// What happens after the effective date.
    pub message: String,
}

/// Counts per class.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Counts {
    /// Findings that will fail or reject valid input.
    pub breaks: usize,
    /// Values that are or will be wrong.
    pub drifts: usize,
    /// Handling to check.
    pub review: usize,
    /// Constants that stay right.
    pub holds: usize,
}

/// The report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// [`FORMAT`].
    pub format: &'static str,
    /// [`EFFECTIVE_DATE`].
    pub effective_date: &'static str,
    /// [`SOURCE`].
    pub source: &'static str,
    /// The date expiry is judged against (`YYYY-MM-DD`).
    pub as_of: String,
    /// Files read.
    pub files_scanned: usize,
    /// Files skipped (binary, too large, unreadable).
    pub files_skipped: usize,
    /// Findings, in file and line order.
    pub findings: Vec<Finding>,
    /// Counts per class.
    pub counts: Counts,
}

/// The `YYYY-MM-DD` date of a day count from 1970-01-01.
pub fn civil_from_days(z: i64) -> String {
    let z = z + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    let y = yoe + era * 400 + i64::from(m <= 2);
    format!("{y:04}-{m:02}-{d:02}")
}

/// Day count of a `YYYY-MM-DD` date.
pub fn parse_date(s: &str) -> Option<i64> {
    let mut it = s.trim().splitn(3, '-');
    let y: i64 = it.next()?.parse().ok()?;
    let m: u32 = it.next()?.parse().ok()?;
    let d: u32 = it.next()?.parse().ok()?;
    ((1..=12).contains(&m) && (1..=31).contains(&d)).then(|| days_from_civil(y, m, d))
}

/// NTP seconds (from 1900-01-01) to a day count from 1970-01-01.
fn ntp_days(s: i64) -> i64 {
    s.div_euclid(86_400) - 25_567
}

fn month(s: &str) -> Option<u32> {
    let m = [
        "jan", "feb", "mar", "apr", "may", "jun", "jul", "aug", "sep", "oct", "nov", "dec",
    ];
    m.iter()
        .position(|x| s.to_ascii_lowercase().starts_with(x))
        .map(|i| i as u32 + 1)
}

fn excerpt(line: &str) -> String {
    let t = line.trim();
    if t.chars().count() > 160 {
        t.chars().take(160).collect::<String>() + "…"
    } else {
        t.to_string()
    }
}

/// The first integer (optionally signed) that follows byte `from` in `line`.
fn int_after(line: &str, from: usize) -> Option<i64> {
    let b = line.as_bytes();
    let mut i = from;
    // The rest of the identifier (`tai_utc_offset`), then up to the number.
    while i < b.len() && (b[i].is_ascii_alphanumeric() || b[i] == b'_') {
        i += 1;
    }
    while i < b.len() && !b[i].is_ascii_digit() {
        // Stop at a letter so `tai_utc_table[3]` or a word does not lend its number.
        if b[i].is_ascii_alphabetic() {
            return None;
        }
        i += 1;
    }
    let s = i;
    while i < b.len() && b[i].is_ascii_digit() {
        i += 1;
    }
    if s == i || (i < b.len() && b[i] == b'.') {
        return None;
    }
    line[s..i].parse().ok()
}

/// Whether `low` contains a 0.9 s (or 0.8 s) style limit: `0.9`, `.9`, `0.90`, `0.8`.
fn has_subsecond_limit(low: &str) -> bool {
    let b = low.as_bytes();
    for (i, _) in low.match_indices('.') {
        let before_ok = i == 0
            || !b[i - 1].is_ascii_digit()
            || (b[i - 1] == b'0' && (i < 2 || !b[i - 2].is_ascii_digit()));
        let digits: String = low[i + 1..]
            .chars()
            .take_while(char::is_ascii_digit)
            .collect();
        if before_ok && (digits == "9" || digits == "90" || digits == "8" || digits == "80") {
            return true;
        }
    }
    false
}

const DUT1_KEYS: [&str; 5] = ["dut1", "ut1-utc", "ut1_utc", "ut1minusutc", "ut1_minus_utc"];
const TAI_KEYS: [&str; 7] = [
    "tai-utc",
    "tai_utc",
    "taiutc",
    "tai_minus_utc",
    "currentutcoffset",
    "utc_offset",
    "leap_seconds",
];
const GPS_KEYS: [&str; 6] = [
    "gps-utc",
    "gps_utc",
    "gpsutc",
    "gps_minus_utc",
    "gps_leap",
    "leapseconds_gps",
];
const NTP_KEYS: [&str; 10] = [
    "leapfile",
    "leapsectz",
    "leapsecmode",
    "leapseclist",
    "leap_smear",
    "leapsmear",
    "leap smear",
    "leap_indicator",
    "leapindicator",
    "leap indicator",
];
const FEED_KEYS: [&str; 5] = [
    "leap_second.dat",
    "leap-seconds.list",
    "leapseconds.list",
    "bulletin c",
    "bulletinc",
];

/// Scan one file's text. `as_of` is the day count expiry is judged against.
pub fn scan_text(file: &str, text: &str, as_of: i64) -> Vec<Finding> {
    let eff = parse_date(EFFECTIVE_DATE).unwrap_or(0);
    let mut out = Vec::new();
    let mut push =
        |rule: &'static str, class: &'static str, line: usize, l: &str, message: String| {
            out.push(Finding {
                rule,
                class,
                file: file.to_string(),
                line,
                excerpt: excerpt(l),
                message,
            });
        };
    let expiry = |day: i64| -> (&'static str, String) {
        let date = civil_from_days(day);
        if day < as_of {
            ("breaks", format!(
                "leap-second table expired on {date}: software that checks the expiry may warn, mark time unsynchronised or refuse the table. Under continuous UTC (from {EFFECTIVE_DATE}) no new leap second is due, but the expiry still needs a newer edition of the file or a change in how it is checked."
            ))
        } else if day < eff {
            ("review", format!(
                "leap-second table expires on {date}, before continuous UTC takes effect on {EFFECTIVE_DATE}: keep it updated, and check how the software treats the expiry once editions stop announcing leap seconds."
            ))
        } else {
            ("review", format!(
                "leap-second table expires on {date}: check how the software treats the expiry under continuous UTC (from {EFFECTIVE_DATE})."
            ))
        }
    };
    // Leap-seconds.list data lines: `<NTP seconds> <TAI-UTC>`; the last one gives the table's value.
    let mut last_entry: Option<(usize, i64, String)> = None;
    for (i, l) in text.lines().enumerate() {
        let n = i + 1;
        let low = l.to_ascii_lowercase();
        let t = l.trim();
        // IETF/NIST leap-seconds.list expiry `#@ <NTP seconds>`.
        if let Some(rest) = t.strip_prefix("#@") {
            if let Ok(s) = rest.trim().parse::<i64>() {
                let (c, m) = expiry(ntp_days(s));
                push("leap-file-expiry", c, n, l, m);
                continue;
            }
        }
        // tzdata `leapseconds` expiry: `#Expires 2026 Dec 28 00:00:00` (or `Expires ...`).
        let tz = t.trim_start_matches('#').trim_start();
        if let Some(rest) = tz.strip_prefix("Expires") {
            let p: Vec<&str> = rest.split_whitespace().collect();
            if let (Some(y), Some(m), Some(d)) = (
                p.first().and_then(|x| x.parse::<i64>().ok()),
                p.get(1).and_then(|x| month(x)),
                p.get(2).and_then(|x| x.parse::<u32>().ok()),
            ) {
                let (c, msg) = expiry(days_from_civil(y, m, d));
                push("leap-file-expiry", c, n, l, msg);
                continue;
            }
        }
        if !t.starts_with('#') {
            let data = t.split('#').next().unwrap_or("");
            let f: Vec<&str> = data.split_whitespace().collect();
            if f.len() >= 2 && f.len() <= 4 {
                if let (Ok(s), Ok(v)) = (f[0].parse::<i64>(), f[1].parse::<i64>()) {
                    if s > 2_000_000_000 && (10..=60).contains(&v) {
                        last_entry = Some((n, v, l.to_string()));
                    }
                }
            }
        }
        // DUT1 (UT1-UTC): a limit at 0.9 s breaks; any other mention is to review.
        if DUT1_KEYS.iter().any(|k| low.contains(k)) {
            if has_subsecond_limit(&low) {
                push("dut1-limit", "breaks", n, l, format!(
                    "|UT1-UTC| is held within a sub-second limit here. Under continuous UTC (from {EFFECTIVE_DATE}) |UT1-UTC| may grow up to 3600 s (CGPM 2026 Resolution 5): a check, clamp or field range at 0.9 s will reject, clip or overflow valid values."
                ));
            } else {
                push("dut1-field", "review", n, l, format!(
                    "a DUT1 (UT1-UTC) value or field: after {EFFECTIVE_DATE} its magnitude can exceed 0.9 s; check the field's width, units, sign handling and any validation."
                ));
            }
            continue;
        }
        // Hard-coded TAI-UTC and GPS-UTC.
        let mut hit_const = false;
        for (keys, want, rule, what) in [
            (
                &TAI_KEYS[..],
                TAI_MINUS_UTC_S,
                "tai-utc-constant",
                "TAI-UTC",
            ),
            (
                &GPS_KEYS[..],
                GPS_MINUS_UTC_S,
                "gps-utc-constant",
                "GPS-UTC",
            ),
        ] {
            if let Some((pos, k)) = keys.iter().find_map(|k| low.find(k).map(|p| (p, *k))) {
                if let Some(v) = int_after(&low, pos + k.len()) {
                    hit_const = true;
                    if v == want {
                        push(rule, "holds", n, l, format!(
                            "{what} = {v} s hard-coded: it stays right after {EFFECTIVE_DATE} if no leap second is inserted before then (none announced when this scanner was written; confirm with IERS Bulletin C). Software that adds future leap seconds from a feed should stop expecting them."
                        ));
                    } else if v < want && v >= want - 27 {
                        push(rule, "drifts", n, l, format!(
                            "{what} = {v} s hard-coded, but {want} s has been in force since 2017-01-01: this value is already wrong and stays wrong under continuous UTC."
                        ));
                    }
                }
            }
        }
        if hit_const {
            continue;
        }
        if NTP_KEYS.iter().any(|k| low.contains(k)) {
            push("leap-handling", "review", n, l, format!(
                "leap-second handling is configured here (leap file, leap indicator or smearing). Under continuous UTC no leap second is to be inserted after {EFFECTIVE_DATE}; check how this behaves when its leap-second file stops changing or expires, and any alarm tied to the NTP leap indicator."
            ));
            continue;
        }
        if FEED_KEYS.iter().any(|k| low.contains(k)) {
            push("leap-feed", "review", n, l, format!(
                "a leap-second file or bulletin is fetched or named here; check how the software behaves when the feed stops announcing leap seconds after {EFFECTIVE_DATE}, or its file expires."
            ));
            continue;
        }
        if low.contains("23:59:60") {
            push("leap-second-label", "review", n, l, format!(
                "handling of a 23:59:60 second: still needed for past data; no new one is expected after {EFFECTIVE_DATE}."
            ));
        }
    }
    if let Some((n, v, l)) = last_entry {
        if v < TAI_MINUS_UTC_S {
            push("leap-file-stale", "drifts", n, &l, format!(
                "the last entry of this leap-second table gives TAI-UTC = {v} s; {TAI_MINUS_UTC_S} s has been in force since 2017-01-01."
            ));
        }
    }
    out
}

fn walk(p: &Path, out: &mut Vec<PathBuf>) {
    if out.len() >= MAX_FILES {
        return;
    }
    if p.is_dir() {
        let name = p.file_name().and_then(|n| n.to_str()).unwrap_or("");
        if [".git", "target", "node_modules", ".hg", ".svn"].contains(&name) {
            return;
        }
        let mut v: Vec<PathBuf> = std::fs::read_dir(p)
            .map(|r| r.filter_map(|e| e.ok().map(|e| e.path())).collect())
            .unwrap_or_default();
        v.sort();
        for c in v {
            walk(&c, out);
        }
    } else if p.is_file() {
        out.push(p.to_path_buf());
    }
}

/// Scan files and directories (walked, sorted; `.git`, `target` and `node_modules` skipped).
pub fn scan_paths(paths: &[PathBuf], as_of: i64) -> Report {
    let mut files = Vec::new();
    for p in paths {
        walk(p, &mut files);
    }
    let (mut scanned, mut skipped) = (0, 0);
    let mut findings = Vec::new();
    for f in &files {
        let ok = std::fs::metadata(f).is_ok_and(|m| m.len() <= MAX_FILE_BYTES);
        let bytes = if ok { std::fs::read(f).ok() } else { None };
        let Some(bytes) = bytes.filter(|b| !b.iter().take(8192).any(|&c| c == 0)) else {
            skipped += 1;
            continue;
        };
        scanned += 1;
        let text = String::from_utf8_lossy(&bytes);
        findings.extend(scan_text(&f.display().to_string(), &text, as_of));
    }
    let mut counts = Counts::default();
    for f in &findings {
        match f.class {
            "breaks" => counts.breaks += 1,
            "drifts" => counts.drifts += 1,
            "review" => counts.review += 1,
            _ => counts.holds += 1,
        }
    }
    Report {
        format: FORMAT,
        effective_date: EFFECTIVE_DATE,
        source: SOURCE,
        as_of: civil_from_days(as_of),
        files_scanned: scanned,
        files_skipped: skipped,
        findings,
        counts,
    }
}

/// The report as text: one line per finding, then the counts.
pub fn text(r: &Report) -> String {
    let mut s = String::new();
    for f in &r.findings {
        s.push_str(&format!(
            "{}:{}: [{}] {}: {}\n    {}\n",
            f.file, f.line, f.class, f.rule, f.message, f.excerpt
        ));
    }
    s.push_str(&format!(
        "summary: effective_date={} as_of={} files={} breaks={} drifts={} review={} holds={}\n",
        r.effective_date,
        r.as_of,
        r.files_scanned,
        r.counts.breaks,
        r.counts.drifts,
        r.counts.review,
        r.counts.holds
    ));
    s
}

fn today() -> i64 {
    let s = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs() as i64)
        .unwrap_or(0);
    s.div_euclid(86_400)
}

/// `kshana utc-readiness [--json] [--as-of <YYYY-MM-DD>] <file|dir> ...`. Returns the exit code:
/// 0 no `breaks` finding, 1 at least one, 2 a usage or input error.
pub fn run_cli(args: &[String]) -> i32 {
    let usage = || {
        eprintln!("{}", crate::t!("utc-readiness-usage"));
        2
    };
    let mut json = false;
    let mut as_of = today();
    let mut paths = Vec::new();
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--json" => json = true,
            "--as-of" => match args.get(i + 1).and_then(|s| parse_date(s)) {
                Some(d) => {
                    as_of = d;
                    i += 1;
                }
                None => return usage(),
            },
            "--help" | "-h" => {
                println!("{}", crate::t!("utc-readiness-usage"));
                return 0;
            }
            a if a.starts_with("--") => return usage(),
            a => paths.push(PathBuf::from(a)),
        }
        i += 1;
    }
    if paths.is_empty() {
        return usage();
    }
    for p in &paths {
        if !p.exists() {
            eprintln!(
                "{}",
                crate::terr!(
                    "e-utc-readiness-cannot-read",
                    path = p.display().to_string(),
                    e = std::io::Error::from(std::io::ErrorKind::NotFound).to_string()
                )
            );
            return 2;
        }
    }
    let r = scan_paths(&paths, as_of);
    if json {
        println!("{}", serde_json::to_string_pretty(&r).unwrap_or_default());
    } else {
        print!("{}", text(&r));
    }
    i32::from(r.counts.breaks > 0)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn dates_round_trip() {
        for s in ["1970-01-01", "2000-02-29", "2027-05-20", "2036-02-07"] {
            assert_eq!(civil_from_days(parse_date(s).unwrap()), s);
        }
        // NTP 3_976_214_400 s is 2026-01-01 (126 years incl. 31 leap days).
        assert_eq!(civil_from_days(ntp_days(3_976_214_400)), "2026-01-01");
    }

    #[test]
    fn subsecond_limits() {
        assert!(has_subsecond_limit("if abs(dut1) > 0.9:"));
        assert!(has_subsecond_limit("dut1 <= .9"));
        assert!(!has_subsecond_limit("dut1 = 10.9"));
        assert!(!has_subsecond_limit("dut1 = 1.25"));
    }
}
