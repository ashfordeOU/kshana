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

use crate::integrator::Tolerance;
use crate::precise_od::{EmpiricalAccel, ForceModel, Observation};

type Vec3 = [f64; 3];

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

    /// **Recenter** an error-state filter: zero the information vector `b` (so the implied state
    /// estimate is exactly zero) while keeping the information square root `R` (the covariance is
    /// unchanged). Used by [`ReducedDynamicOd`], which carries the nonlinear reference trajectory
    /// outside the SRIF and lets the SRIF estimate only the deviation `δx` about it: after each
    /// epoch's increment is folded into the reference, the deviation estimate is zero again, but the
    /// accumulated information (covariance) must persist.
    pub fn recenter(&mut self) {
        for bi in self.b.iter_mut() {
            *bi = 0.0;
        }
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

    /// **Time update** (Bierman square-root information time update; Bierman 1977, §V): propagate the
    /// information array to the next epoch through the state-transition matrix `stm` (Φ, the `n×n`
    /// `∂x_{k+1}/∂x_k`) and fold in additive process noise `w ~ N(0, Q)`, `Q = diag(σ²)`.
    ///
    /// With `x_{k+1} = Φ·x_k + w` the prior information square root in the propagated coordinates is
    /// `R⁺ = R·Φ⁻¹` (so the deterministic part satisfies `‖R x_k − b‖² = ‖R⁺ x_{k+1} − b‖²`).
    /// Process noise **removes** information (the covariance grows), which the SRIF achieves not by
    /// adding a constraint row on the state but by **augmenting with the noise variables and
    /// marginalizing them out**: stack
    ///
    /// ```text
    ///   [ R_w        0    | 0 ]     (R_w = diag(1/σ_w): the process-noise a-priori info, on w)
    ///   [ -R⁺·Γ      R⁺   | b ]     (Γ maps each noise w_j additively into its state)
    /// ```
    ///
    /// and Householder-triangularize over the `(p + n)` columns `[w | x]`. The lower-right `n×n`
    /// block and its right-hand side are the new state information square root `R` and vector `b`
    /// with the noise integrated out — the information-form analogue of `P⁻ → Φ P Φᵀ + Q`. A state
    /// with `process_noise_std[i] ≤ 0` carries no noise variable (e.g. the six dynamic states under
    /// pure deterministic dynamics).
    ///
    /// `stm` must be square `n×n` and invertible (a state-transition matrix always is — it is the
    /// flow of a linear variational ODE).
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

        // Indices of the states that carry process noise (one noise variable each).
        let noise_idx: Vec<usize> = process_noise_std
            .iter()
            .enumerate()
            .filter_map(|(i, &q)| (q > 0.0).then_some(i))
            .collect();
        let p = noise_idx.len();
        if p == 0 {
            // No process noise: the time update is the pure coordinate change R ← R⁺ (still upper
            // triangular only after re-triangularization, since R⁺ = R Φ⁻¹ is generally full).
            let mut aug: Vec<Vec<f64>> = Vec::with_capacity(self.n);
            for (r_new_row, &bi) in r_new.iter().zip(&self.b) {
                let mut row = vec![0.0; self.n + 1];
                row[..self.n].copy_from_slice(r_new_row);
                row[self.n] = bi;
                aug.push(row);
            }
            householder_triangularize(&mut aug, self.n);
            self.store_augmented(&aug);
            return;
        }

        // Augmented array over columns [ w(p) | x(n) | rhs ], rows = p (noise) + n (state).
        let ncol = p + self.n + 1;
        let mut aug = vec![vec![0.0; ncol]; p + self.n];
        // Noise rows: R_w = diag(1/σ_w) on the w-block, zero elsewhere.
        for (j, &idx) in noise_idx.iter().enumerate() {
            aug[j][j] = 1.0 / process_noise_std[idx];
        }
        // State rows: [ -R⁺·Γ | R⁺ | b ]; column j of the w-block is -R⁺[:, noise_idx[j]].
        for (ri, (r_new_row, &bi)) in r_new.iter().zip(&self.b).enumerate() {
            let row = &mut aug[p + ri];
            for (j, &idx) in noise_idx.iter().enumerate() {
                row[j] = -r_new_row[idx];
            }
            row[p..p + self.n].copy_from_slice(r_new_row);
            row[p + self.n] = bi;
        }
        // Triangularize over all (p + n) leading columns; the noise columns are eliminated first,
        // so the lower-right n×n block + rhs is the noise-marginalized new state array.
        householder_triangularize(&mut aug, p + self.n);
        for (i, (r_row, bi)) in self.r.iter_mut().zip(self.b.iter_mut()).enumerate() {
            for (j, r_ij) in r_row.iter_mut().enumerate() {
                // The new state block sits in rows [p .. p+n) and columns [p .. p+n).
                *r_ij = if j >= i { aug[p + i][p + j] } else { 0.0 };
            }
            *bi = aug[p + i][p + self.n];
        }
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

// ===========================================================================================
// D2.2 — Reduced-dynamic empirical-acceleration sequential OD.
// ===========================================================================================

/// The nine-state reduced-dynamic estimation vector: `[r(3); v(3); a_emp(3)]`, where `a_emp` are
/// the **constant RTN empirical accelerations** (`[a_R, a_T, a_N]`, m/s²) modelled as first-order
/// Gauss–Markov process states. (The once-/twice-per-rev amplitudes of
/// [`crate::precise_od::EmpiricalAccel`] are left at zero here; the sequential filter rides the
/// constant tier, which is what a per-epoch reduced-dynamic estimate needs.)
const N_STATE: usize = 9;

/// Configuration for a [`ReducedDynamicOd`] run — the reduced-dynamic *tuning* exposed as a
/// continuum and the a-priori uncertainties.
#[derive(Clone, Copy, Debug)]
pub struct ReducedDynamicConfig {
    /// The **reduced-dynamic tightness** in `[0, 1]`: the knob that trades the filter between the
    /// dynamic and the kinematic regime.
    ///
    /// * `dynamic_tightness → 0` — **near-dynamic**: almost no process noise on the empirical
    ///   accelerations, so they stay near their a-priori zero and the trajectory is held to the
    ///   force model. This *smooths* measurement noise on a ballistic arc (deep-space cruise).
    /// * `dynamic_tightness → 1` — **near-kinematic**: large process noise lets the empirical
    ///   accelerations move freely epoch-to-epoch, *absorbing* an unmodelled acceleration (a Mars
    ///   low-orbit pass with thruster activity or a mismodelled drag/SRP regime).
    ///
    /// The process-noise 1σ on each empirical state per second is
    /// `emp_process_sigma_max · dynamic_tightness`, so the behaviour sweeps monotonically.
    pub dynamic_tightness: f64,
    /// Correlation time τ (s) of the first-order Gauss–Markov empirical states: the e-folding time
    /// over which an empirical acceleration decays toward zero between updates (the dynamics-block
    /// `exp(-Δt/τ)`). A long τ ⇒ slowly-varying (cruise); a short τ ⇒ rapidly-varying (manoeuvring).
    pub emp_correlation_time: f64,
    /// The maximum empirical-acceleration process-noise 1σ (m/s² per √s) reached at
    /// `dynamic_tightness = 1`. Scaled by `dynamic_tightness` for the actual per-step noise.
    pub emp_process_sigma_max: f64,
    /// A-priori 1σ on the epoch position (m).
    pub sigma_pos: f64,
    /// A-priori 1σ on the epoch velocity (m/s).
    pub sigma_vel: f64,
    /// A-priori 1σ on each empirical-acceleration state (m/s²).
    pub sigma_emp: f64,
    /// Integration tolerance for the segment propagations.
    pub tol: Tolerance,
}

impl Default for ReducedDynamicConfig {
    fn default() -> Self {
        Self {
            dynamic_tightness: 0.5,
            emp_correlation_time: 1.0e3,
            emp_process_sigma_max: 1.0e-6,
            sigma_pos: 1.0e3,
            sigma_vel: 1.0e0,
            sigma_emp: 1.0e-6,
            tol: Tolerance {
                rtol: 1e-11,
                atol: 1e-9,
                ..Tolerance::default()
            },
        }
    }
}

/// The per-observation record of a reduced-dynamic run.
#[derive(Clone, Copy, Debug)]
pub struct FilterStep {
    /// Seconds past the epoch.
    pub t: f64,
    /// Estimated inertial position after the update (m).
    pub r: Vec3,
    /// Estimated inertial velocity after the update (m/s).
    pub v: Vec3,
    /// Estimated constant RTN empirical acceleration after the update (`[a_R, a_T, a_N]`, m/s²).
    pub emp: Vec3,
    /// Pre-update 3-D position residual (observed − predicted), m — the filter innovation.
    pub innovation_3d: f64,
    /// Post-update 3-D position residual (observed − re-evaluated estimate), m.
    pub residual_3d: f64,
}

/// The outcome of a [`ReducedDynamicOd::run`].
#[derive(Clone, Debug)]
pub struct ReducedDynamicReport {
    /// Per-observation steps in time order.
    pub steps: Vec<FilterStep>,
    /// RMS of the pre-update innovations (m) — how far the propagated estimate sat from each fix.
    pub innovation_rms: f64,
    /// RMS of the post-update residuals (m).
    pub residual_rms: f64,
    /// The final estimated state `[r; v; a_emp]`.
    pub final_state: [f64; N_STATE],
    /// The final covariance (`N_STATE × N_STATE`, symmetric positive-definite).
    pub final_cov: Vec<Vec<f64>>,
}

/// **Reduced-dynamic sequential OD driver**: runs the SRIF predict/update cycle over a track of
/// inertial position [`Observation`]s under the force model `fm`, carrying the six dynamic states
/// `[r; v]` plus three first-order Gauss–Markov empirical-acceleration states `[a_R, a_T, a_N]`.
///
/// Between epochs the dynamic block is propagated by [`crate::precise_od::propagate_with_stm`]
/// (with the current empirical estimate baked into the force model), the empirical→state coupling
/// is captured by finite-difference partials, and the empirical block decays as a Gauss–Markov
/// process. The single [`ReducedDynamicConfig::dynamic_tightness`] knob sets the empirical
/// process-noise level, sweeping the filter from near-dynamic (smooths noise) to near-kinematic
/// (tracks manoeuvres) — the JPL/ESOC reduced-dynamic technique exposed as a continuum.
#[derive(Clone, Debug)]
pub struct ReducedDynamicOd<F: ForceModel> {
    /// The dynamics template (its empirical tier is overwritten per segment by the filter estimate).
    fm: F,
    /// The tuning + a-priori configuration.
    cfg: ReducedDynamicConfig,
}

impl<F: ForceModel> ReducedDynamicOd<F> {
    /// A driver over the force-model template `fm` with configuration `cfg`.
    pub fn new(fm: F, cfg: ReducedDynamicConfig) -> Self {
        Self { fm, cfg }
    }

    /// Build the force model for a segment with the constant RTN empirical accelerations `emp`
    /// `[a_R, a_T, a_N]` baked in (the once-/twice-per-rev tiers stay zero).
    fn fm_with_emp(&self, emp: Vec3) -> F {
        let mut fm = self.fm.clone();
        fm.set_empirical(Some(EmpiricalAccel {
            radial: [emp[0], 0.0, 0.0],
            transverse: [emp[1], 0.0, 0.0],
            normal: [emp[2], 0.0, 0.0],
            ..EmpiricalAccel::default()
        }));
        fm
    }

    /// The propagated dynamic state at `t + dt` for state `(r, v)` and constant empirical `emp`.
    fn propagate_segment(&self, r: Vec3, v: Vec3, emp: Vec3, dt: f64) -> (Vec3, Vec3) {
        let fm = self.fm_with_emp(emp);
        crate::precise_od::propagate(&fm, r, v, dt, &self.cfg.tol)
    }

    /// The `N_STATE × N_STATE` segment state-transition matrix from epoch `t` (state `[r; v; emp]`)
    /// across `dt` seconds. Blocks:
    /// * top-left 6×6 — the dynamics STM from [`crate::precise_od::propagate_with_stm`];
    /// * top-right 6×3 — `∂[r;v](t+dt)/∂emp`, finite-difference (the empirical force is linear in
    ///   its amplitudes, so a central difference is exact to rounding);
    /// * bottom-right 3×3 — `diag(exp(-dt/τ))` (Gauss–Markov decay);
    /// * bottom-left 3×6 — zero (the empirical states do not depend on `r, v`).
    fn segment_stm(&self, r: Vec3, v: Vec3, emp: Vec3, dt: f64) -> Vec<Vec<f64>> {
        let mut phi = vec![vec![0.0; N_STATE]; N_STATE];
        // Dynamics STM (6×6).
        let fm = self.fm_with_emp(emp);
        let (_rf, _vf, phi6) = crate::precise_od::propagate_with_stm(&fm, r, v, dt, &self.cfg.tol);
        for (i, row) in phi6.iter().enumerate() {
            phi[i][..6].copy_from_slice(row);
        }
        // Empirical → state cross-block (6×3) by central finite difference on each amplitude.
        let damp = 1.0e-9;
        for k in 0..3 {
            let (mut ep, mut em) = (emp, emp);
            ep[k] += damp;
            em[k] -= damp;
            let (rp, vp) = self.propagate_segment(r, v, ep, dt);
            let (rm, vm) = self.propagate_segment(r, v, em, dt);
            for i in 0..3 {
                phi[i][6 + k] = (rp[i] - rm[i]) / (2.0 * damp);
                phi[3 + i][6 + k] = (vp[i] - vm[i]) / (2.0 * damp);
            }
        }
        // Gauss–Markov decay block (3×3).
        let decay = if self.cfg.emp_correlation_time > 0.0 {
            (-dt / self.cfg.emp_correlation_time).exp()
        } else {
            0.0
        };
        for k in 0..3 {
            phi[6 + k][6 + k] = decay;
        }
        phi
    }

    /// Run the filter over `obs` (any time order; sorted internally). The state is initialised from
    /// `r0, v0` (and zero empirical acceleration) with the a-priori uncertainties in the config.
    /// Returns the per-step record, the innovation/residual RMS, and the final state + covariance.
    /// Returns `None` if fewer than two observations are supplied.
    pub fn run(&self, r0: Vec3, v0: Vec3, obs: &[Observation]) -> Option<ReducedDynamicReport> {
        if obs.len() < 2 {
            return None;
        }
        let mut ord: Vec<usize> = (0..obs.len()).collect();
        ord.sort_by(|&a, &b| {
            obs[a]
                .t
                .partial_cmp(&obs[b].t)
                .unwrap_or(std::cmp::Ordering::Equal)
        });
        let obs: Vec<Observation> = ord.iter().map(|&i| obs[i]).collect();

        // A-priori SRIF over [r; v; emp].
        let sigma0 = [
            self.cfg.sigma_pos,
            self.cfg.sigma_pos,
            self.cfg.sigma_pos,
            self.cfg.sigma_vel,
            self.cfg.sigma_vel,
            self.cfg.sigma_vel,
            self.cfg.sigma_emp,
            self.cfg.sigma_emp,
            self.cfg.sigma_emp,
        ];
        let x0 = [r0[0], r0[1], r0[2], v0[0], v0[1], v0[2], 0.0, 0.0, 0.0];
        // Error-state SRIF: the information square root carries the a-priori uncertainty, but the
        // *deviation* estimate is a-priori zero (the reference holds the absolute state). Hence the
        // SRIF is seeded with a zero a-priori state vector — `with_apriori(&[0; n], &sigma0)`.
        let mut srif = Srif::with_apriori(&[0.0; N_STATE], &sigma0);

        // Current best estimate (drives the next segment's nonlinear propagation).
        let mut state = x0;
        let mut t_prev = 0.0;

        // Per-step empirical process-noise 1σ (per √s, scaled by the segment length below).
        let emp_q_rate = (self.cfg.emp_process_sigma_max * self.cfg.dynamic_tightness).max(0.0);

        let mut steps = Vec::with_capacity(obs.len());
        let mut sum_innov = 0.0;
        let mut sum_resid = 0.0;

        for ob in &obs {
            let dt = ob.t - t_prev;
            if dt > 0.0 {
                let r = [state[0], state[1], state[2]];
                let v = [state[3], state[4], state[5]];
                let emp = [state[6], state[7], state[8]];
                // Time update: STM + Gauss–Markov process noise (empirical states only).
                let phi = self.segment_stm(r, v, emp, dt);
                let q_emp = emp_q_rate * dt.sqrt();
                let q = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, q_emp, q_emp, q_emp];
                srif.time_update(&phi, &q);
                // Advance the reference state nonlinearly through the same segment.
                let (rf, vf) = self.propagate_segment(r, v, emp, dt);
                let decay = if self.cfg.emp_correlation_time > 0.0 {
                    (-dt / self.cfg.emp_correlation_time).exp()
                } else {
                    0.0
                };
                state = [
                    rf[0],
                    rf[1],
                    rf[2],
                    vf[0],
                    vf[1],
                    vf[2],
                    emp[0] * decay,
                    emp[1] * decay,
                    emp[2] * decay,
                ];
                t_prev = ob.t;
            }

            // Pre-update innovation: observed − predicted position.
            let pred = [state[0], state[1], state[2]];
            let innov = [
                ob.pos[0] - pred[0],
                ob.pos[1] - pred[1],
                ob.pos[2] - pred[2],
            ];
            let innov_3d = (innov[0] * innov[0] + innov[1] * innov[1] + innov[2] * innov[2]).sqrt();

            // Measurement update: three scalar position components against the *current-epoch*
            // state (position is the first three components). The SRIF carries the deviation about
            // the reference, so we feed it the residual relative to the current estimate and add the
            // resulting increment back. h_row picks each position component.
            for axis in 0..3 {
                let mut h_row = [0.0; N_STATE];
                h_row[axis] = 1.0;
                // Measurement of the *deviation* δx from the current reference: z = obs − pred.
                srif.measurement_update(&h_row, innov[axis], ob.sigma);
            }
            let (dx, _p) = srif.solve();
            // Apply the increment to the reference and reset the SRIF's right-hand side to zero
            // deviation about the new reference (keep the information square root R).
            for i in 0..N_STATE {
                state[i] += dx[i];
            }
            srif.recenter();

            // Post-update residual.
            let resid = [
                ob.pos[0] - state[0],
                ob.pos[1] - state[1],
                ob.pos[2] - state[2],
            ];
            let resid_3d = (resid[0] * resid[0] + resid[1] * resid[1] + resid[2] * resid[2]).sqrt();

            sum_innov += innov_3d * innov_3d;
            sum_resid += resid_3d * resid_3d;
            steps.push(FilterStep {
                t: ob.t,
                r: [state[0], state[1], state[2]],
                v: [state[3], state[4], state[5]],
                emp: [state[6], state[7], state[8]],
                innovation_3d: innov_3d,
                residual_3d: resid_3d,
            });
        }

        let n = steps.len().max(1) as f64;
        let (_x, final_cov) = srif.solve();
        Some(ReducedDynamicReport {
            innovation_rms: (sum_innov / n).sqrt(),
            residual_rms: (sum_resid / n).sqrt(),
            final_state: state,
            final_cov,
            steps,
        })
    }
}

