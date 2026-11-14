// SPDX-License-Identifier: AGPL-3.0-only
//! RTCM 3 observation and station decoding beyond C/N0 (roadmap 0.42 I3): MSM4 and MSM7 full
//! pseudorange, phase range, phase-range rate, lock-time indicator and half-cycle flag per cell, and
//! the stationary reference station messages 1005 and 1006 (antenna reference point, and in 1006
//! the antenna height). Read-only, with an encoder for the round-trip tests and the vectors.
//!
//! Field widths, scale factors, invalid-value markers and the signal-id tables follow the open
//! decoders RTKLIB (`src/rtcm3.c`, demo5 branch; BSD 2-Clause, Copyright (c) 2007-2020 T. Takasu)
//! and pyrtcm 1.2.0 (BSD 3-Clause; already cited by [`super::rtcm3`]), which state that they follow
//! RTCM 10403.3. No RTCM document text is reproduced and no copy of the standard was consulted;
//! check against the standard before relying on this for anything beyond monitoring.
//!
//! * MSM4: per satellite the rough range in whole milliseconds (8 bits, 255 = invalid) and modulo
//!   1 ms (10 bits, 2^-10 ms); per cell the fine pseudorange (15 bits signed, 2^-24 ms), the fine
//!   phase range (22 bits signed, 2^-29 ms), the lock-time indicator (4 bits), the half-cycle flag
//!   and the CNR (6 bits, dB-Hz).
//! * MSM7: as MSM4 with the extended satellite information (4 bits; GLONASS frequency channel + 7)
//!   and the rough phase-range rate (14 bits signed, m/s) per satellite, and per cell the fine
//!   pseudorange (20 bits, 2^-29 ms), fine phase range (24 bits, 2^-31 ms), lock-time indicator
//!   (10 bits), half-cycle flag, CNR (10 bits, 2^-4 dB-Hz) and fine phase-range rate (15 bits
//!   signed, 0.0001 m/s).
//! * Ranges are given in metres (milliseconds × c / 1000 with c = 299 792 458 m/s); turning a phase
//!   range into cycles needs the carrier frequency, which this decoder does not assume.
//! * 1005/1006: station id, ITRF realisation year, the GPS, GLONASS and Galileo indicators, the
//!   reference-station indicator, X/Y/Z (38 bits signed, 0.0001 m), and in 1006 the antenna height
//!   (16 bits, 0.0001 m).

use super::rtcm3::crc24q;
use serde::Serialize;

/// Metres in one millisecond of light time.
const RANGE_MS: f64 = 299_792_458.0 * 0.001;

struct Bits<'a> {
    b: &'a [u8],
    pos: usize,
}

impl Bits<'_> {
    fn u(&mut self, n: usize) -> Option<u64> {
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
    fn s(&mut self, n: usize) -> Option<i64> {
        let v = self.u(n)?;
        Some(if n < 64 && v >> (n - 1) & 1 == 1 {
            v as i64 - (1i64 << n)
        } else {
            v as i64
        })
    }
}

/// A big-endian bit writer (the encoder side of the round trip).
#[derive(Default)]
pub struct BitWriter {
    bytes: Vec<u8>,
    n: usize,
}

impl BitWriter {
    /// Append the low `bits` bits of `v` (two's complement for negative values).
    pub fn put(&mut self, v: i64, bits: usize) {
        for i in (0..bits).rev() {
            if self.n.is_multiple_of(8) {
                self.bytes.push(0);
            }
            let bit = ((v >> i) & 1) as u8;
            if let Some(last) = self.bytes.last_mut() {
                *last |= bit << (7 - self.n % 8);
            }
            self.n += 1;
        }
    }
    /// The bytes written, zero-padded to a whole byte.
    pub fn finish(self) -> Vec<u8> {
        self.bytes
    }
}

/// A frame around a payload: preamble `0xD3`, six reserved bits and the 10-bit length, the
/// payload, and the CRC-24Q.
pub fn frame(payload: &[u8]) -> Option<Vec<u8>> {
    if payload.len() > 1023 {
        return None;
    }
    let mut f = vec![0xD3, (payload.len() >> 8) as u8, payload.len() as u8];
    f.extend_from_slice(payload);
    let c = crc24q(&f);
    f.extend([(c >> 16) as u8, (c >> 8) as u8, c as u8]);
    Some(f)
}

