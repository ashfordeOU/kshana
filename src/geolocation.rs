// SPDX-License-Identifier: AGPL-3.0-only
//! Passive emitter geolocation by **TDOA** (time-difference-of-arrival) and **FDOA**
//! (frequency-difference-of-arrival) across a network of receivers — the core of
//! locating a jammer/spoofer, or reverse-PNT off an opportunistic emitter, when GNSS
//! itself is the thing under attack.
//!
//! Geometry (ECEF/local Cartesian, metres):
//! - An emitter at `p` is observed by `N ≥ 4` receivers at `rᵢ`. Receiver 0 is the
//!   reference. The **TDOA** of receiver `i` is `τᵢ = (Rᵢ − R₀)/c`, where
//!   `Rᵢ = ‖p − rᵢ‖` and `c` is the speed of light. Each TDOA constrains `p` to one
//!   sheet of a hyperboloid; the intersection of `N − 1` hyperboloids fixes `p`.
//! - With **moving** receivers (velocity `ṙᵢ`) and a moving emitter (velocity `v`), the
//!   range-rate is `Ṙᵢ = ûᵢ · (v − ṙᵢ)` with `ûᵢ` the unit line-of-sight from `rᵢ` to
//!   `p`. The **FDOA** (here the range-rate difference, m/s) is `Ṙᵢ − Ṙ₀`; combining
//!   TDOA + FDOA recovers position *and* velocity.
//!
//! Estimators: a Gauss–Newton least-squares solve (reusing [`crate::batch_ls`]) over
//! the nonlinear range(-rate)-difference model, plus the **Cramér–Rao lower bound**
//! (CRLB) on the position covariance from the measurement geometry. This is a MODELLED
//! capability — its reference tests are self-consistency checks (forward→inverse round
//! trips, `J·CRLB = I`, geometry-driven GDOP behaviour), not an external dataset.

/// A 3-vector `[x, y, z]` (m, or m/s for velocities).
pub type Vec3 = [f64; 3];

/// Speed of light in vacuum (m/s).
pub const C: f64 = 299_792_458.0;

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Unit line-of-sight from receiver `r` toward emitter `p` (`(p − r)/‖p − r‖`).
fn los(p: Vec3, r: Vec3) -> Vec3 {
    let d = sub(p, r);
    let n = norm(d);
    [d[0] / n, d[1] / n, d[2] / n]
}

/// Predicted TDOA (s) of each non-reference receiver relative to `receivers[0]`, for an
/// emitter at `p`. Returns `receivers.len() − 1` values.
pub fn tdoa_predict(p: Vec3, receivers: &[Vec3]) -> Vec<f64> {
    let r0 = norm(sub(p, receivers[0]));
    receivers[1..]
        .iter()
        .map(|&ri| (norm(sub(p, ri)) - r0) / C)
        .collect()
}

/// Predicted FDOA (here the range-rate difference, m/s) of each non-reference receiver
/// relative to `receivers[0]`, for an emitter at `p` with velocity `v` observed by
/// receivers with velocities `recv_vel`.
pub fn fdoa_predict(p: Vec3, v: Vec3, receivers: &[Vec3], recv_vel: &[Vec3]) -> Vec<f64> {
    let rr = |i: usize| dot(los(p, receivers[i]), sub(v, recv_vel[i]));
    let rr0 = rr(0);
    (1..receivers.len()).map(|i| rr(i) - rr0).collect()
}

/// Recover the emitter position from TDOA measurements by Gauss–Newton least squares.
///
/// `tdoa` are the `N − 1` time differences (s) relative to `receivers[0]`, `sigma_s`
/// the 1σ TDOA noise (s, for weighting), and `x0` an initial guess. Returns `None` on a
/// rank-deficient geometry or non-convergence.
pub fn solve_tdoa(receivers: &[Vec3], tdoa: &[f64], sigma_s: f64, x0: Vec3) -> Option<Vec3> {
    if receivers.len() < 4 || tdoa.len() != receivers.len() - 1 {
        return None;
    }
    let recv = receivers.to_vec();
    let model = move |x: &[f64]| tdoa_predict([x[0], x[1], x[2]], &recv);
    let w = vec![1.0 / (sigma_s * sigma_s); tdoa.len()];
    let res = crate::batch_ls::gauss_newton(model, tdoa, &w, &x0, 100, 1e-9)?;
    Some([res.x[0], res.x[1], res.x[2]])
}

