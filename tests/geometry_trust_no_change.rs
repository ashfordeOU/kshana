// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust (0.36) adds a geometry assessment and label, a geometry monitor in the
//! vessel score and a class on every deduction. No score changes unless the geometry is poor
//! (the monitor deducts nothing at or below its thresholds, and does not run when the geometry
//! is unknown); the label is always reported. This file proves it on the recorded outputs of the
//! two committed example sessions, whose geometry is good (vessel demo) or for which no score
//! exists (static example): with the keys 0.36 appended removed, every output is byte-identical
//! to what engine 0.35.0 wrote (release commit 35c1558d), and the outputs that gained nothing
//! (the CSV, the SVG, the one-line verdict, the `$PKSHT` sentence, telemetry of a 0.35 input)
//! are byte-identical as they stand. `tests/geometry_corpus_identity.rs` does the same for every
//! committed vessel NMEA corpus, GPS-only open sky included.
//!
//! Re-based by STUDIO-15 (docs/revisions/STUDIO15-portable-math-rebaseline.md): the hashes that moved are
//! now the "0.36 portable" ones (engine on portable maths); the 0.35.0 values they replaced are in
//! `tests/fixtures/geometry_trust/pins_0.35.0.txt` (pinned by hash in `geometry_corpus_identity.rs`).
//!
//! The telemetry exporters (Prometheus, CEF, LEEF) write the engine version, so their pins hold for one
//! version: the 0.36.0 version bump re-blessed them (docs/revisions/STUDIO15-pins-0.36.0-version.md); the
//! result, CSV, SVG, verdict and `$PKSHT` pins carry no version and did not move.
//!
//! The 0.35.0 hashes were taken by running this file on the 0.35.0 release commit, checked out
//! at a different path from this one, where the removal is a no-op. The scenario hash covers the
//! resolved (absolute) log path, so it is replaced by a placeholder in the result JSON and in the
//! summary line: the pins hold for any checkout. JSON is compared through `serde_json::Value`
//! (keys sorted), so the comparison is of content, not of key order; the appended keys are
//! listed in `APPENDED` and documented in `docs/RECEIVER-TRUST.md` ("Geometry").

use std::path::Path;

use serde_json::Value;
use sha2::{Digest, Sha256};

use kshana::receiver_trust::assess::assess_stream_excerpt;
use kshana::receiver_trust::scenario::{
    resolve_paths, run_receiver_trust, summary, to_csv, to_svg, ReceiverTrustScenario,
};
use kshana::surface::{trust_telemetry, TelemetryFormat, TelemetryInput, TelemetryOptions};

const ROOT: &str = env!("CARGO_MANIFEST_DIR");

/// Keys added by 0.36 geometry-aware trust, at any depth (`geometry` is also the geometry
/// monitor's entry in `score_model.weights`; `class` is on every deduction). `schema` is the
/// version string of the excerpt document, which moves from 1.2 to 1.3 for them.
/// `scenario_hash` is replaced too: it covers the resolved (absolute) log path, so it
/// depends on where the repository is checked out.
const APPENDED: [&str; 4] = ["geometry", "geometry_model", "geometry_summary", "class"];

fn strip(v: &mut Value) {
    match v {
        Value::Object(m) => {
            for k in APPENDED {
                m.remove(k);
            }
            if let Some(Value::Array(run)) = m.get_mut("monitors_run") {
                // `geometry` (0.36) is appended to the list when the geometry monitor decided.
                if run.last() == Some(&Value::String("geometry".into())) {
                    run.pop();
                }
            }
            if m.contains_key("schema") {
                m.insert("schema".into(), Value::String("<schema>".into()));
            }
            if m.contains_key("scenario_hash") {
                m.insert(
                    "scenario_hash".into(),
                    Value::String("<scenario_hash>".into()),
                );
            }
            m.values_mut().for_each(strip);
        }
        Value::Array(a) => a.iter_mut().for_each(strip),
        _ => {}
    }
}

