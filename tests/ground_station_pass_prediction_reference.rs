// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana ground-station pass prediction against an
//! **independent third-party authority**: Orekit 12.2 (CS GROUP, Apache-2.0) +
//! Hipparchus 3.1, via `org.orekit.propagation.events.ElevationDetector` +
//! `EventsLogger` run over an `org.orekit.propagation.analytical.Ephemeris`, with
//! the station built as a `TopocentricFrame` on a WGS-84 `OneAxisEllipsoid`.
//!
//! QUANTITY: per-pass AOS / TCA / LOS, per-pass maximum (culmination) elevation,
//! per-pass duration, the pass COUNT, and the TOTAL ACCESS time, for the identical
//! circular orbit + station + epoch + mask + 24 h window, over 22 scenarios
//! (LEO 400-1200 km; sun-sync / polar / 53 deg / ISS / low-inc; stations
//! equatorial / mid-lat / high-lat / polar; masks 0 / 5 / 10 / 40 deg).
//!
//! WHY THIS IS A GENUINE, INDEPENDENT CHECK
//! ----------------------------------------
//! The geometry being compared is Orekit's: the geodetic ground-station position
//! on the WGS-84 ellipsoid, the topocentric elevation against the ellipsoid normal
//! (ENU), and the rise/set zero-crossing root-finding (ElevationDetector's
//! Brent-style solver) plus the culmination search. Orekit does all of that with
//! its own code; kshana does it in `passes::predict_passes` / `frames::look_angles`.
//! Feeding byte-identical inputs and comparing is the same library-vs-library
//! pattern as the Lambert (lamberthub) and DOP (gnss_lib_py) validations.
//!
//! HONEST SCOPE (matched, NOT validated)
//! -------------------------------------
//! The PROPAGATOR (circular two-body Kepler, mu = 3.986004418e14) and the
//! TEME->ECEF rotation (IAU-1982 GMST only) are kshana's own and are matched
//! exactly on the Orekit side (the driver reproduces just those two steps to get
//! the satellite's ITRF samples, then hands them to Orekit) so the comparison
//! isolates the pass GEOMETRY, not the orbit model. A higher-fidelity propagator
//! (SGP4 drag/J2) or a refraction/light-time correction would be separate work.
//!
//! TCA / max elevation: kshana reports the culmination at its sample-step
//! resolution (the highest sampled point), while Orekit refines it to 0.01 s. The
//! sampled maximum converges to the true peak as the step shrinks; this matters
//! only for near-zenith (~90 deg) passes, where the elevation peaks sharply (e.g.
//! a 1 s step undershoots a 89.9 deg culmination by ~0.15 deg, a 0.1 s step by
//! ~0.001 deg). The test therefore drives kshana at a fine 0.1 s step so the
//! max-elevation comparison tests the elevation GEOMETRY, not the sampling grid;
//! TCA itself is still only compared to within a step (it is grid-resolution by
//! construction).
//!
//! The committed generator, the pinned Orekit output and the Java driver live in
//! `tests/fixtures/ground_station_pass_prediction/` and `xval/orekit-passes/`.

use kshana::frames::Geodetic;
use kshana::orbit::{Orbit, Propagator, R_EARTH_EQUATORIAL_M};
use kshana::passes::predict_passes;

const REF: &str = include_str!(
    "fixtures/ground_station_pass_prediction/ground_station_pass_prediction_reference.txt"
);

/// Sample step (s) used to drive kshana. Fine enough that the sampled-maximum
/// culmination converges to the true peak even for near-zenith passes (see the
/// header note), so the max-elevation comparison reflects geometry, not the grid.
const STEP_S: f64 = 0.1;

// Tolerances (planned): AOS/LOS within max(1 step, 1 s) — comfortably met to ms.
const AOS_LOS_TOL_S: f64 = 1.0;
// Max elevation: < 0.05 deg.
const MAX_EL_TOL_DEG: f64 = 0.05;
// Total access: < 2 s.
const TOTAL_ACCESS_TOL_S: f64 = 2.0;
// Per-pass duration follows AOS/LOS, so it cannot exceed their combined error.
const DURATION_TOL_S: f64 = 2.0;
// TCA is sample-step resolution in kshana; allow one second plus a small margin.
const TCA_TOL_S: f64 = 1.5;

#[derive(Clone, Copy)]
struct Scn {
    altitude_km: f64,
    inclination_deg: f64,
    raan_deg: f64,
    arg_lat_deg: f64,
    station_lat_deg: f64,
    station_lon_deg: f64,
    station_alt_m: f64,
    mask_deg: f64,
    duration_hours: f64,
    epoch: [f64; 6],
}

