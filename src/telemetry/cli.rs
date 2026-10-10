// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana trust-telemetry`: read the per-epoch trust stream and feed the sinks.

use super::prometheus::{self, Registry};
use super::sample::{self, Band, TrustSample};
use super::syslog::{self, Format, Proto, SinkConfig, SyslogSink};
use std::io::{BufRead, Write};
use std::net::{SocketAddr, ToSocketAddrs};
use std::sync::{Arc, Mutex};

const USAGE: &str = "usage: kshana trust-telemetry [options]
  input (default: JSON lines on stdin):
    --input <file|->         read JSON lines from a file, or `-` for stdin
    --result <result.json>   replay the epochs of a `kshana receiver-trust` result file
  Prometheus:
    --listen <addr:port>     serve /metrics (default 127.0.0.1:9464 when no other output is chosen)
    --print-metrics          print the final exposition to stdout at end of input
    --hold                   keep serving after the input ends
    --expose-position        also publish the receiver-reported position as gauges (off by default)
  syslog (CEF or LEEF in an RFC 5424 envelope):
    --syslog-udp <host:port> | --syslog-tcp <host:port> | --print-syslog
    --syslog-octet-counting  frame TCP messages with octet counting (RFC 6587), not one per line
    --format cef|leef        payload dialect (default cef)
    --syslog-all             one event per epoch (default: one per band change)
    --host <name>            device host name in events (default `kshana`)
  OpenTelemetry (build with --features otlp):
    --otlp <http://host:4318/v1/metrics>  --otlp-every <epochs> (default 10)";

#[derive(Default)]
struct Opts {
    input: Option<String>,
    result: Option<String>,
    listen: Option<String>,
    print_metrics: bool,
    hold: bool,
    expose_position: bool,
    syslog_udp: Option<String>,
    syslog_tcp: Option<String>,
    print_syslog: bool,
    cef: Option<bool>,
    syslog_all: bool,
    octet_counting: bool,
    host: Option<String>,
    otlp: Option<String>,
    otlp_every: Option<usize>,
}

fn parse(args: &[String]) -> Result<Opts, String> {
    let mut o = Opts::default();
    let mut it = args.iter();
    while let Some(a) = it.next() {
        let mut val = |name: &str| {
            it.next()
                .cloned()
                .ok_or_else(|| format!("{name} needs a value"))
        };
        match a.as_str() {
            "--input" => o.input = Some(val("--input")?),
            "--result" => o.result = Some(val("--result")?),
            "--listen" => o.listen = Some(val("--listen")?),
            "--print-metrics" => o.print_metrics = true,
            "--hold" => o.hold = true,
            "--expose-position" => o.expose_position = true,
            "--syslog-udp" => o.syslog_udp = Some(val("--syslog-udp")?),
            "--syslog-tcp" => o.syslog_tcp = Some(val("--syslog-tcp")?),
            "--print-syslog" => o.print_syslog = true,
            "--format" => {
                o.cef = Some(match val("--format")?.as_str() {
                    "cef" => true,
                    "leef" => false,
                    f => return Err(format!("unknown --format `{f}` (cef or leef)")),
                })
            }
            "--syslog-all" => o.syslog_all = true,
            "--syslog-octet-counting" => o.octet_counting = true,
            "--host" => o.host = Some(val("--host")?),
            "--otlp" => o.otlp = Some(val("--otlp")?),
            "--otlp-every" => {
                o.otlp_every = Some(
                    val("--otlp-every")?
                        .parse()
                        .map_err(|_| "--otlp-every needs a whole number".to_string())?,
                )
            }
            "-h" | "--help" => return Err(String::new()),
            x => return Err(format!("unknown option `{x}`")),
        }
    }
    if o.input.is_some() && o.result.is_some() {
        return Err("--input and --result are alternatives".into());
    }
    Ok(o)
}

fn now_unix() -> f64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs_f64())
        .unwrap_or(0.0)
}

/// Run the command; the return value is the process exit code.
pub fn run(args: &[String]) -> i32 {
    let o = match parse(args) {
        Ok(o) => o,
        Err(e) => {
            if !e.is_empty() {
                eprintln!("error: {e}");
            }
            eprintln!("{USAGE}");
            return if e.is_empty() { 0 } else { 2 };
        }
    };
    match run_inner(&o) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("error: {e}");
            1
        }
    }
}

