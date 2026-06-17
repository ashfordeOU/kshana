// SPDX-License-Identifier: Apache-2.0
//! External-oracle conformance of the CCSDS message parsers against the
//! **verbatim worked examples published in the CCSDS Blue Books themselves** —
//! not against Kshana's own round-trip. Recovering the exact published epochs and
//! values from a standard's own annex example is the strongest available
//! conformance check for an interchange-format parser.
//!
//! Fixtures (reproduced character-for-character from the official PDFs):
//!   * `ccsds/oem_502_b3_figG11.oem` — the Orbit Ephemeris Message KVN example of
//!     **CCSDS 502.0-B-3 (Orbit Data Messages, April 2023), Annex G §G6,
//!     Figure G-11** ("OEM Example with No Acceleration, No Covariance", p. G-10).
//!     The Blue Book's editorial "< intervening data records omitted here >"
//!     markers (which are not valid OEM records) are not included; every printed
//!     state vector is.
//!   * `ccsds/tdm_503_b2_figE9.tdm` — the Tracking Data Message KVN example of
//!     **CCSDS 503.0-B-2 (Tracking Data Message, June 2020), Annex E,
//!     Figure E-9** ("Range Data with TIMETAG_REF=TRANSMIT", p. E-9), 40 range
//!     records in km.

use kshana::ccsds_tdm::TdmFile;
use kshana::oem::parse_oem;

const OEM_FIG_G11: &str = include_str!("fixtures/ccsds/oem_502_b3_figG11.oem");
const TDM_FIG_E9: &str = include_str!("fixtures/ccsds/tdm_503_b2_figE9.tdm");

/// Tolerance for the published decimal state values: parsing the verbatim string
/// to f64 is exact, but a tiny band guards against formatting surprises.
const TOL: f64 = 1e-9;

fn close(a: f64, b: f64) -> bool {
    (a - b).abs() <= TOL
}

#[test]
fn oem_parser_recovers_ccsds_502_b3_figure_g11_values() {
    let f = parse_oem(OEM_FIG_G11).expect("Figure G-11 OEM parses");
    assert_eq!(f.version, "3.0");
    assert_eq!(f.originator, "NASA/JPL");
    assert_eq!(f.segments.len(), 2, "Figure G-11 has two ephemeris segments");

    // --- Segment 1 metadata + endpoints ---
    let s0 = &f.segments[0];
    assert_eq!(s0.meta.object_name, "MARS GLOBAL SURVEYOR");
    assert_eq!(s0.meta.object_id, "1996-062A");
    assert_eq!(s0.meta.center_name, "MARS BARYCENTER");
    assert_eq!(s0.meta.ref_frame, "EME2000");
    assert_eq!(s0.meta.time_system, "UTC");
    assert_eq!(s0.states.len(), 4);

    let first = &s0.states[0];
    assert_eq!(first.epoch.year, 2019);
    assert_eq!(first.epoch.month, 12);
    assert_eq!(first.epoch.day, 18);
    assert_eq!(first.epoch.hour, 12);
    assert_eq!(first.epoch.minute, 0);
    assert!(close(first.epoch.second, 0.331));
    assert!(close(first.pos_km[0], 2789.619));
    assert!(close(first.pos_km[1], -280.045));
    assert!(close(first.pos_km[2], -1746.755));
    assert!(close(first.vel_km_s[0], 4.73372));
    assert!(close(first.vel_km_s[1], -2.49586));
    assert!(close(first.vel_km_s[2], -1.04195));

    let last1 = &s0.states[3];
    assert_eq!((last1.epoch.day, last1.epoch.hour, last1.epoch.minute), (28, 21, 28));
    assert!(close(last1.pos_km[0], -3881.024));
    assert!(close(last1.pos_km[1], 563.959));
    assert!(close(last1.pos_km[2], -682.773));
    assert!(close(last1.vel_km_s[2], 1.63861));

    // --- Segment 2 endpoints (note the leading-zero value -063.042 in the source) ---
    let s1 = &f.segments[1];
    assert_eq!(s1.states.len(), 4);
    let s1f = &s1.states[0];
    assert_eq!((s1f.epoch.day, s1f.epoch.hour, s1f.epoch.minute), (28, 21, 29));
    assert!(close(s1f.pos_km[0], -2432.166));
    assert!(close(s1f.pos_km[1], -63.042));
    assert!(close(s1f.pos_km[2], 1742.754));
    assert!(close(s1f.vel_km_s[0], 7.33702));
    assert!(close(s1f.vel_km_s[1], -3.495867));

    let last2 = &s1.states[3];
    assert_eq!(last2.epoch.year, 2019);
    assert_eq!((last2.epoch.month, last2.epoch.day), (12, 30));
    assert!(close(last2.pos_km[0], 2164.375));
    assert!(close(last2.pos_km[1], 1115.811));
    assert!(close(last2.pos_km[2], -688.131));
    assert!(close(last2.vel_km_s[2], 0.88535));
}

#[test]
fn tdm_parser_recovers_ccsds_503_b2_figure_e9_values() {
    let f = TdmFile::parse(TDM_FIG_E9).expect("Figure E-9 TDM parses");
    assert_eq!(f.version, "2.0");
    assert_eq!(f.originator, "JAXA");
    assert_eq!(f.segments.len(), 1);

    let seg = &f.segments[0];
    assert_eq!(seg.meta.time_system, "UTC");
    assert_eq!(seg.meta.mode, "SEQUENTIAL");
    assert_eq!(seg.meta.path, "2,1,2");
    assert_eq!(seg.meta.range_units.as_deref(), Some("km"));
    assert_eq!(seg.meta.participants, vec!["yyyy-nnnA".to_string(), "USC1".to_string()]);

    // 41 RANGE records (00:41:38 → 00:42:58 inclusive at a 2 s step), all RANGE.
    assert_eq!(seg.data.len(), 41);
    assert!(seg.data.iter().all(|o| o.key == "RANGE"));

    let first = &seg.data[0];
    assert_eq!(first.epoch, "2005-09-17T00:41:38.000000");
    assert!(close(first.value, 3198.03679519614));

    let last = &seg.data[40];
    assert_eq!(last.epoch, "2005-09-17T00:42:58.000000");
    assert!(close(last.value, 3270.46440460551));
}
