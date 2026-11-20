// SPDX-License-Identifier: AGPL-3.0-only
//! QZSS L6 messages: the header, subframe assembly, and the CLAS, MADOCA-PPP and MADOCA-PPP
//! ionospheric data parts.
//!
//! References: IS-QZSS-L6-008 (CLAS) section 4.1 and IS-QZSS-MDC-005 (MADOCA-PPP) sections 4
//! and 6, Cabinet Office.
//!
//! * Message (IS-QZSS-L6-008 4.1.1.1, Figure 4.1.1-1): 2000 bits: a 49-bit header, a 1695-bit
//!   data part and a 256-bit Reed-Solomon code. Input lines carry at least the first 1744
//!   bits (header and data part); the Reed-Solomon parity is not checked here (it is the
//!   receiver's channel decoding).
//! * Header (4.1.2.1): preamble `0x1ACFFC1D` (32), PRN (8), L6 message type ID (8), alert flag
//!   (1). The type ID's first three bits are the vendor ID (IS-QZSS-MDC-005 Table 4.2.1-2):
//!   `101` CLAS, `010` MADOCA-PPP, `011` QZNMA. CLAS (Table 4.1.2-2): facility (2), transmit
//!   pattern (2), subframe indicator (1). MADOCA-PPP (Table 4.2.1-3): facility (2), correction
//!   service ID (1; 0 clock and orbit, 1 ionosphere), navigation message extension (1),
//!   subframe indicator (1).
//! * Subframes: a data part with the subframe indicator set starts a subframe; the data parts
//!   of one stream (PRN, vendor and facility) are concatenated until the next start and then
//!   read as consecutive messages. A data part before any start of its stream is counted and
//!   skipped. QZNMA and reserved vendors are counted and skipped.
//! * MADOCA-PPP ionospheric messages (IS-QZSS-MDC-005 6.3.2): message 1, STEC coverage
//!   (Tables 6.3.2-4 to 6.3.2-6) and message 2, STEC correction (Tables 6.3.2-7 to 6.3.2-10).

use super::bits::{self, Cursor};
use super::cssr::{self, Flavour, StecSat};
use super::Frame;
use serde::Serialize;
use std::collections::BTreeMap;

/// The L6 preamble.
pub const PREAMBLE: u32 = 0x1ACF_FC1D;

/// The parsed L6 header.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub struct Header {
    /// PRN of the transmitting satellite.
    pub prn: u8,
    /// Vendor ID (3 bits).
    pub vendor: u8,
    /// Message generation facility (2 bits).
    pub facility: u8,
    /// The two bits after the facility: CLAS transmit pattern; for MADOCA-PPP the correction
    /// service ID (high bit) and the navigation message extension (low bit).
    pub service_bits: u8,
    /// Subframe indicator.
    pub subframe_start: bool,
    /// Alert flag.
    pub alert: bool,
}

/// Parse the 49-bit header; `None` when the preamble is wrong or the frame is short.
pub fn header(bits: &[u8]) -> Option<Header> {
    let mut c = Cursor::new(bits);
    if c.u(32)? as u32 != PREAMBLE {
        return None;
    }
    let prn = c.u(8)? as u8;
    let t = c.u(8)? as u8;
    let alert = c.flag()?;
    Some(Header {
        prn,
        vendor: t >> 5,
        facility: (t >> 3) & 3,
        service_bits: (t >> 1) & 3,
        subframe_start: t & 1 == 1,
        alert,
    })
}

/// One area of a STEC coverage message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Area {
    /// Area number.
    pub number: u8,
    /// Shape: 0 rectangle, 1 circle.
    pub shape: u8,
    /// Reference latitude (deg).
    pub lat_deg: f64,
    /// Reference longitude (deg).
    pub lon_deg: f64,
    /// Rectangle: latitude and longitude spans (deg).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub span_deg: Option<(f64, f64)>,
    /// Circle: effective range (km).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub range_km: Option<f64>,
}

