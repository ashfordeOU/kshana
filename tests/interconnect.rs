// SPDX-License-Identifier: AGPL-3.0-only
//! Maritime, aviation and drone readers (roadmap 0.42 I1, I6) against inputs written by independent
//! encoders and checked by independent decoders (`examples/tracks/make_inputs.py`: pyais, pyModeS,
//! pymavlink, pyulog and the CroatiaControl ASTERIX decoder). The values asserted here are the ones the
//! encoders were given, so each test is a round trip through an encoder that shares no code with
//! `src/interconnect/`. The Connect conformance vectors (`conformance/connect/decode-*`, `export-*`,
//! `reader-mavlink-tlog`, `reader-ulog`, `reader-canboat`) pin the full outputs byte for byte.
//!
//! PIN-SCOPE:    decoded positions, identifiers, trust attributes and classes of every sample input; the
//!               read-only MAVLink UDP listener; the ADS-B CSV is read by the interference map
//! PIN-EXCLUDES: recordings from operational equipment (none with a clear licence is used)

use kshana::interconnect::{decode, export, mavlink, Options, Quality};
use std::path::PathBuf;

fn input(name: &str) -> Vec<u8> {
    std::fs::read(
        PathBuf::from(env!("CARGO_MANIFEST_DIR"))
            .join("examples/tracks")
            .join(name),
    )
    .unwrap()
}

fn start() -> Options {
    Options::parse(&[("start".into(), "1700000000".into())]).unwrap()
}

#[test]
fn ais_matches_what_pyais_encoded() {
    let d = decode("ais", &input("ais.nmea"), &Options::default()).unwrap();
    assert_eq!(d.bad_checksum, 1, "the damaged sentence is dropped");
    assert_eq!(d.malformed, 0);
    assert_eq!(d.fixes.len(), 5);
    let f = &d.fixes[0];
    assert_eq!(
        (f.id.as_str(), f.lat_deg, f.lon_deg),
        ("244123456", 51.9071, 4.4721)
    );
    assert_eq!(f.t_unix_s, Some(1_700_000_000.0));
    assert_eq!(f.extra["sog_kn"], 12.3);
    assert_eq!(f.quality["position_accuracy"], 1);
    assert_eq!(f.quality["raim"], 1);
    assert_eq!(f.reported_quality, Quality::Unknown);
    assert_eq!(d.fixes[2].extra["msg_type"], 18);
    assert_eq!(d.fixes[3].quality["epfd"], 1);
    assert_eq!(d.fixes[4].t_unix_s, None, "no TAG block, no time");
    let names: Vec<&str> = d
        .records
        .iter()
        .filter_map(|r| r["name"].as_str())
        .collect();
    assert_eq!(names, ["ROTTERDAM TRADER", "SAILOR", "PLEASURE ONE"]);
    assert_eq!(d.records[0]["destination"], "HAMBURG");
    assert_eq!(d.records[3]["callsign"], "DA1234");
    assert_eq!(d.records[3]["vendor_id"], "ABC");
}

#[test]
fn adsb_avr_and_beast_agree_with_pymodes_and_the_encoded_track() {
    // Encoded positions (53.4210, -6.2480), (53.4220, -6.2460), (53.4230, -6.2440); pyModeS decodes the
    // first and the last to the values below (examples/tracks/adsb.oracle.json).
    for (fmt, file) in [("avr", "adsb.avr"), ("beast", "adsb.beast")] {
        let d = decode(fmt, &input(file), &start()).unwrap();
        assert_eq!(d.fixes.len(), 3, "{fmt}");
        let f = &d.fixes;
        assert!((f[0].lat_deg - 53.421_020_507_8).abs() < 1e-7);
        assert!((f[0].lon_deg + 6.247_989_430_1).abs() < 1e-7);
        assert!((f[1].lat_deg - 53.422).abs() < 1e-4 && (f[1].lon_deg + 6.246).abs() < 1e-4);
        assert!((f[2].lat_deg - 53.423_022_254).abs() < 1e-7);
        // Version 2, NIC-A 0, NACp 9 from the operational status; type codes 11 then 16.
        assert_eq!(f[0].quality["nic"], 8);
        assert_eq!(f[0].quality["nacp"], 9);
        assert_eq!(f[0].reported_quality, Quality::Good);
        assert_eq!(f[1].quality["nic"], 2);
        assert_eq!(f[1].reported_quality, Quality::Degraded);
        assert_eq!(f[0].extra["alt_baro_ft"], 38000.0);
        assert_eq!(f[0].t_unix_s, Some(1_700_000_001.0));
    }
    let d = decode("avr", &input("adsb.avr"), &start()).unwrap();
    assert_eq!(d.bad_checksum, 1);
    assert_eq!(d.records[0]["callsign"], "KLM1023");
}

