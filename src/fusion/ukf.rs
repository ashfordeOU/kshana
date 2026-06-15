// SPDX-License-Identifier: Apache-2.0
//! Unscented (sigma-point) Kalman filter — the nonlinear estimation core.
//!
//! The shipped fusion stack uses an error-state EKF ([`crate::fusion::gnss_ins_ekf`])
//! and a coupled linear filter ([`crate::fusion::coupled`]). This module adds the
//! **unscented Kalman filter** (Julier & Uhlmann; Wan & van der Merwe scaled form),
//! the sigma-point estimator a tightly-coupled GNSS/INS navigator uses when the
//! pseudorange/Doppler measurement model is strongly nonlinear and an EKF's Jacobian
//! linearisation degrades.
//!
//! It is a general `n`-state filter over user-supplied process `f` and measurement `h`
//! functions, so it is independent of any particular navigation state vector. The
//! defining property — and the basis of its tests — is that for a *linear* model the
//! unscented transform reproduces the Kalman filter **exactly** (to numerical
//! precision), for any sigma-point spread.
//!
//! Scope (honest): this is the estimator engine and its linear-algebra core (Cholesky
//! sigma-point spread, scaled-UT weights, predict/update). Wiring it into a 17-state
//! tightly-coupled GNSS/INS navigator with a pseudorange/Doppler measurement model and
//! an outage-validation scenario is a follow-on (see `ROADMAP.md`).

/// A dense matrix as rows of columns.
type Mat = Vec<Vec<f64>>;
/// Sigma points and their mean/covariance weights `(points, Wm, Wc)`.
type SigmaSet = (Vec<Vec<f64>>, Vec<f64>, Vec<f64>);

/// Lower-triangular Cholesky factor `L` (with `P = L·Lᵀ`) of a symmetric
/// positive-definite matrix, or `None` if `p` is not positive-definite.
pub fn cholesky(p: &[Vec<f64>]) -> Option<Mat> {
    let n = p.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let dot: f64 = l[i][..j].iter().zip(&l[j][..j]).map(|(&a, &b)| a * b).sum();
            let sum = p[i][j] - dot;
            if i == j {
                if sum <= 0.0 {
                    return None;
                }
                l[i][j] = sum.sqrt();
            } else {
                l[i][j] = sum / l[j][j];
            }
        }
    }
    Some(l)
}

/// Inverse of a square matrix by Gauss–Jordan elimination with partial pivoting,
/// or `None` if singular.
pub fn inverse(a: &[Vec<f64>]) -> Option<Mat> {
    let n = a.len();
    // Augment [A | I].
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
        // Partial pivot: largest |value| in this column at or below the diagonal.
        let mut piv = col;
        for r in (col + 1)..n {
            if m[r][col].abs() > m[piv][col].abs() {
                piv = r;
            }
        }
        if m[piv][col].abs() < 1e-300 {
            return None;
        }
        m.swap(col, piv);
        let d = m[col][col];
        for x in m[col].iter_mut() {
            *x /= d;
        }
        let pivot_row = m[col].clone();
        for (r, row) in m.iter_mut().enumerate() {
            if r != col {
                let f = row[col];
                if f != 0.0 {
                    for (x, &pv) in row.iter_mut().zip(&pivot_row) {
                        *x -= f * pv;
                    }
                }
            }
        }
    }
    Some(m.iter().map(|row| row[n..2 * n].to_vec()).collect())
}

fn mat_vec(a: &[Vec<f64>], v: &[f64]) -> Vec<f64> {
    a.iter()
        .map(|row| row.iter().zip(v).map(|(&x, &y)| x * y).sum())
        .collect()
}

fn matmul(a: &[Vec<f64>], b: &[Vec<f64>]) -> Mat {
    let (n, m, p) = (a.len(), b[0].len(), b.len());
    let mut r = vec![vec![0.0; m]; n];
    for (i, ri) in r.iter_mut().enumerate() {
        for (j, rij) in ri.iter_mut().enumerate() {
            *rij = (0..p).map(|k| a[i][k] * b[k][j]).sum();
        }
    }
    r
}

