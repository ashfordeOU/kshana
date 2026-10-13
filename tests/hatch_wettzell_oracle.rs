// SPDX-License-Identifier: AGPL-3.0-only
//! Hatch carrier smoothing (`hatch::HatchFilter` through `pvt::assemble_epoch_precise_smoothed`)
//! on real RINEX: single-point positions of the IGS station WTZR with and without smoothing,
//! against its published ITRF2020 coordinate.
//!
//! PRE-REGISTRATION: `tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_HATCH.md`, committed on
//! its own (bd45812) before any single-point solution on these data was computed. Over
//! 01:00-05:59:30: H1 median 3-D error smoothed ≤ 0.6 × raw; H2 95th percentile smoothed ≤ 0.6 ×
//! raw; H3 at least 500 epochs solved by both. Window 100 epochs (50 min).

use kshana::gnss_sim::Meteo;
use kshana::precise_products::{parse_antex_satellites, parse_clock_rinex, PreciseProducts};
use kshana::pvt::{
    assemble_epoch_precise, assemble_epoch_precise_smoothed, solve_spp, CarrierSmoother,
};
use kshana::rinex_obs::parse_obs;
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

/// ITRF2020 WTZR solution 3 propagated from 2015.0 to 2025-02-24T03:00 (as in
/// `tests/ppp_real_wettzell_oracle.rs`).
fn truth() -> [f64; 3] {
    let dt = 10.0 + (54.0 + 3.0 / 24.0) / 365.0;
    [
        4_075_580.3902 - 0.01593 * dt,
        931_853.9684 + 0.01721 * dt,
        4_801_568.2294 + 0.01006 * dt,
    ]
}

fn p(v: &mut [f64], q: f64) -> f64 {
    v.sort_by(f64::total_cmp);
    v[((q * (v.len() - 1) as f64).round()) as usize]
}

#[test]
fn hatch_smoothing_brings_single_point_positions_closer_to_itrf2020() {
    let obs = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    let prod = PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0);
    let meteo = Meteo::default();
    let t = truth();
    let err = |x: [f64; 3]| {
        ((x[0] - t[0]).powi(2) + (x[1] - t[1]).powi(2) + (x[2] - t[2]).powi(2)).sqrt()
    };

    let mut smoother = CarrierSmoother::new(100, 90.0);
    let (mut ap_raw, mut ap_s) = (
        obs.header.approx_xyz.unwrap(),
        obs.header.approx_xyz.unwrap(),
    );
    let (mut raw, mut sm) = (Vec::new(), Vec::new());
    for k in 0..obs.epochs.len() {
        let sod = obs.epochs[k].time.hour * 3600 + obs.epochs[k].time.minute * 60;
        // Raw: iterate the a priori (three passes at the first epoch).
        let mut fix_raw = None;
        for _ in 0..if k == 0 { 3 } else { 1 } {
            let m: Vec<_> = assemble_epoch_precise(&obs, k, &prod, ap_raw, &meteo, 10.0)
                .into_iter()
                .map(|(_, m)| m)
                .collect();
            fix_raw = solve_spp(&m, ap_raw);
            if let Some(f) = fix_raw {
                ap_raw = f.ecef;
            }
        }
        // Smoothed: the filters are fed once per epoch, so the a priori is the previous fix.
        let m: Vec<_> =
            assemble_epoch_precise_smoothed(&obs, k, &prod, ap_s, &meteo, 10.0, &mut smoother)
                .into_iter()
                .map(|(_, m)| m)
                .collect();
        let mut fix_s = solve_spp(&m, ap_s);
        if k == 0 {
            if let Some(f) = fix_s {
                fix_s = solve_spp(&m, f.ecef);
            }
        }
        if let Some(f) = fix_s {
            ap_s = f.ecef;
        }
        if sod >= 3600 {
            if let (Some(a), Some(b)) = (fix_raw, fix_s) {
                raw.push(err(a.ecef));
                sm.push(err(b.ecef));
            }
        }
    }
    let n = raw.len();
    let (mr, ms) = (p(&mut raw, 0.5), p(&mut sm, 0.5));
    let (pr, ps) = (p(&mut raw, 0.95), p(&mut sm, 0.95));
    eprintln!(
        "{n} epochs: raw median {mr:.3} m p95 {pr:.3} m; smoothed median {ms:.3} m p95 {ps:.3} m; \
         ratios {:.3} / {:.3}",
        ms / mr,
        ps / pr
    );
    assert!(n >= 500, "H3");
    assert!(ms <= 0.6 * mr, "H1");
    assert!(ps <= 0.6 * pr, "H2");
}
