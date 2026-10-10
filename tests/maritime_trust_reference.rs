// SPDX-License-Identifier: AGPL-3.0-only
//! The arithmetic the maritime trust monitors rest on, against independent oracles.
//!
//! `scripts/gen_maritime_trust_ref.py` runs `pynmea2` 1.19.0 (NMEA decoding), `geographiclib` 2.1
//! (geodesic distance and azimuth) and `numpy` (medians, standard deviations) on the synthetic
//! NMEA text in `tests/fixtures/maritime_trust/` (written by
//! `examples/gen_maritime_trust_ref_inputs.rs`) and a clean-room Python re-implementation of the
//! score written from the documentation only, and writes `reference.json`. These tests compare
//! this crate's output with it.
//!
//! The tolerances below were registered in `tests/fixtures/maritime_trust/PREREGISTRATION.md`
//! before the first comparison run and are not changed after seeing results.
//!
//! WHAT IS CHECKED: decoding of GGA, RMC, VTG, HDT, VHW, VBW, ZDA and GSV (T1); the east-north
//! offset between fixes as distance and bearing against the WGS84 geodesic (T2); the kinematic
//! monitor's input statistics, the heading-versus-course, speed-log and sea-level residuals and
//! the C/N0 spread and rise (T3, T4); the score aggregation against a clean-room reading of its
//! documented rule (T5).
//! WHAT IS NOT: the windows, allowances, thresholds, weights and band edges are this project's own
//! rules, reproduced in Python from the same documentation; THS and ROT have no oracle; the
//! talker-and-number to satellite-id table is this project's own (only the number, the talker and
//! the signal-to-noise are compared).

use std::collections::BTreeMap;

use kshana::receiver_trust::ingest::read_nmea;
use kshana::receiver_trust::maritime::en_offset_m;
use kshana::receiver_trust::monitors::{run_monitors, Monitor, MonitorConfig, TrustState};
use kshana::receiver_trust::platform::{PlatformCfg, PlatformKind};
use kshana::receiver_trust::score::{score_from_ratios, ScoreCfg};
use serde_json::Value;

const REFERENCE: &str = include_str!("fixtures/maritime_trust/reference.json");

// ---- pre-registered tolerances (PREREGISTRATION.md) -------------------------------------------
const TOL_ANGLE_DEG: f64 = 1e-9; // T1 latitude, longitude, course, heading
const TOL_FIELD: f64 = 1e-9; // T1 altitude, separation, HDOP, speeds, signal-to-noise
const TOL_TIME_S: f64 = 1e-6; // T1 time of day
const TOL_DIST_M: f64 = 0.01; // T2 distance, baselines up to 2 km
const TOL_BEARING_DEG: f64 = 0.001; // T2 bearing
const TOL_SPEED_MPS: f64 = 0.005; // T3
const TOL_RESID_M: f64 = 0.02; // T3
const TOL_ACCEL: f64 = 0.0005; // T3 m/s^2
const TOL_TURN_DPS: f64 = 0.001; // T3
const TOL_T4: f64 = 1e-6; // T4 residual medians, C/N0 spread and rise
const TOL_POINTS: f64 = 1e-9; // T5

fn reference() -> Value {
    serde_json::from_str(REFERENCE).expect("reference.json")
}

fn num(v: &Value) -> Option<f64> {
    v.as_f64()
}

fn input(name: &str) -> String {
    let p = format!(
        "{}/tests/fixtures/maritime_trust/{name}",
        env!("CARGO_MANIFEST_DIR")
    );
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{p}: {e}"))
}

/// Tracks, for a family of comparisons, how many there were, the largest absolute difference and
/// every violation of the registered tolerance (all are collected, so a failure reports its numbers
/// in full).
#[derive(Default)]
struct Worst {
    seen: BTreeMap<&'static str, (f64, usize)>,
    violations: Vec<String>,
}

impl Worst {
    fn check(&mut self, what: &'static str, ours: f64, oracle: f64, tol: f64, ctx: &str) {
        let d = (ours - oracle).abs();
        let e = self.seen.entry(what).or_insert((0.0, 0));
        e.0 = e.0.max(d);
        e.1 += 1;
        if d > tol || d.is_nan() {
            self.violations.push(format!(
                "{what} {ctx}: ours {ours} oracle {oracle} differ by {d:e} > {tol:e}"
            ));
        }
    }

