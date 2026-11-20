// SPDX-License-Identifier: AGPL-3.0-only
//! NTRIP v2 behaviour checks, a reference caster, credential-safe logging checks.
//!
//! * [`serve`] runs a small reference caster on a listener: one mountpoint serving a file of RTCM
//!   bytes, NTRIP 2 (chunked transfer encoding, optionally with chunk extensions, which a client
//!   must skip) and NTRIP 1 (`ICY 200 OK`), Basic authentication, the source table, and the
//!   limits that keep one misbehaving client from taking the caster down: a cap on concurrent
//!   clients (`503`), a cap on the request head's size (`431`) and a deadline for it (a client
//!   that never finishes its request is dropped). For every client it reports what the client
//!   sent against NTRIP 2 practice: the request line, `Ntrip-Version`, a `User-Agent` beginning
//!   `NTRIP`, `Host`, the credentials, a GGA sentence's checksum, no credentials in the URL, and
//!   whether the whole stream was delivered.
//! * [`probe`] checks a caster's behaviour from the client side: the source table in both
//!   protocol versions, the mountpoint listed, a request without or with wrong credentials
//!   refused with `401` and `WWW-Authenticate`, the stream in both versions with well-formed
//!   chunks and intact RTCM frames, and an unknown mountpoint not answered with a stream.
//! * [`scan_log`] looks for credentials in a client's log (the password, the Base64 Basic token,
//!   an `Authorization` header, a `user:password@` URL) and [`redact`] removes them from a line.
//!
//! These are behaviour checks against the request layout casters publish; RTCM 10410.1 is not
//! reproduced or consulted, and passing them is not a statement of conformance to it.

use serde::{Deserialize, Serialize};
use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpListener, TcpStream, ToSocketAddrs};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::{mpsc, Arc};
use std::time::{Duration, Instant};

/// A check and whether it was met (`None`: not applicable).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Check {
    /// What was checked.
    pub id: &'static str,
    /// Met, not met, or not applicable.
    pub met: Option<bool>,
    /// What was seen (a status line, a count), credentials removed.
    #[serde(skip_serializing_if = "String::is_empty")]
    pub seen: String,
}

fn check(id: &'static str, met: Option<bool>, seen: impl Into<String>) -> Check {
    Check {
        id,
        met,
        seen: redact(&seen.into()),
    }
}

/// Remove credentials from a line: the value of an `Authorization` header and the password of
/// a `user:password@` URL.
pub fn redact(s: &str) -> String {
    let mut out = String::new();
    for (i, line) in s.split('\n').enumerate() {
        if i > 0 {
            out.push('\n');
        }
        let lower = line.to_ascii_lowercase();
        if let Some(p) = lower.find("authorization:") {
            let keep = &line[..p + "authorization:".len()];
            let rest = line[p + "authorization:".len()..].trim_start();
            let scheme = rest.split_whitespace().next().unwrap_or("");
            out.push_str(&format!("{keep} {scheme} <redacted>"));
            continue;
        }
        let mut l = line.to_string();
        if let Some(s0) = l.find("://") {
            let tail = &l[s0 + 3..];
            let end = tail.find(['/', ' ']).unwrap_or(tail.len());
            if let Some(at) = tail[..end].rfind('@') {
                if let Some(colon) = tail[..at].find(':') {
                    l = format!(
                        "{}{}:<redacted>{}",
                        &l[..s0 + 3],
                        &tail[..colon],
                        &tail[at..]
                    );
                }
            }
        }
        out.push_str(&l);
    }
    out
}

/// A credential found in a log.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Leak {
    /// 1-based line number.
    pub line: usize,
    /// `password`, `basic-token`, `authorization-header` or `url-userinfo`.
    pub kind: &'static str,
}

