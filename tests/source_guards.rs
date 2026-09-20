// SPDX-License-Identifier: AGPL-3.0-only
//! **Structural guards over the source tree itself.**
//!
//! Two classes of defect reached the canonical gate as intermittent or spurious reds.
//! Both were real; both were fixed at the instance. This file closes the *class*, by
//! scanning the checked-in Rust sources for the shape of each bug.
//!
//! ## Guard 1 — a temp path with no per-call unique component
//!
//! `two_vintage_report(kept, tag)` in `src/realtime_frame_eop.rs` keyed its temp files on
//! `{tag}_{pid}`. Three tests reach it with the same tag, and cargo runs the *library*
//! tests as parallel threads of ONE process, so the pid is shared and the three racing
//! calls collided on one pair of files: whichever finished first deleted them while
//! another was still reading. The identical code passed on one commit and failed on the
//! next — a coin toss dressed as a green. [`temp_paths_all_carry_a_per_call_unique_component`]
//! rejects every constructed temp path that has no per-call unique component. **A pid is
//! not one**: it is shared by every thread in the process, so it separates concurrent
//! `cargo test` *processes* and nothing inside one.
//!
//! What counts as unique-per-call: a process-wide atomic counter (`fetch_add`), a
//! `tempfile`-crate handle that generates its own name, a UUID, or a value derived from
//! one of those. A wall-clock reading does **not** count — two threads can read the same
//! nanosecond.
//!
//! ## Guard 2 — a byte-for-byte pin with no declared scope
//!
//! `src/lunar_frame_campaign.rs` pinned a report byte-for-byte (length + FNV hash). A
//! later, unrelated, cross-cutting change — a `units` block added to every scenario —
//! grew the report 2938 -> 5620 bytes and turned the pin red. Nothing the pin was *about*
//! had changed: it had quietly become a change detector for the whole repository.
//!
//! [`every_pin_declares_its_scope`] requires every pin literal to carry, near it or at
//! module level, a two-line declaration:
//!
//! ```text
//! // PIN-SCOPE:    what this pin covers
//! // PIN-EXCLUDES: what it deliberately does not cover
//! ```
//!
//! "The whole document, deliberately — nothing excluded" is a perfectly legal
//! `PIN-EXCLUDES`. The point is not to narrow pins, it is that the scope is *stated*, so
//! the author of the next cross-cutting change can tell at a glance which pins are in
//! scope and which have just become tripwires.
//!
//! The pair may sit in the **enclosing function** (its body, its attributes or its doc
//! comment), within 32 lines above a pin that is outside any function, or — for a file
//! whose whole purpose is pinning — in the module's `//!` header, where it covers every
//! pin in the file. A `///` at the top of a file documents the first item, not the module,
//! and does not count as a module-level declaration.
//!
//! **Why a comment marker and not an attribute or a required constant.** A Rust attribute
//! on a statement or an expression needs a proc macro — a new dependency, compiled into
//! every build, to carry a string nothing reads at runtime. A required `const` beside the
//! pin is enforceable but silently detachable: a const can drift next to the wrong pin and
//! still satisfy the checker. The marker comment costs nothing to compile, is greppable
//! (`git grep PIN-SCOPE` enumerates every pin in the repository in one command), and —
//! the property that matters — it sits in the diff hunk of any change that touches the
//! pinned line, which is exactly where the next author needs to read it.
//!
//! ## What these guards do NOT catch
//!
//! * **Guard 1** judges each constructed path expression, resolving bindings by lexical
//!   order over the whole file rather than by real scope analysis. Two same-named
//!   bindings in different functions resolve to the nearest preceding one, which is right
//!   in practice but is not a borrow-checker. It sees only *paths built from a temp
//!   directory*: a fixed path under the repo, a hard-coded `/tmp/...` string literal, or
//!   a shared name passed in from outside the file is out of its reach.
//! * **Guard 1** says nothing about non-path shared state — a static `Mutex`, a shared
//!   env var, a fixed network port. Those are the same class of bug and this guard does
//!   not cover them.
//! * **Guard 2** recognises a pin by its literal: a digest-width hex string, a long hex or
//!   decimal integer, a byte length compared against a magic number, a name that marks a
//!   byte count, or a comparison against a file under `tests/golden/`. A pin held in a
//!   *named* constant whose value is short, or a length compared against a variable, is
//!   caught only when it sits inside the declaration window of a pin that *is* recognised
//!   — which is the case for every such pin in the tree today, but is a property of
//!   today's tree, not a guarantee.
//! * **Guard 2** cannot judge whether a declared scope is *true*. It enforces that a scope
//!   is stated, not that the statement is honest.
//! * Both guards skip **this file**, which contains deliberately-broken snippets as test
//!   fixtures. Nothing else is exempt.
//!
//! Cost: both guards read every `.rs` file under `src/`, `tests/` and `examples/` once
//! and scan them as text — tens of milliseconds, no build of the code under scan.

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

// ---------------------------------------------------------------------------------------
// Shared lexing
// ---------------------------------------------------------------------------------------

