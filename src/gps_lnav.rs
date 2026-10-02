// SPDX-License-Identifier: AGPL-3.0-only
//! GPS legacy navigation message (LNAV) encoder: subframes 1 to 3 of the L1 C/A
//! (coarse/acquisition) signal, as IS-GPS-200 (Interface Specification, GPS 200) section
//! 20.3 lays them out.
//!
//! A subframe is ten 30-bit words: 24 data bits and 6 parity bits each, sent most
//! significant bit first at 50 bit/s. Word 1 is the telemetry (TLM) word that opens with the
//! preamble `10001011`; word 2 is the hand-over word (HOW) carrying the 17-bit time-of-week
//! (TOW) count of the next subframe's start and the subframe identifier. Subframe 1 carries
//! the week number, health, issue of data clock (IODC) and clock polynomial; subframes 2 and 3
//! carry the Keplerian ephemeris. Each parameter is quantised to an integer of a fixed width
//! and scale factor (IS-GPS-200 Tables 20-I and 20-III); angles are in semicircles, converted
//! with the value of pi the specification fixes, `3.1415926535898`.
//!
//! The parity of IS-GPS-200 Table 20-XIV is a (32, 26) Hamming code over the 24 data bits
//! and the last two transmitted bits of the previous word (`D29*`, `D30*`); when `D30*` is one
//! the 24 data bits are sent inverted. Words 2 and 10 end in two non-information bits chosen
//! so that the word's own last two parity bits are zero, which is what lets every subframe
//! start with a known `D29* = D30* = 0`.
//!
//! What the specification leaves to the operator, and this encoder takes as explicit input
//! ([`LnavConventions`]): the 14-bit TLM message, the integrity-status flag, the alert and
//! anti-spoof flags, the user range accuracy (URA) index, the L2 P-code data flag, the fit
//! interval flag, the age of data offset (AODO) and the content of reserved bits (zero here).
//!
//! Quantisation rounds to the nearest integer (half away from zero). A broadcast parameter
//! decoded from the message and re-encoded is an integer times its scale, so rounding returns
//! the broadcast integer even when the decimal text it passed through carried a last-digit
//! error; truncation would not.

use crate::portable_math::powi;

/// The value of pi IS-GPS-200 specifies for semicircle conversions. Deliberately not
/// `std::f64::consts::PI`: the specification fixes these fourteen digits.
#[allow(clippy::approx_constant)]
pub const GPS_PI: f64 = 3.141_592_653_589_8;

/// The TLM preamble `10001011`.
pub const PREAMBLE: u32 = 0x8B;

/// The ephemeris and clock parameters subframes 1 to 3 carry, in SI units (angles in
/// radians, rates in radians per second) as a RINEX (Receiver Independent Exchange Format)
/// navigation record gives them.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LnavEphemeris {
    /// GPS week number (continuous; transmitted modulo 1024).
    pub week: u32,
    /// Clock reference time of week `t_oc` (s).
    pub toc_s: f64,
    /// Ephemeris reference time of week `t_oe` (s).
    pub toe_s: f64,
    /// Issue of data, clock.
    pub iodc: u32,
    /// Issue of data, ephemeris.
    pub iode: u32,
    /// Clock bias `a_f0` (s).
    pub af0: f64,
    /// Clock drift `a_f1` (s/s).
    pub af1: f64,
    /// Clock drift rate `a_f2` (s/s²).
    pub af2: f64,
    /// Group delay differential `T_GD` (s).
    pub tgd: f64,
    /// Orbit radius sine correction `C_rs` (m).
    pub crs: f64,
    /// Mean motion difference `Δn` (rad/s).
    pub delta_n: f64,
    /// Mean anomaly at reference time `M_0` (rad).
    pub m0: f64,
    /// Argument of latitude cosine correction `C_uc` (rad).
    pub cuc: f64,
    /// Eccentricity.
    pub e: f64,
    /// Argument of latitude sine correction `C_us` (rad).
    pub cus: f64,
    /// Square root of the semi-major axis (√m).
    pub sqrt_a: f64,
    /// Inclination cosine correction `C_ic` (rad).
    pub cic: f64,
    /// Longitude of the ascending node at the weekly epoch `Ω_0` (rad).
    pub omega0: f64,
    /// Inclination sine correction `C_is` (rad).
    pub cis: f64,
    /// Inclination at reference time `i_0` (rad).
    pub i0: f64,
    /// Orbit radius cosine correction `C_rc` (m).
    pub crc: f64,
    /// Argument of perigee `ω` (rad).
    pub omega: f64,
    /// Rate of right ascension `Ω̇` (rad/s).
    pub omega_dot: f64,
    /// Rate of inclination `IDOT` (rad/s).
    pub idot: f64,
    /// Six-bit satellite health.
    pub health: u32,
    /// Two-bit "codes on L2" field.
    pub code_on_l2: u32,
}

