// SPDX-License-Identifier: AGPL-3.0-only
//! Wahba's problem: optimal three-axis attitude from weighted vector observations.
//!
//! Given a set of unit directions known in a reference (inertial) frame `rᵢ` and
//! their measured counterparts in the spacecraft body frame `bᵢ`, with
//! non-negative weights `aᵢ`, Wahba's problem (Wahba 1965) is to find the proper
//! rotation `A` (reference→body, so `A rᵢ ≈ bᵢ`) that minimises the weighted loss
//!
//! ```text
//!   L(A) = ½ Σ aᵢ ‖ bᵢ − A rᵢ ‖² .
//! ```
//!
//! This module provides three classic solvers, in increasing generality:
//!
//! * [`triad`] — the deterministic **TRIAD** algorithm (Black 1964): an exact
//!   attitude from exactly **two** non-parallel observations, trusting the first
//!   as primary. No optimisation, no weights — closed form.
//!
//! * [`solve_davenport`] — **Davenport's q-method**: the *exact optimal* solution
//!   to Wahba's problem for any number of observations. The optimal quaternion is
//!   the eigenvector of the 4×4 symmetric Davenport matrix `K` belonging to its
//!   **largest** eigenvalue; that eigenvalue is the attitude gain `λ_max`, which
//!   equals `Σ aᵢ` for a perfect (noiseless, consistent) fit. The eigenproblem is
//!   solved with a self-contained symmetric **Jacobi** eigensolver.
//!
//! * [`solve_quest`] — **QUEST** (Shuster & Oh 1981): the fast classic estimator
//!   that finds `λ_max` by a derivative-free root solve of Davenport's
//!   characteristic equation (seeded at `Σ aᵢ`, where it is an excellent guess),
//!   then recovers the quaternion from the Gibbs (Rodrigues) vector via a single
//!   3×3 solve. It avoids a full eigendecomposition but is **singular for a
//!   180° rotation** (the Gibbs vector diverges); [`solve_quest`] returns `None`
//!   there and the caller should fall back to [`solve_davenport`].
//!
//! Conventions. The output attitude matrix `A` (field [`AttitudeSolution::dcm`])
//! maps **reference→body** (`A rᵢ ≈ bᵢ`). The companion [`AttitudeSolution::quat`]
//! is the library [`crate::inertial::attitude::Quaternion`], whose own convention
//! is **body→nav** (`to_dcm()` returns `C_n^b`); the same physical attitude is
//! therefore `quat = Quaternion::from_dcm(Aᵀ)`, and `transpose(quat.to_dcm()) == A`.
//!
//! Scope (honest): this is the **point-direction** attitude problem — unit-vector
//! observations, no sensor field-of-view, bias, or temporal correlation modelling,
//! and the measurement weights `aᵢ` are the user's responsibility (typically
//! `aᵢ = 1/σᵢ²` normalised to sum to one). It is a MODELLED capability whose
//! reference tests check closed-form recovery, q-method/QUEST agreement, the
//! optimality of the q-method loss, and the statistical advantage of the optimal
//! estimator over TRIAD — internal-consistency oracles, not an external dataset.
//!
//! References:
//! - G. Wahba, "A Least Squares Estimate of Satellite Attitude," *SIAM Review* 7(3), 1965.
//! - M. D. Shuster & S. D. Oh, "Three-Axis Attitude Determination from Vector
//!   Observations," *J. Guidance & Control* 4(1), 1981 (QUEST).
//! - F. L. Markley & J. L. Crassidis, *Fundamentals of Spacecraft Attitude
//!   Determination and Control*, Springer 2014, §5 (Wahba, q-method, TRIAD, QUEST).

use crate::frames::Vec3;
use crate::inertial::attitude::Quaternion;

/// A 3×3 row-major matrix.
pub type Mat3 = [[f64; 3]; 3];

