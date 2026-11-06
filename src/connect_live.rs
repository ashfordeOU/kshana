// SPDX-License-Identifier: AGPL-3.0-only
//! Live conformance kit (roadmap A7b): the A7a vectors replayed over the live paths, one row per
//! message, to check ordering, holding, latency and reconnection.
//!
//! For each vector with a mapping file and a streamable format (`csv`, `tsv`, `jsonl`):
//! * **MQTT**: a loopback broker publishes the rows one per message, alternating QoS 0 and 1, and drops
//!   the connection half-way; the client must reconnect once and carry on;
//! * **WebSocket**: a loopback server sends the rows one per message and closes;
//! * **directory watch**: the rows are appended to a log file one at a time, with a step after each.
//!
//! Each path passes when its epochs are the vector's expected epochs, byte for byte and in order (an
//! epoch emitted before its last row would differ), the only epoch released by the final flush is the
//! last one, and, for MQTT, exactly one reconnection happened. The latency from a message being sent to
//! its records being returned is reported (median, 99th percentile, maximum) and must stay within
//! [`LATENCY_BAR_MS`]. Both ends run in one process on the loopback interface, so the figure is the
//! client's own cost, not the network's.
use crate::connect::{parse_mapping, Mapping, Vector};
use crate::connect_mqtt::{Feed, MqttConfig};
use crate::obs::{Record, Station};
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::path::Path;
use std::sync::{Arc, Mutex};
use std::time::Instant;

/// Largest 99th-percentile latency that passes, milliseconds.
pub const LATENCY_BAR_MS: f64 = 250.0;

/// The result of one live path for one vector.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct PathResult {
    /// `mqtt`, `ws` or `watch`.
    pub path: &'static str,
    /// Epochs expected and produced.
    pub epochs_expected: usize,
    /// Epochs produced.
    pub epochs_produced: usize,
    /// The first epoch (1-based) that differs, if any.
    pub first_difference: Option<usize>,
    /// Epochs released by the final flush (must be 1).
    pub released_at_end: usize,
    /// Reconnections (MQTT: must be 1).
    pub reconnects: u32,
    /// Latency from send to records, milliseconds: median, 99th percentile, maximum.
    pub latency_ms: [f64; 3],
    /// Whether the path passes.
    pub pass: bool,
}

/// A vector's live results, or why it was not replayed.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct VectorResult {
    /// The vector's name.
    pub name: String,
    /// The paths run (empty when skipped).
    pub paths: Vec<PathResult>,
    /// Why it was skipped (a built-in reader, or a single JSON document).
    pub skipped: Option<String>,
}

fn epochs(r: &[Record]) -> Vec<String> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) => serde_json::to_string(e).ok(),
            _ => None,
        })
        .collect()
}

fn quantiles(mut v: Vec<f64>) -> [f64; 3] {
    if v.is_empty() {
        return [0.0; 3];
    }
    v.sort_by(f64::total_cmp);
    let q = |p: f64| v[((v.len() - 1) as f64 * p).round() as usize];
    [q(0.5), q(0.99), v[v.len() - 1]]
}

/// The header row and the data lines of a log, as a publisher would send them.
fn split(mapping: &Mapping, text: &str) -> Result<(Option<String>, Vec<String>), String> {
    let rows = crate::connect::row_times(mapping, text)?;
    let first = rows.first().map_or(1, |r| r.0);
    let lines: Vec<&str> = text.lines().collect();
    let csv = matches!(mapping.source.format.as_str(), "csv" | "tsv");
    let header = if csv {
        let comment = mapping.source.comment.as_deref().filter(|c| !c.is_empty());
        lines[..first - 1]
            .iter()
            .rev()
            .find(|l| !l.trim().is_empty() && !comment.is_some_and(|c| l.starts_with(c)))
            .map(|l| l.to_string())
    } else {
        None
    };
    let data = lines[first - 1..]
        .iter()
        .filter(|l| !l.trim().is_empty())
        .map(|l| l.to_string())
        .collect();
    Ok((header, data))
}

struct Replay<'a> {
    mapping: &'a Mapping,
    station: &'a Station,
    header: Option<String>,
    rows: Vec<String>,
    want: Vec<String>,
}

