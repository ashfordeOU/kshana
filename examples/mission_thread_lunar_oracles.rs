// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered oracle rows A1 (LRO) and A2 (CAPSTONE NRHO) of
//! `xval/mission-thread-lunar/PREREGISTRATION.md`, as amended (Amendments 1 to 5).
//!
//!   bash xval/mission-thread-lunar/fetch_data.sh <data-dir>
//!   cargo run --example mission_thread_lunar_oracles -- <data-dir> <results.json> [<grail-table>]
//!
//! `<data-dir>` holds `a1_lro_horizons.json`, `a2_capstone_horizons.json` and `jggrx_0660b_sha.tab` (the full
//! GRAIL GL0660B table, or pass the committed degree-150 crop as the third argument). The propagation is the
//! crate's lunar force model with the GL0660B field to degree and order 150, Earth and Sun third bodies and the
//! relativistic term, no drag or radiation pressure; the primary run uses the embedded DE440 lunar orientation
//! and the secondary run, reported without a bar, the analytic one. Every definition and every bar is in the
//! committed pre-registration; nothing here chooses a window, a span or a threshold after the fact.
//!
//! The rows test the propagator the lunar kinds share. They test no navigation filter, signal or budget.
//! Advisory software, not certified navigation equipment.

use kshana::gravity_sh::SphericalHarmonicField;
use kshana::integrator::Tolerance;
use kshana::lunar_od::{
    AnalyticLunarEnvironment, De440LunarEnvironment, LunarEnvironment, LunarForceModel,
};
use kshana::precise_od::{propagate, propagate_samples};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

type Vec3 = [f64; 3];

/// A1 bars (Amendment 1): maximum 3-D difference and 24 h RMS radial difference, metres.
const A1_MAX_3D_M: f64 = 500.0;
const A1_RMS_RADIAL_M: f64 = 60.0;
/// A2 bars (Amendment 1): end-of-window position difference and osculating periapsis radius difference, metres.
const A2_END_POS_M: f64 = 25_000.0;
const A2_PERILUNE_M: f64 = 10_000.0;
/// A2 window (Amendment 5) and maneuver-hour threshold (Amendment 2).
const A2_WINDOW_HOURS: usize = 156;
const MANEUVER_HOUR_M: f64 = 100.0;
/// Fixed field degree and order (Amendment 1).
const DEGREE: usize = 150;

struct State {
    jd_tdb: f64,
    r: Vec3,
    v: Vec3,
}

fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn sha256_hex(path: &str) -> Result<String, String> {
    let bytes = std::fs::read(path).map_err(|e| format!("{path}: {e}"))?;
    Ok(hex::encode(Sha256::digest(&bytes)))
}

/// The state rows of a Horizons JSON response, kilometres converted to metres, unaltered otherwise.
fn parse_horizons(path: &str) -> Result<Vec<State>, String> {
    let text = std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))?;
    let v: Value = serde_json::from_str(&text).map_err(|e| format!("{path}: not JSON: {e}"))?;
    let result = v["result"]
        .as_str()
        .ok_or_else(|| format!("{path}: no `result` text (Horizons returned an error)"))?;
    let (Some(a), Some(b)) = (result.find("$$SOE"), result.find("$$EOE")) else {
        return Err(format!("{path}: no state table in the response"));
    };
    let mut out = Vec::new();
    for line in result[a + 5..b]
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty())
    {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        if f.len() < 8 {
            return Err(format!("{path}: malformed row `{line}`"));
        }
        let p = |i: usize| {
            f[i].parse::<f64>()
                .map_err(|_| format!("{path}: bad number `{}`", f[i]))
        };
        out.push(State {
            jd_tdb: p(0)?,
            r: [p(2)? * 1e3, p(3)? * 1e3, p(4)? * 1e3],
            v: [p(5)? * 1e3, p(6)? * 1e3, p(7)? * 1e3],
        });
    }
    Ok(out)
}

/// Dormand-Prince tolerances fixed in Amendment 4: relative 1e-12, absolute 1e-9 (metres, seconds).
fn tol() -> Tolerance {
    Tolerance {
        rtol: 1e-12,
        atol: 1e-9,
        h_min: 1e-3,
        h_max: 60.0,
    }
}

fn model<E: LunarEnvironment>(
    field: &SphericalHarmonicField,
    jd: f64,
    env: E,
) -> LunarForceModel<E> {
    LunarForceModel::with_env(field.clone(), jd, env).relativity()
}

