// SPDX-License-Identifier: AGPL-3.0-only
//! QZSS L6E QZNMA messages: navigation message authentication data for GPS and Galileo, and
//! (DRAFT) the CLAS correction message authentication slot.
//!
//! Sources, read for this decoder: IS-QZSS-SAS-001, sections 4, 6.1 (GPS LNAV: Figures 6-2
//! to 6-9, Tables 6-1 and 6-2), 6.6 (RTOW), 6.8 to 6.10 (the L6E QZNMA format, Figure 6-52;
//! vendor ID `011`, Table 6-8), 7 and Appendix B; and the IS-QZSS-SAS-002 **draft**, section
//! 7.4 (the 485-bit QZNMA-CLAS slot after the two RDS), read through [`super::cma`].
//!
//! * Frame: the L6 header (49 bits, read by [`super::l6::header`]) and a 1695-bit data part:
//!   two 605-bit Reformat Digital Signatures (RDS) and a 485-bit slot. SAS-001 section 6.8
//!   says "two 576 bits of RDS data and 543 bits of reserved data" in its text, while its
//!   Figures 6-52 to 6-54 and Table 6-2 give 605-bit RDS and 485 bits; the decoder follows
//!   the figures and tables (their fields add up to 605), to confirm with the Cabinet Office.
//! * RDS (Figure 6-10, Table 6-2): NMA ID (4), RTOW (20), SV ID (8), message type (4),
//!   reference ephemeris 1 and 2 and reference clock (11 each), key ID (8), the ECDSA P-256
//!   signature (512) and SALT (16). An NMA ID other than 0 marks an unused RDS; an all-zero
//!   RDS is the filler of section 6.9.
//! * GPS LNAV check (6.1): [`gps_lnav_rand`] builds the 1000-bit RAND from subframes 1 to 3
//!   (RNAV with the TOW replaced from RTOW, the MASK of Figures 6-5 to 6-7) and
//!   [`verify_rds`] checks the signature with a public key (ECDSA P-256 with SHA-256 over
//!   RAND, Appendix B). The public keys and the Appendix A test data are given only to
//!   registered users (section 7.3.5, Appendix A), so the check is tested here with a key
//!   made by the test, not with QZSS data. CNAV, CNAV2, Galileo and QZSS-signal RAND are not
//!   built.

use super::bits::{self, Cursor};
use super::cma;
use super::Frame;
use crate::osnma::signature::{self, PublicKey, SigError};
use crate::osnma::tables::KeyType;
use serde::Serialize;

/// L6 vendor ID of QZNMA (SAS-001 Table 6-8).
pub const VENDOR: u8 = 0b011;
/// Bits of one RDS.
pub const RDS_BITS: usize = 605;
/// Bits of the QZNMA-CLAS slot.
pub const CLAS_SLOT_BITS: usize = 485;
/// Bits of a GPS LNAV RAND.
pub const LNAV_RAND_BITS: usize = 1000;

/// One Reformat Digital Signature.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Rds {
    pub nma_id: u8,
    /// Reference time of week (20 bits; GPS LNAV and CNAV use its 17 LSBs).
    pub rtow: u32,
    pub sv_id: u8,
    /// Satellite label: G01..G63 for SV ID 1..63, E01..E63 for 65..127.
    pub sat: Option<String>,
    pub message_type: u8,
    pub message_type_name: Option<&'static str>,
    pub ref_ephemeris1: u16,
    pub ref_ephemeris2: u16,
    pub ref_clock: u16,
    pub key_id: u8,
    /// The 512-bit signature (r || s), hexadecimal.
    pub signature: String,
    pub salt: u16,
    /// Usable for authentication: NMA ID 0 and not the all-zero filler.
    pub used: bool,
}

/// One QZNMA frame.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct QznmaFrame {
    pub index: usize,
    pub prn: u8,
    pub alert: bool,
    /// The two RDS; `None` for the all-zero filler.
    pub rds: Vec<Option<Rds>>,
    /// DRAFT (IS-QZSS-SAS-002): the CMA messages of the QZNMA-CLAS slot.
    pub clas_draft: Vec<cma::Message>,
}

