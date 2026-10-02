// SPDX-License-Identifier: AGPL-3.0-only
//! Square-root information linear algebra: Householder QR (orthogonal-triangular
//! decomposition), a square-root information filter (SRIF) measurement update, and the
//! seven-parameter datum read off a square-root information matrix without ever forming or
//! inverting an information matrix.
//!
//! ## Why
//!
//! A normal-equation solver forms the information matrix `F = J^T W J` and inverts it, so its
//! accuracy is governed by the condition number of `F`. A square-root solver triangularises the
//! whitened Jacobian `W^1/2 J = Q R` instead and works with `R`, whose condition number is the
//! square root of `F`'s. On the stations-estimated lunar frame campaign (joint information
//! condition number up to 3e13, Helmert condition number about 2e8) the spectral
//! normal-equation route of [`crate::fim::crlb`] loses about 1e-5 relative in the datum sigmas,
//! against about 1e-8 for a factorisation route (`tests/lunar_frame_campaign_mpmath_oracle.rs`).
//!
//! ## What it provides
//!
//! * [`householder_r`]: the triangular factor `R` (positive diagonal) of a tall matrix.
//! * [`Srif`]: a square-root information filter. Each [`Srif::update`] triangularises the
//!   current `R` stacked on a batch of whitened measurement rows, so `R^T R` is the accumulated
//!   information and is never formed. Marginalisation is free: when the nuisance parameters are
//!   ordered first, the trailing diagonal block `R_bb` satisfies `R_bb^T R_bb = S`, the Schur
//!   complement of the nuisance block.
//! * [`datum_from_sqrt_information`]: the seven-parameter Helmert datum from `R_bb` and the
//!   design `A`: `R_H` from a QR of `R_bb A`, sigmas as the row norms of `R_H^-1`, and the
//!   spectrum from a one-sided Jacobi singular value decomposition of `R_H`.
//!
//! ## Bit-reproducibility
//!
//! Every operation is an IEEE-754 addition, subtraction, multiplication, division or square
//! root, which are correctly rounded and give the same bits on every platform; nothing calls a
//! host mathematics library (no `hypot`, no transcendental). Inner products are compensated
//! (the Dot2 algorithm of Ogita, Rump and Oishi, 2005) with an error-free product built from
//! Dekker's split (Dekker 1971, Veltkamp's splitting constant `2^27 + 1`), so they do not depend
//! on whether the target has a fused multiply-add instruction. `f64::mul_add`, which is correctly
//! rounded by definition, is the reference the split is unit-tested against. The evaluation
//! order is fixed, so a result is a function of the inputs alone. These helpers belong with
//! `portable_math` and can move there once the open work on that module has folded.

/// Veltkamp's splitting constant for binary64, `2^27 + 1`.
const SPLITTER: f64 = 134_217_729.0;

/// Dekker's split: `a = hi + lo` exactly, each half carrying at most 26 significant bits.
/// Valid for `|a| < 2^996`.
#[inline]
fn split(a: f64) -> (f64, f64) {
    let c = SPLITTER * a;
    let hi = c - (c - a);
    (hi, a - hi)
}

/// Error-free sum (Knuth): `a + b = s + e` exactly, with `s = fl(a + b)`.
#[inline]
pub fn two_sum(a: f64, b: f64) -> (f64, f64) {
    let s = a + b;
    let bb = s - a;
    (s, (a - (s - bb)) + (b - bb))
}

/// Error-free product (Dekker): `a * b = p + e` exactly, with `p = fl(a * b)`, computed from
/// basic operations only (no fused multiply-add). Exact unless the product underflows or a
/// factor exceeds `2^996`.
#[inline]
pub fn two_prod(a: f64, b: f64) -> (f64, f64) {
    let p = a * b;
    let (ah, al) = split(a);
    let (bh, bl) = split(b);
    let e = al * bl - (((p - ah * bh) - al * bh) - ah * bl);
    (p, e)
}

