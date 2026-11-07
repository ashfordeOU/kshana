// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Station (roadmap L3): a headless service on a site computer wired to receivers.
//!
//! `kshana station run <station.toml>` reads every configured receiver stream as it arrives
//! (a TCP port, a serial or USB device, a file), turns each into `kshana.obs/1` records with
//! [`crate::obs_live::LiveObs`] (the same epochs a replay of the recorded bytes gives), and
//! writes them to rotated files, one directory per source. It reports its state on a local
//! HTTP port (`GET /health`, `GET /status`) and, when configured, sends that state to a fleet
//! manager. It reads receivers only: nothing is ever written to a device.
//!
//! * **Rotation.** A source's file is closed past `output.rotate_mb` and a new one begins with
//!   the source's header record, so every file is a valid observation file on its own; the oldest
//!   files past `output.keep` are deleted.
//! * **Reconnection.** A stream that ends or fails is opened again every second; the time without
//!   input is counted as a gap (never filled) and each new connection starts a new file.
//! * **Local only by default.** The status port listens on the loopback address; another address
//!   needs `http.token_file`, and then every request but `/health` needs `Authorization: Bearer`.
//! * `kshana station check <station.toml>` validates a configuration; `kshana station service
//!   <systemd|launchd|windows> <station.toml>` prints what installs it as a service.

use crate::obs::{Record, Station as ObsStation};
use serde::Deserialize;
use serde_json::{json, Value};
use std::collections::BTreeMap;
use std::io::{Read, Write};
use std::net::{SocketAddr, TcpListener, TcpStream};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicBool, Ordering};
use std::sync::{Arc, Mutex};
use std::time::{Duration, Instant, SystemTime, UNIX_EPOCH};

/// A Station's configuration file.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Config {
    /// The station the observations come from (the `kshana.obs/1` station block).
    pub station: ObsStation,
    /// The receiver streams.
    #[serde(rename = "source")]
    pub sources: Vec<Source>,
    /// Where the observation files go.
    pub output: Output,
    /// The status port.
    #[serde(default)]
    pub http: Http,
    /// A fleet manager to report to.
    #[serde(default)]
    pub fleet: Option<Fleet>,
}

/// One receiver stream.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Source {
    /// A short name: letters, digits, `-` and `_`; it names the source's directory.
    pub name: String,
    /// `tcp:host:port`, or a file or device path (a serial port: set its speed first).
    pub input: String,
    /// A `kshana obs live` format (`ubx`, `sbf`, `nmea`, `rtcm3`, `novatel`, ...).
    pub format: String,
    /// Open the stream again when it ends (default true).
    #[serde(default = "yes")]
    pub reconnect: bool,
}

fn yes() -> bool {
    true
}

/// Output settings.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Output {
    /// The directory of the observation files (relative to the configuration file).
    pub dir: PathBuf,
    /// Start a new file past this many MiB (default 64).
    #[serde(default = "default_rotate")]
    pub rotate_mb: f64,
    /// Keep this many files per source (default 48).
    #[serde(default = "default_keep")]
    pub keep: usize,
}

fn default_rotate() -> f64 {
    64.0
}
fn default_keep() -> usize {
    48
}

/// The status port.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Http {
    /// The address to listen on (default `127.0.0.1:8470`).
    #[serde(default = "default_listen")]
    pub listen: String,
    /// A file holding the bearer token required off the loopback address.
    #[serde(default)]
    pub token_file: Option<PathBuf>,
}

impl Default for Http {
    fn default() -> Self {
        Http {
            listen: default_listen(),
            token_file: None,
        }
    }
}

fn default_listen() -> String {
    "127.0.0.1:8470".into()
}

/// A fleet manager the Station reports to.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Fleet {
    /// `http://host:port/path` the status is posted to.
    pub url: String,
    /// A file holding the bearer token the manager expects.
    #[serde(default)]
    pub token_file: Option<PathBuf>,
    /// Seconds between reports (default 30).
    #[serde(default = "default_interval")]
    pub interval_s: f64,
}

