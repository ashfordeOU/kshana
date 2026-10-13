// SPDX-License-Identifier: AGPL-3.0-only
//! Small fixed-size dense linear-Kalman kernels shared by the augmented coupled
//! filters ([`super::coupled::CoupledPntBiasFilter`], [`super::coupled3d::CoupledPnt3d`]).
//!
//! The original 4-state [`super::coupled::CoupledPntFilter`] keeps its own hand-unrolled
//! arithmetic and does **not** use these kernels, so its outputs (and the filterpy
//! fixture that pins them) are untouched by anything here.

// Index loops read as the matrix algebra they implement.
#![allow(clippy::needless_range_loop)]

/// An `N×N` matrix, row-major.
pub(crate) type Mat<const N: usize> = [[f64; N]; N];

/// The scalar innovation of one measurement update: the residual `ν = z − h·x⁻` and
/// its predicted variance `S = h P⁻ hᵀ + r`. `ν²/S` is the normalised innovation
/// squared (NIS), χ²(1)-distributed for a consistent filter.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Innovation {
    /// Measurement residual against the prior estimate, in the measurement's unit.
    pub innovation: f64,
    /// Predicted innovation variance `h P⁻ hᵀ + r`, in the measurement's unit squared.
    pub variance: f64,
}

impl Innovation {
    /// Normalised innovation squared `ν²/S`.
    pub fn nis(&self) -> f64 {
        self.innovation * self.innovation / self.variance
    }
}

pub(crate) fn dot<const N: usize>(a: &[f64; N], b: &[f64; N]) -> f64 {
    let mut s = 0.0;
    for i in 0..N {
        s += a[i] * b[i];
    }
    s
}

pub(crate) fn mat_vec<const N: usize>(m: &Mat<N>, v: &[f64; N]) -> [f64; N] {
    let mut o = [0.0; N];
    for (oi, mi) in o.iter_mut().zip(m.iter()) {
        *oi = dot(mi, v);
    }
    o
}

/// `A · B`.
pub(crate) fn mat_mul<const N: usize>(a: &Mat<N>, b: &Mat<N>) -> Mat<N> {
    let mut o = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            let mut s = 0.0;
            for k in 0..N {
                s += a[i][k] * b[k][j];
            }
            o[i][j] = s;
        }
    }
    o
}

/// `A · Bᵀ`.
pub(crate) fn mat_mul_t<const N: usize>(a: &Mat<N>, b: &Mat<N>) -> Mat<N> {
    let mut o = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            o[i][j] = dot(&a[i], &b[j]);
        }
    }
    o
}

/// Time update `x ← F x`, `P ← F P Fᵀ + Q`.
pub(crate) fn propagate<const N: usize>(x: &mut [f64; N], p: &mut Mat<N>, f: &Mat<N>, q: &Mat<N>) {
    *x = mat_vec(f, x);
    let fp = mat_mul(f, p);
    let mut np = mat_mul_t(&fp, f);
    for i in 0..N {
        for j in 0..N {
            np[i][j] += q[i][j];
        }
    }
    *p = np;
}

/// Scalar measurement update in Joseph stabilised form for observation row `h`,
/// measurement `z` and noise variance `r`. Returns the innovation, or `None` (and
/// leaves the state untouched) when the innovation variance is not positive.
pub(crate) fn joseph_update<const N: usize>(
    x: &mut [f64; N],
    p: &mut Mat<N>,
    h: &[f64; N],
    z: f64,
    r: f64,
) -> Option<Innovation> {
    let ph = mat_vec(p, h);
    let s = dot(h, &ph) + r;
    if s.is_nan() || s <= 0.0 || s.is_infinite() {
        return None;
    }
    let mut k = [0.0; N];
    for (ki, phi) in k.iter_mut().zip(ph.iter()) {
        *ki = phi / s;
    }
    let innov = z - dot(h, x);
    for (xi, ki) in x.iter_mut().zip(k.iter()) {
        *xi += ki * innov;
    }
    // P⁺ = (I − K H) P (I − K H)ᵀ + r K Kᵀ.
    let mut a = [[0.0; N]; N];
    for i in 0..N {
        for j in 0..N {
            a[i][j] = if i == j { 1.0 } else { 0.0 } - k[i] * h[j];
        }
    }
    let ap = mat_mul(&a, p);
    let mut np = mat_mul_t(&ap, &a);
    for i in 0..N {
        for j in 0..N {
            np[i][j] += r * k[i] * k[j];
        }
    }
    *p = np;
    Some(Innovation {
        innovation: innov,
        variance: s,
    })
}

/// Gauss–Jordan inverse with partial pivoting; `None` if (numerically) singular.
pub(crate) fn invert<const N: usize>(m: &Mat<N>) -> Option<Mat<N>> {
    // Scale-aware singularity threshold: the states mix metres and seconds, so the
    // pivots legitimately span many decades; only an exact/denormal zero is singular.
    let mut a = *m;
    let mut inv = [[0.0; N]; N];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..N {
        let mut piv = col;
        for r in (col + 1)..N {
            if a[r][col].abs() > a[piv][col].abs() {
                piv = r;
            }
        }
        if a[piv][col].is_nan() || a[piv][col].abs() <= 1e-300 {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let d = a[col][col];
        for c in 0..N {
            a[col][c] /= d;
            inv[col][c] /= d;
        }
        for r in 0..N {
            if r == col {
                continue;
            }
            let f = a[r][col];
            if f == 0.0 {
                continue;
            }
            for c in 0..N {
                a[r][c] -= f * a[col][c];
                inv[r][c] -= f * inv[col][c];
            }
        }
    }
    Some(inv)
}

/// Normalised estimation-error squared `eᵀ P⁻¹ e` for error `e` and covariance `p`.
///
/// Mixed-unit states (metres beside seconds) make `P` badly scaled, so the quadratic
/// form is evaluated on the diagonally-normalised covariance
/// `D^{-1/2} P D^{-1/2}` (a correlation matrix) and the matching scaled error — the
/// same number in exact arithmetic, far better conditioned in floating point.
pub(crate) fn nees<const N: usize>(e: &[f64; N], p: &Mat<N>) -> Option<f64> {
    let mut d = [0.0; N];
    for i in 0..N {
        if p[i][i].is_nan() || p[i][i] <= 0.0 {
            return None;
        }
        d[i] = p[i][i].sqrt();
    }
    let mut c = [[0.0; N]; N];
    let mut es = [0.0; N];
    for i in 0..N {
        es[i] = e[i] / d[i];
        for j in 0..N {
            c[i][j] = p[i][j] / (d[i] * d[j]);
        }
    }
    let ci = invert(&c)?;
    Some(dot(&es, &mat_vec(&ci, &es)))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn inverse_round_trips() {
        let m = [[4.0, 1.0, 0.5], [1.0, 3.0, 0.2], [0.5, 0.2, 2.0]];
        let i = invert(&m).unwrap();
        let e = mat_mul(&m, &i);
        for (r, row) in e.iter().enumerate() {
            for (c, v) in row.iter().enumerate() {
                let want = if r == c { 1.0 } else { 0.0 };
                assert!((v - want).abs() < 1e-14, "{r},{c}: {v}");
            }
        }
        assert!(invert(&[[1.0, 2.0], [2.0, 4.0]]).is_none());
    }

    #[test]
    fn nees_of_a_diagonal_covariance_is_the_weighted_sum() {
        let p = [[4.0, 0.0], [0.0, 1e-18]];
        let e = [2.0, 1e-9];
        let v = nees(&e, &p).unwrap();
        assert!((v - 2.0).abs() < 1e-12, "{v}");
    }
}
