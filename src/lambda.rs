// SPDX-License-Identifier: AGPL-3.0-only
//! GNSS carrier-phase **integer ambiguity resolution** — the LAMBDA approach
//! (Teunissen 1995): integer least-squares with a decorrelating integer (Z) transform
//! and a closed-form bootstrapped success rate.
//!
//! Carrier-phase positioning needs the integer cycle ambiguities `z ∈ ℤⁿ`. A float
//! solution gives a real-valued estimate `â` with covariance `Q` (symmetric positive
//! definite). The maximum-likelihood integer estimate is the **integer least-squares**
//! (ILS) solution
//!
//! ```text
//!   ž = argmin_{z ∈ ℤⁿ} (z − â)ᵀ Q⁻¹ (z − â).
//! ```
//!
//! Because `Q` is typically highly correlated (elongated search ellipsoid), the search is
//! slow in the original coordinates. LAMBDA first applies an integer, **volume-preserving**
//! (`|det Z| = 1`, so `Z` and `Z⁻¹` are both integer) transformation `z' = Zᵀ z` that
//! **decorrelates** the ambiguities — here the integer-Gauss size-reduction step that
//! drives the off-diagonal correlations below ½ — and then searches in the transformed,
//! nearly spherical space before mapping the integer solution back, `ž = Z⁻ᵀ ž'`. The ILS
//! search itself is an exact Schnorr–Euchner depth-first branch-and-bound over the
//! `Q = L D Lᵀ` factorization (sequential conditional rounding with search-shrinking),
//! so the returned `ž` is the *exact* minimiser, independent of how well the transform
//! decorrelated `Q`.
//!
//! The **bootstrapped success rate** — the probability that sequential conditional
//! rounding lands on the correct integers — has the closed form
//! `P_s = ∏ᵢ [2Φ(1/(2σ_{î_i|I})) − 1]`, where the `σ²_{î_i|I}` are the conditional
//! variances `D[i]` of the factorization and `Φ` is the standard normal CDF. It is a
//! sharp lower bound on the ILS success rate and rises as the decorrelation makes the
//! conditional variances smaller, which is the quantitative payoff of the Z-transform.
//!
//! Scope (honest): the decorrelation implemented here is the **integer-Gauss
//! size-reduction** part of LAMBDA — it reduces the off-diagonal correlations and is a
//! genuine volume-preserving Z-transform — but the conditional-variance *reordering*
//! permutations of the full LAMBDA reduction are out of scope (they only speed the search
//! further; they change neither the exact ILS answer nor the bootstrapped rate of the
//! transformed problem). It is a MODELLED capability whose reference tests check the
//! Z-transform invariants, the exact ILS against brute-force enumeration, and the
//! bootstrapped rate against Monte-Carlo — internal-consistency oracles, not an external
//! dataset.
//!
//! References:
//! - P. J. G. Teunissen, "The least-squares ambiguity decorrelation adjustment: a method
//!   for fast GPS integer ambiguity estimation," *J. Geodesy* 70 (1995).
//! - P. de Jonge & C. Tiberius, "The LAMBDA method for integer ambiguity estimation,"
//!   LGR-Series 12, TU Delft (1996).
//! - X.-W. Chang, X. Yang, T. Zhou, "MLAMBDA: a modified LAMBDA method for integer
//!   least-squares estimation," *J. Geodesy* 79 (2005).

use crate::detection::normal_cdf;

/// A dense row-major real matrix.
pub type Mat = Vec<Vec<f64>>;

/// The result of an ambiguity resolution.
#[derive(Clone, Debug)]
pub struct AmbiguityFix {
    /// The exact integer least-squares solution `ž` (original coordinates).
    pub fixed: Vec<i64>,
    /// ILS objective `(ž − â)ᵀ Q⁻¹ (ž − â)` of the best candidate.
    pub residual: f64,
    /// Ratio of the second-best to best ILS objective (the classic acceptance "ratio
    /// test" discriminator; larger ⇒ more confident). `INFINITY` if only one candidate.
    pub ratio: f64,
    /// Closed-form bootstrapped success rate of the decorrelated problem.
    pub success_rate: f64,
}

// ----------------------------------------------------------------------------
// factorisation and small linear algebra
// ----------------------------------------------------------------------------

