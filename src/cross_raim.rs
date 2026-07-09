// SPDX-License-Identifier: AGPL-3.0-only
//! **Cross-modality RAIM / protection level** — receiver-autonomous integrity for a
//! *heterogeneous* pair of PNT solutions. Where [`crate::raim`] monitors many homogeneous
//! RF pseudoranges of one constellation, this module treats an **RF** PVT/time solution and
//! an **optical** PVT/time solution as two *independent* measurements of the same underlying
//! geometry, with **disparate covariances** (RF loose — metres, nanoseconds; optical tight —
//! centimetres, picoseconds), and monitors their consistency.
//!
//! ## The detector (solution separation over two modalities)
//!
//! On each state axis the two modalities report `y_rf ~ N(x, σ_rf²)` and
//! `y_opt ~ N(x, σ_opt²)`. Under the fault-free hypothesis their **separation**
//! `Δ = y_rf − y_opt` is zero-mean Gaussian with variance `σ_rf² + σ_opt²`, so the
//! normalised statistic
//!
//! ```text
//!   T = Σ_axes  Δ_axis² / (σ_rf,axis² + σ_opt,axis²)
//! ```
//!
//! is χ² with as many degrees of freedom as monitored axes. A fault is declared when `T`
//! exceeds the exact quantile `χ²_{1−P_fa}(dof)` ([`crate::raim::chi2_quantile`]) — the same
//! closed-form χ² law the homogeneous RAIM uses.
//!
//! ## The protection level (position AND timing)
//!
//! The delivered solution is the inverse-variance (minimum-variance) fusion of the two
//! modalities. Per axis the cross-modality protection level is the solution-separation bound
//!
//! ```text
//!   PL_axis = K_fa · √(σ_rf² + σ_opt²) · max(w_rf, w_opt)  +  K_md · σ_fused,
//! ```
//!
//! with `w_k = σ_fused²/σ_k²` the fusion weight of modality `k` (`σ_fused² = 1/(1/σ_rf² +
//! 1/σ_opt²)`), `K_fa = Φ⁻¹(1 − P_fa/2)` and `K_md = Φ⁻¹(1 − P_md)`
//! ([`crate::raim::normal_quantile`]). The first term is the largest fused-estimate error a
//! bias just below the separation-detection threshold can inject; the second covers the
//! fused noise. Horizontal, vertical and **timing** protection levels are read off the
//! axis roles.
//!
//! ## Validated vs Modelled
//!
//! - **Validated (closed form).** The χ² detection threshold (`chi2_cdf(threshold, dof) =
//!   1 − P_fa` to ~1e-12), the quadratic-form separation statistic, the inverse-variance
//!   fusion, and the `K_fa/K_md` normal quantiles are exact analytic identities checked
//!   against independently-computed hand values.
//! - **Modelled.** The specific RF and optical 1σ *magnitudes* are the (illustrative)
//!   inputs; the horizontal radial RSS of two axes is the same deliberately-conservative
//!   simplification the homogeneous RAIM uses.
//!
//! ## References
//! * Brown, *A Baseline GPS RAIM Scheme…* (NAVIGATION, 1992) — the χ² separation detector.
//! * Blanch et al., *Baseline Advanced RAIM User Algorithm* — the solution-separation
//!   protection-level form generalised here to the two-modality case.

use crate::raim::{chi2_quantile, normal_quantile};
use serde::Serialize;

/// The role a monitored axis plays in the horizontal / vertical / timing protection split.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum AxisRole {
    /// A horizontal position component (east or north) — combined radially into the HPL.
    Horizontal,
    /// The vertical position component (up) — the VPL.
    Vertical,
    /// The clock / time axis (seconds) — the timing protection level.
    Timing,
}

/// One monitored axis: the RF and optical estimates and their 1σ (disparate) uncertainties.
/// Position axes carry metres; the timing axis carries seconds.
#[derive(Clone, Debug, PartialEq)]
pub struct CrossAxis {
    /// A short axis label (e.g. `"east"`, `"up"`, `"clock"`).
    pub name: String,
    /// The axis role (sets which protection level it feeds).
    pub role: AxisRole,
    /// RF (loose) estimate on this axis.
    pub rf_value: f64,
    /// RF 1σ (> 0).
    pub rf_sigma: f64,
    /// Optical (tight) estimate on this axis.
    pub opt_value: f64,
    /// Optical 1σ (> 0).
    pub opt_sigma: f64,
}

