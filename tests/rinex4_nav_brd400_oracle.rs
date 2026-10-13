// SPDX-License-Identifier: AGPL-3.0-only
//! RINEX 4 navigation reading checked against the same day's RINEX 3 file.
//!
//! Oracle (published data): the IGS merged broadcast files of 2026-07-19 written by
//! DLR in RINEX 4.02 (`BRD400DLR_S`) and RINEX 3.04 (`BRDM00DLR_S`). The bars were
//! committed alone, before this test first ran, in
//! `tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION.md`:
//!
//! - B1: every Keplerian/clock field of every record present in both files agrees
//!   within the last printed digit (one unit in the 12th mantissa decimal).
//! - B2: `sv_position_ecef(toe)` agrees to < 1 mm.
//! - B3: matched records ≥ 20 GPS, ≥ 100 Galileo, ≥ 30 BeiDou on the slice
//!   (≥ 200 / 1000 / 300 on the full day).
//! - B4: every `> EPH` record of a decoded message type (BeiDou GEOs aside under
//!   the default options) is decoded.
//!
//! The full-day files run when `KSHANA_BRD400_FULL` and `KSHANA_BRDM_FULL` name
//! their uncompressed paths.
//!
//! PIN-SCOPE: decoded-value agreement between the RINEX 4.02 and RINEX 3.04 files
//! of one day, and the record counts of the committed slices.
//! PIN-EXCLUDES: transmission times (not compared, see the pre-registration),
//! the GLONASS/SBAS/IRNSS/CNAV records (not decoded), and orbit accuracy.

use kshana::rinex::{parse_nav, parse_nav_with, NavParseOptions, RinexEphemeris};
use std::collections::BTreeMap;

const V4: &str = include_str!("fixtures/brdc_rinex4_2026200/BRD400DLR_S_20262000000_slice.rnx");
const V3: &str = include_str!("fixtures/brdc_rinex4_2026200/BRDM00DLR_S_20262000000_slice.rnx");

type Key = (char, u8, [i64; 6], i64, i64, i64);

fn key(e: &RinexEphemeris) -> Key {
    let t = e.toc;
    (
        e.system,
        e.prn,
        [
            t.year as i64,
            t.month as i64,
            t.day as i64,
            t.hour as i64,
            t.minute as i64,
            t.second.round() as i64,
        ],
        e.toe.round() as i64,
        e.iode.round() as i64,
        e.data_sources.round() as i64,
    )
}

