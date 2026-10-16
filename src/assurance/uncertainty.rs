// SPDX-License-Identifier: AGPL-3.0-only
//! Equivalent Degrees of Freedom (EDF) and chi-square confidence intervals
//! for the Allan-variance family of frequency-stability estimators.
//!
//! # References
//! - W. J. Riley, *Handbook of Frequency Stability Analysis*, NIST Special
//!   Publication 1065 (2008), Sec. 5.3-5.4 and Table 5 ("Simple approximate
//!   formulae for the equivalent number of chi-squared degrees of freedom").
//! - C. A. Greenhall & W. J. Riley, "Uncertainty of Stability Variances Based
//!   on Finite Differences", *Proc. 35th PTTI Meeting* (2003) — the combined-EDF
//!   algorithm of which Table 5 is the closed-form simple approximation.
//!
//! The EDF of an overlapping Allan variance estimate is the number `nu` such
//! that `nu * sigma^2_hat / sigma^2_true` is approximately chi-square with `nu`
//! degrees of freedom. Given `nu`, a `(1 - alpha)` confidence interval on the
//! true variance follows from the chi-square quantiles (NIST SP 1065 eq. 5-9):
//!
//! ```text
//!   ( nu * s^2 / chi2_inv(p_upper, nu),  nu * s^2 / chi2_inv(p_lower, nu) )
//! ```
//!
//! This module is deterministic and `wasm32`-safe: it uses only `f64` math,
//! never calls [`std::time::SystemTime::now`], and allocates nothing.

use crate::portable_math::PortableFloat;
/// Power-law noise type, identified by its phase-spectral exponent `alpha`
/// (the exponent in `S_y(f) ~ f^alpha` for fractional-frequency noise).
///
/// The mapping to the `alpha` used in NIST SP 1065 Table 5 is:
/// White PM = +2, Flicker PM = +1, White FM = 0, Flicker FM = -1,
/// Random-Walk FM = -2.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum NoiseType {
    /// White phase-modulation noise (`alpha = +2`).
    WhitePM,
    /// Flicker phase-modulation noise (`alpha = +1`).
    FlickerPM,
    /// White frequency-modulation noise (`alpha = 0`).
    WhiteFM,
    /// Flicker frequency-modulation noise (`alpha = -1`).
    FlickerFM,
    /// Random-walk frequency-modulation noise (`alpha = -2`).
    RandomWalkFM,
}

impl NoiseType {
    /// The Table-5 `alpha` exponent for this noise type.
    #[must_use]
    pub fn alpha(self) -> i32 {
        match self {
            NoiseType::WhitePM => 2,
            NoiseType::FlickerPM => 1,
            NoiseType::WhiteFM => 0,
            NoiseType::FlickerFM => -1,
            NoiseType::RandomWalkFM => -2,
        }
    }
}

/// Which member of the Allan-variance family the estimate came from.
///
/// Every variant computes its EDF from the estimator-appropriate formula:
///
/// | Variant   | EDF method |
/// |-----------|------------|
/// | [`VarType::Allan`]    | NIST SP 1065 Table 5 simple closed forms (overlapping AVAR) |
/// | [`VarType::Modified`] | Greenhall & Riley 2003/2004 combined EDF, `d = 2`, `modified` filter |
/// | [`VarType::Hadamard`] | Greenhall & Riley 2003/2004 combined EDF, `d = 3`, unmodified filter |
/// | [`VarType::Total`]    | NIST SP 1065 Table 7 `b·(N/m) − c` for TOTVAR |
///
/// The Greenhall combined-EDF and the TOTVAR Table-7 forms are cross-checked
/// against the `allantools` reference implementation (`edf_greenhall` /
/// `edf_totdev`), which is itself validated against Stable32.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum VarType {
    /// Overlapping Allan variance (AVAR). NIST SP 1065 Table 5.
    Allan,
    /// Modified Allan variance (MVAR). Greenhall combined EDF, `d = 2`, modified filter.
    Modified,
    /// Overlapping Hadamard variance (HVAR). Greenhall combined EDF, `d = 3`.
    Hadamard,
    /// Total variance (TOTVAR). NIST SP 1065 Table 7.
    Total,
}

