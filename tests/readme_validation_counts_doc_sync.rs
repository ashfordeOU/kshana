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

    let badge = format!("validated-{validated}%20external%20oracles");
    assert!(
        readme.contains(&badge),
        "README badge validated count is out of sync with verification_matrix() \
         (= {validated} VALIDATED rows); expected the substring {badge:?}. \
         Update the `validated-N external oracles` shield in README.md."
    );

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
    ];
    for (name, body) in [
        ("README.crates.md", crates),
        ("README.pypi.md", pypi),
        ("README.npm.md", npm),
    ] {
        checks.push((name, body,
            format!("**{v} of {t}** capabilities validated against independent external")));
        checks.push((name, body,
            format!("oracles; {md} honestly labelled Modelled, {p} partner-owned.")));
        checks.push((name, body,
            format!("across all {t} capabilities: {v} Validated, {md} Modelled, {p} Partner-owned")));
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