/// A single weighted vector observation: a measured body-frame direction `body`
/// of a known reference(inertial)-frame direction `reference`, with a
/// non-negative `weight`. Both vectors are normalised internally, so they need
/// not be supplied as unit vectors.
#[derive(Clone, Copy, Debug)]
pub struct VectorObs {
    /// Measured direction in the body frame.
    pub body: Vec3,
    /// Known direction in the reference (inertial) frame.
    pub reference: Vec3,
    /// Non-negative weight (e.g. `1/σ²`).
    pub weight: f64,
}

/// The result of an attitude solve.
#[derive(Clone, Copy, Debug)]
pub struct AttitudeSolution {
    /// Reference→body attitude matrix `A` (so `A rᵢ ≈ bᵢ`).
    pub dcm: Mat3,
    /// The same attitude as the library body→nav quaternion (`from_dcm(Aᵀ)`).
    pub quat: Quaternion,
    /// Largest eigenvalue of Davenport's `K` — the attitude gain `λ_max`
    /// (equals `Σ aᵢ` for a perfect fit).
    pub max_eigenvalue: f64,
    /// The Wahba loss `Σ aᵢ ‖bᵢ − A rᵢ‖²` at the solution (using normalised
    /// observation vectors). Zero for a perfect fit.
    pub loss: f64,
}

// ----------------------------------------------------------------------------
// small vector / matrix helpers
// ----------------------------------------------------------------------------

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Normalise a vector, returning `None` if it is (near) zero.
fn normalize(a: Vec3) -> Option<Vec3> {
    let n = norm(a);
    if n < 1e-300 {
        return None;
    }
    Some([a[0] / n, a[1] / n, a[2] / n])
}

/// `m · v`.
pub fn mat_vec3(m: &Mat3, v: Vec3) -> Vec3 {
    [
        m[0][0] * v[0] + m[0][1] * v[1] + m[0][2] * v[2],
        m[1][0] * v[0] + m[1][1] * v[1] + m[1][2] * v[2],
        m[2][0] * v[0] + m[2][1] * v[1] + m[2][2] * v[2],
    ]
}

/// `aᵀ` (transpose).
pub fn transpose3(a: &Mat3) -> Mat3 {
    let mut t = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            t[i][j] = a[j][i];
        }
    }
    t
}

/// `a · b` (3×3 matrix product).
pub fn matmul3(a: &Mat3, b: &Mat3) -> Mat3 {
    let mut c = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            let mut s = 0.0;
            for (k, brow) in b.iter().enumerate() {
                s += a[i][k] * brow[j];
            }
            c[i][j] = s;
        }
    }
    c
}

fn det3(m: &Mat3) -> f64 {
    m[0][0] * (m[1][1] * m[2][2] - m[1][2] * m[2][1])
        - m[0][1] * (m[1][0] * m[2][2] - m[1][2] * m[2][0])
        + m[0][2] * (m[1][0] * m[2][1] - m[1][1] * m[2][0])
}

/// Inverse of a 3×3 matrix via the adjugate, or `None` if (near) singular.
fn inv3(m: &Mat3) -> Option<Mat3> {
    let d = det3(m);
    if d.abs() < 1e-18 {
        return None;
    }
    let inv_d = 1.0 / d;
    let mut out = [[0.0; 3]; 3];
    out[0][0] = (m[1][1] * m[2][2] - m[1][2] * m[2][1]) * inv_d;
    out[0][1] = (m[0][2] * m[2][1] - m[0][1] * m[2][2]) * inv_d;
    out[0][2] = (m[0][1] * m[1][2] - m[0][2] * m[1][1]) * inv_d;
    out[1][0] = (m[1][2] * m[2][0] - m[1][0] * m[2][2]) * inv_d;
    out[1][1] = (m[0][0] * m[2][2] - m[0][2] * m[2][0]) * inv_d;
    out[1][2] = (m[0][2] * m[1][0] - m[0][0] * m[1][2]) * inv_d;
    out[2][0] = (m[1][0] * m[2][1] - m[1][1] * m[2][0]) * inv_d;
    out[2][1] = (m[0][1] * m[2][0] - m[0][0] * m[2][1]) * inv_d;
    out[2][2] = (m[0][0] * m[1][1] - m[0][1] * m[1][0]) * inv_d;
    Some(out)
}

