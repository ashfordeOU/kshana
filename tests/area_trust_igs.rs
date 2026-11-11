// SPDX-License-Identifier: AGPL-3.0-only
//! B5 bar T4 (0.41): false area alerts on clean public IGS data, by the readings fixed in
//! `xval/area-trust/README.md` (8 to 12) before the data were analysed. The files are fetched by
//! `xval/area-trust/fetch.sh <dir>` and never vendored, so this test is ignored by default:
//!
//! ```text
//! bash xval/area-trust/fetch.sh /path/to/b5
//! KSHANA_B5_DIR=/path/to/b5 cargo test --release --test area_trust_igs -- --ignored --nocapture
//! ```
//!
//! It prints the per-station calibration, the alarm counts by monitor, the alerts per scored day and the
//! verdict against the bars (DEGRADED or worse ≤ 1 per area-day, UNTRUSTED ≤ 0.1 per area-day), and writes
//! `t4_result.json` into the data directory. The scored result is `xval/area-trust/t4_result.json`
//! (engine at b29f90041); today's engine reproduces `xval/area-trust/t4_result_after_nav_fix.json`.

use flate2::read::GzDecoder;
use kshana::area_trust::{
    h_s, station_state, timeline, AreaState, Station, StationEvidence, StationState,
};
use kshana::frames::{ecef_to_geodetic, look_angles};
use kshana::gnss_sim::Meteo;
use kshana::ppp_real::enu_error;
use kshana::pvt::{
    assemble_epoch, klobuchar_from_nav_header, select_ephemeris, solve_spp, AtmosModel,
};
use kshana::rinex::parse_nav;
use kshana::rinex_obs::parse_obs;
use std::collections::BTreeMap;
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex};
use std::time::Instant;

const STATIONS: [&str; 4] = ["MADR00ESP", "CEBR00ESP", "YEBE00ESP", "VILL00ESP"];
const FIRST_DOY: u32 = 6;
const LAST_DOY: u32 = 19;
const MASK_DEG: f64 = 10.0;
const SATS_LOST: f64 = 4.0;
const CN0_MIN_EL_DEG: f64 = 15.0;

fn gunzip(p: &Path) -> String {
    let mut s = String::new();
    GzDecoder::new(std::fs::File::open(p).unwrap_or_else(|e| panic!("{}: {e}", p.display())))
        .read_to_string(&mut s)
        .unwrap();
    s
}

/// One 30 s epoch of one station: seconds since 2025-01-06 00:00 GPST, horizontal error (None
/// without a fix), the GPS S1C values with their elevations, and the count of GPS satellites with S1C.
struct Raw {
    t: i64,
    err_h: Option<f64>,
    /// East and north error of the fix, m.
    en: Option<[f64; 2]>,
    cn0: Vec<(f64, f64)>,
    tracked: usize,
}

fn median(v: &mut [f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    Some(if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    })
}

fn read_station(dir: &Path, name: &str) -> (Vec<Raw>, [f64; 3]) {
    let mut out = Vec::new();
    let mut p_s = None;
    for doy in FIRST_DOY..=LAST_DOY {
        let obs_text = gunzip(&dir.join(format!("{name}_R_2025{doy:03}0000_01D_30S_MO.rnx.gz")));
        let nav_text = gunzip(&dir.join(format!("BRDC00WRD_R_2025{doy:03}0000_01D_MN.rnx.gz")));
        let obs = parse_obs(&obs_text).unwrap();
        let ephs = parse_nav(&nav_text).unwrap();
        let p = *p_s.get_or_insert_with(|| obs.header.approx_xyz.expect("APPROX POSITION XYZ"));
        let station = ecef_to_geodetic(p);
        let atmos = AtmosModel {
            iono: klobuchar_from_nav_header(&nav_text).unwrap_or_default(),
            meteo: Meteo::default(),
        };
        for (i, ep) in obs.epochs.iter().enumerate() {
            if ep.flag != 0 {
                continue;
            }
            let tm = &ep.time;
            let day = i64::from(tm.day) - 6; // January 2025
            let t = day * 86_400
                + i64::from(tm.hour) * 3600
                + i64::from(tm.minute) * 60
                + tm.second.round() as i64;
            let meas: Vec<_> = assemble_epoch(&obs, i, &ephs, p, &atmos, MASK_DEG, true)
                .into_iter()
                .filter(|(s, _)| s.starts_with('G'))
                .map(|(_, m)| m)
                .collect();
            let en = solve_spp(&meas, p).map(|f| {
                let e = enu_error(p, f.ecef);
                [e[0], e[1]]
            });
            let err_h = en.map(|e| e[0].hypot(e[1]));
            let tow = tm.gps_time_of_week();
            let mut cn0 = Vec::new();
            for sv in &ep.sats {
                if !sv.sat.starts_with('G') {
                    continue;
                }
                let Some(s1c) = obs.observation(i, &sv.sat, "S1C") else {
                    continue;
                };
                let Some(prn) = sv.sat.get(1..3).and_then(|s| s.trim().parse::<u8>().ok()) else {
                    continue;
                };
                let el = select_ephemeris(&ephs, 'G', prn, tow).map(|e| {
                    look_angles(station, e.sv_position_ecef(tow))
                        .el_rad
                        .to_degrees()
                });
                cn0.push((s1c, el.unwrap_or(f64::NAN)));
            }
            let tracked = cn0.len();
            out.push(Raw {
                t,
                err_h,
                en,
                cn0,
                tracked,
            });
        }
    }
    (out, p_s.unwrap())
}

/// A station's calibration on day 006 (reading 11).
struct Cal {
    hs: f64,
    template: BTreeMap<i64, f64>,
    tracked_median: f64,
}

fn calibrate(raw: &[Raw]) -> Cal {
    let cal: Vec<&Raw> = raw.iter().filter(|r| r.t < 86_400).collect();
    let hs = h_s(&cal.iter().filter_map(|r| r.err_h).collect::<Vec<_>>());
    // C/N0 template: the station's median S1C in 5° elevation bins over the calibration day.
    let mut bins: BTreeMap<i64, Vec<f64>> = BTreeMap::new();
    for r in &cal {
        for &(c, el) in &r.cn0 {
            if el.is_finite() && el >= 0.0 {
                bins.entry((el / 5.0).floor() as i64).or_default().push(c);
            }
        }
    }
    let template = bins
        .into_iter()
        .filter_map(|(k, mut v)| median(&mut v).map(|m| (k, m)))
        .collect();
    let tracked_median =
        median(&mut cal.iter().map(|r| r.tracked as f64).collect::<Vec<_>>()).unwrap();
    Cal {
        hs,
        template,
        tracked_median,
    }
}

/// Section 1's evidence of one 30 s epoch (reading 11).
fn evidence(r: &Raw, cal: &Cal) -> StationEvidence {
    let mut d: Vec<f64> = r
        .cn0
        .iter()
        .filter(|(_, el)| *el > CN0_MIN_EL_DEG)
        .filter_map(|&(c, el)| {
            cal.template
                .get(&((el / 5.0).floor() as i64))
                .map(|t| c - t)
        })
        .collect();
    StationEvidence {
        horiz_err_m: r.err_h.unwrap_or(0.0),
        h_s_m: cal.hs,
        cn0_delta_db: median(&mut d).unwrap_or(0.0),
        agc_alarm: false,
        jam_alarm: false,
        lock_alarm: (r.tracked as f64) <= cal.tracked_median - SATS_LOST,
        clock_alarm: false,
        osnma_ok: None,
    }
}

#[derive(Default, serde::Serialize)]
struct StationReport {
    name: String,
    p_s_ecef_m: [f64; 3],
    h_s_m: f64,
    tracked_median: f64,
    epochs: usize,
    scored_epochs: usize,
    no_fix: usize,
    alarms_position: usize,
    alarms_cn0: usize,
    alarms_lock: usize,
    degraded_epochs: usize,
    untrusted_epochs: usize,
    /// Scored epochs without a fix, by GPS hour of day.
    no_fix_by_hour: [usize; 24],
}

