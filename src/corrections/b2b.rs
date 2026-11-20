// SPDX-License-Identifier: AGPL-3.0-only
//! BeiDou-3 PPP-B2b decoder: message types 1 to 7 and 63, after LDPC decoding.
//!
//! Reference: BeiDou Navigation Satellite System Signal In Space Interface Control Document,
//! Precise Point Positioning Service Signal PPP-B2b (Version 1.0), China Satellite Navigation
//! Office, July 2020 (BDS-SIS-ICD-PPP-B2b-1.0). Section and table numbers below are that
//! document's.
//!
//! * Frame (section 6.1): 486 bits, message type (6), 456 data bits, CRC (24) over the first
//!   462 bits with the generator of Eq. 6-1 (the CRC-24Q polynomial). Input lines carry the 486
//!   bits (61 bytes, the last two bits ignored).
//! * Type 1, satellite mask (Table 6-2): epoch (BDT seconds of day, 17), reserved (4), IOD SSR
//!   (2), IODP (4), 255 mask bits: slots 1-63 BDS, 64-100 GPS, 101-137 Galileo, 138-174
//!   GLONASS, 175-255 reserved.
//! * Type 2, orbit and URAI (Table 6-3): six 69-bit entries: Sat Slot (9), IODN (10), IOD Corr
//!   (3), radial (15, 0.0016 m), along (13, 0.0064 m), cross (13, 0.0064 m), URAI (6).
//! * Type 3, code biases (Tables 6-4 and 6-5): number of satellites (5); per satellite: Sat
//!   Slot (9), number of biases (4), then per bias signal and tracking mode (4) and bias (12,
//!   0.017 m).
//! * Type 4, clock (Tables 6-6 and 6-7): IODP (4), SubType1 (5), 23 x (IOD Corr 3, C0 15,
//!   0.0016 m) for the satellites `23 x SubType1 + 1 ..` of the mask.
//! * Type 5, URAI (Tables 6-8 and 6-9): IODP (4), SubType2 (3), 70 URAI for the satellites
//!   `70 x SubType2 + 1 ..` of the mask.
//! * Type 6 (Table 6-10): NumC (5), NumO (3); with NumC > 0 a clock part (epoch, reserved,
//!   IOD SSR, IODP, Slot_S 9, NumC x 18 bits), with NumO > 0 an orbit part (epoch, reserved,
//!   IOD SSR, NumO x 69 bits).
//! * Type 7 (Table 6-11): as type 6 but each clock entry carries its Sat Slot (27 bits) and
//!   there is no IODP.
//! * Type 63: null.
//!
//! Corrections outside the stated ranges (the most negative code) are `null`. URA follows
//! Eq. 6-2: `3^class x (1 + value / 4) - 1` mm; URAI 0 (unknown) and 63 (> 5466.5 mm) give
//! `null`. Types 4, 5 and the clock part of 6 need a type 1 mask with the same IODP; without
//! one, their entries carry the position in the mask instead of a satellite.

use super::bits::{self, Cursor};
use super::Frame;
use serde::Serialize;
use std::collections::HashMap;

/// Satellite label of a mask slot (1-based): `C01`..`C63`, `G01`..`G37`, `E01`..`E37`,
/// `R01`..`R37`; reserved slots give `slot<n>`.
pub fn slot_label(slot: u32) -> String {
    match slot {
        1..=63 => super::label('C', slot),
        64..=100 => super::label('G', slot - 63),
        101..=137 => super::label('E', slot - 100),
        138..=174 => super::label('R', slot - 137),
        _ => format!("slot{slot}"),
    }
}

/// User range accuracy (mm) of a URAI (Eq. 6-2).
pub fn ura_mm(urai: u8) -> Option<f64> {
    if urai == 0 || urai >= 63 {
        return None;
    }
    let class = i32::from(urai >> 3);
    let value = f64::from(urai & 7);
    Some(3f64.powi(class) * (1.0 + 0.25 * value) - 1.0)
}

