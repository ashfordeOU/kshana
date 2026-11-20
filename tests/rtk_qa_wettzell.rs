// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana's RTK engine (`rtk_real::run_rtk`) on real RINEX (WTZR base, WTZZ rover at Wettzell; the
//! fixture of `tests/rtk_real_wettzell_oracle.rs`) written as an RTKLIB-style `.pos` with ENU
//! standard deviations and covariances from the filter (`rtk_real::to_pos`), then checked by
//! `kshana rtk-qa fix` (`rtk_qa::fix_check`): the real session passes, and the same session with one
//! L1 wavelength added to a later run of fixes fails with the wavelength named. The fixed position
//! is also checked against the published ITRF2020 rover coordinate as a control point.

use kshana::precise_products::{parse_antex_satellites, parse_clock_rinex, PreciseProducts};
use kshana::rinex_obs::parse_obs;
use kshana::rtk_qa::fix_check;
use kshana::rtk_real::{cov_enu, run_rtk, to_pos, RtkConfig};
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
/// ITRF2020 solution 3 of WTZR and WTZZ (2015.0 positions, one shared velocity), as in
/// tests/rtk_real_wettzell_oracle.rs.
const WTZR: [f64; 3] = [4_075_580.390_2, 931_853.968_4, 4_801_568.229_4];
const WTZZ: [f64; 3] = [4_075_579.271_0, 931_853.283_4, 4_801_569.139_0];
const VEL: [f64; 3] = [-0.01593, 0.01721, 0.01006];
const DT_YEARS: f64 = 10.0 + (54.0 + 3.0 / 24.0) / 365.0;

fn arp(marker: [f64; 3], h: f64) -> [f64; 3] {
    let m = [0, 1, 2].map(|k| marker[k] + VEL[k] * DT_YEARS);
    let g = kshana::frames::ecef_to_geodetic(m);
    let u = [
        g.lat_rad.cos() * g.lon_rad.cos(),
        g.lat_rad.cos() * g.lon_rad.sin(),
        g.lat_rad.sin(),
    ];
    [0, 1, 2].map(|k| m[k] + h * u[k])
}

#[test]
fn the_rtk_engine_output_is_verified_and_a_wrong_fix_is_found() {
    let base = parse_obs(&read(DIR, "wtzr_2025055_0006_G.rnx")).unwrap();
    let rover = parse_obs(&read(DIR, "wtzz_2025055_0003_G.rnx")).unwrap();
    let sp3 = parse_sp3(&read("sp3_clock_igs_oracle", "igs_2025055_G.sp3")).unwrap();
    let clk = parse_clock_rinex(&read(DIR, "igs_2025055_G_05m_0006.clk")).unwrap();
    let atx = parse_antex_satellites(&read(DIR, "igs20_2025055_G_LEIAR25.atx")).unwrap();
    let prod = PreciseProducts::new(&sp3, clk, atx, HashMap::new(), 600.0);
    let base_arp = arp(WTZR, 0.0710);
    let (hb, hr) = (
        base.header.approx_xyz.unwrap(),
        rover.header.approx_xyz.unwrap(),
    );
    let b0 = [hr[0] - hb[0], hr[1] - hb[1], hr[2] - hb[2]];
    let r = run_rtk(&base, &rover, &prod, base_arp, b0, &RtkConfig::default());

    // the filter's covariances: the fixed one smaller than the float one, both symmetric
    let last = r
        .epochs
        .iter()
        .rev()
        .find(|e| e.fixed_cov_m2.is_some())
        .unwrap();
    let rover_x = [0, 1, 2].map(|k| base_arp[k] + last.float_baseline_m[k]);
    let fe = cov_enu(rover_x, &last.fixed_cov_m2.unwrap());
    let fl = cov_enu(rover_x, &last.float_cov_m2);
    for i in 0..3 {
        assert!(
            fe[i][i] > 0.0 && fe[i][i] <= fl[i][i] + 1e-12,
            "{fe:?} {fl:?}"
        );
        for (j, row) in fe.iter().enumerate() {
            assert!((fe[i][j] - row[i]).abs() < 1e-12);
        }
    }
    assert!(fe[2][2].sqrt() < 0.02);

    // the real session, with the published rover coordinate as the control point
    let truth = arp(WTZZ, 0.2840);
    let g = kshana::frames::ecef_to_geodetic(truth);
    let control = fix_check::Control {
        name: "WTZZ".into(),
        llh: [g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m],
    };
    let pos = to_pos(&r, base_arp);
    let epochs = fix_check::parse_pos(&pos).unwrap();
    assert_eq!(epochs.len(), r.epochs.len());
    let rep = fix_check::check(
        &epochs,
        std::slice::from_ref(&control),
        &fix_check::FixConfig::default(),
    );
    assert_eq!(rep.occupations.len(), 1);
    let o = &rep.occupations[0];
    assert!(
        o.findings.iter().all(|f| f.severity != "fail"),
        "{:?}",
        o.findings
    );
    let ok = o.findings.iter().find(|f| f.code == "control-ok").unwrap();
    assert!(ok.value.unwrap() < 0.02, "{ok:?}");

    // the same session with one L1 wavelength (vertical) added to the fixes after a float epoch
    let mut bad = r.clone();
    let n = bad.epochs.len();
    let u = {
        let x = kshana::frames::ecef_to_geodetic(truth);
        [
            x.lat_rad.cos() * x.lon_rad.cos(),
            x.lat_rad.cos() * x.lon_rad.sin(),
            x.lat_rad.sin(),
        ]
    };
    bad.epochs[n - 61].fixed_baseline_m = None;
    for e in &mut bad.epochs[n - 60..] {
        if let Some(b) = e.fixed_baseline_m.as_mut() {
            for k in 0..3 {
                b[k] += 0.1903 * u[k];
            }
        }
    }
    let rep = fix_check::check(
        &fix_check::parse_pos(&to_pos(&bad, base_arp)).unwrap(),
        &[],
        &fix_check::FixConfig::default(),
    );
    let o = &rep.occupations[0];
    assert_eq!(o.verdict, "fail");
    let f = o
        .findings
        .iter()
        .find(|f| f.code == "inconsistent-fixes")
        .unwrap();
    assert_eq!(f.wavelength, Some("L1"), "{f:?}");
}