/// A MADOCA-PPP ionospheric message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IonoMessage {
    /// Message number: 1 coverage, 2 correction.
    pub message: u16,
    /// GNSS epoch time (s of week, message 1) or hourly epoch time (s of hour, message 2).
    pub epoch_s: u32,
    /// Update interval code.
    pub update_interval: u8,
    /// Multiple message indicator.
    pub multiple: bool,
    /// IOD SSR.
    pub iod_ssr: u8,
    /// Region ID.
    pub region_id: u8,
    /// Region alert flag (message 1).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub region_alert: Option<bool>,
    /// Bit length of the region's correction messages (message 1).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub correction_bits: Option<u32>,
    /// Areas (message 1).
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub areas: Vec<Area>,
    /// Area number (message 2).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub area: Option<u8>,
    /// STEC per satellite (message 2).
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub stec: Vec<StecSat>,
}

/// One decoded data-part message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Message {
    /// Transmitting PRN.
    pub prn: u8,
    /// `clas`, `madoca` or `madoca-iono`.
    pub service: &'static str,
    /// Message generation facility.
    pub facility: u8,
    /// A Compact SSR message.
    #[serde(flatten)]
    pub cssr: Option<cssr::Message>,
    /// An ionospheric message.
    #[serde(flatten)]
    pub iono: Option<IonoMessage>,
}

/// Why the reading of a subframe stopped before its end.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Stopped {
    /// Transmitting PRN.
    pub prn: u8,
    /// Service.
    pub service: &'static str,
    /// Reason.
    pub reason: cssr::Stop,
}

/// What a frame file held.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Report {
    /// Frames read.
    pub frames: usize,
    /// Frames shorter than 1744 bits.
    pub bad_length: usize,
    /// Frames without the preamble.
    pub bad_preamble: usize,
    /// Frames with the alert flag set.
    pub alert: usize,
    /// Frames of QZNMA or a reserved vendor (skipped).
    pub other_vendor: usize,
    /// Data parts before the first subframe start of their stream (skipped).
    pub orphan: usize,
    /// Subframes read.
    pub subframes: usize,
    /// Decoded messages.
    pub messages: Vec<Message>,
    /// Subframes whose reading stopped early.
    pub stopped: Vec<Stopped>,
    /// GNSS IDs met in masks that the service's tables do not define.
    pub unknown_gnss_ids: Vec<u8>,
}

#[derive(Default)]
struct Stream {
    bits: Vec<u8>,
    header: Option<Header>,
}

/// A stateful decoder.
#[derive(Default)]
pub struct Decoder {
    streams: BTreeMap<(u8, u8, u8, u8), Stream>,
    masks: BTreeMap<(u8, u8, u8), cssr::Mask>,
    /// The report so far.
    pub report: Report,
}

fn service_of(h: &Header) -> Option<(&'static str, Option<Flavour>)> {
    match h.vendor {
        0b101 => Some(("clas", Some(Flavour::Clas))),
        0b010 if h.service_bits & 2 == 0 => Some(("madoca", Some(Flavour::Madoca))),
        0b010 => Some(("madoca-iono", None)),
        _ => None,
    }
}

impl Decoder {
    /// Feed one L6 frame.
    pub fn push_frame(&mut self, f: &Frame) {
        self.report.frames += 1;
        let b = f.bits();
        if b.len() < 1744 {
            self.report.bad_length += 1;
            return;
        }
        let Some(h) = header(&b) else {
            self.report.bad_preamble += 1;
            return;
        };
        if h.alert {
            self.report.alert += 1;
        }
        if service_of(&h).is_none() {
            self.report.other_vendor += 1;
            return;
        }
        // MADOCA clock/orbit and ionosphere are separate streams.
        let key = (h.prn, h.vendor, h.facility, h.service_bits & 2);
        if h.subframe_start {
            self.flush(key);
            let s = self.streams.entry(key).or_default();
            s.header = Some(h);
        }
        match self.streams.get_mut(&key) {
            Some(s) if s.header.is_some() => s.bits.extend_from_slice(&b[49..1744]),
            _ => self.report.orphan += 1,
        }
    }

