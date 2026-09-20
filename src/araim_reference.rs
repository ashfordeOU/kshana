// SPDX-License-Identifier: AGPL-3.0-only
//! Published ARAIM certification reference vectors — the WG-C ARAIM Technical
//! Subgroup's **own worked numerical examples**, run through this engine.
//!
//! Every other ARAIM surface in this crate is checked against itself: the MHSS
//! algebra is internally consistent, the dual-constellation benefit is a property
//! of the geometry, and `tests/araim_dual_real_data.rs` exercises the engine on
//! real Celestrak TLE geometry — but *nothing outside the codebase says what the
//! answer should be*. This module closes that gap. The EU–U.S. Working Group C
//! ARAIM Technical Subgroup publishes a fully-specified numerical example of its
//! reference airborne algorithm: a fixed 10-satellite, 2-constellation geometry
//! matrix `G`, the per-satellite integrity and accuracy variances it implies, the
//! integrity-support-message priors, and the VPL, HPL, EMT and all-in-view
//! vertical sigma that the reference algorithm must produce from them. Those
//! numbers are an authority outside this repository, and this module reproduces
//! them.
//!
//! **The reference states its own tolerance.** `TOL_PL` — "tolerance for the
//! computation of the Protection Level" — is `5 × 10⁻² m` in the reference's own
//! list of constants, and the document requires that "the output VPL must be
//! within `TOL_PL` of the solution of this equation". That, not a number chosen
//! to make a test pass, is the acceptance bar in
//! `tests/araim_reference_vectors.rs`.
//!
//! # What is reproduced
//!
//! The algorithm implemented here is the reference airborne algorithm as
//! published, step for step:
//!
//! * `C_int(i,i) = σ²_URA,i + σ²_tropo,i + σ²_user,i` and the matching `C_acc` are
//!   **inputs** — the published example states both diagonals, so no error model
//!   is re-derived here and none can drift.
//! * All-in-view weighted least squares `S⁽⁰⁾ = (GᵀWG)⁻¹GᵀW` with `W = C_int⁻¹`,
//!   `G` an `N_sat × (3 + N_const)` East/North/Up matrix with one clock column per
//!   constellation.
//! * One fault-tolerant sub-solution `S⁽ᵏ⁾` per monitored fault mode, with the
//!   clock column of any constellation that the subset empties **removed** from
//!   `G` before the subset solve (the reference's explicit instruction; without it
//!   the constellation-fault sub-solutions are singular).
//! * `σ_q⁽ᵏ⁾² = ((GᵀW⁽ᵏ⁾G)⁻¹)_{q,q}`, the one-sided nominal-bias projection
//!   `b_q⁽ᵏ⁾ = Σ_i |S_{q,i}⁽ᵏ⁾|·b_nom,i`, and the solution-separation sigma
//!   `σ_ss,q⁽ᵏ⁾² = e_qᵀ(S⁽ᵏ⁾−S⁽⁰⁾) C_acc (S⁽ᵏ⁾−S⁽⁰⁾)ᵀ e_q` — note `C_acc`, not
//!   `C_int`, in the separation.
//! * Detection thresholds `T_k,q = K_fa,q·σ_ss,q⁽ᵏ⁾` with
//!   `K_fa,3 = Q⁻¹(P_FA_VERT / 2N_fault modes)` and
//!   `K_fa,1 = K_fa,2 = Q⁻¹(P_FA_HOR / 4N_fault modes)`.
//! * The protection-level equation
//!   `2Q((PL − b_q⁽⁰⁾)/σ_q⁽⁰⁾) + Σ_k p_fault,k·Q((PL − T_k,q − b_q⁽ᵏ⁾)/σ_q⁽ᵏ⁾) = R_q`,
//!   with `R_3 = P_HMI_VERT·(1 − P_fault,not monitored/(P_HMI_VERT + P_HMI_HOR))`
//!   and `R_1 = R_2 = ½·P_HMI_HOR·(same factor)`, then `HPL = √(HPL_1² + HPL_2²)`.
//! * `EMT = max{T_k,3 : p_fault,k ≥ P_EMT}` and
//!   `σ_v,acc = √(e_3ᵀ S⁽⁰⁾ C_acc S⁽⁰⁾ᵀ e_3)`.
//!
//! The protection-level equation is **not** re-solved here: it is handed to the
//! engine's existing [`crate::raim::araim_protection_level`] /
//! [`crate::raim::araim_integrity_risk`], whose risk sum is literally
//! `Σ_k p_fault,k·Q((PL − b_k − T_k)/σ_k)`. The reference's *two-sided* fault-free
//! term `2Q(·)` is expressed by giving the fault-free hypothesis a weight of `2`
//! in that sum — the one place where `AraimMode::p_fault` carries a multiplier
//! rather than a probability, and it is the exact coefficient the reference
//! prints. So the bisection, the tail function and the risk algebra under test are
//! the engine's own; this module supplies only the geometry, the sub-solutions and
//! the published budget split.
//!
//! # Scope, honestly
//!
//! Only `N_fault,max = 1` (single-satellite and single-constellation fault modes)
//! is implemented. The reference's own `φ_P_THRES` rule is evaluated
//! ([`ReferenceResult::n_fault_max`]) and a case that would need simultaneous
//! multi-event subsets is **rejected with an error**, not silently truncated —
//! under-counting fault modes would shrink every protection level. Fault
//! detection, exclusion, the χ² consistency check and the double-counting
//! re-allocation step of the reference algorithm are outside this module: it
//! computes protection levels for a stated geometry, which is what the published
//! vectors pin.
//!
//! This is a reproduction of a published reference algorithm's worked example. It
//! is not a certification, an airworthiness artefact, or an approval of any kind.

use crate::raim::{araim_integrity_risk, araim_protection_level, normal_quantile, AraimMode};
use serde::Deserialize;

/// One satellite of a published reference geometry: its East/North/Up
/// line-of-sight row, the constellation whose clock column it loads, and the two
/// published pseudorange error variances for that satellite.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ReferenceSatellite {
    /// East component of the line-of-sight row of `G` (dimensionless).
    pub east: f64,
    /// North component of the line-of-sight row of `G` (dimensionless).
    pub north: f64,
    /// Up component of the line-of-sight row of `G` (dimensionless).
    pub up: f64,
    /// Zero-based index of the constellation this satellite belongs to; it sets
    /// the `1` in column `3 + constellation` of `G`.
    pub constellation: usize,
    /// `C_int(i,i)` — the integrity error **variance** (m²) for this satellite.
    pub c_int_m2: f64,
    /// `C_acc(i,i)` — the accuracy/continuity error **variance** (m²) for this
    /// satellite. The reference's own examples satisfy
    /// `C_int − C_acc = σ²_URA − σ²_URE` for every satellite.
    pub c_acc_m2: f64,
}

