// SPDX-License-Identifier: AGPL-3.0-only
//! C3 v2 (`docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION-v2.md`, readings in
//! `xval/c3-capstone-nrho-v2/README.md`): span G's windows, the per-window radiation-pressure estimate (M3), the
//! scored runs and the sensitivity analysis. Data from `xval/c3-capstone-nrho-v2/fetch_data_v2.sh` (G) and v1's
//! `fetch_data.sh` (F), both into <data-dir>.
//!
//!   cargo run --release --example c3_run_v2 -- windows     <data-dir>   # G1-G3
//!   cargo run --release --example c3_run_v2 -- estimate    <data-dir>   # k per window (first 78 samples)
//!   cargo run --release --example c3_run_v2 -- score       <data-dir>   # the scored and reported runs, once
//!   cargo run --release --example c3_run_v2 -- sensitivity <data-dir>   # +/-10 m, +/-1 cm/s
//!
//! MODELLED; advisory software.

use kshana::c3_force::C3Model;
use kshana::ephem_provider::KernelEphemeris;
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::precise_od::{propagate, propagate_samples, ForceModel};
use serde_json::{json, Value};
use std::sync::Arc;

type V3 = [f64; 3];
struct S {
    jd: f64,
    r: V3,
    v: V3,
}

const FIX: &str = "tests/fixtures/mission_thread_lunar";
const OUT: &str = "xval/c3-capstone-nrho-v2";
const LEN: usize = 157;
const MANOEUVRE_M: f64 = 100.0;
const END_POS_BAR_M: f64 = 25_000.0;
const PERI_BAR_M: f64 = 10_000.0;

fn norm(a: V3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn sub(a: V3, b: V3) -> V3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn cross(a: V3, b: V3) -> V3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn parse(path: &str) -> Vec<S> {
    let v: Value = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    let t = v["result"].as_str().unwrap();
    let (a, b) = (t.find("$$SOE").unwrap(), t.find("$$EOE").unwrap());
    t[a + 5..b]
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty())
        .map(|l| {
            let f: Vec<f64> = l
                .split(',')
                .map(str::trim)
                .filter_map(|x| x.parse::<f64>().ok())
                .collect();
            S {
                jd: f[0],
                r: [f[1] * 1e3, f[2] * 1e3, f[3] * 1e3],
                v: [f[4] * 1e3, f[5] * 1e3, f[6] * 1e3],
            }
        })
        .collect()
}

fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        h_min: 1e-3,
        h_max: 60.0,
    }
}

fn periapsis(r: V3, v: V3, mu: f64) -> f64 {
    let h = cross(r, v);
    let rn = norm(r);
    let vxh = cross(v, h);
    let e = norm([
        vxh[0] / mu - r[0] / rn,
        vxh[1] / mu - r[1] / rn,
        vxh[2] / mu - r[2] / rn,
    ]);
    (h[0] * h[0] + h[1] * h[1] + h[2] * h[2]) / mu / (1.0 + e)
}

fn field() -> SphericalHarmonicField {
    let t = std::fs::read_to_string(format!("{FIX}/jggrx_0660b_sha_to150.tab")).unwrap();
    SphericalHarmonicField::from_shadr(&t, 150).unwrap()
}

fn kernel(dir: &str) -> Arc<KernelEphemeris> {
    Arc::new(KernelEphemeris::open(std::path::Path::new(&format!("{dir}/de440s.bsp"))).unwrap())
}

/// The window's numbers: end position, periapsis radius and maximum 3-D difference (m).
fn window<F: ForceModel>(m: &F, refs: &[S], i0: usize, mu: f64) -> Value {
    let w = &refs[i0..i0 + LEN];
    let times: Vec<f64> = w[1..].iter().map(|s| (s.jd - w[0].jd) * 86_400.0).collect();
    let pos = propagate_samples(m, w[0].r, w[0].v, &times, &tol());
    let max3 = pos
        .iter()
        .zip(&w[1..])
        .map(|(p, s)| norm(sub(*p, s.r)))
        .fold(0.0f64, f64::max);
    let end = &w[LEN - 1];
    let (r, v) = propagate(m, w[0].r, w[0].v, times[LEN - 2], &tol());
    let dpos = norm(sub(r, end.r));
    let dper = (periapsis(r, v, mu) - periapsis(end.r, end.v, mu)).abs();
    json!({
        "start_index": i0, "start_jd_tdb": w[0].jd,
        "end_position_difference_m": dpos, "periapsis_radius_difference_m": dper,
        "max_3d_difference_m": max3,
        "end_position_met": dpos <= END_POS_BAR_M, "periapsis_met": dper <= PERI_BAR_M,
    })
}

