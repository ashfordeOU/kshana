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
use crate::orbit::{
    enu_basis, invert4, los_unit, visible_positions, visible_positions_labeled, ConstellationCfg,
    Orbit, OrbitCfg, Propagator,
};
use crate::scenario::TimeCfg;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};

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
    // Robust guards (mirroring `normal_quantile`) so adversarial or mis-configured
    // inputs return a sensible boundary value rather than panicking — the RAIM/ARAIM
    // stack must never panic on out-of-range probabilities or degrees of freedom.
    // (NaN is caught by `is_finite`, since `NaN <= 0.0` is false.)
    if !k.is_finite() || k <= 0.0 || !p.is_finite() || p <= 0.0 {
        return 0.0;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }
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

/// Sensitivity of the position estimate along unit axis `u` (ENU) to a unit error
/// in the single measurement whose geometry row is `g_row`: `uᵀ·(A·g_row)_pos`,
/// i.e. that column of the least-squares gain matrix `S = A·Gᵀ` projected onto the
/// axis (`A = (GᵀG)⁻¹`).
fn axis_gain(a: &[[f64; 4]; 4], g_row: &[f64; 4], u: Vec3) -> f64 {
    let mut s = 0.0;
    for (i, &ui) in u.iter().enumerate() {
        let s_i: f64 = (0..4).map(|k| a[i][k] * g_row[k]).sum();
        s += ui * s_i;
    }
    s
}

/// Worst-case nominal-bias projection onto a single axis: `b_nom · Σ_c |s_axis,c|`
/// (the one-sided sum of per-measurement gain magnitudes — each satellite's
/// nominal bias may take the sign that pushes the estimate the same way). This is
/// the `b_k` term of the MHSS protection level (Blanch et al.). Returns `0` for a
/// non-positive `b_nom`.
fn axis_bias_sum(a: &[[f64; 4]; 4], g: &[[f64; 4]], u: Vec3, b_nom: f64) -> f64 {
    if b_nom <= 0.0 {
        return 0.0;
    }
    b_nom * g.iter().map(|row| axis_gain(a, row, u).abs()).sum::<f64>()
}

