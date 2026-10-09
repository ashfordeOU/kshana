// SPDX-License-Identifier: AGPL-3.0-only
//! Land polygons for the AIS on-land detector, read from a user-supplied GeoJSON file
//! (Polygon and MultiPolygon, in any Feature, FeatureCollection or bare geometry).
//! The intended file is Natural Earth's land layer (public domain); Kshana does not
//! bundle it. A position counts as on land only when it lies more than a buffer inland,
//! because a 1:10 million coastline is only accurate to the order of a kilometre.

use std::collections::HashMap;

use serde_json::Value;

use super::grid::EARTH_RADIUS_M;
use super::MapError;

/// One polygon: exterior ring then holes, as `(lon, lat)` vertices.
struct Poly {
    rings: Vec<Vec<(f64, f64)>>,
    bbox: (f64, f64, f64, f64), // min lon, min lat, max lon, max lat
}

pub struct LandMask {
    polys: Vec<Poly>,
    buffer_m: f64,
    /// Classification cache on a 0.005 degree (about 550 m) lattice, evaluated at the
    /// lattice-point centre. The resolution is finer than the coastline's accuracy.
    cache: HashMap<(i32, i32), bool>,
}

const CACHE_DEG: f64 = 0.005;

fn parse_ring(v: &Value) -> Option<Vec<(f64, f64)>> {
    let pts = v.as_array()?;
    let ring: Vec<(f64, f64)> = pts
        .iter()
        .filter_map(|p| {
            let a = p.as_array()?;
            Some((a.first()?.as_f64()?, a.get(1)?.as_f64()?))
        })
        .collect();
    (ring.len() >= 4).then_some(ring)
}

fn collect_polys(v: &Value, out: &mut Vec<Poly>) {
    match v.get("type").and_then(Value::as_str) {
        Some("FeatureCollection") => {
            for f in v
                .get("features")
                .and_then(Value::as_array)
                .into_iter()
                .flatten()
            {
                collect_polys(f, out);
            }
        }
        Some("Feature") => {
            if let Some(g) = v.get("geometry") {
                collect_polys(g, out);
            }
        }
        Some("GeometryCollection") => {
            for g in v
                .get("geometries")
                .and_then(Value::as_array)
                .into_iter()
                .flatten()
            {
                collect_polys(g, out);
            }
        }
        Some("Polygon") => {
            if let Some(c) = v.get("coordinates") {
                push_poly(c, out);
            }
        }
        Some("MultiPolygon") => {
            for c in v
                .get("coordinates")
                .and_then(Value::as_array)
                .into_iter()
                .flatten()
            {
                push_poly(c, out);
            }
        }
        _ => {}
    }
}

fn push_poly(coords: &Value, out: &mut Vec<Poly>) {
    let rings: Vec<Vec<(f64, f64)>> = coords
        .as_array()
        .into_iter()
        .flatten()
        .filter_map(parse_ring)
        .collect();
    let Some(ext) = rings.first() else { return };
    let mut bbox = (f64::MAX, f64::MAX, f64::MIN, f64::MIN);
    for &(x, y) in ext {
        bbox = (bbox.0.min(x), bbox.1.min(y), bbox.2.max(x), bbox.3.max(y));
    }
    out.push(Poly { rings, bbox });
}

/// Even-odd containment over all rings of a polygon (so holes are excluded).
fn contains(p: &Poly, lon: f64, lat: f64) -> bool {
    let mut inside = false;
    for ring in &p.rings {
        let mut j = ring.len() - 1;
        for i in 0..ring.len() {
            let (xi, yi) = ring[i];
            let (xj, yj) = ring[j];
            if (yi > lat) != (yj > lat) && lon < (xj - xi) * (lat - yi) / (yj - yi) + xi {
                inside = !inside;
            }
            j = i;
        }
    }
    inside
}

/// Distance in metres from a point to a segment, on a local equirectangular plane.
fn seg_dist_m(lon: f64, lat: f64, a: (f64, f64), b: (f64, f64)) -> f64 {
    let k = lat.to_radians().cos();
    let m = EARTH_RADIUS_M * std::f64::consts::PI / 180.0;
    let (px, py) = (0.0, 0.0);
    let (ax, ay) = ((a.0 - lon) * k * m, (a.1 - lat) * m);
    let (bx, by) = ((b.0 - lon) * k * m, (b.1 - lat) * m);
    let (dx, dy) = (bx - ax, by - ay);
    let len2 = dx * dx + dy * dy;
    let t = if len2 > 0.0 {
        (((px - ax) * dx + (py - ay) * dy) / len2).clamp(0.0, 1.0)
    } else {
        0.0
    };
    let (cx, cy) = (ax + t * dx, ay + t * dy);
    (cx * cx + cy * cy).sqrt()
}

