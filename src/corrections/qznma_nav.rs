// SPDX-License-Identifier: AGPL-3.0-only
//! QZNMA reference data for every signal of IS-QZSS-SAS-001: the MASK, the RTOW replacement,
//! the RAND that is signed, and the QZSS signals' own Digital Signature Segments (DSS).
//!
//! Source, read for this module: IS-QZSS-SAS-001, sections 5.1 to 5.3 (QZSS LNAV, CNAV and
//! CNAV2: Figures 5-5 to 5-12, 5-17 to 5-24 and 5-28 to 5-34, Tables 5-1 to 5-13), 6.1 to 6.6
//! (GPS LNAV, CNAV, CNAV2, Galileo I/NAV and F/NAV: Figures 6-2 to 6-50, Tables 6-1 to 6-6)
//! and Appendix B. Only the bit layouts are transcribed; bit numbers in comments are the
//! document's 1-based positions.
//!
//! | Signal | Parts (bits) | Signed message (RAND) |
//! |---|---|---|
//! | GPS LNAV | subframes 1, 2, 3 (300 each) | RDS header (77) + MNAV 900 + SALT 16 + 7 reserved = 1000 |
//! | GPS CNAV | message types 10, 11 and one of 30 or above (300 each) | 77 + 900 + 16 + 7 = 1000 |
//! | GPS CNAV2 | subframe 1 (9) and 2 (600) | 77 + 609 + 16 + 10 = 712 |
//! | Galileo I/NAV | word types 1 to 5 (128 each) | 77 + 640 + 16 + 3 = 736 |
//! | Galileo F/NAV | page types 1 to 4 (244 each) | 77 + 976 + 16 + 3 = 1072 |
//! | QZSS LNAV | subframes 1, 2, 3 | key ID 8 + MNAV 900 + SALT 16 + 4 reserved = 928 |
//! | QZSS CNAV | message types 10, 11, 32 (or another of 30 or above) | 8 + 900 + 16 + 172 = 1096 |
//! | QZSS CNAV2 | subframes 1 and 2 | 8 + 609 + 16 + 167 = 800 |
//!
//! The "RDS header" is NMA ID, RTOW, SV ID, message type, two reference ephemerides, reference
//! clock and key ID (Table 6-1). For QZSS CNAV2 the RAND figure (Figure 5-31: 166 reserved bits
//! and 1 padding bit, 800 bits in all) and Table 5-11 (172 reserved bits) disagree; the module
//! follows the figure. To confirm.
//!
//! RTOW (section 6.6): the GPS and Galileo signatures were made over the navigation data with
//! the time of week the RDS carries as RTOW. The receiver's newer copy has a later time, so the
//! time fields are replaced before masking (section 6.6.2, case 1): GPS LNAV and CNAV TOW
//! counts and the four Galileo F/NAV page TOWs are moved by one offset so that the first part
//! carries the RTOW (the document shows only the first; the others keep their spacing, to
//! confirm); the GPS CNAV2 TOI and ITOW and the Galileo I/NAV word-type-5 TOW are set from the
//! RTOW directly (Table 6-1). The QZSS signals are signed over the messages as broadcast and
//! keep their times.

use super::bits;
use super::qznma::Rds;
use crate::osnma::signature::{self, PublicKey, SigError};
use crate::osnma::tables::KeyType;
use serde::Serialize;

/// A signal that QZNMA authenticates.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Signal {
    /// GPS LNAV (RDS message type 1).
    GpsLnav,
    /// GPS CNAV (RDS message type 2).
    GpsCnav,
    /// GPS CNAV2 (RDS message type 3).
    GpsCnav2,
    /// Galileo I/NAV (RDS message type 5).
    GalInav,
    /// Galileo F/NAV (RDS message type 4).
    GalFnav,
    /// QZSS LNAV, signed through its own DSS.
    QzsLnav,
    /// QZSS CNAV, signed through its own DSS.
    QzsCnav,
    /// QZSS CNAV2, signed through its own DSS.
    QzsCnav2,
}

/// Every signal, in the order of the names below.
pub const SIGNALS: [Signal; 8] = [
    Signal::GpsLnav,
    Signal::GpsCnav,
    Signal::GpsCnav2,
    Signal::GalInav,
    Signal::GalFnav,
    Signal::QzsLnav,
    Signal::QzsCnav,
    Signal::QzsCnav2,
];