/// Blank out comments, preserving line numbering so a finding's line number still points
/// at the real source line. String, char and raw-string literals are left intact: a pin
/// literal lives inside one.
fn strip_comments(src: &str) -> String {
    let b: Vec<char> = src.chars().collect();
    let mut out = String::with_capacity(src.len());
    let mut i = 0usize;
    while i < b.len() {
        let c = b[i];
        // Raw string: r"..." / r#"..."# / br#"..."#. Must be recognised before the
        // line-comment branch, since a raw string can contain `//`.
        let raw_start = (c == 'r' || c == 'b')
            && !(i > 0 && (b[i - 1].is_alphanumeric() || b[i - 1] == '_'))
            && {
                let mut j = i;
                if b[j] == 'b' {
                    j += 1;
                }
                if j < b.len() && b[j] == 'r' {
                    j += 1;
                    while j < b.len() && b[j] == '#' {
                        j += 1;
                    }
                    j < b.len() && b[j] == '"'
                } else {
                    false
                }
            };
        if raw_start {
            let mut j = i;
            if b[j] == 'b' {
                out.push(b[j]);
                j += 1;
            }
            out.push(b[j]); // 'r'
            j += 1;
            let mut hashes = 0usize;
            while b[j] == '#' {
                hashes += 1;
                out.push('#');
                j += 1;
            }
            out.push('"'); // opening quote
            j += 1;
            loop {
                if j >= b.len() {
                    break;
                }
                if b[j] == '"' {
                    let mut k = j + 1;
                    let mut n = 0;
                    while k < b.len() && b[k] == '#' && n < hashes {
                        k += 1;
                        n += 1;
                    }
                    if n == hashes {
                        for ch in b.iter().take(k).skip(j) {
                            out.push(*ch);
                        }
                        j = k;
                        break;
                    }
                }
                out.push(b[j]);
                j += 1;
            }
            i = j;
            continue;
        }
        if c == '/' && i + 1 < b.len() && b[i + 1] == '/' {
            while i < b.len() && b[i] != '\n' {
                out.push(' ');
                i += 1;
            }
            continue;
        }
        if c == '/' && i + 1 < b.len() && b[i + 1] == '*' {
            let mut depth = 1usize;
            out.push(' ');
            out.push(' ');
            i += 2;
            while i < b.len() && depth > 0 {
                if b[i] == '/' && i + 1 < b.len() && b[i + 1] == '*' {
                    depth += 1;
                    out.push(' ');
                    out.push(' ');
                    i += 2;
                    continue;
                }
                if b[i] == '*' && i + 1 < b.len() && b[i + 1] == '/' {
                    depth -= 1;
                    out.push(' ');
                    out.push(' ');
                    i += 2;
                    continue;
                }
                out.push(if b[i] == '\n' { '\n' } else { ' ' });
                i += 1;
            }
            continue;
        }
        if c == '"' {
            out.push(c);
            i += 1;
            while i < b.len() {
                if b[i] == '\\' && i + 1 < b.len() {
                    out.push(b[i]);
                    out.push(b[i + 1]);
                    i += 2;
                    continue;
                }
                out.push(b[i]);
                if b[i] == '"' {
                    i += 1;
                    break;
                }
                i += 1;
            }
            continue;
        }
        if c == '\'' {
            // A char literal with an escape (`'\''`, `'\\'`) would otherwise confuse the
            // scanner; a lifetime (`'a`) is harmless to copy verbatim.
            out.push(c);
            i += 1;
            if i < b.len() && b[i] == '\\' {
                while i < b.len() && b[i] != '\'' {
                    out.push(b[i]);
                    i += 1;
                }
            }
            continue;
        }
        out.push(c);
        i += 1;
    }
    out
}

/// True when `needle` occurs in `hay` delimited by non-identifier characters.
fn has_word(hay: &str, needle: &str) -> bool {
    if needle.is_empty() {
        return false;
    }
    let hb = hay.as_bytes();
    let nb = needle.as_bytes();
    let ident = |c: u8| c.is_ascii_alphanumeric() || c == b'_';
    let mut from = 0usize;
    while let Some(rel) = hay[from..].find(needle) {
        let at = from + rel;
        let before_ok = at == 0 || !ident(hb[at - 1]);
        let after = at + nb.len();
        let after_ok = after >= hb.len() || !ident(hb[after]);
        if before_ok && after_ok {
            return true;
        }
        from = at + 1;
    }
    false
}

/// Every `.rs` file the guards scan: `src/`, `tests/` and `examples/`, recursively.
/// `xval/`, `mcp/` and `ide/` are workspace-excluded standalone projects with their own
/// lockfiles and are not built by this crate's gate, so they are out of scope here.
fn rust_sources(root: &Path) -> Vec<PathBuf> {
    fn walk(dir: &Path, out: &mut Vec<PathBuf>) {
        let Ok(rd) = std::fs::read_dir(dir) else {
            return;
        };
        let mut entries: Vec<PathBuf> = rd.filter_map(Result::ok).map(|e| e.path()).collect();
        entries.sort();
        for p in entries {
            if p.is_dir() {
                let name = p.file_name().and_then(|n| n.to_str()).unwrap_or("");
                if name == "target" || name == "fixtures" {
                    continue;
                }
                walk(&p, out);
            } else if p.extension().is_some_and(|e| e == "rs") {
                out.push(p);
            }
        }
    }
    let mut out = Vec::new();
    for sub in ["src", "tests", "examples"] {
        walk(&root.join(sub), &mut out);
    }
    // This file carries deliberately-broken snippets as fixtures; scanning it would
    // report them. Stated in the module doc as the one exemption.
    out.retain(|p| p.file_name().and_then(|n| n.to_str()) != Some("source_guards.rs"));
    out
}

fn repo_root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn rel(root: &Path, p: &Path) -> String {
    p.strip_prefix(root)
        .unwrap_or(p)
        .to_string_lossy()
        .into_owned()
}

/// One guard violation.
#[derive(Debug, PartialEq, Eq)]
struct Finding {
    line: usize,
    detail: String,
}

// ---------------------------------------------------------------------------------------
// Guard 1 — temp paths must carry a per-call unique component
// ---------------------------------------------------------------------------------------

