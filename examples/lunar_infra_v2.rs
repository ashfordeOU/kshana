// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered `lunar-infrastructure` v2 campaigns (xval/lunar-infra/PREREGISTRATION-v2.md):
//! C (detection limit), Q (success rate with an accurate normal CDF) and G (information adds, with
//! priors and rank-aware). Writes the Rust half of the result; `xval/lunar-infra/oracle_v2.py` adds
//! the scipy values and the verdicts. Run in release: `cargo run --release --example lunar_infra_v2 out.json`.

use kshana::lambda::{
    bootstrap_success_rate, bootstrap_success_rate_accurate, normal_cdf_accurate,
};
use kshana::lunar_infra::{geodesy, od, phase, LunarInfrastructureScenario};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde_json::{json, Value};

const SEED: u64 = 20_261_019;
const GRID: [f64; 6] = [3e-10, 1e-9, 3e-9, 1e-8, 3e-8, 1e-7];

fn scenario(toml: &str) -> LunarInfrastructureScenario {
    toml::from_str(toml).expect("scenario")
}

fn campaign_c() -> Value {
    let base = scenario(include_str!(
        "../scenarios/lunar-infrastructure-od-consistency-model-error.toml"
    ));
    let mut rows = Vec::new();
    for &a in &GRID {
        let mut mc = base.monte_carlo.clone().unwrap();
        mc.model_error_accel_m_s2 = Some(a);
        let (v, sys) = od::run_with_noncentrality(
            &base.orbit.clone().unwrap_or_default(),
            &base.gnss.clone().unwrap_or_default(),
            &base.ground.clone().unwrap_or_default(),
            &mc,
            SEED,
        )
        .expect("od");
        rows.push(json!({
            "accel_m_s2": a,
            "trials": v["consistency"]["trials"],
            "fraction_exceeding_95": v["consistency"]["fraction_exceeding_95"],
            "mean_q": v["consistency"]["mean_q"],
            "noncentrality": sys.noncentrality,
            "displacement_m": sys.displacement_m,
            "gnss_position_sigma_m": v["gnss_estimate"]["position_sigma_m"],
            "ground_position_sigma_m": v["ground_estimate"]["position_sigma_m"],
            "displacement_over_onboard_sigma": sys.displacement_m
                / v["gnss_estimate"]["position_sigma_m"].as_f64().unwrap(),
        }));
    }
    json!({"chi2_6_95_point": 12.592, "rows": rows})
}

fn campaign_q() -> Value {
    // Q3a: the CDF at 10,000 arguments in [-8, 8].
    let mut rng = ChaCha8Rng::seed_from_u64(SEED);
    let xs: Vec<f64> = (0..10_000).map(|_| rng.gen_range(-8.0..8.0)).collect();
    let ys: Vec<f64> = xs.iter().map(|&x| normal_cdf_accurate(x)).collect();
    // Q3b: the float design.
    let d: Value = serde_json::from_str(include_str!(
        "../tests/fixtures/lunar_infra/phase_design.json"
    ))
    .unwrap();
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
    // Q1/Q2: the bootstrapped rate of each arc of the scored run with the accurate CDF.
    let sc = scenario(include_str!(
        "../xval/lunar-infra/scenarios/carrier-phase-scored.toml"
    ));
    let orbit = sc.orbit.clone().unwrap_or_default();
    let mut arcs = Vec::new();
    for &arc in orbit.arcs_days.as_ref().unwrap() {
        let des = phase::design(
            &orbit,
            &sc.gnss.clone().unwrap_or_default(),
            &sc.surface.clone().unwrap_or_default(),
            arc,
        )
        .expect("design");
        let f = phase::solve_float(&des).expect("float");
        arcs.push(json!({
            "arc_days": arc,
            "bootstrapped_old": bootstrap_success_rate(&f.q),
            "bootstrapped_accurate": bootstrap_success_rate_accurate(&f.q),
        }));
    }
    json!({
        "cdf_args": xs, "cdf_values": ys,
        "design_bootstrap_old": bootstrap_success_rate(&q),
        "design_bootstrap_accurate": bootstrap_success_rate_accurate(&q),
        "arcs": arcs,
    })
}

fn campaign_g() -> Value {
    let sc = scenario(include_str!(
        "../scenarios/lunar-infrastructure-geodesy-sensitivity.toml"
    ));
    geodesy::campaign_g(
        &sc.orbit.clone().unwrap_or_default(),
        &sc.nominal.clone().unwrap_or_default(),
        &sc.llr.clone().unwrap_or_default(),
        &sc.orbiter.clone().unwrap_or_default(),
        &sc.gravimeter.clone().unwrap_or_default(),
        &sc.clock.clone().unwrap_or_default(),
    )
    .expect("geodesy")
}

fn main() {
    if cfg!(debug_assertions) {
        panic!("use --release");
    }
    let out = std::env::args().nth(1).expect("output path");
    let v = json!({"c": campaign_c(), "q": campaign_q(), "g": campaign_g()});
    std::fs::write(out, serde_json::to_string_pretty(&v).unwrap()).unwrap();
}
