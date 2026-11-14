// SPDX-License-Identifier: AGPL-3.0-only
//! MAVLink v1 and v2 GNSS messages from telemetry logs (`.tlog`) and from a live UDP stream, read only
//! (roadmap 0.42 I6).
//!
//! Framing (public MAVLink protocol documentation): v1 frames start with `0xFE` (length, sequence,
//! system, component, one-octet message id), v2 frames with `0xFD` (length, incompatibility and
//! compatibility flags, sequence, system, component, three-octet message id, and 13 signature octets
//! when the first incompatibility flag is set). The checksum is the X.25 CRC (CRC-16/MCRF4XX) of the
//! frame after the start octet, then the message's `CRC_EXTRA` octet; a v2 payload whose trailing zeros
//! were cut is extended with zeros. A `.tlog` puts a big-endian 64-bit Unix time in microseconds before
//! every frame. Messages read (field order and `CRC_EXTRA` from the MAVLink `common.xml` definitions):
//!
//! | Message | id | `CRC_EXTRA` | Use |
//! |---|---|---|---|
//! | `SYSTEM_TIME` | 2 | 137 | none (counted) |
//! | `GPS_RAW_INT` | 24 | 24 | a fix of the primary receiver |
//! | `GPS_STATUS` | 25 | 23 | per-satellite SNR, elevation, azimuth and use |
//! | `GPS2_RAW` | 124 | 87 | a fix of the second receiver |
//!
//! Every other message is stepped over by its length and counted; its checksum cannot be checked
//! without its definition.
//!
//! A fix needs a fix type of 2 (2D) or more. Trust attributes: `fix_type`, `satellites`, `hdop` and
//! `vdop` (`eph` and `epv` divided by 100, as the definition states), and where the message has its
//! extensions `h_acc_m` and `v_acc_m`. Class: `good` for a 3D fix or better, `degraded` for a 2D fix:
//! the receiver's own statement, nothing more. Heights are above mean sea level (`alt`).
//!
//! The live reader binds a UDP address and only receives: it sends no heartbeat and no request, so it
//! configures nothing; an autopilot that sends telemetry only to a ground station that answers will
//! send nothing to it.

use std::collections::BTreeMap;

use super::{Decoded, Fix, Quality};
use crate::receiver_trust::{LogEpoch, ReportedDop, ReportedFix, SatCn0, SatSky, Timeline};

/// The X.25 CRC (CRC-16/MCRF4XX) MAVLink uses, continued from `crc`.
pub fn crc_accumulate(crc: u16, data: &[u8]) -> u16 {
    let mut c = crc;
    for &b in data {
        let mut tmp = b ^ (c & 0xFF) as u8;
        tmp ^= tmp << 4;
        c = (c >> 8) ^ (u16::from(tmp) << 8) ^ (u16::from(tmp) << 3) ^ (u16::from(tmp) >> 4);
    }
    c
}

/// `CRC_EXTRA` and the full payload length of the messages read here.
pub fn known(msgid: u32) -> Option<(u8, usize)> {
    Some(match msgid {
        2 => (137, 12),
        24 => (24, 52),
        25 => (23, 101),
        124 => (87, 57),
        _ => return None,
    })
}

/// One frame.
#[derive(Clone, Debug, PartialEq)]
pub struct Frame {
    /// 1 or 2.
    pub version: u8,
    /// System id.
    pub sysid: u8,
    /// Component id.
    pub compid: u8,
    /// Message id.
    pub msgid: u32,
    /// The payload, extended with zeros to the message's full length when it is known.
    pub payload: Vec<u8>,
}

/// What [`frame_at`] found.
pub enum At {
    /// A frame of a known message with a good checksum, and its length.
    Good(Frame, usize),
    /// A frame of a message not read here, and its length.
    Unknown(usize),
    /// A known message whose checksum failed, and its length.
    BadCrc(usize),
    /// No frame starts here, or it is cut short.
    None,
}