/// The fields IS-GPS-200 leaves to the operator (see the module documentation).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct LnavConventions {
    /// 14-bit TLM message.
    pub tlm_message: u32,
    /// Integrity status flag (TLM bit 23).
    pub integrity: bool,
    /// Alert flag (HOW bit 18).
    pub alert: bool,
    /// Anti-spoof flag (HOW bit 19).
    pub anti_spoof: bool,
    /// Four-bit URA index.
    pub ura_index: u32,
    /// L2 P-code data flag (subframe 1, word 4, bit 1).
    pub l2p_flag: bool,
    /// Fit interval flag (subframe 2, word 10, bit 17).
    pub fit_flag: bool,
    /// Five-bit age of data offset.
    pub aodo: u32,
}

/// One named LNAV field: its subframe (1 to 3), and its pieces as `(word, first data bit,
/// length)` with words and bits numbered from 1 as in IS-GPS-200, most significant piece
/// first.
#[derive(Clone, Copy, Debug)]
pub struct FieldSpec {
    /// Field name.
    pub name: &'static str,
    /// Subframe (1 to 3).
    pub subframe: usize,
    /// Pieces `(word, first bit, length)`, most significant first.
    pub pieces: &'static [(usize, u32, u32)],
    /// Whether the value is an operator convention rather than a computed parameter.
    pub convention: bool,
}

const fn f(
    name: &'static str,
    subframe: usize,
    pieces: &'static [(usize, u32, u32)],
    convention: bool,
) -> FieldSpec {
    FieldSpec {
        name,
        subframe,
        pieces,
        convention,
    }
}

