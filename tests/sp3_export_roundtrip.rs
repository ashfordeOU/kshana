// SPDX-License-Identifier: AGPL-3.0-only
//! SP3 export round-trip against the real GPS constellation.
//!
//! The milestone validation for the SP3-export half of the interop story: build an
//! SP3 file from a genuine Celestrak `gps-ops` snapshot propagated with the
//! validated SGP4 model, serialise it, re-parse it, and assert the recovered ECEF
//! positions match the SGP4 truth over a full day. Because the writer emits
//! position records at millimetre resolution, the real agreement is far tighter
//! than the 10 m TLE-grade tolerance the milestone asks for — so we assert both.

use kshana::frames::teme_to_ecef;
use kshana::rinex::EpochUtc;
use kshana::sp3::{parse_sp3, Sp3File};
use kshana::timescales::julian_date;
use kshana::tle::parse_propagators;

const GPS_TLE: &str = include_str!("fixtures/celestrak/gps-ops_2021-07-28.txt");

#[test]
fn sp3_export_round_trips_real_gps_within_tolerance() {
    let sats = parse_propagators(GPS_TLE).expect("real GPS TLEs parse to propagators");
    assert!(
        sats.len() >= 24,
        "expected an operational GPS constellation, got {}",
        sats.len()
    );
    // SP3 satellite identifiers are assigned positionally (the TLE name lines are
    // not carried through the propagators) as Gnn — the system letter + index.
    let ids: Vec<String> = (1..=sats.len()).map(|i| format!("G{i:02}")).collect();

    // The snapshot epoch (2021-07-28 00:00:00), 24 h sampled every 15 min.
    let start = EpochUtc {
        year: 2021,
        month: 7,
        day: 28,
        hour: 0,
        minute: 0,
        second: 0.0,
    };
    let start_jd_ut1 = julian_date(2021, 7, 28, 0, 0, 0.0);
    let step_s = 900.0;
    let num_epochs = 96usize; // 24 h / 15 min

    let sp3 = Sp3File::from_propagators(&ids, &sats, start, start_jd_ut1, step_s, num_epochs);
    let text = sp3.to_sp3_string();

    // Sanity: the serialised text is well-formed SP3 (version line + EOF trailer).
    assert!(text.starts_with("#c"), "SP3 header version line missing");
    assert!(text.trim_end().ends_with("EOF"), "SP3 EOF trailer missing");

    let parsed = parse_sp3(&text).expect("exported SP3 re-parses");
    assert_eq!(parsed.epochs.len(), num_epochs, "epoch count round-trips");
    assert_eq!(
        parsed.observed_satellites().len(),
        sats.len(),
        "every satellite is present in the exported SP3"
    );

    let mut worst = 0.0_f64;
    for idx in 0..num_epochs {
        let t = idx as f64 * step_s;
        let jd_ut1 = start_jd_ut1 + t / 86_400.0;
        for (i, sat) in sats.iter().enumerate() {
            let truth = teme_to_ecef(sat.position_eci(t), jd_ut1);
            let got = parsed
                .position_of(&ids[i], idx)
                .expect("satellite present at this epoch");
            let d = ((got[0] - truth[0]).powi(2)
                + (got[1] - truth[1]).powi(2)
                + (got[2] - truth[2]).powi(2))
            .sqrt();
            worst = worst.max(d);
        }
    }

    // The milestone tolerance: SGP4-grade agreement over 24 h.
    assert!(
        worst < 10.0,
        "worst SP3 round-trip residual {worst} m exceeds the 10 m tolerance"
    );
    // The honest, much tighter bound: the writer's millimetre serialisation means
    // the readback is sub-metre, confirming this is a fidelity check, not luck.
    assert!(
        worst < 0.5,
        "worst residual {worst} m — expected sub-metre (mm serialisation)"
    );
}

const ORBIT_SCENARIO: &str = include_str!("../scenarios/orbit-sgp4-gps.toml");
const CLOCK_SCENARIO: &str = include_str!("../scenarios/clock-ensemble.toml");

#[test]
fn api_export_sp3_writes_a_reparseable_file_for_an_orbit_scenario() {
    // The CLI `--export-sp3` path: the bundled real-GPS orbit scenario exports a
    // valid SP3-c document with every satellite present.
    let text = kshana::api::export_sp3(ORBIT_SCENARIO).expect("orbit scenario exports SP3");
    assert!(text.starts_with("#c"), "not SP3-c: {:?}", &text[..2]);
    let parsed = parse_sp3(&text).expect("CLI-exported SP3 re-parses");
    assert_eq!(
        parsed.observed_satellites().len(),
        30,
        "the gps-ops snapshot has 30 satellites"
    );
}

#[test]
fn api_export_sp3_rejects_a_non_orbit_scenario() {
    // SP3 export only makes sense for a constellation; a clock scenario must error
    // rather than silently produce an empty file.
    let err = kshana::api::export_sp3(CLOCK_SCENARIO).unwrap_err();
    assert!(
        err.contains("orbit"),
        "expected an orbit-required error, got: {err}"
    );
    // And auto-export returns None for it (no `export_sp3` flag, wrong kind).
    assert_eq!(kshana::api::auto_export_sp3(CLOCK_SCENARIO).unwrap(), None);
}

