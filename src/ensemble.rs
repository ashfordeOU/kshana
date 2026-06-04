// SPDX-License-Identifier: Apache-2.0
//! Monte Carlo ensembles for the clock-holdover scenario.
//!
//! A single run is one realization of the clock noise; its figures of merit are a
//! sample, not the expectation. Running the scenario over many seeds and reporting
//! the mean together with a 5th–95th-percentile spread turns each figure of merit
//! into a statistically meaningful result, and the per-timestep error percentile
//! envelope gives a confidence band on the error trajectory itself.
//!
//! The ensemble is fully deterministic: realization `k` uses seed `base + k` for
//! the quantum clock and `base + k + golden` for the classical clock (the same
//! decorrelation offset as a single run), so a given scenario reproduces exactly.

use crate::report::ClockRun;
use crate::run::run_clock;
use crate::scenario::Scenario;
use crate::types::ModelSpec;
use serde::Serialize;

/// Decorrelation offset between the paired quantum and classical realizations
/// (golden-ratio constant), matching the single-run convention in [`crate::run`].
const GOLDEN: u64 = 0x9e37_79b9_7f4a_7c15;

/// Summary statistics of one figure of merit across the ensemble.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct Stat {
    pub mean: f64,
    pub p05: f64,
    pub p50: f64,
    pub p95: f64,
}

/// One point of the error confidence band: time and the 5th/50th/95th-percentile
/// absolute error (ns) across the ensemble at that time.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct BandPoint {
    pub t: f64,
    pub p05_ns: f64,
    pub p50_ns: f64,
    pub p95_ns: f64,
}

/// Ensemble result for one clock: its spec, figure-of-merit statistics, and the
/// per-timestep error confidence band.
#[derive(Clone, Debug, Serialize)]
pub struct EnsembleClock {
    pub spec: ModelSpec,
    pub holdover_s: Stat,
    pub timing_p95_ns: Stat,
    pub timing_rms_ns: Stat,
    pub availability: Stat,
    pub integrity: Option<Stat>,
    /// Deterministic given the clock parameters, so a single value, not a spread.
    pub security: Option<f64>,
    /// Filter-consistency health (NIS/NEES). A property of the clock's Kalman
    /// tuning, not the realization, so one representative assessment, not a spread.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub filter_health: Option<crate::filter_health::FilterHealth>,
    pub band: Vec<BandPoint>,
}

/// Top-level Monte Carlo result (versioned, self-describing, reproducible).
#[derive(Clone, Debug, Serialize)]
pub struct EnsembleResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    pub runs: usize,
    pub threshold_ns: f64,
    pub quantum: EnsembleClock,
    pub classical: EnsembleClock,
}

/// Nearest-rank percentile (`p` in `[0, 1]`) of an already-sorted slice.
fn percentile(sorted: &[f64], p: f64) -> f64 {
    if sorted.is_empty() {
        return 0.0;
    }
    let idx = (((sorted.len() - 1) as f64) * p).round() as usize;
    sorted[idx]
}

/// Mean and 5th/50th/95th percentiles of a sample.
fn stat(mut v: Vec<f64>) -> Stat {
    let mean = if v.is_empty() {
        0.0
    } else {
        v.iter().sum::<f64>() / v.len() as f64
    };
    v.sort_by(f64::total_cmp);
    Stat {
        mean,
        p05: percentile(&v, 0.05),
        p50: percentile(&v, 0.50),
        p95: percentile(&v, 0.95),
    }
}

