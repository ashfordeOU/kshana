// SPDX-License-Identifier: AGPL-3.0-only
//! Regression guard: the website's validated-capability counts must track the matrix.
//!
//! The site states the validated/total counts on its home page, its evidence page and its
//! editions page, and in the social-card text of every page — the first numbers most
//! people ever see from this project.
//!
//! None of it was covered by any gate. The READMEs have had
//! `readme_validation_counts_doc_sync` since the last drift; the website did not, and it
//! drifted to "56 of 103" while the ledger stood at 122 rows with 58 validated — stale by
//! nineteen rows, with nothing to catch it. The failure mode is the one this repository
//! keeps rediscovering: a gate only grades the surfaces it lists, and a surface nobody
//! listed is a surface nobody checked.
//!
//! The pages under `web/` are written by the site build and ported in by
//! `web/tools/port_site.py`; they are static text, so what is committed is what a visitor
//! reads. A failure here means the site was built from an older ledger: rebuild it from
//! this checkout and rerun the port. Do not edit the pages by hand.

use kshana::verification::{summarize, verification_matrix};

/// What a reader sees of a page: the text with scripts, styles, inline drawings and tags
/// removed and whitespace collapsed. A tag boundary becomes a space, so
/// `<b>83</b><span>of 223` reads "83 of 223".
fn visible_text(html: &str) -> String {
    let mut s = html.to_string();
    for tag in ["script", "style", "svg"] {
        let (open, close) = (format!("<{tag}"), format!("</{tag}>"));
        while let Some(a) = s.find(&open) {
            match s[a..].find(&close) {
                Some(b) => s.replace_range(a..a + b + close.len(), " "),
                None => break,
            }
        }
    }
    let mut out = String::with_capacity(s.len());
    let mut in_tag = false;
    for c in s.chars() {
        match c {
            '<' => {
                in_tag = true;
                out.push(' ');
            }
            '>' => in_tag = false,
            _ if !in_tag => out.push(c),
            _ => {}
        }
    }
    out.split_whitespace().collect::<Vec<_>>().join(" ")
}

/// Every `content="…"` attribute value of a page: the descriptions and image alt texts a
/// search result or a link preview shows.
fn meta_contents(html: &str) -> String {
    html.split("content=\"")
        .skip(1)
        .filter_map(|r| r.split('"').next())
        .collect::<Vec<_>>()
        .join(" . ")
}

/// The ledger section's own total, which no gate listed either.
///
/// On the single-page site it read `102` while the matrix stood at 133 rows — stale by
/// thirty-one, and static: no script sets it at runtime, so what the page says is what is
/// committed. Finding it took reading the file rather than trusting the guard that was
/// already green, which is the actual lesson: a passing gate is evidence about the
/// surfaces it lists and about nothing else. The redesigned site states it in the ledger
/// section's heading on the evidence page, static in the same way.
#[test]
fn the_ledger_sections_own_total_matches_the_matrix() {
    let s = summarize(&verification_matrix());
    let text = visible_text(include_str!("../web/evidence.html"));
    let want = format!("All {} rows, one line each.", s.total);
    assert!(
        text.contains(want.as_str()),
        "web/evidence.html's ledger section must state the matrix total as {want:?}. The \
         matrix is {} rows. The heading is static — nothing sets it at runtime — so a \
         stale value here is what a visitor reads.",
        s.total
    );
    // The heading must be unique, or the assertion above could be satisfied by one
    // occurrence while a second, stale one renders instead.
    let n = text.matches(" rows, one line each.").count();
    assert_eq!(n, 1, "expected exactly one ledger heading, found {n}");
}

