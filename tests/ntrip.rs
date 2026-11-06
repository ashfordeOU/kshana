// SPDX-License-Identifier: AGPL-3.0-only
//! NTRIP client (L4a): against a loopback caster, an NTRIP 2 stream with chunked transfer encoding
//! and an NTRIP 1 (`ICY`) stream both arrive byte for byte, the credentials and the position reach
//! the caster as the protocol carries them, a refusal and an unknown mountpoint are reported, and the
//! RTCM 3 frame count does not depend on where the stream is cut.

use kshana::ntrip::{gga, Answer, NtripConfig, NtripStream, RtcmCounter};
use std::io::{BufRead, BufReader, Read, Write};
use std::net::{TcpListener, TcpStream};
use std::sync::atomic::{AtomicU64, Ordering};

static SEQ: AtomicU64 = AtomicU64::new(0);

/// An RTCM 3 frame for message `msg` with `body_len` bytes of body (CRC-24Q computed here, bit by bit).
fn frame(msg: u16, body_len: usize, corrupt: bool) -> Vec<u8> {
    let mut body = vec![(msg >> 4) as u8, ((msg & 0xF) << 4) as u8];
    body.extend((0..body_len.saturating_sub(2)).map(|i| (i * 37 % 251) as u8));
    let mut f = vec![0xD3, (body.len() >> 8) as u8 & 0x03, body.len() as u8];
    f.extend(&body);
    let mut crc: u32 = 0;
    for &b in &f {
        crc ^= u32::from(b) << 16;
        for _ in 0..8 {
            crc <<= 1;
            if crc & 0x100_0000 != 0 {
                crc ^= 0x186_4CFB;
            }
        }
    }
    let crc = (crc & 0xFF_FFFF) ^ u32::from(corrupt);
    f.extend([(crc >> 16) as u8, (crc >> 8) as u8, crc as u8]);
    f
}

/// 40 frames of four message types, one with a bad CRC, and some noise between frames.
fn payload() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..40u16 {
        let msg = [1005, 1077, 1087, 1097][usize::from(k % 4)];
        v.extend(frame(msg, 20 + usize::from(k) * 7, k == 17));
        if k % 9 == 0 {
            v.extend([0x00, 0xFF, 0x42]);
        }
    }
    v
}

fn caster(
    reply: impl FnOnce(&mut TcpStream, Vec<String>) + Send + 'static,
) -> (String, std::thread::JoinHandle<()>) {
    let l = TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let h = std::thread::spawn(move || {
        let (s, _) = l.accept().unwrap();
        let mut r = BufReader::new(s.try_clone().unwrap());
        let mut head = Vec::new();
        loop {
            let mut line = String::new();
            r.read_line(&mut line).unwrap();
            if line == "\r\n" || line.is_empty() {
                break;
            }
            head.push(line.trim_end().to_string());
        }
        let mut s = s;
        reply(&mut s, head);
    });
    (addr, h)
}

fn cfg(addr: String, mount: &str) -> NtripConfig {
    NtripConfig {
        addr,
        mountpoint: mount.into(),
        credentials: Some(("rover".into(), "s3cret".into())),
        gga: Some(gga(59.4375, 24.7536, 30.0)),
    }
}

#[test]
fn ntrip2_chunked_arrives_byte_for_byte_with_auth_and_position() {
    let data = payload();
    let send = data.clone();
    let (addr, h) = caster(move |s, head| {
        assert_eq!(head[0], "GET /TLL00EST0 HTTP/1.1");
        assert!(head.contains(&"Ntrip-Version: Ntrip/2.0".to_string()));
        // Basic "rover:s3cret".
        assert!(
            head.contains(&"Authorization: Basic cm92ZXI6czNjcmV0".to_string()),
            "{head:?}"
        );
        assert!(head
            .iter()
            .any(|l| l.starts_with("Ntrip-GGA: $GPGGA,000000.00,5926.2500,N,02445.2160,E")));
        s.write_all(
            b"HTTP/1.1 200 OK\r\nContent-Type: gnss/data\r\nTransfer-Encoding: chunked\r\n\r\n",
        )
        .unwrap();
        // Chunks that cut frames in the middle.
        for c in send.chunks(37) {
            write!(s, "{:x}\r\n", c.len()).unwrap();
            s.write_all(c).unwrap();
            s.write_all(b"\r\n").unwrap();
        }
        s.write_all(b"0\r\n\r\n").unwrap();
    });
    let mut st = NtripStream::open(&cfg(addr, "TLL00EST0")).unwrap();
    assert_eq!(st.answer, Answer::Ntrip2 { chunked: true });
    let mut got = Vec::new();
    st.read_to_end(&mut got).unwrap();
    h.join().unwrap();
    assert_eq!(got, data);
}

