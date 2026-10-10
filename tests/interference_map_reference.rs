// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-oracle checks of the interference map's decoding semantics and geometry.
//!
//! The fixtures in `tests/fixtures/interference_map_ref/` are written by
//! `scripts/gen_interference_map_ref.py` from synthetic inputs, with pinned oracles: pyModeS 2.21
//! (ADS-B accuracy and integrity codes), pyais 3.3.0 (AIS field values), shapely 2.2.0 (grid cell,
//! route/cell intersection, land containment), GeographicLib 2.1 (geodesic lengths) and pyproj
//! 3.8.0 (distance to a coastline). CI needs no Python.
//!
//! The tolerances below were pre-registered in `tests/fixtures/interference_map_ref/PREREGISTRATION.md`
//! before any comparison was run, and are not to be loosened after a result: a failure is reported,
//! not tuned.
//!
//! What this validates: how Kshana reads accuracy and integrity codes and AIS field values, where
//! it puts a position on its grid, how long a route is and how much of it lies in each cell state,
//! and whether a position is inland of a coastline. It does NOT validate that a cell flagged
//! degraded or anomalous is interference.

use kshana::interference_map::adsb::{nacp_epu_bound_m, nic_rc_bound_range_m, AdsbParams};
use kshana::interference_map::ais::{ais_position_is_valid, ais_speed_kn};
use kshana::interference_map::grid::{CellId, Grid};
use kshana::interference_map::land::LandMask;
use kshana::interference_map::output::{to_geojson, CellOut, DayOut};
use kshana::interference_map::route::{exposure, load_map, parse_route};
use kshana::interference_map::sources;
use serde_json::{json, Map, Value};

// ---- pre-registered tolerances (see PREREGISTRATION.md) ----
/// a1: NACp EPU bound, metres (the oracle rounds to whole metres).
const NACP_EPU_TOL_M: f64 = 0.5;
/// a2: a NACp code is low iff the oracle EPU is unavailable or at least this (m) ...
const NACP_LOW_EPU_MIN_M: f64 = 555.0;
/// ... and good iff it is available and at most this (m).
const NACP_GOOD_EPU_MAX_M: f64 = 93.5;
/// a3: NIC containment radius, metres, on each end of the range.
const NIC_RC_TOL_M: f64 = 1.0;
/// a4: a NIC code is low iff the oracle Rc is unavailable (NIC 0) or at least this (m) ...
const NIC_LOW_RC_MIN_M: f64 = 1851.0;
/// ... and good iff it is available and at most this (m).
const NIC_GOOD_RC_MAX_M: f64 = 371.0;
/// b2: decoded speed equality.
const AIS_SPEED_TOL: f64 = 1e-9;
/// d1, d2: relative tolerance on route length.
///
/// Derivation (from the geometry, fixed before any result was seen). Kshana measures length on a
/// sphere of radius R = 6371.0088 km; the oracle measures it on the WGS84 ellipsoid. A short arc
/// along a meridian has ellipsoidal length s * r, where r is the meridional radius of curvature M,
/// 6335.4 km at the equator rising to 6399.6 km at the pole; along a parallel r is the prime-vertical
/// radius N, 6378.1 km at the equator rising to 6399.6 km at the pole; in any other direction r
/// lies between the two. The relative difference |R - r| / r is therefore at most
/// |6371.0088 - 6335.4| / 6335.4 = 0.56% (at the equator, along a meridian). 0.6% is that bound
/// rounded up.
const ROUTE_REL_TOL: f64 = 0.006;
/// d2: metres per oracle piece.
///
/// Derivation. Kshana cuts each leg into pieces of at most 250 m and gives each piece to the cell
/// holding its midpoint. A cell boundary falls somewhere inside one piece, and the piece is given
/// whole to one side, so at most half a piece (125 m) is attributed to the wrong cell per
/// boundary crossing. An oracle piece is a leg inside one cell, so the number of crossings is
/// bounded by the number of oracle pieces, and the per-state length error by 125 m per piece.
const ROUTE_PIECE_TOL_M: f64 = 125.0;
/// e: inland buffer, metres.
const LAND_BUFFER_M: f64 = 2000.0;

fn fixture(text: &str) -> Value {
    serde_json::from_str(text).expect("fixture is valid JSON")
}

fn opt_f64(v: &Value) -> Option<f64> {
    v.as_f64()
}

