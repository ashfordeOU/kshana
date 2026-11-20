// SPDX-License-Identifier: AGPL-3.0-only
//! RTK, NTRIP and correction-service quality checks (`kshana rtk-qa`, docs/RTK-QA.md).
//!
//! * [`liveness`]: correction-stream liveness monitor and per-mountpoint scorecard.
//! * [`sourcetable`]: NTRIP source-table reader, mountpoints sorted by distance.
//! * [`base_check`]: base coordinate, frame, epoch and tide-system sanity of 1005/1006.
//! * [`fix_check`]: RTK fix verification and float-precision warnings on a solution file.
//! * [`ppk_diag`]: why post-processing gave no fix, from the raw logs.
//! * [`protocol`]: NTRIP v2 behaviour checks of casters and clients, a reference caster,
//!   credential-safe logging checks and a correction-source failover tester.
//!
//! Every result is labelled MODELLED: the thresholds and the score are this module's
//! conventions, checked on fixtures, not validated against a field campaign.

pub mod base_check;
pub mod fix_check;
pub mod liveness;
pub mod ppk_diag;
pub mod protocol;
pub mod sourcetable;

use std::io::Read;
use std::sync::mpsc;
use std::time::{Duration, Instant};

fn flag(args: &[String], name: &str) -> Option<String> {
    args.iter()
        .position(|a| a == name)
        .and_then(|i| args.get(i + 1))
        .cloned()
}

fn flags(args: &[String], name: &str) -> Vec<String> {
    args.windows(2)
        .filter(|w| w[0] == name)
        .map(|w| w[1].clone())
        .collect()
}

fn usage() -> i32 {
    eprintln!("{}", crate::terr!("e-rtkqa-usage"));
    2
}

fn print_json<T: serde::Serialize>(v: &T) {
    println!(
        "{}",
        serde_json::to_string_pretty(v).unwrap_or_else(|e| e.to_string())
    );
}

fn read_text(p: &str) -> Result<String, String> {
    std::fs::read_to_string(p).map_err(|e| format!("{p}: {e}"))
}

fn credentials(args: &[String]) -> Result<Option<(String, String)>, ()> {
    match (flag(args, "--user"), flag(args, "--password-env")) {
        (None, None) => Ok(None),
        (Some(u), Some(v)) => Ok(Some((u, std::env::var(v).unwrap_or_default()))),
        _ => Err(()),
    }
}

fn gga(args: &[String]) -> Result<Option<String>, ()> {
    match flag(args, "--gga") {
        None => Ok(None),
        Some(v) => {
            let n: Vec<f64> = v.split(',').filter_map(|x| x.trim().parse().ok()).collect();
            match n.as_slice() {
                [lat, lon] => Ok(Some(crate::ntrip::gga(*lat, *lon, 0.0))),
                [lat, lon, h] => Ok(Some(crate::ntrip::gga(*lat, *lon, *h))),
                _ => Err(()),
            }
        }
    }
}

fn positive(args: &[String], name: &str) -> Result<Option<f64>, ()> {
    match flag(args, name) {
        None => Ok(None),
        Some(v) => v
            .parse::<f64>()
            .ok()
            .filter(|x| x.is_finite() && *x > 0.0)
            .map(Some)
            .ok_or(()),
    }
}

/// The current date as a decimal year.
fn decimal_year_now() -> f64 {
    let unix = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0.0, |d| d.as_secs_f64());
    let days = (unix / 86_400.0).floor() as i64;
    let (y, _, _) = crate::gnss_time::civil_from_days(days);
    let start = crate::gnss_time::days_from_civil(y, 1, 1) as f64 * 86_400.0;
    let end = crate::gnss_time::days_from_civil(y + 1, 1, 1) as f64 * 86_400.0;
    y as f64 + (unix - start) / (end - start)
}

