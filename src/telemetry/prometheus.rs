// SPDX-License-Identifier: AGPL-3.0-only
//! Prometheus text exposition (format 0.0.4) of the trust stream, and the small HTTP
//! endpoint that serves it. No dependencies: the format is plain text and the endpoint is
//! `std::net`.
//!
//! Metric names and labels are listed in `docs/TRUST-TELEMETRY.md`; the golden test in
//! this module pins the exact output.

use super::sample::{Band, Position, TrustSample};
use std::collections::BTreeMap;
use std::io::{Read, Write};
use std::net::{SocketAddr, TcpListener, TcpStream};
use std::sync::atomic::{AtomicU64, Ordering};
use std::sync::{Arc, Mutex};
use std::time::Duration;

/// The accumulated state the exposition is rendered from.
#[derive(Clone, Debug, Default)]
pub struct Registry {
    version: String,
    score: Option<f64>,
    band: Option<Band>,
    gate: Option<String>,
    position: Option<Position>,
    expose_position: bool,
    t_s: Option<f64>,
    epochs_by_band: [u64; 5],
    reason_active: BTreeMap<String, bool>,
    reason_epochs: BTreeMap<String, u64>,
    input_errors: u64,
    reason_overflow: u64,
    syslog_failures: Arc<AtomicU64>,
    started_unix: Option<f64>,
    last_sample_unix: Option<f64>,
}

/// Most distinct reason names kept as label values; later ones are folded into `other`.
/// Bounds the series count a hostile or buggy input can create.
pub const MAX_REASONS: usize = 64;
/// Longest reason name kept, in characters.
pub const MAX_REASON_LEN: usize = 128;
/// The gate states the live stream defines, plus a catch-all.
const GATES: [&str; 4] = ["off", "passed", "withheld", "unknown"];

/// A registry shared between the ingest loop and the HTTP thread.
pub type SharedRegistry = Arc<Mutex<Registry>>;

impl Registry {
    /// An empty registry reporting `version` in `kshana_build_info`.
    pub fn new(version: &str) -> Self {
        Registry {
            version: version.to_string(),
            ..Registry::default()
        }
    }

    /// Fold one epoch in. `now_unix` is the wall-clock time of receipt, if the caller has
    /// one; tests pass `None` so the output is deterministic.
    pub fn observe(&mut self, s: &TrustSample, now_unix: Option<f64>) {
        self.score = s.score;
        self.band = Some(s.band);
        self.gate = s.gate.clone();
        self.position = s.position;
        self.t_s = Some(s.t_s);
        self.epochs_by_band[s.band.index()] += 1;
        for v in self.reason_active.values_mut() {
            *v = false;
        }
        for r in &s.reasons {
            let name = self.reason_key(r);
            self.reason_active.insert(name.clone(), true);
            *self.reason_epochs.entry(name).or_insert(0) += 1;
        }
        if now_unix.is_some() {
            self.last_sample_unix = now_unix;
            self.started_unix
                .get_or_insert(now_unix.unwrap_or_default());
        }
    }

    /// The label value a reason is recorded under: truncated, and folded into `other` once
    /// [`MAX_REASONS`] distinct names are in use.
    fn reason_key(&mut self, r: &str) -> String {
        let name: String = r.chars().take(MAX_REASON_LEN).collect();
        if self.reason_epochs.contains_key(&name) || self.reason_epochs.len() < MAX_REASONS {
            return name;
        }
        self.reason_overflow += 1;
        "other".to_string()
    }

    /// The shared counter of syslog messages that were not delivered; hand it to
    /// [`super::syslog::SyslogSink::start`].
    pub fn syslog_failure_counter(&self) -> Arc<AtomicU64> {
        Arc::clone(&self.syslog_failures)
    }

    /// Wall-clock time of the first epoch, Unix nanoseconds (the start of cumulative sums).
    pub fn started_unix_nano(&self) -> Option<u64> {
        self.started_unix.map(|t| (t * 1e9) as u64)
    }

    /// Publish the receiver-reported position as gauges. Off by default: `/metrics` is
    /// unauthenticated and a position can identify a site or a vessel.
    pub fn set_expose_position(&mut self, on: bool) {
        self.expose_position = on;
    }

    /// Latest score, if the source gave one.
    pub fn score(&self) -> Option<f64> {
        self.score
    }

    /// Latest band.
    pub fn band(&self) -> Option<Band> {
        self.band
    }

    /// Epochs received in a band.
    pub fn epochs_in(&self, b: Band) -> u64 {
        self.epochs_by_band[b.index()]
    }

    /// (reason, epochs) pairs in name order.
    pub fn reason_epochs(&self) -> impl Iterator<Item = (&str, u64)> {
        self.reason_epochs.iter().map(|(k, v)| (k.as_str(), *v))
    }

