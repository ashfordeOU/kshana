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
//! The IGS SSR format (RTCM message 4076, IGS SSR version 1) carries the same corrections, plus
//! phase biases with yaw, under an 8-bit IGS message number: GPS 21–27, GLONASS 41–47, Galileo
//! 61–67, QZSS 81–87, BeiDou 101–107, SBAS 121–127 (subtypes 1 orbit, 2 clock, 3 orbit and
//! clock, 4 high-rate clock, 5 code bias, 6 phase bias, 7 user range accuracy) and 201 for the
//! global ionosphere. Here every system has a 20-bit epoch (seconds of the GPS week), a 6-bit
//! satellite ID and an 8-bit issue of data. A 4076 message is reported with `number` 4076 and
//! the IGS message number in `igs_message`.
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
//! The IGS layout follows the same decoder (`rtcmtypes_get_igs.py`, after the IGS SSR v1 format
//! description). Its orbit-only definition lists the cross-track and radial-rate fields in the
//! other order from its combined one; Kshana reads orbit-only messages in the combined order, which
//! is also the order of the RTCM orbit messages. No sample stream holds an IGS orbit-only message.
//!
//! MODELLED: decoding is checked field by field against values the open decoder recorded for
//! public sample streams (`tests/rtcm_ssr_pyrtcm.rs`), for RTCM SSR and for IGS combined orbit and
//! clock, code bias and ionosphere messages. IGS orbit-only, clock-only, high-rate clock, phase-bias
//! and URA messages are checked only against hand-built frames, not an external oracle.
//! Corrections are not yet applied in PPP (programme item R1.5).
use serde::{Deserialize, Serialize};

/// The system a message is for.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
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
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
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
    /// Ionosphere (vertical TEC as spherical harmonics, 1264 and IGS 201).
    Vtec,
    /// Phase biases with yaw (IGS SSR only).
    PhaseBias,
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
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
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
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Clock {
    /// C0 (m).
    pub c0_m: f64,
    /// C1 (m/s).
    pub c1_m_s: f64,
    /// C2 (m/s²).
    pub c2_m_s2: f64,
}

/// One phase bias (IGS SSR subtype 6).
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct PhaseBias {
    /// Signal and tracking mode identifier.
    pub signal: u8,
    /// Signal integer indicator.
    pub integer: bool,
    /// Signals wide-lane integer indicator, raw 2-bit field.
    pub wide_lane_integer: u8,
    /// Signal discontinuity counter.
    pub discontinuity: u8,
    /// Phase bias (m).
    pub bias_m: f64,
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
    /// Yaw angle (semicircles), IGS phase-bias messages only.
    pub yaw_semicircles: Option<f64>,
    /// Yaw rate (semicircles/s), IGS phase-bias messages only.
    pub yaw_rate_semicircles_s: Option<f64>,
    /// Phase biases, IGS phase-bias messages only.
    pub phase_biases: Vec<PhaseBias>,
}

/// One ionospheric layer of message 1264.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
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
    /// Message number (4076 for every IGS SSR message).
    pub number: u16,
    /// IGS SSR version, 4076 only.
    pub igs_version: Option<u8>,
    /// IGS message number (e.g. 23 GPS orbit and clock, 201 ionosphere), 4076 only.
    pub igs_message: Option<u8>,
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
    /// Dispersive bias consistency and Melbourne-Wübbena consistency indicators, IGS
    /// phase-bias messages only.
    pub phase_consistency: Option<(bool, bool)>,
    /// Satellites (all kinds but 1264).
    pub sats: Vec<Sat>,
    /// VTEC quality indicator (TECU), 1264 and IGS 201 only.
    pub vtec_quality_tecu: Option<f64>,
    /// Ionospheric layers, 1264 and IGS 201 only.
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

// Scaled fields are computed as an exact integer over a power of ten, so each value is the
// double nearest the decimal the message means.

fn orbit(b: &mut Bits) -> Option<Orbit> {
    Some(Orbit {
        radial_m: b.i(22)? as f64 / 1e4,
        along_m: (b.i(20)? * 4) as f64 / 1e4,
        cross_m: (b.i(20)? * 4) as f64 / 1e4,
        dot_radial_m_s: b.i(21)? as f64 / 1e6,
        dot_along_m_s: (b.i(19)? * 4) as f64 / 1e6,
        dot_cross_m_s: (b.i(19)? * 4) as f64 / 1e6,
    })
}