fn transpose(a: &[Vec<f64>]) -> Mat {
    let (n, m) = (a.len(), a[0].len());
    let mut t = vec![vec![0.0; n]; m];
    for (i, row) in a.iter().enumerate() {
        for (j, &x) in row.iter().enumerate() {
            t[j][i] = x;
        }
    }
    t
}

/// An unscented Kalman filter over an `n`-dimensional state.
#[derive(Clone, Debug)]
pub struct Ukf {
    /// State mean (length `n`).
    pub x: Vec<f64>,
    /// State covariance (`n × n`, symmetric positive-definite).
    pub p: Mat,
    /// Sigma-point spread (`1e-4 ≤ α ≤ 1`); small α keeps points close to the mean.
    pub alpha: f64,
    /// Prior-knowledge term (`β = 2` is optimal for a Gaussian).
    pub beta: f64,
    /// Secondary scaling (`κ`, usually `0` or `3 − n`).
    pub kappa: f64,
}

impl Ukf {
    /// A filter with the conventional scaled-UT parameters (`α = 1e-3`, `β = 2`,
    /// `κ = 0`).
    pub fn new(x: Vec<f64>, p: Mat) -> Self {
        Self {
            x,
            p,
            alpha: 1e-3,
            beta: 2.0,
            kappa: 0.0,
        }
    }

    fn n(&self) -> usize {
        self.x.len()
    }

    fn lambda(&self) -> f64 {
        self.alpha * self.alpha * (self.n() as f64 + self.kappa) - self.n() as f64
    }

    /// The `2n+1` sigma points and their mean/covariance weights, or `None` if the
    /// covariance is not positive-definite. Points: `x`, then `x ± γ·Lᵢ` for the
    /// Cholesky columns `Lᵢ`, with `γ = √(n+λ)`.
    fn sigma_points(&self) -> Option<SigmaSet> {
        let n = self.n();
        let lambda = self.lambda();
        let l = cholesky(&self.p)?;
        let gamma = (n as f64 + lambda).sqrt();
        // Columns of L (= rows of Lᵀ); column i scaled by γ is the i-th spread vector.
        let lt = transpose(&l);
        let mut pts = Vec::with_capacity(2 * n + 1);
        pts.push(self.x.clone());
        for lcol in &lt {
            let plus: Vec<f64> = self
                .x
                .iter()
                .zip(lcol)
                .map(|(&xr, &v)| xr + gamma * v)
                .collect();
            let minus: Vec<f64> = self
                .x
                .iter()
                .zip(lcol)
                .map(|(&xr, &v)| xr - gamma * v)
                .collect();
            pts.push(plus);
            pts.push(minus);
        }
        let wm0 = lambda / (n as f64 + lambda);
        let wc0 = wm0 + (1.0 - self.alpha * self.alpha + self.beta);
        let wi = 1.0 / (2.0 * (n as f64 + lambda));
        let mut wm = vec![wi; 2 * n + 1];
        let mut wc = vec![wi; 2 * n + 1];
        wm[0] = wm0;
        wc[0] = wc0;
        Some((pts, wm, wc))
    }

    /// Predict through a (possibly nonlinear) process model `f` with additive process
    /// noise covariance `q`. Returns `false` (state untouched) on a non-PD covariance.
    pub fn predict<F>(&mut self, f: F, q: &[Vec<f64>]) -> bool
    where
        F: Fn(&[f64]) -> Vec<f64>,
    {
        let n = self.n();
        let Some((pts, wm, wc)) = self.sigma_points() else {
            return false;
        };
        let prop: Vec<Vec<f64>> = pts.iter().map(|p| f(p)).collect();
        let mut x = vec![0.0; n];
        for (w, y) in wm.iter().zip(&prop) {
            for (xi, &yi) in x.iter_mut().zip(y) {
                *xi += w * yi;
            }
        }
        let mut p = vec![vec![0.0; n]; n];
        for (w, y) in wc.iter().zip(&prop) {
            let d: Vec<f64> = y.iter().zip(&x).map(|(&yi, &xi)| yi - xi).collect();
            for i in 0..n {
                for j in 0..n {
                    p[i][j] += w * d[i] * d[j];
                }
            }
        }
        for i in 0..n {
            for j in 0..n {
                p[i][j] += q[i][j];
            }
        }
        self.x = x;
        self.p = p;
        true
    }

