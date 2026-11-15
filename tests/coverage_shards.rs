//! The coverage job runs in shards (`.github/workflows/ci.yml`, job `coverage-shard`), because one
//! instrumented run of the whole suite passed GitHub's 360-minute limit for hosted runners. This
//! test holds the shards to the unsharded run: every integration test (`tests/*.rs`) is in exactly
//! one shard, the workflow lists every shard `scripts/coverage-shard.py` can make, and the library
//! and binary unit tests have their own shard. Nothing is skipped by the split.

use std::collections::BTreeSet;
use std::path::{Path, PathBuf};
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn shard_args(args: &[&str]) -> String {
    let out = Command::new("python3")
        .arg(root().join("scripts/coverage-shard.py"))
        .args(args)
        .output()
        .expect("python3 runs scripts/coverage-shard.py");
    assert!(
        out.status.success(),
        "coverage-shard.py {args:?}: {}",
        String::from_utf8_lossy(&out.stderr)
    );
    String::from_utf8(out.stdout)
        .expect("utf-8")
        .trim()
        .to_string()
}

fn integration_tests(dir: &Path) -> BTreeSet<String> {
    std::fs::read_dir(dir)
        .expect("tests/ reads")
        .filter_map(|e| {
            let p = e.ok()?.path();
            (p.extension()? == "rs").then(|| p.file_stem()?.to_str().map(str::to_string))?
        })
        .collect()
}

/// The `args` of each `coverage-shard` matrix entry, read from the workflow.
fn matrix_args() -> Vec<String> {
    let ci =
        std::fs::read_to_string(root().join(".github/workflows/ci.yml")).expect("ci.yml reads");
    let start = ci
        .find("\n  coverage-shard:")
        .expect("ci.yml has a coverage-shard job");
    let end = ci[start + 1..]
        .find("\n  coverage:")
        .map_or(ci.len(), |i| start + 1 + i);
    ci[start..end]
        .lines()
        .filter_map(|l| {
            let i = l.find("args: \"")? + 7;
            let j = l[i..].find('"')?;
            Some(l[i..i + j].to_string())
        })
        .collect()
}

#[test]
fn every_integration_test_is_in_exactly_one_coverage_shard() {
    let args = matrix_args();
    assert!(
        args.iter().any(|a| a == "lib"),
        "no shard runs the library and binary unit tests: {args:?}"
    );
    assert_eq!(shard_args(&["lib"]), "--lib --bins");
    let groups: Vec<(usize, usize)> = args
        .iter()
        .filter(|a| *a != "lib")
        .map(|a| {
            let mut it = a
                .split_whitespace()
                .map(|x| x.parse::<usize>().expect("shard numbers"));
            (it.next().expect("k"), it.next().expect("n"))
        })
        .collect();
    let n = groups
        .first()
        .expect("at least one integration-test shard")
        .1;
    let ks: BTreeSet<usize> = groups
        .iter()
        .map(|&(k, m)| {
            assert_eq!(
                m, n,
                "every integration-test shard divides by the same count: {groups:?}"
            );
            k
        })
        .collect();
    assert_eq!(
        ks,
        (0..n).collect::<BTreeSet<_>>(),
        "the workflow must list every shard 0..{n}: {groups:?}"
    );

    let all = integration_tests(&root().join("tests"));
    let mut seen = BTreeSet::new();
    for k in 0..n {
        for tok in shard_args(&[&k.to_string(), &n.to_string()])
            .split_whitespace()
            .filter(|t| *t != "--test")
        {
            assert!(
                seen.insert(tok.to_string()),
                "{tok} is in two coverage shards"
            );
        }
    }
    let missing: Vec<_> = all.difference(&seen).collect();
    let extra: Vec<_> = seen.difference(&all).collect();
    assert!(
        missing.is_empty(),
        "integration tests in no coverage shard: {missing:?}"
    );
    assert!(
        extra.is_empty(),
        "coverage shards name tests that do not exist: {extra:?}"
    );
}
