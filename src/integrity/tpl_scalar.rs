//! R1 — scalar-time MHSS timing protection level (the `H = 1_N` specialization).
//!
//! Solution-separation / MHSS is cited from Blanch (IEEE T-AES 51(1), 2015) and
//! Joerger (NAVIGATION 61(4), 2014). Every source estimates the *same* scalar
//! UTC(k) offset, so the geometry matrix degenerates to `H = 1_N`: there is no
//! geometry-dilution structure, and the protection level is driven by the
//! worst single-source-exclusion subset's noise overbound plus its UTC(k)
//! traceability bias. `bias_s` is an input overbound (the bias table is the
//! R2 paper's contribution). This is ARAIM specialized to a degenerate
//! geometry, not a new theorem.

use crate::raim::{araim_integrity_risk, araim_protection_level, normal_quantile, AraimMode};

/// One heterogeneous time source reduced to its scalar UTC(k) contribution.
#[derive(Clone, Copy, Debug)]
pub struct TimeSource {
    /// 1-σ noise overbound on this source's UTC(k) estimate (seconds).
    pub sigma_s: f64,
    /// UTC(k) traceability bias overbound `b_i` (seconds). Input; see R2.
    pub bias_s: f64,
    /// Prior fault probability for this source over the exposure interval.
    pub p_fault: f64,
}

/// The scalar timing protection level and the subset that drives it.
#[derive(Clone, Copy, Debug)]
pub struct ScalarTpl {
    /// Protection level on |t − UTC(k)| (seconds).
    pub pl_s: f64,
    /// Index of the worst single-source-exclusion subset (None if N ≤ 1).
    pub driving_subset: Option<usize>,
    /// Achieved one-sided integrity risk at `pl_s`.
    pub ir_achieved: f64,
}

/// Inverse-variance fused variance of a set of source variances (H = 1_N).
fn fused_variance(vars: impl Iterator<Item = f64>) -> f64 {
    let inv: f64 = vars.map(|v| 1.0 / v).sum();
    if inv <= 0.0 {
        f64::INFINITY
    } else {
        1.0 / inv
    }
}

