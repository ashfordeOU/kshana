// SPDX-License-Identifier: AGPL-3.0-only
//! Live ingest from a NATS server (roadmap A3b): subscribe to a subject and map the rows that arrive
//! into `kshana.obs/1` records, through the same feeds as an MQTT subscription
//! ([`crate::connect_mqtt::Feed`], one per subject with [`crate::connect_mqtt::TopicFeeds`]).
//!
//! The client speaks the NATS client protocol over TCP: it reads the server's `INFO`, sends `CONNECT`
//! (with a user and password, or a token, when given) and `SUB`, then reads `MSG` (and `HMSG`, whose
//! headers are skipped), answers `PING` with `PONG`, and refuses on `-ERR`. A lost connection is made
//! again, as for MQTT. TLS is not built in: for a server that requires it, use a local TLS relay. The
//! protocol is from the NATS documentation (client protocol), a public document.
use crate::connect::Mapping;
use crate::connect_mqtt::{Feed, RunStats, TopicFeeds};
use crate::obs::{Record, Station};
use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::time::Duration;

/// How to reach the server.
#[derive(Clone, Debug)]
pub struct NatsConfig {
    /// `host:port` (4222 is the usual port).
    pub addr: String,
    /// Subject, wildcards `*` and `>` allowed.
    pub subject: String,
    /// User and password, when the server asks for them.
    pub credentials: Option<(String, String)>,
    /// A token, when the server uses token authentication.
    pub token: Option<String>,
}

/// A subscribed connection.
pub struct NatsSubscriber {
    r: BufReader<TcpStream>,
    w: TcpStream,
}

fn proto() -> String {
    crate::terr!("e-connect-nats-protocol")
}

impl NatsSubscriber {
    /// Connect, read INFO, send CONNECT and SUB, and confirm with a PING/PONG round trip.
    pub fn connect(cfg: &NatsConfig) -> Result<Self, String> {
        if cfg.subject.is_empty() || cfg.subject.contains([' ', '\r', '\n']) {
            return Err(crate::terr!("e-connect-nats-config"));
        }
        let a = cfg
            .addr
            .to_socket_addrs()
            .map_err(|e| format!("{}: {e}", cfg.addr))?
            .next()
            .ok_or_else(|| cfg.addr.clone())?;
        let s = TcpStream::connect_timeout(&a, Duration::from_secs(5))
            .map_err(|e| format!("{}: {e}", cfg.addr))?;
        s.set_nodelay(true).map_err(|e| e.to_string())?;
        s.set_read_timeout(Some(Duration::from_secs(10)))
            .map_err(|e| e.to_string())?;
        let mut r = BufReader::new(s.try_clone().map_err(|e| e.to_string())?);
        let mut w = s;
        let mut line = String::new();
        r.read_line(&mut line).map_err(|e| e.to_string())?;
        if !line.starts_with("INFO ") {
            return Err(proto());
        }
        let mut opts = serde_json::json!({
            "verbose": false, "pedantic": false, "lang": "rust", "name": "kshana",
            "version": env!("CARGO_PKG_VERSION"), "protocol": 1, "headers": true,
        });
        if let Some((u, p)) = &cfg.credentials {
            opts["user"] = serde_json::json!(u);
            opts["pass"] = serde_json::json!(p);
        }
        if let Some(t) = &cfg.token {
            opts["auth_token"] = serde_json::json!(t);
        }
        let hello = format!("CONNECT {opts}\r\nSUB {} 1\r\nPING\r\n", cfg.subject);
        w.write_all(hello.as_bytes()).map_err(|e| e.to_string())?;
        loop {
            line.clear();
            if r.read_line(&mut line).map_err(|e| e.to_string())? == 0 {
                return Err(crate::terr!("e-connect-mqtt-closed"));
            }
            match line.trim_end() {
                "PONG" => break,
                "+OK" => {}
                l if l.starts_with("-ERR") => {
                    return Err(crate::terr!(
                        "e-connect-nats-refused",
                        reason = l
                            .trim_start_matches("-ERR")
                            .trim()
                            .trim_matches('\'')
                            .to_string()
                    ))
                }
                l if l.starts_with("INFO ") => {}
                _ => return Err(proto()),
            }
        }
        r.get_ref()
            .set_read_timeout(None)
            .map_err(|e| e.to_string())?;
        Ok(Self { r, w })
    }

