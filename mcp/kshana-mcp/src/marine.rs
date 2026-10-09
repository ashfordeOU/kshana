// SPDX-License-Identifier: AGPL-3.0-only
//! The 0.35 maritime and interference-map tools: a bounded stream-excerpt assessment, the
//! training-NMEA generator, the interference map and the route-exposure summary.
//!
//! Each tool wraps [`kshana::surface`], which calls the same code the command line runs.
//! Nothing here reads or writes a file, opens a socket or transmits anything: inputs are
//! text in the request, outputs are text in the reply, and every input is capped at
//! [`MAX_UPLOAD_BYTES`] so a client cannot make the server allocate without bound.
//!
//! `receiver-trust live` itself (a long-running process with a gate and a TCP listener) is
//! not a tool: an MCP call returns when it returns. [`KshanaServer::assess_vessel_stream`]
//! is its bounded form, replaying an excerpt through the same engine.

use crate::server::KshanaServer;
use kshana::surface::{self, CustomDataset, MapSource};
use rmcp::handler::server::wrapper::Parameters;
use rmcp::model::{CallToolResult, ContentBlock};
use rmcp::{ErrorData as McpError, schemars, tool, tool_router};

/// Largest single text input a tool here accepts, in bytes (4 MiB).
pub const MAX_UPLOAD_BYTES: usize = 4 * 1024 * 1024;
/// Most NMEA lines a reply carries (training NMEA, gated stream).
pub const MAX_REPLY_LINES: usize = 2000;
/// Most per-epoch report lines a stream-excerpt reply carries.
pub const MAX_REPORT_LINES: usize = 200;
/// Most GeoJSON bytes one interference-map reply carries (all days together).
pub const MAX_MAP_REPLY_BYTES: usize = 4 * 1024 * 1024;

const ADVISORY: &str = "Advisory only: Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162) and the operator remains responsible for the vessel. Evidence tier: MODELLED (the monitors' thresholds are stated inputs; detection performance on real interference is not asserted).";
const MAP_CAVEATS: &str = "Evidence tier: MODELLED (pre-registered detection thresholds, not validated against a ground-truth interference measurement). A degraded cell does not identify interference as the cause; cells not published were not observed by enough aircraft or vessels and are not evidence of a clear cell; this describes past position reports and is not a forecast.";

/// An `invalid_params` error, the shape every tool of this server reports.
fn bad(message: String) -> McpError {
    McpError::invalid_params(message, None)
}

fn reply(v: serde_json::Value) -> Result<CallToolResult, McpError> {
    Ok(CallToolResult::success(vec![ContentBlock::text(
        serde_json::to_string_pretty(&v).unwrap_or_else(|_| v.to_string()),
    )]))
}

/// The first `max` lines of `text`, and whether any were cut.
fn head_lines(text: &str, max: usize) -> (String, bool) {
    let mut it = text.split_inclusive('\n');
    let head: String = it.by_ref().take(max).collect();
    (head, it.next().is_some())
}

/// Parameters for [`KshanaServer::assess_vessel_stream`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct VesselStreamRequest {
    /// A live session as TOML: `[platform] kind = "vessel"` with the vessel's limits
    /// (`max_speed_kn`, `max_accel_mps2`, `max_turn_rate_dps`, `antenna_height_m`,
    /// `heading_sensor`), optional `[monitors]`, `[maritime]` and `[score]` tables. Its
    /// `[log]` table is not needed. See docs/MARITIME-TRUST.md.
    pub session_toml: String,
    /// The NMEA 0183 excerpt (GGA, RMC, VTG, HDT, VBW, GSV and so on), at most 4 MiB. The
    /// first `calibration_s` seconds of it (default 300) form the baseline and are not scored.
    pub nmea: String,
    /// When true, also return the stream the gate would have forwarded (fix marked invalid
    /// while untrusted), the first 2000 lines. Default false. The gate's output is returned
    /// as text and is never written to a port.
    #[serde(default)]
    pub gate: bool,
}

/// Parameters for [`KshanaServer::generate_training_nmea`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct TrainingNmeaRequest {
    /// A `nmea-scenario` TOML: a vessel track (waypoints, rate-of-turn and speed limits, a
    /// current) and a timeline of scripted events (jamming, position drag-off, time spoof,
    /// replay delay, each with recovery). See scenarios/training/ for four examples.
    pub toml: String,
    /// Replaces the scenario's seed when given; the output is deterministic per seed.
    #[serde(default)]
    pub seed: Option<u64>,
    /// When true (default), return the NMEA text (the first 2000 lines). Set false for the
    /// instructor log alone.
    #[serde(default = "yes")]
    pub include_nmea: bool,
}

fn yes() -> bool {
    true
}