/// Inverse-variance (minimum-variance) fusion of two independent scalar estimates:
/// `x̂ = (y1/σ1² + y2/σ2²)/(1/σ1² + 1/σ2²)`, `σ_fused = √(1/(1/σ1² + 1/σ2²))`. Returns
/// `(x̂, σ_fused)`. Non-positive input σ are floored to a tiny positive value so the fusion
/// stays finite.
pub fn inverse_variance_fuse(y1: f64, s1: f64, y2: f64, s2: f64) -> (f64, f64) {
    let w1 = 1.0 / s1.max(f64::MIN_POSITIVE).powi(2);
    let w2 = 1.0 / s2.max(f64::MIN_POSITIVE).powi(2);
    let xhat = (y1 * w1 + y2 * w2) / (w1 + w2);
    let sigma = (1.0 / (w1 + w2)).sqrt();
    (xhat, sigma)
}

/// The single-axis normalised separation statistic `Δ²/(σ_rf² + σ_opt²)`, distributed χ²₁
/// under the fault-free hypothesis. Summing this over axes gives the χ²_dof detector.
pub fn separation_statistic_axis(
    rf_value: f64,
    opt_value: f64,
    rf_sigma: f64,
    opt_sigma: f64,
) -> f64 {
    let delta = rf_value - opt_value;
    let var = rf_sigma.powi(2) + opt_sigma.powi(2);
    delta * delta / var.max(f64::MIN_POSITIVE)
}

/// The single-axis cross-modality protection level
/// `PL = K_fa·√(σ_rf² + σ_opt²)·max(w_rf, w_opt) + K_md·σ_fused` (see the module docs).
/// `p_fa` / `p_md` are the false-alarm / missed-detection probabilities.
pub fn axis_protection_level(rf_sigma: f64, opt_sigma: f64, p_fa: f64, p_md: f64) -> f64 {
    let k_fa = normal_quantile(1.0 - p_fa / 2.0);
    let k_md = normal_quantile(1.0 - p_md);
    let (_, sigma_f) = inverse_variance_fuse(0.0, rf_sigma, 0.0, opt_sigma);
    let sigma_sum = (rf_sigma.powi(2) + opt_sigma.powi(2)).sqrt();
    let sf2 = sigma_f * sigma_f;
    let w_rf = sf2 / rf_sigma.max(f64::MIN_POSITIVE).powi(2);
    let w_opt = sf2 / opt_sigma.max(f64::MIN_POSITIVE).powi(2);
    k_fa * sigma_sum * w_rf.max(w_opt) + k_md * sigma_f
}

/// The per-axis outcome: the fused estimate, its σ, the separation statistic, and the axis
/// protection level.
#[derive(Clone, Debug, Serialize)]
pub struct CrossAxisResult {
    /// The axis label.
    pub name: String,
    /// The axis role.
    pub role: AxisRole,
    /// Fused (minimum-variance) estimate.
    pub fused_value: f64,
    /// Fused 1σ.
    pub fused_sigma: f64,
    /// Normalised separation statistic `Δ²/(σ_rf² + σ_opt²)` (χ²₁ under the null).
    pub separation_statistic: f64,
    /// The cross-modality protection level on this axis (metres for position, seconds for
    /// the timing axis).
    pub protection_level: f64,
}

/// The cross-modality RAIM outcome for one epoch.
#[derive(Clone, Debug, Serialize)]
pub struct CrossRaimResult {
    /// Number of monitored axes (= χ² degrees of freedom).
    pub n_axes: usize,
    /// The χ² separation statistic `Σ Δ²/(σ_rf² + σ_opt²)`.
    pub chi2_statistic: f64,
    /// The detection threshold `χ²_{1−P_fa}(n_axes)`.
    pub chi2_threshold: f64,
    /// `true` when the statistic exceeds the threshold (the modalities disagree).
    pub fault_detected: bool,
    /// Horizontal protection level (m): the radial RSS of the horizontal-axis PLs.
    pub hpl_m: f64,
    /// Vertical protection level (m): the vertical-axis PL (0 if no vertical axis).
    pub vpl_m: f64,
    /// Timing protection level (s): the timing-axis PL (0 if no timing axis).
    pub tpl_s: f64,
    /// Per-axis detail.
    pub axes: Vec<CrossAxisResult>,
}

