// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered comparison of the `gnss-ssv` sweeps with the ICG Space Service Volume booklet's published tables
//! (`xval/gnss-ssv/PREREGISTRATION.md`, bars S0 to S6). The published numbers are read from
//! `xval/gnss-ssv/booklet-tables.json`; nothing here is tuned to them.

use super::constellations::{mrtp_dbw, Band, Constellation, SIGNALS};
use super::pattern::{Axis, NamedAntenna, TxPattern, UserAntenna};
use super::sweep::{
    run_shell, run_trajectory, Ablation, BandResult, NoEffects, ShellConfig, TrajectoryConfig,
    TrajectoryResult, UserOrbit,
};
use serde_json::{json, Value};

/// The booklet's minutes in the run: 14 days.
const RUN_MIN: f64 = 20_160.0;

/// Table B6's minimum radiated transmit powers, dBW, in [`SIGNALS`] order (pre-registration addendum 3, item 4).
const S0_EXPECTED: [f64; 13] = [
    9.1, 10.9, 14.1, 9.0, 9.0, 9.0, 8.5, 8.4, 12.6, 8.0, 8.1, 9.2, 7.8,
];

/// Which published table a comparison reads.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Size {
    /// The pre-registered configuration: 2,562 users, 14 days, 1-minute steps.
    Full,
    /// A reduced configuration for debug builds (162 users, 1 day at 10 minutes). Verdicts of a reduced run mean nothing.
    Reduced,
}

fn band_of(s: &str) -> Band {
    if s == "l1" {
        Band::L1
    } else {
        Band::L5
    }
}

fn num(v: &Value) -> Option<f64> {
    v.as_f64()
}

/// One compared cell.
fn cell(label: &str, published: Option<f64>, sim: f64, tol: f64) -> Value {
    match published {
        None => {
            json!({"cell": label, "published": null, "sim": sim, "scored": false, "pass": null})
        }
        Some(p) => {
            json!({"cell": label, "published": p, "sim": sim, "tol": tol, "scored": true, "pass": (sim - p).abs() <= tol})
        }
    }
}

fn mod_cell(label: &str, published: &Value, sim_min: f64, never: bool) -> Value {
    match published {
        Value::Null => {
            json!({"cell": label, "published": "*", "sim": sim_min, "sim_never": never, "scored": true, "pass": never})
        }
        Value::String(_) => {
            json!({"cell": label, "published": "blank", "scored": false, "pass": null})
        }
        v => {
            let p = num(v).unwrap_or(0.0);
            let tol = (0.25 * p).max(10.0);
            json!({"cell": label, "published": p, "sim": sim_min, "sim_never": never, "tol": tol, "scored": true,
                   "pass": !never && (sim_min - p).abs() <= tol})
        }
    }
}

fn avail_cell(label: &str, v: &Value, sim: f64, tol: f64) -> Value {
    match v {
        Value::String(_) => {
            json!({"cell": label, "published": "blank", "scored": false, "pass": null})
        }
        v => cell(label, num(v), sim, tol),
    }
}

fn shell_rows(table: &[Value], res: &[BandResult], tag: &str, tol: f64) -> Vec<Value> {
    let mut out = Vec::new();
    for row in table {
        let band = band_of(row["band"].as_str().unwrap_or(""));
        let name = row["constellation"].as_str().unwrap_or("");
        let g = res
            .iter()
            .find(|b| b.band == band)
            .and_then(|b| b.groups.iter().find(|g| g.name == name));
        let key = format!("{tag} {} {name}", band.name());
        let Some(g) = g else {
            out.push(json!({"cell": key, "scored": true, "pass": false, "note": "group missing in the simulation"}));
            continue;
        };
        let a = &g.availability;
        out.push(avail_cell(
            &format!("{key} >=1 %"),
            &row["a1"],
            a.at_least_1_pct,
            tol,
        ));
        out.push(avail_cell(
            &format!("{key} >=4 %"),
            &row["a4"],
            a.at_least_4_pct,
            tol,
        ));
        out.push(mod_cell(
            &crate::t!("ssv-check-mod1-min", key = key),
            &row["mod1"],
            a.max_outage_1_min,
            a.never_available_1,
        ));
        out.push(mod_cell(
            &crate::t!("ssv-check-mod4-min", key = key),
            &row["mod4"],
            a.max_outage_4_min,
            a.never_available_4,
        ));
    }
    out
}

