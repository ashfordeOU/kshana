// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the Izzo-2015 single-revolution Lambert solver against an
//! **independent third-party authority**: lamberthub 1.0.0 (J. Martinez Garrido,
//! MIT), `lamberthub.izzo2015`.
//!
//! Lambert's problem — given two position vectors `r1`, `r2` and a time of flight,
//! find the boundary velocities `(v1, v2)` of the connecting two-body arc — has a
//! unique solution for the single-revolution (`M = 0`) case, so an independent
//! solver is a genuine external oracle for the velocities. This is the same kind
//! of library-vs-library validation DOP gets against gnss_lib_py and the
//! quantum-trade kernels get against scipy: a different codebase, fed
//! byte-identical inputs, agreeing to a stated tolerance.
//!
//! Honest scope: this validates the Lambert *solver* — the load-bearing core of
//! the maneuver / porkchop capability. The impulsive- and finite-burn layers
//! (Tsiolkovsky) and the porkchop sweep are covered by their own checks and are
//! not what this fixture validates.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/lambert/`.

use kshana::maneuver::lambert;

const REF: &str = include_str!("fixtures/lambert/lambert_reference.txt");

/// Worst-case velocity-component tolerance: a relative bound (1e-6, ~1 mm/s on a
/// km/s velocity) plus a tiny absolute floor so a component lamberthub reports as
/// ~0 matches kshana's exact 0.0. Both solvers iterate to ~1e-7, so the residual
/// is dominated by their independent convergence and float reassociation.
const REL_TOL: f64 = 1e-6;
const ABS_TOL: f64 = 1e-4; // m/s

fn approx(got: f64, want: f64) -> bool {
    (got - want).abs() <= REL_TOL * want.abs() + ABS_TOL
}

fn csv3(s: &str) -> [f64; 3] {
    let v: Vec<f64> = s.trim().split(',').map(|x| x.trim().parse().unwrap()).collect();
    assert_eq!(v.len(), 3, "expected 3 components in '{s}'");
    [v[0], v[1], v[2]]
}

#[test]
fn lambert_matches_lamberthub_izzo2015() {
    let mut n = 0usize;
    let mut worst = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("LAMBERT ") {
            continue;
        }
        // LAMBERT name | mu | r1 | r2 | tof | prograde | v1 | v2
        let parts: Vec<&str> = line.splitn(8, '|').collect();
        assert_eq!(parts.len(), 8, "LAMBERT row needs 8 |-fields: {line}");
        let name = parts[0].trim_start_matches("LAMBERT").trim();
        let mu: f64 = parts[1].trim().parse().unwrap();
        let r1 = csv3(parts[2]);
        let r2 = csv3(parts[3]);
        let tof: f64 = parts[4].trim().parse().unwrap();
        let prograde = parts[5].trim() == "1";
        let v1_want = csv3(parts[6]);
        let v2_want = csv3(parts[7]);

        let (v1, v2) = lambert(r1, r2, tof, mu, prograde)
            .unwrap_or_else(|e| panic!("{name}: kshana lambert errored: {e}"));

        for (lbl, got, want) in [
            ("v1x", v1[0], v1_want[0]),
            ("v1y", v1[1], v1_want[1]),
            ("v1z", v1[2], v1_want[2]),
            ("v2x", v2[0], v2_want[0]),
            ("v2y", v2[1], v2_want[1]),
            ("v2z", v2[2], v2_want[2]),
        ] {
            worst = worst.max((got - want).abs());
            assert!(
                approx(got, want),
                "LAMBERT {name}: {lbl} {got:.9e} m/s vs lamberthub {want:.9e} m/s \
                 (|Δ|={:.2e} > {:.2e})",
                (got - want).abs(),
                REL_TOL * want.abs() + ABS_TOL,
            );
        }
        n += 1;
    }
    assert!(n >= 12, "expected >=12 Lambert reference cases, got {n}");
    eprintln!("lambert_reference: {n} cases vs lamberthub izzo2015, worst |Δv| = {worst:.3e} m/s");
}
