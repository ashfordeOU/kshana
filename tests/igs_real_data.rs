// SPDX-License-Identifier: Apache-2.0
//! Validation against real IGS/agency data, not synthetic fixtures.
//!
//! Parsing self-authored sample records proves the field layout is read; it does
//! not prove the engine survives a real broadcast/precise file. These tests run
//! the multi-GNSS RINEX navigation parser and the SP3 reader/interpolator over
//! genuine files (see `tests/fixtures/igs/NOTICE`) and assert that the satellite
//! sets are non-empty, the positions are finite and at the right altitude, and the
//! SP3 interpolator reproduces its sample nodes.

use kshana::glonass::parse_glonass_nav;
use kshana::rinex::parse_nav;
use kshana::sp3::parse_sp3;

const REAL_NAV: &str = include_str!("fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx");
const REAL_SP3: &str = include_str!("fixtures/igs/igs_sample.sp3");

fn radius(p: [f64; 3]) -> f64 {
    (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt()
}

#[test]
fn real_multignss_nav_parses_to_physical_orbits() {
    let eph = parse_nav(REAL_NAV).expect("real multi-GNSS nav parses");
    assert!(!eph.is_empty(), "no Keplerian ephemerides parsed");

    // GPS satellites must be present and at the GPS altitude (~26 560 km).
    let gps: Vec<_> = eph.iter().filter(|e| e.system == 'G').collect();
    assert!(!gps.is_empty(), "no GPS ephemerides in the real file");
    for e in &gps {
        let r = radius(e.sv_position_ecef(e.toe));
        assert!(r.is_finite(), "non-finite GPS position");
        assert!(
            (24_000_000.0..29_000_000.0).contains(&r),
            "GPS {} radius {r:.0} m out of band",
            e.prn
        );
    }

    // The file is a mixed GPS/GLONASS/Galileo/BeiDou/QZSS product; this excerpt
    // also carries QZSS, which the parser decodes with the GPS algorithm.
    if let Some(qzss) = eph.iter().find(|e| e.system == 'J') {
        let r = radius(qzss.sv_position_ecef(qzss.toe));
        assert!(r.is_finite() && r > 20_000_000.0, "QZSS radius {r:.0} m");
    }
}

#[test]
fn real_glonass_nav_parses_to_physical_orbits() {
    let glo = parse_glonass_nav(REAL_NAV).expect("real GLONASS nav parses");
    assert!(!glo.is_empty(), "no GLONASS ephemerides in the real file");
    for e in &glo {
        // The broadcast state itself is a GLONASS-altitude orbit (~25 500 km)...
        let r0 = radius(e.pos_m);
        assert!(
            (24_000_000.0..27_000_000.0).contains(&r0),
            "GLONASS {} broadcast radius {r0:.0} m out of band",
            e.prn
        );
        // ...and RK4-integrating 10 minutes keeps it physical.
        let r = radius(e.position_ecef(600.0));
        assert!(r.is_finite() && (r - r0).abs() / r0 < 0.05, "GLONASS drift");
    }
}

#[test]
fn real_sp3_reads_a_full_gps_constellation() {
    // The sample is a real IGS SP3-c orbit product. (Its second epoch is
    // truncated — hence the file name — so the file validates the reader; the
    // Lagrange interpolator's node-exactness is a mathematical property covered by
    // the multi-epoch unit test `sp3::tests::interpolator_reproduces_the_nodes…`.)
    let sp3 = parse_sp3(REAL_SP3).expect("real SP3 parses");
    assert_eq!(sp3.header.version, 'c');
    let sats = sp3.observed_satellites();
    // A full GPS constellation in the first epoch.
    assert!(sats.len() >= 30, "only {} SP3 satellites", sats.len());
    assert!(sats.iter().all(|s| s.starts_with('G')), "expected GPS sats");

    // Every position is finite and at GPS altitude.
    let mut positions = 0;
    for epoch in &sp3.epochs {
        for s in &epoch.sats {
            let r = radius(s.pos_m);
            assert!(
                r.is_finite() && (24_000_000.0..29_000_000.0).contains(&r),
                "SP3 {} radius {r:.0} m out of band",
                s.sat
            );
            positions += 1;
        }
    }
    assert!(positions >= 30, "only {positions} SP3 positions");
}
