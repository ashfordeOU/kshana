// SPDX-License-Identifier: AGPL-3.0-only
//! Live receiver logs (L4a): the same bytes fed as a live stream, in chunks of any size, give the
//! epochs of a replay of the whole recording, byte for byte, while the decoder holds a bounded window.
//! Checked on synthetic UBX, SBF, NovAtel and RTCM 3 streams (with junk between frames), the
//! bundled NMEA jamming log and the RINEX 4 conformance file.

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

/// An SBF block as the reader's own tests lay it out (sync, CRC-16, id, length, TOW, WNc, body).
fn sbf_block(id: u16, tow_ms: u32, wnc: u16, body: &[u8]) -> Vec<u8> {
    let mut data = vec![0u8; 2];
    data.extend(id.to_le_bytes());
    data.extend([0, 0]);
    data.extend(tow_ms.to_le_bytes());
    data.extend(wnc.to_le_bytes());
    data.extend(body);
    while !(data.len() + 2).is_multiple_of(4) {
        data.push(0);
    }
    let len = (data.len() + 2) as u16;
    data[4..6].copy_from_slice(&len.to_le_bytes());
    let crc = sbf_tools::crc::crc16_ccitt(&data[2..]);
    data[0..2].copy_from_slice(&crc.to_le_bytes());
    let mut out = vec![b'$', b'@'];
    out.extend(data);
    out
}

/// 90 epochs of PVTGeodetic and MeasEpoch, with junk (a false `$`) between some blocks.
fn sbf_stream() -> Vec<u8> {
    let mut v = Vec::new();
    for t in 0..90u32 {
        let tow = 345_600_000 + 1000 * t;
        let mut p = vec![0u8; 83 - 12];
        p[0] = 4;
        p[2..10].copy_from_slice(&(59.44f64.to_radians()).to_le_bytes());
        p[10..18].copy_from_slice(&(24.75f64.to_radians()).to_le_bytes());
        p[18..26].copy_from_slice(&(30.0 + f64::from(t)).to_le_bytes());
        p[60] = 8;
        v.extend(sbf_block(4007, tow, 2330, &p));
        let cn0 = if (30..50).contains(&t) { 26.0 } else { 45.0 };
        let mut m = vec![6u8, 20, 0, 0, 0];
        for svid in 1..=6u8 {
            let mut sb = [0u8; 20];
            sb[2] = svid;
            sb[15] = ((cn0 - 10.0 - f64::from(svid % 3)) / 0.25) as u8;
            m.extend(sb);
        }
        v.extend(sbf_block(4027, tow, 2330, &m));
        if t % 11 == 0 {
            v.extend([b'$', 0x00, 0x24, 0x40]); // junk: a false sync, then `$@` with no block
        }
    }
    v
}

#[test]
fn sbf_live_equals_replay() {
    check("sbf", &sbf_stream());
}

/// A NovAtel ASCII log line with its CRC.
fn novatel_ascii(body: &str) -> Vec<u8> {
    format!(
        "#{body}*{:08x}\r\n",
        kshana::receiver_trust::machines::novatel::novatel_crc32(body.as_bytes())
    )
    .into_bytes()
}

/// 80 epochs of BESTPOSA and RANGEA lines, with a binary log the reader does not use between some
/// of them (so the binary framing is exercised too).
fn novatel_stream() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..80u32 {
        let sec = 100 + k;
        let cn0 = if (20..35).contains(&k) { 27.0 } else { 44.5 };
        v.extend(novatel_ascii(&format!(
            "BESTPOSA,COM1,0,50.0,FINESTEERING,2300,{sec}.000,02000000,0000,1;SOL_COMPUTED,SINGLE,\
             59.91150000000,10.75790000000,52.0000,40.0000,WGS84,1.0000,1.0000,2.0000,\"\",0.000,\
             0.000,14,12,12,12,00,00,00,00"
        )));
        v.extend(novatel_ascii(&format!(
            "RANGEA,COM1,0,50.0,FINESTEERING,2300,{sec}.000,02000000,5103,1;2,\
             5,0,2.4e7,0.2,-1.2e8,0.01,100.0,{cn0},500.0,00000004,\
             11,0,2.1e7,0.2,-1.2e8,0.01,100.0,{:.1},500.0,00000004",
            cn0 - 3.0
        )));
        if k % 7 == 0 {
            let body = [1u8, 2, 3, 4, 5, 6, 7, 8];
            let mut m = vec![0xAA, 0x44, 0x12, 28];
            m.extend(9999u16.to_le_bytes());
            m.extend([0, 0xC0]);
            m.extend((body.len() as u16).to_le_bytes());
            m.extend([0, 0, 0, 180]);
            m.extend(2300u16.to_le_bytes());
            m.extend((sec * 1000).to_le_bytes());
            m.extend([0; 8]);
            m.extend(body);
            let c = kshana::receiver_trust::machines::novatel::novatel_crc32(&m);
            m.extend(c.to_le_bytes());
            v.extend(m);
        }
    }
    v
}

#[test]
fn novatel_live_equals_replay() {
    check("novatel", &novatel_stream());
}

struct Bits(Vec<u8>, usize);
impl Bits {
    fn put(&mut self, v: u64, n: usize) {
        for i in (0..n).rev() {
            if self.1.is_multiple_of(8) {
                self.0.push(0);
            }
            *self.0.last_mut().unwrap() |= (((v >> i) & 1) as u8) << (7 - self.1 % 8);
            self.1 += 1;
        }
    }
}

/// A GPS MSM4 frame (1074) at `tow_ms`, one L1 C/A signal per satellite; `sats` are (id, CNR).
fn msm4(tow_ms: u64, sats: &[(u32, u64)]) -> Vec<u8> {
    let mut w = Bits(Vec::new(), 0);
    w.put(1074, 12);
    w.put(7, 12);
    w.put(tow_ms, 30);
    w.put(0, 19);
    let mut mask = 0u64;
    for (id, _) in sats {
        mask |= 1 << (64 - id);
    }
    w.put(mask, 64);
    w.put(1 << (32 - 2), 32);
    for _ in sats {
        w.put(1, 1);
    }
    for _ in sats {
        w.put(70, 8);
        w.put(512, 10);
    }
    for bits in [15, 22, 4, 1] {
        for _ in sats {
            w.put(0, bits);
        }
    }
    for (_, c) in sats {
        w.put(*c, 6);
    }
    let payload = w.0;
    let mut f = vec![0xD3, (payload.len() >> 8) as u8, payload.len() as u8];
    f.extend(&payload);
    let c = kshana::receiver_trust::machines::rtcm3::crc24q(&f);
    f.extend([(c >> 16) as u8, (c >> 8) as u8, c as u8]);
    f
}

/// 100 epochs of MSM4, with noise and a frame with a bad CRC between some of them.
fn rtcm3_stream() -> Vec<u8> {
    let mut v = Vec::new();
    for k in 0..100u64 {
        let cnr = if (40..60).contains(&k) { 27 } else { 44 };
        v.extend(msm4(
            100_000 + 1000 * k,
            &[(5, cnr), (12, cnr - 2), (21, cnr - 4)],
        ));
        if k % 13 == 0 {
            let mut bad = msm4(100_000 + 1000 * k, &[(7, 40)]);
            let n = bad.len();
            bad[n - 1] ^= 1;
            v.extend(bad);
            v.extend([0x00, 0xFF]);
        }
    }
    v
}

#[test]
fn rtcm3_live_equals_replay() {
    check("rtcm3", &rtcm3_stream());
}
