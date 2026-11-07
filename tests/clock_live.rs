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

fn ticc_log() -> String {
    let mut s = String::from("# TICC start-up menu text\nTimestamp mode\n");
    let mut t: i128 = 3_000_000 * 1_000_000_000_000_000; // 3e5 s after power-up, in fs
    for k in 0..80i128 {
        // 1 s ticks with a few ns of wander, chB interleaved, one tick missing.
        if k == 40 {
            t += 1_000_000_000_000_000;
            continue;
        }
        let wander = (k * 7919 % 2000) - 1000; // fs * 1e3 below
        let v = t + wander * 1000;
        s += &format!(
            "{}.{:012} chA\n",
            v / 1_000_000_000_000_000,
            (v % 1_000_000_000_000_000) / 1000
        );
        s += &format!("{}.{:012} chB\n", v / 1_000_000_000_000_000 + 7, 0);
        t += 1_000_000_000_000_000;
    }
    s
}

#[test]
fn a_ticc_channel_live_equals_its_replay() {
    let text = ticc_log();
    let path = fresh("ticc.txt");
    std::fs::write(&path, &text).unwrap();
    let out = live(&[
        "--format",
        "ticc",
        "--from",
        path.to_str().unwrap(),
        "--clock",
        "chA",
        "--tau0",
        "1",
    ]);
    let inp = ClockLogInput {
        format: "ticc".into(),
        text: Some(text.clone()),
        channel: Some("chA".into()),
        tau0_s: Some(1.0),
        ..Default::default()
    };
    let p = parse(ClockLogFormat::Ticc, &text, &inp, GapPolicy::Linear).unwrap();
    assert_eq!(p.n_missing, 1);
    // The replay fills the one missing tick; the kept live readings are the others, bit for bit.
    let replay: Vec<f64> = p
        .phase_s
        .iter()
        .enumerate()
        .filter(|(i, _)| *i != 40)
        .map(|(_, x)| *x)
        .collect();
    let got = kept(&out);
    assert_eq!(got.len(), replay.len());
    for (a, b) in got.iter().zip(&replay) {
        assert_eq!(a.to_bits(), b.to_bits());
    }
    // Without --tau0 the live reader refuses.
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["clock-live", "--format", "ticc", "--from"])
        .arg(&path)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
    assert!(String::from_utf8_lossy(&o.stderr).contains("--tau0"));
}

#[test]
fn sensor_live_imu_followed_equals_the_replay() {
    // The first time stamp of a EuRoC-style log, in nanoseconds: any large count works; only the
    // differences from it are read.
    const EUROC_T0_NS: u64 = 1_400_000_000 * 1_000_000_000;
    use kshana::receiver_trust::machines::imu::{gyro_heading, read_imu, ImuFormat};
    let mut text = String::from("#timestamp [ns],w_RS_S_x [rad s^-1],w_RS_S_y [rad s^-1],w_RS_S_z [rad s^-1],a_RS_S_x [m s^-2],a_RS_S_y [m s^-2],a_RS_S_z [m s^-2]\n");
    for k in 0..300u64 {
        let z = ((k as f64) * 0.05).sin() * 0.3;
        text += &format!(
            "{},0.01,-0.02,{z},0.3,0.1,9.80\n",
            EUROC_T0_NS + k * 5_000_000
        );
    }
    let path = fresh("imu.csv");
    std::fs::write(&path, "").unwrap();
    let (p2, send) = (path.clone(), text.clone());
    let w = std::thread::spawn(move || {
        let mut f = std::fs::OpenOptions::new().append(true).open(&p2).unwrap();
        for c in send.as_bytes().chunks(211) {
            f.write_all(c).unwrap();
            f.flush().unwrap();
            std::thread::sleep(Duration::from_millis(5));
        }
    });
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args([
            "sensor-live",
            "--kind",
            "imu",
            "--format",
            "euroc",
            "--follow",
            "--max-seconds",
            "2.5",
            "--heading0",
            "90",
            "--from",
        ])
        .arg(&path)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    w.join().unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let got: Vec<serde_json::Value> = String::from_utf8(o.stdout)
        .unwrap()
        .lines()
        .map(|l| serde_json::from_str(l).unwrap())
        .collect();
    let replay = read_imu(ImuFormat::Euroc, &text).unwrap();
    let heading = gyro_heading(&replay, 90.0, true);
    assert_eq!(got.len(), replay.len());
    for ((g, r), h) in got.iter().zip(&replay).zip(&heading) {
        assert_eq!(g["t_s"].as_f64().unwrap().to_bits(), r.t_s.to_bits());
        assert_eq!(g["heading_deg"].as_f64().unwrap().to_bits(), h.1.to_bits());
    }
}