/// The frame starting at `i`.
pub fn frame_at(b: &[u8], i: usize) -> At {
    let Some(&magic) = b.get(i) else {
        return At::None;
    };
    let (hdr, version) = match magic {
        0xFE => (6, 1),
        0xFD => (10, 2),
        _ => return At::None,
    };
    let Some(&len) = b.get(i + 1) else {
        return At::None;
    };
    let len = usize::from(len);
    let sig = if version == 2 && b.get(i + 2).is_some_and(|f| f & 1 == 1) {
        13
    } else {
        0
    };
    let total = hdr + len + 2 + sig;
    if i + total > b.len() {
        return At::None;
    }
    let f = &b[i..i + total];
    let (sysid, compid, msgid) = if version == 1 {
        (f[3], f[4], u32::from(f[5]))
    } else {
        (
            f[5],
            f[6],
            u32::from(f[7]) | u32::from(f[8]) << 8 | u32::from(f[9]) << 16,
        )
    };
    let Some((extra, full)) = known(msgid) else {
        return At::Unknown(total);
    };
    let crc = crc_accumulate(0xFFFF, &f[1..hdr + len]);
    let crc = crc_accumulate(crc, &[extra]);
    if crc.to_le_bytes() != [f[hdr + len], f[hdr + len + 1]] {
        return At::BadCrc(total);
    }
    let mut payload = f[hdr..hdr + len].to_vec();
    if payload.len() < full {
        payload.resize(full, 0);
    }
    At::Good(
        Frame {
            version,
            sysid,
            compid,
            msgid,
            payload,
        },
        total,
    )
}

fn u16_le(p: &[u8], i: usize) -> u16 {
    u16::from_le_bytes([p[i], p[i + 1]])
}
fn i32_le(p: &[u8], i: usize) -> i32 {
    i32::from_le_bytes([p[i], p[i + 1], p[i + 2], p[i + 3]])
}
fn u32_le(p: &[u8], i: usize) -> u32 {
    u32::from_le_bytes([p[i], p[i + 1], p[i + 2], p[i + 3]])
}
fn u64_le(p: &[u8], i: usize) -> u64 {
    let mut a = [0u8; 8];
    a.copy_from_slice(&p[i..i + 8]);
    u64::from_le_bytes(a)
}

/// A decoded GNSS position message (`GPS_RAW_INT` or `GPS2_RAW`).
#[derive(Clone, Debug, PartialEq)]
pub struct GpsRaw {
    /// 1 for `GPS_RAW_INT`, 2 for `GPS2_RAW`.
    pub receiver: u8,
    /// The message's own time (Unix or since boot), microseconds.
    pub time_usec: u64,
    /// Latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Height above mean sea level, metres.
    pub alt_m: f64,
    /// HDOP (`eph` / 100), when known.
    pub hdop: Option<f64>,
    /// VDOP (`epv` / 100), when known.
    pub vdop: Option<f64>,
    /// Fix type, 0–8.
    pub fix_type: u8,
    /// Satellites visible, when known.
    pub satellites: Option<u8>,
    /// Horizontal accuracy, metres (extension), when sent and non-zero.
    pub h_acc_m: Option<f64>,
    /// Vertical accuracy, metres (extension), when sent and non-zero.
    pub v_acc_m: Option<f64>,
}

/// Decode `GPS_RAW_INT` (24) or `GPS2_RAW` (124).
pub fn gps_raw(f: &Frame) -> Option<GpsRaw> {
    let p = &f.payload;
    let (fix_at, sats_at, acc_at, receiver) = match f.msgid {
        24 => (28, 29, 34, 1),
        124 => (32, 33, 41, 2),
        _ => return None,
    };
    let (eph_at, epv_at) = if f.msgid == 24 { (20, 22) } else { (24, 26) };
    let dop = |v: u16| (v != u16::MAX).then(|| f64::from(v) / 100.0);
    let acc = |v: u32| (v != 0).then(|| f64::from(v) / 1000.0);
    Some(GpsRaw {
        receiver,
        time_usec: u64_le(p, 0),
        lat_deg: f64::from(i32_le(p, 8)) * 1e-7,
        lon_deg: f64::from(i32_le(p, 12)) * 1e-7,
        alt_m: f64::from(i32_le(p, 16)) / 1000.0,
        hdop: dop(u16_le(p, eph_at)),
        vdop: dop(u16_le(p, epv_at)),
        fix_type: p[fix_at],
        satellites: (p[sats_at] != u8::MAX).then_some(p[sats_at]),
        h_acc_m: acc(u32_le(p, acc_at)),
        v_acc_m: acc(u32_le(p, acc_at + 4)),
    })
}