/// Look for the credentials `user`/`password` in a client's log.
pub fn scan_log(text: &str, user: &str, password: &str) -> Vec<Leak> {
    let token = crate::permalink::base64_encode(format!("{user}:{password}").as_bytes());
    let mut out = Vec::new();
    for (i, line) in text.lines().enumerate() {
        let n = i + 1;
        if password.len() >= 4 && line.contains(password) {
            out.push(Leak {
                line: n,
                kind: "password",
            });
        }
        if line.contains(&token) {
            out.push(Leak {
                line: n,
                kind: "basic-token",
            });
        }
        let lower = line.to_ascii_lowercase();
        if let Some(p) = lower.find("authorization:") {
            let v = line[p + 14..].trim();
            let cred = v.split_whitespace().nth(1).unwrap_or("");
            if cred.len() >= 8 && !cred.contains("redacted") && !cred.contains('*') {
                out.push(Leak {
                    line: n,
                    kind: "authorization-header",
                });
            }
        }
        if let Some(s0) = line.find("://") {
            let tail = &line[s0 + 3..];
            let end = tail.find(['/', ' ']).unwrap_or(tail.len());
            if let Some(at) = tail[..end].rfind('@') {
                let pw = tail[..at].split_once(':').map_or("", |x| x.1);
                if !pw.is_empty() && !pw.contains("redacted") && !pw.chars().all(|c| c == '*') {
                    out.push(Leak {
                        line: n,
                        kind: "url-userinfo",
                    });
                }
            }
        }
    }
    out
}

/// The reference caster's settings.
#[derive(Clone, Debug)]
pub struct CasterConfig {
    /// The one mountpoint.
    pub mount: String,
    /// User and password it asks for (none: open).
    pub credentials: Option<(String, String)>,
    /// The bytes it serves.
    pub stream: Vec<u8>,
    /// Bytes per chunk (NTRIP 2) or per write (NTRIP 1).
    pub chunk_bytes: usize,
    /// Add a chunk extension to every chunk-size line.
    pub chunk_extensions: bool,
    /// Pause between chunks.
    pub pace: Duration,
    /// Most clients served at once; more are answered `503`.
    pub max_clients: usize,
    /// Deadline for a client's request head.
    pub head_timeout: Duration,
    /// Largest request head accepted.
    pub max_head_bytes: usize,
}

impl CasterConfig {
    /// Defaults around a mountpoint and a stream.
    pub fn new(mount: &str, stream: Vec<u8>) -> Self {
        Self {
            mount: mount.to_string(),
            credentials: None,
            stream,
            chunk_bytes: 256,
            chunk_extensions: false,
            pace: Duration::ZERO,
            max_clients: 16,
            head_timeout: Duration::from_secs(5),
            max_head_bytes: 8192,
        }
    }
}

/// What the caster saw of one client.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClientReport {
    /// The client's address.
    pub peer: String,
    /// The request line, credentials removed.
    pub request: String,
    /// `ntrip2`, `ntrip1`, or `none` (no complete request).
    pub protocol: &'static str,
    /// What the caster answered: `200`, `401`, `404`, `431`, `503`, `sourcetable` or `timeout`.
    pub answer: &'static str,
    /// Stream bytes delivered.
    pub bytes_sent: u64,
    /// The checks.
    pub checks: Vec<Check>,
}

impl ClientReport {
    /// Checks met and checks applicable.
    pub fn tally(&self) -> (usize, usize) {
        let app: Vec<&Check> = self.checks.iter().filter(|c| c.met.is_some()).collect();
        (
            app.iter().filter(|c| c.met == Some(true)).count(),
            app.len(),
        )
    }
}

fn source_table(cfg: &CasterConfig) -> String {
    let auth = if cfg.credentials.is_some() { "B" } else { "N" };
    format!(
        "STR;{m};Reference;RTCM 3;;2;GPS;KSHANA;XXX;0.00;0.00;0;0;Kshana reference caster;none;{auth};N;0;\r\nENDSOURCETABLE\r\n",
        m = cfg.mount
    )
}

fn nmea_ok(s: &str) -> bool {
    let Some(body) = s.trim().strip_prefix('$') else {
        return false;
    };
    let Some((b, ck)) = body.split_once('*') else {
        return false;
    };
    u8::from_str_radix(ck.trim(), 16).is_ok_and(|c| c == b.bytes().fold(0u8, |a, x| a ^ x))
}

