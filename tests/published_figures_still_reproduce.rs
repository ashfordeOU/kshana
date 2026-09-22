// SPDX-License-Identifier: AGPL-3.0-only
//! The figures the README and the paper publish must still be what the engine produces.
//!
//! ## The gap
//!
//! Three kinds of published artefact carry engine output and none of them was checked:
//!
//! * The three README demo charts (`docs/assets/{clock-holdover,inertial-deadreckoning,
//!   orbit-gnss-challenged}.svg`) are literally the engine's `chart.svg` for a committed
//!   scenario. Nothing re-ran the scenario, so the day a plotted curve moved the README
//!   would have gone on showing the old one — with a footer stamping a version that never
//!   drew it.
//! * The paper's crossover studies (`paper/crossover/{clock,inertial}.json`) are the data
//!   behind two published figures. They were generated once and committed.
//! * The README states four figures of merit in prose next to `scenario-fom.png`
//!   — 6600 s and 2610 s of holdover, 100 % and 95.6 % availability. Prose is a copy, and a
//!   copy drifts.
//!
//! ## What is checked, and what is deliberately not rewritten
//!
//! The demo charts are compared byte-for-byte against a fresh run. The paper's JSON is
//! compared **value for value with `engine_version` excluded**, and the committed stamp is
//! left alone on purpose: that file is the record of the run whose figure a published paper
//! embeds, and silently restamping it would claim a provenance the PDF does not have. What
//! matters is the stronger property, which this test asserts — the current engine still
//! reproduces every published value. The prose figures are re-derived from a live run and
//! matched against the README text.
//!
//! When the three stamps were last reconciled the engine was at 0.27.1, the demo charts had
//! been drawn at 0.22.0 and the paper JSON at 0.20.0 — and every plotted value across all
//! five artefacts was identical. That is the result worth keeping true.

use std::fs;
use std::path::Path;

use serde_json::Value;

/// `(scenario toml, committed chart)` — the README's three engine-output demo figures.
const DEMO_CHARTS: [(&str, &str); 3] = [
    (
        "scenarios/clock-holdover.toml",
        "docs/assets/clock-holdover.svg",
    ),
    (
        "scenarios/imu-deadreckoning.toml",
        "docs/assets/inertial-deadreckoning.svg",
    ),
    (
        "scenarios/orbit-gnss-challenged.toml",
        "docs/assets/orbit-gnss-challenged.svg",
    ),
];

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn read(rel: &str) -> String {
    fs::read_to_string(root().join(rel)).unwrap_or_else(|e| panic!("cannot read {rel}: {e}"))
}

/// Replace the engine version in the chart footer with a placeholder.
///
/// The footer reads `Kshana v0.27.2 · scenario <hash> · kshana.dev`, so a release bump
/// changes every chart by one character while every plotted value stays put. That is a
/// completely different situation from a curve moving, and the guard should say which one
/// it found rather than leaving the reader to diff two 19 kB SVGs by eye.
fn without_version_stamp(svg: &str) -> String {
    let Some(at) = svg.find("Kshana v") else {
        return svg.to_string();
    };
    let start = at + "Kshana v".len();
    let end = svg[start..]
        .find(|c: char| !c.is_ascii_digit() && c != '.')
        .map_or(svg.len(), |o| start + o);
    format!("{}Kshana vX.Y.Z{}", &svg[..at], &svg[end..])
}

#[test]
fn every_readme_demo_chart_is_what_the_engine_emits_today() {
    for (toml, chart) in DEMO_CHARTS {
        let out = kshana::api::run_scenario(&read(toml))
            .unwrap_or_else(|e| panic!("{toml} does not run: {e:?}"));
        let committed = read(chart);
        if committed == out.svg {
            continue;
        }
        let only_the_stamp = without_version_stamp(&committed) == without_version_stamp(&out.svg);
        let diagnosis = if only_the_stamp {
            "ONLY the engine-version stamp in the footer moved — every plotted value is \
             identical. This is the routine release re-render."
        } else {
            "a PLOTTED VALUE moved, not just the version stamp. Work out what changed in \
             the engine and whether it is intended BEFORE re-rendering; this figure is \
             published in the README."
        };
        panic!(
            "{chart} is not what {toml} produces today.\n\n{diagnosis}\n\nFix: \
             `cargo run -- {toml}` and copy the emitted .chart.svg over {chart}."
        );
    }
}

#[test]
fn the_version_stamp_normaliser_hides_the_version_and_nothing_else() {
    let a = "<svg>x</svg>Kshana v0.27.1 · scenario abc · kshana.dev";
    let b = "<svg>x</svg>Kshana v9.9.9 · scenario abc · kshana.dev";
    let moved = "<svg>y</svg>Kshana v0.27.1 · scenario abc · kshana.dev";
    assert_eq!(
        without_version_stamp(a),
        without_version_stamp(b),
        "two charts differing only in the version stamp must normalise equal"
    );
    assert_ne!(
        without_version_stamp(a),
        without_version_stamp(moved),
        "a normaliser that also hid a moved plotted value would make the guard blind"
    );
    assert!(
        without_version_stamp(a).contains("scenario abc"),
        "the scenario hash must survive normalisation"
    );
    assert_eq!(
        without_version_stamp("no footer here"),
        "no footer here",
        "a chart with no footer must pass through untouched"
    );
}

