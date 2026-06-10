// SPDX-License-Identifier: Apache-2.0
//! The runnable **`spoof-detect`** scenario — the product surface over
//! [`crate::spoof_monitors::CombinedSpoofDetector`].
//!
//! [`crate::spoof`] runs the *time*-spoof clock-aided detector; this pack runs the
//! *RF/measurement* combined detector (multi-SV RAIM-consistency + AGC + SQM, fused) against a
//! parameterised attack on a satellite geometry, and reports which layers fire and the fused
//! verdict. The attack knobs are the ones the TEXBAT literature uses to classify a spoofing
//! record — power advantage (dB), carrier-phase alignment, and a time-vs-position push — so the
//! same scenario language that names a public test vector drives the detector here.
//!
//! Honest scope: this evaluates the detector against *parameterised* observables (the same level
//! as `tests/spoof_texbat_validation.rs`), not raw IQ — kshana is a simulator, not an SDR
//! receiver.

use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

use crate::spoof_monitors::{
    combine_power_dbm, AgcMonitor, CombinedSpoofDecision, CombinedSpoofDetector, SpoofEpoch,
    SqmMonitor,
};

/// A satellite line-of-sight direction (degrees).
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct AzEl {
    pub az_deg: f64,
    pub el_deg: f64,
}

/// A well-spread eight-satellite geometry, used when the scenario omits `satellites`.
fn default_geometry() -> Vec<AzEl> {
    [
        (0.0, 80.0),
        (45.0, 30.0),
        (100.0, 55.0),
        (150.0, 20.0),
        (200.0, 60.0),
        (255.0, 25.0),
        (300.0, 45.0),
        (340.0, 15.0),
    ]
    .iter()
    .map(|&(az_deg, el_deg)| AzEl { az_deg, el_deg })
    .collect()
}

/// The spoofing push class — what the spoofer does to the pseudoranges.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum PushKind {
    /// No range manipulation (a pure power/transmitter test).
    #[default]
    None,
    /// A common-mode time push: every pseudorange biased equally — absorbed by the receiver
    /// clock state, so RAIM is blind to it.
    Time,
    /// A position push: a subset of pseudoranges biased inconsistently — RAIM-detectable.
    Position,
}

fn default_push_m() -> f64 {
    250.0
}
fn default_num_biased() -> usize {
    3
}
fn default_imbalance() -> f64 {
    0.12
}

/// The spoofing attack to evaluate, in the parameters TEXBAT uses to classify a record.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct SpoofAttackCfg {
    /// Spoofer power advantage over the nominal floor, dB.
    pub power_advantage_db: f64,
    /// Whether the spoofer is carrier-phase aligned (no SQM correlation distortion if true).
    #[serde(default)]
    pub carrier_aligned: bool,
    /// The push class.
    #[serde(default)]
    pub push: PushKind,
    /// Push magnitude (metres): the common-mode bias for a time push, or the per-satellite bias
    /// for a position push.
    #[serde(default = "default_push_m")]
    pub push_magnitude_m: f64,
    /// Number of satellites biased for a position push.
    #[serde(default = "default_num_biased")]
    pub num_biased: usize,
    /// Fractional Early/Late imbalance imparted by a non-carrier-aligned spoofer (the dragged
    /// correlation peak); ignored when `carrier_aligned`.
    #[serde(default = "default_imbalance")]
    pub el_imbalance: f64,
}

fn default_sat_dbm() -> f64 {
    -130.0
}
fn default_agc_margin() -> f64 {
    3.0
}
fn default_sqm_tol() -> f64 {
    0.10
}
fn default_p_fa() -> f64 {
    1.0e-3
}
fn default_sigma_m() -> f64 {
    5.0
}
fn default_weights() -> [f64; 3] {
    [0.5, 0.3, 0.2]
}
fn default_threshold() -> f64 {
    0.5
}

