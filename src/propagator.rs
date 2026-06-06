// SPDX-License-Identifier: Apache-2.0
//! Numerical orbit propagator: a configurable force model integrated by the adaptive
//! Runge–Kutta driver, the first **non-analytic** propagator in Kshana (the rest of the
//! orbit stack is the analytic SGP4/SDP4 of [`crate::sgp4`]).
//!
//! It wires the orbital force model of [`crate::forces`] (two-body `−μr/|r|³` plus the J2
//! oblateness perturbation) into the step-doubling integrator of [`crate::integrator`],
//! turning `f(t, [r; v]) = [v; a(r)]` into a state propagator. Its correctness is pinned
//! **against analytic truth that is stronger than a numerical cross-tool would be**:
//!
//! * the unperturbed two-body propagation must reproduce the **exact** universal-variable
//!   Kepler solution ([`crate::maneuver::kepler_universal`]) to sub-metre over a 24-hour LEO
//!   orbit — for the two-body problem the closed form *is* the truth, so this is a tighter
//!   gate than the "vs a numerical reference < 10 m" the milestone phrases it as;
//! * specific energy and angular momentum are conserved over the same arc;
//! * the J2-perturbed nodal regression reproduces the closed-form secular rate
//!   [`crate::forces::j2_secular_rates`] to first-order theory accuracy.
//!
//! It also exposes [`solve_kepler_checked`], a Newton solver for Kepler's equation that
//! **returns `Err` instead of a wrong answer** when it fails to converge within a bounded
//! iteration count (e.g. the near-perigee high-eccentricity `e = 0.999` case).
//!
//! ## Scope (honest)
//!
//! The force model is **two-body + J2** only. The full high-degree EGM tesseral field (a
//! 200×200 gravity model and its coefficient loader), atmospheric drag (an NRLMSISE-00
//! density model), solar-radiation pressure, and third-body (Sun/Moon) accelerations — and
//! the cross-validation of a 200×200 EGM 24-hour orbit against an external high-precision
//! propagator (GMAT/Orekit) — remain follow-ons (see `ROADMAP.md`). What is delivered is the
//! integrator + two-body/J2 force model + the analytic-truth validation harness and the
//! convergence-guarded Kepler solver.

use crate::forces::{gravity_accel, two_body_accel, zonal_accel, EARTH_ZONALS_J2_J6, MU_EARTH};
use crate::integrator::{integrate, rk4_step, Tolerance};

type Vec3 = [f64; 3];

fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn norm(a: Vec3) -> f64 {
    dot(a, a).sqrt()
}

/// Which perturbations the propagated force model includes on top of two-body gravity.
#[derive(Clone, Copy, Debug, Default)]
pub struct ForceModel {
    /// Include the J2 oblateness perturbation.
    pub j2: bool,
    /// Optional zonal-harmonic field (`[J2, J3, …]` from degree 2) integrated via
    /// [`crate::forces::zonal_accel`]. When `Some`, it supersedes the `j2`-only path and the
    /// full supplied zonal set is used on top of two-body gravity.
    pub zonals: Option<&'static [f64]>,
}

impl ForceModel {
    /// Point-mass (two-body) gravity only.
    pub fn two_body() -> Self {
        Self {
            j2: false,
            zonals: None,
        }
    }

    /// Two-body plus the J2 oblateness perturbation.
    pub fn with_j2() -> Self {
        Self {
            j2: true,
            zonals: None,
        }
    }

    /// Two-body plus the full Earth zonal field through degree 6 (`J2..J6`).
    pub fn with_zonals_j2_j6() -> Self {
        Self {
            j2: true,
            zonals: Some(&EARTH_ZONALS_J2_J6),
        }
    }

    /// Acceleration (m/s²) under this model at ECI position `r` (m).
    pub fn accel(&self, r: Vec3) -> Vec3 {
        if let Some(jn) = self.zonals {
            let tb = two_body_accel(r);
            let zo = zonal_accel(r, jn);
            [tb[0] + zo[0], tb[1] + zo[1], tb[2] + zo[2]]
        } else if self.j2 {
            gravity_accel(r)
        } else {
            two_body_accel(r)
        }
    }

