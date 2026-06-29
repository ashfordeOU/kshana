// SPDX-License-Identifier: AGPL-3.0-only
//! Reference tests for LAMBDA integer ambiguity resolution (`kshana::lambda`).
//!
//! Internal-consistency oracles (not an external dataset):
//!
//! (i)   the integer (Z) transform is unimodular (`|det Z| = 1`), so `Z` and `Z⁻¹` are
//!       integer, `Q_z = Zᵀ Q Z` is SPD with `det Q_z = det Q`, and decorrelation reduces
//!       the off-diagonal correlations;
//! (ii)  the Schnorr–Euchner integer least-squares solver returns the EXACT minimiser —
//!       it agrees with brute-force enumeration over many random problems, and the full
//!       decorrelate→search→back-transform pipeline returns the same integers;
//! (iii) the closed-form bootstrapped success rate matches a Monte-Carlo estimate of
//!       sequential conditional rounding.
//!
//! The Monte-Carlo test uses a deterministic Box–Muller RNG so it is reproducible.
#![allow(clippy::needless_range_loop)]

use kshana::lambda::{
    back_transform, bootstrap_success_rate, decorrelate, ils, ldlt, resolve, transform_float, Mat,
};

fn det(m: &Mat) -> f64 {
    // LDLᵀ determinant = ∏ d (SPD inputs only, which is all we pass).
    let (_l, d) = ldlt(m).expect("spd");
    d.iter().product()
}

#[allow(clippy::needless_range_loop)]
fn quad_form_inv(q: &Mat, e: &[f64]) -> f64 {
    // eᵀ Q⁻¹ e via solving Q y = e (Cholesky-free Gauss) then eᵀ y.
    let n = q.len();
    let mut a = q.clone();
    let mut b = e.to_vec();
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
    let mut y = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = b[i];
        for c in (i + 1)..n {
            s -= a[i][c] * y[c];
        }
        y[i] = s / a[i][i];
    }
    e.iter().zip(&y).map(|(&ei, &yi)| ei * yi).sum()
}

/// Brute-force ILS over a ±k box around the rounded float — the independent oracle.
fn brute_force_ils(q: &Mat, a_hat: &[f64], k: i64) -> Vec<i64> {
    let n = a_hat.len();
    let base: Vec<i64> = a_hat.iter().map(|v| v.round() as i64).collect();
    let span = (2 * k + 1) as usize;
    let total = span.pow(n as u32);
    let mut best = base.clone();
    let mut best_cost = f64::INFINITY;
    for idx in 0..total {
        let mut z = base.clone();
        let mut rem = idx;
        for zi in z.iter_mut() {
            let off = (rem % span) as i64 - k;
            *zi += off;
            rem /= span;
        }
        let e: Vec<f64> = z
            .iter()
            .zip(a_hat)
            .map(|(&zi, &ai)| zi as f64 - ai)
            .collect();
        let cost = quad_form_inv(q, &e);
        if cost < best_cost {
            best_cost = cost;
            best = z;
        }
    }
    best
}

struct Rng {
    s: u64,
}
impl Rng {
    fn new(seed: u64) -> Self {
        Self { s: seed | 1 }
    }
    fn u01(&mut self) -> f64 {
        self.s = self
            .s
            .wrapping_mul(6364136223846793005)
            .wrapping_add(1442695040888963407);
        let x = (self.s >> 11) as f64;
        (x + 0.5) / (1u64 << 53) as f64
    }
    fn normal(&mut self) -> f64 {
        let u1 = self.u01().max(1e-12);
        let u2 = self.u01();
        (-2.0 * u1.ln()).sqrt() * (std::f64::consts::TAU * u2).cos()
    }
}

/// A representative ill-conditioned 3×3 ambiguity covariance (highly correlated).
fn corr_q() -> Mat {
    vec![
        vec![4.0, 3.6, 2.4],
        vec![3.6, 4.0, 2.8],
        vec![2.4, 2.8, 3.0],
    ]
}

