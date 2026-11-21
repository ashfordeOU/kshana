// SPDX-License-Identifier: AGPL-3.0-only
//! DRAFT: QZSS CLAS Correction Message Authentication (CMA) messages and checks.
//!
//! Source, read for this module: IS-QZSS-SAS-002 **draft** (the file
//! `is-qzss-sas-002_draft.pdf` the Cabinet Office publishes), sections 7.1 to 7.5 and 9.1 to
//! 9.3. The document is a draft: field layouts, the time encodings and the message
//! compositions may change before it is issued, and everything here follows that draft. Its
//! Appendix A test data are not published, so no check here has been compared with a
//! QZSS-generated example.
//!
//! * Messages (7.2): Compact SSR message 4073, subtype 13. The header (Table 7-3); ST13,1
//!   authentication information (Tables 7-6, 7-7); ST13,3 root key information (Tables 7-8,
//!   7-9); ST13,11 segmented information (Tables 7-10, 7-11) and the reassembly of the message
//!   it carries (7.2.7). ST13,2 and ST13,4 are reserved and ignored, as the draft says.
//! * Checks (9.1): the KROOT message `M` and its ECDSA verification (9.1.2), the truncated
//!   hash `F` of the TESLA key chain and the check of a key against KROOT (9.1.3), and the MAC
//!   of a target message (9.1.4), with the MAC functions and hashes of 9.2.
//!
//! The QZSS time of a subframe is not in the messages; callers supply it (week modulo 4096
//! and time of week). Bit widths used in the MAC input that the draft does not state are
//! marked "to confirm" below.

use super::bits::Cursor;
use crate::osnma::mac;
use crate::osnma::signature::{self, PublicKey, SigError};
use crate::osnma::tables::{KeyType, MacFn};
use serde::Serialize;
use std::collections::{BTreeMap, HashMap};

/// Compact SSR message number of QZNMA-CLAS (7.2.1).
pub const MESSAGE_NUMBER: u64 = 4073;
/// Compact SSR subtype of CMA.
pub const SUBTYPE: u64 = 13;
/// Time between authentications, s (9.1.3, pattern 1).
pub const TBA_S: i64 = 10;
/// Offset of the first key's subframe after the KROOT time, s (9.1.3, pattern 1).
pub const DELTA_T_S: i64 = 5;
/// Public key IDs of the test keys (Table 9-1).
pub const TEST_KEY_IDS: [u8; 4] = [1, 2, 65, 66];

/// TESLA key length for a Key Size code (SDF505): 4 128, 5 160, 6 192, 15 none.
pub fn key_bits(code: u8) -> Option<usize> {
    match code {
        4 => Some(128),
        5 => Some(160),
        6 => Some(192),
        15 => Some(0),
        _ => None,
    }
}

/// MAC length for a MAC Size code (SDF506): 8 32, 9 40.
pub fn mac_bits(code: u8) -> Option<usize> {
    match code {
        8 => Some(32),
        9 => Some(40),
        _ => None,
    }
}

/// Continuity threshold (SDF525) in metres: CLASS (3 MSBs) and VALUE (3 LSBs),
/// ((3^CLASS)(1 + VALUE/4) − 1)/25.
pub fn continuity_threshold_m(ct: u8) -> f64 {
    let (class, value) = (i32::from(ct >> 3), f64::from(ct & 7));
    (3f64.powi(class) * (1.0 + value / 4.0) - 1.0) / 25.0
}

/// The common part of an ST13 header after the message number and subtype.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Common {
    /// GNSS hourly epoch time, s of hour (QZSST).
    pub epoch_s: u16,
    /// Authentication data and delay identifier (0 pattern 1, 15 common data).
    pub adi: u8,
    /// Multiple message indicator.
    pub multiple: bool,
    /// CMA status: 1 test, 2 operational, 3 do not use.
    pub cmas: u8,
    /// Chain and public key status (Table 7-5).
    pub cpks: u8,
}