fn clock(b: &mut Bits) -> Option<Clock> {
    Some(Clock {
        c0_m: b.i(22)? as f64 / 1e4,
        c1_m_s: b.i(21)? as f64 / 1e6,
        c2_m_s2: (b.i(27)? * 2) as f64 / 1e8,
    })
}

/// The header fields every SSR message shares, in the order they are read.
struct Header {
    epoch_s: u32,
    update_interval: u8,
    multiple: bool,
    iod_ssr: u8,
    provider: u16,
    solution: u8,
}

fn new_message(number: u16, system: Option<System>, kind: Kind, h: Header) -> Message {
    Message {
        number,
        igs_version: None,
        igs_message: None,
        system,
        kind,
        epoch_s: h.epoch_s,
        update_interval: h.update_interval,
        multiple: h.multiple,
        regional_datum: None,
        iod_ssr: h.iod_ssr,
        provider: h.provider,
        solution: h.solution,
        phase_consistency: None,
        sats: Vec::new(),
        vtec_quality_tecu: None,
        vtec_layers: Vec::new(),
    }
}

fn new_sat(sys: System, id: u8) -> Sat {
    Sat {
        id,
        label: format!("{}{:02}", sys.letter(), id),
        iod: None,
        toe_modulo_raw: None,
        orbit: None,
        clock: None,
        code_biases: Vec::new(),
        ura_raw: None,
        high_rate_clock_m: None,
        yaw_semicircles: None,
        yaw_rate_semicircles_s: None,
        phase_biases: Vec::new(),
    }
}

/// The ionosphere body shared by 1264 and IGS 201: quality, then layers of spherical
/// harmonics. The layer count, degree and order are each sent as the value minus one.
fn vtec_body(b: &mut Bits, msg: &mut Message) -> Option<()> {
    msg.vtec_quality_tecu = Some((b.u(9)? * 5) as f64 / 100.0);
    let layers = b.u(2)? as usize + 1;
    for _ in 0..layers {
        let height_m = b.u(8)? as f64 * 10_000.0;
        let n = b.u(4)? as usize + 1;
        let m = b.u(4)? as usize + 1;
        let nc = (n + 1) * (n + 2) / 2 - (n - m.min(n)) * (n - m.min(n) + 1) / 2;
        let ns = nc - (n + 1);
        let mut c_tecu = Vec::with_capacity(nc);
        for _ in 0..nc {
            c_tecu.push((b.i(16)? * 5) as f64 / 1000.0);
        }
        let mut s_tecu = Vec::with_capacity(ns);
        for _ in 0..ns {
            s_tecu.push((b.i(16)? * 5) as f64 / 1000.0);
        }
        msg.vtec_layers.push(VtecLayer {
            height_m,
            degree: n as u8,
            order: m as u8,
            c_tecu,
            s_tecu,
        });
    }
    Some(())
}

/// The per-kind satellite fields after the ID (and, for orbits, the issue of data), which the
/// RTCM and IGS layouts share.
fn sat_body(b: &mut Bits, kind: Kind, s: &mut Sat) -> Option<()> {
    if matches!(kind, Kind::Orbit | Kind::Combined) {
        s.orbit = Some(orbit(b)?);
    }
    match kind {
        Kind::Clock | Kind::Combined => s.clock = Some(clock(b)?),
        Kind::CodeBias => {
            let n = b.u(5)? as usize;
            for _ in 0..n {
                let sig = b.u(5)? as u8;
                s.code_biases.push((sig, b.i(14)? as f64 / 100.0));
            }
        }
        Kind::Ura => s.ura_raw = Some(b.u(6)? as u8),
        Kind::HighRateClock => s.high_rate_clock_m = Some(b.i(22)? as f64 / 1e4),
        Kind::PhaseBias => {
            let n = b.u(5)? as usize;
            s.yaw_semicircles = Some(b.u(9)? as f64 / 256.0);
            s.yaw_rate_semicircles_s = Some(b.i(8)? as f64 / 8192.0);
            for _ in 0..n {
                s.phase_biases.push(PhaseBias {
                    signal: b.u(5)? as u8,
                    integer: b.u(1)? == 1,
                    wide_lane_integer: b.u(2)? as u8,
                    discontinuity: b.u(4)? as u8,
                    bias_m: b.i(20)? as f64 / 1e4,
                });
            }
        }
        Kind::Orbit | Kind::Vtec => {}
    }
    Some(())
}