fn handle(mut s: TcpStream, cfg: &CasterConfig, busy: bool) -> ClientReport {
    let peer = s.peer_addr().map(|a| a.to_string()).unwrap_or_default();
    let mut rep = ClientReport {
        peer,
        request: String::new(),
        protocol: "none",
        answer: "timeout",
        bytes_sent: 0,
        checks: Vec::new(),
    };
    let deadline = Instant::now() + cfg.head_timeout;
    let _ = s.set_read_timeout(Some(cfg.head_timeout));
    let mut r = BufReader::new(match s.try_clone() {
        Ok(c) => c,
        Err(_) => return rep,
    });
    let mut head: Vec<String> = Vec::new();
    let mut size = 0usize;
    loop {
        let mut line = String::new();
        let left = deadline.saturating_duration_since(Instant::now());
        if left.is_zero() {
            return rep;
        }
        let _ = s.set_read_timeout(Some(left));
        let _ = r.get_ref().set_read_timeout(Some(left));
        match r
            .by_ref()
            .take((cfg.max_head_bytes + 1 - size.min(cfg.max_head_bytes)) as u64)
            .read_line(&mut line)
        {
            Ok(0) | Err(_) => return rep,
            Ok(n) => size += n,
        }
        if size > cfg.max_head_bytes {
            let _ = s.write_all(
                b"HTTP/1.1 431 Request Header Fields Too Large\r\nConnection: close\r\n\r\n",
            );
            rep.answer = "431";
            return rep;
        }
        let l = line.trim_end().to_string();
        if l.is_empty() {
            break;
        }
        head.push(l);
    }
    rep.request = redact(head.first().map_or("", |x| x.as_str()));
    let header = |name: &str| {
        head.iter().skip(1).find_map(|h| {
            h.split_once(':')
                .filter(|(k, _)| k.trim().eq_ignore_ascii_case(name))
                .map(|(_, v)| v.trim().to_string())
        })
    };
    let v2 = header("ntrip-version").is_some_and(|v| v.eq_ignore_ascii_case("ntrip/2.0"));
    rep.protocol = if v2 { "ntrip2" } else { "ntrip1" };
    let parts: Vec<&str> = head[0].split_whitespace().collect();
    let target = parts.get(1).copied().unwrap_or("");
    let path = target
        .split('?')
        .next()
        .unwrap_or("")
        .trim_start_matches('/');
    rep.checks.push(check(
        "request-line",
        Some(
            parts.len() == 3
                && parts[0] == "GET"
                && target.starts_with('/')
                && parts[2].starts_with("HTTP/1."),
        ),
        head[0].clone(),
    ));
    rep.checks.push(check(
        "ntrip-version-header",
        Some(v2),
        header("ntrip-version").unwrap_or_default(),
    ));
    rep.checks.push(check(
        "user-agent-ntrip",
        Some(header("user-agent").is_some_and(|u| u.to_ascii_uppercase().starts_with("NTRIP"))),
        header("user-agent").unwrap_or_default(),
    ));
    rep.checks.push(check(
        "host-header",
        if v2 {
            Some(header("host").is_some())
        } else {
            None
        },
        "",
    ));
    rep.checks.push(check(
        "no-credentials-in-url",
        Some(!target.contains('@') && !target.to_ascii_lowercase().contains("pass")),
        "",
    ));
    if let Some(g) = header("ntrip-gga") {
        rep.checks
            .push(check("gga-checksum", Some(nmea_ok(&g)), ""));
    }
    let given = header("authorization").and_then(|a| {
        let (scheme, v) = a.split_once(' ')?;
        if !scheme.eq_ignore_ascii_case("basic") {
            return None;
        }
        let raw = crate::permalink::base64_decode(v.trim())?;
        let t = String::from_utf8(raw).ok()?;
        t.split_once(':')
            .map(|(u, p)| (u.to_string(), p.to_string()))
    });
    if busy {
        let _ = s.write_all(
            b"HTTP/1.1 503 Service Unavailable\r\nRetry-After: 10\r\nConnection: close\r\n\r\n",
        );
        rep.answer = "503";
        return rep;
    }
    if path.is_empty() || (!v2 && path != cfg.mount) {
        let t = source_table(cfg);
        let head = if v2 {
            format!("HTTP/1.1 200 OK\r\nNtrip-Version: Ntrip/2.0\r\nContent-Type: gnss/sourcetable\r\nContent-Length: {}\r\nConnection: close\r\n\r\n", t.len())
        } else {
            "SOURCETABLE 200 OK\r\nContent-Type: text/plain\r\n\r\n".to_string()
        };
        let _ = s
            .write_all(head.as_bytes())
            .and_then(|_| s.write_all(t.as_bytes()));
        rep.answer = "sourcetable";
        return rep;
    }
    if path != cfg.mount {
        let _ = s.write_all(
            b"HTTP/1.1 404 Not Found\r\nNtrip-Version: Ntrip/2.0\r\nConnection: close\r\n\r\n",
        );
        rep.answer = "404";
        return rep;
    }
    if let Some((u, p)) = &cfg.credentials {
        let ok = given.as_ref().is_some_and(|(gu, gp)| gu == u && gp == p);
        rep.checks.push(check(
            "basic-auth",
            Some(ok),
            if given.is_some() { "Basic" } else { "" },
        ));
        if !ok {
            let _ = s.write_all(
                format!(
                    "HTTP/1.1 401 Unauthorized\r\nNtrip-Version: Ntrip/2.0\r\nWWW-Authenticate: Basic realm=\"/{}\"\r\nConnection: close\r\n\r\n",
                    cfg.mount
                )
                .as_bytes(),
            );
            rep.answer = "401";
            return rep;
        }
    }
    let _ = s.set_write_timeout(Some(Duration::from_secs(10)));
    let ok_head = if v2 {
        "HTTP/1.1 200 OK\r\nNtrip-Version: Ntrip/2.0\r\nContent-Type: gnss/data\r\nTransfer-Encoding: chunked\r\nCache-Control: no-store\r\nConnection: close\r\n\r\n"
    } else {
        "ICY 200 OK\r\n\r\n"
    };
    rep.answer = "200";
    let mut delivered = s.write_all(ok_head.as_bytes()).is_ok();
    for c in cfg.stream.chunks(cfg.chunk_bytes.max(1)) {
        if !delivered {
            break;
        }
        let w = if v2 {
            let ext = if cfg.chunk_extensions {
                ";kshana-ext=1"
            } else {
                ""
            };
            let mut b = format!("{:X}{ext}\r\n", c.len()).into_bytes();
            b.extend_from_slice(c);
            b.extend_from_slice(b"\r\n");
            s.write_all(&b)
        } else {
            s.write_all(c)
        };
        if w.is_err() {
            delivered = false;
            break;
        }
        rep.bytes_sent += c.len() as u64;
        if !cfg.pace.is_zero() {
            std::thread::sleep(cfg.pace);
        }
    }
    if delivered && v2 {
        delivered = s.write_all(b"0\r\n\r\n").is_ok();
    }
    let _ = s.flush();
    rep.checks.push(check(
        "stream-delivered",
        Some(delivered),
        format!("{}", rep.bytes_sent),
    ));
    rep
}

