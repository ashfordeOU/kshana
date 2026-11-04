// SPDX-License-Identifier: AGPL-3.0-only
//! RTCM 3 State Space Representation (SSR) correction messages, read-only.
//!
//! SSR messages carry precise corrections to the broadcast navigation message: orbit (radial,
//! along-track, cross-track and their rates), clock (a polynomial), code biases per signal, the
//! user range accuracy class and high-rate clock, for GPS (1057–1062), GLONASS (1063–1068),
//! Galileo (1240–1245), QZSS (1246–1251), SBAS (1252–1257) and BeiDou (1258–1263), plus the
//! global ionosphere as spherical harmonics (1264). They are what PPP services such as IGS
//! real-time streams send.
//!
//! The field widths, scales and message layouts are taken from the BSD-licensed open decoder
//! pyrtcm 1.2.0 (`rtcmtypes_core.py`, `rtcmtypes_get.py`, `rtcmmessage.py`; BSD 3-Clause,
//! Copyright (c) 2020 semuadmin (Steve Smith)), as for the MSM reader in
//! [`crate::receiver_trust::machines::rtcm3`]; its notice is in `NOTICE`. No RTCM document
//! text is reproduced and no copy of the standard was consulted.
//!
//! Units out: metres, metres per second, metres per second squared. Code biases in metres.
//! Satellite numbers are the message's satellite ID as sent; labels prefix the system letter.
//!
//! Message 1264: the number of layers is the 2-bit field plus one. On the public sample stream
//! this reading uses every bit of the message exactly (one layer of degree and order 12), where
//! reading the field as the count itself would leave 2 720 bits unread.
//!
//! MODELLED: decoding is checked field by field against values the open decoder recorded for
//! public sample streams (`tests/rtcm_ssr_pyrtcm.rs`); corrections are not yet applied in PPP
//! (programme item R1.5).
use serde::Serialize;

/// The system a message is for.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum System {
    /// GPS (1057–1062).
    Gps,
    /// GLONASS (1063–1068).
    Glonass,
    /// Galileo (1240–1245).
    Galileo,
    /// QZSS (1246–1251).
    Qzss,
    /// SBAS (1252–1257).
    Sbas,
    /// BeiDou (1258–1263).
    Beidou,
}

impl System {
    fn letter(self) -> char {
        match self {
            Self::Gps => 'G',
            Self::Glonass => 'R',
            Self::Galileo => 'E',
            Self::Qzss => 'J',
            Self::Sbas => 'S',
            Self::Beidou => 'C',
        }
    }
    fn epoch_bits(self) -> usize {
        if self == Self::Glonass {
            17
        } else {
            20
        }
    }
    fn sat_bits(self) -> usize {
        match self {
            Self::Glonass => 5,
            Self::Qzss => 4,
            _ => 6,
        }
    }
}

/// What a message carries.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Kind {
    /// Orbit corrections.
    Orbit,
    /// Clock corrections.
    Clock,
    /// Code biases.
    CodeBias,
    /// Orbit and clock together.
    Combined,
    /// User range accuracy.
    Ura,
    /// High-rate clock.
    HighRateClock,
    /// Ionosphere (vertical TEC as spherical harmonics, 1264).
    Vtec,
}

fn classify(n: u16) -> Option<(Option<System>, Kind)> {
    let (sys, base) = match n {
        1057..=1062 => (System::Gps, 1057),
        1063..=1068 => (System::Glonass, 1063),
        1240..=1245 => (System::Galileo, 1240),
        1246..=1251 => (System::Qzss, 1246),
        1252..=1257 => (System::Sbas, 1252),
        1258..=1263 => (System::Beidou, 1258),
        1264 => return Some((None, Kind::Vtec)),
        _ => return None,
    };
    let kind = [
        Kind::Orbit,
        Kind::Clock,
        Kind::CodeBias,
        Kind::Combined,
        Kind::Ura,
        Kind::HighRateClock,
    ][(n - base) as usize];
    Some((Some(sys), kind))
}