/// Signal and tracking mode name (Table 6-5) for a satellite label.
pub fn signal_name(sat: &str, mode: u8) -> Option<&'static str> {
    const C: [&str; 16] = [
        "B1I", "B1C(D)", "B1C(P)", "", "B2a(D)", "B2a(P)", "", "B2b-I", "B2b-Q", "", "", "",
        "B3 I", "", "", "",
    ];
    const G: [&str; 16] = [
        "L1 C/A", "L1 P", "", "", "L1C(P)", "L1C(D+P)", "", "L2C(L)", "L2C(M+L)", "", "", "L5 I",
        "L5 Q", "L5 I+Q", "", "",
    ];
    const R: [&str; 16] = [
        "G1 C/A", "G1 P", "G2 C/A", "", "", "", "", "", "", "", "", "", "", "", "", "",
    ];
    const E: [&str; 16] = [
        "", "E1 B", "E1 C", "", "E5a Q", "E5a I", "", "E5b I", "E5b Q", "", "", "E6 C", "", "", "",
        "",
    ];
    let t = match sat.chars().next()? {
        'C' => &C,
        'G' => &G,
        'R' => &R,
        'E' => &E,
        _ => return None,
    };
    let s = t.get(mode as usize)?;
    (!s.is_empty()).then_some(*s)
}

/// An orbit entry (69 bits).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Orbit {
    /// Satellite of the Sat Slot.
    pub sat: String,
    /// Sat Slot (position in the mask, 1-based).
    pub slot: u32,
    /// IODN.
    pub iodn: u32,
    /// IOD Corr.
    pub iod_corr: u8,
    /// Radial (m).
    pub radial_m: Option<f64>,
    /// Along-track (m).
    pub along_m: Option<f64>,
    /// Cross-track (m).
    pub cross_m: Option<f64>,
    /// URAI (raw 6 bits).
    pub urai: u8,
    /// URA (mm).
    pub ura_mm: Option<f64>,
}

/// A clock entry.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Clock {
    /// Satellite; `null` when no mask with this IODP was received.
    pub sat: Option<String>,
    /// Position among the masked satellites (1-based) or Sat Slot (type 7).
    pub index: u32,
    /// IOD Corr.
    pub iod_corr: u8,
    /// C0 (m).
    pub c0_m: Option<f64>,
}

/// A URA entry of type 5.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Ura {
    /// Satellite; `null` without a matching mask.
    pub sat: Option<String>,
    /// Position among the masked satellites (1-based).
    pub index: u32,
    /// URAI.
    pub urai: u8,
    /// URA (mm).
    pub ura_mm: Option<f64>,
}

/// One code bias of type 3.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CodeBias {
    /// Signal and tracking mode (Table 6-5).
    pub mode: u8,
    /// Its name for the satellite's system, when defined.
    pub name: Option<&'static str>,
    /// Bias (m).
    pub bias_m: f64,
}

/// A satellite's code biases.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SatBiases {
    /// Satellite.
    pub sat: String,
    /// Sat Slot.
    pub slot: u32,
    /// Biases.
    pub biases: Vec<CodeBias>,
}

/// One decoded message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Message {
    /// Message type.
    #[serde(rename = "type")]
    pub mtype: u8,
    /// Epoch (BDT seconds of day); for types 6 and 7 the clock epoch when present.
    pub epoch_s: Option<u32>,
    /// Orbit epoch of types 6 and 7.
    pub orbit_epoch_s: Option<u32>,
    /// IOD SSR.
    pub iod_ssr: Option<u8>,
    /// IODP (types 1, 4, 5, 6).
    pub iodp: Option<u8>,
    /// Masked satellites (type 1).
    pub mask: Vec<String>,
    /// Orbit entries (types 2, 6, 7).
    pub orbits: Vec<Orbit>,
    /// Clock entries (types 4, 6, 7).
    pub clocks: Vec<Clock>,
    /// URA entries (type 5).
    pub uras: Vec<Ura>,
    /// Code biases (type 3).
    pub code_biases: Vec<SatBiases>,
    /// Sub type (types 4 and 5).
    pub subtype: Option<u8>,
    /// `truncated`, `no_mask` (no type 1 with this IODP yet) or `reserved_type`.
    pub note: Option<&'static str>,
}

/// What a frame file held.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Report {
    /// Frames read.
    pub frames: usize,
    /// Frames shorter than 486 bits.
    pub bad_length: usize,
    /// Frames whose CRC failed.
    pub bad_crc: usize,
    /// Null messages (type 63).
    pub null: usize,
    /// Decoded messages.
    pub messages: Vec<Message>,
}