fn fields(e: &RinexEphemeris) -> [(&'static str, f64); 26] {
    [
        ("af0", e.af0),
        ("af1", e.af1),
        ("af2", e.af2),
        ("iode", e.iode),
        ("crs", e.crs),
        ("delta_n", e.delta_n),
        ("m0", e.m0),
        ("cuc", e.cuc),
        ("e", e.e),
        ("cus", e.cus),
        ("sqrt_a", e.sqrt_a),
        ("toe", e.toe),
        ("cic", e.cic),
        ("omega0", e.omega0),
        ("cis", e.cis),
        ("i0", e.i0),
        ("crc", e.crc),
        ("omega", e.omega),
        ("omega_dot", e.omega_dot),
        ("idot", e.idot),
        ("data_sources", e.data_sources),
        ("week", e.gps_week),
        ("sv_accuracy", e.sv_accuracy),
        ("sv_health", e.sv_health),
        ("tgd", e.tgd),
        ("iodc", e.iodc),
    ]
}

/// One unit in the 12th decimal of a normalised D19.12 mantissa.
fn within_last_digit(a: f64, b: f64) -> bool {
    if a == b {
        return true;
    }
    let m = a.abs().max(b.abs());
    let ulp = 10f64.powf(m.log10().floor() - 12.0);
    (a - b).abs() <= ulp * (1.0 + 1e-9)
}

fn first_per_key(ephs: Vec<RinexEphemeris>) -> BTreeMap<Key, RinexEphemeris> {
    let mut m = BTreeMap::new();
    for e in ephs {
        m.entry(key(&e)).or_insert(e);
    }
    m
}

/// Number of `> EPH` records of the decoded message types, BeiDou GEOs excluded.
fn decodable_eph_headers(text: &str) -> usize {
    text.lines()
        .filter(|l| l.starts_with('>'))
        .filter(|l| {
            let t: Vec<&str> = l[1..].split_whitespace().collect();
            if t.len() < 3 || t[0] != "EPH" {
                return false;
            }
            let sys = t[1].chars().next().unwrap();
            let prn: u8 = t[1][1..].parse().unwrap();
            let decoded = matches!(
                (sys, t[2]),
                ('G', "LNAV")
                    | ('E', "INAV")
                    | ('E', "FNAV")
                    | ('C', "D1")
                    | ('C', "D2")
                    | ('J', "LNAV")
            );
            let geo = sys == 'C' && matches!(prn, 1..=5 | 59..=63);
            decoded && !geo
        })
        .count()
}

struct Outcome {
    matched: BTreeMap<char, usize>,
    worst_field: (f64, String),
    worst_pos_m: f64,
    misses: Vec<String>,
}

fn compare(v4_text: &str, v3_text: &str) -> Outcome {
    let opts = NavParseOptions {
        include_beidou_geo: true,
    };
    let v4 = first_per_key(parse_nav_with(v4_text, opts).expect("RINEX 4 parses"));
    let v3 = first_per_key(parse_nav_with(v3_text, opts).expect("RINEX 3 parses"));
    let mut out = Outcome {
        matched: BTreeMap::new(),
        worst_field: (0.0, String::new()),
        worst_pos_m: 0.0,
        misses: Vec::new(),
    };
    let mut only4: BTreeMap<char, usize> = BTreeMap::new();
    let mut total4: BTreeMap<char, usize> = BTreeMap::new();
    for (k, a) in &v4 {
        *total4.entry(k.0).or_default() += 1;
        let Some(b) = v3.get(k) else {
            *only4.entry(k.0).or_default() += 1;
            continue;
        };
        *out.matched.entry(k.0).or_default() += 1;
        for ((name, x), (_, y)) in fields(a).iter().zip(fields(b).iter()) {
            if !within_last_digit(*x, *y) {
                out.misses
                    .push(format!("{}{:02} {name}: v4 {x:e} v3 {y:e}", k.0, k.1));
            }
            let m = x.abs().max(y.abs());
            if m > 0.0 {
                let r = (x - y).abs() / 10f64.powf(m.log10().floor() - 12.0);
                if r > out.worst_field.0 {
                    out.worst_field = (r, format!("{}{:02} {name}", k.0, k.1));
                }
            }
        }
        let (p, q) = (a.sv_position_ecef(a.toe), b.sv_position_ecef(b.toe));
        let d = ((p[0] - q[0]).powi(2) + (p[1] - q[1]).powi(2) + (p[2] - q[2]).powi(2)).sqrt();
        if d >= 1e-3 {
            out.misses
                .push(format!("{}{:02} position differs by {d:.4} m", k.0, k.1));
        }
        out.worst_pos_m = out.worst_pos_m.max(d);
    }
    let mut total3: BTreeMap<char, usize> = BTreeMap::new();
    for k in v3.keys() {
        *total3.entry(k.0).or_default() += 1;
    }
    eprintln!(
        "keys: RINEX 4 {total4:?} (not in RINEX 3: {only4:?}); RINEX 3 {total3:?}; matched {:?}",
        out.matched
    );
    eprintln!(
        "worst field difference {:.3} last-digit units ({}); worst position difference {:.3e} m",
        out.worst_field.0, out.worst_field.1, out.worst_pos_m
    );
    out
}

fn assert_bars(o: &Outcome, min: [usize; 3]) {
    assert!(
        o.misses.is_empty(),
        "B1/B2 misses ({}): {:?}",
        o.misses.len(),
        &o.misses[..o.misses.len().min(20)]
    );
    for (sys, n) in [('G', min[0]), ('E', min[1]), ('C', min[2])] {
        let got = o.matched.get(&sys).copied().unwrap_or(0);
        assert!(got >= n, "B3: {sys} matched {got} < {n}");
    }
}

#[test]
fn rinex4_slice_matches_rinex3_slice() {
    let o = compare(V4, V3);
    assert_bars(&o, [20, 100, 30]);
}

#[test]
fn rinex4_slice_decodes_every_legacy_eph_record() {
    // B4, default options (BeiDou GEOs skipped as before).
    let n = parse_nav(V4).expect("RINEX 4 parses").len();
    assert_eq!(n, decodable_eph_headers(V4), "B4");
    // Counts of the committed slice, by message type (see NOTICE.md).
    assert_eq!(decodable_eph_headers(V4), 37 + 263 + 231 + 64);
}

#[test]
fn rinex4_full_day_matches_rinex3_full_day() {
    let (Ok(p4), Ok(p3)) = (
        std::env::var("KSHANA_BRD400_FULL"),
        std::env::var("KSHANA_BRDM_FULL"),
    ) else {
        eprintln!(
            "skipped: set KSHANA_BRD400_FULL and KSHANA_BRDM_FULL to the uncompressed \
             BRD400DLR_S_20262000000_01D_MN.rnx and BRDM00DLR_S_20262000000_01D_MN.rnx"
        );
        return;
    };
    let t4 = std::fs::read_to_string(p4).expect("read RINEX 4 file");
    let t3 = std::fs::read_to_string(p3).expect("read RINEX 3 file");
    assert_eq!(
        parse_nav(&t4).expect("parses").len(),
        decodable_eph_headers(&t4),
        "B4 (full day)"
    );
    let o = compare(&t4, &t3);
    assert_bars(&o, [200, 1000, 300]);
}
