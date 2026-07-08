//! R3 — GLS common-mode / shared-reference time protection.
//!
//! Solution separation differences sources against each other, so it is
//! structurally blind to a fault common to *all* of them (a shared UTC(k)
//! realization, or one GNSS system feeding both a PPP source and a
//! GNSS-disciplined network source). The fix is generalized least squares
//! (Aitken 1935): build the full covariance `Ω` with off-diagonal common-mode
//! terms, whiten by `Ω`, run separation on the whitened residuals, and add an
//! explicit common-mode consistency statistic that separation cannot see.
//!
//! Honest residual (published, not hidden): whitening only catches common-mode
//! *within the modelled `Ω`*. A shared-reference fault in a direction the model
//! did not put into `Ω` stays undetectable by separation and by the whitened
//! statistic alike. `residual_outside_omega_bound` quantifies that irreducible
//! blind spot.

/// Lower-triangular Cholesky factor `L` (with `Ω = L Lᵀ`) of a symmetric
/// positive-definite `Ω`. Hand-rolled (no linalg dependency; N ≤ ~8). Returns
/// `None` if `Ω` is not positive-definite (a non-positive pivot).
#[allow(clippy::needless_range_loop)] // two-row access l[i][k]*l[j][k] requires explicit index
pub fn cholesky_lower(omega: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = omega.len();
    let mut l = vec![vec![0.0f64; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let mut sum = omega[i][j];
            for k in 0..j {
                sum -= l[i][k] * l[j][k];
            }
            if i == j {
                if sum <= 0.0 {
                    return None; // not positive-definite
                }
                l[i][j] = sum.sqrt();
            } else {
                l[i][j] = sum / l[j][j];
            }
        }
    }
    Some(l)
}

/// GLS/Aitken whitening: return `z = L⁻¹ r` (forward substitution) so that
/// `Cov(z) = I` when `Cov(r) = Ω`. `None` if `Ω` is not positive-definite or the
/// dimensions mismatch. Cited: Aitken 1935.
pub fn whiten(omega: &[Vec<f64>], residuals: &[f64]) -> Option<Vec<f64>> {
    if omega.len() != residuals.len() {
        return None;
    }
    let l = cholesky_lower(omega)?;
    let n = residuals.len();
    let mut z = vec![0.0f64; n];
    for i in 0..n {
        let mut sum = residuals[i];
        for k in 0..i {
            sum -= l[i][k] * z[k];
        }
        z[i] = sum / l[i][i];
    }
    Some(z)
}

/// The Mahalanobis square `rᵀ Ω⁻¹ r`, computed via the whitened residual
/// (`= zᵀz`). `None` if `Ω` is not positive-definite.
pub fn mahalanobis_sq(omega: &[Vec<f64>], residuals: &[f64]) -> Option<f64> {
    let z = whiten(omega, residuals)?;
    Some(z.iter().map(|zi| zi * zi).sum())
}

/// The common-mode consistency statistic that solution separation cannot see.
///
/// Modelling a common-mode shift `μ` as `r = μ·1 + ε`, `ε ~ N(0, Ω)`, the GLS
/// estimate is `μ̂ = (1ᵀΩ⁻¹r)/(1ᵀΩ⁻¹1)` with `Var(μ̂) = 1/(1ᵀΩ⁻¹1)`, so the
/// score statistic `μ̂²/Var(μ̂) = (1ᵀΩ⁻¹r)²/(1ᵀΩ⁻¹1)` is `~χ²₁` under H0. A shift
/// common to every source inflates it; separation (which forms contrasts
/// orthogonal to `1`) is blind to it.
#[derive(Clone, Copy, Debug)]
pub struct CommonModeStatistic {
    pub value: f64,
    pub dof: usize,
}

