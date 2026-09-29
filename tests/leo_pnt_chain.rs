// SPDX-License-Identifier: AGPL-3.0-only
//! The LEO-PNT stages really pass values to each other.
//!
//! `leo-pnt-chain` runs signal design -> pass -> navigation message -> fused fix -> precise
//! point positioning. These tests check the hand-offs from outside: each handed-on value is
//! the upstream stage's own output, and changing an upstream input moves every downstream
//! figure that depends on it. They also check the leo-pass signal-design wiring on its own
//! and that a leo-pass export reproduces the engine's geometry.

use kshana::api::run_toml;
use serde_json::Value;

const E2E: &str = include_str!("../scenarios/leo-pnt-end-to-end.toml");

fn run(src: &str) -> Value {
    let out = run_toml(src).unwrap_or_else(|e| panic!("run failed: {e}"));
    serde_json::from_str(&out.json).expect("result is JSON")
}

fn f(v: &Value, ptr: &str) -> f64 {
    v.pointer(ptr)
        .and_then(Value::as_f64)
        .unwrap_or_else(|| panic!("{ptr} missing"))
}

fn leo_system(v: &Value) -> Value {
    v["fusion"]["systems"]
        .as_array()
        .unwrap()
        .iter()
        .find(|s| s["role"] == "leo")
        .cloned()
        .expect("a LEO system")
}

fn handoff(v: &Value, target_contains: &str) -> f64 {
    v["handoffs"]
        .as_array()
        .unwrap()
        .iter()
        .find(|h| h["target"].as_str().unwrap().contains(target_contains))
        .and_then(|h| h["value"].as_f64())
        .unwrap_or_else(|| panic!("no hand-off into {target_contains}"))
}

#[test]
fn the_handed_on_values_are_the_stage_outputs() {
    let v = run(E2E);
    let leo = leo_system(&v);
    // SISRE: the message stage's figure is what the positioning stage used.
    let sisre = f(&v, "/navmsg/sisre_rms_m");
    assert!((leo["sisre_m"].as_f64().unwrap() - sisre).abs() < 1e-12);
    assert!((handoff(&v, "sisre_m") - sisre).abs() < 1e-12);
    // It is the representation error and the stated orbit-determination term in RSS.
    let rep = f(&v, "/navmsg/representation_sisre_rms_m");
    let od = f(&v, "/navmsg/od_sisre_m");
    assert!((sisre - (rep * rep + od * od).sqrt()).abs() < 1e-12);
    // C/N0: the positioning stage's end points are the pass's fitted line.
    let (a, b) = (
        f(&v, "/pass/cn0_fit_intercept_dbhz"),
        f(&v, "/pass/cn0_fit_slope_dbhz"),
    );
    let cn0 = leo["cn0_dbhz"].as_array().unwrap();
    assert!((cn0[1].as_f64().unwrap() - (a + b)).abs() < 1e-9);
    assert!((cn0[0].as_f64().unwrap() - (a + b * 10f64.to_radians().sin())).abs() < 1e-9);
    // The pass stage is the stand-alone leo-pass kind on the [pass] table.
    let t: toml::Value = toml::from_str(E2E).unwrap();
    let mut pass = t["pass"].clone();
    pass.as_table_mut()
        .unwrap()
        .insert("kind".into(), toml::Value::String("leo-pass".into()));
    let p = run(&toml::to_string(&pass).unwrap());
    let band = &p["satellites"][0]["bands"][0];
    assert!(
        (band["peak_tracked_cn0_dbhz"].as_f64().unwrap() - f(&v, "/pass/peak_tracked_cn0_dbhz"))
            .abs()
            < 1e-12
    );
    // The chip rate and carrier handed on are the design's.
    assert!((handoff(&v, "chip_rate_hz") - f(&v, "/signal/chip_rate_hz")).abs() < 1e-6);
    assert!((handoff(&v, "carrier_hz") - f(&v, "/signal/centre_hz")).abs() < 1e-6);
}

fn with(src: &str, from: &str, to: &str) -> String {
    assert_eq!(src.matches(from).count(), 1, "{from}");
    src.replace(from, to)
}