#[test]
#[ignore]
fn t4_false_alerts_on_clean_igs_data() {
    let dir = PathBuf::from(
        std::env::var("KSHANA_B5_DIR").expect("KSHANA_B5_DIR: the fetch.sh directory"),
    );
    let cal_end = 86_400i64;
    let mut stations = Vec::new();
    let mut reports = Vec::new();
    for name in STATIONS {
        let (raw, p_s) = read_station(&dir, name);
        let cal = calibrate(&raw);
        let mut rep = StationReport {
            name: name.into(),
            p_s_ecef_m: p_s,
            h_s_m: cal.hs,
            tracked_median: cal.tracked_median,
            ..Default::default()
        };
        let mut epochs = Vec::with_capacity(raw.len() * 30);
        for r in &raw {
            let e = evidence(r, &cal);
            let st = station_state(&e);
            rep.epochs += 1;
            if r.t >= cal_end {
                rep.scored_epochs += 1;
                rep.no_fix += usize::from(r.err_h.is_none());
                if r.err_h.is_none() {
                    rep.no_fix_by_hour[((r.t % 86_400) / 3600) as usize] += 1;
                }
                rep.alarms_position += usize::from(e.horiz_err_m > e.h_s_m);
                rep.alarms_cn0 += usize::from(e.cn0_delta_db < kshana::area_trust::CN0_ALARM_DB);
                rep.alarms_lock += usize::from(e.lock_alarm);
                rep.degraded_epochs += usize::from(st == StationState::Degraded);
                rep.untrusted_epochs += usize::from(st == StationState::Untrusted);
            }
            // Reading 12: a 30 s epoch stands for its 30 grid seconds.
            for k in 0..30 {
                epochs.push(((r.t + k) as f64, st));
            }
        }
        println!(
            "{name}: H_s {:.1} m, tracked median {}, {} scored epochs, no fix {}, alarms position {} C/N0 {} lock {}",
            rep.h_s_m, rep.tracked_median, rep.scored_epochs, rep.no_fix, rep.alarms_position, rep.alarms_cn0, rep.alarms_lock
        );
        stations.push(Station {
            id: name.into(),
            epochs,
        });
        reports.push(rep);
    }
    let tl = timeline(&stations);
    let mut per_day: BTreeMap<i64, (usize, usize)> = BTreeMap::new();
    for d in 1..=13 {
        per_day.insert(d, (0, 0));
    }
    let mut alert_list = Vec::new();
    for s in &tl {
        if s.alert && s.g >= cal_end {
            let day = s.g / 86_400;
            let e = per_day.entry(day).or_default();
            e.0 += 1;
            e.1 += usize::from(s.state == AreaState::Untrusted);
            alert_list.push(serde_json::json!({"g": s.g, "state": s.state, "n": s.n, "n_d": s.n_d, "n_u": s.n_u, "stale": s.stale}));
        }
    }
    let days = per_day.len() as f64;
    let (deg, unt): (usize, usize) = per_day.values().fold((0, 0), |a, b| (a.0 + b.0, a.1 + b.1));
    let unknown_s = tl
        .iter()
        .filter(|s| s.g >= cal_end && s.state == AreaState::Unknown)
        .count();
    let deg_rate = deg as f64 / days;
    let unt_rate = unt as f64 / days;
    let met = deg_rate <= 1.0 && unt_rate <= 0.1;
    println!("per scored day (alerts to DEGRADED or worse, to UNTRUSTED): {per_day:?}");
    println!(
        "T4: {deg} alerts to DEGRADED or worse ({deg_rate:.3} per area-day, bar 1), {unt} to UNTRUSTED ({unt_rate:.3}, bar 0.1); UNKNOWN seconds {unknown_s}: {}",
        if met { "MET" } else { "NOT MET" }
    );
    let result = serde_json::json!({
        "area": STATIONS,
        "scored_days": days,
        "alerts_degraded_or_worse": deg,
        "alerts_untrusted": unt,
        "per_area_day_degraded_or_worse": deg_rate,
        "per_area_day_untrusted": unt_rate,
        "unknown_seconds": unknown_s,
        "per_day": per_day.iter().map(|(d, (a, b))| serde_json::json!({"doy": 6 + d, "degraded_or_worse": a, "untrusted": b})).collect::<Vec<_>>(),
        "alerts": alert_list,
        "stations": reports,
        "verdict": if met { "MET" } else { "NOT MET" },
    });
    let text = serde_json::to_string_pretty(&result).unwrap();
    std::fs::write(dir.join("t4_result.json"), &text).unwrap();
    // The scored result (`t4_result.json`) was written by the engine at b29f90041. The navigation
    // parser fix that followed (887997061) changes it, so today's engine reproduces the
    // supplementary result.
    let committed = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("xval/area-trust/t4_result_after_nav_fix.json");
    assert_eq!(
        text,
        std::fs::read_to_string(committed).unwrap(),
        "the run reproduces the committed supplementary T4 result"
    );
}

// --------------------------------------------------------------------------------- T4, version 2

/// Days from the civil date to 1970-01-01 (proleptic Gregorian).
fn days_from_civil(y: i64, m: i64, d: i64) -> i64 {
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (m + 9) % 12;
    let doy = (153 * mp + 2) / 5 + d - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

/// (year, day of year, navigation file stem).
type V2Day = (i64, u32, String);

/// The v2 fortnight (readings W7, W8): from the committed selection and navigation choice, each day
/// as (year, day of year, navigation file stem), and the four stations.
fn v2_plan() -> (Vec<V2Day>, Vec<String>, (i64, i64, i64)) {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust");
    let sel: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(root.join("selection_v2.json")).unwrap())
            .unwrap();
    let nav: BTreeMap<String, String> = std::fs::read_to_string(root.join("nav_choice_v2.tsv"))
        .unwrap()
        .lines()
        .skip(1)
        .map(|l| {
            let f: Vec<&str> = l.split('\t').collect();
            (f[0].to_string(), f[3].to_string())
        })
        .collect();
    let clusters = sel["clusters"].as_array().unwrap();
    assert_eq!(clusters.len(), 1, "the v2 selection gives one cluster");
    let stations: Vec<String> = clusters[0]
        .as_array()
        .unwrap()
        .iter()
        .map(|v| v.as_str().unwrap().to_string())
        .collect();
    let mut first = None;
    let days = sel["days"]
        .as_array()
        .unwrap()
        .iter()
        .map(|d| {
            let d = d.as_str().unwrap();
            let p: Vec<i64> = d.split('-').map(|x| x.parse().unwrap()).collect();
            first.get_or_insert((p[0], p[1], p[2]));
            let doy = (days_from_civil(p[0], p[1], p[2]) - days_from_civil(p[0], 1, 1) + 1) as u32;
            (p[0], doy, nav[d].clone())
        })
        .collect();
    (days, stations, first.unwrap())
}

/// Reading 11 on the v2 days: as [`read_station`], with time counted from the first selected day at
/// 00:00 GPST and each day's navigation file by B8 reading 8 (`nav_choice_v2.tsv`).
fn read_station_v2(
    dir: &Path,
    name: &str,
    days: &[V2Day],
    first: (i64, i64, i64),
) -> (Vec<Raw>, [f64; 3]) {
    let t0 = (days_from_civil(first.0, first.1, first.2) - days_from_civil(1980, 1, 6)) * 86_400;
    let mut out = Vec::new();
    let mut p_s = None;
    for (year, doy, nav_src) in days {
        let obs_text = gunzip(&dir.join(format!("{name}_R_{year}{doy:03}0000_01D_30S_MO.rnx.gz")));
        let nav_text = gunzip(&dir.join(format!("{nav_src}_{year}{doy:03}0000_01D_MN.rnx.gz")));
        let obs = parse_obs(&obs_text).unwrap();
        let ephs = parse_nav(&nav_text).unwrap();
        let p = *p_s.get_or_insert_with(|| obs.header.approx_xyz.expect("APPROX POSITION XYZ"));
        let station = ecef_to_geodetic(p);
        let atmos = AtmosModel {
            iono: klobuchar_from_nav_header(&nav_text).unwrap_or_default(),
            meteo: Meteo::default(),
        };
        for (i, ep) in obs.epochs.iter().enumerate() {
            if ep.flag != 0 {
                continue;
            }
            let tm = &ep.time;
            let t = tm.seconds_from_gps_epoch().round() as i64 - t0;
            let meas: Vec<_> = assemble_epoch(&obs, i, &ephs, p, &atmos, MASK_DEG, true)
                .into_iter()
                .filter(|(s, _)| s.starts_with('G'))
                .map(|(_, m)| m)
                .collect();
            let en = solve_spp(&meas, p).map(|f| {
                let e = enu_error(p, f.ecef);
                [e[0], e[1]]
            });
            let err_h = en.map(|e| e[0].hypot(e[1]));
            let tow = tm.gps_time_of_week();
            let mut cn0 = Vec::new();
            for sv in &ep.sats {
                if !sv.sat.starts_with('G') {
                    continue;
                }
                let Some(s1c) = obs.observation(i, &sv.sat, "S1C") else {
                    continue;
                };
                let Some(prn) = sv.sat.get(1..3).and_then(|s| s.trim().parse::<u8>().ok()) else {
                    continue;
                };
                let el = select_ephemeris(&ephs, 'G', prn, tow).map(|e| {
                    look_angles(station, e.sv_position_ecef(tow))
                        .el_rad
                        .to_degrees()
                });
                cn0.push((s1c, el.unwrap_or(f64::NAN)));
            }
            let tracked = cn0.len();
            out.push(Raw {
                t,
                err_h,
                en,
                cn0,
                tracked,
            });
        }
    }
    (out, p_s.unwrap())
}

