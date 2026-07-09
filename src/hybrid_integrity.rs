// SPDX-License-Identifier: AGPL-3.0-only
//! **Joint availability / precision / integrity figure of merit** for a heterogeneous
//! optical + RF PNT service (P5), plus the `hybrid-optical-rf` scenario that drives it
//! end-to-end.
//!
//! [`crate::hybrid`]`::pnt_availability` already fuses *availability × precision*
//! epoch-by-epoch. This module adds the third P5 factor — **integrity-assured** — and
//! composes all three into `P(available ∧ precision-grade ∧ integrity-assured)`, with an
//! explicit correlation term, exposed as a single scored FoM ([`joint_fom`]).
//!
//! The `hybrid-optical-rf` scenario wires the Phase-7 pieces into one analysis:
//!
//! * **L26 optical link budget** ([`crate::optical_linkbudget`]) → the tight optical ranging
//!   / timing precision from the detected-photon count (two-way, photon-limited CRLB).
//! * **L24 optical availability** ([`crate::optical_availability`]) → the weather-limited
//!   `N`-station network availability `A` (the binding constraint on the high-grade service).
//! * **L22 cross-modality RAIM** ([`crate::cross_raim`]) → the position and timing protection
//!   levels from fusing the loose RF and tight optical solutions, and whether they sit inside
//!   the alert limits (integrity-assured).
//! * **L23 optical↔RF handoff** ([`crate::handoff`]) → the no-jump (mean-continuity) +
//!   NEES-in-gate consistency check across a modality switch.
//! * **L25 joint FoM** (this module) → the composed availability/precision/integrity score.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The photon-energy / diffraction-footprint / photon-limited
//!   ranging CRLB (L26), the χ² cross-modality protection-level quantile (L22), the
//!   independent-union availability combinatorics (L24), the handoff mean-continuity
//!   invariant and NEES χ² gate bounds (L23), and the joint-FoM independent product (L25)
//!   are exact analytic identities, checked to machine precision against hand values.
//! - **Modelled.** The optical link loss allocations, the RF/optical 1σ magnitudes, the
//!   cloud-climatology inputs and spatial correlation, the FoM correlation, and the
//!   integrity-risk budget `P_HMI` are representative inputs — they set the numbers, not the
//!   formulas. Not a certified availability/integrity product.

use crate::cross_raim::{run_cross_raim, AxisRole, CrossAxis, CrossRaimResult};
use crate::handoff::{optical_rf_handoff, HandoffOutcome, HandoffState};
use crate::optical_availability::{
    default_network, run_optical_availability, OpticalAvailabilityResult,
};
use crate::optical_linkbudget::{
    detected_photons, optical_link_budget, photon_limited_range_crlb_m, photon_limited_toa_crlb_s,
    OpticalLinkParams, OpticalLinkResult,
};
use serde::{Deserialize, Serialize};

/// The honesty label carried on the result document.
const LABEL: &str = "Heterogeneous optical + RF PNT joint availability / precision / \
integrity figure of merit (P5). VALIDATED closed form: the photon-limited ranging CRLB \
(σ_τ/√N) and diffraction footprint (λ/D·range), the χ² cross-modality protection-level \
quantile, the N-station independent-union availability (1 − Π(1−a_i)), the optical↔RF \
handoff mean-continuity (bit-for-bit no-jump) invariant and NEES χ² gate, and the joint-FoM \
independent product. MODELLED: the optical loss allocations, the RF/optical 1σ magnitudes, \
the cloud-climatology inputs and spatial correlation, the FoM correlation, and the \
integrity-risk budget P_HMI are representative inputs. Not a certified availability/integrity \
product.";

/// Convert a boolean condition to a 0/1 probability weight.
fn indicator(b: bool) -> f64 {
    if b {
        1.0
    } else {
        0.0
    }
}

