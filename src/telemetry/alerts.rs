// SPDX-License-Identifier: AGPL-3.0-only
//! Alert delivery for `kshana trust-telemetry` (roadmap A4): each OASIS CAP 1.2 message from the trust
//! stream ([`super::cap::alerts`]) written to a directory and/or POSTed to a webhook, signed with
//! [`super::webhook`].
//!
//! The configuration is a TOML file with the operator's CAP settings ([`AlertConfig`]); `status` and
//! `scope` have no default, so an exercise is never sent as `Actual` by accident. The date of `t_s = 0`
//! comes from the first epoch's UTC time label when it carries one, else from the receiving clock.
//!
//! The webhook is plain HTTP/1.1 (`http://host:port/path`). The body is the CAP XML; the
//! `Kshana-Signature` header signs it with the secret, which comes from an environment variable and
//! never from the command line. For HTTPS, post to a local relay. A delivery that fails or answers
//! other than 2xx is counted and reported, and never stops the stream.
use super::cap::{alerts, CapConfig};
use super::sample::TrustSample;
use serde::Deserialize;
use std::io::{Read, Write};
use std::net::{TcpStream, ToSocketAddrs};
use std::path::PathBuf;
use std::time::Duration;

/// The `--cap-config` file.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct AlertConfig {
    /// CAP `sender`.
    pub sender: String,
    /// CAP `status`: `Actual`, `Exercise`, `System`, `Test` or `Draft` (required).
    pub status: String,
    /// CAP `scope`: `Public`, `Restricted` or `Private` (required).
    pub scope: String,
    /// CAP `areaDesc`.
    pub area_desc: String,
    /// Station latitude and longitude, degrees, when the stream carries no position.
    #[serde(default)]
    pub station: Option<[f64; 2]>,
    /// Radius of the alert area, km.
    pub radius_km: f64,
}

/// Where a webhook goes.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct Webhook {
    pub host: String,
    pub port: u16,
    pub path: String,
    secret: Vec<u8>,
}

impl Webhook {
    /// Parse `http://host[:port]/path`; `secret` signs every delivery.
    pub fn new(url: &str, secret: Vec<u8>) -> Result<Webhook, String> {
        let bad = || crate::terr!("e-telemetry-webhook-url", url = url.to_string());
        let rest = url.strip_prefix("http://").ok_or_else(bad)?;
        let (auth, path) = match rest.find('/') {
            Some(i) => (&rest[..i], &rest[i..]),
            None => (rest, "/"),
        };
        let (host, port) = match auth.rsplit_once(':') {
            Some((h, p)) => (h, p.parse::<u16>().map_err(|_| bad())?),
            None => (auth, 80),
        };
        if host.is_empty() || secret.is_empty() {
            return Err(bad());
        }
        Ok(Webhook {
            host: host.to_string(),
            port,
            path: path.to_string(),
            secret,
        })
    }

    /// POST `body`, signed at UNIX time `now`; `Ok(status)` for any HTTP answer.
    pub fn post(&self, body: &[u8], now: i64) -> Result<u16, String> {
        let a = (self.host.as_str(), self.port)
            .to_socket_addrs()
            .map_err(|e| e.to_string())?
            .next()
            .ok_or_else(|| self.host.clone())?;
        let mut s =
            TcpStream::connect_timeout(&a, Duration::from_secs(3)).map_err(|e| e.to_string())?;
        s.set_read_timeout(Some(Duration::from_secs(5)))
            .map_err(|e| e.to_string())?;
        s.set_write_timeout(Some(Duration::from_secs(5)))
            .map_err(|e| e.to_string())?;
        let head = format!(
            "POST {} HTTP/1.1\r\nHost: {}:{}\r\nContent-Type: application/cap+xml; charset=utf-8\r\nContent-Length: {}\r\n{}: {}\r\nConnection: close\r\n\r\n",
            self.path,
            self.host,
            self.port,
            body.len(),
            super::webhook::HEADER,
            super::webhook::sign(body, &self.secret, now)
        );
        s.write_all(head.as_bytes()).map_err(|e| e.to_string())?;
        s.write_all(body).map_err(|e| e.to_string())?;
        let mut first = Vec::new();
        let mut b = [0u8; 1];
        while !first.ends_with(b"\r\n") && first.len() < 256 {
            if s.read(&mut b).map_err(|e| e.to_string())? == 0 {
                break;
            }
            first.push(b[0]);
        }
        String::from_utf8_lossy(&first)
            .split_whitespace()
            .nth(1)
            .and_then(|c| c.parse().ok())
            .ok_or_else(|| crate::terr!("e-telemetry-webhook-answer"))
    }
}

