// SPDX-License-Identifier: AGPL-3.0-only
//! Live ships and aircraft (0.42 U26): read AIS NMEA 0183 over TCP or UDP, and Mode S / ADS-B as
//! Beast binary or AVR hex lines over TCP (as a local dump1090 or readsb serves them on ports
//! 30005 and 30002), keep the latest messages with the time each one arrived, and decode a
//! snapshot with the engine's own connectors (`kshana::interconnect`) for the shell's traffic view.
//!
//! Read only. A TCP source is connected to and read; a UDP source is a socket bound to the
//! address given (`udp:127.0.0.1:10110` takes datagrams sent to this computer's port 10110 on the
//! loopback address only; `udp:0.0.0.0:10110` from the network). Nothing is sent to a source or
//! anywhere else. One live source is read at a time, beside the receiver capture of
//! [`crate::devices`].
//!
//! Every message is stamped with the time it arrived here, so the tracks have a calendar time
//! even when the source gives none: an AIS sentence without a TAG block gets one with a `c:`
//! field in milliseconds (IEC 61162-450 style, with its checksum; a sentence that has one keeps
//! it), and a Beast or AVR frame becomes an AVR line `@<counter><hex>;` whose 48-bit counter runs
//! at 12 MHz from the start of the capture (the receiver's own counter is dropped). The time is
//! this computer's clock at reception, not the time of transmission.

use std::collections::VecDeque;
use std::io::{ErrorKind, Read};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

use serde_json::{json, Value};

/// The most message bytes kept (the oldest leave first).
pub const MAX_KEEP_BYTES: usize = 6 * 1024 * 1024;
/// The longest a message is kept, by default (seconds).
pub const DEFAULT_WINDOW_S: u64 = 1800;
/// The longest line kept; a longer one is not a message of these formats.
const MAX_LINE: usize = 600;

/// The message formats of a live source.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Format {
    /// AIS, NMEA 0183 `!AIVDM` / `!AIVDO` sentences (with or without TAG blocks).
    Ais,
    /// Mode S Beast binary frames.
    Beast,
    /// Mode S AVR hex lines (`*...;` or `@<counter>...;`).
    Avr,
}

impl Format {
    /// The format's name as the page gives it (`ais`, `beast`, `avr`).
    pub fn parse(s: &str) -> Result<Format, String> {
        match s.trim() {
            "ais" => Ok(Format::Ais),
            "beast" => Ok(Format::Beast),
            "avr" => Ok(Format::Avr),
            o => Err(format!("{o}: a live source is ais, beast or avr")),
        }
    }
    /// The engine reader the kept lines are decoded with (Beast frames are kept as AVR lines).
    fn reader(self) -> &'static str {
        match self {
            Format::Ais => "ais",
            Format::Beast | Format::Avr => "avr",
        }
    }
    fn name(self) -> &'static str {
        match self {
            Format::Ais => "ais",
            Format::Beast => "beast",
            Format::Avr => "avr",
        }
    }
}

/// How a live source is reached.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum Transport {
    /// Connect to `host:port` and read.
    Tcp(String),
    /// Bind a UDP socket to `host:port` and read the datagrams that arrive.
    Udp(String),
}

/// Parse `tcp:<host>:<port>` or `udp:<bind address>:<port>`. UDP carries AIS only (Beast and AVR
/// are served over TCP).
pub fn parse_source(source: &str, format: Format) -> Result<Transport, String> {
    let s = source.trim();
    let (kind, rest) = s.split_once(':').ok_or_else(|| {
        format!("{s}: a live source is tcp:<host>:<port> or udp:<address>:<port>")
    })?;
    let rest = rest.trim_start_matches("//");
    let port_ok = rest
        .rsplit_once(':')
        .is_some_and(|(h, p)| !h.is_empty() && p.parse::<u16>().is_ok_and(|p| p > 0));
    if !port_ok {
        return Err(format!(
            "{s}: give a host and a port, as in tcp:127.0.0.1:30005"
        ));
    }
    match kind {
        "tcp" => Ok(Transport::Tcp(rest.to_string())),
        "udp" if format == Format::Ais => Ok(Transport::Udp(rest.to_string())),
        "udp" => Err(format!("{s}: Beast and AVR are read over TCP")),
        _ => Err(format!("{s}: a live source starts with tcp: or udp:")),
    }
}

