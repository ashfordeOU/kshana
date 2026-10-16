// SPDX-License-Identifier: AGPL-3.0-only
//! PRO-39: the GPS L1C ranging (L1CP, L1CD) and overlay (L1CO) codes against the check
//! columns IS-GPS-800J prints next to the generator parameters, under the bars of
//! `docs/design/evidence/l1c-codes/PREREGISTRATION.md` (committed before the first run).
//!
//! The parameters (`w`, `p`, the S1 polynomial and initial state) come from the same tables,
//! so this checks that the crate's construction turns the ICD's parameters into the ICD's
//! printed chips, not the parameters themselves. The Legendre sequence is computed from its
//! definition and checked against the ICD's Table 6.2-1. A code that matches only after an
//! inversion, a chip shift or a PRN relabelling is a miss.
//!
//! PIN-SCOPE:    the ICD-defined lengths (10 230-chip ranging codes, 1800-bit overlay codes,
//!               10 224 printed Legendre bits) and the printed initial/final chip columns.
//! PIN-EXCLUDES: the chips between the printed columns, the TMBOC subcarrier pattern and the
//!               L1CO S2 codes (PRN 64 and above).

use kshana::iq::signals::beidou::legendre;
use kshana::iq::signals::gps::{l1c_d_bits, l1c_o_bits, l1c_p_bits};
use kshana::iq::signals::tables::{L1cRow, L1C_D, L1C_LEGENDRE_OCTAL, L1C_O, L1C_P};

/// `n` bits as an integer, the first bit most significant.
fn pack(bits: &[u8]) -> u32 {
    bits.iter().fold(0u32, |acc, &b| (acc << 1) | u32::from(b))
}

/// C1 for one component: every code's initial and final 24 chips against the printed
/// columns; returns the misses.
fn ranging_misses(name: &str, table: &[L1cRow; 63], bits: fn(u16) -> Vec<u8>) -> Vec<String> {
    let mut misses = Vec::new();
    for prn in 1..=63u16 {
        let row = &table[prn as usize - 1];
        let code = bits(prn);
        assert_eq!(code.len(), 10230, "{name} PRN {prn} length");
        let (head, tail) = (pack(&code[..24]), pack(&code[10230 - 24..]));
        if head != row.first24 {
            misses.push(format!(
                "{name} PRN {prn}: initial {head:08o} vs printed {:08o} (first differing chip {})",
                row.first24,
                (head ^ row.first24).leading_zeros() - 8
            ));
        }
        if tail != row.last24 {
            misses.push(format!(
                "{name} PRN {prn}: final {tail:08o} vs printed {:08o} (first differing chip {})",
                row.last24,
                10230 - 24 + ((tail ^ row.last24).leading_zeros() - 8) as usize
            ));
        }
    }
    misses
}

/// C1: the initial and final 24 chips of all 126 L1CP and L1CD codes.
#[test]
fn c1_l1cp_and_l1cd_initial_and_final_24_chips_match_is_gps_800j_table_3_2_2() {
    let mut misses = ranging_misses("L1CP", &L1C_P, |p| l1c_p_bits(p).unwrap());
    misses.extend(ranging_misses("L1CD", &L1C_D, |p| l1c_d_bits(p).unwrap()));
    assert!(
        misses.is_empty(),
        "{} of 252 columns differ:\n{}",
        misses.len(),
        misses.join("\n")
    );
}

/// C2: the initial and final 11 bits of the 63 L1CO overlay codes.
#[test]
fn c2_l1co_initial_and_final_11_bits_match_is_gps_800j_table_3_2_3() {
    let mut misses = Vec::new();
    for prn in 1..=63u16 {
        let row = &L1C_O[prn as usize - 1];
        let code = l1c_o_bits(prn).unwrap();
        assert_eq!(code.len(), 1800, "L1CO PRN {prn} length");
        let (head, tail) = (pack(&code[..11]), pack(&code[1800 - 11..]));
        if head != u32::from(row.initial) || tail != u32::from(row.final11) {
            misses.push(format!(
                "L1CO PRN {prn}: initial {head:04o} vs {:04o}, final {tail:04o} vs {:04o}",
                row.initial, row.final11
            ));
        }
    }
    assert!(
        misses.is_empty(),
        "{} of 63 overlay codes differ:\n{}",
        misses.len(),
        misses.join("\n")
    );
}

/// C3: the computed length-10223 Legendre sequence against IS-GPS-800J Table 6.2-1 (10 224
/// printed bits, the first a padding bit the ICD says to ignore).
#[test]
fn c3_legendre_sequence_matches_is_gps_800j_table_6_2_1() {
    let printed: Vec<u8> = L1C_LEGENDRE_OCTAL
        .iter()
        .flat_map(|row| row.chars())
        .flat_map(|c| {
            let d = c.to_digit(8).expect("octal digit") as u8;
            [(d >> 2) & 1, (d >> 1) & 1, d & 1]
        })
        .collect();
    assert_eq!(printed.len(), 10224, "Table 6.2-1 carries 10 224 bits");
    let computed = legendre(10223);
    let diff: Vec<usize> = (0..10223)
        .filter(|&t| computed[t] != printed[t + 1])
        .collect();
    assert!(
        diff.is_empty(),
        "{} of 10 223 Legendre bits differ; first at t = {}",
        diff.len(),
        diff[0]
    );
}

/// Negative control: the check fails a PRN relabelling, an inversion and a one-chip shift.
#[test]
fn the_column_check_rejects_relabelled_inverted_and_shifted_codes() {
    let relabelled = ranging_misses("L1CP", &L1C_P, |p| l1c_p_bits(p % 63 + 1).unwrap());
    assert_eq!(relabelled.len(), 126, "every relabelled column must miss");
    let inverted = ranging_misses("L1CD", &L1C_D, |p| {
        l1c_d_bits(p).unwrap().iter().map(|b| b ^ 1).collect()
    });
    assert_eq!(inverted.len(), 126, "every inverted column must miss");
    let shifted = ranging_misses("L1CP", &L1C_P, |p| {
        let mut c = l1c_p_bits(p).unwrap();
        c.rotate_left(1);
        c
    });
    assert!(
        shifted.len() >= 120,
        "a one-chip shift must miss: {}",
        shifted.len()
    );
}
