// SPDX-License-Identifier: AGPL-3.0-only
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

/// A scenario run result: the result JSON, the chart SVG, the human summary, and
/// — for the scenario kinds that emit one — the reproducibility table CSV, with a
/// `data()` accessor that returns the parsed result as a Python dict.
// pyo3 0.29 makes the auto `FromPyObject` derive for `Clone` pyclasses opt-in.
// `RunOutput` is only ever returned to Python, never accepted as an argument, so
// we explicitly skip the derive rather than opt in.
#[pyclass(name = "RunOutput", skip_from_py_object)]
#[derive(Clone)]
struct PyRunOutput {
    #[pyo3(get)]
    json: String,
    #[pyo3(get)]
    svg: String,
    #[pyo3(get)]
    summary: String,
    /// The reproducibility table the CLI writes as `<scenario>.table.csv`, for
    /// the kinds that emit one (`realtime-frame-eop`, `lunar-time-budget`,
    /// `lunar-jamming`, and `moonlight-service-volume` only when both
    /// `export_site_lat_deg` and `export_site_lon_deg` are set — the shipped
    /// scenario leaves them commented out, so it emits none); `None` otherwise. It is the
    /// byte-stable, golden-pinned form of the table the papers cite, so a
    /// reviewer reproducing one from the wheel needs it here and not only from
    /// the command line.
    #[pyo3(get)]
    csv: Option<String>,
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

    /// Write the reproducibility table to `path`, returning the number of bytes
    /// written — 0 when this scenario kind emits no table. Mirrors
    /// `kshana::api::RunOutput::write_csv`, which is what the CLI uses.
    fn write_csv(&self, path: &str) -> PyResult<usize> {
        match &self.csv {
            Some(csv) => std::fs::write(path, csv)
                .map(|()| csv.len())
                .map_err(|e| PyValueError::new_err(e.to_string())),
            None => Ok(0),
        }
    }

    fn __repr__(&self) -> String {
        format!(
            "RunOutput(json={} bytes, svg={} bytes, csv={} bytes, summary={:?})",
            self.json.len(),
            self.svg.len(),
            self.csv.as_ref().map_or(0, |c| c.len()),
            self.summary.chars().take(48).collect::<String>()
        )
    }
}

/// Run a scenario from a TOML string and return a typed [`RunOutput`] (with
/// `.json`, `.svg`, `.summary`, `.csv`, `.write_csv()`, and `.data()`). Raises
/// `ValueError` if invalid.
#[pyfunction]
fn run_typed(toml: &str) -> PyResult<PyRunOutput> {
    crate::api::run_toml(toml)
        .map(|o| PyRunOutput {
            json: o.json,
            svg: o.svg,
            summary: o.summary,
            csv: o.csv,
        })
        .map_err(PyValueError::new_err)
}

/// The available scenario kinds and their metadata, as a Python list of dicts
/// (name, description, required/optional fields) — introspectable without source.
/// Assess a real receiver log described by a `receiver-trust` scenario (TOML text). The
/// log must be given inline (`text` or `base64`) or by a path the Python process can
/// read. A `[platform]` table with `kind = "vessel"` selects the maritime monitors and the
/// 0-100 trust score with its reasons (`docs/MARITIME-TRUST.md`); the output is advisory.
/// `receiver-trust live` (a long-running stream process with an optional TCP listener) is
/// command-line only. Returns the result document, the trust-timeline CSV, the chart and a
/// summary.
#[pyfunction]
fn receiver_trust(toml: &str) -> PyResult<PyRunOutput> {
    crate::receiver_trust::scenario::run_toml(toml)
        .map(|o| PyRunOutput {
            json: o.json,
            svg: o.svg,
            summary: o.summary,
            csv: Some(o.csv),
        })
        .map_err(PyValueError::new_err)
}

#[pyfunction]
fn scenario_kinds<'py>(py: Python<'py>) -> PyResult<Bound<'py, PyAny>> {
    let json = crate::api::list_scenario_kinds_json();
    let v: serde_json::Value =
        serde_json::from_str(&json).map_err(|e| PyValueError::new_err(e.to_string()))?;
    json_to_py(py, &v)
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

/// List the available scenario kinds and their metadata as ONE JSON-array string (name,
/// description, required and optional fields) — a `str`, not a Python list. It predates
/// [`scenario_kinds`], which returns the same metadata already parsed, and keeps its
/// string return so existing callers do not break; new code should call `scenario_kinds`.
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

// --- GNSS IQ layer (src/iq) ---------------------------------------------------------
//
// These expose the signal-level simulation and software-receiver processing of the IQ
// layer with the same conventions as the `kshana iq` CLI, returning native Python data
// (lists and dicts) that `numpy.asarray(...)` wraps directly. The scene generator, the
// acquisition and tracking engines and the loop designs are the crate's own
// (`kshana::iq`), so a Python caller gets the same bits as the CLI and the Rust tests.

use crate::iq::acq::{acquire_peak, AcqConfig};
use crate::iq::cli::{
    build_broadcast_scene, build_chain, build_channel, build_code, build_scene, BroadcastParams,
    ChannelParams, FrontendParams, SceneParams,
};
use crate::iq::scene::TruthRecord;
use crate::iq::signals::SignalCode;
use crate::iq::track::{ChannelInit, EpochOutput};
use crate::iq::{Cf64, SampleSpec, SpreadingCode, VecSink};

/// Build one spreading code per identifier in `prns`.
fn codes_for(signal: &str, prns: &[i64]) -> PyResult<Vec<SignalCode>> {
    if prns.is_empty() {
        return Err(PyValueError::new_err("prns must list at least one PRN"));
    }
    prns.iter()
        .map(|&id| build_code(signal, id).map_err(PyValueError::new_err))
        .collect()
}