/// Serve `clients` connections (none: until the listener fails) and pass each report to
/// `on_report` as the client finishes. Connections are handled in parallel up to
/// `cfg.max_clients`; the next ones are answered `503`.
pub fn serve(
    listener: TcpListener,
    cfg: Arc<CasterConfig>,
    clients: Option<usize>,
    mut on_report: impl FnMut(ClientReport),
) {
    let active = Arc::new(AtomicUsize::new(0));
    let (tx, rx) = mpsc::channel::<ClientReport>();
    let mut accepted = 0usize;
    let mut done = 0usize;
    for conn in listener.incoming() {
        while let Ok(r) = rx.try_recv() {
            done += 1;
            on_report(r);
        }
        let Ok(s) = conn else { break };
        accepted += 1;
        let busy = active.fetch_add(1, Ordering::SeqCst) >= cfg.max_clients;
        let (tx, cfg, active) = (tx.clone(), Arc::clone(&cfg), Arc::clone(&active));
        std::thread::spawn(move || {
            let r = handle(s, &cfg, busy);
            active.fetch_sub(1, Ordering::SeqCst);
            let _ = tx.send(r);
        });
        if clients.is_some_and(|n| accepted >= n) {
            break;
        }
    }
    drop(tx);
    while done < accepted {
        match rx.recv() {
            Ok(r) => {
                done += 1;
                on_report(r);
            }
            Err(_) => break,
        }
    }
}