/// The 0.35 view of a JSON document: the appended keys removed, keys sorted.
fn legacy(json: &str) -> String {
    let mut v: Value = serde_json::from_str(json).unwrap();
    strip(&mut v);
    serde_json::to_string(&v).unwrap()
}

/// The one-line summary with its `scenario <12 hex>` prefix replaced: the scenario hash covers
/// the resolved (absolute) log path, so it differs between checkouts.
fn summary_view(r: &kshana::receiver_trust::scenario::ReceiverTrustResult) -> String {
    let s = without_geometry_count(&summary(r), r);
    let hex = &s["scenario ".len().."scenario ".len() + 12];
    assert!(s.starts_with("scenario ") && hex.bytes().all(|b| b.is_ascii_hexdigit()));
    s.replacen(hex, "<scenario_hash>", 1)
}

/// The 0.35 count in the summary's "| monitors N |": `geometry` (0.36), listed last in
/// `monitors_run` when it decided, is not counted.
fn without_geometry_count(
    s: &str,
    r: &kshana::receiver_trust::scenario::ReceiverTrustResult,
) -> String {
    // By name, so this file also builds on 0.35.0 (no `Monitor::Geometry`) to take the pins.
    let run = serde_json::to_value(&r.monitors_run).unwrap();
    if !run
        .as_array()
        .unwrap()
        .contains(&Value::String("geometry".into()))
    {
        return s.to_string();
    }
    let n = r.monitors_run.len();
    let (from, to) = (
        format!("| monitors {n} |"),
        format!("| monitors {} |", n - 1),
    );
    assert!(s.contains(&from), "{s}");
    s.replacen(&from, &to, 1)
}

fn sha(s: &str) -> String {
    format!("{:x}", Sha256::digest(s.as_bytes()))
}

fn load(dir: &str) -> ReceiverTrustScenario {
    let d = Path::new(ROOT).join(dir);
    let mut scn: ReceiverTrustScenario =
        toml::from_str(&std::fs::read_to_string(d.join("session.toml")).unwrap()).unwrap();
    resolve_paths(&mut scn, &d);
    scn
}

fn telemetry(input: &str, kind: TelemetryInput, format: TelemetryFormat) -> String {
    let opts = TelemetryOptions {
        syslog_all: true,
        ..TelemetryOptions::default()
    };
    trust_telemetry(input, format, "ops-gw1", kind, opts, 64 << 20).unwrap()
}

/// `(name, sha256)` of every output of one batch session, in the 0.35 view.
fn batch_hashes(dir: &str) -> Vec<(String, String)> {
    let r = run_receiver_trust(&load(dir)).unwrap();
    let json = serde_json::to_string_pretty(&r).unwrap();
    let old = legacy(&json);
    let mut out = vec![
        ("result.json (0.35 view)".to_string(), sha(&old)),
        ("trust.csv".to_string(), sha(&to_csv(&r))),
        ("trust.svg".to_string(), sha(&to_svg(&r))),
        ("summary".to_string(), sha(&summary_view(&r))),
    ];
    for (name, f) in [
        ("prometheus", TelemetryFormat::Prometheus),
        ("cef", TelemetryFormat::Cef),
        ("leef", TelemetryFormat::Leef),
    ] {
        out.push((
            format!("telemetry {name} of the 0.35 result"),
            sha(&telemetry(&old, TelemetryInput::Result, f)),
        ));
    }
    out
}

fn excerpt_hashes() -> Vec<(String, String)> {
    let dir = Path::new(ROOT).join("examples/maritime-trust");
    let session = std::fs::read_to_string(dir.join("session.toml")).unwrap();
    let log = std::fs::read(dir.join("tallinn-helsinki.nmea")).unwrap();
    let a = assess_stream_excerpt(&session, &log).unwrap();
    let doc = serde_json::to_string(&a).unwrap();
    let lines: String = a
        .epochs
        .iter()
        .map(|e| legacy(&e.to_json_line()) + "\n")
        .collect();
    let mut out = vec![
        (
            "excerpt document (0.35 view)".to_string(),
            sha(&legacy(&doc)),
        ),
        ("live JSON lines (0.35 view)".to_string(), sha(&lines)),
        (
            "last $PKSHT".to_string(),
            sha(a.last_pksht.as_deref().unwrap_or("")),
        ),
    ];
    for (name, f) in [
        ("prometheus", TelemetryFormat::Prometheus),
        ("cef", TelemetryFormat::Cef),
        ("leef", TelemetryFormat::Leef),
    ] {
        out.push((
            format!("telemetry {name} of the 0.35 lines"),
            sha(&telemetry(&lines, TelemetryInput::Jsonl, f)),
        ));
    }
    out
}

