// SPDX-License-Identifier: AGPL-3.0-only
//! Trade-study parameter sweeps.
//!
//! A sweep varies one parameter of a clock-holdover scenario across a range and
//! records a chosen figure of merit at each point, for both the quantum and the
//! classical clock — the "how does holdover scale with clock stability?" study a
//! design trade needs. The base scenario is run once per sample value; everything
//! is deterministic.

use crate::fom::FoMScores;
use crate::scenario::Scenario;
use serde::{Deserialize, Serialize};

fn default_scale() -> String {
    "lin".to_string()
}

/// A trade-study sweep: a base scenario, the parameter to vary, the range and
/// spacing, and the figure of merit to record.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SweepScenario {
    /// One of: `threshold_ns`, `duration_s`, `quantum_q_wf`, `classical_q_wf`.
    pub parameter: String,
    /// One of: `holdover_s`, `timing_p95_ns`, `timing_rms_ns`, `availability`,
    /// `integrity`, `security`.
    pub metric: String,
    pub start: f64,
    pub stop: f64,
    pub steps: usize,
    /// `lin` (default) or `log` spacing of the sample values.
    #[serde(default = "default_scale")]
    pub scale: String,
    pub base: Scenario,
}

impl SweepScenario {
    /// The sample values of the swept parameter (at least two, endpoints included).
    pub fn values(&self) -> Vec<f64> {
        let n = self.steps.max(2);
        (0..n)
            .map(|i| {
                let f = i as f64 / (n - 1) as f64;
                if self.scale == "log" {
                    (self.start.ln() + (self.stop.ln() - self.start.ln()) * f).exp()
                } else {
                    self.start + (self.stop - self.start) * f
                }
            })
            .collect()
    }
}

/// One sweep sample: the parameter value and the metric for each clock.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct SweepPoint {
    pub value: f64,
    pub quantum: f64,
    pub classical: f64,
}

/// The result of a sweep.
#[derive(Clone, Debug, Serialize)]
pub struct SweepResult {
    pub schema_version: String,
    pub engine_version: String,
    pub parameter: String,
    pub metric: String,
    pub scale: String,
    pub points: Vec<SweepPoint>,
}

/// Apply a swept parameter value to a clone of the base scenario.
fn apply(base: &Scenario, parameter: &str, value: f64) -> Result<Scenario, String> {
    let mut s = base.clone();
    match parameter {
        "threshold_ns" => s.threshold_ns = value,
        "duration_s" => s.time.duration_s = value,
        "quantum_q_wf" => s.clock_quantum.q_wf = value,
        "classical_q_wf" => s.clock_classical.q_wf = value,
        other => return Err(format!("unknown sweep parameter: {other}")),
    }
    Ok(s)
}

/// Read the chosen figure of merit from a scored result.
fn metric_of(fom: &FoMScores, metric: &str) -> Result<f64, String> {
    Ok(match metric {
        "holdover_s" => fom.holdover_s,
        "timing_p95_ns" => fom.timing_p95_ns,
        "timing_rms_ns" => fom.timing_rms_ns,
        "availability" => fom.availability,
        "integrity" => fom.integrity.unwrap_or(f64::NAN),
        "security" => fom.security.unwrap_or(f64::NAN),
        other => return Err(format!("unknown sweep metric: {other}")),
    })
}

/// Run the sweep: for each sample value, apply it to the base scenario, run the
/// clock-holdover pack, and record the metric for both clocks.
pub fn run_sweep(scn: &SweepScenario) -> Result<SweepResult, String> {
    let mut points = Vec::with_capacity(scn.steps.max(2));
    for value in scn.values() {
        let s = apply(&scn.base, &scn.parameter, value)?;
        let r = crate::run::run(&s);
        points.push(SweepPoint {
            value,
            quantum: metric_of(&r.quantum.fom, &scn.metric)?,
            classical: metric_of(&r.classical.fom, &scn.metric)?,
        });
    }
    Ok(SweepResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        parameter: scn.parameter.clone(),
        metric: scn.metric.clone(),
        scale: scn.scale.clone(),
        points,
    })
}

fn fmt_value(v: f64) -> String {
    if v != 0.0 && (v.abs() < 0.01 || v.abs() >= 1000.0) {
        format!("{v:.2e}")
    } else {
        format!("{v:.3}")
    }
}

/// Render the swept metric versus the parameter as a standalone SVG: the quantum
/// and classical curves over the (linearly or logarithmically spaced) samples.
pub fn to_svg(result: &SweepResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 55.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let pts = &result.points;
    let n = pts.len().max(1);
    let finite = |x: f64| if x.is_finite() { x } else { 0.0 };
    let mut y_max = 0.0_f64;
    for p in pts {
        y_max = y_max.max(finite(p.quantum)).max(finite(p.classical));
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    // Samples are evenly spaced in their (lin/log) parameter space, so position by
    // index; the endpoint values are labelled on the x-axis.
    let xof = |i: usize| ml + (i as f64 / (n.max(2) - 1) as f64) * pw;
    let yof = |v: f64| mt + ph - (finite(v).min(y_max) / y_max) * ph;
    let line = |sel: &dyn Fn(&SweepPoint) -> f64| {
        pts.iter()
            .enumerate()
            .map(|(i, p)| format!("{:.1},{:.1}", xof(i), yof(sel(p))))
            .collect::<Vec<_>>()
            .join(" ")
    };

    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">{} vs {} ({} scale)</text>",
        ml, result.metric, result.parameter, result.scale
    ));
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_max, &result.metric));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        line(&|p| p.classical)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\" points=\"{}\"/>",
        line(&|p| p.quantum)
    ));
    // x-axis endpoint labels.
    if let (Some(first), Some(last)) = (pts.first(), pts.last()) {
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{:.0}\" text-anchor=\"start\">{}</text>",
            axis_y + 18.0,
            fmt_value(first.value)
        ));
        svg.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\">{}</text>",
            ml + pw,
            axis_y + 18.0,
            fmt_value(last.value)
        ));
    }
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">{}</text>",
        ml + pw / 2.0,
        h - 10.0,
        result.parameter
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#d2925e\">classical</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#e0bd84\">quantum</text>",
        ml + 10.0
    ));
    svg.push_str("</svg>");
    svg
}

