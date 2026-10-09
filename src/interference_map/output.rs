// SPDX-License-Identifier: AGPL-3.0-only
//! GeoJSON output: one file per source per UTC day, method metadata and attribution embedded.
//!
//! ADS-B and AIS results are never combined in one file: each carries its own licence.

use serde_json::{json, Map, Value};

use super::grid::{CellId, Grid};
use super::sources::Dataset;

pub const SCHEMA: &str = "kshana-interference-map/v1";
/// Integer form of the schema version. A change that removes or renames a field, or changes
/// the meaning of one, raises it; adding a field does not.
pub const FORMAT_VERSION: u32 = 1;

pub struct CellOut {
    pub id: CellId,
    /// One of `degraded`, `not_degraded`, `insufficient_sample`, `withheld_day_confounded`
    /// (ADS-B) or `anomalous`, `not_anomalous` (AIS).
    pub status: String,
    pub degraded: bool,
    pub props: Map<String, Value>,
}

pub struct DayOut {
    pub source_kind: &'static str,
    pub date: String,
    pub cells: Vec<CellOut>,
    pub day_meta: Map<String, Value>,
}

/// Build the GeoJSON document for one day.
pub fn to_geojson(day: &DayOut, grid: &Grid, method: Value, dataset: &Dataset) -> Value {
    let features: Vec<Value> = day
        .cells
        .iter()
        .map(|c| {
            let (s, w, n, e) = grid.bounds(c.id);
            let mut props = c.props.clone();
            props.insert("cell_i".into(), json!(c.id.i));
            props.insert("cell_j".into(), json!(c.id.j));
            props.insert("status".into(), json!(c.status));
            props.insert("degraded".into(), json!(c.degraded));
            json!({
                "type": "Feature",
                "properties": props,
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [[[w, s], [e, s], [e, n], [w, n], [w, s]]],
                },
            })
        })
        .collect();
    json!({
        "type": "FeatureCollection",
        "kshana_interference_map": {
            "schema": SCHEMA,
            "format_version": FORMAT_VERSION,
            "source_kind": day.source_kind,
            "date": day.date,
            "grid": { "type": "fixed_lat_lon", "cell_deg": grid.cell_deg },
            "method": method,
            "day": day.day_meta,
            "data": dataset.to_json(),
            "kshana_version": env!("CARGO_PKG_VERSION"),
            "notice": "Aggregate only: no aircraft or vessel identifiers appear in this file. Cells with fewer than the minimum number of distinct aircraft or vessels are omitted. A missing cell was not observed and is not evidence of a clear cell.",
        },
        "features": features,
    })
}

/// File name for a day's output: `<source>-<date>.geojson`.
pub fn file_name(day: &DayOut) -> String {
    format!("{}-{}.geojson", day.source_kind, day.date)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::interference_map::sources;

    #[test]
    fn document_embeds_attribution_licence_and_method() {
        let mut props = Map::new();
        props.insert("aircraft_observed".into(), json!(7));
        let day = DayOut {
            source_kind: "adsb",
            date: "2026-03-01".into(),
            cells: vec![CellOut {
                id: CellId { i: 280, j: 400 },
                status: "degraded".into(),
                degraded: true,
                props,
            }],
            day_meta: Map::new(),
        };
        let ds = sources::preset(sources::ADSB_LOL).unwrap();
        let v = to_geojson(&day, &Grid::new(0.5).unwrap(), json!({"id": "m"}), &ds);
        let m = &v["kshana_interference_map"];
        assert_eq!(m["schema"], "kshana-interference-map/v1");
        assert_eq!(m["format_version"], 1);
        assert_eq!(m["data"]["licence"], "ODbL-1.0");
        assert!(m["data"]["attribution"]
            .as_str()
            .unwrap()
            .contains("adsb.lol"));
        assert_eq!(m["method"]["id"], "m");
        assert_eq!(v["features"][0]["properties"]["cell_i"], 280);
        assert_eq!(
            v["features"][0]["geometry"]["coordinates"][0]
                .as_array()
                .unwrap()
                .len(),
            5
        );
        assert_eq!(file_name(&day), "adsb-2026-03-01.geojson");
    }
}