/// A stationary reference station's antenna reference point (1005, or 1006 with its height).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct StationArp {
    /// 1005 or 1006.
    pub message: u16,
    /// Reference station id.
    pub station_id: u16,
    /// ITRF realisation year field (6 bits, as transmitted).
    pub itrf_year: u8,
    /// GPS, GLONASS and Galileo service indicators.
    pub gps: bool,
    /// GLONASS service indicator.
    pub glonass: bool,
    /// Galileo service indicator.
    pub galileo: bool,
    /// Reference-station indicator (0 physical, 1 non-physical).
    pub non_physical: bool,
    /// ECEF X, Y, Z of the antenna reference point, m (0.1 mm resolution).
    pub ecef_m: [f64; 3],
    /// Antenna height above the marker, m (1006 only).
    pub antenna_height_m: Option<f64>,
}

/// One cell (satellite and signal) of an MSM message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct MsmCell {
    /// Satellite id in RINEX style (`G05`, `R07`, `S20`).
    pub sat: String,
    /// Signal id (1-32, the position in the signal mask).
    pub signal_id: u8,
    /// RINEX observation code of the signal (`1C`, `2W`, `5Q`), where the open tables list it.
    pub rinex_code: Option<&'static str>,
    /// Full pseudorange, m.
    pub pseudorange_m: Option<f64>,
    /// Full phase range, m (phase in cycles = phase range × frequency / c).
    pub phaserange_m: Option<f64>,
    /// Full phase-range rate, m/s (MSM7 only).
    pub phaserange_rate_m_s: Option<f64>,
    /// Lock-time indicator as transmitted (4 bits in MSM4, 10 bits in MSM7).
    pub lock_indicator: u16,
    /// Half-cycle ambiguity indicator.
    pub half_cycle: bool,
    /// Carrier-to-noise ratio, dB-Hz (`None` when transmitted as 0).
    pub cnr_dbhz: Option<f64>,
}

/// One MSM4 or MSM7 message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct MsmMessage {
    /// Message number (1074, 1077, 1084, ...).
    pub message: u16,
    /// Reference station id.
    pub station_id: u16,
    /// Epoch time field as transmitted: ms of week (GPS, Galileo, SBAS, QZSS, NavIC), ms of the
    /// BeiDou week (BDT), or for GLONASS the ms of day in Moscow time with `glonass_day`.
    pub epoch_ms: u32,
    /// GLONASS day of week (0 Sunday), GLONASS messages only.
    pub glonass_day: Option<u8>,
    /// Multiple-message bit: more MSM messages follow for the same epoch.
    pub multiple: bool,
    /// Issue of data station.
    pub iods: u8,
    /// Per satellite, the extended satellite information (MSM7; GLONASS: frequency channel + 7).
    pub extended_info: Vec<(String, u8)>,
    /// The cells, satellite by satellite in mask order, signals in mask order.
    pub cells: Vec<MsmCell>,
}

/// What [`decode`] found in a stream.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Rtcm3Decoded {
    /// 1005/1006 station messages.
    pub stations: Vec<StationArp>,
    /// MSM4 and MSM7 observation messages.
    pub msm: Vec<MsmMessage>,
    /// Frames with a valid CRC of message types this decoder does not read, by type.
    pub other: std::collections::BTreeMap<u16, usize>,
    /// Frames that failed their CRC or claimed a type this decoder reads and were malformed.
    pub skipped: usize,
}

#[derive(Clone, Copy, PartialEq)]
enum Sys {
    G,
    R,
    E,
    S,
    J,
    C,
    I,
}

fn system(msg: u16) -> Option<(Sys, bool)> {
    let s = match msg / 10 {
        107 => Sys::G,
        108 => Sys::R,
        109 => Sys::E,
        110 => Sys::S,
        111 => Sys::J,
        112 => Sys::C,
        113 => Sys::I,
        _ => return None,
    };
    match msg % 10 {
        4 => Some((s, false)),
        7 => Some((s, true)),
        _ => None,
    }
}

