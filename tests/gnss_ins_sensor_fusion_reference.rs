// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the kshana GNSS/INS sensor-fusion stack against an
//! **independent third-party authority**: filterpy 1.4.5 (R. Labbe, MIT),
//! driven by numpy/scipy. filterpy's `UnscentedKalmanFilter` +
//! `MerweScaledSigmaPoints` and `KalmanFilter` are a separate codebase with
//! their own sigma-point construction and Kalman update; fed byte-identical
//! inputs they are a genuine external oracle for the posterior state mean `x`
//! and covariance `P` of each estimator in `src/fusion/`. This is the same
//! library-vs-library validation the Lambert solver gets against lamberthub and
//! DOP gets against gnss_lib_py.
//!
//! Four filters are checked on a fixed input grid (the committed reference and
//! its generator live in `tests/fixtures/gnss_ins_sensor_fusion/`):
//!
//!  * **UKF / tightly-coupled** ([`fusion::tightly_coupled::TightlyCoupled`] on
//!    [`fusion::ukf::Ukf`]) — the nonlinear pseudorange/Doppler measurement
//!    model `rho = |p - s_i| + b`, `rhodot = LOS.vrel/|.| + d` over a 20-epoch
//!    5-satellite run and a 20-epoch 3-satellite run, propagate(dt=1)+update each
//!    epoch, vs filterpy's UKF with `alpha=1, beta=2, kappa=0` (the spread
//!    `TightlyCoupled::new` uses). Posterior `x` (8) and full `P` (8x8) compared.
//!
//!  * **EKF loosely-coupled** ([`fusion::gnss_ins_ekf::GnssInsEkf::update_loosely_coupled`])
//!    — 15-state error-state position+velocity update vs filterpy `KalmanFilter`.
//!    Posterior error-state `dx` (15) and covariance diagonal (15) compared.
//!
//!  * **EKF tightly-coupled** ([`fusion::gnss_ins_ekf::GnssInsEkf::update_tightly_coupled`])
//!    — 15-state range-domain pseudorange update vs filterpy `KalmanFilter`.
//!    Posterior `dx` (15) and covariance diagonal (15) compared.
//!
//!  * **Coupled PNT** ([`fusion::coupled::CoupledPntFilter`]) — 4-state
//!    `[pos, vel, phase, freq]` predict+pseudorange-update sequence vs filterpy
//!    `KalmanFilter`. Final `pos`, `phase` and full `P` (4x4) compared.
//!
//! Tolerances and the honest scope:
//!
//!  * The EKF (loosely + tightly) and the coupled PNT filter are **linear**
//!    Kalman updates: filterpy's standard `P = (I-KH)P` and kshana's Joseph
//!    `P = (I-KH)P(I-KH)^T + KRK^T` reach the identical posterior in exact
//!    arithmetic, so these are pinned at `rel 1e-9` (machine-precision agreement;
//!    the measured residual is ~1e-12).
//!
//!  * The UKF cases run with **Q = 0**. filterpy *reuses* the propagated process
//!    sigma points for the update while kshana *re-draws* sigma points from the
//!    predicted covariance (van der Merwe's additive-noise UKF: both "reuse" and
//!    "regenerate" variants are published and valid). They coincide only when the
//!    predict folds no process noise into the spread, hence Q=0. The residual is
//!    then the cross-codebase floating-point arithmetic plus the re-Cholesky
//!    basis rotation acting through the nonlinear `h`, bounded at ~1e-7 in `x`
//!    and ~1e-5 in `P` over 20 epochs; the UKF is pinned at `rel 1e-6` with a
//!    small absolute floor. The general Q>0 covariance-inflation behaviour is
//!    exercised by kshana's own unit tests and the outage-survival acceptance
//!    tests in `tightly_coupled.rs`; it is NOT what this fixture pins, because the
//!    two libraries implement different (both correct) additive-noise variants
//!    there.
//!
//! This validates the *estimator mathematics* of each filter against an
//! independent library, not the navigation-scenario realism (constellation
//! visibility, broadcast corrections, IMU error growth), which the agency
//! real-data and in-module acceptance tests cover.

use kshana::fusion::coupled::CoupledPntFilter;
use kshana::fusion::gnss_ins_ekf::{EkfNoise, GnssInsEkf, GnssMeasurement};
use kshana::fusion::tightly_coupled::{pseudorange, range_rate, Sat, TightlyCoupled};

const REF: &str = include_str!("fixtures/gnss_ins_sensor_fusion/gnss_ins_sensor_fusion_reference.txt");