impl Signal {
    /// The name used in navigation-message files and reports.
    pub fn name(self) -> &'static str {
        match self {
            Self::GpsLnav => "gps_lnav",
            Self::GpsCnav => "gps_cnav",
            Self::GpsCnav2 => "gps_cnav2",
            Self::GalInav => "gal_inav",
            Self::GalFnav => "gal_fnav",
            Self::QzsLnav => "qzs_lnav",
            Self::QzsCnav => "qzs_cnav",
            Self::QzsCnav2 => "qzs_cnav2",
        }
    }

    /// The signal of a name.
    pub fn from_name(s: &str) -> Option<Self> {
        SIGNALS.iter().copied().find(|g| g.name() == s)
    }

    /// The GPS or Galileo signal of an RDS message type (Table 6-1).
    pub fn from_message_type(mt: u8) -> Option<Self> {
        Some(match mt {
            1 => Self::GpsLnav,
            2 => Self::GpsCnav,
            3 => Self::GpsCnav2,
            4 => Self::GalFnav,
            5 => Self::GalInav,
            _ => return None,
        })
    }

    /// Whether the signal is a QZSS one (signed through its own DSS, not an L6E RDS).
    pub fn is_qzss(self) -> bool {
        matches!(self, Self::QzsLnav | Self::QzsCnav | Self::QzsCnav2)
    }

    /// Bits of each part of the reference navigation message, in RAND order.
    pub fn part_bits(self) -> &'static [usize] {
        match self {
            Self::GpsLnav | Self::GpsCnav | Self::QzsLnav | Self::QzsCnav => &[300, 300, 300],
            Self::GpsCnav2 | Self::QzsCnav2 => &[9, 600],
            Self::GalInav => &[128; 5],
            Self::GalFnav => &[244; 4],
        }
    }

    /// The part a navigation-message file line names: subframe 1 to 3 (LNAV, CNAV2), message
    /// type 10, 11 or 30 to 39 (CNAV), word type 1 to 5 (I/NAV), page type 1 to 4 (F/NAV).
    pub fn part_index(self, id: u16) -> Option<usize> {
        let i = match self {
            Self::GpsLnav | Self::QzsLnav => (1..=3).contains(&id).then(|| id - 1),
            Self::GpsCnav | Self::QzsCnav => match id {
                10 => Some(0),
                11 => Some(1),
                30..=39 => Some(2),
                _ => None,
            },
            Self::GpsCnav2 | Self::QzsCnav2 => (1..=2).contains(&id).then(|| id - 1),
            Self::GalInav => (1..=5).contains(&id).then(|| id - 1),
            Self::GalFnav => (1..=4).contains(&id).then(|| id - 1),
        };
        i.map(usize::from)
    }

    /// The part that carries a QZSS signal's DSS: LNAV subframe 5, CNAV message type 60,
    /// CNAV2 subframe 3.
    pub fn dss_part(self) -> Option<u16> {
        match self {
            Self::QzsLnav => Some(5),
            Self::QzsCnav => Some(60),
            Self::QzsCnav2 => Some(3),
            _ => None,
        }
    }

    /// Reserved (and padding) bits at the end of the RAND.
    fn reserved_bits(self) -> usize {
        match self {
            Self::GpsLnav | Self::GpsCnav => 7,
            Self::GpsCnav2 => 10,
            Self::GalInav | Self::GalFnav => 3,
            Self::QzsLnav => 4,
            Self::QzsCnav => 172,
            Self::QzsCnav2 => 167,
        }
    }

    /// Length of the RAND in bits.
    pub fn rand_bits(self) -> usize {
        let header = if self.is_qzss() { 8 } else { 77 };
        header + self.part_bits().iter().sum::<usize>() + 16 + self.reserved_bits()
    }
}

