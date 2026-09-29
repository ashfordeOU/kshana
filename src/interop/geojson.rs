// SPDX-License-Identifier: AGPL-3.0-only
//! **GeoJSON writer and route reader** — Internet Engineering Task Force (IETF)
//! RFC 7946 (<https://www.rfc-editor.org/rfc/rfc7946>).
//!
//! ## Writing
//!
//! One `FeatureCollection`. Positions are `[longitude, latitude]` or
//! `[longitude, latitude, height]`: WGS 84 decimal degrees, longitude first (RFC 7946
//! §3.1.1 and §4), height in metres above the WGS 84 ellipsoid.
//!
//! * A moving object is a `LineString` of its Earth-fixed samples, or a
//!   `MultiLineString` cut at the antimeridian (§3.1.9); its `times_utc` property lists
//!   the ISO 8601 UTC time of every position in order.
//! * A fixed site is a `Point`; a jammer footprint a `Polygon` whose exterior ring is
//!   closed and counter-clockwise (§3.1.6); an untimed track a `LineString`.
//! * Every feature's `properties` carries `role`, `description` and a `units` object
//!   naming the unit of each numeric member.
//!
//! ## Reading a route
//!
//! [`parse_route`] reads a `LineString` (bare, in a `Feature`, or the first line feature
//! of a `FeatureCollection`) and [`apply_route`] writes it into the straight-track
//! inputs of `terrain-nav`, `terrain-slam`, `gravity-map` and `combined-altpnt`:
//! `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg`, `waypoints`. Those
//! kinds fly `start + i·step`, so a route is accepted when it is exactly that: two
//! positions (start and end, with the waypoint count taken from the scenario), or
//! three or more evenly spaced along a straight line in latitude and longitude. Any
//! other route is refused with the largest deviation named, rather than bent into a
//! line the user did not draw.

use super::round_dp;
use super::scene::Scene;
use serde_json::{json, Value};

fn units_moving() -> Value {
    json!({
        "coordinates": "deg (longitude), deg (latitude), m (height above the WGS 84 ellipsoid)",
        "times_utc": "ISO 8601 UTC, one per position",
    })
}

/// Split a sequence of `[lon, lat, h]` at every antimeridian crossing, interpolating
/// the crossing latitude and height, so no segment spans more than 180 degrees of
/// longitude (RFC 7946 §3.1.9).
pub fn split_antimeridian(pts: &[[f64; 3]]) -> Vec<Vec<[f64; 3]>> {
    let mut parts: Vec<Vec<[f64; 3]>> = vec![Vec::new()];
    for (i, p) in pts.iter().enumerate() {
        if i > 0 {
            let q = pts[i - 1];
            let d = p[0] - q[0];
            if d.abs() > 180.0 {
                // Unwrap p next to q, find where the unwrapped segment meets ±180.
                let p_un = if d > 0.0 { p[0] - 360.0 } else { p[0] + 360.0 };
                let edge = if d > 0.0 { -180.0 } else { 180.0 };
                let f = (edge - q[0]) / (p_un - q[0]);
                let lat = round_dp(q[1] + f * (p[1] - q[1]), 9);
                let h = round_dp(q[2] + f * (p[2] - q[2]), 4);
                if let Some(last) = parts.last_mut() {
                    last.push([edge, lat, h]);
                }
                parts.push(vec![[-edge, lat, h]]);
            }
        }
        if let Some(last) = parts.last_mut() {
            last.push(*p);
        }
    }
    parts.retain(|p| p.len() >= 2);
    parts
}

fn pos3(lon: f64, lat: f64, h: f64) -> Value {
    json!([round_dp(lon, 9), round_dp(lat, 9), round_dp(h, 4)])
}