fn decode(p: &[u8]) -> Option<Message> {
    let mut b = Bits { b: p, pos: 0 };
    let number = b.u(12)? as u16;
    if number == IGS_SSR {
        return decode_igs(&mut b);
    }
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
    let header = Header {
        epoch_s,
        update_interval,
        multiple,
        iod_ssr: b.u(4)? as u8,
        provider: b.u(16)? as u16,
        solution: b.u(4)? as u8,
    };
    let mut msg = new_message(number, system, kind, header);
    msg.regional_datum = regional_datum;
    let Some(sys) = system else {
        vtec_body(&mut b, &mut msg)?;
        return Some(msg);
    };
    let nsat = b.u(6)? as usize;
    for _ in 0..nsat {
        let id = b.u(sys.sat_bits())? as u8;
        let mut s = new_sat(sys, id);
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
        }
        sat_body(&mut b, kind, &mut s)?;
        msg.sats.push(s);
    }
    Some(msg)
}

/// RTCM message number of the IGS SSR format.
const IGS_SSR: u16 = 4076;

/// The system and kind of an IGS message number.
fn classify_igs(n: u8) -> Option<(Option<System>, Kind)> {
    if n == 201 {
        return Some((None, Kind::Vtec));
    }
    let sys = match n / 20 {
        1 => System::Gps,
        2 => System::Glonass,
        3 => System::Galileo,
        4 => System::Qzss,
        5 => System::Beidou,
        6 => System::Sbas,
        _ => return None,
    };
    let kind = match n % 20 {
        1 => Kind::Orbit,
        2 => Kind::Clock,
        3 => Kind::Combined,
        4 => Kind::HighRateClock,
        5 => Kind::CodeBias,
        6 => Kind::PhaseBias,
        7 => Kind::Ura,
        _ => return None,
    };
    Some((Some(sys), kind))
}

/// An IGS SSR (4076) message, after its 12-bit message number.
fn decode_igs(b: &mut Bits) -> Option<Message> {
    let version = b.u(3)? as u8;
    let igs = b.u(8)? as u8;
    let (system, kind) = classify_igs(igs)?;
    let header = Header {
        epoch_s: b.u(20)? as u32,
        update_interval: b.u(4)? as u8,
        multiple: b.u(1)? == 1,
        iod_ssr: b.u(4)? as u8,
        provider: b.u(16)? as u16,
        solution: b.u(4)? as u8,
    };
    let mut msg = new_message(IGS_SSR, system, kind, header);
    msg.igs_version = Some(version);
    msg.igs_message = Some(igs);
    let Some(sys) = system else {
        vtec_body(b, &mut msg)?;
        return Some(msg);
    };
    if matches!(kind, Kind::Orbit | Kind::Combined) {
        msg.regional_datum = Some(b.u(1)? == 1);
    }
    if kind == Kind::PhaseBias {
        msg.phase_consistency = Some((b.u(1)? == 1, b.u(1)? == 1));
    }
    let nsat = b.u(6)? as usize;
    for _ in 0..nsat {
        let mut s = new_sat(sys, b.u(6)? as u8);
        if matches!(kind, Kind::Orbit | Kind::Combined) {
            s.iod = Some(b.u(8)? as u32);
        }
        sat_body(b, kind, &mut s)?;
        msg.sats.push(s);
    }
    Some(msg)
}

