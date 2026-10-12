// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the loosely coupled GNSS/INS filter with GNSS lever-arm compensation:
//! Kshana's closed-loop 15-state error-state EKF
//! (`fusion::closed_loop::ClosedLoopInsGnss` around `fusion::gnss_ins_ekf::GnssInsEkf`,
//! driven by `fusion::kfgins::run`) on the KF-GINS demo dataset, scored against the
//! dataset's published reference trajectory and against the KF-GINS C++ program's own
//! output on the same data.
//!
//! # Pre-registration (fixed 2026-10-12, before the first comparison; also in
//! `xval/kfgins/PREREGISTRATION.md`)
//!
//! * **Oracles.** (a) Data: the reference trajectory `truth.nav` shipped with the
//!   KF-GINS demo dataset (i2Nav group, GNSS Research Center, Wuhan University;
//!   <https://github.com/i2Nav-WHU/KF-GINS>, commit 8291a93e). (b) Library: the KF-GINS
//!   C++ program (GPL-3.0) at the same commit, built with CMake and run as a separate
//!   tool on the same files (`xval/kfgins/run_kfgins.sh`); never linked or copied.
//! * **Data.** `dataset/` of that commit: Leador-A15 navigation-grade IMU increments at
//!   200 Hz, GNSS RTK positions at 1 Hz with per-axis standard deviations, the reference
//!   trajectory, and `kf-gins.yaml`. The data carry no stated licence, so they are not in
//!   this repository: `xval/kfgins/fetch.sh` downloads them and checks their SHA-256,
//!   and this test reads them from `KSHANA_KFGINS_DIR` (it prints a note and passes when
//!   the variable is unset).
//! * **Kshana configuration.** Everything from `kf-gins.yaml`: initial state at the first
//!   IMU epoch at or after `starttime`, per-axis initial sigmas, ARW/VRW and the
//!   Gauss-Markov bias noise `2σ²/τ` (isotropic: the file's values are equal on all
//!   axes), antenna lever arm. The scale-factor parameters are not used (Kshana has no
//!   scale-factor states). Each GNSS fix is fused as an antenna position with the
//!   lever-arm measurement model `H = [I 0 −[(C_b^n l_b)×] 0 0]`.
//! * **Metric.** Each solution linearly interpolated at every whole-second epoch of
//!   `truth.nav` (the file's exact rows; one per second) strictly inside the solution;
//!   north/east/down error with WGS-84 radii at the reference point; horizontal RMS
//!   `sqrt(mean(N² + E²))`, vertical RMS `sqrt(mean(D²))`, maximum horizontal error.
//! * **Bars (all six must hold for VALIDATED).**
//!   (B1) Kshana horizontal RMS <= 0.10 m; (B2) Kshana vertical RMS <= 0.15 m;
//!   (B3) Kshana maximum horizontal error <= 0.50 m;
//!   (B4) Kshana horizontal RMS <= 1.2 x KF-GINS's; (B5) Kshana vertical RMS <= 1.2 x
//!   KF-GINS's (B4, B5 need `KF_GINS_Navresult.nav` in the directory; without it they are
//!   reported as not run and the row cannot be VALIDATED);
//!   (B6) the same run with the lever arm switched off has a horizontal RMS >= 2 x the
//!   compensated run's (the lever arm is doing measurable work on this data).
//!
//! # Results
//!
//! Recorded after the run, in `xval/kfgins/PREREGISTRATION.md` ("Results") and
//! `docs/KF-GINS.md`.
//!
//! The synthetic tests below run always: the KF-GINS text formats are written and read
//! back, and a platform spinning in place with a 0.58 m horizontal / 1.0 m vertical
//! lever arm is navigated with and without lever-arm compensation.

use kshana::frames::Geodetic;
use kshana::fusion::kfgins::{
    dcm_from_euler, parse_gnss, parse_imu, parse_nav, run, score, whole_second_epochs, GnssFix,
    KfGinsConfig, NavRecord, PositionScore, RunOptions,
};
use kshana::inertial::attitude::Quaternion;
use kshana::inertial::mechanization::{normal_gravity, radii_of_curvature, NavState};
use std::path::Path;

