// SPDX-License-Identifier: AGPL-3.0-only
//! Syslog output for SIEM ingestion: Common Event Format (CEF) and Log Event Extended Format (LEEF) 2.0 payloads in an
//! RFC 5424 syslog envelope. The field mapping is documented in `docs/TRUST-TELEMETRY.md`.
//!
//! Formatting is pure (the timestamp is passed in) so the tests pin exact bytes.

use super::sample::{Band, TrustSample};
use std::io::Write;
use std::net::{SocketAddr, TcpStream, ToSocketAddrs, UdpSocket};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::mpsc::{sync_channel, Receiver, SyncSender};
use std::sync::Arc;
use std::thread::JoinHandle;
use std::time::{Duration, Instant};

/// Vendor field of every event.
pub const VENDOR: &str = "Ashforde OU";
/// Product field of every event.
pub const PRODUCT: &str = "Kshana";
/// Device event class prefix: the event id is `gnss-trust.<band>`.
pub const EVENT_PREFIX: &str = "gnss-trust";

/// Payload dialect.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Format {
    /// Common Event Format (CEF).
    Cef,
    /// Log Event Extended Format (LEEF) 2.0.
    Leef,
}

/// CEF severity 0-10 for a band: nominal and calibrating are informational, degraded is
/// medium, untrusted is very high.
pub fn cef_severity(b: Band) -> u8 {
    match b {
        Band::Calibrating => 0,
        Band::Nominal => 1,
        Band::Degraded => 5,
        Band::Untrusted => 9,
        Band::Unknown => 3,
    }
}

/// RFC 5424 severity: info (6) for nominal or calibrating, warning (4) for degraded,
/// critical (2) for untrusted, notice (5) for an unknown band.
pub fn syslog_severity(b: Band) -> u8 {
    match b {
        Band::Calibrating | Band::Nominal => 6,
        Band::Degraded => 4,
        Band::Untrusted => 2,
        Band::Unknown => 5,
    }
}

fn cef_header_escape(s: &str) -> String {
    s.replace('\\', "\\\\")
        .replace('|', "\\|")
        .replace(['\n', '\r'], " ")
}

fn cef_ext_escape(s: &str) -> String {
    s.replace('\\', "\\\\")
        .replace('=', "\\=")
        .replace('\n', "\\n")
        .replace('\r', "\\r")
}

fn leef_escape(s: &str) -> String {
    // The delimiter is `^`; neither it nor a line break may appear in a value.
    s.replace(['^', '\n', '\r', '\t'], " ")
}

fn num(x: f64) -> String {
    format!("{x}")
}

/// The CEF line (no syslog envelope).
///
/// `CEF:0|Ashforde OU|Kshana|<version>|gnss-trust.<band>|GNSS trust <band>|<sev>|ext`
/// where the extension carries `cat`, `cs1` band, `cs2` reasons (comma-separated), `cs3`
/// the previous band, `cfp1` trust score and `cfp2` epoch offset in seconds, `cs4` log time and
/// `cs5` gate state. `cfp1` and `cfp2` are the CEF dictionary's floating-point custom fields
/// (deviceCustomFloatingPoint); the integer fields `cn1` to `cn3` are not used, because the score
/// and the offset are not integers. `cfp1` is left out when the source gives no score. `dvchost`
/// is the sending host.
pub fn cef(s: &TrustSample, prev: Option<Band>, host: &str, version: &str) -> String {
    let mut ext = format!(
        "cat=gnss-trust dvchost={} cs1Label=band cs1={}",
        cef_ext_escape(host),
        s.band.label()
    );
    if !s.reasons.is_empty() {
        ext.push_str(&format!(
            " cs2Label=reasons cs2={}",
            cef_ext_escape(&s.reasons.join(","))
        ));
    }
    if let Some(p) = prev {
        ext.push_str(&format!(" cs3Label=previousBand cs3={}", p.label()));
    }
    if let Some(sc) = s.score {
        ext.push_str(&format!(" cfp1Label=trustScore cfp1={}", num(sc)));
    }
    ext.push_str(&format!(" cfp2Label=epochOffsetSeconds cfp2={}", num(s.t_s)));
    if let Some(l) = &s.time_label {
        ext.push_str(&format!(" cs4Label=logTime cs4={}", cef_ext_escape(l)));
    }
    if let Some(g) = &s.gate {
        ext.push_str(&format!(" cs5Label=gate cs5={}", cef_ext_escape(g)));
    }
    format!(
        "CEF:0|{}|{}|{}|{EVENT_PREFIX}.{}|GNSS trust {}|{}|{ext}",
        cef_header_escape(VENDOR),
        cef_header_escape(PRODUCT),
        cef_header_escape(version),
        s.band.label(),
        s.band.label(),
        cef_severity(s.band)
    )
}