/// Render a scene as an RFC 7946 FeatureCollection.
pub fn write(scene: &Scene) -> String {
    let mut feats: Vec<Value> = Vec::new();
    if let Some(e) = scene.epoch {
        for m in &scene.movers {
            let pts: Vec<[f64; 3]> = (0..scene.times_s.len())
                .map(|i| {
                    let (lat, lon, h) = m.geodetic(i);
                    [round_dp(lon, 9), round_dp(lat, 9), round_dp(h, 4)]
                })
                .collect();
            let parts = split_antimeridian(&pts);
            let geometry = match parts.len() {
                // A single sample (zero duration) is a point, not a line.
                0 => match pts.first() {
                    Some(p) => json!({ "type": "Point", "coordinates": p }),
                    None => continue,
                },
                1 => json!({ "type": "LineString", "coordinates": parts[0] }),
                _ => json!({ "type": "MultiLineString", "coordinates": parts }),
            };
            let times: Vec<String> = scene.times_s.iter().map(|&t| e.iso(t)).collect();
            feats.push(json!({
                "type": "Feature",
                "id": format!("{}/{}", m.role.as_str(), m.id),
                "geometry": geometry,
                "properties": {
                    "name": m.id,
                    "role": m.role.as_str(),
                    "description": format!("{}. Earth-fixed positions; a MultiLineString is cut at the antimeridian, and times_utc then lists the original samples only.", m.description),
                    "times_utc": times,
                    "units": units_moving(),
                },
            }));
        }
    }
    for s in &scene.sites {
        feats.push(json!({
            "type": "Feature",
            "id": format!("site/{}", s.id),
            "geometry": { "type": "Point", "coordinates": pos3(s.lon_deg, s.lat_deg, s.h_m) },
            "properties": {
                "name": s.id,
                "role": s.role.as_str(),
                "description": s.description,
                "units": { "coordinates": "deg (longitude), deg (latitude), m (height above the WGS 84 ellipsoid)" },
            },
        }));
    }
    for f in &scene.footprints {
        let ring: Vec<Value> = f
            .ring
            .iter()
            .map(|p| json!([round_dp(p[1], 9), round_dp(p[0], 9)]))
            .collect();
        feats.push(json!({
            "type": "Feature",
            "id": f.id,
            "geometry": { "type": "Polygon", "coordinates": [ring] },
            "properties": {
                "name": f.id,
                "role": "jammer-footprint",
                "description": f.description,
                "radius_m": f.radius_m,
                "centre": [round_dp(f.centre_lon_deg, 9), round_dp(f.centre_lat_deg, 9)],
                "units": {
                    "coordinates": "deg (longitude), deg (latitude)",
                    "radius_m": "m, along the ground",
                    "centre": "deg (longitude), deg (latitude)",
                },
            },
        }));
    }
    for r in &scene.routes {
        let pts: Vec<Value> = r
            .points
            .iter()
            .map(|p| json!([round_dp(p[1], 9), round_dp(p[0], 9)]))
            .collect();
        feats.push(json!({
            "type": "Feature",
            "id": format!("route/{}", r.id),
            "geometry": { "type": "LineString", "coordinates": pts },
            "properties": {
                "name": r.id,
                "role": "track",
                "description": format!("{} (untimed)", r.description),
                "waypoints": r.points.len(),
                "units": { "coordinates": "deg (longitude), deg (latitude)", "waypoints": "count" },
            },
        }));
    }
    let fc = json!({
        "type": "FeatureCollection",
        "name": scene.title(),
        "description": format!("Kshana {} export. Epoch: {}.", env!("CARGO_PKG_VERSION"), scene.epoch_note),
        "features": feats,
    });
    let lines: Vec<String> = match fc.get("features").and_then(|f| f.as_array()) {
        Some(fs) => fs
            .iter()
            .map(|f| serde_json::to_string(f).unwrap_or_default())
            .collect(),
        None => Vec::new(),
    };
    // One feature per line, header members first.
    format!(
        "{{\"type\":\"FeatureCollection\",\"name\":{},\"description\":{},\"features\":[\n{}\n]}}\n",
        serde_json::to_string(&fc["name"]).unwrap_or_default(),
        serde_json::to_string(&fc["description"]).unwrap_or_default(),
        lines.join(",\n")
    )
}

