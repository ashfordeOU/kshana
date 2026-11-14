// SPDX-License-Identifier: AGPL-3.0-only
//! Unicore N4 binary log reader (UM980/UM981/UM982 and related), read-only (roadmap 0.42 I3).
//!
//! Layouts follow Unicore's public *Reference Commands Manual for N4 High Precision Products*,
//! V2 R1.13 (en.unicore.com, downloaded 14 November 2026): the binary header (Table 7-48), the
//! message structure (Table 7-46: a 32-bit CRC over header and data), `BESTNAV` (message 2118,
//! Table 7-70), `OBSVM` (message 12, Table 7-126), the channel tracking status word and the
//! satellite numbering of Unicore-defined messages (Table 7-185). The CRC is the 32-bit CRC that
//! NovAtel logs also use ([`super::novatel::novatel_crc32`]), as RTKLIB's `unicore.c` (BSD 2-Clause)
//! also applies it.
//!
//! Header (24 bytes): sync `AA 44 B5`, CPU idle, message id (u16), message length (u16, data only),
//! time reference, time status, week (u16), milliseconds of week (u32), version (u32), reserved,
//! leap seconds, output delay (u16). Then the data and the CRC (u32 LE).
//!
//! What is read: `BESTNAV` position status, latitude, longitude, height above mean sea level plus
//! undulation (ellipsoidal height in the fix), satellites used; a status other than 0
//! (`SOL_COMPUTED`) gives no fix. `OBSVM` C/N0 per signal (`C/N0 × 100`), with the system and signal
//! type from the tracking status word (bits 16-18 and 21-25). Other messages, and Unicore ASCII
//! logs, are passed over. Older Unicore receivers that emit NovAtel-style headers (`AA 44 12`) are
//! read by the NovAtel reader. Nothing is written to the receiver.

use super::novatel::novatel_crc32;
use super::{gps_week_ms, sat_id_from_prn, EpochMap};
use crate::receiver_trust::{ReportedFix, SatCn0, Timeline};

/// `BESTNAV`.
pub const ID_BESTNAV: u16 = 2118;
/// `OBSVM`.
pub const ID_OBSVM: u16 = 12;
/// Binary header length.
pub const HEADER_LEN: usize = 24;

fn le16(b: &[u8], o: usize) -> Option<u16> {
    Some(u16::from_le_bytes(b.get(o..o + 2)?.try_into().ok()?))
}
fn le32(b: &[u8], o: usize) -> Option<u32> {
    Some(u32::from_le_bytes(b.get(o..o + 4)?.try_into().ok()?))
}
fn f32le(b: &[u8], o: usize) -> Option<f64> {
    Some(f64::from(f32::from_le_bytes(
        b.get(o..o + 4)?.try_into().ok()?,
    )))
}
fn f64le(b: &[u8], o: usize) -> Option<f64> {
    Some(f64::from_le_bytes(b.get(o..o + 8)?.try_into().ok()?))
}

/// One binary record around `data`: the encoder the round-trip tests use.
pub fn record(id: u16, week: u16, ms: u32, data: &[u8]) -> Option<Vec<u8>> {
    let len = u16::try_from(data.len()).ok()?;
    let mut m = vec![0xAA, 0x44, 0xB5, 90];
    m.extend(id.to_le_bytes());
    m.extend(len.to_le_bytes());
    m.extend([0, 180]); // GPST, FINE
    m.extend(week.to_le_bytes());
    m.extend(ms.to_le_bytes());
    m.extend([0u8; 4]); // version
    m.extend([0, 18]); // reserved, leap seconds
    m.extend([0u8; 2]); // output delay
    m.extend(data);
    let c = novatel_crc32(&m);
    m.extend(c.to_le_bytes());
    Some(m)
}

/// RINEX letter of the tracking status word's system field (bits 16-18).
fn letter(sys: u32) -> Option<char> {
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

/// Band of a signal type (bits 21-25) for a system, from the manual's tracking status table.
fn band(letter: char, sig: u32) -> Option<&'static str> {
    Some(match (letter, sig) {
        ('G', 0) | ('J', 0 | 1 | 4) | ('S', 0) => "L1",
        ('G', 3 | 11) | ('J', 3 | 11) => "L1C",
        ('G', 9 | 17) | ('J', 9 | 17) => "L2",
        ('G', 6 | 14) | ('J', 6 | 14) | ('S', 6) | ('I', 6 | 14) => "L5",
        ('J', 21 | 27) => "L6",
        ('R', 0) => "G1",
        ('R', 5) => "G2",
        ('R', 6 | 7) => "G3",
        ('E', 1 | 2) => "E1",
        ('E', 12) => "E5a",
        ('E', 17) => "E5b",
        ('E', 18 | 22) => "E6",
        ('C', 0 | 4) => "B1",
        ('C', 8 | 23) => "B1C",
        ('C', 5 | 17) => "B2",
        ('C', 12 | 28) => "B2a",
        ('C', 13) => "B2b",
        ('C', 6 | 21) => "B3",
        _ => return None,
    })
}

