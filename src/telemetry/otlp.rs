// SPDX-License-Identifier: AGPL-3.0-only
//! OpenTelemetry OTLP/HTTP export of the trust metrics, JSON encoding. Behind the `otlp`
//! cargo feature, off by default.
//!
//! Deliberately dependency-free: the payload is built with `serde_json` and posted over a
//! plain `std::net` HTTP/1.1 connection. That means **no TLS**: point it at a collector on
//! the same host or on a trusted segment (the usual deployment, the collector then
//! forwarding over TLS). Metric names match the Prometheus ones.

use super::prometheus::Registry;
use super::sample::Band;
use serde_json::{json, Value};
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::sync::mpsc::{sync_channel, SyncSender};
use std::thread::JoinHandle;
use std::time::Duration;

/// Limit on connecting, writing and reading, each.
const IO_TIMEOUT: Duration = Duration::from_secs(2);

/// The `ExportMetricsServiceRequest` JSON for the registry's current state at `unix_nano`.
pub fn build_payload(reg: &Registry, unix_nano: u64) -> Value {
    let t = unix_nano.to_string();
    let start = reg.started_unix_nano().unwrap_or(unix_nano).to_string();
    let mut metrics: Vec<Value> = Vec::new();
    if let Some(sc) = reg.score() {
        metrics.push(json!({
            "name": "kshana.trust.score",
            "description": "Latest GNSS trust score, 0 to 100.",
            "unit": "1",
            "gauge": {"dataPoints": [{"asDouble": sc, "timeUnixNano": t}]}
        }));
    }
    let band_points: Vec<Value> = Band::ALL
        .iter()
        .map(|b| {
            json!({
                "asInt": i64::from(reg.band() == Some(*b)).to_string(),
                "timeUnixNano": t,
                "attributes": [{"key": "band", "value": {"stringValue": b.label()}}]
            })
        })
        .collect();
    metrics.push(json!({
        "name": "kshana.trust.band",
        "description": "1 for the current trust band, 0 for the others.",
        "unit": "1",
        "gauge": {"dataPoints": band_points}
    }));
    let epoch_points: Vec<Value> = Band::ALL
        .iter()
        .map(|b| {
            json!({
                "asInt": reg.epochs_in(*b).to_string(),
                "startTimeUnixNano": start,
                "timeUnixNano": t,
                "attributes": [{"key": "band", "value": {"stringValue": b.label()}}]
            })
        })
        .collect();
    metrics.push(json!({
        "name": "kshana.trust.epochs",
        "description": "Epochs received, by trust band.",
        "unit": "1",
        "sum": {"aggregationTemporality": 2, "isMonotonic": true, "dataPoints": epoch_points}
    }));
    let reason_points: Vec<Value> = reg
        .reason_epochs()
        .map(|(r, n)| {
            json!({
                "asInt": n.to_string(),
                "startTimeUnixNano": start,
                "timeUnixNano": t,
                "attributes": [{"key": "reason", "value": {"stringValue": r}}]
            })
        })
        .collect();
    if !reason_points.is_empty() {
        metrics.push(json!({
            "name": "kshana.trust.reason.epochs",
            "description": "Epochs in which a reason was present, by reason.",
            "unit": "1",
            "sum": {"aggregationTemporality": 2, "isMonotonic": true, "dataPoints": reason_points}
        }));
    }
    json!({"resourceMetrics": [{
        "resource": {"attributes": [
            {"key": "service.name", "value": {"stringValue": "kshana"}},
            {"key": "service.version", "value": {"stringValue": reg.version()}}
        ]},
        "scopeMetrics": [{"scope": {"name": "kshana.telemetry"}, "metrics": metrics}]
    }]})
}

