// SPDX-License-Identifier: AGPL-3.0-only
//! Swift Navigation Binary Protocol (SBP) reader, read-only (roadmap 0.42 I3).
//!
//! Layouts follow the public SBP specification as published in Swift Navigation's `libsbp`
//! repository (MIT licence; `spec/yaml/swiftnav/sbp/{navigation,observation,tracking,gnss}.yaml`
//! and `c/src/edc.c`), checked on 14 November 2026. The signal-code table is the `GnssSignal.code`
//! enumeration as listed there and in RTKLIB's `swiftnav.c` (BSD 2-Clause).
//!
//! Frame: preamble `0x55`, message type (u16 LE), sender (u16 LE), payload length (u8), payload,
//! CRC-16-CCITT (polynomial `0x1021`, initial value 0, LE) over everything after the preamble up to
//! the CRC. A frame whose CRC does not match is skipped and counted.
//!
//! Messages read:
//!
//! * `MSG_GPS_TIME` (0x0102) and `MSG_GPS_TIME_GNSS` (0x0104): week number, time of week (ms).
//! * `MSG_POS_LLH` (0x020A) and `MSG_POS_LLH_GNSS` (0x022A): latitude and longitude (deg, f64),
//!   height above the WGS84 ellipsoid (m, f64), satellites used; a fix mode of 0 (invalid) gives no fix.
//! * `MSG_DOPS` (0x0208): GDOP, PDOP, TDOP, HDOP, VDOP in units of 0.01.
//! * `MSG_OBS` (0x004A): the observation header (time of week, week) and, per signal, the C/N0
//!   (units of 0.25 dB-Hz). Pseudorange, carrier phase and Doppler are not used here.
//! * `MSG_MEASUREMENT_STATE` (0x0061): per signal C/N0 (0.25 dB-Hz) with no time of its own; it joins
//!   the most recent epoch the stream has named.
//!
//! Other messages are passed over. Nothing is ever written to the receiver.

use super::{gps_week_ms, sat_id_from_prn, EpochMap};
use crate::receiver_trust::{ReportedDop, ReportedFix, SatCn0, Timeline};

/// `MSG_OBS`.
pub const MSG_OBS: u16 = 0x004A;
/// `MSG_MEASUREMENT_STATE`.
pub const MSG_MEASUREMENT_STATE: u16 = 0x0061;
/// `MSG_GPS_TIME`.
pub const MSG_GPS_TIME: u16 = 0x0102;
/// `MSG_GPS_TIME_GNSS`.
pub const MSG_GPS_TIME_GNSS: u16 = 0x0104;
/// `MSG_DOPS`.
pub const MSG_DOPS: u16 = 0x0208;
/// `MSG_POS_LLH`.
pub const MSG_POS_LLH: u16 = 0x020A;
/// `MSG_POS_LLH_GNSS`.
pub const MSG_POS_LLH_GNSS: u16 = 0x022A;

/// CRC-16-CCITT as SBP uses it (`crc16_ccitt` in libsbp's `edc.c`): polynomial `0x1021`, initial
/// value 0, no reflection, no final XOR.
pub fn crc16_ccitt(data: &[u8]) -> u16 {
    let mut crc: u16 = 0;
    for &b in data {
        crc ^= u16::from(b) << 8;
        for _ in 0..8 {
            crc = if crc & 0x8000 != 0 {
                (crc << 1) ^ 0x1021
            } else {
                crc << 1
            };
        }
    }
    crc
}

/// One SBP frame around a payload (at most 255 bytes): the encoder the round-trip tests and the
/// conformance generator's cross-check use.
pub fn frame(msg_type: u16, sender: u16, payload: &[u8]) -> Option<Vec<u8>> {
    let len = u8::try_from(payload.len()).ok()?;
    let mut f = Vec::with_capacity(payload.len() + 8);
    f.push(0x55);
    f.extend_from_slice(&msg_type.to_le_bytes());
    f.extend_from_slice(&sender.to_le_bytes());
    f.push(len);
    f.extend_from_slice(payload);
    let crc = crc16_ccitt(&f[1..]);
    f.extend_from_slice(&crc.to_le_bytes());
    Some(f)
}

fn u16le(b: &[u8], o: usize) -> Option<u16> {
    Some(u16::from_le_bytes(b.get(o..o + 2)?.try_into().ok()?))
}
fn u32le(b: &[u8], o: usize) -> Option<u32> {
    Some(u32::from_le_bytes(b.get(o..o + 4)?.try_into().ok()?))
}
fn f64le(b: &[u8], o: usize) -> Option<f64> {
    Some(f64::from_le_bytes(b.get(o..o + 8)?.try_into().ok()?))
}