    fn opt(&mut self, what: &'static str, ours: Option<f64>, oracle: &Value, tol: f64, ctx: &str) {
        match (ours, num(oracle)) {
            (Some(a), Some(b)) => self.check(what, a, b, tol, ctx),
            (None, None) => {}
            (a, b) => self
                .violations
                .push(format!("{what} {ctx}: ours {a:?} oracle {b:?}")),
        }
    }

    /// An angle in degrees, compared modulo 360 (`360.0` and `0.0` are the same course).
    fn opt_angle(
        &mut self,
        what: &'static str,
        ours: Option<f64>,
        oracle: &Value,
        tol: f64,
        ctx: &str,
    ) {
        match (ours, num(oracle)) {
            (Some(a), Some(b)) => {
                let d = (a - b + 540.0).rem_euclid(360.0) - 180.0;
                self.check(what, d, 0.0, tol, ctx);
            }
            (None, None) => {}
            (a, b) => self
                .violations
                .push(format!("{what} {ctx}: ours {a:?} oracle {b:?}")),
        }
    }

    /// Print the largest difference of each family, then fail if any comparison violated its
    /// registered tolerance.
    fn finish(&self) {
        for (k, (max, n)) in &self.seen {
            println!("{k}: {n} comparisons, largest difference {max:e}");
        }
        assert!(
            self.violations.is_empty(),
            "{} violation(s); worst first of {}:\n{}",
            self.violations.len(),
            self.violations.len(),
            self.violations
                .iter()
                .take(8)
                .cloned()
                .collect::<Vec<_>>()
                .join("\n")
        );
    }
}

#[test]
fn t1_nmea_decoding_matches_pynmea2() {
    let r = reference();
    let mut w = Worst::default();
    let files = r["decode"].as_object().unwrap();
    assert!(files.len() >= 8);
    for (name, recs) in files {
        let tl = read_nmea(&input(name)).unwrap();
        assert_eq!(tl.skipped_records, 0, "{name}");
        let recs = recs.as_array().unwrap();
        assert_eq!(tl.epochs.len(), recs.len(), "{name}: epoch count");
        for (i, (e, o)) in tl.epochs.iter().zip(recs).enumerate() {
            let ctx = format!("{name} epoch {i}");
            w.check(
                "time of day",
                e.t_s,
                o["t_s"].as_f64().unwrap(),
                TOL_TIME_S,
                &ctx,
            );
            // The time label: the full ISO stamp when the log carried a date, else the time alone.
            let label = e.time_label.clone().unwrap();
            match o["iso"].as_str() {
                Some(iso) => assert_eq!(label, iso, "{ctx}"),
                None => {
                    let ms = o["tod_ms"].as_i64().unwrap();
                    let want = format!(
                        "{:02}:{:02}:{:02}.{:03}",
                        ms / 3_600_000,
                        ms / 60_000 % 60,
                        ms / 1000 % 60,
                        ms % 1000
                    );
                    assert!(label.starts_with(&want), "{ctx}: {label} vs {want}");
                }
            }
            let f = e.fix.expect("fix");
            let m = e.marine.as_ref().expect("marine");
            w.check(
                "latitude",
                f.lat_deg,
                o["lat"].as_f64().unwrap(),
                TOL_ANGLE_DEG,
                &ctx,
            );
            w.check(
                "longitude",
                f.lon_deg,
                o["lon"].as_f64().unwrap(),
                TOL_ANGLE_DEG,
                &ctx,
            );
            let (alt, sep) = (o["alt"].as_f64().unwrap(), o["geo_sep"].as_f64().unwrap());
            w.check("height", f.height_m, alt + sep, TOL_FIELD, &ctx);
            w.opt("altitude", m.alt_msl_m, &o["alt"], TOL_FIELD, &ctx);
            w.opt(
                "geoid separation",
                m.geoid_sep_m,
                &o["geo_sep"],
                TOL_FIELD,
                &ctx,
            );
            w.opt("hdop", m.hdop, &o["hdop"], TOL_FIELD, &ctx);
            assert_eq!(f.n_used, o["n_used"].as_u64().map(|n| n as u32), "{ctx}");
            assert_eq!(m.fix_valid, o["fix_valid"].as_bool(), "{ctx}");
            w.opt("speed over ground", m.sog_kn, &o["sog"], TOL_FIELD, &ctx);
            w.opt_angle(
                "course over ground",
                m.cog_deg,
                &o["cog"],
                TOL_ANGLE_DEG,
                &ctx,
            );
            w.opt_angle("heading", m.heading_deg, &o["heading"], TOL_ANGLE_DEG, &ctx);
            w.opt(
                "speed through the water",
                m.stw_kn,
                &o["stw"],
                TOL_FIELD,
                &ctx,
            );
            // Signal-to-noise: constellation letter, satellite number and value, as a set.
            let mut got: Vec<(String, u32, f64)> = e
                .cn0
                .iter()
                .map(|c| {
                    (
                        c.sat[..1].to_string(),
                        c.sat[1..].parse().unwrap(),
                        c.cn0_dbhz,
                    )
                })
                .collect();
            got.sort_by(|a, b| (&a.0, a.1).cmp(&(&b.0, b.1)));
            let want: Vec<(String, u32, f64)> = o["gsv"]
                .as_array()
                .unwrap()
                .iter()
                .map(|g| {
                    (
                        g[0].as_str().unwrap().to_string(),
                        g[1].as_u64().unwrap() as u32,
                        g[2].as_f64().unwrap(),
                    )
                })
                .collect();
            assert_eq!(got.len(), want.len(), "{ctx}: satellites");
            for (a, b) in got.iter().zip(&want) {
                assert_eq!((&a.0, a.1), (&b.0, b.1), "{ctx}");
                w.check("signal-to-noise", a.2, b.2, TOL_FIELD, &ctx);
            }
        }
    }
    w.finish();
}

