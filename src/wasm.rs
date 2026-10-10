// SPDX-License-Identifier: AGPL-3.0-only
//! WebAssembly bindings (wasm-bindgen), built with the `wasm` feature.
//!
//! ```js
//! import init, { run, version } from "./pkg/kshana.js";
//! await init();
//! const result = JSON.parse(run(tomlText));
//! console.log(version(), result.quantum.fom.integrity);
//! ```

use wasm_bindgen::prelude::*;

/// Run a scenario given as a TOML string; returns the result document as a JSON
/// string. Throws a JS error if the scenario is invalid.
#[wasm_bindgen]
pub fn run(toml: &str) -> Result<String, JsValue> {
    crate::api::run_toml(toml)
        .map(|o| o.json)
        .map_err(|e| JsValue::from_str(&e))
}

/// Run a scenario and return its SVG chart.
#[wasm_bindgen]
pub fn chart_svg(toml: &str) -> Result<String, JsValue> {
    crate::api::run_toml(toml)
        .map(|o| o.svg)
        .map_err(|e| JsValue::from_str(&e))
}

/// Run a scenario and return its one-line human-readable summary.
#[wasm_bindgen]
pub fn summary(toml: &str) -> Result<String, JsValue> {
    crate::api::run_toml(toml)
        .map(|o| o.summary)
        .map_err(|e| JsValue::from_str(&e))
}

/// Run a scenario and return its reproducibility table as CSV text — the same bytes the
/// CLI writes as `<scenario>.table.csv`. Returns `undefined` for kinds that publish no
/// table (only `realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, and
/// `moonlight-service-volume` with an export site configured emit one). Throws a JS error
/// if the scenario is invalid.
#[wasm_bindgen]
pub fn table_csv(toml: &str) -> Result<Option<String>, JsValue> {
    crate::api::run_toml(toml)
        .map(|o| o.csv)
        .map_err(|e| JsValue::from_str(&e))
}

/// Run a scenario ONCE and return every output of that run as a JSON object string:
/// `{"json": <result document string>, "svg": <chart>, "summary": <one line>,
/// "csv": <table or null>}`. `run`, `chart_svg`, `summary` and `table_csv` each execute
/// the scenario from scratch, so a page that wants all four paid for four full engine
/// runs — about 12 s instead of 3 s for the heaviest kind in a browser. Throws a JS
/// error if the scenario is invalid.
#[wasm_bindgen]
pub fn run_all(toml: &str) -> Result<String, JsValue> {
    let o = crate::api::run_toml(toml).map_err(|e| JsValue::from_str(&e))?;
    Ok(serde_json::json!({
        "json": o.json,
        "svg": o.svg,
        "summary": o.summary,
        "csv": o.csv,
    })
    .to_string())
}

/// List the available scenario kinds and their metadata as a JSON array (name,
/// description, required and optional fields), for programmatic introspection.
#[wasm_bindgen]
pub fn list_kinds() -> String {
    crate::api::list_scenario_kinds_json()
}

/// Run a scenario; on failure return the structured error *kind* tag
/// (`invalid_input`, `unsupported`, …) so the caller can branch on the failure
/// category rather than parse the message. Returns an empty string on success.
#[wasm_bindgen]
pub fn error_kind(toml: &str) -> String {
    crate::api::run_scenario(toml)
        .err()
        .map(|e| e.kind_tag().to_string())
        .unwrap_or_default()
}

/// Engine version (the crate version).
#[wasm_bindgen]
pub fn version() -> String {
    env!("CARGO_PKG_VERSION").to_string()
}

/// Encode a scenario TOML into a URL-safe permalink token for a `?s=` query parameter.
#[wasm_bindgen]
pub fn encode_permalink(toml: &str) -> String {
    crate::permalink::encode_scenario(toml)
}

/// Decode a permalink token back into the scenario TOML; returns an empty string if the
/// token is not valid Base64 or not valid UTF-8.
#[wasm_bindgen]
pub fn decode_permalink(token: &str) -> String {
    crate::permalink::decode_scenario(token).unwrap_or_default()
}

