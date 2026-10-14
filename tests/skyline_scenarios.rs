// SPDX-License-Identifier: AGPL-3.0-only
//! The skyline in every scenario it is wired into, and the proof that a scenario without a
//! `[skyline]` section is unchanged.
//!
//! 1. **Byte identity against the 0.35.0 release.** `tests/fixtures/skyline/flat_hashes_0.35.0.txt`
//!    holds the SHA-256 of the JSON, SVG and summary of every shipped scenario that runs one of
//!    the wired kinds (orbit, integrity, gnss-sim, jamming, leo-pvt, leo-pass, campaigns that
//!    compose them), and of the NMEA text of every training scenario, computed by the frozen
//!    0.35.0 release commit (35c1558d) before any skyline code existed. This build must
//!    reproduce every one of them byte for byte.
//! 2. **An empty skyline is the old mask.** An empty `[skyline]` section describes no
//!    obstruction; the run must equal the run without the section in every field, the only
//!    differences being the added `skyline` block, the per-sample `masked_by_skyline` counts
//!    (all zero) and their units entries.
//! 3. **Each wired kind sees the obstruction.** One run per kind under a preset loses
//!    satellites against the same scenario under open sky.
//! 4. **Refusals.** A skyline on an orbiting `user` (it has no Earth-fixed azimuth: the design
//!    note's ground-site mode `user_site` is required), `user` and `user_site` together, an
//!    unsorted table and an unknown key are refused with a message that says why.

use kshana::api::run_toml;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::Path;

const BASELINE: &str = include_str!("fixtures/skyline/flat_hashes_0.35.0.txt");

fn h(s: &str) -> String {
    hex::encode(Sha256::digest(s.as_bytes()))
}

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn read(rel: &str) -> String {
    std::fs::read_to_string(root().join(rel)).unwrap_or_else(|e| panic!("{rel}: {e}"))
}

fn json(src: &str) -> Value {
    let o = run_toml(src).unwrap_or_else(|e| panic!("run failed: {e}"));
    serde_json::from_str(&o.json).expect("result is JSON")
}

#[test]
fn every_wired_scenario_is_byte_identical_to_the_0_35_0_release() {
    let mut checked = 0;
    let mut problems = Vec::new();
    for line in BASELINE.lines().filter(|l| !l.trim().is_empty()) {
        let parts: Vec<&str> = line.split_whitespace().collect();
        let name = parts[0];
        if let Some(t) = name.strip_prefix("training/") {
            let src = read(&format!("scenarios/training/{t}"));
            let scn = kshana::nmea_synth::config::TrainingScenario::parse(&src).unwrap();
            let g = kshana::nmea_synth::gen::generate(&scn).unwrap();
            if h(&g.nmea_text()) != parts[1] {
                problems.push(format!("{name}: NMEA text changed"));
            }
        } else {
            let src = read(&format!("scenarios/{name}"));
            match (run_toml(&src), parts[1]) {
                (Ok(o), _) => {
                    for (what, got, want) in [
                        ("json", h(&o.json), parts[1]),
                        ("svg", h(&o.svg), parts[2]),
                        ("summary", h(&o.summary), parts[3]),
                    ] {
                        if got != want {
                            problems.push(format!("{name}: {what} changed"));
                        }
                    }
                }
                (Err(e), "ERR") => {
                    if h(&e) != parts[2] {
                        problems.push(format!("{name}: error text changed"));
                    }
                }
                (Err(e), _) => problems.push(format!("{name}: now fails: {e}")),
            }
        }
        checked += 1;
    }
    assert!(checked >= 40, "only {checked} baseline rows read");
    // The 0.36 jammer-type Q table (broadband and swept 1 -> 2, pre-registered in
    // xval/jammer-q/) changes these files by design; xval/jammer-q/RESULTS.md lists every
    // value that moved. Their skyline neutrality stays checked by
    // an_empty_skyline_section_is_the_scalar_mask_in_every_wired_kind. Every listed file
    // must still differ (the list cannot go stale) and nothing else may.
    // The Galileo OS SIS ICD 2.1 power revision (docs/revisions/CAP12-galileo-icd21-power-changes.md)
    // changes the E1 and E5a received powers by -0.25 dB; it is handled the same way.
    let changed_by_q: std::collections::BTreeSet<&str> = Q_TABLE_CHANGED
        .iter()
        .chain(GALILEO_ICD21_CHANGED.iter())
        .copied()
        .collect();
    let differing: std::collections::BTreeSet<&str> = problems
        .iter()
        .filter_map(|p| p.split(':').next())
        .collect();
    let unexpected: Vec<&String> = problems
        .iter()
        .filter(|p| !changed_by_q.contains(p.split(':').next().unwrap_or("")))
        .collect();
    assert!(
        unexpected.is_empty(),
        "{}",
        unexpected
            .iter()
            .map(|s| s.as_str())
            .collect::<Vec<_>>()
            .join("\n")
    );
    assert_eq!(
        differing, changed_by_q,
        "the files the 0.36 Q table and the Galileo ICD 2.1 revision change are no longer exactly these"
    );
}