// ---------------------------------------------------------------------------
// N-dimensional sweeps
//
// The 1-D `SweepScenario` above varies a single parameter. An N-D sweep takes a
// list of axes and evaluates the metric over the full Cartesian product of their
// sample values — the multi-parameter trade study ("how does holdover depend on
// both clock stability *and* outage duration?"). Additive: the 1-D API is
// unchanged. Bootstrap confidence intervals per grid node are provided by
// `nd_sweep_ensemble`; generalisation beyond the clock pack is provided by the
// generic sweep further below (`run_generic_sweep`).
// ---------------------------------------------------------------------------

/// One axis of an N-dimensional sweep: which parameter to vary, over what range,
/// with how many samples and what spacing.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SweepAxis {
    /// One of the parameters accepted by the 1-D sweep (`threshold_ns`,
    /// `duration_s`, `quantum_q_wf`, `classical_q_wf`).
    pub parameter: String,
    pub start: f64,
    pub stop: f64,
    pub steps: usize,
    #[serde(default = "default_scale")]
    pub scale: String,
}

impl SweepAxis {
    /// The sample values along this axis (at least two, endpoints included).
    pub fn values(&self) -> Vec<f64> {
        let n = self.steps.max(2);
        (0..n)
            .map(|i| {
                let f = i as f64 / (n - 1) as f64;
                if self.scale == "log" {
                    (self.start.ln() + (self.stop.ln() - self.start.ln()) * f).exp()
                } else {
                    self.start + (self.stop - self.start) * f
                }
            })
            .collect()
    }
}

/// One node of an N-D sweep grid: the coordinate (one value per axis, in axis
/// order) and the metric for each clock at that point.
#[derive(Clone, Debug, Serialize)]
pub struct NdPoint {
    pub coords: Vec<f64>,
    pub quantum: f64,
    pub classical: f64,
}

/// The result of an N-D sweep: the axis parameters, the metric, the grid shape
/// (samples per axis), and the points in row-major order (the last axis varies
/// fastest).
#[derive(Clone, Debug, Serialize)]
pub struct NdSweepResult {
    pub schema_version: String,
    pub engine_version: String,
    pub parameters: Vec<String>,
    pub metric: String,
    pub shape: Vec<usize>,
    pub points: Vec<NdPoint>,
}

/// Run an N-D sweep: evaluate `metric` over the Cartesian product of the `axes`
/// sample values applied to `base`, for both clocks. Points are emitted in
/// row-major order (last axis fastest). Deterministic.
pub fn nd_sweep(
    base: &Scenario,
    axes: &[SweepAxis],
    metric: &str,
) -> Result<NdSweepResult, String> {
    if axes.is_empty() {
        return Err("nd_sweep needs at least one axis".into());
    }
    let axis_values: Vec<Vec<f64>> = axes.iter().map(|a| a.values()).collect();
    let shape: Vec<usize> = axis_values.iter().map(|v| v.len()).collect();
    let total: usize = shape.iter().product();
    let mut points = Vec::with_capacity(total);
    for flat in 0..total {
        // Decode the flat index into a per-axis coordinate (last axis fastest).
        let mut idx = flat;
        let mut coords = vec![0.0_f64; axes.len()];
        for d in (0..axes.len()).rev() {
            let len = shape[d];
            coords[d] = axis_values[d][idx % len];
            idx /= len;
        }
        // Apply every axis value to the base scenario, then run the clock pack.
        let mut s = base.clone();
        for (a, &v) in axes.iter().zip(&coords) {
            s = apply(&s, &a.parameter, v)?;
        }
        let r = crate::run::run(&s);
        points.push(NdPoint {
            coords,
            quantum: metric_of(&r.quantum.fom, metric)?,
            classical: metric_of(&r.classical.fom, metric)?,
        });
    }
    Ok(NdSweepResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        parameters: axes.iter().map(|a| a.parameter.clone()).collect(),
        metric: metric.into(),
        shape,
        points,
    })
}

/// One node of an N-D sweep evaluated as a Monte-Carlo ensemble: the coordinate
/// and, for each clock, the metric's summary statistics (mean, spread,
/// percentiles, and a bootstrap 95% CI on the mean).
#[derive(Clone, Debug, Serialize)]
pub struct NdPointCi {
    pub coords: Vec<f64>,
    pub quantum: crate::inertial::MetricStat,
    pub classical: crate::inertial::MetricStat,
}

/// The result of an ensemble N-D sweep: as [`NdSweepResult`] but every node
/// carries per-metric statistics over `runs` seeds rather than a single value.
#[derive(Clone, Debug, Serialize)]
pub struct NdSweepCiResult {
    pub schema_version: String,
    pub engine_version: String,
    pub parameters: Vec<String>,
    pub metric: String,
    pub shape: Vec<usize>,
    pub runs: usize,
    pub points: Vec<NdPointCi>,
}

