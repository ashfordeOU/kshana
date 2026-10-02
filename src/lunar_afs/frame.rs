// SPDX-License-Identifier: AGPL-3.0-only
//! **The AFS-I navigation frame of frame identifier (FID) 0 (LSIS V1.0 2.4).**
//!
//! A 12 s frame of 6000 symbols at 500 symbols per second (Figure 9):
//!
//! | symbols | content |
//! |---|---|
//! | 0..68 | the uncoded synchronisation pattern `CC63F74536F49E04A` (LSIS-330) |
//! | 68..120 | subframe 1, the 9-bit FID and time-of-interval (TOI) word in a Bose–Chaudhuri–Hocquenghem (BCH) (51, 8) code (2.4.2.1) |
//! | 120..6000 | subframes 2, 3 and 4 (1200, 870, 870 bits with their 24-bit cyclic redundancy check, CRC-24) in rate 1/2 low-density parity-check (LDPC) codes (2400 + 1740 + 1740 symbols), block-interleaved 60 x 98 (2.4.3.1.5) |
//!
//! Bits are numbered and transmitted most significant first (LSIS-320). Subframe contents are
//! largely to-be-written in V1.0 ({LSIS-TBW-2004} to {LSIS-TBW-2014}), so subframes 2, 3 and 4
//! carry caller-supplied data bits; [`spare_bits`] gives the LSIS-300 spare pattern.

use super::ldpc::{LdpcCode, Subframe};

/// Symbols in one frame.
pub const FRAME_SYMBOLS: usize = 6000;
/// The synchronisation pattern of LSIS-330 Table 12 ({LSIS-TBC-2021}), 68 symbols.
pub const SYNC_PATTERN_HEX: &str = "CC63F74536F49E04A";
/// Symbols of the synchronisation pattern.
pub const SYNC_SYMBOLS: usize = 68;
/// Symbols of encoded subframe 1.
pub const SB1_SYMBOLS: usize = 52;
/// Data bits of subframe 2 without its CRC.
pub const SB2_DATA_BITS: usize = 1176;
/// Data bits of subframes 3 and 4 without their CRC (type field included).
pub const SB34_DATA_BITS: usize = 846;
/// Interleaver rows (LSIS 2.4.3.1.5 text; Table 17 prints the dimensions transposed).
pub const INTERLEAVER_ROWS: usize = 60;
/// Interleaver columns.
pub const INTERLEAVER_COLS: usize = 98;
/// The CRC-24 generator `(1 + X)·P(X)` of LSIS-FID0-467, with its `X^24` term.
pub const CRC24_POLY: u32 = 0x186_4CFB;

/// Bits of a hexadecimal string, most significant first, keeping the last `n` bits.
pub fn hex_bits(hex: &str, n: usize) -> Vec<u8> {
    let mut bits = Vec::with_capacity(hex.len() * 4);
    for ch in hex.chars() {
        let v = ch.to_digit(16).expect("hexadecimal digit") as u8;
        for k in (0..4).rev() {
            bits.push((v >> k) & 1);
        }
    }
    let skip = bits.len().saturating_sub(n);
    bits[skip..].to_vec()
}

/// The 68 synchronisation-pattern symbols.
pub fn sync_pattern() -> Vec<u8> {
    hex_bits(SYNC_PATTERN_HEX, SYNC_SYMBOLS)
}

/// The LSIS-300 spare-bit pattern: alternating zeros and ones, starting with zero.
pub fn spare_bits(n: usize) -> Vec<u8> {
    (0..n).map(|i| (i % 2) as u8).collect()
}

/// Encode the 9-bit subframe-1 word (`fid` in the two most significant bits, `toi` in the
/// seven least) into 52 symbols with the BCH (51, 8) code of LSIS 2.4.2.1: bits 1 to 8 load
/// the 8-stage register of Figure 7 (bit 1 in stage 8, output first), the register is shifted
/// 51 times with feedback `1 + X + X^4 + X^5 + X^6 + X^7 + X^8` (octal 763), bit 0 is added
/// modulo 2 to the 51 outputs and prepended.
pub fn encode_sb1(fid: u8, toi: u8) -> Result<Vec<u8>, String> {
    if fid > 3 {
        return Err(format!("FID {fid} does not fit two bits (0..3)"));
    }
    if toi > 99 {
        return Err(format!("TOI {toi} outside 0..99 (LSIS-410)"));
    }
    Ok(bch_51_8(((fid as u16) << 7) | toi as u16))
}