fn default_interval() -> f64 {
    30.0
}

fn name_ok(s: &str) -> bool {
    !s.is_empty()
        && s.len() <= 64
        && s.bytes()
            .all(|b| b.is_ascii_alphanumeric() || b == b'-' || b == b'_')
}

/// Read and check a configuration file; relative paths are taken from its directory.
pub fn load(path: &Path) -> Result<Config, String> {
    let text = std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
    let mut c: Config = toml::from_str(&text).map_err(|e| {
        crate::terr!(
            "e-station-config",
            path = path.display().to_string(),
            e = e.to_string()
        )
    })?;
    let base = path.parent().unwrap_or(Path::new("."));
    if c.output.dir.is_relative() {
        c.output.dir = base.join(&c.output.dir);
    }
    if let Some(t) = c.http.token_file.as_mut() {
        if t.is_relative() {
            *t = base.join(&*t);
        }
    }
    if let Some(t) = c.fleet.as_mut().and_then(|f| f.token_file.as_mut()) {
        if t.is_relative() {
            *t = base.join(&*t);
        }
    }
    check(&c)?;
    Ok(c)
}

/// Check a configuration.
pub fn check(c: &Config) -> Result<(), String> {
    if c.sources.is_empty() {
        return Err(crate::terr!("e-station-no-source"));
    }
    for (i, s) in c.sources.iter().enumerate() {
        if !name_ok(&s.name) || c.sources[..i].iter().any(|o| o.name == s.name) {
            return Err(crate::terr!("e-station-source-name", name = s.name.clone()));
        }
        crate::obs_live::LiveObs::new(&s.format, &c.station)?;
    }
    if !(c.output.rotate_mb > 0.0 && c.output.rotate_mb.is_finite()) || c.output.keep == 0 {
        return Err(crate::terr!("e-station-output"));
    }
    let addr: SocketAddr = c
        .http
        .listen
        .parse()
        .map_err(|_| crate::terr!("e-station-listen", addr = c.http.listen.clone()))?;
    if !addr.ip().is_loopback() && c.http.token_file.is_none() {
        return Err(crate::terr!(
            "e-station-remote-http",
            addr = c.http.listen.clone()
        ));
    }
    if let Some(f) = &c.fleet {
        if !(f.url.starts_with("http://") && f.interval_s >= 1.0 && f.interval_s.is_finite()) {
            return Err(crate::terr!("e-station-fleet-url"));
        }
    }
    Ok(())
}

/// The state of one source.
#[derive(Clone, Debug, Default)]
struct SourceState {
    connected: bool,
    connections: u64,
    gaps: u64,
    bytes: u64,
    epochs: u64,
    last_epoch_unix: Option<f64>,
    last_error: Option<String>,
    file: Option<String>,
    files_written: u64,
}

fn now_unix() -> f64 {
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs_f64())
        .unwrap_or(0.0)
}

/// The rotated observation files of one source.
struct Rotator {
    dir: PathBuf,
    rotate_bytes: u64,
    keep: usize,
    header: Option<Record>,
    file: Option<(std::fs::File, u64, PathBuf)>,
    seq: u64,
}

impl Rotator {
    fn new(dir: PathBuf, rotate_mb: f64, keep: usize) -> std::io::Result<Rotator> {
        std::fs::create_dir_all(&dir)?;
        let seq = std::fs::read_dir(&dir)?
            .filter_map(Result::ok)
            .filter_map(|e| {
                e.file_name()
                    .to_string_lossy()
                    .strip_suffix(".obs.jsonl")
                    .and_then(|s| s.parse::<u64>().ok())
            })
            .max()
            .unwrap_or(0);
        Ok(Rotator {
            dir,
            rotate_bytes: (rotate_mb * 1024.0 * 1024.0) as u64,
            keep,
            header: None,
            file: None,
            seq,
        })
    }

    /// Close the current file; the next record starts a new one.
    fn close(&mut self) {
        self.file = None;
    }