impl Replay<'_> {
    fn judge(
        &self,
        path: &'static str,
        got: &[Record],
        released: usize,
        reconnects: u32,
        latency: Vec<f64>,
    ) -> PathResult {
        let have = epochs(got);
        let first_difference = (0..self.want.len().max(have.len()))
            .find(|&k| self.want.get(k) != have.get(k))
            .map(|k| k + 1);
        let latency_ms = quantiles(latency);
        let reconnect_ok = path != "mqtt" || reconnects == 1;
        PathResult {
            path,
            epochs_expected: self.want.len(),
            epochs_produced: have.len(),
            first_difference,
            released_at_end: released,
            reconnects,
            latency_ms,
            pass: first_difference.is_none()
                && (released == 1 || self.want.is_empty())
                && reconnect_ok
                && latency_ms[1] <= LATENCY_BAR_MS,
        }
    }

    fn feed(&self, label: &'static str) -> Result<Feed, String> {
        Ok(Feed::new(self.mapping, self.header.as_deref())?.label(label))
    }

    fn mqtt(&self) -> Result<PathResult, String> {
        let l = TcpListener::bind("127.0.0.1:0").map_err(|e| e.to_string())?;
        let addr = l.local_addr().map_err(|e| e.to_string())?.to_string();
        let sent: Arc<Mutex<Vec<Instant>>> = Arc::default();
        let rows = self.rows.clone();
        let sent_b = Arc::clone(&sent);
        let broker = std::thread::spawn(move || -> std::io::Result<()> {
            let drop_at = rows.len() / 2;
            let mut k = 0;
            for session in 0..2 {
                let (mut s, _) = l.accept()?;
                s.set_nodelay(true)?;
                let _ = read_packet(&mut s)?;
                s.write_all(&[0x20, 2, 0, 0])?;
                let _ = read_packet(&mut s)?;
                s.write_all(&[0x90, 3, 0, 1, 1])?;
                while k < rows.len() {
                    if k == drop_at && session == 0 {
                        break; // drop the connection half-way
                    }
                    let id = (k % 2 == 1).then_some(k as u16 + 1);
                    sent_b.lock().map(|mut v| v.push(Instant::now())).ok();
                    s.write_all(&publish("kshana/live", &rows[k], id))?;
                    if id.is_some() {
                        let _ = read_packet(&mut s)?; // PUBACK
                    }
                    k += 1;
                }
                if k == rows.len() {
                    let _ = read_packet(&mut s); // DISCONNECT
                    break;
                }
            }
            Ok(())
        });
        let cfg = MqttConfig {
            addr,
            client_id: "kshana-live-check".into(),
            topic: "kshana/#".into(),
            qos: 1,
            credentials: None,
            keep_alive_s: 30,
        };
        let mut feed = self.feed("connect-mqtt")?;
        let mut got = Vec::new();
        let mut latency = Vec::new();
        let mut last = Vec::new();
        let n = self.rows.len() as u64;
        let stats = crate::connect_mqtt::run(
            &cfg,
            self.mapping,
            self.station,
            &mut feed,
            Some(n),
            |recs| {
                let now = Instant::now();
                if let Some(t) = sent.lock().ok().and_then(|v| v.last().copied()) {
                    latency.push(now.duration_since(t).as_secs_f64() * 1e3);
                }
                last = recs.clone();
                got.extend(recs);
                true
            },
        )?;
        broker
            .join()
            .map_err(|_| crate::terr!("e-connect-live-server"))?
            .map_err(|e| e.to_string())?;
        // The run hands the final flush over on its own, last.
        let released = epochs(&last).len();
        Ok(self.judge("mqtt", &got, released, stats.reconnects, latency))
    }

    fn ws(&self) -> Result<PathResult, String> {
        let l = TcpListener::bind("127.0.0.1:0").map_err(|e| e.to_string())?;
        let port = l.local_addr().map_err(|e| e.to_string())?.port();
        let sent: Arc<Mutex<Vec<Instant>>> = Arc::default();
        let rows = self.rows.clone();
        let sent_b = Arc::clone(&sent);
        let server = std::thread::spawn(move || -> std::io::Result<()> {
            let (mut s, _) = l.accept()?;
            s.set_nodelay(true)?;
            let mut req = Vec::new();
            let mut b = [0u8; 1];
            while !req.ends_with(b"\r\n\r\n") {
                s.read_exact(&mut b)?;
                req.push(b[0]);
            }
            let req = String::from_utf8_lossy(&req);
            let key = req
                .lines()
                .find_map(|l| {
                    l.split_once(':')
                        .filter(|(k, _)| k.eq_ignore_ascii_case("sec-websocket-key"))
                        .map(|(_, v)| v.trim().to_string())
                })
                .unwrap_or_default();
            s.write_all(
                format!(
                    "HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: {}\r\n\r\n",
                    crate::connect_ws::accept_key(&key)
                )
                .as_bytes(),
            )?;
            for r in &rows {
                sent_b.lock().map(|mut v| v.push(Instant::now())).ok();
                s.write_all(&ws_frame(0x1, r.as_bytes()))?;
            }
            s.write_all(&ws_frame(0x8, &1000u16.to_be_bytes()))?;
            let mut rest = Vec::new();
            let _ = s.read_to_end(&mut rest);
            Ok(())
        });
        let mut ws = crate::connect_ws::WsClient::connect(&format!("ws://127.0.0.1:{port}/live"))?;
        let mut feed = self.feed("connect-ws")?;
        let mut got = Vec::new();
        let mut latency = Vec::new();
        while let Some(m) = ws.next_message()? {
            let recs = feed.push(&m, self.mapping, self.station)?;
            if let Some(t) = sent.lock().ok().and_then(|v| v.last().copied()) {
                latency.push(t.elapsed().as_secs_f64() * 1e3);
            }
            got.extend(recs);
        }
        let tail = feed.flush(self.mapping, self.station)?;
        let released = epochs(&tail).len();
        got.extend(tail);
        ws.close();
        server
            .join()
            .map_err(|_| crate::terr!("e-connect-live-server"))?
            .map_err(|e| e.to_string())?;
        Ok(self.judge("ws", &got, released, 0, latency))
    }

    fn watch(&self, scratch: &Path) -> Result<PathResult, String> {
        use crate::connect_watch::{flush, step, WatchState};
        std::fs::create_dir_all(scratch).map_err(|e| e.to_string())?;
        let file = scratch.join("live.log");
        let mut text = String::new();
        if let Some(h) = &self.header {
            text.push_str(&"\n".repeat(self.mapping.source.skip_lines));
            text.push_str(h);
            text.push('\n');
        }
        let mut st = WatchState::default();
        let mut got = Vec::new();
        let mut latency = Vec::new();
        for r in &self.rows {
            text.push_str(r);
            text.push('\n');
            let t = Instant::now();
            std::fs::write(&file, &text).map_err(|e| e.to_string())?;
            got.extend(step(scratch, ".log", self.mapping, self.station, &mut st)?);
            latency.push(t.elapsed().as_secs_f64() * 1e3);
        }
        let tail = flush(scratch, ".log", self.mapping, self.station, &mut st)?;
        let released = epochs(&tail).len();
        got.extend(tail);
        let _ = std::fs::remove_dir_all(scratch);
        Ok(self.judge("watch", &got, released, 0, latency))
    }
}

