//! Regression guard: the README's validated / modelled / partner counts must stay in
//! lock-step with the verification matrix (`src/verification.rs`), the single source of
//! truth.
//!
//! The headline "validated" badge is hand-maintained. An audit found it had drifted to
//! "17 external oracles · 15 more MODELLED" while the matrix actually held
//! 15 VALIDATED / 42 MODELLED / 4 PARTNER — overstating what is validated and
//! understating what is modelled by ~3×. That is the one drift that reads as an honesty
//! overclaim, so this test makes it a build failure instead of a silent lie. Sibling of
//! `scenario_count_doc_sync.rs` (which pins the dispatchable-kind count).
//!
//! If you add or change a verification row, update the README badge and the
//! "Validation at a glance" summary line; this test names exactly which site is stale.

use kshana::verification::{verification_matrix, VerificationStatus};

#[test]
fn readme_validation_counts_match_the_matrix() {
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
    let readme = include_str!("../README.md");

    // The "trust" badge row states VALIDATED of total ("validated 83/223"); pin the shield,
    // and the Evidence section's label table beside it.
    let badge = format!("badge/validated-{validated}%2F{total}-");
    assert!(
        readme.contains(&badge),
        "README validated badge is out of sync with verification_matrix() \
         ({validated} VALIDATED of {total}); expected the substring {badge:?}."
    );
    let row = format!("| VALIDATED | {validated} |");
    assert!(
        readme.contains(&row),
        "README Evidence label table VALIDATED count is out of sync with verification_matrix() \
         (= {validated} VALIDATED rows); expected the substring {row:?}. \
         Update the VALIDATED row of the label table in README.md's Evidence section."
    );
    for (label, n) in [("MODELLED", modelled), ("PARTNER", partner)] {
        let row = format!("| {label} | {n} |");
        assert!(
            readme.contains(&row),
            "README Evidence label table {label} count is out of sync; expected {row:?}."
        );
    }

    let alt = format!("{validated} capabilities validated against independent external oracles");
    assert!(
        readme.contains(&alt),
        "README badge alt-text validated count is out of sync (= {validated}); \
         expected {alt:?}."
    );

    let modelled_str = format!("{modelled} more are honestly labelled MODELLED");
    assert!(
        readme.contains(&modelled_str),
        "README badge MODELLED count is out of sync with verification_matrix() \
         (= {modelled} MODELLED rows); expected {modelled_str:?}."
    );

    let partner_str = format!("{partner} are PARTNER-owned");
    assert!(
        readme.contains(&partner_str),
        "README badge PARTNER count is out of sync (= {partner}); expected {partner_str:?}."
    );

    let summary =
        format!("{total} rows — {validated} VALIDATED, {modelled} MODELLED, {partner} PARTNER");
    assert!(
        readme.contains(&summary),
        "README 'Validation at a glance' full-matrix line is out of sync with \
         verification_matrix() ({total} rows = {validated}/{modelled}/{partner}); \
         expected the substring {summary:?}."
    );
}

/// The per-surface READMEs (crates.io, PyPI, npm) carry the same headline counts and are
/// published to public package registries — so a silent drift there is just as much an
/// honesty overclaim as in the GitHub README. Pin every one of them to the matrix too.
#[test]
fn surface_readme_validation_counts_match_the_matrix() {
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

    let surfaces = [
        ("README.crates.md", include_str!("../README.crates.md")),
        ("README.pypi.md", include_str!("../README.pypi.md")),
        ("README.npm.md", include_str!("../README.npm.md")),
    ];

    let badge = format!("validated-{validated}%20external%20oracles");
    let alt = format!(
        "{validated} of {total} capabilities validated against independent external oracles"
    );
    let modelled_str = format!("{modelled} honestly labelled Modelled");
    let partner_str = format!("{partner} partner-owned");

    for (name, body) in surfaces {
        for expected in [&badge, &alt, &modelled_str, &partner_str] {
            assert!(
                body.contains(expected.as_str()),
                "{name} is out of sync with verification_matrix() \
                 ({validated} VALIDATED / {modelled} MODELLED / {partner} PARTNER of {total}); \
                 expected the substring {expected:?}."
            );
        }
    }
}