/// Parameters for [`KshanaServer::build_interference_map`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct InterferenceMapRequest {
    /// `"adsb"` (aircraft position reports with NIC/NACp) or `"ais"` (ship reports).
    pub source: String,
    /// The input as CSV text, at most 4 MiB, in the format of docs/INTERFERENCE-MAP.md.
    pub csv: String,
    /// An approved dataset (`adsb-lol`, `noaa-marinecadastre`, `kystverket`) or `"custom"`,
    /// which also needs `licence`, `licence_url` and `attribution`. The licence and
    /// attribution are embedded in the output.
    pub dataset: String,
    /// Grid cell size in degrees, 0.01 to 10 (default 0.5).
    #[serde(default)]
    pub cell_deg: Option<f64>,
    /// For `dataset = "custom"`: the licence name.
    #[serde(default)]
    pub licence: Option<String>,
    /// For `dataset = "custom"`: the licence URL.
    #[serde(default)]
    pub licence_url: Option<String>,
    /// For `dataset = "custom"`: the attribution text.
    #[serde(default)]
    pub attribution: Option<String>,
    /// AIS only: a land-polygon GeoJSON (at most 4 MiB) for the inland-position detector.
    #[serde(default)]
    pub land_geojson: Option<String>,
}

/// Parameters for [`KshanaServer::route_exposure`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct RouteExposureRequest {
    /// The route: a GeoJSON LineString (or Feature/FeatureCollection holding one), or CSV
    /// text with `lat,lon` rows.
    pub route: String,
    /// One or more interference maps, each the GeoJSON text `build_interference_map`
    /// returns (one per source per UTC day), at most 4 MiB each.
    pub maps: Vec<String>,
    /// Keep maps dated on or after this UTC day, `YYYY-MM-DD`.
    #[serde(default)]
    pub date_from: Option<String>,
    /// Keep maps dated on or before this UTC day, `YYYY-MM-DD`.
    #[serde(default)]
    pub date_to: Option<String>,
}