/// ST13,1 authentication information.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct AuthInfo {
    #[serde(flatten)]
    pub common: Common,
    pub chain_id: u8,
    pub key_size: u8,
    pub mac_size: u8,
    /// MACs in target order (CTR 1, 2, ...), hexadecimal, left-aligned.
    pub macs: Vec<String>,
    /// The TESLA key of the previous epoch, hexadecimal; `None` when Key Size is 15.
    pub key: Option<String>,
    /// Continuity check flag.
    pub ccf: bool,
    /// Continuity threshold code and its value in metres, when the flag is set.
    pub ct: Option<u8>,
    pub ct_m: Option<f64>,
    /// The default message of 7.2.8 (CMAS 3, no MACs, no key).
    pub default_message: bool,
}

/// ST13,3 root key information.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RootKeyInfo {
    #[serde(flatten)]
    pub common: Common,
    /// Chain ID of KROOT.
    pub chain_id: u8,
    /// 1 ECDSA P-256, 3 ECDSA P-521.
    pub public_key_type: u8,
    pub public_key_id: u8,
    /// A test key of Table 9-1: no operational guarantee.
    pub test_key: bool,
    /// Hash function: 0 SHA-256, 2 SHA3-256.
    pub hash_function: u8,
    /// MAC function: 0 HMAC-SHA-256, 1 CMAC-AES.
    pub mac_function: u8,
    pub key_size: u8,
    /// KROOT week number (GPS week modulo 4096) and hour of week.
    pub kroot_week: u16,
    pub kroot_hour: u8,
    /// SALT (48 bits), KROOT and the digital signature, hexadecimal.
    pub salt: String,
    pub kroot: String,
    pub signature: String,
}

/// ST13,11 authentication segmented information.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Segment {
    pub multiple: bool,
    pub counter: u8,
    /// Issue of auxiliary frame data.
    pub iod: u8,
    /// Data stream: 1 current-chain ST13,3, 2 new-chain ST13,3.
    pub stream: u8,
    /// Auxiliary frame data bits.
    #[serde(skip)]
    pub data: Vec<u8>,
    /// Number of data bits.
    pub data_bits: usize,
}

/// One ST13 message.
#[derive(Clone, Debug, PartialEq, Serialize)]
#[serde(tag = "sub_subtype_name", rename_all = "snake_case")]
pub enum Message {
    AuthInfo(AuthInfo),
    RootKeyInfo(RootKeyInfo),
    Segment(Segment),
    /// A reserved or unknown sub-subtype; the rest of the slot is not read.
    Other {
        sub_subtype: u8,
    },
}

fn hex_bits(bits: &[u8]) -> String {
    hex::encode(super::bits::to_bytes(bits))
}

fn common(c: &mut Cursor) -> Option<Common> {
    Some(Common {
        epoch_s: c.u(12)? as u16,
        adi: c.u(4)? as u8,
        multiple: c.flag()?,
        cmas: c.u(2)? as u8,
        cpks: c.u(3)? as u8,
    })
}

