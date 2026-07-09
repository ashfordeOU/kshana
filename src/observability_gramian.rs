// SPDX-License-Identifier: AGPL-3.0-only
//! Observability-Gramian-over-arc core for planar cislunar tracking (paper P6).
//!
//! A single range snapshot to a spacecraft in the planar circular restricted three-body
//! problem sees one line-of-sight and nothing of velocity — the four-state
//! `s = [x, y, ẋ, ẏ]` is far from observable. Observability is *recovered over an arc*:
//! as the geometry evolves, the per-epoch measurement Jacobians `H(t_k)`, mapped back to
//! the initial epoch through the **variational state-transition matrix** `Φ(t_k)`, span
//! more of the state space. This module assembles that structure and reads off how much
//! of the state the arc actually constrains.
//!
//! For a linearised measurement model `z_k = H_k · δs(t_k) + n` and `δs(t_k) = Φ_k·δs_0`,
//! the sensitivity of the whole batch to the initial state is the stacked
//! **observability matrix** `O = stack_k[ H_k · Φ_k ]`. The state is observable over the
//! arc iff `O` has full column rank; the **observability Gramian**
//! `W = Σ_k Δt_k · Φ_kᵀ H_kᵀ H_k Φ_k` (a dt-weighted `OᵀO`) is the symmetric
//! positive-semidefinite information content, whose spectrum quantifies *how strongly*
//! each direction is seen.
//!
//! ## What is Validated vs Modelled
//! * **Validated.** The **rank** is read from a singular-value threshold on `O`
//!   (rank-revealing SVD via the squared-singular-value = eigenvalue-of-`OᵀO` identity),
//!   and independently confirmed against the eigen-rank of the dt-weighted Gramian `W`.
//!   The **eigen-spectrum** of `W` is the symmetric spectrum from the crate's
//!   Jacobi eigensolver ([`crate::fim::sym_eig`]), cross-checked against the spectral
//!   invariants `trace(W) = Σλ`, `‖W‖_F² = Σλ²`, and (for a full-rank block) an
//!   independent Gaussian-elimination `det(W) = Πλ`. The variational STM `Φ` produced by
//!   [`planar_state_stm`] is the finite-difference-validated CR3BP STM of
//!   [`crate::cr3bp::propagate_state_stm`] (its planar `[x, y, ẋ, ẏ]` sub-block), so STM
//!   propagation is Validated, not a first-order approximation.
//! * **Modelled.** The particular tracking geometry (which spacecraft, which links, the
//!   arc length and epoch grid) is a scenario input; the *specific* rank progression it
//!   produces is a property of that Modelled geometry, not an oracle-verified universal.

use crate::fim::{design_metrics, information_matrix, sym_eig};
use crate::intersat_range::{range_rate_row, range_row, PlanarState};

/// A dense matrix as rows of columns (matching the rest of the crate).
pub type Mat = Vec<Vec<f64>>;

/// Planar CR3BP state dimension `[x, y, ẋ, ẏ]`.
pub const N_PLANAR: usize = 4;

/// The rotating-frame in-plane component indices in the 6-vector `[x, y, z, ẋ, ẏ, ż]`.
const PLANAR_IDX: [usize; N_PLANAR] = [0, 1, 3, 4];

// ── Variational STM bridge (L31) ────────────────────────────────────────────

/// Propagate a **planar** CR3BP state and its 4×4 variational STM for time `t`.
///
/// This is the planar `[x, y, ẋ, ẏ]` sub-block of the crate's finite-difference-validated
/// CR3BP STM ([`crate::cr3bp::propagate_state_stm`]): the planar state is embedded as
/// `z = ż = 0` (the plane is an invariant manifold, and the out-of-plane block decouples
/// exactly there), the full 6×6 STM is integrated, and the `{x, y, ẋ, ẏ}` rows/columns
/// are extracted. Returns `(state(t), Φ(t))` with `Φ` the true linearisation of the flow.
pub fn planar_state_stm(
    s0: &PlanarState,
    mu: f64,
    t: f64,
    steps: usize,
) -> (PlanarState, [[f64; N_PLANAR]; N_PLANAR]) {
    let embed = crate::cr3bp::Cr3bpState {
        r: [s0[0], s0[1], 0.0],
        v: [s0[2], s0[3], 0.0],
    };
    let (st, phi6) = crate::cr3bp::propagate_state_stm(&embed, mu, t, steps);
    let state = [st.r[0], st.r[1], st.v[0], st.v[1]];
    let mut phi = [[0.0; N_PLANAR]; N_PLANAR];
    for (i, &ri) in PLANAR_IDX.iter().enumerate() {
        for (j, &cj) in PLANAR_IDX.iter().enumerate() {
            phi[i][j] = phi6[ri][cj];
        }
    }
    (state, phi)
}