/// Orbit correction (m, m/s).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Orbit {
    /// Radial (m).
    pub radial_m: f64,
    /// Along-track (m).
    pub along_m: f64,
    /// Cross-track (m).
    pub cross_m: f64,
    /// Radial rate (m/s).
    pub dot_radial_m_s: f64,
    /// Along-track rate (m/s).
    pub dot_along_m_s: f64,
    /// Cross-track rate (m/s).
    pub dot_cross_m_s: f64,
}

/// Clock correction polynomial (m, m/s, m/s²).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Clock {
    /// C0 (m).
    pub c0_m: f64,
    /// C1 (m/s).
    pub c1_m_s: f64,
    /// C2 (m/s²).
    pub c2_m_s2: f64,
}

/// One satellite's entry in a message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Sat {
    /// Satellite ID as sent.
    pub id: u8,
    /// System letter and ID, e.g. `G01`.
    pub label: String,
    /// Issue of data of the broadcast ephemeris the correction refers to (GPS/QZSS IODE,
    /// GLONASS IOD, Galileo IODnav, SBAS IOD CRC, BeiDou IOD).
    pub iod: Option<u32>,
    /// SBAS t0 modulo or BeiDou toe modulo, raw field value.
    pub toe_modulo_raw: Option<u32>,
    /// Orbit correction.
    pub orbit: Option<Orbit>,
    /// Clock correction.
    pub clock: Option<Clock>,
    /// Code biases: (signal and tracking mode identifier, bias in m).
    pub code_biases: Vec<(u8, f64)>,
    /// User range accuracy, raw 6-bit field.
    pub ura_raw: Option<u8>,
    /// High-rate clock correction (m).
    pub high_rate_clock_m: Option<f64>,
}

/// One ionospheric layer of message 1264.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct VtecLayer {
    /// Layer height (m).
    pub height_m: f64,
    /// Spherical harmonic degree N.
    pub degree: u8,
    /// Spherical harmonic order M.
    pub order: u8,
    /// Cosine coefficients (TECU), in transmission order.
    pub c_tecu: Vec<f64>,
    /// Sine coefficients (TECU), in transmission order.
    pub s_tecu: Vec<f64>,
}

/// One decoded SSR message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Message {
    /// Message number.
    pub number: u16,
    /// System (none for 1264).
    pub system: Option<System>,
    /// What the message carries.
    pub kind: Kind,
    /// Epoch time, seconds of the system's week (GLONASS: of the day).
    pub epoch_s: u32,
    /// SSR update interval, raw 4-bit code.
    pub update_interval: u8,
    /// Multiple message indicator.
    pub multiple: bool,
    /// Satellite reference datum (orbit and combined messages): false ITRF, true regional.
    pub regional_datum: Option<bool>,
    /// IOD SSR.
    pub iod_ssr: u8,
    /// SSR provider ID.
    pub provider: u16,
    /// SSR solution ID.
    pub solution: u8,
    /// Satellites (all kinds but 1264).
    pub sats: Vec<Sat>,
    /// VTEC quality indicator (TECU), 1264 only.
    pub vtec_quality_tecu: Option<f64>,
    /// Ionospheric layers, 1264 only.
    pub vtec_layers: Vec<VtecLayer>,
}

/// The SSR messages of a byte stream, and what was not read.
#[derive(Clone, Debug, Default, Serialize)]
pub struct Stream {
    /// Decoded SSR messages, in stream order.
    pub messages: Vec<Message>,
    /// RTCM frames whose CRC did not match.
    pub bad_crc: usize,
    /// Valid frames of other message numbers (skipped).
    pub other: usize,
    /// SSR frames shorter than their content says (skipped).
    pub truncated: usize,
}

struct Bits<'a> {
    b: &'a [u8],
    pos: usize,
}

