// SPDX-License-Identifier: AGPL-3.0-only
//! The public functions for callers that hold data in memory: bindings, the MCP server,
//! the browser build. Text or bytes in, v1 GeoJSON or route-exposure JSON out. They touch
//! no file and no network, and apply the same pre-registered methods as the CLI.

use serde_json::Value;

use super::adsb::{self, AdsbAggregator, AdsbParams};
use super::ais::{self, AisAggregator, AisParams};
use super::grid::Grid;
use super::land::LandMask;
use super::output::{file_name, to_geojson};
use super::route;
use super::sources::{self, Dataset, Kind};
use super::time::parse_day;
use super::{IdHasher, MapError};

/// Default grid cell size in degrees.
pub const DEFAULT_CELL_DEG: f64 = 0.5;

/// Decompression limit for one readsb trace file (bytes).
pub const MAX_TRACE_BYTES: u64 = 512 * 1024 * 1024;

/// One day's map: the file name the CLI would use, the UTC date, and the v1 GeoJSON.
#[derive(Debug, Clone, PartialEq)]
pub struct DayMap {
    /// File name the CLI would write: `<source>-<YYYY-MM-DD>.geojson`.
    pub file_name: String,
    /// UTC date of the reports, `YYYY-MM-DD`.
    pub date: String,
    /// The map as a v1 GeoJSON document.
    pub geojson: Value,
}

/// Which licence block a map carries: an approved preset by key (`adsb-lol`,
/// `noaa-marinecadastre`, `kystverket`) or the user's own text.
#[derive(Debug, Clone, PartialEq)]
pub enum DatasetSpec<'a> {
    /// One of the approved dataset keys.
    Preset(&'a str),
    /// A dataset described entirely by the caller.
    Custom {
        /// Licence name, for example `CC0-1.0`.
        licence: &'a str,
        /// Address of the licence text.
        licence_url: &'a str,
        /// Attribution text embedded in every output file.
        attribution: &'a str,
    },
}

/// The approved preset keys.
pub fn preset_dataset_keys() -> [&'static str; 3] {
    sources::preset_keys()
}

/// Resolve a dataset for the given kind, refusing an unknown key or a kind mismatch.
pub fn resolve_dataset(spec: &DatasetSpec, kind: Kind) -> Result<Dataset, MapError> {
    let ds = match spec {
        DatasetSpec::Custom {
            licence,
            licence_url,
            attribution,
        } => {
            if licence.trim().is_empty()
                || licence_url.trim().is_empty()
                || attribution.trim().is_empty()
            {
                return Err(MapError::Format(
                    "a custom dataset needs licence, licence URL and attribution text".into(),
                ));
            }
            sources::custom(kind, licence, licence_url, attribution)
        }
        DatasetSpec::Preset(key) => sources::preset(key).ok_or_else(|| {
            MapError::Format(format!(
                "unknown dataset `{key}`; approved: {}, or a custom dataset",
                sources::preset_keys().join(", ")
            ))
        })?,
    };
    if ds.kind != kind {
        return Err(MapError::Format(format!(
            "dataset `{}` is {} data but the input kind is {}",
            ds.key,
            ds.kind.as_str(),
            kind.as_str()
        )));
    }
    Ok(ds)
}

fn grid(cell_deg: f64) -> Result<Grid, MapError> {
    Grid::new(cell_deg)
        .ok_or_else(|| MapError::Format("cell size must be between 0.01 and 10 degrees".into()))
}

fn day_maps(
    days: Vec<super::output::DayOut>,
    grid: &Grid,
    method: &Value,
    ds: &Dataset,
) -> Vec<DayMap> {
    days.iter()
        .map(|d| DayMap {
            file_name: file_name(d),
            date: d.date.clone(),
            geojson: to_geojson(d, grid, method.clone(), ds),
        })
        .collect()
}

fn adsb_finish(agg: AdsbAggregator, grid: Grid, ds: &Dataset) -> Vec<DayMap> {
    let stats = agg.stats.clone();
    let days = agg.finish();
    day_maps(
        days,
        &grid,
        &adsb::method_json(&AdsbParams::PREREGISTERED_V1, &stats),
        ds,
    )
}

/// ADS-B maps, one per UTC day in the input, from the documented CSV text.
pub fn adsb_maps_from_csv(
    csv: &str,
    dataset: &DatasetSpec,
    cell_deg: f64,
) -> Result<Vec<DayMap>, MapError> {
    let ds = resolve_dataset(dataset, Kind::Adsb)?;
    let g = grid(cell_deg)?;
    let mut agg = AdsbAggregator::new(g, AdsbParams::PREREGISTERED_V1, IdHasher::new());
    agg.read_csv(csv)?;
    Ok(adsb_finish(agg, g, &ds))
}

