// SPDX-License-Identifier: Apache-2.0
use crate::fom::{FoMScores, Sample};
use crate::scenario::Scenario;
use crate::types::ModelSpec;
use serde::Serialize;
use sha2::{Digest, Sha256};

/// One clock's run: its spec, full error series, scored FoMs, and the
/// overlapping Allan-deviation curve of the clock's phase over the run.
#[derive(Clone, Debug, Serialize)]
pub struct ClockRun {
    pub spec: ModelSpec,
    pub series: Vec<Sample>,
    pub fom: FoMScores,
    #[serde(default)]
    pub adev_curve: Vec<crate::allan::AdevPoint>,
    /// Kalman filter-consistency health (NIS/NEES vs χ² bands). `None` for runs
    /// that do not assess it.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub filter_health: Option<crate::filter_health::FilterHealth>,
}

/// Top-level result artifact (versioned, self-describing, reproducible).
#[derive(Clone, Debug, Serialize)]
pub struct RunResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub threshold_ns: f64,
    pub quantum: ClockRun,
    pub classical: ClockRun,
    /// Optional propagated Earth-centred-inertial track of the user spacecraft
    /// (km), one `[x, y, z]` per sampled time, populated only for the orbit pack
    /// so the playground can draw the 3D orbit. `None` for non-orbit runs; an
    /// output-only field, so it does not perturb [`hash_scenario`] (which hashes
    /// only the scenario *inputs*) or the shared-link reproducibility.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub eci_track: Option<Vec<[f64; 3]>>,
}

/// sha256 hex over the canonical JSON of the scenario (field order is stable).
pub fn hash_scenario(scn: &Scenario) -> String {
    let canonical = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(canonical.as_bytes());
    hex::encode(h.finalize())
}

/// Render the quantum-vs-classical timing-error divergence as a standalone SVG
/// (no dependencies). |error| in ns vs time, with the spec threshold line.
pub fn to_svg(result: &RunResult) -> String {
    use crate::fom::Sample;
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let c = &result.classical.series;
    let q = &result.quantum.series;
    let t_max = c.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    let mut y_max = result.threshold_ns * 1.3;
    for s in c.iter().chain(q.iter()) {
        y_max = y_max.max(s.error_ns.abs());
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |e: f64| mt + ph - (e.min(y_max) / y_max) * ph;
    let points = |series: &[Sample]| {
        series
            .iter()
            .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.error_ns.abs())))
            .collect::<Vec<_>>()
            .join(" ")
    };
    let thr_y = yof(result.threshold_ns);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Clock holdover: timing error during GNSS outage</text>",
        ml
    ));
    // The provenance footer is stamped centrally for every chart in `api::run_toml`.
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "timing error (ns)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">spec {:.0} ns</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.threshold_ns
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#d2925e\" stroke-width=\"2\" points=\"{}\"/>",
        points(c)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\" points=\"{}\"/>",
        points(q)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#d2925e\">classical: {}</text>",
        ml + 10.0,
        result.classical.spec.id
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#e0bd84\">quantum: {}</text>",
        ml + 10.0,
        result.quantum.spec.id
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::*;

    fn demo() -> Scenario {
        Scenario {
            seed: 1,
            threshold_ns: 100.0,
            runs: 1,
            time: TimeCfg {
                step_s: 10.0,
                duration_s: 60.0,
            },
            gnss: GnssTimeline {
                windows: vec![
                    GnssWindow {
                        t0: 0.0,
                        t1: 30.0,
                        state: GnssState::Nominal,
                    },
                    GnssWindow {
                        t0: 30.0,
                        t1: 60.0,
                        state: GnssState::Denied,
                    },
                ],
            },
            clock_quantum: ClockCfg {
                id: "q".into(),
                provenance: "d".into(),
                y0: 1e-13,
                q_wf: 1e-26,
                q_rw: 1e-32,
                drift: 0.0,
                flicker_floor: 0.0,
            },
            clock_classical: ClockCfg {
                id: "c".into(),
                provenance: "d".into(),
                y0: 1e-11,
                q_wf: 1e-24,
                q_rw: 1e-30,
                drift: 0.0,
                flicker_floor: 0.0,
            },
        }
    }

    #[test]
    fn scenario_hash_is_deterministic_and_sensitive() {
        let a = hash_scenario(&demo());
        let b = hash_scenario(&demo());
        assert_eq!(a, b);
        assert_eq!(a.len(), 64);
        let mut other = demo();
        other.seed = 2;
        assert_ne!(a, hash_scenario(&other));
    }
}

#[cfg(test)]
mod svg_tests {
    use super::*;
    use crate::fom::{FoMScores, Sample};
    use crate::scenario::GnssState::Denied;
    use crate::types::ModelSpec;

    fn run_of(id: &str, errs: &[f64]) -> ClockRun {
        let series = errs
            .iter()
            .enumerate()
            .map(|(i, &e)| Sample {
                t: i as f64,
                error_ns: e,
                gnss: Denied,
            })
            .collect();
        ClockRun {
            spec: ModelSpec {
                id: id.into(),
                kind: "clock".into(),
                provenance: "x".into(),
                params: serde_json::json!({}),
            },
            series,
            fom: FoMScores {
                timing_rms_ns: 0.0,
                timing_p95_ns: 0.0,
                holdover_s: 0.0,
                resilience_slope_ns_per_s: 0.0,
                availability: 1.0,
                integrity: None,
                security: None,
            },
            adev_curve: vec![],
            filter_health: None,
        }
    }

    #[test]
    fn to_svg_produces_valid_chart() {
        let r = RunResult {
            schema_version: crate::interchange::SCHEMA_VERSION.into(),
            engine_version: "test".into(),
            scenario_hash: "abc".into(),
            seed: 1,
            threshold_ns: 20.0,
            quantum: run_of("optical", &[0.0, 0.0, 0.1]),
            classical: run_of("csac", &[0.0, 15.0, 40.0]),
            eci_track: None,
        };
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert_eq!(svg.matches("<polyline").count(), 2);
        assert!(svg.contains("spec 20 ns"));
        assert!(svg.ends_with("</svg>"));
    }
}