/// The skyline-wired files whose outputs the 0.36 Q table changes (xval/jammer-q/RESULTS.md).
const Q_TABLE_CHANGED: [&str; 7] = [
    "campaign-jam-spoof-holdover-integrity.toml",
    "campaign-shared-jammer-sea-road.toml",
    "campaign-spectrum-holdover-integrity.toml",
    "campaign-sweep-jammer-power.toml",
    "jamming-demo.toml",
    "leo-vertical-rail-maritime.toml",
    "maritime-strait-jamming.toml",
];

/// The skyline-wired files whose outputs the Galileo OS SIS ICD 2.1 power revision changes and
/// the Q table does not (docs/revisions/CAP12-galileo-icd21-power-changes.md lists every value).
/// `campaign-spectrum-holdover-integrity.toml` also moves with it and is already listed above.
const GALILEO_ICD21_CHANGED: [&str; 1] = ["leo-resilience-gnss-jammed-leo-carries.toml"];

/// Remove what an empty `[skyline]` section adds: the `skyline` block, every
/// `masked_by_skyline` / `epochs_masked_by_skyline` count and their `units` entries.
fn strip_skyline(v: &mut Value) {
    match v {
        Value::Object(o) => {
            o.remove("skyline");
            o.remove("masked_by_skyline");
            o.remove("epochs_masked_by_skyline");
            if let Some(u) = o.get_mut("units").and_then(Value::as_object_mut) {
                u.retain(|k, _| !k.starts_with("skyline.") && !k.contains("masked_by_skyline"));
            }
            for x in o.values_mut() {
                strip_skyline(x);
            }
        }
        Value::Array(a) => a.iter_mut().for_each(strip_skyline),
        _ => {}
    }
}

/// Blank the 12 hex digits after every "scenario " in a chart footer.
fn mask_scenario_hash(svg: &str) -> String {
    let mut out = String::with_capacity(svg.len());
    let mut rest = svg;
    while let Some(i) = rest.find("scenario ") {
        let (head, tail) = rest.split_at(i + "scenario ".len());
        out.push_str(head);
        let n = tail
            .chars()
            .take(12)
            .take_while(|c| c.is_ascii_hexdigit())
            .count();
        out.push_str(&"#".repeat(n));
        rest = &tail[n..];
    }
    out.push_str(rest);
    out
}

/// Replace the `[user]` table of an orbit or integrity scenario with a ground site.
fn with_user_site(src: &str) -> String {
    let mut out = String::new();
    let mut skip = false;
    for line in src.lines() {
        let t = line.trim();
        if t.starts_with('[') {
            skip = t == "[user]";
            if skip {
                out.push_str("[user_site]\nlat_deg = 45.0\nlon_deg = 10.0\nheight_m = 100.0\n");
            }
        }
        if !skip {
            out.push_str(line);
            out.push('\n');
        }
    }
    out
}

