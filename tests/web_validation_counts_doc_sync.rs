// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: the website's validated-capability counts must track the matrix.
//!
//! `web/index.html` states the validated/total counts in its meta description and its
//! social-card description — the two strings a search result and a shared link show,
//! which is to say the first numbers most people ever see from this project.
//!
//! Neither was covered by any gate. The READMEs have had
//! `readme_validation_counts_doc_sync` since the last drift; the website did not, and it
//! drifted to "56 of 103" while the ledger stood at 122 rows with 58 validated — stale by
//! nineteen rows, with nothing to catch it. The failure mode is the one this repository
//! keeps rediscovering: a gate only grades the surfaces it lists, and a surface nobody
//! listed is a surface nobody checked.

use kshana::verification::{summarize, verification_matrix};

/// The ledger section's own total, which no gate listed either.
///
/// It read `102` while the matrix stood at 133 rows — stale by thirty-one, and static: no
/// script sets it at runtime, so what the page says is what is committed. It drifted for
/// exactly the reason the module docs above give, one surface further along. Finding it
/// took reading the file rather than trusting the guard that was already green, which is
/// the actual lesson: a passing gate is evidence about the surfaces it lists and about
/// nothing else.
#[test]
fn the_ledger_sections_own_total_matches_the_matrix() {
    let s = summarize(&verification_matrix());
    let html = include_str!("../web/index.html");
    let want = format!("<span id=\"ldg-total\">{}</span>", s.total);
    assert!(
        html.contains(want.as_str()),
        "web/index.html's ledger section must state the matrix total as {want:?}. The \
         matrix is {} rows. This element is static — nothing sets it at runtime — so a \
         stale value here is what a visitor reads.",
        s.total
    );
    // The id must be unique, or the assertion above could be satisfied by one occurrence
    // while a second, stale one renders instead.
    let n = html.matches("id=\"ldg-total\"").count();
    assert_eq!(n, 1, "expected exactly one ldg-total element, found {n}");
}

#[test]
fn website_validation_counts_match_the_matrix() {
    let s = summarize(&verification_matrix());
    let html = include_str!("../web/index.html");
    let pair = format!("{} of {}", s.validated, s.total);

    // Both descriptions must carry the claim.
    let full = format!("{pair} capabilities validated against external oracles");
    let hits = html.matches(full.as_str()).count();
    assert!(
        hits >= 2,
        "web/index.html should state {full:?} in both its meta description and its \
         social-card description, but that string appears {hits} time(s). The matrix is \
         {} rows with {} validated.",
        s.total,
        s.validated
    );

    // And no OTHER such claim may survive beside them: a stale count left in place is a
    // wrong count, not merely a redundant one.
    for (idx, _) in html.match_indices(" capabilities validated") {
        let head = &html[..idx];
        let start = head.rfind(". ").map(|i| i + 2).unwrap_or(0);
        let claim = head[start..].trim();
        assert_eq!(
            claim, pair,
            "web/index.html carries a validated-capability claim of {claim:?}; the matrix \
             is {pair:?}. Every such claim on the page must state the current pair."
        );
    }
}

/// The social card itself — the image, not the text beside it.
///
/// The header of this file says "a gate only grades the surfaces it lists, and a surface
/// nobody listed is a surface nobody checked", and then lists the social-card
/// *description* while leaving the social *card* out. `web/og-card.png` is the image every
/// link preview renders — LinkedIn, Slack, iMessage, a search result's thumbnail — and it
/// had the count printed into it. It was committed once as a bare PNG with no source and
/// never regenerated, so it read **"56 of 102 validated against external oracles"** while
/// the ledger held 59 of 134: a total wrong by thirty-two rows, for months, on the
/// most-shared artefact the project has. Nothing could have caught it. A count inside a
/// rendered image cannot be read by a test, and there was no source to check against.
///
/// So the card now has one. `web/og-card.svg` carries the text, `tools/gen_og_card.py`
/// takes the numbers from the ledger and re-renders both the SVG's count and the PNG, and
/// this test does the two things a test can do: assert the SVG's sentence against the
/// matrix, and bind the PNG to the exact SVG bytes it came from so an SVG corrected
/// without a re-render is a build failure rather than a picture that disagrees with the
/// page around it.
#[test]
fn the_social_card_image_states_the_matrixs_counts() {
    use std::path::Path;

    let m = verification_matrix();
    let s = summarize(&m);
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));

    let svg_path = root.join("web/og-card.svg");
    let svg = std::fs::read_to_string(&svg_path).expect("web/og-card.svg");
    let want = format!(
        "{} of {} validated against external oracles",
        s.validated,
        m.len()
    );
    assert!(
        svg.contains(&want),
        "web/og-card.svg — the source of the social card every link preview renders — does \
         not state the matrix's counts. Expected the substring {want:?}. Regenerate with \
         `python3 tools/gen_og_card.py`, which rewrites the count, re-renders the PNG and \
         updates the render record together."
    );

    let record: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root.join("web/og-card.rendered-from.json"))
            .expect("web/og-card.rendered-from.json"),
    )
    .expect("render record is valid JSON");

    let recorded = record["svg_sha256"].as_str().expect("svg_sha256");
    let actual = {
        use sha2::{Digest, Sha256};
        let mut h = Sha256::new();
        h.update(std::fs::read(&svg_path).expect("read og-card.svg"));
        h.finalize()
            .iter()
            .map(|b| format!("{b:02x}"))
            .collect::<String>()
    };
    assert_eq!(
        actual, recorded,
        "web/og-card.png was rendered from an older web/og-card.svg, so the card people see \
         is not the card in the repository. Re-render with `python3 tools/gen_og_card.py`."
    );
}