fn sat_id(sys: Sys, id: u32) -> Option<String> {
    let (l, n) = match sys {
        Sys::G => ('G', id),
        Sys::R => ('R', id),
        Sys::E => ('E', id),
        Sys::S => ('S', id + 19),
        Sys::J => ('J', id),
        Sys::C => ('C', id),
        Sys::I => ('I', id),
    };
    (1..=99).contains(&n).then(|| format!("{l}{n:02}"))
}

/// RINEX code of a signal id, from the open decoders' tables (the tentative extensions some
/// decoders add are left out).
pub fn rinex_code(sys_msg: u16, sig: u8) -> Option<&'static str> {
    let (sys, _) = system(sys_msg)?;
    Some(match (sys, sig) {
        (Sys::G, 2) | (Sys::R, 2) | (Sys::E, 2) | (Sys::S, 2) | (Sys::J, 2) => "1C",
        (Sys::G, 3) | (Sys::R, 3) => "1P",
        (Sys::G, 4) => "1W",
        (Sys::G, 8) | (Sys::R, 8) => "2C",
        (Sys::G, 9) | (Sys::R, 9) => "2P",
        (Sys::G, 10) => "2W",
        (Sys::G, 15) | (Sys::J, 15) => "2S",
        (Sys::G, 16) | (Sys::J, 16) => "2L",
        (Sys::G, 17) | (Sys::J, 17) => "2X",
        (Sys::G, 22) | (Sys::E, 22) | (Sys::S, 22) | (Sys::J, 22) => "5I",
        (Sys::G, 23) | (Sys::E, 23) | (Sys::S, 23) | (Sys::J, 23) => "5Q",
        (Sys::G, 24) | (Sys::E, 24) | (Sys::S, 24) | (Sys::J, 24) | (Sys::C, 24) => "5X",
        (Sys::G, 30) | (Sys::J, 30) => "1S",
        (Sys::G, 31) | (Sys::J, 31) => "1L",
        (Sys::G, 32) | (Sys::J, 32) | (Sys::C, 32) => "1X",
        (Sys::E, 3) => "1A",
        (Sys::E, 4) => "1B",
        (Sys::E, 5) => "1X",
        (Sys::E, 6) => "1Z",
        (Sys::E, 8) => "6C",
        (Sys::E, 9) => "6A",
        (Sys::E, 10) => "6B",
        (Sys::E, 11) | (Sys::J, 11) | (Sys::C, 10) => "6X",
        (Sys::E, 12) => "6Z",
        (Sys::E, 14) | (Sys::C, 14) => "7I",
        (Sys::E, 15) | (Sys::C, 15) => "7Q",
        (Sys::E, 16) | (Sys::C, 16) => "7X",
        (Sys::E, 18) => "8I",
        (Sys::E, 19) => "8Q",
        (Sys::E, 20) => "8X",
        (Sys::J, 9) => "6S",
        (Sys::J, 10) => "6L",
        (Sys::C, 2) => "2I",
        (Sys::C, 3) => "2Q",
        (Sys::C, 4) => "2X",
        (Sys::C, 8) => "6I",
        (Sys::C, 9) => "6Q",
        (Sys::C, 22) => "5D",
        (Sys::C, 23) => "5P",
        (Sys::C, 25) => "7D",
        (Sys::C, 30) => "1D",
        (Sys::C, 31) => "1P",
        (Sys::I, 22) => "5A",
        _ => return None,
    })
}

/// Decode every 1005, 1006, MSM4 and MSM7 frame of a stream.
pub fn decode(bytes: &[u8]) -> Rtcm3Decoded {
    let mut out = Rtcm3Decoded::default();
    let n = bytes.len();
    let mut i = 0usize;
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
            out.skipped += 1;
            i += 1;
            continue;
        }
        let p = &bytes[i + 3..end - 3];
        i = end;
        let Some(msg) = (Bits { b: p, pos: 0 }).u(12).map(|m| m as u16) else {
            out.skipped += 1;
            continue;
        };
        match msg {
            1005 | 1006 => match station(p) {
                Some(s) => out.stations.push(s),
                None => out.skipped += 1,
            },
            m if system(m).is_some() => match msm(p) {
                Some(s) => out.msm.push(s),
                None => out.skipped += 1,
            },
            m => *out.other.entry(m).or_default() += 1,
        }
    }
    out
}