/// What a scored run changes: the one ablation of campaign B and the step, nothing else.
#[derive(Clone, Copy, Debug, Default)]
struct Opts {
    ablation: Ablation,
    /// Step in minutes replacing the run's own (B2: 0.5).
    step_min: Option<f64>,
}

fn shell(
    ov: &[(Constellation, Band, f64)],
    size: Size,
    alt: f64,
    hemi: bool,
    cn0: Option<f64>,
    o: Opts,
) -> Result<Vec<BandResult>, String> {
    let (grid_levels, duration_min, step_min) = match size {
        Size::Full => (4, RUN_MIN, o.step_min.unwrap_or(1.0)),
        Size::Reduced => (2, 1440.0, o.step_min.unwrap_or(10.0)),
    };
    run_shell(&ShellConfig {
        altitude_km: alt,
        hemisphere: hemi,
        grid_levels,
        duration_min,
        step_min,
        cn0_min_dbhz: cn0,
        constellations: Constellation::ALL.to_vec(),
        bands: vec![Band::L1, Band::L5],
        mrtp_reference_alt_km: 36_000.0,
        beam_override_deg: ov.to_vec(),
        ablation: o.ablation,
    })
}

fn trajectory(
    ov: &[(Constellation, Band, f64)],
    orbit: UserOrbit,
    duration_min: f64,
    step_min: f64,
    antennas: &[(NamedAntenna, Axis)],
    o: Opts,
) -> Result<TrajectoryResult, String> {
    let ants = [Band::L1, Band::L5]
        .into_iter()
        .map(|b| {
            (
                b,
                antennas
                    .iter()
                    .map(|(n, a)| UserAntenna::named(n, b, *a))
                    .collect(),
            )
        })
        .collect();
    run_trajectory(
        &TrajectoryConfig {
            orbit,
            duration_min,
            step_min,
            cn0_min_dbhz: Some(20.0),
            constellations: Constellation::ALL.to_vec(),
            bands: vec![Band::L1, Band::L5],
            antennas: ants,
            tx: TxPattern::Booklet,
            mrtp_reference_alt_km: 36_000.0,
            series_every_epochs: 0,
            collect_limb: false,
            beam_override_deg: ov.to_vec(),
            ablation: o.ablation,
        },
        &NoEffects,
    )
}

fn traj_rows(
    table: &[Value],
    r: &TrajectoryResult,
    tag: &str,
    tol: f64,
    with_mod: bool,
) -> Vec<Value> {
    let mut out = Vec::new();
    for row in table {
        let band = band_of(row["band"].as_str().unwrap_or(""));
        let name = row["constellation"].as_str().unwrap_or("");
        let g = r
            .bands
            .iter()
            .find(|b| b.band == band)
            .and_then(|b| b.groups.iter().find(|g| g.name == name));
        let key = format!("{tag} {} {name}", band.name());
        let Some(g) = g else {
            out.push(json!({"cell": key, "scored": true, "pass": false, "note": "group missing in the simulation"}));
            continue;
        };
        let a = &g.availability;
        out.push(avail_cell(
            &format!("{key} >=1 %"),
            &row["a1"],
            a.at_least_1_pct,
            tol,
        ));
        out.push(avail_cell(
            &format!("{key} >=4 %"),
            &row["a4"],
            a.at_least_4_pct,
            tol,
        ));
        if with_mod {
            // Reported only: no bar for MOD on mission trajectories.
            for (k, p, s) in [
                ("MOD1", &row["mod1"], a.max_outage_1_min),
                ("MOD4", &row["mod4"], a.max_outage_4_min),
            ] {
                out.push(json!({"cell": format!("{key} {k} min"), "published": p, "sim": s, "scored": false, "pass": null}));
            }
        }
    }
    out
}

fn verdict(cells: &[Value]) -> Value {
    let scored: Vec<&Value> = cells.iter().filter(|c| c["scored"] == true).collect();
    let failed = scored.iter().filter(|c| c["pass"] != true).count();
    json!({"scored_cells": scored.len(), "failed_cells": failed, "met": failed == 0 && !scored.is_empty()})
}

