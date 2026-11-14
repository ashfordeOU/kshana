// SPDX-License-Identifier: AGPL-3.0-only
//! Javad GREIS binary message reader, read-only (roadmap 0.42 I3).
//!
//! Layouts follow Javad's public *GREIS: GNSS Receiver External Interface Specification*, version
//! 4.3.00 (javad.com, `GREIS-4.3.00.pdf`, downloaded 14 November 2026): the general message format
//! and stream parsing rules (section 3.3), the 8-bit checksum (appendix A.1.1), the time messages,
//! `[PG]`, `[DP]`, the satellite index `[SX]` (and the obsolete `[SI]`), `[NN]` and the C/N0 messages.
//!
//! A message is `IIHHH` (two identifier characters, three upper-case hexadecimal digits giving the
//! body length) followed by the body. The checksum (last body byte) covers the header and the rest of
//! the body: `cs = rotl2(...rotl2(rotl2(0) ^ b0) ^ b1 ...)`, then one final `rotl2`. Messages are read:
//!
//! * `[~~]` receiver time (start of epoch: time of day, ms) and `[::]` epoch time (end of epoch);
//! * `[RD]` receiver date and the receiver's reference time (0 GPS, 1 UTC(USNO), 2 GLONASS, 3 UTC(SU));
//! * `[SX]` extended satellite indices (ESI), `[SI]` the obsolete USI form, `[NN]` GLONASS slots;
//! * `[EC] [E1] [E2] [E3] [E5] [El]` C/N0 (dB-Hz) and `[CE] [1E] [2E] [3E] [5E] [lE]` C/N0 × 4,
//!   for the CA/L1, P/L1, P/L2, CA/L2, L5 and L1C slots of Table 3-8;
//! * `[PG]` geodetic position (rad, rad, ellipsoidal m, solution type; type 0 gives no fix);
//! * `[DP]` HDOP, VDOP, TDOP (PDOP is formed as the root sum of squares of HDOP and VDOP).
//!
//! A message this reader reads whose checksum does not match is skipped and counted, and the scan
//! resumes one byte later. Other messages are skipped by their stated length, as the specification
//! recommends. Special "no data" values (255 for `u1`, quiet NaN for floats) are left out. A GLONASS
//! satellite whose slot is not given by `[NN]` is left out. Nothing is written to the receiver.

use super::{EpochMap, DAY_MS};
use crate::receiver_trust::ingest::{civil_from_days, days_from_civil, plausible_date};
use crate::receiver_trust::{LogEpoch, ReportedDop, ReportedFix, SatCn0, Timeline};

/// The GREIS 8-bit checksum of `data` (appendix A.1.1).
pub fn checksum(data: &[u8]) -> u8 {
    let mut r: u8 = 0;
    for &b in data {
        r = r.rotate_left(2) ^ b;
    }
    r.rotate_left(2)
}

/// One GREIS message: identifier, three-digit hexadecimal length, body, and the checksum appended
/// (`body` excludes it). The encoder the round-trip tests use.
pub fn message(id: &[u8; 2], body: &[u8]) -> Vec<u8> {
    let mut m = Vec::with_capacity(body.len() + 6);
    m.extend_from_slice(id);
    m.extend_from_slice(format!("{:03X}", body.len() + 1).as_bytes());
    m.extend_from_slice(body);
    m.push(checksum(&m));
    m
}

fn is_id(b: u8) -> bool {
    (b'0'..=b'~').contains(&b)
}
fn hex(b: u8) -> Option<usize> {
    match b {
        b'0'..=b'9' => Some(usize::from(b - b'0')),
        b'A'..=b'F' => Some(usize::from(b - b'A' + 10)),
        _ => None,
    }
}
fn f32le(b: &[u8], o: usize) -> Option<f64> {
    let v = f32::from_le_bytes(b.get(o..o + 4)?.try_into().ok()?);
    v.is_finite().then_some(f64::from(v))
}
fn f64le(b: &[u8], o: usize) -> Option<f64> {
    let v = f64::from_le_bytes(b.get(o..o + 8)?.try_into().ok()?);
    v.is_finite().then_some(v)
}
fn u32le(b: &[u8], o: usize) -> Option<u32> {
    Some(u32::from_le_bytes(b.get(o..o + 4)?.try_into().ok()?))
}

/// A satellite of the index: system letter and number (PRN, or for GLONASS the slot once known).
#[derive(Clone, Copy, Debug, PartialEq)]
enum Sv {
    Sat(char, u32),
    /// GLONASS, slot not yet known.
    Glonass,
    None,
}

fn from_esi(ssid: u8, svid: u8) -> Sv {
    let n = u32::from(svid);
    match ssid {
        1 => Sv::Sat('G', n),
        2 => Sv::Glonass,
        3 => Sv::Sat('S', n),
        4 => Sv::Sat('E', n),
        5 => Sv::Sat('J', n),
        6 => Sv::Sat('C', n),
        7 => Sv::Sat('I', n),
        _ => Sv::None,
    }
}

