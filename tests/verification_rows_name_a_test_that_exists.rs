// SPDX-License-Identifier: AGPL-3.0-only
//! Every test a ledger row names must exist — as a file on disk **or** as an in-crate item.
//!
//! ## Why the sibling guard is not enough
//!
//! `tests/verification_rows_cite_evidence_that_exists.rs` checks the citations that are
//! shaped like repo paths (`tests/foo.rs`, `tests/fixtures/bar/NOTICE.md`). That is the
//! easy half. The other half of the matrix does not cite a path at all: 63 of the 164
//! non-partner rows name their evidence as an in-crate item path — `navsignal::code_tests`,
//! `integrity::tpl_scalar::tests`, `api::tests::tracking_loop_kind_round_trips_through_the_dispatch`
//! — and a token with no `.rs` suffix is invisible to a path scanner. Those rows could
//! name a module that was renamed, a test module that was emptied, or a function that
//! never existed, and every gate in this repository would stay green.
//!
//! The same blind spot covers the units-under-test the prose cites as the thing an oracle
//! was taken against (`eop::parse_all`, `lunar_frame_realise::apply_helmert`,
//! `sdr::correlate`). Those are load-bearing: the row's honesty argument is that an
//! *independent* routine produced the comparand, and if the named routine is gone the
//! argument is gone with it.
//!
//! ## What this file asserts
//!
//! 1. **Nothing a row cites dangles.** Every token in `tests`, `oracle` or `capability`
//!    shaped like a Rust item path resolves: the module chain reaches a real file under
//!    `src/`, and every trailing segment is a real `mod`, `fn` or type in it.
//! 2. **Every non-partner row names at least one test that exists** — a file under
//!    `tests/`, or an in-crate module that actually contains `#[test]`.
//! 3. Partner-owned rows claim nothing, and the exemption list stays short and justified.
//!
//! ## What it does not assert
//!
//! It does not check that the named test *passes* — `scripts/gate.sh` does that by running
//! the suite — and it does not grade the oracle. A row claiming an external oracle in
//! prose still gets that claim read by a human; the machine-checked part is that the
//! artefacts and items the prose names are real. Requiring every `ExternalDataset` row to
//! also name a committed fixture was measured and rejected: 53 of the 74 external oracles
//! are third-party *libraries* run in a cross-validation driver, and their provenance
//! lives in the driver and the test file rather than in the row prose. A rule needing a
//! 53-entry exemption list grades nothing.

use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};

use kshana::verification::{verification_matrix, VerificationStatus};

// ---------------------------------------------------------------------------------------
// Masking: strip strings, chars and comments so a brace count cannot be fooled
// ---------------------------------------------------------------------------------------

