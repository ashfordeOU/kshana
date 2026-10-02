// SPDX-License-Identifier: AGPL-3.0-only
//! M120 round 2: the parts of the LEO broadcast-ephemeris fitter row that round 1 left outside
//! its narrowed claim (the along/cross/radial correction polynomials of `kepler-rac`, the clock
//! fit net of the user's relativistic term, the update-period trade, and Kshana's integrated
//! truth orbit), each against an independent oracle on real data or an independent library.
//!
//! Pre-registration (written 2026-10-02, committed before the GRACE-FO clock data was fetched,
//! before the Orekit driver was written and before any comparison was run). The round-1 part
//! (the 16-parameter fit against Liu et al. 2025 on four real orbits) is unchanged and stays in
//! `tests/leo_navmsg_fit_real_orbit_oracle.rs`.
//!
//! ## Part A: correction polynomials, clock fit and update-period trade on a real satellite
//!
//! Real truth: GRACE-FO 1 (GRACE-C) on 2024-01-01, its TU Graz ITSG reduced-dynamic orbit (the
//! round-1 fixture `leo_navmsg_fit_real_orbit_oracle/grace_c_2024-01-01.csv`) and its measured
//! onboard clock from the GRACE-FO Level-1B product CLK1B (JPL release 04, file
//! `gracefo_1B_2024-01-01_RL04.ascii.noLRI.tgz` from the GFZ Information System and Data Center,
//! https://isdc-data.gfz.de/grace-fo/Level-1B/JPL/INSTRUMENT/RL04/2024/), satellite C, the
//! ultra-stable oscillator's offset `eps_time`. The apparent clock offset a navigation message
//! would carry is taken as receiver time minus GPS time; the generator puts it on the orbit's
//! 10 s grid by linear interpolation (numpy) if CLK1B is not already on it, and the same grid
//! values feed both Kshana (through a measured-clock variant of `leo_navmsg::truth::TruthClock`
//! that interpolates the samples linearly and adds nothing) and the oracle. If CLK1B for that
//! day cannot be obtained without an account, Part A runs without the clock and the clock part is
//! reported BLOCKED.
//!
//! Kshana: `leo_navmsg::sequence_stats` with models `kepler16` and `kepler-rac` with degrees
//! [7, 5, 6] (the degrees the module documents as the ones that remove the residual), with the
//! measured clock, for (fit interval, update period) = (1200, 600), (1200, 1200), (1800, 900)
//! and (1800, 1800) s, usage periods from 00:15 GPS time over 84 600 s, 10 s fit samples and
//! 10 s evaluation step, SISRE weights `sisre_weights(mean radius, 0)`.
//!
//! Oracle: an independent Python implementation (numpy, BSD-3-Clause) written from the
//! Galileo OS SIS ICD user algorithm and the module's documented model, reading only the
//! message parameters Kshana produced (exported to the fixture) and the truth files:
//! (1) the Keplerian position, the along/cross/radial frame and the relativistic term
//! `F e sqrt(A) sin E`; (2) the correction polynomials refitted by `numpy.linalg.lstsq` to the
//! truth minus the Keplerian position at the fit samples, in `tau = tk / tau_s`; (3) the clock
//! polynomial refitted by `numpy.linalg.lstsq` to the apparent clock minus the relativistic term
//! at the fit samples, in `t - toc`; (4) the error statistics over every usage period (RMS
//! along, cross, radial, clock times c, orbit-only SISRE and SISRE with clock).
//!
//! Tolerances (fixed now): (2) every refitted correction value at every fit sample within
//! 1e-4 m of Kshana's; (3) every refitted clock value at every fit sample within 1e-12 s of
//! Kshana's; (4) every statistic of every (model, interval, period) within 1e-4 m (clock RMS and
//! SISRE with clock included). Kshana's messages must reproduce the exported ones bit for bit.
//!
//! ## Part B: the integrated truth orbit against Orekit
//!
//! Oracle: Orekit 12.2 (CS GROUP, Apache-2.0) `NumericalPropagator` with a DormandPrince853
//! integrator (absolute position tolerance 1e-6 m), from Kshana's own node-0 state, in a frame
//! that is Kshana's pseudo-inertial frame, with a body frame turned about z by
//! `theta0 + OMEGA_E t`: two-body (`MU` 3.986004418e14); zonal J2 to J6 as Kshana's constants
//! through `HolmesFeatherstoneAttractionModel`; EGM2008 read by Orekit's own ICGEM reader from
//! `tools/egm2008_to70.gfc` truncated at the case's degree and order, with Orekit's
//! `NewtonianAttraction` at the file's GM; drag through `DragForce` and `IsotropicDrag`
//! (area = `cd_area_over_mass`, drag coefficient 1, mass 1 kg) in an atmosphere co-rotating with
//! the body frame whose density is Kshana's 28-band piecewise-exponential table at spherical
//! altitude `|r| - 6378137 m` (the same density input; the oracle checks the dynamics and the
//! integration, not the density model).
//! Cases: altitude 550 km, inclination 53 deg, eccentricity 0.001, node 30 deg, perigee 40 deg,
//! mean anomaly 50 deg, theta0 1.0 rad, step 5 s, 6 h, with gravity degree 0, 6, 20 and 70; and
//! altitude 400 km, degree 20 with drag (`cd_area_over_mass` 0.01 m^2/kg).
//! Quantity: Earth-fixed position (`TruthOrbit::state_ecef` at the nodes) every 60 s.
//! Tolerance (fixed now): the largest three-dimensional difference over the 6 h of each case is
//! at most 0.02 m (the truth must reproduce its dynamics well below the centimetre-to-decimetre
//! fit residuals it is used to measure: Liu et al. 2025's 16-parameter RMS components run from
//! 0.89 to 97 cm).
//!
//! PROMOTE the full row only if Parts A and B both agree; otherwise each part's outcome is
//! reported and the strict test of a disagreeing part stays ignored with the measured gap.
//!
//! ## Amendment after the run (2026-10-02, review): Part A is an internal cross-check
//!
//! Written after both parts had been run and seen (results below each test). Part A's script
//! (`oracle_part_a.py`) was written and run by this project and re-evaluates the same closed
//! forms Kshana uses (the Keplerian user algorithm, the along/cross/radial frame, polynomial
//! evaluation, the relativistic term and the statistics) on Kshana's own exported messages.
//! `docs/VALIDATION.md` excludes such a script as an oracle ("our own second implementation"),
//! and the measured clock enters only as an input, so Part A does not validate the correction
//! polynomials, the clock fit (the row's seeded free or steered clock is not exercised; only the
//! measured-clock variant is) or the update-period trade. Part A is kept, at its unchanged
//! tolerances, as an internal consistency check of the exported messages and the closed forms;
//! it is not cited as an oracle. Part B (Orekit 12.2, Apache-2.0) is an independent library and
//! is the only part of this file that validates. The full row is therefore NOT promoted: the
//! validated part grows by the integrated truth orbit, and the correction polynomials, the clock
//! fit and the update-period trade stay modelled until an oracle not written by this project
//! (published statistics on the same real orbits, or a third-party fitting tool) is
//! pre-registered. No tolerance was changed.