/// B5 v2 T4 (readings W7 to W9): false area alerts on the v2 fortnight under the v2 rule. The files are
/// fetched by `xval/area-trust/fetch_v2.py`; `KSHANA_B5_V2_DIR` names their directory. Writes
/// `t4v2_result.json` there; once `xval/area-trust/t4v2_result.json` is committed, the run must
/// reproduce it.
#[test]
#[ignore]
fn t4v2_false_alerts_on_clean_igs_data() {
    use kshana::area_trust::{timeline_with, AreaRule};
    let dir = PathBuf::from(
        std::env::var("KSHANA_B5_V2_DIR").expect("KSHANA_B5_V2_DIR: the fetch_v2.py directory"),
    );
    let (days, names, first) = v2_plan();
    let cal_end = 86_400i64;
    let scored = days.len() as i64 - 1;
    let mut stations = Vec::new();
    let mut reports = Vec::new();
    for name in &names {
        let (raw, p_s) = read_station_v2(&dir, name, &days, first);
        let cal = calibrate(&raw);
        let mut rep = StationReport {
            name: name.clone(),
            p_s_ecef_m: p_s,
            h_s_m: cal.hs,
            tracked_median: cal.tracked_median,
            ..Default::default()
        };
        let mut epochs = Vec::with_capacity(raw.len() * 30);
        for r in &raw {
            let e = evidence(r, &cal);
            let st = station_state(&e);
            rep.epochs += 1;
            if r.t >= cal_end {
                rep.scored_epochs += 1;
                rep.no_fix += usize::from(r.err_h.is_none());
                if r.err_h.is_none() {
                    rep.no_fix_by_hour[((r.t % 86_400) / 3600) as usize] += 1;
                }
                rep.alarms_position += usize::from(e.horiz_err_m > e.h_s_m);
                rep.alarms_cn0 += usize::from(e.cn0_delta_db < kshana::area_trust::CN0_ALARM_DB);
                rep.alarms_lock += usize::from(e.lock_alarm);
                rep.degraded_epochs += usize::from(st == StationState::Degraded);
                rep.untrusted_epochs += usize::from(st == StationState::Untrusted);
            }
            for k in 0..30 {
                epochs.push(((r.t + k) as f64, st));
            }
        }
        println!(
            "{name}: H_s {:.1} m, tracked median {}, {} scored epochs, no fix {}, alarms position {} C/N0 {} lock {}",
            rep.h_s_m, rep.tracked_median, rep.scored_epochs, rep.no_fix, rep.alarms_position, rep.alarms_cn0, rep.alarms_lock
        );
        stations.push(Station {
            id: name.clone(),
            epochs,
        });
        reports.push(rep);
    }
    let tl = timeline_with(&stations, AreaRule::V2);
    let mut per_day: BTreeMap<i64, (usize, usize)> = BTreeMap::new();
    for d in 1..=scored {
        per_day.insert(d, (0, 0));
    }
    let mut alert_list = Vec::new();
    for s in &tl {
        if s.alert && s.g >= cal_end && s.g < (scored + 1) * 86_400 {
            let day = s.g / 86_400;
            let e = per_day.entry(day).or_default();
            e.0 += 1;
            e.1 += usize::from(s.state == AreaState::Untrusted);
            alert_list.push(serde_json::json!({"g": s.g, "state": s.state, "n": s.n, "n_d": s.n_d, "n_u": s.n_u, "stale": s.stale}));
        }
    }
    let n_days = per_day.len() as f64;
    let (deg, unt): (usize, usize) = per_day.values().fold((0, 0), |a, b| (a.0 + b.0, a.1 + b.1));
    let unknown_s = tl
        .iter()
        .filter(|s| s.g >= cal_end && s.state == AreaState::Unknown)
        .count();
    let deg_rate = deg as f64 / n_days;
    let unt_rate = unt as f64 / n_days;
    let met = deg_rate <= 1.0 && unt_rate <= 0.1;
    println!("per scored day (alerts to DEGRADED or worse, to UNTRUSTED): {per_day:?}");
    println!(
        "T4 v2: {deg} alerts to DEGRADED or worse ({deg_rate:.3} per area-day, bar 1), {unt} to UNTRUSTED ({unt_rate:.3}, bar 0.1); UNKNOWN seconds {unknown_s}: {}",
        if met { "MET" } else { "NOT MET" }
    );
    let result = serde_json::json!({
        "area_rule": "v2",
        "area": names,
        "days": days.iter().map(|(y, d, n)| serde_json::json!({"year": y, "doy": d, "nav": n})).collect::<Vec<_>>(),
        "scored_days": n_days,
        "alerts_degraded_or_worse": deg,
        "alerts_untrusted": unt,
        "per_area_day_degraded_or_worse": deg_rate,
        "per_area_day_untrusted": unt_rate,
        "unknown_seconds": unknown_s,
        "per_day": per_day.iter().map(|(d, (a, b))| serde_json::json!({"day": d, "date_doy": days[*d as usize].1, "degraded_or_worse": a, "untrusted": b})).collect::<Vec<_>>(),
        "alerts": alert_list,
        "stations": reports,
        "verdict": if met { "MET" } else { "NOT MET" },
    });
    let text = serde_json::to_string_pretty(&result).unwrap();
    std::fs::write(dir.join("t4v2_result.json"), &text).unwrap();
    let committed =
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust/t4v2_result.json");
    if committed.exists() {
        assert_eq!(
            text,
            std::fs::read_to_string(committed).unwrap(),
            "the run reproduces the committed v2 T4 result"
        );
    }
}

// ------------------------------------------------------------------------- B5 v3, step 1: diagnosis

/// One GPS satellite in one station's fix: its id, elevation, post-fit residual, the broadcast record
/// in use and the station's horizontal error with that satellite left out.
#[derive(serde::Serialize)]
struct DiagSat {
    sat: String,
    el_deg: f64,
    resid_m: f64,
    iode: f64,
    health: f64,
    toe_age_s: f64,
    ura_m: f64,
    err_h_without_m: Option<f64>,
}

#[derive(serde::Serialize)]
struct DiagStation {
    name: String,
    err_h_m: Option<f64>,
    h_s_m: f64,
    alarmed: bool,
    sats: Vec<DiagSat>,
}

/// One epoch of one station as the diagnosis keeps it: the measurements with their satellite ids and
/// the broadcast record each was computed from.
struct DiagEpoch {
    p: [f64; 3],
    meas: Vec<(String, kshana::pvt::SppMeasurement, [f64; 4])>,
}

