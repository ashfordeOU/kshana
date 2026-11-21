// SPDX-License-Identifier: AGPL-3.0-only
//! The time scale of the OEM and SP3 exports (`OemFile::from_propagators`, `--export-oem`,
//! `api::export_oem`; `Sp3File::to_sp3_string`, `--export-sp3`, `api::export_sp3`): their epochs
//! are the instants the engine evaluates the states at (each self-dated satellite at its label,
//! as `exported_states_are_at_the_instant_they_are_labelled_with` checks), and the file must
//! name the scale those epochs are written in: the OEM `TIME_SYSTEM` and the SP3 `%c` line.
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

/// The time system an RTKLIB-style reader takes from an SP3 file: columns 10-12 of the first
/// `%c` line, GPS when there is none. Written out here, not taken from the engine's reader.
fn rtklib_style_time_system(sp3: &str) -> String {
    sp3.lines()
        .find(|l| l.starts_with("%c"))
        .and_then(|l| l.get(9..12))
        .unwrap_or("GPS")
        .to_string()
}

#[test]
fn the_sp3_export_states_utc_in_its_c_lines() {
    let src = include_str!("../scenarios/orbit-sgp4-gps.toml");
    let text = kshana::api::export_sp3(src).unwrap();
    let c: Vec<&str> = text.lines().filter(|l| l.starts_with("%c")).collect();
    // PIN-SCOPE:    the two %c lines of the SP3 export and the time system they state.
    // PIN-EXCLUDES: the positions and epochs, checked by the SP3 round-trip tests.
    assert_eq!(c.len(), 2, "{text}");
    assert_eq!(&c[0][3..4], "G", "file type: {}", c[0]);
    assert_eq!(rtklib_style_time_system(&text), "UTC");
    // The lines sit in the header: after the satellite list, before the first epoch.
    let pos = |p: &str| text.lines().position(|l| l.starts_with(p)).unwrap();
    assert!(pos("+") < pos("%c") && pos("%c") < pos("*"));
    // The engine's own reader still reads the file, with the same epochs.
    let f = kshana::sp3::parse_sp3(&text).unwrap();
    assert!(!f.epochs.is_empty());
    // Without the line, the same reader would take GPS.
    let stripped: String = text
        .lines()
        .filter(|l| !l.starts_with("%c"))
        .map(|l| format!("{l}\n"))
        .collect();
    assert_eq!(rtklib_style_time_system(&stripped), "GPS");
}

#[test]
fn a_mixed_constellation_sp3_is_file_type_m() {
    let tle = kshana::tle::parse_tle(L1, L2).unwrap();
    let sat = || Propagator::Sgp4(Box::new(tle.to_sgp4(kshana::sgp4::wgs72(), false)));
    let start = EpochUtc {
        year: 2024,
        month: 1,
        day: 1,
        hour: 12,
        minute: 0,
        second: 0.0,
    };
    let jd = 2_460_311.0; // 2024-01-01T12:00 UTC, the UT1 of the start
    let f = kshana::sp3::Sp3File::from_propagators(
        &["G01".to_string(), "E01".to_string()],
        &[sat(), sat()],
        start,
        jd,
        300.0,
        3,
    );
    let text = f.to_sp3_string();
    let first = text.lines().find(|l| l.starts_with("%c")).unwrap();
    assert_eq!(&first[3..4], "M");
    assert_eq!(rtklib_style_time_system(&text), "UTC");
}
