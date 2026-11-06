// SPDX-License-Identifier: AGPL-3.0-only
//! Live receiver logs (L4a): the same bytes fed as a live stream, in chunks of any size, give the
//! epochs of a replay of the whole recording, byte for byte, while the decoder holds a bounded window.
//! Checked on a synthetic UBX stream (with junk between frames), the bundled NMEA jamming log and the
//! RINEX 4 conformance file.

use kshana::obs::{from_log, Record, Station};
use kshana::obs_live::LiveObs;
use std::path::Path;

fn root() -> &'static Path {
    Path::new(env!("CARGO_MANIFEST_DIR"))
}

fn station() -> Station {
    toml::from_str(&std::fs::read_to_string(root().join("examples/obs/station.toml")).unwrap())
        .unwrap()
}

fn ubx(class: u8, id: u8, payload: &[u8]) -> Vec<u8> {
    let mut f = vec![0xB5, 0x62, class, id];
    f.extend((payload.len() as u16).to_le_bytes());
    f.extend(payload);
    let (mut a, mut b) = (0u8, 0u8);
    for &x in &f[2..] {
        a = a.wrapping_add(x);
        b = b.wrapping_add(a);
    }
    f.extend([a, b]);
    f
}

/// 120 epochs of NAV-PVT and NAV-SAT, one second apart, C/N0 dropping in the middle, with junk bytes
/// and an unrelated message between some frames.
fn ubx_stream() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..120u32 {
        let itow = 345_600_000 + k * 1000;
        let mut p = vec![0u8; 92];
        p[..4].copy_from_slice(&itow.to_le_bytes());
        p[4..6].copy_from_slice(&2026u16.to_le_bytes());
        p[6] = 11;
        p[7] = 6;
        p[8] = 12;
        p[9] = (k / 60) as u8;
        p[10] = (k % 60) as u8;
        p[11] = 0b11;
        p[20] = 3;
        p[23] = 8;
        p[24..28].copy_from_slice(&(247_500_000i32 + k as i32).to_le_bytes());
        p[28..32].copy_from_slice(&(594_400_000i32).to_le_bytes());
        v.extend(ubx(0x01, 0x07, &p));
        let cno = if (40..70).contains(&k) { 28 } else { 44 };
        let mut s = vec![0u8; 8 + 12 * 8];
        s[..4].copy_from_slice(&itow.to_le_bytes());
        s[5] = 8;
        for sv in 0..8usize {
            let b = &mut s[8 + sv * 12..20 + sv * 12];
            b[1] = sv as u8 + 1;
            b[2] = cno - (sv as u8 % 3);
            b[3] = 40;
        }
        v.extend(ubx(0x01, 0x35, &s));
        if k % 17 == 0 {
            v.extend([0x00, 0x13, 0xB5, 0x00]); // junk, including a false sync byte
        }
        if k % 23 == 0 {
            v.extend(ubx(0x0A, 0x04, &[1, 2, 3, 4])); // MON-VER-like message the reader ignores
        }
    }
    v
}

fn epochs(r: &[Record]) -> Vec<String> {
    r.iter()
        .filter_map(|x| match x {
            Record::Epoch(e) => Some(serde_json::to_string(e).unwrap()),
            _ => None,
        })
        .collect()
}

/// Deterministic chunk sizes from a seed (1..=max).
fn chunks(bytes: &[u8], seed: u64, max: usize) -> Vec<&[u8]> {
    let mut s = seed;
    let mut out = Vec::new();
    let mut i = 0;
    while i < bytes.len() {
        s ^= s << 13;
        s ^= s >> 7;
        s ^= s << 17;
        let n = 1 + (s as usize) % max;
        out.push(&bytes[i..(i + n).min(bytes.len())]);
        i += n;
    }
    out
}

fn check(format: &str, bytes: &[u8]) {
    let st = station();
    let replay = epochs(&from_log(format, bytes, &st).unwrap());
    assert!(replay.len() >= 3, "{format}: the sample has epochs");
    for (seed, max) in [(1u64, 1usize), (7, 17), (42, 400), (99, 5000)] {
        let mut live = LiveObs::new(format, &st).unwrap().keep_frames(8);
        let mut got = Vec::new();
        let mut held_max = 0;
        for c in chunks(bytes, seed, max) {
            got.extend(live.push(c).unwrap());
            held_max = held_max.max(live.frames_held());
        }
        got.extend(live.flush().unwrap());
        assert_eq!(
            epochs(&got),
            replay,
            "{format}: chunks up to {max} (seed {seed})"
        );
        let headers = got
            .iter()
            .filter(|r| matches!(r, Record::Header(_)))
            .count();
        assert_eq!(headers, 1, "{format}: one header");
        assert!(
            held_max < 400,
            "{format}: the window stays bounded (held at most {held_max} frames)"
        );
    }
}

#[test]
fn ubx_live_equals_replay() {
    check("ubx", &ubx_stream());
}

#[test]
fn nmea_live_equals_replay() {
    check(
        "nmea",
        &std::fs::read(root().join("examples/receiver-trust/illustrative-jamming.nmea")).unwrap(),
    );
}

#[test]
fn rinex_live_equals_replay() {
    check(
        "rinex",
        &std::fs::read(root().join("conformance/connect/reader-rinex4/input.rnx")).unwrap(),
    );
}

#[test]
fn the_command_reads_a_receiver_over_tcp() {
    let bytes = ubx_stream();
    let replay = epochs(&from_log("ubx", &bytes, &station()).unwrap());
    let l = std::net::TcpListener::bind("127.0.0.1:0").unwrap();
    let addr = l.local_addr().unwrap().to_string();
    let send = bytes.clone();
    let h = std::thread::spawn(move || {
        use std::io::Write;
        let (mut s, _) = l.accept().unwrap();
        for c in send.chunks(333) {
            s.write_all(c).unwrap();
        }
    });
    let o = std::process::Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args([
            "obs",
            "live",
            &format!("tcp:{addr}"),
            "--format",
            "ubx",
            "--station",
        ])
        .arg(root().join("examples/obs/station.toml"))
        .env("KSHANA_LANG", "en")
        .output()
        .unwrap();
    h.join().unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let text = String::from_utf8(o.stdout).unwrap();
    let (_, rep) = kshana::obs::check(&text).unwrap();
    assert_eq!(rep.epochs, replay.len());
    let got: Vec<String> = text
        .lines()
        .skip(1)
        .map(|l| {
            let v: serde_json::Value = serde_json::from_str(l).unwrap();
            serde_json::to_string(&v["epoch"].clone()).unwrap()
        })
        .collect();
    let want: Vec<String> = replay
        .iter()
        .map(|e| {
            let v: serde_json::Value = serde_json::from_str(e).unwrap();
            serde_json::to_string(&v["epoch"].clone()).unwrap()
        })
        .collect();
    assert_eq!(got, want);
}
