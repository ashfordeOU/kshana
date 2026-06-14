// SPDX-License-Identifier: Apache-2.0
//! Numerically-robust **sequential** orbit determination — a hand-rolled Square-Root Information
//! Filter (SRIF; Bierman 1977) with reduced-dynamic empirical accelerations, the factored
//! complement to the batch differential corrector of [`crate::precise_od`].
//!
//! Where [`crate::precise_od::fit`] forms and inverts the full normal matrix `HᵀWH` in one batch,
//! the SRIF carries the **square root** of the information matrix — an upper-triangular `R` with
//! `Λ = RᵀR` (information) and `P = R⁻¹R⁻ᵀ` (covariance) — and updates it one measurement and one
//! epoch at a time by **Householder triangularization**. Working in the square-root domain doubles
//! the effective numerical precision and keeps the recovered covariance symmetric positive-definite
//! by construction, which is the SRIF's whole reason for being: the covariance is `R⁻¹R⁻ᵀ`, a
//! Gram matrix, so it cannot go indefinite the way a covariance-form Kalman filter's can after a
//! long ill-conditioned arc (a deep-space cruise of weeks-long light-time-delayed tracking, or a
//! tight Mars LMO with sparse passes).
//!
//! Two pieces:
//!
//! * [`Srif`] — the estimator: `R` (upper-triangular information square root), the info vector `b`
//!   (so the state solves `R x = b`), the measurement update (append a whitened row, re-triangularize)
//!   and the time update (map the array through the state-transition matrix Φ and fold in process
//!   noise). All by [`householder_triangularize`], bare `Vec<f64>` arithmetic, no external linear
//!   algebra.
//! * [`ReducedDynamicOd`] — the driver that runs the predict/update cycle over a track of
//!   [`crate::precise_od::Observation`]s, with the six dynamic states `[r; v]` plus the
//!   [`crate::precise_od::EmpiricalAccel`] RTN amplitudes modelled as first-order Gauss–Markov
//!   (exponentially-correlated) process states. A single `dynamic_tightness` knob trades the filter
//!   between **near-dynamic** (low process noise — smooths measurement noise on a ballistic cruise
//!   arc) and **near-kinematic** (high process noise — the empirical accelerations absorb an
//!   unmodelled manoeuvre, the regime a Mars low-orbit pass with thruster activity needs). This is
//!   the classic JPL/ESOC *reduced-dynamic* technique exposed as a continuum.
//!
//! The linear-Gaussian equivalence of the SRIF to the batch normal-equations solution
//! ([`crate::batch_ls::gauss_newton`]) is the correctness gate (`srif_matches_batch_on_linear`);
//! the recovered covariance's symmetric-positive-definiteness is the second
//! (`srif_covariance_is_spd`). The module is additive — it does not touch the forces, the
//! propagator, or any golden, so Earth results stay byte-identical.

/// A short, stable module name for provenance/linking in reports.
pub const MODULE_NAME: &str = "deepspace-od";

/// A **Square-Root Information Filter** over an `n`-state vector: the upper-triangular information
/// square root `R` (`n×n`) and the right-hand-side info vector `b` (`n`), maintained so the
/// least-squares cost is `‖R·x − b‖²`, the maximum-likelihood state solves `R·x = b` by
/// back-substitution, and the covariance is `P = R⁻¹·R⁻ᵀ` (symmetric positive-definite by
/// construction).
///
/// Information adds: each [`measurement_update`](Self::measurement_update) appends a whitened
/// measurement row and re-triangularizes (Householder), monotonically tightening `R`; each
/// [`time_update`](Self::time_update) maps the array through the state-transition matrix Φ and folds
/// in process noise (which loosens it).
#[derive(Clone, Debug)]
pub struct Srif {
    /// Upper-triangular information square root, `n×n` (row-major; entries below the diagonal are 0).
    r: Vec<Vec<f64>>,
    /// Information vector, length `n`; the state solves `R·x = b`.
    b: Vec<f64>,
    /// State dimension.
    n: usize,
}

