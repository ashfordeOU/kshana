// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo I/NAV (E1-B and E5b-I) word types 1 to 5 and the nominal page that carries them,
//! as the Galileo OS SIS ICD (Open Service Signal-in-Space Interface Control Document,
//! issue 2.x) section 4.3 lays them out.
//!
//! * A word is 128 bits: the 6-bit word type then the fields of [`WT1`] to [`WT5`]
//!   (ephemeris 1/4 to 4/4 with the clock, SISA and SVID; ionosphere, broadcast group delays,
//!   signal health, data validity and GST).
//! * A nominal page is two 120-bit page parts. The even part: even/odd flag `0`, page type
//!   `0`, the first 112 word bits, 6 tail bits. The odd part: flag `1`, page type `0`, the last
//!   16 word bits, the 40-bit reserved 1 field (OSNMA on E1-B), 22 search-and-rescue bits, 2
//!   spare bits, the CRC-24Q, the 8-bit reserved 2 field (SSP on E1-B) and 6 tail bits. The CRC
//!   covers bits 1 to 114 of the even part and bits 1 to 82 of the odd part (196 bits).
//! * Each page part is convolutionally encoded on its own (the 6 zero tail bits return the
//!   encoder to state zero) with `G1 = 171`, `G2 = 133` octal and `G2` inverted, block
//!   interleaved in 30 columns by 8 rows, and preceded by the 10-symbol synchronisation
//!   pattern `0101100000`: 250 symbols, one second at the E1-B rate of 250 symbol/s.
//!
//! The reserved, SAR and spare fields are inputs ([`OddPageExtras`]), zero by default. The
//! GST in word type 5 is an input; the ICD ties it to the page's transmission time, and the
//! caller chooses it. MODELLED (see [`super`]).

use super::fec::{bits_of, conv_encode, crc24q, deinterleave, interleave, viterbi};
use super::galileo::{GalEphemeris, GalIono, Gst};
use super::{get, int, p2, pack, pow2, push_bits, read_bits, sc, unpack, Decoded, Field};

/// Bits per word.
pub const WORD_BITS: usize = 128;
/// Bits per page part.
pub const PART_BITS: usize = 120;
/// Synchronisation pattern preceding each encoded page part.
pub const SYNC: &str = "0101100000";
/// Symbols per encoded page part (10 sync + 240).
pub const PART_SYMBOLS: usize = 250;
/// Interleaver columns.
pub const INTERLEAVER_COLS: usize = 30;
/// Interleaver rows.
pub const INTERLEAVER_ROWS: usize = 8;

/// Word type 1: ephemeris (1/4).
pub const WT1: &[Field] = &[
    int("type", 6),
    int("iodnav", 10),
    p2("toe", 14, false, 60.0),
    sc("m0", 32, true, pow2(-31)),
    p2("e", 32, false, pow2(-33)),
    p2("sqrt_a", 32, false, pow2(-19)),
    int("reserved", 2),
];

/// Word type 2: ephemeris (2/4).
pub const WT2: &[Field] = &[
    int("type", 6),
    int("iodnav", 10),
    sc("omega0", 32, true, pow2(-31)),
    sc("i0", 32, true, pow2(-31)),
    sc("omega", 32, true, pow2(-31)),
    sc("idot", 14, true, pow2(-43)),
    int("reserved", 2),
];

/// Word type 3: ephemeris (3/4) and SISA(E1,E5b).
pub const WT3: &[Field] = &[
    int("type", 6),
    int("iodnav", 10),
    sc("omega_dot", 24, true, pow2(-43)),
    sc("delta_n", 16, true, pow2(-43)),
    p2("cuc", 16, true, pow2(-29)),
    p2("cus", 16, true, pow2(-29)),
    p2("crc", 16, true, pow2(-5)),
    p2("crs", 16, true, pow2(-5)),
    int("sisa_e1e5b", 8),
];

/// Word type 4: SVID, ephemeris (4/4) and clock correction.
pub const WT4: &[Field] = &[
    int("type", 6),
    int("iodnav", 10),
    int("svid", 6),
    p2("cic", 16, true, pow2(-29)),
    p2("cis", 16, true, pow2(-29)),
    p2("toc", 14, false, 60.0),
    p2("af0", 31, true, pow2(-34)),
    p2("af1", 21, true, pow2(-46)),
    p2("af2", 6, true, pow2(-59)),
    int("spare", 2),
];

