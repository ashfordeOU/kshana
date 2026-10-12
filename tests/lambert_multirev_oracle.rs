// SPDX-License-Identifier: AGPL-3.0-only
//! Multi-revolution Lambert (Izzo 2015, M >= 1 left and right branches) against pykep 3.0.1.
//!
//! The case set, quantities and bars were committed alone in
//! `docs/design/evidence/lambert-multirev/PREREGISTRATION.md` before this comparison was run.
//! The reference values are `tests/fixtures/lambert_multirev/reference.csv`, written by
//! `scripts/gen_lambert_multirev_ref.py` with pykep's `lambert_problem` (MPL-2.0), run as a
//! separate program; provenance in the fixture's NOTICE.md.
//!
//! Bars: the solution count equals pykep's in every case; each `v1` and `v2` agrees to a relative
//! 1e-8, or 1e-6 on a branch within 1 % of its minimum time of flight (`d_m < 1e-2`).

use kshana::maneuver::{kepler_universal, lambert_multirev, LambertBranch};

const REF: &str = include_str!("fixtures/lambert_multirev/reference.csv");

struct Row {
    case: String,
    mu: f64,
    r1: [f64; 3],
    r2: [f64; 3],
    tof: f64,
    prograde: bool,
    nmax: u32,
    revs: u32,
    branch: Option<LambertBranch>,
    d_m: f64,
    v1: [f64; 3],
    v2: [f64; 3],
}

fn rows() -> Vec<Row> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let f: Vec<&str> = l.split(',').collect();
            assert_eq!(f.len(), 21, "{l}");
            let p = |i: usize| -> f64 { f[i].parse().unwrap() };
            Row {
                case: f[1].to_string(),
                mu: p(2),
                r1: [p(3), p(4), p(5)],
                r2: [p(6), p(7), p(8)],
                tof: p(9),
                prograde: f[10] == "1",
                nmax: f[11].parse().unwrap(),
                revs: f[12].parse().unwrap(),
                branch: match f[13] {
                    "left" => Some(LambertBranch::Left),
                    "right" => Some(LambertBranch::Right),
                    _ => None,
                },
                d_m: p(14),
                v1: [p(15), p(16), p(17)],
                v2: [p(18), p(19), p(20)],
            }
        })
        .collect()
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

fn mag(a: [f64; 3]) -> f64 {
    dist(a, [0.0; 3])
}

#[test]
fn multirev_lambert_matches_pykep_on_the_preregistered_cases() {
    let rows = rows();
    assert_eq!(rows.len(), 1058, "fixture row count");
    let mut cases: Vec<&str> = rows.iter().map(|r| r.case.as_str()).collect();
    cases.dedup();
    assert_eq!(cases.len(), 382, "300 + 18 + 24 + 40 cases");

    let (mut worst, mut worst_edge) = (0.0_f64, 0.0_f64);
    let mut worst_case = String::new();
    let mut worst_kepler = 0.0_f64;
    let mut checked = 0usize;
    for case in &cases {
        let rs: Vec<&Row> = rows.iter().filter(|r| r.case == *case).collect();
        let r0 = rs[0];
        let sols = lambert_multirev(r0.r1, r0.r2, r0.tof, r0.mu, r0.prograde, 3)
            .unwrap_or_else(|e| panic!("{case}: {e}"));
        assert_eq!(
            sols.len(),
            rs.len(),
            "{case}: solution count {} vs pykep {} (pykep Nmax {})",
            sols.len(),
            rs.len(),
            r0.nmax
        );
        assert_eq!(rs.len() as u32, 1 + 2 * r0.nmax, "{case}");
        for (s, r) in sols.iter().zip(&rs) {
            assert_eq!((s.revs, s.branch), (r.revs, r.branch), "{case}: order");
            let e = (dist(s.v1, r.v1) / mag(r.v1)).max(dist(s.v2, r.v2) / mag(r.v2));
            let bar = if r.revs >= 1 && r.d_m < 1e-2 {
                worst_edge = worst_edge.max(e);
                1e-6
            } else {
                if e > worst {
                    worst = e;
                    worst_case = format!("{case} M={} {:?}", r.revs, r.branch);
                }
                1e-8
            };
            assert!(
                e <= bar,
                "{case} M={} {:?}: relative velocity difference {e:e} over the bar {bar:e}",
                r.revs,
                r.branch
            );
            // Internal consistency guard (not evidence): the arc lands on r2.
            if r.revs >= 1 {
                let (r_end, _) = kepler_universal(r0.r1, s.v1, r0.tof, r0.mu);
                worst_kepler = worst_kepler.max(dist(r_end, r0.r2) / mag(r0.r2));
            }
            checked += 1;
        }
    }
    eprintln!(
        "multi-rev Lambert vs pykep: {checked} solutions in {} cases; worst relative |dv| {worst:.3e} \
         ({worst_case}) against 1e-8; worst near the minimum time {worst_edge:.3e} against 1e-6; \
         worst Kepler landing miss {worst_kepler:.3e} of |r2|",
        cases.len()
    );
    assert!(worst_kepler < 1e-6, "Kepler landing guard {worst_kepler:e}");
}
