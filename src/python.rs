// SPDX-License-Identifier: Apache-2.0
//! Python bindings (PyO3), built with `maturin` and the `python` feature.
//!
//! ```python
//! import kshana, json
//! result = json.loads(kshana.run(open("scenarios/clock-holdover.toml").read()))
//! print(kshana.version())
//! ```

// The #[pyfunction] macro expands to a `.into()` on the PyErr return, which Clippy
// flags as a useless conversion in macro-generated code we don't control.
#![allow(clippy::useless_conversion)]

use pyo3::exceptions::PyValueError;
use pyo3::prelude::*;

/// Run a scenario given as a TOML string; returns the result document as a JSON
/// string. Raises `ValueError` if the scenario is invalid.
#[pyfunction]
fn run(toml: &str) -> PyResult<String> {
    crate::api::run_toml(toml)
        .map(|o| o.json)
        .map_err(PyValueError::new_err)
}

/// Run a scenario; returns `(json, svg, summary)`.
#[pyfunction]
fn run_full(toml: &str) -> PyResult<(String, String, String)> {
    crate::api::run_toml(toml)
        .map(|o| (o.json, o.svg, o.summary))
        .map_err(PyValueError::new_err)
}

/// List the available scenario kinds and their metadata as a JSON array (name,
/// description, required and optional fields). Lets callers introspect the packs
/// without reading the source — e.g. for notebook auto-complete.
#[pyfunction]
fn list_kinds() -> String {
    crate::api::list_scenario_kinds_json()
}

/// Run a scenario; on failure return the structured error *kind* tag
/// (`invalid_input`, `non_convergence`, `unsupported`, `io_error`) instead of
/// raising, so a caller can pattern-match on the failure category. Returns `None`
/// on success.
#[pyfunction]
fn error_kind(toml: &str) -> Option<String> {
    crate::api::run_scenario(toml)
        .err()
        .map(|e| e.kind_tag().to_string())
}

/// Engine version (the crate version).
#[pyfunction]
fn version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}

#[pymodule]
fn kshana(m: &Bound<'_, PyModule>) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(run, m)?)?;
    m.add_function(wrap_pyfunction!(run_full, m)?)?;
    m.add_function(wrap_pyfunction!(list_kinds, m)?)?;
    m.add_function(wrap_pyfunction!(error_kind, m)?)?;
    m.add_function(wrap_pyfunction!(version, m)?)?;
    m.add("__version__", env!("CARGO_PKG_VERSION"))?;
    Ok(())
}