/// Every field of subframes 1 to 3 except the reserved bits and the parity-solving bits.
pub const FIELDS: &[FieldSpec] = &[
    f("sf1.preamble", 1, &[(1, 1, 8)], false),
    f("sf1.tlm_message", 1, &[(1, 9, 14)], true),
    f("sf1.integrity", 1, &[(1, 23, 1)], true),
    f("sf1.tow", 1, &[(2, 1, 17)], false),
    f("sf1.alert", 1, &[(2, 18, 1)], true),
    f("sf1.anti_spoof", 1, &[(2, 19, 1)], true),
    f("sf1.subframe_id", 1, &[(2, 20, 3)], false),
    f("week", 1, &[(3, 1, 10)], false),
    f("code_on_l2", 1, &[(3, 11, 2)], false),
    f("ura_index", 1, &[(3, 13, 4)], true),
    f("health", 1, &[(3, 17, 6)], false),
    f("iodc", 1, &[(3, 23, 2), (8, 1, 8)], false),
    f("l2p_flag", 1, &[(4, 1, 1)], true),
    f("tgd", 1, &[(7, 17, 8)], false),
    f("toc", 1, &[(8, 9, 16)], false),
    f("af2", 1, &[(9, 1, 8)], false),
    f("af1", 1, &[(9, 9, 16)], false),
    f("af0", 1, &[(10, 1, 22)], false),
    f("sf2.preamble", 2, &[(1, 1, 8)], false),
    f("sf2.tlm_message", 2, &[(1, 9, 14)], true),
    f("sf2.integrity", 2, &[(1, 23, 1)], true),
    f("sf2.tow", 2, &[(2, 1, 17)], false),
    f("sf2.alert", 2, &[(2, 18, 1)], true),
    f("sf2.anti_spoof", 2, &[(2, 19, 1)], true),
    f("sf2.subframe_id", 2, &[(2, 20, 3)], false),
    f("sf2.iode", 2, &[(3, 1, 8)], false),
    f("crs", 2, &[(3, 9, 16)], false),
    f("delta_n", 2, &[(4, 1, 16)], false),
    f("m0", 2, &[(4, 17, 8), (5, 1, 24)], false),
    f("cuc", 2, &[(6, 1, 16)], false),
    f("e", 2, &[(6, 17, 8), (7, 1, 24)], false),
    f("cus", 2, &[(8, 1, 16)], false),
    f("sqrt_a", 2, &[(8, 17, 8), (9, 1, 24)], false),
    f("toe", 2, &[(10, 1, 16)], false),
    f("fit_flag", 2, &[(10, 17, 1)], true),
    f("aodo", 2, &[(10, 18, 5)], true),
    f("sf3.preamble", 3, &[(1, 1, 8)], false),
    f("sf3.tlm_message", 3, &[(1, 9, 14)], true),
    f("sf3.integrity", 3, &[(1, 23, 1)], true),
    f("sf3.tow", 3, &[(2, 1, 17)], false),
    f("sf3.alert", 3, &[(2, 18, 1)], true),
    f("sf3.anti_spoof", 3, &[(2, 19, 1)], true),
    f("sf3.subframe_id", 3, &[(2, 20, 3)], false),
    f("cic", 3, &[(3, 1, 16)], false),
    f("omega0", 3, &[(3, 17, 8), (4, 1, 24)], false),
    f("cis", 3, &[(5, 1, 16)], false),
    f("i0", 3, &[(5, 17, 8), (6, 1, 24)], false),
    f("crc", 3, &[(7, 1, 16)], false),
    f("omega", 3, &[(7, 17, 8), (8, 1, 24)], false),
    f("omega_dot", 3, &[(9, 1, 24)], false),
    f("sf3.iode", 3, &[(10, 1, 8)], false),
    f("idot", 3, &[(10, 9, 14)], false),
];

/// Quantise `value` to an integer of `bits` bits at scale `2^scale_pow2`, rounding to
/// nearest, as two's complement when `signed`. Returns the raw field bits, or an error when
/// the value does not fit.
pub fn quantise(value: f64, scale_pow2: i32, bits: u32, signed: bool) -> Result<u64, String> {
    let q = (value * powi(2.0, -scale_pow2)).round();
    let (lo, hi) = if signed {
        (
            -(2f64.powi(bits as i32 - 1)),
            2f64.powi(bits as i32 - 1) - 1.0,
        )
    } else {
        (0.0, 2f64.powi(bits as i32) - 1.0)
    };
    if !(q >= lo && q <= hi) {
        return Err(format!(
            "{value:e} at scale 2^{scale_pow2} does not fit {bits} {} bits",
            if signed { "signed" } else { "unsigned" }
        ));
    }
    let mask = (1u64 << bits) - 1;
    Ok((q as i64 as u64) & mask)
}

