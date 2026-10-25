// SPDX-License-Identifier: AGPL-3.0-only
//! The EU-US WG-C ARAIM Milestone 3 max-URA reproduction (`xval/araim-m3/`): worldwide
//! availability of horizontal ARAIM (RNP 0.1 and 0.3) as a function of the ISM's `sigma_URA`,
//! reduced to the "maximum URA" entries of the report's Tables 5, 6 and 7.
//!
//! Run with `cargo run --release --bin gen_araim_m3_study -- --out xval/araim-m3/results.json`.
//! The bars it is scored against are in `xval/araim-m3/PREREGISTRATION.md`, committed before any
//! scored run; the study writes the measured entries and `tests/araim_m3_reproduction.rs` scores
//! them. `--bench` times a few evaluations and writes nothing. The study evaluates only the
//! `sigma_URA` values the claims need (`ura_list`), not the whole 1 to 10 m sweep.
//!
//! Everything is deterministic: circular Keplerian Walker shells, an exactly sidereal Earth
//! rotation, the engine's ADD v4.2 horizontal path with the RNP constants of Table 25, and the
//! error models of Annex A.VI.1. It uses no random numbers and no clock.

use kshana::araim_reference::{
    add_v42_protection_levels_to_order, AddV42Case, ReferenceConstants, ReferenceSatellite,
};
use kshana::frames::{geodetic_to_ecef, Geodetic};
use serde_json::{json, Value};
use std::f64::consts::PI;

const MU: f64 = 3.986_004_418e14;
/// Sidereal day, s (IERS: 86164.0905).
const T_SD: f64 = 86_164.090_5;
const OMEGA_E: f64 = 2.0 * PI / T_SD;
const MASK_DEG: f64 = 5.0;
const B_NOM: f64 = 0.75;
const P_SAT: f64 = 1e-5;
const FC_THRES: f64 = 0.01;
const HAL_RNP01: f64 = 185.0;
const HAL_RNP03: f64 = 556.0;
/// The `sigma_URA` values (m) evaluated for each configuration: exactly the values the
/// pre-registered claims in `xval/araim-m3/PREREGISTRATION.md` need (the printed entry and the
/// next integer, or 10 m for ">10 m", or 1 m for "N/A"). Fixed before any scored run.
fn ura_list(id: &str) -> &'static [usize] {
    match id {
        "dual-baseline" | "galileo-baseline" => &[10],
        "dual-depleted" => &[9, 10],
        "galileo-depleted" => &[1],
        "gps-depleted" => &[1, 4, 5],
        "gps-baseline" => &[6, 7, 10],
        _ => &[],
    }
}

/// RNP column of Table 25: all of the integrity budget horizontal. The vertical budgets are
/// 1e-12 and 1e-9 rather than the table's 0: the engine solves the vertical level too, and a
/// zero budget makes its detection multiplier infinite and its bisection never end. The
/// vertical result is not used, and the horizontal budget changes by a part in 1e5 (D6).
const RNP: ReferenceConstants = ReferenceConstants {
    p_hmi_vert: 1e-12,
    p_hmi_horz: 1e-7 - 1e-12,
    p_fa_vert: 1e-9,
    p_fa_horz: 3.99e-6,
    p_emt: 1e-5,
    p_thres: 4e-8,
    tol_pl_m: 5e-2,
};

struct Shell {
    planes: usize,
    per_plane: usize,
    incl_deg: f64,
    /// Orbit period, s (sets the semi-major axis).
    period_s: f64,
    phasing_f: f64,
    /// Index of a satellite to leave out (the "depleted" case).
    removed: Option<usize>,
}

