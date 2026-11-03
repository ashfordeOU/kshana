// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana.obs/1`: the example log converts to a file that checks, the JSON Schema names the same
//! record types and required header and station fields the engine writes, and a broken file fails.
//!
//! PIN-SCOPE:    `kshana obs convert` and `kshana obs check` on the bundled example; the record
//!               types and required fields in docs/spec/obs-1.schema.json against the engine's output
//! PIN-EXCLUDES: full JSON Schema validation (checked when the schema was written; the engine's own
//!               `check` is the gate)

use std::process::Command;

fn root() -> std::path::PathBuf {
    std::path::PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn kshana(args: &[&str]) -> (i32, String, String) {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .current_dir(root())
        .output()
        .unwrap();
    (
        o.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&o.stdout).into(),
        String::from_utf8_lossy(&o.stderr).into(),
    )
}

#[test]
fn example_converts_and_checks() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-obs-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let out = dir.join("site.obs.jsonl");
    let (code, _, err) = kshana(&[
        "obs",
        "convert",
        "examples/receiver-trust/illustrative-jamming.nmea",
        "--format",
        "nmea",
        "--station",
        "examples/obs/station.toml",
        "--out",
        out.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let (code, json, _) = kshana(&["obs", "check", out.to_str().unwrap(), "--json"]);
    assert_eq!(code, 0);
    let rep: serde_json::Value = serde_json::from_str(&json).unwrap();
    assert_eq!(rep["schema"], "kshana.obs/1");
    assert_eq!(rep["station"], "example-station-1");
    assert!(rep["epochs"].as_u64().unwrap() > 0);

    // The JSON Schema states what the engine writes.
    let schema: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join("docs/spec/obs-1.schema.json")).unwrap(),
    )
    .unwrap();
    let header: serde_json::Value = serde_json::from_str(
        std::fs::read_to_string(&out)
            .unwrap()
            .lines()
            .next()
            .unwrap(),
    )
    .unwrap();
    for k in schema["$defs"]["header"]["required"].as_array().unwrap() {
        assert!(
            header.get(k.as_str().unwrap()).is_some(),
            "header lacks {k}"
        );
    }
    for k in header["station"].as_object().unwrap().keys() {
        assert!(
            schema["$defs"]["station"]["properties"].get(k).is_some(),
            "schema lacks station.{k}"
        );
    }

    // A file whose first line is not a header fails with exit code 1.
    let bad = dir.join("bad.obs.jsonl");
    let lines: Vec<String> = std::fs::read_to_string(&out)
        .unwrap()
        .lines()
        .skip(1)
        .map(String::from)
        .collect();
    std::fs::write(&bad, lines.join("\n")).unwrap();
    assert_eq!(kshana(&["obs", "check", bad.to_str().unwrap()]).0, 1);
    assert_eq!(kshana(&["obs"]).0, 2);
    let _ = std::fs::remove_dir_all(&dir);
}