// --- Tolerances ---------------------------------------------------------------
/// Linear-KF cases (EKF loose/tight, coupled PNT): exact in theory.
const LIN_REL: f64 = 1e-9;
const LIN_ABS: f64 = 1e-6;
/// UKF cases (regenerate-vs-reuse variant + cross-codebase float, Q=0).
const UKF_REL: f64 = 1e-6;
/// Absolute floor for the UKF posterior covariance comparison: P entries here run
/// up to ~1e4, so this floor only relaxes the near-zero entries. The measured
/// worst |ΔP| is ~1e-5, so on the large entries the `rel·|want|` term (≥1e-2 on
/// the ~1e4 entries) is what binds — this floor is not load-bearing.
const UKF_ABS_P: f64 = 1e-4;
/// Absolute floor for the UKF posterior mean: state components run up to ~1e7 and
/// down to ~1e-3, so this floor governs only the genuinely near-zero components
/// (z-position, z-velocity). The measured worst |Δx| is ~2e-7.
const UKF_ABS_X: f64 = 1e-6;

fn approx(got: f64, want: f64, rel: f64, abs: f64) -> (bool, f64) {
    let d = (got - want).abs();
    (d <= rel * want.abs() + abs, d)
}

/// Parse a comma-separated f64 list.
fn csv(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse::<f64>().unwrap_or_else(|_| panic!("bad float '{x}'")))
        .collect()
}

/// The fixed 5-satellite MEO geometry, identical to the generator and to
/// `tightly_coupled.rs::constellation`.
fn constellation() -> Vec<Sat> {
    vec![
        Sat { pos: [2.00e7, 1.00e7, 1.50e7], vel: [-1500.0, 2200.0, 600.0] },
        Sat { pos: [1.50e7, -1.20e7, 1.80e7], vel: [1800.0, 1500.0, -700.0] },
        Sat { pos: [2.20e7, 0.50e7, -1.00e7], vel: [-900.0, -2000.0, 1200.0] },
        Sat { pos: [1.00e7, 1.80e7, -1.50e7], vel: [2100.0, -800.0, -1000.0] },
        Sat { pos: [2.50e7, -0.80e7, 0.60e7], vel: [-1200.0, 1700.0, 1400.0] },
    ]
}

/// Truth state at integer second `t`, matching the generator's `truth_state`.
fn truth_state(t: f64) -> [f64; 8] {
    [7.0e6, 7.5e3 * t, 0.0, 0.0, 7.5e3, 0.0, 30.0 + 0.1 * t, 0.1]
}

const SIGMA_PR: f64 = 1.0;
const SIGMA_RR: f64 = 0.05;
const X0_TC: [f64; 8] = [7.0e6 + 150.0, -120.0, 90.0, 2.0, 7.5e3 - 1.5, 1.0, 38.0, 0.15];
const P0_TC: [f64; 8] = [1.0e4, 1.0e4, 1.0e4, 1.0e2, 1.0e2, 1.0e2, 1.0e4, 1.0e0];

fn diag(d: &[f64]) -> Vec<Vec<f64>> {
    let n = d.len();
    let mut m = vec![vec![0.0; n]; n];
    for (i, &v) in d.iter().enumerate() {
        m[i][i] = v;
    }
    m
}

/// Drive the kshana tightly-coupled UKF for `n_epochs` of propagate+update on
/// noiseless truth measurements (Q=0), returning the per-epoch (x, P-flat).
fn run_kshana_ukf(sats: &[Sat], n_epochs: usize) -> Vec<(Vec<f64>, Vec<f64>)> {
    let q = vec![vec![0.0; 8]; 8]; // Q = 0, matching the fixture
    let mut nav = TightlyCoupled::new(X0_TC.to_vec(), diag(&P0_TC), q);
    let mut out = Vec::with_capacity(n_epochs);
    for step in 1..=n_epochs {
        let ts = truth_state(step as f64);
        let pr: Vec<f64> = sats.iter().map(|s| pseudorange(&ts, s)).collect();
        let rr: Vec<f64> = sats.iter().map(|s| range_rate(&ts, s)).collect();
        assert!(nav.propagate(1.0), "propagate failed at epoch {step}");
        assert!(
            nav.update_gnss(sats, &pr, &rr, SIGMA_PR, SIGMA_RR),
            "update_gnss failed at epoch {step}"
        );
        let pflat: Vec<f64> = nav.ukf.p.iter().flat_map(|row| row.iter().copied()).collect();
        out.push((nav.ukf.x.clone(), pflat));
    }
    out
}

