// SPDX-License-Identifier: AGPL-3.0-only
//! Active time-spoofing attack demonstrator.
//!
//! Turns the [Security figure of merit](crate::security) from a number into a
//! scenario: an attacker injects a slowly-ramping false GNSS time, and the
//! receiver's clock-aided integrity monitor — which cross-checks the asserted time
//! against its own clock's coasted prediction — flags the spoof when the
//! discrepancy exceeds the detection bound `k * sigma_monitor`. A quieter clock has
//! a tighter bound, so it detects a smaller, slower spoof, *before* the offset can
//! grow to the operational timing spec. A noisy clock whose own coast uncertainty
//! already exceeds the spec cannot tell the spoof from its own drift, so the attack
//! reaches the spec undetected.
//!
//! The spoof offset is `rate * (t - start)`; detection is the first time it exceeds
//! the clock's detection bound. The headline outcome is whether the spoof reaches
//! the spec before being detected — exactly the condition the Security score
//! summarises.

use crate::detection::{analytic_pmd, detection_boundary, monte_carlo_pfa_pmd};
use crate::run::PHASE_MEAS_VAR_S2;
use crate::scenario::{ClockCfg, TimeCfg};
use crate::security::{min_detectable_offset_ns, monitor_sigma_s, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::f64::consts::TAU;

/// The shape of the injected time-spoof offset, as a function of time since the
/// attack starts. All offsets are in nanoseconds.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(tag = "kind", rename_all = "snake_case")]
pub enum SpoofShape {
    /// A slowly-growing false time: `offset(τ) = rate · τ`.
    LinearRamp { rate_ns_per_s: f64 },
    /// An instantaneous jump to a fixed offset held thereafter.
    StepJump { magnitude_ns: f64 },
    /// Meaconing (delayed re-broadcast): a constant delay with a sinusoidal
    /// component from the relay geometry, `delay·(1 + sin(2π·f·τ))`.
    Meaconing { delay_ns: f64, oscillation_hz: f64 },
    /// Replay of a captured signal: a fixed time offset equal to the capture age.
    Replay { capture_offset_s: f64 },
}

impl SpoofShape {
    /// The spoof offset (ns) at `tau` seconds after the attack starts (`tau ≥ 0`).
    pub fn offset_ns(&self, tau: f64) -> f64 {
        match *self {
            SpoofShape::LinearRamp { rate_ns_per_s } => rate_ns_per_s * tau,
            SpoofShape::StepJump { magnitude_ns } => magnitude_ns,
            SpoofShape::Meaconing {
                delay_ns,
                oscillation_hz,
            } => delay_ns * (1.0 + (TAU * oscillation_hz * tau).sin()),
            SpoofShape::Replay { capture_offset_s } => capture_offset_s * 1e9,
        }
    }
}

fn default_target_pfa() -> f64 {
    0.01
}
fn default_mc_runs() -> usize {
    10_000
}

/// The injected spoof. For backward compatibility a bare `rate_ns_per_s` is
/// accepted as shorthand for a [`SpoofShape::LinearRamp`]; otherwise give an
/// explicit `[attack.shape]` block. `target_pfa` is the detector's false-alarm
/// budget and `mc_runs` the Monte-Carlo trial count per hypothesis.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct AttackCfg {
    pub start_s: f64,
    /// Legacy shorthand for a linear ramp (used only when `shape` is absent).
    #[serde(default)]
    pub rate_ns_per_s: Option<f64>,
    /// The explicit spoof shape. Absent ⇒ a linear ramp at `rate_ns_per_s`.
    #[serde(default)]
    pub shape: Option<SpoofShape>,
    /// Detector false-alarm budget (probability). Default 0.01.
    #[serde(default = "default_target_pfa")]
    pub target_pfa: f64,
    /// Monte-Carlo trials per hypothesis for the empirical P_fa / P_md. Default 10000.
    #[serde(default = "default_mc_runs")]
    pub mc_runs: usize,
}