    /// The first-order ODE right-hand side `f(t, [r; v]) = [v; a(r)]` for the integrator.
    fn rhs(&self) -> impl Fn(f64, &[f64]) -> Vec<f64> + '_ {
        move |_t: f64, y: &[f64]| {
            let a = self.accel([y[0], y[1], y[2]]);
            vec![y[3], y[4], y[5], a[0], a[1], a[2]]
        }
    }
}

/// Numerically propagate the ECI state `(r0, v0)` (m, m/s) forward by `t_end` seconds under
/// `model`, with adaptive step-doubling error control to `tol`. Returns the final `(r, v)`.
pub fn propagate(
    r0: Vec3,
    v0: Vec3,
    t_end: f64,
    model: ForceModel,
    tol: &Tolerance,
) -> (Vec3, Vec3) {
    let f = model.rhs();
    let y0 = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    // Initial step: a small fraction of the orbital period is a safe, well-scaled guess.
    let h0 = (t_end / 1000.0).max(1.0).min(t_end.max(1e-3));
    let sol = integrate(&f, 0.0, &y0, t_end, h0, tol);
    (
        [sol.y[0], sol.y[1], sol.y[2]],
        [sol.y[3], sol.y[4], sol.y[5]],
    )
}

/// Right ascension of the ascending node `Ω` (rad) of the osculating orbit for state
/// `(r, v)`: the in-plane angle of the node vector `n = ẑ × (r × v)`.
pub fn raan_rad(r: Vec3, v: Vec3) -> f64 {
    let h = cross(r, v);
    // n = ẑ × h = (−h_y, h_x, 0).
    let n = [-h[1], h[0], 0.0];
    n[1].atan2(n[0])
}

/// Two-body specific orbital energy `ε = v²/2 − μ/|r|` (J/kg). Conserved exactly under pure
/// two-body gravity (the integrator's drift check). Under a perturbing potential (J2 or the
/// zonal field) the *total* energy `ε − R(r)` including the disturbing potential
/// [`crate::forces::zonal_potential`] is the conserved quantity, not this bare two-body `ε`.
pub fn specific_energy(r: Vec3, v: Vec3) -> f64 {
    0.5 * dot(v, v) - MU_EARTH / norm(r)
}

/// Trace the orbit at a fixed RK4 step `h` (s) for `t_end` s, returning `(t, Ω(t))` samples.
/// A fixed step (rather than the adaptive driver, which only returns the final state) gives a
/// uniform time series for fitting the secular nodal rate. Small `h` keeps the truncation
/// error far below the secular signal being measured.
pub fn nodal_history(r0: Vec3, v0: Vec3, t_end: f64, h: f64, model: ForceModel) -> Vec<(f64, f64)> {
    let f = model.rhs();
    let mut y = vec![r0[0], r0[1], r0[2], v0[0], v0[1], v0[2]];
    let mut t = 0.0;
    let mut out = vec![(0.0, raan_rad(r0, v0))];
    while t < t_end - 1e-9 {
        y = rk4_step(&f, t, &y, h);
        t += h;
        out.push((t, raan_rad([y[0], y[1], y[2]], [y[3], y[4], y[5]])));
    }
    out
}

/// Least-squares slope of an unwrapped angle time series `(t, θ)` (rad/s) — the secular rate
/// with the periodic (short-period) oscillation averaged out. The angle is unwrapped to
/// remove ±2π jumps before fitting.
pub fn secular_slope(samples: &[(f64, f64)]) -> f64 {
    // Unwrap.
    let mut theta = Vec::with_capacity(samples.len());
    let mut prev = samples[0].1;
    let mut offset = 0.0;
    for &(_, th) in samples {
        let mut d = th - prev;
        while d > std::f64::consts::PI {
            d -= std::f64::consts::TAU;
        }
        while d < -std::f64::consts::PI {
            d += std::f64::consts::TAU;
        }
        offset += d;
        theta.push(samples[0].1 + offset);
        prev = th;
    }
    // Ordinary least-squares slope.
    let n = samples.len() as f64;
    let mean_t = samples.iter().map(|&(t, _)| t).sum::<f64>() / n;
    let mean_y = theta.iter().sum::<f64>() / n;
    let mut num = 0.0;
    let mut den = 0.0;
    for (i, &(t, _)) in samples.iter().enumerate() {
        num += (t - mean_t) * (theta[i] - mean_y);
        den += (t - mean_t) * (t - mean_t);
    }
    num / den
}

