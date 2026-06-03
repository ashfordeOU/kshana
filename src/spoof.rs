// SPDX-License-Identifier: Apache-2.0
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

use crate::run::PHASE_MEAS_VAR_S2;
use crate::scenario::{ClockCfg, TimeCfg};
use crate::security::{min_detectable_offset_ns, SPOOF_DETECT_K, SPOOF_MONITOR_S};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// The injected spoof: a linear time-offset ramp starting at `start_s`.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct AttackCfg {
    pub start_s: f64,
    pub rate_ns_per_s: f64,
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
    let offset_at = |t: f64| {
        if t >= scn.attack.start_s {
            scn.attack.rate_ns_per_s * (t - scn.attack.start_s)
        } else {
            0.0
        }
    };
    let mut series = Vec::with_capacity(n + 1);
    let mut detect_time_s = None;
    for i in 0..=n {
        let t = i as f64 * dt;
        let offset_ns = offset_at(t);
        if detect_time_s.is_none() && t >= scn.attack.start_s && offset_ns > bound_ns {
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
        schema_version: "0.7".into(),
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
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#cdd6e0\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0e131b\"/>"
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
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#3a4757\"/>",
        ml + pw
    ));
    let right = ml + pw;
    // Spec threshold.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#d33\" stroke-dasharray=\"6 4\"/>",
        hline(result.threshold_ns)
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#d33\">spec {:.0} ns</text>",
        ml + 4.0,
        yof(result.threshold_ns) - 4.0,
        result.threshold_ns
    ));
    // Per-clock detection bounds.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#5cb8d6\" stroke-dasharray=\"3 3\"/>",
        hline(result.quantum.min_detectable_ns)
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{0}\" x2=\"{right:.0}\" y2=\"{0}\" stroke=\"#c0392b\" stroke-dasharray=\"3 3\"/>",
        hline(result.classical.min_detectable_ns)
    ));
    // The spoof offset ramp.
    svg.push_str(&format!(
        "<polyline fill=\"none\" stroke=\"#3a4757\" stroke-width=\"2\" points=\"{ramp}\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#8593a3\">spoof offset</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"60\" fill=\"#5cb8d6\">quantum detect bound</text>",
        ml + 10.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"76\" fill=\"#c0392b\">classical detect bound</text>",
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
        let analytic = scn.attack.start_s + q.min_detectable_ns / scn.attack.rate_ns_per_s;
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
    }
}
