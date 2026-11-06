// SPDX-License-Identifier: AGPL-3.0-only
//! Live MQTT subscription (A3a): rows published one message at a time to a loopback broker give the
//! same epochs as `kshana connect map` on the whole log, with QoS 1 messages acknowledged and the
//! feed trimming emitted rows without moving the clock.

use kshana::connect::{map, parse_mapping};
use kshana::connect_mqtt::{connect_packet, subscribe_packet, Feed, MqttConfig, Subscriber};
use kshana::obs::{Record, Station};
use std::io::{Read, Write};
use std::net::{TcpListener, TcpStream};
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn epochs(r: &[Record]) -> Vec<String> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) => Some(serde_json::to_string(e).unwrap()),
            _ => None,
        })
        .collect()
}

fn read_packet(s: &mut TcpStream) -> (u8, Vec<u8>) {
    let mut first = [0u8; 1];
    s.read_exact(&mut first).unwrap();
    let (mut len, mut k) = (0usize, 0);
    loop {
        let mut b = [0u8; 1];
        s.read_exact(&mut b).unwrap();
        len |= usize::from(b[0] & 0x7F) << (7 * k);
        k += 1;
        if b[0] & 0x80 == 0 {
            break;
        }
    }
    let mut body = vec![0u8; len];
    s.read_exact(&mut body).unwrap();
    (first[0], body)
}

fn publish(topic: &str, payload: &str, qos1_id: Option<u16>) -> Vec<u8> {
    let mut body = (topic.len() as u16).to_be_bytes().to_vec();
    body.extend(topic.as_bytes());
    if let Some(id) = qos1_id {
        body.extend(id.to_be_bytes());
    }
    body.extend(payload.as_bytes());
    assert!(body.len() < 16_384);
    let mut p = vec![if qos1_id.is_some() { 0x32 } else { 0x30 }];
    let n = body.len();
    if n < 128 {
        p.push(n as u8);
    } else {
        p.extend([(n % 128) as u8 | 0x80, (n / 128) as u8]);
    }
    p.extend(body);
    p
}

fn cfg(addr: String) -> MqttConfig {
    MqttConfig {
        addr,
        client_id: "kshana-test".into(),
        topic: "gnss/+/raw".into(),
        qos: 1,
        credentials: Some(("station".into(), "s3cret".into())),
        keep_alive_s: 30,
    }
}

#[test]
fn packets_follow_mqtt_3_1_1() {
    let c = connect_packet(&cfg("x:1".into()));
    // type CONNECT, protocol name and level 4, flags: user name, password, clean session.
    assert_eq!(c[0], 0x10);
    assert_eq!(&c[2..10], &[0, 4, b'M', b'Q', b'T', b'T', 4, 0xC2]);
    assert_eq!(&c[10..12], &30u16.to_be_bytes());
    let tail = [
        &[0u8, 11][..],
        b"kshana-test",
        &[0, 7],
        b"station",
        &[0, 6],
        b"s3cret",
    ]
    .concat();
    assert_eq!(&c[12..], &tail[..]);
    assert_eq!(usize::from(c[1]), c.len() - 2);
    let s = subscribe_packet(1, "a/#", 1);
    assert_eq!(s, vec![0x82, 8, 0, 1, 0, 3, b'a', b'/', b'#', 1]);
}

#[test]
fn rows_published_one_by_one_give_the_whole_log() {
    let read = |p: &str| std::fs::read_to_string(root().join(p)).unwrap();
    let mapping = parse_mapping(&read("examples/connect/android-raw.connect.toml")).unwrap();
    let station: Station = toml::from_str(&read("examples/obs/station.toml")).unwrap();
    let whole = read("examples/connect/android-raw.csv");
    let want = map(&mapping, &whole, &station).unwrap();
    let lines: Vec<String> = whole.lines().map(str::to_string).collect();
    let n_pre = lines.iter().position(|l| l.starts_with("type,")).unwrap() + 1;
    let header = lines[n_pre - 1].clone();
    let rows: Vec<String> = lines[n_pre..].to_vec();
    let n = rows.len();

    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let broker = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let (t, _) = read_packet(&mut s);
        assert_eq!(t, 0x10);
        s.write_all(&[0x20, 2, 0, 0]).unwrap();
        let (t, body) = read_packet(&mut s);
        assert_eq!(t, 0x82);
        assert_eq!(&body[..2], &[0, 1]);
        s.write_all(&[0x90, 3, 0, 1, 1]).unwrap();
        let mut acks = Vec::new();
        for (k, r) in rows.iter().enumerate() {
            let id = (k % 2 == 1).then_some(k as u16 + 100);
            s.write_all(&publish("gnss/rx1/raw", &format!("{r}\r\n"), id))
                .unwrap();
            if let Some(id) = id {
                let (t, body) = read_packet(&mut s);
                assert_eq!(t, 0x40);
                assert_eq!(body, id.to_be_bytes());
                acks.push(id);
            }
        }
        let (t, _) = read_packet(&mut s);
        assert_eq!(t, 0xE0, "DISCONNECT at the end");
        acks.len()
    });

    let mut sub = Subscriber::connect(&cfg(addr)).unwrap();
    // Trim after three held lines, so the trimming path runs on this short log.
    let mut feed = Feed::new(&mapping, Some(&header)).unwrap().keep_lines(3);
    let mut got = Vec::new();
    let mut headers = 0;
    let mut seen = 0;
    while seen < n {
        if let Some(p) = sub.next_payload().unwrap() {
            seen += 1;
            let r = feed.push(&p, &mapping, &station).unwrap();
            headers += r.iter().filter(|x| matches!(x, Record::Header(_))).count();
            got.extend(r);
        }
    }
    let held = epochs(&got).len();
    got.extend(feed.flush(&mapping, &station).unwrap());
    sub.disconnect();
    assert_eq!(broker.join().unwrap(), n / 2);
    assert_eq!(headers, 1);
    assert_eq!(epochs(&want).len(), held + 1, "only the last epoch is held");
    assert_eq!(epochs(&got), epochs(&want));
    let Some(Record::Header(h)) = got.first() else {
        panic!("header first")
    };
    assert_eq!(h.source_format.as_deref(), Some("connect-mqtt:csv"));
}

#[test]
fn a_refused_connection_and_a_csv_feed_without_header_are_errors() {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let t = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let _ = read_packet(&mut s);
        s.write_all(&[0x20, 2, 0, 5]).unwrap(); // not authorised
    });
    let e = Subscriber::connect(&cfg(addr)).err().unwrap();
    t.join().unwrap();
    assert!(e.contains('5'), "{e}");
    let mapping = parse_mapping(
        &std::fs::read_to_string(root().join("examples/connect/android-raw.connect.toml")).unwrap(),
    )
    .unwrap();
    assert!(Feed::new(&mapping, None).is_err());
}