/// Osculating periapsis radius `p / (1 + e)` about a body of gravitational parameter `mu`, any conic.
fn periapsis_radius_m(r: Vec3, v: Vec3, mu: f64) -> f64 {
    let h = cross(r, v);
    let rn = norm(r);
    let ev = {
        let vxh = cross(v, h);
        [
            vxh[0] / mu - r[0] / rn,
            vxh[1] / mu - r[1] / rn,
            vxh[2] / mu - r[2] / rn,
        ]
    };
    let e = norm(ev);
    dot(h, h) / mu / (1.0 + e)
}

/// A1 for one environment: the maximum 3-D difference, the RMS radial difference and the sample count.
fn a1<E: LunarEnvironment>(
    field: &SphericalHarmonicField,
    refs: &[State],
    env: E,
) -> (f64, f64, usize) {
    let m = model(field, refs[0].jd_tdb, env);
    let times: Vec<f64> = refs[1..]
        .iter()
        .map(|s| (s.jd_tdb - refs[0].jd_tdb) * 86_400.0)
        .collect();
    let pos = propagate_samples(&m, refs[0].r, refs[0].v, &times, &tol());
    let (mut max3, mut sum_rad2) = (0.0f64, 0.0f64);
    for (p, s) in pos.iter().zip(&refs[1..]) {
        let d = sub(*p, s.r);
        max3 = max3.max(norm(d));
        let u = [s.r[0] / norm(s.r), s.r[1] / norm(s.r), s.r[2] / norm(s.r)];
        sum_rad2 += dot(d, u).powi(2);
    }
    (max3, (sum_rad2 / pos.len() as f64).sqrt(), pos.len())
}

/// A2 end-of-window comparison for one environment from the state at `i0`.
fn a2_end<E: LunarEnvironment>(
    field: &SphericalHarmonicField,
    refs: &[State],
    i0: usize,
    env: E,
) -> (f64, f64) {
    let m = model(field, refs[i0].jd_tdb, env);
    let end = &refs[i0 + A2_WINDOW_HOURS];
    let t_end = (end.jd_tdb - refs[i0].jd_tdb) * 86_400.0;
    let (r, v) = propagate(&m, refs[i0].r, refs[i0].v, t_end, &tol());
    let dpos = norm(sub(r, end.r));
    let rp = periapsis_radius_m(r, v, field.gm);
    let rp_ref = periapsis_radius_m(end.r, end.v, field.gm);
    (dpos, (rp - rp_ref).abs())
}

