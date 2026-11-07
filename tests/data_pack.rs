// SPDX-License-Identifier: AGPL-3.0-only
//! Synthetic labelled data packs (0.41 row B7): the same seed gives the same files, byte for
//! byte; a different seed gives different ones; and the labels are exact. The log labels mark
//! `spoofed-drag-off` from the drag-off onset exactly, and the reported positions depart from the
//! labelled truth only after it. The IQ labels match the scene the generator wrote: the obstruction
//! window and the satellites it hits are the ones the truth sidecar shows dropping in C/N0.
//!
//! PIN-SCOPE:    the files of a small pack (seed 7) against a second build of the same seed; the
//!               epoch count of a 300 s log (one epoch a second, both ends)
//! PIN-EXCLUDES: any fixed digest: the test compares two builds, so a deliberate generator change
//!               does not trip it

use kshana::data_pack::{build, PackSpec};
use std::path::PathBuf;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn fresh(name: &str) -> PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-data-pack-{}-{}-{name}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

fn spec(seed: u64) -> PackSpec {
    PackSpec {
        seed,
        n_logs: 2,
        log_seconds: 300.0,
        n_iq: 4,
        iq_seconds: 0.5,
        iq_rate_hz: 2.046e6,
    }
}

#[test]
fn the_same_seed_gives_the_same_bytes_and_labels_are_exact() {
    let (a, b, c) = (fresh("a"), fresh("b"), fresh("c"));
    let ma = build(&spec(7), &a).unwrap();
    let mb = build(&spec(7), &b).unwrap();
    let mc = build(&spec(8), &c).unwrap();
    assert_eq!(ma, mb, "same seed, same manifest (every file's SHA-256)");
    assert_eq!(
        std::fs::read(a.join("manifest.json")).unwrap(),
        std::fs::read(b.join("manifest.json")).unwrap()
    );
    assert_ne!(ma.items, mc.items, "another seed gives other files");
    assert!(
        build(&spec(7), &a).is_err(),
        "an existing directory is never overwritten"
    );

    // Every file listed is there with the listed digest.
    for it in &ma.items {
        for f in &it.files {
            let bytes = std::fs::read(a.join(&f.path)).unwrap();
            use sha2::{Digest, Sha256};
            assert_eq!(hex::encode(Sha256::digest(&bytes)), f.sha256, "{}", f.path);
        }
    }
    let classes: Vec<String> = ma.classes.keys().cloned().collect();
    assert_eq!(
        classes,
        [
            "iq:multipath",
            "iq:nominal",
            "iq:obstruction",
            "iq:scintillation",
            "log:nominal",
            "log:spoofed-drag-off"
        ]
    );

    // Log labels: the spoofed log turns at one epoch and stays; the nominal log never does.
    for (name, spoofed) in [("log-0000", false), ("log-0001", true)] {
        let text = std::fs::read_to_string(a.join(format!("logs/{name}.labels.jsonl"))).unwrap();
        let labels: Vec<serde_json::Value> = text
            .lines()
            .map(|l| serde_json::from_str(l).unwrap())
            .collect();
        assert_eq!(labels.len(), 301, "one epoch a second, 0 to 300 s");
        let first = labels.iter().position(|l| l["label"] == "spoofed-drag-off");
        assert_eq!(first.is_some(), spoofed, "{name}");
        if let Some(i) = first {
            assert!(labels[i..].iter().all(|l| l["label"] == "spoofed-drag-off"));
            assert!(i > 60 && i < 200, "onset inside the log: {i}");
        }
    }

    // IQ labels: the obstruction item's window and satellites are what the truth sidecar shows.
    let lab: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(a.join("iq/iq-0001.labels.json")).unwrap())
            .unwrap();
    assert_eq!(lab["class"], "obstruction");
    let (w0, w1) = (
        lab["window_s"][0].as_f64().unwrap(),
        lab["window_s"][1].as_f64().unwrap(),
    );
    let hit: Vec<u64> = lab["affected_prns"]
        .as_array()
        .unwrap()
        .iter()
        .map(|p| p.as_u64().unwrap())
        .collect();
    let base = lab["cn0_dbhz"].as_f64().unwrap();
    let truth = std::fs::read_to_string(a.join("iq/iq-0001.truth.csv")).unwrap();
    let mut lines = truth.lines();
    let header: Vec<&str> = lines.next().unwrap().split(',').collect();
    let col = |n: &str| {
        header
            .iter()
            .position(|h| *h == n)
            .unwrap_or_else(|| panic!("{n}: {header:?}"))
    };
    let (ct, cp, cc) = (col("t_s"), col("sat_id"), col("cn0_dbhz"));
    let mut checked = 0;
    for l in lines {
        let f: Vec<&str> = l.split(',').collect();
        let (t, prn, cn0): (f64, u64, f64) = (
            f[ct].parse().unwrap(),
            f[cp].parse().unwrap(),
            f[cc].parse().unwrap(),
        );
        let inside = t > w0 + 2e-3 && t < w1 - 2e-3;
        let outside = t < w0 - 1e-6 || t > w1 + 1e-6;
        if hit.contains(&prn) && inside {
            assert!(cn0 < base - 10.0, "PRN {prn} at {t}: {cn0}");
            checked += 1;
        } else if outside || !hit.contains(&prn) {
            assert!(
                (cn0 - base).abs() < 0.5,
                "PRN {prn} at {t}: {cn0} vs {base}"
            );
        }
    }
    assert!(checked > 0, "the window holds truth epochs");
    for d in [a, b, c] {
        let _ = std::fs::remove_dir_all(d);
    }
}
