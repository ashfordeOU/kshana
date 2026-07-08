// SPDX-License-Identifier: AGPL-3.0-only
//! L37 golden reference — the committed `scenarios/lunar-time-budget.toml` reproduces the
//! seven-term Coordinated Lunar Time (LTC) time-error budget deterministically.
//!
//! The oracle is platform-invariant closed form, not raw float formatting: the crossover
//! τ for the flicker-FM passive H-maser is the analytic `τ* = (δr/c)/floor`, the
//! root-sum-square total dominates every term at every τ, and the document is byte-
//! identical on re-run in the same process.

use kshana::api::run_toml;
use kshana::clock_specs::{sigma_y, LunarClock};
use serde_json::Value;

const TOML: &str = include_str!("../scenarios/lunar-time-budget.toml");

#[test]
fn committed_scenario_reproduces_the_budget_deterministically() {
    let a = run_toml(TOML).expect("lunar-time-budget scenario runs");
    let b = run_toml(TOML).expect("second run");
    assert_eq!(a.json, b.json, "budget JSON must be deterministic");

    let v: Value = serde_json::from_str(&a.json).unwrap();
    assert_eq!(v["kind"], "lunar-time-budget");
    assert_eq!(v["clock"], "passive-h-maser");
    assert_eq!(v["terms"].as_array().unwrap().len(), 7, "seven-term budget");
    assert!(
        v["label"].as_str().unwrap().contains("MODELLED"),
        "honesty label must be present"
    );
}

#[test]
fn crossover_tau_equals_the_flicker_floor_closed_form() {
    // Oracle: the passive H-maser is flicker-FM limited, so its clock time error is
    // x_clock = floor·τ; setting it equal to the constant frame term δr/c gives the exact
    // crossover τ* = (δr/c)/floor. The committed scenario's JSON must reproduce it.
    let out = run_toml(TOML).unwrap();
    let v: Value = serde_json::from_str(&out.json).unwrap();
    let tau_star = v["crossover_tau_s"].as_f64().unwrap();
    let frame = v["frame_term_s"].as_f64().unwrap();
    let floor = sigma_y(&LunarClock::Phm.powerlaw(), 1.0);
    let analytic = frame / floor;
    assert!(
        (tau_star - analytic).abs() / analytic < 1e-9,
        "crossover τ {tau_star} vs closed form {analytic}"
    );
}

#[test]
fn rss_total_dominates_each_term_at_every_tau() {
    let out = run_toml(TOML).unwrap();
    let v: Value = serde_json::from_str(&out.json).unwrap();
    let sigma: Vec<f64> = v["x_sigma_s"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    for term in v["terms"].as_array().unwrap() {
        for (i, xi) in term["x_s"].as_array().unwrap().iter().enumerate() {
            assert!(
                sigma[i] >= xi.as_f64().unwrap() - 1e-24,
                "x_Σ must dominate term {} at index {i}",
                term["name"]
            );
        }
    }
}