/// An initialiser that makes a value unique for every call, so anything derived from it
/// is unique too.
const UNIQUE_MAKERS: &[&str] = &[
    "fetch_add(",    // a process-wide atomic sequence: the F22 fix
    "fetch_update(", //
    "TempDir::new",  // tempfile crate: the handle generates its own random name
    "tempdir(",      //
    "tempdir_in(",   //
    "NamedTempFile::new",
    "NamedTempFile::with",
    "tempfile(",
    "tempfile::",
    "Uuid::new",
    "uuid::Uuid",
];

/// Roots a path in the system temp directory.
const TEMP_ROOTS: &[&str] = &[
    "temp_dir()",
    "TempDir::new",
    "tempdir(",
    "tempdir_in(",
    "NamedTempFile::new",
    "NamedTempFile::with",
    "tempfile(",
];

/// Split comment-stripped source into statement-sized chunks, each with its 1-based
/// starting line. Splits on `;`, `{` and `}` outside string literals; a multi-line
/// `format!(...)` has no such separator inside it, so it stays whole.
fn chunks(code: &str) -> Vec<(usize, String)> {
    let mut out = Vec::new();
    let mut cur = String::new();
    // Tracked, not recomputed: `cur.trim().is_empty()` per character is quadratic in the
    // chunk length and made this guard take a minute over the tree instead of a second.
    let mut nonblank = false;
    let mut line = 1usize; // line of the cursor
    let mut start_line = 1usize; // line the current chunk started on
    let mut in_str = false;
    let mut esc = false;
    for c in code.chars() {
        if in_str {
            cur.push(c);
            if esc {
                esc = false;
            } else if c == '\\' {
                esc = true;
            } else if c == '"' {
                in_str = false;
            }
        } else if c == '"' {
            if !nonblank {
                start_line = line;
            }
            nonblank = true;
            in_str = true;
            cur.push(c);
        } else if c == ';' || c == '{' || c == '}' {
            if nonblank {
                out.push((start_line, std::mem::take(&mut cur)));
            } else {
                cur.clear();
            }
            nonblank = false;
            start_line = line;
        } else {
            if !c.is_whitespace() && !nonblank {
                start_line = line;
                nonblank = true;
            }
            cur.push(c);
        }
        if c == '\n' {
            line += 1;
            if !nonblank {
                start_line = line;
            }
        }
    }
    if nonblank {
        out.push((start_line, cur));
    }
    out
}

/// `let [mut] NAME = ...` -> (NAME, rhs). Destructuring patterns are ignored: they never
/// bind a path in this tree, and guessing at them would invent bindings.
fn parse_let(chunk: &str) -> Option<(String, String)> {
    let t = chunk.trim_start();
    let rest = t.strip_prefix("let ")?.trim_start();
    let rest = rest.strip_prefix("mut ").unwrap_or(rest).trim_start();
    let eq = rest.find('=')?;
    let name = rest[..eq]
        .split(':')
        .next()
        .unwrap_or("")
        .trim()
        .to_string();
    if name.is_empty()
        || !name.chars().all(|c| c.is_ascii_alphanumeric() || c == '_')
        || name.chars().next().is_some_and(|c| c.is_ascii_digit())
    {
        return None;
    }
    Some((name, rest[eq + 1..].to_string()))
}

/// Scan one file for temp paths with no per-call unique component.
///
/// `raw` is the original text (waiver markers live in comments); the analysis runs over
/// the comment-stripped form.
fn scan_temp_paths(raw: &str) -> Vec<Finding> {
    let code = strip_comments(raw);
    let raw_lines: Vec<&str> = raw.lines().collect();
    let mut temp_ids: Vec<String> = Vec::new();
    let mut unique_ids: BTreeSet<String> = BTreeSet::new();
    let mut findings = Vec::new();

    for (line, chunk) in chunks(&code) {
        let (bind, rhs) = match parse_let(&chunk) {
            Some((n, r)) => (Some(n), r),
            None => (None, chunk.clone()),
        };

        let direct_root = TEMP_ROOTS.iter().any(|t| rhs.contains(t));
        // A binding already rooted in temp, reached through a path operation.
        let via_id = temp_ids.iter().rev().find(|id| {
            rhs.contains(&format!("{id}.join("))
                || rhs.contains(&format!("{id}.path("))
                || rhs.contains(&format!("{id}.to_path_buf("))
                || rhs.contains(&format!("{id}.as_path("))
        });
        let is_temp = direct_root || via_id.is_some();

        let unique_here = UNIQUE_MAKERS.iter().any(|m| rhs.contains(m));
        let refs_unique = unique_ids.iter().any(|id| has_word(&rhs, id));
        let root_unique = via_id.is_some_and(|id| unique_ids.contains(id));
        let unique = unique_here || refs_unique || root_unique;

        if is_temp && rhs.contains(".join(") && !unique {
            // A waiver on the offending line or the three lines above suppresses it.
            let waived = (line.saturating_sub(3)..=line)
                .filter_map(|l| raw_lines.get(l.saturating_sub(1)))
                .any(|l| l.contains("PATH-UNIQUE-WAIVER"));
            if !waived {
                let why = if rhs.contains("process::id()") || has_word(&rhs, "pid") {
                    "keyed on the process id, which every thread of one cargo test process shares"
                } else {
                    "no per-call unique component"
                };
                let mut snippet: String = rhs.split_whitespace().collect::<Vec<_>>().join(" ");
                snippet.truncate(140);
                findings.push(Finding {
                    line,
                    detail: format!("temp path {why}: {snippet}"),
                });
            }
        }

        if let Some(name) = bind {
            // Length >= 2: a one-letter binding marked unique would match far too much
            // text by word search and could launder a genuine collision into a green.
            //
            // Only a binding that MAKES uniqueness (an atomic tick, a tempfile handle) or
            // a temp path that already has it joins the set. Propagating through every
            // binding that merely mentions a unique one would cascade across the whole
            // file — and cost O(bindings^2) text searches to do it.
            if name.len() >= 2 && (unique_here || (is_temp && refs_unique)) {
                unique_ids.insert(name.clone());
            }
            if is_temp && !temp_ids.contains(&name) {
                temp_ids.push(name);
            }
        }
    }
    findings
}

