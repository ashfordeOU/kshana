// SPDX-License-Identifier: AGPL-3.0-only
//! C3 procedure steps 4 to 6 (`docs/design/evidence/c3-capstone-nrho-force-model/PREREGISTRATION.md`,
//! readings in `xval/c3-capstone-nrho/README.md`). Data come from `xval/c3-capstone-nrho/fetch_data.sh`.
//!
//!   cargo run --release --example c3_run -- windows  <data-dir>   # step 4: manoeuvre hours and windows
//!   cargo run --release --example c3_run -- estimate <data-dir>   # step 5: k on E
//!   cargo run --release --example c3_run -- score    <data-dir>   # step 6: the scored runs, once
//!
//! Each writes its JSON to standard output. MODELLED; advisory software.

use kshana::c3_force::C3Model;
use kshana::ephem_provider::KernelEphemeris;
use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::lunar_od::LunarForceModel;
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
const OUT: &str = "xval/c3-capstone-nrho";
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

fn main() {
    let a: Vec<String> = std::env::args().collect();
    let (cmd, dir) = (a[1].as_str(), a[2].as_str());
    let f = parse(&format!("{dir}/f_capstone_horizons.json"));
    // PIN-SCOPE:    the number of hourly states the pre-registration's span F holds
    // PIN-EXCLUDES: their values and every result
    assert_eq!(
        f.len(),
        2137,
        "F is not complete: every F-based run is not run"
    );
    let fld = field();
    let mu = fld.gm;
    let k = kernel(dir);
    match cmd {
        "windows" => {
            let mut man = Vec::new();
            let mut miss = Vec::new();
            for i in 0..f.len() - 1 {
                let m = C3Model::m1(fld.clone(), f[i].jd, k.clone());
                let (r, _) = propagate(
                    &m,
                    f[i].r,
                    f[i].v,
                    (f[i + 1].jd - f[i].jd) * 86_400.0,
                    &tol(),
                );
                let d = norm(sub(r, f[i + 1].r));
                miss.push(d);
                if d > MANOEUVRE_M {
                    man.push(i);
                }
            }
            // Maximal runs of samples with no manoeuvre hour between any two of them.
            let mut runs = Vec::new();
            let mut s0 = 0;
            for &h in &man {
                runs.push((s0, h + 1 - s0));
                s0 = h + 1;
            }
            runs.push((s0, f.len() - s0));
            let wins: Vec<usize> = runs
                .iter()
                .filter(|r| r.1 >= LEN)
                .map(|r| r.0)
                .take(3)
                .collect();
            let names = ["E", "H1", "H2"];
            let quiet: Vec<f64> = miss.iter().copied().filter(|d| *d <= MANOEUVRE_M).collect();
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "step": 4, "model": "M1", "threshold_m": MANOEUVRE_M,
                    "manoeuvre_hours": man,
                    "max_quiet_hour_miss_m": quiet.iter().copied().fold(0.0f64, f64::max),
                    "runs": runs.iter().map(|r| json!({"start": r.0, "samples": r.1})).collect::<Vec<_>>(),
                    "windows": wins.iter().zip(names).map(|(i, n)| json!({"name": n, "start_index": i, "start_jd_tdb": f[*i].jd})).collect::<Vec<_>>(),
                    "window_count": wins.len(),
                }))
                .unwrap()
            );
        }
        "estimate" => {
            let w = load_json("windows.json");
            let e = w["windows"][0]["start_index"].as_u64().unwrap() as usize;
            let win = &f[e..e + LEN];
            let cost = |kk: f64| {
                sse(
                    &C3Model::m1(fld.clone(), win[0].jd, k.clone()).with_srp(kk),
                    win,
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
            let kk = 0.5 * (lo + hi);
            let s = cost(kk);
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "step": 5, "window": "E", "start_index": e,
                    "k_m2_per_kg": kk, "interval": [lo, hi],
                    "rms_3d_residual_m": (s / (LEN - 1) as f64).sqrt(),
                    "rms_3d_residual_m1_m": (sse(&C3Model::m1(fld.clone(), win[0].jd, k.clone()), win) / (LEN - 1) as f64).sqrt(),
                }))
                .unwrap()
            );
        }
        "score" => {
            let w = load_json("windows.json");
            let kk = load_json("k.json")["k_m2_per_kg"].as_f64().unwrap();
            let w0 = parse(&format!("{FIX}/a2_capstone_horizons.json"));
            let mut out = serde_json::Map::new();
            let i0 = 145;
            out.insert(
                "C3-R_M1_W0".into(),
                window(&C3Model::m1(fld.clone(), w0[i0].jd, k.clone()), &w0, i0, mu),
            );
            let mut h = Vec::new();
            for win in w["windows"].as_array().unwrap() {
                let n = win["name"].as_str().unwrap();
                let i = win["start_index"].as_u64().unwrap() as usize;
                let jd = f[i].jd;
                let m1 = window(&C3Model::m1(fld.clone(), jd, k.clone()), &f, i, mu);
                out.insert(format!("C3-H_M1_{n}"), m1.clone());
                h.push(m1);
                out.insert(
                    format!("noBar_A2_{n}"),
                    window(&C3Model::a2(fld.clone(), jd), &f, i, mu),
                );
                out.insert(
                    format!("noBar_A2analytic_{n}"),
                    window(
                        &LunarForceModel::new(fld.clone(), jd).relativity(),
                        &f,
                        i,
                        mu,
                    ),
                );
                if n != "E" {
                    out.insert(
                        format!("C3-S_M2_{n}"),
                        window(
                            &C3Model::m1(fld.clone(), jd, k.clone()).with_srp(kk),
                            &f,
                            i,
                            mu,
                        ),
                    );
                }
            }
            println!(
                "{}",
                serde_json::to_string_pretty(&Value::Object(out)).unwrap()
            );
        }
        _ => panic!("windows | estimate | score"),
    }
}
