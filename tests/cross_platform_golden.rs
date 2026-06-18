// SPDX-License-Identifier: AGPL-3.0-only
//! Cross-platform reproducibility goldens.
//!
//! The full result JSON is deliberately NOT byte-identical across operating
//! systems: transcendental libm results (sin/cos/exp/ln on the noise and orbital
//! paths) differ in the last ULP between targets, so an exact whole-output hash
//! would flap on macOS/Windows vs Linux. What IS identical across platforms is
//! (a) the input fingerprint `scenario_hash` — a hash of the canonical scenario
//! config — and (b) the SHAPE of the result: its field names, nesting, leaf value
//! types, and array lengths, which are fixed by deterministic grid arithmetic, not
//! by float values. We pin a SHA-256 over exactly that cross-platform-invariant
//! projection, per scenario, in `tests/golden/`.
//!
//! Numeric VALUES are separately held to agree across platforms to 1e-6 by the
//! tolerance-based pins in `tests/golden.rs`, and the SGP4 states to 2e-5 km by
//! `tests/sgp4_verification.rs`. This test and those run together in the
//! ubuntu/macos/windows CI matrix, so they prove cross-platform reproducibility
//! without the brittleness of exact full-output byte hashing. See
//! `docs/REPRODUCIBILITY.md`.
//!
//! Regenerate the committed hashes with
//! `KSHANA_REGEN_FIXTURES=1 cargo test --test cross_platform_golden`.

use std::fs;
use std::path::Path;

use serde_json::Value;
use sha2::{Digest, Sha256};

/// Representative bundled scenarios spanning the engine's regimes (clock holdover
/// and ensemble, SGP4 near-earth and Molniya deep-space, hybrid PNT, GNSS/INS
/// fusion, time transfer, jamming, RAIM integrity, and dual-constellation ARAIM).
const SCENARIOS: &[&str] = &[
    "clock-holdover",
    "clock-ensemble",
    "orbit-sgp4-gps",
    "orbit-molniya",
    "hybrid-pnt",
    "gnss-ins",
    "timetransfer",
    "jamming-demo",
    "integrity-raim",
    "araim-gps-galileo",
];

/// Append a cross-platform-invariant SHAPE descriptor of `v` to `out`: object keys
/// (sorted, since serde_json's default map is a `BTreeMap`), array lengths, and
/// leaf TYPES — but never a numeric value, which can differ in the last ULP across
/// platforms.
fn shape(v: &Value, out: &mut String) {
    match v {
        Value::Null => out.push('n'),
        Value::Bool(_) => out.push('b'),
        Value::Number(x) => out.push(if x.is_f64() { 'f' } else { 'i' }),
        Value::String(_) => out.push('s'),
        Value::Array(a) => {
            out.push('[');
            out.push_str(&a.len().to_string());
            out.push(':');
            // Result arrays are homogeneous (series of samples); the first
            // element's shape characterises the array. Empty -> just the length.
            if let Some(first) = a.first() {
                shape(first, out);
            }
            out.push(']');
        }
        Value::Object(m) => {
            out.push('{');
            for (k, val) in m {
                out.push_str(k);
                out.push(':');
                shape(val, out);
                out.push(',');
            }
            out.push('}');
        }
    }
}

/// SHA-256 over the cross-platform-invariant projection: the input fingerprint
/// (when the document carries one) plus the output shape.
fn invariant_hash(json: &str) -> String {
    let v: Value = serde_json::from_str(json).expect("result JSON parses");
    let mut s = String::new();
    if let Some(Value::String(h)) = v.get("scenario_hash") {
        s.push_str("scenario_hash=");
        s.push_str(h);
        s.push('\n');
    }
    shape(&v, &mut s);
    let mut hsh = Sha256::new();
    hsh.update(s.as_bytes());
    hex::encode(hsh.finalize())
}

#[test]
fn bundled_scenarios_match_cross_platform_goldens() {
    let regen = std::env::var("KSHANA_REGEN_FIXTURES").is_ok();
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/golden");
    if regen {
        fs::create_dir_all(&dir).expect("create tests/golden");
    }

    let mut checked = 0;
    let mut missing: Vec<String> = Vec::new();
    let mut mismatches: Vec<String> = Vec::new();

    for name in SCENARIOS {
        let src = fs::read_to_string(format!("scenarios/{name}.toml"))
            .unwrap_or_else(|e| panic!("read scenarios/{name}.toml: {e}"));
        let out = kshana::api::run_toml(&src).unwrap_or_else(|e| panic!("run {name}: {e}"));
        let got = invariant_hash(&out.json);
        let golden = dir.join(format!("{name}.sha256"));

        if regen {
            fs::write(&golden, format!("{got}\n")).expect("write golden");
            checked += 1;
            continue;
        }
        match fs::read_to_string(&golden) {
            Ok(want) => {
                if want.trim() != got {
                    mismatches.push(format!("{name}: got {got}, golden {}", want.trim()));
                }
                checked += 1;
            }
            Err(_) => missing.push((*name).to_string()),
        }
    }

    if regen {
        eprintln!("regenerated {checked} cross-platform goldens in tests/golden/");
        return;
    }

    assert!(
        missing.is_empty(),
        "missing goldens (regenerate via KSHANA_REGEN_FIXTURES=1): {missing:?}"
    );
    assert!(
        mismatches.is_empty(),
        "cross-platform golden mismatch — input fingerprint or output shape changed:\n{}",
        mismatches.join("\n")
    );
    assert!(
        checked >= 8,
        "expected to check the reference scenarios, only {checked}"
    );
    eprintln!(
        "cross-platform goldens: {checked} scenarios match (input fingerprint + output shape)"
    );
}
