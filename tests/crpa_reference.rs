// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate Kshana's CRPA anti-jam beamformer (`kshana::crpa`) against
//! an **independent third-party authority**: NumPy 1.26.4 (`numpy.linalg`) and
//! SciPy 1.13.1 (`scipy.linalg`, LAPACK `zgesv`; both BSD-3-Clause).
//!
//! Kshana computes its CRPA weights with a *hand-rolled* complex linear-algebra
//! kernel — `crpa::solve` is Gaussian elimination with partial pivoting over its
//! own scalar `C` struct (re/im doubles). The oracle instead builds the same
//! interference-plus-noise covariance `R`, steering matrix `A` and the MVDR /
//! minimum-norm-null constraints entirely in numpy on native `complex128`, and
//! solves them with LAPACK's optimised Fortran LU (`scipy.linalg.solve` /
//! `numpy.linalg.solve`). Reproducing LAPACK's numeric weight vector for a
//! fully-specified geometry is a genuine external cross-check of the beamformer
//! algebra — the same class of validation the DOP engine gets against
//! gnss_lib_py and the Fisher-information engine gets against numpy — because the
//! MVDR minimiser `w = R⁻¹a_sv/(a_svᴴR⁻¹a_sv)` and the min-norm null solution
//! `w = Aᴴ(AAᴴ)⁻¹b` are *uniquely defined by their constraints* (unique for a
//! full-rank `R` / `A`), so agreement element-by-element is not a re-run of
//! Kshana's own kernel but two independent codebases landing on the same unique
//! vector.
//!
//! HONEST SCOPE. This validates the WEIGHT / RESPONSE algebra (MVDR and min-norm
//! null-steering, and the resulting array-response gains) against numpy/LAPACK.
//! The underlying PHYSICAL MODELLING stays **Modelled**: narrowband, far-field,
//! identical-isotropic-element array geometry with perfect channel knowledge —
//! no mutual coupling, per-element gain/phase mismatch, finite bandwidth
//! (tapped-delay-line / space-time adaptive processing), or steering-vector
//! estimation error.
//!
//! The reference vectors and how to regenerate them live in
//! `tests/fixtures/crpa/generate_p3_crpa_reference.py` (fixed inputs, no
//! randomness; `python3 generate_p3_crpa_reference.py` rewrites the JSON below).
//! NumPy 1.26.4 / SciPy 1.13.1.

use kshana::crpa::{
    array_response, covariance, inner, mvdr_weights, null_steering_weights, steering, C,
};
use serde::Deserialize;

/// LAPACK (numpy/scipy) and Kshana's Gauss-elimination kernel agree to ~1e-12
/// on these well-conditioned geometries; this bound stays well inside that
/// without hiding drift. The strongest MVDR case has a 60 dB jammer (condition
/// number ~1e6) so the weights near the noise floor still land within 1e-9.
const TOL: f64 = 1e-9;

type Vec3 = [f64; 3];

#[derive(Deserialize)]
struct Cplx {
    re: f64,
    im: f64,
}

#[derive(Deserialize)]
struct Case {
    name: String,
    kind: String,
    #[serde(rename = "lambda")]
    lambda: f64,
    n: usize,
    pos: Vec<Vec3>,
    #[serde(default)]
    sigma2: f64,
    sv_dir: Vec3,
    jammer_dirs: Vec<Vec3>,
    #[serde(default)]
    powers: Vec<f64>,
    weights: Vec<Cplx>,
    g_sv: Cplx,
    g_jam: Vec<Cplx>,
    #[serde(default)]
    residual_power: f64,
}

#[derive(Deserialize)]
struct Fixture {
    cases: Vec<Case>,
}

const RAW: &str = include_str!("fixtures/crpa/crpa_reference.json");

fn load() -> Fixture {
    serde_json::from_str(RAW).expect("crpa_reference.json parses")
}

/// Assert a Kshana complex weight/gain matches the numpy/LAPACK oracle.
fn assert_c(got: C, want: &Cplx, ctx: &str) {
    assert!(
        (got.re - want.re).abs() < TOL && (got.im - want.im).abs() < TOL,
        "{ctx}: kshana ({}, {}) differs from LAPACK oracle ({}, {})",
        got.re,
        got.im,
        want.re,
        want.im
    );
}