/// The raw bits of every field of [`FIELDS`] for `eph` and `conv`, with subframe 1's HOW
/// carrying `tow_count` and the next two `tow_count + 1`, `tow_count + 2`.
pub fn field_values(
    eph: &LnavEphemeris,
    conv: &LnavConventions,
    tow_count: u32,
) -> Result<Vec<(&'static str, u64)>, String> {
    let sc = |x: f64| x / GPS_PI;
    let mut v: Vec<(&'static str, u64)> = Vec::new();
    for sf in 1..=3u32 {
        let p = |s: &str| -> &'static str {
            FIELDS
                .iter()
                .find(|f| f.name == format!("sf{sf}.{s}"))
                .map(|f| f.name)
                .expect("field")
        };
        v.push((p("preamble"), PREAMBLE as u64));
        v.push((p("tlm_message"), (conv.tlm_message & 0x3FFF) as u64));
        v.push((p("integrity"), conv.integrity as u64));
        v.push((p("tow"), ((tow_count + sf - 1) & 0x1FFFF) as u64));
        v.push((p("alert"), conv.alert as u64));
        v.push((p("anti_spoof"), conv.anti_spoof as u64));
        v.push((p("subframe_id"), sf as u64));
    }
    v.push(("week", (eph.week % 1024) as u64));
    v.push(("code_on_l2", (eph.code_on_l2 & 3) as u64));
    v.push(("ura_index", (conv.ura_index & 0xF) as u64));
    v.push(("health", (eph.health & 0x3F) as u64));
    v.push(("iodc", (eph.iodc & 0x3FF) as u64));
    v.push(("l2p_flag", conv.l2p_flag as u64));
    v.push(("tgd", quantise(eph.tgd, -31, 8, true)?));
    v.push(("toc", quantise(eph.toc_s, 4, 16, false)?));
    v.push(("af2", quantise(eph.af2, -55, 8, true)?));
    v.push(("af1", quantise(eph.af1, -43, 16, true)?));
    v.push(("af0", quantise(eph.af0, -31, 22, true)?));
    v.push(("sf2.iode", (eph.iode & 0xFF) as u64));
    v.push(("crs", quantise(eph.crs, -5, 16, true)?));
    v.push(("delta_n", quantise(sc(eph.delta_n), -43, 16, true)?));
    v.push(("m0", quantise(sc(eph.m0), -31, 32, true)?));
    v.push(("cuc", quantise(eph.cuc, -29, 16, true)?));
    v.push(("e", quantise(eph.e, -33, 32, false)?));
    v.push(("cus", quantise(eph.cus, -29, 16, true)?));
    v.push(("sqrt_a", quantise(eph.sqrt_a, -19, 32, false)?));
    v.push(("toe", quantise(eph.toe_s, 4, 16, false)?));
    v.push(("fit_flag", conv.fit_flag as u64));
    v.push(("aodo", (conv.aodo & 0x1F) as u64));
    v.push(("cic", quantise(eph.cic, -29, 16, true)?));
    v.push(("omega0", quantise(sc(eph.omega0), -31, 32, true)?));
    v.push(("cis", quantise(eph.cis, -29, 16, true)?));
    v.push(("i0", quantise(sc(eph.i0), -31, 32, true)?));
    v.push(("crc", quantise(eph.crc, -5, 16, true)?));
    v.push(("omega", quantise(sc(eph.omega), -31, 32, true)?));
    v.push(("omega_dot", quantise(sc(eph.omega_dot), -43, 24, true)?));
    v.push(("sf3.iode", (eph.iode & 0xFF) as u64));
    v.push(("idot", quantise(sc(eph.idot), -43, 14, true)?));
    Ok(v)
}

/// The 24-bit data words (word index 0 is word 1) of subframes 1 to 3, reserved bits zero
/// and the parity-solving bits of words 2 and 10 zero.
pub fn data_words(
    eph: &LnavEphemeris,
    conv: &LnavConventions,
    tow_count: u32,
) -> Result<[[u32; 10]; 3], String> {
    let values = field_values(eph, conv, tow_count)?;
    let mut w = [[0u32; 10]; 3];
    for spec in FIELDS {
        let (_, raw) = values
            .iter()
            .find(|(n, _)| *n == spec.name)
            .ok_or_else(|| format!("no value for {}", spec.name))?;
        let total: u32 = spec.pieces.iter().map(|p| p.2).sum();
        let mut remaining = total;
        for &(word, first, len) in spec.pieces {
            remaining -= len;
            let piece = ((raw >> remaining) & ((1u64 << len) - 1)) as u32;
            // Data bit `first` is the word's most significant of 24.
            let shift = 24 - (first - 1) - len;
            w[spec.subframe - 1][word - 1] |= piece << shift;
        }
    }
    Ok(w)
}

