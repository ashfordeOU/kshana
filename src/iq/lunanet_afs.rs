// SPDX-License-Identifier: AGPL-3.0-only
//! **LunaNet Augmented Forward Signal: message format and the `lunanet-afs-check` checks.**
//!
//! Pinned to LNIS Version 5, Applicable Document 1 Volume A, **LSIS-AFS V1.0, 29 January
//! 2025** ([`crate::iq::signals::lunanet::SPEC`]); a later edition is a different pin. This
//! module holds what section 2.4 of that document specifies for a frame:
//!
//! ```text
//! frame = SP (68 symbols, uncoded) + SB1 (52 symbols, BCH(51,8)) + 5880 interleaved symbols
//!         (SB2 2400 + SB3 1740 + SB4 1740, each rate-1/2 LDPC coded)   = 6000 symbols = 12 s
//! ```
//!
//! at 500 symbol/s. It implements the synchronisation pattern, the SB1 BCH code and its
//! decoder (section 2.4.2.1), CRC-24Q (Appendix H) and the block interleaver (section
//! 2.4.3.1.5), and checks a symbol stream for frame synchronisation, SB1 decoding and TOI
//! continuity.
//!
//! **Not implemented: the rate-1/2 LDPC coding of subframes 2 to 4.** Its check matrices are in
//! Annex 1, a separate file that is not part of the PDF and is not vendored. Subframes 2 to 4
//! are carried and checked as opaque symbol blocks of the specified length; the report says so,
//! and a stream that passes is not shown to carry valid LDPC codewords or valid CRC-24Q words.
//! Message content (MSG-G1, MSG-G2, MSG-G4 and the rest) is out of scope: the document leaves
//! several of those definitions to be written.
//!
//! What is checked, and against what, is in `xval/lunanet-afs/PREREGISTRATION.md` (bars B1 to
//! B10). This is an analysis tool: it reads symbols and writes a report; nothing here
//! transmits or schedules a signal.

use super::signals::lunanet as codes;
use super::signals::lunanet_oracle as printed;
use serde_json::{json, Value};

/// Symbols in the synchronisation pattern (Table 12).
pub const SP_SYMBOLS: usize = 68;
/// Symbols in subframe 1 after BCH encoding (section 2.4.2.1).
pub const SB1_SYMBOLS: usize = 52;
/// Symbols of subframes 2, 3 and 4 after LDPC encoding (Table 16).
pub const SB2_SYMBOLS: usize = 2400;
/// See [`SB2_SYMBOLS`].
pub const SB3_SYMBOLS: usize = 1740;
/// See [`SB2_SYMBOLS`].
pub const SB4_SYMBOLS: usize = 1740;
/// Interleaved symbols per frame (Table 17).
pub const INTERLEAVED_SYMBOLS: usize = SB2_SYMBOLS + SB3_SYMBOLS + SB4_SYMBOLS;
/// Symbols per frame.
pub const FRAME_SYMBOLS: usize = SP_SYMBOLS + SB1_SYMBOLS + INTERLEAVED_SYMBOLS;
/// Interleaver rows and columns (section 2.4.3.1.5).
pub const INTERLEAVER_ROWS: usize = 60;
/// See [`INTERLEAVER_ROWS`].
pub const INTERLEAVER_COLS: usize = 98;
/// TOI values per block interval (LSIS-720).
pub const TOI_VALUES: u16 = 100;

/// The synchronisation pattern as printed in Table 12 (hexadecimal, 68 symbols).
pub const SYNC_HEX: &str = "CC63F74536F49E04A";

/// The synchronisation pattern as 68 symbols, first symbol first.
pub fn sync_pattern() -> Vec<u8> {
    SYNC_HEX
        .chars()
        .flat_map(|c| {
            let v = c.to_digit(16).unwrap_or(0);
            (0..4).rev().map(move |k| ((v >> k) & 1) as u8)
        })
        .collect()
}

/// BCH(51,8) feedback: generator polynomial 763 octal = `1 + X + X^4 + X^5 + X^6 + X^7 + X^8`
/// (Figure 7). Stage numbers `1..=8`; stage 1 is fed with the exclusive-or of the tapped stages.
const SB1_TAPS: [usize; 6] = [1, 4, 5, 6, 7, 8];