/// Run the comparison. `tables` is the text of `booklet-tables.json`. Returns the full report: every compared cell of
/// every bar and a verdict per bar.
///
/// `glonass_table_4_2` switches GLONASS's reference off-boresight angles from table B6's (20 and 28 degrees, the
/// pre-registered reading) to table 4.2's (26 and 34 degrees); it is a diagnostic variant, reported beside the
/// pre-registered run and never in place of it.
pub fn run(tables: &str, size: Size, glonass_table_4_2: bool) -> Result<Value, String> {
    run_core(tables, size, glonass_table_4_2, Opts::default(), None)
}

/// One ablation of campaign B of `xval/gnss-ssv/PREREGISTRATION-v2.md`, run on the run-1 configuration and read on the bars
/// that campaign names for it: `"B1"` (Fibonacci grid, S1 to S3), `"B2"` (30-second epochs, S1 to S3), `"B3"` (antenna with
/// the most satellites, S4 and S5), `"B4"` (propagated HEO and lunar trajectories, S5 and S6) and `"B5"` (cosine user-antenna
/// gain, S1 and S3). The report has the same shape as [`run`]'s, with only those bars; the verdicts in it are the original
/// tolerances applied cell by cell and are **not bars** (campaign B is a sensitivity table).
pub fn run_ablation(tables: &str, size: Size, id: &str) -> Result<Value, String> {
    let (opts, bars): (Opts, &[&str]) = match id {
        "B1" => (
            Opts {
                ablation: Ablation {
                    fibonacci_points: Some(2562),
                    ..Ablation::default()
                },
                step_min: None,
            },
            &["S1", "S2", "S3"],
        ),
        "B2" => (
            Opts {
                ablation: Ablation::default(),
                step_min: Some(0.5),
            },
            &["S1", "S2", "S3"],
        ),
        "B3" => (
            Opts {
                ablation: Ablation {
                    antenna_by_count: true,
                    ..Ablation::default()
                },
                step_min: None,
            },
            &["S4", "S5"],
        ),
        "B4" => (
            Opts {
                ablation: Ablation {
                    propagated: true,
                    ..Ablation::default()
                },
                step_min: None,
            },
            &["S5", "S6"],
        ),
        "B5" => (
            Opts {
                ablation: Ablation {
                    cosine_user_gain: true,
                    ..Ablation::default()
                },
                step_min: None,
            },
            &["S1", "S3"],
        ),
        other => return Err(format!("unknown ablation `{other}`: B1 to B5")),
    };
    let mut v = run_core(tables, size, false, opts, Some(bars))?;
    v["ablation"] = json!(id);
    Ok(v)
}