fn sse(m: &C3Model, w: &[S]) -> f64 {
    let times: Vec<f64> = w[1..].iter().map(|s| (s.jd - w[0].jd) * 86_400.0).collect();
    propagate_samples(m, w[0].r, w[0].v, &times, &tol())
        .iter()
        .zip(&w[1..])
        .map(|(p, s)| norm(sub(*p, s.r)).powi(2))
        .sum()
}

fn load_json(name: &str) -> Value {
    serde_json::from_str(&std::fs::read_to_string(format!("{OUT}/{name}")).unwrap()).unwrap()
}

const HALF: usize = 78;

/// Golden-section `k` on [0, 0.1] to 1e-5 over the window's first `HALF` samples (v1's procedure).
fn estimate_k(fld: &SphericalHarmonicField, kern: &Arc<KernelEphemeris>, win: &[S]) -> f64 {
    let part = &win[..HALF];
    let cost = |kk: f64| {
        sse(
            &C3Model::m1(fld.clone(), part[0].jd, kern.clone()).with_srp(kk),
            part,
        )
    };
    let g = (5f64.sqrt() - 1.0) / 2.0;
    let (mut lo, mut hi) = (0.0f64, 0.1f64);
    let (mut x1, mut x2) = (hi - g * (hi - lo), lo + g * (hi - lo));
    let (mut f1, mut f2) = (cost(x1), cost(x2));
    while hi - lo > 1e-5 {
        if f1 <= f2 {
            hi = x2;
            x2 = x1;
            f2 = f1;
            x1 = hi - g * (hi - lo);
            f1 = cost(x1);
        } else {
            lo = x1;
            x1 = x2;
            f1 = f2;
            x2 = lo + g * (hi - lo);
            f2 = cost(x2);
        }
    }
    0.5 * (lo + hi)
}

