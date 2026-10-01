// SPDX-License-Identifier: AGPL-3.0-only
//! EO (Earth observation) payload footprint and coverage geometry, the full row, against
//! Orekit 12.2 and GeographicLib.
//!
//! PRE-REGISTRATION (written 2026-10-01, round 2, before the engine change, before the fixture
//! exists and before either oracle is run).
//!
//! QUANTITIES: every number the row claims (module `eo_payload`): Earth angular radius
//! `earth_angular_radius(h)`, swath width `swath_width(half_fov, h)`, nadir ground sample distance
//! `nadir_gsd(h, ifov)`, maximum off-nadir access ground range (`ground_range(min(slew, rho), h)`),
//! circular period `circular_period(h)`, the J2 nodal period and the equatorial ground-track
//! (ascending-node) spacing `ground_track_spacing_equator_j2(h, i)` = R_e (omega_E - dOmega/dt)
//! T_nodal (to be added to the engine; the current R_e omega_E T omits the nodal regression), and
//! the contiguous-coverage flag `swath >= spacing`.
//!
//! ENGINE CONVENTION, fixed now: the altitude h defines the mean semi-major axis a = R_e + h in the
//! first-order Brouwer sense; dOmega/dt, domega/dt and dM/dt are the first-order J2 secular rates
//! of `forces::j2_secular_rates` (e = 0); T_nodal = 2 pi / (n + dM/dt + domega/dt). Constants are
//! Kshana's: mu = 3.986004418e14 m^3/s^2, R_e = 6 378 137 m, J2 = 1.08262668e-3, omega_E =
//! 7.2921151467e-5 rad/s.
//!
//! GRID: altitude h in {400, 550, 700, 850, 1000, 1200, 1500} km; inclination i in {1, 30, 51.6,
//! 70, 90, 98} deg (i = 0 is excluded: an equatorial orbit has no ascending node, so the node
//! spacing is undefined; the critical inclination 63.4 deg is not on the grid); half field of view
//! {7.5, 25, 40, 50} deg (all below the smallest Earth angular radius on the grid, 54.06 deg at
//! 1500 km); instantaneous field of view (IFOV) {10, 14, 50} microradians; slew limit {30, 89} deg
//! (89 deg is clamped to the Earth angular radius, the horizon).
//!
//! ORACLE 1 (Library): Orekit 12.2 (Apache-2.0), run as a separate program
//! (`tests/fixtures/eo_payload_coverage_orekit_oracle/EoCoverageOrekitDriver.java`).
//!  - Sphere geometry: `OneAxisEllipsoid(R_e, f = 0)`. Satellite at (R_e + h, 0, 0) in the body
//!    frame. Angular radius: the angle at the satellite between the body centre and
//!    `Ellipsoid.pointOnLimb`. Swath: twice R_e times the central angle between the sub-satellite
//!    point and `getIntersectionPoint` of the ray at the half field of view from nadir; second
//!    swath oracle from `CircularFieldOfView.getFootprint` (nadir-pointing, the same half
//!    aperture): twice R_e times the mean central angle of the footprint points. Nadir GSD: R_e
//!    times the central angle between the intersections of the rays at +IFOV/2 and -IFOV/2.
//!    Maximum access: R_e times the central angle to `getIntersectionPoint` of the ray at the slew
//!    angle when it is below the angular radius, otherwise to `pointOnLimb` (a tangent ray's
//!    intersection is ill-conditioned). Circular period: `KeplerianOrbit.getKeplerianPeriod()`.
//!  - J2 dynamics: `NumericalPropagator` (DormandPrince853, position tolerance 1e-6 m) with
//!    `NewtonianAttraction(mu)` and `J2OnlyPerturbation(mu, R_e, J2, EME2000)` only. Initial state:
//!    Orekit's `BrouwerLyddanePropagator` (J2 = Kshana's, J3 = J4 = J5 = 0, `PropagationType.MEAN`)
//!    converts the mean elements a = R_e + h, e = 1e-3, i, RAAN 0, argument of perigee 0, mean
//!    anomaly -30 deg into the osculating state at the epoch. A `NodeDetector` (EME2000) records
//!    at least 15 ascending nodes (>= 14 revolutions). T_nodal = least-squares slope of node time
//!    against node index; node spacing = R_e times |least-squares slope of the node longitude in
//!    a frame turning at omega_E (right ascension of the node minus omega_E t, unwrapped)|.
//!  - Contiguous flag (oracle): Orekit swath >= Orekit node spacing.
//!
//! ORACLE 2 (Library): Orekit 12.2 `OneAxisEllipsoid` WGS-84 (a = 6 378 137 m, f =
//!    1/298.257223563) `pointOnLimb` for a satellite at geodetic altitude h over geodetic latitude
//!    0 (limb to the north and to the east), 45 (limb to the north and to the south) and 90 deg
//!    (limb toward longitude 0); limb angle measured from the geocentric nadir. GeographicLib 2.x
//!    (Karney, MIT licence, Python) `Geodesic.WGS84.Inverse` gives the geodesic distance from the
//!    geocentric sub-satellite point (the ellipsoid point on the line to the centre) to the limb
//!    point.
//!
//! TOLERANCES (fixed now; sources: the round 2 plan for the sphere, period, node and flag bars;
//! the existing test's 0.3 deg and 0.5 % bars for the WGS-84 comparison):
//!  - angular radius, swath (both swath oracles), maximum access: relative 1e-9;
//!  - nadir GSD: relative 1e-7. Deviation from the plan's 1e-9, justified before running: h IFOV
//!    is a small-angle form whose exact-arc difference is k (k + 1) IFOV^2 / 24 (k = (R_e + h) /
//!    R_e), at most 2.6e-10 on the grid, but the oracle's arc is a difference of two ground points
//!    6.4e6 m from the centre spanning 4 to 75 m, so a few units in the last place of the
//!    coordinates (about 1e-9 m each) are already 1e-9 of the arc;
//!  - circular period: relative 1e-12;
//!  - J2 nodal period and node spacing: relative 1e-3 (0.1 %) at every grid point;
//!  - contiguous flag: equal at every (h, i, half field of view) point, except points where
//!    Kshana's swath / spacing ratio is within +-0.1 % of 1. That exempt list is computed from the
//!    engine alone and committed in `exempt_flag_points.txt` before the oracle is run;
//!  - WGS-84: sphere angular radius within 0.3 deg of the Orekit WGS-84 limb angle; sphere maximum
//!    ground range R_e (pi/2 - rho) within 0.5 % of the GeographicLib geodesic distance.
//!
//! Any failure leaves the row MODELLED with the gap recorded; no bar changes after the run.
//!
//! VERDICT (2026-10-01, first run): AGREES on every comparison. Worst relative gaps: angular radius
//! 5.4e-16, circular period 1.6e-16, swath 4.8e-13 (intersection) and 7.0e-13 (footprint), maximum
//! access 1.9e-14, nadir GSD 2.9e-10, J2 nodal period 1.2e-5, node spacing 6.7e-5 (42 points, 15
//! or 16 nodes each); WGS-84 limb 0.186 deg against 0.3 deg; WGS-84 maximum ground range 3.2e-3
//! against 5e-3; contiguous flag equal at all 168 points (12 contiguous, 156 gapped). Mutation:
//! dropping the nodal regression (`EARTH_ROTATION_RATE - 0.0 * j2_node_rate(..)`) fails 35 of 42
//! node-spacing points, worst 2.19e-2. For context, the former R_e omega_E T (circular period)
//! form departs from the oracle by -1.77e-2 to +1.8e-3 on the same grid.

