// SPDX-License-Identifier: AGPL-3.0-only
//! RTCM 3 Multiple Signal Message (MSM4 and MSM7) observation reader, read-only.
//!
//! The frame layout (preamble `0xD3`, 10-bit length, CRC-24Q) and the MSM field widths and signal
//! tables are taken from the BSD-licensed open decoder pyrtcm 1.2.0 (`rtcmtypes_core.py`,
//! `rtcmtypes_get_msm.py`, `rtcmtables.py`, `rtcmhelpers.py`; BSD 3-Clause, Copyright (c) 2020
//! semuadmin (Steve Smith), <https://pypi.org/project/pyrtcm/>), not from the text of the RTCM
//! standard. Its licence text and notice are in `NOTICE`. No RTCM document text is reproduced and
//! no copy of the standard was consulted. pyrtcm itself states that its tables follow the
//! standard; this module relies on the open decoder's published tables under its licence.
//!
//! What is read: the frame, the message number (MSM4 = x074, MSM7 = x077 for GPS 1074, GLONASS
//! 1084, Galileo 1094, SBAS 1104, QZSS 1114, BeiDou 1124, NavIC 1134), the epoch time, the
//! satellite, signal and cell masks and, per cell, the signal carrier-to-noise ratio (6 bits, dB-Hz,
//! in MSM4; 10 bits in units of 1/16 dB-Hz in MSM7). Pseudorange and phase fields are stepped over,
//! not used. Other message types, and MSM1-3, 5 and 6, are ignored. A frame whose CRC does not
//! match, or whose body is shorter than its masks say, is skipped and counted.
//!
//! Time: RTCM MSM carries no week, so labels are `GPS TOW <s>` (BeiDou's is BDT's). GLONASS epochs
//! (day of week and time of day in Moscow time) are put on the GPS time of week with GPS minus UTC
//! taken as 18 s, the value since 2017-01-01; a log from before then is shifted by the difference.

use super::EpochMap;
use crate::receiver_trust::{SatCn0, Timeline};

/// Added to GLONASS UTC(SU) time to reach GPS time of week, ms: 18 s leap seconds.
const GLONASS_TO_GPS_LEAP_MS: i64 = 18_000;
/// Moscow time offset of the GLONASS epoch, ms.
const GLONASS_MSK_MS: i64 = 10_800_000;
const WEEK_MS: i64 = 604_800_000;

/// CRC-24Q of `data` (polynomial `0x1864CFB`, zero initial value).
pub fn crc24q(data: &[u8]) -> u32 {
    let mut crc: u32 = 0;
    for &b in data {
        crc ^= u32::from(b) << 16;
        for _ in 0..8 {
            crc <<= 1;
            if crc & 0x100_0000 != 0 {
                crc ^= 0x186_4CFB;
            }
        }
    }
    crc & 0xFF_FFFF
}

struct Bits<'a> {
    b: &'a [u8],
    pos: usize,
}

impl<'a> Bits<'a> {
    fn get(&mut self, n: usize) -> Option<u64> {
        if n > 64 || self.pos + n > self.b.len() * 8 {
            return None;
        }
        let mut v = 0u64;
        for i in 0..n {
            let p = self.pos + i;
            v = (v << 1) | u64::from((self.b[p / 8] >> (7 - p % 8)) & 1);
        }
        self.pos += n;
        Some(v)
    }
    fn skip(&mut self, n: usize) -> Option<()> {
        (self.pos + n <= self.b.len() * 8).then(|| self.pos += n)
    }
}

#[derive(Clone, Copy, PartialEq)]
enum Sys {
    Gps,
    Glonass,
    Galileo,
    Sbas,
    Qzss,
    Beidou,
    Navic,
}

fn system(msg: u64) -> Option<(Sys, bool)> {
    let (sys, base) = match msg {
        1074 | 1077 => (Sys::Gps, 1070),
        1084 | 1087 => (Sys::Glonass, 1080),
        1094 | 1097 => (Sys::Galileo, 1090),
        1104 | 1107 => (Sys::Sbas, 1100),
        1114 | 1117 => (Sys::Qzss, 1110),
        1124 | 1127 => (Sys::Beidou, 1120),
        1134 | 1137 => (Sys::Navic, 1130),
        _ => return None,
    };
    Some((sys, msg - base == 7))
}