/// Word type 5: ionospheric correction, BGD, signal health, data validity and GST.
pub const WT5: &[Field] = &[
    int("type", 6),
    p2("ai0", 11, false, pow2(-2)),
    p2("ai1", 11, true, pow2(-8)),
    p2("ai2", 14, true, pow2(-15)),
    int("region1", 1),
    int("region2", 1),
    int("region3", 1),
    int("region4", 1),
    int("region5", 1),
    p2("bgd_e1e5a", 10, true, pow2(-32)),
    p2("bgd_e1e5b", 10, true, pow2(-32)),
    int("e5b_hs", 2),
    int("e1b_hs", 2),
    int("e5b_dvs", 1),
    int("e1b_dvs", 1),
    int("wn", 12),
    int("tow", 20),
    int("spare", 23),
];

/// The layout of word type `wt` (1 to 5).
pub fn layout(wt: u32) -> Option<&'static [Field]> {
    match wt {
        1 => Some(WT1),
        2 => Some(WT2),
        3 => Some(WT3),
        4 => Some(WT4),
        5 => Some(WT5),
        _ => None,
    }
}

fn b(x: bool) -> f64 {
    f64::from(u8::from(x))
}

/// The physical value of field `name` of word type `wt`.
pub fn word_value(
    wt: u32,
    e: &GalEphemeris,
    iono: &GalIono,
    gst: &Gst,
    name: &str,
) -> Result<f64, String> {
    Ok(match name {
        "type" => f64::from(wt),
        "iodnav" => f64::from(e.iodnav & 0x3FF),
        "toe" => e.toe_s,
        "m0" => e.m0,
        "e" => e.e,
        "sqrt_a" => e.sqrt_a,
        "omega0" => e.omega0,
        "i0" => e.i0,
        "omega" => e.omega,
        "idot" => e.idot,
        "omega_dot" => e.omega_dot,
        "delta_n" => e.delta_n,
        "cuc" => e.cuc,
        "cus" => e.cus,
        "crc" => e.crc,
        "crs" => e.crs,
        "sisa_e1e5b" => f64::from(e.sisa_e1e5b),
        "sisa_e1e5a" => f64::from(e.sisa_e1e5a),
        "svid" => f64::from(e.svid),
        "cic" => e.cic,
        "cis" => e.cis,
        "toc" => e.toc_s,
        "af0" => e.af0,
        "af1" => e.af1,
        "af2" => e.af2,
        "ai0" => iono.ai0,
        "ai1" => iono.ai1,
        "ai2" => iono.ai2,
        "region1" => b(iono.region[0]),
        "region2" => b(iono.region[1]),
        "region3" => b(iono.region[2]),
        "region4" => b(iono.region[3]),
        "region5" => b(iono.region[4]),
        "bgd_e1e5a" => e.bgd_e1e5a,
        "bgd_e1e5b" => e.bgd_e1e5b,
        "e1b_hs" => f64::from(e.hs_e1b_e5b_e5a[0]),
        "e5b_hs" => f64::from(e.hs_e1b_e5b_e5a[1]),
        "e5a_hs" => f64::from(e.hs_e1b_e5b_e5a[2]),
        "e1b_dvs" => b(e.dvs_e1b_e5b_e5a[0]),
        "e5b_dvs" => b(e.dvs_e1b_e5b_e5a[1]),
        "e5a_dvs" => b(e.dvs_e1b_e5b_e5a[2]),
        "wn" => f64::from(gst.wn % 4096),
        "tow" => f64::from(gst.tow),
        "reserved" | "spare" => 0.0,
        _ => return Err(format!("no Galileo field {name}")),
    })
}

/// The 128 bits of word type `wt` (1 to 5).
pub fn encode_word(
    wt: u32,
    e: &GalEphemeris,
    iono: &GalIono,
    gst: &Gst,
) -> Result<Vec<u8>, String> {
    let l = layout(wt).ok_or_else(|| format!("word type {wt} is not encoded here"))?;
    pack(l, |n| word_value(wt, e, iono, gst, n))
}