// ===========================================================================================
// D2.5a — Radiometric (range / Doppler) measurement model for the SRIF.
//
// The position-`Observation` path above folds a direct inertial position fix into the filter
// (h_row picks a coordinate axis). A real deep-space pass does not measure position: it measures
// the *range* and *range-rate* (Doppler) of a tracking station↔spacecraft line of sight. This
// section adds the measurement partials `∂observable/∂state` that connect those radiometric
// observables to the SRIF's `[r; v; emp]` state, and a `radiometric_update` driver that folds a
// range/Doppler observation in through the same scalar `measurement_update`.
//
// Frame convention: the station position/velocity and the spacecraft state are in the **same
// inertial central-body frame** as the position-`Observation` path (areocentric for an LMO arc).
// The geometry is exact; the partials are the standard line-of-sight ones (Montenbruck & Gill
// §6.2, Tapley/Schutz/Born *Statistical Orbit Determination* §3). The clock-frequency partial for
// one-way Doppler couples the [`crate::clock_state::ClockState3`] fractional-frequency state in.
// ===========================================================================================

/// Which scalar radiometric observable a [`RadiometricMeas`] carries against the SRIF state.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RadiometricKind {
    /// **Range** (metres): the line-of-sight distance `ρ = |r_sc − r_sta|`. Partial
    /// `∂ρ/∂r = û` (the LOS unit vector), `∂ρ/∂v = 0`.
    Range,
    /// **Range rate / Doppler** (m/s): the line-of-sight closing rate
    /// `ρ̇ = û·(v_sc − v_sta)`. Partial `∂ρ̇/∂v = û`, `∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ`. (A Doppler
    /// frequency observable is `−(k/c)·ρ̇` for a carrier-scaled constant `k`; the SRIF ingests the
    /// range rate directly, the carrier scaling being a fixed multiplier the caller can apply to
    /// both the observable and its `sigma` without changing the geometry partial.)
    RangeRate,
}