fn with_preset(src: &str, preset: &str) -> String {
    format!("{src}\n[skyline]\npreset = \"{preset}\"\n")
}

fn without_skyline(src: &str) -> String {
    let i = src
        .find("\n[skyline]")
        .expect("the example has a [skyline] section");
    let rest = &src[i + 1..];
    // The section runs to the next table header or the end.
    let end = rest[1..].find("\n[").map(|j| j + 2).unwrap_or(rest.len());
    format!("{}{}", &src[..i + 1], &rest[end..])
}

#[test]
fn an_empty_skyline_section_is_the_scalar_mask_in_every_wired_kind() {
    let files = [
        ("scenarios/orbit-sgp4-gps.toml", true),
        ("scenarios/integrity-raim.toml", true),
        ("scenarios/araim-gps-galileo.toml", true),
        ("scenarios/gnss-sim-raim.toml", false),
        ("scenarios/maritime-strait-jamming.toml", false),
        ("scenarios/meo-leo-fused-pvt.toml", false),
        ("scenarios/polar-arctic-leo-coverage.toml", false),
        ("scenarios/leo-pass-iridium.toml", false),
    ];
    for (f, site) in files {
        let src = read(f);
        // The orbit-sampled kinds take a skyline only with a ground site, so both runs use one.
        let src = if site { with_user_site(&src) } else { src };
        let open = run_toml(&src).unwrap_or_else(|e| panic!("{f}: {e}"));
        let flat = run_toml(&format!("{src}\n[skyline]\n")).unwrap_or_else(|e| panic!("{f}: {e}"));
        let mut flat_json: Value = serde_json::from_str(&flat.json).unwrap();
        assert_eq!(flat_json["skyline"]["source"], "custom", "{f}");
        let frac = flat_json["skyline"]["open_fraction"].as_f64().unwrap();
        assert!(frac > 0.8 && frac <= 1.0, "{f}: {frac}");
        let mut open_json: Value = serde_json::from_str(&open.json).unwrap();
        strip_skyline(&mut flat_json);
        for v in [&mut flat_json, &mut open_json] {
            if let Some(o) = v.as_object_mut() {
                // The scenario hash, where a kind carries one, digests the input text.
                o.remove("scenario_hash");
            }
        }
        assert_eq!(
            flat_json, open_json,
            "{f}: an empty skyline changed the result"
        );
        assert_eq!(
            mask_scenario_hash(&flat.svg),
            mask_scenario_hash(&open.svg),
            "{f}: chart changed"
        );
    }
}

#[test]
fn a_ground_site_orbit_example_loses_fixes_in_the_street() {
    let src = read("scenarios/orbit-urban-canyon-skyline.toml");
    let street = json(&src);
    let open = json(&without_skyline(&src));
    assert!(open.get("skyline").is_none());
    let fixes = |v: &Value| v["geometry"]["samples_with_fix"].as_u64().unwrap();
    let median = |v: &Value| v["geometry"]["median_pdop"].as_f64().unwrap();
    assert!(fixes(&street) <= fixes(&open));
    assert!(
        median(&street) > median(&open),
        "the strip of sky worsens the PDOP"
    );
    assert_eq!(street["skyline"]["source"], "preset:city-street");
    assert!(street["skyline"]["provenance"]
        .as_str()
        .unwrap()
        .starts_with("REPRESENTATIVE"));
    assert!(street["units"]["skyline.open_fraction"].is_object());
}

#[test]
fn integrity_example_counts_what_the_harbour_hides() {
    let src = read("scenarios/integrity-harbour-approach.toml");
    let port = json(&src);
    let open = json(&without_skyline(&src));
    let sum = |v: &Value, k: &str| -> u64 {
        v["epochs"]
            .as_array()
            .unwrap()
            .iter()
            .map(|e| e[k].as_u64().unwrap_or(0))
            .sum()
    };
    let masked = sum(&port, "masked_by_skyline");
    assert!(masked > 0);
    assert_eq!(sum(&port, "n_visible") + masked, sum(&open, "n_visible"));
    assert!(open["epochs"][0].get("masked_by_skyline").is_none());
    // The single-constellation RAIM path sees the skyline too.
    let raim = src.replace("araim_dual = true\n", "");
    assert!(sum(&json(&raim), "masked_by_skyline") > 0);
}

