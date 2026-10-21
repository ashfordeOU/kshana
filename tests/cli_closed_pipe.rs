// SPDX-License-Identifier: AGPL-3.0-only
//! A closed stdout ends the CLI quietly: `kshana kinds | head -1` used to panic with
//! "failed printing to stdout: Broken pipe". The exit status is 141 (128 + SIGPIPE, as for
//! `yes | head`), nothing is printed on stderr about it, and any other write failure still
//! panics.
//!
//! The reader is gone before the child starts: the test makes the pipe, drops its read end
//! and hands the write end to the child as stdout, so the child's first write fails with
//! EPIPE every time, not only when a reader happens to close early. (A short output that the
//! pipe buffer absorbs before the reader leaves would pass without exercising the fix.)

use std::io::Read;
use std::process::{Command, Stdio};

/// Run `kshana <args>` with its stdout pipe already closed at the far end; return
/// (exit code, stderr).
// `std::io::pipe` is 1.87; the crate's MSRV (1.85) is for building the library and binary, which
// this test does not touch, and the tests run on the pinned toolchain (rust-toolchain.toml).
#[allow(clippy::incompatible_msrv)]
fn run_into_a_closed_pipe(args: &[&str]) -> (Option<i32>, String) {
    let (reader, writer) = std::io::pipe().expect("make a pipe");
    drop(reader);
    let mut child = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .stdout(Stdio::from(writer))
        .stderr(Stdio::piped())
        .spawn()
        .expect("spawn kshana");
    let mut err = String::new();
    child
        .stderr
        .take()
        .unwrap()
        .read_to_string(&mut err)
        .expect("read stderr");
    (child.wait().expect("wait").code(), err)
}

#[cfg(unix)]
#[test]
fn commands_that_print_exit_141_quietly_when_stdout_is_closed() {
    for args in [
        &["kinds"][..],
        &["kinds", "--json"][..],
        &["example"][..],
        &["example", "clock-holdover"][..],
        &["--help"][..],
        &["--version"][..],
    ] {
        let (code, err) = run_into_a_closed_pipe(args);
        assert!(!err.contains("panicked"), "{args:?}: {err}");
        assert!(!err.contains("Broken pipe"), "{args:?}: {err}");
        assert_eq!(code, Some(141), "{args:?}: stderr: {err}");
    }
}

#[cfg(unix)]
#[test]
fn a_scenario_run_into_a_closed_pipe_is_quiet_too() {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("scenarios");
    let scenario = dir.join("clock-holdover.toml");
    let path = if scenario.exists() {
        scenario
    } else {
        std::fs::read_dir(&dir)
            .expect("scenarios dir")
            .filter_map(|e| e.ok().map(|e| e.path()))
            .find(|p| p.extension().is_some_and(|x| x == "toml"))
            .expect("a scenario file")
    };
    let (code, err) = run_into_a_closed_pipe(&[path.to_str().unwrap()]);
    assert!(!err.contains("panicked"), "{err}");
    assert!(!err.contains("Broken pipe"), "{err}");
    assert_eq!(code, Some(141), "stderr: {err}");
}

#[test]
fn only_a_closed_pipe_is_swallowed() {
    // The rule lives in src/main.rs (a binary: not importable). Pin its shape: it matches the
    // std print-failure prefix AND a closed-pipe error, so a full disk still panics.
    let src = include_str!("../src/main.rs");
    assert!(src.contains("msg.starts_with(\"failed printing to stdout\")"));
    assert!(src.contains("msg.contains(\"Broken pipe\")"));
    assert!(src.contains("const EXIT_CLOSED_PIPE: i32 = 141;"));
}