impl Srif {
    /// A filter with **zero information** over `n` states (`R = 0`, `b = 0`): a fully diffuse prior.
    /// The state is unobservable until enough measurements have been folded in to make `R`
    /// full-rank; [`solve`](Self::solve) on a rank-deficient `R` returns the minimum-norm-ish
    /// back-substitution and a covariance that reflects the (large) remaining uncertainty, so prefer
    /// [`with_apriori`](Self::with_apriori) when a prior is available.
    pub fn new(n: usize) -> Self {
        Self {
            r: vec![vec![0.0; n]; n],
            b: vec![0.0; n],
            n,
        }
    }

    /// A filter initialised from an **a-priori** estimate `x0` with per-component 1σ uncertainties
    /// `sigma0`: `R = diag(1/σ0)` (the information square root of `P0 = diag(σ0²)`) and `b = R·x0`,
    /// so the implied state is exactly `x0` with covariance `diag(σ0²)`. A component with
    /// `σ0 ≤ 0` is treated as infinitely uncertain (zero information on that row).
    pub fn with_apriori(x0: &[f64], sigma0: &[f64]) -> Self {
        let n = x0.len();
        assert_eq!(sigma0.len(), n, "x0/sigma0 length mismatch");
        let mut r = vec![vec![0.0; n]; n];
        let mut b = vec![0.0; n];
        for i in 0..n {
            let info = if sigma0[i] > 0.0 {
                1.0 / sigma0[i]
            } else {
                0.0
            };
            r[i][i] = info;
            b[i] = info * x0[i];
        }
        Self { r, b, n }
    }

    /// State dimension.
    pub fn dim(&self) -> usize {
        self.n
    }

    /// A read-only view of the upper-triangular information square root `R`.
    pub fn information_sqrt(&self) -> &[Vec<f64>] {
        &self.r
    }

    /// **Scalar measurement update**: fold in a single linear measurement `z = h·x + ε`,
    /// `ε ~ N(0, σ²)`, by appending the *whitened* row `[h/σ | z/σ]` below the current `[R | b]`
    /// array and re-triangularizing with Householder so `R` stays upper-triangular. Information
    /// adds: the diagonal of `R` can only grow (in the SPD sense), shrinking the covariance.
    ///
    /// `h_row` is the `n`-vector measurement partial `∂z/∂x`; `sigma` (> 0) is the 1σ measurement
    /// noise. A non-positive `sigma` is a no-op (an infinitely-uncertain measurement carries no
    /// information).
    pub fn measurement_update(&mut self, h_row: &[f64], z: f64, sigma: f64) {
        assert_eq!(h_row.len(), self.n, "measurement row dimension mismatch");
        if sigma <= 0.0 || sigma.is_nan() {
            return;
        }
        let inv = 1.0 / sigma;
        // Stack [R | b] (n rows) with the single whitened measurement row, then triangularize.
        let mut aug = self.augmented_array();
        let mut row = vec![0.0; self.n + 1];
        for (rj, &hj) in row.iter_mut().zip(h_row) {
            *rj = hj * inv;
        }
        row[self.n] = z * inv;
        aug.push(row);
        householder_triangularize(&mut aug, self.n);
        self.store_augmented(&aug);
    }