/// Non-convergence of [`solve_kepler_checked`]: the residual still exceeded the tolerance
/// after the iteration budget was spent.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct KeplerNonConvergence {
    /// `|E − e·sin E − M|` at the last iterate.
    pub residual: f64,
    /// Iterations spent.
    pub iters: usize,
}

/// Solve Kepler's equation `M = E − e·sin E` for the eccentric anomaly `E` (rad) by
/// Newton–Raphson from the `E₀ = M` start, **returning `Err` rather than a wrong answer**
/// when it does not converge within `max_iter`. The bare `E₀ = M` start is deliberately
/// simple so the guard is meaningful: a near-perigee high-eccentricity case (`e = 0.999`)
/// where `f'(E) = 1 − e·cos E` collapses toward zero overshoots and fails to converge in a
/// bounded budget — exactly the case a silent fixed-iteration solver would return garbage
/// for. (A robust universal starter such as Markley's is a follow-on; this routine's job is
/// the convergence *guard*.)
pub fn solve_kepler_checked(
    mean_anomaly: f64,
    e: f64,
    max_iter: usize,
) -> Result<f64, KeplerNonConvergence> {
    const TOL: f64 = 1e-12;
    if e == 0.0 {
        return Ok(mean_anomaly);
    }
    let mut ea = mean_anomaly;
    for _ in 0..max_iter {
        let residual = ea - e * ea.sin() - mean_anomaly;
        if residual.abs() < TOL {
            return Ok(ea);
        }
        let deriv = 1.0 - e * ea.cos();
        ea -= residual / deriv;
    }
    let final_residual = (ea - e * ea.sin() - mean_anomaly).abs();
    if final_residual < TOL {
        Ok(ea)
    } else {
        Err(KeplerNonConvergence {
            residual: final_residual,
            iters: max_iter,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::j2_secular_rates;
    use crate::maneuver::kepler_universal;

    /// A representative LEO circular-ish state at a = 7000 km, i = 45°.
    fn leo_state() -> (Vec3, Vec3) {
        let a = 7.0e6;
        let v = (MU_EARTH / a).sqrt(); // circular speed
        let inc = 45.0_f64.to_radians();
        // r along +x; v in the orbit plane inclined 45° about x.
        let r0 = [a, 0.0, 0.0];
        let v0 = [0.0, v * inc.cos(), v * inc.sin()];
        (r0, v0)
    }

    #[test]
    fn two_body_propagation_matches_the_exact_kepler_solution_over_24h() {
        // The unperturbed numerical orbit must land on the exact universal-variable Kepler
        // solution — for two-body that closed form IS the truth, a tighter gate than a
        // numerical reference.
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let (r_num, _v_num) = propagate(r0, v0, day, ForceModel::two_body(), &tol);
        let (r_exact, _v_exact) = kepler_universal(r0, v0, day, MU_EARTH);
        let err = norm([
            r_num[0] - r_exact[0],
            r_num[1] - r_exact[1],
            r_num[2] - r_exact[2],
        ]);
        assert!(err < 10.0, "24h two-body residual {err} m vs exact Kepler");
        // In fact it is far below the 10 m the milestone asks for.
        assert!(err < 1.0, "should be sub-metre: {err} m");
    }

    #[test]
    fn two_body_conserves_energy_and_angular_momentum() {
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let e0 = specific_energy(r0, v0);
        let h0 = norm(cross(r0, v0));
        let (r1, v1) = propagate(r0, v0, day, ForceModel::two_body(), &tol);
        let e1 = specific_energy(r1, v1);
        let h1 = norm(cross(r1, v1));
        assert!(
            (e1 - e0).abs() / e0.abs() < 1e-9,
            "energy drift {}",
            e1 - e0
        );
        assert!(
            (h1 - h0).abs() / h0 < 1e-9,
            "ang-momentum drift {}",
            h1 - h0
        );
    }

    #[test]
    fn j2_nodal_regression_reproduces_the_secular_formula() {
        // Propagate a J2-perturbed ISS-like orbit for a day and fit the secular RAAN rate;
        // it must agree with the closed-form first-order j2_secular_rates. The agreement is
        // to first-order theory (the residual is the O(J2²) higher-order secular term, ~0.1%),
        // not to machine precision — so this is a physics check, validated within 2%.
        let a = 6.778e6; // ~400 km altitude
        let inc = 51.6_f64.to_radians();
        let v = (MU_EARTH / a).sqrt();
        let r0 = [a, 0.0, 0.0];
        let v0 = [0.0, v * inc.cos(), v * inc.sin()];

        let day = 86_400.0;
        let hist = nodal_history(r0, v0, day, 10.0, ForceModel::with_j2());
        let rate_num = secular_slope(&hist);
        let rate_formula = j2_secular_rates(a, 0.0, inc).raan;

        // Both are the westward nodal regression (negative for a prograde orbit).
        assert!(rate_num < 0.0 && rate_formula < 0.0);
        let rel = (rate_num - rate_formula).abs() / rate_formula.abs();
        assert!(
            rel < 0.02,
            "numerical Ω̇ {rate_num} vs formula {rate_formula} (rel {rel})"
        );
        // Sanity: the day's nodal drift is the textbook ~ −5°/day for the ISS.
        let deg_per_day = rate_formula.to_degrees() * day;
        assert!((deg_per_day + 5.0).abs() < 0.6, "Ω̇ {deg_per_day} °/day");
    }

    #[test]
    fn solve_kepler_converges_on_a_well_conditioned_case() {
        // Moderate eccentricity converges and satisfies the equation.
        let m = 1.0;
        let e = 0.3;
        let ea = solve_kepler_checked(m, e, 30).expect("should converge");
        assert!((ea - e * ea.sin() - m).abs() < 1e-12);
        // Circular is exact in one shot.
        assert_eq!(solve_kepler_checked(0.7, 0.0, 30), Ok(0.7));
    }

    #[test]
    fn solve_kepler_returns_err_on_nonconvergence_at_high_eccentricity() {
        // At e = 0.999 the Newton step from the bare E₀ = M start overshoots wildly for M
        // near perigee; M = 0.3 rad diverges and does not converge within 30 iterations, so
        // the solver returns Err rather than a silently wrong eccentric anomaly. (Most other
        // M values do converge — see the well-conditioned test — so this is a real guard, not
        // a broken solver.)
        let result = solve_kepler_checked(0.3, 0.999, 30);
        assert!(
            result.is_err(),
            "expected non-convergence Err, got {result:?}"
        );
        if let Err(nc) = result {
            assert_eq!(nc.iters, 30);
            assert!(nc.residual > 1e-12);
        }
    }

    #[test]
    fn zonal_j2_j6_orbit_conserves_energy_and_perturbs_the_j2_orbit() {
        // The full J2..J6 zonal field is conservative and time-independent, so the TOTAL
        // energy — kinetic plus the central and zonal potential, v²/2 − μ/r − R(r) — is
        // conserved over a day (the bare two-body ε = v²/2 − μ/r is NOT, since the
        // perturbation does work on it). And the J3..J6 terms must actually move the
        // trajectory away from the J2-only orbit (regression against a silently-J2-only force
        // model) while staying a small correction (not a blow-up).
        use crate::forces::zonal_potential;
        let total =
            |r: Vec3, v: Vec3| specific_energy(r, v) - zonal_potential(r, &EARTH_ZONALS_J2_J6);
        let (r0, v0) = leo_state();
        let day = 86_400.0;
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            ..Tolerance::default()
        };
        let e0 = total(r0, v0);
        let (r_day, v_day) = propagate(r0, v0, day, ForceModel::with_zonals_j2_j6(), &tol);
        let e1 = total(r_day, v_day);
        assert!(
            (e1 - e0).abs() / e0.abs() < 1e-8,
            "zonal field is conservative; total-energy drift {}",
            e1 - e0
        );

        // Over one orbital period the J2..J6 orbit must differ from the J2-only orbit.
        let period = 5400.0;
        let (r_zon, _) = propagate(r0, v0, period, ForceModel::with_zonals_j2_j6(), &tol);
        let (r_j2, _) = propagate(r0, v0, period, ForceModel::with_j2(), &tol);
        let sep = norm([r_zon[0] - r_j2[0], r_zon[1] - r_j2[1], r_zon[2] - r_j2[2]]);
        assert!(
            sep > 1e-3,
            "J3..J6 must perturb the orbit, separation {sep} m"
        );
        assert!(
            sep < 5.0e4,
            "J3..J6 must stay a small correction, separation {sep} m"
        );
    }
}