#[test]
fn asterix_matches_the_croatiacontrol_decoder() {
    let opt = Options::parse(&[
        ("day".into(), "2026-01-02".into()),
        ("radar".into(), "53.0,-6.0,50".into()),
    ])
    .unwrap();
    let d = decode("asterix", &input("asterix.bin"), &opt).unwrap();
    assert_eq!(
        (d.read, d.malformed, d.other),
        (7, 0, 1),
        "CAT034 is stepped over"
    );
    let by = |s: &str| d.fixes.iter().filter(|f| f.source == s).collect::<Vec<_>>();
    let c48 = by("asterix-cat048");
    assert_eq!(c48.len(), 3);
    assert_eq!(c48[0].id, "4CA7B4");
    assert_eq!(c48[0].extra["time_of_day_s"], 36000.0);
    assert_eq!(c48[0].extra["track_number"], 1000);
    assert_eq!(c48[0].quality["detection"], "mode-s-roll-call");
    assert_eq!(c48[0].quality["tentative"], 0);
    // 20 NM at 45 degrees from the radar.
    let (lat, lon) = kshana::interconnect::asterix::from_polar(
        (53.0, -6.0, 50.0),
        20.0 * 1852.0,
        45.0,
        Some(35_000.0 * 0.3048),
    );
    assert!((c48[0].lat_deg - lat).abs() < 1e-6 && (c48[0].lon_deg - lon).abs() < 1e-6);
    assert!((lat - 53.2249).abs() < 1e-3, "{lat}");
    let c10 = by("asterix-cat010");
    assert_eq!(c10.len(), 2);
    assert_eq!((c10[0].lat_deg, c10[0].lon_deg), (52.3086, 4.7639));
    assert_eq!(c10[0].quality["detection"], "ads-b");
    assert_eq!(c10[0].quality["sd_x_m"], 2.0);
    let c62 = by("asterix-cat062");
    assert_eq!(c62.len(), 2);
    assert_eq!(c62[0].id, "4CA7B5");
    assert!((c62[1].lat_deg - 53.01).abs() < 6e-6);
    assert_eq!(c62[0].quality["tentative"], 1);
    assert_eq!(c62[0].quality["coasting"], 1);
    assert_eq!(c62[0].quality["sd_x_m"], 15.0);
    assert_eq!(c62[0].t_unix_s, Some(1_767_312_000.0 + 36_020.0));
}

#[test]
fn opensky_and_canboat() {
    let d = decode(
        "opensky-csv",
        &input("opensky-states.csv"),
        &Options::default(),
    )
    .unwrap();
    assert_eq!(d.fixes.len(), 2);
    assert_eq!(d.fixes[1].reported_quality, Quality::Degraded);
    let d = decode(
        "opensky-json",
        &input("opensky-states.json"),
        &Options::default(),
    )
    .unwrap();
    assert_eq!(d.fixes[1].reported_quality, Quality::Good);
    let d = decode("canboat", &input("n2k-canboat.jsonl"), &Options::default()).unwrap();
    assert_eq!(d.fixes.len(), 4, "the 'no GNSS' epoch gives no fix");
    assert_eq!(d.fixes[0].quality["integrity"], "Safe");
    assert_eq!(d.fixes[3].reported_quality, Quality::Degraded);
}

#[test]
fn mavlink_tlog_matches_pymavlink() {
    let d = decode("mavlink-tlog", &input("flight.tlog"), &Options::default()).unwrap();
    assert_eq!(
        (d.read, d.bad_checksum, d.other),
        (16, 0, 4),
        "4 heartbeats stepped over"
    );
    let g1: Vec<_> = d.fixes.iter().filter(|f| f.id == "sys1/gps1").collect();
    let g2: Vec<_> = d.fixes.iter().filter(|f| f.id == "sys1/gps2").collect();
    assert_eq!((g1.len(), g2.len()), (4, 4));
    assert_eq!((g1[0].lat_deg, g1[0].lon_deg), (47.397742, 8.545594));
    assert_eq!(g1[0].alt_m, Some(488.0));
    assert_eq!(g1[0].quality["hdop"], 0.9);
    assert_eq!(g1[0].quality["h_acc_m"], 1.2);
    assert_eq!(g1[3].quality["fix_type"], 2);
    assert_eq!(g1[3].reported_quality, Quality::Degraded);
    assert_eq!(g2[0].quality["h_acc_m"], 1.5);
    let tl = kshana::interconnect::obs_timeline("mavlink-tlog", &input("flight.tlog"))
        .unwrap()
        .unwrap();
    assert_eq!(tl.epochs.len(), 4);
    assert_eq!(tl.epochs[0].cn0.len(), 5, "PRN 29 has no SNR");
    assert!(
        tl.epochs[3].fix.is_none(),
        "a 2D fix is not a receiver position"
    );
}

