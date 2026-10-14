// SPDX-License-Identifier: AGPL-3.0-only
//! The default exponential drag against GMAT R2022a's `Exponential` atmosphere (WP-01, the GMAT
//! leg of the drag cross-check).
//!
//! Pre-registered in `xval/drag-exponential-gmat/PREREGISTRATION.md` (committed alone before
//! any GMAT run of these cases); results in `xval/drag-exponential-gmat/RESULTS.md`. Fixture:
//! `tests/fixtures/drag_exponential_gmat_oracle/` (GMAT run, never vendored; see its NOTICE.md).
//! The bars are on the drag-induced displacement `D = r_drag − r_nodrag` of each side, which
//! cancels the two sides' different Earth μ and integrators.

use kshana::integrator::Tolerance;
use kshana::propagator::{propagate_dopri, ForceModel};

const REF: &str =
    include_str!("fixtures/drag_exponential_gmat_oracle/drag_exponential_gmat_oracle.txt");
const EPOCH_JD_TT: f64 = 2_451_545.0;
const CDAM: f64 = 0.02;
const ABS_POS_M: f64 = 0.5;
const ABS_VEL_M_S: f64 = 5.0e-4;
const REL: f64 = 1e-3;

type Vec3 = [f64; 3];

#[derive(Default)]
struct Case {
    id: String,
    r0: Vec3,
    v0: Vec3,
    drag: Vec<(f64, Vec3, Vec3)>,
    nodrag: Vec<(f64, Vec3, Vec3)>,
}

fn v3(s: &str) -> Vec3 {
    let v: Vec<f64> = s.trim().split(',').map(|x| x.parse().unwrap()).collect();
    [v[0], v[1], v[2]]
}

fn cases() -> Vec<Case> {
    let mut out: Vec<Case> = Vec::new();
    for line in REF.lines().filter(|l| !l.starts_with('#')) {
        let f: Vec<&str> = line.split('|').map(str::trim).collect();
        let head: Vec<&str> = f[0].split_whitespace().collect();
        match head[0] {
            "CASE" => out.push(Case {
                id: head[1].into(),
                r0: v3(f[1]),
                v0: v3(f[2]),
                ..Case::default()
            }),
            "STATE" => {
                let c = out.last_mut().unwrap();
                assert_eq!(c.id, head[1]);
                let row = (f[1].parse().unwrap(), v3(f[2]), v3(f[3]));
                match head[2] {
                    "drag" => c.drag.push(row),
                    _ => c.nodrag.push(row),
                }
            }
            _ => {}
        }
    }
    out
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// kshana's hourly states, one integration continued hour by hour.
fn run(c: &Case, cdam: Option<f64>) -> Vec<(Vec3, Vec3)> {
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let mut m = ForceModel::two_body().third_body(false, false, EPOCH_JD_TT);
    if let Some(k) = cdam {
        m = m.drag(k);
    }
    let (mut r, mut v) = (c.r0, c.v0);
    let mut out = vec![(r, v)];
    for k in 0..24 {
        // Each hour starts at its own advanced epoch, as one continued integration.
        let mk = ForceModel {
            epoch_jd_tt: EPOCH_JD_TT + k as f64 / 24.0,
            ..m.clone()
        };
        (r, v) = propagate_dopri(r, v, 3600.0, &mk, &tol);
        out.push((r, v));
    }
    out
}

/// Worst ratio of |ΔD| to its bar over the case (position and velocity), and D at 24 h.
fn compare(c: &Case, cdam: f64) -> (f64, f64, f64) {
    let (kd, kn) = (run(c, Some(cdam)), run(c, None));
    let mut worst: f64 = 0.0;
    for k in 0..25 {
        let (tg, rgd, vgd) = c.drag[k];
        let (tn, rgn, vgn) = c.nodrag[k];
        assert!((tg - 3600.0 * k as f64).abs() < 1e-3 && (tn - tg).abs() < 1e-3);
        let (dg, dvg) = (sub(rgd, rgn), sub(vgd, vgn));
        let (dk, dvk) = (sub(kd[k].0, kn[k].0), sub(kd[k].1, kn[k].1));
        let rp = norm(sub(dk, dg)) / (ABS_POS_M + REL * norm(dg));
        let rv = norm(sub(dvk, dvg)) / (ABS_VEL_M_S + REL * norm(dvg));
        worst = worst.max(rp).max(rv);
    }
    let dg24 = norm(sub(c.drag[24].1, c.nodrag[24].1));
    let dk24 = norm(sub(kd[24].0, kn[24].0));
    (worst, dg24, dk24)
}

#[test]
fn equatorial_drag_displacement_matches_gmat() {
    let cs = cases();
    assert_eq!(cs.len(), 4);
    for c in cs.iter().filter(|c| c.id.starts_with('E')) {
        assert_eq!((c.drag.len(), c.nodrag.len()), (25, 25), "{}", c.id);
        let (worst, dg24, dk24) = compare(c, CDAM);
        println!(
            "{}: worst |ΔD| / bar = {worst:.4}, D_gmat(24 h) = {dg24:.1} m, D_kshana(24 h) = {dk24:.1} m",
            c.id
        );
        assert!(
            worst <= 1.0,
            "{}: bar 1 exceeded ({worst:.3} of the bar)",
            c.id
        );
        assert!(
            dg24 > 100.0,
            "{}: bar 2, drag displacement only {dg24} m",
            c.id
        );
    }
}

#[test]
fn a_one_percent_drag_change_breaks_the_bar() {
    let cs = cases();
    let e400 = cs.iter().find(|c| c.id == "E400").unwrap();
    let (worst, _, _) = compare(e400, CDAM * 1.01);
    println!("E400 with Cd*A/m +1 %: worst |ΔD| / bar = {worst:.3}");
    assert!(
        worst > 1.0,
        "the +1 % control stays inside the bar ({worst:.3})"
    );
}

/// I400, reported only: the geodetic-vs-spherical height difference (no bar). The
/// pre-registered prediction is the sign, |D_gmat| < |D_kshana|.
#[test]
fn inclined_case_reports_the_height_model_difference() {
    let cs = cases();
    let i400 = cs.iter().find(|c| c.id == "I400").unwrap();
    let (worst, dg24, dk24) = compare(i400, CDAM);
    println!(
        "I400 (reported): D_gmat(24 h) = {dg24:.1} m, D_kshana(24 h) = {dk24:.1} m, worst |ΔD| / bar = {worst:.2}"
    );
    assert!(dg24 < dk24, "the predicted sign did not hold");
}