/// B5 v3 step 1 (`PREREGISTRATION-v3.md`): on v2's scored data, every scored epoch where at least two
/// stations raise a position alarm, with the satellites each fix used, the residual per satellite, the
/// broadcast record in use (IODE, health, age, URA) and whether leaving one satellite out clears every
/// alarmed station. Also counts, per station, the scored epochs whose fix used a satellite the broadcast
/// record marks unhealthy, and records the tracked counts at v2's loss-of-lock alerts. Reads the v2 files
/// (`KSHANA_B5_V2_DIR`) exactly as `t4v2_false_alerts_on_clean_igs_data` does; writes
/// `v3_diagnosis.json` there.
#[test]
#[ignore]
fn b5v3_diagnosis_of_v2_common_epochs() {
    let dir = PathBuf::from(
        std::env::var("KSHANA_B5_V2_DIR").expect("KSHANA_B5_V2_DIR: the fetch_v2.py directory"),
    );
    let (days, names, first) = v2_plan();
    let t0 = (days_from_civil(first.0, first.1, first.2) - days_from_civil(1980, 1, 6)) * 86_400;
    let mut cals = Vec::new();
    let mut tracked: Vec<BTreeMap<i64, usize>> = Vec::new();
    for name in &names {
        let (raw, _) = read_station_v2(&dir, name, &days, first);
        let cal = calibrate(&raw);
        tracked.push(raw.iter().map(|r| (r.t, r.tracked)).collect());
        cals.push(cal);
    }
    // Pass 2: per station and epoch, the measurements with their ids and broadcast records.
    let mut epochs: Vec<BTreeMap<i64, DiagEpoch>> = Vec::new();
    let mut unhealthy_used = Vec::new();
    for name in &names {
        let mut m_ep = BTreeMap::new();
        let mut unhealthy = 0usize;
        let mut p_s = None;
        for (year, doy, nav_src) in &days {
            let obs_text =
                gunzip(&dir.join(format!("{name}_R_{year}{doy:03}0000_01D_30S_MO.rnx.gz")));
            let nav_text = gunzip(&dir.join(format!("{nav_src}_{year}{doy:03}0000_01D_MN.rnx.gz")));
            let obs = parse_obs(&obs_text).unwrap();
            let ephs = parse_nav(&nav_text).unwrap();
            let p = *p_s.get_or_insert_with(|| obs.header.approx_xyz.unwrap());
            let atmos = AtmosModel {
                iono: klobuchar_from_nav_header(&nav_text).unwrap_or_default(),
                meteo: Meteo::default(),
            };
            for (i, ep) in obs.epochs.iter().enumerate() {
                if ep.flag != 0 {
                    continue;
                }
                let t = ep.time.seconds_from_gps_epoch().round() as i64 - t0;
                let tow = ep.time.gps_time_of_week();
                let meas: Vec<_> = assemble_epoch(&obs, i, &ephs, p, &atmos, MASK_DEG, true)
                    .into_iter()
                    .filter(|(s, _)| s.starts_with('G'))
                    .map(|(s, m)| {
                        let prn: u8 = s[1..3].trim().parse().unwrap();
                        let e = select_ephemeris(&ephs, 'G', prn, tow).unwrap();
                        let rec = [e.iode, e.sv_health, tow - e.toe, e.sv_accuracy];
                        (s, m, rec)
                    })
                    .collect();
                if t >= 86_400 && meas.iter().any(|(_, _, r)| r[1] != 0.0) {
                    unhealthy += 1;
                }
                m_ep.insert(t, DiagEpoch { p, meas });
            }
        }
        unhealthy_used.push(unhealthy);
        epochs.push(m_ep);
    }
    let err = |d: &DiagEpoch, skip: Option<&str>| -> Option<f64> {
        let m: Vec<_> = d
            .meas
            .iter()
            .filter(|(s, _, _)| Some(s.as_str()) != skip)
            .map(|(_, m, _)| *m)
            .collect();
        solve_spp(&m, d.p).map(|f| {
            let e = enu_error(d.p, f.ecef);
            e[0].hypot(e[1])
        })
    };
    let mut common = Vec::new();
    let all_t: std::collections::BTreeSet<i64> =
        epochs.iter().flat_map(|m| m.keys().copied()).collect();
    for &t in all_t.iter().filter(|t| (86_400..14 * 86_400).contains(*t)) {
        let alarmed: Vec<usize> = (0..names.len())
            .filter(|&k| {
                epochs[k]
                    .get(&t)
                    .and_then(|d| err(d, None))
                    .is_some_and(|e| e > cals[k].hs)
            })
            .collect();
        if alarmed.len() < 2 {
            continue;
        }
        let mut st = Vec::new();
        for (k, name) in names.iter().enumerate() {
            let Some(d) = epochs[k].get(&t) else {
                continue;
            };
            let m: Vec<_> = d.meas.iter().map(|(_, m, _)| *m).collect();
            let fix = solve_spp(&m, d.p);
            let station = ecef_to_geodetic(d.p);
            let sats = d
                .meas
                .iter()
                .map(|(s, m, r)| {
                    let resid = fix.map_or(f64::NAN, |f| {
                        let dx = [
                            m.sat_ecef[0] - f.ecef[0],
                            m.sat_ecef[1] - f.ecef[1],
                            m.sat_ecef[2] - f.ecef[2],
                        ];
                        let rho = (dx[0] * dx[0] + dx[1] * dx[1] + dx[2] * dx[2]).sqrt();
                        m.pseudorange_m
                            - (rho + f.clock_bias_m - m.sat_clock_m + m.iono_m + m.tropo_m)
                    });
                    DiagSat {
                        sat: s.clone(),
                        el_deg: look_angles(station, m.sat_ecef).el_rad.to_degrees(),
                        resid_m: resid,
                        iode: r[0],
                        health: r[1],
                        toe_age_s: r[2],
                        ura_m: r[3],
                        err_h_without_m: err(d, Some(s)),
                    }
                })
                .collect();
            st.push(DiagStation {
                name: name.clone(),
                err_h_m: err(d, None),
                h_s_m: cals[k].hs,
                alarmed: alarmed.contains(&k),
                sats,
            });
        }
        // A satellite explains the epoch if every alarmed station used it and leaving it out brings
        // each alarmed station under its H_s.
        let explaining: Vec<String> = st[alarmed[0]]
            .sats
            .iter()
            .map(|s| s.sat.clone())
            .filter(|sat| {
                st.iter().filter(|x| x.alarmed).all(|x| {
                    x.sats
                        .iter()
                        .any(|s| &s.sat == sat && s.err_h_without_m.is_some_and(|e| e <= x.h_s_m))
                })
            })
            .collect();
        common.push(serde_json::json!({
            "t": t,
            "day": t / 86_400,
            "gps_time_of_day_s": t % 86_400,
            "alarmed": alarmed.iter().map(|&k| names[k].clone()).collect::<Vec<_>>(),
            "explaining_satellites": explaining,
            "stations": st,
        }));
    }
    let committed: serde_json::Value = serde_json::from_str(
        &std::fs::read_to_string(
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust/t4v2_result.json"),
        )
        .unwrap(),
    )
    .unwrap();
    let lock_alerts: Vec<_> = committed["alerts"]
        .as_array()
        .unwrap()
        .iter()
        .filter(|a| a["n_u"] == 0)
        .map(|a| {
            let t = a["g"].as_i64().unwrap();
            serde_json::json!({
                "t": t,
                "tracked": names.iter().enumerate().map(|(k, n)| serde_json::json!({
                    "name": n,
                    "tracked": tracked[k].get(&t),
                    "tracked_median": cals[k].tracked_median,
                })).collect::<Vec<_>>(),
            })
        })
        .collect();
    let out = serde_json::json!({
        "common_position_alarm_epochs": common,
        "scored_epochs_using_an_unhealthy_satellite": names.iter().zip(&unhealthy_used)
            .map(|(n, u)| serde_json::json!({"name": n, "epochs": u})).collect::<Vec<_>>(),
        "loss_of_lock_alerts": lock_alerts,
    });
    let text = serde_json::to_string_pretty(&out).unwrap();
    std::fs::write(dir.join("v3_diagnosis.json"), &text).unwrap();
    println!(
        "B5 v3 diagnosis: {} common position-alarm epochs",
        common.len()
    );
    for c in &common {
        println!(
            "  t={} day {} {:>5} s alarmed {:?} explained by {:?}",
            c["t"], c["day"], c["gps_time_of_day_s"], c["alarmed"], c["explaining_satellites"]
        );
    }
    println!(
        "unhealthy satellite used: {:?}",
        out["scored_epochs_using_an_unhealthy_satellite"]
    );
}