fn read_one(c: &mut Cursor) -> Option<Message> {
    if c.u(12)? != MESSAGE_NUMBER || c.u(4)? != SUBTYPE {
        return None;
    }
    let sst = c.u(4)? as u8;
    Some(match sst {
        1 => {
            let common = common(c)?;
            let chain_id = c.u(2)? as u8;
            let key_size = c.u(4)? as u8;
            let mac_size = c.u(4)? as u8;
            let nm = c.u(4)? as usize;
            let nk = key_bits(key_size)?;
            let nsm = if nm == 0 { 0 } else { mac_bits(mac_size)? };
            let macs = (0..nm)
                .map(|_| c.take(nsm).map(|b| hex_bits(&b)))
                .collect::<Option<Vec<_>>>()?;
            let key = if nk == 0 {
                None
            } else {
                Some(hex_bits(&c.take(nk)?))
            };
            let ccf = c.flag()?;
            let ct = if ccf { Some(c.u(6)? as u8) } else { None };
            let default_message = common.cmas == 3 && nm == 0 && key.is_none();
            Message::AuthInfo(AuthInfo {
                common,
                chain_id,
                key_size,
                mac_size,
                macs,
                key,
                ccf,
                ct,
                ct_m: ct.map(|v| (continuity_threshold_m(v) * 1e4).round() / 1e4),
                default_message,
            })
        }
        3 => {
            let common = common(c)?;
            let chain_id = c.u(2)? as u8;
            let public_key_type = c.u(4)? as u8;
            let public_key_id = c.u(8)? as u8;
            let hash_function = c.u(2)? as u8;
            let mac_function = c.u(2)? as u8;
            let key_size = c.u(4)? as u8;
            let kroot_week = c.u(12)? as u16;
            let kroot_hour = c.u(8)? as u8;
            let salt = hex_bits(&c.take(48)?);
            let nk = key_bits(key_size).filter(|n| *n > 0)?;
            let kroot = hex_bits(&c.take(nk)?);
            let nds = KeyType::from_npkt(public_key_type).map(|t| t.signature_bits())?;
            let signature = hex_bits(&c.take(nds)?);
            Message::RootKeyInfo(RootKeyInfo {
                common,
                chain_id,
                public_key_type,
                public_key_id,
                test_key: TEST_KEY_IDS.contains(&public_key_id),
                hash_function,
                mac_function,
                key_size,
                kroot_week,
                kroot_hour,
                salt,
                kroot,
                signature,
            })
        }
        11 => {
            let multiple = c.flag()?;
            let counter = c.u(8)? as u8;
            let iod = c.u(2)? as u8;
            let stream = c.u(4)? as u8;
            let block = [10, 20, 40, 60][c.u(2)? as usize];
            let blocks = c.u(3)? as usize + 1;
            let data = c.take(block * blocks)?;
            Message::Segment(Segment {
                multiple,
                counter,
                iod,
                stream,
                data_bits: data.len(),
                data,
            })
        }
        other => Message::Other { sub_subtype: other },
    })
}

/// Read the ST13 messages of a QZNMA-CLAS slot (or a reassembled stream) in order. Reading
/// stops at the zero padding, at a message that is not 4073/13, at a reserved size code, or
/// after a reserved sub-subtype.
pub fn parse_messages(bits: &[u8]) -> Vec<Message> {
    let mut out = Vec::new();
    let mut c = Cursor::new(bits);
    while c.remaining() >= 20 {
        let mut probe = c.clone();
        match read_one(&mut probe) {
            Some(m) => {
                let stop = matches!(m, Message::Other { .. });
                out.push(m);
                c = probe;
                if stop {
                    break;
                }
            }
            None => break,
        }
    }
    out
}

/// Reassembles ST13,11 streams (7.2.7): segments with the same stream indicator and issue of
/// data are concatenated in counter order once the last one (multiple indicator 0) and every
/// earlier counter have arrived. Streams 1 and 2 may combine segments of different
/// satellites (Table 7-12); other streams are kept per satellite.
#[derive(Default, Debug)]
pub struct Reassembler {
    parts: HashMap<(u8, u8, u8), BTreeMap<u8, Vec<u8>>>,
    last: HashMap<(u8, u8, u8), u8>,
}

impl Reassembler {
    /// Add a segment from satellite `prn`; the messages of a completed stream when it
    /// completes.
    pub fn push(&mut self, prn: u8, s: &Segment) -> Option<Vec<Message>> {
        let sat = if matches!(s.stream, 1 | 2) { 0 } else { prn };
        let key = (sat, s.stream, s.iod);
        // A new issue of data replaces older ones of the same stream.
        self.parts
            .retain(|k, _| !(k.0 == sat && k.1 == s.stream && k.2 != s.iod));
        self.last
            .retain(|k, _| !(k.0 == sat && k.1 == s.stream && k.2 != s.iod));
        self.parts
            .entry(key)
            .or_default()
            .insert(s.counter, s.data.clone());
        if !s.multiple {
            self.last.insert(key, s.counter);
        }
        let last = *self.last.get(&key)?;
        let parts = self.parts.get(&key)?;
        if (0..=last).any(|k| !parts.contains_key(&k)) {
            return None;
        }
        let bits: Vec<u8> = (0..=last).flat_map(|k| parts[&k].clone()).collect();
        self.parts.remove(&key);
        self.last.remove(&key);
        Some(parse_messages(&bits))
    }
}

/// Bits of an unsigned value, most significant first.
fn push_bits(out: &mut Vec<u8>, v: u64, n: usize) {
    out.extend((0..n).rev().map(|i| ((v >> i) & 1) as u8));
}

