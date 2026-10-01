// SPDX-License-Identifier: AGPL-3.0-only
//! Clohessy-Wiltshire relative motion against nonlinear two-body motion from Orekit 12.2.
//!
//! ORACLE (Library): Orekit 12.2 (Apache-2.0) NumericalPropagator, DormandPrince853, Newtonian
//! attraction only (position tolerance 1e-10 m), propagating chief and deputy separately in
//! EME2000; Orekit's own `LOFType.QSW` frame (Q radial, S along-track, W orbit normal, the Hill
//! frame) maps the deputy's initial relative state to inertial and the propagated deputy back.
//! Oracle self-check: the numerical chief stays within 2.3e-8 m of Orekit's analytic
//! KeplerianPropagator over the span.
//!
//! SETUP: chief circular, a = R_eq + 500 km = 6 878 137 m, i = 51.6 deg, RAAN 30 deg; span T/3,
//! sampled every 60 s and at T/3. Four 100 m cases: radial bounded, along-track, cross-track and a
//! mixed bounded offset.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-01, the validation plan's): the CW
//! position `cw_dynamics::propagate(n, t, s0)` within 1e-3 m of the Orekit relative position at
//! every sample of every case. The linearisation bound rho^2/r = 1.454e-3 m is reported for
//! context only.
//!
//! VERDICT (2026-10-01): DISAGREES. The worst gaps over T/3 are 3.70e-3 m (radial bounded),
//! 6.28e-3 m (along-track), 3.98e-3 m (cross-track) and 1.24e-3 m (mixed bounded), 0.85 to 4.3
//! times rho^2/r, all at t = T/3. A diagnostic rerun of the same driver at 10 m separation (not a
//! promotion attempt) shrank every gap by a factor 100.0, so the gap is the second-order term the
//! linear model omits, not a defect: the plan's 1e-3 m tolerance sits below the linearisation error
//! itself. The row stays MODELLED. The strict pre-registered comparison is kept as an ignored test
//! (`cargo test --test cw_dynamics_orekit_oracle -- --ignored` reproduces the disagreement); the
//! gated test pins the finding.
//!
//! Fixture, driver and provenance: `tests/fixtures/cw_dynamics_orekit_oracle/`.
//!
//! AMENDMENT, ROUND 2 (written 2026-10-01, before the second-order propagator exists or is run):
//! the engine gains a closed-form second-order relative-motion solution,
//! `cw_dynamics::propagate_second_order(n, r0, t, s0)`: the linear CW solution plus the response
//! of the CW operator, from zero initial conditions, to the quadratic terms of the exact
//! circular-chief relative equations (Newman, Lovell and Pratt 2015, second-order Cartesian
//! solution by Volterra series; Karlgaard and Lutze, Journal of Guidance, Control, and Dynamics
//! 26(1), 2003, for the same quadratic forcing). The comparison is UNCHANGED: same Orekit 12.2
//! fixture (SHA-256 888693f6...ce061f, not regenerated), same four 100 m cases, same samples, same
//! 1e-3 m maximum position gap; only the engine function evaluated changes, so the quantity is "CW
//! with second-order correction". Disclosure: the first-order gaps and the 10 m diagnostic (gap
//! scales as rho^2) were seen before this amendment, so the expected direction of the result is
//! known; the bar is the original one and is not touched. The new strict test is
//! `cw_second_order_matches_nonlinear_orekit_within_1mm`; the first-order finding stays pinned.

use kshana::cw_dynamics::{mean_motion, propagate, State6};
use kshana::orbit::MU_EARTH;

const REF: &str = include_str!("fixtures/cw_dynamics_orekit_oracle/cw_dynamics_orekit_oracle.txt");

const POS_TOL_M: f64 = 1e-3;

fn nums(s: &str) -> Vec<f64> {
    s.split_whitespace().map(|t| t.parse().unwrap()).collect()
}

/// Per case: (id, a, initial state, samples (t, rho)).
type CwCase = (String, f64, State6, Vec<(f64, [f64; 3])>);

fn parse() -> Vec<CwCase> {
    let mut out: Vec<CwCase> = Vec::new();
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("CASE ") {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let r = nums(f[2]);
            let v = nums(f[3]);
            out.push((
                f[0].to_string(),
                f[1].parse().unwrap(),
                [r[0], r[1], r[2], v[0], v[1], v[2]],
                Vec::new(),
            ));
        } else if let Some(rest) = line.strip_prefix("S ") {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let p = nums(f[2]);
            out.last_mut()
                .unwrap()
                .3
                .push((f[1].parse().unwrap(), [p[0], p[1], p[2]]));
        }
    }
    out
}

/// Worst CW-minus-Orekit position gap per case: (id, gap m, at t s, rho^2/r m).
fn worst_gaps() -> Vec<(String, f64, f64, f64)> {
    let mut out = Vec::new();
    for (id, a, s0, samples) in &parse() {
        assert!(samples.len() > 30, "case {id}: too few samples");
        let n = mean_motion(MU_EARTH, *a);
        let sep = (s0[0] * s0[0] + s0[1] * s0[1] + s0[2] * s0[2]).sqrt();
        let mut worst = (0.0_f64, 0.0_f64);
        for (t, rho) in samples {
            let s = propagate(n, *t, s0);
            let d = ((s[0] - rho[0]).powi(2) + (s[1] - rho[1]).powi(2) + (s[2] - rho[2]).powi(2))
                .sqrt();
            if d > worst.0 {
                worst = (d, *t);
            }
        }
        out.push((id.clone(), worst.0, worst.1, sep * sep / a));
    }
    out
}

/// The finding, pinned in the gate: every case misses the pre-registered 1e-3 m tolerance, and
/// the miss is the second-order term (below 1e-2 m at 100 m; this envelope was chosen after the
/// comparison and is a characterisation, never a promotion basis).
#[test]
fn cw_disagreement_with_orekit_is_recorded_as_a_finding() {
    let gaps = worst_gaps();
    assert_eq!(gaps.len(), 4);
    for (id, gap, t, bound) in &gaps {
        eprintln!(
            "{id}: worst |rho_CW - rho_Orekit| = {gap:.3e} m at t = {t:.0} s ({:.2} x rho^2/r)",
            gap / bound
        );
        assert!(
            gap.is_finite() && *gap < 1e-2,
            "{id}: gap {gap:e} m outside the characterisation envelope"
        );
    }
    assert!(
        gaps.iter().any(|g| g.1 > POS_TOL_M),
        "CW now agrees with Orekit within {POS_TOL_M:e} m: the M057 record says DISAGREES and must be revisited"
    );
}

#[test]
#[ignore = "DISAGREES with the pre-registered 1e-3 m tolerance (1.24e-3 to 6.28e-3 m); row stays MODELLED"]
fn cw_matches_nonlinear_orekit_within_the_linearisation_bound() {
    let failures: Vec<String> = worst_gaps()
        .into_iter()
        .filter(|g| g.1 > POS_TOL_M)
        .map(|(id, gap, t, _)| format!("{id}: {gap:.3e} m at t = {t:.0} s exceeds {POS_TOL_M:e} m"))
        .collect();
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}

/// Pre-registered (round 2 amendment above): the second-order closed-form propagator against the
/// unchanged Orekit fixture at the unchanged 1e-3 m bar.
#[test]
#[ignore = "pre-registered; not yet run"]
fn cw_second_order_matches_nonlinear_orekit_within_1mm() {
    unimplemented!("pre-registered: cw_dynamics::propagate_second_order does not exist yet");
}
