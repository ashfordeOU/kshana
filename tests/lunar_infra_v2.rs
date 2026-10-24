// SPDX-License-Identifier: AGPL-3.0-only
//! The scored runs of the signed-off v2 pre-registration (`xval/lunar-infra/PREREGISTRATION-v2.md`,
//! signed off in e9c6fb1a before any run). Results and verdicts: `xval/lunar-infra/RESULTS-v2.md`.
//!
//! PIN-SCOPE:    the stored `results-v2.json` (written by `examples/lunar_infra_v2.rs` and the scipy
//!               script `oracle_v2.py`), its verdicts for C3a, C3b, Q3a, Q3b, G3' (EXPLORATORY) and G3'',
//!               live re-computation of the cheap parts, and the three original misses left NOT MET
//! PIN-EXCLUDES: whether the priors describe what is known about the Moon (the h2, l2 and libration
//!               widths are illustrative), and any real orbit-determination system's detection limit

use kshana::lambda::{bootstrap_success_rate, bootstrap_success_rate_accurate};
use serde_json::Value;

fn results() -> Value {
    serde_json::from_str(include_str!("../xval/lunar-infra/results-v2.json")).unwrap()
}

#[test]
fn c3a_and_c3b_are_met_as_their_own_bars_and_the_original_c3_stays_not_met() {
    let r = results();
    let c = &r["C"];
    assert_eq!(c["C3a_met"], true);
    assert_eq!(c["C3b_met"], true);
    assert_eq!(c["a_detect_m_s2"], 3e-9);
    assert_eq!(c["original_C3_bar"], "NOT MET (unchanged)");
    // The control reproduces the recorded 0.0525 at 3e-10 m/s^2, still below the original bar of 0.5.
    let f = c["control_c3_fraction_at_3e-10"].as_f64().unwrap();
    assert!((f - 0.0525).abs() < 1e-9 && f < 0.5);
    let rows = c["rows"].as_array().unwrap();
    assert_eq!(rows.len(), 6);
    assert!(rows[5]["fraction_exceeding_95"].as_f64().unwrap() >= 0.9);
}

#[test]
fn c_live_control_and_the_analytic_noncentrality() {
    let sc: kshana::lunar_infra::LunarInfrastructureScenario = toml::from_str(include_str!(
        "../scenarios/lunar-infrastructure-od-consistency-model-error.toml"
    ))
    .unwrap();
    let (v, sys) = kshana::lunar_infra::od::run_with_noncentrality(
        &sc.orbit.clone().unwrap_or_default(),
        &sc.gnss.clone().unwrap_or_default(),
        &sc.ground.clone().unwrap_or_default(),
        &sc.monte_carlo.clone().unwrap_or_default(),
        20_261_019,
    )
    .unwrap();
    let f = v["consistency"]["fraction_exceeding_95"].as_f64().unwrap();
    assert!((f - 0.0525).abs() < 1e-9, "control {f}");
    let stored = results()["C"]["rows"][0]["noncentrality"].as_f64().unwrap();
    assert!((sys.noncentrality - stored).abs() <= 1e-9 * stored);
}

#[test]
fn q3a_the_accurate_cdf_equals_scipy_and_q3b_meets_the_original_tolerance() {
    let r = results();
    let q = &r["Q"];
    assert_eq!(q["Q3a_met"], true);
    assert!(q["Q3a_worst_relative_error"].as_f64().unwrap() <= 1e-12);
    assert_eq!(q["Q3a_arguments"], 10_000);
    assert_eq!(q["Q3b_met"], true);
    assert_eq!(q["Q3b_tolerance"].as_f64().unwrap(), 1e-9);
    assert!(q["Q3b_relative_difference_accurate"].as_f64().unwrap() <= 1e-9);
    // The original routine is untouched and its recorded miss reproduces: the original bar Q3 stays NOT MET.
    let old = q["Q3b_relative_difference_old"].as_f64().unwrap();
    assert!(old > 1e-9 && old < 1e-5, "{old}");
    assert_eq!(q["original_Q3_bar"], "NOT MET (unchanged)");
    assert_eq!(q["q1_verdict_unchanged"], true);
    assert_eq!(q["q2_unchanged_by_construction"], true);
}

#[test]
fn q3_live_on_the_pinned_float_design() {
    let d: Value =
        serde_json::from_str(include_str!("fixtures/lunar_infra/phase_design.json")).unwrap();
    let o: Value =
        serde_json::from_str(include_str!("fixtures/lunar_infra/phase_oracle.json")).unwrap();
    let q: Vec<Vec<f64>> = d["q"]
        .as_array()
        .unwrap()
        .iter()
        .map(|r| {
            r.as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_f64().unwrap())
                .collect()
        })
        .collect();
    let ob = o["bootstrap"].as_f64().unwrap();
    let new = bootstrap_success_rate_accurate(&q).unwrap();
    let old = bootstrap_success_rate(&q).unwrap();
    assert!((new - ob).abs() / ob <= 1e-9, "accurate {new} vs {ob}");
    assert!(
        (old - ob).abs() / ob > 1e-9,
        "the original routine's miss must stay visible"
    );
}

#[test]
fn g3_prime_exploratory_and_g3_double_prime_are_met_and_the_original_g3_stays_not_met() {
    let r = results();
    let g = &r["G"];
    assert_eq!(g["original_G3_bar"], "NOT MET (unchanged)");
    let orig = &g["original_g3_statistic"];
    assert_eq!(orig["pairs_checked"], 28);
    assert_eq!(orig["lambda_min_not_smaller"], 28);
    assert_eq!(orig["trace_not_larger"], 16);
    let p = &g["G3_prime_EXPLORATORY"];
    assert_eq!(p["met"], true);
    assert_eq!(p["pairs_checked"], 28);
    assert_eq!(p["lambda_min_not_smaller"], 28);
    assert_eq!(p["trace_of_inverse_not_larger"], 28);
    let sens = g["G3_prime_sensitivity_EXPLORATORY"].as_array().unwrap();
    assert_eq!(sens.len(), 10);
    assert!(sens.iter().all(|s| s["met"] == true));
    let pp = &g["G3_double_prime"];
    assert_eq!(pp["met"], true);
    assert_eq!(pp["additions_that_do_not_raise_rank"], 12);
    assert_eq!(pp["additions_that_raise_rank"], 16);
    assert_eq!(pp["of_which_trace_not_larger"], 12);
}

#[test]
fn g_live_matches_the_stored_counts() {
    let sc: kshana::lunar_infra::LunarInfrastructureScenario = toml::from_str(include_str!(
        "../scenarios/lunar-infrastructure-geodesy-sensitivity.toml"
    ))
    .unwrap();
    let v = kshana::lunar_infra::geodesy::campaign_g(
        &sc.orbit.clone().unwrap_or_default(),
        &sc.nominal.clone().unwrap_or_default(),
        &sc.llr.clone().unwrap_or_default(),
        &sc.orbiter.clone().unwrap_or_default(),
        &sc.gravimeter.clone().unwrap_or_default(),
        &sc.clock.clone().unwrap_or_default(),
    )
    .unwrap();
    assert_eq!(v["g3_prime"]["met"], true);
    assert_eq!(v["g3_double_prime"]["met"], true);
    assert_eq!(v["original_g3_statistic"]["trace_not_larger"], 16);
}