/// Decode 52 subframe-1 soft symbols (positive favours logic 0) by the exhaustive
/// correlation the standard describes after Figure 8: returns `(fid, toi)`.
pub fn decode_sb1(soft: &[f64]) -> Result<(u8, u8), String> {
    if soft.len() != SB1_SYMBOLS {
        return Err(format!("{SB1_SYMBOLS} subframe-1 symbols expected"));
    }
    // Hypotheses with bit 0 (the MSB) equal to 0; bit 0 is then the sign of the best match.
    let mut best = (0u16, 0.0f64);
    for low8 in 0u16..256 {
        let corr: f64 = soft
            .iter()
            .zip(&bch_51_8(low8))
            .map(|(&s, &c)| if c == 0 { s } else { -s })
            .sum();
        if corr.abs() > best.1.abs() {
            best = (low8, corr);
        }
    }
    let word = (u16::from(best.1 < 0.0) << 8) | best.0;
    Ok(((word >> 7) as u8, (word & 0x7F) as u8))
}

/// The 52-symbol BCH (51, 8) word of a 9-bit subframe-1 word (bit 0 its MSB).
fn bch_51_8(word: u16) -> Vec<u8> {
    let bit = |i: usize| ((word >> (8 - i)) & 1) as u8;
    // stage[j] is stage j + 1: bit 1 in stage 8, bit 8 in stage 1.
    let mut stage = [0u8; 8];
    for i in 1..=8 {
        stage[8 - i] = bit(i);
    }
    let b0 = bit(0);
    let mut out = Vec::with_capacity(SB1_SYMBOLS);
    out.push(b0);
    for _ in 0..51 {
        out.push(stage[7] ^ b0);
        let fb = stage[0] ^ stage[3] ^ stage[4] ^ stage[5] ^ stage[6] ^ stage[7];
        for j in (1..8).rev() {
            stage[j] = stage[j - 1];
        }
        stage[0] = fb;
    }
    out
}

/// The 24 CRC bits of a bit sequence (LSIS-FID0-469): the remainder of `m(X)·X^24` divided by
/// [`CRC24_POLY`], `m_1` the most significant; `p_i` is the coefficient of `X^(24-i)`.
pub fn crc24_bits(bits: &[u8]) -> [u8; 24] {
    let mut reg: u32 = 0;
    for &b in bits {
        let top = ((reg >> 23) & 1) ^ (b as u32 & 1);
        reg = (reg << 1) & 0xFF_FFFF;
        if top == 1 {
            reg ^= CRC24_POLY & 0xFF_FFFF;
        }
    }
    let mut out = [0u8; 24];
    for (i, o) in out.iter_mut().enumerate() {
        *o = ((reg >> (23 - i)) & 1) as u8;
    }
    out
}

/// The CRC-24 of whole bytes, most significant bit first, as a 24-bit integer.
pub fn crc24_bytes(data: &[u8]) -> u32 {
    let bits: Vec<u8> = data
        .iter()
        .flat_map(|&b| (0..8).rev().map(move |k| (b >> k) & 1))
        .collect();
    crc24_bits(&bits)
        .iter()
        .fold(0u32, |a, &b| (a << 1) | b as u32)
}

/// Interleave the 5880 coded symbols: written row by row into 60 rows of 98, read column by
/// column (LSIS 2.4.3.1.5).
pub fn interleave(sym: &[u8]) -> Vec<u8> {
    assert_eq!(sym.len(), INTERLEAVER_ROWS * INTERLEAVER_COLS);
    let mut out = Vec::with_capacity(sym.len());
    for c in 0..INTERLEAVER_COLS {
        for r in 0..INTERLEAVER_ROWS {
            out.push(sym[r * INTERLEAVER_COLS + c]);
        }
    }
    out
}