/// Read a Unicore N4 binary stream into a trust timeline.
pub fn read_unicore(bytes: &[u8]) -> Result<Timeline, String> {
    let mut map = EpochMap::default();
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    while i + HEADER_LEN + 4 <= n {
        if bytes[i..i + 3] != [0xAA, 0x44, 0xB5] {
            i += 1;
            continue;
        }
        let (Some(id), Some(len)) = (le16(bytes, i + 4), le16(bytes, i + 6)) else {
            break;
        };
        let end = i + HEADER_LEN + usize::from(len) + 4;
        if end > n {
            i += 1;
            continue;
        }
        if novatel_crc32(&bytes[i..end - 4]) != le32(bytes, end - 4).unwrap_or(0) {
            skipped += 1;
            i += 1;
            continue;
        }
        let week = le16(bytes, i + 10).unwrap_or(0);
        let ms = le32(bytes, i + 12).unwrap_or(u32::MAX);
        let data = &bytes[i + HEADER_LEN..end - 4];
        i = end;
        if !matches!(id, ID_BESTNAV | ID_OBSVM) {
            continue;
        }
        if week == 0 || ms >= 604_800_000 {
            skipped += 1;
            continue;
        }
        let key = gps_week_ms(i64::from(week), i64::from(ms));
        let label = crate::t!(
            "receiver-trust-ingest-gps-week-tow",
            week = week,
            tow = crate::i18n::localise_decimal(format!("{:.3}", f64::from(ms) / 1000.0))
        );
        let e = map.at(key);
        e.time_label.get_or_insert(label);
        let ok = if id == ID_BESTNAV {
            bestnav(data, e)
        } else {
            obsvm(data, e)
        };
        if ok.is_none() {
            skipped += 1;
        }
    }
    let tl = map.finish(skipped);
    if tl.epochs.is_empty() {
        return Err(crate::terr!(
            "e-receiver-trust-ingest-the-log-holds-no-epochs",
            name = "Unicore",
            skipped_records = skipped
        ));
    }
    Ok(tl)
}

fn bestnav(d: &[u8], e: &mut crate::receiver_trust::LogEpoch) -> Option<()> {
    let status = le32(d, 0)?;
    let (lat, lon, hgt, und) = (f64le(d, 8)?, f64le(d, 16)?, f64le(d, 24)?, f32le(d, 32)?);
    let used = *d.get(65)?;
    if status == 0
        && (-90.0..=90.0).contains(&lat)
        && (-180.0..=360.0).contains(&lon)
        && hgt.is_finite()
        && und.is_finite()
    {
        e.fix = Some(ReportedFix {
            lat_deg: lat,
            lon_deg: lon,
            height_m: hgt + und,
            n_used: Some(u32::from(used)),
        });
    }
    Some(())
}

fn obsvm(d: &[u8], e: &mut crate::receiver_trust::LogEpoch) -> Option<()> {
    let nobs = le32(d, 0)? as usize;
    if d.len() < 4 + nobs.checked_mul(40)? {
        return None;
    }
    for k in 0..nobs {
        let o = 4 + k * 40;
        let prn = u32::from(le16(d, o + 2)?);
        let cn0 = f64::from(le16(d, o + 28)?) / 100.0;
        let st = le32(d, o + 36)?;
        let Some(l) = letter((st >> 16) & 7) else {
            continue;
        };
        let num = if l == 'R' {
            match prn.checked_sub(37) {
                Some(s) => s,
                None => continue,
            }
        } else {
            prn
        };
        let (Some(sat), Some(b)) = (sat_id_from_prn(l, num), band(l, (st >> 21) & 0x1F)) else {
            continue;
        };
        if cn0 <= 0.0 {
            continue;
        }
        if let Some(s) = e.cn0.iter_mut().find(|s| s.sat == sat && s.band == b) {
            s.cn0_dbhz = cn0;
        } else {
            e.cn0.push(SatCn0 {
                sat,
                band: b.to_string(),
                cn0_dbhz: cn0,
            });
        }
    }
    Some(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_record_with_a_bad_crc_is_skipped_and_counted() {
        let mut d = vec![0u8; 72];
        d[8..16].copy_from_slice(&59.0f64.to_le_bytes());
        d[16..24].copy_from_slice(&24.0f64.to_le_bytes());
        d[65] = 9;
        let mut r = record(ID_BESTNAV, 2300, 1000, &d).unwrap();
        let good = r.clone();
        let last = r.len() - 1;
        r[last] ^= 1;
        r.extend(good);
        let tl = read_unicore(&r).unwrap();
        assert_eq!(tl.skipped_records, 1);
        assert_eq!(tl.epochs[0].fix.unwrap().n_used, Some(9));
    }

    #[test]
    fn signal_bands_follow_the_tracking_status_table() {
        assert_eq!(band('G', 0), Some("L1"));
        assert_eq!(band('C', 12), Some("B2a"));
        assert_eq!(band('E', 17), Some("E5b"));
        assert_eq!(band('G', 31), None);
    }
}
