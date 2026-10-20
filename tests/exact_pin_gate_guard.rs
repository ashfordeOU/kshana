// SPDX-License-Identifier: AGPL-3.0-only
//! Guard for issue #36: the byte-exact layer of a pin must not be gated on the platform alone.
//!
//! "aarch64 macOS" is not one maths library: Apple ships a different one with each macOS
//! release, so a literal captured on one Mac is not the last-bit output of another Apple-silicon
//! Mac or of a hosted macOS runner. The exact layer of
//! `the_fixture_geometry_is_still_the_engines_own_service_volume` was gated on
//! `cfg!(all(target_arch = "aarch64", target_os = "macos"))` and failed in the last bit on a
//! macos-14 arm64 runner while its portable layer passed. The exact layer now needs the
//! declaration `KSHANA_EXACT_PINS=1` as well, which `scripts/gate.sh` makes.
//!
//! This test keeps that from coming back: (1) the bare platform `cfg!` appears only in the three
//! files that define the rule, and each of those also reads `KSHANA_EXACT_PINS`; (2) the
//! canonical gate declares the baseline, so the exact layer is still enforced where the pins
//! were captured. It reads source text and runs nothing, so it passes on every host.

use std::path::{Path, PathBuf};

const DEFINITIONS: &[&str] = &[
    "src/test_support.rs",
    "tests/support/mod.rs",
    "tests/lunar_protection_level_reference.rs",
];

const COARSE: &str = "cfg!(all(target_arch = \"aarch64\", target_os = \"macos\"))";

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn rust_files(dir: &Path, out: &mut Vec<PathBuf>) {
    for e in std::fs::read_dir(dir).unwrap().flatten() {
        let p = e.path();
        if p.is_dir() {
            if p.file_name().is_some_and(|n| n == "fixtures") {
                continue;
            }
            rust_files(&p, out);
        } else if p.extension().is_some_and(|x| x == "rs") {
            out.push(p);
        }
    }
}

#[test]
fn the_platform_alone_never_gates_a_byte_exact_layer() {
    let mut files = Vec::new();
    for d in ["src", "tests"] {
        rust_files(&root().join(d), &mut files);
    }
    assert!(
        files.len() > 100,
        "only {} source files scanned",
        files.len()
    );
    let mut stray = Vec::new();
    for f in &files {
        let rel = f
            .strip_prefix(root())
            .unwrap()
            .to_string_lossy()
            .replace('\\', "/");
        if rel == "tests/exact_pin_gate_guard.rs" {
            continue;
        }
        let text = std::fs::read_to_string(f).unwrap();
        if text.contains(COARSE) && !DEFINITIONS.contains(&rel.as_str()) {
            stray.push(rel);
        }
    }
    assert!(
        stray.is_empty(),
        "a byte-exact layer is gated on aarch64 macOS alone in {stray:?}: use \
         test_support::on_baseline_host() (or tests/support's), which also needs KSHANA_EXACT_PINS=1"
    );
    for d in DEFINITIONS {
        let text = std::fs::read_to_string(root().join(d)).unwrap();
        assert!(
            text.contains("KSHANA_EXACT_PINS"),
            "{d} defines the baseline rule without the KSHANA_EXACT_PINS declaration"
        );
    }
}

#[test]
fn the_canonical_gate_declares_the_baseline() {
    let gate = std::fs::read_to_string(root().join("scripts/gate.sh")).unwrap();
    assert!(
        gate.contains("export KSHANA_EXACT_PINS=\"${KSHANA_EXACT_PINS:-1}\""),
        "scripts/gate.sh must export KSHANA_EXACT_PINS (default 1) so the byte-exact layer is \
         still enforced where the pins were captured"
    );
    // No lingering use of the old constant, which a bare `if CONST {` would make coarse again.
    let mut files = Vec::new();
    for d in ["src", "tests"] {
        rust_files(&root().join(d), &mut files);
    }
    let needle = ["ON_BASELINE", "_HOST"].concat();
    for f in files {
        if f.ends_with("exact_pin_gate_guard.rs") {
            continue;
        }
        let text = std::fs::read_to_string(&f).unwrap();
        assert!(
            !text.contains(&needle),
            "{} still uses the old platform-only constant",
            f.display()
        );
    }
}
