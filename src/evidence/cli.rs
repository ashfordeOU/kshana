// SPDX-License-Identifier: AGPL-3.0-only
//! Command-line wrapper: `kshana evidence <keygen|verify|attach-timestamp>` and
//! `kshana receiver-trust evidence`. All file-system, clock and exit-code handling lives
//! here; the pack logic is in [`super::bundle`] and [`super::verify`].

use super::bundle::{create_bundle, fingerprint, generate_seed, public_key_hex, sha256_hex};
use super::bundle::{EvidenceInput, Files, Window};
use super::verify::{verify_bundle, Status, VerifyOptions};
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario};
use serde_json::{json, Value};
use std::path::{Path, PathBuf};

const USAGE: &str = "usage:
  kshana evidence keygen --out <keyfile>
  kshana evidence verify <bundle-dir> [--pubkey <hex|file>] [--log <full-log>] [--json]
  kshana evidence attach-timestamp <bundle-dir> <token.tsr>
  kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir>
      [--title <text>] [--timestamp-token <token.tsr>] [--created-utc <rfc3339|none>]
  <t0>/<t1>: seconds since the first epoch of the log, or an ISO-8601 UTC time when the log
  states its start time. A pack is a technical record, not a legal opinion.";

fn flag_value(args: &[String], name: &str) -> Result<Option<String>, String> {
    match args.iter().position(|a| a == name) {
        None => Ok(None),
        Some(i) => args
            .get(i + 1)
            .cloned()
            .map(Some)
            .ok_or_else(|| format!("{name} needs a value")),
    }
}

fn now_rfc3339() -> String {
    let s = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs() as i64)
        .unwrap_or(0);
    crate::telemetry::syslog::rfc3339_utc(s)
}

/// Seconds since 1970 for `YYYY-MM-DDTHH:MM:SS[.f][Z]` (UTC only).
fn parse_rfc3339_utc(s: &str) -> Option<f64> {
    let s = s.trim().strip_suffix('Z').unwrap_or(s.trim());
    let (d, t) = s.split_once('T')?;
    let mut dp = d.split('-');
    let (y, m, day): (i64, i64, i64) = (
        dp.next()?.parse().ok()?,
        dp.next()?.parse().ok()?,
        dp.next()?.parse().ok()?,
    );
    let mut tp = t.split(':');
    let (hh, mm): (f64, f64) = (tp.next()?.parse().ok()?, tp.next()?.parse().ok()?);
    let ss: f64 = tp.next()?.parse().ok()?;
    if dp.next().is_some()
        || tp.next().is_some()
        || !(1..=12).contains(&m)
        || !(1..=31).contains(&day)
    {
        return None;
    }
    // Howard Hinnant's days-from-civil.
    let y = if m <= 2 { y - 1 } else { y };
    let era = y.div_euclid(400);
    let yoe = y.rem_euclid(400);
    let doy = (153 * ((m + 9) % 12) + 2) / 5 + day - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    let days = era * 146_097 + doe - 719_468;
    Some(days as f64 * 86_400.0 + hh * 3600.0 + mm * 60.0 + ss)
}

fn parse_time(arg: &str, start_label: Option<&str>) -> Result<f64, String> {
    if let Ok(x) = arg.parse::<f64>() {
        return if x.is_finite() {
            Ok(x)
        } else {
            Err(format!("`{arg}` is not finite"))
        };
    }
    let t = parse_rfc3339_utc(arg)
        .ok_or_else(|| format!("`{arg}` is neither seconds nor an ISO-8601 UTC time"))?;
    let start = start_label.and_then(parse_rfc3339_utc).ok_or(
        "the log does not state a parseable start time; give seconds since the first epoch",
    )?;
    Ok(t - start)
}

fn write_new_file(path: &Path, bytes: &[u8], private: bool) -> Result<(), String> {
    use std::io::Write;
    let mut o = std::fs::OpenOptions::new();
    o.write(true).create_new(true);
    #[cfg(unix)]
    if private {
        use std::os::unix::fs::OpenOptionsExt;
        o.mode(0o600);
    }
    #[cfg(not(unix))]
    let _ = private;
    let mut f = o
        .open(path)
        .map_err(|e| format!("cannot create {}: {e}", path.display()))?;
    f.write_all(bytes)
        .map_err(|e| format!("cannot write {}: {e}", path.display()))
}

