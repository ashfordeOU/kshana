// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana connect decode` and `kshana connect mavlink-udp` (docs/TRACKS.md).
//!
//! ```text
//! kshana connect decode <input> --format <ais|canboat|asterix|beast|avr|opensky-json|opensky-csv|mavlink|mavlink-tlog|ulog>
//!        [--to jsonl|geojson|kml|czml|adsb-csv|ais-csv] [--day YYYY-MM-DD] [--start <unix s>]
//!        [--radar <lat>,<lon>,<height m>] [--out <file>]
//! kshana connect mavlink-udp <host:port> [--seconds <s>] [--max-messages <n>] [--out <file.jsonl>]
//! ```

use std::io::Write;

use super::{decode, export, to_adsb_csv, to_ais_csv, to_jsonl, Decoded, Options};

/// The output forms of `decode`.
pub const OUTPUTS: [&str; 6] = ["jsonl", "geojson", "kml", "czml", "adsb-csv", "ais-csv"];

fn flag(args: &[String], name: &str) -> Option<String> {
    args.iter()
        .position(|a| a == name)
        .and_then(|i| args.get(i + 1))
        .cloned()
}

/// The decode options named on a command line (`--day`, `--start`, `--radar`).
pub fn options_of(args: &[String]) -> Result<Options, String> {
    let pairs: Vec<(String, String)> = ["day", "start", "radar"]
        .iter()
        .filter_map(|k| Some((k.to_string(), flag(args, &format!("--{k}"))?)))
        .collect();
    Options::parse(&pairs)
}

/// Render a decode in one of [`OUTPUTS`].
pub fn render(d: &Decoded, format: &str, to: &str) -> Result<String, String> {
    Ok(match to {
        "jsonl" => to_jsonl(d, format),
        "adsb-csv" => to_adsb_csv(d),
        "ais-csv" => to_ais_csv(d),
        other => export::export(&d.fixes, other).ok_or_else(|| {
            crate::terr!(
                "e-interconnect-output",
                to = other,
                known = OUTPUTS.join(", ")
            )
        })?,
    })
}

/// `kshana connect decode`: the text to write, and the decode (for the summary on standard error).
pub fn run_decode(args: &[String]) -> Result<(String, Decoded), String> {
    let (Some(input), Some(format)) = (
        args.first().filter(|a| !a.starts_with("--")),
        flag(args, "--format"),
    ) else {
        return Err(crate::terr!("e-interconnect-decode-usage"));
    };
    let to = flag(args, "--to").unwrap_or_else(|| "jsonl".into());
    let opt = options_of(args)?;
    let bytes = std::fs::read(input).map_err(|e| format!("{input}: {e}"))?;
    let d = decode(&format, &bytes, &opt)?;
    Ok((render(&d, &format, &to)?, d))
}

/// `kshana connect mavlink-udp`: bind, listen read only, write each fix as a JSON line to `out`.
pub fn run_mavlink_udp(args: &[String], out: &mut dyn Write) -> Result<Decoded, String> {
    let Some(addr) = args.first().filter(|a| !a.starts_with("--")) else {
        return Err(crate::terr!("e-interconnect-decode-usage"));
    };
    let seconds: f64 = flag(args, "--seconds")
        .map(|s| {
            s.parse()
                .map_err(|_| crate::terr!("e-interconnect-option", key = "seconds", value = s))
        })
        .transpose()?
        .unwrap_or(10.0);
    let max: Option<usize> = flag(args, "--max-messages")
        .map(|s| {
            s.parse()
                .map_err(|_| crate::terr!("e-interconnect-option", key = "max-messages", value = s))
        })
        .transpose()?;
    let sock = std::net::UdpSocket::bind(addr.as_str()).map_err(|e| format!("{addr}: {e}"))?;
    sock.set_read_timeout(Some(std::time::Duration::from_secs_f64(seconds.max(0.001))))
        .map_err(|e| format!("{addr}: {e}"))?;
    eprintln!(
        "{}",
        crate::t!("interconnect-listening", addr = addr.as_str())
    );
    let mut failed = None;
    let d = super::mavlink::listen(&sock, max, |f| {
        let mut v = serde_json::to_value(f).unwrap_or_default();
        v["kind"] = "fix".into();
        if let Err(e) = writeln!(out, "{v}") {
            failed.get_or_insert(e.to_string());
        }
    })
    .map_err(|e| format!("{addr}: {e}"))?;
    match failed {
        Some(e) => Err(e),
        None => Ok(d),
    }
}

/// True when `e` is the usage message (the command line exits 2 for it).
pub fn is_usage(e: &str) -> bool {
    crate::i18n::code_of(e).as_deref() == Some("E-INTERCONNECT-DECODE-USAGE")
}

/// The one-line summary of a decode, for standard error.
pub fn summary(d: &Decoded) -> String {
    crate::t!(
        "interconnect-summary",
        read = d.read,
        fixes = d.fixes.len(),
        records = d.records.len(),
        bad = d.bad_checksum,
        malformed = d.malformed,
        other = d.other
    )
}

/// The output of a Connect conformance vector that names a track decoder (`decode = "<format>"`), with
/// its `options` (`day`, `start`, `radar`, and `to`, the output form, default `jsonl`).
pub fn vector_output(
    format: &str,
    input: &[u8],
    options: &std::collections::BTreeMap<String, String>,
) -> Result<String, String> {
    let pairs: Vec<(String, String)> = options
        .iter()
        .filter(|(k, _)| k.as_str() != "to")
        .map(|(k, v)| (k.clone(), v.clone()))
        .collect();
    let opt = Options::parse(&pairs)?;
    let d = decode(format, input, &opt)?;
    render(
        &d,
        format,
        options.get("to").map(String::as_str).unwrap_or("jsonl"),
    )
}
