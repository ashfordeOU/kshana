// SPDX-License-Identifier: AGPL-3.0-only
use crate::scenario::GnssState;
use crate::types::Seconds;
use serde::Serialize;

/// Worst-case (shortest) holdover across all contiguous outage segments.
///
/// `series` is the full ordered run as `(t, is_outage, breached)` tuples. The
/// timeline is split into maximal runs of outage samples (a nominal sample, or
/// the end of the run, closes a segment, since GNSS re-acquisition re-aligns the
/// estimator). Per segment, holdover is the time from the segment start to its
/// first spec breach, or the segment's own span if it never breaches. The
/// reported value is the minimum across segments — the shortest coast the system
/// is guaranteed, which is the conservative figure of merit. Returns 0 when there
/// are no outage samples. A single contiguous outage reduces to the previous
/// "first breach since outage start" behaviour.
pub(crate) fn worst_case_holdover(series: &[(Seconds, bool, bool)]) -> Seconds {
    let mut worst: Option<Seconds> = None;
    let mut seg_start: Option<Seconds> = None;
    let mut seg_breach: Option<Seconds> = None;
    let mut seg_last = 0.0;
    let close =
        |start: Seconds, breach: Option<Seconds>, last: Seconds, worst: &mut Option<Seconds>| {
            let h = breach.map_or(last - start, |b| b - start);
            *worst = Some(worst.map_or(h, |w: Seconds| w.min(h)));
        };
    for &(t, outage, breached) in series {
        if outage {
            if seg_start.is_none() {
                seg_start = Some(t);
                seg_breach = None;
            }
            seg_last = t;
            if breached && seg_breach.is_none() {
                seg_breach = Some(t);
            }
        } else if let Some(start) = seg_start.take() {
            close(start, seg_breach, seg_last, &mut worst);
            seg_breach = None;
        }
    }
    if let Some(start) = seg_start {
        close(start, seg_breach, seg_last, &mut worst);
    }
    worst.unwrap_or(0.0)
}

/// One scored sample: timing error in nanoseconds and the GNSS state at that time.
#[derive(Clone, Debug, Serialize)]
pub struct Sample {
    pub t: Seconds,
    pub error_ns: f64,
    pub gnss: GnssState,
}

/// The operational PNT figures of merit for a clock/orbit run. Integrity is
/// populated by the run layer from the Kalman protection bound (the fraction of
/// outage samples whose error stays inside the k-sigma bound); Security is the
/// analytic clock-stability spoof-detectability bound (see [`crate::security`]).
/// Field units are annotated below; see `docs/SCHEMA.md` for the full schema.
#[derive(Clone, Debug, Serialize)]
pub struct FoMScores {
    /// Timing (clock-phase) error RMS over the outage. Unit: nanoseconds. A timing
    /// metric, not a position-domain metric.
    pub timing_rms_ns: f64,
    /// 95th-percentile timing error over the outage. Unit: nanoseconds.
    pub timing_p95_ns: f64,
    /// Worst-case (shortest) in-spec coast across outage segments. Unit: seconds.
    /// Grid-bounded — a lower bound at the time-step resolution.
    pub holdover_s: f64,
    /// Least-squares growth rate of |error| during the outage. Unit: ns per second.
    pub resilience_slope_ns_per_s: f64,
    /// Fraction of the whole run with an in-spec solution. Unit: fraction in [0, 1].
    pub availability: f64,
    /// Filter self-consistency: fraction of outage samples whose error stays inside
    /// the Kalman k-sigma bound. Unit: fraction in [0, 1]. NOT an aviation
    /// HPL/VPL/RAIM integrity figure (see `docs/INTEGRITY.md`).
    pub integrity: Option<f64>,
    /// Analytic spoof-detectability bound from clock stability. Unit: fraction in
    /// [0, 1]. Meaningful only with a configured attack; NOT a multi-satellite RAIM
    /// detector (see `docs/INTEGRITY.md`).
    pub security: Option<f64>,
}

