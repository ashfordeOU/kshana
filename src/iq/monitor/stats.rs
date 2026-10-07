// SPDX-License-Identifier: AGPL-3.0-only
//! Closed forms behind the monitors' thresholds, for white Gaussian noise.
//!
//! * [`power_block_pfa`] — the false-alarm probability of the block-power test: the mean of
//!   `N` values of `|x|²/σ²` is Gamma(`N`, 1/`N`) distributed for circular complex Gaussian
//!   `x`, so a two-sided threshold of `±t` dB has `P_fa = Q(N, N·10^{t/10}) + P(N, N·10^{−t/10})`
//!   (regularised incomplete gamma functions).
//! * [`complex_kurtosis_sd`] — the estimator `mean(|x|⁴)/mean(|x|²)²` of circular complex
//!   Gaussian noise has mean 2 and, to first order (delta method with the exponential
//!   moments 1, 2, 6, 24), standard deviation `2/√N`.
//! * [`pulse_pfa`] — `P(|x|² > t·σ²) = e^{−t}` for circular complex Gaussian `x`.
//! * [`cusum_arl`] — Siegmund's approximation of the average run length of a one-sided
//!   CUSUM on unit-variance Gaussian increments of mean `μ` with reference value `k` and
//!   decision interval `h`: `(e^{−2Δb} + 2Δb − 1)/(2Δ²)` with `Δ = μ − k`, `b = h + 1.166`
//!   (Siegmund, *Sequential Analysis*, 1985, §X.2; Basseville & Nikiforov 1993, §5.2).
//! * [`pli_mean`] — the mean of `cos 2θ` for the phase `θ` of `A + n`, `n` circular complex
//!   Gaussian with `A²/E|n|² = γ`: `1 − (1 − e^{−γ})/γ` (the phase lock indicator
//!   `(I² − Q²)/(I² + Q²)` on a perfectly tracked carrier).
//! * [`welch_equivalent_segments`], [`welch_max_excess_pfa`] — a Welch PSD bin of white
//!   Gaussian noise averaged over `K` periodic-Hann segments is, to a good approximation,
//!   Gamma distributed with `K_eff` degrees of freedom per two (Welch 1967:
//!   `1/K_eff = (1/K)[1 + 2Σ_{j≥1}(1 − j/K)ρ_j²]`, `ρ_j` the window's normalised overlap
//!   correlation at a lag of `j` steps). Treating the bins as independent, the largest of
//!   `B` bins exceeds `t` dB over its mean with probability
//!   `1 − (1 − Q(K_eff, K_eff·10^{t/10}))^B`. This is an approximation: overlapping
//!   segments are not exactly Gamma, adjacent Hann bins correlate, and the monitor divides
//!   by an *estimated* baseline. On 750 blocks of 31 segments at 2.5 dB the measured rate
//!   came out 1.3 times the formula (`tests/iq_monitor.rs`), so read it as an order of
//!   magnitude for the false-alarm rate, not an exact figure.
//! * [`sqm_delta_sd`], [`sqm_ratio_sd`] — first-order noise standard deviations of the delta
//!   `(I_E − I_L)/I_P` and ratio `(I_E + I_L)/(2 I_P)` tests for an ideal BPSK correlation
//!   triangle, early and late at `±d/2`, whose noise correlates as `1 − |Δτ|` (in chips):
//!   `√(d/(C/N0·T))` and `√((1 − d/2)(d/2)/(2·C/N0·T))`.

/// Natural log of the gamma function (Lanczos, g = 7, nine terms; relative error < 1e-15
/// for x > 0.5).
pub fn ln_gamma(x: f64) -> f64 {
    const G: [f64; 9] = [
        0.999_999_999_999_809_9,
        676.520_368_121_885_1,
        -1_259.139_216_722_402_8,
        771.323_428_777_653_1,
        -176.615_029_162_140_6,
        12.507_343_278_686_905,
        -0.138_571_095_265_720_12,
        9.984_369_578_019_572e-6,
        1.505_632_735_149_311_6e-7,
    ];
    if x < 0.5 {
        let pi = std::f64::consts::PI;
        return (pi / (pi * x).sin()).ln() - ln_gamma(1.0 - x);
    }
    let x = x - 1.0;
    let mut a = G[0];
    let t = x + 7.5;
    for (i, &c) in G.iter().enumerate().skip(1) {
        a += c / (x + i as f64);
    }
    0.5 * (2.0 * std::f64::consts::PI).ln() + (x + 0.5) * t.ln() - t + a.ln()
}

