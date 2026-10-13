// SPDX-License-Identifier: AGPL-3.0-only
//! BeiDou geostationary (GEO) broadcast positions: the BDS-SIS-ICD-B1I v3.0
//! §5.2.4.12 algorithm (`RinexEphemeris::sv_position_ecef_bds_geo`), opt-in via
//! `NavParseOptions::include_beidou_geo`.
//!
//! Two parts:
//!
//! 1. Oracle (published data), data-gated: the GEO records of the 2026-07-19
//!    merged broadcast file against an IGS MGEX precise orbit (SP3) of the same day
//!    that carries the GEOs. Bars, committed alone before any run in
//!    `tests/fixtures/brdc_rinex4_2026200/PREREGISTRATION_BDS_GEO.md`: median 3-D
//!    error < 5 m (G1), max < 20 m (G2), median > 1 km with the R_X(−5°) step
//!    omitted (G3), ≥ 3 PRNs and ≥ 50 epochs (G4). The SP3 path comes from
//!    `KSHANA_BDS_GEO_SP3` (uncompressed); the broadcast file from
//!    `KSHANA_BRDM_FULL` (uncompressed full day) or, when unset, the committed
//!    two-hour slice. Skipped with a message when the SP3 is absent: no SP3 with the
//!    BeiDou GEOs was reachable from the session that wrote this test.
//! 2. MODELLED (internal consistency, real broadcast records): with the tilt the
//!    GEO positions sit at geostationary radius within a few degrees of the
//!    equator; without it they do not.
//!
//! PIN-SCOPE: GEO broadcast-orbit geometry from the committed RINEX 3.04 slice,
//! and (data-gated) its agreement with a precise orbit.
//! PIN-EXCLUDES: the BeiDou MEO/IGSO path (unchanged), the antenna phase-centre
//! offset (not applied), clocks.

use kshana::rinex::{parse_nav_with, NavParseOptions, RinexEphemeris};

const V3: &str = include_str!("fixtures/brdc_rinex4_2026200/BRDM00DLR_S_20262000000_slice.rnx");

const OPTS: NavParseOptions = NavParseOptions {
    include_beidou_geo: true,
};