/// Satellite id and band label of a `GnssSignal` (`sat`, `code`); `None` for a code the public
/// table does not list, an auxiliary-antenna code, or a GLONASS signal identified only by its
/// frequency channel (`sat` = 100 + FCN).
pub fn signal(sat: u8, code: u8) -> Option<(String, &'static str)> {
    let (letter, band) = match code {
        0 => ('G', "L1"),
        1 | 6..=8 => ('G', "L2"),
        5 => ('G', "L1"),
        9..=11 => ('G', "L5"),
        56..=58 => ('G', "L1C"),
        2 => ('S', "L1"),
        41..=43 => ('S', "L5"),
        3 | 29 => ('R', "G1"),
        4 | 30 => ('R', "G2"),
        12 => ('C', "B1"),
        13 => ('C', "B2"),
        44..=46 => ('C', "B1C"),
        47..=49 => ('C', "B2a"),
        50..=52 => ('C', "B2b"),
        53..=55 => ('C', "B3"),
        14..=16 => ('E', "E1"),
        17..=19 => ('E', "E6"),
        20..=22 => ('E', "E5b"),
        23..=25 => ('E', "E5"),
        26..=28 => ('E', "E5a"),
        31..=34 => ('J', "L1"),
        35..=37 => ('J', "L2"),
        38..=40 => ('J', "L5"),
        _ => return None,
    };
    if letter == 'R' && sat > 28 {
        return None;
    }
    Some((sat_id_from_prn(letter, u32::from(sat))?, band))
}

#[derive(Clone, Copy)]
enum Item {
    Week(i64),
    Fix {
        tow: i64,
        lat: f64,
        lon: f64,
        h: f64,
        n: u32,
    },
    Dop {
        tow: i64,
        p: f64,
        h: f64,
        v: f64,
    },
    ObsHead {
        tow: i64,
        week: i64,
    },
    Cn0 {
        sat: u8,
        code: u8,
        quarter_dbhz: u8,
    },
    State,
}

/// Read an SBP byte stream into a trust timeline.
pub fn read_sbp(bytes: &[u8]) -> Result<Timeline, String> {
    let mut items: Vec<Item> = Vec::new();
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    while i + 8 <= n {
        if bytes[i] != 0x55 {
            i += 1;
            continue;
        }
        let len = usize::from(bytes[i + 5]);
        let end = i + 6 + len + 2;
        if end > n {
            i += 1;
            continue;
        }
        let want = u16::from_le_bytes([bytes[end - 2], bytes[end - 1]]);
        if crc16_ccitt(&bytes[i + 1..end - 2]) != want {
            skipped += 1;
            i += 1;
            continue;
        }
        let ty = u16::from_le_bytes([bytes[i + 1], bytes[i + 2]]);
        let p = &bytes[i + 6..end - 2];
        if decode(ty, p, &mut items).is_none() {
            skipped += 1;
        }
        i = end;
    }
    let mut map = EpochMap::default();
    // The week of messages before the first week-bearing message is the first week seen.
    let first_week = items.iter().find_map(|it| match it {
        Item::Week(w) | Item::ObsHead { week: w, .. } => Some(*w),
        _ => None,
    });
    let mut week = first_week;
    let mut cur: Option<i64> = None;
    let key_of = |week: Option<i64>, tow: i64| match week {
        Some(w) => gps_week_ms(w, tow),
        None => tow,
    };
    let label = |week: Option<i64>, tow: i64| match week {
        Some(w) => crate::t!(
            "receiver-trust-ingest-gps-week-tow",
            week = w,
            tow = crate::i18n::localise_decimal(format!("{:.3}", tow as f64 / 1000.0))
        ),
        None => crate::t!(
            "receiver-trust-machines-gnss-sdr-gps-tow",
            v1 = crate::i18n::localise_decimal(format!("{:.3}", tow as f64 / 1000.0))
        ),
    };
    for it in items {
        match it {
            Item::Week(w) => week = Some(w),
            Item::Fix {
                tow,
                lat,
                lon,
                h,
                n,
            } => {
                let k = key_of(week, tow);
                cur = Some(k);
                let e = map.at(k);
                e.time_label.get_or_insert_with(|| label(week, tow));
                e.fix = Some(ReportedFix {
                    lat_deg: lat,
                    lon_deg: lon,
                    height_m: h,
                    n_used: Some(n),
                });
            }
            Item::Dop { tow, p, h, v } => {
                let k = key_of(week, tow);
                cur = Some(k);
                let e = map.at(k);
                e.time_label.get_or_insert_with(|| label(week, tow));
                e.reported_dop = Some(ReportedDop {
                    pdop: Some(p),
                    hdop: Some(h),
                    vdop: Some(v),
                    n_used: 0,
                });
            }
            Item::ObsHead { tow, week: w } => {
                week = Some(w);
                let k = key_of(week, tow);
                cur = Some(k);
                map.at(k).time_label.get_or_insert_with(|| label(week, tow));
            }
            Item::State => {}
            Item::Cn0 {
                sat,
                code,
                quarter_dbhz,
            } => {
                let (Some(k), Some((id, band))) = (cur, signal(sat, code)) else {
                    continue;
                };
                if quarter_dbhz == 0 {
                    continue;
                }
                let e = map.at(k);
                let v = f64::from(quarter_dbhz) / 4.0;
                if let Some(s) = e.cn0.iter_mut().find(|s| s.sat == id && s.band == band) {
                    s.cn0_dbhz = v;
                } else {
                    e.cn0.push(SatCn0 {
                        sat: id,
                        band: band.to_string(),
                        cn0_dbhz: v,
                    });
                }
            }
        }
    }
    let mut tl = map.finish(skipped);
    for e in &mut tl.epochs {
        if let (Some(d), Some(f)) = (e.reported_dop.as_mut(), e.fix) {
            d.n_used = f.n_used.unwrap_or(0);
        }
    }
    if tl.epochs.is_empty() {
        return Err(crate::terr!(
            "e-receiver-trust-ingest-the-log-holds-no-epochs",
            name = "SBP",
            skipped_records = skipped
        ));
    }
    Ok(tl)
}