/// Compensated dot product (Dot2): as accurate as if computed in twice the working precision
/// and then rounded, in a fixed evaluation order.
pub fn dot2(x: &[f64], y: &[f64]) -> f64 {
    debug_assert_eq!(x.len(), y.len());
    let mut s = 0.0;
    let mut c = 0.0;
    for (a, b) in x.iter().zip(y) {
        let (p, ep) = two_prod(*a, *b);
        let (t, es) = two_sum(s, p);
        s = t;
        c += ep + es;
    }
    s + c
}

/// The upper-triangular factor `R` (`n x n`, non-negative diagonal) of the `m x n` matrix `a`
/// (rows), by Householder reflections: `a = Q R` with `Q` orthogonal. Rows beyond `m` are zero
/// when `m < n`; a column with nothing left below the diagonal gets no reflection and a zero
/// diagonal entry.
pub fn householder_r(a: &[Vec<f64>], n: usize) -> Vec<Vec<f64>> {
    let m = a.len();
    // Column-major working copy.
    let mut cols: Vec<Vec<f64>> = (0..n)
        .map(|j| a.iter().map(|row| row[j]).collect())
        .collect();
    for k in 0..n.min(m) {
        let scale = cols[k][k..].iter().fold(0.0_f64, |s, x| s.max(x.abs()));
        if scale == 0.0 {
            continue;
        }
        // The reflector is invariant to the scaling of v, so work with x / scale throughout.
        let v0: Vec<f64> = cols[k][k..].iter().map(|x| x / scale).collect();
        let norm = dot2(&v0, &v0).sqrt();
        let alpha = if v0[0] >= 0.0 { -norm } else { norm };
        let mut v = v0;
        v[0] -= alpha; // opposite signs: no cancellation
        let vtv = dot2(&v, &v);
        cols[k][k] = alpha * scale;
        for x in cols[k][k + 1..].iter_mut() {
            *x = 0.0;
        }
        for col in cols.iter_mut().skip(k + 1) {
            let w = dot2(&v, &col[k..]);
            let f = 2.0 * w / vtv;
            for (x, vi) in col[k..].iter_mut().zip(&v) {
                *x -= f * vi;
            }
        }
    }
    let mut r = vec![vec![0.0; n]; n];
    for (i, row) in r.iter_mut().enumerate().take(n.min(m)) {
        for (j, x) in row.iter_mut().enumerate().skip(i) {
            *x = cols[j][i];
        }
        if row[i] < 0.0 {
            for x in row.iter_mut() {
                *x = -*x;
            }
        }
    }
    r
}

/// `R^T R` for an upper-triangular (or any square) `r`, by compensated inner products.
pub fn gram(r: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = r.first().map_or(0, Vec::len);
    let cols: Vec<Vec<f64>> = (0..n)
        .map(|j| r.iter().map(|row| row[j]).collect())
        .collect();
    (0..n)
        .map(|i| (0..n).map(|j| dot2(&cols[i], &cols[j])).collect())
        .collect()
}

/// A square-root information filter over `n` parameters with no process model: the
/// measurement update only, which is what a batch campaign needs.
#[derive(Clone, Debug)]
pub struct Srif {
    r: Vec<Vec<f64>>,
}

impl Srif {
    /// A filter with no prior information (`R = 0`).
    pub fn new(n: usize) -> Srif {
        Srif {
            r: vec![vec![0.0; n]; n],
        }
    }

    /// Absorb a batch of measurement rows `jac` (each of length `n`) with weights `weights`
    /// (inverse variances): `R` is replaced by the triangular factor of `R` stacked on the
    /// whitened rows `sqrt(w_i) jac_i`.
    pub fn update(&mut self, jac: &[Vec<f64>], weights: &[f64]) {
        assert_eq!(jac.len(), weights.len(), "one weight per row");
        let n = self.r.len();
        let mut stacked = self.r.clone();
        for (row, &w) in jac.iter().zip(weights) {
            assert_eq!(row.len(), n, "row length");
            let s = w.sqrt();
            stacked.push(row.iter().map(|x| x * s).collect());
        }
        self.r = householder_r(&stacked, n);
    }

    /// The square-root information matrix `R` (upper triangular).
    pub fn r(&self) -> &[Vec<f64>] {
        &self.r
    }