fn empty(mtype: u8) -> Message {
    Message {
        mtype,
        epoch_s: None,
        orbit_epoch_s: None,
        iod_ssr: None,
        iodp: None,
        mask: Vec::new(),
        orbits: Vec::new(),
        clocks: Vec::new(),
        uras: Vec::new(),
        code_biases: Vec::new(),
        subtype: None,
        note: None,
    }
}

fn orbit(c: &mut Cursor) -> Option<Orbit> {
    let slot = c.u(9)? as u32;
    let iodn = c.u(10)? as u32;
    let iod_corr = c.u(3)? as u8;
    let radial_m = c.scaled_na(15, 0.0016)?;
    let along_m = c.scaled_na(13, 0.0064)?;
    let cross_m = c.scaled_na(13, 0.0064)?;
    let urai = c.u(6)? as u8;
    Some(Orbit {
        sat: slot_label(slot),
        slot,
        iodn,
        iod_corr,
        radial_m,
        along_m,
        cross_m,
        urai,
        ura_mm: ura_mm(urai),
    })
}

/// A stateful decoder.
#[derive(Default)]
pub struct Decoder {
    masks: HashMap<u8, Vec<u32>>,
    /// The report so far.
    pub report: Report,
}

impl Decoder {
    fn sat_at(&self, iodp: u8, index: u32) -> Option<String> {
        let m = self.masks.get(&iodp)?;
        m.get(index.checked_sub(1)? as usize)
            .map(|s| slot_label(*s))
    }

    /// Feed one 486-bit frame.
    pub fn push_frame(&mut self, f: &Frame) {
        self.report.frames += 1;
        let b = f.bits();
        if b.len() < 486 {
            self.report.bad_length += 1;
            return;
        }
        let crc = crate::gnss_navmsg::fec::crc24q(&b[..462]);
        let got = b[462..486]
            .iter()
            .fold(0u32, |a, &x| (a << 1) | u32::from(x));
        if crc != got {
            self.report.bad_crc += 1;
            return;
        }
        let mut c = Cursor::new(&b[..462]);
        let mtype = c.u(6).unwrap_or(0) as u8;
        if mtype == 63 {
            self.report.null += 1;
            return;
        }
        let mut m = empty(mtype);
        if self.decode(&mut c, &mut m).is_none() {
            m.note = Some("truncated");
        }
        self.report.messages.push(m);
    }