/// The LEEF 2.0 line (no syslog envelope), delimiter `^`.
///
/// Attributes: `cat`, `sev` (1-10, the CEF severity with a floor of 1), `devHost`, `band`,
/// `previousBand`, `trustScore`, `reasons`, `epochOffsetSeconds`, `logTime`.
pub fn leef(s: &TrustSample, prev: Option<Band>, host: &str, version: &str) -> String {
    let mut a: Vec<String> = vec![
        format!("cat={EVENT_PREFIX}"),
        format!("sev={}", cef_severity(s.band).max(1)),
        format!("devHost={}", leef_escape(host)),
        format!("band={}", s.band.label()),
    ];
    if let Some(p) = prev {
        a.push(format!("previousBand={}", p.label()));
    }
    if let Some(sc) = s.score {
        a.push(format!("trustScore={}", num(sc)));
    }
    if !s.reasons.is_empty() {
        a.push(format!("reasons={}", leef_escape(&s.reasons.join(","))));
    }
    a.push(format!("epochOffsetSeconds={}", num(s.t_s)));
    if let Some(l) = &s.time_label {
        a.push(format!("logTime={}", leef_escape(l)));
    }
    if let Some(g) = &s.gate {
        a.push(format!("gate={}", leef_escape(g)));
    }
    format!(
        "LEEF:2.0|{}|{}|{}|{EVENT_PREFIX}.{}|^|{}",
        VENDOR.replace('|', " "),
        PRODUCT,
        version.replace('|', " "),
        s.band.label(),
        a.join("^")
    )
}

/// Wrap a payload in an RFC 5424 envelope: facility local0 (16), `app` `kshana`, message id
/// `GNSSTRUST`. `timestamp` is RFC 3339 UTC, or `None` for the NILVALUE `-`.
pub fn rfc5424(band: Band, timestamp: Option<&str>, host: &str, payload: &str) -> String {
    let pri = 16 * 8 + u32::from(syslog_severity(band));
    let host = if host.is_empty() { "-" } else { host };
    // HOSTNAME is at most 255 printable ASCII characters (RFC 5424).
    let host: String = host
        .chars()
        .filter(|c| c.is_ascii_graphic())
        .take(255)
        .collect();
    format!(
        "<{pri}>1 {} {} kshana - GNSSTRUST - {payload}",
        timestamp.unwrap_or("-"),
        if host.is_empty() { "-" } else { &host }
    )
}

pub use super::time::rfc3339_utc;

/// How a [`SyslogSink`] reaches its collector.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Proto {
    /// One datagram per message.
    Udp,
    /// A TCP stream, one message per line (non-transparent framing).
    Tcp,
    /// A TCP stream with octet-counting framing (RFC 6587): `<length> <message>`.
    TcpOctetCounting,
}

/// Timeouts and limits of a [`SyslogSink`].
#[derive(Clone, Copy, Debug)]
pub struct SinkConfig {
    /// Connection attempt limit.
    pub connect_timeout: Duration,
    /// Limit on each write; a collector that stops reading costs at most this per attempt.
    pub write_timeout: Duration,
    /// First wait before reconnecting after a failure; doubles up to `backoff_max`.
    pub backoff_min: Duration,
    /// Longest wait between reconnection attempts.
    pub backoff_max: Duration,
    /// Messages queued for the sender thread; beyond this, new ones are dropped and counted.
    pub queue: usize,
}

impl Default for SinkConfig {
    fn default() -> Self {
        SinkConfig {
            connect_timeout: Duration::from_secs(2),
            write_timeout: Duration::from_secs(2),
            backoff_min: Duration::from_secs(1),
            backoff_max: Duration::from_secs(60),
            queue: 1024,
        }
    }
}

/// Sends syslog lines from a worker thread, so the caller never waits on a collector.
///
/// [`SyslogSink::send`] only enqueues. The worker connects with a timeout, writes with a
/// timeout, drops a failed connection and reconnects lazily with capped exponential
/// backoff. A message that cannot be delivered (queue full, collector down, write timed
/// out) is dropped and counted in the failure counter, which the Prometheus registry
/// exposes as `kshana_trust_syslog_send_failures_total`.
pub struct SyslogSink {
    tx: Option<SyncSender<String>>,
    worker: Option<JoinHandle<()>>,
    failures: Arc<AtomicU64>,
}