    /// The trailing `k x k` diagonal block of `R`: the square root of the information on the
    /// last `k` parameters with the leading ones marginalised.
    pub fn trailing_block(&self, k: usize) -> Vec<Vec<f64>> {
        let n = self.r.len();
        self.r[n - k..]
            .iter()
            .map(|row| row[n - k..].to_vec())
            .collect()
    }
}

/// The inverse of an upper-triangular `r` by back substitution, or `None` when a diagonal entry
/// is zero.
pub fn upper_tri_inverse(r: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = r.len();
    if (0..n).any(|i| r[i][i] == 0.0) {
        return None;
    }
    let mut x = vec![vec![0.0; n]; n];
    for j in 0..n {
        for i in (0..=j).rev() {
            let rhs = if i == j { 1.0 } else { 0.0 };
            let acc = dot2(
                &r[i][i + 1..=j],
                &(i + 1..=j).map(|k| x[k][j]).collect::<Vec<_>>(),
            );
            x[i][j] = (rhs - acc) / r[i][i];
        }
    }
    Some(x)
}

/// Singular values (ascending) and right singular vectors (as columns, `v[row][col]`) of a
/// square matrix, by one-sided (Hestenes) Jacobi rotations on its columns. Uses square roots
/// and basic operations only.
pub fn jacobi_svd(a: &[Vec<f64>]) -> (Vec<f64>, Vec<Vec<f64>>) {
    let n = a.len();
    let mut u: Vec<Vec<f64>> = (0..n)
        .map(|j| a.iter().map(|row| row[j]).collect())
        .collect();
    let mut v: Vec<Vec<f64>> = (0..n)
        .map(|j| (0..n).map(|i| if i == j { 1.0 } else { 0.0 }).collect())
        .collect();
    for _sweep in 0..60 {
        let mut rotated = false;
        for p in 0..n {
            for q in (p + 1)..n {
                let alpha = dot2(&u[p], &u[p]);
                let beta = dot2(&u[q], &u[q]);
                let gamma = dot2(&u[p], &u[q]);
                if gamma == 0.0 || gamma.abs() <= f64::EPSILON * (alpha * beta).sqrt() {
                    continue;
                }
                rotated = true;
                let zeta = (beta - alpha) / (2.0 * gamma);
                let az = zeta.abs();
                let root = if az > 1e150 {
                    az
                } else {
                    (1.0 + az * az).sqrt()
                };
                let sign = if zeta >= 0.0 { 1.0 } else { -1.0 };
                let t = sign / (az + root);
                let c = 1.0 / (1.0 + t * t).sqrt();
                let s = c * t;
                for cols in [&mut u, &mut v] {
                    let (lo, hi) = cols.split_at_mut(q);
                    for (xp, xq) in lo[p].iter_mut().zip(hi[0].iter_mut()) {
                        let (a, b) = (*xp, *xq);
                        *xp = c * a - s * b;
                        *xq = s * a + c * b;
                    }
                }
            }
        }
        if !rotated {
            break;
        }
    }
    let sv: Vec<f64> = u.iter().map(|c| dot2(c, c).sqrt()).collect();
    let mut order: Vec<usize> = (0..n).collect();
    order.sort_by(|&i, &j| sv[i].total_cmp(&sv[j]).then(i.cmp(&j)));
    let values = order.iter().map(|&k| sv[k]).collect();
    let vectors = (0..n)
        .map(|row| order.iter().map(|&k| v[k][row]).collect())
        .collect();
    (values, vectors)
}

/// The solution of a weighted linear least-squares problem by the square-root route.
#[derive(Clone, Debug)]
pub struct LsqSqrt {
    /// The minimiser of `||W^1/2 (J x - b)||`.
    pub x: Vec<f64>,
    /// The square-root information matrix `R` (upper triangular, `R^T R = J^T W J`).
    pub r: Vec<Vec<f64>>,
    /// The weighted residual norm `||W^1/2 (J x - b)||` at the minimiser.
    pub residual_norm: f64,
}