/// The 52-symbol SB1 field for the nine-bit `field` (`FID` in the two MSBs, `TOI` in the seven
/// LSBs; section 2.4.2.2). The eight LSBs are loaded as the register's initial state, bit 1 in
/// stage 8 and bit 8 in stage 1, and the register is shifted 51 times; the MSB (bit 0) is added
/// modulo 2 to the 51 symbols and prepended (section 2.4.2.1).
pub fn sb1_encode(field: u16) -> [u8; SB1_SYMBOLS] {
    let field = field & 0x1FF;
    let msb = ((field >> 8) & 1) as u8;
    // stages[k - 1] is stage k; bit j (1..=8, MSB-first within the eight LSBs) goes to stage 9 - j.
    let mut stages = [0u8; 8];
    for j in 1..=8usize {
        stages[8 - j] = ((field >> (8 - j)) & 1) as u8;
    }
    let mut out = [0u8; SB1_SYMBOLS];
    out[0] = msb;
    for k in 0..51 {
        out[1 + k] = stages[7] ^ msb;
        let fb = SB1_TAPS.iter().fold(0u8, |a, &t| a ^ stages[t - 1]);
        stages.copy_within(0..7, 1);
        stages[0] = fb;
    }
    out
}

/// The result of decoding SB1.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Sb1 {
    /// The nine-bit field: FID (2 bits) and TOI (7 bits).
    pub field: u16,
    /// Frame ID (the two MSBs).
    pub fid: u8,
    /// Time of interval (the seven LSBs).
    pub toi: u8,
    /// `|correlation| / sum of magnitudes` of the best hypothesis, 1.0 for a noise-free word.
    pub metric: f64,
}

/// Decode SB1 from 52 soft values (positive for a transmitted 0, as the document's sign/magnitude
/// convention has it) by correlating with the 256 code words of MSB 0 (section 2.4.2.1): the
/// eight LSBs are those of the hypothesis with the largest `|correlation|`, and the MSB is 0 when
/// that correlation is positive and 1 otherwise.
pub fn sb1_decode(soft: &[f64; SB1_SYMBOLS]) -> Sb1 {
    let total: f64 = soft.iter().map(|x| x.abs()).sum();
    let (mut best, mut best_corr) = (0u16, 0.0f64);
    for h in 0u16..256 {
        let cw = sb1_encode(h);
        let corr: f64 = soft
            .iter()
            .zip(cw.iter())
            .map(|(&s, &c)| if c == 0 { s } else { -s })
            .sum();
        if corr.abs() > best_corr.abs() {
            best_corr = corr;
            best = h;
        }
    }
    let msb = u16::from(best_corr < 0.0);
    let field = (msb << 8) | best;
    Sb1 {
        field,
        fid: (field >> 7) as u8,
        toi: (field & 0x7F) as u8,
        metric: if total > 0.0 { best_corr.abs() / total } else { 0.0 },
    }
}

/// CRC-24Q of Appendix H over `bits` (MSB first), seed 0: the remainder of `m(X) X^24` divided
/// by `g(X) = (1 + X) P(X)`, generator word `0x864CFB`.
pub fn crc24q_bits(bits: &[u8]) -> u32 {
    const POLY: u32 = 0x864CFB;
    let mut crc = 0u32;
    for &b in bits {
        let top = ((crc >> 23) & 1) as u8 ^ (b & 1);
        crc = (crc << 1) & 0xFF_FFFF;
        if top == 1 {
            crc ^= POLY & 0xFF_FFFF;
        }
    }
    crc
}

/// CRC-24Q over bytes (each byte MSB first).
pub fn crc24q_bytes(bytes: &[u8]) -> u32 {
    let bits: Vec<u8> = bytes
        .iter()
        .flat_map(|b| (0..8).rev().map(move |k| (b >> k) & 1))
        .collect();
    crc24q_bits(&bits)
}

/// Block-interleave the 5880 coded symbols of SB2, SB3 and SB4: written row by row into a
/// 60-row, 98-column array, read column by column (section 2.4.3.1.5).
pub fn interleave(symbols: &[u8]) -> Vec<u8> {
    assert_eq!(symbols.len(), INTERLEAVED_SYMBOLS, "the interleaver holds 5880 symbols");
    let mut out = Vec::with_capacity(symbols.len());
    for c in 0..INTERLEAVER_COLS {
        for r in 0..INTERLEAVER_ROWS {
            out.push(symbols[r * INTERLEAVER_COLS + c]);
        }
    }
    out
}

