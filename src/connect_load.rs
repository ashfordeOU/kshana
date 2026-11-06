// SPDX-License-Identifier: AGPL-3.0-only
//! Load harness for live ingest (roadmap A3b, real-time target K3): many stations at a fixed rate,
//! each a timing monitor publishing one CSV row per epoch, through the same feeds the live commands use.
//!
//! * `memory`: every station's rows go straight into its own feed, as fast as they can be taken. It
//!   measures how many messages a second one core maps, against the offered load
//!   (stations × rate).
//! * `mqtt`: a loopback broker publishes every station's rows on `kshana/load/<station>`, paced at the real
//!   rate (all stations' rows of epoch k at k / rate seconds), to one wildcard subscription, which splits
//!   them into one feed per topic ([`crate::connect_mqtt::TopicFeeds`]). It measures the latency from a
//!   message being sent to its records being returned, under the offered load in real time, across a
//!   socket and the MQTT framing. Its capacity is that of the `memory` mode on the same load, measured
//!   in the same run (the paced run is mostly idle by design).
//!
//! A run passes when the capacity is at least the offered load, the 99th-percentile time per message is
//! at most [`crate::connect_live::LATENCY_BAR_MS`], and every epoch came back. Both ends run in one process, so it is
//! the ingest's own cost, not a network's. The rows are synthetic (the layout of
//! `examples/connect/timing-monitor.csv`), so the run needs no file.
use crate::connect::{parse_mapping, Mapping};
use crate::connect_mqtt::{Feed, MqttConfig, TopicFeeds};
use crate::obs::{Record, Station};
use std::io::{Read, Write};
use std::net::TcpListener;
use std::sync::{Arc, Mutex};
use std::time::Instant;

const MAPPING: &str = include_str!("../examples/connect/timing-monitor.connect.toml");
const STATION: &str = include_str!("../examples/obs/station.toml");
const HEADER: &str = "week;tow;lat;lon;alt_ft;G05;G12;G25;E11;agc;spoof";

/// What a load run measured.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct LoadReport {
    /// `memory` or `mqtt`.
    pub via: String,
    pub stations: usize,
    pub rate_hz: f64,
    /// Seconds of data per station.
    pub seconds: usize,
    pub messages: u64,
    /// Epochs returned (each station's last one is released at the end).
    pub epochs: u64,
    /// Wall-clock time of the run, seconds.
    pub wall_s: f64,
    /// Messages taken per second of wall-clock time.
    pub capacity_msgs_per_s: f64,
    /// The offered load: stations × rate.
    pub offered_msgs_per_s: f64,
    /// Time per message, milliseconds: median, 99th percentile, maximum.
    pub latency_ms: [f64; 3],
    pub pass: bool,
}

fn row(station: usize, k: usize, rate_hz: f64) -> String {
    let tow = 43_200.0 + k as f64 / rate_hz;
    let c = 40.0 + ((station * 7 + k) % 9) as f64 * 0.5;
    format!(
        "2443;{tow:.3};{:.5};{:.5};98.4;{c:.1};{:.1};{:.1};{:.1};2200;1",
        59.0 + station as f64 * 1e-3,
        24.0 + station as f64 * 1e-3,
        c - 3.0,
        c - 4.5,
        c - 2.0
    )
}

fn quantiles(mut v: Vec<f64>) -> [f64; 3] {
    if v.is_empty() {
        return [0.0; 3];
    }
    v.sort_by(f64::total_cmp);
    let q = |p: f64| v[((v.len() - 1) as f64 * p).round() as usize];
    [q(0.5), q(0.99), v[v.len() - 1]]
}

fn epochs(r: &[Record]) -> u64 {
    r.iter().filter(|x| matches!(x, Record::Epoch(_))).count() as u64
}

fn parts() -> Result<(Mapping, Station), String> {
    let mapping = parse_mapping(MAPPING)?;
    let station: Station = toml::from_str(STATION).map_err(|e| e.to_string())?;
    Ok((mapping, station))
}

fn report(
    via: &str,
    stations: usize,
    rate_hz: f64,
    seconds: usize,
    messages: u64,
    epochs: u64,
    wall_s: f64,
    lat: Vec<f64>,
) -> LoadReport {
    let capacity = messages as f64 / wall_s.max(1e-9);
    let offered = stations as f64 * rate_hz;
    let latency_ms = quantiles(lat);
    LoadReport {
        via: via.to_string(),
        stations,
        rate_hz,
        seconds,
        messages,
        epochs,
        wall_s,
        capacity_msgs_per_s: capacity,
        offered_msgs_per_s: offered,
        latency_ms,
        pass: capacity >= offered
            && latency_ms[1] <= crate::connect_live::LATENCY_BAR_MS
            && epochs == messages,
    }
}

