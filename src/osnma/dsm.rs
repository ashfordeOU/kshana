// SPDX-License-Identifier: AGPL-3.0-only
//! DSM reassembly (ICD 3.2, 5.3) and the DSM-KROOT / DSM-PKR layouts (3.2.2, 3.2.3).

use super::bits::read_bits;
use super::tables::{self, HashFn, KeyType, MacFn};

pub const BLOCK_BYTES: usize = 13;
const MAX_BLOCKS: usize = 16;

/// Collects the 13-byte blocks of each DSM id (blocks may come from different
/// satellites). A block that disagrees with one already held for the same
/// (id, block) discards that DSM so a mixed set never completes silently.
#[derive(Debug, Default)]
pub struct DsmAssembler {
    slots: [Vec<Option<[u8; BLOCK_BYTES]>>; MAX_BLOCKS],
}

/// A complete DSM, trimmed to its defined length.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Dsm {
    pub dsm_id: u8,
    pub bytes: Vec<u8>,
}

impl DsmAssembler {
    pub fn new() -> Self {
        Self::default()
    }

    /// Feed one block; returns the DSM it completed, if any.
    pub fn push(&mut self, dsm_id: u8, block_id: u8, block: &[u8]) -> Option<Dsm> {
        let id = usize::from(dsm_id);
        let bid = usize::from(block_id);
        let block: [u8; BLOCK_BYTES] = block.try_into().ok()?;
        if id >= MAX_BLOCKS || bid >= MAX_BLOCKS {
            return None;
        }
        let slot = &mut self.slots[id];
        if slot.len() <= bid {
            slot.resize(MAX_BLOCKS, None);
        }
        match slot[bid] {
            Some(old) if old != block => {
                slot.clear();
                return None;
            }
            _ => slot[bid] = Some(block),
        }
        let nb = Self::block_count(dsm_id, slot[0].as_ref()?)?;
        let mut bytes = Vec::with_capacity(nb * BLOCK_BYTES);
        for b in slot.iter().take(nb) {
            bytes.extend_from_slice(b.as_ref()?);
        }
        slot.clear();
        Some(Dsm { dsm_id, bytes })
    }