    fn flush(&mut self, key: (u8, u8, u8, u8)) {
        let Some(s) = self.streams.remove(&key) else {
            return;
        };
        let Some(h) = s.header else {
            return;
        };
        let Some((service, flavour)) = service_of(&h) else {
            return;
        };
        self.report.subframes += 1;
        let mut c = Cursor::new(&s.bits);
        match flavour {
            Some(fl) => {
                let mk = (h.prn, h.vendor, h.facility);
                let mut mask = self.masks.get(&mk).cloned();
                loop {
                    match cssr::read_message(&mut c, fl, &mut mask) {
                        Ok(Some(m)) => {
                            if let Some(systems) = &m.mask {
                                for s in systems {
                                    if cssr::signal_name(fl, s.gnss_id, 0).is_none()
                                        && !self.report.unknown_gnss_ids.contains(&s.gnss_id)
                                    {
                                        self.report.unknown_gnss_ids.push(s.gnss_id);
                                    }
                                }
                            }
                            self.report.messages.push(Message {
                                prn: h.prn,
                                service,
                                facility: h.facility,
                                cssr: Some(m),
                                iono: None,
                            });
                        }
                        Ok(None) => break,
                        Err(reason) => {
                            self.report.stopped.push(Stopped {
                                prn: h.prn,
                                service,
                                reason,
                            });
                            break;
                        }
                    }
                }
                if let Some(m) = mask {
                    self.masks.insert(mk, m);
                }
            }
            None => loop {
                match read_iono(&mut c) {
                    Ok(Some(m)) => self.report.messages.push(Message {
                        prn: h.prn,
                        service,
                        facility: h.facility,
                        cssr: None,
                        iono: Some(m),
                    }),
                    Ok(None) => break,
                    Err(reason) => {
                        self.report.stopped.push(Stopped {
                            prn: h.prn,
                            service,
                            reason,
                        });
                        break;
                    }
                }
            },
        }
    }

    /// Finish: read the open subframes.
    pub fn finish(mut self) -> Report {
        let keys: Vec<_> = self.streams.keys().copied().collect();
        for k in keys {
            self.flush(k);
        }
        self.report
    }
}