/// ADS-B maps from readsb history trace files (`trace_full_*.json`, each gzip-compressed or
/// plain JSON), given as one byte slice per file. A file that cannot be read is counted in
/// the map's `input_stats.trace_files_unreadable` and skipped.
pub fn adsb_maps_from_readsb_traces(
    traces: &[&[u8]],
    dataset: &DatasetSpec,
    cell_deg: f64,
) -> Result<Vec<DayMap>, MapError> {
    let ds = resolve_dataset(dataset, Kind::Adsb)?;
    let g = grid(cell_deg)?;
    let mut agg = AdsbAggregator::new(g, AdsbParams::PREREGISTERED_V1, IdHasher::new());
    for t in traces {
        if agg.read_readsb_trace(t, MAX_TRACE_BYTES).is_err() {
            agg.stats.trace_files_unreadable += 1;
        }
    }
    Ok(adsb_finish(agg, g, &ds))
}

/// AIS maps, one per UTC day in the input, from the documented CSV text. `land_geojson` is
/// a Polygon or MultiPolygon GeoJSON text for the on-land detector; without it that
/// detector is off and the map says so.
pub fn ais_maps_from_csv(
    csv: &str,
    dataset: &DatasetSpec,
    cell_deg: f64,
    land_geojson: Option<&str>,
) -> Result<Vec<DayMap>, MapError> {
    let ds = resolve_dataset(dataset, Kind::Ais)?;
    let g = grid(cell_deg)?;
    let params = AisParams::PREREGISTERED_V1;
    let land = land_geojson
        .map(|t| LandMask::from_geojson_str(t, params.land_buffer_m))
        .transpose()?;
    let mut agg = AisAggregator::new(g, params.clone(), IdHasher::new(), land);
    agg.read_csv(csv)?;
    let (stats, land_on) = (agg.stats.clone(), agg.land_enabled());
    let days = agg.finish();
    Ok(day_maps(
        days,
        &g,
        &ais::method_json(&params, &stats, land_on),
        &ds,
    ))
}