#[test]
fn ulog_matches_pyulog() {
    let d = decode("ulog", &input("flight.ulg"), &Options::default()).unwrap();
    assert_eq!(d.fixes.len(), 4);
    assert_eq!(d.fixes[0].lat_deg, 47.3977419);
    assert_eq!(d.fixes[0].quality["jamming_indicator"], 35);
    assert_eq!(d.fixes[2].quality["jamming_state"], 2);
    assert_eq!(d.fixes[2].reported_quality, Quality::Degraded);
    assert_eq!(d.fixes[0].t_unix_s, Some(1_700_000_100.0));
    let tl = kshana::interconnect::obs_timeline("ulog", &input("flight.ulg"))
        .unwrap()
        .unwrap();
    assert_eq!(tl.epochs.len(), 5);
    assert_eq!(tl.epochs[3].self_report.unwrap().spoofing, Some(2));
}

#[test]
fn every_export_round_trips_the_fixes() {
    let d = decode("ulog", &input("flight.ulg"), &Options::default()).unwrap();
    let back = export::read_geojson(&export::geojson(&d.fixes)).unwrap();
    assert_eq!(back, d.fixes);
    let d = decode("avr", &input("adsb.avr"), &start()).unwrap();
    let c: serde_json::Value = serde_json::from_str(&export::czml(&d.fixes)).unwrap();
    let s = c[1]["position"]["cartographicDegrees"].as_array().unwrap();
    for (k, f) in d.fixes.iter().enumerate() {
        assert_eq!(s[4 * k + 1].as_f64(), Some(f.lon_deg));
        assert_eq!(s[4 * k + 2].as_f64(), Some(f.lat_deg));
    }
    let k = export::kml(&d.fixes);
    for f in &d.fixes {
        assert!(k.contains(&format!("<coordinates>{},{}", f.lon_deg, f.lat_deg)));
    }
}

#[test]
fn the_adsb_csv_is_read_by_the_interference_map() {
    use kshana::interference_map::adsb::{AdsbAggregator, AdsbParams};
    use kshana::interference_map::grid::Grid;
    use kshana::interference_map::IdHasher;
    let d = decode("avr", &input("adsb.avr"), &start()).unwrap();
    let csv = kshana::interconnect::to_adsb_csv(&d);
    let mut agg = AdsbAggregator::new(
        Grid::new(0.5).unwrap(),
        AdsbParams::PREREGISTERED_V1,
        IdHasher::new(),
    );
    agg.read_csv(&csv).unwrap();
    assert_eq!(agg.stats.rows, 3);
    assert_eq!(agg.stats.rejected_malformed, 0);
}

#[test]
fn the_mavlink_listener_receives_and_sends_nothing() {
    let rx = std::net::UdpSocket::bind("127.0.0.1:0").unwrap();
    rx.set_read_timeout(Some(std::time::Duration::from_secs(5)))
        .unwrap();
    let addr = rx.local_addr().unwrap();
    let tx = std::net::UdpSocket::bind("127.0.0.1:0").unwrap();
    tx.set_read_timeout(Some(std::time::Duration::from_millis(300)))
        .unwrap();
    // The .tlog without its times: each frame is one datagram.
    let tlog = input("flight.tlog");
    let mut i = 0;
    let mut frames = Vec::new();
    while i + 8 < tlog.len() {
        match mavlink::frame_at(&tlog, i + 8) {
            mavlink::At::Good(_, n) | mavlink::At::Unknown(n) => {
                frames.push(tlog[i + 8..i + 8 + n].to_vec());
                i += 8 + n;
            }
            _ => panic!("the sample log is framed"),
        }
    }
    let sender = std::thread::spawn(move || {
        for f in frames {
            tx.send_to(&f, addr).unwrap();
        }
        // Nothing comes back to the sender.
        let mut buf = [0u8; 64];
        tx.recv_from(&mut buf).is_err()
    });
    let mut seen = 0;
    let d = mavlink::listen(&rx, Some(8), |_| seen += 1).unwrap();
    assert_eq!(d.fixes.len(), 8);
    assert_eq!(seen, 8);
    assert!(sender.join().unwrap(), "the listener sent a datagram");
}

#[test]
fn the_command_line_decodes_and_names_its_usage() {
    let bin = env!("CARGO_BIN_EXE_kshana");
    let root = env!("CARGO_MANIFEST_DIR");
    let o = std::process::Command::new(bin)
        .current_dir(root)
        .env("KSHANA_LANG", "en")
        .args([
            "connect",
            "decode",
            "examples/tracks/flight.ulg",
            "--format",
            "ulog",
            "--to",
            "geojson",
        ])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let v: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(v["type"], "FeatureCollection");
    assert!(String::from_utf8_lossy(&o.stderr).contains("5 messages read: 4 fixes"));
    let o = std::process::Command::new(bin)
        .env("KSHANA_LANG", "en")
        .args(["connect", "decode"])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(2));
    let o = std::process::Command::new(bin)
        .current_dir(root)
        .env("KSHANA_LANG", "en")
        .args([
            "connect",
            "decode",
            "examples/tracks/flight.ulg",
            "--format",
            "gpx",
        ])
        .output()
        .unwrap();
    assert_eq!(o.status.code(), Some(1));
    assert!(String::from_utf8_lossy(&o.stderr).contains("unknown track format gpx"));
}
