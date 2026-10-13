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
    let zero = doc(&format!("{SMALL}orbit_err_growth_m_per_s = 0.0\n"));
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

// ── LRS-02: multipath and receiver hardware ───────────────────────────────────

#[test]
fn receiver_absent_or_silent_is_the_plain_run() {
    let flat = doc(SMALL);
    assert!(flat["inputs_echo"].get("receiver").is_none());
    let silent = doc(&format!(
        "{SMALL}[receiver]\nmultipath_a_m = 0.0\nmultipath_b_m = 0.0\n"
    ));
    assert!(silent["note"].as_str().unwrap().contains("Receiver:"));
    for k in [
        "region",
        "points",
        "coverage_radius_km",
        "budget_at_station_and_at_edge",
    ] {
        assert_eq!(silent[k], flat[k], "{k} moved with a silent receiver");
    }
    let noisy = doc(&format!(
        "{SMALL}[receiver]\ncn0_dbhz = 35.0\ninter_channel_bias_sigma_m = 0.5\n"
    ));
    let p = |v: &Value| v["region"]["corrected_p_3d_m"].as_f64().unwrap();
    assert!(p(&noisy) > p(&flat));
    assert!(toml::from_str::<LunarStationCoverageScenario>(&format!(
        "{SMALL}[receiver]\nbogus = 1\n"
    ))
    .is_err());
}

const ZERO_BASELINE: &str = r#"
kind = "lunar-station-coverage"
points = [ { lat_deg = -89.0, lon_deg = 0.0 } ]
station_lat_deg = -89.0
survey_sigma_m = 0.0
orbit_err_m = 0.0
clock_err_m = 30.0
noise_m = 0.0
quantization_bits = 0
latency_s = 0.0
t_span_s = 0.0
n_trials = 400
"#;

/// At zero baseline with every other term off, the corrected range error is the user's
/// multipath minus the station's: two independent draws of 1-sigma `a` (with `b = 0`), so its
/// sample sigma is `sqrt(2) a`.
#[test]
fn zero_baseline_multipath_is_the_difference_of_two_receivers() {
    let s = scn(&format!(
        "{ZERO_BASELINE}[receiver]\nmultipath_a_m = 0.5\nmultipath_b_m = 0.0\n"
    ));
    let mut d = Vec::new();
    for k in 0..400 {
        let c = s.trace_case(0, 0, k).unwrap();
        let e = c.eval.expect("available");
        assert_eq!(e.receiver_user_m.len(), e.corrected_range_m.len());
        d.extend(e.corrected_range_m);
    }
    let n = d.len() as f64;
    let sd = (d.iter().map(|v| v * v).sum::<f64>() / n).sqrt();
    let want = 2f64.sqrt() * 0.5;
    assert!(
        (sd / want - 1.0).abs() < 0.06,
        "sigma {sd} vs {want} over {n}"
    );
}

/// The station multipath is first-order Gauss-Markov over epochs: lag-1 correlation
/// exp(-dt / tau), unit variance.
#[test]
fn station_multipath_is_gauss_markov() {
    let s = scn(&format!(
        "{SMALL}n_trials = 300\nt_span_s = 86400.0\nt_step_s = 600.0\n[receiver]\nstation_multipath_tau_s = 1200.0\n"
    )
    .replace("n_trials = 8\n", "")
    .replace("t_span_s = 21600.0\nt_step_s = 3600.0\n", ""));
    let u = s.station_mp_units(144, 8).expect("series");
    let (mut sxy, mut sxx, mut n) = (0.0, 0.0, 0.0);
    for pair in u.windows(2) {
        for (now, next) in pair[0].iter().zip(&pair[1]) {
            for (a, b) in now.iter().zip(next) {
                sxy += a * b;
                sxx += a * a;
                n += 1.0;
            }
        }
    }
    let rho = sxy / sxx;
    let want = (-600.0f64 / 1200.0).exp();
    assert!((rho - want).abs() < 0.01, "lag-1 {rho} vs {want}");
    assert!((sxx / n - 1.0).abs() < 0.02, "variance {}", sxx / n);
    let white = scn(&format!("{SMALL}[receiver]\n"))
        .station_mp_units(6, 8)
        .unwrap();
    assert_eq!(white.len(), 6);
}