fn sat_id(sys: Sys, id: u32) -> Option<String> {
    let (l, n) = match sys {
        Sys::Gps => ('G', id),
        Sys::Glonass => ('R', id),
        Sys::Galileo => ('E', id),
        Sys::Sbas => ('S', id + 19), // RTCM SBAS id 1 is PRN 120
        Sys::Qzss => ('J', id),
        Sys::Beidou => ('C', id),
        Sys::Navic => ('I', id),
    };
    (1..=99).contains(&n).then(|| format!("{l}{n:02}"))
}

/// Signal label for a signal id (position in the signal mask, 1-based), from the open decoders'
/// tables; `None` for an id they do not list.
fn band(sys: Sys, sig: u32) -> Option<&'static str> {
    Some(match (sys, sig) {
        (Sys::Gps, 2..=4) | (Sys::Gps, 30..=32) | (Sys::Sbas, 2) | (Sys::Qzss, 2) => "L1",
        (Sys::Qzss, 30..=32) => "L1",
        (Sys::Gps, 8..=10) | (Sys::Gps, 15..=17) | (Sys::Qzss, 15..=17) => "L2",
        (Sys::Gps, 22..=24) | (Sys::Sbas, 22..=24) | (Sys::Qzss, 22..=24) | (Sys::Navic, 22) => {
            "L5"
        }
        (Sys::Qzss, 9..=11) => "L6",
        (Sys::Glonass, 2 | 3) => "G1",
        (Sys::Glonass, 8 | 9) => "G2",
        (Sys::Galileo, 2..=6) => "E1",
        (Sys::Galileo, 8..=12) => "E6",
        (Sys::Galileo, 14..=16) => "E5b",
        (Sys::Galileo, 18..=20) => "E5",
        (Sys::Galileo, 22..=24) => "E5a",
        (Sys::Beidou, 2..=4) => "B1",
        (Sys::Beidou, 8..=10) => "B3",
        (Sys::Beidou, 14..=16) => "B2",
        (Sys::Beidou, 22..=24) => "B2a",
        (Sys::Beidou, 25) => "B2b",
        (Sys::Beidou, 30..=32) => "B1C",
        _ => return None,
    })
}

/// Read RTCM 3 MSM4 and MSM7 observation messages from a byte stream.
pub fn read_rtcm3(bytes: &[u8]) -> Result<Timeline, String> {
    let mut map = EpochMap::default();
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    let mut any_frame = false;
    while i + 6 <= n {
        if bytes[i] != 0xD3 || bytes[i + 1] & 0xFC != 0 {
            i += 1;
            continue;
        }
        let len = (usize::from(bytes[i + 1] & 3) << 8) | usize::from(bytes[i + 2]);
        let end = i + 3 + len + 3;
        if end > n {
            i += 1;
            continue;
        }
        let want = (u32::from(bytes[end - 3]) << 16)
            | (u32::from(bytes[end - 2]) << 8)
            | u32::from(bytes[end - 1]);
        if crc24q(&bytes[i..end - 3]) != want {
            skipped += 1;
            i += 1;
            continue;
        }
        any_frame = true;
        let payload = &bytes[i + 3..end - 3];
        if msm(payload, &mut map).is_none() {
            skipped += 1;
        }
        i = end;
    }
    let tl = map.finish(skipped);
    if tl.epochs.is_empty() {
        return Err(if any_frame {
            "the RTCM 3 stream holds no MSM4 or MSM7 observation message".to_string()
        } else {
            format!("no valid RTCM 3 frame was found ({skipped} candidates failed the CRC)")
        });
    }
    Ok(tl)
}

