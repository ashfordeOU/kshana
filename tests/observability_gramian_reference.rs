// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's observability-Gramian-over-arc core
//! ([`kshana::observability_gramian`], paper P6) against an **independent third-party
//! authority**: NumPy (`numpy.linalg.matrix_rank` / `numpy.linalg.svd` /
//! `numpy.linalg.eigvalsh` / `numpy.linalg.cond`; BSD-3-Clause, LAPACK-backed).
//!
//! kshana reads the observable RANK of the stacked observability matrix
//! `O = stack_k[ H_k . Phi_k ]` from a rank-revealing singular-value threshold implemented
//! as the eigenvalues of `O^T O` via a hand-rolled cyclic Jacobi sweep
//! ([`kshana::fim::sym_eig`]), and the dt-weighted Gramian `W`'s eigen-spectrum, min/max
//! eigenvalue and condition number from that same Jacobi solver plus
//! [`kshana::fim::design_metrics`]. This test recomputes those SAME quantities on the SAME
//! numeric matrices with a COMPLETELY DIFFERENT machine — LAPACK's divide-and-conquer
//! eigensolver and Golub–Reinsch/gesdd SVD, reached through NumPy — so agreement pins
//! kshana's rank read, eigen-spectrum and conditioning to an external linear-algebra
//! authority, not to kshana's own kernels.
//!
//! The observability matrix `O` is fully specified by fixed numeric inputs committed in the
//! fixture: the chief/reference planar states, a fixed small set of state-transition matrices
//! `Phi_k` (identity at t=0, then explicit near-identity couplings that grow the arc from
//! rank-1 toward the full four-state), and the per-epoch weights `dt_k`. The Rust side rebuilds
//! the single range Jacobian row `H_k` with kshana's own [`kshana::intersat_range::range_row`]
//! from those states and assembles `O` through kshana's [`kshana::observability_gramian`], while
//! the NumPy generator rebuilds the identical `H_k` independently — so both codebases consume the
//! same `O` and nothing kshana computes leaks into the oracle.
//!
//! Reference vectors, provenance and the generator live in
//! `tests/fixtures/observability_gramian/generate.py`
//! (`python3 generate.py > observability_gramian_reference.txt`; NumPy only, no network — the
//! Rust test reads the committed `.txt`, so CI needs no Python).

use kshana::intersat_range::{range_row, PlanarState};
use kshana::observability_gramian::{
    gramian, gramian_spectrum, observability_matrix, observable_rank, rank_vs_arc, ObsEpoch, Mat,
    N_PLANAR,
};

const REF: &str = include_str!("fixtures/observability_gramian/observability_gramian_reference.txt");

/// LAPACK (NumPy) and the crate's Jacobi sweep agree to ~1e-12 on well-conditioned symmetric
/// inputs; a relative bound of 1e-8 stays well inside that without hiding drift (the smallest
/// Gramian eigenvalue here is ~9e-9, so an absolute 1e-9 floor is added for the tiny modes).
const TOL_REL: f64 = 1e-8;
const TOL_ABS: f64 = 1e-9;
/// The relative singular-value threshold the fixture and the crate both use for the rank read
/// (`σ > rel_tol·σ_max`, the one P6 observability rank convention; paper default 1e-6).
const REL_TOL: f64 = 1e-6;

struct Fixture {
    chief: PlanarState,
    reference: PlanarState,
    phis: Vec<Mat>,
    dts: Vec<f64>,
    rankarc: Vec<(usize, usize, usize, f64, f64)>, // epoch_index, n_rows, rank, smax, smin
    o_full_rank: usize,
    gramian_eigs_ascending: Vec<f64>,
    gramian_lambda_min: f64,
    gramian_lambda_max: f64,
    gramian_trace: f64,
    gramian_condition: f64,
}

fn parse_state4(tokens: &[&str]) -> PlanarState {
    assert_eq!(tokens.len(), 4, "need 4 numbers for a planar state");
    [
        tokens[0].parse().unwrap(),
        tokens[1].parse().unwrap(),
        tokens[2].parse().unwrap(),
        tokens[3].parse().unwrap(),
    ]
}

