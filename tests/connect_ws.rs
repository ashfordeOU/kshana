// SPDX-License-Identifier: AGPL-3.0-only
//! Live WebSocket input (A3a): the accept key matches the RFC 6455 example, and rows streamed by a
//! loopback server (one fragmented message, a ping between rows, a close at the end) give the same
//! epochs as `kshana connect map` on the whole log.

use kshana::connect::{map, parse_mapping};
use kshana::connect_mqtt::Feed;
use kshana::connect_ws::{accept_key, client_frame, parse_url, WsClient};
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

#[test]
fn accept_key_and_urls() {
    // RFC 6455 section 1.3.
    assert_eq!(
        accept_key("dGhlIHNhbXBsZSBub25jZQ=="),
        "s3pPLMBiTxaQ9kYGzzhZRbK+xOo="
    );
    assert_eq!(
        parse_url("ws://127.0.0.1:9000/feed?rx=1").unwrap(),
        ("127.0.0.1".into(), 9000, "/feed?rx=1".into())
    );
    assert_eq!(
        parse_url("ws://example.org").unwrap(),
        ("example.org".into(), 80, "/".into())
    );
    assert!(parse_url("wss://example.org/").is_err());
    assert!(parse_url("http://example.org/").is_err());
    // A client frame is masked; unmasking with the same key gives the payload back.
    let f = client_frame(0x1, b"hi", [1, 2, 3, 4]);
    assert_eq!(f, vec![0x81, 0x82, 1, 2, 3, 4, b'h' ^ 1, b'i' ^ 2]);
}

fn server_frame(fin: bool, opcode: u8, p: &[u8]) -> Vec<u8> {
    let mut f = vec![if fin { 0x80 } else { 0 } | opcode];
    if p.len() < 126 {
        f.push(p.len() as u8);
    } else {
        f.push(126);
        f.extend((p.len() as u16).to_be_bytes());
    }
    f.extend(p);
    f
}

fn read_client_frame(s: &mut TcpStream) -> (u8, Vec<u8>) {
    let mut h = [0u8; 2];
    s.read_exact(&mut h).unwrap();
    assert!(h[1] & 0x80 != 0, "client frames are masked");
    let n = usize::from(h[1] & 0x7F);
    assert!(n < 126);
    let mut m = [0u8; 4];
    s.read_exact(&mut m).unwrap();
    let mut p = vec![0u8; n];
    s.read_exact(&mut p).unwrap();
    for (i, b) in p.iter_mut().enumerate() {
        *b ^= m[i % 4];
    }
    (h[0] & 0x0F, p)
}

#[test]
fn streamed_rows_give_the_whole_log() {
    let read = |p: &str| std::fs::read_to_string(root().join(p)).unwrap();
    let mapping = parse_mapping(&read("examples/connect/android-raw.connect.toml")).unwrap();
    let station: Station = toml::from_str(&read("examples/obs/station.toml")).unwrap();
    let whole = read("examples/connect/android-raw.csv");
    let want = map(&mapping, &whole, &station).unwrap();
    let lines: Vec<String> = whole.lines().map(str::to_string).collect();
    let n_pre = lines.iter().position(|l| l.starts_with("type,")).unwrap() + 1;
    let header = lines[n_pre - 1].clone();
    let rows: Vec<String> = lines[n_pre..].to_vec();

    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let port = l.local_addr().unwrap().port();
    let server = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let mut req = Vec::new();
        let mut b = [0u8; 1];
        while !req.ends_with(b"\r\n\r\n") {
            s.read_exact(&mut b).unwrap();
            req.push(b[0]);
        }
        let req = String::from_utf8(req).unwrap();
        assert!(req.starts_with("GET /raw HTTP/1.1\r\n"));
        let key = req
            .lines()
            .find_map(|l| l.strip_prefix("Sec-WebSocket-Key: "))
            .unwrap()
            .to_string();
        write!(
            s,
            "HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nsec-websocket-accept: {}\r\n\r\n",
            accept_key(&key)
        )
        .unwrap();
        // The first two rows as one message in two fragments; then a ping; then one row per message.
        let two = format!("{}\n{}\n", rows[0], rows[1]);
        let (a, z) = two.split_at(5);
        s.write_all(&server_frame(false, 0x1, a.as_bytes()))
            .unwrap();
        s.write_all(&server_frame(true, 0x0, z.as_bytes())).unwrap();
        s.write_all(&server_frame(true, 0x9, b"p1")).unwrap();
        let (op, p) = read_client_frame(&mut s);
        assert_eq!(
            (op, p.as_slice()),
            (0xA, &b"p1"[..]),
            "pong echoes the ping"
        );
        for r in &rows[2..] {
            s.write_all(&server_frame(true, 0x2, r.as_bytes())).unwrap();
        }
        s.write_all(&server_frame(true, 0x8, &1000u16.to_be_bytes()))
            .unwrap();
        let (op, _) = read_client_frame(&mut s);
        assert_eq!(op, 0x8, "the close is answered");
    });

    let mut ws = WsClient::connect(&format!("ws://127.0.0.1:{port}/raw")).unwrap();
    let mut feed = Feed::new(&mapping, Some(&header))
        .unwrap()
        .label("connect-ws");
    let mut got = Vec::new();
    while let Some(m) = ws.next_message().unwrap() {
        got.extend(feed.push(&m, &mapping, &station).unwrap());
    }
    got.extend(feed.flush(&mapping, &station).unwrap());
    server.join().unwrap();
    assert_eq!(epochs(&got), epochs(&want));
    let Some(Record::Header(h)) = got.first() else {
        panic!("header first")
    };
    assert_eq!(h.source_format.as_deref(), Some("connect-ws:csv"));
}

#[test]
fn a_bad_accept_key_is_refused() {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let port = l.local_addr().unwrap().port();
    let t = std::thread::spawn(move || {
        let (mut s, _) = l.accept().unwrap();
        let mut req = Vec::new();
        let mut b = [0u8; 1];
        while !req.ends_with(b"\r\n\r\n") {
            s.read_exact(&mut b).unwrap();
            req.push(b[0]);
        }
        s.write_all(b"HTTP/1.1 101 Switching Protocols\r\nSec-WebSocket-Accept: AAAA\r\n\r\n")
            .unwrap();
    });
    assert!(WsClient::connect(&format!("ws://127.0.0.1:{port}/")).is_err());
    t.join().unwrap();
}
