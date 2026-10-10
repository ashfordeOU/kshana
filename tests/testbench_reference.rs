// SPDX-License-Identifier: AGPL-3.0-only
//! Independent check of the test-bench export (`kshana bench-export`): its Earth-fixed,
//! geodetic and local-velocity columns, its attitude columns and its NMEA output, against
//! implementations that share no code or authors with kshana.
//!
//! Oracles (dev-only, run by `scripts/gen_testbench_ref.py`, not by CI; CI reads the committed
//! `tests/fixtures/testbench/reference.json`): pyproj / PROJ (geodetic to Earth-fixed
//! conversions and the topocentric rotation), geographiclib (geodesic distance), pynmea2
//! (NMEA checksum validation and decoding) and scipy `Rotation` (quaternion to yaw-pitch-roll).
//! Inputs are synthetic: the bundled `automotive-urban-canyon`, `gnss-ins`, `jamming-demo` and
//! `gnss-sim-raim` scenarios.
//!
//! ## Tolerances are registered here, before the first comparison run
//!
//! Each is the worst-case rounding the writer applies (CSV: Earth-fixed position, height and
//! velocity to 4 decimals, latitude and longitude to 9, angles to 6; NMEA: position to 1e-6
//! arc-minute, height and speed to 3 decimals, course to 3 decimals), summed over the
//! quantities that enter the comparison, then rounded up. None is loosened after a result is
//! seen; a failure is reported as a number, not tuned. See the constants below.
//!
//! ## What is externally checked, stated narrowly
//!
//! * The Earth-fixed position columns equal the oracle's WGS 84 conversion of the geodetic
//!   columns, and the geodetic columns equal the oracle's inverse conversion of the
//!   Earth-fixed columns, on every CSV row (worst case recorded) and on the stored rows.
//! * The Earth-fixed velocity columns, rotated to north-east-down by PROJ's topocentric
//!   operation, equal the engine's true north-east-down velocity.
//! * heading, pitch and roll equal scipy's yaw-pitch-roll of the engine's true quaternion.
//! * Every NMEA sentence parses in pynmea2 with a valid checksum, and the decoded position,
//!   height, speed, course and time equal the motion values.
//! * The CSV `utc` column equals independent date-time arithmetic from the epoch.
//!
//! ## What is not
//!
//! The scenarios' truth trajectory itself (the driving profile and its integration), the
//! choice of conventions (heading is the body yaw, not the course), whether any simulator
//! reads these files as intended, and any simulator or receiver performance. The oracles check
//! conversions and encodings, not the physics of the scenario.
//!
//! PIN-SCOPE:    the SHA-256 of the exact `.motion.csv` and `.nmea` bytes of each scenario's
//!               default-epoch export, so the oracle results apply to those bytes
//! PIN-EXCLUDES: the other export files (`.motion.json`, waypoints, events), which carry no
//!               number the oracles check

use kshana::fusion::pack::{truth_trajectory, GnssInsScenario};
use kshana::interop::testbench::{export, read_motion_csv};
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::PathBuf;

