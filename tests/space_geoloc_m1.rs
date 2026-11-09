// SPDX-License-Identifier: AGPL-3.0-only
//! M1: space RF geolocation accuracy (`kshana::space_geoloc`), against the bars of
//! `docs/design/evidence/m1-space-rf-geolocation/PREREGISTRATION.md` (signed 3 November 2026)
//! with the readings of `xval/m1-geolocation/README.md`. The B2 transcription
//! (`reference.csv`) and the B1 oracle were committed before this code.
//!
//! * B1: the engine against `xval/m1-geolocation/oracle_b1.json` (numpy, no shared code).
//! * B2: the engine's bound with receiver-location errors against the 25 values of Cao et al.
//!   2015, Fig. 1 (plot readings, 20 %).
//! * B3: F3, AIS, P1-P10, 1000 seeded trials each, Gauss-Newton from 20 km north.
//! * B4: multi-pass fusion is information-additive and never worsens DRMS.
//! * B5: additivity (a new module; existing outputs unchanged by construction).
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

#![allow(clippy::needless_range_loop)]

use kshana::space_geoloc::{
    ccrlb_with_receiver_errors, constrained_position_bound, ellipsoid_gradient, emitter_class,
    f3_measurements, f3_sigmas, fused_fisher, horizontal_error_m, one_pass, passes, solve_f3,
    Method, SsoOrbit, ALTITUDE_M, POINTS,
};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};

const ORACLE_B1: &str = include_str!("../xval/m1-geolocation/oracle_b1.json");
const REFERENCE: &str =
    include_str!("../docs/design/evidence/m1-space-rf-geolocation/reference.csv");

/// The engine's 60 B1 cases, in the oracle's order.
fn engine_b1() -> Vec<serde_json::Value> {
    let orbit = SsoOrbit::new(ALTITUDE_M);
    let mut out = Vec::new();
    for (pi, &(lat, lon)) in POINTS.iter().enumerate() {
        let st = kshana::space_geoloc::site(lat, lon);
        for method in [Method::S1, Method::F2, Method::F3] {
            for cname in ["ais", "jammer30"] {
                let cls = emitter_class(cname).unwrap();
                let mut row = serde_json::json!({"point": format!("P{}", pi + 1),
                    "method": method.as_str(), "class": cname});
                match one_pass(&orbit, &st, method, &cls) {
                    None => row["no_pass"] = serde_json::json!(true),
                    Some((e, t0, n)) => {
                        row["pass_start_s"] = serde_json::json!(t0);
                        row["epochs"] = serde_json::json!(n);
                        row["a_m"] = serde_json::json!(e.a_m);
                        row["b_m"] = serde_json::json!(e.b_m);
                        row["drms_m"] = serde_json::json!(e.drms_m);
                        row["orient_rad"] = serde_json::json!(e.orient_rad);
                    }
                }
                out.push(row);
            }
        }
    }
    out
}

