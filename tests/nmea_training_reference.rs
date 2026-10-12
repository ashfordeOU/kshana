// SPDX-License-Identifier: AGPL-3.0-only
//! Validated anchor: the NMEA training streams parse, checksum and decode in pynmea2.
//!
//! The NMEA training streams of `kshana::nmea_synth` are decoded by pynmea2, an independent
//! NMEA 0183 parser (`scripts/gen_nmea_training_ref.py`), and the decoded values are
//! compared with the generator's own truth track.
//!
//! ## Pre-registered tolerances
//!
//! Fixed BEFORE the first comparison run and never to be loosened after seeing results. Each
//! is the sum of the two roundings between the truth value and the printed field, or, for
//! heading, a stated multiple of the modelled gyro noise.
//!
//! | quantity | tolerance | derivation |
//! |---|---|---|
//! | latitude, longitude | 1.5e-6 deg | print rounding 0.5e-4 arcmin = 8.34e-7 deg, plus truth rounded to 6 dp (5e-7 deg) = 1.34e-6 |
//! | speed over ground (RMC, VTG knots) | 0.06 kn | printed to 0.1 (0.05), truth rounded to 0.01 (0.005) |
//! | speed over ground (VTG km/h) | 0.07 km/h | printed to 0.1 (0.05), truth 0.005 kn x 1.852 = 0.0093 |
//! | course over ground (RMC, VTG true) | 0.11 deg, circular | printed to 0.1 (0.05), truth rounded to 0.1 (0.05) |
//! | heading (HDT) | 0.5 deg, circular | gyro noise 0.05 deg standard deviation (10 sigma), print 0.05, truth 0.05 |
//! | UTC time of day and date (RMC, GGA, GNS, ZDA) | 0.02 s | printed to 0.01 s (0.005), truth offset rounded to 0.01 s (0.005), epoch rounded to the millisecond |
//!
//! Exact (no tolerance): every sentence parses and its checksum is valid; the talker and
//! sentence type are the expected ones; the count of each sentence type equals the count
//! the generator wrote; fix status and quality, and the satellite count in GGA, equal the
//! truth.

/// Latitude and longitude, degrees.
pub const TOL_LATLON_DEG: f64 = 1.5e-6;
/// Speed over ground, knots.
pub const TOL_SOG_KN: f64 = 0.06;
/// Speed over ground in VTG's km/h field.
pub const TOL_SOG_KMH: f64 = 0.07;
/// Course over ground, degrees (circular difference).
pub const TOL_COG_DEG: f64 = 0.11;
/// Heading, degrees (circular difference).
pub const TOL_HEADING_DEG: f64 = 0.5;
/// UTC time of day and date, seconds.
pub const TOL_TIME_S: f64 = 0.02;

use kshana::nmea_synth::generate_from_toml;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::collections::BTreeMap;

const REFERENCE_JSON: &str = include_str!("fixtures/nmea_training_ref/reference.json");

/// Scenarios and seeds as in `examples/gen_nmea_training_inputs.rs`.
const SCENARIOS: [(&str, &str); 4] = [
    (
        "open-sea-jamming",
        include_str!("../scenarios/training/open-sea-jamming.toml"),
    ),
    (
        "coastal-drag-off",
        include_str!("../scenarios/training/coastal-drag-off.toml"),
    ),
    (
        "port-approach-time-spoof",
        include_str!("../scenarios/training/port-approach-time-spoof.toml"),
    ),
    (
        "combined-event",
        include_str!("../scenarios/training/combined-event.toml"),
    ),
];
const SEEDS: [u64; 2] = [1, 7];

