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
//! `t4_result.json` into the data directory.

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
use std::io::Read;
use std::path::{Path, PathBuf};

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
            let err_h = solve_spp(&meas, p).map(|f| {
                let e = enu_error(p, f.ecef);
                e[0].hypot(e[1])
            });
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
                cn0,
                tracked,
            });
        }
    }
    (out, p_s.unwrap())
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
        let cal: Vec<&Raw> = raw.iter().filter(|r| r.t < cal_end).collect();
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
        let template: BTreeMap<i64, f64> = bins
            .into_iter()
            .filter_map(|(k, mut v)| median(&mut v).map(|m| (k, m)))
            .collect();
        let tracked_median =
            median(&mut cal.iter().map(|r| r.tracked as f64).collect::<Vec<_>>()).unwrap();
        let mut rep = StationReport {
            name: name.into(),
            p_s_ecef_m: p_s,
            h_s_m: hs,
            tracked_median,
            ..Default::default()
        };
        let mut epochs = Vec::with_capacity(raw.len() * 30);
        for r in &raw {
            let mut d: Vec<f64> = r
                .cn0
                .iter()
                .filter(|(_, el)| *el > CN0_MIN_EL_DEG)
                .filter_map(|&(c, el)| template.get(&((el / 5.0).floor() as i64)).map(|t| c - t))
                .collect();
            let e = StationEvidence {
                horiz_err_m: r.err_h.unwrap_or(0.0),
                h_s_m: hs,
                cn0_delta_db: median(&mut d).unwrap_or(0.0),
                agc_alarm: false,
                jam_alarm: false,
                lock_alarm: (r.tracked as f64) <= tracked_median - SATS_LOST,
                clock_alarm: false,
                osnma_ok: None,
            };
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
    let committed =
        PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("xval/area-trust/t4_result.json");
    assert_eq!(
        text,
        std::fs::read_to_string(committed).unwrap(),
        "the run reproduces the committed T4 result"
    );
}
