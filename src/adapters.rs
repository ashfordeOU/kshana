// SPDX-License-Identifier: AGPL-3.0-only
//! The adapter registry (roadmap A11): devices and log formats that Kshana reads by configuration,
//! with no change to the engine.
//!
//! An adapter is a folder under `adapters/` holding an `adapter.toml` (`kshana.adapter/1`): the
//! device or export it reads, a `kshana.connect/1` mapping file, a Connect conformance vector that
//! proves the mapping on a sample, the maintainer, the licence and a status. [`check`] validates every
//! manifest and runs every vector, so an adapter cannot be listed without passing. Adding one is a
//! pull request with these files only (`CONTRIBUTING.md`, "Adding an adapter").
//!
//! Only mapping-file adapters exist today. Runtime plug-ins in WebAssembly or Python are planned on
//! the same manifest (`kind`).
use serde::{Deserialize, Serialize};
use std::path::{Path, PathBuf};

/// The schema id of an adapter manifest.
pub const SCHEMA: &str = "kshana.adapter/1";
const KINDS: [&str; 1] = ["mapping"];
const STATUSES: [&str; 3] = ["example", "community", "maintained"];

/// `adapter.toml`.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Manifest {
    /// Always [`SCHEMA`].
    pub schema: String,
    /// A short id: lower-case letters, digits and `-`, unique in the registry.
    pub name: String,
    /// One line: what device or export this reads.
    pub title: String,
    /// `mapping` (a `kshana.connect/1` mapping file).
    pub kind: String,
    /// The mapping file, relative to the manifest.
    pub mapping: String,
    /// A Connect conformance vector (`vector.toml`), relative to the manifest.
    pub vector: String,
    /// Who maintains it (a person or an organisation, as they wish to be named).
    pub maintainer: String,
    /// SPDX licence of the adapter's files.
    pub licence: String,
    /// `example`, `community` or `maintained`.
    pub status: String,
    /// Optional link to the device's or format's public documentation.
    #[serde(default)]
    pub reference: Option<String>,
}

/// One registry entry as checked.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Entry {
    /// The manifest's folder.
    pub dir: String,
    /// The manifest, when it parsed.
    pub manifest: Option<Manifest>,
    /// What is wrong; empty when the adapter passes.
    pub problems: Vec<String>,
}

impl Entry {
    /// True when the adapter passes every check.
    pub fn ok(&self) -> bool {
        self.problems.is_empty()
    }
}

fn is_id(s: &str) -> bool {
    !s.is_empty()
        && s.len() <= 64
        && s.bytes()
            .all(|b| b.is_ascii_lowercase() || b.is_ascii_digit() || b == b'-')
}

/// Every `adapter.toml` under `root`, in path order.
pub fn find(root: &Path) -> Vec<PathBuf> {
    let mut out = Vec::new();
    let mut stack = vec![root.to_path_buf()];
    while let Some(d) = stack.pop() {
        let Ok(rd) = std::fs::read_dir(&d) else {
            continue;
        };
        for e in rd.flatten() {
            let p = e.path();
            if p.is_dir() {
                stack.push(p);
            } else if p.file_name().is_some_and(|n| n == "adapter.toml") {
                out.push(p);
            }
        }
    }
    out.sort();
    out
}

fn check_one(path: &Path) -> Entry {
    let dir = path.parent().unwrap_or(Path::new("."));
    let mut problems = Vec::new();
    let manifest = match std::fs::read_to_string(path)
        .map_err(|e| e.to_string())
        .and_then(|t| toml::from_str::<Manifest>(&t).map_err(|e| e.to_string()))
    {
        Ok(m) => Some(m),
        Err(e) => {
            problems.push(crate::terr!("e-adapter-manifest", e = e));
            None
        }
    };
    if let Some(m) = &manifest {
        if m.schema != SCHEMA {
            problems.push(crate::terr!("e-adapter-schema", got = m.schema.clone()));
        }
        if !is_id(&m.name) {
            problems.push(crate::terr!("e-adapter-name", name = m.name.clone()));
        }
        if !KINDS.contains(&m.kind.as_str()) {
            problems.push(crate::terr!("e-adapter-kind", kind = m.kind.clone()));
        }
        if !STATUSES.contains(&m.status.as_str()) {
            problems.push(crate::terr!("e-adapter-status", status = m.status.clone()));
        }
        for (field, v) in [
            ("title", &m.title),
            ("maintainer", &m.maintainer),
            ("licence", &m.licence),
        ] {
            if v.trim().is_empty() {
                problems.push(crate::terr!("e-adapter-empty", field = field));
            }
        }
        match std::fs::read_to_string(dir.join(&m.mapping))
            .map_err(|e| e.to_string())
            .and_then(|t| crate::connect::parse_mapping(&t))
        {
            Ok(_) => {}
            Err(e) => problems.push(crate::terr!("e-adapter-mapping", e = e)),
        }
        let vpath = dir.join(&m.vector);
        match crate::connect::run_vector(&vpath) {
            Err(e) => problems.push(crate::terr!("e-adapter-vector", e = e)),
            Ok((v, expected, produced)) => {
                // The vector must exercise this adapter's own mapping.
                let same = v.mapping.as_ref().is_some_and(|vm| {
                    let a = vpath
                        .parent()
                        .unwrap_or(Path::new("."))
                        .join(vm)
                        .canonicalize()
                        .ok();
                    let b = dir.join(&m.mapping).canonicalize().ok();
                    a.is_some() && a == b
                });
                if !same {
                    problems.push(crate::terr!("e-adapter-vector-mapping"));
                }
                let want = std::fs::read_to_string(&expected).unwrap_or_default();
                if let Some(line) = crate::connect::first_difference(&want, &produced) {
                    problems.push(crate::terr!(
                        "e-adapter-vector-differs",
                        line = line.to_string()
                    ));
                }
            }
        }
    }
    Entry {
        dir: dir.display().to_string(),
        manifest,
        problems,
    }
}

/// Check every adapter under `root`: manifests, mappings, vectors, and that names are unique.
pub fn check(root: &Path) -> Vec<Entry> {
    let mut entries: Vec<Entry> = find(root).iter().map(|p| check_one(p)).collect();
    let names: Vec<Option<String>> = entries
        .iter()
        .map(|e| e.manifest.as_ref().map(|m| m.name.clone()))
        .collect();
    for (i, e) in entries.iter_mut().enumerate() {
        if let Some(n) = &names[i] {
            if names.iter().filter(|x| x.as_ref() == Some(n)).count() > 1 {
                e.problems
                    .push(crate::terr!("e-adapter-duplicate", name = n.clone()));
            }
        }
    }
    entries
}