// ------------------------------------------------------------------------------------------- B5 v3, T4

/// The v3 fortnight and its areas (reading X10, X10a): from the committed selection and navigation
/// choice, each day as (year, day of year, navigation file stem), and the stations of each cluster.
/// The v3 plan: the days, the stations of each area, and the first day as (year, month, day).
type V3Plan = (Vec<V2Day>, Vec<Vec<String>>, (i64, i64, i64));

fn v3_plan(dir: &Path) -> V3Plan {
    let root = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust");
    let sel: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(root.join("selection_v3.json")).unwrap())
            .unwrap();
    let committed = root.join("nav_choice_v3.tsv");
    let nav_path = if committed.exists() {
        committed
    } else {
        dir.join("nav_choice_v3.tsv")
    };
    let nav: BTreeMap<String, String> = std::fs::read_to_string(nav_path)
        .unwrap()
        .lines()
        .skip(1)
        .map(|l| {
            let f: Vec<&str> = l.split('\t').collect();
            (f[0].to_string(), f[3].to_string())
        })
        .collect();
    let areas: Vec<Vec<String>> = sel["clusters"]
        .as_array()
        .unwrap()
        .iter()
        .map(|c| {
            c.as_array()
                .unwrap()
                .iter()
                .map(|v| v.as_str().unwrap().to_string())
                .collect()
        })
        .collect();
    let mut first = None;
    let days = sel["days"]
        .as_array()
        .unwrap()
        .iter()
        .map(|d| {
            let d = d.as_str().unwrap();
            let p: Vec<i64> = d.split('-').map(|x| x.parse().unwrap()).collect();
            first.get_or_insert((p[0], p[1], p[2]));
            let doy = (days_from_civil(p[0], p[1], p[2]) - days_from_civil(p[0], 1, 1) + 1) as u32;
            (p[0], doy, nav[d].clone())
        })
        .collect();
    (days, areas, first.unwrap())
}

/// One station's epochs for v3: reading 11's statistics ([`Raw`]) and the per-satellite inputs of the
/// fix, keyed by the epoch's second from the first selected day.
fn read_station_v3(
    dir: &Path,
    name: &str,
    days: &[V2Day],
    first: (i64, i64, i64),
) -> (
    Vec<Raw>,
    BTreeMap<i64, Vec<kshana::area_trust::v3::Meas>>,
    [f64; 3],
) {
    let t0 = (days_from_civil(first.0, first.1, first.2) - days_from_civil(1980, 1, 6)) * 86_400;
    let mut out = Vec::new();
    let mut by_t = BTreeMap::new();
    let mut p_s = None;
    for (year, doy, nav_src) in days {
        let obs_text = gunzip(&dir.join(format!("{name}_R_{year}{doy:03}0000_01D_30S_MO.rnx.gz")));
        let nav_text = gunzip(&dir.join(format!("{nav_src}_{year}{doy:03}0000_01D_MN.rnx.gz")));
        let obs = parse_obs(&obs_text).unwrap();
        let ephs = parse_nav(&nav_text).unwrap();
        let p = *p_s.get_or_insert_with(|| obs.header.approx_xyz.expect("APPROX POSITION XYZ"));
        let station = ecef_to_geodetic(p);
        let atmos = AtmosModel {
            iono: klobuchar_from_nav_header(&nav_text).unwrap_or_default(),
            meteo: Meteo::default(),
        };
        for (i, ep) in obs.epochs.iter().enumerate() {
            if ep.flag != 0 {
                continue;
            }
            let tm = &ep.time;
            let t = tm.seconds_from_gps_epoch().round() as i64 - t0;
            let assembled: Vec<_> = assemble_epoch(&obs, i, &ephs, p, &atmos, MASK_DEG, true)
                .into_iter()
                .filter(|(s, _)| s.starts_with('G'))
                .collect();
            let meas: Vec<_> = assembled.iter().map(|(_, m)| *m).collect();
            let en = solve_spp(&meas, p).map(|f| {
                let e = enu_error(p, f.ecef);
                [e[0], e[1]]
            });
            let err_h = en.map(|e| e[0].hypot(e[1]));
            let tow = tm.gps_time_of_week();
            let mut cn0 = Vec::new();
            for sv in &ep.sats {
                if !sv.sat.starts_with('G') {
                    continue;
                }
                let Some(s1c) = obs.observation(i, &sv.sat, "S1C") else {
                    continue;
                };
                let Some(prn) = sv.sat.get(1..3).and_then(|s| s.trim().parse::<u8>().ok()) else {
                    continue;
                };
                let el = select_ephemeris(&ephs, 'G', prn, tow).map(|e| {
                    look_angles(station, e.sv_position_ecef(tow))
                        .el_rad
                        .to_degrees()
                });
                cn0.push((s1c, el.unwrap_or(f64::NAN)));
            }
            let tracked = cn0.len();
            by_t.insert(
                t,
                assembled
                    .into_iter()
                    .map(|(s, m)| kshana::area_trust::v3::Meas {
                        sat: s,
                        sat_ecef: m.sat_ecef,
                        pseudorange_m: m.pseudorange_m,
                        sat_clock_m: m.sat_clock_m,
                        iono_m: m.iono_m,
                        tropo_m: m.tropo_m,
                        weight: m.weight,
                    })
                    .collect(),
            );
            out.push(Raw {
                t,
                err_h,
                en,
                cn0,
                tracked,
            });
        }
    }
    (out, by_t, p_s.unwrap())
}

