// SPDX-License-Identifier: AGPL-3.0-only
//! C2 procedure steps 3 and 4 (`docs/mission-thread/PREREGISTRATION-C2.md`; readings in
//! `xval/mission-thread-c2/README.md`). W1 only: W2 is "not run" under the pre-registration's section 2.
//!
//!   cargo run --release --example mission_thread_c2 -- detect <dir>   # step 3: events and impulses from T
//!   cargo run --release --example mission_thread_c2 -- score  <dir>   # step 4: the comparison on H, once
//!
//! `<dir>` holds `c1_artemis1_horizons.json` (T, from `xval/mission-thread/fetch_data.sh`) and, for `score`,
//! `c2_artemis1_h.json` (H, from `xval/mission-thread-c2/fetch_h.sh`). Writes JSON to standard output.
//! MODELLED; advisory software, not certified navigation equipment.

use kshana::mission_thread::earth::tli_cruise;
use kshana::mission_thread::impulses::{detect, HourResidual, C2_THRESHOLD_MPS};
use kshana::mission_thread::phase::{Frame, NavSource, NavState, Timescale};
use kshana::mission_thread::ThreadCtx;
use serde_json::{json, Value};
use sha2::{Digest, Sha256};

const START_JD_TDB: f64 = 2_459_900.25; // 2022-11-16 18:00 TDB
const EPOCH_STR: &str = "2022-11-16T18:00:00Z";
const KERNEL: &str = "tests/fixtures/mission_thread/de440s_moon_2022-11-16_2022-12-12.bsp";
// The SHA-256 of T's state table (from `$$SOE` to `$$EOE` inclusive). The whole response is not pinned: its
// header carries the retrieval date and EOP file, so every fetch hashes differently. C1's diagnostic
// recomputed on this table equals xval/mission-thread/results_diagnostic.json exactly (README, step 3).
const T_TABLE_SHA256: &str = "241d674c140f95d5781e4525ccf636546db8b5b05b1652869a8ef15768f23826";
const BAR_POSITION_M: f64 = 2_000.0;
const BAR_VELOCITY_MPS: f64 = 0.01;
const IMPULSES: &str = "xval/mission-thread-c2/impulses.json";

struct State {
    jd_tdb: f64,
    x: [f64; 6],
}