#[test]
fn b1_the_engine_matches_the_independent_recomputation() {
    let oracle: serde_json::Value = serde_json::from_str(ORACLE_B1).unwrap();
    let orbit = SsoOrbit::new(ALTITUDE_M);
    let inc = oracle["inclination_deg"].as_f64().unwrap();
    assert!((orbit.inc_rad.to_degrees() - inc).abs() < 1e-9);
    let want = oracle["cases"].as_array().unwrap();
    let got = engine_b1();
    assert_eq!(got.len(), want.len());
    let (mut worst_rel, mut worst_ori) = (0.0f64, 0.0f64);
    let mut miss = Vec::new();
    for (g, w) in got.iter().zip(want) {
        assert_eq!(
            (&g["point"], &g["method"], &g["class"]),
            (&w["point"], &w["method"], &w["class"])
        );
        let id = format!("{} {} {}", g["point"], g["method"], g["class"]);
        if g.get("no_pass").is_some() || w.get("no_pass").is_some() {
            if g.get("no_pass") != w.get("no_pass") {
                miss.push(format!("{id}: pass existence differs"));
            }
            continue;
        }
        if g["pass_start_s"] != w["pass_start_s"] || g["epochs"] != w["epochs"] {
            miss.push(format!(
                "{id}: pass {} {} vs {} {}",
                g["pass_start_s"], g["epochs"], w["pass_start_s"], w["epochs"]
            ));
        }
        for k in ["a_m", "b_m", "drms_m"] {
            let (x, y) = (g[k].as_f64().unwrap(), w[k].as_f64().unwrap());
            let rel = (x - y).abs() / y.abs();
            worst_rel = worst_rel.max(rel);
            if rel > 1e-6 {
                miss.push(format!("{id} {k}: {x} vs {y} ({rel:.2e})"));
            }
        }
        let (a, b) = (w["a_m"].as_f64().unwrap(), w["b_m"].as_f64().unwrap());
        if a / b > 1.01 {
            let d = (g["orient_rad"].as_f64().unwrap() - w["orient_rad"].as_f64().unwrap())
                .rem_euclid(std::f64::consts::PI);
            let d = d.min(std::f64::consts::PI - d);
            worst_ori = worst_ori.max(d);
            if d > 1e-6 {
                miss.push(format!("{id} orientation: {d:.2e} rad"));
            }
        }
    }
    eprintln!("B1: {} cases; worst relative {worst_rel:.3e}, worst orientation {worst_ori:.3e} rad; misses {}", got.len(), miss.len());
    for m in miss.iter().take(10) {
        eprintln!("  {m}");
    }
    assert!(miss.is_empty(), "B1 NOT MET: {} misses", miss.len());
}

/// The B2 case of reading 12: S (km) for (δt s, δf Hz, δs m, δṡ m/s).
fn cao_s_km(dt: f64, df: f64, ds: f64, dsd: f64) -> f64 {
    let (c, f, rs, r) = (3e8, 14e9, 42_164e3, 6_367.287e3);
    let sph = |rad: f64, lon: f64, lat: f64| {
        let (lo, la) = (lon.to_radians(), lat.to_radians());
        [
            rad * la.cos() * lo.cos(),
            rad * la.cos() * lo.sin(),
            rad * la.sin(),
        ]
    };
    let s = [
        sph(rs, -50.0, 2.0),
        sph(rs, -47.0, 0.0),
        sph(rs, -53.0, 0.0),
        sph(rs, -51.5, 3.0),
    ];
    let kmh = |x: [f64; 3]| [x[0] / 3.6, x[1] / 3.6, x[2] / 3.6];
    let v = [
        kmh([-15.48, -13.0, -772.04]),
        kmh([-30.78, -28.70, 972.72]),
        kmh([-0.054, -0.041, -38.60]),
        kmh([-119.62, -95.15, 1920.34]),
    ];
    let u = sph(r, -75.9, 45.35);
    let q = |sig: f64| -> Vec<Vec<f64>> {
        (0..3)
            .map(|i| {
                (0..3)
                    .map(|j| sig * sig * if i == j { 1.0 } else { 0.5 })
                    .collect()
            })
            .collect()
    };
    let (qt, qf) = (q(c * dt), q(c * df / f));
    let mut qm = vec![vec![0.0; 6]; 6];
    for i in 0..3 {
        for j in 0..3 {
            qm[i][j] = qt[i][j];
            qm[3 + i][3 + j] = qf[i][j];
        }
    }
    let qb: Vec<Vec<f64>> = (0..24)
        .map(|i| {
            (0..24)
                .map(|j| {
                    if i != j {
                        0.0
                    } else if i < 12 {
                        ds * ds
                    } else {
                        dsd * dsd
                    }
                })
                .collect()
        })
        .collect();
    let rn = (u[0] * u[0] + u[1] * u[1] + u[2] * u[2]).sqrt();
    let cr =
        ccrlb_with_receiver_errors(&s, &v, u, &qm, &qb, [u[0] / rn, u[1] / rn, u[2] / rn]).unwrap();
    (cr[0][0] + cr[1][1] + cr[2][2]).sqrt() / 1e3
}