use std::path::{Path, PathBuf};

use kshana::leo_navmsg::elements::{EphemerisModel, LeoNavMessage, SysTime};
use kshana::leo_navmsg::fit::{sample_times, ModelKind};
use kshana::leo_navmsg::sisre::sisre_weights;
use kshana::leo_navmsg::truth::{OrbitConfig, TruthClock, TruthOrbit};
use kshana::leo_navmsg::{sequence_stats, LeoNavmsgScenario};

fn fixture(dir: &str, name: &str) -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures")
        .join(dir)
        .join(name)
}

const DIR: &str = "leo_navmsg_full_claim_oracle";
const START_S: f64 = 900.0;
const SPAN_S: f64 = 84_600.0;
const CONFIGS: [(f64, f64); 4] = [
    (1200.0, 600.0),
    (1200.0, 1200.0),
    (1800.0, 900.0),
    (1800.0, 1800.0),
];

fn kinds() -> [(ModelKind, &'static str); 2] {
    [
        (ModelKind::Kepler16, "kepler16"),
        (ModelKind::KeplerRac { degrees: [7, 5, 6] }, "kepler-rac"),
    ]
}

/// The GRACE-C 2024-01-01 ITSG orbit (round-1 fixture) and the CLK1B clock on its grid.
fn grace_c() -> (TruthOrbit, TruthClock) {
    let text = std::fs::read_to_string(fixture(
        "leo_navmsg_fit_real_orbit_oracle",
        "grace_c_2024-01-01.csv",
    ))
    .unwrap();
    let (mut week, mut tow0) = (0u32, 0.0);
    let mut states = Vec::new();
    for line in text.lines() {
        if let Some(rest) = line.strip_prefix("# gps_week ") {
            let f: Vec<&str> = rest.split_whitespace().collect();
            week = f[0].parse().unwrap();
            tow0 = f[2].parse().unwrap();
            continue;
        }
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let v: Vec<f64> = line.split(',').map(|s| s.parse().unwrap()).collect();
        states.push(([v[1], v[2], v[3]], [v[4], v[5], v[6]]));
    }
    let orbit = TruthOrbit::from_ecef_states(SysTime::new(week, tow0), 10.0, 0.0, &states).unwrap();
    let ctext = std::fs::read_to_string(fixture(DIR, "grace_c_clock_2024-01-01.csv")).unwrap();
    let xs: Vec<f64> = ctext
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').nth(1).unwrap().parse().unwrap())
        .collect();
    assert_eq!(xs.len(), states.len());
    (orbit, TruthClock::from_samples(10.0, &xs).unwrap())
}

/// Kshana's sequences: per (model, interval, period), the statistics and the messages.
fn kshana_runs() -> Vec<(
    String,
    kshana::leo_navmsg::sisre::ErrorStats,
    Vec<LeoNavMessage>,
)> {
    let (orbit, clock) = grace_c();
    let template = LeoNavmsgScenario::default().resolve().unwrap().template;
    let mut rsum = 0.0;
    for k in 0..=8640 {
        let p = orbit.state_ecef(10.0 * k as f64).0;
        rsum += (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
    }
    let w = sisre_weights(rsum / 8641.0, 0.0);
    let start = orbit.epoch.plus(START_S);
    let mut out = Vec::new();
    for (kind, name) in kinds() {
        for (interval, period) in CONFIGS {
            let (st, msgs) = sequence_stats(
                &orbit,
                Some(&clock),
                kind,
                false,
                &template,
                &w,
                &start,
                SPAN_S,
                interval,
                period,
                10.0,
                10.0,
            )
            .unwrap();
            out.push((format!("{name} {interval} {period}"), st, msgs));
        }
    }
    out
}

/// Regenerates `kshana_messages.json` (the oracle's input). Run by hand only:
/// `cargo test --release --test leo_navmsg_full_claim_oracle export -- --ignored`.
#[test]
#[ignore = "fixture generator"]
fn export_kshana_messages_for_the_oracle() {
    let (orbit, _) = grace_c();
    let mut rsum = 0.0;
    for k in 0..=8640 {
        let p = orbit.state_ecef(10.0 * k as f64).0;
        rsum += (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
    }
    let w = sisre_weights(rsum / 8641.0, 0.0);
    let runs: Vec<serde_json::Value> = kshana_runs()
        .into_iter()
        .map(|(label, _, msgs)| serde_json::json!({ "label": label, "messages": msgs }))
        .collect();
    let doc = serde_json::json!({
        "start_s": START_S, "span_s": SPAN_S, "sample_s": 10.0, "eval_step_s": 10.0,
        "w_r": w.w_r, "w_ac2": w.w_ac2, "runs": runs,
    });
    std::fs::write(
        fixture(DIR, "kshana_messages.json"),
        serde_json::to_string(&doc).unwrap(),
    )
    .unwrap();
}

fn polyval(c: &[f64], x: f64) -> f64 {
    c.iter().rev().fold(0.0, |acc, &v| acc * x + v)
}

/// Worst differences: (correction m, clock s, statistic m), and the count of messages checked.
fn part_a() -> (f64, f64, f64, usize) {
    let exported: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(fixture(DIR, "kshana_messages.json")).unwrap(),
    )
    .unwrap();
    let oracle: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(fixture(DIR, "oracle_part_a.json")).unwrap())
            .unwrap();
    let (mut wc, mut wk, mut ws, mut n) = (0.0_f64, 0.0_f64, 0.0_f64, 0usize);
    for (ri, (label, st, msgs)) in kshana_runs().into_iter().enumerate() {
        let er = &exported["runs"][ri];
        assert_eq!(er["label"].as_str().unwrap(), label);
        assert_eq!(
            serde_json::to_value(&msgs).unwrap(),
            er["messages"],
            "{label}: today's messages differ from the oracle's input"
        );
        let orr = &oracle["runs"][ri];
        assert_eq!(orr["label"].as_str().unwrap(), label);
        let (interval, period) = CONFIGS[ri % 4];
        for (mi, m) in msgs.iter().enumerate() {
            let om = &orr["messages"][mi];
            // Fit samples of message mi, as sequence_stats lays them out.
            let start = SysTime::new(2295, 86_400.0 + START_S);
            let from = start.plus(mi as f64 * period - (interval - period) / 2.0);
            let times = sample_times(&from, interval, 10.0);
            let reft_week = m.week;
            if let EphemerisModel::KeplerRac { kepler, rac } = &m.ephemeris {
                let oa: Vec<f64> = serde_json::from_value(om["along"].clone()).unwrap();
                let oc: Vec<f64> = serde_json::from_value(om["cross"].clone()).unwrap();
                let orad: Vec<f64> = serde_json::from_value(om["radial"].clone()).unwrap();
                for t in &times {
                    let tau = t.minus(&SysTime::new(reft_week, kepler.toe)) / rac.tau_s;
                    wc = wc
                        .max((polyval(&rac.along, tau) - polyval(&oa, tau)).abs())
                        .max((polyval(&rac.cross, tau) - polyval(&oc, tau)).abs())
                        .max((polyval(&rac.radial, tau) - polyval(&orad, tau)).abs());
                }
            }
            let c = m.clock.as_ref().unwrap();
            let of: Vec<f64> = serde_json::from_value(om["clock"].clone()).unwrap();
            for t in &times {
                let dt = t.minus(&SysTime::new(m.week, c.toc));
                let ours = c.af0 + c.af1 * dt + c.af2 * dt * dt;
                let theirs = of[0] + of[1] * dt + of[2] * dt * dt;
                wk = wk.max((ours - theirs).abs());
            }
            n += 1;
        }
        let os = &orr["stats"];
        for (ours, key) in [
            (st.along_rms_m, "along_rms_m"),
            (st.cross_rms_m, "cross_rms_m"),
            (st.radial_rms_m, "radial_rms_m"),
            (st.clock_rms_m, "clock_rms_m"),
            (st.sisre_orb_rms_m, "sisre_orb_rms_m"),
            (st.sisre_rms_m, "sisre_rms_m"),
        ] {
            let theirs = os[key].as_f64().unwrap();
            println!("{label:<22} {key:<16} kshana {ours:.6} oracle {theirs:.6}");
            ws = ws.max((ours - theirs).abs());
        }
    }
    (wc, wk, ws, n)
}

/// Part A, run with the pre-registered tolerances (2026-10-02: agrees; 704 messages, worst
/// correction 4.4e-9 m, clock 6.6e-17 s, statistic 9.5e-11 m). An internal cross-check against a
/// script written in this repository, not an independent oracle (see the amendment above).
#[test]
fn corrections_clock_fit_and_update_period_trade_agree_with_an_internal_cross_check_on_grace_fo() {
    let (wc, wk, ws, n) = part_a();
    println!("messages {n}: worst correction {wc:.3e} m, clock {wk:.3e} s, statistic {ws:.3e} m");
    assert!(n > 0);
    assert!(wc <= 1e-4, "correction {wc}");
    assert!(wk <= 1e-12, "clock {wk}");
    assert!(ws <= 1e-4, "statistic {ws}");
}

/// Part B cases: label, altitude (km), gravity degree, `cd_area_over_mass`.
const CASES: [(&str, f64, usize, f64); 5] = [
    ("twobody", 550.0, 0, 0.0),
    ("zonal6", 550.0, 6, 0.0),
    ("egm20", 550.0, 20, 0.0),
    ("egm70", 550.0, 70, 0.0),
    ("egm20drag", 400.0, 20, 0.01),
];
const B_DURATION_S: f64 = 6.0 * 3600.0;

fn truth_case(alt_km: f64, degree: usize, cd: f64) -> TruthOrbit {
    TruthOrbit::propagate(&OrbitConfig {
        altitude_m: alt_km * 1e3,
        inclination_rad: 53f64.to_radians(),
        eccentricity: 0.001,
        raan_rad: 30f64.to_radians(),
        arg_perigee_rad: 40f64.to_radians(),
        mean_anomaly_rad: 50f64.to_radians(),
        gravity_degree: degree,
        cd_area_over_mass: cd,
        theta0_rad: 1.0,
        epoch: SysTime::new(2400, 0.0),
        duration_s: B_DURATION_S,
        step_s: 5.0,
    })
    .unwrap()
}

/// Writes the Orekit driver's input (`orekit_cases.txt`). Run by hand only.
#[test]
#[ignore = "fixture generator"]
fn export_truth_cases_for_orekit() {
    let mut out = String::new();
    for (label, alt, deg, cd) in CASES {
        let o = truth_case(alt, deg, cd);
        let (r, v) = o.state_inertial(0.0);
        out.push_str(&format!(
            "{label} {deg} {cd:e} 1.0 {B_DURATION_S} 60 {:.17e} {:.17e} {:.17e} {:.17e} {:.17e} {:.17e}\n",
            r[0], r[1], r[2], v[0], v[1], v[2]
        ));
    }
    std::fs::write(fixture(DIR, "orekit_cases.txt"), out).unwrap();
}

/// Largest 3-D difference (m) per case between Kshana's truth and Orekit.
fn part_b() -> Vec<(String, f64)> {
    let text = std::fs::read_to_string(fixture(DIR, "orekit_truth.txt")).unwrap();
    let mut out = Vec::new();
    for (label, alt, deg, cd) in CASES {
        let o = truth_case(alt, deg, cd);
        let mut worst = 0.0_f64;
        let mut n = 0;
        for l in text
            .lines()
            .filter(|l| l.split_whitespace().next() == Some(label))
        {
            let f: Vec<f64> = l
                .split_whitespace()
                .skip(1)
                .map(|x| x.parse().unwrap())
                .collect();
            let p = o.state_ecef(f[0]).0;
            let d = ((p[0] - f[1]).powi(2) + (p[1] - f[2]).powi(2) + (p[2] - f[3]).powi(2)).sqrt();
            worst = worst.max(d);
            n += 1;
        }
        assert_eq!(n, 361, "{label}: Orekit epochs");
        out.push((label.to_string(), worst));
    }
    out
}

/// Part B, run with the pre-registered tolerance (2026-10-02: AGREES; worst 3.9 to 4.5 mm over
/// 6 h in the five cases).
#[test]
fn integrated_truth_orbit_matches_orekit_within_2_cm_over_6_h() {
    let rows = part_b();
    for (label, worst) in &rows {
        println!("{label:<10} worst 3-D difference {worst:.4e} m");
    }
    for (label, worst) in rows {
        assert!(worst <= 0.02, "{label}: {worst} m");
    }
}