/// Solve `min ||W^1/2 (J x - b)||` by Householder QR of the augmented whitened matrix
/// `[W^1/2 J | W^1/2 b]`, without forming `J^T W J`: the leading `n x n` block of the triangular
/// factor is `R`, its last column carries `Q^T W^1/2 b`, and `x` follows by back substitution.
/// `None` on a dimension mismatch, a negative or non-finite weight, or a zero diagonal in `R`
/// (rank-deficient `J`).
pub fn weighted_lstsq(jac: &[Vec<f64>], weights: &[f64], rhs: &[f64]) -> Option<LsqSqrt> {
    let m = jac.len();
    let n = jac.first().map_or(0, Vec::len);
    if n == 0
        || m < n
        || weights.len() != m
        || rhs.len() != m
        || jac.iter().any(|row| row.len() != n)
        || weights.iter().any(|w| !w.is_finite() || *w < 0.0)
    {
        return None;
    }
    let aug: Vec<Vec<f64>> = jac
        .iter()
        .zip(weights)
        .zip(rhs)
        .map(|((row, &w), &b)| {
            let s = w.sqrt();
            row.iter()
                .map(|v| v * s)
                .chain(std::iter::once(b * s))
                .collect()
        })
        .collect();
    let ra = householder_r(&aug, n + 1);
    let r: Vec<Vec<f64>> = ra[..n].iter().map(|row| row[..n].to_vec()).collect();
    if (0..n).any(|i| r[i][i] == 0.0) {
        return None;
    }
    let qtb: Vec<f64> = ra[..n].iter().map(|row| row[n]).collect();
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let acc = dot2(&r[i][i + 1..], &x[i + 1..]);
        x[i] = (qtb[i] - acc) / r[i][i];
    }
    Some(LsqSqrt {
        x,
        residual_norm: ra[n][n].abs(),
        r,
    })
}

/// The covariance `R^-1 R^-T` from a square-root information matrix, without forming or inverting
/// `R^T R`. `None` when `R` has a zero diagonal entry.
pub fn covariance_from_sqrt_information(r: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let x = upper_tri_inverse(r)?;
    Some(
        x.iter()
            .map(|row_i| x.iter().map(|row_j| dot2(row_i, row_j)).collect())
            .collect(),
    )
}

/// A seven-parameter datum solution computed from a square-root information matrix.
#[derive(Clone, Debug)]
pub struct SqrtDatum {
    /// Numerical rank: eigenvalues of `H = R_H^T R_H` above `rel_tol` of the largest.
    pub rank: usize,
    /// Eigenvalues of `H` (squared singular values of `R_H`), ascending.
    pub eigenvalues: Vec<f64>,
    /// `lambda_max / lambda_min` (infinite when rank-deficient).
    pub condition: f64,
    /// Per-parameter standard deviations, the row norms of `R_H^-1`; empty unless full rank.
    pub sigma: Vec<f64>,
    /// Right singular vector of the smallest singular value, largest-magnitude component made
    /// positive.
    pub weakest_direction: Vec<f64>,
    /// The smallest eigenvalue of `H`.
    pub weakest_eigenvalue: f64,
    /// True when `rank` equals the number of parameters and `R_H` is invertible.
    pub full_rank: bool,
}