/// Monitor a live stream: `reader` yields the bytes; the monitor ticks every 100 ms. Alarms go to
/// `on_alarm` as they happen. Stops after `seconds` or when the stream ends.
pub fn monitor_stream<R: Read + Send + 'static>(
    mut reader: R,
    cfg: liveness::MonitorConfig,
    seconds: Option<f64>,
    mut on_alarm: impl FnMut(&liveness::Alarm),
) -> liveness::Scorecard {
    let (tx, rx) = mpsc::channel::<Option<Vec<u8>>>();
    std::thread::spawn(move || {
        let mut buf = vec![0u8; 16 * 1024];
        loop {
            match reader.read(&mut buf) {
                Ok(0) | Err(_) => {
                    let _ = tx.send(None);
                    break;
                }
                Ok(n) => {
                    if tx.send(Some(buf[..n].to_vec())).is_err() {
                        break;
                    }
                }
            }
        }
    });
    let start = Instant::now();
    let mut m = liveness::LivenessMonitor::new(cfg);
    loop {
        let t = start.elapsed().as_secs_f64();
        if seconds.is_some_and(|s| t >= s) {
            break;
        }
        let alarms = match rx.recv_timeout(Duration::from_millis(100)) {
            Ok(Some(b)) => {
                let now = std::time::SystemTime::now()
                    .duration_since(std::time::UNIX_EPOCH)
                    .map_or(0.0, |d| d.as_secs_f64());
                m.push(
                    start.elapsed().as_secs_f64(),
                    &b,
                    Some(liveness::receive_clock(now)),
                )
            }
            Ok(None) | Err(mpsc::RecvTimeoutError::Disconnected) => {
                for a in m.close(start.elapsed().as_secs_f64()) {
                    on_alarm(&a);
                }
                break;
            }
            Err(mpsc::RecvTimeoutError::Timeout) => m.tick(start.elapsed().as_secs_f64()),
        };
        for a in &alarms {
            on_alarm(a);
        }
    }
    m.scorecard(start.elapsed().as_secs_f64())
}

fn run_monitor(args: &[String]) -> i32 {
    let Some(addr) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let (Ok(creds), Ok(g), Ok(secs), Ok(stale), Ok(link)) = (
        credentials(args),
        gga(args),
        positive(args, "--seconds"),
        positive(args, "--stale-after"),
        positive(args, "--link-bps"),
    ) else {
        return usage();
    };
    let Some(mount) = flag(args, "--mount") else {
        return usage();
    };
    let cfg = crate::ntrip::NtripConfig {
        addr: addr.clone(),
        mountpoint: mount,
        credentials: creds,
        gga: g,
    };
    let stream = match crate::ntrip::NtripStream::open(&cfg) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("{addr}: {}", protocol::redact(&e));
            return 1;
        }
    };
    let mcfg = liveness::MonitorConfig {
        stale_after_s: stale.unwrap_or(3.0),
        link_bps: link,
        ..liveness::MonitorConfig::default()
    };
    let card = monitor_stream(stream, mcfg, secs, |a| {
        println!("{}", serde_json::to_string(a).unwrap_or_default());
    });
    print_json(&card);
    eprintln!(
        "{}",
        crate::t!(
            "rtkqa-monitor-summary",
            score = crate::i18n::num(card.score, 1),
            availability = crate::i18n::num(card.availability * 100.0, 1),
            latency = card
                .latency
                .as_ref()
                .map_or("-".to_string(), |l| crate::i18n::num(l.median_ms, 0)),
            completeness = card
                .completeness
                .map_or("-".to_string(), |c| crate::i18n::num(c * 100.0, 1)),
            alarms = card.alarms.len().to_string()
        )
    );
    0
}

fn run_sources(args: &[String]) -> i32 {
    let Some(src) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let near = match flag(args, "--near") {
        None => None,
        Some(v) => {
            let n: Vec<f64> = v.split(',').filter_map(|x| x.trim().parse().ok()).collect();
            match n.as_slice() {
                [a, b, ..] => Some((*a, *b)),
                _ => return usage(),
            }
        }
    };
    let text = if std::path::Path::new(src).is_file() {
        match read_text(src) {
            Ok(t) => t,
            Err(e) => {
                eprintln!("{e}");
                return 1;
            }
        }
    } else {
        let cfg = crate::ntrip::NtripConfig {
            addr: src.clone(),
            mountpoint: String::new(),
            credentials: None,
            gga: None,
        };
        let mut s = match crate::ntrip::NtripStream::open(&cfg) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("{src}: {e}");
                return 1;
            }
        };
        let mut b = Vec::new();
        let _ = s.by_ref().take(8 << 20).read_to_end(&mut b);
        String::from_utf8_lossy(&b).to_string()
    };
    let table = sourcetable::parse(&text);
    let list = match near {
        Some((a, b)) => sourcetable::sorted_by_distance(&table, a, b),
        None => table.mountpoints.clone(),
    };
    print_json(&serde_json::json!({
        "mountpoints": list,
        "casters": table.casters,
        "networks": table.networks,
        "malformed": table.malformed,
        "complete": table.complete,
    }));
    eprintln!(
        "{}",
        crate::t!("rtkqa-sources-summary", n = list.len().to_string())
    );
    0
}

fn load<T: serde::de::DeserializeOwned>(p: &str) -> Result<T, String> {
    let text = read_text(p)?;
    if p.ends_with(".toml") {
        toml::from_str(&text).map_err(|e| format!("{p}: {e}"))
    } else {
        serde_json::from_str(&text).map_err(|e| format!("{p}: {e}"))
    }
}