/// Run an N-D sweep where each grid node is a Monte-Carlo ensemble of `runs`
/// seeds, reporting the metric's mean, percentiles, and a percentile-bootstrap
/// 95% confidence interval per node (for both clocks). This turns the
/// single-realisation [`nd_sweep`] into a statistically honest sweep — each node
/// shows the spread, not one draw. Points are emitted in the same row-major order;
/// the per-node bootstrap CI reuses the ensemble machinery (`metric_stat`).
/// Deterministic: the per-node seeds and the bootstrap are fixed-seed.
pub fn nd_sweep_ensemble(
    base: &Scenario,
    axes: &[SweepAxis],
    metric: &str,
    runs: usize,
) -> Result<NdSweepCiResult, String> {
    if axes.is_empty() {
        return Err("nd_sweep needs at least one axis".into());
    }
    let runs = runs.max(1);
    let axis_values: Vec<Vec<f64>> = axes.iter().map(|a| a.values()).collect();
    let shape: Vec<usize> = axis_values.iter().map(|v| v.len()).collect();
    let total: usize = shape.iter().product();
    let mut points = Vec::with_capacity(total);
    for flat in 0..total {
        let mut idx = flat;
        let mut coords = vec![0.0_f64; axes.len()];
        for d in (0..axes.len()).rev() {
            let len = shape[d];
            coords[d] = axis_values[d][idx % len];
            idx /= len;
        }
        let mut s = base.clone();
        for (a, &v) in axes.iter().zip(&coords) {
            s = apply(&s, &a.parameter, v)?;
        }
        // Ensemble over seeds at this node (each run() is a single deterministic
        // realisation; varying the seed gives the distribution).
        let (mut qv, mut cv) = (Vec::with_capacity(runs), Vec::with_capacity(runs));
        for k in 0..runs {
            let mut sk = s.clone();
            sk.seed = base
                .seed
                .wrapping_add((k as u64).wrapping_mul(0x9e37_79b9_7f4a_7c15));
            let r = crate::run::run(&sk);
            qv.push(metric_of(&r.quantum.fom, metric)?);
            cv.push(metric_of(&r.classical.fom, metric)?);
        }
        let boot = base.seed ^ (flat as u64).wrapping_mul(0x100_0001);
        points.push(NdPointCi {
            coords,
            quantum: crate::inertial::metric_stat(&qv, boot ^ 0xA),
            classical: crate::inertial::metric_stat(&cv, boot ^ 0xB),
        });
    }
    Ok(NdSweepCiResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        parameters: axes.iter().map(|a| a.parameter.clone()).collect(),
        metric: metric.into(),
        shape,
        runs,
        points,
    })
}

// ---------------------------------------------------------------------------
// Generic N-D sweeps over any scenario kind
//
// The typed `nd_sweep` above is clock-pack only: it is hard-wired to
// `crate::scenario::Scenario` and the clock FoM. A *generic* sweep varies dotted
// TOML keys of ANY scenario — selected by its own `kind` — over the Cartesian
// product of the axes, re-dispatching every grid node through `run_toml` and
// reading one or more metrics out of the result JSON by dotted path. This
// generalises sweeps to every pack (inertial, gnss-ins, integrity, spoof, …)
// without coupling to each pack's Rust type, sidestepping a typed-scenario enum.
//
// Native evaluation is parallel across grid nodes via `std::thread::scope` — no
// added dependency, so the dependency-light + wasm constraints hold; wasm (no
// threads) falls back to sequential. Deterministic regardless of thread count:
// each node is fully specified by its own TOML and written back at its exact
// flat index, so the output never depends on scheduling.
// ---------------------------------------------------------------------------

/// One axis of a generic sweep: a dotted TOML key into the base scenario, the
/// range, the sample count, and the spacing.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct GenericAxis {
    /// Dotted path to a scalar field of the base scenario, e.g. `time.duration_s`
    /// or `imu_classical.gyro_bias` is **not** valid (arrays are not swept) —
    /// only fields that deserialize from a single number.
    pub key: String,
    pub start: f64,
    pub stop: f64,
    pub steps: usize,
    #[serde(default = "default_scale")]
    pub scale: String,
}

impl GenericAxis {
    /// The sample values along this axis (at least two, endpoints included).
    pub fn values(&self) -> Vec<f64> {
        let n = self.steps.max(2);
        (0..n)
            .map(|i| {
                let f = i as f64 / (n - 1) as f64;
                if self.scale == "log" {
                    (self.start.ln() + (self.stop.ln() - self.start.ln()) * f).exp()
                } else {
                    self.start + (self.stop - self.start) * f
                }
            })
            .collect()
    }
}

/// A generic N-D sweep: a base scenario (as a TOML table carrying its own
/// `kind`), the axes to vary, and the metrics to record as dotted JSON paths
/// into each node's result (e.g. `quantum.fom.holdover_s`).
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct GenericSweepScenario {
    /// The base scenario as a TOML table. Must carry its own `kind` (anything but
    /// a sweep) so each grid node can be dispatched on its own.
    pub base: toml::Value,
    pub axes: Vec<GenericAxis>,
    /// Dotted JSON paths into the per-node result document.
    pub metrics: Vec<String>,
}

/// One node of a generic N-D sweep: the coordinate (one value per axis, axis
/// order) and the recorded metrics (aligned with [`GenericSweepScenario::metrics`]).
#[derive(Clone, Debug, Serialize)]
pub struct GenericNdPoint {
    pub coords: Vec<f64>,
    pub metrics: Vec<f64>,
}