const B1_H_RMS_M: f64 = 0.10;
const B2_V_RMS_M: f64 = 0.15;
const B3_H_MAX_M: f64 = 0.50;
const RATIO_TOL: f64 = 1.2;
const B6_ABLATION_FACTOR: f64 = 2.0;

/// SHA-256 of the demo files at KF-GINS commit 8291a93e (also checked by fetch.sh).
const SHA256: &[(&str, &str)] = &[
    (
        "GNSS-RTK.txt",
        "3c1ecf6d03121d695f59ea8383af5ec4233ef9ff1c33939b7c42caa609a94521",
    ),
    (
        "Leador-A15.txt",
        "47d3d5136dc9494a2eb12bbf1c3206ab02b8e19cacad9eabab3eb8b700f93b78",
    ),
    (
        "kf-gins.yaml",
        "47d2b7b888cf01e9f0e04f47901d7851cee1b92abe114b5b61eea8e66a47e1e0",
    ),
    (
        "truth.nav",
        "25582530dbeac47e014e350d53dae984fe53ffc47b2304d893a243c885c96012",
    ),
];

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    hex::encode(Sha256::digest(bytes))
}

fn cross(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}

fn print_score(label: &str, s: &PositionScore) {
    eprintln!(
        "  {label}: n={} N {:.4} E {:.4} D {:.4} | H rms {:.4} m, V rms {:.4} m, H max {:.4} m, V max {:.4} m, yaw rms {:.4} deg",
        s.n,
        s.north_rms,
        s.east_rms,
        s.down_rms,
        s.horizontal_rms,
        s.down_rms,
        s.horizontal_max,
        s.vertical_max,
        s.yaw_rms.to_degrees()
    );
}

// ---------------------------------------------------------------- synthetic tests

const LAT0_DEG: f64 = 30.4447873701;
const LON0_DEG: f64 = 114.4718632047;
const H0: f64 = 20.899;
const T0: f64 = 1000.0;
const DT: f64 = 0.005;
const SPIN: f64 = 0.3; // rad/s about body down
const LEVER: [f64; 3] = [0.5, -0.3, -1.0];

fn synthetic_yaml() -> String {
    format!(
        "imupath: \"imu.txt\"\ngnsspath: \"gnss.txt\"\nimudatarate: 200\nstarttime: {T0}\nendtime: -1\n\
         initpos: [ {LAT0_DEG}, {LON0_DEG}, {H0} ]\ninitvel: [ 0.0, 0.0, 0.0 ]\ninitatt: [ 0.0, 0.0, 10.0 ]\n\
         initposstd: [ 0.005, 0.005, 0.008 ]\ninitvelstd: [ 0.003, 0.003, 0.003 ]\n\
         initattstd: [ 0.003, 0.003, 0.02 ]\n\
         imunoise:\n  arw: [0.003, 0.003, 0.003]\n  vrw: [0.03, 0.03, 0.03]\n  gbstd: [0.027, 0.027, 0.027]\n\
         \x20 abstd: [15.0, 15.0, 15.0]\n  gsstd: [300.0, 300.0, 300.0]\n  asstd: [300.0, 300.0, 300.0]\n\
         \x20 corrtime: 4.0\nantlever: [ {}, {}, {} ]\n",
        LEVER[0], LEVER[1], LEVER[2]
    )
}

/// The increments a level platform at rest spinning about its down axis at `SPIN`
/// measures over one interval, from the current truth attitude.
fn spin_increments(truth: &NavState) -> ([f64; 3], [f64; 3]) {
    let ie = truth.omega_ie_n();
    let ie_b = truth.q.conjugate().rotate(ie);
    let g = normal_gravity(truth.p_llh.lat_rad, truth.p_llh.alt_m);
    let f_b = truth.q.conjugate().rotate([0.0, 0.0, -g]);
    (
        [ie_b[0] * DT, ie_b[1] * DT, (ie_b[2] + SPIN) * DT],
        [f_b[0] * DT, f_b[1] * DT, f_b[2] * DT],
    )
}