use kshana::eo_payload::{
    circular_period, earth_angular_radius, ground_range, ground_track_spacing_equator_j2,
    j2_nodal_period, nadir_gsd, swath_width,
};

const REF: &str = include_str!(
    "fixtures/eo_payload_coverage_orekit_oracle/eo_payload_coverage_orekit_oracle.txt"
);

const R_E: f64 = 6_378_137.0;
const SPHERE_REL: f64 = 1e-9;
const GSD_REL: f64 = 1e-7;
const PERIOD_REL: f64 = 1e-12;
const NODE_REL: f64 = 1e-3;
const LIMB_DEG: f64 = 0.3;
const MAX_RANGE_REL: f64 = 5e-3;

fn fields(line: &str) -> Vec<String> {
    line.split_once(' ')
        .unwrap()
        .1
        .split('|')
        .map(|f| f.trim().to_string())
        .collect()
}

fn num(s: &str) -> f64 {
    s.parse().unwrap()
}

fn key(h: f64, i: f64, f: f64) -> String {
    format!("{h} {i} {f}")
}

/// Runs every pre-registered comparison; returns (failures, report lines).
fn compare() -> (Vec<String>, Vec<String>) {
    let mut fail = Vec::new();
    let mut rep = Vec::new();
    let mut worst: std::collections::BTreeMap<&str, f64> = Default::default();
    let mut note = |k: &'static str, v: f64| {
        let e = worst.entry(k).or_insert(0.0);
        *e = e.max(v);
    };
    let rel_check = |what: &str, k: f64, o: f64, tol: f64, fail: &mut Vec<String>| -> f64 {
        let r = ((k - o) / o).abs();
        if r.is_nan() || r > tol {
            fail.push(format!(
                "{what}: Kshana {k:.12e} vs oracle {o:.12e}, rel {r:.3e} > {tol:e}"
            ));
        }
        r
    };
    let mut swath_or: std::collections::BTreeMap<String, f64> = Default::default();
    let mut spacing_or: std::collections::BTreeMap<String, f64> = Default::default();
    let mut counts = [0usize; 8];
    for line in REF.lines() {
        let tag = line.split(' ').next().unwrap_or("");
        match tag {
            "SPHERE" => {
                let f = fields(line);
                let h = num(&f[0]) * 1e3;
                let r = rel_check(
                    &format!("angular radius h {}", f[0]),
                    earth_angular_radius(h),
                    num(&f[1]),
                    SPHERE_REL,
                    &mut fail,
                );
                note("angular radius", r);
                let r = rel_check(
                    &format!("period h {}", f[0]),
                    circular_period(h),
                    num(&f[2]),
                    PERIOD_REL,
                    &mut fail,
                );
                note("circular period", r);
                counts[0] += 1;
            }
            "SWATH" => {
                let f = fields(line);
                let h = num(&f[0]) * 1e3;
                let k = swath_width(num(&f[1]).to_radians(), h).unwrap();
                let r = rel_check(
                    &format!("swath (intersection) h {} fov {}", f[0], f[1]),
                    k,
                    num(&f[2]),
                    SPHERE_REL,
                    &mut fail,
                );
                note("swath, intersection", r);
                for (j, what) in [(3, "mean"), (4, "min"), (5, "max")] {
                    let r = rel_check(
                        &format!("swath (footprint {what}) h {} fov {}", f[0], f[1]),
                        k,
                        num(&f[j]),
                        SPHERE_REL,
                        &mut fail,
                    );
                    note("swath, footprint", r);
                }
                swath_or.insert(format!("{} {}", f[0], f[1]), num(&f[2]));
                counts[1] += 1;
            }
            "GSD" => {
                let f = fields(line);
                let k = nadir_gsd(num(&f[0]) * 1e3, num(&f[1]));
                let r = rel_check(
                    &format!("GSD h {} ifov {}", f[0], f[1]),
                    k,
                    num(&f[2]),
                    GSD_REL,
                    &mut fail,
                );
                note("nadir GSD", r);
                counts[2] += 1;
            }
            "ACCESS" => {
                let f = fields(line);
                let h = num(&f[0]) * 1e3;
                let eta = num(&f[1]).to_radians().min(earth_angular_radius(h));
                let k = ground_range(eta, h).unwrap();
                let r = rel_check(
                    &format!("access h {} slew {} ({})", f[0], f[1], f[3]),
                    k,
                    num(&f[2]),
                    SPHERE_REL,
                    &mut fail,
                );
                note("maximum access", r);
                counts[3] += 1;
            }
            "NODE" => {
                let f = fields(line);
                let (h, i) = (num(&f[0]) * 1e3, num(&f[1]).to_radians());
                assert!(num(&f[4]) >= 15.0, "too few nodes: {line}");
                let r = rel_check(
                    &format!("nodal period h {} i {}", f[0], f[1]),
                    j2_nodal_period(h, i),
                    num(&f[2]),
                    NODE_REL,
                    &mut fail,
                );
                note("J2 nodal period", r);
                let r = rel_check(
                    &format!("node spacing h {} i {}", f[0], f[1]),
                    ground_track_spacing_equator_j2(h, i),
                    num(&f[3]),
                    NODE_REL,
                    &mut fail,
                );
                note("node spacing", r);
                spacing_or.insert(format!("{} {}", f[0], f[1]), num(&f[3]));
                counts[4] += 1;
            }
            "WGS" => {
                let f = fields(line);
                let d = (earth_angular_radius(num(&f[0]) * 1e3).to_degrees() - num(&f[3])).abs();
                if d.is_nan() || d > LIMB_DEG {
                    fail.push(format!(
                        "WGS-84 limb h {} lat {} {}: |d| {d:.4} deg > {LIMB_DEG}",
                        f[0], f[1], f[2]
                    ));
                }
                note("WGS-84 limb (deg)", d);
                counts[5] += 1;
            }
            "GEO" => {
                let f = fields(line);
                let rho = earth_angular_radius(num(&f[0]) * 1e3);
                let k = R_E * (std::f64::consts::FRAC_PI_2 - rho);
                let r = rel_check(
                    &format!("WGS-84 max ground range h {} lat {} {}", f[0], f[1], f[2]),
                    k,
                    num(&f[3]),
                    MAX_RANGE_REL,
                    &mut fail,
                );
                note("WGS-84 max ground range", r);
                counts[6] += 1;
            }
            _ => {}
        }
    }
    // Contiguous-coverage flag at every (h, i, half field of view), exempt points excepted.
    let exempt: Vec<String> = engine_exempt_points()
        .iter()
        .map(|l| l.rsplit_once(' ').unwrap().0.to_string())
        .collect();
    let (mut n_true, mut n_false) = (0, 0);
    for h in ALTS_KM {
        for i in INCS_DEG {
            for fv in HALF_FOVS_DEG {
                let hs = format!("{h:.1}");
                let o_sw = swath_or[&format!("{hs} {fv:.1}")];
                let o_sp = spacing_or[&format!("{hs} {i:.1}")];
                let oracle_flag = o_sw >= o_sp;
                let k_flag = swath_width(fv.to_radians(), h * 1e3).unwrap()
                    >= ground_track_spacing_equator_j2(h * 1e3, i.to_radians());
                if oracle_flag {
                    n_true += 1
                } else {
                    n_false += 1
                }
                if k_flag != oracle_flag && !exempt.contains(&key(h, i, fv)) {
                    fail.push(format!("contiguous flag h {h} i {i} fov {fv}: Kshana {k_flag}, oracle {oracle_flag}"));
                }
                counts[7] += 1;
            }
        }
    }
    rep.push(format!(
        "points: sphere {}, swath {}, GSD {}, access {}, node {}, WGS limb {}, WGS range {}, flags {} ({n_true} contiguous, {n_false} gapped)",
        counts[0], counts[1], counts[2], counts[3], counts[4], counts[5], counts[6], counts[7]
    ));
    for (k, v) in &worst {
        rep.push(format!("worst {k}: {v:.3e}"));
    }
    assert_eq!(
        counts,
        [7, 28, 21, 14, 42, 35, 35, 168],
        "fixture incomplete"
    );
    (fail, rep)
}

