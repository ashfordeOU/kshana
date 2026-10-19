// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered comparison of the `gnss-ssv` sweeps with the ICG Space Service Volume booklet's published tables
//! (`xval/gnss-ssv/PREREGISTRATION.md`, bars S0 to S6). The published numbers are read from
//! `xval/gnss-ssv/booklet-tables.json`; nothing here is tuned to them.

use super::constellations::{mrtp_dbw, Band, Constellation, SIGNALS};
use super::pattern::{Axis, NamedAntenna, TxPattern, UserAntenna};
use super::sweep::{
    run_shell, run_trajectory, BandResult, NoEffects, ShellConfig, TrajectoryConfig,
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
            &format!("{key} MOD1 min"),
            &row["mod1"],
            a.max_outage_1_min,
            a.never_available_1,
        ));
        out.push(mod_cell(
            &format!("{key} MOD4 min"),
            &row["mod4"],
            a.max_outage_4_min,
            a.never_available_4,
        ));
    }
    out
}

fn shell(size: Size, alt: f64, hemi: bool, cn0: Option<f64>) -> Result<Vec<BandResult>, String> {
    let (grid_levels, duration_min, step_min) = match size {
        Size::Full => (4, RUN_MIN, 1.0),
        Size::Reduced => (2, 1440.0, 10.0),
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
    })
}

fn trajectory(
    orbit: UserOrbit,
    duration_min: f64,
    step_min: f64,
    antennas: &[(NamedAntenna, Axis)],
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
pub fn run(tables: &str, size: Size) -> Result<Value, String> {
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
    let s0: Vec<Value> = SIGNALS
        .iter()
        .zip(S0_EXPECTED)
        .map(|(s, e)| {
            cell(
                &format!("MRTP {} dBW", s.name),
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

    // S1: upper SSV geometry.
    let r1 = shell(size, 36_000.0, true, None)?;
    put(
        "S1",
        "upper SSV geometry (table B4)",
        shell_rows(&arr(&t["upper_geometry"]), &r1, "B4", 2.0),
    );
    // S2: lower SSV.
    let r2 = shell(size, 8_000.0, false, None)?;
    put(
        "S2",
        "lower SSV geometry (table 5.2)",
        shell_rows(&arr(&t["lower_geometry"]), &r2, "5.2", 2.0),
    );
    // S3: upper SSV with RF thresholds.
    let mut s3 = Vec::new();
    for thr in [15.0, 20.0, 25.0] {
        let r = shell(size, 36_000.0, true, Some(thr))?;
        let key = format!("{}", thr as u32);
        s3.extend(shell_rows(
            &arr(&t["upper_rf"][&key]),
            &r,
            &format!("B9@{key}"),
            2.0,
        ));
    }
    put(
        "S3",
        "upper SSV with RF thresholds 15/20/25 dB-Hz (table B9)",
        s3,
    );

    // S4: GEO.
    let (geo_min, step) = match size {
        Size::Full => (RUN_MIN, 1.0),
        Size::Reduced => (1440.0, 10.0),
    };
    let era0 = super::geom::earth_rotation_angle(0.0).to_degrees();
    let mut s4 = Vec::new();
    for lon in [0, 60, 120, 180, 240, 300] {
        let orbit = UserOrbit {
            a_km: 42_164.0,
            e: 0.0,
            i_deg: 0.0,
            raan_deg: 0.0,
            argp_deg: 0.0,
            true_anomaly_deg: (f64::from(lon) + era0).rem_euclid(360.0),
        };
        let r = trajectory(
            orbit,
            geo_min,
            step,
            &[(NamedAntenna::BookletHighGain, Axis::Nadir)],
        )?;
        s4.extend(traj_rows(
            &arr(&t["geo"][&lon.to_string()]),
            &r,
            &format!("GEO {lon}E"),
            3.0,
            true,
        ));
    }
    put(
        "S4",
        "six GEO missions (tables 5.4 to 5.9), 20 dB-Hz, high-gain nadir antenna",
        s4,
    );

    // S5: HEO.
    let heo = super::scenario::preset_orbit("heo").ok_or("heo preset")?;
    let heo_min = match size {
        Size::Full => (1.5 * heo.period_min()).round(),
        Size::Reduced => 1440.0,
    };
    let r5 = trajectory(
        heo,
        heo_min,
        step,
        &[
            (NamedAntenna::BookletHighGain, Axis::Nadir),
            (NamedAntenna::BookletPatch, Axis::Zenith),
        ],
    )?;
    put(
        "S5",
        "HEO mission (table 5.11)",
        traj_rows(&arr(&t["heo"]), &r5, "HEO", 5.0, true),
    );

    // S6: lunar, perigee to apogee.
    let lunar = super::scenario::preset_orbit("lunar-transfer").ok_or("lunar preset")?;
    let lun_min = match size {
        Size::Full => (0.5 * lunar.period_min()).round(),
        Size::Reduced => 1440.0,
    };
    let r6 = trajectory(
        lunar,
        lun_min,
        step,
        &[
            (NamedAntenna::BookletHighGain, Axis::Nadir),
            (NamedAntenna::BookletPatch, Axis::Zenith),
        ],
    )?;
    put(
        "S6",
        "lunar mission (table 5.13)",
        traj_rows(&arr(&t["lunar"]), &r6, "lunar", 10.0, false),
    );

    Ok(
        json!({"size": if size == Size::Full { "full" } else { "reduced" }, "bars": Value::Object(bars)}),
    )
}
