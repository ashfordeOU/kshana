// SPDX-License-Identifier: AGPL-3.0-only
//! Impulsive / finite-burn maneuvers, a Lambert two-body transfer solver, and a
//! porkchop (departure × arrival C3 / arrival-V∞) sweep — the maneuver-modeling and
//! trajectory-design beachhead.
//!
//! Scope (honest). This is the *performance-simulation* layer above a full mission-design
//! tool (GMAT / Orekit), not a replacement for one. It ships:
//!   * impulsive ΔV nodes that apply a velocity discontinuity and carry a 6×6 covariance
//!     forward (deterministic burn ⇒ identity state-transition across the instant; the
//!     stochastic execution-error covariance adds into the velocity block, rotated from the
//!     burn frame),
//!   * a finite-burn integration (constant thrust over a burn arc, mass as a state) whose
//!     achieved ΔV is checked against the closed-form **Tsiolkovsky** rocket equation,
//!   * an **Izzo-2015** single-revolution Lambert solver (`r1`, `r2`, time-of-flight ⇒
//!     `v1`, `v2` for a two-body transfer), and
//!   * a **porkchop** sweep that maps a launch-epoch × arrival-epoch grid to departure C3
//!     and arrival V∞, emitted as a 2-D JSON array for browser contour rendering.
//!
//! Validation is fully self-contained and closed-form, **stronger** than reading a value off
//! a GMAT tutorial: every Lambert output is round-tripped through an exact universal-variable
//! Kepler propagator (two-body truth to machine precision — it must land back on `r2`), the
//! finite burn is checked against Tsiolkovsky to < 0.01 %, and the porkchop minimum is checked
//! against the analytic Hohmann-transfer C3 floor for two coplanar circular orbits.
//!
//! Honest residuals (not claimed): multi-revolution (M ≥ 1) Lambert branches, a planetary
//! ephemeris (the porkchop uses a synthetic coplanar-circular heliocentric model so the
//! optimum is analytic — a real DE-ephemeris Earth–Mars C3 cross-check against GMAT needs the
//! same ephemeris and has not been run), and live wiring of the porkchop JSON into the web
//! playground contour widget. Kshana points users to GMAT/Orekit for full multi-burn /
//! low-thrust optimization.

use serde::Serialize;
use std::f64::consts::PI;

type Vec3 = [f64; 3];

/// Standard gravity used to convert specific impulse (s) to effective exhaust velocity (m/s).
pub const G0: f64 = 9.806_65;
/// Heliocentric gravitational parameter (m³/s²), IAU 2015 nominal `GM_Sun`.
pub const MU_SUN: f64 = 1.327_124_400_18e20;
/// Astronomical unit (m), IAU 2012 definition.
pub const AU_M: f64 = 1.495_978_707e11;

// ---------------------------------------------------------------------------
// Small vector helpers (kept local, mirroring the other modules' style).
// ---------------------------------------------------------------------------
fn add(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] + b[0], a[1] + b[1], a[2] + b[2]]
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn scale(a: Vec3, s: f64) -> Vec3 {
    [a[0] * s, a[1] * s, a[2] * s]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}
fn unit(a: Vec3) -> Vec3 {
    let n = norm(a);
    [a[0] / n, a[1] / n, a[2] / n]
}

// ===========================================================================
// 1. Impulsive maneuver with covariance propagation.
// ===========================================================================

/// The frame an impulsive ΔV (and its execution-error covariance) is expressed in.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ManeuverFrame {
    /// Inertial: ΔV components are already in the propagation (ECI) frame.
    Eci,
    /// Local-vertical/local-horizontal (radial, along-track, cross-track) at the burn state.
    Lvlh,
}

/// An instantaneous velocity change with an optional execution-error covariance.
#[derive(Clone, Copy, Debug)]
pub struct ImpulsiveManeuver {
    /// ΔV components (m/s) expressed in [`ImpulsiveManeuver::frame`].
    pub dv: Vec3,
    /// The frame `dv` and `exec_cov` are given in.
    pub frame: ManeuverFrame,
    /// 3×3 ΔV execution-error covariance (m²/s²) in the same frame (zeros ⇒ perfect burn).
    pub exec_cov: [[f64; 3]; 3],
}

/// Columns of the LVLH→ECI rotation `[r̂ | t̂ | ĥ]` at state `(r, v)`:
/// radial `r̂ = r/|r|`, cross-track `ĥ = (r×v)/|r×v|`, along-track `t̂ = ĥ×r̂` (toward `+v`).
pub fn lvlh_to_eci(r: Vec3, v: Vec3) -> [[f64; 3]; 3] {
    let ur = unit(r);
    let uh = unit(cross(r, v));
    let ut = cross(uh, ur);
    // Column-major: m[i] is the i-th basis vector expressed in ECI.
    [ur, ut, uh]
}