#[test]
fn gnss_sim_example_measures_fewer_satellites_on_the_quay() {
    let src = read("scenarios/gnss-sim-container-terminal-skyline.toml");
    let quay = json(&src);
    let open = json(&without_skyline(&src));
    let sum = |v: &Value, k: &str| -> u64 {
        v["gnss_measurements"]
            .as_array()
            .unwrap()
            .iter()
            .map(|e| e[k].as_u64().unwrap_or(0))
            .sum()
    };
    let masked = sum(&quay, "masked_by_skyline");
    assert!(masked > 0);
    assert_eq!(sum(&quay, "n_visible") + masked, sum(&open, "n_visible"));
}

#[test]
fn jamming_example_keeps_fewer_satellites_in_the_harbour() {
    let src = read("scenarios/jamming-harbour-approach-skyline.toml");
    let port = json(&src);
    let open = json(&without_skyline(&src));
    let sum = |v: &Value, k: &str| -> u64 {
        v["epochs"]
            .as_array()
            .unwrap()
            .iter()
            .map(|e| e[k].as_u64().unwrap_or(0))
            .sum()
    };
    let masked = sum(&port, "masked_by_skyline");
    assert!(masked > 0);
    assert_eq!(sum(&port, "visible") + masked, sum(&open, "visible"));
    assert!(sum(&port, "tracking") <= sum(&open, "tracking"));
}

#[test]
fn leo_pvt_joint_and_polar_modes_see_the_fjord() {
    let src = read("scenarios/leo-pvt-fjord-skyline.toml");
    let fjord = json(&src);
    let open = json(&without_skyline(&src));
    let n = |v: &Value, k: &str| -> u64 {
        v["joint"]["epochs"]
            .as_array()
            .unwrap()
            .iter()
            .map(|e| e[k].as_u64().unwrap_or(0))
            .sum()
    };
    assert!(n(&fjord, "n_gnss") < n(&open, "n_gnss"));
    assert!(n(&fjord, "n_leo") <= n(&open, "n_leo"));
    assert!(n(&fjord, "masked_by_skyline") > 0);

    let polar_src = read("scenarios/polar-arctic-leo-coverage.toml");
    let polar_open = json(&polar_src);
    let polar_fjord = json(&with_preset(&polar_src, "fjord"));
    let mean = |v: &Value| -> f64 {
        v["polar"]["rows"]
            .as_array()
            .unwrap()
            .iter()
            .map(|r| r["fused"]["mean_in_view"].as_f64().unwrap())
            .sum()
    };
    assert!(mean(&polar_fjord) < mean(&polar_open));
}

#[test]
fn leo_pass_time_above_the_mask_shrinks_under_a_skyline() {
    let src = read("scenarios/leo-pass-iridium.toml");
    let open = json(&src);
    let fjord = json(&with_preset(&src, "fjord"));
    let above = |v: &Value| -> f64 {
        v["satellites"]
            .as_array()
            .unwrap()
            .iter()
            .map(|s| s["pass"]["duration_above_mask_s"].as_f64().unwrap())
            .sum()
    };
    assert!(above(&fjord) < above(&open));
    let masked: u64 = fjord["satellites"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| s["pass"]["epochs_masked_by_skyline"].as_u64().unwrap())
        .sum();
    assert!(masked > 0);
    assert!(fjord["units"]["satellites[].pass.epochs_masked_by_skyline"].is_object());
}