/// An answer read off a connection.
struct Exchange {
    status: String,
    headers: Vec<String>,
    body: Vec<u8>,
}

impl Exchange {
    fn header(&self, name: &str) -> Option<String> {
        self.headers.iter().find_map(|h| {
            h.split_once(':')
                .filter(|(k, _)| k.trim().eq_ignore_ascii_case(name))
                .map(|(_, v)| v.trim().to_string())
        })
    }
    fn code(&self) -> &str {
        self.status.split_whitespace().nth(1).unwrap_or("")
    }
}

fn exchange(addr: &str, request: &str, limit: usize, seconds: f64) -> Result<Exchange, String> {
    let a = addr
        .to_socket_addrs()
        .map_err(|e| format!("{addr}: {e}"))?
        .next()
        .ok_or_else(|| addr.to_string())?;
    let mut s = TcpStream::connect_timeout(&a, Duration::from_secs(5))
        .map_err(|e| format!("{addr}: {e}"))?;
    let _ = s.set_read_timeout(Some(Duration::from_secs_f64(seconds.clamp(0.2, 30.0))));
    s.write_all(request.as_bytes()).map_err(|e| e.to_string())?;
    let mut r = BufReader::new(s);
    let mut status = String::new();
    r.read_line(&mut status).map_err(|e| e.to_string())?;
    let status = status.trim_end().to_string();
    let mut headers = Vec::new();
    if !status.starts_with("ICY") {
        loop {
            let mut l = String::new();
            match r.read_line(&mut l) {
                Ok(0) | Err(_) => break,
                Ok(_) => {}
            }
            let l = l.trim_end().to_string();
            if l.is_empty() {
                break;
            }
            headers.push(l);
        }
    }
    let mut body = Vec::new();
    let end = Instant::now() + Duration::from_secs_f64(seconds.max(0.0));
    let mut buf = [0u8; 4096];
    while body.len() < limit && Instant::now() < end {
        match r.read(&mut buf) {
            Ok(0) | Err(_) => break,
            Ok(n) => body.extend_from_slice(&buf[..n]),
        }
    }
    Ok(Exchange {
        status,
        headers,
        body,
    })
}

/// Remove chunked transfer encoding: the data, whether chunk extensions were seen, and whether
/// every chunk-size line read was well formed.
pub fn dechunk(body: &[u8]) -> (Vec<u8>, bool, bool) {
    let mut out = Vec::new();
    let (mut ext, mut ok) = (false, true);
    let mut i = 0;
    while i < body.len() {
        let Some(nl) = body[i..].windows(2).position(|w| w == b"\r\n") else {
            break;
        };
        let line = String::from_utf8_lossy(&body[i..i + nl]).to_string();
        let (size, e) = match line.split_once(';') {
            Some((a, _)) => (a.trim().to_string(), true),
            None => (line.trim().to_string(), false),
        };
        ext |= e;
        let Ok(n) = usize::from_str_radix(&size, 16) else {
            ok = false;
            break;
        };
        i += nl + 2;
        if n == 0 {
            break;
        }
        let end = (i + n).min(body.len());
        out.extend_from_slice(&body[i..end]);
        if i + n + 2 > body.len() {
            break; // cut by the read limit
        }
        if &body[i + n..i + n + 2] != b"\r\n" {
            ok = false;
            break;
        }
        i += n + 2;
    }
    (out, ext, ok)
}

/// What to probe.
#[derive(Clone, Debug)]
pub struct ProbeConfig {
    /// `host:port`.
    pub addr: String,
    /// The mountpoint.
    pub mount: String,
    /// Credentials for it.
    pub credentials: Option<(String, String)>,
    /// A GGA sentence to send.
    pub gga: Option<String>,
    /// How long to read each stream (s).
    pub seconds: f64,
}

