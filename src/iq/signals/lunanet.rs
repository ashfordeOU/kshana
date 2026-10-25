// SPDX-License-Identifier: AGPL-3.0-only
//! **LunaNet Augmented Forward Signal (AFS) spreading codes**, pinned to the LunaNet
//! Interoperability Specification (LNIS) Version 5, Applicable Document 1 Volume A: the
//! LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal, **LSIS-AFS V1.0,
//! 29 January 2025** ([`SPEC`]). A later edition is a different pin.
//!
//! | Component | Code | Length | Chip rate |
//! |---|---|---|---|
//! | AFS-I (data) | Gold, 2047 short-cycled to 2046; G2 delayed by a per-PRN number of chips | 2046 | 1.023 Mchip/s (BPSK(1)) |
//! | AFS-Q (pilot) | Weil 10230 (as GPS L1C) tiered with a 4-chip secondary and a 1500-chip tertiary code | 10230 x 4 x 1500 (the receiver replica [`afs_q`] omits the 12 s tertiary code: 10230 x 4) | 5.115 Mchip/s (BPSK(5)) |
//!
//! The carrier is 2492.028 MHz (LSIS-020). Both components are linearly multiplexed (LSIS-125).
//! The data symbol rate is 500 symbol/s, one symbol per AFS-I code period of 2 ms; the pilot
//! carries no data. The code tables are the document's PRN 1..=210, which it marks {LSIS-TBC}
//! and says exist "to facilitate test and integration efforts only".
//!
//! ## What is checked, and against what
//!
//! Bars B1 to B5 of `xval/lunanet-afs/PREREGISTRATION.md`, run by `tests/lunanet_afs_codes.rs`:
//! the first and last 24 chips of every code, and both Legendre sequences, against the columns
//! the document prints (never given to the generator). A match is VALIDATED against that
//! edition's tables, which the document itself marks {LSIS-TBC}.
//!
//! The AFS-Q tiered code is `primary xor secondary xor tertiary` with one secondary chip per
//! primary period and one tertiary chip per secondary period (section 2.3.5.2); it is held as
//! an overlay of 4 x 1500 = 6000 primary periods, 12 s, the data frame length. The document
//! says the start of the tertiary code is synchronised with the start of the data frame
//! (LSIS-220).

use super::beidou::legendre;
use super::gps::l1c_ranging_bits;
use super::lunanet_tables::{AFS_I_G2_DELAY, AFS_I_G2_INIT, AFS_Q_PRIMARY, AFS_Q_TERTIARY_K};
use super::{bipolar, Modulation, SignalCode, SignalError};
use crate::iq::DataModulation;

/// The specification the codes follow, named in every report.
pub const SPEC: &str = "LunaNet Interoperability Specification (LNIS) V5, Applicable Document 1 \
    Volume A: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal \
    (LSIS-AFS) V1.0, 29 January 2025";

/// AFS carrier frequency (LSIS-020), Hz.
pub const AFS_HZ: f64 = 2_492_028_000.0;
/// AFS-I chip rate (Table 7), chip/s.
pub const AFS_I_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// AFS-Q chip rate (Table 7), chip/s.
pub const AFS_Q_CHIP_RATE_HZ: f64 = 5_115_000.0;
/// AFS-I primary code length (Table 9), chips.
pub const AFS_I_CODE_LEN: usize = 2046;
/// AFS-Q primary code length (Table 9), chips.
pub const AFS_Q_CODE_LEN: usize = 10_230;
/// AFS-Q tertiary code length (Table 9), chips.
pub const AFS_Q_TERTIARY_LEN: usize = 1500;
/// Highest PRN the document tabulates.
pub const MAX_PRN: u16 = 210;
/// Data symbol rate (Table 7), symbol/s.
pub const SYMBOL_RATE: f64 = 500.0;

/// The four secondary codes S0..S3 (Table 10), logic bits.
pub const SECONDARY: [[u8; 4]; 4] = [[1, 1, 1, 0], [0, 1, 1, 1], [1, 0, 1, 1], [1, 1, 0, 1]];

/// Length of the G1 and G2 registers' natural sequence (11 stages).
const GOLD_PERIOD: usize = 2047;

/// One 11-stage register `[stage1 .. stage11]` as in Figure C-1: output at stage 11, stage 1
/// fed with the exclusive-or of the tapped stages.
type Reg11 = [u8; 11];