/// Days since 1970-01-01 of a civil date (proleptic Gregorian).
fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let doy = (153 * (if m > 2 { m - 3 } else { m + 9 }) + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// Seconds since the Unix epoch of `YYYY-MM-DD` plus `HH:MM:SS[.fff]` text.
fn abs_s(date: &str, tod: &str) -> f64 {
    let n = |s: &str| s.parse::<i64>().unwrap();
    let d = days_from_civil(n(&date[0..4]), n(&date[5..7]), n(&date[8..10]));
    let t = tod.trim_end_matches("+00:00").trim_end_matches('Z');
    let secs = n(&t[0..2]) * 3600 + n(&t[3..5]) * 60;
    let sec: f64 = t[6..].parse().unwrap();
    (d * 86_400 + secs) as f64 + sec
}

/// Time of day in seconds, modulo a day.
fn tod_s(tod: &str) -> f64 {
    abs_s("1970-01-01", tod).rem_euclid(86_400.0)
}

fn circ(a: f64, b: f64) -> f64 {
    let d = (a - b).rem_euclid(360.0);
    d.min(360.0 - d)
}

fn num(v: &Value, k: &str) -> f64 {
    v[k].as_f64()
        .unwrap_or_else(|| panic!("missing {k} in {v}"))
}

#[test]
fn pynmea2_parses_every_sentence_and_decodes_to_the_truth() {
    let reference: Value = serde_json::from_str(REFERENCE_JSON).unwrap();
    assert!(reference["oracle"]
        .as_str()
        .unwrap()
        .starts_with("pynmea2 "));
    let mut rows_checked = 0usize;
    let mut lost_rows = 0usize;
    let mut sentences = 0usize;
    for (name, toml) in SCENARIOS {
        for seed in SEEDS {
            let key = format!("{name}_s{seed}");
            let fx = &reference["streams"][&key];
            assert!(fx.is_object(), "{key} missing from the fixture");
            let g = generate_from_toml(toml, Some(seed)).unwrap();
            let text = g.nmea_text();

            // The bytes pynmea2 saw are the bytes the generator writes now.
            let digest = Sha256::digest(text.as_bytes());
            assert_eq!(
                hex::encode(digest),
                fx["sha256"].as_str().unwrap(),
                "{key}: stream bytes"
            );

            // Every sentence parsed with a valid checksum, in the expected shape.
            assert_eq!(
                fx["failures"].as_u64().unwrap(),
                0,
                "{key}: pynmea2 failures"
            );
            let lines: Vec<&str> = text.split("\r\n").filter(|l| !l.is_empty()).collect();
            assert_eq!(
                fx["sentences"].as_u64().unwrap() as usize,
                lines.len(),
                "{key}"
            );
            let mut counts: BTreeMap<String, u64> = BTreeMap::new();
            for l in &lines {
                let id = if l.starts_with("$P") {
                    format!("P/{}", &l[1..6])
                } else {
                    format!("{}/{}", &l[1..3], &l[3..6])
                };
                *counts.entry(id).or_default() += 1;
            }
            let theirs: BTreeMap<String, u64> = fx["counts"]
                .as_object()
                .unwrap()
                .iter()
                .map(|(k, v)| (k.clone(), v.as_u64().unwrap()))
                .collect();
            assert_eq!(counts, theirs, "{key}: talker/type counts");
            let epochs = g.epochs.len() as u64;
            assert_eq!(fx["epochs"].as_u64().unwrap(), epochs, "{key}: epochs");
            for talker_type in [
                "GN/GGA", "GN/RMC", "GN/VTG", "GN/ZDA", "GN/GNS", "HE/HDT", "VD/VBW",
            ] {
                assert_eq!(
                    theirs[talker_type], epochs,
                    "{key}: {talker_type} once per epoch"
                );
            }
            sentences += lines.len();

            // The decoded values match the truth track at every decoded epoch.
            let truth: BTreeMap<u64, _> = g.log.track.iter().map(|r| (r.t_s as u64, r)).collect();
            let rows = fx["rows"].as_array().unwrap();
            assert!(rows.len() >= 100, "{key}: only {} rows", rows.len());
            for row in rows {
                let k = row["epoch"].as_u64().unwrap();
                let t = truth
                    .get(&k)
                    .unwrap_or_else(|| panic!("{key}: no truth row at {k}"));
                let ctx = format!("{key} t={k}");
                rows_checked += 1;
                assert_eq!(
                    row["rmc_valid"].as_bool().unwrap(),
                    t.fix_valid,
                    "{ctx}: RMC status"
                );
                assert_eq!(
                    row["gga_qual"].as_u64().unwrap(),
                    u64::from(t.fix_valid),
                    "{ctx}: GGA quality"
                );
                // With no fix GGA reports no satellites (the log's `n_used` counts those still
                // tracked toward a fix that is not reported).
                let want_nsat = if t.fix_valid { t.n_used } else { 0 };
                assert_eq!(
                    row["gga_nsat"].as_u64().unwrap() as usize,
                    want_nsat,
                    "{ctx}: GGA satellites"
                );

                // Reported UTC: the true UTC plus the scripted offset.
                let truth_abs = abs_s(&t.utc[..10], &t.utc[11..t.utc.len() - 1]) + t.time_offset_s;
                let within = |got: f64, want: f64, tol: f64, what: &str| {
                    assert!(
                        (got - want).abs() <= tol,
                        "{ctx}: {what} got {got} want {want} (tol {tol})"
                    );
                };
                let rmc_abs = abs_s(
                    row["rmc_date"].as_str().unwrap(),
                    row["rmc_time"].as_str().unwrap(),
                );
                within(rmc_abs, truth_abs, TOL_TIME_S, "RMC date+time");
                let zda_abs = abs_s(
                    row["zda_date"].as_str().unwrap(),
                    row["zda_time"].as_str().unwrap(),
                );
                within(zda_abs, truth_abs, TOL_TIME_S, "ZDA date+time");
                for k2 in ["gga_time", "gns_time"] {
                    let d =
                        (tod_s(row[k2].as_str().unwrap()) - truth_abs.rem_euclid(86_400.0)).abs();
                    assert!(d.min(86_400.0 - d) <= TOL_TIME_S, "{ctx}: {k2}");
                }
                assert!(
                    circ(num(row, "hdt_heading"), t.true_heading_deg) <= TOL_HEADING_DEG,
                    "{ctx}: heading {} vs {}",
                    row["hdt_heading"],
                    t.true_heading_deg
                );

                if !t.fix_valid {
                    lost_rows += 1;
                    for k2 in ["rmc_lat", "gga_lat", "gns_lat", "rmc_sog_kn", "vtg_cog"] {
                        assert!(row.get(k2).is_none(), "{ctx}: {k2} present without a fix");
                    }
                    continue;
                }
                let (la, lo) = (t.reported_lat_deg.unwrap(), t.reported_lon_deg.unwrap());
                let (sog, cog) = (t.reported_sog_kn.unwrap(), t.reported_cog_deg.unwrap());
                for p in ["rmc", "gga", "gns"] {
                    within(
                        num(row, &format!("{p}_lat")),
                        la,
                        TOL_LATLON_DEG,
                        &format!("{p} latitude"),
                    );
                    within(
                        num(row, &format!("{p}_lon")),
                        lo,
                        TOL_LATLON_DEG,
                        &format!("{p} longitude"),
                    );
                }
                within(num(row, "rmc_sog_kn"), sog, TOL_SOG_KN, "RMC SOG");
                within(num(row, "vtg_sog_kn"), sog, TOL_SOG_KN, "VTG SOG kn");
                within(
                    num(row, "vtg_sog_kmh"),
                    sog * 1.852,
                    TOL_SOG_KMH,
                    "VTG SOG km/h",
                );
                for k2 in ["rmc_cog", "vtg_cog"] {
                    assert!(
                        circ(num(row, k2), cog) <= TOL_COG_DEG,
                        "{ctx}: {k2} {} vs {cog}",
                        row[k2]
                    );
                }
            }
        }
    }
    assert_eq!(rows_checked, 1148, "decoded epochs compared");
    assert!(lost_rows > 0, "the lost-fix path was never exercised");
    assert!(sentences > 200_000, "{sentences}");
}