/// Worst-case nominal-bias projection onto the horizontal plane: each satellite
/// contributes a 2-D gain vector `(s_east,c, s_north,c)`, and the worst-case
/// horizontal bias magnitude is bounded by `b_nom · Σ_c ‖(s_east,c, s_north,c)‖`
/// (the triangle-inequality bound over arbitrary per-satellite bias signs).
fn horiz_bias_sum(a: &[[f64; 4]; 4], g: &[[f64; 4]], east: Vec3, north: Vec3, b_nom: f64) -> f64 {
    if b_nom <= 0.0 {
        return 0.0;
    }
    b_nom
        * g.iter()
            .map(|row| {
                let se = axis_gain(a, row, east);
                let sn = axis_gain(a, row, north);
                (se * se + sn * sn).sqrt()
            })
            .sum::<f64>()
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
/// geometry. Exercised on the real IGS precise-orbit (SP3) geometry as well as
/// synthetic constellations (`tests/igs_real_data.rs`).
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

// ---------------------------------------------------------------------------
// ARAIM integrity-risk budget.
//
// The solution-separation protection levels above are built from fixed `K_md`,
// `K_fa` multipliers — a sound but heuristic geometry bound. Advanced RAIM
// instead *allocates an integrity-risk budget* `P_HMI` across the fault
// hypotheses and solves for the smallest protection level whose total
// probability of hazardously-misleading information meets that budget. This is
// the integrity claim an ARAIM availability map actually rests on, and it lets
// a user trade integrity risk against the alert limit explicitly.
// ---------------------------------------------------------------------------

/// One fault hypothesis in the ARAIM integrity-risk budget, projected onto a
/// single position axis: its prior probability, the detector threshold a
/// just-undetectable bias can hide behind, and the estimate's standard
/// deviation under that hypothesis.
#[derive(Clone, Copy, Debug)]
pub struct AraimMode {
    /// Prior probability this hypothesis is the true state of the world over the
    /// exposure interval. The fault-free hypothesis carries `1 − Σ p_fault,k`.
    pub p_fault: f64,
    /// Detection threshold `T_k` (m) on the axis — `K_fa·σ_ss,k` for a fault
    /// mode (the largest bias that escapes the separation detector), `0` for the
    /// fault-free hypothesis.
    pub threshold_m: f64,
    /// Maximum nominal-range-bias projection `b_k` (m) onto the axis: the
    /// one-sided worst-case bias `Σ_i |s_i|·b_nom` (per the ISM's `b_nom`) that
    /// adds to the estimate without ever tripping the detector. `0` when the ISM
    /// declares no nominal bias (`b_nom = 0`) — the zero-bias MHSS bound.
    pub bias_m: f64,
    /// Standard deviation (m) of the position estimate on the axis under this
    /// hypothesis: the all-in-view `σ₀` for fault-free, the SV-`k`-excluded
    /// sub-solution `σ_k` for fault mode `k`.
    pub sigma_m: f64,
}

/// Upper-tail standard normal `Q(z) = 1 − Φ(z)`. Accurate to the f64 floor for
/// the `P_HMI ≳ 1e-12` budgets ARAIM uses (below that, `1 − Φ` cancellation
/// would start to bite — flagged honestly rather than papered over).
#[inline]
fn normal_q(z: f64) -> f64 {
    1.0 - normal_cdf(z)
}

/// The achieved one-sided integrity risk at protection level `pl_m`, summed over
/// every fault hypothesis (Blanch et al., *Baseline Advanced RAIM User
/// Algorithm*, the MHSS integrity equation):
///
/// ```text
/// P_HMI(PL) = Σ_k  p_fault,k · Q( (PL − b_k − T_k) / σ_k )
/// ```
///
/// Each term is the probability that, under hypothesis `k`, the position error
/// crosses `PL` while the nominal bias `b_k` plus a just-undetectable fault bias
/// (up to the detector threshold `T_k`) push the estimate. The fault-free
/// hypothesis (`T_0 = 0`) still carries its nominal bias `b_0` and contributes
/// `p_ff·Q((PL − b_0)/σ_0)`. With `b_k = 0` (ISM `b_nom = 0`) this reduces to the
/// zero-nominal-bias MHSS bound. This is the risk in a single direction of the
/// axis; allocate `P_HMI_axis / 2` to each side so the symmetric two-sided
/// position-error bound meets the axis budget.
pub fn araim_integrity_risk(pl_m: f64, modes: &[AraimMode]) -> f64 {
    modes
        .iter()
        .map(|m| {
            if m.sigma_m <= 0.0 {
                0.0
            } else {
                m.p_fault * normal_q((pl_m - m.bias_m - m.threshold_m) / m.sigma_m)
            }
        })
        .sum()
}

/// The minimum protection level whose achieved integrity risk
/// ([`araim_integrity_risk`]) does not exceed `budget_one_sided`, found by
/// bisection on the monotone-decreasing risk-vs-`PL` curve. Allocate
/// `P_HMI_axis / 2` as `budget_one_sided` (half the axis budget to each
/// direction of the symmetric bound). Returns `+∞` for an empty mode set or a
/// non-positive budget.
pub fn araim_protection_level(modes: &[AraimMode], budget_one_sided: f64) -> f64 {
    if modes.is_empty() || budget_one_sided <= 0.0 {
        return f64::INFINITY;
    }
    let max_sigma = modes.iter().map(|m| m.sigma_m).fold(0.0, f64::max);
    let max_bias_thresh = modes
        .iter()
        .map(|m| m.bias_m + m.threshold_m)
        .fold(0.0, f64::max);
    if max_sigma <= 0.0 {
        return 0.0;
    }
    // `PL = 0` has risk ≥ p_ff·Q(0) = p_ff/2 ≫ any useful budget, so it brackets
    // the low side; `(b + T)_max + 40·max_sigma` drives every Q below the f64
    // floor (`Q(40) ≈ 0`), bracketing the high side.
    let ceiling = max_bias_thresh + 40.0 * max_sigma;
    if araim_integrity_risk(0.0, modes) <= budget_one_sided {
        return 0.0;
    }
    let (mut lo, mut hi) = (0.0_f64, ceiling);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if araim_integrity_risk(mid, modes) > budget_one_sided {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Prior fault probabilities for the ARAIM budget. The single-constellation
/// baseline treats each satellite as one independent single-fault hypothesis.
#[derive(Clone, Copy, Debug)]
pub struct FaultPriors {
    /// Prior probability a given satellite carries an undetected fault over the
    /// exposure interval (RTCA ARAIM ISM baseline `P_sat ≈ 1e-5`).
    pub p_sat: f64,
    /// Maximum nominal range bias `b_nom` (m) the ISM declares, folded one-sided
    /// into every mode's protection level (`b_k = Σ_i |s_i|·b_nom`). `0` recovers
    /// the zero-nominal-bias MHSS bound.
    pub b_nom_m: f64,
}

/// The vertical/horizontal split of the total integrity-risk budget plus the
/// false-alert (continuity) allocation that sets the detection thresholds.
#[derive(Clone, Copy, Debug)]
pub struct IntegrityBudget {
    /// Integrity risk allocated to the vertical position error.
    pub p_hmi_vert: f64,
    /// Integrity risk allocated to the horizontal position error.
    pub p_hmi_horz: f64,
    /// Total continuity / false-alert budget. The per-mode detector multiplier
    /// is `K_fa = Φ⁻¹(1 − P_fa / (2 N))` (a Bonferroni split across the `N`
    /// single-fault hypotheses).
    pub p_fa: f64,
}

/// ARAIM protection levels derived from an explicit integrity-risk budget,
/// together with the integrity risk those levels actually achieve.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct AraimResult {
    /// Satellites in the all-in-view solution.
    pub n_used: usize,
    /// Horizontal protection level (m) meeting `P_HMI_horz`.
    pub hpl_m: f64,
    /// Vertical protection level (m) meeting `P_HMI_vert`.
    pub vpl_m: f64,
    /// Integrity risk the vertical PL achieves (≤ the allocated `P_HMI_vert`).
    pub p_hmi_vert: f64,
    /// Integrity risk the horizontal PL achieves (≤ the allocated `P_HMI_horz`).
    pub p_hmi_horz: f64,
    /// `true` when a single-SV sub-solution separates beyond its threshold.
    pub fault_detected: bool,
    /// The maximum-likelihood faulted satellite, when a fault is detected.
    pub excluded_sv: Option<usize>,
}

/// Advanced RAIM (single-fault MHSS) protection levels from an integrity-risk
/// budget. For the all-in-view solution and every single-satellite exclusion
/// sub-solution this builds the per-mode `(p_fault, threshold, σ)` on the
/// vertical and horizontal axes, then solves the smallest VPL/HPL whose summed
/// `P_HMI` ([`araim_integrity_risk`]) meets the allocated budget. Detection
/// reuses the solution-separation statistic with the same `K_fa` the thresholds
/// are built from.
///
/// Unlike [`solution_separation_raim`] — whose fixed `K_md` multiplier fixes the
/// integrity risk *implicitly* at the geometry's mercy — the protection level
/// here is the explicit answer to "how large must the bound be so the residual
/// risk of hazardously-misleading information stays within `P_HMI`?".
///
/// Returns `None` for fewer than six satellites (each exclusion sub-solution
/// then lacks the `n−1 ≥ 5` redundancy) or a singular geometry. The
/// single-fault hypothesis set is the ARAIM baseline; the constellation-wide
/// fault mode is implemented in [`araim_dual_raim`], and simultaneous multi-SV
/// subset faults remain a documented extension (each adds further hypotheses to
/// the same budget sum). Exercised on the real IGS precise-orbit (SP3) geometry
/// (`tests/igs_real_data.rs`), not only synthetic constellations.
pub fn araim_raim(
    user: Vec3,
    sats: &[Vec3],
    range_residual_m: &[f64],
    sigma_m: f64,
    priors: FaultPriors,
    budget: IntegrityBudget,
) -> Option<AraimResult> {
    let n = sats.len();
    if n != range_residual_m.len() || n < 6 || sigma_m <= 0.0 {
        return None;
    }
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(n);
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let (east, north, up) = enu_basis(user)?;

    let (x0, a0) = lsq_solution(&g, range_residual_m)?;
    let var0_v = axis_variance(&a0, up);
    let var0_h = axis_variance(&a0, east) + axis_variance(&a0, north);

    // Per-mode detector multiplier: Bonferroni-split the false-alert budget over
    // the n single-fault hypotheses, two-sided.
    let k_fa = normal_quantile(1.0 - budget.p_fa / (2.0 * n as f64));
    let p_ff = (1.0 - n as f64 * priors.p_sat).max(0.0);

    // Fault-free hypothesis (T = 0) opens each axis's mode list — it still carries
    // the nominal bias projection b_0 over the full geometry.
    let mut modes_v = vec![AraimMode {
        p_fault: p_ff,
        threshold_m: 0.0,
        bias_m: axis_bias_sum(&a0, &g, up, priors.b_nom_m),
        sigma_m: sigma_m * var0_v.sqrt(),
    }];
    let mut modes_h = vec![AraimMode {
        p_fault: p_ff,
        threshold_m: 0.0,
        bias_m: horiz_bias_sum(&a0, &g, east, north, priors.b_nom_m),
        sigma_m: sigma_m * var0_h.sqrt(),
    }];

    let mut fault_detected = false;
    let mut excluded_sv = None;
    let mut max_norm_sep = 0.0_f64;

    for k in 0..n {
        let g_sub: Vec<[f64; 4]> = (0..n).filter(|&i| i != k).map(|i| g[i]).collect();
        let y_sub: Vec<f64> = (0..n)
            .filter(|&i| i != k)
            .map(|i| range_residual_m[i])
            .collect();
        let (xk, ak) = match lsq_solution(&g_sub, &y_sub) {
            Some(v) => v,
            None => continue,
        };
        let dx = [xk[0] - x0[0], xk[1] - x0[1], xk[2] - x0[2]];
        let sep_v = dx[0] * up[0] + dx[1] * up[1] + dx[2] * up[2];
        let sep_e = dx[0] * east[0] + dx[1] * east[1] + dx[2] * east[2];
        let sep_n = dx[0] * north[0] + dx[1] * north[1] + dx[2] * north[2];
        let sep_h = (sep_e * sep_e + sep_n * sep_n).sqrt();

        let vark_v = axis_variance(&ak, up);
        let vark_h = axis_variance(&ak, east) + axis_variance(&ak, north);
        let sig_ss_v = sigma_m * (vark_v - var0_v).max(0.0).sqrt();
        let sig_ss_h = sigma_m * (vark_h - var0_h).max(0.0).sqrt();

        // Detection: normalised separation against the same K_fa.
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

        // Integrity-budget contribution of fault mode k: a bias up to T_k =
        // K_fa·σ_ss escapes detection, leaving the σ_k sub-solution noise, plus the
        // nominal bias projection b_k over the SV-k-excluded geometry.
        modes_v.push(AraimMode {
            p_fault: priors.p_sat,
            threshold_m: k_fa * sig_ss_v,
            bias_m: axis_bias_sum(&ak, &g_sub, up, priors.b_nom_m),
            sigma_m: sigma_m * vark_v.sqrt(),
        });
        modes_h.push(AraimMode {
            p_fault: priors.p_sat,
            threshold_m: k_fa * sig_ss_h,
            bias_m: horiz_bias_sum(&ak, &g_sub, east, north, priors.b_nom_m),
            sigma_m: sigma_m * vark_h.sqrt(),
        });
    }

    let vpl = araim_protection_level(&modes_v, budget.p_hmi_vert / 2.0);
    let hpl = araim_protection_level(&modes_h, budget.p_hmi_horz / 2.0);

    Some(AraimResult {
        n_used: n,
        hpl_m: hpl,
        vpl_m: vpl,
        p_hmi_vert: 2.0 * araim_integrity_risk(vpl, &modes_v),
        p_hmi_horz: 2.0 * araim_integrity_risk(hpl, &modes_h),
        fault_detected,
        excluded_sv,
    })
}

/// Prior fault probabilities for dual-/multi-constellation ARAIM: the per-satellite
/// fault of the single-constellation baseline plus a per-constellation fault that
/// removes an entire constellation at once (EU ARAIM Technical Revision / DO-316).
#[derive(Clone, Copy, Debug)]
pub struct DualFaultPriors {
    /// Prior probability a given satellite carries an undetected fault over the
    /// exposure interval (RTCA ARAIM ISM baseline `P_sat ≈ 1e-5`).
    pub p_sat: f64,
    /// Prior probability a given constellation suffers a wide fault over the
    /// exposure interval (`P_const ≈ 1e-4`). `0` disables the constellation
    /// hypotheses, recovering the single-fault [`araim_raim`] result exactly.
    pub p_const: f64,
    /// Maximum nominal range bias `b_nom` (m) the ISM declares, folded one-sided
    /// into every mode's protection level (`b_k = Σ_i |s_i|·b_nom`). `0` recovers
    /// the zero-nominal-bias MHSS bound.
    pub b_nom_m: f64,
}

/// An Integrity Support Message (ISM): the per-constellation integrity parameters
/// an ARAIM user applies, per EU ARAIM Technical Revision 3.0 / DO-316 MASPS. The
/// ISM is broadcast (or ground-assembled) and is the single place the user-range
/// error model and the fault priors enter the protection-level computation.
///
/// The two range-error bounds are deliberately distinct: `sigma_ura_m` (the URA /
/// SISA) bounds the error for **integrity** and `sigma_ure_m` (the URE / SISE) the
/// smaller, root-mean-square value used for **accuracy and continuity**;
/// `b_nom_m` is the maximum nominal bias added (one-sided) into the integrity
/// bound. See [`gps_galileo_reference`](IntegritySupportMessage::gps_galileo_reference)
/// for the WG-C reference values and `docs/ARAIM_REFERENCE.md` for the derivation.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct IntegritySupportMessage {
    /// User range *accuracy* (RMS) used for accuracy and continuity (m).
    pub sigma_ure_m: f64,
    /// User range *integrity* bound (URA / SISA) used for the protection level (m).
    /// Must be ≥ `sigma_ure_m`.
    pub sigma_ura_m: f64,
    /// Maximum nominal range bias folded one-sided into the integrity bound (m).
    pub b_nom_m: f64,
    /// Prior probability of an undetected single-satellite fault (per exposure).
    pub p_sat: f64,
    /// Prior probability of a constellation-wide fault (per exposure).
    pub p_const: f64,
}

impl IntegritySupportMessage {
    /// The WG-C GPS+Galileo ARAIM reference parameter set: σ_URA = 0.75 m (the
    /// reference integrity bound), σ_URE = 0.67 m (accuracy RMS), max nominal
    /// integrity bias `b_nom` = 0.75 m, `P_sat` = 1e-5 and `P_const` = 1e-4 over the
    /// exposure interval. These are the published reference values used to size
    /// ARAIM availability; the operational ISM is configurable per constellation.
    pub fn gps_galileo_reference() -> Self {
        Self {
            sigma_ure_m: 0.67,
            sigma_ura_m: 0.75,
            b_nom_m: 0.75,
            p_sat: 1e-5,
            p_const: 1e-4,
        }
    }

    /// The single-fault priors this ISM implies, for [`araim_raim`].
    pub fn fault_priors(&self) -> FaultPriors {
        FaultPriors {
            p_sat: self.p_sat,
            b_nom_m: self.b_nom_m,
        }
    }

    /// The dual-fault (single-SV + constellation-wide) priors this ISM implies,
    /// for [`araim_dual_raim`].
    pub fn dual_fault_priors(&self) -> DualFaultPriors {
        DualFaultPriors {
            p_sat: self.p_sat,
            p_const: self.p_const,
            b_nom_m: self.b_nom_m,
        }
    }
}

/// Build the integrity-budget modes (vertical, horizontal) and the normalised
/// separation for the sub-solution that *keeps* the satellites for which
/// `keep(i)` holds. Returns `None` when the kept set is too small or rank-deficient.
/// Shared by the single-satellite and constellation-wide ARAIM fault hypotheses.
#[allow(clippy::too_many_arguments)]
fn araim_exclusion_mode(
    g: &[[f64; 4]],
    y: &[f64],
    keep: impl Fn(usize) -> bool,
    x0: &[f64; 4],
    east: Vec3,
    north: Vec3,
    up: Vec3,
    var0_v: f64,
    var0_h: f64,
    sigma_m: f64,
    k_fa: f64,
    p_fault: f64,
    b_nom: f64,
    min_keep: usize,
) -> Option<(AraimMode, AraimMode, f64)> {
    let idx: Vec<usize> = (0..g.len()).filter(|&i| keep(i)).collect();
    if idx.len() < min_keep {
        return None;
    }
    let g_sub: Vec<[f64; 4]> = idx.iter().map(|&i| g[i]).collect();
    let y_sub: Vec<f64> = idx.iter().map(|&i| y[i]).collect();
    let (xk, ak) = lsq_solution(&g_sub, &y_sub)?;
    let dx = [xk[0] - x0[0], xk[1] - x0[1], xk[2] - x0[2]];
    let sep_v = dx[0] * up[0] + dx[1] * up[1] + dx[2] * up[2];
    let sep_e = dx[0] * east[0] + dx[1] * east[1] + dx[2] * east[2];
    let sep_n = dx[0] * north[0] + dx[1] * north[1] + dx[2] * north[2];
    let sep_h = (sep_e * sep_e + sep_n * sep_n).sqrt();
    let vark_v = axis_variance(&ak, up);
    let vark_h = axis_variance(&ak, east) + axis_variance(&ak, north);
    let sig_ss_v = sigma_m * (vark_v - var0_v).max(0.0).sqrt();
    let sig_ss_h = sigma_m * (vark_h - var0_h).max(0.0).sqrt();
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
    let mode_v = AraimMode {
        p_fault,
        threshold_m: k_fa * sig_ss_v,
        bias_m: axis_bias_sum(&ak, &g_sub, up, b_nom),
        sigma_m: sigma_m * vark_v.sqrt(),
    };
    let mode_h = AraimMode {
        p_fault,
        threshold_m: k_fa * sig_ss_h,
        bias_m: horiz_bias_sum(&ak, &g_sub, east, north, b_nom),
        sigma_m: sigma_m * vark_h.sqrt(),
    };
    Some((mode_v, mode_h, nrm_v.max(nrm_h)))
}

/// Dual-/multi-constellation Advanced RAIM protection levels (EU ARAIM / DO-316).
///
/// Extends [`araim_raim`] with the **constellation-wide fault mode**: in addition to
/// the fault-free and per-satellite hypotheses, each constellation (labelled by
/// `constellation[i]`) contributes one hypothesis that removes *all* of its
/// satellites at once, with prior `P_const`. Every hypothesis adds a term to the
/// same MHSS integrity sum, so VPL/HPL are the smallest bounds whose total `P_HMI`
/// meets the budget across fault-free + single-SV + per-constellation faults.
///
/// The Bonferroni false-alert split is taken over all `N + C` hypotheses. With
/// `P_const = 0` the constellation hypotheses are dropped and the result is bit-for-bit
/// [`araim_raim`]. Returns `None` for fewer than six satellites, a singular geometry,
/// or — crucially — when removing some constellation leaves fewer than five satellites:
/// a single-constellation user *cannot* be protected against its own constellation
/// fault, which is exactly why dual-constellation coverage matters.
pub fn araim_dual_raim(
    user: Vec3,
    sats: &[Vec3],
    constellation: &[u8],
    range_residual_m: &[f64],
    sigma_m: f64,
    priors: DualFaultPriors,
    budget: IntegrityBudget,
) -> Option<AraimResult> {
    let n = sats.len();
    if n != range_residual_m.len() || n != constellation.len() || n < 6 || sigma_m <= 0.0 {
        return None;
    }
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(n);
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let (east, north, up) = enu_basis(user)?;
    let (x0, a0) = lsq_solution(&g, range_residual_m)?;
    let var0_v = axis_variance(&a0, up);
    let var0_h = axis_variance(&a0, east) + axis_variance(&a0, north);

    let mut consts: Vec<u8> = constellation.to_vec();
    consts.sort_unstable();
    consts.dedup();
    let cover_const = priors.p_const > 0.0;
    let n_const = consts.len();
    // Bonferroni false-alert split over every fault hypothesis exercised.
    let n_modes = n + if cover_const { n_const } else { 0 };
    let k_fa = normal_quantile(1.0 - budget.p_fa / (2.0 * n_modes as f64));
    let p_const_total = if cover_const {
        n_const as f64 * priors.p_const
    } else {
        0.0
    };
    let p_ff = (1.0 - n as f64 * priors.p_sat - p_const_total).max(0.0);

    let mut modes_v = vec![AraimMode {
        p_fault: p_ff,
        threshold_m: 0.0,
        bias_m: axis_bias_sum(&a0, &g, up, priors.b_nom_m),
        sigma_m: sigma_m * var0_v.sqrt(),
    }];
    let mut modes_h = vec![AraimMode {
        p_fault: p_ff,
        threshold_m: 0.0,
        bias_m: horiz_bias_sum(&a0, &g, east, north, priors.b_nom_m),
        sigma_m: sigma_m * var0_h.sqrt(),
    }];
    let mut fault_detected = false;
    let mut excluded_sv = None;
    let mut max_norm_sep = 0.0_f64;

    // Single-satellite fault hypotheses (need n−1 ≥ 5 redundancy).
    for k in 0..n {
        if let Some((mv, mh, nrm)) = araim_exclusion_mode(
            &g,
            range_residual_m,
            |i| i != k,
            &x0,
            east,
            north,
            up,
            var0_v,
            var0_h,
            sigma_m,
            k_fa,
            priors.p_sat,
            priors.b_nom_m,
            5,
        ) {
            modes_v.push(mv);
            modes_h.push(mh);
            if nrm > max_norm_sep {
                max_norm_sep = nrm;
                if nrm > k_fa {
                    fault_detected = true;
                    excluded_sv = Some(k);
                }
            }
        }
    }

    // Constellation-wide fault hypotheses (exclude every SV of one constellation).
    if cover_const {
        for &c in &consts {
            match araim_exclusion_mode(
                &g,
                range_residual_m,
                |i| constellation[i] != c,
                &x0,
                east,
                north,
                up,
                var0_v,
                var0_h,
                sigma_m,
                k_fa,
                priors.p_const,
                priors.b_nom_m,
                5,
            ) {
                Some((mv, mh, nrm)) => {
                    modes_v.push(mv);
                    modes_h.push(mh);
                    if nrm > max_norm_sep {
                        max_norm_sep = nrm;
                        if nrm > k_fa {
                            fault_detected = true;
                        }
                    }
                }
                // A constellation fault that cannot be excluded (too few remaining
                // satellites) leaves the hypothesis unbounded — not available.
                None => return None,
            }
        }
    }

    let vpl = araim_protection_level(&modes_v, budget.p_hmi_vert / 2.0);
    let hpl = araim_protection_level(&modes_h, budget.p_hmi_horz / 2.0);

    Some(AraimResult {
        n_used: n,
        hpl_m: hpl,
        vpl_m: vpl,
        p_hmi_vert: 2.0 * araim_integrity_risk(vpl, &modes_v),
        p_hmi_horz: 2.0 * araim_integrity_risk(hpl, &modes_h),
        fault_detected,
        excluded_sv,
    })
}

/// One region of the Stanford(-ESA) integrity diagram, the standard way to
/// summarise an integrity monitor over many epochs. The diagram plots, per
/// epoch, the *actual* position error (x) against the *protection level* (y); the
/// diagonal `y = x` and the alert limit `AL` divide the plane into the regions
/// below. A monitor is sound when no epoch lands in [`MisleadingInformation`] or
/// [`HazardouslyMisleadingInformation`].
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum StanfordRegion {
    /// `PL ≥ error` and `PL ≤ AL`: the protection level bounds the error and is
    /// within the alert limit — nominal, available, and safe.
    Available,
    /// `PL ≥ error` but `PL > AL`: the protection level still bounds the error,
    /// but exceeds the alert limit, so the system declares itself unavailable.
    /// Conservative — safe, just not usable.
    SystemUnavailable,
    /// `PL < error ≤ AL`: the protection level failed to bound the error, but the
    /// error is still within the alert limit. Misleading information (MI) — an
    /// integrity event that did not become hazardous.
    MisleadingInformation,
    /// `PL < error` and `error > AL`: the error exceeds both the protection level
    /// and the alert limit. Hazardously misleading information (HMI) — the unsafe
    /// failure an integrity monitor exists to make improbable.
    HazardouslyMisleadingInformation,
}

/// Classify one epoch into its [`StanfordRegion`] from the actual position error,
/// the protection level, and the alert limit (all metres, same axis —
/// horizontal or vertical). The boundary `error == PL` counts as bounded (safe).
pub fn classify_stanford(error_m: f64, pl_m: f64, alert_limit_m: f64) -> StanfordRegion {
    if pl_m >= error_m {
        if pl_m <= alert_limit_m {
            StanfordRegion::Available
        } else {
            StanfordRegion::SystemUnavailable
        }
    } else if error_m <= alert_limit_m {
        StanfordRegion::MisleadingInformation
    } else {
        StanfordRegion::HazardouslyMisleadingInformation
    }
}

/// One plotted epoch of a Stanford diagram.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct StanfordPoint {
    /// Actual position error (m) — the diagram's x-axis.
    pub error_m: f64,
    /// Protection level (m) — the diagram's y-axis.
    pub pl_m: f64,
    /// The region this epoch falls in.
    pub region: StanfordRegion,
}

