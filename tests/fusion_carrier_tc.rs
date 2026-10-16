// SPDX-License-Identifier: AGPL-3.0-only
//! Carrier-phase tightly coupled GNSS/INS (`fusion::carrier_tc`, RM-25 / FUT-17): float
//! ambiguities, explicit receiver clock, SGP4 Walker geometry with broadcast ionosphere and
//! troposphere in the measurement loop, and time-differenced-carrier slip detection, on truth
//! flown by the trajectory library.
//!
//! MODELLED / InternalConsistency: the measurements are synthesised from the models the filter
//! uses, so these tests show the estimator is consistent (χ² NEES and NIS over seeds), that the
//! carrier adds the information it should over code alone, that slips are caught, and that the
//! broadcast corrections are applied — not that it matches a real receiver.

use kshana::frames::Geodetic;
use kshana::fusion::carrier_tc::{run_carrier_tc, CarrierTcCfg, SlipCfg, TcMode};
use kshana::fusion::pack::ImuCfg;
use kshana::fusion::trajectory::{truth_epochs, TrajectoryCfg};

fn truth(seconds: f64) -> Vec<kshana::fusion::truth::TruthEpoch> {
    let origin = Geodetic {
        lat_rad: 45f64.to_radians(),
        lon_rad: 10f64.to_radians(),
        alt_m: 100.0,
    };
    let cfg = TrajectoryCfg::Figure8 {
        speed_mps: 15.0,
        accel_mps2: 1.0,
        turn_rate_dps: 6.0,
    };
    truth_epochs(&cfg, origin, 0.1, (seconds / 0.1).round() as usize).unwrap()
}

fn imu() -> ImuCfg {
    ImuCfg {
        id: "tactical".into(),
        provenance: "test".into(),
        accel_bias: [0.01, -0.01, 0.005],
        gyro_bias: [1e-5, -1e-5, 2e-5],
        error_model: None,
        filter_prior: None,
    }
}

#[test]
fn carrier_phase_beats_code_only_on_identical_measurements() {
    let tr = truth(300.0);
    let r = run_carrier_tc(&CarrierTcCfg::default(), &tr, &imu(), 11);
    let (c, p) = (&r.code_only.summary, &r.primary.summary);
    eprintln!(
        "steady 3-D RMS: carrier {:.3} m, code {:.3} m; NIS/dof {:.2}; NEES/dof {:.2}",
        p.steady_rms_3d_m, c.steady_rms_3d_m, p.nis_per_dof, p.steady_nees_per_dof
    );
    assert_eq!(r.primary.mode, TcMode::Carrier);
    assert!(p.steady_rms_3d_m < 0.5 * c.steady_rms_3d_m);
    assert!(
        p.slip_detections.is_empty(),
        "false slip alarms: {:?}",
        p.slip_detections
    );
}

/// Filter consistency over Monte Carlo seeds: the run-averaged NIS per degree of freedom and
/// the second-half NEES per degree of freedom (8 estimable states) stay near 1.
#[test]
fn nis_and_nees_are_consistent_over_seeds() {
    let tr = truth(200.0);
    let (mut nis, mut nees) = (Vec::new(), Vec::new());
    for seed in 0..12 {
        let r = run_carrier_tc(&CarrierTcCfg::default(), &tr, &imu(), 1000 + seed);
        nis.push(r.primary.summary.nis_per_dof);
        nees.push(r.primary.summary.steady_nees_per_dof);
    }
    let mean = |v: &[f64]| v.iter().sum::<f64>() / v.len() as f64;
    let (mn, me) = (mean(&nis), mean(&nees));
    eprintln!("12 seeds: mean NIS/dof {mn:.3}, mean steady NEES/dof {me:.3}");
    assert!((0.8..1.25).contains(&mn), "NIS/dof {mn}");
    assert!((0.5..2.0).contains(&me), "NEES/dof {me}");
}

#[test]
fn a_one_cycle_slip_is_detected_and_does_not_corrupt_the_solution() {
    let tr = truth(240.0);
    let clean = run_carrier_tc(&CarrierTcCfg::default(), &tr, &imu(), 21);
    // Slip a satellite that is tracked at 120 s.
    let sat = (0..24)
        .find(|&s| {
            let cfg = CarrierTcCfg {
                slips: vec![SlipCfg {
                    sat: s,
                    t: 120.0,
                    cycles: 1.0,
                }],
                ..CarrierTcCfg::default()
            };
            let r = run_carrier_tc(&cfg, &tr, &imu(), 21);
            r.primary
                .summary
                .slip_detections
                .iter()
                .any(|d| d.sat == s && (d.t - 120.0).abs() <= 1.0)
        })
        .expect("a tracked satellite whose 1-cycle slip at 120 s is detected within one epoch");
    let cfg = CarrierTcCfg {
        slips: vec![SlipCfg {
            sat,
            t: 120.0,
            cycles: 1.0,
        }],
        ..CarrierTcCfg::default()
    };
    let r = run_carrier_tc(&cfg, &tr, &imu(), 21);
    let d = &r.primary.summary.slip_detections;
    assert_eq!(d.len(), 1, "exactly the injected slip: {d:?}");
    let (a, b) = (
        r.primary.summary.steady_rms_3d_m,
        clean.primary.summary.steady_rms_3d_m,
    );
    eprintln!("satellite {sat}: slip detected; steady 3-D RMS {a:.3} m vs clean {b:.3} m");
    assert!(
        a < 2.0 * b + 0.05,
        "slip corrupted the solution: {a} vs {b}"
    );
}

#[test]
fn switching_off_the_broadcast_corrections_shows_their_error() {
    let tr = truth(200.0);
    let base = run_carrier_tc(&CarrierTcCfg::default(), &tr, &imu(), 31);
    let mut no_iono = CarrierTcCfg::default();
    no_iono.iono.correct = false;
    let mut no_tropo = CarrierTcCfg::default();
    no_tropo.tropo.correct = false;
    let a = base.code_only.summary.steady_rms_3d_m;
    let b = run_carrier_tc(&no_iono, &tr, &imu(), 31)
        .code_only
        .summary
        .steady_rms_3d_m;
    let c = run_carrier_tc(&no_tropo, &tr, &imu(), 31)
        .code_only
        .summary
        .steady_rms_3d_m;
    eprintln!("code-only steady 3-D RMS: corrected {a:.2} m, no iono {b:.2} m, no tropo {c:.2} m");
    assert!(b > a + 1.0 && c > a + 1.0);
}

#[test]
fn a_noise_free_run_converges_to_the_truth() {
    let tr = truth(200.0);
    let cfg = CarrierTcCfg {
        noise_scale: 0.0,
        ..CarrierTcCfg::default()
    };
    let r = run_carrier_tc(&cfg, &tr, &imu(), 41);
    let last = r.primary.epochs.last().unwrap();
    eprintln!(
        "noise-free: final 3-D error {:.4} m, clock-bias error {:.4} m",
        last.err_3d_m, last.clock_bias_err_m
    );
    assert!(last.err_3d_m < 0.05 && last.clock_bias_err_m.abs() < 0.05);
}