    /// The next message as (subject, payload); `Ok(None)` when the server closed the connection.
    pub fn next_message(&mut self) -> Result<Option<(String, Vec<u8>)>, String> {
        let mut line = String::new();
        loop {
            line.clear();
            if self.r.read_line(&mut line).map_err(|e| e.to_string())? == 0 {
                return Ok(None);
            }
            let l = line.trim_end();
            let mut parts = l.split_ascii_whitespace();
            match parts.next() {
                Some("PING") => self.w.write_all(b"PONG\r\n").map_err(|e| e.to_string())?,
                Some("PONG" | "+OK" | "INFO") => {}
                Some(e) if e.starts_with("-ERR") => {
                    return Err(crate::terr!(
                        "e-connect-nats-refused",
                        reason = l
                            .trim_start_matches("-ERR")
                            .trim()
                            .trim_matches('\'')
                            .to_string()
                    ))
                }
                Some(op @ ("MSG" | "HMSG")) => {
                    let f: Vec<&str> = parts.collect();
                    let subject = f.first().ok_or_else(proto)?.to_string();
                    // MSG <subject> <sid> [reply-to] <bytes>; HMSG <subject> <sid> [reply-to] <hdr> <total>
                    let total: usize = f.last().and_then(|n| n.parse().ok()).ok_or_else(proto)?;
                    let hdr: usize = if op == "HMSG" {
                        f.get(f.len().wrapping_sub(2))
                            .and_then(|n| n.parse().ok())
                            .ok_or_else(proto)?
                    } else {
                        0
                    };
                    if hdr > total || total > 64 << 20 {
                        return Err(proto());
                    }
                    let mut buf = vec![0u8; total + 2];
                    self.r.read_exact(&mut buf).map_err(|e| e.to_string())?;
                    if &buf[total..] != b"\r\n" {
                        return Err(proto());
                    }
                    buf.truncate(total);
                    return Ok(Some((subject, buf.split_off(hdr))));
                }
                _ => return Err(proto()),
            }
        }
    }
}

fn pump(
    cfg: &NatsConfig,
    max_messages: Option<u64>,
    mut f: impl FnMut(String, Vec<u8>, bool) -> Result<bool, String>,
) -> Result<RunStats, String> {
    let mut stats = RunStats::default();
    let mut sub = NatsSubscriber::connect(cfg)?;
    loop {
        let (subject, p) = match sub.next_message() {
            Ok(Some(m)) => m,
            Ok(None) | Err(_) => {
                let mut wait = Duration::from_millis(200);
                sub = loop {
                    std::thread::sleep(wait);
                    match NatsSubscriber::connect(cfg) {
                        Ok(s) => break s,
                        Err(_) => wait = (wait * 2).min(Duration::from_secs(30)),
                    }
                };
                stats.reconnects += 1;
                continue;
            }
        };
        stats.messages += 1;
        let last = max_messages == Some(stats.messages);
        if !f(subject, p, last)? || last {
            return Ok(stats);
        }
    }
}

/// Subscribe and feed every message to `feed`, as [`crate::connect_mqtt::run`] does for MQTT.
pub fn run(
    cfg: &NatsConfig,
    mapping: &Mapping,
    station: &Station,
    feed: &mut Feed,
    max_messages: Option<u64>,
    mut on: impl FnMut(Vec<Record>) -> bool,
) -> Result<RunStats, String> {
    pump(cfg, max_messages, |_, p, last| {
        let more = on(feed.push(&p, mapping, station)?);
        if last {
            on(feed.flush(mapping, station)?);
        }
        Ok(more)
    })
}

/// [`run`] with one feed per subject (station id `<station.id>/<subject>`).
pub fn run_per_subject(
    cfg: &NatsConfig,
    mapping: &Mapping,
    station: &Station,
    feeds: &mut TopicFeeds,
    max_messages: Option<u64>,
    mut on: impl FnMut(Vec<Record>) -> bool,
) -> Result<RunStats, String> {
    pump(cfg, max_messages, |subject, p, last| {
        let more = on(feeds.push(&subject, &p, mapping, station)?);
        if last {
            on(feeds.flush(mapping)?);
        }
        Ok(more)
    })
}