/// A Stanford-diagram accumulator: feed it `(error, PL)` per epoch against a fixed
/// alert limit and it classifies and stores each point, ready for plotting or
/// JSON export, and exposes the region counts an integrity claim is summarised by.
#[derive(Clone, Debug, Serialize)]
pub struct StanfordDiagram {
    /// The alert limit (m) dividing safe from hazardous.
    pub alert_limit_m: f64,
    points: Vec<StanfordPoint>,
}

impl StanfordDiagram {
    /// A new, empty diagram for the given alert limit (m).
    pub fn new(alert_limit_m: f64) -> Self {
        Self {
            alert_limit_m,
            points: Vec::new(),
        }
    }

    /// Classify and record one epoch's `(error, PL)`; returns its region.
    pub fn add(&mut self, error_m: f64, pl_m: f64) -> StanfordRegion {
        let region = classify_stanford(error_m, pl_m, self.alert_limit_m);
        self.points.push(StanfordPoint {
            error_m,
            pl_m,
            region,
        });
        region
    }

    /// All recorded points.
    pub fn points(&self) -> &[StanfordPoint] {
        &self.points
    }

    /// Number of recorded epochs.
    pub fn len(&self) -> usize {
        self.points.len()
    }

    /// Whether no epochs have been recorded.
    pub fn is_empty(&self) -> bool {
        self.points.is_empty()
    }

