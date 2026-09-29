// SPDX-License-Identifier: AGPL-3.0-only
//! The advanced run report (`src/advanced_report.rs`) over the whole bundled corpus.
//!
//! Every runnable file under `scenarios/` is run once and reported. For each report the
//! test requires:
//!
//! * **no empty section**: the inputs, the scalar results, the numeric columns, the
//!   events timeline and the not-modelled list each carry rows or a sentence saying why
//!   there are none, and the verification-labels section carries at least one row;
//! * **no placeholder text**: no displayed value, unit, label or statement is empty or
//!   reads `NaN`, `undefined`, `null` or `inf`, in `report.json` or in an HTML cell;
//! * **labels match the verification matrix**: every capability row's label, oracle and
//!   test evidence are the matrix row's, and every per-figure tier the result states
//!   names a matrix row;
//! * **the scenario digest is the file's**: `scenario_sha256` is the SHA-256 of the exact
//!   bytes that were run;
//! * **purity**: building the report twice from one run gives byte-identical JSON and
//!   HTML.
//!
//! A second test re-runs a few scenarios, a campaign of each mode among them, and
//! requires the two reports to be byte-identical: determinism end to end, not only of
//! the builder.
//!
//! The command-line reproduction (the recorded command re-run in a fresh directory
//! gives a byte-identical result document) is `tests/advanced_report_cli.rs`.

use kshana::advanced_report::{build, sha256_hex, Invocation, Report};
use serde_json::Value;
use std::fs;

fn runnable_scenarios() -> Vec<std::path::PathBuf> {
    let mut v: Vec<_> = fs::read_dir("scenarios")
        .expect("scenarios dir")
        .filter_map(Result::ok)
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .filter(|p| {
            !p.file_name()
                .and_then(|n| n.to_str())
                .unwrap_or_default()
                .ends_with(".suite.toml")
        })
        .collect();
    v.sort();
    v
}

fn report_of(path: &std::path::Path) -> (kshana::api::RunOutput, String, Report) {
    let src = fs::read_to_string(path).expect("read scenario");
    let out = kshana::api::run_toml(&src)
        .unwrap_or_else(|e| panic!("{} failed to run: {e}", path.display()));
    let inv = Invocation {
        scenario_arg: path.display().to_string(),
        ..Default::default()
    };
    let r = build(&out, &src, &inv)
        .unwrap_or_else(|e| panic!("{}: report failed: {e}", path.display()));
    (out, src, r)
}

const PLACEHOLDERS: &[&str] = &["", "NaN", "nan", "undefined", "null", "inf", "-inf", "None"];

/// Every string under a key that is shown to a reader must be real text.
fn check_text(v: &Value, path: &str, name: &str, bad: &mut Vec<String>) {
    const SHOWN: &[&str] = &[
        "display",
        "unit",
        "label",
        "text",
        "source",
        "statement",
        "unit_source",
        "what_ran",
        "summary",
        "requirement",
        "capability",
        "oracle",
        "tests",
        "title",
        "role",
        "seed_source",
        "command",
        "determinism",
        "git_commit_note",
        "scenario_sha256",
        "result_sha256",
    ];
    match v {
        Value::Object(m) => {
            for (k, val) in m {
                let p = format!("{path}.{k}");
                if SHOWN.contains(&k.as_str()) {
                    match val {
                        Value::String(s) if PLACEHOLDERS.contains(&s.trim()) => {
                            bad.push(format!("{name}: {p} = {s:?}"))
                        }
                        Value::Null if k != "statement" => bad.push(format!("{name}: {p} is null")),
                        _ => {}
                    }
                }
                check_text(val, &p, name, bad);
            }
        }
        Value::Array(a) => {
            for (i, e) in a.iter().enumerate() {
                check_text(e, &format!("{path}[{i}]"), name, bad);
            }
        }
        _ => {}
    }
}