/// Replace every string literal, char literal and comment with spaces, preserving line
/// structure, so that a later brace count, `mod`/`fn` search or `#[test]` search sees only
/// code. Works per **character** (the output is not byte-aligned with the input, which is
/// fine because nothing here indexes back into the original).
///
/// Rust nested block comments, raw strings of any hash count, byte and byte-raw strings and
/// escape sequences are all handled. A `'` is treated as a char literal only when it is
/// followed by an escape or closes two characters later — otherwise it is a lifetime and is
/// left alone, which is the distinction a naive masker gets wrong.
fn mask(src: &str) -> Vec<char> {
    let c: Vec<char> = src.chars().collect();
    let mut out: Vec<char> = Vec::with_capacity(c.len());
    let mut i = 0usize;
    while i < c.len() {
        // line comment
        if c[i] == '/' && i + 1 < c.len() && c[i + 1] == '/' {
            while i < c.len() && c[i] != '\n' {
                out.push(' ');
                i += 1;
            }
            continue;
        }
        // block comment, nesting
        if c[i] == '/' && i + 1 < c.len() && c[i + 1] == '*' {
            let mut depth = 1usize;
            out.push(' ');
            out.push(' ');
            i += 2;
            while i < c.len() && depth > 0 {
                if c[i] == '/' && i + 1 < c.len() && c[i + 1] == '*' {
                    depth += 1;
                    out.push(' ');
                    out.push(' ');
                    i += 2;
                    continue;
                }
                if c[i] == '*' && i + 1 < c.len() && c[i + 1] == '/' {
                    depth -= 1;
                    out.push(' ');
                    out.push(' ');
                    i += 2;
                    continue;
                }
                out.push(if c[i] == '\n' { '\n' } else { ' ' });
                i += 1;
            }
            continue;
        }
        // raw string: r"..", r#".."#, br"..", br#".."#
        if c[i] == 'r' || (c[i] == 'b' && i + 1 < c.len() && c[i + 1] == 'r') {
            let start = i;
            let mut j = if c[i] == 'b' { i + 2 } else { i + 1 };
            let mut hashes = 0usize;
            while j < c.len() && c[j] == '#' {
                hashes += 1;
                j += 1;
            }
            let prev_ident = start > 0 && (c[start - 1].is_alphanumeric() || c[start - 1] == '_');
            if j < c.len() && c[j] == '"' && !prev_ident {
                // Blank the opening delimiter in one step: pushing the same item in a
                // loop is what clippy::same_item_push exists to catch.
                out.resize(out.len() + (j - start + 1), ' ');
                i = j + 1;
                loop {
                    if i >= c.len() {
                        break;
                    }
                    if c[i] == '"' {
                        let mut k = i + 1;
                        let mut h = 0usize;
                        while k < c.len() && h < hashes && c[k] == '#' {
                            h += 1;
                            k += 1;
                        }
                        if h == hashes {
                            out.resize(out.len() + (k - i), ' ');
                            i = k;
                            break;
                        }
                    }
                    out.push(if c[i] == '\n' { '\n' } else { ' ' });
                    i += 1;
                }
                continue;
            }
        }
        // ordinary string
        if c[i] == '"' {
            out.push(' ');
            i += 1;
            while i < c.len() {
                if c[i] == '\\' {
                    out.push(' ');
                    if i + 1 < c.len() {
                        out.push(' ');
                    }
                    i += 2;
                    continue;
                }
                if c[i] == '"' {
                    out.push(' ');
                    i += 1;
                    break;
                }
                out.push(if c[i] == '\n' { '\n' } else { ' ' });
                i += 1;
            }
            continue;
        }
        // char literal vs lifetime
        if c[i] == '\'' {
            let is_char =
                (i + 2 < c.len() && c[i + 2] == '\'') || (i + 1 < c.len() && c[i + 1] == '\\');
            if is_char {
                out.push(' ');
                i += 1;
                while i < c.len() {
                    if c[i] == '\\' {
                        out.push(' ');
                        if i + 1 < c.len() {
                            out.push(' ');
                        }
                        i += 2;
                        continue;
                    }
                    if c[i] == '\'' {
                        out.push(' ');
                        i += 1;
                        break;
                    }
                    out.push(' ');
                    i += 1;
                }
                continue;
            }
        }
        out.push(c[i]);
        i += 1;
    }
    out
}

// ---------------------------------------------------------------------------------------
// Small scanners over the masked character stream
// ---------------------------------------------------------------------------------------

fn is_ident_char(c: char) -> bool {
    c.is_alphanumeric() || c == '_'
}

fn starts_with_at(h: &[char], at: usize, needle: &str) -> bool {
    let n: Vec<char> = needle.chars().collect();
    at + n.len() <= h.len() && h[at..at + n.len()] == n[..]
}

/// `needle` appears at `at` and is not glued to an identifier character on either side.
fn word_at(h: &[char], at: usize, needle: &str) -> bool {
    let len = needle.chars().count();
    starts_with_at(h, at, needle)
        && (at == 0 || !is_ident_char(h[at - 1]))
        && (at + len >= h.len() || !is_ident_char(h[at + len]))
}

fn skip_ws(h: &[char], mut i: usize) -> usize {
    while i < h.len() && h[i].is_whitespace() {
        i += 1;
    }
    i
}