/// Combined-detector configuration; every field defaults to the conventional value.
#[derive(Clone, Copy, Debug, Deserialize, Serialize)]
pub struct DetectorCfg {
    /// Nominal per-satellite received power (dBm); the floor is their incoherent sum.
    #[serde(default = "default_sat_dbm")]
    pub sat_power_dbm: f64,
    #[serde(default = "default_agc_margin")]
    pub agc_margin_db: f64,
    #[serde(default = "default_sqm_tol")]
    pub sqm_tolerance: f64,
    #[serde(default = "default_p_fa")]
    pub raim_p_fa: f64,
    #[serde(default = "default_sigma_m")]
    pub sigma_m: f64,
    #[serde(default = "default_weights")]
    pub weights: [f64; 3],
    #[serde(default = "default_threshold")]
    pub fusion_threshold: f64,
}

impl Default for DetectorCfg {
    fn default() -> Self {
        Self {
            sat_power_dbm: default_sat_dbm(),
            agc_margin_db: default_agc_margin(),
            sqm_tolerance: default_sqm_tol(),
            raim_p_fa: default_p_fa(),
            sigma_m: default_sigma_m(),
            weights: default_weights(),
            fusion_threshold: default_threshold(),
        }
    }
}

/// A `spoof-detect` scenario: a satellite geometry, an attack, and the detector configuration.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct SpoofDetectScenario {
    /// The scenario kind tag (`spoof-detect`); ignored by the runner.
    #[serde(default)]
    pub kind: Option<String>,
    #[serde(default = "default_geometry")]
    pub satellites: Vec<AzEl>,
    pub attack: SpoofAttackCfg,
    #[serde(default)]
    pub detector: DetectorCfg,
}

/// The result of one `spoof-detect` run: the inputs that mattered plus the full combined
/// decision and a human-readable verdict.
#[derive(Clone, Debug, Serialize)]
pub struct SpoofDetectResult {
    pub scenario_hash: String,
    pub n_sats: usize,
    pub power_floor_dbm: f64,
    pub measured_dbm: f64,
    pub attack: SpoofAttackCfg,
    pub decision: CombinedSpoofDecision,
    pub verdict: String,
}

/// Unit line-of-sight rows `[eₓ, e_y, e_z, 1]` from the azimuth/elevation geometry.
fn geometry_rows(sats: &[AzEl]) -> Vec<[f64; 4]> {
    sats.iter()
        .map(|s| {
            let (a, e) = (s.az_deg.to_radians(), s.el_deg.to_radians());
            [e.cos() * a.sin(), e.cos() * a.cos(), e.sin(), 1.0]
        })
        .collect()
}

