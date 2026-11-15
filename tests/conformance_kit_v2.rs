// SPDX-License-Identifier: AGPL-3.0-only
//! Connect conformance kit v2 (roadmap 0.42 I12): `conformance/kit.toml` lists every connector, and
//! the list is held to the code.
//!
//! * Every receiver reader `kshana obs convert --format` takes (the `LogFormat` enum, the drone and
//!   vessel readers and the two special cases in `obs::from_log`), every track decoder
//!   (`interconnect::FORMATS`), every track export form (`interconnect::cli::OUTPUTS`), every mapping
//!   source format and every timing parser has an entry, and each of those entries has at least one
//!   vector folder that names it.
//! * Every vector folder under `conformance/` is in the kit, and every folder the kit names exists.
//! * Every vector in the kit passes, run here through the library (the same code
//!   `kshana connect check` and `kshana connect timing check` run), so the kit runs offline.
//! * Connectors with no file vector name the test that checks them, and that test exists.
//!
//! `KSHANA_KIT_BLESS=1` writes the expected file of every connect vector whose expected file is
//! missing (new vectors only; review the output before committing).

use serde::Deserialize;
use std::collections::BTreeSet;
use std::path::{Path, PathBuf};

#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct Kit {
    schema: String,
    connector: Vec<Connector>,
}

#[derive(Deserialize)]
#[serde(deny_unknown_fields)]
struct Connector {
    id: String,
    kind: String,
    roadmap: String,
    vectors: Vec<String>,
    live: String,
    #[serde(default)]
    checked_by: Option<String>,
    #[serde(default)]
    note: Option<String>,
}

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn read(p: &str) -> String {
    std::fs::read_to_string(root().join(p)).unwrap_or_else(|e| panic!("{p}: {e}"))
}

fn kit() -> Kit {
    toml::from_str(&read("conformance/kit.toml")).expect("conformance/kit.toml")
}

/// The variants of `pub enum LogFormat`, in serde's kebab-case.
fn log_formats() -> Vec<String> {
    let src = read("src/receiver_trust/mod.rs");
    let body = src
        .split("pub enum LogFormat {")
        .nth(1)
        .and_then(|s| s.split("\n}").next())
        .unwrap();
    body.lines()
        .map(str::trim)
        .filter(|l| !l.starts_with("//") && l.ends_with(','))
        .map(|l| {
            let mut out = String::new();
            for (i, c) in l.trim_end_matches(',').chars().enumerate() {
                if c.is_ascii_uppercase() && i > 0 {
                    out.push('-');
                }
                out.push(c.to_ascii_lowercase());
            }
            out
        })
        .collect()
}

/// The formats `obs::from_log` handles before the `LogFormat` enum: `if format == "…"`.
fn from_log_special_cases() -> Vec<String> {
    let src = read("src/obs.rs");
    let body = src
        .split("pub fn from_log(")
        .nth(1)
        .and_then(|s| s.split("\n}\n").next())
        .unwrap();
    body.match_indices("if format == \"")
        .map(|(i, m)| {
            let rest = &body[i + m.len()..];
            rest[..rest.find('"').unwrap()].to_string()
        })
        .collect()
}

/// The match arms of `parse_timing` (`"pmc" => {`).
fn timing_parsers() -> Vec<String> {
    let src = read("src/connect_timing.rs");
    let body = src
        .split("pub fn parse_timing(")
        .nth(1)
        .and_then(|s| s.split("\n}\n").next())
        .unwrap();
    body.lines()
        .filter_map(|l| {
            let t = l.strip_prefix("        \"")?;
            let (name, rest) = t.split_once('"')?;
            rest.trim_start()
                .starts_with("=>")
                .then(|| name.to_string())
        })
        .collect()
}

/// The mapping source formats `connect::parse_mapping` accepts.
fn mapping_formats() -> Vec<String> {
    let src = read("src/connect.rs");
    let line = src
        .lines()
        .find(|l| l.contains("matches!(m.source.format.as_str(),"))
        .expect("the mapping format check in src/connect.rs");
    line.split('"')
        .skip(1)
        .step_by(2)
        .map(str::to_string)
        .collect()
}

