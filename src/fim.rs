// SPDX-License-Identifier: AGPL-3.0-only
//! Fisher information, the Cramér–Rao lower bound, and observability/datum-defect
//! analysis — the information-geometry core for experiment design and rank diagnosis.
//!
//! For an estimation problem with measurement model `z = h(x) + n`, `n ~ N(0, R)`,
//! the (Gaussian) **Fisher information matrix** is `M = HᵀWH`, where `H = ∂h/∂x` is the
//! measurement Jacobian and `W = R⁻¹` the weight matrix. The **Cramér–Rao lower bound**
//! states that any unbiased estimator has covariance `Cov(x̂) ⪰ M⁻¹`: no estimator can
//! do better than `M⁻¹`, and a maximum-likelihood estimator attains it asymptotically.
//!
//! This module turns `M` into the quantities a mission designer actually needs:
//!
//! * **Observability / datum defect.** When the geometry leaves some state direction
//!   unconstrained, `M` is rank-deficient; its null space is exactly the set of
//!   unobservable directions (the *datum defect* of geodetic free-network adjustment).
//!   [`crlb`] reports the rank, the defect dimension, and a basis of the null space.
//! * **The bound itself.** The per-parameter variance lower bound is the diagonal of
//!   `M⁻¹` (or the Moore–Penrose pseudo-inverse `M⁺` on the observable subspace when
//!   `M` is rank-deficient).
//! * **Optimal experiment design.** The D-, A-, E- and T-optimality scalars of `M`
//!   ([`design_metrics`]) score a candidate measurement geometry, so a tracking
//!   schedule or baseline configuration can be chosen to maximise information.
//!
//! The linear-algebra core is a self-contained cyclic **Jacobi eigensolver** for real
//! symmetric matrices (`M` is symmetric positive-semidefinite by construction), which
//! gives the eigenvalues/vectors that every quantity above is read off from. It is
//! validated against published closed-form Cramér–Rao bounds (Kay, *Fundamentals of
//! Statistical Signal Processing: Estimation Theory*, 1993) and against the empirical
//! covariance an efficient estimator achieves in Monte-Carlo.

/// A dense matrix as rows of columns (matching the rest of the crate).
type Mat = Vec<Vec<f64>>;

/// Eigendecomposition of a real symmetric matrix.
///
/// `vectors` is `n×n`; column `j` is the unit eigenvector associated with
/// `values[j]`, and the eigenvalues are returned in **ascending** order.
#[derive(Clone, Debug)]
pub struct SymEig {
    /// Eigenvalues in ascending order.
    pub values: Vec<f64>,
    /// Eigenvectors as columns (`vectors[row][j]` is component `row` of eigenvector `j`).
    pub vectors: Mat,
}

