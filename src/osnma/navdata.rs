// SPDX-License-Identifier: AGPL-3.0-only
//! The navigation data a tag authenticates (ICD Table 14 and Annex B): which bits of
//! which I/NAV word types, concatenated in order. Field widths are taken from the
//! Annex B layouts; word-type positions follow the Galileo I/NAV word definitions.

use super::bits::{read_bits, BitWriter};

/// Total length of the ADKD 0 / 12 data (Word Types 1 to 5), in bits.
pub const ADKD0_BITS: usize = 549;
/// Total length of the ADKD 4 data (Word Types 6 and 10), in bits.
pub const ADKD4_BITS: usize = 141;

/// A byte buffer holding `bits` valid bits, right-zero-padded.
#[derive(Debug, Clone, PartialEq, Eq)]
pub struct BitString {
    pub bytes: Vec<u8>,
    pub bits: usize,
}

/// (word type, first bit within the 128-bit word, length) pieces in concatenation
/// order. The leading 6 bits of every word are the word type.
const ADKD0_PIECES: [(u8, usize, usize); 5] = [
    (1, 6, 120), // IODnav, t0e, M0, e, sqrtA
    (2, 6, 120), // IODnav, Omega0, i0, omega, IDOT
    (3, 6, 122), // IODnav, Omega-dot, delta-n, Cuc, Cus, Crc, Crs, SISA
    (4, 6, 120), // IODnav, SVID, Cic, Cis, t0c, af0, af1, af2
    (5, 6, 67),  // ionospheric correction, BGDs, health and validity flags
];
const ADKD4_PIECES: [(u8, usize, usize); 2] = [
    (6, 6, 99),   // GST-UTC conversion
    (10, 86, 42), // GST-GPS conversion
];

fn word_type(w: &[u8; 16]) -> u8 {
    (w[0] >> 2) & 0x3F
}

fn collect(words: &[[u8; 16]], pieces: &[(u8, usize, usize)], total: usize) -> Option<BitString> {
    let mut out = BitWriter::new();
    for &(wt, off, len) in pieces {
        let w = words.iter().find(|w| word_type(w) == wt)?;
        let mut done = 0;
        while done < len {
            let n = (len - done).min(32);
            out.push(read_bits(w, off + done, n)?, n);
            done += n;
        }
    }
    debug_assert_eq!(out.bit_len(), total);
    Some(BitString {
        bytes: out.into_bytes(),
        bits: total,
    })
}

/// ADKD 0 and 12: Word Types 1 to 5, which must all be present with one IODnav
/// shared by Word Types 1 to 4.
pub fn adkd0(words: &[[u8; 16]]) -> Option<BitString> {
    let iod = |wt: u8| {
        words
            .iter()
            .find(|w| word_type(w) == wt)
            .and_then(|w| read_bits(w, 6, 10))
    };
    let first = iod(1)?;
    if (2..=4).any(|wt| iod(wt) != Some(first)) {
        return None;
    }
    collect(words, &ADKD0_PIECES, ADKD0_BITS)
}

/// The IODnav carried by the Word Type 1 of a sub-frame's words, if it has one.
pub fn iodnav(words: &[[u8; 16]]) -> Option<u16> {
    let w = words.iter().find(|w| word_type(w) == 1)?;
    read_bits(w, 6, 10).map(|v| v as u16)
}

/// ADKD 4: Word Types 6 and 10.
pub fn adkd4(words: &[[u8; 16]]) -> Option<BitString> {
    collect(words, &ADKD4_PIECES, ADKD4_BITS)
}

/// An all-zero string of the right length, which stands in for the data of a dummy tag
/// (COP = 0, ICD 6.7).
pub fn dummy(adkd: u8) -> Option<BitString> {
    let bits = match adkd {
        0 | 12 => ADKD0_BITS,
        4 => ADKD4_BITS,
        _ => return None,
    };
    Some(BitString {
        bytes: vec![0; bits.div_ceil(8)],
        bits,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    fn word(wt: u8, fill: impl Fn(usize) -> u8) -> [u8; 16] {
        let mut w = BitWriter::new();
        w.push(u64::from(wt), 6);
        for i in 6..128 {
            w.push(u64::from(fill(i)), 1);
        }
        let mut out = [0u8; 16];
        out.copy_from_slice(&w.into_bytes());
        out
    }

    #[test]
    fn adkd0_has_549_bits_and_takes_the_right_pieces() {
        // Each word type's data bits are all ones in the authenticated region only.
        let w1 = word(1, |i| u8::from((6..126).contains(&i)));
        let w2 = word(2, |i| u8::from((6..126).contains(&i)));
        let w3 = word(3, |i| u8::from((6..128).contains(&i)));
        let w4 = word(4, |i| u8::from((6..126).contains(&i)));
        let w5 = word(5, |i| u8::from((6..73).contains(&i)));
        // Same 10-bit IODnav (all ones) in 1 to 4 by construction.
        let d = adkd0(&[w5, w3, w1, w4, w2]).unwrap();
        assert_eq!(d.bits, 549);
        let ones: u32 = (0..549)
            .map(|i| read_bits(&d.bytes, i, 1).unwrap() as u32)
            .sum();
        assert_eq!(ones, 120 + 120 + 122 + 120 + 67);
        assert_eq!(read_bits(&d.bytes, 0, 10), Some(0x3FF));
    }

    #[test]
    fn adkd0_needs_consistent_iodnav_and_all_words() {
        let mk = |wt, iod: u64| {
            let mut w = BitWriter::new();
            w.push(wt, 6);
            w.push(iod, 10);
            w.push(0, 112);
            let mut o = [0u8; 16];
            o.copy_from_slice(&w.into_bytes());
            o
        };
        let good = [mk(1, 5), mk(2, 5), mk(3, 5), mk(4, 5), mk(5, 0)];
        assert!(adkd0(&good).is_some());
        let mut bad = good;
        bad[2] = mk(3, 6);
        assert!(adkd0(&bad).is_none());
        assert!(adkd0(&good[..4]).is_none());
    }

    #[test]
    fn adkd4_is_141_bits_from_wt6_and_wt10() {
        let w6 = word(6, |i| u8::from((6..105).contains(&i)));
        let w10 = word(10, |i| u8::from(i >= 86));
        let d = adkd4(&[w6, w10]).unwrap();
        assert_eq!(d.bits, 141);
        let ones: u32 = (0..141)
            .map(|i| read_bits(&d.bytes, i, 1).unwrap() as u32)
            .sum();
        assert_eq!(ones, 141);
        assert!(adkd4(&[w6]).is_none());
        assert_eq!(dummy(4).unwrap().bits, 141);
        assert!(dummy(7).is_none());
    }
}