fn from_usi(usi: u8) -> Sv {
    let u = u32::from(usi);
    match usi {
        1..=37 => Sv::Sat('G', u),
        38..=70 => Sv::Glonass,
        71..=119 => Sv::Sat('E', u - 70),
        120..=192 => Sv::Sat('S', u),
        193..=210 => Sv::Sat('J', u),
        211..=254 => Sv::Sat('C', u - 210),
        _ => Sv::None,
    }
}

/// Band label of a GREIS signal slot (0 CA/L1, 1 P/L1, 2 P/L2, 3 CA/L2, 4 L5, 5 L1C) for a system
/// (Table 3-8).
fn band(letter: char, slot: usize) -> Option<&'static str> {
    Some(match (letter, slot) {
        ('G', 0 | 1) | ('J', 0 | 1) | ('S', 0) => "L1",
        ('G', 2 | 3) | ('J', 3) => "L2",
        ('J', 2) => "L6",
        ('G', 4) | ('J', 4) | ('S', 4) | ('I', 4) => "L5",
        ('G', 5) | ('J', 5) => "L1C",
        ('E', 0) => "E1",
        ('E', 1) => "E5",
        ('E', 2) => "E5b",
        ('E', 3) => "E6",
        ('E', 4) => "E5a",
        ('R', 0 | 1) => "G1",
        ('R', 2 | 3) => "G2",
        ('R', 4) => "G3",
        ('C', 0) => "B1",
        ('C', 1 | 2) => "B2",
        ('C', 3) => "B3",
        ('C', 4) => "B2a",
        ('C', 5) => "B1C",
        _ => return None,
    })
}

fn cn0_slot(id: &[u8]) -> Option<(usize, f64)> {
    let slot = |c: u8| match c {
        b'C' | b'c' => Some(0),
        b'1' => Some(1),
        b'2' => Some(2),
        b'3' => Some(3),
        b'5' => Some(4),
        b'l' => Some(5),
        _ => None,
    };
    match (id[0], id[1]) {
        (b'E', c) => slot(c).map(|s| (s, 1.0)),
        (c, b'E') => slot(c).map(|s| (s, 0.25)),
        _ => None,
    }
}

#[derive(Default)]
struct Epoch {
    tod: i64,
    e: LogEpoch,
}

struct State {
    map: EpochMap,
    /// Calendar date (days since 1970) and the receiver's reference time, from `[RD]`.
    date: Option<(i64, u8)>,
    last_tod: Option<i64>,
    sats: Vec<Sv>,
    cur: Option<Epoch>,
}

impl State {
    fn flush(&mut self) {
        let Some(ep) = self.cur.take() else { return };
        if let Some(prev) = self.last_tod {
            // A time of day that goes backwards with no new [RD] is the next day.
            if ep.tod < prev {
                if let Some((d, b)) = self.date {
                    self.date = Some((d + 1, b));
                }
            }
        }
        self.last_tod = Some(ep.tod);
        let (key, label) = match self.date {
            Some((d, base)) => {
                let ms = d * DAY_MS + ep.tod;
                let (y, mo, dd) = civil_from_days(d);
                let r = ep.tod;
                let suffix = match base {
                    0 => " GPST",
                    1 | 3 => "Z",
                    _ => " GLONASST",
                };
                (
                    ms,
                    format!(
                        "{y:04}-{mo:02}-{dd:02}T{:02}:{:02}:{:02}.{:03}{suffix}",
                        r / 3_600_000,
                        r / 60_000 % 60,
                        r / 1000 % 60,
                        r % 1000
                    ),
                )
            }
            None => (
                ep.tod,
                crate::t!(
                    "receiver-trust-machines-greis-tod",
                    tod = crate::i18n::localise_decimal(format!("{:.3}", ep.tod as f64 / 1000.0))
                ),
            ),
        };
        if ep.e.cn0.is_empty() && ep.e.fix.is_none() && ep.e.reported_dop.is_none() {
            return;
        }
        let e = self.map.at(key);
        e.time_label.get_or_insert(label);
        let LogEpoch {
            cn0,
            fix,
            reported_dop,
            ..
        } = ep.e;
        e.cn0.extend(cn0);
        e.fix = fix.or(e.fix);
        e.reported_dop = reported_dop.or(e.reported_dop);
    }
}

