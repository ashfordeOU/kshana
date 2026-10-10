// SPDX-License-Identifier: AGPL-3.0-only
//! Assembly of the 120-bit HKROOT and 480-bit MACK messages from the 15 pages of
//! one I/NAV sub-frame, and parsing of their fixed-layout headers (ICD sections
//! 3.1, 3.2.1 and 4).

use super::bits::read_bits;
use super::page::InavPage;
use std::collections::BTreeMap;

pub const SUBFRAME_S: u32 = 30;
pub const PAGE_S: u32 = 2;
pub const PAGES_PER_SUBFRAME: usize = 15;
pub const HKROOT_BYTES: usize = 15;
pub const MACK_BYTES: usize = 60;

/// NMA header: the first HKROOT byte (ICD section 3.1).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct NmaHeader {
    /// 1 test, 2 operational, 3 don't use, 0 reserved.
    pub nmas: u8,
    pub cid: u8,
    /// 1 nominal, 2 EOC, 3 CREV, 4 NPK, 5 PKREV, 6 NMT, 7 alert; 0 reserved.
    pub cpks: u8,
}

impl NmaHeader {
    pub fn parse(byte: u8) -> Self {
        Self {
            nmas: byte >> 6,
            cid: (byte >> 4) & 0b11,
            cpks: (byte >> 1) & 0b111,
        }
    }
}

/// DSM header: HKROOT byte 1 (ICD section 3.2.1).
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct DsmHeader {
    /// 0..=11 DSM-KROOT, 12..=15 DSM-PKR.
    pub dsm_id: u8,
    pub block_id: u8,
}

impl DsmHeader {
    pub fn parse(byte: u8) -> Self {
        Self {
            dsm_id: byte >> 4,
            block_id: byte & 0x0F,
        }
    }

    pub fn is_kroot(self) -> bool {
        self.dsm_id <= 11
    }
}

/// One completed sub-frame of one satellite.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Subframe {
    pub svid: u8,
    /// GST seconds at the start of the sub-frame (a multiple of 30).
    pub gst_sf: u32,
    pub hkroot: [u8; HKROOT_BYTES],
    pub mack: [u8; MACK_BYTES],
    /// The 128-bit I/NAV word of each of the 15 pages, in transmission order.
    pub words: [[u8; 16]; PAGES_PER_SUBFRAME],
    /// False when any page carried an all-zero OSNMA field (a satellite that does not
    /// transmit OSNMA, or a gap); then `hkroot` and `mack` must not be used.
    pub has_osnma: bool,
}

impl Subframe {
    pub fn nma_header(&self) -> NmaHeader {
        NmaHeader::parse(self.hkroot[0])
    }

    /// The 104-bit DSM block (HKROOT bytes 2..15).
    pub fn dsm_block(&self) -> &[u8] {
        &self.hkroot[2..]
    }

    pub fn dsm_header(&self) -> DsmHeader {
        DsmHeader::parse(self.hkroot[1])
    }
}

/// Collects pages into sub-frames. Pages are placed by GST (page index is
/// `(gst mod 30) / 2`); a sub-frame is emitted when all 15 pages arrived. Its
/// navigation data is always kept, because a tag from another satellite may cover it;
/// the OSNMA sections count only when every page carried a non-zero OSNMA field.
#[derive(Debug, Default)]
pub struct SubframeAssembler {
    open: BTreeMap<u8, Partial>,
}

#[derive(Debug)]
struct Partial {
    gst_sf: u32,
    hk: [Option<u8>; PAGES_PER_SUBFRAME],
    mk: [Option<u32>; PAGES_PER_SUBFRAME],
    wd: [[u8; 16]; PAGES_PER_SUBFRAME],
    seen: [bool; PAGES_PER_SUBFRAME],
    osnma: [bool; PAGES_PER_SUBFRAME],
}

impl Partial {
    fn new(gst_sf: u32) -> Self {
        Self {
            gst_sf,
            hk: [None; PAGES_PER_SUBFRAME],
            mk: [None; PAGES_PER_SUBFRAME],
            wd: [[0; 16]; PAGES_PER_SUBFRAME],
            seen: [false; PAGES_PER_SUBFRAME],
            osnma: [false; PAGES_PER_SUBFRAME],
        }
    }