#[allow(clippy::too_many_lines)]
fn run_core(
    tables: &str,
    size: Size,
    glonass_table_4_2: bool,
    o: Opts,
    only: Option<&[&str]>,
) -> Result<Value, String> {
    let want = |b: &str| only.is_none_or(|l| l.contains(&b));
    let ov: Vec<(Constellation, Band, f64)> = if glonass_table_4_2 {
        vec![
            (Constellation::Glonass, Band::L1, 26.0),
            (Constellation::Glonass, Band::L5, 34.0),
        ]
    } else {
        Vec::new()
    };
    let t: Value = serde_json::from_str(tables).map_err(|e| e.to_string())?;
    let arr = |v: &Value| v.as_array().cloned().unwrap_or_default();
    let mut bars = serde_json::Map::new();
    let mut put = |name: &str, desc: &str, cells: Vec<Value>| {
        let v = verdict(&cells);
        bars.insert(
            name.into(),
            json!({"statement": desc, "verdict": v, "cells": cells}),
        );
    };

    // S0: the inverse link budget.
    if want("S0") {
        let s0: Vec<Value> = SIGNALS
            .iter()
            .zip(S0_EXPECTED)
            .map(|(s, e)| {
                cell(
                    &crate::t!("ssv-check-mrtp-dbw", name = s.name),
                    Some(e),
                    mrtp_dbw(s, 36_000.0),
                    0.1,
                )
            })
            .collect();
        put(
            "S0",
            "inverse link budget reproduces table B6 within 0.1 dB",
            s0,
        );
    }

    // S1: upper SSV geometry.
    if want("S1") {
        let r1 = shell(&ov, size, 36_000.0, true, None, o)?;
        put(
            "S1",
            "upper SSV geometry (table B4)",
            shell_rows(&arr(&t["upper_geometry"]), &r1, "B4", 2.0),
        );
    }
    // S2: lower SSV.
    if want("S2") {
        let r2 = shell(&ov, size, 8_000.0, false, None, o)?;
        put(
            "S2",
            "lower SSV geometry (table 5.2)",
            shell_rows(&arr(&t["lower_geometry"]), &r2, "5.2", 2.0),
        );
    }
    // S3: upper SSV with RF thresholds.
    let mut s3 = Vec::new();
    for thr in [15.0, 20.0, 25.0] {
        if !want("S3") {
            break;
        }
        let r = shell(&ov, size, 36_000.0, true, Some(thr), o)?;
        let key = format!("{}", thr as u32);
        s3.extend(shell_rows(
            &arr(&t["upper_rf"][&key]),
            &r,
            &format!("B9@{key}"),
            2.0,
        ));
    }
    if want("S3") {
        put(
            "S3",
            "upper SSV with RF thresholds 15/20/25 dB-Hz (table B9)",
            s3,
        );
    }

    // S4: GEO.
    let (geo_min, step) = match size {
        Size::Full => (RUN_MIN, o.step_min.unwrap_or(1.0)),
        Size::Reduced => (1440.0, o.step_min.unwrap_or(10.0)),
    };
    let era0 = super::geom::earth_rotation_angle(0.0).to_degrees();
    let mut s4 = Vec::new();
    for lon in [0, 60, 120, 180, 240, 300] {
        if !want("S4") {
            break;
        }
        let orbit = UserOrbit {
            a_km: 42_164.0,
            e: 0.0,
            i_deg: 0.0,
            raan_deg: 0.0,
            argp_deg: 0.0,
            true_anomaly_deg: (f64::from(lon) + era0).rem_euclid(360.0),
        };
        let r = trajectory(
            &ov,
            orbit,
            geo_min,
            step,
            &[(NamedAntenna::BookletHighGain, Axis::Nadir)],
            o,
        )?;
        s4.extend(traj_rows(
            &arr(&t["geo"][&lon.to_string()]),
            &r,
            &format!("GEO {lon}E"),
            3.0,
            true,
        ));
    }
    if want("S4") {
        put(
            "S4",
            "six GEO missions (tables 5.4 to 5.9), 20 dB-Hz, high-gain nadir antenna",
            s4,
        );
    }

    // S5: HEO.
    let heo = super::scenario::preset_orbit("heo")
        .ok_or_else(|| crate::terr!("e-ssv-check-heo-preset"))?;
    let heo_min = match size {
        Size::Full => (1.5 * heo.period_min()).round(),
        Size::Reduced => 1440.0,
    };
    if want("S5") {
        let r5 = trajectory(
            &ov,
            heo,
            heo_min,
            step,
            &[
                (NamedAntenna::BookletHighGain, Axis::Nadir),
                (NamedAntenna::BookletPatch, Axis::Zenith),
            ],
            o,
        )?;
        put(
            "S5",
            "HEO mission (table 5.11)",
            traj_rows(&arr(&t["heo"]), &r5, "HEO", 5.0, true),
        );
    }

    // S6: lunar, perigee to apogee.
    let lunar = super::scenario::preset_orbit("lunar-transfer")
        .ok_or_else(|| crate::terr!("e-ssv-check-lunar-preset"))?;
    let lun_min = match size {
        Size::Full => (0.5 * lunar.period_min()).round(),
        Size::Reduced => 1440.0,
    };
    if want("S6") {
        let r6 = trajectory(
            &ov,
            lunar,
            lun_min,
            step,
            &[
                (NamedAntenna::BookletHighGain, Axis::Nadir),
                (NamedAntenna::BookletPatch, Axis::Zenith),
            ],
            o,
        )?;
        put(
            "S6",
            "lunar mission (table 5.13)",
            traj_rows(&arr(&t["lunar"]), &r6, "lunar", 10.0, false),
        );
    }

    Ok(
        json!({"size": if size == Size::Full { "full" } else { "reduced" }, "glonass_table_4_2": glonass_table_4_2, "bars": Value::Object(bars)}),
    )
}