/// The horizontal/3-D **position-domain** figures of merit (CEP, SEP, 2DRMS, and
/// a horizontal protection level) that a multi-axis navigation solution reports.
/// These are deliberately distinct from the timing-domain `FoMScores` and from
/// the inertial pack's single-axis `pos_rms_m`: CEP/SEP/2DRMS are properties of a
/// 2-D/3-D error distribution, and HPL is a protection level from a real
/// multi-measurement integrity monitor — none of which the current 1-DOF models
/// produce. This struct exists so the planned capability has an honest, named
/// home rather than a position number masquerading as accuracy.
#[derive(Clone, Debug, Serialize)]
pub struct PositioningFom {
    /// Circular Error Probable (50%) — horizontal. Metres.
    pub cep_m: f64,
    /// Spherical Error Probable (50%) — 3-D. Metres.
    pub sep_m: f64,
    /// Twice the distance RMS (~95% horizontal). Metres.
    pub drms2_m: f64,
    /// Horizontal Protection Level from an integrity monitor. Metres.
    pub hpl_m: f64,
}

/// The two principal (eigen) **variances** of a 2×2 symmetric covariance
/// `[[a, b], [b, d]]`, largest first and floored at zero. Closed form: the
/// eigenvalues of a symmetric 2×2 are `½tr ± √((½(a−d))² + b²)`.
fn principal_variances_2x2(a: f64, d: f64, b: f64) -> (f64, f64) {
    let half_tr = 0.5 * (a + d);
    let disc = (0.25 * (a - d) * (a - d) + b * b).max(0.0).sqrt();
    ((half_tr + disc).max(0.0), (half_tr - disc).max(0.0))
}

/// The three principal (eigen) **variances** of a 3×3 symmetric covariance,
/// largest first and floored at zero, via the crate's symmetric Jacobi
/// eigensolver ([`crate::fim::sym_eig`]).
fn principal_variances_3x3(cov: &[[f64; 3]; 3]) -> (f64, f64, f64) {
    let a = vec![
        vec![cov[0][0], cov[0][1], cov[0][2]],
        vec![cov[1][0], cov[1][1], cov[1][2]],
        vec![cov[2][0], cov[2][1], cov[2][2]],
    ];
    let mut v: Vec<f64> = crate::fim::sym_eig(&a)
        .values
        .iter()
        .map(|x| x.max(0.0))
        .collect();
    v.sort_by(|x, y| y.partial_cmp(x).unwrap_or(core::cmp::Ordering::Equal));
    (v[0], v[1], v[2])
}

