// SPDX-License-Identifier: AGPL-3.0-only
//! Route exposure: the share of a planned route's length that passes through degraded
//! cells of an interference map, per day.
//!
//! The route is a polyline of waypoints joined by straight lines in latitude and longitude
//! (densify long legs); its length is split into short pieces and each piece is assigned
//! to the cell containing its midpoint. The result is a statement about where a map says
//! accuracy was degraded on a past day, not a forecast and not a measurement of any
//! receiver's performance.

use std::collections::HashMap;

use serde_json::{json, Value};

use super::grid::{haversine_m, Grid};
use super::MapError;

/// A loaded per-day map: cell status by cell index.
pub struct LoadedMap {
    /// UTC date of the map, `YYYY-MM-DD`.
    pub date: String,
    /// `adsb` or `ais`.
    pub source_kind: String,
    /// The map's grid.
    pub grid: Grid,
    /// The data licence named in the map.
    pub licence: String,
    /// The attribution text named in the map.
    pub attribution: String,
    cells: HashMap<(i32, i32), Class>,
}

#[derive(Clone, Copy, PartialEq, Eq, Debug)]
enum Class {
    Degraded,
    NotDegraded,
    Unassessed,
}

/// Read a v1 map document from GeoJSON text.
pub fn load_map(text: &str) -> Result<LoadedMap, MapError> {
    let v: Value = serde_json::from_str(text)
        .map_err(|e| MapError::Format(format!("map is not valid JSON: {e}")))?;
    let m = v.get("kshana_interference_map").ok_or_else(|| {
        MapError::Format(
            "not a Kshana interference map (no `kshana_interference_map` member)".into(),
        )
    })?;
    let s = |k: &str| m.get(k).and_then(Value::as_str).map(str::to_string);
    let date = s("date").ok_or_else(|| MapError::Format("map has no date".into()))?;
    let source_kind = s("source_kind").unwrap_or_default();
    let cell_deg = m
        .pointer("/grid/cell_deg")
        .and_then(Value::as_f64)
        .ok_or_else(|| MapError::Format("map has no grid cell size".into()))?;
    let grid = Grid::new(cell_deg)
        .ok_or_else(|| MapError::Format("map has an invalid grid cell size".into()))?;
    let mut cells = HashMap::new();
    for f in v
        .get("features")
        .and_then(Value::as_array)
        .into_iter()
        .flatten()
    {
        let p = &f["properties"];
        let (Some(i), Some(j)) = (p["cell_i"].as_i64(), p["cell_j"].as_i64()) else {
            continue;
        };
        let class = match p["status"].as_str().unwrap_or("") {
            "degraded" | "anomalous" => Class::Degraded,
            "not_degraded" | "not_anomalous" => Class::NotDegraded,
            _ => Class::Unassessed,
        };
        cells.insert((i as i32, j as i32), class);
    }
    Ok(LoadedMap {
        date,
        source_kind,
        grid,
        licence: m
            .pointer("/data/licence")
            .and_then(Value::as_str)
            .unwrap_or("")
            .into(),
        attribution: m
            .pointer("/data/attribution")
            .and_then(Value::as_str)
            .unwrap_or("")
            .into(),
        cells,
    })
}

/// Route waypoints as `(lat, lon)`: a GeoJSON LineString (bare, in a Feature, or in a
/// FeatureCollection; the first LineString is used), or CSV lines `lat,lon`.
pub fn parse_route(text: &str) -> Result<Vec<(f64, f64)>, MapError> {
    let t = text.trim_start();
    let pts = if t.starts_with('{') {
        let v: Value = serde_json::from_str(t)
            .map_err(|e| MapError::Format(format!("route: invalid JSON: {e}")))?;
        let line =
            find_line(&v).ok_or_else(|| MapError::Format("route: no LineString found".into()))?;
        line.iter()
            .filter_map(|p| Some((p.get(1)?.as_f64()?, p.get(0)?.as_f64()?)))
            .collect::<Vec<_>>()
    } else {
        let mut out = Vec::new();
        for (n, l) in text.lines().enumerate() {
            let l = l.trim();
            if l.is_empty()
                || l.starts_with('#')
                || (n == 0 && l.chars().next().is_some_and(char::is_alphabetic))
            {
                continue;
            }
            let mut it = l.split(',');
            let lat = it.next().and_then(|x| x.trim().parse::<f64>().ok());
            let lon = it.next().and_then(|x| x.trim().parse::<f64>().ok());
            match (lat, lon) {
                (Some(a), Some(b)) => out.push((a, b)),
                _ => {
                    return Err(MapError::Format(format!(
                        "route: line {} is not `lat,lon`",
                        n + 1
                    )))
                }
            }
        }
        out
    };
    if pts.len() < 2 {
        return Err(MapError::Format(
            "route needs at least two waypoints".into(),
        ));
    }
    if pts
        .iter()
        .any(|&(la, lo)| !(-90.0..=90.0).contains(&la) || !(-180.0..=180.0).contains(&lo))
    {
        return Err(MapError::Format("route: waypoint out of range".into()));
    }
    Ok(pts)
}