/// Export a propagated constellation scenario as an **SP3-c** precise-ephemeris string
/// (the same artifact the CLI `--export-sp3` flag writes). Pure client-side; nothing is
/// uploaded. Throws a JS error if the scenario cannot produce an SP3 (e.g. a non-orbit kind).
#[wasm_bindgen]
pub fn export_sp3(toml: &str) -> Result<String, JsValue> {
    crate::api::export_sp3(toml).map_err(|e| JsValue::from_str(&e))
}

/// Export a constellation's mean elements as a **CCSDS OMM** catalogue string (one OMM
/// message per TLE-defined satellite; the CLI `--export-omm` artifact). Pure client-side.
#[wasm_bindgen]
pub fn export_omm(toml: &str) -> Result<String, JsValue> {
    crate::api::export_omm(toml).map_err(|e| JsValue::from_str(&e))
}

/// Export the velocity-carrying state as a **CCSDS OEM 2.0** ephemeris string for
/// flight-dynamics tools (GMAT / Orekit / STK; the CLI `--export-oem` artifact). Pure
/// client-side.
#[wasm_bindgen]
pub fn export_oem(toml: &str) -> Result<String, JsValue> {
    crate::api::export_oem(toml).map_err(|e| JsValue::from_str(&e))
}

/// Assess a real receiver log described by a `receiver-trust` scenario (TOML text). The
/// browser has no file system, so the log (and any navigation file) must be inline as
/// `text` or `base64`. Returns a JSON object `{json, csv, svg, summary}`.
#[wasm_bindgen]
pub fn receiver_trust(toml: &str) -> Result<String, JsValue> {
    let o = crate::receiver_trust::scenario::run_toml(toml).map_err(|e| JsValue::from_str(&e))?;
    Ok(serde_json::json!({
        "json": o.json,
        "csv": o.csv,
        "svg": o.svg,
        "summary": o.summary,
    })
    .to_string())
}

/// Which interoperability formats apply to a scenario, without running it: a JSON array of
/// `{format, applies, reason, spec_url}` for `czml`, `kml`, `geojson`, `stk` and `sigmf`.
#[wasm_bindgen]
pub fn export_formats(toml: &str) -> Result<String, JsValue> {
    crate::surface::export_formats(toml, crate::surface::MAX_INPUT_BYTES)
        .map(|v| v.to_string())
        .map_err(|e| JsValue::from_str(&e))
}

/// Export a scenario in one interoperability format (`czml`, `kml`, `geojson`, `stk` or
/// `sigmf`), in memory. Returns JSON `{format, spec_url, files}`; each file is `{suffix, bytes,
/// sha256, encoding, content}` with `encoding` `"utf-8"` (the text) or `"base64"` (a binary
/// file). Times are UTC; the same scenario gives byte-identical files. Nothing is uploaded.
#[wasm_bindgen]
pub fn export_scenario(toml: &str, format: &str) -> Result<String, JsValue> {
    crate::surface::export_scenario(toml, format, crate::surface::MAX_INPUT_BYTES)
        .map(|e| e.to_json().to_string())
        .map_err(|e| JsValue::from_str(&e))
}

/// Write a GeoJSON route into a scenario of a kind that flies a waypoint track and return the
/// new TOML (the command line's `--import-route`).
#[wasm_bindgen]
pub fn import_route(toml: &str, geojson: &str) -> Result<String, JsValue> {
    crate::surface::import_route(toml, geojson, crate::surface::MAX_INPUT_BYTES)
        .map_err(|e| JsValue::from_str(&e))
}