/// `L D Lᵀ` factorisation of a symmetric positive-definite `q`: unit lower-triangular
/// `L` and positive diagonal `d`, with `q = L · diag(d) · Lᵀ`. Returns `None` if `q` is
/// not positive definite.
pub fn ldlt(q: &Mat) -> Option<(Mat, Vec<f64>)> {
    let n = q.len();
    let mut l = vec![vec![0.0; n]; n];
    let mut d = vec![0.0; n];
    for j in 0..n {
        let mut dj = q[j][j];
        for k in 0..j {
            dj -= l[j][k] * l[j][k] * d[k];
        }
        if dj <= 0.0 {
            return None;
        }
        d[j] = dj;
        l[j][j] = 1.0;
        for i in (j + 1)..n {
            let mut s = q[i][j];
            for k in 0..j {
                s -= l[i][k] * l[j][k] * d[k];
            }
            l[i][j] = s / dj;
        }
    }
    Some((l, d))
}

/// `aᵀ · b` for square integer matrices times a real matrix is not needed; this is the
/// real congruence `Zᵀ Q Z` for an integer `z` (used to form the decorrelated covariance).
#[allow(clippy::needless_range_loop)]
fn congruence(z: &[Vec<i64>], q: &Mat) -> Mat {
    let n = q.len();
    // M = Q Z  (real)
    let mut qz = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            let mut s = 0.0;
            for (k, qik) in q[i].iter().enumerate() {
                s += qik * z[k][j] as f64;
            }
            qz[i][j] = s;
        }
    }
    // R = Zᵀ (QZ)
    let mut r = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..n {
            let mut s = 0.0;
            for k in 0..n {
                s += z[k][i] as f64 * qz[k][j];
            }
            r[i][j] = s;
        }
    }
    r
}

// ----------------------------------------------------------------------------
// decorrelation (integer-Gauss size reduction)
// ----------------------------------------------------------------------------

/// Integer-Gauss decorrelation. Returns the integer transform `Z` (with `|det Z| = 1`)
/// and the decorrelated covariance `Q_z = Zᵀ Q Z`. The transformed float ambiguities
/// are `ẑ = Zᵀ â` ([`transform_float`]).
#[allow(clippy::needless_range_loop)]
pub fn decorrelate(q: &Mat) -> Option<(Vec<Vec<i64>>, Mat)> {
    let n = q.len();
    let (mut l, _d) = ldlt(q)?;
    // Z starts at the identity; we accumulate the same column operations applied to L.
    let mut z = vec![vec![0i64; n]; n];
    for (i, row) in z.iter_mut().enumerate() {
        row[i] = 1;
    }
    // Size-reduce the lower triangle from the bottom row up, right column to left, so a
    // reduced entry stays reduced (standard LLL size-reduction order). Reducing L[i][j]
    // with the unit row j: L[i][0..=j] -= μ·L[j][0..=j], and the ambiguity transform
    // column op Z[:,j] += μ·Z[:,i].
    for i in (1..n).rev() {
        for j in (0..i).rev() {
            let mu = l[i][j].round();
            if mu != 0.0 {
                let m = mu as i64;
                // Row op on L (reduces L[i][j] to |·| ≤ ½): L[i][0..=j] -= μ·L[j][0..=j].
                for k in 0..=j {
                    l[i][k] -= mu * l[j][k];
                }
                // Matching congruence transform Z = I − μ·e_j e_iᵀ ⇒ column op
                // Z[:,i] -= μ·Z[:,j], so Q_z = Zᵀ Q Z carries the same reduction.
                for k in 0..n {
                    z[k][i] -= m * z[k][j];
                }
            }
        }
    }
    let qz = congruence(&z, q);
    Some((z, qz))
}

/// Transformed float ambiguities `ẑ = Zᵀ â`.
pub fn transform_float(z: &[Vec<i64>], a_hat: &[f64]) -> Vec<f64> {
    let n = a_hat.len();
    let mut out = vec![0.0; n];
    for j in 0..n {
        let mut s = 0.0;
        for (i, &ai) in a_hat.iter().enumerate() {
            s += z[i][j] as f64 * ai;
        }
        out[j] = s;
    }
    out
}