impl AttackCfg {
    /// The resolved spoof shape (the explicit `shape`, else the legacy linear ramp).
    pub fn resolved_shape(&self) -> SpoofShape {
        self.shape.clone().unwrap_or(SpoofShape::LinearRamp {
            rate_ns_per_s: self.rate_ns_per_s.unwrap_or(0.0),
        })
    }
}

/// A spoofing-attack scenario against two clocks.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SpoofScenario {
    pub threshold_ns: f64,
    pub time: TimeCfg,
    pub attack: AttackCfg,
    pub clock_quantum: ClockCfg,
    pub clock_classical: ClockCfg,
}

/// One sample: the spoof offset and the clock's detection bound at that time.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct SpoofSample {
    pub t: f64,
    pub offset_ns: f64,
    pub bound_ns: f64,
}

/// The stochastic detector's operating point against this clock, at the
/// operationally-harmful spoof magnitude (the timing spec). The χ²₁ energy test
/// `(y/σ)² > λ` is run at the `target_pfa` false-alarm budget; `P_md` is the
/// probability the detector misses a spec-sized spoof. Both analytic (closed-form
/// Gaussian) and Monte-Carlo estimates are reported so they can be cross-checked.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofDetectionStats {
    /// 1σ monitor noise over the window (ns).
    pub monitor_sigma_ns: f64,
    /// Target / analytic false-alarm probability (the detector's design budget).
    pub target_pfa: f64,
    /// The two-sided |y| detection boundary `γ = σ·Φ⁻¹(1 − P_fa/2)` (ns).
    pub boundary_ns: f64,
    /// The spoof magnitude P_md is evaluated at — the operationally harmful spec (ns).
    pub eval_offset_ns: f64,
    /// Closed-form missed-detection probability at `eval_offset_ns`.
    pub analytic_pmd: f64,
    /// Monte-Carlo false-alarm probability (validates `target_pfa`).
    pub mc_pfa: f64,
    /// Monte-Carlo missed-detection probability (validates `analytic_pmd`).
    pub mc_pmd: f64,
    /// Monte-Carlo trials per hypothesis.
    pub mc_runs: usize,
}

/// One clock's response to the spoof.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofClock {
    pub id: String,
    /// Smallest spoof offset this clock's monitor can flag (= `k * sigma_monitor`).
    pub min_detectable_ns: f64,
    /// Time the spoof is detected (offset first exceeds the bound), if within the run.
    pub detect_time_s: Option<f64>,
    /// Spoof offset at detection (ns).
    pub offset_at_detection_ns: Option<f64>,
    /// True if the spoof reaches the operational timing spec before it is detected —
    /// i.e. the detection bound is at or above the spec, so the attack succeeds.
    pub breaches_spec_undetected: bool,
    /// Security figure of merit = probability of correctly detecting a spec-sized
    /// spoof = `1 − P_md`. Higher is better.
    pub security_fom: f64,
    /// The stochastic detector's operating characteristics.
    pub detection: SpoofDetectionStats,
    pub series: Vec<SpoofSample>,
}

/// Top-level spoofing-attack result.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub threshold_ns: f64,
    pub quantum: SpoofClock,
    pub classical: SpoofClock,
}

/// A deterministic Monte-Carlo seed from a clock id, so the empirical P_fa / P_md
/// are reproducible and the two clocks draw independent streams.
fn mc_seed(id: &str) -> u64 {
    id.bytes().fold(0xC0FF_EE15_u64, |a, b| {
        a.wrapping_mul(131).wrapping_add(b as u64)
    })
}