/// Bar S7: the parametric transmit pattern against the measured GPS L1 panel patterns (`extract_patterns.py` output:
/// `svn,theta_deg,az_avg_db`). Pre-registration addendum 5 fixes the reading.
pub fn s7(csv: &str) -> Result<Value, String> {
    use std::collections::BTreeMap;
    let mut by_sv: BTreeMap<String, Vec<(f64, f64)>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let f: Vec<&str> = line.split(',').collect();
        if f.len() != 3 {
            continue;
        }
        let th: f64 = f[1].parse().map_err(|_| "theta")?;
        let db: f64 = f[2].parse().map_err(|_| "gain")?;
        by_sv.entry(f[0].to_string()).or_default().push((th, db));
    }
    let p = super::pattern::ParametricPattern::default();
    let beam = 23.5;
    let model = |th: f64| {
        TxPattern::Parametric(p)
            .eirp_dbw(0.0, beam, th, 0.0)
            .unwrap_or(f64::NEG_INFINITY)
    };
    let mut cells = Vec::new();
    let mut rms_all = Vec::new();
    for (sv, pts) in &by_sv {
        let peak = pts.iter().map(|x| x.1).fold(f64::NEG_INFINITY, f64::max);
        let mut sq = 0.0;
        let mut n = 0.0;
        for &(th, db) in pts.iter().filter(|x| x.0 <= 30.0) {
            let d = model(th) - (db - peak);
            sq += d * d;
            n += 1.0;
        }
        let rms = (sq / n).sqrt();
        rms_all.push(rms);
        cells.push(json!({"cell": format!("{sv} L1 RMS dB"), "published": 3.0, "sim": rms, "scored": true, "pass": rms <= 3.0, "tol": 3.0}));
    }
    rms_all.sort_by(f64::total_cmp);
    let median = rms_all.get(rms_all.len() / 2).copied();
    Ok(
        json!({"statement": "parametric pattern against measured GPS L1 panel patterns, RMS over 0 to 30 degrees, every pattern",
              "patterns": by_sv.len(), "median_rms_db": median, "min_rms_db": rms_all.first(), "max_rms_db": rms_all.last(),
              "verdict": verdict(&cells), "cells": cells}),
    )
}

/// The twelve Classic IIR satellites of the NAVCEN document's table of satellite types: the training set of bar S7b.
pub const S7B_TRAIN: [&str; 12] = [
    "SVN41", "SVN43", "SVN44", "SVN45", "SVN46", "SVN47", "SVN51", "SVN54", "SVN56", "SVN59",
    "SVN60", "SVN61",
];
/// The eight IIR-M satellites: the test set of bar S7b.
pub const S7B_TEST: [&str; 8] = [
    "SVN48", "SVN49", "SVN50", "SVN52", "SVN53", "SVN55", "SVN57", "SVN58",
];

/// The registered two-parameter shape: the power falls from the boresight at `rolloff_db_per_deg` and stops at
/// `floor_db` below the peak.
fn s7b_shape(rolloff_db_per_deg: f64, floor_db: f64, theta_deg: f64) -> f64 {
    -(rolloff_db_per_deg * theta_deg).min(floor_db)
}

/// The samples of one pattern at theta = 0, 2, ..., 30 degrees, each normalised to the pattern's own peak (over every
/// tabulated angle), in dB.
fn s7b_samples(pts: &[(f64, f64)]) -> Vec<(f64, f64)> {
    let peak = pts.iter().map(|x| x.1).fold(f64::NEG_INFINITY, f64::max);
    pts.iter()
        .filter(|x| x.0 <= 30.0 && (x.0 / 2.0).fract() == 0.0)
        .map(|&(th, db)| (th, db - peak))
        .collect()
}