// ----------------------------------------------------------------------------
// TRIAD
// ----------------------------------------------------------------------------

/// The deterministic **TRIAD** attitude from two non-parallel observations,
/// trusting `(b1, r1)` as the primary (exact) direction. Returns the
/// reference→body attitude matrix `A` such that `A r1 = b1` exactly and
/// `A r2 ≈ b2`, or `None` if either pair is degenerate (zero or parallel).
pub fn triad(b1: Vec3, r1: Vec3, b2: Vec3, r2: Vec3) -> Option<Mat3> {
    // Body triad.
    let t1b = normalize(b1)?;
    let t2b = normalize(cross(b1, b2))?;
    let t3b = cross(t1b, t2b);
    // Reference triad.
    let t1r = normalize(r1)?;
    let t2r = normalize(cross(r1, r2))?;
    let t3r = cross(t1r, t2r);

    // A = [t1b t2b t3b] · [t1r t2r t3r]ᵀ  (columns are the triad vectors).
    let mb: Mat3 = [
        [t1b[0], t2b[0], t3b[0]],
        [t1b[1], t2b[1], t3b[1]],
        [t1b[2], t2b[2], t3b[2]],
    ];
    let mr: Mat3 = [
        [t1r[0], t2r[0], t3r[0]],
        [t1r[1], t2r[1], t3r[1]],
        [t1r[2], t2r[2], t3r[2]],
    ];
    Some(matmul3(&mb, &transpose3(&mr)))
}

// ----------------------------------------------------------------------------
// Davenport's q-method
// ----------------------------------------------------------------------------

/// Davenport's attitude profile matrix `B = Σ aᵢ bᵢ rᵢᵀ` (observations
/// normalised to unit length first).
pub fn b_matrix(obs: &[VectorObs]) -> Mat3 {
    let mut b = [[0.0; 3]; 3];
    for o in obs {
        let (bv, rv) = match (normalize(o.body), normalize(o.reference)) {
            (Some(bv), Some(rv)) => (bv, rv),
            _ => continue,
        };
        let w = o.weight;
        for i in 0..3 {
            for j in 0..3 {
                b[i][j] += w * bv[i] * rv[j];
            }
        }
    }
    b
}

/// Davenport's 4×4 symmetric matrix `K` from the profile matrix `B`,
/// scalar-first: `K = [[σ, Zᵀ], [Z, S − σI]]` with `S = B + Bᵀ`, `σ = tr B`,
/// `Z = [B₁₂−B₂₁ swapped...]` the axial vector of `B − Bᵀ`.
pub fn davenport_k(b: &Mat3) -> [[f64; 4]; 4] {
    let sigma = b[0][0] + b[1][1] + b[2][2];
    let s = [
        [2.0 * b[0][0], b[0][1] + b[1][0], b[0][2] + b[2][0]],
        [b[1][0] + b[0][1], 2.0 * b[1][1], b[1][2] + b[2][1]],
        [b[2][0] + b[0][2], b[2][1] + b[1][2], 2.0 * b[2][2]],
    ];
    // Z = Σ aᵢ (bᵢ × rᵢ) = axial vector of (B − Bᵀ): [B₂₃−B₃₂, B₃₁−B₁₃, B₁₂−B₂₁].
    let z = [b[1][2] - b[2][1], b[2][0] - b[0][2], b[0][1] - b[1][0]];

    let mut k = [[0.0; 4]; 4];
    k[0][0] = sigma;
    for i in 0..3 {
        k[0][i + 1] = z[i];
        k[i + 1][0] = z[i];
        for j in 0..3 {
            k[i + 1][j + 1] = s[i][j] - if i == j { sigma } else { 0.0 };
        }
    }
    k
}