/// The step the runner applies: raw increments plus the two-sample terms.
fn corrected(prev: ([f64; 3], [f64; 3]), th: [f64; 3], dv: [f64; 3]) -> ([f64; 3], [f64; 3]) {
    let c = cross(prev.0, th);
    let s1 = cross(prev.0, dv);
    let s2 = cross(prev.1, th);
    (
        [
            th[0] + c[0] / 12.0,
            th[1] + c[1] / 12.0,
            th[2] + c[2] / 12.0,
        ],
        [
            dv[0] + (s1[0] + s2[0]) / 12.0,
            dv[1] + (s1[1] + s2[1]) / 12.0,
            dv[2] + (s1[2] + s2[2]) / 12.0,
        ],
    )
}

fn antenna(nav: &NavState, lever_b: [f64; 3]) -> Geodetic {
    let l_n = nav.q.rotate(lever_b);
    let (rn, re) = radii_of_curvature(nav.p_llh.lat_rad);
    let h = nav.p_llh.alt_m;
    Geodetic {
        lat_rad: nav.p_llh.lat_rad + l_n[0] / (rn + h),
        lon_rad: nav.p_llh.lon_rad + l_n[1] / ((re + h) * nav.p_llh.lat_rad.cos()),
        alt_m: h - l_n[2],
    }
}

/// Write a spinning-platform dataset in the KF-GINS text formats: IMU increments,
/// antenna fixes at `T0 + n + 0.5025` (inside an IMU interval, so the runner's split
/// path is exercised), and the truth at every IMU epoch.
fn synthetic_dataset(seconds: usize) -> (String, String, String) {
    let q0 = Quaternion::from_dcm(dcm_from_euler([0.0, 0.0, 10f64.to_radians()]));
    let p0 = Geodetic {
        lat_rad: LAT0_DEG.to_radians(),
        lon_rad: LON0_DEG.to_radians(),
        alt_m: H0,
    };
    let mut truth = NavState::new(q0, [0.0; 3], p0);
    let mut imu = String::new();
    let mut gnss = String::new();
    let mut nav = String::new();
    let line = |t: f64, s: &NavState| {
        let c = s.q.to_dcm();
        let rpy = kshana::fusion::kfgins::euler_from_dcm(c);
        format!(
            "0 {t:.9} {:.12} {:.12} {:.6} {:.6} {:.6} {:.6} {:.9} {:.9} {:.9}\n",
            s.p_llh.lat_rad.to_degrees(),
            s.p_llh.lon_rad.to_degrees(),
            s.p_llh.alt_m,
            s.v_ned[0],
            s.v_ned[1],
            s.v_ned[2],
            rpy[0].to_degrees(),
            rpy[1].to_degrees(),
            rpy[2].to_degrees()
        )
    };
    imu.push_str(&format!("{T0:.9} 0 0 0 0 0 0\n"));
    nav.push_str(&line(T0, &truth));
    let mut prev = ([0.0; 3], [0.0; 3]);
    let n = seconds * 200;
    for k in 1..=n {
        let t = T0 + k as f64 * DT;
        let (th, dv) = spin_increments(&truth);
        // A fix inside this interval (at 0.5 of it)?
        let tg = t - 0.5 * DT;
        let frac = tg - tg.floor();
        if (frac - 0.5025).abs() < 1e-6 {
            let half = (
                [th[0] * 0.5, th[1] * 0.5, th[2] * 0.5],
                [dv[0] * 0.5, dv[1] * 0.5, dv[2] * 0.5],
            );
            let mut mid = truth;
            let (a, b) = corrected(prev, half.0, half.1);
            mid.step_increments(a, b, 0.5 * DT);
            let p = antenna(&mid, LEVER);
            gnss.push_str(&format!(
                "{tg:.9} {:.12} {:.12} {:.6} 0.010 0.010 0.015\n",
                p.lat_rad.to_degrees(),
                p.lon_rad.to_degrees(),
                p.alt_m
            ));
        }
        let (a, b) = corrected(prev, th, dv);
        truth.step_increments(a, b, DT);
        prev = (th, dv);
        imu.push_str(&format!(
            "{t:.9} {:.15e} {:.15e} {:.15e} {:.15e} {:.15e} {:.15e}\n",
            th[0], th[1], th[2], dv[0], dv[1], dv[2]
        ));
        nav.push_str(&line(t, &truth));
    }
    (imu, gnss, nav)
}