/// Scalar-time MHSS protection level. `ir_budget` is the total integrity-risk
/// budget on the (two-sided) time error; `p_fa` the per-mode false-alert
/// budget. Returns `None` for an empty source set.
pub fn scalar_tpl(sources: &[TimeSource], ir_budget: f64, p_fa: f64) -> Option<ScalarTpl> {
    if sources.is_empty() {
        return None;
    }
    let n = sources.len();
    // Fault-free fused solution (all sources).
    let sigma_ff2 = fused_variance(sources.iter().map(|s| s.sigma_s.powi(2)));
    let w_ff: Vec<f64> = sources
        .iter()
        .map(|s| sigma_ff2 / s.sigma_s.powi(2))
        .collect();
    let bias_ff: f64 = sources
        .iter()
        .zip(&w_ff)
        .map(|(s, w)| w * s.bias_s.abs())
        .sum();

    // Per-mode detection multiplier (Bonferroni split across N exclusion modes).
    let k_fa = if n >= 2 {
        normal_quantile(1.0 - p_fa / (2.0 * n as f64))
    } else {
        normal_quantile(1.0 - p_fa / 2.0)
    };

    let mut modes = Vec::with_capacity(n + 1);
    // Fault-free hypothesis: threshold 0, carries nominal bias.
    modes.push(AraimMode {
        p_fault: 1.0 - sources.iter().map(|s| s.p_fault).sum::<f64>(),
        threshold_m: 0.0,
        bias_m: bias_ff,
        sigma_m: sigma_ff2.sqrt(),
    });

    // Single-source-exclusion subsets (only meaningful for N ≥ 2).
    let mut driving_subset = None;
    if n >= 2 {
        let mut worst_metric = f64::NEG_INFINITY;
        for j in 0..n {
            let sub_var = fused_variance(
                sources
                    .iter()
                    .enumerate()
                    .filter(|(i, _)| *i != j)
                    .map(|(_, s)| s.sigma_s.powi(2)),
            );
            // Separation statistic variance for nested estimators: σ_ss² = σ_sub² − σ_ff².
            let sig_ss = (sub_var - sigma_ff2).max(0.0).sqrt();
            // Weight for source i in the exclusion-j subset: w_i^(j) = sub_var / σ_i².
            let bias_sub: f64 = sources
                .iter()
                .enumerate()
                .filter(|(i, _)| *i != j)
                .map(|(_, s)| (sub_var / s.sigma_s.powi(2)) * s.bias_s.abs())
                .sum();
            let threshold = k_fa * sig_ss;
            let metric = bias_sub + threshold + sub_var.sqrt();
            if metric > worst_metric {
                worst_metric = metric;
                driving_subset = Some(j);
            }
            modes.push(AraimMode {
                p_fault: sources[j].p_fault,
                threshold_m: threshold,
                bias_m: bias_sub,
                sigma_m: sub_var.sqrt(),
            });
        }
    }

    // Allocate half the two-sided budget to each direction of the symmetric bound.
    let budget_one_sided = ir_budget / 2.0;
    let pl_s = araim_protection_level(&modes, budget_one_sided);
    let ir_achieved = araim_integrity_risk(pl_s, &modes);
    Some(ScalarTpl {
        pl_s,
        driving_subset,
        ir_achieved,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::raim::normal_quantile;

    #[test]
    fn single_source_is_rank_one_no_subset() {
        // N=1: no exclusion subset exists; PL = bias + sigma·Phi^-1(1 - ir/2/(1-p_fault)).
        let s = [TimeSource {
            sigma_s: 2e-9,
            bias_s: 1e-9,
            p_fault: 1e-4,
        }];
        let r = scalar_tpl(&s, 1e-5, 1e-3).unwrap();
        // Exact absolute-scale check: PL = b + σ·Φ⁻¹(1 − (ir/2)/(1−p_fault)).
        let expected = 1e-9 + 2e-9 * normal_quantile(1.0 - (1e-5 / 2.0) / (1.0 - 1e-4));
        assert!(
            (r.pl_s - expected).abs() < 1e-11,
            "N=1 PL must equal bias + sigma·Phi^-1(1 - ir/2/(1-p_fault))"
        );
        assert!(r.pl_s > s[0].bias_s);
        assert!(r.driving_subset.is_none() || r.driving_subset == Some(0));
    }

    #[test]
    fn two_equal_sources_fuse_then_exclude() {
        // Two equal σ: fused σ_ff = σ/√2; single-exclusion subset σ = σ.
        let s = [
            TimeSource {
                sigma_s: 3e-9,
                bias_s: 0.0,
                p_fault: 1e-4,
            },
            TimeSource {
                sigma_s: 3e-9,
                bias_s: 0.0,
                p_fault: 1e-4,
            },
        ];
        let r = scalar_tpl(&s, 1e-5, 1e-3).unwrap();
        assert!(r.pl_s.is_finite() && r.pl_s > 0.0);
        assert!(r.driving_subset.is_some());
        // Fusion identity: call the private fn directly via super::.
        // Two equal σ=3ns sources → fused σ_ff = σ/√2.
        let sigma_ff = super::fused_variance([9e-18f64, 9e-18f64].into_iter()).sqrt();
        assert!(
            (sigma_ff - 3e-9 / 2f64.sqrt()).abs() < 1e-15,
            "fault-free fusion of two equal sources must be sigma/sqrt(2)"
        );
        // Single-source-exclusion subset (one source remaining) → σ_sub = σ.
        let sigma_sub = super::fused_variance([9e-18f64].into_iter()).sqrt();
        assert!(
            (sigma_sub - 3e-9).abs() < 1e-15,
            "single-remaining-source subset must recover sigma"
        );
    }

    #[test]
    fn bias_dominates_the_pl_not_geometry() {
        // The R1 theorem: inflate one source's bias -> PL grows with the bias,
        // demonstrating the bias model (not geometry) drives the scalar PL.
        let base = [
            TimeSource {
                sigma_s: 2e-9,
                bias_s: 0.0,
                p_fault: 1e-4,
            },
            TimeSource {
                sigma_s: 2e-9,
                bias_s: 0.0,
                p_fault: 1e-4,
            },
            TimeSource {
                sigma_s: 2e-9,
                bias_s: 0.0,
                p_fault: 1e-4,
            },
        ];
        let mut biased = base;
        biased[0].bias_s = 20e-9;
        let r0 = scalar_tpl(&base, 1e-5, 1e-3).unwrap();
        let r1 = scalar_tpl(&biased, 1e-5, 1e-3).unwrap();
        assert!(r1.pl_s > r0.pl_s + 5e-9);
    }

    #[test]
    fn achieved_ir_meets_budget() {
        // Cross-check: at the returned PL, the direct MHSS risk sum ≤ budget/2.
        let s = [
            TimeSource {
                sigma_s: 2e-9,
                bias_s: 1e-9,
                p_fault: 1e-4,
            },
            TimeSource {
                sigma_s: 4e-9,
                bias_s: 2e-9,
                p_fault: 1e-4,
            },
        ];
        let ir = 1e-5;
        let r = scalar_tpl(&s, ir, 1e-3).unwrap();
        assert!(r.ir_achieved <= ir / 2.0 + 1e-12);
    }

    #[test]
    fn empty_sources_return_none() {
        assert!(scalar_tpl(&[], 1e-5, 1e-3).is_none());
    }
}
