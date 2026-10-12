// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the **opt-in tesseral Earth geopotential** of the numerical Cowell
//! propagator (`propagator::Geopotential`, RM-09) against **Orekit 12.2** (CS GROUP,
//! Apache-2.0) `HolmesFeatherstoneAttractionModel` + `DormandPrince853`, run as a separate
//! program over the same EGM2008 coefficients (`tools/egm2008_to70.gfc`).
//!
//! Both sides evaluate the field in an Earth-fixed frame rotated about the inertial z axis by the
//! IAU 2000 Earth rotation angle at UT1 = TT (`EarthFixedFrame::Era`); the Java driver carries a
//! verbatim port of `cio::earth_rotation_angle`. The bars were pre-registered in
//! `xval/cowell-tesseral-orekit/PREREGISTRATION.md` (f0e0e65, amended 2da899a) before this
//! comparison was first run; results are recorded in `xval/cowell-tesseral-orekit/RESULTS.md`.
//!
//! What this does NOT validate: Earth-orientation fidelity (precession–nutation, polar motion,
//! UT1−UTC), which both sides omit; the `Cio` frame option (checked internally, bit-for-bit
//! against `precise_od`); degrees above 70.
//!
//! PIN-SCOPE:    the 150 Orekit reference states of the committed fixture (6 cases × 25 hourly
//!               states) and the pre-registered |Δr| ≤ 0.5 m, |Δv| ≤ 5e-4 m/s bars, plus the two
//!               pre-registered negative controls (frozen Earth, zonal-only model) at > 100 m.
//! PIN-EXCLUDES: every kshana report and scenario output; Earth-orientation fidelity; any
//!               field above degree 70; the default (non-tesseral) force model.

use kshana::forces::EARTH_ZONALS_J2_J6;
use kshana::integrator::{integrate_dopri, Tolerance};
use kshana::propagator::{propagate_dopri, ForceModel, Geopotential};

const REF: &str =
    include_str!("fixtures/cowell_tesseral_orekit_oracle/cowell_tesseral_orekit_oracle.txt");

const POS_BAR_M: f64 = 0.5;
const VEL_BAR_M_S: f64 = 5.0e-4;
const CONTROL_MIN_MISS_M: f64 = 100.0;

type Vec3 = [f64; 3];

struct Case {
    tier: String,
    regime: String,
    nmax: usize,
    epoch: f64,
    r0: Vec3,
    v0: Vec3,
    third_body: bool,
    srp: bool,
    states: Vec<(f64, Vec3, Vec3)>,
}

fn vec3(s: &str) -> Vec3 {
    let v: Vec<f64> = s.trim().split(',').map(|x| x.parse().unwrap()).collect();
    [v[0], v[1], v[2]]
}

fn cases() -> Vec<Case> {
    let mut out: Vec<Case> = Vec::new();
    for line in REF.lines() {
        if let Some(rest) = line.strip_prefix("CASE ") {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let head: Vec<&str> = f[0].split_whitespace().collect();
            out.push(Case {
                tier: head[0].into(),
                regime: head[1].into(),
                nmax: f[1].parse().unwrap(),
                epoch: f[2].parse().unwrap(),
                r0: vec3(f[3]),
                v0: vec3(f[4]),
                third_body: f[5] == "1",
                srp: f[6] == "1",
                states: Vec::new(),
            });
        } else if let Some(rest) = line.strip_prefix("STATE ") {
            let f: Vec<&str> = rest.split('|').map(str::trim).collect();
            let head: Vec<&str> = f[0].split_whitespace().collect();
            let c = out.last_mut().expect("STATE before CASE");
            assert_eq!((head[0], head[1]), (c.tier.as_str(), c.regime.as_str()));
            c.states
                .push((head[3].parse().unwrap(), vec3(f[1]), vec3(f[2])));
        }
    }
    out
}

fn model(c: &Case, epoch: f64) -> ForceModel {
    let m = ForceModel::two_body()
        .with_geopotential(Geopotential::egm2008(c.nmax))
        .third_body(c.third_body, c.third_body, epoch);
    if c.srp {
        m.solar_radiation(1.5, 0.02)
    } else {
        m
    }
}

fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        ..Tolerance::default()
    }
}

