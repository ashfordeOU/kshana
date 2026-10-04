// SPDX-License-Identifier: AGPL-3.0-only
//! Galileo E1-B / E1-C (CBOC) and E5a-I / E5a-Q spreading codes.
//!
//! Reference: Galileo OS SIS ICD, Issue 2.1 (November 2023) for the signal definitions,
//! the E5 LFSR parameters and the secondary codes. The E1 memory codes are the ICD's
//! Annex C tables as attached to the electronic Issue 2.0 (January 2021); Issue 2.1 still
//! points to Annex C for them but its published PDF no longer carries the attachments.
//! Provenance and hashes: `data/galileo-os-sis-icd/PROVENANCE.md`.

use std::sync::OnceLock;

use super::tables::{CS100, E5A_ROWS};
use super::{bipolar, hex_to_bits, Modulation, SignalCode, SignalError};

/// Galileo E1 carrier frequency (Hz).
pub const E1_HZ: f64 = 1_575_420_000.0;
/// Galileo E5a carrier frequency (Hz).
pub const E5A_HZ: f64 = 1_176_450_000.0;
/// E1-B / E1-C chip rate (chips/s).
pub const E1_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// E1-B / E1-C primary-code length (chips).
pub const E1_CODE_LEN: usize = 4092;
/// E5a chip rate (chips/s).
pub const E5A_CHIP_RATE_HZ: f64 = 10_230_000.0;
/// E5a primary-code length (chips).
pub const E5A_CODE_LEN: usize = 10_230;
/// Number of codes the ICD defines per E1 / E5 component.
pub const CODES_PER_COMPONENT: u16 = 50;
/// Secondary code CS25_1 (E1-C), hexadecimal as printed in ICD Table 20.
pub const CS25: &str = "380AD90";
/// Secondary code CS20_1 (E5a-I), hexadecimal as printed in ICD Table 20.
pub const CS20: &str = "842E9";
/// E5a base register 1 feedback taps (octal, ICD Table 15).
pub const E5A_TAPS_REG1_OCTAL: u16 = 0o40503;
/// E5a base register 2 feedback taps (octal, ICD Table 15).
pub const E5A_TAPS_REG2_OCTAL: u16 = 0o50661;

/// The E1-B memory codes, ICD Annex C.7 (`C7_E1B.txt`), byte for byte.
pub const E1B_TABLE_TEXT: &str = include_str!("../../../data/galileo-os-sis-icd/C7_E1B.txt");
/// The E1-C memory codes, ICD Annex C.8 (`C8_E1C.txt`), byte for byte.
pub const E1C_TABLE_TEXT: &str = include_str!("../../../data/galileo-os-sis-icd/C8_E1C.txt");

/// A table of Galileo memory codes, as published in the ICD's Annex C text format: one
/// line per code, `<label>_<number>;<hex>`, first chip in the most significant bit.
#[derive(Clone, Debug, PartialEq)]
pub struct MemoryCodeTable {
    codes: Vec<(u16, Vec<u8>)>,
}

impl MemoryCodeTable {
    /// Parse a table whose codes are `len` chips long. Blank lines are skipped; carriage
    /// returns are tolerated. Use this to load a user-supplied table in the Annex C format.
    pub fn parse(text: &str, len: usize) -> Result<Self, SignalError> {
        let mut codes = Vec::new();
        for (ln, line) in text.lines().enumerate() {
            let line = line.trim();
            if line.is_empty() {
                continue;
            }
            let (label, hex) = line
                .split_once(';')
                .ok_or_else(|| SignalError::Table(format!("line {}: no ';'", ln + 1)))?;
            let number: u16 = label
                .rsplit('_')
                .next()
                .and_then(|n| n.parse().ok())
                .ok_or_else(|| {
                    SignalError::Table(format!("line {}: no code number in {label:?}", ln + 1))
                })?;
            if codes.iter().any(|(n, _)| *n == number) {
                return Err(SignalError::Table(format!("code {number} appears twice")));
            }
            codes.push((number, hex_to_bits(hex, len)?));
        }
        Ok(Self { codes })
    }