fn find_str(h: &[char], needle: &str, from: usize, to: usize) -> Option<usize> {
    let n: Vec<char> = needle.chars().collect();
    if n.is_empty() || to > h.len() || from + n.len() > to {
        return None;
    }
    (from..=to - n.len()).find(|&i| h[i..i + n.len()] == n[..])
}

/// Span inside the braces opened at `open`, exclusive of both braces.
fn brace_body(h: &[char], open: usize) -> Option<(usize, usize)> {
    let mut depth = 0usize;
    for (j, ch) in h.iter().enumerate().skip(open) {
        match ch {
            '{' => depth += 1,
            '}' => {
                depth -= 1;
                if depth == 0 {
                    return Some((open + 1, j));
                }
            }
            _ => {}
        }
    }
    None
}

/// Position of a `<kw> <name>` declaration inside `[lo, hi)`, or `None`.
fn decl_at(h: &[char], kw: &str, name: &str, lo: usize, hi: usize) -> Option<usize> {
    let mut i = lo;
    while i < hi {
        if word_at(h, i, kw) {
            let j = skip_ws(h, i + kw.chars().count());
            if j < hi && word_at(h, j, name) {
                return Some(i);
            }
        }
        i += 1;
    }
    None
}

/// Body of `mod <name> { … }` inside `[lo, hi)`.
fn mod_body(h: &[char], name: &str, lo: usize, hi: usize) -> Option<(usize, usize)> {
    let mut i = lo;
    while i < hi {
        if word_at(h, i, "mod") {
            let j = skip_ws(h, i + 3);
            if j < hi && word_at(h, j, name) {
                let k = skip_ws(h, j + name.chars().count());
                if k < h.len() && h[k] == '{' {
                    return brace_body(h, k);
                }
            }
        }
        i += 1;
    }
    None
}

/// Position of the `fn` keyword of `fn <name>(` / `fn <name><` inside `[lo, hi)`.
fn fn_decl(h: &[char], name: &str, lo: usize, hi: usize) -> Option<usize> {
    let mut i = lo;
    while i < hi {
        if word_at(h, i, "fn") {
            let j = skip_ws(h, i + 2);
            if j < hi && word_at(h, j, name) {
                let k = skip_ws(h, j + name.chars().count());
                if k < h.len() && (h[k] == '(' || h[k] == '<') {
                    return Some(i);
                }
            }
        }
        i += 1;
    }
    None
}

const TYPE_KEYWORDS: [&str; 6] = ["struct", "enum", "trait", "type", "union", "const"];

fn type_decl(h: &[char], name: &str, lo: usize, hi: usize) -> Option<usize> {
    TYPE_KEYWORDS
        .iter()
        .find_map(|kw| decl_at(h, kw, name, lo, hi))
}

/// Is there an `impl … <ty> … { … fn <method> … }` anywhere in the file?
fn impl_method(h: &[char], ty: &str, method: &str) -> bool {
    let mut i = 0usize;
    while i < h.len() {
        if word_at(h, i, "impl") {
            if let Some(open) = (i..h.len()).find(|&j| h[j] == '{') {
                let mut named = false;
                let mut k = i + 4;
                while k < open {
                    if word_at(h, k, ty) {
                        named = true;
                        break;
                    }
                    k += 1;
                }
                if named {
                    if let Some((a, b)) = brace_body(h, open) {
                        if fn_decl(h, method, a, b).is_some() {
                            return true;
                        }
                    }
                }
            }
        }
        i += 1;
    }
    false
}

fn has_test_attr_before(h: &[char], kw_at: usize) -> bool {
    let lo = kw_at.saturating_sub(600);
    let mut start = lo;
    for j in (lo..kw_at).rev() {
        if h[j] == '}' || h[j] == ';' || h[j] == '{' {
            start = j + 1;
            break;
        }
    }
    find_str(h, "#[test]", start, kw_at).is_some()
}

// ---------------------------------------------------------------------------------------
// Resolver
// ---------------------------------------------------------------------------------------