/// Aggregate the realizations of one clock into figure-of-merit statistics and the
/// per-timestep error band. All runs share the same time grid.
fn aggregate(runs: &[ClockRun]) -> EnsembleClock {
    let spec = runs[0].spec.clone();
    let holdover_s = stat(runs.iter().map(|r| r.fom.holdover_s).collect());
    let timing_p95_ns = stat(runs.iter().map(|r| r.fom.timing_p95_ns).collect());
    let timing_rms_ns = stat(runs.iter().map(|r| r.fom.timing_rms_ns).collect());
    let availability = stat(runs.iter().map(|r| r.fom.availability).collect());
    // Integrity varies with the realization; aggregate only if every run reports it.
    let integrity = if runs.iter().all(|r| r.fom.integrity.is_some()) {
        Some(stat(
            runs.iter().map(|r| r.fom.integrity.unwrap()).collect(),
        ))
    } else {
        None
    };
    // Security depends only on the clock parameters, so it is identical across runs.
    let security = runs[0].fom.security;
    // Filter health is likewise a property of the tuning (same q/r across runs), so
    // a single representative assessment from the first realization.
    let filter_health = runs[0].filter_health.clone();

    let n_samples = runs[0].series.len();
    let mut band = Vec::with_capacity(n_samples);
    for i in 0..n_samples {
        let t = runs[0].series[i].t;
        let mut errs: Vec<f64> = runs.iter().map(|r| r.series[i].error_ns.abs()).collect();
        errs.sort_by(f64::total_cmp);
        band.push(BandPoint {
            t,
            p05_ns: percentile(&errs, 0.05),
            p50_ns: percentile(&errs, 0.50),
            p95_ns: percentile(&errs, 0.95),
        });
    }

    EnsembleClock {
        spec,
        holdover_s,
        timing_p95_ns,
        timing_rms_ns,
        availability,
        integrity,
        security,
        filter_health,
        band,
    }
}

/// Run the clock-holdover scenario over `scn.runs` realizations and aggregate.
pub fn run_ensemble(scn: &Scenario) -> EnsembleResult {
    let runs = scn.runs.max(1);
    let mut q = Vec::with_capacity(runs);
    let mut c = Vec::with_capacity(runs);
    for k in 0..runs {
        let s = scn.seed.wrapping_add(k as u64);
        q.push(run_clock(scn, &scn.clock_quantum, s));
        c.push(run_clock(scn, &scn.clock_classical, s.wrapping_add(GOLDEN)));
    }
    EnsembleResult {
        schema_version: "0.7".into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: crate::report::hash_scenario(scn),
        seed: scn.seed,
        runs,
        threshold_ns: scn.threshold_ns,
        quantum: aggregate(&q),
        classical: aggregate(&c),
    }
}