impl Shell {
    /// GPS: 24/6/1, 55 degrees, half a sidereal day.
    fn gps(removed: Option<usize>) -> Self {
        Self {
            planes: 6,
            per_plane: 4,
            incl_deg: 55.0,
            period_s: T_SD / 2.0,
            phasing_f: 1.0,
            removed,
        }
    }
    /// Galileo: 24/3/1, 56 degrees, 17 revolutions in 10 sidereal days.
    fn galileo(removed: Option<usize>) -> Self {
        Self {
            planes: 3,
            per_plane: 8,
            incl_deg: 56.0,
            period_s: T_SD * 10.0 / 17.0,
            phasing_f: 1.0,
            removed,
        }
    }

    /// Earth-fixed positions of the satellites at `t` seconds.
    fn positions(&self, t: f64) -> Vec<[f64; 3]> {
        let a = (MU * (self.period_s / (2.0 * PI)).powi(2)).cbrt();
        let n = 2.0 * PI / self.period_s;
        let total = (self.planes * self.per_plane) as f64;
        let inc = self.incl_deg.to_radians();
        let (si, ci) = inc.sin_cos();
        let th = OMEGA_E * t;
        let (sg, cg) = th.sin_cos();
        let mut out = Vec::new();
        let mut idx = 0usize;
        for p in 0..self.planes {
            let raan = 2.0 * PI * p as f64 / self.planes as f64;
            let (sr, cr) = raan.sin_cos();
            for s in 0..self.per_plane {
                let this = idx;
                idx += 1;
                if self.removed == Some(this) {
                    continue;
                }
                let m0 = 2.0 * PI * s as f64 / self.per_plane as f64
                    + 2.0 * PI * self.phasing_f * p as f64 / total;
                let u = m0 + n * t;
                let (su, cu) = u.sin_cos();
                let (xo, yo) = (a * cu, a * su);
                // Rx(i) then Rz(raan): ECI.
                let (x1, y1, z1) = (xo, yo * ci, yo * si);
                let eci = [cr * x1 - sr * y1, sr * x1 + cr * y1, z1];
                // Earth rotation: ECEF = Rz(-theta) ECI.
                out.push([
                    cg * eci[0] + sg * eci[1],
                    -sg * eci[0] + cg * eci[1],
                    eci[2],
                ]);
            }
        }
        out
    }
}

/// `sigma_tropo(theta)` of Annex A.VI.1, metres.
fn sigma_tropo(el_rad: f64) -> f64 {
    0.12 * 1.001 / (0.002001 + el_rad.sin().powi(2)).sqrt()
}

/// Galileo `sigma_user(theta)` from Table 29 (5 to 90 degrees in 5 degree steps), linearly
/// interpolated, metres.
fn sigma_user_galileo(el_deg: f64) -> f64 {
    const T: [f64; 18] = [
        0.4529, 0.3553, 0.3063, 0.2638, 0.2593, 0.2555, 0.2504, 0.2438, 0.2396, 0.2359, 0.2339,
        0.2302, 0.2295, 0.2278, 0.2297, 0.2310, 0.2274, 0.2277,
    ];
    let x = ((el_deg - 5.0) / 5.0).clamp(0.0, 17.0);
    let i = (x.floor() as usize).min(16);
    T[i] + (T[i + 1] - T[i]) * (x - i as f64)
}

/// GPS `sigma_user(theta)` of Annex A.VI.1 (AAD-A, dual frequency), metres.
fn sigma_user_gps(el_deg: f64) -> f64 {
    let (f1, f5) = (1575.42e6_f64, 1176.45e6_f64);
    let k = ((f1.powi(4) + f5.powi(4)) / (f1 * f1 - f5 * f5).powi(2)).sqrt();
    let mp = 0.13 + 0.53 * (-el_deg / 10.0).exp();
    let noise = 0.15 + 0.43 * (-el_deg / 6.9).exp();
    k * (mp * mp + noise * noise).sqrt()
}

struct Config {
    /// Per constellation: the shell and its `P_const`.
    shells: Vec<(Shell, f64)>,
}