fn shift11(r: &mut Reg11, taps: &[usize]) {
    let fb = taps.iter().fold(0u8, |acc, &t| acc ^ r[t - 1]);
    r.copy_within(0..10, 1);
    r[0] = fb;
}

/// g1(x) = x^11 + x^2 + 1 (Figure C-1): feedback from stages 2 and 11.
const G1_TAPS: [usize; 2] = [2, 11];
/// g2(x) = x^11 + x^8 + x^5 + x^2 + 1: feedback from stages 2, 5, 8 and 11.
const G2_TAPS: [usize; 4] = [2, 5, 8, 11];

/// One full natural period (2047 chips) of a register started from `init` (stage 1 first).
fn period(init: Reg11, taps: &[usize]) -> Vec<u8> {
    let mut r = init;
    let mut out = Vec::with_capacity(GOLD_PERIOD);
    for _ in 0..GOLD_PERIOD {
        out.push(r[10]);
        shift11(&mut r, taps);
    }
    out
}

/// The G2 register state word (I11 the most significant bit) after advancing the all-ones
/// state by `advance` chips.
pub fn g2_state_after(advance: usize) -> u16 {
    let mut r = [1u8; 11];
    for _ in 0..advance {
        shift11(&mut r, &G2_TAPS);
    }
    // r[0] is stage 1 (I1, the least significant bit); r[10] is stage 11 (I11, the MSB).
    r.iter()
        .enumerate()
        .fold(0u16, |acc, (k, &b)| acc | (u16::from(b) << k))
}

/// The AFS-I primary code of `prn` (1..=210), logic bits: the Gold code `G1(t) xor G2(t - D)`
/// with `D` the PRN's G2 delay, both registers started from all ones, the 2047-chip period
/// short-cycled to 2046 (Appendix C).
pub fn afs_i_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let d = usize::from(*prn_index(&AFS_I_G2_DELAY, "LunaNet AFS-I", prn)?);
    let g1 = period([1; 11], &G1_TAPS);
    let g2 = period([1; 11], &G2_TAPS);
    Ok((0..AFS_I_CODE_LEN)
        .map(|t| g1[t] ^ g2[(t + GOLD_PERIOD - d) % GOLD_PERIOD])
        .collect())
}

fn prn_index<'a, T>(
    table: &'a [T; 210],
    signal: &'static str,
    prn: u16,
) -> Result<&'a T, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| table.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// The printed AFS-I G2 initial state of `prn` (Tables C-1..C-5), for the cross-check of the
/// delay.
pub fn afs_i_printed_g2_init(prn: u16) -> Result<u16, SignalError> {
    Ok(*prn_index(&AFS_I_G2_INIT, "LunaNet AFS-I", prn)?)
}

/// The AFS-I G2 delay of `prn`, chips.
pub fn afs_i_g2_delay(prn: u16) -> Result<u16, SignalError> {
    Ok(*prn_index(&AFS_I_G2_DELAY, "LunaNet AFS-I", prn)?)
}

/// The AFS-Q primary code of `prn` (1..=210), 10230 logic bits: the Weil code
/// `W(t; k) = L(t) xor L((t + k) mod 10223)` with the 7-chip expansion `0110100` inserted
/// before position `p` (Appendix D), the construction of GPS L1C.
pub fn afs_q_primary_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let (k, p) = *prn_index(&AFS_Q_PRIMARY, "LunaNet AFS-Q", prn)?;
    Ok(l1c_ranging_bits(k, p))
}

/// The AFS-Q tertiary code of `prn` (1..=210), 1500 logic bits: the Weil code
/// `W(t; k) = L(t) xor L((t + k) mod 1499)` over the length-1499 Legendre sequence, with a `0`
/// appended (Appendix E).
pub fn afs_q_tertiary_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let k = usize::from(*prn_index(
        &AFS_Q_TERTIARY_K,
        "LunaNet AFS-Q tertiary",
        prn,
    )?);
    let l = legendre(1499);
    let mut bits: Vec<u8> = (0..1499).map(|t| l[t] ^ l[(t + k) % 1499]).collect();
    bits.push(0);
    Ok(bits)
}