    fn open_next(&mut self) -> Result<(), String> {
        self.seq += 1;
        let p = self.dir.join(format!("{:08}.obs.jsonl", self.seq));
        let f = std::fs::File::create(&p).map_err(|e| format!("{}: {e}", p.display()))?;
        self.file = Some((f, 0, p));
        if let Some(h) = self.header.clone() {
            self.write_raw(&[h])?;
        }
        // Keep the newest `keep` files.
        let mut all: Vec<PathBuf> = std::fs::read_dir(&self.dir)
            .map_err(|e| e.to_string())?
            .filter_map(Result::ok)
            .map(|e| e.path())
            .filter(|p| p.to_string_lossy().ends_with(".obs.jsonl"))
            .collect();
        all.sort();
        while all.len() > self.keep {
            let _ = std::fs::remove_file(all.remove(0));
        }
        Ok(())
    }

    fn write_raw(&mut self, recs: &[Record]) -> Result<(), String> {
        let text = crate::obs::to_jsonl(recs)?;
        let (f, n, p) = self.file.as_mut().expect("a file is open");
        f.write_all(text.as_bytes())
            .and_then(|()| f.flush())
            .map_err(|e| format!("{}: {e}", p.display()))?;
        *n += text.len() as u64;
        Ok(())
    }

    /// Write records; returns the file written to.
    fn write(&mut self, recs: Vec<Record>) -> Result<Option<String>, String> {
        if recs.is_empty() {
            return Ok(None);
        }
        let mut body = Vec::new();
        for r in recs {
            if matches!(r, Record::Header(_)) {
                // A new connection's header starts a new file.
                self.header = Some(r);
                self.close();
            } else {
                body.push(r);
            }
        }
        if self.file.is_none() {
            self.open_next()?;
        } else if self
            .file
            .as_ref()
            .is_some_and(|(_, n, _)| *n >= self.rotate_bytes)
        {
            self.close();
            self.open_next()?;
        }
        if !body.is_empty() {
            self.write_raw(&body)?;
        }
        Ok(self.file.as_ref().map(|(_, _, p)| p.display().to_string()))
    }
}

fn open_input(input: &str) -> std::io::Result<Box<dyn Read + Send>> {
    if let Some(addr) = input.strip_prefix("tcp:") {
        let s = TcpStream::connect(addr)?;
        s.set_read_timeout(Some(Duration::from_secs(1)))?;
        Ok(Box::new(s))
    } else {
        Ok(Box::new(std::fs::File::open(input)?))
    }
}

/// A running Station.
pub struct Handle {
    stop: Arc<AtomicBool>,
    state: Arc<Mutex<BTreeMap<String, SourceState>>>,
    config: Config,
    started: Instant,
    /// The status port's address.
    pub http_addr: SocketAddr,
    fleet_last: Arc<Mutex<Option<Value>>>,
}

impl Handle {
    /// The status document (`GET /status`).
    pub fn status(&self) -> Value {
        status_doc(&self.config, &self.state, self.started, &self.fleet_last)
    }

    /// Ask every thread to stop (a source blocked on a device read stops with the process).
    pub fn stop(&self) {
        self.stop.store(true, Ordering::SeqCst);
    }
}

fn status_doc(
    config: &Config,
    state: &Mutex<BTreeMap<String, SourceState>>,
    started: Instant,
    fleet_last: &Mutex<Option<Value>>,
) -> Value {
    let st = state.lock().unwrap_or_else(|p| p.into_inner());
    let sources: Vec<Value> = config
        .sources
        .iter()
        .map(|s| {
            let x = st.get(&s.name).cloned().unwrap_or_default();
            json!({
                "name": s.name, "input": s.input, "format": s.format,
                "connected": x.connected, "connections": x.connections, "gaps": x.gaps,
                "bytes": x.bytes, "epochs": x.epochs, "last_epoch_unix": x.last_epoch_unix,
                "last_error": x.last_error, "file": x.file, "files_written": x.files_written,
            })
        })
        .collect();
    json!({
        "schema": "kshana.station-status/1",
        "station": config.station.id,
        "engine_version": env!("CARGO_PKG_VERSION"),
        "uptime_s": started.elapsed().as_secs_f64(),
        "time_unix": now_unix(),
        "sources": sources,
        "fleet": *fleet_last.lock().unwrap_or_else(|p| p.into_inner()),
    })
}