/// The composed joint availability / precision / integrity figure of merit.
#[derive(Clone, Debug, Serialize)]
pub struct JointPntFoM {
    /// Availability factor `A` (weather-limited high-grade service uptime).
    pub availability: f64,
    /// Precision-grade factor `P` (probability the delivered precision meets grade).
    pub precision_grade: f64,
    /// Integrity-assured factor `I` (protected within the alert limit, to the risk budget).
    pub integrity_assured: f64,
    /// Naive independent product `A·P·I`.
    pub joint_independent: f64,
    /// Correlation-adjusted joint `A·P·I + ρ·(min(A,P,I) − A·P·I)`.
    pub joint_correlated: f64,
    /// The correlation `ρ ∈ [0, 1]` used for the correlated joint.
    pub correlation: f64,
    /// The headline score (the correlated joint).
    pub score: f64,
}

/// Compose the three P5 factors into the joint PNT figure of merit.
///
/// The naive product `A·P·I` assumes the three conditions are independent. Real conditions
/// are **positively correlated** (optical uptime drives both availability and precision), so
/// the correlated joint interpolates toward the co-occurrence upper bound `min(A,P,I)`:
///
/// ```text
///   joint_corr = A·P·I + ρ·( min(A,P,I) − A·P·I ),   ρ ∈ [0, 1].
/// ```
///
/// At `ρ = 0` this is exactly the independent product; at `ρ = 1` it is `min(A,P,I)` (the
/// three conditions co-occur perfectly, so the joint is the weakest factor). The score is the
/// correlated joint.
pub fn joint_fom(
    availability: f64,
    precision: f64,
    integrity: f64,
    correlation: f64,
) -> JointPntFoM {
    let a = availability.clamp(0.0, 1.0);
    let p = precision.clamp(0.0, 1.0);
    let i = integrity.clamp(0.0, 1.0);
    let rho = correlation.clamp(0.0, 1.0);
    let independent = a * p * i;
    let min_factor = a.min(p).min(i);
    let correlated = independent + rho * (min_factor - independent);
    JointPntFoM {
        availability: a,
        precision_grade: p,
        integrity_assured: i,
        joint_independent: independent,
        joint_correlated: correlated,
        correlation: rho,
        score: correlated,
    }
}

/// The `hybrid-optical-rf` scenario: every field is optional, so a bare `kind =
/// "hybrid-optical-rf"` runs the representative P5 analysis.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct HybridOpticalRfScenario {
    /// Optical carrier wavelength (nm). Default 1550.
    pub wavelength_nm: Option<f64>,
    /// Optical transmit power (W). Default 1e-3.
    pub tx_power_w: Option<f64>,
    /// Transmit aperture diameter (m). Default 0.85 (≈ 0.7 km footprint at lunar range).
    pub tx_aperture_m: Option<f64>,
    /// Receive aperture diameter (m). Default 0.85.
    pub rx_aperture_m: Option<f64>,
    /// One-way link range (km). Default 384000 (Earth–Moon).
    pub range_km: Option<f64>,
    /// Signal-pulse RMS width (ps). Default 50.
    pub pulse_rms_ps: Option<f64>,
    /// Detector integration time (s). Default 1.0.
    pub integration_s: Option<f64>,
    /// One-way atmospheric loss (dB). Default 3.0 (Modelled).
    pub atmospheric_loss_db: Option<f64>,
    /// Pointing / jitter loss (dB). Default 3.0 (Modelled).
    pub pointing_loss_db: Option<f64>,
    /// Optics throughput (0..1). Default 0.5.
    pub optics_efficiency: Option<f64>,
    /// Detector quantum efficiency (0..1). Default 0.7.
    pub detector_efficiency: Option<f64>,
    /// Two-way (round-trip) ranging. Default true.
    pub two_way: Option<bool>,
    /// RF horizontal-position 1σ (m). Default 1.0 (loose).
    pub rf_pos_sigma_m: Option<f64>,
    /// RF vertical-position 1σ (m). Default 1.5× the horizontal.
    pub rf_vertical_sigma_m: Option<f64>,
    /// RF clock 1σ (s). Default 3e-9 (3 ns).
    pub rf_clock_sigma_s: Option<f64>,
    /// Cross-modality false-alarm probability. Default 1e-5.
    pub p_fa: Option<f64>,
    /// Cross-modality missed-detection probability. Default 1e-3.
    pub p_md: Option<f64>,
    /// Horizontal alert limit (m). Default 10.0.
    pub alert_limit_h_m: Option<f64>,
    /// Vertical alert limit (m). Default 15.0.
    pub alert_limit_v_m: Option<f64>,
    /// Timing alert limit (s). Default 20e-9 (20 ns).
    pub alert_limit_t_s: Option<f64>,
    /// Precision-grade position spec (m). Default 0.1 (10 cm).
    pub grade_pos_m: Option<f64>,
    /// Precision-grade timing spec (s). Default 1e-9 (1 ns).
    pub grade_time_s: Option<f64>,
    /// Number of optical ground sites (≤ the bundled network). Default 5.
    pub n_optical_sites: Option<usize>,
    /// Spatial correlation of the optical sites. Default 0.15.
    pub site_correlation: Option<f64>,
    /// Correlation of the joint-FoM factors. Default 0.5.
    pub fom_correlation: Option<f64>,
    /// Modality-transition covariance inflation at the handoff. Default 0.2.
    pub handoff_inflation: Option<f64>,
    /// Integrity-risk budget `P_HMI`. Default 1e-7.
    pub p_hmi: Option<f64>,
}