    /// Update with a measurement `z` through a (possibly nonlinear) measurement model
    /// `h`, with measurement-noise covariance `r`. Returns `false` (state untouched)
    /// on a non-PD covariance or singular innovation covariance.
    pub fn update<H>(&mut self, h: H, z: &[f64], r: &[Vec<f64>]) -> bool
    where
        H: Fn(&[f64]) -> Vec<f64>,
    {
        self.update_stats(h, z, r).is_some()
    }

    /// Update exactly as [`update`](Self::update), additionally returning the
    /// **Normalised Innovation Squared** `NIS = νᵀ S⁻¹ ν` of this measurement (the
    /// pre-update innovation `ν = z − ẑ` whitened by its innovation covariance
    /// `S = H P Hᵀ + R`). Under a correctly-tuned filter the innovation sequence is
    /// white with `NIS ∼ χ²(m)` (`m = z.len()`), so this scalar is the observable
    /// consistency / innovation-whiteness statistic (Bar-Shalom, *Estimation with
    /// Applications to Tracking and Navigation*, §5.4). Returns `None` (state
    /// untouched) on a non-PD covariance or singular `S`.
    pub fn update_stats<H>(&mut self, h: H, z: &[f64], r: &[Vec<f64>]) -> Option<f64>
    where
        H: Fn(&[f64]) -> Vec<f64>,
    {
        let n = self.n();
        let (pts, wm, wc) = self.sigma_points()?;
        let zsig: Vec<Vec<f64>> = pts.iter().map(|p| h(p)).collect();
        let m = zsig[0].len();
        // Predicted measurement mean.
        let mut zbar = vec![0.0; m];
        for (w, zs) in wm.iter().zip(&zsig) {
            for (zi, &zv) in zbar.iter_mut().zip(zs) {
                *zi += w * zv;
            }
        }
        // Innovation covariance S (m×m) and state–measurement cross-covariance C (n×m).
        let mut s = vec![vec![0.0; m]; m];
        let mut c = vec![vec![0.0; m]; n];
        for ((w, zs), xs) in wc.iter().zip(&zsig).zip(&pts) {
            let dz: Vec<f64> = zs.iter().zip(&zbar).map(|(&a, &b)| a - b).collect();
            let dx: Vec<f64> = xs.iter().zip(&self.x).map(|(&a, &b)| a - b).collect();
            for i in 0..m {
                for j in 0..m {
                    s[i][j] += w * dz[i] * dz[j];
                }
            }
            for i in 0..n {
                for j in 0..m {
                    c[i][j] += w * dx[i] * dz[j];
                }
            }
        }
        for i in 0..m {
            for j in 0..m {
                s[i][j] += r[i][j];
            }
        }
        let s_inv = inverse(&s)?;
        // Kalman gain K = C·S⁻¹ (n×m · m×m = n×m).
        let k = matmul(&c, &s_inv); // n × m
        let innov: Vec<f64> = z.iter().zip(&zbar).map(|(&a, &b)| a - b).collect();
        // NIS = νᵀ S⁻¹ ν (computed before the state is touched).
        let s_inv_innov = mat_vec(&s_inv, &innov);
        let nis: f64 = innov.iter().zip(&s_inv_innov).map(|(&a, &b)| a * b).sum();
        let dx = mat_vec(&k, &innov);
        for (xi, &d) in self.x.iter_mut().zip(&dx) {
            *xi += d;
        }
        // P⁺ = P⁻ − K S Kᵀ.
        let ks = matmul(&k, &s); // n × m
        let ksk = matmul(&ks, &transpose(&k)); // n × n
        for (prow, krow) in self.p.iter_mut().zip(&ksk) {
            for (pij, &kij) in prow.iter_mut().zip(krow) {
                *pij -= kij;
            }
        }
        Some(nis)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx_eq_mat(a: &[Vec<f64>], b: &[Vec<f64>], tol: f64) -> bool {
        a.iter()
            .zip(b)
            .all(|(ra, rb)| ra.iter().zip(rb).all(|(&x, &y)| (x - y).abs() < tol))
    }

    #[test]
    fn cholesky_reconstructs_spd() {
        let p = vec![
            vec![4.0, 2.0, 0.4],
            vec![2.0, 5.0, 1.0],
            vec![0.4, 1.0, 3.0],
        ];
        let l = cholesky(&p).expect("spd");
        let recon = matmul(&l, &transpose(&l));
        assert!(approx_eq_mat(&p, &recon, 1e-12));
        // A non-PD matrix is rejected.
        assert!(cholesky(&[vec![1.0, 2.0], vec![2.0, 1.0]]).is_none());
    }

    #[test]
    fn inverse_is_correct() {
        let a = vec![vec![4.0, 7.0], vec![2.0, 6.0]];
        let ai = inverse(&a).expect("nonsingular");
        let id = matmul(&a, &ai);
        assert!(approx_eq_mat(&id, &[vec![1.0, 0.0], vec![0.0, 1.0]], 1e-12));
        assert!(inverse(&[vec![1.0, 2.0], vec![2.0, 4.0]]).is_none());
    }

    // A hand-run linear Kalman filter for cross-checking the UKF.
    fn kf_predict(x: &[f64], p: &[Vec<f64>], f: &[Vec<f64>], q: &[Vec<f64>]) -> (Vec<f64>, Mat) {
        let xp = mat_vec(f, x);
        let pp = matmul(&matmul(f, p), &transpose(f));
        let pp = (0..pp.len())
            .map(|i| (0..pp.len()).map(|j| pp[i][j] + q[i][j]).collect())
            .collect();
        (xp, pp)
    }

    fn kf_update(
        x: &[f64],
        p: &[Vec<f64>],
        h: &[Vec<f64>],
        z: &[f64],
        r: &[Vec<f64>],
    ) -> (Vec<f64>, Mat) {
        let ht = transpose(h);
        let s: Mat = {
            let hp = matmul(h, p);
            let hph = matmul(&hp, &ht);
            (0..hph.len())
                .map(|i| (0..hph.len()).map(|j| hph[i][j] + r[i][j]).collect())
                .collect()
        };
        let si = inverse(&s).unwrap();
        let k = matmul(&matmul(p, &ht), &si); // n × m
        let hx = mat_vec(h, x);
        let innov: Vec<f64> = z.iter().zip(&hx).map(|(&a, &b)| a - b).collect();
        let dx = mat_vec(&k, &innov);
        let xn: Vec<f64> = x.iter().zip(&dx).map(|(&a, &b)| a + b).collect();
        // P = (I − KH) P
        let kh = matmul(&k, h);
        let n = x.len();
        let mut imkh = vec![vec![0.0; n]; n];
        for i in 0..n {
            for j in 0..n {
                imkh[i][j] = (if i == j { 1.0 } else { 0.0 }) - kh[i][j];
            }
        }
        (xn, matmul(&imkh, p))
    }

    #[test]
    fn ukf_predict_equals_linear_kf() {
        // Constant-velocity model: x = [pos, vel], F = [[1, dt],[0, 1]].
        let f_mat = vec![vec![1.0, 0.5], vec![0.0, 1.0]];
        let q = vec![vec![0.01, 0.0], vec![0.0, 0.04]];
        let x0 = vec![3.0, -1.0];
        let p0 = vec![vec![1.0, 0.2], vec![0.2, 0.5]];
        let mut ukf = Ukf::new(x0.clone(), p0.clone());
        let fm = f_mat.clone();
        assert!(ukf.predict(|s| mat_vec(&fm, s), &q));
        let (xk, pk) = kf_predict(&x0, &p0, &f_mat, &q);
        assert!(ukf.x.iter().zip(&xk).all(|(&a, &b)| (a - b).abs() < 1e-9));
        assert!(
            approx_eq_mat(&ukf.p, &pk, 1e-9),
            "P {:?} vs {:?}",
            ukf.p,
            pk
        );
    }

    #[test]
    fn ukf_update_equals_linear_kf() {
        // Measure position only: H = [[1, 0]].
        let h_mat = vec![vec![1.0, 0.0]];
        let r = vec![vec![0.25]];
        let x0 = vec![3.0, -1.0];
        let p0 = vec![vec![1.0, 0.2], vec![0.2, 0.5]];
        let z = vec![3.6];
        let mut ukf = Ukf::new(x0.clone(), p0.clone());
        let hm = h_mat.clone();
        assert!(ukf.update(|s| mat_vec(&hm, s), &z, &r));
        let (xk, pk) = kf_update(&x0, &p0, &h_mat, &z, &r);
        assert!(
            ukf.x.iter().zip(&xk).all(|(&a, &b)| (a - b).abs() < 1e-9),
            "x {:?} vs {:?}",
            ukf.x,
            xk
        );
        assert!(
            approx_eq_mat(&ukf.p, &pk, 1e-9),
            "P {:?} vs {:?}",
            ukf.p,
            pk
        );
    }

    #[test]
    fn ukf_full_cycle_equals_linear_kf() {
        // One predict + one update must track the linear KF exactly, regardless of α.
        let f_mat = vec![vec![1.0, 1.0], vec![0.0, 1.0]];
        let q = vec![vec![0.001, 0.0], vec![0.0, 0.001]];
        let h_mat = vec![vec![1.0, 0.0]];
        let r = vec![vec![0.1]];
        let x0 = vec![0.0, 1.0];
        let p0 = vec![vec![1.0, 0.0], vec![0.0, 1.0]];
        let z = vec![1.2];

        let mut ukf = Ukf::new(x0.clone(), p0.clone());
        ukf.alpha = 0.5; // any valid spread must give the same linear answer
        let fm = f_mat.clone();
        let hm = h_mat.clone();
        assert!(ukf.predict(|s| mat_vec(&fm, s), &q));
        assert!(ukf.update(|s| mat_vec(&hm, s), &z, &r));

        let (xk, pk) = kf_predict(&x0, &p0, &f_mat, &q);
        let (xk, pk) = kf_update(&xk, &pk, &h_mat, &z, &r);
        assert!(ukf.x.iter().zip(&xk).all(|(&a, &b)| (a - b).abs() < 1e-9));
        assert!(approx_eq_mat(&ukf.p, &pk, 1e-9));
    }

    #[test]
    fn update_stats_returns_hand_derived_nis() {
        // 1-D constant state, scalar measurement: NIS = ν²/S with ν = z − x̂ and
        // S = P₀₀ + R. Prior x̂ = 2, P = 4; measurement z = 5, R = 1.
        //   ν = 5 − 2 = 3, S = 4 + 1 = 5 ⇒ NIS = 9/5 = 1.8 (hand-derived).
        let mut ukf = Ukf::new(vec![2.0], vec![vec![4.0]]);
        let nis = ukf
            .update_stats(|s| vec![s[0]], &[5.0], &[vec![1.0]])
            .expect("update succeeds");
        assert!((nis - 1.8).abs() < 1e-12, "NIS = {nis}, expected 1.8");
    }

    #[test]
    fn update_and_update_stats_agree_on_the_posterior() {
        // The convenience `update` must leave exactly the state `update_stats` does
        // (it delegates), so the NIS instrumentation never changes the estimate.
        let h = |s: &[f64]| vec![s[0]];
        let z = [5.0];
        let r = vec![vec![1.0]];
        let mut a = Ukf::new(vec![2.0], vec![vec![4.0]]);
        let mut b = a.clone();
        assert!(a.update(h, &z, &r));
        assert!(b.update_stats(h, &z, &r).is_some());
        assert_eq!(a.x, b.x);
        assert_eq!(a.p, b.p);
    }

    #[test]
    fn ukf_1d_constant_recovers_bayesian_posterior() {
        // 1-D constant state x ~ N(μ0, σ0²); one measurement z with noise σz².
        // Posterior: σ² = 1/(1/σ0² + 1/σz²), μ = σ²(μ0/σ0² + z/σz²).
        let mu0 = 2.0;
        let s0 = 4.0;
        let sz = 1.0;
        let z = 5.0;
        let mut ukf = Ukf::new(vec![mu0], vec![vec![s0]]);
        assert!(ukf.update(|s| vec![s[0]], &[z], &[vec![sz]]));
        let post_var = 1.0 / (1.0 / s0 + 1.0 / sz);
        let post_mean = post_var * (mu0 / s0 + z / sz);
        assert!((ukf.x[0] - post_mean).abs() < 1e-9, "mean {}", ukf.x[0]);
        assert!((ukf.p[0][0] - post_var).abs() < 1e-9, "var {}", ukf.p[0][0]);
    }
}