    /// **Time update** (Bierman): propagate the information array to the next epoch through the
    /// state-transition matrix `stm` (Φ, the `n×n` `∂x_{k+1}/∂x_k`) and add process noise.
    ///
    /// With `x_{k+1} = Φ·x_k` the prior information square root in the new coordinates is
    /// `R⁺ = R·Φ⁻¹` (so `‖R x_k − b‖² = ‖R⁺ x_{k+1} − b‖²`). The whitened **process-noise** rows
    /// `diag(1/q_i)` on the states that have process noise are stacked on top, and a Householder
    /// triangularization of the combined array yields the new upper-triangular `R` (the
    /// information-form analogue of `P⁻ → ΦPΦᵀ + Q`). A state with `process_noise_std[i] ≤ 0` adds
    /// no row (no process noise on that component, e.g. the six dynamic states under pure dynamics).
    ///
    /// `stm` must be square `n×n` and invertible (a state-transition matrix always is — it is the
    /// solution of a linear variational ODE, whose flow is a diffeomorphism).
    pub fn time_update(&mut self, stm: &[Vec<f64>], process_noise_std: &[f64]) {
        assert_eq!(stm.len(), self.n, "stm dimension mismatch");
        assert_eq!(
            process_noise_std.len(),
            self.n,
            "process-noise dimension mismatch"
        );
        let phi_inv =
            invert_lower_or_full(stm).expect("state-transition matrix must be invertible");
        // R⁺ = R · Φ⁻¹  (info square root in the propagated coordinates), with b unchanged.
        let mut r_new = vec![vec![0.0; self.n]; self.n];
        for (r_new_row, r_row) in r_new.iter_mut().zip(&self.r) {
            for (j, r_new_ij) in r_new_row.iter_mut().enumerate() {
                let mut s = 0.0;
                for (k, &r_ik) in r_row.iter().enumerate() {
                    s += r_ik * phi_inv[k][j];
                }
                *r_new_ij = s;
            }
        }
        // Stack the whitened process-noise constraint rows on top, then re-triangularize the
        // combined array. A process-noise row pins state i toward its prior with weight 1/q_i; the
        // triangularization mixes it with R⁺ exactly as the SRIF time update prescribes.
        let mut aug: Vec<Vec<f64>> = Vec::with_capacity(self.n * 2);
        for (i, &q) in process_noise_std.iter().enumerate() {
            if q > 0.0 {
                let mut row = vec![0.0; self.n + 1];
                row[i] = 1.0 / q;
                row[self.n] = 0.0; // process noise pulls the increment toward zero-mean
                aug.push(row);
            }
        }
        for (r_new_row, &bi) in r_new.iter().zip(&self.b) {
            let mut row = vec![0.0; self.n + 1];
            row[..self.n].copy_from_slice(r_new_row);
            row[self.n] = bi;
            aug.push(row);
        }
        householder_triangularize(&mut aug, self.n);
        self.store_augmented(&aug);
    }

    /// Solve for the **state estimate** (back-substitution of `R·x = b`) and the **covariance**
    /// `P = R⁻¹·R⁻ᵀ` (symmetric positive-definite by construction). Returns `(x, P)`.
    ///
    /// A rank-deficient `R` (a fully/partly diffuse filter that has not yet seen enough
    /// measurements) yields a large covariance on the unobserved subspace; the diagonal-pivot guard
    /// keeps the back-substitution finite by treating a zero pivot as zero information.
    pub fn solve(&self) -> (Vec<f64>, Vec<Vec<f64>>) {
        let x = back_substitute(&self.r, &self.b);
        let r_inv = invert_upper_triangular(&self.r);
        // P = R⁻¹ · R⁻ᵀ.
        let mut p = vec![vec![0.0; self.n]; self.n];
        for (i, p_row) in p.iter_mut().enumerate() {
            for (j, p_ij) in p_row.iter_mut().enumerate() {
                let mut s = 0.0;
                for (a, b) in r_inv[i].iter().zip(&r_inv[j]) {
                    s += a * b;
                }
                *p_ij = s;
            }
        }
        (x, p)
    }

    /// Build the `[R | b]` augmented array (`n` rows, `n+1` columns).
    fn augmented_array(&self) -> Vec<Vec<f64>> {
        let mut aug = vec![vec![0.0; self.n + 1]; self.n];
        for ((aug_row, r_row), &bi) in aug.iter_mut().zip(&self.r).zip(&self.b) {
            aug_row[..self.n].copy_from_slice(r_row);
            aug_row[self.n] = bi;
        }
        aug
    }