/// Decode one frame's payload; `Some(())` when it was not an MSM4/7 or was decoded, `None` when
/// it claimed to be one and was malformed.
fn msm(p: &[u8], map: &mut EpochMap) -> Option<()> {
    let mut b = Bits { b: p, pos: 0 };
    let Some((sys, is7)) = system(b.get(12)?) else {
        return Some(());
    };
    b.skip(12)?; // reference station id
    let key = if sys == Sys::Glonass {
        let dow = b.get(3)? as i64;
        let tod = b.get(27)? as i64;
        if dow > 6 || tod >= 86_400_000 {
            return None;
        }
        (dow * 86_400_000 + tod - GLONASS_MSK_MS + GLONASS_TO_GPS_LEAP_MS).rem_euclid(WEEK_MS)
    } else {
        let tow = b.get(30)? as i64;
        if tow >= WEEK_MS {
            return None;
        }
        tow
    };
    // multiple-message bit 1, IODS 3, reserved 7, clock steering 2, external clock 2,
    // smoothing indicator 1, smoothing interval 3
    b.skip(1 + 3 + 7 + 2 + 2 + 1 + 3)?;
    let sat_mask = b.get(64)?;
    let sig_mask = b.get(32)?;
    let nsat = sat_mask.count_ones() as usize;
    let nsig = sig_mask.count_ones() as usize;
    if nsat == 0 || nsig == 0 || nsat * nsig > 64 {
        return None;
    }
    let mut cells = Vec::new(); // (sat index, sig index)
    for s in 0..nsat {
        for g in 0..nsig {
            if b.get(1)? == 1 {
                cells.push((s, g));
            }
        }
    }
    // satellite data: int ms 8, [extended info 4], rough range 10, [rough phase range rate 14]
    b.skip(nsat * if is7 { 8 + 4 + 10 + 14 } else { 8 + 10 })?;
    let nc = cells.len();
    // signal data, field by field over the cells: pseudorange, phase range, lock time,
    // half-cycle indicator, then the carrier-to-noise ratio
    let (pr, ph, lock, cnr_bits) = if is7 {
        (20, 24, 10, 10)
    } else {
        (15, 22, 4, 6)
    };
    b.skip(nc * (pr + ph + lock + 1))?;
    let mut cnr = Vec::with_capacity(nc);
    for _ in 0..nc {
        cnr.push(b.get(cnr_bits)?);
    }
    // ids: set bits of the masks, most significant first, are ids 1, 2, ...
    let ids = |mask: u64, width: u32| -> Vec<u32> {
        (0..width)
            .filter(|k| mask >> (width - 1 - k) & 1 == 1)
            .map(|k| k + 1)
            .collect()
    };
    let (sats, sigs) = (ids(sat_mask, 64), ids(sig_mask & 0xFFFF_FFFF, 32));
    let e = map.at(key);
    e.time_label
        .get_or_insert_with(|| format!("GPS TOW {:.3} s", key as f64 / 1000.0));
    for ((s, g), raw) in cells.into_iter().zip(cnr) {
        let dbhz = if is7 { raw as f64 / 16.0 } else { raw as f64 };
        let (Some(id), Some(bd)) = (sat_id(sys, sats[s]), band(sys, sigs[g])) else {
            continue;
        };
        if dbhz > 0.0 {
            e.cn0.push(SatCn0 {
                sat: id,
                band: bd.to_string(),
                cn0_dbhz: dbhz,
            });
        }
    }
    Some(())
}

#[cfg(test)]
mod tests {
    use super::*;

    struct W(Vec<u8>, usize);
    impl W {
        fn put(&mut self, v: u64, n: usize) {
            for i in (0..n).rev() {
                if self.1 % 8 == 0 {
                    self.0.push(0);
                }
                let bit = ((v >> i) & 1) as u8;
                *self.0.last_mut().unwrap() |= bit << (7 - self.1 % 8);
                self.1 += 1;
            }
        }
    }

    /// A self-written MSM frame: `sats` are (id, cnr raw) with one signal each.
    fn frame(msg: u64, epoch: &[(usize, u64)], sig_id: u32, sats: &[(u32, u64)]) -> Vec<u8> {
        let is7 = msg % 10 == 7;
        let mut w = W(Vec::new(), 0);
        w.put(msg, 12);
        w.put(7, 12);
        for &(bits, v) in epoch {
            w.put(v, bits);
        }
        w.put(0, 19);
        let mut mask = 0u64;
        for (id, _) in sats {
            mask |= 1 << (64 - id);
        }
        w.put(mask, 64);
        w.put(1 << (32 - sig_id), 32);
        for _ in sats {
            w.put(1, 1); // cell mask: one signal per satellite, present
        }
        for _ in sats {
            w.put(70, 8);
            if is7 {
                w.put(0, 4);
            }
            w.put(512, 10);
            if is7 {
                w.put(0, 14);
            }
        }
        let (pr, ph, lock, cb) = if is7 {
            (20, 24, 10, 10)
        } else {
            (15, 22, 4, 6)
        };
        for (bits, per) in [(pr, 0), (ph, 0), (lock, 0), (1, 0)] {
            for _ in sats {
                w.put(per, bits);
            }
        }
        for (_, c) in sats {
            w.put(*c, cb);
        }
        if is7 {
            for _ in sats {
                w.put(0, 15); // fine phase-range rate, after the CNR in MSM7
            }
        }
        let payload = w.0;
        let mut f = vec![0xD3, (payload.len() >> 8) as u8, payload.len() as u8];
        f.extend(&payload);
        let c = crc24q(&f);
        f.extend([(c >> 16) as u8, (c >> 8) as u8, c as u8]);
        f
    }