/// Run the combined detector against the scenario's parameterised attack.
pub fn run_spoof_detect(scn: &SpoofDetectScenario) -> SpoofDetectResult {
    let geometry = geometry_rows(&scn.satellites);
    let n = geometry.len();
    let floor = combine_power_dbm(&vec![scn.detector.sat_power_dbm; n]);

    // A consistent residual set from a fixed true state (RAIM statistic ≈ 0 unless perturbed).
    let x_true = [9.0, -4.0, 6.0, 25.0];
    let mut residuals: Vec<f64> = geometry
        .iter()
        .map(|row| (0..4).map(|a| row[a] * x_true[a]).sum())
        .collect();
    match scn.attack.push {
        PushKind::None => {}
        PushKind::Time => residuals
            .iter_mut()
            .for_each(|z| *z += scn.attack.push_magnitude_m),
        PushKind::Position => {
            let k = scn.attack.num_biased.min(n);
            for r in residuals.iter_mut().take(k) {
                *r += scn.attack.push_magnitude_m;
            }
        }
    }

    // Carrier alignment sets the correlation-peak symmetry: aligned ⇒ symmetric taps; otherwise
    // E/L = imbalance, realised as E = 1, L = (1−imb)/(1+imb).
    let (early, late) = if scn.attack.carrier_aligned {
        (0.9, 0.9)
    } else {
        let imb = scn.attack.el_imbalance;
        (1.0, (1.0 - imb) / (1.0 + imb))
    };

    let measured_dbm = floor + scn.attack.power_advantage_db;
    let detector = CombinedSpoofDetector {
        agc: AgcMonitor {
            expected_dbm: floor,
            alert_margin_db: scn.detector.agc_margin_db,
        },
        sqm: SqmMonitor {
            el_tolerance: scn.detector.sqm_tolerance,
        },
        raim_p_fa: scn.detector.raim_p_fa,
        weights: scn.detector.weights,
        fusion_threshold: scn.detector.fusion_threshold,
    };
    let epoch = SpoofEpoch {
        geometry,
        residuals,
        sigma_m: scn.detector.sigma_m,
        measured_dbm,
        early,
        late,
    };
    let decision = detector.evaluate(&epoch);

    let mut fired: Vec<&str> = Vec::new();
    if decision.fused.layers.raim {
        fired.push("RAIM");
    }
    if decision.fused.layers.agc {
        fired.push("AGC");
    }
    if decision.fused.layers.sqm {
        fired.push("SQM");
    }
    let verdict = if decision.fused.alert {
        format!("SPOOF DETECTED (fused) — layers: {}", fired.join("+"))
    } else if !fired.is_empty() {
        format!(
            "single-layer indication ({}) below the fused threshold — corroboration needed",
            fired.join("+")
        )
    } else {
        "no spoof indication".to_string()
    };

    let mut hasher = Sha256::new();
    hasher.update(serde_json::to_string(scn).unwrap_or_default().as_bytes());
    let scenario_hash = format!("{:x}", hasher.finalize());

    SpoofDetectResult {
        scenario_hash,
        n_sats: n,
        power_floor_dbm: floor,
        measured_dbm,
        attack: scn.attack,
        decision,
        verdict,
    }
}

/// A small self-contained SVG: the three layers' evidence as bars normalised to their decision
/// thresholds (≥ 1 ⇒ that layer fired), coloured by alert, titled with the fused verdict.
pub fn to_svg(r: &SpoofDetectResult) -> String {
    let (w, h) = (520.0, 200.0);
    let raim_ratio = r
        .decision
        .raim
        .map(|c| {
            if c.threshold > 0.0 {
                c.statistic / c.threshold
            } else {
                0.0
            }
        })
        .unwrap_or(0.0);
    let agc_ratio = if r.measured_dbm > r.power_floor_dbm {
        (r.decision.agc_excess_db / 3.0).max(0.0)
    } else {
        0.0
    };
    let sqm_ratio = (r.decision.sqm_el_metric.abs() / 0.10).max(0.0);
    let bars = [
        ("RAIM", raim_ratio, r.decision.fused.layers.raim),
        ("AGC", agc_ratio, r.decision.fused.layers.agc),
        ("SQM", sqm_ratio, r.decision.fused.layers.sqm),
    ];
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\">\
         <rect width=\"{w}\" height=\"{h}\" fill=\"#0b0f14\"/>\
         <text x=\"12\" y=\"24\" fill=\"#e6edf3\" font-family=\"sans-serif\" font-size=\"15\">{}</text>",
        xml_escape(&r.verdict)
    );
    let x0 = 70.0;
    let max_w = w - x0 - 30.0;
    for (i, (label, ratio, fired)) in bars.iter().enumerate() {
        let y = 48.0 + i as f64 * 44.0;
        let bar = (ratio.min(2.0) / 2.0 * max_w).max(2.0);
        let colour = if *fired { "#f85149" } else { "#3fb950" };
        // The decision threshold marker sits at ratio = 1 (half the 0..2 scale).
        let thr_x = x0 + 0.5 * max_w;
        svg.push_str(&format!(
            "<text x=\"12\" y=\"{ty}\" fill=\"#e6edf3\" font-family=\"sans-serif\" font-size=\"13\">{label}</text>\
             <rect x=\"{x0}\" y=\"{y}\" width=\"{bar}\" height=\"20\" fill=\"{colour}\"/>\
             <line x1=\"{thr_x}\" y1=\"{ly}\" x2=\"{thr_x}\" y2=\"{ly2}\" stroke=\"#8b949e\" stroke-dasharray=\"3,3\"/>\
             <text x=\"{vx}\" y=\"{ty}\" fill=\"#8b949e\" font-family=\"sans-serif\" font-size=\"11\">{ratio:.2}x</text>",
            ty = y + 15.0,
            ly = y - 3.0,
            ly2 = y + 23.0,
            vx = x0 + max_w + 2.0,
        ));
    }
    svg.push_str("</svg>");
    svg
}