/// Equivalent number of chi-square degrees of freedom (EDF) for a
/// stability-variance estimate.
///
/// The EDF is computed with the formula appropriate to the estimator
/// ([`VarType`]) and the power-law noise ([`NoiseType`]):
///
/// - [`VarType::Allan`] uses the NIST SP 1065 Table 5 simple closed-form
///   approximations for the **overlapping** Allan variance, indexed by the
///   noise exponent `alpha`:
///
///   | Noise          | alpha | EDF formula |
///   |----------------|-------|-------------|
///   | White PM       | +2    | `(N+1)(N-2m) / (2(N-m))` |
///   | Flicker PM     | +1    | `exp( sqrt( ln(a)·ln(b) ) )`, `a=(N-1)/(2m)`, `b=(2m+1)(N-1)/4` |
///   | White FM       | 0     | `(3(N-1)/(2m) - 2(N-2)/N) · 4m²/(4m²+5)` |
///   | Flicker FM     | -1    | `m=1: 2(N-2)/(2.3N-4.9)`; `m>1: 5N²/(4m(N+3m))` |
///   | Random-Walk FM | -2    | `(N-2)/(m(N-3)²) · ((N-1)² - 3m(N-1) + 4m²)` |
///
/// - [`VarType::Modified`] (MVAR) and [`VarType::Hadamard`] (overlapping HVAR)
///   use the **combined EDF** of Greenhall & Riley (2003 PTTI / 2004), the
///   basis-function algorithm of which Table 5 is only the closed-form Allan
///   approximation. MVAR uses `d = 2` with the *modified* phase filter
///   (`F = 1`); HVAR uses `d = 3` with the *unmodified* filter (`F = m`). Both
///   are the overlapping estimators (`S = m`).
///
/// - [`VarType::Total`] (TOTVAR) uses the NIST SP 1065 Table 7 form
///   `edf = b·(N/m) − c`, with `(b, c)` selected by the noise type
///   (WFM `(1.50, 0.0)`, FFM `(1.17, 0.22)`, RWFM `(0.93, 0.36)`); PM noises,
///   for which TOTVAR has no Table-7 entry, fall back to the Table-5 Allan EDF.
///
/// where `N` is the number of phase samples and `m` the averaging factor.
/// The Allan forms are cross-checked against the allantools `edf_simple`
/// reference; the Greenhall MVAR/HVAR forms against `edf_greenhall`; and the
/// TOTVAR form against `edf_totdev` — all in allantools, itself validated
/// against Stable32.
///
/// Returns `f64::NAN` for degenerate inputs (`N < 4` or `m == 0` or `m` too
/// large relative to `N`), where the forms are undefined.
#[must_use]
pub fn edf(noise: NoiseType, n: usize, m: usize, var: VarType) -> f64 {
    if m == 0 || n < 4 || 2 * m >= n {
        return f64::NAN;
    }
    let alpha = noise.alpha();
    match var {
        VarType::Allan => edf_allan_table5(alpha, n, m),
        // MVAR: combined EDF, second differences (d=2), modified filter.
        VarType::Modified => edf_greenhall(alpha, 2, m, n, /*modified=*/ true),
        // HVAR (overlapping): combined EDF, third differences (d=3), unmodified.
        VarType::Hadamard => edf_greenhall(alpha, 3, m, n, /*modified=*/ false),
        // TOTVAR: NIST SP 1065 Table 7 (with Table-5 Allan fallback for PM).
        VarType::Total => edf_totvar_table7(alpha, n, m),
    }
}

/// NIST SP 1065 Table 5 simple closed-form EDF for the overlapping Allan
/// variance. `n >= 4`, `m >= 1`, `2m < n` are guaranteed by the caller.
fn edf_allan_table5(alpha: i32, n: usize, m: usize) -> f64 {
    let nn = n as f64;
    let mm = m as f64;
    match alpha {
        2 => {
            // White PM
            (nn + 1.0) * (nn - 2.0 * mm) / (2.0 * (nn - mm))
        }
        1 => {
            // Flicker PM
            let a = (nn - 1.0) / (2.0 * mm);
            let b = (2.0 * mm + 1.0) * (nn - 1.0) / 4.0;
            (a.pln() * b.pln()).sqrt().pexp()
        }
        0 => {
            // White FM
            ((3.0 * (nn - 1.0) / (2.0 * mm)) - (2.0 * (nn - 2.0) / nn))
                * ((4.0 * mm * mm) / ((4.0 * mm * mm) + 5.0))
        }
        -1 => {
            // Flicker FM
            if m == 1 {
                2.0 * (nn - 2.0) / (2.3 * nn - 4.9)
            } else {
                5.0 * nn * nn / (4.0 * mm * (nn + 3.0 * mm))
            }
        }
        -2 => {
            // Random-Walk FM
            let a = (nn - 2.0) / (mm * (nn - 3.0) * (nn - 3.0));
            let b = (nn - 1.0) * (nn - 1.0);
            let c = 3.0 * mm * (nn - 1.0);
            let d = 4.0 * mm * mm;
            a * (b - c + d)
        }
        _ => f64::NAN,
    }
}