// ---------------------------------------------------------------------------------------
// Guard 2 — every pin declares its scope
// ---------------------------------------------------------------------------------------

/// Published algorithm constants wide enough to look like a digest but which are not
/// pins. Matched by VALUE, so a report fingerprint cannot hide behind the name of one.
const ALGORITHM_CONSTANTS: &[(&str, &str)] = &[
    ("cbf29ce484222325", "FNV-1a 64 offset basis"),
    ("100000001b3", "FNV-1a 64 prime"),
    (
        "9e3779b97f4a7c15",
        "golden-ratio / Weyl sequence multiplier",
    ),
    ("bf58476d1ce4e5b9", "SplitMix64 multiplier"),
    ("94d049bb133111eb", "SplitMix64 multiplier"),
    ("d1b54a32d192ed03", "SplitMix64 / hash stream multiplier"),
    ("2545f4914f6cdd1d", "xorshift* multiplier"),
    ("ff51afd7ed558ccd", "MurmurHash3 finaliser"),
    ("c4ceb9fe1a85ec53", "MurmurHash3 finaliser"),
];

/// The same idea for base-10: published linear-congruential parameters, wide enough to
/// look like a `u64` fingerprint. Matched by value, like the hex list above.
const ALGORITHM_CONSTANTS_DEC: &[(&str, &str)] = &[
    ("6364136223846793005", "Knuth MMIX LCG multiplier"),
    ("1442695040888963407", "Knuth MMIX LCG increment"),
    ("2862933555777941757", "L'Ecuyer 64-bit LCG multiplier"),
    ("3935559000370003845", "L'Ecuyer 64-bit LCG multiplier"),
];

/// A wide literal on one of these lines is an RNG seed or a salt — an input to the run,
/// not a fingerprint of its output.
const SEED_CONTEXT: &[&str] = &[
    "seed_from_u64(",
    "Rng::new(",
    "ChaCha8Rng::",
    "seed:",
    "seed =",
    "_SEED",
    "SALT",
    "salt",
    "base_seed",
    ".seed",
];

/// Names that mark a pinned byte count even when the number itself is small.
const LENGTH_PIN_NAMES: &[&str] = &[
    "expect_len",
    "expected_len",
    "expect_bytes",
    "expected_bytes",
    "byte_len",
    "_LEN_BYTES",
    "BYTE_LENGTH",
];

/// Smallest `.len()` literal treated as a pinned byte count rather than a cardinality
/// check. Collection-size assertions in this tree are all well under this; document byte
/// counts are all well over it.
const LENGTH_PIN_FLOOR: u64 = 256;

fn hex_digits(s: &str) -> usize {
    s.chars().filter(|c| c.is_ascii_hexdigit()).count()
}

fn normalise_hex(s: &str) -> String {
    s.chars()
        .filter(|c| c.is_ascii_hexdigit())
        .collect::<String>()
        .to_ascii_lowercase()
        .trim_start_matches('0')
        .to_string()
}

