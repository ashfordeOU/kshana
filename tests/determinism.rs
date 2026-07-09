// SPDX-License-Identifier: AGPL-3.0-only
//! Every bundled scenario must be deterministic: running it twice in the same
//! process produces byte-identical JSON. This is the cross-scenario generalisation
//! of `scripts/check-reproducible.sh` (which only checks one scenario), and it runs
//! in CI as a normal test. It does not pin cross-platform hashes — float codegen can
//! differ across targets — only same-process reproducibility, which must always hold.

use std::fs;

fn sha256_hex(s: &str) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(s.as_bytes());
    hex::encode(h.finalize())
}

#[test]
fn every_bundled_scenario_is_deterministic() {
    let mut checked = 0;
    let mut suites = 0;
    let mut entries: Vec<_> = fs::read_dir("scenarios")
        .expect("scenarios dir")
        .filter_map(Result::ok)
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .collect();
    entries.sort();

    for path in entries {
        let name = path
            .file_name()
            .and_then(|n| n.to_str())
            .unwrap_or_default()
            .to_string();

        // Suite manifests (`*.suite.toml`) are run through the study path
        // (`--study` / `kshana::study::run_suite`), NOT `run_toml` — they list other
        // scenarios rather than being a single runnable one. They are the only
        // legitimate non-runnable file in the directory, so they are the one explicit
        // exception. EVERY other bundled scenario MUST run: a parse/run failure is a
        // hard error here, not a silent skip, so a broken or unwired fixture (e.g. a
        // scenario `kind` that is registered but whose shipped `.toml` no longer
        // deserialises) cannot slip through unnoticed the way it did when this loop
        // swallowed the error.
        if name.ends_with(".suite.toml") {
            suites += 1;
            continue;
        }

        let src = fs::read_to_string(&path).expect("read scenario");
        let a = kshana::api::run_toml(&src)
            .unwrap_or_else(|e| panic!("bundled scenario {name} failed to run: {e}"));
        let b = kshana::api::run_toml(&src).expect("second run");
        assert_eq!(
            sha256_hex(&a.json),
            sha256_hex(&b.json),
            "non-deterministic JSON for {}",
            path.display()
        );
        assert!(!a.json.is_empty(), "empty JSON for {}", path.display());
        checked += 1;
    }
    // Guard the guard: ensure we actually exercised the bundled corpus and did not,
    // after some refactor of the scenarios directory, silently match near-zero files.
    assert!(
        checked >= 50,
        "expected to run the full bundled scenario corpus, only ran {checked}"
    );
    eprintln!(
        "determinism: {checked} bundled scenarios byte-identical on re-run ({suites} suite manifest(s) skipped)"
    );
}
