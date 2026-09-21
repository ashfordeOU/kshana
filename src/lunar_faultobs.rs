// SPDX-License-Identifier: AGPL-3.0-only
//! Free-network (self-referential) fault-observability substrate for a sparse
//! multi-provider lunar constellation.
//!
//! Where the coupled-datum layer in [`crate::lunar_gauge`] builds *anchored*
//! observation rows — a node ranges to a body point whose geometry is known, so a
//! geometrically diverse network pins the reference frame (datum defect → 0) — this
//! module builds the *free-network* analog. Both endpoints of every measurement are
//! network nodes subject to the **same** datum `θ` (Helmert 7-parameter frame plus a
//! common clock offset/rate), so the network can only ever observe quantities that are
//! invariant under a re-choice of that shared datum.
//!
//! ## The differential observation
//! For an inter-node range `ρ_ab = ‖p_a − p_b‖` where both endpoints transform under the
//! same `θ`, the observation-row is `∂ρ_ab/∂θ = û_ab·(J_a − J_b)`, with `û_ab` the unit
//! line of sight and `J_a`, `J_b` each endpoint's position-Jacobian w.r.t. `θ`
//! (built from [`crate::lunar_datum::partials_datum7`]). Two structural cancellations
//! follow directly, and they are the physics of the free-network gauge:
//! * **Rigid frame (translations + rotations) cancels.** A rigid transform of the whole
//!   lunar frame moves both endpoints together and preserves every inter-node distance,
//!   so the three translation columns and the three rotation columns of every
//!   differential row vanish.
//! * **Common timescale cancels.** A single global clock offset/rate shared by both nodes
//!   cancels in the difference, so the `IDX_OFFSET` and `IDX_RATE` columns vanish.
//!
//! What survives is **scale**: a fractional scale change of the lunar frame stretches every
//! inter-node baseline by `‖p_a − p_b‖·δs`, so the scale column equals the baseline length
//! and is observable. The resulting null space is exactly eight-dimensional —
//! `{3 translations, 3 rotations, common offset, common rate}` — matching the published
//! free-network datum-defect result, with scale the one observable degree of freedom.
//!
//! ## Validation status
//! **Modelled (InternalConsistency).** The eight-dimensional gauge is a first-principles
//! consequence of rigid-transform invariance of inter-node ranges and common-mode clock
//! cancellation; the numeric defect is confirmed by [`crate::lunar_gauge::classify_null_space`]
//! on a representative real-DE440 multi-node, multi-epoch network. Geometry is
//! representative (fixed lunar-frame nodes), not a fitted deployment.

use crate::lunar_gauge::{IDX_OFFSET, N_GAUGE, T_BASE_S};
use crate::lunar_llr_geometry::Vec3;

/// Differential inter-node range row over the nine-vector coupled datum `θ`.
///
/// Both endpoints are network nodes given by their PA body-frame positions
/// `node_a_body`, `node_b_body`; they are carried into geocentric-inertial coordinates via
/// the real DE440 PA-frame orientation path ([`crate::lunar_orientation::de440_moon_pa_body_to_inertial`])
/// at epoch `t_tt_jc` (Julian centuries from J2000.0 TT). The epoch is required because the
/// frame-orientation columns of each endpoint's datum-Jacobian depend on the physical
/// libration `R(t)`.
///
/// The row is `∂ρ_ab/∂θ = û_ab·(J_a − J_b)` for the seven Helmert columns, computed as the
/// difference of two [`crate::lunar_datum::partials_datum7`] evaluations contracted with the
/// **same** line of sight `û_ab = (r_a − r_b)/‖r_a − r_b‖`. The two temporal columns
/// (`IDX_OFFSET`, `IDX_RATE`) are zero: a common timescale shared by both nodes cancels in
/// the difference.
///
/// The line of sight is formed from the Moon-relative inertial positions
/// `R(t)·p` (the geocentric Moon position, common to both nodes, cancels analytically and is
/// omitted to avoid a `~3.8e8 m` cancellation). This is exactly the rotation applied inside
/// `partials_datum7`, so the scale and rotation columns are numerically consistent.
///
/// By construction the three translation columns are identically zero (the translation
/// Jacobian is node-independent) and the three rotation columns vanish analytically
/// (`û_ab·(â_k × Δr) = 0` since `û_ab ∥ Δr`); only the scale column survives, equal to the
/// inter-node baseline length.
pub fn differential_range_row(
    node_a_body: Vec3,
    node_b_body: Vec3,
    t_tt_jc: f64,
) -> [f64; N_GAUGE] {
    // Moon-relative inertial positions (r − r_moon); the shared r_moon cancels in the LOS.
    let ra_rel = crate::lunar_orientation::de440_moon_pa_body_to_inertial(node_a_body, t_tt_jc);
    let rb_rel = crate::lunar_orientation::de440_moon_pa_body_to_inertial(node_b_body, t_tt_jc);
    let dv = [
        ra_rel[0] - rb_rel[0],
        ra_rel[1] - rb_rel[1],
        ra_rel[2] - rb_rel[2],
    ];
    let n = (dv[0] * dv[0] + dv[1] * dv[1] + dv[2] * dv[2]).sqrt();
    let uhat = [dv[0] / n, dv[1] / n, dv[2] / n];

    // Each endpoint's datum-Jacobian contracted with the SAME line of sight.
    let ja = crate::lunar_datum::partials_datum7(uhat, node_a_body, t_tt_jc);
    let jb = crate::lunar_datum::partials_datum7(uhat, node_b_body, t_tt_jc);

    let mut row = [0.0_f64; N_GAUGE];
    for (c, r) in row.iter_mut().take(7).enumerate() {
        *r = ja[c] - jb[c];
    }
    // IDX_OFFSET and IDX_RATE remain 0.0: the common timescale cancels in the differential.
    row
}

/// Inter-node clock-difference row over the nine-vector coupled datum `θ`.
///
/// A simultaneous inter-node clock comparison senses `clock_a − clock_b`. Both nodes carry
/// the common timescale offset (`IDX_OFFSET`) with identical sensitivity, so the difference
/// cancels it; likewise the common rate (`IDX_RATE`) over a shared integration window. The
/// row therefore carries **no** common-datum information — it is the algebraic statement that
/// the common timescale is a two-dimensional gauge, the temporal analog of the rigid-frame
/// cancellation in [`differential_range_row`].
///
/// (Per-node clock differences are real nuisance parameters, but they lie outside the common
/// nine-vector datum modelled here. Anchoring the common timescale — making the offset/rate
/// observable — requires an external time tie such as [`crate::lunar_gauge::rate_tie_row`],
/// not an inter-node comparison.)
pub fn differential_clock_tie_row() -> [f64; N_GAUGE] {
    // Node a contributes +1 at IDX_OFFSET, node b −1: the common offset cancels (1 − 1 = 0).
    let node_a_offset = 1.0_f64;
    let node_b_offset = 1.0_f64;
    let mut row = [0.0_f64; N_GAUGE];
    row[IDX_OFFSET] = node_a_offset - node_b_offset;
    row
}

/// Assemble the free-network Fisher information matrix `GᵀWG` from weighted row blocks.
///
/// Reuses the coupled-datum preconditioning convention of
/// [`crate::lunar_gauge::assemble_coupled_info`]: each `(rows, sigma)` block is weighted by
/// `1/σ²`, columns 3..7 (scale + rotations) are divided by `R_MOON` to bring all nine
/// partials to `O(1)`, and the weighted outer products are accumulated. The null-space
/// structure (defect, spatial/temporal classification) is invariant under positive per-column
/// scaling, so the preconditioning does not change the gauge.
pub fn assemble_faultobs_info(blocks: &[(Vec<[f64; N_GAUGE]>, f64)]) -> Vec<Vec<f64>> {
    crate::lunar_gauge::assemble_coupled_info(blocks)
}

// ── Per-node state model (the fault-observability substrate) ─────────────────────────
//
// The differential rows above verify the datum⊕timescale gauge on the nine-vector datum
// `θ`, but that state is rank-1 (only scale is observable) — too impoverished to carry a
// fault-observability or untrusted-peer analysis. The estimated state of an autonomous
// constellation is instead PER NODE: every node carries a position, a clock offset and a
// clock rate. The eight-dimensional datum⊕timescale gauge of [`differential_range_row`]
// (the free-network gauge — three translations, three rotations, a common clock offset
// and a common clock rate) reappears here as a genuine SUBSPACE of the per-node null space,
// while the remaining `state_dim − 8` directions are observable. `range(G)` and the parity
// space are therefore both non-trivial — the standard secure-state-estimation substrate.

/// Number of datum⊕timescale gauge generators returned by [`datum_gauge_generators`].
///
/// The eight are three translations, three rotations, a common clock offset and a common
/// clock rate — the free-network gauge embedded in per-node coordinates.
pub const N_DATUM_GAUGE: usize = 8;

/// Cross product `a × b`.
fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

/// Index layout and dimension of the stacked per-node state vector.
///
/// Each of the `M = n_nodes` nodes carries a position error `δp_j ∈ ℝ³`, a clock-offset
/// error `δτ_j` and a clock-rate error `δα_j`. Stacked:
///
/// ```text
/// x = [ δp_1 … δp_M | δτ_1 … δτ_M | δα_1 … δα_M ],   state_dim = 5·M
/// ```
///
/// with three contiguous blocks:
/// * **positions** `[0, 3M)` — node `j` occupies `[3j, 3j+3)` ([`Self::pos_idx`]),
/// * **offsets** `[3M, 4M)` — node `j` at `3M + j` ([`Self::off_idx`]),
/// * **rates** `[4M, 5M)` — node `j` at `4M + j` ([`Self::rate_idx`]).
///
/// The eight-dimensional datum⊕timescale gauge ([`datum_gauge_generators`]) is a subspace
/// of the null space of the per-node information matrix; the other `5M − 8` directions are
/// observable.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct NetworkLayout {
    /// Number of network nodes `M`.
    pub n_nodes: usize,
    /// Dimension of the stacked per-node state, `5·M`.
    pub state_dim: usize,
}

impl NetworkLayout {
    /// Layout for a network of `n_nodes` nodes (`state_dim = 5·n_nodes`).
    pub fn new(n_nodes: usize) -> Self {
        Self {
            n_nodes,
            state_dim: 5 * n_nodes,
        }
    }

    /// First index of node `j`'s position block; `δp_j` occupies `pos_idx(j)..pos_idx(j)+3`.
    pub fn pos_idx(&self, j: usize) -> usize {
        3 * j
    }

    /// Index of node `j`'s clock offset `δτ_j`.
    pub fn off_idx(&self, j: usize) -> usize {
        3 * self.n_nodes + j
    }

    /// Index of node `j`'s clock rate `δα_j`.
    pub fn rate_idx(&self, j: usize) -> usize {
        4 * self.n_nodes + j
    }
}

/// One differential inter-node one-way range row in per-node coordinates.
///
/// For a one-way range `ρ_ab` between nodes `a` and `b`, the linearised sensitivity to the
/// per-node state is
/// * `∂ρ/∂δp_a = +û_ab`, `∂ρ/∂δp_b = −û_ab` — the unit line of sight and its negative,
/// * `∂ρ/∂δτ_a = +1`, `∂ρ/∂δτ_b = −1` — each node clock offset enters directly,
/// * `∂ρ/∂δα_a = +elapsed_s/T_BASE_S`, `∂ρ/∂δα_b = −elapsed_s/T_BASE_S` — each rate
///   accumulates over the elapsed integration window; dividing by [`T_BASE_S`] keeps the
///   entry `O(1)`, mirroring [`crate::lunar_gauge::oneway_range_row`].
///
/// `u_ab` is the unit line of sight from real DE440 geometry
/// (`û_ab = (r_a − r_b)/‖r_a − r_b‖`, the shared Moon-relative offset cancelling). The
/// returned row has length `layout.state_dim` and is otherwise zero.
pub fn pernode_range_row(
    layout: &NetworkLayout,
    node_a: usize,
    node_b: usize,
    u_ab: [f64; 3],
    elapsed_s: f64,
) -> Vec<f64> {
    let mut row = vec![0.0_f64; layout.state_dim];
    let (pa, pb) = (layout.pos_idx(node_a), layout.pos_idx(node_b));
    for k in 0..3 {
        row[pa + k] = u_ab[k];
        row[pb + k] = -u_ab[k];
    }
    row[layout.off_idx(node_a)] = 1.0;
    row[layout.off_idx(node_b)] = -1.0;
    let kappa = elapsed_s / T_BASE_S;
    row[layout.rate_idx(node_a)] = kappa;
    row[layout.rate_idx(node_b)] = -kappa;
    row
}

