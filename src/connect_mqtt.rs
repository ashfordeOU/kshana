// SPDX-License-Identifier: AGPL-3.0-only
//! Live ingest from an MQTT broker (roadmap A3a): subscribe to a topic and turn the rows that arrive
//! into `kshana.obs/1` records with a Kshana Connect mapping.
//!
//! The client speaks MQTT 3.1.1 over TCP: CONNECT (clean session, optional user name and password),
//! SUBSCRIBE to one topic filter at QoS 0 or 1, then PUBLISH in (a QoS 1 message is acknowledged with
//! PUBACK), PINGREQ when the line has been quiet for half the keep-alive. Each message payload is one or
//! more rows of the mapping's format (`jsonl`, `csv` or `tsv`); the payloads are read in arrival order as
//! one continuous log, exactly as `connect watch` reads a directory, and the last epoch is held back
//! until a later row arrives ([`crate::connect_watch::step_text`]). For CSV and TSV the publisher does
//! not repeat the header row, so the caller gives it ([`Feed::new`]).
//!
//! TLS is not built in: the default build adds no crate. For a broker that only listens with TLS, run a
//! local TLS relay (for example stunnel, or a local broker bridged to it) and point the client at that.
//! A single JSON document is not a stream and is refused; use `jsonl`.
//!
//! The packet layouts are from the OASIS MQTT 3.1.1 standard, a public document.
use crate::connect::Mapping;
use crate::connect_watch::{step_text, WatchState};
use crate::obs::{Record, Station};
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::{Duration, Instant};

/// How to reach the broker.
#[derive(Clone, Debug)]
pub struct MqttConfig {
    /// `host:port`.
    pub addr: String,
    /// Client identifier.
    pub client_id: String,
    /// Topic filter (`+` and `#` wildcards are the broker's).
    pub topic: String,
    /// QoS of the subscription, 0 or 1.
    pub qos: u8,
    /// User name and password, when the broker asks for them.
    pub credentials: Option<(String, String)>,
    /// Keep-alive, seconds (1 to 65535).
    pub keep_alive_s: u16,
}

fn put_str(out: &mut Vec<u8>, s: &[u8]) {
    out.extend((s.len() as u16).to_be_bytes());
    out.extend(s);
}

fn packet(first: u8, body: Vec<u8>) -> Vec<u8> {
    let mut p = vec![first];
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

/// MQTT 3.1.1 CONNECT (clean session), with user name and password when given.
pub fn connect_packet(cfg: &MqttConfig) -> Vec<u8> {
    let mut body = Vec::new();
    put_str(&mut body, b"MQTT");
    let flags = 0x02 | if cfg.credentials.is_some() { 0xC0 } else { 0 };
    body.extend([4, flags]);
    body.extend(cfg.keep_alive_s.to_be_bytes());
    put_str(&mut body, cfg.client_id.as_bytes());
    if let Some((u, p)) = &cfg.credentials {
        put_str(&mut body, u.as_bytes());
        put_str(&mut body, p.as_bytes());
    }
    packet(0x10, body)
}

/// MQTT 3.1.1 SUBSCRIBE of one topic filter.
pub fn subscribe_packet(packet_id: u16, topic: &str, qos: u8) -> Vec<u8> {
    let mut body = packet_id.to_be_bytes().to_vec();
    put_str(&mut body, topic.as_bytes());
    body.push(qos);
    packet(0x82, body)
}

/// One packet as read: the first header octet and the body.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Packet {
    /// Type (high nibble) and flags (low nibble).
    pub first: u8,
    /// Variable header and payload.
    pub body: Vec<u8>,
}

/// Read one packet; `Ok(None)` when the read timed out before its first octet.
fn read_packet(s: &mut TcpStream) -> Result<Option<Packet>, String> {
    let mut first = [0u8; 1];
    match s.read(&mut first) {
        Ok(0) => return Err(crate::terr!("e-connect-mqtt-closed")),
        Ok(_) => {}
        Err(e)
            if matches!(
                e.kind(),
                std::io::ErrorKind::WouldBlock | std::io::ErrorKind::TimedOut
            ) =>
        {
            return Ok(None)
        }
        Err(e) => return Err(e.to_string()),
    }
    let mut len = 0usize;
    for k in 0..4 {
        let mut b = [0u8; 1];
        s.read_exact(&mut b).map_err(|e| e.to_string())?;
        len |= usize::from(b[0] & 0x7F) << (7 * k);
        if b[0] & 0x80 == 0 {
            let mut body = vec![0u8; len];
            s.read_exact(&mut body).map_err(|e| e.to_string())?;
            return Ok(Some(Packet {
                first: first[0],
                body,
            }));
        }
    }
    Err(crate::terr!("e-connect-mqtt-protocol"))
}