/// The inverse of [`interleave`].
pub fn deinterleave(symbols: &[u8]) -> Vec<u8> {
    assert_eq!(symbols.len(), INTERLEAVED_SYMBOLS, "the interleaver holds 5880 symbols");
    let mut out = vec![0u8; symbols.len()];
    let mut k = 0;
    for c in 0..INTERLEAVER_COLS {
        for r in 0..INTERLEAVER_ROWS {
            out[r * INTERLEAVER_COLS + c] = symbols[k];
            k += 1;
        }
    }
    out
}

/// Assemble one frame of 6000 symbols: SP, SB1 (`fid`, `toi`) and the interleaved `coded`
/// symbols of subframes 2 to 4 (5880 symbols as given, already LDPC coded by the caller).
pub fn assemble_frame(fid: u8, toi: u8, coded: &[u8]) -> Vec<u8> {
    let mut f = sync_pattern();
    let field = (u16::from(fid & 3) << 7) | u16::from(toi & 0x7F);
    f.extend_from_slice(&sb1_encode(field));
    f.extend(interleave(coded));
    f
}

/// A symbol stream of `frames` frames with TOI counting from `toi0` modulo 100, FID 0 and
/// **placeholder** subframes 2 to 4: the alternating `0 1 0 1 ...` fill of LSIS-300, which is
/// not LDPC coded and carries no message. The frame structure (SP, SB1, lengths, TOI sequence)
/// is the document's; the subframes are not valid, and [`check_symbols`] says so.
pub fn generate_symbols(frames: usize, toi0: u8) -> Vec<u8> {
    let filler: Vec<u8> = (0..INTERLEAVED_SYMBOLS).map(|i| (i % 2) as u8).collect();
    let mut out = Vec::with_capacity(frames * FRAME_SYMBOLS);
    for n in 0..frames {
        let toi = ((u16::from(toi0) + n as u16) % TOI_VALUES) as u8;
        out.extend(assemble_frame(0, toi, &filler));
    }
    out
}

/// One frame found in a stream.
#[derive(Clone, Debug, PartialEq)]
pub struct FrameFinding {
    /// Symbol offset of the first symbol of the synchronisation pattern.
    pub offset: usize,
    /// Symbols of the pattern that differ from Table 12.
    pub sp_errors: usize,
    /// Decoded frame ID.
    pub fid: u8,
    /// Decoded time of interval.
    pub toi: u8,
    /// Symbols of SB1 that differ from the re-encoded decoded field.
    pub sb1_symbol_errors: usize,
    /// The decoder's correlation metric (1.0 noise-free).
    pub sb1_metric: f64,
    /// Problems with this frame, in words.
    pub problems: Vec<String>,
}

/// What [`check_symbols`] found.
#[derive(Clone, Debug)]
pub struct SymbolReport {
    /// Symbols read.
    pub symbols: usize,
    /// Frames found, in order of offset.
    pub frames: Vec<FrameFinding>,
    /// Problems with the stream as a whole.
    pub problems: Vec<String>,
}