    /// Code numbers present in the table, in file order.
    pub fn numbers(&self) -> Vec<u16> {
        self.codes.iter().map(|(n, _)| *n).collect()
    }

    /// Logic bits of code `number`, if present.
    pub fn bits(&self, number: u16) -> Option<&[u8]> {
        self.codes
            .iter()
            .find(|(n, _)| *n == number)
            .map(|(_, b)| b.as_slice())
    }
}

/// The built-in E1-B table (ICD Annex C.7), parsed once.
pub fn e1b_table() -> &'static MemoryCodeTable {
    static T: OnceLock<MemoryCodeTable> = OnceLock::new();
    T.get_or_init(|| {
        MemoryCodeTable::parse(E1B_TABLE_TEXT, E1_CODE_LEN).expect("committed E1-B table parses")
    })
}

/// The built-in E1-C table (ICD Annex C.8), parsed once.
pub fn e1c_table() -> &'static MemoryCodeTable {
    static T: OnceLock<MemoryCodeTable> = OnceLock::new();
    T.get_or_init(|| {
        MemoryCodeTable::parse(E1C_TABLE_TEXT, E1_CODE_LEN).expect("committed E1-C table parses")
    })
}

/// Galileo E1-B (data) code for `prn` 1..=50 from `table`, with the in-phase CBOC
/// subcarrier `α·sc_a + β·sc_b`. No secondary code (ICD Table 22).
pub fn e1b_from_table(table: &MemoryCodeTable, prn: u16) -> Result<SignalCode, SignalError> {
    let bits = table.bits(prn).ok_or(SignalError::UnknownPrn {
        signal: "Galileo E1-B",
        prn,
    })?;
    Ok(SignalCode::new(
        format!("Galileo E1-B PRN {prn}"),
        E1_CHIP_RATE_HZ,
        E1_HZ,
        bipolar(bits),
        vec![],
        Modulation::Cboc { plus: true },
    ))
}

/// Galileo E1-C (pilot) code for `prn` 1..=50 from `table`, with the anti-phase CBOC
/// subcarrier `α·sc_a − β·sc_b` and the 25-chip secondary code CS25_1 (100 ms period).
pub fn e1c_from_table(table: &MemoryCodeTable, prn: u16) -> Result<SignalCode, SignalError> {
    let bits = table.bits(prn).ok_or(SignalError::UnknownPrn {
        signal: "Galileo E1-C",
        prn,
    })?;
    Ok(SignalCode::new(
        format!("Galileo E1-C PRN {prn}"),
        E1_CHIP_RATE_HZ,
        E1_HZ,
        bipolar(bits),
        bipolar(&hex_to_bits(CS25, 25)?),
        Modulation::Cboc { plus: false },
    ))
}

/// Galileo E1-B code for `prn` 1..=50 from the committed ICD Annex C.7 table. The chips
/// are the ICD's own published table (VALIDATED by provenance hash, and identical in
/// Issues 1.3 and 2.0); the CBOC waveform is VALIDATED against the ICD's 10/11 : 1/11
/// power split.
pub fn e1b(prn: u16) -> Result<SignalCode, SignalError> {
    e1b_from_table(e1b_table(), prn)
}

/// Galileo E1-C code for `prn` 1..=50 from the committed ICD Annex C.8 table, as
/// [`e1b`] with the anti-phase CBOC and the CS25 secondary code.
pub fn e1c(prn: u16) -> Result<SignalCode, SignalError> {
    e1c_from_table(e1c_table(), prn)
}

