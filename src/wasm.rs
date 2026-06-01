// SPDX-License-Identifier: Apache-2.0
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

/// Engine version (the crate version).
#[wasm_bindgen]
pub fn version() -> String {
    env!("CARGO_PKG_VERSION").to_string()
}
