// SPDX-License-Identifier: AGPL-3.0-only
//! The optical-atmosphere time series: bars T1-T6 of `xval/optical-atmosphere/PREREGISTRATION-timeseries.md`,
//! fixed before the first run. These are self-consistency and determinism checks of one seeded realisation
//! against the statistical output of the same model; they are not an external oracle, and no row is VALIDATED.

use serde_json::Value;

fn run(extra: &str) -> Value {
    let src = std::fs::read_to_string("scenarios/optical-atmosphere-network.toml").unwrap();
    // the bundled scenario carries its own [timeseries]; strip it so each case states its own
    let base: String = src.split("\n[timeseries]").next().unwrap().to_string();
    let out = kshana::api::run_toml(&format!("{base}\n{extra}")).expect("runs");
    serde_json::from_str(&out.json).unwrap()
}
fn ts(extra: &str) -> String {
    format!("[timeseries]\n{extra}\n")
}

#[test]
fn t1_same_seed_same_bytes_other_seed_other_bytes() {
    let a = run(&ts("duration_h = 72.0\nstep_s = 600.0\nseed = 5")).to_string();
    let b = run(&ts("duration_h = 72.0\nstep_s = 600.0\nseed = 5")).to_string();
    let c = run(&ts("duration_h = 72.0\nstep_s = 600.0\nseed = 6")).to_string();
    assert_eq!(a, b);
    assert_ne!(a, c);
}

#[test]
fn t2_without_the_table_there_is_no_timeseries_key() {
    let j = run("");
    for s in j["sites"].as_array().unwrap() {
        assert!(s.get("timeseries").is_none());
    }
    assert!(
        !j.to_string().contains("timeseries"),
        "neither the series nor its units are written"
    );
}

fn series_f64(s: &Value, k: &str) -> Vec<f64> {
    s["timeseries"][k]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_f64().unwrap())
        .collect()
}

#[test]
fn t3_t4_a_year_long_draw_is_consistent_with_the_stated_availability_and_cloud_fraction() {
    for seed in [37u64, 38] {
        let j = run(&ts(&format!(
            "duration_h = 8760.0\nstep_s = 600.0\nseed = {seed}"
        )));
        for s in j["sites"].as_array().unwrap() {
            let stated = s["availability_pct"].as_f64().unwrap();
            let real = s["timeseries"]["realised"]["availability_pct"]
                .as_f64()
                .unwrap();
            assert!(
                (real - stated).abs() <= 6.0,
                "seed {seed} {}: realised {real:.2} vs stated {stated:.2}",
                s["name"]
            );
            let p = 100.0 * s["p_cloud"].as_f64().unwrap();
            let cf = s["timeseries"]["realised"]["cloud_fraction_pct"]
                .as_f64()
                .unwrap();
            assert!(
                (cf - p).abs() <= 5.0,
                "seed {seed} {}: cloud {cf:.2} vs p_cloud {p:.2}",
                s["name"]
            );
        }
    }
}

#[test]
fn t5_definitions_hold_at_every_step() {
    let j = run(&ts("duration_h = 240.0\nstep_s = 300.0\nseed = 9"));
    for s in j["sites"].as_array().unwrap() {
        let budget = s["fade_budget_db"].as_f64().unwrap();
        let (m, c, sc, up) = (
            series_f64(s, "margin_db"),
            series_f64(s, "cloud_db"),
            series_f64(s, "scint_db"),
            series_f64(s, "up"),
        );
        assert_eq!(m.len(), s["timeseries"]["steps"].as_u64().unwrap() as usize);
        for k in 0..m.len() {
            assert!(m[k].is_finite() && c[k].is_finite() && sc[k].is_finite());
            // each value is rounded to 0.001 dB, so the identity holds to that
            assert!((m[k] - (budget - c[k] - sc[k])).abs() <= 0.0021, "step {k}");
            // pointing availability is 1 in the bundled sites, so up is exactly margin >= 0
            assert_eq!(
                up[k] == 1.0,
                m[k] >= -0.0006 && (m[k] >= 0.0 || m[k].abs() < 0.0006),
                "step {k}: margin {}",
                m[k]
            );
        }
    }
}

#[test]
fn t6_the_module_draws_only_through_the_portable_routes() {
    let src = std::fs::read_to_string("src/optical_timeseries.rs").unwrap();
    let code: String = src
        .lines()
        .filter(|l| !l.trim_start().starts_with("//"))
        .collect::<Vec<_>>()
        .join("\n");
    for banned in [
        ".ln(",
        ".exp(",
        ".log10(",
        ".powf(",
        ".sqrt(",
        ".sin(",
        ".cos(",
        "rand_distr::",
        "thread_rng",
    ] {
        assert!(!code.contains(banned), "uses {banned}");
    }
    assert!(code.contains("crate::portable_distr") && code.contains("PortableFloat"));
}

#[test]
fn a_run_too_long_or_with_a_bad_step_is_refused_with_a_reason() {
    let src = std::fs::read_to_string("scenarios/optical-atmosphere-network.toml").unwrap();
    let base = src.split("\n[timeseries]").next().unwrap().to_string();
    for (extra, why) in [
        ("[timeseries]\nduration_h = 9000.0\n", "at most 8760"),
        (
            "[timeseries]\nduration_h = 8760.0\nstep_s = 1.0\n",
            "steps is above",
        ),
        ("[timeseries]\nstep_s = 0.0\n", "step_s must be"),
    ] {
        let e = kshana::api::run_toml(&format!("{base}\n{extra}")).expect_err("refused");
        assert!(e.to_string().contains(why), "{extra}: {e}");
    }
}
