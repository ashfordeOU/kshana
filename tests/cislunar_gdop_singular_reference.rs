// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the paper P6 (L33) position-only-GDOP-singular claim against NumPy.
//!
//! A range-only (position-only) instantaneous snapshot of the planar four-state `[x, y, ẋ, ẏ]`
//! cannot observe velocity — every range Jacobian row has zero velocity columns — so its
//! single-epoch information matrix is rank-deficient and the geometric dilution of precision is
//! **undefined**. kshana's [`kshana::observability_gramian::cislunar_gdop`] must therefore return
//! [`kshana::observability_gramian::CislunarGdop::Undefined`] (never a bogus finite GDOP), with a
//! numerical rank and datum defect that match `numpy.linalg.matrix_rank` and a condition number
//! that is non-finite (`numpy.linalg.cond` = `inf`) on the SAME information matrix.
//!
//! The geometry is the ACTUAL default DRO constellation snapshot the paper's
//! `cislunar_observability` scenario uses (a chief and three differential-corrected planar-DRO
//! beacons at t=0). The committed fixture carries those seed states as provenance; the NumPy
//! generator rebuilds the range Jacobian rows and reads the rank/condition off the information
//! matrix **independently** (its own arithmetic, LAPACK SVD/cond), while the Rust side rebuilds the
//! same rows with kshana's own [`kshana::intersat_range::range_row`] and asserts `cislunar_gdop`'s
//! verdict. A range+range-rate snapshot to the same references is the full-rank / finite-GDOP
//! contrast case.
//!
//! Reference vectors and the generator live in `tests/fixtures/cislunar_gdop_singular/generate.py`
//! (`python3 generate.py > cislunar_gdop_singular_reference.txt`; NumPy only, no network).

use kshana::intersat_range::{range_rate_row, range_row, PlanarState};
use kshana::observability_gramian::{cislunar_gdop, CislunarGdop, Mat, N_PLANAR};

const REF: &str =
    include_str!("fixtures/cislunar_gdop_singular/cislunar_gdop_singular_reference.txt");

/// The relative singular-value threshold the fixture and the crate both use (paper default 1e-6).
const REL_TOL: f64 = 1e-6;

struct Fixture {
    states: Vec<PlanarState>, // chief first, then references
    range_only_rank: usize,
    range_only_defect: usize,
    range_only_cond_finite: bool,
    range_rate_rank: usize,
    range_rate_defect: usize,
    range_rate_cond_finite: bool,
}

fn parse_fixture(text: &str) -> Fixture {
    let mut states: Vec<(usize, PlanarState)> = Vec::new();
    let mut ro_rank = None;
    let mut ro_defect = None;
    let mut ro_cond_finite = None;
    let mut rr_rank = None;
    let mut rr_defect = None;
    let mut rr_cond_finite = None;

    for line in text.lines() {
        let line = line.trim_end();
        if let Some(rest) = line.strip_prefix("# STATE ") {
            // "<idx> <role> <x> <y> <vx> <vy>"
            let t: Vec<&str> = rest.split_whitespace().collect();
            let idx: usize = t[0].parse().unwrap();
            let nums: Vec<f64> = t[2..].iter().map(|s| s.parse().unwrap()).collect();
            states.push((idx, [nums[0], nums[1], nums[2], nums[3]]));
        } else if let Some(v) = line.strip_prefix("# RANGE_ONLY_RANK ") {
            ro_rank = Some(v.trim().parse().unwrap());
        } else if let Some(v) = line.strip_prefix("# RANGE_ONLY_DEFECT ") {
            ro_defect = Some(v.trim().parse().unwrap());
        } else if let Some(v) = line.strip_prefix("# RANGE_ONLY_COND_FINITE ") {
            ro_cond_finite = Some(v.trim() == "true");
        } else if let Some(v) = line.strip_prefix("# RANGE_RATE_RANK ") {
            rr_rank = Some(v.trim().parse().unwrap());
        } else if let Some(v) = line.strip_prefix("# RANGE_RATE_DEFECT ") {
            rr_defect = Some(v.trim().parse().unwrap());
        } else if let Some(v) = line.strip_prefix("# RANGE_RATE_COND_FINITE ") {
            rr_cond_finite = Some(v.trim() == "true");
        }
    }
    states.sort_by_key(|(i, _)| *i);
    Fixture {
        states: states.into_iter().map(|(_, s)| s).collect(),
        range_only_rank: ro_rank.expect("RANGE_ONLY_RANK"),
        range_only_defect: ro_defect.expect("RANGE_ONLY_DEFECT"),
        range_only_cond_finite: ro_cond_finite.expect("RANGE_ONLY_COND_FINITE"),
        range_rate_rank: rr_rank.expect("RANGE_RATE_RANK"),
        range_rate_defect: rr_defect.expect("RANGE_RATE_DEFECT"),
        range_rate_cond_finite: rr_cond_finite.expect("RANGE_RATE_COND_FINITE"),
    }
}