/// Whether bit `bit` (0-based) of part `part` of `sig` is kept by the MASK.
pub fn mask(sig: Signal, part: usize, bit: usize) -> bool {
    let (word, b) = (bit / 30 + 1, bit % 30 + 1);
    match sig {
        // Figures 6-5 to 6-7.
        Signal::GpsLnav => super::qznma::lnav_mask(part, bit),
        // Figures 6-15 to 6-17: the message type ID (word 1 bits 15–20) and the CRC are out;
        // the clock message keeps words 1 to 4 and word 5 bits 1–7.
        Signal::GpsCnav => match (part, word) {
            (_, 1) => !(15..=20).contains(&b),
            (0 | 1, 2..=9) => true,
            (0 | 1, 10) => b <= 6,
            (2, 2..=4) => true,
            (2, 5) => b <= 7,
            _ => false,
        },
        // Figures 6-23 and 6-24: subframe 1 whole, subframe 2 without its CRC.
        Signal::GpsCnav2 => part == 0 || bit < 576,
        // Figures 6-33 to 6-37: every bit.
        Signal::GalInav => true,
        // Figures 6-45 to 6-48: bits 1–214 and the tail (239–244); the CRC is out.
        Signal::GalFnav => bit < 214 || (238..244).contains(&bit),
        // Figures 5-5 to 5-7: word 1 bits 1–22, word 2 bits 1–17, words 3–9 bits 1–24,
        // word 10 bits 1–22.
        Signal::QzsLnav => match word {
            1 | 10 => b <= 22,
            2 => b <= 17,
            3..=9 => b <= 24,
            _ => false,
        },
        // Figures 5-17 to 5-19: the PRN (word 1 bits 9–14) and the alert flag (word 2 bit 8)
        // are out; message type 10 keeps word 10 bits 1 and 3–6, 11 bits 1–6; the clock
        // message keeps words 1 to 4 and word 5 bits 1–7.
        Signal::QzsCnav => match (part, word) {
            (_, 1) => !(9..=14).contains(&b),
            (_, 2) => b != 8,
            (0 | 1, 3..=9) => true,
            (0, 10) => b == 1 || (3..=6).contains(&b),
            (1, 10) => b <= 6,
            (2, 3 | 4) => true,
            (2, 5) => b <= 7,
            _ => false,
        },
        // Figures 5-28 and 5-29: subframe 2 without bit 33 (word 2 bit 3), bit 566 (word 19
        // bit 26) and the CRC.
        Signal::QzsCnav2 => part == 0 || (bit < 576 && bit != 32 && bit != 565),
    }
}

fn field(b: &[u8], start: usize, n: usize) -> u64 {
    b[start..start + n]
        .iter()
        .fold(0u64, |v, x| (v << 1) | u64::from(*x))
}

fn set_field(b: &mut [u8], start: usize, n: usize, v: u64) {
    for i in 0..n {
        b[start + i] = ((v >> (n - 1 - i)) & 1) as u8;
    }
}

/// Push `n` bits of `v`, most significant first; bits above 63 are zero.
fn push(out: &mut Vec<u8>, v: u64, n: usize) {
    out.extend(
        (0..n)
            .rev()
            .map(|i| v.checked_shr(i as u32).map_or(0, |x| (x & 1) as u8)),
    );
}

/// Replace the time fields of GPS and Galileo parts from `rtow` (section 6.6.2).
fn apply_rtow(sig: Signal, rtow: u32, parts: &mut [Vec<u8>]) {
    let rtow = u64::from(rtow);
    // Move every part's time by the offset that gives the first part the RTOW.
    let shift = |parts: &mut [Vec<u8>], at: &[usize], n: usize, modulo: i64, value: u64| {
        let first = field(&parts[0], at[0], n) as i64;
        let d = value as i64 - first;
        for (p, &a) in parts.iter_mut().zip(at) {
            let t = (field(p, a, n) as i64 + d).rem_euclid(modulo) as u64;
            set_field(p, a, n, t);
        }
    };
    match sig {
        // TOW count, word 2 bits 1–17.
        Signal::GpsLnav => shift(parts, &[30, 30, 30], 17, 100_800, rtow & 0x1_FFFF),
        // Message TOW count, bits 21–37 (Figure 6-12).
        Signal::GpsCnav => shift(parts, &[20, 20, 20], 17, 100_800, rtow & 0x1_FFFF),
        // TOI (subframe 1) and ITOW (subframe 2 bits 14–21) from RTOW (Table 6-1).
        Signal::GpsCnav2 => {
            set_field(&mut parts[0], 0, 9, (rtow >> 8) & 0x1FF);
            set_field(&mut parts[1], 13, 8, rtow & 0xFF);
        }
        // Word type 5 TOW, bits 86–105 (Figure 6-32).
        Signal::GalInav => set_field(&mut parts[4], 85, 20, rtow & 0xF_FFFF),
        // Page types 1 to 4: TOW at bits 168, 195, 187 and 190 (Figures 6-41 to 6-44).
        Signal::GalFnav => shift(parts, &[167, 194, 186, 189], 20, 604_800, rtow & 0xF_FFFF),
        _ => {}
    }
}