fn sum_sq_offdiag_corr(q: &Mat) -> f64 {
    let n = q.len();
    let mut s = 0.0;
    for i in 0..n {
        for j in 0..n {
            if i != j {
                let c = q[i][j] / (q[i][i] * q[j][j]).sqrt();
                s += c * c;
            }
        }
    }
    s
}

#[test]
#[allow(clippy::needless_range_loop)]
fn z_transform_is_unimodular_and_preserves_determinant() {
    let q = corr_q();
    let (z, qz) = decorrelate(&q).expect("spd");
    // |det Z| = 1.
    let dz = int_det(&z);
    assert_eq!(dz.abs(), 1, "Z not unimodular, det = {dz}");
    // Q_z = Zᵀ Q Z is symmetric.
    let n = q.len();
    for i in 0..n {
        for j in 0..n {
            assert!((qz[i][j] - qz[j][i]).abs() < 1e-9, "Q_z not symmetric");
        }
    }
    // det preserved.
    assert!(
        (det(&qz) - det(&q)).abs() / det(&q) < 1e-9,
        "det not preserved"
    );
    // decorrelation reduces the total off-diagonal correlation.
    assert!(
        sum_sq_offdiag_corr(&qz) < sum_sq_offdiag_corr(&q),
        "decorrelation did not reduce correlation: {} -> {}",
        sum_sq_offdiag_corr(&q),
        sum_sq_offdiag_corr(&qz)
    );
}

fn int_det(z: &[Vec<i64>]) -> i64 {
    // independent integer determinant via f64 elimination (rounded).
    let n = z.len();
    let mut a: Vec<Vec<f64>> = z
        .iter()
        .map(|r| r.iter().map(|&v| v as f64).collect())
        .collect();
    let mut d = 1.0;
    for i in 0..n {
        let mut p = i;
        for r in (i + 1)..n {
            if a[r][i].abs() > a[p][i].abs() {
                p = r;
            }
        }
        if a[p][i] == 0.0 {
            return 0;
        }
        if p != i {
            a.swap(p, i);
            d = -d;
        }
        d *= a[i][i];
        for r in (i + 1)..n {
            let f = a[r][i] / a[i][i];
            for c in i..n {
                a[r][c] -= f * a[i][c];
            }
        }
    }
    d.round() as i64
}

#[test]
fn ils_matches_brute_force_over_random_problems() {
    let mut rng = Rng::new(0x1A3B_5C7D_9E0F_2143);
    for trial in 0..300 {
        // Build a random SPD 3×3 covariance Q = M Mᵀ + small diagonal.
        let m: Vec<Vec<f64>> = (0..3)
            .map(|_| (0..3).map(|_| rng.normal()).collect())
            .collect();
        let mut q = vec![vec![0.0; 3]; 3];
        for i in 0..3 {
            for j in 0..3 {
                let mut s = 0.0;
                for k in 0..3 {
                    s += m[i][k] * m[j][k];
                }
                q[i][j] = s + if i == j { 0.3 } else { 0.0 };
            }
        }
        let a_hat: Vec<f64> = (0..3).map(|_| 6.0 * rng.u01() - 3.0).collect();

        let se = ils(&q, &a_hat).expect("ils");
        let bf = brute_force_ils(&q, &a_hat, 4);
        // Compare by objective (degenerate ties allowed): objectives must match.
        let e_se: Vec<f64> = se.iter().zip(&a_hat).map(|(&z, &a)| z as f64 - a).collect();
        let e_bf: Vec<f64> = bf.iter().zip(&a_hat).map(|(&z, &a)| z as f64 - a).collect();
        let c_se = quad_form_inv(&q, &e_se);
        let c_bf = quad_form_inv(&q, &e_bf);
        assert!(
            (c_se - c_bf).abs() <= 1e-7 * (1.0 + c_bf),
            "trial {trial}: ILS cost {c_se} vs brute force {c_bf} (se={se:?} bf={bf:?})"
        );
    }
}

