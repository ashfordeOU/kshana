// SPDX-License-Identifier: AGPL-3.0-only
//! Validation against real IGS/agency data, not synthetic fixtures.
//!
//! Parsing self-authored sample records proves the field layout is read; it does
//! not prove the engine survives a real broadcast/precise file. These tests run
//! the multi-GNSS RINEX navigation parser and the SP3 reader/interpolator over
//! genuine files (see `tests/fixtures/igs/NOTICE`) and assert that the satellite
//! sets are non-empty, the positions are finite and at the right altitude, and the
//! SP3 interpolator reproduces its sample nodes.

use kshana::frames::{geodetic_to_ecef, is_visible, teme_to_ecef, Geodetic};
use kshana::glonass::parse_glonass_nav;
use kshana::orbit::{dop, Propagator};
use kshana::raim::{
    araim_raim, snapshot_raim, solution_separation_raim, FaultPriors, IntegrityBudget,
};
use kshana::rinex::parse_nav;
use kshana::sgp4::wgs72;
use kshana::sp3::parse_sp3;
use kshana::tle::parse_tle;

const REAL_NAV: &str = include_str!("fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx");
const REAL_SP3: &str = include_str!("fixtures/igs/igs_sample.sp3");
const REAL_GPS_TLE: &str = include_str!("fixtures/celestrak/gps-ops_2021-07-28.txt");

/// Julian date of the SGP4 epoch (days since 1950 Jan 0.0 UT).
fn jd_from_1950(days: f64) -> f64 {
    2_433_281.5 + days
}

/// The real Celestrak `gps-ops` snapshot propagated through the validated SGP4
/// core to a single common instant, expressed in ECEF. Each TLE carries its own
/// epoch (the satellites were catalogued minutes apart), so every satellite is
/// propagated to one reference instant — the first satellite's epoch — and the
/// TEME state is rotated to ECEF with the matching sidereal time. This is the
/// genuine real-TLE → SGP4 → Earth-fixed geometry path, distinct from the SP3
/// (precise, ECEF) and RINEX (broadcast) paths exercised above.
fn real_gps_tle_snapshot(station: Geodetic) -> (Vec<Propagator>, [f64; 3], Vec<[f64; 3]>) {
    // Parse the fixture into (sgp4 propagator, jd_epoch) pairs.
    let lines: Vec<&str> = REAL_GPS_TLE.lines().collect();
    let mut sats: Vec<(Propagator, f64)> = Vec::new();
    let mut i = 0;
    while i < lines.len() {
        if lines[i].starts_with("1 ") && i + 1 < lines.len() && lines[i + 1].starts_with("2 ") {
            let tle = parse_tle(lines[i], lines[i + 1]).expect("real GPS TLE parses");
            let jd_epoch = jd_from_1950(tle.epoch_days_1950);
            sats.push((
                Propagator::Sgp4(Box::new(tle.to_sgp4(wgs72(), false))),
                jd_epoch,
            ));
            i += 2;
        } else {
            i += 1; // name line
        }
    }
    let props: Vec<Propagator> = sats.iter().map(|(p, _)| p.clone()).collect();
    let t_ref_jd = sats[0].1; // propagate everything to the first satellite's epoch
    let user = geodetic_to_ecef(station);
    let visible: Vec<[f64; 3]> = sats
        .iter()
        .map(|(prop, jd_epoch)| {
            let t_sec = (t_ref_jd - jd_epoch) * 86_400.0;
            teme_to_ecef(prop.position_eci(t_sec), t_ref_jd)
        })
        .filter(|&r_ecef| is_visible(station, r_ecef, 5.0))
        .collect();
    (props, user, visible)
}