fn section_ok<T>(s: &kshana::advanced_report::Section<T>) -> bool {
    !s.items.is_empty() || s.statement.as_ref().is_some_and(|t| !t.trim().is_empty())
}

#[test]
fn every_bundled_scenario_produces_a_complete_report_whose_labels_match_the_matrix() {
    let matrix = kshana::verification::verification_matrix();
    let scenarios = runnable_scenarios();
    assert!(!scenarios.is_empty(), "no scenario found under scenarios/");
    let mut bad: Vec<String> = Vec::new();
    let mut checked = 0usize;
    for path in &scenarios {
        let name = path.display().to_string();
        let (out, src, r) = report_of(path);

        // Purity: the builder is a function of its inputs.
        let inv = Invocation {
            scenario_arg: name.clone(),
            ..Default::default()
        };
        let again = build(&out, &src, &inv).expect("second build");
        assert_eq!(
            r.to_json(),
            again.to_json(),
            "{name}: report.json differs between two builds of one run"
        );
        assert_eq!(
            r.to_html(&out.svg),
            again.to_html(&out.svg),
            "{name}: report.html differs between two builds of one run"
        );

        // No empty section.
        for (sec, ok) in [
            ("inputs", section_ok(&r.inputs)),
            ("results.scalars", section_ok(&r.results.scalars)),
            ("results.series", section_ok(&r.results.series)),
            ("events", section_ok(&r.events)),
            ("not_modelled", section_ok(&r.not_modelled)),
        ] {
            if !ok {
                bad.push(format!("{name}: section {sec} is empty and says nothing"));
            }
        }
        if r.capabilities.rows.is_empty() {
            bad.push(format!("{name}: no verification-matrix row"));
        }
        if r.executive_summary.key_figures.is_empty() {
            bad.push(format!("{name}: no key figure in the executive summary"));
        }
        if r.executive_summary.summary.trim().is_empty() {
            bad.push(format!("{name}: empty one-line summary"));
        }

        // Labels match the verification matrix.
        for row in &r.capabilities.rows {
            let Some(it) = matrix.iter().find(|m| m.requirement == row.requirement) else {
                bad.push(format!(
                    "{name}: row {:?} is not a matrix requirement",
                    row.requirement
                ));
                continue;
            };
            if row.label != it.status.tag() {
                bad.push(format!(
                    "{name}: {:?} labelled {} but the matrix says {}",
                    row.requirement,
                    row.label,
                    it.status.tag()
                ));
            }
            if !it.oracle.is_empty() && row.oracle != it.oracle {
                bad.push(format!(
                    "{name}: {:?} oracle differs from the matrix",
                    row.requirement
                ));
            }
            if !it.tests.is_empty() && row.tests != it.tests {
                bad.push(format!(
                    "{name}: {:?} test evidence differs from the matrix",
                    row.requirement
                ));
            }
        }
        for ft in &r.capabilities.figure_tiers {
            match matrix.iter().find(|m| m.requirement == ft.requirement) {
                None => bad.push(format!(
                    "{name}: figure {} names {:?}, not a matrix requirement",
                    ft.path, ft.requirement
                )),
                Some(it) if ft.tier != "PARTIAL" && ft.tier != it.status.tag() => {
                    bad.push(format!(
                        "{name}: figure {} tiered {} but its row {:?} is {}",
                        ft.path,
                        ft.tier,
                        ft.requirement,
                        it.status.tag()
                    ))
                }
                Some(_) => {}
            }
        }

        // The digest is of the exact bytes run.
        assert_eq!(
            r.reproducibility.scenario_sha256,
            sha256_hex(src.as_bytes()),
            "{name}: scenario_sha256 is not the file's digest"
        );
        assert_eq!(
            r.reproducibility.result_sha256,
            sha256_hex(out.json.as_bytes()),
            "{name}: result_sha256 is not the result document's digest"
        );
        assert_eq!(r.reproducibility.argv[0], "kshana");
        assert_eq!(r.reproducibility.argv[1], name);

        // Campaigns and sweeps carry their aggregation.
        if r.kind == "campaign" || r.kind == "sweep" || r.kind == "sweep-nd" {
            match &r.aggregation {
                None => bad.push(format!(
                    "{name}: a {} run with no aggregation section",
                    r.kind
                )),
                Some(a) => {
                    if a.tables.iter().all(|t| t.rows.is_empty()) {
                        bad.push(format!("{name}: aggregation tables are all empty"));
                    }
                    if a.mode == "monte-carlo" {
                        for d in &a.distributions {
                            if d.p05.is_none() || d.p50.is_none() || d.p95.is_none() {
                                bad.push(format!(
                                    "{name}: distribution {} lacks a percentile",
                                    d.metric
                                ));
                            }
                            if d.counts.iter().sum::<usize>() != d.n {
                                bad.push(format!(
                                    "{name}: histogram of {} does not count every sample",
                                    d.metric
                                ));
                            }
                        }
                        if a.distributions.is_empty() {
                            bad.push(format!(
                                "{name}: a Monte Carlo campaign with no distribution"
                            ));
                        }
                    }
                }
            }
        }

        // No placeholder text in report.json.
        let doc: Value = serde_json::from_str(&r.to_json()).expect("report.json parses");
        check_text(&doc, "", &name, &mut bad);

        // No placeholder text in an HTML cell, and every section is on the page.
        let html = r.to_html(&out.svg);
        for needle in [
            ">NaN<",
            ">undefined<",
            ">null<",
            ">inf<",
            "<td></td>",
            "<td class=\"num\"></td>",
            "<th></th>",
        ] {
            if html.contains(needle) {
                bad.push(format!("{name}: report.html contains {needle}"));
            }
        }
        for id in [
            "summary",
            "inputs",
            "results",
            "events",
            "labels",
            "not-modelled",
            "reproducibility",
        ] {
            if !html.contains(&format!("<section id=\"{id}\"")) {
                bad.push(format!("{name}: report.html has no {id} section"));
            }
        }
        if !html.contains("@media print") || !html.contains("@page") {
            bad.push(format!("{name}: report.html has no print stylesheet"));
        }
        checked += 1;
    }
    assert!(
        bad.is_empty(),
        "{} problem(s) across the bundled reports:\n{}",
        bad.len(),
        bad.join("\n")
    );
    assert_eq!(checked, scenarios.len());
    eprintln!("advanced report: {checked} bundled scenarios reported with no empty section");
}

