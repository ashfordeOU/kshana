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
    debug_assert!(
        weights.iter().all(|&w| w >= 0.0),
        "the correlated-bias theorem assumes non-negative fusion weights"
    );
    quad_form(weights, bias_cov).max(0.0).sqrt()
}

/// Fused traceability bias IGNORING correlation (diagonal of `Σ_b` only):
/// `b = sqrt(Σ_i w_i² b_i²)`. Provided to expose the unsafe optimism.
///
/// THEOREM (correlated-bias-unsafe): for non-negative weights and overbounds,
/// `correlated_fused_bias ≥ independent_fused_bias`, strict when any two
/// same-realizer sources carry non-zero weight and `rho_common > 0`, with
/// equality iff `rho_common = 0`, or no two same-realizer sources both carry non-zero weight (e.g. all realizers distinct). Ignoring correlation under-bounds the fused
/// bias → optimistic → unsafe.
///
/// POSITIONING (honest): `correlated_fused_bias` / `independent_fused_bias` are
/// STANDALONE analysis quantities characterizing the optimism of a VARIANCE
/// (RSS) style bias allocation. They do NOT feed the R1 `tpl_scalar` protection
/// level, whose nominal bias is fused LINEARLY (`Σ wᵢ|bᵢ|`) — the
/// fully-correlated, worst-case-aligned upper bound that already DOMINATES both
/// `correlated_fused_bias` (ρ<1) and `independent_fused_bias`. The
/// "correlated-bias-unsafe" result therefore warns against a hypothetical
/// variance-style allocation and motivates R1's linear treatment; it does NOT
/// claim to harden the already-conservative R1 PL. (At ρ=1 *within a single
/// realizer* the correlated fused bias reduces to that realizer's linear sum
/// Σ wᵢ|bᵢ|; with ≥2 realizer groups R1's across-all-sources linear fusion
/// still STRICTLY dominates the correlated form, even at ρ=1.)
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

/// A paired Gaussian overbound of an empirical error distribution (Rife, Pullen, Enge and
/// Pervan, "Paired overbounding for nonideal LAAS and WAAS error distributions", IEEE
/// Trans. Aerosp. Electron. Syst. 42(4), 2006; the zero-mean special case is the CDF
/// overbound of DeCleene, ION GPS 2000): a left Gaussian CDF `Phi((x - mean_left)/sigma)`
/// that lies on or above the empirical CDF and a right one `Phi((x - mean_right)/sigma)` that
/// lies on or below it, so that both tails are bounded at every probability level.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PairedOverbound {
    /// Mean of the left (upper-CDF) bounding Gaussian.
    pub mean_left: f64,
    /// Mean of the right (lower-CDF) bounding Gaussian.
    pub mean_right: f64,
    /// Common standard deviation of the pair.
    pub sigma: f64,
}

impl PairedOverbound {
    /// Two-sided bound at total tail probability `tail`:
    /// `max(|mean_left|, |mean_right|) + sigma Phi^-1(1 - tail/2)`. Each side carries at
    /// most `tail/2`.
    pub fn bound(&self, tail: f64) -> f64 {
        self.mean_left.abs().max(self.mean_right.abs()) + self.sigma * inv_normal(1.0 - tail / 2.0)
    }
}

