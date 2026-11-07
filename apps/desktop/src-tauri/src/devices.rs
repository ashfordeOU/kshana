// SPDX-License-Identifier: AGPL-3.0-only
//! Live devices (L2b): read a receiver's NMEA 0183 output from a serial port, a TCP
//! stream or a growing file, and keep the latest sentences as an excerpt that the trust
//! page scores with the native engine every few seconds.
//!
//! Read only. Nothing is written to the device or the network: a serial port and a file
//! are opened for reading, a TCP source is connected to and read. One capture runs at a
//! time. The excerpt is a rolling window of whole sentences (lines that start with `$`
//! or `!`), at most [`MAX_EXCERPT_BYTES`]; once the window rolls, the oldest sentences
//! leave it and the score starts its calibration again on what remains.

use std::collections::VecDeque;
use std::io::{BufRead, BufReader, ErrorKind, Read};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex};
use std::time::{Duration, SystemTime, UNIX_EPOCH};

use serde_json::{json, Value};

/// The largest excerpt kept (below the 2 MiB the trust page's scorer takes).
pub const MAX_EXCERPT_BYTES: usize = 1536 * 1024;
/// The longest line kept; a longer line is not NMEA 0183 and is counted as other data.
const MAX_LINE: usize = 512;
/// The serial speeds the Desktop sets.
pub const BAUDS: &[u32] = &[4800, 9600, 19200, 38400, 57600, 115200, 230400, 460800];

/// The serial ports this computer shows now, most likely receivers first.
pub fn list() -> Vec<Value> {
    let mut out: Vec<Value> = Vec::new();
    let mut push = |path: String, label: String| {
        if !out.iter().any(|v| v["path"] == path.as_str()) {
            out.push(json!({"path": path, "label": label}));
        }
    };
    #[cfg(target_os = "linux")]
    {
        // Stable names first: /dev/serial/by-id/<maker>_<product>-if00 -> ../../ttyACM0.
        if let Ok(rd) = std::fs::read_dir("/dev/serial/by-id") {
            let mut v: Vec<_> = rd.flatten().map(|e| e.path()).collect();
            v.sort();
            for p in v {
                let name = p.file_name().map(|n| n.to_string_lossy().to_string());
                push(p.to_string_lossy().to_string(), name.unwrap_or_default());
            }
        }
        list_dev(&["ttyACM", "ttyUSB", "ttyAMA", "rfcomm"], &mut push);
    }
    #[cfg(target_os = "macos")]
    list_dev(
        &[
            "cu.usbmodem",
            "cu.usbserial",
            "cu.SLAB",
            "cu.wchusbserial",
            "cu.",
        ],
        &mut push,
    );
    #[cfg(windows)]
    {
        // The ports Windows has mapped (the registry's SERIALCOMM key), without opening any.
        let q = std::process::Command::new("reg")
            .args(["query", r"HKLM\HARDWARE\DEVICEMAP\SERIALCOMM"])
            .output();
        if let Ok(o) = q {
            for l in String::from_utf8_lossy(&o.stdout).lines() {
                let f: Vec<&str> = l.split_whitespace().collect();
                if let [dev, "REG_SZ", com] = f[..] {
                    push(com.to_string(), format!("{com} ({dev})"));
                }
            }
        }
    }
    out
}

#[cfg(unix)]
fn list_dev(prefixes: &[&str], push: &mut impl FnMut(String, String)) {
    let Ok(rd) = std::fs::read_dir("/dev") else {
        return;
    };
    let mut names: Vec<String> = rd
        .flatten()
        .map(|e| e.file_name().to_string_lossy().to_string())
        .collect();
    names.sort();
    for pre in prefixes {
        for n in names.iter().filter(|n| n.starts_with(pre)) {
            push(format!("/dev/{n}"), n.clone());
        }
    }
}

/// What a capture has seen.
#[derive(Default)]
struct Ring {
    lines: VecDeque<String>,
    bytes: usize,
    sentences: u64,
    other_lines: u64,
    rolled: u64,
    last_unix_ms: Option<u64>,
    error: Option<String>,
    running: bool,
}

