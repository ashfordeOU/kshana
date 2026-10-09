// SPDX-License-Identifier: AGPL-3.0-only
//! String-in, string-out entry points for the 0.35 capabilities, shared by the Python
//! bindings, the WebAssembly build and the Model Context Protocol (MCP) server.
//!
//! The command-line code of [`crate::interference_map`] works on files and prints; the
//! surfaces that have no file system, or that must not read the server's, need the same
//! methods on text held in memory. These functions are that layer. They add no method of
//! their own: every threshold, the privacy rule and the output schema are the feature
//! modules', called unchanged.
//!
//! Every input is size-capped by [`MAX_INPUT_BYTES`] unless the caller passes a tighter
//! cap, so a surface that accepts uploads cannot be made to allocate without bound.

use crate::interference_map::adsb::{self, AdsbAggregator, AdsbParams};
use crate::interference_map::ais::{self, AisAggregator, AisParams};
use crate::interference_map::grid::Grid;
use crate::interference_map::land::LandMask;
use crate::interference_map::output::{file_name, to_geojson};
use crate::interference_map::sources::{self, Dataset, Kind};
use crate::interference_map::time::parse_day;
use crate::interference_map::{route, IdHasher};
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario, TrustOutput};

/// Largest single text input any function here accepts (64 MiB).
pub const MAX_INPUT_BYTES: usize = 64 * 1024 * 1024;

/// Which source an interference map is built from.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum MapSource {
    /// Aircraft reports (`adsb-lol` preset or `custom`).
    Adsb,
    /// Ship reports (`noaa-marinecadastre`, `kystverket` or `custom`).
    Ais,
}

impl MapSource {
    /// Parse `"adsb"` or `"ais"`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "adsb" => Ok(Self::Adsb),
            "ais" => Ok(Self::Ais),
            o => Err(format!("unknown source `{o}`: use `adsb` or `ais`")),
        }
    }
}

/// The licence fields a `custom` dataset must state.
#[derive(Clone, Debug, Default)]
pub struct CustomDataset {
    /// Licence name.
    pub licence: String,
    /// Licence URL.
    pub licence_url: String,
    /// Attribution text.
    pub attribution: String,
}

/// One published day of an interference map.
#[derive(Clone, Debug)]
pub struct MapDay {
    /// Suggested file name (one file per source per UTC day).
    pub file_name: String,
    /// UTC date, `YYYY-MM-DD`.
    pub date: String,
    /// Cells published (at least five distinct aircraft or vessels each).
    pub cells_published: usize,
    /// Cells flagged degraded or anomalous.
    pub cells_flagged: usize,
    /// The `kshana-interference-map/v1` GeoJSON document, pretty-printed.
    pub geojson: String,
}

fn cap(what: &str, text: &str, max: usize) -> Result<(), String> {
    let limit = max.min(MAX_INPUT_BYTES);
    if text.len() > limit {
        return Err(format!(
            "{what} is {} bytes, over the {limit}-byte limit",
            text.len()
        ));
    }
    Ok(())
}

/// Assess a receiver log from a `receiver-trust` scenario whose log and navigation bytes are
/// **inline** (`text` or `base64`). A scenario that names a `path` is refused, so a caller
/// that takes the TOML from an untrusted party (a network service, an AI agent) cannot read
/// the host's files. `max_bytes` caps the TOML, and therefore the inline log.
pub fn assess_receiver_log_inline(toml: &str, max_bytes: usize) -> Result<TrustOutput, String> {
    cap("scenario", toml, max_bytes)?;
    let scn: ReceiverTrustScenario =
        toml::from_str(toml).map_err(|e| format!("invalid receiver-trust scenario: {e}"))?;
    if scn.log.source.path.is_some() || scn.log.nav.as_ref().is_some_and(|n| n.path.is_some()) {
        return Err(
            "`path` sources are not accepted here: give the log inline as `text` or `base64`"
                .into(),
        );
    }
    scenario::run_scenario(&scn)
}

