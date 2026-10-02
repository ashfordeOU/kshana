// SPDX-License-Identifier: AGPL-3.0-only
//! Readers for measured clock records: RINEX (Receiver Independent Exchange Format) clock and
//! International GNSS Service (IGS) clock files into gridded phase records, the BIPM
//! (International Bureau of Weights and Measures) per-laboratory `[UTC - UTC(k)]` files, and
//! Section 1 of BIPM Circular T.
//!
//! The readers only parse. Gaps, outliers and discontinuities are found and logged by
//! [`crate::clock_library::condition`]; the gridding log here counts what could not be placed on
//! the grid at all.

use crate::clock_library::series::{GriddingLog, PhaseSeries};
use crate::precise_products::parse_clock_rinex;

/// The satellite (`AS`) clock record of `sat` (e.g. `"G08"`) across several RINEX clock files
/// (for example consecutive daily IGS files), gridded at `tau0` seconds from its first epoch.
/// Times are seconds from the GPS epoch; a record repeated in two files is kept once.
pub fn rinex_clock_series(
    texts: &[&str],
    sat: &str,
    tau0: f64,
) -> Result<(PhaseSeries, GriddingLog), String> {
    let mut samples: Vec<(f64, f64)> = Vec::new();
    for t in texts {
        let c = parse_clock_rinex(t)?;
        if let Some(v) = c.sats.get(sat) {
            samples.extend_from_slice(v);
        }
    }
    if samples.is_empty() {
        return Err(format!("no AS records for {sat}"));
    }
    samples.sort_by(|a, b| a.0.total_cmp(&b.0));
    samples.dedup_by(|a, b| a.0 == b.0);
    Ok(PhaseSeries::from_samples(&samples, tau0))
}

/// Every satellite with `AS` records in any of `texts`, sorted.
pub fn rinex_clock_satellites(texts: &[&str]) -> Result<Vec<String>, String> {
    let mut out: Vec<String> = Vec::new();
    for t in texts {
        out.extend(parse_clock_rinex(t)?.sats.into_keys());
    }
    out.sort();
    out.dedup();
    Ok(out)
}

/// A BIPM per-laboratory `[UTC - UTC(k)]` file (`utc-<lab>` from the Time Department's
/// `utcr` products): every line whose first two fields parse as an integer MJD (Modified Julian
/// Date) and a finite number (ns). Rows printed `-` are skipped. Sorted by MJD; a repeated MJD
/// keeps its first value.
pub fn parse_bipm_utclab(text: &str) -> Vec<(i64, f64)> {
    let mut v: Vec<(i64, f64)> = text
        .lines()
        .filter_map(|l| {
            let mut f = l.split_whitespace();
            let m = f.next()?.parse::<i64>().ok()?;
            let x = f.next()?.parse::<f64>().ok()?;
            x.is_finite().then_some((m, x))
        })
        .collect();
    v.sort_by_key(|p| p.0);
    v.dedup_by_key(|p| p.0);
    v
}

/// One laboratory row of Circular T Section 1.
#[derive(Clone, Debug, PartialEq)]
pub struct CircularTRow {
    /// Laboratory acronym (e.g. `"PTB"`).
    pub code: String,
    /// `[UTC - UTC(k)]` (ns) at each of the section's MJDs; `None` where printed `-`.
    pub values: Vec<Option<f64>>,
    /// Statistical uncertainty uA (ns).
    pub u_a: Option<f64>,
    /// Systematic uncertainty uB (ns); `None` where printed `NC` or `-`.
    pub u_b: Option<f64>,
    /// Combined uncertainty u (ns); `None` where printed `-`.
    pub u: Option<f64>,
}

/// Section 1 of a Circular T issue.
#[derive(Clone, Debug, PartialEq, Default)]
pub struct CircularTSection1 {
    /// The issue number from the first line (`CIRCULAR T 464`).
    pub issue: Option<u32>,
    /// The section's MJD columns.
    pub mjds: Vec<i64>,
    /// One row per laboratory, values in the order of `mjds`.
    pub rows: Vec<CircularTRow>,
}

impl CircularTSection1 {
    /// The `(MJD, value)` pairs of laboratory `code`.
    pub fn series(&self, code: &str) -> Vec<(i64, f64)> {
        self.rows
            .iter()
            .filter(|r| r.code == code)
            .flat_map(|r| {
                self.mjds
                    .iter()
                    .zip(&r.values)
                    .filter_map(|(m, v)| v.map(|v| (*m, v)))
            })
            .collect()
    }
}