/// Planar CR3BP state after time `t` (position + velocity), without the STM — the flow
/// used to place the reference spacecraft along the arc.
pub fn planar_propagate(s0: &PlanarState, mu: f64, t: f64, steps: usize) -> PlanarState {
    let embed = crate::cr3bp::Cr3bpState {
        r: [s0[0], s0[1], 0.0],
        v: [s0[2], s0[3], 0.0],
    };
    let st = crate::cr3bp::propagate_cr3bp(embed, mu, t, steps);
    [st.r[0], st.r[1], st.v[0], st.v[1]]
}

// ── Observability assembly (L27) ─────────────────────────────────────────────

/// One tracking epoch: the measurement Jacobian rows `H_k` (each row a length-`n`
/// partial), the variational STM `Φ_k` mapping the initial state to this epoch, and the
/// integration weight `Δt_k` folded into the Gramian.
#[derive(Clone, Debug)]
pub struct ObsEpoch {
    /// Measurement Jacobian rows at this epoch (`m_k × n`).
    pub h: Mat,
    /// Variational STM `Φ(t_k)` from the initial epoch (`n × n`).
    pub phi: Mat,
    /// Integration weight (the sub-arc length this epoch represents).
    pub dt: f64,
}

/// A single stacked observability row `h · Φ` (row vector times matrix).
#[allow(clippy::needless_range_loop)]
fn row_times_matrix(h: &[f64], phi: &Mat) -> Vec<f64> {
    let n = phi.len();
    let mut out = vec![0.0; n];
    for c in 0..h.len() {
        let hc = h[c];
        if hc == 0.0 {
            continue;
        }
        for j in 0..n {
            out[j] += hc * phi[c][j];
        }
    }
    out
}

/// Assemble the stacked **observability matrix** `O = stack_k[ H_k · Φ_k ]` and the
/// per-row integration weights (each row inherits its epoch's `Δt`). Returns
/// `(O, weights)`.
pub fn observability_matrix(epochs: &[ObsEpoch]) -> (Mat, Vec<f64>) {
    let mut o = Vec::new();
    let mut w = Vec::new();
    for ep in epochs {
        for h in &ep.h {
            o.push(row_times_matrix(h, &ep.phi));
            w.push(ep.dt);
        }
    }
    (o, w)
}

/// The dt-weighted observability **Gramian** `W = Σ_k Δt_k · Φ_kᵀ H_kᵀ H_k Φ_k`.
///
/// This is exactly the weighted Gram matrix `Σ_row w_row · o_rowᵀ o_row` of the stacked
/// observability rows, so it is assembled through the crate's Fisher-information kernel
/// [`crate::fim::information_matrix`].
pub fn gramian(epochs: &[ObsEpoch]) -> Mat {
    let (o, w) = observability_matrix(epochs);
    information_matrix(&o, &w)
}

/// Singular values of `O` in **descending** order, via the rank-revealing identity
/// `σ_i = √λ_i(OᵀO)` (the crate's symmetric Jacobi eigensolver on the Gram matrix). This
/// is the SVD spectrum the observability rank is thresholded from.
pub fn singular_values(o: &Mat) -> Vec<f64> {
    if o.is_empty() {
        return vec![];
    }
    // Unweighted Gram OᵀO; its eigenvalues are the squared singular values of O.
    let ones = vec![1.0; o.len()];
    let gram = information_matrix(o, &ones);
    let e = sym_eig(&gram);
    let mut sv: Vec<f64> = e.values.iter().map(|&l| l.max(0.0).sqrt()).collect();
    sv.sort_by(|a, b| b.total_cmp(a));
    sv
}

