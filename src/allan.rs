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
}
