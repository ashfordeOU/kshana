//! The bundled LEO fusion scenarios run through the public dispatcher, describe every number
//! they emit, repeat bit for bit, and show the behaviour each one exists to show.
//!
//! None of them needs the workshop-derived preset: every scenario here except
//! `celeste-iod-fused-pvt` uses public presets or inline parameters only (a source-text test
//! in `leo_fusion::presets` enforces that no other file names it).

use serde_json::Value;

fn run(name: &str) -> Value {
    let src = std::fs::read_to_string(format!("scenarios/{name}.toml")).unwrap();
    let a = kshana::api::run_toml(&src).unwrap_or_else(|e| panic!("{name}: {e}"));
    let b = kshana::api::run_toml(&src).unwrap();
    assert_eq!(a.json, b.json, "{name}: two runs differ");
    let doc: Value = serde_json::from_str(&a.json).unwrap();
    let audit = kshana::field_schema::audit_document(&doc);
    assert!(
        audit.is_complete(),
        "{name}: missing {:?} malformed {:?}",
        audit.missing,
        audit.malformed
    );
    assert!(a.svg.starts_with("<svg") && a.svg.ends_with("</svg>"));
    doc
}

fn f(v: &Value) -> f64 {
    v.as_f64().unwrap_or_else(|| panic!("not a number: {v}"))
}

#[test]
fn leo_doppler_positioning_forms_a_fix_and_the_cross_track_error_explodes_overhead() {
    let d = run("leo-doppler-positioning");
    let dop = &d["doppler"];
    assert!(f(&dop["error_3d_m"]) < 20.0);
    let rows = dop["single_pass"].as_array().unwrap();
    let first = f(&rows[0]["sigma_cross_m"]);
    let mid = f(&rows[2]["sigma_cross_m"]);
    assert!(
        first > 3.0 * mid,
        "cross-track sigma overhead {first} vs 250 km {mid}"
    );
}

#[test]
fn starlink_doppler_only_mode_runs_without_ranging() {
    let d = run("starlink-sop-doppler-positioning");
    assert_eq!(d["systems"][0]["doppler_only"], true);
    assert!(d["systems"][0]["sigma_pr_30deg_m"].is_null());
    let w = d["doppler"]["windows"].as_array().unwrap();
    let e_last = f(&w.last().unwrap()["error_3d_m"]);
    let e_first = f(&w[0]["error_3d_m"]);
    assert!(e_last < e_first, "{e_first} -> {e_last}");
}

#[test]
fn meo_leo_fusion_beats_gnss_alone_and_recovers_the_leo_bias() {
    let d = run("meo-leo-fused-pvt");
    let j = &d["joint"];
    assert!(f(&j["fused"]["median_pdop"]) < f(&j["gnss"]["median_pdop"]));
    assert!(f(&j["fused"]["rms_error_3d_m"]) < f(&j["gnss"]["rms_error_3d_m"]));
    let isb = j["isb_estimates"]
        .as_array()
        .unwrap()
        .iter()
        .find(|x| x[0] == "Pulsar X5")
        .map(|x| f(&x[1]))
        .unwrap();
    // 40 ns is 11.99 m.
    assert!((isb - 11.99).abs() < 1.0, "{isb}");
}

#[test]
fn ntn_wide_channel_bounds_far_tighter_than_the_narrow_one() {
    let d = run("ntn-5g-positioning");
    let s = d["signals"].as_array().unwrap();
    let r = f(&s[1]["range_sigma_zenith_m"]) / f(&s[0]["range_sigma_zenith_m"]);
    assert!((r - 25.0).abs() < 1e-6, "{r}");
    assert!(f(&s[0]["toa_median_sigma_3d_m"]) < f(&s[1]["toa_median_sigma_3d_m"]));
}

#[test]
fn a_polar_leo_constellation_fills_the_sky_where_gnss_vertical_geometry_weakens() {
    let d = run("polar-arctic-leo-coverage");
    let rows = d["polar"]["rows"].as_array().unwrap();
    let eq = &rows[0];
    let pole = rows.last().unwrap();
    assert!(f(&pole["gnss"]["median_vdop"]) > f(&eq["gnss"]["median_vdop"]));
    assert!(f(&pole["leo"]["mean_in_view"]) > 4.0 * f(&eq["leo"]["mean_in_view"]));
    assert!(f(&pole["fused"]["median_vdop"]) < f(&pole["gnss"]["median_vdop"]));
}