/// HPL of one user at one epoch for each `sigma_URA` in `ura` (NaN where the solution is not
/// available: fewer than four satellites, a singular geometry, an error).
fn hpl_for_ura(user: [f64; 3], sats: &[Vec<[f64; 3]>], p_const: &[f64], ura: &[usize]) -> Vec<f64> {
    let g = kshana::frames::ecef_to_geodetic(user);
    let (sl, cl) = g.lat_rad.sin_cos();
    let (so, co) = g.lon_rad.sin_cos();
    let east = [-so, co, 0.0];
    let north = [-sl * co, -sl * so, cl];
    let up = [cl * co, cl * so, sl];
    let dot = |a: [f64; 3], b: [f64; 3]| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    let sin_mask = MASK_DEG.to_radians().sin();
    // (east, north, up, constellation, tropo+user variance)
    let mut rows: Vec<(f64, f64, f64, usize, f64)> = Vec::new();
    for (c, shell_sats) in sats.iter().enumerate() {
        for s in shell_sats {
            let d = [s[0] - user[0], s[1] - user[1], s[2] - user[2]];
            let r = dot(d, d).sqrt();
            let e = [d[0] / r, d[1] / r, d[2] / r];
            let sin_el = dot(e, up);
            if sin_el >= sin_mask {
                let el = sin_el.asin();
                let su = if c == 0 {
                    sigma_user_gps(el.to_degrees())
                } else {
                    sigma_user_galileo(el.to_degrees())
                };
                let var = sigma_tropo(el).powi(2) + su * su;
                rows.push((-dot(e, east), -dot(e, north), -dot(e, up), c, var));
            }
        }
    }
    let mut out = vec![f64::NAN; ura.len()];
    if rows.len() < 4 {
        return out;
    }
    rows.sort_by_key(|r| r.3);
    // Constellations absent from the sky cannot carry a clock column.
    let present: Vec<usize> = (0..sats.len())
        .filter(|c| rows.iter().any(|r| r.3 == *c))
        .collect();
    let remap = |c: usize| present.iter().position(|&x| x == c).unwrap_or(0);
    for (slot, &ura_m) in out.iter_mut().zip(ura) {
        let ura = ura_m as f64;
        let ure = ura * 2.0 / 3.0;
        let case = AddV42Case {
            satellites: rows
                .iter()
                .map(|r| ReferenceSatellite {
                    east: r.0,
                    north: r.1,
                    up: r.2,
                    constellation: remap(r.3),
                    c_int_m2: ura * ura + r.4,
                    c_acc_m2: ure * ure + r.4,
                })
                .collect(),
            constellations: present.len(),
            b_nom_m: vec![B_NOM; rows.len()],
            p_sat: vec![P_SAT; rows.len()],
            p_const: present.iter().map(|&c| p_const[c]).collect(),
            constants: RNP,
            fc_thres: FC_THRES,
        };
        if let Ok(r) = add_v42_protection_levels_to_order(&case, 2) {
            if r.hpl_m.is_finite() {
                *slot = r.hpl_m;
            }
        }
    }
    out
}

struct Study {
    lat_step_deg: f64,
    lon_step_deg: f64,
    lat_max_deg: f64,
    days: f64,
    step_s: f64,
}