/// The probe's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ProbeReport {
    /// The caster probed.
    pub caster: String,
    /// The mountpoint.
    pub mount: String,
    /// The checks.
    pub checks: Vec<Check>,
    /// Checks met.
    pub met: usize,
    /// Checks applicable.
    pub applicable: usize,
}

fn req(cfg: &ProbeConfig, path: &str, v2: bool, auth: Option<(&str, &str)>) -> String {
    let mut r = if v2 {
        format!(
            "GET /{path} HTTP/1.1\r\nHost: {}\r\nNtrip-Version: Ntrip/2.0\r\nUser-Agent: NTRIP Kshana/{}\r\nConnection: close\r\n",
            cfg.addr,
            env!("CARGO_PKG_VERSION")
        )
    } else {
        format!(
            "GET /{path} HTTP/1.0\r\nUser-Agent: NTRIP Kshana/{}\r\n",
            env!("CARGO_PKG_VERSION")
        )
    };
    if let Some((u, p)) = auth {
        r.push_str(&format!(
            "Authorization: Basic {}\r\n",
            crate::permalink::base64_encode(format!("{u}:{p}").as_bytes())
        ));
    }
    if let (true, Some(g)) = (v2, &cfg.gga) {
        r.push_str(&format!("Ntrip-GGA: {g}\r\n"));
    }
    r.push_str("\r\n");
    if let (false, Some(g)) = (v2, &cfg.gga) {
        r.push_str(&format!("{g}\r\n"));
    }
    r
}

fn frames(bytes: &[u8]) -> u64 {
    let mut c = crate::ntrip::RtcmCounter::default();
    c.push(bytes);
    c.frames
}

/// Probe a caster.
pub fn probe(cfg: &ProbeConfig) -> ProbeReport {
    let mut checks = Vec::new();
    let creds = cfg
        .credentials
        .as_ref()
        .map(|(u, p)| (u.as_str(), p.as_str()));
    let fail_seen = |e: String| check("connect", Some(false), e);
    // the source table, both versions
    match exchange(&cfg.addr, &req(cfg, "", true, None), 1 << 20, 3.0) {
        Ok(x) => {
            let body = if x
                .header("transfer-encoding")
                .is_some_and(|t| t.contains("chunked"))
            {
                dechunk(&x.body).0
            } else {
                x.body.clone()
            };
            let text = String::from_utf8_lossy(&body).to_string();
            checks.push(check(
                "sourcetable-v2",
                Some(
                    x.code() == "200"
                        && x.header("content-type")
                            .is_some_and(|t| t.contains("gnss/sourcetable"))
                        && text.contains("ENDSOURCETABLE"),
                ),
                x.status.clone(),
            ));
            let t = super::sourcetable::parse(&text);
            checks.push(check(
                "mount-listed",
                Some(t.mountpoints.iter().any(|m| m.mountpoint == cfg.mount)),
                format!("{}", t.mountpoints.len()),
            ));
        }
        Err(e) => checks.push(fail_seen(e)),
    }
    match exchange(&cfg.addr, &req(cfg, "", false, None), 1 << 20, 3.0) {
        Ok(x) => checks.push(check(
            "sourcetable-v1",
            Some(x.status.starts_with("SOURCETABLE 200") || x.code() == "200"),
            x.status.clone(),
        )),
        Err(e) => checks.push(fail_seen(e)),
    }
    // refusals
    if let Some((u, _)) = creds {
        for (id, auth) in [
            ("auth-required", None),
            ("wrong-password-refused", Some((u, "kshana-wrong-password"))),
        ] {
            match exchange(&cfg.addr, &req(cfg, &cfg.mount, true, auth), 4096, 2.0) {
                Ok(x) => {
                    checks.push(check(id, Some(x.code() == "401"), x.status.clone()));
                    if id == "auth-required" && x.code() == "401" {
                        checks.push(check(
                            "www-authenticate-header",
                            Some(x.header("www-authenticate").is_some()),
                            "",
                        ));
                    }
                }
                Err(e) => checks.push(fail_seen(e)),
            }
        }
    } else {
        checks.push(check("auth-required", None, ""));
    }
    match exchange(
        &cfg.addr,
        &req(cfg, "KSHANA_NO_SUCH_MOUNT", true, creds),
        65536,
        2.0,
    ) {
        Ok(x) => {
            let stream = x.code() == "200"
                && !x
                    .header("content-type")
                    .is_some_and(|t| t.contains("sourcetable"));
            checks.push(check(
                "unknown-mount-refused",
                Some(!stream),
                x.status.clone(),
            ));
        }
        Err(e) => checks.push(fail_seen(e)),
    }
    // the stream, both versions
    match exchange(
        &cfg.addr,
        &req(cfg, &cfg.mount, true, creds),
        1 << 22,
        cfg.seconds,
    ) {
        Ok(x) => {
            let chunked = x
                .header("transfer-encoding")
                .is_some_and(|t| t.contains("chunked"));
            let (data, ext, well) = if chunked {
                dechunk(&x.body)
            } else {
                (x.body.clone(), false, true)
            };
            let n = frames(&data);
            checks.push(check(
                "stream-v2",
                Some(x.code() == "200" && n > 0),
                x.status.clone(),
            ));
            checks.push(check(
                "chunked-well-formed",
                if chunked { Some(well) } else { None },
                if ext { "extensions" } else { "" },
            ));
            checks.push(check("rtcm-frames-v2", Some(n > 0), format!("{n}")));
        }
        Err(e) => checks.push(fail_seen(e)),
    }
    match exchange(
        &cfg.addr,
        &req(cfg, &cfg.mount, false, creds),
        1 << 22,
        cfg.seconds,
    ) {
        Ok(x) => {
            let n = frames(&x.body);
            checks.push(check(
                "stream-v1",
                Some(x.status.starts_with("ICY 200") && n > 0),
                x.status.clone(),
            ));
        }
        Err(e) => checks.push(fail_seen(e)),
    }
    let applicable = checks.iter().filter(|c| c.met.is_some()).count();
    let met = checks.iter().filter(|c| c.met == Some(true)).count();
    ProbeReport {
        caster: cfg.addr.clone(),
        mount: cfg.mount.clone(),
        checks,
        met,
        applicable,
    }
}