fn parse_fixture(text: &str) -> Fixture {
    let mut chief = None;
    let mut reference = None;
    let mut dts: Vec<f64> = Vec::new();
    let mut phis: Vec<Mat> = Vec::new();
    let mut cur_mat: Option<Mat> = None;
    let mut cur_is_phi = false;
    let mut rankarc = Vec::new();
    let mut o_full_rank = None;
    let mut eigs: Vec<f64> = Vec::new();
    let mut lmin = None;
    let mut lmax = None;
    let mut trace = None;
    let mut condition = None;

    let flush_mat = |cur_mat: &mut Option<Mat>, cur_is_phi: &mut bool, phis: &mut Vec<Mat>| {
        if let Some(m) = cur_mat.take() {
            if *cur_is_phi {
                phis.push(m);
            }
            *cur_is_phi = false;
        }
    };

    for line in text.lines() {
        let line = line.trim_end();
        if let Some(rest) = line.strip_prefix("# CHIEF ") {
            chief = Some(parse_state4(&rest.split_whitespace().collect::<Vec<_>>()));
        } else if let Some(rest) = line.strip_prefix("# REF ") {
            reference = Some(parse_state4(&rest.split_whitespace().collect::<Vec<_>>()));
        } else if let Some(rest) = line.strip_prefix("# DTS ") {
            dts = rest.split_whitespace().map(|s| s.parse().unwrap()).collect();
        } else if let Some(rest) = line.strip_prefix("# MATRIX ") {
            flush_mat(&mut cur_mat, &mut cur_is_phi, &mut phis);
            cur_mat = Some(Vec::new());
            cur_is_phi = rest.starts_with("PHI");
        } else if let Some(rest) = line.strip_prefix("ROW ") {
            if let Some(m) = cur_mat.as_mut() {
                m.push(rest.split_whitespace().map(|s| s.parse().unwrap()).collect());
            }
        } else if let Some(rest) = line.strip_prefix("RANKARC ") {
            let t: Vec<&str> = rest.split_whitespace().collect();
            rankarc.push((
                t[0].parse().unwrap(),
                t[1].parse().unwrap(),
                t[2].parse().unwrap(),
                t[3].parse().unwrap(),
                t[4].parse().unwrap(),
            ));
        } else if let Some(rest) = line.strip_prefix("# O_FULL_RANK ") {
            o_full_rank = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("EIGS ") {
            eigs = rest.split_whitespace().map(|s| s.parse().unwrap()).collect();
        } else if let Some(rest) = line.strip_prefix("# GRAMIAN_LAMBDA_MIN ") {
            lmin = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("# GRAMIAN_LAMBDA_MAX ") {
            lmax = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("# GRAMIAN_TRACE ") {
            trace = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("# GRAMIAN_CONDITION ") {
            condition = Some(rest.trim().parse().unwrap());
        }
    }
    flush_mat(&mut cur_mat, &mut cur_is_phi, &mut phis);

    Fixture {
        chief: chief.expect("CHIEF"),
        reference: reference.expect("REF"),
        phis,
        dts,
        rankarc,
        o_full_rank: o_full_rank.expect("O_FULL_RANK"),
        gramian_eigs_ascending: eigs,
        gramian_lambda_min: lmin.expect("LAMBDA_MIN"),
        gramian_lambda_max: lmax.expect("LAMBDA_MAX"),
        gramian_trace: trace.expect("TRACE"),
        gramian_condition: condition.expect("CONDITION"),
    }
}

/// Rebuild the ObsEpoch arc from the fixture's fixed inputs: kshana's own range Jacobian row
/// from the (chief, reference) states, and the fixture's committed Phi_k, weighted by dt_k.
/// Single range-only link -> one H row per epoch (the paper P6 Table-1 series).
fn build_epochs(f: &Fixture) -> Vec<ObsEpoch> {
    let (_rho, h_row) = range_row(&f.chief, &f.reference);
    f.phis
        .iter()
        .zip(&f.dts)
        .map(|(phi, &dt)| ObsEpoch {
            h: vec![h_row.to_vec()],
            phi: phi.clone(),
            dt,
        })
        .collect()
}

fn close(got: f64, want: f64) -> bool {
    (got - want).abs() <= TOL_ABS + TOL_REL * want.abs()
}

// ── (a) rank-vs-arc: kshana's SVD-threshold rank matches numpy.linalg.matrix_rank ──
#[test]
fn rank_vs_arc_matches_numpy_matrix_rank() {
    let f = parse_fixture(REF);
    let epochs = build_epochs(&f);
    let table = rank_vs_arc(&epochs, REL_TOL);
    assert_eq!(
        table.len(),
        f.rankarc.len(),
        "arc length mismatch vs fixture"
    );
    for (p, &(ei, nrows, rank, smax, smin)) in table.iter().zip(&f.rankarc) {
        assert_eq!(p.epoch_index, ei, "epoch index");
        assert_eq!(p.n_rows, nrows, "n_rows at epoch {ei}");
        assert_eq!(
            p.rank, rank,
            "kshana rank {} != numpy.linalg.matrix_rank {} at epoch {ei}",
            p.rank, rank
        );
        assert!(
            close(p.sigma_max, smax),
            "sigma_max {} vs numpy {} at epoch {ei}",
            p.sigma_max,
            smax
        );
        assert!(
            close(p.sigma_min, smin),
            "sigma_min {} vs numpy {} at epoch {ei}",
            p.sigma_min,
            smin
        );
    }
    // The arc must genuinely grow 1 -> ... -> full rank (else the paper's claim is vacuous).
    assert_eq!(table[0].rank, 1, "single instantaneous range is rank-1");
    assert_eq!(
        table.last().unwrap().rank,
        N_PLANAR,
        "full observability over the arc"
    );
}

// ── (b) full-arc observable rank matches numpy on the stacked O ──
#[test]
fn full_arc_observable_rank_matches_numpy() {
    let f = parse_fixture(REF);
    let epochs = build_epochs(&f);
    let (o, _w) = observability_matrix(&epochs);
    let rank = observable_rank(&o, REL_TOL);
    assert_eq!(
        rank, f.o_full_rank,
        "full-arc observable rank {rank} != numpy.linalg.matrix_rank {}",
        f.o_full_rank
    );
    assert_eq!(rank, N_PLANAR);
}

// ── (c) Gramian eigen-spectrum + min/max + trace + condition vs numpy.linalg.eigvalsh/cond ──
#[test]
fn gramian_spectrum_matches_numpy_eigh_and_cond() {
    let f = parse_fixture(REF);
    let epochs = build_epochs(&f);
    let w = gramian(&epochs);
    let spec = gramian_spectrum(&w, REL_TOL);

    // Eigenvalues (ascending) match numpy.linalg.eigvalsh to relative+absolute tolerance.
    assert_eq!(
        spec.eigenvalues.len(),
        f.gramian_eigs_ascending.len(),
        "eigen count"
    );
    for (got, want) in spec.eigenvalues.iter().zip(&f.gramian_eigs_ascending) {
        assert!(
            close(*got, *want),
            "Gramian eigenvalue {got} differs from numpy {want}"
        );
    }
    assert!(
        close(spec.min_eigenvalue, f.gramian_lambda_min),
        "lambda_min {} vs numpy {}",
        spec.min_eigenvalue,
        f.gramian_lambda_min
    );
    assert!(
        close(spec.max_eigenvalue, f.gramian_lambda_max),
        "lambda_max {} vs numpy {}",
        spec.max_eigenvalue,
        f.gramian_lambda_max
    );
    assert!(
        close(spec.trace, f.gramian_trace),
        "trace {} vs numpy {}",
        spec.trace,
        f.gramian_trace
    );
    // Condition number lambda_max/lambda_min vs numpy.linalg.cond (2-norm) — a looser relative
    // bound because it amplifies the ~9e-9 smallest-eigenvalue relative error.
    let cond_rel = (spec.condition - f.gramian_condition).abs() / f.gramian_condition;
    assert!(
        cond_rel < 1e-4,
        "Gramian condition {} vs numpy {} (rel {cond_rel:.2e})",
        spec.condition,
        f.gramian_condition
    );

    eprintln!(
        "observability_gramian_reference: kshana vs numpy — full rank {}, lambda [{:.3e} .. {:.3e}], \
         cond {:.3e} (numpy {:.3e})",
        spec.rank, spec.min_eigenvalue, spec.max_eigenvalue, spec.condition, f.gramian_condition
    );
}