fn run_clock(scn: &SpoofScenario, cfg: &ClockCfg) -> SpoofClock {
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let samples = if dt > 0.0 {
        (SPOOF_MONITOR_S / dt).round()
    } else {
        1.0
    };
    let bound_ns = min_detectable_offset_ns(
        cfg.q_wf,
        cfg.q_rw,
        PHASE_MEAS_VAR_S2,
        SPOOF_MONITOR_S,
        samples,
        SPOOF_DETECT_K,
    );

    // The stochastic detector: a χ²₁ energy test on the monitor statistic, run at
    // the configured false-alarm budget. P_md is reported at the operationally
    // harmful magnitude — the timing spec — because that is the smallest spoof
    // that matters (a gross multi-µs ramp is trivially caught by any clock; the
    // discriminating question is the miss probability of a *spec-sized* spoof).
    let sigma_s = monitor_sigma_s(
        cfg.q_wf,
        cfg.q_rw,
        PHASE_MEAS_VAR_S2,
        SPOOF_MONITOR_S,
        samples,
    );
    let target_pfa = scn.attack.target_pfa;
    let gamma_s = detection_boundary(sigma_s, target_pfa);
    let eval_offset_s = scn.threshold_ns * 1e-9;
    let pmd = analytic_pmd(eval_offset_s, sigma_s, gamma_s);
    let (mc_pfa, mc_pmd) = monte_carlo_pfa_pmd(
        eval_offset_s,
        sigma_s,
        gamma_s,
        scn.attack.mc_runs,
        mc_seed(&cfg.id),
    );
    let detection = SpoofDetectionStats {
        monitor_sigma_ns: sigma_s * 1e9,
        target_pfa,
        boundary_ns: gamma_s * 1e9,
        eval_offset_ns: scn.threshold_ns,
        analytic_pmd: pmd,
        mc_pfa,
        mc_pmd,
        mc_runs: scn.attack.mc_runs.max(1),
    };

    let shape = scn.attack.resolved_shape();
    let offset_at = |t: f64| {
        if t >= scn.attack.start_s {
            shape.offset_ns(t - scn.attack.start_s)
        } else {
            0.0
        }
    };
    let mut series = Vec::with_capacity(n + 1);
    let mut detect_time_s = None;
    for i in 0..=n {
        let t = i as f64 * dt;
        let offset_ns = offset_at(t);
        if detect_time_s.is_none() && t >= scn.attack.start_s && offset_ns.abs() > bound_ns {
            detect_time_s = Some(t);
        }
        series.push(SpoofSample {
            t,
            offset_ns,
            bound_ns,
        });
    }
    SpoofClock {
        id: cfg.id.clone(),
        min_detectable_ns: bound_ns,
        detect_time_s,
        offset_at_detection_ns: detect_time_s.map(offset_at),
        // The attack succeeds if a spec-threshold spoof is still below the
        // detection floor: the monitor cannot flag it before it does harm.
        breaches_spec_undetected: bound_ns >= scn.threshold_ns,
        security_fom: 1.0 - pmd,
        detection,
        series,
    }
}

fn hash_spoof(scn: &SpoofScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Run the spoofing attack against both clocks.
pub fn run_spoof(scn: &SpoofScenario) -> SpoofResult {
    SpoofResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash_spoof(scn),
        threshold_ns: scn.threshold_ns,
        quantum: run_clock(scn, &scn.clock_quantum),
        classical: run_clock(scn, &scn.clock_classical),
    }
}