fn find_line(v: &Value) -> Option<&Vec<Value>> {
    match v.get("type")?.as_str()? {
        "LineString" => v.get("coordinates")?.as_array(),
        "Feature" => find_line(v.get("geometry")?),
        "FeatureCollection" => v.get("features")?.as_array()?.iter().find_map(find_line),
        _ => None,
    }
}

/// Piece length targeted when splitting the route (metres).
pub const STEP_M: f64 = 250.0;

#[derive(Debug, Clone, PartialEq)]
/// Shares of a route's length by cell state, for one map.
pub struct Exposure {
    /// UTC date of the map.
    pub date: String,
    /// `adsb` or `ais`.
    pub source_kind: String,
    /// Route length in kilometres.
    pub route_km: f64,
    /// Share of length in degraded or anomalous cells.
    pub share_degraded: f64,
    /// Share of length in cells observed and not flagged.
    pub share_not_degraded: f64,
    /// Cells present in the map but without a call (too few aircraft or vessels sampled,
    /// or a confounded day).
    pub share_unassessed: f64,
    /// Cells absent from the map: not observed by enough aircraft or vessels.
    pub share_not_observed: f64,
}

/// Split the route into short pieces and total them by the state of the cell each lies in.
pub fn exposure(route: &[(f64, f64)], map: &LoadedMap) -> Exposure {
    let mut tot = 0.0;
    let mut by = [0.0_f64; 4]; // degraded, not degraded, unassessed, not observed
    for w in route.windows(2) {
        let (a, b) = (w[0], w[1]);
        let d = haversine_m(a.0, a.1, b.0, b.1);
        if d <= 0.0 {
            continue;
        }
        let n = (d / STEP_M).ceil().max(1.0) as usize;
        let piece = d / n as f64;
        for k in 0..n {
            let f = (k as f64 + 0.5) / n as f64;
            let (lat, lon) = (a.0 + (b.0 - a.0) * f, a.1 + (b.1 - a.1) * f);
            let c = map.grid.cell_of(lat, lon);
            let idx = match map.cells.get(&(c.i, c.j)) {
                Some(Class::Degraded) => 0,
                Some(Class::NotDegraded) => 1,
                Some(Class::Unassessed) => 2,
                None => 3,
            };
            by[idx] += piece;
            tot += piece;
        }
    }
    let share = |x: f64| if tot > 0.0 { x / tot } else { 0.0 };
    Exposure {
        date: map.date.clone(),
        source_kind: map.source_kind.clone(),
        route_km: tot / 1000.0,
        share_degraded: share(by[0]),
        share_not_degraded: share(by[1]),
        share_unassessed: share(by[2]),
        share_not_observed: share(by[3]),
    }
}

fn r4(x: f64) -> f64 {
    (x * 1e4).round() / 1e4
}