/// A route read from GeoJSON: `[latitude, longitude]` positions in order.
#[derive(Clone, Debug, PartialEq)]
pub struct RouteIn {
    /// Positions, `[latitude, longitude]` in degrees.
    pub points: Vec<[f64; 2]>,
}

fn line_of(v: &Value) -> Option<&Value> {
    match v.get("type")?.as_str()? {
        "LineString" => Some(v),
        "Feature" => v.get("geometry").and_then(line_of),
        "FeatureCollection" => v.get("features")?.as_array()?.iter().find_map(line_of),
        _ => None,
    }
}

/// Read the first `LineString` of a GeoJSON document, checking RFC 7946's position
/// rules: longitude first, longitude in [-180, 180], latitude in [-90, 90].
pub fn parse_route(text: &str) -> Result<RouteIn, String> {
    let v: Value = serde_json::from_str(text).map_err(|e| format!("invalid GeoJSON: {e}"))?;
    let line = line_of(&v).ok_or(
        "no LineString found: give a LineString geometry, a Feature holding one, or a \
         FeatureCollection whose features include one",
    )?;
    let coords = line
        .get("coordinates")
        .and_then(|c| c.as_array())
        .ok_or("LineString has no coordinates array")?;
    if coords.len() < 2 {
        return Err("an RFC 7946 LineString needs two or more positions".into());
    }
    let mut points = Vec::with_capacity(coords.len());
    for (i, c) in coords.iter().enumerate() {
        let a = c.as_array().filter(|a| a.len() >= 2).ok_or(format!(
            "position {i} is not an array of two or three numbers"
        ))?;
        let lon = a[0]
            .as_f64()
            .ok_or(format!("position {i}: longitude is not a number"))?;
        let lat = a[1]
            .as_f64()
            .ok_or(format!("position {i}: latitude is not a number"))?;
        if !(-180.0..=180.0).contains(&lon) {
            return Err(format!(
                "position {i}: longitude {lon} is outside [-180, 180] (GeoJSON puts longitude first)"
            ));
        }
        if !(-90.0..=90.0).contains(&lat) {
            return Err(format!(
                "position {i}: latitude {lat} is outside [-90, 90] (GeoJSON puts longitude first)"
            ));
        }
        points.push([lat, lon]);
    }
    Ok(RouteIn { points })
}

/// The straight-track parameters a route stands for:
/// `(start_lat, start_lon, step_lat, step_lon, waypoints)`. `default_waypoints` is used
/// when the route gives only its two ends. `tol_deg` bounds how far an intermediate
/// position may sit from `start + i·step`.
pub fn route_to_track(
    r: &RouteIn,
    default_waypoints: usize,
    tol_deg: f64,
) -> Result<(f64, f64, f64, f64, usize), String> {
    let p = &r.points;
    let first = p[0];
    let last = p[p.len() - 1];
    let n = if p.len() == 2 {
        default_waypoints
    } else {
        p.len()
    };
    if n < 2 {
        return Err("a track needs two or more waypoints".into());
    }
    let dlat = (last[0] - first[0]) / (n - 1) as f64;
    let dlon = (last[1] - first[1]) / (n - 1) as f64;
    if dlon.abs() * (n - 1) as f64 > 180.0 {
        return Err("the route spans more than 180 degrees of longitude; the track kinds step in plain degrees and cannot cross the antimeridian".into());
    }
    if p.len() > 2 {
        let mut worst = (0usize, 0.0f64);
        for (i, q) in p.iter().enumerate() {
            let e = ((q[0] - (first[0] + dlat * i as f64)).powi(2)
                + (q[1] - (first[1] + dlon * i as f64)).powi(2))
            .sqrt();
            if e > worst.1 {
                worst = (i, e);
            }
        }
        if worst.1 > tol_deg {
            return Err(format!(
                "position {} is {:.6} deg from an evenly spaced straight track (tolerance {} deg); \
                 the track kinds fly start + i*step, so give evenly spaced positions on a line, or \
                 only the two ends",
                worst.0, worst.1, tol_deg
            ));
        }
    }
    Ok((first[0], first[1], dlat, dlon, n))
}