/// The data-bit sets of IS-GPS-200 Table 20-XIV, one per parity bit `D25 .. D30`, with
/// whether it starts from `D29*` (false) or `D30*` (true).
const PARITY: [(bool, &[u32]); 6] = [
    (false, &[1, 2, 3, 5, 6, 10, 11, 12, 13, 14, 17, 18, 20, 23]),
    (true, &[2, 3, 4, 6, 7, 11, 12, 13, 14, 15, 18, 19, 21, 24]),
    (false, &[1, 3, 4, 5, 7, 8, 12, 13, 14, 15, 16, 19, 20, 22]),
    (true, &[2, 4, 5, 6, 8, 9, 13, 14, 15, 16, 17, 20, 21, 23]),
    (
        true,
        &[1, 3, 5, 6, 7, 9, 10, 14, 15, 16, 17, 18, 21, 22, 24],
    ),
    (false, &[3, 5, 6, 8, 9, 10, 11, 13, 15, 19, 22, 23, 24]),
];

/// The six parity bits `D25 .. D30` (most significant first) of the 24 source data bits
/// `d` (bit 1 the most significant) given the previous word's `D29*` and `D30*`.
pub fn parity(d: u32, d29s: bool, d30s: bool) -> u32 {
    let bit = |i: u32| (d >> (24 - i)) & 1;
    let mut out = 0u32;
    for (start30, set) in PARITY {
        let mut p = if start30 { d30s as u32 } else { d29s as u32 };
        for &i in set {
            p ^= bit(i);
        }
        out = (out << 1) | p;
    }
    out
}

/// The transmitted 30-bit word for source data `d` after a previous transmitted word
/// `prev` (only its last two bits matter): the data bits are inverted when `D30*` is one.
pub fn encode_word(d: u32, prev: u32) -> u32 {
    let d29s = (prev >> 1) & 1 == 1;
    let d30s = prev & 1 == 1;
    let data = if d30s { !d & 0xFF_FFFF } else { d & 0xFF_FFFF };
    (data << 6) | parity(d & 0xFF_FFFF, d29s, d30s)
}

/// Encode one subframe of ten source data words after the previous transmitted word
/// `prev`. In words 2 and 10 the last two data bits are chosen so that `D29 = D30 = 0`.
pub fn encode_subframe(data: &[u32; 10], prev: u32) -> [u32; 10] {
    let mut out = [0u32; 10];
    let mut last = prev;
    for (k, &d) in data.iter().enumerate() {
        let mut word = encode_word(d, last);
        if k == 1 || k == 9 {
            for t in 0..4u32 {
                let candidate = encode_word((d & !3) | t, last);
                if candidate & 3 == 0 {
                    word = candidate;
                    break;
                }
            }
        }
        out[k] = word;
        last = word;
    }
    out
}

/// Subframes 1 to 3 as transmitted 30-bit words, subframe 1 following the previous
/// transmitted word `prev` and carrying HOW time-of-week count `tow_count`.
pub fn encode_subframes(
    eph: &LnavEphemeris,
    conv: &LnavConventions,
    tow_count: u32,
    prev: u32,
) -> Result<[[u32; 10]; 3], String> {
    let data = data_words(eph, conv, tow_count)?;
    let mut out = [[0u32; 10]; 3];
    let mut last = prev;
    for (sf, d) in data.iter().enumerate() {
        out[sf] = encode_subframe(d, last);
        last = out[sf][9];
    }
    Ok(out)
}

/// The source 24 data bits of a transmitted word, given the previous transmitted word.
pub fn source_data(word: u32, prev: u32) -> u32 {
    let data = (word >> 6) & 0xFF_FFFF;
    if prev & 1 == 1 {
        !data & 0xFF_FFFF
    } else {
        data
    }
}