/// Run a scenario and return its time series as an animation. `format` is `svg`, `html` or
/// `frames` (empty for `svg`); `fps` 0, `duration_s` NaN and `width` 0 mean the defaults (12,
/// 8 s, 960 px). Returns JSON `{summary, files: {name: text}}`; a kind with no sampled time
/// axis throws. Nothing is uploaded or written.
#[wasm_bindgen]
pub fn animate_scenario(
    toml: &str,
    format: &str,
    fps: u32,
    duration_s: f64,
    width: u32,
) -> Result<String, JsValue> {
    let a = crate::surface::animate_scenario(
        toml,
        (!format.is_empty()).then_some(format),
        (fps != 0).then_some(fps),
        (!duration_s.is_nan()).then_some(duration_s),
        (width != 0).then_some(width),
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    let files: serde_json::Map<String, serde_json::Value> =
        a.files.into_iter().map(|(k, v)| (k, v.into())).collect();
    Ok(serde_json::json!({"summary": a.summary, "files": files}).to_string())
}

/// The bundled reference scenarios as JSON `{count, scenarios: [{name, kind, about}]}`; a
/// non-empty `kind` limits the list to one scenario kind.
#[wasm_bindgen]
pub fn list_examples(kind: &str) -> Result<String, JsValue> {
    crate::surface::list_examples((!kind.is_empty()).then_some(kind))
        .map(|v| v.to_string())
        .map_err(|e| JsValue::from_str(&e))
}

/// The TOML text of one bundled reference scenario, byte for byte the repository's file.
#[wasm_bindgen]
pub fn get_example(name: &str) -> Result<String, JsValue> {
    crate::surface::get_example(name)
        .map(str::to_string)
        .map_err(|e| JsValue::from_str(&e))
}

/// Bind an RFC 3161 timestamp token to an evidence pack, in memory. `files_json` is the pack's
/// files as JSON (name to text or `{"base64": ...}`); `token_base64` is the `.tsr` file's bytes
/// as base64; `replace` allows replacing an existing token. The pack with the token must still
/// verify or this throws. Returns JSON `{files, notes}`. This does NOT verify the timestamp
/// authority's signature or certificate chain (use `openssl ts -verify`). Nothing is uploaded.
#[wasm_bindgen]
pub fn evidence_attach_timestamp(
    files_json: &str,
    token_base64: &str,
    replace: bool,
) -> Result<String, JsValue> {
    let v: serde_json::Value = serde_json::from_str(files_json)
        .map_err(|e| JsValue::from_str(&format!("files_json is not JSON: {e}")))?;
    let files = crate::surface::files_from_json(&v).map_err(|e| JsValue::from_str(&e))?;
    let token = crate::permalink::base64_decode(token_base64.trim())
        .ok_or_else(|| JsValue::from_str("token_base64 is not base64"))?;
    let t = crate::surface::evidence_attach_timestamp(
        &files,
        &token,
        replace,
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    Ok(
        serde_json::json!({"files": crate::surface::files_to_json(&t.files), "notes": t.notes})
            .to_string(),
    )
}

/// Export a scenario's vehicle motion and events for a laboratory GNSS simulator
/// (`docs/TEST-BENCH.md`), in memory: nothing is uploaded or written. `epoch` is the UTC
/// instant of motion time zero, `YYYY-MM-DDTHH:MM:SS` with an optional `Z` (empty for the
/// default 2024-01-01T00:00:00Z). Returns JSON `{files: {suffix: text}, notes, notice}`; keep
/// `notice` with the files. No radio-frequency or baseband signal is written.
#[wasm_bindgen]
pub fn bench_export(toml: &str, epoch: &str) -> Result<String, JsValue> {
    use crate::surface::{BENCH_NOTICE, MAX_INPUT_BYTES};
    let e =
        crate::surface::bench_export(toml, (!epoch.is_empty()).then_some(epoch), MAX_INPUT_BYTES)
            .map_err(|e| JsValue::from_str(&e))?;
    let files: serde_json::Map<String, serde_json::Value> =
        e.files.into_iter().map(|(k, v)| (k, v.into())).collect();
    Ok(serde_json::json!({"files": files, "notes": e.notes, "notice": BENCH_NOTICE}).to_string())
}

/// Fill the public-framework mapping from result documents: which rows of five resilience
/// frameworks and standards (`docs/compliance/`) the runs support evidence for, which they
/// do not, and the gap each row keeps. `runs_json` is a JSON array of `{label, result,
/// scenario?}` where `result` is the result JSON text and `scenario` the scenario TOML text
/// (it names the scenario kind a result does not); at most 64 runs. Returns JSON
/// `{report, markdown}`. The report carries `statement` verbatim: a status says the runs
/// support evidence for a row's capabilities, not that a framework is met. Nothing is
/// uploaded or read from disk.
#[wasm_bindgen]
pub fn compliance_report(runs_json: &str) -> Result<String, JsValue> {
    use crate::surface::{ComplianceRunText, MAX_INPUT_BYTES};
    let v: serde_json::Value = serde_json::from_str(runs_json)
        .map_err(|e| JsValue::from_str(&format!("runs_json is not JSON: {e}")))?;
    let arr = v.as_array().ok_or_else(|| {
        JsValue::from_str("runs_json must be an array of {label, result, scenario?}")
    })?;
    let mut texts = Vec::with_capacity(arr.len());
    for (i, r) in arr.iter().enumerate() {
        let field = |k: &str| r.get(k).and_then(|x| x.as_str()).map(str::to_string);
        texts.push(ComplianceRunText {
            label: field("label")
                .ok_or_else(|| JsValue::from_str(&format!("runs[{i}] needs `label`")))?,
            result_json: field("result")
                .ok_or_else(|| JsValue::from_str(&format!("runs[{i}] needs `result`")))?,
            scenario_toml: field("scenario"),
        });
    }
    let out = crate::surface::compliance_report(&texts, MAX_INPUT_BYTES)
        .map_err(|e| JsValue::from_str(&e))?;
    Ok(serde_json::json!({"report": out.report, "markdown": out.markdown}).to_string())
}

/// The static public-framework mapping as Markdown, led by the statement every report
/// carries: the tables (`sources` false) or the source documents they cite (`sources` true).
#[wasm_bindgen]
pub fn compliance_mapping(sources: bool) -> String {
    crate::surface::compliance_mapping(sources)
}

/// Build a GNSS interference map from CSV text (`source` is `"adsb"` or `"ais"`; formats in
/// `docs/INTERFERENCE-MAP.md`). `dataset` is an approved preset or `"custom"`, which also
/// needs `licence`, `licence_url` and `attribution`; pass an empty string for any field
/// that does not apply, and `NaN` for the default 0.5 degree cell. `land_geojson` (AIS only,
/// empty for none) is a land-polygon file. Returns a JSON array of
/// `{file_name, date, cells_published, cells_flagged, geojson}`, one per UTC day. Aggregate
/// only; a degraded cell does not name interference as the cause. Nothing is uploaded.
#[wasm_bindgen]
#[allow(clippy::too_many_arguments)]
pub fn interference_map(
    source: &str,
    csv: &str,
    dataset: &str,
    cell_deg: f64,
    licence: &str,
    licence_url: &str,
    attribution: &str,
    land_geojson: &str,
) -> Result<String, JsValue> {
    use crate::surface::{interference_map as build, CustomDataset, MapSource, MAX_INPUT_BYTES};
    let custom =
        (!licence.is_empty() || !licence_url.is_empty() || !attribution.is_empty()).then(|| {
            CustomDataset {
                licence: licence.into(),
                licence_url: licence_url.into(),
                attribution: attribution.into(),
            }
        });
    let days = build(
        MapSource::parse(source).map_err(|e| JsValue::from_str(&e))?,
        csv,
        dataset,
        (!cell_deg.is_nan()).then_some(cell_deg),
        custom.as_ref(),
        (!land_geojson.is_empty()).then_some(land_geojson),
        MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    Ok(serde_json::Value::Array(
        days.into_iter()
            .map(|d| {
                serde_json::json!({
                    "file_name": d.file_name,
                    "date": d.date,
                    "cells_published": d.cells_published,
                    "cells_flagged": d.cells_flagged,
                    "geojson": d.geojson,
                })
            })
            .collect(),
    )
    .to_string())
}

/// Share of a route (GeoJSON LineString or `lat,lon` CSV text) through degraded cells of the
/// maps in `maps_json` (a JSON array of map GeoJSON strings, as `interference_map` returns),
/// optionally limited to `date_from`..`date_to` (`YYYY-MM-DD`, empty for no limit). Returns
/// the report as JSON text. Not a forecast; unobserved cells are not evidence of a clear
/// route.
#[wasm_bindgen]
pub fn route_exposure(
    route: &str,
    maps_json: &str,
    date_from: &str,
    date_to: &str,
) -> Result<String, JsValue> {
    let maps: Vec<String> = serde_json::from_str(maps_json).map_err(|e| {
        JsValue::from_str(&format!("maps_json must be a JSON array of strings: {e}"))
    })?;
    let refs: Vec<&str> = maps.iter().map(String::as_str).collect();
    crate::surface::route_exposure(
        route,
        &refs,
        (!date_from.is_empty()).then_some(date_from),
        (!date_to.is_empty()).then_some(date_to),
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))
}

/// Generate synthetic bridge NMEA 0183 for crew training from a `nmea-scenario` TOML.
/// `seed` replaces the scenario's seed unless it is `NaN` or negative. Returns a JSON object
/// `{nmea, log_json, log_text}`. Text only; never for a vessel's live navigation systems.
/// Advisory, not type-approved navigation equipment.
#[wasm_bindgen]
pub fn nmea_training(toml: &str, seed: f64) -> Result<String, JsValue> {
    let seed = (seed.is_finite() && seed >= 0.0).then_some(seed as u64);
    let t = crate::surface::nmea_training(toml, seed, crate::surface::MAX_INPUT_BYTES)
        .map_err(|e| JsValue::from_str(&e))?;
    Ok(
        serde_json::json!({"nmea": t.nmea, "log_json": t.log_json, "log_text": t.log_text})
            .to_string(),
    )
}

/// Score a bounded excerpt of a vessel's NMEA 0183 stream the way `kshana receiver-trust
/// live` scores it (at most 2 MiB and 20,000 epochs; it must hold the calibration window).
/// `session_toml` declares a vessel (`[platform] kind = "vessel"`). Returns a JSON object
/// `{schema, epochs, last_pksht, summary}` (`schema` is `"1.2"`): one report per epoch (`state`, `score`, `advisory`,
/// `deductions`, `alarms`, ...) and counts by state. The bounded form of the live command: no
/// socket is opened and the gate is not applied (both are command-line only). Advisory only.
#[wasm_bindgen]
pub fn receiver_trust_replay(session_toml: &str, nmea: &str) -> Result<String, JsValue> {
    let r = crate::surface::assess_vessel_excerpt(
        session_toml,
        nmea.as_bytes(),
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    serde_json::to_string(&r).map_err(|e| JsValue::from_str(&e.to_string()))
}

/// Assess a vessel's NMEA 0183 log as a batch run: `session_toml` (`[platform] kind =
/// "vessel"`, no `[log]` needed) and the log text. Returns the result document as JSON, the
/// same as `kshana receiver-trust` writes to `result.json`. Advisory only.
#[wasm_bindgen]
pub fn assess_vessel_log(session_toml: &str, log: &str) -> Result<String, JsValue> {
    crate::surface::assess_vessel_log_json(
        session_toml,
        log.as_bytes(),
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))
}

/// Verify an evidence pack. `files_json` is a JSON object of file name to content: a string,
/// `{"utf8": text}` or `{"base64": bytes}`. `public_key` is the signer's key as 64 hex digits,
/// obtained from the signer by another route (empty for none: the signature then proves only
/// that the pack is intact against the key it names itself). `full_log` is the full log text
/// (empty for none). `require_timestamp` fails a pack without a timestamp token. Returns the
/// report as JSON: `ok`, `failures`, `checks`, `signer_fingerprint`, `signer_pinned`, `notes`,
/// plus `verdict` (`"verified"`, `"intact-signer-not-pinned"` or `"failed"`) and `message`. Nothing is uploaded; packs are made with the
/// command line, Python or the MCP server.
#[wasm_bindgen]
pub fn evidence_verify(
    files_json: &str,
    public_key: &str,
    full_log: &str,
    require_timestamp: bool,
) -> Result<String, JsValue> {
    let v: serde_json::Value = serde_json::from_str(files_json)
        .map_err(|e| JsValue::from_str(&format!("files_json is not JSON: {e}")))?;
    let files = crate::surface::files_from_json(&v).map_err(|e| JsValue::from_str(&e))?;
    let report = crate::surface::evidence_verify(
        &files,
        (!public_key.is_empty()).then_some(public_key),
        (!full_log.is_empty()).then_some(full_log.as_bytes()),
        require_timestamp,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    Ok(report.to_string())
}
