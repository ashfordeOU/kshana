// SPDX-License-Identifier: AGPL-3.0-only
//! Shared reader for `vintages.csv` and `finals_b.csv` (see `generate.py` and `NOTICE.md`
//! beside this file). Included by the two Bulletin A oracle tests through `#[path]`.
//!
//! It rebuilds, for each archived IERS Bulletin A issue, an as-issued `finals2000A` body:
//! the issue's as-issued rapid rows up to its MJD0 (their Bulletin B block filled with the
//! same rapid values, which only marks the data cutoff; no scoring path reads it) and the
//! issue's own predictions as prediction-only rows (blank Bulletin B). The later truth is a
//! single body built from the frozen finals2000A.all Bulletin B block.

#![allow(dead_code)]

use std::collections::BTreeMap;

const VINTAGES: &str = include_str!("vintages.csv");
const FINALS_B: &str = include_str!("finals_b.csv");

/// One archived Bulletin A issue.
pub struct Issue {
    pub id: String,
    pub mjd0: f64,
    /// Printed polar-motion accuracy formula: coefficient (arcsec) and exponent.
    pub sxy: (f64, f64),
    /// Printed UT1-UTC accuracy formula: coefficient (s) and exponent.
    pub st: (f64, f64),
    /// As-issued rapid rows `(mjd, x, y, ut1)`, all at or before `mjd0`.
    pub rapid: Vec<(f64, f64, f64, f64)>,
    /// The issue's predictions `(mjd, x, y, ut1)`.
    pub preds: Vec<(f64, f64, f64, f64)>,
}

impl Issue {
    /// IERS printed accuracy of a UT1-UTC prediction `h` days past MJD0, seconds.
    pub fn s_t(&self, h: f64) -> f64 {
        self.st.0 * h.powf(self.st.1)
    }
    /// IERS printed accuracy of one polar-motion coordinate `h` days past MJD0, arcsec.
    pub fn s_xy(&self, h: f64) -> f64 {
        self.sxy.0 * h.powf(self.sxy.1)
    }
    /// The as-issued `finals2000A` body of this issue.
    pub fn as_issued_body(&self) -> String {
        let mut s = String::new();
        for &(m, x, y, u) in &self.rapid {
            s.push_str(&finals_line(m, x, y, u, Some((x, y, u))));
            s.push('\n');
        }
        for &(m, x, y, u) in &self.preds {
            s.push_str(&finals_line(m, x, y, u, None));
            s.push('\n');
        }
        s
    }
}

/// One `finals2000A` data line with the columns `eop::parse_line` and the Bulletin B
/// parsers read (0-indexed: MJD 7..15, x 18..27, y 37..46, UT1 58..68, Bulletin B x
/// 134..144, y 144..154, UT1 154..165), and the IERS I/P flags (columns 17 and 58, 0-indexed
/// 16 and 57). With `b = None` the Bulletin B block is absent and both flags are `P`: the row is
/// one of the issue's predictions. With `b = Some(..)` both flags are `I` (measured). Since
/// release 0.30 the crate classifies predictions by these flags, as the IERS format does.
pub fn finals_line(mjd: f64, x: f64, y: f64, ut1: f64, b: Option<(f64, f64, f64)>) -> String {
    let mut line = vec![b' '; 188];
    let mut put = |range: std::ops::Range<usize>, text: String| {
        assert_eq!(text.len(), range.len(), "field {range:?} <{text}>");
        line[range].copy_from_slice(text.as_bytes());
    };
    put(7..15, format!("{mjd:8.2}"));
    let flag = if b.is_some() { "I" } else { "P" };
    put(16..17, flag.to_string());
    put(57..58, flag.to_string());
    put(18..27, format!("{x:9.6}"));
    put(37..46, format!("{y:9.6}"));
    put(58..68, format!("{ut1:10.7}"));
    let mut len = 68;
    if let Some((xb, yb, ub)) = b {
        put(134..144, format!("{xb:10.6}"));
        put(144..154, format!("{yb:10.6}"));
        put(154..165, format!("{ub:11.7}"));
        len = 165;
    }
    line.truncate(len);
    String::from_utf8(line).unwrap()
}

fn data_lines(text: &str) -> impl Iterator<Item = Vec<&str>> {
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1)
        .map(|l| l.split(',').collect())
}

/// Every issue in `vintages.csv`, in MJD0 order.
pub fn issues() -> Vec<Issue> {
    let mut by_id: BTreeMap<(i64, String), Issue> = BTreeMap::new();
    for f in data_lines(VINTAGES) {
        let num = |i: usize| f[i].parse::<f64>().unwrap();
        let mjd0 = num(1);
        let issue = by_id
            .entry((mjd0 as i64, f[0].to_string()))
            .or_insert_with(|| Issue {
                id: f[0].to_string(),
                mjd0,
                sxy: (num(2), num(3)),
                st: (num(4), num(5)),
                rapid: Vec::new(),
                preds: Vec::new(),
            });
        let row = (num(7), num(8), num(9), num(10));
        match f[6] {
            "R" => issue.rapid.push(row),
            "P" => issue.preds.push(row),
            k => panic!("unknown row kind {k}"),
        }
    }
    by_id.into_values().collect()
}

/// The later-truth body: the frozen finals2000A.all Bulletin B block at every target date
/// (the Bulletin A columns carry the same values so `eop::parse_line` accepts the row).
pub fn later_finals_body() -> String {
    let mut s = String::new();
    for f in data_lines(FINALS_B) {
        let num = |i: usize| f[i].parse::<f64>().unwrap();
        let (m, x, y, u) = (num(0), num(1), num(2), num(3));
        s.push_str(&finals_line(m, x, y, u, Some((x, y, u))));
        s.push('\n');
    }
    s
}
