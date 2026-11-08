// SPDX-License-Identifier: AGPL-3.0-only
//! C7 (docs/design/evidence/c7-flight-dynamics-adapters/PREREGISTRATION.md), step 1: the CAPSTONE
//! JPL Horizons states of the mission thread written by `kshana ephem-export` as OEM, OPM and SPK.
//!
//! PIN-SCOPE:    the command writes each file; the engine's readers read every state back with the
//!               bits it was written with and every epoch unchanged; the files' SHA-256 equal those in
//!               tests/fixtures/capstone_horizons/ephem_export.sha256, the same digests the Python
//!               and MCP surfaces are held to (tests/python/test_bindings.py, mcp round_trip)
//! PIN-EXCLUDES: reading by the external tools (the C7 adapters and notebooks), and whether the
//!               Horizons states are right

use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);
use std::process::Command;

fn fixture(name: &str) -> std::path::PathBuf {
    std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/capstone_horizons")
        .join(name)
}

fn pinned(format: &str) -> String {
    std::fs::read_to_string(fixture("ephem_export.sha256"))
        .unwrap()
        .lines()
        .find(|l| l.ends_with(&format!("  {format}")))
        .unwrap()
        .split_whitespace()
        .next()
        .unwrap()
        .to_string()
}

#[test]
fn the_command_writes_each_format_and_every_state_reads_back_unchanged() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-ephem-export-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    for format in ["oem", "opm", "spk"] {
        // PATH-UNIQUE-WAIVER: inside the per-call directory above, which already carries a unique component.
        let out = dir.join(format!("capstone.{format}"));
        let run = Command::new(env!("CARGO_BIN_EXE_kshana"))
            .arg("ephem-export")
            .arg(fixture("capstone_2023-03_moon_icrf.txt"))
            .args(["--format", format, "--out"])
            .arg(&out)
            .output()
            .unwrap();
        assert!(
            run.status.success(),
            "{format}: {}",
            String::from_utf8_lossy(&run.stderr)
        );
        let v: serde_json::Value = serde_json::from_slice(&run.stdout).unwrap();
        let states = if format == "opm" { 1 } else { 4321 };
        assert_eq!(v["states"], 4321);
        assert_eq!(v["read_back"]["states"], states, "{format}");
        assert_eq!(v["read_back"]["identical"], states, "{format}");
        assert_eq!(v["read_back"]["epoch_mismatches"], 0, "{format}");
        assert_eq!(v["read_back"]["max_position_km"], 0.0, "{format}");
        assert_eq!(v["object"], "CAPSTONE");
        assert_eq!(v["center_naif"], 301);
        let bytes = std::fs::read(&out).unwrap();
        assert_eq!(
            kshana::advanced_report::sha256_hex(&bytes),
            pinned(format),
            "{format}"
        );
        assert_eq!(v["sha256"], pinned(format));
        if format == "spk" {
            // The Hermite interpolation at a node is the node's state to rounding.
            assert!(
                v["read_back"]["interpolated_max_position_km"]
                    .as_f64()
                    .unwrap()
                    < 1e-9
            );
        }
    }
    std::fs::remove_dir_all(&dir).ok();
}

#[test]
fn the_oem_carries_the_tables_header() {
    let text = std::fs::read_to_string(fixture("capstone_2023-03_moon_icrf.txt")).unwrap();
    let t = kshana::ephem_export::parse_horizons_vectors(&text).unwrap();
    let oem = kshana::ephem_export::to_oem(&t, &Default::default()).unwrap();
    for want in [
        "OBJECT_NAME = CAPSTONE",
        "OBJECT_ID = -1176",
        "CENTER_NAME = MOON",
        "REF_FRAME = ICRF",
        "TIME_SYSTEM = TDB",
        "START_TIME = 2023-03-01T00:00:00.0000",
        "STOP_TIME = 2023-03-31T00:00:00.0000",
    ] {
        assert!(oem.contains(want), "{want}");
    }
    let parsed = kshana::oem::parse_oem(&oem).unwrap();
    assert_eq!(parsed.segments[0].states.len(), 4321);
}