/// What, if anything, made this line look like a pin.
fn pin_reasons(code_line: &str) -> Vec<String> {
    let mut out = Vec::new();
    let b: Vec<char> = code_line.chars().collect();
    let ident = |c: char| c.is_ascii_alphanumeric() || c == '_';
    let seedy = SEED_CONTEXT.iter().any(|s| code_line.contains(s));

    // --- wide hex integer literals ---------------------------------------------------
    let mut hex_spans: Vec<(usize, usize)> = Vec::new();
    let mut i = 0usize;
    while i + 1 < b.len() {
        if b[i] == '0' && (b[i + 1] == 'x' || b[i + 1] == 'X') {
            let mut j = i + 2;
            while j < b.len() && (b[j].is_ascii_hexdigit() || b[j] == '_') {
                j += 1;
            }
            let lit: String = b[i + 2..j].iter().collect();
            hex_spans.push((i, j));
            if hex_digits(&lit) >= 16 {
                let norm = normalise_hex(&lit);
                let known = ALGORITHM_CONSTANTS.iter().any(|(v, _)| *v == norm);
                if !known && !seedy {
                    out.push(format!(
                        "64-bit hex fingerprint literal 0x{}",
                        lit.trim_end_matches('_')
                    ));
                }
            }
            i = j;
            continue;
        }
        i += 1;
    }

    // --- wide decimal integer literals (a u64 fingerprint written in base 10) ---------
    let mut i = 0usize;
    while i < b.len() {
        if hex_spans.iter().any(|(s, e)| i >= *s && i < *e) {
            i += 1;
            continue;
        }
        if b[i].is_ascii_digit() && (i == 0 || (!ident(b[i - 1]) && b[i - 1] != '.')) {
            let mut j = i;
            let mut digits = 0usize;
            while j < b.len() && (b[j].is_ascii_digit() || b[j] == '_') {
                if b[j].is_ascii_digit() {
                    digits += 1;
                }
                j += 1;
            }
            let trailing_float = j < b.len() && (b[j] == '.' || b[j] == 'e' || b[j] == 'E');
            let lit: String = b[i..j].iter().collect();
            let bare: String = lit.chars().filter(|c| c.is_ascii_digit()).collect();
            let known = ALGORITHM_CONSTANTS_DEC.iter().any(|(v, _)| *v == bare);
            if digits >= 18 && !trailing_float && !seedy && !known {
                out.push(format!("decimal fingerprint literal {lit}"));
            }
            i = j;
            continue;
        }
        i += 1;
    }

    // --- digest-width hex string literals ---------------------------------------------
    let mut i = 0usize;
    while i < b.len() {
        if b[i] == '"' {
            let mut j = i + 1;
            while j < b.len() && b[j] != '"' {
                j += 1;
            }
            if j < b.len() {
                let lit: String = b[i + 1..j].iter().collect();
                let n = lit.chars().count();
                if matches!(n, 32 | 40 | 64 | 128) && lit.chars().all(|c| c.is_ascii_hexdigit()) {
                    out.push(format!("{n}-character hex digest literal"));
                }
                i = j + 1;
                continue;
            }
        }
        i += 1;
    }

    // --- a length pinned against a magic number ----------------------------------------
    if code_line.contains("assert") {
        if let Some(at) = code_line.find(".len()") {
            if let Some(rest) = code_line[at + 6..].trim_start().strip_prefix(',') {
                let rest = rest.trim_start();
                let raw: String = rest
                    .chars()
                    .take_while(|c| c.is_ascii_digit() || *c == '_')
                    .collect();
                // A bare literal is a pin; `3600 / 30 + 1` is a count derived from the
                // scenario under test and moves with it by design.
                let bare = matches!(
                    rest[raw.len()..].trim_start().chars().next(),
                    Some(',') | Some(')') | None
                );
                let digits: String = raw.chars().filter(|c| c.is_ascii_digit()).collect();
                if let Ok(v) = digits.parse::<u64>() {
                    if v >= LENGTH_PIN_FLOOR && bare {
                        out.push(format!("length pinned to {v}"));
                    }
                }
            }
        }
    }

    // --- a named byte-count pin --------------------------------------------------------
    for n in LENGTH_PIN_NAMES {
        if has_word(code_line, n) {
            out.push(format!("named byte-count pin `{n}`"));
            break;
        }
    }

    // --- a golden file on disk ----------------------------------------------------------
    // The path alone is not enough: a row of the verification matrix cites `tests/golden.rs`
    // as prose, and a scenario description names its golden CSV. What marks a pin is a path
    // under `golden/` (or a `.sha256` sidecar) that is actually read, written or asserted.
    let touches_disk = [
        "include_str!",
        "read_to_string",
        "fs::write",
        "fs::read",
        "assert",
    ]
    .iter()
    .any(|k| code_line.contains(k))
        || code_line.contains(".join(");
    if (code_line.contains("golden/") && touches_disk) || code_line.contains(".sha256\"") {
        out.push("comparison against a committed golden file".to_string());
    }

    out
}

/// Lines within which a `PIN-SCOPE:` / `PIN-EXCLUDES:` pair counts as covering a pin,
/// when the pin is not inside a function (a top-level `const`, say).
const SCOPE_WINDOW: usize = 32;

/// How far up the file to look for the enclosing function signature.
const ITEM_SEARCH_LIMIT: usize = 250;

fn is_fn_signature(line: &str) -> bool {
    let t = line.trim_start();
    for p in [
        "fn ",
        "pub fn ",
        "pub(crate) fn ",
        "pub(super) fn ",
        "async fn ",
        "pub async fn ",
        "pub(crate) async fn ",
        "const fn ",
        "pub const fn ",
    ] {
        if t.starts_with(p) {
            return true;
        }
    }
    false
}

/// First line of the *function* enclosing `idx`, extended upwards over its contiguous
/// attributes and doc comments. `None` when `idx` is not inside a function within
/// [`ITEM_SEARCH_LIMIT`] lines.
///
/// This is what lets a declaration live in the test's doc comment rather than being
/// repeated above each of the three hashes it covers. It matches braces walking backwards
/// (over the comment-stripped text, so a brace in a comment cannot mislead it), because
/// the *nearest preceding* `fn` is often a helper nested inside the test — the outer test
/// is the enclosing one, and a declaration on it must count.
fn enclosing_item_start(code: &[&str], raw: &[&str], idx: usize) -> Option<usize> {
    let floor = idx.saturating_sub(ITEM_SEARCH_LIMIT);
    let mut depth = 0i32;
    let mut line = idx;
    loop {
        let text = code.get(line).copied().unwrap_or("");
        let mut opened = false;
        for c in text.chars().rev() {
            match c {
                '}' => depth += 1,
                '{' => {
                    if depth == 0 {
                        opened = true;
                        break;
                    }
                    depth -= 1;
                }
                _ => {}
            }
        }
        if opened {
            // `line` opens the block holding the pin. A signature can wrap over several
            // lines, so look a short way up for the `fn` keyword before giving up on it.
            let mut sig = line;
            for _ in 0..8 {
                if is_fn_signature(code[sig]) {
                    let mut lo = sig;
                    while lo > 0 {
                        let p = raw[lo - 1].trim_start();
                        if p.starts_with("#[") || p.starts_with("//") {
                            lo -= 1;
                        } else {
                            break;
                        }
                    }
                    return Some(lo);
                }
                if sig == 0 {
                    break;
                }
                sig -= 1;
            }
            // An `impl`, `mod`, `match` or loop body — keep walking outward.
        }
        if line == floor || line == 0 {
            return None;
        }
        line -= 1;
    }
}