/// Tolerance, in degrees, for an intermediate route position (about 1 cm on the ground).
pub const ROUTE_TOLERANCE_DEG: f64 = 1e-7;

/// Write a GeoJSON route into a straight-track scenario, returning the new TOML. The
/// kinds that fly a track are `terrain-nav`, `terrain-slam`, `gravity-map` and
/// `combined-altpnt`; any other kind is refused with the reason.
pub fn apply_route(src: &str, geojson: &str) -> Result<String, String> {
    use crate::api::ScenarioKind as K;
    let kind = K::classify(src).map_err(|e| e.to_string())?;
    match kind {
        K::Terrain | K::TerrainSlam | K::GravityMap | K::CombinedAltPnt => {}
        k => {
            return Err(format!(
            "a route applies to the kinds that fly a waypoint track (terrain-nav, terrain-slam, \
                 gravity-map, combined-altpnt); `{}` takes no trajectory input",
            k.as_str()
        ))
        }
    }
    let route = parse_route(geojson)?;
    let mut value: toml::Value =
        toml::from_str(src).map_err(|e| format!("invalid scenario TOML: {e}"))?;
    let default_n = value
        .get("waypoints")
        .and_then(|w| w.as_integer())
        .filter(|&n| n >= 2)
        .map(|n| n as usize)
        .ok_or(
            "the scenario has no `waypoints` of 2 or more to spread a two-position route over",
        )?;
    let (la, lo, dla, dlo, n) = route_to_track(&route, default_n, ROUTE_TOLERANCE_DEG)?;
    let t = value.as_table_mut().ok_or("scenario TOML is not a table")?;
    t.insert("start_lat_deg".into(), toml::Value::Float(la));
    t.insert("start_lon_deg".into(), toml::Value::Float(lo));
    t.insert("step_lat_deg".into(), toml::Value::Float(dla));
    t.insert("step_lon_deg".into(), toml::Value::Float(dlo));
    t.insert("waypoints".into(), toml::Value::Integer(n as i64));
    toml::to_string(&value).map_err(|e| format!("cannot serialise scenario: {e}"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn antimeridian_split_interpolates_the_crossing() {
        let parts = split_antimeridian(&[[170.0, 0.0, 0.0], [-170.0, 10.0, 100.0]]);
        assert_eq!(parts.len(), 2);
        assert_eq!(parts[0][1], [180.0, 5.0, 50.0]);
        assert_eq!(parts[1][0], [-180.0, 5.0, 50.0]);
    }

    #[test]
    fn a_bent_route_is_refused_and_a_straight_one_accepted() {
        let straight = RouteIn {
            points: vec![[10.0, 20.0], [10.5, 20.25], [11.0, 20.5]],
        };
        let (la, lo, dla, dlo, n) = route_to_track(&straight, 9, ROUTE_TOLERANCE_DEG).unwrap();
        assert_eq!((la, lo, dla, dlo, n), (10.0, 20.0, 0.5, 0.25, 3));
        let bent = RouteIn {
            points: vec![[10.0, 20.0], [10.6, 20.25], [11.0, 20.5]],
        };
        assert!(route_to_track(&bent, 9, ROUTE_TOLERANCE_DEG).is_err());
        let ends = RouteIn {
            points: vec![[10.0, 20.0], [11.0, 21.0]],
        };
        let (_, _, dla, dlo, n) = route_to_track(&ends, 11, ROUTE_TOLERANCE_DEG).unwrap();
        assert_eq!((dla, dlo, n), (0.1, 0.1, 11));
    }

    #[test]
    fn latitude_first_input_is_caught_by_range() {
        let e =
            parse_route(r#"{"type":"LineString","coordinates":[[10,95],[11,96]]}"#).unwrap_err();
        assert!(e.contains("latitude"), "{e}");
    }
}
