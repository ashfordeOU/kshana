// SPDX-License-Identifier: AGPL-3.0-only
//! Every VALIDATED row's declared oracle basis has a real oracle test behind it.
//!
//! `src/verification.rs::validated_oracle_basis` declares, for every VALIDATED row, which
//! accepted oracle kind backs it (measured data, an independent library, a published
//! reference, policy P1 or policy P2; see `docs/VALIDATION.md`, "The promotion rule") and
//! the one test that carries the comparison. The unit tests beside the table check the
//! declaration against the row's own prose. This file checks it against the disk:
//!
//! 1. the declared test file exists and contains at least one real `#[test]` function;
//! 2. a declared `::test_fn` is a real function carrying `#[test]` directly (only other
//!    attributes may sit between), and is not `#[ignore]`d, so it runs in the gate;
//! 3. `docs/VALIDATION.md` carries the written rule and names every flagged row.
//!
//! What it cannot check is whether the named test compares against the declared source:
//! that stays a human read, as the module documentation of `src/verification.rs` says.
//! Data-gated tests (the measured caesium record, PHASE.DAT) skip green when their data
//! is absent; that is their documented behaviour and is not hidden by this check.

use std::fs;
use std::path::Path;

use kshana::verification::validated_oracle_basis;

fn repo() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

/// Line index of `fn <name>` if it is a real `#[test]` (attribute block directly above it,
/// possibly with other attributes, no `#[ignore]`). Comment lines never match, because the
/// function line must itself start with `fn` (or `pub fn`) after trimming.
fn test_fn_line(src: &str, name: &str) -> Result<usize, String> {
    let lines: Vec<&str> = src.lines().collect();
    let want_a = format!("fn {name}(");
    let want_b = format!("pub fn {name}(");
    for (i, l) in lines.iter().enumerate() {
        let t = l.trim_start();
        if !(t.starts_with(&want_a) || t.starts_with(&want_b)) {
            continue;
        }
        let mut j = i;
        let mut is_test = false;
        let mut ignored = false;
        while j > 0 {
            j -= 1;
            let a = lines[j].trim();
            if !a.starts_with("#[") {
                break;
            }
            is_test |= a == "#[test]";
            ignored |= a.starts_with("#[ignore");
        }
        return match (is_test, ignored) {
            (true, false) => Ok(i),
            (true, true) => Err(format!(
                "`{name}` is #[ignore]d, so it never runs in the gate"
            )),
            (false, _) => Err(format!("`{name}` exists but is not a #[test]")),
        };
    }
    Err(format!("no function `{name}`"))
}

/// Number of real `#[test]` functions in a source file.
fn count_tests(src: &str) -> usize {
    let lines: Vec<&str> = src.lines().collect();
    let mut n = 0;
    for (i, l) in lines.iter().enumerate() {
        if l.trim() != "#[test]" {
            continue;
        }
        // Skip further attributes; the next code line must be the function.
        let next = lines[i + 1..]
            .iter()
            .map(|x| x.trim())
            .find(|x| !x.starts_with("#["));
        if next.is_some_and(|x| x.starts_with("fn ") || x.starts_with("pub fn ")) {
            n += 1;
        }
    }
    n
}

#[test]
fn every_declared_oracle_test_exists_and_runs() {
    let mut problems = Vec::new();
    for b in validated_oracle_basis() {
        let mut parts = b.oracle_test.splitn(2, "::");
        let path = parts.next().unwrap_or("");
        let func = parts.next();
        let src = match fs::read_to_string(repo().join(path)) {
            Ok(s) => s,
            Err(e) => {
                problems.push(format!("{}: {path}: {e}", b.requirement));
                continue;
            }
        };
        if count_tests(&src) == 0 {
            problems.push(format!(
                "{}: {path} contains no #[test] function",
                b.requirement
            ));
        }
        if let Some(f) = func {
            if let Err(e) = test_fn_line(&src, f) {
                problems.push(format!("{}: {path}: {e}", b.requirement));
            }
        }
    }
    assert!(
        problems.is_empty(),
        "{} VALIDATED row(s) claim an oracle basis with no oracle test behind it:\n  {}",
        problems.len(),
        problems.join("\n  ")
    );
}

#[test]
fn the_written_rule_and_every_flagged_row_are_in_validation_md() {
    let doc = fs::read_to_string(repo().join("docs/VALIDATION.md")).expect("docs/VALIDATION.md");
    for heading in [
        "## The promotion rule",
        "### What does not count",
        "### Existing VALIDATED rows re-examined under the rule",
    ] {
        assert!(
            doc.contains(heading),
            "docs/VALIDATION.md lacks `{heading}`"
        );
    }
    for b in validated_oracle_basis()
        .into_iter()
        .filter(|b| !b.flag.is_empty())
    {
        assert!(
            doc.contains(b.requirement),
            "flagged row '{}' is not named in docs/VALIDATION.md",
            b.requirement
        );
    }
}

#[test]
fn the_matcher_rejects_what_it_must() {
    let src = "#[test]\nfn good() {}\n\n#[test]\n#[ignore]\nfn skipped() {}\n\nfn helper() {}\n// fn ghost() {}\n";
    assert_eq!(test_fn_line(src, "good"), Ok(1));
    assert!(test_fn_line(src, "skipped").is_err());
    assert!(test_fn_line(src, "helper").is_err());
    assert!(test_fn_line(src, "ghost").is_err());
    assert_eq!(count_tests(src), 2);
    assert_eq!(count_tests("// #[test]\nfn x() {}\n"), 0);
}