/// Parse Section 1 ("Difference between UTC and its local realizations UTC(k)") of a Circular T
/// text issue. Laboratory rows start with the acronym; an optional parenthesised location
/// follows; then one value per MJD column (`-` when absent) and the uA, uB, u columns (`NC` or
/// `-` when not given). Parsing stops at the Section 2 heading.
pub fn parse_circular_t_section1(text: &str) -> Result<CircularTSection1, String> {
    let mut out = CircularTSection1::default();
    let mut lines = text.lines();
    if let Some(first) = lines.clone().next() {
        out.issue = first
            .trim()
            .strip_prefix("CIRCULAR T")
            .and_then(|r| r.split_whitespace().next())
            .and_then(|n| n.parse().ok());
    }
    // Find Section 1.
    for l in lines.by_ref() {
        if l.trim_start().starts_with("1 -") {
            break;
        }
    }
    let mut in_rows = false;
    for l in lines {
        let t = l.trim();
        if t.starts_with("2 -") {
            break;
        }
        if out.mjds.is_empty() {
            if let Some(rest) = t.strip_prefix("MJD") {
                out.mjds = rest
                    .split_whitespace()
                    .map_while(|f| f.parse::<i64>().ok())
                    .collect();
            }
            continue;
        }
        if t.starts_with("Laboratory") {
            in_rows = true;
            continue;
        }
        if !in_rows || t.is_empty() {
            continue;
        }
        let code = t.split_whitespace().next().unwrap_or_default().to_string();
        let rest = match (t.find('('), t.find(')')) {
            (Some(a), Some(b)) if b > a => &t[b + 1..],
            _ => &t[code.len()..],
        };
        let f: Vec<&str> = rest.split_whitespace().collect();
        let n = out.mjds.len();
        if f.len() < n + 3 {
            return Err(format!("short Circular T row: {t:?}"));
        }
        let num = |s: &str| -> Result<Option<f64>, String> {
            match s {
                "-" | "NC" => Ok(None),
                _ => s
                    .parse::<f64>()
                    .map(Some)
                    .map_err(|_| format!("bad value {s:?} in {t:?}")),
            }
        };
        let values = f[..n]
            .iter()
            .map(|s| num(s))
            .collect::<Result<Vec<_>, _>>()?;
        out.rows.push(CircularTRow {
            code,
            values,
            u_a: num(f[n])?,
            u_b: num(f[n + 1])?,
            u: num(f[n + 2])?,
        });
    }
    if out.mjds.is_empty() {
        return Err("no Section 1 MJD header found".into());
    }
    Ok(out)
}

#[cfg(test)]
mod tests {
    use super::*;

    const CLK: &str =
        "     3.04           C                                       RINEX VERSION / TYPE
                                                            END OF HEADER
AS G08  2026 03 01 00 00  0.000000  1    1.000000000000E-04
AS G08  2026 03 01 00 00 30.000000  1    1.000000100000E-04
AS G08  2026 03 01 00 01 30.000000  1    1.000000300000E-04
AS G10  2026 03 01 00 00  0.000000  1   -2.000000000000E-04
";

    #[test]
    fn rinex_clock_records_grid_with_gaps() {
        let (s, log) = rinex_clock_series(&[CLK, CLK], "G08", 30.0).unwrap();
        assert_eq!(s.len(), 4);
        assert!(s.x[2].is_nan());
        assert!((s.x[3] - 1.0000003e-4).abs() < 1e-18);
        assert_eq!(log, GriddingLog::default());
        assert_eq!(rinex_clock_satellites(&[CLK]).unwrap(), vec!["G08", "G10"]);
        assert!(rinex_clock_series(&[CLK], "G01", 30.0).is_err());
    }

    #[test]
    fn utclab_rows() {
        let t = "# header\n 60000   1.5  0.3\n60005 -\n60010 -2.25 x\nbad line\n";
        assert_eq!(parse_bipm_utclab(t), vec![(60000, 1.5), (60010, -2.25)]);
    }

    // Layout of a Circular T text issue; the numbers are made up.
    const CIRT: &str = "CIRCULAR T 999                                   ISSN 1143-1393
2030 JANUARY 01, 07h UTC

1 - Difference between UTC and its local realizations UTC(k) and corresponding uncertainties.

Date 2029    0h UTC         DEC  1   DEC  6   Uncertainty/ns Notes
       MJD                   62000    62005     uA    uB    u
Laboratory k                       [UTC-UTC(k)]/ns

AAA  (Somewhere)              10.5     -2.0    0.2   3.0   3.0
BBB  (Other Place)              -        4.1    0.7    NC     -
CCC                           1.0      1.5    0.2   1.3   1.3

2 - Something else
DDD  (Ignored)                 9.9      9.9    0.2   1.0   1.0
";

    #[test]
    fn circular_t_section_1() {
        let c = parse_circular_t_section1(CIRT).unwrap();
        assert_eq!(c.issue, Some(999));
        assert_eq!(c.mjds, vec![62000, 62005]);
        assert_eq!(c.rows.len(), 3);
        assert_eq!(c.rows[1].values, vec![None, Some(4.1)]);
        assert_eq!(c.rows[1].u_b, None);
        assert_eq!(c.rows[1].u, None);
        assert_eq!(c.rows[2].code, "CCC");
        assert_eq!(c.series("AAA"), vec![(62000, 10.5), (62005, -2.0)]);
        assert!(parse_circular_t_section1("nothing").is_err());
    }
}
