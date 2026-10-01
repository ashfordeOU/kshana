// SPDX-License-Identifier: AGPL-3.0-only
//! Every bundled scenario must be deterministic: running it twice in the same
//! process produces byte-identical JSON. This is the cross-scenario generalisation
//! of `scripts/check-reproducible.sh` (which only checks one scenario), and it runs
//! in CI as a normal test. It does not pin cross-platform hashes — float codegen can
//! differ across targets — only same-process reproducibility, which must always hold.

use std::fs;
use std::path::PathBuf;

#[path = "support/corpus.rs"]
mod corpus;

fn sha256_hex(s: &str) -> String {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    h.update(s.as_bytes());
    hex::encode(h.finalize())
}

#[test]
fn every_bundled_scenario_is_deterministic() {
    let all: Vec<PathBuf> = {
        let mut v: Vec<_> = fs::read_dir("scenarios")
            .expect("scenarios dir")
            .filter_map(Result::ok)
            .map(|e| e.path())
            .filter(|p| p.extension().is_some_and(|x| x == "toml"))
            .collect();
        v.sort();
        v
    };
    // Suite manifests (`*.suite.toml`) are run through the study path
    // (`--study` / `kshana::study::run_suite`), NOT `run_toml` — they list other
    // scenarios rather than being a single runnable one. They are the only
    // legitimate non-runnable file in the directory, so they are the one explicit
    // exception. EVERY other bundled scenario MUST run: a parse/run failure is a
    // hard error here, not a silent skip, so a broken or unwired fixture (e.g. a
    // scenario `kind` that is registered but whose shipped `.toml` no longer
    // deserialises) cannot slip through unnoticed the way it did when this loop
    // swallowed the error.
    let suites = all
        .iter()
        .filter(|p| p.to_string_lossy().ends_with(".suite.toml"))
        .count();
    let entries = corpus::runnable_scenarios();
    assert_eq!(entries.len() + suites, all.len());

    // Each scenario runs twice, as two independent jobs on the corpus pool
    // (tests/support/corpus.rs): both runs happen in this one process, usually on
    // different threads and at different times, which is the same-process claim this
    // test makes, and the walk takes the time of the slowest scenario rather than the
    // sum of all of them twice.
    let jobs: Vec<(usize, &PathBuf)> = entries
        .iter()
        .flat_map(|p| [(0usize, p), (1usize, p)])
        .collect();
    let hashes = corpus::par_map(&jobs, |&(run, path)| {
        let name = path
            .file_name()
            .and_then(|n| n.to_str())
            .unwrap_or_default()
            .to_string();
        let src = fs::read_to_string(path).expect("read scenario");
        let out = kshana::api::run_toml(&src).unwrap_or_else(|e| {
            if run == 0 {
                panic!("bundled scenario {name} failed to run: {e}")
            } else {
                panic!("bundled scenario {name} failed on its second run: {e}")
            }
        });
        assert!(!out.json.is_empty(), "empty JSON for {}", path.display());
        sha256_hex(&out.json)
    });

    let mut checked = 0;
    for (i, path) in entries.iter().enumerate() {
        assert_eq!(
            hashes[2 * i],
            hashes[2 * i + 1],
            "non-deterministic JSON for {}",
            path.display()
        );
        checked += 1;
    }
    // Guard the guard: ensure we actually exercised the bundled corpus and did not,
    // after some refactor of the scenarios directory, silently match near-zero files.
    // CORPUS is the real size of the runnable corpus (139 `.toml` files minus the one
    // suite manifest at v0.29.0), not a slack round number: with the old floor of 50
    // a dozen scenarios could be deleted and this gate — the only place that both
    // enumerates and executes every shipped scenario twice — would stay green. Adding a
    // scenario keeps it green; raise CORPUS deliberately when that happens. A drop
    // means a file went missing, which is exactly what this is here to catch.
    const CORPUS: usize = 138;
    assert!(
        checked >= CORPUS,
        "expected to run all {CORPUS} bundled scenarios, only ran {checked}"
    );
    eprintln!(
        "determinism: {checked} bundled scenarios byte-identical on re-run ({suites} suite manifest(s) skipped)"
    );
}
