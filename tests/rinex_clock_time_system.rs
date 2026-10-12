// SPDX-License-Identifier: AGPL-3.0-only
//! The RINEX clock reader states the time system of what it read, and refuses one it does not
//! know instead of reading it as GPS time.
//!
//! Fixture: `tests/fixtures/lunar_station_clk/station_clock_synthetic.clk`, a SYNTHETIC
//! three-record station clock file (see its NOTICE.md). Nothing here is a measurement.

use kshana::realdata::clk::{rinex_clock_series, rinex_clock_time_system};

const FIXTURE: &str = "tests/fixtures/lunar_station_clk/station_clock_synthetic.clk";

fn fixture() -> String {
    std::fs::read_to_string(FIXTURE).expect("fixture present")
}

#[test]
fn station_clock_record_reads_with_its_declared_time_system() {
    let text = fixture();
    let r = rinex_clock_series(&[&text], "LRS1", 30.0).unwrap();
    assert_eq!(r.record, "AR");
    assert_eq!(r.time_system, "GPS");
    assert!(r.time_system_declared);
    assert_eq!(r.series.len(), 3);
    assert!((r.series.x[2] - 1.0000003e-7).abs() < 1e-20);
}

#[test]
fn a_lunar_time_scale_is_refused_not_read_as_gps() {
    let text = fixture().replace("   GPS   ", "   LTC   ");
    assert!(text.contains("LTC"));
    let e = rinex_clock_time_system(&text).unwrap_err();
    assert!(e.contains("\"LTC\"") && e.contains("GPS time"), "{e}");
    assert!(rinex_clock_series(&[&text], "LRS1", 30.0).is_err());
}

#[test]
fn a_file_without_a_declaration_is_gps_by_default_and_says_so() {
    let text: String = fixture()
        .lines()
        .filter(|l| !l.ends_with("TIME SYSTEM ID"))
        .map(|l| format!("{l}\n"))
        .collect();
    let (ts, declared) = rinex_clock_time_system(&text).unwrap();
    assert_eq!((ts.as_str(), declared), ("GPS", false));
}
