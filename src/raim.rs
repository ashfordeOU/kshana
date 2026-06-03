// SPDX-License-Identifier: Apache-2.0
//! Snapshot Receiver Autonomous Integrity Monitoring (RAIM).
//!
//! Real least-squares RAIM over a single epoch: it builds the line-of-sight
//! geometry to the visible satellites, forms the least-squares position/clock
//! solution and its residuals, runs a chi-squared fault-detection test, and
//! computes slope-based horizontal/vertical protection levels (HPL/VPL).
//!
//! This is the genuine snapshot-RAIM algorithm (Parkinson & Axelrad; Brown),
//! **not** the engine's "filter self-consistency" integrity FoM. The pieces:
//!
//! - Detection: under the fault-free hypothesis the sum of squared residuals
//!   `SSE/sigma^2` is chi-squared with `n-4` degrees of freedom. A fault is
//!   declared when it exceeds the threshold `chi2_{1-P_fa}(n-4)`.
//! - Protection levels: for each satellite the slope relating an undetected bias
//!   to the position error is `slope_i = ||S_pos,i|| / sqrt(1 - P_ii)`, where
//!   `S = (G^T G)^-1 G^T` and `P = G S` is the hat matrix. The protection level is
//!   `max_i(slope_i) * pbias * sigma`, with `pbias = sqrt(lambda)` the
//!   non-centrality that yields the allowed missed-detection probability `P_md`
//!   at the detection threshold.
//!
//! The chi-squared and non-central chi-squared distributions are evaluated from a
//! dependency-free regularized incomplete gamma function, so the thresholds and
//! `pbias` are computed exactly (no lookup tables).
//!
//! Two RAIM formulations are provided. [`snapshot_raim`] is the classic
//! residual/parity chi-squared test with slope-based protection levels.
//! [`solution_separation_raim`] is the stronger multiple-hypothesis
//! (solution-separation) method underlying ARAIM: it forms a sub-solution for
//! every single-satellite exclusion, detects and *identifies* a faulted
//! satellite from the sub-solution separations, and builds the protection level
//! from the per-mode separation statistics.
//!
//! Scope: single-constellation, snapshot (no carrier smoothing; single-fault
//! hypotheses — no simultaneous multi-satellite subsets; no full ARAIM
//! integrity-risk *budget* allocation across constellations). Validation against
//! a public reference dataset (gLAB) is a roadmap item. Together these provide
//! the genuine HPL/VPL an integrity claim rests on — not a self-consistency FoM.

use crate::frames::Vec3;
use crate::orbit::{enu_basis, invert4, los_unit};

/// Natural log of the gamma function (Lanczos approximation, g=7, n=9).
fn ln_gamma(x: f64) -> f64 {
    const G: f64 = 7.0;
    const C: [f64; 9] = [
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
        // Reflection formula.
        std::f64::consts::PI.ln() - (std::f64::consts::PI * x).sin().ln() - ln_gamma(1.0 - x)
    } else {
        let x = x - 1.0;
        let mut a = C[0];
        let t = x + G + 0.5;
        for (i, &c) in C.iter().enumerate().skip(1) {
            a += c / (x + i as f64);
        }
        0.5 * (2.0 * std::f64::consts::PI).ln() + (x + 0.5) * t.ln() - t + a.ln()
    }
}

/// Regularized lower incomplete gamma P(s, x) (Numerical Recipes: series for
/// x < s+1, continued fraction otherwise). Accurate to ~1e-12.
fn gammp(s: f64, x: f64) -> f64 {
    if x <= 0.0 {
        return 0.0;
    }
    let gln = ln_gamma(s);
    if x < s + 1.0 {
        // Series representation.
        let mut ap = s;
        let mut sum = 1.0 / s;
        let mut del = sum;
        for _ in 0..300 {
            ap += 1.0;
            del *= x / ap;
            sum += del;
            if del.abs() < sum.abs() * 1e-15 {
                break;
            }
        }
        sum * (-x + s * x.ln() - gln).exp()
    } else {
        // Continued fraction (Lentz).
        let tiny = 1e-300;
        let mut b = x + 1.0 - s;
        let mut c = 1.0 / tiny;
        let mut d = 1.0 / b;
        let mut h = d;
        for i in 1..300 {
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
            if (del - 1.0).abs() < 1e-15 {
                break;
            }
        }
        1.0 - (-x + s * x.ln() - gln).exp() * h
    }
}