/// Read every field of [`FIELDS`] out of transmitted subframes 1 to 3 (`prev` is the word
/// sent before subframe 1).
pub fn decode_fields(words: &[[u32; 10]; 3], prev: u32) -> Vec<(&'static str, u64)> {
    let mut src = [[0u32; 10]; 3];
    let mut last = prev;
    for sf in 0..3 {
        for k in 0..10 {
            src[sf][k] = source_data(words[sf][k], last);
            last = words[sf][k];
        }
    }
    FIELDS
        .iter()
        .map(|spec| {
            let mut v = 0u64;
            for &(word, first, len) in spec.pieces {
                let shift = 24 - (first - 1) - len;
                let piece = (src[spec.subframe - 1][word - 1] >> shift) & ((1 << len) - 1);
                v = (v << len) | piece as u64;
            }
            (spec.name, v)
        })
        .collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    fn eph() -> LnavEphemeris {
        LnavEphemeris {
            week: 2190,
            toc_s: 518_400.0,
            toe_s: 518_400.0,
            iodc: 0x15A,
            iode: 0x5A,
            af0: 3.0e-4,
            af1: -2.5e-12,
            af2: 0.0,
            tgd: -1.1e-8,
            crs: -55.3,
            delta_n: 4.5e-9,
            m0: 1.234,
            cuc: -2.9e-6,
            e: 0.0123,
            cus: 7.1e-6,
            sqrt_a: 5153.7,
            cic: 1.2e-7,
            omega0: -2.1,
            cis: -3.0e-8,
            i0: 0.96,
            crc: 230.5,
            omega: -0.77,
            omega_dot: -8.1e-9,
            idot: 2.0e-10,
            health: 0,
            code_on_l2: 1,
        }
    }

    #[test]
    fn parity_of_the_all_zero_word_is_zero_and_detects_any_single_bit_error() {
        assert_eq!(parity(0, false, false), 0);
        let d = 0x8B_1234;
        let p = parity(d, false, false);
        for bit in 0..24 {
            assert_ne!(parity(d ^ (1 << bit), false, false), p, "bit {bit}");
        }
    }

    #[test]
    fn words_two_and_ten_end_in_zero_parity_bits() {
        let w = encode_subframes(&eph(), &LnavConventions::default(), 86_401, 0).unwrap();
        for sf in &w {
            assert_eq!(sf[1] & 3, 0);
            assert_eq!(sf[9] & 3, 0);
            assert_eq!(sf[0] >> 22, 0x8B, "preamble sent upright after D30* = 0");
        }
    }

    #[test]
    fn decoded_fields_round_trip_and_values_reconstruct() {
        let e = eph();
        let conv = LnavConventions {
            ura_index: 2,
            fit_flag: true,
            ..Default::default()
        };
        let w = encode_subframes(&e, &conv, 100_799, 0).unwrap();
        let dec = decode_fields(&w, 0);
        let want = field_values(&e, &conv, 100_799).unwrap();
        for (name, v) in &want {
            let got = dec.iter().find(|(n, _)| n == name).unwrap().1;
            assert_eq!(got, *v, "{name}");
        }
        // M0 back to radians within half a quantum.
        let m0 = dec.iter().find(|(n, _)| *n == "m0").unwrap().1 as u32 as i32 as f64;
        assert!((m0 * 2f64.powi(-31) * GPS_PI - e.m0).abs() <= 0.5 * 2f64.powi(-31) * GPS_PI);
        let sqrt_a = dec.iter().find(|(n, _)| *n == "sqrt_a").unwrap().1 as f64;
        assert!((sqrt_a * 2f64.powi(-19) - e.sqrt_a).abs() <= 2f64.powi(-20));
    }

    #[test]
    fn inverted_words_follow_a_one_in_d30() {
        let d = 0x12_3456;
        let w0 = encode_word(d, 0);
        let w1 = encode_word(d, 1);
        assert_eq!((w0 >> 6) ^ (w1 >> 6), 0xFF_FFFF);
        assert_eq!(source_data(w1, 1), d);
    }

    #[test]
    fn quantise_rounds_to_nearest_and_refuses_overflow() {
        assert_eq!(
            quantise(3.0 * 2f64.powi(-5) - 1e-12, -5, 16, true).unwrap(),
            3
        );
        assert_eq!(quantise(-(2f64.powi(-5)), -5, 16, true).unwrap(), 0xFFFF);
        assert!(quantise(4.0, -5, 8, true).is_err());
        assert_eq!(quantise(127.0 / 32.0, -5, 8, true).unwrap(), 127);
        assert!(quantise(-1.0, 0, 8, false).is_err());
    }
}
