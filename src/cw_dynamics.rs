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
//! [`propagate_second_order`] adds the closed-form second-order correction (the quadratic
//! terms of the exact relative equations about a circular chief), so the neglected remainder
//! is of third order in the separation.
//!
//! Scope (honest): [`propagate`] is the **linear** (first-order) relative-motion model on a
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

/// The second-order correction `δs₂(t)` to the Clohessy–Wiltshire solution for a chief on a
/// circular orbit of radius `r0` (m) at mean motion `n` (rad/s).
///
/// Expanding the exact two-body relative equations about the circular chief to second order in
/// the separation gives the CW operator forced by quadratic terms (Karlgaard and Lutze, Journal
/// of Guidance, Control, and Dynamics 26(1), 2003; Newman, Lovell and Pratt, 2015, second-order
/// Cartesian solution by a Volterra series):
///
/// ```text
///   ẍ − 2nẏ − 3n²x = −(3n²/(2 r0)) (2x² − y² − z²)
///   ÿ + 2nẋ        =  (3n²/r0) x y
///   z̈ + n²z        =  (3n²/r0) x z
/// ```
///
/// With the first-order (CW) state on the right-hand side, the response from zero initial
/// conditions is the convolution of the CW state-transition matrix with that forcing. It has the
/// closed form returned here, a quadratic form in the initial state whose coefficients are
/// polynomials in `τ = n t`, `sin τ` and `cos τ` (secular `τ` and `τ²` terms included). The
/// coefficients were obtained by exact symbolic integration of that convolution and checked to
/// leave a residual of third order in the separation against the full nonlinear equations.
pub fn second_order_correction(n: f64, r0: f64, t: f64, s0: &State6) -> State6 {
    let tau = n * t;
    let (s, c) = tau.sin_cos();
    let (t, t2, s2, c2) = (tau, tau * tau, s * s, c * c);
    // Positions in metres, velocities divided by n (metres per radian of chief motion).
    let (x, y, z) = (s0[0], s0[1], s0[2]);
    let (u, v, w) = (s0[3] / n, s0[4] / n, s0[5] / n);
    // radial position
    let g0 = x * x * (-18.0 * t2 + 18.0 * t * s - 9.0 * s2 - 15.0 * c + 15.0)
        + x * y * (6.0 * t - 6.0 * s)
        + x * u * (6.0 * t * c - 12.0 * t - 6.0 * s * c + 12.0 * s)
        + x * v * (-18.0 * t2 + 21.0 * t * s - 12.0 * s2 - 18.0 * c + 18.0)
        + y * y * (-1.5 * c + 1.5)
        + y * v * (3.0 * t - 3.0 * s)
        + z * z * (-0.5 * c2 - 0.5 * c + 1.0)
        + z * w * (-s * c + s)
        + u * u * (s2 + 2.0 * c - 2.0)
        + u * v * (3.0 * t * c - 6.0 * t - 4.0 * s * c + 7.0 * s)
        + v * v * (-4.5 * t2 + 6.0 * t * s - 4.0 * s2 - 5.0 * c + 5.0)
        + w * w * (-0.5 * s2 - c + 1.0);
    // along-track position
    let g1 = x * x * (-18.0 * t * c - 16.5 * t + 4.5 * s * c + 30.0 * s)
        + x * y * (-3.0 * c + 3.0)
        + x * u * (6.0 * t * s + 3.0 * c2 + 6.0 * c - 9.0)
        + x * v * (-21.0 * t * c - 21.0 * t + 6.0 * s * c + 36.0 * s)
        + y * y * (-3.0 * t + 3.0 * s)
        + y * u * (3.0 * t - 3.0 * s)
        + z * z * (-1.5 * t + 0.5 * s * c + s)
        + z * w * (s2 + 2.0 * c - 2.0)
        + u * u * (-1.5 * t - 0.5 * s * c + 2.0 * s)
        + u * v * (3.0 * t * s + 2.0 * c2 + 2.0 * c - 4.0)
        + v * v * (-6.0 * t * c - 6.0 * t + 2.0 * s * c + 10.0 * s)
        + w * w * (-1.5 * t - 0.5 * s * c + 2.0 * s);
    // cross-track position
    let g2 = x * z * (6.0 * t * s - 3.0 * s2 + 3.0 * c - 3.0)
        + x * w * (-6.0 * t * c + 3.0 * s * c + 3.0 * s)
        + z * u * (-s * c + s)
        + z * v * (3.0 * t * s + 2.0 * c2 + 2.0 * c - 4.0)
        + u * w * (c2 - 2.0 * c + 1.0)
        + v * w * (-3.0 * t * c + 2.0 * s * c + s);
    // radial rate
    let g3 = x * x * (18.0 * t * c - 36.0 * t - 18.0 * s * c + 33.0 * s)
        + x * y * (-6.0 * c + 6.0)
        + x * u * (-6.0 * t * s - 12.0 * c2 + 18.0 * c - 6.0)
        + x * v * (21.0 * t * c - 36.0 * t - 24.0 * s * c + 39.0 * s)
        + y * y * (1.5 * s)
        + y * v * (-3.0 * c + 3.0)
        + z * z * (s * c + 0.5 * s)
        + z * w * (-2.0 * c2 + c + 1.0)
        + u * u * (2.0 * s * c - 2.0 * s)
        + u * v * (-3.0 * t * s + 8.0 * s2 + 10.0 * c - 10.0)
        + v * v * (6.0 * t * c - 9.0 * t - 8.0 * s * c + 11.0 * s)
        + w * w * (-s * c + s);
    // along-track rate
    let g4 = x * x * (18.0 * t * s - 9.0 * s2 + 12.0 * c - 12.0)
        + x * y * (3.0 * s)
        + x * u * (6.0 * t * c - 6.0 * s * c)
        + x * v * (21.0 * t * s - 12.0 * s2 + 15.0 * c - 15.0)
        + y * y * (3.0 * c - 3.0)
        + y * u * (-3.0 * c + 3.0)
        + z * z * (c2 + c - 2.0)
        + z * w * (2.0 * s * c - 2.0 * s)
        + u * u * (s2 + 2.0 * c - 2.0)
        + u * v * (3.0 * t * c - 4.0 * s * c + s)
        + v * v * (6.0 * t * s - 4.0 * s2 + 4.0 * c - 4.0)
        + w * w * (s2 + 2.0 * c - 2.0);
    // cross-track rate
    let g5 = x * z * (6.0 * t * c - 6.0 * s * c + 3.0 * s)
        + x * w * (6.0 * t * s + 6.0 * c2 - 3.0 * c - 3.0)
        + z * u * (-2.0 * c2 + c + 1.0)
        + z * v * (3.0 * t * c - 4.0 * s * c + s)
        + u * w * (-2.0 * s * c + 2.0 * s)
        + v * w * (3.0 * t * s + 4.0 * c2 - 2.0 * c - 2.0);

    let k = 1.0 / r0;
    [g0 * k, g1 * k, g2 * k, g3 * k * n, g4 * k * n, g5 * k * n]
}