/// Map a decorrelated-space integer solution `z'` back to the original ambiguities
/// `ž = Z⁻ᵀ z'`, i.e. solve `Zᵀ ž = z'`. `Z` is integer unimodular, so `ž` is integer.
#[allow(clippy::needless_range_loop)]
pub fn back_transform(z: &[Vec<i64>], z_fixed: &[i64]) -> Vec<i64> {
    let n = z.len();
    // Solve Zᵀ x = z_fixed over the reals, then round (exact for unimodular Z).
    let mut a: Mat = (0..n)
        .map(|i| (0..n).map(|j| z[j][i] as f64).collect())
        .collect();
    let mut b: Vec<f64> = z_fixed.iter().map(|&v| v as f64).collect();
    // Gaussian elimination with partial pivot.
    for i in 0..n {
        let mut p = i;
        for r in (i + 1)..n {
            if a[r][i].abs() > a[p][i].abs() {
                p = r;
            }
        }
        a.swap(i, p);
        b.swap(i, p);
        let piv = a[i][i];
        for r in (i + 1)..n {
            let f = a[r][i] / piv;
            for c in i..n {
                a[r][c] -= f * a[i][c];
            }
            b[r] -= f * b[i];
        }
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = b[i];
        for c in (i + 1)..n {
            s -= a[i][c] * x[c];
        }
        x[i] = s / a[i][i];
    }
    x.iter().map(|v| v.round() as i64).collect()
}

// ----------------------------------------------------------------------------
// integer least-squares (Schnorr–Euchner search)
// ----------------------------------------------------------------------------

/// The two best integer least-squares candidates for the (already decorrelated, ideally)
/// float vector `a_hat` with covariance `q`, by an exact Schnorr–Euchner depth-first
/// branch-and-bound over `Q = L D Lᵀ`. Returns `(best, best_cost, second_cost)`; the
/// second cost is `INFINITY` if no distinct runner-up is found within the node budget.
fn ils_two_best(q: &Mat, a_hat: &[f64]) -> Option<(Vec<i64>, f64, f64)> {
    let n = a_hat.len();
    let (l, d) = ldlt(q)?;
    let mut best: Option<Vec<i64>> = None;
    let mut best_cost = f64::INFINITY;
    let mut second_cost = f64::INFINITY;
    let mut z = vec![0i64; n];
    let mut u = vec![0.0f64; n]; // residuals u_j = z_j − ẑ_j^cond
    let mut nodes: u64 = 0;
    let budget: u64 = 2_000_000;

    // Depth-first recursion over levels 0..n with Schnorr–Euchner candidate ordering.
    #[allow(clippy::too_many_arguments)]
    fn dfs(
        i: usize,
        n: usize,
        l: &Mat,
        d: &[f64],
        a_hat: &[f64],
        z: &mut Vec<i64>,
        u: &mut Vec<f64>,
        cost: f64,
        best: &mut Option<Vec<i64>>,
        best_cost: &mut f64,
        second_cost: &mut f64,
        nodes: &mut u64,
        budget: u64,
    ) {
        if *nodes > budget {
            return;
        }
        if i == n {
            // leaf: keep the two smallest distinct objective values (for the ratio test)
            if cost < *best_cost {
                *second_cost = *best_cost;
                *best_cost = cost;
                *best = Some(z.clone());
            } else if cost < *second_cost {
                *second_cost = cost;
            }
            return;
        }
        // conditional float estimate at this level
        let mut zc = a_hat[i];
        for j in 0..i {
            zc += l[i][j] * u[j];
        }
        let center = zc.round();
        // Schnorr–Euchner enumeration in STRICTLY increasing distance from zc: visit the
        // nearest integer first, then always advance whichever side (up/down) has the
        // closer next candidate. This monotonicity is what makes the cost-pruning sound.
        let mut visited_center = false;
        let mut up = center + 1.0;
        let mut down = center - 1.0;
        loop {
            *nodes += 1;
            if *nodes > budget {
                return;
            }
            let cand = if !visited_center {
                visited_center = true;
                center
            } else if (up - zc).abs() <= (zc - down).abs() {
                let c = up;
                up += 1.0;
                c
            } else {
                let c = down;
                down -= 1.0;
                c
            };
            let ui = cand - zc;
            let add = ui * ui / d[i];
            // Pruning against the runner-up bound: candidates are visited in increasing
            // |Δ|, so once this level's term alone reaches the second-best incumbent,
            // every further candidate at this level does too.
            if cost + add >= *second_cost {
                break;
            }
            z[i] = cand.round() as i64;
            u[i] = ui;
            dfs(
                i + 1,
                n,
                l,
                d,
                a_hat,
                z,
                u,
                cost + add,
                best,
                best_cost,
                second_cost,
                nodes,
                budget,
            );
            // Safety bound: never wander more than a wide window from the centre.
            if (cand - center).abs() > 1_000.0 {
                break;
            }
        }
    }

    dfs(
        0,
        n,
        &l,
        &d,
        a_hat,
        &mut z,
        &mut u,
        0.0,
        &mut best,
        &mut best_cost,
        &mut second_cost,
        &mut nodes,
        budget,
    );
    best.map(|b| (b, best_cost, second_cost))
}