/// The reference algorithm's navigation constants and tunable design parameters,
/// as published in its lists of constants and design parameters.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ReferenceConstants {
    /// `P_HMI_VERT` — integrity risk allocated to the vertical component.
    pub p_hmi_vert: f64,
    /// `P_HMI_HOR = P_HMI − P_HMI_VERT` — integrity risk allocated to the
    /// horizontal component.
    pub p_hmi_horz: f64,
    /// `P_FA_VERT` — continuity budget allocated to the vertical monitors.
    pub p_fa_vert: f64,
    /// `P_FA_HOR` — continuity budget allocated to the horizontal monitors.
    pub p_fa_horz: f64,
    /// `P_EMT` — the prior above which a fault mode's threshold enters the
    /// Effective Monitor Threshold.
    pub p_emt: f64,
    /// `P_THRES` — the integrity-risk threshold below which unmonitored fault
    /// modes may be left unmonitored; it sets `N_fault,max`.
    pub p_thres: f64,
    /// `TOL_PL` (m) — the reference's own stated tolerance on the computed
    /// protection level. This is the acceptance bar for a reference check.
    pub tol_pl_m: f64,
}

impl ReferenceConstants {
    /// The published LPV-200 / LPV-250 column: `P_HMI = 10⁻⁷` split as
    /// `P_HMI_VERT = 9.8 × 10⁻⁸` and `P_HMI_HOR = 2 × 10⁻⁹`, continuity
    /// `P_FA_VERT = 3.9 × 10⁻⁶` and `P_FA_HOR = 9 × 10⁻⁸`, `P_THRES = 8 × 10⁻⁸`,
    /// `P_EMT = 10⁻⁵`, `TOL_PL = 5 × 10⁻² m`.
    pub const LPV_200: ReferenceConstants = ReferenceConstants {
        p_hmi_vert: 9.8e-8,
        p_hmi_horz: 1e-7 - 9.8e-8,
        p_fa_vert: 3.9e-6,
        p_fa_horz: 9e-8,
        p_emt: 1e-5,
        p_thres: 8e-8,
        tol_pl_m: 5e-2,
    };
}

/// A complete reference case: the geometry, the integrity-support-message priors
/// that apply to every satellite of it, and the constant set.
#[derive(Clone, Debug, PartialEq)]
pub struct ReferenceCase {
    /// The geometry rows, in the published order.
    pub satellites: Vec<ReferenceSatellite>,
    /// Number of constellations, i.e. clock columns of `G`.
    pub constellations: usize,
    /// `b_nom,i` (m) — the maximum nominal range bias the ISM declares, applied to
    /// every satellite.
    pub b_nom_m: f64,
    /// `P_sat,i` — prior probability of a single-satellite fault per approach.
    pub p_sat: f64,
    /// `P_const,j` — prior probability of a constellation-wide fault per approach.
    pub p_const: f64,
    /// The navigation constants and design parameters in force.
    pub constants: ReferenceConstants,
}

/// One monitored fault mode as the reference algorithm sees it, reported on the
/// vertical axis (the axis the published examples tabulate).
#[derive(Clone, Debug, PartialEq)]
pub struct ReferenceModeReport {
    /// Human-readable mode label, e.g. `sat-3` or `constellation-1`.
    pub label: String,
    /// `p_fault,k` — the mode's prior probability.
    pub p_fault: f64,
    /// `σ_3⁽ᵏ⁾` (m) — the sub-solution's vertical standard deviation.
    pub sigma_up_m: f64,
    /// `σ_ss,3⁽ᵏ⁾` (m) — the vertical solution-separation standard deviation.
    pub sigma_ss_up_m: f64,
    /// `b_3⁽ᵏ⁾` (m) — the one-sided nominal-bias projection on the vertical axis.
    pub bias_up_m: f64,
    /// `T_k,3` (m) — the vertical detection threshold, `K_fa,3·σ_ss,3⁽ᵏ⁾`.
    pub threshold_up_m: f64,
}

/// Everything the reference algorithm produces for a [`ReferenceCase`].
#[derive(Clone, Debug, PartialEq)]
pub struct ReferenceResult {
    /// `N_fault,max` from the reference's `φ_P_THRES` rule — the largest number of
    /// simultaneous independent events that must be monitored. Only `1` is
    /// supported; see the module note.
    pub n_fault_max: usize,
    /// `N_fault modes` — the number of monitored fault modes, after the
    /// observability filter. This is the `N` in every `K_fa`.
    pub n_fault_modes: usize,
    /// `P_fault,not monitored` — the integrity risk of everything not monitored:
    /// the probability of two or more simultaneous events, plus the priors of any
    /// single-event subset dropped as unobservable.
    pub p_fault_not_monitored: f64,
    /// The fraction `1 − P_fault,not monitored/(P_HMI_VERT + P_HMI_HOR)` by which
    /// the reference shrinks both protection-level budgets.
    pub risk_allocation_factor: f64,
    /// `K_fa,3` — the vertical detection multiplier (dimensionless).
    pub k_fa_vert: f64,
    /// `K_fa,1 = K_fa,2` — the horizontal detection multiplier (dimensionless).
    pub k_fa_horz: f64,
    /// `σ_3⁽⁰⁾` (m) — all-in-view vertical standard deviation from `C_int`.
    pub sigma_up_m: f64,
    /// `b_3⁽⁰⁾` (m) — all-in-view vertical nominal-bias projection.
    pub bias_up_m: f64,
    /// The Vertical Protection Level (m).
    pub vpl_m: f64,
    /// The Horizontal Protection Level (m), `√(HPL_1² + HPL_2²)`.
    pub hpl_m: f64,
    /// `HPL_1` (m) — the East-axis protection level.
    pub hpl_east_m: f64,
    /// `HPL_2` (m) — the North-axis protection level.
    pub hpl_north_m: f64,
    /// The Effective Monitor Threshold (m).
    pub emt_m: f64,
    /// `σ_v,acc` (m) — the all-in-view vertical standard deviation from `C_acc`,
    /// the accuracy/fault-free-error figure.
    pub sigma_v_acc_m: f64,
    /// The vertical integrity risk the returned VPL actually achieves — the left
    /// side of the reference's VPL equation evaluated at `vpl_m`. It must not
    /// exceed the allocated budget.
    pub achieved_risk_vert: f64,
    /// The vertical integrity-risk budget the VPL was solved against,
    /// `P_HMI_VERT · risk_allocation_factor`.
    pub allocated_risk_vert: f64,
    /// The monitored constellation-wide fault modes, in constellation order — the
    /// modes the published examples tabulate `σ_3⁽ᵏ⁾`, `σ_ss,3⁽ᵏ⁾` and `b_3⁽ᵏ⁾`
    /// for.
    pub constellation_modes: Vec<ReferenceModeReport>,
}