/// Tokens that look like crate item paths but belong to a third-party library. Each entry
/// must say which library and why the prose is right to name it. A kshana item that stopped
/// resolving is never fixed by adding it here.
const EXTERNAL_ITEMS: [(&str, &str); 2] = [
    (
        "Aberration::CN",
        "ANISE 0.10's own aberration-correction enum (Nyx Space, MPL-2.0) — named so the \
         row says WHICH of that library's light-time code paths the deep-space solver was \
         checked against; it is not vendored here",
    ),
    (
        "astro::Orbit",
        "ANISE 0.10.2's Keplerian orbit type (Nyx Space, MPL-2.0) — the independent \
         propagator the lunar service-volume row is cross-checked against; it is not a \
         kshana module",
    ),
];

struct Resolver {
    root: PathBuf,
    files: Vec<String>,
    masked: BTreeMap<String, Vec<char>>,
}

struct Hit {
    file: String,
    is_test: bool,
}

impl Resolver {
    fn new(root: &Path) -> Self {
        let mut files = Vec::new();
        collect_rs(&root.join("src"), root, &mut files);
        files.sort();
        Resolver {
            root: root.to_path_buf(),
            files,
            masked: BTreeMap::new(),
        }
    }

    fn chars(&mut self, rel: &str) -> &Vec<char> {
        if !self.masked.contains_key(rel) {
            let body = fs::read_to_string(self.root.join(rel))
                .unwrap_or_else(|e| panic!("cannot read {rel}: {e}"));
            self.masked.insert(rel.to_string(), mask(&body));
        }
        &self.masked[rel]
    }

    /// Descend `rest` through the items of `file`, reporting whether the walk ever entered
    /// something that actually carries `#[test]`.
    fn descend(&mut self, file: &str, rest: &[&str], seed_is_test: bool) -> Result<Hit, String> {
        let h = self.chars(file).clone();
        let (mut lo, mut hi) = (0usize, h.len());
        let mut is_test = seed_is_test;
        for (idx, seg) in rest.iter().enumerate() {
            if let Some((a, b)) = mod_body(&h, seg, lo, hi) {
                lo = a;
                hi = b;
                if find_str(&h, "#[test]", lo, hi).is_some() {
                    is_test = true;
                }
                continue;
            }
            if let Some(p) = fn_decl(&h, seg, lo, hi) {
                if has_test_attr_before(&h, p) {
                    is_test = true;
                }
                lo = p;
                continue;
            }
            if type_decl(&h, seg, lo, hi).is_some() {
                for m in &rest[idx + 1..] {
                    if !impl_method(&h, seg, m) {
                        return Err(format!("no `fn {m}` in any `impl {seg}` in {file}"));
                    }
                }
                return Ok(Hit {
                    file: file.to_string(),
                    is_test,
                });
            }
            return Err(format!(
                "`{seg}` is not a module, function or type in {file}"
            ));
        }
        Ok(Hit {
            file: file.to_string(),
            is_test,
        })
    }

    /// Resolve a Rust item path such as `integrity::tpl_scalar::tests` or
    /// `inertial::imu_errors::ImuErrorModel::distort`.
    fn resolve_item(&mut self, segs: &[&str]) -> Result<Hit, String> {
        let segs: Vec<&str> = if segs.first() == Some(&"crate") {
            segs[1..].to_vec()
        } else {
            segs.to_vec()
        };
        if segs.is_empty() {
            return Err("bare `crate::`".into());
        }
        for k in (1..=segs.len()).rev() {
            let stem = segs[..k].join("/");
            let cands = [format!("src/{stem}.rs"), format!("src/{stem}/mod.rs")];
            let exact: Vec<String> = self
                .files
                .iter()
                .filter(|f| cands.iter().any(|c| *f == c))
                .cloned()
                .collect();
            let hits = if exact.is_empty() {
                let sufs = [format!("/{stem}.rs"), format!("/{stem}/mod.rs")];
                self.files
                    .iter()
                    .filter(|f| sufs.iter().any(|s| f.ends_with(s.as_str())))
                    .cloned()
                    .collect::<Vec<_>>()
            } else {
                exact
            };
            match hits.len() {
                0 => continue,
                1 => {
                    let rest: Vec<&str> = segs[k..].to_vec();
                    return self.descend(&hits[0], &rest, false);
                }
                _ => {
                    return Err(format!(
                        "`{}` is ambiguous — {} both match; qualify the path",
                        stem,
                        hits.join(" and ")
                    ))
                }
            }
        }
        // Unqualified type name, e.g. `CaiAccelerometer::accel_asd`.
        let ty = segs[0];
        let owners: Vec<String> = {
            let files = self.files.clone();
            files
                .into_iter()
                .filter(|f| {
                    let h = self.chars(f);
                    type_decl(h, ty, 0, h.len()).is_some()
                })
                .collect()
        };
        match owners.len() {
            1 => self.descend(&owners[0].clone(), &segs, false),
            0 => Err(format!(
                "no file under src/ declares a module or type named `{ty}`"
            )),
            _ => Err(format!(
                "type `{ty}` is declared in {} files; qualify the path",
                owners.len()
            )),
        }
    }
}