/// Beyond the badges and the "Validation at a glance" summary line, the matrix counts
/// also surface in figure alt-text, the figure caption, the provenance-diagram alt-text,
/// and the centred "N of T capabilities validated" strapline — both in the GitHub README
/// and in all three per-registry READMEs (crates.io / PyPI / npm). Those sites were never
/// pinned, so any one of them could silently drift out of step with the matrix while the
/// guarded badges stayed correct. Pin every remaining count-bearing string so a row
/// change that misses one is a build failure, not a published overclaim.
///
/// A later audit found this test had not in fact pinned *every* such string: the
/// oracle-kind stacked-bar figure's alt-text states the Validated column's
/// ExternalDataset count ("the Validated column is N of N ExternalDataset by
/// construction"), and it still read 56 of 56 when the matrix held 59 — the figure
/// itself, which is regenerated, had moved on without its alt. An alt attribute is a
/// published surface (screen readers and indexers read it, and it is the only text a
/// reader gets when the image fails to load), so it is pinned here with the rest.
#[test]
fn every_public_validation_count_string_matches_the_matrix() {
    let m = verification_matrix();
    let v = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Validated)
        .count();
    let md = m
        .iter()
        .filter(|i| i.status == VerificationStatus::Modelled)
        .count();
    let p = m
        .iter()
        .filter(|i| i.status == VerificationStatus::PartnerOwned)
        .count();
    let t = m.len();

    let readme = include_str!("../README.md");
    let crates = include_str!("../README.crates.md");
    let pypi = include_str!("../README.pypi.md");
    let npm = include_str!("../README.npm.md");

    // (doc label, doc body, expected substring derived from the matrix). Each substring is
    // written out in full (no line-continuation) so it is byte-for-byte what must appear.
    let mut checks: Vec<(&str, &str, String)> = vec![
        ("README.md (strapline)", readme,
            format!("{v} of {t}</strong> capabilities validated against independent external oracles; {md} honestly labelled Modelled.")),
        ("README.md (figure alt)", readme,
            format!("across all {t} capabilities: {v} Validated (checked vs external oracle), {md} Modelled, {p} Partner-owned")),
        ("README.md (figure caption)", readme,
            format!("{v} Validated · {md} Modelled · {p} Partner")),
        ("README.md (provenance-diagram alt)", readme,
            format!("Live counts: {v} Validated, {md} Modelled, {p} Partner, {t} total")),
        // The oracle-kind stacked bar is regenerated from the matrix, so its bars are
        // always current; its alt-text is hand-written and was not.
        ("README.md (oracle-kind figure alt)", readme,
            format!("the Validated column is {v} of {v} ExternalDataset by construction")),
    ];
    for (name, body) in [
        ("README.crates.md", crates),
        ("README.pypi.md", pypi),
        ("README.npm.md", npm),
    ] {
        checks.push((
            name,
            body,
            format!("**{v} of {t}** capabilities validated against independent external"),
        ));
        checks.push((
            name,
            body,
            format!("oracles; {md} honestly labelled Modelled, {p} partner-owned."),
        ));
        checks.push((
            name,
            body,
            format!("across all {t} capabilities: {v} Validated, {md} Modelled, {p} Partner-owned"),
        ));
    }

    let stale: Vec<String> = checks
        .iter()
        .filter(|(_, body, expected)| !body.contains(expected.as_str()))
        .map(|(name, _, expected)| format!("  {name}: expected substring {expected:?}"))
        .collect();

    assert!(
        stale.is_empty(),
        "Public-facing validation count strings are out of sync with verification_matrix() \
         ({v} VALIDATED / {md} MODELLED / {p} PARTNER of {t} total). Update each listed site:\n{}",
        stale.join("\n")
    );
}

/// The tests above pin the count strings they know about, and only look for the current
/// numbers; a site nobody listed can keep an old count and every `contains` still passes.
/// That is how the architecture alt-texts kept "223 capabilities (83 VALIDATED, ...)"
/// after the matrix moved on. This test reads every count-shaped phrase in the four
/// READMEs, wherever it is, and requires it to state the current matrix:
/// "N VALIDATED, M MODELLED, P PARTNER" (any case) and "of T capabilities" / "T rows".
/// Screenshots of a released Studio (`docs/assets/readme/studio/`) are exempt: their
/// alt-text describes the picture of that release, which is re-captured, not generated.
#[test]
fn no_readme_states_a_stale_validation_count() {
    let m = verification_matrix();
    let count = |s: VerificationStatus| m.iter().filter(|i| i.status == s).count();
    let (v, md, p, t) = (
        count(VerificationStatus::Validated),
        count(VerificationStatus::Modelled),
        count(VerificationStatus::PartnerOwned),
        m.len(),
    );

    let num = |w: &str| -> Option<usize> {
        w.trim_matches(|c: char| !c.is_ascii_digit())
            .parse()
            .ok()
            .filter(|_| {
                w.chars()
                    .next()
                    .is_some_and(|c| c.is_ascii_digit() || c == '(')
            })
    };
    let word = |w: &str| -> String {
        w.trim_matches(|c: char| !c.is_alphanumeric())
            .to_ascii_lowercase()
    };

    let mut stale = Vec::new();
    for (name, body) in [
        ("README.md", include_str!("../README.md")),
        ("README.crates.md", include_str!("../README.crates.md")),
        ("README.pypi.md", include_str!("../README.pypi.md")),
        ("README.npm.md", include_str!("../README.npm.md")),
    ] {
        for (ln, line) in body.lines().enumerate() {
            if line.contains("docs/assets/readme/studio/") {
                continue;
            }
            let toks: Vec<&str> = line.split_whitespace().collect();
            for i in 0..toks.len() {
                let at = |k: usize| toks.get(i + k).copied().unwrap_or("");
                // "N VALIDATED, M MODELLED, P PARTNER" in any case.
                if word(at(1)) == "validated"
                    && word(at(3)) == "modelled"
                    && word(at(5)).starts_with("partner")
                {
                    if let (Some(a), Some(b), Some(c)) = (num(at(0)), num(at(2)), num(at(4))) {
                        if (a, b, c) != (v, md, p) {
                            stale.push(format!(
                                "  {name}:{}: {a}/{b}/{c} VALIDATED/MODELLED/PARTNER, matrix {v}/{md}/{p}",
                                ln + 1
                            ));
                        }
                    }
                }
                // "of T capabilities" and "T rows" / "T-row" totals.
                let total_here = if word(at(0)) == "of" && word(at(2)).starts_with("capabilit") {
                    num(at(1))
                } else if word(at(1)) == "rows" || at(0).ends_with("-row") {
                    num(at(0).trim_end_matches("-row"))
                } else {
                    None
                };
                if let Some(n) = total_here {
                    if n != t && n > 100 {
                        stale.push(format!(
                            "  {name}:{}: total {n}, matrix {t} ({:?})",
                            ln + 1,
                            toks[i..(i + 3).min(toks.len())].join(" ")
                        ));
                    }
                }
            }
        }
    }
    assert!(
        stale.is_empty(),
        "README count phrases disagree with verification_matrix() \
         ({v} VALIDATED / {md} MODELLED / {p} PARTNER of {t}):\n{}",
        stale.join("\n")
    );
}
