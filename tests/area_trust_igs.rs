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
//! (engine at ff7d51567); today's engine reproduces `xval/area-trust/t4_result_after_nav_fix.json`.

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
    // The scored result (`t4_result.json`) was written by the engine at ff7d51567. The navigation
    // parser fix that followed (7556cdc5f) changes it, so today's engine reproduces the
    // supplementary result.
    let committed = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("xval/area-trust/t4_result_after_nav_fix.json");
    assert_eq!(
        text,
        std::fs::read_to_string(committed).unwrap(),
        "the run reproduces the committed supplementary T4 result"
    );
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
/// default 55). Writes `t3_run_<run>.json` into `KSHANA_B5_DIR`.
#[test]
#[ignore]
fn t3_end_to_end_latency_run() {
    use kshana::area_trust::AreaLive;
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
    let mut live = AreaLive::new(T3_N);
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
    let out = serde_json::json!({
        "run": run, "stations": T3_N, "seconds": dur, "alerts_sent": alerts_sent,
        "webhook_received": web.len(), "mqtt_received": mq.len(), "webhook_failures": post_failures,
        "mqtt_failures": mq_failures.load(Ordering::Relaxed),
        "late_epochs": live.late, "events": events,
    });
    println!(
        "T3 run {run}: {} events, {alerts_sent} alerts sent, webhook {} received, MQTT {} received",
        plan.len(),
        web.len(),
        mq.len()
    );
    std::fs::write(
        dir.join(format!("t3_run_{run}.json")),
        serde_json::to_string_pretty(&out).unwrap(),
    )
    .unwrap();
}
