// SPDX-License-Identifier: Apache-2.0
//! Operating-envelope coverage matrix.
//!
//! Each pack is exercised across ≥5 parameter variants spanning its stated
//! operating envelope, asserting every numeric output is finite (no NaN/Inf) and
//! bounded. This closes the "broad in breadth but one example point per domain"
//! gap: the envelope, not a single nominal scenario, is what is tested. The same
//! file also confirms (a) the flicker-FM noise term actually degrades a clock FoM
//! when enabled, and (b) the fusion filter still converges with a realistic
//! non-zero accelerometer bias, not only when biases are zeroed.

use kshana::api::run_toml;
use serde_json::Value;

/// Recursively assert every number in a JSON document is finite and within
/// `±max_abs` (a generous physical bound, not a tight spec).
fn assert_finite_bounded(v: &Value, max_abs: f64, path: &str) {
    match v {
        Value::Number(n) => {
            let x = n.as_f64().unwrap_or(f64::NAN);
            assert!(x.is_finite(), "non-finite value at {path}: {x}");
            assert!(x.abs() <= max_abs, "value at {path} out of bounds: {x}");
        }
        Value::Array(a) => {
            for (i, e) in a.iter().enumerate() {
                assert_finite_bounded(e, max_abs, &format!("{path}[{i}]"));
            }
        }
        Value::Object(o) => {
            for (k, e) in o {
                assert_finite_bounded(e, max_abs, &format!("{path}.{k}"));
            }
        }
        _ => {}
    }
}

/// Run a TOML template with `{V}` replaced by each value, asserting each variant
/// runs and produces finite, bounded output.
fn sweep(label: &str, template: &str, values: &[&str], max_abs: f64) {
    assert!(values.len() >= 5, "{label}: need ≥5 envelope variants");
    for v in values {
        let src = template.replace("{V}", v);
        let out = run_toml(&src).unwrap_or_else(|e| panic!("{label} variant {v} failed: {e}"));
        let json: Value = serde_json::from_str(&out.json)
            .unwrap_or_else(|e| panic!("{label} variant {v} bad JSON: {e}"));
        assert_finite_bounded(&json, max_abs, &format!("{label}[{v}]"));
        assert!(!out.summary.is_empty());
    }
}

const CLOCK: &str = r#"
seed = 3
threshold_ns = {V}
[time]
step_s = 10.0
duration_s = 3600.0
[gnss]
windows = [ { t0 = 0.0, t1 = 600.0, state = "nominal" }, { t0 = 600.0, t1 = 3600.0, state = "denied" } ]
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-15
q_wf = 1.0e-28
q_rw = 0.0
drift = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 1.0e-28
drift = 0.0
"#;

const INERTIAL: &str = r#"
kind = "inertial"
seed = 7
threshold_m = 100.0
[time]
step_s = 10.0
duration_s = 3600.0
[gnss]
windows = [ { t0 = 0.0, t1 = 600.0, state = "nominal" }, { t0 = 600.0, t1 = 3600.0, state = "denied" } ]
[accel_quantum]
id = "q"
provenance = "test"
bias = {V}
q_va = 4.0e-8
[accel_classical]
id = "c"
provenance = "test"
bias = {V}
q_va = 4.0e-8
"#;

const ORBIT: &str = r#"
kind = "orbit"
seed = 1
threshold_ns = 10.0
mask_deg = {V}
sigma_uere_m = 1.0
[time]
step_s = 300.0
duration_s = 21600.0
[user]
altitude_km = 500.0
inclination_deg = 51.6
u0_deg = 0.0
[constellation]
altitude_km = 20200.0
inclination_deg = 55.0
planes = 6
sats_per_plane = 4
phasing_f = 1.0
[clock_quantum]
id = "q"
provenance = "test"
y0 = 1.0e-15
q_wf = 1.0e-30
q_rw = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 1.0e-11
q_wf = 9.0e-20
q_rw = 1.0e-28
"#;

const SPOOF: &str = r#"
kind = "spoof"
threshold_ns = 20.0
[time]
step_s = 10.0
duration_s = 1200.0
[attack]
start_s = 100.0
rate_ns_per_s = {V}
mc_runs = 2000
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0
drift = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
"#;

const HYBRID: &str = r#"
kind = "hybrid"
seed = 42
timing_spec_ns = 20.0
position_spec_m = {V}
[time]
step_s = 20.0
duration_s = 3600.0
[gnss]
windows = [ { t0 = 0.0, t1 = 600.0, state = "nominal" }, { t0 = 600.0, t1 = 3600.0, state = "denied" } ]
[resync]
enabled = true
interval_s = 60.0
sigma_j_s = 1.0e-12
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0
drift = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
[accel_quantum]
id = "q"
provenance = "test"
bias = 5.88e-7
q_va = 4.6656e-8
[accel_classical]
id = "c"
provenance = "test"
bias = 1.57e-3
q_va = 3.8416e-8
"#;

#[test]
fn clock_pack_covers_the_spec_threshold_envelope() {
    // Timing spec from 1 ns to 500 ns.
    sweep(
        "clock",
        CLOCK,
        &["1.0", "5.0", "20.0", "100.0", "500.0"],
        1e12,
    );
}

