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

/// One coastline edge, tagged with the polygon it belongs to (holes belong to their polygon).
struct Edge {
    x0: f64,
    y0: f64,
    x1: f64,
    y1: f64,
    poly: u32,
}

/// Polygons as rings of `(lon, lat)` vertices: exterior ring first, then holes.
type Polygon = Vec<Vec<(f64, f64)>>;

/// Latitude band height (degrees) of the edge index. Every edge is listed under each band it
/// spans, so a query reads only the edges near its own latitude, not the whole coastline.
const BAND_DEG: f64 = 0.25;

/// Land polygons with an inland buffer, for the on-land detector.
pub struct LandMask {
    edges: Vec<Edge>,
    bands: HashMap<i32, Vec<u32>>,
    polygons: usize,
    buffer_m: f64,
    /// Classification cache on a 0.005 degree (about 550 m) lattice, evaluated at the
    /// lattice-point centre. The resolution is finer than the coastline's accuracy.
    cache: HashMap<(i32, i32), bool>,
}

const CACHE_DEG: f64 = 0.005;

fn band_of(lat: f64) -> i32 {
    (lat / BAND_DEG).floor() as i32
}

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

fn collect_polys(v: &Value, out: &mut Vec<Polygon>) {
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

fn push_poly(coords: &Value, out: &mut Vec<Polygon>) {
    let rings: Polygon = coords
        .as_array()
        .into_iter()
        .flatten()
        .filter_map(parse_ring)
        .collect();
    if !rings.is_empty() {
        out.push(rings);
    }
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
    /// Read Polygon or MultiPolygon GeoJSON text; positions count as inland only beyond `buffer_m` metres from the coast.
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
        let mut edges = Vec::new();
        let mut bands: HashMap<i32, Vec<u32>> = HashMap::new();
        for (pi, rings) in polys.iter().enumerate() {
            for ring in rings {
                for w in ring.windows(2) {
                    let id = edges.len() as u32;
                    let (lo, hi) = (w[0].1.min(w[1].1), w[0].1.max(w[1].1));
                    for b in band_of(lo)..=band_of(hi) {
                        bands.entry(b).or_default().push(id);
                    }
                    edges.push(Edge {
                        x0: w[0].0,
                        y0: w[0].1,
                        x1: w[1].0,
                        y1: w[1].1,
                        poly: pi as u32,
                    });
                }
            }
        }
        Ok(Self {
            edges,
            bands,
            polygons: polys.len(),
            buffer_m: buffer_m.max(0.0),
            cache: HashMap::new(),
        })
    }

    /// Number of polygons read.
    pub fn polygon_count(&self) -> usize {
        self.polygons
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

    /// Classify a point without the cache. Reads only the edges in the latitude bands the
    /// point and its buffer touch.
    fn eval(&self, lat: f64, lon: f64) -> bool {
        if self.buffer_m > 0.0 {
            let (dlon, dlat) = self.deg_margin(lat);
            for b in band_of(lat - dlat)..=band_of(lat + dlat) {
                for &id in self.bands.get(&b).into_iter().flatten() {
                    let e = &self.edges[id as usize];
                    if lon < e.x0.min(e.x1) - dlon || lon > e.x0.max(e.x1) + dlon {
                        continue;
                    }
                    if seg_dist_m(lon, lat, (e.x0, e.y0), (e.x1, e.y1)) < self.buffer_m {
                        return false;
                    }
                }
            }
        }
        // Even-odd containment: a polygon contains the point when a ray to the west crosses
        // an odd number of its edges (holes included). Such edges span the point's latitude,
        // so they are all in its band.
        let mut crossed: Vec<u32> = Vec::new();
        for &id in self.bands.get(&band_of(lat)).into_iter().flatten() {
            let e = &self.edges[id as usize];
            if (e.y0 > lat) != (e.y1 > lat)
                && lon < (e.x1 - e.x0) * (lat - e.y0) / (e.y1 - e.y0) + e.x0
            {
                crossed.push(e.poly);
            }
        }
        crossed.sort_unstable();
        crossed
            .chunk_by(|a, b| a == b)
            .any(|run| run.len() % 2 == 1)
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

    /// The plain algorithm over every ring: the reference for the indexed one.
    fn brute(polys: &[Vec<Vec<(f64, f64)>>], buffer_m: f64, lat: f64, lon: f64) -> bool {
        let mut inside_any = false;
        for rings in polys {
            let mut inside = false;
            for ring in rings {
                for w in ring.windows(2) {
                    let ((xi, yi), (xj, yj)) = (w[1], w[0]);
                    if (yi > lat) != (yj > lat) && lon < (xj - xi) * (lat - yi) / (yj - yi) + xi {
                        inside = !inside;
                    }
                    if buffer_m > 0.0 && seg_dist_m(lon, lat, w[0], w[1]) < buffer_m {
                        return false;
                    }
                }
            }
            inside_any |= inside;
        }
        inside_any
    }

    #[test]
    fn indexed_lookup_agrees_with_the_plain_algorithm_on_a_large_coast() {
        // A 6000-vertex star-shaped island with a ragged coast, plus a second island and a
        // hole, queried on a grid of points that crosses the coast many times.
        let n = 6_000;
        let ring: Vec<(f64, f64)> = (0..=n)
            .map(|k| {
                let th = std::f64::consts::TAU * (k % n) as f64 / n as f64;
                let r = 2.0 + 0.4 * (37.0 * th).sin() + 0.1 * (301.0 * th).sin();
                (10.0 + r * th.cos(), 50.0 + r * th.sin())
            })
            .collect();
        let hole = vec![
            (10.0, 50.0),
            (10.5, 50.0),
            (10.5, 50.5),
            (10.0, 50.5),
            (10.0, 50.0),
        ];
        let isle = vec![
            (14.0, 49.0),
            (14.4, 49.0),
            (14.4, 49.3),
            (14.0, 49.3),
            (14.0, 49.0),
        ];
        let polys = vec![vec![ring, hole], vec![isle]];
        let text = format!(
            r#"{{"type":"MultiPolygon","coordinates":{}}}"#,
            serde_json::to_string(
                &polys
                    .iter()
                    .map(|p| p
                        .iter()
                        .map(|r| r.iter().map(|&(x, y)| [x, y]).collect::<Vec<_>>())
                        .collect::<Vec<_>>())
                    .collect::<Vec<_>>()
            )
            .unwrap()
        );
        for buffer in [0.0, 2000.0] {
            let m = LandMask::from_geojson_str(&text, buffer).unwrap();
            let (mut inland, mut checked) = (0, 0);
            for i in 0..30 {
                for j in 0..30 {
                    let (lat, lon) = (47.0 + i as f64 * 0.14, 7.0 + j as f64 * 0.26);
                    let want = brute(&polys, buffer, lat, lon);
                    assert_eq!(m.eval(lat, lon), want, "({lat}, {lon}) buffer {buffer}");
                    inland += usize::from(want);
                    checked += 1;
                }
            }
            assert!(
                inland > 50 && inland < checked - 50,
                "the grid must cross the coast: {inland}/{checked}"
            );
        }
    }
}
