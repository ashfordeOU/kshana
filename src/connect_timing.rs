// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana connect` entries for timing systems and receiver streams that do not map to
//! `kshana.obs/1` (roadmap 0.42 I2 and I3; docs/TIMING-SYSTEMS.md, docs/RECEIVER-PROTOCOLS.md):
//!
//! ```text
//! kshana connect timing <pmc|ptp-mgmt|chrony-tracking|chrony-sources|ntpq-peers|ntpq-rv> <file|->
//! kshana connect snmp <host:port> [--map generic|meinberg-ltng|<map.toml>] [--community-env <VAR>]
//!                     [--timeout <s>] [--retries <n>] [--max-rows <n>]
//! kshana connect ntp <host:port> [--assoc <id>] [--timeout <s>]
//! kshana connect timing check <dir> [--bless]
//! kshana connect decode rtcm3 <file|->
//! ```
//!
//! Each prints one JSON document. Every network command only reads: SNMP GET and GETNEXT, NTP mode
//! 6 read variables. None of them configures a device.

use serde_json::json;
use std::io::Read;
use std::net::ToSocketAddrs;
use std::time::Duration;

fn usage() -> String {
    crate::terr!("e-connect-timing-usage")
}

fn read_input(path: &str) -> Result<Vec<u8>, String> {
    if path == "-" {
        let mut b = Vec::new();
        std::io::stdin()
            .read_to_end(&mut b)
            .map_err(|e| e.to_string())?;
        Ok(b)
    } else {
        std::fs::read(path).map_err(|e| format!("{path}: {e}"))
    }
}

fn flag<'a>(args: &'a [String], name: &str) -> Option<&'a str> {
    args.iter()
        .position(|a| a == name)
        .and_then(|i| args.get(i + 1))
        .map(String::as_str)
}

fn num<T: std::str::FromStr>(args: &[String], name: &str, d: T) -> Result<T, String> {
    match flag(args, name) {
        None => Ok(d),
        Some(v) => v.parse().map_err(|_| usage()),
    }
}

fn addr(s: &str) -> Result<std::net::SocketAddr, String> {
    s.to_socket_addrs()
        .map_err(|e| format!("{s}: {e}"))?
        .next()
        .ok_or_else(usage)
}

/// Parse one timing text or binary input to JSON (the `timing` subcommand, also used by tests).
pub fn parse_timing(kind: &str, input: &[u8]) -> Result<serde_json::Value, String> {
    let text = || String::from_utf8_lossy(input).into_owned();
    let v = match kind {
        "pmc" => {
            let blocks = crate::ptp_mgmt::parse_pmc(&text());
            let status = crate::ptp_mgmt::status(&blocks);
            json!({ "kind": kind, "status": status, "blocks": blocks })
        }
        "ptp-mgmt" => {
            let m = crate::ptp_mgmt::decode(input)?;
            json!({ "kind": kind, "message": m })
        }
        "chrony-tracking" => {
            let t = crate::time_server::parse_chrony_tracking(&text())?;
            let h = crate::time_server::health_chrony(&t, None);
            json!({ "kind": kind, "health": h, "tracking": t })
        }
        "chrony-sources" => {
            let s = crate::time_server::parse_chrony_sources(&text())?;
            json!({ "kind": kind, "sources": s })
        }
        "ntpq-peers" => {
            let p = crate::time_server::parse_ntpq_peers(&text())?;
            json!({ "kind": kind, "peers": p })
        }
        "ntpq-rv" => {
            let v = crate::time_server::parse_varlist(&text());
            let h = crate::time_server::health_ntpd(&v, None);
            json!({ "kind": kind, "health": h, "variables": v })
        }
        "snmp-message" => {
            let m = crate::snmp::decode_message(input)
                .ok_or_else(|| crate::terr!("e-snmp-failed", why = "decode"))?;
            let vbs: Vec<serde_json::Value> = m
                .varbinds
                .iter()
                .map(|(o, v)| json!({ "oid": crate::snmp::oid_str(o), "value": v.to_json() }))
                .collect();
            json!({
                "kind": kind,
                "version": m.version,
                "community": String::from_utf8_lossy(&m.community),
                "pdu_type": m.pdu_type,
                "request_id": m.request_id,
                "error_status": m.error_status,
                "error_index": m.error_index,
                "varbinds": vbs,
            })
        }
        "ntp-mode6" => {
            let c = crate::time_server::decode_control(input)
                .ok_or_else(|| crate::terr!("e-ntp-mode6", why = "decode"))?;
            let vars = crate::time_server::parse_varlist(&String::from_utf8_lossy(&c.data));
            let h = crate::time_server::health_ntpd(&vars, None);
            json!({
                "kind": kind,
                "opcode": c.opcode,
                "response": c.response,
                "more": c.more,
                "sequence": c.sequence,
                "system_status": crate::time_server::system_status(c.status),
                "variables": vars,
                "health": h,
            })
        }
        "rtcm3-decode" => {
            let d = crate::receiver_trust::machines::rtcm3_obs::decode(input);
            json!({ "kind": kind, "decoded": d })
        }
        _ => return Err(usage()),
    };
    Ok(v)
}

/// A timing conformance vector (`conformance/timing/<name>/vector.toml`).
#[derive(Clone, Debug, serde::Deserialize)]
#[serde(deny_unknown_fields)]
pub struct TimingVector {
    /// A short name.
    pub name: String,
    /// The parser (`kshana connect timing <parser>`).
    pub parser: String,
    /// The input file, relative to the vector.
    pub input: String,
    /// The expected JSON, relative to the vector.
    pub expected: String,
}