#[test]
fn re_running_a_scenario_gives_a_byte_identical_report() {
    for name in [
        "scenarios/clock-holdover.toml",
        "scenarios/l-band-waterfall-jamming.toml",
        "scenarios/campaign-sweep-jammer-power.toml",
        "scenarios/campaign-shared-jammer-sea-road.toml",
        "scenarios/campaign-jam-spoof-holdover-integrity.toml",
        "scenarios/sweep-nd-inertial.toml",
    ] {
        let p = std::path::Path::new(name);
        let (out_a, _, a) = report_of(p);
        let (out_b, _, b) = report_of(p);
        assert_eq!(
            a.to_json(),
            b.to_json(),
            "{name}: report.json differs between two runs"
        );
        assert_eq!(
            a.to_html(&out_a.svg),
            b.to_html(&out_b.svg),
            "{name}: report.html differs between two runs"
        );
    }
}

#[test]
fn a_monte_carlo_campaign_reports_its_percentiles_as_the_result_states_them() {
    let p = std::path::Path::new("scenarios/campaign-monte-carlo-clock-holdover.toml");
    let (out, _, r) = report_of(p);
    let doc: Value = serde_json::from_str(&out.json).unwrap();
    let a = r.aggregation.expect("aggregation");
    assert_eq!(a.mode, "monte-carlo");
    let table = &a.tables[0];
    let col = |c: &str| table.columns.iter().position(|x| x == c).unwrap();
    for row in &table.rows {
        let metric = row[0].as_str().unwrap();
        let m = &doc["monte_carlo"]["metrics"][metric];
        for c in ["p05", "p50", "p95", "mean", "std", "ci95_low", "ci95_high"] {
            assert_eq!(row[col(c)], m[c], "{metric}.{c}");
        }
    }
    assert_eq!(a.distributions.len(), table.rows.len());
    // The drawn distributions carry the result's own percentiles and span its samples.
    for d in &a.distributions {
        let m = &doc["monte_carlo"]["metrics"][d.metric.as_str()];
        assert_eq!(d.p05, m["p05"].as_f64(), "{}.p05", d.metric);
        assert_eq!(d.p50, m["p50"].as_f64(), "{}.p50", d.metric);
        assert_eq!(d.p95, m["p95"].as_f64(), "{}.p95", d.metric);
        let s: Vec<f64> = m["samples"]
            .as_array()
            .unwrap()
            .iter()
            .filter_map(Value::as_f64)
            .collect();
        assert_eq!(d.n, s.len(), "{}.n", d.metric);
        let lo = s.iter().cloned().fold(f64::INFINITY, f64::min);
        let hi = s.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
        assert!(
            d.edges.first().is_some_and(|e| *e <= lo),
            "{} lower edge",
            d.metric
        );
        assert!(
            d.edges.last().is_some_and(|e| *e >= hi),
            "{} upper edge",
            d.metric
        );
    }
}