#[test]
fn adsb_accuracy_and_integrity_codes_agree_with_pymodes() {
    let fx = fixture(include_str!(
        "fixtures/interference_map_ref/adsb_codes.json"
    ));
    let p = AdsbParams::PREREGISTERED_V1;

    // a1, a2: NACp, codes 0 to 11, decoded by the oracle from synthetic DF17 operational-status frames.
    let nacp = fx["nacp"].as_array().unwrap();
    assert_eq!(nacp.len(), 12);
    for row in nacp {
        let code = row["code"].as_u64().unwrap() as u8;
        let oracle = opt_f64(&row["epu_m"]);
        let ours = nacp_epu_bound_m(code);
        match (ours, oracle) {
            (None, None) => {}
            (Some(a), Some(b)) => assert!(
                (a - b).abs() <= NACP_EPU_TOL_M,
                "NACp {code}: ours {a} m, oracle {b} m"
            ),
            _ => panic!("NACp {code}: ours {ours:?}, oracle {oracle:?}"),
        }
        let (low, good) = p.classify(None, Some(code));
        assert_eq!(
            low,
            oracle.is_none_or(|e| e >= NACP_LOW_EPU_MIN_M),
            "NACp {code} low"
        );
        assert_eq!(
            good,
            oracle.is_some_and(|e| e <= NACP_GOOD_EPU_MAX_M),
            "NACp {code} good"
        );
    }

    // a3, a4: NIC, every code the oracle produces from synthetic DF17 airborne-position frames.
    let nic = fx["nic"].as_array().unwrap();
    let mut seen = [false; 12];
    for row in nic {
        let code = row["nic"].as_u64().unwrap() as u8;
        seen[code as usize] = true;
        let rc = opt_f64(&row["rc_m"]);
        let (low, good) = p.classify(Some(code), None);
        assert_eq!(
            low,
            rc.is_none_or(|r| r >= NIC_LOW_RC_MIN_M),
            "NIC {code} (frame {}) low",
            row["frame"]
        );
        assert_eq!(
            good,
            rc.is_some_and(|r| r <= NIC_GOOD_RC_MAX_M),
            "NIC {code} (frame {}) good",
            row["frame"]
        );
        if code >= 5 {
            let (lo, hi) =
                nic_rc_bound_range_m(code).unwrap_or_else(|| panic!("no range for NIC {code}"));
            let r = rc.expect("NIC 5 to 11 carry a bound");
            assert!(
                r >= lo - NIC_RC_TOL_M && r <= hi + NIC_RC_TOL_M,
                "NIC {code}: oracle Rc {r} m outside ours [{lo}, {hi}] m"
            );
        }
    }
    assert!(
        seen.iter().all(|s| *s),
        "every NIC code 0 to 11 is exercised: {seen:?}"
    );
}

#[test]
fn ais_field_rules_agree_with_pyais_decoding() {
    let fx = fixture(include_str!(
        "fixtures/interference_map_ref/ais_fields.json"
    ));
    let frames = fx["frames"].as_array().unwrap();
    let (mut na_pos, mut na_speed, mut compared) = (0, 0, 0);
    for f in frames {
        let (lat, lon, speed) = (
            f["lat"].as_f64().unwrap(),
            f["lon"].as_f64().unwrap(),
            f["speed_kn"].as_f64().unwrap(),
        );
        // b1: not-available positions are refused, available ones accepted. (0, 0) is Kshana's own
        // rule and is not compared.
        if !f["null_island"].as_bool().unwrap() {
            let avail = f["position_available"].as_bool().unwrap();
            assert_eq!(
                ais_position_is_valid(lat, lon),
                avail,
                "{}: ({lat}, {lon})",
                f["sentence"]
            );
            na_pos += i32::from(!avail);
            compared += 1;
        }
        // b2: speed 102.3 is not available; 0 to 102.2 is kept as decoded.
        match ais_speed_kn(speed) {
            None => {
                assert!(
                    !f["speed_available"].as_bool().unwrap(),
                    "{}: {speed}",
                    f["sentence"]
                );
                na_speed += 1;
            }
            Some(v) => {
                assert!(
                    f["speed_available"].as_bool().unwrap(),
                    "{}: {speed}",
                    f["sentence"]
                );
                assert!((v - speed).abs() <= AIS_SPEED_TOL);
            }
        }
    }
    assert!(
        compared >= 90 && na_pos >= 3 && na_speed >= 1,
        "{compared} {na_pos} {na_speed}"
    );
}