/// Recover emitter **position and velocity** from combined TDOA + FDOA measurements.
///
/// State is `[x, y, z, vx, vy, vz]`. Needs at least 6 measurements total (so
/// `2(N − 1) ≥ 6`, i.e. `N ≥ 4`). Returns `None` on bad geometry / non-convergence.
#[allow(clippy::too_many_arguments)]
pub fn solve_tdoa_fdoa(
    receivers: &[Vec3],
    recv_vel: &[Vec3],
    tdoa: &[f64],
    fdoa: &[f64],
    sigma_s: f64,
    sigma_rr: f64,
    x0: [f64; 6],
) -> Option<[f64; 6]> {
    let k = receivers.len();
    if k < 4 || recv_vel.len() != k || tdoa.len() != k - 1 || fdoa.len() != k - 1 {
        return None;
    }
    let recv = receivers.to_vec();
    let rvel = recv_vel.to_vec();
    let model = move |x: &[f64]| {
        let p = [x[0], x[1], x[2]];
        let v = [x[3], x[4], x[5]];
        let mut out = tdoa_predict(p, &recv);
        out.extend(fdoa_predict(p, v, &recv, &rvel));
        out
    };
    let mut z = tdoa.to_vec();
    z.extend_from_slice(fdoa);
    let mut w = vec![1.0 / (sigma_s * sigma_s); tdoa.len()];
    w.extend(vec![1.0 / (sigma_rr * sigma_rr); fdoa.len()]);
    // Staged initialisation: position and velocity differ by orders of magnitude and
    // velocity is only observable once the line-of-sight unit vectors (hence position)
    // are roughly right, so bootstrap the position from TDOA alone before the joint
    // refine. Fall back to the caller's guess if the TDOA bootstrap is rank-deficient.
    let p0 = solve_tdoa(receivers, tdoa, sigma_s, [x0[0], x0[1], x0[2]])
        .unwrap_or([x0[0], x0[1], x0[2]]);
    let seed = [p0[0], p0[1], p0[2], x0[3], x0[4], x0[5]];
    let res = crate::batch_ls::gauss_newton(model, &z, &w, &seed, 200, 1e-9)?;
    let x = res.x;
    Some([x[0], x[1], x[2], x[3], x[4], x[5]])
}

/// Inverse of a 3×3 matrix, or `None` if (near-)singular.
fn inverse3(m: &[[f64; 3]; 3]) -> Option<[[f64; 3]; 3]> {
    let det = m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0]);
    if det.abs() < 1e-18 {
        return None;
    }
    let inv_det = 1.0 / det;
    let c = |a: usize, b: usize, d: usize, e: usize| m[a][b] * m[d][e];
    let mut out = [[0.0f64; 3]; 3];
    out[0][0] = (c(1, 1, 2, 2) - c(1, 2, 2, 1)) * inv_det;
    out[0][1] = (c(0, 2, 2, 1) - c(0, 1, 2, 2)) * inv_det;
    out[0][2] = (c(0, 1, 1, 2) - c(0, 2, 1, 1)) * inv_det;
    out[1][0] = (c(1, 2, 2, 0) - c(1, 0, 2, 2)) * inv_det;
    out[1][1] = (c(0, 0, 2, 2) - c(0, 2, 2, 0)) * inv_det;
    out[1][2] = (c(0, 2, 1, 0) - c(0, 0, 1, 2)) * inv_det;
    out[2][0] = (c(1, 0, 2, 1) - c(1, 1, 2, 0)) * inv_det;
    out[2][1] = (c(0, 1, 2, 0) - c(0, 0, 2, 1)) * inv_det;
    out[2][2] = (c(0, 0, 1, 1) - c(0, 1, 1, 0)) * inv_det;
    Some(out)
}

/// The Fisher information matrix (3×3) of the TDOA geometry at `emitter`, for 1σ TDOA
/// noise `sigma_s` (s). Uses range-difference sensitivities `gᵢ = ûᵢ − û₀`.
pub fn tdoa_fisher(receivers: &[Vec3], emitter: Vec3, sigma_s: f64) -> [[f64; 3]; 3] {
    let sigma_rho = C * sigma_s; // range-difference noise (m)
    let inv_var = 1.0 / (sigma_rho * sigma_rho);
    let u0 = los(emitter, receivers[0]);
    let mut j = [[0.0f64; 3]; 3];
    for &ri in &receivers[1..] {
        let ui = los(emitter, ri);
        let g = [ui[0] - u0[0], ui[1] - u0[1], ui[2] - u0[2]];
        for a in 0..3 {
            for b in 0..3 {
                j[a][b] += g[a] * g[b] * inv_var;
            }
        }
    }
    j
}

