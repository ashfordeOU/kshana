//! R2 — heterogeneous source-agnostic timing budget: per-source UTC(k)
//! traceability-bias integrity overbounds and the correlated-bias
//! cross-covariance.
//!
//! Solution separation / MHSS is Cited from Blanch (IEEE T-AES 51(1), 2015)
//! and Joerger (NAVIGATION 61(4), 2014); the Type-B → integrity-tail inflation
//! methodology is Cited from the GUM (JCGM 100:2008). Our contribution is the
//! *construction* of the per-source bias overbound and the *correlated-bias
//! cross-covariance* that makes a naive independent allocation optimistic —
//! two sources traceable to the same UTC(k) realization have correlated bias
//! errors, so treating them as independent fault modes under-bounds the fused
//! bias. Independence is violated at the bias level; we never assume it.
//!
//! The deep integrity tail is Modelled: a monthly metrological series cannot
//! Validate a 1e-7 quantile, so the tail scaling is a stated overbound
//! assumption, not a Validated claim.

use crate::raim::normal_quantile;

/// Opaque identifier of a named UTC(k) laboratory realization. Sources sharing
/// a realizer have correlated traceability-bias errors (common-mode).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct UtcRealizer(pub u16);

/// Raw traceability material for one source's UTC(k) bias, before inflation.
#[derive(Clone, Copy, Debug)]
pub struct SourceBias {
    /// Published Type-B expanded uncertainty `U` on `|UTC − UTC(k)|` for this
    /// link (seconds): `U = coverage_factor · u_c`.
    pub expanded_uncertainty_s: f64,
    /// Coverage factor of `expanded_uncertainty_s` (`k_cov`; typically 2 ≈ 95%).
    pub coverage_factor: f64,
    /// Additive ageing / calibration-staleness inflation (seconds), added after
    /// the tail scaling (a fixed systematic offset, not a Gaussian sigma).
    pub ageing_inflation_s: f64,
    /// The UTC(k) realizer this source traces to (common-mode grouping key).
    pub realizer: UtcRealizer,
}

/// Inflate a published Type-B expanded uncertainty to an integrity-tail bias
/// overbound:
///
/// `b = (U / k_cov) · Φ⁻¹(1 − target_tail_ir/2) + ageing_inflation`.
///
/// `U / k_cov` recovers the combined standard uncertainty `u_c`; the Gaussian
/// two-sided integrity quantile scales it to the requested tail; the ageing
/// term is added as a fixed systematic. Cited methodology (GUM Type-B; Gaussian
/// overbound). The deep tail is Modelled, not Validated. `target_tail_ir` is the
/// two-sided integrity risk allocated to this source's bias; it must be in
/// `(0, 1)`. Returns a non-negative overbound.
pub fn integrity_bias_overbound(bias: &SourceBias, target_tail_ir: f64) -> f64 {
    debug_assert!(target_tail_ir > 0.0 && target_tail_ir < 1.0);
    debug_assert!(bias.coverage_factor > 0.0);
    let u_c = bias.expanded_uncertainty_s / bias.coverage_factor;
    let k_tail = normal_quantile(1.0 - target_tail_ir / 2.0);
    u_c * k_tail + bias.ageing_inflation_s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn src(u: f64, k: f64, age: f64, r: u16) -> SourceBias {
        SourceBias {
            expanded_uncertainty_s: u,
            coverage_factor: k,
            ageing_inflation_s: age,
            realizer: UtcRealizer(r),
        }
    }

    #[test]
    fn overbound_matches_closed_form() {
        let b = src(4e-9, 2.0, 1e-9, 1);
        let got = integrity_bias_overbound(&b, 2e-7);
        let expected = (4e-9 / 2.0) * normal_quantile(1.0 - 1e-7) + 1e-9;
        assert!(
            (got - expected).abs() < 1e-18,
            "closed form b = u_c·Φ⁻¹(1−tail/2)+age"
        );
    }

    #[test]
    fn overbound_tightens_toward_zero_tail() {
        // Smaller allocated tail -> larger overbound (monotone).
        let b = src(4e-9, 2.0, 0.0, 1);
        let loose = integrity_bias_overbound(&b, 5e-2);
        let tight = integrity_bias_overbound(&b, 1e-7);
        assert!(
            tight > loose,
            "a smaller integrity tail must inflate the overbound"
        );
    }

    #[test]
    fn overbound_recovers_expanded_u_at_matching_tail() {
        // At the tail that Φ⁻¹ maps back to k_cov, b = U + ageing (sanity anchor).
        let k_cov = 2.0;
        let b = src(4e-9, k_cov, 0.0, 1);
        // tail such that Φ⁻¹(1 − tail/2) = k_cov  =>  tail = 2·(1 − Φ(k_cov)).
        // Φ(2) ≈ 0.977249868 -> tail ≈ 0.045500264.
        let tail = 2.0 * (1.0 - 0.977_249_868_051_820_8);
        let got = integrity_bias_overbound(&b, tail);
        assert!(
            (got - 4e-9).abs() < 1e-16,
            "at k_cov tail the overbound equals U"
        );
    }
}