/// Rotate a body-frame vector `x` into ECI given the LVLH→ECI columns `m`.
fn rotate(m: &[[f64; 3]; 3], x: Vec3) -> Vec3 {
    [
        m[0][0] * x[0] + m[1][0] * x[1] + m[2][0] * x[2],
        m[0][1] * x[0] + m[1][1] * x[1] + m[2][1] * x[2],
        m[0][2] * x[0] + m[1][2] * x[1] + m[2][2] * x[2],
    ]
}

/// Apply an impulsive maneuver to a 6-state `[r(3), v(3)]` and its 6×6 covariance.
///
/// Position is continuous; velocity jumps by the (frame-resolved) ΔV. Because the burn is a
/// deterministic, state-independent shift, the state-transition across the instant is the
/// identity, so the *a priori* covariance is unchanged — only the execution-error covariance
/// (rotated into ECI) adds into the velocity–velocity block. Returns `(state_after, cov_after)`.
pub fn apply_impulse(
    state: [f64; 6],
    cov: [[f64; 6]; 6],
    man: &ImpulsiveManeuver,
) -> ([f64; 6], [[f64; 6]; 6]) {
    let r = [state[0], state[1], state[2]];
    let v = [state[3], state[4], state[5]];
    // Resolve ΔV and execution covariance into ECI.
    let (dv_eci, q_eci) = match man.frame {
        ManeuverFrame::Eci => (man.dv, man.exec_cov),
        ManeuverFrame::Lvlh => {
            let m = lvlh_to_eci(r, v);
            // Q_eci = M · exec_cov · Mᵀ.
            let mut q = [[0.0f64; 3]; 3];
            for (i, qi) in q.iter_mut().enumerate() {
                for (j, qij) in qi.iter_mut().enumerate() {
                    let mut s = 0.0;
                    for (a, ma) in man.exec_cov.iter().enumerate() {
                        for (b, &mab) in ma.iter().enumerate() {
                            // M[i][a] · exec[a][b] · M[j][b], with M[row=i] = (col a)[i].
                            s += m[a][i] * mab * m[b][j];
                        }
                    }
                    *qij = s;
                }
            }
            (rotate(&m, man.dv), q)
        }
    };
    let mut out = state;
    out[3] += dv_eci[0];
    out[4] += dv_eci[1];
    out[5] += dv_eci[2];
    let mut cov_after = cov;
    for i in 0..3 {
        for j in 0..3 {
            cov_after[3 + i][3 + j] += q_eci[i][j];
        }
    }
    (out, cov_after)
}

// ===========================================================================
// 2. Finite-burn maneuver vs the Tsiolkovsky rocket equation.
// ===========================================================================

/// A constant-thrust burn over a fixed arc, integrated with mass as a state variable.
#[derive(Clone, Copy, Debug)]
pub struct FiniteBurn {
    /// Engine thrust (N).
    pub thrust_n: f64,
    /// Specific impulse (s); effective exhaust velocity is `isp_s · G0`.
    pub isp_s: f64,
    /// Initial wet mass (kg).
    pub m0_kg: f64,
    /// Burn duration (s).
    pub burn_s: f64,
    /// Thrust direction (need not be normalized; only its direction is used).
    pub dir: Vec3,
}

/// Outcome of integrating a [`FiniteBurn`].
#[derive(Clone, Copy, Debug, Serialize)]
pub struct FiniteBurnResult {
    /// Achieved |ΔV| (m/s) from the field-free numerical integration.
    pub dv_ms: f64,
    /// Final (dry-of-burn) mass (kg).
    pub mf_kg: f64,
    /// Closed-form Tsiolkovsky ΔV = `Isp·g₀·ln(m0/mf)` (m/s).
    pub tsiolkovsky_ms: f64,
    /// Relative error |dv − tsiolkovsky| / tsiolkovsky.
    pub rel_err: f64,
}

/// Tsiolkovsky rocket equation: ΔV = `Isp · g₀ · ln(m0 / mf)` (m/s).
pub fn tsiolkovsky(isp_s: f64, m0_kg: f64, mf_kg: f64) -> f64 {
    isp_s * G0 * (m0_kg / mf_kg).ln()
}

/// Integrate a finite burn in a field-free setting (isolating the rocket-equation check from
/// gravity losses) with `steps` RK4 sub-steps. The coupled ODE on `[v(3), m]` is
/// `v̇ = (T/m)·d̂`, `ṁ = −T/(Isp·g₀)`; the achieved |ΔV| is compared to Tsiolkovsky.
///
/// Returns an error if the burn would exhaust the mass (`mf ≤ 0`).
pub fn integrate_finite_burn(burn: &FiniteBurn, steps: usize) -> Result<FiniteBurnResult, String> {
    let mdot = burn.thrust_n / (burn.isp_s * G0);
    let mf = burn.m0_kg - mdot * burn.burn_s;
    if mf <= 0.0 {
        return Err(format!(
            "burn exhausts mass: m0={} kg, ṁ={} kg/s, burn={} s ⇒ mf={} kg",
            burn.m0_kg, mdot, burn.burn_s, mf
        ));
    }
    let d = unit(burn.dir);
    let h = burn.burn_s / steps as f64;
    // y = [vx, vy, vz, m]; field-free, so v̇ = (T/m)·d̂, ṁ = −mdot.
    let deriv = |_t: f64, y: &[f64]| -> Vec<f64> {
        let m = y[3];
        let a = burn.thrust_n / m;
        vec![a * d[0], a * d[1], a * d[2], -mdot]
    };
    let mut y = vec![0.0, 0.0, 0.0, burn.m0_kg];
    let mut t = 0.0;
    for _ in 0..steps {
        y = crate::integrator::rk4_step(&deriv, t, &y, h);
        t += h;
    }
    let dv_ms = norm([y[0], y[1], y[2]]);
    let tsiol = tsiolkovsky(burn.isp_s, burn.m0_kg, mf);
    let rel_err = (dv_ms - tsiol).abs() / tsiol;
    Ok(FiniteBurnResult {
        dv_ms,
        mf_kg: mf,
        tsiolkovsky_ms: tsiol,
        rel_err,
    })
}