/// One satellite of `GPS_STATUS`: PRN, used, elevation degrees, azimuth degrees, SNR dB.
pub type SatStatus = (u8, bool, f64, f64, f64);

/// `GPS_STATUS` (25): per satellite (PRN, used, elevation degrees, azimuth degrees, SNR dB).
pub fn gps_status(f: &Frame) -> Vec<SatStatus> {
    let p = &f.payload;
    let n = usize::from(p[0]).min(20);
    (0..n)
        .map(|k| {
            (
                p[1 + k],
                p[21 + k] != 0,
                f64::from(p[41 + k]),
                f64::from(p[61 + k]) * 360.0 / 255.0,
                f64::from(p[81 + k]),
            )
        })
        .collect()
}

fn fix_of(g: &GpsRaw, sysid: u8, t: Option<f64>) -> Option<Fix> {
    if g.fix_type < 2 || (g.lat_deg == 0.0 && g.lon_deg == 0.0) {
        return None;
    }
    let mut x = Fix::new(
        "mavlink",
        format!("sys{sysid}/gps{}", g.receiver),
        t,
        g.lat_deg,
        g.lon_deg,
    );
    x.alt_m = Some(g.alt_m);
    let q = &mut x.quality;
    q.insert("fix_type".into(), g.fix_type.into());
    if let Some(v) = g.satellites {
        q.insert("satellites".into(), v.into());
    }
    for (k, v) in [
        ("hdop", g.hdop),
        ("vdop", g.vdop),
        ("h_acc_m", g.h_acc_m),
        ("v_acc_m", g.v_acc_m),
    ] {
        if let Some(v) = v {
            q.insert(k.into(), v.into());
        }
    }
    x.reported_quality = if g.fix_type >= 3 {
        Quality::Good
    } else {
        Quality::Degraded
    };
    x.extra.insert("time_usec".into(), g.time_usec.into());
    Some(x)
}

/// Every frame of a byte sequence, each with the `.tlog` time before it when `tlog`.
fn walk(bytes: &[u8], tlog: bool, mut each: impl FnMut(Option<f64>, &Frame), d: &mut Decoded) {
    let pre = if tlog { 8 } else { 0 };
    let mut i = 0;
    while i + pre < bytes.len() {
        let t = tlog.then(|| {
            let mut a = [0u8; 8];
            a.copy_from_slice(&bytes[i..i + 8]);
            u64::from_be_bytes(a) as f64 / 1e6
        });
        match frame_at(bytes, i + pre) {
            At::Good(f, n) => {
                d.read += 1;
                each(t, &f);
                i += pre + n;
            }
            At::Unknown(n) => {
                d.read += 1;
                d.other += 1;
                i += pre + n;
            }
            At::BadCrc(n) => {
                d.read += 1;
                d.bad_checksum += 1;
                i += pre + n;
            }
            At::None => {
                i += 1;
            }
        }
    }
}

fn decode_with(bytes: &[u8], tlog: bool) -> Decoded {
    let mut d = Decoded::default();
    let mut fixes = Vec::new();
    walk(
        bytes,
        tlog,
        |t, f| {
            if let Some(g) = gps_raw(f) {
                if let Some(x) = fix_of(&g, f.sysid, t) {
                    fixes.push(x);
                }
            }
        },
        &mut d,
    );
    d.fixes = fixes;
    d
}

/// Decode a `.tlog` (each frame after its 8-octet time).
pub fn decode_tlog(bytes: &[u8]) -> Decoded {
    decode_with(bytes, true)
}

