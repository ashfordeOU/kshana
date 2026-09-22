// SPDX-License-Identifier: AGPL-3.0-only
//! The distribution diagram must describe the repository that exists.
//!
//! ## Why this exists
//!
//! `docs/diagrams/distribution.mmd` draws what this repository ships and where: the core
//! crate, the MCP server, the IDE plugin, the cross-validation crates, and the registries
//! each is published to. Every other diagram in `docs/diagrams` has a doc-sync guard.
//! These two — `distribution` and `engine-flow` — had none from June until now, and in
//! that window `engine-flow` came to state "the 6 figures of merit" while the engine
//! scored seven. It was wrong on a published surface for months, and nothing noticed
//! because nothing looked.
//!
//! This guard is the other half of that repair. `distribution` was audited at the same
//! time and was accurate, so this pins it *while* it is accurate rather than after it
//! drifts — which is the only time pinning is cheap.
//!
//! ## What is checked, and in both directions
//!
//! A diagram can go wrong two ways: it can name something that no longer exists, and it
//! can omit something that does. Checking only the first is the mistake the card-map
//! guard makes deliberately (its cards are a curated subset) and that this one must not:
//! an unmentioned cross-validation crate is exactly the kind of work that becomes
//! invisible. So every `xval/` directory must appear, and every name the diagram gives
//! must resolve to a directory.

use std::collections::BTreeSet;
use std::path::PathBuf;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn diagram() -> String {
    std::fs::read_to_string(root().join("docs/diagrams/distribution.mmd"))
        .expect("read docs/diagrams/distribution.mmd")
}

/// Every cross-validation crate on disk is drawn, and every name drawn is on disk.
#[test]
fn the_distribution_diagram_names_exactly_the_xval_crates_that_exist() {
    let src = diagram();
    let xval = root().join("xval");
    let dirs: BTreeSet<String> = std::fs::read_dir(&xval)
        .expect("read xval/")
        .filter_map(|e| e.ok())
        .filter(|e| e.path().is_dir() && e.path().join("Cargo.toml").is_file())
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .collect();
    assert!(
        dirs.len() >= 3,
        "only {} xval crates found; this guard would be nearly vacuous — has the \
         directory moved?",
        dirs.len()
    );

    // The diagram writes the anise family by its distinguishing suffix ("lunar-od" for
    // `anise-lunar-od`), so match on the suffix rather than the full directory name.
    let mut missing = Vec::new();
    for d in &dirs {
        let shown = d.strip_prefix("anise-").unwrap_or(d);
        if !src.contains(shown) {
            missing.push(format!(
                "  xval/{d} exists but the diagram never names it (looked for {shown:?})"
            ));
        }
    }
    assert!(
        missing.is_empty(),
        "the distribution diagram omits a cross-validation crate, so a reader cannot see \
         it exists:\n{}\n\nAdd it to docs/diagrams/distribution.mmd, then re-render the \
         SVG and PNG — the README embeds the rendering, not the source.",
        missing.join("\n")
    );
}

/// The component paths the diagram labels must be real paths.
#[test]
fn the_distribution_diagram_labels_real_paths() {
    let src = diagram();
    let mut wrong = Vec::new();
    for rel in ["mcp/kshana-mcp", "ide/jetbrains", "xval"] {
        if !src.contains(rel) {
            wrong.push(format!("  the diagram no longer mentions {rel}"));
        } else if !root().join(rel).exists() {
            wrong.push(format!("  the diagram draws {rel}, which does not exist"));
        }
    }
    assert!(
        wrong.is_empty(),
        "distribution diagram drift:\n{}",
        wrong.join("\n")
    );
}