/// The NMEA checksum (XOR of the bytes) of `body`.
fn nmea_sum(body: &str) -> u8 {
    body.bytes().fold(0u8, |a, b| a ^ b)
}

/// An AIS line as kept: the sentence with a TAG block giving its arrival time, unless it has one.
pub fn stamp_ais(line: &str, unix_ms: u64) -> Option<String> {
    let l = line.trim_matches(|c: char| c == '\r' || c == '\n' || c == '\0' || c == ' ');
    if l.is_empty() || l.len() > MAX_LINE {
        return None;
    }
    if l.starts_with('\\') {
        return Some(l.to_string());
    }
    // an IEC 61162-450 header ("UdPbC\0...") before the sentence is dropped; the sentence starts at ! or $
    let at = l.find(['!', '$'])?;
    let body = format!("c:{unix_ms}");
    Some(format!("\\{body}*{:02X}\\{}", nmea_sum(&body), &l[at..]))
}

/// An AVR line as kept: `@` and the 48-bit 12 MHz counter of the arrival time, then the message.
pub fn avr_line(counter: u64, msg: &[u8]) -> String {
    let mut s = format!("@{:012X}", counter & 0xFFFF_FFFF_FFFF);
    for b in msg {
        s.push_str(&format!("{b:02X}"));
    }
    s.push(';');
    s
}

/// The message of an AVR line as a source writes it (`*hex;`, `@counter hex;` or `:counter hex;`).
pub fn avr_message(line: &str) -> Option<Vec<u8>> {
    let l = line.trim();
    let hex = if let Some(r) = l.strip_prefix('*') {
        r
    } else if let Some(r) = l.strip_prefix('@').or_else(|| l.strip_prefix('%')) {
        r.get(12..)?
    } else {
        return None;
    };
    let hex = hex.trim_end_matches(';');
    if !(hex.len() == 14 || hex.len() == 28) {
        return None;
    }
    (0..hex.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(&hex[i..i + 2], 16).ok())
        .collect()
}

/// A Beast stream cut into frames. Bytes arrive in pieces; a frame cut at the end of a piece is
/// kept for the next.
#[derive(Default)]
pub struct BeastFramer {
    buf: Vec<u8>,
    /// Frames read whose type is not a Mode S message (Mode A/C, status).
    pub other: u64,
}

impl BeastFramer {
    /// Feed bytes; returns the Mode S messages (7 or 14 bytes) of the whole frames they complete.
    pub fn push(&mut self, bytes: &[u8]) -> Vec<Vec<u8>> {
        self.buf.extend_from_slice(bytes);
        let mut out = Vec::new();
        let mut i = 0;
        let b = &self.buf;
        let mut keep_from = b.len();
        while i < b.len() {
            if b[i] != 0x1A {
                i += 1;
                continue;
            }
            let Some(&ty) = b.get(i + 1) else {
                keep_from = i;
                break;
            };
            let n = match ty {
                b'1' => 2,
                b'2' => 7,
                b'3' => 14,
                b'4' => 14,
                _ => {
                    i += 1;
                    continue;
                }
            };
            let mut body = Vec::with_capacity(7 + n);
            let mut j = i + 2;
            let mut broken = false;
            while body.len() < 7 + n && j < b.len() {
                if b[j] == 0x1A {
                    match b.get(j + 1) {
                        Some(&0x1A) => {
                            body.push(0x1A);
                            j += 2;
                            continue;
                        }
                        Some(_) => {
                            broken = true;
                            break;
                        }
                        None => break,
                    }
                }
                body.push(b[j]);
                j += 1;
            }
            if broken {
                i = j;
                continue;
            }
            if body.len() < 7 + n {
                keep_from = i;
                break;
            }
            if ty == b'2' || ty == b'3' {
                out.push(body[7..].to_vec());
            } else {
                self.other += 1;
            }
            i = j;
        }
        self.buf.drain(..keep_from.min(self.buf.len()));
        if self.buf.len() > 1 << 16 {
            self.buf.clear();
        }
        out
    }
}

/// The kept messages of a capture.
#[derive(Default)]
struct Keep {
    lines: VecDeque<(u64, String)>,
    bytes: usize,
    messages: u64,
    other: u64,
    dropped: u64,
    last_unix_ms: Option<u64>,
    error: Option<String>,
    running: bool,
}

