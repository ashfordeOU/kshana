// SPDX-License-Identifier: AGPL-3.0-only
//! Two-part Julian dates through Earth rotation on the orbit path (package WP-03, item RM-20 /
//! CAP-02a), against SOFA through ERFA.
//!
//! PRE-REGISTRATION (written 2026-10-13 and committed with the epochs, before the engine
//! functions exist and before the oracle was run).
//!
//! WHY. A single-`f64` Julian date near 2.46e6 resolves about 40 µs; Earth rotation turns
//! 7.29e-5 rad/s, so the Earth-fixed rotation of an orbit position is quantised at about
//! 3e-9 rad (2 cm on the ground, 13 cm at GNSS orbit, 13 cm at GEO). SGP4 and pass prediction
//! already take a two-part date; the `orbit::Propagator` frame path and the ephemeris scenario
//! do not.
//!
//! CHANGE UNDER TEST (additive; no existing function changes):
//! - `jd2::gmst82(ut1: Jd2)`: IAU 1982 Greenwich mean sidereal time (the SGP4/TEME convention)
//!   on the two parts, SOFA `iauGmst82`;
//! - `cio::gcrs_to_itrs_matrix_jd2(tt: Jd2, ut1: Jd2, xp, yp)`: the CIO GCRS→ITRS matrix with
//!   the Earth rotation angle from the two-part UT1 (`jd2::earth_rotation_angle`);
//! - and, built on them and checked by the internal tests named in the ledger row:
//!   `frames::teme_to_itrf_jd2`, `orbit::Propagator::position_in_frame_jd2`,
//!   `orbit::Propagator::own_jd2_utc`, and `From` conversions between `jd2::Jd2` and
//!   `timescales::TwoPartJd`.
//!
//! INPUTS (`tests/fixtures/jd2_earth_rotation_erfa_oracle/epochs.csv`, from fixed rules by the
//! generator): two-part UT1 dates J2000.0 and 2026-10-13 0h, each at +0, +1, +10 and +50 µs;
//! and 32 dates drawn uniformly over 1980-2050 (`random.Random(20261033)`, fraction to 1e-12
//! day), each with a TT − UT1 offset uniform in [41.184, 70.184] s. TT is formed as
//! (day, frac + (TT − UT1)/86400). Polar motion x_p = 0.1″, y_p = 0.3″.
//!
//! ORACLE: pyerfa 2.0.1.5 (BSD-3-Clause; liberfa 2.0.1): `gmst82(ut1_day, ut1_frac)` and
//! `c2t06a(tt_day, tt_frac, ut1_day, ut1_frac, xp, yp)`; output `erfa.csv`, 17 digits.
//!
//! BARS (fixed now):
//! - **G** `gmst82`: within 1e-12 rad of ERFA at every epoch.
//! - **M** `gcrs_to_itrs_matrix_jd2`: every element within 5e-12 of `c2t06a` (0.2 mm at GEO).
//! - **F** (the floor is gone): for each fixed date, the change of the Earth-rotation angle of
//!   the two-part path over +1 µs, +10 µs and +50 µs (from `gcrs_to_itrs_matrix_jd2`, the
//!   rotation angle between the +0 and +k matrices) agrees with the same change in ERFA within
//!   1e-13 rad. Reported, not scored: the same differences through the single-`f64` path
//!   (`cio::gcrs_to_itrs_matrix` on `day + frac`), expected to be off by up to ~3e-9 rad.
//!
//! VERDICT: not yet run.

use kshana::cio::{gcrs_to_itrs_matrix, gcrs_to_itrs_matrix_jd2};
use kshana::jd2::{gmst82, Jd2};

const DIR: &str = "tests/fixtures/jd2_earth_rotation_erfa_oracle";
const AS2R: f64 = std::f64::consts::PI / 180.0 / 3600.0;
const TOL_G: f64 = 1e-12;
const TOL_M: f64 = 5e-12;
const TOL_F: f64 = 1e-13;

type M3 = [[f64; 3]; 3];

