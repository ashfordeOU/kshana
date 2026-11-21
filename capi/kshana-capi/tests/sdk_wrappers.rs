// SPDX-License-Identifier: AGPL-3.0-only
//! The MATLAB package, the LabVIEW guide and the teaching kit (backlog B3801).
//!
//! MATLAB and LabVIEW cannot run on the CI runners, so this file checks what can be checked
//! without them:
//!
//! 1. every C function the MATLAB files name is declared in `include/kshana.h`, and the package
//!    reaches all five; every `.m` file in the package defines the function its name says;
//! 2. the LabVIEW guide configures every function the header declares;
//! 3. `sdk/python/wrapper_patterns.py` replays the MATLAB and LabVIEW call sequences (argument
//!    shapes, the length scan, one free per pointer, the error codes) on the built library;
//! 4. the three Python lab solutions in `docs/teaching/solutions/` run on the built library, and
//!    each checks that its lab sheet states the engine's answers.
//!
//! What this does NOT check: MATLAB's `loadlibrary`/`calllib` marshalling and LabVIEW's Call
//! Library Function Node themselves ("not run on the target tool" in the READMEs).
//!
//! PIN-SCOPE:    the lab answers are pinned by the sheets' own text, through the solution scripts.
//! PIN-EXCLUDES: no digest or byte-length pin here; the byte-level pins are sdk_conformance.rs.
//!
//! The Python steps need `python3`; without it they are skipped unless `KSHANA_REQUIRE_LANGS=1`.

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};
use std::process::Command;

fn here() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn repo() -> PathBuf {
    here().join("../..")
}