#[test]
fn website_validation_counts_match_the_matrix() {
    let s = summarize(&verification_matrix());
    let pair = format!("{} of {}", s.validated, s.total);
    let full = format!("{pair} capabilities validated");

    // (page, how many times the claim must appear at least). The home page states it in
    // both social-card alt texts (its evidence card phrases it as "N of M capabilities
    // agree with independent external oracles", pinned below); every other page at least
    // in the social-card alt texts the port writes.
    let pages: [(&str, &str, usize); 3] = [
        ("web/index.html", include_str!("../web/index.html"), 2),
        ("web/evidence.html", include_str!("../web/evidence.html"), 2),
        ("web/editions.html", include_str!("../web/editions.html"), 3),
    ];
    for (name, html, at_least) in pages {
        let text = format!("{} . {}", visible_text(html), meta_contents(html));
        let hits = text.matches(full.as_str()).count();
        assert!(
            hits >= at_least,
            "{name} should state {full:?} at least {at_least} time(s), but that string \
             appears {hits} time(s). The matrix is {} rows with {} validated.",
            s.total,
            s.validated
        );

        // And no OTHER such claim may survive beside them: a stale count left in place is
        // a wrong count, not merely a redundant one. Every "… capabilities validated" on
        // the page must be preceded by the current pair.
        for (idx, _) in text.match_indices(" capabilities validated") {
            let head = &text[..idx];
            let words: Vec<&str> = head.split(' ').rev().take(3).collect();
            let claim = words.into_iter().rev().collect::<Vec<_>>().join(" ");
            assert_eq!(
                claim, pair,
                "{name} carries a validated-capability claim of {claim:?}; the matrix is \
                 {pair:?}. Every such claim on the page must state the current pair."
            );
        }
    }

    // The two headline figures that are not phrased "N of M capabilities validated": the
    // home page's stat strip ("83 /223 validated against …") and the evidence page's
    // opening line and graded total.
    let home = visible_text(include_str!("../web/index.html"));
    let strip = format!("{} /{} validated against", s.validated, s.total);
    assert!(
        home.contains(&strip),
        "web/index.html's stat strip should read {strip:?}"
    );
    let card = format!(
        "{} of {} capabilities agree with independent external oracles",
        s.validated, s.total
    );
    assert!(
        home.contains(&card),
        "web/index.html's evidence card should read {card:?}"
    );
    let ev = visible_text(include_str!("../web/evidence.html"));
    for want in [
        format!(
            "{} capabilities, each graded. {} validated against",
            s.total, s.validated
        ),
        format!(
            "Capabilities graded {} of {} validated",
            s.validated, s.total
        ),
        format!(
            "{} honestly labelled Modelled. {} partner-owned.",
            s.modelled, s.partner_owned
        ),
    ] {
        assert!(
            ev.contains(&want),
            "web/evidence.html should state {want:?}; the matrix is {} rows: {} validated, \
             {} modelled, {} partner-owned.",
            s.total,
            s.validated,
            s.modelled,
            s.partner_owned
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

/// The Studio's headline tally — the counts its evidence panel leads with.
///
/// On the single-page site the capability explorer's tally was once built in `web/app.js`
/// from the curated card list alone: "46 capability cards … 17 backed by an external
/// oracle", beside READMEs that say 64 of 168. Both were true of their own population,
/// and together they read as the project giving two answers to one question. The tally
/// now comes from `counts.mjs` over the generated ledger — the same matrix the README
/// counts are pinned to. In the redesigned site that module lives with the Studio
/// (`web/studio/lib/counts.mjs`), and the Studio's copy of the ledger is the one in
/// `web/data/`, byte for byte (`web/site.test.mjs` pins that).
///
/// This test pins the wiring from the Rust side; `web/studio/lib/counts.test.mjs`
/// and `web/site.test.mjs` (each its own CI step) pin the arithmetic and cross-check the
/// README and the pages.
#[test]
fn the_explorer_tally_is_the_matrixs_not_the_card_layers() {
    let s = summarize(&verification_matrix());
    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    let app = std::fs::read_to_string(root.join("web/studio/app.js")).expect("web/studio/app.js");
    for needle in [
        "from \"./lib/counts.mjs\"",
        "matrixCounts(ledger)",
        "fetch(\"data/verification-matrix.json\")",
    ] {
        assert!(
            app.contains(needle),
            "web/studio/app.js must take its counts from the ledger through counts.mjs; \
             missing {needle:?}"
        );
    }
    assert!(
        !app.contains("backed by an external oracle`"),
        "web/studio/app.js carries a card-only 'backed by an external oracle' headline"
    );
    assert_eq!(
        std::fs::read(root.join("web/studio/data/verification-matrix.json"))
            .expect("web/studio/data/verification-matrix.json"),
        std::fs::read(root.join("web/data/verification-matrix.json"))
            .expect("web/data/verification-matrix.json"),
        "the Studio's copy of the ledger is not the generated one; rerun web/tools/port_site.py"
    );

    let ledger: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root.join("web/data/verification-matrix.json"))
            .expect("web/data/verification-matrix.json"),
    )
    .expect("ledger is JSON");
    assert_eq!(ledger["summary"]["total"], s.total);
    assert_eq!(ledger["summary"]["validated"], s.validated);

    let ci = std::fs::read_to_string(root.join(".github/workflows/ci.yml")).expect("ci.yml");
    assert!(
        ci.contains("run: node web/studio/lib/counts.test.mjs")
            && ci.contains("run: node web/site.test.mjs"),
        "web/studio/lib/counts.test.mjs and web/site.test.mjs must each have a CI step"
    );
}