/// Route exposure of a route (GeoJSON LineString text, or `lat,lon` CSV text) against maps
/// given as GeoJSON texts in the v1 format. `from` and `to` are optional inclusive
/// `YYYY-MM-DD` bounds. Returns the `kshana-route-exposure/v1` report.
pub fn route_exposure(
    route_text: &str,
    map_geojson: &[&str],
    from: Option<&str>,
    to: Option<&str>,
) -> Result<Value, MapError> {
    let pts = route::parse_route(route_text)?;
    let bound = |s: Option<&str>, name: &str| -> Result<Option<i64>, MapError> {
        s.map(|s| {
            parse_day(s).ok_or_else(|| MapError::Format(format!("{name} is not a YYYY-MM-DD date")))
        })
        .transpose()
    };
    let (from_d, to_d) = (bound(from, "from")?, bound(to, "to")?);
    let mut loaded = Vec::new();
    for text in map_geojson {
        let m = route::load_map(text)?;
        let d = parse_day(&m.date).ok_or_else(|| MapError::Format("map has a bad date".into()))?;
        if from_d.is_none_or(|x| d >= x) && to_d.is_none_or(|x| d <= x) {
            loaded.push(m);
        }
    }
    if loaded.is_empty() {
        return Err(MapError::Format("no map falls in the date range".into()));
    }
    loaded.sort_by(|a, b| {
        (a.date.as_str(), a.source_kind.as_str()).cmp(&(b.date.as_str(), b.source_kind.as_str()))
    });
    let rows: Vec<_> = loaded
        .iter()
        .map(|m| (route::exposure(&pts, m), m))
        .collect();
    Ok(route::report_json(&rows, from, to))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn adsb_csv() -> String {
        let mut csv = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp\n");
        for cell in 0..7 {
            let lon = 10.2 + 0.5 * cell as f64;
            for a in 0..12 {
                let id = format!("syn{cell}x{a}");
                let (nic, nacp) = if cell == 2 && a < 7 { (0, 0) } else { (9, 10) };
                for k in 0..6 {
                    csv.push_str(&format!(
                        "2026-03-01T09:0{k}:00Z,{id},40.1,5.1,33000,10,11\n"
                    ));
                }
                for k in 0..4 {
                    csv.push_str(&format!(
                        "2026-03-01T10:0{k}:00Z,{id},50.2,{lon},33000,{nic},{nacp}\n"
                    ));
                }
            }
        }
        csv
    }

    #[test]
    fn csv_to_maps_to_route_exposure_in_memory() {
        let maps = adsb_maps_from_csv(
            &adsb_csv(),
            &DatasetSpec::Preset("adsb-lol"),
            DEFAULT_CELL_DEG,
        )
        .unwrap();
        assert_eq!(maps.len(), 1);
        assert_eq!(maps[0].file_name, "adsb-2026-03-01.geojson");
        assert_eq!(maps[0].date, "2026-03-01");
        assert_eq!(
            maps[0].geojson["kshana_interference_map"]["format_version"],
            1
        );
        let text = maps[0].geojson.to_string();
        assert!(!text.contains("syn"));

        let route = r#"{"type":"LineString","coordinates":[[10.0,50.2],[13.5,50.2]]}"#;
        let rep = route_exposure(route, &[&text], Some("2026-03-01"), None).unwrap();
        let share = rep["kshana_route_exposure"]["rows"][0]["share_degraded"]
            .as_f64()
            .unwrap();
        assert!((share - 1.0 / 7.0).abs() < 0.01, "{share}");
        assert!(route_exposure(route, &[&text], Some("2026-03-02"), None).is_err());
        assert!(route_exposure(route, &[&text], Some("garbage"), None).is_err());
    }

    #[test]
    fn dataset_rules_are_enforced_here_too() {
        let c = adsb_csv();
        assert!(adsb_maps_from_csv(&c, &DatasetSpec::Preset("opensky"), 0.5).is_err());
        assert!(adsb_maps_from_csv(&c, &DatasetSpec::Preset("kystverket"), 0.5).is_err());
        assert!(adsb_maps_from_csv(
            &c,
            &DatasetSpec::Custom {
                licence: "",
                licence_url: "u",
                attribution: "a"
            },
            0.5
        )
        .is_err());
        assert!(adsb_maps_from_csv(&c, &DatasetSpec::Preset("adsb-lol"), 0.0).is_err());
        let custom = DatasetSpec::Custom {
            licence: "CC0-1.0",
            licence_url: "https://x.invalid",
            attribution: "Synthetic",
        };
        let m = adsb_maps_from_csv(&c, &custom, 0.5).unwrap();
        assert_eq!(
            m[0].geojson["kshana_interference_map"]["data"]["attribution"],
            "Synthetic"
        );
    }

    #[test]
    fn readsb_bytes_and_unreadable_files() {
        let trace = r#"{"icao":"abc123","timestamp":1772359200.0,"trace":[[0,50.2,12.2,33000,450,90,0,0,{"nic":9,"nac_p":10},"adsb_icao"]]}"#;
        let junk: &[u8] = &[0x1f, 0x8b, 9];
        let maps = adsb_maps_from_readsb_traces(
            &[trace.as_bytes(), junk],
            &DatasetSpec::Preset("adsb-lol"),
            0.5,
        )
        .unwrap();
        let st = &maps[0].geojson["kshana_interference_map"]["method"]["input_stats"];
        assert_eq!(
            (
                st["trace_files"].as_u64(),
                st["trace_files_unreadable"].as_u64()
            ),
            (Some(1), Some(1))
        );
    }

    #[test]
    fn ais_from_csv_with_and_without_land() {
        let mut csv = String::from("timestamp,vessel_id,lat,lon,sog_kn\n");
        for v in 0..6 {
            for k in 0..4 {
                csv.push_str(&format!(
                    "2026-03-01T11:0{k}:00Z,v{v},{},24.5,5\n",
                    60.5 + 0.01 * v as f64
                ));
            }
        }
        let land =
            r#"{"type":"Polygon","coordinates":[[[24,60],[25,60],[25,61],[24,61],[24,60]]]}"#;
        let d = DatasetSpec::Preset("kystverket");
        let with = ais_maps_from_csv(&csv, &d, 0.5, Some(land)).unwrap();
        assert_eq!(
            with[0].geojson["features"][0]["properties"]["status"],
            "anomalous"
        );
        let without = ais_maps_from_csv(&csv, &d, 0.5, None).unwrap();
        assert_eq!(
            without[0].geojson["features"][0]["properties"]["status"],
            "not_anomalous"
        );
        assert!(ais_maps_from_csv(&csv, &d, 0.5, Some("not json")).is_err());
        assert!(ais_maps_from_csv(&csv, &DatasetSpec::Preset("adsb-lol"), 0.5, None).is_err());
    }
}
