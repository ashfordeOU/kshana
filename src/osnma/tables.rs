// SPDX-License-Identifier: AGPL-3.0-only
//! Enumerated field values (SIS ICD Issue 1.1, sections 3.2.2 and 3.2.3: Tables 3 and
//! 5 to 11). Only the numeric facts are kept; reserved entries map to `None`.

/// Number of 104-bit blocks of a DSM-KROOT for an NBDK value (Table 7).
pub fn kroot_blocks(nbdk: u8) -> Option<usize> {
    (1..=8).contains(&nbdk).then(|| 6 + usize::from(nbdk))
}

/// Number of 104-bit blocks of a DSM-PKR for an NBDP value (Table 3).
pub fn pkr_blocks(nbdp: u8) -> Option<usize> {
    (7..=10).contains(&nbdp).then(|| 6 + usize::from(nbdp))
}

/// Chain hash function (Table 8).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum HashFn {
    Sha256,
    Sha3_256,
}

pub fn hash_fn(hf: u8) -> Option<HashFn> {
    match hf {
        0 => Some(HashFn::Sha256),
        2 => Some(HashFn::Sha3_256),
        _ => None,
    }
}

/// MAC function (Table 9).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum MacFn {
    HmacSha256,
    CmacAes,
}

pub fn mac_fn(mf: u8) -> Option<MacFn> {
    match mf {
        0 => Some(MacFn::HmacSha256),
        1 => Some(MacFn::CmacAes),
        _ => None,
    }
}

/// TESLA key length in bits (Table 10).
pub fn key_bits(ks: u8) -> Option<usize> {
    const BITS: [usize; 9] = [96, 104, 112, 120, 128, 160, 192, 224, 256];
    BITS.get(usize::from(ks)).copied()
}

/// Tag length in bits (Table 11).
pub fn tag_bits(ts: u8) -> Option<usize> {
    (5..=9)
        .contains(&ts)
        .then(|| [20, 24, 28, 32, 40][usize::from(ts) - 5])
}

/// ECDSA key type carried by a DSM-PKR (Table 5) with its NPK and signature lengths
/// in bits (Tables 6 and 15).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum KeyType {
    P256,
    P521,
}

impl KeyType {
    pub fn from_npkt(npkt: u8) -> Option<Self> {
        match npkt {
            1 => Some(Self::P256),
            3 => Some(Self::P521),
            _ => None,
        }
    }

    pub fn npk_bits(self) -> usize {
        match self {
            Self::P256 => 264,
            Self::P521 => 536,
        }
    }

    pub fn signature_bits(self) -> usize {
        match self {
            Self::P256 => 512,
            Self::P521 => 1056,
        }
    }
}

/// NPKT value that marks an OSNMA Alert Message.
pub const NPKT_ALERT: u8 = 4;
