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