// ===========================================================================
// 3. Exact universal-variable Kepler propagator (two-body truth for validation).
// ===========================================================================

/// Stumpff functions `c2(ψ)`, `c3(ψ)` (series near zero, closed form otherwise).
fn stumpff(psi: f64) -> (f64, f64) {
    if psi > 1e-6 {
        let s = psi.sqrt();
        ((1.0 - s.cos()) / psi, (s - s.sin()) / (psi * s))
    } else if psi < -1e-6 {
        let s = (-psi).sqrt();
        ((s.cosh() - 1.0) / (-psi), (s.sinh() - s) / ((-psi) * s))
    } else {
        // Series: c2 = 1/2 − ψ/24 + ψ²/720…, c3 = 1/6 − ψ/120 + ψ²/5040…
        (
            0.5 - psi / 24.0 + psi * psi / 720.0,
            1.0 / 6.0 - psi / 120.0 + psi * psi / 5040.0,
        )
    }
}

/// Propagate a two-body state `(r0, v0)` forward by `dt` under gravity parameter `mu`
/// using the universal-variable (Stumpff f/g) formulation. Exact two-body to convergence —
/// the reference truth the Lambert outputs are round-tripped against.
pub fn kepler_universal(r0: Vec3, v0: Vec3, dt: f64, mu: f64) -> (Vec3, Vec3) {
    let sqrt_mu = mu.sqrt();
    let r0n = norm(r0);
    let v0n = norm(v0);
    let rv0 = dot(r0, v0); // r0·v0 (NOT divided by |r0| — the universal-variable term needs r0·v0/√μ)
    let alpha = 2.0 / r0n - v0n * v0n / mu; // 1/a
                                            // Initial χ guess.
    let mut chi = if alpha > 1e-9 {
        sqrt_mu * dt * alpha
    } else if alpha < -1e-9 {
        let a = 1.0 / alpha;
        dt.signum()
            * (-a).sqrt()
            * ((-2.0 * mu * alpha * dt)
                / (dot(r0, v0) + dt.signum() * (-mu * a).sqrt() * (1.0 - r0n * alpha)))
                .ln()
    } else {
        sqrt_mu * dt / r0n
    };
    for _ in 0..100 {
        let psi = chi * chi * alpha;
        let (c2, c3) = stumpff(psi);
        let r = chi * chi * c2 + (rv0 / sqrt_mu) * chi * (1.0 - psi * c3) + r0n * (1.0 - psi * c2);
        let f = sqrt_mu * dt
            - chi * chi * chi * c3
            - (rv0 / sqrt_mu) * chi * chi * c2
            - r0n * chi * (1.0 - psi * c3);
        let dchi = f / r;
        chi += dchi;
        if dchi.abs() < 1e-10 {
            break;
        }
    }
    let psi = chi * chi * alpha;
    let (c2, c3) = stumpff(psi);
    let f = 1.0 - chi * chi / r0n * c2;
    let g = dt - chi * chi * chi / sqrt_mu * c3;
    let r_vec = add(scale(r0, f), scale(v0, g));
    let rn = norm(r_vec);
    let fdot = sqrt_mu / (rn * r0n) * chi * (psi * c3 - 1.0);
    let gdot = 1.0 - chi * chi / rn * c2;
    let v_vec = add(scale(r0, fdot), scale(v0, gdot));
    (r_vec, v_vec)
}

// ===========================================================================
// 4. Izzo-2015 single-revolution Lambert solver.
// ===========================================================================

/// Gauss hypergeometric `₂F₁(3, 1; 5/2; x)` by its power series (Izzo's `hyp2f1b`),
/// used for the time-of-flight series near `x = 1`.
fn hyp2f1b(x: f64) -> f64 {
    if x >= 1.0 {
        return f64::INFINITY;
    }
    let mut res = 1.0_f64;
    let mut term = 1.0_f64;
    let mut i = 0.0_f64;
    loop {
        term *= (3.0 + i) * (1.0 + i) / (2.5 + i) * x / (i + 1.0);
        let newres = res + term;
        if newres == res {
            return newres;
        }
        res = newres;
        i += 1.0;
    }
}