/// Bar S7b of `xval/gnss-ssv/PREREGISTRATION-v2.md` (campaign C): fit the two numbers of the registered shape by least
/// squares to the training patterns (pooled, theta = 0 to 30 degrees, each pattern normalised to its own peak), by a
/// deterministic grid search (roll-off 0 to 3 dB/deg in 0.001 steps, floor 0 to 40 dB in 0.01 steps) refined once on a
/// grid a hundred times finer around the best cell; then report, for every test pattern, the RMS difference at theta = 0,
/// 2, ..., 30 degrees against the 3 dB bar. The fit is made and recorded in the report before any test pattern is read.
pub fn s7b(csv: &str, train: &[&str], test: &[&str]) -> Result<Value, String> {
    use std::collections::BTreeMap;
    let mut by_sv: BTreeMap<String, Vec<(f64, f64)>> = BTreeMap::new();
    for line in csv.lines().skip(1) {
        let f: Vec<&str> = line.split(',').collect();
        if f.len() != 3 {
            continue;
        }
        let th: f64 = f[1].parse().map_err(|_| "theta")?;
        let db: f64 = f[2].parse().map_err(|_| "gain")?;
        by_sv.entry(f[0].to_string()).or_default().push((th, db));
    }
    let train_pts: Vec<(f64, f64)> = train
        .iter()
        .map(|sv| {
            by_sv
                .get(*sv)
                .map(|p| s7b_samples(p))
                .ok_or(format!("training pattern {sv} missing"))
        })
        .collect::<Result<Vec<_>, _>>()?
        .into_iter()
        .flatten()
        .collect();
    let sse = |r: f64, fl: f64| -> f64 {
        train_pts
            .iter()
            .map(|&(th, y)| {
                let d = s7b_shape(r, fl, th) - y;
                d * d
            })
            .sum()
    };
    let search = |r_lo: f64, r_hi: f64, dr: f64, f_lo: f64, f_hi: f64, df: f64| -> (f64, f64) {
        let mut best = (f64::INFINITY, r_lo, f_lo);
        let nr = ((r_hi - r_lo) / dr).round() as usize;
        let nf = ((f_hi - f_lo) / df).round() as usize;
        for i in 0..=nr {
            let r = r_lo + i as f64 * dr;
            for j in 0..=nf {
                let fl = f_lo + j as f64 * df;
                let e = sse(r, fl);
                if e < best.0 {
                    best = (e, r, fl);
                }
            }
        }
        (best.1, best.2)
    };
    let (r0, f0) = search(0.0, 3.0, 0.001, 0.0, 40.0, 0.01);
    let (rolloff, floor) = search(
        (r0 - 0.001).max(0.0),
        r0 + 0.001,
        0.00001,
        (f0 - 0.01).max(0.0),
        f0 + 0.01,
        0.0001,
    );
    let train_rms = (sse(rolloff, floor) / train_pts.len() as f64).sqrt();
    let rms_of = |sv: &str| -> Result<f64, String> {
        let pts = by_sv
            .get(sv)
            .map(|p| s7b_samples(p))
            .ok_or(format!("pattern {sv} missing"))?;
        let sq: f64 = pts
            .iter()
            .map(|&(th, y)| {
                let d = s7b_shape(rolloff, floor, th) - y;
                d * d
            })
            .sum();
        Ok((sq / pts.len() as f64).sqrt())
    };
    let mut cells = Vec::new();
    let mut rms_test = Vec::new();
    for sv in test {
        let rms = rms_of(sv)?;
        rms_test.push(rms);
        cells.push(json!({"cell": format!("{sv} L1 RMS dB"), "published": 3.0, "sim": rms, "scored": true, "pass": rms <= 3.0, "tol": 3.0}));
    }
    let train_each: Vec<Value> = train
        .iter()
        .map(|sv| json!({"svn": sv, "rms_db": rms_of(sv).ok()}))
        .collect();
    let mut sorted = rms_test.clone();
    sorted.sort_by(f64::total_cmp);
    Ok(json!({
        "statement": "S7b: the two-parameter roll-off and floor shape fitted to the Classic IIR patterns, against each IIR-M pattern, RMS at theta = 0, 2, ..., 30 degrees",
        "fit": {"rolloff_db_per_deg": rolloff, "floor_db": floor, "training_patterns": train.len(), "training_points": train_pts.len(), "training_rms_db": train_rms},
        "training_each": train_each,
        "test_patterns": test.len(),
        "median_rms_db": sorted.get(sorted.len() / 2),
        "min_rms_db": sorted.first(),
        "max_rms_db": sorted.last(),
        "verdict": verdict(&cells),
        "cells": cells,
    }))
}