    /// (reason, active at the latest epoch) pairs in name order.
    pub fn reasons_active(&self) -> impl Iterator<Item = (&str, bool)> {
        self.reason_active.iter().map(|(k, v)| (k.as_str(), *v))
    }

    /// Input lines that could not be parsed.
    pub fn input_errors(&self) -> u64 {
        self.input_errors
    }

    /// Reason occurrences folded into `other`.
    pub fn reason_overflow(&self) -> u64 {
        self.reason_overflow
    }

    /// Offset of the latest epoch from the start of the stream, seconds.
    pub fn epoch_offset_s(&self) -> Option<f64> {
        self.t_s
    }

    /// Wall-clock receipt time of the latest epoch, Unix seconds.
    pub fn last_sample_unix(&self) -> Option<f64> {
        self.last_sample_unix
    }

    /// The engine version the registry reports.
    pub fn version(&self) -> &str {
        &self.version
    }

    /// Count one input line that could not be parsed.
    pub fn observe_input_error(&mut self) {
        self.input_errors += 1;
    }

    /// Render the exposition text.
    pub fn render(&self) -> String {
        let mut o = String::new();
        header(
            &mut o,
            "kshana_build_info",
            "Engine version; constant 1.",
            "gauge",
        );
        o.push_str(&format!(
            "kshana_build_info{{version=\"{}\"}} 1\n",
            escape_label(&self.version)
        ));
        if let Some(sc) = self.score {
            header(
                &mut o,
                "kshana_trust_score",
                "Latest GNSS trust score, 0 (no trust) to 100 (full trust). Absent when the source computes none.",
                "gauge",
            );
            o.push_str(&format!("kshana_trust_score {}\n", fmt_f64(sc)));
        }
        header(
            &mut o,
            "kshana_trust_band",
            "Latest GNSS trust band: 1 for the current band, 0 for the others.",
            "gauge",
        );
        for b in Band::ALL {
            let on = u8::from(self.band == Some(b));
            o.push_str(&format!(
                "kshana_trust_band{{band=\"{}\"}} {on}\n",
                b.label()
            ));
        }
        if let Some(g) = &self.gate {
            header(
                &mut o,
                "kshana_trust_gate",
                "Latest gate state of the live stream: 1 for the current state, 0 for the others.",
                "gauge",
            );
            let cur = if GATES[..3].contains(&g.as_str()) {
                g.as_str()
            } else {
                "unknown"
            };
            for st in GATES {
                o.push_str(&format!(
                    "kshana_trust_gate{{gate=\"{st}\"}} {}\n",
                    u8::from(st == cur)
                ));
            }
        }
        if let (true, Some(p)) = (self.expose_position, self.position) {
            for (name, help, v) in [
                (
                    "kshana_trust_position_latitude_degrees",
                    "Latitude the receiver reported at the latest epoch, degrees.",
                    p.lat_deg,
                ),
                (
                    "kshana_trust_position_longitude_degrees",
                    "Longitude the receiver reported at the latest epoch, degrees.",
                    p.lon_deg,
                ),
                (
                    "kshana_trust_position_height_meters",
                    "Height the receiver reported at the latest epoch, metres.",
                    p.height_m,
                ),
            ] {
                header(&mut o, name, help, "gauge");
                o.push_str(&format!("{name} {}\n", fmt_f64(v)));
            }
        }
        header(
            &mut o,
            "kshana_trust_reason_active",
            "1 if the reason was present at the latest epoch, 0 if it was seen earlier but is not now.",
            "gauge",
        );
        for (r, on) in &self.reason_active {
            o.push_str(&format!(
                "kshana_trust_reason_active{{reason=\"{}\"}} {}\n",
                escape_label(r),
                u8::from(*on)
            ));
        }
        header(
            &mut o,
            "kshana_trust_epochs_total",
            "Epochs received, by trust band.",
            "counter",
        );
        for b in Band::ALL {
            o.push_str(&format!(
                "kshana_trust_epochs_total{{band=\"{}\"}} {}\n",
                b.label(),
                self.epochs_by_band[b.index()]
            ));
        }
        header(
            &mut o,
            "kshana_trust_reason_epochs_total",
            "Epochs in which a reason was present, by reason.",
            "counter",
        );
        for (r, n) in &self.reason_epochs {
            o.push_str(&format!(
                "kshana_trust_reason_epochs_total{{reason=\"{}\"}} {n}\n",
                escape_label(r)
            ));
        }
        header(
            &mut o,
            "kshana_trust_input_errors_total",
            "Input lines that could not be parsed as trust samples.",
            "counter",
        );
        o.push_str(&format!(
            "kshana_trust_input_errors_total {}\n",
            self.input_errors
        ));
        header(
            &mut o,
            "kshana_trust_reason_overflow_total",
            "Reason occurrences folded into reason=\"other\" because 64 distinct reasons were already in use.",
            "counter",
        );
        o.push_str(&format!(
            "kshana_trust_reason_overflow_total {}\n",
            self.reason_overflow
        ));
        header(
            &mut o,
            "kshana_trust_syslog_send_failures_total",
            "Syslog events not delivered (queue full, collector down or stalled).",
            "counter",
        );
        o.push_str(&format!(
            "kshana_trust_syslog_send_failures_total {}\n",
            self.syslog_failures.load(Ordering::Relaxed)
        ));
        if let Some(t) = self.t_s {
            header(
                &mut o,
                "kshana_trust_epoch_offset_seconds",
                "Offset of the latest epoch from the start of the log or session, seconds.",
                "gauge",
            );
            o.push_str(&format!(
                "kshana_trust_epoch_offset_seconds {}\n",
                fmt_f64(t)
            ));
        }
        if let Some(u) = self.last_sample_unix {
            header(
                &mut o,
                "kshana_trust_last_sample_timestamp_seconds",
                "Wall-clock time the latest epoch was received, Unix seconds. Alert on its age to detect a stalled stream.",
                "gauge",
            );
            o.push_str(&format!(
                "kshana_trust_last_sample_timestamp_seconds {}\n",
                fmt_f64(u)
            ));
        }
        o
    }
}

