// SPDX-License-Identifier: AGPL-3.0-only
//! The monitoring-station guide (A8a, `docs/guides/MONITORING-STATION.md`) is a script: every `sh`
//! block marked `<!-- guide-run -->` is run as written, in order, with this build's `kshana` first on
//! the PATH, in a scratch folder that sees the repository's `examples/`. The results the guide states
//! are then checked: the alarm at 120 s, two CAP messages (an Alert, then an all-clear Update) and the
//! epoch counts.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

/// The guide's runnable blocks, in order.
fn steps(guide: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut lines = guide.lines();
    while let Some(l) = lines.next() {
        if l.trim() != "<!-- guide-run -->" {
            continue;
        }
        assert_eq!(
            lines.next().map(str::trim),
            Some("```sh"),
            "a guide-run marker is followed by a sh block"
        );
        let mut block = String::new();
        for b in lines.by_ref() {
            if b.trim() == "```" {
                break;
            }
            block.push_str(b);
            block.push('\n');
        }
        out.push(block);
    }
    out
}

#[cfg(unix)]
#[test]
fn the_guide_runs_as_written_and_says_what_happens() {
    let guide = std::fs::read_to_string(root().join("docs/guides/MONITORING-STATION.md")).unwrap();
    let blocks = steps(&guide);
    assert_eq!(blocks.len(), 3, "three runnable steps");

    let work: PathBuf = std::env::temp_dir().join(format!(
        "kshana-guide-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&work).unwrap();
    std::os::unix::fs::symlink(root().join("examples"), work.join("examples")).unwrap();
    let bin_dir = Path::new(env!("CARGO_BIN_EXE_kshana"))
        .parent()
        .unwrap()
        .to_path_buf();
    let path = format!(
        "{}:{}",
        bin_dir.display(),
        std::env::var("PATH").unwrap_or_default()
    );

    let mut printed = String::new();
    for (i, b) in blocks.iter().enumerate() {
        let out = Command::new("sh")
            .arg("-eu")
            .arg("-c")
            .arg(b)
            .current_dir(&work)
            .env("PATH", &path)
            .env("KSHANA_LANG", "en")
            .output()
            .unwrap();
        let text = format!(
            "{}{}",
            String::from_utf8_lossy(&out.stdout),
            String::from_utf8_lossy(&out.stderr)
        );
        assert!(out.status.success(), "step {} failed:\n{b}\n{text}", i + 1);
        printed.push_str(&text);
    }

    // Step 2's summary line, as quoted in the guide (after its leading "... |").
    let quoted = "monitors 3 | first alarm at 120.0 s; untrusted for 120 and degraded for 0 of 240 epochs after calibration; 1 of 1 stated events detected within 10 s; 1 of 1 C/N0 predictions within 3 dB";
    assert!(guide.contains(quoted), "the guide quotes the summary");
    assert!(
        printed.contains(quoted),
        "the summary is as quoted:\n{printed}"
    );
    for f in [
        "obs.jsonl",
        "session.result.json",
        "session.trust.csv",
        "session.trust.svg",
    ] {
        assert!(work.join("station").join(f).is_file(), "{f}");
    }

    // Step 3: two messages, an Alert and then the all-clear Update that references it.
    let mut alerts: Vec<String> = std::fs::read_dir(work.join("station/alerts"))
        .unwrap()
        .map(|e| std::fs::read_to_string(e.unwrap().path()).unwrap())
        .collect();
    alerts.sort_by_key(|a| a.contains("<msgType>Update</msgType>"));
    assert_eq!(alerts.len(), 2);
    assert!(
        alerts[0].contains("<msgType>Alert</msgType>")
            && alerts[0].contains("<urgency>Immediate</urgency>")
    );
    assert!(
        alerts[0].contains("<severity>Severe</severity>")
            && alerts[0].contains("<status>Exercise</status>")
    );
    assert!(alerts[1].contains("<urgency>Past</urgency>") && alerts[1].contains("<references>"));
    for (band, n) in [("calibrating", 60), ("nominal", 120), ("untrusted", 120)] {
        assert!(
            printed.contains(&format!("kshana_trust_epochs_total{{band=\"{band}\"}} {n}")),
            "{band} {n}"
        );
    }
    let _ = std::fs::remove_dir_all(&work);
}