/// The Cramér–Rao lower bound on the **position** covariance (3×3, m²) for the TDOA
/// geometry — the inverse of [`tdoa_fisher`]. `None` for a rank-deficient geometry
/// (e.g. fewer than four receivers, or all receivers collinear with the emitter).
pub fn tdoa_crlb(receivers: &[Vec3], emitter: Vec3, sigma_s: f64) -> Option<[[f64; 3]; 3]> {
    inverse3(&tdoa_fisher(receivers, emitter, sigma_s))
}

/// A dense square matrix, row-major (`m[i][j]`).
pub type Mat = Vec<Vec<f64>>;

/// Inverse of a symmetric positive-definite or general square matrix by Gauss–Jordan
/// elimination with partial pivoting, or `None` when a pivot falls below `1e-300` times
/// the largest entry (numerically singular).
pub fn mat_inverse(m: &[Vec<f64>]) -> Option<Mat> {
    let n = m.len();
    if n == 0 || m.iter().any(|r| r.len() != n) {
        return None;
    }
    let scale = m
        .iter()
        .flat_map(|r| r.iter())
        .fold(0.0f64, |a, &v| a.max(v.abs()));
    if scale == 0.0 || !scale.is_finite() {
        return None;
    }
    let mut a: Mat = m.to_vec();
    let mut inv: Mat = (0..n)
        .map(|i| (0..n).map(|j| if i == j { 1.0 } else { 0.0 }).collect())
        .collect();
    for col in 0..n {
        let piv = (col..n).max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))?;
        if a[piv][col].abs() <= 1e-300 * scale || a[piv][col].abs() < 1e-14 * scale {
            return None;
        }
        a.swap(col, piv);
        inv.swap(col, piv);
        let d = a[col][col];
        for j in 0..n {
            a[col][j] /= d;
            inv[col][j] /= d;
        }
        for r in 0..n {
            if r != col {
                let f = a[r][col];
                if f != 0.0 {
                    for j in 0..n {
                        a[r][j] -= f * a[col][j];
                        inv[r][j] -= f * inv[col][j];
                    }
                }
            }
        }
    }
    Some(inv)
}

