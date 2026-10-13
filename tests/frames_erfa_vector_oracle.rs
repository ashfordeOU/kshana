// SPDX-License-Identifier: AGPL-3.0-only
//! Direct ERFA vector checks of three frame matrices (package WP-03, item FUT-14):
//! `precession::precession_matrix`, `nutation::teme_to_gcrs_matrix`, and the GCRS→CIRS matrix
//! with the IERS celestial-pole offsets dX, dY (`cio::gcrs_to_cirs_matrix_with_offsets`, new).
//!
//! PRE-REGISTRATION (written 2026-10-13 and committed with the epochs and the new function,
//! before the oracle was run and before any comparison).
//!
//! WHY. The composed frame chain is checked against SOFA vectors and ANISE, and the nutation
//! series against `nut00a`/`nut00b`, but no test compared `precession_matrix` or
//! `teme_to_gcrs_matrix` directly with ERFA at arbitrary epochs, and the CIO chain had no input
//! for dX, dY (neglected, `tests/frame_reference_vectors.rs`).
//!
//! INPUTS (`tests/fixtures/frames_erfa_vector_oracle/epochs.csv`, from fixed rules by the
//! generator): J2000.0, 1980-01-01, 2020-05-31 and 2050-01-01 at 0h TT, plus 36 TT Julian dates
//! drawn uniformly from 1950 to 2100 with `random.Random(20261013)` (fraction to 1e-9 day), each
//! with dX, dY in mas (0 at the first two fixed epochs, ±0.15 to ±0.3 mas at the other two,
//! uniform in ±0.5 mas for the random ones; typical IERS values are tenths of a mas).
//!
//! ORACLE: pyerfa 2.0.1.5 (BSD-3-Clause; liberfa 2.0.1), with the date passed as (jd, 0):
//! P = `pmat06`; T = Pᵀ·Nᵀ·Rz(−EE) with N = `numat(obl06, nut00b)` and
//! EE = Δψ·cos(ε̄) + `eect00` (the full IERS 2003 complementary terms); C = `c2ixys(X + dX,
//! Y + dY, s)` with `(X, Y, s) = xys06a`. Written to `erfa.csv`, 17 significant digits.
//! The T composition mirrors the engine's model choice (IAU 2006 precession with IAU 2000B
//! nutation), so it checks the implementation of that choice, not the choice.
//!
//! BARS (fixed now), with the rotation angle between two matrices `angle(A, B) =
//! acos((trace(AᵀB) − 1)/2)` computed robustly from the skew part:
//! - **V1** `precession_matrix`: every element within 1e-13 of P (the same Fukushima–Williams
//!   construction).
//! - **V2** `teme_to_gcrs_matrix`: angle to T within 5e-10 rad at every epoch. Disclosed: the
//!   engine's equation of the equinoxes keeps only the two leading complementary terms; the
//!   others in `eect00` are predicted to reach about 1.5e-10 rad (≤ 1 cm at GNSS orbit).
//! - **V3** `gcrs_to_cirs_matrix_with_offsets`: every element within 1e-13 of C.
//! - **V4** (additivity) with dX = dY = 0 the new function is bit-identical to
//!   `cio::gcrs_to_cirs_matrix` at every epoch; no existing function changes.
//!
//! VERDICT: not yet run.

use kshana::cio::{gcrs_to_cirs_matrix, gcrs_to_cirs_matrix_with_offsets};
use kshana::nutation::teme_to_gcrs_matrix;
use kshana::precession::precession_matrix;

const DIR: &str = "tests/fixtures/frames_erfa_vector_oracle";
const MAS: f64 = 1e-3 / 3600.0 * std::f64::consts::PI / 180.0;
const TOL_P: f64 = 1e-13;
const TOL_T_RAD: f64 = 5e-10;
const TOL_C: f64 = 1e-13;

type M3 = [[f64; 3]; 3];

fn rows(file: &str) -> Vec<Vec<f64>> {
    std::fs::read_to_string(format!("{DIR}/{file}"))
        .unwrap_or_else(|e| panic!("{DIR}/{file}: {e} (run the generator)"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| l.split(',').map(|x| x.parse().unwrap()).collect())
        .collect()
}

fn m3(v: &[f64]) -> M3 {
    [[v[0], v[1], v[2]], [v[3], v[4], v[5]], [v[6], v[7], v[8]]]
}

fn max_elem(a: &M3, b: &M3) -> f64 {
    let mut w = 0.0_f64;
    for i in 0..3 {
        for j in 0..3 {
            w = w.max((a[i][j] - b[i][j]).abs());
        }
    }
    w
}

/// Rotation angle of `Aᵀ·B` (rad), from its skew-symmetric part (accurate for small angles).
fn angle(a: &M3, b: &M3) -> f64 {
    let mut r = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            r[i][j] = (0..3).map(|k| a[k][i] * b[k][j]).sum();
        }
    }
    let s = [r[2][1] - r[1][2], r[0][2] - r[2][0], r[1][0] - r[0][1]];
    0.5 * (s[0] * s[0] + s[1] * s[1] + s[2] * s[2]).sqrt()
}

#[test]
fn frame_matrices_agree_with_erfa_vectors() {
    let epochs = rows("epochs.csv");
    let oracle = rows("erfa.csv");
    assert_eq!(epochs.len(), 40, "the pre-registered epoch set");
    assert_eq!(epochs.len(), oracle.len(), "one oracle row per epoch");
    let (mut wp, mut wt, mut wc) = (0.0_f64, 0.0_f64, 0.0_f64);
    let mut fails = Vec::new();
    for (e, o) in epochs.iter().zip(&oracle) {
        let (jd, dx, dy) = (e[0], e[1] * MAS, e[2] * MAS);
        let dp = max_elem(&precession_matrix(jd), &m3(&o[0..9]));
        let dt = angle(&teme_to_gcrs_matrix(jd), &m3(&o[9..18]));
        let c = gcrs_to_cirs_matrix_with_offsets(jd, dx, dy);
        let dc = max_elem(&c, &m3(&o[18..27]));
        wp = wp.max(dp);
        wt = wt.max(dt);
        wc = wc.max(dc);
        if dp > TOL_P || dt > TOL_T_RAD || dc > TOL_C {
            fails.push(format!("jd {jd}: P {dp:.2e}, T {dt:.2e} rad, C {dc:.2e}"));
        }
        assert_eq!(
            gcrs_to_cirs_matrix_with_offsets(jd, 0.0, 0.0),
            gcrs_to_cirs_matrix(jd),
            "V4: zero offsets must reproduce the existing matrix bit for bit"
        );
    }
    println!("worst: P {wp:.3e}, T {wt:.3e} rad, C {wc:.3e}");
    assert!(
        fails.is_empty(),
        "{} epochs outside the bars:\n{}",
        fails.len(),
        fails.join("\n")
    );
}