/// Render the spoof offset ramp against each clock's detection bound and the spec.
pub fn to_svg(result: &SpoofResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 50.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let series = &result.quantum.series; // the offset ramp is the same for both
    let t_max = series.iter().map(|s| s.t).fold(1.0_f64, f64::max);
    let offset_end = series.last().map_or(0.0, |s| s.offset_ns);
    let mut y_max = result.threshold_ns;
    y_max = y_max
        .max(offset_end)
        .max(result.classical.min_detectable_ns)
        .max(result.quantum.min_detectable_ns)
        * 1.2;
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let ramp = series
        .iter()
        .map(|s| format!("{:.1},{:.1}", xof(s.t), yof(s.offset_ns)))
        .collect::<Vec<_>>()
        .join(" ");
    let hline = |y_ns: f64| format!("{:.1}", yof(y_ns));
    let axis_y = mt + ph;
    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">Time-spoof detection: offset vs clock-aided detection bounds</text>",
        ml
    ));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "spoof offset (ns)",
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    let right = ml + pw;
    // Spec threshold.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#e5645a\" stroke-dasharray=\"6 4\"/>",
        hline(result.threshold_ns)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#e5645a\">spec {:.0} ns</text>",
        ml + 4.0,
        yof(result.threshold_ns) - 4.0,
        result.threshold_ns
    ));
    // Per-clock detection bounds.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#e0bd84\" stroke-dasharray=\"3 3\"/>",
        hline(result.quantum.min_detectable_ns)
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#d2925e\" stroke-dasharray=\"3 3\"/>",
        hline(result.classical.min_detectable_ns)
    ));
    // The spoof offset ramp.
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#8c8273\" stroke-width=\"2\" points=\"{ramp}\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#8c8273\">spoof offset</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#e0bd84\">quantum detect bound</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"76\" fill=\"#d2925e\">classical detect bound</text>",
        ml + 10.0
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario() -> SpoofScenario {
        toml::from_str(include_str!("../scenarios/spoof-attack.toml"))
            .expect("spoof scenario parses")
    }

    #[test]
    fn quantum_detects_before_harm_classical_does_not() {
        let r = run_spoof(&scenario());
        // The optical clock's detection floor is well below the spec, so it flags
        // the spoof before the offset reaches the operational threshold.
        assert!(!r.quantum.breaches_spec_undetected);
        assert!(r.quantum.detect_time_s.is_some());
        assert!(r.quantum.offset_at_detection_ns.unwrap() < r.threshold_ns);
        // The chip-scale clock's own noise exceeds the spec, so the spoof reaches the
        // threshold undetected: the attack succeeds.
        assert!(r.classical.breaches_spec_undetected);
        assert!(r.classical.min_detectable_ns >= r.threshold_ns);
    }

    #[test]
    fn detection_time_is_hand_derived() {
        // Detect at offset = bound: t_detect = start + bound_ns / rate, snapped up to
        // the time grid (first sample strictly past the bound).
        let r = run_spoof(&scenario());
        let q = &r.quantum;
        let scn = scenario();
        let rate = match scn.attack.resolved_shape() {
            SpoofShape::LinearRamp { rate_ns_per_s } => rate_ns_per_s,
            _ => unreachable!("the legacy spoof scenario is a linear ramp"),
        };
        let analytic = scn.attack.start_s + q.min_detectable_ns / rate;
        let dt = scn.time.step_s;
        // The detection sample is the first grid point with offset strictly above the
        // bound, so within one step of the analytic crossing.
        assert!((q.detect_time_s.unwrap() - analytic).abs() <= dt + 1e-9);
    }

    #[test]
    fn is_reproducible() {
        let a = run_spoof(&scenario());
        let b = run_spoof(&scenario());
        assert_eq!(a.quantum.detect_time_s, b.quantum.detect_time_s);
        assert_eq!(a.classical.min_detectable_ns, b.classical.min_detectable_ns);
        assert_eq!(a.quantum.detection.mc_pmd, b.quantum.detection.mc_pmd);
    }

    #[test]
    fn spoof_shapes_produce_the_right_offset_trajectories() {
        let ramp = SpoofShape::LinearRamp {
            rate_ns_per_s: 10.0,
        };
        assert!((ramp.offset_ns(60.0) - 600.0).abs() < 1e-9);
        let step = SpoofShape::StepJump { magnitude_ns: 50.0 };
        assert_eq!(step.offset_ns(0.0), 50.0);
        assert_eq!(step.offset_ns(100.0), 50.0);
        // Meaconing oscillates between 0 and 2·delay; at τ=0 it is exactly delay.
        let mea = SpoofShape::Meaconing {
            delay_ns: 30.0,
            oscillation_hz: 0.25,
        };
        assert!((mea.offset_ns(0.0) - 30.0).abs() < 1e-9);
        assert!((mea.offset_ns(1.0) - 60.0).abs() < 1e-9); // sin(π/2)=1 at f=0.25,τ=1
                                                           // Replay is the capture age in ns.
        let rep = SpoofShape::Replay {
            capture_offset_s: 2e-6,
        };
        assert!((rep.offset_ns(5.0) - 2000.0).abs() < 1e-9);
    }

    /// Build a spoof scenario with two clocks of chosen white-FM PSDs and a spec
    /// chosen so the noisier clock sits at a stressed operating point.
    fn cn0_scenario(threshold_ns: f64, q_wf_csac: f64, q_wf_optical: f64) -> SpoofScenario {
        let clk = |id: &str, q_wf: f64| ClockCfg {
            id: id.into(),
            provenance: "test".into(),
            y0: 0.0,
            q_wf,
            q_rw: 0.0,
            drift: 0.0,
            flicker_floor: 0.0,
        };
        SpoofScenario {
            threshold_ns,
            time: TimeCfg {
                step_s: 1.0,
                duration_s: 600.0,
            },
            attack: AttackCfg {
                start_s: 0.0,
                rate_ns_per_s: Some(10.0),
                shape: None,
                target_pfa: 0.01,
                mc_runs: 40_000,
            },
            // "quantum" = the optical clock, "classical" = the CSAC.
            clock_quantum: clk("optical", q_wf_optical),
            clock_classical: clk("csac", q_wf_csac),
        }
    }

    #[test]
    fn monte_carlo_pmd_tracks_the_analytic_optimum_and_separates_the_clocks() {
        // Pick the CSAC PSD, derive its monitor sigma from the noise PSD, and set the
        // spec to 2σ so the CSAC sits at deflection μ/σ = 2 — a genuinely stressed
        // operating point (analytic P_md ≈ 0.7177 at P_fa = 0.01), not the degenerate
        // P_md ≈ 0 of a gross multi-µs ramp. The optical clock is ~100× quieter.
        let q_wf_csac = 1e-22;
        let samples = 600.0_f64; // tau/dt = 600/1
        let sigma_csac = monitor_sigma_s(q_wf_csac, 0.0, PHASE_MEAS_VAR_S2, 600.0, samples);
        let threshold_ns = 2.0 * sigma_csac * 1e9; // μ/σ = 2
        let scn = cn0_scenario(threshold_ns, q_wf_csac, 1e-26);
        let r = run_spoof(&scn);

        // CSAC: the Monte-Carlo P_md tracks the closed-form optimum within 5%.
        let csac = &r.classical.detection;
        assert!(
            (csac.analytic_pmd - 0.717_67).abs() < 1e-2,
            "analytic P_md should be ~0.7177, got {}",
            csac.analytic_pmd
        );
        assert!(
            (csac.mc_pmd - csac.analytic_pmd).abs() / csac.analytic_pmd < 0.05,
            "MC P_md {} should be within 5% of analytic {}",
            csac.mc_pmd,
            csac.analytic_pmd
        );
        // The empirical false-alarm rate honours the 1% budget.
        assert!((csac.mc_pfa - 0.01).abs() < 0.005, "mc_pfa={}", csac.mc_pfa);

        // Optical clock: essentially always detects the same attack.
        let opt = &r.quantum.detection;
        assert!(
            opt.analytic_pmd < 0.01,
            "optical analytic P_md={}",
            opt.analytic_pmd
        );
        assert!(r.quantum.security_fom > 0.99);
        // The Security FoM is gated on detection probability and separates them.
        assert!(
            r.quantum.security_fom > r.classical.security_fom,
            "optical {} should out-score CSAC {}",
            r.quantum.security_fom,
            r.classical.security_fom
        );
        assert!((r.classical.security_fom - (1.0 - csac.analytic_pmd)).abs() < 1e-12);
    }
}
