// SPDX-License-Identifier: AGPL-3.0-only
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
//! **Differential-corrected periodic orbits** are provided: [`cr3bp_jacobian`] and
//! [`propagate_state_stm`] integrate the state-transition matrix, and
//! [`differential_correct_halo`] uses single shooting to drive a symmetric guess
//! onto an exactly periodic halo/NRHO — reproducing the published L2 southern 9:2
//! NRHO (the Gateway orbit).
//!
//! Honest scope: this is the *circular* restricted problem (the Moon's orbit is
//! taken circular and the Sun is neglected). The eccentric/ephemeris (DE) model
//! and the de-normalised transform of a corrected orbit into the selenocentric
//! MCI/MCMF frames of [`crate::lunar`] are follow-ons (see `ROADMAP.md`).

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

// ── Variational equations + differential correction of periodic orbits ───────
//
// A halo/NRHO is a *periodic* solution of the CR3BP. Finding it needs the
// **state-transition matrix** (STM) `Φ(t)`, the sensitivity of the final state to
// the initial state, which obeys `Φ̇ = A(t)·Φ`, `Φ(0)=I`, with `A` the Jacobian of
// the equations of motion. Single-shooting differential correction then drives a
// symmetric initial guess onto an exactly periodic orbit.

/// Mean Earth–Moon distance (km) — the CR3BP length unit.
pub const EARTH_MOON_DIST_KM: f64 = 384_400.0;
/// Sidereal month (days) — `2π` rotating-frame time units.
pub const SIDEREAL_MONTH_DAYS: f64 = 27.321_661;
/// Mean lunar radius (km).
pub const MOON_RADIUS_KM: f64 = 1_737.4;

/// The 6×6 Jacobian `A = ∂[ṙ, v̇]/∂[r, v]` of the CR3BP equations of motion at a
/// position `r` (the velocity enters only through the constant Coriolis block).
/// Used to propagate the state-transition matrix.
pub fn cr3bp_jacobian(r: [f64; 3], mu: f64) -> [[f64; 6]; 6] {
    let [x, y, z] = r;
    let a = 1.0 - mu;
    let b = mu;
    let dx1 = x + mu;
    let dx2 = x - 1.0 + mu;
    let r1 = (dx1 * dx1 + y * y + z * z).sqrt();
    let r2 = (dx2 * dx2 + y * y + z * z).sqrt();
    let (r1_3, r2_3) = (r1.powi(3), r2.powi(3));
    let (r1_5, r2_5) = (r1.powi(5), r2.powi(5));
    // Second derivatives of the pseudo-potential Ω = ½(x²+y²) + a/r1 + b/r2.
    let oxx = 1.0 - a / r1_3 - b / r2_3 + 3.0 * a * dx1 * dx1 / r1_5 + 3.0 * b * dx2 * dx2 / r2_5;
    let oyy = 1.0 - a / r1_3 - b / r2_3 + 3.0 * a * y * y / r1_5 + 3.0 * b * y * y / r2_5;
    let ozz = -a / r1_3 - b / r2_3 + 3.0 * a * z * z / r1_5 + 3.0 * b * z * z / r2_5;
    let oxy = 3.0 * a * dx1 * y / r1_5 + 3.0 * b * dx2 * y / r2_5;
    let oxz = 3.0 * a * dx1 * z / r1_5 + 3.0 * b * dx2 * z / r2_5;
    let oyz = 3.0 * a * y * z / r1_5 + 3.0 * b * y * z / r2_5;
    let mut m = [[0.0f64; 6]; 6];
    m[0][3] = 1.0;
    m[1][4] = 1.0;
    m[2][5] = 1.0;
    m[3][0] = oxx;
    m[3][1] = oxy;
    m[3][2] = oxz;
    m[3][4] = 2.0; // +2ẏ Coriolis
    m[4][0] = oxy;
    m[4][1] = oyy;
    m[4][2] = oyz;
    m[4][3] = -2.0; // −2ẋ Coriolis
    m[5][0] = oxz;
    m[5][1] = oyz;
    m[5][2] = ozz;
    m
}

