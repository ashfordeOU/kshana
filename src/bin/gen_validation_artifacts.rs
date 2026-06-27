// SPDX-License-Identifier: AGPL-3.0-only
//! `gen_validation_artifacts` — regenerate the browsable evidence artifacts from the
//! single-source verification matrix (`src/verification.rs::verification_matrix()`):
//!
//!   - `web/data/verification-matrix.json` — the Validation ledger the public site
//!     renders (every row's status, oracle, and existence-checked deep-links to its
//!     test, module source and committed fixture/NOTICE);
//!   - `docs/VERIFICATION-MATRIX.md` — the full 75-row per-capability table;
//!   - `docs/MODELLED-RATIONALE.md` — why each Modelled row is not externally validated.
//!
//! Run from anywhere: `cargo run --bin gen_validation_artifacts` (paths are resolved
//! against `CARGO_MANIFEST_DIR`). The matrix is the single source of truth; these are
//! generated, and `tests/verification_artifacts_doc_sync.rs` fails the build if the
//! committed copies drift from what the matrix would produce.

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
    ];
    for (rel, content) in outputs {
        let path = root.join(rel);
        if let Some(parent) = path.parent() {
            std::fs::create_dir_all(parent).unwrap_or_else(|e| panic!("create dir for {rel}: {e}"));
        }
        std::fs::write(&path, content).unwrap_or_else(|e| panic!("write {rel}: {e}"));
        eprintln!("wrote {rel}");
    }
}