/// Read one MADOCA-PPP ionospheric message; `Ok(None)` at a message number other than 1 or 2
/// (the zero fill) or fewer than 16 bits left.
pub fn read_iono(c: &mut Cursor) -> Result<Option<IonoMessage>, cssr::Stop> {
    if c.remaining() < 16 {
        return Ok(None);
    }
    let start = c.pos;
    let num = c.u(12).unwrap_or(0) as u16;
    let st = c.u(4).unwrap_or(15);
    if !(num == 1 || num == 2) || st != 0 {
        c.pos = start;
        return Ok(None);
    }
    let t = |v: Option<u64>| v.ok_or(cssr::Stop::Truncated);
    let epoch = t(c.u(if num == 1 { 20 } else { 12 }))? as u32;
    let mut m = IonoMessage {
        message: num,
        epoch_s: epoch,
        update_interval: t(c.u(4))? as u8,
        multiple: t(c.u(1))? == 1,
        iod_ssr: t(c.u(4))? as u8,
        region_id: t(c.u(8))? as u8,
        region_alert: None,
        correction_bits: None,
        areas: Vec::new(),
        area: None,
        stec: Vec::new(),
    };
    if num == 1 {
        m.region_alert = Some(t(c.u(1))? == 1);
        m.correction_bits = Some(t(c.u(16))? as u32);
        let n = t(c.u(5))?;
        for _ in 0..n {
            let number = t(c.u(5))? as u8;
            let shape = t(c.u(1))? as u8;
            let a = if shape == 0 {
                Area {
                    number,
                    shape,
                    lat_deg: c.scaled(11, 0.1).ok_or(cssr::Stop::Truncated)?,
                    lon_deg: t(c.u(12))? as f64 * 0.1,
                    span_deg: Some((t(c.u(8))? as f64 * 0.1, t(c.u(8))? as f64 * 0.1)),
                    range_km: None,
                }
            } else {
                Area {
                    number,
                    shape,
                    lat_deg: c.scaled(15, 0.01).ok_or(cssr::Stop::Truncated)?,
                    lon_deg: t(c.u(16))? as f64 * 0.01,
                    span_deg: None,
                    range_km: Some(t(c.u(8))? as f64 * 10.0),
                }
            };
            m.areas.push(a);
        }
    } else {
        m.area = Some(t(c.u(5))? as u8);
        let ty = t(c.u(2))? as u8;
        let mut counts = [0u64; 5];
        for n in counts.iter_mut() {
            *n = t(c.u(5))?;
        }
        for (sys, n) in ['G', 'R', 'E', 'C', 'J'].iter().zip(counts) {
            for _ in 0..n {
                let id = t(c.u(6))? as u32;
                let quality = t(c.u(6))? as u8;
                let coefficients = iono_coeffs(c, ty).ok_or(cssr::Stop::Truncated)?;
                m.stec.push(StecSat {
                    sat: super::label(*sys, id),
                    quality,
                    correction_type: ty,
                    coefficients,
                    residual_size: None,
                    residuals_tecu: Vec::new(),
                });
            }
        }
    }
    Ok(Some(m))
}

fn iono_coeffs(c: &mut Cursor, ty: u8) -> Option<Vec<Option<f64>>> {
    // Same fields as the CLAS STEC polynomial (Table 6.3.2-9).
    const F: [(usize, f64); 6] = [
        (14, 0.05),
        (12, 0.02),
        (12, 0.02),
        (10, 0.02),
        (8, 0.005),
        (8, 0.005),
    ];
    let n = [1, 3, 4, 6][ty as usize & 3];
    F[..n].iter().map(|(b, l)| c.scaled_na(*b, *l)).collect()
}

/// Decode every frame of a file.
pub fn decode_frames(frames: &[Frame]) -> Report {
    let mut d = Decoder::default();
    for f in frames {
        d.push_frame(f);
    }
    d.finish()
}

/// The 49-bit header as bits, for building frames in tests and vectors.
pub fn header_bits(prn: u8, type_id: u8, alert: bool) -> Vec<u8> {
    let mut v = bits::of_bytes(&PREAMBLE.to_be_bytes());
    v.extend(bits::of_bytes(&[prn, type_id]));
    v.push(u8::from(alert));
    v
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn header_fields() {
        // Vendor 101, facility 01, pattern 00, subframe start.
        let mut b = header_bits(199, 0b1010_1001, true);
        b.resize(1744, 0);
        let h = header(&b).unwrap();
        assert_eq!(h.prn, 199);
        assert_eq!(h.vendor, 0b101);
        assert_eq!(h.facility, 1);
        assert_eq!(h.service_bits, 0);
        assert!(h.subframe_start && h.alert);
        b[0] ^= 1;
        assert!(header(&b).is_none());
    }

    #[test]
    fn orphans_and_other_vendors_are_counted() {
        let mk = |t: u8| {
            let mut b = header_bits(194, t, false);
            b.resize(2000, 0);
            Frame {
                bytes: bits::to_bytes(&b),
                nibbles: 500,
            }
        };
        let r = // QZNMA start, CLAS continuation, CLAS start.
        decode_frames(&[mk(0b0110_0001), mk(0b1010_0000), mk(0b1010_0001)]);
        assert_eq!(r.other_vendor, 1);
        assert_eq!(r.orphan, 1);
        assert_eq!(r.subframes, 1);
        assert!(r.messages.is_empty());
    }
}