/// Read a GREIS byte stream into a trust timeline.
pub fn read_greis(bytes: &[u8]) -> Result<Timeline, String> {
    let mut st = State {
        map: EpochMap::default(),
        date: None,
        last_tod: None,
        sats: Vec::new(),
        cur: None,
    };
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    while i + 5 <= n {
        let (a, b) = (bytes[i], bytes[i + 1]);
        let len = match (hex(bytes[i + 2]), hex(bytes[i + 3]), hex(bytes[i + 4])) {
            (Some(x), Some(y), Some(z)) if is_id(a) && is_id(b) => x * 256 + y * 16 + z,
            _ => {
                i += 1;
                continue;
            }
        };
        let end = i + 5 + len;
        if len == 0 || end > n {
            i += 1;
            continue;
        }
        let id = [a, b];
        let known = matches!(
            &id,
            b"~~" | b"::" | b"RD" | b"SX" | b"SI" | b"NN" | b"PG" | b"DP"
        ) || cn0_slot(&id).is_some();
        if !known {
            i = end;
            continue;
        }
        if checksum(&bytes[i..end - 1]) != bytes[end - 1] {
            skipped += 1;
            i += 1;
            continue;
        }
        let body = &bytes[i + 5..end - 1];
        if handle(&id, body, &mut st).is_none() {
            skipped += 1;
        }
        i = end;
        while i < n && (bytes[i] == b'\r' || bytes[i] == b'\n') {
            i += 1;
        }
    }
    st.flush();
    let tl = st.map.finish(skipped);
    if tl.epochs.is_empty() {
        return Err(crate::terr!(
            "e-receiver-trust-ingest-the-log-holds-no-epochs",
            name = "GREIS",
            skipped_records = skipped
        ));
    }
    Ok(tl)
}

fn handle(id: &[u8; 2], b: &[u8], st: &mut State) -> Option<()> {
    match id {
        b"~~" => {
            let tod = i64::from(u32le(b, 0)?);
            if tod >= DAY_MS {
                return None;
            }
            st.flush();
            st.cur = Some(Epoch {
                tod,
                e: LogEpoch::default(),
            });
        }
        b"::" => {
            let tod = i64::from(u32le(b, 0)?);
            if st.cur.as_ref().is_some_and(|c| c.tod == tod) {
                st.flush();
            }
        }
        b"RD" => {
            let y = i64::from(u16::from_le_bytes(b.get(0..2)?.try_into().ok()?));
            let (mo, d, base) = (i64::from(*b.get(2)?), i64::from(*b.get(3)?), *b.get(4)?);
            if !plausible_date(y, mo, d) {
                return None;
            }
            st.date = Some((days_from_civil(y, mo, d), base));
        }
        b"SX" => {
            st.sats = b.chunks_exact(2).map(|c| from_esi(c[0], c[1])).collect();
        }
        b"SI" => {
            st.sats = b.iter().map(|&u| from_usi(u)).collect();
        }
        b"NN" => {
            let mut slots = b.iter();
            for s in st.sats.iter_mut().filter(|s| **s == Sv::Glonass) {
                match slots.next() {
                    Some(&osn) if (1..=32).contains(&osn) => *s = Sv::Sat('R', u32::from(osn)),
                    Some(_) => {}
                    None => break,
                }
            }
        }
        b"PG" => {
            let (lat, lon, alt) = (f64le(b, 0)?, f64le(b, 8)?, f64le(b, 16)?);
            let sol = *b.get(28)?;
            let cur = st.cur.as_mut()?;
            if sol != 0 && lat.abs() <= std::f64::consts::FRAC_PI_2 {
                cur.e.fix = Some(ReportedFix {
                    lat_deg: lat.to_degrees(),
                    lon_deg: lon.to_degrees(),
                    height_m: alt,
                    n_used: None,
                });
            }
        }
        b"DP" => {
            let (h, v) = (f32le(b, 0)?, f32le(b, 4)?);
            let sol = *b.get(12)?;
            let cur = st.cur.as_mut()?;
            if sol != 0 {
                cur.e.reported_dop = Some(ReportedDop {
                    pdop: Some((h * h + v * v).sqrt()),
                    hdop: Some(h),
                    vdop: Some(v),
                    n_used: 0,
                });
            }
        }
        _ => {
            let (slot, scale) = cn0_slot(id)?;
            if b.len() != st.sats.len() {
                return None;
            }
            let cur = st.cur.as_mut()?;
            for (sv, &raw) in st.sats.iter().zip(b) {
                let Sv::Sat(letter, num) = *sv else { continue };
                if raw == 255 || raw == 0 {
                    continue;
                }
                let (Some(sat), Some(bd)) =
                    (super::sat_id_from_prn(letter, num), band(letter, slot))
                else {
                    continue;
                };
                cur.e.cn0.push(SatCn0 {
                    sat,
                    band: bd.to_string(),
                    cn0_dbhz: f64::from(raw) * scale,
                });
            }
        }
    }
    Some(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn checksum_is_rotate_left_two_and_xor_with_a_final_rotation() {
        // By hand from appendix A.1.1: rotl2(0)^0x7E = 0x7E; rotl2(0x7E)=0xF9, ^0x7E = 0x87;
        // final rotl2(0x87) = 0x1E.
        assert_eq!(checksum(&[0x7E, 0x7E]), 0x1E);
        assert_eq!(checksum(&[]), 0);
    }

    #[test]
    fn identifiers_select_the_cn0_slot_and_scale() {
        assert_eq!(cn0_slot(b"EC"), Some((0, 1.0)));
        assert_eq!(cn0_slot(b"2E"), Some((2, 0.25)));
        assert_eq!(cn0_slot(b"lE"), Some((5, 0.25)));
        assert_eq!(cn0_slot(b"PG"), None);
    }
}