fn geo_records(text: &str) -> Vec<RinexEphemeris> {
    parse_nav_with(text, OPTS)
        .expect("broadcast file parses")
        .into_iter()
        .filter(|e| e.is_beidou_geo())
        .collect()
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

/// GPS weeks between the GPS and BDT epochs, and GPS − BDT in seconds.
const BDT_WEEK_OFFSET: f64 = 1356.0;
const GPS_MINUS_BDT_S: f64 = 14.0;

/// Seconds from the GPS epoch of a record's Toe (its week and Toe are BDT).
fn toe_abs_gps_s(e: &RinexEphemeris) -> f64 {
    (e.gps_week + BDT_WEEK_OFFSET) * 604_800.0 + e.toe + GPS_MINUS_BDT_S
}

#[test]
fn geo_positions_are_geostationary_only_with_the_tilt() {
    let geos = geo_records(V3);
    let prns: std::collections::BTreeSet<u8> = geos.iter().map(|e| e.prn).collect();
    eprintln!("GEO records in the slice: {} for PRNs {prns:?}", geos.len());
    assert!(geos.len() >= 4 && prns.len() >= 3, "too few GEO records");
    let (mut max_lat_tilt, mut max_lat_flat) = (0.0f64, 0.0f64);
    for e in &geos {
        let mut lons = Vec::new();
        for k in -6..=6 {
            let t = e.toe + 600.0 * k as f64;
            let p = e.sv_position_ecef(t);
            assert_eq!(p, e.sv_position_ecef_bds_geo(t, true));
            let r = norm(p);
            assert!(
                (r - 42_164_000.0).abs() < 300_000.0,
                "C{:02} radius {r:.0} m",
                e.prn
            );
            max_lat_tilt = max_lat_tilt.max((p[2] / r).asin().to_degrees().abs());
            let q = e.sv_position_ecef_bds_geo(t, false);
            max_lat_flat = max_lat_flat.max((q[2] / norm(q)).asin().to_degrees().abs());
            lons.push(p[1].atan2(p[0]).to_degrees());
        }
        let spread = lons.iter().cloned().fold(f64::MIN, f64::max)
            - lons.iter().cloned().fold(f64::MAX, f64::min);
        eprintln!(
            "C{:02} toe {:.0}: longitude {:.2} deg, spread over ±1 h {:.3} deg",
            e.prn, e.toe, lons[6], spread
        );
        assert!(spread < 1.0, "C{:02} drifts {spread:.2} deg in 2 h", e.prn);
    }
    eprintln!("max |latitude|: with tilt {max_lat_tilt:.2} deg, without {max_lat_flat:.2} deg");
    assert!(
        max_lat_tilt < 3.0,
        "with the tilt a GEO reached {max_lat_tilt:.2} deg"
    );
    assert!(
        max_lat_flat > 3.0,
        "without the tilt only {max_lat_flat:.2} deg"
    );
}

#[test]
fn geo_broadcast_vs_precise_orbit() {
    let Ok(sp3_path) = std::env::var("KSHANA_BDS_GEO_SP3") else {
        eprintln!(
            "skipped: set KSHANA_BDS_GEO_SP3 to an uncompressed IGS MGEX SP3 orbit of \
             2026-07-19 that contains the BeiDou GEOs (e.g. WUM0MGXFIN_20262000000_01D_05M_ORB.SP3)"
        );
        return;
    };
    let nav = match std::env::var("KSHANA_BRDM_FULL") {
        Ok(p) => std::fs::read_to_string(p).expect("read broadcast file"),
        Err(_) => V3.to_string(),
    };
    let geos = geo_records(&nav);
    let sp3 = kshana::sp3::parse_sp3(&std::fs::read_to_string(sp3_path).expect("read SP3"))
        .expect("SP3 parses");
    let mut err_tilt = Vec::new();
    let mut err_flat = Vec::new();
    let mut prns = std::collections::BTreeSet::new();
    for ep in &sp3.epochs {
        let t_abs = ep.time.seconds_from_gps_epoch();
        for s in &ep.sats {
            if !s.sat.starts_with('C') {
                continue;
            }
            let Ok(prn) = s.sat[1..].trim().parse::<u8>() else {
                continue;
            };
            let best = geos
                .iter()
                .filter(|e| e.prn == prn)
                .map(|e| (e, t_abs - toe_abs_gps_s(e)))
                .filter(|(_, dt)| dt.abs() <= 3600.0)
                .min_by(|a, b| a.1.abs().total_cmp(&b.1.abs()));
            let Some((e, dt)) = best else {
                continue;
            };
            if norm(s.pos_m) < 1.0 {
                continue; // SP3 "bad position" marker
            }
            let t = e.toe + dt;
            let d = |p: [f64; 3]| norm([p[0] - s.pos_m[0], p[1] - s.pos_m[1], p[2] - s.pos_m[2]]);
            err_tilt.push(d(e.sv_position_ecef_bds_geo(t, true)));
            err_flat.push(d(e.sv_position_ecef_bds_geo(t, false)));
            prns.insert(prn);
        }
    }
    let median = |v: &mut Vec<f64>| {
        v.sort_by(f64::total_cmp);
        if v.is_empty() {
            f64::NAN
        } else {
            v[v.len() / 2]
        }
    };
    let n = err_tilt.len();
    let max = err_tilt.iter().cloned().fold(0.0, f64::max);
    let (m_tilt, m_flat) = (median(&mut err_tilt), median(&mut err_flat));
    eprintln!(
        "GEO PRNs {prns:?}, {n} epochs: median {m_tilt:.3} m, max {max:.3} m; \
         without tilt median {m_flat:.0} m"
    );
    assert!(
        prns.len() >= 3 && n >= 50,
        "G4: {} PRNs, {n} epochs",
        prns.len()
    );
    assert!(m_tilt < 5.0, "G1: median {m_tilt:.3} m");
    assert!(max < 20.0, "G2: max {max:.3} m");
    assert!(m_flat > 1000.0, "G3: untilted median {m_flat:.0} m");
}