/// Decode one payload into items; `Some(())` for a message read or passed over, `None` when a
/// message this reader reads is malformed.
fn decode(ty: u16, p: &[u8], out: &mut Vec<Item>) -> Option<()> {
    match ty {
        MSG_GPS_TIME | MSG_GPS_TIME_GNSS => {
            let (wn, tow) = (u16le(p, 0)?, u32le(p, 2)?);
            if p.get(10)? & 7 != 0 && i64::from(tow) < 604_800_000 {
                out.push(Item::Week(i64::from(wn)));
            }
        }
        MSG_POS_LLH | MSG_POS_LLH_GNSS => {
            let tow = i64::from(u32le(p, 0)?);
            let (lat, lon, h) = (f64le(p, 4)?, f64le(p, 12)?, f64le(p, 20)?);
            let (n, flags) = (*p.get(32)?, *p.get(33)?);
            if tow >= 604_800_000 {
                return None;
            }
            if flags & 7 != 0
                && (-90.0..=90.0).contains(&lat)
                && (-180.0..=360.0).contains(&lon)
                && h.is_finite()
            {
                out.push(Item::Fix {
                    tow,
                    lat,
                    lon,
                    h,
                    n: u32::from(n),
                });
            }
        }
        MSG_DOPS => {
            let tow = i64::from(u32le(p, 0)?);
            let d = |o| u16le(p, o).map(|v| f64::from(v) / 100.0);
            let (pd, hd, vd) = (d(6)?, d(10)?, d(12)?);
            if p.get(14)? & 7 != 0 && tow < 604_800_000 {
                out.push(Item::Dop {
                    tow,
                    p: pd,
                    h: hd,
                    v: vd,
                });
            }
        }
        MSG_OBS => {
            let tow = i64::from(u32le(p, 0)?);
            let week = i64::from(u16le(p, 8)?);
            if tow >= 604_800_000 || p.len() < 11 || !(p.len() - 11).is_multiple_of(17) {
                return None;
            }
            out.push(Item::ObsHead { tow, week });
            for o in (11..p.len()).step_by(17) {
                out.push(Item::Cn0 {
                    sat: p[o + 15],
                    code: p[o + 16],
                    quarter_dbhz: p[o + 12],
                });
            }
        }
        MSG_MEASUREMENT_STATE => {
            if !p.len().is_multiple_of(3) {
                return None;
            }
            out.push(Item::State);
            for s in p.chunks_exact(3) {
                out.push(Item::Cn0 {
                    sat: s[0],
                    code: s[1],
                    quarter_dbhz: s[2],
                });
            }
        }
        _ => {}
    }
    Some(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn crc_matches_the_ccitt_xmodem_check_value() {
        // CRC catalogue: CRC-16/XMODEM of "123456789" is 0x31C3.
        assert_eq!(crc16_ccitt(b"123456789"), 0x31C3);
    }

    #[test]
    fn signals_map_to_rinex_ids_and_bands() {
        assert_eq!(signal(5, 0), Some(("G05".into(), "L1")));
        assert_eq!(signal(11, 14), Some(("E11".into(), "E1")));
        assert_eq!(signal(194, 31), Some(("J02".into(), "L1")));
        assert_eq!(signal(131, 2), Some(("S31".into(), "L1")));
        assert_eq!(signal(7, 3), Some(("R07".into(), "G1")));
        assert_eq!(signal(103, 3), None); // FCN, not a slot
        assert_eq!(signal(1, 59), None); // auxiliary antenna
    }
}
