// SPDX-License-Identifier: AGPL-3.0-only
//! The one Earth-orbit path of package D8, legs 1 and 2 of the three-leg oracle: SGP4 element
//! sets propagated to TEME (true equator, mean equinox) against the reference SGP4, and the
//! TEME -> ITRS (International Terrestrial Reference System) and GCRS -> ITRS rotations of the
//! IAU (International Astronomical Union) 2006/2000A chain, with Earth orientation parameters,
//! against SOFA (Standards of Fundamental Astronomy) run as ERFA. New row, package D8.
//!
//! Why three legs: the round-1 full-claim comparisons (`leo_polar_coverage_full_claim_orekit_oracle.rs`,
//! `pass_predictor_apparent_orekit_oracle.rs`) compared the whole chain end to end against
//! Orekit and failed on two oracle-side causes, Orekit's SDP4 at e = 0 and Orekit's TEME
//! convention. This re-design, made after those results and disclosed as such, checks each leg
//! against the tool that defines its quantity; the geometry leg is
//! `leo_polar_coverage_on_path_orekit_oracle.rs` and `pass_predictor_on_path_orekit_oracle.rs`.
//! No bar below is derived from the measured 72 milliarcseconds.
//!
//! LEG 1, QUANTITY: the TEME position (m) of `sgp4::SgpOrbit::teme_state` for every committed
//! element set at every committed instant.
//! LEG 1, ORACLE (Reference): python-sgp4 2.24 (MIT licence; D. Vallado's reference C++ SGP4,
//! the code that produced the AIAA 2006-6753 verification vectors), `Satrec.sgp4init` with
//! WGS-72 and the improved mode 'i', `Satrec.sgp4` at the same instants.
//! LEG 1, TOLERANCE: 1 cm per position. Source: the engine reproduces the 666 AIAA vectors,
//! which python-sgp4 generates, to 4.12 mm worst; two implementations each within that floor of
//! the vectors differ by at most about 1 cm.
//!
//! LEG 2, QUANTITY: the rotation matrices `sgp4::teme_to_itrs_matrix_eop(utc, eop)` and
//! `sgp4::gcrs_to_itrs_matrix_eop(utc, eop)` (with `teme_to_itrs_matrix` and
//! `gcrs_to_itrs_matrix` the zero-parameter case), compared as the rotation angle of
//! `R_kshana * R_oracle^T` (arcseconds).
//! LEG 2, ORACLE (Reference): pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause; the SOFA routines as
//! released by the ERFA project). GCRS -> ITRS is `erfa.c2t06a(tt1, tt2, ut11, ut12, xp, yp)`
//! with TT from `erfa.utctai`/`erfa.taitt` and UT1 from `erfa.utcut1`. TEME -> ITRS composes
//! the SOFA quantities with the definition the engine states for TEME (the true equator of
//! date with the mean equinox, Vallado et al. 2006): `c2t06a · pnm06a^T · rz(-ee06a)`, where
//! `rz` is `erfa.rz`; every matrix and angle in that product is computed by ERFA.
//! LEG 2, TOLERANCE: GCRS -> ITRS within 0.1 milliarcsecond (the engine implements the same
//! IAU 2006/2000A CIO-based (Celestial Intermediate Origin) algorithms, checked bit-level against
//! SOFA vectors; 0.1 mas covers the TIO locator and series-evaluation order). TEME -> ITRS
//! within 2 milliarcseconds: the engine's TEME -> GCRS uses the IAU 2000B nutation (published
//! to agree with 2000A within 1 mas over 1995 to 2050, McCarthy and Luzum 2003) and two of the
//! complementary terms of the equation of the equinoxes (the rest are below 10 microarcseconds);
//! 2 mas doubles that budget.
//!
//! INPUTS (committed by the fixture writer before the oracle runs): leg 1, the 228 element sets
//! of `tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/elements_{A,B}.csv` at their
//! sweep epochs (13 and 25), and the four element sets of
//! `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.csv` every hour over their 24-hour
//! windows; leg 2, every distinct instant of leg 1 with zero Earth orientation parameters, plus
//! 24 instants from 2016 to 2026 (two per year at 03:17:42.5 on 2 February and 5 August, and
//! 2016-12-31T23:59:59.5) with UT1 - UTC, x_p and y_p from the fixed list
//! (-0.62, 0.35, 0.05) s and (0.21, -0.07, 0.38) and (0.45, 0.29, -0.12) arcsec, cycled.
//!
//! The pre-registration says "24 instants" for the parameter cases; its own rule (two a year
//! from 2016 to 2026 inclusive, plus one) gives 23, and the rule is what is implemented.
//!
//! VERDICT (2026-10-02): AGREES at the pre-registered tolerances, on a SECOND run after a seen
//! failure (disclosed). First run: leg 1 agreed (worst 6.1e-8 m) and leg 2 agreed on 107 of 108
//! instants, failing at 2016-12-31T23:59:59.5 by 1.504e4 mas (one second of rotation) on both
//! rotations: an engine bug, UT1 taken from the UTC quasi Julian date, whose fraction counts
//! 86 401 s on a leap-second day. The engine was corrected (`jd2::utc_to_ut1`, the SOFA
//! `iauUtcut1` route through TAI, used by `sgp4::gcrs_to_itrs_matrix_eop` and the pass
//! predictor); no bar or input changed. Second run: leg 1 worst 6.1e-8 m (bar 1 cm) over 4432
//! cases; leg 2 worst GCRS->ITRS 2.9e-6 mas (bar 0.1 mas) and TEME->ITRS 0.41 mas (bar 2 mas)
//! over 108 instants. Deliberate mutations turn this test red: polar motion dropped (46
//! failures, 497 mas); WGS-84 constants in place of WGS-72 in `SgpOrbit::new` (4432 failures,
//! 64.6 m). Pre-registration commit 72ea9eb0. Fixture: `tests/fixtures/earth_orbit_path_sgp4_erfa_oracle/`.