/// Invert a small dense matrix by Gauss–Jordan elimination with partial pivoting.
/// `None` if it is singular to working precision.
fn invert(a: &[Vec<f64>]) -> Option<Vec<Vec<f64>>> {
    let n = a.len();
    let mut m: Vec<Vec<f64>> = (0..n)
        .map(|i| {
            let mut row = a[i].clone();
            row.extend((0..n).map(|j| if i == j { 1.0 } else { 0.0 }));
            row
        })
        .collect();
    for col in 0..n {
        let mut pivot = col;
        for r in col + 1..n {
            if m[r][col].abs() > m[pivot][col].abs() {
                pivot = r;
            }
        }
        if m[pivot][col].abs() < 1e-14 {
            return None;
        }
        m.swap(col, pivot);
        let d = m[col][col];
        for v in m[col].iter_mut() {
            *v /= d;
        }
        let pivot_row = m[col].clone();
        for (r, row) in m.iter_mut().enumerate() {
            if r == col {
                continue;
            }
            let f = row[col];
            if f == 0.0 {
                continue;
            }
            for (v, p) in row.iter_mut().zip(pivot_row.iter()).skip(col) {
                *v -= f * p;
            }
        }
    }
    Some(m.into_iter().map(|row| row[n..].to_vec()).collect())
}

/// One (sub-)solution: the estimator `S` as a `(3 + N_const) × N_sat` matrix, and
/// the `√` of the first three diagonal entries of `(GᵀW G)⁻¹`.
struct SubSolution {
    /// Row `q` of `S`, for `q` in `0..3` only — the position axes are all the
    /// protection levels need.
    s: [Vec<f64>; 3],
    /// `σ_q` (m) for `q` in `0..3`.
    sigma: [f64; 3],
}

/// Weighted least squares over the satellites `keep` selects, with the clock
/// column of any constellation the subset empties removed from `G` first.
fn subset_solution(case: &ReferenceCase, keep: &[bool]) -> Option<SubSolution> {
    let n = case.satellites.len();
    let m = 3 + case.constellations;
    let w: Vec<f64> = (0..n)
        .map(|i| {
            if keep[i] && case.satellites[i].c_int_m2 > 0.0 {
                1.0 / case.satellites[i].c_int_m2
            } else {
                0.0
            }
        })
        .collect();
    // The full geometry row for satellite i, before any column is dropped.
    let g = |i: usize, j: usize| -> f64 {
        let s = case.satellites[i];
        match j {
            0 => s.east,
            1 => s.north,
            2 => s.up,
            _ => {
                if s.constellation + 3 == j {
                    1.0
                } else {
                    0.0
                }
            }
        }
    };
    // A column carrying no weight makes GᵀWG singular; the reference removes it.
    let live: Vec<usize> = (0..m)
        .filter(|&j| (0..n).any(|i| w[i] != 0.0 && g(i, j) != 0.0))
        .collect();
    if !(0..3).all(|q| live.contains(&q)) {
        return None;
    }
    let l = live.len();
    let mut ata = vec![vec![0.0; l]; l];
    for (a, &ja) in live.iter().enumerate() {
        for (b, &jb) in live.iter().enumerate() {
            ata[a][b] = (0..n).map(|i| g(i, ja) * w[i] * g(i, jb)).sum();
        }
    }
    let cov = invert(&ata)?;
    let mut s = [vec![0.0; n], vec![0.0; n], vec![0.0; n]];
    let mut sigma = [0.0; 3];
    for q in 0..3 {
        let a = live.iter().position(|&j| j == q)?;
        if cov[a][a] < 0.0 {
            return None;
        }
        sigma[q] = cov[a][a].sqrt();
        for i in 0..n {
            s[q][i] = (0..l).map(|b| cov[a][b] * g(i, live[b])).sum::<f64>() * w[i];
        }
    }
    Some(SubSolution { s, sigma })
}

/// `√(Σ_i row_i² · c_i)` — the standard deviation an estimator row implies under a
/// diagonal measurement covariance.
fn quadrature(row: &[f64], c: &[f64]) -> f64 {
    row.iter()
        .zip(c)
        .map(|(r, ci)| r * r * ci)
        .sum::<f64>()
        .max(0.0)
        .sqrt()
}

/// `N_fault,max` from the reference's `φ_P_THRES` rule: the largest `r` for which
/// the probability of `r + 1` or more simultaneous independent events stays below
/// `P_THRES`, using the published bound `(Σ P_event)^r / r!`.
fn n_fault_max(sum_p_event: f64, p_thres: f64) -> usize {
    let mut factorial = 1.0_f64;
    for r in 1..=20usize {
        // (r+1)! P_THRES, the upper edge of the band in which φ = r.
        factorial *= (r + 1) as f64;
        let edge = (factorial * p_thres).powf(1.0 / (r + 1) as f64);
        if sum_p_event <= edge {
            return r;
        }
    }
    21
}

