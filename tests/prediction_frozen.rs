// SPDX-License-Identifier: AGPL-3.0-only
//! Guard for the pre-registered predictions in `docs/predictions/`.
//!
//! Two guards.
//!
//! 1. `the_frozen_predictions_have_not_moved`: the frozen TOML and the frozen result JSON are
//!    the bytes that were frozen (their SHA-256). The result was produced by the 0.35 engine on
//!    the host's maths library (linux x86_64, Rust 1.93.0); it is the record of the
//!    pre-registration and is never regenerated. Since 0.36 (STUDIO-15) the engine computes
//!    with portable maths, so it no longer reproduces those bytes; the frozen file is
//!    historical, documented as such with its hash.
//! 2. `the_portable_rerun_is_pinned_and_agrees_with_the_frozen_result`: the re-run of the same
//!    frozen TOML on the 0.36 portable maths is stored beside the frozen result
//!    (`*.portable-0.36.json`), pinned by its SHA-256, reproduced byte for byte on every
//!    platform, and agrees with the frozen result in shape exactly and every number to a
//!    relative 1e-6 (the tolerance the prediction record states). No bar is changed.
//!    `KSHANA_BLESS_PORTABLE=1` rewrites the portable files.
//!
//! PIN-SCOPE:    the SHA-256 of each frozen TOML and of each stored result JSON, as frozen
//!               (inputs at c05dac1d), and of each portable re-run
//! PIN-EXCLUDES: nothing in the result; the run's one-line summary and SVG are not frozen
//!
//! If this fails: do not edit the frozen prediction. Add a new, dated prediction file and keep
//! the old one (docs/predictions/lunar-reference-station.md, "Scoring protocol").

use serde_json::Value;
use sha2::{Digest, Sha256};

/// `(frozen TOML, its SHA-256, stored result JSON, its SHA-256, portable-maths re-run JSON,
/// its SHA-256)`.
const FROZEN: [(&str, &str, &str, &str, &str, &str); 2] = [
    (
        "docs/predictions/lunar-reference-station.region.toml",
        "c265df1701a441df43b497eba39c63dfbe18bfd53087052315f49c99f105ec13",
        "docs/predictions/lunar-reference-station.region.result.json",
        "d108f77ecca57902774fdb3d9f62a8b8318c8435136864736d7e630cab0d4df3",
        "docs/predictions/lunar-reference-station.region.portable-0.36.json",
        "98f47ded34f8f9606f812a4f8f87c15abe31789cbbc17025f04cf77e4e8e3cb1",
    ),
    (
        "docs/predictions/lunar-reference-station.points.toml",
        "c3bc398cad21c718ead419cb5499eaad9c9aa6388865f8d8ff1fcbfa106ae97c",
        "docs/predictions/lunar-reference-station.points.result.json",
        "574dbab8f78ee61792c2c3352edd8035e5843fcedd1e526611238d430ad03c93",
        "docs/predictions/lunar-reference-station.points.portable-0.36.json",
        "766c2c7abc492a1ec7edea36ac74f93217e4b45fdb9dc1c18735a5de45aad330",
    ),
];

const ADVICE: &str = "do not edit the frozen prediction; add a new dated prediction file and \
                      keep the old one (docs/predictions/lunar-reference-station.md)";

fn sha(bytes: &[u8]) -> String {
    format!("{:x}", Sha256::digest(bytes))
}

/// Same keys, same array lengths, same strings and booleans; numbers to a relative 1e-6.
fn close(a: &Value, b: &Value, path: &str, out: &mut Vec<String>) {
    match (a, b) {
        (Value::Object(x), Value::Object(y)) => {
            if x.keys().ne(y.keys()) {
                out.push(format!("{path}: keys differ"));
                return;
            }
            for (k, v) in x {
                close(v, &y[k], &format!("{path}.{k}"), out);
            }
        }
        (Value::Array(x), Value::Array(y)) => {
            if x.len() != y.len() {
                out.push(format!("{path}: length {} vs {}", x.len(), y.len()));
                return;
            }
            for (i, (u, v)) in x.iter().zip(y).enumerate() {
                close(u, v, &format!("{path}[{i}]"), out);
            }
        }
        (Value::Number(x), Value::Number(y)) => {
            let (u, v) = (x.as_f64().unwrap(), y.as_f64().unwrap());
            if (u - v).abs() > 1e-6 * u.abs().max(v.abs()).max(1e-300) {
                out.push(format!("{path}: {u} vs {v}"));
            }
        }
        _ if a == b => {}
        _ => out.push(format!("{path}: {a} vs {b}")),
    }
}

#[test]
fn the_frozen_predictions_have_not_moved() {
    for (toml_path, toml_sha, result_path, result_sha, _, _) in FROZEN {
        let src = std::fs::read(toml_path)
            .unwrap_or_else(|e| panic!("{toml_path} is missing ({e}): {ADVICE}"));
        assert_eq!(sha(&src), toml_sha, "{toml_path} changed: {ADVICE}");
        let stored = std::fs::read(result_path)
            .unwrap_or_else(|e| panic!("{result_path} is missing ({e}): {ADVICE}"));
        assert_eq!(sha(&stored), result_sha, "{result_path} changed: {ADVICE}");
    }
}

#[test]
fn the_portable_rerun_is_pinned_and_agrees_with_the_frozen_result() {
    for (toml_path, _, result_path, _, portable_path, portable_sha) in FROZEN {
        let src = std::fs::read(toml_path).unwrap();
        let out = kshana::api::run_toml(std::str::from_utf8(&src).unwrap())
            .unwrap_or_else(|e| panic!("{toml_path} no longer runs ({e})"));
        if std::env::var_os("KSHANA_BLESS_PORTABLE").is_some() {
            std::fs::write(portable_path, out.json.as_bytes()).unwrap();
        }
        let stored = std::fs::read(portable_path)
            .unwrap_or_else(|e| panic!("{portable_path} is missing ({e})"));
        assert_eq!(sha(&stored), portable_sha, "{portable_path} changed");
        assert_eq!(
            sha(out.json.as_bytes()),
            portable_sha,
            "{toml_path} no longer reproduces {portable_path} byte for byte"
        );
        let (a, b): (Value, Value) = (
            serde_json::from_slice(&stored).unwrap(),
            serde_json::from_slice(&std::fs::read(result_path).unwrap()).unwrap(),
        );
        let mut diffs = Vec::new();
        close(&a, &b, "$", &mut diffs);
        assert!(
            diffs.is_empty(),
            "{portable_path} departs from the frozen {result_path} beyond 1e-6:\n{}",
            diffs.join("\n")
        );
    }
}