/// Numerical **rank** of `O` from a singular-value threshold: `σ_i > rel_tol · σ_max`.
/// This is the rank-revealing SVD read of observability.
pub fn observable_rank(o: &Mat, rel_tol: f64) -> usize {
    let sv = singular_values(o);
    let smax = sv.first().copied().unwrap_or(0.0);
    if smax <= 0.0 {
        return 0;
    }
    let thr = rel_tol * smax;
    sv.iter().filter(|&&s| s > thr).count()
}

/// The symmetric spectrum and conditioning of an observability Gramian `W`.
#[derive(Clone, Debug)]
pub struct GramianSpectrum {
    /// Eigenvalues of `W` in ascending order (the symmetric spectrum).
    pub eigenvalues: Vec<f64>,
    /// Smallest eigenvalue `λ_min` — the worst-observed direction.
    pub min_eigenvalue: f64,
    /// Largest eigenvalue `λ_max`.
    pub max_eigenvalue: f64,
    /// `trace(W) = Σλ` — total information (an eigen-invariant cross-check anchor).
    pub trace: f64,
    /// Condition number `λ_max / λ_min` over the observable subspace (`+∞` if singular).
    pub condition: f64,
    /// Numerical rank (observable directions) of `W`.
    pub rank: usize,
    /// Datum-defect dimension `n − rank` (unobservable directions).
    pub defect: usize,
}

/// Eigen-spectrum, `λ_min`, condition number and rank of a Gramian `W`, read off the
/// crate's symmetric eigensolver and experiment-design metrics.
pub fn gramian_spectrum(w: &Mat, rel_tol: f64) -> GramianSpectrum {
    let e = sym_eig(w);
    let dm = design_metrics(w, rel_tol);
    let min_eigenvalue = e.values.first().copied().unwrap_or(0.0);
    let max_eigenvalue = e.values.last().copied().unwrap_or(0.0);
    let trace = e.values.iter().sum();
    GramianSpectrum {
        eigenvalues: e.values,
        min_eigenvalue,
        max_eigenvalue,
        trace,
        condition: dm.condition,
        rank: dm.rank,
        defect: dm.defect,
    }
}

/// One point of the rank-vs-arc-length table: the observable rank over the tracking arc
/// truncated at epoch `epoch_index` (arc time `arc_time`).
#[derive(Clone, Debug)]
pub struct RankArcPoint {
    /// Index of the last epoch in this prefix.
    pub epoch_index: usize,
    /// Elapsed arc time from the first epoch (normalised rotating-frame time units).
    pub arc_time: f64,
    /// Total stacked measurement rows accumulated up to and including this epoch.
    pub n_rows: usize,
    /// Numerical observable rank of the arc so far (SVD threshold).
    pub rank: usize,
    /// Largest singular value of the stacked `O` so far.
    pub sigma_max: f64,
    /// Smallest singular value of the stacked `O` so far.
    pub sigma_min: f64,
}

/// The **rank-vs-arc-length** table: for each growing prefix of the epoch sequence, the
/// numerical observable rank of the accumulated observability matrix. As the arc extends,
/// the rank grows toward full observability (paper P6 Table 1).
pub fn rank_vs_arc(epochs: &[ObsEpoch], rel_tol: f64) -> Vec<RankArcPoint> {
    let mut o: Mat = Vec::new();
    let mut arc = 0.0;
    let mut out = Vec::with_capacity(epochs.len());
    for (k, ep) in epochs.iter().enumerate() {
        arc += ep.dt;
        for h in &ep.h {
            o.push(row_times_matrix(h, &ep.phi));
        }
        let sv = singular_values(&o);
        let sigma_max = sv.first().copied().unwrap_or(0.0);
        let sigma_min = sv.last().copied().unwrap_or(0.0);
        let rank = if sigma_max > 0.0 {
            let thr = rel_tol * sigma_max;
            sv.iter().filter(|&&s| s > thr).count()
        } else {
            0
        };
        out.push(RankArcPoint {
            epoch_index: k,
            arc_time: arc,
            n_rows: o.len(),
            rank,
            sigma_max,
            sigma_min,
        });
    }
    out
}

