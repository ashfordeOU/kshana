// SPDX-License-Identifier: Apache-2.0
//! Precise-OD engine validation on **synthetic** data: the RTN residual frame, the variational
//! state-transition matrix against whole-arc finite difference, and batch-LS self-recovery of a
//! Kshana-propagated arc back to its own initial state. No external data — the truth is Kshana's
//! own integrator, so any non-zero residual is the estimator's, not the dynamics'.

use kshana::precise_od::{self, ric_from_state};

/// The radial/transverse/normal (RTN) rotation built from a circular, equatorial, prograde state
/// is the identity-like axis map: R̂ = +x, T̂ = +y, N̂ = +z. Rotating an ECI vector into RTN must
/// reproduce its components, and a purely radial ECI displacement must land entirely on the R axis.
#[test]
fn ric_from_state_circular_equatorial_is_the_axis_map() {
    let mu = 3.986_004_418e14_f64;
    let a = 7.0e6;
    let vc = (mu / a).sqrt();
    let r = [a, 0.0, 0.0];
    let v = [0.0, vc, 0.0];
    let ric = ric_from_state(r, v); // rows = [R̂, T̂, N̂]; ric·w = (w_R, w_T, w_N)

    // R̂ = +x, T̂ = +y, N̂ = +z.
    let apply = |w: [f64; 3]| {
        [
            ric[0][0] * w[0] + ric[0][1] * w[1] + ric[0][2] * w[2],
            ric[1][0] * w[0] + ric[1][1] * w[1] + ric[1][2] * w[2],
            ric[2][0] * w[0] + ric[2][1] * w[1] + ric[2][2] * w[2],
        ]
    };
    let close = |got: [f64; 3], want: [f64; 3]| (0..3).all(|k| (got[k] - want[k]).abs() < 1e-12);
    assert!(close(apply([1.0, 0.0, 0.0]), [1.0, 0.0, 0.0]), "radial → R");
    assert!(close(apply([0.0, 1.0, 0.0]), [0.0, 1.0, 0.0]), "track  → T");
    assert!(close(apply([0.0, 0.0, 1.0]), [0.0, 0.0, 1.0]), "normal → N");

    // A radial-out displacement of 5 m lands wholly on the R axis.
    let rtn = apply([5.0, 0.0, 0.0]);
    assert!((rtn[0] - 5.0).abs() < 1e-12 && rtn[1].abs() < 1e-12 && rtn[2].abs() < 1e-12);

    // The rows are orthonormal (a proper rotation).
    let dot =
        |i: usize, j: usize| ric[i][0] * ric[j][0] + ric[i][1] * ric[j][1] + ric[i][2] * ric[j][2];
    for i in 0..3 {
        assert!((dot(i, i) - 1.0).abs() < 1e-12, "row {i} not unit");
        for j in (i + 1)..3 {
            assert!(dot(i, j).abs() < 1e-12, "rows {i},{j} not orthogonal");
        }
    }
}

/// An inclined orbit: R̂ is still r̂, N̂ is the orbit normal r×v, and T̂ = N̂×R̂ completes the
/// right-handed triad. The cross-track axis must be perpendicular to both r and v.
#[test]
fn ric_from_state_inclined_normal_is_perpendicular_to_the_orbit_plane() {
    let mu = 3.986_004_418e14_f64;
    let a = 7.2e6;
    let vc = (mu / a).sqrt();
    let inc = 56.0_f64.to_radians();
    let r = [a, 0.0, 0.0];
    let v = [0.0, vc * inc.cos(), vc * inc.sin()];
    let ric = ric_from_state(r, v);
    let n_hat = ric[2];
    // N̂ ⟂ r and N̂ ⟂ v.
    let ndotr = n_hat[0] * r[0] + n_hat[1] * r[1] + n_hat[2] * r[2];
    let ndotv = n_hat[0] * v[0] + n_hat[1] * v[1] + n_hat[2] * v[2];
    assert!(ndotr.abs() < 1e-6, "N̂·r = {ndotr}");
    assert!(ndotv.abs() < 1e-6, "N̂·v = {ndotv}");
    // R̂ = r̂.
    let rn = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
    for k in 0..3 {
        assert!((ric[0][k] - r[k] / rn).abs() < 1e-12, "R̂ ≠ r̂ axis {k}");
    }
}

// Keep `precise_od` referenced so the import does not warn before the later tasks land.
#[allow(dead_code)]
fn _module_is_linked() {
    let _ = precise_od::MODULE_NAME;
}
