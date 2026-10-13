// SPDX-License-Identifier: AGPL-3.0-only
//! The NRLMSISE-00 port (`kshana::nrlmsise00`) against external oracles, with the bars of
//! `xval/nrlmsise00-pymsis/PREREGISTRATION.md` (committed before the first comparison):
//!
//! * B1/B2 — pymsis 0.13.0 `version=0` (the NRL Fortran, single precision) on a 720-point grid
//!   (`tests/fixtures/nrlmsise00/pymsis_grid.txt`): relative total mass density ≤ 1e-5,
//!   temperature ≤ 1e-3 K;
//! * B3/B4 — the public-domain C port (release 20190709, double precision) on the same grid
//!   (`cport_grid.txt`): relative total mass density ≤ 1e-12, temperature ≤ 1e-9 K;
//! * B5 — the C distribution's published test-driver output (`c_test_output.txt`), the 17
//!   standard cases (switch 0 off = CGS; cases 16 and 17 in the switch-9 = −1 ap-array mode),
//!   all nine densities and both temperatures, to half a unit in the 7th significant figure.
//!
//! Provenance and licences: `tests/fixtures/nrlmsise00/NOTICE.md`.
//!
//! PIN-SCOPE:    `nrlmsise00::gtd7d` total mass density + temperature on the 720-point grid
//!               (daily-Ap mode, every switch on) and `nrlmsise00::gtd7` all outputs on the 17
//!               published C test cases.
//! PIN-EXCLUDES: GHP7 (not ported); the model's accuracy against measured density; the drag
//!               tier wiring in forces/propagator (its own MODELLED tests).

use kshana::nrlmsise00::{gtd7, gtd7d, Flags, Input};

const FIXTURES: &str = concat!(env!("CARGO_MANIFEST_DIR"), "/tests/fixtures/nrlmsise00/");

fn read_grid(name: &str) -> Vec<[f64; 10]> {
    let text = std::fs::read_to_string(format!("{FIXTURES}{name}")).expect("fixture readable");
    text.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let v: Vec<f64> = l
                .split_whitespace()
                .map(|x| x.parse().expect("number"))
                .collect();
            assert_eq!(v.len(), 10, "grid line: {l}");
            let mut a = [0.0; 10];
            a.copy_from_slice(&v);
            a
        })
        .collect()
}

fn grid_input(row: &[f64; 10]) -> Input {
    let (ut, lon) = (row[1], row[4]);
    Input {
        doy: row[0] as i32,
        sec: ut,
        alt_km: row[2],
        g_lat_deg: row[3],
        g_long_deg: lon,
        lst_h: ut / 3600.0 + lon / 15.0,
        f107a: row[5],
        f107: row[6],
        ap: row[7],
        ap_array: None,
    }
}

/// (max relative density difference, max |ΔT| K) of kshana against a grid fixture.
fn compare(name: &str) -> (f64, f64, usize) {
    let rows = read_grid(name);
    assert_eq!(rows.len(), 720, "{name}: grid size");
    let flags = Flags::default();
    let (mut worst_rho, mut worst_t) = (0.0f64, 0.0f64);
    for row in &rows {
        let out = gtd7d(&grid_input(row), &flags);
        let rel = (out.d[5] / row[8] - 1.0).abs();
        let dt = (out.t[1] - row[9]).abs();
        worst_rho = worst_rho.max(rel);
        worst_t = worst_t.max(dt);
    }
    (worst_rho, worst_t, rows.len())
}

#[test]
fn port_matches_pymsis_nrl_fortran_on_the_grid() {
    // PIN-SCOPE:    gtd7d rho and T vs pymsis 0.13.0 version=0, 720 points
    // PIN-EXCLUDES: species densities (pymsis grid stores rho and T only)
    let (rho, t, n) = compare("pymsis_grid.txt");
    println!("B1/B2 vs pymsis ({n} points): max rel rho {rho:.3e}, max |dT| {t:.3e} K");
    assert!(
        rho <= 1e-5,
        "B1 missed: max relative density difference {rho:e}"
    );
    assert!(t <= 1e-3, "B2 missed: max temperature difference {t:e} K");
}

