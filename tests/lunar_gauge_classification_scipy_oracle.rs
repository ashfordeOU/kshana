// SPDX-License-Identifier: AGPL-3.0-only
//! Independent-library comparison (policy P2, an independent numerical library) for the
//! basis-invariant classification of the coupled frame and timescale null space,
//! `kshana::lunar_gauge::classify_null_space`.
//!
//! ## Pre-registration (written 2026-10-01, before the fixture was generated or the oracle run)
//!
//! * **Quantity.** For a 9 x 9 symmetric positive semi-definite Fisher information matrix `F` in
//!   the coupled datum layout (rows 0..7 spatial: translation, scale, rotation; rows 7..9
//!   temporal: clock offset, clock rate), the five outputs of `classify_null_space(F, 1e-9)`:
//!   the datum defect `d = dim N(F)`, `dim_spatial`, `dim_temporal`, `coupled_dim` and
//!   `p_st_norm` (the Frobenius norm of the spatial-by-temporal block of the null-space
//!   projector). Each is a uniquely defined function of the subspace `N(F)`, not of a basis.
//! * **Kshana's route.** A cyclic-Jacobi eigendecomposition of `F` (relative threshold 1e-9),
//!   then rank formulas on the null basis `U`: `dim_spatial = d - rank(U_T)`,
//!   `dim_temporal = d - rank(U_S)`, `coupled_dim = rank(U_S) + rank(U_T) - d`, with the ranks
//!   counted from Gram eigenvalues above 1e-9.
//! * **Oracle (P2).** SciPy 1.18.1 and NumPy 2.3.5 (BSD-3-Clause), run once by
//!   `tests/fixtures/lunar_gauge_classification_scipy_oracle/gen_reference.py`, never linked in.
//!   It uses a different construction, subspace intersection by singular value decomposition
//!   (LAPACK `gesdd`): `d` = number of singular values of `F` below `1e-8 * s_max`;
//!   `dim_spatial = dim(N(F) ∩ {temporal coordinates = 0}) = dim null([F; E_T])` and
//!   `dim_temporal = dim(N(F) ∩ {spatial coordinates = 0}) = dim null([F; E_S])` by
//!   `scipy.linalg.null_space(.., rcond=1e-8)`, where `E_T` (`E_S`) are the unit rows selecting
//!   the temporal (spatial) coordinates; `coupled_dim = d - dim_spatial - dim_temporal`;
//!   `p_st_norm = ||(V Vᵀ)[0..7, 7..9]||_F` with `V` the right singular vectors of `F` below
//!   the same threshold, from `numpy.linalg.svd`. No rank formula of Kshana's is used.
//! * **Inputs.** Committed in `cases.csv` with the generator (seeded, `numpy.random.default_rng`
//!   seed 20261001). Constructed null spaces, not the real networks of the existing coupled-gauge
//!   row (their defects are 0 and 1 and are not re-counted here): full rank; pure spatial;
//!   pure temporal; direct sums of spatial and temporal parts; one, two, three, four, seven and
//!   eight generic (coupled) directions; mixtures of spatial, temporal and coupled directions.
//!   Each subspace appears in four variants with a different random observable spectrum (log
//!   uniform in [1e-3, 1]) and a different random orthonormal basis `N Q` of the same null space
//!   carried as distinct sub-threshold eigenvalues (1e-15 to 1e-13), so that Kshana's
//!   eigensolver returns a different null basis in every variant: the re-bases are computed in
//!   NumPy. Every coupled direction is constructed with a spatial and a temporal component of
//!   norm at least 0.1, so no classification sits near either threshold. The generator asserts a
//!   spectral gap of at least 1e6 between the largest null and the smallest observable singular
//!   value of `F`, and of every stacked matrix it counts a null space of, before writing a row.
//! * **Tolerances (fixed now, before the first comparison).** `defect`, `dim_spatial`,
//!   `dim_temporal` and `coupled_dim` equal **exactly** on every case; `p_st_norm` within
//!   `|k - o| / (1 + |o|) < 1e-9` (the form and bar of the accepted datum-identifiability P2 row);
//!   within each subspace, the four variants' Kshana outputs identical in the integers. At least
//!   40 cases must be checked.
//! * **What this validates.** The classification as a linear-algebra computation on the committed
//!   matrices, which is the whole of the row's claim (the row claims no physical magnitude).
//!
//! ## Result
//!
//! Not yet run.

use kshana::lunar_gauge::classify_null_space;

const P_ST_TOL: f64 = 1e-9;
const MIN_CASES: usize = 40;

struct Case {
    subspace: String,
    info: Vec<Vec<f64>>,
    defect: usize,
    dim_spatial: usize,
    dim_temporal: usize,
    coupled_dim: usize,
    p_st_norm: f64,
}

fn cases() -> Vec<Case> {
    let path = concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/lunar_gauge_classification_scipy_oracle/cases.csv"
    );
    let text = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("read {path}: {e}"));
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .skip(1) // header
        .map(|l| {
            let f: Vec<&str> = l.split(',').map(str::trim).collect();
            assert_eq!(f.len(), 2 + 81 + 5, "bad row: {l}");
            let num = |i: usize| f[i].parse::<f64>().expect("number");
            let int = |i: usize| f[i].parse::<usize>().expect("integer");
            let mut info = vec![vec![0.0; 9]; 9];
            for (i, row) in info.iter_mut().enumerate() {
                for (j, v) in row.iter_mut().enumerate() {
                    *v = num(2 + 9 * i + j);
                }
            }
            Case {
                subspace: f[1].to_string(),
                info,
                defect: int(83),
                dim_spatial: int(84),
                dim_temporal: int(85),
                coupled_dim: int(86),
                p_st_norm: num(87),
            }
        })
        .collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn classify_null_space_matches_scipy_subspace_intersection() {
    let cases = cases();
    assert!(
        cases.len() >= MIN_CASES,
        "must check the full reference set: {} < {MIN_CASES}",
        cases.len()
    );
    let mut by_subspace: std::collections::BTreeMap<String, (usize, usize, usize, usize)> =
        std::collections::BTreeMap::new();
    let mut worst = 0.0_f64;
    for (k, c) in cases.iter().enumerate() {
        let got = classify_null_space(&c.info, 1e-9);
        let label = format!("case {k} ({})", c.subspace);
        assert_eq!(got.defect, c.defect, "{label}: defect");
        assert_eq!(got.dim_spatial, c.dim_spatial, "{label}: dim_spatial");
        assert_eq!(got.dim_temporal, c.dim_temporal, "{label}: dim_temporal");
        assert_eq!(got.coupled_dim, c.coupled_dim, "{label}: coupled_dim");
        let rel = (got.p_st_norm - c.p_st_norm).abs() / (1.0 + c.p_st_norm.abs());
        worst = worst.max(rel);
        assert!(
            rel < P_ST_TOL,
            "{label}: p_st_norm Kshana {} vs SciPy {} (rel {rel:.3e})",
            got.p_st_norm,
            c.p_st_norm
        );
        let key = (
            got.defect,
            got.dim_spatial,
            got.dim_temporal,
            got.coupled_dim,
        );
        let first = *by_subspace.entry(c.subspace.clone()).or_insert(key);
        assert_eq!(first, key, "{label}: variants of one subspace disagree");
    }
    eprintln!(
        "{} cases over {} subspaces; worst p_st_norm relative gap {worst:.3e}",
        cases.len(),
        by_subspace.len()
    );
}
