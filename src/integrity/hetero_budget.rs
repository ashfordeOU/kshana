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

use crate::integrity::tpl_scalar::TimeSource;
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

/// N×N traceability-bias cross-covariance `Σ_b`. Diagonal = `b_i²`. Off-diagonal
/// for sources i,j sharing a realizer = `rho_common · b_i · b_j`; `0` otherwise.
/// `rho_common ∈ [0,1]` is the common-mode fraction of a shared UTC(k)
/// realization. `overbounds[i]` are the per-source bias overbounds `b_i`.
///
/// PROVEN: `Σ_b` is symmetric positive-semidefinite — it is block-diagonal by
/// realizer group, and each shared-realizer block equals `D((1−rho)I + rho·11ᵀ)D`
/// with `D = diag(b)`, whose eigenvalues `(1−rho)` and `1+(n−1)rho` are ≥ 0 for
/// `rho ∈ [0,1]`.
pub fn bias_cross_covariance(
    biases: &[SourceBias],
    overbounds: &[f64],
    rho_common: f64,
) -> Vec<Vec<f64>> {
    debug_assert_eq!(biases.len(), overbounds.len());
    debug_assert!((0.0..=1.0).contains(&rho_common));
    let n = biases.len();
    let mut sigma = vec![vec![0.0f64; n]; n];
    for i in 0..n {
        for j in 0..n {
            sigma[i][j] = if i == j {
                overbounds[i] * overbounds[i]
            } else if biases[i].realizer == biases[j].realizer {
                rho_common * overbounds[i] * overbounds[j]
            } else {
                0.0
            };
        }
    }
    sigma
}

/// Fused traceability bias of a weight vector `w` accounting for correlation:
/// `b = sqrt(wᵀ Σ_b w)`. `w` are the fusion weights (e.g. inverse-variance).
pub fn correlated_fused_bias(weights: &[f64], bias_cov: &[Vec<f64>]) -> f64 {
    quad_form(weights, bias_cov).max(0.0).sqrt()
}

/// Fused traceability bias IGNORING correlation (diagonal of `Σ_b` only):
/// `b = sqrt(Σ_i w_i² b_i²)`. Provided to expose the unsafe optimism.
///
/// THEOREM (correlated-bias-unsafe): for non-negative weights and overbounds,
/// `correlated_fused_bias ≥ independent_fused_bias`, strict when any two
/// same-realizer sources carry non-zero weight and `rho_common > 0`, with
/// equality iff `rho_common = 0`. Ignoring correlation under-bounds the fused
/// bias → optimistic → unsafe.
pub fn independent_fused_bias(weights: &[f64], bias_cov: &[Vec<f64>]) -> f64 {
    let s: f64 = weights
        .iter()
        .enumerate()
        .map(|(i, w)| w * w * bias_cov[i][i])
        .sum();
    s.max(0.0).sqrt()
}

fn quad_form(w: &[f64], m: &[Vec<f64>]) -> f64 {
    let n = w.len();
    let mut acc = 0.0;
    for i in 0..n {
        for j in 0..n {
            acc += w[i] * m[i][j] * w[j];
        }
    }
    acc
}

/// Bridge R2 → R1: build a `TimeSource` for `tpl_scalar` from raw bias material,
/// using the integrity-tail overbound as the per-source `bias_s`.
pub fn source_from_bias(
    sigma_s: f64,
    bias: &SourceBias,
    p_fault: f64,
    target_tail_ir: f64,
) -> TimeSource {
    TimeSource {
        sigma_s,
        bias_s: integrity_bias_overbound(bias, target_tail_ir),
        p_fault,
    }
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
    fn cross_covariance_is_psd_and_groups_by_realizer() {
        // Sources 0,1 share realizer 1; source 2 on realizer 2.
        let b = [
            src(4e-9, 2.0, 0.0, 1),
            src(3e-9, 2.0, 0.0, 1),
            src(5e-9, 2.0, 0.0, 2),
        ];
        let ob = [4e-9, 3e-9, 5e-9];
        let rho = 0.6;
        let s = bias_cross_covariance(&b, &ob, rho);
        // diagonal = b_i²
        assert!((s[0][0] - 16e-18).abs() < 1e-30);
        // shared-realizer off-diagonal = rho·b0·b1
        assert!((s[0][1] - rho * 4e-9 * 3e-9).abs() < 1e-30);
        assert!((s[0][1] - s[1][0]).abs() < 1e-30, "symmetric");
        // distinct-realizer off-diagonal = 0
        assert!(s[0][2].abs() < 1e-30 && s[1][2].abs() < 1e-30);
        // PSD: xᵀ Σ x ≥ 0 for a few probe vectors.
        for x in [[1.0, 1.0, 1.0], [1.0, -1.0, 0.0], [-2.0, 1.0, 3.0]] {
            assert!(super::quad_form(&x, &s) >= -1e-30);
        }
    }

    #[test]
    fn correlated_fused_bias_dominates_independent_when_correlated() {
        // Two sources on the SAME realizer, equal weights -> correlation adds.
        let b = [src(4e-9, 2.0, 0.0, 1), src(4e-9, 2.0, 0.0, 1)];
        let ob = [4e-9, 4e-9];
        let w = [0.5, 0.5];
        let s_corr = bias_cross_covariance(&b, &ob, 0.7);
        let s_indep = bias_cross_covariance(&b, &ob, 0.0);
        let corr = correlated_fused_bias(&w, &s_corr);
        let indep = independent_fused_bias(&w, &s_corr);
        // The unsafe theorem: correlation-aware fused bias exceeds the naive one.
        assert!(
            corr > indep + 1e-12,
            "correlated fused bias must dominate the independent one"
        );
        // At rho=0 they coincide.
        let c0 = correlated_fused_bias(&w, &s_indep);
        let i0 = independent_fused_bias(&w, &s_indep);
        assert!((c0 - i0).abs() < 1e-18, "equal at rho=0");
    }

    #[test]
    fn distinct_realizers_have_no_correlation_penalty() {
        // Sources on DIFFERENT realizers -> correlated == independent.
        let b = [src(4e-9, 2.0, 0.0, 1), src(4e-9, 2.0, 0.0, 2)];
        let ob = [4e-9, 4e-9];
        let w = [0.5, 0.5];
        let s = bias_cross_covariance(&b, &ob, 0.9);
        assert!(
            (correlated_fused_bias(&w, &s) - independent_fused_bias(&w, &s)).abs() < 1e-18,
            "no shared realizer -> no correlation penalty even at high rho"
        );
    }

    #[test]
    fn source_from_bias_uses_overbound() {
        let b = src(4e-9, 2.0, 1e-9, 1);
        let ts = source_from_bias(2e-9, &b, 1e-4, 2e-7);
        assert!((ts.bias_s - integrity_bias_overbound(&b, 2e-7)).abs() < 1e-18);
        assert!((ts.sigma_s - 2e-9).abs() < 1e-18 && (ts.p_fault - 1e-4).abs() < 1e-18);
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
