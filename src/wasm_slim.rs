// SPDX-License-Identifier: AGPL-3.0-only
//! The feature-limited WebAssembly module (`--features wasm-slim`): the three calls an embedder makes and
//! nothing else, so the module stays inside an embedder's download budget.
//!
//! ```js
//! import init, { run, version, export_sp3 } from "./pkg/kshana.js";
//! await init();
//! const doc = JSON.parse(run(tomlText));
//! ```
//!
//! It exports [`version`], [`run`] and [`export_sp3`], with the same names and signatures as the
//! full module (`src/wasm.rs`), and runs four kinds: `constellation-design`, `gnss-sim`, `orbit` and
//! `pvt` (`crate::api::run_slim_kind`). Any other kind is refused with the error the registry
//! gives an unregistered id. A carried kind returns the same bytes as the full module: the run
//! goes through the same code (schema-version strip, `figure_tiers`, evidence label) and only the
//! kind dispatch is a shorter table (`crate::api::run_slim_kind`). `ci.yml` (job `wasm-slim`)
//! builds both modules and compares them on the recorded parity cases (`web/slim/parity.mjs`).
//!
//! Built with `scripts/build-wasm-slim.sh`; never together with `--features wasm` (the two
//! modules export the same names, so with both features on only the full one is compiled).

use wasm_bindgen::prelude::*;

/// Crate version of the loaded engine, as the full module's `version()`.
#[wasm_bindgen]
pub fn version() -> String {
    env!("CARGO_PKG_VERSION").to_string()
}

/// Run a scenario given as TOML and return its result document as a JSON string, as the full
/// module's `run`. The document is always the English run's, in both modules; `lang` is checked as
/// there, but an error message here is in English. Throws a JS error if the scenario is invalid or
/// of a kind this module does not carry.
#[wasm_bindgen]
pub fn run(toml: &str, lang: Option<String>) -> Result<String, JsValue> {
    crate::i18n::resolve(lang.as_deref().unwrap_or("en")).map_err(|e| JsValue::from_str(&e))?;
    crate::i18n::with_lang(crate::i18n::Lang::english(), || {
        crate::api::run_toml_in_current_language_with(toml, crate::api::run_slim_kind)
    })
    .map(|o| o.json)
    .map_err(|e| JsValue::from_str(&e))
}

/// An `orbit` scenario's propagated constellation as SP3-c text, as the full module's
/// `export_sp3`. Throws a JS error for any other kind.
#[wasm_bindgen]
pub fn export_sp3(toml: &str) -> Result<String, JsValue> {
    crate::api::export_sp3(toml).map_err(|e| JsValue::from_str(&e))
}