fn source_loop(
    src: Source,
    station: ObsStation,
    out: &Output,
    stop: Arc<AtomicBool>,
    state: Arc<Mutex<BTreeMap<String, SourceState>>>,
) {
    let set = |f: &dyn Fn(&mut SourceState)| {
        let mut st = state.lock().unwrap_or_else(|p| p.into_inner());
        f(st.entry(src.name.clone()).or_default());
    };
    let mut rot = match Rotator::new(out.dir.join(&src.name), out.rotate_mb, out.keep) {
        Ok(r) => r,
        Err(e) => {
            set(&|s| s.last_error = Some(e.to_string()));
            return;
        }
    };
    let mut first = true;
    while !stop.load(Ordering::SeqCst) {
        let input = match open_input(&src.input) {
            Ok(i) => i,
            Err(e) => {
                set(&|s| s.last_error = Some(e.to_string()));
                if !src.reconnect {
                    return;
                }
                std::thread::sleep(Duration::from_secs(1));
                continue;
            }
        };
        if !first {
            set(&|s| s.gaps += 1);
        }
        first = false;
        set(&|s| {
            s.connected = true;
            s.connections += 1;
        });
        let mut live = match crate::obs_live::LiveObs::new(&src.format, &station) {
            Ok(l) => l,
            Err(e) => {
                set(&|s| s.last_error = Some(e.clone()));
                return;
            }
        };
        let mut input = input;
        let mut buf = vec![0u8; 64 * 1024];
        let write = |recs: Vec<Record>, rot: &mut Rotator| -> Result<(), String> {
            let epochs = recs
                .iter()
                .filter(|r| matches!(r, Record::Epoch(_)))
                .count() as u64;
            let had_header = recs.iter().any(|r| matches!(r, Record::Header(_)));
            let file = rot.write(recs)?;
            set(&|s| {
                s.epochs += epochs;
                if epochs > 0 {
                    s.last_epoch_unix = Some(now_unix());
                }
                if let Some(f) = &file {
                    s.file = Some(f.clone());
                }
                if had_header {
                    s.files_written += 1;
                }
            });
            Ok(())
        };
        loop {
            if stop.load(Ordering::SeqCst) {
                break;
            }
            match input.read(&mut buf) {
                Ok(0) => break,
                Ok(n) => {
                    set(&|s| s.bytes += n as u64);
                    match live.push(&buf[..n]) {
                        Ok(recs) => {
                            if let Err(e) = write(recs, &mut rot) {
                                set(&|s| s.last_error = Some(e.clone()));
                            }
                        }
                        Err(e) => set(&|s| s.last_error = Some(e.clone())),
                    }
                }
                Err(e)
                    if matches!(
                        e.kind(),
                        std::io::ErrorKind::WouldBlock
                            | std::io::ErrorKind::TimedOut
                            | std::io::ErrorKind::Interrupted
                    ) => {}
                Err(e) => {
                    set(&|s| s.last_error = Some(e.to_string()));
                    break;
                }
            }
        }
        if let Ok(recs) = live.flush() {
            let _ = write(recs, &mut rot);
        }
        rot.close();
        set(&|s| s.connected = false);
        if !src.reconnect {
            return;
        }
        std::thread::sleep(Duration::from_secs(1));
    }
}

fn read_token(p: &Option<PathBuf>) -> Result<Option<String>, String> {
    match p {
        None => Ok(None),
        Some(p) => std::fs::read_to_string(p)
            .map(|t| Some(t.trim().to_string()))
            .map_err(|e| format!("{}: {e}", p.display())),
    }
}