#[test]
fn ukf_tightly_coupled_matches_filterpy() {
    let five = constellation();
    let three = constellation()[..3].to_vec();
    let ksh_5 = run_kshana_ukf(&five, 20);
    let ksh_3 = run_kshana_ukf(&three, 20);

    let mut n = 0usize;
    let mut worst_x = 0.0_f64;
    let mut worst_p = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("UKF ") {
            continue;
        }
        // UKF name | epoch | k | x(8) | P(64)
        let parts: Vec<&str> = line.splitn(5, '|').collect();
        assert_eq!(parts.len(), 5, "UKF row needs 5 fields: {line}");
        let name = parts[0].trim_start_matches("UKF").trim();
        let epoch: usize = parts[1].trim().parse().unwrap();
        let x_want = csv(parts[3]);
        let p_want = csv(parts[4]);
        assert_eq!(x_want.len(), 8);
        assert_eq!(p_want.len(), 64);

        let (x_got, p_got) = match name {
            "5sat" => &ksh_5[epoch - 1],
            "3sat" => &ksh_3[epoch - 1],
            other => panic!("unexpected UKF case '{other}'"),
        };

        for (i, (&g, &w)) in x_got.iter().zip(&x_want).enumerate() {
            let (ok, d) = approx(g, w, UKF_REL, UKF_ABS_X);
            worst_x = worst_x.max(d);
            assert!(
                ok,
                "UKF {name} ep{epoch} x[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})"
            );
        }
        for (i, (&g, &w)) in p_got.iter().zip(&p_want).enumerate() {
            let (ok, d) = approx(g, w, UKF_REL, UKF_ABS_P);
            worst_p = worst_p.max(d);
            assert!(
                ok,
                "UKF {name} ep{epoch} P[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})"
            );
        }
        n += 1;
    }
    assert!(n >= 40, "expected >=40 UKF epoch cases (20 each, 5-sat + 3-sat), got {n}");
    eprintln!(
        "ukf_tightly_coupled: {n} epoch cases vs filterpy UKF, worst |Δx| = {worst_x:.3e}, worst |ΔP| = {worst_p:.3e}"
    );
}

#[test]
fn ekf_loosely_coupled_matches_filterpy() {
    let mut n = 0usize;
    let mut worst_x = 0.0_f64;
    let mut worst_p = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("EKFLOOSE ") {
            continue;
        }
        // EKFLOOSE name | dx(15) | P(225) | ins_pos(3) | ins_vel(3) | sp | sv
        let parts: Vec<&str> = line.splitn(7, '|').collect();
        assert_eq!(parts.len(), 7, "EKFLOOSE row needs 7 fields: {line}");
        let name = parts[0].trim_start_matches("EKFLOOSE").trim();
        let dx_want = csv(parts[1]);
        let p_want = csv(parts[2]);
        let ins_pos = csv(parts[3]);
        let ins_vel = csv(parts[4]);
        let sp: f64 = parts[5].trim().parse().unwrap();
        let sv: f64 = parts[6].trim().parse().unwrap();
        assert_eq!(dx_want.len(), 15);
        assert_eq!(p_want.len(), 225);

        // default_ekf: sigma_pos=10, vel=1, att=0.01, ba=0.1, bg=0.01.
        let mut ekf = GnssInsEkf::new(10.0, 1.0, 0.01, 0.1, 0.01, EkfNoise::default());
        let gnss = GnssMeasurement {
            pos: [0.0; 3],
            vel: [0.0; 3],
            sigma_pos_m: sp,
            sigma_vel_mps: sv,
        };
        let dx = ekf.update_loosely_coupled(
            [ins_pos[0], ins_pos[1], ins_pos[2]],
            [ins_vel[0], ins_vel[1], ins_vel[2]],
            gnss,
        );
        let pdiag = ekf.covariance_diagonal();

        for (i, (&g, &w)) in dx.iter().zip(&dx_want).enumerate() {
            let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
            worst_x = worst_x.max(d);
            assert!(ok, "EKFLOOSE {name} dx[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})");
        }
        // Compare the covariance diagonal (the public covariance accessor).
        for (i, &g) in pdiag.iter().enumerate() {
            let w = p_want[i * 15 + i]; // diagonal element of the 15x15
            let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
            worst_p = worst_p.max(d);
            assert!(
                ok,
                "EKFLOOSE {name} Pdiag[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})"
            );
        }
        n += 1;
    }
    assert!(n >= 4, "expected >=4 EKFLOOSE cases, got {n}");
    eprintln!(
        "ekf_loosely_coupled: {n} cases vs filterpy KalmanFilter, worst |Δdx| = {worst_x:.3e}, worst |ΔPdiag| = {worst_p:.3e}"
    );
}