fn collect_rs(dir: &Path, root: &Path, out: &mut Vec<String>) {
    let Ok(rd) = fs::read_dir(dir) else { return };
    for e in rd.flatten() {
        let p = e.path();
        if p.is_dir() {
            collect_rs(&p, root, out);
        } else if p.extension().is_some_and(|x| x == "rs") {
            if let Ok(rel) = p.strip_prefix(root) {
                out.push(rel.to_string_lossy().replace('\\', "/"));
            }
        }
    }
}

// ---------------------------------------------------------------------------------------
// Citation extraction — the same shapes the sibling path guard recognises, plus item paths
// ---------------------------------------------------------------------------------------

const ROOTS: [&str; 7] = [
    "tests/",
    "src/",
    "examples/",
    "scripts/",
    "docs/",
    "web/",
    "benches/",
];
const EXTS: [&str; 12] = [
    ".rs", ".py", ".sh", ".csv", ".json", ".md", ".toml", ".txt", ".c", ".java", ".npt", ".oem",
];

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

fn is_repo_artefact(tok: &str) -> bool {
    let path = tok.split("::").next().unwrap_or(tok);
    ROOTS.iter().any(|r| path.starts_with(r)) && EXTS.iter().any(|e| path.ends_with(e))
}

/// `a::b::c` with every segment a plain identifier.
fn is_item_path(tok: &str) -> bool {
    let parts: Vec<&str> = tok.split("::").collect();
    parts.len() >= 2
        && parts.iter().all(|p| {
            !p.is_empty()
                && p.chars()
                    .next()
                    .is_some_and(|c| c.is_alphabetic() || c == '_')
                && p.chars().all(is_ident_char)
        })
}

/// A bare `::name` continuation, which cites another item of the file named just before it.
fn is_tail_ref(tok: &str) -> bool {
    tok.starts_with("::")
        && !tok[2..].is_empty()
        && !tok[2..].contains("::")
        && tok[2..].chars().all(is_ident_char)
}

struct Scan {
    resolved: usize,
    tests_found: usize,
    failures: Vec<String>,
}