#[tool_router(router = marine_tool_router, vis = "pub(crate)")]
impl KshanaServer {
    #[tool(
        description = "Replay a bounded NMEA 0183 excerpt through the engine behind `kshana receiver-trust live` and return what a live run would have written: per-epoch trust state (calibrating, nominal, degraded, untrusted) and 0-100 score with the monitors that deducted, counts of epochs by state, the lowest score, and with `gate` true the stream the gate would have forwarded (fix marked invalid while untrusted). `session_toml` declares the vessel (`[platform] kind = \"vessel\"`, its speed, acceleration and turn-rate limits, antenna height, whether a heading sensor is on the bus). Input is capped at 4 MiB; the reply carries at most 200 non-nominal epoch lines and 2000 gated lines. This is the bounded form of the live command: no socket is opened and nothing is written to a port (the long-running process and its `--listen` server are command-line only). The checks cannot see a spoofer whose fix is consistent with everything on the bus. Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED."
    )]
    fn assess_vessel_stream(
        &self,
        Parameters(VesselStreamRequest {
            session_toml,
            nmea,
            gate,
        }): Parameters<VesselStreamRequest>,
    ) -> Result<CallToolResult, McpError> {
        let r = surface::assess_vessel_stream(&session_toml, &nmea, gate, MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("vessel stream assessment failed: {e}")))?;
        let notable: String = r
            .reports_jsonl
            .lines()
            .filter(|l| {
                l.contains("\"state\":\"degraded\"") || l.contains("\"state\":\"untrusted\"")
            })
            .take(MAX_REPORT_LINES)
            .map(|l| format!("{l}\n"))
            .collect();
        let mut v = serde_json::json!({
            "epochs": r.epochs,
            "calibrating": r.calibrating,
            "nominal": r.nominal,
            "degraded": r.degraded,
            "untrusted": r.untrusted,
            "withheld": r.withheld,
            "min_score": r.min_score,
            "first_non_nominal_epochs_jsonl": notable,
            "report_schema": "JSON lines, version 1.1 (docs/MARITIME-TRUST.md)",
            "notice": ADVISORY,
        });
        if let Some(g) = &r.gated_nmea {
            let (head, cut) = head_lines(g, MAX_REPLY_LINES);
            v["gated_nmea"] = head.into();
            v["gated_nmea_truncated"] = cut.into();
        }
        reply(v)
    }

    #[tool(
        description = "Generate synthetic bridge NMEA 0183 for crew training from a `nmea-scenario` TOML (`kshana nmea-scenario`): a vessel track and a timeline of scripted events (jamming, position drag-off, time spoof, replay delay, with recovery). Returns the checksum-valid sentence set (GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT, VBW; the first 2000 lines) and the instructor log (what was injected when, with the true track; schema kshana-nmea-training/1) as JSON and text. Deterministic per `seed`. TEXT ONLY: nothing here synthesises RF, IQ or any waveform, nothing is transmitted, and the output is for training and testing, never for a vessel's live navigation systems (a marker sentence in the stream says so). Streaming to a TCP or UDP address is command-line only. Four example scenarios ship in scenarios/training/."
    )]
    fn generate_training_nmea(
        &self,
        Parameters(TrainingNmeaRequest {
            toml,
            seed,
            include_nmea,
        }): Parameters<TrainingNmeaRequest>,
    ) -> Result<CallToolResult, McpError> {
        let t = surface::nmea_training(&toml, seed, MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("training scenario failed: {e}")))?;
        let total = t.nmea.lines().count();
        let mut v = serde_json::json!({
            "nmea_lines_total": total,
            "instructor_log": serde_json::from_str::<serde_json::Value>(&t.log_json)
                .unwrap_or(serde_json::Value::Null),
            "instructor_log_text": t.log_text,
            "notice": "Synthetic training data generated by Kshana. For training and testing only: never feed this stream to a vessel's live navigation systems.",
        });
        if include_nmea {
            let (head, cut) = head_lines(&t.nmea, MAX_REPLY_LINES);
            v["nmea"] = head.into();
            v["nmea_truncated"] = cut.into();
        }
        reply(v)
    }

    #[tool(
        description = "Build a GNSS interference map from openly licensed aircraft (ADS-B NIC/NACp) or ship (AIS) position reports given as CSV text (`kshana interference-map adsb|ais`). Returns one GeoJSON document per UTC day (schema kshana-interference-map/v1) in which each published grid cell is `degraded`/`not_degraded` (ADS-B) or `anomalous`/`not_anomalous` (AIS), with the method, its pre-registered thresholds, the dataset licence and attribution embedded. Aggregate only: identifiers are hashed in memory and never returned, and a cell with fewer than 5 distinct aircraft or vessels is not published. `dataset` is an approved preset or `custom` (with licence, licence_url, attribution). Input is capped at 4 MiB and the reply at 4 MiB (use a coarser `cell_deg` or the command line for more). Nothing is fetched: land polygons, if wanted for AIS, are passed in. A degraded cell does not identify interference as the cause; an unpublished cell is not evidence of a clear cell; this is not a forecast. Evidence tier: MODELLED."
    )]
    fn build_interference_map(
        &self,
        Parameters(r): Parameters<InterferenceMapRequest>,
    ) -> Result<CallToolResult, McpError> {
        let source = MapSource::parse(&r.source).map_err(bad)?;
        let custom = (r.licence.is_some() || r.licence_url.is_some() || r.attribution.is_some())
            .then(|| CustomDataset {
                licence: r.licence.unwrap_or_default(),
                licence_url: r.licence_url.unwrap_or_default(),
                attribution: r.attribution.unwrap_or_default(),
            });
        let days = surface::interference_map(
            source,
            &r.csv,
            &r.dataset,
            r.cell_deg,
            custom.as_ref(),
            r.land_geojson.as_deref(),
            MAX_UPLOAD_BYTES,
        )
        .map_err(|e| bad(format!("interference map failed: {e}")))?;
        let total: usize = days.iter().map(|d| d.geojson.len()).sum();
        if total > MAX_MAP_REPLY_BYTES {
            return Err(bad(format!(
                "the map is {total} bytes, over the {MAX_MAP_REPLY_BYTES}-byte reply limit; use a coarser cell_deg, fewer days, or `kshana interference-map` on the command line"
            )));
        }
        let mut contents = vec![ContentBlock::text(
            serde_json::to_string_pretty(&serde_json::json!({
                "days": days.iter().map(|d| serde_json::json!({
                    "file_name": d.file_name,
                    "date": d.date,
                    "cells_published": d.cells_published,
                    "cells_flagged": d.cells_flagged,
                })).collect::<Vec<_>>(),
                "caveats": MAP_CAVEATS,
            }))
            .unwrap_or_default(),
        )];
        contents.extend(days.into_iter().map(|d| ContentBlock::text(d.geojson)));
        Ok(CallToolResult::success(contents))
    }

    #[tool(
        description = "Summarise how much of a route runs through degraded cells of one or more interference maps (`kshana route-exposure`): for each map (one per source per UTC day, the GeoJSON `build_interference_map` returns), the route length and the shares of its length in degraded cells, in cells that were not degraded, in cells with too little sample to assess, and in cells not observed. The route is a GeoJSON LineString or `lat,lon` CSV text; `date_from`/`date_to` (YYYY-MM-DD) keep maps in a date range. Input is capped at 4 MiB per item. Cells not observed are not evidence of a clear route; a degraded cell does not identify interference as the cause; this describes past reports and is not a forecast. Evidence tier: MODELLED."
    )]
    fn route_exposure(
        &self,
        Parameters(r): Parameters<RouteExposureRequest>,
    ) -> Result<CallToolResult, McpError> {
        if r.maps.len() > 366 {
            return Err(bad("at most 366 maps per call".into()));
        }
        let maps: Vec<&str> = r.maps.iter().map(String::as_str).collect();
        let report = surface::route_exposure(
            &r.route,
            &maps,
            r.date_from.as_deref(),
            r.date_to.as_deref(),
            MAX_UPLOAD_BYTES,
        )
        .map_err(|e| bad(format!("route exposure failed: {e}")))?;
        Ok(CallToolResult::success(vec![ContentBlock::text(report)]))
    }
}