/// Check a hard-decision symbol stream (each element 0 or 1) against section 2.4: find every
/// synchronisation pattern (up to `max_sp_errors` symbols wrong), decode SB1 of each, and check
/// that frames sit 6000 symbols apart, that FID is 0 (the only defined value; 1 to 3 are
/// reserved) and that TOI advances by one modulo 100 from frame to frame. Subframes 2 to 4 are
/// not checked (see the module notes).
pub fn check_symbols(symbols: &[u8], max_sp_errors: usize) -> SymbolReport {
    let sp = sync_pattern();
    let mut frames: Vec<FrameFinding> = Vec::new();
    let mut problems = Vec::new();
    if symbols.iter().any(|&s| s > 1) {
        problems.push("the stream holds a value other than 0 or 1".to_string());
        return SymbolReport { symbols: symbols.len(), frames, problems };
    }
    let mut i = 0;
    while i + SP_SYMBOLS + SB1_SYMBOLS <= symbols.len() {
        let errs = symbols[i..i + SP_SYMBOLS]
            .iter()
            .zip(&sp)
            .filter(|(a, b)| a != b)
            .count();
        if errs <= max_sp_errors {
            let mut soft = [0.0f64; SB1_SYMBOLS];
            for (k, s) in soft.iter_mut().enumerate() {
                *s = if symbols[i + SP_SYMBOLS + k] == 0 { 1.0 } else { -1.0 };
            }
            let d = sb1_decode(&soft);
            let re = sb1_encode(d.field);
            let sb1_err = (0..SB1_SYMBOLS)
                .filter(|&k| re[k] != symbols[i + SP_SYMBOLS + k])
                .count();
            let mut f = FrameFinding {
                offset: i,
                sp_errors: errs,
                fid: d.fid,
                toi: d.toi,
                sb1_symbol_errors: sb1_err,
                sb1_metric: d.metric,
                problems: Vec::new(),
            };
            if d.fid != 0 {
                f.problems.push(format!(
                    "FID {} is reserved for future use (only FID 0 is defined)",
                    d.fid
                ));
            }
            if u16::from(d.toi) >= TOI_VALUES {
                f.problems.push(format!("TOI {} is outside 0..=99", d.toi));
            }
            if sb1_err > 0 {
                f.problems.push(format!("{sb1_err} SB1 symbol(s) disagree with the decoded field"));
            }
            if i + FRAME_SYMBOLS > symbols.len() {
                f.problems.push("the stream ends before the frame does".to_string());
            }
            frames.push(f);
            i += FRAME_SYMBOLS.min(symbols.len() - i).max(1);
        } else {
            i += 1;
        }
    }
    for w in frames.windows(2) {
        let gap = w[1].offset - w[0].offset;
        if gap != FRAME_SYMBOLS {
            problems.push(format!(
                "frames at {} and {} are {gap} symbols apart, not {FRAME_SYMBOLS}",
                w[0].offset, w[1].offset
            ));
        }
        let want = (u16::from(w[0].toi) + 1) % TOI_VALUES;
        if u16::from(w[1].toi) != want && u16::from(w[0].toi) < TOI_VALUES {
            problems.push(format!(
                "TOI {} follows TOI {}, expected {want}",
                w[1].toi, w[0].toi
            ));
        }
    }
    if frames.is_empty() {
        problems.push("no synchronisation pattern found".to_string());
    }
    SymbolReport { symbols: symbols.len(), frames, problems }
}

impl SymbolReport {
    /// The report as JSON, with the pin and what was and was not checked.
    pub fn to_json(&self) -> Value {
        json!({
            "schema": "kshana.lunanet-afs-check/symbols/1",
            "specification": codes::SPEC,
            "symbols": self.symbols,
            "frames_found": self.frames.len(),
            "frames": self.frames.iter().map(|f| json!({
                "offset": f.offset, "sp_errors": f.sp_errors, "fid": f.fid, "toi": f.toi,
                "sb1_symbol_errors": f.sb1_symbol_errors, "sb1_metric": f.sb1_metric,
                "problems": f.problems,
            })).collect::<Vec<_>>(),
            "problems": self.problems,
            "ok": self.problems.is_empty() && self.frames.iter().all(|f| f.problems.is_empty()),
            "checked": "synchronisation pattern, SB1 (BCH(51,8)) decoding, FID, TOI continuity, frame spacing",
            "not_checked": "subframes 2 to 4: the rate-1/2 LDPC coding and the CRC-24Q words are not \
                verified because the LDPC check matrices (LSIS-AFS Annex 1) are a separate file that is \
                not part of this implementation; message content is out of scope",
            "status": "MODELLED for the message layer except the SB1 worked example (see `spec`)",
            "advisory": ADVISORY,
        })
    }
}

/// The advisory statement every report carries.
pub const ADVISORY: &str = "Advisory: analysis output from a research and engineering tool, \
    not type-approved navigation equipment and not a safety-of-life service. It checks a symbol \
    stream against one edition of a published specification and says nothing about any LunaNet \
    node or service.";

/// Parse a symbol stream written as text: `0` and `1` characters, any other character (spaces,
/// line breaks) ignored.
pub fn parse_symbol_text(text: &str) -> Result<Vec<u8>, String> {
    let mut out = Vec::with_capacity(text.len());
    for c in text.chars() {
        match c {
            '0' => out.push(0),
            '1' => out.push(1),
            c if c.is_whitespace() => {}
            c => return Err(format!("unexpected character {c:?} in a symbol stream (only 0, 1 and white space)")),
        }
    }
    Ok(out)
}

fn pack(bits: &[u8]) -> u32 {
    bits.iter().fold(0u32, |a, &b| (a << 1) | u32::from(b))
}

fn hex_bits(hex: &str) -> Vec<u8> {
    hex.chars()
        .flat_map(|c| {
            let v = c.to_digit(16).unwrap_or(0);
            (0..4).rev().map(move |k| ((v >> k) & 1) as u8)
        })
        .collect()
}