/// Regularised lower incomplete gamma `P(s, x)`, with its complement
/// `Q(s, x) = 1 − P(s, x)` returned as the second value (each computed directly, so a
/// small tail keeps its relative accuracy). Series for `x < s + 1`, Lentz continued
/// fraction otherwise, iterated to convergence.
pub fn gamma_pq(s: f64, x: f64) -> (f64, f64) {
    if x <= 0.0 {
        return (0.0, 1.0);
    }
    let lead = (-x + s * x.ln() - ln_gamma(s)).exp();
    if x < s + 1.0 {
        let mut ap = s;
        let mut sum = 1.0 / s;
        let mut del = sum;
        for _ in 0..1_000_000 {
            ap += 1.0;
            del *= x / ap;
            sum += del;
            if del.abs() < sum.abs() * 1e-16 {
                break;
            }
        }
        let p = sum * lead;
        (p, 1.0 - p)
    } else {
        let tiny = 1e-300;
        let mut b = x + 1.0 - s;
        let mut c = 1.0 / tiny;
        let mut d = 1.0 / b;
        let mut h = d;
        for i in 1..1_000_000 {
            let an = -(i as f64) * (i as f64 - s);
            b += 2.0;
            d = an * d + b;
            if d.abs() < tiny {
                d = tiny;
            }
            c = b + an / c;
            if c.abs() < tiny {
                c = tiny;
            }
            d = 1.0 / d;
            let del = d * c;
            h *= del;
            if (del - 1.0).abs() < 1e-16 {
                break;
            }
        }
        let q = lead * h;
        (1.0 - q, q)
    }
}

/// False-alarm probability per block of the two-sided block-power test: `N` complex
/// Gaussian samples, an alarm when the block's mean power departs from the true noise
/// power by more than `threshold_db` either way.
pub fn power_block_pfa(n: usize, threshold_db: f64) -> f64 {
    let n = n as f64;
    let hi = 10f64.powf(threshold_db / 10.0);
    let lo = 10f64.powf(-threshold_db / 10.0);
    gamma_pq(n, n * hi).1 + gamma_pq(n, n * lo).0
}

/// First-order standard deviation of the complex kurtosis estimator over `n` samples of
/// circular complex Gaussian noise: `2/√n`.
pub fn complex_kurtosis_sd(n: usize) -> f64 {
    2.0 / (n as f64).sqrt()
}

/// `P(|x|² > t·σ²)` for circular complex Gaussian `x` of power `σ²`: `e^{−t}`.
pub fn pulse_pfa(t: f64) -> f64 {
    (-t).exp()
}

/// Siegmund's approximation of the average run length of a one-sided CUSUM
/// `g ← max(0, g + z − k)`, alarm at `g > h`, on independent unit-variance Gaussian `z` of
/// mean `mu`: with `Δ = mu − k` and `b = h + 1.166`, `(e^{−2Δb} + 2Δb − 1)/(2Δ²)` (`b²`
/// when `Δ = 0`).
pub fn cusum_arl(k: f64, h: f64, mu: f64) -> f64 {
    let b = h + 1.166;
    let delta = mu - k;
    if delta.abs() < 1e-12 {
        return b * b;
    }
    ((-2.0 * delta * b).exp() + 2.0 * delta * b - 1.0) / (2.0 * delta * delta)
}

/// The in-control average run length (samples to a false alarm): [`cusum_arl`] with
/// `mu = 0`, `(e^{2kb} − 2kb − 1)/(2k²)`.
pub fn cusum_arl0(k: f64, h: f64) -> f64 {
    cusum_arl(k, h, 0.0)
}

/// Mean of `cos 2θ` for the phase of a constant phasor in circular complex Gaussian noise
/// at power signal-to-noise ratio `gamma` (`A²/E|n|²`): `1 − (1 − e^{−γ})/γ`.
pub fn pli_mean(gamma: f64) -> f64 {
    if gamma < 1e-9 {
        return gamma / 2.0;
    }
    1.0 - (1.0 - (-gamma).exp()) / gamma
}

