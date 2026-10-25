// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle row C1 of `xval/mission-thread/PREREGISTRATION.md`: the mean state of the `tli-and-cruise`
//! phase against the JPL Horizons trajectory of Artemis I / Orion (target -1023), over the 72 h coast arc
//! the pre-registration fixed.
//!
//! ```text
//! bash xval/mission-thread/fetch_data.sh <dir>
//! cargo run --release --example mission_thread_oracle -- <dir> > xval/mission-thread/results_oracle.json
//! ```
//!
//! The comparison runs the shipped phase (`tli-and-cruise` built from its model table, burn of zero, a
//! stated start state) for 12, 24, ... 72 hours, so it tests the code path the thread uses, and reads
//! the exit state each time. It tests the propagation of the mean state only: no covariance, filter,
//! update, burn model, overlay or other phase. Advisory software, not certified navigation equipment.

use kshana::mission_thread::phase::{Frame, NavState, Timescale};
use kshana::mission_thread::{earth::tli_cruise, ThreadCtx};
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

/// The bars fixed in the pre-registration.
const BAR_POSITION_M: f64 = 5_000.0;
const BAR_VELOCITY_MPS: f64 = 0.05;
/// The window: initial epoch (TDB Julian date of 2022-11-16 18:00), length and comparison cadence.
const START_JD_TDB: f64 = 2_459_900.25;
const WINDOW_H: u32 = 72;
const STEP_H: u32 = 12;
const KERNEL: &str = "tests/fixtures/mission_thread/de440s_moon_2022-11-16_2022-12-12.bsp";
const EPOCH_STR: &str = "2022-11-16T18:00:00Z";

struct State {
    jd_tdb: f64,
    x: [f64; 6],
}

/// The state rows of a Horizons JSON response, kilometres converted to metres.
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
            x: [
                p(2)? * 1e3,
                p(3)? * 1e3,
                p(4)? * 1e3,
                p(5)? * 1e3,
                p(6)? * 1e3,
                p(7)? * 1e3,
            ],
        });
    }
    Ok(out)
}

fn at(rows: &[State], jd: f64) -> Result<&State, String> {
    rows.iter()
        .find(|r| (r.jd_tdb - jd).abs() < 1e-6)
        .ok_or_else(|| format!("no Horizons row at JD(TDB) {jd}"))
}

