// SPDX-License-Identifier: AGPL-3.0-only
//! Float precise point positioning on real RINEX (`ppp_real::run_ppp`) against the published
//! ITRF2020 coordinate of the International GNSS Service (IGS) station WTZR (Wettzell).
//!
//! PRE-REGISTRATION: `tests/fixtures/gnss_wettzell_2025055/PREREGISTRATION_PPP.md`, committed on
//! its own (7e62990) before the filter was written. Development used only the co-located
//! station WTZZ (`wtzz_development_run`); WTZR is the held-out test station.
//!
//! RESULT of the first and only registered run (2026-10-12, on 386b531): P1, P2, P3 and D hold.
//! Last epoch: horizontal error 0.0015 m, up −0.0289 m (bars 0.05 / 0.10 m). 04:00-05:59:30:
//! 240 of 240 epochs within 0.10 m in 3-D, 95th percentile 0.067 m. Code-only filter 95th
//! percentile 1.70 m (25 times the PPP figure; bar twice). 719 of 720 epochs solved; 25 phase
//! re-initialisations (WTZZ development run: 0). That run then stopped in the data-gated Z part
//! on a column-offset bug in this test's EUREF line parser (seconds of day read from 21..26
//! instead of 20..25), before any assertion; fixed, the re-run reproduces the numbers above and
//! gives Z: zenith total delay root-mean-square 0.0167 m against the EUREF product at the four
//! hourly epochs 02:30-05:30 (bar 0.02 m; not part of the promotion rule, product not vendored).

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
            let p: Vec<f64> = l[36..]
                .split_whitespace()
                .take(3)
                .map(|s| s.parse().unwrap())
                .collect();
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
    let ant = parse_antex_receiver(
        &read(DIR, "igs20_2025055_G_LEIAR25.atx"),
        "LEIAR25.R3      LEIT",
    );
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
    eprintln!(
        "{name}: {} of {} epochs, {} slips",
        r.epochs.len(),
        r.n_offered,
        r.n_slips
    );
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

fn d3(d: [f64; 3]) -> f64 {
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

fn p95(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    v[((0.95 * (v.len() - 1) as f64).round()) as usize]
}

/// Seconds of day of the last-two-hours window, 04:00:00-05:59:30.
fn in_window(t: f64) -> bool {
    let sod = t.rem_euclid(86_400.0);
    (14_400.0..21_600.0).contains(&sod)
}

/// The registered test (P1, P2, P3, D; Z when the EUREF product is given).
#[test]
fn wtzr_float_ppp_meets_the_registered_itrf2020_bars() {
    let truth = itrf2020("WTZR", EPOCH_YEAR);
    let r = run("wtzr_2025055_0006_G.rnx", 0.0710, true);
    report("WTZR", &r, truth);
    let code = run("wtzr_2025055_0006_G.rnx", 0.0710, false);

    let last = r.epochs.last().unwrap();
    let dl = enu_error(truth, last.pos_ecef_m);
    let h_last = (dl[0] * dl[0] + dl[1] * dl[1]).sqrt();
    let win: Vec<f64> = r
        .epochs
        .iter()
        .filter(|e| in_window(e.t_gps_s))
        .map(|e| d3(enu_error(truth, e.pos_ecef_m)))
        .collect();
    let within = win.iter().filter(|&&d| d <= 0.10).count() as f64 / win.len() as f64;
    let ppp_p95 = p95(win.clone());
    let code_win: Vec<f64> = code
        .epochs
        .iter()
        .filter(|e| in_window(e.t_gps_s))
        .map(|e| d3(enu_error(truth, e.pos_ecef_m)))
        .collect();
    let code_p95 = p95(code_win);
    let solved = r.epochs.len() as f64 / 720.0;
    eprintln!(
        "WTZR last epoch: horizontal {h_last:.4} m, up {:+.4} m; 04-06 h: {:.1} % within 0.10 m \
         ({} epochs), p95 {ppp_p95:.4} m; code-only p95 {code_p95:.4} m; solved {:.1} %",
        dl[2],
        100.0 * within,
        win.len(),
        100.0 * solved
    );

    // Z (data-gated): EUREF zenith total delay.
    match std::env::var("KSHANA_EUREF_TRO") {
        Ok(path) => {
            let text = std::fs::read_to_string(&path).expect("KSHANA_EUREF_TRO (plain text)");
            let mut sq = Vec::new();
            for l in text
                .lines()
                .filter(|l| l.starts_with(" WTZR00DEU 2025:055:"))
            {
                let sod: f64 = l[20..25].parse().unwrap();
                let ztd_mm: f64 = l[25..].split_whitespace().next().unwrap().parse().unwrap();
                if !(9_000.0..=19_800.0).contains(&sod) {
                    continue;
                }
                if let Some(e) = r
                    .epochs
                    .iter()
                    .find(|e| e.t_gps_s.rem_euclid(86_400.0) == sod)
                {
                    sq.push((e.ztd_m - ztd_mm * 1e-3).powi(2));
                }
            }
            let rms = (sq.iter().sum::<f64>() / sq.len() as f64).sqrt();
            eprintln!(
                "Z: ZTD RMS vs EUREF {rms:.4} m over {} hourly epochs (bar 0.02 m)",
                sq.len()
            );
        }
        Err(_) => eprintln!("Z: skipped (set KSHANA_EUREF_TRO to the decompressed EUREF TRO file)"),
    }

    assert!(solved >= 0.95, "P3");
    assert!(h_last <= 0.05 && dl[2].abs() <= 0.10, "P1");
    assert!(within >= 0.95, "P2");
    assert!(code_p95 >= 2.0 * ppp_p95, "D");
}
