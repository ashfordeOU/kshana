// SPDX-License-Identifier: AGPL-3.0-only
use crate::types::Seconds;
use serde::Serialize;

/// Overlapping Allan deviation from phase samples `phase` (seconds), spaced
/// `tau0` seconds, at averaging factor `m` (so tau = m * tau0). Returns the
/// Allan deviation (dimensionless fractional frequency).
///
/// Riley, NIST SP 1065:
///   sigma_y^2(tau) = 1 / (2 (N-2m) tau^2) * sum_i (x_{i+2m} - 2 x_{i+m} + x_i)^2
pub fn overlapping_adev(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n > 2 * m, "need more than 2m phase samples");
    let tau = m as f64 * tau0;
    let count = n - 2 * m;
    let mut sumsq = 0.0;
    for i in 0..count {
        let d = phase[i + 2 * m] - 2.0 * phase[i + m] + phase[i];
        sumsq += d * d;
    }
    (sumsq / (2.0 * count as f64 * tau * tau)).sqrt()
}

/// One point on an Allan-deviation curve: the averaging time `tau`, the
/// overlapping ADEV at that tau, the number of overlapping differences that went
/// into it (a confidence proxy — fewer samples at long tau), and a
/// noise-type-specific 95% confidence interval. `noise` is the power-law type
/// identified for the whole record (shared by every point); `edf` is that type's
/// effective degrees of freedom at this tau, and `[ci_lo, ci_hi]` the resulting
/// chi-squared band on `adev`. When the record is too short to classify, `noise`
/// is `None` and the interval falls back to the conservative non-overlapping edf.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct AdevPoint {
    pub tau_s: f64,
    pub adev: f64,
    pub n_samples: usize,
    #[serde(default)]
    pub noise: Option<PowerLawNoise>,
    #[serde(default)]
    pub edf: f64,
    #[serde(default)]
    pub ci_lo: f64,
    #[serde(default)]
    pub ci_hi: f64,
}

/// Overlapping ADEV across octave-spaced averaging factors (m = 1, 2, 4, ...),
/// from phase samples spaced `tau0` seconds. The largest tau is capped so each
/// point still averages a useful number of overlapping differences
/// (`n - 2m >= MIN_OVERLAPS`), which keeps the long-tau tail from being a single
/// noisy estimate. Returns an empty vector if there are too few samples.
pub fn overlapping_adev_curve(phase: &[f64], tau0: Seconds) -> Vec<AdevPoint> {
    const MIN_OVERLAPS: usize = 8;
    const CONF: f64 = 0.95;
    let n = phase.len();
    // Identify the noise type once for the whole record; every point's edf and
    // confidence band derive from it.
    let noise = classify_power_law(phase, tau0);
    let mut out = Vec::new();
    let mut m = 1usize;
    while n > 2 * m && (n - 2 * m) >= MIN_OVERLAPS {
        let adev = overlapping_adev(phase, tau0, m);
        let edf = match noise {
            Some(nz) => edf_overlapping_adev(nz, n, m),
            None => conservative_edf(n, m),
        };
        let ci = deviation_ci(adev, edf, CONF);
        out.push(AdevPoint {
            tau_s: m as f64 * tau0,
            adev,
            n_samples: n - 2 * m,
            noise,
            edf,
            ci_lo: ci.lo,
            ci_hi: ci.hi,
        });
        m *= 2;
    }
    out
}

/// Overlapping **modified** Allan deviation (MDEV) at averaging factor `m`, from
/// phase samples spaced `tau0`. MDEV adds an inner average over `m` samples,
/// which lets it separate white phase modulation (slope -3/2) from flicker phase
/// modulation (slope -1) — a distinction the plain ADEV cannot make.
///
/// Riley, NIST SP 1065:
///   mod sigma_y^2(tau) = 1 / (2 m^2 tau^2 (N-3m+1))
///        * sum_j ( sum_{i=j}^{j+m-1} (x_{i+2m} - 2 x_{i+m} + x_i) )^2
pub fn modified_adev(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n > 3 * m, "need at least 3m+1 phase samples for MDEV");
    let tau = m as f64 * tau0;
    let outer = n - 3 * m + 1; // number of outer terms
                               // Initialise the inner second-difference sum for j = 0.
    let second_diff = |i: usize| phase[i + 2 * m] - 2.0 * phase[i + m] + phase[i];
    let mut inner: f64 = (0..m).map(second_diff).sum();
    let mut acc = inner * inner;
    // Slide the inner window: add the new term, drop the oldest. O(N) overall.
    for j in 1..outer {
        inner += second_diff(j + m - 1) - second_diff(j - 1);
        acc += inner * inner;
    }
    let mm = m as f64;
    (acc / (2.0 * mm * mm * tau * tau * outer as f64)).sqrt()
}

/// Time deviation (TDEV), seconds: `TDEV(tau) = tau / sqrt(3) * MDEV(tau)`. The
/// standard time-domain stability measure, derived directly from MDEV.
pub fn time_deviation(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let tau = m as f64 * tau0;
    tau / 3.0_f64.sqrt() * modified_adev(phase, tau0, m)
}

/// Overlapping **Hadamard** deviation (HDEV) at averaging factor `m`. HDEV uses a
/// third difference, so it is **insensitive to linear frequency drift** (it
/// rejects it exactly) and converges for the divergent red-noise types (e.g.
/// frequency random run) where ADEV does not.
///
/// Riley, NIST SP 1065:
///   H sigma_y^2(tau) = 1 / (6 tau^2 (N-3m))
///        * sum_i (x_{i+3m} - 3 x_{i+2m} + 3 x_{i+m} - x_i)^2
pub fn hadamard_adev(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n > 3 * m, "need more than 3m phase samples for HDEV");
    let tau = m as f64 * tau0;
    let count = n - 3 * m;
    let mut sumsq = 0.0;
    for i in 0..count {
        let d = phase[i + 3 * m] - 3.0 * phase[i + 2 * m] + 3.0 * phase[i + m] - phase[i];
        sumsq += d * d;
    }
    (sumsq / (6.0 * tau * tau * count as f64)).sqrt()
}

/// Inverse standard-normal CDF (quantile), Acklam's rational approximation
/// (absolute error < 1.2e-9). Dependency-free; used for confidence intervals.
fn normal_quantile(p: f64) -> f64 {
    assert!(p > 0.0 && p < 1.0, "quantile probability must be in (0,1)");
    // Coefficients.
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
    let phigh = 1.0 - plow;
    if p < plow {
        let q = (-2.0 * p.ln()).sqrt();
        (((((C[0] * q + C[1]) * q + C[2]) * q + C[3]) * q + C[4]) * q + C[5])
            / ((((D[0] * q + D[1]) * q + D[2]) * q + D[3]) * q + 1.0)
    } else if p <= phigh {
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

/// Chi-squared quantile via the Wilson-Hilferty approximation: for `nu` degrees
/// of freedom, `chi2_p(nu) ≈ nu * (1 - 2/(9nu) + z_p * sqrt(2/(9nu)))^3`, where
/// `z_p` is the standard-normal quantile. Adequate for confidence-interval work.
fn chi2_quantile(p: f64, nu: f64) -> f64 {
    let z = normal_quantile(p);
    let t = 2.0 / (9.0 * nu);
    let base = 1.0 - t + z * t.sqrt();
    nu * base * base * base
}

/// A deviation estimate with a confidence interval and its effective degrees of
/// freedom (edf).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct DeviationCi {
    pub dev: f64,
    pub lo: f64,
    pub hi: f64,
    pub edf: f64,
}

/// Chi-squared confidence interval for a deviation estimate `dev` with effective
/// degrees of freedom `edf` at confidence level `conf` (e.g. 0.95). The variance
/// estimate is chi-squared distributed, so
///   [dev * sqrt(edf / chi2_{1-a/2}), dev * sqrt(edf / chi2_{a/2})],  a = 1-conf.
///
/// Pass the edf you trust for the estimator and noise type. For overlapping
/// estimators a *conservative* choice is the count of non-overlapping estimates
/// (see [`conservative_edf`]); the noise-type-specific edf
/// ([`edf_overlapping_adev`]) is tighter and is what [`overlapping_adev_curve`]
/// uses once it has classified the record.
pub fn deviation_ci(dev: f64, edf: f64, conf: f64) -> DeviationCi {
    assert!(edf > 0.0 && conf > 0.0 && conf < 1.0);
    let alpha = 1.0 - conf;
    let chi2_hi = chi2_quantile(1.0 - alpha / 2.0, edf); // upper chi2 -> lower sigma
    let chi2_lo = chi2_quantile(alpha / 2.0, edf); // lower chi2 -> upper sigma
    DeviationCi {
        dev,
        lo: dev * (edf / chi2_hi).sqrt(),
        hi: dev * (edf / chi2_lo).sqrt(),
        edf,
    }
}

/// A conservative effective-degrees-of-freedom estimate for a deviation at
/// averaging factor `m` over `n` phase samples: the number of *non-overlapping*
/// estimates, `floor(n/m) - 1` (at least 1). This under-counts the information an
/// overlapping estimator actually uses, so the resulting interval is wider than
/// (i.e. conservative relative to) a noise-type-specific edf. Use it as the
/// fallback when the dominant noise type is unknown; prefer
/// [`edf_overlapping_adev`] once it has been identified.
pub fn conservative_edf(n: usize, m: usize) -> f64 {
    ((n / m).saturating_sub(1)).max(1) as f64
}

/// The five canonical power-law noise types of a clock, named by the exponent
/// `alpha` of the fractional-frequency power spectral density `S_y(f) ∝ f^alpha`.
/// The noise type sets the slope of the Allan deviation and — the reason it
/// matters here — the *effective degrees of freedom* of a finite overlapping
/// estimate: white PM is information-rich (high edf), random-walk FM is
/// information-poor (low edf) for the very same record length.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum PowerLawNoise {
    /// White phase modulation, `S_y(f) ∝ f^2` (alpha = 2).
    WhitePm,
    /// Flicker phase modulation, `S_y(f) ∝ f^1` (alpha = 1).
    FlickerPm,
    /// White frequency modulation, `S_y(f) ∝ f^0` (alpha = 0).
    WhiteFm,
    /// Flicker frequency modulation, `S_y(f) ∝ f^-1` (alpha = -1).
    FlickerFm,
    /// Random-walk frequency modulation, `S_y(f) ∝ f^-2` (alpha = -2).
    RandomWalkFm,
}