/// Inter-channel biases are one constant per channel per trial: with only them on, the user's
/// receiver error on a satellite is the same at every epoch of a trial.
#[test]
fn inter_channel_biases_are_constant_over_a_trial() {
    let s = scn(&format!(
        "{ZERO_BASELINE}[receiver]\nmultipath_a_m = 0.0\nmultipath_b_m = 0.0\ninter_channel_bias_sigma_m = 0.4\n"
    )
    .replace("t_span_s = 0.0\n", "t_span_s = 7200.0\nt_step_s = 3600.0\n"));
    let a = s.trace_case(0, 0, 3).unwrap();
    let b = s.trace_case(0, 1, 3).unwrap();
    let (ea, eb) = (a.eval.unwrap(), b.eval.unwrap());
    let mut common = 0;
    for (ia, sa) in a.used.iter().enumerate() {
        if let Some(ib) = b.used.iter().position(|x| x == sa) {
            assert_eq!(ea.receiver_user_m[ia], eb.receiver_user_m[ib]);
            common += 1;
        }
    }
    assert!(common >= 4);
    assert!(ea.receiver_user_m.iter().any(|v| *v != 0.0));
}

// ── LRS-06: solution modes ────────────────────────────────────────────────────

const SV6: &str = r#"
kind = "lunar-station-coverage"
points = [
  { lat_deg = -89.0, lon_deg = 0.0 },
  { lat_deg = -86.0, lon_deg = 180.0 },
  { lat_deg = -82.0, lon_deg = 270.0 },
]
n_sats = 4
t_span_s = 43200.0
t_step_s = 1800.0
n_trials = 16
"#;

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs().max(1e-12)
}

/// A `[solution]` section at its defaults (one epoch, no height row, four satellites) is the
/// snapshot solve, by a different solver: every figure agrees to 1e-6 relative.
#[test]
fn the_default_solution_mode_is_the_snapshot_solve() {
    let flat = doc(SV6);
    let sol = doc(&format!("{SV6}[solution]\n"));
    assert!(sol["note"].as_str().unwrap().contains("Solution:"));
    for (a, b) in flat["points"]
        .as_array()
        .unwrap()
        .iter()
        .zip(sol["points"].as_array().unwrap())
    {
        assert_eq!(a["availability"], b["availability"]);
        for k in [
            "corrected_p_3d_m",
            "corrected_p_h_m",
            "corrected_p_v_m",
            "uncorrected_p_3d_m",
        ] {
            if let (Some(x), Some(y)) = (a[k].as_f64(), b[k].as_f64()) {
                assert!(rel(y, x) < 1e-6, "{k}: {y} vs {x}");
            } else {
                assert_eq!(a[k], b[k]);
            }
        }
    }
}

/// The height row with a three-satellite minimum can only add available epochs, and a window
/// over independent epochs averages the error down.
#[test]
fn height_aiding_and_a_window_do_what_they_say() {
    let flat = doc(SV6);
    let h3 = doc(&format!(
        "{SV6}[solution]\nheight_aided = true\nmin_satellites = 3\nheight_sigma_m = 1.0\n"
    ));
    let av = |v: &Value| v["region"]["availability"].as_f64().unwrap();
    // Four satellites: epochs with three in common view become available with the height row.
    assert!(av(&h3) > av(&flat), "{} vs {}", av(&h3), av(&flat));
    // The window needs consecutive available epochs: the eight-satellite default gives them
    // (with four, available epochs are hours apart and a window holds one).
    let eight = SV6.replace("n_sats = 4\n", "");
    let w1 = doc(&format!("{eight}[solution]\n"));
    let w6 = doc(&format!("{eight}[solution]\nwindow_epochs = 6\n"));
    let p = |v: &Value| v["region"]["corrected_p_3d_m"].as_f64().unwrap();
    assert!(p(&w6) < p(&w1), "window 6 {} vs 1 {}", p(&w6), p(&w1));
    assert!(scn(&format!("{SV6}[solution]\nmin_satellites = 3\n"))
        .run()
        .is_err());
}