#[test]
fn api_export_omm_writes_one_message_per_gps_satellite_with_real_ids() {
    // The CLI `--export-omm` path: the bundled real-GPS orbit scenario exports a
    // CCSDS OMM catalogue — one mean-elements message per satellite — carrying the
    // real catalogue identifiers parsed from the TLE lines.
    let text = kshana::api::export_omm(ORBIT_SCENARIO).expect("orbit scenario exports OMM");
    assert_eq!(
        text.matches("CCSDS_OMM_VERS = 2.0").count(),
        30,
        "one OMM message per gps-ops satellite"
    );
    // PRN 13 = NORAD 24876 = COSPAR 1997-035A, named on its TLE line 0.
    assert!(
        text.contains("NORAD_CAT_ID = 24876"),
        "real catalogue id missing"
    );
    assert!(
        text.contains("OBJECT_ID = 1997-035A"),
        "real designator missing"
    );
    assert!(text.contains("OBJECT_NAME = GPS BIIR-2  (PRN 13)"));
    assert!(text.contains("MEAN_ELEMENT_THEORY = SGP4"));
}

#[test]
fn api_export_omm_rejects_a_non_orbit_scenario() {
    let err = kshana::api::export_omm(CLOCK_SCENARIO).unwrap_err();
    assert!(
        err.contains("orbit"),
        "expected an orbit-required error, got: {err}"
    );
    // Auto-export returns None for a non-orbit scenario.
    assert_eq!(kshana::api::auto_export_omm(CLOCK_SCENARIO).unwrap(), None);
}

#[test]
fn api_auto_export_omm_honours_the_scenario_flag() {
    // Without the flag the orbit scenario auto-exports nothing.
    assert_eq!(kshana::api::auto_export_omm(ORBIT_SCENARIO).unwrap(), None);
    // With `export_omm = true` it returns the OMM catalogue.
    let with_flag =
        ORBIT_SCENARIO.replacen("kind = \"orbit\"", "kind = \"orbit\"\nexport_omm = true", 1);
    let text = kshana::api::auto_export_omm(&with_flag)
        .unwrap()
        .expect("export_omm = true yields Some");
    assert!(text.contains("CCSDS_OMM_VERS = 2.0"));
}

// Pull the whitespace-separated ephemeris lines (`epoch X Y Z X_DOT Y_DOT Z_DOT`)
// out of an OEM document, as their six numeric columns.
fn oem_state_lines(text: &str) -> Vec<[f64; 6]> {
    let mut rows = Vec::new();
    for line in text.lines() {
        let toks: Vec<&str> = line.split_whitespace().collect();
        if toks.len() == 7 && toks[0].len() >= 10 && toks[0].as_bytes()[4] == b'-' {
            let mut v = [0.0f64; 6];
            if toks[1..]
                .iter()
                .enumerate()
                .all(|(k, t)| match t.parse::<f64>() {
                    Ok(x) => {
                        v[k] = x;
                        true
                    }
                    Err(_) => false,
                })
            {
                rows.push(v);
            }
        }
    }
    rows
}

#[test]
fn api_export_oem_carries_position_and_velocity_for_an_orbit_scenario() {
    // The CLI `--export-oem` path: the bundled real-GPS orbit scenario exports a
    // valid CCSDS OEM 2.0 document — the velocity-carrying spacecraft-ephemeris
    // format — with one TEME segment per satellite.
    let text = kshana::api::export_oem(ORBIT_SCENARIO).expect("orbit scenario exports OEM");
    assert!(
        text.starts_with("CCSDS_OEM_VERS = 2.0\n"),
        "not OEM 2.0: {:?}",
        &text[..20.min(text.len())]
    );
    assert!(text.contains("ORIGINATOR = KSHANA"));
    assert_eq!(
        text.matches("META_START").count(),
        30,
        "one OEM segment per gps-ops satellite"
    );
    // OEM is the inertial spacecraft format: TEME frame, full state vectors.
    assert!(text.contains("REF_FRAME = TEME"));
    // Every ephemeris line must carry a real (non-zero) velocity — the whole point
    // of OEM over the position-only SP3 — at a GPS-like speed and altitude.
    let rows = oem_state_lines(&text);
    assert!(
        rows.len() >= 30,
        "expected per-satellite ephemeris lines, got {}",
        rows.len()
    );
    for v in &rows {
        let r_km = (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt();
        let speed_km_s = (v[3] * v[3] + v[4] * v[4] + v[5] * v[5]).sqrt();
        assert!(
            (20_000.0..30_000.0).contains(&r_km),
            "GPS radius {r_km:.0} km"
        );
        assert!(
            (3.0..4.5).contains(&speed_km_s),
            "GPS speed {speed_km_s:.3} km/s — velocity must be carried"
        );
    }
}

#[test]
fn api_export_oem_rejects_a_non_orbit_scenario() {
    let err = kshana::api::export_oem(CLOCK_SCENARIO).unwrap_err();
    assert!(
        err.contains("orbit"),
        "expected an orbit-required error, got: {err}"
    );
    assert_eq!(kshana::api::auto_export_oem(CLOCK_SCENARIO).unwrap(), None);
}

#[test]
fn api_auto_export_oem_honours_the_scenario_flag() {
    // Without the flag the orbit scenario auto-exports nothing.
    assert_eq!(kshana::api::auto_export_oem(ORBIT_SCENARIO).unwrap(), None);
    // With `export_oem = true` it returns the OEM document.
    let with_flag =
        ORBIT_SCENARIO.replacen("kind = \"orbit\"", "kind = \"orbit\"\nexport_oem = true", 1);
    let text = kshana::api::auto_export_oem(&with_flag)
        .unwrap()
        .expect("export_oem = true yields Some");
    assert!(text.starts_with("CCSDS_OEM_VERS = 2.0\n"));
}
