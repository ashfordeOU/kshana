// SPDX-License-Identifier: AGPL-3.0-only
//! Pins the inline-only boundary of the surfaces that run scenario text from an untrusted
//! party (the MCP server).
//!
//! `kshana::inline_only::FILE_SOURCE_KEYS` lists the scenario fields that make the engine read a
//! file or a folder by name. A scenario type that gains such a field and is not added there
//! would let a caller reach the host's files through a surface that is meant to take inline
//! content only, so this test reads every Rust source file under `src/`, finds each public
//! field whose name looks like a file source, and fails unless the field is in that list or
//! is explained below as something else (an output, a result path, a schema name, a field
//! of a command-line-only type).

use kshana::inline_only::{reject_file_sources, FILE_SOURCE_KEYS, FILE_SOURCE_KEYS_BY_KIND};
use std::path::{Path, PathBuf};

/// `(file, field)` pairs that look like a file source and are not one a scenario can set
/// on a surface, with the reason.
const NOT_A_SCENARIO_FILE_SOURCE: &[(&str, &str, &str)] = &[
    (
        "src/suite.rs",
        "path",
        "a study suite's member list; the suite runner is command-line only",
    ),
    (
        "src/campaign.rs",
        "path",
        "a path into the run's result JSON (`quantum.fom.x`), not a file",
    ),
    ("src/field_schema.rs", "path", "a path into the result JSON"),
    ("src/ccsds_tdm.rs", "path", "a path into the result JSON"),
    (
        "src/lunar_ephemeris.rs",
        "path",
        "output: where the report says the file it read came from",
    ),
    (
        "src/receiver_trust/scenario.rs",
        "path",
        "[log] and [log.nav]: refused through FILE_SOURCE_TABLES",
    ),
    (
        "src/advanced_report.rs",
        "path",
        "report structure: result paths and output file names",
    ),
    ("src/advanced_report.rs", "file", "report output"),
    ("src/advanced_report.rs", "files", "report output"),
    ("src/advanced_report.rs", "result_file", "report output"),
    ("src/advanced_report.rs", "chart_file", "report output"),
    ("src/advanced_report.rs", "animation_files", "report output"),
    (
        "src/advanced_report.rs",
        "scenario_file",
        "report output: the name the report cites",
    ),
    (
        "src/advanced_report.rs",
        "working_directory",
        "report output",
    ),
    (
        "src/leo_navmsg/mod.rs",
        "csv_schema",
        "the name of a built-in table schema, not a file",
    ),
    ("src/surface.rs", "file_name", "output"),
];

fn rust_files(dir: &Path, out: &mut Vec<PathBuf>) {
    for e in std::fs::read_dir(dir).unwrap().filter_map(Result::ok) {
        let p = e.path();
        if p.is_dir() {
            rust_files(&p, out);
        } else if p.extension().is_some_and(|x| x == "rs") {
            out.push(p);
        }
    }
}

/// The name of a `pub name: [Option<]String|PathBuf[>]` field that ends like a file source.
fn file_like_field(line: &str) -> Option<&str> {
    let rest = line.trim_start().strip_prefix("pub ")?;
    let (name, ty) = rest.split_once(':')?;
    let ty = ty.trim();
    let stringy = [
        "String",
        "PathBuf",
        "Option<String>",
        "Option<PathBuf>",
        "Vec<String>",
    ]
    .iter()
    .any(|t| ty.starts_with(t));
    let looks = ["path", "dir", "file", "files", "kernel", "csv_path"]
        .iter()
        .any(|s| name == *s || name.ends_with(&format!("_{s}")));
    (stringy && looks).then_some(name)
}

#[test]
fn every_file_like_scenario_field_is_refused_or_explained() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut files = Vec::new();
    rust_files(&root.join("src"), &mut files);
    let mut unexplained = Vec::new();
    let mut seen_listed = std::collections::BTreeSet::new();
    for f in &files {
        let rel = f
            .strip_prefix(root)
            .unwrap()
            .to_string_lossy()
            .replace('\\', "/");
        // The command-line and streaming modules take paths from their own arguments, never
        // from scenario text a surface passes in.
        if rel.ends_with("/cli.rs")
            || rel.starts_with("src/iq/")
            || rel.starts_with("src/nmea_synth/")
            || rel.starts_with("src/telemetry/")
            || rel.starts_with("src/evidence/")
            || rel.starts_with("src/interference_map/")
            || rel == "src/main.rs"
            || rel == "src/python.rs"
            || rel == "src/live_io.rs"
        {
            continue;
        }
        let text = std::fs::read_to_string(f).unwrap();
        for line in text.lines() {
            let Some(name) = file_like_field(line) else {
                continue;
            };
            if FILE_SOURCE_KEYS.contains(&name) {
                seen_listed.insert(name.to_string());
                continue;
            }
            let by_kind = FILE_SOURCE_KEYS_BY_KIND
                .iter()
                .any(|(_, k)| k.contains(&name));
            let explained = NOT_A_SCENARIO_FILE_SOURCE
                .iter()
                .any(|(file, field, _)| *file == rel && *field == name);
            if !(by_kind || explained) {
                unexplained.push(format!("{rel}: {name}"));
            }
        }
    }
    assert!(
        unexplained.is_empty(),
        "scenario fields that look like file sources and are neither in \
         surface::FILE_SOURCE_KEYS nor explained in this test: {unexplained:?}. A field that \
         makes the engine read a file must be added to FILE_SOURCE_KEYS (and so refused by the \
         MCP server); anything else needs a line here saying why it is not a file source"
    );
    // The list names only fields that exist: a rename would otherwise leave a stale entry
    // that refuses nothing.
    for k in FILE_SOURCE_KEYS {
        assert!(
            seen_listed.contains(*k),
            "FILE_SOURCE_KEYS lists `{k}`, which no scenario type defines"
        );
    }
}

#[test]
fn every_scenario_in_the_repository_that_an_agent_may_run_is_inline_only_or_listed() {
    // The bundled scenarios an agent can fetch with get_example_scenario run through the MCP
    // server as they are, so none may name a file. (Scenarios under scenarios/ that do are
    // for the command line and are not bundled.)
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let bundled = std::fs::read_to_string(root.join("src/bundled_scenarios.rs")).unwrap();
    let mut refused = Vec::new();
    for line in bundled.lines() {
        let Some(i) = line.find("bundled!(\"") else {
            continue;
        };
        let name = line[i + "bundled!(\"".len()..].split('"').next().unwrap();
        let rel = format!("scenarios/{name}.toml");
        let Ok(text) = std::fs::read_to_string(root.join(&rel)) else {
            continue;
        };
        if let Err(e) = reject_file_sources(&text, usize::MAX) {
            refused.push(format!("{rel}: {e}"));
        }
    }
    assert!(
        refused.is_empty(),
        "bundled scenarios an agent can fetch name a file, so the MCP server would refuse to run them: {refused:?}"
    );
}
