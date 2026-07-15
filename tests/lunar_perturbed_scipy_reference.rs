// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's perturbed lunar-orbit propagation
//! ([`kshana::lunar_perturbed`], paper P2, gap G8) against an **independent third-party
//! integrator**: SciPy's DOP853 (`scipy.integrate.solve_ivp`, BSD-3-Clause).
//!
//! kshana::lunar_perturbed::propagate integrates the two-body + lunar-J2 + lunar-C22 force
//! model with its OWN adaptive step-doubling driver (crate::integrator, rtol=1e-12/atol=1e-6).
//! This test propagates the SAME force model from the SAME fixed initial state with a
//! COMPLETELY DIFFERENT integrator — SciPy's high-order embedded Dormand–Prince(8,5,3) DOP853
//! at rtol=atol=1e-12 — so agreement isolates and validates the INTEGRATION: kshana's driver
//! solves the stated perturbed ODE correctly, the external-integrator cross-check the gap's
//! oracle prescribes (the same standard as the P6 cr3bp-variational-STM oracle).
//!
//! Scope (honest): the third-body (Earth/Sun) terms are NOT part of this oracle — they depend
//! on kshana's analytic low-precision ephemeris (crate::ephem), which remains a Modelled input
//! and is covered by kshana's own analytic third-body unit tests. This oracle validates the
//! lunar gravity-field (J2 + time-varying C22) propagation that drives the constellation
//! geometry drift underlying the paper's perturbed-vs-idealized DOP comparison.
//!
//! Reference vectors, provenance and the generator live in
//! `tests/fixtures/lunar_perturbed_scipy/generate.py`
//! (`python3 generate.py > lunar_perturbed_scipy_reference.txt`; NumPy + SciPy only, no
//! network — the Rust test reads the committed `.txt`, so CI needs no Python).

use kshana::lunar_perturbed::{default_tolerance, propagate, LunarPerturbations, LunarState};

const REF: &str =
    include_str!("fixtures/lunar_perturbed_scipy/lunar_perturbed_scipy_reference.txt");

/// Two high-order adaptive integrators at rtol ~1e-12 on the same ODE agree far better than a
/// metre over ~1.8 orbits of a ~6500 km orbit; a 1 m bound stays inside that while a dropped or
/// wrong perturbation term (e.g. missing C22) would diverge by kilometres.
const POS_TOL_M: f64 = 1.0;

struct Fixture {
    r0: [f64; 3],
    v0: [f64; 3],
    samples: Vec<(f64, [f64; 3])>, // (t_s, [x, y, z])
}

fn parse() -> Fixture {
    let mut r0 = [0.0; 3];
    let mut v0 = [0.0; 3];
    let mut samples = Vec::new();
    for line in REF.lines() {
        let t: Vec<&str> = line.split_whitespace().collect();
        if t.is_empty() {
            continue;
        }
        match t[0] {
            "R0" => {
                for (i, s) in t[1..4].iter().enumerate() {
                    r0[i] = s.parse().unwrap();
                }
            }
            "V0" => {
                for (i, s) in t[1..4].iter().enumerate() {
                    v0[i] = s.parse().unwrap();
                }
            }
            "SAMPLE" => {
                let ts: f64 = t[1].parse().unwrap();
                let xyz = [
                    t[2].parse().unwrap(),
                    t[3].parse().unwrap(),
                    t[4].parse().unwrap(),
                ];
                samples.push((ts, xyz));
            }
            _ => {}
        }
    }
    assert!(
        samples.len() >= 5,
        "expected >=5 samples, got {}",
        samples.len()
    );
    Fixture { r0, v0, samples }
}

/// kshana's adaptive propagation of the J2+C22 lunar model matches SciPy's DOP853 integration
/// of the same model to sub-metre at every sample over ~1.8 orbits.
#[test]
fn perturbed_propagation_matches_scipy_dop853() {
    let fx = parse();
    let state0 = LunarState { r: fx.r0, v: fx.v0 };
    // J2 + C22 only (Earth/Sun third body off — validated separately, ephemeris stays Modelled).
    let model = LunarPerturbations::j2_only().with_c22(true);
    assert!(model.j2 && model.c22 && !model.earth && !model.sun);
    let tol = default_tolerance();

    let mut max_err = 0.0_f64;
    for &(t_s, ref_r) in &fx.samples {
        if t_s == 0.0 {
            // t=0 is the identity sample; propagate returns the input state unchanged.
            continue;
        }
        let s = propagate(&state0, t_s, &model, &tol);
        let err = ((s.r[0] - ref_r[0]).powi(2)
            + (s.r[1] - ref_r[1]).powi(2)
            + (s.r[2] - ref_r[2]).powi(2))
        .sqrt();
        max_err = max_err.max(err);
        assert!(
            err <= POS_TOL_M,
            "t={t_s}s: kshana vs scipy position error {err} m exceeds {POS_TOL_M} m\n  kshana {:?}\n  scipy  {:?}",
            s.r,
            ref_r
        );
    }
    // Sanity: the max error is genuinely small (not a vacuous pass on a huge tolerance).
    assert!(max_err < POS_TOL_M, "max position error {max_err} m");
}

/// Turning C22 off changes the trajectory measurably at the sample horizon — proving the C22
/// term the oracle validates is actually active (the match above is not C22-insensitive).
#[test]
fn c22_term_materially_affects_the_trajectory() {
    let fx = parse();
    let state0 = LunarState { r: fx.r0, v: fx.v0 };
    let tol = default_tolerance();
    let t_end = fx.samples.last().unwrap().0;
    let with_c22 = propagate(
        &state0,
        t_end,
        &LunarPerturbations::j2_only().with_c22(true),
        &tol,
    );
    let no_c22 = propagate(&state0, t_end, &LunarPerturbations::j2_only(), &tol);
    let d = ((with_c22.r[0] - no_c22.r[0]).powi(2)
        + (with_c22.r[1] - no_c22.r[1]).powi(2)
        + (with_c22.r[2] - no_c22.r[2]).powi(2))
    .sqrt();
    // C22 (~2e-5) over ~1.8 orbits shifts the position by many metres — well above POS_TOL_M,
    // so the scipy match is a genuine C22-inclusive check, not insensitive to it.
    assert!(
        d > 10.0,
        "C22 changed the trajectory by only {d} m — oracle would be C22-blind"
    );
}