#[test]
fn t2_east_north_offsets_match_the_wgs84_geodesic() {
    let r = reference();
    let mut w = Worst::default();
    let pairs = r["geodesy"].as_array().unwrap();
    assert!(pairs.len() >= 200);
    let (mut lat_min, mut lat_max, mut dist_max) = (f64::MAX, f64::MIN, 0.0_f64);
    let mut fwd_worst = 0.0_f64;
    for p in pairs {
        let c: Vec<f64> = p["p"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_f64().unwrap())
            .collect();
        let (e, n) = en_offset_m(c[0], c[1], c[2], c[3]);
        let dist = e.hypot(n);
        let bearing = e.atan2(n).to_degrees().rem_euclid(360.0);
        let ctx = format!("{} gap {} {:?}", p["file"], p["gap"], c);
        w.check(
            "distance",
            dist,
            p["s12"].as_f64().unwrap(),
            TOL_DIST_M,
            &ctx,
        );
        // The direction of the chord between the fixes is the geodesic's mean azimuth (amendment 3 in
        // PREREGISTRATION.md); the forward azimuth at the first fix differs from it by about half the
        // convergence of the meridians.
        let d = (bearing - p["azi_mean"].as_f64().unwrap() + 540.0).rem_euclid(360.0) - 180.0;
        w.check("bearing", d, 0.0, TOL_BEARING_DEG, &ctx);
        // Recorded, not pre-registered: the forward azimuth at the first fix, which is NOT the
        // quantity compared above (amendment 3 in PREREGISTRATION.md). A descriptive bound at the
        // level of half the convergence of the meridians over these baselines, kept executable so
        // the record of the original comparison stays true.
        let d_fwd = (bearing - p["azi1"].as_f64().unwrap() + 540.0).rem_euclid(360.0) - 180.0;
        assert!(
            d_fwd.abs() < 0.01,
            "descriptive: bearing vs forward azimuth {d_fwd} {ctx}"
        );
        fwd_worst = fwd_worst.max(d_fwd.abs());
        lat_min = lat_min.min(c[0]);
        lat_max = lat_max.max(c[0]);
        dist_max = dist_max.max(p["s12"].as_f64().unwrap());
    }
    println!("descriptive: bearing against the forward azimuth at the first fix, largest difference {fwd_worst:e} degrees");
    // The registered scope: -45 to 70 degrees, baselines up to 2 km, across the antimeridian.
    assert!(lat_min < -44.0 && lat_max > 69.0, "{lat_min} {lat_max}");
    assert!(dist_max > 1500.0 && dist_max <= 2000.0, "{dist_max}");
    assert!(pairs.iter().any(|p| p["file"] == "antimeridian.nmea"
        && p["p"][1].as_f64().unwrap() > 179.0
        && p["p"][3].as_f64().unwrap() < -179.0));
    w.finish();
}

fn vessel() -> MonitorConfig {
    MonitorConfig {
        platform: PlatformCfg {
            kind: PlatformKind::Vessel,
            antenna_height_m: Some(18.0),
            heading_sensor: true,
            ..Default::default()
        },
        ..MonitorConfig::default()
    }
}

