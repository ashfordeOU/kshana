// SPDX-License-Identifier: AGPL-3.0-only
//! Study 1 of the `lunar-infrastructure` kind (`study = "od-consistency"`) against the bars of
//! `xval/lunar-infra/PREREGISTRATION.md` (committed in 09d55f8c before any study was scored).
//! Results and the verdict of each bar: `xval/lunar-infra/RESULTS.md`.
//!
//! PIN-SCOPE:    the first and only scored run of the committed example scenarios (seed 20261019,
//!               400 trials) and the verdict of bars O1, C1, C2 and C3, including the miss (C3)
//! PIN-EXCLUDES: the post-hoc acceleration sweep in RESULTS.md (not a registered bar)

use kshana::cr3bp::{propagate_state_stm, Cr3bpState, EARTH_MOON_MU};
use kshana::lunar_infra::orbit::{OrbitSpec, T_UNIT_S};
use serde_json::Value;

fn run(toml: &str) -> Value {
    let out = kshana::api::run_toml(toml).expect("scenario runs");
    serde_json::from_str(&out.json).unwrap()
}

#[test]
fn o1_the_state_transition_matrix_equals_scipy_dop853() {
    let oracle: Value =
        serde_json::from_str(include_str!("fixtures/lunar_infra/oracle_o1.json")).unwrap();
    let inp: Value =
        serde_json::from_str(include_str!("fixtures/lunar_infra/nrho_ic.json")).unwrap();
    // Three days: the orbit the study samples (its last sample is exactly 3 d).
    let o = OrbitSpec::default().build(3.0).unwrap();
    let k = o.t_s.len() - 1;
    assert_eq!(o.t_s[k], 259_200.0);
    let rel = |got: &[[f64; 6]; 6], want: &Value| -> f64 {
        let mut maxd: f64 = 0.0;
        let mut maxv: f64 = 0.0;
        for i in 0..6 {
            for j in 0..6 {
                let w = want[i][j].as_f64().unwrap();
                maxd = maxd.max((got[i][j] - w).abs());
                maxv = maxv.max(w.abs());
            }
        }
        maxd / maxv
    };
    let e3 = rel(&o.phi[k], &oracle["three_days"]["phi"]);
    assert!(e3 <= 1e-6, "three days: relative max-entry error {e3:e}");
    for i in 0..6 {
        let w = oracle["three_days"]["x"][i].as_f64().unwrap();
        assert!(
            (o.x[k][i] - w).abs() <= 1e-6 * w.abs().max(1e-3),
            "state {i}"
        );
    }
    // One period, by the crate's own propagator at the sampling step.
    let ic = inp["ic"].as_array().unwrap();
    let s0 = Cr3bpState {
        r: [
            ic[0].as_f64().unwrap(),
            ic[1].as_f64().unwrap(),
            ic[2].as_f64().unwrap(),
        ],
        v: [
            ic[3].as_f64().unwrap(),
            ic[4].as_f64().unwrap(),
            ic[5].as_f64().unwrap(),
        ],
    };
    let period_nd = inp["period_s"].as_f64().unwrap() / T_UNIT_S;
    let steps = (inp["period_s"].as_f64().unwrap() / 600.0 * 24.0).round() as usize;
    let (_, phi) = propagate_state_stm(&s0, EARTH_MOON_MU, period_nd, steps);
    let ep = rel(&phi, &oracle["one_period"]["phi"]);
    assert!(ep <= 1e-6, "one period: relative max-entry error {ep:e}");
}

#[test]
fn c1_c2_matched_models_are_statistically_consistent() {
    let v = run(include_str!(
        "../scenarios/lunar-infrastructure-od-consistency.toml"
    ));
    let c = &v["consistency"];
    assert_eq!(c["trials"], 400);
    let mq = c["mean_q"].as_f64().unwrap();
    let within = c["fraction_within_95"].as_f64().unwrap();
    assert!((5.2..=6.8).contains(&mq), "C1 mean q {mq}");
    assert!((0.925..=0.975).contains(&within), "C1 fraction {within}");
    for key in [
        "sample_over_formal_trace_gnss",
        "sample_over_formal_trace_ground",
    ] {
        let r = c[key].as_f64().unwrap();
        assert!((0.85..=1.15).contains(&r), "C2 {key} {r}");
    }
    // Recorded: mean q 5.808, fraction 0.96, trace ratios 1.013 and 1.055.
    assert!((mq - 5.808).abs() < 1e-3 && (within - 0.96).abs() < 1e-9);
}

#[test]
fn c3_is_not_met_the_statistic_does_not_detect_a_3e_minus_10_acceleration() {
    // Registered: with an unmodelled 3e-10 m/s^2 the fraction of trials with q above the 95 %
    // point is at least 0.5. Measured 0.0525: the onboard-GNSS orbit is only known to hundreds of
    // metres, so about 10 m of unmodelled displacement hides inside its covariance. NOT MET; the
    // miss is pinned (the test fails if the value ever reaches the bar).
    let v = run(include_str!(
        "../scenarios/lunar-infrastructure-od-consistency-model-error.toml"
    ));
    let c = &v["consistency"];
    assert_eq!(c["model_error_accel_m_s2"], 3.0e-10);
    let exceed = c["fraction_exceeding_95"].as_f64().unwrap();
    assert!(exceed < 0.5, "C3 would now be met: {exceed}");
    assert!((exceed - 0.0525).abs() < 1e-9, "C3 fraction {exceed}");
}