/// The `kshana-route-exposure/v1` report for the given rows.
pub fn report_json(rows: &[(Exposure, &LoadedMap)], from: Option<&str>, to: Option<&str>) -> Value {
    json!({
        "kshana_route_exposure": {
            "schema": "kshana-route-exposure/v1",
            "date_range": { "from": from, "to": to },
            "kshana_version": env!("CARGO_PKG_VERSION"),
            "caveats": [
                "Exposure is the share of route length inside cells that the map marks degraded or anomalous on that past day. It is not a forecast and not a measurement of any receiver.",
                "A degraded cell does not identify interference as the cause; see the method notes in the map file.",
                "Cells missing from the map were not observed by enough aircraft or vessels: that is not evidence of a clear route. Read the not-observed and unassessed shares with the degraded share.",
                "ADS-B and AIS maps describe different altitudes and surfaces and are reported separately, never combined.",
                "Waypoints are joined by straight lines in latitude and longitude; densify long legs.",
            ],
            "rows": rows.iter().map(|(e, m)| json!({
                "date": e.date,
                "source_kind": e.source_kind,
                "route_km": r4(e.route_km),
                "share_degraded": r4(e.share_degraded),
                "share_not_degraded": r4(e.share_not_degraded),
                "share_unassessed": r4(e.share_unassessed),
                "share_not_observed": r4(e.share_not_observed),
                "map_licence": m.licence,
                "map_attribution": m.attribution,
            })).collect::<Vec<_>>(),
        }
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::interference_map::grid::CellId;
    use crate::interference_map::{
        adsb::{self, AdsbParams},
        output::{self, CellOut, DayOut},
        sources,
    };
    use serde_json::Map;

    fn map_with(grid: &Grid, cells: &[(CellId, &str, bool)]) -> LoadedMap {
        let day = DayOut {
            source_kind: "adsb",
            date: "2026-03-01".into(),
            cells: cells
                .iter()
                .map(|(id, st, d)| CellOut {
                    id: *id,
                    status: (*st).into(),
                    degraded: *d,
                    props: Map::new(),
                })
                .collect(),
            day_meta: Map::new(),
        };
        let ds = sources::preset(sources::ADSB_LOL).unwrap();
        let v = output::to_geojson(
            &day,
            grid,
            adsb::method_json(&AdsbParams::PREREGISTERED_V1, &Default::default()),
            &ds,
        );
        load_map(&v.to_string()).unwrap()
    }

    #[test]
    fn route_through_one_degraded_cell_of_three() {
        // A due-east route along 50.25 N from 10.0 E to 11.5 E crosses three 0.5 degree cells.
        let g = Grid::new(0.5).unwrap();
        let c0 = g.cell_of(50.25, 10.25);
        let c1 = g.cell_of(50.25, 10.75);
        let m = map_with(&g, &[(c0, "not_degraded", false), (c1, "degraded", true)]);
        let e = exposure(&[(50.25, 10.0), (50.25, 11.5)], &m);
        assert!((e.share_degraded - 1.0 / 3.0).abs() < 0.01, "{e:?}");
        assert!((e.share_not_degraded - 1.0 / 3.0).abs() < 0.01);
        assert!((e.share_not_observed - 1.0 / 3.0).abs() < 0.01);
        assert!((e.route_km - 107.0).abs() < 2.0, "{}", e.route_km);
        let sum =
            e.share_degraded + e.share_not_degraded + e.share_unassessed + e.share_not_observed;
        assert!((sum - 1.0).abs() < 1e-9);
    }

    #[test]
    fn unassessed_cells_are_their_own_share() {
        let g = Grid::new(0.5).unwrap();
        let c = g.cell_of(50.25, 10.25);
        let m = map_with(&g, &[(c, "insufficient_sample", false)]);
        let e = exposure(&[(50.25, 10.1), (50.25, 10.4)], &m);
        assert_eq!((e.share_unassessed, e.share_degraded), (1.0, 0.0));
    }

    #[test]
    fn route_parsing() {
        let gj = r#"{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},"geometry":{"type":"LineString","coordinates":[[10,50],[11,51]]}}]}"#;
        assert_eq!(parse_route(gj).unwrap(), vec![(50.0, 10.0), (51.0, 11.0)]);
        assert_eq!(
            parse_route("lat,lon\n50,10\n# c\n51,11\n").unwrap().len(),
            2
        );
        assert!(parse_route("50,10\n").is_err());
        assert!(parse_route("50,10\nx,y\n").is_err());
        assert!(parse_route("95,10\n50,10\n").is_err());
        assert!(parse_route(r#"{"type":"Point","coordinates":[1,2]}"#).is_err());
    }

    #[test]
    fn non_map_input_is_refused() {
        assert!(load_map("{}").is_err());
        assert!(load_map("x").is_err());
    }

    #[test]
    fn report_carries_caveats_and_attribution() {
        let g = Grid::new(0.5).unwrap();
        let m = map_with(&g, &[]);
        let e = exposure(&[(50.25, 10.1), (50.25, 10.4)], &m);
        let r = report_json(&[(e, &m)], Some("2026-03-01"), None);
        assert!(
            r["kshana_route_exposure"]["caveats"]
                .as_array()
                .unwrap()
                .len()
                >= 4
        );
        assert_eq!(
            r["kshana_route_exposure"]["rows"][0]["map_licence"],
            "ODbL-1.0"
        );
        assert!(r["kshana_route_exposure"]["rows"][0]["map_attribution"]
            .as_str()
            .unwrap()
            .contains("adsb.lol"));
    }
}