/// Interleave two equal-length real sequences into complex samples.
fn samples_from(i: &[f64], q: &[f64]) -> PyResult<Vec<Cf64>> {
    if i.len() != q.len() {
        return Err(PyValueError::new_err(format!(
            "i and q must be the same length ({} vs {})",
            i.len(),
            q.len()
        )));
    }
    Ok(i.iter()
        .zip(q)
        .map(|(&re, &im)| Cf64::new(re, im))
        .collect())
}

/// Generate a multi-satellite GNSS IQ scene in memory. Returns a dict with the sampling
/// (`fs_hz`, `center_hz`, `if_hz`), the complex samples as two float lists (`samples_i`,
/// `samples_q`) and the per-epoch `truth` records. `prns` is the PRN per satellite (the
/// FDMA frequency channel for GLONASS); `dopplers` is one Doppler (Hz) per PRN, a single
/// value applied to all, or omitted for zero. An optional propagation channel is applied to
/// every satellite through the channel knobs: `iono_stec`/`iono_vtec` (TECU) or
/// `iono_klobuchar`, `tropo` (with `tropo_doy`), scintillation `s4`/`scint_tau0`/`sigma_phi`,
/// `multipath_height` (m) with `multipath_ground` (`dry`/`wet`/`sea`), `land_mobile`, and
/// `nlos`. `cn0_profile` is a C/N0 profile file's text ([`crate::iq::channel::cn0_profile`]):
/// time-varying C/N0 offsets per satellite applied over the channel, with the truth's
/// `cn0_dbhz` following them. Raises `ValueError` on an invalid scene, channel or profile.
#[pyfunction]
#[pyo3(signature = (fs_hz, duration_s, signal, prns, dopplers=None, cn0_dbhz=None, center_hz=None, if_hz=0.0, noise=true, noise_figure_db=2.0, seed=1, data=false, threads=1, iono_stec=None, iono_vtec=None, iono_klobuchar=false, tropo=false, tropo_doy=180.0, s4=None, scint_tau0=1.0, sigma_phi=0.0, multipath_height=None, multipath_ground="dry".to_string(), land_mobile=false, nlos=false, cn0_profile=None))]
#[allow(clippy::too_many_arguments)]
fn iq_scene<'py>(
    py: Python<'py>,
    fs_hz: f64,
    duration_s: f64,
    signal: String,
    prns: Vec<i64>,
    dopplers: Option<Vec<f64>>,
    cn0_dbhz: Option<f64>,
    center_hz: Option<f64>,
    if_hz: f64,
    noise: bool,
    noise_figure_db: f64,
    seed: u64,
    data: bool,
    threads: usize,
    iono_stec: Option<f64>,
    iono_vtec: Option<f64>,
    iono_klobuchar: bool,
    tropo: bool,
    tropo_doy: f64,
    s4: Option<f64>,
    scint_tau0: f64,
    sigma_phi: f64,
    multipath_height: Option<f64>,
    multipath_ground: String,
    land_mobile: bool,
    nlos: bool,
    cn0_profile: Option<String>,
) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::channel::cn0_profile::{Cn0Profile, Cn0ProfileChannel, ProfiledTruth};
    let profile = cn0_profile
        .map(|t| Cn0Profile::parse(&t).map_err(|e| PyValueError::new_err(e.to_string())))
        .transpose()?;
    let params = SceneParams {
        fs_hz,
        duration_s,
        signal,
        ids: prns,
        dopplers: dopplers.unwrap_or_default(),
        center_hz,
        if_hz,
        cn0_dbhz,
        noise_figure_db,
        noise,
        seed,
        data,
        threads,
    };
    let mut scene = build_scene(&params).map_err(PyValueError::new_err)?;
    let spec = scene.config().spec;
    // Optional propagation channel.
    let chan = ChannelParams {
        iono_stec_tecu: iono_stec,
        iono_vtec_tecu: iono_vtec,
        iono_klobuchar,
        tropo,
        tropo_doy,
        s4,
        scint_tau0_s: scint_tau0,
        sigma_phi_rad: sigma_phi,
        multipath_height_m: multipath_height,
        multipath_ground,
        land_mobile,
        nlos,
    };
    let mut inner = None;
    if chan.any() {
        let carrier = scene
            .satellites()
            .first()
            .map(|s| s.code.carrier_hz())
            .unwrap_or(spec.center_hz);
        let start_tow = scene.config().start_tow_s;
        inner =
            build_channel(&chan, carrier, params.seed, start_tow).map_err(PyValueError::new_err)?;
    }
    match (&profile, inner) {
        (Some(p), inner) => scene.set_channel(Box::new(Cn0ProfileChannel::new(p.clone(), inner))),
        (None, Some(ch)) => scene.set_channel(ch),
        (None, None) => {}
    }
    let mut sink = VecSink::default();
    let mut truth: Vec<TruthRecord> = Vec::new();
    match profile {
        // The truth states the profiled C/N0.
        Some(p) => scene.generate(&mut sink, &mut ProfiledTruth::new(p, &mut truth)),
        None => scene.generate(&mut sink, &mut truth),
    }
    .map_err(|e| PyValueError::new_err(e.to_string()))?;
    let i: Vec<f64> = sink.samples.iter().map(|s| s.re).collect();
    let q: Vec<f64> = sink.samples.iter().map(|s| s.im).collect();
    let truth_json: Vec<serde_json::Value> = truth
        .iter()
        .map(|r| serde_json::to_value(r).unwrap_or(serde_json::Value::Null))
        .collect();
    let v = serde_json::json!({
        "fs_hz": spec.fs_hz,
        "center_hz": spec.center_hz,
        "if_hz": spec.if_hz,
        "samples_i": i,
        "samples_q": q,
        "truth": truth_json,
    });
    json_to_py(py, &v)
}