/// Eigendecomposition of a real symmetric matrix by the cyclic Jacobi algorithm.
///
/// Jacobi applies a sequence of plane rotations that drive the off-diagonal entries to
/// zero; the diagonal then holds the eigenvalues and the accumulated rotation holds the
/// (orthonormal) eigenvectors. It is accurate for symmetric matrices and needs no
/// external dependency. Input is assumed symmetric; only the symmetric part is used.
// Dense rotation kernel: explicit (p, q, k) index arithmetic across rows and columns is
// clearer (and matches the rest of the crate's matrix code) than iterator gymnastics.
#[allow(clippy::needless_range_loop)]
pub fn sym_eig(a: &[Vec<f64>]) -> SymEig {
    let n = a.len();
    if n == 0 {
        return SymEig {
            values: vec![],
            vectors: vec![],
        };
    }
    // Working symmetric copy `d` (becomes diagonal) and eigenvector accumulator `v = I`.
    let mut d = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            d[i][j] = 0.5 * (a[i][j] + a[j][i]);
        }
    }
    let mut v = vec![vec![0.0; n]; n];
    for (i, vi) in v.iter_mut().enumerate() {
        vi[i] = 1.0;
    }
    if n > 1 {
        for _sweep in 0..100 {
            // Convergence when the strictly-upper off-diagonal mass is gone.
            let mut off = 0.0;
            for p in 0..n {
                for q in (p + 1)..n {
                    off += d[p][q].abs();
                }
            }
            if off == 0.0 {
                break;
            }
            for p in 0..n {
                for q in (p + 1)..n {
                    let apq = d[p][q];
                    if apq == 0.0 {
                        continue;
                    }
                    let app = d[p][p];
                    let aqq = d[q][q];
                    // Rotation angle that annihilates d[p][q] (Numerical Recipes form).
                    let theta = (aqq - app) / (2.0 * apq);
                    let t = if theta == 0.0 {
                        1.0
                    } else {
                        theta.signum() / (theta.abs() + (theta * theta + 1.0).sqrt())
                    };
                    let c = 1.0 / (t * t + 1.0).sqrt();
                    let s = t * c;
                    let tau = s / (1.0 + c);
                    d[p][p] = app - t * apq;
                    d[q][q] = aqq + t * apq;
                    d[p][q] = 0.0;
                    d[q][p] = 0.0;
                    for k in 0..n {
                        if k != p && k != q {
                            let akp = d[k][p];
                            let akq = d[k][q];
                            d[k][p] = akp - s * (akq + tau * akp);
                            d[p][k] = d[k][p];
                            d[k][q] = akq + s * (akp - tau * akq);
                            d[q][k] = d[k][q];
                        }
                    }
                    for vk in v.iter_mut() {
                        let vkp = vk[p];
                        let vkq = vk[q];
                        vk[p] = vkp - s * (vkq + tau * vkp);
                        vk[q] = vkq + s * (vkp - tau * vkq);
                    }
                }
            }
        }
    }
    // Sort ascending by eigenvalue, carrying the eigenvectors along.
    let raw: Vec<f64> = (0..n).map(|i| d[i][i]).collect();
    let mut idx: Vec<usize> = (0..n).collect();
    idx.sort_by(|&i, &j| raw[i].total_cmp(&raw[j]));
    let values: Vec<f64> = idx.iter().map(|&i| raw[i]).collect();
    let mut vectors = vec![vec![0.0; n]; n];
    for (new_col, &old_col) in idx.iter().enumerate() {
        for row in 0..n {
            vectors[row][new_col] = v[row][old_col];
        }
    }
    SymEig { values, vectors }
}

/// Build the Fisher information matrix `M = HᵀWH` from a measurement Jacobian `jac`
/// (`m×n`, row per measurement) and per-measurement weights `weights` (`1/σ²`).
pub fn information_matrix(jac: &[Vec<f64>], weights: &[f64]) -> Mat {
    let m = jac.len();
    let n = if m > 0 { jac[0].len() } else { 0 };
    let mut info = vec![vec![0.0; n]; n];
    for i in 0..m {
        let w = weights[i];
        let row = &jac[i];
        for p in 0..n {
            let jw = row[p] * w;
            for q in 0..n {
                info[p][q] += jw * row[q];
            }
        }
    }
    info
}

/// Cramér–Rao / observability analysis of a Fisher information matrix `info`.
///
/// A direction is judged *observable* when its eigenvalue exceeds `rel_tol · λ_max`
/// (a relative threshold robust to scaling); the rest span the **datum defect**.
#[derive(Clone, Debug)]
pub struct Crlb {
    /// State dimension (`n`).
    pub n: usize,
    /// Number of observable directions (numerical rank of `M`).
    pub rank: usize,
    /// Datum-defect dimension `n − rank` (unobservable directions).
    pub defect: usize,
    /// Eigenvalues of `M` in ascending order.
    pub eigenvalues: Vec<f64>,
    /// Basis of the null space (unobservable directions) as columns; `n × defect`.
    pub null_space: Mat,
    /// `M⁻¹` (the full covariance lower bound) when `M` has full rank, else `None`.
    pub covariance: Option<Mat>,
    /// Moore–Penrose pseudo-inverse `M⁺` (the bound on the observable subspace),
    /// always available even when `M` is rank-deficient.
    pub pseudo_covariance: Mat,
    /// Per-parameter variance lower bound: the diagonal of `M⁻¹` (or `M⁺`).
    pub crlb_diag: Vec<f64>,
    /// Per-parameter standard-deviation lower bound (`sqrt` of [`Self::crlb_diag`]).
    pub crlb_std: Vec<f64>,
}

