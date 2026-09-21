// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: no published surface may state a matrix total OTHER than the live one.
//!
//! ## Why this exists, when three count guards already did
//!
//! `readme_validation_counts_doc_sync.rs` and `web_validation_counts_doc_sync.rs` pin
//! counts by asserting that the CORRECT string is PRESENT. That catches a count which
//! changed at a site the guard enumerates, and nothing else. It cannot catch a WRONG
//! count sitting at a site nobody listed, because a stale sentence elsewhere in the file
//! does not stop the right sentence from also being there.
//!
//! The record shows this is not hypothetical. The sibling guard's own doc comment
//! describes being extended twice after audits found strings it had not pinned — and it
//! was extended each time by enumerating one more string, which leaves the next
//! unlisted site exactly as exposed. A third audit then found `README.md` still
//! advertising a "102-row matrix" link, and the provenance diagram still rendering
//! "Total 102 capability rows" into the PNG whose own README alt-text said 134: the
//! figure a reader clicks contradicted the caption above it, and every presence-style
//! assertion stayed green throughout.
//!
//! So this guard is written the other way round. It does not ask "is the right number
//! here?" — it finds EVERY place a surface states a matrix total, whatever the number
//! is, and asserts each one equals `verification_matrix().len()`. A new site is caught
//! the moment it states a total, without anyone remembering to add it here.
//!
//! Scope: this pins the TOTAL only. The validated/modelled/partner splits keep their
//! presence-style guards in the sibling files; this is the absence check they lack, not
//! a replacement for them.

use kshana::verification::verification_matrix;

/// Every integer that immediately PRECEDES `marker`, e.g. `("Full 102-row matrix",
/// "-row matrix")` yields `102`. Returns the numbers together with enough surrounding
/// text to name the site in a failure message.
fn counts_before(body: &str, marker: &str) -> Vec<(usize, String)> {
    let mut out = Vec::new();
    let bytes = body.as_bytes();
    let mut from = 0usize;
    while let Some(rel) = body[from..].find(marker) {
        let at = from + rel;
        // Walk back over the digits that end at `at`.
        let mut start = at;
        while start > 0 && bytes[start - 1].is_ascii_digit() {
            start -= 1;
        }
        if start < at {
            if let Ok(n) = body[start..at].parse::<usize>() {
                out.push((n, context(body, start, at + marker.len())));
            }
        }
        from = at + marker.len();
    }
    out
}

/// Every integer that sits BETWEEN `prefix` and `suffix`, e.g.
/// `("Total 102 capability rows", "Total ", " capability rows")` yields `102`.
fn counts_between(body: &str, prefix: &str, suffix: &str) -> Vec<(usize, String)> {
    let mut out = Vec::new();
    let mut from = 0usize;
    while let Some(rel) = body[from..].find(prefix) {
        let num_start = from + rel + prefix.len();
        let rest = &body[num_start..];
        let digits: String = rest.chars().take_while(|c| c.is_ascii_digit()).collect();
        // The suffix must follow the digits immediately, or this is a different phrase
        // that merely shares a prefix.
        if !digits.is_empty() && rest[digits.len()..].starts_with(suffix) {
            if let Ok(n) = digits.parse::<usize>() {
                out.push((
                    n,
                    context(body, from + rel, num_start + digits.len() + suffix.len()),
                ));
            }
        }
        from = num_start.max(from + rel + 1);
    }
    out
}

/// A single-line excerpt around `[start, end)`, trimmed, for the failure message.
fn context(body: &str, start: usize, end: usize) -> String {
    let lo = body[..start].rfind('\n').map(|i| i + 1).unwrap_or(0);
    let hi = body[end..]
        .find('\n')
        .map(|i| end + i)
        .unwrap_or(body.len());
    let line = body[lo..hi].trim();
    if line.chars().count() > 140 {
        let cut: String = line.chars().take(137).collect();
        format!("{cut}...")
    } else {
        line.to_string()
    }
}