/// Every connector id the code makes, by kind.
fn code_connectors() -> BTreeSet<String> {
    let mut out = BTreeSet::new();
    for f in log_formats()
        .into_iter()
        .chain(from_log_special_cases())
        .chain(
            kshana::interconnect::OBS_READERS
                .iter()
                .map(|s| s.to_string()),
        )
    {
        out.insert(format!("reader:{f}"));
    }
    for f in kshana::interconnect::FORMATS {
        out.insert(format!("decoder:{f}"));
    }
    for f in kshana::interconnect::cli::OUTPUTS {
        if f != "jsonl" {
            out.insert(format!("export:{f}"));
        }
    }
    for f in mapping_formats() {
        out.insert(format!("mapping:{f}"));
    }
    for f in timing_parsers() {
        out.insert(format!("timing:{f}"));
    }
    out
}

/// What a vector.toml checks: (kind, name) pairs. A decoder vector with an `options.to` form checks
/// the decoder and that export form.
fn vector_targets(dir: &Path) -> Vec<(String, String)> {
    let v: toml::Table = toml::from_str(&std::fs::read_to_string(dir.join("vector.toml")).unwrap())
        .unwrap_or_else(|e| panic!("{}: {e}", dir.display()));
    let s = |k: &str| v.get(k).and_then(|x| x.as_str()).map(str::to_string);
    if let Some(p) = s("parser") {
        return vec![("timing".into(), p)];
    }
    if let Some(r) = s("reader") {
        return vec![("reader".into(), r)];
    }
    if let Some(d) = s("decode") {
        let mut out = vec![("decoder".to_string(), d)];
        let to = v
            .get("options")
            .and_then(|o| o.get("to"))
            .and_then(|x| x.as_str());
        if let Some(t) = to.filter(|t| *t != "jsonl") {
            out.push(("export".into(), t.to_string()));
        }
        return out;
    }
    if let Some(m) = s("mapping") {
        let text = std::fs::read_to_string(dir.join(m)).unwrap();
        let mapping = kshana::connect::parse_mapping(&text).unwrap();
        return vec![("mapping".into(), mapping.source.format)];
    }
    panic!(
        "{}: a vector names a parser, reader, decoder or mapping",
        dir.display()
    )
}

#[test]
fn the_kit_lists_every_connector_the_code_makes() {
    let k = kit();
    assert_eq!(k.schema, "kshana.connect-kit/2");
    let mut ids = BTreeSet::new();
    for c in &k.connector {
        assert!(ids.insert(c.id.clone()), "duplicate connector {}", c.id);
        assert!(
            c.id.starts_with(&format!("{}:", c.id.split(':').next().unwrap())),
            "{}",
            c.id
        );
        assert!(
            ["check-live", "stream", "none"].contains(&c.live.as_str()),
            "{}: live = {}",
            c.id,
            c.live
        );
        assert!(
            c.roadmap.starts_with('I') || c.roadmap.starts_with('A'),
            "{}: roadmap {}",
            c.id,
            c.roadmap
        );
        assert!(!c.kind.is_empty());
    }
    // `live = "stream"` exactly where check-live's stream path runs: a receiver reader that reads
    // live (obs_live::LiveObs) and is not an open finding.
    let st: kshana::obs::Station = toml::from_str("id = \"K\"").unwrap();
    for c in &k.connector {
        let Some(f) = c.id.strip_prefix("reader:") else {
            continue;
        };
        let streams = kshana::obs_live::LiveObs::new(f, &st).is_ok()
            && !kshana::connect_live::STREAM_FINDINGS.contains(&f);
        assert_eq!(c.live == "stream", streams, "{}: live = {}", c.id, c.live);
    }
    let code = code_connectors();
    assert!(code.len() >= 40, "the code scan found only {code:?}");
    let missing: Vec<_> = code.difference(&ids).collect();
    assert!(
        missing.is_empty(),
        "connectors the code makes but conformance/kit.toml does not list: {missing:?}"
    );
    // Every connector the code makes ships at least one vector, and each vector names it.
    for c in k.connector.iter().filter(|c| code.contains(&c.id)) {
        assert!(!c.vectors.is_empty(), "{} has no vector", c.id);
        let (kind, name) = c.id.split_once(':').unwrap();
        for v in &c.vectors {
            let dir = root().join("conformance").join(v);
            let target = (kind.to_string(), name.to_string());
            assert!(
                vector_targets(&dir).contains(&target),
                "{v} does not check {}",
                c.id
            );
        }
    }
}

