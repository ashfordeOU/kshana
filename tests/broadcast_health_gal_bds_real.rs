// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo and BeiDou broadcast health read on real navigation files (0.42 Q4).
//!
//! `pvt::select_ephemeris` never picks a record whose health field marks the satellite
//! unhealthy. GPS and QZSS were read since B5 v3; this test covers the Galileo and BeiDou
//! rule (`pvt::record_unhealthy`): a Galileo record is dropped when any of its nine signal
//! health and data-validity bits is set (E1-B, E5a, E5b), a BeiDou record when `SatH1` is
//! non-zero.
//!
//! The files are published IGS broadcast files already in the repository:
//! - 2018-05-13 Galileo I/NAV and F/NAV slices (the RTKLIB oracle fixtures of the joint
//!   PVT tests). E14 and E18, the two satellites in eccentric orbits, carry I/NAV health
//!   448 (E5b DVS and HS 3) and 455 (also E1-B DVS and HS 3) in every I/NAV record, and
//!   F/NAV health 56 (E5a DVS and HS 3) in some F/NAV records and 0 in the others.
//! - 2026-07-19 DLR merged file, RINEX 3.04 slice: E14 and E18 carry 130 (E1-B HS 1 and
//!   E5b HS 1) or 16 (E5a HS 1) in every record, E32 390 or 48; the 64 BeiDou records
//!   decoded under the default options (the GEO records are left out by default) are all
//!   healthy (`SatH1` 0). The repository holds no real BeiDou record with
//!   `SatH1` set; that branch is covered by the unit test in `src/pvt.rs`.
//!
//! PIN-SCOPE: which satellites of these committed files have a selectable broadcast record,
//! and that every selected record has clear health bits.
//! PIN-EXCLUDES: orbit and clock accuracy, the per-signal choice inside a solve, GLONASS,
//! SBAS and IRNSS health, and BeiDou-3 CNAV records (not decoded).

use kshana::pvt::select_ephemeris;
use kshana::rinex::{parse_nav, RinexEphemeris};
use std::collections::BTreeSet;

const EINAV: &str = include_str!("fixtures/joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx");
const EFNAV: &str =
    include_str!("fixtures/joint_pvt_dual_freq_itrf_rtklib_oracle/brdc_2018133_G_Efnav.rnx");
const BRDM_2026: &str =
    include_str!("fixtures/brdc_rinex4_2026200/BRDM00DLR_S_20262000000_slice.rnx");

/// The Galileo bits 0-8 of a health field, as the rule reads them.
fn gal_flags(h: f64) -> u32 {
    (h.max(0.0) as u32) & 0x1FF
}

/// For every Galileo or BeiDou record, select at its own reference time. Returns the
/// (system, PRN) pairs for which no record can be selected at the time of any of their
/// records, and checks that whatever is selected has clear health.
fn unselectable(ephs: &[RinexEphemeris], systems: &[char]) -> BTreeSet<(char, u8)> {
    let mut none = BTreeSet::new();
    let mut some = BTreeSet::new();
    for r in ephs.iter().filter(|r| systems.contains(&r.system)) {
        match select_ephemeris(ephs, r.system, r.prn, r.toe) {
            Some(s) => {
                assert_eq!((s.system, s.prn), (r.system, r.prn));
                match s.system {
                    'E' => assert_eq!(
                        gal_flags(s.sv_health),
                        0,
                        "E{:02} selected with health {}",
                        s.prn,
                        s.sv_health
                    ),
                    _ => assert_eq!(
                        s.sv_health, 0.0,
                        "C{:02} selected with SatH1 {}",
                        s.prn, s.sv_health
                    ),
                }
                some.insert((r.system, r.prn));
            }
            None => {
                none.insert((r.system, r.prn));
            }
        }
    }
    // A satellite is either never selectable or selectable at all its records' times.
    assert!(
        none.is_disjoint(&some),
        "mixed: {:?}",
        none.intersection(&some).collect::<Vec<_>>()
    );
    none
}

#[test]
fn galileo_inav_e14_e18_unhealthy_2018() {
    let ephs = parse_nav(EINAV).expect("I/NAV file parses");
    let flagged: Vec<f64> = ephs
        .iter()
        .filter(|e| e.system == 'E' && gal_flags(e.sv_health) != 0)
        .map(|e| e.sv_health)
        .collect();
    assert_eq!(flagged.len(), 26, "flagged I/NAV records");
    assert!(flagged.iter().all(|&h| h == 448.0 || h == 455.0));
    let none = unselectable(&ephs, &['E']);
    assert_eq!(none, BTreeSet::from([('E', 14), ('E', 18)]));
    // E5b alone (448: E1-B clear) is enough to drop an I/NAV record.
    assert!(ephs
        .iter()
        .any(|e| e.system == 'E' && e.prn == 18 && e.sv_health == 448.0));
}

#[test]
fn galileo_fnav_healthy_record_chosen_over_flagged_2018() {
    let ephs = parse_nav(EFNAV).expect("F/NAV file parses");
    let flagged = ephs
        .iter()
        .filter(|e| e.system == 'E' && gal_flags(e.sv_health) != 0)
        .count();
    assert_eq!(flagged, 8, "flagged F/NAV records (health 56)");
    // E14 and E18 have healthy F/NAV records too: at the time of a flagged record either a
    // healthy record within the fit window is chosen or none is, never the flagged one.
    let mut chose_healthy = 0;
    for r in ephs
        .iter()
        .filter(|e| e.system == 'E' && e.sv_health == 56.0)
    {
        if let Some(s) = select_ephemeris(&ephs, 'E', r.prn, r.toe) {
            assert_eq!(s.sv_health, 0.0);
            assert_ne!(
                s.toe, r.toe,
                "E{:02}: the flagged record itself was chosen",
                r.prn
            );
            chose_healthy += 1;
        }
    }
    assert!(
        chose_healthy > 0,
        "no flagged record had a healthy neighbour in the window"
    );
}

#[test]
fn galileo_and_beidou_2026_merged_file() {
    let ephs = parse_nav(BRDM_2026).expect("RINEX 3.04 slice parses");
    let bds: Vec<&RinexEphemeris> = ephs.iter().filter(|e| e.system == 'C').collect();
    assert_eq!(
        bds.len(),
        64,
        "BeiDou records decoded by default (GEOs left out)"
    );
    assert!(bds.iter().all(|e| e.sv_health == 0.0));
    let none = unselectable(&ephs, &['E', 'C']);
    assert_eq!(none, BTreeSet::from([('E', 14), ('E', 18), ('E', 32)]));
    // Every BeiDou satellite in the slice stays selectable.
    let bds_sats: BTreeSet<u8> = bds.iter().map(|e| e.prn).collect();
    for prn in bds_sats {
        assert!(!none.contains(&('C', prn)));
    }
}