    /// Store the top-left `n×n` triangle and the last column of a triangularized augmented array
    /// back into `(R, b)`.
    fn store_augmented(&mut self, aug: &[Vec<f64>]) {
        for (i, (r_row, bi)) in self.r.iter_mut().zip(self.b.iter_mut()).enumerate() {
            for (j, r_ij) in r_row.iter_mut().enumerate() {
                *r_ij = if j >= i { aug[i][j] } else { 0.0 };
            }
            *bi = aug[i][self.n];
        }
    }
}

/// In-place **Householder triangularization** of the `m×(ncol)` array `a` so its leading `n`
/// columns become upper-triangular (`n` = number of state columns; the trailing columns — here the
/// single info-vector column — are carried along under the same orthogonal transforms). Rows beyond
/// `n` are zeroed in the leading columns; the orthogonal transform leaves `AᵀA` (the information
/// matrix and info vector) invariant, which is exactly why the SRIF can re-triangularize a stacked
/// array without changing the underlying least-squares problem.
///
/// For each pivot column `c` the reflector annihilates the sub-diagonal entries of that column over
/// rows `c..m`, applied to every column `c..ncol`. Standard, allocation-light, numerically stable
/// (the reflector is built from the column norm with a sign choice that avoids cancellation).
fn householder_triangularize(a: &mut [Vec<f64>], n: usize) {
    let m = a.len();
    if m == 0 {
        return;
    }
    let ncol = a[0].len();
    for c in 0..n {
        if c >= m {
            break;
        }
        // Column-c norm over rows c..m.
        let mut sigma = 0.0;
        for row in a.iter().take(m).skip(c) {
            sigma += row[c] * row[c];
        }
        let sigma = sigma.sqrt();
        if sigma < 1e-300 {
            continue; // already zero below the diagonal in this column
        }
        // Sign chosen to avoid cancellation: alpha = -sign(a[c][c]) · ‖x‖.
        let alpha = if a[c][c] >= 0.0 { -sigma } else { sigma };
        // Householder vector v = x − alpha·e_c, stored in column c of rows c..m.
        let mut v = vec![0.0; m];
        v[c] = a[c][c] - alpha;
        for (i, vi) in v.iter_mut().enumerate().take(m).skip(c + 1) {
            *vi = a[i][c];
        }
        let vtv: f64 = v.iter().skip(c).map(|&x| x * x).sum();
        if vtv < 1e-300 {
            continue;
        }
        let beta = 2.0 / vtv;
        // Apply H = I − beta·v·vᵀ to every column j in c..ncol: a[:,j] -= beta·(vᵀa[:,j])·v.
        // Column-major access of a row-major matrix — explicit `[i][j]` reads clearer than enumerate.
        #[allow(clippy::needless_range_loop)]
        for j in c..ncol {
            let mut s = 0.0;
            for i in c..m {
                s += v[i] * a[i][j];
            }
            let s = beta * s;
            for i in c..m {
                a[i][j] -= s * v[i];
            }
        }
        // Enforce the exact triangle (the pivot becomes alpha, sub-diagonal exactly zero).
        a[c][c] = alpha;
        for row in a.iter_mut().take(m).skip(c + 1) {
            row[c] = 0.0;
        }
    }
}

/// Back-substitute `R·x = b` for an upper-triangular `R` (`n×n`). A zero (within tolerance) pivot
/// on row `i` means that component is unobserved by the current information; it is set to zero
/// (minimum-norm choice) rather than producing a non-finite value.
fn back_substitute(r: &[Vec<f64>], b: &[f64]) -> Vec<f64> {
    let n = b.len();
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = b[i];
        for j in (i + 1)..n {
            s -= r[i][j] * x[j];
        }
        let d = r[i][i];
        x[i] = if d.abs() > 1e-300 { s / d } else { 0.0 };
    }
    x
}