/// Generate a broadcast-ephemeris GNSS IQ scene in memory from RINEX navigation text.
/// Each requested GPS PRN (or every healthy GPS satellite when `prns` is omitted) is placed
/// at its true broadcast geometry for a receiver at `(rx_lat, rx_lon, rx_alt)` (degrees,
/// degrees, metres) over the window starting at GPS time of week `start_tow`. Returns the
/// same dict as [`iq_scene`] (sampling, `samples_i`/`samples_q`, per-epoch `truth`). Raises
/// `ValueError` on an invalid file or scene.
#[pyfunction]
#[pyo3(signature = (fs_hz, window_s, nav_text, rx_lat, rx_lon, rx_alt, prns=None, start_tow=0.0, cn0_dbhz=None, center_hz=None, if_hz=0.0, noise=true, noise_figure_db=2.0, seed=1, mask_deg=5.0, threads=1))]
#[allow(clippy::too_many_arguments)]
fn iq_scene_broadcast<'py>(
    py: Python<'py>,
    fs_hz: f64,
    window_s: f64,
    nav_text: String,
    rx_lat: f64,
    rx_lon: f64,
    rx_alt: f64,
    prns: Option<Vec<i64>>,
    start_tow: f64,
    cn0_dbhz: Option<f64>,
    center_hz: Option<f64>,
    if_hz: f64,
    noise: bool,
    noise_figure_db: f64,
    seed: u64,
    mask_deg: f64,
    threads: usize,
) -> PyResult<Bound<'py, PyAny>> {
    let bp = BroadcastParams {
        fs_hz,
        duration_s: window_s,
        nav_text,
        prns: prns.unwrap_or_default(),
        start_tow_s: start_tow,
        rx_llh_deg: (rx_lat, rx_lon, rx_alt),
        center_hz,
        if_hz,
        cn0_dbhz,
        noise,
        noise_figure_db,
        seed,
        elevation_mask_deg: mask_deg,
        threads,
    };
    let scene = build_broadcast_scene(&bp).map_err(PyValueError::new_err)?;
    let spec = scene.config().spec;
    let mut sink = VecSink::default();
    let mut truth: Vec<TruthRecord> = Vec::new();
    scene
        .generate(&mut sink, &mut truth)
        .map_err(|e| PyValueError::new_err(e.to_string()))?;
    let i: Vec<f64> = sink.samples.iter().map(|s| s.re).collect();
    let q: Vec<f64> = sink.samples.iter().map(|s| s.im).collect();
    let truth_json: Vec<serde_json::Value> = truth
        .iter()
        .map(|r| serde_json::to_value(r).unwrap_or(serde_json::Value::Null))
        .collect();
    let v = serde_json::json!({
        "fs_hz": spec.fs_hz,
        "center_hz": spec.center_hz,
        "if_hz": spec.if_hz,
        "samples_i": i,
        "samples_q": q,
        "truth": truth_json,
    });
    json_to_py(py, &v)
}

/// FFT acquisition of each PRN over complex samples (`i`/`q` lists sampled at `fs_hz`).
/// Returns a list of detection dicts (`code`, `acquired`, `doppler_hz`, `code_phase_chips`,
/// `statistic`, `threshold`, `peak_ratio`, ...). Raises `ValueError` on a bad search.
#[pyfunction]
#[pyo3(signature = (i, q, fs_hz, signal, prns, if_hz=0.0, center_hz=None, coherent=1, noncoherent=1, doppler_max=5000.0, doppler_step=None, pfa=1e-3))]
#[allow(clippy::too_many_arguments)]
fn iq_acquire<'py>(
    py: Python<'py>,
    i: Vec<f64>,
    q: Vec<f64>,
    fs_hz: f64,
    signal: String,
    prns: Vec<i64>,
    if_hz: f64,
    center_hz: Option<f64>,
    coherent: usize,
    noncoherent: usize,
    doppler_max: f64,
    doppler_step: Option<f64>,
    pfa: f64,
) -> PyResult<Bound<'py, PyAny>> {
    let codes = codes_for(&signal, &prns)?;
    let samples = samples_from(&i, &q)?;
    let spec = SampleSpec {
        fs_hz,
        center_hz: center_hz.unwrap_or_else(|| codes[0].carrier_hz()),
        if_hz,
    };
    let coherent = coherent.max(1);
    let cfg = AcqConfig {
        coherent_periods: coherent,
        noncoherent: noncoherent.max(1),
        doppler_max_hz: doppler_max,
        doppler_step_hz: doppler_step
            .unwrap_or(2.0 / (3.0 * coherent as f64 * codes[0].period_s())),
        pfa,
    };
    let mut out = Vec::new();
    for code in &codes {
        let r = acquire_peak(&samples, &spec, code, &cfg).map_err(PyValueError::new_err)?;
        out.push(serde_json::json!({
            "code": r.code_name,
            "acquired": r.acquired,
            "doppler_hz": r.doppler_hz,
            "code_phase_chips": r.code_phase_chips,
            "delay_samples": r.delay_samples,
            "statistic": r.statistic,
            "threshold": r.threshold,
            "peak_ratio": r.peak_ratio,
            "second_peak": r.second_peak,
            "sample_power": r.sample_power,
        }));
    }
    json_to_py(py, &serde_json::Value::Array(out))
}

