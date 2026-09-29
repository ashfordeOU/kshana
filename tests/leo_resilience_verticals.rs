// SPDX-License-Identifier: AGPL-3.0-only
//! The LEO-PNT resilience, focus-area and vertical layer.
//!
//! * The spoofing monitors of `leo-pass` (`[spoofer]`): silent before the onset, the
//!   Doppler statistic quadratic in a position jump, LEO range rates far more sensitive to
//!   position than GNSS ones, and the cross-band monitor seeing exactly the ionospheric
//!   step a ground spoofer leaves and nothing when the spoofer simulates the ionosphere.
//! * The geometry-free slant TEC of `leo-pass` band pairs is the pass's own slant TEC.
//! * The `leo-pvt` timing trace carries the same draws as the row statistics.
//! * A campaign exports each member scenario, byte for byte as the member exports alone.
//! * Every new scenario is system-agnostic (`tests/determinism.rs` runs each twice).

use kshana::api::run_toml;
use kshana::interop::{self, ExportError, Format};
use serde_json::Value;

fn run(src: &str) -> Value {
    let out = run_toml(src).unwrap_or_else(|e| panic!("run failed: {e}"));
    serde_json::from_str(&out.json).expect("result is JSON")
}

fn scenario(name: &str) -> String {
    std::fs::read_to_string(format!(
        "{}/scenarios/{name}.toml",
        env!("CARGO_MANIFEST_DIR")
    ))
    .unwrap_or_else(|e| panic!("{name}: {e}"))
}

const NEW: &[&str] = &[
    "leo-resilience-multiband-diversity",
    "leo-resilience-js-margin",
    "leo-resilience-spoof-doppler",
    "leo-resilience-spoof-monitors",
    "leo-resilience-gnss-jammed-leo-carries",
    "leo-focus-ppp-altitude",
    "leo-focus-ntn-bandwidth",
    "leo-focus-iot-eirp",
    "leo-focus-science-iono-sounding",
    "leo-focus-data-services",
    "leo-focus-indoor-uhf",
    "leo-focus-fused-pnt-sisre",
    "leo-vertical-autonomous-vehicle",
    "leo-vertical-rail-maritime",
    "leo-vertical-critical-infrastructure-timing",
    "leo-vertical-polar-arctic",
    "leo-vertical-5g-network-timing",
    "leo-vertical-asset-tracking-iot",
];

/// A small spoofing scenario: a static surveyed site, Galileo E1 and a generic 1080 km
/// layer in L and C, a jump of `jump_m` at 150 s.
fn spoof_src(jump_m: f64, extra: &str) -> String {
    format!(
        r#"kind = "leo-pass"
epoch = "2026-09-28T08:00:00"
duration_s = 600.0
step_s = 10.0
[user]
lat_deg = 50.11
lon_deg = 8.68
height_m = 110.0
mask_deg = 10.0
[[leo_constellation]]
system = "generic-leo"
bands = ["L", "C"]
max_satellites = 12
[leo_constellation.design]
name = "Generic 1080 km"
[[leo_constellation.design.shell]]
total = 240
planes = 12
phasing = 1
altitude_km = 1080.0
inclination_deg = 53.0
[gnss]
constellation = "galileo"
band = "E1"
max_satellites = 8
[spoofer]
onset_s = 150.0
offset_m = {jump_m}
push_rate_m_s = 0.0
push_azimuth_deg = 90.0
prior_sigma_m = 1.0
prior_velocity_sigma_m_s = 0.002
{extra}
"#
    )
}

fn series(v: &Value) -> &Vec<Value> {
    v["spoof"]["series"].as_array().expect("spoof series")
}

#[test]
fn the_monitors_are_silent_before_the_onset() {
    let v = run(&spoof_src(30.0, ""));
    let p_fa = v["spoof"]["p_fa"].as_f64().unwrap();
    let mut checked = 0;
    for e in series(&v)
        .iter()
        .filter(|e| e["t_s"].as_f64().unwrap() < 150.0)
    {
        assert_eq!(e["offset_m"].as_f64(), Some(0.0));
        for test in ["gnss", "leo", "fused"] {
            if let Some(l) = e[test]["noncentrality"].as_f64() {
                assert!(l.abs() < 1e-9, "{test} at {}: {l}", e["t_s"]);
                let p = e[test]["p_detect"].as_f64().unwrap();
                assert!((p - p_fa).abs() < 1e-3 * p_fa, "{test}: {p}");
                checked += 1;
            }
        }
        if let Some(r) = e["cross_band_ratio"].as_f64() {
            assert!(r < 1e-9, "cross-band step before the onset: {r}");
        }
    }
    assert!(checked > 20, "{checked}");
}

