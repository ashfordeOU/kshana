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
//! type from the tracking status word (bits 16-18 and 21-25). Older Unicore receivers that emit
//! NovAtel-style headers (`AA 44 12`) are read by the NovAtel reader. Nothing is written to the
//! receiver.
//!
//! Interference reports, binary or ASCII (same manual): `AGC` (message 220, §7.5.7, Table 7-55:
//! ten signed 16-bit values, the master antenna's L1, L2 and L5 first, -1 for an invalid channel,
//! 0-119 otherwise), `JAMSTATUS` (511, §7.5.49, Table 7-106: position type u32, then `CWRatio` and
//! `CWFlag` u8) and `FREQJAMSTATUS` (519, §7.5.36, Table 7-91: position type u32, then ratio and flag
//! for L1, L2 and L5). The epoch's [`LogEpoch::agc`] is the mean of the master antenna's valid L1, L2
//! and L5 values (Unicore's own 0-119 scale; the manual says a lower value goes with more
//! interference), and a `CWFlag` (the highest over the bands of `FREQJAMSTATUS`) becomes the
//! receiver's jamming state in [`ReceiverSelfReport`]: flag 0 (no CW jam) is state 1, flag 1 (CW
//! jam) state 2 and flag 2 (strong CW jam) state 3. The ratio is not carried. Neither message
//! carries a spoofing flag.
//!
//! ASCII logs are `#NAME,cpu,timeref,timestatus,week,ms,version,reserved,leap,delay;fields*crc`
//! (Table 7-49), the CRC the same 32-bit CRC over the characters between `#` and `*` (Table
//! 7-46). Of the ASCII logs only `AGCA`, `JAMSTATUSA` and `FREQJAMSTATUSA` are read; others are
//! passed over. The manual's own example lines for these three logs are the test vector in
//! `conformance/connect/reader-unicore-ascii`.

use super::novatel::novatel_crc32;
use super::{gps_week_ms, sat_id_from_prn, EpochMap};
use crate::receiver_trust::{LogEpoch, ReceiverSelfReport, ReportedFix, SatCn0, Timeline};

/// `BESTNAV`.
pub const ID_BESTNAV: u16 = 2118;
/// `OBSVM`.
pub const ID_OBSVM: u16 = 12;
/// `AGC`.
pub const ID_AGC: u16 = 220;
/// `JAMSTATUS`.
pub const ID_JAMSTATUS: u16 = 511;
/// `FREQJAMSTATUS`.
pub const ID_FREQJAMSTATUS: u16 = 519;
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

