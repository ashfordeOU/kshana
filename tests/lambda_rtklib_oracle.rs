// SPDX-License-Identifier: AGPL-3.0-only
//! External-library oracle for LAMBDA integer ambiguity resolution (`kshana::lambda`).
//!
//! Oracle (Library): RTKLIB v2.4.2-p13 `lambda()` (`src/lambda.c`, BSD-2-Clause,
//! https://github.com/tomojitakasu/RTKLIB, commit 71db0ffa), an independent implementation of the
//! LAMBDA reduction and the MLAMBDA search (Chang, Yang and Zhou 2005), compiled from C by
//! `tests/fixtures/lambda_rtklib_oracle/rtklib_lambda_driver.c`. Only its printed numbers are
//! committed. Integer least squares has a unique minimiser on a generic float vector, so two
//! independent implementations must return the same integers and the same squared norms.
//!
//! Inputs: 300 problems from the driver's fixed seed, n in 2..=10, covariance
//! `Q = (A Aᵀ + 64 G Gᵀ + I) / 256` from printed integer matrices (every entry an exact binary
//! fraction, so the matrix here is bit-identical to RTKLIB's) and float ambiguities in
//! [-50, 50] cycles printed with 17 significant digits.
//!
//! Tolerance, fixed before the first comparison (`research/validation-0.30`, B6
//! pre-registration, 2026-10-01): the fixed integer vector identical to RTKLIB's best candidate on
//! all 300 problems, and the best and second-best squared norms each within 1e-9 relative of
//! RTKLIB's.
#![allow(clippy::needless_range_loop)]

use kshana::lambda::{resolve, Mat};

const REFERENCE: &str = include_str!("fixtures/lambda_rtklib_oracle/rtklib_lambda_reference.txt");

struct Problem {
    q: Mat,
    a: Vec<f64>,
    f1: Vec<i64>,
    f2: Vec<i64>,
    s: [f64; 2],
}

fn ints(line: &str, tag: &str) -> Vec<i64> {
    let rest = line.strip_prefix(tag).expect(tag);
    rest.split_whitespace()
        .map(|t| t.parse().expect("integer"))
        .collect()
}

fn floats(line: &str, tag: &str) -> Vec<f64> {
    let rest = line.strip_prefix(tag).expect(tag);
    rest.split_whitespace()
        .map(|t| t.parse().expect("float"))
        .collect()
}

fn parse() -> (Vec<Problem>, usize) {
    let mut lines = REFERENCE.lines().filter(|l| !l.starts_with('#')).peekable();
    let mut out = Vec::new();
    let mut rtklib_failures = 0;
    while let Some(head) = lines.next() {
        let h: Vec<i64> = ints(head, "P");
        let (n, info) = (h[0] as usize, h[1]);
        let a_int = ints(lines.next().unwrap(), "A");
        let g_int = ints(lines.next().unwrap(), "G");
        let a = floats(lines.next().unwrap(), "a");
        assert_eq!((a_int.len(), g_int.len(), a.len()), (n * n, n * 3, n));
        if info != 0 {
            rtklib_failures += 1;
            continue;
        }
        let f1 = ints(lines.next().unwrap(), "F1");
        let f2 = ints(lines.next().unwrap(), "F2");
        let s = floats(lines.next().unwrap(), "s");
        let mut q = vec![vec![0.0; n]; n];
        for i in 0..n {
            for j in 0..n {
                let mut acc: i64 = if i == j { 1 } else { 0 };
                for l in 0..n {
                    acc += a_int[i * n + l] * a_int[j * n + l];
                }
                for l in 0..3 {
                    acc += 64 * g_int[i * 3 + l] * g_int[j * 3 + l];
                }
                q[i][j] = acc as f64 / 256.0;
            }
        }
        out.push(Problem {
            q,
            a,
            f1,
            f2,
            s: [s[0], s[1]],
        });
    }
    (out, rtklib_failures)
}

#[test]
fn ils_solution_matches_rtklib_lambda_on_300_covariances() {
    const REL_TOL: f64 = 1e-9;
    let (problems, rtklib_failures) = parse();
    assert_eq!(
        rtklib_failures, 0,
        "RTKLIB returned an error on {rtklib_failures} problems"
    );
    // PIN-SCOPE:    the number of problems in the committed RTKLIB reference fixture
    // PIN-EXCLUDES: the values compared below, which carry their own tolerances
    assert_eq!(problems.len(), 300, "the fixture holds 300 problems");
    let mut worst_rel = [0.0_f64; 2];
    let mut mismatches = Vec::new();
    for (k, p) in problems.iter().enumerate() {
        let fix = resolve(&p.q, &p.a).unwrap_or_else(|| panic!("problem {k}: no solution"));
        if fix.fixed != p.f1 {
            mismatches.push(format!(
                "problem {k} (n = {}): kshana {:?}, RTKLIB {:?} (RTKLIB runner-up {:?})",
                p.a.len(),
                fix.fixed,
                p.f1,
                p.f2
            ));
            continue;
        }
        let second = fix.residual * fix.ratio;
        for (i, (&ours, &theirs)) in [fix.residual, second].iter().zip(&p.s).enumerate() {
            let rel = (ours - theirs).abs() / theirs.abs();
            worst_rel[i] = worst_rel[i].max(rel);
        }
    }
    eprintln!(
        "LAMBDA vs RTKLIB v2.4.2-p13: {} problems, {} integer mismatches, worst relative \
         difference of the best norm {:.3e}, of the second-best norm {:.3e}",
        problems.len(),
        mismatches.len(),
        worst_rel[0],
        worst_rel[1]
    );
    assert!(
        mismatches.is_empty(),
        "integer solutions differ:\n{}",
        mismatches.join("\n")
    );
    assert!(
        worst_rel[0] <= REL_TOL && worst_rel[1] <= REL_TOL,
        "squared norms differ from RTKLIB beyond {REL_TOL:e}: best {:.3e}, second {:.3e}",
        worst_rel[0],
        worst_rel[1]
    );
}
