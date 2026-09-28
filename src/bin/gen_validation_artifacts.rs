// SPDX-License-Identifier: AGPL-3.0-only
//! `gen_validation_artifacts` — regenerate the browsable evidence artifacts from the
//! single-source verification matrix (`src/verification.rs::verification_matrix()`):
//!
//!   - `web/data/verification-matrix.json` — the Validation ledger the public site
//!     renders (every row's status, oracle, and existence-checked deep-links to its
//!     test, module source and committed fixture/NOTICE);
//!   - `docs/VERIFICATION-MATRIX.md` — the full per-capability table (its row count is in the generated header);
//!   - `docs/MODELLED-RATIONALE.md` — why each Modelled row is not externally validated;
//!   - `docs/SCENARIOS.md` — the per-kind reference, generated from
//!     `api::list_scenario_kinds()` so it can never drift from the dispatcher;
//!   - the per-scenario export table in `docs/INTEROP.md`, between its
//!     `interop-table` markers, from `interop::scenario_table_md` over `scenarios/`.
//!
//! Run from anywhere: `cargo run --bin gen_validation_artifacts` (paths are resolved
//! against `CARGO_MANIFEST_DIR`). The matrix is the single source of truth; these are
//! generated, and `tests/verification_artifacts_doc_sync.rs` fails the build if the
//! committed copies drift from what the matrix would produce.

use kshana::api::scenarios_reference_md;
use kshana::verification::{
    to_ledger_json, to_modelled_rationale_md, to_verification_matrix_md, verification_matrix,
};
use std::path::Path;

fn main() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let m = verification_matrix();
    let outputs = [
        (
            "web/data/verification-matrix.json",
            to_ledger_json(&m, root),
        ),
        ("docs/VERIFICATION-MATRIX.md", to_verification_matrix_md(&m)),
        ("docs/MODELLED-RATIONALE.md", to_modelled_rationale_md(&m)),
        ("docs/SCENARIOS.md", scenarios_reference_md()),
    ];
    for (rel, content) in outputs {
        let path = root.join(rel);
        if let Some(parent) = path.parent() {
            std::fs::create_dir_all(parent).unwrap_or_else(|e| panic!("create dir for {rel}: {e}"));
        }
        std::fs::write(&path, content).unwrap_or_else(|e| panic!("write {rel}: {e}"));
        eprintln!("wrote {rel}");
    }
    write_interop_table(root);
}

/// Refresh the export table in `docs/INTEROP.md`: every bundled scenario (suites
/// excluded) against every format, between the `interop-table` markers.
fn write_interop_table(root: &Path) {
    let mut scenarios: Vec<(String, String)> = std::fs::read_dir(root.join("scenarios"))
        .unwrap_or_else(|e| panic!("read scenarios/: {e}"))
        .filter_map(|e| e.ok().map(|e| e.path()))
        .filter(|p| p.extension().is_some_and(|x| x == "toml"))
        .filter(|p| !p.to_string_lossy().ends_with(".suite.toml"))
        .map(|p| {
            let name = p
                .file_name()
                .map(|n| n.to_string_lossy().into_owned())
                .unwrap_or_default();
            let src = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("read {name}: {e}"));
            (name, src)
        })
        .collect();
    scenarios.sort();
    let table = kshana::interop::scenario_table_md(&scenarios);
    let path = root.join("docs/INTEROP.md");
    let doc =
        std::fs::read_to_string(&path).unwrap_or_else(|e| panic!("read docs/INTEROP.md: {e}"));
    let start = "<!-- interop-table:start -->\n";
    let end = "<!-- interop-table:end -->";
    let a = doc
        .find(start)
        .expect("docs/INTEROP.md has the table start marker")
        + start.len();
    let b = doc
        .find(end)
        .expect("docs/INTEROP.md has the table end marker");
    let updated = format!("{}{}{}", &doc[..a], table, &doc[b..]);
    std::fs::write(&path, updated).unwrap_or_else(|e| panic!("write docs/INTEROP.md: {e}"));
    eprintln!("wrote docs/INTEROP.md (export table)");
}
