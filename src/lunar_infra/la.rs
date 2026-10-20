// SPDX-License-Identifier: AGPL-3.0-only
//! Small dense linear algebra for the lunar-infrastructure studies: plain `f64` arithmetic and
//! square roots only, so native and WebAssembly give the same bits.

/// A dense row-major matrix.
pub type Mat = Vec<Vec<f64>>;

/// An `r x c` zero matrix.
pub fn zeros(r: usize, c: usize) -> Mat {
    vec![vec![0.0; c]; r]
}

/// The `n x n` identity.
pub fn identity(n: usize) -> Mat {
    let mut m = zeros(n, n);
    for (i, row) in m.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    m
}

/// Transpose.
pub fn transpose(a: &Mat) -> Mat {
    let (r, c) = (a.len(), a.first().map_or(0, Vec::len));
    let mut t = zeros(c, r);
    for i in 0..r {
        for j in 0..c {
            t[j][i] = a[i][j];
        }
    }
    t
}

/// Matrix product `a b`.
pub fn matmul(a: &Mat, b: &Mat) -> Mat {
    let (r, k, c) = (a.len(), b.len(), b.first().map_or(0, Vec::len));
    let mut out = zeros(r, c);
    for i in 0..r {
        for p in 0..k {
            let aip = a[i][p];
            if aip == 0.0 {
                continue;
            }
            for j in 0..c {
                out[i][j] += aip * b[p][j];
            }
        }
    }
    out
}

/// Matrix-vector product `a x`.
pub fn matvec(a: &Mat, x: &[f64]) -> Vec<f64> {
    a.iter()
        .map(|row| row.iter().zip(x).map(|(p, q)| p * q).sum())
        .collect()
}

/// `a + b`.
pub fn add(a: &Mat, b: &Mat) -> Mat {
    a.iter()
        .zip(b)
        .map(|(ra, rb)| ra.iter().zip(rb).map(|(p, q)| p + q).collect())
        .collect()
}

/// Trace of a square matrix.
pub fn trace(a: &Mat) -> f64 {
    (0..a.len()).map(|i| a[i][i]).sum()
}

/// The inverse of a square matrix by Gauss-Jordan elimination with partial pivoting; `None` when
/// a pivot is smaller than `1e-300` times the largest entry of its column scale (singular).
pub fn inverse(a: &Mat) -> Option<Mat> {
    let n = a.len();
    let mut m: Mat = a
        .iter()
        .enumerate()
        .map(|(i, row)| {
            let mut r = row.clone();
            r.extend((0..n).map(|j| if i == j { 1.0 } else { 0.0 }));
            r
        })
        .collect();
    for col in 0..n {
        let mut piv = col;
        for r in col + 1..n {
            if m[r][col].abs() > m[piv][col].abs() {
                piv = r;
            }
        }
        if m[piv][col].abs() < 1e-300 {
            return None;
        }
        m.swap(col, piv);
        let d = m[col][col];
        for v in m[col].iter_mut() {
            *v /= d;
        }
        for r in 0..n {
            if r != col {
                let f = m[r][col];
                if f != 0.0 {
                    for c in 0..2 * n {
                        let t = m[col][c];
                        m[r][c] -= f * t;
                    }
                }
            }
        }
    }
    Some(m.into_iter().map(|r| r[n..].to_vec()).collect())
}

/// Cholesky factor `l` (lower triangular, `a = l l'`) of a symmetric positive-definite matrix.
pub fn cholesky(a: &Mat) -> Option<Mat> {
    let n = a.len();
    let mut l = zeros(n, n);
    for i in 0..n {
        for j in 0..=i {
            let mut s = a[i][j];
            for k in 0..j {
                s -= l[i][k] * l[j][k];
            }
            if i == j {
                if s <= 0.0 {
                    return None;
                }
                l[i][i] = s.sqrt();
            } else {
                l[i][j] = s / l[j][j];
            }
        }
    }
    Some(l)
}

/// The quadratic form `x' a x`.
pub fn quad(a: &Mat, x: &[f64]) -> f64 {
    matvec(a, x).iter().zip(x).map(|(p, q)| p * q).sum()
}

/// The leading `n x n` block.
pub fn block(a: &Mat, n: usize) -> Mat {
    a.iter().take(n).map(|r| r[..n].to_vec()).collect()
}

/// Symmetrise: `(a + a') / 2`.
pub fn sym(a: &Mat) -> Mat {
    let n = a.len();
    let mut s = a.clone();
    for i in 0..n {
        for j in 0..n {
            s[i][j] = 0.5 * (a[i][j] + a[j][i]);
        }
    }
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn inverse_recovers_the_identity() {
        let a = vec![
            vec![4.0, 1.0, 2.0],
            vec![1.0, 3.0, 0.5],
            vec![2.0, 0.5, 5.0],
        ];
        let p = matmul(&a, &inverse(&a).unwrap());
        for i in 0..3 {
            for j in 0..3 {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!((p[i][j] - want).abs() < 1e-13);
            }
        }
        assert!(inverse(&vec![vec![1.0, 2.0], vec![2.0, 4.0]]).is_none());
    }

    #[test]
    fn cholesky_reconstructs_and_rejects_an_indefinite_matrix() {
        let a = vec![vec![4.0, 2.0], vec![2.0, 3.0]];
        let l = cholesky(&a).unwrap();
        let r = matmul(&l, &transpose(&l));
        for i in 0..2 {
            for j in 0..2 {
                assert!((r[i][j] - a[i][j]).abs() < 1e-14);
            }
        }
        assert!(cholesky(&vec![vec![1.0, 2.0], vec![2.0, 1.0]]).is_none());
    }

    #[test]
    fn quad_form_and_trace() {
        let a = vec![vec![2.0, 0.0], vec![0.0, 3.0]];
        assert_eq!(quad(&a, &[1.0, 2.0]), 14.0);
        assert_eq!(trace(&a), 5.0);
    }
}