impl Ring {
    fn push_line(&mut self, raw: &[u8]) {
        let s = String::from_utf8_lossy(raw);
        let line = s.trim_matches(|c: char| c == '\r' || c == '\n' || c == '\0' || c == ' ');
        if line.is_empty() {
            return;
        }
        if line.len() > MAX_LINE || !(line.starts_with('$') || line.starts_with('!')) {
            self.other_lines += 1;
            return;
        }
        self.bytes += line.len() + 1;
        self.lines.push_back(line.to_string());
        self.sentences += 1;
        self.last_unix_ms = Some(now_ms());
        while self.bytes > MAX_EXCERPT_BYTES {
            match self.lines.pop_front() {
                Some(old) => {
                    self.bytes -= old.len() + 1;
                    self.rolled += 1;
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

struct Capture {
    source: String,
    started_unix_ms: u64,
    ring: Arc<Mutex<Ring>>,
    stop: Arc<AtomicBool>,
}

static CURRENT: Mutex<Option<Capture>> = Mutex::new(None);

/// How a source is read.
enum Kind {
    Tcp(String),
    Serial(String),
    File(String),
}

fn kind_of(source: &str) -> Result<Kind, String> {
    let s = source.trim();
    if s.is_empty() {
        return Err("no source: give a serial port, tcp:<host>:<port> or file:<path>".into());
    }
    if let Some(a) = s.strip_prefix("tcp:") {
        let a = a.trim_start_matches("//");
        if !a.contains(':') {
            return Err(format!("{s}: a TCP source is tcp:<host>:<port>"));
        }
        return Ok(Kind::Tcp(a.to_string()));
    }
    if let Some(p) = s.strip_prefix("file:") {
        return Ok(Kind::File(p.to_string()));
    }
    Ok(Kind::Serial(s.to_string()))
}

/// Set a serial port's speed with the system's own tool (`stty` on Linux and macOS).
/// On Windows the speed is the one set in the port's properties.
fn set_speed(path: &str, baud: u32) -> Result<(), String> {
    if !BAUDS.contains(&baud) {
        return Err(format!(
            "{baud} is not a serial speed the Desktop sets ({BAUDS:?})"
        ));
    }
    #[cfg(unix)]
    {
        let flag = if cfg!(target_os = "macos") {
            "-f"
        } else {
            "-F"
        };
        let st = std::process::Command::new("stty")
            .args([flag, path, &baud.to_string(), "raw", "-echo"])
            .status()
            .map_err(|e| format!("stty: {e}"))?;
        if !st.success() {
            return Err(format!("{path}: the speed could not be set to {baud}"));
        }
    }
    #[cfg(not(unix))]
    let _ = path;
    Ok(())
}

/// Start reading `source` (stopping any capture already running). `baud` sets a serial
/// port's speed first; `None` leaves it as it is.
pub fn start(source: &str, baud: Option<u32>) -> Result<Value, String> {
    stop();
    let kind = kind_of(source)?;
    let reader: Box<dyn Read + Send> = match &kind {
        Kind::Tcp(addr) => {
            use std::net::ToSocketAddrs;
            let sa = addr
                .to_socket_addrs()
                .map_err(|e| format!("{addr}: {e}"))?
                .next()
                .ok_or_else(|| format!("{addr}: no address"))?;
            let s = std::net::TcpStream::connect_timeout(&sa, Duration::from_secs(5))
                .map_err(|e| format!("{addr}: {e}"))?;
            s.set_read_timeout(Some(Duration::from_millis(300)))
                .map_err(|e| e.to_string())?;
            Box::new(s)
        }
        Kind::Serial(p) => {
            if let Some(b) = baud {
                set_speed(p, b)?;
            }
            #[cfg(windows)]
            let p = if p.starts_with(r"\\") {
                p.clone()
            } else {
                format!(r"\\.\{p}")
            };
            Box::new(std::fs::File::open(p.as_str()).map_err(|e| format!("{p}: {e}"))?)
        }
        Kind::File(p) => Box::new(std::fs::File::open(p).map_err(|e| format!("{p}: {e}"))?),
    };
    let follow = matches!(kind, Kind::File(_));
    let ring = Arc::new(Mutex::new(Ring {
        running: true,
        ..Ring::default()
    }));
    let stop_flag = Arc::new(AtomicBool::new(false));
    let (r2, s2) = (ring.clone(), stop_flag.clone());
    std::thread::Builder::new()
        .name("kshana-device".into())
        .spawn(move || read_loop(reader, follow, &r2, &s2))
        .map_err(|e| e.to_string())?;
    let cap = Capture {
        source: source.trim().to_string(),
        started_unix_ms: now_ms(),
        ring,
        stop: stop_flag,
    };
    *CURRENT.lock().unwrap_or_else(|p| p.into_inner()) = Some(cap);
    Ok(status())
}

fn read_loop(r: Box<dyn Read + Send>, follow: bool, ring: &Mutex<Ring>, stop: &AtomicBool) {
    let mut br = BufReader::with_capacity(64 * 1024, r);
    let mut buf = Vec::with_capacity(MAX_LINE);
    let lock = || ring.lock().unwrap_or_else(|p| p.into_inner());
    while !stop.load(Ordering::Relaxed) {
        // On a timeout, read_until keeps what it read in `buf`; the line goes on next time.
        match br.read_until(b'\n', &mut buf) {
            Ok(0) => {
                if !follow {
                    lock().error = Some("the source closed".into());
                    break;
                }
                // A growing file: wait for more.
                std::thread::sleep(Duration::from_millis(200));
            }
            Ok(_) if buf.ends_with(b"\n") => {
                lock().push_line(&buf);
                buf.clear();
            }
            Ok(_) => {
                if buf.len() > 64 * 1024 {
                    lock().other_lines += 1;
                    buf.clear();
                }
            }
            Err(e) if matches!(e.kind(), ErrorKind::WouldBlock | ErrorKind::TimedOut) => {}
            Err(e) if e.kind() == ErrorKind::Interrupted => {}
            Err(e) => {
                lock().error = Some(e.to_string());
                break;
            }
        }
    }
    lock().running = false;
}

/// The running capture's state, or `{"running": false}`.
pub fn status() -> Value {
    let cur = CURRENT.lock().unwrap_or_else(|p| p.into_inner());
    let Some(c) = cur.as_ref() else {
        return json!({"running": false, "source": null});
    };
    let r = c.ring.lock().unwrap_or_else(|p| p.into_inner());
    json!({
        "running": r.running,
        "source": c.source,
        "started_unix_ms": c.started_unix_ms,
        "sentences": r.sentences,
        "excerpt_sentences": r.lines.len(),
        "excerpt_bytes": r.bytes,
        "rolled": r.rolled,
        "other_lines": r.other_lines,
        "last_unix_ms": r.last_unix_ms,
        "error": r.error,
    })
}

/// The excerpt as NMEA text, with `seq` (the sentences seen so far) so a caller can skip
/// scoring an excerpt it has already scored.
pub fn excerpt() -> Value {
    let cur = CURRENT.lock().unwrap_or_else(|p| p.into_inner());
    let Some(c) = cur.as_ref() else {
        return json!({"seq": 0, "text": "", "sentences": 0});
    };
    let r = c.ring.lock().unwrap_or_else(|p| p.into_inner());
    let mut text = String::with_capacity(r.bytes);
    for l in &r.lines {
        text.push_str(l);
        text.push('\n');
    }
    json!({"seq": r.sentences, "text": text, "sentences": r.lines.len()})
}

/// Stop the capture. A serial read that is waiting for data ends when the next byte
/// arrives or the port closes; its data is no longer kept.
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

    fn wait_for(seq: u64) -> Value {
        for _ in 0..100 {
            let e = excerpt();
            if e["seq"].as_u64().unwrap_or(0) >= seq {
                return e;
            }
            std::thread::sleep(Duration::from_millis(50));
        }
        excerpt()
    }

    #[test]
    fn the_ring_keeps_sentences_only_and_rolls_at_its_limit() {
        let mut r = Ring::default();
        r.push_line(b"$GPGGA,1*00\r\n");
        r.push_line(b"garbage\r\n");
        r.push_line(b"!AIVDM,1*00\n");
        r.push_line(b"\r\n");
        assert_eq!(r.lines.len(), 2);
        assert_eq!(r.other_lines, 1);
        let long = format!("$GPXXX,{}", "1".repeat(400));
        for _ in 0..(MAX_EXCERPT_BYTES / 400 + 10) {
            r.push_line(long.as_bytes());
        }
        assert!(r.bytes <= MAX_EXCERPT_BYTES);
        assert!(r.rolled > 0);
        assert_eq!(r.bytes, r.lines.iter().map(|l| l.len() + 1).sum::<usize>());
    }

    #[test]
    fn sources_are_parsed_and_bad_ones_refused() {
        assert!(
            matches!(kind_of("tcp:127.0.0.1:10110"), Ok(Kind::Tcp(a)) if a == "127.0.0.1:10110")
        );
        assert!(
            matches!(kind_of("tcp://gps.local:2947"), Ok(Kind::Tcp(a)) if a == "gps.local:2947")
        );
        assert!(matches!(kind_of("/dev/ttyACM0"), Ok(Kind::Serial(_))));
        assert!(matches!(kind_of("file:/tmp/x.nmea"), Ok(Kind::File(_))));
        assert!(kind_of("tcp:nohost").is_err());
        assert!(kind_of("  ").is_err());
        assert!(set_speed("/dev/null", 1234).is_err());
        let _ = list(); // lists whatever this machine has; never fails
    }

    // One test drives the single global capture, so the file and TCP cases run in order.
    #[test]
    fn a_growing_file_and_a_tcp_stream_are_captured_read_only() {
        let p =
            std::env::temp_dir().join(format!("kshana-desktop-dev-{}.nmea", std::process::id()));
        let mut f = std::fs::File::create(&p).unwrap();
        writeln!(f, "$GPRMC,000001,A*00\r").unwrap();
        writeln!(f, "not nmea").unwrap();
        f.flush().unwrap();
        let src = format!("file:{}", p.display());
        let st = start(&src, None).unwrap();
        assert_eq!(st["running"], true);
        assert_eq!(wait_for(1)["seq"], 1);
        // The file grows: the capture follows it, and a line split across writes is whole.
        write!(f, "$GPRMC,0000").unwrap();
        f.flush().unwrap();
        std::thread::sleep(Duration::from_millis(300));
        writeln!(f, "02,A*00").unwrap();
        f.flush().unwrap();
        let e = wait_for(2);
        assert_eq!(e["text"], "$GPRMC,000001,A*00\n$GPRMC,000002,A*00\n");
        assert_eq!(status()["other_lines"], 1);
        assert_eq!(stop()["stopped"], src.as_str());
        assert_eq!(status()["running"], false);
        // A TCP source (a receiver's or a multiplexer's NMEA port).
        let l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap();
        let srv = std::thread::spawn(move || {
            let (mut s, _) = l.accept().unwrap();
            for i in 0..5 {
                writeln!(s, "$GPGGA,{i}*00\r").unwrap();
            }
            std::thread::sleep(Duration::from_millis(200));
        });
        start(&format!("tcp:{addr}"), None).unwrap();
        assert_eq!(wait_for(5)["sentences"], 5);
        srv.join().unwrap();
        for _ in 0..50 {
            if status()["running"] == false {
                break;
            }
            std::thread::sleep(Duration::from_millis(50));
        }
        let st = status();
        assert_eq!(st["running"], false);
        assert_eq!(st["error"], "the source closed");
        stop();
        assert!(start("tcp:127.0.0.1:1", None).is_err());
        std::fs::remove_file(&p).unwrap();
    }
}
