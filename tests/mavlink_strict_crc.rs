// SPDX-License-Identifier: AGPL-3.0-only
//! The MAVLink reader checks the checksum of every frame (src/interconnect/mavlink.rs, with the
//! generated table src/interconnect/mavlink_table.rs): a cut or damaged frame is not taken, the reader
//! moves on by one octet, so it cannot hide the fixes behind it, and each damaged frame is counted once.

use kshana::interconnect::mavlink::{crc_accumulate, decode_stream, decode_tlog, known};
use kshana::interconnect::mavlink_table::{DEFINITIONS_COMMIT, MESSAGES};
use std::path::PathBuf;

/// A frame of a defined message: v1 (`0xFE`) or v2 (`0xFD`, no signature).
fn frame(v2: bool, msgid: u32, payload: &[u8], seq: u8) -> Vec<u8> {
    let (extra, _) = known(msgid).expect("a defined message");
    let mut f = if v2 {
        vec![
            0xFD,
            payload.len() as u8,
            0,
            0,
            seq,
            1,
            1,
            (msgid & 0xFF) as u8,
            ((msgid >> 8) & 0xFF) as u8,
            ((msgid >> 16) & 0xFF) as u8,
        ]
    } else {
        vec![0xFE, payload.len() as u8, seq, 1, 1, msgid as u8]
    };
    f.extend_from_slice(payload);
    let crc = crc_accumulate(crc_accumulate(0xFFFF, &f[1..]), &[extra]);
    f.extend_from_slice(&crc.to_le_bytes());
    f
}

/// The 30-octet base payload of `GPS_RAW_INT` (id 24): a 3D fix at `lat`, `lon`.
fn gps_raw_int(lat: f64, lon: f64) -> Vec<u8> {
    let mut p = Vec::new();
    p.extend_from_slice(&1_700_000_000_000_000u64.to_le_bytes());
    p.extend_from_slice(&((lat * 1e7).round() as i32).to_le_bytes());
    p.extend_from_slice(&((lon * 1e7).round() as i32).to_le_bytes());
    p.extend_from_slice(&500_000i32.to_le_bytes());
    p.extend_from_slice(&90u16.to_le_bytes()); // eph
    p.extend_from_slice(&150u16.to_le_bytes()); // epv
    p.extend_from_slice(&0u16.to_le_bytes()); // vel
    p.extend_from_slice(&0u16.to_le_bytes()); // cog
    p.push(3); // fix type
    p.push(12); // satellites
    assert_eq!(p.len(), 30);
    p
}

fn three_fixes(v2: bool) -> Vec<u8> {
    let mut s = Vec::new();
    for (k, lat) in [47.1, 47.2, 47.3].into_iter().enumerate() {
        s.extend(frame(v2, 24, &gps_raw_int(lat, 8.5), k as u8));
    }
    s
}

fn lats(d: &kshana::interconnect::Decoded) -> Vec<f64> {
    d.fixes.iter().map(|f| f.lat_deg).collect()
}

#[test]
fn the_table_is_the_generated_one_and_holds_the_known_values() {
    assert_eq!(DEFINITIONS_COMMIT.len(), 40);
    assert!(
        MESSAGES.windows(2).all(|w| w[0].0 < w[1].0),
        "sorted, unique ids"
    );
    // Values the MAVLink definitions give (and the reader's earlier hand-written table).
    for (id, extra, len) in [
        (0, 50, 9),
        (2, 137, 12),
        (24, 24, 52),
        (25, 23, 101),
        (33, 104, 28),
        (124, 87, 57),
    ] {
        assert_eq!(known(id), Some((extra, len)), "message {id}");
    }
    assert_eq!(known(0x00FF_FFFF), None);
}

#[test]
fn a_cut_v1_header_does_not_hide_the_fixes_behind_it() {
    // A GPS_RAW_INT v1 header (it claims 30 payload octets) cut after 4 payload octets, then three
    // good frames. Stepping over the claimed length would swallow the first good frame.
    let mut s = frame(false, 24, &gps_raw_int(10.0, 10.0), 9)[..10].to_vec();
    s.extend(three_fixes(false));
    let d = decode_stream(&s);
    assert_eq!(lats(&d), vec![47.1, 47.2, 47.3], "{d:?}");
    assert_eq!(d.read, 3);
    assert_eq!(
        d.bad_checksum + d.malformed,
        1,
        "one damaged frame, counted once"
    );
}

#[test]
fn a_cut_v2_header_does_not_hide_the_fixes_behind_it() {
    let mut s = frame(true, 24, &gps_raw_int(10.0, 10.0), 9)[..14].to_vec();
    s.extend(three_fixes(true));
    let d = decode_stream(&s);
    assert_eq!(lats(&d), vec![47.1, 47.2, 47.3], "{d:?}");
    assert_eq!(d.bad_checksum + d.malformed, 1);
}