fn check(got: Vec<(String, String)>, want: &[(&str, &str)]) {
    for (name, h) in &got {
        eprintln!("(\"{name}\", \"{h}\"),");
    }
    let got: Vec<(&str, &str)> = got.iter().map(|(a, b)| (a.as_str(), b.as_str())).collect();
    assert_eq!(got, want);
}

#[test]
fn the_vessel_demo_outputs_are_those_of_0_36_portable_apart_from_the_appended_keys() {
    // PIN-SCOPE:    every batch output of examples/maritime-trust, appended keys removed
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36), scenario_hash (path-dependent), key order
    check(
        batch_hashes("examples/maritime-trust"),
        &[
            (
                "result.json (0.35 view)",
                "d1258960e86bd0745d68fc6440eae2e79f5ce98707e89f2bd3a0086c74e07d6e",
            ),
            (
                "trust.csv",
                "947b30ee91573091af7052d2a12cf2a7191cd27dfa4e664e33b96585af010091",
            ),
            (
                "trust.svg",
                "1c071042d8f799ddd0fd503be7d100366785491426ba87ebf8087ee1b7c01379",
            ),
            (
                "summary",
                "dc4d44710b73596aea6381378c6b76463c7c5bc9b999ab7ae6cbbf94ba40d538",
            ),
            (
                "telemetry prometheus of the 0.35 result",
                "489090de9b38dae094d797e69c3c05d7d84c9ba210b7e362bf4f49863168fdfb",
            ),
            (
                "telemetry cef of the 0.35 result",
                "9b3a6d41236a0262e1c95a0f42b8818f3968e8fcd3f0d01392807b256e1a3d62",
            ),
            (
                "telemetry leef of the 0.35 result",
                "a759ae83d60b57a12da77a22d51c745cc450b81515db90a831d540739ab35a7b",
            ),
        ],
    );
}

#[test]
fn the_static_example_outputs_are_those_of_0_36_portable_apart_from_the_appended_keys() {
    // PIN-SCOPE:    every batch output of examples/receiver-trust, appended keys removed
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36), scenario_hash (path-dependent), key order
    check(
        batch_hashes("examples/receiver-trust"),
        &[
            (
                "result.json (0.35 view)",
                "13bdaba51c9c73a494c8e52affd28e61a5d7c6a54ca042af75aca2ec1338072a",
            ),
            (
                "trust.csv",
                "761a99ed2563df8643e6e0dcd95ebce2e3c90a3a26c14f10ab22e1779b278231",
            ),
            (
                "trust.svg",
                "670a93618d8cf6b75b5fdea58f6ffc393b44dabad0d4501ba073b67d5fbb34e4",
            ),
            (
                "summary",
                "855ceacae4b3f91dd8ff602d69f82e2ef9caec342e303db7e9815b2f8e634740",
            ),
            (
                "telemetry prometheus of the 0.35 result",
                "e0e490aa8a57ab054e52f6000e26f68f7ef9b70aaa828f6bed49413b3d375718",
            ),
            (
                "telemetry cef of the 0.35 result",
                "ffc93aecf9696d2f878d137ada16a0dfc7686408900b45910480820870cfb21c",
            ),
            (
                "telemetry leef of the 0.35 result",
                "8c42b03b2959ed04f78264a48348b496c22562069d0d51c0bedc88ff76eb6cb6",
            ),
        ],
    );
}

