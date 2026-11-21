// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana feed watch`: a long-running feeder that packs a station's closed observation files
//! into signed `kshana.feed/1` bundles on an interval, keeps them in a resumable spool and sends
//! them with retry and backoff.
//!
//! The spool directory holds `state.json` (`kshana.feed-spool/1`: the SHA-256 of every file
//! already packed, the queue of bundles to send and when each is next tried), `pending/` (bundles
//! not yet accepted), `sent/` (bundles a collector accepted with a 2xx status) and `rejected/`
//! (bundles refused with a 4xx status other than 408 and 429, which are not retried). A bundle
//! file is written before the state that names it, and the state is replaced by a rename, so a
//! feeder stopped at any point resumes without packing a file twice or losing a bundle.
//!
//! Each cycle: the closed files of the inputs (as `kshana feed pack` reads them: the newest file
//! of each directory is left out unless `--include-open`) that are not yet packed are packed, one
//! bundle per station; then every queued bundle whose retry time has come is sent. A failed send
//! (no connection, or a 5xx, 408 or 429 status) is retried after 30 s, doubling to at most the
//! cycle interval. Without `--url` the feeder only packs, for an operator who carries the spool
//! elsewhere. Plain HTTP only, as `kshana feed send`: the engine has no TLS client.

use crate::feeder::{self, Privacy};
use serde::{Deserialize, Serialize};
use std::collections::{BTreeMap, BTreeSet};
use std::path::{Path, PathBuf};

/// The spool state's schema tag.
pub const SPOOL_SCHEMA: &str = "kshana.feed-spool/1";
/// First retry delay, seconds.
pub const FIRST_RETRY_S: u64 = 30;

/// A queued bundle.
#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct Queued {
    /// File name under `pending/`.
    pub file: String,
    /// Failed send attempts so far.
    pub attempts: u32,
    /// Earliest time of the next attempt, Unix seconds.
    pub next_try_s: u64,
}

/// `state.json`.
#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct Spool {
    pub schema: String,
    /// SHA-256 (hex) of every observation file already packed.
    pub packed: BTreeSet<String>,
    /// Bundles to send, oldest first.
    pub queue: Vec<Queued>,
    /// Next bundle number.
    pub next_seq: u64,
}

impl Default for Spool {
    fn default() -> Self {
        Self {
            schema: SPOOL_SCHEMA.to_string(),
            packed: BTreeSet::new(),
            queue: Vec::new(),
            next_seq: 1,
        }
    }
}

/// What a feeder watches and where it sends.
#[derive(Clone, Debug)]
pub struct WatchCfg {
    pub inputs: Vec<PathBuf>,
    pub seed: [u8; 32],
    pub privacy: Privacy,
    pub grid_deg: f64,
    pub include_open: bool,
    pub spool: PathBuf,
    pub url: Option<String>,
    pub token: Option<String>,
    /// Cycle interval, seconds: also the longest retry delay.
    pub interval_s: u64,
}

/// One cycle's outcome.
#[derive(Clone, Debug, Default, PartialEq, Eq, Serialize)]
pub struct Cycle {
    /// Observation files packed in this cycle.
    pub files_packed: usize,
    /// Bundles written in this cycle.
    pub bundles_packed: usize,
    /// Bundles a collector accepted in this cycle.
    pub sent: usize,
    /// Bundles refused for good in this cycle (moved to `rejected/`).
    pub rejected: usize,
    /// Send attempts that failed and will be retried.
    pub failed_attempts: usize,
    /// Bundles still queued after the cycle.
    pub pending: usize,
    /// The earliest retry time among them, Unix seconds.
    pub next_retry_s: Option<u64>,
}

/// The delay before attempt `attempts + 1`: 30 s doubling, at most `cap_s`.
pub fn backoff_s(attempts: u32, cap_s: u64) -> u64 {
    let d = FIRST_RETRY_S.saturating_mul(1u64 << attempts.saturating_sub(1).min(20));
    d.min(cap_s.max(FIRST_RETRY_S))
}

fn io_err(path: &Path, e: std::io::Error) -> String {
    crate::terr!(
        "e-feed-cannot-write",
        path = path.display().to_string(),
        e = e.to_string()
    )
}

/// Parse a spool state (`kshana.feed-spool/1`); `path` names it in errors.
pub fn parse_spool(text: &str, path: &str) -> Result<Spool, String> {
    let bad = |e: String| crate::terr!("e-feed-bad-spool", path = path, e = e);
    let s: Spool = serde_json::from_str(text).map_err(|e| bad(e.to_string()))?;
    if s.schema != SPOOL_SCHEMA {
        return Err(bad(s.schema));
    }
    Ok(s)
}