    /// How many recorded epochs fall in `region`.
    pub fn count(&self, region: StanfordRegion) -> usize {
        self.points.iter().filter(|p| p.region == region).count()
    }

    /// Fraction of epochs that were available (nominal, safe, usable).
    pub fn availability(&self) -> f64 {
        if self.points.is_empty() {
            return 0.0;
        }
        self.count(StanfordRegion::Available) as f64 / self.points.len() as f64
    }

    /// Number of integrity events — epochs where the protection level failed to
    /// bound the error (`MisleadingInformation` + `HazardouslyMisleadingInformation`).
    pub fn integrity_events(&self) -> usize {
        self.count(StanfordRegion::MisleadingInformation)
            + self.count(StanfordRegion::HazardouslyMisleadingInformation)
    }
}

/// Render a [`StanfordDiagram`] as a self-contained SVG scatter: actual position
/// error (x) against protection level (y), with the `PL = error` integrity
/// boundary and the alert-limit guides drawn and one colour-coded marker per
/// epoch (green available, blue system-unavailable, amber misleading, red
/// hazardously-misleading). The classic GNSS integrity plot.
pub fn stanford_svg(diagram: &StanfordDiagram) -> String {
    let (w, h) = (460.0_f64, 460.0_f64);
    let (ml, mr, mt, mb) = (60.0_f64, 20.0_f64, 36.0_f64, 56.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let al = diagram.alert_limit_m;
    // Axis maximum: a little beyond the largest plotted value and the alert limit.
    let mut vmax = al * 1.6;
    for p in diagram.points() {
        vmax = vmax.max(p.error_m).max(p.pl_m);
    }
    vmax = (vmax * 1.05).max(1.0);
    let xof = |e: f64| ml + (e.min(vmax) / vmax) * pw;
    let yof = |v: f64| mt + ph - (v.min(vmax) / vmax) * ph;
    let color = |r: StanfordRegion| match r {
        StanfordRegion::Available => "#46b67e",
        StanfordRegion::SystemUnavailable => "#6e7a8a",
        StanfordRegion::MisleadingInformation => "#d2925e",
        StanfordRegion::HazardouslyMisleadingInformation => "#e5645a",
    };
    let axis_y = mt + ph;

    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"11\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"20\" font-size=\"14\" font-weight=\"bold\">Stanford diagram — integrity ({} epochs, AL = {al:.0} m)</text>",
        diagram.len()
    ));
    // Integrity boundary PL = error: above it the protection level bounds the error.
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#62594b\" stroke-dasharray=\"4 3\"/>",
        xof(0.0),
        yof(0.0),
        xof(vmax),
        yof(vmax)
    ));
    // Alert-limit guides (vertical = error AL, horizontal = PL AL).
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"2 2\"/>",
        xof(al),
        yof(0.0),
        xof(al),
        yof(vmax)
    ));
    svg.push_str(&format!(
        "<line x1=\"{:.1}\" y1=\"{:.1}\" x2=\"{:.1}\" y2=\"{:.1}\" stroke=\"#e5645a\" stroke-dasharray=\"2 2\"/>",
        xof(0.0),
        yof(al),
        xof(vmax),
        yof(al)
    ));
    // Axes.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">position error (m)</text>",
        ml + pw / 2.0,
        h - 16.0
    ));
    let lbl_y = mt + ph / 2.0;
    svg.push_str(&format!(
        "<text x=\"16\" y=\"{lbl_y:.0}\" transform=\"rotate(-90 16 {lbl_y:.0})\" text-anchor=\"middle\">protection level (m)</text>"
    ));
    // Points.
    for p in diagram.points() {
        svg.push_str(&format!(
            "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"3\" fill=\"{}\" fill-opacity=\"0.85\"/>",
            xof(p.error_m),
            yof(p.pl_m),
            color(p.region)
        ));
    }
    svg.push_str("</svg>");
    svg
}

/// Configuration for a RAIM availability evaluation: the user-equivalent range
/// error and the fault-detection / missed-detection probabilities the protection
/// levels are sized for, with the horizontal/vertical alert limits availability
/// is judged against.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct RaimConfig {
    /// 1-σ user-equivalent range error (m).
    pub sigma_m: f64,
    /// Allowed false-alarm probability.
    pub p_fa: f64,
    /// Allowed missed-detection probability.
    pub p_md: f64,
    /// Horizontal alert limit (m) — e.g. 40 m for APV-I.
    pub al_h_m: f64,
    /// Vertical alert limit (m) — e.g. 50 m for APV-I.
    pub al_v_m: f64,
}

/// RAIM at one epoch.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct RaimAvailabilityEpoch {
    /// Epoch time (s).
    pub t_s: f64,
    /// Number of satellites above the mask.
    pub n_visible: usize,
    /// Horizontal protection level (m); `None` when redundancy is insufficient.
    pub hpl_m: Option<f64>,
    /// Vertical protection level (m); `None` when redundancy is insufficient.
    pub vpl_m: Option<f64>,
    /// `true` when a fix is possible and `HPL ≤ AL_H` and `VPL ≤ AL_V`.
    pub available: bool,
}

/// A RAIM availability map over a time grid: the per-epoch protection levels and
/// the fraction of epochs at which the geometry meets the alert limits.
#[derive(Clone, Debug, Serialize)]
pub struct RaimAvailabilityReport {
    /// Horizontal alert limit used (m).
    pub al_h_m: f64,
    /// Vertical alert limit used (m).
    pub al_v_m: f64,
    /// Total epochs sampled.
    pub samples_total: usize,
    /// Epochs that were RAIM-available.
    pub samples_available: usize,
    /// Per-epoch detail.
    pub epochs: Vec<RaimAvailabilityEpoch>,
    /// Vertical-axis Stanford(-ESA) integrity diagram accumulated from a seeded
    /// no-fault measurement-error realization: at each protected epoch the actual
    /// vertical position error (from a Gaussian range-error draw mapped through
    /// the geometry) is classified against the vertical protection level and the
    /// vertical alert limit. Empty when no epoch had a protected fix.
    pub stanford: StanfordDiagram,
}

impl RaimAvailabilityReport {
    /// Fraction of sampled epochs that were RAIM-available (0 if none sampled).
    pub fn availability(&self) -> f64 {
        if self.samples_total == 0 {
            0.0
        } else {
            self.samples_available as f64 / self.samples_total as f64
        }
    }
}

/// Geometry-only RAIM at one epoch: the no-fault protection levels (snapshot RAIM
/// with zero residuals, so the levels depend only on geometry and `sigma`) and
/// whether they meet the alert limits. Fewer than five satellites ⇒ no protected
/// fix, so `available = false` and the levels are `None`.
pub fn raim_availability_epoch(
    t_s: f64,
    user_ecef: Vec3,
    sats_ecef: &[Vec3],
    cfg: &RaimConfig,
) -> RaimAvailabilityEpoch {
    let n_visible = sats_ecef.len();
    let zero = vec![0.0; n_visible];
    match snapshot_raim(user_ecef, sats_ecef, &zero, cfg.sigma_m, cfg.p_fa, cfg.p_md) {
        Some(r) => {
            let available = r.hpl_m <= cfg.al_h_m && r.vpl_m <= cfg.al_v_m;
            RaimAvailabilityEpoch {
                t_s,
                n_visible,
                hpl_m: Some(r.hpl_m),
                vpl_m: Some(r.vpl_m),
                available,
            }
        }
        None => RaimAvailabilityEpoch {
            t_s,
            n_visible,
            hpl_m: None,
            vpl_m: None,
            available: false,
        },
    }
}

/// Run a RAIM availability evaluation over a constellation: at each epoch on the
/// `[0, duration]` grid, propagate the visible satellites, compute the protection
/// levels, and judge availability against the alert limits. This is the runnable
/// end-to-end integrity entry point — geometry in, an HPL/VPL availability map
/// out — over the same SGP4/Keplerian propagators the engine already uses.
///
/// Alongside the geometry availability map it accumulates a vertical Stanford
/// diagram from a single seeded no-fault measurement-error realization: at each
/// protected epoch a Gaussian range-error draw is mapped through the geometry to
/// an actual vertical position error and classified against the vertical
/// protection level and alert limit. The draw is fully deterministic in `seed`.
pub fn constellation_raim_availability(
    user: &Orbit,
    gnss: &[Propagator],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    cfg: &RaimConfig,
    seed: u64,
) -> RaimAvailabilityReport {
    let n = (duration_s / step_s).round() as usize;
    let mut epochs = Vec::with_capacity(n + 1);
    let mut available = 0usize;
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    // Clamp to a strictly-positive, finite std-dev so a mis-configured or fuzzed
    // sigma (0, negative, NaN) cannot make `Normal::new` error and panic here.
    let sd = if cfg.sigma_m.is_finite() && cfg.sigma_m > 0.0 {
        cfg.sigma_m
    } else {
        1e-12
    };
    let noise = Normal::new(0.0, sd).expect("finite positive sigma");
    let mut stanford = StanfordDiagram::new(cfg.al_v_m);
    for i in 0..=n {
        let t = i as f64 * step_s;
        let user_ecef = user.position_eci(t);
        let sats = visible_positions(user, gnss, t, mask_deg);
        let e = raim_availability_epoch(t, user_ecef, &sats, cfg);
        if e.available {
            available += 1;
        }
        // A protected fix (VPL present) gets one Stanford point: draw clean
        // measurement noise, map it to the actual vertical error, classify it
        // against the protection level. Draw every epoch so the realization is
        // stable in `seed` regardless of which epochs are protected.
        let residuals: Vec<f64> = (0..sats.len()).map(|_| noise.sample(&mut rng)).collect();
        if let Some(vpl) = e.vpl_m {
            if let Some(verr) = vertical_position_error(user_ecef, &sats, &residuals) {
                stanford.add(verr.abs(), vpl);
            }
        }
        epochs.push(e);
    }
    RaimAvailabilityReport {
        al_h_m: cfg.al_h_m,
        al_v_m: cfg.al_v_m,
        samples_total: epochs.len(),
        samples_available: available,
        epochs,
        stanford,
    }
}

