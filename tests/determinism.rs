// SPDX-License-Identifier: Apache-2.0
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
    let mut entries: Vec<_> = fs::read_dir("scenarios")
        .expect("scenarios dir")
        .filter_map(Result::ok)
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .collect();
    entries.sort();

    for path in entries {
        let src = fs::read_to_string(&path).expect("read scenario");
        let a = match kshana::api::run_toml(&src) {
            Ok(o) => o,
            // A few scenario files may be fragments/includes; skip ones that do not
            // parse as a runnable scenario rather than failing the determinism check.
            Err(_) => continue,
        };
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
    assert!(
        checked >= 5,
        "expected to check several scenarios, only {checked}"
    );
    eprintln!("determinism: {checked} bundled scenarios are byte-identical on re-run");
}