fn compute_y(x: f64, ll: f64) -> f64 {
    (1.0 - ll * ll * (1.0 - x * x)).sqrt()
}

fn compute_psi(x: f64, y: f64, ll: f64) -> f64 {
    if (-1.0..1.0).contains(&x) {
        // Elliptic.
        (x * y + ll * (1.0 - x * x)).acos()
    } else if x > 1.0 {
        // Hyperbolic.
        ((y - x * ll) * (x * x - 1.0).sqrt()).asinh()
    } else {
        0.0
    }
}

/// `tof(x) − T0` for the (non-dimensional) Lambert time equation, single revolution.
fn tof_equation_y(x: f64, y: f64, t0: f64, ll: f64) -> f64 {
    let tof = if (0.6_f64).sqrt() < x && x < (1.4_f64).sqrt() {
        let eta = y - ll * x;
        let s1 = 0.5 * (1.0 - ll - x * eta);
        let q = 4.0 / 3.0 * hyp2f1b(s1);
        0.5 * (eta * eta * eta * q + 4.0 * ll * eta)
    } else {
        let psi = compute_psi(x, y, ll);
        (psi / (1.0 - x * x).abs().sqrt() - x + ll * y) / (1.0 - x * x)
    };
    tof - t0
}

fn tof_eq_p(x: f64, y: f64, tof: f64, ll: f64) -> f64 {
    (3.0 * tof * x - 2.0 + 2.0 * ll * ll * ll * x / y) / (1.0 - x * x)
}
fn tof_eq_p2(x: f64, y: f64, tof: f64, dt: f64, ll: f64) -> f64 {
    (3.0 * tof + 5.0 * x * dt + 2.0 * (1.0 - ll * ll) * ll * ll * ll / (y * y * y)) / (1.0 - x * x)
}
fn tof_eq_p3(x: f64, y: f64, _tof: f64, dt: f64, ddt: f64, ll: f64) -> f64 {
    (7.0 * x * ddt + 8.0 * dt - 6.0 * (1.0 - ll * ll) * ll.powi(5) * x / y.powi(5)) / (1.0 - x * x)
}

/// Householder (cubic-order) iteration for the single-rev root `x` of `tof(x) = T`.
fn householder(x0: f64, big_t: f64, ll: f64) -> f64 {
    let mut x = x0;
    for _ in 0..35 {
        let y = compute_y(x, ll);
        let fval = tof_equation_y(x, y, big_t, ll);
        let tof = fval + big_t;
        let fp = tof_eq_p(x, y, tof, ll);
        let fpp = tof_eq_p2(x, y, tof, fp, ll);
        let fppp = tof_eq_p3(x, y, tof, fp, fpp, ll);
        let denom = fp * (fp * fp - fval * fpp) + fppp * fval * fval / 6.0;
        let dx = fval * (fp * fp - fval * fpp / 2.0) / denom;
        x -= dx;
        if dx.abs() < 1e-12 {
            break;
        }
    }
    x
}

/// Solve Lambert's problem (single revolution, `M = 0`) by Izzo's 2015 method.
///
/// Given two position vectors `r1`, `r2`, the time of flight `tof` (s), gravity parameter `mu`,
/// and a `prograde` flag (transfer with `+z` angular momentum), returns the departure and
/// arrival velocities `(v1, v2)` of the connecting two-body arc. Errors on degenerate geometry
/// (collinear `r1`, `r2` ⇒ undefined transfer plane) or non-positive time of flight.
pub fn lambert(
    r1: Vec3,
    r2: Vec3,
    tof: f64,
    mu: f64,
    prograde: bool,
) -> Result<(Vec3, Vec3), String> {
    if tof <= 0.0 {
        return Err("time of flight must be positive".into());
    }
    let r1n = norm(r1);
    let r2n = norm(r2);
    let c_vec = sub(r2, r1);
    let c = norm(c_vec);
    let s = 0.5 * (r1n + r2n + c);
    let ir1 = unit(r1);
    let ir2 = unit(r2);
    let cross12 = cross(ir1, ir2);
    let cross_n = norm(cross12);
    if cross_n < 1e-12 {
        return Err("collinear endpoints: transfer plane is undefined (≈0°/180°)".into());
    }
    let ih = scale(cross12, 1.0 / cross_n);
    let mut ll = (1.0 - (c / s).min(1.0)).sqrt();
    let (mut it1, mut it2);
    if ih[2] < 0.0 {
        ll = -ll;
        it1 = cross(ir1, ih);
        it2 = cross(ir2, ih);
    } else {
        it1 = cross(ih, ir1);
        it2 = cross(ih, ir2);
    }
    if !prograde {
        ll = -ll;
        it1 = scale(it1, -1.0);
        it2 = scale(it2, -1.0);
    }
    it1 = unit(it1);
    it2 = unit(it2);

    let big_t = (2.0 * mu / (s * s * s)).sqrt() * tof;

    // Single-revolution initial guess (Izzo `_initial_guess`, M = 0 branch).
    let t0 = ll.acos() + ll * (1.0 - ll * ll).sqrt(); // T(x = 0)
    let t1 = 2.0 / 3.0 * (1.0 - ll * ll * ll); // T(x = 1), parabola
    let x0 = if big_t >= t0 {
        (t0 / big_t).powf(2.0 / 3.0) - 1.0
    } else if big_t < t1 {
        2.5 * t1 / big_t * (t1 - big_t) / (1.0 - ll.powi(5)) + 1.0
    } else {
        (t0 / big_t).powf((t1 / t0).log2()) - 1.0
    };
    let x = householder(x0, big_t, ll);
    let y = compute_y(x, ll);

    let gamma = (mu * s / 2.0).sqrt();
    let rho = (r1n - r2n) / c;
    let sigma = (1.0 - rho * rho).sqrt();
    let vr1 = gamma * ((ll * y - x) - rho * (ll * y + x)) / r1n;
    let vr2 = -gamma * ((ll * y - x) + rho * (ll * y + x)) / r2n;
    let vt1 = gamma * sigma * (y + ll * x) / r1n;
    let vt2 = gamma * sigma * (y + ll * x) / r2n;
    let v1 = add(scale(ir1, vr1), scale(it1, vt1));
    let v2 = add(scale(ir2, vr2), scale(it2, vt2));
    Ok((v1, v2))
}