fn scan_pin_scopes(raw: &str) -> Vec<Finding> {
    let code = strip_comments(raw);
    let code_lines: Vec<&str> = code.lines().collect();
    let raw_lines: Vec<&str> = raw.lines().collect();

    // A declaration in the module header covers every pin in the file. It must be an
    // INNER doc comment (`//!`): a `///` at the top of a file documents the first item,
    // not the module, and treating it as a module header would let one item's declaration
    // silently cover the whole file.
    let (mod_scope, mod_excl) = raw_lines
        .iter()
        .take_while(|l| {
            let t = l.trim_start();
            t.starts_with("//") || t.starts_with("#!") || t.is_empty()
        })
        .fold((false, false), |(s, e), l| {
            let inner = l.trim_start().starts_with("//!");
            (
                s || (inner && l.contains("PIN-SCOPE:")),
                e || (inner && l.contains("PIN-EXCLUDES:")),
            )
        });
    let module_declared = mod_scope && mod_excl;

    let mut findings = Vec::new();
    for (idx, cl) in code_lines.iter().enumerate() {
        let reasons = pin_reasons(cl);
        if reasons.is_empty() || module_declared {
            continue;
        }
        let hi = idx.min(raw_lines.len().saturating_sub(1));
        // Either the enclosing function (signature, attributes and doc comment included)
        // or, for a pin outside any function, a fixed window above it.
        // Inside a function, the declaration must live in that function (or on its doc
        // comment) — not merely within 32 lines, which would let one test's declaration
        // cover the next test's pin. The fixed window applies only to a pin that sits
        // outside any function, such as a top-level `const`.
        let lo = enclosing_item_start(&code_lines, &raw_lines, hi)
            .unwrap_or_else(|| idx.saturating_sub(SCOPE_WINDOW));
        let window = &raw_lines[lo..=hi];
        let has_scope = window.iter().any(|l| l.contains("PIN-SCOPE:"));
        let has_excl = window.iter().any(|l| l.contains("PIN-EXCLUDES:"));
        if has_scope && has_excl {
            continue;
        }
        let missing = match (has_scope, has_excl) {
            (false, false) => "PIN-SCOPE: and PIN-EXCLUDES:",
            (true, false) => "PIN-EXCLUDES:",
            _ => "PIN-SCOPE:",
        };
        findings.push(Finding {
            line: idx + 1,
            detail: format!("{} — add `{missing}` above it", reasons.join("; ")),
        });
    }
    findings
}

// ---------------------------------------------------------------------------------------
// The guards, over the real tree
// ---------------------------------------------------------------------------------------

fn report(name: &str, all: Vec<(String, Finding)>, how: &str) {
    if all.is_empty() {
        return;
    }
    let mut msg = format!("\n{} — {} violation(s):\n\n", name, all.len());
    for (file, f) in &all {
        msg.push_str(&format!("  {}:{}  {}\n", file, f.line, f.detail));
    }
    msg.push_str(&format!("\n{how}\n"));
    panic!("{msg}");
}

#[test]
fn temp_paths_all_carry_a_per_call_unique_component() {
    let root = repo_root();
    let files = rust_sources(&root);
    // An empty scan is not a green.
    assert!(
        files.len() > 250,
        "the scan found only {} Rust sources — it is looking in the wrong place",
        files.len()
    );
    let mut all = Vec::new();
    for p in &files {
        let Ok(src) = std::fs::read_to_string(p) else {
            continue;
        };
        for f in scan_temp_paths(&src) {
            all.push((rel(&root, p), f));
        }
    }
    report(
        "temp-path uniqueness guard",
        all,
        "Cargo runs the library tests as parallel threads of ONE process, so a path keyed \
         on the process id is shared by every one of them. Fold a process-wide \
         `AtomicU64::fetch_add` into the file name, or use a `tempfile` handle that \
         generates its own. If a path genuinely must be shared, say why on the line above \
         it with `PATH-UNIQUE-WAIVER: <reason>`.",
    );
}

#[test]
fn every_pin_declares_its_scope() {
    let root = repo_root();
    let files = rust_sources(&root);
    assert!(
        files.len() > 250,
        "the scan found only {} Rust sources — it is looking in the wrong place",
        files.len()
    );
    let mut all = Vec::new();
    for p in &files {
        let Ok(src) = std::fs::read_to_string(p) else {
            continue;
        };
        for f in scan_pin_scopes(&src) {
            all.push((rel(&root, p), f));
        }
    }
    report(
        "pin-scope declaration guard",
        all,
        "A byte-for-byte or hash pin with no declared scope becomes a change detector for \
         the whole repository — that is finding F25. State what it covers, directly above \
         it or in the module `//!` header:\n\
         \n  // PIN-SCOPE:    the lunar-frame-realisation JSON, summary and SVG\n  \
         // PIN-EXCLUDES: the top-level `units` block, stripped before hashing\n\
         \n\"the whole document, deliberately — nothing excluded\" is a legal \
         PIN-EXCLUDES. The requirement is that it is stated.",
    );
}

// ---------------------------------------------------------------------------------------
// The guards, graded against known-bad and known-good snippets
//
// A guard nobody tried to defeat is not a guard. These snippets are fixed literals — the
// detector cannot influence them — and each class is checked in both directions: the
// defect must fire, and the shipped fix must be silent.
// ---------------------------------------------------------------------------------------

/// The F22 defect, verbatim in shape: three tests reach this with the same `tag`, and the
/// pid is shared across the threads of one test process.
const F22_BUG: &str = r#"
fn two_vintage_report(kept: usize, tag: &str) -> Value {
    let dir = std::env::temp_dir();
    let pid = std::process::id();
    let a = dir.join(format!("kshana_g13_issued_{tag}_{pid}.txt"));
    let b = dir.join(format!("kshana_g13_later_{tag}_{pid}.txt"));
    std::fs::write(&a, &as_issued).unwrap();
}
"#;