fn dist(a: Vec3, b: Vec3) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// Propagate hour by hour (pre-registered stepping), returning the state at every fixture epoch.
fn run(c: &Case, make: impl Fn(f64) -> ForceModel) -> Vec<(Vec3, Vec3)> {
    let (mut r, mut v) = (c.r0, c.v0);
    let mut t_prev = 0.0;
    let mut out = Vec::new();
    for &(t, _, _) in &c.states {
        if t > t_prev {
            let m = make(c.epoch + t_prev / 86_400.0);
            (r, v) = propagate_dopri(r, v, t - t_prev, &m, &tol());
            t_prev = t;
        }
        out.push((r, v));
    }
    out
}

#[test]
fn opt_in_tesseral_tier_matches_orekit_holmes_featherstone() {
    let cases = cases();
    assert_eq!(cases.len(), 6, "fixture case count");
    let mut worst = (0.0_f64, 0.0_f64);
    for c in &cases {
        assert_eq!(c.states.len(), 25, "{} {} state count", c.tier, c.regime);
        let ours = run(c, |e| model(c, e));
        let (mut wr, mut wv) = (0.0_f64, 0.0_f64);
        for ((_, ro, vo), (rk, vk)) in c.states.iter().zip(&ours) {
            wr = wr.max(dist(*ro, *rk));
            wv = wv.max(dist(*vo, *vk));
        }
        eprintln!(
            "{:>4} {:<5} N={:<2} worst |dr| = {wr:.4} m, |dv| = {wv:.3e} m/s",
            c.tier, c.regime, c.nmax
        );
        assert!(
            wr <= POS_BAR_M,
            "{} {}: |dr| {wr} m > {POS_BAR_M}",
            c.tier,
            c.regime
        );
        assert!(
            wv <= VEL_BAR_M_S,
            "{} {}: |dv| {wv} > {VEL_BAR_M_S}",
            c.tier,
            c.regime
        );
        worst = (worst.0.max(wr), worst.1.max(wv));
    }
    eprintln!(
        "overall worst |dr| = {:.4} m, |dv| = {:.3e} m/s",
        worst.0, worst.1
    );
}

#[test]
fn negative_controls_miss_the_orekit_tesseral_states() {
    // Pre-registered sensitivity: a frozen Earth and a zonal-only model must both miss the
    // G70 LEO 24 h state by more than 100 m, or the comparison above would not discriminate.
    let cases = cases();
    let c = cases
        .iter()
        .find(|c| c.tier == "G70" && c.regime == "LEO")
        .expect("G70 LEO case");
    let (_, r_ref, _) = *c.states.last().unwrap();
    // Frozen Earth: the field evaluated in the epoch orientation for the whole day.
    let gp = Geopotential::egm2008(c.nmax);
    let m0 = gp.inertial_to_earth_fixed(c.epoch);
    let mv = |m: &[[f64; 3]; 3], x: Vec3| {
        [
            m[0][0] * x[0] + m[0][1] * x[1] + m[0][2] * x[2],
            m[1][0] * x[0] + m[1][1] * x[1] + m[1][2] * x[2],
            m[2][0] * x[0] + m[2][1] * x[1] + m[2][2] * x[2],
        ]
    };
    let m0t = [
        [m0[0][0], m0[1][0], m0[2][0]],
        [m0[0][1], m0[1][1], m0[2][1]],
        [m0[0][2], m0[1][2], m0[2][2]],
    ];
    let f = |_t: f64, y: &[f64]| {
        let a = mv(&m0t, gp.field.acceleration(mv(&m0, [y[0], y[1], y[2]])));
        vec![y[3], y[4], y[5], a[0], a[1], a[2]]
    };
    let y0 = [c.r0[0], c.r0[1], c.r0[2], c.v0[0], c.v0[1], c.v0[2]];
    let sol = integrate_dopri(&f, 0.0, &y0, 86_400.0, 60.0, &tol());
    let miss_frozen = dist([sol.y[0], sol.y[1], sol.y[2]], r_ref);
    eprintln!("frozen-Earth control misses by {miss_frozen:.1} m");
    assert!(miss_frozen > CONTROL_MIN_MISS_M);
    let zonal = run(c, |e| {
        ForceModel {
            zonals: Some(&EARTH_ZONALS_J2_J6),
            ..ForceModel::with_j2()
        }
        .third_body(false, false, e)
    });
    let miss_zonal = dist(zonal.last().unwrap().0, r_ref);
    eprintln!("zonal-only control misses by {miss_zonal:.1} m");
    assert!(miss_zonal > CONTROL_MIN_MISS_M);
}