use kshana::jd2::Jd2;
use kshana::precession::Mat3;
use kshana::sgp4::{
    gcrs_to_itrs_matrix_eop, teme_to_itrs_matrix_eop, Eop, MeanElementSet, SgpOrbit,
};

const DIR: &str = "tests/fixtures/earth_orbit_path_sgp4_erfa_oracle";
const M131: &str = "tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle";
const PASSES: &str = "tests/fixtures/pass_predictor_apparent_orekit_oracle";

const TEME_M: f64 = 0.01;
const GCRS_ITRS_MAS: f64 = 0.1;
const TEME_ITRS_MAS: f64 = 2.0;

fn csv(path: &str) -> Vec<Vec<f64>> {
    std::fs::read_to_string(path)
        .unwrap_or_else(|e| panic!("{path}: {e}"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
        .map(|l| l.split(',').map(|x| x.trim().parse().unwrap()).collect())
        .collect()
}

/// Leg 1 cases: `(element set, instant)`, in a fixed order.
fn teme_cases() -> Vec<(MeanElementSet, Jd2)> {
    let mut out = Vec::new();
    for c in ["A", "B"] {
        let times: Vec<f64> = {
            let v: serde_json::Value = serde_json::from_str(
                &std::fs::read_to_string(format!("{M131}/inputs_{c}.json")).unwrap(),
            )
            .unwrap();
            v["times_s"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect()
        };
        for f in csv(&format!("{M131}/elements_{c}.csv")) {
            let set = MeanElementSet {
                epoch_utc: Jd2::from_parts(f[2], f[3]),
                no_kozai: f[4],
                ecco: f[5],
                inclo: f[6],
                nodeo: f[7],
                argpo: f[8],
                mo: f[9],
                bstar: f[10],
            };
            for &t in &times {
                out.push((set, set.epoch_utc.add_seconds(t)));
            }
        }
    }
    // The four pass element sets: one case row per orbit (cases 0, 15, 30, 45).
    let rows = csv(&format!("{PASSES}/cases.csv"));
    for r in [&rows[0], &rows[15], &rows[30], &rows[45]] {
        let epoch = Jd2::from_utc_calendar(
            r[1] as i32,
            r[2] as u32,
            r[3] as u32,
            r[4] as u32,
            r[5] as u32,
            r[6],
        )
        .unwrap();
        let set = MeanElementSet {
            epoch_utc: epoch,
            no_kozai: r[7],
            ecco: r[8],
            inclo: r[9],
            nodeo: r[10],
            argpo: r[11],
            mo: r[12],
            bstar: r[13],
        };
        for h in 0..=24 {
            out.push((set, epoch.add_seconds(3600.0 * h as f64)));
        }
    }
    out
}

/// Leg 2 cases: every distinct leg-1 instant with zero parameters, then the 23 instants with
/// parameters (two a year 2016 to 2026 and the second before the 2016 leap second).
fn frame_cases() -> Vec<(Jd2, Eop, [f64; 3])> {
    let mut out: Vec<(Jd2, Eop, [f64; 3])> = Vec::new();
    for (_, t) in teme_cases() {
        if !out.iter().any(|(u, _, _)| *u == t) {
            out.push((t, Eop::default(), [0.0; 3]));
        }
    }
    let dut1 = [-0.62, 0.35, 0.05];
    let xp = [0.21, -0.07, 0.38];
    let yp = [0.45, 0.29, -0.12];
    let mut instants = Vec::new();
    for y in 2016..=2026 {
        for (m, d) in [(2, 2), (8, 5)] {
            instants.push(Jd2::from_utc_calendar(y, m, d, 3, 17, 42.5).unwrap());
        }
    }
    instants.push(Jd2::from_utc_calendar(2016, 12, 31, 23, 59, 59.5).unwrap());
    for (k, t) in instants.into_iter().enumerate() {
        let p = [dut1[k % 3], xp[k % 3], yp[k % 3]];
        let eop = Eop {
            ut1_minus_utc_s: p[0],
            xp_rad: kshana::frames::arcsec(p[1]),
            yp_rad: kshana::frames::arcsec(p[2]),
        };
        out.push((t, eop, p));
    }
    out
}

/// Writes the inputs both sides read; run by `generate.sh` before the oracle.
#[test]
#[ignore = "fixture generator: run by tests/fixtures/earth_orbit_path_sgp4_erfa_oracle/generate.sh"]
fn write_the_fixture_inputs() {
    std::fs::create_dir_all(DIR).unwrap();
    let mut a = String::from("# epoch_day,epoch_frac,no_kozai_rad_min,ecco,inclo,nodeo,argpo,mo,bstar,utc_day,utc_frac\n");
    for (s, t) in teme_cases() {
        a += &format!(
            "{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?}\n",
            s.epoch_utc.day,
            s.epoch_utc.frac,
            s.no_kozai,
            s.ecco,
            s.inclo,
            s.nodeo,
            s.argpo,
            s.mo,
            s.bstar,
            t.day,
            t.frac
        );
    }
    std::fs::write(format!("{DIR}/teme_cases.csv"), a).unwrap();
    let mut b = String::from("# utc_day,utc_frac,ut1_minus_utc_s,xp_arcsec,yp_arcsec\n");
    for (t, _, p) in frame_cases() {
        b += &format!(
            "{:?},{:?},{:?},{:?},{:?}\n",
            t.day, t.frac, p[0], p[1], p[2]
        );
    }
    std::fs::write(format!("{DIR}/frame_cases.csv"), b).unwrap();
}

#[test]
fn the_committed_cases_are_the_pre_registered_ones() {
    assert_eq!(
        csv(&format!("{DIR}/teme_cases.csv")).len(),
        teme_cases().len()
    );
    assert_eq!(teme_cases().len(), 114 * 13 + 114 * 25 + 4 * 25);
    for ((s, t), r) in teme_cases()
        .iter()
        .zip(csv(&format!("{DIR}/teme_cases.csv")))
    {
        assert_eq!(
            [s.epoch_utc.day, s.epoch_utc.frac, s.no_kozai, t.day, t.frac],
            [r[0], r[1], r[2], r[9], r[10]]
        );
    }
    let f = csv(&format!("{DIR}/frame_cases.csv"));
    assert_eq!(f.len(), frame_cases().len());
    for ((t, _, p), r) in frame_cases().iter().zip(&f) {
        assert_eq!(
            [t.day, t.frac, p[0], p[1], p[2]],
            [r[0], r[1], r[2], r[3], r[4]]
        );
    }
}

/// Rotation angle (milliarcseconds) of `a · bᵀ`, from its antisymmetric part.
fn angle_mas(a: &Mat3, b: &Mat3) -> f64 {
    let mut d = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            d[i][j] = (0..3).map(|k| a[i][k] * b[j][k]).sum();
        }
    }
    let v = [d[2][1] - d[1][2], d[0][2] - d[2][0], d[1][0] - d[0][1]];
    let s = 0.5 * (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
    s.asin().to_degrees() * 3.6e6
}

fn mat(r: &[f64]) -> Mat3 {
    [[r[0], r[1], r[2]], [r[3], r[4], r[5]], [r[6], r[7], r[8]]]
}

/// Both legs; returns the failures and the worst gaps (m, mas, mas).
fn compare() -> (Vec<String>, [f64; 3]) {
    let mut fails = Vec::new();
    let mut worst = [0.0_f64; 3];
    let reference = csv(&format!("{DIR}/reference_sgp4_teme.csv"));
    let cases = teme_cases();
    assert_eq!(reference.len(), cases.len());
    for (k, ((set, t), q)) in cases.iter().zip(&reference).enumerate() {
        let (r, _) = SgpOrbit::new(*set).teme_state(*t).unwrap();
        let d = ((r[0] - q[0]).powi(2) + (r[1] - q[1]).powi(2) + (r[2] - q[2]).powi(2)).sqrt();
        worst[0] = worst[0].max(d);
        if d > TEME_M {
            fails.push(format!("leg 1 case {k}: TEME position off by {d:.3e} m"));
        }
    }
    let erfa = csv(&format!("{DIR}/erfa_matrices.csv"));
    let frames = frame_cases();
    assert_eq!(erfa.len(), frames.len());
    for (k, ((t, eop, _), e)) in frames.iter().zip(&erfa).enumerate() {
        let g = angle_mas(&gcrs_to_itrs_matrix_eop(*t, eop), &mat(&e[0..9]));
        let m = angle_mas(&teme_to_itrs_matrix_eop(*t, eop), &mat(&e[9..18]));
        worst[1] = worst[1].max(g);
        worst[2] = worst[2].max(m);
        if g > GCRS_ITRS_MAS {
            fails.push(format!("leg 2 case {k}: GCRS->ITRS off by {g:.3e} mas"));
        }
        if m > TEME_ITRS_MAS {
            fails.push(format!("leg 2 case {k}: TEME->ITRS off by {m:.3e} mas"));
        }
    }
    (fails, worst)
}

#[test]
fn the_earth_orbit_path_agrees_with_the_reference_sgp4_and_sofa() {
    let (fails, w) = compare();
    println!(
        "worst: TEME position {:.3e} m; GCRS->ITRS {:.3e} mas; TEME->ITRS {:.3e} mas",
        w[0], w[1], w[2]
    );
    assert!(
        fails.is_empty(),
        "{} failures:\n{}",
        fails.len(),
        fails
            .iter()
            .take(30)
            .cloned()
            .collect::<Vec<_>>()
            .join("\n")
    );
}
