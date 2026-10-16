// SPDX-License-Identifier: AGPL-3.0-only
//! The test-bench export (`kshana bench-export`) read back by an open-source GNSS simulator's own
//! motion-file readers: gps-sdr-sim (MIT, commit 28ca29a6), `readNmeaGGA` (`-g`),
//! `readUserMotion` (`-u`) and `readUserMotionLLH` (`-x`), called through
//! `xval/testbench-gpssdrsim/driver.c`. No signal-generation function is called.
//!
//! The oracle is dev-only (`xval/testbench-gpssdrsim/run.sh`, after `fetch.sh`). CI reads the
//! committed summary `tests/fixtures/testbench/gpssdrsim.json` and checks it against the bars
//! registered in `xval/testbench-gpssdrsim/PREREGISTRATION.md` (commit 41874fa, before any run;
//! amendment 1 in d929ddc, before its run). It also checks that today's export still produces the
//! bytes the oracle read.
//!
//! Run 1 FINDING, pinned below: the header-removed full CSV (registered B3/B4) is not readable
//! by `-u`. gps-sdr-sim reads lines through a 100-character buffer, and a CSV row is about 161
//! characters, so each row comes back as two samples. Amendment 1's four-column cut reads back
//! exactly.
//!
//! What this does not check: the physics of the truth trajectory, gps-sdr-sim's signal output,
//! any other simulator, any receiver.
//!
//! PIN-SCOPE:    the SHA-256 of the default-epoch `.motion.csv` and `.nmea` bytes of each of the
//!               8 registered scenarios, so the oracle's numbers apply to those bytes
//! PIN-EXCLUDES: the `.motion.json`, waypoint and event files, which gps-sdr-sim does not read

use kshana::interop::testbench::export;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::PathBuf;

/// The registered scenarios, in the registration's order.
const SCENARIOS: [&str; 8] = [
    "automotive-urban-canyon",
    "gnss-ins",
    "small-uas-jammed-nav",
    "gnss-ins-maritime",
    "gnss-ins-rail",
    "gnss-ins-aviation",
    "jamming-demo",
    "gnss-sim-raim",
];
/// The `gnss-ins` scenarios (B7 applies to these only).
const GNSS_INS: usize = 6;
/// gps-sdr-sim's `USER_MOTION_SIZE`.
const CAP: u64 = 3000;
/// B2: NMEA read against the CSV, metres.
const B2_M: f64 = 1.0e-2;
/// B4 / B4a: the ECEF reader against the CSV, metres.
const B4_M: f64 = 1.0e-6;
/// B6: the LLH reader against the CSV, metres.
const B6_M: f64 = 1.0e-3;
/// B7: time column against the 0.1 s grid, seconds.
const B7_S: f64 = 1.0e-9;

fn summary() -> Value {
    let p =
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/testbench/gpssdrsim.json");
    serde_json::from_str(&std::fs::read_to_string(p).expect("read gpssdrsim.json")).unwrap()
}

fn rec<'a>(s: &'a Value, name: &str) -> &'a Value {
    let r = &s["scenarios"][name];
    assert!(r.is_object(), "{name}: missing from the summary");
    r
}

fn n(v: &Value) -> u64 {
    v.as_u64().expect("integer")
}

fn x(v: &Value) -> f64 {
    v.as_f64().expect("number")
}

#[test]
fn the_summary_is_the_registered_oracle_on_the_registered_scenarios() {
    let s = summary();
    assert_eq!(s["oracle"], "gps-sdr-sim");
    assert_eq!(
        s["oracle_commit"],
        "28ca29a6719475195e3aabd5930c4ed02d67190f"
    );
    assert_eq!(n(&s["user_motion_size"]), CAP);
    let names: Vec<&String> = s["scenarios"].as_object().unwrap().keys().collect();
    assert_eq!(names.len(), SCENARIOS.len());
    for name in SCENARIOS {
        let r = rec(&s, name);
        assert_eq!(n(&r["n_expected"]), n(&r["samples_in_export"]).min(CAP));
    }
}

#[test]
fn todays_export_is_the_bytes_the_oracle_read() {
    let s = summary();
    for name in SCENARIOS {
        let r = rec(&s, name);
        let src = std::fs::read_to_string(
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join(format!("scenarios/{name}.toml")),
        )
        .unwrap();
        let files = export(&src, None).expect("export");
        let sha = |suffix: &str| {
            let f = files.iter().find(|f| f.suffix == suffix).expect(suffix);
            hex::encode(Sha256::digest(&f.bytes))
        };
        assert_eq!(
            sha(".motion.csv"),
            r["csv_sha256"],
            "{name}: motion CSV bytes changed; re-run xval/testbench-gpssdrsim/run.sh"
        );
        assert_eq!(
            sha(".nmea"),
            r["nmea_sha256"],
            "{name}: NMEA bytes changed; re-run xval/testbench-gpssdrsim/run.sh"
        );
    }
}

#[test]
fn nmea_and_llh_readers_return_the_trajectory_b1_b2_b5_b6() {
    let s = summary();
    for name in SCENARIOS {
        let r = rec(&s, name);
        let want = n(&r["n_expected"]);
        assert_eq!(n(&r["nmea_count"]), want, "{name}: B1");
        assert!(
            x(&r["nmea_max_diff_m"]) <= B2_M,
            "{name}: B2 {}",
            r["nmea_max_diff_m"]
        );
        assert_eq!(n(&r["llh_count"]), want, "{name}: B5");
        assert!(
            x(&r["llh_max_diff_m"]) <= B6_M,
            "{name}: B6 {}",
            r["llh_max_diff_m"]
        );
    }
}

#[test]
fn the_four_column_ecef_cut_reads_back_exactly_b3a_b4a() {
    let s = summary();
    for name in SCENARIOS {
        let r = rec(&s, name);
        assert_eq!(n(&r["ecef4_count"]), n(&r["n_expected"]), "{name}: B3a");
        assert!(
            x(&r["ecef4_max_diff_m"]) <= B4_M,
            "{name}: B4a {}",
            r["ecef4_max_diff_m"]
        );
    }
}

/// Run 1 FINDING, pinned: the header-removed full CSV is split by the 100-character buffer, so
/// `-u` returns about two samples per row (capped at 3000) and positions that are not the
/// trajectory. If this starts passing, the export or the reader changed: re-register.
#[test]
fn finding_the_full_width_csv_is_not_readable_by_the_ecef_reader_b3_b4() {
    let s = summary();
    for name in SCENARIOS {
        let r = rec(&s, name);
        let rows = n(&r["samples_in_export"]);
        assert_eq!(
            n(&r["ecef_count"]),
            (2 * rows).min(CAP),
            "{name}: B3 FINDING"
        );
        assert!(x(&r["ecef_max_diff_m"]) > 1.0e6, "{name}: B4 FINDING");
        assert_eq!(
            r["as_written_first_sample_is_nan"], true,
            "{name}: header line"
        );
    }
}

#[test]
fn gnss_ins_exports_sit_on_the_simulators_10_hz_row_grid_b7() {
    let s = summary();
    for name in &SCENARIOS[..GNSS_INS] {
        let r = rec(&s, name);
        assert!(x(&r["max_time_vs_grid_0p1_s"]) <= B7_S, "{name}: B7");
    }
    // Recorded, not barred: the stationary scenarios as bundled step at 30 s and 60 s.
    assert_eq!(x(&rec(&s, "jamming-demo")["row_spacing_s"][0]), 30.0);
    assert_eq!(x(&rec(&s, "gnss-sim-raim")["row_spacing_s"][0]), 60.0);
}