fn http_reply(s: &mut TcpStream, code: u16, ctype: &str, body: &str) {
    let reason = match code {
        200 => "OK",
        401 => "Unauthorized",
        _ => "Not Found",
    };
    let _ = write!(
        s,
        "HTTP/1.1 {code} {reason}\r\nContent-Type: {ctype}\r\nContent-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    );
}

/// Post `body` to an `http://` URL with an optional bearer token; returns the status code.
fn post(url: &str, token: Option<&str>, body: &str) -> Result<u16, String> {
    let rest = url.strip_prefix("http://").ok_or("http:// only")?;
    let (host, path) = rest
        .split_once('/')
        .map_or((rest, "/".to_string()), |(h, p)| (h, format!("/{p}")));
    let mut s = TcpStream::connect(host).map_err(|e| e.to_string())?;
    s.set_read_timeout(Some(Duration::from_secs(10)))
        .map_err(|e| e.to_string())?;
    let auth = token
        .map(|t| format!("Authorization: Bearer {t}\r\n"))
        .unwrap_or_default();
    write!(
        s,
        "POST {path} HTTP/1.1\r\nHost: {host}\r\nContent-Type: application/json\r\n{auth}Content-Length: {}\r\nConnection: close\r\n\r\n{body}",
        body.len()
    )
    .map_err(|e| e.to_string())?;
    let mut head = [0u8; 12];
    s.read_exact(&mut head).map_err(|e| e.to_string())?;
    String::from_utf8_lossy(&head[9..12])
        .parse()
        .map_err(|_| "bad reply".to_string())
}

/// Start a Station; returns at once.
pub fn start(config: Config) -> Result<Handle, String> {
    check(&config)?;
    let http_token = read_token(&config.http.token_file)?;
    let stop = Arc::new(AtomicBool::new(false));
    let state = Arc::new(Mutex::new(BTreeMap::new()));
    let fleet_last = Arc::new(Mutex::new(None));
    let started = Instant::now();
    for src in config.sources.clone() {
        let (station, out, stop, state) = (
            config.station.clone(),
            config.output.clone(),
            stop.clone(),
            state.clone(),
        );
        std::thread::spawn(move || source_loop(src, station, &out, stop, state));
    }
    let listener = TcpListener::bind(&config.http.listen)
        .map_err(|e| format!("{}: {e}", config.http.listen))?;
    listener.set_nonblocking(true).map_err(|e| e.to_string())?;
    let http_addr = listener.local_addr().map_err(|e| e.to_string())?;
    {
        let (cfg, stop, state, fl) = (
            config.clone(),
            stop.clone(),
            state.clone(),
            fleet_last.clone(),
        );
        std::thread::spawn(move || {
            while !stop.load(Ordering::SeqCst) {
                let Ok((mut s, _)) = listener.accept() else {
                    std::thread::sleep(Duration::from_millis(20));
                    continue;
                };
                let _ = s.set_nonblocking(false);
                let _ = s.set_read_timeout(Some(Duration::from_secs(5)));
                let mut buf = vec![0u8; 8192];
                let n = s.read(&mut buf).unwrap_or(0);
                let head = String::from_utf8_lossy(&buf[..n]).to_string();
                let line = head.lines().next().unwrap_or("");
                let authorised = http_token.as_deref().is_none_or(|t| {
                    head.lines().any(|l| {
                        l.split_once(':').is_some_and(|(k, v)| {
                            k.eq_ignore_ascii_case("authorization")
                                && v.trim() == format!("Bearer {t}")
                        })
                    })
                });
                if line.starts_with("GET /health ") {
                    http_reply(&mut s, 200, "text/plain", "ok\n");
                } else if !authorised {
                    http_reply(
                        &mut s,
                        401,
                        "application/json",
                        "{\"error\":\"unauthorised\"}",
                    );
                } else if line.starts_with("GET /status ") {
                    let doc = status_doc(&cfg, &state, started, &fl);
                    http_reply(&mut s, 200, "application/json", &doc.to_string());
                } else {
                    http_reply(&mut s, 404, "application/json", "{\"error\":\"not found\"}");
                }
            }
        });
    }
    if let Some(f) = config.fleet.clone() {
        let token = read_token(&f.token_file)?;
        let (cfg, stop, state, fl) = (
            config.clone(),
            stop.clone(),
            state.clone(),
            fleet_last.clone(),
        );
        std::thread::spawn(move || {
            while !stop.load(Ordering::SeqCst) {
                let doc = status_doc(&cfg, &state, started, &fl);
                let result = post(&f.url, token.as_deref(), &doc.to_string());
                *fl.lock().unwrap_or_else(|p| p.into_inner()) = Some(json!({
                    "url": f.url,
                    "time_unix": now_unix(),
                    "status": result.as_ref().ok(),
                    "error": result.err(),
                }));
                let until = Instant::now() + Duration::from_secs_f64(f.interval_s);
                while Instant::now() < until && !stop.load(Ordering::SeqCst) {
                    std::thread::sleep(Duration::from_millis(50));
                }
            }
        });
    }
    Ok(Handle {
        stop,
        state,
        config,
        started,
        http_addr,
        fleet_last,
    })
}

/// What installs a Station as a service on `system`, for the configuration at `config`
/// run by the program at `program`.
pub fn service_text(system: &str, config: &Path, program: &Path) -> Result<String, String> {
    let (c, p) = (config.display(), program.display());
    Ok(match system {
        "systemd" => format!(
            "[Unit]\nDescription=Kshana Station\nAfter=network-online.target\nWants=network-online.target\n\n[Service]\nExecStart={p} station run {c}\nRestart=always\nRestartSec=5\nNoNewPrivileges=yes\nProtectSystem=strict\nReadWritePaths=/var/lib/kshana-station\nSupplementaryGroups=dialout\n\n[Install]\nWantedBy=multi-user.target\n"
        ),
        "launchd" => format!(
            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n<plist version=\"1.0\">\n<dict>\n  <key>Label</key><string>dev.kshana.station</string>\n  <key>ProgramArguments</key>\n  <array><string>{p}</string><string>station</string><string>run</string><string>{c}</string></array>\n  <key>RunAtLoad</key><true/>\n  <key>KeepAlive</key><true/>\n</dict>\n</plist>\n"
        ),
        "windows" => format!(
            "schtasks /Create /TN \"Kshana Station\" /SC ONSTART /RU SYSTEM /RL HIGHEST /F /TR \"\\\"{p}\\\" station run \\\"{c}\\\"\"\n"
        ),
        other => return Err(crate::terr!("e-station-service-system", system = other.to_string())),
    })
}

/// `kshana station <run|check|service> ...`.
pub fn run(args: &[String]) -> Result<(), String> {
    match args {
        [cmd, path] if cmd == "check" => {
            let c = load(Path::new(path))?;
            println!(
                "{}",
                crate::t!(
                    "station-check-ok",
                    path = path.clone(),
                    id = c.station.id.clone(),
                    n = c.sources.len(),
                    dir = c.output.dir.display().to_string()
                )
            );
            Ok(())
        }
        [cmd, path] if cmd == "run" => {
            let c = load(Path::new(path))?;
            let n = c.sources.len();
            let id = c.station.id.clone();
            let h = start(c)?;
            eprintln!(
                "{}",
                crate::t!(
                    "station-started",
                    id = id,
                    n = n,
                    addr = h.http_addr.to_string()
                )
            );
            loop {
                std::thread::sleep(Duration::from_secs(3600));
            }
        }
        [cmd, system, path] if cmd == "service" => {
            let abs = std::fs::canonicalize(path).map_err(|e| format!("{path}: {e}"))?;
            load(&abs)?;
            let exe = std::env::current_exe().map_err(|e| e.to_string())?;
            print!("{}", service_text(system, &abs, &exe)?);
            Ok(())
        }
        _ => Err(crate::t!("station-usage")),
    }
}