/// Welch's equivalent number of independent segments for `segments` periodic-Hann
/// segments of `nfft` points stepped by `step` points.
pub fn welch_equivalent_segments(nfft: usize, step: usize, segments: usize) -> f64 {
    let w: Vec<f64> = (0..nfft)
        .map(|n| 0.5 - 0.5 * (std::f64::consts::TAU * n as f64 / nfft as f64).cos())
        .collect();
    let s2: f64 = w.iter().map(|v| v * v).sum();
    let k = segments.max(1) as f64;
    let mut acc = 0.0;
    for j in 1..segments {
        let lag = j * step.max(1);
        if lag >= nfft {
            break;
        }
        let c: f64 = (0..nfft - lag).map(|n| w[n] * w[n + lag]).sum::<f64>() / s2;
        acc += (1.0 - j as f64 / k) * c * c;
    }
    k / (1.0 + 2.0 * acc)
}

/// Probability that the largest of `bins` Welch bins (each with `k_eff` equivalent
/// segments, see [`welch_equivalent_segments`]) of white noise exceeds its mean by more
/// than `threshold_db`, treating the bins as independent.
pub fn welch_max_excess_pfa(k_eff: f64, bins: usize, threshold_db: f64) -> f64 {
    let q = gamma_pq(k_eff, k_eff * 10f64.powf(threshold_db / 10.0)).1;
    1.0 - (1.0 - q).powi(bins as i32)
}

/// The excess threshold (dB) at which [`welch_max_excess_pfa`] equals `pfa` (bisection).
pub fn welch_excess_threshold_db(k_eff: f64, bins: usize, pfa: f64) -> f64 {
    let (mut lo, mut hi) = (0.0f64, 60.0f64);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if welch_max_excess_pfa(k_eff, bins, mid) > pfa {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    hi
}

/// First-order noise standard deviation of the delta test `(I_E − I_L)/I_P` at early-late
/// spacing `d` chips and coherent signal-to-noise ratio `cn0_t = C/N0·T`.
pub fn sqm_delta_sd(d: f64, cn0_t: f64) -> f64 {
    (d / cn0_t).sqrt()
}

/// First-order noise standard deviation of the ratio test `(I_E + I_L)/(2 I_P)` at
/// early-late spacing `d` chips and `cn0_t = C/N0·T`.
pub fn sqm_ratio_sd(d: f64, cn0_t: f64) -> f64 {
    ((1.0 - d / 2.0) * (d / 2.0) / (2.0 * cn0_t)).sqrt()
}

/// First-order noise standard deviation of a symmetric-pair asymmetry test
/// `(I_{+x} − I_{−x})/I_P` with taps at `±x` chips (`x ≤ 1/2`): `√(2x/(C/N0·T))`, the delta
/// test with spacing `2x`.
pub fn sqm_pair_sd(x: f64, cn0_t: f64) -> f64 {
    sqm_delta_sd(2.0 * x, cn0_t)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gamma_matches_known_values() {
        // P(1, x) = 1 − e^{−x}; P(s, s) → 1/2 for large s; ln Γ(5) = ln 24.
        assert!((gamma_pq(1.0, 2.0).0 - (1.0 - (-2.0f64).exp())).abs() < 1e-14);
        assert!((gamma_pq(1.0, 0.3).1 - (-0.3f64).exp()).abs() < 1e-14);
        assert!((ln_gamma(5.0) - 24f64.ln()).abs() < 1e-13);
        assert!((ln_gamma(0.5) - std::f64::consts::PI.sqrt().ln()).abs() < 1e-13);
        let (p, q) = gamma_pq(20_000.0, 20_000.0);
        assert!(
            (p - 0.5).abs() < 0.01 && (p + q - 1.0).abs() < 1e-12,
            "{p} {q}"
        );
        // Q(3, 7) = e^{−7}(1 + 7 + 24.5).
        let q37 = (-7.0f64).exp() * (1.0 + 7.0 + 24.5);
        assert!((gamma_pq(3.0, 7.0).1 - q37).abs() < 1e-14);
    }

    #[test]
    fn closed_forms_have_their_limits() {
        assert!((pli_mean(1e6) - 1.0).abs() < 2e-6);
        assert!(pli_mean(1e-12).abs() < 1e-12);
        // With k = 0.5, h = 5: ARL0 ≈ 938 (the textbook figure for this design is ≈ 930).
        let a = cusum_arl0(0.5, 5.0);
        assert!((a - 938.0).abs() < 5.0, "{a}");
        assert!((cusum_arl(0.5, 5.0, 1.0) - 10.3).abs() < 0.1);
        assert!((power_block_pfa(1, 0.0) - 1.0).abs() < 1e-12);
    }
}