/// The shipped fix: a process-wide atomic sequence folded into both names.
const F22_FIXED: &str = r#"
static TWO_VINTAGE_SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
fn two_vintage_report(kept: usize, tag: &str) -> Value {
    let dir = std::env::temp_dir();
    let pid = std::process::id();
    let seq = TWO_VINTAGE_SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let a = dir.join(format!("kshana_g13_issued_{tag}_{pid}_{seq}.txt"));
    let b = dir.join(format!("kshana_g13_later_{tag}_{pid}_{seq}.txt"));
    std::fs::write(&a, &as_issued).unwrap();
}
"#;

/// The fix with the unique component removed from ONE of the two paths — the partial
/// regression a whole-function check would wave through.
const F22_HALF_FIXED: &str = r#"
static TWO_VINTAGE_SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
fn two_vintage_report(kept: usize, tag: &str) -> Value {
    let dir = std::env::temp_dir();
    let pid = std::process::id();
    let seq = TWO_VINTAGE_SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let a = dir.join(format!("kshana_g13_issued_{tag}_{pid}.txt"));
    let b = dir.join(format!("kshana_g13_later_{tag}_{pid}_{seq}.txt"));
}
"#;

#[test]
fn guard1_fires_on_the_f22_defect_and_is_silent_on_its_fix() {
    let bug = scan_temp_paths(F22_BUG);
    assert_eq!(
        bug.len(),
        2,
        "the F22 shape must be reported on BOTH colliding paths, got {bug:?}"
    );
    assert!(
        bug[0].detail.contains("process id"),
        "the message must name the pid as the reason: {:?}",
        bug[0]
    );

    let fixed = scan_temp_paths(F22_FIXED);
    assert!(
        fixed.is_empty(),
        "the shipped atomic-sequence fix must be accepted, got {fixed:?}"
    );

    let half = scan_temp_paths(F22_HALF_FIXED);
    assert_eq!(
        half.len(),
        1,
        "removing the unique component from one path of two must be reported exactly \
         once, got {half:?}"
    );
    assert_eq!(half[0].line, 7, "it must point at the path that lost it");
}

#[test]
fn guard1_accepts_a_tempfile_handle_and_an_inherited_unique_directory() {
    let handle = r#"
fn t() {
    let dir = tempfile::tempdir().unwrap();
    let p = dir.path().join("scenario.toml");
}
"#;
    assert!(
        scan_temp_paths(handle).is_empty(),
        "a tempfile handle generates its own name and must be accepted"
    );

    let inherited = r#"
fn t() {
    static N: AtomicUsize = AtomicUsize::new(0);
    let root = std::env::temp_dir().join(format!("kshana-{}", N.fetch_add(1, Relaxed)));
    let scn = root.join("scenario-input.toml");
    let out = root.join("my-study.result.json");
}
"#;
    assert!(
        scan_temp_paths(inherited).is_empty(),
        "children of a uniquely-named temp directory inherit its uniqueness"
    );

    let waived = r#"
fn t() {
    let dir = std::env::temp_dir();
    // PATH-UNIQUE-WAIVER: a fixed name is the point of this test
    let p = dir.join("kshana-fixed-name.txt");
}
"#;
    assert!(
        scan_temp_paths(waived).is_empty(),
        "an explicit, reasoned waiver must suppress the finding"
    );
}

#[test]
fn guard1_rejects_a_bare_pid_directory_and_a_wall_clock_name() {
    let pid_dir = r#"
fn t() {
    let dir = std::env::temp_dir().join(format!("kshana-studyname-{}", std::process::id()));
    let scn = dir.join("scenario-input.toml");
}
"#;
    assert!(
        !scan_temp_paths(pid_dir).is_empty(),
        "a directory named only after the pid must be reported"
    );

    let clock = r#"
fn t() {
    let dir = std::env::temp_dir();
    let p = dir.join(format!("kshana-{}.txt", SystemTime::now().elapsed().as_nanos()));
}
"#;
    assert_eq!(
        scan_temp_paths(clock).len(),
        1,
        "two threads can read the same nanosecond — a clock is not a unique component"
    );
}

#[test]
fn guard2_fires_on_an_undeclared_pin_and_is_silent_on_a_declared_one() {
    let undeclared = r#"
#[test]
fn emission_is_byte_for_byte_what_it_was() {
    assert_eq!(fnv1a64(&buf), 0xd4a0_2b1d_bf29_91c4_u64, "emission CHANGED");
}
"#;
    let f = scan_pin_scopes(undeclared);
    assert_eq!(f.len(), 1, "an undeclared hash pin must be reported: {f:?}");
    assert!(f[0].detail.contains("PIN-SCOPE"));

    let declared = r#"
#[test]
fn emission_is_byte_for_byte_what_it_was() {
    // PIN-SCOPE:    the lunar-frame-realisation JSON, summary and SVG
    // PIN-EXCLUDES: the top-level `units` block, stripped before hashing
    assert_eq!(fnv1a64(&buf), 0xd4a0_2b1d_bf29_91c4_u64, "emission CHANGED");
}
"#;
    assert!(
        scan_pin_scopes(declared).is_empty(),
        "a declared pin must be accepted"
    );

    let half = r#"
#[test]
fn emission_is_byte_for_byte_what_it_was() {
    // PIN-SCOPE: the lunar-frame-realisation JSON, summary and SVG
    assert_eq!(fnv1a64(&buf), 0xd4a0_2b1d_bf29_91c4_u64, "emission CHANGED");
}
"#;
    let h = scan_pin_scopes(half);
    assert_eq!(h.len(), 1, "a scope without an exclusion is incomplete");
    assert!(h[0].detail.contains("PIN-EXCLUDES:"), "{:?}", h[0]);
}