/// Lower Cholesky factor `L` with `L Lᵀ = m`, or `None` if `m` is not positive definite.
pub fn cholesky(m: &[Vec<f64>]) -> Option<Mat> {
    let n = m.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let mut s = m[i][j];
            for k in 0..j {
                s -= l[i][k] * l[j][k];
            }
            if i == j {
                if s <= 0.0 || !s.is_finite() {
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

/// Fisher information `Hᵀ Q⁻¹ H` of a linearised measurement with Jacobian rows `h`
/// (each of length `n`) and measurement covariance `q`.
fn fisher_from(h: &[Vec<f64>], q: &[Vec<f64>]) -> Option<Mat> {
    let qi = mat_inverse(q)?;
    let n = h.first()?.len();
    let m = h.len();
    let mut j = vec![vec![0.0; n]; n];
    for a in 0..n {
        for b in 0..n {
            let mut s = 0.0;
            for k in 0..m {
                for l in 0..m {
                    s += h[k][a] * qi[k][l] * h[l][b];
                }
            }
            j[a][b] = s;
        }
    }
    Some(j)
}

/// Jacobian of the reference-receiver **range differences** `Rᵢ − R₀` (m) with respect to
/// the emitter position: rows `ûᵢ − û₀`, `ûᵢ` the unit vector from receiver `i` to `p`.
pub fn tdoa_range_difference_jacobian(receivers: &[Vec3], emitter: Vec3) -> Vec<Vec3> {
    let u0 = los(emitter, receivers[0]);
    receivers[1..]
        .iter()
        .map(|&ri| {
            let ui = los(emitter, ri);
            [ui[0] - u0[0], ui[1] - u0[1], ui[2] - u0[2]]
        })
        .collect()
}

/// The Cramér–Rao lower bound on the emitter **position** covariance (3×3, m²) from TDOA
/// with a GENERAL range-difference covariance `q_rd` (`(N−1)×(N−1)`, m², ordered as the
/// reference-receiver differences `R₁ − R₀, …, R_{N−1} − R₀`). A common reference receiver
/// with independent, equal receiver noise gives the familiar `σ²(I + 1 1ᵀ)/2`-shaped
/// matrix with correlation one half between differences. `None` for a rank-deficient
/// geometry or a covariance that is not invertible.
pub fn tdoa_crlb_cov(
    receivers: &[Vec3],
    emitter: Vec3,
    q_rd: &[Vec<f64>],
) -> Option<[[f64; 3]; 3]> {
    if receivers.len() < 2 || q_rd.len() != receivers.len() - 1 {
        return None;
    }
    let h: Vec<Vec<f64>> = tdoa_range_difference_jacobian(receivers, emitter)
        .into_iter()
        .map(|g| g.to_vec())
        .collect();
    let j = fisher_from(&h, q_rd)?;
    let c = mat_inverse(&j)?;
    Some([
        [c[0][0], c[0][1], c[0][2]],
        [c[1][0], c[1][1], c[1][2]],
        [c[2][0], c[2][1], c[2][2]],
    ])
}

/// The Cramér–Rao lower bound on the emitter position covariance (3×3, m²) when the
/// emitter is KNOWN to lie on the sphere `‖p‖ = ‖emitter‖` about the origin (an emitter on
/// the Earth's surface, the geocentric case of geostationary TDOA geolocation). This is
/// the constrained bound `U (Uᵀ J U)⁻¹ Uᵀ` (Gorman and Hero 1990; Stoica and Ng 1998), `J`
/// the TDOA Fisher information for the range-difference covariance `q_rd` and `U` an
/// orthonormal basis of the tangent plane at the emitter. Three receivers (two TDOAs)
/// suffice. `None` for a degenerate geometry.
pub fn tdoa_crlb_on_sphere(
    receivers: &[Vec3],
    emitter: Vec3,
    q_rd: &[Vec<f64>],
) -> Option<[[f64; 3]; 3]> {
    if receivers.len() < 2 || q_rd.len() != receivers.len() - 1 {
        return None;
    }
    let r = norm(emitter);
    if r == 0.0 {
        return None;
    }
    let n = [emitter[0] / r, emitter[1] / r, emitter[2] / r];
    // Tangent basis: e1 ⟂ n from the axis least aligned with n, e2 = n × e1.
    let k = (0..3)
        .min_by(|&a, &b| n[a].abs().total_cmp(&n[b].abs()))
        .unwrap_or(0);
    let mut a = [0.0; 3];
    a[k] = 1.0;
    let d = dot(a, n);
    let e1u = [a[0] - d * n[0], a[1] - d * n[1], a[2] - d * n[2]];
    let l1 = norm(e1u);
    let e1 = [e1u[0] / l1, e1u[1] / l1, e1u[2] / l1];
    let e2 = [
        n[1] * e1[2] - n[2] * e1[1],
        n[2] * e1[0] - n[0] * e1[2],
        n[0] * e1[1] - n[1] * e1[0],
    ];
    // Reduced Jacobian H U (rows: range differences, columns: tangent coordinates).
    let h: Vec<Vec<f64>> = tdoa_range_difference_jacobian(receivers, emitter)
        .into_iter()
        .map(|g| vec![dot(g, e1), dot(g, e2)])
        .collect();
    let j = fisher_from(&h, q_rd)?;
    let c2 = mat_inverse(&j)?;
    let u = [e1, e2];
    let mut out = [[0.0; 3]; 3];
    for (a, row) in out.iter_mut().enumerate() {
        for (b, v) in row.iter_mut().enumerate() {
            let mut s = 0.0;
            for p in 0..2 {
                for q in 0..2 {
                    s += u[p][a] * c2[p][q] * u[q][b];
                }
            }
            *v = s;
        }
    }
    Some(out)
}

/// Jacobian rows (length 6, `[∂/∂p, ∂/∂v]`) of the reference-receiver **range-rate
/// differences** `Ṙᵢ − Ṙ₀` (m/s), with `Ṙᵢ = ûᵢ·(v − ṙᵢ)`: `∂Ṙᵢ/∂p = (v − ṙᵢ)ᵀ(I − ûᵢûᵢᵀ)/Rᵢ`
/// and `∂Ṙᵢ/∂v = ûᵢ`.
pub fn fdoa_range_rate_difference_jacobian(
    receivers: &[Vec3],
    recv_vel: &[Vec3],
    emitter: Vec3,
    vel: Vec3,
) -> Vec<[f64; 6]> {
    let row = |i: usize| -> [f64; 6] {
        let d = sub(emitter, receivers[i]);
        let r = norm(d);
        let u = [d[0] / r, d[1] / r, d[2] / r];
        let w = sub(vel, recv_vel[i]);
        let uw = dot(u, w);
        [
            (w[0] - uw * u[0]) / r,
            (w[1] - uw * u[1]) / r,
            (w[2] - uw * u[2]) / r,
            u[0],
            u[1],
            u[2],
        ]
    };
    let r0 = row(0);
    (1..receivers.len())
        .map(|i| {
            let ri = row(i);
            let mut o = [0.0; 6];
            for k in 0..6 {
                o[k] = ri[k] - r0[k];
            }
            o
        })
        .collect()
}

/// The Cramér–Rao lower bound (6×6) on the emitter **position and velocity**
/// `[x, y, z, vx, vy, vz]` from joint TDOA + FDOA, for range-difference covariance
/// `q_rd` (m²) and range-rate-difference covariance `q_rrd` (m²/s²), the two noise sets
/// uncorrelated with each other (Ho and Xu 2004, Eq. 28). `None` for a rank-deficient
/// geometry or a singular covariance.
pub fn tdoa_fdoa_crlb(
    receivers: &[Vec3],
    recv_vel: &[Vec3],
    emitter: Vec3,
    vel: Vec3,
    q_rd: &[Vec<f64>],
    q_rrd: &[Vec<f64>],
) -> Option<[[f64; 6]; 6]> {
    let k = receivers.len();
    if k < 2 || recv_vel.len() != k || q_rd.len() != k - 1 || q_rrd.len() != k - 1 {
        return None;
    }
    let mut h: Vec<Vec<f64>> = tdoa_range_difference_jacobian(receivers, emitter)
        .into_iter()
        .map(|g| vec![g[0], g[1], g[2], 0.0, 0.0, 0.0])
        .collect();
    h.extend(
        fdoa_range_rate_difference_jacobian(receivers, recv_vel, emitter, vel)
            .into_iter()
            .map(|r| r.to_vec()),
    );
    let m = 2 * (k - 1);
    let mut q = vec![vec![0.0; m]; m];
    for a in 0..k - 1 {
        for b in 0..k - 1 {
            q[a][b] = q_rd[a][b];
            q[k - 1 + a][k - 1 + b] = q_rrd[a][b];
        }
    }
    let j = fisher_from(&h, &q)?;
    let c = mat_inverse(&j)?;
    let mut out = [[0.0; 6]; 6];
    for (a, row) in out.iter_mut().enumerate() {
        for (b, v) in row.iter_mut().enumerate() {
            *v = c[a][b];
        }
    }
    Some(out)
}

/// Recover emitter position and velocity from joint TDOA + FDOA with a GENERAL noise
/// covariance: the maximum-likelihood Gauss–Newton fit for Gaussian noise, the residuals
/// weighted by the inverse of the block-diagonal covariance `diag(q_rd, q_rrd)`
/// (`tdoa` in seconds, `fdoa` as range-rate differences in m/s, `q_rd` in m², `q_rrd` in
/// m²/s²), so correlated differences sharing a reference receiver are weighted correctly.
/// `x0` seeds the iteration (analytic Jacobians), which stops when the Gauss–Newton step is
/// below 1e-8 of its own standard deviation (`dxᵀ Hᵀ Q⁻¹ H dx < 1e-16`). `None` on a singular
/// covariance, bad geometry or non-convergence within 100 iterations.
#[allow(clippy::too_many_arguments)]
pub fn solve_tdoa_fdoa_cov(
    receivers: &[Vec3],
    recv_vel: &[Vec3],
    tdoa: &[f64],
    fdoa: &[f64],
    q_rd: &[Vec<f64>],
    q_rrd: &[Vec<f64>],
    x0: [f64; 6],
) -> Option<[f64; 6]> {
    let k = receivers.len();
    if k < 4
        || recv_vel.len() != k
        || tdoa.len() != k - 1
        || fdoa.len() != k - 1
        || q_rd.len() != k - 1
        || q_rrd.len() != k - 1
    {
        return None;
    }
    let m = 2 * (k - 1);
    let mut q = vec![vec![0.0; m]; m];
    for a in 0..k - 1 {
        for b in 0..k - 1 {
            q[a][b] = q_rd[a][b];
            q[k - 1 + a][k - 1 + b] = q_rrd[a][b];
        }
    }
    let qi = mat_inverse(&q)?;
    let mut z: Vec<f64> = tdoa.iter().map(|t| t * C).collect();
    z.extend_from_slice(fdoa);
    let mut x = x0;
    for _ in 0..100 {
        let p = [x[0], x[1], x[2]];
        let v = [x[3], x[4], x[5]];
        // Residual and analytic Jacobian of [range differences; range-rate differences].
        let mut hx: Vec<f64> = tdoa_predict(p, receivers).iter().map(|t| t * C).collect();
        hx.extend(fdoa_predict(p, v, receivers, recv_vel));
        let r: Vec<f64> = (0..m).map(|i| z[i] - hx[i]).collect();
        let mut h: Vec<[f64; 6]> = tdoa_range_difference_jacobian(receivers, p)
            .into_iter()
            .map(|g| [g[0], g[1], g[2], 0.0, 0.0, 0.0])
            .collect();
        h.extend(fdoa_range_rate_difference_jacobian(
            receivers, recv_vel, p, v,
        ));
        // Normal equations (Hᵀ Q⁻¹ H) dx = Hᵀ Q⁻¹ r.
        let mut qr = vec![0.0; m];
        for i in 0..m {
            qr[i] = (0..m).map(|j| qi[i][j] * r[j]).sum();
        }
        let mut a = vec![vec![0.0; 6]; 6];
        let mut bvec = [0.0; 6];
        for c in 0..6 {
            bvec[c] = (0..m).map(|i| h[i][c] * qr[i]).sum();
            for d in 0..6 {
                let mut acc = 0.0;
                for i in 0..m {
                    let hi = h[i][c];
                    if hi == 0.0 {
                        continue;
                    }
                    for j in 0..m {
                        acc += hi * qi[i][j] * h[j][d];
                    }
                }
                a[c][d] = acc;
            }
        }
        let ai = mat_inverse(&a)?;
        let mut dx = [0.0; 6];
        for c in 0..6 {
            dx[c] = (0..6).map(|d| ai[c][d] * bvec[d]).sum();
        }
        for c in 0..6 {
            x[c] += dx[c];
        }
        // Converged when the step is negligible against its own uncertainty:
        // dxᵀ (Hᵀ Q⁻¹ H) dx below 1e-16 (a step of 1e-8 standard deviations).
        let mut size = 0.0;
        for c in 0..6 {
            for d in 0..6 {
                size += dx[c] * a[c][d] * dx[d];
            }
        }
        if !x.iter().all(|v| v.is_finite()) {
            return None;
        }
        if size < 1e-16 {
            return Some(x);
        }
    }
    None
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn tdoa_forward_then_inverse_recovers_a_known_emitter() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 0.0],
        ];
        let emitter = [3_200.0, 4_100.0, 1_500.0];
        let tdoa = tdoa_predict(emitter, &receivers);
        let got = solve_tdoa(&receivers, &tdoa, 1e-9, [0.0, 0.0, 0.0]).expect("solves");
        let err = norm(sub(got, emitter));
        assert!(err < 1e-6, "recovered {got:?} vs {emitter:?} (err {err} m)");
    }

    #[test]
    fn crlb_is_the_inverse_of_the_fisher_information() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [12_000.0, 0.0, 500.0],
            [0.0, 9_000.0, -300.0],
            [-8_000.0, 4_000.0, 200.0],
            [5_000.0, -7_000.0, 100.0],
        ];
        let emitter = [2_000.0, 1_500.0, 800.0];
        let j = tdoa_fisher(&receivers, emitter, 5e-9);
        let cov = tdoa_crlb(&receivers, emitter, 5e-9).expect("non-singular geometry");
        // J · CRLB = I (a 3×3 matrix product — the index loops are the clearest form)
        #[allow(clippy::needless_range_loop)]
        for a in 0..3 {
            for b in 0..3 {
                let mut v = 0.0;
                for k in 0..3 {
                    v += j[a][k] * cov[k][b];
                }
                let expected = if a == b { 1.0 } else { 0.0 };
                assert!((v - expected).abs() < 1e-6, "J·CRLB[{a}][{b}]={v}");
            }
        }
        // covariance must be symmetric
        assert!((cov[0][1] - cov[1][0]).abs() < 1e-9);
        assert!((cov[0][2] - cov[2][0]).abs() < 1e-9);
        assert!((cov[1][2] - cov[2][1]).abs() < 1e-9);
    }

    #[test]
    fn adding_a_receiver_does_not_worsen_the_position_bound() {
        // More independent geometry ⇒ the CRLB position variance (trace) cannot grow.
        let base = [
            [0.0, 0.0, 0.0],
            [12_000.0, 0.0, 500.0],
            [0.0, 9_000.0, -300.0],
            [-8_000.0, 4_000.0, 200.0],
        ];
        let emitter = [2_000.0, 1_500.0, 800.0];
        let trace = |c: [[f64; 3]; 3]| c[0][0] + c[1][1] + c[2][2];
        let t4 = trace(tdoa_crlb(&base, emitter, 5e-9).expect("4 rx"));
        let mut more = base.to_vec();
        more.push([5_000.0, -7_000.0, 100.0]);
        let t5 = trace(tdoa_crlb(&more, emitter, 5e-9).expect("5 rx"));
        assert!(
            t5 <= t4 + 1e-6,
            "adding a receiver worsened the bound: {t5} > {t4}"
        );
    }

    #[test]
    fn tdoa_fdoa_recovers_a_moving_emitter_position_and_velocity() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 5_000.0],
        ];
        let recv_vel = [
            [200.0, 0.0, 0.0],
            [0.0, 220.0, 0.0],
            [-180.0, 0.0, 0.0],
            [0.0, -210.0, 0.0],
            [150.0, 150.0, 0.0],
        ];
        let emitter = [3_200.0, 4_100.0, 1_500.0];
        let vel = [12.0, -7.0, 3.0];
        let tdoa = tdoa_predict(emitter, &receivers);
        let fdoa = fdoa_predict(emitter, vel, &receivers, &recv_vel);
        let x0 = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
        let got =
            solve_tdoa_fdoa(&receivers, &recv_vel, &tdoa, &fdoa, 1e-9, 1e-3, x0).expect("solves");
        let perr = norm(sub([got[0], got[1], got[2]], emitter));
        let verr = norm(sub([got[3], got[4], got[5]], vel));
        assert!(
            perr < 1e-4,
            "position {:?} vs {emitter:?} (err {perr} m)",
            &got[0..3]
        );
        assert!(
            verr < 1e-4,
            "velocity {:?} vs {vel:?} (err {verr} m/s)",
            &got[3..6]
        );
    }

    fn equal_noise_q(n: usize, s2: f64) -> Vec<Vec<f64>> {
        (0..n)
            .map(|i| (0..n).map(|j| if i == j { s2 } else { 0.5 * s2 }).collect())
            .collect()
    }

    #[test]
    fn matrix_inverse_and_cholesky_round_trip() {
        let m = equal_noise_q(4, 2.0);
        let inv = mat_inverse(&m).expect("invertible");
        for i in 0..4 {
            for j in 0..4 {
                let v: f64 = (0..4).map(|k| m[i][k] * inv[k][j]).sum();
                assert!((v - if i == j { 1.0 } else { 0.0 }).abs() < 1e-12);
            }
        }
        let l = cholesky(&m).expect("positive definite");
        for i in 0..4 {
            for j in 0..4 {
                let v: f64 = (0..4).map(|k| l[i][k] * l[j][k]).sum();
                assert!((v - m[i][j]).abs() < 1e-12);
            }
        }
        assert!(mat_inverse(&[vec![1.0, 2.0], vec![2.0, 4.0]]).is_none());
        assert!(cholesky(&[vec![1.0, 2.0], vec![2.0, 1.0]]).is_none());
    }

    #[test]
    fn general_covariance_bound_reduces_to_the_white_noise_bound() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [12_000.0, 0.0, 500.0],
            [0.0, 9_000.0, -300.0],
            [-8_000.0, 4_000.0, 200.0],
            [5_000.0, -7_000.0, 100.0],
        ];
        let emitter = [2_000.0, 1_500.0, 800.0];
        let sigma = 5e-9;
        let white = tdoa_crlb(&receivers, emitter, sigma).expect("bound");
        let s2 = (C * sigma).powi(2);
        let q: Vec<Vec<f64>> = (0..4)
            .map(|i| (0..4).map(|j| if i == j { s2 } else { 0.0 }).collect())
            .collect();
        let gen = tdoa_crlb_cov(&receivers, emitter, &q).expect("bound");
        for a in 0..3 {
            for b in 0..3 {
                assert!((white[a][b] - gen[a][b]).abs() < 1e-9 * white[a][a].abs().max(1.0));
            }
        }
    }

    #[test]
    fn surface_bound_is_tangent_and_no_larger_than_the_free_bound() {
        let re = 6_378_000.0;
        let ll = |lat: f64, lon: f64, r: f64| {
            let (la, lo) = (lat.to_radians(), lon.to_radians());
            [
                r * la.cos() * lo.cos(),
                r * la.cos() * lo.sin(),
                r * la.sin(),
            ]
        };
        let receivers = [
            ll(0.0, 10.0, 26_000_000.0),
            ll(30.0, 40.0, 26_000_000.0),
            ll(-20.0, 60.0, 26_000_000.0),
            ll(50.0, 0.0, 26_000_000.0),
        ];
        let emitter = ll(20.0, 30.0, re);
        let q = equal_noise_q(3, 9.0);
        let free = tdoa_crlb_cov(&receivers, emitter, &q).expect("free bound");
        let con = tdoa_crlb_on_sphere(&receivers, emitter, &q).expect("constrained");
        let tr = |c: [[f64; 3]; 3]| c[0][0] + c[1][1] + c[2][2];
        assert!(tr(con) <= tr(free) + 1e-9);
        // No variance along the radial direction.
        let n = [emitter[0] / re, emitter[1] / re, emitter[2] / re];
        let mut rad = 0.0;
        for a in 0..3 {
            for b in 0..3 {
                rad += n[a] * con[a][b] * n[b];
            }
        }
        assert!(rad.abs() < 1e-9 * tr(con));
        // Three receivers are enough on the surface.
        assert!(tdoa_crlb_on_sphere(&receivers[..3], emitter, &equal_noise_q(2, 9.0)).is_some());
    }

    #[test]
    fn joint_bound_beats_tdoa_alone_and_its_jacobian_matches_differences() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 5_000.0],
        ];
        let recv_vel = [
            [200.0, 0.0, 0.0],
            [0.0, 220.0, 0.0],
            [-180.0, 0.0, 0.0],
            [0.0, -210.0, 0.0],
            [150.0, 150.0, 0.0],
        ];
        let p = [3_200.0, 4_100.0, 1_500.0];
        let v = [12.0, -7.0, 3.0];
        let q_rd = equal_noise_q(4, 4.0);
        let q_rrd = equal_noise_q(4, 0.01);
        let joint = tdoa_fdoa_crlb(&receivers, &recv_vel, p, v, &q_rd, &q_rrd).expect("bound");
        let tdoa = tdoa_crlb_cov(&receivers, p, &q_rd).expect("bound");
        for a in 0..3 {
            assert!(joint[a][a] <= tdoa[a][a] + 1e-9);
        }
        // Huge FDOA noise: the position block tends to the TDOA-only bound.
        let q_big = equal_noise_q(4, 1e12);
        let j2 = tdoa_fdoa_crlb(&receivers, &recv_vel, p, v, &q_rd, &q_big).expect("bound");
        for a in 0..3 {
            assert!((j2[a][a] - tdoa[a][a]).abs() < 1e-4 * tdoa[a][a]);
        }
        // The analytic FDOA Jacobian matches a central difference of fdoa_predict.
        let jac = fdoa_range_rate_difference_jacobian(&receivers, &recv_vel, p, v);
        for k in 0..6 {
            let h = if k < 3 { 1e-3 } else { 1e-6 };
            let (mut pp, mut pm, mut vp, mut vm) = (p, p, v, v);
            if k < 3 {
                pp[k] += h;
                pm[k] -= h;
            } else {
                vp[k - 3] += h;
                vm[k - 3] -= h;
            }
            let fp = fdoa_predict(pp, vp, &receivers, &recv_vel);
            let fm = fdoa_predict(pm, vm, &receivers, &recv_vel);
            for (i, row) in jac.iter().enumerate() {
                let num = (fp[i] - fm[i]) / (2.0 * h);
                assert!(
                    (num - row[k]).abs() < 1e-7,
                    "row {i} col {k}: {num} vs {}",
                    row[k]
                );
            }
        }
    }

    #[test]
    fn covariance_weighted_solver_recovers_a_noiseless_moving_emitter() {
        let receivers = [
            [0.0, 0.0, 0.0],
            [10_000.0, 0.0, 0.0],
            [0.0, 10_000.0, 0.0],
            [0.0, 0.0, 10_000.0],
            [10_000.0, 10_000.0, 5_000.0],
        ];
        let recv_vel = [
            [200.0, 0.0, 0.0],
            [0.0, 220.0, 0.0],
            [-180.0, 0.0, 0.0],
            [0.0, -210.0, 0.0],
            [150.0, 150.0, 0.0],
        ];
        let p = [3_200.0, 4_100.0, 1_500.0];
        let v = [12.0, -7.0, 3.0];
        let tdoa = tdoa_predict(p, &receivers);
        let fdoa = fdoa_predict(p, v, &receivers, &recv_vel);
        let x0 = [3_000.0, 4_000.0, 1_400.0, 10.0, -5.0, 0.0];
        let got = solve_tdoa_fdoa_cov(
            &receivers,
            &recv_vel,
            &tdoa,
            &fdoa,
            &equal_noise_q(4, 1.0),
            &equal_noise_q(4, 0.1),
            x0,
        )
        .expect("solves");
        assert!(norm(sub([got[0], got[1], got[2]], p)) < 1e-5);
        assert!(norm(sub([got[3], got[4], got[5]], v)) < 1e-6);
    }

    #[test]
    fn too_few_receivers_is_rejected() {
        let receivers = [[0.0, 0.0, 0.0], [10_000.0, 0.0, 0.0], [0.0, 10_000.0, 0.0]];
        let tdoa = tdoa_predict([1.0, 2.0, 3.0], &receivers);
        assert!(solve_tdoa(&receivers, &tdoa, 1e-9, [0.0, 0.0, 0.0]).is_none());
    }
}