#[test]
fn port_matches_the_double_precision_c_port_on_the_grid() {
    // PIN-SCOPE:    gtd7d rho and T vs the C port release 20190709, 720 points
    // PIN-EXCLUDES: species densities (grid stores rho and T only)
    let (rho, t, n) = compare("cport_grid.txt");
    println!("B3/B4 vs C port ({n} points): max rel rho {rho:.3e}, max |dT| {t:.3e} K");
    assert!(
        rho <= 1e-12,
        "B3 missed: max relative density difference {rho:e}"
    );
    assert!(t <= 1e-9, "B4 missed: max temperature difference {t:e} K");
}

/// The 17 inputs of the C test driver `nrlmsise-00_test.c`.
fn c_test_inputs() -> Vec<(Input, bool)> {
    let base = Input {
        doy: 172,
        sec: 29000.0,
        alt_km: 400.0,
        g_lat_deg: 60.0,
        g_long_deg: -70.0,
        lst_h: 16.0,
        f107a: 150.0,
        f107: 150.0,
        ap: 4.0,
        ap_array: None,
    };
    let mut v = vec![base; 17];
    v[1].doy = 81;
    v[2].sec = 75000.0;
    v[2].alt_km = 1000.0;
    v[3].alt_km = 100.0;
    v[10].alt_km = 0.0;
    v[11].alt_km = 10.0;
    v[12].alt_km = 30.0;
    v[13].alt_km = 50.0;
    v[14].alt_km = 70.0;
    v[16].alt_km = 100.0;
    v[4].g_lat_deg = 0.0;
    v[5].g_long_deg = 0.0;
    v[6].lst_h = 4.0;
    v[7].f107a = 70.0;
    v[8].f107 = 180.0;
    v[9].ap = 40.0;
    v[15].ap_array = Some([100.0; 7]);
    v[16].ap_array = Some([100.0; 7]);
    // Cases 16 and 17 (index 15, 16) run with switch 9 = -1.
    v.into_iter()
        .enumerate()
        .map(|(i, inp)| (inp, i >= 15))
        .collect()
}

#[test]
fn port_reproduces_the_published_c_test_driver_output() {
    // PIN-SCOPE:    gtd7 all 9 densities + 2 temperatures, the 17 published C test cases
    // PIN-EXCLUDES: nothing beyond the printed 7 significant figures
    let text = std::fs::read_to_string(format!("{FIXTURES}c_test_output.txt")).unwrap();
    let expected: Vec<Vec<&str>> = text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split_whitespace().collect())
        .collect();
    assert_eq!(expected.len(), 17);
    let mut worst_units = 0.0f64; // in units of the 7th significant figure
    for (case, ((input, ap_mode), exp)) in c_test_inputs().iter().zip(&expected).enumerate() {
        let mut flags = Flags::default();
        flags.switches[0] = 0;
        if *ap_mode {
            flags.switches[9] = -1;
        }
        let out = gtd7(input, &flags);
        let got: Vec<f64> = out.d.iter().chain(out.t.iter()).copied().collect();
        assert_eq!(exp.len(), 11);
        for (k, s) in exp.iter().enumerate() {
            let x: f64 = s.parse().unwrap();
            if x == 0.0 {
                assert_eq!(got[k], 0.0, "case {} value {k}: printed 0", case + 1);
                continue;
            }
            let e: i32 = s.split('E').nth(1).unwrap().parse().unwrap();
            let unit = 1e-6 * 10f64.powi(e);
            let units = (got[k] - x).abs() / unit;
            worst_units = worst_units.max(units);
            assert!(
                units <= 0.5 * (1.0 + 1e-9),
                "B5 missed: case {} value {k}: kshana {:e} vs printed {s} ({units:.3} units)",
                case + 1,
                got[k]
            );
        }
    }
    println!("B5 vs published C output: worst {worst_units:.3} units of the 7th figure (bar 0.5)");
}