fn header(o: &mut String, name: &str, help: &str, kind: &str) {
    o.push_str(&format!("# HELP {name} {help}\n# TYPE {name} {kind}\n"));
}

/// Escape a label value: backslash, double quote and newline.
pub fn escape_label(s: &str) -> String {
    let mut o = String::with_capacity(s.len());
    for c in s.chars() {
        match c {
            '\\' => o.push_str("\\\\"),
            '"' => o.push_str("\\\""),
            '\n' => o.push_str("\\n"),
            c => o.push(c),
        }
    }
    o
}

fn fmt_f64(x: f64) -> String {
    if x.is_nan() {
        "NaN".into()
    } else if x.is_infinite() {
        if x > 0.0 { "+Inf" } else { "-Inf" }.into()
    } else {
        format!("{x}")
    }
}

/// Serve `GET /metrics` (and `GET /healthz`) on `addr` from a background thread. Returns
/// the bound address (useful with port 0). Requests are handled one at a time with a 2 s
/// read timeout, so an idle client can delay a scrape by up to that long; the request head is
/// capped at 8 KiB. Meant for one scraper, not the open network.
pub fn serve(addr: SocketAddr, reg: SharedRegistry) -> std::io::Result<SocketAddr> {
    let listener = TcpListener::bind(addr)?;
    let bound = listener.local_addr()?;
    std::thread::spawn(move || {
        for stream in listener.incoming().flatten() {
            let _ = handle(stream, &reg);
        }
    });
    Ok(bound)
}