/// Decode a 128-bit word of type 1 to 5 (the type is read from its first 6 bits).
pub fn decode_word(word: &[u8]) -> Result<(u32, Vec<Decoded>), String> {
    if word.len() != WORD_BITS {
        return Err(format!("{} bits, expected {WORD_BITS}", word.len()));
    }
    let wt = read_bits(word, 0, 6) as u32;
    let l = layout(wt).ok_or_else(|| format!("word type {wt} is not decoded here"))?;
    Ok((wt, unpack(l, word)?))
}

/// The odd-page-part fields outside the word.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct OddPageExtras {
    /// Reserved 1, 40 bits (the OSNMA field on E1-B).
    pub reserved1: u64,
    /// Search-and-rescue return link data, 22 bits.
    pub sar: u32,
    /// Spare, 2 bits.
    pub spare: u32,
    /// Reserved 2, 8 bits (the secondary synchronisation pattern on E1-B).
    pub reserved2: u32,
}

/// The even and odd 120-bit page parts of a nominal page carrying `word`, CRC filled.
pub fn page_parts(word: &[u8], x: &OddPageExtras) -> Result<(Vec<u8>, Vec<u8>), String> {
    if word.len() != WORD_BITS {
        return Err(format!("{} bits, expected {WORD_BITS}", word.len()));
    }
    let mut even = vec![0u8, 0u8];
    even.extend_from_slice(&word[..112]);
    let mut odd = vec![1u8, 0u8];
    odd.extend_from_slice(&word[112..]);
    push_bits(&mut odd, x.reserved1 & ((1 << 40) - 1), 40);
    push_bits(&mut odd, u64::from(x.sar & 0x3F_FFFF), 22);
    push_bits(&mut odd, u64::from(x.spare & 3), 2);
    let covered: Vec<u8> = even.iter().chain(odd.iter()).copied().collect();
    push_bits(&mut odd, u64::from(crc24q(&covered)), 24);
    push_bits(&mut odd, u64::from(x.reserved2 & 0xFF), 8);
    push_bits(&mut even, 0, 6);
    push_bits(&mut odd, 0, 6);
    debug_assert_eq!((even.len(), odd.len()), (PART_BITS, PART_BITS));
    Ok((even, odd))
}

/// The word and odd-part extras of a nominal page, after checking the even/odd flags, the
/// nominal page type, the tail bits and the CRC.
pub fn read_page(even: &[u8], odd: &[u8]) -> Result<(Vec<u8>, OddPageExtras), String> {
    if even.len() != PART_BITS || odd.len() != PART_BITS {
        return Err("page parts must be 120 bits".into());
    }
    if even[0] != 0 || odd[0] != 1 {
        return Err("even/odd flags are not 0 then 1".into());
    }
    if even[1] != 0 || odd[1] != 0 {
        return Err("not a nominal page (page type 1 is an alert page)".into());
    }
    if even[114..].iter().chain(&odd[114..]).any(|&t| t != 0) {
        return Err("tail bits are not zero".into());
    }
    let covered: Vec<u8> = even[..114].iter().chain(&odd[..82]).copied().collect();
    if crc24q(&covered) != read_bits(odd, 82, 24) as u32 {
        return Err("CRC-24Q mismatch".into());
    }
    let mut word = even[2..114].to_vec();
    word.extend_from_slice(&odd[2..18]);
    let x = OddPageExtras {
        reserved1: read_bits(odd, 18, 40),
        sar: read_bits(odd, 58, 22) as u32,
        spare: read_bits(odd, 80, 2) as u32,
        reserved2: read_bits(odd, 106, 8) as u32,
    };
    Ok((word, x))
}

/// The 250 transmitted symbols of a 120-bit page part: sync, then the encoded and
/// interleaved part.
pub fn encode_part_symbols(part: &[u8]) -> Result<Vec<u8>, String> {
    if part.len() != PART_BITS {
        return Err(format!("{} bits, expected {PART_BITS}", part.len()));
    }
    let mut state = 0u8;
    let coded = conv_encode(part, &mut state, true);
    let mut out = bits_of(SYNC);
    out.extend(interleave(&coded, INTERLEAVER_COLS, INTERLEAVER_ROWS));
    Ok(out)
}