/// Skipped under `cargo-tarpaulin` (`cfg(tarpaulin)`, set only during a coverage build).
///
/// The two paper studies take ~107 s uninstrumented, and LLVM instrumentation multiplies
/// that ~20-30x — thirty-five to fifty minutes added to a job whose healthy steady state is
/// 91-94 minutes and which has a documented history of being killed at its cap (see the
/// `coverage` job in ci.yml). The skip is coverage-neutral: `src/crossover.rs`'s own unit
/// tests already call `InertialCrossover::paper_inertial().run()` and `ClockHoldover::run()`,
/// so the same lines are executed either way. What the coverage build gives up is the
/// REPRODUCTION check — which is not a coverage question, and still runs on every ordinary
/// `cargo test`, including the gate.
#[test]
#[cfg_attr(tarpaulin, ignore)]
fn the_papers_crossover_studies_still_reproduce_value_for_value() {
    let fresh_inertial = kshana::crossover::InertialCrossover::paper_inertial().run();
    let fresh_clock = kshana::crossover::ClockHoldover::paper_clocks().run();

    for (name, fresh) in [
        ("paper/crossover/inertial.json", to_value(&fresh_inertial)),
        ("paper/crossover/clock.json", to_value(&fresh_clock)),
    ] {
        let committed: Value =
            serde_json::from_str(&read(name)).unwrap_or_else(|e| panic!("{name} is not JSON: {e}"));

        let stamp = committed
            .get("engine_version")
            .and_then(Value::as_str)
            .unwrap_or_else(|| panic!("{name} carries no engine_version"));
        assert!(
            stamp.split('.').count() == 3 && stamp.split('.').all(|p| p.parse::<u32>().is_ok()),
            "{name} engine_version {stamp:?} is not a release version"
        );

        let mut diffs = Vec::new();
        diff(&committed, &fresh, "", &mut diffs);
        diffs.retain(|d| !d.starts_with(".engine_version:"));

        assert!(
            diffs.is_empty(),
            "{} published value(s) in {name} are no longer what the engine produces:\n  {}\n\n\
             This file is the data behind a figure a published paper embeds. A moved value \
             is a REVISION, not a re-render: work out what changed in the engine, say so in \
             the changelog, and take the paper's revision to the founder. Do not quietly \
             regenerate it.",
            diffs.len(),
            diffs.join("\n  ")
        );
    }
}

#[test]
fn the_readme_states_the_figures_of_merit_the_engine_produces() {
    let out = kshana::api::run_scenario(&read("scenarios/clock-holdover.toml"))
        .expect("clock-holdover must run");
    let v: Value = serde_json::from_str(&out.json).expect("result json");

    let fom = |side: &str, key: &str| -> f64 {
        v[side]["fom"][key]
            .as_f64()
            .unwrap_or_else(|| panic!("clock-holdover {side}.fom.{key} is missing"))
    };

    let readme = read("README.md");
    // The caption sits in the alt text of the scenario-fom figure; check the whole file so a
    // reworded caption that keeps the numbers still passes, and a changed number does not.
    let expect = [
        (
            format!("{} s", fom("quantum", "holdover_s") as i64),
            "quantum holdover",
        ),
        (
            format!("{} s", fom("classical", "holdover_s") as i64),
            "classical holdover",
        ),
        (
            format!("{:.0}%", fom("quantum", "availability") * 100.0),
            "quantum availability",
        ),
        (
            format!("{:.1}%", fom("classical", "availability") * 100.0),
            "classical availability",
        ),
    ];

    let missing: Vec<String> = expect
        .iter()
        .filter(|(text, _)| !readme.contains(text.as_str()))
        .map(|(text, what)| format!("{what} = {text}"))
        .collect();

    assert!(
        missing.is_empty(),
        "the README states clock-holdover figures the engine no longer produces; missing \
         from README.md: {}\n\nThe prose next to scenario-fom.png is a COPY of engine \
         output. Update the caption to the live figures — and if a figure moved, the PNG \
         beside it is stale too.",
        missing.join(", ")
    );
}

fn to_value<T: serde::Serialize>(v: &T) -> Value {
    serde_json::to_value(v).expect("crossover study must serialise")
}

/// Every leaf where `a` and `b` disagree, as `path: left -> right`.
fn diff(a: &Value, b: &Value, path: &str, out: &mut Vec<String>) {
    match (a, b) {
        (Value::Object(x), Value::Object(y)) => {
            let mut keys: Vec<&String> = x.keys().chain(y.keys()).collect();
            keys.sort();
            keys.dedup();
            for k in keys {
                match (x.get(k), y.get(k)) {
                    (Some(u), Some(v)) => diff(u, v, &format!("{path}.{k}"), out),
                    (Some(_), None) => out.push(format!("{path}.{k}: dropped")),
                    (None, Some(_)) => out.push(format!("{path}.{k}: added")),
                    (None, None) => unreachable!(),
                }
            }
        }
        (Value::Array(x), Value::Array(y)) => {
            if x.len() != y.len() {
                out.push(format!("{path}: length {} -> {}", x.len(), y.len()));
                return;
            }
            for (i, (u, v)) in x.iter().zip(y).enumerate() {
                diff(u, v, &format!("{path}[{i}]"), out);
            }
        }
        _ => {
            if a != b {
                out.push(format!("{path}: {a} -> {b}"));
            }
        }
    }
}