/// The result of a generic N-D sweep.
#[derive(Clone, Debug, Serialize)]
pub struct GenericNdSweepResult {
    pub schema_version: String,
    pub engine_version: String,
    /// The `kind` of the swept base scenario.
    pub kind: String,
    pub keys: Vec<String>,
    pub metrics: Vec<String>,
    pub shape: Vec<usize>,
    pub points: Vec<GenericNdPoint>,
}

/// Set a dotted key of a TOML table to a float. Errors if any path segment is
/// missing or not a table — a mistyped sweep key must fail loudly, never
/// silently create a field the scenario will ignore.
fn set_dotted(root: &mut toml::Value, key: &str, value: f64) -> Result<(), String> {
    let parts: Vec<&str> = key.split('.').collect();
    if parts.iter().any(|p| p.is_empty()) {
        return Err(format!("sweep key `{key}` is malformed"));
    }
    let mut cur = root;
    for part in &parts[..parts.len() - 1] {
        let tbl = cur
            .as_table_mut()
            .ok_or_else(|| format!("sweep key `{key}`: `{part}`'s parent is not a table"))?;
        cur = tbl
            .get_mut(*part)
            .ok_or_else(|| format!("sweep key `{key}`: no field `{part}`"))?;
    }
    let last = parts[parts.len() - 1];
    let tbl = cur
        .as_table_mut()
        .ok_or_else(|| format!("sweep key `{key}`: parent of `{last}` is not a table"))?;
    let slot = tbl
        .get_mut(last)
        .ok_or_else(|| format!("sweep key `{key}`: no field `{last}`"))?;
    *slot = toml::Value::Float(value);
    Ok(())
}

/// Read a dotted path out of a result JSON document as a number.
fn get_dotted_json(root: &serde_json::Value, path: &str) -> Result<f64, String> {
    let mut cur = root;
    for part in path.split('.') {
        cur = cur
            .get(part)
            .ok_or_else(|| format!("metric `{path}`: no field `{part}` in result"))?;
    }
    cur.as_f64()
        .ok_or_else(|| format!("metric `{path}`: value is not a number"))
}

/// Decode a flat row-major index into per-axis coordinates (last axis fastest).
fn coords_of(flat: usize, axis_values: &[Vec<f64>], shape: &[usize]) -> Vec<f64> {
    let mut idx = flat;
    let mut coords = vec![0.0_f64; axis_values.len()];
    for d in (0..axis_values.len()).rev() {
        let len = shape[d];
        coords[d] = axis_values[d][idx % len];
        idx /= len;
    }
    coords
}

/// Evaluate a single grid node: patch the base scenario at this node's
/// coordinates, dispatch it, and extract the metrics. Pure and thread-safe.
fn eval_node(
    base: &toml::Value,
    axes: &[GenericAxis],
    axis_values: &[Vec<f64>],
    shape: &[usize],
    metrics: &[String],
    flat: usize,
) -> Result<GenericNdPoint, String> {
    let coords = coords_of(flat, axis_values, shape);
    let mut node = base.clone();
    for (a, &v) in axes.iter().zip(&coords) {
        set_dotted(&mut node, &a.key, v)?;
    }
    let src = toml::to_string(&node).map_err(|e| format!("sweep node serialize: {e}"))?;
    let out = crate::api::run_toml(&src)?;
    let j: serde_json::Value =
        serde_json::from_str(&out.json).map_err(|e| format!("sweep node result parse: {e}"))?;
    let ms = metrics
        .iter()
        .map(|m| get_dotted_json(&j, m))
        .collect::<Result<Vec<_>, _>>()?;
    Ok(GenericNdPoint {
        coords,
        metrics: ms,
    })
}

/// Evaluate every grid node, in parallel across OS threads on native targets.
#[cfg(not(target_arch = "wasm32"))]
fn eval_grid(
    base: &toml::Value,
    axes: &[GenericAxis],
    axis_values: &[Vec<f64>],
    shape: &[usize],
    metrics: &[String],
    total: usize,
) -> Result<Vec<GenericNdPoint>, String> {
    let nthreads = std::thread::available_parallelism()
        .map(|n| n.get())
        .unwrap_or(1)
        .clamp(1, total.max(1));
    if nthreads <= 1 || total <= 1 {
        return (0..total)
            .map(|f| eval_node(base, axes, axis_values, shape, metrics, f))
            .collect();
    }
    let chunk = total.div_ceil(nthreads);
    let chunk_results: Vec<Result<Vec<(usize, GenericNdPoint)>, String>> =
        std::thread::scope(|scope| {
            let handles: Vec<_> = (0..nthreads)
                .map(|t| {
                    scope.spawn(move || {
                        let lo = t * chunk;
                        let hi = ((t + 1) * chunk).min(total);
                        let mut out = Vec::with_capacity(hi.saturating_sub(lo));
                        for f in lo..hi {
                            out.push((f, eval_node(base, axes, axis_values, shape, metrics, f)?));
                        }
                        Ok(out)
                    })
                })
                .collect();
            handles
                .into_iter()
                .map(|h| {
                    h.join()
                        .unwrap_or_else(|_| Err("sweep worker thread panicked".into()))
                })
                .collect()
        });
    // Place every node at its exact flat index — order is scheduling-independent.
    let mut slots: Vec<Option<GenericNdPoint>> = (0..total).map(|_| None).collect();
    for chunk in chunk_results {
        for (f, p) in chunk? {
            slots[f] = Some(p);
        }
    }
    Ok(slots
        .into_iter()
        .map(|p| p.expect("every grid node was evaluated"))
        .collect())
}