fn read(p: &Path) -> String {
    std::fs::read_to_string(p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

/// The function names `include/kshana.h` declares.
fn header_functions() -> BTreeSet<String> {
    let h = read(&here().join("include/kshana.h"));
    let mut out = BTreeSet::new();
    for line in h.lines() {
        let line = line.trim();
        if line.starts_with("/*") || line.starts_with('*') || line.starts_with('#') {
            continue;
        }
        if let Some(i) = line.find("kshana_") {
            let name: String = line[i..]
                .chars()
                .take_while(|c| c.is_ascii_alphanumeric() || *c == '_')
                .collect();
            if line[i + name.len()..].starts_with('(') {
                out.insert(name);
            }
        }
    }
    assert_eq!(out.len(), 5, "kshana.h declares five functions: {out:?}");
    out
}

/// Every `.m` file under a directory, recursively.
fn m_files(dir: &Path) -> Vec<PathBuf> {
    let mut out = Vec::new();
    let mut stack = vec![dir.to_path_buf()];
    while let Some(d) = stack.pop() {
        for e in std::fs::read_dir(&d).unwrap() {
            let p = e.unwrap().path();
            if p.is_dir() {
                stack.push(p);
            } else if p.extension().is_some_and(|x| x == "m") {
                out.push(p);
            }
        }
    }
    out.sort();
    out
}

/// The `'kshana_...'` names quoted in MATLAB source (calllib's function argument).
fn quoted_c_names(src: &str) -> BTreeSet<String> {
    src.match_indices("'kshana_")
        .filter_map(|(i, _)| {
            let rest = &src[i + 1..];
            let name: String = rest
                .chars()
                .take_while(|c| c.is_ascii_alphanumeric() || *c == '_')
                .collect();
            rest[name.len()..].starts_with('\'').then_some(name)
        })
        .filter(|s| s != "kshana_capi") // the library alias, not a function
        .collect()
}

#[test]
fn the_matlab_files_call_only_header_functions_and_the_package_reaches_all_five() {
    let declared = header_functions();
    let mut dirs = vec![
        here().join("sdk/matlab"),
        repo().join("docs/teaching/solutions"),
    ];
    let mut package_calls = BTreeSet::new();
    for dir in dirs.drain(..) {
        for f in m_files(&dir) {
            let src = read(&f);
            assert!(
                src.starts_with("% SPDX-License-Identifier: AGPL-3.0-only"),
                "{}: no SPDX line",
                f.display()
            );
            for name in quoted_c_names(&src) {
                assert!(
                    declared.contains(&name),
                    "{} calls {name}, which kshana.h does not declare",
                    f.display()
                );
                if f.components().any(|c| c.as_os_str() == "+kshana") {
                    package_calls.insert(name);
                }
            }
            // MATLAB runs the function whose name is the file's; a mismatch is a silent bug.
            let stem = f.file_stem().unwrap().to_str().unwrap();
            let first_fn = src
                .lines()
                .map(str::trim)
                .find(|l| l.starts_with("function "))
                .unwrap_or_else(|| panic!("{}: no function", f.display()));
            let name = first_fn
                .split('=')
                .next_back()
                .unwrap()
                .trim_start_matches("function ")
                .split('(')
                .next()
                .unwrap()
                .trim();
            assert_eq!(name, stem, "{}: defines {name}", f.display());
        }
    }
    assert_eq!(
        package_calls, declared,
        "the +kshana package should reach every function of kshana.h"
    );
}

#[test]
fn the_labview_guide_configures_every_header_function() {
    let guide = read(&here().join("sdk/labview/README.md"));
    for name in header_functions() {
        assert!(
            guide.contains(&format!("| `{name}` |")),
            "sdk/labview/README.md has no node row for {name}"
        );
    }
    let vis = read(&here().join("sdk/labview/VI-LIBRARY.md"));
    for name in header_functions() {
        if name != "kshana_version" {
            assert!(
                vis.contains(&format!("`{name}`")),
                "VI-LIBRARY.md never uses {name}"
            );
        }
    }
}

fn python() -> bool {
    let ok = Command::new("python3")
        .arg("--version")
        .output()
        .is_ok_and(|o| o.status.success());
    if !ok {
        assert!(
            std::env::var("KSHANA_REQUIRE_LANGS").as_deref() != Ok("1"),
            "python3 is required here but does not run"
        );
        eprintln!("skipped: python3 not available");
    }
    ok
}

/// This build's shared library (`cargo build` before `cargo test`, as for sdk_conformance.rs).
fn shared_lib() -> PathBuf {
    let exe = std::env::current_exe().unwrap();
    let dir = exe.parent().unwrap().parent().unwrap();
    let name = if cfg!(target_os = "macos") {
        "libkshana_capi.dylib"
    } else if cfg!(windows) {
        "kshana_capi.dll"
    } else {
        "libkshana_capi.so"
    };
    let p = dir.join(name);
    assert!(p.is_file(), "build the libraries first: `cargo build`");
    p
}

fn run_python(script: &Path, args: &[&Path]) -> String {
    let out = Command::new("python3")
        .args(["-I", "-B"])
        .arg(script)
        .args(args)
        .output()
        .unwrap();
    let text = String::from_utf8_lossy(&out.stdout).to_string();
    assert!(
        out.status.success(),
        "{}:\n{text}{}",
        script.display(),
        String::from_utf8_lossy(&out.stderr)
    );
    text
}

#[cfg(unix)]
#[test]
fn the_matlab_and_labview_call_sequences_work_on_the_library() {
    if !python() {
        return;
    }
    let text = run_python(
        &here().join("sdk/python/wrapper_patterns.py"),
        &[&shared_lib(), &repo()],
    );
    assert!(
        text.contains("wrapper call patterns: all checks passed"),
        "{text}"
    );
}

#[test]
fn the_teaching_lab_answers_match_the_engine() {
    if !python() {
        return;
    }
    let lib = shared_lib();
    for n in 1..=3 {
        let text = run_python(
            &repo().join(format!("docs/teaching/solutions/lab{n}.py")),
            &[&lib],
        );
        assert!(
            text.contains("worked answers match the engine") && !text.contains("FAIL"),
            "lab {n}: {text}"
        );
    }
}
