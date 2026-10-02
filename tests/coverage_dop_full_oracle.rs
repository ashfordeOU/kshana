// SPDX-License-Identifier: AGPL-3.0-only
//! External oracles for the full claim of the verification row "Coverage and
//! dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any
//! central body" (`constellation::coverage`, `ConstellationDesignScenario`).
//!
//! Why a new comparison: an adversarial verifier showed that
//! `tests/coverage_dop_gnss_lib_py_oracle.rs` checks only the position dilution of precision
//! (PDOP) of two Earth presets with one receiver clock, on satellite positions exported by the
//! engine, with elevation and visibility from this project's own numpy script. A mutant
//! doubling the geometric, horizontal and vertical DOP (GDOP, HDOP, VDOP) left it green; the
//! one-clock-per-constellation path, the BeiDou preset, the Moon, Mars, explicit and
//! multi-shell designs and the ground tracks were never compared. This file compares all of
//! them with independent tools. The earlier test and its tolerances are unchanged.
//!
//! Pre-registration (validation 0.30, round 2, batch "tools", repair; written 2026-10-02
//! before any fixture below was generated and before any oracle was run on these inputs).
//!
//! ## Engine change made with this pre-registration (before any run)
//!
//! With one clock per constellation the time DOP (TDOP), and so GDOP, belong to a reference
//! clock the documentation called "the first constellation with a satellite in view", but
//! `coverage` took the first one met while scanning satellites sorted by latitude, so the
//! reference depended on scan order. It is now the lowest-numbered constellation in view
//! (`coverage` and `dop_at`). With a common clock nothing changes.
//!
//! ## Inputs
//!
//! `tests/fixtures/coverage_dop_full_oracle/designs.json` (committed with this
//! pre-registration), seven designs, each with a 5 degree elevation mask, PDOP threshold 6, no
//! J2 and a full global grid of cell centres:
//! 1. `galileo`: Earth, the Galileo preset (Walker 24/3/1), common clock, 1 day at 300 s,
//!    5 degree grid;
//! 2. `gps-baseline`: Earth, the GPS baseline 24-slot preset, common clock, same window;
//! 3. `beidou`: Earth, the BeiDou preset (24 medium-orbit Walker 24/3/1, 3 geostationary,
//!    3 inclined geosynchronous), common clock, same window;
//! 4. `gnss-multi`: Earth, Galileo and GPS as two constellations with one receiver clock each
//!    (`ClockModel::PerConstellation`), same window;
//! 5. `moon-multishell`: Moon, one constellation of two Walker shells (delta 12/3/1 at
//!    3000 km, 55 degrees; star 6/3/1 at 5000 km, 90 degrees) and one explicit elliptical
//!    satellite (a = 6142.4 km, e = 0.6, i = 57.7 degrees, argument of periapsis 90 degrees),
//!    common clock, same window;
//! 6. `mars-two-systems`: Mars, a Walker star 15/3/1 at 6000 km and 80 degrees as one
//!    constellation and four explicit satellites (three at a = 15 000 km, e = 0.2, one
//!    areostationary) as a second, one clock each, same window;
//! 7. `leo-scale`: Earth, a 1584-satellite Walker delta 1584/72/17 at 550 km and 53 degrees,
//!    common clock, 1 hour at 300 s, 10 degree grid.
//! The body constants (gravitational parameter, radius, spin rate) are the engine's published
//! values (`crate::body`), exported once to `bodies.txt` and checked here to be unchanged.
//!
//! ## Oracles (all run as separate programs by `make_fixture.py`; only printed numbers committed)
//!
//! - Elements: the generator builds every element set itself from the design (Walker's
//!   definition: plane `k` node `Ω0 + k·ΔΩ` with `ΔΩ = 360°/P` delta or `180°/P` star; slot
//!   `j` mean anomaly `M0 + j·360°·P/T + k·360°·F/T`; the GPS slots from SPS Performance
//!   Standard 5th ed. Table 3.2-1 with RAAN minus the 100.765 degree hour angle; the Galileo
//!   OS SDD and BDS-OS-PS-3.0 values as the presets document them; the explicit satellites as
//!   given) (`elements_<design>.txt`).
//! - Positions: Orekit 12.2 (Apache-2.0) `KeplerianPropagator` from those elements with the
//!   body's gravitational parameter in an inertial frame aligned with the body-fixed frame at
//!   the epoch, rotated by `−ω·t` about the pole (`positions_<design>.txt`).
//! - Elevation and azimuth: Orekit 12.2 `TopocentricFrame` on a `OneAxisEllipsoid` of the
//!   body's radius with flattening 0 (the engine's spherical user model) at every cell centre;
//!   a satellite is used when Orekit's elevation is at least the mask.
//! - DOP with a common clock: gnss_lib_py 1.0.4 (MIT) `utils.dop.get_dop` with GDOP, PDOP,
//!   HDOP and VDOP from Orekit's elevation and azimuth.
//! - DOP with one clock per constellation (gnss_lib_py has one clock): numpy 2.3.5
//!   (BSD-3-Clause) `linalg.inv` of `GᵀG` with `G = [−e −n −u | one clock column per
//!   constellation in view]` from Orekit's angles; a fix needs at least as many satellites as
//!   unknowns and `linalg.matrix_rank(G)` equal to the number of unknowns; TDOP from the
//!   lowest-numbered constellation in view; GDOP = √(PDOP² + TDOP²).
//! - Ground tracks: Orekit `OneAxisEllipsoid.transform` (flattening 0) of the Orekit positions
//!   at the scenario's track times (`tracks_<design>.txt`).
//!
//! ## Tolerances (fixed now)
//!
//! - elements: semi-major axis within 1e-6 m, eccentricity within 1e-15, angles within
//!   1e-12 rad (modulo 2π);
//! - positions: every satellite at every epoch within 1e-5 m (double-precision rounding of
//!   angles up to about 13 rad on radii up to 4.2e7 m is about 1e-7 m);
//! - per cell: fix share and availability within 1e-9 percentage points; mean visible count
//!   within 1e-12; fewest and most visible satellites equal; mean PDOP, HDOP, VDOP, GDOP and
//!   largest PDOP within 1e-9 relative;
//! - global: availability, fix share and worst-cell availability within 1e-9 percentage
//!   points; mean visible count and each constellation's mean visible count within 1e-12
//!   relative; fewest visible satellites equal;
//! - ground tracks (the scenario JSON rounds to 1e-3 degree): latitude and longitude of every
//!   emitted sample within 5e-4 + 1e-9 degree (longitude modulo 360).
//!
//! ## Discrimination checks, pre-registered (each must turn this test red)
//!
//! 1. GDOP, HDOP and VDOP doubled together in `NormalAccum::solve`;
//! 2. the PDOP doubled (`pdop: 2.0 * pdop2.sqrt()`);
//! 3. the clock columns collapsed (`ClockModel::PerConstellation => 0` in `coverage`);
//! 4. the body rotation dropped in `Sat::position_fixed`;
//! 5. the Walker phase offset taken as `2π(F+1)/T`.
//!
//! The strict test is ignored until the fixture exists and the comparison has run.

