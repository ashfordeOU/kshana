// SPDX-License-Identifier: AGPL-3.0-only
//! Three unrelated vendor-style exports map to kshana.obs/1 through mapping files alone
//! (roadmap A2a): an Android raw-measurement CSV, a timing receiver's semicolon-separated
//! monitoring export, and a monitoring service's nested JSON.
//!
//! PIN-SCOPE:    `kshana connect map` on the three files in examples/connect: each output passes
//!               `obs check`, starts at the same instant, and carries the converted values the
//!               mapping states (satellite names, feet and radians to SI, flags)
//! PIN-EXCLUDES: Parquet and HDF5 inputs (not read by this version); live inputs (A3a)

use std::path::PathBuf;
use std::process::Command;

fn map(name: &str, input: &str) -> Vec<serde_json::Value> {
    static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);
    let seq = SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed);
    let dir: PathBuf = std::env::temp_dir().join(format!(
        "kshana-connect-{name}-{}-{seq}",
        std::process::id()
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let out = dir.join("out.obs.jsonl");
    let root = env!("CARGO_MANIFEST_DIR");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .current_dir(root)
        .args(["connect", "map", input, "--mapping"])
        .arg(format!("examples/connect/{name}.connect.toml"))
        .args(["--station", "examples/obs/station.toml", "--out"])
        .arg(&out)
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let text = std::fs::read_to_string(&out).unwrap();
    kshana::obs::check(&text).unwrap();
    let _ = std::fs::remove_dir_all(&dir);
    text.lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect()
}

#[test]
fn android_raw_measurements() {
    let r = map("android-raw", "examples/connect/android-raw.csv");
    assert_eq!(r.len(), 4, "header and three epochs");
    assert_eq!(r[1]["time_label"], "2026-11-01T12:00:00Z");
    let sats: Vec<&str> = r[1]["cn0"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| s["sat"].as_str().unwrap())
        .collect();
    assert_eq!(sats, ["G05", "G12", "E11", "C23"]);
    assert_eq!(r[1]["fix"]["height_m"], 31.5);
    assert_eq!(r[3]["t_s"], 2.0);
}

#[test]
fn timing_monitor_export() {
    let r = map("timing-monitor", "examples/connect/timing-monitor.csv");
    assert_eq!(r.len(), 6);
    // GPS week 2443, time of week 43218 s, is 2026-11-01T12:00:00 UTC (GPS − UTC = 18 s).
    assert_eq!(r[1]["time_label"], "2026-11-01T12:00:00Z");
    assert!((r[1]["fix"]["height_m"].as_f64().unwrap() - 98.4 * 0.3048).abs() < 1e-9);
    assert_eq!(r[4]["self_report"]["spoofing"], 2);
    // G25 is blank at the fourth epoch: a missing value, not a zero.
    assert_eq!(r[4]["cn0"].as_array().unwrap().len(), 3);
}

#[test]
fn monitoring_api_json() {
    let r = map("monitor-api", "examples/connect/monitor-api.json");
    assert_eq!(r.len(), 4);
    assert_eq!(r[1]["time_label"], "2026-11-01T12:00:00Z");
    assert!((r[1]["fix"]["lat_deg"].as_f64().unwrap() - 1.037_432_f64.to_degrees()).abs() < 1e-9);
    assert_eq!(r[2]["reported_dop"]["pdop"], 2.9);
    assert_eq!(r[3]["t_s"], 120.0);
}
