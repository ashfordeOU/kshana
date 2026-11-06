// SPDX-License-Identifier: AGPL-3.0-only
//! Live IQ capture to SigMF (L4b), receive only. A stand-in capture tool sends 8-bit complex
//! samples over TCP in pieces, slowly. `kshana iq record` writes them into a SigMF recording,
//! byte for byte, with the metadata written first, and cuts a trailing partial sample. While the
//! file grows, `kshana iq monitor --follow` reads it, and its report equals the report of the
//! finished recording.

use std::io::Write;
use std::net::TcpListener;
use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::Duration;

static SEQ: AtomicU64 = AtomicU64::new(0);

fn fresh(name: &str) -> PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-iq-record-{}-{}-{name}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

/// `n` samples of cu8 noise, with a strong tone burst in the middle, then one stray byte.
fn samples(n: usize) -> Vec<u8> {
    let mut s: u64 = 0x2545_F491_4F6C_DD1D;
    let mut v = Vec::with_capacity(2 * n + 1);
    for k in 0..n {
        let mut u = || {
            s ^= s << 13;
            s ^= s >> 7;
            s ^= s << 17;
            (s % 21) as f64 - 10.0
        };
        let (mut i, mut q) = (u(), u());
        if (n * 2 / 5..n * 3 / 5).contains(&k) {
            let ph = k as f64 * 0.37;
            i += 90.0 * ph.cos();
            q += 90.0 * ph.sin();
        }
        v.push((127.5 + i).round().clamp(0.0, 255.0) as u8);
        v.push((127.5 + q).round().clamp(0.0, 255.0) as u8);
    }
    v.push(0x80);
    v
}

/// A capture tool on a TCP port: sends `bytes` in pieces of `piece`, waiting `gap` between them.
fn tool(bytes: Vec<u8>, piece: usize, gap: Duration) -> (String, std::thread::JoinHandle<()>) {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let h = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        for c in bytes.chunks(piece) {
            s.write_all(c).unwrap();
            std::thread::sleep(gap);
        }
    });
    (addr, h)
}

fn kshana() -> Command {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"));
    c.env("KSHANA_LANG", "en");
    c
}

#[test]
fn a_capture_is_written_byte_for_byte_and_monitored_while_it_grows() {
    let rate = 200_000.0;
    let bytes = samples(200_000);
    let (addr, h) = tool(bytes.clone(), 20_000, Duration::from_millis(40));
    let out = fresh("cap.sigmf-data");
    let meta = out.with_extension("sigmf-meta");
    let rec = kshana()
        .args(["iq", "record"])
        .arg(&out)
        .args([
            "--format",
            "cu8",
            "--rate",
            "200000",
            "--center",
            "1575420000",
        ])
        .args([
            "--from",
            &format!("tcp:{addr}"),
            "--hw",
            "test tool, gain 30 dB",
        ])
        .stdout(std::process::Stdio::piped())
        .stderr(std::process::Stdio::piped())
        .spawn()
        .unwrap();
    // The metadata comes first: wait for it, then follow the data as it grows.
    for _ in 0..200 {
        if meta.exists() && out.exists() {
            break;
        }
        std::thread::sleep(Duration::from_millis(10));
    }
    let live_json = fresh("live.json");
    let live = kshana()
        .args(["iq", "monitor"])
        .arg(&meta)
        .args([
            "--follow",
            "--idle-timeout",
            "1.5",
            "--power",
            "--spectral",
            "--json",
        ])
        .arg(&live_json)
        .output()
        .unwrap();
    let rec = rec.wait_with_output().unwrap();
    h.join().unwrap();
    let msg = String::from_utf8_lossy(&rec.stdout);
    assert!(
        rec.status.success(),
        "{}",
        String::from_utf8_lossy(&rec.stderr)
    );
    assert!(
        msg.contains("recorded 200000 samples (1.000 s)") && msg.contains("1 trailing byte"),
        "{msg}"
    );
    assert_eq!(std::fs::read(&out).unwrap(), bytes[..bytes.len() - 1]);
    let m: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&meta).unwrap()).unwrap();
    assert_eq!(m["global"]["core:datatype"], "cu8");
    assert_eq!(m["global"]["core:sample_rate"], rate);
    assert_eq!(m["global"]["core:hw"], "test tool, gain 30 dB");
    assert_eq!(m["captures"][0]["core:frequency"], 1_575_420_000.0);
    assert!(m["captures"][0]["core:datetime"]
        .as_str()
        .is_some_and(|t| t.ends_with('Z')));

    assert!(
        live.status.success(),
        "{}",
        String::from_utf8_lossy(&live.stderr)
    );
    let replay_json = fresh("replay.json");
    let replay = kshana()
        .args(["iq", "monitor"])
        .arg(&meta)
        .args(["--power", "--spectral", "--json"])
        .arg(&replay_json)
        .output()
        .unwrap();
    assert!(replay.status.success());
    let a = std::fs::read_to_string(&live_json).unwrap();
    let b = std::fs::read_to_string(&replay_json).unwrap();
    assert_eq!(a, b, "the live report equals the replay's");
    assert!(a.contains("\"events\""), "{a}");
}

#[test]
fn max_seconds_stops_the_capture_and_bad_arguments_are_refused() {
    let bytes = samples(50_000);
    let (addr, h) = tool(bytes.clone(), 4096, Duration::ZERO);
    let out = fresh("short.sigmf");
    let o = kshana()
        .args(["iq", "record"])
        .arg(&out)
        .args(["--format", "cu8", "--rate", "10000", "--max-seconds", "2"])
        .args(["--from", &format!("tcp:{addr}")])
        .output()
        .unwrap();
    h.join().unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let data = out.with_extension("sigmf-data");
    assert_eq!(std::fs::read(&data).unwrap(), bytes[..40_000]);

    let o = kshana()
        .args(["iq", "record", "x.cu8", "--format", "cu8", "--rate", "1"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&o.stderr).contains("SigMF"));
    let o = kshana()
        .args(["iq", "record", "x.sigmf-data", "--rate", "1"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