/// Every window of the readings: (name, series, start index).
fn all_windows<'a>(g: &'a [S], f: &'a [S], w0: &'a [S]) -> Vec<(String, &'a [S], usize)> {
    let mut out = Vec::new();
    let wg = load_json("windows_g.json");
    for w in wg["windows"].as_array().unwrap() {
        out.push((
            w["name"].as_str().unwrap().to_string(),
            g,
            w["start_index"].as_u64().unwrap() as usize,
        ));
    }
    let wf: Value = serde_json::from_str(
        &std::fs::read_to_string("xval/c3-capstone-nrho/windows.json").unwrap(),
    )
    .unwrap();
    for w in wf["windows"].as_array().unwrap() {
        out.push((
            w["name"].as_str().unwrap().to_string(),
            f,
            w["start_index"].as_u64().unwrap() as usize,
        ));
    }
    out.push(("W0".to_string(), w0, 145));
    out
}

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let (cmd, dir) = (a[1].as_str(), a[2].as_str());
    let g = parse(&format!("{dir}/g_capstone_horizons.json"));
    // PIN-SCOPE:    the number of hourly states span G must hold (reading 1)
    // PIN-EXCLUDES: their values and every result
    assert_eq!(
        g.len(),
        2137,
        "G is not complete: every G-based run is not run"
    );
    let fld = field();
    let mu = fld.gm;
    let kern = kernel(dir);
    match cmd {
        "windows" => {
            let mut man = Vec::new();
            let mut miss = Vec::new();
            for i in 0..g.len() - 1 {
                let m = C3Model::m1(fld.clone(), g[i].jd, kern.clone());
                let (r, _) = propagate(
                    &m,
                    g[i].r,
                    g[i].v,
                    (g[i + 1].jd - g[i].jd) * 86_400.0,
                    &tol(),
                );
                let d = norm(sub(r, g[i + 1].r));
                miss.push(d);
                if d > MANOEUVRE_M {
                    man.push(i);
                }
            }
            let mut runs = Vec::new();
            let mut s0 = 0;
            for &h in &man {
                runs.push((s0, h + 1 - s0));
                s0 = h + 1;
            }
            runs.push((s0, g.len() - s0));
            let wins: Vec<usize> = runs
                .iter()
                .filter(|r| r.1 >= LEN)
                .map(|r| r.0)
                .take(3)
                .collect();
            let names = ["G1", "G2", "G3"];
            let quiet: Vec<f64> = miss.iter().copied().filter(|d| *d <= MANOEUVRE_M).collect();
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "span": "G", "model": "M1", "threshold_m": MANOEUVRE_M,
                    "manoeuvre_hours": man,
                    "max_quiet_hour_miss_m": quiet.iter().copied().fold(0.0f64, f64::max),
                    "runs": runs.iter().map(|r| json!({"start": r.0, "samples": r.1})).collect::<Vec<_>>(),
                    "windows": wins.iter().zip(names).map(|(i, n)| json!({"name": n, "start_index": i, "start_jd_tdb": g[*i].jd})).collect::<Vec<_>>(),
                    "window_count": wins.len(),
                }))
                .unwrap()
            );
        }
        "estimate" | "score" | "sensitivity" => {
            let f = parse(&format!("{dir}/f_capstone_horizons.json"));
            let w0 = parse(&format!("{FIX}/a2_capstone_horizons.json"));
            let wins = all_windows(&g, &f, &w0);
            let mut out = serde_json::Map::new();
            match cmd {
                "estimate" => {
                    for (n, s, i) in &wins {
                        let win = &s[*i..*i + LEN];
                        out.insert(
                            n.clone(),
                            json!({"start_index": i, "k_m2_per_kg": estimate_k(&fld, &kern, win)}),
                        );
                    }
                }
                "score" => {
                    let kv = load_json("k_v2.json");
                    for (n, s, i) in &wins {
                        let jd = s[*i].jd;
                        let kk = kv[n]["k_m2_per_kg"].as_f64().unwrap();
                        let key = if n.starts_with('G') {
                            "C3-S-v2_M3"
                        } else {
                            "noBar_M3"
                        };
                        out.insert(
                            format!("{key}_{n}"),
                            window(
                                &C3Model::m1(fld.clone(), jd, kern.clone()).with_srp(kk),
                                s,
                                *i,
                                mu,
                            ),
                        );
                        out.insert(
                            format!("noBar_M1_{n}"),
                            window(&C3Model::m1(fld.clone(), jd, kern.clone()), s, *i, mu),
                        );
                    }
                }
                _ => {
                    let kv = load_json("k_v2.json");
                    for (n, s, i) in &wins {
                        let w = &s[*i..*i + LEN];
                        let jd = w[0].jd;
                        let kk = kv[n]["k_m2_per_kg"].as_f64().unwrap();
                        let t_end = (w[LEN - 1].jd - jd) * 86_400.0;
                        for (label, model_k) in [("M1", None), ("M3", Some(kk))] {
                            let mk = || {
                                let m = C3Model::m1(fld.clone(), jd, kern.clone());
                                match model_k {
                                    Some(x) => m.with_srp(x),
                                    None => m,
                                }
                            };
                            let (r0, _) = propagate(&mk(), w[0].r, w[0].v, t_end, &tol());
                            let mut worst = 0.0f64;
                            for c in 0..6 {
                                for sgn in [1.0, -1.0] {
                                    let (mut r, mut v) = (w[0].r, w[0].v);
                                    if c < 3 {
                                        r[c] += sgn * 10.0;
                                    } else {
                                        v[c - 3] += sgn * 0.01;
                                    }
                                    let (rp, _) = propagate(&mk(), r, v, t_end, &tol());
                                    worst = worst.max(norm(sub(rp, r0)));
                                }
                            }
                            out.insert(format!("{label}_{n}"), json!({"max_end_position_change_m": worst,
                                "low_information": label == "M3" && n.starts_with('G') && worst > 12_500.0}));
                        }
                    }
                }
            }
            println!(
                "{}",
                serde_json::to_string_pretty(&Value::Object(out)).unwrap()
            );
        }
        _ => panic!("windows | estimate | score | sensitivity"),
    }
}