#[test]
fn mvdr_weights_and_gains_match_lapack() {
    let fx = load();
    let mut checked = 0usize;
    for c in fx.cases.iter().filter(|c| c.kind == "mvdr") {
        assert_eq!(c.pos.len(), c.n, "{}: geometry size", c.name);

        // Rebuild R = sigma2 I + sum P_k a_k a_k^H using Kshana's own steering +
        // covariance, then solve for the MVDR weights with Kshana's kernel.
        let jammers: Vec<Vec<C>> = c
            .jammer_dirs
            .iter()
            .map(|&d| steering(&c.pos, d, c.lambda))
            .collect();
        let r = covariance(c.n, c.sigma2, &c.powers, &jammers);
        let a_sv = steering(&c.pos, c.sv_dir, c.lambda);
        let w = mvdr_weights(&r, &a_sv).expect("MVDR solvable");

        // 1) full complex weight vector vs LAPACK, element by element.
        assert_eq!(w.len(), c.weights.len(), "{}: weight length", c.name);
        for (i, (got, want)) in w.iter().zip(&c.weights).enumerate() {
            assert_c(*got, want, &format!("{} w[{i}]", c.name));
        }

        // 2) array-response gains toward SV and every jammer vs LAPACK.
        let g_sv = array_response(&w, &c.pos, c.sv_dir, c.lambda);
        assert_c(g_sv, &c.g_sv, &format!("{} g_sv", c.name));
        for (j, (&d, want)) in c.jammer_dirs.iter().zip(&c.g_jam).enumerate() {
            let g = array_response(&w, &c.pos, d, c.lambda);
            assert_c(g, want, &format!("{} g_jam[{j}]", c.name));
        }

        // 3) residual output power 1/(a^H R^-1 a) vs LAPACK (independent scalar).
        let y = {
            // recompute a_sv^H R^-1 a_sv via the public weights: denom = 1/resid,
            // and w = R^-1 a / denom => a^H w = a^H R^-1 a / denom = 1, so
            // residual = 1/denom is recovered as inner(w, R w)? Simpler: use the
            // distortionless identity — residual = w^H R w with unit SV gain.
            // Compute w^H R w directly.
            let mut rw = vec![C::zero(); c.n];
            for (ii, row) in r.iter().enumerate() {
                let mut s = C::zero();
                for (jj, &rij) in row.iter().enumerate() {
                    s = s + rij * w[jj];
                }
                rw[ii] = s;
            }
            inner(&w, &rw)
        };
        assert!(
            (y.re - c.residual_power).abs() < TOL * (1.0 + c.residual_power.abs())
                && y.im.abs() < 1e-6,
            "{} residual power {} differs from LAPACK {}",
            c.name,
            y.re,
            c.residual_power
        );

        checked += 1;
    }
    assert!(checked >= 3, "expected >=3 MVDR cases, got {checked}");
}

#[test]
fn null_steering_weights_and_gains_match_lapack() {
    let fx = load();
    let mut checked = 0usize;
    for c in fx.cases.iter().filter(|c| c.kind == "null") {
        assert_eq!(c.pos.len(), c.n, "{}: geometry size", c.name);

        let w = null_steering_weights(&c.pos, c.lambda, c.sv_dir, &c.jammer_dirs)
            .expect("null-steering solvable");

        // 1) full complex min-norm weight vector vs LAPACK, element by element.
        assert_eq!(w.len(), c.weights.len(), "{}: weight length", c.name);
        for (i, (got, want)) in w.iter().zip(&c.weights).enumerate() {
            assert_c(*got, want, &format!("{} w[{i}]", c.name));
        }

        // 2) unit SV gain and exact jammer nulls vs LAPACK gains.
        let g_sv = array_response(&w, &c.pos, c.sv_dir, c.lambda);
        assert_c(g_sv, &c.g_sv, &format!("{} g_sv", c.name));
        for (j, (&d, want)) in c.jammer_dirs.iter().zip(&c.g_jam).enumerate() {
            let g = array_response(&w, &c.pos, d, c.lambda);
            assert_c(g, want, &format!("{} g_jam[{j}]", c.name));
            // sanity: the oracle nulls are at machine epsilon; kshana's too.
            assert!(
                g.abs() < 1e-8,
                "{} jammer {j} not nulled: {}",
                c.name,
                g.abs()
            );
        }

        checked += 1;
    }
    assert!(
        checked >= 3,
        "expected >=3 null-steering cases, got {checked}"
    );
}
