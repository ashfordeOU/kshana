// SPDX-License-Identifier: AGPL-3.0-only
//! The time scale of the OEM export (`kshana::oem::OemFile::from_propagators`, used by
//! `--export-oem` and `api::export_oem`): its epochs are the instants the engine propagates the
//! states to, and its `TIME_SYSTEM` must name the scale those epochs are written in.
//!
//! The engine dates every absolute instant as UTC (UT1 taken equal to UTC): an SGP4 satellite's
//! TLE epoch, a broadcast ephemeris, the scenario `epoch`. Here an SGP4 satellite is exported
//! from its own TLE epoch, so the instant of each state line is known independently: the TLE
//! epoch (UTC) plus the line's offset. GPS time is UTC + 18 s since 2017-01-01 (IERS Bulletin
//! C, the leap second of 2016-12-31), converted here by hand, not by the engine.

use kshana::oem::OemFile;
use kshana::orbit::Propagator;
use kshana::rinex::EpochUtc;

// ISS, epoch 2024-01-01 12:00:00 UTC (day 001.5 of 2024).
const L1: &str = "1 25544U 98067A   24001.50000000  .00016717  00000-0  10270-3 0  9000";
const L2: &str = "2 25544  51.6400 208.9163 0006317  69.9862 290.1962 15.49401763000000";

/// Seconds after 2024-01-01T00:00:00 of an `EpochUtc` written by the export.
fn sec_of_2024_01_01(e: &EpochUtc) -> f64 {
    assert_eq!((e.year, e.month), (2024, 1));
    (e.day as f64 - 1.0) * 86_400.0 + e.hour as f64 * 3600.0 + e.minute as f64 * 60.0 + e.second
}

/// GPS minus UTC on 2024-01-01 (s), by hand: 18 leap seconds since the GPS epoch.
const GPS_MINUS_UTC_2024_S: f64 = 18.0;

#[test]
fn the_oem_epochs_are_utc_and_time_system_says_so() {
    let tle = kshana::tle::parse_tle(L1, L2).unwrap();
    let sat = Propagator::Sgp4(Box::new(tle.to_sgp4(kshana::sgp4::wgs72(), false)));
    // The satellite's own epoch, as the engine dates it (UTC): 2024-01-01 12:00:00.
    let jd0 = sat.own_jd_utc(0.0).unwrap();
    let utc0_s = (jd0 - 2_460_310.5) * 86_400.0; // JD of 2024-01-01T00:00 UTC is 2460310.5
    assert!((utc0_s - 43_200.0).abs() < 1e-3, "{utc0_s}");
    let start = EpochUtc {
        year: 2024,
        month: 1,
        day: 1,
        hour: 12,
        minute: 0,
        second: 0.0,
    };
    let f = OemFile::from_propagators(&["ISS".to_string()], &[sat], start, 600.0, 7, start);
    let seg = &f.segments[0];
    // PIN-SCOPE:    the time scale the OEM export writes its epochs in, and its TIME_SYSTEM.
    // PIN-EXCLUDES: the state vectors, checked by the OEM and SGP4 tests.
    assert_eq!(seg.meta.time_system, "UTC");
    for (i, line) in seg.states.iter().enumerate() {
        let written = sec_of_2024_01_01(&line.epoch);
        let utc = 43_200.0 + 600.0 * i as f64;
        let gps = utc + GPS_MINUS_UTC_2024_S;
        assert!(
            (written - utc).abs() < 1e-6,
            "line {i}: written {written}, UTC {utc}"
        );
        assert!(
            (written - gps).abs() > 17.0,
            "line {i}: written as GPS time"
        );
    }
    let text = f.to_oem_string();
    assert!(text.contains("TIME_SYSTEM = UTC"), "{text}");
    assert!(!text.contains("TIME_SYSTEM = GPS"));
}

#[test]
fn the_cli_oem_export_labels_its_epochs_utc() {
    // The bundled SGP4 GPS orbit scenario through `api::export_oem`, the `--export-oem` path.
    let src = include_str!("../scenarios/orbit-sgp4-gps.toml");
    let text = kshana::api::export_oem(src).unwrap();
    assert!(text.contains("TIME_SYSTEM = UTC"));
    assert!(!text.contains("TIME_SYSTEM = GPS"));
}