#[derive(Clone, Copy)]
struct RefPass {
    aos_s: f64,
    tca_s: f64,
    los_s: f64,
    max_el_deg: f64,
    duration_s: f64,
}

fn parse_scn(line: &str) -> (String, Scn) {
    // SCN name | alt | inc | raan | arglat | lat | lon | salt | mask | dur | y,m,d,h,mi,s
    let parts: Vec<&str> = line.trim_start_matches("SCN").split('|').collect();
    assert_eq!(parts.len(), 11, "SCN row needs 11 |-fields: {line}");
    let name = parts[0].trim().to_string();
    let f = |i: usize| parts[i].trim().parse::<f64>().unwrap();
    let ep: Vec<f64> = parts[10]
        .trim()
        .split(',')
        .map(|x| x.trim().parse::<f64>().unwrap())
        .collect();
    assert_eq!(ep.len(), 6, "epoch needs 6 fields: {line}");
    (
        name,
        Scn {
            altitude_km: f(1),
            inclination_deg: f(2),
            raan_deg: f(3),
            arg_lat_deg: f(4),
            station_lat_deg: f(5),
            station_lon_deg: f(6),
            station_alt_m: f(7),
            mask_deg: f(8),
            duration_hours: f(9),
            epoch: [ep[0], ep[1], ep[2], ep[3], ep[4], ep[5]],
        },
    )
}

fn parse_pass(line: &str) -> (String, RefPass) {
    // PASS name | index | aos | tca | los | max_el | duration
    let parts: Vec<&str> = line.trim_start_matches("PASS").split('|').collect();
    assert_eq!(parts.len(), 7, "PASS row needs 7 |-fields: {line}");
    let name = parts[0].trim().to_string();
    let f = |i: usize| parts[i].trim().parse::<f64>().unwrap();
    (
        name,
        RefPass {
            aos_s: f(2),
            tca_s: f(3),
            los_s: f(4),
            max_el_deg: f(5),
            duration_s: f(6),
        },
    )
}

fn run_kshana(s: &Scn) -> Vec<kshana::passes::Pass> {
    let radius_m = R_EARTH_EQUATORIAL_M + s.altitude_km * 1000.0;
    let orbit = Propagator::Kepler(Orbit::new(
        radius_m,
        s.inclination_deg.to_radians(),
        s.raan_deg.to_radians(),
        s.arg_lat_deg.to_radians(),
    ));
    let station = Geodetic {
        lat_rad: s.station_lat_deg.to_radians(),
        lon_rad: s.station_lon_deg.to_radians(),
        alt_m: s.station_alt_m,
    };
    let jd0 = kshana::timescales::julian_date(
        s.epoch[0] as i32,
        s.epoch[1] as u32,
        s.epoch[2] as u32,
        s.epoch[3] as u32,
        s.epoch[4] as u32,
        s.epoch[5],
    );
    let duration_s = s.duration_hours * 3600.0;
    predict_passes(&orbit, station, jd0, s.mask_deg, duration_s, STEP_S)
}

