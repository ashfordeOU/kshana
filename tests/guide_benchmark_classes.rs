// SPDX-License-Identifier: AGPL-3.0-only
//! The task (e) benchmark guide (A8b, `docs/guides/BENCHMARK-CLASSES.md`) is a script: every `sh`
//! block marked `<!-- guide-run -->` is run as written, in order, with this build's `kshana` first on
//! the PATH, in a scratch folder that sees `tests/fixtures/bench_e` as `bench_e`. The result it writes
//! must validate, and its metrics must be the independent numpy scorer's (`e1_oracle.json`), with the
//! entered classes the guide states.

use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn steps(guide: &str) -> Vec<String> {
    let mut out = Vec::new();
    let mut lines = guide.lines();
    while let Some(l) = lines.next() {
        if l.trim() != "<!-- guide-run -->" {
            continue;
        }
        assert_eq!(lines.next().map(str::trim), Some("```sh"));
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
fn the_guide_runs_as_written_and_its_score_is_the_oracles() {
    let guide = std::fs::read_to_string(root().join("docs/guides/BENCHMARK-CLASSES.md")).unwrap();
    let blocks = steps(&guide);
    assert_eq!(blocks.len(), 3, "three runnable steps");
    let work: PathBuf = std::env::temp_dir().join(format!(
        "kshana-guide-bench-e-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&work);
    std::fs::create_dir_all(&work).unwrap();
    std::os::unix::fs::symlink(root().join("tests/fixtures/bench_e"), work.join("bench_e"))
        .unwrap();
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
    assert!(
        printed.contains("four-class interference labelling"),
        "step 1 shows task e"
    );
    assert!(printed.contains("valid"), "step 4 validates:\n{printed}");
    let r: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(work.join("scored/result.result.json")).unwrap(),
    )
    .unwrap();
    let want: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(root().join("tests/fixtures/bench_e/e1_oracle.json")).unwrap(),
    )
    .unwrap();
    let m = &r["metrics"];
    assert_eq!(m["confusion"], want["confusion"]);
    assert_eq!(
        m["entered"],
        serde_json::json!(["nominal", "spoofing", "meaconing"])
    );
    assert!(
        guide.contains("On the example files, `entered` is `nominal`, `spoofing` and `meaconing`")
    );
    for k in ["balanced_accuracy", "macro_f1"] {
        let (a, b) = (m[k].as_f64().unwrap(), want[k].as_f64().unwrap());
        assert!((a - b).abs() <= 1e-12, "{k}: {a} vs {b}");
    }
    assert_eq!(r["spec_version"], "kshana-bench/2.1.0");
    let _ = std::fs::remove_dir_all(&work);
}