/// A single scalar radiometric observation against the reduced-dynamic SRIF state: the kind
/// (range or range-rate), the **inertial** tracking-station position (and velocity, for range
/// rate) in the central-body frame, the observed value, and its 1σ.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct RadiometricMeas {
    /// Seconds past the estimation epoch (the same time base as [`Observation::t`]).
    pub t: f64,
    /// Range (m) or range-rate (m/s).
    pub kind: RadiometricKind,
    /// Inertial tracking-station position (m) in the central-body frame.
    pub station_pos: Vec3,
    /// Inertial tracking-station velocity (m/s); used only for [`RadiometricKind::RangeRate`].
    pub station_vel: Vec3,
    /// The observed value: metres for [`RadiometricKind::Range`], m/s for
    /// [`RadiometricKind::RangeRate`].
    pub value: f64,
    /// One-sigma measurement uncertainty, same unit as [`value`](Self::value).
    pub sigma: f64,
}

/// Predicted **range** `ρ = |r_sc − r_sta|` (m) and its `N_STATE`-row partial `∂ρ/∂state`.
///
/// `∂ρ/∂r = û = (r_sc − r_sta)/ρ` (the line-of-sight unit vector); `∂ρ/∂v = 0`; the empirical
/// states do not enter the instantaneous geometry, so their partial is zero. Returns
/// `(predicted, h_row)`.
pub fn range_observable(r_sc: Vec3, station_pos: Vec3) -> (f64, [f64; N_STATE]) {
    let d = [
        r_sc[0] - station_pos[0],
        r_sc[1] - station_pos[1],
        r_sc[2] - station_pos[2],
    ];
    let rho = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    let mut h = [0.0; N_STATE];
    if rho > 0.0 {
        for k in 0..3 {
            h[k] = d[k] / rho; // ∂ρ/∂r = û
        }
    }
    (rho, h)
}