/// A correction source in a failover test.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SourceSpec {
    /// Name (`ntrip`, `lband`, `radio`, ...).
    pub name: String,
    /// Delivery latency, s.
    pub latency_s: f64,
    /// Interval between corrections, s (default 1).
    pub interval_s: Option<f64>,
    /// Outages, `[start, end]` in seconds of the run.
    #[serde(default)]
    pub outages: Vec<[f64; 2]>,
}

/// The failover policy under test.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct Policy {
    /// Preference order of the sources.
    pub order: Vec<String>,
    /// Switch away when nothing has arrived from the active source for this long (s).
    pub switch_after_s: f64,
    /// Switch back to a preferred source after it has been healthy this long (s).
    pub switch_back_hold_s: f64,
}

/// A failover test.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct FailoverSpec {
    /// Length of the run, s.
    pub duration_s: f64,
    /// Time step, s (default 1).
    pub step_s: Option<f64>,
    /// The rover gives up RTK when its corrections are older than this (s).
    pub max_age_s: f64,
    /// The policy.
    pub policy: Policy,
    /// The sources.
    pub sources: Vec<SourceSpec>,
}

/// One switch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Switch {
    /// When, s.
    pub t_s: f64,
    /// From (empty at the start).
    pub from: String,
    /// To.
    pub to: String,
}

/// The failover test's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FailoverReport {
    /// Always `MODELLED`.
    pub label: &'static str,
    /// The switches.
    pub switches: Vec<Switch>,
    /// Largest correction age at the rover, s.
    pub max_age_s: f64,
    /// Time with the correction age above `max_age_s`, s.
    pub time_over_max_age_s: f64,
    /// Most switches in any 600 s window.
    pub max_switches_per_10_min: usize,
    /// `age-over-limit`, `flapping` (more than four switches in 600 s).
    pub findings: Vec<&'static str>,
}

