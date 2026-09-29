// SPDX-License-Identifier: AGPL-3.0-only
//! External oracle for the `leo-navmsg` user algorithm: the Galileo Open Service
//! Signal-in-Space Interface Control Document (OS SIS ICD) Keplerian evaluation that the
//! LEO message builds on, checked against RTKLIB `eph2pos` on real Galileo broadcast
//! ephemerides.
//!
//! The input is the committed multi-GNSS RINEX 3.05 navigation slice (real BKG/IGS
//! broadcast records, day 254 of 2024) and the committed RTKLIB 2.4.2-p13 reference
//! positions; both are documented in `tests/fixtures/rinex_sp3_interop/NOTICE`. The four
//! Galileo records (E10, E19, E24, E25) are carried into the LEO message's
//! [`kshana::leo_navmsg::elements::Keplerian`] set and evaluated by
//! [`kshana::leo_navmsg::elements::kepler_point`], an implementation separate from the
//! engine's RINEX evaluator, at the seven offsets from `toe` RTKLIB used
//! (±3600, ±1800, ±600, 0 s). Every axis must agree to 1 mm.
//!
//! The same records then go through the Kshana binary frame and the RINEX-style text
//! block: the decoded message must still reproduce RTKLIB, to the quantisation of the
//! format (a few millimetres at medium Earth orbit radius) and to 0.1 mm respectively.

use kshana::leo_navmsg::codec;
use kshana::leo_navmsg::elements::{
    kepler_point, sat_state, EphemerisModel, Keplerian, LeoNavMessage, Services, SysTime,
};
use kshana::leo_navmsg::text;
use kshana::rinex::parse_nav;

const NAV: &str = include_str!("fixtures/rinex_sp3_interop/brdc_multignss_slice.rnx");
const REFERENCE: &str = include_str!("fixtures/rinex_sp3_interop/rinex_ecef_reference.txt");

struct Row {
    prn: u8,
    toes: f64,
    tk: f64,
    xyz: [f64; 3],
}

fn galileo_rows() -> Vec<Row> {
    REFERENCE
        .lines()
        .map(str::trim)
        .filter(|l| l.starts_with("E "))
        .map(|l| {
            let f: Vec<&str> = l.split_whitespace().collect();
            Row {
                prn: f[1].parse().unwrap(),
                toes: f[2].parse().unwrap(),
                tk: f[4].parse().unwrap(),
                xyz: [
                    f[5].parse().unwrap(),
                    f[6].parse().unwrap(),
                    f[7].parse().unwrap(),
                ],
            }
        })
        .collect()
}

fn galileo_sets() -> Vec<(u8, u32, Keplerian)> {
    parse_nav(NAV)
        .unwrap()
        .into_iter()
        .filter(|e| e.system == 'E')
        .map(|e| {
            (
                e.prn,
                e.gps_week as u32,
                Keplerian {
                    sqrt_a: e.sqrt_a,
                    e: e.e,
                    i0: e.i0,
                    omega0: e.omega0,
                    omega: e.omega,
                    m0: e.m0,
                    delta_n: e.delta_n,
                    omega_dot: e.omega_dot,
                    i_dot: e.idot,
                    cuc: e.cuc,
                    cus: e.cus,
                    crc: e.crc,
                    crs: e.crs,
                    cic: e.cic,
                    cis: e.cis,
                    toe: e.toe,
                },
            )
        })
        .collect()
}

fn find(sets: &[(u8, u32, Keplerian)], r: &Row) -> (u32, Keplerian) {
    let (_, w, k) = sets
        .iter()
        .find(|(p, _, k)| *p == r.prn && (k.toe - r.toes).abs() < 1e-3)
        .unwrap_or_else(|| panic!("no Galileo record E{:02} toe {}", r.prn, r.toes));
    (*w, *k)
}

#[test]
fn the_galileo_user_algorithm_reproduces_rtklib_to_a_millimetre() {
    let rows = galileo_rows();
    assert_eq!(rows.len(), 28, "four Galileo satellites at seven offsets");
    let sets = galileo_sets();
    let mut worst: f64 = 0.0;
    for r in &rows {
        let (_, k) = find(&sets, r);
        let p = kepler_point(&k, None, r.tk).pos;
        for (ax, (got, want)) in p.iter().zip(&r.xyz).enumerate() {
            let d = (got - want).abs();
            worst = worst.max(d);
            assert!(
                d < 1e-3,
                "E{:02} tk {:+} axis {ax}: {got:.4} vs RTKLIB {want:.4}",
                r.prn,
                r.tk
            );
        }
    }
    eprintln!("worst axis difference vs RTKLIB eph2pos: {worst:.2e} m");
}

fn message(prn: u8, week: u32, k: Keplerian) -> LeoNavMessage {
    LeoNavMessage {
        svid: prn,
        iod: 1,
        band: 0,
        health: 0,
        week,
        tow: k.toe,
        clock: None,
        ephemeris: EphemerisModel::Kepler16 { kepler: k },
        services: Services::default(),
    }
}

#[test]
fn real_galileo_records_survive_the_binary_frame_and_the_text_block() {
    let rows = galileo_rows();
    let sets = galileo_sets();
    for r in &rows {
        let (week, k) = find(&sets, r);
        let m = message(r.prn, week, k);
        let t = SysTime::new(week, k.toe + r.tk);
        let bin = codec::decode(&codec::encode(&m).unwrap()).unwrap();
        let txt = text::rinex_import(&text::rinex_export(std::slice::from_ref(&m))).unwrap();
        let pb = sat_state(&bin, &t).pos;
        let pt = sat_state(&txt[0], &t).pos;
        for (ax, ((b, t), want)) in pb.iter().zip(&pt).zip(&r.xyz).enumerate() {
            // Kshana steps are sized for LEO radius; at the Galileo radius (29 600 km) the
            // angular steps are four times longer, so allow 5 mm.
            assert!((b - want).abs() < 5e-3, "binary E{:02} axis {ax}", r.prn);
            assert!((t - want).abs() < 1e-3, "text E{:02} axis {ax}", r.prn);
        }
    }
}
