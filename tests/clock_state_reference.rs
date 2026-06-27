// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the full trajectory of the three-state onboard clock
//! Kalman filter ([`kshana::clock_state::ClockState3`]) against an **independent
//! third-party authority**: filterpy 1.4.5 (Roger R. Labbe Jr., MIT), the
//! reference filter library from *Kalman and Bayesian Filters in Python*.
//!
//! filterpy's `KalmanFilter` is a general-purpose linear-Gaussian filter. It is
//! configured here to the IDENTICAL three-state phase/freq/drift clock model:
//!   * F built independently with `scipy.linalg.expm(A*dt)` (Van Loan 1978),
//!     NOT kshana's hard-coded `[[1,dt,dt^2/2],[0,1,dt],[0,0,1]]` polynomial;
//!   * Q built with the Van-Loan block-matrix method, NOT kshana's closed-form
//!     polynomial Q;
//!   * H = [1,0,0], scalar R, and the same Joseph-stabilised update
//!     `P = (I-KH)P(I-KH)' + KRK'`.
//! It is then driven through the SAME deterministic predict / update_phase call
//! sequence over a multi-epoch coast-then-track run, and EVERY element of the
//! 3-vector state x = [phase, freq, drift] and the full 3x3 covariance P after
//! EVERY predict and EVERY update is compared, across four parameter sets
//! (white-only / white+random-walk / full 3-state / harsh Q-R).
//!
//! This is the same library-vs-library validation DOP gets against gnss_lib_py
//! and the Lambert solver gets against lamberthub: a different codebase, fed
//! byte-identical inputs, agreeing to a stated tolerance.
//!
//! Honest scope: filterpy and kshana implement the SAME linear-Gaussian Kalman
//! recursion. Given F, Q, H, R and the measurement sequence there is exactly one
//! correct (x, P), so this is a library-vs-library agreement check on the
//! recursion (with F/Q built by an independent scipy.expm + Van-Loan route),
//! NOT an analytic-truth check. It pins kshana's hand-rolled fixed-size
//! predict/update_phase arithmetic to a trusted general-purpose KF to ~1e-12.
//! It does NOT validate the clock physics / PSD calibration (which map a real
//! oscillator's Allan profile and stay MODELLED) — only the estimator recursion.
//! The complementary `scipy_reference.rs::clock_van_loan_q_matches_scipy_linalg_expm`
//! pins the predict-step Q alone; this fixture extends the check to the entire
//! predict+update trajectory.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/clock_state/`.

use kshana::clock_state::ClockState3;

const REF: &str = include_str!("fixtures/clock_state/clock_state_reference.txt");

/// Worst-case per-element tolerance: a 1e-9 relative bound on every x and P
/// element, plus a tiny per-element absolute floor scaled to the dominant
/// magnitude of the row's vector/matrix so an element filterpy reports as a
/// numerical ~0 (e.g. a drift entry under a white-only PSD) matches kshana's
/// near-zero value. Both run the same closed-form recursion, so the residual is
/// pure float reassociation between kshana's fixed-size expansion and filterpy's
/// numpy dot-products; a hand check showed ~1e-12.
const REL_TOL: f64 = 1e-9;

fn approx(got: f64, want: f64, abs_tol: f64) -> bool {
    (got - want).abs() <= REL_TOL * want.abs() + abs_tol
}

fn csv_f64(s: &str) -> Vec<f64> {
    s.trim()
        .split(',')
        .map(|x| x.trim().parse().unwrap())
        .collect()
}