// ===========================================================================
// 5. Porkchop sweep over a synthetic coplanar-circular heliocentric system.
// ===========================================================================

/// A body on a coplanar circular heliocentric orbit (synthetic, so the transfer optimum is
/// analytic). `phase0_rad` is its true longitude at epoch `t = 0`.
#[derive(Clone, Copy, Debug)]
pub struct CircularCoplanarBody {
    /// Orbit radius (m).
    pub radius_m: f64,
    /// True longitude at `t = 0` (rad).
    pub phase0_rad: f64,
    /// Central gravity parameter (m³/s²).
    pub mu_central: f64,
}

impl CircularCoplanarBody {
    /// Mean angular rate `n = √(μ/r³)` (rad/s).
    pub fn angular_rate(&self) -> f64 {
        (self.mu_central / self.radius_m.powi(3)).sqrt()
    }
    /// Heliocentric position (m) at time `t` (s).
    pub fn position(&self, t: f64) -> Vec3 {
        let th = self.phase0_rad + self.angular_rate() * t;
        [self.radius_m * th.cos(), self.radius_m * th.sin(), 0.0]
    }
    /// Heliocentric velocity (m/s) at time `t` (s).
    pub fn velocity(&self, t: f64) -> Vec3 {
        let n = self.angular_rate();
        let th = self.phase0_rad + n * t;
        let speed = self.radius_m * n;
        [-speed * th.sin(), speed * th.cos(), 0.0]
    }
}

/// A porkchop grid: departure C3 (km²/s²) and arrival V∞ (km/s) over launch × arrival epochs.
/// Degenerate cells (non-positive TOF or near-collinear ≈0°/180° geometry) are stored as NaN.
#[derive(Clone, Debug, Serialize)]
pub struct PorkchopGrid {
    /// Departure epochs (s).
    pub dep_epochs_s: Vec<f64>,
    /// Arrival epochs (s).
    pub arr_epochs_s: Vec<f64>,
    /// `c3_km2s2[i][j]` = departure C3 for `dep_epochs_s[i]` → `arr_epochs_s[j]`.
    pub c3_km2s2: Vec<Vec<f64>>,
    /// `vinf_arr_kms[i][j]` = arrival hyperbolic-excess speed for the same cell.
    pub vinf_arr_kms: Vec<Vec<f64>>,
}

impl PorkchopGrid {
    /// Serialize the grid (epoch axes + the two 2-D arrays) for browser contour rendering.
    pub fn to_json(&self) -> String {
        serde_json::to_string_pretty(self).expect("PorkchopGrid serializes")
    }
    /// The minimum finite C3 over the grid and its `(dep_index, arr_index)`.
    pub fn min_c3(&self) -> Option<(f64, usize, usize)> {
        let mut best: Option<(f64, usize, usize)> = None;
        for (i, row) in self.c3_km2s2.iter().enumerate() {
            for (j, &c3) in row.iter().enumerate() {
                let better = match best {
                    None => true,
                    Some((b, _, _)) => c3 < b,
                };
                if c3.is_finite() && better {
                    best = Some((c3, i, j));
                }
            }
        }
        best
    }
}