/// Read the spool state; a missing file is a new spool.
pub fn load(spool: &Path) -> Result<Spool, String> {
    let p = spool.join("state.json");
    match std::fs::read_to_string(&p) {
        Ok(t) => parse_spool(&t, &p.display().to_string()),
        Err(e) if e.kind() == std::io::ErrorKind::NotFound => Ok(Spool::default()),
        Err(e) => Err(io_err(&p, e)),
    }
}

/// Write `text` to `path` through a temporary file and a rename.
fn write_atomic(path: &Path, text: &str) -> Result<(), String> {
    let tmp = path.with_extension("tmp");
    std::fs::write(&tmp, text).map_err(|e| io_err(&tmp, e))?;
    std::fs::rename(&tmp, path).map_err(|e| io_err(path, e))
}

fn save(spool: &Path, s: &Spool) -> Result<(), String> {
    let text = serde_json::to_string_pretty(s).map_err(|e| e.to_string())? + "\n";
    write_atomic(&spool.join("state.json"), &text)
}

fn sha256_hex(b: &[u8]) -> String {
    use sha2::Digest as _;
    hex::encode(sha2::Sha256::digest(b))
}

/// Pack the closed, not yet packed files of `cfg.inputs`: one bundle per station.
fn pack_new(cfg: &WatchCfg, s: &mut Spool, created: &str, out: &mut Cycle) -> Result<(), String> {
    let mut by_station: BTreeMap<String, Vec<(String, String, String)>> = BTreeMap::new();
    for input in &cfg.inputs {
        for f in feeder::collect_inputs(input, cfg.include_open)? {
            let text = std::fs::read_to_string(&f).map_err(|e| {
                crate::terr!(
                    "e-feed-cannot-read",
                    path = f.display().to_string(),
                    e = e.to_string()
                )
            })?;
            let sha = sha256_hex(text.as_bytes());
            if s.packed.contains(&sha) {
                continue;
            }
            let name = f.display().to_string();
            let (_, rep) = crate::obs::check(&text)
                .map_err(|e| crate::terr!("e-feed-not-obs", path = name.clone(), e = e))?;
            by_station
                .entry(rep.station)
                .or_default()
                .push((name, text, sha));
        }
    }
    let pending = cfg.spool.join("pending");
    std::fs::create_dir_all(&pending).map_err(|e| io_err(&pending, e))?;
    for files in by_station.into_values() {
        let inputs: Vec<(String, String)> = files
            .iter()
            .map(|(n, t, _)| (n.clone(), t.clone()))
            .collect();
        let b = feeder::pack(&inputs, &cfg.seed, cfg.privacy, cfg.grid_deg, created)?;
        let file = format!("{:06}.json", s.next_seq);
        let text = serde_json::to_string(&b).map_err(|e| e.to_string())? + "\n";
        // The bundle first, then the state that names it.
        write_atomic(&pending.join(&file), &text)?;
        s.next_seq += 1;
        s.queue.push(Queued {
            file,
            attempts: 0,
            next_try_s: 0,
        });
        s.packed.extend(files.into_iter().map(|(_, _, sha)| sha));
        out.files_packed += inputs.len();
        out.bundles_packed += 1;
        save(&cfg.spool, s)?;
    }
    Ok(())
}

/// Whether a status refuses a bundle for good (a 4xx other than 408 and 429).
fn refused_for_good(code: u16) -> bool {
    (400..500).contains(&code) && code != 408 && code != 429
}

/// A sender: the URL, an optional bearer token and the body; the HTTP status or a connection
/// error.
pub type Poster<'a> = dyn FnMut(&str, Option<&str>, &str) -> Result<u16, String> + 'a;

