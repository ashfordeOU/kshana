// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana connect` entries for roadmap 0.42 wave 2 (I4 SDR and simulators, I5 ops and security
//! outputs, I7 industrial control, I8 space operations):
//!
//! ```text
//! kshana connect modbus <host:port> [--unit <id>] [--fc 1|2|3|4] [--start <a>] [--count <n>] [--timeout <s>]
//! kshana connect dnp3 <host:port> [--master <a>] [--outstation <a>] [--timeout <s>]
//! kshana connect opcua <opc.tcp://host:port[/path]> --node <id> [--node <id> ...] [--timeout <s>]
//! kshana connect alert <trust.jsonl|-> --form <servicenow|pagerduty|opsgenie|slack|teams|splunk-hec|elastic|stix>
//!                      [--host <name>] [--epoch-unix <s>] [--all] [--post <http-url>] [--auth-env <VAR>] [--routing-key-env <VAR>]
//! kshana connect snmp-trap <host:port> <trust.jsonl|-> --trap-oid <oid> [--community-env <VAR>] [--all]
//! kshana connect taxii <api-root-url> --collection <id> <trust.jsonl|-> [--host <name>] [--epoch-unix <s>] [--auth-env <VAR>]
//! kshana connect tm <xtce|cosmos|openmct> [--apid <n>] [--name <name>]
//! kshana connect tm-stream <trust.jsonl|-> --to <packets|openmct> [--apid <n>] [--udp <host:port>] [--epoch-unix <s>]
//! kshana connect sim-motion <scenario.toml> [--layout ecef|llh] [--epoch <UTC ISO>]
//! kshana connect sdr-capture --args <soapy args> --freq <Hz> --rate <Hz> --samples <n> --out <base> [--gain <dB>]
//! ```
//!
//! Network reads (`modbus`, `dnp3`, `opcua`) never write to the device. Outputs print to standard
//! output unless a destination is named.

use crate::telemetry::ops;
use crate::telemetry::sample::{parse_live_line, Band, TrustSample};
use std::io::Read;
use std::net::{ToSocketAddrs, UdpSocket};
use std::time::Duration;

const SUBS: [&str; 10] = [
    "modbus",
    "dnp3",
    "opcua",
    "alert",
    "snmp-trap",
    "taxii",
    "tm",
    "tm-stream",
    "sim-motion",
    "sdr-capture",
];

/// The usage text of the `kshana connect` operations subcommands, in the reader's language.
pub fn usage() -> String {
    crate::terr!("e-connect-ops-usage")
}

/// The value after the command-line flag `name` (for example `--host`), or `None` when the flag is absent.
pub fn flag<'a>(args: &'a [String], name: &str) -> Option<&'a str> {
    args.iter()
        .position(|a| a == name)
        .and_then(|i| args.get(i + 1))
        .map(String::as_str)
}

/// The flag `name` parsed as a number, or `d` when the flag is absent; a value that does not parse gives the usage text as the error.
pub fn num<T: std::str::FromStr>(args: &[String], name: &str, d: T) -> Result<T, String> {
    flag(args, name).map_or(Ok(d), |v| v.parse().map_err(|_| usage()))
}

fn env(args: &[String], name: &str) -> Result<Option<String>, String> {
    flag(args, name)
        .map(|var| std::env::var(var).map_err(|_| crate::terr!("e-connect-ops-env", var = var)))
        .transpose()
}

fn secs(args: &[String], d: f64) -> Result<Duration, String> {
    let t: f64 = num(args, "--timeout", d)?;
    (t.is_finite() && t > 0.0)
        .then(|| Duration::from_secs_f64(t))
        .ok_or_else(usage)
}

fn read_text(path: &str) -> Result<String, String> {
    let mut s = String::new();
    if path == "-" {
        std::io::stdin()
            .read_to_string(&mut s)
            .map_err(|e| e.to_string())?;
        return Ok(s);
    }
    std::fs::read_to_string(path).map_err(|e| format!("{path}: {e}"))
}

/// The trust samples of a live-stream JSON Lines file; with `all` false only the band changes
/// after calibration (as CAP alerts are chosen), each with the band before it.
pub fn changes(text: &str, all: bool) -> Result<Vec<(Option<Band>, TrustSample)>, String> {
    let mut out = Vec::new();
    let mut prev: Option<Band> = None;
    for (n, l) in text
        .lines()
        .enumerate()
        .filter(|(_, l)| !l.trim().is_empty())
    {
        let s = parse_live_line(l).map_err(|e| format!("{}: {e}", n + 1))?;
        if all || (s.band != Band::Calibrating && prev != Some(s.band)) {
            out.push((prev, s.clone()));
        }
        if s.band != Band::Calibrating {
            prev = Some(s.band);
        }
    }
    Ok(out)
}