/// Run the published WG-C reference airborne algorithm on `case` and return its
/// protection levels and every intermediate the published worked examples state.
///
/// The protection-level equation itself is solved by the engine's existing
/// [`crate::raim::araim_protection_level`]; see the module documentation for the
/// exact correspondence and for the single place a weight of `2` stands in for the
/// reference's two-sided fault-free term.
///
/// # Errors
///
/// Returns `Err` for an empty or inconsistent case, a singular all-in-view
/// geometry, or a case whose `N_fault,max` exceeds `1` (simultaneous multi-event
/// fault subsets are out of scope and are refused rather than dropped).
pub fn araim_reference_protection_levels(case: &ReferenceCase) -> Result<ReferenceResult, String> {
    let n = case.satellites.len();
    if n == 0 {
        return Err("a reference case needs at least one satellite".to_string());
    }
    if case.constellations == 0 {
        return Err("a reference case needs at least one constellation".to_string());
    }
    for (i, s) in case.satellites.iter().enumerate() {
        if s.constellation >= case.constellations {
            return Err(format!(
                "satellite {i} names constellation {} but only {} are declared",
                s.constellation, case.constellations
            ));
        }
        if s.c_int_m2 <= 0.0
            || s.c_acc_m2 <= 0.0
            || !s.c_int_m2.is_finite()
            || !s.c_acc_m2.is_finite()
        {
            return Err(format!("satellite {i} has a non-positive error variance"));
        }
    }
    let k = &case.constants;
    if k.p_hmi_vert <= 0.0 || k.p_hmi_horz <= 0.0 {
        return Err("both integrity-risk allocations must be positive".to_string());
    }

    // The event list the reference builds the fault modes from: one per satellite,
    // one per constellation.
    let mut p_event: Vec<f64> = vec![case.p_sat; n];
    p_event.extend(vec![case.p_const; case.constellations]);
    let sum_p_event: f64 = p_event.iter().sum();
    let nfm = n_fault_max(sum_p_event, k.p_thres);
    if nfm != 1 {
        return Err(format!(
            "this reference implementation monitors single-event fault modes only, but the \
             case's priors require N_fault,max = {nfm} (simultaneous multi-event subsets). \
             Refusing rather than under-counting fault modes."
        ));
    }

    let c_acc: Vec<f64> = case.satellites.iter().map(|s| s.c_acc_m2).collect();
    let all = vec![true; n];
    let s0 = subset_solution(case, &all).ok_or("the all-in-view geometry is singular")?;
    let bias0: [f64; 3] =
        std::array::from_fn(|q| s0.s[q].iter().map(|v| v.abs()).sum::<f64>() * case.b_nom_m);
    let sigma_v_acc = quadrature(&s0.s[2], &c_acc);

    // One monitored mode per single event, dropped when the surviving subset cannot
    // produce a position (the reference's N < 3 + M observability filter).
    struct Mode {
        label: String,
        p_fault: f64,
        sigma: [f64; 3],
        sigma_ss: [f64; 3],
        bias: [f64; 3],
        constellation: Option<usize>,
    }
    let mut modes: Vec<Mode> = Vec::new();
    let mut p_unobservable = 0.0_f64;
    let mut push = |label: String, p: f64, keep: Vec<bool>, constellation: Option<usize>| {
        let kept = keep.iter().filter(|b| **b).count();
        let used: std::collections::BTreeSet<usize> = (0..n)
            .filter(|&i| keep[i])
            .map(|i| case.satellites[i].constellation)
            .collect();
        match subset_solution(case, &keep) {
            Some(sk) if kept >= 3 + used.len() => {
                let sigma_ss = std::array::from_fn(|q| {
                    let d: Vec<f64> = (0..n).map(|i| sk.s[q][i] - s0.s[q][i]).collect();
                    quadrature(&d, &c_acc)
                });
                let bias = std::array::from_fn(|q| {
                    sk.s[q].iter().map(|v| v.abs()).sum::<f64>() * case.b_nom_m
                });
                modes.push(Mode {
                    label,
                    p_fault: p,
                    sigma: sk.sigma,
                    sigma_ss,
                    bias,
                    constellation,
                });
            }
            _ => p_unobservable += p,
        }
    };
    for i in 0..n {
        let keep: Vec<bool> = (0..n).map(|j| j != i).collect();
        push(format!("sat-{}", i + 1), case.p_sat, keep, None);
    }
    for j in 0..case.constellations {
        let keep: Vec<bool> = (0..n)
            .map(|i| case.satellites[i].constellation != j)
            .collect();
        push(
            format!("constellation-{}", j + 1),
            case.p_const,
            keep,
            Some(j),
        );
    }
    if modes.is_empty() {
        return Err("no fault mode is observable on this geometry".to_string());
    }

    // P(two or more simultaneous events), exactly as the reference writes it, plus
    // the priors of any single-event subset that had to be dropped.
    let p_no_fault: f64 = p_event.iter().map(|p| 1.0 - p).product();
    let p_exactly_one: f64 = p_no_fault * p_event.iter().map(|p| p / (1.0 - p)).sum::<f64>();
    let p_two_or_more = (1.0 - p_no_fault - p_exactly_one).max(0.0);
    let p_not_monitored = p_two_or_more + p_unobservable;
    let factor = 1.0 - p_not_monitored / (k.p_hmi_vert + k.p_hmi_horz);
    if factor <= 0.0 {
        return Err(
            "the unmonitored fault risk exhausts the whole integrity budget; no finite \
             protection level exists"
                .to_string(),
        );
    }

    let nmodes = modes.len() as f64;
    let k_fa_vert = normal_quantile(1.0 - k.p_fa_vert / (2.0 * nmodes));
    let k_fa_horz = normal_quantile(1.0 - k.p_fa_horz / (4.0 * nmodes));
    let k_fa = [k_fa_horz, k_fa_horz, k_fa_vert];

    // The engine's own mode list, per axis. The fault-free hypothesis carries the
    // weight 2 the reference's two-sided term prints; every fault mode carries its
    // prior.
    let axis_modes = |q: usize| -> Vec<AraimMode> {
        let mut v = vec![AraimMode {
            p_fault: 2.0,
            threshold_m: 0.0,
            bias_m: bias0[q],
            sigma_m: s0.sigma[q],
        }];
        v.extend(modes.iter().map(|m| AraimMode {
            p_fault: m.p_fault,
            threshold_m: k_fa[q] * m.sigma_ss[q],
            bias_m: m.bias[q],
            sigma_m: m.sigma[q],
        }));
        v
    };
    let modes_e = axis_modes(0);
    let modes_n = axis_modes(1);
    let modes_v = axis_modes(2);

    let allocated_vert = k.p_hmi_vert * factor;
    let allocated_horz = 0.5 * k.p_hmi_horz * factor;
    let vpl = araim_protection_level(&modes_v, allocated_vert);
    let hpl_e = araim_protection_level(&modes_e, allocated_horz);
    let hpl_n = araim_protection_level(&modes_n, allocated_horz);

    let emt = modes
        .iter()
        .filter(|m| m.p_fault >= k.p_emt)
        .map(|m| k_fa_vert * m.sigma_ss[2])
        .fold(0.0_f64, f64::max);

    let constellation_modes = modes
        .iter()
        .filter(|m| m.constellation.is_some())
        .map(|m| ReferenceModeReport {
            label: m.label.clone(),
            p_fault: m.p_fault,
            sigma_up_m: m.sigma[2],
            sigma_ss_up_m: m.sigma_ss[2],
            bias_up_m: m.bias[2],
            threshold_up_m: k_fa_vert * m.sigma_ss[2],
        })
        .collect();

    Ok(ReferenceResult {
        n_fault_max: nfm,
        n_fault_modes: modes.len(),
        p_fault_not_monitored: p_not_monitored,
        risk_allocation_factor: factor,
        k_fa_vert,
        k_fa_horz,
        sigma_up_m: s0.sigma[2],
        bias_up_m: bias0[2],
        vpl_m: vpl,
        hpl_m: hpl_e.hypot(hpl_n),
        hpl_east_m: hpl_e,
        hpl_north_m: hpl_n,
        emt_m: emt,
        sigma_v_acc_m: sigma_v_acc,
        achieved_risk_vert: araim_integrity_risk(vpl, &modes_v),
        allocated_risk_vert: allocated_vert,
        constellation_modes,
    })
}

