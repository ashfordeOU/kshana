// SPDX-License-Identifier: AGPL-3.0-only
//! The README must name everything the repository offers, and every link in it must resolve.
//!
//! PIN-SCOPE:    every scenario kind the engine dispatches has its own page under docs/kinds/by-kind/ whose
//!               description and required fields equal the engine's and that has the seven sections, a row in the
//!               docs/KINDS.md index and a link in the README's family table; every command in
//!               the usage text, every plugin command, every skill and every Studio page is named in the README
//!               or on the page it links (docs/COMMANDS.md, docs/ALL-SURFACES.md); every relative link, image and in-page anchor in
//!               the README resolves
//! PIN-EXCLUDES: whether a description is right (the generators write the tables from the engine, and
//!               `tools/readme_audit.py` reports the per-item gaps), and external URLs

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn readme() -> String {
    std::fs::read_to_string(root().join("README.md")).expect("README.md")
}

/// The text of every kind's entry that comes from the engine: its description and its fields, as
/// `tools/gen_kinds_index.py` writes them. Pinned here so that part cannot drift from the engine even
/// when the Python tool is not run.
fn entry_text(k: &kshana::api::ScenarioMeta) -> (String, String) {
    let req = if k.required_fields.is_empty() {
        "none".to_string()
    } else {
        k.required_fields.iter().map(|f| format!("`{f}`")).collect::<Vec<_>>().join(", ")
    };
    let mut fields = format!("Required fields: {req}");
    if !k.optional_fields.is_empty() {
        let opt = k.optional_fields.iter().map(|f| format!("`{f}`")).collect::<Vec<_>>().join(", ");
        fields.push_str(&format!(". Optional: {opt}"));
    }
    fields.push('.');
    (k.description.to_string(), fields)
}

#[test]
fn every_scenario_kind_has_a_docs_page_that_matches_the_engine() {
    let readme = readme();
    let index = std::fs::read_to_string(root().join("docs/KINDS.md")).expect("docs/KINDS.md");
    assert!(readme.contains("docs/KINDS.md"), "the README must link docs/KINDS.md");
    let mut problems = Vec::new();
    for k in kshana::api::list_scenario_kinds() {
        let page = root().join("docs/kinds/by-kind").join(format!("{}.md", k.name));
        let Ok(text) = std::fs::read_to_string(&page) else {
            problems.push(format!("{}: no page docs/kinds/by-kind/{}.md", k.name, k.name));
            continue;
        };
        let (desc, fields) = entry_text(&k);
        if !text.contains(&desc) {
            problems.push(format!("{}: the page's description differs from the engine's", k.name));
        }
        let req_line = fields.split(". Optional:").next().unwrap().trim_end_matches('.').to_string();
        if !text.contains(&req_line) {
            problems.push(format!("{}: the page's required fields differ from the engine's", k.name));
        }
        for section in ["## What it does", "## Inputs", "## Run it", "## What it gives", "## Evidence", "## Limitations", "## See also"] {
            if !text.contains(section) {
                problems.push(format!("{}: the page has no '{section}' section", k.name));
            }
        }
        if !index.contains(&format!("kinds/by-kind/{}.md", k.name)) {
            problems.push(format!("{}: not linked from docs/KINDS.md", k.name));
        }
        if !readme.contains(&format!("docs/kinds/by-kind/{}.md", k.name)) {
            problems.push(format!("{}: not linked from the README's family table", k.name));
        }
    }
    assert!(
        problems.is_empty(),
        "kind pages out of step with the engine: {problems:#?}. Run `python3 tools/gen_kinds_index.py` and \
         `python3 tools/gen_readme_blocks.py` (a new kind must also be filed under a family in tools/kind_families.py)"
    );
}

/// Every `or: kshana <word>` and `--flag` form of the usage text in `src/main.rs`.
fn usage_commands() -> BTreeSet<String> {
    let main = std::fs::read_to_string(root().join("src/main.rs")).expect("src/main.rs");
    let start = main.find("const USAGE").expect("USAGE");
    let usage = &main[start..main[start..].find("\";").map(|i| start + i).expect("end of USAGE")];
    let mut out = BTreeSet::new();
    for part in usage.split("or: kshana ").skip(1) {
        let first = part.split_whitespace().next().unwrap_or("");
        if first.starts_with("--") {
            out.insert(first.trim_end_matches(',').to_string());
        } else if first.chars().all(|c| c.is_ascii_lowercase() || c == '-') && !first.is_empty() {
            out.insert(first.to_string());
        }
    }
    out
}

#[test]
fn every_command_in_the_usage_text_is_in_the_readme() {
    let readme = readme() + &std::fs::read_to_string(root().join("docs/COMMANDS.md")).expect("docs/COMMANDS.md");
    assert!(self::readme().contains("docs/COMMANDS.md"), "the README must link docs/COMMANDS.md");
    let cmds = usage_commands();
    assert!(cmds.len() >= 15, "only {} commands parsed from USAGE: {cmds:?}", cmds.len());
    let missing: Vec<&String> = cmds
        .iter()
        .filter(|c| !readme.contains(&format!("kshana {c}")) && !readme.contains(&format!("`{c}")))
        .collect();
    assert!(
        missing.is_empty(),
        "commands in the usage text that the README never names: {missing:?}. Add them to the \
         README's 'Every command' table"
    );
}

fn stems(dir: &str, ext: Option<&str>, dirs: bool) -> Vec<String> {
    let mut v = Vec::new();
    for e in std::fs::read_dir(root().join(dir)).expect(dir).flatten() {
        let p = e.path();
        if dirs && !p.is_dir() {
            continue;
        }
        if !dirs && p.extension().and_then(|x| x.to_str()) != ext {
            continue;
        }
        let name = if dirs {
            p.file_name()
        } else {
            p.file_stem()
        };
        v.push(name.unwrap().to_string_lossy().into_owned());
    }
    v.sort();
    v
}