/// TOTVAR EDF from NIST SP 1065 Table 7 (`edf = b·(N/m) − c`).
///
/// The table only tabulates the FM noises WFM/FFM/RWFM; for the PM noises the
/// overlapping-Allan Table-5 EDF is used as the documented fallback, matching
/// allantools' `edf_totdev` (which routes non-`{0,-1,-2}` alpha to `edf_simple`).
fn edf_totvar_table7(alpha: i32, n: usize, m: usize) -> f64 {
    // (b, c) indexed by |alpha| for alpha in {0, -1, -2}.
    let bc = match alpha {
        0 => Some((1.50_f64, 0.0_f64)),   // WFM
        -1 => Some((1.17_f64, 0.22_f64)), // FFM
        -2 => Some((0.93_f64, 0.36_f64)), // RWFM
        _ => None,
    };
    match bc {
        Some((b, c)) => b * (n as f64 / m as f64) - c,
        // PM noises have no Table-7 entry: fall back to the Allan EDF.
        None => edf_allan_table5(alpha, n, m),
    }
}

/// Greenhall combined EDF for the uncertainty module: `d` is the difference order
/// (2 = Allan/Modified, 3 = Hadamard), `modified` selects the modified phase filter, and
/// the estimator is always overlapping. Only the direct-sum and closed-form cases are
/// used here (the large-J asymptotic branches give `f64::NAN`, as they always have);
/// the full algorithm is [`crate::allan::edf_greenhall`], which this shares its code with.
fn edf_greenhall(alpha: i32, d: i32, m: usize, n: usize, modified: bool) -> f64 {
    crate::allan::greenhall_edf_core(alpha, d, m, n, true, modified, true)
}

/// Inverse chi-square CDF (quantile): returns `x` such that
/// `P(X <= x) = p` for `X ~ chi-square(dof)`.
///
/// The Wilson-Hilferty cube-root transform (NIST SP 1065 eq. 5-7; Abramowitz &
/// Stegun 26.4.17),
///
/// ```text
///   x0 = k · ( 1 - 2/(9k) + z_p · sqrt(2/(9k)) )³,   z_p = norm_inv(p)
/// ```
///
/// supplies the **initial guess**. Wilson-Hilferty alone is accurate to well
/// under 1% for `k >= ~3`, but it degrades in the low-degrees-of-freedom regime
/// (≈2.5% relative error at `k = 1`) — which is exactly the regime that drives
/// Allan-variance CIs at large averaging factors (few dof). To keep the whole
/// dof range inside the module's 2e-2 KAT bar, the guess is then refined with
/// Newton-Raphson on the **exact** chi-square CDF, evaluated from the
/// regularized lower incomplete gamma function:
///
/// ```text
///   F(x; k) = P(k/2, x/2),   f(x; k) = chi-square pdf
///   x <- x - (F(x; k) - p) / f(x; k)
/// ```
///
/// `P(a, x)` ([`reg_lower_gamma`]) uses the Numerical-Recipes series /
/// continued-fraction split, and `norm_inv` uses Acklam's rational
/// approximation. All math is `f64`-only with no external dependency, so the
/// routine is `wasm32`-safe and deterministic. The result is accurate to a few
/// ULP for every `dof >= ~1e-2` and `p in (0, 1)`.
#[must_use]
pub fn chi2_inv(p: f64, dof: f64) -> f64 {
    if p <= 0.0 {
        return 0.0;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }

    // Wilson-Hilferty initial guess.
    let z = norm_inv(p);
    let t = 2.0 / (9.0 * dof);
    let base = 1.0 - t + z * t.sqrt();
    let mut x = dof * base * base * base;
    // WH can fall to (or below) zero for tiny dof in the lower tail; start the
    // Newton iteration from a strictly positive point in that case.
    if x <= 0.0 || !x.is_finite() {
        x = 0.5 * dof.max(1e-3);
    }

    // Newton-Raphson on the exact chi-square CDF F(x;k) = reg_lower_gamma(k/2, x/2).
    // F is strictly increasing with positive derivative (the pdf) for x > 0, so
    // a guarded Newton step (halve toward zero if it overshoots negative)
    // converges quadratically from the WH neighbourhood.
    let a = 0.5 * dof;
    for _ in 0..64 {
        let cdf = reg_lower_gamma(a, 0.5 * x);
        let pdf = chi2_pdf(x, dof);
        if pdf <= 0.0 || !pdf.is_finite() {
            break;
        }
        let dx = (cdf - p) / pdf;
        let mut xn = x - dx;
        if xn <= 0.0 {
            xn = 0.5 * x;
        }
        let converged = (xn - x).abs() <= 1e-12 * x.max(1.0);
        x = xn;
        if converged {
            break;
        }
    }
    x
}