/// A row that grades one input path is listed only when the run took that path: a
/// VALIDATED row the run never touched would claim evidence it does not have.
#[test]
fn a_path_specific_validated_row_is_listed_only_when_the_run_takes_that_path() {
    let rows = |name: &str| -> Vec<String> {
        let (_, _, r) = report_of(std::path::Path::new(name));
        r.capabilities
            .rows
            .iter()
            .map(|c| c.requirement.clone())
            .collect()
    };
    let has = |name: &str, req: &str| rows(name).iter().any(|r| r == req);
    let srtm = "SRTM digital-elevation reader on real terrain";
    let orbit = "Orbit propagation & determination";
    let record = "Holdover prediction from a measured clock record, checked on held-out data";
    // Synthetic DEM: the SRTM reader is never read.
    assert!(!has("scenarios/terrain-nav.toml", srtm));
    assert!(!has("scenarios/terrain-slam.toml", srtm));
    // An analytic Walker/Kepler constellation is not SGP4; a TLE constellation is.
    assert!(!has("scenarios/orbit-molniya.toml", orbit));
    assert!(has("scenarios/orbit-sgp4-gps.toml", orbit));
    assert!(has("scenarios/ephemeris.toml", orbit));
    // A preset oscillator is the modelled path, not the measured-record one.
    assert!(!has("scenarios/slot-timing-ocxo-leo.toml", record));
    let with_record = std::fs::read_to_string("scenarios/slot-timing-ocxo-leo.toml")
        .unwrap()
        .replace(
            "preset = \"ocxo\"",
            "record = { tau0_s = 1.0, time_error_ns = [PHASE] }",
        );
    let phase: Vec<String> = (0..600)
        .map(|i| {
            let x = i as f64;
            format!("{:.6}", 0.02 * (x * 0.37).sin() + 1e-4 * x * x / 600.0)
        })
        .collect();
    let with_record = with_record.replace("PHASE", &phase.join(", "));
    let out = kshana::api::run_toml(&with_record).expect("record path runs");
    let inv = Invocation {
        scenario_arg: "record.toml".to_string(),
        ..Default::default()
    };
    let r = build(&out, &with_record, &inv).expect("report");
    assert!(
        r.capabilities.rows.iter().any(|c| c.requirement == record),
        "a measured-record run must carry the measured-record row"
    );
}