/// Assemble the per-node Fisher information matrix `GᵀWG` (`state_dim × state_dim`).
///
/// Each `(row, sigma)` pair contributes `w · rowᵀrow` with diagonal weight `w = 1/σ²`.
/// No column preconditioning is applied: every partial is already `O(1)` — unit
/// line-of-sight components, unit offset sensitivities, and `elapsed_s/T_BASE_S` rate
/// sensitivities — so the matrix is well scaled for the eigenvalue-count rank diagnosis.
pub fn assemble_pernode_info(rows: &[(Vec<f64>, f64)], state_dim: usize) -> Vec<Vec<f64>> {
    let mut info = vec![vec![0.0_f64; state_dim]; state_dim];
    for (row, sigma) in rows {
        let w = 1.0 / (sigma * sigma);
        for p in 0..state_dim {
            let jw = row[p] * w;
            if jw == 0.0 {
                continue;
            }
            for q in 0..state_dim {
                info[p][q] += jw * row[q];
            }
        }
    }
    info
}

/// The eight analytic datum⊕timescale gauge generators in per-node coordinates.
///
/// These are the free-network gauge directions embedded in the per-node state: a rigid
/// transform of the whole lunar frame plus a common timescale re-choice leaves every
/// differential observable unchanged, so each generator lies in the null space of the
/// per-node information matrix built from [`pernode_range_row`]. The eight are
/// * three **translations** — `δp_j += ê_k` for every node `j` (`k = 0,1,2`),
/// * three **rotations** — `δp_j += ê_k × p_j` for every node `j`, with `p_j` its inertial
///   position (`node_positions[j]`); the line of sight is parallel to the inter-node
///   baseline, so `û_ab·(ê_k × (p_a − p_b)) = 0`,
/// * one **common clock offset** — `δτ_j += 1` for every node,
/// * one **common clock rate** — `δα_j += 1` for every node.
///
/// The global-scale direction `δp_j += p_j` is deliberately *absent*: a fractional scale
/// change stretches every baseline (`û_ab·(p_a − p_b) = ‖p_a − p_b‖ ≠ 0`), so scale is
/// observable, not gauged. Returned as [`N_DATUM_GAUGE`] vectors of length
/// `layout.state_dim`; `node_positions` must have `layout.n_nodes` entries.
pub fn datum_gauge_generators(
    layout: &NetworkLayout,
    node_positions: &[[f64; 3]],
) -> Vec<Vec<f64>> {
    debug_assert_eq!(
        node_positions.len(),
        layout.n_nodes,
        "node_positions must have one entry per node"
    );
    let mut gens = Vec::with_capacity(N_DATUM_GAUGE);

    // Three translations: δp_j += ê_k for every node.
    for k in 0..3 {
        let mut g = vec![0.0_f64; layout.state_dim];
        for j in 0..layout.n_nodes {
            g[layout.pos_idx(j) + k] = 1.0;
        }
        gens.push(g);
    }

    // Three rotations about the frame origin: δp_j += ê_k × p_j for every node.
    for k in 0..3 {
        let mut e = [0.0_f64; 3];
        e[k] = 1.0;
        let mut g = vec![0.0_f64; layout.state_dim];
        for (j, &p) in node_positions.iter().enumerate() {
            let c = cross(e, p);
            let base = layout.pos_idx(j);
            g[base] = c[0];
            g[base + 1] = c[1];
            g[base + 2] = c[2];
        }
        gens.push(g);
    }

    // Common clock offset: δτ_j += 1 for every node.
    let mut g_off = vec![0.0_f64; layout.state_dim];
    for j in 0..layout.n_nodes {
        g_off[layout.off_idx(j)] = 1.0;
    }
    gens.push(g_off);

    // Common clock rate: δα_j += 1 for every node.
    let mut g_rate = vec![0.0_f64; layout.state_dim];
    for j in 0..layout.n_nodes {
        g_rate[layout.rate_idx(j)] = 1.0;
    }
    gens.push(g_rate);

    gens
}

/// Weighted parity projector P⊥ = I − G(GᵀWG)⁺GᵀW for a rank-deficient measurement system.
///
/// Classical parity-space RAIM (Sturza 1988; Brown 1992) defines the residual projector
/// `P⊥ = I − G(GᵀWG)⁻¹GᵀW` for a full-rank measurement Jacobian `G`. In a gauged
/// problem — here the eight-dimensional lunar datum⊕timescale null space of an autonomous
/// free constellation — `GᵀWG` is rank-deficient and the ordinary inverse does not exist.
/// Replacing it with the Moore–Penrose pseudo-inverse `(GᵀWG)⁺` (computed spectrally via
/// [`crate::fim::crlb`]) yields a well-defined projector that retains the RAIM property:
/// faults in `range(G)` are annihilated (undetectable), and every other fault projects to a
/// nonzero parity residual (detectable). Survival of the datum gauge is the extension beyond
/// the classical result required by an autonomous lunar constellation.
///
/// `g` is the `n × state_dim` measurement Jacobian (each row is one measurement sensitivity
/// vector over the per-node state); `w` is the `n`-vector of per-measurement weights `1/σ²`
/// (the diagonal of `W`). Returns the `n × n` matrix P⊥.
///
/// **Properties** (verified in the module tests):
/// * **Idempotent:** P⊥² = P⊥ (a genuine projector onto the parity space).
/// * **W-self-adjoint:** W·P⊥ is symmetric (the correct symmetry in the weighted metric;
///   P⊥ itself is not symmetric when W ≠ I).
/// * **Range annihilation:** P⊥·G = 0 (any column combination of G is annihilated).
pub fn parity_projector(g: &[Vec<f64>], w: &[f64]) -> Vec<Vec<f64>> {
    let n = g.len();
    if n == 0 {
        return vec![];
    }
    let state_dim = g[0].len();

    // Form N = GᵀWG (state_dim × state_dim).
    let mut ntm = vec![vec![0.0_f64; state_dim]; state_dim];
    for (i, row) in g.iter().enumerate() {
        let wi = w[i];
        for p in 0..state_dim {
            let jwi = row[p] * wi;
            if jwi == 0.0 {
                continue;
            }
            for q in 0..state_dim {
                ntm[p][q] += jwi * row[q];
            }
        }
    }

    // Pseudo-inverse Nplus = (GᵀWG)⁺ via the spectral construction in fim::crlb.
    let nplus = crate::fim::crlb(&ntm, 1e-9).pseudo_covariance;

    // C = Nplus · Gᵀ  (state_dim × n): C[k][i] = Σ_l Nplus[k][l] · G[i][l].
    let c: Vec<Vec<f64>> = nplus
        .iter()
        .map(|nrow| {
            g.iter()
                .map(|grow| nrow.iter().zip(grow.iter()).map(|(&nl, &gl)| nl * gl).sum())
                .collect()
        })
        .collect();

    // D = C · W  (state_dim × n): D[k][i] = C[k][i] · w[i].
    let d: Vec<Vec<f64>> = c
        .iter()
        .map(|crow| {
            crow.iter()
                .zip(w.iter())
                .map(|(&cv, &wv)| cv * wv)
                .collect()
        })
        .collect();

    // H = G · D  (n × n): H[j][i] = Σ_k G[j][k] · D[k][i].
    let h: Vec<Vec<f64>> = g
        .iter()
        .map(|grow| {
            (0..n)
                .map(|i| grow.iter().zip(d.iter()).map(|(&gk, dk)| gk * dk[i]).sum())
                .collect()
        })
        .collect();

    // P⊥ = I − H.
    h.into_iter()
        .enumerate()
        .map(|(i, row)| {
            row.into_iter()
                .enumerate()
                .map(|(j, v)| if i == j { 1.0 - v } else { -v })
                .collect()
        })
        .collect()
}

/// Detectability test: does fault vector `b` have a nonzero parity residual?
///
/// Returns `(‖P⊥ b‖ > tol, ‖P⊥ b‖)`. The classical T1 RAIM condition (Sturza 1988;
/// Brown 1992): a measurement fault `b` is detectable iff `b ∉ range(G)`, which is
/// equivalent to `P⊥ b ≠ 0` (the parity residual is nonzero). Faults in `range(G)`
/// can be absorbed into a state error and leave no residual; they are undetectable by
/// any parity-based monitor.
pub fn is_detectable(pperp: &[Vec<f64>], b: &[f64], tol: f64) -> (bool, f64) {
    let pb: Vec<f64> = pperp
        .iter()
        .map(|row| row.iter().zip(b.iter()).map(|(&p, &bi)| p * bi).sum())
        .collect();
    let norm = pb.iter().map(|&x| x * x).sum::<f64>().sqrt();
    (norm > tol, norm)
}

/// Baarda minimum-detectable-bias (MDB) along fault direction `c`.
///
/// For a weighted observation system with parity projector `P⊥` and diagonal weight
/// matrix `W = diag(w)`, the MDB for a unit fault direction `c ∈ ℝⁿ` is
///
/// ```text
/// MDB = sqrt( λ₀ / (cᵀ W P⊥ c) )
/// ```
///
/// where `λ₀ = ncp` is the non-centrality parameter from the `(P_fa, P_md)` power
/// allocation (see Baarda 1968, "A Testing Procedure for Use in Geodetic Networks").
///
/// The quadratic form is computed as
///
/// ```text
/// q = cᵀ W P⊥ c = Σᵢ Σⱼ c[i] · w[i] · P⊥[i][j] · c[j]
/// ```
///
/// **This is the single-`P⊥` form cᵀ W P⊥ c.** Note that
/// `(P⊥c)ᵀ W (P⊥c) = cᵀ P⊥ᵀ W P⊥ c` is **equal** to it for *every* `W` — because `P⊥`
/// is `W`-self-adjoint (`P⊥ᵀ W = W P⊥`) and idempotent (`P⊥² = P⊥`), so
/// `cᵀ P⊥ᵀ W P⊥ c = cᵀ W P⊥ P⊥ c = cᵀ W P⊥ c`; it is therefore **not** a counterexample.
/// The form that genuinely *differs* for `W ≠ I` is the double-`P⊥` form
/// `cᵀ P⊥ W P⊥ c` (with `P⊥`, not `P⊥ᵀ`, on the left; `P⊥ ≠ P⊥ᵀ` when `W ≠ I`), which
/// coincides with the correct form only when `W = I`. The single-`P⊥` form is the
/// classically correct Baarda non-centrality (Baarda 1968; Teunissen 2006 "Testing
/// Theory"); the distinction from the double-`P⊥` form is pinned by the
/// `mdb_correct_vs_wrong_form_w_neq_i` test below.
///
/// Returns `f64::INFINITY` for an undetectable fault direction
/// (`cᵀ W P⊥ c ≤ 0`; algebraically this occurs iff `c ∈ range(G)`, since `W P⊥` is
/// positive-semi-definite and its null space is exactly `range(G)`).
pub fn mdb(pperp: &[Vec<f64>], w: &[f64], c: &[f64], ncp: f64) -> f64 {
    debug_assert_eq!(pperp.len(), w.len(), "P⊥ rows and w length must match");
    debug_assert_eq!(pperp.len(), c.len(), "P⊥ size and c length must match");
    let q: f64 = c
        .iter()
        .enumerate()
        .map(|(i, &ci)| {
            let wi_ci = w[i] * ci;
            pperp[i]
                .iter()
                .zip(c.iter())
                .map(|(&pij, &cj)| wi_ci * pij * cj)
                .sum::<f64>()
        })
        .sum();
    if q <= 0.0 {
        return f64::INFINITY;
    }
    (ncp / q).sqrt()
}

/// Peer-fault model for a single constellation node.
///
/// The `incidence` field lists the measurement indices (rows of the observation
/// matrix `G`, numbered `0..n_meas`) in which this node participates. A Byzantine
/// peer can corrupt any linear combination of these measurement rows — the set of
/// reachable fault vectors is `{ B_j · α : α ∈ ℝ^{|incidence|} }` where `B_j` is
/// the column-block returned by [`peer_signature`]. This incidence representation is
/// the input to the Byzantine fault-count bound computed in the downstream analysis.
#[derive(Clone, Debug)]
pub struct PeerFaultModel {
    /// Indices (in `0..n_meas`) of the measurement rows in which this peer participates.
    pub incidence: Vec<usize>,
}