fn handle(mut s: TcpStream, reg: &SharedRegistry) -> std::io::Result<()> {
    s.set_read_timeout(Some(Duration::from_secs(2)))?;
    s.set_write_timeout(Some(Duration::from_secs(2)))?;
    let mut buf = [0u8; 8192];
    let mut n = 0;
    while n < buf.len() {
        let k = s.read(&mut buf[n..])?;
        if k == 0 {
            break;
        }
        n += k;
        if buf[..n].windows(4).any(|w| w == b"\r\n\r\n") {
            break;
        }
    }
    let head = String::from_utf8_lossy(&buf[..n]);
    let mut parts = head.lines().next().unwrap_or("").split_whitespace();
    let (method, path) = (parts.next().unwrap_or(""), parts.next().unwrap_or(""));
    let path = path.split('?').next().unwrap_or("");
    let (status, ctype, body) = match (method, path) {
        ("GET", "/metrics") => {
            let text = reg.lock().map(|r| r.render()).unwrap_or_default();
            ("200 OK", "text/plain; version=0.0.4; charset=utf-8", text)
        }
        ("GET", "/healthz") => ("200 OK", "text/plain; charset=utf-8", "ok\n".to_string()),
        ("GET", _) => (
            "404 Not Found",
            "text/plain; charset=utf-8",
            "not found\n".into(),
        ),
        _ => (
            "405 Method Not Allowed",
            "text/plain; charset=utf-8",
            "method not allowed\n".into(),
        ),
    };
    write!(
        s,
        "HTTP/1.1 {status}\r\nContent-Type: {ctype}\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sample(t: f64, score: Option<f64>, band: Band, reasons: &[&str]) -> TrustSample {
        TrustSample {
            t_s: t,
            time_label: None,
            score,
            band,
            reasons: reasons.iter().map(|s| s.to_string()).collect(),
            gate: None,
            position: None,
        }
    }

    #[test]
    fn golden_exposition() {
        let mut r = Registry::new("0.0.0-test");
        r.observe(&sample(1.0, Some(100.0), Band::Nominal, &[]), None);
        r.observe(
            &sample(2.0, Some(41.5), Band::Degraded, &["cn0-drop", "agc"]),
            None,
        );
        r.observe(
            &sample(3.0, Some(12.0), Band::Untrusted, &["cn0-drop"]),
            None,
        );
        r.observe_input_error();
        let want = include_str!("../../tests/fixtures/telemetry/golden_metrics.prom");
        assert_eq!(r.render(), want);
    }

    #[test]
    fn position_gauges_are_opt_in() {
        let mut s = sample(1.0, Some(90.0), Band::Nominal, &[]);
        s.position = Some(Position {
            lat_deg: 59.5,
            lon_deg: 24.25,
            height_m: 39.4,
        });
        let mut r = Registry::new("t");
        r.observe(&s, None);
        assert!(!r.render().contains("position"));
        r.set_expose_position(true);
        let t = r.render();
        assert!(t.contains("kshana_trust_position_latitude_degrees 59.5\n"));
        assert!(t.contains("kshana_trust_position_height_meters 39.4\n"));
    }

    #[test]
    fn reason_cardinality_is_capped_and_overflow_counted() {
        let mut r = Registry::new("t");
        for i in 0..(MAX_REASONS + 10) {
            r.observe(
                &sample(i as f64, None, Band::Degraded, &[&format!("r{i}")]),
                None,
            );
        }
        // An existing reason keeps its own series after the cap is reached.
        r.observe(&sample(999.0, None, Band::Degraded, &["r0"]), None);
        let t = r.render();
        let series = t
            .lines()
            .filter(|l| l.starts_with("kshana_trust_reason_epochs_total{"))
            .count();
        assert_eq!(series, MAX_REASONS + 1, "64 named reasons plus `other`");
        assert!(t.contains("kshana_trust_reason_epochs_total{reason=\"other\"} 10\n"));
        assert!(t.contains("kshana_trust_reason_overflow_total 10\n"));
        assert!(t.contains("kshana_trust_reason_epochs_total{reason=\"r0\"} 2\n"));
    }

    #[test]
    fn long_reason_names_are_truncated() {
        let mut r = Registry::new("t");
        let long = "x".repeat(10_000);
        r.observe(&sample(1.0, None, Band::Degraded, &[long.as_str()]), None);
        let t = r.render();
        assert!(t.len() < 5_000 && t.contains(&"x".repeat(MAX_REASON_LEN)));
    }

    #[test]
    fn gate_emits_every_state_like_band() {
        let mut s = sample(1.0, Some(50.0), Band::Degraded, &[]);
        s.gate = Some("withheld".into());
        let mut r = Registry::new("t");
        r.observe(&s, None);
        let t = r.render();
        for (g, v) in [("off", 0), ("passed", 0), ("withheld", 1), ("unknown", 0)] {
            assert!(
                t.contains(&format!("kshana_trust_gate{{gate=\"{g}\"}} {v}\n")),
                "{g}"
            );
        }
        s.gate = Some("something-new".into());
        r.observe(&s, None);
        assert!(r
            .render()
            .contains("kshana_trust_gate{gate=\"unknown\"} 1\n"));
    }

    #[test]
    fn syslog_failures_are_exposed() {
        let r = Registry::new("t");
        r.syslog_failure_counter().fetch_add(3, Ordering::Relaxed);
        assert!(r
            .render()
            .contains("kshana_trust_syslog_send_failures_total 3\n"));
    }

    #[test]
    fn label_escaping() {
        assert_eq!(escape_label("a\"b\\c\nd"), "a\\\"b\\\\c\\nd");
    }

    #[test]
    fn endpoint_serves_metrics_and_rejects_other_requests() {
        let reg: SharedRegistry = Arc::new(Mutex::new(Registry::new("t")));
        reg.lock()
            .unwrap()
            .observe(&sample(1.0, Some(90.0), Band::Nominal, &[]), None);
        let addr = serve("127.0.0.1:0".parse().unwrap(), reg).unwrap();
        let get = |req: &str| {
            let mut c = TcpStream::connect(addr).unwrap();
            c.write_all(req.as_bytes()).unwrap();
            let mut out = String::new();
            c.read_to_string(&mut out).unwrap();
            out
        };
        let ok = get("GET /metrics HTTP/1.1\r\nHost: x\r\n\r\n");
        assert!(ok.starts_with("HTTP/1.1 200 OK"));
        assert!(ok.contains("kshana_trust_score 90\n"));
        assert!(get("GET /nope HTTP/1.1\r\n\r\n").starts_with("HTTP/1.1 404"));
        assert!(get("POST /metrics HTTP/1.1\r\n\r\n").starts_with("HTTP/1.1 405"));
    }
}
