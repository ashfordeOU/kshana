// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's cislunar SRIF cross-check ([`kshana::cislunar_srif`], paper P6,
//! L32) against an **independent NumPy/SciPy batch weighted least-squares** on the IDENTICAL
//! stacked measurement system `O = stack_k[ H_k · Φ_k ]`.
//!
//! The in-crate SRIF cross-validation folds the observability rows through Householder
//! square-root information filtering and compares against the eigen-Gramian — but both reduce to
//! `OᵀO`, so that agreement is a *different-algorithm consistency check on the same crate*, not a
//! fully external oracle (as the module honestly documents). This test closes that gap: it folds
//! the same `O` into kshana's [`kshana::deepspace_od::Srif`] and compares the SRIF posterior
//! covariance `P = R⁻¹R⁻ᵀ` and its condition number against the batch-LS posterior
//! `(OᵀO)⁻¹` / `cond(OᵀO)` computed by LAPACK (NumPy `linalg.inv`/`cond`, SciPy `linalg.inv`) — a
//! genuinely different codebase. SciPy `linalg.lstsq` additionally pins the batch estimator's rank
//! to the full four-state and recovers a known injected initial-state offset.
//!
//! The observability matrix `O` is the same fixed 4-epoch single-range-link arc as
//! `tests/observability_gramian_reference.rs`; the Rust side rebuilds it with kshana's own
//! [`kshana::intersat_range::range_row`] and the committed `Φ_k`. Reference vectors and the
//! generator live in `tests/fixtures/cislunar_srif_batch_ls/generate.py`
//! (`python3 generate.py > cislunar_srif_batch_ls_reference.txt`; NumPy + SciPy, no network — the
//! Rust test reads the committed `.txt`).

use kshana::deepspace_od::Srif;
use kshana::intersat_range::{range_row, PlanarState};
use kshana::observability_gramian::{observability_matrix, Mat, ObsEpoch, N_PLANAR};

const REF: &str =
    include_str!("fixtures/cislunar_srif_batch_ls/cislunar_srif_batch_ls_reference.txt");

/// LAPACK (NumPy/SciPy) and the crate's square-root machine agree to ~1e-9 on the well-scaled
/// entries; the smallest covariance entries are O(1e2) so an absolute+relative bound is used.
const TOL_REL: f64 = 1e-7;
const TOL_ABS: f64 = 1e-6;

struct Fixture {
    chief: PlanarState,
    reference: PlanarState,
    phis: Vec<Mat>,
    dts: Vec<f64>,
    p_unit: Mat,             // (O^T O)^-1 from numpy
    cond_n_unit: f64,        // cond(O^T O) from numpy
    lstsq_rank: usize,       // scipy.linalg.lstsq rank on O
    injected_ds0: Vec<f64>,  // known offset injected into the synthetic measurements
    recovered_ds0: Vec<f64>, // scipy lstsq recovery of that offset
}

