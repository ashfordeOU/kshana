//! Regression guard: the machine-readable citation metadata (`CITATION.cff` and
//! `codemeta.json`) and the README DOI must stay in lock-step with the crate's
//! authoritative Cargo manifest. A release that bumps `Cargo.toml` but forgets one of
//! these files leaves a stale version / wrong DOI in metadata that JOSS, Zenodo and ASCL
//! reviewers read first — a credibility own-goal. The manifest is the single source of
//! truth (read here via the `CARGO_PKG_*` compile-time env vars, so nothing is hardcoded),
//! and this test makes any drift a build failure. License is and stays AGPL-3.0-only.

const CITATION: &str = include_str!("../CITATION.cff");
const CODEMETA: &str = include_str!("../codemeta.json");
const README: &str = include_str!("../README.md");

/// Pull `10.5281/zenodo.<digits>` out of a document so the DOI is compared by value, not
/// hardcoded into this test.
fn extract_zenodo_doi(s: &str) -> Option<String> {
    let prefix = "10.5281/zenodo.";
    let i = s.find(prefix)?;
    let digits: String = s[i + prefix.len()..]
        .chars()
        .take_while(|c| c.is_ascii_digit())
        .collect();
    (!digits.is_empty()).then(|| format!("{prefix}{digits}"))
}

#[test]
fn citation_metadata_matches_the_cargo_manifest() {
    let version = env!("CARGO_PKG_VERSION");
    let license = env!("CARGO_PKG_LICENSE");
    let repo = env!("CARGO_PKG_REPOSITORY");

    // The license must not silently change away from AGPL-3.0-only anywhere.
    assert_eq!(
        license, "AGPL-3.0-only",
        "Cargo.toml license changed to {license:?} — kshana stays AGPL-3.0-only."
    );
    assert!(
        CITATION.contains("license: AGPL-3.0-only"),
        "CITATION.cff must declare `license: AGPL-3.0-only`."
    );
    assert!(
        CODEMETA.contains("AGPL-3.0-only"),
        "codemeta.json `license` must reference AGPL-3.0-only."
    );

    // Version: CITATION.cff (YAML) and codemeta.json (JSON) must match the crate version.
    assert!(
        CITATION.contains(&format!("version: {version}")),
        "CITATION.cff version is out of sync with Cargo.toml; expected `version: {version}`."
    );
    assert!(
        CODEMETA.contains(&format!("\"version\": \"{version}\"")),
        "codemeta.json version is out of sync with Cargo.toml; expected \"version\": \"{version}\"."
    );

    // Repository URL must match the manifest in both metadata files.
    assert!(
        CITATION.contains(repo),
        "CITATION.cff repository-code is out of sync with Cargo.toml repository ({repo})."
    );
    assert!(
        CODEMETA.contains(repo),
        "codemeta.json codeRepository is out of sync with Cargo.toml repository ({repo})."
    );

    // DOI: take the canonical value from CITATION.cff and require README + codemeta to agree.
    let doi = extract_zenodo_doi(CITATION)
        .expect("CITATION.cff must declare a 10.5281/zenodo concept DOI");
    assert!(
        README.contains(&doi),
        "README DOI is out of sync with CITATION.cff (expected {doi})."
    );
    assert!(
        CODEMETA.contains(&doi),
        "codemeta.json identifier DOI is out of sync with CITATION.cff (expected {doi})."
    );
}