/// Predicted **range rate** `ρ̇ = û·(v_sc − v_sta)` (m/s) and its `N_STATE`-row partial
/// `∂ρ̇/∂state`.
///
/// With `û = (r_sc − r_sta)/ρ` and `v_rel = v_sc − v_sta`:
/// * `∂ρ̇/∂v = û` (a change in velocity along the LOS changes the closing rate directly);
/// * `∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ` (rotating the LOS reprojects the relative velocity — the standard
///   range-rate position partial, the transverse component of `v_rel` divided by `ρ`);
/// * the empirical states do not enter the instantaneous geometry (zero partial).
///
/// Returns `(predicted, h_row)`.
pub fn range_rate_observable(
    r_sc: Vec3,
    v_sc: Vec3,
    station_pos: Vec3,
    station_vel: Vec3,
) -> (f64, [f64; N_STATE]) {
    let d = [
        r_sc[0] - station_pos[0],
        r_sc[1] - station_pos[1],
        r_sc[2] - station_pos[2],
    ];
    let rho = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    let v_rel = [
        v_sc[0] - station_vel[0],
        v_sc[1] - station_vel[1],
        v_sc[2] - station_vel[2],
    ];
    let mut h = [0.0; N_STATE];
    if rho <= 0.0 {
        return (0.0, h);
    }
    let u = [d[0] / rho, d[1] / rho, d[2] / rho]; // LOS unit vector
    let rho_dot = u[0] * v_rel[0] + u[1] * v_rel[1] + u[2] * v_rel[2]; // ρ̇ = û·v_rel
    for k in 0..3 {
        // ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ ; ∂ρ̇/∂v = û.
        h[k] = (v_rel[k] - rho_dot * u[k]) / rho;
        h[3 + k] = u[k];
    }
    (rho_dot, h)
}

