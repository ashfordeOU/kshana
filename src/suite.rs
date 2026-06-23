// SPDX-License-Identifier: AGPL-3.0-only
//! Scenario-suite manifest: a named SET of scenarios run together.
//!
//! A *suite* is the spine of a productized **study**: instead of one scenario →
//! one report, it names several scenarios that are run together into one
//! aggregated, comparable artifact (see [`crate::study`]). This module only parses
//! the manifest; running it lives in [`crate::study::run_suite`], which calls the
//! existing engine ([`crate::api::run_toml`]) once per scenario.
//!
//! # Manifest format
//!
//! A small TOML document:
//!
//! ```toml
//! title = "My Study"
//! description = "..."        # optional
//! scenarios = ["a.toml", "b.toml"]
//! ```
//!
//! `scenarios` is an array whose entries are **either** a plain path string
//! **or** a table `{ path = "a.toml", label = "A" }` carrying an optional display
//! label; the two forms may be mixed in one array. Paths are interpreted relative
//! to the manifest's own directory (resolution happens in [`crate::study`], not
//! here). A missing or empty `scenarios` array, or a missing `title`, is a parse
//! error rather than a silently-empty study.

use serde::Deserialize;

/// One scenario in a suite: the scenario file path (relative to the manifest) and
/// an optional human-readable display label used as the comparison-table column
/// header. When the label is absent the study falls back to the path's file stem.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SuiteEntry {
    /// Scenario file path, relative to the manifest's directory.
    pub path: String,
    /// Optional display label for the comparison column.
    pub label: Option<String>,
}

/// A parsed scenario-suite manifest: a study title, an optional description, and
/// the ordered set of scenario entries.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Suite {
    pub title: String,
    pub description: Option<String>,
    pub scenarios: Vec<SuiteEntry>,
}

/// The raw TOML shape, deserialized before validation. `scenarios` accepts a mix
/// of bare path strings and `{ path, label }` tables via an untagged enum so the
/// manifest can use whichever form is clearest per entry.
#[derive(Deserialize)]
struct RawSuite {
    title: Option<String>,
    description: Option<String>,
    scenarios: Option<Vec<RawEntry>>,
}

#[derive(Deserialize)]
#[serde(untagged)]
enum RawEntry {
    /// A bare path string: `"a.toml"`.
    Path(String),
    /// A table: `{ path = "a.toml", label = "A" }`.
    Table { path: String, label: Option<String> },
}

impl RawEntry {
    fn into_entry(self) -> SuiteEntry {
        match self {
            RawEntry::Path(path) => SuiteEntry { path, label: None },
            RawEntry::Table { path, label } => SuiteEntry { path, label },
        }
    }
}

/// Parse a scenario-suite manifest from a TOML string.
///
/// Returns an `Err` with a clear, human-readable message when the document is not
/// valid TOML, when `title` is missing, or when `scenarios` is missing/empty —
/// each of which would otherwise produce a meaningless empty study. Matches the
/// crate's existing `toml`-parse error style (a short prefixed message).
pub fn parse_suite(src: &str) -> Result<Suite, String> {
    let raw: RawSuite = toml::from_str(src).map_err(|e| format!("invalid suite manifest: {e}"))?;

    let title = raw
        .title
        .filter(|t| !t.trim().is_empty())
        .ok_or_else(|| "suite manifest is missing a `title`".to_string())?;

    let entries = raw.scenarios.unwrap_or_default();
    if entries.is_empty() {
        return Err(
            "suite manifest has no `scenarios`: add a non-empty `scenarios = [...]` array"
                .to_string(),
        );
    }

    let scenarios = entries.into_iter().map(RawEntry::into_entry).collect();
    Ok(Suite {
        title,
        description: raw.description,
        scenarios,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_string_and_table_entries_mixed() {
        let src = r#"
title = "Mixed"
scenarios = [ "a.toml", { path = "b.toml", label = "B" } ]
"#;
        let s = parse_suite(src).unwrap();
        assert_eq!(s.title, "Mixed");
        assert_eq!(s.description, None);
        assert_eq!(s.scenarios.len(), 2);
        assert_eq!(s.scenarios[0].path, "a.toml");
        assert_eq!(s.scenarios[0].label, None);
        assert_eq!(s.scenarios[1].path, "b.toml");
        assert_eq!(s.scenarios[1].label.as_deref(), Some("B"));
    }

    #[test]
    fn description_is_optional_and_captured_when_present() {
        let src = "title = \"T\"\ndescription = \"d\"\nscenarios = [\"a.toml\"]\n";
        let s = parse_suite(src).unwrap();
        assert_eq!(s.description.as_deref(), Some("d"));
    }

    #[test]
    fn missing_title_errors() {
        let err = parse_suite("scenarios = [\"a.toml\"]\n").unwrap_err();
        assert!(err.contains("title"), "{err}");
    }

    #[test]
    fn blank_title_errors() {
        let err = parse_suite("title = \"   \"\nscenarios = [\"a.toml\"]\n").unwrap_err();
        assert!(err.contains("title"), "{err}");
    }

    #[test]
    fn missing_or_empty_scenarios_errors() {
        let missing = parse_suite("title = \"T\"\n").unwrap_err();
        assert!(missing.contains("scenarios"), "{missing}");
        let empty = parse_suite("title = \"T\"\nscenarios = []\n").unwrap_err();
        assert!(empty.contains("scenarios"), "{empty}");
    }

    #[test]
    fn invalid_toml_errors() {
        let err = parse_suite("title = =").unwrap_err();
        assert!(err.contains("invalid suite manifest"), "{err}");
    }
}
