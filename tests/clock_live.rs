// SPDX-License-Identifier: AGPL-3.0-only
//! Live clock state (L4c): `kshana clock-live` on a linuxptp, chrony or PPS log keeps exactly the
//! readings the whole-log reader keeps, so the kept offsets of a live run are the phase series of a
//! replay. Checked on gap-free synthetic logs read whole, followed while they are written, and on
//! the bundled linuxptp and chrony fixtures.

use kshana::clock_log::{parse, ClockLogFormat, ClockLogInput, GapPolicy};
use std::io::Write;
use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};
use std::time::Duration;

static SEQ: AtomicU64 = AtomicU64::new(0);

fn fresh(name: &str) -> PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-clock-live-{}-{}-{name}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

fn live(args: &[&str]) -> Vec<serde_json::Value> {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .arg("clock-live")
        .args(args)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    String::from_utf8(o.stdout)
        .unwrap()
        .lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect()
}

fn kept(lines: &[serde_json::Value]) -> Vec<f64> {
    lines
        .iter()
        .filter(|l| l["kept"] == true)
        .map(|l| l["offset_s"].as_f64().unwrap())
        .collect()
}

fn replay(format: &str, text: &str, clock: Option<&str>) -> Vec<f64> {
    let inp = ClockLogInput {
        format: format.into(),
        text: Some(text.into()),
        clock: clock.map(str::to_string),
        ..Default::default()
    };
    let fmt = ClockLogFormat::from_name(format).unwrap();
    let p = parse(fmt, text, &inp, GapPolicy::Refuse).unwrap();
    assert_eq!(p.n_missing, 0, "the synthetic logs have no gaps");
    p.phase_s
}

fn ptp4l_log() -> String {
    let mut s = String::from("ptp4l[1000.000]: selected best master clock 001122.fffe.334455\n");
    for k in 0..60i64 {
        let state = match k {
            0 => "s0",
            1 => "s1",
            _ => "s2",
        };
        let off = if k < 2 {
            50_000 - 40_000 * k
        } else {
            (k * 37) % 41 - 20
        };
        s += &format!(
            "ptp4l[{}.{:03}]: master offset {off:>10} {state} freq {:+7} path delay 500\n",
            1001 + k,
            (k * 7) % 3,
            1200 + k
        );
        if k % 10 == 5 {
            s += "ptp4l[0.000]: port 1: announce timeout\n";
        }
    }
    s
}

fn chrony_tracking_log() -> String {
    let mut s = String::from("   Date (UTC) Time     IP Address   St   Freq ppm   Skew ppm     Offset L Co  Offset sd Rem. corr. Root delay Root disp. Max. error\n===\n");
    for k in 0..40 {
        s += &format!(
            "2026-11-06 10:{:02}:{:02} C0A80001     2      0.100      0.010 {:10.3e} N  1  2.0e-07  -1.0e-06  1.0e-03  2.0e-04  5.0e-04\n",
            k * 16 / 60,
            k * 16 % 60,
            (f64::from(k) * 0.7).sin() * 3e-6
        );
    }
    s
}

fn pps_log() -> String {
    let mut s = String::new();
    for k in 0..50u64 {
        let ns = (k * 389) % 2000;
        let line = if k % 2 == 0 {
            format!("{}.{:09}#{}\n", 1_780_000_000 + k, ns, 100 + k)
        } else {
            format!(
                "{}.{:09}#{}\n",
                1_780_000_000 + k - 1,
                1_000_000_000 - ns,
                100 + k
            )
        };
        s += &line;
        if k % 3 == 0 {
            s += &line; // read again by a poll before the next pulse
        }
    }
    s
}

#[test]
fn the_kept_readings_are_the_replay_series() {
    for (format, text, clock) in [
        ("ptp4l", ptp4l_log(), None),
        ("chrony-tracking", chrony_tracking_log(), None),
        ("pps-assert", pps_log(), None),
    ] {
        let path = fresh("log.txt");
        std::fs::write(&path, &text).unwrap();
        let out = live(&["--format", format, "--from", path.to_str().unwrap()]);
        assert_eq!(kept(&out), replay(format, &text, clock), "{format}");
        let last = out.last().unwrap();
        assert!(last["rms_s"].as_f64().is_some(), "{format}: {last}");
    }
}

#[test]
fn a_log_followed_while_it_is_written_gives_the_same_readings() {
    let text = ptp4l_log();
    let path = fresh("growing.log");
    std::fs::write(&path, "").unwrap();
    let p2 = path.clone();
    let send = text.clone();
    let writer = std::thread::spawn(move || {
        let mut f = std::fs::OpenOptions::new().append(true).open(&p2).unwrap();
        for c in send.as_bytes().chunks(97) {
            f.write_all(c).unwrap();
            f.flush().unwrap();
            std::thread::sleep(Duration::from_millis(15));
        }
    });
    let out = live(&[
        "--format",
        "ptp4l",
        "--from",
        path.to_str().unwrap(),
        "--follow",
        "--max-seconds",
        "3",
    ]);
    writer.join().unwrap();
    assert_eq!(kept(&out), replay("ptp4l", &text, None));
}

#[test]
fn the_bundled_fixtures_read_live() {
    let dir = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/clock_log/linuxptp_chrony");
    for (file, format) in [
        ("ptp4l.log", "ptp4l"),
        ("phc2sys.log", "phc2sys"),
        ("ts2phc.log", "ts2phc"),
        ("chrony_tracking.log", "chrony-tracking"),
    ] {
        let out = live(&[
            "--format",
            format,
            "--from",
            dir.join(file).to_str().unwrap(),
        ]);
        assert!(out.iter().any(|l| l["kept"] == true), "{file}");
    }
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["clock-live", "--format", "ticc", "--from", "-"])
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
}