/// Counts of epochs with HPL <= HAL, per user and URA, for RNP 0.1 and 0.3, reduced to the
/// coverage of 99.5 % availability at each URA in `ura`.
fn run_config(cfg: &Config, ura: &[usize], st: &Study, threads: usize) -> Value {
    let n_epochs = (st.days * T_SD / st.step_s).floor() as usize;
    let mut users: Vec<(f64, f64)> = Vec::new();
    let mut lat = -st.lat_max_deg;
    while lat <= st.lat_max_deg + 1e-9 {
        let mut lon = 0.0;
        while lon < 360.0 - 1e-9 {
            users.push((lat, lon));
            lon += st.lon_step_deg;
        }
        lat += st.lat_step_deg;
    }
    let ecef: Vec<[f64; 3]> = users
        .iter()
        .map(|&(la, lo)| {
            geodetic_to_ecef(Geodetic {
                lat_rad: la.to_radians(),
                lon_rad: lo.to_radians(),
                alt_m: 0.0,
            })
        })
        .collect();
    let p_const: Vec<f64> = cfg.shells.iter().map(|s| s.1).collect();
    // counts[user][k] = (epochs <= 185 m, epochs <= 556 m) at sigma_URA = ura[k]
    let mut counts = vec![vec![(0u32, 0u32); ura.len()]; users.len()];
    let chunk = users.len().div_ceil(threads.max(1));
    std::thread::scope(|scope| {
        for (ci, slice) in counts.chunks_mut(chunk).enumerate() {
            let ecef = &ecef;
            let p_const = &p_const;
            scope.spawn(move || {
                for e in 0..n_epochs {
                    let t = e as f64 * st.step_s;
                    let sats: Vec<Vec<[f64; 3]>> =
                        cfg.shells.iter().map(|s| s.0.positions(t)).collect();
                    for (j, cnt) in slice.iter_mut().enumerate() {
                        let u = ecef[ci * chunk + j];
                        let h = hpl_for_ura(u, &sats, p_const, ura);
                        for k in 0..ura.len() {
                            if h[k].is_finite() {
                                if h[k] <= HAL_RNP01 {
                                    cnt[k].0 += 1;
                                }
                                if h[k] <= HAL_RNP03 {
                                    cnt[k].1 += 1;
                                }
                            }
                        }
                    }
                }
            });
        }
    });
    // Coverage of 99.5 % availability, cos(latitude)-weighted, per URA and RNP level.
    let weight: Vec<f64> = users.iter().map(|&(la, _)| la.to_radians().cos()).collect();
    let wsum: f64 = weight.iter().sum();
    let coverage = |level: usize, k: usize| -> f64 {
        let mut c = 0.0;
        for (i, w) in weight.iter().enumerate() {
            let n = if level == 0 {
                counts[i][k].0
            } else {
                counts[i][k].1
            };
            if f64::from(n) / n_epochs as f64 >= 0.995 {
                c += w;
            }
        }
        c / wsum
    };
    let cov: Vec<Vec<f64>> = (0..2)
        .map(|l| (0..ura.len()).map(|k| coverage(l, k)).collect())
        .collect();
    json!({
        "users": users.len(), "epochs": n_epochs,
        "sigma_ura_m": ura,
        "coverage_rnp01": cov[0],
        "coverage_rnp03": cov[1],
    })
}

fn config(id: &str) -> Option<Config> {
    let c = |g: Option<Shell>, e: Option<Shell>, pg: f64, pe: f64| {
        let mut shells = Vec::new();
        if let Some(g) = g {
            shells.push((g, pg));
        }
        if let Some(e) = e {
            shells.push((e, pe));
        }
        Config { shells }
    };
    Some(match id {
        "dual-baseline" => c(
            Some(Shell::gps(None)),
            Some(Shell::galileo(None)),
            0.0,
            1e-4,
        ),
        "dual-depleted" => c(
            Some(Shell::gps(Some(0))),
            Some(Shell::galileo(Some(0))),
            0.0,
            1e-4,
        ),
        "galileo-baseline" => c(None, Some(Shell::galileo(None)), 0.0, 0.0),
        "galileo-depleted" => c(None, Some(Shell::galileo(Some(0))), 0.0, 0.0),
        "gps-baseline" => c(Some(Shell::gps(None)), None, 0.0, 0.0),
        "gps-depleted" => c(Some(Shell::gps(Some(0))), None, 0.0, 0.0),
        _ => return None,
    })
}

const IDS: [&str; 6] = [
    "dual-baseline",
    "dual-depleted",
    "galileo-baseline",
    "galileo-depleted",
    "gps-baseline",
    "gps-depleted",
];

