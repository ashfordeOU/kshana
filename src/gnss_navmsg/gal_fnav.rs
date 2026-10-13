// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo F/NAV (E5a-I) page types 1 to 4, as the Galileo OS SIS ICD (issue 2.x) section 4.2
//! lays them out.
//!
//! * A page carries 214 bits: the 6-bit page type then the 208 navigation-data bits of
//!   [`PT1`] to [`PT4`] (clock, SISA(E1,E5a), ionosphere, BGD(E1,E5a), health and GST;
//!   ephemeris 1/3 to 3/3 with GST; the GST-UTC and GST-GPS conversion parameters).
//! * The CRC-24Q over those 214 bits and 6 zero tail bits follow: 244 bits.
//! * The 244 bits are convolutionally encoded (`G1 = 171`, `G2 = 133` octal, `G2` inverted)
//!   from state zero, block interleaved in 61 columns by 8 rows, and preceded by the
//!   12-symbol synchronisation pattern `101101110000`: 500 symbols, 10 s at 50 symbol/s.
//!
//! The GST written into a page is an input. MODELLED (see [`super`]).

use super::fec::{bits_of, conv_encode, crc24q, deinterleave, interleave, viterbi};
use super::galileo::{GalEphemeris, GalIono, GalTimeConversion, Gst};
use super::{get, int, p2, pack, pow2, push_bits, read_bits, sc, unpack, Decoded, Field};

/// Data bits per page (page type and navigation data, before the CRC).
pub const DATA_BITS: usize = 214;
/// Bits per page including CRC and tail.
pub const PAGE_BITS: usize = 244;
/// Synchronisation pattern.
pub const SYNC: &str = "101101110000";
/// Symbols per encoded page (12 sync + 488).
pub const PAGE_SYMBOLS: usize = 500;
/// Interleaver columns.
pub const INTERLEAVER_COLS: usize = 61;
/// Interleaver rows.
pub const INTERLEAVER_ROWS: usize = 8;

/// Page type 1: SVID, clock correction, SISA, ionosphere, BGD, GST, health, data validity.
pub const PT1: &[Field] = &[
    int("page_type", 6),
    int("svid", 6),
    int("iodnav", 10),
    p2("toc", 14, false, 60.0),
    p2("af0", 31, true, pow2(-34)),
    p2("af1", 21, true, pow2(-46)),
    p2("af2", 6, true, pow2(-59)),
    int("sisa_e1e5a", 8),
    p2("ai0", 11, false, pow2(-2)),
    p2("ai1", 11, true, pow2(-8)),
    p2("ai2", 14, true, pow2(-15)),
    int("region1", 1),
    int("region2", 1),
    int("region3", 1),
    int("region4", 1),
    int("region5", 1),
    p2("bgd_e1e5a", 10, true, pow2(-32)),
    int("e5a_hs", 2),
    int("wn", 12),
    int("tow", 20),
    int("e5a_dvs", 1),
    int("spare", 26),
];

/// Page type 2: ephemeris (1/3) and GST.
pub const PT2: &[Field] = &[
    int("page_type", 6),
    int("iodnav", 10),
    sc("m0", 32, true, pow2(-31)),
    sc("omega_dot", 24, true, pow2(-43)),
    p2("e", 32, false, pow2(-33)),
    p2("sqrt_a", 32, false, pow2(-19)),
    sc("omega0", 32, true, pow2(-31)),
    sc("idot", 14, true, pow2(-43)),
    int("wn", 12),
    int("tow", 20),
];

/// Page type 3: ephemeris (2/3) and GST.
pub const PT3: &[Field] = &[
    int("page_type", 6),
    int("iodnav", 10),
    sc("i0", 32, true, pow2(-31)),
    sc("omega", 32, true, pow2(-31)),
    sc("delta_n", 16, true, pow2(-43)),
    p2("cuc", 16, true, pow2(-29)),
    p2("cus", 16, true, pow2(-29)),
    p2("crc", 16, true, pow2(-5)),
    p2("crs", 16, true, pow2(-5)),
    p2("toe", 14, false, 60.0),
    int("wn", 12),
    int("tow", 20),
    int("spare", 8),
];