#[test]
fn synthetic_text_round_trips_through_the_loaders() {
    let (imu, gnss, nav) = synthetic_dataset(3);
    let i = parse_imu(&imu).unwrap();
    let g = parse_gnss(&gnss).unwrap();
    let n = parse_nav(&nav).unwrap();
    assert_eq!(i.len(), 601);
    assert_eq!(n.len(), 601);
    assert_eq!(g.len(), 3);
    assert!((g[0].t - 1000.5025).abs() < 1e-9);
    assert!((i[1].dtheta[2] - (SPIN * DT)).abs() < 1e-6);
    let cfg = KfGinsConfig::from_yaml(&synthetic_yaml()).unwrap();
    assert_eq!(cfg.antlever, LEVER);
    assert_eq!(cfg.starttime, T0);
}

/// A platform at rest spinning about its down axis at 0.3 rad/s, with the antenna
/// 0.58 m off the spin axis and 1.0 m above the IMU. With lever-arm compensation the
/// solution stays on the IMU centre to well under a millimetre; without it the filter
/// is pulled toward the antenna and shows a lever-arm-sized error.
#[test]
fn lever_arm_compensation_on_a_spinning_platform() {
    let (imu, gnss, nav) = synthetic_dataset(60);
    let cfg = KfGinsConfig::from_yaml(&synthetic_yaml()).unwrap();
    let imu = parse_imu(&imu).unwrap();
    let gnss: Vec<GnssFix> = parse_gnss(&gnss).unwrap();
    let truth: Vec<NavRecord> = parse_nav(&nav).unwrap();

    let with = run(&cfg, &imu, &gnss, RunOptions { lever_arm: true }).unwrap();
    let without = run(&cfg, &imu, &gnss, RunOptions { lever_arm: false }).unwrap();
    assert_eq!(with.n_updates, 60);
    assert_eq!(without.n_updates, 60);
    assert_eq!(with.solution.len(), imu.len());

    // Score after the first 10 s (the uncompensated filter needs a few fixes to be
    // pulled onto the antenna).
    let keep = |r: &NavRecord| r.t > T0 + 10.0;
    let s_with = score(&with.solution, &truth, keep).unwrap();
    let s_without = score(&without.solution, &truth, keep).unwrap();
    eprintln!("spinning platform, lever arm [0.5, -0.3, -1.0] m:");
    print_score("with compensation   ", &s_with);
    print_score("without compensation", &s_without);
    assert!(s_with.horizontal_max < 1e-3, "{s_with:?}");
    assert!(s_with.vertical_max < 1e-3, "{s_with:?}");
    let l_h = (LEVER[0] * LEVER[0] + LEVER[1] * LEVER[1]).sqrt();
    assert!(
        s_without.horizontal_rms > 0.3 * l_h,
        "uncompensated horizontal RMS {} vs lever {l_h}",
        s_without.horizontal_rms
    );
    assert!(
        s_without.down_rms > 0.5 * LEVER[2].abs(),
        "uncompensated vertical RMS {}",
        s_without.down_rms
    );
}

// ---------------------------------------------------------------- the dataset oracle

