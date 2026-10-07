// SPDX-License-Identifier: AGPL-3.0-only
//! The Kshana MCP server: a thin, faithful bridge from the public `kshana` library to MCP
//! tools.
//!
//! Every tool wraps an existing public `kshana` function (most of them in `kshana::api`) —
//! no new simulation logic lives here, so the validated engine is exactly what an agent
//! runs. Tools:
//!
//! - `run_scenario`           — run a scenario TOML, return the summary + full result JSON.
//! - `list_scenario_kinds`    — discover the built-in scenario kinds and their fields.
//! - `validate_scenario`      — classify a scenario TOML (kind detection) without running it.
//! - `list_example_scenarios` — the bundled reference scenarios, each with its kind.
//! - `get_example_scenario`   — the TOML text of one bundled reference scenario.
//! - `report_scenario`        — run a scenario and return its report (JSON or HTML).
//! - `animate_scenario`       — run a scenario and return its time series as an animation.
//! - `list_export_formats`    — which interoperability formats apply to a scenario, and why.
//! - `export_interop`         — export a scenario as CZML, KML, GeoJSON, STK `.e` or SigMF.
//! - `import_route`           — write a GeoJSON route into a track-flying scenario.
//! - `export_sp3`             — export an `orbit` scenario's constellation as SP3-c.
//! - `export_omm`             — export an `orbit` scenario's elements as CCSDS OMM.
//! - `export_oem`             — export an `orbit` scenario's state series as CCSDS OEM.
//! - `export_table_csv`       — run a scenario and return its reproducibility table as CSV.
//! - `assess_receiver_log`    — assess a real GNSS receiver log for trust.
//!
//! The GNSS IQ tools (`iq_signals`, `iq_info`, `iq_scene`, `iq_acquire`, `iq_track`,
//! `iq_frontend`) live in [`crate::iq`], with their file-path and sample-budget contract.

use crate::iq::IqConfig;
use rmcp::handler::server::router::tool::ToolRouter;
use rmcp::handler::server::wrapper::Parameters;
use rmcp::model::{
    CallToolResult, ContentBlock, Implementation, ProtocolVersion, ServerCapabilities, ServerInfo,
};
use rmcp::{ErrorData as McpError, ServerHandler, schemars, tool, tool_handler, tool_router};

/// Parameters for [`KshanaServer::run_scenario`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct RunScenarioRequest {
    /// The scenario definition as a Kshana TOML document. Use `list_scenario_kinds`
    /// to discover the available `kind`s and their required/optional fields.
    pub toml: String,
    /// When true, also return the result chart as an SVG text block. Default false.
    #[serde(default)]
    pub include_chart: bool,
}

/// Parameters for [`KshanaServer::assess_receiver_log`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ReceiverTrustRequest {
    /// A `receiver-trust` scenario as TOML: `[log]` names the receiver log's `format`
    /// (`ubx`, `rinex`, `android` or `nmea`) and gives its bytes inline as `text` or
    /// `base64` (a `path` is read by the server process); optional `[monitors]`,
    /// `[[events]]` and `[compare]` sections state thresholds, known events and
    /// tolerances before the run.
    pub toml: String,
    /// When true, also return the trust chart as an SVG text block. Default false.
    #[serde(default)]
    pub include_chart: bool,
    /// When true, also return the per-epoch trust timeline as CSV. Default false.
    #[serde(default)]
    pub include_csv: bool,
}

/// Parameters for tools that take only a scenario TOML.
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct TomlRequest {
    /// The scenario definition as a Kshana TOML document.
    pub toml: String,
}

/// Parameters for [`KshanaServer::list_example_scenarios`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ListExamplesRequest {
    /// Only list the examples of this scenario kind (a name from `list_scenario_kinds`,
    /// for example `spectrum`, `campaign` or `leo-pass`). Omit it to list every example.
    #[serde(default)]
    pub kind: Option<String>,
}

/// Parameters for [`KshanaServer::get_example_scenario`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ExampleRequest {
    /// The example's name, as `list_example_scenarios` gives it (for example
    /// `l-band-waterfall-jamming`). A trailing `.toml` is accepted.
    pub name: String,
}

/// Parameters for [`KshanaServer::report_scenario`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ReportRequest {
    /// The scenario definition as a Kshana TOML document.
    pub toml: String,
    /// `json` (the default) for the machine-readable report, or `html` for the printable
    /// single-file page. Both carry the same content.
    #[serde(default)]
    pub format: Option<String>,
    /// File name the report cites for the scenario, in its reproduction command and its
    /// title fallback. Default `scenario.toml`.
    #[serde(default)]
    pub scenario_file: Option<String>,
}