    fn finish(&self, svid: u8) -> Option<Subframe> {
        if !self.seen.iter().all(|s| *s) {
            return None;
        }
        let mut hkroot = [0u8; HKROOT_BYTES];
        let mut mack = [0u8; MACK_BYTES];
        for i in 0..PAGES_PER_SUBFRAME {
            hkroot[i] = self.hk[i].unwrap_or(0);
            mack[i * 4..i * 4 + 4].copy_from_slice(&self.mk[i].unwrap_or(0).to_be_bytes());
        }
        Some(Subframe {
            svid,
            gst_sf: self.gst_sf,
            hkroot,
            mack,
            words: self.wd,
            has_osnma: self.osnma.iter().all(|o| *o),
        })
    }
}

impl SubframeAssembler {
    pub fn new() -> Self {
        Self::default()
    }

    /// Feed one page; returns the sub-frame this page completed, if any. A page
    /// from a new sub-frame discards an incomplete one for the same satellite.
    pub fn push(&mut self, page: &InavPage) -> Option<Subframe> {
        let idx = ((page.gst % SUBFRAME_S) / PAGE_S) as usize;
        let gst_sf = page.gst - page.gst % SUBFRAME_S;
        let entry = self
            .open
            .entry(page.svid)
            .or_insert_with(|| Partial::new(gst_sf));
        if entry.gst_sf != gst_sf {
            *entry = Partial::new(gst_sf);
        }
        entry.hk[idx] = Some(page.hkroot_section());
        entry.mk[idx] = Some(page.mack_section());
        entry.wd[idx] = page.data_word();
        entry.seen[idx] = true;
        entry.osnma[idx] = page.has_osnma();
        let done = entry.finish(page.svid)?;
        self.open.remove(&page.svid);
        Some(done)
    }
}

/// Field layout of a MACK message for a given key length and tag length
/// (ICD section 4, Eq. 8). Lengths are in bits.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub struct MackLayout {
    pub key_bits: usize,
    pub tag_bits: usize,
}

/// One tag with its Tag-Info.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct TagInfo {
    /// Tag, left-aligned in the low `tag_bits` bits.
    pub tag: u64,
    /// PRN of the satellite whose data the tag authenticates. 255 is defined (ICD Table 12)
    /// as Galileo constellation-related information, but no ADKD of Table 14 uses it, so
    /// such tags are discarded like any reserved value.
    pub prn_d: u8,
    pub adkd: u8,
    pub cop: u8,
}

/// Parsed MACK message.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct Mack {
    pub tag0: u64,
    pub macseq: u16,
    pub cop0: u8,
    pub tags: Vec<TagInfo>,
    /// The TESLA key, `key_bits` long, as bytes (left-aligned).
    pub key: Vec<u8>,
}

impl MackLayout {
    /// Tags per MACK including Tag0: `floor((480 - lK) / (lt + 16))`.
    pub fn tags_per_mack(&self) -> usize {
        (480 - self.key_bits) / (self.tag_bits + 16)
    }