/// The decoder's report.
#[derive(Clone, Debug, PartialEq, Serialize, Default)]
pub struct Report {
    pub frames: usize,
    pub short: usize,
    pub bad_preamble: usize,
    /// L6 frames of another vendor (CLAS, MADOCA-PPP), skipped.
    pub other_vendor: usize,
    pub messages: Vec<QznmaFrame>,
    /// DRAFT: messages completed from ST13,11 segments (normally ST13,3 root key information).
    pub reassembled_draft: Vec<cma::Message>,
}

/// Message type names of Table 6-1.
pub fn message_type_name(mt: u8) -> Option<&'static str> {
    Some(match mt {
        1 => "gps_lnav",
        2 => "gps_cnav",
        3 => "gps_cnav2",
        4 => "galileo_fnav",
        5 => "galileo_inav",
        _ => return None,
    })
}

/// Read one RDS; `None` for the all-zero filler or a short slice.
pub fn parse_rds(b: &[u8]) -> Option<Rds> {
    if b.len() < RDS_BITS || b[..RDS_BITS].iter().all(|x| *x == 0) {
        return None;
    }
    let mut c = Cursor::new(b);
    let nma_id = c.u(4)? as u8;
    let rtow = c.u(20)? as u32;
    let sv_id = c.u(8)? as u8;
    let message_type = c.u(4)? as u8;
    let ref_ephemeris1 = c.u(11)? as u16;
    let ref_ephemeris2 = c.u(11)? as u16;
    let ref_clock = c.u(11)? as u16;
    let key_id = c.u(8)? as u8;
    let signature = hex::encode(bits::to_bytes(&c.take(512)?));
    let salt = c.u(16)? as u16;
    let sat = match sv_id {
        1..=63 => Some(super::label('G', u32::from(sv_id))),
        65..=127 => Some(super::label('E', u32::from(sv_id) - 64)),
        _ => None,
    };
    Some(Rds {
        nma_id,
        rtow,
        sv_id,
        sat,
        message_type,
        message_type_name: message_type_name(message_type),
        ref_ephemeris1,
        ref_ephemeris2,
        ref_clock,
        key_id,
        signature,
        salt,
        used: nma_id == 0,
    })
}

/// Decode L6 frames, keeping the QZNMA ones.
pub fn decode_frames(frames: &[Frame]) -> Report {
    let mut rep = Report {
        frames: frames.len(),
        ..Default::default()
    };
    let mut reasm = cma::Reassembler::default();
    for (index, f) in frames.iter().enumerate() {
        let b = f.bits();
        if b.len() < 49 + 1695 {
            rep.short += 1;
            continue;
        }
        let Some(h) = super::l6::header(&b) else {
            rep.bad_preamble += 1;
            continue;
        };
        if h.vendor != VENDOR {
            rep.other_vendor += 1;
            continue;
        }
        let data = &b[49..49 + 1695];
        let rds = vec![
            parse_rds(&data[..RDS_BITS]),
            parse_rds(&data[RDS_BITS..2 * RDS_BITS]),
        ];
        let clas_draft = cma::parse_messages(&data[2 * RDS_BITS..2 * RDS_BITS + CLAS_SLOT_BITS]);
        for m in &clas_draft {
            if let cma::Message::Segment(s) = m {
                if let Some(done) = reasm.push(h.prn, s) {
                    rep.reassembled_draft.extend(done);
                }
            }
        }
        rep.messages.push(QznmaFrame {
            index,
            prn: h.prn,
            alert: h.alert,
            rds,
            clas_draft,
        });
    }
    rep
}

/// Whether bit `bit` (0-based) of GPS LNAV subframe `sf` (0, 1, 2 for subframes 1, 2, 3) is
/// kept by the MASK of SAS-001 Figures 6-5 to 6-7: word 1 bits 1–8 and 23–24, word 2 bits
/// 1–22, words 3 to 9 bits 1–24, word 10 bits 1–22 (subframe 2: 1–17); parity never.
pub fn lnav_mask(sf: usize, bit: usize) -> bool {
    let (word, b) = (bit / 30 + 1, bit % 30 + 1);
    match word {
        1 => b <= 8 || (23..=24).contains(&b),
        2 => b <= 22,
        3..=9 => b <= 24,
        10 => b <= if sf == 1 { 17 } else { 22 },
        _ => false,
    }
}

