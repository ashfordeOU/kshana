// SPDX-License-Identifier: AGPL-3.0-only
//! Clohessy–Wiltshire / Hill relative-motion dynamics: the linearised motion of a
//! chaser relative to a target on a circular reference orbit, expressed in the
//! target's local-vertical/local-horizontal (LVLH) frame.
//!
//! The relative state is `s = (x, y, z, ẋ, ẏ, ż)` with the Hill convention used
//! here:
//! - `x` radial (along the target→zenith / outward radial direction),
//! - `y` along-track (direction of motion),
//! - `z` cross-track (orbit normal),
//!
//! and `n` the target mean motion. The linearised equations of relative motion
//! (Clohessy & Wiltshire 1960; Hill 1878) are
//!
//! ```text
//!   ẍ − 2 n ẏ − 3 n² x = 0
//!   ÿ + 2 n ẋ          = 0
//!   z̈ + n² z           = 0
//! ```
//!
//! They admit a **closed-form state-transition matrix** `Φ(t)` (Vallado, *Fundamentals
//! of Astrodynamics and Applications*, Alg. 48): `s(t) = Φ(n, t) · s(0)`. The
//! cross-track motion `z` is a decoupled simple-harmonic oscillator at the orbit rate;
//! the in-plane `(x, y)` motion has a secular along-track drift unless the
//! **bounded-orbit condition** `ẏ(0) = −2 n x(0)` holds, in which case the relative
//! trajectory is a closed 2:1 ellipse that repeats every orbital period.
//!
//! Scope (honest): this is the **linear** (first-order) relative-motion model on a
//! **circular** reference orbit — no eccentricity (Tschauner–Hempel), no J2 drift, no
//! differential drag, and the small-separation assumption (separation ≪ orbit radius)
//! is the user's responsibility. It is a MODELLED capability whose reference test
//! checks the closed-form `Φ` against an independent numeric integration of the same
//! ODEs and against the analytic invariants above.

/// A 6-element relative state `[x, y, z, ẋ, ẏ, ż]` (m, m, m, m/s, m/s, m/s).
pub type State6 = [f64; 6];

/// A 6×6 state-transition matrix, row-major.
pub type Mat6 = [[f64; 6]; 6];

/// Circular-orbit mean motion `n = √(μ / a³)` (rad/s) for gravitational parameter
/// `mu` (m³/s²) and reference-orbit semi-major axis `a` (m).
pub fn mean_motion(mu: f64, a: f64) -> f64 {
    (mu / (a * a * a)).sqrt()
}

/// The along-track rate `ẏ(0) = −2 n x(0)` that makes the in-plane relative orbit
/// **bounded** (no secular drift) for a given radial offset `x0`.
pub fn bounded_along_track_rate(n: f64, x0: f64) -> f64 {
    -2.0 * n * x0
}

/// The Clohessy–Wiltshire state-transition matrix `Φ(n, t)` such that
/// `s(t) = Φ(n, t) · s(0)`.
///
/// At `t = 0` this is the identity. `Φ` is built from the four 3×3 blocks
/// `[[Φ_rr, Φ_rv], [Φ_vr, Φ_vv]]` of the closed-form solution.
pub fn stm(n: f64, t: f64) -> Mat6 {
    let s = (n * t).sin();
    let c = (n * t).cos();
    let nt = n * t;
    let mut phi = [[0.0f64; 6]; 6];

    // Φ_rr — position from initial position.
    phi[0][0] = 4.0 - 3.0 * c;
    phi[1][0] = 6.0 * (s - nt);
    phi[1][1] = 1.0;
    phi[2][2] = c;

    // Φ_rv — position from initial velocity.
    phi[0][3] = s / n;
    phi[0][4] = (2.0 / n) * (1.0 - c);
    phi[1][3] = -(2.0 / n) * (1.0 - c);
    phi[1][4] = (4.0 * s - 3.0 * nt) / n;
    phi[2][5] = s / n;

    // Φ_vr — velocity from initial position.
    phi[3][0] = 3.0 * n * s;
    phi[4][0] = -6.0 * n * (1.0 - c);
    phi[5][2] = -n * s;

    // Φ_vv — velocity from initial velocity.
    phi[3][3] = c;
    phi[3][4] = 2.0 * s;
    phi[4][3] = -2.0 * s;
    phi[4][4] = 4.0 * c - 3.0;
    phi[5][5] = c;

    phi
}

/// Apply a 6×6 matrix to a 6-state: `m · s`.
pub fn apply(m: &Mat6, s: &State6) -> State6 {
    let mut out = [0.0f64; 6];
    for i in 0..6 {
        let mut acc = 0.0;
        for j in 0..6 {
            acc += m[i][j] * s[j];
        }
        out[i] = acc;
    }
    out
}

/// Propagate a relative state forward by `t` seconds using the closed-form STM:
/// `s(t) = Φ(n, t) · s(0)`.
pub fn propagate(n: f64, t: f64, s0: &State6) -> State6 {
    apply(&stm(n, t), s0)
}

/// The Hill/CW state derivative `ṡ` for the relative state `s` at mean motion `n`.
///
/// This is the right-hand side of the linearised equations of motion; the reference
/// test integrates it numerically as an independent oracle for [`stm`].
pub fn rate(n: f64, s: &State6) -> State6 {
    let (x, _y, z, vx, vy, vz) = (s[0], s[1], s[2], s[3], s[4], s[5]);
    [
        vx,
        vy,
        vz,
        3.0 * n * n * x + 2.0 * n * vy, // ẍ
        -2.0 * n * vx,                  // ÿ
        -n * n * z,                     // z̈
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn approx(a: f64, b: f64, tol: f64) -> bool {
        (a - b).abs() <= tol
    }

    #[test]
    fn stm_at_zero_is_identity() {
        let phi = stm(0.0011, 0.0);
        for (i, row) in phi.iter().enumerate() {
            for (j, &val) in row.iter().enumerate() {
                let expected = if i == j { 1.0 } else { 0.0 };
                assert!(
                    approx(val, expected, 1e-15),
                    "Φ(0)[{i}][{j}] = {val} (expected {expected})"
                );
            }
        }
    }

    #[test]
    fn cross_track_is_decoupled_shm() {
        // z is a simple-harmonic oscillator at rate n, independent of the in-plane state.
        let n = 0.0011;
        let s0 = [12.0, -3.0, 50.0, 0.1, -0.04, 0.7];
        let t = 1234.0;
        let got = propagate(n, t, &s0);
        let z_expected = s0[2] * (n * t).cos() + s0[5] / n * (n * t).sin();
        let vz_expected = -n * s0[2] * (n * t).sin() + s0[5] * (n * t).cos();
        assert!(approx(got[2], z_expected, 1e-9), "z {} vs {z_expected}", got[2]);
        assert!(approx(got[5], vz_expected, 1e-12), "vz {} vs {vz_expected}", got[5]);
    }
}