/// Page type 4: ephemeris (3/3), GST-UTC and GST-GPS conversion, TOW.
pub const PT4: &[Field] = &[
    int("page_type", 6),
    int("iodnav", 10),
    p2("cic", 16, true, pow2(-29)),
    p2("cis", 16, true, pow2(-29)),
    p2("a0", 32, true, pow2(-30)),
    p2("a1", 24, true, pow2(-50)),
    p2("dt_ls", 8, true, 1.0),
    p2("t0t", 8, false, 3600.0),
    int("wn0t", 8),
    int("wn_lsf", 8),
    int("dn", 3),
    p2("dt_lsf", 8, true, 1.0),
    p2("t0g", 8, false, 3600.0),
    p2("a0g", 16, true, pow2(-35)),
    p2("a1g", 12, true, pow2(-51)),
    int("wn0g", 6),
    int("tow", 20),
    int("spare", 5),
];

/// The layout of page type `pt` (1 to 4).
pub fn layout(pt: u32) -> Option<&'static [Field]> {
    match pt {
        1 => Some(PT1),
        2 => Some(PT2),
        3 => Some(PT3),
        4 => Some(PT4),
        _ => None,
    }
}

/// The physical value of field `name` of page type `pt`.
pub fn page_value(
    pt: u32,
    e: &GalEphemeris,
    iono: &GalIono,
    gst: &Gst,
    t: &GalTimeConversion,
    name: &str,
) -> Result<f64, String> {
    Ok(match name {
        "page_type" => f64::from(pt),
        "a0" => t.a0,
        "a1" => t.a1,
        "dt_ls" => f64::from(t.dt_ls),
        "t0t" => t.t0t,
        "wn0t" => f64::from(t.wn0t & 0xFF),
        "wn_lsf" => f64::from(t.wn_lsf & 0xFF),
        "dn" => f64::from(t.dn),
        "dt_lsf" => f64::from(t.dt_lsf),
        "t0g" => t.t0g,
        "a0g" => t.a0g,
        "a1g" => t.a1g,
        "wn0g" => f64::from(t.wn0g & 0x3F),
        other => super::gal_inav::word_value(pt, e, iono, gst, other)?,
    })
}

/// The 214 data bits of page type `pt` (1 to 4).
pub fn encode_data(
    pt: u32,
    e: &GalEphemeris,
    iono: &GalIono,
    gst: &Gst,
    t: &GalTimeConversion,
) -> Result<Vec<u8>, String> {
    let l = layout(pt).ok_or_else(|| format!("page type {pt} is not encoded here"))?;
    pack(l, |n| page_value(pt, e, iono, gst, t, n))
}

/// The 244-bit page: data, CRC-24Q, tail.
pub fn page(data: &[u8]) -> Result<Vec<u8>, String> {
    if data.len() != DATA_BITS {
        return Err(format!("{} bits, expected {DATA_BITS}", data.len()));
    }
    let mut p = data.to_vec();
    push_bits(&mut p, u64::from(crc24q(data)), 24);
    push_bits(&mut p, 0, 6);
    Ok(p)
}

/// The 214 data bits of a 244-bit page after checking the CRC and tail.
pub fn read_page(p: &[u8]) -> Result<Vec<u8>, String> {
    if p.len() != PAGE_BITS {
        return Err(format!("{} bits, expected {PAGE_BITS}", p.len()));
    }
    if p[238..].iter().any(|&t| t != 0) {
        return Err("tail bits are not zero".into());
    }
    if crc24q(&p[..DATA_BITS]) != read_bits(p, DATA_BITS, 24) as u32 {
        return Err("CRC-24Q mismatch".into());
    }
    Ok(p[..DATA_BITS].to_vec())
}

/// Decode 214 data bits of page type 1 to 4.
pub fn decode_data(data: &[u8]) -> Result<(u32, Vec<Decoded>), String> {
    if data.len() != DATA_BITS {
        return Err(format!("{} bits, expected {DATA_BITS}", data.len()));
    }
    let pt = read_bits(data, 0, 6) as u32;
    let l = layout(pt).ok_or_else(|| format!("page type {pt} is not decoded here"))?;
    Ok((pt, unpack(l, data)?))
}

