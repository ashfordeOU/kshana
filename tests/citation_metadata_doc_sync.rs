//! Regression guard: the machine-readable citation metadata (`CITATION.cff`,
//! `codemeta.json`, `.zenodo.json`) and the README DOI must stay in lock-step with the
//! crate's authoritative Cargo manifest. A release that bumps `Cargo.toml` but forgets one
//! of these files leaves a stale version / wrong DOI in metadata that JOSS, Zenodo and ASCL
//! reviewers read first — a credibility own-goal. The manifest is the single source of
//! truth (read via the `CARGO_PKG_*` compile-time env vars, so nothing is hardcoded), and
//! these tests make any drift a build failure. License is and stays AGPL-3.0-only.
//!
//! NOTE: this guards *consistency* of the metadata files only. It does not assert that
//! anything has actually been deposited, indexed, or cited anywhere external.

use serde_json::Value;

const CITATION: &str = include_str!("../CITATION.cff");
const CODEMETA: &str = include_str!("../codemeta.json");
const README: &str = include_str!("../README.md");
const CONCEPT_DOI: &str = "10.5281/zenodo.20528627";
const LICENSE: &str = "AGPL-3.0-only";

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

fn zenodo() -> Value {
    let raw = include_str!("../.zenodo.json");
    serde_json::from_str(raw).expect(".zenodo.json must be valid JSON")
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

#[test]
fn zenodo_version_matches_the_crate_manifest() {
    let z = zenodo();
    let version = z
        .get("version")
        .and_then(Value::as_str)
        .expect(".zenodo.json must carry a string `version`");
    assert_eq!(
        version,
        env!("CARGO_PKG_VERSION"),
        ".zenodo.json `version` (= {version:?}) is out of sync with the crate version \
         (= {:?}). Update `version` in .zenodo.json to match Cargo.toml.",
        env!("CARGO_PKG_VERSION")
    );
}

#[test]
fn zenodo_license_is_agpl_only() {
    let z = zenodo();
    let license = z
        .get("license")
        .and_then(Value::as_str)
        .expect(".zenodo.json must carry a string `license`");
    assert_eq!(
        license, LICENSE,
        ".zenodo.json `license` (= {license:?}) must be {LICENSE:?}; kshana stays \
         AGPL-3.0-only across every citation surface."
    );
}

#[test]
fn zenodo_references_the_concept_doi() {
    let z = zenodo();
    let rel = z
        .get("related_identifiers")
        .and_then(Value::as_array)
        .expect(".zenodo.json must carry a `related_identifiers` array");
    let has_concept_doi = rel
        .iter()
        .any(|entry| entry.get("identifier").and_then(Value::as_str) == Some(CONCEPT_DOI));
    assert!(
        has_concept_doi,
        ".zenodo.json `related_identifiers` must reference the concept DOI {CONCEPT_DOI:?} \
         (the same DOI declared in CITATION.cff)."
    );
}

#[test]
fn zenodo_agrees_with_citation_cff() {
    // CITATION.cff is the citation source of truth; .zenodo.json mirrors it. Pin the two
    // together so a CITATION.cff bump that forgets .zenodo.json fails the build.
    let z = zenodo();

    let z_version = z.get("version").and_then(Value::as_str).unwrap();
    assert!(
        CITATION.contains(&format!("version: {z_version}")),
        "CITATION.cff does not declare `version: {z_version}` matching .zenodo.json; \
         the two citation surfaces have drifted."
    );
    assert!(
        CITATION.contains(&format!("license: {LICENSE}")),
        "CITATION.cff must declare `license: {LICENSE}` to match .zenodo.json."
    );
    assert!(
        CITATION.contains(CONCEPT_DOI),
        "CITATION.cff must reference the concept DOI {CONCEPT_DOI:?} to match .zenodo.json."
    );
}