fn run_base(args: &[String]) -> i32 {
    let (Some(path), Some(refp)) = (
        args.first().filter(|a| !a.starts_with("--")),
        flag(args, "--reference"),
    ) else {
        return usage();
    };
    let epoch = match flag(args, "--epoch").map(|v| v.parse::<f64>()) {
        None => decimal_year_now(),
        Some(Ok(e)) if (1980.0..2200.0).contains(&e) => e,
        Some(_) => return usage(),
    };
    let bytes = match std::fs::read(path) {
        Ok(b) => b,
        Err(e) => {
            eprintln!("{path}: {e}");
            return 1;
        }
    };
    let reference: base_check::Reference = match load(&refp) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("{e}");
            return 1;
        }
    };
    let d = crate::receiver_trust::machines::rtcm3_obs::decode(&bytes);
    if d.stations.is_empty() {
        eprintln!("{path}: {}", crate::terr!("e-rtkqa-no-station"));
        return 1;
    }
    match base_check::check(&d.stations, &reference, epoch) {
        Ok(r) => {
            print_json(&r);
            eprintln!(
                "{}",
                crate::t!(
                    "rtkqa-base-summary",
                    n = r.stations.len().to_string(),
                    ok = r.ok.to_string(),
                    warn = r.warn.to_string(),
                    fail = r.fail.to_string()
                )
            );
            i32::from(r.fail > 0)
        }
        Err(e) => {
            eprintln!("{refp}: {e}");
            1
        }
    }
}

fn run_fix(args: &[String]) -> i32 {
    let Some(path) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let mut cfg = fix_check::FixConfig::default();
    let (Ok(r), Ok(h), Ok(v)) = (
        positive(args, "--radius"),
        positive(args, "--h-tol"),
        positive(args, "--v-tol"),
    ) else {
        return usage();
    };
    cfg.static_radius_m = r.unwrap_or(cfg.static_radius_m);
    cfg.h_tol_m = h.unwrap_or(cfg.h_tol_m);
    cfg.v_tol_m = v.unwrap_or(cfg.v_tol_m);
    let mut controls = Vec::new();
    for c in flags(args, "--control") {
        let p: Vec<&str> = c.split(',').collect();
        let nums: Vec<f64> = p
            .iter()
            .skip(1)
            .filter_map(|x| x.trim().parse().ok())
            .collect();
        if p.len() != 4 || nums.len() != 3 {
            return usage();
        }
        controls.push(fix_check::Control {
            name: p[0].to_string(),
            llh: [nums[0], nums[1], nums[2]],
        });
    }
    let text = match read_text(path) {
        Ok(t) => t,
        Err(e) => {
            eprintln!("{e}");
            return 1;
        }
    };
    let epochs = match fix_check::parse_solutions(&text) {
        Ok(e) => e,
        Err(e) => {
            eprintln!("{path}: {e}");
            return 1;
        }
    };
    let rep = fix_check::check(&epochs, &controls, &cfg);
    print_json(&rep);
    eprintln!(
        "{}",
        crate::t!(
            "rtkqa-fix-summary",
            n = rep.occupations.len().to_string(),
            pass = rep.pass.to_string(),
            warn = rep.warn.to_string(),
            fail = rep.fail.to_string(),
            nofix = rep.no_fix.to_string()
        )
    );
    i32::from(rep.fail > 0)
}

fn run_ppk(args: &[String]) -> i32 {
    let Some(rover) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let parse = |p: &str| -> Result<crate::rinex_obs::RinexObs, String> {
        crate::rinex_obs::parse_obs(&read_text(p)?).map_err(|e| format!("{p}: {e}"))
    };
    let r = match parse(rover) {
        Ok(r) => r,
        Err(e) => {
            eprintln!("{e}");
            return 1;
        }
    };
    let b = match flag(args, "--base").map(|p| parse(&p)).transpose() {
        Ok(b) => b,
        Err(e) => {
            eprintln!("{e}");
            return 1;
        }
    };
    let d = ppk_diag::diagnose(&r, b.as_ref());
    print_json(&d);
    let codes: Vec<&str> = d.causes.iter().map(|c| c.code).collect();
    eprintln!(
        "{}",
        crate::t!(
            "rtkqa-ppk-summary",
            n = codes.len().to_string(),
            causes = codes.join(", ")
        )
    );
    i32::from(d.causes.iter().any(|c| c.severity == "fail"))
}

fn run_probe(args: &[String]) -> i32 {
    let Some(addr) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let (Ok(creds), Ok(g), Ok(secs), Some(mount)) = (
        credentials(args),
        gga(args),
        positive(args, "--seconds"),
        flag(args, "--mount"),
    ) else {
        return usage();
    };
    let rep = protocol::probe(&protocol::ProbeConfig {
        addr: addr.clone(),
        mount,
        credentials: creds,
        gga: g,
        seconds: secs.unwrap_or(3.0),
    });
    print_json(&rep);
    let failed: Vec<&str> = rep
        .checks
        .iter()
        .filter(|c| c.met == Some(false))
        .map(|c| c.id)
        .collect();
    eprintln!(
        "{}",
        crate::t!(
            "rtkqa-probe-summary",
            met = rep.met.to_string(),
            total = rep.applicable.to_string(),
            failed = failed.join(", ")
        )
    );
    i32::from(!failed.is_empty())
}