/// Sequential evaluation for wasm (no OS threads).
#[cfg(target_arch = "wasm32")]
fn eval_grid(
    base: &toml::Value,
    axes: &[GenericAxis],
    axis_values: &[Vec<f64>],
    shape: &[usize],
    metrics: &[String],
    total: usize,
) -> Result<Vec<GenericNdPoint>, String> {
    (0..total)
        .map(|f| eval_node(base, axes, axis_values, shape, metrics, f))
        .collect()
}

/// Run a generic N-D sweep over any scenario kind. Each grid node is the base
/// scenario with its swept keys patched, dispatched through `run_toml`; the
/// requested metrics are read from the result JSON. Points are row-major (last
/// axis fastest), parallel on native, deterministic.
pub fn run_generic_sweep(scn: &GenericSweepScenario) -> Result<GenericNdSweepResult, String> {
    if scn.axes.is_empty() {
        return Err("generic sweep needs at least one axis".into());
    }
    if scn.metrics.is_empty() {
        return Err("generic sweep needs at least one metric".into());
    }
    let kind = scn
        .base
        .get("kind")
        .and_then(|k| k.as_str())
        .unwrap_or("")
        .to_string();
    if kind.is_empty() {
        return Err("generic sweep `base` must carry its own `kind`".into());
    }
    if kind == "sweep" || kind == "sweep-nd" {
        return Err("a generic sweep cannot sweep another sweep".into());
    }
    let axis_values: Vec<Vec<f64>> = scn.axes.iter().map(|a| a.values()).collect();
    let shape: Vec<usize> = axis_values.iter().map(|v| v.len()).collect();
    let total: usize = shape.iter().product();
    let points = eval_grid(
        &scn.base,
        &scn.axes,
        &axis_values,
        &shape,
        &scn.metrics,
        total,
    )?;
    Ok(GenericNdSweepResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        kind,
        keys: scn.axes.iter().map(|a| a.key.clone()).collect(),
        metrics: scn.metrics.clone(),
        shape,
        points,
    })
}

