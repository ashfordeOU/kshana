// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: the committed browsable-evidence artifacts must stay byte-identical
//! to what the verification matrix (`src/verification.rs::verification_matrix()`) would
//! generate. The matrix is the single source of truth; the JSON ledger the public site
//! renders and the two generated docs are derived from it by `gen_validation_artifacts`.
//! If a matrix row changes (or a cited test/module/fixture path appears or disappears)
//! and the artifacts are not regenerated, this test fails — so the kshana.dev ledger and
//! the docs can never silently drift from the matrix.
//!
//! To fix a failure: `cargo run --bin gen_validation_artifacts`, then commit the result.
//!
//! Sibling of `readme_validation_counts_doc_sync.rs` (which pins the README badge counts)
//! and `scenario_count_doc_sync.rs` (which pins the dispatchable-kind count).

use kshana::verification::{
    to_ledger_json, to_modelled_rationale_md, to_verification_matrix_md, verification_matrix,
};
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn assert_in_sync(rel: &str, regenerated: String) {
    let path = root().join(rel);
    let committed = std::fs::read_to_string(&path).unwrap_or_else(|e| {
        panic!("read committed {rel}: {e} — run `cargo run --bin gen_validation_artifacts`")
    });
    assert_eq!(
        regenerated, committed,
        "{rel} is out of sync with verification_matrix(); regenerate with \
         `cargo run --bin gen_validation_artifacts` and commit the result"
    );
}

#[test]
fn ledger_json_matches_the_matrix() {
    let m = verification_matrix();
    assert_in_sync(
        "web/data/verification-matrix.json",
        to_ledger_json(&m, root()),
    );
}

#[test]
fn verification_matrix_md_matches_the_matrix() {
    let m = verification_matrix();
    assert_in_sync("docs/VERIFICATION-MATRIX.md", to_verification_matrix_md(&m));
}

#[test]
fn modelled_rationale_md_matches_the_matrix() {
    let m = verification_matrix();
    assert_in_sync("docs/MODELLED-RATIONALE.md", to_modelled_rationale_md(&m));
}

#[test]
fn card_matrix_map_references_real_rows_and_covers_every_card() {
    // The public capability cards deep-link into the ledger via web/data/card-matrix-map.json.
    // Every value must be a real matrix requirement (so a renamed/removed row is caught here,
    // not as a dead link on the site), and every capability card must be mapped.
    let reqs: std::collections::HashSet<String> = verification_matrix()
        .iter()
        .map(|i| i.requirement.to_string())
        .collect();

    let map_raw = std::fs::read_to_string(root().join("web/data/card-matrix-map.json"))
        .expect("read card-matrix-map.json");
    let map: serde_json::Map<String, serde_json::Value> =
        serde_json::from_str(&map_raw).expect("parse card-matrix-map.json");

    for (card, v) in &map {
        let arr = v
            .as_array()
            .unwrap_or_else(|| panic!("card {card} value must be an array"));
        assert!(!arr.is_empty(), "card {card} maps to no matrix rows");
        for r in arr {
            let req = r.as_str().expect("requirement must be a string");
            assert!(
                reqs.contains(req),
                "card {card:?} maps to {req:?}, which is not a verification_matrix() requirement"
            );
        }
    }

    let caps_raw = std::fs::read_to_string(root().join("web/capabilities.json"))
        .expect("read capabilities.json");
    let caps: serde_json::Value = serde_json::from_str(&caps_raw).expect("parse capabilities.json");
    let cards = caps["capabilities"]
        .as_array()
        .or_else(|| caps.as_array())
        .expect("capabilities array");
    for c in cards {
        let name = c["name"].as_str().expect("card name");
        assert!(
            map.contains_key(name),
            "capability card {name:?} has no entry in card-matrix-map.json"
        );
    }
}