/// Whether a frame payload with this message number is one this module reads. For 4076 the
/// IGS message number (bits 15 to 22) decides.
fn is_ssr(number: u16, payload: &[u8]) -> bool {
    if number == IGS_SSR {
        let mut b = Bits {
            b: payload,
            pos: 15,
        };
        return b.u(8).is_some_and(|n| classify_igs(n as u8).is_some());
    }
    classify(number).is_some()
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
        if !is_ssr(number, payload) {
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

/// GPS time minus UTC, seconds (unchanged since 1 January 2017). Used only to place GLONASS RTCM
/// epochs (GLONASS time of day, UTC + 3 h) on GPS time.
const GPS_MINUS_UTC_S: i64 = 18;
/// GPS time minus BeiDou time, seconds.
const BDT_TO_GPS_S: i64 = 14;
const WEEK_S: i64 = 604_800;
const DAY_S: i64 = 86_400;

/// The candidate `x + k * period` nearest to `near`.
fn nearest(x: i64, period: i64, near: i64) -> i64 {
    x + ((near - x) as f64 / period as f64).round() as i64 * period
}

/// The stream's SSR messages as `kshana.obs/1` records for `station` (the correction stream, e.g.
/// its mountpoint): a header, then one correction record per satellite of each message in stream
/// order, and one per ionosphere message.
///
/// `t_s` is seconds since the first correction, on GPS time: the epochs are seconds of the GPS
/// week, each put in the week that brings it nearest the message before it (so two messages more
/// than half a week apart are ambiguous); a BeiDou RTCM epoch (BeiDou time) is moved 14 s to GPS time;
/// a GLONASS RTCM epoch (seconds of the GLONASS day, UTC + 3 h) is moved to GPS time with
/// GPS − UTC = 18 s and placed in the day of the message before it. Records are in stream order,
/// so `t_s` need not increase from one to the next. The header's
/// `skipped_records` counts frames with a bad CRC, truncated SSR frames and frames of other
/// messages; `observables` lists the kinds present.
pub fn to_obs(stream: &Stream, station: &crate::obs::Station) -> Vec<crate::obs::Record> {
    use crate::obs::{CorrectionRecord, Header, Record, SignalBias, SCHEMA};
    let mut kinds: Vec<String> = Vec::new();
    let mut recs = Vec::new();
    let mut first: Option<i64> = None;
    let mut last: Option<i64> = None;
    for m in &stream.messages {
        let glonass_day = m.igs_message.is_none() && m.system == Some(System::Glonass);
        let t_abs = if glonass_day {
            let tod = (i64::from(m.epoch_s) - 3 * 3_600 + GPS_MINUS_UTC_S).rem_euclid(DAY_S);
            nearest(tod, DAY_S, last.unwrap_or(tod))
        } else {
            // BeiDou RTCM epochs are BeiDou time, 14 s behind GPS time; IGS SSR epochs are GPS
            // time for every system.
            let bdt = m.igs_message.is_none() && m.system == Some(System::Beidou);
            let sow = i64::from(m.epoch_s) + if bdt { BDT_TO_GPS_S } else { 0 };
            nearest(sow, WEEK_S, last.unwrap_or(sow))
        };
        last = Some(t_abs);
        let t_s = (t_abs - *first.get_or_insert(t_abs)) as f64;
        let kind_name = serde_json::to_value(m.kind)
            .ok()
            .and_then(|v| v.as_str().map(str::to_string))
            .unwrap_or_default();
        if !kinds.contains(&kind_name) {
            kinds.push(kind_name);
        }
        let base = CorrectionRecord {
            station: station.id.clone(),
            t_s,
            source: if m.igs_message.is_some() {
                "igs-ssr"
            } else {
                "rtcm-ssr"
            }
            .to_string(),
            message: m.number,
            igs_message: m.igs_message,
            kind: m.kind,
            system: m.system,
            sat: None,
            epoch_s: m.epoch_s,
            update_interval: m.update_interval,
            multiple: m.multiple,
            iod_ssr: m.iod_ssr,
            provider: m.provider,
            solution: m.solution,
            regional_datum: m.regional_datum,
            iod: None,
            toe_modulo_raw: None,
            orbit: None,
            clock: None,
            high_rate_clock_m: None,
            code_biases: Vec::new(),
            phase_biases: Vec::new(),
            phase_consistency: m.phase_consistency,
            yaw_semicircles: None,
            yaw_rate_semicircles_s: None,
            ura_raw: None,
            vtec_quality_tecu: m.vtec_quality_tecu,
            vtec_layers: m.vtec_layers.clone(),
        };
        if m.kind == Kind::Vtec {
            recs.push(Record::Correction(Box::new(base)));
            continue;
        }
        for sat in &m.sats {
            recs.push(Record::Correction(Box::new(CorrectionRecord {
                sat: Some(sat.label.clone()),
                iod: sat.iod,
                toe_modulo_raw: sat.toe_modulo_raw,
                orbit: sat.orbit,
                clock: sat.clock,
                high_rate_clock_m: sat.high_rate_clock_m,
                code_biases: sat
                    .code_biases
                    .iter()
                    .map(|&(signal, bias_m)| SignalBias { signal, bias_m })
                    .collect(),
                phase_biases: sat.phase_biases.clone(),
                yaw_semicircles: sat.yaw_semicircles,
                yaw_rate_semicircles_s: sat.yaw_rate_semicircles_s,
                ura_raw: sat.ura_raw,
                ..base.clone()
            })));
        }
    }
    let mut out = Vec::with_capacity(recs.len() + 1);
    out.push(Record::Header(Header {
        schema: SCHEMA.to_string(),
        station: station.clone(),
        source_format: Some("rtcm-ssr".to_string()),
        start_label: None,
        observables: kinds,
        skipped_records: stream.bad_crc + stream.truncated + stream.other,
    }));
    out.extend(recs);
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
    fn igs_message_numbers_map_to_systems_and_kinds() {
        assert_eq!(classify_igs(23), Some((Some(System::Gps), Kind::Combined)));
        assert_eq!(
            classify_igs(46),
            Some((Some(System::Glonass), Kind::PhaseBias))
        );
        assert_eq!(
            classify_igs(65),
            Some((Some(System::Galileo), Kind::CodeBias))
        );
        assert_eq!(classify_igs(87), Some((Some(System::Qzss), Kind::Ura)));
        assert_eq!(classify_igs(101), Some((Some(System::Beidou), Kind::Orbit)));
        assert_eq!(
            classify_igs(124),
            Some((Some(System::Sbas), Kind::HighRateClock))
        );
        assert_eq!(classify_igs(201), Some((None, Kind::Vtec)));
        assert_eq!(classify_igs(28), None);
        assert_eq!(classify_igs(141), None);
    }

    /// Big-endian bit writer for hand-built frames.
    fn put(out: &mut Vec<bool>, v: i64, n: usize) {
        for i in (0..n).rev() {
            out.push((v >> i) & 1 == 1);
        }
    }

    fn frame(bits: &[bool]) -> Vec<u8> {
        use crate::receiver_trust::machines::rtcm3::crc24q;
        let mut payload = vec![0u8; bits.len().div_ceil(8)];
        for (i, b) in bits.iter().enumerate() {
            if *b {
                payload[i / 8] |= 0x80 >> (i % 8);
            }
        }
        let mut f = vec![0xD3, (payload.len() >> 8) as u8, payload.len() as u8];
        f.extend_from_slice(&payload);
        let crc = crc24q(&f);
        f.extend_from_slice(&[(crc >> 16) as u8, (crc >> 8) as u8, crc as u8]);
        f
    }

    fn igs_header(igs: i64) -> Vec<bool> {
        let mut b = Vec::new();
        // 4076, version 1, IGS message, epoch 345 600 s, interval 2, multiple, IOD SSR 7,
        // provider 258, solution 3.
        for (v, n) in [
            (4076, 12),
            (1, 3),
            (igs, 8),
            (345_600, 20),
            (2, 4),
            (1, 1),
            (7, 4),
            (258, 16),
            (3, 4),
        ] {
            put(&mut b, v, n);
        }
        b
    }

    #[test]
    fn igs_phase_bias_fields_read_as_laid_out() {
        // Galileo phase biases (66): consistency flags 1, 0; one satellite E11 with yaw
        // 128/256 = 0.5 semicircle, yaw rate -16/8192 semicircle/s and two biases.
        let mut b = igs_header(66);
        for (v, n) in [(1, 1), (0, 1), (1, 6), (11, 6), (2, 5), (128, 9), (-16, 8)] {
            put(&mut b, v, n);
        }
        // Signal 1: integer, wide-lane 2, discontinuity 5, +1.2345 m (12 345 x 0.1 mm).
        // Signal 9: not integer, wide-lane 0, discontinuity 15, -0.0001 m.
        for (v, n) in [(1, 5), (1, 1), (2, 2), (5, 4), (12_345, 20)] {
            put(&mut b, v, n);
        }
        for (v, n) in [(9, 5), (0, 1), (0, 2), (15, 4), (-1, 20)] {
            put(&mut b, v, n);
        }
        let s = read_stream(&frame(&b));
        assert_eq!((s.messages.len(), s.truncated, s.other), (1, 0, 0));
        let m = &s.messages[0];
        assert_eq!(
            (m.number, m.igs_version, m.igs_message, m.system, m.kind),
            (
                4076,
                Some(1),
                Some(66),
                Some(System::Galileo),
                Kind::PhaseBias
            )
        );
        assert_eq!(
            (
                m.epoch_s,
                m.update_interval,
                m.multiple,
                m.iod_ssr,
                m.provider,
                m.solution
            ),
            (345_600, 2, true, 7, 258, 3)
        );
        assert_eq!(m.phase_consistency, Some((true, false)));
        assert_eq!(m.regional_datum, None);
        let sat = &m.sats[0];
        assert_eq!(sat.label, "E11");
        assert_eq!(sat.yaw_semicircles, Some(0.5));
        assert_eq!(sat.yaw_rate_semicircles_s, Some(-16.0 / 8192.0));
        let p = &sat.phase_biases;
        assert_eq!(p.len(), 2);
        assert_eq!(
            (p[0].signal, p[0].integer, p[0].wide_lane_integer),
            (1, true, 2)
        );
        assert_eq!(p[0].discontinuity, 5);
        assert!((p[0].bias_m - 1.2345).abs() < 1e-12);
        assert_eq!(
            (p[1].signal, p[1].integer, p[1].discontinuity),
            (9, false, 15)
        );
        assert!((p[1].bias_m + 0.0001).abs() < 1e-12);
    }

    #[test]
    fn igs_orbit_and_ura_fields_read_as_laid_out() {
        // BeiDou orbit (101), regional datum; C05 IOD 200; radial -1 mm (-10 x 0.1 mm),
        // along 0.8 mm, cross -0.4 mm, rates 0.001, -0.004, 0.008 mm/s.
        let mut b = igs_header(101);
        for (v, n) in [(1, 1), (1, 6), (5, 6), (200, 8)] {
            put(&mut b, v, n);
        }
        for (v, n) in [(-10, 22), (2, 20), (-1, 20), (1, 21), (-1, 19), (2, 19)] {
            put(&mut b, v, n);
        }
        let s = read_stream(&frame(&b));
        let m = &s.messages[0];
        assert_eq!((m.kind, m.regional_datum), (Kind::Orbit, Some(true)));
        let o = m.sats[0].orbit.unwrap();
        assert_eq!(
            (m.sats[0].label.as_str(), m.sats[0].iod),
            ("C05", Some(200))
        );
        let want = [-1e-3, 0.8e-3, -0.4e-3, 1e-6, -4e-6, 8e-6];
        let got = [
            o.radial_m,
            o.along_m,
            o.cross_m,
            o.dot_radial_m_s,
            o.dot_along_m_s,
            o.dot_cross_m_s,
        ];
        for (g, w) in got.iter().zip(want) {
            assert!((g - w).abs() < 1e-15, "{g} vs {w}");
        }
        // SBAS URA (127): S20, raw class 33.
        let mut b = igs_header(127);
        for (v, n) in [(1, 6), (20, 6), (33, 6)] {
            put(&mut b, v, n);
        }
        let s = read_stream(&frame(&b));
        assert_eq!(s.messages[0].sats[0].label, "S20");
        assert_eq!(s.messages[0].sats[0].ura_raw, Some(33));
    }

    #[test]
    fn an_igs_message_of_another_number_is_skipped_not_truncated() {
        let mut b = igs_header(150);
        put(&mut b, 0, 8);
        let s = read_stream(&frame(&b));
        assert_eq!((s.messages.len(), s.other, s.truncated), (0, 1, 0));
    }

    #[test]
    fn correction_times_are_put_on_gps_time() {
        let msg = |number: u16, system: System, epoch_s: u32| {
            let mut m = new_message(
                number,
                Some(system),
                Kind::Clock,
                Header {
                    epoch_s,
                    update_interval: 0,
                    multiple: false,
                    iod_ssr: 0,
                    provider: 0,
                    solution: 0,
                },
            );
            m.sats.push(new_sat(system, 1));
            m
        };
        // GPS at 6 d 00:00:10 of the week; GLONASS 03:00:00 GLONASS time = 00:00:00 UTC =
        // 00:00:18 GPS of the same day; BeiDou 518 396 s BDT = 518 410 s GPS; GPS 10 s before
        // the week ends, then 5 s into the next week.
        let st = Stream {
            messages: vec![
                msg(1058, System::Gps, 518_410),
                msg(1064, System::Glonass, 10_800),
                msg(1259, System::Beidou, 518_396),
                msg(1058, System::Gps, 604_790),
                msg(1058, System::Gps, 5),
            ],
            ..Default::default()
        };
        let station = crate::obs::Station {
            id: "T".into(),
            ..Default::default()
        };
        let t: Vec<f64> = to_obs(&st, &station)
            .iter()
            .filter_map(|r| match r {
                crate::obs::Record::Correction(c) => Some(c.t_s),
                _ => None,
            })
            .collect();
        assert_eq!(t, vec![0.0, 8.0, 0.0, 86_380.0, 86_395.0]);
    }

    #[test]
    fn a_frame_with_a_bad_crc_is_counted_not_read() {
        let s = read_stream(&[0xD3, 0x00, 0x02, 0x42, 0x40, 0x00, 0x00, 0x00]);
        assert_eq!((s.messages.len(), s.bad_crc), (0, 1));
    }
}
