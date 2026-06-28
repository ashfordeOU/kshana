//! Regression guard: the registry-facing surface READMEs (PyPI / crates.io / npm) must
//! reference images by ABSOLUTE URL only.
//!
//! PyPI, crates.io and npm render the long description with no base URL, so a relative
//! image path like `docs/assets/foo.png` cannot be resolved and shows as a broken image.
//! This is exactly what broke the PyPI 0.21.0 page: it was published from the main
//! `README.md` (before `readme = "README.pypi.md"` was set), and every relative-path
//! image rendered as a broken `?` box while the absolute shields.io badges loaded fine.
//!
//! GitHub resolves relative paths against the repository, so `README.md` may keep them;
//! the per-surface READMEs that registries actually render must not. This test fails the
//! build the moment any of them reintroduces a relative image reference, naming the file
//! and the offending target. Sibling of `readme_validation_counts_doc_sync.rs`.

/// All `<img ... src="...">` targets in `src` (handles both quote styles, bounded to the
/// tag so a later attribute can't be mistaken for the source).
fn html_img_srcs(src: &str) -> Vec<String> {
    let mut out = Vec::new();
    for (i, _) in src.match_indices("<img") {
        let tag = &src[i..];
        let tag = &tag[..tag.find('>').unwrap_or(tag.len())];
        if let Some(sp) = tag.find("src=") {
            let after = &tag[sp + 4..];
            if let Some(q) = after.chars().next() {
                if q == '"' || q == '\'' {
                    if let Some(end) = after[1..].find(q) {
                        out.push(after[1..1 + end].to_string());
                    }
                }
            }
        }
    }
    out
}

/// All Markdown image targets `![alt](target ...)` in `src` (drops an optional title).
fn markdown_img_targets(src: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut idx = 0;
    while let Some(p) = src[idx..].find("![") {
        let start = idx + p;
        if let Some(close_alt) = src[start..].find("](") {
            let paren = start + close_alt + 2;
            if let Some(close) = src[paren..].find(')') {
                let target = src[paren..paren + close]
                    .split_whitespace()
                    .next()
                    .unwrap_or("")
                    .to_string();
                if !target.is_empty() {
                    out.push(target);
                }
                idx = paren + close + 1;
                continue;
            }
        }
        idx = start + 2;
    }
    out
}

fn image_targets(src: &str) -> Vec<String> {
    let mut v = html_img_srcs(src);
    v.extend(markdown_img_targets(src));
    v
}

fn is_renderable_anywhere(url: &str) -> bool {
    // Absolute http(s) URLs resolve on every registry; data: URIs are self-contained.
    url.starts_with("https://") || url.starts_with("http://") || url.starts_with("data:")
}

const SURFACES: [(&str, &str); 3] = [
    ("README.pypi.md", include_str!("../README.pypi.md")),
    ("README.crates.md", include_str!("../README.crates.md")),
    ("README.npm.md", include_str!("../README.npm.md")),
];

#[test]
fn surface_readmes_use_only_absolute_image_urls() {
    let mut violations = Vec::new();
    for (name, body) in SURFACES {
        for target in image_targets(body) {
            if !is_renderable_anywhere(&target) {
                violations.push(format!("  {name}: relative image target {target:?}"));
            }
        }
    }

    assert!(
        violations.is_empty(),
        "Registry-facing surface READMEs must use absolute image URLs — PyPI/crates.io/npm \
         render with no base URL, so relative paths become broken images. Rewrite each to \
         https://raw.githubusercontent.com/AshfordeOU/kshana/main/<path> (or a shields.io \
         badge URL):\n{}",
        violations.join("\n")
    );
}

#[test]
fn surface_readmes_actually_contain_images() {
    // Keeps the absolute-URL guard from passing vacuously if the parser ever stops
    // finding images (e.g. a markup change the parser doesn't understand).
    for (name, body) in SURFACES {
        assert!(
            !image_targets(body).is_empty(),
            "{name}: expected at least one image reference, but the parser found none — \
             the absolute-URL guard would be vacuous."
        );
    }
}