impl LandMask {
    pub fn from_geojson_str(text: &str, buffer_m: f64) -> Result<Self, MapError> {
        let v: Value = serde_json::from_str(text)
            .map_err(|e| MapError::Format(format!("land polygons: invalid JSON: {e}")))?;
        let mut polys = Vec::new();
        collect_polys(&v, &mut polys);
        if polys.is_empty() {
            return Err(MapError::Format(
                "land polygons: no Polygon or MultiPolygon found".into(),
            ));
        }
        Ok(Self {
            polys,
            buffer_m: buffer_m.max(0.0),
            cache: HashMap::new(),
        })
    }

    pub fn polygon_count(&self) -> usize {
        self.polys.len()
    }

    fn deg_margin(&self, lat: f64) -> (f64, f64) {
        let dlat = self.buffer_m / EARTH_RADIUS_M * 180.0 / std::f64::consts::PI;
        (dlat / lat.to_radians().cos().abs().max(0.05), dlat)
    }

    /// True when the point is inside a land polygon and at least the buffer distance from
    /// every coastline edge.
    pub fn is_inland(&mut self, lat: f64, lon: f64) -> bool {
        let key = (
            (lat / CACHE_DEG).floor() as i32,
            (lon / CACHE_DEG).floor() as i32,
        );
        if let Some(&v) = self.cache.get(&key) {
            return v;
        }
        let (clat, clon) = (
            (key.0 as f64 + 0.5) * CACHE_DEG,
            (key.1 as f64 + 0.5) * CACHE_DEG,
        );
        let v = self.eval(clat, clon);
        self.cache.insert(key, v);
        v
    }

    fn eval(&self, lat: f64, lon: f64) -> bool {
        let (dlon, dlat) = self.deg_margin(lat);
        let mut inside_any = false;
        for p in &self.polys {
            // Skip polygons whose box, grown by the buffer, cannot contain the point.
            if lon < p.bbox.0 - dlon
                || lon > p.bbox.2 + dlon
                || lat < p.bbox.1 - dlat
                || lat > p.bbox.3 + dlat
            {
                continue;
            }
            if contains(p, lon, lat) {
                inside_any = true;
            }
            if self.buffer_m > 0.0 {
                for ring in &p.rings {
                    for w in ring.windows(2) {
                        if seg_dist_m(lon, lat, w[0], w[1]) < self.buffer_m {
                            return false;
                        }
                    }
                }
            }
        }
        inside_any
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Synthetic island: a 1 x 1 degree square with a 0.2 degree square lake in the middle.
    const ISLAND: &str = r#"{"type":"FeatureCollection","features":[{"type":"Feature","properties":{},
      "geometry":{"type":"Polygon","coordinates":[
        [[10,50],[11,50],[11,51],[10,51],[10,50]],
        [[10.4,50.4],[10.6,50.4],[10.6,50.6],[10.4,50.6],[10.4,50.4]]]}}]}"#;

    #[test]
    fn inland_outside_lake_and_buffer() {
        let mut m = LandMask::from_geojson_str(ISLAND, 2000.0).unwrap();
        assert_eq!(m.polygon_count(), 1);
        assert!(m.is_inland(50.2, 10.2), "well inside the island");
        assert!(!m.is_inland(49.5, 10.5), "open water");
        assert!(!m.is_inland(50.5, 10.5), "inside the lake hole");
        assert!(
            !m.is_inland(50.5, 10.0015),
            "within the 2 km buffer of the coast"
        );
        assert!(m.is_inland(50.5, 10.05), "about 3.5 km inland");
    }

    #[test]
    fn zero_buffer_is_plain_containment() {
        let mut m = LandMask::from_geojson_str(ISLAND, 0.0).unwrap();
        assert!(m.is_inland(50.5, 10.0151));
    }

    #[test]
    fn multipolygon_and_bad_input() {
        let mp = r#"{"type":"MultiPolygon","coordinates":[[[[0,0],[1,0],[1,1],[0,1],[0,0]]],[[[5,5],[6,5],[6,6],[5,6],[5,5]]]]}"#;
        let mut m = LandMask::from_geojson_str(mp, 0.0).unwrap();
        assert_eq!(m.polygon_count(), 2);
        assert!(m.is_inland(5.5, 5.5) && !m.is_inland(3.0, 3.0));
        assert!(LandMask::from_geojson_str("{}", 0.0).is_err());
        assert!(LandMask::from_geojson_str("nope", 0.0).is_err());
    }
}