impl PowerLawNoise {
    /// The PSD exponent `alpha` for `S_y(f) ∝ f^alpha` (+2 down to -2).
    pub fn alpha(self) -> i32 {
        match self {
            PowerLawNoise::WhitePm => 2,
            PowerLawNoise::FlickerPm => 1,
            PowerLawNoise::WhiteFm => 0,
            PowerLawNoise::FlickerFm => -1,
            PowerLawNoise::RandomWalkFm => -2,
        }
    }

    /// Classify from a **modified** Allan-deviation log-log slope `mu`
    /// (`MDEV ∝ tau^mu`). MDEV is used rather than ADEV because the plain ADEV
    /// cannot separate white from flicker PM (both ≈ `tau^-1`), whereas MDEV's
    /// slope is one-to-one with the five types: WPM `-3/2`, FPM `-1`, WFM `-1/2`,
    /// FFM `0`, RWFM `+1/2`. The nearest half-integer grid point wins (so `2*mu`
    /// rounds to `-3..=1`), clamped to the modelled range.
    pub fn from_mdev_slope(mu: f64) -> Self {
        match ((2.0 * mu).round() as i32).clamp(-3, 1) {
            -3 => PowerLawNoise::WhitePm,
            -2 => PowerLawNoise::FlickerPm,
            -1 => PowerLawNoise::WhiteFm,
            0 => PowerLawNoise::FlickerFm,
            _ => PowerLawNoise::RandomWalkFm,
        }
    }
}

/// Noise-type-specific effective degrees of freedom for the **overlapping Allan
/// deviation** at averaging factor `m` over `n` phase samples, from the
/// closed-form approximations of Riley, *NIST SP 1065* (Handbook of Frequency
/// Stability Analysis), Table 5 — the same simple-formula set Stable32 reports.
/// Feed the result to [`deviation_ci`] in place of the conservative
/// non-overlapping count once the dominant noise type is known (see
/// [`classify_power_law`]); the interval is correspondingly tighter and
/// noise-aware. Clamped to at least one degree of freedom — the formula can dip
/// below 1 for short flicker-/white-PM records or very large `m`, where one edf
/// is the conservative floor for a usable interval.
pub fn edf_overlapping_adev(noise: PowerLawNoise, n: usize, m: usize) -> f64 {
    let nn = n as f64;
    let mm = m as f64;
    let edf = match noise {
        PowerLawNoise::WhitePm => (nn + 1.0) * (nn - 2.0 * mm) / (2.0 * (nn - mm)),
        PowerLawNoise::FlickerPm => {
            let a = (nn - 1.0) / mm;
            let b = (2.0 * mm + 1.0) * (nn - 1.0) / 4.0;
            (a.ln() * b.ln()).sqrt().exp()
        }
        PowerLawNoise::WhiteFm => {
            (3.0 * (nn - 1.0) / (2.0 * mm) - 2.0 * (nn - 2.0) / nn)
                * (4.0 * mm * mm / (4.0 * mm * mm + 5.0))
        }
        PowerLawNoise::FlickerFm => {
            if m == 1 {
                2.0 * (nn - 2.0) / (2.3 * nn - 4.9)
            } else {
                5.0 * nn * nn / (4.0 * mm * (nn + 3.0 * mm))
            }
        }
        PowerLawNoise::RandomWalkFm => {
            let nm1 = nn - 1.0;
            let a = (nn - 2.0) / (mm * nm1 * nm1);
            let b = nm1 * nm1 - 3.0 * mm * nm1 + 4.0 * mm * mm;
            a * b
        }
    };
    edf.max(1.0)
}

/// Identify the dominant power-law noise type of a phase record from the
/// least-squares log-log slope of its **modified** Allan deviation across
/// octave-spaced averaging factors. Returns `None` when there are too few
/// samples for a stable fit (fewer than three usable MDEV points). See
/// [`PowerLawNoise::from_mdev_slope`] for why MDEV (not ADEV) is used.
pub fn classify_power_law(phase: &[f64], tau0: Seconds) -> Option<PowerLawNoise> {
    let n = phase.len();
    let mut pts: Vec<(f64, f64)> = Vec::new();
    let mut m = 1usize;
    while n > 3 * m && (n - 3 * m + 1) >= 8 {
        let md = modified_adev(phase, tau0, m);
        if md > 0.0 {
            pts.push(((m as f64 * tau0).log10(), md.log10()));
        }
        m *= 2;
    }
    if pts.len() < 3 {
        return None;
    }
    let k = pts.len() as f64;
    let sx: f64 = pts.iter().map(|p| p.0).sum();
    let sy: f64 = pts.iter().map(|p| p.1).sum();
    let sxx: f64 = pts.iter().map(|p| p.0 * p.0).sum();
    let sxy: f64 = pts.iter().map(|p| p.0 * p.1).sum();
    let slope = (k * sxy - sx * sy) / (k * sxx - sx * sx);
    Some(PowerLawNoise::from_mdev_slope(slope))
}

// ─────────────────────────────────────────────────────────────────────────────
// Extended-range / long-tau estimators: Theo1 (+ bias-removed ThêoH) and TOTVAR.
//
// The five estimators above run out near tau ≈ N/2·tau0 (ADEV) or N/3·tau0
// (HDEV) and their long-tau tail is a single noisy point. The two below push the
// useful range out toward ~75% of the record and tighten the long-tau confidence:
//   * Theo1 (Howe & Peppler) — a two-sample variance over an even averaging
//     factor with an effective tau of 0.75·m·tau0, plus its bias-removed ThêoH;
//   * TOTVAR (Greenhall/Howe) — the Allan second difference taken over a phase
//     series mirror-reflected at both ends, which removes the end effects that
//     inflate the plain ADEV's long-tau scatter.
// Both reduce to the overlapping ADEV at the short-tau end (TOTVAR exactly at
// m = 1), the closed-form/identity oracle the unit tests lean on.
// ─────────────────────────────────────────────────────────────────────────────

/// Effective averaging time of the Theo1 statistic at averaging factor `m`:
/// `tau = 0.75·m·tau0`. Theo1 carries a 0.75 normalisation (Howe & Peppler) so
/// that it estimates the Allan variance at this *effective* tau rather than at
/// `m·tau0` — which is why its even-`m` ladder usefully reaches ~0.75·N·tau0,
/// past where the plain Allan deviation gives out near ~0.5·N·tau0.
pub fn theo1_tau(tau0: Seconds, m: usize) -> f64 {
    0.75 * m as f64 * tau0
}

/// Theo1 deviation at the (even) averaging factor `m` from phase samples spaced
/// `tau0`. Theo1 (Howe & Peppler) is a two-sample variance with an extended
/// averaging-factor range — even `m`, `2 <= m <= N-1` — and better long-tau
/// confidence than the plain Allan deviation, whose value it estimates at the
/// *effective* averaging time `tau = 0.75·m·tau0` ([`theo1_tau`]). Raw Theo1 is
/// already unbiased for white FM (the reason for the 0.75 factor); for other
/// noise types use the bias-removed [`theo_br`].
///
/// Riley, NIST SP 1065 (eq 30) / Howe & Peppler:
///   Theo1^2(m,tau0) = 1 / (0.75 (N-m) (m tau0)^2)
///       * sum_{i=0}^{N-m-1} sum_{d=0}^{m/2-1}
///           (1/(m/2 - d)) * ( (x_i - x_{i+m/2-d}) + (x_{i+m} - x_{i+m/2+d}) )^2
pub fn theo1(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(
        m >= 2 && m % 2 == 0,
        "Theo1 requires an even averaging factor m >= 2"
    );
    assert!(n > m, "need more than m phase samples for Theo1");
    let half = m / 2;
    let count = n - m; // number of outer terms
    let mut acc = 0.0;
    for i in 0..count {
        let mut inner = 0.0;
        for d in 0..half {
            // 1/(m/2 - d) weights the inner pair; (m/2 - d) ranges m/2 .. 1.
            let w = 1.0 / (half - d) as f64;
            let term = (phase[i] - phase[i + half - d]) + (phase[i + m] - phase[i + half + d]);
            inner += w * term * term;
        }
        acc += inner;
    }
    let tau = m as f64 * tau0;
    (acc / (0.75 * count as f64 * tau * tau)).sqrt()
}