impl Keep {
    fn push(&mut self, unix_ms: u64, line: String, window_ms: u64) {
        self.bytes += line.len() + 1;
        self.lines.push_back((unix_ms, line));
        self.messages += 1;
        self.last_unix_ms = Some(unix_ms);
        while self.bytes > MAX_KEEP_BYTES
            || self
                .lines
                .front()
                .is_some_and(|(t, _)| unix_ms.saturating_sub(*t) > window_ms)
        {
            match self.lines.pop_front() {
                Some((_, old)) => {
                    self.bytes -= old.len() + 1;
                    self.dropped += 1;
                }
                None => break,
            }
        }
    }
}

fn now_ms() -> u64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_millis() as u64)
        .unwrap_or(0)
}

struct Live {
    source: String,
    format: Format,
    started_unix_ms: u64,
    window_s: u64,
    keep: Arc<Mutex<Keep>>,
    stop: Arc<AtomicBool>,
}

static CURRENT: Mutex<Option<Live>> = Mutex::new(None);

/// What turns the bytes of a source into kept lines.
struct Intake {
    format: Format,
    start_ms: u64,
    window_ms: u64,
    partial: Vec<u8>,
    beast: BeastFramer,
}

impl Intake {
    fn feed(&mut self, bytes: &[u8], keep: &Mutex<Keep>) {
        let now = now_ms();
        let counter = now.saturating_sub(self.start_ms) * 12_000;
        let mut k = keep.lock().unwrap_or_else(|p| p.into_inner());
        if self.format == Format::Beast {
            for m in self.beast.push(bytes) {
                k.push(now, avr_line(counter, &m), self.window_ms);
            }
            k.other = self.beast.other;
            return;
        }
        self.partial.extend_from_slice(bytes);
        while let Some(p) = self.partial.iter().position(|&b| b == b'\n') {
            let raw: Vec<u8> = self.partial.drain(..=p).collect();
            let text = String::from_utf8_lossy(&raw);
            let kept = match self.format {
                Format::Ais => stamp_ais(&text, now),
                _ => avr_message(&text).map(|m| avr_line(counter, &m)),
            };
            match kept {
                Some(l) => k.push(now, l, self.window_ms),
                None if text.trim().is_empty() => {}
                None => k.other += 1,
            }
        }
        if self.partial.len() > 64 * 1024 {
            self.partial.clear();
            k.other += 1;
        }
    }
    /// A datagram ends its last line.
    fn end_datagram(&mut self, keep: &Mutex<Keep>) {
        if !self.partial.is_empty() {
            self.partial.push(b'\n');
            self.feed(&[], keep);
        }
    }
}

