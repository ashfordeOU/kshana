// SPDX-License-Identifier: AGPL-3.0-only
//! Guard for the pre-registered predictions in `docs/predictions/`.
//!
//! Each prediction re-runs its frozen TOML through the engine and must reproduce the stored
//! result. On the frozen platform (linux x86_64, the pinned toolchain) the result is compared
//! byte for byte and by its SHA-256; elsewhere, as `tests/cross_platform_golden.rs` and
//! `tests/golden.rs` do for the release goldens, by its shape exactly and every number to a
//! relative 1e-6, since transcendental libm results differ in the last place between targets.
//!
//! PIN-SCOPE:    the SHA-256 of each frozen TOML and of each stored result JSON, as frozen
//!               (inputs at c05dac1d)
//! PIN-EXCLUDES: nothing in the result; the run's one-line summary and SVG are not frozen
//!
//! If this fails: do not edit the frozen prediction. Add a new, dated prediction file and keep
//! the old one (docs/predictions/lunar-reference-station.md, "Scoring protocol").

use serde_json::Value;
use sha2::{Digest, Sha256};

/// `(frozen TOML, its SHA-256, stored result JSON, its SHA-256)`.
const FROZEN: [(&str, &str, &str, &str); 2] = [
    (
        "docs/predictions/lunar-reference-station.region.toml",
        "c265df1701a441df43b497eba39c63dfbe18bfd53087052315f49c99f105ec13",
        "docs/predictions/lunar-reference-station.region.result.json",
        "d108f77ecca57902774fdb3d9f62a8b8318c8435136864736d7e630cab0d4df3",
    ),
    (
        "docs/predictions/lunar-reference-station.points.toml",
        "c3bc398cad21c718ead419cb5499eaad9c9aa6388865f8d8ff1fcbfa106ae97c",
        "docs/predictions/lunar-reference-station.points.result.json",
        "574dbab8f78ee61792c2c3352edd8035e5843fcedd1e526611238d430ad03c93",
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
fn the_frozen_predictions_reproduce() {
    for (toml_path, toml_sha, result_path, result_sha) in FROZEN {
        let src = std::fs::read(toml_path).unwrap_or_else(|e| panic!("{toml_path}: {e}"));
        assert_eq!(sha(&src), toml_sha, "{toml_path} changed: {ADVICE}");
        let stored = std::fs::read(result_path).unwrap_or_else(|e| panic!("{result_path}: {e}"));
        assert_eq!(sha(&stored), result_sha, "{result_path} changed: {ADVICE}");

        let out = kshana::api::run_toml(std::str::from_utf8(&src).unwrap())
            .unwrap_or_else(|e| panic!("{toml_path} no longer runs ({e}): {ADVICE}"));
        if cfg!(all(target_os = "linux", target_arch = "x86_64")) {
            assert_eq!(
                sha(out.json.as_bytes()),
                result_sha,
                "{toml_path} no longer reproduces {result_path} byte for byte: {ADVICE}"
            );
        } else {
            let (a, b): (Value, Value) = (
                serde_json::from_str(&out.json).unwrap(),
                serde_json::from_slice(&stored).unwrap(),
            );
            let mut diffs = Vec::new();
            close(&a, &b, "$", &mut diffs);
            assert!(
                diffs.is_empty(),
                "{toml_path} no longer reproduces {result_path}: {ADVICE}\n{}",
                diffs.join("\n")
            );
        }
    }
}