/// The datum of the design `a` (`k x p` rows) on the square-root information `r_bb` (`k x k`,
/// upper triangular) of the points it acts on: `R_H` is the triangular factor of `B = R_bb A`, so
/// `R_H^T R_H = A^T R_bb^T R_bb A = H`. `None` when `B` has fewer rows than columns.
pub fn datum_from_sqrt_information(
    r_bb: &[Vec<f64>],
    a: &[Vec<f64>],
    rel_tol: f64,
) -> Option<SqrtDatum> {
    let k = r_bb.len();
    let p = a.first().map_or(0, Vec::len);
    if k < p || a.len() != k {
        return None;
    }
    let a_cols: Vec<Vec<f64>> = (0..p)
        .map(|j| a.iter().map(|row| row[j]).collect())
        .collect();
    let b: Vec<Vec<f64>> = r_bb
        .iter()
        .map(|row| a_cols.iter().map(|c| dot2(row, c)).collect())
        .collect();
    let r_h = householder_r(&b, p);
    let (sv, vecs) = jacobi_svd(&r_h);
    let eigenvalues: Vec<f64> = sv.iter().map(|s| s * s).collect();
    let lmax = eigenvalues[p - 1];
    let rank = eigenvalues
        .iter()
        .filter(|&&l| l > 0.0 && l > rel_tol * lmax)
        .count();
    let mut weakest: Vec<f64> = (0..p).map(|i| vecs[i][0]).collect();
    let pivot = (0..p).fold(0, |b, i| {
        if weakest[i].abs() > weakest[b].abs() {
            i
        } else {
            b
        }
    });
    if weakest[pivot] < 0.0 {
        for x in &mut weakest {
            *x = -*x;
        }
    }
    let inverse = if rank == p {
        upper_tri_inverse(&r_h)
    } else {
        None
    };
    let full_rank = inverse.is_some();
    let sigma = inverse
        .map(|x| x.iter().map(|row| dot2(row, row).sqrt()).collect())
        .unwrap_or_default();
    Some(SqrtDatum {
        rank,
        condition: if full_rank {
            lmax / eigenvalues[0]
        } else {
            f64::INFINITY
        },
        weakest_eigenvalue: eigenvalues[0],
        eigenvalues,
        sigma,
        weakest_direction: weakest,
        full_rank,
    })
}

#[cfg(test)]
#[allow(clippy::needless_range_loop)] // index loops mirror the matrix formulas they check
mod tests {
    use super::*;

    /// A deterministic pseudo-random stream (a 64-bit linear congruential generator) in
    /// `[-1, 1)`, so the tests need no random-number crate state.
    fn stream(seed: u64) -> impl FnMut() -> f64 {
        let mut s = seed;
        move || {
            s = s
                .wrapping_mul(6_364_136_223_846_793_005)
                .wrapping_add(1_442_695_040_888_963_407);
            ((s >> 11) as f64) / ((1u64 << 52) as f64) - 1.0
        }
    }

    fn matmul_t(a: &[Vec<f64>], b: &[Vec<f64>]) -> Vec<Vec<f64>> {
        // a^T b
        let n = a[0].len();
        let p = b[0].len();
        (0..n)
            .map(|i| {
                (0..p)
                    .map(|j| a.iter().zip(b).map(|(ra, rb)| ra[i] * rb[j]).sum())
                    .collect()
            })
            .collect()
    }

    #[test]
    fn the_dekker_product_is_error_free_and_equals_the_fused_multiply_add_residual() {
        let mut g = stream(7);
        for _ in 0..20_000 {
            let a = g() * 10f64.powi((g() * 30.0) as i32);
            let b = g() * 10f64.powi((g() * 30.0) as i32);
            let (p, e) = two_prod(a, b);
            assert_eq!(p, a * b);
            // The exact residual of a correctly rounded product, by a fused multiply-add.
            assert_eq!(e, a.mul_add(b, -p), "a {a:e} b {b:e}");
        }
    }

    #[test]
    fn the_compensated_dot_product_recovers_a_sum_that_cancels() {
        // 1e16 + 1 - 1e16 cancels completely in naive summation order; Dot2 keeps the 1.
        let x = [1e16, 1.0, -1e16, 3.0];
        let y = [1.0, 1.0, 1.0, 1.0];
        assert_eq!(dot2(&x, &y), 4.0);
    }

    #[test]
    fn householder_r_reproduces_the_gram_matrix_and_is_upper_triangular() {
        let mut g = stream(11);
        let a: Vec<Vec<f64>> = (0..30).map(|_| (0..6).map(|_| g()).collect()).collect();
        let r = householder_r(&a, 6);
        let ata = matmul_t(&a, &a);
        let rtr = gram(&r);
        for i in 0..6 {
            assert!(r[i][i] > 0.0, "positive diagonal");
            for j in 0..i {
                assert_eq!(r[i][j], 0.0);
            }
            for j in 0..6 {
                assert!((ata[i][j] - rtr[i][j]).abs() < 1e-13 * ata[i][i].max(ata[j][j]));
            }
        }
    }