impl Bits<'_> {
    fn u(&mut self, n: usize) -> Option<u64> {
        if self.pos + n > self.b.len() * 8 {
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
    /// Two's-complement signed field.
    fn i(&mut self, n: usize) -> Option<i64> {
        let v = self.u(n)? as i64;
        Some(if v >> (n - 1) & 1 == 1 {
            v - (1i64 << n)
        } else {
            v
        })
    }
}

const MM: f64 = 1e-3;

fn orbit(b: &mut Bits) -> Option<Orbit> {
    Some(Orbit {
        radial_m: b.i(22)? as f64 * 0.1 * MM,
        along_m: b.i(20)? as f64 * 0.4 * MM,
        cross_m: b.i(20)? as f64 * 0.4 * MM,
        dot_radial_m_s: b.i(21)? as f64 * 0.001 * MM,
        dot_along_m_s: b.i(19)? as f64 * 0.004 * MM,
        dot_cross_m_s: b.i(19)? as f64 * 0.004 * MM,
    })
}

fn clock(b: &mut Bits) -> Option<Clock> {
    Some(Clock {
        c0_m: b.i(22)? as f64 * 0.1 * MM,
        c1_m_s: b.i(21)? as f64 * 0.001 * MM,
        c2_m_s2: b.i(27)? as f64 * 0.00002 * MM,
    })
}

fn decode(p: &[u8]) -> Option<Message> {
    let mut b = Bits { b: p, pos: 0 };
    let number = b.u(12)? as u16;
    let (system, kind) = classify(number)?;
    let epoch_bits = system.map_or(20, System::epoch_bits);
    let epoch_s = b.u(epoch_bits)? as u32;
    let update_interval = b.u(4)? as u8;
    let multiple = b.u(1)? == 1;
    let regional_datum = matches!(kind, Kind::Orbit | Kind::Combined)
        .then(|| b.u(1).map(|v| v == 1))
        .flatten();
    if matches!(kind, Kind::Orbit | Kind::Combined) && regional_datum.is_none() {
        return None;
    }
    let iod_ssr = b.u(4)? as u8;
    let provider = b.u(16)? as u16;
    let solution = b.u(4)? as u8;
    let mut msg = Message {
        number,
        system,
        kind,
        epoch_s,
        update_interval,
        multiple,
        regional_datum,
        iod_ssr,
        provider,
        solution,
        sats: Vec::new(),
        vtec_quality_tecu: None,
        vtec_layers: Vec::new(),
    };
    let Some(sys) = system else {
        msg.vtec_quality_tecu = Some(b.u(9)? as f64 * 0.05);
        let layers = b.u(2)? as usize + 1;
        for _ in 0..layers {
            let height_m = b.u(8)? as f64 * 10_000.0;
            let n = b.u(4)? as usize + 1;
            let m = b.u(4)? as usize + 1;
            let nc = (n + 1) * (n + 2) / 2 - (n - m.min(n)) * (n - m.min(n) + 1) / 2;
            let ns = nc - (n + 1);
            let mut c_tecu = Vec::with_capacity(nc);
            for _ in 0..nc {
                c_tecu.push(b.i(16)? as f64 * 0.005);
            }
            let mut s_tecu = Vec::with_capacity(ns);
            for _ in 0..ns {
                s_tecu.push(b.i(16)? as f64 * 0.005);
            }
            msg.vtec_layers.push(VtecLayer {
                height_m,
                degree: n as u8,
                order: m as u8,
                c_tecu,
                s_tecu,
            });
        }
        return Some(msg);
    };
    let nsat = b.u(6)? as usize;
    for _ in 0..nsat {
        let id = b.u(sys.sat_bits())? as u8;
        let mut s = Sat {
            id,
            label: format!("{}{:02}", sys.letter(), id),
            iod: None,
            toe_modulo_raw: None,
            orbit: None,
            clock: None,
            code_biases: Vec::new(),
            ura_raw: None,
            high_rate_clock_m: None,
        };
        if matches!(kind, Kind::Orbit | Kind::Combined) {
            match sys {
                System::Gps | System::Glonass | System::Qzss => s.iod = Some(b.u(8)? as u32),
                System::Galileo => s.iod = Some(b.u(10)? as u32),
                System::Sbas => {
                    s.toe_modulo_raw = Some(b.u(9)? as u32);
                    s.iod = Some(b.u(24)? as u32);
                }
                System::Beidou => {
                    s.toe_modulo_raw = Some(b.u(10)? as u32);
                    s.iod = Some(b.u(8)? as u32);
                }
            }
            s.orbit = Some(orbit(&mut b)?);
        }
        match kind {
            Kind::Clock | Kind::Combined => s.clock = Some(clock(&mut b)?),
            Kind::CodeBias => {
                let n = b.u(5)? as usize;
                for _ in 0..n {
                    let sig = b.u(5)? as u8;
                    s.code_biases.push((sig, b.i(14)? as f64 * 0.01));
                }
            }
            Kind::Ura => s.ura_raw = Some(b.u(6)? as u8),
            Kind::HighRateClock => s.high_rate_clock_m = Some(b.i(22)? as f64 * 0.1 * MM),
            Kind::Orbit | Kind::Vtec => {}
        }
        msg.sats.push(s);
    }
    Some(msg)
}

/// Read every RTCM 3 frame of `bytes` and decode the SSR messages among them. Bytes that are
/// not RTCM frames (NMEA, UBX, noise) are stepped over.
pub fn read_stream(bytes: &[u8]) -> Stream {
    use crate::receiver_trust::machines::rtcm3::crc24q;
    let mut out = Stream::default();
    let mut i = 0;
    while i + 6 <= bytes.len() {
        if bytes[i] != 0xD3 || bytes[i + 1] & 0xFC != 0 {
            i += 1;
            continue;
        }
        let len = (usize::from(bytes[i + 1] & 0x03) << 8) | usize::from(bytes[i + 2]);
        let end = i + 3 + len;
        if end + 3 > bytes.len() {
            i += 1;
            continue;
        }
        let crc = (u32::from(bytes[end]) << 16)
            | (u32::from(bytes[end + 1]) << 8)
            | u32::from(bytes[end + 2]);
        if crc24q(&bytes[i..end]) != crc {
            out.bad_crc += 1;
            i += 1;
            continue;
        }
        let payload = &bytes[i + 3..end];
        let number = if payload.len() >= 2 {
            (u16::from(payload[0]) << 4) | u16::from(payload[1] >> 4)
        } else {
            0
        };
        if classify(number).is_none() {
            out.other += 1;
        } else {
            match decode(payload) {
                Some(m) => out.messages.push(m),
                None => out.truncated += 1,
            }
        }
        i = end + 3;
    }
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn message_numbers_map_to_systems_and_kinds() {
        assert_eq!(classify(1060), Some((Some(System::Gps), Kind::Combined)));
        assert_eq!(
            classify(1068),
            Some((Some(System::Glonass), Kind::HighRateClock))
        );
        assert_eq!(
            classify(1242),
            Some((Some(System::Galileo), Kind::CodeBias))
        );
        assert_eq!(classify(1250), Some((Some(System::Qzss), Kind::Ura)));
        assert_eq!(classify(1252), Some((Some(System::Sbas), Kind::Orbit)));
        assert_eq!(classify(1259), Some((Some(System::Beidou), Kind::Clock)));
        assert_eq!(classify(1264), Some((None, Kind::Vtec)));
        assert_eq!(classify(1074), None);
    }

    #[test]
    fn signed_fields_are_twos_complement() {
        let bytes = [0b1111_1111u8, 0b1000_0000];
        let mut b = Bits { b: &bytes, pos: 0 };
        assert_eq!(b.i(4), Some(-1));
        assert_eq!(b.i(5), Some(-1));
        assert_eq!(b.i(7), Some(0));
        assert_eq!(b.u(1), None);
    }

    #[test]
    fn a_frame_with_a_bad_crc_is_counted_not_read() {
        let s = read_stream(&[0xD3, 0x00, 0x02, 0x42, 0x40, 0x00, 0x00, 0x00]);
        assert_eq!((s.messages.len(), s.bad_crc), (0, 1));
    }
}