/// Theo1 deviation across octave-spaced even averaging factors
/// (`m = 2, 4, 8, …, <= N-1`), each carried at its effective tau `0.75·m·tau0`.
/// The companion to [`overlapping_adev_curve`] for the long-tau region. (An octave
/// grid keeps this O(N²) overall; the full even-`m` ladder would be O(N³) and is
/// rarely needed for a stability plot.)
pub fn theo1_curve(phase: &[f64], tau0: Seconds) -> Vec<AdevPoint> {
    let n = phase.len();
    let mut out = Vec::new();
    if n < 3 {
        return out;
    }
    let mut m = 2usize;
    while m < n {
        out.push(AdevPoint {
            tau_s: theo1_tau(tau0, m),
            adev: theo1(phase, tau0, m),
            n_samples: n - m,
            noise: None,
            edf: 0.0,
            ci_lo: 0.0,
            ci_hi: 0.0,
        });
        m *= 2;
    }
    out
}

/// The TheoBR bias-correction factor for a phase record: the average ratio of the
/// overlapping Allan variance to the Theo1 variance over the record's available
/// averaging factors (Howe & Peppler 2003; Riley, NIST SP 1065). It scales raw
/// Theo1 onto the Allan-variance scale without first identifying the noise type:
///   k = floor(N/6) - 3
///   bias = 1/(k+1) · sum_{i=0}^{k} AVAR(9+3i) / Theo1(12+4i)
/// The (9+3i, 12+4i) pairing is chosen so that the *expected* ratio is exactly
/// `0.75·(12+4i)/(9+3i) = 1` for white FM — i.e. raw Theo1 already needs no
/// correction there — while it differs from 1 for redder/whiter spectra and so
/// removes their Theo1 bias. Returns 1.0 for records too short to form the average
/// (`N < 24`). MODELLED — see [`theo_br`].
pub fn theo_br_bias(phase: &[f64], tau0: Seconds) -> f64 {
    let n = phase.len();
    if n < 24 {
        return 1.0;
    }
    let kmax = (n / 6).saturating_sub(3); // upper index of the averaging sum
    let mut sum = 0.0;
    let mut count = 0.0;
    for i in 0..=kmax {
        let k_av = 9 + 3 * i; // overlapping-ADEV averaging factor
        let k_th = 12 + 4 * i; // Theo1 averaging factor (always even)
                               // Guard the estimators' own domain (ADEV needs N>2m, Theo1 needs N>m).
        if n <= 2 * k_av || n <= k_th {
            break;
        }
        let avar = overlapping_adev(phase, tau0, k_av).powi(2);
        let theo = theo1(phase, tau0, k_th).powi(2);
        if theo > 0.0 {
            sum += avar / theo;
            count += 1.0;
        }
    }
    if count > 0.0 {
        sum / count
    } else {
        1.0
    }
}

/// Bias-removed Theo1 (ThêoH's long-tau kernel) deviation at even averaging
/// factor `m`: raw [`theo1`] scaled by the record's [`theo_br_bias`] factor, which
/// removes Theo1's noise-type-dependent bias relative to the Allan variance
/// without first classifying the noise. Carried at the Theo1 effective tau
/// `0.75·m·tau0`. MODELLED: the bias factor is a finite-record statistical estimate
/// (Howe & Peppler 2003; Riley, NIST SP 1065), not an externally validated quantity.
pub fn theo_br(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let t1 = theo1(phase, tau0, m);
    (theo_br_bias(phase, tau0) * t1 * t1).sqrt()
}

/// One point on a ThêoH (Theo-Hybrid) stability curve.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct TheoHPoint {
    /// Averaging time (s). In the Allan region this is `m·tau0`; in the Theo
    /// region it is the Theo1 effective tau `0.75·m·tau0`.
    pub tau_s: f64,
    /// ThêoH deviation: the overlapping Allan deviation in the short-tau region,
    /// the bias-removed Theo1 ([`theo_br`]) in the long-tau region.
    pub dev: f64,
    /// Analysis-point count behind the estimate (a confidence proxy that falls
    /// with tau): `N-2m` in the Allan region, `N-m` in the Theo region.
    pub n_samples: usize,
    /// `true` when this point is bias-removed Theo1 (long tau); `false` when it is
    /// the overlapping Allan deviation (short tau).
    pub from_theo: bool,
}

/// ThêoH (Howe) stability curve: the overlapping Allan deviation at short tau
/// joined to bias-removed Theo1 ([`theo_br`]) at long tau, so the curve reaches
/// ~0.75·N·tau0 — where the plain ADEV gives out near ~0.5·N·tau0 with a single
/// noisy point. The crossover (octave ADEV up to averaging factor ~N/10, then
/// even-`m` bias-removed Theo1 beyond) is a documented heuristic, not a uniquely
/// defined quantity, so this is a MODELLED construction. Returns an empty vector
/// for records too short to form a Theo region (`N < 24`).
pub fn theoh_curve(phase: &[f64], tau0: Seconds) -> Vec<TheoHPoint> {
    let n = phase.len();
    let mut out = Vec::new();
    if n < 24 {
        return out;
    }
    // Short-tau Allan region: octave m = 1, 2, 4, … up to ~N/10.
    let adev_max_m = (n / 10).max(1);
    let mut m = 1usize;
    while m <= adev_max_m && n > 2 * m {
        out.push(TheoHPoint {
            tau_s: m as f64 * tau0,
            dev: overlapping_adev(phase, tau0, m),
            n_samples: n - 2 * m,
            from_theo: false,
        });
        m *= 2;
    }
    // Long-tau Theo region: even m from just past the Allan crossover up to N-1,
    // on an octave-ish effective-tau grid. The bias factor is computed once.
    let bias = theo_br_bias(phase, tau0);
    let last_tau = out.last().map(|p| p.tau_s).unwrap_or(tau0);
    // First even m whose effective tau 0.75·m·tau0 exceeds the last Allan tau.
    let mut em = (((last_tau / tau0) / 0.75).ceil() as usize).max(2);
    if em % 2 == 1 {
        em += 1;
    }
    // Largest even averaging factor <= N-1: the terminal Theo point so the curve
    // always reaches ~0.75·(N-1)·tau0 rather than stopping short on the octave grid.
    let em_max = (n - 1) & !1usize;
    let mut last_em = 0usize;
    while em <= em_max {
        let t1 = theo1(phase, tau0, em);
        out.push(TheoHPoint {
            tau_s: theo1_tau(tau0, em),
            dev: (bias * t1 * t1).sqrt(),
            n_samples: n - em,
            from_theo: true,
        });
        last_em = em;
        // Octave-ish growth in the effective tau, kept even.
        let next = (em * 2).max(em + 2);
        em = if next % 2 == 0 { next } else { next + 1 };
    }
    // Cap the curve at the terminal averaging factor if the octave grid stopped short.
    if em_max >= 2 && last_em < em_max {
        let t1 = theo1(phase, tau0, em_max);
        out.push(TheoHPoint {
            tau_s: theo1_tau(tau0, em_max),
            dev: (bias * t1 * t1).sqrt(),
            n_samples: n - em_max,
            from_theo: true,
        });
    }
    out
}