#[test]
fn inertial_pack_covers_the_accel_bias_envelope() {
    // Accelerometer bias from cold-atom (1e-7) to crude MEMS (1e-2) m/s².
    sweep(
        "inertial",
        INERTIAL,
        &["1.0e-7", "1.0e-5", "5.0e-4", "1.0e-3", "1.0e-2"],
        1e9,
    );
}

#[test]
fn orbit_pack_covers_the_elevation_mask_envelope() {
    // Elevation mask from 5° to 30°.
    sweep(
        "orbit",
        ORBIT,
        &["5.0", "10.0", "15.0", "25.0", "30.0"],
        1e9,
    );
}

#[test]
fn spoof_pack_covers_the_attack_rate_envelope() {
    // Spoof ramp rate from 0.1 to 50 ns/s.
    sweep("spoof", SPOOF, &["0.1", "0.5", "2.0", "10.0", "50.0"], 1e12);
}

#[test]
fn hybrid_pack_covers_the_position_spec_envelope() {
    // Position spec from 10 m to 1000 m.
    sweep(
        "hybrid",
        HYBRID,
        &["10.0", "50.0", "100.0", "500.0", "1000.0"],
        1e12,
    );
}

#[test]
fn real_gps_constellation_scenario_loads_with_valid_checksums_and_bounded_output() {
    // The shipped scenario embeds a real Celestrak gps-ops snapshot and requires
    // valid TLE checksums (strict_checksum = true), so it only runs if every line
    // of the real constellation is intact.
    let src = include_str!("../scenarios/orbit-sgp4-gps.toml");
    let out = run_toml(src).expect("real GPS constellation scenario runs");
    let json: Value = serde_json::from_str(&out.json).unwrap();
    assert_finite_bounded(&json, 1e9, "orbit-sgp4-gps");
    // A real MEO GPS constellation seen from LEO keeps many satellites in view.
    assert!(out.summary.contains("GNSS-nominal"));
}

#[test]
fn flicker_fm_floor_degrades_the_clock_holdover_when_enabled() {
    // The flicker-FM (1/f) Allan floor is off by default; enabling it must measurably
    // worsen the clock's coast — its 95th-percentile timing error over the outage
    // grows (a higher noise floor → a less stable coast). Compare a quiet clock with
    // the floor off vs a sizable floor on, all else equal.
    let base = |flicker: f64| {
        format!(
            r#"
seed = 5
threshold_ns = 50.0
[time]
step_s = 10.0
duration_s = 3600.0
[gnss]
windows = [ {{ t0 = 0.0, t1 = 600.0, state = "nominal" }}, {{ t0 = 600.0, t1 = 3600.0, state = "denied" }} ]
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-15
q_wf = 1.0e-26
q_rw = 0.0
drift = 0.0
flicker_floor = {flicker}
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 1.0e-28
drift = 0.0
"#
        )
    };
    let read_timing_p95 = |flicker: f64| -> f64 {
        let out = run_toml(&base(flicker)).unwrap();
        let j: Value = serde_json::from_str(&out.json).unwrap();
        j["quantum"]["fom"]["timing_p95_ns"].as_f64().unwrap()
    };
    let off = read_timing_p95(0.0);
    let on = read_timing_p95(1.0e-12);
    assert!(
        on > off,
        "enabling the flicker floor should worsen the timing coast: off={off} on={on}"
    );
}

#[test]
fn fusion_filter_converges_with_a_realistic_non_zero_bias() {
    // The shipped fusion scenario zeros the accelerometer bias "for filter
    // consistency". Realism check: with a realistic cold-atom-grade bias the joint
    // filter must still converge — its position error stays finite and within 3× the
    // zero-bias case over the same outage.
    let fusion = |bias: f64| {
        format!(
            r#"
kind = "fusion"
seed = 42
timing_spec_ns = 20.0
position_spec_m = 100.0
[time]
step_s = 10.0
duration_s = 3600.0
[gnss]
windows = [ {{ t0 = 0.0, t1 = 600.0, state = "nominal" }}, {{ t0 = 600.0, t1 = 3600.0, state = "denied" }} ]
[resync]
enabled = true
interval_s = 1800.0
sigma_j_s = 1.0e-12
[clock_quantum]
id = "q"
provenance = "test"
y0 = 5.0e-17
q_wf = 1.0e-30
q_rw = 0.0
drift = 0.0
[clock_classical]
id = "c"
provenance = "test"
y0 = 5.0e-10
q_wf = 9.0e-20
q_rw = 0.0
drift = 0.0
[accel_quantum]
id = "q"
provenance = "test"
bias = {bias}
q_va = 1.0e-9
[accel_classical]
id = "c"
provenance = "test"
bias = {bias}
q_va = 1.0e-7
"#
        )
    };
    let position_p95 = |bias: f64| -> f64 {
        let out = run_toml(&fusion(bias)).unwrap();
        let j: Value = serde_json::from_str(&out.json).unwrap();
        // The fusion result reports the quantum suite's position p95 over the outage.
        j["quantum"]["fom"]["position_p95_m"].as_f64().unwrap()
    };
    let zero = position_p95(0.0);
    let biased = position_p95(5.88e-7); // cold-atom-grade residual bias
    assert!(
        biased.is_finite() && biased > 0.0,
        "biased run diverged: {biased}"
    );
    assert!(
        biased <= 3.0 * zero.max(1e-6),
        "non-zero bias should converge within 3× zero-bias: zero={zero} biased={biased}"
    );
}