/// The whole acquisition surface of one PRN over complex samples (`kshana.acq-surface/1`):
/// a dict with `header` (the search, the Doppler bins, the peak, and the `parabolic` and
/// `fine_search` Doppler refinements) and `rows` (`rows[doppler_index][lag]`, the normalised
/// correlation power). Raises `ValueError` on a bad search.
#[pyfunction]
#[pyo3(signature = (i, q, fs_hz, signal, prn, if_hz=0.0, center_hz=None, coherent=1, noncoherent=1, doppler_max=5000.0, doppler_step=None, pfa=1e-3))]
#[allow(clippy::too_many_arguments)]
fn iq_acq_surface<'py>(
    py: Python<'py>,
    i: Vec<f64>,
    q: Vec<f64>,
    fs_hz: f64,
    signal: String,
    prn: i64,
    if_hz: f64,
    center_hz: Option<f64>,
    coherent: usize,
    noncoherent: usize,
    doppler_max: f64,
    doppler_step: Option<f64>,
    pfa: f64,
) -> PyResult<Bound<'py, PyAny>> {
    let codes = codes_for(&signal, &[prn])?;
    let samples = samples_from(&i, &q)?;
    let spec = SampleSpec {
        fs_hz,
        center_hz: center_hz.unwrap_or_else(|| codes[0].carrier_hz()),
        if_hz,
    };
    let coherent = coherent.max(1);
    let cfg = AcqConfig {
        coherent_periods: coherent,
        noncoherent: noncoherent.max(1),
        doppler_max_hz: doppler_max,
        doppler_step_hz: doppler_step
            .unwrap_or(2.0 / (3.0 * coherent as f64 * codes[0].period_s())),
        pfa,
    };
    let surface = crate::iq::acq_surface::Surface::compute(&samples, &spec, &codes[0], &cfg)
        .map_err(PyValueError::new_err)?;
    json_to_py(
        py,
        &serde_json::json!({ "header": surface.header, "rows": surface.grid }),
    )
}

/// Acquire then track each PRN over complex samples. Returns a dict with `fs_hz`, the
/// resolved loop `design` (every field, with its `hash`), the lock-state `events`, any
/// `warnings` (`commensurate_sampling` when `fs_hz` is a multiple of half the chip rate:
/// code-loop jitter and bias are then not representative) and one
/// entry per channel (`code` and a list of per-epoch dicts: `doppler_hz`,
/// `code_phase_chips`, `pli`, `phase_lock`, `cn0_nwpr_dbhz`, the early/prompt/late
/// correlators, the discriminators, `state`, ...). The loop design is `design` (a path to a
/// `kshana.loop-design/1` TOML file, or its text; `design_name` picks one, the first by
/// default) or the GPS-L1-C/A-like built-in default; any of `pll_bw`, `fll_bw`, `dll_bw`,
/// `spacing`, `coherent`, `reacquire` and the acquisition arguments overrides it. The
/// initialising acquisition integrates `acq_coherent` code periods coherently; the default
/// `None` is the design's (auto: ≈4 ms coherent, 4 periods of an untiered 1 ms code such as
/// GPS L1 C/A, 1 period of a code whose full, overlay-included period is 4 ms or longer),
/// and `acq_coherent=1` restores the 0.32 one-period search. Raises `ValueError` if a PRN
/// is not acquired or the design is invalid.
#[pyfunction]
#[pyo3(signature = (i, q, fs_hz, signal, prns, if_hz=0.0, center_hz=None, pll_bw=None, fll_bw=None, dll_bw=None, spacing=None, coherent=None, periods_per_bit=None, acq_coherent=None, acq_noncoherent=None, doppler_max=None, max_seconds=None, design=None, design_name=None, reacquire=None, extra_taps=None, threads=1))]
#[allow(clippy::too_many_arguments)]
fn iq_track<'py>(
    py: Python<'py>,
    i: Vec<f64>,
    q: Vec<f64>,
    fs_hz: f64,
    signal: String,
    prns: Vec<i64>,
    if_hz: f64,
    center_hz: Option<f64>,
    pll_bw: Option<f64>,
    fll_bw: Option<f64>,
    dll_bw: Option<f64>,
    spacing: Option<f64>,
    coherent: Option<usize>,
    periods_per_bit: Option<usize>,
    acq_coherent: Option<usize>,
    acq_noncoherent: Option<usize>,
    doppler_max: Option<f64>,
    max_seconds: Option<f64>,
    design: Option<String>,
    design_name: Option<String>,
    reacquire: Option<bool>,
    extra_taps: Option<Vec<f64>>,
    threads: usize,
) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::track::design::{Design, DesignFile};
    use crate::iq::track::sink::CollectSink;
    use crate::iq::track::{SessionChannel, TrackSession};
    let codes = codes_for(&signal, &prns)?;
    let samples = samples_from(&i, &q)?;
    let spec = SampleSpec {
        fs_hz,
        center_hz: center_hz.unwrap_or_else(|| codes[0].carrier_hz()),
        if_hz,
    };
    // The design: a file path or TOML text, else the built-in default; arguments override.
    let base = match design {
        None => {
            if design_name.is_some() {
                return Err(PyValueError::new_err("design_name needs design"));
            }
            Design::builtin_default()
        }
        Some(d) => {
            let text = if std::path::Path::new(&d).is_file() {
                std::fs::read_to_string(&d).map_err(|e| PyValueError::new_err(e.to_string()))?
            } else {
                d
            };
            DesignFile::parse(&text)
                .and_then(|f| f.select(design_name.as_deref()).cloned())
                .map_err(PyValueError::new_err)?
        }
    };
    let mut o = String::new();
    let mut section = |name: &str, kv: Vec<(&str, Option<String>)>| {
        let set: Vec<String> = kv
            .into_iter()
            .filter_map(|(k, v)| v.map(|v| format!("{k} = {v}")))
            .collect();
        if !set.is_empty() {
            o.push_str(&format!("[{name}]\n{}\n", set.join("\n")));
        }
    };
    let f = |v: Option<f64>| v.map(|x| format!("{x:?}"));
    let n = |v: Option<usize>| v.map(|x| x.max(1).to_string());
    section(
        "carrier",
        vec![("pll_bw_hz", f(pll_bw)), ("fll_bw_hz", f(fll_bw))],
    );
    section("code", vec![("bw_hz", f(dll_bw))]);
    section(
        "integration",
        vec![
            ("spacing_chips", f(spacing)),
            ("coherent_periods", n(coherent)),
            (
                "extra_taps_chips",
                extra_taps.map(|t| {
                    format!(
                        "[{}]",
                        t.iter()
                            .map(|v| format!("{v:?}"))
                            .collect::<Vec<_>>()
                            .join(", ")
                    )
                }),
            ),
        ],
    );
    section(
        "lock",
        vec![("reacquire", reacquire.map(|b| b.to_string()))],
    );
    section(
        "acquisition",
        vec![
            ("coherent_periods", n(acq_coherent)),
            ("noncoherent", n(acq_noncoherent)),
            ("doppler_max_hz", f(doppler_max)),
        ],
    );
    let design = if o.is_empty() {
        base
    } else {
        base.with_overrides(&o).map_err(PyValueError::new_err)?
    };
    // Acquisition to initialise each channel.
    let acq = design.acq_config(codes[0].period_s());
    let mut inits = Vec::new();
    for code in &codes {
        let found = acquire_peak(&samples, &spec, code, &acq).map_err(PyValueError::new_err)?;
        if !found.acquired {
            return Err(PyValueError::new_err(format!(
                "{}: not acquired (statistic {:.2} < threshold {:.2})",
                code.name(),
                found.statistic,
                found.threshold
            )));
        }
        let arc: std::sync::Arc<dyn SpreadingCode + Send + Sync> =
            std::sync::Arc::new(code.clone());
        inits.push(ChannelInit::from_acquisition(
            arc,
            &found,
            &spec,
            0,
            periods_per_bit,
        ));
    }
    let channels = inits
        .into_iter()
        .map(|init| SessionChannel::from_design(init, &design))
        .collect();
    let mut session = TrackSession::new(spec, channels)
        .map_err(PyValueError::new_err)?
        .with_threads(threads);
    let max_samples = max_seconds.map(|s| (s * fs_hz).round() as u64);
    let mut src = crate::iq::VecSource::new(spec, samples);
    let mut sink = CollectSink::default();
    session
        .run(&mut src, max_samples, &mut sink)
        .map_err(|e| PyValueError::new_err(e.to_string()))?;
    let chans: Vec<serde_json::Value> = codes
        .iter()
        .enumerate()
        .map(|(k, code)| {
            let epochs: Vec<serde_json::Value> = sink
                .channels
                .get(k)
                .map(|v| {
                    v.iter()
                        .map(|(e, st)| {
                            let mut j = epoch_value(e);
                            j["state"] = st.as_str().into();
                            j
                        })
                        .collect()
                })
                .unwrap_or_default();
            serde_json::json!({ "code": code.name(), "epochs": epochs })
        })
        .collect();
    let events: Vec<serde_json::Value> = sink
        .events
        .iter()
        .map(|e| serde_json::to_value(e).unwrap_or(serde_json::Value::Null))
        .collect();
    json_to_py(
        py,
        &serde_json::json!({
            "fs_hz": fs_hz,
            "design": design.to_json(),
            "events": events,
            "warnings": crate::iq::cli::sampling_warnings(&spec, &codes),
            "channels": chans,
        }),
    )
}