/// Fault-signature column-block `B_j` for peer `j` (Byzantine attack surface).
///
/// A peer node `j` that participates in measurements indexed by `incidence` can
/// corrupt any measurement in that set; the full set of reachable measurement-space
/// fault vectors is spanned by the columns of `B_j`. The `k`-th column of `B_j` is
/// the standard basis vector `e_{incidence[k]} ∈ ℝ^{n_meas}` (a single-measurement
/// unit bias on the `incidence[k]`-th row).
///
/// Returns an `n_meas × incidence.len()` matrix (row-major: outer index = row,
/// inner index = column). Each column is all-zero except for a single `1.0` at the
/// row given by the corresponding `incidence` entry.
///
/// Horizontally stacking the blocks of two distinct peers gives the joint fault
/// signature of a two-peer coalition — the input to a multi-peer Byzantine bound.
pub fn peer_signature(n_meas: usize, incidence: &[usize]) -> Vec<Vec<f64>> {
    let n_cols = incidence.len();
    let mut mat = vec![vec![0.0_f64; n_cols]; n_meas];
    for (col, &row_idx) in incidence.iter().enumerate() {
        debug_assert!(
            row_idx < n_meas,
            "incidence index {row_idx} out of range {n_meas}"
        );
        mat[row_idx][col] = 1.0;
    }
    mat
}

/// Largest peer coalition enumerated by [`byzantine_bound`].
///
/// Exact block-spark enumeration is exponential in the number of peers `M`; the search
/// is limited to coalitions of at most this many peers. Because it stops at the first
/// dependent coalition, the realised cost is `C(M, block_spark)` — small whenever the
/// block spark is small (the common case), and bounded above by `C(M, MAX_COALITION)`.
pub const MAX_COALITION: usize = 12;

/// Byzantine fault classification of a peer network: the detect/identify bounds and the
/// governing block spark.
///
/// Semantics of the three counts are pinned by the block spark (see [`byzantine_bound`]):
/// the network can DETECT any coalition of up to `f_detect` arbitrarily-faulty peers and
/// can uniquely IDENTIFY any coalition of up to `f_identify`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ByzantineClass {
    /// Largest fault coalition guaranteed detectable: `block_spark − 1`.
    pub f_detect: usize,
    /// Largest fault coalition guaranteed uniquely identifiable: `⌊(block_spark − 1)/2⌋`.
    pub f_identify: usize,
    /// Smallest number of peer-blocks whose stacked effective signatures are dependent.
    pub block_spark: usize,
}

/// Effective signature `Ḡ_j = P⊥ · B_j` of one peer block (parity-space attack surface).
///
/// `pperp` is the `n × n` parity projector, `block` the `n × cols` fault block `B_j`
/// (row-major). Returns the `n × cols` product `P⊥·B_j`.
fn project_block(pperp: &[Vec<f64>], block: &[Vec<f64>]) -> Vec<Vec<f64>> {
    if block.is_empty() {
        return vec![];
    }
    let ncols = block[0].len();
    pperp
        .iter()
        .map(|prow| {
            (0..ncols)
                .map(|c| {
                    prow.iter()
                        .zip(block.iter())
                        .map(|(&p, brow)| p * brow[c])
                        .sum()
                })
                .collect()
        })
        .collect()
}

/// Stack the columns of the effective blocks indexed by `subset` into a flat column list.
fn stack_columns(eff: &[Vec<Vec<f64>>], subset: &[usize]) -> Vec<Vec<f64>> {
    let mut cols = Vec::new();
    for &j in subset {
        let block = &eff[j];
        if block.is_empty() {
            continue;
        }
        let ncols = block[0].len();
        for c in 0..ncols {
            cols.push(block.iter().map(|row| row[c]).collect());
        }
    }
    cols
}

/// Numerical column rank of a stacked column list via the eigenvalues of its Gram matrix.
///
/// Forms `Γ = ColsᵀCols` (each entry an inner product of two effective columns), takes its
/// spectrum with [`crate::fim::sym_eig`], and counts eigenvalues exceeding `rel_tol · λ_max`.
/// Because `Γ` is a Gram (singular-value-squared) matrix, this `rel_tol` matches the
/// pseudo-inverse threshold that builds `P⊥`; see [`byzantine_bound`] for the tolerance
/// rationale and the spectral-gap guarantee.
fn effective_column_rank(cols: &[Vec<f64>], rel_tol: f64) -> usize {
    let t = cols.len();
    if t == 0 {
        return 0;
    }
    let mut gram = vec![vec![0.0_f64; t]; t];
    for (i, ci) in cols.iter().enumerate() {
        for (j, cj) in cols.iter().enumerate().skip(i) {
            let dot: f64 = ci.iter().zip(cj.iter()).map(|(&a, &b)| a * b).sum();
            gram[i][j] = dot;
            gram[j][i] = dot;
        }
    }
    let eig = crate::fim::sym_eig(&gram);
    let lam_max = eig.values.last().copied().unwrap_or(0.0);
    if lam_max <= 0.0 {
        return 0;
    }
    let thr = rel_tol * lam_max;
    eig.values.iter().filter(|&&v| v > thr).count()
}

/// All size-`k` index subsets of `{0..n}` (lexicographic), for exact coalition enumeration.
fn combinations(n: usize, k: usize) -> Vec<Vec<usize>> {
    let mut result = Vec::new();
    if k == 0 || k > n {
        return result;
    }
    let mut c: Vec<usize> = (0..k).collect();
    loop {
        result.push(c.clone());
        // Advance to the next combination in lexicographic order.
        let mut i = k;
        loop {
            if i == 0 {
                return result;
            }
            i -= 1;
            if c[i] < n - k + i {
                c[i] += 1;
                for j in (i + 1)..k {
                    c[j] = c[j - 1] + 1;
                }
                break;
            }
        }
    }
}

/// Byzantine block-spark bound: how many arbitrarily-faulty (colluding) peers the parity
/// monitor can DETECT and uniquely IDENTIFY, as a function of network geometry.
///
/// This is the geometric instantiation of the error-correcting-code / sparse-observability
/// bound for secure state estimation. A Byzantine peer injects an *arbitrary* linear
/// combination of the measurements it participates in; the network detects a coalition of
/// `≤ f` such peers iff every union of `≤ f` peer attack-blocks — projected into the parity
/// space — has **full column rank**, and uniquely identifies the faulty coalition iff every
/// union of `≤ 2f` blocks does. The controlling invariant is the *block spark*: the smallest
/// number of peer-blocks whose stacked effective signatures are linearly dependent — the
/// block-wise analog of the matrix spark of Donoho & Elad (2003) and the sparse-recovery
/// threshold of Candès & Tao (2005), and the observability-under-attack condition of
/// Fawzi, Tabuada & Diggavi (2014, "Secure estimation and control for cyber-physical systems
/// under adversarial attacks"; Shoukry & Tabuada 2016). "Byzantine" denotes the
/// arbitrary/colluding fault MODEL only (Lamport, Shostak & Pease 1982); the result is a
/// coding/observability bound (detect `> f`, identify `> 2f`) and is unrelated — in both
/// quantity and threshold — to the message-passing consensus bound.
///
/// # Effective signatures and detectability
/// For peer `j` with attack block `B_j` (columns = the measurements it can corrupt, from
/// [`peer_signature`]), the *effective signature* is `Ḡ_j = P⊥·B_j`: the attack surface as
/// it appears in the parity residual. An injected fault is undetectable iff it lies in
/// `range(G)`, i.e. iff `P⊥` annihilates it. Crucially, a single peer is undetectable not
/// only when `Ḡ_j = 0`, but whenever `Ḡ_j` is **column-rank-deficient**: the adversary then
/// solves for the null combination of its own measurements — a *nonzero* attack whose
/// projection lands in `range(G)` and leaves no residual — even though other combinations
/// (for instance individual columns) are perfectly detectable. Detectability of a peer is
/// therefore FULL COLUMN RANK of `Ḡ_j`, **not** merely `Ḡ_j ≠ 0`.
///
/// # Definitions (as implemented)
/// `block_spark` is the smallest `k` for which some size-`k` union `{Ḡ_j : j ∈ T}` is
/// column-rank-deficient (`rank([Ḡ_j]_{j∈T}) < Σ_{j∈T} cols(Ḡ_j)`), found by exact
/// enumeration over coalitions of increasing size. If no coalition up to the search bound is
/// dependent, `block_spark` is one more than that bound. Then
/// * `f_detect  = block_spark − 1`  (detect `≤ f`  ⟺ block_spark `> f`),
/// * `f_identify = ⌊(block_spark − 1) / 2⌋`  (identify `≤ f` ⟺ block_spark `> 2f`).
///
/// # Rank tolerance
/// Column rank is the number of Gram eigenvalues of the stacked effective columns exceeding
/// `rel_tol · λ_max`. `rel_tol` should match the pseudo-inverse threshold that builds `P⊥`
/// (`1e-9`): both act on Gram-type (singular-value-squared) spectra, so the choice is
/// consistent. A genuine attack dependency (a combination in `range(G)`) projects to
/// `~1e-16` relative Gram mass, whereas the network's weakly-conditioned observable direction
/// (relative eigenvalue `≈ 5.7e-6`, safely above `1e-9`) is correctly retained inside
/// `range(G)` and annihilated by `P⊥`; the resulting spectral gap makes the rank decision
/// robust despite that weak direction (verified in the module tests).
///
/// # Enumeration cap
/// Coalitions are enumerated up to [`MAX_COALITION`] peers; the search stops at the first
/// dependent coalition, so the realised cost is `C(M, block_spark)`. If the number of peers
/// exceeds the cap and NO dependent coalition of size `≤ MAX_COALITION` exists, `block_spark`
/// is returned as the conservative lower bound `MAX_COALITION + 1` (hence `f_detect` and
/// `f_identify` are lower bounds). This truncation is explicit, never silent; representative
/// constellations have few peers, so the result is exact.
pub fn byzantine_bound(
    peer_blocks: &[Vec<Vec<f64>>],
    pperp: &[Vec<f64>],
    rel_tol: f64,
) -> ByzantineClass {
    let m = peer_blocks.len();

    // Effective signatures Ḡ_j = P⊥·B_j (the parity-space attack surface of each peer).
    let eff: Vec<Vec<Vec<f64>>> = peer_blocks
        .iter()
        .map(|b| project_block(pperp, b))
        .collect();

    // block_spark = smallest coalition size whose stacked effective columns are dependent.
    let cap = m.min(MAX_COALITION);
    let mut block_spark = None;
    'search: for k in 1..=cap {
        for subset in combinations(m, k) {
            let cols = stack_columns(&eff, &subset);
            let total = cols.len();
            if total == 0 {
                continue;
            }
            if effective_column_rank(&cols, rel_tol) < total {
                block_spark = Some(k);
                break 'search;
            }
        }
    }
    // No dependent coalition within the search bound ⇒ block_spark exceeds it (exact when the
    // cap was not binding, i.e. `cap == m`; a conservative lower bound otherwise).
    let bs = block_spark.unwrap_or(cap + 1);
    ByzantineClass {
        f_detect: bs - 1,
        f_identify: (bs - 1) / 2,
        block_spark: bs,
    }
}

// ── Holdover temporal-gauge floor ────────────────────────────────────────────────────

/// Result of the autonomous-holdover temporal-gauge analysis.
///
/// In an ensemble of autonomous lunar nodes connected only by inter-node measurements,
/// the network shares no external time anchor. The common clock rate — a uniform
/// increment `δα_j += 1 ∀j` — is a classical *ensemble-time free parameter* (Percival
/// 1978; Lewandowski & Thomas 1991): any rescaling of the shared timescale leaves every
/// differential observable unchanged. This is the temporal analog of the rigid-frame
/// gauge in position estimation, and it is the genuine holdover floor of the
/// constellation: no amount of additional inter-node ranging can break it. An external
/// time tie — a direct link to an off-network reference — is the only remedy. In the
/// lunar setting this free parameter acquires fresh content: the network's best estimate
/// of its own epoch rate drifts freely, anchored only by the ephemeris when a VLBI or
/// laser-ranging tie is available. The test that `rate_in_gauge` flips from `true` to
/// `false` when such a tie is added distinguishes the genuine gauge from an artefact
/// of the oscillator model.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct HoldoverFloor {
    /// `true` iff the common clock-rate generator lies in `N(GᵀWG)` — the holdover
    /// floor is a genuine gauge direction unobservable from inter-node data alone.
    pub rate_in_gauge: bool,
    /// Number of temporal gauge generators (common offset and common rate) that are
    /// currently in `N(GᵀWG)`. Equal to 2 for a fully self-referential network, 1 if
    /// an external rate tie is present but not an offset tie, and 0 when both are anchored.
    pub temporal_gauge_dim: usize,
}