// ── Range-rate design lever (L30) ────────────────────────────────────────────

/// The instantaneous (single-epoch) observability lever of adding Doppler.
#[derive(Clone, Debug)]
pub struct RankLever {
    /// Number of inter-satellite links in the snapshot.
    pub n_links: usize,
    /// Rank of a range-only measurement stack at one epoch (velocity columns are zero, so
    /// this can never exceed the position dimension).
    pub rank_range_only: usize,
    /// Rank of a range **and** range-rate stack at one epoch — Doppler's non-zero velocity
    /// columns lift the rank toward the full four-state.
    pub rank_range_rate: usize,
}

/// Compare the **instantaneous** rank of range-only vs range+range-rate measurements from
/// a chief spacecraft to a set of reference spacecraft at a single epoch. Range-only rows
/// have zero velocity columns (rank capped at the position dimension); the range-rate rows
/// add non-zero velocity columns, so the combined stack observes more of the state.
pub fn range_vs_range_rate_rank(
    chief: &PlanarState,
    refs: &[PlanarState],
    rel_tol: f64,
) -> RankLever {
    let mut h_range: Mat = Vec::new();
    let mut h_both: Mat = Vec::new();
    for r in refs {
        let (_rho, rr) = range_row(chief, r);
        h_range.push(rr.to_vec());
        h_both.push(rr.to_vec());
        let (_rd, rrr) = range_rate_row(chief, r);
        h_both.push(rrr.to_vec());
    }
    RankLever {
        n_links: refs.len(),
        rank_range_only: observable_rank(&h_range, rel_tol),
        rank_range_rate: observable_rank(&h_both, rel_tol),
    }
}

// ── GDOP-singular reporting (L33) ────────────────────────────────────────────

/// A geometric-dilution report for a cislunar snapshot: either a finite value or an
/// explicit *undefined* verdict for a rank-deficient (singular) geometry.
#[derive(Clone, Debug, PartialEq)]
pub enum CislunarGdop {
    /// A well-posed geometry: the geometric dilution of precision `√trace(M⁻¹)`.
    Defined {
        /// The geometric dilution of precision.
        gdop: f64,
        /// Numerical rank of the information matrix (full rank ⇒ observable).
        rank: usize,
    },
    /// A rank-deficient / singular geometry: GDOP is **undefined** (not a bogus finite
    /// number). Carries the numerical rank, datum defect and a human-readable reason.
    Undefined {
        /// Numerical rank of the information matrix.
        rank: usize,
        /// Datum-defect dimension `n − rank` (unobservable directions).
        defect: usize,
        /// Why the value is undefined.
        reason: String,
    },
}

/// Report GDOP for a cislunar geometry, or flag it **undefined** when the geometry is
/// rank-deficient — the honest analogue of [`crate::pvt::solve_spp`]'s singular guard
/// (its `invert4(GᵀG)` returns `None` for a singular geometry, yielding no fix). Here the
/// same singular geometry is reported explicitly through [`crate::fim::design_metrics`]:
/// a non-zero datum defect or an infinite condition number means no finite dilution
/// exists, so a value is never fabricated.
pub fn cislunar_gdop(rows: &Mat, rel_tol: f64) -> CislunarGdop {
    if rows.is_empty() {
        return CislunarGdop::Undefined {
            rank: 0,
            defect: 0,
            reason: "no measurement rows: geometry is empty".to_string(),
        };
    }
    let n = rows[0].len();
    let weights = vec![1.0; rows.len()];
    let m = information_matrix(rows, &weights);
    let dm = design_metrics(&m, rel_tol);
    if dm.defect > 0 || !dm.condition.is_finite() {
        return CislunarGdop::Undefined {
            rank: dm.rank,
            defect: n - dm.rank,
            reason: format!(
                "GDOP undefined (rank-deficient / singular geometry): rank {} of {} \
                 states, datum defect {}, condition {}",
                dm.rank,
                n,
                n - dm.rank,
                if dm.condition.is_finite() {
                    format!("{:.3e}", dm.condition)
                } else {
                    "inf".to_string()
                }
            ),
        };
    }
    // Full rank: GDOP = √trace(M⁻¹), the sum of the per-state variance lower bounds.
    let c = crate::fim::crlb(&m, rel_tol);
    let trace_inv: f64 = c.crlb_diag.iter().sum();
    CislunarGdop::Defined {
        gdop: trace_inv.max(0.0).sqrt(),
        rank: dm.rank,
    }
}

