// SPDX-License-Identifier: AGPL-3.0-only
//! A stated `schema_version` changes nothing about a run, a newer version is refused, and
//! `kshana scenario migrate` adds the line and round-trips.
//!
//! PIN-SCOPE:    the result JSON, CSV and summary of a bundled scenario with and without
//!               `schema_version = 1`; the refusal of a newer version; the CLI `scenario version`
//!               and `scenario migrate` output
//! PIN-EXCLUDES: future migration steps (version 1 is the first)

use std::process::Command;

fn bundled() -> String {
    std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/scenarios/aocs-slew.toml"
    ))
    .unwrap()
}

#[test]
fn stated_version_runs_byte_identically() {
    let plain = bundled();
    let stated = kshana::scenario_version::migrate(&plain).unwrap();
    assert!(stated.changed);
    let a = kshana::api::run_toml(&plain).unwrap();
    let b = kshana::api::run_toml(&stated.source).unwrap();
    assert_eq!(a.json, b.json);
    assert_eq!(a.csv, b.csv);
    assert_eq!(a.summary, b.summary);
}

#[test]
fn newer_version_is_refused_naming_both() {
    let src = format!("schema_version = 99\n{}", bundled());
    let e = kshana::api::run_toml(&src).unwrap_err();
    assert!(
        e.contains("99") && e.contains(&kshana::scenario_version::CURRENT.to_string()),
        "{e}"
    );
}

fn cli(args: &[&str]) -> (i32, String, String) {
    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .output()
        .unwrap();
    (
        out.status.code().unwrap_or(-1),
        String::from_utf8_lossy(&out.stdout).into_owned(),
        String::from_utf8_lossy(&out.stderr).into_owned(),
    )
}

#[test]
fn cli_version_and_migrate() {
    let (code, out, _) = cli(&["scenario", "version"]);
    assert_eq!(code, 0);
    assert_eq!(out.trim(), kshana::scenario_version::CURRENT.to_string());

    let path = concat!(env!("CARGO_MANIFEST_DIR"), "/scenarios/aocs-slew.toml");
    let (code, out, _) = cli(&["scenario", "migrate", path]);
    assert_eq!(code, 0);
    assert!(out.contains("schema_version = 1\n"));
    assert_eq!(kshana::scenario_version::strip(&out).unwrap(), bundled());

    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!(
        "kshana-scenario-version-{}-{seq}",
        std::process::id()
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let f = dir.join("s.toml");
    std::fs::write(&f, bundled()).unwrap();
    let fs = f.to_str().unwrap();
    assert_eq!(cli(&["scenario", "migrate", fs, "--in-place"]).0, 0);
    let once = std::fs::read_to_string(&f).unwrap();
    let (code, _, err) = cli(&["scenario", "migrate", fs, "--in-place"]);
    assert_eq!(code, 0);
    assert!(err.contains("unchanged"), "{err}");
    assert_eq!(std::fs::read_to_string(&f).unwrap(), once);
    let _ = std::fs::remove_dir_all(&dir);

    assert_eq!(cli(&["scenario"]).0, 2);
    assert_eq!(cli(&["scenario", "migrate"]).0, 2);
}