    #[test]
    fn sequential_updates_equal_one_batch_update() {
        let mut g = stream(13);
        let a: Vec<Vec<f64>> = (0..40).map(|_| (0..5).map(|_| g()).collect()).collect();
        let w: Vec<f64> = (0..40).map(|_| 1.0 + g().abs()).collect();
        let mut batch = Srif::new(5);
        batch.update(&a, &w);
        let mut seq = Srif::new(5);
        for (chunk, wc) in a.chunks(7).zip(w.chunks(7)) {
            seq.update(chunk, wc);
        }
        let (gb, gs) = (gram(batch.r()), gram(seq.r()));
        for i in 0..5 {
            for j in 0..5 {
                assert!((gb[i][j] - gs[i][j]).abs() < 1e-12 * gb[i][i].max(gb[j][j]));
            }
        }
    }

    #[test]
    fn the_trailing_block_is_the_square_root_of_the_schur_complement() {
        let mut g = stream(17);
        let a: Vec<Vec<f64>> = (0..30).map(|_| (0..5).map(|_| g()).collect()).collect();
        let mut f = Srif::new(5);
        f.update(&a, &[1.0; 30]);
        let s_sqrt = gram(&f.trailing_block(3));
        // Schur complement of the leading 2x2 block of A^T A, by explicit 2x2 inverse.
        let m = matmul_t(&a, &a);
        let det = m[0][0] * m[1][1] - m[0][1] * m[1][0];
        let inv = [
            [m[1][1] / det, -m[0][1] / det],
            [-m[1][0] / det, m[0][0] / det],
        ];
        for i in 0..3 {
            for j in 0..3 {
                let mut corr = 0.0;
                for p in 0..2 {
                    for q in 0..2 {
                        corr += m[p][2 + i] * inv[p][q] * m[q][2 + j];
                    }
                }
                let s = m[2 + i][2 + j] - corr;
                assert!((s - s_sqrt[i][j]).abs() < 1e-12 * m[2 + i][2 + i]);
            }
        }
    }

    #[test]
    fn the_triangular_inverse_is_an_inverse() {
        let mut g = stream(19);
        let a: Vec<Vec<f64>> = (0..12).map(|_| (0..7).map(|_| g()).collect()).collect();
        let r = householder_r(&a, 7);
        let x = upper_tri_inverse(&r).expect("invertible");
        for i in 0..7 {
            for j in 0..7 {
                let e: f64 = (0..7).map(|k| r[i][k] * x[k][j]).sum();
                assert!((e - if i == j { 1.0 } else { 0.0 }).abs() < 1e-12);
            }
        }
        let mut z = r.clone();
        z[3][3] = 0.0;
        assert!(upper_tri_inverse(&z).is_none());
    }

    #[test]
    fn the_jacobi_svd_diagonalises_and_orders_ascending() {
        let mut g = stream(23);
        let a: Vec<Vec<f64>> = (0..7).map(|_| (0..7).map(|_| g()).collect()).collect();
        let (s, v) = jacobi_svd(&a);
        for w in s.windows(2) {
            assert!(w[0] <= w[1]);
        }
        // A^T A v_k = s_k^2 v_k and V orthonormal.
        let ata = matmul_t(&a, &a);
        for k in 0..7 {
            for i in 0..7 {
                let lhs: f64 = (0..7).map(|j| ata[i][j] * v[j][k]).sum();
                assert!((lhs - s[k] * s[k] * v[i][k]).abs() < 1e-12 * s[6] * s[6]);
            }
            for l in 0..7 {
                let d: f64 = (0..7).map(|i| v[i][k] * v[i][l]).sum();
                assert!((d - if k == l { 1.0 } else { 0.0 }).abs() < 1e-13);
            }
        }
    }

