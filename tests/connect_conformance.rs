// SPDX-License-Identifier: AGPL-3.0-only
//! Every Connect adapter with a vector in conformance/connect gives its expected kshana.obs/1
//! file byte for byte, and a difference fails with the line it starts at (roadmap A7a).
//!
//! PIN-SCOPE:    `kshana connect check conformance/connect` exits 0 with every vector passing;
//!               a vector whose expected file was altered exits 1 and names the first differing
//!               line
//! PIN-EXCLUDES: live adapters (A7b checks latency, ordering and reconnect)

use std::process::Command;

fn kshana() -> Command {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"));
    c.current_dir(env!("CARGO_MANIFEST_DIR"))
        .env("KSHANA_LANG", "en");
    c
}

#[test]
fn every_vector_passes() {
    let o = kshana()
        .args(["connect", "check", "conformance/connect"])
        .output()
        .unwrap();
    let out = String::from_utf8_lossy(&o.stdout);
    assert!(
        o.status.success(),
        "{out}{}",
        String::from_utf8_lossy(&o.stderr)
    );
    assert!(!out.contains("FAIL") && !out.contains("ERROR"), "{out}");
    assert!(
        out.lines().filter(|l| l.starts_with("PASS")).count() >= 4,
        "{out}"
    );
}

#[test]
fn a_changed_output_fails_at_its_line() {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir = std::env::temp_dir().join(format!("kshana-conf-{}-{seq}", std::process::id()));
    std::fs::create_dir_all(&dir).unwrap();
    let root = env!("CARGO_MANIFEST_DIR");
    let want = std::fs::read_to_string(format!(
        "{root}/conformance/connect/timing-monitor/expected.obs.jsonl"
    ))
    .unwrap();
    // Change one value on the third line (the second epoch).
    let mut lines: Vec<String> = want.lines().map(str::to_string).collect();
    lines[2] = lines[2].replacen("43.9", "43.8", 1);
    std::fs::write(dir.join("expected.obs.jsonl"), lines.join("\n") + "\n").unwrap();
    std::fs::write(
        dir.join("vector.toml"),
        format!(
            "name = \"tampered\"\ninput = \"{root}/examples/connect/timing-monitor.csv\"\nmapping = \"{root}/examples/connect/timing-monitor.connect.toml\"\nstation = \"{root}/examples/obs/station.toml\"\nexpected = \"expected.obs.jsonl\"\n"
        ),
    )
    .unwrap();
    let o = kshana()
        .args(["connect", "check"])
        .arg(&dir)
        .output()
        .unwrap();
    let out = String::from_utf8_lossy(&o.stdout);
    assert_eq!(o.status.code(), Some(1), "{out}");
    assert!(out.contains("FAIL") && out.contains("line 3"), "{out}");
    let _ = std::fs::remove_dir_all(&dir);
}
