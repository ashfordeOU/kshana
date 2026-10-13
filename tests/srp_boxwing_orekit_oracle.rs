// SPDX-License-Identifier: AGPL-3.0-only
//! Box-wing and ECOM2 SRP against Orekit 12.2 (DS-PA-14).
//!
//! Pre-registered in `xval/srp-boxwing-orekit/PREREGISTRATION.md` (committed alone before
//! the Orekit driver existed); results in `xval/srp-boxwing-orekit/RESULTS.md`. The fixture
//! `tests/fixtures/srp_boxwing_orekit_oracle/srp_boxwing_orekit_oracle.txt` is the output of
//! `java/BoxWingDriver.java` (Orekit 12.2, Hipparchus 3.1, run, not vendored); see its
//! NOTICE.md.

use kshana::forces::conical_shadow;
use kshana::srp_boxwing::{
    boxwing_accel, boxwing_partials, ecom2_accel, ecom2_partials, gnss_yaw_steering, BoxWing,
    Ecom2, Mat3, PanelKind,
};
use std::collections::HashMap;

type V3 = [f64; 3];

const FIXTURE: &str =
    include_str!("fixtures/srp_boxwing_orekit_oracle/srp_boxwing_orekit_oracle.txt");

fn v3(s: &str) -> V3 {
    let p: Vec<f64> = s
        .trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect();
    assert_eq!(p.len(), 3, "bad vector {s:?}");
    [p[0], p[1], p[2]]
}
fn mat(s: &str) -> Mat3 {
    let p: Vec<f64> = s
        .trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect();
    assert_eq!(p.len(), 9);
    [[p[0], p[1], p[2]], [p[3], p[4], p[5]], [p[6], p[7], p[8]]]
}
fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(a: V3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// One fixture panel row: kind, area, normal or axis, α, ρ, δ.
type PanelRow = (String, f64, V3, f64, f64, f64);

struct Geom {
    r: V3,
    v: V3,
    s: V3,
}

#[derive(Default)]
struct Fixture {
    panels: HashMap<String, Vec<PanelRow>>,
    mass: HashMap<String, f64>,
    geoms: Vec<Geom>,
    att: HashMap<(usize, String), Mat3>,
    a1: Vec<(String, usize, String, V3)>,
    a2: Vec<(String, usize, f64, V3, V3)>,
    c: Vec<(String, usize, V3)>,
    d: Vec<(String, usize, usize, V3, V3)>,
    e: Vec<(usize, usize, V3)>,
    dense: [f64; 9],
}

fn fixture() -> Fixture {
    let mut f = Fixture::default();
    for line in FIXTURE
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
    {
        let parts: Vec<&str> = line.split('|').map(str::trim).collect();
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        match head[0] {
            "PANEL" => f.panels.entry(head[1].into()).or_default().push((
                parts[1].into(),
                parts[2].parse().unwrap(),
                v3(parts[3]),
                parts[4].parse().unwrap(),
                parts[5].parse().unwrap(),
                parts[6].parse().unwrap(),
            )),
            "MASS" => {
                f.mass.insert(head[1].into(), parts[1].parse().unwrap());
            }
            "GEOM" => {
                assert_eq!(head[1].parse::<usize>().unwrap(), f.geoms.len());
                f.geoms.push(Geom {
                    r: v3(parts[2]),
                    v: v3(parts[3]),
                    s: v3(parts[4]),
                });
            }
            "ATT" => {
                f.att
                    .insert((head[1].parse().unwrap(), head[2].into()), mat(parts[1]));
            }
            "A1" => f.a1.push((
                head[1].into(),
                head[2].parse().unwrap(),
                head[3].into(),
                v3(parts[1]),
            )),
            "A2" => f.a2.push((
                head[1].into(),
                head[2].parse().unwrap(),
                parts[1].parse().unwrap(),
                v3(parts[2]),
                v3(parts[3]),
            )),
            "C" => {
                f.c.push((head[1].into(), head[2].parse().unwrap(), v3(parts[1])))
            }
            "D" => f.d.push((
                head[1].into(),
                head[2].parse().unwrap(),
                head[3].parse().unwrap(),
                v3(parts[1]),
                v3(parts[2]),
            )),
            "E" => f.e.push((
                head[1].parse().unwrap(),
                head[2].parse().unwrap(),
                v3(parts[1]),
            )),
            "EDENSE" => {
                let p: Vec<f64> = parts[1]
                    .split(',')
                    .map(|x| x.trim().parse().unwrap())
                    .collect();
                f.dense.copy_from_slice(&p);
            }
            other => panic!("unknown fixture line kind {other}"),
        }
    }
    f
}

fn model(name: &str) -> BoxWing {
    match name {
        "foc" => BoxWing::galileo_foc(),
        "iov" => BoxWing::galileo_iov(),
        "iov_eol" => BoxWing::galileo_iov_eol(),
        _ => unreachable!(),
    }
}

const MODELS: [&str; 3] = ["foc", "iov", "iov_eol"];

/// Both sides use the same inputs: the driver's panel tables equal kshana's `BoxWing`.
#[test]
fn the_driver_used_kshanas_panel_tables() {
    let f = fixture();
    for m in MODELS {
        let bw = model(m);
        let t = &f.panels[m];
        assert_eq!(t.len(), bw.panels.len(), "{m}: panel count");
        assert_eq!(f.mass[m], bw.mass_kg, "{m}: mass");
        for (i, (p, (kind, area, dir, a, rho, delta))) in bw.panels.iter().zip(t).enumerate() {
            let (k, d) = match p.kind {
                PanelKind::Fixed => ("fixed", p.normal_body),
                PanelKind::SunPointing { axis_body } => ("wing", axis_body),
            };
            assert_eq!(kind, k, "{m} panel {i}");
            assert_eq!(*area, p.area_m2, "{m} panel {i}");
            assert_eq!(*dir, d, "{m} panel {i}");
            assert_eq!(
                (*a, *rho, *delta),
                (p.absorption, p.specular, p.diffuse),
                "{m} panel {i}"
            );
        }
    }
    assert_eq!(f.geoms.len(), 252);
}

/// A1: flat-plate sum with the same attitude and flux, `|Δ| ≤ 1e-12·|a|`.
#[test]
fn a1_flat_plate_sum_matches_orekit() {
    let f = fixture();
    let mut worst = 0.0_f64;
    let mut n = 0;
    for (m, g, which, a) in &f.a1 {
        let geo = &f.geoms[*g];
        let att = f.att[&(*g, which.clone())];
        let k = boxwing_accel(geo.r, geo.s, att, &model(m), 1.0);
        let rel = norm(sub(k, *a)) / norm(*a);
        worst = worst.max(rel);
        n += 1;
        assert!(rel <= 1e-12, "A1 {m} g{g} {which}: rel {rel:e}");
    }
    assert_eq!(n, 3 * (252 + 100));
    println!("A1: {n} cases, worst |Δ|/|a| = {worst:e}");
}

/// A2 end to end (full sun only) and the A3 negative control.
#[test]
fn a2_end_to_end_matches_orekit_and_a3_control_discriminates() {
    let f = fixture();
    let (mut worst, mut ctrl_min, mut n, mut lit_mismatch) = (0.0_f64, f64::INFINITY, 0, 0);
    for (m, g, ratio, a, a_default) in &f.a2 {
        let geo = &f.geoms[*g];
        if conical_shadow(geo.r, geo.s) < 1.0 {
            continue;
        }
        if *ratio != 1.0 {
            lit_mismatch += 1;
        }
        let att = gnss_yaw_steering(geo.r, geo.v, geo.s);
        let k = boxwing_accel(geo.r, geo.s, att, &model(m), 1.0);
        let rel = norm(sub(k, *a)) / norm(*a);
        worst = worst.max(rel);
        ctrl_min = ctrl_min.min(norm(sub(k, *a_default)) / norm(*a_default));
        n += 1;
        assert!(rel <= 1e-11, "A2 {m} g{g}: rel {rel:e}");
    }
    assert_eq!(
        lit_mismatch, 0,
        "Orekit lighting ratio != 1 where kshana is in full sun"
    );
    assert!(
        ctrl_min > 1e-3,
        "A3: control does not discriminate ({ctrl_min:e})"
    );
    println!("A2: {n} full-sun cases, worst {worst:e}; A3 smallest control gap {ctrl_min:e}");
}

/// B: nominal yaw steering, every element within 1e-12 of Orekit's GenericGNSS.
#[test]
fn b_nominal_yaw_matches_orekit_generic_gnss() {
    let f = fixture();
    let (mut worst, mut excluded) = (0.0_f64, 0);
    for (g, geo) in f.geoms.iter().enumerate() {
        let sh = sub(geo.s, geo.r);
        let c = (sh[0] * geo.r[0] + sh[1] * geo.r[1] + sh[2] * geo.r[2]) / (norm(sh) * norm(geo.r));
        if c.abs() > 0.5_f64.to_radians().cos() {
            excluded += 1;
            continue;
        }
        let k = gnss_yaw_steering(geo.r, geo.v, geo.s);
        let o = f.att[&(g, "yaw".to_string())];
        for i in 0..3 {
            for j in 0..3 {
                let d = (k[i][j] - o[i][j]).abs();
                worst = worst.max(d);
                assert!(d <= 1e-12, "B g{g} [{i}][{j}]: {d:e}");
            }
        }
    }
    println!("B: worst element {worst:e}, {excluded} excluded near the singularity");
}

/// C: the radiation-factor partial against Orekit's Gradient derivative.
#[test]
fn c_radiation_factor_partial_matches_orekit() {
    let f = fixture();
    let mut worst = 0.0_f64;
    for (m, g, dk) in &f.c {
        let geo = &f.geoms[*g];
        let att = f.att[&(*g, "yaw".to_string())];
        let p = boxwing_partials(geo.r, geo.s, att, &model(m), 1.0, 1.0);
        let rel = norm(sub(p.d_scale, *dk)) / norm(*dk);
        worst = worst.max(rel);
        assert!(rel <= 1e-12, "C {m} g{g}: {rel:e}");
    }
    println!("C: worst {worst:e}");
}

/// D: per-panel ρ and δ partials against central differences of Orekit.
#[test]
fn d_panel_partials_match_orekit_finite_differences() {
    let f = fixture();
    let mut scale: HashMap<(String, usize), f64> = HashMap::new();
    for (m, g, which, a) in &f.a1 {
        if which == "yaw" {
            scale.insert((m.clone(), *g), norm(*a));
        }
    }
    let (mut worst, mut n) = (0.0_f64, 0);
    for (m, g, i, fd_rho, fd_delta) in &f.d {
        let geo = &f.geoms[*g];
        let att = f.att[&(*g, "yaw".to_string())];
        let p = boxwing_partials(geo.r, geo.s, att, &model(m), 1.0, 1.0);
        let a = scale[&(m.clone(), *g)];
        for (k, o, what) in [
            (p.d_specular[*i], fd_rho, "rho"),
            (p.d_diffuse[*i], fd_delta, "delta"),
        ] {
            let rel = norm(sub(k, *o)) / a;
            worst = worst.max(rel);
            assert!(rel <= 1e-9, "D {m} g{g} panel {i} {what}: {rel:e}");
        }
        n += 1;
    }
    println!("D: {n} panel cases, worst |Δ|/|a| = {worst:e}");
}

/// E: ECOM2 acceleration and partials against Orekit's ECOM2(2, 1).
#[test]
fn e_ecom2_matches_orekit() {
    let f = fixture();
    let (mut worst_a, mut worst_p) = (0.0_f64, 0.0_f64);
    for (g, k, a) in &f.e {
        let geo = &f.geoms[*g];
        let mut q = [0.0; 9];
        if *k < 9 {
            q[*k] = 1e-9;
        } else {
            q = f.dense;
        }
        let ka = ecom2_accel(geo.r, geo.v, geo.s, &Ecom2::from_array(q), 1.0);
        let l1: f64 = q.iter().map(|x| x.abs()).sum();
        let rel = norm(sub(ka, *a)) / l1;
        worst_a = worst_a.max(rel);
        assert!(rel <= 1e-12, "E g{g} vector {k}: {rel:e}");
        if *k < 9 {
            let part = ecom2_partials(geo.r, geo.v, geo.s, 1.0)[*k];
            let d = norm(sub(part, [a[0] / 1e-9, a[1] / 1e-9, a[2] / 1e-9]));
            worst_p = worst_p.max(d);
            assert!(d <= 1e-12, "E partial g{g} {k}: {d:e}");
        }
    }
    println!("E: worst |Δ|/Σ|p| = {worst_a:e}, worst partial {worst_p:e}");
}
