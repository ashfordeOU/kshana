// SPDX-License-Identifier: Apache-2.0
//! Circular restricted three-body problem (CR3BP) for the Earth–Moon system.
//!
//! The shipped propagators are two-body/SGP4 (Earth-relative) — they cannot
//! represent a cislunar orbit such as a Near-Rectilinear Halo Orbit (NRHO), which
//! is a periodic solution of the *three-body* dynamics. This module adds the
//! CR3BP: motion in the Earth–Moon **rotating (synodic) frame**, normalised so the
//! Earth–Moon distance and the mean motion are unity and the only parameter is the
//! mass ratio `μ = m_moon/(m_earth+m_moon)`.
//!
//! In these units the primaries sit on the x-axis — Earth at `(−μ, 0, 0)`, Moon at
//! `(1−μ, 0, 0)` — and the equations of motion are
//!
//! ```text
//! ẍ − 2ẏ = ∂U/∂x,  ÿ + 2ẋ = ∂U/∂y,  z̈ = ∂U/∂z
//! U = ½(x²+y²) + (1−μ)/r₁ + μ/r₂
//! ```
//!
//! with `r₁`, `r₂` the distances to Earth and Moon. The **Jacobi constant**
//! `C = 2U − v²` is the single integral of motion and is the natural validation
//! anchor (it is conserved to integrator precision along every trajectory). The
//! five **Lagrange points** are the equilibria of this field — `L4`/`L5` are the
//! exact equilateral points `(½−μ, ±√3/2, 0)`, `L1`/`L2`/`L3` the collinear roots.
//!
//! Honest scope: this is the *circular* restricted problem (the Moon's orbit is
//! taken circular and the Sun is neglected). Differential-corrected periodic NRHO
//! initial conditions, the eccentric/ephemeris (DE) model, and the de-normalised
//! transform into the selenocentric MCI/MCMF frames of [`crate::lunar`] are
//! follow-ons (see `ROADMAP.md`).

/// Earth–Moon mass ratio `μ = m_moon/(m_earth + m_moon)` (DE405-consistent).
pub const EARTH_MOON_MU: f64 = 0.012_150_585_609_624;

/// A CR3BP state in the rotating frame, normalised units (position in Earth–Moon
/// distances, velocity in distance per rotating-frame time unit).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Cr3bpState {
    /// Rotating-frame position `[x, y, z]`.
    pub r: [f64; 3],
    /// Rotating-frame velocity `[ẋ, ẏ, ż]`.
    pub v: [f64; 3],
}

/// Rotating-frame acceleration `[ẍ, ÿ, z̈]` for position `r` and velocity `v`
/// (the Coriolis terms `±2ẏ`, `∓2ẋ` are included).
pub fn cr3bp_accel(r: [f64; 3], v: [f64; 3], mu: f64) -> [f64; 3] {
    let [x, y, z] = r;
    let om = 1.0 - mu;
    let r1c = ((x + mu).powi(2) + y * y + z * z).powf(1.5);
    let r2c = ((x - om).powi(2) + y * y + z * z).powf(1.5);
    [
        2.0 * v[1] + x - om * (x + mu) / r1c - mu * (x - om) / r2c,
        -2.0 * v[0] + y - om * y / r1c - mu * y / r2c,
        -om * z / r1c - mu * z / r2c,
    ]
}

/// The Jacobi constant `C = 2U − v²` (conserved along a trajectory).
pub fn jacobi_constant(s: &Cr3bpState, mu: f64) -> f64 {
    let [x, y, z] = s.r;
    let om = 1.0 - mu;
    let r1 = ((x + mu).powi(2) + y * y + z * z).sqrt();
    let r2 = ((x - om).powi(2) + y * y + z * z).sqrt();
    let u = 0.5 * (x * x + y * y) + om / r1 + mu / r2;
    let v2 = s.v[0].powi(2) + s.v[1].powi(2) + s.v[2].powi(2);
    2.0 * u - v2
}

/// State derivative `d/dt [r, v] = [v, a]`.
fn deriv(s: Cr3bpState, mu: f64) -> Cr3bpState {
    Cr3bpState {
        r: s.v,
        v: cr3bp_accel(s.r, s.v, mu),
    }
}

fn axpy(a: Cr3bpState, sc: f64, b: Cr3bpState) -> Cr3bpState {
    Cr3bpState {
        r: [
            a.r[0] + sc * b.r[0],
            a.r[1] + sc * b.r[1],
            a.r[2] + sc * b.r[2],
        ],
        v: [
            a.v[0] + sc * b.v[0],
            a.v[1] + sc * b.v[1],
            a.v[2] + sc * b.v[2],
        ],
    }
}

/// Propagate a CR3BP state by `dt` (rotating-frame time units) in `steps` RK4
/// sub-steps.
pub fn propagate_cr3bp(s: Cr3bpState, mu: f64, dt: f64, steps: usize) -> Cr3bpState {
    let n = steps.max(1);
    let h = dt / n as f64;
    let mut st = s;
    for _ in 0..n {
        let k1 = deriv(st, mu);
        let k2 = deriv(axpy(st, h / 2.0, k1), mu);
        let k3 = deriv(axpy(st, h / 2.0, k2), mu);
        let k4 = deriv(axpy(st, h, k3), mu);
        let mut next = st;
        for j in 0..3 {
            next.r[j] += h / 6.0 * (k1.r[j] + 2.0 * k2.r[j] + 2.0 * k3.r[j] + k4.r[j]);
            next.v[j] += h / 6.0 * (k1.v[j] + 2.0 * k2.v[j] + 2.0 * k3.v[j] + k4.v[j]);
        }
        st = next;
    }
    st
}