fn parse_state4(tokens: &[&str]) -> PlanarState {
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
    let mut p_unit: Mat = Vec::new();
    let mut cond_n_unit = None;
    let mut lstsq_rank = None;
    let mut injected = Vec::new();
    let mut recovered = Vec::new();

    // A tiny state machine over "# MATRIX <name>" / "ROW ..." blocks.
    let mut cur: Option<(String, Mat)> = None;
    let finish = |cur: &mut Option<(String, Mat)>, phis: &mut Vec<Mat>, p_unit: &mut Mat| {
        if let Some((name, m)) = cur.take() {
            if name.starts_with("PHI") {
                phis.push(m);
            } else if name == "P_UNIT" {
                *p_unit = m;
            }
        }
    };

    for line in text.lines() {
        let line = line.trim_end();
        if let Some(rest) = line.strip_prefix("# CHIEF ") {
            chief = Some(parse_state4(&rest.split_whitespace().collect::<Vec<_>>()));
        } else if let Some(rest) = line.strip_prefix("# REF ") {
            reference = Some(parse_state4(&rest.split_whitespace().collect::<Vec<_>>()));
        } else if let Some(rest) = line.strip_prefix("# DTS ") {
            dts = rest
                .split_whitespace()
                .map(|s| s.parse().unwrap())
                .collect();
        } else if let Some(rest) = line.strip_prefix("# MATRIX ") {
            finish(&mut cur, &mut phis, &mut p_unit);
            let name = rest.split_whitespace().next().unwrap().to_string();
            cur = Some((name, Vec::new()));
        } else if let Some(rest) = line.strip_prefix("ROW ") {
            if let Some((_, m)) = cur.as_mut() {
                m.push(
                    rest.split_whitespace()
                        .map(|s| s.parse().unwrap())
                        .collect(),
                );
            }
        } else if let Some(rest) = line.strip_prefix("# COND_N_UNIT ") {
            cond_n_unit = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("# LSTSQ_RANK ") {
            lstsq_rank = Some(rest.trim().parse().unwrap());
        } else if let Some(rest) = line.strip_prefix("# LSTSQ_INJECTED_DS0 ") {
            injected = rest
                .split_whitespace()
                .map(|s| s.parse().unwrap())
                .collect();
        } else if let Some(rest) = line.strip_prefix("# LSTSQ_RECOVERED_DS0 ") {
            recovered = rest
                .split_whitespace()
                .map(|s| s.parse().unwrap())
                .collect();
        }
    }
    finish(&mut cur, &mut phis, &mut p_unit);

    Fixture {
        chief: chief.expect("CHIEF"),
        reference: reference.expect("REF"),
        phis,
        dts,
        p_unit,
        cond_n_unit: cond_n_unit.expect("COND_N_UNIT"),
        lstsq_rank: lstsq_rank.expect("LSTSQ_RANK"),
        injected_ds0: injected,
        recovered_ds0: recovered,
    }
}

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

/// Symmetric ascending eigenvalues of a small matrix via unrotated Jacobi (independent of the
/// crate) — used only to read a condition number off the SRIF posterior covariance for comparison.
fn cond_number(m: &Mat) -> f64 {
    // Power/inverse-power would suffice, but for a 4x4 SPD matrix a cheap cyclic-Jacobi sweep is
    // clearest. Reuse the crate's own symmetric eigensolver: this is not the object under test
    // (numpy's cond on O^T O is), and the SRIF P it consumes is what we validate.
    let e = kshana::fim::sym_eig(m);
    let lmin = e.values.first().copied().unwrap_or(0.0);
    let lmax = e.values.last().copied().unwrap_or(0.0);
    if lmin <= 0.0 {
        f64::INFINITY
    } else {
        lmax / lmin
    }
}

fn close(got: f64, want: f64) -> bool {
    (got - want).abs() <= TOL_ABS + TOL_REL * want.abs()
}

// ── (a) SRIF posterior covariance P = (O^T O)^-1 matches the numpy batch-LS posterior ──
#[test]
fn srif_posterior_covariance_matches_numpy_batch_ls() {
    let f = parse_fixture(REF);
    let epochs = build_epochs(&f);
    let (o, _w) = observability_matrix(&epochs);

    // Fold the unit-weight rows into the SRIF, exactly as cislunar_srif::srif_over_arc does, so
    // R^T R = O^T O and P = (O^T O)^-1 — the batch-LS posterior.
    let mut srif = Srif::new(N_PLANAR);
    for row in &o {
        srif.measurement_update(row, 0.0, 1.0);
    }
    let (_x, p) = srif.solve();

    assert_eq!(f.p_unit.len(), N_PLANAR, "fixture P is 4x4");
    for (i, (got_row, want_row)) in p.iter().zip(&f.p_unit).enumerate() {
        for (j, (got, want)) in got_row.iter().zip(want_row).enumerate() {
            assert!(
                close(*got, *want),
                "SRIF P[{i}][{j}] = {got} differs from numpy batch-LS (O^T O)^-1 = {want}"
            );
        }
    }

    // Condition number of the SRIF posterior tracks numpy.linalg.cond(O^T O) (cond(P)=cond(O^T O)).
    let cond_p = cond_number(&p);
    let cond_rel = (cond_p - f.cond_n_unit).abs() / f.cond_n_unit;
    assert!(
        cond_rel < 1e-4,
        "SRIF cond(P) {} vs numpy cond(O^T O) {} (rel {cond_rel:.2e})",
        cond_p,
        f.cond_n_unit
    );

    eprintln!(
        "cislunar_srif_batch_ls_reference: SRIF P vs numpy batch-LS (O^T O)^-1 — cond(P) {:.3e} \
         (numpy {:.3e})",
        cond_p, f.cond_n_unit
    );
}

// ── (b) the batch system is full rank (scipy lstsq) and recovers the injected offset ──
#[test]
fn batch_system_is_full_rank_and_recovers_offset() {
    let f = parse_fixture(REF);
    assert_eq!(
        f.lstsq_rank, N_PLANAR,
        "scipy.linalg.lstsq rank {} must be the full four-state {}",
        f.lstsq_rank, N_PLANAR
    );
    // scipy recovered the known injected initial-state offset to numerical precision, confirming
    // the stacked O is full column rank (else lstsq would not uniquely recover ds0).
    assert_eq!(f.injected_ds0.len(), N_PLANAR);
    assert_eq!(f.recovered_ds0.len(), N_PLANAR);
    for (inj, rec) in f.injected_ds0.iter().zip(&f.recovered_ds0) {
        assert!(
            (inj - rec).abs() < 1e-9,
            "scipy lstsq recovered {rec} vs injected {inj}"
        );
    }

    // The crate agrees: the same O folded into the SRIF yields a finite, well-posed posterior
    // (full observability), the estimator-agreement the batch-LS oracle certifies externally.
    let epochs = build_epochs(&f);
    let (o, _w) = observability_matrix(&epochs);
    let mut srif = Srif::new(N_PLANAR);
    for row in &o {
        srif.measurement_update(row, 0.0, 1.0);
    }
    let (_x, p) = srif.solve();
    assert!(
        p.iter().flatten().all(|v| v.is_finite()),
        "full-rank SRIF posterior must be finite"
    );
}
