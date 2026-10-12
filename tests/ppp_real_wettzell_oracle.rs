// SPDX-License-Identifier: AGPL-3.0-only
//! Float precise point positioning on real RINEX (`ppp_real::run_ppp`) against the published
//! ITRF2020 coordinate of the International GNSS Service (IGS) station WTZR (Wettzell).
//!
//! PRE-REGISTRATION: `tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md`, committed on
//! its own (7e62990) before the filter was written. Development used only the co-located
//! station WTZZ (`wtzz_development_run`); WTZR is the held-out test station.

use kshana::ppp_real::{enu_error, parse_antex_receiver, run_ppp, PppConfig, PppResult};
use kshana::precise_products::{parse_antex_satellites, parse_clock_rinex, PreciseProducts};
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

/// The ITRF2020 position (m) of the solution of `site` valid in 2025, propagated from 2015.0 to
/// `epoch_year`.
fn itrf2020(site: &str, epoch_year: f64) -> [f64; 3] {
    let text = read(DIR, "itrf2020_wtzr_wtzz.ssc");
    let lines: Vec<&str> = text.lines().collect();
    let mut found = None;
    for k in (0..lines.len()).step_by(2) {
        let l = lines[k];
        if l.contains(&format!(" {site} ")) && l.trim_end().ends_with("00:000:00000") {
            let p: Vec<f64> = l[36..].split_whitespace().take(3).map(|s| s.parse().unwrap()).collect();
            let v: Vec<f64> = lines[k + 1][36..]
                .split_whitespace()
                .take(3)
                .map(|s| s.parse().unwrap())
                .collect();
            found = Some([
                p[0] + v[0] * (epoch_year - 2015.0),
                p[1] + v[1] * (epoch_year - 2015.0),
                p[2] + v[2] * (epoch_year - 2015.0),
            ]);
        }
    }
    found.expect("ITRF2020 row")
}

/// 2025-02-24T03:00 as a decimal year.
const EPOCH_YEAR: f64 = 2025.0 + (54.0 + 3.0 / 24.0) / 365.0;

pub fn products() -> PreciseProducts {
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0)
}

fn run(file: &str, arp_up: f64, use_phase: bool) -> PppResult {
    let obs = parse_obs(&read(DIR, file)).unwrap();
    let ant = parse_antex_receiver(&read(DIR, "igs20_2025055_G_LEIAR25.atx"), "LEIAR25.R3      LEIT");
    assert!(ant.is_some());
    let cfg = PppConfig {
        antenna: ant,
        arp_une_m: [arp_up, 0.0, 0.0],
        use_phase,
        ..PppConfig::default()
    };
    run_ppp(&obs, &products(), &cfg)
}

fn report(name: &str, r: &PppResult, truth: [f64; 3]) {
    for (k, e) in r.epochs.iter().enumerate() {
        if k % 60 == 0 || k + 1 == r.epochs.len() {
            let d = enu_error(truth, e.pos_ecef_m);
            eprintln!(
                "{name} {:>6.0} s  E {:+.3} N {:+.3} U {:+.3}  ztd {:.4}  n {}  sig {:.3}",
                e.t_gps_s % 86400.0,
                d[0],
                d[1],
                d[2],
                e.ztd_m,
                e.n_sats,
                e.sigma_3d_m
            );
        }
    }
    eprintln!("{name}: {} of {} epochs, {} slips", r.epochs.len(), r.n_offered, r.n_slips);
}

/// Development run on WTZZ (not the registered test; printed, with a loose sanity bound).
#[test]
fn wtzz_development_run() {
    let truth = itrf2020("WTZZ", EPOCH_YEAR);
    let r = run("wtzz_2025055_0003_G.rnx", 0.2840, true);
    report("WTZZ", &r, truth);
    let last = r.epochs.last().unwrap();
    let d = enu_error(truth, last.pos_ecef_m);
    assert!((d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt() < 1.0);
}