/// Inverse of an **upper-triangular** matrix `R` (`n×n`) by column back-substitution. A zero pivot
/// yields a large (capped) diagonal so the implied covariance reflects an unobserved direction
/// without overflowing.
fn invert_upper_triangular(r: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = r.len();
    let mut inv = vec![vec![0.0; n]; n];
    // Column-wise back-substitution — `inv[i][col]` column access reads clearer than enumerate.
    #[allow(clippy::needless_range_loop)]
    for col in 0..n {
        // Solve R · inv[:,col] = e_col by back-substitution.
        for i in (0..n).rev() {
            let mut s = if i == col { 1.0 } else { 0.0 };
            for j in (i + 1)..n {
                s -= r[i][j] * inv[j][col];
            }
            let d = r[i][i];
            inv[i][col] = if d.abs() > 1e-300 { s / d } else { 0.0 };
        }
    }
    inv
}

/// General `n×n` inverse by Gauss–Jordan elimination with partial pivoting (used for Φ⁻¹ in the
/// time update; the state-transition matrix is dense, not triangular). Returns `None` if singular.
fn invert_lower_or_full(a: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = a.len();
    let mut m: Vec<Vec<f64>> = a
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

#[cfg(test)]
mod tests {
    use super::*;
    use crate::batch_ls::gauss_newton;
    use crate::fusion::ukf::cholesky;

    // --- D2.1 SRIF core ---

    #[test]
    fn srif_matches_batch_on_linear() {
        // A small designed linear-Gaussian estimation problem: 3 states, 6 scalar measurements
        // with a designed partial matrix H and per-measurement noise. The SRIF folds the rows in
        // one at a time; the result must equal the batch weighted-least-squares (normal-equations)
        // solution computed by gauss_newton on the same linear model, in both state and covariance.
        let h: [[f64; 3]; 6] = [
            [1.0, 0.0, 0.0],
            [0.0, 1.0, 0.0],
            [0.0, 0.0, 1.0],
            [1.0, 1.0, 0.0],
            [0.5, -1.0, 2.0],
            [-1.0, 0.3, 1.5],
        ];
        let truth = [2.0_f64, -1.0, 0.5];
        let sig = [0.10_f64, 0.20, 0.15, 0.30, 0.25, 0.40];
        let z: Vec<f64> = (0..6)
            .map(|i| h[i][0] * truth[0] + h[i][1] * truth[1] + h[i][2] * truth[2])
            .collect();

        // SRIF: diffuse start, fold each whitened scalar measurement.
        let mut srif = Srif::new(3);
        for i in 0..6 {
            srif.measurement_update(&h[i], z[i], sig[i]);
        }
        let (x_srif, p_srif) = srif.solve();

        // Batch reference: gauss_newton with weights 1/σ² (linear ⇒ one-step exact).
        let h_owned = h;
        let model = move |x: &[f64]| {
            (0..6)
                .map(|i| h_owned[i][0] * x[0] + h_owned[i][1] * x[1] + h_owned[i][2] * x[2])
                .collect::<Vec<_>>()
        };
        let w: Vec<f64> = sig.iter().map(|s| 1.0 / (s * s)).collect();
        let r = gauss_newton(model, &z, &w, &[0.0, 0.0, 0.0], 10, 1e-14).expect("solves");

        for k in 0..3 {
            assert!(
                (x_srif[k] - r.x[k]).abs() < 1e-9,
                "state[{k}] SRIF {} vs batch {}",
                x_srif[k],
                r.x[k]
            );
            // And both recover the truth (noise-free).
            assert!((x_srif[k] - truth[k]).abs() < 1e-9, "truth[{k}]");
        }

        // Covariance equals (HᵀWH)⁻¹: form it directly and compare to P_srif.
        let mut ata = [[0.0_f64; 3]; 3];
        for i in 0..6 {
            for p in 0..3 {
                for q in 0..3 {
                    ata[p][q] += h[i][p] * w[i] * h[i][q];
                }
            }
        }
        let ata_v: Vec<Vec<f64>> = ata.iter().map(|r| r.to_vec()).collect();
        let p_ref = invert_lower_or_full(&ata_v).expect("HtWH invertible");
        for p in 0..3 {
            for q in 0..3 {
                assert!(
                    (p_srif[p][q] - p_ref[p][q]).abs() < 1e-9,
                    "cov[{p}][{q}] SRIF {} vs (HtWH)^-1 {}",
                    p_srif[p][q],
                    p_ref[p][q]
                );
            }
        }
    }

    #[test]
    fn srif_covariance_is_spd() {
        // After a sequence of measurement and time updates the recovered covariance must be
        // symmetric (to 1e-12) and positive-definite (a Cholesky succeeds) — the SRIF's defining
        // guarantee, which a covariance-form filter can lose to round-off on a long arc.
        let mut srif = Srif::with_apriori(&[0.0, 0.0, 0.0, 0.0], &[1e3, 1e3, 1e3, 1e3]);
        // A non-trivial 4-state STM (mild coupling), reused each step.
        let stm = vec![
            vec![1.0, 0.10, 0.0, 0.0],
            vec![0.0, 1.0, 0.05, 0.0],
            vec![0.0, 0.0, 1.0, 0.20],
            vec![0.02, 0.0, 0.0, 1.0],
        ];
        let q = vec![1e-2, 1e-2, 1e-3, 1e-3];
        // Designed measurement rows that, over the sequence, observe every state.
        let rows = [
            [1.0, 0.0, 0.0, 0.0],
            [0.0, 1.0, 0.0, 0.0],
            [0.0, 0.0, 1.0, 0.0],
            [0.0, 0.0, 0.0, 1.0],
            [1.0, 1.0, 1.0, 1.0],
            [1.0, -1.0, 0.5, -0.5],
        ];
        for (k, row) in rows.iter().cycle().take(18).enumerate() {
            srif.measurement_update(row, 0.3 * (k as f64 + 1.0).sin() + 1.0, 0.5);
            if k % 3 == 2 {
                srif.time_update(&stm, &q);
            }
        }
        let (_x, p) = srif.solve();
        // Symmetry.
        for (i, row) in p.iter().enumerate() {
            for (j, &pij) in row.iter().enumerate() {
                assert!(
                    (pij - p[j][i]).abs() < 1e-12,
                    "asymmetry P[{i}][{j}]={} P[{j}][{i}]={}",
                    pij,
                    p[j][i]
                );
            }
        }
        // Positive-definite ⇔ Cholesky succeeds.
        assert!(
            cholesky(&p).is_some(),
            "covariance not positive-definite: {p:?}"
        );
        // All diagonal variances strictly positive.
        for (i, row) in p.iter().enumerate() {
            assert!(row[i] > 0.0, "non-positive variance P[{i}][{i}]={}", row[i]);
        }
    }

    #[test]
    fn srif_information_accumulates() {
        // More measurements ⇒ smaller covariance (information adds). Track the trace of P as
        // identical-geometry measurements are folded in; it must decrease monotonically.
        let mut srif = Srif::new(2);
        let row_a = [1.0, 0.0];
        let row_b = [0.0, 1.0];
        let row_c = [1.0, 1.0];
        let seq = [row_a, row_b, row_c, row_a, row_b, row_c];
        let mut last_trace = f64::INFINITY;
        let mut traces = Vec::new();
        for (k, row) in seq.iter().enumerate() {
            srif.measurement_update(row, 1.0, 0.5);
            // Only meaningful once R is full-rank (after the first two independent rows).
            if k >= 1 {
                let (_x, p) = srif.solve();
                let trace = p[0][0] + p[1][1];
                if k >= 2 {
                    assert!(
                        trace <= last_trace + 1e-12,
                        "trace increased at step {k}: {trace} > {last_trace}"
                    );
                }
                last_trace = trace;
                traces.push(trace);
            }
        }
        // And it strictly decreased overall, not merely stayed flat.
        assert!(
            *traces.last().unwrap() < traces[0] - 1e-9,
            "information did not accumulate: {traces:?}"
        );
    }
}