    fn decode(&mut self, c: &mut Cursor, m: &mut Message) -> Option<()> {
        match m.mtype {
            1 => {
                m.epoch_s = Some(c.u(17)? as u32);
                c.u(4)?;
                m.iod_ssr = Some(c.u(2)? as u8);
                let iodp = c.u(4)? as u8;
                m.iodp = Some(iodp);
                let slots = bits::set_positions(&c.take(255)?);
                m.mask = slots.iter().map(|s| slot_label(*s)).collect();
                self.masks.insert(iodp, slots);
            }
            2 => {
                m.epoch_s = Some(c.u(17)? as u32);
                c.u(4)?;
                m.iod_ssr = Some(c.u(2)? as u8);
                for _ in 0..6 {
                    let o = orbit(c)?;
                    if o.slot != 0 {
                        m.orbits.push(o);
                    }
                }
            }
            3 => {
                m.epoch_s = Some(c.u(17)? as u32);
                c.u(4)?;
                m.iod_ssr = Some(c.u(2)? as u8);
                let n = c.u(5)?;
                for _ in 0..n {
                    let slot = c.u(9)? as u32;
                    let sat = slot_label(slot);
                    let nb = c.u(4)?;
                    let mut biases = Vec::new();
                    for _ in 0..nb {
                        let mode = c.u(4)? as u8;
                        biases.push(CodeBias {
                            mode,
                            name: signal_name(&sat, mode),
                            bias_m: c.scaled(12, 0.017)?,
                        });
                    }
                    m.code_biases.push(SatBiases { sat, slot, biases });
                }
            }
            4 => {
                m.epoch_s = Some(c.u(17)? as u32);
                c.u(4)?;
                m.iod_ssr = Some(c.u(2)? as u8);
                let iodp = c.u(4)? as u8;
                m.iodp = Some(iodp);
                let st = c.u(5)? as u8;
                m.subtype = Some(st);
                for k in 0..23u32 {
                    let index = u32::from(st) * 23 + k + 1;
                    let iod_corr = c.u(3)? as u8;
                    let c0_m = c.scaled_na(15, 0.0016)?;
                    let sat = self.sat_at(iodp, index);
                    let in_mask = self.masks.get(&iodp).map(|v| v.len() as u32);
                    if in_mask.is_some_and(|n| index > n) {
                        continue;
                    }
                    m.clocks.push(Clock {
                        sat,
                        index,
                        iod_corr,
                        c0_m,
                    });
                }
                if !self.masks.contains_key(&iodp) {
                    m.note = Some("no_mask");
                }
            }
            5 => {
                m.epoch_s = Some(c.u(17)? as u32);
                c.u(4)?;
                m.iod_ssr = Some(c.u(2)? as u8);
                let iodp = c.u(4)? as u8;
                m.iodp = Some(iodp);
                let st = c.u(3)? as u8;
                m.subtype = Some(st);
                for k in 0..70u32 {
                    let index = u32::from(st) * 70 + k + 1;
                    let urai = c.u(6)? as u8;
                    let in_mask = self.masks.get(&iodp).map(|v| v.len() as u32);
                    if in_mask.is_some_and(|n| index > n) {
                        continue;
                    }
                    m.uras.push(Ura {
                        sat: self.sat_at(iodp, index),
                        index,
                        urai,
                        ura_mm: ura_mm(urai),
                    });
                }
                if !self.masks.contains_key(&iodp) {
                    m.note = Some("no_mask");
                }
            }
            6 | 7 => {
                let numc = c.u(5)? as u32;
                let numo = c.u(3)? as u32;
                if numc > 0 {
                    m.epoch_s = Some(c.u(17)? as u32);
                    c.u(4)?;
                    m.iod_ssr = Some(c.u(2)? as u8);
                    if m.mtype == 6 {
                        let iodp = c.u(4)? as u8;
                        m.iodp = Some(iodp);
                        let slot_s = c.u(9)? as u32;
                        for k in 0..numc {
                            let index = slot_s + k;
                            let iod_corr = c.u(3)? as u8;
                            let c0_m = c.scaled_na(15, 0.0016)?;
                            m.clocks.push(Clock {
                                sat: self.sat_at(iodp, index),
                                index,
                                iod_corr,
                                c0_m,
                            });
                        }
                        if !self.masks.contains_key(&iodp) {
                            m.note = Some("no_mask");
                        }
                    } else {
                        for _ in 0..numc {
                            let slot = c.u(9)? as u32;
                            let iod_corr = c.u(3)? as u8;
                            let c0_m = c.scaled_na(15, 0.0016)?;
                            m.clocks.push(Clock {
                                sat: Some(slot_label(slot)),
                                index: slot,
                                iod_corr,
                                c0_m,
                            });
                        }
                    }
                }
                if numo > 0 {
                    m.orbit_epoch_s = Some(c.u(17)? as u32);
                    c.u(4)?;
                    let iod = c.u(2)? as u8;
                    m.iod_ssr.get_or_insert(iod);
                    for _ in 0..numo {
                        m.orbits.push(orbit(c)?);
                    }
                }
            }
            _ => m.note = Some("reserved_type"),
        }
        Some(())
    }
}

/// Decode every frame of a file.
pub fn decode_frames(frames: &[Frame]) -> Report {
    let mut d = Decoder::default();
    for f in frames {
        d.push_frame(f);
    }
    d.report
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn slots_ura_and_names() {
        assert_eq!(slot_label(1), "C01");
        assert_eq!(slot_label(63), "C63");
        assert_eq!(slot_label(64), "G01");
        assert_eq!(slot_label(100), "G37");
        assert_eq!(slot_label(101), "E01");
        assert_eq!(slot_label(138), "R01");
        assert_eq!(slot_label(175), "slot175");
        assert_eq!(ura_mm(0), None);
        assert_eq!(ura_mm(63), None);
        assert_eq!(ura_mm(0b000_001), Some(0.25));
        assert_eq!(ura_mm(0b111_110), Some(3f64.powi(7) * 2.5 - 1.0));
        assert_eq!(signal_name("C19", 8), Some("B2b-Q"));
        assert_eq!(signal_name("E05", 0), None);
    }
}
