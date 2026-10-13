// SPDX-License-Identifier: AGPL-3.0-only
//! The opt-in **NRLMSISE-00 drag tier** of the Cowell propagator (`ForceModel::drag_density`,
//! RM-13/DS-PA-15) against **Orekit 12.2** `DragForce` with Orekit's own `NRLMSISE00`, run as a
//! separate program in the same Earth-rotation-angle frame and local-solar-time convention. Bars
//! pre-registered in `xval/drag-tier-orekit/PREREGISTRATION.md` (21647478); results in
//! `xval/drag-tier-orekit/RESULTS.md`.
//!
//! PIN-SCOPE:    the 100 Orekit states of tests/fixtures/drag_tier_orekit_oracle/drag_tier_orekit_oracle.txt
//!               against the pre-registered bars (0.5 m + 1e-3 of the drag displacement, the
//!               velocity analogue) and the two sensitivity requirements (> 100 m).
//! PIN-EXCLUDES: every kshana report and scenario output; the model's accuracy against measured
//!               density; time-varying space weather; the default exponential drag.

use kshana::forces::DensityModel;
use kshana::integrator::Tolerance;
use kshana::propagator::{propagate_dopri, ForceModel};

const REF: &str = include_str!("fixtures/drag_tier_orekit_oracle/drag_tier_orekit_oracle.txt");
const ABS_POS_M: f64 = 0.5;
const ABS_VEL_M_S: f64 = 5.0e-4;
const REL: f64 = 1e-3;
const CONTROL_MIN_M: f64 = 100.0;

type Vec3 = [f64; 3];

struct Case {
    id: String,
    epoch: f64,
    r0: Vec3,
    v0: Vec3,
    density: DensityModel,
    cdam: f64,
    states: Vec<(f64, Vec3, Vec3)>,
}

fn v3(s: &str) -> Vec3 {
    let v: Vec<f64> = s.trim().split(',').map(|x| x.parse().unwrap()).collect();
    [v[0], v[1], v[2]]
}

fn cases() -> Vec<Case> {
    let mut out: Vec<Case> = Vec::new();
    for line in REF.lines() {
        let f: Vec<&str> = line.split('|').map(str::trim).collect();
        let head: Vec<&str> = f[0].split_whitespace().collect();
        match head.first().copied() {
            Some("CASE") => out.push(Case {
                id: head[1].into(),
                epoch: f[1].parse().unwrap(),
                r0: v3(f[2]),
                v0: v3(f[3]),
                density: DensityModel::Nrlmsise00 {
                    f107a: f[4].parse().unwrap(),
                    f107: f[5].parse().unwrap(),
                    ap: f[6].parse().unwrap(),
                },
                cdam: f[7].parse().unwrap(),
                states: Vec::new(),
            }),
            Some("STATE") => {
                let c = out.last_mut().unwrap();
                c.states
                    .push((head[3].parse().unwrap(), v3(f[1]), v3(f[2])));
            }
            _ => {}
        }
    }
    out
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// One integration continued hour by hour (pre-registered); `density = None` turns drag off.
fn run(c: &Case, density: Option<DensityModel>) -> Vec<(Vec3, Vec3)> {
    let tol = Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    };
    let (mut r, mut v) = (c.r0, c.v0);
    let mut t_prev = 0.0;
    let mut out = Vec::new();
    for &(t, _, _) in &c.states {
        if t > t_prev {
            let mut m =
                ForceModel::two_body().third_body(false, false, c.epoch + t_prev / 86_400.0);
            if let Some(d) = density {
                m = m.drag(c.cdam).drag_density(d);
            }
            (r, v) = propagate_dopri(r, v, t - t_prev, &m, &tol);
            t_prev = t;
        }
        out.push((r, v));
    }
    out
}

#[test]
fn nrlmsise00_drag_tier_matches_orekit() {
    let cs = cases();
    assert_eq!(cs.len(), 4);
    for c in &cs {
        assert_eq!(c.states.len(), 25);
        let drag = run(c, Some(c.density));
        let free = run(c, None);
        let (mut worst_ratio, mut wr, mut wv, mut dmax) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
        for (((_, ro, vo), (r, v)), (rf, vf)) in c.states.iter().zip(&drag).zip(&free) {
            let (d, dv) = (dist(*r, *rf), dist(*v, *vf));
            let (er, ev) = (dist(*ro, *r), dist(*vo, *v));
            let (br, bv) = (ABS_POS_M + REL * d, ABS_VEL_M_S + REL * dv);
            worst_ratio = worst_ratio.max(er / br).max(ev / bv);
            wr = wr.max(er);
            wv = wv.max(ev);
            dmax = dmax.max(d);
        }
        println!(
            "{}: worst |dr| {wr:.4} m, |dv| {wv:.3e} m/s, drag displacement {dmax:.1} m, worst error/bar {worst_ratio:.3}",
            c.id
        );
        assert!(worst_ratio <= 1.0, "{}: error/bar {worst_ratio}", c.id);
    }
    // Sensitivity: on M400 drag must matter and the exponential density must miss.
    let m400 = cs.iter().find(|c| c.id == "M400").unwrap();
    let last = m400.states.last().unwrap().1;
    let d24 = dist(
        run(m400, Some(m400.density)).last().unwrap().0,
        run(m400, None).last().unwrap().0,
    );
    let exp_miss = dist(
        run(m400, Some(DensityModel::Exponential)).last().unwrap().0,
        last,
    );
    println!("M400: drag displacement at 24 h {d24:.1} m; exponential-density control misses by {exp_miss:.1} m");
    assert!(d24 > CONTROL_MIN_M, "drag displacement only {d24} m");
    assert!(
        exp_miss > CONTROL_MIN_M,
        "exponential control only {exp_miss} m"
    );
}