/// The reference→body attitude matrix `A(q)` for a scalar-first quaternion
/// `q = [q0, q1, q2, q3]` (need not be unit; normalised internally):
/// `A = (q0² − |v|²) I + 2 v vᵀ − 2 q0 [v×]`, `v = (q1, q2, q3)`.
pub fn attitude_matrix_from_quat(q: [f64; 4]) -> Mat3 {
    let n = (q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]).sqrt();
    let (q0, q1, q2, q3) = (q[0] / n, q[1] / n, q[2] / n, q[3] / n);
    let s = q0 * q0 - (q1 * q1 + q2 * q2 + q3 * q3);
    [
        [
            s + 2.0 * q1 * q1,
            2.0 * (q1 * q2 + q0 * q3),
            2.0 * (q1 * q3 - q0 * q2),
        ],
        [
            2.0 * (q1 * q2 - q0 * q3),
            s + 2.0 * q2 * q2,
            2.0 * (q2 * q3 + q0 * q1),
        ],
        [
            2.0 * (q1 * q3 + q0 * q2),
            2.0 * (q2 * q3 - q0 * q1),
            s + 2.0 * q3 * q3,
        ],
    ]
}

/// The Wahba loss `Σ aᵢ ‖bᵢ − A rᵢ‖²` for a reference→body matrix `A` and the
/// (normalised) observations.
pub fn wahba_loss(a: &Mat3, obs: &[VectorObs]) -> f64 {
    let mut l = 0.0;
    for o in obs {
        let (bv, rv) = match (normalize(o.body), normalize(o.reference)) {
            (Some(bv), Some(rv)) => (bv, rv),
            _ => continue,
        };
        let ar = mat_vec3(a, rv);
        let d = [bv[0] - ar[0], bv[1] - ar[1], bv[2] - ar[2]];
        l += o.weight * dot(d, d);
    }
    l
}

/// Solve Wahba's problem optimally by Davenport's q-method. Returns `None` if
/// fewer than two usable observations are supplied or the geometry is degenerate
/// (all observations parallel).
pub fn solve_davenport(obs: &[VectorObs]) -> Option<AttitudeSolution> {
    let usable = obs
        .iter()
        .filter(|o| normalize(o.body).is_some() && normalize(o.reference).is_some() && o.weight > 0.0)
        .count();
    if usable < 2 {
        return None;
    }
    let b = b_matrix(obs);
    let k = davenport_k(&b);
    let (evals, evecs) = jacobi_eigen4(k);
    // index of the largest eigenvalue
    let mut imax = 0;
    for i in 1..4 {
        if evals[i] > evals[imax] {
            imax = i;
        }
    }
    let q = [
        evecs[0][imax],
        evecs[1][imax],
        evecs[2][imax],
        evecs[3][imax],
    ];
    finalize(q, evals[imax], obs)
}

// ----------------------------------------------------------------------------
// QUEST
// ----------------------------------------------------------------------------

/// 4×4 determinant of `K − λI` (used as QUEST's characteristic function).
fn char_det(k: &[[f64; 4]; 4], lambda: f64) -> f64 {
    let mut m = *k;
    for (i, row) in m.iter_mut().enumerate() {
        row[i] -= lambda;
    }
    det4(&m)
}

#[allow(clippy::needless_range_loop)]
fn det4(m: &[[f64; 4]; 4]) -> f64 {
    // Laplace expansion along the first row via 3×3 minors.
    let mut det = 0.0;
    for col in 0..4 {
        let mut sub = [[0.0; 3]; 3];
        for i in 1..4 {
            let mut cc = 0;
            for j in 0..4 {
                if j == col {
                    continue;
                }
                sub[i - 1][cc] = m[i][j];
                cc += 1;
            }
        }
        let sign = if col % 2 == 0 { 1.0 } else { -1.0 };
        det += sign * m[0][col] * det3(&sub);
    }
    det
}