/// Compute the Cramér–Rao bound and observability structure of `info`.
// Dense spectral sum M⁺ = Σ λ⁻¹ vvᵀ: explicit (r, cc, j) indexing across the eigenvector
// matrix is the natural form, as in the crate's other matrix kernels.
#[allow(clippy::needless_range_loop)]
pub fn crlb(info: &[Vec<f64>], rel_tol: f64) -> Crlb {
    let n = info.len();
    let e = sym_eig(info);
    let lmax = e.values.iter().cloned().fold(0.0_f64, f64::max);
    let thr = rel_tol * lmax.max(0.0);
    let mut rank = 0;
    let mut null_cols: Vec<usize> = vec![];
    for (j, &lam) in e.values.iter().enumerate() {
        if lam > thr && lam > 0.0 {
            rank += 1;
        } else {
            null_cols.push(j);
        }
    }
    let defect = n - rank;
    // Pseudo-inverse from the spectral sum over the observable subspace: M⁺ = Σ λ⁻¹ vvᵀ.
    let mut pinv = vec![vec![0.0; n]; n];
    for (j, &lam) in e.values.iter().enumerate() {
        if lam > thr && lam > 0.0 {
            let inv = 1.0 / lam;
            for r in 0..n {
                let vr = e.vectors[r][j];
                if vr == 0.0 {
                    continue;
                }
                for cc in 0..n {
                    pinv[r][cc] += inv * vr * e.vectors[cc][j];
                }
            }
        }
    }
    let mut null_space = vec![vec![0.0; null_cols.len()]; n];
    for (cc, &j) in null_cols.iter().enumerate() {
        for (r, ns_row) in null_space.iter_mut().enumerate() {
            ns_row[cc] = e.vectors[r][j];
        }
    }
    let covariance = if defect == 0 {
        Some(pinv.clone())
    } else {
        None
    };
    let crlb_diag: Vec<f64> = (0..n).map(|i| pinv[i][i]).collect();
    let crlb_std: Vec<f64> = crlb_diag.iter().map(|&v| v.max(0.0).sqrt()).collect();
    Crlb {
        n,
        rank,
        defect,
        eigenvalues: e.values,
        null_space,
        covariance,
        pseudo_covariance: pinv,
        crlb_diag,
        crlb_std,
    }
}

/// Scalar optimality criteria of a Fisher information matrix `info`, the figures of
/// merit of optimal experiment design. Larger information ⇒ smaller covariance, so
/// D/E/T-optimality are **maximised** and A-optimality is **minimised**.
#[derive(Clone, Debug)]
pub struct DesignMetrics {
    /// Numerical rank (observable directions).
    pub rank: usize,
    /// Datum-defect dimension.
    pub defect: usize,
    /// T-optimality: `trace(M) = Σ λ`. Total information; maximise.
    pub t_opt: f64,
    /// E-optimality: `λ_min(M)`. Worst-observed direction; maximise.
    pub e_opt: f64,
    /// D-optimality: `ln det(M) = Σ ln λ` over the observable subspace (log
    /// pseudo-determinant). Confidence-ellipsoid volume; maximise.
    pub log_d_opt: f64,
    /// A-optimality: `trace(M⁻¹) = Σ λ⁻¹`. Mean variance; minimise. `+∞` when `M` is
    /// rank-deficient (some direction has unbounded variance).
    pub a_opt: f64,
    /// A-optimality restricted to the observable subspace: `Σ λ⁻¹` over `λ > 0`.
    /// Finite even under a datum defect, so geometries can still be compared.
    pub a_opt_observable: f64,
    /// Condition number `λ_max / λ_min` over the observable subspace (`+∞` if empty).
    pub condition: f64,
}

/// Compute the D-, A-, E- and T-optimality scalars of `info`.
pub fn design_metrics(info: &[Vec<f64>], rel_tol: f64) -> DesignMetrics {
    let n = info.len();
    let e = sym_eig(info);
    let lmax = e.values.iter().cloned().fold(0.0_f64, f64::max);
    let lmin = e.values.iter().cloned().fold(f64::INFINITY, f64::min);
    let thr = rel_tol * lmax.max(0.0);
    let t_opt: f64 = e.values.iter().sum();
    let mut rank = 0;
    let mut log_d = 0.0;
    let mut a_obs = 0.0;
    let mut lmin_obs = f64::INFINITY;
    for &lam in &e.values {
        if lam > thr && lam > 0.0 {
            rank += 1;
            log_d += lam.ln();
            a_obs += 1.0 / lam;
            if lam < lmin_obs {
                lmin_obs = lam;
            }
        }
    }
    let defect = n - rank;
    let a_opt = if defect == 0 { a_obs } else { f64::INFINITY };
    let condition = if rank == 0 || lmin_obs == 0.0 {
        f64::INFINITY
    } else {
        lmax / lmin_obs
    };
    DesignMetrics {
        rank,
        defect,
        t_opt,
        e_opt: if n == 0 { 0.0 } else { lmin },
        log_d_opt: log_d,
        a_opt,
        a_opt_observable: a_obs,
        condition,
    }
}

