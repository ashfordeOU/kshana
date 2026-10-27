// SPDX-License-Identifier: AGPL-3.0-only
//! NovAtel OEM7-family log reader (ASCII and binary), read-only. Layouts follow the public
//! OEM7 documentation (docs.novatel.com): the ASCII and binary message headers, the 32-bit
//! CRC, and the field tables of three logs:
//!
//! * `BESTPOS` (message ID 42): the receiver's best position: solution status, latitude,
//!   longitude, height above mean sea level, undulation, satellites used.
//! * `RANGE` (ID 43): per-signal channel measurements; the carrier-to-noise density (C/No)
//!   goes to the trust timeline, with the satellite system and signal type read from the
//!   channel tracking status word (bits 16-18 and 21-25).
//! * `RXSTATUS` (ID 93): the receiver status and auxiliary 1 status words. The jammer flags
//!   (receiver status bit 15, auxiliary 1 bits 0-2 and 4-6) are returned in
//!   [`NovatelRead::status`] with their time, and set on the epoch as
//!   [`crate::receiver_trust::ReceiverSelfReport`] (`jamming` 2 when the receiver flags a
//!   jammer, 1 when it does not), which the `receiver-self-report` comparison sets against
//!   Kshana's monitors. RXSTATUS carries no spoofing flag.
//!
//! The abbreviated ASCII form (`<` lines) and the other logs are not read. A record whose
//! CRC does not match is skipped and counted. The engine never writes to the receiver.

use super::{gps_week_ms, sat_id_from_prn, EpochMap};
use crate::receiver_trust::{ReceiverSelfReport, ReportedFix, SatCn0, Timeline};

const POLY: u32 = 0xEDB8_8320;
const ID_BESTPOS: u16 = 42;
const ID_RANGE: u16 = 43;
const ID_RXSTATUS: u16 = 93;

/// The OEM7 32-bit CRC of a block (`CalculateBlockCRC32` in the documentation): reflected
/// polynomial `0xEDB88320`, zero initial value, no final inversion.
pub fn novatel_crc32(data: &[u8]) -> u32 {
    let mut crc = 0u32;
    for &b in data {
        let mut t = (crc ^ u32::from(b)) & 0xFF;
        for _ in 0..8 {
            t = if t & 1 != 0 { (t >> 1) ^ POLY } else { t >> 1 };
        }
        crc = ((crc >> 8) & 0x00FF_FFFF) ^ t;
    }
    crc
}

/// The receiver's own jammer report from one `RXSTATUS` log.
#[derive(Clone, Debug, PartialEq)]
pub struct JammerReport {
    /// Seconds since the first epoch of the timeline (same clock as `Timeline::epochs`).
    pub t_s: f64,
    /// Receiver status word bit 15: a jammer is detected.
    pub detected: bool,
    /// RF paths (1-6) the auxiliary 1 status word reports a jammer on.
    pub rf_paths: Vec<u8>,
}

/// What a NovAtel log held.
#[derive(Clone, Debug)]
pub struct NovatelRead {
    /// Position and C/No epochs.
    pub timeline: Timeline,
    /// The receiver's jammer reports, in time order.
    pub status: Vec<JammerReport>,
}

struct Rec<'a> {
    id: u16,
    week: i64,
    ms: i64,
    body: Payload<'a>,
}