/// Parameters for [`KshanaServer::animate_scenario`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct AnimateRequest {
    /// The scenario definition as a Kshana TOML document.
    pub toml: String,
    /// `svg` (the default: one animated SVG, no script), `html` (one self-contained player
    /// page) or `frames` (numbered static SVG frames plus `manifest.json`).
    #[serde(default)]
    pub format: Option<String>,
    /// Frames per second, 1 to 60. Default 12.
    #[serde(default)]
    pub fps: Option<u32>,
    /// Length of one playthrough in seconds, 0.5 to 600. Default 8.
    #[serde(default)]
    pub duration_s: Option<f64>,
    /// Width of the drawing in pixels, 480 to 3840. Default 960.
    #[serde(default)]
    pub width: Option<u32>,
}

/// Parameters for [`KshanaServer::export_interop`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ExportInteropRequest {
    /// The scenario definition as a Kshana TOML document.
    pub toml: String,
    /// One of `czml`, `kml`, `geojson`, `stk` or `sigmf`. `list_export_formats` says which
    /// of them apply to a scenario.
    pub format: String,
}

/// Parameters for [`KshanaServer::import_route`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
pub struct ImportRouteRequest {
    /// The scenario definition as a Kshana TOML document. Its kind must fly a waypoint
    /// track: `terrain-nav`, `terrain-slam`, `gravity-map` or `combined-altpnt`.
    pub toml: String,
    /// The route as GeoJSON text: a `LineString` geometry, or a `Feature` or
    /// `FeatureCollection` holding one.
    pub geojson: String,
}

/// The most frames `animate_scenario` returns for the `frames` format. Every frame is a
/// complete SVG in the reply, so a long sequence is refused with the numbers that fit; the
/// command line (`kshana <scenario.toml> --animate frames`) writes any length to disk.
pub const MAX_FRAMES_IN_REPLY: usize = 120;

/// Standard base64 (RFC 4648, with padding), for the one binary export: the SigMF sample
/// file. Written here so the server gains no dependency for one short function.
fn base64(bytes: &[u8]) -> String {
    const ALPHABET: &[u8; 64] = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    let mut out = String::with_capacity(bytes.len().div_ceil(3) * 4);
    for chunk in bytes.chunks(3) {
        let n = (u32::from(chunk[0]) << 16)
            | (u32::from(*chunk.get(1).unwrap_or(&0)) << 8)
            | u32::from(*chunk.get(2).unwrap_or(&0));
        out.push(ALPHABET[(n >> 18) as usize & 63] as char);
        out.push(ALPHABET[(n >> 12) as usize & 63] as char);
        out.push(if chunk.len() > 1 {
            ALPHABET[(n >> 6) as usize & 63] as char
        } else {
            '='
        });
        out.push(if chunk.len() > 2 {
            ALPHABET[n as usize & 63] as char
        } else {
            '='
        });
    }
    out
}

/// Abbreviations whose full stop does not end a sentence in a scenario header.
const ABBREVIATIONS: [&str; 5] = ["et al", "e.g", "i.e", "vs", "cf"];

/// The first sentence of a scenario file's header comment: what the example shows.
///
/// The header is the first block of `#` lines in the file, which one bundled scenario
/// carries below its `kind` line rather than above it. A full stop that closes one of the
/// [`ABBREVIATIONS`] does not end the sentence, so "Liu et al. 2025" stays whole.
fn first_comment_sentence(toml: &str) -> String {
    let paragraph = toml
        .lines()
        .skip_while(|l| !l.starts_with('#'))
        .map_while(|l| l.strip_prefix('#'))
        .map(str::trim)
        .take_while(|l| !l.is_empty())
        .collect::<Vec<_>>()
        .join(" ");
    let mut from = 0;
    while let Some(i) = paragraph[from..].find(". ") {
        let stop = from + i;
        let before = &paragraph[..stop];
        let abbreviated = ABBREVIATIONS.iter().any(|a| {
            before
                .strip_suffix(a)
                .is_some_and(|head| !head.ends_with(|c: char| c.is_alphanumeric()))
        });
        if !abbreviated {
            return paragraph[..=stop].to_string();
        }
        from = stop + 2;
    }
    paragraph
}