#[test]
fn ntrip1_icy_sends_the_position_after_the_request() {
    let data = payload();
    let send = data.clone();
    let (addr, h) = caster(move |s, head| {
        assert_eq!(head[0], "GET /RTCM3 HTTP/1.1");
        s.write_all(b"ICY 200 OK\r\n").unwrap();
        // An NTRIP 1 rover then sends its GGA as a line.
        let mut r = BufReader::new(s.try_clone().unwrap());
        let mut line = String::new();
        r.read_line(&mut line).unwrap();
        assert!(
            line.starts_with("$GPGGA,") && line.ends_with("\r\n"),
            "{line:?}"
        );
        s.write_all(&send).unwrap();
    });
    let mut st = NtripStream::open(&cfg(addr, "RTCM3")).unwrap();
    assert_eq!(st.answer, Answer::Ntrip1);
    let mut got = Vec::new();
    st.read_to_end(&mut got).unwrap();
    h.join().unwrap();
    assert_eq!(got, data);
}

#[test]
fn refusals_are_reported() {
    let (addr, h) = caster(|s, _| {
        s.write_all(b"HTTP/1.1 401 Unauthorized\r\nWWW-Authenticate: Basic realm=\"x\"\r\n\r\n")
            .unwrap();
    });
    let e = NtripStream::open(&cfg(addr, "M")).err().unwrap();
    h.join().unwrap();
    assert!(e.contains("401"), "{e}");

    let (addr, h) = caster(|s, _| {
        s.write_all(b"SOURCETABLE 200 OK\r\nContent-Type: text/plain\r\n\r\nSTR;OTHER;...\r\nENDSOURCETABLE\r\n").unwrap();
    });
    let e = NtripStream::open(&cfg(addr, "MISSING")).err().unwrap();
    h.join().unwrap();
    assert!(e.contains("MISSING"), "{e}");

    // With no mountpoint, the source table is the answer and is read as the body.
    let (addr, h) = caster(|s, head| {
        assert_eq!(head[0], "GET / HTTP/1.1");
        s.write_all(b"HTTP/1.1 200 OK\r\nContent-Type: gnss/sourcetable\r\n\r\nSTR;TLL00EST0;Tallinn;RTCM 3.3;...\r\nENDSOURCETABLE\r\n").unwrap();
    });
    let mut st = NtripStream::open(&cfg(addr, "")).unwrap();
    assert_eq!(st.answer, Answer::SourceTable);
    let mut table = String::new();
    st.read_to_string(&mut table).unwrap();
    h.join().unwrap();
    assert!(table.contains("STR;TLL00EST0;"));
}

#[test]
fn the_frame_count_does_not_depend_on_where_the_stream_is_cut() {
    let data = payload();
    let mut whole = RtcmCounter::default();
    whole.push(&data);
    assert_eq!((whole.frames, whole.bad_crc), (39, 1));
    assert_eq!(whole.messages.values().sum::<u64>(), 39);
    for size in [1usize, 2, 5, 13, 64, 1000] {
        let mut c = RtcmCounter::default();
        for part in data.chunks(size) {
            c.push(part);
        }
        assert_eq!(
            (c.frames, c.bad_crc, &c.messages),
            (whole.frames, whole.bad_crc, &whole.messages),
            "chunks of {size}"
        );
    }
}

#[test]
fn the_command_writes_the_stream_to_a_file_and_counts_it() {
    let data = payload();
    let send = data.clone();
    let (addr, h) = caster(move |s, _| {
        s.write_all(b"HTTP/1.1 200 OK\r\nContent-Type: gnss/data\r\n\r\n")
            .unwrap();
        s.write_all(&send).unwrap();
    });
    let out = std::env::temp_dir().join(format!(
        "kshana-ntrip-{}-{}.rtcm3",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(["ntrip", &addr, "--mount", "TLL00EST0", "--out"])
        .arg(&out)
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    h.join().unwrap();
    let err = String::from_utf8_lossy(&o.stderr);
    assert!(o.status.success(), "{err}");
    assert_eq!(std::fs::read(&out).unwrap(), data);
    assert!(
        err.contains("39 RTCM 3 frames with a valid CRC, 1 with a bad CRC"),
        "{err}"
    );
    assert!(err.contains("1005x10") && err.contains("1077x"), "{err}");
    let _ = std::fs::remove_file(&out);
}