fn dataset_for(key: &str, kind: Kind, custom: Option<&CustomDataset>) -> Result<Dataset, String> {
    let ds = if key == "custom" {
        let c = custom.ok_or("dataset `custom` needs licence, licence_url and attribution")?;
        if c.licence.is_empty() || c.licence_url.is_empty() || c.attribution.is_empty() {
            return Err("dataset `custom` needs licence, licence_url and attribution".into());
        }
        sources::custom(kind, &c.licence, &c.licence_url, &c.attribution)
    } else {
        sources::preset(key).ok_or_else(|| {
            format!(
                "unknown dataset `{key}`; approved: {}, or `custom`",
                sources::preset_keys().join(", ")
            )
        })?
    };
    if ds.kind != kind {
        return Err(format!(
            "dataset `{key}` is {} data but the input is {}",
            ds.kind.as_str(),
            kind.as_str()
        ));
    }
    Ok(ds)
}

/// Build an interference map from CSV text (the formats of `docs/INTERFERENCE-MAP.md`).
/// `land_geojson` (AIS only) is an optional land-polygon file for the inland detector.
/// Identifiers are hashed in memory and never returned; cells below the publication
/// minimum are withheld. A degraded cell does not name interference as the cause.
pub fn interference_map(
    source: MapSource,
    csv: &str,
    dataset: &str,
    cell_deg: Option<f64>,
    custom: Option<&CustomDataset>,
    land_geojson: Option<&str>,
    max_bytes: usize,
) -> Result<Vec<MapDay>, String> {
    cap("input", csv, max_bytes)?;
    if let Some(l) = land_geojson {
        cap("land file", l, max_bytes)?;
    }
    let grid = Grid::new(cell_deg.unwrap_or(0.5)).ok_or("cell_deg must be between 0.01 and 10")?;
    let (days, method, ds) = match source {
        MapSource::Adsb => {
            let ds = dataset_for(dataset, Kind::Adsb, custom)?;
            let mut agg = AdsbAggregator::new(grid, AdsbParams::PREREGISTERED_V1, IdHasher::new());
            agg.read_csv(csv).map_err(|e| e.to_string())?;
            let stats = agg.stats.clone();
            (
                agg.finish(),
                adsb::method_json(&AdsbParams::PREREGISTERED_V1, &stats),
                ds,
            )
        }
        MapSource::Ais => {
            let ds = dataset_for(dataset, Kind::Ais, custom)?;
            let params = AisParams::PREREGISTERED_V1;
            let land = land_geojson
                .map(|t| LandMask::from_geojson_str(t, params.land_buffer_m))
                .transpose()
                .map_err(|e| e.to_string())?;
            let mut agg = AisAggregator::new(grid, params.clone(), IdHasher::new(), land);
            agg.read_csv(csv).map_err(|e| e.to_string())?;
            let (stats, land_on) = (agg.stats.clone(), agg.land_enabled());
            (agg.finish(), ais::method_json(&params, &stats, land_on), ds)
        }
    };
    days.iter()
        .map(|d| {
            let doc = to_geojson(d, &grid, method.clone(), &ds);
            Ok(MapDay {
                file_name: file_name(d),
                date: d.date.clone(),
                cells_published: d.cells.len(),
                cells_flagged: d.cells.iter().filter(|c| c.degraded).count(),
                geojson: serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?,
            })
        })
        .collect()
}

