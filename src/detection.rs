// SPDX-License-Identifier: AGPL-3.0-only
//! Detection-theory primitives for the spoof monitor.
//!
//! A clock-aided spoof monitor forms a test statistic `y` — the discrepancy
//! between the GNSS-asserted time and the clock's own coasted prediction over a
//! window — with 1σ uncertainty `σ`. The two hypotheses are
//!
//! ```text
//!   H0 (no spoof):  y ~ N(0, σ²)
//!   H1 (spoof):     y ~ N(μ, σ²)
//! ```
//!
//! where `μ` is the spoof offset present at the decision. Because the spoof can
//! drag time in either direction, the deployed detector is the two-sided **energy
//! test** `T = (y/σ)² > λ`, with `T ~ χ²₁` under H0 — so the threshold `λ` is read
//! straight off the inverse χ²₁ CDF for a target false-alarm probability `P_fa`.
//! For a *known-sign* shift this is the Neyman–Pearson-optimal test (the
//! log-likelihood ratio [`llr`] is monotone in `|y|`); the two-sided form keeps it
//! optimal against either attack direction.
//!
//! From the threshold the operating characteristics are closed form:
//!
//! ```text
//!   γ      = σ · Φ⁻¹(1 − P_fa/2)              (the |y| detection boundary)
//!   P_md   = Φ((γ−μ)/σ) − Φ((−γ−μ)/σ)         (missed detection at offset μ)
//! ```
//!
//! [`monte_carlo_pfa_pmd`] re-derives `P_fa` and `P_md` empirically by drawing
//! noise-only and signal-plus-noise realisations and applying the same test, so
//! the analytic and simulated probabilities can be cross-checked.

use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use std::f64::consts::SQRT_2;

/// Error function via Abramowitz & Stegun 7.1.26 (max abs error 1.5e-7).
pub fn erf(x: f64) -> f64 {
    let sign = if x < 0.0 { -1.0 } else { 1.0 };
    let x = x.abs();
    let t = 1.0 / (1.0 + 0.327_591_1 * x);
    let y = 1.0
        - (((((1.061_405_429 * t - 1.453_152_027) * t) + 1.421_413_741) * t - 0.284_496_736) * t
            + 0.254_829_592)
            * t
            * (-x * x).exp();
    sign * y
}

/// Standard normal cumulative distribution function Φ(x).
pub fn normal_cdf(x: f64) -> f64 {
    0.5 * (1.0 + erf(x / SQRT_2))
}