#[test]
fn t3_t4_monitor_input_statistics_match_the_oracle() {
    let r = reference();
    let tl = read_nmea(&input("voyage.nmea")).unwrap();
    let res = run_monitors(&tl, None, &vessel()).unwrap();
    let mut w = Worst::default();
    let stats = r["stats"].as_array().unwrap();
    assert!(stats.len() > 300);
    let (mut spread, mut rise, mut turn) = (0, 0, 0);
    for o in stats {
        let t = o["t_s"].as_f64().unwrap();
        let e = res.epochs.iter().find(|e| e.t_s == t).expect("epoch");
        let s = &e.marine.as_ref().expect("marine").stats;
        let ctx = format!("t = {t}");
        w.opt(
            "implied speed",
            s.kin_speed_mps,
            &o["kin_speed_mps"],
            TOL_SPEED_MPS,
            &ctx,
        );
        w.opt(
            "dead-reckoning residual",
            s.kin_resid_m,
            &o["kin_resid_m"],
            TOL_RESID_M,
            &ctx,
        );
        w.opt(
            "implied acceleration",
            s.kin_accel_mps2,
            &o["kin_accel_mps2"],
            TOL_ACCEL,
            &ctx,
        );
        w.opt(
            "implied turn rate",
            s.kin_turn_dps,
            &o["kin_turn_dps"],
            TOL_TURN_DPS,
            &ctx,
        );
        w.opt(
            "heading against course",
            s.hdg_cog_deg,
            &o["hdg_cog_deg"],
            TOL_T4,
            &ctx,
        );
        w.opt(
            "speed log against ground speed",
            s.stw_sog_kn,
            &o["stw_sog_kn"],
            TOL_T4,
            &ctx,
        );
        w.opt("sea level", s.sea_level_m, &o["sea_level_m"], TOL_T4, &ctx);
        w.opt(
            "C/N0 spread",
            s.cn0_spread_db,
            &o["cn0_spread_db"],
            TOL_T4,
            &ctx,
        );
        w.opt("C/N0 rise", s.cn0_rise_db, &o["cn0_rise_db"], TOL_T4, &ctx);
        spread += usize::from(s.cn0_spread_db.is_some());
        rise += usize::from(s.cn0_rise_db.is_some());
        turn += usize::from(s.kin_turn_dps.is_some());
    }
    // The comparisons are not vacuous: the statistics exist at many epochs.
    assert!(
        spread > 60 && rise > 60 && turn > 300,
        "{spread} {rise} {turn}"
    );
    w.finish();
}

#[test]
fn t5_score_matches_the_clean_room_reading_of_the_documented_rule() {
    let r = reference();
    let cfg = ScoreCfg::default();
    let mut w = Worst::default();
    let cases = r["score"].as_array().unwrap();
    assert!(cases.len() >= 600);
    let mut bands = BTreeMap::new();
    for (i, c) in cases.iter().enumerate() {
        let ratios: BTreeMap<Monitor, f64> = c["ratios"]
            .as_object()
            .unwrap()
            .iter()
            .map(|(k, v)| {
                (
                    serde_json::from_value::<Monitor>(Value::String(k.clone())).expect(k),
                    v.as_f64().unwrap(),
                )
            })
            .collect();
        let ours = score_from_ratios(&ratios, &cfg);
        let ctx = format!("case {i}");
        w.check(
            "score",
            ours.score,
            c["score"].as_f64().unwrap(),
            TOL_POINTS,
            &ctx,
        );
        let band = match ours.band {
            TrustState::Nominal => "nominal",
            TrustState::Degraded => "degraded",
            TrustState::Untrusted => "untrusted",
            TrustState::Calibrating => "calibrating",
        };
        assert_eq!(band, c["band"].as_str().unwrap(), "{ctx}");
        *bands.entry(band).or_insert(0) += 1;
        let want = c["deductions"].as_array().unwrap();
        assert_eq!(ours.deductions.len(), want.len(), "{ctx}");
        for (a, b) in ours.deductions.iter().zip(want) {
            let name = serde_json::to_value(a.monitor).unwrap();
            if name != b["monitor"] {
                w.violations.push(format!(
                    "{ctx}: order of deductions: ours {name} oracle {}",
                    b["monitor"]
                ));
            }
            w.check(
                "points",
                a.points,
                b["points"].as_f64().unwrap(),
                TOL_POINTS,
                &ctx,
            );
            w.check(
                "ratio",
                a.ratio,
                b["ratio"].as_f64().unwrap(),
                TOL_POINTS,
                &ctx,
            );
        }
    }
    // All three bands are exercised.
    assert!(
        bands.len() == 3 && bands.values().all(|n| *n >= 20),
        "{bands:?}"
    );
    w.finish();
}