/// Share of a route through degraded cells, for each map in `maps` (GeoJSON text from
/// [`interference_map`] or `kshana interference-map`) inside the optional `from`/`to`
/// dates (`YYYY-MM-DD`). Returns the `kshana-interference-map` route report as JSON.
/// Cells not observed are not evidence of a clear route, and the report is not a forecast.
pub fn route_exposure(
    route_text: &str,
    maps: &[&str],
    from: Option<&str>,
    to: Option<&str>,
    max_bytes: usize,
) -> Result<String, String> {
    cap("route", route_text, max_bytes)?;
    let pts = route::parse_route(route_text).map_err(|e| e.to_string())?;
    let day = |s: Option<&str>, n: &str| -> Result<Option<i64>, String> {
        s.map(|s| parse_day(s).ok_or_else(|| format!("{n} is not a YYYY-MM-DD date")))
            .transpose()
    };
    let (from_d, to_d) = (day(from, "from")?, day(to, "to")?);
    if maps.is_empty() {
        return Err("at least one map is required".into());
    }
    let mut loaded = Vec::new();
    for (i, text) in maps.iter().enumerate() {
        cap(&format!("map {}", i + 1), text, max_bytes)?;
        let m = route::load_map(text).map_err(|e| format!("map {}: {e}", i + 1))?;
        let d = parse_day(&m.date).ok_or_else(|| format!("map {}: bad map date", i + 1))?;
        if from_d.is_none_or(|x| d >= x) && to_d.is_none_or(|x| d <= x) {
            loaded.push(m);
        }
    }
    loaded.sort_by(|a, b| {
        (a.date.as_str(), a.source_kind.as_str()).cmp(&(b.date.as_str(), b.source_kind.as_str()))
    });
    if loaded.is_empty() {
        return Err("no map falls in the date range".into());
    }
    let rows: Vec<_> = loaded
        .iter()
        .map(|m| (route::exposure(&pts, m), m))
        .collect();
    let report = route::report_json(&rows, from, to);
    serde_json::to_string_pretty(&report).map_err(|e| e.to_string())
}

/// The result of replaying a bounded stream excerpt through the live trust engine.
#[derive(Clone, Debug, Default)]
pub struct VesselStream {
    /// One JSON line per completed epoch (schema 1.1 of `docs/MARITIME-TRUST.md`).
    pub reports_jsonl: String,
    /// The stream the gate would have forwarded, when the gate was asked for.
    pub gated_nmea: Option<String>,
    /// Epochs reported, by state.
    pub epochs: usize,
    /// Epochs in the calibration window.
    pub calibrating: usize,
    /// Epochs in the `nominal` band.
    pub nominal: usize,
    /// Epochs in the `degraded` band.
    pub degraded: usize,
    /// Epochs in the `untrusted` band.
    pub untrusted: usize,
    /// Epochs whose fix the gate marked invalid.
    pub withheld: usize,
    /// Lowest score reached after calibration.
    pub min_score: Option<f64>,
}

/// Replay an NMEA excerpt through the same engine as `kshana receiver-trust live`, with
/// the gate on or off, and return what a live run would have written. `session_toml` is a
/// live session (`[platform] kind = "vessel"`; its `[log]` is not needed). The excerpt is
/// read as fast as it can be, so the host clock plays no part. This is the bounded form of
/// the live command for surfaces that cannot run a process: it opens no socket, and the
/// gate's output is returned as text, never written to a port. Advisory only: the operator
/// remains responsible for the vessel.
pub fn assess_vessel_stream(
    session_toml: &str,
    nmea: &str,
    gate: bool,
    max_bytes: usize,
) -> Result<VesselStream, String> {
    use crate::receiver_trust::live::{parse_live_scenario, GateAction, LiveEngine, LiveOut};
    cap("session", session_toml, max_bytes)?;
    cap("NMEA excerpt", nmea, max_bytes)?;
    let scn = parse_live_scenario(session_toml)?;
    let mut eng = LiveEngine::new(&scn, gate)?;
    eng.set_host_clock(false);
    let mut out = VesselStream::default();
    let mut gated = Vec::<u8>::new();
    let mut take = |o: LiveOut, out: &mut VesselStream| {
        for l in o.forward {
            gated.extend_from_slice(&l);
        }
        for r in o.reports {
            out.epochs += 1;
            match serde_json::to_value(r.state)
                .ok()
                .as_ref()
                .and_then(|v| v.as_str())
            {
                Some("calibrating") => out.calibrating += 1,
                Some("nominal") => out.nominal += 1,
                Some("degraded") => out.degraded += 1,
                Some("untrusted") => out.untrusted += 1,
                _ => {}
            }
            if r.gate == GateAction::Withheld {
                out.withheld += 1;
            }
            if let Some(sc) = r.score {
                out.min_score = Some(out.min_score.map_or(sc, |m| m.min(sc)));
            }
            out.reports_jsonl.push_str(&r.to_json_line());
            out.reports_jsonl.push('\n');
        }
    };
    for line in nmea.split_inclusive('\n') {
        let o = eng.feed_line(line.as_bytes(), 0.0);
        take(o, &mut out);
    }
    let o = eng.finish();
    take(o, &mut out);
    if gate {
        out.gated_nmea = Some(String::from_utf8_lossy(&gated).into_owned());
    }
    Ok(out)
}

