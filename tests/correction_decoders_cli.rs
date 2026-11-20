// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana corrections`: the built-in correction-decoder vectors pass through the CLI, a failing
//! vector fails the run, `decode` reads a frame file, the committed vector files are exactly what
//! the independent generator writes, and docs/CORRECTION-DECODERS.md states the vector count.

use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn kshana(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).to_string(),
        String::from_utf8_lossy(&out.stderr).to_string(),
    )
}

fn scratch() -> PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let dir = std::env::temp_dir().join(format!(
        "kshana-corr-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

#[test]
fn the_builtin_set_passes_and_prints_a_table() {
    let (code, out, err) = kshana(&["corrections", "vectors"]);
    assert_eq!(code, 0, "{out}{err}");
    assert!(
        out.contains("has-mt1-all-blocks-from-two-cnav-pages"),
        "{out}"
    );
    assert!(out.contains(" 0 failed"), "{out}");
    assert!(!out.contains("FAIL"), "{out}");
    let (code, out, _) = kshana(&["corrections", "vectors", "--json"]);
    assert_eq!(code, 0);
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(
        v.as_array().unwrap().len(),
        kshana::corrections::vectors::run_builtin().unwrap().len()
    );
}

#[test]
fn decode_reads_a_frame_file_and_a_wrong_vector_fails() {
    let dir = scratch();
    let set: serde_json::Value =
        serde_json::from_str(kshana::corrections::vectors::BUILTIN[1].1).expect("b2b.json");
    let mask = set["vectors"][0]["frames"][0].as_str().unwrap();
    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let frames = dir.join("b2b.txt");
    std::fs::write(&frames, format!("# a PPP-B2b mask\n{mask}\n")).unwrap();
    let (code, out, err) = kshana(&[
        "corrections",
        "decode",
        "--format",
        "b2b",
        frames.to_str().unwrap(),
    ]);
    assert_eq!(code, 0, "{err}");
    let r: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(r["messages"][0]["type"], 1);
    assert_eq!(r["messages"][0]["mask"][0], "C01");

    // PATH-UNIQUE-WAIVER: inside a directory that is already unique per call.
    let bad = dir.join("bad.json");
    std::fs::write(
        &bad,
        format!(
            r#"{{"format":"kshana.correction-vectors/1","vectors":[
            {{"id":"ok","decoder":"b2b","frames":["{mask}"],"expect":{{"frames":1}}}},
            {{"id":"wrong","decoder":"b2b","frames":["{mask}"],"expect":{{"messages":[{{"iodp":6}}]}}}}]}}"#
        ),
    )
    .unwrap();
    let (code, out, _) = kshana(&["corrections", "vectors", bad.to_str().unwrap()]);
    assert_eq!(code, 1, "{out}");
    assert!(out.contains("$.messages[0].iodp: 6 != 5"), "{out}");
    assert!(out.contains("2 vectors: 1 passed, 1 failed"), "{out}");
    let (code, _, _) = kshana(&["corrections", "decode", "--format", "nope", "x"]);
    assert_eq!(code, 2);
    let (code, _, _) = kshana(&["corrections", "vectors", "--bogus"]);
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
        .arg(root().join("data/conformance/corrections/gen_correction_vectors.py"))
        .arg("--check")
        .output()
        .expect("python3 is needed to check the vector generator (or set KSHANA_SKIP_RATCHET=1)");
    assert!(
        out.status.success(),
        "data/conformance/corrections/*.json differ from gen_correction_vectors.py: {}",
        String::from_utf8_lossy(&out.stderr)
    );
}

#[test]
fn the_doc_states_the_vector_count() {
    let doc = std::fs::read_to_string(root().join("docs/CORRECTION-DECODERS.md")).unwrap();
    let n = kshana::corrections::vectors::run_builtin().unwrap().len();
    assert!(
        doc.contains(&format!("({n} vectors, set version 1.0.0)")),
        "docs/CORRECTION-DECODERS.md does not state {n} vectors"
    );
}