/// CDF of the chi-squared distribution with `k` degrees of freedom at `x`.
pub fn chi2_cdf(x: f64, k: f64) -> f64 {
    gammp(k / 2.0, x / 2.0)
}

/// Quantile (inverse CDF) of the chi-squared distribution: the `x` with
/// `chi2_cdf(x, k) = p`. Bisection on the monotone CDF — accurate at all `k`
/// (unlike the Wilson-Hilferty approximation, which is rough at low `k`).
pub fn chi2_quantile(p: f64, k: f64) -> f64 {
    assert!(p > 0.0 && p < 1.0 && k > 0.0);
    let (mut lo, mut hi) = (0.0_f64, k + 10.0 * k.sqrt() + 20.0);
    while chi2_cdf(hi, k) < p {
        hi *= 2.0;
    }
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if chi2_cdf(mid, k) < p {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Standard-normal CDF `Φ(z)`, built from the regularized incomplete gamma
/// already used for the chi-squared law: `erf(x) = P(½, x²)` and
/// `Φ(z) = ½(1 + erf(z/√2))`. No lookup tables, no extra dependency.
pub fn normal_cdf(z: f64) -> f64 {
    let x = z / std::f64::consts::SQRT_2;
    let erf = if x >= 0.0 {
        gammp(0.5, x * x)
    } else {
        -gammp(0.5, x * x)
    };
    0.5 * (1.0 + erf)
}

/// Inverse standard-normal CDF `Φ⁻¹(p)` for `0 < p < 1`, by bisection on the
/// monotone CDF. This is the `K` multiplier solution-separation protection
/// levels are built from (`K_fa`, `K_md`).
pub fn normal_quantile(p: f64) -> f64 {
    if p <= 0.0 {
        return f64::NEG_INFINITY;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }
    let (mut lo, mut hi) = (-40.0_f64, 40.0_f64);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if normal_cdf(mid) < p {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// CDF of the non-central chi-squared distribution with `k` degrees of freedom
/// and non-centrality `lambda`, as a Poisson(lambda/2)-weighted sum of central
/// chi-squared CDFs (converges quickly for the lambda RAIM uses).
pub fn noncentral_chi2_cdf(x: f64, k: f64, lambda: f64) -> f64 {
    if lambda <= 0.0 {
        return chi2_cdf(x, k);
    }
    let half = lambda / 2.0;
    let mut term_ln = -half; // ln of Poisson weight for j=0
    let mut sum = 0.0;
    for j in 0..600 {
        if j > 0 {
            term_ln += half.ln() - (j as f64).ln();
        }
        let weight = term_ln.exp();
        sum += weight * chi2_cdf(x, k + 2.0 * j as f64);
        // Stop once the Poisson tail past the mode is negligible.
        if j as f64 > half && weight < 1e-14 {
            break;
        }
    }
    sum
}

/// The non-centrality `lambda` (so `pbias = sqrt(lambda)`) such that a fault of
/// that size is missed with probability `p_md` at detection threshold `t2`
/// (= chi2 threshold value) with `dof` degrees of freedom. Found by bisection on
/// the monotone (decreasing in lambda) missed-detection probability
/// `noncentral_chi2_cdf(t2, dof, lambda)`.
pub fn pbias(t2: f64, dof: f64, p_md: f64) -> f64 {
    let (mut lo, mut hi) = (0.0_f64, 10.0_f64);
    while noncentral_chi2_cdf(t2, dof, hi) > p_md {
        hi *= 2.0;
        if hi > 1e9 {
            break;
        }
    }
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if noncentral_chi2_cdf(t2, dof, mid) > p_md {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    (0.5 * (lo + hi)).sqrt()
}

/// The outcome of a snapshot RAIM check at one epoch.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RaimResult {
    /// Number of satellites used.
    pub n_used: usize,
    /// Redundancy (degrees of freedom), `n_used - 4`.
    pub dof: usize,
    /// Sum of squared residuals (m^2).
    pub sse: f64,
    /// Test statistic `SSE / sigma^2`, chi-squared(dof) under the null.
    pub test_statistic: f64,
    /// Detection threshold (chi-squared value) for the configured `p_fa`.
    pub threshold: f64,
    /// True when the test statistic exceeds the threshold (a fault is declared).
    pub fault_detected: bool,
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
}

/// Run snapshot RAIM at `user` (ECEF) against satellites at `sats` (ECEF), given
/// the measured pseudorange residuals `range_residual_m` (observed minus
/// predicted, one per satellite in the same order), the 1-sigma measurement
/// error `sigma_m`, and the false-alarm / missed-detection probabilities.
///
/// Returns `None` when there are fewer than 5 satellites (RAIM needs redundancy,
/// `dof >= 1`), a satellite has no valid line of sight, or the geometry is
/// singular.
pub fn snapshot_raim(
    user: Vec3,
    sats: &[Vec3],
    range_residual_m: &[f64],
    sigma_m: f64,
    p_fa: f64,
    p_md: f64,
) -> Option<RaimResult> {
    if sats.len() != range_residual_m.len() || sats.len() < 5 || sigma_m <= 0.0 {
        return None;
    }
    // Geometry matrix G (n x 4): rows [-e_x, -e_y, -e_z, 1].
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(sats.len());
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let n = g.len();
    let dof = n - 4;

    // Normal matrix GtG and its inverse A0 = (GtG)^-1.
    let mut gtg = [[0.0_f64; 4]; 4];
    for row in &g {
        for i in 0..4 {
            for j in 0..4 {
                gtg[i][j] += row[i] * row[j];
            }
        }
    }
    let a0 = invert4(gtg)?;

    // S = A0 * G^T  (4 x n): maps measurement errors to the state estimate.
    let s: Vec<[f64; 4]> = (0..n)
        .map(|c| {
            let mut col = [0.0_f64; 4];
            for (i, ci) in col.iter_mut().enumerate() {
                *ci = (0..4).map(|k| a0[i][k] * g[c][k]).sum();
            }
            col
        })
        .collect();

    // State estimate x = S * y, residual r = y - G x, SSE = r.r.
    let mut x = [0.0_f64; 4];
    for (c, &y) in range_residual_m.iter().enumerate() {
        for i in 0..4 {
            x[i] += s[c][i] * y;
        }
    }
    let mut sse = 0.0;
    for (c, &y) in range_residual_m.iter().enumerate() {
        let pred: f64 = (0..4).map(|k| g[c][k] * x[k]).sum();
        let r = y - pred;
        sse += r * r;
    }

    let test_statistic = sse / (sigma_m * sigma_m);
    let threshold = chi2_quantile(1.0 - p_fa, dof as f64);
    let fault_detected = test_statistic > threshold;

    // Hat-matrix diagonal P_ii = g_i . (A0 g_i) = g_i . s_i.
    // Position rows of S, rotated into the local ENU frame, give the horizontal
    // and vertical sensitivity of the estimate to each satellite's error.
    let (east, north, up) = enu_basis(user)?;
    let pb = pbias(threshold, dof as f64, p_md);
    let mut slope_h_max = 0.0_f64;
    let mut slope_v_max = 0.0_f64;
    for c in 0..n {
        let p_ii: f64 = (0..4).map(|k| g[c][k] * s[c][k]).sum();
        let redundancy = (1.0 - p_ii).max(1e-12);
        // ENU components of the position part (rows 0..3) of column c of S.
        let pos = [s[c][0], s[c][1], s[c][2]];
        let se = pos[0] * east[0] + pos[1] * east[1] + pos[2] * east[2];
        let sn = pos[0] * north[0] + pos[1] * north[1] + pos[2] * north[2];
        let su = pos[0] * up[0] + pos[1] * up[1] + pos[2] * up[2];
        let slope_h = ((se * se + sn * sn) / redundancy).sqrt();
        let slope_v = (su * su / redundancy).sqrt();
        slope_h_max = slope_h_max.max(slope_h);
        slope_v_max = slope_v_max.max(slope_v);
    }

    Some(RaimResult {
        n_used: n,
        dof,
        sse,
        test_statistic,
        threshold,
        fault_detected,
        hpl_m: slope_h_max * pb * sigma_m,
        vpl_m: slope_v_max * pb * sigma_m,
    })
}

/// Least-squares position/clock solution and its (unit-variance) covariance for a
/// geometry `g` (rows `[-e_x, -e_y, -e_z, 1]`) and residuals `y`. Returns
/// `(x, a)` where `x = A Gᵀ y`, `A = (GᵀG)⁻¹` (so the estimate covariance is
/// `σ² A`). `None` if the geometry is singular.
fn lsq_solution(g: &[[f64; 4]], y: &[f64]) -> Option<([f64; 4], [[f64; 4]; 4])> {
    let mut gtg = [[0.0_f64; 4]; 4];
    for row in g {
        for i in 0..4 {
            for j in 0..4 {
                gtg[i][j] += row[i] * row[j];
            }
        }
    }
    let a = invert4(gtg)?;
    let mut x = [0.0_f64; 4];
    for (c, &yc) in y.iter().enumerate() {
        // S column c = A · g_c, contribution S_c · y_c.
        for i in 0..4 {
            let s_ic: f64 = (0..4).map(|k| a[i][k] * g[c][k]).sum();
            x[i] += s_ic * yc;
        }
    }
    Some((x, a))
}

/// Variance of the position estimate along the unit axis `u` (ENU), per unit
/// measurement variance: `uᵀ A_pos u`, where `A_pos` is the 3×3 position block of
/// `A = (GᵀG)⁻¹`.
fn axis_variance(a: &[[f64; 4]; 4], u: Vec3) -> f64 {
    let mut v = 0.0;
    for i in 0..3 {
        for j in 0..3 {
            v += u[i] * a[i][j] * u[j];
        }
    }
    v.max(0.0)
}

/// The outcome of a solution-separation (multiple-hypothesis) RAIM check.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SolutionSeparationResult {
    /// Number of satellites in the all-in-view solution.
    pub n_used: usize,
    /// Horizontal protection level (m).
    pub hpl_m: f64,
    /// Vertical protection level (m).
    pub vpl_m: f64,
    /// `true` when any single-satellite sub-solution separates from the
    /// all-in-view solution beyond its detection threshold.
    pub fault_detected: bool,
    /// The satellite whose exclusion produces the largest normalized separation
    /// (the maximum-likelihood faulted satellite), when a fault is detected.
    pub excluded_sv: Option<usize>,
    /// The largest single-mode normalized separation `max(|Δ|/σ_ss)` over all
    /// hypotheses (the worst-case detection metric).
    pub max_normalized_separation: f64,
}

/// Solution-separation RAIM (the multiple-hypothesis method underlying ARAIM).
///
/// For the all-in-view least-squares solution `x₀` and every single-satellite
/// exclusion sub-solution `x_k`, the separation `Δ_k = x_k − x₀` is, under the
/// fault-free hypothesis, zero-mean Gaussian with covariance
/// `Cov(x_k) − Cov(x₀)` — the nested-estimator identity that holds because `x₀`
/// is the minimum-variance (BLUE) estimator on the full set (Blanch et al.,
/// *Baseline Advanced RAIM User Algorithm*). A fault on satellite `j` biases the
/// all-in-view solution but not the sub-solution that excludes `j`, so `Δ_j`
/// grows and the maximum-likelihood faulted satellite is the one whose exclusion
/// gives the largest normalized separation.
///
/// The protection level allocates the geometry to bound the position error at the
/// required integrity risk. Per axis (vertical shown; horizontal uses the radial
/// covariance):
///
/// ```text
/// σ_ss,k = σ·√(A_k,axis − A₀,axis)        (separation std for mode k)
/// PL = max( K_md·σ₀,axis ,  max_k [ K_fa·σ_ss,k + K_md·σ_k,axis ] )
/// ```
///
/// where `K_fa = Φ⁻¹(1 − P_fa/2)` is the per-mode detection multiplier and
/// `K_md = Φ⁻¹(1 − P_md)` the missed-detection multiplier. The fault-free term
/// `K_md·σ₀` protects the no-fault case; each fault mode adds the threshold a
/// just-undetectable bias can hide (`K_fa·σ_ss,k`) to the sub-solution noise it
/// must still cover (`K_md·σ_k`).
///
/// Horizontal protection uses the radial horizontal covariance
/// `σ_h² = A_east + A_north` with the same 1-D multipliers — a standard,
/// deliberately conservative simplification of the true 2-D (Rayleigh) bound.
///
/// Returns `None` for fewer than six satellites (each exclusion sub-solution then
/// lacks the redundancy `n−1 ≥ 5` for a protected solution), or a singular
/// geometry. Validation against a public reference (gLAB) dataset is a roadmap
/// item; this provides the algorithm an ARAIM-style integrity claim rests on.
pub fn solution_separation_raim(
    user: Vec3,
    sats: &[Vec3],
    range_residual_m: &[f64],
    sigma_m: f64,
    p_fa: f64,
    p_md: f64,
) -> Option<SolutionSeparationResult> {
    let n = sats.len();
    if n != range_residual_m.len() || n < 6 || sigma_m <= 0.0 {
        return None;
    }
    // Full geometry.
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(n);
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let (east, north, up) = enu_basis(user)?;

    let (x0, a0) = lsq_solution(&g, range_residual_m)?;
    let var0_v = axis_variance(&a0, up);
    let var0_h = axis_variance(&a0, east) + axis_variance(&a0, north);

    let k_fa = normal_quantile(1.0 - p_fa / 2.0);
    let k_md = normal_quantile(1.0 - p_md);

    // Fault-free protection term.
    let mut vpl = k_md * sigma_m * var0_v.sqrt();
    let mut hpl = k_md * sigma_m * var0_h.sqrt();

    let mut fault_detected = false;
    let mut excluded_sv = None;
    let mut max_norm_sep = 0.0_f64;

    for k in 0..n {
        // Sub-solution excluding satellite k.
        let g_sub: Vec<[f64; 4]> = (0..n).filter(|&i| i != k).map(|i| g[i]).collect();
        let y_sub: Vec<f64> = (0..n)
            .filter(|&i| i != k)
            .map(|i| range_residual_m[i])
            .collect();
        let (xk, ak) = match lsq_solution(&g_sub, &y_sub) {
            Some(v) => v,
            None => continue,
        };
        // Separation in ENU.
        let dx = [xk[0] - x0[0], xk[1] - x0[1], xk[2] - x0[2]];
        let sep_v = dx[0] * up[0] + dx[1] * up[1] + dx[2] * up[2];
        let sep_e = dx[0] * east[0] + dx[1] * east[1] + dx[2] * east[2];
        let sep_n = dx[0] * north[0] + dx[1] * north[1] + dx[2] * north[2];
        let sep_h = (sep_e * sep_e + sep_n * sep_n).sqrt();

        let vark_v = axis_variance(&ak, up);
        let vark_h = axis_variance(&ak, east) + axis_variance(&ak, north);
        // Nested-estimator separation std: σ_ss² = σ²(A_k − A₀) ≥ 0.
        let sig_ss_v = sigma_m * (vark_v - var0_v).max(0.0).sqrt();
        let sig_ss_h = sigma_m * (vark_h - var0_h).max(0.0).sqrt();

        // Detection: normalized separation against the per-mode multiplier.
        let nrm_v = if sig_ss_v > 1e-9 {
            sep_v.abs() / sig_ss_v
        } else {
            0.0
        };
        let nrm_h = if sig_ss_h > 1e-9 {
            sep_h / sig_ss_h
        } else {
            0.0
        };
        let nrm = nrm_v.max(nrm_h);
        if nrm > max_norm_sep {
            max_norm_sep = nrm;
            if nrm > k_fa {
                fault_detected = true;
                excluded_sv = Some(k);
            }
        }

        // Protection-level contribution for this fault mode.
        let vpl_k = k_fa * sig_ss_v + k_md * sigma_m * vark_v.sqrt();
        let hpl_k = k_fa * sig_ss_h + k_md * sigma_m * vark_h.sqrt();
        vpl = vpl.max(vpl_k);
        hpl = hpl.max(hpl_k);
    }

    Some(SolutionSeparationResult {
        n_used: n,
        hpl_m: hpl,
        vpl_m: vpl,
        fault_detected,
        excluded_sv,
        max_normalized_separation: max_norm_sep,
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::frames::{geodetic_to_ecef, Geodetic};
    use rand::{Rng, SeedableRng};
    use rand_chacha::ChaCha8Rng;

    #[test]
    fn chi2_cdf_and_quantile_match_known_values() {
        // chi2_{0.95}(1) = 3.84146 — accurate at low df (where Wilson-Hilferty errs).
        assert!((chi2_cdf(3.841_459, 1.0) - 0.95).abs() < 1e-4);
        assert!((chi2_quantile(0.95, 1.0) - 3.841_459).abs() < 1e-3);
        // chi2_{0.95}(10) = 18.307.
        assert!((chi2_quantile(0.95, 10.0) - 18.307).abs() < 1e-2);
        // Median of chi2(2) is 2 ln 2 = 1.3863.
        assert!((chi2_cdf(2.0 * 2.0_f64.ln(), 2.0) - 0.5).abs() < 1e-6);
    }

    #[test]
    fn noncentral_reduces_to_central_at_zero_lambda() {
        for &(x, k) in &[(3.0, 1.0), (10.0, 5.0), (20.0, 12.0)] {
            assert!((noncentral_chi2_cdf(x, k, 0.0) - chi2_cdf(x, k)).abs() < 1e-12);
        }
    }

    #[test]
    fn pbias_hits_the_missed_detection_probability() {
        // The lambda pbias returns must make the missed-detection probability equal
        // p_md at the threshold.
        let dof = 3.0;
        let t2 = chi2_quantile(1.0 - 1e-5, dof);
        let pb = pbias(t2, dof, 1e-3);
        let got = noncentral_chi2_cdf(t2, dof, pb * pb);
        assert!((got - 1e-3).abs() < 1e-4, "P_md = {got}, want 1e-3");
        assert!(pb > 0.0);
    }

    /// A spread of satellites (geodetic az/el) around a ground station, returned as
    /// ECEF positions ~20,200 km out (GPS-like).
    fn gps_like_constellation(station: Geodetic) -> Vec<Vec3> {
        let s = geodetic_to_ecef(station);
        let (east, north, up) = enu_basis(s).unwrap();
        // (azimuth deg, elevation deg) for six satellites with good geometry.
        let azel: [(f64, f64); 6] = [
            (0.0, 80.0),
            (45.0, 30.0),
            (135.0, 45.0),
            (225.0, 25.0),
            (300.0, 60.0),
            (180.0, 15.0),
        ];
        let range = 20_200_000.0;
        azel.iter()
            .map(|&(az, el)| {
                let (azr, elr) = (az.to_radians(), el.to_radians());
                // ENU direction from the station to the satellite.
                let de = elr.cos() * azr.sin();
                let dn = elr.cos() * azr.cos();
                let du = elr.sin();
                [
                    s[0] + range * (de * east[0] + dn * north[0] + du * up[0]),
                    s[1] + range * (de * east[1] + dn * north[1] + du * up[1]),
                    s[2] + range * (de * east[2] + dn * north[2] + du * up[2]),
                ]
            })
            .collect()
    }

    #[test]
    fn fault_free_geometry_does_not_alarm_and_gives_finite_pls() {
        let station = Geodetic {
            lat_rad: 0.9,
            lon_rad: 0.3,
            alt_m: 100.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        // Small, zero-mean measurement noise (no fault).
        let mut rng = ChaCha8Rng::seed_from_u64(4);
        let sigma = 5.0;
        let resid: Vec<f64> = (0..sats.len())
            .map(|_| (rng.gen::<f64>() - 0.5) * sigma)
            .collect();
        let r = snapshot_raim(user, &sats, &resid, sigma, 1e-5, 1e-3).expect("raim runs");
        assert_eq!(r.n_used, 6);
        assert_eq!(r.dof, 2);
        assert!(
            !r.fault_detected,
            "no fault should be flagged: stat {} thr {}",
            r.test_statistic, r.threshold
        );
        assert!(r.hpl_m > 0.0 && r.hpl_m.is_finite(), "HPL {}", r.hpl_m);
        assert!(r.vpl_m > 0.0 && r.vpl_m.is_finite(), "VPL {}", r.vpl_m);
    }

    #[test]
    fn large_single_satellite_bias_is_detected() {
        let station = Geodetic {
            lat_rad: 0.5,
            lon_rad: -1.2,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let sigma = 5.0;
        let mut resid = vec![0.0; sats.len()];
        resid[2] = 300.0; // a 300 m bias (60 sigma) on one satellite
        let r = snapshot_raim(user, &sats, &resid, sigma, 1e-5, 1e-3).expect("raim runs");
        assert!(
            r.fault_detected,
            "a 60-sigma bias must be detected: stat {} thr {}",
            r.test_statistic, r.threshold
        );
    }

    #[test]
    fn fewer_than_five_satellites_returns_none() {
        let station = Geodetic {
            lat_rad: 0.0,
            lon_rad: 0.0,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let four = &sats[..4];
        assert!(snapshot_raim(user, four, &[0.0; 4], 5.0, 1e-5, 1e-3).is_none());
    }

    #[test]
    fn normal_cdf_and_quantile_match_known_values() {
        // Φ(0) = 0.5, Φ(1.959964) = 0.975, Φ(-1) = 0.158655.
        assert!((normal_cdf(0.0) - 0.5).abs() < 1e-12);
        assert!((normal_cdf(1.959_964) - 0.975).abs() < 1e-6);
        assert!((normal_cdf(-1.0) - 0.158_655_3).abs() < 1e-6);
        // Inverse: the classic two-sided 95% multiplier and a 1e-7 tail.
        assert!((normal_quantile(0.975) - 1.959_964).abs() < 1e-4);
        assert!((normal_quantile(0.5)).abs() < 1e-6);
        assert!((normal_quantile(1.0 - 1e-7) - 5.199_338).abs() < 1e-3);
        // Symmetry Φ⁻¹(p) = −Φ⁻¹(1−p).
        assert!((normal_quantile(0.1) + normal_quantile(0.9)).abs() < 1e-4);
    }

    #[test]
    fn solution_separation_fault_free_does_not_alarm_and_protects() {
        let station = Geodetic {
            lat_rad: 0.9,
            lon_rad: 0.3,
            alt_m: 100.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let mut rng = ChaCha8Rng::seed_from_u64(7);
        let sigma = 5.0;
        let resid: Vec<f64> = (0..sats.len())
            .map(|_| (rng.gen::<f64>() - 0.5) * sigma)
            .collect();
        let r = solution_separation_raim(user, &sats, &resid, sigma, 1e-5, 1e-3)
            .expect("solution-separation runs");
        assert_eq!(r.n_used, 6);
        assert!(!r.fault_detected, "no fault expected");
        assert!(r.max_normalized_separation < normal_quantile(1.0 - 1e-5 / 2.0));
        assert!(r.hpl_m > 0.0 && r.hpl_m.is_finite(), "HPL {}", r.hpl_m);
        assert!(r.vpl_m > 0.0 && r.vpl_m.is_finite(), "VPL {}", r.vpl_m);
        assert_eq!(r.excluded_sv, None);
    }

    #[test]
    fn solution_separation_detects_and_identifies_the_faulty_satellite() {
        let station = Geodetic {
            lat_rad: 0.5,
            lon_rad: -1.2,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let sigma = 5.0;
        let mut resid = vec![0.0; sats.len()];
        resid[2] = 300.0; // 60-σ bias on satellite 2
        let r = solution_separation_raim(user, &sats, &resid, sigma, 1e-5, 1e-3)
            .expect("solution-separation runs");
        assert!(r.fault_detected, "a 60-σ bias must be detected");
        // Excluding the faulted satellite gives the clean sub-solution, so its
        // separation from the (biased) all-in-view solution is the largest.
        assert_eq!(r.excluded_sv, Some(2), "should identify SV 2 as faulted");
    }

    #[test]
    fn solution_separation_needs_six_satellites() {
        let station = Geodetic {
            lat_rad: 0.2,
            lon_rad: 0.4,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let five = &sats[..5];
        assert!(solution_separation_raim(user, five, &[0.0; 5], 5.0, 1e-5, 1e-3).is_none());
    }
}
