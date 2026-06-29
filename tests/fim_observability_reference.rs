// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate Kshana's Fisher-information / Cramér–Rao engine
//! ([`kshana::fim`]) against an **independent third-party authority**: NumPy
//! 2.4.1 (`numpy.linalg.eigh` / `numpy.linalg.inv`; BSD-3-Clause, LAPACK-backed).
//!
//! Kshana computes its eigenvalues with a hand-rolled cyclic Jacobi sweep and its
//! Cramér–Rao covariance / pseudo-inverse from that spectral decomposition — a
//! *different algorithm* from NumPy's LAPACK divide-and-conquer (`eigh`) and
//! LU inverse (`inv`). Reproducing NumPy's numeric output for fully-specified
//! inputs is therefore a genuine external cross-check of the eigensolver, the
//! covariance assembly and the GNSS dilution-of-precision read-off — the same
//! class of validation the DOP engine gets against gnss_lib_py and the χ²/erf
//! kernels get against SciPy, not a self-consistency check.
//!
//! The reference vectors and how to regenerate them live in
//! `tests/fixtures/fim_observability/generate.py` (fixed inputs, no randomness;
//! `python3 generate.py` reprints the constants below). NumPy 2.4.1.

// Vendored NumPy reference values are kept at full provenance precision.
#![allow(clippy::excessive_precision)]

use kshana::fim::{crlb, information_matrix, sym_eig};

/// LAPACK (NumPy) and the Jacobi sweep agree to ~1e-12 on well-conditioned
/// symmetric inputs; this bound stays well inside that without hiding drift.
const TOL: f64 = 1e-9;

// --- Test A: symmetric eigenvalues vs numpy.linalg.eigvalsh -------------------
// A = [[4,1,2,0],[1,3,0,1],[2,0,5,1],[0,1,1,2]].
const A_EIGENVALUES_ASCENDING: [f64; 4] = [
    8.121633861267453e-01,
    2.783823334835208e+00,
    3.548378489138453e+00,
    6.855634789899593e+00,
];

#[test]
fn eigenvalues_match_numpy_eigh() {
    let a = vec![
        vec![4.0, 1.0, 2.0, 0.0],
        vec![1.0, 3.0, 0.0, 1.0],
        vec![2.0, 0.0, 5.0, 1.0],
        vec![0.0, 1.0, 1.0, 2.0],
    ];
    let e = sym_eig(&a);
    for (got, want) in e.values.iter().zip(A_EIGENVALUES_ASCENDING) {
        assert!(
            (got - want).abs() < TOL,
            "eigenvalue {got} differs from numpy {want}"
        );
    }
}

// --- Test B: CRLB covariance of a 3-regressor model vs σ²(XᵀX)⁻¹ (numpy.inv) --
// X columns = [1, t, t²] for t = 0..6; σ² = 0.5; covariance = σ²(XᵀX)⁻¹.
const B_CRLB_COV_3X3: [f64; 9] = [
    3.809523809523807e-01,
    -2.321428571428569e-01,
    2.976190476190471e-02,
    -2.321428571428571e-01,
    2.321428571428571e-01,
    -3.571428571428571e-02,
    2.976190476190476e-02,
    -3.571428571428571e-02,
    5.952380952380953e-03,
];

#[test]
fn crlb_covariance_matches_numpy_inverse() {
    let ts = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0];
    let sigma2 = 0.5;
    let jac: Vec<Vec<f64>> = ts.iter().map(|&t| vec![1.0, t, t * t]).collect();
    let w = vec![1.0 / sigma2; ts.len()];
    let m = information_matrix(&jac, &w);
    let cov = crlb(&m, 1e-12).covariance.expect("full rank");
    for i in 0..3 {
        for j in 0..3 {
            let want = B_CRLB_COV_3X3[i * 3 + j];
            assert!(
                (cov[i][j] - want).abs() < TOL,
                "cov[{i}][{j}] = {} differs from numpy {want}",
                cov[i][j]
            );
        }
    }
}

// --- Test C: GNSS dilution of precision from the information matrix vs numpy ---
// Eight satellites at (azimuth, elevation) deg; ENU line-of-sight unit vector
// e = [cos el·sin az, cos el·cos az, sin el]; geometry row = [−e, 1] (clock).
// Q = (GᵀG)⁻¹; GDOP=√tr Q, PDOP=√(Q₀₀+Q₁₁+Q₂₂), HDOP=√(Q₀₀+Q₁₁),
// VDOP=√Q₂₂, TDOP=√Q₃₃.
const C_AZEL_DEG: [(f64, f64); 8] = [
    (0.0, 75.0),
    (40.0, 30.0),
    (100.0, 15.0),
    (150.0, 60.0),
    (200.0, 25.0),
    (250.0, 45.0),
    (300.0, 20.0),
    (330.0, 70.0),
];
// GDOP, PDOP, HDOP, VDOP, TDOP from numpy.
const C_DOP: [f64; 5] = [
    1.919842206831676e+00,
    1.683487348735724e+00,
    9.827117810350713e-01,
    1.366896926899800e+00,
    9.228566767267173e-01,
];

#[test]
fn gnss_dop_from_information_matrix_matches_numpy() {
    let jac: Vec<Vec<f64>> = C_AZEL_DEG
        .iter()
        .map(|&(az, el)| {
            let (a, e) = (az.to_radians(), el.to_radians());
            let u = [e.cos() * a.sin(), e.cos() * a.cos(), e.sin()];
            vec![-u[0], -u[1], -u[2], 1.0]
        })
        .collect();
    let w = vec![1.0; jac.len()];
    let m = information_matrix(&jac, &w);
    let c = crlb(&m, 1e-12);
    let q = c
        .covariance
        .expect("well-conditioned GNSS geometry is full rank");
    let d = &c.crlb_diag;
    let gdop = (d[0] + d[1] + d[2] + d[3]).sqrt();
    let pdop = (d[0] + d[1] + d[2]).sqrt();
    let hdop = (d[0] + d[1]).sqrt();
    let vdop = d[2].sqrt();
    let tdop = d[3].sqrt();
    for (got, want) in [gdop, pdop, hdop, vdop, tdop].iter().zip(C_DOP) {
        assert!(
            (got - want).abs() < TOL,
            "DOP {got} differs from numpy {want}"
        );
    }
    // Spot-check an off-diagonal covariance entry too (the full Q, not just DOP).
    assert!(
        (q[2][3] - 1.165002999077798e+00).abs() < TOL,
        "Q[2][3] = {} differs from numpy",
        q[2][3]
    );
}