fn epoch(args: &[String]) -> Result<f64, String> {
    let now = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0.0, |d| d.as_secs() as f64);
    num(args, "--epoch-unix", now)
}

fn input(args: &[String], skip: usize) -> Result<&str, String> {
    // The first positional argument after `skip` positionals (flags and their values excluded).
    let mut i = 1;
    let mut seen = 0;
    while i < args.len() {
        if args[i].starts_with("--") && args[i] != "--all" {
            i += 2;
            continue;
        }
        if args[i] != "--all" {
            if seen == skip {
                return Ok(&args[i]);
            }
            seen += 1;
        }
        i += 1;
    }
    Err(usage())
}

fn print_json(v: &serde_json::Value) {
    println!(
        "{}",
        serde_json::to_string_pretty(v).unwrap_or_else(|_| v.to_string())
    );
}

/// Run a subcommand this module owns; `None` when `args` names another one.
pub fn run(args: &[String]) -> Option<Result<(), String>> {
    let sub = args.first()?.as_str();
    SUBS.contains(&sub).then(|| run_inner(sub, args))
}

fn run_inner(sub: &str, args: &[String]) -> Result<(), String> {
    let addr = |s: &str| {
        s.to_socket_addrs()
            .map_err(|e| format!("{s}: {e}"))?
            .next()
            .ok_or_else(usage)
    };
    let host = flag(args, "--host").unwrap_or("kshana").to_string();
    match sub {
        "modbus" => {
            let fc: u8 = num(args, "--fc", 3)?;
            let (start, count): (u16, u16) = (num(args, "--start", 0)?, num(args, "--count", 1)?);
            let a = addr(input(args, 0)?)?;
            let v = crate::industrial::modbus_read(
                a,
                num(args, "--unit", 1)?,
                fc,
                start,
                count,
                secs(args, 2.0)?,
            )?;
            print_json(
                &serde_json::json!({ "target": a.to_string(), "function": fc, "start": start, "values": v }),
            );
        }
        "dnp3" => {
            let a = addr(input(args, 0)?)?;
            let r = crate::industrial::dnp3_read(
                a,
                num(args, "--master", 1)?,
                num(args, "--outstation", 10)?,
                secs(args, 5.0)?,
            )?;
            print_json(&serde_json::json!({ "target": a.to_string(), "read": r }));
        }
        "opcua" => {
            let nodes: Vec<_> = args
                .windows(2)
                .filter(|w| w[0] == "--node")
                .map(|w| crate::opcua::NodeId::parse(&w[1]).ok_or_else(usage))
                .collect::<Result<_, _>>()?;
            if nodes.is_empty() {
                return Err(usage());
            }
            let url = input(args, 0)?;
            let v = crate::opcua::read_values(url, &nodes, secs(args, 5.0)?)?;
            let ids: Vec<&String> = args
                .windows(2)
                .filter(|w| w[0] == "--node")
                .map(|w| &w[1])
                .collect();
            print_json(&serde_json::json!({ "endpoint": url, "nodes": ids, "values": v }));
        }
        "alert" => {
            let form = flag(args, "--form").ok_or_else(usage)?;
            let key = env(args, "--routing-key-env")?.unwrap_or_default();
            let auth = env(args, "--auth-env")?;
            let t0 = epoch(args)?;
            for (prev, s) in changes(
                &read_text(input(args, 0)?)?,
                args.iter().any(|a| a == "--all"),
            )? {
                let body = ops::payload(form, &s, prev, &host, t0 + s.t_s, &key)?;
                match flag(args, "--post") {
                    None => print!("{}{}", body, if form == "elastic" { "" } else { "\n" }),
                    Some(url) => {
                        let ct = if form == "elastic" {
                            "application/x-ndjson"
                        } else {
                            "application/json"
                        };
                        let mut h = vec![("Content-Type", ct.to_string())];
                        if let Some(a) = &auth {
                            h.push(("Authorization", a.clone()));
                        }
                        let (code, _) = ops::http_post(url, &h, body.as_bytes())?;
                        println!("{code}");
                    }
                }
            }
        }
        "snmp-trap" => {
            let a = addr(input(args, 0)?)?;
            let oid = flag(args, "--trap-oid")
                .and_then(crate::snmp::parse_oid)
                .ok_or_else(usage)?;
            let community = env(args, "--community-env")?.unwrap_or_else(|| "public".into());
            let sock = UdpSocket::bind(if a.is_ipv4() { "0.0.0.0:0" } else { "[::]:0" })
                .map_err(|e| e.to_string())?;
            let all = args.iter().any(|x| x == "--all");
            for (i, (_, s)) in changes(&read_text(input(args, 1)?)?, all)?
                .iter()
                .enumerate()
            {
                let pdu = ops::snmp_trap(&community, i as i64 + 1, (s.t_s * 100.0) as u32, &oid, s);
                sock.send_to(&pdu, a).map_err(|e| format!("{a}: {e}"))?;
            }
        }
        "taxii" => {
            let collection = flag(args, "--collection").ok_or_else(usage)?;
            let t0 = epoch(args)?;
            let mut objects = Vec::new();
            for (_, s) in changes(&read_text(input(args, 1)?)?, false)? {
                for o in ops::stix_objects(&s, &host, t0 + s.t_s) {
                    if !objects.contains(&o) {
                        objects.push(o);
                    }
                }
            }
            let (code, status) = ops::taxii_add(
                input(args, 0)?,
                collection,
                &objects,
                env(args, "--auth-env")?,
            )?;
            print_json(
                &serde_json::json!({ "http_status": code, "objects": objects.len(), "status": status }),
            );
        }
        "tm" => {
            let apid: u16 = num(args, "--apid", 100)?;
            let name = flag(args, "--name").unwrap_or("KSHANA");
            match input(args, 0)? {
                "xtce" => print!("{}", crate::tm_bridge::xtce(name, apid)),
                "cosmos" => print!("{}", crate::tm_bridge::cosmos(name, apid)),
                "openmct" => print_json(&crate::tm_bridge::openmct_dictionary(name)),
                _ => return Err(usage()),
            }
        }
        "tm-stream" => {
            let apid: u16 = num(args, "--apid", 100)?;
            let t0 = epoch(args)?;
            let samples = changes(&read_text(input(args, 0)?)?, true)?;
            let udp = flag(args, "--udp").map(addr).transpose()?;
            let sock = udp
                .map(|_| UdpSocket::bind("0.0.0.0:0"))
                .transpose()
                .map_err(|e| e.to_string())?;
            let mut out = std::io::stdout().lock();
            for (i, (_, s)) in samples.iter().enumerate() {
                match flag(args, "--to") {
                    Some("packets") => {
                        let p = crate::tm_bridge::packet(s, apid, i as u16)?;
                        match (&sock, udp) {
                            (Some(k), Some(a)) => k.send_to(&p, a).map(|_| ()),
                            _ => std::io::Write::write_all(&mut out, &p),
                        }
                        .map_err(|e| e.to_string())?;
                    }
                    Some("openmct") => {
                        for d in crate::tm_bridge::openmct_datums(s, t0 + s.t_s) {
                            println!("{d}");
                        }
                    }
                    _ => return Err(usage()),
                }
            }
        }
        "sim-motion" => {
            use crate::interop::testbench::{trajectory_of, write_sim_motion, SimMotionLayout};
            let layout = match flag(args, "--layout").unwrap_or("ecef") {
                "ecef" => SimMotionLayout::Ecef,
                "llh" => SimMotionLayout::Llh,
                _ => return Err(usage()),
            };
            let ep = flag(args, "--epoch")
                .map(crate::interop::UtcEpoch::parse_iso)
                .transpose()?;
            let t = trajectory_of(&read_text(input(args, 0)?)?, ep).map_err(|e| e.to_string())?;
            let (text, cut) = write_sim_motion(&t, layout);
            if cut {
                eprintln!("{}", crate::t!("connect-ops-sim-motion-cut"));
            }
            print!("{text}");
        }
        "sdr-capture" => return sdr_capture(args),
        _ => return Err(usage()),
    }
    Ok(())
}

// With the `soapy` feature on Unix the binary handles `sdr-capture` itself (src/soapy.rs, the one
// place it may call the C library); this library answers only when the feature is off.
fn sdr_capture(_: &[String]) -> Result<(), String> {
    Err(crate::terr!(
        "e-connect-ops-failed",
        proto = "soapysdr",
        why = "feature"
    ))
}