use kshana::constellation::{
    body_by_name, coverage, satellite_positions_fixed, ClockModel, ConstellationDesignScenario,
    CoverageSpec, Elements,
};
use serde_json::Value;
use std::f64::consts::TAU;
use std::path::PathBuf;

const MASK_DEG: f64 = 5.0;
const PDOP_MAX: f64 = 6.0;
const TOL_A_M: f64 = 1e-6;
const TOL_E: f64 = 1e-15;
const TOL_ANGLE_RAD: f64 = 1e-12;
const TOL_POS_M: f64 = 1e-5;
const TOL_PCT: f64 = 1e-9;
const TOL_VIS: f64 = 1e-12;
const TOL_DOP_REL: f64 = 1e-9;
const TOL_TRACK_DEG: f64 = 5e-4 + 1e-9;

fn dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/coverage_dop_full_oracle")
}

fn read(name: &str) -> String {
    let p = dir().join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn rows(name: &str) -> Vec<Vec<String>> {
    read(name)
        .lines()
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'))
        .map(|l| l.split_whitespace().map(str::to_string).collect())
        .collect()
}

fn num(s: &str) -> f64 {
    s.parse().unwrap_or_else(|_| panic!("not a number: {s:?}"))
}

fn designs() -> Vec<Value> {
    let v: Value = serde_json::from_str(&read("designs.json")).expect("designs.json");
    v["designs"].as_array().expect("designs").clone()
}

/// The scenario of a design, with the shared mask and threshold and the track settings.
fn scenario(d: &Value, grid_step_deg: f64) -> ConstellationDesignScenario {
    let mut s = d.clone();
    let o = s.as_object_mut().unwrap();
    o.remove("name");
    o.insert("mask_deg".into(), MASK_DEG.into());
    o.insert("pdop_threshold".into(), PDOP_MAX.into());
    o.insert("grid_step_deg".into(), grid_step_deg.into());
    o.insert("j2".into(), false.into());
    o.insert("track_points".into(), 24.into());
    o.insert("max_tracks".into(), 120.into());
    serde_json::from_value(s).expect("scenario")
}

fn spec(d: &Value) -> CoverageSpec {
    CoverageSpec {
        duration_s: d["duration_s"].as_f64().unwrap(),
        step_s: d["step_s"].as_f64().unwrap(),
        mask_deg: MASK_DEG,
        pdop_threshold: PDOP_MAX,
        grid_step_deg: d["grid_step_deg"].as_f64().unwrap(),
        lat_min_deg: -90.0,
        lat_max_deg: 90.0,
        lon_min_deg: -180.0,
        lon_max_deg: 180.0,
        clock: match d["clock"].as_str().unwrap() {
            "common" => ClockModel::Common,
            "per-constellation" => ClockModel::PerConstellation,
            c => panic!("clock {c}"),
        },
        j2: false,
    }
}

fn epochs(d: &Value) -> Vec<f64> {
    let (dur, step) = (
        d["duration_s"].as_f64().unwrap(),
        d["step_s"].as_f64().unwrap(),
    );
    let n = (dur / step + 1e-9).floor() as usize;
    (0..n).map(|k| k as f64 * step).collect()
}

/// Writes `bodies.txt` (the engine's published body constants, an input of the oracle) when
/// `KSHANA_WRITE_COVERAGE_INPUTS=1`; otherwise does nothing.
#[test]
fn write_body_constants_on_request() {
    if std::env::var("KSHANA_WRITE_COVERAGE_INPUTS").as_deref() != Ok("1") {
        return;
    }
    let mut out = String::from("# name mu (m^3/s^2) radius (m) spin rate (rad/s), crate::body\n");
    for n in ["earth", "moon", "mars"] {
        let b = body_by_name(n).unwrap();
        out += &format!("{n} {:.17e} {:.17e} {:.17e}\n", b.mu, b.re, b.rotation_rate);
    }
    std::fs::write(dir().join("bodies.txt"), out).unwrap();
}

fn ang_diff(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(TAU);
    d.min(TAU - d)
}

#[derive(Default, Debug)]
struct Worst {
    el: f64,
    pos: f64,
    pct: f64,
    vis: f64,
    dop: f64,
    track: f64,
    cells: usize,
    tracks: usize,
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

fn check_design(d: &Value) -> Worst {
    let name = d["name"].as_str().unwrap();
    let mut w = Worst::default();
    // Body constants unchanged.
    let body_name = d["body"].as_str().unwrap();
    let body = body_by_name(body_name).unwrap();
    let b = rows("bodies.txt")
        .into_iter()
        .find(|r| r[0] == body_name)
        .expect("body row");
    assert_eq!(
        (num(&b[1]), num(&b[2]), num(&b[3])),
        (body.mu, body.re, body.rotation_rate),
        "{name}: body constants changed"
    );

    // Elements: the engine's build against the generator's own construction.
    let sc = scenario(d, d["grid_step_deg"].as_f64().unwrap());
    let (_, built) = sc.build().expect("build");
    let els: Vec<Vec<Elements>> = built.iter().map(|c| c.elements.clone()).collect();
    let flat: Vec<(usize, Elements)> = els
        .iter()
        .enumerate()
        .flat_map(|(c, v)| v.iter().map(move |&e| (c, e)))
        .collect();
    let oe = rows(&format!("elements_{name}.txt"));
    assert_eq!(oe.len(), flat.len(), "{name}: satellite count");
    for (r, (c, e)) in oe.iter().zip(&flat) {
        let v: Vec<f64> = r.iter().map(|x| num(x)).collect();
        assert_eq!(v[0] as usize, *c, "{name}: constellation index");
        let da = (e.a_m - v[2]).abs();
        let de = (e.e - v[3]).abs();
        let dang = [
            ang_diff(e.i_rad, v[4]),
            ang_diff(e.raan_rad, v[5]),
            ang_diff(e.argp_rad, v[6]),
            ang_diff(e.m0_rad, v[7]),
        ];
        let dmax = dang.iter().cloned().fold(0.0, f64::max);
        w.el = w.el.max(dmax);
        assert!(
            da <= TOL_A_M,
            "{name} sat {}: a {} vs {}",
            v[1],
            e.a_m,
            v[2]
        );
        assert!(de <= TOL_E, "{name} sat {}: e {} vs {}", v[1], e.e, v[3]);
        assert!(
            dmax <= TOL_ANGLE_RAD,
            "{name} sat {}: angles off by {dang:?} rad",
            v[1]
        );
    }

    // Positions: the engine's propagation against Orekit's.
    let pos = rows(&format!("positions_{name}.txt"));
    let mut it = pos.iter();
    for t in epochs(d) {
        for (k, s) in satellite_positions_fixed(&body, &els, false, t)
            .iter()
            .enumerate()
        {
            let r = it.next().expect("position row");
            assert_eq!((num(&r[0]), num(&r[1]) as usize), (t, k), "{name}: order");
            let dp = ((s[0] - num(&r[2])).powi(2)
                + (s[1] - num(&r[3])).powi(2)
                + (s[2] - num(&r[4])).powi(2))
            .sqrt();
            w.pos = w.pos.max(dp);
            assert!(
                dp <= TOL_POS_M,
                "{name} t {t} sat {k}: position off by {dp} m"
            );
        }
    }
    assert!(it.next().is_none(), "{name}: extra position rows");

    // Maps.
    let r = coverage(&body, &els, &spec(d), false).expect("coverage");
    for row in rows(&format!("maps_{name}.txt")) {
        match row[0].as_str() {
            "global" => {
                let v: Vec<f64> = row[1..].iter().map(|x| num(x)).collect();
                let d1 = (r.global_availability_pct - v[0]).abs();
                let d2 = (r.global_fix_pct - v[1]).abs();
                let d3 = (r.worst_site_availability_pct - v[2]).abs();
                assert!(
                    d1 <= TOL_PCT,
                    "{name}: global availability {} vs {}",
                    r.global_availability_pct,
                    v[0]
                );
                assert!(
                    d2 <= TOL_PCT,
                    "{name}: global fix {} vs {}",
                    r.global_fix_pct,
                    v[1]
                );
                assert!(
                    d3 <= TOL_PCT,
                    "{name}: worst cell {} vs {}",
                    r.worst_site_availability_pct,
                    v[2]
                );
                let d4 = rel(r.global_mean_visible, v[3]);
                assert!(
                    d4 <= TOL_VIS,
                    "{name}: global mean visible {} vs {}",
                    r.global_mean_visible,
                    v[3]
                );
                assert_eq!(
                    r.global_min_visible, v[4] as usize,
                    "{name}: global fewest visible"
                );
                w.pct = w.pct.max(d1).max(d2).max(d3);
                w.vis = w.vis.max(d4);
            }
            "bycons" => {
                let v: Vec<f64> = row[1..].iter().map(|x| num(x)).collect();
                assert_eq!(v.len(), r.mean_visible_by_constellation.len());
                for (a, b) in r.mean_visible_by_constellation.iter().zip(&v) {
                    let dv = if *b == 0.0 { a.abs() } else { rel(*a, *b) };
                    assert!(
                        dv <= TOL_VIS,
                        "{name}: per-constellation visible {a} vs {b}"
                    );
                    w.vis = w.vis.max(dv);
                }
            }
            _ => {
                // ilat ilon fix_pct avail_pct mean_vis min_vis max_vis mean_pdop mean_hdop
                // mean_vdop mean_gdop max_pdop (nan without a fix)
                let (a, o): (usize, usize) = (row[0].parse().unwrap(), row[1].parse().unwrap());
                let v: Vec<f64> = row[2..].iter().map(|x| num(x)).collect();
                let at = format!("{name} cell {a},{o}");
                let d_fix = (r.fix_pct[a][o] - v[0]).abs();
                let d_av = (r.availability_pct[a][o] - v[1]).abs();
                let d_vis = (r.mean_visible[a][o] - v[2]).abs();
                assert!(
                    d_fix <= TOL_PCT,
                    "{at}: fix {} vs {}",
                    r.fix_pct[a][o],
                    v[0]
                );
                assert!(
                    d_av <= TOL_PCT,
                    "{at}: availability {} vs {}",
                    r.availability_pct[a][o],
                    v[1]
                );
                assert!(
                    d_vis <= TOL_VIS,
                    "{at}: mean visible {} vs {}",
                    r.mean_visible[a][o],
                    v[2]
                );
                assert_eq!(r.min_visible[a][o], v[3] as usize, "{at}: fewest visible");
                assert_eq!(r.max_visible[a][o], v[4] as usize, "{at}: most visible");
                w.pct = w.pct.max(d_fix).max(d_av);
                w.vis = w.vis.max(d_vis);
                let eng = [
                    ("mean PDOP", r.mean_pdop[a][o]),
                    ("mean HDOP", r.mean_hdop[a][o]),
                    ("mean VDOP", r.mean_vdop[a][o]),
                    ("mean GDOP", r.mean_gdop[a][o]),
                    ("max PDOP", r.max_pdop[a][o]),
                ];
                for (k, (what, x)) in eng.iter().enumerate() {
                    let o_v = v[5 + k];
                    match x {
                        Some(x) => {
                            let e = rel(*x, o_v);
                            assert!(e <= TOL_DOP_REL, "{at}: {what} {x} vs {o_v}");
                            w.dop = w.dop.max(e);
                        }
                        None => assert!(o_v.is_nan(), "{at}: {what} fix mismatch"),
                    }
                }
                w.cells += 1;
            }
        }
    }
    assert_eq!(
        w.cells,
        r.lats_deg.len() * r.lons_deg.len(),
        "{name}: every cell"
    );

    // Ground tracks: the scenario's emitted samples against Orekit's sub-satellite points.
    let (json, _, _) = scenario(d, 90.0).run_all().expect("run_all");
    let doc: Value = serde_json::from_str(&json).unwrap();
    let tr = &doc["tracks"];
    let stride = tr["stride"].as_u64().unwrap() as usize;
    let times: Vec<f64> = tr["times_s"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    let orekit = rows(&format!("tracks_{name}.txt"));
    for (n, sat) in tr["satellites"].as_array().unwrap().iter().enumerate() {
        let k = n * stride;
        let la = sat["lat_deg"].as_array().unwrap();
        let lo = sat["lon_deg"].as_array().unwrap();
        for (j, t) in times.iter().enumerate() {
            let o = &orekit[n * times.len() + j];
            assert_eq!(
                (num(&o[0]) as usize, num(&o[1])),
                (k, *t),
                "{name}: track order"
            );
            let dla = (la[j].as_f64().unwrap() - num(&o[2])).abs();
            let dlo0 = (lo[j].as_f64().unwrap() - num(&o[3])).rem_euclid(360.0);
            let dlo = dlo0.min(360.0 - dlo0);
            w.track = w.track.max(dla).max(dlo);
            assert!(
                dla <= TOL_TRACK_DEG && dlo <= TOL_TRACK_DEG,
                "{name} sat {k} t {t}: track ({}, {}) vs Orekit ({}, {})",
                la[j],
                lo[j],
                o[2],
                o[3]
            );
            w.tracks += 1;
        }
    }
    w
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn coverage_dop_maps_match_independent_tools_on_every_design() {
    for d in designs() {
        let w = check_design(&d);
        println!(
            "{}: {} cells, {} track samples; worst element angle {:.1e} rad, position {:.1e} m, \
             |d pct| {:.1e}, visible {:.1e}, DOP rel {:.2e}, track {:.1e} deg",
            d["name"].as_str().unwrap(),
            w.cells,
            w.tracks,
            w.el,
            w.pos,
            w.pct,
            w.vis,
            w.dop,
            w.track
        );
    }
}
