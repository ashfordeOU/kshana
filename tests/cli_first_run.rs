// SPDX-License-Identifier: AGPL-3.0-only
//! The first minute with the command-line interface (CLI), as a registry user meets it.
//!
//! A `cargo install kshana` user has the executable and no `scenarios/` directory. Every
//! quickstart used to point at a scenario file only a clone of the repository has, so the
//! first command failed. These tests hold the answers to the first things such a user
//! types: `--help`, `--version`, a mistyped option, `kshana example`, a run of the scenario
//! it writes, and `--validate` on it.
//!
//! The bundled table is held to `scenarios/` in both directions: every scenario file is
//! either bundled byte for byte or refused with its reason, and nothing else is bundled.

use std::process::{Command, Output};

fn bin() -> &'static str {
    env!("CARGO_BIN_EXE_kshana")
}

fn kshana(args: &[&str]) -> Output {
    Command::new(bin())
        .args(args)
        .output()
        .expect("run kshana binary")
}

fn stdout(o: &Output) -> String {
    String::from_utf8(o.stdout.clone()).expect("stdout is UTF-8")
}

fn stderr(o: &Output) -> String {
    String::from_utf8(o.stderr.clone()).expect("stderr is UTF-8")
}

/// Per-call working directory under the system temp dir.
///
/// The sequence is what makes it unique, not the pid: every test in this binary runs as a
/// thread of ONE process and shares the pid, so a pid-keyed name separates concurrent
/// `cargo test` processes and nothing inside one. Enforced by `tests/source_guards.rs`.
fn temp_workdir(label: &str) -> std::path::PathBuf {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-{label}-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    dir
}

/// Scenario files that need data shipped with the repository only. Each must be refused by
/// `kshana example` with a reason rather than bundled.
const REPO_ONLY: &[&str] = &["lunar-llr-datum"];

fn scenario_stems() -> Vec<String> {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("scenarios");
    let mut stems: Vec<String> = std::fs::read_dir(&dir)
        .expect("read scenarios/")
        .map(|e| e.unwrap().file_name().to_string_lossy().into_owned())
        .filter_map(|n| n.strip_suffix(".toml").map(str::to_string))
        .collect();
    stems.sort();
    stems
}

#[test]
fn help_and_version_answer_and_exit_zero() {
    for flag in ["--help", "-h", "help"] {
        let o = kshana(&[flag]);
        assert!(o.status.success(), "{flag} exited {:?}", o.status.code());
        let out = stdout(&o);
        assert!(
            out.starts_with("usage: kshana <scenario.toml>"),
            "{flag}: {out}"
        );
        assert!(out.contains("kshana example [<name>]"), "{flag}: {out}");
    }
    for flag in ["--version", "-V"] {
        let o = kshana(&[flag]);
        assert!(o.status.success(), "{flag} exited {:?}", o.status.code());
        assert_eq!(
            stdout(&o).trim(),
            format!("kshana {}", env!("CARGO_PKG_VERSION"))
        );
    }
}

#[test]
fn unknown_options_and_extra_arguments_fail_with_a_message() {
    let o = kshana(&["--exprot-sp3", "out.sp3", "s.toml"]);
    assert_eq!(o.status.code(), Some(2));
    let err = stderr(&o);
    assert!(err.contains("unknown option '--exprot-sp3'"), "{err}");
    assert!(err.contains("usage: kshana"), "{err}");

    let o = kshana(&["a.toml", "b.toml"]);
    assert_eq!(o.status.code(), Some(2));
    let err = stderr(&o);
    assert!(err.contains("unexpected argument 'b.toml'"), "{err}");
    assert!(err.contains("usage: kshana"), "{err}");

    let o = kshana(&["example", "clock-holdover", "extra"]);
    assert_eq!(o.status.code(), Some(2));
    assert!(stderr(&o).contains("unexpected argument 'extra'"));
}

#[test]
fn a_missing_scenario_file_points_at_kshana_example() {
    let dir = temp_workdir("missing");
    let missing = dir.join("clock-holdover.toml");
    let o = kshana(&[missing.to_str().unwrap()]);
    assert!(!o.status.success());
    let err = stderr(&o);
    assert!(err.contains("cannot read"), "{err}");
    assert!(err.contains("kshana example"), "{err}");
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn every_scenario_file_is_bundled_byte_for_byte_or_refused_with_a_reason() {
    let stems = scenario_stems();
    assert!(
        stems.len() > 50,
        "found only {} scenario files",
        stems.len()
    );

    let listing = kshana(&["example"]);
    assert!(listing.status.success());
    let listed: Vec<String> = stdout(&listing).lines().map(str::to_string).collect();
    let expected: Vec<String> = stems
        .iter()
        .filter(|s| !REPO_ONLY.contains(&s.as_str()))
        .cloned()
        .collect();
    assert_eq!(
        listed, expected,
        "`kshana example` must list exactly the scenario files that run on their own; \
         add the new file to src/bundled_scenarios.rs (or to its REPO_ONLY table)"
    );

    let root = std::path::Path::new(env!("CARGO_MANIFEST_DIR"));
    for stem in &expected {
        let o = kshana(&["example", stem]);
        assert!(o.status.success(), "kshana example {stem} failed");
        let file = std::fs::read(root.join("scenarios").join(format!("{stem}.toml"))).unwrap();
        assert!(
            o.stdout == file,
            "kshana example {stem} is not byte-identical to scenarios/{stem}.toml"
        );
    }
    // A trailing `.toml` names the same scenario.
    let o = kshana(&["example", "clock-holdover.toml"]);
    assert!(o.status.success());
    assert_eq!(stdout(&o), include_str!("../scenarios/clock-holdover.toml"));

    for stem in REPO_ONLY {
        assert!(
            stems.iter().any(|s| s == stem),
            "{stem} is listed as repo-only but no scenarios/{stem}.toml exists"
        );
        let o = kshana(&["example", stem]);
        assert_eq!(o.status.code(), Some(2), "kshana example {stem}");
        let err = stderr(&o);
        assert!(
            err.contains("not bundled") && err.contains("repository"),
            "kshana example {stem} must say why it is repo-only: {err}"
        );
    }

    let o = kshana(&["example", "no-such-scenario"]);
    assert_eq!(o.status.code(), Some(2));
    assert!(stderr(&o).contains("no bundled scenario named 'no-such-scenario'"));
}

#[test]
fn the_quickstart_runs_as_written_from_an_empty_directory() {
    // kshana example clock-holdover > clock-holdover.toml
    // kshana clock-holdover.toml
    // kshana --validate clock-holdover.toml
    let dir = temp_workdir("quickstart");
    let o = kshana(&["example", "clock-holdover"]);
    assert!(o.status.success());
    let scn = dir.join("clock-holdover.toml");
    std::fs::write(&scn, &o.stdout).unwrap();

    let run = kshana(&[scn.to_str().unwrap()]);
    assert!(run.status.success(), "run failed: {}", stderr(&run));
    for ext in ["result.json", "chart.svg", "report.html"] {
        let p = dir.join(format!("clock-holdover.{ext}"));
        assert!(p.exists(), "expected {}", p.display());
    }

    let v = kshana(&["--validate", scn.to_str().unwrap()]);
    assert!(v.status.success(), "validate failed: {}", stderr(&v));
    let out = stdout(&v);
    assert_eq!(
        out.lines().count(),
        1,
        "--validate prints one line on success: {out}"
    );
    assert!(out.starts_with("ok: clock"), "{out}");
    std::fs::remove_dir_all(&dir).ok();
}