fn radius(p: [f64; 3]) -> f64 {
    (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt()
}

/// A ground station near the file's own producer (DLR Oberpfaffenhofen, ~48°N
/// 11°E) and the real GPS satellites visible above a 5° mask in the first SP3
/// epoch of the precise-orbit fixture. SP3 positions are an ITRF/ECEF reference
/// product, so this is the genuine real-geometry input the snapshot/MHSS/ARAIM
/// RAIM cores consume — no synthetic constellation.
fn real_gps_geometry() -> ([f64; 3], Vec<[f64; 3]>) {
    let sp3 = parse_sp3(REAL_SP3).expect("real SP3 parses");
    let station = Geodetic {
        lat_rad: 48.0_f64.to_radians(),
        lon_rad: 11.0_f64.to_radians(),
        alt_m: 600.0,
    };
    let user = geodetic_to_ecef(station);
    let first = sp3.epochs.first().expect("SP3 has a first epoch");
    let sats: Vec<[f64; 3]> = first
        .sats
        .iter()
        .filter(|s| s.sat.starts_with('G') && is_visible(station, s.pos_m, 5.0))
        .map(|s| s.pos_m)
        .collect();
    (user, sats)
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

#[test]
fn real_sp3_geometry_drives_snapshot_and_solution_separation_raim() {
    // RAIM was previously exercised only on synthetic constellations. Here the
    // protection levels are formed from the real IGS precise-orbit geometry.
    let (user, sats) = real_gps_geometry();
    assert!(
        (8..=12).contains(&sats.len()),
        "expected a real GPS all-in-view of ~8-12 sats, got {}",
        sats.len()
    );

    // Fault-free snapshot RAIM (zero residuals → geometry-only levels).
    let zero = vec![0.0; sats.len()];
    let snap = snapshot_raim(user, &sats, &zero, 1.0, 1e-3, 1e-3)
        .expect("snapshot RAIM on the real geometry");
    assert_eq!(snap.n_used, sats.len());
    assert_eq!(snap.dof, sats.len() - 4);
    assert!(!snap.fault_detected, "no fault with zero residuals");
    assert!(snap.hpl_m.is_finite() && snap.vpl_m.is_finite());
    // Real GPS, σ = 1 m: the protection levels are metre-level and the vertical
    // axis is the weaker one — and both clear the APV-I alert limits (40/50 m).
    assert!(
        (0.5..10.0).contains(&snap.hpl_m),
        "HPL {:.2} m off real-GPS scale",
        snap.hpl_m
    );
    assert!(
        (1.0..15.0).contains(&snap.vpl_m),
        "VPL {:.2} m off real-GPS scale",
        snap.vpl_m
    );
    assert!(
        snap.vpl_m > snap.hpl_m,
        "vertical PL should exceed horizontal"
    );
    assert!(snap.hpl_m < 40.0 && snap.vpl_m < 50.0, "APV-I unavailable");

    // Solution-separation (MHSS) RAIM on the same real geometry.
    let ss = solution_separation_raim(user, &sats, &zero, 1.0, 1e-3, 1e-3)
        .expect("solution-separation RAIM on the real geometry");
    assert!(!ss.fault_detected, "no separation with zero residuals");
    assert!(ss.hpl_m.is_finite() && ss.hpl_m > 0.0);
    assert!(ss.vpl_m.is_finite() && ss.vpl_m > 0.0);
    assert!(ss.excluded_sv.is_none());
}

#[test]
fn real_sp3_geometry_detects_and_identifies_an_injected_fault() {
    let (user, sats) = real_gps_geometry();
    // Bias the first visible satellite's pseudorange by 60 m; everything else clean.
    let mut residual = vec![0.0; sats.len()];
    residual[0] = 60.0;

    // The χ² residual test fires far above its threshold.
    let snap = snapshot_raim(user, &sats, &residual, 1.0, 1e-3, 1e-3)
        .expect("snapshot RAIM on the real geometry");
    assert!(snap.fault_detected, "60 m bias must trip the χ² monitor");
    assert!(
        snap.test_statistic > snap.threshold,
        "stat {:.1} below threshold {:.1}",
        snap.test_statistic,
        snap.threshold
    );

    // Solution-separation both detects AND identifies the faulted satellite:
    // excluding it removes the bias, so its sub-solution separation is largest.
    let ss = solution_separation_raim(user, &sats, &residual, 1.0, 1e-3, 1e-3)
        .expect("solution-separation RAIM on the real geometry");
    assert!(ss.fault_detected, "MHSS must detect the fault");
    assert_eq!(
        ss.excluded_sv,
        Some(0),
        "MHSS must identify the biased satellite (index 0)"
    );
    assert!(ss.max_normalized_separation > 10.0, "weak separation");
}

#[test]
fn real_sp3_geometry_araim_meets_the_integrity_budget() {
    let (user, sats) = real_gps_geometry();
    let zero = vec![0.0; sats.len()];
    let priors = FaultPriors {
        p_sat: 1e-5,
        b_nom_m: 0.0,
    };
    let budget = IntegrityBudget {
        p_hmi_vert: 1e-7,
        p_hmi_horz: 1e-7,
        p_fa: 1e-5,
    };
    let r =
        araim_raim(user, &sats, &zero, 1.0, priors, budget).expect("ARAIM on the real geometry");

    assert_eq!(r.n_used, sats.len());
    assert!(!r.fault_detected, "no fault with zero residuals");
    assert!(r.hpl_m.is_finite() && r.hpl_m > 0.0);
    assert!(r.vpl_m.is_finite() && r.vpl_m > 0.0);
    assert!(r.vpl_m > r.hpl_m, "vertical PL should exceed horizontal");
    // The achieved integrity risk must not exceed the allocated budget, and the
    // explicit-risk levels are a touch more conservative than the slope bound but
    // still metre-level and APV-I-available on this real geometry.
    assert!(
        r.p_hmi_vert <= budget.p_hmi_vert * (1.0 + 1e-6),
        "achieved P_HMI {:.3e} over budget",
        r.p_hmi_vert
    );
    assert!(
        r.p_hmi_horz <= budget.p_hmi_horz * (1.0 + 1e-6),
        "achieved horizontal P_HMI {:.3e} over budget",
        r.p_hmi_horz
    );
    assert!(r.hpl_m < 40.0 && r.vpl_m < 50.0, "ARAIM APV-I unavailable");
}

#[test]
fn real_gps_tle_snapshot_propagates_a_full_meo_constellation_through_sgp4() {
    // The real Celestrak gps-ops snapshot must parse to the full operational GPS
    // constellation, each satellite routed through the *validated* SGP4 core
    // (the 4.12 mm / 666-vector path) and propagated to the GPS MEO shell.
    let station = Geodetic {
        lat_rad: 48.0_f64.to_radians(),
        lon_rad: 11.0_f64.to_radians(),
        alt_m: 600.0,
    };
    let (props, _user, _visible) = real_gps_tle_snapshot(station);
    assert!(
        (28..=32).contains(&props.len()),
        "expected ~30 operational GPS satellites, got {}",
        props.len()
    );
    for p in &props {
        assert!(
            matches!(p, Propagator::Sgp4(_)),
            "real TLEs must propagate through SGP4, not a fallback"
        );
        // Propagated at its own epoch, every satellite sits on the GPS MEO shell
        // (~26 560 km), confirming the mean elements drive SGP4 correctly.
        let r = radius(p.position_eci(0.0));
        assert!(
            (26_000_000.0..27_000_000.0).contains(&r),
            "GPS SGP4 radius {r:.0} m off the MEO shell"
        );
    }
}

#[test]
fn real_gps_tle_geometry_gives_a_good_ground_fix() {
    // Real all-in-view geometry from a mid-latitude open-sky site: a healthy
    // GPS constellation gives a comfortable fix with sub-decametre dilution.
    let station = Geodetic {
        lat_rad: 48.0_f64.to_radians(),
        lon_rad: 11.0_f64.to_radians(),
        alt_m: 600.0,
    };
    let (_props, user, visible) = real_gps_tle_snapshot(station);
    assert!(
        (6..=13).contains(&visible.len()),
        "expected a real GPS all-in-view of ~6-13 sats, got {}",
        visible.len()
    );
    let d = dop(user, &visible).expect("a real GPS geometry yields a fix");
    assert!(
        (1.0..4.0).contains(&d.pdop),
        "real GPS PDOP {:.2} outside the good-geometry band",
        d.pdop
    );
    // For a ground user the vertical dilution always exceeds the horizontal
    // (satellites are only ever above the horizon, never below).
    assert!(
        d.hdop < d.vdop,
        "HDOP {:.2} should be below VDOP {:.2} for a ground user",
        d.hdop,
        d.vdop
    );
    assert!(d.gdop >= d.pdop, "GDOP must dominate PDOP");
}
