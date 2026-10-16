// SPDX-License-Identifier: AGPL-3.0-only
//! The Cowell propagator's **opt-in DE440 ephemeris tier** (`ForceModel::with_ephemeris`,
//! RM-33/FUT-10) against **Orekit 12.2**, whose Sun and Moon come from its own DE440 reader on
//! orekit-data's `lnxp1990.440`: kshana reads a bit-for-bit cut of NAIF `de440s.bsp` through
//! `KernelEphemeris`. Same JPL integration, different file, format, reader and TDB model.
//! Bars pre-registered in `xval/propagator-de440-orekit/PREREGISTRATION.md` (22a5a01d); results
//! in `xval/propagator-de440-orekit/RESULTS.md`.
//!
//! PIN-SCOPE:    the 125 Orekit states and 125 Sun/Moon positions of
//!               tests/fixtures/propagator_de440_orekit_oracle/propagator_de440_orekit_oracle.txt
//!               against the pre-registered bars: orbit 0.5 m / 5e-4 m/s and the analytic-series
//!               control (> 1 m on D1 GEO), both met; Sun 3 m / Moon 0.2 m, missed and pinned as
//!               the recorded miss band.
//! PIN-EXCLUDES: every kshana report and scenario output; DE440 itself; the default (analytic)
//!               ephemeris path; kernels outside the cut window.

use std::path::Path;
use std::sync::Arc;

use kshana::body::Body;
use kshana::ephem_provider::{tt_to_tdb_jd2, KernelEphemeris};
use kshana::integrator::Tolerance;
use kshana::jd2::Jd2;
use kshana::propagator::{propagate_dopri, ForceModel};

const REF: &str =
    include_str!("fixtures/propagator_de440_orekit_oracle/propagator_de440_orekit_oracle.txt");
const KERNEL: &str =
    "tests/fixtures/propagator_de440_orekit_oracle/de440s_2024-03-18_2024-03-23.bsp";
const SUN_BAR_M: f64 = 3.0;
const MOON_BAR_M: f64 = 0.2;
const POS_BAR_M: f64 = 0.5;
const VEL_BAR_M_S: f64 = 5.0e-4;
const CONTROL_MIN_MISS_M: f64 = 1.0;

type Vec3 = [f64; 3];

struct Case {
    tier: String,
    regime: String,
    epoch: f64,
    r0: Vec3,
    v0: Vec3,
    states: Vec<(f64, Vec3, Vec3)>,
    bodies: Vec<(f64, Vec3, Vec3)>,
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
                tier: head[1].into(),
                regime: head[2].into(),
                epoch: f[1].parse().unwrap(),
                r0: v3(f[2]),
                v0: v3(f[3]),
                states: Vec::new(),
                bodies: Vec::new(),
            }),
            Some("STATE") => {
                let c = out.last_mut().unwrap();
                c.states
                    .push((head[4].parse().unwrap(), v3(f[1]), v3(f[2])));
            }
            Some("BODY") => {
                let c = out.last_mut().unwrap();
                c.bodies
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

fn kernel() -> Arc<KernelEphemeris> {
    Arc::new(KernelEphemeris::open(Path::new(KERNEL)).expect("open the cut DE440 kernel"))
}

fn model(c: &Case, epoch: f64, eph: Option<Arc<KernelEphemeris>>) -> ForceModel {
    let mut m = ForceModel::two_body().third_body(true, true, epoch);
    if c.tier == "D2" {
        m = m.solar_radiation(1.5, 0.02);
    }
    match eph {
        Some(k) => m.with_ephemeris(k).expect("the cut covers the epoch"),
        None => m,
    }
}

fn run(c: &Case, eph: Option<Arc<KernelEphemeris>>) -> Vec<(Vec3, Vec3)> {
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
            let m = model(c, c.epoch + t_prev / 86_400.0, eph.clone());
            (r, v) = propagate_dopri(r, v, t - t_prev, &m, &tol);
            t_prev = t;
        }
        out.push((r, v));
    }
    out
}

#[test]
fn kernel_sun_and_moon_match_orekit_de440() {
    let k = kernel();
    let (mut ws, mut wm) = (0.0_f64, 0.0_f64);
    for c in cases() {
        for &(t, sun, moon) in &c.bodies {
            let tdb = tt_to_tdb_jd2(Jd2::new(c.epoch).add_seconds(t));
            let s = k
                .relative_position_jd2(&Body::sun(), &Body::earth(), tdb)
                .unwrap();
            let m = k
                .relative_position_jd2(&Body::moon(), &Body::earth(), tdb)
                .unwrap();
            ws = ws.max(dist(s, sun));
            wm = wm.max(dist(m, moon));
        }
    }
    println!("worst |dSun| = {ws:.4} m, |dMoon| = {wm:.5} m");
    // The pre-registered bars MISSED on the first run (Sun 6.39 m, Moon 0.244 m; SPICE on the same
    // kernel misses Orekit by the same amount, see xval/propagator-de440-orekit/RESULTS.md). Pin
    // the recorded band so any change forces the record to be updated.
    assert!(
        ws > SUN_BAR_M && ws < 7.0,
        "Sun {ws} m left the recorded miss band: update RESULTS.md"
    );
    assert!(
        wm > MOON_BAR_M && wm < 0.3,
        "Moon {wm} m left the recorded miss band: update RESULTS.md"
    );
}

#[test]
fn de440_tier_orbits_match_orekit() {
    let cs = cases();
    assert_eq!(cs.len(), 5);
    let k = kernel();
    for c in &cs {
        assert_eq!(c.states.len(), 25);
        let ours = run(c, Some(k.clone()));
        let (mut wr, mut wv) = (0.0_f64, 0.0_f64);
        for ((_, ro, vo), (r, v)) in c.states.iter().zip(&ours) {
            wr = wr.max(dist(*ro, *r));
            wv = wv.max(dist(*vo, *v));
        }
        println!(
            "{} {:<4} worst |dr| = {wr:.4} m, |dv| = {wv:.3e} m/s",
            c.tier, c.regime
        );
        assert!(wr <= POS_BAR_M, "{} {}: |dr| {wr} m", c.tier, c.regime);
        assert!(wv <= VEL_BAR_M_S, "{} {}: |dv| {wv} m/s", c.tier, c.regime);
    }
    // Sensitivity control: the analytic series must miss the D1 GEO 24 h state by > 1 m.
    let geo = cs
        .iter()
        .find(|c| c.tier == "D1" && c.regime == "GEO")
        .unwrap();
    let analytic = run(geo, None);
    let miss = dist(analytic.last().unwrap().0, geo.states.last().unwrap().1);
    println!("analytic-series control misses D1 GEO by {miss:.3} m");
    assert!(miss > CONTROL_MIN_MISS_M, "control only {miss} m");
}