/// Standard normal inverse CDF (probit) Φ⁻¹(p) for `p ∈ (0,1)` — Acklam's rational
/// approximation (relative error ≲ 1.15e-9). Saturates at ±∞ for `p` at the ends.
pub fn normal_inv_cdf(p: f64) -> f64 {
    if p <= 0.0 {
        return f64::NEG_INFINITY;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }
    const A: [f64; 6] = [
        -3.969_683_028_665_376e1,
        2.209_460_984_245_205e2,
        -2.759_285_104_469_687e2,
        1.383_577_518_672_69e2,
        -3.066_479_806_614_716e1,
        2.506_628_277_459_239e0,
    ];
    const B: [f64; 5] = [
        -5.447_609_879_822_406e1,
        1.615_858_368_580_409e2,
        -1.556_989_798_598_866e2,
        6.680_131_188_771_972e1,
        -1.328_068_155_288_572e1,
    ];
    const C: [f64; 6] = [
        -7.784_894_002_430_293e-3,
        -3.223_964_580_411_365e-1,
        -2.400_758_277_161_838e0,
        -2.549_732_539_343_734e0,
        4.374_664_141_464_968e0,
        2.938_163_982_698_783e0,
    ];
    const D: [f64; 4] = [
        7.784_695_709_041_462e-3,
        3.224_671_290_700_398e-1,
        2.445_134_137_142_996e0,
        3.754_408_661_907_416e0,
    ];
    let p_low = 0.024_25;
    let p_high = 1.0 - p_low;
    if p < p_low {
        let q = (-2.0 * p.ln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= p_high {
        let q = p - 0.5;
        let r = q * q;
        (((((A[0] * r + A[1]) * r + A[2]) * r + A[3]) * r + A[4]) * r + A[5]) * q
            / (((((B[0] * r + B[1]) * r + B[2]) * r + B[3]) * r + B[4]) * r + 1.0)
    } else {
        let q = (-2.0 * (1.0 - p).ln()).sqrt();
        -(((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    }
}

/// Log-likelihood ratio `log[p(y|H1)/p(y|H0)]` for a mean shift `mu` in Gaussian
/// noise of standard deviation `sigma` (equal variance under both hypotheses):
/// `LLR(y) = (y − 0)²/(2σ²) − (y − μ)²/(2σ²) = (μ·y)/σ² − μ²/(2σ²)`. Monotone in
/// `y`, so thresholding the LLR is equivalent to thresholding `y` (the deployed
/// detector uses the two-sided energy form to catch either-sign offsets).
pub fn llr(y: f64, mu: f64, sigma: f64) -> f64 {
    let s2 = sigma * sigma;
    (mu * y) / s2 - (mu * mu) / (2.0 * s2)
}

/// The two-sided |y| detection boundary `γ = σ·Φ⁻¹(1 − P_fa/2)` for a target
/// false-alarm probability — equivalently `σ·√λ` for the χ²₁ energy threshold `λ`.
pub fn detection_boundary(sigma: f64, p_fa: f64) -> f64 {
    sigma * normal_inv_cdf(1.0 - p_fa / 2.0)
}

/// The χ²₁ energy-detector threshold `λ` for a target `P_fa`: `λ = [Φ⁻¹(1−P_fa/2)]²`,
/// so that `P(χ²₁ > λ) = P_fa`. Detect when `(y/σ)² > λ`.
pub fn chi2_1_threshold(p_fa: f64) -> f64 {
    let z = normal_inv_cdf(1.0 - p_fa / 2.0);
    z * z
}

/// Inverse CDF (quantile) of the χ² distribution with `dof` degrees of freedom,
/// via the Wilson–Hilferty cube-root-normal approximation:
/// `χ²_p(k) ≈ k·(1 − 2/(9k) + z·√(2/(9k)))³`, with `z = Φ⁻¹(p)`.
///
/// The cube-root of a χ² variable is very nearly Gaussian, so this is accurate to
/// well under 1 % for `k ≥ 2` and to ~0.1 % by `k ≥ 10`; it is used here for the
/// filter-consistency confidence bands, where the pooled degrees of freedom (one
/// per sample) run into the thousands and the approximation is effectively exact.
pub fn chi2_inv_cdf(p: f64, dof: f64) -> f64 {
    let k = dof.max(1e-9);
    let z = normal_inv_cdf(p.clamp(1e-12, 1.0 - 1e-12));
    let a = 2.0 / (9.0 * k);
    let t = 1.0 - a + z * a.sqrt();
    // The cube-root model can dip below zero deep in the lower tail for tiny k;
    // a χ² quantile is non-negative, so clamp.
    (k * t * t * t).max(0.0)
}

/// Closed-form missed-detection probability for a spoof offset `mu` against noise
/// `sigma` with the two-sided boundary `gamma`:
/// `P_md = Φ((γ−μ)/σ) − Φ((−γ−μ)/σ)`.
pub fn analytic_pmd(mu: f64, sigma: f64, gamma: f64) -> f64 {
    let s = sigma.max(1e-300);
    (normal_cdf((gamma - mu) / s) - normal_cdf((-gamma - mu) / s)).clamp(0.0, 1.0)
}

/// Closed-form detection power `P_d = 1 − P_md`.
pub fn analytic_pd(mu: f64, sigma: f64, gamma: f64) -> f64 {
    1.0 - analytic_pmd(mu, sigma, gamma)
}

/// Monte-Carlo estimate of `(P_fa, P_md)` for the two-sided detector: draw `n`
/// noise-only (`H0`) and `n` signal-plus-noise (`H1`, mean `mu`) realisations of a
/// `N(·, σ²)` statistic and apply `|y| > gamma`. Deterministic in `seed`.
pub fn monte_carlo_pfa_pmd(mu: f64, sigma: f64, gamma: f64, n: usize, seed: u64) -> (f64, f64) {
    let n = n.max(1);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let h0 = Normal::new(0.0, sigma.max(1e-300)).unwrap();
    let h1 = Normal::new(mu, sigma.max(1e-300)).unwrap();
    let mut false_alarms = 0usize;
    let mut misses = 0usize;
    for _ in 0..n {
        if h0.sample(&mut rng).abs() > gamma {
            false_alarms += 1;
        }
        if h1.sample(&mut rng).abs() <= gamma {
            misses += 1;
        }
    }
    (false_alarms as f64 / n as f64, misses as f64 / n as f64)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn erf_and_normal_cdf_match_textbook_values() {
        assert!((erf(0.0)).abs() < 1e-9);
        assert!((erf(1.0) - 0.842_700_79).abs() < 1e-6);
        assert!((erf(0.5) - 0.520_499_88).abs() < 1e-6);
        assert!((erf(-1.0) + 0.842_700_79).abs() < 1e-6);
        assert!((normal_cdf(0.0) - 0.5).abs() < 1e-9);
        assert!((normal_cdf(1.0) - 0.841_344_75).abs() < 1e-6);
        assert!((normal_cdf(2.0) - 0.977_249_87).abs() < 1e-6);
        assert!((normal_cdf(-1.0) - 0.158_655_25).abs() < 1e-6);
    }

    #[test]
    fn inverse_cdf_inverts_the_cdf() {
        assert!((normal_inv_cdf(0.5)).abs() < 1e-9);
        assert!((normal_inv_cdf(0.975) - 1.959_963_98).abs() < 1e-6);
        assert!((normal_inv_cdf(0.99) - 2.326_347_87).abs() < 1e-6);
        assert!((normal_inv_cdf(0.995) - 2.575_829_30).abs() < 1e-6);
        // Round-trip Φ(Φ⁻¹(p)) = p.
        for &p in &[0.001, 0.05, 0.3, 0.7, 0.95, 0.999] {
            assert!((normal_cdf(normal_inv_cdf(p)) - p).abs() < 1e-6, "p={p}");
        }
    }

    #[test]
    fn analytic_pmd_matches_hand_computation() {
        // sigma=1, P_fa=0.01 → gamma = Φ⁻¹(0.995) = 2.5758. For mu/sigma = 2:
        //   P_md = Φ(2.5758−2) − Φ(−2.5758−2) = Φ(0.5758) − Φ(−4.5758)
        //        = 0.71767 − ~0 = 0.71767.
        let gamma = detection_boundary(1.0, 0.01);
        assert!((gamma - 2.575_829_30).abs() < 1e-5, "gamma={gamma}");
        let pmd = analytic_pmd(2.0, 1.0, gamma);
        assert!((pmd - 0.717_67).abs() < 1e-3, "pmd={pmd}");
        // A far-above-noise spoof (mu/sigma = 10) is essentially always caught.
        assert!(analytic_pmd(10.0, 1.0, gamma) < 1e-6);
        // chi2_1 threshold is gamma² for sigma=1.
        assert!((chi2_1_threshold(0.01) - gamma * gamma).abs() < 1e-9);
    }

    #[test]
    fn chi2_inv_cdf_matches_table_values() {
        // Upper 95th-percentile χ² quantiles (standard tables). Wilson–Hilferty
        // tightens as the dof grows: ~1 % at k=2, ~0.1 % by k=10, exact by k≥50.
        for &(p, dof, table, tol) in &[
            (0.95, 2.0, 5.991, 0.06),
            (0.95, 5.0, 11.070, 0.05),
            (0.95, 10.0, 18.307, 0.03),
            (0.95, 50.0, 67.505, 0.05),
            (0.975, 100.0, 129.561, 0.1),
            (0.025, 100.0, 74.222, 0.1),
        ] {
            let got = chi2_inv_cdf(p, dof);
            assert!(
                (got - table).abs() < tol,
                "chi2_inv_cdf(p={p}, dof={dof}) = {got}, table {table}"
            );
        }
        // The median of χ²(k) is ≈ k·(1 − 2/9k)³, just below k.
        assert!(chi2_inv_cdf(0.5, 4.0) < 4.0 && chi2_inv_cdf(0.5, 4.0) > 3.0);
    }

    #[test]
    fn llr_threshold_is_equivalent_to_a_y_threshold() {
        // LLR is monotone increasing in y for mu>0, so LLR(y1) < LLR(y2) ⟺ y1 < y2.
        let (mu, sigma) = (3.0, 1.5);
        assert!(llr(1.0, mu, sigma) < llr(2.0, mu, sigma));
        // LLR(mu/2) = 0 (the midpoint between the two hypothesis means).
        assert!((llr(mu / 2.0, mu, sigma)).abs() < 1e-12);
    }

    #[test]
    fn monte_carlo_recovers_the_analytic_operating_point() {
        // With 200k trials the empirical P_fa and P_md track the closed forms to a
        // few ×1/√N. Target P_fa = 0.01, mu/sigma = 2 (P_md ≈ 0.7177).
        let (sigma, p_fa, mu) = (1.0, 0.01, 2.0);
        let gamma = detection_boundary(sigma, p_fa);
        let pmd_analytic = analytic_pmd(mu, sigma, gamma);
        let (mc_pfa, mc_pmd) = monte_carlo_pfa_pmd(mu, sigma, gamma, 200_000, 12345);
        // 1/sqrt(2e5) ≈ 2.2e-3, so allow a few sigma of sampling error.
        assert!((mc_pfa - p_fa).abs() < 0.003, "mc_pfa={mc_pfa}");
        assert!(
            (mc_pmd - pmd_analytic).abs() / pmd_analytic < 0.03,
            "mc_pmd={mc_pmd} vs analytic={pmd_analytic}"
        );
    }

    #[test]
    fn monte_carlo_is_deterministic_in_the_seed() {
        let g = detection_boundary(1.0, 0.01);
        assert_eq!(
            monte_carlo_pfa_pmd(2.0, 1.0, g, 10_000, 7),
            monte_carlo_pfa_pmd(2.0, 1.0, g, 10_000, 7)
        );
    }
}