// ---------------------------------------------------------------------------
// The published vectors themselves.
//
// EVERY NUMBER BELOW IS TRANSCRIBED FROM A RETRIEVED DOCUMENT. The retrieval URL,
// the date, the SHA-256 of the retrieved file and the page are recorded on each
// vector, and `tests/fixtures/araim_reference/wgc_araim_reference_vectors.txt`
// holds an independent transcription that `tests/araim_reference_vectors.rs`
// asserts these constants against. Nothing here is a reconstruction, a
// recollection or a value tuned to make a check pass.
// ---------------------------------------------------------------------------

/// The line-of-sight rows of the published example geometry, as
/// `(east, north, up, constellation)`. Both published vectors use this same
/// geometry; the 2016 report prints row 3's Up component with the opposite sign,
/// which [`published_vectors`] records and
/// [`MILESTONE3_ROW3_UP_AS_PRINTED`] carries.
const GEOMETRY: [(f64, f64, f64, usize); 10] = [
    (0.0225, 0.9951, -0.0966, 0),
    (0.6750, -0.6900, -0.2612, 0),
    (0.0723, -0.6601, -0.7477, 0),
    (-0.9398, 0.2553, -0.2269, 0),
    (-0.5907, -0.7539, -0.2877, 0),
    (-0.3236, -0.0354, -0.9455, 1),
    (-0.6748, 0.4356, -0.5957, 1),
    (0.0938, -0.7004, -0.7075, 1),
    (0.5571, 0.3088, -0.7709, 1),
    (0.6622, 0.6958, -0.2780, 1),
];

/// Row 3's Up component exactly as the 2016 Milestone 3 report prints it. The
/// document's own `σ_v,acc = 1.47 m` is only reproducible with the opposite sign
/// (the value the 2019 algorithm description prints), so this is a sign typo in
/// the 2016 print — a claim `tests/araim_reference_vectors.rs` demonstrates by
/// running both rather than asserting it.
pub const MILESTONE3_ROW3_UP_AS_PRINTED: f64 = 0.7477;

/// `C_int` diagonal (m²) of the 2019 algorithm-description example.
const ADD_V31_C_INT: [f64; 10] = [
    3.2899, 1.2792, 0.7901, 1.4430, 1.1847, 0.7737, 0.8233, 0.7962, 0.7871, 1.2166,
];
/// `C_acc` diagonal (m²) of the 2019 algorithm-description example.
const ADD_V31_C_ACC: [f64; 10] = [
    2.9774, 0.9667, 0.4776, 1.1305, 0.8722, 0.4612, 0.5108, 0.4837, 0.4746, 0.9041,
];
/// `C_int` diagonal (m²) of the 2016 Milestone 3 example.
const MS3_C_INT: [f64; 10] = [
    3.8865, 1.4377, 0.8604, 1.6383, 1.3229, 0.8434, 0.8963, 0.8669, 0.8573, 1.3616,
];
/// `C_acc` diagonal (m²) of the 2016 Milestone 3 example.
const MS3_C_ACC: [f64; 10] = [
    3.5740, 1.1252, 0.5479, 1.3258, 1.0104, 0.5309, 0.5838, 0.5544, 0.5448, 1.0491,
];

/// Build a [`ReferenceCase`] on the published geometry with the given error
/// variances and an optional override of row 3's Up component.
fn case_with(c_int: &[f64; 10], c_acc: &[f64; 10], row3_up: Option<f64>) -> ReferenceCase {
    let satellites = GEOMETRY
        .iter()
        .enumerate()
        .map(
            |(i, &(east, north, up, constellation))| ReferenceSatellite {
                east,
                north,
                up: if i == 2 { row3_up.unwrap_or(up) } else { up },
                constellation,
                c_int_m2: c_int[i],
                c_acc_m2: c_acc[i],
            },
        )
        .collect();
    ReferenceCase {
        satellites,
        constellations: 2,
        b_nom_m: 0.5,
        p_sat: 1e-5,
        p_const: 1e-4,
        constants: ReferenceConstants::LPV_200,
    }
}

/// One published worked example: where it came from, what it states, and the
/// tolerance the source itself specifies.
#[derive(Clone, Debug)]
pub struct PublishedVector {
    /// Stable identifier used to select this vector in the scenario.
    pub id: &'static str,
    /// Full citation of the source document.
    pub citation: &'static str,
    /// The URL the document was retrieved from.
    pub url: &'static str,
    /// ISO date on which the document was retrieved.
    pub retrieved: &'static str,
    /// SHA-256 of the retrieved file, so the transcription is checkable against
    /// the exact bytes that were read.
    pub source_sha256: &'static str,
    /// Where in the document the worked example appears.
    pub location: &'static str,
    /// `TOL_PL` (m) — the tolerance the source specifies for a protection level.
    pub tolerance_m: f64,
    /// Where that tolerance is stated in the source.
    pub tolerance_source: &'static str,
    /// Published `VPL` (m).
    pub vpl_m: f64,
    /// Published `HPL` (m).
    pub hpl_m: f64,
    /// Published `EMT` (m).
    pub emt_m: f64,
    /// Published `σ_v,acc` (m).
    pub sigma_v_acc_m: f64,
    /// Published `K_fa,3` (dimensionless).
    pub k_fa_vert: f64,
    /// The `N_fault modes` the published `K_fa,3` is computed with.
    pub n_fault_modes_in_k_fa: usize,
    /// Published `σ_3⁽ᵏ⁾` (m) for the two constellation-fault modes.
    pub constellation_sigma_up_m: [f64; 2],
    /// Published `σ_ss,3⁽ᵏ⁾` (m) for the two constellation-fault modes.
    pub constellation_sigma_ss_up_m: [f64; 2],
    /// Published `b_3⁽ᵏ⁾` (m) for the two constellation-fault modes.
    pub constellation_bias_up_m: [f64; 2],
    /// Whether the source's own `VPL` and `HPL` are internally consistent enough
    /// to be reproducible to `tolerance_m`. `false` marks a vector kept for the
    /// record whose protection levels a conforming implementation cannot match,
    /// with the reason in `note`.
    pub protection_levels_reproducible: bool,
    /// Anything an auditor must know about this vector before trusting it.
    pub note: &'static str,
    /// The inputs, ready to run.
    pub case: ReferenceCase,
}

