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

/// Replay an NMEA excerpt through the engine behind `kshana receiver-trust live`, with the
/// gate on or off. `session_toml` declares a vessel (`[platform] kind = "vessel"`). Returns a
/// JSON object `{reports_jsonl, gated_nmea, epochs, calibrating, nominal, degraded,
/// untrusted, withheld, min_score}` (`gated_nmea` is null when `gate` is false). The bounded
/// form of the live command: it opens no socket. Advisory only.
#[wasm_bindgen]
pub fn receiver_trust_replay(
    session_toml: &str,
    nmea: &str,
    gate: bool,
) -> Result<String, JsValue> {
    let r = crate::surface::assess_vessel_stream(
        session_toml,
        nmea,
        gate,
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(|e| JsValue::from_str(&e))?;
    Ok(serde_json::json!({
        "reports_jsonl": r.reports_jsonl,
        "gated_nmea": r.gated_nmea,
        "epochs": r.epochs,
        "calibrating": r.calibrating,
        "nominal": r.nominal,
        "degraded": r.degraded,
        "untrusted": r.untrusted,
        "withheld": r.withheld,
        "min_score": r.min_score,
    })
    .to_string())
}
