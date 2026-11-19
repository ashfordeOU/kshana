// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana time-vectors`: the built-in time-scale conformance vectors all pass through the CLI, a
//! failing vector fails the run, the committed files are exactly what the independent generator
//! writes, and docs/TIME-VECTORS.md states the vector counts of the files.

use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn kshana(args: &[&str]) -> (i32, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string() + &String::from_utf8_lossy(&out.stderr),
    )
}

#[test]
fn the_builtin_set_passes_and_prints_a_table() {
    let (code, text) = kshana(&["time-vectors"]);
    assert_eq!(code, 0, "{text}");
    assert!(text.starts_with("id "), "{text}");
    assert!(text.contains("leap-2017-01-01-inserted-valid"));
    assert!(text.contains(" 0 failed"), "{text}");
    assert!(!text.contains("FAIL"), "{text}");
}

#[test]
fn json_output_lists_every_vector() {
    let (code, text) = kshana(&["time-vectors", "--json"]);
    assert_eq!(code, 0);
    let v: serde_json::Value = serde_json::from_str(&text).unwrap();
    let n = v.as_array().unwrap().len();
    assert_eq!(n, kshana::time_vectors::run_builtin().unwrap().len());
    assert!(v.as_array().unwrap().iter().all(|o| o["pass"] == true));
}

#[test]
fn a_wrong_expectation_fails_the_run_and_names_the_field() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-tv-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let f = dir.join("bad.json");
    std::fs::write(
        &f,
        r#"{"format":"kshana.time-vectors/1","set":"t","version":"0","vectors":[
        {"id":"ok","op":"norad_encode","input":{"number":100000},"expect":{"field":"A0000"}},
        {"id":"wrong","op":"tai_minus_utc","input":{"utc":"2026-01-01T00:00:00"},"expect":{"seconds":36}},
        {"id":"must-refuse","op":"norad_encode","input":{"number":5},"expect":{"error":true}}]}"#,
    )
    .unwrap();
    let (code, text) = kshana(&["time-vectors", f.to_str().unwrap()]);
    assert_eq!(code, 1, "{text}");
    assert!(text.contains("seconds: 36 != 37"), "{text}");
    assert!(text.contains("3 vectors: 1 passed, 2 failed"), "{text}");
    let (code, _) = kshana(&["time-vectors", "--bogus"]);
    assert_eq!(code, 2);
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_committed_vectors_are_what_the_independent_generator_writes() {
    if std::env::var_os("KSHANA_SKIP_RATCHET").is_some() {
        eprintln!("KSHANA_SKIP_RATCHET is set: the generator check is skipped");
        return;
    }
    let out = Command::new("python3")
        .arg(root().join("data/conformance/time/gen_time_vectors.py"))
        .arg("--check")
        .output()
        .expect("python3 is needed to check the vector generator (or set KSHANA_SKIP_RATCHET=1)");
    assert!(
        out.status.success(),
        "data/conformance/time/*.json differ from gen_time_vectors.py: {}",
        String::from_utf8_lossy(&out.stdout)
    );
}

#[test]
fn the_doc_states_each_files_vector_count() {
    let doc = std::fs::read_to_string(root().join("docs/TIME-VECTORS.md")).unwrap();
    for (name, text) in kshana::time_vectors::BUILTIN {
        let v: serde_json::Value = serde_json::from_str(text).unwrap();
        let n = v["vectors"].as_array().unwrap().len();
        let row = format!("| `{name}` | {n} |");
        assert!(doc.contains(&row), "docs/TIME-VECTORS.md lacks `{row}`");
    }
}
