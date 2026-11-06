// SPDX-License-Identifier: AGPL-3.0-only
//! Alert delivery (A4) from the command line: `kshana trust-telemetry --cap-config ... --cap-dir ...
//! --webhook ...` writes and POSTs exactly the CAP messages the library makes from the whole stream,
//! one per band change. Every POST carries a `Kshana-Signature` that verifies with the secret, and the
//! secret never appears in the output.

use kshana::telemetry::cap::{alerts, CapConfig};
use kshana::telemetry::sample::parse_live_line;
use kshana::telemetry::webhook::verify;
use std::io::{BufRead, BufReader, Read, Write};
use std::net::TcpListener;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

const STREAM: &[&str] = &[
    r#"{"t_s":0,"time":"2025-01-01T00:00:00Z","state":"calibrating","score":null}"#,
    r#"{"t_s":10,"state":"nominal","score":97}"#,
    r#"{"t_s":11,"state":"nominal","score":96}"#,
    r#"{"t_s":20,"state":"degraded","score":61,"reasons":["agc_drop","cn0_drop"]}"#,
    r#"{"t_s":21,"state":"degraded","score":58,"reasons":["agc_drop"]}"#,
    r#"{"t_s":30,"state":"untrusted","score":12,"reasons":["position_jump"]}"#,
    r#"{"t_s":50,"state":"nominal","score":95}"#,
];

const CAP_TOML: &str = r#"sender = "kshana@station.example"
status = "Exercise"
scope = "Restricted"
area_desc = "Example port & approaches"
station = [59.44, 24.75]
radius_km = 25.0
"#;

#[test]
fn messages_are_written_and_posted_signed() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-alerts-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    std::fs::write(dir.join("stream.jsonl"), STREAM.join("\n") + "\n").unwrap();
    std::fs::write(dir.join("cap.toml"), CAP_TOML).unwrap();
    let want = alerts(
        &STREAM
            .iter()
            .map(|l| parse_live_line(l).unwrap())
            .collect::<Vec<_>>(),
        &CapConfig {
            sender: "kshana@station.example".into(),
            status: "Exercise".into(),
            scope: "Restricted".into(),
            area_desc: "Example port & approaches".into(),
            station: Some((59.44, 24.75)),
            radius_km: 25.0,
            t0_unix_s: 1_735_689_600,
        },
    )
    .unwrap();
    assert_eq!(want.len(), 3);

    let secret = "whsec-test-6b1f0c";
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let port = l.local_addr().unwrap().port();
    let n = want.len();
    let receiver = std::thread::spawn(move || {
        let mut got = Vec::new();
        for _ in 0..n {
            let (s, _) = l.accept().unwrap();
            let mut r = BufReader::new(s);
            let mut head = Vec::new();
            loop {
                let mut line = String::new();
                r.read_line(&mut line).unwrap();
                if line == "\r\n" {
                    break;
                }
                head.push(line.trim_end().to_string());
            }
            assert!(head[0].starts_with("POST /hooks/kshana HTTP/1.1"));
            let field = |name: &str| {
                head.iter()
                    .find_map(|h| {
                        h.split_once(':')
                            .filter(|(k, _)| k.eq_ignore_ascii_case(name))
                            .map(|(_, v)| v.trim().to_string())
                    })
                    .unwrap()
            };
            let len: usize = field("content-length").parse().unwrap();
            let sig = field("kshana-signature");
            let mut body = vec![0u8; len];
            r.read_exact(&mut body).unwrap();
            let t: i64 = sig[2..sig.find(',').unwrap()].parse().unwrap();
            assert_eq!(verify(&body, &sig, b"whsec-test-6b1f0c", t, 0), Ok(()));
            assert!(field("content-type").starts_with("application/cap+xml"));
            r.get_mut()
                .write_all(b"HTTP/1.1 204 No Content\r\nContent-Length: 0\r\n\r\n")
                .unwrap();
            got.push(String::from_utf8(body).unwrap());
        }
        got
    });

    let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["trust-telemetry", "--input"])
        .arg(dir.join("stream.jsonl"))
        .arg("--cap-config")
        .arg(dir.join("cap.toml"))
        .arg("--cap-dir")
        .arg(dir.join("cap"))
        .args([
            "--webhook",
            &format!("http://127.0.0.1:{port}/hooks/kshana"),
        ])
        .args(["--webhook-secret-env", "KSHANA_TEST_WEBHOOK_SECRET"])
        .env("KSHANA_TEST_WEBHOOK_SECRET", secret)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    let stderr = String::from_utf8_lossy(&out.stderr);
    assert!(out.status.success(), "{stderr}");
    assert!(
        stderr.contains("alerts: 3 CAP message(s), 0 delivery failure(s)"),
        "{stderr}"
    );
    assert!(!stderr.contains(secret) && !String::from_utf8_lossy(&out.stdout).contains(secret));

    let posted = receiver.join().unwrap();
    assert_eq!(posted, want);
    let mut files: Vec<_> = std::fs::read_dir(dir.join("cap"))
        .unwrap()
        .map(|e| std::fs::read_to_string(e.unwrap().path()).unwrap())
        .collect();
    files.sort_by_key(|x| want.iter().position(|w| w == x));
    assert_eq!(files, want);
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn alert_options_must_come_together() {
    for args in [
        vec!["--cap-dir", "x"],
        vec!["--cap-config", "x"],
        vec!["--cap-config", "x", "--webhook", "http://h/"],
    ] {
        let out = Command::new(env!("CARGO_BIN_EXE_kshana"))
            .arg("trust-telemetry")
            .args(&args)
            .env("KSHANA_LANG", "en")
            .output()
            .unwrap();
        assert_eq!(out.status.code(), Some(2), "{args:?}");
    }
}