/// The published ARAIM reference vectors this crate checks itself against.
///
/// The first is the 2019 Reference Airborne Algorithm Description Document v3.1,
/// Appendix D — the current, internally consistent statement of the WG-C reference
/// algorithm's worked example. The second is the 2016 Milestone 3 report,
/// Annex A §A.IX — the same example in the report the research bibliographies
/// cite, kept because it is the cited authority, and carrying the two internal
/// inconsistencies its `note` records.
///
/// PIN-SCOPE:    the `source_sha256` of each cited PDF as retrieved — provenance for the
///               external document the numbers below were transcribed from, checked by
///               `tests/araim_reference_vectors.rs` against the fixture header.
/// PIN-EXCLUDES: everything kshana emits. These digests are of third-party documents and
///               cannot move when kshana's own output changes; equally, a re-issue of
///               either PDF moves them without any change here being wrong.
pub fn published_vectors() -> Vec<PublishedVector> {
    vec![
        PublishedVector {
            id: "add-v3.1-appendix-d",
            citation: "EU-U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM \
                       Technical Subgroup, Reference Airborne Algorithm Description Document, \
                       Version 3.1, 20 June 2019",
            url: "https://web.stanford.edu/group/scpnt/gpslab/website_files/maast/\
                  ARAIM_TSG_Reference_ADD_v3.1.pdf",
            retrieved: "2026-09-20",
            source_sha256: "7f42934488c5c2261363439fabd48385e39526df34d514f395e22b6990b6bdb7",
            location: "Appendix D, 'Numerical example for LPV-200', equations (79)-(84), \
                       pp. 30-31",
            tolerance_m: 5e-2,
            tolerance_source: "TOL_PL, 'tolerance for the computation of the Protection Level', \
                               Table 4 (constants derived from the navigation requirements); the \
                               text requires the output VPL to be within TOL_PL of the solution \
                               of the protection-level equation",
            vpl_m: 18.3,
            hpl_m: 13.45,
            emt_m: 7.2998,
            sigma_v_acc_m: 1.3694,
            k_fa_vert: 5.1083,
            n_fault_modes_in_k_fa: 12,
            constellation_sigma_up_m: [2.4600, 2.4359],
            constellation_sigma_ss_up_m: [1.4290, 1.4217],
            constellation_bias_up_m: [2.8915, 2.0875],
            protection_levels_reproducible: true,
            note: "Self-consistent: N_fault,max = 1 gives 12 monitored fault modes (10 \
                   single-satellite + 2 constellation) and the printed K_fa,3 is evaluated at \
                   2 x 12, matching. This is the acceptance vector.",
            case: case_with(&ADD_V31_C_INT, &ADD_V31_C_ACC, None),
        },
        PublishedVector {
            id: "milestone3-annex-a-ix",
            citation: "EU-U.S. Cooperation on Satellite Navigation, Working Group C, ARAIM \
                       Technical Subgroup, Milestone 3 Report, Final Version, 25 February 2016",
            url: "https://www.gps.gov/sites/default/files/2025-09/ARAIM-milestone-3-report.pdf",
            retrieved: "2026-09-20",
            source_sha256: "156147e1e7aa9514cf7c9b7c7df9762daa7845981ec7037ad3e8aa5baeae13d8",
            location: "Annex A, section A.IX 'Numerical example', equations (60)-(65), pp. 95-97",
            tolerance_m: 5e-2,
            tolerance_source: "TOL_PL, 'tolerance for the computation of the Protection Level', \
                               Table 24 (list of constants), Annex A section A.III.3",
            vpl_m: 19.2,
            hpl_m: 14.5,
            emt_m: 8.3,
            sigma_v_acc_m: 1.47,
            k_fa_vert: 5.3953,
            n_fault_modes_in_k_fa: 57,
            constellation_sigma_up_m: [2.5760, 2.5577],
            constellation_sigma_ss_up_m: [1.5307, 1.5292],
            constellation_bias_up_m: [2.8935, 2.0875],
            protection_levels_reproducible: false,
            note: "TWO INTERNAL INCONSISTENCIES, both demonstrated rather than assumed in \
                   tests/araim_reference_vectors.rs. (1) Row 3's Up component is printed as \
                   +0.7477; the document's own sigma_v,acc = 1.47 m is only reproducible with \
                   -0.7477, the sign the 2019 description prints. (2) The document states \
                   N_fault,max = 1, which yields 12 monitored fault modes, but its printed \
                   K_fa,3 = 5.3953 is evaluated at 2 x 57 and its EMT = 8.3 m follows that \
                   K_fa,3, while its VPL and HPL do not. A conforming implementation therefore \
                   cannot reproduce all of this vector's outputs at once; the geometry-derived \
                   intermediates, which carry no such ambiguity, are reproduced exactly.",
            case: case_with(&MS3_C_INT, &MS3_C_ACC, None),
        },
    ]
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

fn arc_default_vector() -> String {
    "all".to_string()
}

/// The `araim-reference-check` scenario: run the engine's ARAIM protection levels
/// against the published WG-C reference vectors and report the agreement against
/// the tolerance the reference itself states.
#[derive(Deserialize)]
pub struct AraimReferenceCheckScenario {
    /// Which vector to run: `all` (default), `add-v3.1-appendix-d`, or
    /// `milestone3-annex-a-ix`.
    #[serde(default = "arc_default_vector")]
    pub vector: String,
}

impl Default for AraimReferenceCheckScenario {
    fn default() -> Self {
        AraimReferenceCheckScenario {
            vector: arc_default_vector(),
        }
    }
}

impl AraimReferenceCheckScenario {
    /// Run the scenario, returning `(json, summary)`.
    ///
    /// # Errors
    ///
    /// Returns `Err` if `vector` names no published vector, or if the reference
    /// algorithm refuses a case.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let all = published_vectors();
        let wanted: Vec<&PublishedVector> = if self.vector == "all" {
            all.iter().collect()
        } else {
            let hit: Vec<&PublishedVector> = all.iter().filter(|v| v.id == self.vector).collect();
            if hit.is_empty() {
                let ids: Vec<&str> = all.iter().map(|v| v.id).collect();
                return Err(format!(
                    "unknown reference vector '{}'; known vectors: {} (or 'all')",
                    self.vector,
                    ids.join(", ")
                ));
            }
            hit
        };

        let mut rows = Vec::new();
        let mut worst_acceptance = 0.0_f64;
        let mut acceptance_checked = 0usize;
        for v in &wanted {
            let r = araim_reference_protection_levels(&v.case)?;
            let d_vpl = (r.vpl_m - v.vpl_m).abs();
            let d_hpl = (r.hpl_m - v.hpl_m).abs();
            let d_emt = (r.emt_m - v.emt_m).abs();
            let d_sig = (r.sigma_v_acc_m - v.sigma_v_acc_m).abs();
            if v.protection_levels_reproducible {
                acceptance_checked += 1;
                worst_acceptance = worst_acceptance.max(d_vpl).max(d_hpl);
            }
            let const_rows: Vec<serde_json::Value> = r
                .constellation_modes
                .iter()
                .enumerate()
                .map(|(j, m)| {
                    serde_json::json!({
                        "label": m.label,
                        "p_fault": m.p_fault,
                        "sigma_up_m": m.sigma_up_m,
                        "sigma_up_published_m": v.constellation_sigma_up_m.get(j),
                        "sigma_ss_up_m": m.sigma_ss_up_m,
                        "sigma_ss_up_published_m": v.constellation_sigma_ss_up_m.get(j),
                        "bias_up_m": m.bias_up_m,
                        "bias_up_published_m": v.constellation_bias_up_m.get(j),
                        "threshold_up_m": m.threshold_up_m,
                    })
                })
                .collect();
            rows.push(serde_json::json!({
                "id": v.id,
                "citation": v.citation,
                "url": v.url,
                "retrieved": v.retrieved,
                "source_sha256": v.source_sha256,
                "location": v.location,
                "tolerance_m": v.tolerance_m,
                "tolerance_source": v.tolerance_source,
                "protection_levels_reproducible": v.protection_levels_reproducible,
                "note": v.note,
                "n_fault_max": r.n_fault_max,
                "n_fault_modes": r.n_fault_modes,
                "n_fault_modes_in_published_k_fa": v.n_fault_modes_in_k_fa,
                "p_fault_not_monitored": r.p_fault_not_monitored,
                "risk_allocation_factor": r.risk_allocation_factor,
                "k_fa_vert": r.k_fa_vert,
                "k_fa_vert_published": v.k_fa_vert,
                "k_fa_horz": r.k_fa_horz,
                "vpl_m": r.vpl_m,
                "vpl_published_m": v.vpl_m,
                "vpl_abs_error_m": d_vpl,
                "vpl_within_tolerance": d_vpl <= v.tolerance_m,
                "hpl_m": r.hpl_m,
                "hpl_published_m": v.hpl_m,
                "hpl_abs_error_m": d_hpl,
                "hpl_within_tolerance": d_hpl <= v.tolerance_m,
                "hpl_east_m": r.hpl_east_m,
                "hpl_north_m": r.hpl_north_m,
                "emt_m": r.emt_m,
                "emt_published_m": v.emt_m,
                "emt_abs_error_m": d_emt,
                "sigma_v_acc_m": r.sigma_v_acc_m,
                "sigma_v_acc_published_m": v.sigma_v_acc_m,
                "sigma_v_acc_abs_error_m": d_sig,
                "sigma_up_m": r.sigma_up_m,
                "bias_up_m": r.bias_up_m,
                "achieved_risk_vert": r.achieved_risk_vert,
                "allocated_risk_vert": r.allocated_risk_vert,
                "constellation_modes": const_rows,
            }));
        }

        let units = serde_json::json!({
            "vectors[].tolerance_m": {"unit": "m", "provenance": "published", "note": "TOL_PL as stated by the source document"},
            "vectors[].n_fault_max": {"unit": "count", "provenance": "computed"},
            "vectors[].n_fault_modes": {"unit": "count", "provenance": "computed"},
            "vectors[].n_fault_modes_in_published_k_fa": {"unit": "count", "provenance": "published"},
            "vectors[].p_fault_not_monitored": {"unit": "probability per approach (dimensionless)", "provenance": "computed"},
            "vectors[].risk_allocation_factor": {"unit": "fraction (dimensionless)", "provenance": "computed"},
            "vectors[].k_fa_vert": {"unit": "sigma multiplier (dimensionless)", "provenance": "computed"},
            "vectors[].k_fa_vert_published": {"unit": "sigma multiplier (dimensionless)", "provenance": "published"},
            "vectors[].k_fa_horz": {"unit": "sigma multiplier (dimensionless)", "provenance": "computed"},
            "vectors[].vpl_m": {"unit": "m", "provenance": "computed"},
            "vectors[].vpl_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].vpl_abs_error_m": {"unit": "m", "provenance": "computed", "note": "|computed - published|"},
            "vectors[].hpl_m": {"unit": "m", "provenance": "computed"},
            "vectors[].hpl_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].hpl_abs_error_m": {"unit": "m", "provenance": "computed", "note": "|computed - published|"},
            "vectors[].hpl_east_m": {"unit": "m", "provenance": "computed"},
            "vectors[].hpl_north_m": {"unit": "m", "provenance": "computed"},
            "vectors[].emt_m": {"unit": "m", "provenance": "computed"},
            "vectors[].emt_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].emt_abs_error_m": {"unit": "m", "provenance": "computed"},
            "vectors[].sigma_v_acc_m": {"unit": "m", "provenance": "computed"},
            "vectors[].sigma_v_acc_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].sigma_v_acc_abs_error_m": {"unit": "m", "provenance": "computed"},
            "vectors[].sigma_up_m": {"unit": "m", "provenance": "computed"},
            "vectors[].bias_up_m": {"unit": "m", "provenance": "computed"},
            "vectors[].achieved_risk_vert": {"unit": "probability per approach (dimensionless)", "provenance": "computed"},
            "vectors[].allocated_risk_vert": {"unit": "probability per approach (dimensionless)", "provenance": "computed"},
            "vectors[].constellation_modes[].p_fault": {"unit": "probability per approach (dimensionless)", "provenance": "input"},
            "vectors[].constellation_modes[].sigma_up_m": {"unit": "m", "provenance": "computed"},
            "vectors[].constellation_modes[].sigma_up_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].constellation_modes[].sigma_ss_up_m": {"unit": "m", "provenance": "computed"},
            "vectors[].constellation_modes[].sigma_ss_up_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].constellation_modes[].bias_up_m": {"unit": "m", "provenance": "computed"},
            "vectors[].constellation_modes[].bias_up_published_m": {"unit": "m", "provenance": "published"},
            "vectors[].constellation_modes[].threshold_up_m": {"unit": "m", "provenance": "computed"},
            "worst_acceptance_error_m": {"unit": "m", "provenance": "computed", "note": "the largest |computed - published| over the VPL and HPL of every vector whose protection levels the source states consistently"},
            "acceptance_tolerance_m": {"unit": "m", "provenance": "published", "note": "TOL_PL"},
            "vectors_checked": {"unit": "count", "provenance": "computed"},
            "acceptance_vectors": {"unit": "count", "provenance": "computed"},
        });

        let tol = wanted
            .iter()
            .filter(|v| v.protection_levels_reproducible)
            .map(|v| v.tolerance_m)
            .fold(f64::INFINITY, f64::min);
        let tol = if tol.is_finite() { tol } else { 0.0 };
        let mut json = serde_json::json!({
            "kind": "araim-reference-check",
            "label": "EXTERNALLY CHECKED — the engine's ARAIM protection levels run against the \
                      published worked numerical examples of the EU-U.S. Working Group C ARAIM \
                      Technical Subgroup reference airborne algorithm, at the tolerance (TOL_PL) \
                      those documents themselves state. Every published figure carries its \
                      source URL, retrieval date, file SHA-256 and page. This reproduces a \
                      reference algorithm's worked example; it is NOT a certification, an \
                      airworthiness artefact or an approval.",
            "vectors": rows,
            "vectors_checked": wanted.len(),
            "acceptance_vectors": acceptance_checked,
            "acceptance_tolerance_m": tol,
            "worst_acceptance_error_m": worst_acceptance,
            "acceptance_met": acceptance_checked > 0 && worst_acceptance <= tol,
            "acceptance_definition": "For every vector whose source states its protection levels \
                                      consistently, |computed - published| for both VPL and HPL \
                                      must not exceed TOL_PL, the tolerance the source itself \
                                      specifies for a protection-level computation. Vectors \
                                      flagged protection_levels_reproducible = false are reported \
                                      in full but excluded from the acceptance figure; their \
                                      reason is in their note.",
        });
        json["units"] = units;

        let summary = format!(
            "araim-reference-check: {} published WG-C reference vector(s); worst VPL/HPL \
             agreement {:.4} m against the reference's own TOL_PL = {:.2} m over {} acceptance \
             vector(s)",
            wanted.len(),
            worst_acceptance,
            tol,
            acceptance_checked,
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn vector(id: &str) -> PublishedVector {
        published_vectors()
            .into_iter()
            .find(|v| v.id == id)
            .expect("known vector id")
    }

    #[test]
    fn the_published_variance_diagonals_differ_by_exactly_the_published_ura_ure_gap() {
        // C_int - C_acc = sigma_URA^2 - sigma_URE^2 = 0.75^2 - 0.50^2 = 0.3125 m^2 for
        // every satellite, in BOTH documents. This is an arithmetic identity the two
        // transcribed diagonals must satisfy — a transcription typo in any of the 40
        // numbers breaks it.
        let gap = 0.75f64.powi(2) - 0.50f64.powi(2);
        for v in published_vectors() {
            for (i, s) in v.case.satellites.iter().enumerate() {
                assert!(
                    (s.c_int_m2 - s.c_acc_m2 - gap).abs() < 5e-13,
                    "{}: satellite {i} C_int - C_acc = {}, expected {gap}",
                    v.id,
                    s.c_int_m2 - s.c_acc_m2
                );
            }
        }
    }

    #[test]
    fn the_published_geometry_rows_are_unit_line_of_sight_vectors() {
        for v in published_vectors() {
            for (i, s) in v.case.satellites.iter().enumerate() {
                let norm = (s.east * s.east + s.north * s.north + s.up * s.up).sqrt();
                assert!(
                    (norm - 1.0).abs() < 1e-4,
                    "{}: row {i} has norm {norm}, not a unit line of sight",
                    v.id
                );
            }
        }
    }

    #[test]
    fn the_reference_rule_gives_single_event_fault_modes_for_the_published_priors() {
        // 10 satellites at P_sat = 1e-5 and 2 constellations at P_const = 1e-4 sum to
        // 3e-4, which the published phi rule maps to N_fault,max = 1 — exactly what
        // both documents state.
        assert_eq!(n_fault_max(3e-4, 8e-8), 1);
        // A far heavier prior needs more simultaneous events, and the engine must say
        // so rather than silently monitor too few modes.
        assert!(n_fault_max(5e-3, 8e-8) > 1);
        let mut heavy = vector("add-v3.1-appendix-d").case;
        heavy.p_sat = 1e-3;
        heavy.p_const = 1e-3;
        let err = araim_reference_protection_levels(&heavy).expect_err("must refuse");
        assert!(err.contains("N_fault,max"), "{err}");
    }

    #[test]
    fn the_scenario_runs_every_vector_and_reports_the_published_tolerance() {
        let (json, summary) = AraimReferenceCheckScenario::default()
            .run_json()
            .expect("the reference check runs");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        assert_eq!(v["kind"], "araim-reference-check");
        assert_eq!(v["vectors_checked"], 2);
        assert_eq!(v["acceptance_vectors"], 1);
        assert_eq!(v["acceptance_tolerance_m"], 5e-2);
        assert_eq!(v["acceptance_met"], true);
        assert!(summary.contains("araim-reference-check"));
        // Selecting one vector by id narrows the run.
        let one = AraimReferenceCheckScenario {
            vector: "milestone3-annex-a-ix".to_string(),
        };
        let (json, _) = one.run_json().expect("single vector runs");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        assert_eq!(v["vectors_checked"], 1);
        assert_eq!(v["vectors"][0]["id"], "milestone3-annex-a-ix");
        // An unknown id is an error naming the vectors that do exist.
        let err = AraimReferenceCheckScenario {
            vector: "nope".to_string(),
        }
        .run_json()
        .expect_err("unknown vector");
        assert!(err.contains("add-v3.1-appendix-d"), "{err}");
    }

    #[test]
    fn every_reported_figure_carries_a_unit_and_a_provenance_class() {
        let (json, _) = AraimReferenceCheckScenario::default()
            .run_json()
            .expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("valid JSON");
        let units = v["units"].as_object().expect("a units block");
        assert!(!units.is_empty());
        for (field, meta) in units {
            assert!(meta["unit"].is_string(), "{field} has no unit");
            assert!(
                meta["provenance"].is_string(),
                "{field} has no provenance class"
            );
        }
        // Every numeric field of the report is described, at the top level and in
        // both nested tables. A published figure must be labelled `published`, so a
        // transcribed number can never be mistaken for a computed one.
        let described: std::collections::HashSet<&str> = units.keys().map(|k| k.as_str()).collect();
        for (key, value) in v.as_object().expect("an object") {
            if value.is_number() {
                assert!(described.contains(key.as_str()), "{key} has no unit entry");
            }
        }
        for (key, value) in v["vectors"][0].as_object().expect("a vector row") {
            if value.is_number() {
                let path = format!("vectors[].{key}");
                assert!(
                    described.contains(path.as_str()),
                    "{path} has no unit entry"
                );
                if key.contains("published") {
                    assert_eq!(units[&path]["provenance"], "published", "{path}");
                }
            }
        }
        for (key, value) in v["vectors"][0]["constellation_modes"][0]
            .as_object()
            .expect("a mode row")
        {
            if value.is_number() {
                let path = format!("vectors[].constellation_modes[].{key}");
                assert!(
                    described.contains(path.as_str()),
                    "{path} has no unit entry"
                );
            }
        }
    }

    #[test]
    fn the_returned_vpl_actually_meets_the_budget_it_was_solved_against() {
        for v in published_vectors() {
            let r = araim_reference_protection_levels(&v.case).expect("runs");
            assert!(
                r.achieved_risk_vert <= r.allocated_risk_vert * (1.0 + 1e-9),
                "{}: achieved {} exceeds allocated {}",
                v.id,
                r.achieved_risk_vert,
                r.allocated_risk_vert
            );
            assert!(r.vpl_m.is_finite() && r.vpl_m > 0.0);
            assert!(r.hpl_m.is_finite() && r.hpl_m > 0.0);
        }
    }
}
