//! The machine-translated READMEs (README.<lang>.md): one per engine locale, each opening with the note that it is an
//! unreviewed machine translation linking back to the English README, each reachable from the language row of every
//! README, and none of them in the published crate.

use std::fs;
use std::path::Path;

fn locales() -> Vec<String> {
    let mut v: Vec<String> = fs::read_dir(Path::new(env!("CARGO_MANIFEST_DIR")).join("i18n"))
        .expect("i18n/")
        .filter_map(|e| e.ok())
        .filter(|e| e.path().join("engine.ftl").exists())
        .map(|e| e.file_name().to_string_lossy().into_owned())
        .filter(|l| l != "en")
        .collect();
    v.sort();
    v
}

fn read(name: &str) -> String {
    fs::read_to_string(Path::new(env!("CARGO_MANIFEST_DIR")).join(name))
        .unwrap_or_else(|_| panic!("{name} is missing"))
}

#[test]
fn every_locale_has_a_translated_readme_that_points_back_to_english() {
    let langs = locales();
    assert!(
        langs.len() >= 17,
        "only {} engine locales found",
        langs.len()
    );
    for l in &langs {
        let t = read(&format!("README.{l}.md"));
        let first = t.lines().next().unwrap_or("");
        assert!(
            first.starts_with('>') && first.contains("(README.md)"),
            "README.{l}.md must open with the machine-translation note linking to README.md"
        );
        assert_eq!(
            t.matches("```").count() % 2,
            0,
            "README.{l}.md has an unbalanced code fence"
        );
    }
}

#[test]
fn every_readme_links_every_language() {
    let langs = locales();
    let mut all = vec!["README.md".to_string()];
    all.extend(langs.iter().map(|l| format!("README.{l}.md")));
    for f in &all {
        let t = read(f);
        assert!(
            t.contains("<a href=\"README.md\">"),
            "{f}: the language row does not link the English README"
        );
        for l in &langs {
            assert!(
                t.contains(&format!("<a href=\"README.{l}.md\">")),
                "{f}: the language row does not link README.{l}.md"
            );
        }
    }
}

#[test]
fn translated_readmes_stay_out_of_the_crate() {
    let manifest = read("Cargo.toml");
    for l in locales() {
        assert!(
            manifest.contains(&format!("\"/README.{l}.md\"")),
            "Cargo.toml does not exclude README.{l}.md from the crate"
        );
    }
}