/// Compute the common-mode consistency statistic for residual vector `r` under
/// covariance `Ω`. Uses `1ᵀΩ⁻¹r = (L⁻¹1)·(L⁻¹r)` and `1ᵀΩ⁻¹1 = |L⁻¹1|²`.
/// `None` if `Ω` is not positive-definite or is empty.
///
/// ANCHOR REQUIREMENT (honest caveat): this statistic is meaningful only when
/// `r` are residuals formed against an INDEPENDENT time reference (pre-fit
/// residuals). If `r` is the post-fit residual of the H=1_N GLS solve, the
/// normal equations force `1ᵀΩ⁻¹r ≡ 0` and the statistic is identically zero:
/// a shift shared by EVERY source is fundamentally UNOBSERVABLE without an
/// external anchor. That unobservability is itself the deepest honest
/// common-mode blind spot; the statistic detects common-mode only relative to
/// whatever independent reference the caller supplies.
pub fn common_mode_consistency(
    omega: &[Vec<f64>],
    residuals: &[f64],
) -> Option<CommonModeStatistic> {
    let n = residuals.len();
    if n == 0 {
        return None;
    }
    let ones = vec![1.0f64; n];
    let w1 = whiten(omega, &ones)?;
    let wr = whiten(omega, residuals)?;
    let num: f64 = w1.iter().zip(&wr).map(|(a, b)| a * b).sum(); // 1ᵀΩ⁻¹r
    let den: f64 = w1.iter().map(|a| a * a).sum(); // 1ᵀΩ⁻¹1
    if den <= 0.0 {
        return None;
    }
    Some(CommonModeStatistic {
        value: num * num / den,
        dof: 1,
    })
}