fn push_bits(out: &mut Vec<u8>, v: u64, n: usize) {
    out.extend((0..n).rev().map(|i| ((v >> i) & 1) as u8));
}

/// The GPS LNAV RAND (Figure 6-9) as 125 bytes, from an RDS and the 300-bit subframes 1, 2
/// and 3 (bits `0`/`1`). Each subframe's TOW count (word 2, bits 1–17) is moved by the same
/// offset so that subframe 1 carries the RTOW (section 6.6.2, case 1); the subframes keep
/// their spacing (to confirm: the document shows the replacement for subframe 1 only).
pub fn gps_lnav_rand(rds: &Rds, subframes: [&[u8]; 3]) -> Option<Vec<u8>> {
    if subframes.iter().any(|s| s.len() < 300) {
        return None;
    }
    let tow = |s: &[u8]| s[30..47].iter().fold(0i64, |v, b| (v << 1) | i64::from(*b));
    let shift = i64::from(rds.rtow & 0x1_FFFF) - tow(subframes[0]);
    let mut out = Vec::with_capacity(LNAV_RAND_BITS);
    push_bits(&mut out, u64::from(rds.nma_id), 4);
    push_bits(&mut out, u64::from(rds.rtow), 20);
    push_bits(&mut out, u64::from(rds.sv_id), 8);
    push_bits(&mut out, u64::from(rds.message_type), 4);
    push_bits(&mut out, u64::from(rds.ref_ephemeris1), 11);
    push_bits(&mut out, u64::from(rds.ref_ephemeris2), 11);
    push_bits(&mut out, u64::from(rds.ref_clock), 11);
    push_bits(&mut out, u64::from(rds.key_id), 8);
    for (k, s) in subframes.iter().enumerate() {
        let mut sf = s[..300].to_vec();
        let new_tow = (tow(s) + shift).rem_euclid(100_800) as u64;
        let mut t = Vec::new();
        push_bits(&mut t, new_tow, 17);
        sf[30..47].copy_from_slice(&t);
        out.extend(
            sf.iter()
                .enumerate()
                .map(|(i, b)| if lnav_mask(k, i) { *b } else { 0 }),
        );
    }
    push_bits(&mut out, u64::from(rds.salt), 16);
    push_bits(&mut out, 0, 7);
    debug_assert_eq!(out.len(), LNAV_RAND_BITS);
    Some(bits::to_bytes(&out))
}

/// Check the RDS signature over `rand` with a P-256 public key (SAS-001 7.1, Appendix B).
pub fn verify_rds(rds: &Rds, rand: &[u8], key: &PublicKey) -> Result<(), SigError> {
    if key.key_type != KeyType::P256 || !rds.used {
        return Err(SigError::Malformed);
    }
    let ds = hex::decode(&rds.signature).map_err(|_| SigError::Malformed)?;
    signature::verify(key, rand, &ds)
}