/// Start reading a live source (stopping one already running). `window_s` is how long a
/// message is kept (default [`DEFAULT_WINDOW_S`], at most a day).
pub fn start(source: &str, format: &str, window_s: Option<u64>) -> Result<Value, String> {
    stop();
    let format = Format::parse(format)?;
    let transport = parse_source(source, format)?;
    let window_s = window_s.unwrap_or(DEFAULT_WINDOW_S).clamp(30, 86_400);
    let keep = Arc::new(Mutex::new(Keep {
        running: true,
        ..Keep::default()
    }));
    let stop_flag = Arc::new(AtomicBool::new(false));
    let started = now_ms();
    let mut intake = Intake {
        format,
        start_ms: started,
        window_ms: window_s * 1000,
        partial: Vec::new(),
        beast: BeastFramer::default(),
    };
    let (k2, s2) = (keep.clone(), stop_flag.clone());
    match transport {
        Transport::Tcp(addr) => {
            use std::net::ToSocketAddrs;
            let sa = addr
                .to_socket_addrs()
                .map_err(|e| format!("{addr}: {e}"))?
                .next()
                .ok_or_else(|| format!("{addr}: no address"))?;
            let mut s = std::net::TcpStream::connect_timeout(&sa, Duration::from_secs(5))
                .map_err(|e| format!("{addr}: {e}"))?;
            s.set_read_timeout(Some(Duration::from_millis(300)))
                .map_err(|e| e.to_string())?;
            std::thread::Builder::new()
                .name("kshana-live".into())
                .spawn(move || {
                    let mut buf = vec![0u8; 64 * 1024];
                    while !s2.load(Ordering::Relaxed) {
                        match s.read(&mut buf) {
                            Ok(0) => {
                                k2.lock().unwrap_or_else(|p| p.into_inner()).error =
                                    Some("the source closed".into());
                                break;
                            }
                            Ok(n) => intake.feed(&buf[..n], &k2),
                            Err(e)
                                if matches!(
                                    e.kind(),
                                    ErrorKind::WouldBlock
                                        | ErrorKind::TimedOut
                                        | ErrorKind::Interrupted
                                ) => {}
                            Err(e) => {
                                k2.lock().unwrap_or_else(|p| p.into_inner()).error =
                                    Some(e.to_string());
                                break;
                            }
                        }
                    }
                    k2.lock().unwrap_or_else(|p| p.into_inner()).running = false;
                })
                .map_err(|e| e.to_string())?;
        }
        Transport::Udp(addr) => {
            let s = std::net::UdpSocket::bind(addr.as_str()).map_err(|e| format!("{addr}: {e}"))?;
            s.set_read_timeout(Some(Duration::from_millis(300)))
                .map_err(|e| e.to_string())?;
            std::thread::Builder::new()
                .name("kshana-live".into())
                .spawn(move || {
                    let mut buf = vec![0u8; 64 * 1024];
                    while !s2.load(Ordering::Relaxed) {
                        match s.recv(&mut buf) {
                            Ok(n) => {
                                intake.feed(&buf[..n], &k2);
                                intake.end_datagram(&k2);
                            }
                            Err(e)
                                if matches!(
                                    e.kind(),
                                    ErrorKind::WouldBlock
                                        | ErrorKind::TimedOut
                                        | ErrorKind::Interrupted
                                ) => {}
                            Err(e) => {
                                k2.lock().unwrap_or_else(|p| p.into_inner()).error =
                                    Some(e.to_string());
                                break;
                            }
                        }
                    }
                    k2.lock().unwrap_or_else(|p| p.into_inner()).running = false;
                })
                .map_err(|e| e.to_string())?;
        }
    }
    *CURRENT.lock().unwrap_or_else(|p| p.into_inner()) = Some(Live {
        source: source.trim().to_string(),
        format,
        started_unix_ms: started,
        window_s,
        keep,
        stop: stop_flag,
    });
    Ok(status())
}

/// The live source's state, or `{"running": false}`.
pub fn status() -> Value {
    let cur = CURRENT.lock().unwrap_or_else(|p| p.into_inner());
    let Some(c) = cur.as_ref() else {
        return json!({"running": false, "source": null});
    };
    let k = c.keep.lock().unwrap_or_else(|p| p.into_inner());
    json!({
        "running": k.running,
        "source": c.source,
        "format": c.format.name(),
        "started_unix_ms": c.started_unix_ms,
        "window_s": c.window_s,
        "messages": k.messages,
        "kept": k.lines.len(),
        "kept_bytes": k.bytes,
        "dropped": k.dropped,
        "other": k.other,
        "last_unix_ms": k.last_unix_ms,
        "error": k.error,
    })
}

/// The kept messages decoded by the engine's reader, as `decode_tracks` answers (the JSON text
/// of `kshana.tracks/1` in one object), with `seq` (messages seen so far) and `live` (the status).
/// With nothing kept yet, `fixes` is empty.
pub fn snapshot() -> Result<Value, String> {
    use kshana::interconnect::{decode, Options};
    let (format, started, text, first_ms, seq) = {
        let cur = CURRENT.lock().unwrap_or_else(|p| p.into_inner());
        let Some(c) = cur.as_ref() else {
            return Err("no live source is being read".into());
        };
        let k = c.keep.lock().unwrap_or_else(|p| p.into_inner());
        let mut text = String::with_capacity(k.bytes);
        for (_, l) in &k.lines {
            text.push_str(l);
            text.push('\n');
        }
        (
            c.format,
            c.started_unix_ms,
            text,
            k.lines.front().map(|(t, _)| *t),
            k.messages,
        )
    };
    let mut opt = Options::default();
    if format != Format::Ais {
        // The AVR reader counts from the first line it reads: its arrival time.
        let first_counter = first_ms.map(|t| t.saturating_sub(started) * 12_000);
        opt.start_unix_s =
            Some((started as f64 + first_counter.unwrap_or(0) as f64 / 12_000.0) / 1000.0);
    }
    let d = decode(format.reader(), text.as_bytes(), &opt)?;
    let mut v = crate::bridge::tracks_json(format.reader(), &d);
    v["seq"] = json!(seq);
    v["live"] = status();
    Ok(json!(v.to_string()))
}