fn main() -> Result<(), String> {
    let args: Vec<String> = std::env::args().collect();
    if args.len() < 3 {
        return Err(
            "usage: mission_thread_lunar_oracles <data-dir> <results.json> [<grail-table>]".into(),
        );
    }
    let dir = &args[1];
    let out_path = &args[2];
    let grail_path = args
        .get(3)
        .cloned()
        .unwrap_or_else(|| format!("{dir}/jggrx_0660b_sha.tab"));
    let a1_path = format!("{dir}/a1_lro_horizons.json");
    let a2_path = format!("{dir}/a2_capstone_horizons.json");

    let grail_text =
        std::fs::read_to_string(&grail_path).map_err(|e| format!("{grail_path}: {e}"))?;
    let field = SphericalHarmonicField::from_shadr(&grail_text, DEGREE)?;
    let inputs = json!({
        "a1_lro_horizons.json": sha256_hex(&a1_path).ok(),
        "a2_capstone_horizons.json": sha256_hex(&a2_path).ok(),
        "gravity_table": { "path": grail_path, "sha256": sha256_hex(&grail_path)? },
    });

    let mut doc = json!({
        "document": "xval/mission-thread-lunar oracle rows A1 and A2",
        "preregistration": "xval/mission-thread-lunar/PREREGISTRATION.md, Amendments 1 to 5",
        "tests": "the propagator the lunar kinds share; no navigation filter, signal or budget",
        "model": {
            "gravity": format!("GRAIL GL0660B, degree and order {DEGREE}, GM {:.10e} m3/s2", field.gm),
            "third_bodies": "Earth and Sun, analytic series",
            "relativity": "Schwarzschild term on",
            "drag_and_radiation_pressure": "none",
            "integrator": "Dormand-Prince, rtol 1e-12, atol 1e-9, h_max 60 s",
            "primary_orientation": "DE440 principal-axis series (De440LunarEnvironment::orientation_only)",
            "secondary_orientation": "analytic (AnalyticLunarEnvironment), reported without a bar",
        },
        "inputs": inputs,
        "advisory": "Advisory software, not certified navigation equipment.",
    });

    // ---- A1 ----
    let a1_row = match parse_horizons(&a1_path) {
        Err(e) => json!({ "status": "not run", "reason": e }),
        Ok(refs) if refs.len() != 145 => json!({
            "status": "not run",
            "reason": format!("Horizons returned {} states; the request spans 145 (Amendment 5: not shortened)", refs.len()),
        }),
        Ok(refs) => {
            let primary = De440LunarEnvironment::orientation_only();
            if let Err(e) = primary.check_covers(refs[0].jd_tdb, refs[refs.len() - 1].jd_tdb) {
                json!({ "status": "not run", "reason": format!("DE440 orientation does not cover the span: {e}") })
            } else {
                let (max3, rms_rad, n) = a1(&field, &refs, primary);
                let (max3_s, rms_s, _) = a1(&field, &refs, AnalyticLunarEnvironment);
                let met = max3 <= A1_MAX_3D_M && rms_rad <= A1_RMS_RADIAL_M;
                json!({
                    "status": if met { "MET" } else { "NOT MET" },
                    "bars": { "max_3d_m": A1_MAX_3D_M, "rms_radial_m": A1_RMS_RADIAL_M },
                    "comparisons": n,
                    "first_jd_tdb": refs[0].jd_tdb,
                    "max_3d_difference_m": max3,
                    "rms_radial_difference_m": rms_rad,
                    "max_3d_met": max3 <= A1_MAX_3D_M,
                    "rms_radial_met": rms_rad <= A1_RMS_RADIAL_M,
                    "secondary_analytic_orientation": { "max_3d_difference_m": max3_s, "rms_radial_difference_m": rms_s },
                })
            }
        }
    };
    doc["a1"] = a1_row;

    // ---- A2 ----
    let a2_row = match parse_horizons(&a2_path) {
        Err(e) => json!({ "status": "not run", "reason": e }),
        Ok(refs) if refs.len() != 2161 => json!({
            "status": "not run",
            "reason": format!("Horizons returned {} states; the request spans 2161 (Amendment 5: not shortened)", refs.len()),
        }),
        Ok(refs) => {
            let primary = De440LunarEnvironment::orientation_only();
            if let Err(e) = primary.check_covers(refs[0].jd_tdb, refs[refs.len() - 1].jd_tdb) {
                json!({ "status": "not run", "reason": format!("DE440 orientation does not cover the span: {e}") })
            } else {
                // Maneuver hours by dynamical consistency (Amendment 2).
                let mut flags = Vec::with_capacity(refs.len() - 1);
                for w in refs.windows(2) {
                    let m = model(&field, w[0].jd_tdb, primary.clone());
                    let dt = (w[1].jd_tdb - w[0].jd_tdb) * 86_400.0;
                    let p = propagate_samples(&m, w[0].r, w[0].v, &[dt], &tol());
                    flags.push(norm(sub(p[0], w[1].r)) > MANEUVER_HOUR_M);
                }
                let n_flag = flags.iter().filter(|&&f| f).count();
                // First run of 156 consecutive hours with no maneuver hour.
                let mut start = None;
                let mut run = 0usize;
                for (i, &f) in flags.iter().enumerate() {
                    run = if f { 0 } else { run + 1 };
                    if run >= A2_WINDOW_HOURS {
                        start = Some(i + 1 - A2_WINDOW_HOURS);
                        break;
                    }
                }
                match start {
                    None => json!({
                        "status": "not run",
                        "reason": format!("no run of {A2_WINDOW_HOURS} maneuver-free hours in the fetched span (Amendment 5)"),
                        "maneuver_hours": n_flag,
                        "hours_tested": flags.len(),
                    }),
                    Some(i0) => {
                        let (dpos, dper) = a2_end(&field, &refs, i0, primary);
                        let (dpos_s, dper_s) = a2_end(&field, &refs, i0, AnalyticLunarEnvironment);
                        let met = dpos <= A2_END_POS_M && dper <= A2_PERILUNE_M;
                        json!({
                            "status": if met { "MET" } else { "NOT MET" },
                            "bars": { "end_position_m": A2_END_POS_M, "periapsis_radius_m": A2_PERILUNE_M },
                            "window_hours": A2_WINDOW_HOURS,
                            "window_start_index": i0,
                            "window_start_jd_tdb": refs[i0].jd_tdb,
                            "maneuver_hours": n_flag,
                            "hours_tested": flags.len(),
                            "end_position_difference_m": dpos,
                            "periapsis_radius_difference_m": dper,
                            "end_position_met": dpos <= A2_END_POS_M,
                            "periapsis_met": dper <= A2_PERILUNE_M,
                            "secondary_analytic_orientation": { "end_position_difference_m": dpos_s, "periapsis_radius_difference_m": dper_s },
                        })
                    }
                }
            }
        }
    };
    doc["a2"] = a2_row;

    let text = serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?;
    std::fs::write(out_path, format!("{text}\n")).map_err(|e| format!("{out_path}: {e}"))?;
    println!("{text}");
    Ok(())
}