/// Sweep a launch-epoch × arrival-epoch grid, solving Lambert for each cell and recording the
/// departure C3 (km²/s²) and arrival V∞ (km/s). Cells within `0.5°` of a 0°/180° transfer (or
/// with TOF ≤ 0) are marked NaN — the transfer plane is ill-conditioned there.
pub fn porkchop(
    dep: &CircularCoplanarBody,
    arr: &CircularCoplanarBody,
    dep_epochs_s: &[f64],
    arr_epochs_s: &[f64],
    mu_helio: f64,
) -> PorkchopGrid {
    let collinear_guard = (0.5_f64).to_radians();
    let mut c3 = vec![vec![f64::NAN; arr_epochs_s.len()]; dep_epochs_s.len()];
    let mut vinf = vec![vec![f64::NAN; arr_epochs_s.len()]; dep_epochs_s.len()];
    for (i, &td) in dep_epochs_s.iter().enumerate() {
        for (j, &ta) in arr_epochs_s.iter().enumerate() {
            let tof = ta - td;
            if tof <= 0.0 {
                continue;
            }
            let r1 = dep.position(td);
            let r2 = arr.position(ta);
            // Skip near-collinear geometry.
            let cosang = (dot(r1, r2) / (norm(r1) * norm(r2))).clamp(-1.0, 1.0);
            let ang = cosang.acos();
            if ang < collinear_guard || (PI - ang) < collinear_guard {
                continue;
            }
            if let Ok((v1, v2)) = lambert(r1, r2, tof, mu_helio, true) {
                let vinf_dep = sub(v1, dep.velocity(td));
                let vinf_arr = sub(v2, arr.velocity(ta));
                c3[i][j] = dot(vinf_dep, vinf_dep) / 1.0e6; // m²/s² → km²/s²
                vinf[i][j] = norm(vinf_arr) / 1000.0; // m/s → km/s
            }
        }
    }
    PorkchopGrid {
        dep_epochs_s: dep_epochs_s.to_vec(),
        arr_epochs_s: arr_epochs_s.to_vec(),
        c3_km2s2: c3,
        vinf_arr_kms: vinf,
    }
}

/// Closed-form departure C3 (m²/s²) of the Hohmann transfer between two coplanar circular
/// orbits `r1 → r2` about `mu`: `C3 = (v_transfer,peri − v_circ,1)²`. This is the global
/// minimum-energy departure for circular-to-circular transfer — the porkchop floor.
pub fn hohmann_departure_c3(r1: f64, r2: f64, mu: f64) -> f64 {
    let a_t = 0.5 * (r1 + r2);
    let v_circ1 = (mu / r1).sqrt();
    let v_peri = (mu * (2.0 / r1 - 1.0 / a_t)).sqrt();
    let vinf = v_peri - v_circ1;
    vinf * vinf
}