/// The detected kind of a scenario, as the name `list_scenario_kinds` uses.
fn kind_of(toml: &str) -> &'static str {
    kshana::api::ScenarioKind::classify(toml)
        .map(|k| k.as_str())
        .unwrap_or("clock")
}

/// Pretty JSON for a reply block. Serialising a `serde_json::Value` cannot fail; the
/// fallback keeps the signature free of a second error path.
fn pretty(value: &serde_json::Value) -> String {
    serde_json::to_string_pretty(value).unwrap_or_else(|_| value.to_string())
}

/// The scenario kinds whose run publishes a CSV reproducibility table (`RunOutput.csv`),
/// named in `export_table_csv`'s error so an agent can correct course without guessing.
const CSV_TABLE_KINDS: &str = "`realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, \
     `telecom-timing`, `leo-navmsg` (only when its `encode-decode` analysis runs on a \
     `kepler16` or `kepler-rac` message model) and `moonlight-service-volume` (only with \
     `export_site_lat_deg` + `export_site_lon_deg` set)";

/// The Kshana MCP server handle.
#[derive(Clone)]
pub struct KshanaServer {
    // Consumed by the `#[tool_handler]`-generated `ServerHandler` impl; rustc's dead-code
    // pass flags fields only read through a derived trait (here `Clone`), hence the allow.
    #[allow(dead_code)]
    tool_router: ToolRouter<KshanaServer>,
    /// Where the IQ tools may read and write, and their per-call sample budget.
    pub(crate) iq: IqConfig,
}

impl Default for KshanaServer {
    fn default() -> Self {
        Self::new()
    }
}

#[tool_router]
impl KshanaServer {
    /// Construct the server with its generated tool router, taking the IQ work directory
    /// and sample budget from the environment ([`IqConfig::from_env`]).
    pub fn new() -> Self {
        Self::with_iq_config(IqConfig::from_env())
    }

    /// Construct the server with an explicit IQ configuration.
    pub fn with_iq_config(iq: IqConfig) -> Self {
        Self {
            tool_router: Self::tool_router() + Self::iq_tool_router(),
            iq,
        }
    }