fn state_to_vec(s: &Cr3bpState) -> [f64; 6] {
    [s.r[0], s.r[1], s.r[2], s.v[0], s.v[1], s.v[2]]
}
fn vec_to_state(v: &[f64; 6]) -> Cr3bpState {
    Cr3bpState {
        r: [v[0], v[1], v[2]],
        v: [v[3], v[4], v[5]],
    }
}
fn identity6() -> [[f64; 6]; 6] {
    let mut m = [[0.0f64; 6]; 6];
    for (i, row) in m.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    m
}
fn matmul6(a: &[[f64; 6]; 6], b: &[[f64; 6]; 6]) -> [[f64; 6]; 6] {
    let mut c = [[0.0f64; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            let mut s = 0.0;
            for (k, brow) in b.iter().enumerate() {
                s += a[i][k] * brow[j];
            }
            c[i][j] = s;
        }
    }
    c
}

/// Combined derivative of the state (6) and the STM (6×6): `[v, a]` and `A·Φ`.
fn deriv_with_stm(x: &[f64; 6], phi: &[[f64; 6]; 6], mu: f64) -> ([f64; 6], [[f64; 6]; 6]) {
    let acc = cr3bp_accel([x[0], x[1], x[2]], [x[3], x[4], x[5]], mu);
    let dx = [x[3], x[4], x[5], acc[0], acc[1], acc[2]];
    let a = cr3bp_jacobian([x[0], x[1], x[2]], mu);
    (dx, matmul6(&a, phi))
}

/// Propagate a state **and its state-transition matrix** for time `t` in `steps`
/// RK4 sub-steps (the STM is initialised to identity).
pub fn propagate_state_stm(
    s0: &Cr3bpState,
    mu: f64,
    t: f64,
    steps: usize,
) -> (Cr3bpState, [[f64; 6]; 6]) {
    let n = steps.max(1);
    let h = t / n as f64;
    let mut x = state_to_vec(s0);
    let mut phi = identity6();
    let lin = |x: &[f64; 6], p: &[[f64; 6]; 6], kx: &[f64; 6], kp: &[[f64; 6]; 6], sc: f64| {
        let mut xo = *x;
        let mut po = *p;
        for i in 0..6 {
            xo[i] += sc * kx[i];
            for j in 0..6 {
                po[i][j] += sc * kp[i][j];
            }
        }
        (xo, po)
    };
    for _ in 0..n {
        let (k1x, k1p) = deriv_with_stm(&x, &phi, mu);
        let (x2, p2) = lin(&x, &phi, &k1x, &k1p, h / 2.0);
        let (k2x, k2p) = deriv_with_stm(&x2, &p2, mu);
        let (x3, p3) = lin(&x, &phi, &k2x, &k2p, h / 2.0);
        let (k3x, k3p) = deriv_with_stm(&x3, &p3, mu);
        let (x4, p4) = lin(&x, &phi, &k3x, &k3p, h);
        let (k4x, k4p) = deriv_with_stm(&x4, &p4, mu);
        for i in 0..6 {
            x[i] += h / 6.0 * (k1x[i] + 2.0 * k2x[i] + 2.0 * k3x[i] + k4x[i]);
            for j in 0..6 {
                phi[i][j] += h / 6.0 * (k1p[i][j] + 2.0 * k2p[i][j] + 2.0 * k3p[i][j] + k4p[i][j]);
            }
        }
    }
    (vec_to_state(&x), phi)
}

/// Propagate from `s0` to the next `y = 0` plane crossing after `t_min` (up to
/// `t_max`), returning the crossing state, the STM there, and the crossing time.
fn propagate_to_crossing(
    s0: &Cr3bpState,
    mu: f64,
    t_min: f64,
    t_max: f64,
) -> Option<(Cr3bpState, [[f64; 6]; 6], f64)> {
    let n = 6000;
    let h = t_max / n as f64;
    let mut x = state_to_vec(s0);
    let mut phi = identity6();
    let mut t = 0.0;
    for _ in 0..n {
        let x_prev = x;
        let phi_prev = phi;
        let t_prev = t;
        let (s1, p1) = propagate_state_stm(&vec_to_state(&x), mu, h, 1);
        x = state_to_vec(&s1);
        phi = matmul6(&p1, &phi);
        t += h;
        if t_prev > t_min && x_prev[1] * x[1] < 0.0 {
            // Crossing between t_prev and t: refine from x_prev by Newton on y(t).
            let mut dt = -x_prev[1] / x_prev[4];
            let mut sc = vec_to_state(&x_prev);
            let mut phi_sub = identity6();
            for _ in 0..8 {
                let (s2, p2) = propagate_state_stm(&vec_to_state(&x_prev), mu, dt, 400);
                sc = s2;
                phi_sub = p2;
                if sc.r[1].abs() < 1e-13 {
                    break;
                }
                dt -= sc.r[1] / sc.v[1];
            }
            return Some((sc, matmul6(&phi_sub, &phi_prev), t_prev + dt));
        }
    }
    None
}