/// Render the quantum-vs-classical error confidence bands as a standalone SVG:
/// each clock's 5th–95th-percentile envelope is a shaded band with the median
/// drawn on top, against the spec threshold line.
pub fn to_svg(result: &EnsembleResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let bands = [&result.classical.band, &result.quantum.band];
    let t_max = bands
        .iter()
        .flat_map(|b| b.iter())
        .map(|p| p.t)
        .fold(1.0_f64, f64::max);
    let mut y_max = result.threshold_ns * 1.3;
    for b in bands {
        for p in b.iter() {
            y_max = y_max.max(p.p95_ns);
        }
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |e: f64| mt + ph - (e.min(y_max) / y_max) * ph;

    // Closed polygon tracing p05 forward then p95 backward — the shaded envelope.
    let band_poly = |b: &[BandPoint]| {
        let mut pts: Vec<String> = b
            .iter()
            .map(|p| format!("{:.1},{:.1}", xof(p.t), yof(p.p05_ns)))
            .collect();
        for p in b.iter().rev() {
            pts.push(format!("{:.1},{:.1}", xof(p.t), yof(p.p95_ns)));
        }
        pts.join(" ")
    };
    let median_line = |b: &[BandPoint]| {
        b.iter()
            .map(|p| format!("{:.1},{:.1}", xof(p.t), yof(p.p50_ns)))
            .collect::<Vec<_>>()
            .join(" ")
    };

    let thr_y = yof(result.threshold_ns);
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#cdd6e0\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0e131b\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Clock holdover: timing-error confidence band ({} runs)</text>",
        ml, result.runs
    ));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "timing error (ns)",
    ));
    // Shaded envelopes (classical first so the quantum band sits on top).
    svg.push_str(&format!(
        "<polygon fill=\"#c0392b\" fill-opacity=\"0.18\" stroke=\"none\" points=\"{}\"/>",
        band_poly(&result.classical.band)
    ));
    svg.push_str(&format!(
        "<polygon fill=\"#5cb8d6\" fill-opacity=\"0.18\" stroke=\"none\" points=\"{}\"/>",
        band_poly(&result.quantum.band)
    ));
    // Axes.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>",
        ml + pw
    ));
    // Spec threshold.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{thr_y:.1}\" x2=\"{:.0}\" y2=\"{thr_y:.1}\" stroke=\"#d33\" stroke-dasharray=\"6 4\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#d33\">spec {:.0} ns</text>",
        ml + 4.0,
        thr_y - 4.0,
        result.threshold_ns
    ));
    // Median lines.
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#c0392b\" stroke-width=\"2\" points=\"{}\"/>",
        median_line(&result.classical.band)
    ));
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#5cb8d6\" stroke-width=\"2\" points=\"{}\"/>",
        median_line(&result.quantum.band)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#c0392b\">classical: {} (median, 5-95% band)</text>",
        ml + 10.0,
        result.classical.spec.id
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#5cb8d6\">quantum: {} (median, 5-95% band)</text>",
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

    fn demo(runs: usize) -> Scenario {
        Scenario {
            seed: 7,
            threshold_ns: 50.0,
            runs,
            time: TimeCfg {
                step_s: 30.0,
                duration_s: 3600.0,
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
                        t1: 3600.0,
                        state: GnssState::Denied,
                    },
                ],
            },
            clock_quantum: ClockCfg {
                id: "optical".into(),
                provenance: "demo".into(),
                y0: 1e-13,
                q_wf: 1e-26,
                q_rw: 1e-34,
                drift: 0.0,
                flicker_floor: 0.0,
            },
            clock_classical: ClockCfg {
                id: "csac".into(),
                provenance: "demo".into(),
                y0: 1e-11,
                q_wf: 1e-22,
                q_rw: 1e-30,
                drift: 0.0,
                flicker_floor: 0.0,
            },
        }
    }

    #[test]
    fn percentile_is_nearest_rank() {
        let v = vec![1.0, 2.0, 3.0, 4.0, 5.0];
        assert_eq!(percentile(&v, 0.0), 1.0);
        assert_eq!(percentile(&v, 0.5), 3.0); // round((5-1)*0.5)=2 -> v[2]
        assert_eq!(percentile(&v, 1.0), 5.0);
    }

    #[test]
    fn single_run_collapses_the_spread() {
        // With one realization, every percentile equals the single sample.
        let r = run_ensemble(&demo(1));
        let s = r.quantum.holdover_s;
        assert_eq!(s.mean, s.p05);
        assert_eq!(s.p05, s.p50);
        assert_eq!(s.p50, s.p95);
        assert_eq!(r.runs, 1);
    }

    #[test]
    fn band_is_ordered_and_full_length() {
        let r = run_ensemble(&demo(16));
        assert_eq!(r.classical.band.len(), 3600 / 30 + 1);
        for p in &r.classical.band {
            assert!(p.p05_ns <= p.p50_ns + 1e-9, "p05<=p50 at t={}", p.t);
            assert!(p.p50_ns <= p.p95_ns + 1e-9, "p50<=p95 at t={}", p.t);
        }
        // The quieter quantum clock has a lower median error band at the end.
        let last = r.quantum.band.len() - 1;
        assert!(r.quantum.band[last].p50_ns <= r.classical.band[last].p50_ns);
    }

    #[test]
    fn ensemble_is_reproducible() {
        let a = run_ensemble(&demo(8));
        let b = run_ensemble(&demo(8));
        assert_eq!(a.quantum.holdover_s.mean, b.quantum.holdover_s.mean);
        assert_eq!(a.classical.timing_p95_ns.p95, b.classical.timing_p95_ns.p95);
    }

    #[test]
    fn svg_has_bands_and_medians() {
        let r = run_ensemble(&demo(8));
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg"));
        assert_eq!(svg.matches("<polygon").count(), 2);
        assert_eq!(svg.matches("<polyline").count(), 2);
        assert!(svg.contains("8 runs"));
        assert!(svg.ends_with("</svg>"));
    }
}