fn norm3(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// Runs the phase from `start` for `hours` and returns the exit state.
fn run_phase(ctx: &ThreadCtx, start: &[f64; 6], hours: u32) -> Result<[f64; 6], String> {
    let model: toml::Table = toml::from_str(
        "tli_dv_mps = 0.0\ntli_dv_sigma_fraction = 0.0\ntli_pointing_sigma_rad = 0.0\n\
         step_s = 3600.0\nprocess_q_acc = 0.0\nclock_q_f = 0.0\nclock_q_d = 0.0\n",
    )
    .map_err(|e| e.to_string())?;
    let phase = tli_cruise::ctor(&model)?;
    let entry = NavState::diagonal(
        0.0,
        Frame::Gcrf,
        *start,
        1.0,
        1.0e-3,
        Timescale::Utc,
        1.0e-7,
        1.0e-12,
    );
    let mut pctx = ctx.phase_ctx(0, "c1", f64::from(hours) * 3600.0);
    pctx.nav = vec![kshana::mission_thread::phase::NavSource::Inertial];
    let o = phase.run(&entry, ctx, &pctx)?;
    Ok(o.exit.x)
}

fn compare(
    rows: &[State],
    ctx: &ThreadCtx,
    start: &[f64; 6],
) -> Result<(Vec<Value>, f64, f64), String> {
    let (mut worst_pos, mut vel_at_end) = (0.0_f64, 0.0_f64);
    let mut per = Vec::new();
    let mut h = STEP_H;
    while h <= WINDOW_H {
        let x = run_phase(ctx, start, h)?;
        let want = at(rows, START_JD_TDB + f64::from(h) / 24.0)?;
        let dp = norm3([x[0] - want.x[0], x[1] - want.x[1], x[2] - want.x[2]]);
        let dv = norm3([x[3] - want.x[3], x[4] - want.x[4], x[5] - want.x[5]]);
        worst_pos = worst_pos.max(dp);
        if h == WINDOW_H {
            vel_at_end = dv;
        }
        per.push(json!({ "hours": h, "position_difference_m": dp, "velocity_difference_mps": dv }));
        h += STEP_H;
    }
    Ok((per, worst_pos, vel_at_end))
}

/// A diagnostic, not part of the verdict: each tabulated state propagated one hour and compared with the next
/// tabulated state. A burn or a model deficiency shows as a step in the residual velocity.
fn diagnose(rows: &[State], ctx: &ThreadCtx) -> Result<Vec<Value>, String> {
    let mut out = Vec::new();
    for w in rows.windows(2) {
        if w[1].jd_tdb - w[0].jd_tdb > 1.0 / 24.0 + 1e-6 {
            continue;
        }
        let x = run_phase(ctx, &w[0].x, 1)?;
        let dp = [x[0] - w[1].x[0], x[1] - w[1].x[1], x[2] - w[1].x[2]];
        let dv = [x[3] - w[1].x[3], x[4] - w[1].x[4], x[5] - w[1].x[5]];
        out.push(json!({
            "hour_after_start": ((w[0].jd_tdb - START_JD_TDB) * 24.0).round(),
            "position_residual_m": norm3(dp),
            "velocity_residual_mps": norm3(dv),
            "velocity_residual_components_mps": dv,
        }));
    }
    Ok(out)
}

fn main() -> Result<(), String> {
    let args: Vec<String> = std::env::args().collect();
    let dir = args
        .get(1)
        .cloned()
        .ok_or("usage: mission_thread_oracle <data-dir> [diagnose]")?;
    let path = format!("{dir}/c1_artemis1_horizons.json");
    let bytes = std::fs::read(&path).map_err(|e| format!("{path}: {e}"))?;
    let sha = hex::encode(Sha256::digest(&bytes));
    let rows = parse_horizons(&path)?;
    let start = at(&rows, START_JD_TDB)?.x;
    let with_kernel_ctx = |epoch: &str| -> Result<ThreadCtx, String> {
        ThreadCtx::new(epoch, 1).with_moon_kernel_file(std::path::Path::new(KERNEL))
    };
    if args.get(2).map(String::as_str) == Some("diagnose") {
        let ctx = with_kernel_ctx(EPOCH_STR)?;
        let d = diagnose(&rows, &ctx)?;
        println!(
            "{}",
            serde_json::to_string_pretty(&d).map_err(|e| e.to_string())?
        );
        return Ok(());
    }
    let kernel_bytes = std::fs::read(KERNEL).map_err(|e| format!("{KERNEL}: {e}"))?;
    let kernel_sha = hex::encode(Sha256::digest(&kernel_bytes));

    let with_kernel =
        ThreadCtx::new(EPOCH_STR, 1).with_moon_kernel_file(std::path::Path::new(KERNEL))?;
    let analytic = ThreadCtx::new(EPOCH_STR, 1);
    let (per, worst_pos, vel_end) = compare(&rows, &with_kernel, &start)?;
    let (per_a, worst_pos_a, vel_end_a) = compare(&rows, &analytic, &start)?;
    let pos_met = worst_pos <= BAR_POSITION_M;
    let vel_met = vel_end <= BAR_VELOCITY_MPS;
    let doc = json!({
        "document": "xval/mission-thread oracle row C1",
        "advisory": "Advisory software, not certified navigation equipment.",
        "preregistration": "xval/mission-thread/PREREGISTRATION.md",
        "bars": { "position_m": BAR_POSITION_M, "velocity_mps": BAR_VELOCITY_MPS },
        "window": { "start_jd_tdb": START_JD_TDB, "hours": WINDOW_H, "compared_every_hours": STEP_H },
        "inputs": {
            "horizons_file": "c1_artemis1_horizons.json",
            "horizons_sha256": sha,
            "moon_kernel": KERNEL,
            "moon_kernel_sha256": kernel_sha,
        },
        "kernel_moon": {
            "per_epoch": per,
            "max_position_difference_m": worst_pos,
            "velocity_difference_at_end_mps": vel_end,
            "position_met": pos_met,
            "velocity_met": vel_met,
            "status": if pos_met && vel_met { "MET" } else { "NOT MET" },
        },
        "secondary_analytic_moon": {
            "note": "reported without a bar: the analytic series' 196 km Moon error is of the same order as the unmodelled effects at this bar",
            "per_epoch": per_a,
            "max_position_difference_m": worst_pos_a,
            "velocity_difference_at_end_mps": vel_end_a,
        },
        "tests": "the mean-state propagation of the tli-and-cruise phase over one coast arc; no covariance, filter, update, burn model, overlay or other phase",
    });
    println!(
        "{}",
        serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())?
    );
    Ok(())
}