fn parse(path: &str) -> Result<(Vec<State>, String), String> {
    let bytes = std::fs::read(path).map_err(|e| format!("{path}: {e}"))?;
    let v: Value = serde_json::from_slice(&bytes).map_err(|e| format!("{path}: {e}"))?;
    let r = v["result"]
        .as_str()
        .ok_or(format!("{path}: no result text"))?;
    let (a, b) = (
        r.find("$$SOE").ok_or("no $$SOE")?,
        r.find("$$EOE").ok_or("no $$EOE")?,
    );
    let sha = hex::encode(Sha256::digest(&r.as_bytes()[a..b + 5]));
    let mut out = Vec::new();
    for line in r[a + 5..b].lines().map(str::trim).filter(|l| !l.is_empty()) {
        let f: Vec<&str> = line.split(',').map(str::trim).collect();
        let p = |i: usize| {
            f[i].parse::<f64>()
                .map_err(|_| format!("bad number `{}`", f[i]))
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
    Ok((out, sha))
}

fn norm3(a: [f64; 3]) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}

/// The C1 code path: the tli-and-cruise phase with no burn, from `start` at `start_s`, for `secs`, with the
/// impulses (times from the window start) that fall inside the run.
fn run(
    ctx: &ThreadCtx,
    start: [f64; 6],
    start_s: f64,
    secs: f64,
    impulses: &[(f64, [f64; 3])],
) -> Result<[f64; 6], String> {
    let mut m = String::from(
        "tli_dv_mps = 0.0\ntli_dv_sigma_fraction = 0.0\ntli_pointing_sigma_rad = 0.0\n\
         step_s = 3600.0\nprocess_q_acc = 0.0\nclock_q_f = 0.0\nclock_q_d = 0.0\n",
    );
    for (t, dv) in impulses {
        let rel = t - start_s;
        if rel >= 0.0 && rel <= secs {
            m += &format!(
                "[[impulses]]\nt_s = {rel:?}\ndv_mps = [{:?}, {:?}, {:?}]\n",
                dv[0], dv[1], dv[2]
            );
        }
    }
    let model: toml::Table = toml::from_str(&m).map_err(|e| e.to_string())?;
    let phase = tli_cruise::ctor(&model)?;
    let entry = NavState::diagonal(
        start_s,
        Frame::Gcrf,
        start,
        1.0,
        1.0e-3,
        Timescale::Utc,
        1.0e-7,
        1.0e-12,
    );
    let mut pctx = ctx.phase_ctx(0, "c2", secs);
    pctx.nav = vec![NavSource::Inertial];
    Ok(phase.run(&entry, ctx, &pctx)?.exit.x)
}

fn main() -> Result<(), String> {
    let a: Vec<String> = std::env::args().collect();
    let (cmd, dir) = (
        a.get(1).ok_or("detect|score <dir>")?.as_str(),
        a.get(2).ok_or("<dir>")?,
    );
    let (t, t_sha) = parse(&format!("{dir}/c1_artemis1_horizons.json"))?;
    if t_sha != T_TABLE_SHA256 {
        return Err(format!(
            "T table sha256 {t_sha} is not the recorded {T_TABLE_SHA256}"
        ));
    }
    let ctx = ThreadCtx::new(EPOCH_STR, 1).with_moon_kernel_file(std::path::Path::new(KERNEL))?;
    let s_of = |jd: f64| (jd - START_JD_TDB) * 86_400.0;
    match cmd {
        "detect" => {
            let mut res = Vec::new();
            for w in t.windows(2) {
                let len = s_of(w[1].jd_tdb) - s_of(w[0].jd_tdb);
                let x = run(&ctx, w[0].x, s_of(w[0].jd_tdb), len, &[])?;
                res.push(HourResidual {
                    start_s: s_of(w[0].jd_tdb),
                    length_s: len,
                    dv_mps: [w[1].x[3] - x[3], w[1].x[4] - x[4], w[1].x[5] - x[5]],
                });
            }
            let d = detect(&res, C2_THRESHOLD_MPS);
            let quiet = res
                .iter()
                .filter(|r| norm3(r.dv_mps) <= C2_THRESHOLD_MPS)
                .map(|r| norm3(r.dv_mps))
                .fold(0.0f64, f64::max);
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "step": 3, "window": "W1", "threshold_mps": C2_THRESHOLD_MPS,
                    "t_table_sha256": t_sha, "hours": res.len(),
                    "event_hours_after_start": d.event_hours_s.iter().map(|s| s / 3600.0).collect::<Vec<_>>(),
                    "events": d.events.iter().map(|e| [e.0 / 3600.0, e.1 / 3600.0]).collect::<Vec<_>>(),
                    "impulses": d.impulses.iter().map(|(ts, dv)| json!({"t_s": ts, "dv_mps": dv, "size_mps": norm3(*dv)})).collect::<Vec<_>>(),
                    "max_quiet_hour_residual_mps": quiet,
                }))
                .map_err(|e| e.to_string())?
            );
        }
        "score" => {
            let imp: Value = serde_json::from_str(
                &std::fs::read_to_string(IMPULSES).map_err(|e| format!("{IMPULSES}: {e}"))?,
            )
            .map_err(|e| e.to_string())?;
            let impulses: Vec<(f64, [f64; 3])> = imp["impulses"]
                .as_array()
                .ok_or("no impulses")?
                .iter()
                .map(|i| {
                    (
                        i["t_s"].as_f64().unwrap(),
                        std::array::from_fn(|k| i["dv_mps"][k].as_f64().unwrap()),
                    )
                })
                .collect();
            let (h, h_sha) = parse(&format!("{dir}/c2_artemis1_h.json"))?;
            // PIN-SCOPE:    the number of half-hour held-out states in W1 the pre-registration names
            // PIN-EXCLUDES: their values and every result
            if h.len() != 71 {
                return Err(format!("H has {} states, not 71: C2 is not run", h.len()));
            }
            let start = t
                .iter()
                .find(|s| (s.jd_tdb - START_JD_TDB).abs() < 1e-6)
                .ok_or("no T state at the window start")?
                .x;
            let mut per = Vec::new();
            let (mut worst, mut vel_end) = (0.0f64, 0.0f64);
            for (i, s) in h.iter().enumerate() {
                let x = run(&ctx, start, 0.0, s_of(s.jd_tdb), &impulses)?;
                let dp = norm3([x[0] - s.x[0], x[1] - s.x[1], x[2] - s.x[2]]);
                let dv = norm3([x[3] - s.x[3], x[4] - s.x[4], x[5] - s.x[5]]);
                worst = worst.max(dp);
                if i == h.len() - 1 {
                    vel_end = dv;
                }
                per.push(json!({"hours_after_start": s_of(s.jd_tdb) / 3600.0, "position_difference_m": dp, "velocity_difference_mps": dv}));
            }
            let (pm, vm) = (worst <= BAR_POSITION_M, vel_end <= BAR_VELOCITY_MPS);
            println!(
                "{}",
                serde_json::to_string_pretty(&json!({
                    "step": 4, "window": "W1", "w2": "not run (pre-registration section 2; xval/mission-thread-c2/README.md)",
                    "t_table_sha256": t_sha, "h_table_sha256": h_sha, "impulses": impulses.len(),
                    "bars": {"C2a_position_m": BAR_POSITION_M, "C2b_velocity_mps": BAR_VELOCITY_MPS},
                    "max_position_difference_m": worst, "velocity_difference_at_last_h_mps": vel_end,
                    "C2a_met": pm, "C2b_met": vm, "W1": if pm && vm { "MET" } else { "NOT MET" },
                    "C2": if pm && vm { "MET (W1 only; W2 not run)" } else { "NOT MET" },
                    "per_state": per,
                }))
                .map_err(|e| e.to_string())?
            );
        }
        _ => return Err("detect|score <dir>".into()),
    }
    Ok(())
}
