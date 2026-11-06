// SPDX-License-Identifier: AGPL-3.0-only
//! Live NATS input (A3b): a loopback server speaking the NATS client protocol publishes a log one row
//! per message, across two subjects, with a header-carrying HMSG and a PING in between. Each subject's
//! records equal `kshana connect map` on that log, the client answers PING with PONG, and a server that
//! refuses the credentials is reported.

use kshana::connect::{map, parse_mapping};
use kshana::connect_mqtt::TopicFeeds;
use kshana::connect_nats::{NatsConfig, NatsSubscriber};
use kshana::obs::{Record, Station};
use std::io::{BufRead, BufReader, Write};
use std::net::TcpListener;
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn epochs_of(r: &[Record], station: &str) -> Vec<serde_json::Value> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) if e.station == station => {
                let mut v = serde_json::to_value(e).unwrap();
                v["station"] = serde_json::Value::Null;
                Some(v)
            }
            _ => None,
        })
        .collect()
}

fn cfg(addr: String) -> NatsConfig {
    NatsConfig {
        addr,
        subject: "gnss.*.raw".into(),
        credentials: Some(("station".into(), "s3cret".into())),
        token: None,
    }
}

#[test]
fn rows_over_two_subjects_give_each_station_the_whole_log() {
    let read = |p: &str| std::fs::read_to_string(root().join(p)).unwrap();
    let mapping = parse_mapping(&read("examples/connect/timing-monitor.connect.toml")).unwrap();
    let station: Station = toml::from_str(&read("examples/obs/station.toml")).unwrap();
    let whole = read("examples/connect/timing-monitor.csv");
    let lines: Vec<String> = whole
        .lines()
        .filter(|l| !l.starts_with('#'))
        .map(String::from)
        .collect();
    let header = lines[0].clone();
    let rows: Vec<String> = lines[1..].to_vec();
    let want = map(&mapping, &whole, &station).unwrap();
    let n = rows.len();

    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let server = std::thread::spawn(move || {
        let (s, _) = l.accept().unwrap();
        let mut w = s.try_clone().unwrap();
        let mut r = BufReader::new(s);
        w.write_all(b"INFO {\"server_id\":\"test\",\"version\":\"2.10.0\",\"headers\":true,\"max_payload\":1048576}\r\n")
            .unwrap();
        let mut line = String::new();
        r.read_line(&mut line).unwrap();
        assert!(line.starts_with("CONNECT {"), "{line}");
        let opts: serde_json::Value = serde_json::from_str(line[8..].trim()).unwrap();
        assert_eq!(
            (opts["user"].as_str(), opts["pass"].as_str()),
            (Some("station"), Some("s3cret"))
        );
        line.clear();
        r.read_line(&mut line).unwrap();
        assert_eq!(line, "SUB gnss.*.raw 1\r\n");
        line.clear();
        r.read_line(&mut line).unwrap();
        assert_eq!(line, "PING\r\n");
        w.write_all(b"PONG\r\n").unwrap();
        for (k, row) in rows.iter().enumerate() {
            for site in ["a", "b"] {
                let subject = format!("gnss.{site}.raw");
                if k == 1 && site == "a" {
                    // A message with headers: HMSG <subject> <sid> <header bytes> <total bytes>.
                    let hdr = "NATS/1.0\r\nX-Station: a\r\n\r\n";
                    let total = hdr.len() + row.len();
                    write!(
                        w,
                        "HMSG {subject} 1 {} {total}\r\n{hdr}{row}\r\n",
                        hdr.len()
                    )
                    .unwrap();
                } else {
                    write!(w, "MSG {subject} 1 {}\r\n{row}\r\n", row.len()).unwrap();
                }
            }
            if k == 2 {
                w.write_all(b"PING\r\n").unwrap();
                line.clear();
                r.read_line(&mut line).unwrap();
                assert_eq!(line, "PONG\r\n", "the client answers the server's PING");
            }
        }
        w.flush().unwrap();
        // Keep the connection open until the client has read everything.
        let mut rest = String::new();
        let _ = r.read_line(&mut rest);
    });

    let mut sub = NatsSubscriber::connect(&cfg(addr)).unwrap();
    let mut feeds = TopicFeeds::new(&mapping, Some(&header))
        .unwrap()
        .label("connect-nats");
    let mut got = Vec::new();
    for _ in 0..2 * n {
        let (subject, payload) = sub.next_message().unwrap().expect("a message");
        assert!(subject == "gnss.a.raw" || subject == "gnss.b.raw");
        got.extend(feeds.push(&subject, &payload, &mapping, &station).unwrap());
    }
    got.extend(feeds.flush(&mapping).unwrap());
    drop(sub);
    server.join().unwrap();
    let base = epochs_of(&want, &station.id);
    assert!(!base.is_empty());
    for site in ["a", "b"] {
        assert_eq!(
            epochs_of(&got, &format!("{}/gnss.{site}.raw", station.id)),
            base,
            "subject gnss.{site}.raw"
        );
    }
    let headers: Vec<_> = got
        .iter()
        .filter_map(|x| match x {
            Record::Header(h) => h.source_format.clone(),
            _ => None,
        })
        .collect();
    assert_eq!(headers, vec!["connect-nats:csv".to_string(); 2]);
}

#[test]
fn refused_credentials_are_reported() {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let t = std::thread::spawn(move || {
        let (s, _) = l.accept().unwrap();
        let mut w = s.try_clone().unwrap();
        let mut r = BufReader::new(s);
        w.write_all(b"INFO {\"auth_required\":true}\r\n").unwrap();
        let mut line = String::new();
        r.read_line(&mut line).unwrap();
        w.write_all(b"-ERR 'Authorization Violation'\r\n").unwrap();
    });
    let e = NatsSubscriber::connect(&cfg(addr)).err().unwrap();
    t.join().unwrap();
    assert!(e.contains("Authorization Violation"), "{e}");
}
