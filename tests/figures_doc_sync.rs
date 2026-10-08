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

/// First `<digit>.<digits>e-<digits>` number in `s`, parsed.
fn first_sci_number(s: &str) -> Option<f64> {
    let b = s.as_bytes();
    let mut i = 0;
    while i < b.len() {
        if b[i].is_ascii_digit() {
            let mut j = i;
            while j < b.len() && (b[j].is_ascii_digit() || b[j] == b'.') {
                j += 1;
            }
            if j + 1 < b.len() && b[j] == b'e' && (b[j + 1] == b'-' || b[j + 1] == b'+') {
                let mut k = j + 2;
                while k < b.len() && b[k].is_ascii_digit() {
                    k += 1;
                }
                return s[i..k].parse().ok();
            }
            i = j;
        } else {
            i += 1;
        }
    }
    None
}

/// `docs/assets/figures/sgp4-regime-bars.svg` is drawn by `tools/gen_validation_figures.py`
/// from the worst-case `kshana↔ref` column of `tests/fixtures/sgp4_comparison.md`, with the
/// values as real text. Keep the committed figure tied to that table: each regime's label is
/// followed by its fixture value (to the figure's three significant figures), and the AIAA
/// tolerance is the one the fixture states.
#[test]
fn sgp4_regime_bars_svg_shows_the_fixture_values() {
    let md = include_str!("fixtures/sgp4_comparison.md");
    let svg = include_str!("../docs/assets/figures/sgp4-regime-bars.svg");
    let regimes = [
        ("deep-space (non-resonant)", "Deep-space (non-resonant)"),
        (
            "deep-space resonance (1-day)",
            "Deep-space resonance (1-day)",
        ),
        (
            "deep-space resonance (1/2-day)",
            "Deep-space resonance (1/2-day)",
        ),
        ("near-earth (LEO/MEO)", "Near-earth (LEO/MEO)"),
    ];
    for (row, label) in regimes {
        let cells: Vec<&str> = md
            .lines()
            .map(|l| l.trim().trim_matches('|'))
            .map(|l| l.split('|').map(str::trim).collect::<Vec<_>>())
            .find(|c| c.len() == 7 && c[0] == row)
            .unwrap_or_else(|| panic!("sgp4_comparison.md has no row {row:?}"));
        let want: f64 = cells[4]
            .parse()
            .expect("kshana-vs-reference cell is a number");
        let at = svg
            .find(&format!(">{label}<"))
            .unwrap_or_else(|| panic!("sgp4-regime-bars.svg has no label {label:?}"));
        // The value is the `<text>` element after the label's own: stop at its close tag so a
        // missing value cannot be satisfied by the next regime's number.
        let first_close = at + svg[at..].find("</text>").expect("label text closes");
        let end = first_close
            + svg[first_close..]
                .match_indices("</text>")
                .nth(1)
                .map_or(0, |(i, _)| i);
        let got = first_sci_number(&svg[at..end])
            .unwrap_or_else(|| panic!("no value after {label:?} in sgp4-regime-bars.svg"));
        assert_eq!(
            format!("{want:.2e}"),
            format!("{got:.2e}"),
            "sgp4-regime-bars.svg shows {got:e} km for {label:?} but \
             tests/fixtures/sgp4_comparison.md says {want:e}. Regenerate with \
             `python3 tools/gen_validation_figures.py` and commit the SVG + PNG."
        );
    }
    // The tolerance line: the fixture states it as "within 2e-5 km of the reference".
    let after = &md[md.find("within ").expect("tolerance sentence") + "within ".len()..];
    let tol: f64 = after
        .split_whitespace()
        .next()
        .and_then(|t| t.parse().ok())
        .expect("tolerance number in sgp4_comparison.md");
    assert!(
        (tol - 2e-5).abs() < 1e-12 && svg.contains(">2e-5 km<"),
        "sgp4-regime-bars.svg's AIAA tolerance label (2e-5 km) and the fixture's tolerance \
         ({tol:e}) disagree"
    );
}