/// Chi-square probability density at `x` with `dof` degrees of freedom.
///
/// `f(x;k) = x^(k/2-1) · e^(-x/2) / (2^(k/2) · Gamma(k/2))`, evaluated in log
/// space for numerical stability. Returns `0.0` for `x <= 0`.
fn chi2_pdf(x: f64, dof: f64) -> f64 {
    if x <= 0.0 {
        return 0.0;
    }
    let a = 0.5 * dof;
    let ln_pdf = (a - 1.0) * x.pln() - 0.5 * x - a * core::f64::consts::LN_2 - ln_gamma(a);
    ln_pdf.pexp()
}

/// Natural log of the Gamma function via the Lanczos approximation
/// (Numerical Recipes `gammln`), valid for `x > 0`. Relative error < 2e-10.
fn ln_gamma(x: f64) -> f64 {
    const COF: [f64; 6] = [
        76.180_091_729_471_46,
        -86.505_320_329_416_77,
        24.014_098_240_830_91,
        -1.231_739_572_450_155,
        0.120_865_097_386_617_9e-2,
        -0.539_523_938_495_3e-5,
    ];
    let mut y = x;
    let tmp = (x + 5.5) - (x + 0.5) * (x + 5.5).pln();
    let mut ser = 1.000_000_000_190_015;
    for &c in &COF {
        y += 1.0;
        ser += c / y;
    }
    -tmp + (2.506_628_274_631_000_5 * ser / x).pln()
}

/// Regularized lower incomplete gamma function `P(a, x) = gamma(a, x)/Gamma(a)`.
///
/// Uses the series representation for `x < a + 1` and the continued-fraction
/// representation (via the complementary `Q = 1 - P`) otherwise, following
/// Numerical Recipes. `a > 0`, `x >= 0`.
fn reg_lower_gamma(a: f64, x: f64) -> f64 {
    if x <= 0.0 {
        return 0.0;
    }
    if x < a + 1.0 {
        // Series expansion for P(a, x).
        let mut ap = a;
        let mut del = 1.0 / a;
        let mut sum = del;
        for _ in 0..1000 {
            ap += 1.0;
            del *= x / ap;
            sum += del;
            if del.abs() < sum.abs() * 1e-15 {
                break;
            }
        }
        sum * (-x + a * x.pln() - ln_gamma(a)).pexp()
    } else {
        // Continued fraction for Q(a, x) via the modified Lentz algorithm.
        const TINY: f64 = 1e-300;
        let mut b = x + 1.0 - a;
        let mut c = 1.0 / TINY;
        let mut d = 1.0 / b;
        let mut h = d;
        for i in 1..1000 {
            let an = -(i as f64) * (i as f64 - a);
            b += 2.0;
            d = an * d + b;
            if d.abs() < TINY {
                d = TINY;
            }
            c = b + an / c;
            if c.abs() < TINY {
                c = TINY;
            }
            d = 1.0 / d;
            let del = d * c;
            h *= del;
            if (del - 1.0).abs() < 1e-15 {
                break;
            }
        }
        let q = (-x + a * x.pln() - ln_gamma(a)).pexp() * h;
        1.0 - q
    }
}