/// The tiered overlay of the AFS-Q pilot: one chip per primary period, `secondary xor
/// tertiary`, 4 x 1500 = 6000 chips (12 s), logic bits. `secondary` is 0..=3 for S0..S3.
pub fn afs_q_overlay_bits(secondary: usize, tertiary_prn: u16) -> Result<Vec<u8>, SignalError> {
    let s = SECONDARY.get(secondary).ok_or(SignalError::UnknownPrn {
        signal: "LunaNet AFS-Q secondary (S0..S3)",
        prn: secondary as u16,
    })?;
    let t = afs_q_tertiary_bits(tertiary_prn)?;
    let mut out = Vec::with_capacity(4 * AFS_Q_TERTIARY_LEN);
    for tc in t {
        for &sc in s {
            out.push(sc ^ tc);
        }
    }
    Ok(out)
}

/// The Legendre sequence of length `n` as hex in the document's layout: a leading zero bit
/// (`L(0)`), then `n - 1` bits, padded on the right to a whole number of hex digits.
/// Used to compare with the printed Tables D-1 and E-1.
pub fn legendre_bits(n: usize) -> Vec<u8> {
    legendre(n)
}

/// AFS-I data component for `prn` 1..=210: the Gold code, BPSK(1), 500 symbol/s data (one
/// symbol per 2 ms code period). VALIDATED against the printed chips of LSIS-AFS V1.0, which
/// the document marks {LSIS-TBC}.
pub fn afs_i(prn: u16) -> Result<SignalCode, SignalError> {
    Ok(SignalCode::new(
        crate::t!("iq-signals-lunanet-lunanet-afs-prn", prn = prn),
        AFS_I_CHIP_RATE_HZ,
        AFS_HZ,
        bipolar(&afs_i_bits(prn)?),
        vec![],
        Modulation::Bpsk,
    )
    .with_data_modulation(DataModulation::Symbols { symbol_s: 0.002 }))
}

/// AFS-Q pilot component for `prn` 1..=210 as a receiver replicates it: the primary Weil code
/// of that PRN tiered with the 4-chip secondary code `S((prn - 1) mod 4)` (the interim
/// assignment of Table 11 for PRNs 1..=12; beyond them the same pattern is this
/// implementation's, not the document's, since Table F-1 is TBD), a 2 ms primary period and an
/// 8 ms tiered period, BPSK(5), no data. The 1500-chip **tertiary** code is left out here: it
/// is a 12 s frame-synchronisation overlay, and a replica 12 s long is not what acquisition and
/// tracking correlate against. [`afs_q_tiered`] is the full code.
pub fn afs_q(prn: u16) -> Result<SignalCode, SignalError> {
    afs_q_with(prn, (usize::from(prn).wrapping_sub(1)) % 4, None)
}

/// AFS-Q pilot with an explicit primary PRN and secondary code (0..=3 for S0..S3), tiered with
/// the tertiary code of `tertiary_prn` when one is given (the full 12 s code) and with the
/// secondary alone when `None`.
pub fn afs_q_with(
    primary_prn: u16,
    secondary: usize,
    tertiary_prn: Option<u16>,
) -> Result<SignalCode, SignalError> {
    let (overlay, name) = match tertiary_prn {
        Some(t) => (
            afs_q_overlay_bits(secondary, t)?,
            crate::t!(
                "iq-signals-lunanet-lunanet-afs-primary-tertiary",
                primary_prn = primary_prn,
                secondary = secondary,
                t = t
            ),
        ),
        None => (
            SECONDARY
                .get(secondary)
                .ok_or(SignalError::UnknownPrn {
                    signal: "LunaNet AFS-Q secondary (S0..S3)",
                    prn: secondary as u16,
                })?
                .to_vec(),
            crate::t!(
                "iq-signals-lunanet-lunanet-afs-primary-tertiary-omitted",
                primary_prn = primary_prn,
                secondary = secondary
            ),
        ),
    };
    Ok(SignalCode::new(
        name,
        AFS_Q_CHIP_RATE_HZ,
        AFS_HZ,
        bipolar(&afs_q_primary_bits(primary_prn)?),
        bipolar(&overlay),
        Modulation::Bpsk,
    )
    .with_data_modulation(DataModulation::Pilot))
}

/// The full AFS-Q pilot code of `prn` for a stated secondary code and tertiary PRN: primary x
/// secondary x tertiary, 10230 x 4 x 1500 chips, 12 s (Table 9), tertiary phase offset zero.
pub fn afs_q_tiered(
    prn: u16,
    secondary: usize,
    tertiary_prn: u16,
) -> Result<SignalCode, SignalError> {
    afs_q_with(prn, secondary, Some(tertiary_prn))
}