#[test]
fn guard2_sees_every_pin_spelling_and_ignores_algorithm_constants_and_seeds() {
    for (src, why) in [
        (
            "    assert_eq!(h, 0x2207_bc72_0606_2c80, \"drift\");",
            "hex fingerprint",
        ),
        (
            "const RELEASED_CANONICAL_FNV: u64 = 9_459_780_657_697_663_305;",
            "decimal fingerprint",
        ),
        (
            "    const SHA: &str = \"a0872964c7313b96a96d075ac3eda6a621af31432dce43cc1c651fec3ce8b84d\";",
            "64-hex digest string",
        ),
        (
            "        assert_eq!(buf.len(), 2938, \"emission LENGTH changed\");",
            "pinned byte length",
        ),
        (
            "const PRE_G13: &str = include_str!(\"golden/realtime-frame-eop.pre-g13.json\");",
            "a committed golden document read back",
        ),
        (
            "        for (src, expect, expect_len) in [",
            "named byte-count pin",
        ),
        (
            "        let golden = dir.join(format!(\"{name}.sha256\"));",
            "golden file comparison",
        ),
    ] {
        assert_eq!(
            scan_pin_scopes(src).len(),
            1,
            "guard 2 must see a {why} as a pin: {src}"
        );
    }

    for (src, why) in [
        (
            "    let mut h: u64 = 0xcbf2_9ce4_8422_2325;",
            "the FNV offset basis",
        ),
        (
            "        h = h.wrapping_mul(0x0000_0100_0000_01b3);",
            "the FNV prime",
        ),
        (
            "    let x = a ^ b.wrapping_mul(0x9e37_79b9_7f4a_7c15);",
            "the golden-ratio multiplier",
        ),
        (
            "        let mut rng = ChaCha8Rng::seed_from_u64(0x5141_4e41_5f41_5543);",
            "an RNG seed",
        ),
        (
            "const HEALTH_SEED_SALT: u64 = 0x0F11_7E12_8EA1_7777;",
            "a named salt",
        ),
        (
            "        assert_eq!(rows.len(), 4);",
            "a small cardinality check",
        ),
        (
            "        s = s.wrapping_mul(6364136223846793005).wrapping_add(1442695040888963407);",
            "published LCG parameters written in base 10",
        ),
        (
            "        assert_eq!(r.classical.band.len(), 3600 / 30 + 1);",
            "a length derived from the scenario under test",
        ),
        (
            "            tests: \"tests/golden.rs, tests/determinism.rs\",",
            "a prose citation of a test file name",
        ),
    ] {
        assert!(
            scan_pin_scopes(src).is_empty(),
            "guard 2 must not treat {why} as a pin: {src}"
        );
    }
}

#[test]
fn guard2_accepts_a_declaration_in_the_enclosing_tests_doc_comment() {
    // One declaration in the test's doc comment covers every pin in its body, however far
    // down — but it must not leak to the NEXT test.
    let mut src = String::from(
        "/// PIN-SCOPE:    the released document\n\
         /// PIN-EXCLUDES: nothing — the whole document, deliberately\n\
         #[test]\n\
         fn released_document_is_byte_for_byte() {\n",
    );
    for _ in 0..40 {
        src.push_str("    // filler\n");
    }
    src.push_str("    assert_eq!(h, 0x2207_bc72_0606_2c80);\n}\n");
    assert!(
        scan_pin_scopes(&src).is_empty(),
        "a declaration in the enclosing test's doc comment must cover its pins"
    );

    src.push_str(
        "\n#[test]\nfn a_later_unrelated_test() {\n    assert_eq!(h, 0x7030_ab72_7e57_edbc);\n}\n",
    );
    assert_eq!(
        scan_pin_scopes(&src).len(),
        1,
        "a declaration must not leak past the function it sits on"
    );

    // A helper defined inside the test must not cut the declaration off from the pins
    // below it: the enclosing function is the test, not the helper.
    let nested = "\
/// PIN-SCOPE:    the released document
/// PIN-EXCLUDES: nothing — the whole document, deliberately
#[test]
fn released_document_is_byte_for_byte() {
    fn fnv1a64(s: &str) -> u64 {
        let mut h: u64 = 0xcbf2_9ce4_8422_2325;
        h
    }
    assert_eq!(fnv1a64(&json), 0x2207_bc72_0606_2c80);
}
";
    assert!(
        scan_pin_scopes(nested).is_empty(),
        "a nested helper must not hide the enclosing test's declaration: {:?}",
        scan_pin_scopes(nested)
    );
}

#[test]
fn the_comment_stripper_does_not_blind_or_confuse_the_guards() {
    // A pin mentioned only in prose is not a pin.
    assert!(
        scan_pin_scopes("// the old hash was 0xd4a0_2b1d_bf29_91c4\n").is_empty(),
        "a hex literal inside a comment must not be treated as a pin"
    );
    // A `//` inside a string literal must not swallow the rest of the line.
    let url_then_pin =
        "    let u = \"https://example.invalid/x\"; assert_eq!(h, 0x2207_bc72_0606_2c80);\n";
    assert_eq!(
        scan_pin_scopes(url_then_pin).len(),
        1,
        "a `//` inside a string must not hide the pin after it"
    );
    // A `//` inside a raw string must not swallow the rest of the file.
    let raw = "fn t() {\n    let s = r\"a // b\";\n    let dir = std::env::temp_dir();\n    let p = dir.join(format!(\"x_{}\", std::process::id()));\n}\n";
    assert_eq!(
        scan_temp_paths(raw).len(),
        1,
        "a `//` inside a raw string must not blind the temp-path scan"
    );
}