/// Earth-fixed position, 3-D, metres: 5e-5 per axis rounding (x sqrt 3) + latitude and
/// longitude 5e-10 deg (5.6e-5 m each) + height 5e-5.
const TOL_ECEF_M: f64 = 3.0e-4;
/// Latitude and longitude, degrees: 5e-10 rounding + 4.5e-10 from 5e-5 m of Earth-fixed rounding.
const TOL_LATLON_DEG: f64 = 2.0e-9;
/// Height, metres: Earth-fixed rounding (x sqrt 3) + height rounding.
const TOL_HEIGHT_M: f64 = 3.0e-4;
/// North-east-down velocity, m/s per component: 5e-5 per axis rounding (x sqrt 3).
const TOL_VNED_M_S: f64 = 2.0e-4;
/// Heading, pitch, roll, degrees: 5e-7 rounding.
const TOL_ANGLE_DEG: f64 = 1.0e-6;
/// CSV `utc` column against date-time arithmetic, seconds.
const TOL_UTC_S: f64 = 1.0e-3;
/// NMEA horizontal position, metres (the writer's published tolerance).
const TOL_NMEA_HORIZ_M: f64 = 5.0e-3;
/// NMEA height, metres.
const TOL_NMEA_HEIGHT_M: f64 = 1.0e-3;
/// NMEA speed over ground, knots.
const TOL_NMEA_SPEED_KN: f64 = 1.0e-3;
/// NMEA course over ground, degrees.
const TOL_NMEA_COURSE_DEG: f64 = 1.0e-3;
/// NMEA time against the CSV `utc` column, seconds.
const TOL_NMEA_TIME_S: f64 = 1.0e-3;
/// The engine's true quaternion now against the one the oracle was given, per component.
const TOL_TRUTH_Q: f64 = 1.0e-12;
/// Below this speed (m/s) the writer leaves the course empty.
const COURSE_MIN_SPEED_M_S: f64 = 0.05;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn fixture(name: &str) -> Value {
    let p = root().join("tests/fixtures/testbench").join(name);
    let text = std::fs::read_to_string(&p).unwrap_or_else(|e| {
        panic!(
            "read {}: {e}; run scripts/gen_testbench_ref.py (see its header)",
            p.display()
        )
    });
    serde_json::from_str(&text).expect("fixture parses")
}

fn f(v: &Value) -> f64 {
    v.as_f64().expect("number")
}

fn arr3(v: &Value) -> [f64; 3] {
    [f(&v[0]), f(&v[1]), f(&v[2])]
}