/// Exact integer least-squares solution for `a_hat` with covariance `q`, in the SAME
/// coordinates as the inputs. Returns the integer vector minimising
/// `(z − a_hat)ᵀ q⁻¹ (z − a_hat)`.
pub fn ils(q: &Mat, a_hat: &[f64]) -> Option<Vec<i64>> {
    ils_two_best(q, a_hat).map(|(b, _, _)| b)
}

// ----------------------------------------------------------------------------
// bootstrapped success rate
// ----------------------------------------------------------------------------

/// Closed-form bootstrapped success rate `P_s = ∏ᵢ [2Φ(1/(2σ_{î_i|I})) − 1]` from the
/// conditional variances `D[i]` of the `L D Lᵀ` factorisation of `q`. Returns `None` if
/// `q` is not positive definite.
pub fn bootstrap_success_rate(q: &Mat) -> Option<f64> {
    let (_l, d) = ldlt(q)?;
    let mut p = 1.0;
    for &di in &d {
        let sigma = di.sqrt();
        p *= 2.0 * normal_cdf(1.0 / (2.0 * sigma)) - 1.0;
    }
    Some(p)
}

// ----------------------------------------------------------------------------
// top-level resolve
// ----------------------------------------------------------------------------

/// Full LAMBDA resolution: decorrelate, solve the integer least-squares in the
/// transformed space, map back to the original ambiguities, and report the ratio test
/// and the (decorrelated) bootstrapped success rate. Returns `None` if `q` is not
/// positive definite or the search budget is exhausted before a candidate is found.
pub fn resolve(q: &Mat, a_hat: &[f64]) -> Option<AmbiguityFix> {
    let (z, qz) = decorrelate(q)?;
    let z_float = transform_float(&z, a_hat);
    let (z_fixed, best_cost, second_cost) = ils_two_best(&qz, &z_float)?;
    let fixed = back_transform(&z, &z_fixed);
    let ratio = if second_cost.is_finite() && best_cost > 0.0 {
        second_cost / best_cost
    } else {
        f64::INFINITY
    };
    let success_rate = bootstrap_success_rate(&qz)?;
    Some(AmbiguityFix {
        fixed,
        residual: best_cost,
        ratio,
        success_rate,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ldlt_reconstruct(l: &Mat, d: &[f64]) -> Mat {
        let n = d.len();
        let mut q = vec![vec![0.0; n]; n];
        for i in 0..n {
            for j in 0..n {
                let mut s = 0.0;
                for k in 0..n {
                    s += l[i][k] * d[k] * l[j][k];
                }
                q[i][j] = s;
            }
        }
        q
    }

    #[test]
    fn ldlt_reconstructs_the_matrix() {
        let q = vec![
            vec![6.0, 5.0, 2.0],
            vec![5.0, 6.0, 3.0],
            vec![2.0, 3.0, 5.0],
        ];
        let (l, d) = ldlt(&q).expect("spd");
        let r = ldlt_reconstruct(&l, &d);
        for i in 0..3 {
            for j in 0..3 {
                assert!((r[i][j] - q[i][j]).abs() < 1e-10, "[{i}][{j}]");
            }
        }
    }
}
