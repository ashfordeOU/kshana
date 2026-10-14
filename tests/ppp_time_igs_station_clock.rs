// SPDX-License-Identifier: AGPL-3.0-only
//! PPP receiver-clock time solution against the IGS final station clock (FUT-19).
//!
//! ORACLE: the IGS final combined clock for WTZR on 2025-02-24 (the `AR WTZR` records of
//! `IGS0OPSFIN_20250550000_01D_05M_CLK.CLK.gz`, SHA-256 d19f3d45…993d; fixture
//! `tests/fixtures/gnss_wettzell_2025055/igs_2025055_WTZR_05m_0006.clk`). The IGS combines
//! several analysis centres' network solutions, so it is external to Kshana.
//!
//! KSHANA SIDE: `ppp_real::run_ppp` with the configuration of `tests/ppp_real_wettzell_oracle.rs`.
//! The receiver clock is `PppEpoch::clock_m / c`.
//!
//! BARS, registered in `xval/ppp-time/PREREGISTRATION.md` (commit 661ad138, before any comparison),
//! over 04:00-05:55 at the IGS 5-minute epochs:
//!
//! - T1: standard deviation of (Kshana − IGS) ≤ 0.20 ns;
//! - T2: |mean| ≤ 5.0 ns;
//! - N: at least 20 common epochs.

use kshana::ppp_real::{parse_antex_receiver, run_ppp, PppConfig};
use kshana::precise_products::{
    parse_antex_satellites, parse_clock_rinex, parse_clock_rinex_records, PreciseProducts,
};
use kshana::rinex_obs::parse_obs;
use kshana::sp3::parse_sp3;
use std::collections::HashMap;
use std::path::PathBuf;

const DIR: &str = "gnss_wettzell_2025055";
const C: f64 = 299_792_458.0;
const T1_NS: f64 = 0.20;
const T2_NS: f64 = 5.0;
const N_MIN: usize = 20;

fn read(dir: &str, name: &str) -> String {
    let p = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(dir)
        .join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn stats(d: &[f64]) -> (f64, f64) {
    let n = d.len() as f64;
    let mean = d.iter().sum::<f64>() / n;
    let var = d.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1.0);
    (mean, var.sqrt())
}

#[test]
fn ppp_receiver_clock_matches_the_igs_station_clock_t1_t2() {
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    let prod = PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0);
    let obs = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
    let ant = parse_antex_receiver(
        &read(DIR, "igs20_2025055_G_LEIAR25.atx"),
        "LEIAR25.R3      LEIT",
    );
    let cfg = PppConfig {
        antenna: ant,
        arp_une_m: [0.0710, 0.0, 0.0],
        use_phase: true,
        ..PppConfig::default()
    };
    let r = run_ppp(&obs, &prod, &cfg);
    let igs = parse_clock_rinex_records(&read(DIR, "igs_2025055_WTZR_05m_0006.clk"), "AR").unwrap();
    let igs = &igs.sats["WTZR"];
    let at = |t: f64| {
        igs.iter()
            .find(|(ti, _)| (ti - t).abs() < 1e-3)
            .map(|(_, v)| *v)
    };
    let mut window = Vec::new();
    let mut all = Vec::new();
    for e in &r.epochs {
        if let Some(v) = at(e.t_gps_s) {
            let d_ns = (e.clock_m / C - v) * 1e9;
            all.push(d_ns);
            let sod = e.t_gps_s.rem_euclid(86_400.0);
            if (14_400.0..=21_300.0).contains(&sod) {
                window.push(d_ns);
            }
        }
    }
    let (m, s) = stats(&window);
    let (ma, sa) = stats(&all);
    eprintln!(
        "WTZR PPP clock - IGS: window n {} mean {m:.3} ns std {s:.3} ns; whole run n {} mean {ma:.3} ns std {sa:.3} ns",
        window.len(),
        all.len()
    );
    assert!(window.len() >= N_MIN, "N: {}", window.len());
    assert!(s <= T1_NS, "T1: std {s:.3} ns");
    assert!(m.abs() <= T2_NS, "T2: mean {m:.3} ns");
}
