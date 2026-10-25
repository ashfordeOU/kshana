// SPDX-License-Identifier: AGPL-3.0-only
//! The localisation catalogue is checked against the source it replaced and against itself.
//!
//! * English reproduces every original format string byte for byte: `tests/fixtures/i18n/corpus.json`
//!   (written by `scripts/i18n_codemod.py`) and `manual.json` (written by hand for the strings that
//!   are not plain format strings) record each message's original template as parts, text and
//!   variables; each message is rendered with a sentinel for every variable and compared.
//! * Every message in `i18n/en/engine.ftl` has such a record, or is declared new below.
//! * Translations only translate messages that exist, with the variables of the English message.
//! * The pseudo-locale renders every message and keeps every argument.
//! * Every message id written in the source exists, every English message is used, and every call
//!   passes exactly the variables its message declares.
use kshana::i18n::{resolve, tr_in, Lang, LANGS};
use serde_json::Value;
use std::collections::{BTreeMap, BTreeSet};
use std::path::{Path, PathBuf};

/// Messages that have no original template to compare with: new text, with the reason.
const NEW_MESSAGES: &[(&str, &str)] = &[
    ("legal-compliance-statement", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-bench-surface-notice", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-iq-campaign-roc-statement", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-lunanet-afs-advisory", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-iqfit-statement", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-iqfit-advisory", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-lunar-time-lab-source-statement", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-standards-pack-notice", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-standards-pack-advisory", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-geometry-statement", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-resilience-disclaimer", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-observatory-notice", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-receiver-trust-advisory", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-evidence-roundtrip-notice", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-evidence-bundle-disclaimer", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-bench-notice", "legal text; tests/i18n_legal.rs compares it with its constant"),
    ("legal-osnma-advisory", "legal text; tests/i18n_legal.rs compares it with its constant"),
    (
    "main-fail",
    "the command line's `error: ` label for a failed run, which was a literal next to the printed error",
)];

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

struct Entry {
    id: String,
    parts: Vec<Part>,
}

enum Part {
    Text(String),
    Var(String),
}

fn corpus() -> Vec<Entry> {
    let mut out = Vec::new();
    for file in ["corpus.json", "manual.json"] {
        let p = root().join("tests/fixtures/i18n").join(file);
        let Ok(text) = std::fs::read_to_string(&p) else {
            continue;
        };
        let v: Value = serde_json::from_str(&text).unwrap_or_else(|e| panic!("{file}: {e}"));
        for e in v.as_array().unwrap() {
            let parts = e["parts"]
                .as_array()
                .unwrap()
                .iter()
                .map(|p| match p {
                    Value::String(s) => Part::Text(s.clone()),
                    o => Part::Var(o["var"].as_str().unwrap().to_string()),
                })
                .collect();
            out.push(Entry {
                id: e["id"].as_str().unwrap().to_string(),
                parts,
            });
        }
    }
    out
}

fn sentinel(var: &str) -> String {
    format!("⟦{var}⟧")
}

fn render(lang: &Lang, e: &Entry) -> String {
    let vars: Vec<(String, String)> = e
        .parts
        .iter()
        .filter_map(|p| match p {
            Part::Var(v) => Some((v.clone(), sentinel(v))),
            _ => None,
        })
        .collect();
    let args: Vec<(&str, String)> = vars.iter().map(|(k, v)| (k.as_str(), v.clone())).collect();
    tr_in(lang, &e.id, &args)
}

/// Message ids and the variables each one uses, from a catalogue text.
fn messages(text: &str) -> BTreeMap<String, BTreeSet<String>> {
    let res = fluent_syntax::parser::parse(text.to_string())
        .unwrap_or_else(|(_, errs)| panic!("catalogue does not parse: {errs:?}"));
    let mut out = BTreeMap::new();
    for entry in &res.body {
        if let fluent_syntax::ast::Entry::Message(m) = entry {
            let mut vars = BTreeSet::new();
            if let Some(p) = &m.value {
                collect_vars(p, &mut vars);
            }
            for a in &m.attributes {
                collect_vars(&a.value, &mut vars);
            }
            out.insert(
                m.id.name
                    .strip_prefix("engine-")
                    .unwrap_or(&m.id.name)
                    .to_string(),
                vars,
            );
        }
    }
    out
}

fn collect_vars(p: &fluent_syntax::ast::Pattern<String>, vars: &mut BTreeSet<String>) {
    use fluent_syntax::ast::{Expression, InlineExpression, PatternElement};
    fn inline(e: &InlineExpression<String>, vars: &mut BTreeSet<String>) {
        match e {
            InlineExpression::VariableReference { id } => {
                vars.insert(id.name.clone());
            }
            InlineExpression::Placeable { expression } => expr(expression, vars),
            _ => {}
        }
    }
    fn expr(e: &Expression<String>, vars: &mut BTreeSet<String>) {
        match e {
            Expression::Inline(i) => inline(i, vars),
            Expression::Select { selector, variants } => {
                inline(selector, vars);
                for v in variants {
                    collect_vars(&v.value, vars);
                }
            }
        }
    }
    for el in &p.elements {
        if let PatternElement::Placeable { expression } = el {
            expr(expression, vars);
        }
    }
}

#[test]
fn english_reproduces_every_original_template() {
    let en = Lang::english();
    let c = corpus();
    assert!(!c.is_empty() || messages(kshana::i18n::english_source()).is_empty());
    let mut bad = Vec::new();
    for e in &c {
        let want: String = e
            .parts
            .iter()
            .map(|p| match p {
                Part::Text(t) => t.clone(),
                Part::Var(v) => sentinel(v),
            })
            .collect();
        let got = render(&en, e);
        if got != want {
            bad.push(format!("{}:\n   want {want:?}\n   got  {got:?}", e.id));
        }
    }
    assert!(
        bad.is_empty(),
        "{} message(s) differ from their source:\n{}",
        bad.len(),
        bad.join("\n")
    );
}

#[test]
fn every_english_message_has_an_original_or_is_declared_new() {
    let ids: BTreeSet<String> = corpus().into_iter().map(|e| e.id).collect();
    let new: BTreeSet<&str> = NEW_MESSAGES.iter().map(|(i, _)| *i).collect();
    let mut missing = Vec::new();
    for id in messages(kshana::i18n::english_source()).keys() {
        if !ids.contains(id) && !new.contains(id.as_str()) {
            missing.push(id.clone());
        }
    }
    assert!(
        missing.is_empty(),
        "messages with no original template: {missing:?}"
    );
    for (id, why) in NEW_MESSAGES {
        assert!(!why.is_empty(), "{id}: a new message needs its reason");
    }
}

#[test]
fn translations_translate_known_messages_with_their_variables() {
    let en = messages(kshana::i18n::english_source());
    let mut problems = Vec::new();
    for tag in LANGS.iter().skip(1) {
        let text =
            kshana::i18n::catalogue_source(tag).unwrap_or_else(|| panic!("no catalogue for {tag}"));
        for (id, vars) in messages(text) {
            match en.get(&id) {
                None => problems.push(format!("{tag}: {id} is not an English message")),
                Some(ev) => {
                    let extra: Vec<_> = vars.difference(ev).collect();
                    let missing: Vec<_> = ev.difference(&vars).collect();
                    if !extra.is_empty() || !missing.is_empty() {
                        problems.push(format!(
                            "{tag}: {id}: variables {vars:?}, English has {ev:?}"
                        ));
                    }
                }
            }
        }
    }
    assert!(problems.is_empty(), "{}", problems.join("\n"));
}

#[test]
fn the_pseudo_locale_renders_every_message_and_keeps_the_arguments() {
    let xa = resolve("en-XA").unwrap();
    for e in corpus() {
        let s = render(&xa, &e);
        assert!(s.starts_with('['), "{}: {s}", e.id);
        for p in &e.parts {
            if let Part::Var(v) = p {
                assert!(s.contains(&sentinel(v)), "{}: {s} lost {v}", e.id);
            }
        }
    }
}

/// Every `t!("id", a = ..)` / `terr!(..)` in non-test source: (file, id, variable names).
fn calls() -> Vec<(String, String, BTreeSet<String>)> {
    fn walk(dir: &Path, out: &mut Vec<PathBuf>) {
        for e in std::fs::read_dir(dir).unwrap().flatten() {
            let p = e.path();
            if p.is_dir() {
                walk(&p, out);
            } else if p.extension().is_some_and(|x| x == "rs") {
                out.push(p);
            }
        }
    }
    let mut files = Vec::new();
    walk(&root().join("src"), &mut files);
    // the module that defines the macros quotes them in its documentation
    files.retain(|f| !f.starts_with(root().join("src/i18n")));
    files.sort();
    let mut out = Vec::new();
    for f in files {
        let src = std::fs::read_to_string(&f).unwrap();
        // drop the test module so its fixtures do not count
        let body = src.split("\n#[cfg(test)]\nmod ").next().unwrap_or(&src);
        let bytes = body.as_bytes();
        let mut i = 0;
        while let Some(off) = body[i..].find("!(") {
            let bang = i + off;
            // the macro name before the `!`: `t` or `terr`, as a whole identifier
            let name_start = body[..bang]
                .rfind(|c: char| !(c.is_alphanumeric() || c == '_'))
                .map_or(0, |k| k + 1);
            let name = &body[name_start..bang];
            if name != "t" && name != "terr" {
                i = bang + 2;
                continue;
            }
            let after = &body[bang + 2..];
            let skipped = after.len() - after.trim_start().len();
            if !after.trim_start().starts_with('"') {
                i = bang + 2;
                continue;
            }
            let id_start = bang + 2 + skipped + 1;
            let id_end = id_start + body[id_start..].find('"').unwrap();
            let id = body[id_start..id_end].to_string();
            // the arguments: balanced to the closing parenthesis
            let mut depth = 1;
            let mut j = id_end + 1;
            let mut in_str = false;
            let mut vars = BTreeSet::new();
            let mut arg_start = j;
            while j < bytes.len() && depth > 0 {
                let c = bytes[j] as char;
                if in_str {
                    if c == '\\' {
                        j += 1;
                    } else if c == '"' {
                        in_str = false;
                    }
                } else {
                    match c {
                        '"' => in_str = true,
                        '\'' => {
                            // a character literal ('(' , '\n'), not a lifetime
                            if bytes.get(j + 1) == Some(&b'\\') {
                                j = body[j + 2..].find('\'').map_or(j, |k| j + 2 + k);
                            } else if bytes.get(j + 2) == Some(&b'\'') {
                                j += 2;
                            }
                        }
                        '(' | '[' | '{' => depth += 1,
                        ')' | ']' | '}' => depth -= 1,
                        ',' if depth == 1 => {
                            record_name(&body[arg_start..j], &mut vars);
                            arg_start = j + 1;
                        }
                        _ => {}
                    }
                }
                j += 1;
            }
            record_name(&body[arg_start..j - 1], &mut vars);
            out.push((f.display().to_string(), id, vars));
            i = j;
        }
    }
    out
}

fn record_name(arg: &str, vars: &mut BTreeSet<String>) {
    let a = arg.trim();
    if let Some((name, _)) = a.split_once('=') {
        let name = name.trim();
        if !name.is_empty() && name.chars().all(|c| c.is_alphanumeric() || c == '_') {
            vars.insert(name.to_string());
        }
    }
}

#[test]
fn every_call_names_a_message_and_passes_its_variables() {
    let en = messages(kshana::i18n::english_source());
    let mut problems = Vec::new();
    for (file, id, vars) in calls() {
        match en.get(&id) {
            None => problems.push(format!("{file}: no English message {id:?}")),
            Some(ev) => {
                let ev: BTreeSet<String> = ev.iter().map(|v| v.replace('-', "_")).collect();
                if vars != ev {
                    problems.push(format!(
                        "{file}: {id}: passes {vars:?}, the message uses {ev:?}"
                    ));
                }
            }
        }
    }
    assert!(problems.is_empty(), "{}", problems.join("\n"));
}

#[test]
fn every_english_message_is_used() {
    fn walk(dir: &Path, out: &mut Vec<PathBuf>) {
        for e in std::fs::read_dir(dir).unwrap().flatten() {
            let p = e.path();
            if p.is_dir() {
                walk(&p, out);
            } else if p.extension().is_some_and(|x| x == "rs") {
                out.push(p);
            }
        }
    }
    let mut files = Vec::new();
    walk(&root().join("src"), &mut files);
    files.retain(|f| !f.starts_with(root().join("src/i18n")));
    let text: String = files
        .iter()
        .map(|f| std::fs::read_to_string(f).unwrap())
        .collect::<Vec<_>>()
        .join("\n");
    // every quoted lower-case-and-hyphen token of the source, once
    let mut quoted: BTreeSet<&str> = BTreeSet::new();
    let b = text.as_bytes();
    let mut i = 0;
    while i < b.len() {
        if b[i] == b'"' {
            let mut j = i + 1;
            while j < b.len()
                && (b[j].is_ascii_lowercase() || b[j].is_ascii_digit() || b[j] == b'-')
            {
                j += 1;
            }
            if j < b.len() && b[j] == b'"' && j > i + 1 {
                quoted.insert(&text[i + 1..j]);
                i = j;
            }
        }
        i += 1;
    }
    let mut dead = Vec::new();
    for id in messages(kshana::i18n::english_source()).keys() {
        if !quoted.contains(id.as_str()) && !USED_BY_ID_PREFIX.iter().any(|p| id.starts_with(p)) {
            dead.push(id.clone());
        }
    }
    assert!(dead.is_empty(), "messages no source uses: {dead:?}");
}

/// Id prefixes of messages looked up with a computed id (`tr(&format!("verdict-{word}"), ..)`).
const USED_BY_ID_PREFIX: &[&str] = &[];

/// Sentence fragments: messages the code joins with others at run time, or that start or end
/// mid-sentence, cannot be translated correctly. `i18n/en/engine-fragments.txt` lists them (made by
/// `scripts/i18n_fragments.py`); every listed id must still exist, and the list may only shrink as
/// they are merged into whole-sentence messages.
const FRAGMENT_BASELINE: usize = 0;

#[test]
fn sentence_fragments_are_listed_and_never_grow() {
    let text = std::fs::read_to_string(root().join("i18n/en/engine-fragments.txt"))
        .expect("i18n/en/engine-fragments.txt");
    let ids: Vec<&str> = text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(':').next().unwrap())
        .collect();
    let en = messages(kshana::i18n::english_source());
    for id in &ids {
        assert!(
            en.contains_key(*id),
            "{id} is listed as a fragment but is not a message"
        );
    }
    assert!(
        ids.len() <= FRAGMENT_BASELINE,
        "{} fragments, more than the baseline {FRAGMENT_BASELINE}: write whole-sentence messages",
        ids.len()
    );
}
