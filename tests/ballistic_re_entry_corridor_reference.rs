// SPDX-License-Identifier: AGPL-3.0-only
//! Cross-check the Allen-Eggers ballistic re-entry corridor closed forms against
//! an **independent numerical integration** of the same governing ODE by
//! scipy 1.18.0 (`scipy.integrate.solve_ivp`, DOP853 adaptive Runge-Kutta, with
//! a `scipy.optimize.minimize_scalar` Brent peak-finder; BSD-3-Clause, SciPy
//! developers).
//!
//! scipy numerically integrates the planar drag-only constant-flight-path-angle
//! entry ODE
//!
//! ```text
//! dV/dt = -rho(h) V^2 / (2 B),   dh/dt = -V sin(gamma),   rho = rho0 e^(-h/H)
//! ```
//!
//! and reports the peak deceleration, the velocity at that peak, and the altitude
//! at that peak. kshana's `reentry::peak_deceleration`,
//! `velocity_at_peak_deceleration` and `altitude_at_peak_deceleration` are the
//! Allen-Eggers (1958) closed-form solutions of that exact ODE. Feeding both the
//! byte-identical grid (V_e {6000,7800,11000} m/s, gamma {3,6,9,30} deg,
//! B {50,100,400} kg/m^2; Earth rho0=1.225 kg/m^3, H=7200 m) lets a wholly
//! separate numerical method confirm the analytic forms solve their ODE.
//!
//! HONEST SCOPE (what this does and does NOT validate)
//! ---------------------------------------------------
//! This is an INTERNAL-CONSISTENCY check: scipy integrates the *same* constant-
//! gamma, gravity-neglected, exponential-isothermal model that Allen-Eggers
//! approximates analytically. It is a numeric-integral-vs-own-analytic-form
//! agreement, NOT an external dataset and NOT an independent physical model of a
//! real re-entry. It confirms the kshana formulae reproduce the exact solution of
//! their own ODE to numerical-integration precision. It does NOT validate the
//! Allen-Eggers *assumptions* (constant flight-path angle, negligible gravity-
//! along-path, isothermal exponential atmosphere) against flight data or a higher-
//! fidelity 3-/6-DoF aerothermal trajectory. Capability remains MODELLED.
//!
//! Tolerances (met with large margin; see the eprintln summary):
//!   a_max:      relative <= 5e-4   (0.05%)
//!   V@peak-g:   relative <= 1e-3   (0.1%)
//!   h@peak-g:   absolute <= 50 m
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/ballistic_re_entry_corridor/`.

use kshana::reentry::{
    altitude_at_peak_deceleration, peak_deceleration, velocity_at_peak_deceleration,
};

const REF: &str = include_str!(
    "fixtures/ballistic_re_entry_corridor/ballistic_re_entry_corridor_reference.txt"
);

const A_REL_TOL: f64 = 5e-4; // 0.05% on peak deceleration
const V_REL_TOL: f64 = 1e-3; // 0.1%  on velocity at peak-g
const H_ABS_TOL: f64 = 50.0; // m, absolute on altitude at peak-g

fn f(s: &str) -> f64 {
    s.trim().parse().unwrap_or_else(|_| panic!("not a float: '{s}'"))
}

#[test]
fn reentry_corridor_matches_scipy_solve_ivp() {
    let mut n = 0usize;
    let mut worst_a_rel = 0.0_f64;
    let mut worst_v_rel = 0.0_f64;
    let mut worst_h_abs = 0.0_f64;

    for line in REF.lines() {
        if !line.starts_with("REENTRY ") {
            continue;
        }
        // REENTRY V_e | gamma_deg | B | rho0 | H | a_max | V_at_peak | h_at_peak
        let parts: Vec<&str> = line.splitn(8, '|').collect();
        assert_eq!(parts.len(), 8, "REENTRY row needs 8 |-fields: {line}");
        let v_entry = f(parts[0].trim_start_matches("REENTRY"));
        let gamma_deg = f(parts[1]);
        let b = f(parts[2]);
        let rho0 = f(parts[3]);
        let h_scale = f(parts[4]);
        let a_want = f(parts[5]);
        let v_want = f(parts[6]);
        let h_want = f(parts[7]);

        let gamma_rad = gamma_deg.to_radians();

        let a_got = peak_deceleration(v_entry, gamma_rad, h_scale);
        let v_got = velocity_at_peak_deceleration(v_entry);
        let h_got = altitude_at_peak_deceleration(gamma_rad, b, rho0, h_scale);

        let a_rel = (a_got - a_want).abs() / a_want.abs();
        let v_rel = (v_got - v_want).abs() / v_want.abs();
        let h_abs = (h_got - h_want).abs();

        worst_a_rel = worst_a_rel.max(a_rel);
        worst_v_rel = worst_v_rel.max(v_rel);
        worst_h_abs = worst_h_abs.max(h_abs);

        assert!(
            a_rel <= A_REL_TOL,
            "V_e={v_entry} gamma={gamma_deg} B={b}: a_max {a_got:.6} vs scipy {a_want:.6} m/s^2 \
             (rel {a_rel:.2e} > {A_REL_TOL:.0e})"
        );
        assert!(
            v_rel <= V_REL_TOL,
            "V_e={v_entry} gamma={gamma_deg} B={b}: V@peak-g {v_got:.4} vs scipy {v_want:.4} m/s \
             (rel {v_rel:.2e} > {V_REL_TOL:.0e})"
        );
        assert!(
            h_abs <= H_ABS_TOL,
            "V_e={v_entry} gamma={gamma_deg} B={b}: h@peak-g {h_got:.2} vs scipy {h_want:.2} m \
             (|Δ| {h_abs:.2} > {H_ABS_TOL} m)"
        );
        n += 1;
    }

    assert!(n >= 6, "expected >=6 re-entry envelope cases, got {n}");
    eprintln!(
        "ballistic_re_entry_corridor_reference: {n} cases vs scipy solve_ivp DOP853 \
         (planar drag-only entry ODE) -- worst a_max rel {worst_a_rel:.2e}, \
         worst V@peak-g rel {worst_v_rel:.2e}, worst h@peak-g |Δ| {worst_h_abs:.2} m"
    );
}