/// Invert [`interleave`] (any element type).
pub fn deinterleave<T: Copy + Default>(sym: &[T]) -> Vec<T> {
    assert_eq!(sym.len(), INTERLEAVER_ROWS * INTERLEAVER_COLS);
    let mut out = vec![T::default(); sym.len()];
    let mut j = 0;
    for c in 0..INTERLEAVER_COLS {
        for r in 0..INTERLEAVER_ROWS {
            out[r * INTERLEAVER_COLS + c] = sym[j];
            j += 1;
        }
    }
    out
}

/// The content of one FID0 frame, before coding.
#[derive(Clone, Debug, PartialEq, Eq, serde::Serialize, serde::Deserialize)]
pub struct FrameData {
    /// Frame identifier (only 0 is defined in V1.0).
    pub fid: u8,
    /// Time of interval, 0..99: the frame count within the 20 min block (LSIS-720).
    pub toi: u8,
    /// Subframe 2 data, 1176 bits.
    pub sb2: Vec<u8>,
    /// Subframe 3 data (type field included), 846 bits.
    pub sb3: Vec<u8>,
    /// Subframe 4 data (type field included), 846 bits.
    pub sb4: Vec<u8>,
}

/// A subframe's data with its CRC appended.
pub fn with_crc(data: &[u8]) -> Vec<u8> {
    let mut v: Vec<u8> = data.iter().map(|b| b & 1).collect();
    v.extend_from_slice(&crc24_bits(data));
    v
}

/// The frame coder: holds the two LDPC codes.
#[derive(Clone, Debug)]
pub struct FrameCoder {
    /// Subframe-2 code.
    pub sb2: LdpcCode,
    /// Subframe-3 and subframe-4 code.
    pub sb34: LdpcCode,
}

/// What [`FrameCoder::decode`] recovers from one frame.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct DecodedFrame {
    /// Decoded FID and TOI.
    pub fid: u8,
    /// Decoded TOI.
    pub toi: u8,
    /// Decoded subframe 2, 3, 4 data bits (CRC removed).
    pub data: [Vec<u8>; 3],
    /// Whether each subframe's LDPC parity checks all held.
    pub parity_ok: [bool; 3],
    /// Whether each subframe's CRC matched.
    pub crc_ok: [bool; 3],
    /// Whether the decoded subframe-1 word is a valid one: the BCH code admits TOI values up
    /// to 127, but LSIS-410 defines only 0..99, so a corrupted subframe 1 can decode to a TOI
    /// that no transmitter sends. Subframes 2 to 4 are decoded regardless.
    pub sb1_valid: bool,
}

impl FrameCoder {
    /// Load both codes from the verified LSIS cache.
    pub fn load() -> Result<Self, String> {
        Ok(FrameCoder {
            sb2: LdpcCode::load(Subframe::Sb2)?,
            sb34: LdpcCode::load(Subframe::Sb34)?,
        })
    }

    /// The 6000 symbols of a frame.
    pub fn encode(&self, f: &FrameData) -> Result<Vec<u8>, String> {
        if f.sb2.len() != SB2_DATA_BITS
            || f.sb3.len() != SB34_DATA_BITS
            || f.sb4.len() != SB34_DATA_BITS
        {
            return Err(format!(
                "subframe data lengths {}/{}/{} (expected {SB2_DATA_BITS}/{SB34_DATA_BITS}/{SB34_DATA_BITS})",
                f.sb2.len(),
                f.sb3.len(),
                f.sb4.len()
            ));
        }
        let mut coded = self.sb2.encode(&with_crc(&f.sb2))?;
        coded.extend(self.sb34.encode(&with_crc(&f.sb3))?);
        coded.extend(self.sb34.encode(&with_crc(&f.sb4))?);
        let mut frame = sync_pattern();
        frame.extend(encode_sb1(f.fid, f.toi)?);
        frame.extend(interleave(&coded));
        debug_assert_eq!(frame.len(), FRAME_SYMBOLS);
        Ok(frame)
    }