#[test]
fn passes_match_orekit_elevation_detector() {
    // Group the fixture into (scenario, ref passes, count, total).
    let mut current: Option<(String, Scn)> = None;
    let mut ref_passes: Vec<RefPass> = Vec::new();

    let mut n_scenarios = 0usize;
    let mut n_passes = 0usize;
    let mut worst_aos = 0.0_f64;
    let mut worst_los = 0.0_f64;
    let mut worst_el = 0.0_f64;
    let mut worst_total = 0.0_f64;
    let mut worst_tca = 0.0_f64;

    // Closure to finalise & assert one scenario once its COUNT line is read.
    let check = |name: &str,
                 scn: &Scn,
                 rps: &[RefPass],
                 count: usize,
                 total: f64,
                 n_passes: &mut usize,
                 worst_aos: &mut f64,
                 worst_los: &mut f64,
                 worst_el: &mut f64,
                 worst_total: &mut f64,
                 worst_tca: &mut f64| {
        let got = run_kshana(scn);

        assert_eq!(
            got.len(),
            count,
            "[{name}] pass COUNT: kshana {} vs Orekit {count}",
            got.len()
        );
        assert_eq!(
            rps.len(),
            count,
            "[{name}] fixture inconsistent: {} PASS rows but COUNT {count}",
            rps.len()
        );

        let got_total: f64 = got.iter().map(|p| p.duration_s).sum();
        *worst_total = worst_total.max((got_total - total).abs());
        assert!(
            (got_total - total).abs() <= TOTAL_ACCESS_TOL_S,
            "[{name}] total access: kshana {got_total:.3} s vs Orekit {total:.3} s \
             (|Δ|={:.3} > {TOTAL_ACCESS_TOL_S})",
            (got_total - total).abs()
        );

        for (i, (g, r)) in got.iter().zip(rps.iter()).enumerate() {
            let d_aos = (g.aos_s - r.aos_s).abs();
            let d_los = (g.los_s - r.los_s).abs();
            let d_el = (g.max_elevation_deg - r.max_el_deg).abs();
            let d_dur = (g.duration_s - r.duration_s).abs();
            let d_tca = (g.tca_s - r.tca_s).abs();
            *worst_aos = worst_aos.max(d_aos);
            *worst_los = worst_los.max(d_los);
            *worst_el = worst_el.max(d_el);
            *worst_tca = worst_tca.max(d_tca);

            assert!(
                d_aos <= AOS_LOS_TOL_S,
                "[{name}] pass {i} AOS: kshana {:.3} vs Orekit {:.3} (|Δ|={d_aos:.4} > {AOS_LOS_TOL_S})",
                g.aos_s, r.aos_s
            );
            assert!(
                d_los <= AOS_LOS_TOL_S,
                "[{name}] pass {i} LOS: kshana {:.3} vs Orekit {:.3} (|Δ|={d_los:.4} > {AOS_LOS_TOL_S})",
                g.los_s, r.los_s
            );
            assert!(
                d_el <= MAX_EL_TOL_DEG,
                "[{name}] pass {i} max elevation: kshana {:.5} vs Orekit {:.5} deg \
                 (|Δ|={d_el:.5} > {MAX_EL_TOL_DEG})",
                g.max_elevation_deg,
                r.max_el_deg
            );
            assert!(
                d_dur <= DURATION_TOL_S,
                "[{name}] pass {i} duration: kshana {:.3} vs Orekit {:.3} s (|Δ|={d_dur:.4} > {DURATION_TOL_S})",
                g.duration_s, r.duration_s
            );
            // TCA: sample-step resolution in kshana, so a looser bound (one step).
            assert!(
                d_tca <= TCA_TOL_S,
                "[{name}] pass {i} TCA: kshana {:.3} vs Orekit {:.3} s (|Δ|={d_tca:.4} > {TCA_TOL_S})",
                g.tca_s, r.tca_s
            );
            // AOS <= TCA <= LOS ordering must hold in both.
            assert!(
                g.aos_s <= g.tca_s + 1e-6 && g.tca_s <= g.los_s + 1e-6,
                "[{name}] pass {i} ordering"
            );
            *n_passes += 1;
        }
    };

    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        if line.starts_with("SCN") {
            current = Some(parse_scn(line));
            ref_passes.clear();
        } else if line.starts_with("PASS") {
            let (name, rp) = parse_pass(line);
            let (cur_name, _) = current.as_ref().expect("PASS before SCN");
            assert_eq!(
                &name, cur_name,
                "PASS name {name} != current SCN {cur_name}"
            );
            ref_passes.push(rp);
        } else if line.starts_with("COUNT") {
            let parts: Vec<&str> = line.trim_start_matches("COUNT").split('|').collect();
            assert_eq!(parts.len(), 3, "COUNT row needs 3 |-fields: {line}");
            let name = parts[0].trim().to_string();
            let ref_count = parts[1].trim().parse::<usize>().unwrap();
            let ref_total = parts[2].trim().parse::<f64>().unwrap();

            let (cur_name, scn) = current.as_ref().expect("COUNT before SCN").clone();
            assert_eq!(
                name, cur_name,
                "COUNT name {name} != current SCN {cur_name}"
            );
            check(
                &cur_name,
                &scn,
                &ref_passes,
                ref_count,
                ref_total,
                &mut n_passes,
                &mut worst_aos,
                &mut worst_los,
                &mut worst_el,
                &mut worst_total,
                &mut worst_tca,
            );
            n_scenarios += 1;
        }
    }

    assert!(
        n_scenarios >= 20,
        "expected >= 20 pass scenarios, got {n_scenarios}"
    );
    assert!(n_passes >= 50, "expected many passes, got {n_passes}");
    eprintln!(
        "ground_station_pass_prediction_reference: {n_scenarios} scenarios, {n_passes} passes \
         vs Orekit 12.2 ElevationDetector. Worst |Δ|: AOS={worst_aos:.4}s LOS={worst_los:.4}s \
         max_el={worst_el:.5}deg total_access={worst_total:.4}s TCA={worst_tca:.4}s"
    );
}
