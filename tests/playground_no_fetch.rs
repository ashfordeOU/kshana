//! RM-07: the browser playground (the Studio, `web/studio/`; `web/playground/` is a
//! redirect to it) runs every scenario it offers with no extra file.
//!
//! The Studio loads scenario text from one bundle, `web/studio/scenarios/index.json`
//! (a per-file fetch of the `.toml` beside it is only the fallback for a host that does
//! not serve the bundle), and the WebAssembly engine has no file system. So "no extra
//! files" means three things, each checked here:
//!
//! 1. every scenario the Studio's library lists (`SCENARIOS` in
//!    `web/studio/lib/catalog.mjs`) is in the bundle, except the ones the library itself
//!    marks `NOT_IN_BROWSER` with a reason;
//! 2. the bundle is exactly the `.toml` files beside it, each byte-identical to the
//!    repository's own `scenarios/` copy, so the bundle cannot go stale;
//! 3. every bundled scenario the browser runs is run here by the engine from an EMPTY
//!    working directory, so a scenario that silently reads a relative data file (which
//!    the browser could never serve) fails this test instead of failing in a browser.
//!
//! PIN-SCOPE:    membership of the Studio library in the bundle; byte equality of the
//!               bundle, the `.toml` files beside it and `scenarios/`; and that each
//!               browser-runnable bundled scenario runs to `Ok` with no file reachable by
//!               a relative path.
//! PIN-EXCLUDES: the run's output values (pinned by the goldens); absolute paths (no
//!               bundled scenario carries one, and check 3 cannot see them); the optional
//!               scenario groups that ship in their own folders; and the browser build
//!               itself (this runs the native engine on the same text the browser runs).

use std::collections::{BTreeMap, BTreeSet};
use std::path::PathBuf;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn bundle() -> BTreeMap<String, String> {
    let text = std::fs::read_to_string(root().join("web/studio/scenarios/index.json"))
        .expect("web/studio/scenarios/index.json");
    serde_json::from_str(&text).expect("the bundle is a JSON object of file -> text")
}

/// The first quoted string of each array row in the `export const NAME = [ ... ];` or
/// the keys of `export const NAME = { ... };` block of the catalogue.
fn catalog_block(name: &str) -> Vec<String> {
    let src = std::fs::read_to_string(root().join("web/studio/lib/catalog.mjs")).unwrap();
    let start = src
        .find(&format!("export const {name} = "))
        .unwrap_or_else(|| panic!("catalog.mjs has no {name}"));
    let body = &src[start..];
    let end = body.find("\n};").or_else(|| body.find("\n];")).unwrap();
    let mut out = Vec::new();
    for line in body[..end].lines().skip(1) {
        let t = line.trim_start().trim_start_matches('[');
        if let Some(rest) = t.strip_prefix('"') {
            if let Some(q) = rest.find('"') {
                out.push(rest[..q].to_string());
            }
        }
    }
    out
}

#[test]
fn every_library_scenario_is_bundled_or_marked_not_in_browser() {
    let b = bundle();
    let not_in_browser: BTreeSet<String> = catalog_block("NOT_IN_BROWSER").into_iter().collect();
    let library = catalog_block("SCENARIOS");
    assert!(
        library.len() > 100,
        "the library parse found only {}",
        library.len()
    );
    let missing: Vec<_> = library
        .iter()
        .filter(|f| !b.contains_key(*f) && !not_in_browser.contains(*f))
        .collect();
    assert!(
        missing.is_empty(),
        "listed in the Studio but not bundled: {missing:?}"
    );
}

#[test]
fn the_bundle_is_the_files_beside_it_and_matches_scenarios() {
    let b = bundle();
    let dir = root().join("web/studio/scenarios");
    let beside: BTreeSet<String> = std::fs::read_dir(&dir)
        .unwrap()
        .flatten()
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .filter(|n| n.ends_with(".toml"))
        .collect();
    let keys: BTreeSet<String> = b.keys().cloned().collect();
    assert_eq!(
        keys, beside,
        "bundle keys differ from the .toml files beside it"
    );
    for (file, text) in &b {
        let local = std::fs::read_to_string(dir.join(file)).unwrap();
        assert_eq!(
            &local, text,
            "{file}: bundle text differs from the file beside it"
        );
        let repo = std::fs::read_to_string(root().join("scenarios").join(file))
            .unwrap_or_else(|_| panic!("{file}: no scenarios/ copy"));
        assert_eq!(
            &repo, text,
            "{file}: bundle text differs from scenarios/{file}"
        );
    }
}

// This test changes the process working directory; the others in this binary read
// only absolute paths, so running them in parallel with it is safe.
#[test]
fn every_browser_scenario_runs_from_an_empty_directory() {
    let b = bundle();
    let not_in_browser: BTreeSet<String> = catalog_block("NOT_IN_BROWSER").into_iter().collect();
    let empty = std::env::temp_dir().join(format!("kshana-rm07-{}", std::process::id()));
    std::fs::create_dir_all(&empty).unwrap();
    std::env::set_current_dir(&empty).unwrap();
    let mut failures = Vec::new();
    for (file, text) in &b {
        if not_in_browser.contains(file) {
            continue;
        }
        if let Err(e) = kshana::api::run_toml(text) {
            failures.push(format!("{file}: {e}"));
        }
    }
    std::env::set_current_dir(root()).unwrap();
    let _ = std::fs::remove_dir(&empty);
    assert!(
        failures.is_empty(),
        "bundled scenarios that need a file the browser cannot serve:\n{}",
        failures.join("\n")
    );
}