/// A differential-corrected periodic orbit of the CR3BP.
#[derive(Clone, Copy, Debug)]
pub struct PeriodicOrbit {
    /// Initial condition at the `x`-`z` plane crossing (`y=0`, `ẋ=ż=0`).
    pub ic: Cr3bpState,
    /// Full orbital period (rotating-frame time units).
    pub period: f64,
    /// Jacobi constant of the orbit.
    pub jacobi: f64,
}

impl PeriodicOrbit {
    /// Orbital period in days.
    pub fn period_days(&self) -> f64 {
        self.period * SIDEREAL_MONTH_DAYS / (2.0 * std::f64::consts::PI)
    }

    /// Minimum distance to the Moon over one period (km) — the perilune radius.
    pub fn perilune_radius_km(&self, mu: f64, samples: usize) -> f64 {
        let n = samples.max(100);
        let mut min_d = f64::INFINITY;
        for i in 0..=n {
            let frac = i as f64 / n as f64;
            let s = propagate_cr3bp(
                self.ic,
                mu,
                self.period * frac,
                (4000.0 * frac) as usize + 1,
            );
            let dx = s.r[0] - (1.0 - mu);
            let d = (dx * dx + s.r[1] * s.r[1] + s.r[2] * s.r[2]).sqrt();
            min_d = min_d.min(d);
        }
        min_d * EARTH_MOON_DIST_KM
    }
}