// ── Oracle helper: an independent determinant ────────────────────────────────

/// Determinant of a square matrix by Gaussian elimination with partial pivoting — an
/// **independent** route to `det(W)` (a different algorithm from the eigen-product
/// `Πλ`), used to cross-check the eigensolver's spectrum on a full-rank block.
// Dense Gaussian-elimination kernel: explicit (col, r, c) index arithmetic is the natural
// form here (and matches the crate's other matrix code) — iterator rewrites obscure it.
#[allow(clippy::needless_range_loop)]
pub fn determinant(m: &Mat) -> f64 {
    let n = m.len();
    if n == 0 {
        return 1.0;
    }
    let mut a: Vec<Vec<f64>> = m.to_vec();
    let mut det = 1.0;
    for col in 0..n {
        // Partial pivot: largest magnitude in this column at or below the diagonal.
        let mut piv = col;
        let mut best = a[col][col].abs();
        for r in (col + 1)..n {
            let v = a[r][col].abs();
            if v > best {
                best = v;
                piv = r;
            }
        }
        if best == 0.0 {
            return 0.0;
        }
        if piv != col {
            a.swap(piv, col);
            det = -det;
        }
        det *= a[col][col];
        let pivot = a[col][col];
        for r in (col + 1)..n {
            let factor = a[r][col] / pivot;
            if factor != 0.0 {
                for c in col..n {
                    a[r][c] -= factor * a[col][c];
                }
            }
        }
    }
    det
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::cr3bp::EARTH_MOON_MU;

    fn frob_sq(m: &Mat) -> f64 {
        m.iter().flat_map(|r| r.iter()).map(|v| v * v).sum()
    }

    // ── L31: the planar variational STM matches a central finite difference ──────
    /// ORACLE (Validated): the 4×4 planar STM equals a central finite-difference STM of
    /// the CR3BP flow (a different code path — plain state propagation) to tolerance.
    #[test]
    fn planar_stm_matches_finite_difference() {
        let s0: PlanarState = [1.08, 0.03, 0.10, -0.50];
        let (t, steps) = (0.20, 4000);
        let (_st, phi) = planar_state_stm(&s0, EARTH_MOON_MU, t, steps);
        let eps = 1e-6;
        for j in 0..N_PLANAR {
            let mut sp = s0;
            let mut sm = s0;
            sp[j] += eps;
            sm[j] -= eps;
            let ep = planar_propagate(&sp, EARTH_MOON_MU, t, steps);
            let em = planar_propagate(&sm, EARTH_MOON_MU, t, steps);
            for i in 0..N_PLANAR {
                let fd = (ep[i] - em[i]) / (2.0 * eps);
                assert!(
                    (phi[i][j] - fd).abs() < 1e-5,
                    "planar STM[{i}][{j}] = {} vs finite-diff {fd}",
                    phi[i][j]
                );
            }
        }
    }

    #[test]
    #[allow(clippy::needless_range_loop)]
    fn planar_stm_is_identity_at_zero_time() {
        let s0: PlanarState = [1.1, 0.0, 0.0, -0.5];
        let (_st, phi) = planar_state_stm(&s0, EARTH_MOON_MU, 0.0, 10);
        for i in 0..N_PLANAR {
            for j in 0..N_PLANAR {
                let want = if i == j { 1.0 } else { 0.0 };
                assert!((phi[i][j] - want).abs() < 1e-12);
            }
        }
    }

    // ── L27: eigen-spectrum cross-checks against spectral invariants ─────────────
    /// ORACLE (Validated): the eigenvalues of a symmetric-positive-definite Gramian obey
    /// `trace = Σλ`, `‖W‖_F² = Σλ²`, and `det = Πλ` (an independent Gaussian-elimination
    /// determinant) — three invariants pinning the returned spectrum to the true one.
    #[test]
    fn gramian_spectrum_satisfies_spectral_invariants() {
        // Build a genuine arc Gramian from two epochs so W is full rank.
        let epochs = sample_arc();
        let w = gramian(&epochs);
        let spec = gramian_spectrum(&w, 1e-9);
        let sum: f64 = spec.eigenvalues.iter().sum();
        let sum_sq: f64 = spec.eigenvalues.iter().map(|l| l * l).sum();
        let prod: f64 = spec.eigenvalues.iter().product();
        let tr: f64 = (0..w.len()).map(|i| w[i][i]).sum();
        assert!(
            (sum - tr).abs() <= 1e-9 * (1.0 + tr.abs()),
            "trace {tr} vs Σλ {sum}"
        );
        assert!(
            (sum_sq - frob_sq(&w)).abs() <= 1e-9 * (1.0 + frob_sq(&w)),
            "Frobenius² {} vs Σλ² {sum_sq}",
            frob_sq(&w)
        );
        let det = determinant(&w);
        assert!(
            (prod - det).abs() <= 1e-8 * (1.0 + det.abs()),
            "det {det} vs Πλ {prod}"
        );
        // A symmetric PSD Gramian: every eigenvalue is non-negative.
        assert!(spec.min_eigenvalue >= -1e-12);
    }

    /// The SVD rank of O agrees with the eigen-rank of the dt-weighted Gramian W — two
    /// independent rank-revealing routes on the same observable subspace.
    #[test]
    fn svd_rank_matches_gramian_eigen_rank() {
        let epochs = sample_arc();
        let (o, _w) = observability_matrix(&epochs);
        let svd_rank = observable_rank(&o, 1e-9);
        let w = gramian(&epochs);
        let spec = gramian_spectrum(&w, 1e-9);
        assert_eq!(svd_rank, spec.rank, "SVD rank vs Gramian eigen-rank");
    }

    // A short two-epoch single-link arc that is full-rank observable (used by the
    // invariant + rank cross-check tests).
    fn sample_arc() -> Vec<ObsEpoch> {
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let reference: PlanarState = [1.02, -0.03, -0.06, -0.55];
        let mu = EARTH_MOON_MU;
        let ts = [0.02_f64, 0.05_f64];
        let mut out = Vec::new();
        let mut prev = 0.0;
        for &t in &ts {
            let (cs, phi) = planar_state_stm(&chief, mu, t, 2000);
            let rs = planar_propagate(&reference, mu, t, 2000);
            let (_rho, r_row) = range_row(&cs, &rs);
            let (_rd, rr_row) = range_rate_row(&cs, &rs);
            out.push(ObsEpoch {
                h: vec![r_row.to_vec(), rr_row.to_vec()],
                phi: phi.iter().map(|r| r.to_vec()).collect(),
                dt: t - prev,
            });
            prev = t;
        }
        out
    }

    // ── L30: the range-rate lever raises instantaneous rank ─────────────────────
    #[test]
    fn range_rate_raises_instantaneous_rank() {
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let refs = [
            [1.02, -0.03, -0.06, -0.55],
            [1.15, 0.05, 0.10, -0.45],
            [1.05, 0.06, 0.18, -0.40],
        ];
        let lever = range_vs_range_rate_rank(&chief, &refs, 1e-9);
        assert!(
            lever.rank_range_rate > lever.rank_range_only,
            "range+rate rank {} must exceed range-only rank {}",
            lever.rank_range_rate,
            lever.rank_range_only
        );
        // Range-only can never exceed the planar position dimension (velocity blind).
        assert!(lever.rank_range_only <= 2);
    }

    #[test]
    fn range_only_single_link_is_rank_one() {
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let refs = [[1.02, -0.03, -0.06, -0.55]];
        let lever = range_vs_range_rate_rank(&chief, &refs, 1e-9);
        assert_eq!(lever.rank_range_only, 1, "one range snapshot is rank-1");
        assert!(lever.rank_range_rate >= 2, "range+rate sees velocity too");
    }

    // ── L33: rank-deficient geometry flags GDOP undefined ───────────────────────
    #[test]
    fn rank_deficient_geometry_flags_gdop_undefined() {
        // Range-only rows at a single epoch: velocity columns are all zero, so the
        // 4-state geometry is rank-deficient and GDOP must be undefined, not finite.
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let refs = [[1.02, -0.03, -0.06, -0.55], [1.15, 0.05, 0.10, -0.45]];
        let mut rows: Mat = Vec::new();
        for r in &refs {
            let (_rho, rr) = range_row(&chief, r);
            rows.push(rr.to_vec());
        }
        match cislunar_gdop(&rows, 1e-9) {
            CislunarGdop::Undefined { defect, .. } => assert!(defect >= 1),
            CislunarGdop::Defined { gdop, .. } => {
                panic!("rank-deficient geometry must not yield a finite GDOP {gdop}")
            }
        }
    }

    #[test]
    fn full_rank_geometry_yields_finite_gdop() {
        // Range + range-rate to three references spans the full four-state, so GDOP is a
        // finite, positive number.
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let refs = [
            [1.02, -0.03, -0.06, -0.55],
            [1.15, 0.05, 0.10, -0.45],
            [1.05, 0.06, 0.18, -0.40],
        ];
        let mut rows: Mat = Vec::new();
        for r in &refs {
            let (_rho, rr) = range_row(&chief, r);
            rows.push(rr.to_vec());
            let (_rd, rrr) = range_rate_row(&chief, r);
            rows.push(rrr.to_vec());
        }
        match cislunar_gdop(&rows, 1e-9) {
            CislunarGdop::Defined { gdop, rank } => {
                assert_eq!(rank, N_PLANAR);
                assert!(gdop.is_finite() && gdop > 0.0, "GDOP {gdop}");
            }
            CislunarGdop::Undefined { reason, .. } => panic!("expected finite GDOP: {reason}"),
        }
    }

    #[test]
    fn determinant_matches_known_values() {
        // Identity → 1; a 2×2 with a known determinant; a singular row → 0.
        let id: Mat = vec![vec![1.0, 0.0], vec![0.0, 1.0]];
        assert!((determinant(&id) - 1.0).abs() < 1e-12);
        let m: Mat = vec![vec![4.0, 3.0], vec![6.0, 3.0]];
        assert!((determinant(&m) - (4.0 * 3.0 - 3.0 * 6.0)).abs() < 1e-12);
        let sing: Mat = vec![vec![1.0, 2.0], vec![2.0, 4.0]];
        assert!(determinant(&sing).abs() < 1e-12);
    }

    #[test]
    fn rank_vs_arc_grows_and_reaches_full_rank() {
        // A single-link range-only arc: instantaneously rank-1, growing to full rank 4
        // as the arc lengthens and the STM couples position into velocity.
        let chief: PlanarState = [1.10, 0.02, 0.05, -0.50];
        let reference: PlanarState = [1.02, -0.03, -0.06, -0.55];
        let mu = EARTH_MOON_MU;
        let n_epochs = 24;
        let arc = 0.06_f64; // ~6 rotating-frame hours of coupling
        let mut epochs = Vec::new();
        let mut prev = 0.0;
        for k in 0..n_epochs {
            let t = arc * (k as f64) / ((n_epochs - 1) as f64);
            let (cs, phi) = planar_state_stm(&chief, mu, t, 3000);
            let rs = planar_propagate(&reference, mu, t, 3000);
            let (_rho, r_row) = range_row(&cs, &rs);
            epochs.push(ObsEpoch {
                h: vec![r_row.to_vec()],
                phi: phi.iter().map(|r| r.to_vec()).collect(),
                dt: t - prev,
            });
            prev = t;
        }
        let table = rank_vs_arc(&epochs, 1e-6);
        // First epoch (a single instantaneous range) is rank 1.
        assert_eq!(table[0].rank, 1, "single instantaneous range is rank-1");
        // Rank is non-decreasing along the arc.
        for w in table.windows(2) {
            assert!(
                w[1].rank >= w[0].rank,
                "rank must not decrease along the arc"
            );
        }
        // By the end of the arc the four-state is fully observable.
        assert_eq!(
            table.last().unwrap().rank,
            N_PLANAR,
            "full observability over arc"
        );
    }
}
