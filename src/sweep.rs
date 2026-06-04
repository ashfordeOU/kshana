// SPDX-License-Identifier: Apache-2.0
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
        schema_version: "0.7".into(),
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
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#cdd6e0\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0e131b\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">{} vs {} ({} scale)</text>",
        ml, result.metric, result.parameter, result.scale
    ));
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_max, &result.metric));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>",
        line(&|p| p.classical)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#5cb8d6\" stroke-width=\"2\" points=\"{}\"/>",
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
        "<text x=\"{:.0}\" y=\"44\" fill=\"#c0392b\">classical</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#5cb8d6\">quantum</text>",
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
// unchanged. Bootstrap confidence intervals per grid node, and generalisation
// beyond the clock pack, are the remaining parts of the sweep roadmap.
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
        schema_version: "0.7".into(),
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
        schema_version: "0.7".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        parameters: axes.iter().map(|a| a.parameter.clone()).collect(),
        metric: metric.into(),
        shape,
        runs,
        points,
    })
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
}
