// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's CR3BP variational state-transition matrix
//! ([`kshana::cr3bp::propagate_state_stm`], paper P6, L31) against an **independent variational
//! integration** by SciPy: `scipy.integrate.solve_ivp` (DOP853, rtol=atol=1e-13) integrating the
//! coupled state + variational equations `dΦ/dt = A(t,x)·Φ`, `Φ(0)=I`.
//!
//! kshana propagates the same coupled system with a fixed-step RK4. The existing self-check in
//! [`kshana::observability_gramian`] perturbs the STATE flow by finite differences; this test is
//! the "additionally" oracle the gap names — an independent integrator (DOP853 vs RK4) AND an
//! independent equation set (the variational ODE integrated in lock-step) reproducing kshana's Φ
//! **element by element**. It can genuinely fail if kshana's Jacobian `A`, its STM RHS `A·Φ`, or
//! its RK4 coupling were wrong.
//!
//! Three fixed cases are checked: two planar (`z = ż = 0`, so the out-of-plane block is a
//! decoupled scalar) and one fully 3-D state (exercising the full 6×6 coupling). Reference matrices
//! and the generator live in `tests/fixtures/cr3bp_variational_stm/generate.py`
//! (`python3 generate.py > cr3bp_variational_stm_reference.txt`; NumPy + SciPy, no network).

use kshana::cr3bp::{propagate_state_stm, Cr3bpState, EARTH_MOON_MU};

const REF: &str =
    include_str!("fixtures/cr3bp_variational_stm/cr3bp_variational_stm_reference.txt");

/// DOP853 (rtol=atol=1e-13) and kshana's fixed-step RK4 agree on Φ to ~1e-7 over these short arcs
/// (the RK4 truncation with 8000 sub-steps is the honest, reported gap — NOT loosened to pass).
const TOL: f64 = 5e-7;

struct Case {
    name: String,
    t: f64,
    steps: usize,
    state0: [f64; 6],
    statef: [f64; 6],
    phi: Vec<Vec<f64>>, // 6x6 scipy STM
}

fn parse_cases(text: &str) -> Vec<Case> {
    let mut cases = Vec::new();
    let mut name = None;
    let mut t = 0.0;
    let mut steps = 0usize;
    let mut state0 = [0.0; 6];
    let mut statef = [0.0; 6];
    let mut phi: Vec<Vec<f64>> = Vec::new();
    let mut in_phi = false;

    let parse6 = |rest: &str| -> [f64; 6] {
        let v: Vec<f64> = rest
            .split_whitespace()
            .map(|s| s.parse().unwrap())
            .collect();
        assert_eq!(v.len(), 6, "need 6 numbers");
        [v[0], v[1], v[2], v[3], v[4], v[5]]
    };

    for line in text.lines() {
        let line = line.trim_end();
        if let Some(rest) = line.strip_prefix("# CASE ") {
            // flush the previous case
            if let Some(nm) = name.take() {
                assert_eq!(phi.len(), 6, "6 rows for {nm}");
                cases.push(Case {
                    name: nm,
                    t,
                    steps,
                    state0,
                    statef,
                    phi: std::mem::take(&mut phi),
                });
            }
            // "name t=<..> steps=<..>"
            let toks: Vec<&str> = rest.split_whitespace().collect();
            name = Some(toks[0].to_string());
            for tk in &toks[1..] {
                if let Some(v) = tk.strip_prefix("t=") {
                    t = v.parse().unwrap();
                } else if let Some(v) = tk.strip_prefix("steps=") {
                    steps = v.parse().unwrap();
                }
            }
            in_phi = false;
        } else if let Some(rest) = line.strip_prefix("# STATE0 ") {
            state0 = parse6(rest);
        } else if let Some(rest) = line.strip_prefix("# STATEF ") {
            statef = parse6(rest);
        } else if line.starts_with("# MATRIX PHI_") {
            in_phi = true;
            phi = Vec::new();
        } else if let Some(rest) = line.strip_prefix("ROW ") {
            if in_phi {
                phi.push(
                    rest.split_whitespace()
                        .map(|s| s.parse().unwrap())
                        .collect(),
                );
            }
        }
    }
    if let Some(nm) = name.take() {
        assert_eq!(phi.len(), 6, "6 rows for {nm}");
        cases.push(Case {
            name: nm,
            t,
            steps,
            state0,
            statef,
            phi,
        });
    }
    cases
}

#[test]
fn cr3bp_stm_matches_scipy_variational_integration() {
    let cases = parse_cases(REF);
    assert!(
        cases.len() >= 3,
        "expected >=3 STM cases, got {}",
        cases.len()
    );

    let mut worst_phi = 0.0_f64;
    let mut worst_state = 0.0_f64;

    for c in &cases {
        let s0 = Cr3bpState {
            r: [c.state0[0], c.state0[1], c.state0[2]],
            v: [c.state0[3], c.state0[4], c.state0[5]],
        };
        let (stf, phi) = propagate_state_stm(&s0, EARTH_MOON_MU, c.t, c.steps);

        // Final state agrees (the state leg of the coupled system).
        let statef_got = [stf.r[0], stf.r[1], stf.r[2], stf.v[0], stf.v[1], stf.v[2]];
        for (got, want) in statef_got.iter().zip(&c.statef) {
            let d = (got - want).abs();
            worst_state = worst_state.max(d);
            assert!(
                d <= TOL,
                "{}: final state {got} vs scipy {want} (|d|={d:.2e} > {TOL:.0e})",
                c.name
            );
        }

        // The STM Φ agrees element by element with scipy's variational integration.
        for (i, (got_row, want_row)) in phi.iter().zip(&c.phi).enumerate() {
            for (j, (got, want)) in got_row.iter().zip(want_row).enumerate() {
                let d = (got - want).abs();
                worst_phi = worst_phi.max(d);
                assert!(
                    d <= TOL,
                    "{}: Phi[{i}][{j}] = {got} vs scipy {want} (|d|={d:.2e} > {TOL:.0e})",
                    c.name
                );
            }
        }
    }

    eprintln!(
        "cr3bp_variational_stm_reference: {} cases, kshana RK4 STM vs scipy DOP853 variational — \
         worst |dPhi|={:.2e}, worst |dstate|={:.2e}",
        cases.len(),
        worst_phi,
        worst_state
    );
}
