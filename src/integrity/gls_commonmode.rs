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
}