/// B5 v3 T4 (readings X10, X10a, W9): false area alerts on the v3 fortnight, per 30 s epoch the X4
/// screen across each area's stations, then X5, then the area aggregation. The files are fetched by
/// `xval/area-trust/fetch_v3.py`; `KSHANA_B5_V3_DIR` names their directory. Writes `t4v3_result.json`
/// there; once `xval/area-trust/t4v3_result.json` is committed, the run must reproduce it.
#[test]
#[ignore]
fn t4v3_false_alerts_on_clean_igs_data() {
    use kshana::area_trust::v3::{screen, station_state as state_v3, MeasStation, Report};
    use kshana::area_trust::{timeline_with, AreaRule};
    let dir = PathBuf::from(
        std::env::var("KSHANA_B5_V3_DIR").expect("KSHANA_B5_V3_DIR: the fetch_v3.py directory"),
    );
    let (days, areas, first) = v3_plan(&dir);
    let cal_end = 86_400i64;
    let scored = days.len() as i64 - 1;
    let mut area_results = Vec::new();
    let (mut deg_all, mut unt_all, mut area_days) = (0usize, 0usize, 0f64);
    for names in &areas {
        let mut cals = Vec::new();
        let mut raws = Vec::new();
        let mut meas = Vec::new();
        let mut mstations = Vec::new();
        for name in names {
            let (raw, m, p_s) = read_station_v3(&dir, name, &days, first);
            let cal = calibrate(&raw);
            mstations.push(MeasStation {
                id: name.clone(),
                p_s_ecef_m: p_s,
                h_s_m: cal.hs,
            });
            cals.push(cal);
            raws.push(
                raw.into_iter()
                    .map(|r| (r.t, r))
                    .collect::<BTreeMap<_, _>>(),
            );
            meas.push(m);
        }
        let all_t: std::collections::BTreeSet<i64> =
            raws.iter().flat_map(|m| m.keys().copied()).collect();
        let mut epochs: Vec<Vec<(f64, StationState)>> = vec![Vec::new(); names.len()];
        let mut reps: Vec<StationReport> = names
            .iter()
            .enumerate()
            .map(|(k, n)| StationReport {
                name: n.clone(),
                p_s_ecef_m: mstations[k].p_s_ecef_m,
                h_s_m: cals[k].hs,
                tracked_median: cals[k].tracked_median,
                ..Default::default()
            })
            .collect();
        let mut flagged: BTreeMap<String, usize> = BTreeMap::new();
        let mut flagged_scored = 0usize;
        let mut lock_only = vec![0usize; names.len()];
        for &t in &all_t {
            let reports: Vec<Option<Report>> = (0..names.len())
                .map(|k| {
                    raws[k].get(&t).map(|r| {
                        let e = evidence(r, &cals[k]);
                        Report {
                            cn0_alarm: e.cn0_delta_db < kshana::area_trust::CN0_ALARM_DB,
                            agc_alarm: false,
                            jam_alarm: false,
                            lock_alarm: e.lock_alarm,
                            clock_alarm: false,
                            osnma_ok: None,
                            meas: meas[k].get(&t).cloned().unwrap_or_default(),
                        }
                    })
                })
                .collect();
            let sc = screen(&mstations, &reports);
            if let Some(f) = &sc.satellite_fault {
                *flagged.entry(f.clone()).or_default() += 1;
                flagged_scored += usize::from(t >= cal_end);
            }
            for (k, r) in reports.iter().enumerate() {
                let Some(r) = r else { continue };
                let st = state_v3(r, sc.err_h_screened_m[k], mstations[k].h_s_m);
                if t >= cal_end {
                    let rep = &mut reps[k];
                    rep.scored_epochs += 1;
                    rep.no_fix += usize::from(sc.err_h_screened_m[k].is_none());
                    rep.alarms_position +=
                        usize::from(sc.err_h_screened_m[k].is_some_and(|e| e > mstations[k].h_s_m));
                    rep.alarms_cn0 += usize::from(r.cn0_alarm);
                    rep.alarms_lock += usize::from(r.lock_alarm);
                    rep.degraded_epochs += usize::from(st == StationState::Degraded);
                    rep.untrusted_epochs += usize::from(st == StationState::Untrusted);
                    lock_only[k] +=
                        usize::from(r.lock_alarm && !r.cn0_alarm && st == StationState::Nominal);
                }
                reps[k].epochs += 1;
                for s in 0..30 {
                    epochs[k].push(((t + s) as f64, st));
                }
            }
        }
        let stations: Vec<Station> = names
            .iter()
            .zip(epochs)
            .map(|(n, e)| Station {
                id: n.clone(),
                epochs: e,
            })
            .collect();
        let tl = timeline_with(&stations, AreaRule::V3);
        let mut per_day: BTreeMap<i64, (usize, usize)> =
            (1..=scored).map(|d| (d, (0, 0))).collect();
        let mut alert_list = Vec::new();
        for s in &tl {
            if s.alert && s.g >= cal_end && s.g < (scored + 1) * 86_400 {
                let e = per_day.entry(s.g / 86_400).or_default();
                e.0 += 1;
                e.1 += usize::from(s.state == AreaState::Untrusted);
                alert_list.push(serde_json::json!({"g": s.g, "state": s.state, "n": s.n, "n_d": s.n_d, "n_u": s.n_u, "stale": s.stale}));
            }
        }
        let (deg, unt): (usize, usize) =
            per_day.values().fold((0, 0), |a, b| (a.0 + b.0, a.1 + b.1));
        let unknown_s = tl
            .iter()
            .filter(|s| s.g >= cal_end && s.state == AreaState::Unknown)
            .count();
        println!(
            "area {names:?}: {deg} alerts to DEGRADED or worse, {unt} to UNTRUSTED over {scored} days; {flagged_scored} scored epochs with a SATELLITE_FAULT flag ({flagged:?}); lock-only epochs per station {lock_only:?}"
        );
        for r in &reps {
            println!(
                "  {}: H_s {:.1} m, tracked median {}, {} scored epochs, no fix {}, alarms position {} C/N0 {} lock {}",
                r.name, r.h_s_m, r.tracked_median, r.scored_epochs, r.no_fix, r.alarms_position, r.alarms_cn0, r.alarms_lock
            );
        }
        deg_all += deg;
        unt_all += unt;
        area_days += scored as f64;
        area_results.push(serde_json::json!({
            "area": names,
            "alerts_degraded_or_worse": deg,
            "alerts_untrusted": unt,
            "unknown_seconds": unknown_s,
            "satellite_fault_epochs_scored": flagged_scored,
            "satellite_fault_by_satellite": flagged,
            "lock_only_epochs": names.iter().zip(&lock_only).map(|(n, c)| serde_json::json!({"name": n, "epochs": c})).collect::<Vec<_>>(),
            "per_day": per_day.iter().map(|(d, (a, b))| serde_json::json!({"day": d, "date_doy": days[*d as usize].1, "degraded_or_worse": a, "untrusted": b})).collect::<Vec<_>>(),
            "alerts": alert_list,
            "stations": reps,
        }));
    }
    let deg_rate = deg_all as f64 / area_days;
    let unt_rate = unt_all as f64 / area_days;
    let met = deg_rate <= 1.0 && unt_rate <= 0.1;
    println!(
        "T4 v3: {deg_all} alerts to DEGRADED or worse ({deg_rate:.3} per area-day, bar 1), {unt_all} to UNTRUSTED ({unt_rate:.3}, bar 0.1) over {area_days} area-days: {}",
        if met { "MET" } else { "NOT MET" }
    );
    let result = serde_json::json!({
        "area_rule": "v3",
        "days": days.iter().map(|(y, d, n)| serde_json::json!({"year": y, "doy": d, "nav": n})).collect::<Vec<_>>(),
        "area_days": area_days,
        "alerts_degraded_or_worse": deg_all,
        "alerts_untrusted": unt_all,
        "per_area_day_degraded_or_worse": deg_rate,
        "per_area_day_untrusted": unt_rate,
        "areas": area_results,
        "verdict": if met { "MET" } else { "NOT MET" },
    });
    let text = serde_json::to_string_pretty(&result).unwrap();
    std::fs::write(dir.join("t4v3_result.json"), &text).unwrap();
    let committed =
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust/t4v3_result.json");
    if committed.exists() {
        assert_eq!(
            text,
            std::fs::read_to_string(committed).unwrap(),
            "the run reproduces the committed v3 T4 result"
        );
    }
}

// ------------------------------------------------------------------------------------------- T3

const T3_N: usize = 100;
const T3_TEMPLATE_DBHZ: f64 = 45.0;
const T3_MAPPING: &str = r#"schema = "kshana.connect/1"

[source]
format = "csv"
delimiter = ";"

[time]
column = "tow"
week_column = "week"
format = "gps-week-tow"

[signals]
band = "L1"
wide = { G01 = "cn0" }

[fix]
lat = { column = "lat" }
lon = { column = "lon" }
height = { column = "h" }

[receiver]
jamming = { column = "jam" }
spoofing = { column = "spoof" }
"#;
const T3_HEADER: &str = "week;tow;lat;lon;h;cn0;jam;spoof";

/// One planned event of a T3 run (reading 16).
#[derive(Clone, Debug, serde::Serialize)]
struct T3Event {
    kind: &'static str,
    onset: usize,
    end: usize,
    size_m: f64,
    stations: Vec<usize>,
}

fn t3_plan(run: u64, n_events: usize) -> (Vec<T3Event>, usize) {
    use rand::{Rng, SeedableRng};
    let mut r = rand_chacha::ChaCha20Rng::seed_from_u64(0xB5_7300 + run);
    let k = 2usize.max(T3_N.div_ceil(3));
    let mut t = 60usize;
    let mut out = Vec::new();
    for _ in 0..n_events {
        let kind = ["position-offset", "clock-step", "osnma-fail"][r.gen_range(0..3)];
        let dur = r.gen_range(20..60);
        let m = r.gen_range(k..=T3_N);
        let mut pool: Vec<usize> = (0..T3_N).collect();
        let mut st: Vec<usize> = (0..m)
            .map(|_| pool.remove(r.gen_range(0..pool.len())))
            .collect();
        st.sort_unstable();
        let size_m = if kind == "position-offset" {
            r.gen_range(50.0..500.0f64).round()
        } else {
            0.0
        };
        out.push(T3Event {
            kind,
            onset: t,
            end: t + dur,
            size_m,
            stations: st,
        });
        t += dur + r.gen_range(25..60);
    }
    (out, t + 20)
}