fn run_inner(o: &Opts) -> Result<(), String> {
    let version = env!("CARGO_PKG_VERSION");
    let reg = Arc::new(Mutex::new(Registry::new(version)));
    if let Ok(mut r) = reg.lock() {
        r.set_expose_position(o.expose_position);
    }

    // Serve metrics by default only when nothing else was asked for.
    let any_other = o.print_metrics
        || o.print_syslog
        || o.syslog_udp.is_some()
        || o.syslog_tcp.is_some()
        || o.otlp.is_some();
    let listen = match (&o.listen, any_other) {
        (Some(l), _) => Some(l.clone()),
        (None, false) => Some("127.0.0.1:9464".to_string()),
        (None, true) => None,
    };
    if let Some(l) = &listen {
        let addr: SocketAddr = l
            .to_socket_addrs()
            .map_err(|e| format!("--listen {l}: {e}"))?
            .next()
            .ok_or_else(|| format!("--listen {l}: no address"))?;
        if !addr.ip().is_loopback() {
            eprintln!(
                "warning: /metrics is served without authentication on {addr}; \
                 bind to localhost or put it behind your own access control"
            );
        }
        let bound =
            prometheus::serve(addr, Arc::clone(&reg)).map_err(|e| format!("bind {addr}: {e}"))?;
        eprintln!("serving http://{bound}/metrics");
    }

    let host = o.host.clone().unwrap_or_else(|| "kshana".into());
    let cef = o.cef.unwrap_or(true);
    let fmt = if cef { Format::Cef } else { Format::Leef };
    let failures = reg
        .lock()
        .map(|r| r.syslog_failure_counter())
        .map_err(|_| "registry poisoned".to_string())?;
    let sink = match (&o.syslog_udp, &o.syslog_tcp) {
        (Some(_), Some(_)) => return Err("--syslog-udp and --syslog-tcp are alternatives".into()),
        (Some(a), None) => Some(SyslogSink::start(
            a,
            Proto::Udp,
            SinkConfig::default(),
            failures,
        )),
        (None, Some(a)) => {
            let proto = if o.octet_counting {
                Proto::TcpOctetCounting
            } else {
                Proto::Tcp
            };
            Some(SyslogSink::start(a, proto, SinkConfig::default(), failures))
        }
        (None, None) => None,
    };
    if o.octet_counting && o.syslog_tcp.is_none() {
        return Err("--syslog-octet-counting applies to --syslog-tcp".into());
    }

    #[cfg(not(feature = "otlp"))]
    if o.otlp.is_some() {
        return Err("--otlp needs a build with `--features otlp`".into());
    }
    #[cfg(feature = "otlp")]
    let exporter = match &o.otlp {
        Some(u) => Some(super::otlp::Exporter::start(u)?),
        None => None,
    };

    let mut prev: Option<Band> = None;
    let mut n_epochs = 0usize;
    let mut handle = |s: Result<TrustSample, String>, line_no: usize| match s {
        Err(e) => {
            eprintln!("warning: input line {line_no}: {e}");
            if let Ok(mut r) = reg.lock() {
                r.observe_input_error();
            }
        }
        Ok(s) => {
            let now = now_unix();
            if let Ok(mut r) = reg.lock() {
                r.observe(&s, Some(now));
            }
            n_epochs += 1;
            let emit = o.syslog_all || prev != Some(s.band);
            if emit && (sink.is_some() || o.print_syslog) {
                let payload = match fmt {
                    Format::Cef => syslog::cef(&s, prev, &host, version),
                    Format::Leef => syslog::leef(&s, prev, &host, version),
                };
                let line = syslog::rfc5424(
                    s.band,
                    Some(&syslog::rfc3339_utc(now as i64)),
                    &host,
                    &payload,
                );
                if o.print_syslog {
                    println!("{line}");
                }
                if let Some(t) = &sink {
                    t.send(line);
                }
            }
            prev = Some(s.band);
            #[cfg(feature = "otlp")]
            if let Some(x) = &exporter {
                if n_epochs % o.otlp_every.unwrap_or(10).max(1) == 0 {
                    // Clone under the lock, export without it.
                    let snap = reg.lock().map(|r| r.clone()).ok();
                    if let Some(snap) = snap {
                        x.submit(snap, (now * 1e9) as u64);
                    }
                }
            }
        }
    };

    if let Some(path) = &o.result {
        let text = std::fs::read_to_string(path).map_err(|e| format!("cannot read {path}: {e}"))?;
        for (i, s) in sample::from_result_json(&text)?.into_iter().enumerate() {
            handle(Ok(s), i + 1);
        }
    } else {
        let reader: Box<dyn BufRead> = match o.input.as_deref() {
            None | Some("-") => Box::new(std::io::BufReader::new(std::io::stdin())),
            Some(p) => Box::new(std::io::BufReader::new(
                std::fs::File::open(p).map_err(|e| format!("cannot open {p}: {e}"))?,
            )),
        };
        for (i, line) in reader.lines().enumerate() {
            let line = line.map_err(|e| format!("read error: {e}"))?;
            if line.trim().is_empty() {
                continue;
            }
            handle(sample::parse_live_line(&line), i + 1);
        }
    }

    #[cfg(feature = "otlp")]
    if let Some(x) = exporter {
        if let Ok(snap) = reg.lock().map(|r| r.clone()) {
            x.submit(snap, (now_unix() * 1e9) as u64);
        }
        x.finish();
    }
    if let Some(t) = sink {
        t.finish();
    }
    let _ = n_epochs;
    if o.print_metrics {
        let text = reg.lock().map(|r| r.render()).unwrap_or_default();
        std::io::stdout().write_all(text.as_bytes()).ok();
    }
    if listen.is_some() && o.hold {
        loop {
            std::thread::sleep(std::time::Duration::from_secs(3600));
        }
    }
    Ok(())
}