/// Run one timing vector: the vector, where its expected output lives, and the output now (pretty
/// JSON with a final newline).
pub fn run_timing_vector(
    path: &std::path::Path,
) -> Result<(TimingVector, std::path::PathBuf, String), String> {
    let dir = path.parent().unwrap_or(std::path::Path::new("."));
    let text = std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
    let v: TimingVector = toml::from_str(&text).map_err(|e| format!("{}: {e}", path.display()))?;
    let input = std::fs::read(dir.join(&v.input)).map_err(|e| format!("{}: {e}", v.input))?;
    let out = parse_timing(&v.parser, &input)?;
    let produced = serde_json::to_string_pretty(&out).map_err(|e| e.to_string())? + "\n";
    let expected = dir.join(&v.expected);
    Ok((v, expected, produced))
}

fn print(v: &serde_json::Value) {
    println!(
        "{}",
        serde_json::to_string_pretty(v).unwrap_or_else(|_| v.to_string())
    );
}

/// Run a `kshana connect` subcommand this module owns; `None` when `args` names another one.
pub fn run(args: &[String]) -> Option<Result<(), String>> {
    let sub = args.first()?.as_str();
    if !matches!(sub, "timing" | "snmp" | "ntp" | "decode") {
        return None;
    }
    Some(run_inner(sub, args))
}

fn run_inner(sub: &str, args: &[String]) -> Result<(), String> {
    match sub {
        "timing" if args.get(1).map(String::as_str) == Some("check") => {
            let dir = args.get(2).ok_or_else(usage)?;
            let bless = args.iter().any(|a| a == "--bless");
            let vectors = crate::connect::find_vectors(std::path::Path::new(dir));
            if vectors.is_empty() {
                return Err(crate::terr!("e-connect-no-vectors"));
            }
            let mut failed = 0usize;
            for p in &vectors {
                match run_timing_vector(p) {
                    Err(e) => {
                        failed += 1;
                        println!(
                            "{}",
                            crate::t!("connect-check-error", path = p.display().to_string(), e = e)
                        );
                    }
                    Ok((v, expected, produced)) => {
                        if bless {
                            std::fs::write(&expected, &produced).map_err(|e| e.to_string())?;
                            println!("{}", crate::t!("connect-check-blessed", name = v.name));
                        } else if std::fs::read_to_string(&expected).unwrap_or_default() == produced
                        {
                            println!("{}", crate::t!("connect-check-pass", name = v.name));
                        } else {
                            failed += 1;
                            let want = std::fs::read_to_string(&expected).unwrap_or_default();
                            let line =
                                crate::connect::first_difference(&want, &produced).unwrap_or(0);
                            println!(
                                "{}",
                                crate::t!(
                                    "connect-check-fail",
                                    name = v.name,
                                    line = line.to_string()
                                )
                            );
                        }
                    }
                }
            }
            println!(
                "{}",
                crate::t!(
                    "connect-check-summary",
                    passed = (vectors.len() - failed).to_string(),
                    total = vectors.len().to_string()
                )
            );
            if failed > 0 {
                return Err(crate::terr!("e-connect-timing-failed", n = failed));
            }
        }
        "timing" => {
            let (Some(kind), Some(path)) = (args.get(1), args.get(2)) else {
                return Err(usage());
            };
            print(&parse_timing(kind, &read_input(path)?)?);
        }
        "decode" => {
            let (Some(kind), Some(path)) = (args.get(1), args.get(2)) else {
                return Err(usage());
            };
            if kind != "rtcm3" {
                return Err(usage());
            }
            let d = crate::receiver_trust::machines::rtcm3_obs::decode(&read_input(path)?);
            print(&serde_json::to_value(&d).map_err(|e| e.to_string())?);
        }
        "snmp" => {
            let target = addr(args.get(1).ok_or_else(usage)?)?;
            let map_name = flag(args, "--map").unwrap_or("generic");
            let map_text = match crate::snmp::builtin_map_text(map_name) {
                Some(t) => t.to_string(),
                None => {
                    std::fs::read_to_string(map_name).map_err(|e| format!("{map_name}: {e}"))?
                }
            };
            let map = crate::snmp::parse_map(&map_text)?;
            let community = match flag(args, "--community-env") {
                Some(var) => std::env::var(var)
                    .map_err(|_| crate::terr!("e-snmp-community-env", var = var))?,
                None => "public".to_string(),
            };
            let timeout: f64 = num(args, "--timeout", 2.0)?;
            if !(timeout.is_finite() && timeout > 0.0) {
                return Err(usage());
            }
            let mut c = crate::snmp::Client::new(
                target,
                &community,
                Duration::from_secs_f64(timeout),
                num(args, "--retries", 1)?,
            )?;
            let r = crate::snmp::poll(&mut c, &map, num(args, "--max-rows", 256)?)?;
            print(&json!({ "target": target.to_string(), "poll": r }));
        }
        "ntp" => {
            let target = addr(args.get(1).ok_or_else(usage)?)?;
            let timeout: f64 = num(args, "--timeout", 2.0)?;
            if !(timeout.is_finite() && timeout > 0.0) {
                return Err(usage());
            }
            let assoc: u16 = num(args, "--assoc", 0)?;
            let r = crate::time_server::query_readvars(
                target,
                assoc,
                Duration::from_secs_f64(timeout),
            )?;
            let h = (assoc == 0).then(|| crate::time_server::health_ntpd(&r.variables, None));
            print(&json!({ "target": target.to_string(), "health": h, "read": r }));
        }
        _ => return Err(usage()),
    }
    Ok(())
}