#[test]
fn no_published_surface_states_a_stale_matrix_total() {
    let total = verification_matrix().len();

    let readme = include_str!("../README.md");
    let mmd = include_str!("../docs/diagrams/validation-provenance.mmd");
    let svg = include_str!("../docs/assets/diagrams/validation-provenance.svg");
    let app_js = include_str!("../web/app.js");
    let index_html = include_str!("../web/index.html");

    // (surface, every stated total found on it). Each entry is a phrase that, wherever it
    // appears, is stating the size of the verification matrix.
    let found: Vec<(&str, Vec<(usize, String)>)> = vec![
        // "[Full 134-row matrix →](#validation-at-a-glance)" and any sibling phrasing.
        ("README.md", counts_before(readme, "-row matrix")),
        // The provenance diagram, in source and in the committed rendering the README embeds.
        (
            "docs/diagrams/validation-provenance.mmd",
            counts_between(mmd, "Total ", " capability rows"),
        ),
        (
            "docs/assets/diagrams/validation-provenance.svg",
            counts_between(svg, "Total ", " capability rows"),
        ),
        // The ledger strapline's pre-hydration value. JS overwrites it from the JSON at
        // runtime, so a reader with JS sees the right number — but this is what ships in the
        // bundle, what a no-JS reader sees, and what a scraper indexes.
        (
            "web/app.js",
            counts_between(app_js, "<span id=\"ldg-total\">", "</span>"),
        ),
        (
            "web/index.html",
            counts_between(index_html, "<span id=\"ldg-total\">", "</span>"),
        ),
    ];

    let mut stale: Vec<String> = Vec::new();
    let mut checked = 0usize;
    for (surface, hits) in &found {
        for (n, ctx) in hits {
            checked += 1;
            if *n != total {
                stale.push(format!(
                    "  {surface}: states {n}, matrix holds {total}\n      {ctx}"
                ));
            }
        }
    }

    assert!(
        stale.is_empty(),
        "A published surface states a matrix total that is not the live one \
         (verification_matrix() = {total} rows):\n{}\n\n\
         Update the number at each site above. If a figure is involved, regenerate the \
         rendered SVG/PNG from its source as well — the README embeds the rendering, not \
         the source, so fixing only the .mmd leaves the image a reader actually sees stale.",
        stale.join("\n")
    );

    // A scanner that silently matches nothing would pass forever while every surface
    // rotted. Pin that it actually found the sites it is here to police.
    assert!(
        checked >= 4,
        "the stale-total scanner matched only {checked} stated totals; it is supposed to \
         find at least one per published surface. A phrase was probably reworded — fix \
         the scanner, do not lower this bound, or the guard becomes decorative."
    );
}

/// The same absence check for the PER-STATUS counts.
///
/// The total was not the only stale number in the provenance diagram. The figure also
/// carried "VALIDATED 51 rows" and "MODELLED 47 rows" against a matrix holding 59 and
/// 71 — and it was found by *rendering the PNG and looking at it*, not by any test,
/// because a number inside an image is invisible to a text guard and the figure's three
/// status labels were pinned nowhere. Pin them at their text sources so the picture
/// cannot drift again.
#[test]
fn no_published_surface_states_a_stale_status_count() {
    use kshana::verification::VerificationStatus;
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

    let mmd = include_str!("../docs/diagrams/validation-provenance.mmd");
    let svg = include_str!("../docs/assets/diagrams/validation-provenance.svg");

    // (surface, body, mermaid-source prefix, rendered-SVG prefix, expected count)
    let cases = [
        ("VALIDATED", validated),
        ("MODELLED", modelled),
        ("PARTNER", partner),
    ];

    let mut stale = Vec::new();
    let mut checked = 0usize;
    for (label, want) in cases {
        for (surface, body, prefix, suffix) in [
            (
                "docs/diagrams/validation-provenance.mmd",
                mmd,
                format!("{label}<br/>"),
                " rows".to_string(),
            ),
            (
                "docs/assets/diagrams/validation-provenance.svg",
                svg,
                format!("<p>{label}<br />"),
                " rows</p>".to_string(),
            ),
        ] {
            let hits = counts_between(body, &prefix, &suffix);
            if hits.is_empty() {
                stale.push(format!(
                    "  {surface}: no {label} count found at all (expected {prefix:?}N{suffix:?}) \
                     — the label was reworded, so this guard stopped watching it"
                ));
            }
            for (n, ctx) in hits {
                checked += 1;
                if n != want {
                    stale.push(format!(
                        "  {surface}: {label} states {n}, matrix holds {want}\n      {ctx}"
                    ));
                }
            }
        }
    }

    assert!(
        stale.is_empty(),
        "The provenance diagram states a per-status count that is not the live one \
         (matrix: {validated} VALIDATED / {modelled} MODELLED / {partner} PARTNER):\n{}\n\n\
         Fix the .mmd AND the .svg, then re-render the PNG — the README embeds the PNG, \
         and rsvg-convert silently drops this diagram's <foreignObject> text, so use a \
         browser engine to render it (see docs note on tools/render-diagram.sh).",
        stale.join("\n")
    );
    assert_eq!(
        checked, 6,
        "expected 3 status counts × 2 surfaces = 6 pinned sites, matched {checked}"
    );
}