#[test]
fn oracle_references_have_no_dead_entries() {
    // The ledger's oracle column turns external-source names into outbound links via
    // web/data/oracle-references.json. The site matches case-sensitively with
    // `oracleText.includes(m)` (see oracleSources() in web/app.js), so every `match`
    // token must actually occur in some matrix oracle string — otherwise it is dead
    // weight (or a typo) that can never surface a link. We also reject malformed URLs
    // and empty labels so a bad entry can't ship a broken "Sources:" chip.
    let oracles: Vec<&'static str> = verification_matrix().iter().map(|i| i.oracle).collect();
    let appears = |needle: &str| oracles.iter().any(|o| o.contains(needle));

    let raw = std::fs::read_to_string(root().join("web/data/oracle-references.json"))
        .expect("read oracle-references.json");
    let refs: Vec<serde_json::Value> =
        serde_json::from_str(&raw).expect("parse oracle-references.json (expected an array)");
    assert!(!refs.is_empty(), "oracle-references.json is empty");

    let mut seen_urls = std::collections::HashSet::new();
    for e in &refs {
        let label = e["label"].as_str().expect("entry needs a string label");
        assert!(!label.trim().is_empty(), "entry {e:?} has an empty label");

        let url = e["url"].as_str().expect("entry needs a string url");
        assert!(
            url.starts_with("https://") || url.starts_with("http://"),
            "entry {label:?} has a non-http(s) url: {url:?}"
        );
        assert!(
            seen_urls.insert(url.to_string()),
            "duplicate url {url:?} (entry {label:?}) — collapse into one entry, \
             oracleSources() de-dupes by url and would drop the second silently"
        );

        let matches = e["match"]
            .as_array()
            .unwrap_or_else(|| panic!("entry {label:?} needs a `match` array"));
        assert!(
            !matches.is_empty(),
            "entry {label:?} has an empty `match` array"
        );
        for m in matches {
            let needle = m.as_str().expect("each `match` token must be a string");
            assert!(
                appears(needle),
                "oracle-references entry {label:?} matches {needle:?}, which appears in no \
                 verification_matrix() oracle — prune it or fix the spelling"
            );
        }
    }
}

#[test]
fn standards_matrix_map_references_real_rows_and_standards() {
    // The "Standards & interoperability" cards deep-link their VALIDATED badge into the
    // ledger via web/data/standards-matrix-map.json. Every key must be a real standard
    // card name (web/capabilities.json `standards[].name`) and every value a real matrix
    // requirement, so a renamed standard or row is caught here instead of as a dead link.
    // (Not every standard must be mapped — e.g. CCSDS TDM has no matrix row yet — so this
    // guard is one-directional, unlike the capability-card guard above.)
    let reqs: std::collections::HashSet<String> = verification_matrix()
        .iter()
        .map(|i| i.requirement.to_string())
        .collect();

    let caps_raw = std::fs::read_to_string(root().join("web/capabilities.json"))
        .expect("read capabilities.json");
    let caps: serde_json::Value = serde_json::from_str(&caps_raw).expect("parse capabilities.json");
    let std_names: std::collections::HashSet<String> = caps["standards"]
        .as_array()
        .expect("capabilities.json has a standards array")
        .iter()
        .map(|s| s["name"].as_str().expect("standard name").to_string())
        .collect();

    let map_raw = std::fs::read_to_string(root().join("web/data/standards-matrix-map.json"))
        .expect("read standards-matrix-map.json");
    let map: serde_json::Map<String, serde_json::Value> =
        serde_json::from_str(&map_raw).expect("parse standards-matrix-map.json");
    assert!(!map.is_empty(), "standards-matrix-map.json is empty");

    for (standard, v) in &map {
        assert!(
            std_names.contains(standard),
            "standards-matrix-map key {standard:?} is not a standard card in capabilities.json"
        );
        let req = v
            .as_str()
            .unwrap_or_else(|| panic!("value for {standard:?} must be a string"));
        assert!(
            reqs.contains(req),
            "standard {standard:?} maps to {req:?}, which is not a verification_matrix() requirement"
        );
    }
}

#[test]
fn ledger_links_resolve_to_committed_files() {
    // Every deep-link the ledger emits must point at a real, in-repo file — the whole
    // point is that a reader can click through to actual evidence, not a 404.
    let json = std::fs::read_to_string(root().join("web/data/verification-matrix.json"))
        .expect("read ledger json");
    let v: serde_json::Value = serde_json::from_str(&json).expect("parse ledger json");
    let mut checked = 0usize;
    for row in v["rows"].as_array().expect("rows array") {
        for group in ["module_links", "test_links"] {
            for link in row[group].as_array().into_iter().flatten() {
                let p = link["path"].as_str().expect("link path");
                assert!(
                    root().join(p).is_file(),
                    "ledger links to a non-existent file: {p}"
                );
                checked += 1;
            }
        }
        if let Some(fx) = row["fixture"].as_object() {
            let p = fx["path"].as_str().expect("fixture path");
            assert!(
                root().join(p).is_dir(),
                "ledger fixture path is not a directory: {p}"
            );
            checked += 1;
        }
    }
    assert!(
        checked > 50,
        "expected the ledger to carry many links, found {checked}"
    );
}
