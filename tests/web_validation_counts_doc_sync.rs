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