#[test]
fn training_nmea_lists_fewer_satellites_in_view_in_a_fjord() {
    let src = read("scenarios/training/open-sea-jamming.toml");
    let in_view = |text: &str| -> u64 {
        let scn = kshana::nmea_synth::config::TrainingScenario::parse(text).unwrap();
        let g = kshana::nmea_synth::gen::generate(&scn).unwrap();
        g.nmea_text()
            .lines()
            .filter(|l| l.get(3..6) == Some("GSV"))
            .filter(|l| l.split(',').nth(2) == Some("1"))
            .map(|l| l.split(',').nth(3).unwrap().parse::<u64>().unwrap())
            .sum()
    };
    let open = in_view(&src);
    let fjord = in_view(&with_preset(&src, "fjord"));
    assert!(fjord < open, "fjord {fjord} vs open {open}");
}

#[test]
fn misplaced_and_malformed_skylines_are_refused() {
    let src = read("scenarios/integrity-raim.toml");
    let e = run_toml(&with_preset(&src, "fjord")).unwrap_err();
    assert!(e.contains("user_site"), "{e}");
    let e = run_toml(&with_preset(
        &read("scenarios/orbit-multignss.toml"),
        "fjord",
    ))
    .unwrap_err();
    assert!(e.contains("user_site"), "{e}");
    let both = format!("{src}\n[user_site]\nlat_deg = 45.0\nlon_deg = 10.0\n");
    assert!(run_toml(&both).unwrap_err().contains("not both"));
    let site = with_user_site(&src);
    let e = run_toml(&format!(
        "{site}\n[skyline]\ntable = [[90.0, 10.0], [10.0, 5.0]]\n"
    ))
    .unwrap_err();
    assert!(e.contains("strictly increasing"), "{e}");
    let e = run_toml(&format!("{site}\n[skyline]\nprest = \"fjord\"\n")).unwrap_err();
    assert!(e.contains("prest"), "{e}");
    // A preset with an override is accepted and reported as such.
    let ok = json(&format!(
        "{site}\n[skyline]\npreset = \"city-street\"\nstreet_az_deg = 35.0\n"
    ));
    assert_eq!(ok["skyline"]["source"], "preset:city-street+overrides");
}

#[test]
fn a_ground_site_sees_real_element_sets_at_their_own_epochs() {
    // orbit-real-tle's clocks and grid with a ground site and the repository's Celestrak GPS
    // element sets (full two-line sets, so SGP4 counts t from each set's own epoch). The site
    // puts every set on one instant: the scenario's `epoch`, or the newest set's epoch when
    // it states none, so either way the sky is one consistent sky.
    let base = read("scenarios/orbit-real-tle.toml");
    let gps = read("tests/fixtures/celestrak/gps-ops_2026-06-07.txt");
    let start = base.find("tle = \"\"\"").unwrap();
    let end = start + base[start..].find("\"\"\"\n\n").unwrap() + 4;
    let real = format!(
        "{}tle = \"\"\"\n{gps}\"\"\"\n{}",
        &base[..start],
        &base[end..]
    );
    let site = with_user_site(&real);
    let dated = format!(
        "{site}\n[epoch]\nyear = 2026\nmonth = 6\nday = 7\nhour = 0\nminute = 0\nsecond = 0.0\n"
    );
    let a = json(&site);
    let b = json(&dated);
    let fixes = a["geometry"]["samples_with_fix"].as_u64().unwrap();
    for v in [&a, &b] {
        let g = &v["geometry"];
        assert_eq!(
            g["samples_with_fix"], g["samples_total"],
            "a full GPS constellation always gives a fix in the open"
        );
        let pdop = g["median_pdop"].as_f64().unwrap();
        assert!(pdop > 1.0 && pdop < 3.0, "{pdop}");
        let best = g["best_pdop"].as_f64().unwrap();
        assert!(best > 1.0, "{best}");
    }
    // A stated epoch dates the sky: midnight is not the newest set's 07:21 epoch.
    assert_ne!(a["geometry"]["median_pdop"], b["geometry"]["median_pdop"]);
    // Under the city street the same sky loses fixes.
    let street = json(&with_preset(&site, "city-street"));
    assert!(street["geometry"]["samples_with_fix"].as_u64().unwrap() < fixes);
}
