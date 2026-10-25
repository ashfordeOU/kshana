// SPDX-License-Identifier: AGPL-3.0-only
//! Nothing new bypasses the catalogue. `scripts/i18n_scan.py --json` counts, per source file, the string
//! literals with two or more words that are not messages (outside tests, attributes and the macros that
//! never show text to a person). `tests/fixtures/i18n/allow.json` is the allowance per file, each with a
//! reason; a count may fall and may never rise, and a file not listed allows none. A literal that is
//! human-facing belongs in `i18n/en/engine.ftl` (docs/design/i18n-migration.md); one that is a machine
//! document or data is allowed with its reason.
//!
//! The scanner is Python (scripts/i18n_scan.py); the test needs `python3` and fails without it, because a
//! ratchet that silently does not run is not one. Set `KSHANA_SKIP_RATCHET=1` to skip it deliberately.

use std::collections::BTreeMap;
use std::path::PathBuf;
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

#[test]
fn no_user_facing_string_bypasses_the_catalogue_and_the_allowance_never_grows() {
    if std::env::var_os("KSHANA_SKIP_RATCHET").is_some() {
        eprintln!("KSHANA_SKIP_RATCHET is set: the i18n ratchet is skipped");
        return;
    }
    let out = Command::new("python3")
        .arg(root().join("scripts/i18n_scan.py"))
        .arg("--json")
        .output()
        .expect("python3 is needed to run scripts/i18n_scan.py (or set KSHANA_SKIP_RATCHET=1)");
    assert!(
        out.status.success(),
        "i18n_scan.py failed: {}",
        String::from_utf8_lossy(&out.stderr)
    );
    let now: BTreeMap<String, usize> = serde_json::from_slice(&out.stdout).expect("scan json");
    let allow: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join("tests/fixtures/i18n/allow.json")).unwrap(),
    )
    .unwrap();
    let files = allow["files"].as_object().expect("allow.json files");
    let mut over = Vec::new();
    for (file, n) in &now {
        let allowed = files
            .get(file)
            .and_then(|e| e["count"].as_u64())
            .unwrap_or(0) as usize;
        if *n > allowed {
            over.push(format!("{file}: {n} literals, {allowed} allowed"));
        }
    }
    assert!(
        over.is_empty(),
        "string literals that bypass the catalogue (move them to i18n/en/engine.ftl, or, for a machine \
         document or data, raise the allowance with a reason in tests/fixtures/i18n/allow.json):\n{}",
        over.join("\n")
    );
    for (file, entry) in files {
        assert!(
            entry["reason"].as_str().is_some_and(|r| !r.is_empty()),
            "{file}: an allowance needs its reason"
        );
    }
}