impl SyslogSink {
    /// Start a sink to `addr` (`host:port`; IPv4, IPv6 or a name). `failures` is incremented
    /// for every message not delivered.
    pub fn start(addr: &str, proto: Proto, cfg: SinkConfig, failures: Arc<AtomicU64>) -> Self {
        let (tx, rx) = sync_channel::<String>(cfg.queue.max(1));
        let addr = addr.to_string();
        let f = Arc::clone(&failures);
        let worker = std::thread::spawn(move || worker_loop(&addr, proto, cfg, &rx, &f));
        SyslogSink {
            tx: Some(tx),
            worker: Some(worker),
            failures,
        }
    }

    /// Queue one message; never blocks.
    pub fn send(&self, line: String) {
        let ok = self.tx.as_ref().is_some_and(|t| t.try_send(line).is_ok());
        if !ok {
            self.failures.fetch_add(1, Ordering::Relaxed);
        }
    }

    /// Stop accepting messages and wait for the worker to drain its queue. Bounded: every
    /// network operation has a timeout and a down collector is skipped, not retried, while
    /// the backoff runs.
    pub fn finish(mut self) {
        self.tx = None;
        if let Some(w) = self.worker.take() {
            let _ = w.join();
        }
    }
}

fn resolve(addr: &str) -> Option<Vec<SocketAddr>> {
    addr.to_socket_addrs().ok().map(Iterator::collect)
}

fn connect(addr: &str, timeout: Duration, write_timeout: Duration) -> Option<TcpStream> {
    for a in resolve(addr)? {
        if let Ok(s) = TcpStream::connect_timeout(&a, timeout) {
            let _ = s.set_write_timeout(Some(write_timeout));
            let _ = s.set_nodelay(true);
            return Some(s);
        }
    }
    None
}

