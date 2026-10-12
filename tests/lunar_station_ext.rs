// SPDX-License-Identifier: AGPL-3.0-only
//! The lunar reference-station extensions (LRS-02, LRS-03, LRS-06), each opt-in.
//!
//! LRS-03, ephemeris-error growth over the correction latency (`orbit_err_growth_m_per_s`):
//! * absent, the document is unchanged (the frozen prediction and goldens pin that byte for
//!   byte); set to zero, every figure equals the frozen-error run;
//! * the growth draws are on their own stream, so switching them on changes the link error by
//!   exactly a Gaussian of 1-sigma `rate tau / sqrt(3)`, checked statistically;
//! * linear growth is the first-order behaviour of a propagated state error at the scenario
//!   orbit: a velocity error `dv` moves the position by `dv tau` to better than 1 % over 600 s
//!   (two-body propagation, the in-tree integrator).

use kshana::lunar_station::{orbit_growth_range_sigma_m, LunarStationCoverageScenario};
use serde_json::Value;

const SMALL: &str = r#"
kind = "lunar-station-coverage"
points = [
  { lat_deg = -89.0, lon_deg = 0.0 },
  { lat_deg = -88.0, lon_deg = 90.0 },
  { lat_deg = -86.0, lon_deg = 180.0 },
]
t_span_s = 21600.0
t_step_s = 3600.0
n_trials = 8
latency_s = 600.0
"#;

fn scn(src: &str) -> LunarStationCoverageScenario {
    toml::from_str(src).expect("parses")
}

fn doc(src: &str) -> Value {
    serde_json::to_value(scn(src).run().expect("runs")).unwrap()
}

#[test]
fn growth_absent_or_zero_is_the_frozen_error_run() {
    let flat = doc(SMALL);
    assert!(flat["inputs_echo"]
        .get("orbit_err_growth_m_per_s")
        .is_none());
    assert_eq!(flat["note"], kshana::lunar_station::NOTE);
    let mut zero = doc(&format!("{SMALL}orbit_err_growth_m_per_s = 0.0\n"));
    assert_eq!(zero["inputs_echo"]["orbit_err_growth_m_per_s"], 0.0);
    assert!(zero["note"]
        .as_str()
        .unwrap()
        .contains("Ephemeris-error growth"));
    for k in [
        "region",
        "points",
        "coverage_radius_km",
        "budget_at_station_and_at_edge",
    ] {
        assert_eq!(zero[k], flat[k], "{k} moved with a zero growth rate");
    }
    let grown = doc(&format!("{SMALL}orbit_err_growth_m_per_s = 0.05\n"));
    let p = |v: &Value| v["region"]["corrected_p_3d_m"].as_f64().unwrap();
    assert!(p(&grown) > p(&flat), "growth must add error");
    assert!(scn(&format!("{SMALL}orbit_err_growth_m_per_s = -1.0\n"))
        .run()
        .is_err());
}

/// At zero baseline with no survey, noise, orbit error or quantization, the corrected range
/// error is minus the link error, so the growth-on minus growth-off difference is exactly the
/// growth draws: zero-mean Gaussian of 1-sigma `rate tau / sqrt(3)`.
#[test]
fn the_growth_term_has_the_closed_form_sigma() {
    let base = r#"
kind = "lunar-station-coverage"
points = [ { lat_deg = -89.0, lon_deg = 0.0 } ]
station_lat_deg = -89.0
survey_sigma_m = 0.0
orbit_err_m = 0.0
clock_err_m = 30.0
noise_m = 0.0
quantization_bits = 0
latency_s = 600.0
t_span_s = 0.0
n_trials = 400
"#;
    let rate = 0.02;
    let off = scn(base);
    let on = scn(&format!("{base}orbit_err_growth_m_per_s = {rate}\n"));
    let mut d = Vec::new();
    for k in 0..400 {
        let a = off.trace_case(0, 0, k).unwrap();
        let b = on.trace_case(0, 0, k).unwrap();
        let (ea, eb) = (a.eval.expect("available"), b.eval.expect("available"));
        for (x, y) in ea.corrected_range_m.iter().zip(&eb.corrected_range_m) {
            d.push(y - x);
        }
    }
    let n = d.len() as f64;
    let mean = d.iter().sum::<f64>() / n;
    let sd = (d.iter().map(|v| (v - mean) * (v - mean)).sum::<f64>() / (n - 1.0)).sqrt();
    let want = orbit_growth_range_sigma_m(rate, 600.0);
    assert!((want - 6.928_203).abs() < 1e-5);
    // n is at least 1600; the standard error of a sample sigma is sigma / sqrt(2 n) < 2 %.
    assert!(
        (sd / want - 1.0).abs() < 0.06,
        "sample sigma {sd} vs {want} over {n}"
    );
    assert!(mean.abs() < 4.0 * want / n.sqrt(), "mean {mean}");
}

/// Linear growth is the first-order term: a velocity error dv, propagated with the two-body
/// model from the scenario orbit, moves the position by dv tau to better than 1 % at 600 s.
#[test]
fn linear_growth_is_the_first_order_propagated_error() {
    use kshana::lunar_perturbed::{
        default_tolerance, elements_to_state, propagate, LunarPerturbations, LunarState,
    };
    let s0 = elements_to_state(9_737_400.0, 0.6, 57.7, 0.0, 90.0, 0.0);
    let model = LunarPerturbations::two_body();
    let tol = default_tolerance();
    let dv = 0.05;
    for &tau in &[60.0, 600.0] {
        let a = propagate(&s0, tau, &model, &tol);
        for axis in 0..3 {
            let mut v = s0.v;
            v[axis] += dv;
            let b = propagate(&LunarState { r: s0.r, v }, tau, &model, &tol);
            let dr =
                ((b.r[0] - a.r[0]).powi(2) + (b.r[1] - a.r[1]).powi(2) + (b.r[2] - a.r[2]).powi(2))
                    .sqrt();
            let rel = (dr / (dv * tau) - 1.0).abs();
            assert!(
                rel < 0.01,
                "tau {tau} axis {axis}: |dr| {dr} vs dv tau {}",
                dv * tau
            );
        }
    }
}