#[test]
fn the_doppler_statistic_is_quadratic_in_the_jump() {
    // A pure position jump enters the range rates linearly (to first order), so the
    // non-centrality of every test scales with its square: doubling the jump quadruples it.
    let a = run(&spoof_src(20.0, ""));
    let b = run(&spoof_src(40.0, ""));
    let mut n = 0;
    for (ea, eb) in series(&a).iter().zip(series(&b)) {
        if ea["t_s"].as_f64().unwrap() < 150.0 {
            continue;
        }
        for test in ["gnss", "leo", "fused"] {
            let (Some(la), Some(lb)) = (
                ea[test]["noncentrality"].as_f64(),
                eb[test]["noncentrality"].as_f64(),
            ) else {
                continue;
            };
            if la > 1e-6 {
                let r = lb / la;
                assert!((r - 4.0).abs() < 0.02, "{test} at {}: ratio {r}", ea["t_s"]);
                n += 1;
            }
        }
    }
    assert!(n > 40, "{n}");
}

#[test]
fn leo_range_rates_see_a_jump_that_gnss_range_rates_do_not() {
    let v = run(&scenario("leo-resilience-spoof-doppler"));
    let s = &v["spoof"];
    let gl = s["median_leo_gradient_per_s"].as_f64().unwrap();
    let gg = s["median_gnss_gradient_per_s"].as_f64().unwrap();
    // Transverse speed over range: about 7 km/s over ~2000 km against 3 km/s over ~22 000 km.
    assert!(gl / gg > 10.0, "{gl} / {gg}");
    assert!(s["gnss"]["detect_time_s"].is_null(), "GNSS-only detected");
    let t = s["fused"]["detect_time_s"]
        .as_f64()
        .expect("fused detection");
    assert!(t >= 300.0);
    // Where the fused test detects, its probability is at least 1 - p_md and the GNSS-only
    // test's is below it.
    let p_md = s["p_md"].as_f64().unwrap();
    let e = series(&v)
        .iter()
        .find(|e| e["t_s"].as_f64() == Some(t))
        .unwrap();
    assert!(e["fused"]["p_detect"].as_f64().unwrap() >= 1.0 - p_md);
    assert!(e["gnss"]["p_detect"].as_f64().unwrap() < 1.0 - p_md);
}

#[test]
fn a_ground_spoofer_leaves_the_ionospheric_step_and_an_ionosphere_aware_one_does_not() {
    let no_iono = run(&spoof_src(30.0, "simulate_iono = false"));
    let with_iono = run(&spoof_src(30.0, "simulate_iono = true"));
    // At the onset each tracked pair's model-corrected geometry-free combination jumps by
    // minus its ionospheric delay difference: find the satellites tracked on both bands at
    // 140 s and 150 s and check the pair's largest step is at least that difference.
    let sats = no_iono["satellites"].as_array().unwrap();
    let thr = no_iono["spoof"]["tracking_threshold_dbhz"]
        .as_f64()
        .unwrap();
    let pairs = no_iono["spoof"]["pairs"].as_array().unwrap();
    let mut checked = 0;
    for sat in sats {
        let ser = sat["series"].as_array().unwrap();
        let at = |t: f64| ser.iter().find(|e| e["t_s"].as_f64() == Some(t)).unwrap();
        let (e0, e1) = (at(140.0), at(150.0));
        let tracked = |e: &Value| {
            e["visible"].as_bool() == Some(true)
                && e["bands"][0]["cn0_dbhz"].as_f64().unwrap() >= thr
                && e["bands"][1]["cn0_dbhz"].as_f64().unwrap() >= thr
        };
        if !(tracked(e0) && tracked(e1)) {
            continue;
        }
        let d = e1["bands"][0]["iono_delay_m"].as_f64().unwrap()
            - e1["bands"][1]["iono_delay_m"].as_f64().unwrap();
        let p = pairs.iter().find(|p| p["satellite"] == sat["id"]).unwrap();
        let step = p["max_abs_step_m"].as_f64().unwrap();
        assert!(step >= d.abs() - 1e-6, "{}: step {step} < {d}", sat["id"]);
        checked += 1;
    }
    assert!(checked >= 2, "{checked}");
    assert_eq!(
        no_iono["spoof"]["cross_band"]["detect_time_s"].as_f64(),
        Some(150.0)
    );
    assert!(with_iono["spoof"]["cross_band"]["detect_time_s"].is_null());
    // The Doppler monitor does not depend on the ionosphere.
    assert_eq!(
        no_iono["spoof"]["fused"]["detect_time_s"],
        with_iono["spoof"]["fused"]["detect_time_s"]
    );
}

