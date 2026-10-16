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
                "fcc066d175cbcc7cb362f7ba50b7654e8a4dea69e9c791740145e1bf842348c7",
            ),
            (
                "telemetry cef of the 0.35 result",
                "b94be1c4c4e9a454412ada8ec36de216689088b163b16bda346c11cf7829fe5c",
            ),
            (
                "telemetry leef of the 0.35 result",
                "41e303df190a4bf992ee75c03d3f990ee0ee104fa5cea3e9975d7f5c72d87fdd",
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
                "09796bf7ed8c3d5b5a924b578ae8507f20af5c1ef56756e126a2c97256923c07",
            ),
            (
                "telemetry cef of the 0.35 result",
                "4da9ffa0e6b26c17a70fa5f162d10a28a03d5ed30338cb015b63a5c42dedfa78",
            ),
            (
                "telemetry leef of the 0.35 result",
                "629c0fb567060fb9fa5c012571349609665eb07fbd079fd8e0ccbfebfcbc9694",
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
                "35fe030eb8e67867ff538e0524300b1a8c1a1fcd93e8bd5ce193de6098725b2c",
            ),
            (
                "telemetry cef of the 0.35 lines",
                "91da02a2d7ba3f2702c3b1c75bb615163e13ffb32f26d22441f5291698000630",
            ),
            (
                "telemetry leef of the 0.35 lines",
                "be6408acd3c3afbd4310bfab66317cf2d6db3cd0909443aad8221c313d89c0e7",
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
                "7a27a54197f7b4ef9eed2aad6d0a28764541b4a82844f00dc93d7a2d8c9e681a",
            ),
            (
                "0.36 telemetry prometheus of the lines",
                "a8690121254c4ea408fa3ff41eaffcf1701e85697ee5c1f49c711ee2a3444b8d",
            ),
            (
                "0.36 telemetry cef of the result",
                "22b589b677c128b233d7523ef18833f3cc30671f8fb99da074038f801fabab79",
            ),
            (
                "0.36 telemetry cef of the lines",
                "d09588b8c7d59ab8d4da78a56b9a13d7f45b04203b19b78dedad3b4ae55befd5",
            ),
            (
                "0.36 telemetry leef of the result",
                "b1c358cfab7af34493e804f7ec97483c491c851edc41b7bc744ecac8a73b4123",
            ),
            (
                "0.36 telemetry leef of the lines",
                "9c97442d9ce00931644b9f65f40300c3eddf8b4db8ea8c6752d2e11473b19ba9",
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
            "d35e330a35c88fc0c0cc8d5b184d6ed09b2fba1bd968a059244771bdabef443c",
        ),
        (
            "0.36 telemetry prometheus of the lines",
            "d32a40631bcb789dbdfa67d73eecbf25dfe99de3ed4c5214f81e577410ca9ae3",
        ),
        (
            "0.36 telemetry cef of the result",
            "2978bbb29ceea5e55a1990fe681ca401a5819527a7102ddf0d3f35fdb84d06f4",
        ),
        (
            "0.36 telemetry cef of the lines",
            "80202fcdfb6762704bad28c5bb4bea9d0b8618fefca2bc947e773cc26eec559a",
        ),
        (
            "0.36 telemetry leef of the result",
            "9909996146fee548fe337f945020606d4836d5f42ee97b4157a8a54a17a6f3c1",
        ),
        (
            "0.36 telemetry leef of the lines",
            "a421aa097fd0738baa0ce75867b9eef803f019c0eec61a9b7552d270e3967042",
        ),
    ];
    for ((name, text), (pin_name, pin)) in telemetry_036().iter().zip(before_label) {
        assert_eq!(name, pin_name);
        assert_ne!(sha(text), pin, "{name}: the label fields are present");
        assert_eq!(sha(&without_label_fields(name, text)), pin, "{name}");
    }
}