fn hex_to_bits(h: &str, n: usize) -> Option<Vec<u8>> {
    let b = super::bits::of_bytes(&hex::decode(h).ok()?);
    (b.len() >= n).then(|| b[..n].to_vec())
}

/// The message `M` of 9.1.2: CMAS, CPKS, CIDKR, HF, MF, KS, WNk, TOWHk, SALT and KROOT,
/// zero-padded to whole bytes.
pub fn kroot_message(r: &RootKeyInfo) -> Option<Vec<u8>> {
    let mut b = Vec::new();
    push_bits(&mut b, u64::from(r.common.cmas), 2);
    push_bits(&mut b, u64::from(r.common.cpks), 3);
    push_bits(&mut b, u64::from(r.chain_id), 2);
    push_bits(&mut b, u64::from(r.hash_function), 2);
    push_bits(&mut b, u64::from(r.mac_function), 2);
    push_bits(&mut b, u64::from(r.key_size), 4);
    push_bits(&mut b, u64::from(r.kroot_week), 12);
    push_bits(&mut b, u64::from(r.kroot_hour), 8);
    b.extend(hex_to_bits(&r.salt, 48)?);
    b.extend(hex_to_bits(&r.kroot, key_bits(r.key_size)?)?);
    Some(super::bits::to_bytes(&b))
}

/// Verify the KROOT signature of `r` with `key` (9.1.2). The key's curve must match the
/// public key type of the message.
pub fn verify_kroot(r: &RootKeyInfo, key: &PublicKey) -> Result<(), SigError> {
    if KeyType::from_npkt(r.public_key_type) != Some(key.key_type) {
        return Err(SigError::Malformed);
    }
    let m = kroot_message(r).ok_or(SigError::Malformed)?;
    let ds = hex::decode(&r.signature).map_err(|_| SigError::Malformed)?;
    signature::verify(key, &m, &ds)
}

/// A QZSS time as week (modulo 4096) and time of week, s.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct QzssTime {
    pub week: u16,
    pub tow: u32,
}

impl QzssTime {
    fn seconds(self) -> i64 {
        i64::from(self.week) * 604_800 + i64::from(self.tow)
    }

    fn from_seconds(s: i64) -> Self {
        let s = s.rem_euclid(4096 * 604_800);
        Self {
            week: (s / 604_800) as u16,
            tow: (s % 604_800) as u32,
        }
    }

    /// The 32-bit representation of 9.1.3: week (12) and time of week (20).
    pub fn bits(self) -> u64 {
        (u64::from(self.week & 0xFFF) << 20) | u64::from(self.tow & 0xF_FFFF)
    }
}

/// The truncated hash `F` of 9.1.3: `K_i = trunc(l_k, hash(K_{i+1} || QZSST_SF,i || α))`,
/// with `hf` 0 SHA-256 or 2 SHA3-256. `None` for a reserved hash function.
pub fn tesla_f(next: &[u8], t: QzssTime, salt: &[u8], hf: u8, key_bits: usize) -> Option<Vec<u8>> {
    use sha2::Digest as _;
    let mut input = next.to_vec();
    input.extend_from_slice(&(t.bits() as u32).to_be_bytes());
    input.extend_from_slice(salt);
    let h = match hf {
        0 => sha2::Sha256::digest(&input).to_vec(),
        2 => sha3::Sha3_256::digest(&input).to_vec(),
        _ => return None,
    };
    Some(mac::truncate(&h, key_bits))
}

/// Why a TESLA key did not verify.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum KeyError {
    /// The subframe time is not an authentication epoch after the KROOT time.
    BadTime,
    /// A reserved hash function or key size, or an undecodable field.
    Malformed,
    /// The chain does not lead to KROOT.
    Mismatch,
}

/// Index `N` of the key transmitted in the L6E subframe starting at `t`, for the KROOT of `r`
/// (9.1.3, pattern 1): `N = (t − (QZSST0 + ΔT)) / TBA + 1`.
pub fn key_index(r: &RootKeyInfo, t: QzssTime) -> Option<u32> {
    let t0 = i64::from(r.kroot_week) * 604_800 + i64::from(r.kroot_hour) * 3600;
    let mut d = t.seconds() - (t0 + DELTA_T_S);
    // Across the 4096-week rollover.
    let span = 4096 * 604_800;
    if d < -span / 2 {
        d += span;
    }
    (d >= 0 && d % TBA_S == 0).then(|| (d / TBA_S + 1) as u32)
}

