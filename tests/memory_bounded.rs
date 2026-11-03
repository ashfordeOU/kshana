// SPDX-License-Identifier: AGPL-3.0-only
//! Streaming IQ tracking holds a fixed amount of memory whatever the length of the recording
//! (roadmap L10b), and the governor refuses an in-memory `--json` over `KSHANA_MAX_MEMORY`.
//!
//! PIN-SCOPE:    peak resident memory of `kshana iq track --epochs --summary` on a 2 s and an 8 s
//!               synthetic recording (the 8 s run may not use more than 15 % + 8 MiB over the
//!               2 s run), and the up-front refusal of `--json` under a cap
//! PIN-EXCLUDES: absolute numbers (they depend on the build and the platform); the 7-day Station
//!               soak, which runs against the Station service

#![cfg(unix)]

use std::path::{Path, PathBuf};
use std::process::Command;

fn kshana() -> Command {
    Command::new(env!("CARGO_BIN_EXE_kshana"))
}

fn ok(mut c: Command) -> std::process::Output {
    let out = c.output().unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    out
}

/// The largest peak resident size of any child waited for so far, in bytes.
fn children_peak_rss() -> u64 {
    let mut u: libc::rusage = unsafe { std::mem::zeroed() };
    // SAFETY: `u` is a valid, writable rusage for getrusage to fill.
    assert_eq!(unsafe { libc::getrusage(libc::RUSAGE_CHILDREN, &mut u) }, 0);
    let v = u.ru_maxrss as u64;
    // Linux reports kilobytes, macOS bytes.
    if cfg!(target_os = "macos") {
        v
    } else {
        v * 1024
    }
}

fn scene(dir: &Path, name: &str, seconds: u32) -> PathBuf {
    let out = dir.join(name);
    let mut c = kshana();
    c.args(["iq", "scene"]).arg(&out).args([
        "--rate",
        "2046000",
        "--duration",
        &seconds.to_string(),
        "--signal",
        "gps-l1ca",
        "--prn",
        "3,7",
        "--doppler",
        "1000,-2000",
        "--cn0",
        "45",
        "--seed",
        "1",
        "--format",
        "sigmf",
    ]);
    ok(c);
    dir.join(format!("{name}.sigmf-meta"))
}

fn track_streaming(dir: &Path, rec: &Path, tag: &str) {
    let mut c = kshana();
    c.args(["iq", "track"]).arg(rec).args([
        "--signal",
        "gps-l1ca",
        "--prn",
        "3,7",
        "--epochs",
        &dir.join(format!("{tag}.epochs.csv")).to_string_lossy(),
        "--summary",
        &dir.join(format!("{tag}.summary.json")).to_string_lossy(),
    ]);
    ok(c);
}

#[test]
fn streaming_track_memory_does_not_grow_with_the_recording_and_json_is_capped() {
    let dir = std::env::temp_dir().join(format!("kshana-mem-{}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let short = scene(&dir, "short", 2);
    let long = scene(&dir, "long", 8);

    // getrusage(RUSAGE_CHILDREN) keeps the largest peak of any child so far, so the short run
    // goes first and the long run can only raise the figure.
    track_streaming(&dir, &short, "short");
    let after_short = children_peak_rss();
    track_streaming(&dir, &long, "long");
    let after_long = children_peak_rss();
    let allowed = after_short + after_short * 15 / 100 + (8 << 20);
    assert!(
        after_long <= allowed,
        "peak memory grew with the recording: {} MiB on 2 s, {} MiB on 8 s",
        after_short >> 20,
        after_long >> 20
    );

    // 8 s of two GPS L1 C/A channels is 16 000 epochs, about 94 MiB held by --json: refused
    // under a 32 MiB cap before any tracking, with the streaming option named.
    let out = kshana()
        .args(["iq", "track"])
        .arg(&long)
        .args(["--signal", "gps-l1ca", "--prn", "3,7", "--json"])
        .arg(dir.join("long.json"))
        .env("KSHANA_MAX_MEMORY", "32M")
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert!(!out.status.success());
    let err = String::from_utf8_lossy(&out.stderr);
    assert!(
        err.contains("KSHANA_MAX_MEMORY") && err.contains("--epochs"),
        "{err}"
    );
    assert!(!dir.join("long.json").exists());

    let _ = std::fs::remove_dir_all(&dir);
}
