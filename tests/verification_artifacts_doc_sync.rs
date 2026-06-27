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