/// A minimal HTTP receiver: answers 200 and records each body with its receipt time.
fn t3_http(
    l: std::net::TcpListener,
    got: Arc<Mutex<Vec<(Instant, String)>>>,
    stop: Arc<AtomicBool>,
) {
    l.set_nonblocking(true).unwrap();
    while !stop.load(Ordering::Relaxed) {
        let Ok((mut s, _)) = l.accept() else {
            std::thread::sleep(std::time::Duration::from_millis(1));
            continue;
        };
        s.set_nonblocking(false).unwrap();
        let mut buf = Vec::new();
        let mut chunk = [0u8; 4096];
        let body = loop {
            let n = s.read(&mut chunk).unwrap_or(0);
            if n == 0 {
                break None;
            }
            buf.extend_from_slice(&chunk[..n]);
            let text = String::from_utf8_lossy(&buf).to_string();
            if let Some(h) = text.find("\r\n\r\n") {
                let len = text[..h]
                    .lines()
                    .find_map(|l| {
                        let (k, v) = l.split_once(':')?;
                        k.eq_ignore_ascii_case("content-length")
                            .then(|| v.trim().parse::<usize>().ok())?
                    })
                    .unwrap_or(0);
                if buf.len() >= h + 4 + len {
                    break Some(String::from_utf8_lossy(&buf[h + 4..h + 4 + len]).to_string());
                }
            }
        };
        if let Some(b) = body {
            got.lock().unwrap().push((Instant::now(), b));
        }
        let _ = s.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 0\r\nConnection: close\r\n\r\n");
    }
}

/// A minimal MQTT receiver: accepts the sink's connection and records each PUBLISH payload.
fn t3_mqtt(l: std::net::TcpListener, got: Arc<Mutex<Vec<(Instant, String)>>>) {
    let Ok((mut s, _)) = l.accept() else { return };
    let read_packet = |s: &mut std::net::TcpStream| -> Option<(u8, Vec<u8>)> {
        let mut h = [0u8; 1];
        s.read_exact(&mut h).ok()?;
        let (mut len, mut mul) = (0usize, 1usize);
        loop {
            let mut b = [0u8; 1];
            s.read_exact(&mut b).ok()?;
            len += usize::from(b[0] & 0x7f) * mul;
            mul *= 128;
            if b[0] & 0x80 == 0 {
                break;
            }
        }
        let mut body = vec![0u8; len];
        s.read_exact(&mut body).ok()?;
        Some((h[0], body))
    };
    if read_packet(&mut s).is_none() {
        return;
    }
    let _ = s.write_all(&[0x20, 2, 0, 0]);
    while let Some((h, body)) = read_packet(&mut s) {
        if h & 0xf0 == 0x30 && body.len() >= 2 {
            let tl = usize::from(u16::from_be_bytes([body[0], body[1]]));
            let payload = String::from_utf8_lossy(&body[2 + tl..]).to_string();
            got.lock().unwrap().push((Instant::now(), payload));
        } else if h & 0xf0 == 0xE0 {
            break;
        }
    }
}

fn mqtt_publish(topic: &str, payload: &str) -> Vec<u8> {
    let mut body = (topic.len() as u16).to_be_bytes().to_vec();
    body.extend(topic.as_bytes());
    body.extend(payload.as_bytes());
    let mut p = vec![0x30];
    let mut n = body.len();
    loop {
        let mut b = (n % 128) as u8;
        n /= 128;
        if n > 0 {
            b |= 0x80;
        }
        p.push(b);
        if n == 0 {
            break;
        }
    }
    p.extend(body);
    p
}