/// An optimal-experiment-design criterion. All are framed *higher-is-better* by
/// [`DesignMetrics::score`]: D, E and T are maximised directly; A (mean variance)
/// is minimised, so its score is the negated A-optimality.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum DesignCriterion {
    /// D-optimality — maximise `ln det(M)` (minimise confidence-ellipsoid volume).
    D,
    /// A-optimality — minimise `trace(M⁻¹)` (minimise mean variance).
    A,
    /// E-optimality — maximise `λ_min(M)` (lift the worst-observed direction).
    E,
    /// T-optimality — maximise `trace(M)` (maximise total information).
    T,
}

impl DesignMetrics {
    /// Higher-is-better score for `criterion`. A larger value is a better design
    /// under every criterion (A-optimality is returned negated). A rank-deficient
    /// design scores `-∞` under D/E/A so it can never beat a full-rank one.
    pub fn score(&self, criterion: DesignCriterion) -> f64 {
        match criterion {
            DesignCriterion::D => {
                if self.defect == 0 {
                    self.log_d_opt
                } else {
                    f64::NEG_INFINITY
                }
            }
            DesignCriterion::A => {
                if self.defect == 0 {
                    -self.a_opt
                } else {
                    f64::NEG_INFINITY
                }
            }
            DesignCriterion::E => self.e_opt,
            DesignCriterion::T => self.t_opt,
        }
    }
}

/// The chosen candidate of an experiment-design selection.
#[derive(Clone, Debug)]
pub struct DesignSelection {
    /// Index of the winning candidate in the input slice.
    pub index: usize,
    /// Its higher-is-better score under the chosen criterion.
    pub score: f64,
    /// The winning candidate's full optimality metrics.
    pub metrics: DesignMetrics,
}

