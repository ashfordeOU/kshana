// SPDX-License-Identifier: AGPL-3.0-only
//! Every file exempted from copy-paste detection must actually carry a declarative catalog.
//!
//! ## Why this is not already covered
//!
//! `sonar.cpd.exclusions` in `sonar-project.properties` turns copy-paste detection off
//! for the files it names. That is the right instrument for this repository's evidence
//! layer — the verification matrix and the units-and-provenance contract are tables of
//! distinct content in an identical shape, which a copy-paste detector is built to flag
//! and which the audit surface requires to exist row by row. But the same key is also
//! the easiest way to silence a *real* duplication: add a path, and the finding is gone
//! with no test and no reviewer the wiser.
//!
//! Nothing else checks the list. The scanner runs in CI against a config file, so a
//! path added here never fails a build — it simply stops being measured.
//!
//! This test makes the exemption list a machine-checked classification rather than a
//! waiver: every entry must exist on disk and must genuinely hold a catalog, the list
//! must stay sorted and bounded, and the parser itself must be proved non-blind.
//!
//! ## What counts as a catalog entry
//!
//! The same units-and-provenance contract is written three ways in this engine, and all
//! three are catalogs:
//!   1. a struct literal — `FieldUnit { path, unit, provenance, definition }`,
//!      `VerificationItem { .. }`, `ThreatParam { .. }`, `ComplianceRow { .. }`;
//!   2. a tuple table — `const UNITS: &[(&str, &str, &str, Option<&str>)]` whose rows
//!      read `("data.span_days", "d", "measured", Some("..."))`;
//!   3. a macro body — the `FieldUnit` tables already inside `macro_rules!`, where what
//!      remains after factoring is the per-field metadata itself.

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

/// Minimum catalog entries a file must hold to earn its exemption. Set well below the
/// smallest real catalog in the list (six, in `conflict_threat_params.rs`) so ordinary
/// editing never trips it, and far enough above zero that a file with no catalog at all
/// cannot be slipped in.
const MIN_CATALOG_ENTRIES: usize = 5;

/// Upper bound on the list. Every entry is a file whose duplication is no longer
/// measured, so the list growing is the signal to look at the code, not to raise the
/// bound. Set with headroom over the 36 entries present when this guard was written.
const MAX_EXCLUSIONS: usize = 48;

/// A parser that matched nothing would pass every assertion below in silence, which is
/// the failure mode this file exists to prevent.
const MIN_PARSED: usize = 20;

fn repo_root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

/// Read one `key=value` out of the properties file, joining backslash continuations.
fn property(text: &str, key: &str) -> Option<String> {
    let mut out: Option<String> = None;
    let mut lines = text.lines().peekable();
    while let Some(line) = lines.next() {
        let trimmed = line.trim_start();
        if trimmed.starts_with('#') || !trimmed.starts_with(key) {
            continue;
        }
        let Some(rest) = trimmed
            .strip_prefix(key)
            .and_then(|r| r.trim_start().strip_prefix('='))
        else {
            continue;
        };
        let mut acc = rest.trim().to_string();
        while acc.ends_with('\\') {
            acc.pop();
            match lines.next() {
                Some(next) => acc.push_str(next.trim()),
                None => break,
            }
        }
        out = Some(acc);
    }
    out
}

fn excluded_paths(text: &str) -> Vec<String> {
    property(text, "sonar.cpd.exclusions")
        .map(|v| {
            v.split(',')
                .map(|s| s.trim().to_string())
                .filter(|s| !s.is_empty())
                .collect()
        })
        .unwrap_or_default()
}

/// Count declarative catalog entries, strictly.
///
/// Two spellings count, and nothing else:
///   1. a struct-literal row whose type name ends in `Unit`, `Item`, `Param`, `Row` or
///      `Entry` — `FieldUnit`, `VerificationItem`, `ThreatParam`, `ComplianceRow`,
///      `CoeffEntry`. The suffix rule matters: an earlier, looser version of this
///      counter accepted ANY capitalised struct literal, which let `src/sweep.rs` —
///      whose duplication is genuine copy-pasted logic — score six on `Scenario`,
///      `GnssWindow` and `SweepAxis`. A guard that a non-catalog file can satisfy is
///      not a guard.
///   2. a row of a units table declared as `const UNITS: &[(&str, &str, &str, ..)]`,
///      counted by tracking paren depth so multi-line rows count once, not once per
///      line.
///
/// ## What this does NOT prove
///
/// It proves the file HOLDS a catalog. It cannot prove the file's *duplicated region*
/// is that catalog — only SonarCloud knows where the duplicated blocks fall. So this
/// guard stops a file with no catalog at all from being exempted; it does not stop a
/// file that holds a catalog AND separately duplicates logic. `src/raim.rs` and
/// `src/gravimeter.rs` are exactly that shape, which is why both are deliberately
/// absent from the list even though they would satisfy the counter. Classification is
/// done by reading the real duplicated blocks; this test defends the result.
fn catalog_entries(src: &str) -> usize {
    let mut n = 0usize;
    let mut in_table = false;
    let mut depth: i32 = 0;
    for raw in src.lines() {
        let line = raw.trim_end();
        let s = line.trim();

        // 1: a catalog struct-literal row.
        if let Some(head) = s.strip_suffix('{').map(str::trim) {
            let named = head.ends_with("Unit")
                || head.ends_with("Item")
                || head.ends_with("Param")
                || head.ends_with("Row")
                || head.ends_with("Entry");
            if named
                && head.chars().next().is_some_and(char::is_uppercase)
                && head.chars().all(|c| c.is_alphanumeric() || c == '_')
            {
                n += 1;
                continue;
            }
        }

        // 2: rows of a `const NAME: &[( .. )]` units table.
        if !in_table {
            let t = s.strip_prefix("pub ").unwrap_or(s);
            let decl = t.starts_with("const ") || t.starts_with("static ");
            if decl && s.contains(": &[(") {
                in_table = true;
                depth = 0;
            }
            continue;
        }
        if s.starts_with("];") {
            in_table = false;
            continue;
        }
        if depth == 0 && s.starts_with('(') {
            n += 1;
        }
        depth += line.matches('(').count() as i32 - line.matches(')').count() as i32;
        if depth < 0 {
            depth = 0;
        }
    }
    n
}