    #[tool(
        description = "Run a Kshana PNT-resilience scenario from a TOML definition and return its figures of merit. Returns the human-readable summary followed by the full result JSON (FoMs, curves). Kshana validates SGP4/SDP4, IAU reference frames, Allan deviations, GNSS availability/DOP, ARAIM protection levels, GNSS/INS fusion, and quantum-sensor models against published references. Every kind runs through this one tool, including `spectrum` (radio-frequency spectrum and waterfall), `solar-system`, `constellation-design` and `body-pnt` (constellations around any body), `campaign` (chained phases, parameter sweeps, Monte Carlo ensembles and composed scenarios) and the low-Earth-orbit navigation kinds `leo-signal`, `leo-pass`, `leo-navmsg`, `leo-pvt`, `leo-ppp`, `ntn-positioning` and `leo-pnt-chain`. Call list_scenario_kinds first to discover scenario types and their fields, and list_example_scenarios / get_example_scenario for a complete runnable scenario of a kind."
    )]
    fn run_scenario(
        &self,
        Parameters(RunScenarioRequest {
            toml,
            include_chart,
        }): Parameters<RunScenarioRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::run_toml(&toml) {
            Ok(out) => {
                let mut contents = vec![
                    ContentBlock::text(out.summary),
                    ContentBlock::text(out.json),
                ];
                if include_chart {
                    contents.push(ContentBlock::text(out.svg));
                }
                Ok(CallToolResult::success(contents))
            }
            Err(e) => Err(McpError::invalid_params(
                format!("scenario run failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "List every built-in Kshana scenario kind with its description and required/optional TOML fields, as a JSON array. Use this to discover what scenarios can be run and how to construct a valid scenario TOML for run_scenario."
    )]
    fn list_scenario_kinds(&self) -> Result<CallToolResult, McpError> {
        Ok(CallToolResult::success(vec![ContentBlock::text(
            kshana::api::list_scenario_kinds_json(),
        )]))
    }

    #[tool(
        description = "Pre-flight check of a Kshana scenario TOML: verify it parses as TOML and detect its scenario kind, without running it. Returns the detected kind, or a descriptive error for malformed TOML. (run_scenario performs the full validation by executing the scenario.)"
    )]
    fn validate_scenario(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        // `classify` is permissive by design (unknown/unparseable input falls back to the
        // clock pack), so do a strict TOML parse here to actually catch malformed input.
        if let Err(e) = toml::from_str::<toml::Value>(&toml) {
            return Err(McpError::invalid_params(format!("invalid TOML: {e}"), None));
        }
        let kind = kind_of(&toml);
        Ok(CallToolResult::success(vec![ContentBlock::text(format!(
            "valid: detected scenario kind `{kind}`"
        ))]))
    }

    #[tool(
        description = "Assess a real GNSS receiver log for trust: read a u-blox UBX, RINEX 3 (optionally with broadcast navigation, which adds the engine's own fix, RAIM and a clock-aided monitor), Android GnssLogger or NMEA log, run the trust monitors (carrier-to-noise density drop, AGC, jamming indicator, loss of lock, position jump, RAIM, clock) against a calibration baseline, and return when and why the receiver stopped being trustworthy. Optional `[[events]]` with onsets and predicted C/N0 drops are scored against tolerances stated in the scenario: detected, late or missed, and agree or disagree. Returns the summary and the full result JSON (chart and CSV on request). The log's bytes go inline in the TOML as `text` or `base64`."
    )]
    fn assess_receiver_log(
        &self,
        Parameters(ReceiverTrustRequest {
            toml,
            include_chart,
            include_csv,
        }): Parameters<ReceiverTrustRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::receiver_trust::scenario::run_toml(&toml) {
            Ok(out) => {
                let mut contents = vec![
                    ContentBlock::text(out.summary),
                    ContentBlock::text(out.json),
                ];
                if include_chart {
                    contents.push(ContentBlock::text(out.svg));
                }
                if include_csv {
                    contents.push(ContentBlock::text(out.csv));
                }
                Ok(CallToolResult::success(contents))
            }
            Err(e) => Err(McpError::invalid_params(
                format!("receiver log assessment failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "List the bundled reference scenarios as JSON: `count`, and `scenarios`, an array of `name`, `kind` and `about` (the first sentence of the file's own header comment). Every one is a complete scenario that runs as it stands, so this is the quickest way to a valid TOML for a kind: pick a name, fetch it with get_example_scenario, edit it, run it. Pass `kind` to list only the examples of one kind (for example `spectrum`, `solar-system`, `constellation-design`, `campaign`, `leo-signal`, `leo-pass`, `leo-navmsg`, `leo-pvt`)."
    )]
    fn list_example_scenarios(
        &self,
        Parameters(ListExamplesRequest { kind }): Parameters<ListExamplesRequest>,
    ) -> Result<CallToolResult, McpError> {
        let wanted = kind.as_deref().map(str::trim).filter(|k| !k.is_empty());
        if let Some(k) = wanted
            && !kshana::api::list_scenario_kinds()
                .iter()
                .any(|m| m.name == k)
        {
            return Err(McpError::invalid_params(
                format!("unknown scenario kind `{k}`; list_scenario_kinds names every kind"),
                None,
            ));
        }
        let scenarios: Vec<serde_json::Value> = kshana::bundled_scenarios::BUNDLED
            .iter()
            .map(|(name, toml)| (*name, kind_of(toml), *toml))
            .filter(|(_, k, _)| wanted.is_none_or(|w| w == *k))
            .map(|(name, k, toml)| {
                serde_json::json!({
                    "name": name,
                    "kind": k,
                    "about": first_comment_sentence(toml),
                })
            })
            .collect();
        Ok(CallToolResult::success(vec![ContentBlock::text(pretty(
            &serde_json::json!({ "count": scenarios.len(), "scenarios": scenarios }),
        ))]))
    }

    #[tool(
        description = "Return the TOML text of one bundled reference scenario, byte for byte the file the repository ships under `scenarios/`. Pass the text (edited or not) to run_scenario, report_scenario, animate_scenario or an export tool. Names come from list_example_scenarios. A scenario that exists in the repository but is not bundled is refused with the reason."
    )]
    fn get_example_scenario(
        &self,
        Parameters(ExampleRequest { name }): Parameters<ExampleRequest>,
    ) -> Result<CallToolResult, McpError> {
        let name = name.trim();
        if let Some(toml) = kshana::bundled_scenarios::get(name) {
            return Ok(CallToolResult::success(vec![ContentBlock::text(toml)]));
        }
        let message = match kshana::bundled_scenarios::repo_only_reason(name) {
            Some(why) => format!("`{name}` is not bundled: it {why}"),
            None => format!(
                "no bundled scenario named `{name}`; list_example_scenarios lists the {} that are",
                kshana::bundled_scenarios::BUNDLED.len()
            ),
        };
        Err(McpError::invalid_params(message, None))
    }

    #[tool(
        description = "Run a Kshana scenario and return its report: an executive summary, the inputs, every result figure with its unit and its VALIDATED or MODELLED label, the events, the capability rows the run exercised, and a reproducibility record (engine version, scenario and result SHA-256 digests, seed, the command that reproduces it). `format` is `json` (default; the machine-readable `report.json`) or `html` (the printable, self-contained `report.html` with the chart embedded). A campaign's report also carries its sweep table or Monte Carlo distribution. The report is a pure function of the scenario: no clock is read."
    )]
    fn report_scenario(
        &self,
        Parameters(ReportRequest {
            toml,
            format,
            scenario_file,
        }): Parameters<ReportRequest>,
    ) -> Result<CallToolResult, McpError> {
        let format = format
            .as_deref()
            .map(|f| f.trim().to_ascii_lowercase())
            .unwrap_or_else(|| "json".to_string());
        if format != "json" && format != "html" {
            return Err(McpError::invalid_params(
                format!("unknown report format `{format}`; expected json or html"),
                None,
            ));
        }
        let out = kshana::api::run_toml(&toml)
            .map_err(|e| McpError::invalid_params(format!("scenario run failed: {e}"), None))?;
        let invocation = kshana::advanced_report::Invocation {
            scenario_arg: scenario_file
                .as_deref()
                .map(str::trim)
                .filter(|f| !f.is_empty())
                .unwrap_or("scenario.toml")
                .to_string(),
            ..Default::default()
        };
        let report = kshana::advanced_report::build(&out, &toml, &invocation)
            .map_err(|e| McpError::invalid_params(format!("report failed: {e}"), None))?;
        let text = if format == "html" {
            report.to_html(&out.svg)
        } else {
            report.to_json()
        };
        Ok(CallToolResult::success(vec![ContentBlock::text(text)]))
    }

    #[tool(
        description = "Run a Kshana scenario and return its time series as an animation. `format` is `svg` (default: one animated SVG, no script), `html` (one self-contained player page) or `frames` (numbered static SVG frames plus `manifest.json`, at most 120 frames in a reply). Optional `fps` (1 to 60, default 12), `duration_s` (0.5 to 600, default 8) and `width` (480 to 3840 pixels, default 960). The first content item is a JSON summary of what was drawn: the time range and unit, the chart titles, the number of phases and events, whether a spectrum waterfall is present, the result paths the traces were read from, any series left out, and the file names. The files follow, one content item each, in the order the summary's `files` lists them. A kind whose result has no sampled time axis is refused with a message that says so. The animation is MODELLED presentation of the run's own numbers; the same scenario and options give byte-identical files."
    )]
    fn animate_scenario(
        &self,
        Parameters(AnimateRequest {
            toml,
            format,
            fps,
            duration_s,
            width,
        }): Parameters<AnimateRequest>,
    ) -> Result<CallToolResult, McpError> {
        use kshana::animation::{AnimationFormat, AnimationOptions};
        let bad = |m: String| McpError::invalid_params(format!("animation failed: {m}"), None);
        let format = AnimationFormat::parse(format.as_deref().unwrap_or("svg")).map_err(bad)?;
        let mut opts = AnimationOptions::default();
        if let Some(n) = fps {
            opts.fps = n;
        }
        if let Some(d) = duration_s {
            opts.duration_s = d;
        }
        if let Some(w) = width {
            opts.width = w;
        }
        // Checked before the run, so a bad option costs nothing.
        opts.validate().map_err(bad)?;
        if format == AnimationFormat::Frames && opts.frame_count() > MAX_FRAMES_IN_REPLY {
            return Err(bad(format!(
                "duration_s x fps gives {} frames and a reply carries at most \
                 {MAX_FRAMES_IN_REPLY}; lower fps or duration_s, or write a longer sequence \
                 with the command line (`kshana <scenario.toml> --animate frames`)",
                opts.frame_count()
            )));
        }
        let kind = kind_of(&toml);
        let out = kshana::api::run_toml(&toml)
            .map_err(|e| McpError::invalid_params(format!("scenario run failed: {e}"), None))?;
        let animation = kshana::animation::animate_result(&out.json, Some(kind), format, &opts)
            .map_err(|e| bad(e.to_string()))?;
        let names: Vec<String> = animation.files.iter().map(|f| f.name.clone()).collect();
        let summary =
            kshana::animation::animation_meta(&out.json, Some(kind), &[format], &opts, &names)
                .map_err(|e| bad(e.to_string()))?;
        let mut contents = vec![ContentBlock::text(pretty(&summary))];
        contents.extend(
            animation
                .files
                .into_iter()
                .map(|f| ContentBlock::text(f.content)),
        );
        Ok(CallToolResult::success(contents))
    }

    #[tool(
        description = "Report which interoperability export formats apply to a Kshana scenario, without running it: a JSON array with one entry per format (`czml`, `kml`, `geojson`, `stk`, `sigmf`) giving `applies`, the `reason` when it does not, and `spec_url`, the published specification the writer follows. CZML (Cesium Language), KML (Keyhole Markup Language), GeoJSON and the STK (Systems Tool Kit) ephemeris `.e` describe the scenario's geometry; SigMF (Signal Metadata Format) records the samples a `spectrum` scenario with an `[iq]` block synthesises. Call this before export_interop."
    )]
    fn list_export_formats(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        if let Err(e) = toml::from_str::<toml::Value>(&toml) {
            return Err(McpError::invalid_params(format!("invalid TOML: {e}"), None));
        }
        let rows: Vec<serde_json::Value> = kshana::interop::plan(&toml)
            .into_iter()
            .map(|(format, outcome)| {
                serde_json::json!({
                    "format": format.as_str(),
                    "applies": outcome.is_ok(),
                    "reason": outcome.err(),
                    "spec_url": format.spec_url(),
                })
            })
            .collect();
        Ok(CallToolResult::success(vec![ContentBlock::text(pretty(
            &serde_json::Value::Array(rows),
        ))]))
    }

    #[tool(
        description = "Export a Kshana scenario in one interoperability format: `czml` (Cesium Language, for CesiumJS), `kml` (Keyhole Markup Language, for Google Earth and geographic information system tools), `geojson` (RFC 7946), `stk` (Systems Tool Kit ephemeris `.e`, one file per satellite) or `sigmf` (Signal Metadata Format recording of a `spectrum` scenario's synthesised samples). The first content item is a JSON index: `format`, `spec_url` and `files`, each with its `suffix` (what the command line appends to the output name, for example `.czml` or `.G01.e`), `bytes`, `sha256` and `encoding`. The files follow, one content item each, in index order: `utf-8` files as their text, the binary SigMF sample file as `base64`. A campaign exports each member scenario the format applies to. A format that does not apply is refused with the reason; list_export_formats reports all five at once. Times are Coordinated Universal Time (UTC); the same scenario gives byte-identical files."
    )]
    fn export_interop(
        &self,
        Parameters(ExportInteropRequest { toml, format }): Parameters<ExportInteropRequest>,
    ) -> Result<CallToolResult, McpError> {
        let bad = |m: String| McpError::invalid_params(format!("export failed: {m}"), None);
        let fmt = kshana::interop::Format::parse(format.trim()).map_err(|_| {
            bad(format!(
                "unknown export format `{}`; expected one of czml, kml, geojson, stk or sigmf",
                format.trim()
            ))
        })?;
        let files = kshana::interop::export(&toml, fmt)
            .map_err(|e| bad(format!("{}: {e}", fmt.as_str())))?;
        let mut index = Vec::with_capacity(files.len());
        let mut bodies = Vec::with_capacity(files.len());
        for file in files {
            let sha256 = kshana::advanced_report::sha256_hex(&file.bytes);
            let bytes = file.bytes.len();
            let (encoding, body) = match String::from_utf8(file.bytes) {
                Ok(text) => ("utf-8", text),
                Err(e) => ("base64", base64(e.as_bytes())),
            };
            index.push(serde_json::json!({
                "suffix": file.suffix,
                "bytes": bytes,
                "sha256": sha256,
                "encoding": encoding,
            }));
            bodies.push(ContentBlock::text(body));
        }
        let mut contents = vec![ContentBlock::text(pretty(&serde_json::json!({
            "format": fmt.as_str(),
            "spec_url": fmt.spec_url(),
            "files": index,
        })))];
        contents.extend(bodies);
        Ok(CallToolResult::success(contents))
    }

    #[tool(
        description = "Write a GeoJSON route into a Kshana scenario that flies a waypoint track, and return the new scenario TOML (run it with run_scenario). The route is a `LineString` (or a `Feature` / `FeatureCollection` holding one) of longitude, latitude positions; it replaces the scenario's `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg` and `waypoints`. The kinds that take a route are `terrain-nav`, `terrain-slam`, `gravity-map` and `combined-altpnt`; any other kind is refused with the reason. Give the two ends of the track, or evenly spaced positions along a straight line: the track kinds fly start + i*step, so any other shape is refused."
    )]
    fn import_route(
        &self,
        Parameters(ImportRouteRequest { toml, geojson }): Parameters<ImportRouteRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::interop::geojson::apply_route(&toml, &geojson) {
            Ok(merged) => Ok(CallToolResult::success(vec![ContentBlock::text(merged)])),
            Err(e) => Err(McpError::invalid_params(
                format!("route import failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "Export an `orbit` scenario's propagated constellation as SP3-c precise-ephemeris text (the standard GNSS post-processing format). Errors if the scenario is not an orbit kind."
    )]
    fn export_sp3(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::export_sp3(&toml) {
            Ok(sp3) => Ok(CallToolResult::success(vec![ContentBlock::text(sp3)])),
            Err(e) => Err(McpError::invalid_params(
                format!("SP3 export failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "Export an `orbit` scenario's mean elements as a CCSDS 502.0-B-2 OMM (Orbit Mean-Elements Message) catalogue — one OMM per satellite. Errors if the scenario is not an orbit kind."
    )]
    fn export_omm(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::export_omm(&toml) {
            Ok(omm) => Ok(CallToolResult::success(vec![ContentBlock::text(omm)])),
            Err(e) => Err(McpError::invalid_params(
                format!("OMM export failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "Export an `orbit` scenario's propagated constellation as CCSDS OEM 2.0 ephemeris text — the inertial (TEME) state time series carrying position AND velocity, which flight-dynamics tools (GMAT / Orekit / STK) read. This is the velocity-carrying complement of the position-only `export_sp3`. Errors if the scenario is not an orbit kind."
    )]
    fn export_oem(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        match kshana::api::export_oem(&toml) {
            Ok(oem) => Ok(CallToolResult::success(vec![ContentBlock::text(oem)])),
            Err(e) => Err(McpError::invalid_params(
                format!("OEM export failed: {e}"),
                None,
            )),
        }
    }

    #[tool(
        description = "Run a Kshana scenario and return its reproducibility table as CSV text — the byte-stable table the CLI writes as `<scenario>.table.csv` and the papers cite. Only these kinds emit one: `realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, `telecom-timing`, `leo-navmsg` when its `encode-decode` analysis runs on a `kepler16` or `kepler-rac` message model (the broadcast ephemeris table), and `moonlight-service-volume` when both `export_site_lat_deg` and `export_site_lon_deg` are set. Errors for any other kind (or an invalid scenario); use run_scenario for the figures of merit."
    )]
    fn export_table_csv(
        &self,
        Parameters(TomlRequest { toml }): Parameters<TomlRequest>,
    ) -> Result<CallToolResult, McpError> {
        let out = kshana::api::run_toml(&toml)
            .map_err(|e| McpError::invalid_params(format!("scenario run failed: {e}"), None))?;
        match out.csv {
            Some(csv) => Ok(CallToolResult::success(vec![ContentBlock::text(csv)])),
            None => {
                let kind = kind_of(&toml);
                Err(McpError::invalid_params(
                    format!(
                        "scenario kind `{kind}` publishes no CSV table; only {CSV_TABLE_KINDS} do"
                    ),
                    None,
                ))
            }
        }
    }
}

#[tool_handler]
impl ServerHandler for KshanaServer {
    fn get_info(&self) -> ServerInfo {
        // Set the identity explicitly: rmcp's `Implementation::from_build_env()` reports
        // `env!("CARGO_CRATE_NAME")` from *within rmcp* (i.e. "rmcp"), not this crate.
        // `Implementation` is #[non_exhaustive], so mutate a default instance.
        let mut info = Implementation::default();
        info.name = "kshana-mcp".to_string();
        info.version = env!("CARGO_PKG_VERSION").to_string();
        info.title = Some("Kshana PNT-resilience simulator".to_string());
        info.description = Some(
            "MCP access to the validated Kshana positioning/navigation/timing simulator."
                .to_string(),
        );
        info.website_url = Some("https://kshana.dev".to_string());
        ServerInfo::new(ServerCapabilities::builder().enable_tools().build())
            .with_server_info(info)
            // Advertise the newest protocol revision the linked `rmcp` supports, so this
            // tracks forward automatically on every SDK bump; rmcp negotiates down to an
            // older client's revision during `initialize` (all are in `KNOWN_VERSIONS`).
            .with_protocol_version(ProtocolVersion::LATEST)
            .with_instructions(
                "Kshana is an open, reproducible PNT (positioning/navigation/timing) resilience \
                 simulator. Each tool wraps the validated engine: run_scenario executes a \
                 scenario TOML and returns figures of merit; list_scenario_kinds enumerates the \
                 scenario types and their fields; list_example_scenarios and \
                 get_example_scenario hand over a complete runnable scenario of a kind; \
                 validate_scenario checks a TOML; report_scenario returns the run's report \
                 (figures with units and VALIDATED or MODELLED labels, and a reproducibility \
                 record); animate_scenario returns the run's time series as an animation; \
                 list_export_formats and export_interop write the scenario's geometry as \
                 CZML, KML, GeoJSON or STK ephemeris, or a spectrum scenario's samples as \
                 SigMF; import_route writes a GeoJSON route into a track-flying scenario; \
                 export_sp3 / export_omm / export_oem emit standard GNSS/CCSDS products from \
                 an orbit scenario (export_oem is the one carrying velocity); export_table_csv \
                 returns the CSV reproducibility table for the kinds that publish one; \
                 assess_receiver_log assesses a real receiver log for trust. The GNSS IQ \
                 tools (iq_signals first, then iq_info, iq_scene, iq_acquire, iq_track and \
                 iq_frontend) generate and process signal-level IQ recordings as FILES in a \
                 configured work directory: pass paths relative to it; samples never travel \
                 through the protocol, and replies are compact JSON summaries. Spectrum \
                 and waterfall, solar-system, constellation-design, campaign and the \
                 low-Earth-orbit navigation kinds all run through run_scenario. Construct \
                 scenarios from list_scenario_kinds metadata or from a bundled example; do \
                 not invent fields. A required_fields entry is usually one key; `a|b` means \
                 at least one of them and `a+b` means all of them together (e.g. \
                 `tle|orbit+epoch`)."
                    .to_string(),
            )
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The test vectors of RFC 4648, section 10.
    #[test]
    fn base64_matches_the_rfc_4648_vectors() {
        for (plain, encoded) in [
            ("", ""),
            ("f", "Zg=="),
            ("fo", "Zm8="),
            ("foo", "Zm9v"),
            ("foob", "Zm9vYg=="),
            ("fooba", "Zm9vYmE="),
            ("foobar", "Zm9vYmFy"),
        ] {
            assert_eq!(base64(plain.as_bytes()), encoded);
        }
        assert_eq!(base64(&[0xfb, 0xff, 0xfe]), "+//+");
    }

    #[test]
    fn the_first_comment_sentence_is_the_header_up_to_its_first_full_stop() {
        let toml = "# A chained mission: nominal, jamming and\n# recovery. More detail.\n#\n# Second paragraph.\nkind = \"campaign\"\n";
        assert_eq!(
            first_comment_sentence(toml),
            "A chained mission: nominal, jamming and recovery."
        );
        assert_eq!(first_comment_sentence("kind = \"ephemeris\"\n"), "");
    }

    /// A header below the `kind` line is still the header, and the full stop of an
    /// abbreviation does not cut the sentence short.
    #[test]
    fn the_first_comment_sentence_finds_a_late_header_and_keeps_abbreviations_whole() {
        let late =
            "kind = \"ephemeris\"\n\n# Ephemeris and ground track. More detail.\nstep_s = 30\n";
        assert_eq!(first_comment_sentence(late), "Ephemeris and ground track.");
        let cited = "# Four models, and the Liu et al. 2025\n# table. More detail.\n";
        assert_eq!(
            first_comment_sentence(cited),
            "Four models, and the Liu et al. 2025 table."
        );
        // Only a whole abbreviation is skipped: a word that merely ends in one is not.
        assert_eq!(
            first_comment_sentence("# Two receivers vs. one jammer. More.\n"),
            "Two receivers vs. one jammer."
        );
        assert_eq!(first_comment_sentence("# It revs. More.\n"), "It revs.");
    }
}
