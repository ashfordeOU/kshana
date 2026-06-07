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
use pyo3::types::{PyDict, PyList};

/// Recursively convert a `serde_json::Value` into a native Python object
/// (`dict`/`list`/`str`/`int`/`float`/`bool`/`None`), so callers get structured
/// data instead of a JSON string to re-parse.
fn json_to_py<'py>(py: Python<'py>, v: &serde_json::Value) -> PyResult<pyo3::Bound<'py, PyAny>> {
    use serde_json::Value;
    Ok(match v {
        Value::Null => py.None().into_bound(py),
        Value::Bool(b) => (*b).into_pyobject(py)?.to_owned().into_any(),
        Value::Number(n) => {
            if let Some(i) = n.as_i64() {
                i.into_pyobject(py)?.into_any()
            } else if let Some(u) = n.as_u64() {
                u.into_pyobject(py)?.into_any()
            } else {
                n.as_f64().unwrap_or(f64::NAN).into_pyobject(py)?.into_any()
            }
        }
        Value::String(s) => s.into_pyobject(py)?.into_any(),
        Value::Array(a) => {
            let list = PyList::empty(py);
            for item in a {
                list.append(json_to_py(py, item)?)?;
            }
            list.into_any()
        }
        Value::Object(o) => {
            let dict = PyDict::new(py);
            for (k, val) in o {
                dict.set_item(k, json_to_py(py, val)?)?;
            }
            dict.into_any()
        }
    })
}

/// A scenario run result: the result JSON, the chart SVG, and the human summary,
/// with a `data()` accessor that returns the parsed result as a Python dict.
#[pyclass(name = "RunOutput")]
#[derive(Clone)]
struct PyRunOutput {
    #[pyo3(get)]
    json: String,
    #[pyo3(get)]
    svg: String,
    #[pyo3(get)]
    summary: String,
}

#[pymethods]
impl PyRunOutput {
    /// The result document parsed into a Python `dict` (figures of merit,
    /// time series, provenance, ...). NumPy users can wrap any numeric list with
    /// `numpy.asarray(...)`.
    fn data<'py>(&self, py: Python<'py>) -> PyResult<pyo3::Bound<'py, PyAny>> {
        let v: serde_json::Value =
            serde_json::from_str(&self.json).map_err(|e| PyValueError::new_err(e.to_string()))?;
        json_to_py(py, &v)
    }

    fn __repr__(&self) -> String {
        format!(
            "RunOutput(json={} chars, svg={} chars, summary={:?})",
            self.json.len(),
            self.svg.len(),
            self.summary.chars().take(48).collect::<String>()
        )
    }
}

/// Run a scenario from a TOML string and return a typed [`RunOutput`] (with
/// `.json`, `.svg`, `.summary`, and `.data()`). Raises `ValueError` if invalid.
#[pyfunction]
fn run_typed(toml: &str) -> PyResult<PyRunOutput> {
    crate::api::run_toml(toml)
        .map(|o| PyRunOutput {
            json: o.json,
            svg: o.svg,
            summary: o.summary,
        })
        .map_err(PyValueError::new_err)
}

/// The available scenario kinds and their metadata, as a Python list of dicts
/// (name, description, required/optional fields) — introspectable without source.
#[pyfunction]
fn scenario_kinds(py: Python<'_>) -> PyResult<PyObject> {
    let json = crate::api::list_scenario_kinds_json();
    let v: serde_json::Value =
        serde_json::from_str(&json).map_err(|e| PyValueError::new_err(e.to_string()))?;
    Ok(json_to_py(py, &v)?.unbind())
}

/// Validate a scenario TOML string without raising: returns a list of error
/// messages (empty if the scenario is valid). Note: this executes the scenario,
/// so it surfaces both parse/config errors and runtime failures.
#[pyfunction]
fn validate_toml(toml: &str) -> Vec<String> {
    match crate::api::run_scenario(toml) {
        Ok(_) => vec![],
        Err(e) => vec![e.to_string()],
    }
}

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
    m.add_class::<PyRunOutput>()?;
    m.add_function(wrap_pyfunction!(run, m)?)?;
    m.add_function(wrap_pyfunction!(run_full, m)?)?;
    m.add_function(wrap_pyfunction!(run_typed, m)?)?;
    m.add_function(wrap_pyfunction!(scenario_kinds, m)?)?;
    m.add_function(wrap_pyfunction!(validate_toml, m)?)?;
    m.add_function(wrap_pyfunction!(list_kinds, m)?)?;
    m.add_function(wrap_pyfunction!(error_kind, m)?)?;
    m.add_function(wrap_pyfunction!(version, m)?)?;
    m.add("__version__", env!("CARGO_PKG_VERSION"))?;
    Ok(())
}