#[test]
fn every_vector_folder_is_in_the_kit_and_every_kit_folder_exists() {
    let k = kit();
    let listed: BTreeSet<String> = k
        .connector
        .iter()
        .flat_map(|c| c.vectors.iter().cloned())
        .collect();
    let mut on_disk = BTreeSet::new();
    for sub in ["connect", "timing"] {
        for v in kshana::connect::find_vectors(&root().join("conformance").join(sub)) {
            let rel = v
                .parent()
                .unwrap()
                .strip_prefix(root().join("conformance"))
                .unwrap()
                .display()
                .to_string();
            on_disk.insert(rel);
        }
    }
    let unlisted: Vec<_> = on_disk.difference(&listed).collect();
    let absent: Vec<_> = listed.difference(&on_disk).collect();
    assert!(
        unlisted.is_empty(),
        "vectors not in conformance/kit.toml: {unlisted:?}"
    );
    assert!(
        absent.is_empty(),
        "conformance/kit.toml names missing vectors: {absent:?}"
    );
    // Connectors without vectors say which test checks them, and that test exists.
    for c in k.connector.iter().filter(|c| c.vectors.is_empty()) {
        let t = c
            .checked_by
            .as_deref()
            .unwrap_or_else(|| panic!("{} has neither vectors nor checked_by", c.id));
        assert!(root().join(t).is_file(), "{}: {t} does not exist", c.id);
        assert!(c.note.is_some(), "{}: say what the test checks", c.id);
    }
}

#[test]
fn every_kit_vector_passes_offline() {
    let bless = std::env::var("KSHANA_KIT_BLESS").as_deref() == Ok("1");
    let mut n = 0;
    for c in kit().connector {
        for v in &c.vectors {
            let file = root().join("conformance").join(v).join("vector.toml");
            let (name, expected, produced) = if v.starts_with("timing/") {
                let (t, expected, produced) = kshana::connect_timing::run_timing_vector(&file)
                    .unwrap_or_else(|e| panic!("{v}: {e}"));
                (t.name, expected, produced)
            } else {
                let (vec, expected, produced) =
                    kshana::connect::run_vector(&file).unwrap_or_else(|e| panic!("{v}: {e}"));
                (vec.name, expected, produced)
            };
            if bless && !expected.exists() {
                std::fs::write(&expected, &produced).unwrap();
            }
            let want = std::fs::read_to_string(&expected)
                .unwrap_or_else(|e| panic!("{v}: {}: {e}", expected.display()));
            assert!(want == produced, "{name}: the output differs from {v}");
            assert!(
                produced.lines().count() >= 2,
                "{name}: a vector should produce more than one line"
            );
            n += 1;
        }
    }
    assert!(n >= 45, "only {n} vectors ran");
}

#[test]
fn the_offline_runner_uses_only_the_checkout() {
    let s = read("conformance/run-kit.sh");
    for cmd in [
        "connect check \"$DIR/connect\"",
        "connect check-live \"$DIR/connect\"",
        "connect timing check \"$DIR/timing\"",
    ] {
        assert!(
            s.contains(cmd),
            "conformance/run-kit.sh does not run `{cmd}`"
        );
    }
    for net in ["curl", "wget", "http://", "https://", "git clone"] {
        assert!(
            !s.contains(net),
            "conformance/run-kit.sh reaches the network ({net})"
        );
    }
}
