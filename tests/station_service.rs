// SPDX-License-Identifier: AGPL-3.0-only
//! Kshana Station (roadmap L3), over real sockets: a recorded receiver log served on a TCP
//! port twice (the Station reconnects), the observation files equal to a replay of the same
//! bytes, rotation into files that each check as `kshana.obs/1`, the status port (local by
//! default, a token off the loopback address), the fleet report, and the service files.

use kshana::obs::Record;
use kshana::station::{self, Config};
use std::io::{Read, Write};
use std::net::TcpListener;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::{Duration, Instant};

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn tmp(tag: &str) -> PathBuf {
    static N: AtomicU64 = AtomicU64::new(0);
    let d = std::env::temp_dir().join(format!(
        "kshana-station-{tag}-{}-{}",
        std::process::id(),
        N.fetch_add(1, Ordering::SeqCst)
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

fn log_bytes() -> Vec<u8> {
    std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap()
}

fn station_block() -> String {
    std::fs::read_to_string(root().join("examples/obs/station.toml"))
        .unwrap()
        .lines()
        .filter(|l| !l.starts_with('#'))
        .collect::<Vec<_>>()
        .join("\n")
}

/// A receiver on a TCP port: serves the log `times` times, in small chunks, then stops.
fn receiver(times: usize) -> String {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let bytes = log_bytes();
    std::thread::spawn(move || {
        for _ in 0..times {
            let (mut s, _) = l.accept().unwrap();
            for c in bytes.chunks(700) {
                if s.write_all(c).is_err() {
                    break;
                }
                std::thread::sleep(Duration::from_millis(2));
            }
        }
    });
    addr
}

fn config(dir: &Path, addr: &str, extra: &str) -> Config {
    write_config(dir, addr, extra);
    let text = std::fs::read_to_string(dir.join("station.toml")).unwrap()
        + "\n[http]\nlisten = \"127.0.0.1:0\"\n";
    std::fs::write(dir.join("station.toml"), text).unwrap();
    station::load(&dir.join("station.toml")).unwrap()
}

/// The configuration file without an [http] table (a test adds its own).
fn write_config(dir: &Path, addr: &str, extra: &str) {
    let text = format!(
        "[station]\n{}\n\n[[source]]\nname = \"gnss-1\"\ninput = \"tcp:{addr}\"\nformat = \"nmea\"\n\n[output]\ndir = \"obs\"\n{extra}",
        station_block()
    );
    std::fs::write(dir.join("station.toml"), text).unwrap();
}

fn epochs_of(text: &str) -> Vec<String> {
    text.lines()
        .filter(|l| !l.is_empty())
        .filter(|l| !l.contains("\"type\":\"header\"") && !l.contains("\"record\":\"header\""))
        .filter(|l| serde_json::from_str::<serde_json::Value>(l).is_ok())
        .map(str::to_string)
        .collect()
}

fn get(addr: std::net::SocketAddr, path: &str, token: Option<&str>) -> (u16, String) {
    let mut s = std::net::TcpStream::connect(addr).unwrap();
    let auth = token
        .map(|t| format!("Authorization: Bearer {t}\r\n"))
        .unwrap_or_default();
    write!(s, "GET {path} HTTP/1.1\r\nHost: x\r\n{auth}\r\n").unwrap();
    let mut out = String::new();
    s.read_to_string(&mut out).unwrap();
    (
        out[9..12].parse().unwrap(),
        out.split_once("\r\n\r\n")
            .map(|x| x.1.to_string())
            .unwrap_or_default(),
    )
}

fn wait_for(h: &station::Handle, f: impl Fn(&serde_json::Value) -> bool) -> serde_json::Value {
    let t = Instant::now();
    loop {
        let s = h.status();
        if f(&s) {
            return s;
        }
        assert!(
            t.elapsed() < Duration::from_secs(30),
            "status never reached: {s}"
        );
        std::thread::sleep(Duration::from_millis(50));
    }
}

#[test]
fn a_station_records_a_receiver_as_a_replay_would_and_reconnects() {
    let dir = tmp("record");
    let addr = receiver(2);
    let h = station::start(config(&dir, &addr, "")).unwrap();
    let s = wait_for(&h, |s| {
        s["sources"][0]["connections"] == 2 && s["sources"][0]["connected"] == false
    });
    h.stop();
    assert_eq!(s["sources"][0]["gaps"], 1, "{s}");
    assert_eq!(s["station"], "example-station-1");

    // Each connection's file holds exactly the epochs a replay of the same bytes gives.
    let station: kshana::obs::Station = toml::from_str(&station_block()).unwrap();
    let replay =
        kshana::obs::to_jsonl(&kshana::obs::from_log("nmea", &log_bytes(), &station).unwrap())
            .unwrap();
    let want = epochs_of(&replay);
    assert!(!want.is_empty());
    let mut files: Vec<PathBuf> = std::fs::read_dir(dir.join("obs/gnss-1"))
        .unwrap()
        .map(|e| e.unwrap().path())
        .collect();
    files.sort();
    assert_eq!(files.len(), 2, "one file per connection: {files:?}");
    for f in &files {
        let text = std::fs::read_to_string(f).unwrap();
        assert_eq!(epochs_of(&text), want, "{}", f.display());
        kshana::obs::check(&text).unwrap();
    }
    // The status counts the epochs of both connections.
    let n_epochs = kshana::obs::from_log("nmea", &log_bytes(), &station)
        .unwrap()
        .iter()
        .filter(|r| matches!(r, Record::Epoch(_)))
        .count() as u64;
    assert_eq!(s["sources"][0]["epochs"].as_u64().unwrap(), 2 * n_epochs);
}

#[test]
fn files_rotate_and_each_one_is_a_valid_observation_file() {
    let dir = tmp("rotate");
    let addr = receiver(1);
    let h = station::start(config(&dir, &addr, "rotate_mb = 0.002\nkeep = 1000\n")).unwrap();
    wait_for(&h, |s| {
        s["sources"][0]["connections"] == 1 && s["sources"][0]["connected"] == false
    });
    h.stop();
    let files: Vec<PathBuf> = std::fs::read_dir(dir.join("obs/gnss-1"))
        .unwrap()
        .map(|e| e.unwrap().path())
        .collect();
    assert!(files.len() >= 3, "rotation made {} files", files.len());
    let mut total = 0;
    for f in &files {
        let text = std::fs::read_to_string(f).unwrap();
        let (_, rep) = kshana::obs::check(&text).unwrap();
        total += serde_json::to_value(&rep).unwrap()["epochs"]
            .as_u64()
            .unwrap_or(0);
    }
    assert!(total > 0);
    // keep = 2: only the two newest remain.
    let dir2 = tmp("keep");
    let addr = receiver(1);
    let h = station::start(config(&dir2, &addr, "rotate_mb = 0.002\nkeep = 2\n")).unwrap();
    wait_for(&h, |s| {
        s["sources"][0]["connections"] == 1 && s["sources"][0]["connected"] == false
    });
    h.stop();
    assert_eq!(
        std::fs::read_dir(dir2.join("obs/gnss-1")).unwrap().count(),
        2
    );
}

#[test]
fn the_status_port_is_local_and_a_token_guards_it_elsewhere_and_the_fleet_hears_it() {
    let dir = tmp("http");
    // Off the loopback address without a token: refused.
    let addr = receiver(1);
    let text = {
        write_config(&dir, &addr, "");
        std::fs::read_to_string(dir.join("station.toml")).unwrap()
    };
    std::fs::write(
        dir.join("remote.toml"),
        text.clone() + "\n[http]\nlisten = \"0.0.0.0:0\"\n",
    )
    .unwrap();
    assert!(station::load(&dir.join("remote.toml"))
        .unwrap_err()
        .contains("loopback"));

    // A fleet manager on a local port records the reports.
    let fleet = TcpListener::bind("127.0.0.1:0").unwrap();
    let furl = format!(
        "http://{}/fleet/stations/example-station-1/heartbeat",
        fleet.local_addr().unwrap()
    );
    let (tx, rx) = std::sync::mpsc::channel();
    std::thread::spawn(move || {
        let (mut s, _) = fleet.accept().unwrap();
        let mut buf = vec![0u8; 65536];
        let mut got = Vec::new();
        let t = Instant::now();
        while t.elapsed() < Duration::from_secs(5) {
            let n = s.read(&mut buf).unwrap_or(0);
            got.extend_from_slice(&buf[..n]);
            let txt = String::from_utf8_lossy(&got).to_string();
            if let Some((h, b)) = txt.split_once("\r\n\r\n") {
                let len: usize = h
                    .lines()
                    .find_map(|l| l.strip_prefix("Content-Length: "))
                    .and_then(|v| v.trim().parse().ok())
                    .unwrap_or(0);
                if b.len() >= len {
                    s.write_all(b"HTTP/1.1 200 OK\r\nContent-Length: 2\r\n\r\n{}")
                        .unwrap();
                    tx.send(txt).unwrap();
                    return;
                }
            }
        }
    });
    std::fs::write(dir.join("token"), "s3cret-test-token\n").unwrap();
    std::fs::write(dir.join("fleet-token"), "fleet-test-token\n").unwrap();
    std::fs::write(
        dir.join("guarded.toml"),
        text + &format!("\n[http]\nlisten = \"127.0.0.1:0\"\ntoken_file = \"token\"\n\n[fleet]\nurl = \"{furl}\"\ntoken_file = \"fleet-token\"\ninterval_s = 1\n"),
    )
    .unwrap();
    let h = station::start(station::load(&dir.join("guarded.toml")).unwrap()).unwrap();
    assert_eq!(get(h.http_addr, "/health", None).0, 200);
    assert_eq!(get(h.http_addr, "/status", None).0, 401);
    let (code, body) = get(h.http_addr, "/status", Some("s3cret-test-token"));
    assert_eq!(code, 200);
    let v: serde_json::Value = serde_json::from_str(&body).unwrap();
    assert_eq!(v["schema"], "kshana.station-status/1");
    let report = rx
        .recv_timeout(Duration::from_secs(10))
        .expect("the fleet heard nothing");
    assert!(report.starts_with("POST /fleet/stations/example-station-1/heartbeat HTTP/1.1"));
    assert!(report.contains("Authorization: Bearer fleet-test-token"));
    assert!(report.contains("kshana.station-status/1"));
    h.stop();
}

#[test]
fn service_files_and_configuration_errors() {
    let (c, p) = (
        Path::new("/etc/kshana/station.toml"),
        Path::new("/usr/local/bin/kshana"),
    );
    let unit = station::service_text("systemd", c, p).unwrap();
    assert!(unit.contains("ExecStart=/usr/local/bin/kshana station run /etc/kshana/station.toml"));
    assert!(unit.contains("Restart=always"));
    let plist = station::service_text("launchd", c, p).unwrap();
    assert!(plist.contains("<string>station</string>") && plist.contains("KeepAlive"));
    let win = station::service_text("windows", c, p).unwrap();
    assert!(win.contains("/SC ONSTART") && win.contains("station run"));
    assert!(station::service_text("upstart", c, p).is_err());

    let dir = tmp("errors");
    let bad = |body: &str| {
        std::fs::write(
            dir.join("s.toml"),
            format!("[station]\n{}\n{body}", station_block()),
        )
        .unwrap();
        station::load(&dir.join("s.toml")).unwrap_err()
    };
    assert!(bad("[output]\ndir = \"o\"\n").contains("source"));
    assert!(bad(
        "[[source]]\nname = \"a b\"\ninput = \"x\"\nformat = \"nmea\"\n[output]\ndir = \"o\"\n"
    )
    .contains("source"));
    assert!(bad(
        "[[source]]\nname = \"a\"\ninput = \"x\"\nformat = \"nope\"\n[output]\ndir = \"o\"\n"
    )
    .contains("nope"));
    assert!(bad("[[source]]\nname = \"a\"\ninput = \"x\"\nformat = \"nmea\"\n[output]\ndir = \"o\"\nrotate_mb = 0\n").contains("rotate_mb"));
    assert!(bad("[[source]]\nname = \"a\"\ninput = \"x\"\nformat = \"nmea\"\n[output]\ndir = \"o\"\n[fleet]\nurl = \"https://x\"\n").contains("http://"));
}