fn range_only_rows(chief: &PlanarState, refs: &[PlanarState]) -> Mat {
    refs.iter()
        .map(|r| {
            let (_rho, row) = range_row(chief, r);
            row.to_vec()
        })
        .collect()
}

fn range_rate_rows(chief: &PlanarState, refs: &[PlanarState]) -> Mat {
    let mut rows = Vec::new();
    for r in refs {
        let (_rho, rr) = range_row(chief, r);
        rows.push(rr.to_vec());
        let (_rd, rrr) = range_rate_row(chief, r);
        rows.push(rrr.to_vec());
    }
    rows
}

// ── The paper claim: the range-only DRO snapshot is singular → cislunar_gdop Undefined ──
#[test]
fn range_only_dro_snapshot_gdop_is_undefined_matching_numpy() {
    let f = parse_fixture(REF);
    assert!(f.states.len() >= 4, "need chief + 3 references");
    // numpy's own read of THIS geometry: rank-deficient, defect >= 2, condition non-finite.
    assert!(!f.range_only_cond_finite, "numpy: range-only info matrix must be singular");
    assert!(
        f.range_only_defect >= 2,
        "numpy: planar range-only defect must be >= 2, got {}",
        f.range_only_defect
    );

    let chief = f.states[0];
    let refs = &f.states[1..];
    let rows = range_only_rows(&chief, refs);
    match cislunar_gdop(&rows, REL_TOL) {
        CislunarGdop::Undefined { rank, defect, .. } => {
            assert_eq!(
                rank, f.range_only_rank,
                "kshana rank {rank} != numpy.linalg.matrix_rank {}",
                f.range_only_rank
            );
            assert_eq!(
                defect, f.range_only_defect,
                "kshana defect {defect} != numpy datum defect {}",
                f.range_only_defect
            );
            assert_eq!(rank + defect, N_PLANAR, "rank + defect must be the state dimension");
        }
        CislunarGdop::Defined { gdop, .. } => {
            panic!("position-only DRO snapshot must be GDOP-undefined, got finite {gdop}")
        }
    }
}

// ── Contrast: range + range-rate to the same references is full rank → finite GDOP ──
#[test]
fn range_rate_dro_snapshot_gdop_is_finite_matching_numpy() {
    let f = parse_fixture(REF);
    assert!(f.range_rate_cond_finite, "numpy: range+rate info matrix must be full rank");
    assert_eq!(f.range_rate_rank, N_PLANAR, "numpy: range+rate rank must be full");
    assert_eq!(f.range_rate_defect, 0);

    let chief = f.states[0];
    let refs = &f.states[1..];
    let rows = range_rate_rows(&chief, refs);
    match cislunar_gdop(&rows, REL_TOL) {
        CislunarGdop::Defined { gdop, rank } => {
            assert_eq!(rank, N_PLANAR, "full observability");
            assert!(gdop.is_finite() && gdop > 0.0, "finite positive GDOP, got {gdop}");
            eprintln!(
                "cislunar_gdop_singular_reference: range-only rank {} (defect {}) → GDOP undefined; \
                 range+rate rank {} → GDOP {:.4} (numpy-cross-checked)",
                f.range_only_rank, f.range_only_defect, rank, gdop
            );
        }
        CislunarGdop::Undefined { reason, .. } => {
            panic!("range+range-rate snapshot must yield a finite GDOP: {reason}")
        }
    }
}