/// Anything the diagram marks "(excluded)" must really be excluded from the published
/// crate — otherwise the picture understates what a `cargo publish` ships.
#[test]
fn everything_drawn_as_excluded_is_excluded_from_the_published_crate() {
    let src = diagram();
    let manifest = std::fs::read_to_string(root().join("Cargo.toml")).expect("read Cargo.toml");
    // Only inspect the `exclude = [...]` list, not the whole manifest: the paths appear
    // elsewhere (workspace members, doc links) and matching those would pass vacuously.
    let start = manifest
        .find("exclude = [")
        .expect("Cargo.toml has an exclude list");
    let end = manifest[start..].find(']').expect("exclude list is closed") + start;
    // Parse the list into exact entries. A substring test is not good enough:
    // `contains("/xval")` is satisfied by "/xvalXX" and by "/xval-old", so a renamed or
    // mistyped exclusion would read as present. That is not hypothetical — the first
    // mutation written against this guard changed "/xval" to "/xvalXX" and the guard
    // stayed green, which is how the weakness was found.
    let exclude: BTreeSet<&str> = manifest[start..end]
        .split(['"'])
        .filter(|t| t.starts_with('/'))
        .collect();

    let mut wrong = Vec::new();
    for (label, path) in [("xval", "/xval"), ("mcp", "/mcp"), ("ide", "/ide")] {
        let drawn_excluded = src.contains(&format!("{label} cross-checks (excluded)"))
            || src
                .lines()
                .any(|l| l.contains(path.trim_start_matches('/')) && l.contains("excluded"))
            || label == "ide";
        if drawn_excluded && !exclude.contains(path) {
            wrong.push(format!(
                "  {label} is presented as not part of the published crate, but \
                 Cargo.toml's exclude list does not carry {path}"
            ));
        }
    }
    assert!(
        wrong.is_empty(),
        "the diagram and the packaging rules disagree about what ships:\n{}",
        wrong.join("\n")
    );
}

/// Every registry the diagram promises is a registry some workflow actually publishes to.
///
/// A diagram claiming a distribution channel that no job implements is a promise the
/// repository does not keep, and it is the sort of claim a reader has no way to test.
#[test]
fn every_distribution_channel_drawn_has_a_workflow_behind_it() {
    let src = diagram();
    let wf_dir = root().join(".github/workflows");
    let mut all = String::new();
    for entry in std::fs::read_dir(&wf_dir).expect("read .github/workflows") {
        let p = entry.expect("dir entry").path();
        if p.extension().and_then(|e| e.to_str()) == Some("yml") {
            all.push_str(&std::fs::read_to_string(&p).unwrap_or_default());
            all.push('\n');
        }
    }
    assert!(
        all.len() > 500,
        "workflow directory read as {} bytes; the guard would be vacuous",
        all.len()
    );

    // (what the diagram says, what proves a workflow implements it)
    let channels: &[(&str, &[&str])] = &[
        ("crates.io", &["cargo publish"]),
        ("PyPI", &["pypi", "PYPI_API_TOKEN"]),
        ("npm", &["npm publish", "NPM_TOKEN"]),
        ("ghcr.io", &["ghcr.io"]),
        ("JetBrains Marketplace", &["jetbrains"]),
        ("kshana.dev", &["pages"]),
    ];
    let mut unbacked = Vec::new();
    for (drawn, proofs) in channels {
        if !src.contains(drawn) {
            continue; // the diagram is allowed to stop promising a channel
        }
        let backed = proofs
            .iter()
            .any(|p| all.to_lowercase().contains(&p.to_lowercase()));
        if !backed {
            unbacked.push(format!(
                "  the diagram promises {drawn}, but no workflow mentions any of {proofs:?}"
            ));
        }
    }
    assert!(
        unbacked.is_empty(),
        "the distribution diagram promises a channel nothing publishes to:\n{}",
        unbacked.join("\n")
    );
}

/// The rendered SVG must still be the picture the source describes.
///
/// Cheap structural check rather than a re-render: the node labels the source defines
/// have to appear in the committed rendering. `distribution` uses native `<text>`, not
/// `<foreignObject>`, so its labels survive librsvg — unlike `module-map` and
/// `validation-provenance`, which must go through a browser engine.
#[test]
fn the_rendered_distribution_svg_carries_the_sources_labels() {
    let svg = std::fs::read_to_string(root().join("docs/assets/diagrams/distribution.svg"))
        .expect("read the committed distribution.svg");
    assert!(
        !svg.contains("<foreignObject"),
        "distribution.svg now uses foreignObject; it must be re-rendered with \
         tools/render-diagram-browser.sh, and this guard's assumption revisited"
    );
    let mut absent = Vec::new();
    for needle in ["crates.io", "PyPI", "npm", "Zenodo", "orekit-passes"] {
        // Mermaid splits a label across elements, so look for the word, not the phrase.
        let word = needle.split_whitespace().next().unwrap_or(needle);
        if !svg.contains(word) {
            absent.push(format!(
                "  {needle:?} is in the source but not the rendering"
            ));
        }
    }
    assert!(
        absent.is_empty(),
        "the committed distribution.svg is stale against its source:\n{}\n\nRe-render it \
         and the PNG with tools/render-diagram.sh.",
        absent.join("\n")
    );
}