#[test]
fn full_pipeline_recovers_integers_and_matches_direct_ils() {
    let mut rng = Rng::new(0xBEEF_F00D_2026_0628);
    for _ in 0..100 {
        let m: Vec<Vec<f64>> = (0..4)
            .map(|_| (0..4).map(|_| rng.normal()).collect())
            .collect();
        let mut q = vec![vec![0.0; 4]; 4];
        for i in 0..4 {
            for j in 0..4 {
                let mut s = 0.0;
                for k in 0..4 {
                    s += m[i][k] * m[j][k];
                }
                q[i][j] = s + if i == j { 0.5 } else { 0.0 };
            }
        }
        // True integers + a sub-pull-in-region float perturbation.
        let truth: Vec<i64> = (0..4).map(|i| (i as i64) * 3 - 5).collect();
        let a_hat: Vec<f64> = truth
            .iter()
            .map(|&t| t as f64 + 0.18 * rng.normal())
            .collect();

        // Direct ILS in original coordinates.
        let direct = ils(&q, &a_hat).expect("ils");
        // Decorrelated pipeline.
        let fix = resolve(&q, &a_hat).expect("resolve");
        assert_eq!(direct, fix.fixed, "pipeline disagrees with direct ILS");
        // Bootstrapped success rate is a probability.
        assert!(
            fix.success_rate > 0.0 && fix.success_rate <= 1.0,
            "P_s out of range: {}",
            fix.success_rate
        );
    }
}

#[test]
fn back_transform_inverts_the_float_transform_on_integers() {
    let q = corr_q();
    let (z, _qz) = decorrelate(&q).expect("spd");
    // For any integer vector, Zᵀ then Z⁻ᵀ round-trips exactly.
    let v = [3i64, -2, 5];
    let vf: Vec<f64> = v.iter().map(|&x| x as f64).collect();
    let zt = transform_float(&z, &vf); // Zᵀ v (real, but integer-valued)
    let zt_i: Vec<i64> = zt.iter().map(|x| x.round() as i64).collect();
    let back = back_transform(&z, &zt_i);
    assert_eq!(back, v.to_vec(), "Z⁻ᵀ Zᵀ v != v");
}

#[test]
fn bootstrap_rate_matches_monte_carlo() {
    // Sequential conditional rounding (bootstrapping) on the decorrelated problem; the
    // empirical success frequency must match the closed-form rate.
    let q = corr_q();
    let (_z, qz) = decorrelate(&q).expect("spd");
    let (l, d) = ldlt(&qz).expect("spd");
    let n = qz.len();
    let p_closed = bootstrap_success_rate(&qz).expect("spd");

    let mut rng = Rng::new(0xD00D_1234_5678_9ABC);
    let trials = 200_000;
    let mut ok = 0u64;
    for _ in 0..trials {
        // Draw a float error e = L·w with w_i ~ N(0, d_i): this is N(0, Q_z).
        let w: Vec<f64> = (0..n).map(|i| d[i].sqrt() * rng.normal()).collect();
        let mut e = vec![0.0; n];
        for i in 0..n {
            let mut s = 0.0;
            for j in 0..=i {
                s += l[i][j] * w[j];
            }
            e[i] = s;
        }
        // Bootstrap: sequential conditional rounding, same recursion as the ILS
        // conditional float estimate (ẑ_i^cond = e_i + Σ_{j<i} L[i][j]·u_j, residual
        // u_i = z_i − ẑ_i^cond). With Cov(e) = Q_z = L D Lᵀ, the conditional estimate is
        // N(0, D[i]) independently, so success (all roundings land on truth 0) has the
        // closed-form probability ∏(2Φ(1/(2√D_i)) − 1).
        let mut u = vec![0.0; n];
        let mut success = true;
        for i in 0..n {
            let mut cond = e[i];
            for j in 0..i {
                cond += l[i][j] * u[j];
            }
            let zi = cond.round();
            if zi != 0.0 {
                success = false;
                break;
            }
            u[i] = zi - cond; // = −cond on the success path
        }
        if success {
            ok += 1;
        }
    }
    let p_mc = ok as f64 / trials as f64;
    assert!(
        (p_mc - p_closed).abs() < 0.01,
        "bootstrap MC {p_mc} vs closed form {p_closed}"
    );
}