#[test]
fn ekf_tightly_coupled_matches_filterpy() {
    let mut n = 0usize;
    let mut worst_x = 0.0_f64;
    let mut worst_p = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("EKFTIGHT ") {
            continue;
        }
        // EKFTIGHT name | dx(15) | P(225) | ins_pos(3) | sat_positions(;-sep) | rho_meas(m) | sigma_range
        let parts: Vec<&str> = line.splitn(7, '|').collect();
        assert_eq!(parts.len(), 7, "EKFTIGHT row needs 7 fields: {line}");
        let name = parts[0].trim_start_matches("EKFTIGHT").trim();
        let dx_want = csv(parts[1]);
        let p_want = csv(parts[2]);
        let ins_pos = csv(parts[3]);
        let sats: Vec<[f64; 3]> = parts[4]
            .trim()
            .split(';')
            .map(|s| {
                let v = csv(s);
                [v[0], v[1], v[2]]
            })
            .collect();
        let rho_meas = csv(parts[5]);
        let sigma_range: f64 = parts[6].trim().parse().unwrap();
        assert_eq!(dx_want.len(), 15);
        assert_eq!(p_want.len(), 225);
        assert_eq!(sats.len(), rho_meas.len());

        let mut ekf = GnssInsEkf::new(10.0, 1.0, 0.01, 0.1, 0.01, EkfNoise::default());
        let dx = ekf
            .update_tightly_coupled(
                [ins_pos[0], ins_pos[1], ins_pos[2]],
                &sats,
                &rho_meas,
                sigma_range,
            )
            .unwrap_or_else(|e| panic!("EKFTIGHT {name}: kshana errored: {e}"));
        let pdiag = ekf.covariance_diagonal();

        for (i, (&g, &w)) in dx.iter().zip(&dx_want).enumerate() {
            let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
            worst_x = worst_x.max(d);
            assert!(ok, "EKFTIGHT {name} dx[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})");
        }
        for (i, &g) in pdiag.iter().enumerate() {
            let w = p_want[i * 15 + i];
            let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
            worst_p = worst_p.max(d);
            assert!(
                ok,
                "EKFTIGHT {name} Pdiag[{i}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})"
            );
        }
        n += 1;
    }
    assert!(n >= 3, "expected >=3 EKFTIGHT cases, got {n}");
    eprintln!(
        "ekf_tightly_coupled: {n} cases vs filterpy KalmanFilter, worst |Δdx| = {worst_x:.3e}, worst |ΔPdiag| = {worst_p:.3e}"
    );
}

#[test]
fn coupled_pnt_matches_filterpy() {
    let mut n = 0usize;
    let mut worst_x = 0.0_f64;
    let mut worst_p = 0.0_f64;
    for line in REF.lines() {
        if !line.starts_with("COUPLED ") {
            continue;
        }
        // COUPLED name | qva | qwf | qrw | dt | p0diag(4) | x(4) | P(16) | seq(rho,g,c,r;...)
        let parts: Vec<&str> = line.splitn(9, '|').collect();
        assert_eq!(parts.len(), 9, "COUPLED row needs 9 fields: {line}");
        let name = parts[0].trim_start_matches("COUPLED").trim();
        let qva: f64 = parts[1].trim().parse().unwrap();
        let qwf: f64 = parts[2].trim().parse().unwrap();
        let qrw: f64 = parts[3].trim().parse().unwrap();
        let dt: f64 = parts[4].trim().parse().unwrap();
        let p0 = csv(parts[5]);
        let x_want = csv(parts[6]);
        let p_want = csv(parts[7]);
        let seq: Vec<[f64; 4]> = parts[8]
            .trim()
            .split(';')
            .map(|s| {
                let v = csv(s);
                [v[0], v[1], v[2], v[3]]
            })
            .collect();
        assert_eq!(x_want.len(), 4);
        assert_eq!(p_want.len(), 16);

        let mut kf = CoupledPntFilter::new(qva, qwf, qrw, p0[0], p0[1], p0[2], p0[3]);
        for step in &seq {
            kf.predict(dt);
            kf.update_pseudorange(step[0], step[1], step[2], step[3]);
        }
        // Public accessors: pos = x[0], phase = x[2]; full 4x4 covariance.
        let pos = kf.pos_est();
        let phase = kf.phase_est();
        let cov = kf.covariance();

        for (lbl, g, w) in [("pos", pos, x_want[0]), ("phase", phase, x_want[2])] {
            let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
            worst_x = worst_x.max(d);
            assert!(ok, "COUPLED {name} {lbl}: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})");
        }
        for i in 0..4 {
            for j in 0..4 {
                let g = cov[i][j];
                let w = p_want[i * 4 + j];
                let (ok, d) = approx(g, w, LIN_REL, LIN_ABS);
                worst_p = worst_p.max(d);
                assert!(
                    ok,
                    "COUPLED {name} P[{i}][{j}]: {g:.9e} vs filterpy {w:.9e} (|Δ|={d:.2e})"
                );
            }
        }
        n += 1;
    }
    assert!(n >= 3, "expected >=3 COUPLED cases, got {n}");
    eprintln!(
        "coupled_pnt: {n} cases vs filterpy KalmanFilter, worst |Δx| = {worst_x:.3e}, worst |ΔP| = {worst_p:.3e}"
    );
}