/// Dual-/multi-constellation **ARAIM** availability over a constellation set whose
/// satellites carry `labels` (one constellation id per `gnss` entry). At each epoch
/// it finds the visible satellites and their labels and runs the constellation-wide
/// fault-mode engine [`araim_dual_raim`], judging availability against the alert
/// limits. The single-constellation [`constellation_raim_availability`] uses
/// solution-separation RAIM; this is the advanced ARAIM (single-SV **and**
/// constellation-wide faults) path, the one a GPS+Galileo user actually flies.
#[allow(clippy::too_many_arguments)]
pub fn araim_dual_constellation_availability(
    user: &Orbit,
    gnss: &[Propagator],
    labels: &[u8],
    step_s: f64,
    duration_s: f64,
    mask_deg: f64,
    sigma_m: f64,
    priors: DualFaultPriors,
    budget: IntegrityBudget,
    al_h_m: f64,
    al_v_m: f64,
) -> RaimAvailabilityReport {
    let n = (duration_s / step_s).round() as usize;
    let mut epochs = Vec::with_capacity(n + 1);
    let mut available = 0usize;
    for i in 0..=n {
        let t = i as f64 * step_s;
        let user_ecef = user.position_eci(t);
        let (sats, vis_labels) = visible_positions_labeled(user, gnss, labels, t, mask_deg);
        let resid = vec![0.0; sats.len()];
        let e = match araim_dual_raim(
            user_ecef,
            &sats,
            &vis_labels,
            &resid,
            sigma_m,
            priors,
            budget,
        ) {
            Some(r) => RaimAvailabilityEpoch {
                t_s: t,
                n_visible: sats.len(),
                hpl_m: Some(r.hpl_m),
                vpl_m: Some(r.vpl_m),
                available: r.hpl_m <= al_h_m && r.vpl_m <= al_v_m,
            },
            None => RaimAvailabilityEpoch {
                t_s: t,
                n_visible: sats.len(),
                hpl_m: None,
                vpl_m: None,
                available: false,
            },
        };
        if e.available {
            available += 1;
        }
        epochs.push(e);
    }
    RaimAvailabilityReport {
        al_h_m,
        al_v_m,
        samples_total: epochs.len(),
        samples_available: available,
        epochs,
        stanford: StanfordDiagram::new(al_v_m),
    }
}

/// The vertical (geocentric-up) component of the least-squares position error
/// produced by the per-satellite range residuals `residuals` at geometry
/// `(user, sats)`. `None` for a singular geometry or a missing line of sight.
fn vertical_position_error(user: Vec3, sats: &[Vec3], residuals: &[f64]) -> Option<f64> {
    if sats.len() != residuals.len() {
        return None;
    }
    let mut g: Vec<[f64; 4]> = Vec::with_capacity(sats.len());
    for &s in sats {
        let e = los_unit(user, s)?;
        g.push([-e[0], -e[1], -e[2], 1.0]);
    }
    let (_east, _north, up) = enu_basis(user)?;
    let (x, _a) = lsq_solution(&g, residuals)?;
    Some(x[0] * up[0] + x[1] * up[1] + x[2] * up[2])
}

/// A RAIM-availability scenario: a user orbit, one or more GNSS constellations,
/// an elevation mask, and the integrity configuration. This is the TOML-driven,
/// user-runnable form of [`constellation_raim_availability`] — the same shape as
/// the orbit-clock scenario, but the output is an HPL/VPL availability map rather
/// than a clock-holdover run.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct IntegrityScenario {
    /// Elevation mask (deg) below which satellites are not used.
    pub mask_deg: f64,
    /// 1-σ user-equivalent range error (m) — the accuracy RMS (σ_URE).
    pub sigma_uere_m: f64,
    /// Optional integrity bound σ_URA (m) for the ARAIM protection level
    /// (clamped to ≥ `sigma_uere_m`). When `0`/unset it defaults to `sigma_uere_m`
    /// (its floor), so the protection level is always sized with the integrity
    /// bound, never the smaller accuracy RMS. Only used on the `araim_dual` path.
    #[serde(default)]
    pub sigma_ura_m: f64,
    /// Optional maximum nominal range bias b_nom (m) the ISM declares, folded
    /// one-sided into the ARAIM protection level (`b_k = Σ_i |s_i|·b_nom`).
    /// `0`/unset = the zero-nominal-bias MHSS bound. Only used on the `araim_dual`
    /// path.
    #[serde(default)]
    pub b_nom_m: f64,
    /// Allowed false-alarm probability.
    pub p_fa: f64,
    /// Allowed missed-detection probability.
    pub p_md: f64,
    /// Horizontal alert limit (m).
    pub al_h_m: f64,
    /// Vertical alert limit (m).
    pub al_v_m: f64,
    /// Time grid.
    pub time: TimeCfg,
    /// User orbit / location.
    pub user: OrbitCfg,
    /// Primary GNSS constellation.
    pub constellation: ConstellationCfg,
    /// Additional constellations combined with `constellation` (multi-GNSS).
    #[serde(default)]
    pub constellations: Vec<ConstellationCfg>,
    /// Seed for the no-fault measurement-error realization that fills the vertical
    /// Stanford diagram. The availability map itself is geometry-only and seed
    /// independent; only the Stanford error draw depends on this.
    #[serde(default)]
    pub seed: u64,
    /// When `true`, evaluate availability with advanced dual-/multi-constellation
    /// **ARAIM** (single-SV *and* constellation-wide faults, `araim_dual_raim`)
    /// instead of the default solution-separation RAIM. The primary constellation is
    /// fault group 0 and each entry of `constellations` the next group.
    #[serde(default)]
    pub araim_dual: bool,
    /// Per-axis integrity-risk budget `P_HMI` for the ARAIM path (default 1e-7/hr).
    #[serde(default = "default_p_hmi")]
    pub p_hmi: f64,
}

/// Default per-axis integrity-risk budget for the ARAIM path.
fn default_p_hmi() -> f64 {
    1e-7
}

impl IntegrityScenario {
    /// All satellites: the primary constellation plus any additional ones.
    pub fn all_satellites(&self) -> Result<Vec<Propagator>, String> {
        let mut sats = self.constellation.satellites()?;
        for c in &self.constellations {
            sats.extend(c.satellites()?);
        }
        Ok(sats)
    }

    /// All satellites with their constellation fault-group labels (primary = 0,
    /// each additional constellation the next id) — the ARAIM dual-fault input.
    pub fn all_satellites_labeled(&self) -> Result<(Vec<Propagator>, Vec<u8>), String> {
        let primary = self.constellation.satellites()?;
        let mut labels: Vec<u8> = vec![0u8; primary.len()];
        let mut sats = primary;
        for (i, c) in self.constellations.iter().enumerate() {
            let cs = c.satellites()?;
            let label = (i + 1).min(u8::MAX as usize) as u8;
            labels.resize(labels.len() + cs.len(), label);
            sats.extend(cs);
        }
        Ok((sats, labels))
    }

    /// Run the availability evaluation over the configured time grid.
    pub fn run(&self) -> Result<RaimAvailabilityReport, String> {
        let user = self.user.to_orbit();
        if self.araim_dual {
            let (sats, labels) = self.all_satellites_labeled()?;
            // Build the ISM from the scenario: σ_URA (the integrity bound) defaults
            // to σ_URE when unset (its floor, URA ≥ URE), and the nominal bias b_nom
            // defaults to 0 (the zero-bias MHSS bound). The protection level is sized
            // with the integrity bound σ_URA, never the smaller accuracy σ_URE.
            let sigma_ura = if self.sigma_ura_m > 0.0 {
                self.sigma_ura_m.max(self.sigma_uere_m)
            } else {
                self.sigma_uere_m
            };
            let ism = IntegritySupportMessage {
                sigma_ure_m: self.sigma_uere_m,
                sigma_ura_m: sigma_ura,
                b_nom_m: self.b_nom_m,
                p_sat: 1e-5,
                p_const: 1e-4,
            };
            let budget = IntegrityBudget {
                p_hmi_vert: self.p_hmi,
                p_hmi_horz: self.p_hmi,
                p_fa: self.p_fa,
            };
            return Ok(araim_dual_constellation_availability(
                &user,
                &sats,
                &labels,
                self.time.step_s,
                self.time.duration_s,
                self.mask_deg,
                ism.sigma_ura_m,
                ism.dual_fault_priors(),
                budget,
                self.al_h_m,
                self.al_v_m,
            ));
        }
        let sats = self.all_satellites()?;
        let cfg = RaimConfig {
            sigma_m: self.sigma_uere_m,
            p_fa: self.p_fa,
            p_md: self.p_md,
            al_h_m: self.al_h_m,
            al_v_m: self.al_v_m,
        };
        Ok(constellation_raim_availability(
            &user,
            &sats,
            self.time.step_s,
            self.time.duration_s,
            self.mask_deg,
            &cfg,
            self.seed,
        ))
    }
}