    fn block_count(dsm_id: u8, block0: &[u8; BLOCK_BYTES]) -> Option<usize> {
        let nb = block0[0] >> 4;
        if dsm_id <= 11 {
            tables::kroot_blocks(nb)
        } else {
            tables::pkr_blocks(nb)
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DsmKroot {
    pub pkid: u8,
    pub cidkr: u8,
    pub hf: u8,
    pub mf: u8,
    pub ks: u8,
    pub ts: u8,
    pub maclt: u8,
    pub wnk: u16,
    pub towhk: u8,
    pub alpha: [u8; 6],
    pub key_bits: usize,
    pub tag_bits: usize,
    pub hash: HashFn,
    pub mac: MacFn,
    pub kroot: Vec<u8>,
    pub signature: Vec<u8>,
    /// DSM bytes from the CIDKR byte up to and including KROOT (the body of the signed
    /// message M, Eq. 14, without the leading NMA header byte).
    pub signed_body: Vec<u8>,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum DsmError {
    Truncated,
    Reserved(&'static str),
}

impl DsmKroot {
    /// Parse a complete DSM-KROOT. Which signature length applies depends on the
    /// public key, so the signature is taken from the bytes after KROOT up to the
    /// padding: `sig_bits` is that key's `signature_bits()`.
    pub fn parse(dsm: &[u8], sig_bits: usize) -> Result<Self, DsmError> {
        let f = |pos: usize, n: usize| read_bits(dsm, pos, n).ok_or(DsmError::Truncated);
        let nbdk = f(0, 4)? as u8;
        let blocks = tables::kroot_blocks(nbdk).ok_or(DsmError::Reserved("NBDK"))?;
        if dsm.len() != blocks * BLOCK_BYTES {
            return Err(DsmError::Truncated);
        }
        let ks = f(16, 4)? as u8;
        let ts = f(20, 4)? as u8;
        let key_bits = tables::key_bits(ks).ok_or(DsmError::Reserved("KS"))?;
        let tag_bits = tables::tag_bits(ts).ok_or(DsmError::Reserved("TS"))?;
        let hash = tables::hash_fn(f(12, 2)? as u8).ok_or(DsmError::Reserved("HF"))?;
        let mac = tables::mac_fn(f(14, 2)? as u8).ok_or(DsmError::Reserved("MF"))?;
        let key_bytes = key_bits / 8;
        // Fixed part: NBDK(4) PKID(4) CIDKR(2) Res(2) HF(2) MF(2) KS(4) TS(4)
        // MACLT(8) Res(4) WNK(12) TOWHK(8) alpha(48) = 104 bits.
        let kroot_off = 13;
        let sig_off = kroot_off + key_bytes;
        let sig_bytes = sig_bits / 8;
        if dsm.len() < sig_off + sig_bytes {
            return Err(DsmError::Truncated);
        }
        let mut alpha = [0u8; 6];
        alpha.copy_from_slice(&dsm[7..13]);
        Ok(Self {
            pkid: f(4, 4)? as u8,
            cidkr: f(8, 2)? as u8,
            hf: f(12, 2)? as u8,
            mf: f(14, 2)? as u8,
            ks,
            ts,
            maclt: f(24, 8)? as u8,
            wnk: f(36, 12)? as u16,
            towhk: f(48, 8)? as u8,
            alpha,
            key_bits,
            tag_bits,
            hash,
            mac,
            kroot: dsm[kroot_off..sig_off].to_vec(),
            signature: dsm[sig_off..sig_off + sig_bytes].to_vec(),
            signed_body: dsm[1..sig_off].to_vec(),
        })
    }

    /// GST seconds of the chain's time of applicability, `GST_0` (ICD 5.5.1).
    pub fn gst0(&self) -> u32 {
        (u32::from(self.wnk) << 20) | (u32::from(self.towhk) * 3600)
    }

    /// The message that the digital signature covers (Eq. 14).
    pub fn signed_message(&self, nma_header: u8) -> Vec<u8> {
        let mut m = Vec::with_capacity(1 + self.signed_body.len());
        m.push(nma_header);
        m.extend_from_slice(&self.signed_body);
        m
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct DsmPkr {
    pub mid: u8,
    pub itn: [[u8; 32]; 4],
    pub npkt: u8,
    pub npkid: u8,
    pub npk: Vec<u8>,
}

impl DsmPkr {
    pub fn parse(dsm: &[u8]) -> Result<Self, DsmError> {
        let nbdp = *dsm.first().ok_or(DsmError::Truncated)? >> 4;
        let blocks = tables::pkr_blocks(nbdp).ok_or(DsmError::Reserved("NBDP"))?;
        if dsm.len() != blocks * BLOCK_BYTES {
            return Err(DsmError::Truncated);
        }
        let mid = dsm[0] & 0x0F;
        let mut itn = [[0u8; 32]; 4];
        for (i, n) in itn.iter_mut().enumerate() {
            n.copy_from_slice(&dsm[1 + 32 * i..33 + 32 * i]);
        }
        let npkt = dsm[129] >> 4;
        let npkid = dsm[129] & 0x0F;
        let npk_len = if npkt == tables::NPKT_ALERT {
            0
        } else {
            KeyType::from_npkt(npkt)
                .ok_or(DsmError::Reserved("NPKT"))?
                .npk_bits()
                / 8
        };
        let end = 130 + npk_len;
        if dsm.len() < end {
            return Err(DsmError::Truncated);
        }
        Ok(Self {
            mid,
            itn,
            npkt,
            npkid,
            npk: dsm[130..end].to_vec(),
        })
    }

    pub fn is_alert(&self) -> bool {
        self.npkt == tables::NPKT_ALERT
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn assembles_across_sources_and_rejects_mixed_blocks() {
        // NBDK = 1 -> 7 blocks.
        let mut a = DsmAssembler::new();
        let mut done = None;
        for b in 0..7u8 {
            let mut blk = [b; BLOCK_BYTES];
            if b == 0 {
                blk[0] = 0x10;
            }
            done = a.push(3, b, &blk);
            if b < 6 {
                assert!(done.is_none());
            }
        }
        let d = done.expect("complete");
        assert_eq!(d.bytes.len(), 7 * BLOCK_BYTES);
        // A conflicting block for a held (id, block) drops that DSM.
        let mut a = DsmAssembler::new();
        let mut b0 = [0u8; BLOCK_BYTES];
        b0[0] = 0x10;
        assert!(a.push(3, 0, &b0).is_none());
        let mut other = b0;
        other[5] = 1;
        assert!(a.push(3, 0, &other).is_none());
        for b in 1..7u8 {
            assert!(a.push(3, b, &[0; BLOCK_BYTES]).is_none());
        }
    }

    #[test]
    fn kroot_field_offsets() {
        // NBDK=2 (8 blocks = 104 bytes), PKID 5, CIDKR 2, HF 0, MF 1, KS 4 (128 b),
        // TS 9 (40 b), MACLT 0x21, WNK 0x4E0, TOWHK 0x6B.
        let mut d = vec![0u8; 104];
        d[0] = 0x25;
        d[1] = 0b10_00_00_01;
        d[2] = 0x49;
        d[3] = 0x21;
        d[4] = 0x04;
        d[5] = 0xE0;
        d[6] = 0x6B;
        d[7..13].copy_from_slice(&[1, 2, 3, 4, 5, 6]);
        for (i, b) in d[13..29].iter_mut().enumerate() {
            *b = 0xA0 + i as u8;
        }
        let k = DsmKroot::parse(&d, 512).unwrap();
        assert_eq!((k.pkid, k.cidkr, k.hf, k.mf), (5, 2, 0, 1));
        assert_eq!((k.key_bits, k.tag_bits, k.maclt), (128, 40, 0x21));
        assert_eq!((k.wnk, k.towhk), (0x4E0, 0x6B));
        assert_eq!(k.alpha, [1, 2, 3, 4, 5, 6]);
        assert_eq!(k.kroot[0], 0xA0);
        assert_eq!(k.signature.len(), 64);
        assert_eq!(k.gst0(), (0x4E0 << 20) | (0x6B * 3600));
        let m = k.signed_message(0x72);
        assert_eq!(m.len(), 1 + 28);
        assert_eq!(m[0], 0x72);
    }

    #[test]
    fn pkr_parse_and_alert() {
        // NBDP 7 -> 13 blocks = 169 bytes; NPKT 1 (P-256, 33 byte NPK).
        let mut d = vec![0u8; 169];
        d[0] = 0x73;
        d[129] = 0x12;
        d[130] = 0x02;
        let p = DsmPkr::parse(&d).unwrap();
        assert_eq!((p.mid, p.npkt, p.npkid), (3, 1, 2));
        assert_eq!(p.npk.len(), 33);
        assert!(!p.is_alert());
        d[129] = 0x40;
        assert!(DsmPkr::parse(&d).unwrap().is_alert());
        d[129] = 0x20;
        assert_eq!(DsmPkr::parse(&d), Err(DsmError::Reserved("NPKT")));
    }
}