/// Undo [`encode_part_symbols`] (hard decisions): check the sync pattern, deinterleave and
/// Viterbi-decode to the 120 page-part bits. Returns the bits and the number of symbol
/// errors the decoder's path implies.
pub fn decode_part_symbols(symbols: &[u8]) -> Result<(Vec<u8>, u32), String> {
    if symbols.len() != PART_SYMBOLS {
        return Err(format!(
            "{} symbols, expected {PART_SYMBOLS}",
            symbols.len()
        ));
    }
    if symbols[..10] != bits_of(SYNC)[..] {
        return Err("synchronisation pattern not found".into());
    }
    let d = deinterleave(&symbols[10..], INTERLEAVER_COLS, INTERLEAVER_ROWS);
    Ok(viterbi(&d, 0, Some(0), true))
}

/// The symbols of a whole nominal page (even part then odd part, 500 symbols, two seconds
/// on E1-B) carrying word type `wt`.
pub fn encode_page_symbols(
    wt: u32,
    e: &GalEphemeris,
    iono: &GalIono,
    gst: &Gst,
    x: &OddPageExtras,
) -> Result<Vec<u8>, String> {
    let (even, odd) = page_parts(&encode_word(wt, e, iono, gst)?, x)?;
    let mut s = encode_part_symbols(&even)?;
    s.extend(encode_part_symbols(&odd)?);
    Ok(s)
}

/// The ephemeris carried by decoded word types 1 to 5 (each needed once; IOD_nav must agree
/// across types 1 to 4). Fields no I/NAV word carries (SISA(E1,E5a), E5a health) are zero.
pub fn ephemeris_from_words(
    words: &[(u32, Vec<Decoded>)],
) -> Result<(GalEphemeris, GalIono, Gst), String> {
    let w = |t: u32| {
        words
            .iter()
            .find(|(k, _)| *k == t)
            .map(|(_, d)| d.as_slice())
            .ok_or_else(|| format!("word type {t} missing"))
    };
    let v = |t: u32, n: &str| -> Result<f64, String> { Ok(get(w(t)?, n)?.value) };
    let iod = v(1, "iodnav")?;
    for t in 2..=4 {
        if v(t, "iodnav")? != iod {
            return Err(format!("IOD_nav of word type {t} differs from word type 1"));
        }
    }
    let e = GalEphemeris {
        svid: v(4, "svid")? as u32,
        iodnav: iod as u32,
        toe_s: v(1, "toe")?,
        toc_s: v(4, "toc")?,
        m0: v(1, "m0")?,
        e: v(1, "e")?,
        sqrt_a: v(1, "sqrt_a")?,
        omega0: v(2, "omega0")?,
        i0: v(2, "i0")?,
        omega: v(2, "omega")?,
        idot: v(2, "idot")?,
        omega_dot: v(3, "omega_dot")?,
        delta_n: v(3, "delta_n")?,
        cuc: v(3, "cuc")?,
        cus: v(3, "cus")?,
        crc: v(3, "crc")?,
        crs: v(3, "crs")?,
        cic: v(4, "cic")?,
        cis: v(4, "cis")?,
        af0: v(4, "af0")?,
        af1: v(4, "af1")?,
        af2: v(4, "af2")?,
        sisa_e1e5b: v(3, "sisa_e1e5b")? as u32,
        sisa_e1e5a: 0,
        bgd_e1e5a: v(5, "bgd_e1e5a")?,
        bgd_e1e5b: v(5, "bgd_e1e5b")?,
        hs_e1b_e5b_e5a: [v(5, "e1b_hs")? as u32, v(5, "e5b_hs")? as u32, 0],
        dvs_e1b_e5b_e5a: [v(5, "e1b_dvs")? == 1.0, v(5, "e5b_dvs")? == 1.0, false],
    };
    let iono = GalIono {
        ai0: v(5, "ai0")?,
        ai1: v(5, "ai1")?,
        ai2: v(5, "ai2")?,
        region: [
            v(5, "region1")? == 1.0,
            v(5, "region2")? == 1.0,
            v(5, "region3")? == 1.0,
            v(5, "region4")? == 1.0,
            v(5, "region5")? == 1.0,
        ],
    };
    let gst = Gst {
        wn: v(5, "wn")? as u32,
        tow: v(5, "tow")? as u32,
    };
    Ok((e, iono, gst))
}

#[cfg(test)]
mod tests {
    use super::super::layout_bits;
    use super::*;

    #[test]
    fn every_word_is_128_bits() {
        for wt in 1..=5 {
            assert_eq!(layout_bits(layout(wt).unwrap()), 128, "word type {wt}");
        }
    }
}