fn read_seed(path: &str) -> Result<[u8; 32], String> {
    #[cfg(unix)]
    {
        use std::os::unix::fs::PermissionsExt;
        if let Ok(md) = std::fs::metadata(path) {
            if md.permissions().mode() & 0o077 != 0 {
                eprintln!("warning: {path} is readable by other users; restrict it (chmod 600)");
            }
        }
    }
    let t = std::fs::read_to_string(path).map_err(|e| format!("cannot read key {path}: {e}"))?;
    let v = hex::decode(t.trim()).map_err(|_| format!("{path} is not a hex key"))?;
    <[u8; 32]>::try_from(v.as_slice())
        .map_err(|_| format!("{path} must hold a 32-byte key as 64 hex digits"))
}

/// Read a pack directory. Anything that is not a regular file is recorded under its name
/// with empty content, so verification reports it as an unlisted file.
pub fn read_dir(dir: &Path) -> Result<Files, String> {
    let mut f = Files::new();
    for e in std::fs::read_dir(dir).map_err(|e| format!("cannot read {}: {e}", dir.display()))? {
        let e = e.map_err(|e| e.to_string())?;
        let name = e.file_name().to_string_lossy().to_string();
        let ty = e.file_type().map_err(|e| e.to_string())?;
        let bytes = if ty.is_file() {
            std::fs::read(e.path()).map_err(|e| format!("cannot read {name}: {e}"))?
        } else {
            Vec::new()
        };
        f.insert(name, bytes);
    }
    Ok(f)
}

fn write_dir(dir: &Path, files: &Files) -> Result<(), String> {
    if dir.exists()
        && std::fs::read_dir(dir)
            .map_err(|e| e.to_string())?
            .next()
            .is_some()
    {
        return Err(format!("{} exists and is not empty", dir.display()));
    }
    std::fs::create_dir_all(dir).map_err(|e| format!("cannot create {}: {e}", dir.display()))?;
    for (n, b) in files {
        write_new_file(&dir.join(n), b, false)?;
    }
    Ok(())
}

/// `kshana evidence ...`; returns the exit code.
pub fn run_evidence(args: &[String]) -> i32 {
    match run_evidence_inner(args) {
        Ok(code) => code,
        Err(e) => {
            if !e.is_empty() {
                eprintln!("error: {e}");
            }
            eprintln!("{USAGE}");
            2
        }
    }
}

fn run_evidence_inner(args: &[String]) -> Result<i32, String> {
    match args.first().map(String::as_str) {
        Some("keygen") => {
            let out = flag_value(args, "--out")?.ok_or("keygen needs --out <keyfile>")?;
            let seed = generate_seed();
            write_new_file(
                Path::new(&out),
                format!("{}\n", hex::encode(seed)).as_bytes(),
                true,
            )?;
            let pk = public_key_hex(&seed);
            write_new_file(
                Path::new(&format!("{out}.pub")),
                format!("{pk}\n").as_bytes(),
                false,
            )?;
            println!("private key: {out}  (keep it secret; never commit it)");
            println!("public key:  {out}.pub");
            println!(
                "fingerprint: {}",
                fingerprint(&hex::decode(&pk).unwrap_or_default())
            );
            Ok(0)
        }
        Some("verify") => {
            let dir = args
                .get(1)
                .filter(|a| !a.starts_with("--"))
                .ok_or("verify needs a bundle directory")?;
            let files = read_dir(Path::new(dir))?;
            let pin = match flag_value(args, "--pubkey")? {
                None => None,
                Some(v) => {
                    let text = std::fs::read_to_string(&v).unwrap_or(v);
                    let b =
                        hex::decode(text.trim()).map_err(|_| "--pubkey is not hex".to_string())?;
                    Some(
                        <[u8; 32]>::try_from(b.as_slice())
                            .map_err(|_| "--pubkey must be 32 bytes (64 hex digits)".to_string())?,
                    )
                }
            };
            let full = match flag_value(args, "--log")? {
                None => None,
                Some(p) => Some(std::fs::read(&p).map_err(|e| format!("cannot read {p}: {e}"))?),
            };
            let rep = verify_bundle(
                &files,
                &VerifyOptions {
                    expected_public_key: pin,
                    full_log: full.as_deref(),
                },
            );
            if args.iter().any(|a| a == "--json") {
                println!(
                    "{}",
                    serde_json::to_string_pretty(&rep).map_err(|e| e.to_string())?
                );
            } else {
                for c in &rep.checks {
                    let tag = match c.status {
                        Status::Pass => "PASS",
                        Status::Fail => "FAIL",
                        Status::Skipped => "skip",
                    };
                    println!("{tag}  {:<18} {}", c.name, c.detail);
                    if c.name == "timestamp" && rep.timestamp.is_some() {
                        println!("      timestamp authority signature not verified by Kshana");
                    }
                }
                for f in &rep.failures {
                    println!(
                        "  failure: {}",
                        serde_json::to_string(f).unwrap_or_default()
                    );
                }
                for n in &rep.notes {
                    println!("  note: {n}");
                }
                println!(
                    "{}",
                    if rep.ok {
                        "VERIFIED: every hash, the chain and the signature check out."
                    } else {
                        "NOT VERIFIED: see the failures above."
                    }
                );
                println!("This is a technical record, not a legal opinion.");
            }
            Ok(i32::from(!rep.ok))
        }
        Some("attach-timestamp") => {
            let dir = args
                .get(1)
                .ok_or("attach-timestamp needs a bundle directory")?;
            let tok = args.get(2).ok_or("attach-timestamp needs a token file")?;
            let bytes = std::fs::read(tok).map_err(|e| format!("cannot read {tok}: {e}"))?;
            let mut files = read_dir(Path::new(dir))?;
            files.insert("timestamp.tsr".into(), bytes.clone());
            let rep = verify_bundle(&files, &VerifyOptions::default());
            if !rep.ok {
                return Err(format!(
                    "not attached: the pack with this token does not verify ({})",
                    serde_json::to_string(&rep.failures).unwrap_or_default()
                ));
            }
            let target = Path::new(dir).join("timestamp.tsr");
            std::fs::write(&target, bytes)
                .map_err(|e| format!("cannot write {}: {e}", target.display()))?;
            println!("attached {}", target.display());
            for n in &rep.notes {
                println!("note: {n}");
            }
            Ok(0)
        }
        _ => Err(String::new()),
    }
}