fn worker_loop(
    addr: &str,
    proto: Proto,
    cfg: SinkConfig,
    rx: &Receiver<String>,
    failures: &AtomicU64,
) {
    let mut udp: Option<UdpSocket> = None;
    let mut tcp: Option<TcpStream> = None;
    let mut backoff = cfg.backoff_min;
    let mut retry_at = Instant::now();
    for line in rx.iter() {
        let sent = match proto {
            Proto::Udp => {
                if udp.is_none() {
                    // Bind in the collector's address family so IPv6 targets work.
                    let bind = match resolve(addr).and_then(|v| v.first().copied()) {
                        Some(a) if a.is_ipv6() => "[::]:0",
                        _ => "0.0.0.0:0",
                    };
                    udp = UdpSocket::bind(bind).ok();
                    if let Some(u) = &udp {
                        let _ = u.set_write_timeout(Some(cfg.write_timeout));
                    }
                }
                match (&udp, resolve(addr).and_then(|v| v.first().copied())) {
                    (Some(u), Some(a)) => u.send_to(line.as_bytes(), a).is_ok(),
                    _ => false,
                }
            }
            Proto::Tcp | Proto::TcpOctetCounting => {
                if tcp.is_none() && Instant::now() >= retry_at {
                    tcp = connect(addr, cfg.connect_timeout, cfg.write_timeout);
                    if tcp.is_none() {
                        retry_at = Instant::now() + backoff;
                        backoff = (backoff * 2).min(cfg.backoff_max);
                    }
                }
                match tcp.as_mut() {
                    None => false,
                    Some(s) => {
                        let framed = if proto == Proto::TcpOctetCounting {
                            format!("{} {line}", line.len())
                        } else {
                            format!("{line}\n")
                        };
                        if s.write_all(framed.as_bytes()).is_ok() {
                            backoff = cfg.backoff_min;
                            true
                        } else {
                            // A broken or stalled connection is dropped, never retried in place.
                            tcp = None;
                            retry_at = Instant::now() + backoff;
                            backoff = (backoff * 2).min(cfg.backoff_max);
                            false
                        }
                    }
                }
            }
        };
        if !sent {
            failures.fetch_add(1, Ordering::Relaxed);
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample() -> TrustSample {
        TrustSample {
            t_s: 130.5,
            time_label: Some("2026-01-01T00:02:10Z".into()),
            score: Some(41.5),
            band: Band::Degraded,
            reasons: vec!["cn0-drop".into(), "agc".into()],
            gate: Some("withheld".into()),
            position: None,
        }
    }

    #[test]
    fn cef_exact() {
        assert_eq!(
            cef(&sample(), Some(Band::Nominal), "ops-gw1", "0.35.0"),
            "CEF:0|Ashforde OU|Kshana|0.35.0|gnss-trust.degraded|GNSS trust degraded|5|\
             cat=gnss-trust dvchost=ops-gw1 cs1Label=band cs1=degraded \
             cs2Label=reasons cs2=cn0-drop,agc cs3Label=previousBand cs3=nominal \
             cfp1Label=trustScore cfp1=41.5 cfp2Label=epochOffsetSeconds cfp2=130.5 \
             cs4Label=logTime cs4=2026-01-01T00:02:10Z cs5Label=gate cs5=withheld"
        );
    }

    #[test]
    fn leef_exact() {
        assert_eq!(
            leef(&sample(), Some(Band::Nominal), "ops-gw1", "0.35.0"),
            "LEEF:2.0|Ashforde OU|Kshana|0.35.0|gnss-trust.degraded|^|\
             cat=gnss-trust^sev=5^devHost=ops-gw1^band=degraded^previousBand=nominal^\
             trustScore=41.5^reasons=cn0-drop,agc^epochOffsetSeconds=130.5^\
             logTime=2026-01-01T00:02:10Z^gate=withheld"
        );
    }

    #[test]
    fn cef_escapes_header_and_extension() {
        let mut s = sample();
        s.score = None;
        s.time_label = None;
        s.reasons = vec!["a=b".into(), "c\nd".into()];
        let line = cef(&s, None, "h|ost", "1|0");
        assert!(line.starts_with("CEF:0|Ashforde OU|Kshana|1\\|0|"));
        assert!(line.contains("cs2=a\\=b,c\\nd"));
        assert!(!line.contains('\n'));
        assert!(!line.contains("cfp1"));
        assert!(!line.contains("previousBand"));
    }

    #[test]
    fn no_empty_reasons_field() {
        let mut s = sample();
        s.reasons.clear();
        assert!(!cef(&s, None, "h", "1").contains("cs2"));
        assert!(!leef(&s, None, "h", "1").contains("reasons="));
    }

    #[test]
    fn hostname_is_capped() {
        let long = "h".repeat(400);
        let line = rfc5424(Band::Nominal, None, &long, "X");
        assert_eq!(line.split(' ').nth(2).unwrap().len(), 255);
    }

    #[test]
    fn leef_strips_delimiter_and_newlines_from_values() {
        let mut s = sample();
        s.reasons = vec!["x^y".into(), "p\nq".into()];
        let line = leef(&s, None, "h", "1");
        assert!(line.contains("reasons=x y,p q^"));
        assert!(!line.contains('\n'));
    }

    #[test]
    fn nominal_severity_floor_in_leef_and_cef_zero_for_calibrating() {
        let mut s = sample();
        s.band = Band::Calibrating;
        assert!(
            cef(&s, None, "h", "1").contains("|gnss-trust.calibrating|GNSS trust calibrating|0|")
        );
        assert!(leef(&s, None, "h", "1").contains("^sev=1^"));
    }

    #[test]
    fn rfc5424_envelope() {
        // local0 (16) * 8 + warning (4) = 132
        assert_eq!(
            rfc5424(Band::Degraded, Some("2026-01-01T00:00:00Z"), "ops-gw1", "X"),
            "<132>1 2026-01-01T00:00:00Z ops-gw1 kshana - GNSSTRUST - X"
        );
        assert_eq!(
            rfc5424(Band::Untrusted, None, "", "X"),
            "<130>1 - - kshana - GNSSTRUST - X"
        );
    }

    // ---- delivery: timeouts, reconnect, counters -------------------------------------

    use std::io::Read;
    use std::net::TcpListener;

    fn quick() -> SinkConfig {
        SinkConfig {
            connect_timeout: Duration::from_millis(300),
            write_timeout: Duration::from_millis(200),
            backoff_min: Duration::from_millis(50),
            backoff_max: Duration::from_millis(200),
            queue: 4096,
        }
    }

    fn counter() -> Arc<AtomicU64> {
        Arc::new(AtomicU64::new(0))
    }

    #[test]
    fn a_collector_that_never_reads_cannot_stall_the_caller() {
        // Accepts the connection and then never reads: the kernel buffers fill and writes
        // block. The caller must still return at once, and the sink must give up on the
        // stalled connection within the write timeout rather than hang.
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap().to_string();
        let held = std::thread::spawn(move || {
            let c = l.accept().unwrap();
            std::thread::sleep(Duration::from_secs(8));
            drop(c);
        });
        let failures = counter();
        let sink = SyslogSink::start(&addr, Proto::Tcp, quick(), Arc::clone(&failures));
        let big = "x".repeat(60_000);
        let t0 = Instant::now();
        for _ in 0..200 {
            sink.send(big.clone());
        }
        assert!(
            t0.elapsed() < Duration::from_secs(1),
            "send() blocked for {:?}",
            t0.elapsed()
        );
        let t1 = Instant::now();
        sink.finish();
        assert!(
            t1.elapsed() < Duration::from_secs(6),
            "finish took {:?}",
            t1.elapsed()
        );
        assert!(
            failures.load(Ordering::Relaxed) > 0,
            "stalled writes were not counted"
        );
        drop(held);
    }

    #[test]
    fn a_dead_collector_is_counted_not_waited_on() {
        let port = TcpListener::bind("127.0.0.1:0")
            .unwrap()
            .local_addr()
            .unwrap()
            .port();
        let failures = counter();
        let sink = SyslogSink::start(
            &format!("127.0.0.1:{port}"),
            Proto::Tcp,
            quick(),
            Arc::clone(&failures),
        );
        for i in 0..5 {
            sink.send(format!("m{i}"));
        }
        sink.finish();
        assert_eq!(failures.load(Ordering::Relaxed), 5);
    }

    #[test]
    fn a_full_queue_drops_and_counts() {
        let port = TcpListener::bind("127.0.0.1:0")
            .unwrap()
            .local_addr()
            .unwrap()
            .port();
        let failures = counter();
        let cfg = SinkConfig {
            queue: 1,
            ..quick()
        };
        let sink = SyslogSink::start(
            &format!("127.0.0.1:{port}"),
            Proto::Tcp,
            cfg,
            Arc::clone(&failures),
        );
        for i in 0..500 {
            sink.send(format!("m{i}"));
        }
        sink.finish();
        assert_eq!(
            failures.load(Ordering::Relaxed),
            500,
            "every undelivered message is counted once"
        );
    }

    #[test]
    fn it_reconnects_when_the_collector_comes_up() {
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap();
        drop(l); // nothing listening yet
        let failures = counter();
        let sink = SyslogSink::start(
            &addr.to_string(),
            Proto::Tcp,
            quick(),
            Arc::clone(&failures),
        );
        sink.send("early".into());
        std::thread::sleep(Duration::from_millis(100));
        let l = TcpListener::bind(addr).unwrap();
        let reader = std::thread::spawn(move || {
            let (mut c, _) = l.accept().unwrap();
            c.set_read_timeout(Some(Duration::from_secs(5))).unwrap();
            let mut got = String::new();
            let mut buf = [0u8; 256];
            while !got.contains("late\n") {
                let n = c.read(&mut buf).unwrap();
                if n == 0 {
                    break;
                }
                got.push_str(&String::from_utf8_lossy(&buf[..n]));
            }
            got
        });
        // Keep offering messages until the backoff expires and one gets through.
        let t0 = Instant::now();
        while !reader.is_finished() && t0.elapsed() < Duration::from_secs(5) {
            sink.send("late".into());
            std::thread::sleep(Duration::from_millis(20));
        }
        let got = reader.join().unwrap();
        sink.finish();
        assert!(got.contains("late\n"), "{got:?}");
        assert!(
            failures.load(Ordering::Relaxed) >= 1,
            "the early message was lost and counted"
        );
    }

    #[test]
    fn tcp_framings_and_udp_delivery() {
        for (proto, want) in [
            (Proto::Tcp, "hello\n"),
            (Proto::TcpOctetCounting, "5 hello"),
        ] {
            let l = TcpListener::bind("127.0.0.1:0").unwrap();
            let addr = l.local_addr().unwrap().to_string();
            let sink = SyslogSink::start(&addr, proto, quick(), counter());
            sink.send("hello".into());
            let (mut c, _) = l.accept().unwrap();
            c.set_read_timeout(Some(Duration::from_secs(5))).unwrap();
            let mut buf = vec![0u8; want.len()];
            c.read_exact(&mut buf).unwrap();
            assert_eq!(String::from_utf8(buf).unwrap(), want);
            sink.finish();
        }
        let u = UdpSocket::bind("127.0.0.1:0").unwrap();
        u.set_read_timeout(Some(Duration::from_secs(5))).unwrap();
        let sink = SyslogSink::start(
            &u.local_addr().unwrap().to_string(),
            Proto::Udp,
            quick(),
            counter(),
        );
        sink.send("dgram".into());
        let mut buf = [0u8; 64];
        let n = u.recv(&mut buf).unwrap();
        assert_eq!(&buf[..n], b"dgram");
        sink.finish();
    }
}
