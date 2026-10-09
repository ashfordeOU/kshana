// SPDX-License-Identifier: AGPL-3.0-only
//! Command-line wrapper: `kshana evidence <keygen|verify|attach-timestamp>` and
//! `kshana receiver-trust evidence`. All file-system, clock and exit-code handling lives
//! here; the pack logic is in [`super::bundle`] and [`super::verify`].

use super::assemble::{build_receiver_trust_pack, PackRequest};
use super::bundle::{fingerprint, generate_seed, public_key_hex, Files};
use super::verify::{verify_bundle, Status, VerifyOptions};
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario};
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
    let created = match flag_value(args, "--created-utc")?.as_deref() {
        Some("none") => None,
        Some(v) => Some(v.to_string()),
        None => Some(now_rfc3339()),
    };
    let title = flag_value(args, "--title")?.unwrap_or_else(|| "GNSS trust evidence pack".into());

    let src = std::fs::read_to_string(&scn_path)
        .map_err(|e| format!("cannot read {}: {e}", scn_path.display()))?;
    let mut scn: ReceiverTrustScenario =
        toml::from_str(&src).map_err(|e| format!("invalid receiver-trust scenario: {e}"))?;
    scenario::resolve_paths(&mut scn, scn_path.parent().unwrap_or(Path::new("")));
    let log_bytes = scenario::load_source(&scn.log.source, "log")?;
    let nav_bytes = match &scn.log.nav {
        Some(n) => Some(scenario::load_source(n, "log.nav")?),
        None => None,
    };
    let file_name = scn
        .log
        .source
        .path
        .clone()
        .unwrap_or_else(|| "inline".into());
    let pack = build_receiver_trust_pack(
        &PackRequest {
            scenario: &scn,
            log_bytes: &log_bytes,
            nav_bytes: nav_bytes.as_deref(),
            log_file_name: &file_name,
            from: &from,
            to: &to,
            title: &title,
            created_utc: created.as_deref(),
        },
        &seed,
        token.as_deref(),
    )?;
    write_dir(Path::new(&out), &pack.files)?;
    println!("evidence pack written to {out}");
    println!(
        "  epochs in window: {}  ({} s to {} s)",
        pack.epochs_in_window, pack.window.from_s, pack.window.to_s
    );
    println!("  signer fingerprint: {}", pack.signer_fingerprint);
    println!(
        "  SHA-256 of manifest.json (what an RFC 3161 authority should stamp): {}",
        pack.manifest_sha256
    );
    match pack.slice {
        Some((a, b)) => println!("  log slice: bytes {a} to {b} of {}", log_bytes.len()),
        None => println!("  log slice: whole log (this log gives no byte range for the window)"),
    }
    println!("verify with: kshana evidence verify {out} --pubkey <signer public key>");
    println!("A pack is a technical record, not a legal opinion.");
    Ok(())
}