/// Turns the trust stream into delivered CAP messages.
pub struct AlertSink {
    cfg: Option<CapConfig>,
    base: AlertConfig,
    changes: Vec<TrustSample>,
    last_band: Option<super::sample::Band>,
    sent: usize,
    dir: Option<PathBuf>,
    webhook: Option<Webhook>,
    /// Messages produced.
    pub messages: u64,
    /// Deliveries that failed (a write error, no answer, or a non-2xx answer).
    pub failures: u64,
}

impl AlertSink {
    /// A sink for `cfg`, writing to `dir` and/or posting to `webhook`. The CAP settings are checked
    /// here, before any epoch.
    pub fn new(
        base: AlertConfig,
        dir: Option<PathBuf>,
        webhook: Option<Webhook>,
    ) -> Result<AlertSink, String> {
        // Check the settings now with a placeholder epoch date (alerts() refuses bad values).
        alerts(&[], &cap_config(&base, 0))?;
        if let Some(d) = &dir {
            std::fs::create_dir_all(d).map_err(|e| format!("{}: {e}", d.display()))?;
        }
        Ok(AlertSink {
            cfg: None,
            base,
            changes: Vec::new(),
            last_band: None,
            sent: 0,
            dir,
            webhook,
            messages: 0,
            failures: 0,
        })
    }

    /// Take one epoch, at receiving time `now` (UNIX seconds); deliver any new message.
    pub fn observe(&mut self, s: &TrustSample, now: f64) -> Result<(), String> {
        if self.cfg.is_none() {
            let t0 = s
                .time_label
                .as_deref()
                .and_then(super::time::parse_rfc3339_utc)
                .unwrap_or(now)
                - s.t_s;
            self.cfg = Some(cap_config(&self.base, t0.floor() as i64));
        }
        if self.last_band == Some(s.band) {
            return Ok(());
        }
        self.last_band = Some(s.band);
        self.changes.push(s.clone());
        let Some(cfg) = &self.cfg else {
            return Ok(());
        };
        let out = alerts(&self.changes, cfg)?;
        for x in out.iter().skip(self.sent) {
            self.messages += 1;
            if let Some(d) = &self.dir {
                let id = x
                    .split("<identifier>")
                    .nth(1)
                    .and_then(|r| r.split('<').next())
                    .unwrap_or("kshana-alert");
                if std::fs::write(d.join(format!("{id}.xml")), x).is_err() {
                    self.failures += 1;
                }
            }
            if let Some(w) = &self.webhook {
                match w.post(x.as_bytes(), now as i64) {
                    Ok(code) if (200..300).contains(&code) => {}
                    _ => self.failures += 1,
                }
            }
        }
        self.sent = out.len();
        Ok(())
    }
}

fn cap_config(b: &AlertConfig, t0_unix_s: i64) -> CapConfig {
    CapConfig {
        sender: b.sender.clone(),
        status: b.status.clone(),
        scope: b.scope.clone(),
        area_desc: b.area_desc.clone(),
        station: b.station.map(|[a, o]| (a, o)),
        radius_km: b.radius_km,
        t0_unix_s,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn webhook_urls() {
        let w = Webhook::new("http://127.0.0.1:8080/hooks/kshana", b"k".to_vec()).unwrap();
        assert_eq!(
            (w.host.as_str(), w.port, w.path.as_str()),
            ("127.0.0.1", 8080, "/hooks/kshana")
        );
        assert_eq!(Webhook::new("http://h", b"k".to_vec()).unwrap().port, 80);
        assert!(Webhook::new("https://h/", b"k".to_vec()).is_err());
        assert!(Webhook::new("http://h/", Vec::new()).is_err());
    }
}