fn main() {
    let args: Vec<String> = std::env::args().collect();
    let flag = |n: &str| {
        args.iter()
            .position(|a| a == n)
            .and_then(|i| args.get(i + 1).cloned())
    };
    let threads = flag("--threads")
        .and_then(|v| v.parse().ok())
        .unwrap_or(4usize);
    let st = Study {
        lat_step_deg: flag("--lat-step")
            .and_then(|v| v.parse().ok())
            .unwrap_or(10.0),
        lon_step_deg: flag("--lon-step")
            .and_then(|v| v.parse().ok())
            .unwrap_or(10.0),
        lat_max_deg: 70.0,
        days: flag("--days").and_then(|v| v.parse().ok()).unwrap_or(10.0),
        step_s: flag("--step")
            .and_then(|v| v.parse().ok())
            .unwrap_or(1200.0),
    };
    if args.iter().any(|a| a == "--bench") {
        let cfg = config("dual-baseline").expect("config");
        let t0 = std::time::Instant::now();
        let sats: Vec<Vec<[f64; 3]>> = cfg.shells.iter().map(|s| s.0.positions(1234.5)).collect();
        let p_const: Vec<f64> = cfg.shells.iter().map(|s| s.1).collect();
        let mut n = 0;
        let mut ok = 0;
        for lat in (-70..=70).step_by(10) {
            for lon in (0..360).step_by(30) {
                let u = geodetic_to_ecef(Geodetic {
                    lat_rad: f64::from(lat).to_radians(),
                    lon_rad: f64::from(lon).to_radians(),
                    alt_m: 0.0,
                });
                let h = hpl_for_ura(u, &sats, &p_const, &[1, 5, 10]);
                n += 1;
                ok += usize::from(h.iter().any(|x| x.is_finite()));
            }
        }
        let dt = t0.elapsed().as_secs_f64();
        println!(
            "{}",
            kshana::t!(
                "bin-gen-araim-m3-study-user-epochs-ura-values-in",
                n = n,
                dt = kshana::i18n::localise_decimal(format!("{:.2}", dt)),
                v1 = kshana::i18n::localise_decimal(format!("{:.1}", 1000.0 * dt / n as f64)),
                ok = ok
            )
        );
        return;
    }
    let only = flag("--config");
    let mut results = serde_json::Map::new();
    for id in IDS {
        if only.as_deref().is_some_and(|o| o != id) {
            continue;
        }
        let cfg = config(id).expect("config");
        eprintln!("running {id} ...");
        results.insert(id.to_string(), run_config(&cfg, ura_list(id), &st, threads));
    }
    let doc = json!({
        "schema": "kshana.araim-m3-study/1",
        "engine_version": env!("CARGO_PKG_VERSION"),
        "source": "EU-U.S. Cooperation on Satellite Navigation, Working Group C ARAIM Technical Subgroup, Milestone 3 Report, Final Version, 25 February 2016",
        "study": {
            "lat_step_deg": st.lat_step_deg, "lon_step_deg": st.lon_step_deg,
            "lat_max_deg": st.lat_max_deg, "sidereal_days": st.days, "step_s": st.step_s,
            "mask_deg": MASK_DEG, "b_nom_m": B_NOM, "p_sat": P_SAT, "sigma_ure_over_ura": 2.0 / 3.0,
            "hal_rnp01_m": HAL_RNP01, "hal_rnp03_m": HAL_RNP03,
            "algorithm": "kshana::araim_reference::add_v42_protection_levels_to_order, max_order 2, RNP constants of Table 25",
        },
        "configs": results,
    });
    let text = serde_json::to_string_pretty(&doc).expect("json");
    match flag("--out") {
        Some(p) => std::fs::write(p, text + "\n").expect("write"),
        None => println!("{text}"),
    }
}