/// Read a Unicore N4 stream (binary logs, and the ASCII interference logs) into a trust timeline.
pub fn read_unicore(bytes: &[u8]) -> Result<Timeline, String> {
    let mut map = EpochMap::default();
    let mut skipped = 0usize;
    let n = bytes.len();
    let mut i = 0usize;
    while i < n {
        if bytes[i] == b'#' {
            match ascii_record(bytes, i) {
                Some((end, rec)) => {
                    i = end;
                    match rec {
                        Ascii::Read {
                            id,
                            week,
                            ms,
                            fields,
                        } => {
                            if apply(&mut map, id, week, ms, Payload::Ascii(&fields)).is_none() {
                                skipped += 1;
                            }
                        }
                        Ascii::Other => {}
                        Ascii::BadCrc => skipped += 1,
                    }
                }
                None => i += 1,
            }
            continue;
        }
        if i + HEADER_LEN + 4 > n || bytes[i..i + 3] != [0xAA, 0x44, 0xB5] {
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
        if !matches!(
            id,
            ID_BESTNAV | ID_OBSVM | ID_AGC | ID_JAMSTATUS | ID_FREQJAMSTATUS
        ) {
            continue;
        }
        if apply(&mut map, id, week, ms, Payload::Binary(data)).is_none() {
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

/// A message body, binary or the ASCII fields after the `;`.
enum Payload<'a> {
    Binary(&'a [u8]),
    Ascii(&'a [String]),
}

/// What an ASCII line held.
enum Ascii {
    /// A log this reader reads, with its header time and its data fields.
    Read {
        id: u16,
        week: u16,
        ms: u32,
        fields: Vec<String>,
    },
    /// A well-formed line of another log, or one whose CRC is not checked here: passed over.
    Other,
    /// A line of a log this reader reads whose CRC does not match.
    BadCrc,
}

/// The longest ASCII line accepted, bytes.
const MAX_ASCII: usize = 4096;

/// Parse one ASCII line starting at `#` at `start`: `Some((end, what))`, or `None` when no
/// complete line starts there (the caller moves on by one byte).
fn ascii_record(b: &[u8], start: usize) -> Option<(usize, Ascii)> {
    let rest = &b[start..b.len().min(start + MAX_ASCII)];
    let star = rest.iter().position(|&c| c == b'*')?;
    let crc_hex = rest.get(star + 1..star + 9)?;
    let body = std::str::from_utf8(&rest[1..star]).ok()?;
    let crc_txt = std::str::from_utf8(crc_hex).ok()?;
    let want = u32::from_str_radix(crc_txt, 16).ok()?;
    let (head, data) = body.split_once(';')?;
    let h: Vec<&str> = head.split(',').collect();
    let name_ok = !h[0].is_empty()
        && h[0]
            .bytes()
            .all(|c| c.is_ascii_uppercase() || c.is_ascii_digit());
    if h.len() != 10 || !name_ok || !body.is_ascii() {
        return None;
    }
    let end = start + star + 9;
    let id = match h[0] {
        "AGCA" => ID_AGC,
        "JAMSTATUSA" => ID_JAMSTATUS,
        "FREQJAMSTATUSA" => ID_FREQJAMSTATUS,
        _ => return Some((end, Ascii::Other)),
    };
    if novatel_crc32(body.as_bytes()) != want {
        return Some((end, Ascii::BadCrc));
    }
    let (Ok(week), Ok(ms)) = (h[4].parse::<u16>(), h[5].parse::<u32>()) else {
        return Some((end, Ascii::BadCrc));
    };
    let fields = data.split(',').map(|f| f.trim().to_string()).collect();
    Some((
        end,
        Ascii::Read {
            id,
            week,
            ms,
            fields,
        },
    ))
}

/// Put one decoded message into its epoch; `None` when it is malformed.
fn apply(map: &mut EpochMap, id: u16, week: u16, ms: u32, body: Payload) -> Option<()> {
    if week == 0 || ms >= 604_800_000 {
        return None;
    }
    let key = gps_week_ms(i64::from(week), i64::from(ms));
    let label = crate::t!(
        "receiver-trust-ingest-gps-week-tow",
        week = week,
        tow = crate::i18n::localise_decimal(format!("{:.3}", f64::from(ms) / 1000.0))
    );
    // The interference logs are parsed before their epoch is made, so a malformed one adds none.
    let parsed = match (id, &body) {
        (ID_AGC, b) => Some(Parsed::Agc(agc_values(b)?)),
        (ID_JAMSTATUS | ID_FREQJAMSTATUS, b) => {
            let flags = cw_flags(id, b)?;
            if flags.iter().any(|&f| f > 2) {
                return None;
            }
            Some(Parsed::Jam(flags))
        }
        _ => None,
    };
    let e = map.at(key);
    e.time_label.get_or_insert(label);
    match (parsed, body) {
        (Some(Parsed::Agc(v)), _) => {
            agc(&v, e);
            Some(())
        }
        (Some(Parsed::Jam(f)), _) => jam(&f, e),
        (None, Payload::Binary(d)) if id == ID_BESTNAV => bestnav(d, e),
        (None, Payload::Binary(d)) if id == ID_OBSVM => obsvm(d, e),
        _ => None,
    }
}

/// An interference log, parsed.
enum Parsed {
    Agc([i16; 10]),
    Jam(Vec<u8>),
}

/// The ten `AGC` values (binary shorts or ASCII integers).
fn agc_values(b: &Payload) -> Option<[i16; 10]> {
    let mut v = [0i16; 10];
    match b {
        Payload::Binary(d) => {
            for (k, x) in v.iter_mut().enumerate() {
                *x = le16(d, 2 * k)? as i16;
            }
        }
        Payload::Ascii(f) => {
            if f.len() < 10 {
                return None;
            }
            for (k, x) in v.iter_mut().enumerate() {
                *x = f[k].parse().ok()?;
            }
        }
    }
    Some(v)
}

/// The master antenna's valid L1, L2 and L5 AGC values, averaged into the epoch.
fn agc(v: &[i16; 10], e: &mut LogEpoch) {
    let ok: Vec<f64> = v[..3]
        .iter()
        .filter(|x| (0..=119).contains(*x))
        .map(|&x| f64::from(x))
        .collect();
    if !ok.is_empty() {
        e.agc = Some(ok.iter().sum::<f64>() / ok.len() as f64);
    }
}

/// The `CWFlag` values of a `JAMSTATUS` (one) or `FREQJAMSTATUS` (L1, L2, L5) message.
fn cw_flags(id: u16, b: &Payload) -> Option<Vec<u8>> {
    let bands = if id == ID_JAMSTATUS { 1 } else { 3 };
    let mut out = Vec::with_capacity(bands);
    for k in 0..bands {
        let f = match b {
            // position type u32, then (ratio, flag) pairs
            Payload::Binary(d) => *d.get(4 + 2 * k + 1)?,
            // the position type is a name (`SINGLE`), then the pairs
            Payload::Ascii(f) => f.get(1 + 2 * k + 1)?.parse().ok()?,
        };
        out.push(f);
    }
    Some(out)
}

/// The receiver's jamming state from its `CWFlag` values (0-2, checked by the caller): flag 0, 1,
/// 2 to state 1, 2, 3; the highest band wins.
fn jam(flags: &[u8], e: &mut LogEpoch) -> Option<()> {
    let worst = flags.iter().copied().max()?;
    let state = worst + 1;
    let sr = e
        .self_report
        .get_or_insert_with(ReceiverSelfReport::default);
    sr.jamming = Some(sr.jamming.map_or(state, |j| j.max(state)));
    Some(())
}

fn bestnav(d: &[u8], e: &mut LogEpoch) -> Option<()> {
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

fn obsvm(d: &[u8], e: &mut LogEpoch) -> Option<()> {
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

    /// The example output lines of the N4 manual R1.13: §7.5.36 (FREQJAMSTATUS), §7.5.49
    /// (JAMSTATUS) and §7.5.7 (AGC), byte for byte, CRCs included.
    const MANUAL_EXAMPLES: &str =
        "#FREQJAMSTATUSA,97,GPS,FINE,2164,559464000,0,0,18,8;SINGLE,255,2,0,0,0,0,0,0*b0cdc7de\r\n\
#JAMSTATUSA,97,GPS,FINE,2190,365412000,0,0,18,14;SINGLE,0,0,0,0*e31418ea\r\n\
#AGCA,65,GPS,FINE,2190,375570000,0,0,18,37;44,46,63,-1,-1,41,1,0,-1,-1*634f1e4b\r\n";

    #[test]
    fn the_manual_example_lines_pass_their_crc_and_give_flags_and_agc() {
        let tl = read_unicore(MANUAL_EXAMPLES.as_bytes()).unwrap();
        assert_eq!(tl.skipped_records, 0);
        assert_eq!(tl.epochs.len(), 3);
        // FREQJAMSTATUS: L1 CWFlag 2 (strong CW jam) is the receiver's state 3.
        let sr = tl.epochs[0].self_report.unwrap();
        assert_eq!((sr.jamming, sr.spoofing), (Some(3), None));
        assert!(sr.flagged());
        // JAMSTATUS: CWFlag 0 is state 1 (none indicated).
        assert_eq!(tl.epochs[1].self_report.unwrap().jamming, Some(1));
        // AGC: the master antenna's L1, L2, L5 are 44, 46, 63.
        assert_eq!(tl.epochs[2].agc, Some(51.0));
        assert!(tl.epochs[2].self_report.is_none());
        assert_eq!(tl.observables, ["agc"]);
    }

    #[test]
    fn a_changed_ascii_line_fails_its_crc_and_is_counted() {
        let bad = MANUAL_EXAMPLES.replace("SINGLE,0,0,0,0", "SINGLE,0,1,0,0");
        let tl = read_unicore(bad.as_bytes()).unwrap();
        assert_eq!(tl.skipped_records, 1);
        assert_eq!(tl.epochs.len(), 2);
    }

    #[test]
    fn binary_interference_logs_match_the_ascii_meaning() {
        let mut agc = Vec::new();
        for v in [30i16, -1, 40, -1, -1, -1, -1, -1, -1, -1] {
            agc.extend(v.to_le_bytes());
        }
        let mut s = record(ID_AGC, 2300, 5000, &agc).unwrap();
        // JAMSTATUS: position type, ratio 120, flag 1 (CW jam)
        let mut js = 16u32.to_le_bytes().to_vec();
        js.extend([120, 1, 0, 0]);
        s.extend(record(ID_JAMSTATUS, 2300, 5000, &js).unwrap());
        // FREQJAMSTATUS a second later: L5 flag 2 wins over L1 flag 1
        let mut fj = 16u32.to_le_bytes().to_vec();
        fj.extend([10, 1, 0, 0, 200, 2, 0, 0]);
        s.extend(record(ID_FREQJAMSTATUS, 2300, 6000, &fj).unwrap());
        // a flag the manual does not define is malformed
        let mut bad = 16u32.to_le_bytes().to_vec();
        bad.extend([0, 7, 0, 0]);
        s.extend(record(ID_JAMSTATUS, 2300, 7000, &bad).unwrap());
        let tl = read_unicore(&s).unwrap();
        assert_eq!(tl.epochs[0].agc, Some(35.0));
        assert_eq!(tl.epochs[0].self_report.unwrap().jamming, Some(2));
        assert_eq!(tl.epochs[1].self_report.unwrap().jamming, Some(3));
        assert_eq!(tl.skipped_records, 1);
    }

    #[test]
    fn signal_bands_follow_the_tracking_status_table() {
        assert_eq!(band('G', 0), Some("L1"));
        assert_eq!(band('C', 12), Some("B2a"));
        assert_eq!(band('E', 17), Some("E5b"));
        assert_eq!(band('G', 31), None);
    }
}