/// Result of a training-scenario run: text only, nothing is transmitted.
#[derive(Clone, Debug)]
pub struct NmeaTraining {
    /// The synthetic bridge NMEA 0183 stream, CRLF line ends, with the training marker.
    pub nmea: String,
    /// Instructor log as JSON (`kshana-nmea-training/1`): what was injected, when, true track.
    pub log_json: String,
    /// Instructor log as text.
    pub log_text: String,
}

/// Generate synthetic training NMEA from a `nmea-scenario` TOML. Text only: for crew
/// training and tests, never for a vessel's live navigation systems.
pub fn nmea_training(
    toml: &str,
    seed: Option<u64>,
    max_bytes: usize,
) -> Result<NmeaTraining, String> {
    cap("scenario", toml, max_bytes)?;
    let g = crate::nmea_synth::generate_from_toml(toml, seed)?;
    Ok(NmeaTraining {
        nmea: g.nmea_text(),
        log_json: g.log.to_json(),
        log_text: g.log.to_text(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    const ADSB: &str = include_str!("../examples/interference-map/input/adsb.csv");
    const AIS: &str = include_str!("../examples/interference-map/input/ais.csv");
    const LAND: &str = include_str!("../examples/interference-map/input/land.geojson");
    const NMEA: &str = include_str!("../examples/maritime-trust/tallinn-helsinki.nmea");
    const SESSION: &str = include_str!("../examples/maritime-trust/session.toml");
    const TRAINING: &str = include_str!("../scenarios/training/open-sea-jamming.toml");

    fn custom() -> CustomDataset {
        CustomDataset {
            licence: "CC0-1.0".into(),
            licence_url: "https://creativecommons.org/publicdomain/zero/1.0/".into(),
            attribution:
                "Synthetic data generated for Kshana documentation. Not real observations.".into(),
        }
    }

    #[test]
    fn adsb_and_ais_maps_match_the_cli_samples() {
        for (src, csv, land, sample) in [
            (
                MapSource::Adsb,
                ADSB,
                None,
                include_str!("../examples/interference-map/output/adsb-2026-03-01.geojson"),
            ),
            (
                MapSource::Ais,
                AIS,
                Some(LAND),
                include_str!("../examples/interference-map/output/ais-2026-03-01.geojson"),
            ),
        ] {
            let days = interference_map(
                src,
                csv,
                "custom",
                None,
                Some(&custom()),
                land,
                MAX_INPUT_BYTES,
            )
            .unwrap();
            assert_eq!(days.len(), 1);
            let (mut a, mut b): (serde_json::Value, serde_json::Value) = (
                serde_json::from_str(&days[0].geojson).unwrap(),
                serde_json::from_str(sample).unwrap(),
            );
            for v in [&mut a, &mut b] {
                v["kshana_interference_map"]["kshana_version"] = "X".into();
            }
            assert_eq!(a, b);
            assert_eq!(
                a["kshana_interference_map"]["schema"],
                "kshana-interference-map/v1"
            );
            assert!(days[0].cells_published > 0);
        }
    }

    #[test]
    fn route_exposure_runs_on_an_in_memory_map() {
        let day = interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            Some(&custom()),
            None,
            MAX_INPUT_BYTES,
        )
        .unwrap();
        let route = r#"{"type":"LineString","coordinates":[[-10.0,35.0],[10.0,55.0]]}"#;
        let rep = route_exposure(route, &[&day[0].geojson], None, None, MAX_INPUT_BYTES).unwrap();
        let v: serde_json::Value = serde_json::from_str(&rep).unwrap();
        assert!(v.is_object());
        assert!(route_exposure(route, &[], None, None, MAX_INPUT_BYTES).is_err());
        assert!(route_exposure(
            route,
            &[&day[0].geojson],
            Some("2030-01-01"),
            None,
            MAX_INPUT_BYTES
        )
        .unwrap_err()
        .contains("no map"));
    }

    #[test]
    fn inputs_are_capped_and_datasets_are_checked() {
        assert!(interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            None,
            None,
            MAX_INPUT_BYTES
        )
        .is_err());
        assert!(interference_map(
            MapSource::Adsb,
            ADSB,
            "custom",
            None,
            Some(&custom()),
            None,
            100
        )
        .unwrap_err()
        .contains("limit"));
        assert!(interference_map(
            MapSource::Ais,
            AIS,
            "adsb-lol",
            None,
            None,
            None,
            MAX_INPUT_BYTES
        )
        .unwrap_err()
        .contains("data"));
        assert!(MapSource::parse("radar").is_err());
    }

    #[test]
    fn inline_receiver_assessment_refuses_paths_and_runs_inline_logs() {
        let e = assess_receiver_log_inline(SESSION, MAX_INPUT_BYTES).unwrap_err();
        assert!(e.contains("path"), "{e}");
        let mut v: toml::Value = toml::from_str(SESSION).unwrap();
        let log = v["log"].as_table_mut().unwrap();
        log.remove("path");
        log.insert("text".into(), toml::Value::String(NMEA.to_string()));
        let inline = toml::to_string(&v).unwrap();
        let out = assess_receiver_log_inline(&inline, MAX_INPUT_BYTES).unwrap();
        assert!(!out.summary.is_empty());
        assert!(out.json.contains("score"));
        assert!(assess_receiver_log_inline(&inline, 1000)
            .unwrap_err()
            .contains("limit"));
    }

    #[test]
    fn vessel_stream_replay_scores_and_gates_the_synthetic_drag_off() {
        let session = SESSION.replace("path = \"tallinn-helsinki.nmea\"", "");
        // Seconds 1400 to 1800 of the 3000-second log (the drag-off starts at 1500 s), with
        // a 60 s calibration window instead of 300 s: the same engine, in a fraction of the
        // debug-build runtime.
        let at = |t: usize| NMEA[..NMEA.len() * t / 3000].rfind('\n').unwrap() + 1;
        let nmea = &NMEA[at(1400)..at(1800)];
        let session = session.replace("calibration_s = 300.0", "calibration_s = 60.0");
        let r = assess_vessel_stream(&session, nmea, true, MAX_INPUT_BYTES).unwrap();
        assert!(
            r.epochs > 300 && r.calibrating > 0 && r.nominal > 0,
            "{r:?}"
        );
        assert!(
            r.untrusted > 0 && r.withheld > 0,
            "the drag-off must be flagged: {r:?}"
        );
        assert!(r.min_score.unwrap() < 55.0);
        assert!(r.gated_nmea.as_ref().unwrap().len() > 1000);
        let off = assess_vessel_stream(&session, nmea, false, MAX_INPUT_BYTES).unwrap();
        assert!(off.gated_nmea.is_none() && off.withheld == 0);
        assert!(assess_vessel_stream(&session, nmea, false, 1000).is_err());
        assert!(assess_vessel_stream(
            "[platform]\nkind = \"static\"",
            NMEA,
            false,
            MAX_INPUT_BYTES
        )
        .is_err());
    }

    #[test]
    fn training_nmea_is_deterministic_per_seed() {
        let a = nmea_training(TRAINING, None, MAX_INPUT_BYTES).unwrap();
        assert_eq!(
            a.nmea,
            nmea_training(TRAINING, None, MAX_INPUT_BYTES).unwrap().nmea
        );
        assert_ne!(
            a.nmea,
            nmea_training(TRAINING, Some(7), MAX_INPUT_BYTES)
                .unwrap()
                .nmea
        );
        assert!(a.nmea.contains("\r\n") && a.log_json.contains("kshana-nmea-training/1"));
        assert!(!a.log_text.is_empty());
        assert!(nmea_training("[scenario]", None, MAX_INPUT_BYTES).is_err());
    }
}