fn xml_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario(attack: SpoofAttackCfg) -> SpoofDetectScenario {
        SpoofDetectScenario {
            kind: Some("spoof-detect".into()),
            satellites: default_geometry(),
            attack,
            detector: DetectorCfg::default(),
        }
    }

    #[test]
    fn clean_scenario_reports_no_spoof() {
        let r = run_spoof_detect(&scenario(SpoofAttackCfg {
            power_advantage_db: 0.0,
            carrier_aligned: true,
            push: PushKind::None,
            push_magnitude_m: 0.0,
            num_biased: 0,
            el_imbalance: 0.0,
        }));
        assert!(
            !r.decision.fused.alert,
            "clean scenario alerted: {}",
            r.verdict
        );
        assert!(r.verdict.contains("no spoof"));
        assert_eq!(r.n_sats, 8);
    }

    #[test]
    fn position_push_is_caught_by_raim() {
        let r = run_spoof_detect(&scenario(SpoofAttackCfg {
            power_advantage_db: 0.4,
            carrier_aligned: false,
            push: PushKind::Position,
            push_magnitude_m: 75.0,
            num_biased: 3,
            el_imbalance: 0.12,
        }));
        assert!(
            r.decision.raim.map(|c| c.alert).unwrap_or(false),
            "RAIM did not fire on a position push"
        );
        assert!(r.decision.fused.alert, "{}", r.verdict);
        assert!(r.verdict.contains("RAIM"));
    }

    #[test]
    fn overpowered_meaconer_is_caught_by_agc_and_sqm() {
        let r = run_spoof_detect(&scenario(SpoofAttackCfg {
            power_advantage_db: 10.0,
            carrier_aligned: false,
            push: PushKind::Time, // RAIM-invisible common-mode push
            push_magnitude_m: 250.0,
            num_biased: 0,
            el_imbalance: 0.12,
        }));
        assert!(!r.decision.raim.map(|c| c.alert).unwrap_or(false));
        assert!(r.decision.fused.layers.agc && r.decision.fused.layers.sqm);
        assert!(r.decision.fused.alert, "{}", r.verdict);
    }

    #[test]
    fn carrier_aligned_matched_power_evades_the_rf_layers() {
        // The documented hard case (TEXBAT ds7): no RF/measurement layer catches it.
        let r = run_spoof_detect(&scenario(SpoofAttackCfg {
            power_advantage_db: 0.4,
            carrier_aligned: true,
            push: PushKind::Time,
            push_magnitude_m: 250.0,
            num_biased: 0,
            el_imbalance: 0.0,
        }));
        assert!(!r.decision.fused.alert);
        assert!(r.verdict.contains("no spoof"));
    }

    #[test]
    fn the_svg_renders_and_hash_is_stable() {
        let scn = scenario(SpoofAttackCfg {
            power_advantage_db: 6.0,
            carrier_aligned: false,
            push: PushKind::Position,
            push_magnitude_m: 60.0,
            num_biased: 3,
            el_imbalance: 0.15,
        });
        let r = run_spoof_detect(&scn);
        let svg = to_svg(&r);
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert_eq!(r.scenario_hash, run_spoof_detect(&scn).scenario_hash);
    }
}