/// The 500 transmitted symbols of a 244-bit page.
pub fn encode_page_symbols(p: &[u8]) -> Result<Vec<u8>, String> {
    if p.len() != PAGE_BITS {
        return Err(format!("{} bits, expected {PAGE_BITS}", p.len()));
    }
    let mut state = 0u8;
    let coded = conv_encode(p, &mut state, true);
    let mut out = bits_of(SYNC);
    out.extend(interleave(&coded, INTERLEAVER_COLS, INTERLEAVER_ROWS));
    Ok(out)
}

/// Undo [`encode_page_symbols`] (hard decisions): the 244 page bits and the symbol errors
/// the decoder's path implies.
pub fn decode_page_symbols(symbols: &[u8]) -> Result<(Vec<u8>, u32), String> {
    if symbols.len() != PAGE_SYMBOLS {
        return Err(format!(
            "{} symbols, expected {PAGE_SYMBOLS}",
            symbols.len()
        ));
    }
    if symbols[..12] != bits_of(SYNC)[..] {
        return Err("synchronisation pattern not found".into());
    }
    let d = deinterleave(&symbols[12..], INTERLEAVER_COLS, INTERLEAVER_ROWS);
    Ok(viterbi(&d, 0, Some(0), true))
}

/// The ephemeris, clock and ionosphere carried by decoded page types 1 to 3 (IOD_nav must
/// agree; `C_ic`, `C_is` from page type 4). Fields F/NAV does not carry (SISA(E1,E5b),
/// BGD(E1,E5b), E1-B and E5b health) are zero.
pub fn ephemeris_from_pages(
    pages: &[(u32, Vec<Decoded>)],
) -> Result<(GalEphemeris, GalIono), String> {
    let w = |t: u32| {
        pages
            .iter()
            .find(|(k, _)| *k == t)
            .map(|(_, d)| d.as_slice())
            .ok_or_else(|| format!("page type {t} missing"))
    };
    let v = |t: u32, n: &str| -> Result<f64, String> { Ok(get(w(t)?, n)?.value) };
    let iod = v(1, "iodnav")?;
    for t in 2..=4 {
        if v(t, "iodnav")? != iod {
            return Err(format!("IOD_nav of page type {t} differs from page type 1"));
        }
    }
    let e = GalEphemeris {
        svid: v(1, "svid")? as u32,
        iodnav: iod as u32,
        toe_s: v(3, "toe")?,
        toc_s: v(1, "toc")?,
        m0: v(2, "m0")?,
        e: v(2, "e")?,
        sqrt_a: v(2, "sqrt_a")?,
        omega0: v(2, "omega0")?,
        i0: v(3, "i0")?,
        omega: v(3, "omega")?,
        idot: v(2, "idot")?,
        omega_dot: v(2, "omega_dot")?,
        delta_n: v(3, "delta_n")?,
        cuc: v(3, "cuc")?,
        cus: v(3, "cus")?,
        crc: v(3, "crc")?,
        crs: v(3, "crs")?,
        cic: v(4, "cic")?,
        cis: v(4, "cis")?,
        af0: v(1, "af0")?,
        af1: v(1, "af1")?,
        af2: v(1, "af2")?,
        sisa_e1e5b: 0,
        sisa_e1e5a: v(1, "sisa_e1e5a")? as u32,
        bgd_e1e5a: v(1, "bgd_e1e5a")?,
        bgd_e1e5b: 0.0,
        hs_e1b_e5b_e5a: [0, 0, v(1, "e5a_hs")? as u32],
        dvs_e1b_e5b_e5a: [false, false, v(1, "e5a_dvs")? == 1.0],
    };
    let iono = GalIono {
        ai0: v(1, "ai0")?,
        ai1: v(1, "ai1")?,
        ai2: v(1, "ai2")?,
        region: [
            v(1, "region1")? == 1.0,
            v(1, "region2")? == 1.0,
            v(1, "region3")? == 1.0,
            v(1, "region4")? == 1.0,
            v(1, "region5")? == 1.0,
        ],
    };
    Ok((e, iono))
}

#[cfg(test)]
mod tests {
    use super::super::layout_bits;
    use super::*;

    #[test]
    fn every_page_is_214_bits() {
        for pt in 1..=4 {
            assert_eq!(layout_bits(layout(pt).unwrap()) as usize, DATA_BITS, "{pt}");
        }
    }
}