    #[test]
    fn the_sqrt_datum_matches_the_normal_equation_datum_on_a_well_conditioned_case() {
        let mut g = stream(29);
        let a: Vec<Vec<f64>> = (0..12).map(|_| (0..7).map(|_| g()).collect()).collect();
        let mut f = Srif::new(12);
        let rows: Vec<Vec<f64>> = (0..40).map(|_| (0..12).map(|_| g()).collect()).collect();
        f.update(&rows, &[4.0; 40]);
        let d = datum_from_sqrt_information(f.r(), &a, 1e-9).expect("datum");
        assert!(d.full_rank);
        let h = {
            let info = gram(f.r());
            let ia: Vec<Vec<f64>> = info
                .iter()
                .map(|row| {
                    (0..7)
                        .map(|j| (0..12).map(|k| row[k] * a[k][j]).sum())
                        .collect()
                })
                .collect();
            matmul_t(&a, &ia)
        };
        let c = crate::fim::crlb(&h, 1e-9);
        for k in 0..7 {
            assert!((d.sigma[k] - c.crlb_std[k]).abs() < 1e-10 * c.crlb_std[k]);
        }
        let n2: f64 = d.weakest_direction.iter().map(|x| x * x).sum();
        assert!((n2 - 1.0).abs() < 1e-13);
    }

    #[test]
    fn weighted_lstsq_recovers_an_exact_solution_and_its_covariance() {
        let mut g = stream(37);
        let truth: Vec<f64> = (0..4).map(|_| g()).collect();
        let jac: Vec<Vec<f64>> = (0..15).map(|_| (0..4).map(|_| g()).collect()).collect();
        let w: Vec<f64> = (0..15).map(|_| 1.0 + g().abs()).collect();
        let b: Vec<f64> = jac
            .iter()
            .map(|row| row.iter().zip(&truth).map(|(a, x)| a * x).sum())
            .collect();
        let s = weighted_lstsq(&jac, &w, &b).expect("solves");
        for (x, t) in s.x.iter().zip(&truth) {
            assert!((x - t).abs() < 1e-13);
        }
        assert!(s.residual_norm < 1e-13);
        // The covariance inverts J^T W J.
        let c = covariance_from_sqrt_information(&s.r).expect("full rank");
        let info = gram(&s.r);
        for i in 0..4 {
            for j in 0..4 {
                let e: f64 = (0..4).map(|k| info[i][k] * c[k][j]).sum();
                assert!((e - if i == j { 1.0 } else { 0.0 }).abs() < 1e-11);
            }
        }
        assert!(weighted_lstsq(&jac[..3], &w[..3], &b[..3]).is_none());
    }

    #[test]
    fn weighted_lstsq_keeps_accuracy_where_the_normal_equations_lose_it() {
        // The Lauchli matrix [1 1; e 0; 0 e] with e = 1e-9: plainly accumulated, J^T J =
        // [1+e^2 1; 1 1+e^2] rounds to the singular all-ones matrix in binary64 (e^2 is below the
        // unit roundoff), while QR solves the problem to about u cond(J), here 1.6e-7.
        let e = 1e-9;
        let jac = vec![vec![1.0, 1.0], vec![e, 0.0], vec![0.0, e]];
        let truth = [0.3, -0.7];
        let b: Vec<f64> = jac
            .iter()
            .map(|row| row[0] * truth[0] + row[1] * truth[1])
            .collect();
        let s = weighted_lstsq(&jac, &[1.0; 3], &b).expect("solves");
        for (x, t) in s.x.iter().zip(truth) {
            assert!((x - t).abs() < 1e-6, "{x} vs {t}");
        }
        let normal = matmul_t(&jac, &jac);
        assert_eq!(
            normal[0][0] * normal[1][1] - normal[0][1] * normal[1][0],
            0.0
        );
    }

    #[test]
    fn identical_inputs_give_identical_bits() {
        let mut g = stream(31);
        let rows: Vec<Vec<f64>> = (0..25).map(|_| (0..9).map(|_| g()).collect()).collect();
        let a: Vec<Vec<f64>> = (0..9).map(|_| (0..7).map(|_| g()).collect()).collect();
        let run = || {
            let mut f = Srif::new(9);
            f.update(&rows, &[2.0; 25]);
            datum_from_sqrt_information(f.r(), &a, 1e-9).expect("datum")
        };
        let (x, y) = (run(), run());
        let bits = |d: &SqrtDatum| {
            d.sigma
                .iter()
                .chain(&d.eigenvalues)
                .chain(&d.weakest_direction)
                .map(|v| v.to_bits())
                .collect::<Vec<_>>()
        };
        assert_eq!(bits(&x), bits(&y));
    }
}