/// Decode a raw stream of frames (no times).
pub fn decode_stream(bytes: &[u8]) -> Decoded {
    decode_with(bytes, false)
}

/// The primary receiver of a `.tlog` as a timeline: one epoch per `GPS_RAW_INT`, with the satellites of
/// the latest `GPS_STATUS` of the same system received within two seconds before it.
pub fn timeline(bytes: &[u8]) -> Timeline {
    let mut d = Decoded::default();
    let mut epochs = Vec::new();
    let mut status: BTreeMap<u8, (f64, Vec<SatStatus>)> = BTreeMap::new();
    let mut first = None;
    let mut skipped = 0;
    walk(
        bytes,
        true,
        |t, f| {
            let Some(t) = t else { return };
            if f.msgid == 25 {
                status.insert(f.sysid, (t, gps_status(f)));
                return;
            }
            if f.msgid != 24 {
                return;
            }
            let Some(g) = gps_raw(f) else { return };
            if g.fix_type < 1 {
                skipped += 1;
                return;
            }
            let t0 = *first.get_or_insert(t);
            let mut cn0 = Vec::new();
            let mut sky = Vec::new();
            if let Some((at, sats)) = status.get(&f.sysid) {
                if t >= *at && t - at <= 2.0 {
                    for &(prn, _used, el, az, snr) in sats {
                        let Some(sat) = super::sat_of_nmea_prn(u32::from(prn)) else {
                            continue;
                        };
                        if snr > 0.0 {
                            cn0.push(SatCn0 {
                                sat: sat.clone(),
                                band: "L1".into(),
                                cn0_dbhz: snr,
                            });
                        }
                        sky.push(SatSky {
                            sat,
                            elev_deg: el,
                            azim_deg: super::round_to(az, 1e6),
                            tracked: snr > 0.0,
                        });
                    }
                }
            }
            let n_used = g.satellites.map(u32::from);
            epochs.push(LogEpoch {
                t_s: t - t0,
                time_label: Some(super::iso(t)),
                cn0,
                fix: (g.fix_type >= 3).then_some(ReportedFix {
                    lat_deg: super::round_to(g.lat_deg, 1e7),
                    lon_deg: super::round_to(g.lon_deg, 1e7),
                    height_m: g.alt_m,
                    n_used,
                }),
                sky,
                reported_dop: (g.hdop.is_some() || g.vdop.is_some()).then_some(ReportedDop {
                    pdop: None,
                    hdop: g.hdop,
                    vdop: g.vdop,
                    n_used: n_used.unwrap_or(0),
                }),
                ..LogEpoch::default()
            });
        },
        &mut d,
    );
    crate::receiver_trust::ingest::timeline_from(epochs, skipped + d.bad_checksum)
}

/// Listen on a bound UDP socket, read only, until `max_messages` GNSS fixes have arrived or no datagram
/// has come for the socket's read timeout. Every fix is passed to `each` as it arrives, timed by the
/// computer's clock.
pub fn listen(
    sock: &std::net::UdpSocket,
    max_messages: Option<usize>,
    mut each: impl FnMut(&Fix),
) -> std::io::Result<Decoded> {
    let mut d = Decoded::default();
    let mut buf = vec![0u8; 65_536];
    loop {
        if max_messages.is_some_and(|m| d.fixes.len() >= m) {
            return Ok(d);
        }
        let n = match sock.recv(&mut buf) {
            Ok(n) => n,
            Err(e)
                if matches!(
                    e.kind(),
                    std::io::ErrorKind::WouldBlock | std::io::ErrorKind::TimedOut
                ) =>
            {
                return Ok(d)
            }
            Err(e) => return Err(e),
        };
        let now = std::time::SystemTime::now()
            .duration_since(std::time::UNIX_EPOCH)
            .map(|x| x.as_secs_f64())
            .unwrap_or(0.0);
        let mut part = Decoded::default();
        let mut got = Vec::new();
        walk(
            &buf[..n],
            false,
            |_, f| {
                if let Some(g) = gps_raw(f) {
                    if let Some(x) = fix_of(&g, f.sysid, Some(now)) {
                        got.push(x);
                    }
                }
            },
            &mut part,
        );
        d.read += part.read;
        d.other += part.other;
        d.bad_checksum += part.bad_checksum;
        for x in got {
            if max_messages.is_some_and(|m| d.fixes.len() >= m) {
                break;
            }
            each(&x);
            d.fixes.push(x);
        }
    }
}