#[test]
fn leo_timing_error_grows_as_the_c_n0_falls() {
    let d = run("leo-timing-utc");
    let rows = d["timing"]["rows"].as_array().unwrap();
    let at = |clock: &str, off: f64| {
        rows.iter()
            .find(|r| r["clock"] == clock && f(&r["cn0_offset_db"]) == off)
            .map(|r| f(&r["stats"]["rms_s"]))
            .unwrap()
    };
    assert!(at("ocxo", -30.0) > at("ocxo", 0.0));
    // The NIST comparison figure: under 40 ns from UTC(NIST) with a miniature atomic clock.
    assert!(at("csac", 0.0) < 40e-9);
    // IS-GPS-200: 18 s + 4 ns + 1e-14 * (172800 - 147456) s.
    let off = f(&d["timing"]["utc_offset_s"]);
    assert!(
        (off - (18.0 + 4e-9 + 1e-14 * 25_344.0)).abs() < 1e-15,
        "{off}"
    );
}

#[test]
fn ppp_with_the_largest_leo_constellation_converges_in_under_half_the_gnss_time() {
    // The bundled scenario, cut to its first site, one seed, 15 minutes and the 288-satellite
    // case, so a debug build finishes in about a minute.
    let src = std::fs::read_to_string("scenarios/leo-ppp-convergence.toml").unwrap();
    let mut doc: toml::Value = toml::from_str(&src).unwrap();
    let t = doc.as_table_mut().unwrap();
    t.insert("runs".into(), toml::Value::Integer(1));
    t.insert("duration_s".into(), toml::Value::Float(900.0));
    let sites = t["site"].as_array().unwrap()[..1].to_vec();
    t.insert("site".into(), toml::Value::Array(sites));
    let cases: Vec<toml::Value> = t["case"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|c| c["name"].as_str() == Some("288 LEO"))
        .cloned()
        .collect();
    assert_eq!(cases.len(), 1);
    t.insert("case".into(), toml::Value::Array(cases));
    let out = kshana::api::run_toml(&toml::to_string(&doc).unwrap()).unwrap();
    let d: Value = serde_json::from_str(&out.json).unwrap();
    let c = d["cases"].as_array().unwrap();
    let (g, l) = (
        f(&c[0]["median_convergence_min"]),
        f(&c[1]["median_convergence_min"]),
    );
    assert!(l < 0.5 * g, "GNSS {g} min, 288 LEO {l} min");
    let li = d["li_2019"].as_array().unwrap();
    assert_eq!(li.len(), 5);
    assert!((f(&li[0]["published_min"]) - 9.6).abs() < 1e-12);
    assert!((f(&li[4]["published_min"]) - 1.3).abs() < 1e-12);
    assert!(f(&li[4]["modelled_ratio"]) < 0.5);
}

/// The full bundled scenario: 12 runs per case. Too slow for a debug build, so it is
/// ignored by default; run it with
/// `cargo test --release --test leo_fusion_scenarios -- --ignored`.
#[test]
#[ignore]
fn ppp_convergence_of_the_bundled_scenario_shortens_monotonically() {
    let src = std::fs::read_to_string("scenarios/leo-ppp-convergence.toml").unwrap();
    let out = kshana::api::run_toml(&src).unwrap();
    let d: Value = serde_json::from_str(&out.json).unwrap();
    let t: Vec<f64> = d["cases"]
        .as_array()
        .unwrap()
        .iter()
        .map(|c| f(&c["median_convergence_min"]))
        .collect();
    for w in t.windows(2) {
        assert!(w[1] < w[0], "not monotone: {t:?}");
    }
    // The figures the documentation quotes (minutes, rounded to 0.1).
    let want = [7.4, 4.8, 3.2, 2.7, 2.3];
    for (got, w) in t.iter().zip(want) {
        assert!((got - w).abs() < 0.05, "{t:?}");
    }
}
