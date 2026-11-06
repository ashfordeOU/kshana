// SPDX-License-Identifier: AGPL-3.0-only
//! The adapter registry (A11): every adapter under `adapters/` passes (manifest, mapping, and its
//! conformance vector byte for byte), and a broken adapter is refused for the right reason.

use kshana::adapters::check;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

#[test]
fn every_registered_adapter_passes() {
    let entries = check(&root().join("adapters"));
    assert!(entries.len() >= 3);
    for e in &entries {
        assert!(e.ok(), "{}: {:?}", e.dir, e.problems);
    }
}

/// A scratch registry with one copy of the timing-monitor adapter, its files local to it.
/// A fresh, unique scratch folder.
fn fresh() -> PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-adapters-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

fn scratch() -> PathBuf {
    let d = fresh();
    let a = d.join("tm");
    std::fs::create_dir_all(&a).unwrap();
    for (from, to) in [
        ("examples/connect/timing-monitor.connect.toml", "map.toml"),
        ("examples/connect/timing-monitor.csv", "sample.csv"),
        ("examples/obs/station.toml", "station.toml"),
        (
            "conformance/connect/timing-monitor/expected.obs.jsonl",
            "expected.obs.jsonl",
        ),
    ] {
        std::fs::copy(root().join(from), a.join(to)).unwrap();
    }
    std::fs::write(
        a.join("vector.toml"),
        "name = \"tm\"\ninput = \"sample.csv\"\nmapping = \"map.toml\"\nstation = \"station.toml\"\nexpected = \"expected.obs.jsonl\"\n",
    )
    .unwrap();
    std::fs::write(
        a.join("adapter.toml"),
        "schema = \"kshana.adapter/1\"\nname = \"tm\"\ntitle = \"t\"\nkind = \"mapping\"\nmapping = \"map.toml\"\nvector = \"vector.toml\"\nmaintainer = \"m\"\nlicence = \"AGPL-3.0-only\"\nstatus = \"community\"\n",
    )
    .unwrap();
    d
}

fn problems(d: &Path) -> String {
    check(d)
        .iter()
        .flat_map(|e| e.problems.clone())
        .collect::<Vec<_>>()
        .join(" | ")
}

#[test]
fn broken_adapters_are_refused_for_the_right_reason() {
    let d = scratch();
    assert_eq!(problems(&d), "", "the scratch copy passes");
    let manifest = d.join("tm/adapter.toml");
    let good = std::fs::read_to_string(&manifest).unwrap();

    std::fs::write(
        &manifest,
        good.replace("kshana.adapter/1", "kshana.adapter/9"),
    )
    .unwrap();
    assert!(problems(&d).contains("kshana.adapter/9"));

    std::fs::write(
        &manifest,
        good.replace("status = \"community\"", "status = \"gold\""),
    )
    .unwrap();
    assert!(problems(&d).contains("gold"));

    std::fs::write(
        &manifest,
        good.replace("name = \"tm\"", "name = \"Bad Name\""),
    )
    .unwrap();
    assert!(problems(&d).contains("Bad Name"));

    // The vector must exercise this adapter's own mapping, not another file.
    std::fs::copy(d.join("tm/map.toml"), d.join("tm/other.toml")).unwrap();
    std::fs::write(
        &manifest,
        good.replace("mapping = \"map.toml\"", "mapping = \"other.toml\""),
    )
    .unwrap();
    assert!(
        problems(&d).contains("own mapping file"),
        "{}",
        problems(&d)
    );

    // A changed expected output is caught at its line.
    std::fs::write(&manifest, &good).unwrap();
    let exp = d.join("tm/expected.obs.jsonl");
    let text = std::fs::read_to_string(&exp).unwrap();
    std::fs::write(&exp, text.replacen("\"t_s\":0.0", "\"t_s\":0.5", 1)).unwrap();
    assert!(problems(&d).contains("line 2"), "{}", problems(&d));
    std::fs::write(&exp, &text).unwrap();

    // Two adapters with one name.
    let twin = d.join("twin");
    std::fs::create_dir_all(&twin).unwrap();
    for f in [
        "map.toml",
        "sample.csv",
        "station.toml",
        "expected.obs.jsonl",
        "vector.toml",
        "adapter.toml",
    ] {
        std::fs::copy(d.join("tm").join(f), twin.join(f)).unwrap();
    }
    assert!(
        problems(&d).contains("share the name tm"),
        "{}",
        problems(&d)
    );
    let _ = std::fs::remove_dir_all(&d);
}