fn rows(file: &str) -> Vec<Vec<f64>> {
    std::fs::read_to_string(format!("{DIR}/{file}"))
        .unwrap_or_else(|e| panic!("{DIR}/{file}: {e} (run the generator)"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| l.split(',').map(|x| x.parse().unwrap()).collect())
        .collect()
}

fn m3(v: &[f64]) -> M3 {
    [[v[0], v[1], v[2]], [v[3], v[4], v[5]], [v[6], v[7], v[8]]]
}

/// Rotation angle of `Aᵀ·B` (rad) from its skew part (accurate for small angles).
fn angle(a: &M3, b: &M3) -> f64 {
    let mut r = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            r[i][j] = (0..3).map(|k| a[k][i] * b[k][j]).sum();
        }
    }
    let s = [r[2][1] - r[1][2], r[0][2] - r[2][0], r[1][0] - r[0][1]];
    0.5 * (s[0] * s[0] + s[1] * s[1] + s[2] * s[2]).sqrt()
}

fn wrap(a: f64) -> f64 {
    let t = std::f64::consts::TAU;
    let x = a.rem_euclid(t);
    if x > t / 2.0 {
        x - t
    } else {
        x
    }
}

#[test]
fn two_part_earth_rotation_agrees_with_erfa() {
    let ep = rows("epochs.csv");
    let or = rows("erfa.csv");
    assert_eq!(ep.len(), 40, "the pre-registered epoch set");
    assert_eq!(ep.len(), or.len(), "one oracle row per epoch");
    let (xp, yp) = (0.1 * AS2R, 0.3 * AS2R);
    let (mut wg, mut wm) = (0.0_f64, 0.0_f64);
    let mut fails = Vec::new();
    let mut mats = Vec::new();
    for (e, o) in ep.iter().zip(&or) {
        let ut1 = Jd2::from_parts(e[0], e[1]);
        let tt = Jd2::from_parts(e[0], e[1] + e[2] / 86_400.0);
        let dg = wrap(gmst82(ut1) - o[0]).abs();
        let mk = gcrs_to_itrs_matrix_jd2(tt, ut1, xp, yp);
        let mo = m3(&o[1..10]);
        let mut dm = 0.0_f64;
        for i in 0..3 {
            for j in 0..3 {
                dm = dm.max((mk[i][j] - mo[i][j]).abs());
            }
        }
        wg = wg.max(dg);
        wm = wm.max(dm);
        if dg > TOL_G || dm > TOL_M {
            fails.push(format!("ut1 {} + {}: G {dg:.2e}, M {dm:.2e}", e[0], e[1]));
        }
        let mf = gcrs_to_itrs_matrix(tt.day + tt.frac, ut1.day + ut1.frac, xp, yp);
        mats.push((mk, mo, mf));
    }
    // F: the first 8 epochs are two dates at +0, +1, +10, +50 µs.
    let mut wf = 0.0_f64;
    for base in [0usize, 4] {
        for k in 1..4 {
            let dk = angle(&mats[base].0, &mats[base + k].0);
            let d_o = angle(&mats[base].1, &mats[base + k].1);
            let df = angle(&mats[base].2, &mats[base + k].2);
            println!(
                "date {} +{} us: ERFA {d_o:.6e} rad, two-part {dk:.6e} (off {:.1e}), single f64 {df:.6e} (off {:.1e})",
                base / 4,
                [0, 1, 10, 50][k],
                (dk - d_o).abs(),
                (df - d_o).abs()
            );
            wf = wf.max((dk - d_o).abs());
            if (dk - d_o).abs() > TOL_F {
                fails.push(format!(
                    "F: date {} +{} us off {:.2e} rad",
                    base / 4,
                    [0, 1, 10, 50][k],
                    (dk - d_o).abs()
                ));
            }
        }
    }
    println!("worst: G {wg:.3e} rad, M {wm:.3e}, F {wf:.3e} rad");
    assert!(
        fails.is_empty(),
        "{} failures:\n{}",
        fails.len(),
        fails.join("\n")
    );
}