fn properties_text() -> String {
    std::fs::read_to_string(repo_root().join("sonar-project.properties"))
        .expect("sonar-project.properties is readable")
}

#[test]
fn every_cpd_exemption_names_a_file_that_really_holds_a_catalog() {
    let text = properties_text();
    let paths = excluded_paths(&text);

    assert!(
        paths.len() >= MIN_PARSED,
        "the properties parser recovered only {} exempted paths. Either the key was \
         renamed or the continuation syntax changed — fix the parser, do not lower this \
         bound, or the guard becomes decorative.",
        paths.len()
    );

    let root = repo_root();
    let mut thin: Vec<String> = Vec::new();
    let mut missing: Vec<String> = Vec::new();
    for p in &paths {
        let full = root.join(p);
        if !full.exists() {
            missing.push(p.clone());
            continue;
        }
        let src = std::fs::read_to_string(&full).expect("an exempted source file is readable");
        let n = catalog_entries(&src);
        if n < MIN_CATALOG_ENTRIES {
            thin.push(format!("{p} holds only {n} catalog entries"));
        }
    }

    assert!(
        missing.is_empty(),
        "{} path(s) in sonar.cpd.exclusions are not in the repository:\n  {}\n\n\
         An exemption for a file that does not exist is dead config that outlives the \
         reason it was added. Remove it.",
        missing.len(),
        missing.join("\n  ")
    );

    assert!(
        thin.is_empty(),
        "{} path(s) in sonar.cpd.exclusions do not carry a declarative catalog:\n  {}\n\n\
         Copy-paste detection is switched off for these files, so any real duplication \
         in them is now unmeasured. A file earns this exemption by being a catalog — a \
         verification-matrix or units-and-provenance table whose rows are distinct \
         content in an identical shape. It does not earn it by being inconvenient. If \
         the duplication is genuine logic, refactor it instead.",
        thin.len(),
        thin.join("\n  ")
    );
}

#[test]
fn the_exemption_list_stays_bounded_sorted_and_free_of_duplicates() {
    let text = properties_text();
    let paths = excluded_paths(&text);

    assert!(
        paths.len() <= MAX_EXCLUSIONS,
        "sonar.cpd.exclusions has grown to {} entries (bound {MAX_EXCLUSIONS}). Each one \
         is a file whose duplication is no longer measured. If the list is growing, the \
         duplication is the thing to fix — raising the bound only hides more of it.",
        paths.len()
    );

    let unique: BTreeSet<&String> = paths.iter().collect();
    assert_eq!(
        unique.len(),
        paths.len(),
        "sonar.cpd.exclusions repeats a path. A duplicate entry means the list was \
         edited twice without being read once."
    );

    let mut sorted = paths.clone();
    sorted.sort();
    assert_eq!(
        sorted, paths,
        "sonar.cpd.exclusions is not in sorted order. Keeping it sorted is what makes a \
         one-line addition visible in review instead of buried mid-list."
    );
}

#[test]
fn cpd_exemptions_never_leak_into_the_analysis_exclusions() {
    let text = properties_text();
    let cpd = excluded_paths(&text);
    let analysed_out = property(&text, "sonar.exclusions").unwrap_or_default();

    let leaked: Vec<&String> = cpd
        .iter()
        .filter(|p| analysed_out.contains(p.as_str()))
        .collect();

    assert!(
        leaked.is_empty(),
        "{} catalog path(s) appear in sonar.exclusions as well as sonar.cpd.exclusions: \
         {:?}\n\n\
         The two keys are not interchangeable. sonar.cpd.exclusions switches off \
         duplication detection and leaves bugs, vulnerabilities, smells and coverage \
         fully measured; sonar.exclusions drops the file from analysis altogether. \
         Moving a catalog into sonar.exclusions would silently stop grading it for real \
         defects, and would break the deliberate pairing between sonar.exclusions and \
         cargo-tarpaulin's --exclude-files that keeps the coverage denominators equal.",
        leaked.len(),
        leaked
    );

    assert!(
        Path::new(&repo_root().join("sonar-project.properties")).exists(),
        "sonar-project.properties must exist for this guard to mean anything."
    );
}