    #[test]
    fn crc24q_of_the_standard_check_string() {
        // CRC-24Q of "123456789" is 0xCDE703, the value published for the algorithm
        // (the CRC catalogue's check value), independent of any decoder here.
        assert_eq!(crc24q(b"123456789"), 0xCD_E703);
    }

    #[test]
    fn reads_msm4_and_msm7_cn0_and_merges_epochs() {
        let mut s = frame(1074, &[(30, 100_000)], 2, &[(5, 44), (12, 38)]); // GPS L1 C/A
        s.extend(frame(1077, &[(30, 101_000)], 2, &[(5, 45 * 16 + 8)])); // 45.5 dB-Hz
        s.extend(frame(1097, &[(30, 101_000)], 2, &[(11, 40 * 16)])); // Galileo E1, MSM7
        let tl = read_rtcm3(&s).unwrap();
        assert_eq!(tl.epochs.len(), 2);
        assert_eq!(tl.epochs[0].cn0.len(), 2);
        assert_eq!(tl.epochs[0].cn0[0].sat, "G05");
        assert_eq!(tl.epochs[0].cn0[0].band, "L1");
        assert_eq!(tl.epochs[0].cn0[0].cn0_dbhz, 44.0);
        assert_eq!(tl.epochs[1].t_s, 1.0);
        let c = &tl.epochs[1].cn0;
        assert!(c.iter().any(|x| x.sat == "G05" && x.cn0_dbhz == 45.5));
        assert!(c
            .iter()
            .any(|x| x.sat == "E11" && x.band == "E1" && x.cn0_dbhz == 40.0));
        assert_eq!(
            tl.epochs[0].time_label.as_deref(),
            Some("GPS TOW 100.000 s")
        );
    }

    #[test]
    fn glonass_epoch_is_moved_to_gps_time_and_sbas_id_is_offset() {
        // GLONASS day 1 (Monday) 03:00:00 Moscow time = 00:00:00 UTC Monday = TOW 86400 + 18 s
        let g = frame(1084, &[(3, 1), (27, 10_800_000)], 2, &[(3, 41)]);
        let tl = read_rtcm3(&g).unwrap();
        assert!(tl.epochs[0]
            .time_label
            .as_deref()
            .unwrap()
            .contains("86418.000"));
        assert_eq!(tl.epochs[0].cn0[0].sat, "R03");
        let sb = frame(1104, &[(30, 5_000)], 2, &[(1, 30)]);
        assert_eq!(read_rtcm3(&sb).unwrap().epochs[0].cn0[0].sat, "S20");
    }

    #[test]
    fn bad_crc_other_messages_and_garbage() {
        let mut f = frame(1074, &[(30, 1000)], 2, &[(5, 44)]);
        let last = f.len() - 1;
        f[last] ^= 1;
        assert!(read_rtcm3(&f).unwrap_err().contains("CRC"));
        // a valid frame of another message type (1005) holds no observation
        let mut p = vec![0u8; 19];
        p[0] = (1005u16 >> 4) as u8;
        p[1] = ((1005u16 & 0xF) << 4) as u8;
        let mut o = vec![0xD3, 0, 19];
        o.extend(&p);
        let c = crc24q(&o);
        o.extend([(c >> 16) as u8, (c >> 8) as u8, c as u8]);
        assert!(read_rtcm3(&o).unwrap_err().contains("no MSM"));
        for junk in [
            &b""[..],
            b"\xD3",
            b"\xD3\x00\x05abc",
            &[0xD3, 0x03, 0xFF][..],
        ] {
            let _ = read_rtcm3(junk);
        }
    }
}