/// Verify the TESLA key `key` (transmitted in the subframe starting at `t`) against the
/// KROOT of `r` by applying `F` `N` times; the index `N` on success.
pub fn verify_tesla_key(r: &RootKeyInfo, key: &[u8], t: QzssTime) -> Result<u32, KeyError> {
    let n = key_index(r, t).ok_or(KeyError::BadTime)?;
    let bits = key_bits(r.key_size)
        .filter(|b| *b > 0)
        .ok_or(KeyError::Malformed)?;
    let salt = hex::decode(&r.salt).map_err(|_| KeyError::Malformed)?;
    let kroot = hex::decode(&r.kroot).map_err(|_| KeyError::Malformed)?;
    let t1 = QzssTime::from_seconds(t.seconds() - i64::from(n - 1) * TBA_S);
    let mut k = key.to_vec();
    // K_{i} = F(K_{i+1}) with the time of K_i: t_i = t_1 + (i − 1) TBA.
    for i in (0..n).rev() {
        let ti = QzssTime::from_seconds(t1.seconds() + (i64::from(i) - 1) * TBA_S);
        k = tesla_f(&k, ti, &salt, r.hash_function, bits).ok_or(KeyError::Malformed)?;
    }
    if k == kroot {
        Ok(n)
    } else {
        Err(KeyError::Mismatch)
    }
}

/// The MAC input `m_i` of 9.1.4: PRN || QZSST_SF || CTR || CMAS || CCF || CT || message,
/// zero-padded to whole bytes. The PRN is taken as the 8-bit PRN of the L6 header (to
/// confirm: the draft does not give its width). `ct` is omitted when `ccf` is false.
pub fn mac_input(
    prn: u8,
    t: QzssTime,
    ctr: u8,
    cmas: u8,
    ccf: bool,
    ct: u8,
    message_bits: &[u8],
) -> Vec<u8> {
    let mut b = Vec::new();
    push_bits(&mut b, u64::from(prn), 8);
    push_bits(&mut b, t.bits(), 32);
    push_bits(&mut b, u64::from(ctr), 8);
    push_bits(&mut b, u64::from(cmas), 2);
    push_bits(&mut b, u64::from(ccf), 1);
    if ccf {
        push_bits(&mut b, u64::from(ct), 6);
    }
    b.extend_from_slice(message_bits);
    super::bits::to_bytes(&b)
}