#[test]
fn every_upstream_change_moves_the_downstream_figures() {
    let base = run(E2E);
    let sigma = |v: &Value| leo_system(v)["sigma_pr_30deg_m"].as_f64().unwrap();
    let fused = |v: &Value| f(v, "/fusion/fused/rms_error_3d_m");

    // Pass: a stronger EIRP raises the handed-on C/N0 and lowers the LEO pseudorange sigma.
    let hot = run(&with(E2E, "eirp_dbw = 10.0", "eirp_dbw = 20.0"));
    assert!(f(&hot, "/fusion/leo_cn0_zenith_dbhz") > f(&base, "/fusion/leo_cn0_zenith_dbhz") + 9.0);
    assert!(sigma(&hot) < sigma(&base));
    assert!(f(&hot, "/pass/median_code_jitter_m") < f(&base, "/pass/median_code_jitter_m"));

    // Message: without the orbit-determination term, a longer fit interval raises the
    // representation SISRE, and the positioning stage uses the new value.
    let no_od = with(E2E, "od_sisre_m = 0.25", "od_sisre_m = 0.0");
    let short = run(&no_od);
    let long = run(&with(
        &no_od,
        "fit_interval_s = 300.0",
        "fit_interval_s = 900.0",
    ));
    assert!(f(&long, "/navmsg/sisre_rms_m") > f(&short, "/navmsg/sisre_rms_m"));
    assert!(
        (leo_system(&long)["sisre_m"].as_f64().unwrap() - f(&long, "/navmsg/sisre_rms_m")).abs()
            < 1e-12
    );

    // Orbit determination: a larger term raises the SISRE and degrades the fused fix and
    // the LEO-augmented PPP convergence.
    let worse = run(&with(E2E, "od_sisre_m = 0.25", "od_sisre_m = 1.0"));
    assert!(f(&worse, "/navmsg/sisre_rms_m") > f(&base, "/navmsg/sisre_rms_m"));
    assert!(fused(&worse) > fused(&base));
    let conv = |v: &Value| {
        v["ppp"]["cases"]
            .as_array()
            .unwrap()
            .iter()
            .find(|c| c["n_leo"].as_u64().unwrap() > 0)
            .and_then(|c| c["median_convergence_min"].as_f64())
    };
    match (conv(&worse), conv(&base)) {
        (Some(w), Some(b)) => assert!(w >= b, "{w} {b}"),
        (None, Some(_)) => {}
        other => panic!("unexpected PPP convergence {other:?}"),
    }
}

#[test]
fn a_band_design_splits_the_eirp_and_reports_the_design_jitter() {
    let src = r#"
kind = "leo-pass"
duration_s = 900.0
step_s = 10.0
[user]
lat_deg = 45.0
lon_deg = 5.0
[[satellite]]
id = "S1"
system = "none"
altitude_km = 1080.0
inclination_deg = 53.0
max_elevation_deg = 70.0
tca_s = 450.0
[[satellite.band]]
name = "X5"
signal = "xona-x5"
eirp_dbw = 15.0
[gnss]
enabled = false
"#;
    let v = run(src);
    let band = &v["satellites"][0]["bands"][0];
    let d = &band["signal_design"];
    let design = kshana::leo_signal::public_signal("xona-x5").unwrap();
    // The band took the design's carrier, bandwidth and tracked chip rate.
    assert!((band["frequency_hz"].as_f64().unwrap() - design.centre_hz).abs() < 1e-3);
    assert!((band["bandwidth_hz"].as_f64().unwrap() - design.tx_bandwidth_hz).abs() < 1e-3);
    assert!((band["chip_rate_hz"].as_f64().unwrap() - 10.23e6).abs() < 1e-3);
    // The component EIRPs add back to the band EIRP.
    let total: f64 = d["eirp_split"]
        .as_array()
        .unwrap()
        .iter()
        .map(|c| 10f64.powf(c["eirp_dbw"].as_f64().unwrap() / 10.0))
        .sum();
    assert!((10.0 * total.log10() - 15.0).abs() < 1e-9);
    // Each epoch's tracked C/N0 and jitter are the leo-signal formula at the band C/N0.
    let i = design.tracked_index().unwrap();
    let eta = design.in_band_fraction();
    for e in v["satellites"][0]["series"].as_array().unwrap() {
        if !e["visible"].as_bool().unwrap() {
            continue;
        }
        let b = &e["bands"][0];
        let cn0 = b["cn0_dbhz"].as_f64().unwrap();
        let tracked = cn0 + design.component_cn0_offset_db(i, eta);
        assert!((b["tracked_cn0_dbhz"].as_f64().unwrap() - tracked).abs() < 1e-9);
        let j = kshana::leo_signal::code_jitter_m(
            &design,
            i,
            eta,
            cn0,
            0.5,
            1.0,
            0.02,
            kshana::navsignal::EarlyLate::Coherent,
        )
        .unwrap();
        assert!((b["code_jitter_m"].as_f64().unwrap() - j).abs() < 1e-12);
    }
    // A band without a design reports neither field.
    let plain = run(&src.replace("signal = \"xona-x5\"\n", "frequency_mhz = 1190.0\n"));
    assert!(plain["satellites"][0]["bands"][0]
        .get("signal_design")
        .is_none());
}