/// The **one-way Doppler clock-frequency partial**: the additional sensitivity of a one-way
/// range-rate-equivalent observable to the spacecraft oscillator's **fractional-frequency** error
/// (the second state of [`crate::clock_state::ClockState3`]).
///
/// A one-way Doppler observable is the carrier shift `f_D = −(f₀/c)·(ρ̇ + c·y)`, where `y` is the
/// fractional-frequency error of the transmitting clock: a clock running fast by `y` adds an
/// apparent line-of-sight velocity `c·y` indistinguishable (to a single observable) from real
/// range rate. Expressed as a range-rate-equivalent (m/s) observable `ρ̇_obs = ρ̇ + c·y`, the
/// partial with respect to the clock fractional-frequency state is therefore **`∂ρ̇_obs/∂y = c`**
/// (the speed of light). This function returns that constant so a caller carrying a joint
/// state `[r; v; emp; …; y]` can append the clock column to the [`range_rate_observable`] row;
/// the bare nine-state [`ReducedDynamicOd`] does not carry a clock state, so its two-way path
/// (station-referenced, clock-free) needs no such term — this is the seam for the one-way case.
pub fn doppler_clock_freq_partial() -> f64 {
    crate::timegeo::C_M_PER_S
}

impl<F: ForceModel> ReducedDynamicOd<F> {
    /// Fold a single **radiometric** (range or range-rate) observation into the SRIF about the
    /// current reference `state` (`[r; v; emp]`), returning the post-update reference state.
    ///
    /// Mirrors the position-`Observation` measurement step of [`run`](Self::run): the SRIF carries
    /// the *deviation* about the reference, so the predicted observable is formed from the current
    /// reference, the residual `value − predicted` is folded in against the geometry partial
    /// `h_row` from [`range_observable`] / [`range_rate_observable`], the solved increment is added
    /// back to the reference, and the SRIF is recentred. This is the driver path the end-to-end
    /// Mars-LMO recovery uses; it does not propagate (the caller runs the time update between
    /// epochs exactly as [`run`](Self::run) does), it only applies one measurement update.
    pub fn radiometric_update(
        srif: &mut Srif,
        state: [f64; N_STATE],
        meas: &RadiometricMeas,
    ) -> [f64; N_STATE] {
        let r_sc = [state[0], state[1], state[2]];
        let v_sc = [state[3], state[4], state[5]];
        let (predicted, h_row) = match meas.kind {
            RadiometricKind::Range => range_observable(r_sc, meas.station_pos),
            RadiometricKind::RangeRate => {
                range_rate_observable(r_sc, v_sc, meas.station_pos, meas.station_vel)
            }
        };
        // The SRIF estimates the deviation δx about the reference; the linearised residual of the
        // deviation is (observed − predicted) since h_row·δx ≈ observable(reference + δx) − predicted.
        srif.measurement_update(&h_row, meas.value - predicted, meas.sigma);
        let (dx, _p) = srif.solve();
        let mut out = state;
        for i in 0..N_STATE {
            out[i] += dx[i];
        }
        srif.recenter();
        out
    }
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

    // --- D2.2 reduced-dynamic empirical accelerations ---

    use crate::precise_od::{propagate_samples, Observation, PreciseForceModel};

    /// A LEO-ish circular reference state about Earth (point-mass model).
    fn ref_state() -> (Vec3, Vec3) {
        let mu = crate::forces::MU_EARTH;
        let r0 = [7.0e6, 0.0, 0.0];
        let speed = (mu / r0[0]).sqrt();
        let v0 = [0.0, speed * 0.8, speed * 0.6]; // inclined circular
        (r0, v0)
    }

    /// A point-mass Earth force model at a fixed epoch (the filter's *template*: no empirical tier).
    fn template() -> PreciseForceModel {
        PreciseForceModel::egm2008(0, 2_459_580.5)
    }

