// SPDX-License-Identifier: AGPL-3.0-only
//! The 0.35 maritime, evidence and interference-map tools: a vessel log and a bounded
//! stream-excerpt assessment, the training-NMEA generator, evidence-pack creation and
//! verification, the interference map and the route-exposure summary.
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

/// Parameters for [`KshanaServer::assess_vessel_stream`] and [`KshanaServer::assess_vessel_log`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct VesselNmeaRequest {
    /// A session as TOML: `[platform] kind = "vessel"` with the vessel's limits
    /// (`max_speed_kn`, `max_accel_mps2`, `max_turn_rate_dps`, `antenna_height_m`,
    /// `heading_sensor`), optional `[monitors]`, `[maritime]` and `[score]` tables. No `[log]`
    /// table is needed. See docs/MARITIME-TRUST.md.
    pub session_toml: String,
    /// The NMEA 0183 text (GGA, RMC, VTG, HDT, VBW, GSV and so on), at most 4 MiB. The first
    /// `calibration_s` seconds of it (default 60 for a stream excerpt) form the baseline and
    /// are not scored.
    pub nmea: String,
}

/// Parameters for [`KshanaServer::create_evidence_pack`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct CreateEvidenceRequest {
    /// The session as for `assess_vessel_log`.
    pub session_toml: String,
    /// The vessel's NMEA 0183 log, at most 4 MiB.
    pub nmea: String,
    /// Start of the window, seconds since the log's first epoch.
    pub from_s: f64,
    /// End of the window, seconds since the log's first epoch.
    pub to_s: f64,
    /// Title shown in the pack's summary and manifest.
    #[serde(default)]
    pub title: Option<String>,
    /// The Ed25519 signing-key seed, 64 lower-case hex digits. Optional: omitted, a one-time
    /// key is generated for this call and discarded, so the signature proves only that the
    /// pack is intact against the key it names itself. A seed passed here travels through
    /// the conversation: for a key that matters, make the pack with `kshana receiver-trust
    /// evidence` on the command line instead.
    #[serde(default)]
    pub signing_key_seed_hex: Option<String>,
}

/// Parameters for [`KshanaServer::verify_evidence_pack`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct VerifyEvidenceRequest {
    /// The pack's files as a JSON object of file name to content: a string, `{"utf8": text}`
    /// or `{"base64": bytes}` (what `create_evidence_pack` returns under `files`). At most 4
    /// MiB in all.
    pub files: serde_json::Value,
    /// The signer's public key, 64 lower-case hex digits, obtained from the signer by another
    /// route. Without it the signature proves only that the pack is intact against the key it
    /// names itself, which anyone can generate.
    #[serde(default)]
    pub public_key: Option<String>,
    /// The full original log, to check that it is the one the pack records and that the slice
    /// came from it. At most 4 MiB.
    #[serde(default)]
    pub full_log: Option<String>,
    /// Fail unless the pack carries a timestamp token (a token sits beside the signed
    /// manifest, so removing one cannot otherwise be detected). Default false.
    #[serde(default)]
    pub require_timestamp: bool,
}

/// Parameters for [`KshanaServer::attach_evidence_timestamp`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct AttachTimestampRequest {
    /// The pack's files as a JSON object of file name to content, as `create_evidence_pack`
    /// returns them under `files`. At most 4 MiB in all.
    pub files: serde_json::Value,
    /// The RFC 3161 timestamp token (the bytes of the `.tsr` file) as base64.
    pub token_base64: String,
    /// Replace a token the pack already has. Default false.
    #[serde(default)]
    pub replace: bool,
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

/// Parameters for [`KshanaServer::export_test_bench`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct TestBenchRequest {
    /// The scenario TOML (kind `gnss-ins`, `jamming` or `gnss-sim`), at most 4 MiB.
    pub toml: String,
    /// UTC instant of motion time zero, `YYYY-MM-DDTHH:MM:SS` with an optional `Z`. Default
    /// 2024-01-01T00:00:00Z.
    #[serde(default)]
    pub epoch: Option<String>,
}

/// One run offered to [`KshanaServer::compliance_report`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ComplianceRunRequest {
    /// The name to show for the run (usually the result's file name).
    pub label: String,
    /// The result JSON text a Kshana run wrote.
    pub result: String,
    /// The scenario TOML that produced it, when there is one. A result does not name its
    /// scenario kind; the scenario does. A `receiver-trust` result is recognised without it.
    #[serde(default)]
    pub scenario: Option<String>,
}