#[test]
fn an_undefined_message_is_not_taken_and_does_not_hide_fixes() {
    // A v2 header naming an undefined message id and claiming 200 octets, then three good frames.
    let mut s = vec![0xFD, 200, 0, 0, 0, 1, 1, 0xFF, 0xFF, 0xFF];
    s.extend(three_fixes(true));
    s.extend(std::iter::repeat_n(0u8, 220));
    let d = decode_stream(&s);
    assert_eq!(lats(&d), vec![47.1, 47.2, 47.3]);
    assert_eq!(d.malformed, 1);
    assert_eq!(d.bad_checksum, 0);
}

#[test]
fn a_frame_of_another_defined_message_is_checked_and_stepped_over() {
    let hb = [0u8, 0, 0, 0, 2, 3, 0x51, 4, 3]; // HEARTBEAT, 9 octets
    let mut s = frame(true, 0, &hb, 0);
    s.extend(three_fixes(true));
    let d = decode_stream(&s);
    assert_eq!((d.read, d.other, d.bad_checksum, d.malformed), (4, 1, 0, 0));
    // The same heartbeat with a damaged octet is a checksum failure, no longer stepped over unchecked.
    let mut bad = frame(true, 0, &hb, 0);
    bad[12] ^= 0x01;
    bad.extend(three_fixes(true));
    let d = decode_stream(&bad);
    assert_eq!((d.read, d.other, d.bad_checksum), (3, 0, 1));
    assert_eq!(lats(&d), vec![47.1, 47.2, 47.3]);
}

#[test]
fn a_cut_frame_in_a_tlog_does_not_hide_the_records_behind_it() {
    let t = |us: u64| us.to_be_bytes().to_vec();
    let mut s = t(1_700_000_000_000_000);
    s.extend(&frame(true, 24, &gps_raw_int(10.0, 10.0), 0)[..14]);
    for (k, lat) in [47.1, 47.2].into_iter().enumerate() {
        s.extend(t(1_700_000_001_000_000 + k as u64 * 1_000_000));
        s.extend(frame(true, 24, &gps_raw_int(lat, 8.5), k as u8));
    }
    let d = decode_tlog(&s);
    assert_eq!(lats(&d), vec![47.1, 47.2], "{d:?}");
    assert_eq!(d.fixes[0].t_unix_s, Some(1_700_000_001.0));
    assert_eq!(d.bad_checksum + d.malformed, 1);
}

/// The records of a well-formed `.tlog`: (frame start, frame length).
fn records(tlog: &[u8]) -> Vec<(usize, usize)> {
    let mut out = Vec::new();
    let mut i = 0;
    while i + 8 < tlog.len() {
        let s = i + 8;
        let hdr = if tlog[s] == 0xFE { 6 } else { 10 };
        let sig = if tlog[s] == 0xFD && tlog[s + 2] & 1 == 1 {
            13
        } else {
            0
        };
        let n = hdr + usize::from(tlog[s + 1]) + 2 + sig;
        out.push((s, n));
        i = s + n;
    }
    out
}

#[test]
fn seeded_single_bit_flips_lose_at_most_the_flipped_frame() {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("examples/tracks/flight.tlog");
    let clean = std::fs::read(path).unwrap();
    let base = decode_tlog(&clean);
    assert_eq!((base.bad_checksum, base.malformed), (0, 0));
    let recs = records(&clean);
    assert_eq!(
        recs.len(),
        base.read,
        "the fixture is framed as the reader sees it"
    );
    let key = |f: &kshana::interconnect::Fix| {
        (
            f.id.clone(),
            f.t_unix_s.map(|t| t.to_bits()),
            f.lat_deg.to_bits(),
        )
    };
    let all: Vec<_> = base.fixes.iter().map(key).collect();
    // xorshift64, fixed seed: the same 200 flips on every run.
    let mut x: u64 = 0x9E37_79B9_7F4A_7C15;
    let mut next = || {
        x ^= x << 13;
        x ^= x >> 7;
        x ^= x << 17;
        x
    };
    for _ in 0..200 {
        let (start, n) = recs[(next() % recs.len() as u64) as usize];
        let off = 1 + (next() % (n as u64 - 1)) as usize; // any octet after the start octet
        let bit = (next() % 8) as u8;
        let mut b = clean.clone();
        b[start + off] ^= 1 << bit;
        let d = decode_tlog(&b);
        let got: Vec<_> = d.fixes.iter().map(key).collect();
        // No fix is invented or altered: every fix read is one of the clean log's.
        assert!(
            got.iter().all(|k| all.contains(k)),
            "flip at {}+{off} bit {bit}",
            start
        );
        // At most the flipped frame is lost; the frames behind it are all read.
        assert!(
            got.len() + 1 >= all.len(),
            "flip at {}+{off} bit {bit}: {} of {}",
            start,
            got.len(),
            all.len()
        );
        assert!(d.read + 1 >= base.read);
        // The damage is seen and counted.
        assert!(
            d.bad_checksum + d.malformed >= 1,
            "flip at {}+{off} bit {bit} went unnoticed",
            start
        );
    }
}