/// A subscribed connection.
pub struct Subscriber {
    s: TcpStream,
    keep_alive: Duration,
    last_sent: Instant,
}

impl Subscriber {
    /// Connect, check the CONNACK, subscribe and check the SUBACK.
    pub fn connect(cfg: &MqttConfig) -> Result<Self, String> {
        if cfg.qos > 1 || cfg.keep_alive_s == 0 || cfg.topic.is_empty() {
            return Err(crate::terr!("e-connect-mqtt-config"));
        }
        let a = cfg
            .addr
            .to_socket_addrs()
            .map_err(|e| format!("{}: {e}", cfg.addr))?
            .next()
            .ok_or_else(|| cfg.addr.clone())?;
        let mut s = TcpStream::connect_timeout(&a, Duration::from_secs(5))
            .map_err(|e| format!("{}: {e}", cfg.addr))?;
        s.set_read_timeout(Some(Duration::from_secs(5)))
            .map_err(|e| e.to_string())?;
        s.write_all(&connect_packet(cfg))
            .map_err(|e| e.to_string())?;
        let ack = read_packet(&mut s)?.ok_or_else(|| crate::terr!("e-connect-mqtt-closed"))?;
        if ack.first != 0x20 || ack.body.len() != 2 {
            return Err(crate::terr!("e-connect-mqtt-protocol"));
        }
        if ack.body[1] != 0 {
            return Err(crate::terr!(
                "e-connect-mqtt-refused",
                code = ack.body[1].to_string()
            ));
        }
        s.write_all(&subscribe_packet(1, &cfg.topic, cfg.qos))
            .map_err(|e| e.to_string())?;
        // The broker answers SUBSCRIBE with SUBACK before it sends any retained message.
        let p = read_packet(&mut s)?.ok_or_else(|| crate::terr!("e-connect-mqtt-closed"))?;
        if p.first != 0x90 || p.body.len() != 3 || p.body[..2] != [0, 1] || p.body[2] > 1 {
            return Err(crate::terr!("e-connect-mqtt-suback"));
        }
        let keep_alive = Duration::from_secs(u64::from(cfg.keep_alive_s));
        s.set_read_timeout(Some(keep_alive / 2))
            .map_err(|e| e.to_string())?;
        Ok(Self {
            s,
            keep_alive,
            last_sent: Instant::now(),
        })
    }

    /// The next message payload, or `Ok(None)` when nothing arrived within half the keep-alive (a
    /// PINGREQ is sent then, when due).
    pub fn next_payload(&mut self) -> Result<Option<Vec<u8>>, String> {
        let p = read_packet(&mut self.s)?;
        if self.last_sent.elapsed() >= self.keep_alive / 2 {
            self.s.write_all(&[0xC0, 0]).map_err(|e| e.to_string())?;
            self.last_sent = Instant::now();
        }
        let Some(p) = p else {
            return Ok(None);
        };
        match p.first >> 4 {
            3 => {
                let qos = (p.first >> 1) & 3;
                let tl = usize::from(u16::from_be_bytes([
                    *p.body
                        .first()
                        .ok_or_else(|| crate::terr!("e-connect-mqtt-protocol"))?,
                    *p.body
                        .get(1)
                        .ok_or_else(|| crate::terr!("e-connect-mqtt-protocol"))?,
                ]));
                let mut at = 2 + tl;
                if qos > 0 {
                    let id = p
                        .body
                        .get(at..at + 2)
                        .ok_or_else(|| crate::terr!("e-connect-mqtt-protocol"))?
                        .to_vec();
                    at += 2;
                    self.s
                        .write_all(&[0x40, 2, id[0], id[1]])
                        .map_err(|e| e.to_string())?;
                    self.last_sent = Instant::now();
                }
                let body = p
                    .body
                    .get(at..)
                    .ok_or_else(|| crate::terr!("e-connect-mqtt-protocol"))?;
                Ok(Some(body.to_vec()))
            }
            _ => Ok(None), // PINGRESP and anything else
        }
    }