/// Render a RAIM availability report as a self-contained SVG: the horizontal and
/// vertical protection levels over time against their alert limits, with an
/// availability strip below the axis (green = available, red = not).
pub fn availability_svg(report: &RaimAvailabilityReport) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (70.0_f64, 20.0_f64, 30.0_f64, 70.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let t_max = report.epochs.iter().map(|e| e.t_s).fold(1.0_f64, f64::max);
    let mut y_max = report.al_h_m.max(report.al_v_m) * 1.4;
    for e in &report.epochs {
        if let Some(v) = e.hpl_m {
            y_max = y_max.max(v);
        }
        if let Some(v) = e.vpl_m {
            y_max = y_max.max(v);
        }
    }
    if y_max <= 0.0 {
        y_max = 1.0;
    }
    let xof = |t: f64| ml + (t / t_max) * pw;
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let axis_y = mt + ph;

    // Build polyline segments for a per-epoch level series, breaking at gaps
    // (epochs with no protected fix).
    let segments = |pick: &dyn Fn(&RaimAvailabilityEpoch) -> Option<f64>| -> String {
        let mut out = String::new();
        let mut cur: Vec<String> = Vec::new();
        for e in &report.epochs {
            match pick(e) {
                Some(v) => cur.push(format!("{:.1},{:.1}", xof(e.t_s), yof(v))),
                None => {
                    if cur.len() > 1 {
                        out.push_str(&format!("<polyline points=\"{}\"/>", cur.join(" ")));
                    }
                    cur.clear();
                }
            }
        }
        if cur.len() > 1 {
            out.push_str(&format!("<polyline points=\"{}\"/>", cur.join(" ")));
        }
        out
    };

    let mut svg = String::new();
    svg.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"18\" font-size=\"15\" font-weight=\"bold\">RAIM protection levels and availability ({:.0}% available)</text>",
        report.availability() * 100.0
    ));
    svg.push_str(&crate::chart::y_axis(
        ml,
        mt,
        pw,
        ph,
        y_max,
        "protection level (m)",
    ));
    // Axes.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    // Alert-limit lines.
    for (al, colour, label) in [
        (report.al_h_m, "#e5645a", "HAL"),
        (report.al_v_m, "#d2925e", "VAL"),
    ] {
        let y = yof(al);
        svg.push_str(&format!(
            "<line x1=\"{ml:.0}\" y1=\"{y:.1}\" x2=\"{:.0}\" y2=\"{y:.1}\" stroke=\"{colour}\" stroke-dasharray=\"6 4\"/>",
            ml + pw
        ));
        svg.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"{colour}\">{label} {al:.0} m</text>",
            ml + pw - 70.0,
            y - 4.0
        ));
    }
    // HPL / VPL polylines.
    svg.push_str(&format!(
        "<g fill=\"none\" stroke=\"#e0bd84\" stroke-width=\"2\">{}</g>",
        segments(&|e| e.hpl_m)
    ));
    svg.push_str(&format!(
        "<g fill=\"none\" stroke=\"#c79e63\" stroke-width=\"2\">{}</g>",
        segments(&|e| e.vpl_m)
    ));
    // Availability strip below the axis.
    let strip_y = axis_y + 12.0;
    let bw = pw / report.epochs.len().max(1) as f64;
    for (i, e) in report.epochs.iter().enumerate() {
        let colour = if e.available { "#46b67e" } else { "#e5645a" };
        svg.push_str(&format!(
            "<rect x=\"{:.1}\" y=\"{strip_y:.0}\" width=\"{:.1}\" height=\"10\" fill=\"{colour}\"/>",
            ml + i as f64 * bw,
            bw.max(0.5)
        ));
    }
    // Legend and axis label.
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"middle\">time (s)</text>",
        ml + pw / 2.0,
        h - 12.0
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"44\" fill=\"#e0bd84\">HPL</text><text x=\"{:.0}\" y=\"60\" fill=\"#c79e63\">VPL</text>",
        ml + 10.0,
        ml + 10.0
    ));
    svg.push_str("</svg>");
    svg
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

    /// A well-redundant ten-satellite spread, enough geometry for the protection
    /// levels to meet the APV-I alert limits at a few-metre ranging error.
    fn dense_constellation(station: Geodetic) -> Vec<Vec3> {
        let s = geodetic_to_ecef(station);
        let (east, north, up) = enu_basis(s).unwrap();
        let azel: [(f64, f64); 10] = [
            (0.0, 78.0),
            (40.0, 25.0),
            (80.0, 52.0),
            (120.0, 18.0),
            (160.0, 40.0),
            (200.0, 60.0),
            (240.0, 22.0),
            (280.0, 48.0),
            (320.0, 30.0),
            (350.0, 15.0),
        ];
        let range = 20_200_000.0;
        azel.iter()
            .map(|&(az, el)| {
                let (azr, elr) = (az.to_radians(), el.to_radians());
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

    #[test]
    fn araim_integrity_risk_sums_the_per_mode_tail_probabilities() {
        // A single unit-σ fault-free hypothesis: P_HMI(PL=2σ) = Q(2) = 1 − Φ(2)
        // = 0.022750132 (hand value).
        let modes = [AraimMode {
            p_fault: 1.0,
            threshold_m: 0.0,
            bias_m: 0.0,
            sigma_m: 1.0,
        }];
        assert!((araim_integrity_risk(2.0, &modes) - 0.022_750_132).abs() < 1e-6);
        // Two identical modes add: 2·Q(3) at PL = 3.
        let two = [
            AraimMode {
                p_fault: 1e-4,
                threshold_m: 0.0,
                bias_m: 0.0,
                sigma_m: 1.0,
            },
            AraimMode {
                p_fault: 1e-4,
                threshold_m: 0.0,
                bias_m: 0.0,
                sigma_m: 1.0,
            },
        ];
        assert!((araim_integrity_risk(3.0, &two) - 2.0 * 1e-4 * 0.001_349_898).abs() < 1e-12);
        // Risk is monotone-decreasing in PL.
        assert!(araim_integrity_risk(2.0, &two) > araim_integrity_risk(4.0, &two));
    }

    #[test]
    fn araim_protection_level_inverts_the_fault_free_budget() {
        // Fault-free unit-σ mode: the PL meeting budget Q(2) is exactly 2σ.
        let modes = [AraimMode {
            p_fault: 1.0,
            threshold_m: 0.0,
            bias_m: 0.0,
            sigma_m: 1.0,
        }];
        let pl = araim_protection_level(&modes, 0.022_750_132);
        assert!((pl - 2.0).abs() < 1e-3, "PL = {pl}, want 2.0");
    }

    #[test]
    fn araim_protection_level_inverts_a_thresholded_fault_mode() {
        // One fault mode (p=1e-4, threshold T=5, σ=2). Budget = p·Q(3) makes the
        // PL = T + σ·Φ⁻¹(1−Q(3)) = 5 + 2·3 = 11 (hand-derived).
        let modes = [AraimMode {
            p_fault: 1e-4,
            threshold_m: 5.0,
            bias_m: 0.0,
            sigma_m: 2.0,
        }];
        let budget = 1e-4 * 0.001_349_898; // 1e-4 · Q(3)
        let pl = araim_protection_level(&modes, budget);
        assert!((pl - 11.0).abs() < 1e-2, "PL = {pl}, want 11.0");
    }

    #[test]
    fn araim_raim_fault_free_protects_and_tighter_budget_raises_the_pl() {
        let station = Geodetic {
            lat_rad: 0.7,
            lon_rad: 0.2,
            alt_m: 50.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = dense_constellation(station);
        let resid = vec![0.0; sats.len()];
        let priors = FaultPriors {
            p_sat: 1e-5,
            b_nom_m: 0.0,
        };
        let loose = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        let tight = IntegrityBudget {
            p_hmi_vert: 1e-9,
            p_hmi_horz: 1e-9,
            p_fa: 1e-5,
        };
        let rl = araim_raim(user, &sats, &resid, 1.0, priors, loose).expect("araim runs");
        let rt = araim_raim(user, &sats, &resid, 1.0, priors, tight).expect("araim runs");
        assert!(!rl.fault_detected, "no fault should be flagged");
        assert!(rl.vpl_m > 0.0 && rl.vpl_m.is_finite(), "VPL {}", rl.vpl_m);
        assert!(rl.hpl_m > 0.0 && rl.hpl_m.is_finite(), "HPL {}", rl.hpl_m);
        // The protection levels meet (do not exceed) the allocated budget.
        assert!(
            rl.p_hmi_vert <= loose.p_hmi_vert * 1.001,
            "achieved P_HMI {} > allocated {}",
            rl.p_hmi_vert,
            loose.p_hmi_vert
        );
        // A 10⁵× tighter integrity budget demands a larger protection level.
        assert!(
            rt.vpl_m > rl.vpl_m,
            "tighter budget VPL {} must exceed looser {}",
            rt.vpl_m,
            rl.vpl_m
        );
    }

    #[test]
    fn araim_raim_detects_and_identifies_a_faulty_satellite() {
        let station = Geodetic {
            lat_rad: 0.5,
            lon_rad: -1.2,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let mut resid = vec![0.0; sats.len()];
        resid[2] = 300.0; // 60-σ bias on satellite 2
        let r = araim_raim(
            user,
            &sats,
            &resid,
            5.0,
            FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.0,
            },
            IntegrityBudget {
                p_hmi_vert: 1e-4,
                p_hmi_horz: 1e-4,
                p_fa: 1e-5,
            },
        )
        .expect("araim runs");
        assert!(r.fault_detected, "a 60-σ bias must be detected");
        assert_eq!(r.excluded_sv, Some(2), "should identify SV 2 as faulted");
    }

    #[test]
    fn araim_raim_needs_six_satellites() {
        let station = Geodetic {
            lat_rad: 0.2,
            lon_rad: 0.4,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = gps_like_constellation(station);
        let five = &sats[..5];
        assert!(araim_raim(
            user,
            five,
            &[0.0; 5],
            5.0,
            FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.0
            },
            IntegrityBudget {
                p_hmi_vert: 1e-4,
                p_hmi_horz: 1e-4,
                p_fa: 1e-5,
            },
        )
        .is_none());
    }

    #[test]
    fn stanford_classifies_each_region() {
        let al = 40.0; // APV-I horizontal alert limit (m)
                       // PL bounds error, within AL → available.
        assert_eq!(classify_stanford(10.0, 25.0, al), StanfordRegion::Available);
        // Boundary error == PL counts as bounded (safe).
        assert_eq!(classify_stanford(25.0, 25.0, al), StanfordRegion::Available);
        // PL bounds error but PL exceeds AL → system unavailable (safe).
        assert_eq!(
            classify_stanford(30.0, 50.0, al),
            StanfordRegion::SystemUnavailable
        );
        // PL fails to bound error, error within AL → misleading information.
        assert_eq!(
            classify_stanford(30.0, 20.0, al),
            StanfordRegion::MisleadingInformation
        );
        // PL fails to bound error, error beyond AL → hazardously misleading.
        assert_eq!(
            classify_stanford(60.0, 20.0, al),
            StanfordRegion::HazardouslyMisleadingInformation
        );
    }

    /// EXTERNAL-ORACLE check: `classify_stanford` reproduces the region definition of
    /// the **Stanford–ESA integrity diagram** — Tossaint, Samson, Torán,
    /// Ventura-Traveset, Hernández-Pajares, Juan, Sanz & Ramos-Bosch, "The
    /// Stanford–ESA Integrity Diagram: A New Tool for the User Domain SBAS Integrity
    /// Assessment," NAVIGATION (ION), Vol. 54, No. 2, 2007 — over position error E,
    /// protection level PL and alert limit AL:
    ///   Available    : E ≤ PL ≤ AL
    ///   Unavailable  : PL > AL   (with PL ≥ E)
    ///   MI           : PL < E ≤ AL
    ///   HMI          : PL < E and E > AL
    /// The sources define the regions but not the exact ties; the conventional choices
    /// adopted here are E ≤ PL ⇒ bounded, PL ≤ AL ⇒ available, E > AL (strict) ⇒
    /// hazardous. The "unavailable AND unbounded" corner (PL > AL, PL < E, E > AL) is
    /// the literature's documented 4-cell/6-cell ambiguity; Kshana takes the
    /// safety-conservative choice — it reports the hazard (HMI) rather than masking it
    /// under "unavailable."
    #[test]
    fn classify_stanford_matches_the_stanford_esa_2007_definition() {
        use StanfordRegion::*;
        let al = 50.0; // the VAL drawn in the Tossaint et al. (2007) worked example.
                       // Region interiors.
        assert_eq!(classify_stanford(10.0, 20.0, al), Available); // E < PL < AL
        assert_eq!(classify_stanford(10.0, 60.0, al), SystemUnavailable); // PL > AL, PL > E
        assert_eq!(classify_stanford(30.0, 20.0, al), MisleadingInformation); // PL < E ≤ AL
        assert_eq!(
            classify_stanford(60.0, 20.0, al),
            HazardouslyMisleadingInformation
        ); // E > AL
           // Boundary / tie conventions.
        assert_eq!(classify_stanford(25.0, 25.0, al), Available); // E == PL (diagonal) ⇒ bounded
        assert_eq!(classify_stanford(50.0, 50.0, al), Available); // PL == AL ⇒ available (PL > AL strict)
        assert_eq!(classify_stanford(50.0, 20.0, al), MisleadingInformation); // E == AL ⇒ MI (HMI is E > AL strict)
        assert_eq!(
            classify_stanford(50.000_001, 20.0, al),
            HazardouslyMisleadingInformation
        ); // a hair past AL ⇒ HMI
           // Documented conservative convention for the unavailable-AND-unbounded corner.
        assert_eq!(
            classify_stanford(60.0, 55.0, al),
            HazardouslyMisleadingInformation
        ); // PL=55 > AL=50 but PL < E and E > AL ⇒ HMI (surfaces the hazard)
    }

    #[test]
    fn stanford_diagram_accumulates_counts_and_availability() {
        let mut d = StanfordDiagram::new(40.0);
        d.add(10.0, 25.0); // Available
        d.add(15.0, 30.0); // Available
        d.add(30.0, 50.0); // SystemUnavailable
        d.add(30.0, 20.0); // MisleadingInformation
        d.add(60.0, 20.0); // HazardouslyMisleadingInformation
        assert_eq!(d.len(), 5);
        assert_eq!(d.count(StanfordRegion::Available), 2);
        assert_eq!(d.count(StanfordRegion::SystemUnavailable), 1);
        assert_eq!(d.integrity_events(), 2);
        assert!((d.availability() - 2.0 / 5.0).abs() < 1e-12);
        // Points are retained in order for plotting/export.
        assert_eq!(d.points().len(), 5);
        assert_eq!(d.points()[0].region, StanfordRegion::Available);
    }

    #[test]
    fn stanford_diagram_serializes_to_json() {
        let mut d = StanfordDiagram::new(40.0);
        d.add(10.0, 25.0);
        d.add(60.0, 20.0);
        let json = serde_json::to_string(&d).expect("serializes");
        assert!(json.contains("alert_limit_m"));
        assert!(json.contains("Available"));
        assert!(json.contains("HazardouslyMisleadingInformation"));
    }

    #[test]
    fn raim_availability_epoch_judges_against_alert_limits() {
        let station = Geodetic {
            lat_rad: 0.7,
            lon_rad: 0.1,
            alt_m: 0.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = dense_constellation(station);
        // Good redundant geometry, tight ranging: protected and within APV-I limits.
        let cfg = RaimConfig {
            sigma_m: 1.0,
            p_fa: 1e-5,
            p_md: 1e-3,
            al_h_m: 40.0,
            al_v_m: 50.0,
        };
        let e = raim_availability_epoch(0.0, user, &sats, &cfg);
        assert_eq!(e.n_visible, 10);
        assert!(e.hpl_m.is_some() && e.vpl_m.is_some());
        assert!(e.available, "HPL {:?} VPL {:?}", e.hpl_m, e.vpl_m);
        // An impossibly tight alert limit makes the same geometry unavailable.
        let strict = RaimConfig {
            al_h_m: 1.0,
            al_v_m: 1.0,
            ..cfg
        };
        assert!(!raim_availability_epoch(0.0, user, &sats, &strict).available);
        // Fewer than five satellites: no protected fix.
        let e4 = raim_availability_epoch(0.0, user, &sats[..4], &cfg);
        assert_eq!(e4.hpl_m, None);
        assert!(!e4.available);
    }

    #[test]
    fn constellation_raim_availability_runs_end_to_end_over_sgp4_geometry() {
        use crate::orbit::{ConstellationCfg, Orbit, R_EARTH_M};
        // A GPS-like 24-satellite Walker constellation (6 planes × 4), ~20 200 km.
        let cons = ConstellationCfg {
            altitude_km: 20_200.0,
            inclination_deg: 55.0,
            planes: 6,
            sats_per_plane: 4,
            phasing_f: 1.0,
            tle: None,
            rinex: None,
            strict_checksum: false,
        };
        let gnss = cons.satellites().expect("constellation builds");
        // A user near the surface.
        let user = Orbit::new(R_EARTH_M, 0.6, 0.2, 0.0);
        let cfg = RaimConfig {
            sigma_m: 6.0,
            p_fa: 1e-5,
            p_md: 1e-3,
            al_h_m: 40.0,
            al_v_m: 50.0,
        };
        let report = constellation_raim_availability(&user, &gnss, 300.0, 6000.0, 5.0, &cfg, 7);
        assert_eq!(report.samples_total, report.epochs.len());
        assert!(report.samples_total > 1);
        assert!((0.0..=1.0).contains(&report.availability()));
        // The geometry yields a fix with redundancy at some epochs.
        let protected = report
            .epochs
            .iter()
            .filter(|e| e.n_visible >= 5 && e.hpl_m.is_some())
            .count();
        assert!(protected > 0, "no epoch had a protected fix");
        // The vertical Stanford diagram carries exactly one point per protected
        // epoch, and a clean (no-fault) realization produces no hazardously
        // misleading information — the protection level bounds the error.
        assert_eq!(report.stanford.len(), protected);
        assert_eq!(
            report
                .stanford
                .count(StanfordRegion::HazardouslyMisleadingInformation),
            0,
            "a no-fault realization must not be hazardously misleading"
        );
        // Determinism: the same seed reproduces the diagram exactly.
        let again = constellation_raim_availability(&user, &gnss, 300.0, 6000.0, 5.0, &cfg, 7);
        assert_eq!(report.stanford.points(), again.stanford.points());
        // Serializes for export.
        let json = serde_json::to_string(&report).expect("serializes");
        assert!(json.contains("samples_available"));
        assert!(json.contains("stanford") && json.contains("alert_limit_m"));
    }

    fn dual_setup() -> (Vec3, Vec<Vec3>, Vec<u8>, Vec<f64>, IntegrityBudget) {
        let station = Geodetic {
            lat_rad: 0.7,
            lon_rad: 0.2,
            alt_m: 50.0,
        };
        let user = geodetic_to_ecef(station);
        let sats = dense_constellation(station); // 10 satellites
                                                 // Two constellations, 5 + 5 (alternating labels).
        let constellation: Vec<u8> = (0..sats.len()).map(|i| (i % 2) as u8).collect();
        let resid = vec![0.0; sats.len()];
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        (user, sats, constellation, resid, budget)
    }

    #[test]
    fn dual_reduces_to_single_when_p_const_zero() {
        // With P_const = 0 the constellation hypotheses are dropped and the dual
        // result is identical to the single-fault araim_raim, bit-for-bit.
        let (user, sats, constellation, resid, budget) = dual_setup();
        let single = araim_raim(
            user,
            &sats,
            &resid,
            1.0,
            FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("single araim runs");
        let dual = araim_dual_raim(
            user,
            &sats,
            &constellation,
            &resid,
            1.0,
            DualFaultPriors {
                p_sat: 1e-5,
                p_const: 0.0,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("dual araim runs");
        assert!(
            (dual.vpl_m - single.vpl_m).abs() < 1e-9,
            "VPL {} vs {}",
            dual.vpl_m,
            single.vpl_m
        );
        assert!(
            (dual.hpl_m - single.hpl_m).abs() < 1e-9,
            "HPL {} vs {}",
            dual.hpl_m,
            single.hpl_m
        );
    }

    #[test]
    fn constellation_fault_mode_widens_the_protection_level() {
        // Adding the per-constellation fault hypothesis (P_const = 1e-4) puts extra
        // probability mass into the integrity sum, so VPL/HPL must grow beyond the
        // P_const = 0 baseline.
        let (user, sats, constellation, resid, budget) = dual_setup();
        let base = araim_dual_raim(
            user,
            &sats,
            &constellation,
            &resid,
            1.0,
            DualFaultPriors {
                p_sat: 1e-5,
                p_const: 0.0,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("base runs");
        let dual = araim_dual_raim(
            user,
            &sats,
            &constellation,
            &resid,
            1.0,
            DualFaultPriors {
                p_sat: 1e-5,
                p_const: 1e-4,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("dual runs");
        assert!(
            dual.vpl_m > base.vpl_m,
            "dual VPL {} !> base {}",
            dual.vpl_m,
            base.vpl_m
        );
        assert!(
            dual.hpl_m > base.hpl_m,
            "dual HPL {} !> base {}",
            dual.hpl_m,
            base.hpl_m
        );
        // The protection levels still meet (do not exceed) the allocated budget.
        assert!(
            dual.p_hmi_vert <= budget.p_hmi_vert * 1.001,
            "P_HMI_v {}",
            dual.p_hmi_vert
        );
        assert!(
            dual.p_hmi_horz <= budget.p_hmi_horz * 1.001,
            "P_HMI_h {}",
            dual.p_hmi_horz
        );
        assert!(dual.vpl_m.is_finite() && dual.vpl_m > 0.0);
        assert!(dual.hpl_m.is_finite() && dual.hpl_m > 0.0);
    }

    #[test]
    fn nominal_bias_inflates_the_protection_level() {
        // The ISM nominal-bias term folds a one-sided Σ_i |s_i|·b_nom into every
        // mode, so a non-zero b_nom must yield a strictly larger (more conservative)
        // VPL/HPL than the zero-bias MHSS bound on the same geometry — and b_nom = 0
        // must reproduce the zero-bias bound exactly (the Blanch et al. PL term).
        let (user, sats, _c, resid, budget) = dual_setup();
        let no_bias = araim_raim(
            user,
            &sats,
            &resid,
            0.75,
            FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.0,
            },
            budget,
        )
        .expect("zero-bias ARAIM runs");
        let with_bias = araim_raim(
            user,
            &sats,
            &resid,
            0.75,
            FaultPriors {
                p_sat: 1e-5,
                b_nom_m: 0.75,
            },
            budget,
        )
        .expect("biased ARAIM runs");
        assert!(
            with_bias.vpl_m > no_bias.vpl_m,
            "b_nom must inflate VPL: {} !> {}",
            with_bias.vpl_m,
            no_bias.vpl_m
        );
        assert!(
            with_bias.hpl_m > no_bias.hpl_m,
            "b_nom must inflate HPL: {} !> {}",
            with_bias.hpl_m,
            no_bias.hpl_m
        );
        assert!(with_bias.vpl_m.is_finite() && with_bias.hpl_m.is_finite());
    }

    #[test]
    fn single_constellation_cannot_tolerate_its_own_fault() {
        // If every satellite is one constellation, removing it leaves nothing to
        // navigate with — the constellation fault is unbounded, so ARAIM is not
        // available. This is exactly why dual-constellation coverage matters.
        let (user, sats, _c, resid, budget) = dual_setup();
        let one_const = vec![0u8; sats.len()];
        let r = araim_dual_raim(
            user,
            &sats,
            &one_const,
            &resid,
            1.0,
            DualFaultPriors {
                p_sat: 1e-5,
                p_const: 1e-4,
                b_nom_m: 0.0,
            },
            budget,
        );
        assert!(
            r.is_none(),
            "single constellation must not be available against its own fault"
        );
        // …but with P_const = 0 (no constellation hypothesis) the same geometry is fine.
        let ok = araim_dual_raim(
            user,
            &sats,
            &one_const,
            &resid,
            1.0,
            DualFaultPriors {
                p_sat: 1e-5,
                p_const: 0.0,
                b_nom_m: 0.0,
            },
            budget,
        );
        assert!(
            ok.is_some(),
            "with no constellation hypothesis it should run"
        );
    }

    #[test]
    fn dual_araim_rejects_mismatched_or_thin_inputs() {
        let (user, sats, constellation, resid, budget) = dual_setup();
        let priors = DualFaultPriors {
            p_sat: 1e-5,
            p_const: 1e-4,
            b_nom_m: 0.0,
        };
        // Mismatched constellation-label length.
        assert!(araim_dual_raim(
            user,
            &sats,
            &constellation[..9],
            &resid,
            1.0,
            priors,
            budget
        )
        .is_none());
        // Fewer than six satellites.
        assert!(araim_dual_raim(
            user,
            &sats[..5],
            &constellation[..5],
            &resid[..5],
            1.0,
            priors,
            budget
        )
        .is_none());
    }

    // A GPS-only set and a GPS+Galileo set sharing the GPS satellites, both with a
    // good sky spread, for the dual-constellation benefit comparison.
    fn gps_galileo_geometry() -> (Vec3, Vec<Vec3>, Vec<Vec3>, Vec<u8>) {
        let station = Geodetic {
            lat_rad: 0.6,
            lon_rad: -0.4,
            alt_m: 120.0,
        };
        let user = geodetic_to_ecef(station);
        let (east, north, up) = enu_basis(user).unwrap();
        let place = |az_deg: f64, el_deg: f64, range: f64| -> Vec3 {
            let (az, el) = (az_deg.to_radians(), el_deg.to_radians());
            let (de, dn, du) = (el.cos() * az.sin(), el.cos() * az.cos(), el.sin());
            [
                user[0] + range * (de * east[0] + dn * north[0] + du * up[0]),
                user[1] + range * (de * east[1] + dn * north[1] + du * up[1]),
                user[2] + range * (de * east[2] + dn * north[2] + du * up[2]),
            ]
        };
        // GPS (radius ~26,560 km → ~22,000 km representative slant).
        let gps_azel = [
            (10.0, 70.0),
            (70.0, 30.0),
            (140.0, 45.0),
            (200.0, 25.0),
            (260.0, 55.0),
            (310.0, 35.0),
            (350.0, 20.0),
        ];
        // Galileo (radius ~29,600 km) filling the gaps in azimuth and elevation.
        let gal_azel = [
            (40.0, 50.0),
            (100.0, 20.0),
            (170.0, 62.0),
            (230.0, 40.0),
            (290.0, 28.0),
            (330.0, 65.0),
            (20.0, 38.0),
        ];
        let gps: Vec<Vec3> = gps_azel
            .iter()
            .map(|&(a, e)| place(a, e, 22_000_000.0))
            .collect();
        let mut all = gps.clone();
        for &(a, e) in &gal_azel {
            all.push(place(a, e, 25_000_000.0));
        }
        let labels: Vec<u8> = (0..all.len())
            .map(|i| if i < gps.len() { 0 } else { 1 })
            .collect();
        (user, gps, all, labels)
    }

    #[test]
    fn ism_reference_baseline_and_converters() {
        // The WG-C ARAIM reference integrity-support parameters; the milestone fixes
        // P_sat = 1e-5 and P_const = 1e-4. σ_URA (integrity) ≥ σ_URE (accuracy), and
        // the max nominal integrity bias is 0.75 m.
        let ism = IntegritySupportMessage::gps_galileo_reference();
        assert_eq!(ism.p_sat, 1e-5);
        assert_eq!(ism.p_const, 1e-4);
        assert!((ism.b_nom_m - 0.75).abs() < 1e-12);
        assert!(ism.sigma_ura_m >= ism.sigma_ure_m, "URA must bound URE");
        // The converters hand the priors straight to the ARAIM engines.
        assert_eq!(ism.fault_priors().p_sat, ism.p_sat);
        assert_eq!(ism.dual_fault_priors().p_sat, ism.p_sat);
        assert_eq!(ism.dual_fault_priors().p_const, ism.p_const);
    }

    #[test]
    fn stanford_svg_renders_zones_and_points() {
        let mut d = StanfordDiagram::new(35.0);
        d.add(10.0, 25.0); // available
        d.add(10.0, 45.0); // system unavailable (PL > AL)
        d.add(30.0, 20.0); // misleading information (PL < error ≤ AL)
        d.add(50.0, 20.0); // hazardously misleading (error > AL and > PL)
        let svg = stanford_svg(&d);
        assert!(svg.starts_with("<svg") && svg.trim_end().ends_with("</svg>"));
        // One marker per recorded epoch.
        assert_eq!(svg.matches("<circle").count(), d.len());
        // The HMI zone colour and the alert-limit guide must be drawn.
        assert!(svg.contains("Stanford"), "titled Stanford diagram");
        assert!(svg.contains("35"), "alert limit annotated");
        // The diagonal PL = error line (the integrity boundary) is present.
        assert!(svg.contains("<line"), "boundary/axis lines drawn");
    }

    #[test]
    fn dual_constellation_improves_geometry_and_tolerates_a_constellation_fault() {
        // The two robustly-true dual-constellation benefits. (The published EU ARAIM
        // TN "15–25 % smaller HPL" is an *availability* result over realistic
        // constellations; reproducing that exact table against a version-locked real
        // TLE snapshot is the external validation residual — see docs/ARAIM_REFERENCE.md.)
        let (user, gps, all, labels) = gps_galileo_geometry();
        let budget = IntegrityBudget {
            p_hmi_vert: 1e-4,
            p_hmi_horz: 1e-4,
            p_fa: 1e-5,
        };
        let ism = IntegritySupportMessage::gps_galileo_reference();

        // (1) Geometry/redundancy benefit: pooling the second constellation's
        // satellites tightens the single-fault HPL — more measurements and a
        // larger single-SV sub-solution set give a strictly smaller bound.
        let gps_only = araim_raim(
            user,
            &gps,
            &vec![0.0; gps.len()],
            ism.sigma_ura_m,
            ism.fault_priors(),
            budget,
        )
        .expect("GPS-only ARAIM runs");
        let pooled = araim_raim(
            user,
            &all,
            &vec![0.0; all.len()],
            ism.sigma_ura_m,
            ism.fault_priors(),
            budget,
        )
        .expect("pooled 14-SV ARAIM runs");
        assert!(
            pooled.hpl_m < gps_only.hpl_m,
            "pooled HPL {:.2} m should beat GPS-only {:.2} m",
            pooled.hpl_m,
            gps_only.hpl_m
        );

        // (2) Constellation-fault tolerance: with the per-constellation fault
        // hypothesis active, the dual user stays available (7 SV survive losing
        // either constellation) — while a single-constellation user provably cannot
        // be protected against its own constellation fault.
        let dual = araim_dual_raim(
            user,
            &all,
            &labels,
            &vec![0.0; all.len()],
            ism.sigma_ura_m,
            ism.dual_fault_priors(),
            budget,
        )
        .expect("dual-constellation ARAIM available");
        assert!(dual.hpl_m.is_finite() && dual.hpl_m > 0.0 && dual.vpl_m > 0.0);
        let one_constellation = vec![0u8; all.len()];
        assert!(
            araim_dual_raim(
                user,
                &all,
                &one_constellation,
                &vec![0.0; all.len()],
                ism.sigma_ura_m,
                ism.dual_fault_priors(),
                budget,
            )
            .is_none(),
            "a single-constellation user cannot survive its own constellation fault"
        );
    }
}