/// Run one cycle at time `now_s` (Unix seconds), sending through `post` (the URL, an optional
/// token and the body; the HTTP status or a connection error).
pub fn cycle(
    cfg: &WatchCfg,
    now_s: u64,
    created: &str,
    post: &mut Poster<'_>,
) -> Result<Cycle, String> {
    std::fs::create_dir_all(&cfg.spool).map_err(|e| io_err(&cfg.spool, e))?;
    let mut s = load(&cfg.spool)?;
    let mut out = Cycle::default();
    pack_new(cfg, &mut s, created, &mut out)?;
    if let Some(url) = &cfg.url {
        let mut keep = Vec::new();
        for mut q in std::mem::take(&mut s.queue) {
            if q.next_try_s > now_s {
                keep.push(q);
                continue;
            }
            let path = cfg.spool.join("pending").join(&q.file);
            let text = std::fs::read_to_string(&path).map_err(|e| {
                crate::terr!(
                    "e-feed-cannot-read",
                    path = path.display().to_string(),
                    e = e.to_string()
                )
            })?;
            let moved_to = match post(url, cfg.token.as_deref(), &text) {
                Ok(code) if (200..300).contains(&code) => Some("sent"),
                Ok(code) if refused_for_good(code) => Some("rejected"),
                _ => None,
            };
            match moved_to {
                Some(dir) => {
                    let d = cfg.spool.join(dir);
                    std::fs::create_dir_all(&d).map_err(|e| io_err(&d, e))?;
                    std::fs::rename(&path, d.join(&q.file)).map_err(|e| io_err(&path, e))?;
                    if dir == "sent" {
                        out.sent += 1;
                    } else {
                        out.rejected += 1;
                    }
                }
                None => {
                    q.attempts += 1;
                    q.next_try_s = now_s + backoff_s(q.attempts, cfg.interval_s);
                    out.failed_attempts += 1;
                    keep.push(q);
                }
            }
        }
        s.queue = keep;
        save(&cfg.spool, &s)?;
    }
    out.pending = s.queue.len();
    out.next_retry_s = s.queue.iter().map(|q| q.next_try_s).min();
    Ok(out)
}

fn now_s() -> u64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map_or(0, |d| d.as_secs())
}

/// `kshana feed watch <dir|file>... --key <keyfile> --spool <dir> [--url <http://...>]
/// [--token-file <file>] [--interval-s <s>] [--privacy public|exact] [--grid-deg <deg>]
/// [--include-open] [--once]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("feed-usage");
    let a = feeder::parse_args(
        args,
        &[
            "--key",
            "--spool",
            "--url",
            "--token-file",
            "--interval-s",
            "--privacy",
            "--grid-deg",
        ],
        &["--include-open", "--once"],
    )?;
    let (Some(key), Some(spool)) = (a.opts.get("--key"), a.opts.get("--spool")) else {
        return Err(usage());
    };
    if a.pos.is_empty() {
        return Err(usage());
    }
    let interval_s: u64 = feeder::num(&a, "--interval-s", 3600)?;
    if interval_s == 0 {
        return Err(crate::terr!(
            "e-feed-bad-number",
            option = "--interval-s",
            value = "0"
        ));
    }
    if let Some(u) = a.opts.get("--url") {
        if !u.starts_with("http://") {
            return Err(crate::terr!("e-feed-http-only", url = u.clone()));
        }
    }
    let cfg = WatchCfg {
        inputs: a.pos.iter().map(PathBuf::from).collect(),
        seed: *crate::evidence::cli::read_seed(key)?,
        privacy: Privacy::parse(a.opts.get("--privacy").map_or("public", String::as_str))?,
        grid_deg: feeder::num(&a, "--grid-deg", feeder::DEFAULT_GRID_DEG)?,
        include_open: a.flags.contains("--include-open"),
        spool: PathBuf::from(spool),
        url: a.opts.get("--url").cloned(),
        token: match a.opts.get("--token-file") {
            Some(p) => Some(feeder::read_text(p)?.trim().to_string()),
            None => None,
        },
        interval_s,
    };
    loop {
        let created = crate::iq::io::record::now_iso();
        let now = now_s();
        let c = cycle(&cfg, now, &created, &mut |u, t, b| {
            crate::station::post(u, t, b)
        })?;
        eprintln!(
            "{}",
            crate::t!(
                "feed-watch-cycle",
                files = c.files_packed,
                bundles = c.bundles_packed,
                sent = c.sent,
                rejected = c.rejected,
                pending = c.pending
            )
        );
        if a.flags.contains("--once") {
            return Ok(());
        }
        let wake = c
            .next_retry_s
            .map_or(interval_s, |t| t.saturating_sub(now).clamp(1, interval_s));
        std::thread::sleep(std::time::Duration::from_secs(wake));
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn backoff_doubles_to_the_interval() {
        assert_eq!(backoff_s(1, 3600), 30);
        assert_eq!(backoff_s(2, 3600), 60);
        assert_eq!(backoff_s(5, 3600), 480);
        assert_eq!(backoff_s(9, 3600), 3600);
        assert_eq!(backoff_s(60, 3600), 3600);
        // An interval shorter than the first delay still waits the first delay.
        assert_eq!(backoff_s(1, 10), 30);
        assert!(refused_for_good(403) && !refused_for_good(429) && !refused_for_good(503));
    }
}