fn run_caster(args: &[String]) -> i32 {
    let (Some(listen), Some(stream), Some(mount)) = (
        flag(args, "--listen"),
        flag(args, "--stream"),
        flag(args, "--mount"),
    ) else {
        return usage();
    };
    let (Ok(creds), Ok(clients), Ok(pace), Ok(maxc)) = (
        credentials(args),
        positive(args, "--clients"),
        positive(args, "--pace-ms"),
        positive(args, "--max-clients"),
    ) else {
        return usage();
    };
    let bytes = match std::fs::read(&stream) {
        Ok(b) => b,
        Err(e) => {
            eprintln!("{stream}: {e}");
            return 1;
        }
    };
    let mut cfg = protocol::CasterConfig::new(&mount, bytes);
    cfg.credentials = creds;
    cfg.chunk_extensions = args.iter().any(|a| a == "--chunk-ext");
    cfg.pace = Duration::from_millis(pace.unwrap_or(0.0) as u64);
    cfg.max_clients = maxc.map_or(cfg.max_clients, |m| m as usize);
    let listener = match std::net::TcpListener::bind(&listen) {
        Ok(l) => l,
        Err(e) => {
            eprintln!("{listen}: {e}");
            return 1;
        }
    };
    let local = listener
        .local_addr()
        .map(|a| a.to_string())
        .unwrap_or(listen);
    eprintln!(
        "{}",
        crate::t!("rtkqa-caster-listening", addr = local, mount = mount)
    );
    protocol::serve(
        listener,
        std::sync::Arc::new(cfg),
        clients.map(|c| c as usize),
        |r| {
            let (met, total) = r.tally();
            println!("{}", serde_json::to_string(&r).unwrap_or_default());
            eprintln!(
                "{}",
                crate::t!(
                    "rtkqa-caster-client",
                    peer = r.peer.clone(),
                    answer = r.answer,
                    met = met.to_string(),
                    total = total.to_string()
                )
            );
        },
    );
    0
}

fn run_log_check(args: &[String]) -> i32 {
    let Some(path) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let Ok(Some((u, p))) = credentials(args) else {
        return usage();
    };
    let text = match std::fs::read(path) {
        Ok(b) => String::from_utf8_lossy(&b).to_string(),
        Err(e) => {
            eprintln!("{path}: {e}");
            return 1;
        }
    };
    let leaks = protocol::scan_log(&text, &u, &p);
    print_json(&serde_json::json!({ "file": path, "leaks": leaks }));
    eprintln!(
        "{}",
        crate::t!(
            "rtkqa-log-summary",
            n = leaks.len().to_string(),
            file = path.clone()
        )
    );
    i32::from(!leaks.is_empty())
}

fn run_failover(args: &[String]) -> i32 {
    let Some(path) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let spec: protocol::FailoverSpec = match load(path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("{e}");
            return 1;
        }
    };
    match protocol::failover(&spec) {
        Ok(r) => {
            print_json(&r);
            eprintln!(
                "{}",
                crate::t!(
                    "rtkqa-failover-summary",
                    switches = r.switches.len().to_string(),
                    over = crate::i18n::num(r.time_over_max_age_s, 0),
                    max_age = crate::i18n::num(r.max_age_s, 1)
                )
            );
            i32::from(!r.findings.is_empty())
        }
        Err(e) => {
            eprintln!("{path}: {e}");
            1
        }
    }
}

/// `kshana rtk-qa <monitor|sources|base|fix|ppk|probe|caster|log-check|failover> ...`: the exit
/// code (0 clean, 1 a failure found or an error, 2 a usage error).
pub fn run_cli(args: &[String]) -> i32 {
    let rest = args.get(1..).unwrap_or(&[]);
    match args.first().map(String::as_str) {
        Some("monitor") => run_monitor(rest),
        Some("sources") => run_sources(rest),
        Some("base") => run_base(rest),
        Some("fix") => run_fix(rest),
        Some("ppk") => run_ppk(rest),
        Some("probe") => run_probe(rest),
        Some("caster") => run_caster(rest),
        Some("log-check") => run_log_check(rest),
        Some("failover") => run_failover(rest),
        Some("--help") | Some("-h") => {
            println!("{}", crate::terr!("e-rtkqa-usage"));
            0
        }
        _ => usage(),
    }
}