    /// Sample a truth trajectory's positions at `times`, optionally with a constant RTN empirical
    /// acceleration baked in (the "unmodelled manoeuvre" the filter's template does not know about).
    fn truth_obs(emp_truth: Option<Vec3>, times: &[f64], sigma: f64) -> Vec<Observation> {
        let (r0, v0) = ref_state();
        let mut fm = template();
        if let Some(e) = emp_truth {
            fm = fm.with_empirical(EmpiricalAccel {
                radial: [e[0], 0.0, 0.0],
                transverse: [e[1], 0.0, 0.0],
                normal: [e[2], 0.0, 0.0],
                ..EmpiricalAccel::default()
            });
        }
        let tol = Tolerance {
            rtol: 1e-11,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let pos = propagate_samples(&fm, r0, v0, times, &tol);
        times
            .iter()
            .zip(pos)
            .map(|(&t, p)| Observation { t, pos: p, sigma })
            .collect()
    }

    /// Sample a truth trajectory whose RTN empirical acceleration **steps** at `t_step` (from
    /// `emp_a` to `emp_b`) — a piecewise-constant manoeuvre (thruster on/off) that a *constant*
    /// (low-tightness) empirical model cannot follow but a *time-varying* (high-tightness) one can.
    /// The two arcs are integrated continuously (the second starts from the first's end state).
    fn truth_obs_stepped(
        emp_a: Vec3,
        emp_b: Vec3,
        t_step: f64,
        times: &[f64],
        sigma: f64,
    ) -> Vec<Observation> {
        let (r0, v0) = ref_state();
        let tol = Tolerance {
            rtol: 1e-11,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let with = |e: Vec3| {
            template().with_empirical(EmpiricalAccel {
                radial: [e[0], 0.0, 0.0],
                transverse: [e[1], 0.0, 0.0],
                normal: [e[2], 0.0, 0.0],
                ..EmpiricalAccel::default()
            })
        };
        let mut out = Vec::with_capacity(times.len());
        for &t in times {
            let pos = if t <= t_step {
                propagate_samples(&with(emp_a), r0, v0, &[t], &tol)[0]
            } else {
                let (rs, vs) = crate::precise_od::propagate(&with(emp_a), r0, v0, t_step, &tol);
                propagate_samples(&with(emp_b), rs, vs, &[t - t_step], &tol)[0]
            };
            out.push(Observation { t, pos, sigma });
        }
        out
    }

    /// A small deterministic pseudo-noise sequence (no rand dep): reproducible across runs.
    fn pseudo_noise(seed: u64, amp: f64) -> impl FnMut() -> f64 {
        let mut s = seed.wrapping_mul(2_862_933_555_777_941_757).wrapping_add(1);
        move || {
            s = s.wrapping_mul(6_364_136_223_846_793_005).wrapping_add(1);
            let u = ((s >> 11) as f64) / ((1u64 << 53) as f64); // [0,1)
            (u - 0.5) * 2.0 * amp
        }
    }

    /// Tightness sweep settings shared by the D2.2 tests: a 30 s-cadence arc against a truth whose
    /// empirical acceleration *steps* partway through (a thruster manoeuvre). `emp_process_sigma_max`
    /// is sized so `dynamic_tightness = 1` lets the empirical states slew to follow the step.
    fn stepped_config(dynamic_tightness: f64) -> ReducedDynamicConfig {
        ReducedDynamicConfig {
            dynamic_tightness,
            emp_correlation_time: 6.0e2,
            emp_process_sigma_max: 5.0e-7,
            sigma_pos: 1.0e2,
            sigma_vel: 1.0e0,
            sigma_emp: 5.0e-6,
            ..ReducedDynamicConfig::default()
        }
    }

    #[test]
    fn reduced_dynamic_tracks_maneuver() {
        // Truth carries a *stepped* RTN empirical acceleration (thruster on at the midpoint) that
        // the filter template does NOT model. A near-kinematic filter (high process noise) lets the
        // empirical states slew to absorb the step; a near-dynamic filter (empirical near-constant)
        // lags the step and leaves a larger residual.
        let emp_a = [1.0e-6, 1.0e-6, 0.0]; // m/s² before the burn
        let emp_b = [6.0e-6, 9.0e-6, -4.0e-6]; // m/s² after the burn
        let times: Vec<f64> = (1..=60).map(|k| k as f64 * 30.0).collect(); // 30 min arc
        let t_step = 900.0; // burn at the midpoint
        let obs = truth_obs_stepped(emp_a, emp_b, t_step, &times, 1.0);
        let (r0, v0) = ref_state();

        let kin = ReducedDynamicOd::new(template(), stepped_config(1.0))
            .run(r0, v0, &obs)
            .expect("kinematic run");
        let dyn_ = ReducedDynamicOd::new(template(), stepped_config(0.0))
            .run(r0, v0, &obs)
            .expect("dynamic run");

        // The near-kinematic filter follows the manoeuvre with a clearly smaller residual.
        assert!(
            kin.residual_rms < dyn_.residual_rms * 0.5,
            "kinematic residual {} not clearly < dynamic residual {}",
            kin.residual_rms,
            dyn_.residual_rms
        );

        // Smoothing aspect: on a *ballistic* (no-manoeuvre) noisy arc, the near-dynamic filter
        // smooths the measurement noise better than the near-kinematic one (which chases it). Both
        // are compared against the CLEAN truth positions — the smoothing target.
        let mut noise = pseudo_noise(0xC0FFEE, 5.0); // ±5 m pseudo-noise
        let clean = truth_obs(None, &times, 5.0);
        let noisy: Vec<Observation> = clean
            .iter()
            .map(|o| Observation {
                t: o.t,
                pos: [o.pos[0] + noise(), o.pos[1] + noise(), o.pos[2] + noise()],
                sigma: 5.0,
            })
            .collect();
        let est_error = |rep: &ReducedDynamicReport| -> f64 {
            let mut s = 0.0;
            for (step, c) in rep.steps.iter().zip(&clean) {
                let d = [
                    step.r[0] - c.pos[0],
                    step.r[1] - c.pos[1],
                    step.r[2] - c.pos[2],
                ];
                s += d[0] * d[0] + d[1] * d[1] + d[2] * d[2];
            }
            (s / rep.steps.len() as f64).sqrt()
        };
        let smooth = ReducedDynamicOd::new(template(), stepped_config(0.0))
            .run(r0, v0, &noisy)
            .expect("smooth run");
        let track = ReducedDynamicOd::new(template(), stepped_config(1.0))
            .run(r0, v0, &noisy)
            .expect("track run");
        assert!(
            est_error(&smooth) < est_error(&track),
            "dynamic (smoothing) error {} not < kinematic (noise-tracking) error {}",
            est_error(&smooth),
            est_error(&track)
        );
    }

    #[test]
    fn tuning_is_a_continuum() {
        // On the stepped-manoeuvre truth, sweeping dynamic_tightness from dynamic→kinematic must
        // move the post-fit residual monotonically downward — the tuning is a continuum, not a switch.
        let emp_a = [1.0e-6, 1.0e-6, 0.0];
        let emp_b = [6.0e-6, 9.0e-6, -4.0e-6];
        let times: Vec<f64> = (1..=60).map(|k| k as f64 * 30.0).collect();
        let obs = truth_obs_stepped(emp_a, emp_b, 900.0, &times, 1.0);
        let (r0, v0) = ref_state();

        let tights = [0.0_f64, 0.25, 0.5, 0.75, 1.0];
        let mut residuals = Vec::new();
        for &dt in &tights {
            let rep = ReducedDynamicOd::new(template(), stepped_config(dt))
                .run(r0, v0, &obs)
                .expect("run");
            residuals.push(rep.residual_rms);
        }
        // Monotone non-increasing as tightness rises (more empirical freedom ⇒ better manoeuvre fit).
        for w in residuals.windows(2) {
            assert!(
                w[1] <= w[0] * 1.0001 + 1e-9,
                "residual not monotone with tightness: {residuals:?}"
            );
        }
        // And the endpoints are clearly separated (the continuum spans a real range).
        assert!(
            *residuals.first().unwrap() > *residuals.last().unwrap() * 1.5,
            "tuning range too small: {residuals:?}"
        );
    }

    // --- D2.5a radiometric (range/Doppler) measurement partials ---

    /// A representative LMO-scale spacecraft state and an offset tracking station, in one inertial
    /// frame, for the radiometric-partial tests. The station has a non-trivial velocity so the
    /// range-rate position partial (which depends on `v_rel`) is genuinely exercised.
    fn radiometric_geometry() -> (Vec3, Vec3, Vec3, Vec3) {
        let r_sc = [3.9e6, 1.1e6, -7.0e5]; // areocentric-scale spacecraft position (m)
        let v_sc = [-1.2e3, 3.3e3, 2.5e2]; // m/s
        let station_pos = [2.1e6, -4.0e5, 9.0e5]; // an areocentric tracking station (m)
        let station_vel = [3.0e1, 1.5e2, -2.0e1]; // co-rotating station velocity (m/s)
        (r_sc, v_sc, station_pos, station_vel)
    }

    #[test]
    fn range_partial_matches_finite_difference() {
        // ∂ρ/∂r must equal a central finite difference of ρ = |r_sc − r_sta| to 1e-6 (relative),
        // and ∂ρ/∂v must be exactly zero (range is instantaneous geometry).
        let (r_sc, _v, sta, _sv) = radiometric_geometry();
        let (_rho, h) = range_observable(r_sc, sta);
        let rho_of = |r: Vec3| -> f64 { range_observable(r, sta).0 };

        let step = 1.0; // 1 m position perturbation
        for k in 0..3 {
            let (mut rp, mut rm) = (r_sc, r_sc);
            rp[k] += step;
            rm[k] -= step;
            let fd = (rho_of(rp) - rho_of(rm)) / (2.0 * step);
            let rel = (h[k] - fd).abs() / fd.abs().max(1e-12);
            assert!(rel < 1e-6, "∂ρ/∂r[{k}] = {} vs FD {fd} (rel {rel:e})", h[k]);
        }
        // No velocity or empirical sensitivity.
        for (k, &hk) in h.iter().enumerate().take(N_STATE).skip(3) {
            assert_eq!(hk, 0.0, "range must have no ∂/∂(v,emp) at index {k}");
        }
        // The LOS partial is a unit vector (‖û‖ = 1).
        let n = (h[0] * h[0] + h[1] * h[1] + h[2] * h[2]).sqrt();
        assert!(
            (n - 1.0).abs() < 1e-12,
            "∂ρ/∂r must be a unit vector, ‖‖ = {n}"
        );
    }

    #[test]
    fn range_rate_partials_match_finite_difference() {
        // ∂ρ̇/∂r and ∂ρ̇/∂v must each match a central finite difference of the range-rate
        // observable ρ̇ = û·(v_sc − v_sta) to 1e-6 — the standard range-rate partials
        // (∂ρ̇/∂v = û, ∂ρ̇/∂r = (v_rel − ρ̇·û)/ρ).
        let (r_sc, v_sc, sta, sv) = radiometric_geometry();
        let (_rdot, h) = range_rate_observable(r_sc, v_sc, sta, sv);
        let rdot_of = |r: Vec3, v: Vec3| -> f64 { range_rate_observable(r, v, sta, sv).0 };

        // ∂ρ̇/∂r (1 m position step).
        let rstep = 1.0;
        for k in 0..3 {
            let (mut rp, mut rm) = (r_sc, r_sc);
            rp[k] += rstep;
            rm[k] -= rstep;
            let fd = (rdot_of(rp, v_sc) - rdot_of(rm, v_sc)) / (2.0 * rstep);
            let rel = (h[k] - fd).abs() / fd.abs().max(1e-12);
            assert!(rel < 1e-6, "∂ρ̇/∂r[{k}] = {} vs FD {fd} (rel {rel:e})", h[k]);
        }
        // ∂ρ̇/∂v (1 mm/s velocity step).
        let vstep = 1e-3;
        for k in 0..3 {
            let (mut vp, mut vm) = (v_sc, v_sc);
            vp[k] += vstep;
            vm[k] -= vstep;
            let fd = (rdot_of(r_sc, vp) - rdot_of(r_sc, vm)) / (2.0 * vstep);
            let rel = (h[3 + k] - fd).abs() / fd.abs().max(1e-12);
            assert!(
                rel < 1e-6,
                "∂ρ̇/∂v[{k}] = {} vs FD {fd} (rel {rel:e})",
                h[3 + k]
            );
        }
        // ∂ρ̇/∂v is the LOS unit vector; no empirical sensitivity.
        let nv = (h[3] * h[3] + h[4] * h[4] + h[5] * h[5]).sqrt();
        assert!(
            (nv - 1.0).abs() < 1e-12,
            "∂ρ̇/∂v must be a unit vector, ‖‖ = {nv}"
        );
        for (k, &hk) in h.iter().enumerate().take(N_STATE).skip(6) {
            assert_eq!(hk, 0.0, "range-rate must have no ∂/∂emp at index {k}");
        }
    }

    #[test]
    fn doppler_clock_freq_partial_is_speed_of_light() {
        // A one-way Doppler range-rate-equivalent observable couples the clock fractional-frequency
        // state with ∂ρ̇_obs/∂y = c (a clock fast by y looks like a line-of-sight velocity c·y).
        let c = doppler_clock_freq_partial();
        assert_eq!(c, crate::timegeo::C_M_PER_S);
        assert!(
            (c - 299_792_458.0).abs() < 1e-6,
            "clock-freq partial must be c"
        );
    }

    #[test]
    fn radiometric_update_reduces_covariance_in_observed_direction() {
        // A single range update must shrink the state covariance in the line-of-sight (observed)
        // direction: the variance of the position projected onto û falls after the update, and the
        // post-update covariance stays symmetric positive-definite (the SRIF guarantee).
        let (r_sc, v_sc, sta, _sv) = radiometric_geometry();
        let cfg = ReducedDynamicConfig {
            sigma_pos: 1.0e3,
            sigma_vel: 1.0,
            sigma_emp: 1.0e-6,
            ..ReducedDynamicConfig::default()
        };
        let sigma0 = [
            cfg.sigma_pos,
            cfg.sigma_pos,
            cfg.sigma_pos,
            cfg.sigma_vel,
            cfg.sigma_vel,
            cfg.sigma_vel,
            cfg.sigma_emp,
            cfg.sigma_emp,
            cfg.sigma_emp,
        ];
        let state = [
            r_sc[0], r_sc[1], r_sc[2], v_sc[0], v_sc[1], v_sc[2], 0.0, 0.0, 0.0,
        ];

        let (_rho, h) = range_observable(r_sc, sta);
        let los = [h[0], h[1], h[2]]; // observed (line-of-sight) position direction

        // Variance along û from a covariance P: ûᵀ P_pos û (top-left 3×3 block).
        let var_along = |p: &[Vec<f64>]| -> f64 {
            let mut pu = [0.0; 3];
            for i in 0..3 {
                for j in 0..3 {
                    pu[i] += p[i][j] * los[j];
                }
            }
            los[0] * pu[0] + los[1] * pu[1] + los[2] * pu[2]
        };

        let mut srif = Srif::with_apriori(&[0.0; N_STATE], &sigma0);
        let (_x0, p_before) = srif.solve();
        let var_before = var_along(&p_before);

        // Fold one (noise-free, on-reference) range observation: value == predicted, so the state
        // does not move, but the information (and thus the covariance) tightens along the LOS.
        let predicted = range_observable(r_sc, sta).0;
        let meas = RadiometricMeas {
            t: 0.0,
            kind: RadiometricKind::Range,
            station_pos: sta,
            station_vel: [0.0; 3],
            value: predicted,
            sigma: 1.0, // 1 m range σ
        };
        let new_state =
            ReducedDynamicOd::<PreciseForceModel>::radiometric_update(&mut srif, state, &meas);
        let (_x1, p_after) = srif.solve();
        let var_after = var_along(&p_after);

        assert!(
            var_after < var_before,
            "range update did not shrink the LOS variance: {var_after} !< {var_before}"
        );
        // The 1 m range update should drive the LOS variance toward the measurement variance (1 m²),
        // far below the 1e6 m² a-priori — a real, large reduction, not a rounding nudge.
        assert!(
            var_after < var_before * 1e-3,
            "LOS variance barely moved: before {var_before}, after {var_after}"
        );
        // On a noise-free, on-reference measurement the state is unchanged.
        for i in 0..N_STATE {
            assert!(
                (new_state[i] - state[i]).abs() < 1e-6 * state[i].abs().max(1.0),
                "on-reference update moved state[{i}]: {} → {}",
                state[i],
                new_state[i]
            );
        }
        // Covariance stays SPD.
        assert!(
            cholesky(&p_after).is_some(),
            "covariance not PD after update"
        );
    }

    #[test]
    fn range_rate_update_observes_velocity() {
        // A range-rate update carries information into the velocity subspace (∂ρ̇/∂v = û ≠ 0): the
        // velocity covariance along the LOS shrinks after a Doppler update.
        let (r_sc, v_sc, sta, sv) = radiometric_geometry();
        let sigma0 = [1.0e3, 1.0e3, 1.0e3, 1.0, 1.0, 1.0, 1e-6, 1e-6, 1e-6];
        let state = [
            r_sc[0], r_sc[1], r_sc[2], v_sc[0], v_sc[1], v_sc[2], 0.0, 0.0, 0.0,
        ];

        let (_rdot, h) = range_rate_observable(r_sc, v_sc, sta, sv);
        let los_v = [h[3], h[4], h[5]]; // ∂ρ̇/∂v = û

        let var_vel_along = |p: &[Vec<f64>]| -> f64 {
            let mut pu = [0.0; 3];
            for i in 0..3 {
                for j in 0..3 {
                    pu[i] += p[3 + i][3 + j] * los_v[j];
                }
            }
            los_v[0] * pu[0] + los_v[1] * pu[1] + los_v[2] * pu[2]
        };

        let mut srif = Srif::with_apriori(&[0.0; N_STATE], &sigma0);
        let (_x0, p_before) = srif.solve();
        let v_before = var_vel_along(&p_before);

        let predicted = range_rate_observable(r_sc, v_sc, sta, sv).0;
        let meas = RadiometricMeas {
            t: 0.0,
            kind: RadiometricKind::RangeRate,
            station_pos: sta,
            station_vel: sv,
            value: predicted,
            sigma: 1e-4, // 0.1 mm/s Doppler σ
        };
        ReducedDynamicOd::<PreciseForceModel>::radiometric_update(&mut srif, state, &meas);
        let (_x1, p_after) = srif.solve();
        let v_after = var_vel_along(&p_after);
        assert!(
            v_after < v_before,
            "Doppler update did not shrink the LOS velocity variance: {v_after} !< {v_before}"
        );
        assert!(
            cholesky(&p_after).is_some(),
            "covariance not PD after Doppler update"
        );
    }
}
