// SPDX-License-Identifier: AGPL-3.0-only
//! RTK double differences with LAMBDA integer fixing (`rtk_real::run_rtk`) on real RINEX: the
//! IGS stations WTZR (base) and WTZZ (rover) at Wettzell, against the published ITRF2020 baseline.
//!
//! PRE-REGISTRATION: `tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_RTK.md`, committed on
//! its own (2b81bfa) before the RTK code was written. Over 00:00-02:59:30: K1 accepted fixes
//! (ratio ≥ 3) at ≥ 90 % of epochs from 00:10; K2 fixed-baseline error median ≤ 0.010 m and
//! p95 ≤ 0.020 m; K3 float baseline at the last epoch ≤ 0.05 m; D over 00:00-00:09:30 the fixed
//! median error at most half the float median at the same epochs; non-vacuity 300 epochs.
//!
//! RESULT of the first and only run (2026-10-13, on 8867d66), all bars held: 359 epochs, 0 slips;
//! accepted fixes at 100 % of the epochs from 00:10 (359 fixes in all); fixed-baseline error
//! median 0.0045 m, 95th percentile 0.0055 m; float baseline at the last epoch 0.0041 m; in the
//! first 10 minutes 19 fixes with median error 0.0026 m against 0.1298 m for the float solution.

use kshana::precise_products::{parse_antex_satellites, parse_clock_rinex, PreciseProducts};
use kshana::rinex_obs::parse_obs;
use kshana::rtk_real::{run_rtk, RtkConfig, RtkResult};
use kshana::sp3::parse_sp3;
use std::collections::HashMap;
use std::path::PathBuf;

fn read(dir: &str, name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(dir)
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

const DIR: &str = "gnss_wettzell_2025055";

/// ITRF2020 solution 3 of WTZR and WTZZ (2015.0 positions; both carry the same velocity).
const WTZR: [f64; 3] = [4_075_580.390_2, 931_853.968_4, 4_801_568.229_4];
const WTZZ: [f64; 3] = [4_075_579.271_0, 931_853.283_4, 4_801_569.139_0];
const VEL: [f64; 3] = [-0.01593, 0.01721, 0.01006];
const DT_YEARS: f64 = 10.0 + (54.0 + 3.0 / 24.0) / 365.0;

fn up(r: [f64; 3]) -> [f64; 3] {
    let g = kshana::frames::ecef_to_geodetic(r);
    [
        g.lat_rad.cos() * g.lon_rad.cos(),
        g.lat_rad.cos() * g.lon_rad.sin(),
        g.lat_rad.sin(),
    ]
}

fn arp(marker: [f64; 3], h: f64) -> [f64; 3] {
    let m = [
        marker[0] + VEL[0] * DT_YEARS,
        marker[1] + VEL[1] * DT_YEARS,
        marker[2] + VEL[2] * DT_YEARS,
    ];
    let u = up(m);
    [m[0] + h * u[0], m[1] + h * u[1], m[2] + h * u[2]]
}

fn dist(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

fn median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    v[v.len() / 2]
}

fn p95(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    v[((0.95 * (v.len() - 1) as f64).round()) as usize]
}

fn run() -> (RtkResult, [f64; 3]) {
    let base = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
    let rover = parse_obs(&read(DIR, "wtzz_2025055_0003_G.rnx")).unwrap();
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    let prod = PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0);
    let base_arp = arp(WTZR, 0.0710);
    let truth = {
        let r = arp(WTZZ, 0.2840);
        [r[0] - base_arp[0], r[1] - base_arp[1], r[2] - base_arp[2]]
    };
    // A-priori baseline from the RINEX header positions (metre-level), not from the reference.
    let (hb, hr) = (
        base.header.approx_xyz.unwrap(),
        rover.header.approx_xyz.unwrap(),
    );
    let b0 = [hr[0] - hb[0], hr[1] - hb[1], hr[2] - hb[2]];
    (
        run_rtk(&base, &rover, &prod, base_arp, b0, &RtkConfig::default()),
        truth,
    )
}

#[test]
fn rtk_with_lambda_meets_the_registered_itrf2020_baseline_bars() {
    let (r, truth) = run();
    let sod = |t: f64| t.rem_euclid(86_400.0);
    let n = r.epochs.len();
    let after: Vec<_> = r
        .epochs
        .iter()
        .filter(|e| sod(e.t_gps_s) >= 600.0)
        .collect();
    let fix_rate = after
        .iter()
        .filter(|e| e.fixed_baseline_m.is_some())
        .count() as f64
        / after.len() as f64;
    let fixed_err: Vec<f64> = r
        .epochs
        .iter()
        .filter_map(|e| e.fixed_baseline_m.map(|b| dist(b, truth)))
        .collect();
    let last_float = dist(r.epochs.last().unwrap().float_baseline_m, truth);
    let early: Vec<_> = r
        .epochs
        .iter()
        .filter(|e| sod(e.t_gps_s) < 600.0 && e.fixed_baseline_m.is_some())
        .collect();
    let (d_fix, d_float) = if early.is_empty() {
        (f64::INFINITY, 0.0)
    } else {
        (
            median(
                early
                    .iter()
                    .map(|e| dist(e.fixed_baseline_m.unwrap(), truth))
                    .collect(),
            ),
            median(
                early
                    .iter()
                    .map(|e| dist(e.float_baseline_m, truth))
                    .collect(),
            ),
        )
    };
    let (med, p) = if fixed_err.is_empty() {
        (f64::INFINITY, f64::INFINITY)
    } else {
        (median(fixed_err.clone()), p95(fixed_err.clone()))
    };
    eprintln!(
        "{n} epochs, {} slips; fix rate from 00:10 {:.1} %; fixed error median {:.4} m p95 {:.4} m \
         ({} fixes); last float {:.4} m; first 10 min: {} fixes, fixed median {:.4} m vs float {:.4} m",
        r.n_slips,
        100.0 * fix_rate,
        med,
        p,
        fixed_err.len(),
        last_float,
        early.len(),
        d_fix,
        d_float
    );
    assert!(n >= 300, "non-vacuity");
    assert!(fix_rate >= 0.90, "K1");
    assert!(med <= 0.010 && p <= 0.020, "K2");
    assert!(last_float <= 0.05, "K3");
    assert!(d_fix <= 0.5 * d_float, "D");
}