fn mnav(sig: Signal, parts: &[Vec<u8>], out: &mut Vec<u8>) {
    for (k, p) in parts.iter().enumerate() {
        out.extend(
            p.iter()
                .enumerate()
                .map(|(i, b)| if mask(sig, k, i) { *b } else { 0 }),
        );
    }
}

fn take_parts(sig: Signal, parts: &[&[u8]]) -> Option<Vec<Vec<u8>>> {
    let want = sig.part_bits();
    if parts.len() != want.len() || parts.iter().zip(want).any(|(p, n)| p.len() < *n) {
        return None;
    }
    Some(
        parts
            .iter()
            .zip(want)
            .map(|(p, n)| p[..*n].to_vec())
            .collect(),
    )
}

/// The RAND of a GPS or Galileo RDS over its parts (bits `0`/`1`, in [`Signal::part_bits`]
/// order), as bytes. `None` for a QZSS or unknown message type, or parts of the wrong size.
pub fn gnss_rand(rds: &Rds, parts: &[&[u8]]) -> Option<Vec<u8>> {
    let sig = Signal::from_message_type(rds.message_type)?;
    let mut parts = take_parts(sig, parts)?;
    apply_rtow(sig, rds.rtow, &mut parts);
    let mut out = Vec::with_capacity(sig.rand_bits());
    push(&mut out, u64::from(rds.nma_id), 4);
    push(&mut out, u64::from(rds.rtow), 20);
    push(&mut out, u64::from(rds.sv_id), 8);
    push(&mut out, u64::from(rds.message_type), 4);
    push(&mut out, u64::from(rds.ref_ephemeris1), 11);
    push(&mut out, u64::from(rds.ref_ephemeris2), 11);
    push(&mut out, u64::from(rds.ref_clock), 11);
    push(&mut out, u64::from(rds.key_id), 8);
    mnav(sig, &parts, &mut out);
    push(&mut out, u64::from(rds.salt), 16);
    push(&mut out, 0, sig.reserved_bits());
    debug_assert_eq!(out.len(), sig.rand_bits());
    Some(bits::to_bytes(&out))
}

/// A QZSS signal's signature, rebuilt from its three DSS (RDS of Figures 5-10, 5-22, 5-32).
#[derive(Clone, Debug, PartialEq, Eq, Serialize)]
pub struct QzssSignature {
    /// The QZSS signal whose DSS carried the signature.
    pub signal: Signal,
    /// Key ID (the first 8 bits of the rebuilt RDS).
    pub key_id: u8,
    /// SALT (16 bits after the signature), appended to the navigation data in the RAND.
    pub salt: u16,
    /// The 512-bit signature (r || s), hexadecimal.
    pub signature: String,
}

/// The RAND of a QZSS signal (Figures 5-9, 5-21, 5-31) as bytes.
pub fn qzss_rand(sig: &QzssSignature, parts: &[&[u8]]) -> Option<Vec<u8>> {
    if !sig.signal.is_qzss() {
        return None;
    }
    let parts = take_parts(sig.signal, parts)?;
    let mut out = Vec::with_capacity(sig.signal.rand_bits());
    push(&mut out, u64::from(sig.key_id), 8);
    mnav(sig.signal, &parts, &mut out);
    push(&mut out, u64::from(sig.salt), 16);
    push(&mut out, 0, sig.signal.reserved_bits());
    Some(bits::to_bytes(&out))
}

/// Bits of one RDS segment of a QZSS signal (Tables 5-3, 5-8, 5-13).
fn segment_bits(sig: Signal) -> usize {
    match sig {
        Signal::QzsLnav => 180,
        Signal::QzsCnav => 236,
        _ => 234,
    }
}