/// The 25 reference values and the engine's, in reference order: (id, x, reference, engine).
fn b2_rows() -> Vec<(String, f64, f64, f64)> {
    let mut out = Vec::new();
    let (mut ka, mut kb, mut kc) = (0, 0, 0);
    for line in REFERENCE.lines().filter(|l| l.starts_with("value,")) {
        let id = line.split(',').nth(1).unwrap().to_string();
        let val: f64 = line.rsplit(',').nth(3).unwrap().parse().unwrap();
        let (x, s) = match &id[..5] {
            "fig1a" => {
                ka += 1;
                let dt = 0.1 * ka as f64;
                (dt, cao_s_km(dt * 1e-6, 20.0, 1e3, 0.05))
            }
            "fig1b" => {
                kb += 1;
                let df = [10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0][kb - 1];
                (df, cao_s_km(0.1e-6, df, 1e3, 0.05))
            }
            _ => {
                kc += 1;
                let ds = 0.25 * kc as f64;
                (ds, cao_s_km(0.1e-6, 20.0, ds * 1e3, 0.05))
            }
        };
        out.push((id, x, val, s));
    }
    out
}

#[test]
fn b2_the_published_case_is_reproduced_within_20_percent() {
    let rows = b2_rows();
    assert_eq!(rows.len(), 25);
    let mut worst = 0.0f64;
    let mut miss = Vec::new();
    for (id, x, refv, eng) in &rows {
        let rel = (eng - refv) / refv;
        worst = worst.max(rel.abs());
        eprintln!(
            "B2 {id} x={x}: reference {refv:.2} km, engine {eng:.3} km ({:+.1} %)",
            100.0 * rel
        );
        if rel.abs() > 0.20 {
            miss.push(format!("{id}: {eng:.3} vs {refv:.2}"));
        }
    }
    eprintln!("B2: worst {:.1} %", 100.0 * worst);
    assert!(miss.is_empty(), "B2 NOT MET: {miss:?}");
}

#[test]
#[cfg_attr(debug_assertions, ignore = "M1 B3 Monte Carlo: run in release")]
fn b3_the_solver_attains_the_bound_for_f3_ais() {
    let orbit = SsoOrbit::new(ALTITUDE_M);
    let cls = emitter_class("ais").unwrap();
    let mut miss = Vec::new();
    for (pi, &(lat, lon)) in POINTS.iter().enumerate() {
        let st = kshana::space_geoloc::site(lat, lon);
        let (e, _, _) = one_pass(&orbit, &st, Method::F3, &cls).unwrap();
        let ps = passes(&orbit, &st, Method::F3);
        let best = kshana::space_geoloc::best_pass(&ps).unwrap();
        let ts: Vec<f64> = best.iter().map(|x| x.0).collect();
        let truth = f3_measurements(&orbit, &ts, st.p);
        let sig = f3_sigmas(&orbit, &ts, st.p, &cls);
        let mut rng = ChaCha8Rng::seed_from_u64(4100 + (pi as u64 + 1));
        // 20 km due north along the ellipsoid: a meridian arc of 20 km at this latitude.
        let e2 = 1.0 / 298.257_223_563 * (2.0 - 1.0 / 298.257_223_563);
        let w = (1.0 - e2 * st.lat_rad.sin().powi(2)).sqrt();
        let m_rad = 6_378_137.0 * (1.0 - e2) / (w * w * w);
        let start = (st.lat_rad + 20e3 / m_rad, st.lon_rad);
        let (mut sq, mut n_ok) = (0.0, 0usize);
        for _ in 0..1000 {
            let z: Vec<f64> = truth
                .iter()
                .zip(&sig)
                .map(|(t, s)| {
                    let g: f64 = StandardNormal.sample(&mut rng);
                    t + s * g
                })
                .collect::<Vec<f64>>();
            let ((la, lo), ok) = solve_f3(&orbit, &ts, &z, &sig, start);
            if ok {
                n_ok += 1;
                let d = horizontal_error_m(&st, la, lo);
                sq += d * d;
            }
        }
        let rms = (sq / n_ok.max(1) as f64).sqrt();
        let ratio = rms / e.drms_m;
        eprintln!(
            "B3 P{}: DRMS {:.3} m, empirical RMS {:.3} m, ratio {ratio:.4}, converged {n_ok}/1000",
            pi + 1,
            e.drms_m,
            rms
        );
        if !(0.9..=1.25).contains(&ratio) || n_ok < 990 {
            miss.push(format!("P{}: ratio {ratio:.4}, converged {n_ok}", pi + 1));
        }
    }
    assert!(miss.is_empty(), "B3 NOT MET: {miss:?}");
}

