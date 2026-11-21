// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana feed watch` (src/feeder_watch.rs): a resumable spool, each closed file packed once,
//! sends with retry and backoff, refusals set aside, and the command line end to end against a
//! local listener.

use kshana::feeder::{self, Privacy, DEFAULT_GRID_DEG};
use kshana::feeder_watch::{self as fw, WatchCfg};
use kshana::obs::{self, Station};
use std::cell::RefCell;
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

/// A fresh, unique scratch folder.
fn fresh() -> PathBuf {
    let scratch_dir = std::env::temp_dir().join(format!(
        "kshana-feed-watch-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&scratch_dir).unwrap();
    scratch_dir
}

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn station() -> Station {
    Station {
        id: "a-station".into(),
        lat_deg: Some(59.23),
        lon_deg: Some(10.77),
        height_m: Some(40.0),
        antenna: None,
        receiver: None,
        firmware: None,
        operator: None,
        partner_input: false,
    }
}

/// Write observation file `n` of a station directory; each file differs from the others.
fn write_obs(dir: &Path, n: usize) {
    let bytes =
        std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap();
    let text = String::from_utf8_lossy(&bytes);
    let lines: Vec<&str> = text.lines().collect();
    // A different slice of the log per file, so the contents (and hashes) differ.
    let part = lines[..lines.len() - n].join("\n") + "\n";
    let recs = obs::from_log("nmea", part.as_bytes(), &station()).unwrap();
    std::fs::create_dir_all(dir).unwrap();
    std::fs::write(
        dir.join(format!("{n:06}.obs.jsonl")),
        obs::to_jsonl(&recs).unwrap(),
    )
    .unwrap();
}

fn cfg(base: &Path, url: Option<&str>) -> WatchCfg {
    WatchCfg {
        inputs: vec![base.join("data")],
        seed: [7u8; 32],
        privacy: Privacy::Public,
        grid_deg: DEFAULT_GRID_DEG,
        include_open: false,
        spool: base.join("spool"),
        url: url.map(str::to_string),
        token: None,
        interval_s: 3600,
    }
}

const CREATED: &str = "2026-11-21T00:00:00.000Z";

#[test]
fn closed_files_are_packed_once_and_the_open_one_waits() {
    let base = fresh();
    let station_dir = base.join("data").join("site");
    for n in 1..=3 {
        write_obs(&station_dir, n);
    }
    let c = cfg(&base, None);
    let mut never = |_: &str, _: Option<&str>, _: &str| -> Result<u16, String> {
        panic!("no URL: nothing is sent")
    };
    let r = fw::cycle(&c, 1000, CREATED, &mut never).unwrap();
    // Three files, the newest still open: two packed into one bundle.
    assert_eq!((r.files_packed, r.bundles_packed, r.pending), (2, 1, 1));
    let bundle = std::fs::read_to_string(c.spool.join("pending/000001.json")).unwrap();
    let (_, rep) = feeder::verify(&bundle, None).unwrap();
    assert_eq!(rep.files, 2);
    // Nothing new: nothing packed again.
    let r = fw::cycle(&c, 2000, CREATED, &mut never).unwrap();
    assert_eq!((r.files_packed, r.bundles_packed, r.pending), (0, 0, 1));
    // A new file closes the third.
    write_obs(&station_dir, 4);
    let r = fw::cycle(&c, 3000, CREATED, &mut never).unwrap();
    assert_eq!((r.files_packed, r.bundles_packed, r.pending), (1, 1, 2));
    let s = fw::load(&c.spool).unwrap();
    assert_eq!(s.packed.len(), 3);
    assert_eq!(s.next_seq, 3);
    let _ = std::fs::remove_dir_all(&base);
}

#[test]
fn failed_sends_back_off_and_refusals_are_set_aside() {
    let base = fresh();
    for n in 1..=2 {
        write_obs(&base.join("data").join("site"), n);
    }
    let c = cfg(&base, Some("http://collector.invalid/feed"));
    let calls = RefCell::new(Vec::new());
    let reply = RefCell::new(Err::<u16, String>("connection refused".into()));
    let mut post = |u: &str, _: Option<&str>, body: &str| {
        calls.borrow_mut().push(u.to_string());
        assert!(feeder::verify(body, None).is_ok());
        reply.borrow().clone()
    };
    // No connection: retried after 30 s.
    let r = fw::cycle(&c, 1000, CREATED, &mut post).unwrap();
    assert_eq!((r.sent, r.failed_attempts, r.pending), (0, 1, 1));
    assert_eq!(r.next_retry_s, Some(1030));
    // Before the retry time: not tried.
    let r = fw::cycle(&c, 1010, CREATED, &mut post).unwrap();
    assert_eq!((calls.borrow().len(), r.pending), (1, 1));
    // A 503: retried again after 60 s.
    *reply.borrow_mut() = Ok(503);
    let r = fw::cycle(&c, 1030, CREATED, &mut post).unwrap();
    assert_eq!((r.failed_attempts, r.next_retry_s), (1, Some(1090)));
    // The state survives a restart: a fresh load sees the same queue.
    let s = fw::load(&c.spool).unwrap();
    assert_eq!((s.queue.len(), s.queue[0].attempts), (1, 2));
    // Accepted: moved to sent/.
    *reply.borrow_mut() = Ok(201);
    let r = fw::cycle(&c, 1090, CREATED, &mut post).unwrap();
    assert_eq!((r.sent, r.pending, r.next_retry_s), (1, 0, None));
    assert!(c.spool.join("sent/000001.json").is_file());
    assert!(!c.spool.join("pending/000001.json").exists());
    // A refusal (403) is not retried: moved to rejected/.
    write_obs(&base.join("data").join("site"), 3);
    *reply.borrow_mut() = Ok(403);
    let r = fw::cycle(&c, 2000, CREATED, &mut post).unwrap();
    assert_eq!((r.bundles_packed, r.rejected, r.pending), (1, 1, 0));
    assert!(c.spool.join("rejected/000002.json").is_file());
    assert_eq!(calls.borrow().len(), 4);
    let _ = std::fs::remove_dir_all(&base);
}

#[test]
fn a_foreign_spool_state_is_refused() {
    let base = fresh();
    let spool = base.join("spool");
    std::fs::create_dir_all(&spool).unwrap();
    std::fs::write(
        spool.join("state.json"),
        "{\"schema\":\"other/1\",\"packed\":[],\"queue\":[],\"next_seq\":1}",
    )
    .unwrap();
    assert!(fw::load(&spool).is_err());
    std::fs::write(spool.join("state.json"), "not json").unwrap();
    assert!(fw::load(&spool).is_err());
    let _ = std::fs::remove_dir_all(&base);
}

fn kshana() -> Command {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"));
    c.env("KSHANA_LANG", "en");
    c
}

#[test]
fn command_line_packs_and_sends_to_a_local_collector() {
    let base = fresh();
    for n in 1..=2 {
        write_obs(&base.join("data").join("site"), n);
    }
    let key = base.join("feeder.key");
    std::fs::write(&key, "07".repeat(32) + "\n").unwrap();
    // A one-shot collector on a local port that accepts one bundle.
    let listener = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = listener.local_addr().unwrap();
    let server = std::thread::spawn(move || {
        let (mut s, _) = listener.accept().unwrap();
        let mut buf = Vec::new();
        let mut chunk = [0u8; 65536];
        // Read the head, then the body by its length.
        loop {
            let n = s.read(&mut chunk).unwrap();
            buf.extend_from_slice(&chunk[..n]);
            let text = String::from_utf8_lossy(&buf).to_string();
            if let Some(i) = text.find("\r\n\r\n") {
                let len: usize = text
                    .lines()
                    .find_map(|l| l.strip_prefix("Content-Length: "))
                    .and_then(|v| v.trim().parse().ok())
                    .unwrap_or(0);
                if buf.len() >= i + 4 + len {
                    break;
                }
            }
            if n == 0 {
                break;
            }
        }
        s.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 0\r\nConnection: close\r\n\r\n")
            .unwrap();
        String::from_utf8_lossy(&buf).to_string()
    });
    let spool = base.join("spool");
    let out = kshana()
        .args(["feed", "watch"])
        .arg(base.join("data"))
        .arg("--key")
        .arg(&key)
        .arg("--spool")
        .arg(&spool)
        .args(["--url", &format!("http://{addr}/feed"), "--once"])
        .output()
        .unwrap();
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let request = server.join().unwrap();
    assert!(request.starts_with("POST /feed HTTP/1.1"));
    assert!(request.contains("kshana.feed/1"));
    assert!(spool.join("sent/000001.json").is_file());
    let stderr = String::from_utf8_lossy(&out.stderr);
    assert!(
        stderr.contains("1 files packed into 1 bundles, 1 sent"),
        "{stderr}"
    );
    // HTTPS is refused with the reason.
    let out = kshana()
        .args(["feed", "watch"])
        .arg(base.join("data"))
        .arg("--key")
        .arg(&key)
        .arg("--spool")
        .arg(&spool)
        .args(["--url", "https://collector.example/feed", "--once"])
        .output()
        .unwrap();
    assert!(!out.status.success());
    assert!(String::from_utf8_lossy(&out.stderr).contains("no TLS client"));
    let _ = std::fs::remove_dir_all(&base);
}