/// **Differential-correct a symmetric halo/NRHO** from an initial guess at a
/// perpendicular `x`-`z` plane crossing `[x0, 0, z0, 0, ẏ0, 0]`. Holding `x0`
/// fixed, it varies `{z0, ẏ0}` (single shooting, using the STM at the next
/// crossing) to drive the crossing velocities `ẋ_f` and `ż_f` to zero — the
/// condition for a periodic orbit symmetric about the `x`-`z` plane (Howell's
/// scheme). Returns `None` if it does not converge within `max_iter`.
pub fn differential_correct_halo(
    guess: &Cr3bpState,
    mu: f64,
    tol: f64,
    max_iter: usize,
) -> Option<PeriodicOrbit> {
    let x0 = guess.r[0]; // held fixed; the family is parametrised by x0
    let mut z0 = guess.r[2];
    let mut vy0 = guess.v[1];
    for _ in 0..max_iter {
        let s0 = Cr3bpState {
            r: [x0, 0.0, z0],
            v: [0.0, vy0, 0.0],
        };
        let (sc, phi, t_h) = propagate_to_crossing(&s0, mu, 0.1, 7.0)?;
        let (vxf, vyf, vzf) = (sc.v[0], sc.v[1], sc.v[2]);
        if vxf.hypot(vzf) < tol {
            return Some(PeriodicOrbit {
                ic: s0,
                period: 2.0 * t_h,
                jacobi: jacobi_constant(&s0, mu),
            });
        }
        // Acceleration at the crossing (for the variable-time correction).
        let acc = cr3bp_accel(sc.r, sc.v, mu);
        let (axf, azf) = (acc[0], acc[2]);
        // Reduce the STM with the y=0 time constraint: δt = −(Φ23 δz + Φ25 δẏ)/ẏf.
        let m11 = phi[3][2] - axf * phi[1][2] / vyf;
        let m12 = phi[3][4] - axf * phi[1][4] / vyf;
        let m21 = phi[5][2] - azf * phi[1][2] / vyf;
        let m22 = phi[5][4] - azf * phi[1][4] / vyf;
        let det = m11 * m22 - m12 * m21;
        if det.abs() < 1e-14 {
            return None;
        }
        let (b1, b2) = (-vxf, -vzf);
        let dz = (b1 * m22 - m12 * b2) / det;
        let dvy = (m11 * b2 - b1 * m21) / det;
        z0 += dz;
        vy0 += dvy;
    }
    None
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

    // ── The STM is the true linearisation: validate against finite differences ─
    #[test]
    fn stm_matches_finite_difference() {
        let s = Cr3bpState {
            r: [1.05, 0.02, -0.10],
            v: [0.10, 0.20, -0.05],
        };
        let (t, steps) = (0.30, 4000);
        let (_, phi) = propagate_state_stm(&s, EARTH_MOON_MU, t, steps);
        let base = super::state_to_vec(&s);
        let eps = 1e-6;
        for j in 0..6 {
            let mut sp = base;
            let mut sm = base;
            sp[j] += eps;
            sm[j] -= eps;
            let (ep, _) = propagate_state_stm(&super::vec_to_state(&sp), EARTH_MOON_MU, t, steps);
            let (em, _) = propagate_state_stm(&super::vec_to_state(&sm), EARTH_MOON_MU, t, steps);
            let ev = super::state_to_vec(&ep);
            let mv = super::state_to_vec(&em);
            for i in 0..6 {
                let fd = (ev[i] - mv[i]) / (2.0 * eps);
                assert!(
                    (phi[i][j] - fd).abs() < 1e-5,
                    "STM[{i}][{j}]={} vs finite-diff {fd}",
                    phi[i][j]
                );
            }
        }
    }

    // ── The corrector produces a genuinely periodic L2 halo (machine closure) ─
    #[test]
    fn differential_corrector_produces_periodic_halo() {
        let mu = EARTH_MOON_MU;
        let guess = Cr3bpState {
            r: [1.08, 0.0, -0.10],
            v: [0.0, -0.10, 0.0],
        };
        let orbit = differential_correct_halo(&guess, mu, 1e-11, 60)
            .expect("L2 halo differential correction should converge");
        // It is genuinely three-dimensional (a halo, not a planar Lyapunov).
        assert!(orbit.ic.r[2].abs() > 0.05, "halo should be out of plane");
        // Propagating the corrected IC for one full period returns to the start.
        let end = propagate_cr3bp(orbit.ic, mu, orbit.period, 80_000);
        let close = norm([
            end.r[0] - orbit.ic.r[0],
            end.r[1] - orbit.ic.r[1],
            end.r[2] - orbit.ic.r[2],
        ]);
        assert!(
            close < 1e-6,
            "halo should close on itself, residual {close:.2e}"
        );
        // The Jacobi constant is consistent end-to-end.
        let cj = jacobi_constant(&end, mu);
        assert!(
            (cj - orbit.jacobi).abs() < 1e-7,
            "Jacobi drift over a period"
        );
    }

    // ── Reproduce the published L2 southern 9:2 NRHO (the Gateway orbit) ───────
    #[test]
    fn reproduces_l2_southern_nrho_92_regime() {
        let mu = EARTH_MOON_MU;
        // Seed near the published 9:2 NRHO apolune state and correct it.
        let guess = Cr3bpState {
            r: [1.0220, 0.0, -0.1800],
            v: [0.0, -0.1020, 0.0],
        };
        let nrho = differential_correct_halo(&guess, mu, 1e-11, 80)
            .expect("9:2 NRHO differential correction should converge");
        // Near-rectilinear: a large out-of-plane (near-polar) amplitude at apolune.
        assert!(
            nrho.ic.r[2].abs() > 0.15,
            "NRHO apolune amplitude too small"
        );
        // Period in the 9:2 regime (published ≈ 6.56 days).
        let days = nrho.period_days();
        assert!(
            (6.0..=7.2).contains(&days),
            "NRHO period {days:.3} d outside 9:2 regime"
        );
        // Perilune skims the Moon (published ≈ 3,370 km radius, ~1,600 km altitude).
        let peri = nrho.perilune_radius_km(mu, 600);
        assert!(
            (2_500.0..=5_000.0).contains(&peri),
            "NRHO perilune {peri:.0} km outside the near-rectilinear regime"
        );
        assert!(
            peri > MOON_RADIUS_KM,
            "perilune must clear the lunar surface"
        );
        // It is a genuine periodic orbit (closes over a full ~6.5-day revolution).
        let end = propagate_cr3bp(nrho.ic, mu, nrho.period, 120_000);
        let close = norm([
            end.r[0] - nrho.ic.r[0],
            end.r[1] - nrho.ic.r[1],
            end.r[2] - nrho.ic.r[2],
        ]);
        assert!(
            close < 1e-4,
            "NRHO should close on itself, residual {close:.2e}"
        );
    }
}
