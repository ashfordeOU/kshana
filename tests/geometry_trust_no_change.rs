// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust (0.36) adds a geometry assessment beside the trust score; it does not
//! change the score. This file proves it on the recorded outputs of the two committed example
//! sessions: with the keys 0.36 appended removed, every output is byte-identical to what
//! engine 0.35.0 wrote (release commit 35c1558d), and the outputs that gained nothing (the
//! CSV, the SVG, the one-line verdict, the `$PKSHT` sentence, telemetry of a 0.35 input) are
//! byte-identical as they stand.
//!
//! The pinned hashes were taken by running this file on the 0.35.0 release commit, where the
//! removal is a no-op. JSON is compared through `serde_json::Value` (keys sorted), so the
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

/// Keys added by 0.36 geometry-aware trust, at any depth. `schema` is the version string of
/// the excerpt document, which moves from 1.2 to 1.3 for them.
const APPENDED: [&str; 5] = [
    "geometry",
    "degradation",
    "explained_by_geometry",
    "geometry_model",
    "geometry_summary",
];

fn strip(v: &mut Value) {
    match v {
        Value::Object(m) => {
            for k in APPENDED {
                m.remove(k);
            }
            if m.contains_key("schema") {
                m.insert("schema".into(), Value::String("<schema>".into()));
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
        ("summary".to_string(), sha(&summary(&r))),
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
        ("excerpt document (0.35 view)".to_string(), sha(&legacy(&doc))),
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
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36) and key order of the JSON
    check(
        batch_hashes("examples/maritime-trust"),
        &[
            ("result.json (0.35 view)", "60cfab46ea66bd8be8d3c8da8c571e35c12b30319839f9430f303ac3dcebd086"),
            ("trust.csv", "947b30ee91573091af7052d2a12cf2a7191cd27dfa4e664e33b96585af010091"),
            ("trust.svg", "1c071042d8f799ddd0fd503be7d100366785491426ba87ebf8087ee1b7c01379"),
            ("summary", "730bbd019993dd51fb0d366363b84dd8a8aec460aa6500f8c92e04381ea197f8"),
            ("telemetry prometheus of the 0.35 result", "95f5aa3fac4c4d022bccc069c8b51a2b0984230e58b08db295991ee5a95b86d3"),
            ("telemetry cef of the 0.35 result", "35872b3245ed6e36185398a5c7828a1ccf15a2bd61e6c7124a442f973c5bd0db"),
            ("telemetry leef of the 0.35 result", "f1527d3e177f54203e1704e863d8f4b9a5d1842bcdf30bc2ea4eda2cfbe6b9ba"),
        ],
    );
}

#[test]
fn the_static_example_outputs_are_those_of_0_35_0_apart_from_the_appended_keys() {
    // PIN-SCOPE:    every batch output of examples/receiver-trust, appended keys removed
    // PIN-EXCLUDES: the keys in APPENDED (new in 0.36) and key order of the JSON
    check(
        batch_hashes("examples/receiver-trust"),
        &[
            ("result.json (0.35 view)", "c5917055e9717f24c0f5d80c702cd82b56b7d1a6b2b0c68ef6f0140d5616f494"),
            ("trust.csv", "761a99ed2563df8643e6e0dcd95ebce2e3c90a3a26c14f10ab22e1779b278231"),
            ("trust.svg", "670a93618d8cf6b75b5fdea58f6ffc393b44dabad0d4501ba073b67d5fbb34e4"),
            ("summary", "1822897e5ffd655a4495784b99df2e556dc87d3074d795bafc65688343383fb1"),
            ("telemetry prometheus of the 0.35 result", "97e0c3459e83826af5f5f38d0c8c49211ba54e3600f3f7c2c65e40db57f83e99"),
            ("telemetry cef of the 0.35 result", "db703adf972d5912dd29ed0fd7ec60753fadb3f423cb044e347f812d582abdd4"),
            ("telemetry leef of the 0.35 result", "43e533c9a7328970d7012eb160af293dbb0ca7fabba7f30d7a9f7ce415f0e323"),
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
            ("excerpt document (0.35 view)", "204a54847c4919299f0d7de8b81c351aef0d9fb3ce9d795d9f6164a96a5479f8"),
            ("live JSON lines (0.35 view)", "0573e84c9cfdf220bfd5f1a576864c2f057d09939e56066b174a8fb342849f57"),
            ("last $PKSHT", "1e2b8ad6dcff75d99356dde97908090c395f0b730aeb6df5b13ed1fab62853aa"),
            ("telemetry prometheus of the 0.35 lines", "0e09688fb521e648cb007bd9ac8b00d7f6a606bd4a11527bf2ed1d9ffeda6c87"),
            ("telemetry cef of the 0.35 lines", "d8019910c91daa2037c3e745d7f0e2e0e2e35a5aeaf09fd9e5b9aa75f887ce66"),
            ("telemetry leef of the 0.35 lines", "a792d9bc87093b839cc8d8dc4a722bb94ef26478677bac4a884a18934ced630a"),
        ],
    );
}