/// A MAC (9.1.4, 9.2.2): `mf` 0 HMAC-SHA-256 or 1 CMAC-AES, truncated to `bits`.
pub fn compute_mac(mf: u8, key: &[u8], input: &[u8], bits: usize) -> Option<Vec<u8>> {
    let f = match mf {
        0 => MacFn::HmacSha256,
        1 => MacFn::CmacAes,
        _ => return None,
    };
    Some(mac::truncate(&mac::compute(f, key, input).ok()?, bits))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rki(kroot: &[u8], salt: &[u8], week: u16, hour: u8) -> RootKeyInfo {
        RootKeyInfo {
            common: Common {
                epoch_s: 0,
                adi: 15,
                multiple: false,
                cmas: 2,
                cpks: 1,
            },
            chain_id: 1,
            public_key_type: 1,
            public_key_id: 7,
            test_key: false,
            hash_function: 0,
            mac_function: 0,
            key_size: 4,
            kroot_week: week,
            kroot_hour: hour,
            salt: hex::encode(salt),
            kroot: hex::encode(kroot),
            signature: String::new(),
        }
    }

    // PIN-SCOPE:    one step of the TESLA truncated hash F (SHA-256, 128-bit key) and one
    //               HMAC-SHA-256 MAC over the 9.1.4 input, each computed independently with
    //               Python's hashlib and hmac from the same field values.
    // PIN-EXCLUDES: SHA3-256 and CMAC-AES (library primitives, not pinned here) and any
    //               QZSS-generated data (none is published).
    #[test]
    fn truncated_hash_known_answer() {
        // Independent value: Python hashlib, sha256(bytes(range(16)) + (week 2400, tow 300
        // as 12 + 20 bits) + bytes(range(16, 22)))[:16].
        let t = QzssTime {
            week: 2400,
            tow: 300,
        };
        let salt: Vec<u8> = (16..22).collect();
        let k: Vec<u8> = (0..16).collect();
        let got = tesla_f(&k, t, &salt, 0, 128).unwrap();
        assert_eq!(hex::encode(got), "a153ba10041e7e532ca379f245d8ebfd");
        assert!(tesla_f(&k, t, &salt, 1, 128).is_none());
    }

    #[test]
    fn key_chain_leads_to_kroot() {
        let salt = [9u8, 8, 7, 6, 5, 4];
        let (week, hour) = (2400u16, 10u8);
        let t0 = i64::from(week) * 604_800 + i64::from(hour) * 3600;
        // Build K_0..K_5 from a seed K_5, with the times of 9.1.3.
        let n = 5;
        let mut keys = vec![vec![0u8; 16]; n + 1];
        keys[n] = (100..116).collect();
        for i in (0..n).rev() {
            let ti = QzssTime::from_seconds(t0 + DELTA_T_S + (i as i64 - 1) * TBA_S);
            keys[i] = tesla_f(&keys[i + 1], ti, &salt, 0, 128).unwrap();
        }
        let r = rki(&keys[0], &salt, week, hour);
        let t5 = QzssTime::from_seconds(t0 + DELTA_T_S + 4 * TBA_S);
        assert_eq!(key_index(&r, t5), Some(5));
        assert_eq!(verify_tesla_key(&r, &keys[5], t5), Ok(5));
        let t3 = QzssTime::from_seconds(t0 + DELTA_T_S + 2 * TBA_S);
        assert_eq!(verify_tesla_key(&r, &keys[3], t3), Ok(3));
        assert_eq!(verify_tesla_key(&r, &keys[4], t5), Err(KeyError::Mismatch));
        let off = QzssTime::from_seconds(t0 + DELTA_T_S + 4 * TBA_S + 3);
        assert_eq!(verify_tesla_key(&r, &keys[5], off), Err(KeyError::BadTime));
    }

    #[test]
    fn kroot_signature_round_trip() {
        use p256::ecdsa::{signature::Signer, Signature, SigningKey};
        let sk = SigningKey::from_slice(&[7u8; 32]).unwrap();
        let mut r = rki(&[0xAB; 16], &[1, 2, 3, 4, 5, 6], 2400, 3);
        let sig: Signature = sk.sign(&kroot_message(&r).unwrap());
        r.signature = hex::encode(sig.to_bytes());
        let pk = PublicKey {
            pkid: 7,
            key_type: KeyType::P256,
            bytes: p256::ecdsa::VerifyingKey::from(&sk)
                .to_sec1_point(true)
                .as_bytes()
                .to_vec(),
        };
        assert_eq!(verify_kroot(&r, &pk), Ok(()));
        r.kroot_hour = 4;
        assert_eq!(verify_kroot(&r, &pk), Err(SigError::Invalid));
        // M is 83 + 128 bits, padded to 27 bytes.
        assert_eq!(kroot_message(&r).unwrap().len(), 27);
    }

    #[test]
    fn mac_known_answer_and_threshold() {
        // Independent value: Python hmac/hashlib over the same 9.1.4 composition.
        let t = QzssTime {
            week: 2400,
            tow: 12345,
        };
        let input = mac_input(199, t, 3, 2, true, 0b010_011, &[1, 0, 1, 1, 0, 1]);
        let mac = compute_mac(0, &[0x42; 16], &input, 40).unwrap();
        assert_eq!(hex::encode(&input), "c79600303903a9da");
        assert_eq!(hex::encode(mac), "b33e790627");
        // SDF525: CLASS 0, VALUE 0 gives 0 m; CLASS 2, VALUE 3 gives (9 * 1.75 - 1) / 25.
        assert_eq!(continuity_threshold_m(0), 0.0);
        assert!((continuity_threshold_m(0b010_011) - 0.59).abs() < 1e-12);
    }
}