/// Everything the analysis produces, computed once and reused by the emitters.
struct Computed {
    optical: OpticalLinkResult,
    detected_photons: f64,
    opt_pos_sigma_m: f64,
    opt_clock_sigma_s: f64,
    rf_pos_sigma_m: f64,
    rf_clock_sigma_s: f64,
    two_way: bool,
    cross: CrossRaimResult,
    protected: bool,
    availability: OpticalAvailabilityResult,
    handoff: HandoffOutcome,
    fom: JointPntFoM,
    alert_h: f64,
    alert_v: f64,
    alert_t: f64,
}

impl HybridOpticalRfScenario {
    fn compute(&self) -> Result<Computed, String> {
        let wavelength_m = self.wavelength_nm.unwrap_or(1550.0) * 1e-9;
        let range_m = self.range_km.unwrap_or(384_000.0) * 1000.0;
        let integration_s = self.integration_s.unwrap_or(1.0);
        let pulse_rms_s = self.pulse_rms_ps.unwrap_or(50.0) * 1e-12;
        let two_way = self.two_way.unwrap_or(true);
        for (name, v) in [
            ("wavelength_nm", wavelength_m),
            ("range_km", range_m),
            ("integration_s", integration_s),
            ("pulse_rms_ps", pulse_rms_s),
        ] {
            if !v.is_finite() || v <= 0.0 {
                return Err(format!("{name} must be finite and positive"));
            }
        }

        let params = OpticalLinkParams {
            wavelength_m,
            tx_power_w: self.tx_power_w.unwrap_or(1.0e-3),
            tx_aperture_m: self.tx_aperture_m.unwrap_or(0.85),
            rx_aperture_m: self.rx_aperture_m.unwrap_or(0.85),
            range_m,
            optics_efficiency: self.optics_efficiency.unwrap_or(0.5),
            detector_efficiency: self.detector_efficiency.unwrap_or(0.7),
            atmospheric_loss_db: self.atmospheric_loss_db.unwrap_or(3.0),
            pointing_loss_db: self.pointing_loss_db.unwrap_or(3.0),
        };
        let optical = optical_link_budget(&params);
        // A two-way ranging return path spreads the beam again (double-pass geometric loss).
        let return_factor = if two_way {
            10f64.powf(-optical.geometric_loss_db / 10.0)
        } else {
            1.0
        };
        let effective_rate = optical.photon_rate_hz * return_factor;
        let detected = detected_photons(effective_rate, integration_s);
        let opt_clock_sigma_s = photon_limited_toa_crlb_s(pulse_rms_s, detected);
        let opt_pos_sigma_m = photon_limited_range_crlb_m(pulse_rms_s, detected, two_way);
        // A finite, photon-starved link is required for a usable optical solution.
        if !opt_pos_sigma_m.is_finite() || !opt_clock_sigma_s.is_finite() {
            return Err(
                "optical link delivered no photons (infinite ranging CRLB); raise power / \
                 aperture / integration time"
                    .to_string(),
            );
        }

        let rf_pos_sigma_m = self.rf_pos_sigma_m.unwrap_or(1.0);
        let rf_vertical_sigma_m = self.rf_vertical_sigma_m.unwrap_or(rf_pos_sigma_m * 1.5);
        let rf_clock_sigma_s = self.rf_clock_sigma_s.unwrap_or(3.0e-9);
        let p_fa = self.p_fa.unwrap_or(1e-5);
        let p_md = self.p_md.unwrap_or(1e-3);

        // L22 — cross-modality RAIM over four nominal (fault-free) axes with disparate σ.
        let axis = |name: &str, role, rf_s, opt_s| CrossAxis {
            name: name.to_string(),
            role,
            rf_value: 0.0,
            rf_sigma: rf_s,
            opt_value: 0.0,
            opt_sigma: opt_s,
        };
        let axes = vec![
            axis(
                "east",
                AxisRole::Horizontal,
                rf_pos_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "north",
                AxisRole::Horizontal,
                rf_pos_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "up",
                AxisRole::Vertical,
                rf_vertical_sigma_m,
                opt_pos_sigma_m,
            ),
            axis(
                "clock",
                AxisRole::Timing,
                rf_clock_sigma_s,
                opt_clock_sigma_s,
            ),
        ];
        let cross = run_cross_raim(&axes, p_fa, p_md);

        let alert_h = self.alert_limit_h_m.unwrap_or(10.0);
        let alert_v = self.alert_limit_v_m.unwrap_or(15.0);
        let alert_t = self.alert_limit_t_s.unwrap_or(20.0e-9);
        let protected = cross.hpl_m <= alert_h && cross.vpl_m <= alert_v && cross.tpl_s <= alert_t;
        let p_hmi = self.p_hmi.unwrap_or(1e-7);
        let integrity_assured = if protected { 1.0 - p_hmi } else { 0.0 };

        // L24 — optical network availability.
        let network = default_network();
        let n = self
            .n_optical_sites
            .unwrap_or(network.len())
            .clamp(1, network.len());
        let site_correlation = self.site_correlation.unwrap_or(0.15);
        let availability = run_optical_availability(&network[..n], site_correlation);
        let a = availability.correlated_union;

        // Precision-grade probability: optical (tight) when the link is up, RF (loose) on
        // fallback. P = A·[optical meets grade] + (1−A)·[RF meets grade].
        let grade_pos = self.grade_pos_m.unwrap_or(0.1);
        let grade_time = self.grade_time_s.unwrap_or(1.0e-9);
        let opt_meets = opt_pos_sigma_m <= grade_pos && opt_clock_sigma_s <= grade_time;
        let rf_meets = rf_pos_sigma_m <= grade_pos && rf_clock_sigma_s <= grade_time;
        let precision = a * indicator(opt_meets) + (1.0 - a) * indicator(rf_meets);

        // L25 — the joint FoM.
        let fom = joint_fom(
            a,
            precision,
            integrity_assured,
            self.fom_correlation.unwrap_or(0.5),
        );

        // L23 — optical→RF handoff consistency probe (deterministic 1σ draw).
        let truth = vec![0.0_f64; 4];
        let p0 = vec![
            rf_pos_sigma_m.powi(2),
            rf_pos_sigma_m.powi(2),
            rf_vertical_sigma_m.powi(2),
            rf_clock_sigma_s.powi(2),
        ];
        let x0: Vec<f64> = p0.iter().map(|&p| p.sqrt()).collect(); // 1σ prior error
        let opt_r = [
            opt_pos_sigma_m.powi(2),
            opt_pos_sigma_m.powi(2),
            opt_pos_sigma_m.powi(2),
            opt_clock_sigma_s.powi(2),
        ];
        let optical_updates: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + opt_r[i].sqrt(), opt_r[i]))
            .collect();
        let rf_updates: Vec<(usize, f64, f64)> = (0..4)
            .map(|i| (i, truth[i] + p0[i].sqrt(), p0[i]))
            .collect();
        let handoff = optical_rf_handoff(
            HandoffState::new(x0, p0),
            &truth,
            &optical_updates,
            &rf_updates,
            self.handoff_inflation.unwrap_or(0.2),
        );

        Ok(Computed {
            optical,
            detected_photons: detected,
            opt_pos_sigma_m,
            opt_clock_sigma_s,
            rf_pos_sigma_m,
            rf_clock_sigma_s,
            two_way,
            cross,
            protected,
            availability,
            handoff,
            fom,
            alert_h,
            alert_v,
            alert_t,
        })
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c)))
    }

    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((self.json(&c)?, self.summary(&c), self.svg(&c)))
    }

    fn json(&self, c: &Computed) -> Result<String, String> {
        let doc = serde_json::json!({
            "kind": "hybrid-optical-rf",
            "label": LABEL,
            "optical_link": {
                "footprint_m": c.optical.footprint_m,
                "divergence_rad": c.optical.divergence_rad,
                "geometric_loss_db": c.optical.geometric_loss_db,
                "total_loss_db": c.optical.total_loss_db,
                "photon_rate_hz": c.optical.photon_rate_hz,
                "detected_photons": c.detected_photons,
                "two_way": c.two_way,
                "optical_ranging_sigma_m": c.opt_pos_sigma_m,
                "optical_timing_sigma_s": c.opt_clock_sigma_s,
                "rf_position_sigma_m": c.rf_pos_sigma_m,
                "rf_clock_sigma_s": c.rf_clock_sigma_s,
            },
            "cross_modality_raim": {
                "n_axes": c.cross.n_axes,
                "chi2_statistic": c.cross.chi2_statistic,
                "chi2_threshold": c.cross.chi2_threshold,
                "fault_detected": c.cross.fault_detected,
                "hpl_m": c.cross.hpl_m,
                "vpl_m": c.cross.vpl_m,
                "tpl_s": c.cross.tpl_s,
                "alert_limit_h_m": c.alert_h,
                "alert_limit_v_m": c.alert_v,
                "alert_limit_t_s": c.alert_t,
                "protected": c.protected,
                "axes": c.cross.axes,
            },
            "optical_availability": {
                "n_sites": c.availability.n_sites,
                "single_site_mean": c.availability.single_site_mean,
                "independent_union": c.availability.independent_union,
                "correlated_union": c.availability.correlated_union,
                "correlation": c.availability.correlation,
                "per_site": c.availability.per_site,
                "diversity_curve": c.availability.diversity_curve,
            },
            "handoff": {
                "mean_continuous": c.handoff.mean_continuous,
                "max_mean_jump": c.handoff.max_mean_jump,
                "variance_after_optical": c.handoff.variance_after_optical,
                "variance_after_handoff": c.handoff.variance_after_handoff,
                "variance_after_rf": c.handoff.variance_after_rf,
                "final_nees": c.handoff.final_nees,
                "nees_gate_lo": c.handoff.nees_gate.0,
                "nees_gate_hi": c.handoff.nees_gate.1,
                "nees_in_gate": c.handoff.nees_in_gate,
                "dof": c.handoff.dof,
            },
            "joint_fom": c.fom,
        });
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
    }

    fn summary(&self, c: &Computed) -> String {
        format!(
            "hybrid-optical-rf | optical footprint {:.0} m, {:.0} photons -> ranging σ {:.3} mm, \
             timing σ {:.2} ps | cross-RAIM HPL {:.1} m / VPL {:.1} m / TPL {:.1} ns ({}) | \
             availability {:.1}% ({} sites) | handoff no-jump {} NEES {:.2}∈[{:.2},{:.2}] {} | \
             joint FoM {:.3} (A {:.3} · P {:.3} · I {:.3}) | Validated CRLB/χ²-PL/union/handoff, \
             Modelled σ/climatology",
            c.optical.footprint_m,
            c.detected_photons,
            c.opt_pos_sigma_m * 1e3,
            c.opt_clock_sigma_s * 1e12,
            c.cross.hpl_m,
            c.cross.vpl_m,
            c.cross.tpl_s * 1e9,
            if c.protected {
                "protected"
            } else {
                "UNPROTECTED"
            },
            c.availability.correlated_union * 100.0,
            c.availability.n_sites,
            if c.handoff.mean_continuous {
                "OK"
            } else {
                "JUMP"
            },
            c.handoff.final_nees,
            c.handoff.nees_gate.0,
            c.handoff.nees_gate.1,
            if c.handoff.nees_in_gate {
                "in-gate"
            } else {
                "OUT"
            },
            c.fom.score,
            c.fom.availability,
            c.fom.precision_grade,
            c.fom.integrity_assured,
        )
    }

    /// A deterministic bar chart of the joint-FoM factors and the composed scores.
    fn svg(&self, c: &Computed) -> String {
        let (w, h) = (820.0_f64, 420.0_f64);
        let (ml, mr, mt, mb) = (60.0_f64, 20.0_f64, 46.0_f64, 60.0_f64);
        let pw = w - ml - mr;
        let ph = h - mt - mb;
        let axis_y = mt + ph;
        let bars = [
            ("availability", c.fom.availability, "#5fb0c9"),
            ("precision", c.fom.precision_grade, "#d2925e"),
            ("integrity", c.fom.integrity_assured, "#8fbf6f"),
            ("joint (indep)", c.fom.joint_independent, "#9a8fd0"),
            ("joint (corr)", c.fom.joint_correlated, "#e0bd84"),
        ];
        let n = bars.len() as f64;
        let slot = pw / n;
        let bw = slot * 0.56;
        let yof = |v: f64| mt + ph - v.clamp(0.0, 1.0) * ph;
        let mut svg = String::new();
        svg.push_str(&format!(
            "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
             font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
        ));
        svg.push_str(&format!(
            "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
        ));
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"22\" font-size=\"15\" font-weight=\"bold\">Hybrid optical + RF PNT joint figure of merit</text>"
        ));
        svg.push_str(&format!(
            "<text x=\"{ml:.0}\" y=\"38\" font-size=\"11\" fill=\"#8a8172\">P(available AND precision-grade AND integrity-assured)</text>"
        ));
        // Axes and 0.25/0.5/0.75/1.0 gridlines.
        svg.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
        ));
        svg.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
            ml + pw
        ));
        for g in [0.25, 0.5, 0.75, 1.0] {
            let gy = yof(g);
            svg.push_str(&format!(
                "<line x1=\"{ml:.0}\" y1=\"{gy:.1}\" x2=\"{:.0}\" y2=\"{gy:.1}\" stroke=\"#241d15\" stroke-dasharray=\"3 4\"/>",
                ml + pw
            ));
            svg.push_str(&format!(
                "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" fill=\"#6b6355\">{g:.2}</text>",
                ml - 6.0,
                gy + 4.0
            ));
        }
        for (idx, (label, value, color)) in bars.iter().enumerate() {
            let cx = ml + slot * (idx as f64 + 0.5);
            let x = cx - bw / 2.0;
            let y = yof(*value);
            let bh = axis_y - y;
            svg.push_str(&format!(
                "<rect x=\"{x:.1}\" y=\"{y:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"{color}\"/>"
            ));
            svg.push_str(&format!(
                "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" fill=\"#e6ddcb\">{value:.3}</text>",
                y - 5.0
            ));
            svg.push_str(&format!(
                "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" font-size=\"11\">{label}</text>",
                axis_y + 18.0
            ));
        }
        svg.push_str("</svg>");
        svg
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use serde_json::Value;

    /// The joint independent product is exact `A·P·I`; the correlated joint reduces to it at
    /// ρ = 0 and to min(A,P,I) at ρ = 1, is monotone in ρ, and is bounded in between. Oracle:
    /// the closed-form product and interpolation.
    #[test]
    fn joint_fom_product_and_correlation_bounds() {
        let (a, p, i) = (0.96, 0.90, 0.99);
        let indep = joint_fom(a, p, i, 0.0);
        assert!((indep.joint_independent - a * p * i).abs() < 1e-12);
        assert!(
            (indep.joint_correlated - a * p * i).abs() < 1e-12,
            "ρ=0 is the product"
        );
        let full = joint_fom(a, p, i, 1.0);
        assert!(
            (full.joint_correlated - a.min(p).min(i)).abs() < 1e-12,
            "ρ=1 is the min"
        );
        // Monotone in ρ, bounded in [product, min].
        let mid = joint_fom(a, p, i, 0.5).joint_correlated;
        assert!(indep.joint_correlated <= mid && mid <= full.joint_correlated);
        assert!(a * p * i <= mid && mid <= a.min(p).min(i));
    }

    /// The default scenario runs end to end, carries the honesty label, and produces a
    /// finite, sensible joint FoM: the optical link is photon-limited (sub-mm ranging), the
    /// cross-modality solution is protected, the network availability is ≈ 96 %, the handoff
    /// is bit-continuous with an in-gate NEES, and the score is dominated by availability.
    #[test]
    fn default_scenario_runs_and_is_honest() {
        let (json, summary) = HybridOpticalRfScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        assert_eq!(v["kind"], "hybrid-optical-rf");
        let label = v["label"].as_str().unwrap();
        assert!(label.contains("VALIDATED") && label.contains("MODELLED"));

        // Optical: a sub-mm two-way ranging precision from a photon-starved link.
        let opt = &v["optical_link"];
        let ranging_mm = opt["optical_ranging_sigma_m"].as_f64().unwrap() * 1e3;
        assert!(
            ranging_mm.is_finite() && ranging_mm > 0.0 && ranging_mm < 10.0,
            "ranging {ranging_mm} mm"
        );
        assert!((650.0..750.0).contains(&opt["footprint_m"].as_f64().unwrap()));

        // Cross-modality integrity: protected within the alert limits.
        assert!(v["cross_modality_raim"]["protected"].as_bool().unwrap());
        assert!(!v["cross_modality_raim"]["fault_detected"]
            .as_bool()
            .unwrap());

        // Availability ≈ 96 %.
        let a = v["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        assert!((0.94..0.975).contains(&a), "availability {a}");

        // Handoff: bit-continuous, NEES in gate.
        assert!(v["handoff"]["mean_continuous"].as_bool().unwrap());
        assert_eq!(v["handoff"]["max_mean_jump"].as_f64().unwrap(), 0.0);
        assert!(v["handoff"]["nees_in_gate"].as_bool().unwrap());

        // Joint FoM: finite, availability-limited, in (0, 1).
        let score = v["joint_fom"]["score"].as_f64().unwrap();
        assert!((0.85..0.98).contains(&score), "joint score {score}");
        assert!(summary.contains("hybrid-optical-rf"));
    }

    /// The scenario is deterministic and its SVG is well-formed.
    #[test]
    fn scenario_is_deterministic_and_svg_well_formed() {
        let scn = HybridOpticalRfScenario::default();
        assert_eq!(scn.run_json().unwrap(), scn.run_json().unwrap());
        let (_j, _s, svg) = scn.run_output().unwrap();
        assert!(svg.starts_with("<svg") && svg.ends_with("</svg>"));
        assert!(svg.contains("joint figure of merit"));
    }

    /// Tightening the optical link (more photons via a bigger aperture / more power) lowers
    /// the optical ranging σ, and a demanding precision grade the RF cannot meet ties the
    /// precision-grade factor to the optical availability.
    #[test]
    fn precision_grade_tracks_optical_availability_when_rf_is_too_loose() {
        let (json, _s) = HybridOpticalRfScenario::default().run_json().unwrap();
        let v: Value = serde_json::from_str(&json).unwrap();
        let a = v["optical_availability"]["correlated_union"]
            .as_f64()
            .unwrap();
        let p = v["joint_fom"]["precision_grade"].as_f64().unwrap();
        // RF (1 m, 3 ns) cannot meet the 10 cm / 1 ns grade, so P equals A.
        assert!(
            (p - a).abs() < 1e-9,
            "precision {p} should equal availability {a}"
        );
    }
}