/// Run cross-modality RAIM over `axes` at false-alarm `p_fa` and missed-detection `p_md`.
/// Forms the χ² separation detector across all axes and the per-axis solution-separation
/// protection levels, then rolls the axis roles up into the horizontal / vertical / timing
/// protection levels.
pub fn run_cross_raim(axes: &[CrossAxis], p_fa: f64, p_md: f64) -> CrossRaimResult {
    let mut chi2 = 0.0;
    let mut hpl_sq = 0.0;
    let mut vpl = 0.0;
    let mut tpl = 0.0;
    let mut out = Vec::with_capacity(axes.len());
    for ax in axes {
        let stat = separation_statistic_axis(ax.rf_value, ax.opt_value, ax.rf_sigma, ax.opt_sigma);
        chi2 += stat;
        let (fused_value, fused_sigma) =
            inverse_variance_fuse(ax.rf_value, ax.rf_sigma, ax.opt_value, ax.opt_sigma);
        let pl = axis_protection_level(ax.rf_sigma, ax.opt_sigma, p_fa, p_md);
        match ax.role {
            AxisRole::Horizontal => hpl_sq += pl * pl,
            AxisRole::Vertical => vpl = pl,
            AxisRole::Timing => tpl = pl,
        }
        out.push(CrossAxisResult {
            name: ax.name.clone(),
            role: ax.role,
            fused_value,
            fused_sigma,
            separation_statistic: stat,
            protection_level: pl,
        });
    }
    let dof = axes.len().max(1) as f64;
    let threshold = chi2_quantile(1.0 - p_fa, dof);
    CrossRaimResult {
        n_axes: axes.len(),
        chi2_statistic: chi2,
        chi2_threshold: threshold,
        fault_detected: chi2 > threshold,
        hpl_m: hpl_sq.sqrt(),
        vpl_m: vpl,
        tpl_s: tpl,
        axes: out,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::raim::chi2_cdf;

    /// A representative heterogeneous solution: loose RF (metres, ns) and tight optical
    /// (cm, ps) on east/north/up + a clock axis, in agreement (no fault).
    fn consistent_axes() -> Vec<CrossAxis> {
        let mk = |name: &str, role, rf_s, opt_s| CrossAxis {
            name: name.to_string(),
            role,
            rf_value: 0.0,
            rf_sigma: rf_s,
            opt_value: 0.0,
            opt_sigma: opt_s,
        };
        vec![
            mk("east", AxisRole::Horizontal, 3.0, 0.02),
            mk("north", AxisRole::Horizontal, 3.0, 0.02),
            mk("up", AxisRole::Vertical, 5.0, 0.03),
            mk("clock", AxisRole::Timing, 1.0e-8, 1.0e-11),
        ]
    }

    /// The detection threshold is the EXACT χ² quantile: feeding it back through the χ² CDF
    /// recovers `1 − P_fa` to ~1e-9, at several degrees of freedom. Oracle: the validated
    /// `raim::{chi2_cdf, chi2_quantile}` inverse pair.
    #[test]
    fn threshold_is_the_exact_chi2_quantile() {
        for p_fa in [1e-2, 1e-4, 1e-6] {
            for dof in [1.0, 2.0, 4.0] {
                let thr = chi2_quantile(1.0 - p_fa, dof);
                let back = chi2_cdf(thr, dof);
                assert!(
                    (back - (1.0 - p_fa)).abs() < 1e-9,
                    "chi2_cdf(thr={thr}, dof={dof}) = {back} vs 1-P_fa = {}",
                    1.0 - p_fa
                );
            }
        }
    }

    /// The separation statistic is the analytic quadratic form `Δ²/(σ_rf² + σ_opt²)`, and
    /// the whole-detector statistic is the sum over axes. Oracle: the closed-form χ²
    /// quadratic form.
    #[test]
    fn separation_statistic_matches_the_quadratic_form() {
        // Δ = 6 m, σ_rf = 3, σ_opt = 4 → Δ²/(9+16) = 36/25 = 1.44.
        let s = separation_statistic_axis(6.0, 0.0, 3.0, 4.0);
        assert!((s - 1.44).abs() < 1e-12, "statistic {s} vs 1.44");
        // Sum over a two-axis run.
        let axes = vec![
            CrossAxis {
                name: "a".into(),
                role: AxisRole::Horizontal,
                rf_value: 6.0,
                rf_sigma: 3.0,
                opt_value: 0.0,
                opt_sigma: 4.0,
            },
            CrossAxis {
                name: "b".into(),
                role: AxisRole::Vertical,
                rf_value: 0.0,
                rf_sigma: 3.0,
                opt_value: 0.0,
                opt_sigma: 4.0,
            },
        ];
        let r = run_cross_raim(&axes, 1e-3, 1e-4);
        assert!((r.chi2_statistic - 1.44).abs() < 1e-12);
        assert_eq!(r.n_axes, 2);
    }

    /// Inverse-variance fusion matches the hand formula: the fused variance is the harmonic
    /// combination, and the tighter (optical) modality dominates the estimate. Oracle: the
    /// closed-form minimum-variance combination.
    #[test]
    fn fusion_matches_the_minimum_variance_formula() {
        // σ1 = 3, σ2 = 4 → σ_f² = 1/(1/9 + 1/16) = 144/25 = 5.76 → σ_f = 2.4.
        let (_x, sf) = inverse_variance_fuse(0.0, 3.0, 0.0, 4.0);
        assert!((sf - 2.4).abs() < 1e-12, "σ_f {sf} vs 2.4");
        // The tight modality pulls the estimate: y_rf = 10 (σ=3), y_opt = 0 (σ=0.1).
        let (x, sf2) = inverse_variance_fuse(10.0, 3.0, 0.0, 0.1);
        assert!(
            x.abs() < 0.02,
            "fused estimate {x} should sit near the tight optical 0"
        );
        assert!(sf2 < 0.1, "fused σ {sf2} must beat the tighter input");
    }

    /// A consistent heterogeneous solution is NOT flagged and its protection levels are
    /// finite; a large optical-vs-RF disagreement IS flagged. Position and timing PLs are
    /// both produced.
    #[test]
    fn detects_disagreement_and_produces_position_and_timing_pls() {
        let r = run_cross_raim(&consistent_axes(), 1e-4, 1e-4);
        assert!(!r.fault_detected, "consistent modalities must not fault");
        assert!(r.hpl_m > 0.0 && r.vpl_m > 0.0 && r.tpl_s > 0.0);
        // Integrity is limited by the loose RF *reference*: a large optical fault can hide
        // under the RF separation noise, so the protection level sits on the RF-noise scale
        // (≈ K_fa·σ_rf), far above the tight fused σ — the honest cross-check bound.
        let (_x, sigma_f) = inverse_variance_fuse(0.0, 3.0, 0.0, 0.02);
        assert!(
            r.hpl_m > sigma_f && (5.0..40.0).contains(&r.hpl_m),
            "HPL {} m should be RF-reference-limited (fused σ {sigma_f} m)",
            r.hpl_m
        );

        // Inject a 50 m optical-vs-RF disagreement on the up axis → the detector trips.
        let mut faulted = consistent_axes();
        faulted[2].opt_value = 50.0;
        let rf = run_cross_raim(&faulted, 1e-4, 1e-4);
        assert!(
            rf.fault_detected,
            "a 50 m modality disagreement must be detected"
        );
        assert!(rf.chi2_statistic > rf.chi2_threshold);
    }

    /// The protection level tightens with the optical σ (a better optical modality lowers
    /// the fused bound) and the whole result is deterministic.
    #[test]
    fn pl_tightens_with_optical_and_is_deterministic() {
        let base = run_cross_raim(&consistent_axes(), 1e-4, 1e-4);
        let again = run_cross_raim(&consistent_axes(), 1e-4, 1e-4);
        assert_eq!(base.hpl_m, again.hpl_m);
        assert_eq!(base.tpl_s, again.tpl_s);

        let mut tighter = consistent_axes();
        for ax in &mut tighter {
            ax.opt_sigma *= 0.5;
        }
        let t = run_cross_raim(&tighter, 1e-4, 1e-4);
        assert!(t.hpl_m < base.hpl_m, "tighter optical must lower the HPL");
        assert!(t.tpl_s < base.tpl_s, "tighter optical must lower the TPL");
    }
}
