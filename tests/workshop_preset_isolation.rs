// SPDX-License-Identifier: AGPL-3.0-only
//! The optional Celeste IOD preset must be withholdable by deleting `src/celeste_iod.rs` and
//! the `scenarios/*celeste-iod*.toml` files, with no source edit.
//!
//! `build.rs` compiles the preset only when its file exists, so the build side holds by
//! construction; these scans hold the text side. Only the listed files may name the preset
//! (the three cfg-gated registrations, the build script, the repository-only scenario table
//! and the tests that list withholdable files), and the band-plan numbers presented at the
//! ESA NAVISP LEO-PNT workshop, 2026 that no public source gives may appear only in the
//! preset file and its scenarios.

use std::path::{Path, PathBuf};

fn files(root: &Path) -> Vec<(String, PathBuf)> {
    let mut out = Vec::new();
    for dir in ["src", "scenarios", "tests", "data"] {
        let mut stack = vec![root.join(dir)];
        while let Some(d) = stack.pop() {
            let Ok(rd) = std::fs::read_dir(&d) else {
                continue;
            };
            for e in rd.flatten() {
                let p = e.path();
                if p.is_dir() {
                    stack.push(p);
                    continue;
                }
                let rel = p
                    .strip_prefix(root)
                    .unwrap()
                    .to_string_lossy()
                    .replace('\\', "/");
                out.push((rel, p));
            }
        }
    }
    out.push(("build.rs".into(), root.join("build.rs")));
    out
}

fn is_preset_scenario(rel: &str) -> bool {
    rel.starts_with("scenarios/") && rel.contains("celeste-iod") && rel.ends_with(".toml")
}

#[test]
fn only_the_listed_files_name_the_workshop_preset() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let allowed = [
        "src/celeste_iod.rs",
        "src/lib.rs",
        "build.rs",
        "src/leo_link/presets/mod.rs",
        "src/leo_navmsg/presets/mod.rs",
        "src/leo_fusion/presets/mod.rs",
        "src/bundled_scenarios.rs",
        "src/verification.rs",
        "tests/cli_first_run.rs",
        "tests/scenario_count_doc_sync.rs",
        "tests/leo_signal_reference.rs",
        "tests/workshop_preset_isolation.rs",
        "tests/leo_pnt_chain.rs",
        "tests/interop_formats.rs",
        "tests/required_fields_are_true.rs",
    ];
    let mut offenders = Vec::new();
    for (rel, p) in files(root) {
        if allowed.contains(&rel.as_str()) || is_preset_scenario(&rel) {
            continue;
        }
        let Ok(text) = std::fs::read_to_string(&p) else {
            continue;
        };
        if text.contains("celeste-iod") || text.contains("celeste_iod") {
            offenders.push(rel);
        }
    }
    assert!(
        offenders.is_empty(),
        "files naming the workshop preset outside the withholdable set: {offenders:?}"
    );
}

#[test]
fn workshop_numbers_live_only_in_the_preset_file_and_its_scenarios() {
    // Centre frequencies of the UHF, C and extended-C bands as presented at the workshop;
    // no public source gives them. (The E5 centre 1191.795 MHz and the S-band 2492.028 MHz
    // are the public Galileo E5 and NavIC S carriers and may appear anywhere.)
    let numbers = [
        "465.465",
        "465_465",
        "5019.861",
        "5_019.861",
        "5071.011",
        "5_071.011",
        "5122.161",
        "5_122.161",
        // The peak of the pass C/N0 shown at the workshop, the preset's calibration target.
        "57.5 dB-Hz",
    ];
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut offenders = Vec::new();
    // The public documents stay with a withholding release too, so they are scanned as well.
    let mut scanned = files(root);
    for top in ["README.md", "CHANGELOG.md"] {
        scanned.push((top.into(), root.join(top)));
    }
    let mut stack = vec![root.join("docs")];
    while let Some(d) = stack.pop() {
        let Ok(rd) = std::fs::read_dir(&d) else {
            continue;
        };
        for e in rd.flatten() {
            let p = e.path();
            if p.is_dir() {
                stack.push(p);
            } else if p.extension().is_some_and(|x| x == "md") {
                let rel = p
                    .strip_prefix(root)
                    .unwrap()
                    .to_string_lossy()
                    .replace('\\', "/");
                scanned.push((rel, p));
            }
        }
    }
    for (rel, p) in scanned {
        if rel == "src/celeste_iod.rs"
            || rel == "tests/workshop_preset_isolation.rs"
            || is_preset_scenario(&rel)
        {
            continue;
        }
        let Ok(text) = std::fs::read_to_string(&p) else {
            continue;
        };
        for n in numbers {
            if text.contains(n) {
                offenders.push(format!("{rel}: {n}"));
            }
        }
    }
    assert!(
        offenders.is_empty(),
        "workshop numbers outside the preset file and its scenarios: {offenders:?}"
    );
}

#[test]
fn the_build_script_gates_the_preset_on_its_file() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let b = std::fs::read_to_string(root.join("build.rs")).expect("build.rs");
    assert!(b.contains("src/celeste_iod.rs") && b.contains("kshana_celeste"));
    let lib = std::fs::read_to_string(root.join("src/lib.rs")).expect("lib.rs");
    assert!(lib.contains("#[cfg(kshana_celeste)]\npub mod celeste_iod;"));
}

#[test]
fn a_build_without_the_preset_has_nothing_left_unused() {
    // A cfg-gated statement that mutates a collection (`v.push(preset)`) leaves the
    // collection's `mut` unused when the preset file is withheld: a warning, and a clippy
    // failure under `-D warnings`. The preset must be a cfg-gated element or item instead.
    let root = Path::new(env!("CARGO_MANIFEST_DIR"));
    let mut offenders = Vec::new();
    for (rel, p) in files(root) {
        if !rel.ends_with(".rs") || rel == "tests/workshop_preset_isolation.rs" {
            continue;
        }
        let Ok(text) = std::fs::read_to_string(&p) else {
            continue;
        };
        let lines: Vec<&str> = text.lines().collect();
        for (i, l) in lines.iter().enumerate() {
            if l.trim() != "#[cfg(kshana_celeste)]" {
                continue;
            }
            if let Some(next) = lines.get(i + 1) {
                if [".push(", ".insert(", ".extend("]
                    .iter()
                    .any(|m| next.contains(m))
                {
                    offenders.push(format!("{rel}:{}", i + 2));
                }
            }
        }
    }
    assert!(
        offenders.is_empty(),
        "cfg-gated mutations that leave a `mut` unused without the preset: {offenders:?}"
    );
}