const EXEMPT: &str =
    include_str!("fixtures/eo_payload_coverage_orekit_oracle/exempt_flag_points.txt");

const ALTS_KM: [f64; 7] = [400.0, 550.0, 700.0, 850.0, 1000.0, 1200.0, 1500.0];
const INCS_DEG: [f64; 6] = [1.0, 30.0, 51.6, 70.0, 90.0, 98.0];
const HALF_FOVS_DEG: [f64; 4] = [7.5, 25.0, 40.0, 50.0];

/// The contiguous-flag exemption list, recomputed from the engine alone: every grid point whose
/// swath / spacing ratio lies within +-0.1 % of 1, as "h_km i_deg half_fov_deg ratio".
fn engine_exempt_points() -> Vec<String> {
    let mut out = Vec::new();
    for h in ALTS_KM {
        for i in INCS_DEG {
            for f in HALF_FOVS_DEG {
                let sw = swath_width(f.to_radians(), h * 1e3).unwrap();
                let sp = ground_track_spacing_equator_j2(h * 1e3, i.to_radians());
                let ratio = sw / sp;
                if (ratio - 1.0).abs() <= 1e-3 {
                    out.push(format!("{h} {i} {f} {ratio:.6}"));
                }
            }
        }
    }
    out
}

/// The committed exemption list (written before the oracle ran) is the engine's.
#[test]
fn exempt_flag_points_are_the_engines() {
    let committed: Vec<String> = EXEMPT
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(String::from)
        .collect();
    let engine = engine_exempt_points();
    if std::env::var_os("EO_PRINT_EXEMPT").is_some() {
        for l in &engine {
            println!("{l}");
        }
    }
    assert_eq!(committed, engine);
}

#[test]
fn eo_coverage_matches_orekit_and_geographiclib() {
    let (fail, rep) = compare();
    for l in &rep {
        eprintln!("{l}");
    }
    assert!(fail.is_empty(), "disagreements:\n{}", fail.join("\n"));
}