/// Run a failover test.
pub fn failover(spec: &FailoverSpec) -> Result<FailoverReport, String> {
    let step = spec.step_s.unwrap_or(1.0);
    if !(step > 0.0 && spec.duration_s > 0.0 && spec.duration_s / step <= 1e7)
        || spec.sources.is_empty()
    {
        return Err(crate::terr!("e-rtkqa-failover-spec"));
    }
    let idx = |n: &str| spec.sources.iter().position(|s| s.name == n);
    let order: Vec<usize> = spec
        .policy
        .order
        .iter()
        .map(|n| idx(n).ok_or_else(|| crate::terr!("e-rtkqa-failover-source", name = n.clone())))
        .collect::<Result<_, _>>()?;
    let up = |s: &SourceSpec, t: f64| !s.outages.iter().any(|o| t >= o[0] && t < o[1]);
    // age at t of source s: t minus the newest correction generated while up and arrived by t
    let age = |s: &SourceSpec, t: f64| -> f64 {
        let iv = s.interval_s.unwrap_or(1.0).max(1e-3);
        let mut g = ((t - s.latency_s) / iv).floor() * iv;
        let mut tries = 0;
        while g >= 0.0 && !up(s, g) && tries < 1_000_000 {
            g -= iv;
            tries += 1;
        }
        if g < 0.0 || tries >= 1_000_000 {
            f64::INFINITY
        } else {
            t - g
        }
    };
    // time since the last correction arrived from s
    let silent = |s: &SourceSpec, t: f64| age(s, t) - s.latency_s;
    let healthy = |s: &SourceSpec, t: f64| silent(s, t) <= s.interval_s.unwrap_or(1.0) + 1e-9;
    let mut active: Option<usize> = None;
    let mut healthy_since: Vec<Option<f64>> = vec![None; spec.sources.len()];
    let mut switches = Vec::new();
    let (mut max_age, mut over) = (0.0f64, 0.0f64);
    let n = (spec.duration_s / step).round() as usize;
    for k in 0..=n {
        let t = k as f64 * step;
        for (i, s) in spec.sources.iter().enumerate() {
            healthy_since[i] = if healthy(s, t) {
                healthy_since[i].or(Some(t))
            } else {
                None
            };
        }
        let want = match active {
            None => order.iter().copied().find(|i| healthy_since[*i].is_some()),
            Some(a) => {
                let pos = order.iter().position(|i| *i == a).unwrap_or(usize::MAX);
                let better = order.iter().take(pos).copied().find(|i| {
                    healthy_since[*i].is_some_and(|h| t - h >= spec.policy.switch_back_hold_s)
                });
                if better.is_some() {
                    better
                } else if silent(&spec.sources[a], t) > spec.policy.switch_after_s {
                    order
                        .iter()
                        .copied()
                        .find(|i| *i != a && healthy_since[*i].is_some())
                        .or(Some(a))
                } else {
                    Some(a)
                }
            }
        };
        if want != active {
            if let Some(w) = want {
                switches.push(Switch {
                    t_s: t,
                    from: active.map_or(String::new(), |a| spec.sources[a].name.clone()),
                    to: spec.sources[w].name.clone(),
                });
            }
            active = want.or(active);
        }
        // before the first source is chosen nothing could have arrived yet: not counted
        if let Some(a) = active.map(|a| age(&spec.sources[a], t)) {
            if a.is_finite() {
                max_age = max_age.max(a);
            }
            if a > spec.max_age_s && k < n {
                over += step;
            }
        }
    }
    let times: Vec<f64> = switches.iter().skip(1).map(|s| s.t_s).collect();
    let max_win = (0..times.len())
        .map(|i| {
            times[i..]
                .iter()
                .take_while(|t| **t < times[i] + 600.0)
                .count()
        })
        .max()
        .unwrap_or(0);
    let mut findings = Vec::new();
    if over > 0.0 {
        findings.push("age-over-limit");
    }
    if max_win > 4 {
        findings.push("flapping");
    }
    Ok(FailoverReport {
        label: "MODELLED",
        switches,
        max_age_s: max_age,
        time_over_max_age_s: over,
        max_switches_per_10_min: max_win,
        findings,
    })
}
