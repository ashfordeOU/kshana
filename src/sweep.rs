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
        schema_version: "0.1".into(),
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
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"white\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">{} vs {} ({} scale)</text>",
        ml, result.metric, result.parameter, result.scale
    ));
    svg.push_str(&crate::chart::y_axis(ml, mt, pw, ph, y_max, &result.metric));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#888\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>",
        line(&|p| p.classical)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#2471a3\" stroke-width=\"2\" points=\"{}\"/>",
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
        "<text x=\"{:.0}\" y=\"60\" fill=\"#2471a3\">quantum</text>",
        ml + 10.0
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
}