fn sha(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

fn wrap180(a: f64) -> f64 {
    (a + 180.0).rem_euclid(360.0) - 180.0
}

/// One scenario's export, read back: the CSV and NMEA bytes and the samples.
struct Exported {
    csv: Vec<u8>,
    nmea: Vec<u8>,
    samples: Vec<kshana::interop::testbench::MotionSample>,
}

fn exported(scenario: &str) -> Exported {
    let src = std::fs::read_to_string(root().join("scenarios").join(scenario)).unwrap();
    let files = export(&src, None).expect("export");
    let get = |suffix: &str| {
        files
            .iter()
            .find(|x| x.suffix == suffix)
            .unwrap_or_else(|| panic!("{scenario}: no {suffix}"))
            .bytes
            .clone()
    };
    let csv = get(".motion.csv");
    let nmea = get(".nmea");
    let samples = read_motion_csv(std::str::from_utf8(&csv).unwrap()).expect("csv reads");
    Exported { csv, nmea, samples }
}

fn reference() -> Value {
    fixture("reference.json")
}

fn scenarios(r: &Value) -> Vec<(String, Value)> {
    let m = r["scenarios"].as_object().expect("scenarios");
    // An empty scan is not a green: all four synthetic scenarios, including the urban canyon.
    assert_eq!(m.len(), 4, "scenarios in reference.json");
    assert!(m.contains_key("automotive-urban-canyon.toml"));
    m.iter().map(|(k, v)| (k.clone(), v.clone())).collect()
}

#[test]
fn oracle_versions_are_the_pinned_ones() {
    let r = reference();
    let o = &r["oracles"];
    assert_eq!(o["pyproj"], "3.8.0");
    assert_eq!(o["geographiclib"], "2.1");
    assert_eq!(o["scipy"], "1.18.1");
    assert_eq!(o["pynmea2"], "1.19.0");
    assert!(o["numpy"].as_str().is_some());
}

#[test]
fn the_oracles_checked_exactly_these_export_bytes() {
    let r = reference();
    for (name, s) in scenarios(&r) {
        let e = exported(&name);
        assert_eq!(sha(&e.csv), s["csv_sha256"], "{name}: motion.csv changed");
        assert_eq!(sha(&e.nmea), s["nmea_sha256"], "{name}: nmea changed");
        assert_eq!(
            e.samples.len() as u64,
            s["samples"].as_u64().unwrap(),
            "{name}"
        );
    }
}

#[test]
fn worst_case_over_every_row_is_inside_the_registered_tolerances() {
    let r = reference();
    for (name, s) in scenarios(&r) {
        let m = &s["max_over_every_row"];
        let n = s["samples"].as_u64().unwrap();
        assert!(n > 100, "{name}: {n} samples");
        assert_eq!(s["nmea_sentences"].as_u64().unwrap(), 2 * n, "{name}");
        assert_eq!(
            m["nmea_checksum_failures"], 0,
            "{name}: pynmea2 checksum failures"
        );
        assert_eq!(m["nmea_stationary_courses_present"], 0, "{name}");
        let chk = |key: &str, tol: f64| {
            let v = f(&m[key]);
            assert!(v <= tol, "{name}: {key} = {v:e} exceeds {tol:e}");
        };
        chk("ecef_vs_forward_m", TOL_ECEF_M);
        chk("latlon_vs_inverse_deg", TOL_LATLON_DEG);
        chk("h_vs_inverse_m", TOL_HEIGHT_M);
        chk("utc_s", TOL_UTC_S);
        chk("nmea_horizontal_m", TOL_NMEA_HORIZ_M);
        chk("nmea_height_m", TOL_NMEA_HEIGHT_M);
        chk("nmea_time_s", TOL_NMEA_TIME_S);
        chk("nmea_speed_kn", TOL_NMEA_SPEED_KN);
    }
}

#[test]
fn position_columns_agree_with_the_oracle_conversions() {
    let r = reference();
    let mut rows = 0;
    for (name, s) in scenarios(&r) {
        let e = exported(&name);
        for row in s["rows"].as_array().unwrap() {
            let i = row["i"].as_u64().unwrap() as usize;
            let m = &e.samples[i];
            let fwd = arr3(&row["ecef_forward_m"]);
            let d = (0..3)
                .map(|k| (m.ecef_m[k] - fwd[k]).powi(2))
                .sum::<f64>()
                .sqrt();
            assert!(
                d <= TOL_ECEF_M,
                "{name} row {i}: Earth-fixed differs {d:e} m"
            );
            let inv = arr3(&row["geodetic_inverse_deg_deg_m"]);
            assert!(
                (m.lat_deg - inv[0]).abs() <= TOL_LATLON_DEG,
                "{name} row {i}: latitude"
            );
            assert!(
                (m.lon_deg - inv[1]).abs() <= TOL_LATLON_DEG,
                "{name} row {i}: longitude"
            );
            assert!(
                (m.h_m - inv[2]).abs() <= TOL_HEIGHT_M,
                "{name} row {i}: height"
            );
            rows += 1;
        }
    }
    assert!(rows > 100, "{rows} rows compared");
}

#[test]
fn local_velocity_matches_the_engines_true_north_east_down_velocity() {
    let r = reference();
    let mut rows = 0;
    for (name, s) in scenarios(&r) {
        let src = std::fs::read_to_string(root().join("scenarios").join(&name)).unwrap();
        let truth = if s["kind"] == "gnss-ins" {
            let scn: GnssInsScenario = toml::from_str(&src).unwrap();
            Some(truth_trajectory(&scn))
        } else {
            None
        };
        for row in s["rows"].as_array().unwrap() {
            let i = row["i"].as_u64().unwrap() as usize;
            let got = arr3(&row["v_ned_from_csv_velocity_m_s"]);
            let want = truth.as_ref().map_or([0.0; 3], |t| t[i].1.v_ned);
            for k in 0..3 {
                assert!(
                    (got[k] - want[k]).abs() <= TOL_VNED_M_S,
                    "{name} row {i} component {k}: oracle {} vs true {}",
                    got[k],
                    want[k]
                );
            }
            rows += 1;
        }
    }
    assert!(rows > 100, "{rows} rows compared");
}

#[test]
fn attitude_columns_match_scipys_euler_angles_of_the_true_quaternion() {
    let r = reference();
    let t = fixture("truth.json");
    let mut rows = 0;
    for (name, s) in scenarios(&r) {
        if s["kind"] != "gnss-ins" {
            continue;
        }
        let e = exported(&name);
        let src = std::fs::read_to_string(root().join("scenarios").join(&name)).unwrap();
        let scn: GnssInsScenario = toml::from_str(&src).unwrap();
        let truth = truth_trajectory(&scn);
        for row in s["rows"].as_array().unwrap() {
            let i = row["i"].as_u64().unwrap() as usize;
            // The quaternion the oracle was given is the engine's true quaternion now.
            let tr = t["scenarios"][&name]["rows"]
                .as_array()
                .unwrap()
                .iter()
                .find(|x| x["i"].as_u64() == Some(i as u64))
                .expect("truth row");
            let q = &truth[i].1.q;
            let given = [
                f(&tr["q_wxyz"][0]),
                f(&tr["q_wxyz"][1]),
                f(&tr["q_wxyz"][2]),
                f(&tr["q_wxyz"][3]),
            ];
            for (a, b) in given.iter().zip([q.w, q.x, q.y, q.z]) {
                assert!(
                    (a - b).abs() <= TOL_TRUTH_Q,
                    "{name} row {i}: truth.json is stale"
                );
            }
            let eu = arr3(&row["euler_zyx_deg"]);
            let m = &e.samples[i];
            assert!(
                wrap180(m.heading_deg - eu[0]).abs() <= TOL_ANGLE_DEG,
                "{name} row {i}: heading"
            );
            assert!(
                (m.pitch_deg - eu[1]).abs() <= TOL_ANGLE_DEG,
                "{name} row {i}: pitch"
            );
            assert!(
                (m.roll_deg - eu[2]).abs() <= TOL_ANGLE_DEG,
                "{name} row {i}: roll"
            );
            rows += 1;
        }
    }
    assert!(rows > 50, "{rows} rows compared");
}

#[test]
fn nmea_decoded_by_pynmea2_matches_the_motion() {
    let r = reference();
    let mut rows = 0;
    let mut courses = 0;
    for (name, s) in scenarios(&r) {
        let e = exported(&name);
        for row in s["rows"].as_array().unwrap() {
            let i = row["i"].as_u64().unwrap() as usize;
            let m = &e.samples[i];
            let n = &row["nmea"];
            let dlat = (f(&n["lat_deg"]) - m.lat_deg).to_radians() * 6_378_137.0;
            let dlon = (f(&n["lon_deg"]) - m.lon_deg).to_radians()
                * 6_378_137.0
                * m.lat_deg.to_radians().cos();
            assert!(
                dlat.hypot(dlon) <= TOL_NMEA_HORIZ_M,
                "{name} row {i}: position"
            );
            let h = f(&n["alt_m"]) + f(&n["geo_sep_m"]);
            assert!(
                (h - m.h_m).abs() <= TOL_NMEA_HEIGHT_M,
                "{name} row {i}: height"
            );
            if let Some(want) = row.get("speed_from_truth_kn") {
                assert!(
                    (f(&n["speed_kn"]) - f(want)).abs() <= TOL_NMEA_SPEED_KN,
                    "{name} row {i}: speed"
                );
                let speed_m_s = f(want) * 1852.0 / 3600.0;
                if speed_m_s >= COURSE_MIN_SPEED_M_S {
                    let got = f(&n["course_deg"]);
                    let want = f(&row["course_from_truth_deg"]);
                    assert!(
                        wrap180(got - want).abs() <= TOL_NMEA_COURSE_DEG,
                        "{name} row {i}: course {got} vs {want}"
                    );
                    courses += 1;
                }
            } else {
                // Stationary scenarios: no speed, no course.
                assert!(
                    f(&n["speed_kn"]).abs() <= TOL_NMEA_SPEED_KN,
                    "{name} row {i}"
                );
                assert!(
                    n["course_deg"].is_null(),
                    "{name} row {i}: stationary course"
                );
            }
            rows += 1;
        }
    }
    assert!(rows > 100, "{rows} rows compared");
    assert!(courses > 50, "{courses} courses compared");
}
