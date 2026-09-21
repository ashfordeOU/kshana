// SPDX-License-Identifier: AGPL-3.0-only
//! Every artefact a ledger row cites as its evidence must actually be in the repository.
//!
//! ## Why this is not already covered
//!
//! The ledger generator existence-checks the paths it turns into links
//! (`verification::gen::to_ledger_json` filters on `is_file()`) so that the published
//! matrix never shows a dead link. That is the right behaviour for a link, and it is
//! exactly why a missing evidence file is invisible: the row regenerates clean, the web
//! ledger simply shows one fewer link, and the row goes on asserting in prose that it is
//! backed by a test or a generator that is not there.
//!
//! The hazard is concrete rather than theoretical. Porting a capability between branches
//! moves `src/*.rs` and the row that describes it; the reference test, the fixture and the
//! Python oracle are separate files and are easy to leave behind. The result is a row
//! claiming an external oracle, with nothing behind it, and a green build.
//!
//! This test closes that gap by reading the rows' own prose and requiring every
//! repo-relative artefact named in it to exist on disk.
//!
//! ## What counts as a citation
//!
//! A token inside the `tests`, `oracle` or `capability` prose that looks like a
//! repo-relative path into one of the source or evidence directories and carries a known
//! artefact extension. Bare module names, `a::b::c` test paths, URLs and prose are ignored
//! — only things shaped like committed files are checked.

use std::collections::BTreeSet;
use std::path::Path;

use kshana::verification::verification_matrix;

/// Directories a citation may point into. Anything else is prose, not a citation.
const ROOTS: [&str; 7] = [
    "tests/",
    "src/",
    "examples/",
    "scripts/",
    "docs/",
    "web/",
    "benches/",
];

/// Extensions that denote a committed artefact.
const EXTS: [&str; 12] = [
    ".rs", ".py", ".sh", ".csv", ".json", ".md", ".toml", ".txt", ".c", ".java", ".npt", ".oem",
];

/// Tokens that LOOK like repo paths but are not, each with the reason it is exempt.
///
/// This list is deliberately tiny and every entry must name why. A missing evidence file
/// is never fixed by adding it here — it is fixed by committing the file or by rewording
/// the row to stop claiming it.
const NOT_REPO_PATHS: [(&str, &str); 3] = [
    (
        "src/rtkcmn.c",
        "a file inside the third-party RTKLIB distribution, named to say which of ITS \
         sources the cross-check was taken from; it is not vendored here",
    ),
    (
        "src/x.rs",
        "the generic form used in prose to describe the src/<module>.rs convention",
    ),
    (
        "src/x/mod.rs",
        "the generic form used in prose to describe the src/<module>/mod.rs convention",
    ),
];

/// Split prose into candidate path tokens. Punctuation that commonly abuts a path in a
/// sentence is trimmed, but a trailing `.rs`/`.py` must survive, so the trim is one-sided
/// and character-specific rather than a blanket strip.
fn tokens(field: &str) -> Vec<String> {
    field
        .split(|c: char| {
            c.is_whitespace() || matches!(c, ',' | ';' | '(' | ')' | '[' | ']' | '`' | '"' | '\'')
        })
        .map(|t| t.trim_end_matches([':', '.', '!', '?']).trim())
        .filter(|t| !t.is_empty())
        .map(str::to_string)
        .collect()
}

fn looks_like_repo_artefact(tok: &str) -> bool {
    // `tests/foo.rs::some_test` is a citation of tests/foo.rs.
    let path = tok.split("::").next().unwrap_or(tok);
    ROOTS.iter().any(|r| path.starts_with(r)) && EXTS.iter().any(|e| path.ends_with(e))
}

fn path_of(tok: &str) -> String {
    tok.split("::").next().unwrap_or(tok).to_string()
}

#[test]
fn every_artefact_a_row_cites_is_present_in_the_repository() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let exempt: BTreeSet<&str> = NOT_REPO_PATHS.iter().map(|(p, _)| *p).collect();

    let items = verification_matrix();
    assert!(
        items.len() >= 100,
        "the ledger reported only {} rows; this guard is meaningless on a truncated \
         matrix.",
        items.len()
    );

    let mut checked = 0usize;
    let mut missing: Vec<String> = Vec::new();
    for it in &items {
        for field in [it.tests, it.oracle, it.capability] {
            for tok in tokens(field) {
                if !looks_like_repo_artefact(&tok) {
                    continue;
                }
                let p = path_of(&tok);
                if exempt.contains(p.as_str()) {
                    continue;
                }
                checked += 1;
                if !root.join(&p).exists() {
                    missing.push(format!("{}  <-  row \"{}\"", p, it.requirement));
                }
            }
        }
    }

    // A scanner that matched nothing would pass silently, which is the failure mode this
    // whole file exists to prevent. The bound is set from the measured figure -- 138
    // citations across the 150 rows present when this guard was written -- with headroom
    // below it so ordinary editing never trips it, and far enough above zero that a
    // broken matcher does.
    assert!(
        checked >= 120,
        "the citation scanner matched only {checked} artefact paths across {} rows. The \
         prose style has probably changed — fix the scanner, do not lower this bound, or \
         the guard becomes decorative.",
        items.len()
    );

    assert!(
        missing.is_empty(),
        "{} ledger row citation(s) name an artefact that is not in the repository:\n  {}\n\n\
         A row that cites evidence the repo does not hold is an unbacked claim, and the \
         generator will not catch it: it filters dead links out of the published ledger, \
         so the row regenerates clean either way. Commit the missing file, or reword the \
         row to stop claiming it.",
        missing.len(),
        missing.join("\n  ")
    );
}

#[test]
fn the_exemption_list_stays_short_and_every_entry_is_justified() {
    for (path, why) in NOT_REPO_PATHS {
        assert!(
            why.len() > 30,
            "the exemption for {path} does not say why it is exempt. An unexplained \
             exemption is how a real missing-evidence bug gets filed away as expected."
        );
        assert!(
            !Path::new(env!("CARGO_MANIFEST_DIR")).join(path).exists(),
            "{path} is on the exemption list but DOES exist in the repository. Remove the \
             exemption so the path is checked like any other."
        );
    }
    assert!(
        NOT_REPO_PATHS.len() <= 6,
        "the exemption list has grown to {} entries. Each one is a citation this guard no \
         longer checks; if the list is growing, the row prose is the thing to fix.",
        NOT_REPO_PATHS.len()
    );
}