/// Parse a `kshana.loop-design/1` TOML text (or a path to one) and return its designs,
/// resolved: a list of dicts with every field set, the `name` and the `hash`. Raises
/// `ValueError` on an invalid file.
#[pyfunction]
fn iq_loop_designs<'py>(py: Python<'py>, toml: &str) -> PyResult<Bound<'py, PyAny>> {
    let text = if std::path::Path::new(toml).is_file() {
        std::fs::read_to_string(toml).map_err(|e| PyValueError::new_err(e.to_string()))?
    } else {
        toml.to_string()
    };
    let file = crate::iq::track::design::DesignFile::parse(&text).map_err(PyValueError::new_err)?;
    let v: Vec<serde_json::Value> = file.designs().iter().map(|d| d.to_json()).collect();
    json_to_py(py, &serde_json::Value::Array(v))
}

/// Read a binary tracking-epoch file (`kshana.track-epoch/1`, as `kshana iq track --epochs
/// <path>.bin` writes it). Returns a dict with the `header` (schema, fields, channels with
/// their code, design and design hash, sample rate, engine version) and the `records`, one
/// dict per epoch. Raises `ValueError` on a file that is not one.
#[pyfunction]
fn iq_read_epochs<'py>(py: Python<'py>, path: &str) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::track::sink::BinaryEpochReader;
    let f = std::fs::File::open(path).map_err(|e| PyValueError::new_err(format!("{path}: {e}")))?;
    let reader = BinaryEpochReader::new(std::io::BufReader::new(f))
        .map_err(|e| PyValueError::new_err(e.to_string()))?;
    let header = serde_json::to_value(reader.header()).unwrap_or(serde_json::Value::Null);
    let records = reader
        .map(|r| {
            r.map(|rec| serde_json::to_value(rec).unwrap_or(serde_json::Value::Null))
                .map_err(|e| PyValueError::new_err(e.to_string()))
        })
        .collect::<PyResult<Vec<_>>>()?;
    json_to_py(
        py,
        &serde_json::json!({ "header": header, "records": records }),
    )
}

/// One tracking epoch as a JSON value for the Python surface.
fn epoch_value(e: &EpochOutput) -> serde_json::Value {
    let mut v = serde_json::json!({
        "epoch": e.epoch,
        "sample_index": e.sample_index,
        "code_epoch_s": e.code_epoch_s,
        "t_coh_s": e.t_coh_s,
        "doppler_hz": e.doppler_hz,
        "code_rate_hz": e.code_rate_hz,
        "code_phase_chips": e.code_phase_chips,
        "periods": e.periods,
        "i_early": e.early.re,
        "q_early": e.early.im,
        "i_prompt": e.prompt.re,
        "q_prompt": e.prompt.im,
        "i_late": e.late.re,
        "q_late": e.late.im,
        "carrier_phase_cycles": e.carrier_phase_cycles,
        "bit_edge": e.bit_edge,
        "bit": e.bit,
        "dll_chips": e.disc.dll_chips,
        "pll_rad": e.disc.pll_rad,
        "fll_hz": e.disc.fll_hz,
        "pli": e.pli,
        "phase_lock": e.phase_lock,
        "code_lock": e.code_lock,
        "cn0_nwpr_dbhz": e.cn0_nwpr_dbhz,
        "cn0_beaulieu_dbhz": e.cn0_beaulieu_dbhz,
        "cn0_m2m4_dbhz": e.cn0_m2m4_dbhz,
    });
    if !e.extra.is_empty() {
        v["extra"] = e
            .extra
            .iter()
            .map(|&(offset_chips, c)| {
                serde_json::json!({ "offset_chips": offset_chips, "i": c.re, "q": c.im })
            })
            .collect();
    }
    v
}