/// One T3 run (reading 14 to 17): `KSHANA_B5_T3_RUN` (run index), `KSHANA_B5_T3_EVENTS` (events,
/// default 55). Writes `t3_run_<run>.json` into `KSHANA_B5_DIR`. With `KSHANA_B5_AREA_RULE=v2` the
/// live area runs version 2's rule (reading W10) and writes `t3v2_run_<run>.json`; without it, v1.
#[test]
#[ignore]
fn t3_end_to_end_latency_run() {
    use kshana::area_trust::{AreaLive, AreaRule};
    use kshana::connect::parse_mapping;
    use kshana::connect_mqtt::{run_per_topic, MqttConfig, TopicFeeds};
    use kshana::obs::Record;
    use kshana::telemetry::alerts::Webhook;
    use kshana::telemetry::mqtt::{Message, MqttSink};

    let dir = PathBuf::from(std::env::var("KSHANA_B5_DIR").expect("KSHANA_B5_DIR"));
    let run: u64 = std::env::var("KSHANA_B5_T3_RUN")
        .expect("KSHANA_B5_T3_RUN")
        .parse()
        .unwrap();
    let n_events: usize = std::env::var("KSHANA_B5_T3_EVENTS")
        .ok()
        .and_then(|v| v.parse().ok())
        .unwrap_or(55);
    let rule = match std::env::var("KSHANA_B5_AREA_RULE").as_deref() {
        Ok("v2") => AreaRule::V2,
        Ok("v1") | Err(_) => AreaRule::V1,
        Ok(other) => panic!("KSHANA_B5_AREA_RULE: unknown rule {other}"),
    };
    // Background (reading 14): per real station, the 30 s epochs of the scored days and the calibration.
    struct Bg {
        geo: kshana::frames::Geodetic,
        cal: Cal,
        by_t: std::collections::HashMap<i64, (Option<[f64; 2]>, f64, bool)>,
    }
    let bg: Vec<Bg> = STATIONS
        .iter()
        .map(|name| {
            let (raw, p_s) = read_station(&dir, name);
            let cal = calibrate(&raw);
            let by_t = raw
                .iter()
                .filter(|r| r.t >= 86_400)
                .map(|r| {
                    let e = evidence(r, &cal);
                    (r.t, (r.en, e.cn0_delta_db, e.lock_alarm))
                })
                .collect();
            Bg {
                geo: ecef_to_geodetic(p_s),
                cal,
                by_t,
            }
        })
        .collect();
    let (plan, dur) = t3_plan(run, n_events);
    let span = 13 * 86_400i64;
    let row = |st: usize, k: usize| -> String {
        let b = &bg[st % 4];
        let off = (11 * 3600 * (st / 4) as i64 + 2 * 3600 * run as i64 + k as i64) % span;
        let t30 = 86_400 + off - off.rem_euclid(30);
        let (mut en, mut delta, lock) = b.by_t.get(&t30).copied().unwrap_or((None, 0.0, false));
        let mut spoof = 1;
        for ev in &plan {
            if k >= ev.onset && k < ev.end && ev.stations.binary_search(&st).is_ok() {
                match ev.kind {
                    "position-offset" => {
                        en = Some([
                            en.map_or(0.0, |e| e[0]) + ev.size_m,
                            en.map_or(0.0, |e| e[1]),
                        ])
                    }
                    _ => spoof = 2,
                }
            }
        }
        let fix = en.map_or(String::from(";;"), |[e, n]| {
            let (lat, lon) = (b.geo.lat_rad, b.geo.lon_rad);
            // Meridian and prime-vertical radii of WGS 84 at the station.
            let (a, f) = (6_378_137.0, 1.0 / 298.257_223_563);
            let e2 = f * (2.0 - f);
            let w = (1.0 - e2 * lat.sin().powi(2)).sqrt();
            let (rm, rn) = (a * (1.0 - e2) / w.powi(3), a / w);
            format!(
                "{:.9};{:.9};{:.3}",
                (lat + n / rm).to_degrees(),
                (lon + e / (rn * lat.cos())).to_degrees(),
                b.geo.alt_m
            )
        });
        if en.is_none() {
            delta = 0.0;
        }
        format!(
            "2349;{};{fix};{:.2};{};{spoof}",
            100_000 + k,
            T3_TEMPLATE_DBHZ + delta,
            if lock { 2 } else { 1 }
        )
    };

    // Receivers (reading 17).
    let http_l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let mqtt_l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let (http_addr, mqtt_addr) = (http_l.local_addr().unwrap(), mqtt_l.local_addr().unwrap());
    let web_got: Arc<Mutex<Vec<(Instant, String)>>> = Arc::default();
    let mq_got: Arc<Mutex<Vec<(Instant, String)>>> = Arc::default();
    let stop = Arc::new(AtomicBool::new(false));
    let http_t = {
        let (g, s) = (Arc::clone(&web_got), Arc::clone(&stop));
        std::thread::spawn(move || t3_http(http_l, g, s))
    };
    let mqtt_t = {
        let g = Arc::clone(&mq_got);
        std::thread::spawn(move || t3_mqtt(mqtt_l, g))
    };
    let webhook = Webhook::new(&format!("http://{http_addr}/area"), b"t3".to_vec()).unwrap();
    let sink = MqttSink::start(&mqtt_addr.to_string(), "kshana-area".into());

    // Ingest broker (reading 15): all stations' rows of second k at k seconds, one topic each.
    let l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let total = (T3_N * dur) as u64;
    let sent: Arc<Mutex<Vec<Instant>>> = Arc::new(Mutex::new(Vec::with_capacity(total as usize)));
    let rows: Vec<Vec<String>> = (0..dur)
        .map(|k| (0..T3_N).map(|st| row(st, k)).collect())
        .collect();
    let broker = {
        let sent = Arc::clone(&sent);
        std::thread::spawn(move || -> std::io::Result<()> {
            let (s, _) = l.accept()?;
            s.set_nodelay(true)?;
            let mut r = s.try_clone()?;
            let skip = |r: &mut std::net::TcpStream| -> std::io::Result<()> {
                let mut h = [0u8; 2];
                r.read_exact(&mut h)?;
                let mut b = vec![0u8; usize::from(h[1])];
                r.read_exact(&mut b)
            };
            skip(&mut r)?; // CONNECT (short)
            let mut w = std::io::BufWriter::new(s);
            w.write_all(&[0x20, 2, 0, 0])?;
            w.flush()?;
            skip(&mut r)?; // SUBSCRIBE
            w.write_all(&[0x90, 3, 0, 1, 0])?;
            w.flush()?;
            let start = Instant::now();
            for (k, ks) in rows.iter().enumerate() {
                let due = std::time::Duration::from_secs(k as u64);
                if let Some(wait) = due.checked_sub(start.elapsed()) {
                    std::thread::sleep(wait);
                }
                for (st, payload) in ks.iter().enumerate() {
                    let p = mqtt_publish(&format!("kshana/area/s{st:03}"), payload);
                    sent.lock().unwrap().push(Instant::now());
                    w.write_all(&p)?;
                }
                w.flush()?;
            }
            Ok(())
        })
    };
    let mapping = parse_mapping(T3_MAPPING).unwrap();
    let station: kshana::obs::Station = toml::from_str(
        "id = \"area\"\nlat_deg = 40.0\nlon_deg = -4.0\nheight_m = 0.0\nantenna = \"\"\nreceiver = \"\"\npartner_input = false\n",
    )
    .unwrap();
    let cfg = MqttConfig {
        addr,
        client_id: "kshana-area-t3".into(),
        topic: "kshana/area/+".into(),
        qos: 0,
        credentials: None,
        keep_alive_s: 60,
    };
    let mut feeds = TopicFeeds::new(&mapping, Some(T3_HEADER)).unwrap();
    let mut live = AreaLive::with_rule(T3_N, rule);
    let mut alerts_sent = 0usize;
    let mut post_failures = 0usize;
    let mut on_seconds = |secs: Vec<kshana::area_trust::AreaSecond>| {
        for s in secs.into_iter().filter(|s| s.alert) {
            let body = serde_json::json!({"run": run, "g": s.g, "state": s.state, "n": s.n, "n_d": s.n_d, "n_u": s.n_u}).to_string();
            let now = std::time::SystemTime::now()
                .duration_since(std::time::UNIX_EPOCH)
                .map(|d| d.as_secs() as i64)
                .unwrap_or(0);
            if !matches!(webhook.post(body.as_bytes(), now), Ok(c) if (200..300).contains(&c)) {
                post_failures += 1;
            }
            sink.send(Message {
                topic: "kshana/area/alert".into(),
                payload: body,
                retain: false,
            });
            alerts_sent += 1;
        }
    };
    run_per_topic(&cfg, &mapping, &station, &mut feeds, Some(total), |recs| {
        for r in recs {
            let Record::Epoch(er) = r else { continue };
            let Some(st) = er
                .station
                .rsplit('s')
                .next()
                .and_then(|x| x.parse::<usize>().ok())
            else {
                continue;
            };
            let b = &bg[st % 4];
            let ep = &er.epoch;
            let horiz = ep.fix.as_ref().map_or(0.0, |f| {
                kshana::geodesic::distance_m(
                    b.geo.lat_rad.to_degrees(),
                    b.geo.lon_rad.to_degrees(),
                    f.lat_deg,
                    f.lon_deg,
                )
            });
            let cn0 = ep
                .cn0
                .first()
                .map_or(0.0, |c| c.cn0_dbhz - T3_TEMPLATE_DBHZ);
            let sr = ep.self_report.as_ref();
            let e = StationEvidence {
                horiz_err_m: horiz,
                h_s_m: b.cal.hs,
                cn0_delta_db: cn0,
                agc_alarm: false,
                jam_alarm: sr.and_then(|s| s.jamming) == Some(2),
                lock_alarm: false,
                clock_alarm: sr.and_then(|s| s.spoofing) == Some(2),
                osnma_ok: None,
            };
            on_seconds(live.push(st, ep.t_s, station_state(&e)));
        }
        true
    })
    .unwrap();
    on_seconds(live.flush());
    broker.join().unwrap().unwrap();
    let mq_failures = Arc::clone(&sink.failures);
    sink.finish();
    std::thread::sleep(std::time::Duration::from_millis(500));
    stop.store(true, Ordering::Relaxed);
    http_t.join().unwrap();
    let _ = mqtt_t.join();

    // Latency per event and path.
    let sent = sent.lock().unwrap();
    let parse = |v: &Vec<(Instant, String)>| -> Vec<(Instant, i64, String)> {
        v.iter()
            .filter_map(|(t, b)| {
                let j: serde_json::Value = serde_json::from_str(b).ok()?;
                Some((*t, j["g"].as_i64()?, j["state"].as_str()?.to_string()))
            })
            .collect()
    };
    let (web, mq) = (
        parse(&web_got.lock().unwrap()),
        parse(&mq_got.lock().unwrap()),
    );
    let latency = |got: &[(Instant, i64, String)], ev: &T3Event| -> Option<f64> {
        let t0 = ev
            .stations
            .iter()
            .map(|&st| sent[ev.onset * T3_N + st])
            .min()?;
        got.iter()
            .filter(|(_, g, s)| *g >= ev.onset as i64 && *g < ev.end as i64 && s == "UNTRUSTED")
            .map(|(t, _, _)| t.duration_since(t0).as_secs_f64())
            .reduce(f64::min)
    };
    let events: Vec<serde_json::Value> = plan
        .iter()
        .map(|ev| {
            serde_json::json!({
                "kind": ev.kind, "onset_s": ev.onset, "end_s": ev.end, "size_m": ev.size_m,
                "n_stations": ev.stations.len(),
                "latency_webhook_s": latency(&web, ev), "latency_mqtt_s": latency(&mq, ev),
            })
        })
        .collect();
    let mut out = serde_json::json!({
        "run": run, "stations": T3_N, "seconds": dur, "alerts_sent": alerts_sent,
        "webhook_received": web.len(), "mqtt_received": mq.len(), "webhook_failures": post_failures,
        "mqtt_failures": mq_failures.load(Ordering::Relaxed),
        "late_epochs": live.late, "events": events,
    });
    if rule == AreaRule::V2 {
        out["area_rule"] = serde_json::json!("v2");
    }
    println!(
        "T3 run {run}: {} events, {alerts_sent} alerts sent, webhook {} received, MQTT {} received",
        plan.len(),
        web.len(),
        mq.len()
    );
    std::fs::write(
        dir.join(if rule == AreaRule::V2 {
            format!("t3v2_run_{run}.json")
        } else {
            format!("t3_run_{run}.json")
        }),
        serde_json::to_string_pretty(&out).unwrap(),
    )
    .unwrap();
}