#[test]
fn a_one_band_spoofer_is_seen_by_the_cross_band_monitor_at_the_onset() {
    let v = run(&spoof_src(30.0, "bands = [\"L\"]"));
    assert_eq!(
        v["spoof"]["cross_band"]["detect_time_s"].as_f64(),
        Some(150.0)
    );
    for p in v["spoof"]["pairs"].as_array().unwrap() {
        assert_eq!(p["spoofed_1"].as_bool(), Some(true));
        assert_eq!(p["spoofed_2"].as_bool(), Some(false));
    }
    // An unknown band is refused, not ignored.
    let bad = run_toml(&spoof_src(30.0, "bands = [\"Ku\"]"));
    assert!(bad.is_err());
}

#[test]
fn the_geometry_free_tec_is_the_pass_slant_tec() {
    let v = run(&scenario("leo-focus-science-iono-sounding"));
    let sat = &v["satellites"][0];
    let peak = sat["series"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|e| e["visible"].as_bool() == Some(true))
        .max_by(|a, b| {
            a["bands"][0]["cn0_dbhz"]
                .as_f64()
                .unwrap()
                .total_cmp(&b["bands"][0]["cn0_dbhz"].as_f64().unwrap())
        })
        .unwrap();
    let stec = peak["stec_tecu"].as_f64().unwrap();
    let pairs = v["iono_free"].as_array().unwrap();
    assert_eq!(pairs.len(), 6);
    for p in pairs {
        let g = p["geometry_free_stec_tecu"].as_f64().unwrap();
        assert!((g - stec).abs() < 1e-9 * stec, "{g} vs {stec}");
        // Its sigma is the RSS code noise over 40.3 (1/f1^2 - 1/f2^2), in TEC units.
        let bands = sat["bands"].as_array().unwrap();
        let f = |n: &str| {
            bands.iter().find(|b| b["name"] == n).unwrap()["frequency_hz"]
                .as_f64()
                .unwrap()
        };
        let (f1, f2) = (
            f(p["band_1"].as_str().unwrap()),
            f(p["band_2"].as_str().unwrap()),
        );
        let (n1, n2) = (
            p["code_noise_1_m"].as_f64().unwrap(),
            p["code_noise_2_m"].as_f64().unwrap(),
        );
        let want =
            (n1 * n1 + n2 * n2).sqrt() / (40.3 * (1.0 / (f1 * f1) - 1.0 / (f2 * f2))).abs() / 1e16;
        let got = p["geometry_free_stec_sigma_tecu"].as_f64().unwrap();
        assert!((got - want).abs() < 1e-9 * want, "{got} vs {want}");
    }
}