fn station(p: &[u8]) -> Option<StationArp> {
    let mut b = Bits { b: p, pos: 0 };
    let message = b.u(12)? as u16;
    let station_id = b.u(12)? as u16;
    let itrf_year = b.u(6)? as u8;
    let (gps, glonass, galileo, non_physical) =
        (b.u(1)? == 1, b.u(1)? == 1, b.u(1)? == 1, b.u(1)? == 1);
    let x = b.s(38)?;
    b.u(2)?; // single receiver oscillator, reserved
    let y = b.s(38)?;
    b.u(2)?; // quarter cycle indicator
    let z = b.s(38)?;
    let antenna_height_m = if message == 1006 {
        Some(b.u(16)? as f64 / 1e4)
    } else {
        None
    };
    Some(StationArp {
        message,
        station_id,
        itrf_year,
        gps,
        glonass,
        galileo,
        non_physical,
        ecef_m: [x as f64 / 1e4, y as f64 / 1e4, z as f64 / 1e4],
        antenna_height_m,
    })
}

/// Encode a 1005 or 1006 payload (unframed; see [`frame`]).
pub fn encode_station(s: &StationArp) -> Vec<u8> {
    let mut w = BitWriter::default();
    let m = if s.antenna_height_m.is_some() {
        1006
    } else {
        1005
    };
    w.put(m, 12);
    w.put(i64::from(s.station_id), 12);
    w.put(i64::from(s.itrf_year), 6);
    for f in [s.gps, s.glonass, s.galileo, s.non_physical] {
        w.put(i64::from(f), 1);
    }
    let q = |v: f64| (v * 1e4).round() as i64;
    w.put(q(s.ecef_m[0]), 38);
    w.put(0, 2);
    w.put(q(s.ecef_m[1]), 38);
    w.put(0, 2);
    w.put(q(s.ecef_m[2]), 38);
    if let Some(h) = s.antenna_height_m {
        w.put((h * 1e4).round() as i64, 16);
    }
    w.finish()
}

fn mask_ids(mask: u64, width: u32) -> Vec<u32> {
    (0..width)
        .filter(|k| mask >> (width - 1 - k) & 1 == 1)
        .map(|k| k + 1)
        .collect()
}

fn msm(p: &[u8]) -> Option<MsmMessage> {
    let mut b = Bits { b: p, pos: 0 };
    let message = b.u(12)? as u16;
    let (sys, is7) = system(message)?;
    let station_id = b.u(12)? as u16;
    let (glonass_day, epoch_ms) = if sys == Sys::R {
        (Some(b.u(3)? as u8), b.u(27)? as u32)
    } else {
        (None, b.u(30)? as u32)
    };
    let multiple = b.u(1)? == 1;
    let iods = b.u(3)? as u8;
    b.u(7 + 2 + 2 + 1 + 3)?; // reserved, clock steering, external clock, smoothing, interval
    let sats = mask_ids(b.u(64)?, 64);
    let sigs = mask_ids(b.u(32)?, 32);
    if sats.is_empty() || sigs.is_empty() || sats.len() * sigs.len() > 64 {
        return None;
    }
    let mut cells = Vec::new();
    for s in 0..sats.len() {
        for g in 0..sigs.len() {
            if b.u(1)? == 1 {
                cells.push((s, g));
            }
        }
    }
    let ns = sats.len();
    let mut rough: Vec<Option<f64>> = Vec::with_capacity(ns);
    for _ in 0..ns {
        let v = b.u(8)?;
        rough.push((v != 255).then_some(v as f64));
    }
    let mut ext = vec![0u8; ns];
    if is7 {
        for e in ext.iter_mut() {
            *e = b.u(4)? as u8;
        }
    }
    for r in rough.iter_mut() {
        let m = b.u(10)? as f64;
        if let Some(v) = r.as_mut() {
            *v += m / 1024.0;
        }
    }
    let mut rate: Vec<Option<f64>> = vec![None; ns];
    if is7 {
        for r in rate.iter_mut() {
            let v = b.s(14)?;
            *r = (v != -8192).then_some(v as f64);
        }
    }
    let nc = cells.len();
    let (prb, prs, phb, phs, lockb, cnrb, cnrs) = if is7 {
        (20, 2f64.powi(-29), 24, 2f64.powi(-31), 10, 10, 1.0 / 16.0)
    } else {
        (15, 2f64.powi(-24), 22, 2f64.powi(-29), 4, 6, 1.0)
    };
    let mut col = |bits: usize, signed: bool| -> Option<Vec<i64>> {
        (0..nc)
            .map(|_| {
                if signed {
                    b.s(bits)
                } else {
                    b.u(bits).map(|v| v as i64)
                }
            })
            .collect()
    };
    let pr = col(prb, true)?;
    let ph = col(phb, true)?;
    let lock = col(lockb, false)?;
    let half = col(1, false)?;
    let cnr = col(cnrb, false)?;
    let frate = if is7 { Some(col(15, true)?) } else { None };
    let mut out_cells = Vec::with_capacity(nc);
    for (k, &(s, g)) in cells.iter().enumerate() {
        let sat = sat_id(sys, sats[s])?;
        let r = rough[s];
        let invalid_pr = -(1i64 << (prb - 1));
        let invalid_ph = -(1i64 << (phb - 1));
        out_cells.push(MsmCell {
            sat,
            signal_id: sigs[g] as u8,
            rinex_code: rinex_code(message, sigs[g] as u8),
            pseudorange_m: r
                .filter(|_| pr[k] != invalid_pr)
                .map(|r| (r + pr[k] as f64 * prs) * RANGE_MS),
            phaserange_m: r
                .filter(|_| ph[k] != invalid_ph)
                .map(|r| (r + ph[k] as f64 * phs) * RANGE_MS),
            phaserange_rate_m_s: match (&frate, rate[s]) {
                (Some(f), Some(rr)) if f[k] != -16384 => Some(rr + f[k] as f64 * 1e-4),
                _ => None,
            },
            lock_indicator: lock[k] as u16,
            half_cycle: half[k] == 1,
            cnr_dbhz: (cnr[k] != 0).then(|| cnr[k] as f64 * cnrs),
        });
    }
    let extended_info = if is7 {
        sats.iter()
            .zip(&ext)
            .filter_map(|(&id, &x)| Some((sat_id(sys, id)?, x)))
            .collect()
    } else {
        Vec::new()
    };
    Some(MsmMessage {
        message,
        station_id,
        epoch_ms,
        glonass_day,
        multiple,
        iods,
        extended_info,
        cells: out_cells,
    })
}