/// Autonomous-holdover temporal-gauge floor for an inter-node measurement network.
///
/// The two temporal gauge generators from [`datum_gauge_generators`] — common offset
/// (`gauge_generators[n−2]`) and common rate (`gauge_generators[n−1]`) — are tested
/// against the null space of the per-node Fisher information matrix `info`. A generator
/// `g` is in `N(info)` when
///
/// ```text
/// ‖info · g‖ / (‖info‖_F · ‖g‖) < rel_tol
/// ```
///
/// i.e. `info` annihilates it up to the relative tolerance `rel_tol`. This formulation
/// is numerically invariant under scaling of `info` or `g`, matching the relative
/// thresholds used throughout the spectral rank analysis.
///
/// `rate_in_gauge` reports whether the common rate is unobservable from the supplied
/// data. `temporal_gauge_dim` counts how many of the two temporal generators are
/// currently gauged. An external time tie (e.g. a row from
/// [`crate::lunar_gauge::rate_tie_row`]) that constrains the absolute rate of one node
/// suffices to break the common-rate gauge: the resulting flattened information matrix
/// has `rate_in_gauge = false` and `temporal_gauge_dim < 2`. This is the key C2 result:
/// the holdover floor is a *genuine* ensemble-time free parameter, not a consequence of
/// the oscillator model, and an external tie is both necessary and sufficient to remove it.
pub fn holdover_floor(
    info: &[Vec<f64>],
    gauge_generators: &[Vec<f64>],
    rel_tol: f64,
) -> HoldoverFloor {
    // ‖info · g‖ / (‖info‖_F · ‖g‖) < rel_tol ⟺ g ∈ N(info) up to rel_tol.
    let in_null = |g: &[f64]| -> bool {
        let info_g: Vec<f64> = info
            .iter()
            .map(|row| row.iter().zip(g.iter()).map(|(&a, &b)| a * b).sum())
            .collect();
        let norm_ig: f64 = info_g.iter().map(|&x| x * x).sum::<f64>().sqrt();
        let norm_info: f64 = info
            .iter()
            .flat_map(|r| r.iter())
            .map(|&x| x * x)
            .sum::<f64>()
            .sqrt();
        let norm_g: f64 = g.iter().map(|&x| x * x).sum::<f64>().sqrt();
        norm_info > 0.0 && norm_g > 0.0 && norm_ig / (norm_info * norm_g) < rel_tol
    };

    let n = gauge_generators.len();
    // Common clock-rate generator: the last of the N_DATUM_GAUGE generators (index 7 for
    // the standard 8-generator ordering: 3 translations, 3 rotations, offset, rate).
    let rate_in_gauge = n > 0 && in_null(&gauge_generators[n - 1]);

    // Temporal gauge dimension: count offset (n−2) and rate (n−1) generators in N(info).
    let temporal_gauge_dim = if n >= 2 {
        let offset_in_gauge = in_null(&gauge_generators[n - 2]);
        usize::from(offset_in_gauge) + usize::from(rate_in_gauge)
    } else {
        usize::from(rate_in_gauge)
    };

    HoldoverFloor {
        rate_in_gauge,
        temporal_gauge_dim,
    }
}

// ── Protection-gap slope (Brown slope, g7) ───────────────────────────────────────────

/// Brown protection-gap slope: the ratio of induced observable-state error to
/// detectable parity.
///
/// For a measurement fault vector `b ∈ ℝⁿ`, the least-squares estimator shifts by
///
/// ```text
/// Δx̂ = (GᵀWG)⁺ Gᵀ W b
/// ```
///
/// (pseudo-inverse estimator response; `(GᵀWG)⁺` computed spectrally via
/// [`crate::fim::crlb`]). The observable part of this shift is `Π_obs Δx̂` where
/// `Π_obs` = `obs_proj` (the projection onto the observable subspace of the state,
/// supplied by the caller as `I − N Nᵀ` with `N` the null-space basis of `GᵀWG`).
/// The Brown protection-gap slope (Brown 1992, "A baseline GPS RAIM scheme and a note
/// on the equivalence of three RAIM methods") is
///
/// ```text
/// slope(b) = ‖Π_obs Δx̂‖ / ‖P⊥b‖_W
/// ```
///
/// where `‖v‖_W = (vᵀ W v)^{1/2}` is the weighted norm. For a fault `b ∈ range(G)`:
/// the parity `P⊥b = 0` (no residual, by range annihilation), so the denominator
/// vanishes while the numerator is finite — the estimator is corrupted with no
/// detectable signature. This is the protection gap (g7): such faults are undetectable
/// regardless of the detection threshold. When `‖P⊥b‖_W` is below `1e-12` the
/// function returns [`f64::INFINITY`] to signal this singularity. For a fault
/// `b ∉ range(G)` (detectable), the parity is nonzero and the slope is finite.
///
/// `pperp` is the `n × n` parity projector, `w` the `n`-vector of weights, `g` the
/// `n × state_dim` Jacobian, `b` the `n`-vector fault, and `obs_proj` the
/// `state_dim × state_dim` observable-subspace projector.
pub fn slope(
    pperp: &[Vec<f64>],
    w: &[f64],
    g: &[Vec<f64>],
    b: &[f64],
    obs_proj: &[Vec<f64>],
) -> f64 {
    let n_meas = g.len();
    if n_meas == 0 {
        return 0.0;
    }
    let state_dim = g[0].len();

    // Build GᵀWG (state_dim × state_dim).
    let mut ntm = vec![vec![0.0_f64; state_dim]; state_dim];
    for (i, row) in g.iter().enumerate() {
        let wi = w[i];
        for p in 0..state_dim {
            let jwi = row[p] * wi;
            if jwi == 0.0 {
                continue;
            }
            for q in 0..state_dim {
                ntm[p][q] += jwi * row[q];
            }
        }
    }

    // (GᵀWG)⁺ via spectral pseudo-inverse.
    let nplus = crate::fim::crlb(&ntm, 1e-9).pseudo_covariance;

    // GᵀWb = Σ_i w[i] · g[i] · b[i].
    let mut gtw_b = vec![0.0_f64; state_dim];
    for (i, row) in g.iter().enumerate() {
        let wb = w[i] * b[i];
        if wb == 0.0 {
            continue;
        }
        for p in 0..state_dim {
            gtw_b[p] += row[p] * wb;
        }
    }

    // Δx̂ = nplus · GᵀWb.
    let dx: Vec<f64> = nplus
        .iter()
        .map(|row| row.iter().zip(gtw_b.iter()).map(|(&nv, &gv)| nv * gv).sum())
        .collect();

    // Observable part: obs_proj · Δx̂ (state_dim-vector); numerator = ‖·‖.
    let obs_dx: Vec<f64> = obs_proj
        .iter()
        .map(|row| row.iter().zip(dx.iter()).map(|(&ov, &dv)| ov * dv).sum())
        .collect();
    let numerator: f64 = obs_dx.iter().map(|&x| x * x).sum::<f64>().sqrt();

    // Parity P⊥b.
    let pb: Vec<f64> = pperp
        .iter()
        .map(|row| row.iter().zip(b.iter()).map(|(&pv, &bv)| pv * bv).sum())
        .collect();

    // Weighted parity norm ‖P⊥b‖_W = sqrt(Σ_i w[i] · (P⊥b)_i²).
    let denom_sq: f64 = pb.iter().zip(w.iter()).map(|(&v, &wi)| wi * v * v).sum();
    let denom = denom_sq.sqrt();

    if denom < 1e-12 {
        f64::INFINITY
    } else {
        numerator / denom
    }
}

// ── Provider-mismatch common/differential split (T5) ─────────────────────────────────

/// Detectability classification of the common and differential components of a
/// multi-provider ranging bias.
///
/// When ranging measurements from two providers share a common systematic offset (e.g.
/// a tropospheric model error or a shared clock reference), the resulting common
/// measurement bias lies in `range(G)` and is undetectable by any parity-based monitor:
/// the network cannot distinguish it from a change in the estimated state. A differential
/// mismatch — a bias that affects only the measurements of one provider and not the other
/// — projects to a nonzero parity residual and is therefore internally detectable whenever
/// cross-provider links exist. This is the multi-provider interop floor (T5): common-mode
/// biases require an external reference to resolve, while differential biases are
/// self-detectable from the network's own parity monitor.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct ProviderSplit {
    /// `true` iff the common provider bias is detectable (parity norm > tolerance).
    /// Expected `false` for a bias shared across all providers (lies in `range(G)`).
    pub common_detectable: bool,
    /// `true` iff the differential provider bias is detectable (parity norm > tolerance).
    /// Expected `true` when the bias is supported on a proper measurement subset not
    /// absorbed into a state error by the estimator.
    pub differential_detectable: bool,
}