/// Run the IQ detection monitors over a recording file (`path`: SigMF, collection, `.sdrx`
/// or a raw file with a sidecar, or raw with `format`/`rate`) in one streaming pass, and
/// return the report as a dict: `series` (name, unit, channel, `t_s`, `value`), `events`
/// (kind, channel, `t_start_s`, `t_alarm_s`, `t_end_s`, peak, threshold), `spectra` and
/// `notes`. Mirrors `kshana iq monitor`: `power` / `spectral` pick the pre-correlation
/// monitors (both when neither is set), `settings` is a TOML or JSON monitor-settings text,
/// and `signal` + `prns` add tracked channels with C/N0, SQM and lock monitors. Raises
/// `ValueError` on a bad argument or an unreadable recording.
#[pyfunction]
#[pyo3(signature = (path, signal=None, prns=None, power=false, spectral=false, settings=None, baseline=None, max_seconds=None, spacing=None, pll_bw=None, fll_bw=None, dll_bw=None, coherent=None, cn0_windows=None, doppler_max=None, periods_per_bit=None, format=None, rate=None, center_hz=None, if_hz=None, header_bytes=None))]
#[allow(clippy::too_many_arguments)]
fn iq_monitor<'py>(
    py: Python<'py>,
    path: String,
    signal: Option<String>,
    prns: Option<Vec<i64>>,
    power: bool,
    spectral: bool,
    settings: Option<String>,
    baseline: Option<f64>,
    max_seconds: Option<f64>,
    spacing: Option<f64>,
    pll_bw: Option<f64>,
    fll_bw: Option<f64>,
    dll_bw: Option<f64>,
    coherent: Option<usize>,
    cn0_windows: Option<usize>,
    doppler_max: Option<f64>,
    periods_per_bit: Option<usize>,
    format: Option<String>,
    rate: Option<f64>,
    center_hz: Option<f64>,
    if_hz: Option<f64>,
    header_bytes: Option<u64>,
) -> PyResult<Bound<'py, PyAny>> {
    let mut args = vec![path];
    let mut opt = |k: &str, v: Option<String>| {
        if let Some(v) = v {
            args.push(k.to_string());
            args.push(v);
        }
    };
    opt("--signal", signal);
    opt(
        "--prn",
        prns.map(|p| {
            p.iter()
                .map(|x| x.to_string())
                .collect::<Vec<_>>()
                .join(",")
        }),
    );
    opt("--baseline", baseline.map(|v| v.to_string()));
    opt("--max-seconds", max_seconds.map(|v| v.to_string()));
    opt("--spacing", spacing.map(|v| v.to_string()));
    opt("--pll-bw", pll_bw.map(|v| v.to_string()));
    opt("--fll-bw", fll_bw.map(|v| v.to_string()));
    opt("--dll-bw", dll_bw.map(|v| v.to_string()));
    opt("--coherent", coherent.map(|v| v.to_string()));
    opt("--cn0-windows", cn0_windows.map(|v| v.to_string()));
    opt("--doppler-max", doppler_max.map(|v| v.to_string()));
    opt("--periods-per-bit", periods_per_bit.map(|v| v.to_string()));
    opt("--format", format);
    opt("--rate", rate.map(|v| v.to_string()));
    opt("--center", center_hz.map(|v| v.to_string()));
    opt("--if", if_hz.map(|v| v.to_string()));
    opt("--header", header_bytes.map(|v| v.to_string()));
    if power {
        args.push("--power".into());
    }
    if spectral {
        args.push("--spectral".into());
    }
    let fail = |f: crate::iq::cli::CliFail| match f {
        crate::iq::cli::CliFail::Usage(m) | crate::iq::cli::CliFail::Run(m) => {
            PyValueError::new_err(m)
        }
    };
    let a = crate::iq::cli::monitor_parse_args(&args).map_err(fail)?;
    let report = crate::iq::cli::monitor_report(&a, settings.as_deref()).map_err(fail)?;
    let v = serde_json::to_value(&report).map_err(|e| PyValueError::new_err(e.to_string()))?;
    json_to_py(py, &v)
}

/// Fit the tracking-loop loss-of-lock model to a receiver-trust timeline described by an
/// `iq-labfit` TOML scenario. Returns a dict with the parsed `report`, the `residuals_csv`
/// and `predictions_csv` tables and the `markdown`. Relative log paths are resolved against
/// the working directory. Raises `ValueError` on an invalid scenario or unreadable log.
#[pyfunction]
fn iq_labfit<'py>(py: Python<'py>, toml: &str) -> PyResult<Bound<'py, PyAny>> {
    let out = crate::iq::labfit::run_toml(toml).map_err(PyValueError::new_err)?;
    let report: serde_json::Value =
        serde_json::from_str(&out.json).map_err(|e| PyValueError::new_err(e.to_string()))?;
    let v = serde_json::json!({
        "report": report,
        "residuals_csv": out.residuals_csv,
        "predictions_csv": out.predictions_csv,
        "markdown": out.markdown,
    });
    json_to_py(py, &v)
}