/// Render a generic sweep: a 1-axis sweep is drawn as one line per metric versus
/// the axis; higher-dimensional grids get a compact descriptor SVG (the full grid
/// is in the JSON, which has no faithful 2-D line-chart form).
pub fn generic_to_svg(result: &GenericNdSweepResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    if result.shape.len() != 1 || result.points.is_empty() {
        let mut svg = String::new();
        svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"13\" fill=\"#bcb3a3\"><rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"));
        svg.push_str(&format!(
            "<text x=\"40\" y=\"40\" font-size=\"15\" font-weight=\"bold\">{}-D sweep of `{}` — {} nodes</text>",
            result.shape.len(),
            result.kind,
            result.points.len()
        ));
        svg.push_str(&format!(
            "<text x=\"40\" y=\"66\">axes: {} (shape {:?})</text>",
            result.keys.join(" × "),
            result.shape
        ));
        svg.push_str(&format!(
            "<text x=\"40\" y=\"88\">metrics: {} — full grid in JSON</text>",
            result.metrics.join(", ")
        ));
        svg.push_str("</svg>");
        return svg;
    }
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 55.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let pts = &result.points;
    let n = pts.len().max(2);
    let finite = |x: f64| if x.is_finite() { x } else { 0.0 };
    let mut y_max = 0.0_f64;
    for p in pts {
        for &m in &p.metrics {
            y_max = y_max.max(finite(m));
        }
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |i: usize| ml + (i as f64 / (n - 1) as f64) * pw;
    let yof = |v: f64| mt + ph - (finite(v).min(y_max) / y_max) * ph;
    let axis_y = mt + ph;
    let palette = ["#e0bd84", "#d2925e", "#46b67e", "#d2b35e", "#6e7a8a"];
    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\"><rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">sweep of `{}` over {}</text>",
        result.kind, result.keys[0]
    ));
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_max, "metric"));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/><line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    for (mi, mname) in result.metrics.iter().enumerate() {
        let color = palette[mi % palette.len()];
        let line = pts
            .iter()
            .enumerate()
            .map(|(i, p)| format!("{:.1},{:.1}", xof(i), yof(p.metrics[mi])))
            .collect::<Vec<_>>()
            .join(" ");
        svg.push_str(&format!(
            "<polyline fill=\"none\" stroke=\"{color}\" stroke-width=\"2\" points=\"{line}\"/>"
        ));
        svg.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" fill=\"{color}\">{mname}</text>",
            ml + 10.0,
            44.0 + 16.0 * mi as f64
        ));
    }
    if let (Some(first), Some(last)) = (pts.first(), pts.last()) {
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"{:.0}\" text-anchor=\"start\">{}</text><text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\">{}</text>",
            axis_y + 18.0,
            fmt_value(first.coords[0]),
            ml + pw,
            axis_y + 18.0,
            fmt_value(last.coords[0])
        ));
    }
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">{}</text>",
        ml + pw / 2.0,
        h - 10.0,
        result.keys[0]
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn base() -> Scenario {
        Scenario {
            seed: 42,
            threshold_ns: 20.0,
            runs: 1,
            time: TimeCfg {
                step_s: 10.0,
                duration_s: 7200.0,
            },
            gnss: GnssTimeline {
                windows: vec![
                    GnssWindow {
                        t0: 0.0,
                        t1: 600.0,
                        state: GnssState::Nominal,
                    },
                    GnssWindow {
                        t0: 600.0,
                        t1: 7200.0,
                        state: GnssState::Denied,
                    },
                ],
            },
            clock_quantum: ClockCfg {
                id: "optical".into(),
                provenance: "demo".into(),
                y0: 5e-17,
                q_wf: 1e-30,
                q_rw: 0.0,
                drift: 0.0,
                flicker_floor: 0.0,
            },
            clock_classical: ClockCfg {
                id: "csac".into(),
                provenance: "demo".into(),
                y0: 5e-10,
                q_wf: 9e-20,
                q_rw: 0.0,
                drift: 0.0,
                flicker_floor: 0.0,
            },
        }
    }

    fn sweep(
        parameter: &str,
        metric: &str,
        start: f64,
        stop: f64,
        steps: usize,
        scale: &str,
    ) -> SweepScenario {
        SweepScenario {
            parameter: parameter.into(),
            metric: metric.into(),
            start,
            stop,
            steps,
            scale: scale.into(),
            base: base(),
        }
    }

    #[test]
    fn linear_and_log_values_are_hand_derived() {
        let lin = sweep("threshold_ns", "holdover_s", 1.0, 10.0, 3, "lin").values();
        assert_eq!(lin, vec![1.0, 5.5, 10.0]);
        let log = sweep("classical_q_wf", "holdover_s", 1.0, 100.0, 3, "log").values();
        assert!((log[0] - 1.0).abs() < 1e-12);
        assert!((log[1] - 10.0).abs() < 1e-9);
        assert!((log[2] - 100.0).abs() < 1e-9);
    }

    #[test]
    fn apply_sets_the_right_field() {
        let s = apply(&base(), "classical_q_wf", 1e-21).unwrap();
        assert_eq!(s.clock_classical.q_wf, 1e-21);
        assert_eq!(s.clock_quantum.q_wf, 1e-30); // untouched
        assert!(apply(&base(), "nope", 1.0).is_err());
    }

    #[test]
    fn noisier_classical_clock_holds_over_less() {
        // Sweeping the classical white-FM PSD up must not increase its holdover.
        let r = run_sweep(&sweep(
            "classical_q_wf",
            "holdover_s",
            1e-24,
            1e-19,
            8,
            "log",
        ))
        .unwrap();
        assert_eq!(r.points.len(), 8);
        let first = r.points.first().unwrap().classical;
        let last = r.points.last().unwrap().classical;
        assert!(last <= first, "holdover should not grow: {first} -> {last}");
        // The quantum clock is untouched, so its holdover is constant across the sweep.
        let q0 = r.points[0].quantum;
        assert!(r.points.iter().all(|p| (p.quantum - q0).abs() < 1e-9));
    }

    #[test]
    fn sweep_is_reproducible_and_metric_selectable() {
        let s = sweep("threshold_ns", "timing_p95_ns", 5.0, 100.0, 6, "lin");
        let a = run_sweep(&s).unwrap();
        let b = run_sweep(&s).unwrap();
        assert_eq!(a.points[3].classical, b.points[3].classical);
        assert!(run_sweep(&sweep("threshold_ns", "nope", 1.0, 2.0, 2, "lin")).is_err());
    }

    #[test]
    fn svg_has_two_curves() {
        let r = run_sweep(&sweep(
            "classical_q_wf",
            "holdover_s",
            1e-24,
            1e-19,
            8,
            "log",
        ))
        .unwrap();
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert_eq!(svg.matches("<polyline").count(), 2);
        assert!(svg.contains("holdover_s vs classical_q_wf"));
        assert!(svg.ends_with("</svg>"));
    }

    fn axis(parameter: &str, start: f64, stop: f64, steps: usize, scale: &str) -> SweepAxis {
        SweepAxis {
            parameter: parameter.into(),
            start,
            stop,
            steps,
            scale: scale.into(),
        }
    }

    #[test]
    fn nd_sweep_covers_the_full_grid_in_row_major_order() {
        let axes = [
            axis("threshold_ns", 10.0, 30.0, 2, "lin"),
            axis("duration_s", 3600.0, 7200.0, 3, "lin"),
        ];
        let r = nd_sweep(&base(), &axes, "holdover_s").unwrap();
        assert_eq!(r.shape, vec![2, 3]);
        assert_eq!(r.points.len(), 6);
        // Row-major: the last axis (duration) varies fastest.
        assert_eq!(r.points[0].coords, vec![10.0, 3600.0]);
        assert_eq!(r.points[1].coords, vec![10.0, 5400.0]);
        assert_eq!(r.points[2].coords, vec![10.0, 7200.0]);
        assert_eq!(r.points[3].coords, vec![30.0, 3600.0]);
        assert_eq!(r.parameters, vec!["threshold_ns", "duration_s"]);
    }

    #[test]
    fn nd_sweep_node_matches_a_direct_run() {
        // The metric at a grid node must equal a direct run with both parameters
        // applied — the N-D sweep is just that, gridded.
        let t_axis = axis("threshold_ns", 15.0, 25.0, 2, "lin");
        let q_axis = axis("classical_q_wf", 1e-22, 1e-20, 2, "log");
        // Use the axis-computed endpoint values (a log endpoint is not bit-exactly
        // the literal after the ln/exp round-trip).
        let tv = *t_axis.values().last().unwrap();
        let qv = *q_axis.values().last().unwrap();
        let r = nd_sweep(&base(), &[t_axis, q_axis], "timing_p95_ns").unwrap();
        let s = apply(
            &apply(&base(), "threshold_ns", tv).unwrap(),
            "classical_q_wf",
            qv,
        )
        .unwrap();
        let direct = crate::run::run(&s);
        let node = r.points.iter().find(|p| p.coords == vec![tv, qv]).unwrap();
        assert_eq!(node.classical, direct.classical.fom.timing_p95_ns);
        assert_eq!(node.quantum, direct.quantum.fom.timing_p95_ns);
    }

    #[test]
    fn nd_sweep_is_deterministic_and_validates_inputs() {
        let axes = [axis("classical_q_wf", 1e-24, 1e-19, 4, "log")];
        let a = nd_sweep(&base(), &axes, "holdover_s").unwrap();
        let b = nd_sweep(&base(), &axes, "holdover_s").unwrap();
        assert_eq!(
            a.points.iter().map(|p| p.classical).collect::<Vec<_>>(),
            b.points.iter().map(|p| p.classical).collect::<Vec<_>>()
        );
        // A single-axis N-D sweep matches the 1-D sweep values.
        let one_d = run_sweep(&sweep(
            "classical_q_wf",
            "holdover_s",
            1e-24,
            1e-19,
            4,
            "log",
        ))
        .unwrap();
        for (nd, od) in a.points.iter().zip(&one_d.points) {
            assert_eq!(nd.classical, od.classical);
        }
        assert!(nd_sweep(&base(), &[], "holdover_s").is_err());
        assert!(nd_sweep(&base(), &[axis("nope", 1.0, 2.0, 2, "lin")], "holdover_s").is_err());
        assert!(nd_sweep(
            &base(),
            &[axis("classical_q_wf", 1.0, 2.0, 2, "lin")],
            "nope"
        )
        .is_err());
    }

    #[test]
    fn nd_sweep_holdover_falls_off_along_the_noise_axis() {
        // Holding threshold fixed, a noisier classical clock holds over no longer.
        let axes = [
            axis("threshold_ns", 20.0, 20.0, 1, "lin"), // fixed (steps=1 -> 2 identical samples)
            axis("classical_q_wf", 1e-24, 1e-19, 5, "log"),
        ];
        let r = nd_sweep(&base(), &axes, "holdover_s").unwrap();
        // For each fixed-threshold row, classical holdover is non-increasing in noise.
        for row in r.points.chunks(r.shape[1]) {
            for w in row.windows(2) {
                assert!(w[1].classical <= w[0].classical, "holdover grew with noise");
            }
        }
    }

    #[test]
    fn nd_sweep_ensemble_shape_matches_and_brackets_the_mean() {
        let axes = [
            axis("threshold_ns", 15.0, 25.0, 2, "lin"),
            axis("classical_q_wf", 1e-23, 1e-20, 3, "log"),
        ];
        let plain = nd_sweep(&base(), &axes, "timing_p95_ns").unwrap();
        let ens = nd_sweep_ensemble(&base(), &axes, "timing_p95_ns", 12).unwrap();
        assert_eq!(ens.shape, plain.shape);
        assert_eq!(ens.points.len(), plain.points.len());
        assert_eq!(ens.runs, 12);
        for p in &ens.points {
            for st in [&p.quantum, &p.classical] {
                assert!(
                    st.p05 <= st.p50 && st.p50 <= st.p95,
                    "percentiles unordered"
                );
                assert!(
                    st.ci95_low <= st.mean && st.mean <= st.ci95_high,
                    "CI {:?}..{:?} must bracket mean {}",
                    st.ci95_low,
                    st.ci95_high,
                    st.mean
                );
                assert!(st.std >= 0.0);
            }
        }
    }

    #[test]
    fn nd_sweep_ensemble_runs_one_reduces_to_the_single_seed_sweep() {
        // With a single run the node mean is exactly the deterministic nd_sweep
        // value (both use the base seed), and the CI collapses to that point.
        let axes = [axis("classical_q_wf", 1e-23, 1e-20, 4, "log")];
        let plain = nd_sweep(&base(), &axes, "holdover_s").unwrap();
        let ens = nd_sweep_ensemble(&base(), &axes, "holdover_s", 1).unwrap();
        for (e, p) in ens.points.iter().zip(&plain.points) {
            assert_eq!(e.quantum.mean, p.quantum);
            assert_eq!(e.classical.mean, p.classical);
            assert_eq!(e.classical.ci95_low, e.classical.mean);
            assert_eq!(e.classical.ci95_high, e.classical.mean);
        }
    }

    #[test]
    fn nd_sweep_ensemble_is_deterministic() {
        let axes = [axis("classical_q_wf", 1e-23, 1e-20, 3, "log")];
        let a = nd_sweep_ensemble(&base(), &axes, "holdover_s", 8).unwrap();
        let b = nd_sweep_ensemble(&base(), &axes, "holdover_s", 8).unwrap();
        assert_eq!(
            serde_json::to_string(&a).unwrap(),
            serde_json::to_string(&b).unwrap()
        );
        assert!(nd_sweep_ensemble(&base(), &[], "holdover_s", 4).is_err());
    }

    // --- generic sweep (any pack, via TOML/JSON boundary) ---

    fn imu_base() -> toml::Value {
        // A real, shipped non-clock scenario (the inertial dead-reckoning pack),
        // proving the generic sweep generalises beyond the clock scenario type.
        toml::from_str(include_str!("../scenarios/imu-deadreckoning.toml")).unwrap()
    }

    fn gaxis(key: &str, start: f64, stop: f64, steps: usize) -> GenericAxis {
        GenericAxis {
            key: key.into(),
            start,
            stop,
            steps,
            scale: "lin".into(),
        }
    }

    #[test]
    fn generic_sweep_generalises_to_a_non_clock_pack() {
        let base = imu_base();
        let scn = GenericSweepScenario {
            base: base.clone(),
            axes: vec![gaxis("threshold_m", 100.0, 500.0, 5)],
            metrics: vec!["classical.fom.holdover_s".into()],
        };
        let r = run_generic_sweep(&scn).unwrap();
        assert_eq!(r.kind, "inertial");
        assert_eq!(r.shape, vec![5]);
        assert_eq!(r.points.len(), 5);

        // Oracle: node 0 sweeps threshold to the file's own 100.0 (a no-op patch),
        // so it must equal a plain, unpatched run of the base scenario.
        let oracle = crate::api::run_toml(&toml::to_string(&base).unwrap()).unwrap();
        let oj: serde_json::Value = serde_json::from_str(&oracle.json).unwrap();
        let oracle_holdover = get_dotted_json(&oj, "classical.fom.holdover_s").unwrap();
        assert_eq!(r.points[0].coords, vec![100.0]);
        assert_eq!(r.points[0].metrics[0], oracle_holdover);

        // A higher position-error alert limit can only extend the holdover (drift
        // crosses a larger bound later) — non-decreasing, and it genuinely moves,
        // proving the swept key is actually applied to the dispatched scenario.
        for w in r.points.windows(2) {
            assert!(
                w[1].metrics[0] >= w[0].metrics[0],
                "holdover must be non-decreasing in threshold_m: {:?}",
                r.points
            );
        }
        assert!(r.points.last().unwrap().metrics[0] > r.points[0].metrics[0]);
    }

    #[test]
    fn generic_sweep_runs_a_2d_grid_with_nested_keys_deterministically() {
        let base = imu_base();
        let scn = GenericSweepScenario {
            base,
            axes: vec![
                gaxis("threshold_m", 100.0, 300.0, 2),
                gaxis("accel_classical.bias", 1.0e-3, 3.0e-3, 3),
            ],
            metrics: vec![
                "classical.fom.holdover_s".into(),
                "classical.fom.pos_rms_m".into(),
            ],
        };
        let r = run_generic_sweep(&scn).unwrap();
        assert_eq!(r.shape, vec![2, 3]);
        assert_eq!(r.points.len(), 6);
        // Row-major: the last axis (bias) varies fastest.
        assert_eq!(r.points[0].coords, vec![100.0, 1.0e-3]);
        assert_eq!(r.points[1].coords, vec![100.0, 2.0e-3]);
        assert_eq!(r.points[3].coords, vec![300.0, 1.0e-3]);
        assert_eq!(r.points[0].metrics.len(), 2);
        // The nested key actually moved the result: at fixed threshold, a larger
        // accelerometer bias drives a larger drift RMS (pos_rms_m monotone in bias).
        assert!(r.points[2].metrics[1] > r.points[0].metrics[1]);
        // Deterministic — the parallel native path must be order-independent.
        let r2 = run_generic_sweep(&scn).unwrap();
        assert_eq!(
            serde_json::to_string(&r).unwrap(),
            serde_json::to_string(&r2).unwrap()
        );
    }

    #[test]
    fn generic_sweep_rejects_bad_keys_metrics_and_missing_kind() {
        let base = imu_base();
        let bad_key = GenericSweepScenario {
            base: base.clone(),
            axes: vec![gaxis("time.no_such_field", 1.0, 2.0, 2)],
            metrics: vec!["classical.fom.holdover_s".into()],
        };
        assert!(run_generic_sweep(&bad_key).is_err());

        let bad_metric = GenericSweepScenario {
            base: base.clone(),
            axes: vec![gaxis("threshold_m", 100.0, 200.0, 2)],
            metrics: vec!["classical.fom.not_a_metric".into()],
        };
        assert!(run_generic_sweep(&bad_metric).is_err());

        let mut no_kind = base.clone();
        no_kind.as_table_mut().unwrap().remove("kind");
        let missing_kind = GenericSweepScenario {
            base: no_kind,
            axes: vec![gaxis("threshold_m", 100.0, 200.0, 2)],
            metrics: vec!["classical.fom.holdover_s".into()],
        };
        assert!(run_generic_sweep(&missing_kind).is_err());

        let no_axes = GenericSweepScenario {
            base,
            axes: vec![],
            metrics: vec!["classical.fom.holdover_s".into()],
        };
        assert!(run_generic_sweep(&no_axes).is_err());
    }

    #[test]
    fn generic_sweep_dispatches_from_toml() {
        let src = r#"
kind = "sweep-nd"
metrics = ["classical.fom.holdover_s"]

[[axes]]
key = "threshold_m"
start = 100.0
stop = 300.0
steps = 3

[base]
kind = "inertial"
seed = 42
threshold_m = 100.0
[base.time]
step_s = 10.0
duration_s = 7200.0
[base.gnss]
windows = [
  { t0 = 0.0,   t1 = 600.0,  state = "nominal" },
  { t0 = 600.0, t1 = 7200.0, state = "denied" },
]
[base.accel_quantum]
id = "q"
provenance = "test"
bias = 5.88e-7
q_va = 4.6656e-8
[base.accel_classical]
id = "c"
provenance = "test"
bias = 1.57e-3
q_va = 3.8416e-8
"#;
        let out = crate::api::run_toml(src).unwrap();
        let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        assert_eq!(j["kind"], "inertial");
        assert_eq!(j["shape"][0], 3);
        assert!(out.summary.contains("generic sweep"));
        assert!(out.svg.contains("<svg"));
    }
}