#[test]
fn the_replayed_stream_is_that_of_0_36_portable_apart_from_the_appended_keys() {
    // PIN-SCOPE:    the excerpt document, every live JSON line and the last $PKSHT of the demo
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36), the schema string and key order
    check(
        excerpt_hashes(),
        &[
            (
                "excerpt document (0.35 view)",
                "69f9f15204dee9017b89674dc0d28bdbfefc496422f9b1c079aa18d8c670d888",
            ),
            (
                "live JSON lines (0.35 view)",
                "a243ff3b1c327ca295122f2aa9a764bb00a06af2f2c6913158f0c1e96d99e0f7",
            ),
            (
                "last $PKSHT",
                "1e2b8ad6dcff75d99356dde97908090c395f0b730aeb6df5b13ed1fab62853aa",
            ),
            (
                "telemetry prometheus of the 0.35 lines",
                "0f06df9e4d3bc819f84c2f79bf19904898083d6a5a033524b2366900cc4f3a9a",
            ),
            (
                "telemetry cef of the 0.35 lines",
                "aa58063c3b3123d50ecbf9d0b960dc26c3ab841f6ab70c24c6c41d32affc3ece",
            ),
            (
                "telemetry leef of the 0.35 lines",
                "96a8d32d3496e7f85aa90ca24e67cd8c0bf3fbede49d731323103bd5c0754760",
            ),
        ],
    );
}

/// The telemetry of the real 0.36 outputs of the vessel demo, geometry series and class labels
/// included: a regression pin taken on this branch (not a 0.35 identity), so a change to the
/// 0.36 series is seen.
fn telemetry_036_hashes() -> Vec<(String, String)> {
    telemetry_036()
        .into_iter()
        .map(|(n, text)| (n, sha(&text)))
        .collect()
}

/// `(name, text)` of the demo's 0.36 telemetry.
fn telemetry_036() -> Vec<(String, String)> {
    let r = run_receiver_trust(&load("examples/maritime-trust")).unwrap();
    let json = serde_json::to_string_pretty(&r).unwrap();
    let dir = Path::new(ROOT).join("examples/maritime-trust");
    let session = std::fs::read_to_string(dir.join("session.toml")).unwrap();
    let log = std::fs::read(dir.join("tallinn-helsinki.nmea")).unwrap();
    let a = assess_stream_excerpt(&session, &log).unwrap();
    let lines: String = a.epochs.iter().map(|e| e.to_json_line() + "\n").collect();
    let mut out = Vec::new();
    for (name, f) in [
        ("prometheus", TelemetryFormat::Prometheus),
        ("cef", TelemetryFormat::Cef),
        ("leef", TelemetryFormat::Leef),
    ] {
        out.push((
            format!("0.36 telemetry {name} of the result"),
            telemetry(&json, TelemetryInput::Result, f),
        ));
        out.push((
            format!("0.36 telemetry {name} of the lines"),
            telemetry(&lines, TelemetryInput::Jsonl, f),
        ));
    }
    out
}

#[test]
fn the_0_36_telemetry_of_the_vessel_demo_is_pinned() {
    // PIN-SCOPE:    Prometheus, CEF and LEEF of the demo's 0.36 result and live lines, as written
    // PIN-EXCLUDES: nothing; the build version string is part of the Prometheus text
    check(
        telemetry_036_hashes(),
        &[
            (
                "0.36 telemetry prometheus of the result",
                "fbd97f925c893e6edb0592a45200f09099e8db4bd8aa419a6223b7dfe76a5517",
            ),
            (
                "0.36 telemetry prometheus of the lines",
                "17021837f688d6a04e32247947b0ffd39eb9a98f27c6fe83d5e900cbdaeecced",
            ),
            (
                "0.36 telemetry cef of the result",
                "94058dbfecc1487d73c960e1130938cfd6b2d4a3f2beff40c76fc38c46d0c17b",
            ),
            (
                "0.36 telemetry cef of the lines",
                "e82f5615785e560d2159a9c489c945b6c3f236cec1c95c6431acffac9a0988d5",
            ),
            (
                "0.36 telemetry leef of the result",
                "7c3700f9d96980db11bfee68f856930ba4fe3d2d7393cc7778a394b3de936844",
            ),
            (
                "0.36 telemetry leef of the lines",
                "81c9484e29405cee90c8d744ffb4d3e9a4725b4c4e9c3d43641c252e69a332e6",
            ),
        ],
    );
}

