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
use std::net::TcpStream;
use std::time::Duration;

/// The `ExportMetricsServiceRequest` JSON for the registry's current state at `unix_nano`.
pub fn build_payload(reg: &Registry, unix_nano: u64) -> Value {
    let t = unix_nano.to_string();
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
pub fn export(endpoint: &str, reg: &Registry, unix_nano: u64) -> Result<u16, String> {
    let (hostport, path) = parse_endpoint(endpoint)?;
    let body = build_payload(reg, unix_nano).to_string();
    let mut s = TcpStream::connect(&hostport).map_err(|e| format!("connect {hostport}: {e}"))?;
    s.set_read_timeout(Some(Duration::from_secs(5))).ok();
    s.set_write_timeout(Some(Duration::from_secs(5))).ok();
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
}
