// SPDX-License-Identifier: AGPL-3.0-only
//! Live ADS-B and AIS feeds (L4c): `kshana interference-map record` writes a local receiver's reports
//! into the CSV that `interference-map locate` replays. AIS sentences sent over TCP give the same
//! file as the same sentences read from a file; readsb snapshots give each new position once,
//! whether they come as lines or from a polled `aircraft.json`; and `locate` reads both files.

use std::io::Write;
use std::path::PathBuf;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn fresh(name: &str) -> PathBuf {
    std::env::temp_dir().join(format!(
        "kshana-imap-live-{}-{}-{name}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ))
}

fn kshana() -> Command {
    let mut c = Command::new(env!("CARGO_BIN_EXE_kshana"));
    c.env("KSHANA_LANG", "en");
    c
}

fn put(b: &mut Vec<u8>, v: i64, n: usize) {
    for i in (0..n).rev() {
        b.push(((v >> i) & 1) as u8);
    }
}

/// A type 1 position report payload, armoured.
fn type1(mmsi: i64, lat: f64, lon: f64, sog_tenths: i64) -> String {
    let mut b = Vec::new();
    put(&mut b, 1, 6);
    put(&mut b, 0, 2);
    put(&mut b, mmsi, 30);
    put(&mut b, 0, 12);
    put(&mut b, sog_tenths, 10);
    put(&mut b, 1, 1);
    put(&mut b, (lon * 600_000.0).round() as i64, 28);
    put(&mut b, (lat * 600_000.0).round() as i64, 27);
    let pad = 168 - b.len();
    put(&mut b, 0, pad);
    b.chunks(6)
        .map(|c| {
            let v = c.iter().fold(0u8, |a, &x| (a << 1) | x);
            (if v < 40 { v + 48 } else { v + 56 }) as char
        })
        .collect()
}

fn sentence(body: &str) -> String {
    format!("!{body}*{:02X}", body.bytes().fold(0u8, |a, b| a ^ b))
}

/// Ten vessels for twenty minutes, one report a minute each, with TAG block times; one report in
/// two fragments, one with a bad checksum.
fn ais_lines() -> String {
    let mut s = String::new();
    for minute in 0..20i64 {
        for v in 0..10i64 {
            let t = 1_780_000_000 + minute * 60 + v;
            let p = type1(
                230_000_000 + v,
                59.40 + 0.001 * minute as f64,
                24.70 + 0.01 * v as f64,
                95,
            );
            if minute == 3 && v == 4 {
                let (a, b) = p.split_at(14);
                s += &format!(
                    "\\c:{t}*00\\{}\r\n",
                    sentence(&format!("AIVDM,2,1,5,A,{a},0"))
                );
                s += &format!("{}\r\n", sentence(&format!("AIVDM,2,2,5,A,{b},0")));
            } else if minute == 7 && v == 2 {
                s += &format!(
                    "\\c:{t}*00\\{}\r\n",
                    sentence(&format!("AIVDM,1,1,,B,{p},0")).replace("*", "*F")
                );
            } else {
                s += &format!(
                    "\\c:{t}*00\\{}\r\n",
                    sentence(&format!("AIVDM,1,1,,B,{p},0"))
                );
            }
        }
    }
    s
}

#[test]
fn ais_over_tcp_equals_ais_from_a_file() {
    let lines = ais_lines();
    let file = fresh("ais.nmea");
    std::fs::write(&file, &lines).unwrap();
    let from_file = fresh("file.csv");
    let o = kshana()
        .args(["interference-map", "record", "--source", "ais", "--from"])
        .arg(&file)
        .arg("--out")
        .arg(&from_file)
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let err = String::from_utf8_lossy(&o.stderr);
    assert!(
        err.contains("wrote 199 rows") && err.contains("1 inputs"),
        "{err}"
    );

    let l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let send = lines.clone().into_bytes();
    let h = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        for c in send.chunks(37) {
            s.write_all(c).unwrap();
        }
    });
    let from_tcp = fresh("tcp.csv");
    let o = kshana()
        .args(["interference-map", "record", "--source", "ais", "--from"])
        .arg(format!("tcp:{addr}"))
        .arg("--out")
        .arg(&from_tcp)
        .output()
        .unwrap();
    h.join().unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let a = std::fs::read_to_string(&from_file).unwrap();
    assert_eq!(a, std::fs::read_to_string(&from_tcp).unwrap());
    assert!(a.starts_with(
        "timestamp,vessel_id,lat,lon,sog_kn\n1780000000.000,230000000,59.400000,24.700000,9.5\n"
    ));

    // The file is the replay's input.
    let out = fresh("locate-ais");
    let o = kshana()
        .args(["interference-map", "locate"])
        .arg(&from_tcp)
        .args(["--source", "ais", "--dataset", "custom", "--out"])
        .arg(&out)
        .args([
            "--licence",
            "test",
            "--licence-url",
            "https://example.org",
            "--attribution",
            "test",
        ])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));

    // An existing file is never overwritten.
    let o = kshana()
        .args(["interference-map", "record", "--source", "ais", "--from"])
        .arg(&file)
        .arg("--out")
        .arg(&from_file)
        .output()
        .unwrap();
    assert!(!o.status.success());
}