fn read_packet(s: &mut TcpStream) -> std::io::Result<Vec<u8>> {
    let mut first = [0u8; 1];
    s.read_exact(&mut first)?;
    let (mut len, mut k) = (0usize, 0);
    loop {
        let mut b = [0u8; 1];
        s.read_exact(&mut b)?;
        len |= usize::from(b[0] & 0x7F) << (7 * k);
        k += 1;
        if b[0] & 0x80 == 0 || k == 4 {
            break;
        }
    }
    let mut body = vec![0u8; len];
    s.read_exact(&mut body)?;
    Ok(body)
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

fn publish(topic: &str, payload: &str, id: Option<u16>) -> Vec<u8> {
    let mut body = (topic.len() as u16).to_be_bytes().to_vec();
    body.extend(topic.as_bytes());
    if let Some(id) = id {
        body.extend(id.to_be_bytes());
    }
    body.extend(payload.as_bytes());
    let mut p = vec![if id.is_some() { 0x32 } else { 0x30 }];
    p.extend(remaining(body.len()));
    p.extend(body);
    p
}

fn ws_frame(opcode: u8, p: &[u8]) -> Vec<u8> {
    let mut f = vec![0x80 | opcode];
    match p.len() {
        n if n < 126 => f.push(n as u8),
        n if n <= 0xFFFF => {
            f.push(126);
            f.extend((n as u16).to_be_bytes());
        }
        n => {
            f.push(127);
            f.extend((n as u64).to_be_bytes());
        }
    }
    f.extend(p);
    f
}

/// Replay one vector over the live paths. `scratch` is a directory the watch path may create and
/// remove.
pub fn check_vector(path: &Path, scratch: &Path) -> Result<VectorResult, String> {
    let at = |p: &str| path.parent().unwrap_or(Path::new(".")).join(p);
    let read = |p: &Path| std::fs::read_to_string(p).map_err(|e| format!("{}: {e}", p.display()));
    let v: Vector = toml::from_str(&read(path)?).map_err(|e| {
        crate::terr!(
            "e-connect-vector-bad",
            path = path.display().to_string(),
            e = e.to_string()
        )
    })?;
    let skip = |why: String| {
        Ok(VectorResult {
            name: v.name.clone(),
            paths: Vec::new(),
            skipped: Some(why),
        })
    };
    let Some(m) = &v.mapping else {
        return skip(crate::terr!("e-connect-live-reader"));
    };
    let mapping = parse_mapping(&read(&at(m))?)?;
    if mapping.source.format == "json" {
        return skip(crate::terr!("e-connect-watch-json"));
    }
    let station: Station =
        toml::from_str(&read(&at(&v.station))?).map_err(|e| format!("{}: {e}", v.station))?;
    let input = read(&at(&v.input))?;
    let want_text = read(&at(&v.expected))?;
    let want = epochs(&crate::obs::check(&want_text)?.0);
    let (header, rows) = split(&mapping, &input)?;
    let r = Replay {
        mapping: &mapping,
        station: &station,
        header,
        rows,
        want,
    };
    Ok(VectorResult {
        name: v.name.clone(),
        paths: vec![r.mqtt()?, r.ws()?, r.watch(scratch)?],
        skipped: None,
    })
}