#[test]
fn every_plugin_command_skill_and_studio_page_is_in_the_readme() {
    assert!(readme().contains("docs/ALL-SURFACES.md"), "the README must link docs/ALL-SURFACES.md");
    let readme = readme() + &std::fs::read_to_string(root().join("docs/ALL-SURFACES.md")).expect("docs/ALL-SURFACES.md");
    let mut missing = Vec::new();
    for c in stems("commands", Some("md"), false) {
        if !readme.contains(&format!("`/{c}`")) {
            missing.push(format!("plugin command /{c}"));
        }
    }
    for s in stems("skills", None, true) {
        if !readme.contains(&format!("`{s}`")) {
            missing.push(format!("skill {s}"));
        }
    }
    for p in stems("web/studio", None, true) {
        if root().join("web/studio").join(&p).join("index.html").exists()
            && !readme.contains(&format!("/studio/{p}/"))
        {
            missing.push(format!("Studio page /studio/{p}/"));
        }
    }
    assert!(missing.is_empty(), "named nowhere in the README: {missing:?}");
}

fn slug(heading: &str) -> String {
    heading
        .chars()
        .filter(|c| *c != '`')
        .flat_map(|c| c.to_lowercase())
        .filter(|c| c.is_alphanumeric() || *c == '-' || *c == ' ' || *c == '_')
        .map(|c| if c == ' ' { '-' } else { c })
        .collect()
}

fn anchors(text: &str) -> BTreeSet<String> {
    let mut seen = std::collections::BTreeMap::<String, usize>::new();
    let mut out = BTreeSet::new();
    let mut fence = false;
    for line in text.lines() {
        if line.starts_with("```") {
            fence = !fence;
        }
        if fence || !line.starts_with('#') {
            continue;
        }
        let h = line.trim_start_matches('#').trim();
        // strip markdown links and html tags the way GitHub's slugger sees the visible text
        let mut vis = String::new();
        let mut depth = 0;
        let bytes: Vec<char> = h.chars().collect();
        let mut i = 0;
        while i < bytes.len() {
            let c = bytes[i];
            if c == '<' {
                depth += 1;
            } else if c == '>' && depth > 0 {
                depth -= 1;
            } else if depth == 0 && c == ']' && bytes.get(i + 1) == Some(&'(') {
                while i < bytes.len() && bytes[i] != ')' {
                    i += 1;
                }
            } else if depth == 0 && c != '[' {
                vis.push(c);
            }
            i += 1;
        }
        let base = slug(vis.trim());
        let n = seen.entry(base.clone()).or_insert(0);
        out.insert(if *n == 0 { base } else { format!("{base}-{n}") });
        *n += 1;
    }
    out
}

fn link_targets(text: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut fence = false;
    for line in text.lines() {
        if line.starts_with("```") {
            fence = !fence;
            continue;
        }
        if fence {
            continue;
        }
        let mut rest = line;
        while let Some(i) = rest.find("](") {
            let after = &rest[i + 2..];
            let end = after.find([')', ' ']).unwrap_or(after.len());
            out.push(after[..end].to_string());
            rest = &after[end..];
        }
        for attr in ["href=\"", "src=\"", "srcset=\""] {
            let mut rest = line;
            while let Some(i) = rest.find(attr) {
                let after = &rest[i + attr.len()..];
                let end = after.find('"').unwrap_or(after.len());
                out.push(after[..end].to_string());
                rest = &after[end..];
            }
        }
    }
    out
}

fn broken_links(page: &Path) -> Vec<String> {
    let text = std::fs::read_to_string(page).expect("page");
    let own = anchors(&text);
    let dir = page.parent().unwrap().to_path_buf();
    let mut bad = Vec::new();
    for l in link_targets(&text) {
        if l.starts_with("http") || l.starts_with("mailto:") || l.starts_with("data:") || l.is_empty() {
            continue;
        }
        if let Some(a) = l.strip_prefix('#') {
            if !own.contains(a) {
                bad.push(l);
            }
            continue;
        }
        let (path, frag) = match l.split_once('#') {
            Some((p, f)) => (p.to_string(), Some(f.to_string())),
            None => (l.clone(), None),
        };
        let path = path.split('?').next().unwrap().to_string();
        let target = dir.join(&path);
        if !target.exists() {
            bad.push(l);
            continue;
        }
        if let (Some(f), true) = (frag, path.ends_with(".md")) {
            let t = std::fs::read_to_string(&target).unwrap_or_default();
            if !anchors(&t).contains(&f) {
                bad.push(l);
            }
        }
    }
    bad
}

#[test]
fn every_relative_link_image_and_anchor_in_the_readme_and_the_generated_pages_resolves() {
    let mut pages = vec![
        root().join("README.md"),
        root().join("docs/KINDS.md"),
        root().join("docs/COMMANDS.md"),
        root().join("docs/ALL-SURFACES.md"),
        root().join("docs/CAPABILITY-DOMAINS.md"),
    ];
    for dir in ["docs/kinds", "docs/kinds/by-kind"] {
        for e in std::fs::read_dir(root().join(dir)).expect(dir).flatten() {
            if e.path().is_file() {
                pages.push(e.path());
            }
        }
    }
    let mut report = Vec::new();
    for p in &pages {
        let bad = broken_links(p);
        if !bad.is_empty() {
            report.push(format!("{}: {bad:?}", p.strip_prefix(root()).unwrap().display()));
        }
    }
    assert!(report.is_empty(), "links that do not resolve: {report:#?}");
}