    /// Send DISCONNECT.
    pub fn disconnect(mut self) {
        let _ = self.s.write_all(&[0xE0, 0]);
    }
}

/// Data lines kept before the feed trims the rows it has already emitted.
const KEEP_LINES: usize = 4096;

/// The continuous log built from message payloads, and what was emitted from it. Rows already emitted
/// are trimmed once the log passes a few thousand lines, keeping the clock of the whole run, so a
/// subscription can run for days in bounded memory.
pub struct Feed {
    preamble: String,
    lines: Vec<String>,
    t0: Option<f64>,
    state: WatchState,
    keep: usize,
    label: &'static str,
}

impl Feed {
    /// A feed for `mapping`. For CSV and TSV, `header` is the header row the publisher does not send.
    pub fn new(mapping: &Mapping, header: Option<&str>) -> Result<Self, String> {
        if mapping.source.format == "json" {
            return Err(crate::terr!("e-connect-watch-json"));
        }
        let csv = matches!(mapping.source.format.as_str(), "csv" | "tsv");
        let preamble = match (csv, header) {
            (true, Some(h)) => format!(
                "{}{}\n",
                "\n".repeat(mapping.source.skip_lines),
                h.trim_end()
            ),
            (true, None) => return Err(crate::terr!("e-connect-mqtt-header")),
            _ => String::new(),
        };
        Ok(Self {
            preamble,
            lines: Vec::new(),
            t0: None,
            state: WatchState::default(),
            keep: KEEP_LINES,
            label: "connect-mqtt",
        })
    }

    /// Trim emitted rows once more than `n` data lines are held (default 4096; at least 1).
    pub fn keep_lines(mut self, n: usize) -> Self {
        self.keep = n.max(1);
        self
    }

    /// Name the input in the header's `source_format` (`<label>:<format>`; default `connect-mqtt`).
    pub fn label(mut self, label: &'static str) -> Self {
        self.label = label;
        self
    }

    fn text(&self) -> String {
        let mut t = self.preamble.clone();
        for l in &self.lines {
            t.push_str(l);
            t.push('\n');
        }
        t
    }

    /// Add one payload (rows separated by line breaks) and return the records that became complete.
    pub fn push(
        &mut self,
        payload: &[u8],
        mapping: &Mapping,
        station: &Station,
    ) -> Result<Vec<Record>, String> {
        let p = String::from_utf8_lossy(payload);
        self.lines.extend(
            p.lines()
                .map(|l| l.trim_end_matches('\r'))
                .filter(|l| !l.trim().is_empty())
                .map(str::to_string),
        );
        let text = self.text();
        let out = step_text(
            &text,
            self.label,
            self.t0,
            mapping,
            station,
            &mut self.state,
            false,
        )?;
        if self.lines.len() > self.keep && self.state.emitted > 0 {
            self.trim(mapping, &text)?;
        }
        Ok(out)
    }

    /// Drop the rows of the epochs already emitted: everything before the first row of the held epoch.
    fn trim(&mut self, mapping: &Mapping, text: &str) -> Result<(), String> {
        let rows = crate::connect::row_times(mapping, text)?;
        let (Some(&(_, first)), Some(&(_, last))) = (rows.first(), rows.last()) else {
            return Ok(());
        };
        let tol = mapping.time.group_tolerance_s.unwrap_or(0.0005).max(0.0);
        let k = rows
            .iter()
            .rposition(|&(_, t)| t < last - tol)
            .map_or(0, |k| k + 1);
        let pre = self.preamble.lines().count();
        let cut = rows[k].0 - 1 - pre;
        self.t0.get_or_insert(first);
        self.lines.drain(..cut);
        self.state.emitted = 0;
        Ok(())
    }

    /// Release the held last epoch (end of a run).
    pub fn flush(&mut self, mapping: &Mapping, station: &Station) -> Result<Vec<Record>, String> {
        step_text(
            &self.text(),
            self.label,
            self.t0,
            mapping,
            station,
            &mut self.state,
            true,
        )
    }
}