#[test]
#[cfg_attr(debug_assertions, ignore = "M1 B4: run in release")]
fn b4_multi_pass_fusion_is_information_additive() {
    let orbit = SsoOrbit::new(ALTITUDE_M);
    let cls = emitter_class("ais").unwrap();
    let mut miss = Vec::new();
    let mut worst_add = 0.0f64;
    for (pi, &(lat, lon)) in POINTS.iter().enumerate() {
        let st = kshana::space_geoloc::site(lat, lon);
        let grad = ellipsoid_gradient(st.p);
        for method in [Method::S1, Method::F2] {
            let ps = passes(&orbit, &st, method);
            let mut prev = f64::INFINITY;
            let mut drms_all = Vec::new();
            for m in 1..=ps.len() {
                let (joint, summed) = fused_fisher(&orbit, &st, method, &cls, &ps, m);
                // The joint's position information with every carrier eliminated (diagonal
                // carrier block) against the sum of the per-pass eliminations.
                let mut schur = [[0.0; 3]; 3];
                for a in 0..3 {
                    for b in 0..3 {
                        let mut v = joint[a][b];
                        for k in 3..joint.len() {
                            v -= joint[a][k] * joint[k][b] / joint[k][k];
                        }
                        schur[a][b] = v;
                    }
                }
                let scale = summed.iter().flatten().fold(0.0f64, |x, y| x.max(y.abs()));
                let diff = (0..3)
                    .flat_map(|a| (0..3).map(move |b| (a, b)))
                    .map(|(a, b)| (schur[a][b] - summed[a][b]).abs())
                    .fold(0.0f64, f64::max)
                    / scale;
                worst_add = worst_add.max(diff);
                if diff > 1e-12 {
                    miss.push(format!(
                        "P{} {} M={m}: additivity {diff:.2e}",
                        pi + 1,
                        method.as_str()
                    ));
                }
                let c = constrained_position_bound(&joint, grad).unwrap();
                let drms = kshana::space_geoloc::ellipse(&c, &st).drms_m;
                if drms > prev * (1.0 + 1e-9) {
                    miss.push(format!(
                        "P{} {} M={m}: DRMS {drms} > {prev}",
                        pi + 1,
                        method.as_str()
                    ));
                }
                prev = drms;
                drms_all.push(drms);
            }
            eprintln!(
                "B4 P{} {}: {} passes, DRMS {:.3} m (one) to {:.3} m (all)",
                pi + 1,
                method.as_str(),
                ps.len(),
                drms_all.first().copied().unwrap_or(f64::NAN),
                drms_all.last().copied().unwrap_or(f64::NAN)
            );
        }
    }
    eprintln!(
        "B4: worst additivity {worst_add:.3e}; misses {}",
        miss.len()
    );
    assert!(miss.is_empty(), "B4 NOT MET: {miss:?}");
}

/// B5: the change adds a module and its line in `lib.rs`; the existing geolocation tests run
/// unchanged in this suite (`tests/geolocation*.rs`, `src/geolocation.rs` unit tests).
#[test]
fn b5_the_ground_network_functions_are_untouched() {
    let rx = [[0.0, 0.0, 0.0], [10_000.0, 0.0, 0.0], [0.0, 10_000.0, 0.0]];
    let j = kshana::geolocation::tdoa_fisher(&rx, [3_000.0, 4_000.0, 0.0], 1e-8);
    assert!(j[0][0] > 0.0);
}
