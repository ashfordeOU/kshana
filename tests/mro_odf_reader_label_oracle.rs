// SPDX-License-Identifier: AGPL-3.0-only
//! The TRK-2-18 ODF reader (`odf::parse_odf`) on a real Mars Reconnaissance Orbiter Orbit Data
//! File, against its PDS label (CAP-30, stage 1).
//!
//! ORACLE: the PDS3 label the DSN navigation data-conditioning process produced with the file:
//! the record count, the record at which each group starts, each table's row count, the
//! stations, and the start and stop times. The reader never reads the label. This test parses
//! the label separately.
//!
//! BARS, registered in `xval/mro-odf/PREREGISTRATION.md` (commit d54306bf, before the reader
//! existed):
//!
//! - R1: record count;
//! - R2: group header positions;
//! - R3: rows per group;
//! - R4: receiving stations;
//! - R5: first and last time tags within 1 s of the label's start and stop;
//! - R6: data types known, and Doppler reference frequencies positive.
//!
//! FIRST RUN: R1, R2, R4, R5 and R6 hold. R3 holds for every table except the end-of-file data
//! table. There the label states 120 rows, the file holds 121, and the label's table ends one
//! record before its own FILE_RECORDS. This is pinned below as a FINDING.

use kshana::odf::{parse_odf, seconds_1950};
use std::collections::{BTreeMap, BTreeSet};
use std::path::PathBuf;

fn fixture(name: &str) -> Vec<u8> {
    std::fs::read(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("tests/fixtures/mro_odf")
            .join(name),
    )
    .expect("fixture")
}

struct Label {
    file_records: usize,
    pointers: BTreeMap<String, usize>,
    rows: BTreeMap<String, usize>,
    stations: BTreeSet<u8>,
    start: f64,
    stop: f64,
}

fn parse_time(v: &str) -> f64 {
    // YYYY-DDDTHH:MM:SS
    let v = v.trim();
    let year: i32 = v[0..4].parse().unwrap();
    let doy: u32 = v[5..8].parse().unwrap();
    let h: u32 = v[9..11].parse().unwrap();
    let m: u32 = v[12..14].parse().unwrap();
    let s: f64 = v[15..17].parse().unwrap();
    seconds_1950(year, doy, h, m, s)
}

fn label() -> Label {
    let text = String::from_utf8(fixture("mromagr2007_304_1424xmmmv1.lbl")).unwrap();
    let mut l = Label {
        file_records: 0,
        pointers: BTreeMap::new(),
        rows: BTreeMap::new(),
        stations: BTreeSet::new(),
        start: 0.0,
        stop: 0.0,
    };
    let mut object: Option<String> = None;
    for line in text.lines() {
        let Some((k, v)) = line.split_once('=') else {
            continue;
        };
        let (k, v) = (k.trim(), v.trim());
        match k {
            "FILE_RECORDS" => l.file_records = v.parse().unwrap(),
            "DSN_STATION_NUMBER" => {
                l.stations = v
                    .trim_matches(|c| c == '{' || c == '}')
                    .split(',')
                    .map(|s| s.trim().parse().unwrap())
                    .collect()
            }
            "START_TIME" => l.start = parse_time(v),
            "STOP_TIME" => l.stop = parse_time(v),
            "OBJECT" if v.ends_with("_TABLE") => object = Some(v.to_string()),
            "ROWS" => {
                if let Some(o) = &object {
                    l.rows.insert(o.clone(), v.parse().unwrap());
                }
            }
            _ if k.starts_with('^') => {
                let n: usize = v
                    .trim_end_matches(')')
                    .rsplit(',')
                    .next()
                    .unwrap()
                    .trim()
                    .parse()
                    .unwrap();
                l.pointers.insert(k[1..].to_string(), n);
            }
            _ => {}
        }
    }
    l
}

#[test]
fn the_reader_matches_the_pds_label_r1_to_r6() {
    let bytes = fixture("mromagr2007_304_1424xmmmv1.odf");
    let odf = parse_odf(&bytes).expect("parses");
    let l = label();

    // R1.
    assert_eq!(odf.n_records, l.file_records, "R1");

    // R2 and R3: each group header's record number and its data rows.
    let header_table = |key: i32, sec: i32| -> (String, String) {
        match key {
            101 => ("ODF1A_TABLE".into(), "ODF1B_TABLE".into()),
            107 => ("ODF2A_TABLE".into(), "ODF2B_TABLE".into()),
            109 => ("ODF3A_TABLE".into(), "ODF3C_TABLE".into()),
            2030 => (format!("ODF4A{sec}_TABLE"), format!("ODF4B{sec}_TABLE")),
            -1 => ("ODF8A_TABLE".into(), "ODF8B_TABLE".into()),
            k => panic!("group key {k} not in this file's label"),
        }
    };
    assert_eq!(odf.groups.len(), 7, "{:?}", odf.groups);
    let mut r3_misses = Vec::new();
    for g in &odf.groups {
        let (h, d) = header_table(g.primary_key, g.secondary_key);
        assert_eq!(Some(&g.header_record), l.pointers.get(&h), "R2: {h}");
        if Some(&g.rows) != l.rows.get(&d) {
            r3_misses.push((d.clone(), g.rows, l.rows.get(&d).copied()));
        }
    }
    // R3 FINDING (first run, pinned): the label gives the end-of-file data table 120 rows from
    // record 52 968, which ends at record 53 087, one short of its own FILE_RECORDS (53 088).
    // The file holds 121 records after the end-of-file header. Every other table's rows match.
    // This is a label/file inconsistency, not a reader error.
    // PIN-SCOPE:    the one R3 mismatch and its numbers
    // PIN-EXCLUDES: every other group, which must match exactly
    assert_eq!(
        r3_misses,
        vec![("ODF8B_TABLE".to_string(), 121, Some(120))],
        "R3"
    );
    assert_eq!(l.pointers["ODF8B_TABLE"] + 120 - 1, l.file_records - 1);

    // R4.
    let rx: BTreeSet<u8> = odf.observations.iter().map(|o| o.rx_station).collect();
    assert_eq!(rx, l.stations, "R4");

    // R5.
    let first = odf.observations.first().unwrap().time_s;
    let last = odf.observations.last().unwrap().time_s;
    assert!(
        (first - l.start).abs() <= 1.0,
        "R5 start: {first} vs {}",
        l.start
    );
    assert!(
        (last - l.stop).abs() <= 1.0,
        "R5 stop: {last} vs {}",
        l.stop
    );

    // R6.
    let known: BTreeSet<u8> = [
        1, 2, 3, 4, 5, 6, 11, 12, 13, 36, 37, 41, 51, 52, 53, 54, 55, 56, 57, 58,
    ]
    .into_iter()
    .collect();
    let mut types = BTreeMap::new();
    for o in &odf.observations {
        assert!(
            known.contains(&o.data_type),
            "R6: unknown data type {}",
            o.data_type
        );
        if (11..=13).contains(&o.data_type) {
            assert!(
                o.reference_frequency_hz > 0.0,
                "R6: Doppler record with no reference frequency"
            );
        }
        *types.entry(o.data_type).or_insert(0usize) += 1;
    }
    eprintln!(
        "MRO ODF: {} records, {} observations by data type {:?}, {} ramps, stations {:?}, first {first} last {last}",
        odf.n_records,
        odf.observations.len(),
        types,
        odf.ramps.len(),
        rx
    );
}