/// Split `http://host:port/path` into (`host:port`, `/path`). `https` is refused.
pub fn parse_endpoint(url: &str) -> Result<(String, String), String> {
    if url.starts_with("https://") {
        return Err(
            "https is not supported by the built-in exporter; use a local collector over http"
                .into(),
        );
    }
    let rest = url
        .strip_prefix("http://")
        .ok_or("endpoint must start with http://")?;
    let (hostport, path) = match rest.find('/') {
        Some(i) => (&rest[..i], &rest[i..]),
        None => (rest, "/v1/metrics"),
    };
    if hostport.is_empty() {
        return Err("endpoint has no host".into());
    }
    Ok((hostport.to_string(), path.to_string()))
}

/// POST the registry's state to an OTLP/HTTP collector. Returns the HTTP status code.
/// Connecting, writing and reading each stop after two seconds.
pub fn export(endpoint: &str, reg: &Registry, unix_nano: u64) -> Result<u16, String> {
    let (hostport, path) = parse_endpoint(endpoint)?;
    let body = build_payload(reg, unix_nano).to_string();
    let addrs = hostport
        .to_socket_addrs()
        .map_err(|e| format!("resolve {hostport}: {e}"))?;
    let mut last = format!("no address for {hostport}");
    let mut stream = None;
    for a in addrs {
        match TcpStream::connect_timeout(&a, IO_TIMEOUT) {
            Ok(s) => {
                stream = Some(s);
                break;
            }
            Err(e) => last = format!("connect {a}: {e}"),
        }
    }
    let mut s = stream.ok_or(last)?;
    s.set_read_timeout(Some(IO_TIMEOUT)).ok();
    s.set_write_timeout(Some(IO_TIMEOUT)).ok();
    write!(
        s,
        "POST {path} HTTP/1.1\r\nHost: {hostport}\r\nContent-Type: application/json\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    )
    .map_err(|e| e.to_string())?;
    let mut resp = String::new();
    s.read_to_string(&mut resp).map_err(|e| e.to_string())?;
    resp.split_whitespace()
        .nth(1)
        .and_then(|c| c.parse().ok())
        .ok_or_else(|| "no HTTP status in response".to_string())
}

/// Exports from a worker thread, so the caller never waits on a collector and never holds a
/// lock across network I/O: it hands over a clone of the registry.
pub struct Exporter {
    tx: Option<SyncSender<(Registry, u64)>>,
    worker: Option<JoinHandle<()>>,
}

impl Exporter {
    /// Validate `endpoint` and start the worker.
    pub fn start(endpoint: &str) -> Result<Self, String> {
        parse_endpoint(endpoint)?;
        let (tx, rx) = sync_channel::<(Registry, u64)>(1);
        let ep = endpoint.to_string();
        let worker = std::thread::spawn(move || {
            for (reg, t) in rx.iter() {
                if let Err(e) = export(&ep, &reg, t) {
                    eprintln!("warning: otlp export failed: {e}");
                }
            }
        });
        Ok(Exporter {
            tx: Some(tx),
            worker: Some(worker),
        })
    }

    /// Hand over a snapshot; never blocks. If the previous export is still running the
    /// snapshot is dropped (the next one carries the same cumulative totals).
    pub fn submit(&self, reg: Registry, unix_nano: u64) {
        if let Some(t) = &self.tx {
            let _ = t.try_send((reg, unix_nano));
        }
    }

    /// Wait for the export in flight. Bounded by the I/O timeouts.
    pub fn finish(mut self) {
        self.tx = None;
        if let Some(w) = self.worker.take() {
            let _ = w.join();
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::sample::TrustSample;
    use super::*;
    use std::net::TcpListener;

    fn reg() -> Registry {
        let mut r = Registry::new("9.9.9");
        r.observe(
            &TrustSample {
                t_s: 1.0,
                time_label: None,
                score: Some(55.0),
                band: Band::Degraded,
                reasons: vec!["agc".into()],
                gate: None,
                position: None,
            },
            None,
        );
        r
    }

    #[test]
    fn payload_shape() {
        let p = build_payload(&reg(), 1_700_000_000_000_000_000);
        let m = &p["resourceMetrics"][0]["scopeMetrics"][0]["metrics"];
        let names: Vec<&str> = m
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x["name"].as_str().unwrap())
            .collect();
        assert_eq!(
            names,
            [
                "kshana.trust.score",
                "kshana.trust.band",
                "kshana.trust.epochs",
                "kshana.trust.reason.epochs"
            ]
        );
        assert_eq!(m[0]["gauge"]["dataPoints"][0]["asDouble"], 55.0);
        assert_eq!(
            p["resourceMetrics"][0]["resource"]["attributes"][1]["value"]["stringValue"],
            "9.9.9"
        );
    }

    #[test]
    fn endpoint_parsing() {
        assert_eq!(
            parse_endpoint("http://127.0.0.1:4318/v1/metrics").unwrap(),
            ("127.0.0.1:4318".into(), "/v1/metrics".into())
        );
        assert_eq!(parse_endpoint("http://h:1").unwrap().1, "/v1/metrics");
        assert!(parse_endpoint("https://h").is_err());
        assert!(parse_endpoint("ftp://h").is_err());
    }

    #[test]
    fn export_posts_to_a_local_collector() {
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap();
        let h = std::thread::spawn(move || {
            let (mut c, _) = l.accept().unwrap();
            let mut got = Vec::new();
            let mut buf = [0u8; 4096];
            loop {
                let n = c.read(&mut buf).unwrap();
                got.extend_from_slice(&buf[..n]);
                let text = String::from_utf8_lossy(&got).to_string();
                if let Some(i) = text.find("\r\n\r\n") {
                    let cl: usize = text[..i]
                        .lines()
                        .find_map(|l| l.strip_prefix("Content-Length: "))
                        .unwrap()
                        .parse()
                        .unwrap();
                    if got.len() >= i + 4 + cl {
                        break;
                    }
                }
            }
            c.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 0\r\n\r\n")
                .unwrap();
            String::from_utf8(got).unwrap()
        });
        let status = export(&format!("http://{addr}/v1/metrics"), &reg(), 1).unwrap();
        assert_eq!(status, 200);
        let req = h.join().unwrap();
        assert!(req.starts_with("POST /v1/metrics HTTP/1.1"));
        assert!(req.contains("kshana.trust.score"));
    }

    #[test]
    fn sums_carry_a_start_time() {
        let mut r = Registry::new("t");
        r.observe(
            &TrustSample {
                t_s: 1.0,
                time_label: None,
                score: Some(1.0),
                band: Band::Nominal,
                reasons: vec![],
                gate: None,
                position: None,
            },
            Some(1_700_000_000.0),
        );
        let p = build_payload(&r, 1_700_000_100_000_000_000);
        let m = &p["resourceMetrics"][0]["scopeMetrics"][0]["metrics"];
        let sum = m
            .as_array()
            .unwrap()
            .iter()
            .find(|x| x["name"] == "kshana.trust.epochs")
            .unwrap();
        assert_eq!(
            sum["sum"]["dataPoints"][0]["startTimeUnixNano"],
            "1700000000000000000"
        );
    }

    #[test]
    fn a_collector_that_never_answers_cannot_stall_the_caller() {
        let l = TcpListener::bind("127.0.0.1:0").unwrap();
        let addr = l.local_addr().unwrap();
        let held = std::thread::spawn(move || {
            let c = l.accept().unwrap();
            std::thread::sleep(Duration::from_secs(6));
            drop(c);
        });
        let x = Exporter::start(&format!("http://{addr}/v1/metrics")).unwrap();
        let t0 = std::time::Instant::now();
        for _ in 0..50 {
            x.submit(reg(), 1);
        }
        assert!(t0.elapsed() < Duration::from_secs(1), "submit blocked");
        let t1 = std::time::Instant::now();
        x.finish();
        assert!(
            t1.elapsed() < Duration::from_secs(5),
            "finish took {:?}",
            t1.elapsed()
        );
        drop(held);
    }
}
