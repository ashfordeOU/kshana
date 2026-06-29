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
/// Only [`VarType::Allan`] (the overlapping Allan variance) is implemented with
/// the exact NIST SP 1065 Table 5 formulae. The remaining variants currently
/// reuse the overlapping-Allan EDF as a **Modelled** approximation (see
/// [`edf`]); they are marked TODO until their own combined-EDF coefficients are
/// wired in.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum VarType {
    /// Overlapping Allan variance (AVAR). Fully implemented.
    Allan,
    /// Modified Allan variance (MVAR). Modelled approximation — TODO.
    Modified,
    /// Hadamard variance (HVAR). Modelled approximation — TODO.
    Hadamard,
    /// Total variance (TOTVAR). Modelled approximation — TODO.
    Total,
}

/// Equivalent number of chi-square degrees of freedom (EDF) for a
/// stability-variance estimate.
///
/// For [`VarType::Allan`] this implements the NIST SP 1065 Table 5 simple
/// closed-form approximations for the **overlapping** Allan variance, indexed
/// by the noise exponent `alpha`:
///
/// | Noise          | alpha | EDF formula |
/// |----------------|-------|-------------|
/// | White PM       | +2    | `(N+1)(N-2m) / (2(N-m))` |
/// | Flicker PM     | +1    | `exp( sqrt( ln(a)·ln(b) ) )`, `a=(N-1)/(2m)`, `b=(2m+1)(N-1)/4` |
/// | White FM       | 0     | `(3(N-1)/(2m) - 2(N-2)/N) · 4m²/(4m²+5)` |
/// | Flicker FM     | -1    | `m=1: 2(N-2)/(2.3N-4.9)`; `m>1: 5N²/(4m(N+3m))` |
/// | Random-Walk FM | -2    | `(N-2)/(m(N-3)²) · ((N-1)² - 3m(N-1) + 4m²)` |
///
/// where `N` is the number of phase samples and `m` the averaging factor.
/// These are cross-checked against the allantools `edf_simple` reference
/// implementation (validated against Stable32).
///
/// `Modified`, `Hadamard`, and `Total` variances currently reuse the
/// overlapping-Allan EDF as a documented **Modelled** approximation (TODO:
/// wire in their own combined-EDF coefficients from Greenhall & Riley 2003).
///
/// Returns `f64::NAN` for degenerate inputs (`N < 4` or `m == 0` or `m`
/// too large relative to `N`), where the Table 5 forms are undefined.
#[must_use]
pub fn edf(noise: NoiseType, n: usize, m: usize, var: VarType) -> f64 {
    // VarType handling: only Allan has exact Table 5 forms. The others are
    // Modelled approximations that fall back to the Allan EDF for now.
    let _ = var; // TODO: per-VarType coefficients (Modified/Hadamard/Total).

    if m == 0 || n < 4 || 2 * m >= n {
        return f64::NAN;
    }
    let nn = n as f64;
    let mm = m as f64;

    match noise.alpha() {
        2 => {
            // White PM
            (nn + 1.0) * (nn - 2.0 * mm) / (2.0 * (nn - mm))
        }
        1 => {
            // Flicker PM
            let a = (nn - 1.0) / (2.0 * mm);
            let b = (2.0 * mm + 1.0) * (nn - 1.0) / 4.0;
            (a.ln() * b.ln()).sqrt().exp()
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

/// Inverse chi-square CDF (quantile): returns `x` such that
/// `P(X <= x) = p` for `X ~ chi-square(dof)`.
///
/// Uses the Wilson-Hilferty approximation (NIST SP 1065 eq. 5-7; Abramowitz &
/// Stegun 26.4.17), which maps a standard-normal quantile `z_p` through a
/// cube-root transform:
///
/// ```text
///   chi2_inv(p, k) = k · ( 1 - 2/(9k) + z_p · sqrt(2/(9k)) )³
/// ```
///
/// The standard-normal quantile `z_p` is computed with Acklam's rational
/// approximation (relative error < 1.15e-9), so no external dependency is
/// required. Accuracy is excellent for `k >= ~1` and `p` not extremely close
/// to 0 or 1, which covers all practical confidence-interval use.
#[must_use]
pub fn chi2_inv(p: f64, dof: f64) -> f64 {
    let z = norm_inv(p);
    let t = 2.0 / (9.0 * dof);
    let base = 1.0 - t + z * t.sqrt();
    dof * base * base * base
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
        1.383577518672690e+02,
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
        let q = (-2.0 * p.ln()).sqrt();
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
        let q = (-2.0 * (1.0 - p).ln()).sqrt();
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
        assert!(rel(edf(NoiseType::RandomWalkFM, 1000, 10, VarType::Allan), 97.23) < 2e-2);
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
