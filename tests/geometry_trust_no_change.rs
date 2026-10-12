// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust (0.36) adds a geometry assessment, a geometry monitor in the vessel
//! score and a class on every deduction. With good geometry (the monitor costs nothing below
//! its 0.5 onset) or unknown geometry (it does not run), no score changes. This file proves it
//! on the recorded outputs of the two committed example sessions, whose geometry is good
//! (vessel demo) or for which no score exists (static example): with the keys 0.36 appended
//! removed (`score_model.weights.geometry` included), every output is byte-identical to what
//! engine 0.35.0 wrote (release commit 35c1558d), and the outputs that gained nothing (the
//! CSV, the SVG, the one-line verdict, the `$PKSHT` sentence, telemetry of a 0.35 input) are
//! byte-identical as they stand.
//!
//! The pinned hashes were taken by running this file on the 0.35.0 release commit, checked out
//! at a different path from this one, where the removal is a no-op. The scenario hash covers the
//! resolved (absolute) log path, so it is replaced by a placeholder in the result JSON and in the
//! summary line: the pins hold for any checkout. JSON is compared through `serde_json::Value` (keys sorted), so the
//! comparison is of content, not of key order; the appended keys are listed in `APPENDED`
//! and documented in `docs/RECEIVER-TRUST.md` ("Geometry").

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
    let s = summary(r);
    let hex = &s["scenario ".len().."scenario ".len() + 12];
    assert!(s.starts_with("scenario ") && hex.bytes().all(|b| b.is_ascii_hexdigit()));
    s.replacen(hex, "<scenario_hash>", 1)
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
fn the_vessel_demo_outputs_are_those_of_0_35_0_apart_from_the_appended_keys() {
    // PIN-SCOPE:    every batch output of examples/maritime-trust, appended keys removed
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36), scenario_hash (path-dependent), key order
    check(
        batch_hashes("examples/maritime-trust"),
        &[
            (
                "result.json (0.35 view)",
                "c173f350ede11074e0a5200ecde004f21061e8094bad7168d96962bbc75cabfb",
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
                "95f5aa3fac4c4d022bccc069c8b51a2b0984230e58b08db295991ee5a95b86d3",
            ),
            (
                "telemetry cef of the 0.35 result",
                "35872b3245ed6e36185398a5c7828a1ccf15a2bd61e6c7124a442f973c5bd0db",
            ),
            (
                "telemetry leef of the 0.35 result",
                "f1527d3e177f54203e1704e863d8f4b9a5d1842bcdf30bc2ea4eda2cfbe6b9ba",
            ),
        ],
    );
}

#[test]
fn the_static_example_outputs_are_those_of_0_35_0_apart_from_the_appended_keys() {
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
                "97e0c3459e83826af5f5f38d0c8c49211ba54e3600f3f7c2c65e40db57f83e99",
            ),
            (
                "telemetry cef of the 0.35 result",
                "db703adf972d5912dd29ed0fd7ec60753fadb3f423cb044e347f812d582abdd4",
            ),
            (
                "telemetry leef of the 0.35 result",
                "43e533c9a7328970d7012eb160af293dbb0ca7fabba7f30d7a9f7ce415f0e323",
            ),
        ],
    );
}

#[test]
fn the_replayed_stream_is_that_of_0_35_0_apart_from_the_appended_keys() {
    // PIN-SCOPE:    the excerpt document, every live JSON line and the last $PKSHT of the demo
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36), the schema string and key order
    check(
        excerpt_hashes(),
        &[
            (
                "excerpt document (0.35 view)",
                "204a54847c4919299f0d7de8b81c351aef0d9fb3ce9d795d9f6164a96a5479f8",
            ),
            (
                "live JSON lines (0.35 view)",
                "0573e84c9cfdf220bfd5f1a576864c2f057d09939e56066b174a8fb342849f57",
            ),
            (
                "last $PKSHT",
                "1e2b8ad6dcff75d99356dde97908090c395f0b730aeb6df5b13ed1fab62853aa",
            ),
            (
                "telemetry prometheus of the 0.35 lines",
                "0e09688fb521e648cb007bd9ac8b00d7f6a606bd4a11527bf2ed1d9ffeda6c87",
            ),
            (
                "telemetry cef of the 0.35 lines",
                "d8019910c91daa2037c3e745d7f0e2e0e2e35a5aeaf09fd9e5b9aa75f887ce66",
            ),
            (
                "telemetry leef of the 0.35 lines",
                "a792d9bc87093b839cc8d8dc4a722bb94ef26478677bac4a884a18934ced630a",
            ),
        ],
    );
}

/// The telemetry of the real 0.36 outputs of the vessel demo, geometry series and class labels
/// included: a regression pin taken on this branch (not a 0.35 identity), so a change to the
/// 0.36 series is seen.
fn telemetry_036_hashes() -> Vec<(String, String)> {
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
            sha(&telemetry(&json, TelemetryInput::Result, f)),
        ));
        out.push((
            format!("0.36 telemetry {name} of the lines"),
            sha(&telemetry(&lines, TelemetryInput::Jsonl, f)),
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
                "e79d328d92077016fdeccbcfaa1e70cab207d7509d67fe3305fe2021931e7dbc",
            ),
            (
                "0.36 telemetry prometheus of the lines",
                "9714c93f47f8b7efae4697290ff5afa0816e32f5462a1ce491ed73f6bdea19cb",
            ),
            (
                "0.36 telemetry cef of the result",
                "a6d35405d856532b3d4606ed4c44c37cb48d8ce0c118a98a37482bf166fad71a",
            ),
            (
                "0.36 telemetry cef of the lines",
                "73780319cc14859bf823f84d3c4f4b02c19b3ccc280e7112b6414c7831ede560",
            ),
            (
                "0.36 telemetry leef of the result",
                "776bb3c674efb22f615112726967b30c54d412f900e635e5be4a1b782cd4eb83",
            ),
            (
                "0.36 telemetry leef of the lines",
                "7bc3ef383458431a6166bc131ddb2f88140aa002db212605947e490b53947d23",
            ),
        ],
    );
}