/// Stop reading the live source.
pub fn stop() -> Value {
    let old = CURRENT.lock().unwrap_or_else(|p| p.into_inner()).take();
    match old {
        Some(c) => {
            c.stop.store(true, Ordering::Relaxed);
            json!({"stopped": c.source})
        }
        None => json!({"stopped": null}),
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::io::Write;

    const AIS: &str = "!AIVDM,1,1,,A,13`l7@0P1sPDN;pMdqA4lSj1R000,0*47";
    // The 1090 Megahertz Riddle's worked examples: an even and an odd airborne position of 40621D.
    const EVEN: &str = "8D40621D58C382D690C8AC2863A7";
    const ODD: &str = "8D40621D58C386435CC412692AD6";

    fn hexb(s: &str) -> Vec<u8> {
        (0..s.len())
            .step_by(2)
            .map(|i| u8::from_str_radix(&s[i..i + 2], 16).unwrap())
            .collect()
    }
    fn beast_frame(msg: &[u8], counter: u64) -> Vec<u8> {
        let mut body: Vec<u8> = counter.to_be_bytes()[2..].to_vec();
        body.push(0x80);
        body.extend_from_slice(msg);
        let mut out = vec![0x1A, b'3'];
        for b in body {
            out.push(b);
            if b == 0x1A {
                out.push(0x1A);
            }
        }
        out
    }

    #[test]
    fn sources_are_parsed_and_bad_ones_refused() {
        assert_eq!(
            parse_source("tcp:127.0.0.1:30005", Format::Beast),
            Ok(Transport::Tcp("127.0.0.1:30005".into()))
        );
        assert_eq!(
            parse_source("udp://0.0.0.0:10110", Format::Ais),
            Ok(Transport::Udp("0.0.0.0:10110".into()))
        );
        assert!(parse_source("udp:127.0.0.1:30005", Format::Beast).is_err());
        assert!(parse_source("tcp:host", Format::Ais).is_err());
        assert!(parse_source("tcp::30005", Format::Ais).is_err());
        assert!(parse_source("tcp:h:0", Format::Ais).is_err());
        assert!(parse_source("serial:/dev/x", Format::Ais).is_err());
        assert!(Format::parse("nmea").is_err());
    }

    #[test]
    fn an_ais_sentence_gets_a_tag_block_with_its_arrival_time() {
        let s = stamp_ais(&format!("{AIS}\r\n"), 1_700_000_000_123).unwrap();
        assert!(s.starts_with("\\c:1700000000123*"));
        assert!(s.ends_with(AIS));
        // the tag's checksum is the XOR of its body, as the reader checks it
        let tag = &s[1..s[1..].find('\\').unwrap() + 1];
        let (body, sum) = tag.split_once('*').unwrap();
        assert_eq!(u8::from_str_radix(sum, 16).unwrap(), nmea_sum(body));
        let d = kshana::interconnect::decode("ais", s.as_bytes(), &Default::default()).unwrap();
        assert_eq!(d.fixes.len(), 1);
        assert_eq!(d.fixes[0].t_unix_s, Some(1_700_000_000.123));
        // a sentence with its own tag block keeps it
        let own = "\\c:1700000000*5F\\!AIVDM,1,1,,A,13`l7@0P1sPDN;pMdqA4lSj1R000,0*47";
        assert_eq!(stamp_ais(own, 5).unwrap(), own);
        assert!(stamp_ais("", 5).is_none());
        assert!(stamp_ais("garbage", 5).is_none());
    }

    #[test]
    fn beast_frames_are_cut_across_pieces_and_unescaped() {
        let mut f = BeastFramer::default();
        let mut stream = beast_frame(&hexb(EVEN), 0x1A1A_0000_0001);
        stream.extend(beast_frame(&hexb(ODD), 2));
        stream.extend([0x1A, b'1', 0, 0, 0, 0, 0, 1, 0x50, 0x12, 0x34]);
        let (a, b) = stream.split_at(9);
        assert!(f.push(a).is_empty());
        let got = f.push(b);
        assert_eq!(got, vec![hexb(EVEN), hexb(ODD)]);
        assert_eq!(f.other, 1);
        assert_eq!(
            avr_message(&format!("*{EVEN};")).unwrap(),
            hexb(EVEN),
            "an AVR line"
        );
        assert_eq!(
            avr_message(&format!("@0000000012AB{ODD};")).unwrap(),
            hexb(ODD)
        );
        assert!(avr_message("*12;").is_none());
        assert_eq!(
            avr_line(12_000_000, &hexb(EVEN)),
            format!("@000000B71B00{EVEN};")
        );
    }

    #[test]
    fn the_keep_rolls_by_age_and_size() {
        let mut k = Keep::default();
        k.push(0, "a".into(), 1000);
        k.push(500, "b".into(), 1000);
        k.push(2000, "c".into(), 1000);
        assert_eq!(k.lines.len(), 1);
        assert_eq!(k.dropped, 2);
        assert_eq!(k.bytes, 2);
    }

    // One test drives the single global live source, so the TCP and UDP cases run in order.
    #[test]
    fn tcp_beast_and_udp_ais_are_read_stamped_and_decoded() {
        // Beast over TCP: the odd and even positions give 40621D's position at reception time.
        let l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap();
        let srv = std::thread::spawn(move || {
            let (mut s, _) = l.accept().unwrap();
            // odd then even, as the book decodes them (the position is the even message's)
            s.write_all(&beast_frame(&hexb(ODD), 1)).unwrap();
            std::thread::sleep(Duration::from_millis(100));
            s.write_all(&beast_frame(&hexb(EVEN), 2)).unwrap();
            std::thread::sleep(Duration::from_millis(600));
        });
        let before = now_ms() as f64 / 1000.0;
        let st = start(&format!("tcp:{addr}"), "beast", None).unwrap();
        assert_eq!(st["format"], "beast");
        let mut snap = Value::Null;
        for _ in 0..60 {
            std::thread::sleep(Duration::from_millis(50));
            let v: Value = serde_json::from_str(snapshot().unwrap().as_str().unwrap()).unwrap();
            if !v["fixes"].as_array().unwrap().is_empty() {
                snap = v;
                break;
            }
        }
        assert_eq!(snap["source_format"], "avr");
        let fx = &snap["fixes"][0];
        assert_eq!(fx["id"], "40621D");
        assert!(
            (fx["lat_deg"].as_f64().unwrap() - 52.2572).abs() < 1e-3,
            "{fx}"
        );
        let t = fx["t_unix_s"].as_f64().unwrap();
        assert!(
            t >= before - 1.0 && t <= now_ms() as f64 / 1000.0 + 1.0,
            "{t}"
        );
        srv.join().unwrap();
        stop();
        assert_eq!(status()["running"], false);
        assert!(snapshot().is_err());

        // AIS over UDP, bound to the loopback address.
        let probe = std::net::UdpSocket::bind("127.0.0.1:0").unwrap();
        let port = probe.local_addr().unwrap().port();
        drop(probe);
        start(&format!("udp:127.0.0.1:{port}"), "ais", Some(60)).unwrap();
        let tx = std::net::UdpSocket::bind("127.0.0.1:0").unwrap();
        let mut got = Value::Null;
        for _ in 0..60 {
            tx.send_to(AIS.as_bytes(), ("127.0.0.1", port)).unwrap();
            std::thread::sleep(Duration::from_millis(50));
            let v: Value = serde_json::from_str(snapshot().unwrap().as_str().unwrap()).unwrap();
            if !v["fixes"].as_array().unwrap().is_empty() {
                got = v;
                break;
            }
        }
        assert_eq!(got["source_format"], "ais");
        assert!(got["fixes"][0]["t_unix_s"].as_f64().is_some());
        assert_eq!(got["live"]["window_s"], 60);
        stop();
        assert!(start("tcp:127.0.0.1:1", "ais", None).is_err());
        assert!(start("udp:127.0.0.1:1", "beast", None).is_err());
    }
}