/// Make a source description safe to publish: no directory names, no inline payloads.
fn sanitise_source(v: &mut Value) {
    if let Some(o) = v.as_object_mut() {
        if let Some(p) = o.get("path").and_then(Value::as_str).map(str::to_string) {
            o.insert(
                "path".into(),
                json!(p.rsplit(['/', '\\']).next().unwrap_or_default()),
            );
        }
        for k in ["text", "base64"] {
            if let Some(s) = o.get(k).and_then(Value::as_str).map(str::len) {
                o.insert(k.into(), json!(format!("<inline, {s} bytes>")));
            }
        }
    }
}

/// `kshana receiver-trust evidence ...`; `args` are those after `evidence`.
pub fn run_receiver_trust_evidence(args: &[String]) -> i32 {
    match receiver_trust_evidence(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("error: {e}");
            eprintln!("{USAGE}");
            2
        }
    }
}

fn receiver_trust_evidence(args: &[String]) -> Result<(), String> {
    let scn_path = PathBuf::from(
        args.first()
            .filter(|a| !a.starts_with("--"))
            .ok_or("needs a scenario path")?,
    );
    let from = flag_value(args, "--from")?.ok_or("needs --from")?;
    let to = flag_value(args, "--to")?.ok_or("needs --to")?;
    let key = flag_value(args, "--key")?
        .ok_or("needs --key <keyfile> (make one with `kshana evidence keygen`)")?;
    let out = flag_value(args, "--out")?.ok_or("needs --out <dir>")?;
    let seed = read_seed(&key)?;
    let token = match flag_value(args, "--timestamp-token")? {
        None => None,
        Some(p) => Some(std::fs::read(&p).map_err(|e| format!("cannot read {p}: {e}"))?),
    };

    let src = std::fs::read_to_string(&scn_path)
        .map_err(|e| format!("cannot read {}: {e}", scn_path.display()))?;
    let mut scn: ReceiverTrustScenario =
        toml::from_str(&src).map_err(|e| format!("invalid receiver-trust scenario: {e}"))?;
    scenario::resolve_paths(&mut scn, scn_path.parent().unwrap_or(Path::new("")));
    let log_bytes = scenario::load_source(&scn.log.source, "log")?;
    let result = scenario::run_receiver_trust(&scn)?;
    if result.log.sha256 != sha256_hex(&log_bytes) {
        return Err("the log changed while it was being assessed".into());
    }

    let t0 = parse_time(&from, result.log.start_label.as_deref())?;
    let t1 = parse_time(&to, result.log.start_label.as_deref())?;
    let epochs: Vec<Value> = result
        .epochs
        .iter()
        .filter(|e| e.t_s >= t0 && e.t_s <= t1)
        .map(|e| serde_json::to_value(e).map_err(|e| e.to_string()))
        .collect::<Result<_, _>>()?;
    if epochs.is_empty() {
        return Err(format!(
            "no epoch of the log falls between {t0} s and {t1} s (the log spans 0 to {} s)",
            result.log.duration_s
        ));
    }

    let file_name = scn
        .log
        .source
        .path
        .clone()
        .unwrap_or_else(|| "inline".into());
    let mut scn_v = serde_json::to_value(&scn).map_err(|e| e.to_string())?;
    if let Some(log) = scn_v.get_mut("log") {
        sanitise_source(log);
        if let Some(nav) = log.get_mut("nav") {
            sanitise_source(nav);
        }
    }
    let config = json!({
        "scenario": scn_v,
        "scenario_hash": result.scenario_hash,
        "monitors_run": result.monitors_run,
        "baseline": result.baseline,
        "honesty_label": scenario::LABEL,
    });
    let created = match flag_value(args, "--created-utc")?.as_deref() {
        Some("none") => None,
        Some(v) => Some(v.to_string()),
        None => Some(now_rfc3339()),
    };
    let title = flag_value(args, "--title")?.unwrap_or_else(|| "GNSS trust evidence pack".into());
    // The window's bytes, where every epoch in it reports its source span; otherwise the
    // whole log is bundled and the manifest says so.
    let slice = crate::receiver_trust::ingest::read_log(scn.log.format, &log_bytes)
        .ok()
        .and_then(|tl| {
            super::bundle::slice_for_window(
                tl.epochs.iter().map(|e| (e.t_s, e.source_span)),
                t0,
                t1,
            )
        });
    let log_format = serde_json::to_value(result.log.format)
        .map_err(|e| e.to_string())?
        .as_str()
        .unwrap_or("unknown")
        .to_string();
    let input = EvidenceInput {
        title: &title,
        engine_version: env!("CARGO_PKG_VERSION"),
        log_format: &log_format,
        log_file_name: &file_name,
        log_bytes: &log_bytes,
        start_label: result.log.start_label.as_deref(),
        slice,
        window: Window {
            from_s: t0,
            to_s: t1,
        },
        config,
        epochs,
        created_utc: created.as_deref(),
    };
    let files = create_bundle(&input, &seed, token.as_deref()).map_err(|e| e.to_string())?;
    write_dir(Path::new(&out), &files)?;
    let manifest = files
        .get("manifest.json")
        .map(|b| sha256_hex(b))
        .unwrap_or_default();
    println!("evidence pack written to {out}");
    println!(
        "  epochs in window: {}  ({t0} s to {t1} s)",
        input.epochs.len()
    );
    println!(
        "  signer fingerprint: {}",
        fingerprint(&hex::decode(public_key_hex(&seed)).unwrap_or_default())
    );
    println!("  SHA-256 of manifest.json (what an RFC 3161 authority should stamp): {manifest}");
    match slice {
        Some((a, b)) => println!("  log slice: bytes {a} to {b} of {}", log_bytes.len()),
        None => println!("  log slice: whole log (this log gives no byte range for the window)"),
    }
    println!("verify with: kshana evidence verify {out} --pubkey <signer public key>");
    println!("A pack is a technical record, not a legal opinion.");
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rfc3339_parsing() {
        assert_eq!(parse_rfc3339_utc("1970-01-01T00:00:00Z"), Some(0.0));
        assert_eq!(
            parse_rfc3339_utc("2000-02-29T00:00:00Z"),
            Some(951_782_400.0)
        );
        assert_eq!(
            parse_rfc3339_utc("2025-12-31T23:59:59.5Z"),
            Some(1_767_225_599.5)
        );
        assert_eq!(
            parse_rfc3339_utc("hh:mm:ss.mmm UTC (date not in log)"),
            None
        );
        assert_eq!(parse_rfc3339_utc("2025-13-01T00:00:00Z"), None);
    }

    #[test]
    fn time_arguments() {
        assert_eq!(parse_time("120", None), Ok(120.0));
        assert_eq!(
            parse_time("2026-01-01T00:02:00Z", Some("2026-01-01T00:00:00Z")),
            Ok(120.0)
        );
        assert!(parse_time("2026-01-01T00:02:00Z", None).is_err());
        assert!(parse_time("soon", None).is_err());
    }
}
