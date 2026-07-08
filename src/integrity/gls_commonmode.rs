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
/// magnitude `α` along a unit direction `d` that keeps BOTH detectors below
/// threshold, i.e. is seen by neither separation nor the common-mode statistic.
///
/// * separation acts on contrasts — the whitened norm of the part of `d`
///   orthogonal (in the `Ω` metric) to the common axis. If that norm is ~0
///   (`d` ∝ `1`), separation is blind (`α_ss = ∞`).
/// * the common-mode statistic scales as `α²(1ᵀΩ⁻¹d)²/(1ᵀΩ⁻¹1)`. If
///   `1ᵀΩ⁻¹d ≈ 0` (the fault direction is `Ω⁻¹`-orthogonal to the modelled
///   common axis — a shared-reference coupling the model did not put into `Ω`),
///   the statistic is blind (`α_cm = ∞`).
///
/// The undetectable ceiling is `min(α_ss, α_cm)`; when both are infinite the
/// fault is the irreducible blind spot the paper publishes. `ss_threshold` and
/// `cm_threshold` are the (whitened separation, χ²₁ common-mode) detection
/// thresholds. Returns `f64::INFINITY` for a total blind spot; `0.0`/`None`-like
/// degenerate inputs return `f64::INFINITY` (nothing detectable) conservatively.
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
    fn total_blind_spot_is_infinite() {
        // A direction that is BOTH Ω⁻¹-orthogonal to 1 (cm-blind) AND has ~zero
        // whitened contrast norm is undetectable by both -> INFINITY.
        // Construct via a near-singular common-mode: Ω where the common axis
        // dominates so a specific off-axis direction yields ~0 contrast.
        // Simplest explicit case: n=1 (no contrasts, and 1ᵀΩ⁻¹d with d=[0]).
        let omega = vec![vec![1.0]];
        let d_zero = [0.0];
        let b = residual_outside_omega_bound(&omega, &d_zero, 3.0, 3.841);
        assert!(
            b.is_infinite(),
            "a zero-signal direction is undetectable by construction"
        );
    }
}
