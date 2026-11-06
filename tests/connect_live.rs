// SPDX-License-Identifier: AGPL-3.0-only
//! Live conformance kit (A7b): every streamable Connect vector passes over MQTT (with one forced
//! reconnection), WebSocket and the directory watch; a vector whose expected output is wrong fails on
//! every path, at the epoch that differs.

use kshana::connect::find_vectors;
use kshana::connect_live::{check_vector, LATENCY_BAR_MS};
use std::path::Path;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn scratch() -> std::path::PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-live-test-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

#[test]
fn every_streamable_vector_passes_on_every_live_path() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("conformance/connect");
    let mut replayed = 0;
    for v in find_vectors(&root) {
        let r = check_vector(&v, &scratch()).unwrap();
        if r.skipped.is_some() {
            assert!(r.paths.is_empty());
            continue;
        }
        replayed += 1;
        let names: Vec<_> = r.paths.iter().map(|p| p.path).collect();
        assert_eq!(names, ["mqtt", "ws", "watch"]);
        for p in &r.paths {
            assert!(p.pass, "{}: {p:?}", r.name);
            assert_eq!(p.epochs_produced, p.epochs_expected);
            assert_eq!(p.released_at_end, 1);
            assert!(p.latency_ms[1] <= LATENCY_BAR_MS);
        }
        assert_eq!(
            r.paths[0].reconnects, 1,
            "the broker drops the line half-way"
        );
    }
    assert!(replayed >= 2, "android-raw and timing-monitor are replayed");
}

#[test]
fn a_wrong_expectation_fails_at_the_epoch_that_differs() {
    let root = Path::new(env!("CARGO_MANIFEST_DIR")).join("conformance/connect/timing-monitor");
    let dir = scratch();
    std::fs::create_dir_all(&dir).unwrap();
    let vector = std::fs::read_to_string(root.join("vector.toml")).unwrap();
    let v: toml::Value = toml::from_str(&vector).unwrap();
    let abs = |k: &str| {
        root.join(v[k].as_str().unwrap())
            .canonicalize()
            .unwrap()
            .display()
            .to_string()
    };
    let expected = std::fs::read_to_string(abs("expected")).unwrap();
    // Raise one C/N0 value of the third epoch (line 3; line 0 is the header) by 1 dB-Hz.
    let mut lines: Vec<String> = expected.lines().map(str::to_string).collect();
    let k = 3;
    let mut e: serde_json::Value = serde_json::from_str(&lines[k]).unwrap();
    let c = e["cn0"][0]["cn0_dbhz"].as_f64().unwrap();
    e["cn0"][0]["cn0_dbhz"] = serde_json::json!(c + 1.0);
    lines[k] = e.to_string();
    let bad = dir.join("expected.obs.jsonl");
    std::fs::write(&bad, lines.join("\n") + "\n").unwrap();
    let toml_text = format!(
        "name = \"wrong\"\ninput = {:?}\nmapping = {:?}\nstation = {:?}\nexpected = {:?}\n",
        abs("input"),
        abs("mapping"),
        abs("station"),
        bad.display().to_string()
    );
    let vp = dir.join("vector.toml");
    std::fs::write(&vp, toml_text).unwrap();
    let r = check_vector(&vp, &dir.join("w"));
    let _ = std::fs::remove_dir_all(&dir);
    let r = r.unwrap();
    for p in &r.paths {
        assert!(!p.pass, "{p:?}");
        assert_eq!(p.first_difference, Some(k), "{p:?}");
    }
}