    pub fn parse(&self, mack: &[u8]) -> Option<Mack> {
        if mack.len() != MACK_BYTES || self.tag_bits == 0 || self.tag_bits > 64 {
            return None;
        }
        let lt = self.tag_bits;
        let nt = self.tags_per_mack();
        if nt == 0 {
            return None;
        }
        let tag0 = read_bits(mack, 0, lt)?;
        let macseq = read_bits(mack, lt, 12)? as u16;
        let cop0 = read_bits(mack, lt + 12, 4)? as u8;
        let mut pos = lt + 16;
        let mut tags = Vec::with_capacity(nt - 1);
        for _ in 1..nt {
            let tag = read_bits(mack, pos, lt)?;
            let prn_d = read_bits(mack, pos + lt, 8)? as u8;
            let adkd = read_bits(mack, pos + lt + 8, 4)? as u8;
            let cop = read_bits(mack, pos + lt + 12, 4)? as u8;
            tags.push(TagInfo {
                tag,
                prn_d,
                adkd,
                cop,
            });
            pos += lt + 16;
        }
        let key_bytes = self.key_bits.div_ceil(8);
        let mut key = vec![0u8; key_bytes];
        for (i, b) in key.iter_mut().enumerate() {
            let n = (self.key_bits - i * 8).min(8);
            *b = (read_bits(mack, pos + i * 8, n)? as u8) << (8 - n);
        }
        Some(Mack {
            tag0,
            macseq,
            cop0,
            tags,
            key,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::osnma::bits::BitWriter;

    fn page(svid: u8, gst: u32, field: u64) -> InavPage {
        let mut w = BitWriter::new();
        w.push(0, 120);
        w.push(0b10, 2);
        w.push(0, 16);
        w.push(field, 40);
        w.push(0, 240 - w.bit_len());
        InavPage::from_hex(svid, gst, &hex::encode(w.into_bytes())).unwrap()
    }

    #[test]
    fn nma_and_dsm_headers() {
        // 0x72 = NMAS 1 (test), CID 3, CPKS 1 (nominal); reserved bit 0.
        assert_eq!(
            NmaHeader::parse(0x72),
            NmaHeader {
                nmas: 1,
                cid: 3,
                cpks: 1
            }
        );
        let h = DsmHeader::parse(0x2A);
        assert_eq!((h.dsm_id, h.block_id), (2, 10));
        assert!(h.is_kroot());
        assert!(!DsmHeader::parse(0xC0).is_kroot());
    }

    #[test]
    fn assembles_a_subframe_in_order() {
        let mut asm = SubframeAssembler::new();
        let mut done = None;
        for i in 0..15u32 {
            let field = (u64::from(0x10 + i as u8) << 32) | u64::from(0x1000_0000 + i);
            done = asm.push(&page(7, 600 + 2 * i, field));
            if i < 14 {
                assert!(done.is_none());
            }
        }
        let sf = done.expect("complete");
        assert_eq!((sf.svid, sf.gst_sf), (7, 600));
        assert_eq!(sf.hkroot[0], 0x10);
        assert_eq!(sf.hkroot[14], 0x1E);
        assert_eq!(&sf.mack[0..4], &0x1000_0000u32.to_be_bytes());
        assert_eq!(&sf.mack[56..60], &0x1000_000Eu32.to_be_bytes());
    }

    #[test]
    fn missing_pages_do_not_complete_and_empty_fields_clear_the_osnma_flag() {
        let mut asm = SubframeAssembler::new();
        for i in 0..15u32 {
            if i == 4 {
                continue;
            }
            assert!(asm.push(&page(7, 600 + 2 * i, 1 << 33)).is_none());
        }
        // An all-zero OSNMA field still fills the gap (the navigation data is kept),
        // but the sub-frame is marked as carrying no usable OSNMA data.
        let sf = asm.push(&page(7, 608, 0)).expect("complete");
        assert!(!sf.has_osnma);
        let mut asm = SubframeAssembler::new();
        let mut last = None;
        for i in 0..15u32 {
            last = asm.push(&page(7, 600 + 2 * i, 1 << 33));
        }
        assert!(last.expect("complete").has_osnma);
    }

    #[test]
    fn mack_layout_matches_eq8_and_parses() {
        // 128-bit key, 40-bit tag: floor(352 / 56) = 6 tags incl. Tag0.
        let l = MackLayout {
            key_bits: 128,
            tag_bits: 40,
        };
        assert_eq!(l.tags_per_mack(), 6);
        let mut w = BitWriter::new();
        w.push(0xAA_BBCC_DDEE, 40);
        w.push(0x123, 12);
        w.push(0x5, 4);
        for i in 1..6u64 {
            w.push(i, 40);
            w.push(0x10 + i, 8);
            w.push(i, 4);
            w.push(0x3, 4);
        }
        w.push(0x0102_0304_0506_0708, 64);
        w.push(0x090A_0B0C_0D0E_0F10, 64);
        w.push(0, 480 - w.bit_len());
        let bytes = w.into_bytes();
        let m = l.parse(&bytes).unwrap();
        assert_eq!(m.tag0, 0xAA_BBCC_DDEE);
        assert_eq!((m.macseq, m.cop0), (0x123, 5));
        assert_eq!(m.tags.len(), 5);
        assert_eq!(
            m.tags[2],
            TagInfo {
                tag: 3,
                prn_d: 0x13,
                adkd: 3,
                cop: 3
            }
        );
        assert_eq!(m.key, (1..=16).collect::<Vec<u8>>());
        assert!(l.parse(&bytes[..59]).is_none());
    }
}