#[test]
fn grid_cell_assignment_agrees_with_shapely() {
    let fx = fixture(include_str!(
        "fixtures/interference_map_ref/grid_cells.json"
    ));
    let pts = fx["points"].as_array().unwrap();
    let (mut strict, mut edge) = (0, 0);
    for p in pts {
        let deg = p["deg"].as_f64().unwrap();
        let (lat, lon) = (p["lat"].as_f64().unwrap(), p["lon"].as_f64().unwrap());
        let covering: Vec<(i32, i32)> = p["covering"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| (c[0].as_i64().unwrap() as i32, c[1].as_i64().unwrap() as i32))
            .collect();
        let c = Grid::new(deg).unwrap().cell_of(lat, lon);
        assert!(
            covering.contains(&(c.i, c.j)),
            "deg {deg} ({lat}, {lon}): ours ({}, {}), oracle {covering:?}",
            c.i,
            c.j
        );
        if p["strict"].as_bool().unwrap() {
            assert_eq!(covering.len(), 1);
            strict += 1;
        } else {
            edge += 1;
        }
    }
    assert!(strict > 1000 && edge >= 30, "{strict} {edge}");
}

fn route_text(route: &Value) -> String {
    route
        .as_array()
        .unwrap()
        .iter()
        .map(|p| format!("{},{}", p[0], p[1]))
        .collect::<Vec<_>>()
        .join("\n")
}

#[test]
fn route_exposure_geometry_agrees_with_shapely_and_geographiclib() {
    let fx = fixture(include_str!(
        "fixtures/interference_map_ref/route_exposure.json"
    ));
    let ds = sources::custom(
        sources::Kind::Adsb,
        "CC0-1.0",
        "https://example.invalid/l",
        "synthetic",
    );
    for case in fx["cases"].as_array().unwrap() {
        let name = case["name"].as_str().unwrap();
        let deg = case["deg"].as_f64().unwrap();
        let grid = Grid::new(deg).unwrap();
        let cells: Vec<CellOut> = case["cells"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| {
                let st = c[2].as_str().unwrap();
                CellOut {
                    id: CellId {
                        i: c[0].as_i64().unwrap() as i32,
                        j: c[1].as_i64().unwrap() as i32,
                    },
                    status: st.into(),
                    degraded: st == "degraded",
                    props: Map::new(),
                }
            })
            .collect();
        let day = DayOut {
            source_kind: "adsb",
            date: "2026-03-01".into(),
            cells,
            day_meta: Map::new(),
        };
        let map = load_map(&to_geojson(&day, &grid, json!({}), &ds).to_string()).unwrap();
        let pts = parse_route(&route_text(&case["route"])).unwrap();
        let e = exposure(&pts, &map);

        let o = &case["oracle"];
        let total = o["route_m"].as_f64().unwrap();
        let ours_total = e.route_km * 1000.0;
        assert!(
            (ours_total - total).abs() <= ROUTE_REL_TOL * total,
            "{name}: route length ours {ours_total} m, oracle {total} m"
        );
        let tol = ROUTE_REL_TOL * total + ROUTE_PIECE_TOL_M * o["pieces"].as_f64().unwrap();
        for (key, share) in [
            ("degraded", e.share_degraded),
            ("not_degraded", e.share_not_degraded),
            ("insufficient_sample", e.share_unassessed),
            ("not_observed", e.share_not_observed),
        ] {
            let want = o["class_m"][key].as_f64().unwrap();
            let got = share * ours_total;
            assert!(
                (got - want).abs() <= tol,
                "{name} {key}: ours {got} m, oracle {want} m, tolerance {tol} m"
            );
        }
    }
}

#[test]
fn land_masking_agrees_with_shapely_and_pyproj() {
    let fx = fixture(include_str!("fixtures/interference_map_ref/land_mask.json"));
    assert_eq!(fx["buffer_m"].as_f64().unwrap(), LAND_BUFFER_M);
    let mut mask = LandMask::from_geojson_str(&fx["polygons"].to_string(), LAND_BUFFER_M).unwrap();
    let pts = fx["points"].as_array().unwrap();
    let (mut inland, mut outside, mut in_lake_or_buffer) = (0, 0, 0);
    for p in pts {
        let (lat, lon) = (p["lat"].as_f64().unwrap(), p["lon"].as_f64().unwrap());
        let want = p["inland"].as_bool().unwrap();
        assert_eq!(
            mask.is_inland(lat, lon),
            want,
            "{} ({lat}, {lon}): oracle inside {} at {} m from the coast",
            p["polygon"],
            p["inside"],
            p["boundary_distance_m"]
        );
        if want {
            inland += 1;
        } else if p["inside"].as_bool().unwrap() {
            in_lake_or_buffer += 1;
        } else {
            outside += 1;
        }
    }
    // The fixture must exercise all three outcomes, and the ambiguity band must stay small.
    assert!(
        inland > 100 && outside > 100 && in_lake_or_buffer > 20,
        "{inland} {outside} {in_lake_or_buffer}"
    );
    assert!(fx["points_excluded_in_band"].as_u64().unwrap() < (pts.len() / 20) as u64);
}