/// Solve Wahba's problem with QUEST: find `λ_max` by a secant root solve of the
/// characteristic equation seeded at `Σ aᵢ`, then recover the quaternion from the
/// Gibbs vector. Returns `None` for fewer than two usable observations or when the
/// Gibbs vector is singular (rotation near 180°) — fall back to
/// [`solve_davenport`] in that case.
pub fn solve_quest(obs: &[VectorObs]) -> Option<AttitudeSolution> {
    let usable: Vec<&VectorObs> = obs
        .iter()
        .filter(|o| normalize(o.body).is_some() && normalize(o.reference).is_some() && o.weight > 0.0)
        .collect();
    if usable.len() < 2 {
        return None;
    }
    let sum_w: f64 = usable.iter().map(|o| o.weight).sum();
    let b = b_matrix(obs);
    let k = davenport_k(&b);

    // Secant iteration on char_det, seeded at Σ aᵢ (λ_max ≤ Σ aᵢ).
    let mut l0 = sum_w;
    let mut l1 = sum_w * (1.0 - 1e-6) - 1e-9;
    let mut f0 = char_det(&k, l0);
    let mut f1 = char_det(&k, l1);
    let mut lambda = l1;
    for _ in 0..100 {
        let denom = f1 - f0;
        if denom.abs() < 1e-300 {
            break;
        }
        lambda = l1 - f1 * (l1 - l0) / denom;
        let fl = char_det(&k, lambda);
        if (lambda - l1).abs() <= 1e-12 * (1.0 + lambda.abs()) {
            break;
        }
        l0 = l1;
        f0 = f1;
        l1 = lambda;
        f1 = fl;
    }

    // Gibbs (Rodrigues) vector: Y = ((λ+σ)I − S)⁻¹ Z.
    let sigma = b[0][0] + b[1][1] + b[2][2];
    let s = [
        [2.0 * b[0][0], b[0][1] + b[1][0], b[0][2] + b[2][0]],
        [b[1][0] + b[0][1], 2.0 * b[1][1], b[1][2] + b[2][1]],
        [b[2][0] + b[0][2], b[2][1] + b[1][2], 2.0 * b[2][2]],
    ];
    let z = [b[1][2] - b[2][1], b[2][0] - b[0][2], b[0][1] - b[1][0]];
    let mut m = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            m[i][j] = if i == j { lambda + sigma } else { 0.0 } - s[i][j];
        }
    }
    let minv = inv3(&m)?; // None ⇒ 180° singularity
    let y = mat_vec3(&minv, z);
    let denom = (1.0 + dot(y, y)).sqrt();
    // Scalar-first quaternion [1, Y] / denom.
    let q = [1.0 / denom, y[0] / denom, y[1] / denom, y[2] / denom];
    finalize(q, lambda, obs)
}

// ----------------------------------------------------------------------------
// shared finalisation + symmetric Jacobi eigensolver
// ----------------------------------------------------------------------------

/// Build the [`AttitudeSolution`] from an optimal scalar-first quaternion and the
/// attitude gain.
fn finalize(q: [f64; 4], lambda: f64, obs: &[VectorObs]) -> Option<AttitudeSolution> {
    let a = attitude_matrix_from_quat(q);
    // Library quaternion (body→nav) is from_dcm(Aᵀ).
    let quat = Quaternion::from_dcm(transpose3(&a));
    let loss = wahba_loss(&a, obs);
    Some(AttitudeSolution {
        dcm: a,
        quat,
        max_eigenvalue: lambda,
        loss,
    })
}