/// Validate a lab test-condition file (`kshana.test-conditions/1`, TOML or JSON) given as
/// a path or as text. Returns the resolved conditions as a dict, with the condition hash
/// under `hash`. Raises `ValueError` on an invalid file.
#[pyfunction]
fn iq_test_conditions<'py>(py: Python<'py>, conditions: &str) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::campaign::TestConditions;
    let path = std::path::Path::new(conditions);
    let tc = if !conditions.contains('\n') && path.is_file() {
        TestConditions::load(path)
    } else {
        TestConditions::parse(conditions)
    }
    .map_err(PyValueError::new_err)?;
    let mut v = serde_json::to_value(&tc).map_err(|e| PyValueError::new_err(e.to_string()))?;
    if let Some(m) = v.as_object_mut() {
        m.insert("hash".into(), tc.hash().into());
    }
    json_to_py(py, &v)
}

/// Run a lab-replay campaign (`kshana.campaign/1`, a path or TOML text; relative paths in
/// text resolve against the working directory) into `out_dir`, exactly as
/// `kshana iq campaign` does: cells already done are skipped unless `resume` is false,
/// `max_cells` bounds how many pending cells run now, and `dry_run` only plans. Returns the
/// run summary as a dict (cell counts, failures, and the `digest` once every cell is
/// done). The GIL is released while the campaign runs. Raises `ValueError` on an invalid
/// campaign and `RuntimeError` when the run cannot proceed.
#[pyfunction]
#[pyo3(signature = (campaign, out_dir, workers=0, resume=true, max_cells=None, dry_run=false))]
fn iq_campaign<'py>(
    py: Python<'py>,
    campaign: &str,
    out_dir: &str,
    workers: usize,
    resume: bool,
    max_cells: Option<usize>,
    dry_run: bool,
) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::campaign::{run, LoadedCampaign, RunOptions};
    let path = std::path::Path::new(campaign);
    let loaded = if !campaign.contains('\n') && path.is_file() {
        LoadedCampaign::load(path)
    } else {
        LoadedCampaign::load_text(campaign, std::path::Path::new("./campaign.toml"))
    }
    .map_err(PyValueError::new_err)?;
    let opts = RunOptions {
        workers,
        no_resume: !resume,
        max_cells,
        dry_run,
    };
    let out = std::path::PathBuf::from(out_dir);
    let summary = py
        .detach(|| run(&loaded, &out, &opts))
        .map_err(pyo3::exceptions::PyRuntimeError::new_err)?;
    let v = serde_json::to_value(&summary).map_err(|e| PyValueError::new_err(e.to_string()))?;
    json_to_py(py, &v)
}

/// Rebuild a campaign's scorecards, HTML report and digest from the cells in `out_dir`.
/// Returns a dict with the cell and row counts, the rows failing a bar, and the `digest`
/// (None until every cell is done). Raises `RuntimeError` when `out_dir` holds no campaign.
#[pyfunction]
fn iq_campaign_report<'py>(py: Python<'py>, out_dir: &str) -> PyResult<Bound<'py, PyAny>> {
    let s = crate::iq::campaign::report::build(std::path::Path::new(out_dir))
        .map_err(pyo3::exceptions::PyRuntimeError::new_err)?;
    let v = serde_json::to_value(&s).map_err(|e| PyValueError::new_err(e.to_string()))?;
    json_to_py(py, &v)
}

/// Apply a receiver front-end / interference-mitigation chain to complex samples
/// (`i`/`q` lists sampled at `fs_hz`) and return the filtered samples as `samples_i` /
/// `samples_q`. The stages mirror `kshana iq frontend`: an optional band-pass
/// (`bandpass_lo`/`bandpass_hi` Hz), adaptive `notch`, pulse `blank`ing, frequency-domain
/// `excise`, `agc`, and a `bits`-bit quantiser (preceded by an automatic AGC unless `no_agc`).
/// Raises `ValueError` on an invalid chain.
#[pyfunction]
#[pyo3(signature = (i, q, fs_hz, bandpass_lo=None, bandpass_hi=None, bandpass_transition=None, bandpass_atten=60.0, notch=false, notch_r=0.95, notch_mu=0.05, blank=None, blank_hold=0, excise=false, excise_fft=256, excise_pfa=1e-3, agc=false, agc_tau=1e-3, bits=None, quant_step=None, no_agc=false))]
#[allow(clippy::too_many_arguments)]
fn iq_frontend<'py>(
    py: Python<'py>,
    i: Vec<f64>,
    q: Vec<f64>,
    fs_hz: f64,
    bandpass_lo: Option<f64>,
    bandpass_hi: Option<f64>,
    bandpass_transition: Option<f64>,
    bandpass_atten: f64,
    notch: bool,
    notch_r: f64,
    notch_mu: f64,
    blank: Option<f64>,
    blank_hold: usize,
    excise: bool,
    excise_fft: usize,
    excise_pfa: f64,
    agc: bool,
    agc_tau: f64,
    bits: Option<u32>,
    quant_step: Option<f64>,
    no_agc: bool,
) -> PyResult<Bound<'py, PyAny>> {
    use crate::iq::frontend::Stage;
    let mut samples = samples_from(&i, &q)?;
    let bandpass = match (bandpass_lo, bandpass_hi) {
        (Some(lo), Some(hi)) => Some((lo, hi)),
        (None, None) => None,
        _ => {
            return Err(PyValueError::new_err(
                "bandpass needs both bandpass_lo and bandpass_hi",
            ))
        }
    };
    let params = FrontendParams {
        bandpass,
        bandpass_transition_hz: bandpass_transition,
        bandpass_atten_db: bandpass_atten,
        notch,
        notch_r,
        notch_mu,
        blank,
        blank_hold,
        excise,
        excise_fft,
        excise_pfa,
        agc,
        agc_tau_s: agc_tau,
        bits,
        quant_step,
        no_agc,
    };
    let mut chain = build_chain(&params, fs_hz).map_err(PyValueError::new_err)?;
    chain.process(&mut samples);
    let oi: Vec<f64> = samples.iter().map(|s| s.re).collect();
    let oq: Vec<f64> = samples.iter().map(|s| s.im).collect();
    json_to_py(py, &serde_json::json!({ "samples_i": oi, "samples_q": oq }))
}