/// Encode an MSM4 or MSM7 payload (unframed; see [`frame`]) from a decoded message: the inverse of
/// the decoder up to the transmitted resolution. Satellites and signals are taken from the cells;
/// `None` values are sent as the invalid markers. Returns `None` for an unknown message number or a
/// satellite id the system cannot carry.
pub fn encode_msm(m: &MsmMessage) -> Option<Vec<u8>> {
    let (sys, is7) = system(m.message)?;
    let sat_num = |s: &str| -> Option<u32> {
        let n: u32 = s.get(1..)?.parse().ok()?;
        Some(if sys == Sys::S { n.checked_sub(19)? } else { n })
    };
    let mut sats: Vec<u32> = Vec::new();
    let mut sigs: Vec<u32> = Vec::new();
    for c in &m.cells {
        let s = sat_num(&c.sat)?;
        if !sats.contains(&s) {
            sats.push(s);
        }
        if !sigs.contains(&u32::from(c.signal_id)) {
            sigs.push(u32::from(c.signal_id));
        }
    }
    sats.sort_unstable();
    sigs.sort_unstable();
    let mut w = BitWriter::default();
    w.put(i64::from(m.message), 12);
    w.put(i64::from(m.station_id), 12);
    if sys == Sys::R {
        w.put(i64::from(m.glonass_day.unwrap_or(0)), 3);
        w.put(i64::from(m.epoch_ms), 27);
    } else {
        w.put(i64::from(m.epoch_ms), 30);
    }
    w.put(i64::from(m.multiple), 1);
    w.put(i64::from(m.iods), 3);
    w.put(0, 7 + 2 + 2 + 1 + 3);
    let mut sm = 0u64;
    for &s in &sats {
        sm |= 1u64 << (64 - s);
    }
    w.put(sm as i64, 64);
    let mut gm = 0u64;
    for &g in &sigs {
        gm |= 1u64 << (32 - g);
    }
    w.put(gm as i64, 32);
    // Cells in satellite-major order, as the decoder lists them.
    let cell = |s: u32, g: u32| {
        m.cells
            .iter()
            .find(|c| sat_num(&c.sat) == Some(s) && u32::from(c.signal_id) == g)
    };
    let mut order = Vec::new();
    for &s in &sats {
        for &g in &sigs {
            let c = cell(s, g);
            w.put(i64::from(c.is_some()), 1);
            if let Some(c) = c {
                order.push((s, c));
            }
        }
    }
    // The rough range of a satellite: the first valid range of its cells, to the nearest 2^-10 ms.
    let rough_of = |s: u32| -> Option<f64> {
        order
            .iter()
            .filter(|(x, _)| *x == s)
            .find_map(|(_, c)| c.pseudorange_m.or(c.phaserange_m))
            .map(|r| ((r / RANGE_MS) * 1024.0).round() / 1024.0)
    };
    let rough: Vec<Option<f64>> = sats.iter().map(|&s| rough_of(s)).collect();
    for r in &rough {
        w.put(r.map_or(255, |v| v.floor() as i64), 8);
    }
    if is7 {
        for &s in &sats {
            let id = sat_id(sys, s)?;
            let x = m
                .extended_info
                .iter()
                .find(|(n, _)| *n == id)
                .map_or(0, |(_, v)| *v);
            w.put(i64::from(x), 4);
        }
    }
    for r in &rough {
        w.put(
            r.map_or(0, |v| ((v - v.floor()) * 1024.0).round() as i64),
            10,
        );
    }
    let rough_rate: Vec<Option<f64>> = sats
        .iter()
        .map(|&s| {
            order
                .iter()
                .filter(|(x, _)| *x == s)
                .find_map(|(_, c)| c.phaserange_rate_m_s)
                .map(f64::round)
        })
        .collect();
    if is7 {
        for r in &rough_rate {
            w.put(r.map_or(-8192, |v| v as i64), 14);
        }
    }
    let (prb, prs, phb, phs, lockb, cnrb, cnrs) = if is7 {
        (20, 2f64.powi(-29), 24, 2f64.powi(-31), 10, 10, 1.0 / 16.0)
    } else {
        (15, 2f64.powi(-24), 22, 2f64.powi(-29), 4, 6, 1.0)
    };
    let idx = |s: u32| sats.iter().position(|&x| x == s).unwrap_or(0);
    for (s, c) in &order {
        let v = match (c.pseudorange_m, rough[idx(*s)]) {
            (Some(p), Some(r)) => ((p / RANGE_MS - r) / prs).round() as i64,
            _ => -(1i64 << (prb - 1)),
        };
        w.put(v, prb);
    }
    for (s, c) in &order {
        let v = match (c.phaserange_m, rough[idx(*s)]) {
            (Some(p), Some(r)) => ((p / RANGE_MS - r) / phs).round() as i64,
            _ => -(1i64 << (phb - 1)),
        };
        w.put(v, phb);
    }
    for (_, c) in &order {
        w.put(i64::from(c.lock_indicator), lockb);
    }
    for (_, c) in &order {
        w.put(i64::from(c.half_cycle), 1);
    }
    for (_, c) in &order {
        w.put(c.cnr_dbhz.map_or(0, |v| (v / cnrs).round() as i64), cnrb);
    }
    if is7 {
        for (s, c) in &order {
            let v = match (c.phaserange_rate_m_s, rough_rate[idx(*s)]) {
                (Some(f), Some(r)) => ((f - r) / 1e-4).round() as i64,
                _ => -16384,
            };
            w.put(v, 15);
        }
    }
    Some(w.finish())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn signed_fields_and_the_bit_writer_agree() {
        let mut w = BitWriter::default();
        w.put(-5, 38);
        w.put(1234, 12);
        let v = w.finish();
        let mut b = Bits { b: &v, pos: 0 };
        assert_eq!(b.s(38), Some(-5));
        assert_eq!(b.u(12), Some(1234));
    }

    #[test]
    fn codes_follow_the_open_tables() {
        assert_eq!(rinex_code(1077, 2), Some("1C"));
        assert_eq!(rinex_code(1077, 10), Some("2W"));
        assert_eq!(rinex_code(1097, 23), Some("5Q"));
        assert_eq!(rinex_code(1127, 2), Some("2I"));
        assert_eq!(rinex_code(1077, 1), None);
        assert_eq!(rinex_code(1005, 2), None);
    }
}