/// Symmetric **Jacobi** eigensolver for a real symmetric 4×4 matrix. Returns
/// `(eigenvalues, eigenvectors)` where eigenvector `j` is the column
/// `[evecs[0][j], …, evecs[3][j]]` (orthonormal), paired with `eigenvalues[j]`.
#[allow(clippy::needless_range_loop)]
pub fn jacobi_eigen4(a_in: [[f64; 4]; 4]) -> ([f64; 4], [[f64; 4]; 4]) {
    let mut a = a_in;
    let mut v = [[0.0; 4]; 4];
    for (i, row) in v.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for _sweep in 0..100 {
        // off-diagonal Frobenius norm
        let mut off = 0.0;
        for p in 0..4 {
            for q in (p + 1)..4 {
                off += a[p][q] * a[p][q];
            }
        }
        if off < 1e-30 {
            break;
        }
        for p in 0..4 {
            for q in (p + 1)..4 {
                if a[p][q].abs() < 1e-300 {
                    continue;
                }
                let theta = (a[q][q] - a[p][p]) / (2.0 * a[p][q]);
                let t = if theta == 0.0 {
                    1.0
                } else {
                    theta.signum() / (theta.abs() + (theta * theta + 1.0).sqrt())
                };
                let c = 1.0 / (t * t + 1.0).sqrt();
                let s = t * c;
                // A ← Jᵀ A J : rotate columns then rows of (p, q).
                for k in 0..4 {
                    let akp = a[k][p];
                    let akq = a[k][q];
                    a[k][p] = c * akp - s * akq;
                    a[k][q] = s * akp + c * akq;
                }
                for k in 0..4 {
                    let apk = a[p][k];
                    let aqk = a[q][k];
                    a[p][k] = c * apk - s * aqk;
                    a[q][k] = s * apk + c * aqk;
                }
                // V ← V J
                for vrow in v.iter_mut() {
                    let vp = vrow[p];
                    let vq = vrow[q];
                    vrow[p] = c * vp - s * vq;
                    vrow[q] = s * vp + c * vq;
                }
            }
        }
    }
    let evals = [a[0][0], a[1][1], a[2][2], a[3][3]];
    (evals, v)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn attitude_matrix_of_identity_quat_is_identity() {
        let a = attitude_matrix_from_quat([1.0, 0.0, 0.0, 0.0]);
        for i in 0..3 {
            for j in 0..3 {
                let e = if i == j { 1.0 } else { 0.0 };
                assert!(approx(a[i][j], e, 1e-15), "A[{i}][{j}]={}", a[i][j]);
            }
        }
    }

    #[test]
    fn jacobi_diagonalises_known_symmetric() {
        // Reconstruct A ≈ V diag(λ) Vᵀ and confirm eigenpairs.
        let a = [
            [4.0, 1.0, 0.5, 0.2],
            [1.0, 3.0, 0.3, 0.1],
            [0.5, 0.3, 2.0, 0.4],
            [0.2, 0.1, 0.4, 1.0],
        ];
        let (evals, evecs) = jacobi_eigen4(a);
        // K v = λ v for each eigenpair.
        for j in 0..4 {
            let v = [evecs[0][j], evecs[1][j], evecs[2][j], evecs[3][j]];
            for i in 0..4 {
                let kv: f64 = (0..4).map(|m| a[i][m] * v[m]).sum();
                assert!(
                    approx(kv, evals[j] * v[i], 1e-9),
                    "eigenpair {j} row {i}: {kv} vs {}",
                    evals[j] * v[i]
                );
            }
        }
        // trace is preserved
        let tr_in = 4.0 + 3.0 + 2.0 + 1.0;
        let tr_out: f64 = evals.iter().sum();
        assert!(approx(tr_in, tr_out, 1e-9));
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn davenport_k_is_symmetric() {
        let obs = [
            VectorObs { body: [1.0, 0.0, 0.0], reference: [0.0, 1.0, 0.0], weight: 0.5 },
            VectorObs { body: [0.0, 0.0, 1.0], reference: [1.0, 0.0, 0.0], weight: 0.5 },
        ];
        let k = davenport_k(&b_matrix(&obs));
        for i in 0..4 {
            for j in 0..4 {
                assert!(approx(k[i][j], k[j][i], 1e-15), "K[{i}][{j}] not symmetric");
            }
        }
    }
}