/// Total deviation (TOTVAR) at averaging factor `m` from phase samples spaced
/// `tau0`. TOTVAR extends the overlapping Allan deviation to long tau (up to
/// `m = N-1`, ~the full record) with tighter long-tau confidence, by taking the
/// Allan second difference over the *interior* points of a phase series that has
/// been mirror-reflected about each endpoint — which removes the end effects that
/// inflate the plain ADEV's long-tau scatter. It equals the overlapping ADEV
/// exactly at `m = 1`, and is an unbiased estimator of the Allan variance for
/// white FM.
///
/// Greenhall/Howe; Riley, NIST SP 1065 (eq 25): reflect `x` to `x*` of length
/// `3N-4` (`x*_{1-j} = 2x_1 - x_{1+j}`, `x*_{N+j} = 2x_N - x_{N-j}`), then
///   TOTVAR^2(m,tau0) = 1 / (2 (m tau0)^2 (N-2))
///       * sum_{i=2}^{N-1} (x*_{i-m} - 2 x*_i + x*_{i+m})^2.
pub fn total_deviation(phase: &[f64], tau0: Seconds, m: usize) -> f64 {
    let n = phase.len();
    assert!(m >= 1, "m must be >= 1");
    assert!(n >= 3, "need at least 3 phase samples for TOTVAR");
    assert!(m < n, "TOTVAR requires m <= N-1");
    // Build the reflected extension x* of length 3N-4: the record mirrored about
    // each endpoint, with the original record in the centre at offset N-2.
    let ext_len = 3 * n - 4;
    let mut x = vec![0.0_f64; ext_len];
    // Left reflection x*_{1-j} = 2x_1 - x_{1+j}, stored reversed: index k holds
    // 2·x[0] - x[N-2-k] for k = 0..N-2.
    for (k, slot) in x.iter_mut().take(n - 2).enumerate() {
        *slot = 2.0 * phase[0] - phase[n - 2 - k];
    }
    // Original record in the centre.
    x[(n - 2)..(2 * n - 2)].copy_from_slice(phase);
    // Right reflection x*_{N+j} = 2x_N - x_{N-j}: index 2N-2+k holds
    // 2·x[N-1] - x[N-2-k] for k = 0..N-2.
    for k in 0..(n - 2) {
        x[2 * n - 2 + k] = 2.0 * phase[n - 1] - phase[n - 2 - k];
    }
    let mid = n - 2; // offset of the original record = length of the left reflection
    let mut acc = 0.0;
    // Second difference over the N-2 interior original points (centre index
    // c = mid+1+j maps to original phase indices 1..N-2).
    for j in 0..(n - 2) {
        let c = mid + 1 + j;
        let v = x[c - m] - 2.0 * x[c] + x[c + m];
        acc += v * v;
    }
    let tau = m as f64 * tau0;
    (acc / (2.0 * tau * tau * (n - 2) as f64)).sqrt()
}

/// Total deviation across octave-spaced averaging factors (`m = 1, 2, 4, …`), the
/// long-tau-robust companion to [`overlapping_adev_curve`]. The grid runs up to
/// `m <= N-1` (TOTVAR's full range), so it carries useful points well past where
/// the ADEV curve's `MIN_OVERLAPS` floor stops.
pub fn total_deviation_curve(phase: &[f64], tau0: Seconds) -> Vec<AdevPoint> {
    let n = phase.len();
    let mut out = Vec::new();
    if n < 3 {
        return out;
    }
    let mut m = 1usize;
    while m < n {
        out.push(AdevPoint {
            tau_s: m as f64 * tau0,
            adev: total_deviation(phase, tau0, m),
            n_samples: n - 2,
            noise: None,
            edf: 0.0,
            ci_lo: 0.0,
            ci_hi: 0.0,
        });
        m *= 2;
    }
    out
}

/// One point on an [`mtie_curve`]: the observation window `tau = m·tau0`, the MTIE
/// over that window (seconds), and the number of window positions that went into it.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct MtiePoint {
    pub tau_s: f64,
    pub mtie_s: f64,
    pub n_windows: usize,
}

/// **Maximum Time Interval Error (MTIE)** for an observation window of `m+1`
/// consecutive phase/time-error samples (so `tau = m·tau0`), from phase samples
/// `phase` in seconds.
///
/// MTIE is the largest peak-to-peak time-error swing seen within a sliding window of
/// `m+1` samples, maximised over every window position:
///
/// > MTIE(τ) = maxₖ [ max_{k ≤ i ≤ k+m} xᵢ − min_{k ≤ i ≤ k+m} xᵢ ].
///
/// It is the wander metric of ITU-T G.810 / G.823 / G.8261 — a bound on the worst
/// time-interval error a clock can accumulate over *any* interval of length τ, and
/// the quantity synchronisation network limits (MTIE masks) are written against.
/// Unlike the Allan-family deviations, MTIE is an **extremal** (max/min) statistic:
/// it is set by the single worst excursion in the record, not an RMS average, so it
/// grows monotonically with τ and never averages a transient away.
///
/// The value is independent of `tau0` (it is a peak swing in the phase's own units);
/// `tau0` only labels the averaging time in [`mtie_curve`]. Panics if `m < 1` or
/// there are fewer than `m+1` samples.
pub fn mtie(phase: &[f64], m: usize) -> f64 {
    assert!(m >= 1, "m must be >= 1");
    let win = m + 1;
    assert!(
        phase.len() >= win,
        "need at least m+1 phase samples for MTIE"
    );
    let mut worst = 0.0_f64;
    for seg in phase.windows(win) {
        let mut lo = f64::INFINITY;
        let mut hi = f64::NEG_INFINITY;
        for &x in seg {
            lo = lo.min(x);
            hi = hi.max(x);
        }
        worst = worst.max(hi - lo);
    }
    worst
}

