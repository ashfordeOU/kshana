// SPDX-License-Identifier: AGPL-3.0-only
//! Readers for I/NAV page input: the plain page format (see [`super::page`]) and the
//! CSV layout of the published test-vector archive (`SVID,NumNavBits,NavBitsHEX`, one
//! row per satellite holding consecutive 240-bit page pairs from a known start time).

use super::page::{InavPage, PAGE_BITS};
use super::WEEK_S;

/// Seconds a page pair spans.
const PAGE_S: u32 = 2;

/// Parse the plain format: `<svid> <gst_seconds> <60 hex digits>` per line.
pub fn parse_pages(text: &str) -> Result<Vec<InavPage>, String> {
    let mut out = Vec::new();
    for (n, line) in text.lines().enumerate() {
        match InavPage::parse_line(line) {
            Ok(Some(p)) => out.push(p),
            Ok(None) => {}
            Err(e) => return Err(format!("line {}: {e}", n + 1)),
        }
    }
    Ok(out)
}

/// Parse the test-vector CSV layout. Page `i` of every satellite starts at
/// `start_gst + 2 i`; the rows are interleaved so the output is in time order.
pub fn parse_vector_csv(text: &str, start_gst: u32) -> Result<Vec<InavPage>, String> {
    let mut rows: Vec<(u8, Vec<&str>)> = Vec::new();
    for (n, line) in text.lines().enumerate() {
        let line = line.trim();
        if line.is_empty() || line.starts_with("SVID") {
            continue;
        }
        let f: Vec<&str> = line.split(',').collect();
        if f.len() != 3 {
            return Err(format!("line {}: expected 3 fields", n + 1));
        }
        let svid: u8 = f[0]
            .trim()
            .parse()
            .map_err(|_| format!("line {}: bad SVID", n + 1))?;
        let nbits: usize = f[1]
            .trim()
            .parse()
            .map_err(|_| format!("line {}: bad bit count", n + 1))?;
        let hex = f[2].trim();
        if hex.len() * 4 < nbits || nbits % PAGE_BITS != 0 {
            return Err(format!("line {}: bit count does not match the data", n + 1));
        }
        let per = PAGE_BITS / 4;
        rows.push((
            svid,
            (0..nbits / PAGE_BITS)
                .map(|i| &hex[i * per..(i + 1) * per])
                .collect(),
        ));
    }
    let n_pages = rows.iter().map(|(_, p)| p.len()).max().unwrap_or(0);
    let mut out = Vec::new();
    for i in 0..n_pages {
        for (svid, pages) in &rows {
            if let Some(h) = pages.get(i) {
                let t = start_gst + PAGE_S * i as u32;
                out.push(InavPage::from_hex(*svid, t, h).map_err(|e| e.to_string())?);
            }
        }
    }
    Ok(out)
}

/// The start time in GST seconds from a test-vector file name such as
/// `16_AUG_2023_GST_05_00_01.csv`.
pub fn start_from_filename(name: &str) -> Option<u32> {
    let stem = name.rsplit('/').next()?.strip_suffix(".csv")?;
    let p: Vec<&str> = stem.split('_').collect();
    if p.len() != 7 || p[3] != "GST" {
        return None;
    }
    let day: i64 = p[0].parse().ok()?;
    let month = [
        "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC",
    ]
    .iter()
    .position(|m| *m == p[1])? as i64
        + 1;
    let year: i64 = p[2].parse().ok()?;
    let (h, m, s): (i64, i64, i64) = (p[4].parse().ok()?, p[5].parse().ok()?, p[6].parse().ok()?);
    // The GST epoch is 1999-08-22 00:00:00 (a Sunday).
    let days = days_from_civil(year, month, day) - days_from_civil(1999, 8, 22);
    let secs = days * 86_400 + h * 3600 + m * 60 + s;
    u32::try_from(secs).ok().filter(|s| *s / WEEK_S < 4096)
}

/// Days since 1970-01-01 (proleptic Gregorian); Hinnant's `days_from_civil`.
fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = if y >= 0 { y } else { y - 399 } / 400;
    let yoe = y - era * 400;
    let doy = (153 * (if m > 2 { m - 3 } else { m + 9 }) + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// A short week/time-of-week label for a GST second count.
pub fn label(gst: u32) -> String {
    format!("WN {} TOW {}", gst / WEEK_S, gst % WEEK_S)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn filename_to_gst_seconds() {
        // 2023-08-16 05:00:01 is GPS week 2275 = GST week 1251 (GST weeks are GPS weeks minus 1024), a Wednesday.
        let s = start_from_filename("x/y/16_AUG_2023_GST_05_00_01.csv").unwrap();
        assert_eq!(s / WEEK_S, 1251);
        assert_eq!(s % WEEK_S, 3 * 86_400 + 5 * 3600 + 1);
        assert_eq!(start_from_filename("notes.csv"), None);
        assert_eq!(start_from_filename("16_XXX_2023_GST_05_00_01.csv"), None);
    }

    #[test]
    fn csv_rows_interleave_in_time_order() {
        let page = "00".repeat(30);
        let csv = format!("SVID,NumNavBits,NavBitsHEX\n02,480,{page}{page}\n03,240,{page}\n");
        let p = parse_vector_csv(&csv, 1000).unwrap();
        let got: Vec<(u8, u32)> = p.iter().map(|p| (p.svid, p.gst)).collect();
        assert_eq!(got, vec![(2, 1000), (3, 1000), (2, 1002)]);
        assert!(parse_vector_csv("02,241,00\n", 0).is_err());
    }

    #[test]
    fn plain_pages_report_the_failing_line() {
        let ok = format!("2 100 {}\n# c\n", "00".repeat(30));
        assert_eq!(parse_pages(&ok).unwrap().len(), 1);
        let bad = format!("{ok}2 x 00\n");
        assert!(parse_pages(&bad).unwrap_err().starts_with("line 3"));
    }
}