/// Exact 50 % **Circular Error Probable**: the median of the horizontal radial
/// error `R = √(σ₁²Z₁² + σ₂²Z₂²)` for independent zero-mean unit Gaussians `Zᵢ`,
/// given the two principal horizontal variances `σ₁², σ₂²`. Solves `F(r) = ½` for
/// the exact elliptical-error CDF
/// `F(r) = 1 − (1/2π)∫₀^{2π} exp(−r² / (2·(σ₁²cos²θ + σ₂²sin²θ))) dθ`
/// by composite-Simpson quadrature over the quarter period `[0, π/2]` (the
/// integrand's mean over `[0, 2π]` equals its mean over `[0, π/2]`) and bisection.
/// Reduces to the exact Rayleigh median `σ√(2 ln 2) ≈ 1.1774 σ` when `σ₁ = σ₂` —
/// this is the true quantile, not the `0.589·(σ₁+σ₂)` linear approximation.
fn cep50(var1: f64, var2: f64) -> f64 {
    let (v1, v2) = (var1.max(0.0), var2.max(0.0));
    if v1 <= 0.0 && v2 <= 0.0 {
        return 0.0;
    }
    let mean_exp = |r: f64| -> f64 {
        const N: usize = 400;
        let b = core::f64::consts::FRAC_PI_2;
        let h = b / N as f64;
        let mut s = 0.0;
        for i in 0..=N {
            let th = h * i as f64;
            let (c, sn) = (th.cos(), th.sin());
            let g = v1 * c * c + v2 * sn * sn;
            let f = (-r * r / (2.0 * g)).exp();
            let w = if i == 0 || i == N {
                1.0
            } else if i % 2 == 1 {
                4.0
            } else {
                2.0
            };
            s += w * f;
        }
        (h / 3.0) * s / b
    };
    let s_max = v1.max(v2).sqrt();
    let (mut lo, mut hi) = (0.0_f64, 8.0 * s_max);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if 1.0 - mean_exp(mid) < 0.5 {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// Exact 50 % **Spherical Error Probable**: the median of the 3-D radial error
/// `R = √(σ₁²Z₁² + σ₂²Z₂² + σ₃²Z₃²)` given the three principal variances. Solves
/// `F(r) = ½` for the exact CDF
/// `F(r) = (2π)^{-3/2} ∮ [√(π/2)·erf(a/√2) − a·e^{−a²/2}] dΩ`, with
/// `a = r / √(σ₁²l² + σ₂²m² + σ₃²n²)` for unit direction `(l, m, n)`, integrated
/// over one octant (×8 — the integrand is even in each axis) by 2-D
/// composite-Simpson quadrature in `(u = cos θ, φ)` and bisection. Reuses
/// [`crate::detection::erf`]. Reduces to the exact Maxwell median `≈ 1.5382 σ`
/// when `σ₁ = σ₂ = σ₃`.
fn sep50(var1: f64, var2: f64, var3: f64) -> f64 {
    let (v1, v2, v3) = (var1.max(0.0), var2.max(0.0), var3.max(0.0));
    if v1 <= 0.0 && v2 <= 0.0 && v3 <= 0.0 {
        return 0.0;
    }
    let inv_norm = (2.0 * core::f64::consts::PI).powf(-1.5);
    let sqrt_half_pi = (0.5 * core::f64::consts::PI).sqrt();
    let cdf = |r: f64| -> f64 {
        const NU: usize = 120;
        const NP: usize = 120;
        let hu = 1.0 / NU as f64;
        let hp = core::f64::consts::FRAC_PI_2 / NP as f64;
        let mut acc = 0.0;
        for iu in 0..=NU {
            let u = hu * iu as f64;
            let wu = if iu == 0 || iu == NU {
                1.0
            } else if iu % 2 == 1 {
                4.0
            } else {
                2.0
            };
            let sin_t = (1.0 - u * u).max(0.0).sqrt();
            for ip in 0..=NP {
                let phi = hp * ip as f64;
                let wp = if ip == 0 || ip == NP {
                    1.0
                } else if ip % 2 == 1 {
                    4.0
                } else {
                    2.0
                };
                let (l, m, n) = (sin_t * phi.cos(), sin_t * phi.sin(), u);
                let hval = v1 * l * l + v2 * m * m + v3 * n * n;
                let a = r / hval.sqrt();
                let inner = sqrt_half_pi * crate::detection::erf(a / core::f64::consts::SQRT_2)
                    - a * (-0.5 * a * a).exp();
                acc += wu * wp * inner;
            }
        }
        inv_norm * 8.0 * (hu / 3.0) * (hp / 3.0) * acc
    };
    let s_max = v1.max(v2).max(v3).sqrt();
    let (mut lo, mut hi) = (0.0_f64, 8.0 * s_max);
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if cdf(mid) < 0.5 {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

impl PositioningFom {
    /// Build the position-domain FoM from a navigation solution's 3×3 **ENU
    /// position-error covariance** (metres², row-major East/North/Up) and a
    /// horizontal protection level `hpl_m` (metres) from an integrity monitor.
    /// CEP and SEP are the *exact* median radial errors ([`cep50`]/[`sep50`]);
    /// 2DRMS is the closed-form `2√(σ_E² + σ_N²)`.
    #[must_use]
    pub fn from_position_covariance(cov_enu: [[f64; 3]; 3], hpl_m: f64) -> Self {
        let (h1, h2) = principal_variances_2x2(cov_enu[0][0], cov_enu[1][1], cov_enu[0][1]);
        let (v1, v2, v3) = principal_variances_3x3(&cov_enu);
        PositioningFom {
            cep_m: cep50(h1, h2),
            sep_m: sep50(v1, v2, v3),
            drms2_m: 2.0 * (cov_enu[0][0] + cov_enu[1][1]).max(0.0).sqrt(),
            hpl_m,
        }
    }
}

/// Position-domain figures of merit (CEP/SEP/2DRMS/HPL) for a multi-axis
/// navigation solution, from its 3×3 **ENU position-error covariance** `cov_enu`
/// (metres², row-major East/North/Up) and a horizontal protection level `hpl_m`
/// (metres). The covariance is produced by the GNSS/INS fusion filter
/// ([`crate::fusion`], whose 15-state error-state EKF carries the full 3-D
/// position block) and the protection level by the SBAS/ARAIM path
/// ([`crate::sbas::sbas_protection_level`] / [`crate::raim::araim_protection_level`]).
/// CEP and SEP are the **exact** median radial errors (not the `0.589·(σ₁+σ₂)`
/// linear approximation) — externally cross-checked against SciPy
/// (`scipy.stats.rayleigh`/`maxwell` in the isotropic limit) and an independent
/// NumPy Monte-Carlo median (anisotropic) in `tests/positioning_fom_reference.rs`.
#[must_use]
pub fn positioning_performance(cov_enu: [[f64; 3]; 3], hpl_m: f64) -> PositioningFom {
    PositioningFom::from_position_covariance(cov_enu, hpl_m)
}

/// Score a series against a timing spec threshold (ns).
///
/// Timing RMS/p95 and resilience are measured over the holdover (outage) period
/// — the metric of interest — while `availability` is over the whole run.
/// `holdover_s` is bounded by the time-grid resolution; treat it as a lower bound.
pub fn score(samples: &[Sample], threshold_ns: f64) -> FoMScores {
    let n = samples.len().max(1) as f64;

    // Availability over the whole run: fraction of time with an in-spec solution.
    let within = samples
        .iter()
        .filter(|s| s.error_ns.abs() <= threshold_ns)
        .count();
    let availability = within as f64 / n;

    // The holdover (outage) subset drives the timing/resilience metrics.
    let outage: Vec<&Sample> = samples
        .iter()
        .filter(|s| s.gnss != GnssState::Nominal)
        .collect();

    if outage.is_empty() {
        return FoMScores {
            timing_rms_ns: 0.0,
            timing_p95_ns: 0.0,
            holdover_s: 0.0,
            resilience_slope_ns_per_s: 0.0,
            availability,
            integrity: None,
            security: None,
        };
    }

    let m = outage.len() as f64;

    let sumsq: f64 = outage.iter().map(|s| s.error_ns * s.error_ns).sum();
    let timing_rms_ns = (sumsq / m).sqrt();

    let mut abs: Vec<f64> = outage.iter().map(|s| s.error_ns.abs()).collect();
    abs.sort_by(|a, b| a.total_cmp(b));
    let idx = (((abs.len().saturating_sub(1)) as f64) * 0.95).round() as usize;
    let timing_p95_ns = abs.get(idx).copied().unwrap_or(0.0);

    // Holdover: worst-case (shortest) coast across outage segments, grid-bounded.
    let segs: Vec<(Seconds, bool, bool)> = samples
        .iter()
        .map(|s| {
            (
                s.t,
                s.gnss != GnssState::Nominal,
                s.error_ns.abs() > threshold_ns,
            )
        })
        .collect();
    let holdover_s = worst_case_holdover(&segs);

    // Resilience: least-squares slope of |error| vs time over the outage.
    let mean_t = outage.iter().map(|s| s.t).sum::<f64>() / m;
    let mean_y = outage.iter().map(|s| s.error_ns.abs()).sum::<f64>() / m;
    let mut num = 0.0;
    let mut den = 0.0;
    for s in &outage {
        num += (s.t - mean_t) * (s.error_ns.abs() - mean_y);
        den += (s.t - mean_t) * (s.t - mean_t);
    }
    let resilience_slope_ns_per_s = if den > 0.0 { num / den } else { 0.0 };

    FoMScores {
        timing_rms_ns,
        timing_p95_ns,
        holdover_s,
        resilience_slope_ns_per_s,
        availability,
        integrity: None,
        security: None,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::scenario::GnssState::Denied;

    fn s(t: f64, e: f64) -> Sample {
        Sample {
            t,
            error_ns: e,
            gnss: Denied,
        }
    }

    #[test]
    fn hand_derived_scores() {
        let samples = vec![s(0.0, 0.0), s(1.0, 100.0), s(2.0, 200.0)];
        let f = score(&samples, 150.0);
        assert!((f.timing_rms_ns - 129.0994).abs() < 1e-3);
        assert_eq!(f.timing_p95_ns, 200.0);
        assert!((f.availability - 2.0 / 3.0).abs() < 1e-9);
        assert_eq!(f.holdover_s, 2.0);
        assert!((f.resilience_slope_ns_per_s - 100.0).abs() < 1e-9);
        assert!(f.integrity.is_none() && f.security.is_none());
    }

    #[test]
    fn multi_window_holdover_is_worst_segment() {
        // Two outage segments split by a nominal re-acquisition at t=3.
        //   segment A (t=0..2): breaches at t=2 (200>150) -> holdover 2.
        //   segment B (t=4..5): breaches at t=5 (200>150) -> holdover 1.
        // Worst-case (shortest guaranteed coast) = min(2, 1) = 1.
        let nominal = |t: f64, e: f64| Sample {
            t,
            error_ns: e,
            gnss: GnssState::Nominal,
        };
        let samples = vec![
            s(0.0, 0.0),
            s(1.0, 0.0),
            s(2.0, 200.0),
            nominal(3.0, 0.0),
            s(4.0, 0.0),
            s(5.0, 200.0),
        ];
        let f = score(&samples, 150.0);
        assert_eq!(f.holdover_s, 1.0);
    }

    #[test]
    fn unbreached_segment_reports_its_span() {
        // A segment that never breaches contributes its full span; a later segment
        // that breaches early is shorter, so the worst-case is the early breach.
        let nominal = |t: f64| Sample {
            t,
            error_ns: 0.0,
            gnss: GnssState::Nominal,
        };
        let samples = vec![
            s(0.0, 0.0), // segment A: never breaches over t=0..3 -> span 3
            s(1.0, 10.0),
            s(2.0, 20.0),
            s(3.0, 30.0),
            nominal(4.0),
            s(5.0, 0.0), // segment B: breaches at t=6 -> holdover 1
            s(6.0, 500.0),
        ];
        let f = score(&samples, 150.0);
        assert_eq!(f.holdover_s, 1.0);
    }

    #[test]
    fn worst_case_holdover_no_outage_is_zero() {
        assert_eq!(
            worst_case_holdover(&[(0.0, false, false), (1.0, false, false)]),
            0.0
        );
    }

    #[test]
    fn positioning_fom_isotropic_matches_closed_form_medians() {
        // Circular horizontal (σ=2.5 m) and spherical 3-D error: CEP must equal the
        // exact Rayleigh median σ√(2 ln 2) and SEP the exact Maxwell median (≈1.5382 σ).
        let s = 2.5;
        let v = s * s;
        let cov = [[v, 0.0, 0.0], [0.0, v, 0.0], [0.0, 0.0, v]];
        let fom = positioning_performance(cov, 12.0);
        let cep_exact = s * (2.0 * core::f64::consts::LN_2).sqrt(); // 2.94353
        let sep_exact = 1.538_172 * s; // Maxwell 50% quantile × σ
        assert!(
            (fom.cep_m - cep_exact).abs() < 1e-3,
            "CEP {} vs Rayleigh median {cep_exact}",
            fom.cep_m
        );
        assert!(
            (fom.sep_m - sep_exact).abs() < 2e-3,
            "SEP {} vs Maxwell median {sep_exact}",
            fom.sep_m
        );
        // 2DRMS = 2√(σ_E²+σ_N²) = 2σ√2.
        assert!((fom.drms2_m - 2.0 * s * core::f64::consts::SQRT_2).abs() < 1e-9);
        assert_eq!(fom.hpl_m, 12.0);
    }

    #[test]
    fn positioning_fom_orders_cep_below_drms_and_respects_anisotropy() {
        // A 3:1 horizontal ellipse: CEP (50%) sits below 2DRMS (~95%), and the exact
        // CEP is meaningfully tighter than the loose 0.589·(σ₁+σ₂) linear rule for
        // eccentric ellipses (that rule over-estimates here).
        let cov = [[9.0, 0.0, 0.0], [0.0, 1.0, 0.0], [0.0, 0.0, 4.0]];
        let fom = positioning_performance(cov, 20.0);
        assert!(fom.cep_m > 0.0 && fom.cep_m < fom.drms2_m);
        let linear_rule = 0.589 * (3.0 + 1.0);
        assert!(
            fom.cep_m < linear_rule,
            "exact CEP {} should be below the linear approx {linear_rule}",
            fom.cep_m
        );
        // Correlation-invariance: rotating the horizontal covariance by 45° (equal
        // diagonal, off-diagonal = ±4) leaves the principal axes {9,1} unchanged, so
        // CEP is identical to the axis-aligned case.
        let rot = [[5.0, 4.0, 0.0], [4.0, 5.0, 0.0], [0.0, 0.0, 4.0]];
        let fom_rot = positioning_performance(rot, 20.0);
        assert!((fom.cep_m - fom_rot.cep_m).abs() < 1e-6);
    }

    #[test]
    fn positioning_fom_degenerate_covariance_is_zero() {
        let fom = positioning_performance([[0.0; 3]; 3], 0.0);
        assert_eq!(fom.cep_m, 0.0);
        assert_eq!(fom.sep_m, 0.0);
        assert_eq!(fom.drms2_m, 0.0);
    }
}