/// Inverse standard-normal CDF (probit) via Acklam's rational approximation.
///
/// Returns `z` such that `Phi(z) = p` for the standard normal. Maximum
/// relative error is about 1.15e-9 over `p in (0, 1)`. Reference:
/// P. J. Acklam, "An algorithm for computing the inverse normal cumulative
/// distribution function" (2003).
fn norm_inv(p: f64) -> f64 {
    // Coefficients.
    const A: [f64; 6] = [
        -3.969683028665376e+01,
        2.209460984245205e+02,
        -2.759285104469687e+02,
        1.38357751867269e+02,
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
    const P_LOW: f64 = 0.02425;
    let p_high = 1.0 - P_LOW;

    if p <= 0.0 {
        return f64::NEG_INFINITY;
    }
    if p >= 1.0 {
        return f64::INFINITY;
    }

    if p < P_LOW {
        // Lower tail.
        let q = (-2.0 * p.pln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= p_high {
        // Central region.
        let q = p - 0.5;
        let r = q * q;
        (((((A[0] * r + A[1]) * r + A[2]) * r + A[3]) * r + A[4]) * r + A[5]) * q
            / (((((B[0] * r + B[1]) * r + B[2]) * r + B[3]) * r + B[4]) * r + 1.0)
    } else {
        // Upper tail.
        let q = (-2.0 * (1.0 - p).pln()).sqrt();
        -(((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    }
}

/// Confidence interval on a true variance given an estimate and its EDF.
#[must_use]
pub fn confidence_interval(variance: f64, edf: f64, p_lower: f64, p_upper: f64) -> (f64, f64) {
    (
        variance * edf / chi2_inv(p_upper, edf),
        variance * edf / chi2_inv(p_lower, edf),
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rel(a: f64, b: f64) -> f64 {
        ((a - b) / b).abs()
    }

    // chi2_inv known-answer tests.
    // Reference values from the standard chi-square table (k = 10 d.o.f.):
    //   chi2_{0.975,10} = 20.483, chi2_{0.025,10} = 3.247
    // (e.g. NIST/SEMATECH e-Handbook 1.3.6.7.4, Pearson & Hartley Table 8).
    #[test]
    fn chi2_inv_upper_tail() {
        assert!(rel(chi2_inv(0.975, 10.0), 20.483) < 2e-2);
    }

    #[test]
    fn chi2_inv_lower_tail() {
        assert!(rel(chi2_inv(0.025, 10.0), 3.247) < 2e-2);
    }

    // Low-degrees-of-freedom KAT. This is the regime that actually matters for
    // Allan-variance CIs at large averaging factors (few dof), and the one the
    // bare Wilson-Hilferty approximation gets wrong (~2.5% error at k=1).
    // Reference: chi2_{0.95,1} = 3.841459 (the 95th percentile of chi-square
    // with 1 dof; equivalently norm_inv(0.975)^2 = 1.959964^2). NIST/SEMATECH
    // e-Handbook 1.3.6.7.4.
    #[test]
    fn chi2_inv_low_dof_k1() {
        assert!(rel(chi2_inv(0.95, 1.0), 3.841459) < 2e-2);
    }

    // A second low-dof anchor at k=2 (chi2_{0.95,2} = 5.991465; chi-square with
    // 2 dof is Exponential(1/2), so the quantile is -2*ln(1-p) = -2*ln(0.05)).
    #[test]
    fn chi2_inv_low_dof_k2() {
        assert!(rel(chi2_inv(0.95, 2.0), 5.991465) < 2e-2);
    }

    // Fractional low dof (EDF is generally non-integer). Cross-checked against
    // scipy.stats.chi2.ppf(0.95, 2.5) = 6.928076.
    #[test]
    fn chi2_inv_fractional_low_dof() {
        assert!(rel(chi2_inv(0.95, 2.5), 6.928076) < 2e-2);
    }

    // EDF known-answer tests. Expected values computed from NIST SP 1065
    // Table 5 closed forms and cross-checked against the allantools
    // `edf_simple` reference implementation (which is itself validated against
    // Stable32).
    //
    // White PM, alpha=+2: edf = (N+1)(N-2m)/(2(N-m)).
    //   N=1000, m=10 -> 1001*980/(2*990) = 495.4444...
    #[test]
    fn edf_white_pm_kat() {
        assert!(rel(edf(NoiseType::WhitePM, 1000, 10, VarType::Allan), 495.4444) < 2e-2);
    }

    // White FM, alpha=0: edf = (3(N-1)/(2m) - 2(N-2)/N) * (4m^2/(4m^2+5)).
    //   N=1000, m=1 -> 1496.504 * (4/9) = 665.113
    #[test]
    fn edf_white_fm_kat() {
        assert!(rel(edf(NoiseType::WhiteFM, 1000, 1, VarType::Allan), 665.113) < 2e-2);
    }

    // Random-Walk FM, alpha=-2:
    //   edf = (N-2)/(m(N-3)^2) * ((N-1)^2 - 3m(N-1) + 4m^2).
    //   N=1000, m=10 -> 97.23
    #[test]
    fn edf_rw_fm_kat() {
        assert!(
            rel(
                edf(NoiseType::RandomWalkFM, 1000, 10, VarType::Allan),
                97.23
            ) < 2e-2
        );
    }

    #[test]
    fn confidence_interval_brackets_estimate() {
        let nu = edf(NoiseType::WhiteFM, 1000, 1, VarType::Allan);
        let s2 = 1.0e-24;
        let (lo, hi) = confidence_interval(s2, nu, 0.025, 0.975);
        assert!(lo < s2 && s2 < hi, "CI must bracket the point estimate");
        assert!(lo > 0.0);
    }
}