/// The five Lagrange points `[L1, L2, L3, L4, L5]` (rotating-frame positions). The
/// collinear points are the roots of the on-axis effective force, found by
/// bisection; `L4`/`L5` are the exact equilateral points `(½−μ, ±√3/2, 0)`.
pub fn lagrange_points(mu: f64) -> [[f64; 3]; 5] {
    let om = 1.0 - mu;
    // On-axis (y = z = 0, v = 0) net acceleration; its roots are the collinear points.
    let g = |x: f64| {
        let r1 = (x + mu).abs();
        let r2 = (x - om).abs();
        x - om * (x + mu) / r1.powi(3) - mu * (x - om) / r2.powi(3)
    };
    let bisect = |lo: f64, hi: f64| -> f64 {
        let (mut a, mut b) = (lo, hi);
        let fa = g(a);
        for _ in 0..200 {
            let m = 0.5 * (a + b);
            if fa * g(m) <= 0.0 {
                b = m;
            } else {
                a = m;
            }
        }
        0.5 * (a + b)
    };
    let l1 = bisect(0.5, om - 1e-6); // between Earth and Moon
    let l2 = bisect(om + 1e-6, 2.0); // beyond the Moon
    let l3 = bisect(-1.5, -mu - 1e-6); // beyond Earth, opposite the Moon
    let xeq = 0.5 - mu;
    let yeq = 3.0_f64.sqrt() / 2.0;
    [
        [l1, 0.0, 0.0],
        [l2, 0.0, 0.0],
        [l3, 0.0, 0.0],
        [xeq, yeq, 0.0],
        [xeq, -yeq, 0.0],
    ]
}

#[cfg(test)]
mod tests {
    use super::*;

    fn norm(v: [f64; 3]) -> f64 {
        (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
    }

    #[test]
    fn lagrange_points_match_earth_moon_values() {
        let l = lagrange_points(EARTH_MOON_MU);
        // Published Earth–Moon collinear libration points (normalised x).
        assert!((l[0][0] - 0.836_915).abs() < 1e-4, "L1 x = {}", l[0][0]);
        assert!((l[1][0] - 1.155_682).abs() < 1e-4, "L2 x = {}", l[1][0]);
        assert!((l[2][0] - (-1.005_063)).abs() < 1e-4, "L3 x = {}", l[2][0]);
        // L4/L5 are the exact equilateral points (½−μ, ±√3/2, 0).
        let xeq = 0.5 - EARTH_MOON_MU;
        let yeq = 3.0_f64.sqrt() / 2.0;
        assert!((l[3][0] - xeq).abs() < 1e-12 && (l[3][1] - yeq).abs() < 1e-12);
        assert!((l[4][0] - xeq).abs() < 1e-12 && (l[4][1] + yeq).abs() < 1e-12);
    }

    #[test]
    fn lagrange_points_are_equilibria() {
        let l = lagrange_points(EARTH_MOON_MU);
        for (i, &p) in l.iter().enumerate() {
            let a = cr3bp_accel(p, [0.0; 3], EARTH_MOON_MU);
            // L4/L5 are exact; the collinear roots are good to the solver tolerance.
            let tol = if i >= 3 { 1e-12 } else { 1e-7 };
            assert!(
                norm(a) < tol,
                "L{} accel = {} (not an equilibrium)",
                i + 1,
                norm(a)
            );
        }
    }

    #[test]
    fn jacobi_constant_is_conserved_under_propagation() {
        // An off-plane state in the L2 vicinity, integrated for a quarter rotating-frame
        // period; the Jacobi constant must hold to integrator precision.
        let s0 = Cr3bpState {
            r: [1.15, 0.0, -0.12],
            v: [0.02, 0.18, 0.05],
        };
        let c0 = jacobi_constant(&s0, EARTH_MOON_MU);
        let s1 = propagate_cr3bp(s0, EARTH_MOON_MU, 1.5, 15_000);
        let c1 = jacobi_constant(&s1, EARTH_MOON_MU);
        assert!((c1 - c0).abs() < 1e-7, "Jacobi drift {} (C0={c0})", c1 - c0);
        // The state actually moved (the propagator is not a no-op).
        assert!(norm([s1.r[0] - s0.r[0], s1.r[1] - s0.r[1], s1.r[2] - s0.r[2]]) > 1e-3);
    }

    #[test]
    fn out_of_plane_acceleration_restores_toward_the_plane() {
        // Above the orbital plane (z > 0) both primaries pull the particle back down:
        // z̈ < 0. Below (z < 0), z̈ > 0. The z dynamics are a restoring (oscillatory)
        // term — the reason halo/NRHO orbits exist out of plane.
        let up = cr3bp_accel([0.9, 0.0, 0.1], [0.0; 3], EARTH_MOON_MU);
        assert!(up[2] < 0.0, "z̈ above plane should be negative: {}", up[2]);
        let down = cr3bp_accel([0.9, 0.0, -0.1], [0.0; 3], EARTH_MOON_MU);
        assert!(
            down[2] > 0.0,
            "z̈ below plane should be positive: {}",
            down[2]
        );
    }
}
