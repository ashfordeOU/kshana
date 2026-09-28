// SPDX-License-Identifier: AGPL-3.0-only
//! The low Earth orbit (LEO) signal-design scenarios, run end to end through the public
//! dispatcher.
//!
//! Every system-agnostic scenario must run with no workshop data at all: nothing here
//! reads `scenarios/celeste-iod-classical-pilot-signals.toml` except the one test that
//! checks it, and that test passes (with a note) when the file has been withheld.

use serde_json::Value;

fn run(path: &str) -> (Value, String) {
    let src = std::fs::read_to_string(path).unwrap_or_else(|e| panic!("{path}: {e}"));
    let out = kshana::api::run_toml(&src).unwrap_or_else(|e| panic!("{path}: {e}"));
    (serde_json::from_str(&out.json).expect("json"), out.summary)
}

const CELESTE: &str = "scenarios/celeste-iod-classical-pilot-signals.toml";

fn f(v: &Value) -> f64 {
    v.as_f64().unwrap_or_else(|| panic!("not a number: {v}"))
}

#[test]
fn system_agnostic_scenarios_use_no_workshop_source() {
    for p in [
        "scenarios/xona-pulsar-signals.toml",
        "scenarios/leo-band-trade.toml",
        "scenarios/multi-band-jamming-waterfall.toml",
    ] {
        let text = std::fs::read_to_string(p).unwrap();
        assert!(
            !text.contains("WORKSHOP") && !text.to_lowercase().contains("celeste"),
            "{p} must not depend on workshop data"
        );
        let (v, _) = run(p);
        if v["kind"] == "leo-signal" {
            for s in v["signals"].as_array().unwrap() {
                assert_ne!(s["source"], "WORKSHOP", "{p}: {}", s["name"]);
            }
        }
    }
}

#[test]
fn band_trade_follows_the_closed_forms() {
    let (v, summary) = run("scenarios/leo-band-trade.toml");
    assert!(summary.contains("leo-signal"));
    let rows = v["trade"]["rows"].as_array().unwrap();
    let r0 = rows.iter().find(|r| r["signal"] == "generic-l").unwrap();
    let f_ref = f(&r0["centre_hz"]);
    for r in rows {
        let fc = f(&r["centre_hz"]);
        assert!((f(&r["iono_delay_ratio"]) - (f_ref / fc).powi(2)).abs() < 1e-12);
        assert!(
            (f(&r["free_space_loss_vs_reference_db"]) - 20.0 * (fc / f_ref).log10()).abs() < 1e-9
        );
        // First-order delay: 40.3 x 50 TECU / f^2.
        assert!((f(&r["iono_delay_m"]) - 40.3 * 50e16 / (fc * fc)).abs() < 1e-9);
    }
    // At L band 1 TECU is 0.285 m at 1191.795 MHz (0.162 m at L1: 40.3e16 / 1575.42e6^2).
    assert!((40.3e16 / 1575.42e6f64.powi(2) - 0.1624).abs() < 1e-3);
    // The wide C band ranges finest at equal C/N0; UHF gains free-space margin.
    let jit = |n: &str| f(&rows.iter().find(|r| r["signal"] == n).unwrap()["jitter_equal_cn0_m"]);
    assert!(jit("generic-c-wide") < jit("generic-l"));
    let uhf = rows.iter().find(|r| r["signal"] == "generic-uhf").unwrap();
    assert!(f(&uhf["cn0_equal_eirp_dbhz"]) > 45.0);
    // Every tracked signal's jitter sits between its Gabor bound and its unlimited-band
    // form (a 0.5-chip spacing inside a finite band).
    for s in v["signals"].as_array().unwrap() {
        let t = &s["tracking"];
        let spacings = t["spacings_chips"].as_array().unwrap();
        let k = spacings.iter().position(|d| f(d) == 0.5).unwrap();
        for (i, j) in t["jitter_m"][k].as_array().unwrap().iter().enumerate() {
            let lim = f(&t["small_spacing_limit_m"][i]);
            assert!(
                f(j) >= lim * (1.0 - 1e-6),
                "{}: {} < {lim}",
                s["name"],
                f(j)
            );
        }
        assert!(f(&s["acquisition"]["doppler_bins"]) > 1.0);
    }
}

#[test]
fn xona_scenario_reports_compatibility_and_acquisition() {
    let (v, _) = run("scenarios/xona-pulsar-signals.toml");
    let sigs = v["signals"].as_array().unwrap();
    let x5 = sigs.iter().find(|s| s["name"] == "xona-x5").unwrap();
    // X5 lies inside the E5 band: it overlaps E5a, E5b and AltBOC, not L1.
    let c = |g: &str| {
        x5["compatibility"]
            .as_array()
            .unwrap()
            .iter()
            .find(|c| c["gnss"] == g)
            .unwrap()
            .clone()
    };
    assert!(c("galileo-e5-altboc")["ssc_leo_into_gnss_db_per_hz"].is_number());
    assert!(c("galileo-e5a")["ssc_leo_into_gnss_db_per_hz"].is_number());
    assert!(c("gps-l1ca")["ssc_leo_into_gnss_db_per_hz"].is_null());
    let dop = f(&x5["acquisition"]["max_doppler_satellite_hz"]);
    assert!((20_000.0..30_000.0).contains(&dop), "X5 Doppler {dop}");
    assert!(f(&x5["acquisition"]["mean_time_code_parallel_s"]) > 0.0);
    // Reference C/N0 from the published minimum power: -144.9 dBW over -201.98 dBW/Hz.
    assert!((f(&x5["reference_cn0_dbhz"]) - 57.08).abs() < 0.05);
}

