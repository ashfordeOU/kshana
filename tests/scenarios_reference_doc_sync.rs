// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: the committed per-kind reference `docs/SCENARIOS.md` must stay
//! byte-identical to what `api::scenarios_reference_md()` — itself generated from
//! `api::list_scenario_kinds()`, the single source of truth — would produce. If a
//! scenario kind is added, removed, renamed, or has its description or required/optional
//! fields changed and the doc is not regenerated, this test fails. So the public
//! per-kind reference can never silently drift from the dispatcher.
//!
//! To fix a failure: `cargo run --bin gen_validation_artifacts`, then commit the result.
//!
//! Sibling of `verification_artifacts_doc_sync.rs` and `scenario_count_doc_sync.rs`.

use kshana::api::{list_scenario_kinds, scenarios_reference_md};
use std::path::Path;

#[test]
fn scenarios_md_matches_the_catalogue() {
    let regenerated = scenarios_reference_md();
    let path = Path::new(env!("CARGO_MANIFEST_DIR")).join("docs/SCENARIOS.md");
    let committed = std::fs::read_to_string(&path).unwrap_or_else(|e| {
        panic!("read committed docs/SCENARIOS.md: {e} — run `cargo run --bin gen_validation_artifacts`")
    });
    assert_eq!(
        regenerated, committed,
        "docs/SCENARIOS.md is out of sync with api::list_scenario_kinds(); regenerate with \
         `cargo run --bin gen_validation_artifacts` and commit the result"
    );
}

/// Belt-and-braces completeness: every dispatchable kind must appear as its own section
/// heading in the reference. This is implied by the byte-equality test above, but it
/// states the actual guarantee — no kind is ever left undocumented — directly.
#[test]
fn every_kind_has_a_section() {
    let doc = scenarios_reference_md();
    for m in list_scenario_kinds() {
        let heading = format!("## `{}`", m.name);
        assert!(
            doc.contains(&heading),
            "scenario kind `{}` has no section in the generated reference",
            m.name
        );
    }
}