/// MTIE across octave-spaced observation windows (`m = 1, 2, 4, …`), from phase
/// samples spaced `tau0` seconds. Each point carries `tau = m·tau0` and the MTIE over
/// that window; the grid runs while a full `m+1`-sample window still fits. Because
/// MTIE is monotone non-decreasing in τ, this is the telecom-wander companion to the
/// Allan-family curves.
pub fn mtie_curve(phase: &[f64], tau0: Seconds) -> Vec<MtiePoint> {
    let n = phase.len();
    let mut out = Vec::new();
    let mut m = 1usize;
    while m < n {
        out.push(MtiePoint {
            tau_s: m as f64 * tau0,
            mtie_s: mtie(phase, m),
            n_windows: n - m,
        });
        m *= 2;
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn linear_phase_has_zero_adev() {
        // Constant frequency => second differences are zero => ADEV = 0.
        let phase = [0.0, 2.0, 4.0, 6.0, 8.0];
        assert_eq!(overlapping_adev(&phase, 1.0, 1), 0.0);
    }

    #[test]
    fn mtie_hand_derived() {
        // phase = [0,1,3,2,5]:
        //  m=1 (2-sample windows): swings |1-0|,|3-1|,|2-3|,|5-2| = 1,2,1,3 -> 3
        //  m=2 (3-sample windows): {0,1,3}=3, {1,3,2}=2, {3,2,5}=3 -> 3
        //  m=4 (whole 5-sample record): max-min = 5-0 = 5
        let phase = [0.0, 1.0, 3.0, 2.0, 5.0];
        assert_eq!(mtie(&phase, 1), 3.0);
        assert_eq!(mtie(&phase, 2), 3.0);
        assert_eq!(mtie(&phase, 4), 5.0);
    }

    #[test]
    fn mtie_is_monotone_nondecreasing_in_tau() {
        // MTIE can only grow as the window widens (a wider window contains every
        // narrower one), so the curve is monotone non-decreasing.
        let phase = white_fm_phase(3.0e-12, 200, 11);
        let curve = mtie_curve(&phase, 1.0);
        assert!(curve.len() >= 3);
        for w in curve.windows(2) {
            assert!(
                w[1].mtie_s >= w[0].mtie_s - 1e-18,
                "MTIE dropped from {} to {} as tau grew",
                w[0].mtie_s,
                w[1].mtie_s
            );
        }
    }

    #[test]
    fn mtie_linear_phase_equals_full_swing() {
        // A pure ramp x_i = a·i has, over any (m+1)-window, swing a·m; the max over
        // all positions is still a·m, so MTIE(m) = a·m exactly.
        let a = 2.5;
        let phase: Vec<f64> = (0..20).map(|i| a * i as f64).collect();
        for m in [1usize, 2, 4, 8] {
            assert!((mtie(&phase, m) - a * m as f64).abs() < 1e-12);
        }
    }

    #[test]
    fn hand_derived_adev() {
        // phase = [0,1,3,6], tau0=1, m=1, N=4:
        // second diffs: (3-2+0)=1, (6-6+1)=1 -> sumsq=2
        // sigma^2 = 1/(2*(4-2)*1^2)*2 = 0.5 -> ADEV = sqrt(0.5) = 1/sqrt(2)
        let phase = [0.0, 1.0, 3.0, 6.0];
        let adev = overlapping_adev(&phase, 1.0, 1);
        assert!(
            (adev - std::f64::consts::FRAC_1_SQRT_2).abs() < 1e-12,
            "adev={adev}"
        );
    }

    #[test]
    fn linear_frequency_drift_adev_is_exact() {
        // Deterministic signal: a linear fractional-frequency drift y(t) = a*t gives a
        // quadratic phase x(t) = 0.5*a*t^2. Its Allan deviation is exactly a*tau/sqrt(2)
        // (Riley, NIST SP 1065) at every averaging time — a closed-form check on the
        // estimator that does not depend on any noise realisation.
        let a = 3.0e-12; // fractional frequency drift per second
        let tau0 = 1.0;
        let n = 4096;
        let phase: Vec<f64> = (0..n)
            .map(|i| {
                let t = i as f64 * tau0;
                0.5 * a * t * t
            })
            .collect();
        for &m in &[1usize, 2, 4, 16, 64, 256] {
            let tau = m as f64 * tau0;
            let expect = a * tau / std::f64::consts::SQRT_2;
            let got = overlapping_adev(&phase, tau0, m);
            assert!(
                (got - expect).abs() / expect < 1e-9,
                "m={m}: adev={got} vs exact {expect}"
            );
        }
    }

    #[test]
    fn adev_curve_is_octave_spaced_with_decreasing_overlaps() {
        // The curve walks m = 1, 2, 4, ... so tau doubles each point, and the overlap
        // count strictly decreases; for a linear-drift phase the ADEV rises as tau
        // (slope +1 in log-log: doubling tau doubles the deviation).
        let a = 1.0e-12;
        let phase: Vec<f64> = (0..1000)
            .map(|i| {
                let t = i as f64;
                0.5 * a * t * t
            })
            .collect();
        let curve = overlapping_adev_curve(&phase, 1.0);
        assert!(curve.len() >= 5, "curve too short: {}", curve.len());
        for w in curve.windows(2) {
            assert!(
                (w[1].tau_s / w[0].tau_s - 2.0).abs() < 1e-9,
                "tau not octave-spaced"
            );
            assert!(
                w[1].n_samples < w[0].n_samples,
                "overlap count should decrease"
            );
            // ADEV ~ a*tau/sqrt2, so doubling tau doubles ADEV.
            assert!(
                (w[1].adev / w[0].adev - 2.0).abs() < 1e-6,
                "drift ADEV slope != +1"
            );
        }
        // Every reported tau keeps at least the minimum overlap count.
        assert!(curve.iter().all(|p| p.n_samples >= 8));
    }

    // ---------------------------------------------------------------------
    // Independent validation
    //
    // The tests below check the estimator against (a) a second, independently
    // coded estimator (the classic *non-overlapping* Allan deviation), (b) the
    // closed-form power-law slopes of canonical clock noise types, and (c)
    // algebraic invariances the statistic must satisfy. None of them reuse the
    // production estimator as their own reference.
    // ---------------------------------------------------------------------

    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    /// Classic *non-overlapping* Allan deviation, coded independently of
    /// `overlapping_adev`: average the fractional frequency over disjoint blocks
    /// of `m` samples, then take the variance of successive differences.
    ///
    ///   ybar_k = (x_{(k+1)m} - x_{km}) / (m*tau0)
    ///   sigma_y^2(tau) = 1/(2(K-1)) * sum_k (ybar_{k+1} - ybar_k)^2,  K = floor(N/m)-1
    fn nonoverlapping_adev(phase: &[f64], tau0: f64, m: usize) -> f64 {
        let tau = m as f64 * tau0;
        let blocks = phase.len() / m; // number of disjoint frequency averages available
        assert!(blocks >= 3, "need at least 3 frequency blocks");
        let ybar: Vec<f64> = (0..blocks)
            .map(|k| (phase[(k + 1) * m] - phase[k * m]) / tau)
            .take(blocks - 1) // last index (k+1)*m must be in range
            .collect();
        let mut sumsq = 0.0;
        for w in ybar.windows(2) {
            let d = w[1] - w[0];
            sumsq += d * d;
        }
        (sumsq / (2.0 * (ybar.len() - 1) as f64)).sqrt()
    }

    /// Phase samples (s) from iid white *frequency* noise: each 1-s sample has a
    /// fractional frequency drawn N(0, sigma0), integrated to phase. White FM by
    /// construction, so sigma_y(tau) = sigma0 / sqrt(tau) exactly in expectation.
    fn white_fm_phase(sigma0: f64, n: usize, seed: u64) -> Vec<f64> {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let dist = Normal::new(0.0, sigma0).unwrap();
        let mut x = 0.0;
        let mut phase = Vec::with_capacity(n);
        phase.push(0.0);
        for _ in 1..n {
            let y = dist.sample(&mut rng); // fractional frequency over this 1-s step
            x += y; // tau0 = 1 s, so phase increment = y * 1 s
            phase.push(x);
        }
        phase
    }

    /// Best-fit slope of log10(adev) vs log10(tau) over a curve, by ordinary
    /// least squares — the log-log slope that identifies the dominant noise type.
    fn loglog_slope(curve: &[AdevPoint]) -> f64 {
        let n = curve.len() as f64;
        let xs: Vec<f64> = curve.iter().map(|p| p.tau_s.log10()).collect();
        let ys: Vec<f64> = curve.iter().map(|p| p.adev.log10()).collect();
        let sx: f64 = xs.iter().sum();
        let sy: f64 = ys.iter().sum();
        let sxx: f64 = xs.iter().map(|x| x * x).sum();
        let sxy: f64 = xs.iter().zip(&ys).map(|(x, y)| x * y).sum();
        (n * sxy - sx * sy) / (n * sxx - sx * sx)
    }

    #[test]
    fn overlapping_matches_nonoverlapping_estimator_on_drift() {
        // On a deterministic quadratic phase (linear frequency drift) BOTH
        // estimators must return the exact closed form a*tau/sqrt(2). Agreement
        // between two independently coded estimators is a strong correctness check
        // that does not lean on any single implementation.
        let a = 2.5e-12;
        let tau0 = 1.0;
        let n = 4096;
        let phase: Vec<f64> = (0..n)
            .map(|i| {
                let t = i as f64 * tau0;
                0.5 * a * t * t
            })
            .collect();
        for &m in &[1usize, 2, 8, 64] {
            let ov = overlapping_adev(&phase, tau0, m);
            let nov = nonoverlapping_adev(&phase, tau0, m);
            let exact = a * (m as f64 * tau0) / std::f64::consts::SQRT_2;
            assert!(
                (ov - exact).abs() / exact < 1e-9,
                "m={m}: overlapping {ov} vs exact {exact}"
            );
            assert!(
                (nov - exact).abs() / exact < 1e-9,
                "m={m}: non-overlapping {nov} vs exact {exact}"
            );
        }
    }

    #[test]
    fn white_fm_magnitude_matches_sigma0_over_sqrt_tau() {
        // White FM: sigma_y(tau) = sigma0 / sqrt(tau). Seed-average the variance
        // to cut the estimator's own scatter, then compare to the closed form.
        let sigma0 = 4.0e-12;
        let n = 16384;
        for &m in &[1usize, 4, 16, 64] {
            let mut var_sum = 0.0;
            let seeds = [11u64, 22, 33, 44, 55, 66, 77, 88];
            for &s in &seeds {
                let phase = white_fm_phase(sigma0, n, s);
                let a = overlapping_adev(&phase, 1.0, m);
                var_sum += a * a;
            }
            let adev = (var_sum / seeds.len() as f64).sqrt();
            let expect = sigma0 / (m as f64).sqrt();
            let rel = (adev - expect).abs() / expect;
            assert!(
                rel < 0.1,
                "m={m}: white-FM adev={adev} vs {expect}, rel={rel}"
            );
        }
    }

    #[test]
    fn white_fm_loglog_slope_is_minus_half() {
        // White FM has ADEV ~ tau^(-1/2): a log-log slope of -0.5.
        let phase = white_fm_phase(3.0e-12, 1 << 15, 12345);
        let curve = overlapping_adev_curve(&phase, 1.0);
        let slope = loglog_slope(&curve);
        assert!(
            (slope + 0.5).abs() < 0.07,
            "white-FM log-log slope = {slope}, want -0.5"
        );
    }

    #[test]
    fn random_walk_fm_loglog_slope_is_plus_half() {
        // Random-walk FM (integrate white FM once more) has ADEV ~ tau^(+1/2):
        // a log-log slope of +0.5.
        let mut rng = ChaCha8Rng::seed_from_u64(99);
        let dist = Normal::new(0.0, 1.0e-13).unwrap();
        let n = 1 << 15;
        let mut y = 0.0; // random-walk frequency
        let mut x = 0.0;
        let mut phase = Vec::with_capacity(n);
        phase.push(0.0);
        for _ in 1..n {
            y += dist.sample(&mut rng); // frequency does a random walk
            x += y;
            phase.push(x);
        }
        let curve = overlapping_adev_curve(&phase, 1.0);
        let slope = loglog_slope(&curve);
        assert!(
            (slope - 0.5).abs() < 0.1,
            "RW-FM log-log slope = {slope}, want +0.5"
        );
    }

    #[test]
    fn adev_is_scale_linear() {
        // Scaling the phase record by k scales the ADEV by k (it is a linear
        // functional of the second differences).
        let phase = white_fm_phase(1.0e-12, 4096, 7);
        let scaled: Vec<f64> = phase.iter().map(|x| 3.0 * x).collect();
        for &m in &[1usize, 3, 9] {
            let base = overlapping_adev(&phase, 1.0, m);
            let big = overlapping_adev(&scaled, 1.0, m);
            assert!(
                (big - 3.0 * base).abs() / (3.0 * base) < 1e-12,
                "scale linearity broke at m={m}"
            );
        }
    }

    #[test]
    fn adev_ignores_constant_offset_and_frequency_offset() {
        // The second difference x_{i+2m} - 2 x_{i+m} + x_i annihilates any
        // constant phase offset and any constant frequency (linear phase) term,
        // so adding c0 + c1*t to the record must not change the ADEV.
        let phase = white_fm_phase(2.0e-12, 4096, 21);
        // Offsets of the same order as the phase record itself: a larger c0 (e.g.
        // a 5-second constant on picosecond data) would cancel exactly in real
        // arithmetic but f64 cannot represent x + c0 without losing the small term.
        let c0 = 1.0e-9;
        let c1 = 1.0e-12;
        let shifted: Vec<f64> = phase
            .iter()
            .enumerate()
            .map(|(i, x)| x + c0 + c1 * i as f64)
            .collect();
        for &m in &[1usize, 2, 7, 31] {
            let base = overlapping_adev(&phase, 1.0, m);
            let got = overlapping_adev(&shifted, 1.0, m);
            assert!(
                (got - base).abs() / base < 1e-9,
                "offset/frequency invariance broke at m={m}"
            );
        }
    }

    #[test]
    fn curve_overlap_count_is_n_minus_2m_and_taus_are_octaves() {
        // The reported confidence proxy must be exactly N-2m, and the averaging
        // times must be the octave grid tau = m*tau0 with m = 1,2,4,...
        let phase = white_fm_phase(1.0e-12, 5000, 3);
        let tau0 = 0.5;
        let curve = overlapping_adev_curve(&phase, tau0);
        let mut m = 1usize;
        for p in &curve {
            assert_eq!(
                p.n_samples,
                phase.len() - 2 * m,
                "overlap count wrong at m={m}"
            );
            assert!(
                (p.tau_s - m as f64 * tau0).abs() < 1e-12,
                "tau off the octave grid at m={m}"
            );
            m *= 2;
        }
    }

    #[test]
    fn curve_is_empty_for_too_few_samples() {
        // With MIN_OVERLAPS = 8, a 9-sample record yields exactly one usable
        // point (m=1: 9-2=7 < 8 fails) so the curve is empty; an 8-sample record
        // is empty too. Guards against a panic / spurious point on short records.
        assert!(overlapping_adev_curve(&[0.0; 8], 1.0).is_empty());
        assert!(overlapping_adev_curve(&[0.0; 9], 1.0).is_empty());
        assert!(!overlapping_adev_curve(&[0.0; 10], 1.0).is_empty());
    }

    #[test]
    fn curve_is_deterministic_for_identical_input() {
        // Same phase record in, byte-identical curve out (no hidden global state).
        let phase = white_fm_phase(1.0e-12, 4096, 555);
        let a = overlapping_adev_curve(&phase, 1.0);
        let b = overlapping_adev_curve(&phase, 1.0);
        assert_eq!(a, b);
    }

    // ---------------------------------------------------------------------
    // MDEV / TDEV / HDEV and confidence intervals
    // ---------------------------------------------------------------------

    fn loglog_slope_of<F: Fn(&[f64], f64, usize) -> f64>(phase: &[f64], f: F) -> f64 {
        let pts: Vec<(f64, f64)> = [1usize, 2, 4, 8, 16, 32, 64]
            .iter()
            .map(|&m| (m as f64, f(phase, 1.0, m)))
            .filter(|&(_, v)| v > 0.0)
            .collect();
        let n = pts.len() as f64;
        let xs: Vec<f64> = pts.iter().map(|p| p.0.log10()).collect();
        let ys: Vec<f64> = pts.iter().map(|p| p.1.log10()).collect();
        let sx: f64 = xs.iter().sum();
        let sy: f64 = ys.iter().sum();
        let sxx: f64 = xs.iter().map(|x| x * x).sum();
        let sxy: f64 = xs.iter().zip(&ys).map(|(x, y)| x * y).sum();
        (n * sxy - sx * sy) / (n * sxx - sx * sx)
    }

    #[test]
    fn mdev_hand_derived_small_case() {
        // m=1: MDEV reduces to ADEV (the inner average is a single term), so on a
        // hand example MDEV(m=1) must equal overlapping_adev(m=1).
        let phase = [0.0, 1.0, 3.0, 6.0, 10.0, 15.0];
        let md = modified_adev(&phase, 1.0, 1);
        let ad = overlapping_adev(&phase, 1.0, 1);
        assert!(
            (md - ad).abs() < 1e-12,
            "MDEV(m=1) {md} should equal ADEV(m=1) {ad}"
        );
    }

    #[test]
    fn tdev_is_tau_over_sqrt3_times_mdev() {
        let phase = white_fm_phase(2.0e-12, 8192, 4);
        for &m in &[1usize, 4, 16] {
            let tau = m as f64;
            let expect = tau / 3.0_f64.sqrt() * modified_adev(&phase, 1.0, m);
            assert!((time_deviation(&phase, 1.0, m) - expect).abs() < 1e-18 * expect.max(1e-18));
        }
    }

    #[test]
    fn mdev_white_fm_slope_is_minus_half() {
        // For white FM, MDEV and ADEV share the tau^(-1/2) slope.
        let phase = white_fm_phase(3.0e-12, 1 << 14, 1234);
        let slope = loglog_slope_of(&phase, modified_adev);
        assert!(
            (slope + 0.5).abs() < 0.1,
            "MDEV white-FM slope {slope}, want -0.5"
        );
    }

    #[test]
    fn hadamard_rejects_linear_frequency_drift() {
        // HDEV uses a third difference, which annihilates a quadratic phase (a pure
        // linear frequency drift) exactly — so HDEV of a drift is ~0 while ADEV is
        // a*tau/sqrt(2). This is the defining advantage of the Hadamard variance.
        let a = 5.0e-12;
        let phase: Vec<f64> = (0..2048)
            .map(|i| 0.5 * a * (i as f64) * (i as f64))
            .collect();
        for &m in &[1usize, 4, 16] {
            let h = hadamard_adev(&phase, 1.0, m);
            let ad = overlapping_adev(&phase, 1.0, m);
            assert!(h < 1e-9 * ad, "HDEV {h} should reject drift (ADEV {ad})");
        }
    }

    #[test]
    fn hadamard_white_fm_slope_is_minus_half() {
        let phase = white_fm_phase(3.0e-12, 1 << 14, 4321);
        let slope = loglog_slope_of(&phase, hadamard_adev);
        assert!(
            (slope + 0.5).abs() < 0.12,
            "HDEV white-FM slope {slope}, want -0.5"
        );
    }

    #[test]
    fn normal_and_chi2_quantiles_match_known_values() {
        // Standard normal quantiles.
        assert!((normal_quantile(0.975) - 1.959_963_98).abs() < 1e-6);
        assert!((normal_quantile(0.5)).abs() < 1e-9);
        assert!((normal_quantile(0.025) + 1.959_963_98).abs() < 1e-6);
        // Chi-squared median ~ nu*(1 - 2/(9nu))^3; for nu=10 the true median is 9.342.
        assert!(
            (chi2_quantile(0.5, 10.0) - 9.342).abs() < 0.05,
            "{}",
            chi2_quantile(0.5, 10.0)
        );
        // Wilson-Hilferty is accurate in the moderate-df regime CIs use:
        // chi2_{0.95}(20) = 31.410, chi2_{0.025}(20) = 9.591. (It is only rough at
        // very low df, e.g. nu=1 — documented; CI edf is typically well above that.)
        assert!(
            (chi2_quantile(0.95, 20.0) - 31.410).abs() < 0.1,
            "{}",
            chi2_quantile(0.95, 20.0)
        );
        assert!(
            (chi2_quantile(0.025, 20.0) - 9.591).abs() < 0.1,
            "{}",
            chi2_quantile(0.025, 20.0)
        );
    }

    #[test]
    fn confidence_interval_brackets_and_tightens() {
        let dev = 1.0e-12;
        let ci = deviation_ci(dev, 30.0, 0.95);
        assert!(ci.lo < dev && dev < ci.hi, "CI must bracket the estimate");
        // More degrees of freedom -> tighter interval.
        let wide = deviation_ci(dev, 5.0, 0.95);
        assert!(
            (wide.hi - wide.lo) > (ci.hi - ci.lo),
            "fewer edf must give a wider interval"
        );
        // Higher confidence -> wider interval.
        let c99 = deviation_ci(dev, 30.0, 0.99);
        assert!(
            (c99.hi - c99.lo) > (ci.hi - ci.lo),
            "99% must be wider than 95%"
        );
        // Conservative edf is the non-overlapping count.
        assert_eq!(conservative_edf(1000, 10), 99.0);
        assert_eq!(conservative_edf(5, 10), 1.0); // floored at 1
    }

    // ---------------------------------------------------------------------
    // Noise-type-specific effective degrees of freedom (NIST SP 1065 Table 5)
    // ---------------------------------------------------------------------

    #[test]
    fn mdev_slope_maps_to_noise_type() {
        use PowerLawNoise::*;
        // MDEV log-log slope -> noise type, one-to-one on the half-integer grid.
        assert_eq!(PowerLawNoise::from_mdev_slope(-1.5), WhitePm);
        assert_eq!(PowerLawNoise::from_mdev_slope(-1.0), FlickerPm);
        assert_eq!(PowerLawNoise::from_mdev_slope(-0.5), WhiteFm);
        assert_eq!(PowerLawNoise::from_mdev_slope(0.0), FlickerFm);
        assert_eq!(PowerLawNoise::from_mdev_slope(0.5), RandomWalkFm);
        // Slopes off the grid clamp to the nearest modelled extreme.
        assert_eq!(PowerLawNoise::from_mdev_slope(-3.0), WhitePm);
        assert_eq!(PowerLawNoise::from_mdev_slope(2.0), RandomWalkFm);
        // PSD exponents.
        assert_eq!(WhitePm.alpha(), 2);
        assert_eq!(WhiteFm.alpha(), 0);
        assert_eq!(RandomWalkFm.alpha(), -2);
    }

    #[test]
    fn edf_formulas_match_nist_sp1065_table5() {
        // Transcription check: the five closed forms evaluated by hand at
        // N=64, m=4 (Riley, NIST SP 1065, Table 5). Catches any operator-precedence
        // or coefficient slip in the port. Exact rationals / closed forms.
        use PowerLawNoise::*;
        let cases = [
            (WhitePm, 30.333_333_333_333_332_f64),
            (FlickerPm, 40.270_309_312_727_306),
            (WhiteFm, 20.115_942_028_985_508),
            (FlickerFm, 16.842_105_263_157_894),
            (RandomWalkFm, 12.797_556_059_460_822),
        ];
        for (nz, want) in cases {
            let got = edf_overlapping_adev(nz, 64, 4);
            assert!(
                (got - want).abs() / want < 1e-12,
                "{nz:?}: got {got}, want {want}"
            );
        }
    }

    #[test]
    fn flicker_fm_at_m1_edf_floors_at_one() {
        // The NIST formula yields ~0.87 edf for flicker FM at m=1 (information-poor);
        // the implementation floors to one usable degree of freedom for the CI.
        assert_eq!(edf_overlapping_adev(PowerLawNoise::FlickerFm, 64, 1), 1.0);
    }

    #[test]
    fn edf_ordering_white_pm_richest_random_walk_poorest() {
        // For a fixed record the edf falls monotonically as the spectrum reddens:
        // white PM carries the most information per sample, random-walk FM the least.
        use PowerLawNoise::*;
        let (n, m) = (64, 8);
        let wpm = edf_overlapping_adev(WhitePm, n, m);
        let wfm = edf_overlapping_adev(WhiteFm, n, m);
        let ffm = edf_overlapping_adev(FlickerFm, n, m);
        let rwfm = edf_overlapping_adev(RandomWalkFm, n, m);
        assert!(
            wpm > wfm && wfm > ffm && ffm > rwfm,
            "edf must fall as the spectrum reddens: WPM {wpm} WFM {wfm} FFM {ffm} RWFM {rwfm}"
        );
    }

    #[test]
    fn white_fm_edf_predicts_estimator_variance() {
        // Non-circular validation. The overlapping-ADEV *variance* estimator is
        // modelled as chi-squared with `edf` degrees of freedom, so across an
        // ensemble Var(sigma^2) = 2 (true var)^2 / edf, i.e. the empirical
        // edf = 2 * mean^2 / var. Over many independent white-FM records this
        // measured edf must match the NIST SP 1065 formula — and must materially
        // exceed the conservative non-overlapping count (the whole point of the
        // noise-aware formula is a tighter, honest interval). Deterministic:
        // ChaCha8 streams keyed by the loop index, so this is reproducible, not
        // flaky.
        const N: usize = 129;
        const M: usize = 8;
        const K: usize = 4000;
        let vars: Vec<f64> = (0..K as u64)
            .map(|seed| {
                let a = overlapping_adev(&white_fm_phase(1.0, N, seed), 1.0, M);
                a * a
            })
            .collect();
        let k = K as f64;
        let mean = vars.iter().sum::<f64>() / k;
        let var = vars.iter().map(|v| (v - mean) * (v - mean)).sum::<f64>() / k;
        let empirical_edf = 2.0 * mean * mean / var;
        let formula = edf_overlapping_adev(PowerLawNoise::WhiteFm, N, M);
        let rel = (empirical_edf - formula).abs() / formula;
        assert!(
            rel < 0.2,
            "empirical edf {empirical_edf:.3} vs NIST formula {formula:.3}, rel={rel:.3}"
        );
        let conservative = conservative_edf(N, M);
        assert!(
            empirical_edf > conservative,
            "empirical edf {empirical_edf:.3} should exceed conservative {conservative}"
        );
    }

    #[test]
    fn classify_power_law_identifies_white_fm() {
        // A long white-FM record is identified from its MDEV slope (~ -1/2).
        let phase = white_fm_phase(3.0e-12, 1 << 14, 2027);
        assert_eq!(
            classify_power_law(&phase, 1.0),
            Some(PowerLawNoise::WhiteFm)
        );
    }

    #[test]
    fn adev_curve_carries_noise_typed_confidence_band() {
        // The exported curve classifies the record once and attaches a
        // noise-type-specific 95% band that brackets every ADEV point.
        let phase = white_fm_phase(2.0e-12, 8192, 99);
        let curve = overlapping_adev_curve(&phase, 1.0);
        assert!(!curve.is_empty(), "curve must have points");
        for p in &curve {
            assert_eq!(
                p.noise,
                Some(PowerLawNoise::WhiteFm),
                "white FM should be identified at tau={}",
                p.tau_s
            );
            assert!(p.edf > 0.0, "edf must be positive at tau={}", p.tau_s);
            assert!(
                p.ci_lo > 0.0 && p.ci_lo <= p.adev && p.adev <= p.ci_hi,
                "band must bracket adev at tau={}: [{}, {}] vs {}",
                p.tau_s,
                p.ci_lo,
                p.ci_hi,
                p.adev
            );
        }
    }

    // ---------------------------------------------------------------------
    // Theo1 / ThêoH and TOTVAR (extended-range / long-tau estimators)
    //
    // The oracle for these is the same kind used above: closed-form power-law
    // identities (white FM has σ_y(τ) = σ0/√τ), exact algebraic invariances the
    // statistic must satisfy, and a reduction-to-ADEV identity at the short-tau
    // end. Numeric parity against the independent allantools reference
    // implementation lives in tests/theo1_totvar_reference.rs.
    // ---------------------------------------------------------------------

    #[test]
    fn theo1_effective_tau_is_three_quarters_m_tau0() {
        // Theo1's defining property: its averaging factor m maps to an effective
        // averaging time 0.75·m·tau0, not m·tau0.
        assert!((theo1_tau(1.0, 10) - 7.5).abs() < 1e-12);
        assert!((theo1_tau(0.5, 8) - 3.0).abs() < 1e-12);
    }

    #[test]
    fn theo1_ignores_constant_offset_and_frequency() {
        // Each Theo1 pair term is (x_i - x_{i+m/2-d}) + (x_{i+m} - x_{i+m/2+d}),
        // a balanced double difference: for a linear phase x_t = c0 + c1·t it sums
        // to c1·[(d-m/2) + (m/2-d)] = 0. So Theo1 annihilates any constant phase
        // offset and any constant frequency, exactly like the Allan deviation.
        let phase = white_fm_phase(2.0e-12, 4096, 21);
        let c0 = 1.0e-9;
        let c1 = 1.0e-12;
        let shifted: Vec<f64> = phase
            .iter()
            .enumerate()
            .map(|(i, x)| x + c0 + c1 * i as f64)
            .collect();
        for &m in &[2usize, 8, 32, 128] {
            let base = theo1(&phase, 1.0, m);
            let got = theo1(&shifted, 1.0, m);
            assert!(
                (got - base).abs() / base < 1e-9,
                "Theo1 offset/frequency invariance broke at m={m}"
            );
        }
    }

    #[test]
    fn theo1_white_fm_tracks_allan_closed_form() {
        // White-FM equivalence (closed-form oracle). For white FM σ_y(τ)=σ0/√τ, and
        // Theo1 estimates the Allan deviation at its effective tau 0.75·m·tau0, so
        // Theo1(m) must track σ0/√(0.75·m). Seed-average the variance to cut the
        // estimator's own scatter, then compare to the closed form.
        let sigma0 = 4.0e-12;
        let n = 4096;
        let seeds = [11u64, 22, 33, 44, 55, 66, 77, 88];
        for &m in &[10usize, 20, 40, 100] {
            let var = seeds
                .iter()
                .map(|&s| {
                    let t = theo1(&white_fm_phase(sigma0, n, s), 1.0, m);
                    t * t
                })
                .sum::<f64>()
                / seeds.len() as f64;
            let dev = var.sqrt();
            let expect = sigma0 / (0.75 * m as f64).sqrt();
            let rel = (dev - expect).abs() / expect;
            assert!(
                rel < 0.05,
                "m={m}: Theo1={dev} vs σ0/√(0.75m)={expect}, rel={rel}"
            );
        }
    }

    #[test]
    fn totvar_equals_overlapping_adev_at_m1() {
        // Identity oracle: at m=1 the TOTVAR interior second differences are exactly
        // the Allan second differences over the same interior points, and both
        // normalise by 2(N-2)·tau². So TOTVAR(1) == OADEV(1) exactly, on ANY record —
        // a reduction-to-ADEV check that needs no noise realisation.
        let phase = [0.0, 1.0, 3.0, 6.0, 10.0, 9.0, 7.0, 12.0, 20.0, 18.0];
        let tv = total_deviation(&phase, 1.0, 1);
        let ad = overlapping_adev(&phase, 1.0, 1);
        assert!(
            (tv - ad).abs() < 1e-12,
            "TOTVAR(1) {tv} must equal OADEV(1) {ad}"
        );
        // And on a longer pseudo-random record.
        let p2 = white_fm_phase(3.0e-12, 1024, 7);
        assert!(
            (total_deviation(&p2, 1.0, 1) - overlapping_adev(&p2, 1.0, 1)).abs() < 1e-18,
            "TOTVAR(1) must equal OADEV(1) on the long record too"
        );
    }

    #[test]
    fn totvar_tracks_overlapping_adev_white_fm() {
        // White-FM equivalence (the design intent): TOTVAR is an unbiased estimator
        // of the Allan variance for white FM, so on the SAME tau grid the
        // seed-averaged TOTVAR(m) tracks the overlapping ADEV(m) to within a few %
        // at short/medium tau. (At long tau TOTVAR keeps useful confidence where the
        // plain ADEV's single-point tail does not — checked structurally elsewhere.)
        let sigma0 = 4.0e-12;
        let n = 4096;
        let seeds = [11u64, 22, 33, 44, 55, 66, 77, 88];
        for &m in &[1usize, 2, 4, 8, 16, 64] {
            let mut tv_var = 0.0;
            let mut ad_var = 0.0;
            for &s in &seeds {
                let phase = white_fm_phase(sigma0, n, s);
                let tv = total_deviation(&phase, 1.0, m);
                let ad = overlapping_adev(&phase, 1.0, m);
                tv_var += tv * tv;
                ad_var += ad * ad;
            }
            let tv = (tv_var / seeds.len() as f64).sqrt();
            let ad = (ad_var / seeds.len() as f64).sqrt();
            let rel = (tv - ad).abs() / ad;
            assert!(rel < 0.06, "m={m}: TOTVAR={tv} vs OADEV={ad}, rel={rel}");
        }
    }

    #[test]
    fn totvar_ignores_constant_offset_and_frequency() {
        // TOTVAR is built from the Allan second difference, which annihilates a
        // constant phase offset and a constant frequency — the reflected extension
        // is an affine image of the data, so it preserves the invariance.
        let phase = white_fm_phase(2.0e-12, 2048, 21);
        let c0 = 1.0e-9;
        let c1 = 1.0e-12;
        let shifted: Vec<f64> = phase
            .iter()
            .enumerate()
            .map(|(i, x)| x + c0 + c1 * i as f64)
            .collect();
        for &m in &[1usize, 2, 7, 31, 255] {
            let base = total_deviation(&phase, 1.0, m);
            let got = total_deviation(&shifted, 1.0, m);
            assert!(
                (got - base).abs() / base < 1e-9,
                "TOTVAR offset/frequency invariance broke at m={m}"
            );
        }
    }

    #[test]
    fn theo1_and_totvar_white_fm_loglog_slope_is_minus_half() {
        // Both extended-range estimators carry the white-FM ADEV slope of -1/2.
        // theo1_curve / total_deviation_curve return AdevPoint, so the existing
        // log-log slope helper applies directly.
        let phase = white_fm_phase(3.0e-12, 1 << 12, 2718);
        let theo_slope = loglog_slope(&theo1_curve(&phase, 1.0));
        let tv_slope = loglog_slope(&total_deviation_curve(&phase, 1.0));
        assert!(
            (theo_slope + 0.5).abs() < 0.08,
            "Theo1 white-FM slope {theo_slope}"
        );
        assert!(
            (tv_slope + 0.5).abs() < 0.08,
            "TOTVAR white-FM slope {tv_slope}"
        );
    }

    #[test]
    fn theo_br_pairing_is_unbiased_for_white_fm() {
        // The "known noise-dependent bias" property. TheoBR removes Theo1's bias by
        // averaging AVAR(9+3i)/Theo1(12+4i). The (9+3i, 12+4i) pairing is chosen so
        // the EXPECTED ratio for white FM is exactly 0.75·(12+4i)/(9+3i) = 1 — i.e.
        // raw Theo1 already needs no correction for white FM. That target ratio is a
        // deterministic algebraic identity, checked here for every i, which is the
        // closed-form reason the bias factor sits at ~1 for white FM.
        for i in 0..50usize {
            let k_av = (9 + 3 * i) as f64;
            let k_th = (12 + 4 * i) as f64;
            let expected_ratio = 0.75 * k_th / k_av;
            assert!(
                (expected_ratio - 1.0).abs() < 1e-12,
                "i={i}: white-FM expected AVAR/Theo1 ratio {expected_ratio} != 1"
            );
        }
        // And the realised bias factor on a white-FM record is a finite, positive,
        // order-unity number (it carries genuine finite-record scatter — this is a
        // statistical estimate, hence MODELLED — so the band is deliberately loose).
        // theo_br_bias is O(N²), so use a modest record here.
        let sigma0 = 4.0e-12;
        let phase = white_fm_phase(sigma0, 1024, 99);
        let bias = theo_br_bias(&phase, 1.0);
        assert!(
            bias.is_finite() && (0.3..3.0).contains(&bias),
            "white-FM TheoBR bias factor {bias} out of the order-unity band"
        );
        // Removing the (~1) white-FM bias leaves bias-removed Theo1 tracking the
        // closed form σ0/√(0.75·m) on a single record to within finite-record
        // scatter (one realisation, so a deliberately loose factor-of-1.6 band).
        let m = 50usize;
        let br = theo_br(&phase, 1.0, m);
        let expect = sigma0 / (0.75 * m as f64).sqrt();
        let ratio = br / expect;
        assert!(
            (0.6..1.7).contains(&ratio),
            "TheoBR({m})={br} vs σ0/√(0.75m)={expect}, ratio {ratio} out of band"
        );
    }

    #[test]
    fn theoh_curve_extends_past_adev_and_tracks_white_fm_slope() {
        // ThêoH must reach materially further in tau than the ADEV curve (its whole
        // point), carry a long-tau Theo region, and still trace the white-FM slope.
        // theoh_curve runs the O(N²) bias estimator once, so keep the record modest.
        let phase = white_fm_phase(3.0e-12, 1024, 1234);
        let adev = overlapping_adev_curve(&phase, 1.0);
        let theoh = theoh_curve(&phase, 1.0);
        assert!(!theoh.is_empty(), "ThêoH curve must have points");
        let adev_max_tau = adev.iter().map(|p| p.tau_s).fold(0.0, f64::max);
        let theoh_max_tau = theoh.iter().map(|p| p.tau_s).fold(0.0, f64::max);
        assert!(
            theoh_max_tau > 1.4 * adev_max_tau,
            "ThêoH max tau {theoh_max_tau} should reach well past ADEV max tau {adev_max_tau}"
        );
        // It must contain both regions, and every deviation is finite and positive.
        assert!(
            theoh.iter().any(|p| !p.from_theo),
            "needs a short-tau ADEV region"
        );
        assert!(
            theoh.iter().any(|p| p.from_theo),
            "needs a long-tau Theo region"
        );
        assert!(theoh.iter().all(|p| p.dev.is_finite() && p.dev > 0.0));
        // Slope across the whole hybrid curve is the white-FM -1/2.
        let xs: Vec<f64> = theoh.iter().map(|p| p.tau_s.log10()).collect();
        let ys: Vec<f64> = theoh.iter().map(|p| p.dev.log10()).collect();
        let k = xs.len() as f64;
        let sx: f64 = xs.iter().sum();
        let sy: f64 = ys.iter().sum();
        let sxx: f64 = xs.iter().map(|x| x * x).sum();
        let sxy: f64 = xs.iter().zip(&ys).map(|(x, y)| x * y).sum();
        let slope = (k * sxy - sx * sy) / (k * sxx - sx * sx);
        assert!(
            (slope + 0.5).abs() < 0.1,
            "ThêoH white-FM slope {slope}, want -0.5"
        );
    }

    #[test]
    fn theoh_reaches_about_three_quarters_of_the_record() {
        // The headline range claim: ThêoH's longest tau is ~0.75·N·tau0 (the Theo
        // region runs to m = N-1), well past the ADEV curve's ~N/2 reach.
        let phase = white_fm_phase(2.0e-12, 1000, 5);
        let theoh = theoh_curve(&phase, 1.0);
        let max_tau = theoh.iter().map(|p| p.tau_s).fold(0.0, f64::max);
        // m up to N-1=999 (even -> 998), effective tau ~0.75·998 ≈ 748.
        assert!(
            max_tau > 0.7 * phase.len() as f64,
            "ThêoH max tau {max_tau} should reach ~0.75·N = {}",
            0.75 * phase.len() as f64
        );
    }
}