/// The demo's 0.36 telemetry with the geometry label fields removed (Prometheus
/// `kshana_trust_geometry_label` and `_vdop`; LEEF `geoLabel`, `geoPdop`, `geoVdop`, `geoUsed`;
/// CEF the third `cs6` field and `cn1`).
fn without_label_fields(name: &str, text: &str) -> String {
    if name.contains("prometheus") {
        return text
            .split_inclusive('\n')
            .filter(|l| {
                !["kshana_trust_geometry_label", "kshana_trust_geometry_vdop"]
                    .iter()
                    .any(|m| l.starts_with(m) || l.contains(&format!(" {m} ")))
            })
            .collect();
    }
    let sep = if name.contains("leef") { '^' } else { ' ' };
    text.split_inclusive('\n')
        .map(|line| {
            let (body, nl) = line.strip_suffix('\n').map_or((line, ""), |b| (b, "\n"));
            let kept: Vec<String> = body
                .split(sep)
                .filter(|a| {
                    !["geoLabel=", "geoPdop=", "geoVdop=", "geoUsed="]
                        .iter()
                        .any(|k| sep == '^' && a.starts_with(k))
                        && !(sep == ' '
                            && (a.starts_with("cn1Label=geometryUsedSatellites")
                                || a.starts_with("cn1=")))
                })
                .map(|a| match a.strip_prefix("cs6=") {
                    Some(v) if v.matches(';').count() == 2 => {
                        let f: Vec<&str> = v.split(';').collect();
                        if f[1].is_empty() {
                            format!("cs6={}", f[0])
                        } else {
                            format!("cs6={};{}", f[0], f[1])
                        }
                    }
                    _ => a.to_string(),
                })
                .collect();
            kept.join(&sep.to_string()) + nl
        })
        .collect()
}

#[test]
fn the_label_fields_are_appended_to_the_0_36_telemetry_and_nothing_else_moves() {
    // PIN-SCOPE:    the demo's 0.36 telemetry with the label fields removed equals the output pinned
    //               before the label existed (commit 6609ea54)
    // PIN-EXCLUDES: the label fields themselves, pinned above
    let before_label: [(&str, &str); 6] = [
        (
            "0.36 telemetry prometheus of the result",
            "355b0ab8c132cd9a327f1676eeb3ecbb7481d15b4204afe27e93abf6899f0748",
        ),
        (
            "0.36 telemetry prometheus of the lines",
            "a8889df9659554ba66548cfe4b1038ff36c08bbca9af05ccc421869638e0f257",
        ),
        (
            "0.36 telemetry cef of the result",
            "78d698b0d9529339c418a53995969dfdcb23b0f15de5ebf2f91fb1ef698135d6",
        ),
        (
            "0.36 telemetry cef of the lines",
            "58d35cbdd31e1945d85223d7fab2f69ffcd8c21bc0f4f99304cc1e04163b663d",
        ),
        (
            "0.36 telemetry leef of the result",
            "15fc52de4e9dd01ca809182631b3eacc3591e7d8d7493b9a4b55f41edbb77c57",
        ),
        (
            "0.36 telemetry leef of the lines",
            "42d93607c0432c0c4b373c19f21da294f9f1f9f8d96cb89768bd1300593eff48",
        ),
    ];
    for ((name, text), (pin_name, pin)) in telemetry_036().iter().zip(before_label) {
        assert_eq!(name, pin_name);
        assert_ne!(sha(text), pin, "{name}: the label fields are present");
        assert_eq!(sha(&without_label_fields(name, text)), pin, "{name}");
    }
}
