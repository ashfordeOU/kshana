//! Whole-catalogue scenario-output manifest: the before/after proof for refactors that
//! must not move any output (FUT-27, the `Scenario`-trait migration).
//!
//! The test runs [`kshana::api::run_toml`] on every scenario TOML in the repository
//! (`scenarios/`, `examples/`, `web/`, `docs/`, `tests/`) and writes one line per file:
//! the path, then the SHA-256 of the JSON, the SVG, the summary and the CSV, or, for a
//! run that fails, the SHA-256 of the error text. Running it on the base commit and on
//! the refactored commit and diffing the two manifests shows whether any output moved,
//! byte for byte, on this platform. It is `#[ignore]`d because it runs the whole
//! catalogue; run it with
//!
//! ```text
//! KSHANA_MANIFEST_OUT=/path/manifest.tsv cargo test --release \
//!     --test scenario_output_manifest -- --ignored --nocapture
//! ```
//!
//! PIN-SCOPE:    nothing is pinned in this file. It writes a manifest; the comparison is
//!               the diff of two manifests produced on the same machine, which covers
//!               every byte of every output (JSON, SVG, summary, CSV) and every error
//!               string of every scenario TOML in the listed directories.
//! PIN-EXCLUDES: TOML files outside the listed directories; outputs that depend on the
//!               environment (a scenario that reads a file absent from the checkout
//!               records its error, which compares equal only if both runs see the same
//!               files); and cross-platform float differences, since both manifests are
//!               produced on one machine.

use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};

fn sha(s: &str) -> String {
    let d = Sha256::digest(s.as_bytes());
    d.iter().map(|b| format!("{b:02x}")).collect()
}

fn collect(dir: &Path, out: &mut Vec<PathBuf>) {
    let Ok(rd) = std::fs::read_dir(dir) else {
        return;
    };
    let mut entries: Vec<_> = rd.flatten().map(|e| e.path()).collect();
    entries.sort();
    for p in entries {
        let name = p.file_name().and_then(|n| n.to_str()).unwrap_or("");
        if p.is_dir() {
            if name != "node_modules" && name != "target" {
                collect(&p, out);
            }
        } else if name.ends_with(".toml") && name != "Cargo.toml" {
            out.push(p);
        }
    }
}

fn line_for(root: &Path, path: &Path) -> String {
    let rel = path
        .strip_prefix(root)
        .unwrap_or(path)
        .display()
        .to_string();
    let Ok(src) = std::fs::read_to_string(path) else {
        return format!("{rel}\tUNREADABLE");
    };
    let run = std::panic::catch_unwind(|| kshana::api::run_toml(&src));
    let Ok(run) = run else {
        return format!("{rel}\tPANIC");
    };
    match run {
        Ok(o) => format!(
            "{rel}\tOK\t{}\t{}\t{}\t{}",
            sha(&o.json),
            sha(&o.svg),
            sha(&o.summary),
            o.csv.as_deref().map_or_else(|| "-".to_string(), sha)
        ),
        Err(e) => format!("{rel}\tERR\t{}", sha(&e)),
    }
}

#[test]
#[ignore = "runs the whole scenario catalogue; set KSHANA_MANIFEST_OUT"]
fn write_scenario_output_manifest() {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR"));
    let mut files = Vec::new();
    for d in ["scenarios", "examples", "web", "docs", "tests"] {
        collect(&root.join(d), &mut files);
    }
    let threads = std::thread::available_parallelism().map_or(2, |n| n.get());
    let chunks: Vec<Vec<PathBuf>> = (0..threads)
        .map(|i| files.iter().skip(i).step_by(threads).cloned().collect())
        .collect();
    let mut lines: Vec<String> = std::thread::scope(|s| {
        let handles: Vec<_> = chunks
            .iter()
            .map(|chunk| {
                let root = &root;
                s.spawn(move || chunk.iter().map(|p| line_for(root, p)).collect::<Vec<_>>())
            })
            .collect();
        handles
            .into_iter()
            .flat_map(|h| h.join().expect("manifest worker panicked"))
            .collect()
    });
    lines.sort();
    let body = lines.join("\n") + "\n";
    let ok = lines.iter().filter(|l| l.contains("\tOK\t")).count();
    eprintln!("{} scenario files, {ok} ran", lines.len());
    if let Ok(out) = std::env::var("KSHANA_MANIFEST_OUT") {
        std::fs::write(&out, body).expect("write manifest");
        eprintln!("manifest written to {out}");
    } else {
        print!("{body}");
    }
}