#[test]
fn kfgins_demo_dataset_against_truth_and_kfgins() {
    let Ok(dir) = std::env::var("KSHANA_KFGINS_DIR") else {
        eprintln!(
            "KSHANA_KFGINS_DIR is not set: KF-GINS dataset oracle not run \
             (fetch with xval/kfgins/fetch.sh)"
        );
        return;
    };
    let dir = Path::new(&dir);
    let read = |name: &str| -> Vec<u8> {
        std::fs::read(dir.join(name))
            .unwrap_or_else(|e| panic!("{}: {e}", dir.join(name).display()))
    };
    let mut files = std::collections::BTreeMap::new();
    for (name, want) in SHA256 {
        let bytes = read(name);
        let got = sha256_hex(&bytes);
        eprintln!("  {name}: sha256 {got}");
        assert_eq!(&got, want, "{name} is not the pinned KF-GINS demo file");
        files.insert(*name, String::from_utf8(bytes).expect("utf-8 text"));
    }
    let cfg = KfGinsConfig::from_yaml(&files["kf-gins.yaml"]).expect("kf-gins.yaml");
    let imu = parse_imu(&files["Leador-A15.txt"]).expect("IMU file");
    let gnss = parse_gnss(&files["GNSS-RTK.txt"]).expect("GNSS file");
    let truth = parse_nav(&files["truth.nav"]).expect("truth file");
    let truth_1hz = whole_second_epochs(&truth);
    let keep = |_: &NavRecord| true;

    let ks = run(&cfg, &imu, &gnss, RunOptions { lever_arm: true }).expect("run");
    let ab = run(&cfg, &imu, &gnss, RunOptions { lever_arm: false }).expect("ablation run");
    let s_ks = score(&ks.solution, &truth_1hz, keep).expect("scored epochs");
    let s_ab = score(&ab.solution, &truth_1hz, keep).expect("scored epochs");

    eprintln!(
        "KF-GINS demo dataset: {} IMU epochs, {} GNSS fixes fused ({} skipped), {} whole-second truth epochs",
        ks.solution.len(),
        ks.n_updates,
        ks.n_skipped,
        s_ks.n
    );
    print_score("Kshana, lever arm      ", &s_ks);
    print_score("Kshana, no lever arm   ", &s_ab);

    let kf_path = dir.join("KF_GINS_Navresult.nav");
    let s_kf = if kf_path.exists() {
        let text = std::fs::read_to_string(&kf_path).expect("KF-GINS result");
        eprintln!(
            "  KF_GINS_Navresult.nav: sha256 {}",
            sha256_hex(text.as_bytes())
        );
        let kf = parse_nav(&text).expect("KF-GINS result rows");
        let s = score(&kf, &truth_1hz, keep).expect("scored epochs");
        print_score("KF-GINS C++            ", &s);
        Some(s)
    } else {
        eprintln!("  KF_GINS_Navresult.nav absent: B4/B5 not run (xval/kfgins/run_kfgins.sh)");
        None
    };

    let mut misses = Vec::new();
    let mut check = |name: &str, value: f64, bar: f64| {
        let ok = value <= bar;
        eprintln!(
            "  {name}: {value:.4} (bar <= {bar:.4}) {}",
            if ok { "pass" } else { "MISS" }
        );
        if !ok {
            misses.push(format!("{name} {value:.4} > {bar:.4}"));
        }
    };
    check("B1 horizontal RMS (m)", s_ks.horizontal_rms, B1_H_RMS_M);
    check("B2 vertical RMS (m)", s_ks.down_rms, B2_V_RMS_M);
    check("B3 max horizontal (m)", s_ks.horizontal_max, B3_H_MAX_M);
    if let Some(kf) = &s_kf {
        check(
            "B4 horizontal RMS ratio Kshana/KF-GINS",
            s_ks.horizontal_rms / kf.horizontal_rms,
            RATIO_TOL,
        );
        check(
            "B5 vertical RMS ratio Kshana/KF-GINS",
            s_ks.down_rms / kf.down_rms,
            RATIO_TOL,
        );
    }
    check(
        "B6 compensated / uncompensated horizontal RMS (x2 bar as 1/2)",
        s_ks.horizontal_rms / s_ab.horizontal_rms,
        1.0 / B6_ABLATION_FACTOR,
    );
    assert!(misses.is_empty(), "pre-registered bars missed: {misses:?}");
}