#[cfg(test)]
pub(crate) mod tests {
    use super::*;

    /// Test encoder: a v2 frame (trailing zeros cut) or a v1 frame of a known message.
    pub(crate) fn frame(v2: bool, sysid: u8, msgid: u32, payload: &[u8], seq: u8) -> Vec<u8> {
        let (extra, _) = known(msgid).unwrap();
        let mut p = payload.to_vec();
        let mut f = if v2 {
            while p.len() > 1 && p.last() == Some(&0) {
                p.pop();
            }
            vec![
                0xFD,
                p.len() as u8,
                0,
                0,
                seq,
                sysid,
                1,
                msgid as u8,
                (msgid >> 8) as u8,
                (msgid >> 16) as u8,
            ]
        } else {
            vec![0xFE, p.len() as u8, seq, sysid, 1, msgid as u8]
        };
        f.extend_from_slice(&p);
        let crc = crc_accumulate(crc_accumulate(0xFFFF, &f[1..]), &[extra]);
        f.extend_from_slice(&crc.to_le_bytes());
        f
    }

    pub(crate) fn gps_raw_int(
        lat: f64,
        lon: f64,
        alt_mm: i32,
        fix: u8,
        sats: u8,
        eph: u16,
    ) -> Vec<u8> {
        let mut p = Vec::new();
        p.extend_from_slice(&1_700_000_000_000_000u64.to_le_bytes());
        p.extend_from_slice(&((lat * 1e7).round() as i32).to_le_bytes());
        p.extend_from_slice(&((lon * 1e7).round() as i32).to_le_bytes());
        p.extend_from_slice(&alt_mm.to_le_bytes());
        p.extend_from_slice(&eph.to_le_bytes());
        p.extend_from_slice(&150u16.to_le_bytes());
        p.extend_from_slice(&500u16.to_le_bytes());
        p.extend_from_slice(&9000u16.to_le_bytes());
        p.push(fix);
        p.push(sats);
        p.extend_from_slice(&0i32.to_le_bytes());
        p.extend_from_slice(&1500u32.to_le_bytes());
        p.extend_from_slice(&2500u32.to_le_bytes());
        p.extend_from_slice(&[0; 10]); // vel_acc, hdg_acc, yaw
        assert_eq!(p.len(), 52);
        p
    }

    #[test]
    fn x25_check_value() {
        // CRC-16/MCRF4XX of "123456789" is 0x6F91.
        assert_eq!(crc_accumulate(0xFFFF, b"123456789"), 0x6F91);
    }

    #[test]
    fn v1_and_v2_round_trip_and_a_bad_crc_is_counted() {
        let p = gps_raw_int(47.397742, 8.545594, 488_000, 3, 10, 121);
        for v2 in [false, true] {
            let mut tlog = Vec::new();
            tlog.extend_from_slice(&1_700_000_000_500_000u64.to_be_bytes());
            tlog.extend(frame(v2, 1, 24, &p, 0));
            let d = decode_tlog(&tlog);
            assert_eq!(d.fixes.len(), 1, "{d:?}");
            let f = &d.fixes[0];
            assert_eq!(f.t_unix_s, Some(1_700_000_000.5));
            assert_eq!(f.lat_deg, 47.397742);
            assert_eq!(f.quality["hdop"], 1.21);
            assert_eq!(f.quality["h_acc_m"], 1.5);
            assert_eq!(f.reported_quality, Quality::Good);
            let n = tlog.len();
            tlog[n - 1] ^= 0xFF;
            assert_eq!(decode_tlog(&tlog).bad_checksum, 1);
        }
    }
}
