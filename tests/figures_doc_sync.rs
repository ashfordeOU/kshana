// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: the committed validation-breakdown figure must show the REAL
//! verification-matrix counts as text.
//!
//! `docs/assets/figures/validation-breakdown.svg` is generated from the matrix
//! (`src/verification.rs::verification_matrix()`, via the ledger
//! `web/data/verification-matrix.json`) by `tools/gen_validation_figures.py`, which emits
//! the counts as real `<text>`/`<tspan>` elements rather than path glyphs. The figure was
//! previously ad-hoc Matplotlib output with no committed generator, so its baked-in counts
//! could silently drift from the matrix. This test recomputes the counts here and asserts
//! the committed SVG contains each one next to its label (and the total in the subtitle),
//! so a matrix change without regenerating the figure fails the build.
//!
//! To fix a failure: `python3 tools/gen_validation_figures.py`, then commit the SVG + PNG.
//!
//! Sibling of `verification_artifacts_doc_sync.rs` (pins the JSON ledger + matrix docs),
//! `readme_validation_counts_doc_sync.rs` (pins the README badge counts), and
//! `scenario_count_doc_sync.rs` (pins the dispatchable-kind count). Checks are
//! text-substring based on purpose: robust to whitespace/geometry changes, sensitive only
//! to the counts.

use kshana::verification::{verification_matrix, OracleKind, VerificationStatus};

#[test]
fn validation_breakdown_svg_shows_the_matrix_counts() {
    let m = verification_matrix();
    let validated = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Validated)
        .count();
    let modelled = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Modelled)
        .count();
    let partner = m
        .iter()
        .filter(|i| i.status == VerificationStatus::PartnerOwned)
        .count();
    let total = m.len();

    let svg = include_str!("../docs/assets/figures/validation-breakdown.svg");

    // The legend embeds each count immediately before its status label, so these
    // substrings are uniquely tied to the figure's meaning (not, say, a stray
    // coordinate that happens to equal the count).
    let want = [
        (
            format!("<tspan font-weight=\"700\">{validated}</tspan> Validated"),
            "Validated",
        ),
        (
            format!("<tspan font-weight=\"700\">{modelled}</tspan> Modelled"),
            "Modelled",
        ),
        (
            format!("<tspan font-weight=\"700\">{partner}</tspan> Partner"),
            "Partner",
        ),
    ];
    for (needle, label) in &want {
        assert!(
            svg.contains(needle.as_str()),
            "validation-breakdown.svg is out of sync with verification_matrix(): the \
             {label} legend should read {needle:?}. Regenerate with \
             `python3 tools/gen_validation_figures.py` and commit the SVG + PNG."
        );
    }

    // The subtitle carries the total ("N capabilities ..."), which must equal the row
    // count. Pin it too so an added/removed row that keeps the same split is still caught.
    let total_needle = format!("{total} capabilities");
    assert!(
        svg.contains(&total_needle),
        "validation-breakdown.svg total is out of sync with verification_matrix() \
         ({total} rows); expected the substring {total_needle:?}. Regenerate with \
         `python3 tools/gen_validation_figures.py` and commit the SVG + PNG."
    );
}

#[test]
fn oracle_kind_stacked_svg_shows_the_status_by_oracle_kind_counts() {
    let m = verification_matrix();
    let total = m.len();
    let validated = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Validated)
        .count();
    let modelled = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Modelled)
        .count();
    let partner = m
        .iter()
        .filter(|i| i.status == VerificationStatus::PartnerOwned)
        .count();
    // The Modelled rows split across the three weaker oracle kinds; pin each.
    let m_ext = m
        .iter()
        .filter(|i| {
            i.status == VerificationStatus::Modelled && i.oracle_kind == OracleKind::ExternalDataset
        })
        .count();
    let m_ref = m
        .iter()
        .filter(|i| {
            i.status == VerificationStatus::Modelled && i.oracle_kind == OracleKind::ReferenceImpl
        })
        .count();
    let m_int = m
        .iter()
        .filter(|i| {
            i.status == VerificationStatus::Modelled
                && i.oracle_kind == OracleKind::InternalConsistency
        })
        .count();

    let svg = include_str!("../docs/assets/figures/oracle-kind-stacked.svg");

    let want = [
        // Subtitle: the validated count + the "all ExternalDataset" invariant + total.
        format!("Validated = {validated}/{validated} ExternalDataset"),
        format!("(n={total})"),
        // Caption: the Modelled oracle-kind split.
        format!(
            "Modelled oracle kinds: {m_ext} ExternalDataset, {m_ref} ReferenceImpl, \
             {m_int} InternalConsistency"
        ),
        // Status totals line (greppable tspan idiom).
        format!("<tspan font-weight=\"700\">{validated}</tspan> Validated"),
        format!("<tspan font-weight=\"700\">{modelled}</tspan> Modelled"),
        format!("<tspan font-weight=\"700\">{partner}</tspan> Partner"),
        format!("<tspan font-weight=\"700\">{total}</tspan> total"),
    ];
    for needle in &want {
        assert!(
            svg.contains(needle.as_str()),
            "oracle-kind-stacked.svg is out of sync with verification_matrix(): \
             expected the substring {needle:?}. Regenerate with \
             `python3 tools/gen_validation_figures.py` and commit the SVG + PNG."
        );
    }
}