/// Build a GNSS interference map from CSV text (`source` is `"adsb"` or `"ais"`; the input
/// formats are in `docs/INTERFERENCE-MAP.md`). `dataset` is an approved preset
/// (`adsb-lol`, `noaa-marinecadastre`, `kystverket`) or `"custom"`, which also needs
/// `licence`, `licence_url` and `attribution` so the output carries them. `land_geojson`
/// (AIS only) is an optional land-polygon file. Returns one dict per UTC day with
/// `file_name`, `date`, `cells_published`, `cells_flagged` and the
/// `kshana-interference-map/v1` GeoJSON text in `geojson`. Aggregate only: identifiers are
/// never returned, and a degraded cell does not name interference as the cause. Raises
/// `ValueError` on bad input.
#[pyfunction]
#[pyo3(signature = (source, csv, dataset, cell_deg=None, licence=None, licence_url=None, attribution=None, land_geojson=None))]
#[allow(clippy::too_many_arguments)]
fn interference_map<'py>(
    py: Python<'py>,
    source: &str,
    csv: &str,
    dataset: &str,
    cell_deg: Option<f64>,
    licence: Option<String>,
    licence_url: Option<String>,
    attribution: Option<String>,
    land_geojson: Option<String>,
) -> PyResult<Bound<'py, PyAny>> {
    use crate::surface::{interference_map as build, CustomDataset, MapSource, MAX_INPUT_BYTES};
    let custom = (licence.is_some() || licence_url.is_some() || attribution.is_some()).then(|| {
        CustomDataset {
            licence: licence.unwrap_or_default(),
            licence_url: licence_url.unwrap_or_default(),
            attribution: attribution.unwrap_or_default(),
        }
    });
    let days = build(
        MapSource::parse(source).map_err(PyValueError::new_err)?,
        csv,
        dataset,
        cell_deg,
        custom.as_ref(),
        land_geojson.as_deref(),
        MAX_INPUT_BYTES,
    )
    .map_err(PyValueError::new_err)?;
    let v = serde_json::Value::Array(
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
    );
    json_to_py(py, &v)
}

/// Share of a route (GeoJSON LineString or `lat,lon` CSV text) through degraded cells of
/// one or more interference maps (the `geojson` of [`interference_map`]), optionally limited
/// to `date_from`..`date_to` (`YYYY-MM-DD`). Returns the report as JSON text. Cells not
/// observed are not evidence of a clear route, and this is not a forecast. Raises
/// `ValueError` on bad input.
#[pyfunction]
#[pyo3(signature = (route, maps, date_from=None, date_to=None))]
fn route_exposure(
    route: &str,
    maps: Vec<String>,
    date_from: Option<String>,
    date_to: Option<String>,
) -> PyResult<String> {
    let refs: Vec<&str> = maps.iter().map(String::as_str).collect();
    crate::surface::route_exposure(
        route,
        &refs,
        date_from.as_deref(),
        date_to.as_deref(),
        crate::surface::MAX_INPUT_BYTES,
    )
    .map_err(PyValueError::new_err)
}

/// Generate synthetic bridge NMEA 0183 for crew training from a `nmea-scenario` TOML.
/// Returns a dict with `nmea` (CRLF text), `log_json` (the instructor log,
/// `kshana-nmea-training/1`) and `log_text`. `seed` replaces the scenario's seed. Text
/// only: it is for training and testing, never for a vessel's live navigation systems.
/// Raises `ValueError` on an invalid scenario.
#[pyfunction]
#[pyo3(signature = (toml, seed=None))]
fn nmea_training<'py>(
    py: Python<'py>,
    toml: &str,
    seed: Option<u64>,
) -> PyResult<Bound<'py, PyAny>> {
    let t = crate::surface::nmea_training(toml, seed, crate::surface::MAX_INPUT_BYTES)
        .map_err(PyValueError::new_err)?;
    json_to_py(
        py,
        &serde_json::json!({"nmea": t.nmea, "log_json": t.log_json, "log_text": t.log_text}),
    )
}

/// The GNSS IQ signal names [`iq_scene`], [`iq_acquire`] and [`iq_track`] accept.
#[pyfunction]
fn iq_signals() -> Vec<String> {
    crate::iq::cli::signal_names()
        .iter()
        .map(|s| s.to_string())
        .collect()
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
    m.add_function(wrap_pyfunction!(receiver_trust, m)?)?;
    m.add_function(wrap_pyfunction!(interference_map, m)?)?;
    m.add_function(wrap_pyfunction!(route_exposure, m)?)?;
    m.add_function(wrap_pyfunction!(nmea_training, m)?)?;
    m.add_function(wrap_pyfunction!(iq_scene, m)?)?;
    m.add_function(wrap_pyfunction!(iq_scene_broadcast, m)?)?;
    m.add_function(wrap_pyfunction!(iq_acquire, m)?)?;
    m.add_function(wrap_pyfunction!(iq_acq_surface, m)?)?;
    m.add_function(wrap_pyfunction!(iq_track, m)?)?;
    m.add_function(wrap_pyfunction!(iq_loop_designs, m)?)?;
    m.add_function(wrap_pyfunction!(iq_read_epochs, m)?)?;
    m.add_function(wrap_pyfunction!(iq_labfit, m)?)?;
    m.add_function(wrap_pyfunction!(iq_frontend, m)?)?;
    m.add_function(wrap_pyfunction!(iq_monitor, m)?)?;
    m.add_function(wrap_pyfunction!(iq_signals, m)?)?;
    m.add_function(wrap_pyfunction!(iq_test_conditions, m)?)?;
    m.add_function(wrap_pyfunction!(iq_campaign, m)?)?;
    m.add_function(wrap_pyfunction!(iq_campaign_report, m)?)?;
    m.add("__version__", env!("CARGO_PKG_VERSION"))?;
    Ok(())
}