/// Parameters for [`KshanaServer::compliance_report`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ComplianceReportRequest {
    /// The runs to read, at most 64, 4 MiB in all.
    pub runs: Vec<ComplianceRunRequest>,
}

/// Parameters for [`KshanaServer::compliance_mapping`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ComplianceMappingRequest {
    /// False (default): the mapping tables. True: the source documents they cite.
    #[serde(default)]
    pub sources: bool,
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
        description = "Score a bounded excerpt of a vessel's NMEA 0183 stream the way `kshana receiver-trust live` scores it, and return per-epoch trust state (calibrating, nominal, degraded, untrusted) and 0-100 score with the monitors that deducted (live JSON-lines schema 1.2: each epoch carries `position` and an `advisory` statement that the output is advisory), the summary (counts by state, lowest and final score, when the first untrusted epoch came) and the last `$PKSHT` sentence. `session_toml` declares the vessel (`[platform] kind = \"vessel\"`, its speed, acceleration and turn-rate limits, antenna height, whether a heading sensor is on the bus). The excerpt must hold the calibration window; input is capped at 2 MiB and 20,000 epochs, and the reply carries at most 200 degraded or untrusted epoch lines. This is the bounded form of the live command: no socket is opened and nothing is written to a port, and the gate and the telemetry exporters (the long-running process and its `--listen` server) are command-line only. The checks cannot see a spoofer whose fix is consistent with everything on the bus. Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED."
    )]
    fn assess_vessel_stream(
        &self,
        Parameters(VesselNmeaRequest { session_toml, nmea }): Parameters<VesselNmeaRequest>,
    ) -> Result<CallToolResult, McpError> {
        let r = surface::assess_vessel_excerpt(&session_toml, nmea.as_bytes(), MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("vessel stream assessment failed: {e}")))?;
        let notable: String = r
            .epochs
            .iter()
            .filter(|e| {
                matches!(
                    serde_json::to_value(e.state)
                        .ok()
                        .as_ref()
                        .and_then(|v| v.as_str()),
                    Some("degraded" | "untrusted")
                )
            })
            .take(MAX_REPORT_LINES)
            .map(|e| format!("{}\n", e.to_json_line()))
            .collect();
        reply(serde_json::json!({
            "summary": r.summary,
            "first_non_nominal_epochs_jsonl": notable,
            "last_pksht": r.last_pksht,
            "report_schema": "JSON lines, version 1.2 (docs/MARITIME-TRUST.md)",
            "notice": ADVISORY,
        }))
    }

    #[tool(
        description = "Assess a vessel's NMEA 0183 log as a batch run (`kshana receiver-trust` with `[platform] kind = \"vessel\"`): the score model, the monitors that ran and every epoch's 0-100 score with its deductions. `session_toml` states the vessel's limits and any monitor or score settings (no `[log]` table needed) and `nmea` is the log text, which avoids pasting it inside a TOML string. Input is capped at 4 MiB; the reply carries the document with `epochs` cut to counts by state and at most 200 degraded or untrusted epochs. For a log in another format, or with `[[events]]` to score, use `assess_receiver_log`. Advisory only: not type-approved navigation equipment; the operator remains responsible. Evidence tier: MODELLED."
    )]
    fn assess_vessel_log(
        &self,
        Parameters(VesselNmeaRequest { session_toml, nmea }): Parameters<VesselNmeaRequest>,
    ) -> Result<CallToolResult, McpError> {
        let j = surface::assess_vessel_log_json(&session_toml, nmea.as_bytes(), MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("vessel log assessment failed: {e}")))?;
        let mut v: serde_json::Value =
            serde_json::from_str(&j).map_err(|e| bad(format!("result is not JSON: {e}")))?;
        let epochs = v["epochs"].as_array().cloned().unwrap_or_default();
        let state = |e: &serde_json::Value| e["state"].as_str().unwrap_or("").to_string();
        let mut counts = std::collections::BTreeMap::<String, usize>::new();
        for e in &epochs {
            *counts.entry(state(e)).or_default() += 1;
        }
        let notable: Vec<serde_json::Value> = epochs
            .into_iter()
            .filter(|e| matches!(state(e).as_str(), "degraded" | "untrusted"))
            .take(MAX_REPORT_LINES)
            .collect();
        v["epochs"] =
            serde_json::json!({"counts_by_state": counts, "first_degraded_or_untrusted": notable});
        v["notice"] = ADVISORY.into();
        reply(v)
    }

    #[tool(
        description = "Generate synthetic bridge NMEA 0183 for crew training from a `nmea-scenario` TOML (`kshana nmea-scenario`): a vessel track and a timeline of scripted events (jamming, position drag-off, time spoof, replay delay, with recovery). Returns the checksum-valid sentence set (GGA, RMC, VTG, GSV, GSA, GNS, ZDA, HDT, VBW; the first 2000 lines) and the instructor log (what was injected when, with the true track and a top-level `summary` of peak speeds and accelerations; drag-off events carry their peak drag speed and acceleration; schema kshana-nmea-training/1) as JSON and text. The receiver's visible-satellite ceiling is `receiver.max_used` (default 12). Deterministic per `seed`. TEXT ONLY: nothing here synthesises RF, IQ or any waveform, nothing is transmitted, and the output is for training and testing, never for a vessel's live navigation systems (a marker sentence in the stream says so). Streaming to a TCP or UDP address is command-line only. Four example scenarios ship in scenarios/training/."
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
        description = "Create a signed evidence pack for a window of a vessel's NMEA 0183 log (`kshana receiver-trust evidence`): the raw log bytes for the window, the configuration with every threshold, the per-epoch results and reasons, a self-contained summary page, and a manifest listing every file's SHA-256 with the full log's hash and a hash chain, signed with Ed25519. `from_s`/`to_s` are seconds since the log's first epoch. Returns the files as JSON (feed them to `verify_evidence_pack`), the signer's public key and fingerprint. The signing seed is never returned or logged; if `signing_key_seed_hex` is omitted a one-time key is used and discarded, so the pack proves integrity against the key it names itself, not who signed it: for a key that matters, create the pack on the command line (a seed passed here travels through the conversation). Input is capped at 4 MiB and the reply at 4 MiB (narrow the window). A pack is a technical record of what the engine computed from a log under stated settings; it is not a legal opinion, a finding of fact about any event, or a certification. Evidence tier: MODELLED."
    )]
    fn create_evidence_pack(
        &self,
        Parameters(r): Parameters<CreateEvidenceRequest>,
    ) -> Result<CallToolResult, McpError> {
        let seed = r
            .signing_key_seed_hex
            .as_deref()
            .map(|h| surface::hex32("signing_key_seed_hex", h))
            .transpose()
            .map_err(bad)?;
        let created = surface::now_rfc3339_utc();
        let p = surface::evidence_create(
            &r.session_toml,
            r.nmea.as_bytes(),
            r.from_s,
            r.to_s,
            r.title.as_deref(),
            Some(&created),
            seed,
            MAX_UPLOAD_BYTES,
        )
        .map_err(|e| bad(format!("evidence pack failed: {e}")))?;
        let files = surface::files_to_json(&p.files);
        let size = files.to_string().len();
        if size > MAX_MAP_REPLY_BYTES {
            return Err(bad(format!(
                "the pack is {size} bytes, over the {MAX_MAP_REPLY_BYTES}-byte reply limit; narrow the window or use `kshana receiver-trust evidence` on the command line"
            )));
        }
        // The fingerprint the manifest itself states.
        let fingerprint = p
            .files
            .get("manifest.json")
            .and_then(|m| serde_json::from_slice::<serde_json::Value>(m).ok())
            .and_then(|m| m["signer"]["fingerprint"].as_str().map(str::to_string));
        reply(serde_json::json!({
            "files": files,
            "public_key": p.public_key,
            "signer_fingerprint": fingerprint,
            "epochs_in_window": p.epochs_in_window,
            "log_slice_bytes": p.slice.map(|(a, b)| [a, b]),
            "signing_key": if seed.is_some() { "the caller's seed (not returned)" } else { "one-time key, discarded: proves integrity, not identity" },
            "notice": "A pack is a technical record, not a legal opinion, a finding of fact or a certification.",
        }))
    }

    #[tool(
        description = "Verify a signed evidence pack (`kshana evidence verify`): every file's SHA-256 against the manifest, the hash chain, the Ed25519 signature, and with `public_key` (the signer's key, from the signer by another route) that the signer is the one expected, and with `full_log` that the log you hold is the one the pack records and that the slice came from it. Returns the report: `ok`, each failure by code and file, every check, `signer_pinned`, notes, and a `verdict`: `verified` (signer pinned), `intact-signer-not-pinned` (everything checks but no trusted `public_key` was given, so the signature proves only that the pack is intact against the key it names itself, which anyone can generate; say so, do not call it verified) or `failed`, with a `message` to show the user. `require_timestamp` fails a pack that carries no timestamp token. Inputs are capped at 4 MiB. A verified pass says the record is unchanged and who signed it (the key you supplied); it does not say what caused any event, who is responsible, or that the log shows what the receiver really received."
    )]
    fn verify_evidence_pack(
        &self,
        Parameters(r): Parameters<VerifyEvidenceRequest>,
    ) -> Result<CallToolResult, McpError> {
        if r.files.to_string().len() > MAX_UPLOAD_BYTES {
            return Err(bad(format!(
                "files are over the {MAX_UPLOAD_BYTES}-byte limit"
            )));
        }
        if r.full_log
            .as_ref()
            .is_some_and(|l| l.len() > MAX_UPLOAD_BYTES)
        {
            return Err(bad(format!(
                "full_log is over the {MAX_UPLOAD_BYTES}-byte limit"
            )));
        }
        let files = surface::files_from_json(&r.files).map_err(bad)?;
        let report = surface::evidence_verify(
            &files,
            r.public_key.as_deref(),
            r.full_log.as_deref().map(str::as_bytes),
            r.require_timestamp,
        )
        .map_err(bad)?;
        reply(report)
    }

    #[tool(
        description = "Build a GNSS interference map from openly licensed aircraft (ADS-B NIC/NACp) or ship (AIS) position reports given as CSV text (`kshana interference-map adsb|ais`). Returns one GeoJSON document per UTC day (schema kshana-interference-map/v1) (file names `<source>-<dataset>-<date>.geojson`; method version 2) in which each published grid cell is `degraded`, `not_degraded`, `insufficient_sample`, `withheld_day_confounded` or `withheld_no_background` (ADS-B) or `anomalous`/`not_anomalous` (AIS), with the method, its pre-registered thresholds, the dataset licence and attribution embedded. Every per-cell count below the publication minimum (5) is `null` (withheld, never zero), and a day whose background cannot be estimated withholds its calls. Aggregate only: identifiers are hashed in memory and never returned, and a cell with fewer than 5 distinct aircraft or vessels is not published. `dataset` is an approved preset or `custom` (with licence, licence_url, attribution). Input is capped at 4 MiB and the reply at 4 MiB (use a coarser `cell_deg` or the command line for more). Nothing is fetched: land polygons, if wanted for AIS, are passed in. A degraded cell does not identify interference as the cause; an unpublished cell is not evidence of a clear cell; this is not a forecast. Evidence tier: MODELLED."
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

    #[tool(
        description = "Fill the public-framework mapping from Kshana result documents (`kshana compliance-report`): which rows of five resilience frameworks and standards (the US DHS Resilient PNT framework v2.0, IMO guidance for ships, EASA guidance for aviation, NIS2 Article 21, EN 16803) the runs given support evidence for, which they do not, and the gap each row keeps. Pass each run as `label`, `result` (the result JSON text) and, when you have it, `scenario` (the scenario TOML, which names the kind a result does not; a receiver-trust result needs none). At most 64 runs and 4 MiB in all; nothing is read from disk. Each row's `status` is `evidenced`, `partly-evidenced`, `not-evidenced` or `out-of-scope`, and every row keeps its `gap` even when evidenced; inputs that could not be used are listed in `unrecognised` and count for nothing. Show the report's `statement` with any result, verbatim: a status means a run supports evidence for the capabilities the row names; it is not a finding that a framework is met, and it does not mean any product has been rated or approved by anyone. Do not describe the output in any stronger terms. Evidence tier: MODELLED."
    )]
    fn compliance_report(
        &self,
        Parameters(r): Parameters<ComplianceReportRequest>,
    ) -> Result<CallToolResult, McpError> {
        let runs: Vec<surface::ComplianceRunText> = r
            .runs
            .into_iter()
            .map(|x| surface::ComplianceRunText {
                label: x.label,
                result_json: x.result,
                scenario_toml: x.scenario,
            })
            .collect();
        let out = surface::compliance_report(&runs, MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("compliance report failed: {e}")))?;
        let mut v = out.report;
        v["markdown"] = out.markdown.into();
        reply(v)
    }

    #[tool(
        description = "The static public-framework mapping (`kshana compliance-report --mapping` / `--sources`) as Markdown: one table per framework with each row's paraphrased ask, the Kshana outputs that support evidence for it and the gap the outputs do not close; or, with `sources` true, the source documents the tables cite with versions and URLs. Led by the statement every report carries, which stays with any excerpt: a row marked evidenced means a run supports evidence for the capabilities the row names; it is not a finding that a framework is met, and it does not mean any product has been rated or approved by anyone. Needs no runs."
    )]
    fn compliance_mapping(
        &self,
        Parameters(r): Parameters<ComplianceMappingRequest>,
    ) -> Result<CallToolResult, McpError> {
        Ok(CallToolResult::success(vec![ContentBlock::text(
            surface::compliance_mapping(r.sources),
        )]))
    }

    #[tool(
        description = "Export a scenario's vehicle motion and events for a laboratory GNSS simulator (`kshana bench-export`, docs/TEST-BENCH.md): a motion CSV and its JSON description (Earth-fixed and geodetic position, velocity, attitude, UTC), NMEA 0183 GGA/RMC sentences, a waypoint text when the sample grid is millisecond-regular, and the scenario's events as CSV and as `[[events]]` TOML for a `receiver-trust` scenario. Applies to `gnss-ins` (its navigation-state outages are the events), `jamming` and `gnss-sim`; another kind is refused with the reason. `epoch` is the UTC instant of motion time zero, `YYYY-MM-DDTHH:MM:SS` (default 2024-01-01T00:00:00Z). Nothing is written to disk: the first content item is a JSON index (`files` with `suffix`, `bytes`, `sha256`; `notes` on any file left out; `notice`), followed by each file's text in index order. The same scenario and epoch give byte-identical files. NO SIGNAL: nothing exported is, models or drives a radio-frequency or baseband signal, and an event is a labelled interval, not a recipe for producing interference; the simulator and its operator supply the signals and are responsible for running them only where authorised. Keep the notice with the files. Kshana publishes no results from such runs. Evidence tier: MODELLED."
    )]
    fn export_test_bench(
        &self,
        Parameters(r): Parameters<TestBenchRequest>,
    ) -> Result<CallToolResult, McpError> {
        surface::reject_file_sources(&r.toml, MAX_UPLOAD_BYTES)
            .map_err(|e| McpError::invalid_params(e, None))?;
        let e = surface::bench_export(&r.toml, r.epoch.as_deref(), MAX_UPLOAD_BYTES)
            .map_err(|e| bad(format!("test-bench export failed: {e}")))?;
        let index: Vec<serde_json::Value> = e
            .files
            .iter()
            .map(|(suffix, text)| {
                serde_json::json!({
                    "suffix": suffix,
                    "bytes": text.len(),
                    "sha256": kshana::advanced_report::sha256_hex(text.as_bytes()),
                    "encoding": "utf-8",
                })
            })
            .collect();
        let mut contents = vec![ContentBlock::text(
            serde_json::to_string_pretty(&serde_json::json!({
                "files": index,
                "notes": e.notes,
                "notice": surface::BENCH_NOTICE,
            }))
            .unwrap_or_default(),
        )];
        contents.extend(e.files.into_iter().map(|(_, t)| ContentBlock::text(t)));
        Ok(CallToolResult::success(contents))
    }

    #[tool(
        description = "Bind an RFC 3161 timestamp token to an evidence pack (`kshana evidence attach-timestamp`), in memory: `files` is a pack as `create_evidence_pack` returns it, `token_base64` the bytes of the `.tsr` file from a timestamp authority. The token is stored as `timestamp.tsr` beside the signed manifest, not inside it, and the pack with the token must still verify or nothing is attached; an existing token is kept unless `replace` is true. Returns the updated `files` (feed them to `verify_evidence_pack` with `require_timestamp` true to insist the token is present) and the verification notes. This does NOT verify the timestamp authority's signature or certificate chain: say so, and point the user to `openssl ts -verify`. Input and reply are capped at 4 MiB. A timestamp shows a hash existed at a time the authority states; it is not a legal opinion. Evidence tier: MODELLED."
    )]
    fn attach_evidence_timestamp(
        &self,
        Parameters(r): Parameters<AttachTimestampRequest>,
    ) -> Result<CallToolResult, McpError> {
        let files = surface::files_from_json(&r.files).map_err(bad)?;
        let token = kshana::permalink::base64_decode(r.token_base64.trim())
            .ok_or_else(|| bad("token_base64 is not base64".into()))?;
        let t = surface::evidence_attach_timestamp(&files, &token, r.replace, MAX_UPLOAD_BYTES)
            .map_err(bad)?;
        let out = surface::files_to_json(&t.files);
        let size = out.to_string().len();
        if size > MAX_MAP_REPLY_BYTES {
            return Err(bad(format!(
                "the pack is {size} bytes, over the {MAX_MAP_REPLY_BYTES}-byte reply limit"
            )));
        }
        reply(serde_json::json!({
            "files": out,
            "notes": t.notes,
            "notice": "The token sits beside the signed manifest, not inside it, and its authority signature was NOT verified (use `openssl ts -verify`). Verify the pack with require_timestamp to insist on it.",
        }))
    }
}