#[test]
fn the_timing_trace_carries_the_row_statistics() {
    // The bundled scenario sets `trace = true` so it animates; the plain run strips it.
    let src = scenario("leo-timing-utc");
    assert!(
        src.contains("\ntrace = true\n"),
        "the bundled scenario traces"
    );
    let v = run(&src);
    let plain = run(&src.replace("\ntrace = true\n", "\n"));
    let rows = v["timing"]["rows"].as_array().unwrap();
    for (row, prow) in rows.iter().zip(plain["timing"]["rows"].as_array().unwrap()) {
        assert_eq!(
            row["stats"], prow["stats"],
            "the trace changed the statistics"
        );
        assert!(prow.get("series").is_none());
        let ser = row["series"].as_array().unwrap();
        let errs: Vec<f64> = ser
            .iter()
            .map(|e| e["error_ns"].as_f64().unwrap())
            .collect();
        let rms = (errs.iter().map(|e| e * e).sum::<f64>() / errs.len() as f64).sqrt();
        let want = row["stats"]["rms_s"].as_f64().unwrap() * 1e9;
        assert!((rms - want).abs() < 1e-9 * want, "{rms} vs {want}");
        let max = errs.iter().fold(0.0_f64, |m, e| m.max(e.abs()));
        let want_max = row["stats"]["max_abs_s"].as_f64().unwrap() * 1e9;
        assert!((max - want_max).abs() < 1e-9 * want_max);
        let in_view = ser
            .iter()
            .filter(|e| e["in_view"].as_bool() == Some(true))
            .count();
        assert!(in_view > 0 && in_view <= ser.len());
    }
}

#[test]
fn a_campaign_exports_each_member_as_the_member_exports_alone() {
    let src = scenario("leo-vertical-rail-maritime");
    let members = interop::campaign_members(&src).unwrap();
    let labels: Vec<&str> = members.iter().map(|(l, _)| l.as_str()).collect();
    assert_eq!(
        labels,
        [
            "strait-jammed-0",
            "strait-jammed-1",
            "rail-tunnel",
            "rail-open"
        ]
    );
    let files = interop::export(&src, Format::Czml).unwrap();
    let mut n = 0;
    for (label, text) in &members {
        match interop::export(text, Format::Czml) {
            Ok(fs) => {
                for f in fs {
                    let want = format!(".{label}{}", f.suffix);
                    let got = files
                        .iter()
                        .find(|g| g.suffix == want)
                        .unwrap_or_else(|| panic!("no {want}"));
                    assert_eq!(got.bytes, f.bytes, "{want}");
                    n += 1;
                }
            }
            Err(ExportError::NotApplicable(_)) => {}
            Err(e) => panic!("{label}: {e}"),
        }
    }
    assert_eq!(n, files.len());
    assert_eq!(n, 3, "the jamming run and the two leo-pass runs");
    // A campaign with no member that places anything says so.
    let none = interop::export(&scenario("leo-focus-data-services"), Format::Kml);
    assert!(matches!(none, Err(ExportError::NotApplicable(_))));
    // Composed members are exported with their shared values bound.
    let sea = scenario("campaign-shared-jammer-sea-road");
    let m = interop::campaign_members(&sea).unwrap();
    assert!(m[0].1.contains("power_dbw = 8.0"), "{}", m[0].1);
}

#[test]
fn every_new_scenario_is_system_agnostic() {
    // `tests/determinism.rs` runs every scenario file twice and compares the bytes; here
    // each new one must name no optional workshop preset and classify as a known kind.
    for name in NEW {
        let src = scenario(name);
        assert!(
            !src.to_ascii_lowercase().contains("celeste"),
            "{name} names the optional preset"
        );
        kshana::api::ScenarioKind::classify(&src).unwrap_or_else(|e| panic!("{name}: {e}"));
    }
}

#[test]
fn the_new_fields_carry_units() {
    // The field-units gate runs one scenario per kind (`tests/field_units_global.rs`), none
    // of which takes the spoofer, the sounding pairs or the timing trace: audit those
    // documents here with the same audit.
    let trace = scenario("leo-timing-utc");
    assert!(
        trace.contains("\ntrace = true\n"),
        "the bundled scenario traces"
    );
    for (name, src) in [
        (
            "leo-resilience-spoof-doppler",
            scenario("leo-resilience-spoof-doppler"),
        ),
        (
            "leo-focus-science-iono-sounding",
            scenario("leo-focus-science-iono-sounding"),
        ),
        ("leo-timing-utc with trace", trace),
    ] {
        let doc = run(&src);
        let audit = kshana::field_schema::audit_document(&doc);
        assert!(
            audit.missing.is_empty(),
            "{name}: fields without units: {:?}",
            audit.missing
        );
    }
}