/// Propagate a relative state with the Clohessy–Wiltshire solution plus its closed-form
/// second-order correction ([`second_order_correction`]): `s(t) = Φ(n, t) s(0) + δs₂(t)`.
///
/// The neglected remainder is of third order in `separation / r0`; at 100 m about a 500 km
/// circular orbit it is far below a millimetre over a third of an orbit, where the linear model
/// alone departs by millimetres.
pub fn propagate_second_order(n: f64, r0: f64, t: f64, s0: &State6) -> State6 {
    let lin = propagate(n, t, s0);
    let d = second_order_correction(n, r0, t, s0);
    let mut out = lin;
    for (o, di) in out.iter_mut().zip(d.iter()) {
        *o += di;
    }
    out
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
        assert!(
            approx(got[2], z_expected, 1e-9),
            "z {} vs {z_expected}",
            got[2]
        );
        assert!(
            approx(got[5], vz_expected, 1e-12),
            "vz {} vs {vz_expected}",
            got[5]
        );
    }

    /// The exact two-body relative acceleration about a circular chief of radius `r0`.
    fn exact_rate(n: f64, r0: f64, s: &State6) -> State6 {
        let mu = n * n * r0 * r0 * r0;
        let (x, y, z, vx, vy, vz) = (s[0], s[1], s[2], s[3], s[4], s[5]);
        let rr = ((r0 + x).powi(2) + y * y + z * z).sqrt();
        let k = mu / (rr * rr * rr);
        [
            vx,
            vy,
            vz,
            2.0 * n * vy + n * n * (r0 + x) - k * (r0 + x),
            -2.0 * n * vx + n * n * y - k * y,
            -k * z,
        ]
    }

    fn rk4_exact(n: f64, r0: f64, t: f64, s0: &State6, steps: usize) -> State6 {
        let h = t / steps as f64;
        let mut s = *s0;
        let add = |a: &State6, b: &State6, f: f64| {
            let mut o = *a;
            for i in 0..6 {
                o[i] += f * b[i];
            }
            o
        };
        for _ in 0..steps {
            let k1 = exact_rate(n, r0, &s);
            let k2 = exact_rate(n, r0, &add(&s, &k1, h / 2.0));
            let k3 = exact_rate(n, r0, &add(&s, &k2, h / 2.0));
            let k4 = exact_rate(n, r0, &add(&s, &k3, h));
            for i in 0..6 {
                s[i] += h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]);
            }
        }
        s
    }

    #[test]
    fn second_order_correction_vanishes_at_epoch() {
        let d = second_order_correction(0.0011, 6.9e6, 0.0, &[50.0, -30.0, 20.0, 0.1, -0.2, 0.05]);
        assert!(d.iter().all(|v| v.abs() < 1e-15), "{d:?}");
    }

    /// Internal consistency (not an oracle): against the integrated exact equations, the linear
    /// residual scales as the square of the separation and the second-order residual as its cube.
    #[test]
    fn second_order_residual_is_third_order_in_separation() {
        let r0 = 6_878_137.0;
        let n = mean_motion(3.986_004_418e14, r0);
        let t = 1.5 * std::f64::consts::PI / n;
        let dir = [0.6, -0.3, 0.5, 0.4 * n, -0.7 * n, 0.2 * n];
        let mut prev: Option<(f64, f64)> = None;
        for scale in [20_000.0, 2_000.0] {
            let s0: State6 = std::array::from_fn(|i| dir[i] * scale);
            let truth = rk4_exact(n, r0, t, &s0, 40_000);
            let lin = propagate(n, t, &s0);
            let quad = propagate_second_order(n, r0, t, &s0);
            let e1 = (0..3)
                .map(|i| (lin[i] - truth[i]).abs())
                .fold(0.0, f64::max);
            let e2 = (0..3)
                .map(|i| (quad[i] - truth[i]).abs())
                .fold(0.0, f64::max);
            assert!(e2 < 0.05 * e1, "scale {scale}: e1 {e1:e} e2 {e2:e}");
            if let Some((p1, p2)) = prev {
                assert!((p1 / e1 - 100.0).abs() < 2.0, "linear ratio {}", p1 / e1);
                assert!(
                    (p2 / e2 - 1000.0).abs() < 50.0,
                    "quadratic ratio {}",
                    p2 / e2
                );
            }
            prev = Some((e1, e2));
        }
    }
}