/// A public key from a DER file (SubjectPublicKeyInfo, RFC 5480, as SAS-001 7.3.3 and the
/// SAS-002 draft 9.3.3 distribute them) or from a bare SEC1 point. The curve is taken from the
/// named-curve OID: P-256 (1.2.840.10045.3.1.7) or P-521 (1.3.132.0.35).
pub fn public_key_from_der(der: &[u8], pkid: u8) -> Option<PublicKey> {
    const P256_OID: [u8; 10] = [0x06, 0x08, 0x2A, 0x86, 0x48, 0xCE, 0x3D, 0x03, 0x01, 0x07];
    const P521_OID: [u8; 7] = [0x06, 0x05, 0x2B, 0x81, 0x04, 0x00, 0x23];
    let has = |oid: &[u8]| der.windows(oid.len()).any(|w| w == oid);
    let (key_type, point) = if has(&P256_OID) {
        (KeyType::P256, 65)
    } else if has(&P521_OID) {
        (KeyType::P521, 133)
    } else {
        return match der.len() {
            33 | 65 => Some(PublicKey {
                pkid,
                key_type: KeyType::P256,
                bytes: der.to_vec(),
            }),
            67 | 133 => Some(PublicKey {
                pkid,
                key_type: KeyType::P521,
                bytes: der.to_vec(),
            }),
            _ => None,
        };
    };
    let bytes = der.get(der.len().checked_sub(point)?..)?.to_vec();
    (bytes[0] == 0x04).then_some(PublicKey {
        pkid,
        key_type,
        bytes,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn lnav_subframe(tow: u64, fill: u8) -> Vec<u8> {
        let mut s: Vec<u8> = (0..300)
            .map(|i| ((i as u8).wrapping_mul(fill) >> 3) & 1)
            .collect();
        let mut t = Vec::new();
        push_bits(&mut t, tow, 17);
        s[30..47].copy_from_slice(&t);
        s
    }

    #[test]
    fn mask_counts_match_the_figures() {
        // Words 1 (10 bits), 2 (22), 3–9 (7 x 24) and 10 (22, or 17 in subframe 2).
        let count = |sf| (0..300).filter(|b| lnav_mask(sf, *b)).count();
        assert_eq!(count(0), 10 + 22 + 168 + 22);
        assert_eq!(count(1), 10 + 22 + 168 + 17);
        assert_eq!(count(2), 10 + 22 + 168 + 22);
    }

    #[test]
    fn lnav_rand_and_signature_round_trip() {
        use p256::ecdsa::{signature::Signer, Signature, SigningKey};
        let sk = SigningKey::from_slice(&[3u8; 32]).unwrap();
        let pk = PublicKey {
            pkid: 5,
            key_type: KeyType::P256,
            bytes: p256::ecdsa::VerifyingKey::from(&sk)
                .to_sec1_point(false)
                .as_bytes()
                .to_vec(),
        };
        // Signed at TOW count 1000 (subframes 1000, 1001, 1002) ...
        let signed = [
            lnav_subframe(1000, 3),
            lnav_subframe(1001, 5),
            lnav_subframe(1002, 7),
        ];
        let mut rds = Rds {
            nma_id: 0,
            rtow: 1000,
            sv_id: 12,
            sat: Some("G12".into()),
            message_type: 1,
            message_type_name: Some("gps_lnav"),
            ref_ephemeris1: 77,
            ref_ephemeris2: 77,
            ref_clock: 77,
            key_id: 5,
            signature: String::new(),
            salt: 0xBEEF,
            used: true,
        };
        let refs = [&signed[0][..], &signed[1][..], &signed[2][..]];
        let rand = gps_lnav_rand(&rds, refs).unwrap();
        assert_eq!(rand.len(), 125);
        let sig: Signature = sk.sign(&rand);
        rds.signature = hex::encode(sig.to_bytes());
        // ... and received 100 counts (10 minutes) later with new parity: RTOW restores it.
        let mut later = [
            lnav_subframe(1100, 3),
            lnav_subframe(1101, 5),
            lnav_subframe(1102, 7),
        ];
        later[0][29] ^= 1;
        let refs = [&later[0][..], &later[1][..], &later[2][..]];
        let rand2 = gps_lnav_rand(&rds, refs).unwrap();
        assert_eq!(rand2, rand);
        assert_eq!(verify_rds(&rds, &rand2, &pk), Ok(()));
        // A changed ephemeris bit (word 4) fails.
        later[1][95] ^= 1;
        let refs = [&later[0][..], &later[1][..], &later[2][..]];
        let rand3 = gps_lnav_rand(&rds, refs).unwrap();
        assert_eq!(verify_rds(&rds, &rand3, &pk), Err(SigError::Invalid));
        // The key from a DER SubjectPublicKeyInfo.
        let mut der = vec![
            0x30, 0x59, 0x30, 0x13, 0x06, 0x07, 0x2A, 0x86, 0x48, 0xCE, 0x3D, 0x02, 0x01, 0x06,
            0x08, 0x2A, 0x86, 0x48, 0xCE, 0x3D, 0x03, 0x01, 0x07, 0x03, 0x42, 0x00,
        ];
        der.extend_from_slice(&pk.bytes);
        let k = public_key_from_der(&der, 5).unwrap();
        assert_eq!(k.key_type, KeyType::P256);
        assert_eq!(verify_rds(&rds, &rand2, &k), Ok(()));
    }
}