fn snapshot(now: f64, aircraft: &[(&str, f64, f64, i64, u8, f64)]) -> String {
    let a: Vec<String> = aircraft
        .iter()
        .map(|(hex, lat, lon, alt, nic, seen)| {
            format!(
                r#"{{"hex":"{hex}","type":"adsb_icao","alt_baro":{alt},"lat":{lat},"lon":{lon},"nic":{nic},"nac_p":{nic},"seen_pos":{seen},"rssi":-20.1}}"#
            )
        })
        .collect();
    format!(
        r#"{{"now":{now},"messages":1,"aircraft":[{}]}}"#,
        a.join(",")
    )
}

#[test]
fn readsb_snapshots_from_lines_and_from_a_polled_file() {
    let mut lines = String::new();
    for k in 0..30 {
        let now = 1_780_000_000.0 + f64::from(k);
        lines += &snapshot(
            now,
            &[
                ("4ca1f2", 59.0 + 0.01 * f64::from(k), 24.0, 35_000, 8, 0.4),
                // Seen again without a new position half the time.
                (
                    "abc123",
                    59.5,
                    24.5,
                    20_000,
                    if k > 15 { 2 } else { 8 },
                    f64::from(k % 2) * 1.0 + 0.2,
                ),
            ],
        );
        lines.push('\n');
    }
    let file = fresh("snaps.jsonl");
    std::fs::write(&file, &lines).unwrap();
    let out = fresh("adsb.csv");
    let o = kshana()
        .args([
            "interference-map",
            "record",
            "--source",
            "adsb",
            "--from",
            "-",
            "--out",
        ])
        .arg(&out)
        .stdin(std::fs::File::open(&file).unwrap())
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let csv = std::fs::read_to_string(&out).unwrap();
    assert!(csv.starts_with(
        "timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type\n1779999999.600,4ca1f2,59,24,35000,8,8,adsb_icao\n1779999999.800,abc123,59.5,24.5,20000,8,8,adsb_icao\n"
    ), "{csv}");
    // 30 positions of the first aircraft; the second's position is new on every other snapshot.
    assert_eq!(csv.lines().count(), 1 + 30 + 15);
    let o = kshana()
        .args(["interference-map", "locate"])
        .arg(&out)
        .args(["--source", "adsb", "--dataset", "custom", "--out"])
        .arg(fresh("locate-adsb"))
        .args([
            "--licence",
            "test",
            "--licence-url",
            "https://example.org",
            "--attribution",
            "test",
        ])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));

    // A polled aircraft.json: the same snapshot read again gives no new row.
    let json = fresh("aircraft.json");
    std::fs::write(
        &json,
        snapshot(1_780_000_100.0, &[("4ca1f2", 59.2, 24.1, 30_000, 8, 0.5)]),
    )
    .unwrap();
    let out = fresh("polled.csv");
    let o = kshana()
        .args(["interference-map", "record", "--source", "adsb", "--from"])
        .arg(&json)
        .arg("--out")
        .arg(&out)
        .args(["--poll-s", "0.1", "--max-seconds", "0.5"])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    assert_eq!(
        std::fs::read_to_string(&out).unwrap(),
        "timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type\n1780000099.500,4ca1f2,59.2,24.1,30000,8,8,adsb_icao\n"
    );
}