/// Inverse standard-normal CDF: Acklam's rational approximation refined by one Halley step
/// on [`crate::raim::normal_cdf`] (relative error near machine precision; much faster than
/// the bisection of [`normal_quantile`], which matters when every empirical level of a
/// sample needs its quantile).
fn inv_normal(p: f64) -> f64 {
    if p <= 0.0 {
        return f64::NEG_INFINITY;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }
    const A: [f64; 6] = [
        -3.969683028665376e+01,
        2.209460984245205e+02,
        -2.759285104469687e+02,
        1.383_577_518_672_69e2,
        -3.066479806614716e+01,
        2.506628277459239e+00,
    ];
    const B: [f64; 5] = [
        -5.447609879822406e+01,
        1.615858368580409e+02,
        -1.556989798598866e+02,
        6.680131188771972e+01,
        -1.328068155288572e+01,
    ];
    const C: [f64; 6] = [
        -7.784894002430293e-03,
        -3.223964580411365e-01,
        -2.400758277161838e+00,
        -2.549732539343734e+00,
        4.374664141464968e+00,
        2.938163982698783e+00,
    ];
    const D: [f64; 4] = [
        7.784695709041462e-03,
        3.224671290700398e-01,
        2.445134137142996e+00,
        3.754408661907416e+00,
    ];
    let plow = 0.02425;
    let x = if p < plow {
        let q = (-2.0 * p.ln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= 1.0 - plow {
        let q = p - 0.5;
        let r = q * q;
        (((((A[0] * r + A[1]) * r + A[2]) * r + A[3]) * r + A[4]) * r + A[5]) * q
            / (((((B[0] * r + B[1]) * r + B[2]) * r + B[3]) * r + B[4]) * r + 1.0)
    } else {
        let q = (-2.0 * (1.0 - p).ln()).sqrt();
        -(((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    };
    // One Halley refinement.
    let e = crate::raim::normal_cdf(x) - p;
    let u = e * (2.0 * std::f64::consts::PI).sqrt() * (x * x / 2.0).exp();
    x - u / (1.0 + x * u / 2.0)
}

/// The tightest paired Gaussian overbound of `samples` at the two-sided tail `tail`.
///
/// For a common `sigma`, the smallest admissible `mean_right` is
/// `max_i (x_(i) - sigma Phi^-1((i-1)/n))` (the right Gaussian must not exceed the
/// empirical CDF just below each order statistic) and the largest admissible `mean_left` is
/// `min_i (x_(i) - sigma Phi^-1(i/n))` (the left Gaussian must reach the empirical CDF at
/// each order statistic), over every interior level (the levels 0 and 1 have no finite
/// Gaussian bound). `sigma` is then chosen to minimise [`PairedOverbound::bound`] at `tail`:
/// a 120-point logarithmic grid from 1e-4 to 10 times the sample range (and `sigma = 0`),
/// refined by golden-section search between the best grid point's neighbours. Returns `None`
/// for fewer than two samples or a non-finite sample.
pub fn paired_overbound(samples: &[f64], tail: f64) -> Option<PairedOverbound> {
    if samples.len() < 2 || samples.iter().any(|v| !v.is_finite()) {
        return None;
    }
    let mut x = samples.to_vec();
    x.sort_by(f64::total_cmp);
    let n = x.len();
    let nf = n as f64;
    // Right constraints: i = 2..=n (level (i-1)/n in (0,1)); left: i = 1..=n-1.
    let zr: Vec<(f64, f64)> = (2..=n)
        .map(|i| (x[i - 1], inv_normal((i - 1) as f64 / nf)))
        .collect();
    let zl: Vec<(f64, f64)> = (1..n)
        .map(|i| (x[i - 1], inv_normal(i as f64 / nf)))
        .collect();
    let eval = |s: f64| -> PairedOverbound {
        let mr = zr
            .iter()
            .map(|&(v, z)| v - s * z)
            .fold(f64::NEG_INFINITY, f64::max);
        let ml = zl
            .iter()
            .map(|&(v, z)| v - s * z)
            .fold(f64::INFINITY, f64::min);
        PairedOverbound {
            mean_left: ml,
            mean_right: mr,
            sigma: s,
        }
    };
    let b = |s: f64| eval(s).bound(tail);
    let span = (x[n - 1] - x[0]).max(f64::MIN_POSITIVE);
    let mut grid: Vec<f64> = vec![0.0];
    let (lo, hi) = ((span * 1e-4).ln(), (span * 10.0).ln());
    grid.extend((0..120).map(|j| (lo + (hi - lo) * j as f64 / 119.0).exp()));
    let (mut jbest, mut bbest) = (0usize, f64::INFINITY);
    for (j, &s) in grid.iter().enumerate() {
        let v = b(s);
        if v < bbest {
            bbest = v;
            jbest = j;
        }
    }
    let (mut a, mut c) = (
        grid[jbest.saturating_sub(1)],
        grid[(jbest + 1).min(grid.len() - 1)],
    );
    let g = (5f64.sqrt() - 1.0) / 2.0;
    for _ in 0..60 {
        let s1 = c - g * (c - a);
        let s2 = a + g * (c - a);
        if b(s1) <= b(s2) {
            c = s2;
        } else {
            a = s1;
        }
    }
    let s_mid = 0.5 * (a + c);
    let best = if b(s_mid) < bbest { s_mid } else { grid[jbest] };
    Some(eval(best))
}

/// A [`SourceBias`] built from a laboratory's realised offsets instead of a published
/// uncertainty: the paired overbound of the training offsets
/// ([`paired_overbound`] at `tail`) gives `sigma` (as the expanded uncertainty with coverage
/// factor 1) and its larger absolute mean, and the paired-overbound bound of the training
/// changes over the staleness interval (`increments`, offsets `x(t + lag) - x(t)` at the lag
/// between the end of training and the epoch of use) is added as the ageing inflation. Then
/// [`integrity_bias_overbound`]`(bias, tail)` is
/// `sigma Phi^-1(1 - tail/2) + max|mean| + bound(increments, tail)`.
pub fn source_bias_from_realised_offsets(
    offsets_s: &[f64],
    increments_s: &[f64],
    tail: f64,
    realizer: UtcRealizer,
) -> Option<SourceBias> {
    let po = paired_overbound(offsets_s, tail)?;
    let ib = paired_overbound(increments_s, tail)?.bound(tail);
    Some(SourceBias {
        expanded_uncertainty_s: po.sigma,
        coverage_factor: 1.0,
        ageing_inflation_s: po.mean_left.abs().max(po.mean_right.abs()) + ib,
        realizer,
    })
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

    #[test]
    fn rho_one_single_realizer_recovers_linear_sum() {
        // With ALL sources on ONE realizer and rho=1, Σ_b = b bᵀ (rank-1), so
        // correlated_fused_bias = sqrt((Σ wᵢbᵢ)²) = Σ wᵢbᵢ — the linear
        // (worst-case-aligned) sum. Multi-realizer configs do NOT reduce this
        // way: the linear form strictly dominates there even at rho=1.
        let b = [
            src(4e-9, 2.0, 0.0, 7),
            src(3e-9, 2.0, 0.0, 7),
            src(5e-9, 2.0, 0.0, 7),
        ];
        let ob = [4e-9, 3e-9, 5e-9];
        let w = [0.5, 0.3, 0.2];
        let sigma = bias_cross_covariance(&b, &ob, 1.0);
        let corr = correlated_fused_bias(&w, &sigma);
        let linear: f64 = w.iter().zip(ob.iter()).map(|(wi, bi)| wi * bi).sum();
        assert!(
            (corr - linear).abs() < 1e-18,
            "rho=1 single realizer must recover the linear sum: {corr} vs {linear}"
        );
    }

    #[test]
    fn inverse_normal_matches_the_bisection_quantile() {
        for &p in &[1e-6, 0.005, 0.0243, 0.1, 0.5, 0.9, 0.995, 1.0 - 1e-6] {
            let (a, b) = (inv_normal(p), normal_quantile(p));
            assert!((a - b).abs() < 1e-9, "{p}: {a} {b}");
        }
    }

    #[test]
    fn paired_overbound_bounds_every_interior_level_and_its_tail() {
        // A skewed, shifted sample: the pair must straddle the empirical CDF.
        let xs: Vec<f64> = (0..400)
            .map(|i| {
                let u = (i as f64 + 0.5) / 400.0;
                3.0 + normal_quantile(u) + 2.0 * u * u
            })
            .collect();
        let po = paired_overbound(&xs, 1e-2).unwrap();
        assert!(po.mean_left <= po.mean_right);
        let mut s = xs.clone();
        s.sort_by(f64::total_cmp);
        let n = s.len() as f64;
        for (i, &x) in s.iter().enumerate() {
            let fi = (i + 1) as f64 / n;
            let fim = i as f64 / n;
            let left = crate::raim::normal_cdf((x - po.mean_left) / po.sigma);
            let right = crate::raim::normal_cdf((x - po.mean_right) / po.sigma);
            if fi < 1.0 {
                assert!(left >= fi - 1e-9, "left at {i}");
            }
            if fim > 0.0 {
                assert!(right <= fim + 1e-9, "right at {i}");
            }
        }
        let b = po.bound(1e-2);
        let exceed = xs.iter().filter(|v| v.abs() > b).count() as f64 / n;
        assert!(exceed <= 1e-2);
        // Built into a SourceBias, the existing overbound reproduces bound + increment bound.
        let inc: Vec<f64> = (0..100).map(|i| (i as f64 - 49.5) * 0.01).collect();
        let sb = source_bias_from_realised_offsets(&xs, &inc, 1e-2, UtcRealizer(1)).unwrap();
        let ib = paired_overbound(&inc, 1e-2).unwrap().bound(1e-2);
        assert!((integrity_bias_overbound(&sb, 1e-2) - (b + ib)).abs() < 1e-6 * (b + ib));
    }
}