fn table_check(
    name: &str,
    table: &[(u32, u32); 210],
    code: impl Fn(u16) -> Vec<u8>,
) -> (usize, Vec<String>) {
    let mut miss = Vec::new();
    for prn in 1..=codes::MAX_PRN {
        let c = code(prn);
        let (first, last) = table[usize::from(prn) - 1];
        if pack(&c[..24]) != first {
            miss.push(format!("{name} PRN {prn}: first 24 chips differ"));
        }
        if pack(&c[c.len() - 24..]) != last {
            miss.push(format!("{name} PRN {prn}: last 24 chips differ"));
        }
    }
    (420, miss)
}

fn bar(id: &str, claim: &str, matched: usize, total: usize, note: &str) -> Value {
    json!({
        "bar": id, "claim": claim, "matched": matched, "total": total,
        "status": if matched == total { "MET" } else { "NOT MET" },
        "note": note,
    })
}

/// Check this implementation against the published tables and worked examples of the cited
/// edition: bars B1 to B10 of `xval/lunanet-afs/PREREGISTRATION.md`. The report lists every bar
/// with its count and status; a miss is reported, never hidden. In particular B4 reports 419 of
/// 420: the document prints the same last 24 chips (`A14850`) for tertiary PRN 147 and 151, and
/// the generator reproduces PRN 151's, so the PRN 147 entry is most likely a misprint.
pub fn check_spec() -> Value {
    let mut bars = Vec::new();
    // B1
    let (total, miss) = table_check("AFS-I", &printed::AFS_I_PRINTED, |p| {
        codes::afs_i_bits(p).unwrap_or_default()
    });
    bars.push(bar(
        "B1",
        "AFS-I Gold codes: first and last 24 chips of all 210 PRNs equal the printed hex",
        total - miss.len(),
        total,
        &miss.join("; "),
    ));
    // B2
    let l = codes::legendre_bits(10_223);
    let p = hex_bits(printed::LEGENDRE_10223_HEX);
    let m2 = usize::from(p.len() == 10_224 && p[1..] == l[..]);
    bars.push(bar("B2", "Legendre(10223) equals Table D-1", m2, 1, ""));
    // B3
    let (total, miss) = table_check("AFS-Q", &printed::AFS_Q_PRINTED, |p| {
        codes::afs_q_primary_bits(p).unwrap_or_default()
    });
    bars.push(bar(
        "B3",
        "AFS-Q primary Weil codes: first and last 24 chips of all 210 PRNs equal the printed hex",
        total - miss.len(),
        total,
        &miss.join("; "),
    ));
    // B4
    let hex = printed::LEGENDRE_1499_HEX;
    let mut p1499 = hex_bits(&hex[..1])[1..].to_vec();
    p1499.extend(hex_bits(&hex[1..]));
    let leg_ok = p1499 == codes::legendre_bits(1499);
    let (total, miss) = table_check("tertiary", &printed::AFS_Q_TERTIARY_PRINTED, |p| {
        codes::afs_q_tertiary_bits(p).unwrap_or_default()
    });
    bars.push(bar(
        "B4",
        "Legendre(1499) equals Table E-1 and the tertiary codes' first and last 24 chips equal the printed hex for all 210 PRNs",
        total - miss.len() + usize::from(leg_ok),
        total + 1,
        &if miss.is_empty() {
            String::new()
        } else {
            format!(
                "{} (the document prints A14850 for both PRN 147 and PRN 151; the generator reproduces PRN 151's, so the PRN 147 entry is most likely a misprint in the document)",
                miss.join("; ")
            )
        },
    ));
    // B5
    let s5 = codes::SECONDARY
        == [[1, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1], [1, 1, 0, 1]];
    bars.push(bar("B5", "secondary codes S0..S3 equal Table 10", usize::from(s5), 1, ""));
    // B6: the worked example of Figure 8.
    let enc = sb1_encode(0x045);
    let mut word = 0u64;
    for &b in &enc {
        word = (word << 1) | u64::from(b);
    }
    let mut soft = [0.0f64; SB1_SYMBOLS];
    for (k, s) in soft.iter_mut().enumerate() {
        *s = if enc[k] == 0 { 1.0 } else { -1.0 };
    }
    let d = sb1_decode(&soft);
    let ok6 = word == 0x229F_61DB_B84A0 && d.fid == 0 && d.toi == 69;
    bars.push(bar(
        "B6",
        "SB1 worked example (Figure 8): 0x045 encodes to 0x229F61DBB84A0 and decodes to FID 0, TOI 69",
        usize::from(ok6),
        1,
        &format!("encoded 0x{word:013X}, decoded FID {} TOI {}", d.fid, d.toi),
    ));
    // B7
    let crc = crc24q_bytes(b"123456789");
    bars.push(bar(
        "B7",
        "CRC-24Q of ASCII 123456789 equals the catalogue check value 0xCDE703",
        usize::from(crc == 0xCD_E703),
        1,
        &format!("computed 0x{crc:06X}"),
    ));
    // B8
    let b8 = FRAME_SYMBOLS == 6000
        && (SP_SYMBOLS + SB1_SYMBOLS + INTERLEAVED_SYMBOLS) as f64 / codes::SYMBOL_RATE == 12.0
        && INTERLEAVER_ROWS * INTERLEAVER_COLS == 5880
        && codes::AFS_Q_TERTIARY_LEN == 1500;
    bars.push(bar("B8", "frame arithmetic: 6000 symbols = 12 s at 500 symbol/s; 60 x 98 = 5880; tertiary 1500", usize::from(b8), 1, ""));
    // B9
    let probe: Vec<u8> = (0..INTERLEAVED_SYMBOLS).map(|i| ((i * 7 + i / 13) % 2) as u8).collect();
    let b9 = deinterleave(&interleave(&probe)) == probe && interleave(&probe) != probe;
    bars.push(bar("B9", "de-interleaving an interleaved block returns it unchanged", usize::from(b9), 1, "a property of the construction (MODELLED)"));
    // B10
    let b10 = sync_pattern().len() == 68;
    bars.push(bar("B10", "synchronisation pattern is 68 symbols from the printed hex", usize::from(b10), 1, ""));
    let all_met = bars.iter().all(|b| b["status"] == "MET");
    json!({
        "schema": "kshana.lunanet-afs-check/spec/1",
        "specification": codes::SPEC,
        "pin": "LNIS V5, AD1 Volume A (LSIS-AFS) V1.0, 29 January 2025; the document marks its code tables {LSIS-TBC}",
        "bars": bars,
        "all_met": all_met,
        "status": {
            "B1-B4": "VALIDATED against the printed tables of the cited edition (which the document marks TBC); B4 has one pinned miss",
            "B5,B8,B10": "the document's own constants (transcription check)",
            "B6": "one worked example (n = 1); other properties MODELLED",
            "B7": "CRC catalogue check value, an oracle outside the specification",
            "B9": "MODELLED",
            "LDPC": "not implemented: Annex 1 matrices are not in the PDF",
        },
        "advisory": ADVISORY,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sb1_round_trips_every_field_and_corrects_flipped_symbols() {
        for field in 0u16..512 {
            let enc = sb1_encode(field);
            let mut soft = [0.0f64; SB1_SYMBOLS];
            for (k, s) in soft.iter_mut().enumerate() {
                *s = if enc[k] == 0 { 1.0 } else { -1.0 };
            }
            assert_eq!(sb1_decode(&soft).field, field);
            // Three flipped symbols are corrected by the 256-hypothesis correlator.
            for k in [3usize, 17, 40] {
                soft[k] = -soft[k];
            }
            assert_eq!(sb1_decode(&soft).field, field, "field {field:03X}");
        }
    }

    #[test]
    fn generated_streams_pass_and_damage_is_found() {
        let s = generate_symbols(3, 98);
        let r = check_symbols(&s, 0);
        assert_eq!(r.frames.len(), 3);
        assert_eq!(r.frames.iter().map(|f| f.toi).collect::<Vec<_>>(), vec![98, 99, 0]);
        assert!(r.problems.is_empty() && r.frames.iter().all(|f| f.problems.is_empty()));
        // A frame lost from the middle breaks the spacing and the TOI sequence.
        let mut cut = s[..FRAME_SYMBOLS].to_vec();
        cut.extend_from_slice(&s[2 * FRAME_SYMBOLS..]);
        let r = check_symbols(&cut, 0);
        assert!(r.problems.iter().any(|p| p.contains("expected 99")), "{:?}", r.problems);
        let skipped = [generate_symbols(1, 5), generate_symbols(1, 7)].concat();
        let r = check_symbols(&skipped, 0);
        assert!(r.problems.iter().any(|p| p.contains("expected 6")), "{:?}", r.problems);
        assert!(check_symbols(&[0, 1, 2], 0).problems[0].contains("other than 0 or 1"));
        assert!(check_symbols(&vec![0u8; 300], 0).problems[0].contains("no synchronisation"));
    }
}