#[test]
fn multi_band_waterfall_denies_each_band_only_by_its_own_jammer() {
    let (v, _) = run("scenarios/multi-band-jamming-waterfall.toml");
    assert_eq!(v["panels"].as_array().unwrap().len(), 3);
    let tl = &v["timeline"];
    let t: Vec<f64> = tl["t_s"].as_array().unwrap().iter().map(f).collect();
    let band = |n: &str| {
        tl["bands"]
            .as_array()
            .unwrap()
            .iter()
            .find(|b| b["name"] == n)
            .unwrap()
            .clone()
    };
    let cn0_at = |n: &str, ts: f64| {
        let i = t.iter().position(|x| (*x - ts).abs() < 1e-9).unwrap();
        f(&band(n)["cn0_effective_dbhz"][i])
    };
    // Before any jammer, every band at its nominal C/N0; each jammer takes its own band.
    let nominal = |n: &str| cn0_at(n, 0.0);
    assert!(cn0_at("generic-uhf", 15.0) < nominal("generic-uhf") - 10.0);
    assert!((cn0_at("gps-l1ca", 15.0) - nominal("gps-l1ca")).abs() < 1e-9);
    assert!(cn0_at("gps-l1ca", 25.0) < 25.0);
    assert!((cn0_at("xona-x5", 25.0) - nominal("xona-x5")).abs() < 1e-9);
    assert!(cn0_at("xona-x5", 35.0) < nominal("xona-x5") - 3.0);
    assert!((cn0_at("generic-s", 35.0) - nominal("generic-s")).abs() < 1e-9);
    assert!(cn0_at("generic-s", 45.0) < nominal("generic-s") - 3.0);
    assert!((cn0_at("generic-c-band-leo", 45.0) - nominal("generic-c-band-leo")).abs() < 1e-9);
    assert!(cn0_at("generic-c-band-leo", 55.0) < nominal("generic-c-band-leo") - 3.0);
    // Designed bands carry their design block; plain bands do not.
    let b = v["bands"].as_array().unwrap();
    assert!(b.iter().find(|x| x["name"] == "xona-x5").unwrap()["design"].is_object());
    assert!(b.iter().find(|x| x["name"] == "gps-l1ca").unwrap()["design"].is_null());
}

#[test]
fn the_plain_l_band_example_is_unchanged_by_the_extension() {
    // The published example's table (docs/SPECTRUM.md): L1 C/A nominal 43.48 dB-Hz and
    // minimum 3.23 dB-Hz, E5a nominal 46.98 dB-Hz untouched.
    let (v, _) = run("scenarios/l-band-waterfall-jamming.toml");
    let b = |n: &str| {
        v["timeline"]["bands"]
            .as_array()
            .unwrap()
            .iter()
            .find(|b| b["name"] == n)
            .unwrap()
            .clone()
    };
    assert!((f(&b("gps-l1ca")["min_cn0_dbhz"]) - 3.23).abs() < 0.005);
    assert!((f(&b("galileo-e5a")["min_cn0_dbhz"]) - 46.98).abs() < 0.005);
    assert_eq!(v["panels"].as_array().unwrap().len(), 0);
}

// MODELLED consistency, not validation: the workshop-parameter scenario's E5 design
// against the measured E5 spectrum shape it describes. Passes with a note when the
// file has been withheld from a release.
#[test]
fn workshop_e5_design_is_consistent_with_its_described_shape_when_present() {
    if !std::path::Path::new(CELESTE).exists() {
        eprintln!("{CELESTE} withheld: nothing to check");
        return;
    }
    let (v, summary) = run(CELESTE);
    assert!(summary.contains("shape checks consistent"), "{summary}");
    assert_eq!(v["shape_checks_pass"], true);
    for c in v["shape_checks"].as_array().unwrap() {
        for item in c["items"].as_array().unwrap() {
            assert_eq!(item["pass"], true, "{item}");
        }
    }
}

// Withholding the workshop-parameter preset must take deleting that one file. An
// `include_str!` (directly or through the `bundled!` table) of it anywhere in the engine
// would stop the crate compiling the moment the file is withheld, so no source file may
// embed it; the command-line interface names it only as a repository-only scenario.
#[test]
fn the_workshop_preset_is_not_compiled_into_any_source_file() {
    let stem = "celeste-iod-classical-pilot-signals";
    let mut stack = vec![std::path::PathBuf::from("src")];
    let mut seen = 0;
    while let Some(dir) = stack.pop() {
        for e in std::fs::read_dir(&dir).unwrap() {
            let p = e.unwrap().path();
            if p.is_dir() {
                stack.push(p);
            } else if p.extension().is_some_and(|x| x == "rs") {
                seen += 1;
                let text = std::fs::read_to_string(&p).unwrap();
                for (i, line) in text.lines().enumerate() {
                    if line.contains(stem) {
                        assert!(
                            !line.contains("include_str!")
                                && !line.contains("include_bytes!")
                                && !line.contains("bundled!("),
                            "{}:{}: {stem} is compiled in, so deleting the file would break \
                             the build",
                            p.display(),
                            i + 1
                        );
                    }
                }
            }
        }
    }
    assert!(seen > 50, "walked only {seen} source files");
}