#[test]
fn the_pass_export_reproduces_the_engine_range() {
    let src = include_str!("../scenarios/leo-pass-xona-pulsar.toml");
    let v = run(src);
    let files = kshana::interop::export(src, kshana::interop::Format::GeoJson).expect("export");
    let g: Value = serde_json::from_slice(&files[0].bytes).unwrap();
    let feat = |name: &str| -> Vec<Vec<f64>> {
        g["features"]
            .as_array()
            .unwrap()
            .iter()
            .find(|x| x["properties"]["name"] == name)
            .unwrap()["geometry"]["coordinates"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| {
                c.as_array()
                    .unwrap()
                    .iter()
                    .map(|x| x.as_f64().unwrap())
                    .collect()
            })
            .collect()
    };
    let ecef = |c: &[f64]| {
        kshana::frames::geodetic_to_ecef(kshana::frames::Geodetic {
            lat_rad: c[1].to_radians(),
            lon_rad: c[0].to_radians(),
            alt_m: c[2],
        })
    };
    let (user, sat) = (feat("user"), feat("Pulsar-pass"));
    let series = v["satellites"][0]["series"].as_array().unwrap();
    assert_eq!(series.len(), sat.len());
    let mut worst: f64 = 0.0;
    for (k, e) in series.iter().enumerate() {
        let (u, s) = (ecef(&user[k]), ecef(&sat[k]));
        let r = ((s[0] - u[0]).powi(2) + (s[1] - u[1]).powi(2) + (s[2] - u[2]).powi(2)).sqrt();
        worst = worst.max((r - e["range_m"].as_f64().unwrap()).abs());
    }
    // Coordinates are written to 1e-9 deg and 0.1 mm: a few millimetres at most.
    assert!(
        worst < 0.01,
        "exported geometry misses the engine range by {worst} m"
    );
}

#[test]
fn the_celeste_chain_runs_when_the_preset_is_present() {
    let p = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("scenarios/celeste-iod-end-to-end.toml");
    let Ok(src) = std::fs::read_to_string(&p) else {
        eprintln!("the Celeste IOD preset is withheld: nothing to check");
        return;
    };
    // The calibration target is stated in the withholdable scenario itself, so this file
    // carries no workshop-derived number.
    let target: f64 = src
        .lines()
        .find_map(|l| l.strip_prefix("# calibrated_peak_cn0_dbhz = "))
        .and_then(|r| r.split_whitespace().next())
        .and_then(|x| x.parse().ok())
        .expect("the scenario states its calibrated peak C/N0");
    let v = run(&src);
    // The pass reproduces the peak total C/N0 the preset was calibrated to.
    assert!((f(&v, "/pass/peak_cn0_dbhz") - target).abs() < 0.5);
    assert!(f(&v, "/navmsg/sisre_rms_m") > 0.0);
}