#[test]
fn clock_state_trajectory_matches_filterpy() {
    let mut n_cases = 0usize;
    let mut n_steps = 0usize;
    let mut n_predict = 0usize;
    let mut n_update = 0usize;
    let mut worst_rel = 0.0_f64;

    // Active filter + its model parameters, set by each CASE header line.
    let mut kf: Option<ClockState3> = None;
    let mut dt = 0.0_f64;
    let mut r = 0.0_f64;
    let mut case_name = String::new();
    let mut case_steps = 0usize;

    for line in REF.lines() {
        if line.starts_with("CASE ") {
            // CASE name | q_wf q_rw q_drift | dt | r | p0a,p0b,p0c | n | coast
            let parts: Vec<&str> = line.splitn(7, '|').collect();
            assert_eq!(parts.len(), 7, "CASE row needs 7 |-fields: {line}");
            let name = parts[0].trim_start_matches("CASE").trim().to_string();
            let q: Vec<f64> = parts[1].split_whitespace().map(|x| x.parse().unwrap()).collect();
            assert_eq!(q.len(), 3, "CASE {name}: need q_wf q_rw q_drift");
            dt = parts[2].trim().parse().unwrap();
            r = parts[3].trim().parse().unwrap();
            let p0 = csv_f64(parts[4]);
            assert_eq!(p0.len(), 3, "CASE {name}: need p0_phase,p0_freq,p0_drift");
            // (n_epochs = parts[5], coast = parts[6] are implicit in the STEP stream.)

            kf = Some(
                ClockState3::new(q[0], q[1], q[2]).with_initial_cov(p0[0], p0[1], p0[2]),
            );
            case_name = name;
            case_steps = 0;
            n_cases += 1;
            continue;
        }
        if !line.starts_with("STEP ") {
            continue;
        }
        // STEP name epoch kind z | x0,x1,x2 | p00,p01,p02,p11,p12,p22
        let parts: Vec<&str> = line.splitn(3, '|').collect();
        assert_eq!(parts.len(), 3, "STEP row needs 3 |-fields: {line}");
        let head: Vec<&str> = parts[0].split_whitespace().collect();
        assert_eq!(head.len(), 5, "STEP head: STEP name epoch kind z");
        let name = head[1];
        let kind = head[3];
        let z: f64 = head[4].parse().unwrap();
        assert_eq!(name, case_name, "STEP for {name} but active case is {case_name}");

        let x_want = csv_f64(parts[1]);
        assert_eq!(x_want.len(), 3, "{name}: need x0,x1,x2");
        let p_want = csv_f64(parts[2]);
        assert_eq!(p_want.len(), 6, "{name}: need p00,p01,p02,p11,p12,p22");

        let filter = kf.as_mut().expect("STEP before any CASE header");
        match kind {
            "predict" => {
                filter.predict(dt);
                n_predict += 1;
            }
            "update" => {
                filter.update_phase(z, r);
                n_update += 1;
            }
            other => panic!("unknown STEP kind '{other}' in: {line}"),
        }

        let x = filter.x;
        let p = filter.covariance();

        // Per-element absolute floor scaled to the dominant magnitude of the
        // state vector / covariance matrix, so numerical-zero components match
        // without masking a real divergence in the dominant entries.
        let x_scale = x_want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        let p_scale = p_want.iter().fold(0.0_f64, |m, &v| m.max(v.abs()));
        let x_abs = 1e-12 * x_scale;
        let p_abs = 1e-12 * p_scale;

        // State: x = [phase, freq, drift].
        let x_labels = ["x_phase", "x_freq", "x_drift"];
        for i in 0..3 {
            let (got, want) = (x[i], x_want[i]);
            let scale = want.abs().max(1e-300);
            worst_rel = worst_rel.max((got - want).abs() / scale);
            assert!(
                approx(got, want, x_abs),
                "{name} epoch {} {kind}: {} {got:.12e} vs filterpy {want:.12e} \
                 (|Δ|={:.3e} > {:.3e})",
                head[2],
                x_labels[i],
                (got - want).abs(),
                REL_TOL * want.abs() + x_abs,
            );
        }

        // Covariance: six unique symmetric entries 00 01 02 11 12 22.
        let p_got = [p[0][0], p[0][1], p[0][2], p[1][1], p[1][2], p[2][2]];
        let p_labels = ["p00", "p01", "p02", "p11", "p12", "p22"];
        for i in 0..6 {
            let (got, want) = (p_got[i], p_want[i]);
            let scale = want.abs().max(1e-300);
            worst_rel = worst_rel.max((got - want).abs() / scale);
            assert!(
                approx(got, want, p_abs),
                "{name} epoch {} {kind}: {} {got:.12e} vs filterpy {want:.12e} \
                 (|Δ|={:.3e} > {:.3e})",
                head[2],
                p_labels[i],
                (got - want).abs(),
                REL_TOL * want.abs() + p_abs,
            );
        }
        // P must stay symmetric (kshana writes both halves via independent float
        // expansions, so they agree to a few ULP, not necessarily bit-exact) and
        // positive-semidefinite.
        let sym_tol = 1e-12 * p_scale + 1e-300;
        assert!((p[0][1] - p[1][0]).abs() <= sym_tol, "{name}: P not symmetric (01/10)");
        assert!((p[0][2] - p[2][0]).abs() <= sym_tol, "{name}: P not symmetric (02/20)");
        assert!((p[1][2] - p[2][1]).abs() <= sym_tol, "{name}: P not symmetric (12/21)");
        assert!(filter.is_psd(), "{name} epoch {} {kind}: kshana P lost PSD-ness", head[2]);

        n_steps += 1;
        case_steps += 1;
    }
    let _ = case_steps;

    // Coverage gates (planned minimum: >=200 epochs across >=4 parameter sets).
    assert_eq!(n_cases, 4, "expected exactly 4 parameter sets, got {n_cases}");
    assert!(
        n_predict + n_update == n_steps,
        "step accounting mismatch: {n_predict} predict + {n_update} update != {n_steps}"
    );
    assert!(
        n_predict >= 4 * 200,
        "expected >= 800 predict steps (>=200 epochs x 4 cases), got {n_predict}"
    );
    assert!(n_update >= 800, "expected >= 800 update steps, got {n_update}");
    assert!(n_steps >= 1600, "expected >= 1600 total compared steps, got {n_steps}");

    eprintln!(
        "clock_state_reference: {n_cases} cases, {n_steps} steps \
         ({n_predict} predict + {n_update} update) vs filterpy 1.4.5; \
         worst per-element rel error = {worst_rel:.3e}"
    );
}