/// Generate an E5 primary code (logic bits) from the two base registers (ICD §3.3, §3.4.1
/// and Figure 10): register length 14, register 1 starting all ones, register 2 starting
/// at `start2_octal`; feedback tap `a_j` is bit `j` of the tap word and start value `s_j`
/// is bit `j - 1` of the start word; the output is the XOR of the two last stages.
pub fn e5_primary_bits(
    taps1_octal: u16,
    taps2_octal: u16,
    start2_octal: u16,
    len: usize,
) -> Vec<u8> {
    const R: usize = 14;
    let taps = |w: u16| -> [u8; R] {
        let mut a = [0u8; R];
        for (j, t) in a.iter_mut().enumerate() {
            *t = ((w >> (j + 1)) & 1) as u8;
        }
        a
    };
    let (a1, a2) = (taps(taps1_octal), taps(taps2_octal));
    let mut c1 = [1u8; R];
    let mut c2 = [0u8; R];
    for (j, c) in c2.iter_mut().enumerate() {
        *c = ((start2_octal >> j) & 1) as u8;
    }
    let step = |c: &mut [u8; R], a: &[u8; R]| {
        let fb = c.iter().zip(a).fold(0u8, |acc, (&x, &t)| acc ^ (x & t));
        c.copy_within(0..R - 1, 1);
        c[0] = fb;
    };
    let mut out = Vec::with_capacity(len);
    for _ in 0..len {
        out.push(c1[R - 1] ^ c2[R - 1]);
        step(&mut c1, &a1);
        step(&mut c2, &a2);
    }
    out
}

fn e5a_row(signal: &'static str, prn: u16) -> Result<&'static super::tables::E5aRow, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| E5A_ROWS.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// Galileo E5a-I (data) code for `prn` 1..=50, tiered with CS20_1 (20 ms period). BPSK
/// component only (the E5 AltBOC multiplex is out of scope). VALIDATED: the LFSR output
/// equals the printed first 24 chips (ICD Table 16) and the complete Annex C.3 code.
pub fn e5a_i(prn: u16) -> Result<SignalCode, SignalError> {
    let row = e5a_row("Galileo E5a-I", prn)?;
    let bits = e5_primary_bits(
        E5A_TAPS_REG1_OCTAL,
        E5A_TAPS_REG2_OCTAL,
        row.i_start,
        E5A_CODE_LEN,
    );
    Ok(SignalCode::new(
        format!("Galileo E5a-I PRN {prn}"),
        E5A_CHIP_RATE_HZ,
        E5A_HZ,
        bipolar(&bits),
        bipolar(&hex_to_bits(CS20, 20)?),
        Modulation::Bpsk,
    ))
}

/// Galileo E5a-Q (pilot) code for `prn` 1..=50, tiered with CS100_prn (100 ms period).
/// VALIDATED as for [`e5a_i`] against ICD Table 17 and Annex C.4.
pub fn e5a_q(prn: u16) -> Result<SignalCode, SignalError> {
    let row = e5a_row("Galileo E5a-Q", prn)?;
    let bits = e5_primary_bits(
        E5A_TAPS_REG1_OCTAL,
        E5A_TAPS_REG2_OCTAL,
        row.q_start,
        E5A_CODE_LEN,
    );
    Ok(SignalCode::new(
        format!("Galileo E5a-Q PRN {prn}"),
        E5A_CHIP_RATE_HZ,
        E5A_HZ,
        bipolar(&bits),
        bipolar(&hex_to_bits(CS100[prn as usize - 1], 100)?),
        Modulation::Bpsk,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn table_parser_rejects_malformed_input() {
        assert!(MemoryCodeTable::parse("X_1;F", 4).is_ok());
        assert!(MemoryCodeTable::parse("X_1 F", 4).is_err());
        assert!(MemoryCodeTable::parse("X_a;F", 4).is_err());
        assert!(MemoryCodeTable::parse("X_1;F\nX_1;0", 4).is_err());
        assert!(MemoryCodeTable::parse("X_1;FF", 4).is_err());
    }

    #[test]
    fn user_table_loader_builds_a_code() {
        let t = MemoryCodeTable::parse("E1B__Code_No_07;A5\r\n", 8).unwrap();
        let c = e1b_from_table(&t, 7).unwrap();
        assert_eq!(c.primary_bits(), vec![1, 0, 1, 0, 0, 1, 0, 1]);
        assert!(e1b_from_table(&t, 1).is_err());
    }

    #[test]
    fn prn_range_is_enforced() {
        assert!(e1b(0).is_err());
        assert!(e1c(51).is_err());
        assert!(e5a_i(51).is_err());
        assert!(e5a_q(0).is_err());
    }
}