/// The DSS in a QZSS navigation message, as (segment ID 1–3, segment bits); `None` when the
/// message carries none. LNAV: subframe 5 (subframe ID, word 2 bits 20–22) with SV ID 60
/// (word 3 bits 3–8), the DSS in the 182 data bits after it (Figure 5-12); CNAV: message type
/// 60 (bits 15–20), the DSS in bits 39–276 (Figure 5-24); CNAV2: subframe 3 with page ID 60
/// (bits 9–14), the DSS in bits 15–250 (Figure 5-34).
pub fn qzss_dss(sig: Signal, msg: &[u8]) -> Option<(u8, Vec<u8>)> {
    let dss: Vec<u8> = match sig {
        Signal::QzsLnav => {
            if msg.len() < 300 || field(msg, 49, 3) != 5 || field(msg, 62, 6) != 60 {
                return None;
            }
            // Data bits 1–24 of words 3 to 10, after data ID and SV ID.
            let data: Vec<u8> = (2..10)
                .flat_map(|w| msg[w * 30..w * 30 + 24].to_vec())
                .collect();
            data[8..8 + 182].to_vec()
        }
        Signal::QzsCnav => {
            if msg.len() < 300 || field(msg, 14, 6) != 60 {
                return None;
            }
            msg[38..276].to_vec()
        }
        Signal::QzsCnav2 => {
            if msg.len() < 274 || field(msg, 8, 6) != 60 {
                return None;
            }
            msg[14..250].to_vec()
        }
        _ => return None,
    };
    let id = field(&dss, 0, 2) as u8;
    (1..=3)
        .contains(&id)
        .then(|| (id, dss[2..2 + segment_bits(sig)].to_vec()))
}

/// Rebuild a QZSS signature from its three segments, in segment-ID order.
pub fn qzss_signature(sig: Signal, segments: [&[u8]; 3]) -> Option<QzssSignature> {
    let n = segment_bits(sig);
    if !sig.is_qzss() || segments.iter().any(|s| s.len() < n) {
        return None;
    }
    let rds: Vec<u8> = segments.iter().flat_map(|s| s[..n].to_vec()).collect();
    Some(QzssSignature {
        signal: sig,
        key_id: field(&rds, 0, 8) as u8,
        signature: hex::encode(bits::to_bytes(&rds[8..520])),
        salt: field(&rds, 520, 16) as u16,
    })
}

/// Check a signature (hexadecimal r || s) over a RAND with a P-256 key (ECDSA with SHA-256,
/// SAS-001 7.1, Appendix B).
pub fn verify(rand: &[u8], signature_hex: &str, key: &PublicKey) -> Result<(), SigError> {
    if key.key_type != KeyType::P256 {
        return Err(SigError::Malformed);
    }
    let ds = hex::decode(signature_hex).map_err(|_| SigError::Malformed)?;
    signature::verify(key, rand, &ds)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rand_lengths_match_the_figures() {
        let want = [1000, 1000, 712, 736, 1072, 928, 1096, 800];
        for (s, w) in SIGNALS.iter().zip(want) {
            assert_eq!(s.rand_bits(), w, "{}", s.name());
            assert_eq!(Signal::from_name(s.name()), Some(*s));
        }
    }

    #[test]
    fn mask_counts_restate_the_figures() {
        let count = |s: Signal, p: usize| (0..s.part_bits()[p]).filter(|b| mask(s, p, *b)).count();
        // GPS CNAV: 24 + 8 x 30 + 6; the clock message 24 + 3 x 30 + 7.
        assert_eq!(count(Signal::GpsCnav, 0), 270);
        assert_eq!(count(Signal::GpsCnav, 1), 270);
        assert_eq!(count(Signal::GpsCnav, 2), 121);
        assert_eq!(count(Signal::GpsCnav2, 0), 9);
        assert_eq!(count(Signal::GpsCnav2, 1), 576);
        assert_eq!(count(Signal::GalInav, 4), 128);
        assert_eq!(count(Signal::GalFnav, 3), 220);
        // QZSS LNAV: 22 + 17 + 7 x 24 + 22.
        assert_eq!(count(Signal::QzsLnav, 1), 229);
        // QZSS CNAV: 24 + 29 + 7 x 30 + 5 (or 6); the clock message 24 + 29 + 60 + 7.
        assert_eq!(count(Signal::QzsCnav, 0), 268);
        assert_eq!(count(Signal::QzsCnav, 1), 269);
        assert_eq!(count(Signal::QzsCnav, 2), 120);
        assert_eq!(count(Signal::QzsCnav2, 1), 574);
    }
}