enum Payload<'a> {
    /// Binary data bytes.
    Bin(&'a [u8]),
    /// ASCII data fields.
    Asc(Vec<&'a str>),
}

fn le16(b: &[u8], o: usize) -> Option<u16> {
    Some(u16::from_le_bytes(b.get(o..o + 2)?.try_into().ok()?))
}
fn le32(b: &[u8], o: usize) -> Option<u32> {
    Some(u32::from_le_bytes(b.get(o..o + 4)?.try_into().ok()?))
}
fn lef32(b: &[u8], o: usize) -> Option<f64> {
    Some(f64::from(f32::from_le_bytes(
        b.get(o..o + 4)?.try_into().ok()?,
    )))
}
fn lef64(b: &[u8], o: usize) -> Option<f64> {
    Some(f64::from_le_bytes(b.get(o..o + 8)?.try_into().ok()?))
}

fn ascii_id(name: &str) -> Option<u16> {
    match name {
        "BESTPOSA" => Some(ID_BESTPOS),
        "RANGEA" => Some(ID_RANGE),
        "RXSTATUSA" => Some(ID_RXSTATUS),
        _ => None,
    }
}

/// RINEX-style letter for the satellite-system code of a tracking status word.
fn system_letter(sys: u32) -> Option<char> {
    Some(match sys {
        0 => 'G',
        1 => 'R',
        2 => 'S',
        3 => 'E',
        4 => 'C',
        5 => 'J',
        6 => 'I',
        _ => return None,
    })
}

/// Signal label from the system code and the signal-type field (public table).
fn band(sys: u32, sig: u32) -> String {
    let s = match (sys, sig) {
        (0, 0) | (5, 0) | (2, 0) => "L1",
        (0, 5) | (0, 9) | (0, 17) | (5, 17) => "L2",
        (0, 14) | (5, 14) | (2, 6) | (6, 0) => "L5",
        (0, 16) | (5, 16) => "L1C",
        (1, 0) => "G1",
        (1, 1) | (1, 5) => "G2",
        (1, 6) => "G3",
        (3, 2) => "E1",
        (3, 6) | (3, 7) => "E6",
        (3, 12) => "E5a",
        (3, 17) => "E5b",
        (3, 20) => "E5",
        (4, 0) | (4, 4) => "B1",
        (4, 1) | (4, 5) => "B2",
        (4, 2) | (4, 6) => "B3",
        (4, 7) => "B1C",
        (4, 9) => "B2a",
        (4, 11) => "B2b",
        _ => return format!("S{sig}"),
    };
    s.to_string()
}

fn jammer(rxstat: u32, aux1: Option<u32>) -> (bool, Vec<u8>) {
    let mut paths = Vec::new();
    if let Some(a) = aux1 {
        for (bit, rf) in [(0, 1u8), (1, 2), (2, 3), (4, 4), (5, 5), (6, 6)] {
            if a & (1 << bit) != 0 {
                paths.push(rf);
            }
        }
    }
    (rxstat & 0x8000 != 0, paths)
}

/// Records of a binary or ASCII NovAtel stream, in file order, with the count skipped.
fn scan(bytes: &[u8]) -> (Vec<Rec<'_>>, usize) {
    let mut out = Vec::new();
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    while i < n {
        if bytes[i] == 0xAA && bytes.get(i + 1) == Some(&0x44) && bytes.get(i + 2) == Some(&0x12) {
            let Some(&hl) = bytes.get(i + 3) else { break };
            let hl = usize::from(hl);
            let (Some(id), Some(ml)) = (le16(bytes, i + 4), le16(bytes, i + 8)) else {
                break;
            };
            let total = hl + usize::from(ml) + 4;
            if hl < 28 || i + total > n {
                i += 1;
                continue;
            }
            let crc = le32(bytes, i + total - 4).unwrap_or(0);
            if novatel_crc32(&bytes[i..i + total - 4]) != crc {
                skipped += 1;
                i += 1;
                continue;
            }
            if matches!(id, ID_BESTPOS | ID_RANGE | ID_RXSTATUS) {
                if let (Some(week), Some(ms)) = (le16(bytes, i + 14), le32(bytes, i + 16)) {
                    out.push(Rec {
                        id,
                        week: i64::from(week),
                        ms: i64::from(ms),
                        body: Payload::Bin(&bytes[i + hl..i + total - 4]),
                    });
                }
            }
            i += total;
        } else if bytes[i] == b'#' && (i == 0 || bytes[i - 1] == b'\n' || bytes[i - 1] == b'\r') {
            let end = bytes[i..]
                .iter()
                .position(|&b| b == b'\n' || b == b'\r')
                .map_or(n, |p| i + p);
            let line = &bytes[i..end];
            i = end.max(i + 1);
            let Ok(text) = std::str::from_utf8(line) else {
                skipped += 1;
                continue;
            };
            let Some((payload, crc)) = text[1..].rsplit_once('*') else {
                skipped += 1;
                continue;
            };
            if u32::from_str_radix(crc.trim(), 16).ok() != Some(novatel_crc32(payload.as_bytes())) {
                skipped += 1;
                continue;
            }
            let Some((head, data)) = payload.split_once(';') else {
                skipped += 1;
                continue;
            };
            let h: Vec<&str> = head.split(',').collect();
            let Some(id) = h.first().and_then(|s| ascii_id(s)) else {
                continue; // a valid log of a message this reader does not use
            };
            let (Some(week), Some(secs)) = (
                h.get(5).and_then(|s| s.parse::<i64>().ok()),
                h.get(6).and_then(|s| s.parse::<f64>().ok()),
            ) else {
                skipped += 1;
                continue;
            };
            out.push(Rec {
                id,
                week,
                ms: (secs * 1000.0).round() as i64,
                body: Payload::Asc(data.split(',').collect()),
            });
        } else {
            i += 1;
        }
    }
    (out, skipped)
}

/// Read a NovAtel log (a mix of ASCII `#...*crc` lines and binary records is accepted).
pub fn read_novatel(bytes: &[u8]) -> Result<NovatelRead, String> {
    let (recs, mut skipped) = scan(bytes);
    let mut map = EpochMap::default();
    let mut jam: Vec<(i64, JammerReport)> = Vec::new();
    for r in &recs {
        if r.week == 0 || !(0..604_800_000).contains(&r.ms) {
            skipped += 1;
            continue;
        }
        let key = gps_week_ms(r.week, r.ms);
        let label = crate::t!(
            "receiver-trust-machines-novatel-gps-week-tow",
            week = r.week,
            r = crate::i18n::localise_decimal(format!("{:.3}", r.ms as f64 / 1000.0))
        );
        let ok = match r.id {
            ID_BESTPOS => best_pos(r, map.at(key), &label),
            ID_RANGE => range(r, map.at(key), &label),
            ID_RXSTATUS => rx_status(r).map(|(d, p)| {
                // The receiver's own jammer flag, in the self-report structure: state 2
                // (indicated) when it flags a jammer, 1 (none indicated) when it does not.
                // RXSTATUS has no spoofing flag, so `spoofing` stays unset.
                let e = map.at(key);
                e.time_label.get_or_insert_with(|| label.clone());
                e.self_report = Some(ReceiverSelfReport {
                    spoofing: None,
                    jamming: Some(if d { 2 } else { 1 }),
                    rf_bands_reported: None,
                });
                jam.push((
                    key,
                    JammerReport {
                        t_s: 0.0,
                        detected: d,
                        rf_paths: p,
                    },
                ));
            }),
            _ => None,
        };
        if ok.is_none() {
            skipped += 1;
        }
    }
    let first = jam
        .iter()
        .map(|(k, _)| *k)
        .chain(map_first(&map))
        .min()
        .unwrap_or(0);
    let timeline_first = map_first(&map).unwrap_or(first);
    let timeline = map.finish(skipped);
    if timeline.epochs.is_empty() && jam.is_empty() {
        return Err(crate::terr!(
            "e-receiver-trust-machines-novatel-no-bestpos-range-or-rxstatus",
            skipped = skipped
        ));
    }
    let status = jam
        .into_iter()
        .map(|(k, mut j)| {
            j.t_s = (k - timeline_first) as f64 / 1000.0;
            j
        })
        .collect();
    Ok(NovatelRead { timeline, status })
}

fn map_first(m: &EpochMap) -> Option<i64> {
    m.first_key()
}

fn best_pos(r: &Rec<'_>, e: &mut crate::receiver_trust::LogEpoch, label: &str) -> Option<()> {
    let (stat, lat, lon, hgt, und, nsol) = match &r.body {
        Payload::Bin(b) => (
            u64::from(le32(b, 0)?),
            lef64(b, 8)?,
            lef64(b, 16)?,
            lef64(b, 24)?,
            lef32(b, 32)?,
            u32::from(*b.get(65)?),
        ),
        Payload::Asc(f) => (
            u64::from(sol_status(f.first()?)?),
            f.get(2)?.parse().ok()?,
            f.get(3)?.parse().ok()?,
            f.get(4)?.parse().ok()?,
            f.get(5)?.parse().ok()?,
            f.get(15)?.trim().parse().ok()?,
        ),
    };
    e.time_label.get_or_insert_with(|| label.to_string());
    if stat == 0
        && (-90.0..=90.0).contains(&lat)
        && (-180.0..=360.0).contains(&lon)
        && hgt.is_finite()
        && und.is_finite()
    {
        e.fix = Some(ReportedFix {
            lat_deg: lat,
            lon_deg: lon,
            // BESTPOS height is above mean sea level; the fix field is ellipsoidal.
            height_m: hgt + und,
            n_used: Some(nsol),
        });
    }
    Some(())
}

/// Solution-status code from the ASCII enum name (public table).
fn sol_status(s: &str) -> Option<u32> {
    const NAMES: [&str; 10] = [
        "SOL_COMPUTED",
        "INSUFFICIENT_OBS",
        "NO_CONVERGENCE",
        "SINGULARITY",
        "COV_TRACE",
        "TEST_DIST",
        "COLD_START",
        "V_H_LIMIT",
        "VARIANCE",
        "RESIDUALS",
    ];
    NAMES
        .iter()
        .position(|n| *n == s)
        .map(|p| p as u32)
        .or((s == "INTEGRITY_WARNING").then_some(13))
}

fn range(r: &Rec<'_>, e: &mut crate::receiver_trust::LogEpoch, label: &str) -> Option<()> {
    let mut obs: Vec<(u32, f64, u32)> = Vec::new(); // prn, C/No, ch-tr-status
    match &r.body {
        Payload::Bin(b) => {
            let n = le32(b, 0)? as usize;
            if b.len() < 4 + n.checked_mul(44)? {
                return None;
            }
            for k in 0..n {
                let o = 4 + k * 44;
                obs.push((u32::from(le16(b, o)?), lef32(b, o + 32)?, le32(b, o + 40)?));
            }
        }
        Payload::Asc(f) => {
            let n: usize = f.first()?.trim().parse().ok()?;
            if f.len() < 1 + n.checked_mul(10)? {
                return None;
            }
            for k in 0..n {
                let o = 1 + k * 10;
                obs.push((
                    f[o].trim().parse().ok()?,
                    f[o + 7].trim().parse().ok()?,
                    u32::from_str_radix(f[o + 9].trim(), 16).ok()?,
                ));
            }
        }
    }
    e.time_label.get_or_insert_with(|| label.to_string());
    for (prn, cn0, st) in obs {
        let (sys, sig) = ((st >> 16) & 7, (st >> 21) & 0x1F);
        let Some(letter) = system_letter(sys) else {
            continue;
        };
        let Some(sat) = sat_id_from_prn(letter, prn) else {
            continue;
        };
        if !cn0.is_finite() || cn0 <= 0.0 {
            continue;
        }
        let b = band(sys, sig);
        if let Some(s) = e.cn0.iter_mut().find(|s| s.sat == sat && s.band == b) {
            s.cn0_dbhz = cn0;
        } else {
            e.cn0.push(SatCn0 {
                sat,
                band: b,
                cn0_dbhz: cn0,
            });
        }
    }
    Some(())
}

fn rx_status(r: &Rec<'_>) -> Option<(bool, Vec<u8>)> {
    let (rx, aux1) = match &r.body {
        Payload::Bin(b) => (le32(b, 8)?, le32(b, 24)),
        Payload::Asc(f) => (
            u32::from_str_radix(f.get(2)?.trim(), 16).ok()?,
            f.get(6)
                .and_then(|s| u32::from_str_radix(s.trim(), 16).ok()),
        ),
    };
    Some(jammer(rx, aux1))
}

#[cfg(test)]
mod tests {
    use super::*;

    /// A self-written BESTPOSA line. Its CRC is pinned below; the same CRC routine was checked
    /// during development against the CRC the OEM7 documentation states for its own BESTPOSA
    /// example (0x52483ac5), which is cited here and not quoted.
    const OWN_BESTPOSA: &str = "BESTPOSA,COM1,0,50.0,FINESTEERING,2300,100.000,02000000,0000,1;SOL_COMPUTED,SINGLE,59.91150000000,10.75790000000,52.0000,40.0000,WGS84,1.0000,1.0000,2.0000,\"\",0.000,0.000,14,12,12,12,00,00,00,00";

    fn ascii(head_and_data: &str) -> String {
        format!(
            "#{head_and_data}*{:08x}\r\n",
            novatel_crc32(head_and_data.as_bytes())
        )
    }

    fn bin(id: u16, week: u16, ms: u32, body: &[u8]) -> Vec<u8> {
        let mut m = vec![0xAA, 0x44, 0x12, 28];
        m.extend(id.to_le_bytes());
        m.extend([0, 0xC0]);
        m.extend((body.len() as u16).to_le_bytes());
        m.extend([0, 0, 0, 180]);
        m.extend(week.to_le_bytes());
        m.extend(ms.to_le_bytes());
        m.extend([0; 8]);
        m.extend(body);
        let c = novatel_crc32(&m);
        m.extend(c.to_le_bytes());
        m
    }

    #[test]
    fn crc_is_pinned_and_a_line_reads() {
        assert_eq!(novatel_crc32(OWN_BESTPOSA.as_bytes()), 0xa82c_1454);
        let r = read_novatel(ascii(OWN_BESTPOSA).as_bytes()).unwrap();
        let f = r.timeline.epochs[0].fix.unwrap();
        assert!((f.lat_deg - 59.9115).abs() < 1e-9);
        assert!((f.height_m - 92.0).abs() < 1e-9, "MSL 52 + undulation 40");
        assert_eq!(f.n_used, Some(12));
    }

    #[test]
    fn ascii_range_and_rxstatus() {
        // GPS L1 (system 0, signal 0) tracking status 0x00000004 plus Galileo E1 (3, 2).
        let gps = 0x0000_0004u32;
        let gal = (3u32 << 16) | (2 << 21) | 4;
        let range = ascii(&format!(
            "RANGEA,COM1,0,50.0,FINESTEERING,2300,100.000,02000000,5103,1;2,\
             5,0,2.4e7,0.2,-1.2e8,0.01,100.0,44.5,500.0,{gps:08x},\
             11,0,2.1e7,0.2,-1.2e8,0.01,100.0,38.0,500.0,{gal:08x}"
        ));
        let rx = ascii(
            "RXSTATUSA,COM1,0,50.0,FINESTEERING,2300,101.000,02000000,5103,1;00000000,2,\
             00008000,0,0,0,00000001,0,0,0",
        );
        let bad = rx.replace("00008000", "00000000"); // CRC no longer matches
        let r = read_novatel(format!("{range}{rx}{bad}").as_bytes()).unwrap();
        assert_eq!(r.timeline.skipped_records, 1);
        let c = &r.timeline.epochs[0].cn0;
        assert_eq!(c.len(), 2);
        assert!(c
            .iter()
            .any(|s| s.sat == "G05" && s.band == "L1" && s.cn0_dbhz == 44.5));
        assert!(c.iter().any(|s| s.sat == "E11" && s.band == "E1"));
        let sr = r
            .timeline
            .epochs
            .iter()
            .find_map(|e| e.self_report)
            .unwrap();
        assert_eq!((sr.jamming, sr.spoofing), (Some(2), None));
        assert!(sr.flagged());
        assert_eq!(r.status.len(), 1);
        assert!(r.status[0].detected && r.status[0].rf_paths == vec![1]);
        assert!((r.status[0].t_s - 1.0).abs() < 1e-9);
    }

    #[test]
    fn binary_bestpos_range_and_rxstatus() {
        let mut bp = Vec::new();
        bp.extend(0u32.to_le_bytes());
        bp.extend(16u32.to_le_bytes());
        for v in [59.9115f64, 10.7579, 12.0] {
            bp.extend(v.to_le_bytes());
        }
        bp.extend(40.0f32.to_le_bytes());
        bp.extend(vec![0u8; 28]); // through offset 64
        bp.extend([20, 14, 14, 10, 0, 0, 0, 0]);
        let mut rg = Vec::new();
        rg.extend(1u32.to_le_bytes());
        let mut o = vec![0u8; 44];
        o[0..2].copy_from_slice(&7u16.to_le_bytes());
        o[32..36].copy_from_slice(&41.25f32.to_le_bytes());
        o[40..44].copy_from_slice(&0x0000_0004u32.to_le_bytes());
        rg.extend(o);
        let mut st = vec![0u8; 24];
        st[8..12].copy_from_slice(&0x8000u32.to_le_bytes());
        st.extend(0x10u32.to_le_bytes());
        let mut stream = bin(ID_BESTPOS, 2300, 100_000, &bp);
        stream.extend(bin(ID_RANGE, 2300, 100_000, &rg));
        stream.extend(bin(ID_RXSTATUS, 2300, 101_000, &st));
        let mut broken = bin(ID_BESTPOS, 2300, 102_000, &bp);
        broken[40] ^= 0xFF;
        stream.extend(broken);
        let r = read_novatel(&stream).unwrap();
        let e = &r.timeline.epochs[0];
        assert_eq!(e.fix.unwrap().n_used, Some(14));
        assert!((e.fix.unwrap().height_m - 52.0).abs() < 1e-5);
        assert_eq!(e.cn0[0].sat, "G07");
        assert!((e.cn0[0].cn0_dbhz - 41.25).abs() < 1e-6);
        assert_eq!(r.timeline.skipped_records, 1);
        assert_eq!(r.status[0].rf_paths, vec![4]);
    }

    #[test]
    fn hostile_input_does_not_panic() {
        for s in [
            &b"#"[..],
            b"#A;B*zz",
            b"\xAA\x44\x12",
            b"\xAA\x44\x12\x1c\x2a\x00",
            b"",
        ] {
            let _ = read_novatel(s);
        }
        let mut v = bin(ID_RANGE, 1, 1, &[0xFF; 8]);
        v.extend(bin(ID_BESTPOS, 1, 1, &[0u8; 4]));
        let _ = read_novatel(&v);
    }
}