/// Time of flight (s) of the Hohmann transfer `r1 → r2` about `mu`: half the transfer-ellipse
/// period, `π·√(a_t³/μ)` with `a_t = (r1+r2)/2`.
pub fn hohmann_tof(r1: f64, r2: f64, mu: f64) -> f64 {
    let a_t = 0.5 * (r1 + r2);
    PI * (a_t * a_t * a_t / mu).sqrt()
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::f64::consts::PI;

    fn approx(a: f64, b: f64, tol: f64) {
        assert!((a - b).abs() <= tol, "expected {a} ≈ {b} (tol {tol})");
    }

    // ----- 1. Impulsive maneuver + covariance -----

    #[test]
    fn impulsive_eci_dv_jumps_velocity_and_adds_only_velocity_covariance() {
        let state = [7.0e6, 0.0, 0.0, 0.0, 7.5e3, 0.0];
        let mut cov = [[0.0f64; 6]; 6];
        for (i, row) in cov.iter_mut().enumerate() {
            row[i] = (i as f64 + 1.0) * 10.0; // distinct diagonal
        }
        let man = ImpulsiveManeuver {
            dv: [10.0, -5.0, 2.0],
            frame: ManeuverFrame::Eci,
            exec_cov: [[0.04, 0.0, 0.0], [0.0, 0.09, 0.0], [0.0, 0.0, 0.01]],
        };
        let (out, p) = apply_impulse(state, cov, &man);
        // Position unchanged, velocity jumps by ΔV exactly.
        approx(out[0], 7.0e6, 0.0);
        approx(out[3], 10.0, 1e-12);
        approx(out[4], 7.5e3 - 5.0, 1e-9);
        approx(out[5], 2.0, 1e-12);
        // Position block of P unchanged; velocity block gains exactly exec_cov.
        for i in 0..3 {
            for j in 0..3 {
                approx(p[i][j], cov[i][j], 1e-12);
            }
        }
        approx(p[3][3], cov[3][3] + 0.04, 1e-12);
        approx(p[4][4], cov[4][4] + 0.09, 1e-12);
        approx(p[5][5], cov[5][5] + 0.01, 1e-12);
    }

    #[test]
    fn lvlh_execution_covariance_is_rotated_trace_preserving_and_symmetric() {
        // A non-trivial inclined state so the LVLH frame is genuinely rotated.
        let state = [7.0e6, 1.0e6, 5.0e5, 1.0e3, 7.2e3, 1.5e3];
        let cov = [[0.0f64; 6]; 6];
        let (a, b, c) = (0.05, 0.20, 0.02);
        let man = ImpulsiveManeuver {
            dv: [3.0, 0.0, 0.0],
            frame: ManeuverFrame::Lvlh,
            exec_cov: [[a, 0.0, 0.0], [0.0, b, 0.0], [0.0, 0.0, c]],
        };
        let (_out, p) = apply_impulse(state, cov, &man);
        // Rotation preserves the trace of the covariance added to the velocity block.
        let tr = p[3][3] + p[4][4] + p[5][5];
        approx(tr, a + b + c, 1e-12);
        // The added velocity-block covariance is symmetric.
        approx(p[3][4], p[4][3], 1e-15);
        approx(p[3][5], p[5][3], 1e-15);
        approx(p[4][5], p[5][4], 1e-15);
        // And the LVLH→ECI columns are orthonormal.
        let r = [state[0], state[1], state[2]];
        let v = [state[3], state[4], state[5]];
        let m = lvlh_to_eci(r, v);
        for col in &m {
            approx(norm(*col), 1.0, 1e-12);
        }
        approx(dot(m[0], m[1]), 0.0, 1e-12);
        approx(dot(m[0], m[2]), 0.0, 1e-12);
        approx(dot(m[1], m[2]), 0.0, 1e-12);
    }

    // ----- 2. Finite burn vs Tsiolkovsky -----

    #[test]
    fn finite_burn_matches_tsiolkovsky_to_better_than_a_hundredth_percent() {
        // Hand check: ṁ = 500/(300·9.80665) = 0.169970 kg/s; mf = 1000 − 16.9970 = 983.003 kg;
        // Δv = 300·9.80665·ln(1000/983.003) = 2941.995·0.0171419 ≈ 50.43 m/s.
        let burn = FiniteBurn {
            thrust_n: 500.0,
            isp_s: 300.0,
            m0_kg: 1000.0,
            burn_s: 100.0,
            dir: [0.0, 1.0, 0.0],
        };
        let res = integrate_finite_burn(&burn, 2000).unwrap();
        let mdot = 500.0 / (300.0 * G0);
        approx(res.mf_kg, 1000.0 - mdot * 100.0, 1e-9);
        approx(
            res.tsiolkovsky_ms,
            tsiolkovsky(300.0, 1000.0, res.mf_kg),
            0.0,
        );
        // Closed-form sanity on the magnitude itself.
        approx(res.tsiolkovsky_ms, 50.43, 0.05);
        // RK4 of v̇ = T/m reproduces the exact rocket equation to well under 0.01 %.
        assert!(
            res.rel_err < 1e-4,
            "finite-burn ΔV rel err {} ≥ 1e-4",
            res.rel_err
        );
    }

    #[test]
    fn finite_burn_errors_when_mass_is_exhausted() {
        let burn = FiniteBurn {
            thrust_n: 5000.0,
            isp_s: 200.0,
            m0_kg: 100.0,
            burn_s: 100.0,
            dir: [1.0, 0.0, 0.0],
        };
        assert!(integrate_finite_burn(&burn, 100).is_err());
    }

    // ----- 3. Kepler propagator self-check -----

    #[test]
    fn kepler_universal_round_trips_forward_then_back() {
        let r0 = [7.0e6, 0.0, 0.0];
        let v0 = [0.0, 8.0e3, 1.0e3];
        let mu = crate::orbit::MU_EARTH;
        let (r1, v1) = kepler_universal(r0, v0, 2000.0, mu);
        let (r2, v2) = kepler_universal(r1, v1, -2000.0, mu);
        approx(norm(sub(r2, r0)), 0.0, 1e-3);
        approx(norm(sub(v2, v0)), 0.0, 1e-6);
    }

    // ----- 4. Lambert: round-trip against exact two-body truth -----

    #[test]
    fn lambert_recovers_the_velocities_of_a_known_two_body_arc() {
        let mu = crate::orbit::MU_EARTH;
        let r1 = [7.0e6, 0.0, 0.0];
        let v1_true = [0.0, 8.0e3, 1.0e3]; // h = r×v has +z ⇒ prograde
        let tof = 2000.0;
        // Exact two-body truth: where does this arc end, and at what velocity?
        let (r2, v2_true) = kepler_universal(r1, v1_true, tof, mu);
        // Lambert must reconstruct both boundary velocities.
        let (v1, v2) = lambert(r1, r2, tof, mu, true).unwrap();
        approx(norm(sub(v1, v1_true)), 0.0, 1e-3);
        approx(norm(sub(v2, v2_true)), 0.0, 1e-3);
    }

    #[test]
    fn lambert_output_propagates_back_onto_r2() {
        // Independent of the orbit fixture: any Lambert solution, when propagated, must hit r2.
        let mu = MU_SUN;
        let r1 = [1.0 * AU_M, 0.2 * AU_M, 0.0];
        let r2 = [-0.3 * AU_M, 1.3 * AU_M, 0.05 * AU_M];
        let tof = 200.0 * 86400.0;
        let (v1, v2) = lambert(r1, r2, tof, mu, true).unwrap();
        let (r_end, v_end) = kepler_universal(r1, v1, tof, mu);
        approx(norm(sub(r_end, r2)), 0.0, 1.0e3); // < 1 km on a ~1.5e11 m arc
        approx(norm(sub(v_end, v2)), 0.0, 1e-3);
    }

    #[test]
    fn lambert_rejects_collinear_endpoints() {
        let mu = crate::orbit::MU_EARTH;
        let r1 = [7.0e6, 0.0, 0.0];
        let r2 = [-9.0e6, 0.0, 0.0]; // exactly 180°, plane undefined
        assert!(lambert(r1, r2, 3000.0, mu, true).is_err());
    }

    // ----- 5. Porkchop: round-trip consistency + Hohmann floor -----

    #[test]
    fn porkchop_cells_are_round_trip_consistent_and_min_is_near_the_hohmann_floor() {
        // Synthetic coplanar-circular heliocentric system: 1.0 AU → 1.524 AU.
        let r1 = AU_M;
        let r2 = 1.524 * AU_M;
        let tof_h = hohmann_tof(r1, r2, MU_SUN);
        let dep = CircularCoplanarBody {
            radius_m: r1,
            phase0_rad: 0.0,
            mu_central: MU_SUN,
        };
        // Place the target so a 0 → tof_h transfer sweeps ~180° (the Hohmann geometry),
        // but we never sample exactly there (the guard / grid offsets keep us off the singularity).
        let n2 = (MU_SUN / r2.powi(3)).sqrt();
        let arr = CircularCoplanarBody {
            radius_m: r2,
            phase0_rad: PI - n2 * tof_h,
            mu_central: MU_SUN,
        };
        let day = 86400.0;
        let dep_epochs: Vec<f64> = (-20..=20).map(|k| k as f64 * 5.0 * day).collect();
        let arr_epochs: Vec<f64> = (0..=40)
            .map(|k| tof_h - 100.0 * day + k as f64 * 5.0 * day)
            .collect();
        let grid = porkchop(&dep, &arr, &dep_epochs, &arr_epochs, MU_SUN);

        // Every finite cell's departure velocity must propagate two-body back onto r2.
        let mut finite_cells = 0;
        for (i, &td) in dep_epochs.iter().enumerate() {
            for (j, &ta) in arr_epochs.iter().enumerate() {
                if grid.c3_km2s2[i][j].is_finite() {
                    finite_cells += 1;
                    let tof = ta - td;
                    let rr1 = dep.position(td);
                    let rr2 = arr.position(ta);
                    let (v1, _) = lambert(rr1, rr2, tof, MU_SUN, true).unwrap();
                    let (r_end, _) = kepler_universal(rr1, v1, tof, MU_SUN);
                    assert!(
                        norm(sub(r_end, rr2)) < 5.0e3,
                        "cell ({i},{j}) round-trip miss {} m",
                        norm(sub(r_end, rr2))
                    );
                }
            }
        }
        assert!(finite_cells > 100, "too few finite cells: {finite_cells}");

        // The closed-form Hohmann departure C3 is the theoretical floor.
        let c3_floor = hohmann_departure_c3(r1, r2, MU_SUN) / 1.0e6; // km²/s²
        let (min_c3, mi, mj) = grid.min_c3().unwrap();
        // Floor property: no cell beats Hohmann (small numerical slack).
        assert!(
            min_c3 >= c3_floor - 1e-6,
            "grid min C3 {min_c3} below Hohmann floor {c3_floor}"
        );
        // The finite grid samples near (but not at) 180°, so the minimum is just above the floor.
        assert!(
            min_c3 < c3_floor * 1.05,
            "grid min C3 {min_c3} not within 5% of Hohmann floor {c3_floor}"
        );
        // The minimizing cell's TOF is near the Hohmann TOF.
        let tof_min = arr_epochs[mj] - dep_epochs[mi];
        approx(tof_min, tof_h, 60.0 * day);
    }

    #[test]
    fn porkchop_json_round_trips_with_matching_dimensions() {
        let dep = CircularCoplanarBody {
            radius_m: AU_M,
            phase0_rad: 0.0,
            mu_central: MU_SUN,
        };
        let arr = CircularCoplanarBody {
            radius_m: 1.524 * AU_M,
            phase0_rad: 1.0,
            mu_central: MU_SUN,
        };
        let day = 86400.0;
        let dep_epochs: Vec<f64> = (0..5).map(|k| k as f64 * 10.0 * day).collect();
        let arr_epochs: Vec<f64> = (0..6).map(|k| (200 + k * 10) as f64 * day).collect();
        let grid = porkchop(&dep, &arr, &dep_epochs, &arr_epochs, MU_SUN);
        let json = grid.to_json();
        let parsed: serde_json::Value = serde_json::from_str(&json).unwrap();
        assert_eq!(parsed["dep_epochs_s"].as_array().unwrap().len(), 5);
        assert_eq!(parsed["arr_epochs_s"].as_array().unwrap().len(), 6);
        assert_eq!(parsed["c3_km2s2"].as_array().unwrap().len(), 5);
        assert_eq!(parsed["c3_km2s2"][0].as_array().unwrap().len(), 6);
        assert_eq!(parsed["vinf_arr_kms"].as_array().unwrap().len(), 5);
    }
}
