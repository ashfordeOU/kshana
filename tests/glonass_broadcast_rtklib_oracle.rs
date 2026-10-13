// SPDX-License-Identifier: AGPL-3.0-only
//! The GLONASS broadcast satellite clock (`GlonassEphemeris::sv_clock_bias_s`) and broadcast
//! orbit (`GlonassEphemeris::position_ecef`) against RTKLIB `geph2clk` / `geph2pos`.
//!
//! Pre-registration: `xval/rtklib-glonass/PREREGISTRATION.md`, committed alone at e099c42a
//! before the function existed and before the harness was built or run. Bars: clock within
//! 1e-14 s and position within 0.01 m in every one of the 292 cases (4 GLONASS records of the
//! real 2013-01-01 broadcast file × 73 offsets within ±15 min).
//!
//! Oracle: RTKLIB v2.4.2-p13 (BSD-2-Clause, commit 71db0ffa) compiled from C source in a
//! separate harness (`xval/rtklib-glonass/`), reading the same RINEX file with its own reader;
//! output in `tests/fixtures/glonass_broadcast_rtklib_oracle/rtklib.csv`.
//!
//! VERDICT (2026-10-12, first run): AGREES at both pre-registered bars. 292 cases; worst clock
//! difference 0 s (the same arithmetic), worst position difference 1.12e-3 m, the predicted
//! effect of RTKLIB's older GM value. R02 carries gamma_n = -1.82e-12, so the slope is exercised;
//! a sign error on -tau_n or gamma_n would miss the clock bar by orders of magnitude.

use kshana::glonass::parse_glonass_nav;

const NAV: &str = include_str!("fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx");
const ORACLE: &str = include_str!("fixtures/glonass_broadcast_rtklib_oracle/rtklib.csv");
const TOL_CLK_S: f64 = 1e-14;
const TOL_POS_M: f64 = 0.01;
const CASES: usize = 4 * 73;

#[test]
fn glonass_broadcast_clock_and_orbit_match_rtklib() {
    let ephs = parse_glonass_nav(NAV).expect("GLONASS records");
    let (mut n, mut worst_c, mut worst_p) = (0usize, 0.0_f64, 0.0_f64);
    let mut fails = Vec::new();
    for line in ORACLE
        .lines()
        .skip(1)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
    {
        let f: Vec<&str> = line.split(',').collect();
        let prn: u8 = f[0].parse().unwrap();
        let ymdhms: Vec<f64> = f[1..7].iter().map(|x| x.parse().unwrap()).collect();
        let v: Vec<f64> = f[7..].iter().map(|x| x.parse().unwrap()).collect();
        let (dt, clk, pos) = (v[0], v[1], [v[2], v[3], v[4]]);
        let e = ephs
            .iter()
            .find(|e| {
                e.prn == prn
                    && e.epoch.year as f64 == ymdhms[0]
                    && e.epoch.month as f64 == ymdhms[1]
                    && e.epoch.day as f64 == ymdhms[2]
                    && e.epoch.hour as f64 == ymdhms[3]
                    && e.epoch.minute as f64 == ymdhms[4]
                    && (e.epoch.second - ymdhms[5]).abs() < 1e-3
            })
            .unwrap_or_else(|| panic!("no Kshana record for R{prn:02} at {ymdhms:?}"));
        let dc = (e.sv_clock_bias_s(dt) - clk).abs();
        let p = e.position_ecef(dt);
        let dp =
            ((p[0] - pos[0]).powi(2) + (p[1] - pos[1]).powi(2) + (p[2] - pos[2]).powi(2)).sqrt();
        worst_c = worst_c.max(dc);
        worst_p = worst_p.max(dp);
        if dc > TOL_CLK_S || dp > TOL_POS_M {
            fails.push(format!(
                "R{prn:02} dt {dt}: clock {dc:.3e} s, position {dp:.4e} m"
            ));
        }
        n += 1;
    }
    println!("{n} cases: worst clock {worst_c:.3e} s, worst position {worst_p:.4e} m");
    assert_eq!(n, CASES, "the pre-registered case set");
    assert!(
        fails.is_empty(),
        "{} cases outside the bars:\n{}",
        fails.len(),
        fails.join("\n")
    );
}