/// Run `stations` × `seconds` × `rate_hz` messages through in-memory feeds.
pub fn run_memory(stations: usize, rate_hz: f64, seconds: usize) -> Result<LoadReport, String> {
    let (mapping, station) = parts()?;
    let mut feeds = Vec::with_capacity(stations);
    for s in 0..stations {
        let mut st = station.clone();
        st.id = format!("{}/s{s:04}", station.id);
        feeds.push((Feed::new(&mapping, Some(HEADER))?, st));
    }
    let n = (seconds as f64 * rate_hz).round() as usize;
    let mut lat = Vec::with_capacity(stations * n);
    let mut eps = 0u64;
    let t0 = Instant::now();
    for k in 0..n {
        for (s, (feed, st)) in feeds.iter_mut().enumerate() {
            let line = row(s, k, rate_hz);
            let t = Instant::now();
            eps += epochs(&feed.push(line.as_bytes(), &mapping, st)?);
            lat.push(t.elapsed().as_secs_f64() * 1e3);
        }
    }
    for (feed, st) in &mut feeds {
        eps += epochs(&feed.flush(&mapping, st)?);
    }
    let wall = t0.elapsed().as_secs_f64();
    Ok(report(
        "memory",
        stations,
        rate_hz,
        seconds,
        (stations * n) as u64,
        eps,
        wall,
        lat,
    ))
}

fn remaining(n: usize) -> Vec<u8> {
    let (mut n, mut out) = (n, Vec::new());
    loop {
        let b = (n % 128) as u8;
        n /= 128;
        out.push(if n > 0 { b | 0x80 } else { b });
        if n == 0 {
            return out;
        }
    }
}

fn read_packet(s: &mut impl Read) -> std::io::Result<()> {
    let mut b = [0u8; 1];
    s.read_exact(&mut b)?;
    let (mut len, mut k) = (0usize, 0);
    loop {
        s.read_exact(&mut b)?;
        len |= usize::from(b[0] & 0x7F) << (7 * k);
        k += 1;
        if b[0] & 0x80 == 0 || k == 4 {
            break;
        }
    }
    let mut body = vec![0u8; len];
    s.read_exact(&mut body)
}

/// Run the same load through a loopback MQTT broker and one wildcard subscription.
pub fn run_mqtt(stations: usize, rate_hz: f64, seconds: usize) -> Result<LoadReport, String> {
    let (mapping, station) = parts()?;
    let l = TcpListener::bind("127.0.0.1:0").map_err(|e| e.to_string())?;
    let addr = l.local_addr().map_err(|e| e.to_string())?.to_string();
    let n = (seconds as f64 * rate_hz).round() as usize;
    let total = (stations * n) as u64;
    // Send time of each message, by its order (the broker sends in order on one connection).
    let sent: Arc<Mutex<Vec<Instant>>> = Arc::new(Mutex::new(Vec::with_capacity(total as usize)));
    let sent_b = Arc::clone(&sent);
    let broker = std::thread::spawn(move || -> std::io::Result<()> {
        let (s, _) = l.accept()?;
        s.set_nodelay(true)?;
        let mut r = s.try_clone()?;
        read_packet(&mut r)?;
        let mut w = std::io::BufWriter::new(s);
        w.write_all(&[0x20, 2, 0, 0])?;
        w.flush()?;
        read_packet(&mut r)?;
        w.write_all(&[0x90, 3, 0, 1, 0])?;
        w.flush()?;
        let start = Instant::now();
        for k in 0..n {
            let due = std::time::Duration::from_secs_f64(k as f64 / rate_hz);
            if let Some(wait) = due.checked_sub(start.elapsed()) {
                std::thread::sleep(wait);
            }
            for st in 0..stations {
                let topic = format!("kshana/load/s{st:04}");
                let payload = row(st, k, rate_hz);
                let mut body = (topic.len() as u16).to_be_bytes().to_vec();
                body.extend(topic.as_bytes());
                body.extend(payload.as_bytes());
                let mut p = vec![0x30];
                p.extend(remaining(body.len()));
                p.extend(body);
                if let Ok(mut v) = sent_b.lock() {
                    v.push(Instant::now());
                }
                w.write_all(&p)?;
            }
            w.flush()?;
        }
        w.flush()?;
        let _ = read_packet(&mut r); // DISCONNECT
        Ok(())
    });
    let cfg = MqttConfig {
        addr,
        client_id: "kshana-load".into(),
        topic: "kshana/load/+".into(),
        qos: 0,
        credentials: None,
        keep_alive_s: 60,
    };
    let mut feeds = TopicFeeds::new(&mapping, Some(HEADER))?;
    let mut lat = Vec::with_capacity(total as usize);
    let mut eps = 0u64;
    let mut seen = 0usize;
    let t0 = Instant::now();
    let run = crate::connect_mqtt::run_per_topic(
        &cfg,
        &mapping,
        &station,
        &mut feeds,
        Some(total),
        |recs| {
            let now = Instant::now();
            if seen < total as usize {
                if let Some(t) = sent.lock().ok().and_then(|v| v.get(seen).copied()) {
                    lat.push(now.duration_since(t).as_secs_f64() * 1e3);
                }
                seen += 1;
            }
            eps += epochs(&recs);
            true
        },
    );
    let wall = t0.elapsed().as_secs_f64();
    run?;
    broker
        .join()
        .map_err(|_| crate::terr!("e-connect-live-server"))?
        .map_err(|e| e.to_string())?;
    // Busy time: what one core spends taking the messages, measured apart from the paced run.
    let busy = run_memory(stations, rate_hz, seconds)?.wall_s;
    let mut r = report("mqtt", stations, rate_hz, seconds, total, eps, busy, lat);
    r.wall_s = wall;
    Ok(r)
}