/// Classify a provider-mismatch bias into its common (undetectable) and differential
/// (detectable) components.
///
/// Each component is tested via [`is_detectable`]: `‖P⊥·block‖ > tol`. The common
/// component is expected to satisfy `block ∈ range(G)` (absorbed entirely into a state
/// shift, leaving no parity residual), while the differential component has `P⊥·block ≠ 0`
/// (the inter-provider inconsistency is visible in the residual space). Together the two
/// results quantify the T5 interop floor: common calibration errors need external tie;
/// differential errors are self-monitored.
pub fn provider_mismatch_split(
    common_block: &[f64],
    differential_block: &[f64],
    pperp: &[Vec<f64>],
    tol: f64,
) -> ProviderSplit {
    let (common_detectable, _) = is_detectable(pperp, common_block, tol);
    let (differential_detectable, _) = is_detectable(pperp, differential_block, tol);
    ProviderSplit {
        common_detectable,
        differential_detectable,
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::lunar_gauge::{classify_null_space, IDX_RATE, IDX_SCALE};

    /// 2024-01-01 TT (JD 2460310.5), inside the DE440 fixture window.
    const T0: f64 = (2_460_310.5 - 2_451_545.0) / 36_525.0;

    /// Four epochs at two-day steps inside the DE440 fixture window.
    fn epochs() -> [f64; 4] {
        std::array::from_fn(|k| T0 + (k as f64) * 2.0 / 36_525.0)
    }

    /// A representative set of lunar-frame network nodes (PA body-frame metres): the five
    /// near-side reflectors plus one elevated relay node, giving diverse inter-node baselines.
    fn network_nodes() -> Vec<Vec3> {
        let mut nodes: Vec<Vec3> = crate::lunar_llr_geometry::reflectors()
            .iter()
            .map(|r| r.pa_body_m)
            .collect();
        // An elevated relay/tower node (~2.0e6 m radius) for baseline diversity.
        nodes.push([1_600_000.0, 700_000.0, 900_000.0]);
        nodes
    }

    /// Stack differential inter-node range rows over all node pairs and all epochs.
    fn free_network_rows() -> Vec<[f64; N_GAUGE]> {
        let nodes = network_nodes();
        let eps = epochs();
        let mut rows = Vec::new();
        for &t in &eps {
            for i in 0..nodes.len() {
                for j in (i + 1)..nodes.len() {
                    rows.push(differential_range_row(nodes[i], nodes[j], t));
                }
            }
        }
        rows
    }

    /// A rigid frame perturbation (translation or rotation) preserves every inter-node
    /// range, so the differential row must vanish on the translation columns (0,1,2) and
    /// the rotation columns (4,5,6); a scale perturbation stretches the baseline, so the
    /// scale column (3) must be nonzero.
    #[test]
    fn differential_row_rigid_transform_invariance() {
        let refl = crate::lunar_llr_geometry::reflectors();
        let node_a = refl[0].pa_body_m; // Apollo11
        let node_b = refl[3].pa_body_m; // Lunokhod1 (well-separated baseline)
        let row = differential_range_row(node_a, node_b, T0);

        // Translation columns: exactly zero (translation Jacobian is node-independent).
        for c in [0_usize, 1, 2] {
            assert!(
                row[c].abs() < 1e-9,
                "translation col {c} must vanish (rigid gauge), got {}",
                row[c]
            );
        }
        // Rotation columns: analytically zero (û ∥ Δr ⇒ û·(â_k × Δr) = 0).
        for c in [4_usize, 5, 6] {
            assert!(
                row[c].abs() < 1e-9,
                "rotation col {c} must vanish (rigid gauge), got {}",
                row[c]
            );
        }
        // Scale column: nonzero, equal to the inter-node baseline length.
        assert!(
            row[IDX_SCALE].abs() > 1.0,
            "scale col must be observable (nonzero), got {}",
            row[IDX_SCALE]
        );

        // The temporal columns are zero (common timescale cancels in the differential).
        assert_eq!(
            row[IDX_OFFSET], 0.0,
            "IDX_OFFSET must be 0 (common cancels)"
        );
        assert_eq!(row[IDX_RATE], 0.0, "IDX_RATE must be 0 (common cancels)");
    }

    /// The scale column equals the inter-node baseline length `‖p_a − p_b‖` (a fractional
    /// scale change stretches the baseline by that amount), and it is epoch-independent for
    /// fixed lunar-frame nodes because a rigid rotation preserves the distance.
    #[test]
    fn differential_scale_column_equals_baseline_length() {
        let refl = crate::lunar_llr_geometry::reflectors();
        let a = refl[0].pa_body_m;
        let b = refl[2].pa_body_m;
        let baseline =
            ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt();
        for &t in &epochs() {
            let row = differential_range_row(a, b, t);
            let rel = (row[IDX_SCALE].abs() - baseline).abs() / baseline;
            assert!(
                rel < 1e-9,
                "scale col {} must equal baseline {} (rel {}), epoch {}",
                row[IDX_SCALE],
                baseline,
                rel,
                t
            );
        }
    }

    /// An inter-node clock difference carries no common-datum information: both the common
    /// offset and the common rate cancel, so the row is the zero nine-vector.
    #[test]
    fn differential_clock_tie_common_cancels() {
        let row = differential_clock_tie_row();
        assert_eq!(row[IDX_OFFSET], 0.0, "common offset must cancel");
        assert_eq!(row[IDX_RATE], 0.0, "common rate must cancel");
        assert!(
            row.iter().all(|&v| v == 0.0),
            "inter-node clock tie carries no common-datum information: {row:?}"
        );
    }

    /// THE GATE. A representative multi-node, multi-epoch real-DE440 free-network of
    /// differential inter-node range rows has datum defect exactly eight — the free-network
    /// gauge `N(G) = span{3 translations, 3 rotations, common offset, common rate}` — with
    /// scale the one observable degree of freedom. If this defect is not eight (or scale is
    /// unobservable) the self-referential reframe is wrong.
    #[test]
    fn free_network_gauge_is_eight() {
        let rows = free_network_rows();
        assert!(
            rows.len() >= 40,
            "network must be representative (many rows)"
        );
        let info = assemble_faultobs_info(&[(rows, 1.0)]);
        let cls = classify_null_space(&info, 1e-9);

        // Datum defect is exactly eight.
        assert_eq!(
            cls.defect, 8,
            "free-network datum defect must be 8, got {cls:?}"
        );
        // Six purely-spatial gauge directions: three translations + three rotations.
        assert_eq!(
            cls.dim_spatial, 6,
            "dim_spatial must be 6 (3 transl + 3 rot)"
        );
        // Two purely-temporal gauge directions: common offset + common rate.
        assert_eq!(
            cls.dim_temporal, 2,
            "dim_temporal must be 2 (offset + rate)"
        );
        // No spatial-temporal coupling in the free-network gauge.
        assert_eq!(cls.coupled_dim, 0, "coupled_dim must be 0");
        assert!(
            cls.p_st_norm < 1e-9,
            "p_st_norm must be ~0 (direct-sum gauge), got {}",
            cls.p_st_norm
        );

        // Scale (IDX_SCALE) is observable: its Fisher diagonal is bounded well away from zero
        // and dominates every other diagonal entry (all rigid/temporal columns are ~0).
        let scale_info = info[IDX_SCALE][IDX_SCALE];
        assert!(
            scale_info > 1.0,
            "scale diagonal must be well-conditioned (>1), got {scale_info}"
        );
        for (i, rowm) in info.iter().enumerate() {
            if i != IDX_SCALE {
                assert!(
                    rowm[i] <= 1e-6 * scale_info,
                    "non-scale diagonal [{i}] must be negligible vs scale, got {}",
                    rowm[i]
                );
            }
        }
    }

    // ── Per-node state-model verification ───────────────────────────────────────────

    /// Body-frame PA positions of the representative per-node network: the five near-side
    /// reflectors plus three relay nodes placed in distinct octants and at different radii
    /// so the complete inter-node graph affinely spans three dimensions (generic global
    /// rigidity ⇒ the rigid-motion defect is exactly six).
    ///
    /// Network: `M = 8` nodes ⇒ `state_dim = 40`.
    fn pernode_body_nodes() -> Vec<Vec3> {
        let mut nodes: Vec<Vec3> = crate::lunar_llr_geometry::reflectors()
            .iter()
            .map(|r| r.pa_body_m)
            .collect();
        nodes.push([1_600_000.0, 700_000.0, 900_000.0]);
        nodes.push([-1_200_000.0, 1_000_000.0, -800_000.0]);
        nodes.push([300_000.0, -1_500_000.0, 1_100_000.0]);
        nodes
    }

    /// Real-DE440 Moon-relative inertial node positions at the reference epoch `T0`.
    fn pernode_inertial(nodes: &[Vec3]) -> Vec<[f64; 3]> {
        nodes
            .iter()
            .map(|&b| crate::lunar_orientation::de440_moon_pa_body_to_inertial(b, T0))
            .collect()
    }

    /// Distinct clock-integration windows (seconds); ≥ 2 elapsed baselines separate each
    /// node's offset from its rate, so the temporal defect is exactly two (common offset +
    /// common rate) rather than collapsing offset and rate together.
    const PERNODE_ELAPSED_S: [f64; 3] = [21_600.0, 43_200.0, 86_400.0];

    /// Stack differential one-way range rows over every node pair and every elapsed window.
    /// Pairs = C(8,2) = 28, windows = 3 ⇒ 84 rows (≥ state_dim − 8 = 32 with margin).
    fn pernode_rows(layout: &NetworkLayout, inertial: &[[f64; 3]]) -> Vec<(Vec<f64>, f64)> {
        let m = layout.n_nodes;
        let mut rows = Vec::new();
        for a in 0..m {
            for b in (a + 1)..m {
                let d = [
                    inertial[a][0] - inertial[b][0],
                    inertial[a][1] - inertial[b][1],
                    inertial[a][2] - inertial[b][2],
                ];
                let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
                let u = [d[0] / n, d[1] / n, d[2] / n];
                for &elapsed in &PERNODE_ELAPSED_S {
                    rows.push((pernode_range_row(layout, a, b, u, elapsed), 1.0));
                }
            }
        }
        rows
    }

    fn mat_vec(m: &[Vec<f64>], v: &[f64]) -> Vec<f64> {
        m.iter()
            .map(|row| row.iter().zip(v).map(|(&a, &b)| a * b).sum())
            .collect()
    }

    fn vnorm(v: &[f64]) -> f64 {
        v.iter().map(|&x| x * x).sum::<f64>().sqrt()
    }

    fn fro(m: &[Vec<f64>]) -> f64 {
        m.iter()
            .flat_map(|r| r.iter())
            .map(|&x| x * x)
            .sum::<f64>()
            .sqrt()
    }

    /// Each of the eight `datum_gauge_generators` lies in the null space of the per-node
    /// information matrix: the 8-dim datum⊕timescale gauge is genuine in per-node
    /// coordinates (the free-network gauge embedded per node).
    #[test]
    fn pernode_gauge_generators_are_null() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let rows = pernode_rows(&layout, &inertial);
        let info = assemble_pernode_info(&rows, layout.state_dim);
        let gens = datum_gauge_generators(&layout, &inertial);
        assert_eq!(gens.len(), 8, "eight datum⊕timescale gauge generators");

        let info_fro = fro(&info);
        for (idx, g) in gens.iter().enumerate() {
            let v = mat_vec(&info, g);
            let rel = vnorm(&v) / (info_fro * vnorm(g));
            assert!(
                rel < 1e-8,
                "gauge generator {idx} must lie in N(GᵀWG): relative residual {rel:.3e}"
            );
        }
    }

    /// rank(GᵀWG) = state_dim − 8: the eight-dimensional gauge is the ENTIRE null space,
    /// so range(G) has dimension state_dim − 8 (rich, not rank-1) and the parity space is
    /// non-trivial. A clear spectral gap separates the eight null eigenvalues from the
    /// observable spectrum, so the rank is genuine (not a threshold artifact).
    #[test]
    fn pernode_rank_is_state_dim_minus_eight() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let rows = pernode_rows(&layout, &inertial);
        let info = assemble_pernode_info(&rows, layout.state_dim);
        assert!(
            rows.len() >= layout.state_dim - 8,
            "network must have ≥ state_dim − 8 rows for the true rank"
        );

        let eig = crate::fim::sym_eig(&info);
        let lam_max = *eig.values.last().unwrap();
        let expected_rank = layout.state_dim - 8;

        // Matched relative threshold; count observable eigenvalues.
        let thr = 1e-9 * lam_max;
        let rank = eig.values.iter().filter(|&&v| v > thr).count();
        assert_eq!(
            rank, expected_rank,
            "rank(GᵀWG) must be state_dim − 8 = {expected_rank}, got {rank}; eigenvalues {:?}",
            eig.values
        );

        // Clear spectral gap: the eight null eigenvalues are numerically zero relative to
        // the spectrum, and the smallest observable eigenvalue is well separated.
        let null_max = eig.values[7];
        let obs_min = eig.values[8];
        assert!(
            null_max < 1e-9 * lam_max,
            "eighth eigenvalue must be numerically null: {null_max:.3e} vs λ_max {lam_max:.3e}"
        );
        assert!(
            obs_min > 1e-6 * lam_max,
            "smallest observable eigenvalue must be well separated: {obs_min:.3e} vs λ_max {lam_max:.3e}"
        );
        let gap = obs_min / null_max.abs().max(f64::MIN_POSITIVE);
        assert!(
            gap > 1e6,
            "spectral gap between null and observable subspaces must be clear: {gap:.3e}"
        );
    }

    /// The global-scale generator (δp_j += p_j for all nodes) is NOT in the null space:
    /// a fractional scale change stretches every baseline, so scale is observable and is
    /// therefore NOT one of the eight gauge generators (consistent with the differential
    /// scale-observability result).
    #[test]
    fn pernode_scale_is_observable() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let rows = pernode_rows(&layout, &inertial);
        let info = assemble_pernode_info(&rows, layout.state_dim);

        // Global-scale generator: δp_j += p_j (inertial position), clocks untouched.
        let mut scale_gen = vec![0.0_f64; layout.state_dim];
        for (j, &p) in inertial.iter().enumerate() {
            let base = layout.pos_idx(j);
            scale_gen[base] = p[0];
            scale_gen[base + 1] = p[1];
            scale_gen[base + 2] = p[2];
        }

        let v = mat_vec(&info, &scale_gen);
        let rel = vnorm(&v) / (fro(&info) * vnorm(&scale_gen));
        assert!(
            rel > 1e-3,
            "scale must be observable (not gauged): relative residual {rel:.3e} must be bounded away from 0"
        );
    }

    // ── Parity projector ────────────────────────────────────────────────────────────

    /// Extract the n×state_dim Jacobian matrix G and per-measurement weights w = 1/σ²
    /// from [`pernode_rows`] output, ready for [`parity_projector`].
    fn pernode_g_and_w(layout: &NetworkLayout, inertial: &[[f64; 3]]) -> (Vec<Vec<f64>>, Vec<f64>) {
        let rows = pernode_rows(layout, inertial);
        let g = rows.iter().map(|(r, _)| r.clone()).collect();
        let w = rows
            .iter()
            .map(|(_, sigma)| 1.0 / (sigma * sigma))
            .collect();
        (g, w)
    }

    /// Dense matrix product A · B.
    fn mat_mul(a: &[Vec<f64>], b: &[Vec<f64>]) -> Vec<Vec<f64>> {
        let ncols = b.first().map_or(0, |r| r.len());
        a.iter()
            .map(|a_row| {
                (0..ncols)
                    .map(|j| a_row.iter().zip(b.iter()).map(|(&ai, bi)| ai * bi[j]).sum())
                    .collect()
            })
            .collect()
    }

    /// Element-wise max |A[i][j] − B[i][j]|.
    fn max_abs_diff(a: &[Vec<f64>], b: &[Vec<f64>]) -> f64 {
        a.iter()
            .zip(b.iter())
            .flat_map(|(ra, rb)| ra.iter().zip(rb.iter()).map(|(&ai, &bi)| (ai - bi).abs()))
            .fold(0.0_f64, f64::max)
    }

    /// P⊥ is idempotent: ‖P⊥² − P⊥‖_max < 1e-9.
    ///
    /// Idempotence follows from the Moore–Penrose condition Nplus·N·Nplus = Nplus:
    /// P_G² = G·Nplus·GᵀW·G·Nplus·GᵀW = G·Nplus·N·Nplus·GᵀW = G·Nplus·GᵀW = P_G,
    /// so P⊥ = I − P_G satisfies P⊥² = P⊥.
    #[test]
    fn parity_projector_idempotent() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let pp2 = mat_mul(&pperp, &pperp);
        let err = max_abs_diff(&pp2, &pperp);
        assert!(
            err < 1e-9,
            "P⊥ must be idempotent: ‖P⊥² − P⊥‖_max = {err:.3e}"
        );
    }

    /// W·P⊥ is symmetric: ‖W·P⊥ − (W·P⊥)ᵀ‖_max < 1e-9.
    ///
    /// P⊥ is W-self-adjoint (symmetric under the weighted inner product ‹u,v›_W = uᵀWv).
    /// P⊥ itself is NOT ordinary-symmetric when W ≠ I — this is the correct test.
    #[test]
    fn parity_projector_w_self_adjoint() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let n = pperp.len();
        // (WP⊥)[i][j] = w[i] · P⊥[i][j]; symmetry: (WP⊥)[i][j] == (WP⊥)[j][i].
        let mut max_err = 0.0_f64;
        for i in 0..n {
            for j in 0..n {
                let wp_ij = w[i] * pperp[i][j];
                let wp_ji = w[j] * pperp[j][i];
                max_err = max_err.max((wp_ij - wp_ji).abs());
            }
        }
        assert!(
            max_err < 1e-9,
            "WP⊥ must be symmetric: ‖WP⊥ − (WP⊥)ᵀ‖_max = {max_err:.3e}"
        );
    }

    /// P⊥ annihilates every column of G: ‖P⊥G‖_max < 1e-8.
    ///
    /// Any measurement fault explainable by a state error lies in range(G) and is
    /// annihilated by P⊥ — it leaves no parity residual and is undetectable.
    #[test]
    fn parity_projector_annihilates_range_g() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let state_dim = g[0].len();
        // Iterate over columns of G via closure indexing (avoids needless_range_loop).
        let max_err = (0..state_dim)
            .map(|c| {
                let g_col: Vec<f64> = g.iter().map(|row| row[c]).collect();
                let ppg = mat_vec(&pperp, &g_col);
                ppg.iter().map(|&v| v.abs()).fold(0.0_f64, f64::max)
            })
            .fold(0.0_f64, f64::max);
        assert!(
            max_err < 1e-8,
            "P⊥ must annihilate range(G): ‖P⊥G‖_max = {max_err:.3e}"
        );
    }

    /// T1 RAIM detectability condition: b ∈ range(G) ⇒ undetectable (‖P⊥b‖ ≈ 0);
    /// generic b ∉ range(G) ⇒ detectable (‖P⊥b‖ > 0).
    ///
    /// In-range fault: b = G·x for x = e_{clock-offset of node 1} (a non-gauge direction),
    /// so P⊥·b = P⊥·G·x = 0 by range annihilation. Generic fault: e_0 in measurement
    /// space (a single-measurement bias not in the 32-dim range(G) ⊂ ℝ^84).
    #[test]
    fn detectability_t1_in_range_vs_generic() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let state_dim = g[0].len();
        let n_meas = g.len();

        // In-range fault: b = G·x, x = e_{clock-offset of node 1} — not a gauge direction.
        let mut x = vec![0.0_f64; state_dim];
        x[layout.off_idx(1)] = 1.0;
        let b_in: Vec<f64> = g
            .iter()
            .map(|row| row.iter().zip(x.iter()).map(|(&r, &xi)| r * xi).sum())
            .collect();
        let (det_in, norm_in) = is_detectable(&pperp, &b_in, 1e-8);
        assert!(
            !det_in,
            "fault in range(G) must be undetectable; ‖P⊥b‖ = {norm_in:.3e}"
        );
        assert!(
            norm_in < 1e-7,
            "‖P⊥b‖ for in-range fault must be near zero, got {norm_in:.3e}"
        );

        // Generic fault: unit vector e_0 in measurement space (not in range(G)).
        let mut b_out = vec![0.0_f64; n_meas];
        b_out[0] = 1.0;
        let (det_out, norm_out) = is_detectable(&pperp, &b_out, 1e-8);
        assert!(
            det_out,
            "generic fault must be detectable; ‖P⊥b‖ = {norm_out:.3e}"
        );
        assert!(
            norm_out > 1e-3,
            "‖P⊥b‖ for generic fault must be clearly nonzero, got {norm_out:.3e}"
        );
    }

    // ── MDB + peer fault signatures ────────────────────────────────────────────────

    /// Build per-node G and w with UNEQUAL per-measurement sigmas (W ≠ I).
    ///
    /// Cycles through σ ∈ {0.5, 1.0, 2.0}, giving weights {4.0, 1.0, 0.25} repeating.
    /// This guarantees cᵀWP⊥c ≠ cᵀP⊥WP⊥c (the double-`P⊥` form) for generic c since
    /// W ≠ I, and also exercises the weighted code path that the earlier W=I tests left
    /// uncovered.
    fn pernode_g_and_w_unequal(
        layout: &NetworkLayout,
        inertial: &[[f64; 3]],
    ) -> (Vec<Vec<f64>>, Vec<f64>) {
        let rows = pernode_rows(layout, inertial);
        let sigmas = [0.5_f64, 1.0, 2.0];
        let g: Vec<Vec<f64>> = rows.iter().map(|(r, _)| r.clone()).collect();
        let w: Vec<f64> = rows
            .iter()
            .enumerate()
            .map(|(k, _)| {
                let s = sigmas[k % sigmas.len()];
                1.0 / (s * s)
            })
            .collect();
        (g, w)
    }

    /// THE KEY MDB TEST: pins cᵀWP⊥c, fails on the double-`P⊥` form cᵀP⊥WP⊥c.
    ///
    /// For fault direction c = e_0 and W ≠ I (weights {4.0, 1.0, 0.25}):
    ///   correct  q = cᵀ W P⊥ c   = Σᵢ w[i]·c[i]·(P⊥c)[i] = w[0]·P⊥[0][0]  (Baarda)
    ///   wrong    q = cᵀ P⊥ W P⊥ c = (P⊥ᵀc)ᵀ (W P⊥c)                       (double-P⊥ bug)
    ///
    /// The double-`P⊥` form cᵀP⊥WP⊥c coincides with the correct form only for W = I
    /// (where P⊥ = P⊥ᵀ); for W ≠ I it differs, and the test asserts rel_diff > 0.1 %,
    /// proving teeth. (Note the harmless identity `(P⊥c)ᵀW(P⊥c) = cᵀWP⊥c` for *every* W
    /// by W-self-adjointness + idempotence — that form is NOT the bug, so it is not used
    /// as the counterexample; see the in-body NOTE.)
    #[test]
    fn mdb_correct_vs_wrong_form_w_neq_i() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w_unequal(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let n = pperp.len();

        // c = e_0: first standard basis vector in measurement space — not in range(G).
        let mut c = vec![0.0_f64; n];
        c[0] = 1.0;

        // Correct form: q = cᵀ W P⊥ c = Σᵢ w[i]·c[i]·(P⊥c)[i].
        // For c = e_0 this reduces to w[0] · P⊥[0][0] (only i=0 row contributes).
        let pperp_c: Vec<f64> = mat_vec(&pperp, &c); // u = P⊥c
        let q_correct: f64 = c
            .iter()
            .zip(w.iter())
            .zip(pperp_c.iter())
            .map(|((&ci, &wi), &ui)| wi * ci * ui)
            .sum();

        // Wrong form: q = cᵀ P⊥ W P⊥ c = (P⊥ᵀc)ᵀ (W P⊥c).
        //
        // NOTE: (P⊥c)ᵀ W (P⊥c) = cᵀ P⊥ᵀ W P⊥ c is EQUAL to cᵀ W P⊥ c due to
        // W-self-adjointness + idempotence: (P⊥)ᵀW·P⊥ = WP⊥·P⊥ = WP⊥² = WP⊥, so
        // cᵀ P⊥ᵀ WP⊥ c = cᵀ WP⊥ c. That identity is NOT the bug.
        //
        // The actual bug is cᵀ P⊥ W P⊥ c (P⊥, not P⊥ᵀ, on the left):
        //   cᵀ P⊥ W P⊥ c = (P⊥ᵀ c)ᵀ (W P⊥ c)  ≠  cᵀ W P⊥ c  for W ≠ I
        // because P⊥ ≠ P⊥ᵀ when W ≠ I.
        //
        // Equivalently: P⊥ W P⊥ ≠ WP⊥ for non-uniform W, whereas W P⊥ = correct.
        let pperp_t_c: Vec<f64> = (0..n)
            .map(|j| {
                c.iter()
                    .zip(pperp.iter())
                    .map(|(&ci, row)| ci * row[j])
                    .sum::<f64>()
            })
            .collect(); // P⊥ᵀ c: component j = Σᵢ P⊥[i][j]·c[i]
        let w_pperp_c: Vec<f64> = w
            .iter()
            .zip(pperp_c.iter())
            .map(|(&wi, &ui)| wi * ui)
            .collect(); // W P⊥ c: component i = w[i]·(P⊥c)[i]
        let q_wrong: f64 = pperp_t_c
            .iter()
            .zip(w_pperp_c.iter())
            .map(|(&a, &b)| a * b)
            .sum(); // (P⊥ᵀ c)ᵀ (W P⊥ c) = cᵀ P⊥ W P⊥ c

        assert!(
            q_correct > 1e-10,
            "q_correct (cᵀWP⊥c) must be positive (e_0 is detectable): {q_correct:.6e}"
        );
        assert!(
            q_wrong > 1e-10,
            "q_wrong (cᵀP⊥WP⊥c) must be positive: {q_wrong:.6e}"
        );

        // THE CRITICAL ASSERTION: the two quadratic forms must differ for W ≠ I.
        // Mathematical reason: P⊥ W P⊥ ≠ WP⊥ because P⊥ ≠ P⊥ᵀ for W ≠ I.
        let rel_diff = (q_correct - q_wrong).abs() / q_correct.max(q_wrong);
        assert!(
            rel_diff > 1e-3,
            "correct cᵀWP⊥c={q_correct:.6} and wrong cᵀP⊥WP⊥c={q_wrong:.6} \
             must differ for W≠I: rel_diff={rel_diff:.4e} (test is toothless if this fails)"
        );

        // mdb() must use q_correct.
        let ncp = 17.075_f64; // λ₀ for P_fa=0.001, P_md=0.20 (Baarda 1968).
        let mdb_val = mdb(&pperp, &w, &c, ncp);
        let expected_correct = (ncp / q_correct).sqrt();
        let mdb_wrong_val = (ncp / q_wrong).sqrt();

        assert!(
            (mdb_val - expected_correct).abs() < 1e-12,
            "mdb() must use correct form: got {mdb_val:.8}, expected {expected_correct:.8}"
        );
        assert!(
            (mdb_val - mdb_wrong_val).abs() > 1e-4,
            "mdb() (correct={mdb_val:.6}) and wrong-form value ({mdb_wrong_val:.6}) must differ"
        );
    }

    /// MDB is positive and finite for a generic detectable direction; very large (or
    /// infinite) for an undetectable direction (c ∈ range(G), so cᵀWP⊥c ≈ 0).
    ///
    /// Note: the observable subspace has λ_min ≈ 3.1e-4 (weakly conditioned), so the
    /// test direction is chosen deliberately (e_0, a generic measurement-space unit
    /// vector) rather than a random direction that might straddle the weak direction.
    #[test]
    fn mdb_detectable_and_undetectable() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w_unequal(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let n = pperp.len();
        let state_dim = g[0].len();
        let ncp = 17.075_f64;

        // Detectable direction: e_0 — generic measurement-space unit vector, not in range(G).
        let mut c_det = vec![0.0_f64; n];
        c_det[0] = 1.0;
        let mdb_det = mdb(&pperp, &w, &c_det, ncp);
        assert!(
            mdb_det.is_finite() && mdb_det > 0.0,
            "MDB for detectable direction must be positive and finite, got {mdb_det}"
        );
        assert!(
            mdb_det < 1e6,
            "MDB for generic detectable direction must be modest, got {mdb_det}"
        );

        // Undetectable direction: b = G·x, x = e_{off_1} (clock offset of node 1).
        // P⊥b = 0, so cᵀWP⊥c ≈ 0 and MDB → ∞.
        let mut x = vec![0.0_f64; state_dim];
        x[layout.off_idx(1)] = 1.0;
        let b_in: Vec<f64> = g
            .iter()
            .map(|row| row.iter().zip(x.iter()).map(|(&r, &xi)| r * xi).sum())
            .collect();
        let b_norm = vnorm(&b_in);
        let c_indet: Vec<f64> = b_in.iter().map(|&v| v / b_norm).collect();
        let mdb_indet = mdb(&pperp, &w, &c_indet, ncp);
        assert!(
            mdb_indet > 1e3 || mdb_indet.is_infinite(),
            "MDB for undetectable direction must be very large or infinite, got {mdb_indet}"
        );
    }

    /// peer_signature returns the correct shape (n_meas × |incidence|), places `1.0`
    /// at exactly the right row in each column, and the union of two peers' blocks
    /// covers all incident rows from both.
    #[test]
    fn peer_signature_shape_and_unit_columns() {
        let n_meas = 10_usize;

        // Peer 0 participates in measurements {0, 2, 5}.
        let inc_0: Vec<usize> = vec![0, 2, 5];
        let sig_0 = peer_signature(n_meas, &inc_0);
        assert_eq!(sig_0.len(), n_meas, "peer 0 signature: row count");
        assert_eq!(sig_0[0].len(), inc_0.len(), "peer 0 signature: col count");
        // Column k = e_{incidence[k]}.
        for (col, &row_idx) in inc_0.iter().enumerate() {
            for (r, sig0_row) in sig_0.iter().enumerate() {
                let expected = if r == row_idx { 1.0 } else { 0.0 };
                assert_eq!(
                    sig0_row[col], expected,
                    "peer_signature(peer 0)[row={r}][col={col}] should be {expected} \
                     (incidence[{col}]={row_idx})"
                );
            }
        }

        // Peer 1 participates in measurements {1, 3, 5, 7}.
        let inc_1: Vec<usize> = vec![1, 3, 5, 7];
        let sig_1 = peer_signature(n_meas, &inc_1);
        assert_eq!(sig_1.len(), n_meas, "peer 1 signature: row count");
        assert_eq!(sig_1[0].len(), inc_1.len(), "peer 1 signature: col count");
        for (col, &row_idx) in inc_1.iter().enumerate() {
            for (r, sig1_row) in sig_1.iter().enumerate() {
                let expected = if r == row_idx { 1.0 } else { 0.0 };
                assert_eq!(
                    sig1_row[col], expected,
                    "peer_signature(peer 1)[row={r}][col={col}] should be {expected}"
                );
            }
        }

        // Stacking the two blocks: every incident row from the union {0,1,2,3,5,7}
        // must appear in at least one peer's signature.
        let union_rows = [0_usize, 1, 2, 3, 5, 7];
        for &r in &union_rows {
            let covered = sig_0[r].iter().any(|&v| v != 0.0) || sig_1[r].iter().any(|&v| v != 0.0);
            assert!(
                covered,
                "union incident row {r} must appear in at least one peer block"
            );
        }
        // Non-incident rows must be all-zero in both blocks.
        for r in [4_usize, 6, 8, 9] {
            assert!(
                sig_0[r].iter().all(|&v| v == 0.0),
                "non-incident row {r} must be zero in peer 0 block"
            );
            assert!(
                sig_1[r].iter().all(|&v| v == 0.0),
                "non-incident row {r} must be zero in peer 1 block"
            );
        }
    }

    // ── Byzantine block-spark bound ─────────────────────────────────────────────────

    /// Column-norm of column `c` of a row-major matrix.
    fn col_norm(mat: &[Vec<f64>], c: usize) -> f64 {
        mat.iter().map(|row| row[c] * row[c]).sum::<f64>().sqrt()
    }

    /// THE C3 TEST (the whole point of the task). A single peer whose effective block
    /// `Ḡ_j = P⊥·B_j` has NONZERO columns yet is COLUMN-RANK-DEFICIENT must be classified
    /// UNDETECTABLE (block_spark = 1, f_detect = 0). A predicate that only checked
    /// `P⊥·B_j ≠ 0` would wrongly call it detectable — this test distinguishes the two.
    ///
    /// Construction (exact arithmetic): take `range(G) = span{(1,1,0)}` in ℝ³ and the
    /// orthogonal parity projector `P⊥ = I − vvᵀ/‖v‖²`. A peer incident to measurements
    /// {0, 1} has effective columns
    ///   `P⊥·e_0 = (½, −½, 0)`,  `P⊥·e_1 = (−½, ½, 0)`  —  each NONZERO,
    /// but `P⊥·e_0 = −P⊥·e_1`, so the block has rank 1 < 2 columns. The adversary injects
    /// `e_0 + e_1 = (1,1,0) ∈ range(G)`: a nonzero fault that leaves no parity residual.
    /// Changing the incidence to {0, 2} (`P⊥·e_2 = (0,0,1)`, independent of `P⊥·e_0`)
    /// flips the block to full column rank → block_spark = 2, f_detect = 1. Same projector,
    /// opposite verdict, decided entirely by column rank.
    #[test]
    fn byzantine_c3_rank_deficient_but_nonzero_is_undetectable() {
        // Orthogonal projector onto the complement of span{(1,1,0)} in ℝ³.
        let pperp = vec![
            vec![0.5, -0.5, 0.0],
            vec![-0.5, 0.5, 0.0],
            vec![0.0, 0.0, 1.0],
        ];

        // Rank-deficient-yet-nonzero peer: incidence {0, 1}.
        let block_dep = peer_signature(3, &[0, 1]);
        let eff_dep = project_block(&pperp, &block_dep);
        // Both effective columns are NONZERO — a naive "P⊥B_j ≠ 0" test would call this
        // peer DETECTABLE.
        assert!(
            col_norm(&eff_dep, 0) > 0.1 && col_norm(&eff_dep, 1) > 0.1,
            "C3: both effective columns must be nonzero (naive test would say detectable): \
             ‖col0‖={:.3}, ‖col1‖={:.3}",
            col_norm(&eff_dep, 0),
            col_norm(&eff_dep, 1)
        );
        // But the block is column-rank-deficient (rank 1 < 2): the correct verdict is
        // UNDETECTABLE.
        let cols_dep = stack_columns(&[eff_dep], &[0]);
        assert_eq!(
            effective_column_rank(&cols_dep, 1e-9),
            1,
            "C3: rank of the two effective columns must be 1 (they are anti-parallel)"
        );
        let cls_dep = byzantine_bound(&[block_dep], &pperp, 1e-9);
        assert_eq!(
            cls_dep,
            ByzantineClass {
                f_detect: 0,
                f_identify: 0,
                block_spark: 1
            },
            "C3: nonzero-but-rank-deficient single peer must be undetectable (block_spark=1)"
        );

        // Full-column-rank contrast: same projector, incidence {0, 2}.
        let block_full = peer_signature(3, &[0, 2]);
        let eff_full = project_block(&pperp, &block_full);
        let cols_full = stack_columns(&[eff_full], &[0]);
        assert_eq!(
            effective_column_rank(&cols_full, 1e-9),
            2,
            "contrast: independent effective columns must have full rank 2"
        );
        let cls_full = byzantine_bound(&[block_full], &pperp, 1e-9);
        assert_eq!(
            cls_full,
            ByzantineClass {
                f_detect: 1,
                f_identify: 0,
                block_spark: 2
            },
            "contrast: full-column-rank single peer is detectable (block_spark = M+1 = 2)"
        );
    }

    /// Measurement indices (rows of `pernode_rows`) incident to node `k`.
    ///
    /// `pernode_rows` iterates pairs `(a, b)` with `a < b`, each over the elapsed windows;
    /// node `k` is incident to a measurement iff it is one of the endpoints.
    fn node_incidence(layout: &NetworkLayout, k: usize) -> Vec<usize> {
        let m = layout.n_nodes;
        let mut inc = Vec::new();
        let mut idx = 0_usize;
        for a in 0..m {
            for b in (a + 1)..m {
                for _w in 0..PERNODE_ELAPSED_S.len() {
                    if a == k || b == k {
                        inc.push(idx);
                    }
                    idx += 1;
                }
            }
        }
        inc
    }

    /// REAL-NETWORK C3. A peer incident to ALL of node `k`'s measurements can inject a
    /// uniform bias across them — which is exactly a clock-offset error of node `k`
    /// (`G·e_{off(k)}`) and therefore lies in `range(G)`, undetectable. Every INDIVIDUAL
    /// measurement bias `P⊥·e_i` is nonzero (detectable), so the block is nonzero yet
    /// column-rank-deficient: the C3 correction in the real DE440 geometry. The Gram
    /// spectrum shows a clear gap (genuine null ≪ tol·λ_max ≪ observable), justifying the
    /// matched `1e-9` rank tolerance despite the network's weakly-conditioned direction.
    #[test]
    fn byzantine_real_network_uniform_bias_is_clock_offset() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let n_meas = g.len();

        // Peer = every measurement touching node 2.
        let inc = node_incidence(&layout, 2);
        assert_eq!(
            inc.len(),
            (layout.n_nodes - 1) * PERNODE_ELAPSED_S.len(),
            "node incidence must be (M−1)·windows measurements"
        );
        let block = peer_signature(n_meas, &inc);
        let eff = project_block(&pperp, &block);

        // Every single-measurement bias is detectable: each effective column is nonzero.
        for c in 0..inc.len() {
            assert!(
                col_norm(&eff, c) > 1e-3,
                "each individual measurement bias must be detectable: ‖col {c}‖ = {:.3e}",
                col_norm(&eff, c)
            );
        }

        // Yet the block is column-rank-deficient — a nonzero combination (uniform bias =
        // clock offset) lands in range(G). Verify the Gram spectral gap directly.
        let cols = stack_columns(&[eff], &[0]);
        let total = cols.len();
        let mut gram = vec![vec![0.0_f64; total]; total];
        for (i, ci) in cols.iter().enumerate() {
            for (j, cj) in cols.iter().enumerate() {
                gram[i][j] = ci.iter().zip(cj.iter()).map(|(&a, &b)| a * b).sum();
            }
        }
        let eig = crate::fim::sym_eig(&gram);
        let lam_max = *eig.values.last().unwrap();
        let rank = effective_column_rank(&cols, 1e-9);
        assert!(
            rank < total,
            "block must be column-rank-deficient: rank {rank} vs {total} columns"
        );
        // Clear spectral gap: at least one eigenvalue is a genuine numerical null (the
        // in-range combination), far below the 1e-9 threshold, while the retained rank
        // sits far above it — the tolerance is unambiguous.
        let null_ev = eig.values[total - rank - 1]; // largest of the null block
        let obs_ev = eig.values[total - rank]; // smallest retained
        assert!(
            null_ev < 1e-12 * lam_max,
            "genuine null eigenvalue must be ≪ tol·λ_max: {null_ev:.3e} vs λ_max {lam_max:.3e}"
        );
        assert!(
            obs_ev > 1e-6 * lam_max,
            "smallest retained eigenvalue must be ≫ tol·λ_max: {obs_ev:.3e} vs λ_max {lam_max:.3e}"
        );

        // Integration: the peer is undetectable (block_spark = 1, f_detect = 0).
        let cls = byzantine_bound(&[block], &pperp, 1e-9);
        assert_eq!(
            cls.block_spark, 1,
            "real-network uniform-bias peer: block_spark = 1"
        );
        assert_eq!(
            cls.f_detect, 0,
            "real-network uniform-bias peer: undetectable"
        );

        // Contrast: a single-measurement peer projects to one nonzero column (full rank),
        // so it is detectable (block_spark = M+1 = 2).
        let single = peer_signature(n_meas, &[0]);
        let cls_single = byzantine_bound(&[single], &pperp, 1e-9);
        assert_eq!(
            cls_single.block_spark, 2,
            "single-measurement peer is full column rank ⇒ block_spark = 2"
        );
        assert_eq!(
            cls_single.f_detect, 1,
            "single-measurement peer is detectable"
        );
    }

    /// A well-connected, redundant net of independent single-measurement peers has a HIGH
    /// block spark — no small coalition can collude into an undetectable fault — so the
    /// identify bound is `≥ 1`. Six peers on six distinct, geometrically independent
    /// measurements of the real DE440 network are mutually full-rank (a `≤6`-sparse fault
    /// cannot be a pure state error, `6 + 32 < 84`), so block_spark = M+1 = 7 and
    /// f_identify = ⌊6/2⌋ = 3.
    #[test]
    fn byzantine_redundant_net_identifies_at_least_one() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let n_meas = g.len();

        // Six peers, each owning one distinct measurement spread across the network.
        let meas = [0_usize, 12, 24, 37, 49, 61];
        let peers: Vec<Vec<Vec<f64>>> =
            meas.iter().map(|&i| peer_signature(n_meas, &[i])).collect();
        let cls = byzantine_bound(&peers, &pperp, 1e-9);

        assert_eq!(
            cls.block_spark,
            peers.len() + 1,
            "independent single-measurement peers admit no dependent coalition: block_spark = M+1"
        );
        assert_eq!(cls.f_detect, peers.len(), "all six peers detectable");
        assert!(
            cls.f_identify >= 1,
            "redundant net must identify ≥ 1 faulty peer, got {}",
            cls.f_identify
        );
        assert_eq!(
            cls.f_identify, 3,
            "identify bound = ⌊(block_spark−1)/2⌋ = ⌊6/2⌋ = 3, got {}",
            cls.f_identify
        );
    }

    /// Hand-constructed analytic sanity case (`P⊥ = I`, so `range(G) = {0}` and effective
    /// columns are the raw incidence columns). The block spark is then the ordinary spark of
    /// the incidence structure, known by inspection.
    ///
    /// * Peers {0}, {1}, {0}: peers 0 and 2 share measurement 0, so their two-block union
    ///   has a repeated column ⇒ dependent at size 2 ⇒ block_spark = 2, f_detect = 1,
    ///   f_identify = 0.
    /// * Peers {0}, {1}, {2}, {3}: four orthonormal single columns, no dependent union ⇒
    ///   block_spark = M+1 = 5, f_detect = 4, f_identify = 2.
    #[test]
    fn byzantine_analytic_spark_identity_projector() {
        let ident = vec![
            vec![1.0, 0.0, 0.0, 0.0],
            vec![0.0, 1.0, 0.0, 0.0],
            vec![0.0, 0.0, 1.0, 0.0],
            vec![0.0, 0.0, 0.0, 1.0],
        ];

        // Shared-measurement coalition: peers 0 and 2 both own measurement 0.
        let shared = vec![
            peer_signature(4, &[0]),
            peer_signature(4, &[1]),
            peer_signature(4, &[0]),
        ];
        let cls_shared = byzantine_bound(&shared, &ident, 1e-9);
        assert_eq!(
            cls_shared,
            ByzantineClass {
                f_detect: 1,
                f_identify: 0,
                block_spark: 2
            },
            "two peers sharing a measurement collude at size 2 ⇒ block_spark = 2"
        );

        // Fully independent single-measurement peers: no dependent union exists.
        let indep = vec![
            peer_signature(4, &[0]),
            peer_signature(4, &[1]),
            peer_signature(4, &[2]),
            peer_signature(4, &[3]),
        ];
        let cls_indep = byzantine_bound(&indep, &ident, 1e-9);
        assert_eq!(
            cls_indep,
            ByzantineClass {
                f_detect: 4,
                f_identify: 2,
                block_spark: 5
            },
            "four orthonormal peers admit no dependent coalition ⇒ block_spark = M+1 = 5"
        );
    }

    /// The detect/identify counts obey the block-spark relations exactly across a sweep of
    /// synthetic block-spark values, and `combinations` enumerates the right subsets.
    #[test]
    fn byzantine_detect_identify_relations() {
        // combinations(n, k) yields exactly C(n, k) strictly-increasing subsets.
        assert_eq!(combinations(4, 2).len(), 6);
        assert_eq!(combinations(5, 3).len(), 10);
        assert_eq!(combinations(3, 0).len(), 0);
        assert_eq!(combinations(2, 3).len(), 0);
        for subset in combinations(5, 3) {
            assert!(
                subset.windows(2).all(|w| w[0] < w[1]),
                "subsets strictly increasing"
            );
        }

        // For P⊥ = I, k identical single-measurement peers first collude at size 2, and a
        // chain of distinct measurements never colludes: check the two count formulas hold.
        let ident: Vec<Vec<f64>> = (0..6)
            .map(|i| (0..6).map(|j| if i == j { 1.0 } else { 0.0 }).collect())
            .collect();
        // Distinct measurements 0..M ⇒ block_spark = M+1 ⇒ f_detect = M, f_identify = ⌊M/2⌋.
        for m in 1..=6_usize {
            let peers: Vec<Vec<Vec<f64>>> = (0..m).map(|i| peer_signature(6, &[i])).collect();
            let cls = byzantine_bound(&peers, &ident, 1e-9);
            assert_eq!(
                cls.block_spark,
                m + 1,
                "distinct peers ⇒ block_spark = M+1 (M={m})"
            );
            assert_eq!(
                cls.f_detect,
                cls.block_spark - 1,
                "f_detect = block_spark − 1"
            );
            assert_eq!(
                cls.f_identify,
                (cls.block_spark - 1) / 2,
                "f_identify = ⌊(block_spark − 1)/2⌋"
            );
        }
    }

    // ── Holdover floor, protection-gap slope, provider split ────────────────────────

    /// Build the observable-subspace projector `Π_obs = I − N Nᵀ` from the null-space
    /// basis `N` returned by [`crate::fim::crlb`] (`n × defect`, orthonormal columns).
    #[allow(clippy::needless_range_loop)]
    fn obs_projector(null_space: &[Vec<f64>]) -> Vec<Vec<f64>> {
        let n = null_space.len();
        if n == 0 {
            return vec![];
        }
        let n_null = null_space[0].len();
        let mut proj = vec![vec![0.0_f64; n]; n];
        for i in 0..n {
            proj[i][i] = 1.0;
        }
        for k in 0..n_null {
            for i in 0..n {
                for j in 0..n {
                    proj[i][j] -= null_space[i][k] * null_space[j][k];
                }
            }
        }
        proj
    }

    /// C2/T4 HOLDOVER FLOOR: the common clock-rate generator lies in `N(GᵀWG)` for the
    /// self-referential per-node network (rate is genuinely unobservable — the ensemble-
    /// time free parameter), and is EXPELLED from the null space once an external rate
    /// tie is added. Both halves are asserted with high numerical margin, proving the
    /// floor is a real gauge broken only by an off-network anchor.
    #[test]
    fn holdover_floor_self_ref_and_anchored() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let rows = pernode_rows(&layout, &inertial);
        let info = assemble_pernode_info(&rows, layout.state_dim);
        let gens = datum_gauge_generators(&layout, &inertial);
        assert_eq!(gens.len(), N_DATUM_GAUGE, "eight gauge generators expected");

        // Self-referential: the common rate generator (gens[7]) is in N(GᵀWG).
        let floor_self = holdover_floor(&info, &gens, 1e-7);
        assert!(
            floor_self.rate_in_gauge,
            "C2/T4: common rate must be in N(GᵀWG) for self-ref net — this IS the holdover floor"
        );
        assert_eq!(
            floor_self.temporal_gauge_dim, 2,
            "C2/T4: self-ref net has temporal_gauge_dim=2 (common offset + common rate both gauged)"
        );

        // Anchored: add one external rate-tie row that fixes node 0's absolute rate.
        // This row has sensitivity +1 at rate_idx(0) and is zero elsewhere — it connects
        // the common rate direction to an observable, breaking the ensemble-time gauge.
        let mut anchored_rows = rows.clone();
        let mut rate_tie = vec![0.0_f64; layout.state_dim];
        rate_tie[layout.rate_idx(0)] = 1.0;
        anchored_rows.push((rate_tie, 1.0));
        let info_anchored = assemble_pernode_info(&anchored_rows, layout.state_dim);

        let floor_anchored = holdover_floor(&info_anchored, &gens, 1e-7);
        assert!(
            !floor_anchored.rate_in_gauge,
            "C2/T4: external rate tie must break holdover floor (rate NOT in gauge after tie)"
        );
        assert_eq!(
            floor_anchored.temporal_gauge_dim, 1,
            "C2/T4: after tying one node's absolute rate, the common rate leaves the gauge \
             but the common offset survives, so temporal_gauge_dim = 1 (offset only)"
        );
    }

    /// g7 PROTECTION-GAP SLOPE: `slope → ∞` for a fault `b ∈ range(G)` (the estimator
    /// is corrupted with zero parity — the protection gap), and finite for a generic
    /// detectable fault `b ∉ range(G)`.
    #[test]
    fn slope_infinity_in_range_finite_detectable() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let state_dim = g[0].len();
        let n_meas = g.len();

        // Build GᵀWG for the observable-subspace projector.
        let mut ntm = vec![vec![0.0_f64; state_dim]; state_dim];
        for (i, row) in g.iter().enumerate() {
            let wi = w[i];
            for p in 0..state_dim {
                let jwi = row[p] * wi;
                if jwi == 0.0 {
                    continue;
                }
                for q in 0..state_dim {
                    ntm[p][q] += jwi * row[q];
                }
            }
        }
        let crlb_r = crate::fim::crlb(&ntm, 1e-9);
        let obs_proj = obs_projector(&crlb_r.null_space);

        // In-range fault: b = G · e_{off(1)}, which lies in range(G).
        let mut x_in = vec![0.0_f64; state_dim];
        x_in[layout.off_idx(1)] = 1.0;
        let b_in: Vec<f64> = g
            .iter()
            .map(|row| row.iter().zip(x_in.iter()).map(|(&r, &xi)| r * xi).sum())
            .collect();
        let s_in = slope(&pperp, &w, &g, &b_in, &obs_proj);
        assert!(
            s_in > 1e6 || s_in.is_infinite(),
            "g7: slope must be ∞ (or >1e6) for b ∈ range(G) — protection gap: got {s_in}"
        );

        // Detectable fault: e_0 (first measurement basis vector, not in range(G)).
        let mut b_out = vec![0.0_f64; n_meas];
        b_out[0] = 1.0;
        let s_out = slope(&pperp, &w, &g, &b_out, &obs_proj);
        assert!(
            s_out.is_finite() && s_out > 0.0,
            "g7: slope must be finite and positive for detectable fault b ∉ range(G): got {s_out}"
        );
    }

    /// T5 PROVIDER MISMATCH SPLIT: a common provider bias (∈ range(G)) is undetectable;
    /// a differential provider bias (∉ range(G)) is detectable. This is the multi-provider
    /// interop floor: common-mode calibration errors need an external reference, while
    /// differential biases are self-monitored by the parity residual.
    #[test]
    fn provider_mismatch_split_common_undetectable_differential_detectable() {
        let nodes = pernode_body_nodes();
        let layout = NetworkLayout::new(nodes.len());
        let inertial = pernode_inertial(&nodes);
        let (g, w) = pernode_g_and_w(&layout, &inertial);
        let pperp = parity_projector(&g, &w);
        let state_dim = g[0].len();
        let n_meas = g.len();

        // Common bias: b = G · e_{off(2)} — in range(G), undetectable by any parity monitor.
        let mut x = vec![0.0_f64; state_dim];
        x[layout.off_idx(2)] = 1.0;
        let common_bias: Vec<f64> = g
            .iter()
            .map(|row| row.iter().zip(x.iter()).map(|(&r, &xi)| r * xi).sum())
            .collect();

        // Differential bias: e_0 in measurement space — not in range(G), detectable.
        let mut diff_bias = vec![0.0_f64; n_meas];
        diff_bias[0] = 1.0;

        let split = provider_mismatch_split(&common_bias, &diff_bias, &pperp, 1e-8);
        assert!(
            !split.common_detectable,
            "T5: common provider bias (∈ range(G)) must be UNDETECTABLE — needs external tie"
        );
        assert!(
            split.differential_detectable,
            "T5: differential provider bias (∉ range(G)) must be DETECTABLE — self-monitored"
        );
    }
}