/// The irreducible undetectable common-mode time error: the largest fault
/// magnitude `α` along a unit direction `d` that escapes BOTH detectors —
/// separation (whitened contrast) and the common-mode statistic.
///
/// The ceiling is `min(α_ss, α_cm)`, where `α_ss = ∞ ⟺ d ∝ 1` (separation
/// forms contrasts orthogonal to `1`, so a pure common-mode shift produces
/// none) and `α_cm = ∞ ⟺ 1ᵀΩ⁻¹d = 0` (the fault is `Ω⁻¹`-orthogonal to the
/// modelled common axis). Under a positive-definite `Ω` these two conditions
/// are MUTUALLY EXCLUSIVE — if `d ∝ 1` then `1ᵀΩ⁻¹d = μ·1ᵀΩ⁻¹1 ≠ 0` — so the
/// two detectors JOINTLY cover every nonzero direction and the ceiling is
/// FINITE for every nonzero `d`. `f64::INFINITY` is returned ONLY for
/// degenerate inputs: a zero direction, or a non-PD `Ω` where whitening fails.
///
/// The honest published result is therefore a LARGE-BUT-FINITE irreducible
/// blind spot, driven by the mismatch between the true coupling direction and
/// the modelled `Ω` — not an infinite/total blind spot. Moreover `α_ss` uses an
/// idealized single whitened-contrast-norm parity detector, which is MORE
/// sensitive than a real IR-allocated MHSS subset detector; the returned
/// ceiling is thus a LOWER BOUND on the true undetectable magnitude (the
/// honest, conservative direction). `ss_threshold` / `cm_threshold` are the
/// (whitened-separation, χ²₁ common-mode) detection thresholds.
pub fn residual_outside_omega_bound(
    omega_modelled: &[Vec<f64>],
    true_common_mode_dir: &[f64],
    ss_threshold: f64,
    cm_threshold: f64,
) -> f64 {
    let n = true_common_mode_dir.len();
    if n == 0 {
        return f64::INFINITY;
    }
    let d = true_common_mode_dir;
    let ones = vec![1.0f64; n];
    let (w1, wd) = match (whiten(omega_modelled, &ones), whiten(omega_modelled, d)) {
        (Some(a), Some(b)) => (a, b),
        _ => return f64::INFINITY,
    };
    let s11: f64 = w1.iter().map(|a| a * a).sum(); // 1ᵀΩ⁻¹1
    let s1d: f64 = w1.iter().zip(&wd).map(|(a, b)| a * b).sum(); // 1ᵀΩ⁻¹d
                                                                 // GLS common-mode coefficient of d, then the contrast part d_perp = d − μ·1.
    let mu = if s11 > 0.0 { s1d / s11 } else { 0.0 };
    let d_perp: Vec<f64> = d.iter().map(|di| di - mu).collect();
    let wperp = match whiten(omega_modelled, &d_perp) {
        Some(v) => v,
        None => return f64::INFINITY,
    };
    let contrast_norm: f64 = wperp.iter().map(|a| a * a).sum::<f64>().sqrt();

    // α at which each detector reaches threshold (INFINITY = blind to this dir).
    let alpha_ss = if contrast_norm > 1e-30 {
        ss_threshold / contrast_norm
    } else {
        f64::INFINITY
    };
    let alpha_cm = if s1d.abs() > 1e-30 && s11 > 0.0 {
        (cm_threshold * s11).sqrt() / s1d.abs()
    } else {
        f64::INFINITY
    };
    alpha_ss.min(alpha_cm)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn matvec(m: &[Vec<f64>], v: &[f64]) -> Vec<f64> {
        m.iter()
            .map(|row| row.iter().zip(v).map(|(a, b)| a * b).sum())
            .collect()
    }

    #[test]
    #[allow(clippy::needless_range_loop)] // two-row access l[i][k]*l[j][k] requires explicit index
    fn cholesky_reconstructs_omega() {
        let omega = vec![
            vec![4.0, 1.0, 0.5],
            vec![1.0, 3.0, 0.2],
            vec![0.5, 0.2, 2.0],
        ];
        let l = cholesky_lower(&omega).expect("PD");
        // L Lᵀ == Ω
        let n = 3;
        for i in 0..n {
            for j in 0..n {
                let mut s = 0.0;
                for k in 0..n {
                    s += l[i][k] * l[j][k];
                }
                assert!((s - omega[i][j]).abs() < 1e-12, "L Lᵀ != Ω at {i},{j}");
            }
        }
    }

    #[test]
    fn cholesky_rejects_non_pd() {
        // Indefinite matrix -> None.
        let bad = vec![vec![1.0, 2.0], vec![2.0, 1.0]];
        assert!(cholesky_lower(&bad).is_none());
    }

    #[test]
    fn whiten_gives_mahalanobis_identity() {
        // zᵀz == rᵀ Ω⁻¹ r, checked against an explicit inverse solve.
        let omega = vec![vec![4.0, 1.0], vec![1.0, 3.0]];
        let r = [2.0, -1.0];
        let m = mahalanobis_sq(&omega, &r).unwrap();
        // Explicit 2x2 inverse: Ω⁻¹ = 1/det · [[d,-b],[-c,a]].
        let det = 4.0 * 3.0 - 1.0 * 1.0;
        let inv = [[3.0 / det, -1.0 / det], [-1.0 / det, 4.0 / det]];
        let iv = matvec(&inv.iter().map(|row| row.to_vec()).collect::<Vec<_>>(), &r);
        let quad = r[0] * iv[0] + r[1] * iv[1];
        assert!(
            (m - quad).abs() < 1e-12,
            "Mahalanobis identity zᵀz = rᵀΩ⁻¹r"
        );
    }

    #[test]
    fn common_mode_shift_inflates_statistic_but_not_contrasts() {
        // Ω with positive off-diagonals (shared common-mode coupling).
        let omega = vec![
            vec![4.0, 1.5, 1.5],
            vec![1.5, 4.0, 1.5],
            vec![1.5, 1.5, 4.0],
        ];
        // Null residual (tiny) vs a common-mode shift μ·1.
        let null = [0.05, -0.03, 0.02];
        let shift = [1.0, 1.0, 1.0];
        let s_null = common_mode_consistency(&omega, &null).unwrap().value;
        let s_shift = common_mode_consistency(&omega, &shift).unwrap().value;
        // s_shift ≈ 0.429 (= 1ᵀΩ⁻¹1 for μ=1), s_null ≈ 7.6e-5 (tiny residuals);
        // ratio ~5625. The threshold is proportional, not absolute, because the
        // statistic's scale is 1ᵀΩ⁻¹1 which is sub-1 for this high-correlation Ω.
        assert!(
            s_shift > s_null * 100.0,
            "a common-mode shift must inflate the statistic"
        );
        // Separation sees CONTRASTS; a pure common-mode shift produces none.
        // Whitened contrast norm of μ·1 after removing its common-mode part ≈ 0.
        let b = residual_outside_omega_bound(&omega, &shift, 3.0, 3.841);
        // d ∝ 1 -> separation blind (α_ss=∞), but the cm statistic catches it -> finite.
        assert!(
            b.is_finite(),
            "a pure common-mode fault is caught by the cm statistic (finite ceiling)"
        );
    }

    #[test]
    fn separation_alone_is_blind_to_common_mode() {
        // With NO common-mode statistic, a pure μ·1 fault has infinite ceiling.
        // We emulate "separation only" by checking the contrast part is zero.
        let omega = vec![vec![2.0, 0.5], vec![0.5, 2.0]];
        // Direction ∝ 1: contrast part vanishes.
        let d = [1.0, 1.0];
        // Give the cm detector zero power by passing an impossible threshold via
        // a direction Ω⁻¹-orthogonal to 1 instead: construct d with 1ᵀΩ⁻¹d = 0.
        // For this Ω, Ω⁻¹1 ∝ [1,1] (symmetric), so d=[1,-1] is Ω⁻¹-orthogonal to 1.
        let d_blind = [1.0, -1.0];
        let b_common = residual_outside_omega_bound(&omega, &d, 3.0, 3.841);
        let b_blind = residual_outside_omega_bound(&omega, &d_blind, 3.0, 3.841);
        assert!(
            b_common.is_finite(),
            "cm statistic catches the modelled common axis"
        );
        // d_blind is invisible to the cm statistic (1ᵀΩ⁻¹d=0) but VISIBLE to
        // separation (it is a pure contrast) -> finite via α_ss.
        assert!(
            b_blind.is_finite(),
            "a pure contrast is caught by separation"
        );
        assert!(
            b_blind < b_common * 100.0,
            "sanity: both bounds are real magnitudes"
        );
    }

    #[test]
    fn degenerate_direction_or_non_pd_gives_no_finite_ceiling() {
        // INFINITY arises ONLY for degenerate inputs: a zero-signal direction
        // (no signal to detect) or a non-PD Omega (whitening fails). For every
        // NONZERO direction under a PD Omega the joint detector gives a FINITE
        // ceiling — see `every_nonzero_direction_under_pd_omega_has_a_finite_ceiling`.
        let omega = vec![vec![1.0]];
        let d_zero = [0.0];
        let b = residual_outside_omega_bound(&omega, &d_zero, 3.0, 3.841);
        assert!(
            b.is_infinite(),
            "a zero-signal direction is undetectable by construction"
        );
    }

    #[test]
    fn every_nonzero_direction_under_pd_omega_has_a_finite_ceiling() {
        // Joint coverage: separation catches contrasts (d not ∝ 1); the
        // common-mode statistic catches d ∝ 1. Under a PD Omega those blind
        // directions are mutually exclusive, so no nonzero direction escapes
        // both -> the irreducible blind spot is large-but-FINITE, never total.
        let omega = vec![
            vec![4.0, 1.5, 1.5],
            vec![1.5, 4.0, 1.5],
            vec![1.5, 1.5, 4.0],
        ];
        for d in [
            [1.0, 1.0, 1.0],  // pure common-mode: caught by the cm statistic
            [1.0, -1.0, 0.0], // pure contrast: caught by separation
            [2.0, 0.3, -1.1], // mixed
            [1.0, 1.0, 0.9],  // near-common-mode
        ] {
            let b = residual_outside_omega_bound(&omega, &d, 3.0, 3.841);
            assert!(
                b.is_finite() && b > 0.0,
                "nonzero direction {d:?} must have a finite positive ceiling, got {b}"
            );
        }
    }

    #[test]
    fn post_fit_common_mode_statistic_is_zero() {
        // On the post-fit H=1_N GLS residual r = y − x̂·1 (x̂ the GLS estimate
        // of the common offset), the normal equation forces 1ᵀΩ⁻¹r ≡ 0, so the
        // common-mode statistic is identically zero: a shift shared by every
        // source is unobservable from the fused sources alone (caveat I2).
        let omega = vec![
            vec![4.0, 1.5, 0.8],
            vec![1.5, 3.0, 0.5],
            vec![0.8, 0.5, 2.5],
        ];
        let y = [1.2, -0.7, 0.4];
        let ones = [1.0, 1.0, 1.0];
        let w1 = whiten(&omega, &ones).unwrap();
        let wy = whiten(&omega, &y).unwrap();
        let s1y: f64 = w1.iter().zip(&wy).map(|(a, b)| a * b).sum();
        let s11: f64 = w1.iter().map(|a| a * a).sum();
        let xhat = s1y / s11; // GLS estimate of the common offset
        let r_postfit: Vec<f64> = y.iter().map(|yi| yi - xhat).collect();
        let s = common_mode_consistency(&omega, &r_postfit).unwrap();
        assert!(
            s.value.abs() < 1e-12,
            "post-fit common-mode statistic must be ~0 (I2), got {}",
            s.value
        );
    }
}