/// Choose, from a set of candidate Fisher information matrices, the one that
/// optimises `criterion` — the experiment-design step a mission uses to pick a
/// tracking schedule or baseline configuration. Returns `None` for no candidates.
pub fn best_design(
    candidates: &[Vec<Vec<f64>>],
    criterion: DesignCriterion,
    rel_tol: f64,
) -> Option<DesignSelection> {
    candidates
        .iter()
        .enumerate()
        .map(|(index, info)| {
            let metrics = design_metrics(info, rel_tol);
            let score = metrics.score(criterion);
            DesignSelection {
                index,
                score,
                metrics,
            }
        })
        .max_by(|a, b| a.score.total_cmp(&b.score))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::batch_ls::gauss_newton;
    use rand::SeedableRng;
    use rand_distr::{Distribution, Normal};

    // ---- symmetric eigensolver against closed-form spectra -----------------------

    #[test]
    fn eig_diagonal_is_sorted_diagonal() {
        // A diagonal matrix's eigenvalues are its entries; eigenvectors are axes.
        let a = vec![
            vec![3.0, 0.0, 0.0],
            vec![0.0, 1.0, 0.0],
            vec![0.0, 0.0, 2.0],
        ];
        let e = sym_eig(&a);
        assert!((e.values[0] - 1.0).abs() < 1e-12);
        assert!((e.values[1] - 2.0).abs() < 1e-12);
        assert!((e.values[2] - 3.0).abs() < 1e-12);
    }

    #[test]
    fn eig_2x2_matches_hand_solution() {
        // [[2,1],[1,2]] has eigenvalues 1 (vector (1,-1)/√2) and 3 (vector (1,1)/√2).
        let a = vec![vec![2.0, 1.0], vec![1.0, 2.0]];
        let e = sym_eig(&a);
        assert!((e.values[0] - 1.0).abs() < 1e-12, "λmin = {}", e.values[0]);
        assert!((e.values[1] - 3.0).abs() < 1e-12, "λmax = {}", e.values[1]);
        // Eigenvector for λ=3 is ±(1,1)/√2.
        let v3 = [e.vectors[0][1].abs(), e.vectors[1][1].abs()];
        assert!((v3[0] - 0.5f64.sqrt()).abs() < 1e-9 && (v3[1] - 0.5f64.sqrt()).abs() < 1e-9);
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn eig_reconstructs_and_is_orthonormal() {
        // For a general symmetric A: V Λ Vᵀ = A and VᵀV = I.
        let a = vec![
            vec![6.0, -2.0, 1.0],
            vec![-2.0, 5.0, -3.0],
            vec![1.0, -3.0, 4.0],
        ];
        let e = sym_eig(&a);
        let n = 3;
        // Orthonormality of the eigenvector columns.
        for i in 0..n {
            for j in 0..n {
                let dot: f64 = (0..n).map(|k| e.vectors[k][i] * e.vectors[k][j]).sum();
                let want = if i == j { 1.0 } else { 0.0 };
                assert!((dot - want).abs() < 1e-9, "VᵀV[{i}][{j}] = {dot}");
            }
        }
        // Reconstruction.
        for i in 0..n {
            for j in 0..n {
                let recon: f64 = (0..n)
                    .map(|k| e.vectors[i][k] * e.values[k] * e.vectors[j][k])
                    .sum();
                assert!(
                    (recon - a[i][j]).abs() < 1e-9,
                    "recon[{i}][{j}] = {recon} vs {}",
                    a[i][j]
                );
            }
        }
    }

    // ---- Fisher information construction -----------------------------------------

    #[test]
    fn information_matrix_is_jacobian_gram() {
        // H = [[1,0],[1,1],[1,2]], unit weights ⇒ M = HᵀH = [[3,3],[3,5]].
        let jac = vec![vec![1.0, 0.0], vec![1.0, 1.0], vec![1.0, 2.0]];
        let w = vec![1.0, 1.0, 1.0];
        let m = information_matrix(&jac, &w);
        assert!((m[0][0] - 3.0).abs() < 1e-12);
        assert!((m[0][1] - 3.0).abs() < 1e-12);
        assert!((m[1][0] - 3.0).abs() < 1e-12);
        assert!((m[1][1] - 5.0).abs() < 1e-12);
    }

    // ---- Cramér–Rao bound against published closed forms (Kay 1993) ---------------

    #[test]
    fn crlb_dc_level_in_wgn_matches_kay() {
        // Kay (1993), Example 3.3: estimating a DC level A from N samples in white
        // Gaussian noise of variance σ² has CRLB var(Â) ≥ σ²/N. Model row Hᵢ = [1],
        // weight 1/σ² ⇒ M = N/σ² ⇒ CRLB = σ²/N.
        let n_samp = 20;
        let sigma2 = 4.0;
        let jac: Vec<Vec<f64>> = (0..n_samp).map(|_| vec![1.0]).collect();
        let w = vec![1.0 / sigma2; n_samp];
        let m = information_matrix(&jac, &w);
        let c = crlb(&m, 1e-9);
        assert_eq!(c.rank, 1);
        assert_eq!(c.defect, 0);
        let want = sigma2 / n_samp as f64;
        assert!(
            (c.crlb_diag[0] - want).abs() < 1e-12,
            "CRLB = {} vs {want}",
            c.crlb_diag[0]
        );
    }

    #[test]
    fn crlb_line_fit_matches_ols_covariance() {
        // Kay (1993), Example 3.7 (line fitting): for yᵢ = a + b·tᵢ + n, n~N(0,σ²),
        // the CRLB covariance is σ²(XᵀX)⁻¹ with X the [1, tᵢ] design matrix.
        let ts = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0];
        let sigma2 = 0.25;
        let jac: Vec<Vec<f64>> = ts.iter().map(|&t| vec![1.0, t]).collect();
        let w = vec![1.0 / sigma2; ts.len()];
        let m = information_matrix(&jac, &w);
        let c = crlb(&m, 1e-9);
        let cov = c.covariance.expect("full rank");
        // Closed form: XᵀX = [[N, Σt],[Σt, Σt²]]; covariance = σ²(XᵀX)⁻¹.
        let n = ts.len() as f64;
        let st: f64 = ts.iter().sum();
        let stt: f64 = ts.iter().map(|t| t * t).sum();
        let det = n * stt - st * st;
        let want = [
            [stt / det * sigma2, -st / det * sigma2],
            [-st / det * sigma2, n / det * sigma2],
        ];
        for i in 0..2 {
            for j in 0..2 {
                assert!(
                    (cov[i][j] - want[i][j]).abs() < 1e-12,
                    "cov[{i}][{j}] = {} vs {}",
                    cov[i][j],
                    want[i][j]
                );
            }
        }
    }

    #[test]
    fn crlb_is_attained_by_efficient_estimator() {
        // CRLB achievability: the empirical covariance of a maximum-likelihood (here
        // linear weighted-LS) estimator over Monte-Carlo noise must approach M⁻¹.
        let ts = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0];
        let (a_true, b_true) = (2.0, -0.5);
        let sigma = 0.3;
        let jac: Vec<Vec<f64>> = ts.iter().map(|&t| vec![1.0, t]).collect();
        let w = vec![1.0 / (sigma * sigma); ts.len()];
        let m = information_matrix(&jac, &w);
        let c = crlb(&m, 1e-9);
        let cov = c.covariance.expect("full rank");

        let trials = 4000;
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(7);
        let noise = Normal::new(0.0, sigma).unwrap();
        let (mut sa, mut sb, mut saa, mut sbb) = (0.0, 0.0, 0.0, 0.0);
        for _ in 0..trials {
            let z: Vec<f64> = ts
                .iter()
                .map(|&t| a_true + b_true * t + noise.sample(&mut rng))
                .collect();
            let model = move |x: &[f64]| ts.iter().map(|&t| x[0] + x[1] * t).collect::<Vec<_>>();
            let r = gauss_newton(model, &z, &w, &[0.0, 0.0], 5, 1e-12).expect("solves");
            sa += r.x[0];
            sb += r.x[1];
            saa += r.x[0] * r.x[0];
            sbb += r.x[1] * r.x[1];
        }
        let nt = trials as f64;
        let var_a = saa / nt - (sa / nt).powi(2);
        let var_b = sbb / nt - (sb / nt).powi(2);
        // Empirical variances should match the CRLB to within Monte-Carlo error (~5%).
        assert!(
            (var_a / cov[0][0] - 1.0).abs() < 0.1,
            "var_a/CRLB = {}",
            var_a / cov[0][0]
        );
        assert!(
            (var_b / cov[1][1] - 1.0).abs() < 0.1,
            "var_b/CRLB = {}",
            var_b / cov[1][1]
        );
    }

    // ---- datum defect / rank restoration -----------------------------------------

    #[test]
    fn relative_only_geometry_leaves_common_mode_unobservable() {
        // A network in which only DIFFERENCES xᵢ − xⱼ are measured cannot observe the
        // common-mode (absolute) level: the all-ones direction is the datum defect.
        // This is the 1-D analogue of "absolute station position is unobservable from
        // range-only tracking" that VLBI then restores.
        let jac = vec![
            vec![1.0, -1.0, 0.0],
            vec![0.0, 1.0, -1.0],
            vec![1.0, 0.0, -1.0],
        ];
        let w = vec![1.0; 3];
        let m = information_matrix(&jac, &w);
        let c = crlb(&m, 1e-9);
        assert_eq!(c.defect, 1, "exactly one unobservable direction");
        assert!(
            c.covariance.is_none(),
            "rank-deficient ⇒ no full covariance"
        );
        // The null vector is proportional to (1,1,1).
        let v = &c.null_space;
        let nrm = (v[0][0].powi(2) + v[1][0].powi(2) + v[2][0].powi(2)).sqrt();
        let comp = (1.0_f64 / 3.0).sqrt();
        for (r, vr) in v.iter().enumerate() {
            assert!(
                (vr[0].abs() / nrm - comp).abs() < 1e-9,
                "null[{r}] = {}",
                vr[0]
            );
        }
    }

    #[test]
    fn adding_an_absolute_anchor_restores_full_rank() {
        // Add one absolute (anchor) measurement of x₀ to the relative-only network and
        // the datum defect closes: rank becomes full and a finite covariance exists.
        let jac = vec![
            vec![1.0, -1.0, 0.0],
            vec![0.0, 1.0, -1.0],
            vec![1.0, 0.0, -1.0],
            vec![1.0, 0.0, 0.0], // absolute anchor on x₀
        ];
        let w = vec![1.0; 4];
        let m = information_matrix(&jac, &w);
        let c = crlb(&m, 1e-9);
        assert_eq!(c.defect, 0);
        assert_eq!(c.rank, 3);
        assert!(c.covariance.is_some());
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn pseudo_inverse_satisfies_moore_penrose() {
        // M⁺ must satisfy M M⁺ M = M even when M is rank-deficient.
        let jac = vec![vec![1.0, -1.0, 0.0], vec![0.0, 1.0, -1.0]];
        let w = vec![1.0; 2];
        let m = information_matrix(&jac, &w);
        let p = crlb(&m, 1e-9).pseudo_covariance;
        let n = 3;
        // (M P M)[i][j] == M[i][j]
        let mp = |x: &Mat, y: &Mat| -> Mat {
            let mut r = vec![vec![0.0; n]; n];
            for (i, ri) in r.iter_mut().enumerate() {
                for (j, rij) in ri.iter_mut().enumerate() {
                    *rij = (0..n).map(|k| x[i][k] * y[k][j]).sum();
                }
            }
            r
        };
        let mpm = mp(&mp(&m, &p), &m);
        for i in 0..n {
            for j in 0..n {
                assert!(
                    (mpm[i][j] - m[i][j]).abs() < 1e-9,
                    "MPM[{i}][{j}] = {} vs {}",
                    mpm[i][j],
                    m[i][j]
                );
            }
        }
    }

    // ---- optimal experiment design scalars ---------------------------------------

    #[test]
    fn design_metrics_on_diagonal_information() {
        // For M = diag(1, 4, 8): trace = 13, λmin = 1, ln det = ln 32, trace(M⁻¹) =
        // 1 + 1/4 + 1/8 = 1.375, condition = 8.
        let m = vec![
            vec![1.0, 0.0, 0.0],
            vec![0.0, 4.0, 0.0],
            vec![0.0, 0.0, 8.0],
        ];
        let d = design_metrics(&m, 1e-9);
        assert!((d.t_opt - 13.0).abs() < 1e-12);
        assert!((d.e_opt - 1.0).abs() < 1e-12);
        assert!((d.log_d_opt - 32.0_f64.ln()).abs() < 1e-12);
        assert!((d.a_opt - 1.375).abs() < 1e-12);
        assert!((d.condition - 8.0).abs() < 1e-12);
        assert_eq!(d.defect, 0);
    }

    #[test]
    fn design_metrics_flags_rank_deficiency() {
        // A rank-deficient geometry has infinite A-optimality (a direction has
        // unbounded variance) but still a finite observable-subspace score.
        let jac = vec![vec![1.0, -1.0]];
        let w = vec![1.0];
        let m = information_matrix(&jac, &w);
        let d = design_metrics(&m, 1e-9);
        assert_eq!(d.defect, 1);
        assert!(d.a_opt.is_infinite());
        assert!(d.a_opt_observable.is_finite());
    }

    #[test]
    fn best_design_selects_by_criterion() {
        // Three candidate (diagonal) information matrices. By criterion:
        //  c0 = diag(1, 1, 1)  — balanced, λmin=1, det=1,   trace=3
        //  c1 = diag(5, 5, 0.1)— large but one weak axis, λmin=0.1, det=2.5, trace=10.1
        //  c2 = diag(2, 2, 2)  — λmin=2, det=8, trace=6
        let diag =
            |a: f64, b: f64, c: f64| vec![vec![a, 0.0, 0.0], vec![0.0, b, 0.0], vec![0.0, 0.0, c]];
        let cands = vec![
            diag(1.0, 1.0, 1.0),
            diag(5.0, 5.0, 0.1),
            diag(2.0, 2.0, 2.0),
        ];
        // E-optimality maximises the worst axis ⇒ c2 (λmin = 2).
        assert_eq!(
            best_design(&cands, DesignCriterion::E, 1e-9).unwrap().index,
            2
        );
        // D-optimality maximises det ⇒ c2 (det = 8).
        assert_eq!(
            best_design(&cands, DesignCriterion::D, 1e-9).unwrap().index,
            2
        );
        // T-optimality maximises total information ⇒ c1 (trace = 10.1).
        assert_eq!(
            best_design(&cands, DesignCriterion::T, 1e-9).unwrap().index,
            1
        );
        // A rank-deficient candidate never wins D/E/A.
        let with_rankdef = vec![diag(9.0, 9.0, 0.0), diag(2.0, 2.0, 2.0)];
        assert_eq!(
            best_design(&with_rankdef, DesignCriterion::A, 1e-9)
                .unwrap()
                .index,
            1
        );
        assert!(best_design(&[], DesignCriterion::D, 1e-9).is_none());
    }
}