fn scan_all() -> (Scan, Vec<String>) {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut r = Resolver::new(root);
    let mut scan = Scan {
        resolved: 0,
        tests_found: 0,
        failures: Vec::new(),
    };
    let mut rows_without_a_test: Vec<String> = Vec::new();

    for it in verification_matrix() {
        let partner = it.status == VerificationStatus::PartnerOwned;
        let mut row_tests = 0usize;
        for (fname, field) in [
            ("tests", it.tests),
            ("oracle", it.oracle),
            ("capability", it.capability),
        ] {
            let mut last_rs: Option<String> = None;
            for tok in tokens(field) {
                let hit: Option<Hit> = if is_repo_artefact(&tok) {
                    let path = tok.split("::").next().unwrap_or(&tok).to_string();
                    if !root.join(&path).exists() {
                        // The sibling guard owns this failure mode and names it better.
                        continue;
                    }
                    let tail: Vec<&str> = tok.split("::").skip(1).collect();
                    if path.ends_with(".rs") {
                        last_rs = Some(path.clone());
                        match r.descend(&path, &tail, path.starts_with("tests/")) {
                            Ok(h) => Some(h),
                            Err(e) => {
                                scan.failures.push(format!(
                                    "{} [{}] `{}` — {}",
                                    it.requirement, fname, tok, e
                                ));
                                None
                            }
                        }
                    } else {
                        scan.resolved += 1;
                        None
                    }
                } else if is_tail_ref(&tok) {
                    match last_rs.clone() {
                        None => {
                            scan.failures.push(format!(
                                "{} [{}] `{}` — a bare `::name` continuation with no file \
                                 cited before it",
                                it.requirement, fname, tok
                            ));
                            None
                        }
                        Some(f) => match r.descend(&f, &[&tok[2..]], f.starts_with("tests/")) {
                            Ok(h) => Some(h),
                            Err(e) => {
                                scan.failures.push(format!(
                                    "{} [{}] `{}` (against {}) — {}",
                                    it.requirement, fname, tok, f, e
                                ));
                                None
                            }
                        },
                    }
                } else if is_item_path(&tok) {
                    if EXTERNAL_ITEMS.iter().any(|(p, _)| *p == tok) {
                        continue;
                    }
                    let segs: Vec<&str> = tok.split("::").collect();
                    match r.resolve_item(&segs) {
                        Ok(h) => Some(h),
                        Err(e) => {
                            scan.failures
                                .push(format!("{} [{}] `{}` — {}", it.requirement, fname, tok, e));
                            None
                        }
                    }
                } else {
                    None
                };

                if let Some(h) = hit {
                    scan.resolved += 1;
                    if h.is_test {
                        scan.tests_found += 1;
                        if fname == "tests" {
                            row_tests += 1;
                        }
                    }
                    if h.file.ends_with(".rs") {
                        last_rs = Some(h.file);
                    }
                }
            }
        }
        if !partner && row_tests == 0 {
            rows_without_a_test.push(format!("{}  —  tests: {}", it.requirement, it.tests));
        }
        if partner && row_tests != 0 {
            scan.failures.push(format!(
                "{} is PARTNER-owned but its `tests` field names {} real test(s); a partner \
                 row must claim nothing",
                it.requirement, row_tests
            ));
        }
    }
    (scan, rows_without_a_test)
}

// ---------------------------------------------------------------------------------------
// The guards
// ---------------------------------------------------------------------------------------

#[test]
fn every_item_a_row_cites_resolves_somewhere_in_the_crate() {
    let (scan, _) = scan_all();

    // A scanner that matched nothing would pass silently. The floor is set from the
    // measured figure — 339 citations resolved across the 168 rows when this guard was
    // written — with headroom below it so ordinary editing never trips it, and far enough
    // above zero that a broken matcher does.
    assert!(
        scan.resolved >= 300,
        "the citation resolver reached only {} artefacts and items. The prose style has \
         probably changed — fix the resolver, do not lower this bound, or the guard \
         becomes decorative.",
        scan.resolved
    );

    assert!(
        scan.failures.is_empty(),
        "{} ledger citation(s) name something that is not in the crate:\n  {}\n\n\
         A row that cites a module, test or routine the crate does not hold is an unbacked \
         claim, and nothing else in this repository will catch it: the ledger generator \
         only existence-checks tokens shaped like file paths. Fix the code, or reword the \
         row to stop naming it.",
        scan.failures.len(),
        scan.failures.join("\n  ")
    );
}

#[test]
fn every_non_partner_row_names_at_least_one_test_that_exists() {
    let (scan, rows_without) = scan_all();

    assert!(
        scan.tests_found >= 120,
        "only {} of the resolved citations landed on something carrying `#[test]`. That is \
         far below the measured 178 and means the test-detection half of the resolver has \
         stopped working.",
        scan.tests_found
    );

    assert!(
        rows_without.is_empty(),
        "{} row(s) claim a capability but name no test that exists:\n  {}\n\n\
         Either the evidence moved and the row still points at the old place, or the row is \
         asserting something nothing checks. Name the real test file or the real in-crate \
         test module — a `tests/*` glob is not a citation.",
        rows_without.len(),
        rows_without.join("\n  ")
    );
}