    /// Decode a frame's 6000 soft symbols (positive favours logic 0), synchronisation pattern
    /// first.
    pub fn decode(&self, soft: &[f64], max_iter: usize) -> Result<DecodedFrame, String> {
        if soft.len() != FRAME_SYMBOLS {
            return Err(format!(
                "{FRAME_SYMBOLS} symbols expected, {} given",
                soft.len()
            ));
        }
        let (fid, toi) = decode_sb1(&soft[SYNC_SYMBOLS..SYNC_SYMBOLS + SB1_SYMBOLS])?;
        let coded = deinterleave(&soft[SYNC_SYMBOLS + SB1_SYMBOLS..]);
        let n2 = self.sb2.n_tx;
        let n3 = self.sb34.n_tx;
        let parts = [
            (&self.sb2, &coded[..n2], SB2_DATA_BITS),
            (&self.sb34, &coded[n2..n2 + n3], SB34_DATA_BITS),
            (&self.sb34, &coded[n2 + n3..], SB34_DATA_BITS),
        ];
        let mut data: [Vec<u8>; 3] = Default::default();
        let mut parity_ok = [false; 3];
        let mut crc_ok = [false; 3];
        for (i, (code, llr, nd)) in parts.into_iter().enumerate() {
            let (bits, ok) = code.decode_min_sum(llr, max_iter);
            crc_ok[i] = crc24_bits(&bits[..nd]) == bits[nd..nd + 24];
            parity_ok[i] = ok;
            data[i] = bits[..nd].to_vec();
        }
        Ok(DecodedFrame {
            fid,
            toi,
            data,
            parity_ok,
            crc_ok,
            sb1_valid: toi <= 99,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Internal: the bit-level CRC agrees with the crate's byte-level CRC-24Q on byte-aligned
    /// input (two code paths, same polynomial).
    #[test]
    fn crc24_agrees_with_the_byte_level_crc24q() {
        let data: Vec<u8> = (0u8..=200).map(|i| i.wrapping_mul(37) ^ 0x5A).collect();
        assert_eq!(crc24_bytes(&data), crate::leo_navmsg::codec::crc24q(&data));
    }

    /// A subframe 1 carrying an undefined TOI (here 120) decodes to that value with
    /// `sb1_valid` false, while subframes 2 to 4 still decode.
    #[test]
    fn out_of_range_toi_is_flagged_not_hidden() {
        if !crate::lunar_afs::lsis::cache_present() {
            eprintln!("SKIP: {}", crate::lunar_afs::lsis::fetch_hint());
            return;
        }
        let coder = FrameCoder::load().unwrap();
        let f = FrameData {
            fid: 0,
            toi: 7,
            sb2: spare_bits(SB2_DATA_BITS),
            sb3: spare_bits(SB34_DATA_BITS),
            sb4: spare_bits(SB34_DATA_BITS),
        };
        let mut sym = coder.encode(&f).unwrap();
        sym[SYNC_SYMBOLS..SYNC_SYMBOLS + SB1_SYMBOLS].copy_from_slice(&bch_51_8(120));
        let soft: Vec<f64> = sym
            .iter()
            .map(|&b| if b == 1 { -4.0 } else { 4.0 })
            .collect();
        let d = coder.decode(&soft, 50).unwrap();
        assert_eq!((d.fid, d.toi, d.sb1_valid), (0, 120, false));
        assert_eq!(d.crc_ok, [true; 3]);
        let ok = coder
            .decode(
                &coder
                    .encode(&f)
                    .unwrap()
                    .iter()
                    .map(|&b| if b == 1 { -4.0 } else { 4.0 })
                    .collect::<Vec<_>>(),
                50,
            )
            .unwrap();
        assert!(ok.sb1_valid && ok.toi == 7);
    }

    /// Internal: interleaving is a permutation that deinterleaving undoes.
    #[test]
    fn interleaver_round_trips() {
        let v: Vec<u8> = (0..5880).map(|i| (i % 7 == 0) as u8).collect();
        let w = interleave(&v);
        assert_ne!(w, v);
        assert_eq!(deinterleave(&w), v);
        assert_eq!(w[1], v[98]); // column 1 of row 1 follows column 1 of row 0
    }

    /// Internal: the spare pattern starts with zero (LSIS-300) and the sync pattern has 68 bits.
    #[test]
    fn spare_and_sync_patterns() {
        assert_eq!(spare_bits(4), vec![0, 1, 0, 1]);
        let sp = sync_pattern();
        assert_eq!(sp.len(), 68);
        assert_eq!(&sp[..8], &[1, 1, 0, 0, 1, 1, 0, 0]);
    }
}