#[test]
fn the_external_item_exemptions_stay_short_and_each_says_why() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut r = Resolver::new(root);
    for (path, why) in EXTERNAL_ITEMS {
        assert!(
            why.len() > 40,
            "the exemption for `{path}` does not say which library it belongs to. An \
             unexplained exemption is how a real dangling-citation bug gets filed away as \
             expected."
        );
        let segs: Vec<&str> = path.split("::").collect();
        assert!(
            r.resolve_item(&segs).is_err(),
            "`{path}` is exempted as third-party but DOES resolve inside this crate. Remove \
             the exemption so it is checked like any other citation."
        );
    }
    assert!(
        EXTERNAL_ITEMS.len() <= 5,
        "the exemption list has grown to {} entries. Each one is a citation this guard no \
         longer checks.",
        EXTERNAL_ITEMS.len()
    );
}

// ---------------------------------------------------------------------------------------
// Self-tests — a masker or resolver that silently gives up would make every guard above
// vacuous, so each is graded in both directions on literal samples.
// ---------------------------------------------------------------------------------------

#[test]
fn the_masker_is_not_fooled_by_braces_inside_literals_and_comments() {
    let sample = r###"
        mod outer {
            // } this brace is in a line comment
            /* } and /* nested */ this one is in a block comment */
            fn noisy() {
                let s = "} not a brace {";
                let r = r#"} also not a brace {"#;
                let c = '}';
                let _lifetime: &'static str = s;
                let _ = (r, c);
            }
            #[test]
            fn real_test() {}
        }
        fn after_outer() {}
    "###;
    let h = mask(sample);
    let (a, b) = mod_body(&h, "outer", 0, h.len()).expect("mod outer must be found");
    assert!(
        find_str(&h, "#[test]", a, b).is_some(),
        "the `#[test]` inside mod outer was lost"
    );
    assert!(
        fn_decl(&h, "real_test", a, b).is_some(),
        "real_test must be inside the module body"
    );
    assert!(
        fn_decl(&h, "after_outer", a, b).is_none(),
        "the module body over-ran its closing brace — a literal or comment brace was \
         counted, which is exactly what the masker exists to prevent"
    );
    assert!(
        fn_decl(&h, "after_outer", 0, h.len()).is_some(),
        "after_outer must still be visible in the whole file"
    );
}

#[test]
fn the_masker_keeps_a_lifetime_and_swallows_a_char_literal() {
    let h = mask("fn f<'a>(x: &'a str) -> char { '{' }");
    assert!(
        fn_decl(&h, "f", 0, h.len()).is_some(),
        "a lifetime must not be mistaken for an unterminated char literal"
    );
    assert_eq!(
        h.iter().filter(|c| **c == '{').count(),
        1,
        "the char literal '{{' must be masked, leaving only the real body brace"
    );
}

#[test]
fn the_resolver_says_no_to_things_that_are_not_there() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut r = Resolver::new(root);

    assert!(
        r.resolve_item(&["definitely_not_a_kshana_module", "tests"])
            .is_err(),
        "a module that does not exist must not resolve"
    );
    assert!(
        r.resolve_item(&["verification", "no_such_test_module"])
            .is_err(),
        "a missing item inside a real module must not resolve"
    );
    // ...and a real one still does, so the two directions are graded, not just the red.
    let ok = r
        .resolve_item(&["verification", "verification_matrix"])
        .expect("verification::verification_matrix must resolve");
    assert_eq!(ok.file, "src/verification.rs");
    assert!(
        !ok.is_test,
        "a plain public function is not a test and must not be counted as one"
    );
}

#[test]
fn a_module_with_no_test_is_not_counted_as_a_test() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut r = Resolver::new(root);
    // `verification::artifacts` is a real module of real code with no `#[test]` of its own.
    let hit = r
        .resolve_item(&["verification", "artifacts"])
        .expect("verification::artifacts must resolve");
    assert!(
        !hit.is_test,
        "verification::artifacts carries no #[test]; counting it as test evidence would let \
         any module name stand in for a test"
    );
}
