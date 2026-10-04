// SPDX-License-Identifier: AGPL-3.0-only
//! BeiDou B1C (Weil codes, BOC(1,1) / QMBOC(6,1,4/33)) and B1I (Gold codes).
//!
//! References: BDS-SIS-ICD-B1C-1.0 (2017-12) and BDS-SIS-ICD-B1I-3.0 (2019-02), China
//! Satellite Navigation Office.

use super::tables::{WeilRow, B1C_DATA, B1C_PILOT, B1C_PILOT_SECONDARY, B1I_G2_TAPS, B1I_GEO_PRNS};
use super::{
    bipolar, square_subcarrier, ComplexSpreadingCode, Modulation, SignalCode, SignalError,
};
use crate::iq::{Cf64, SpreadingCode};

/// B1C carrier frequency (Hz).
pub const B1C_HZ: f64 = 1_575_420_000.0;
/// B1I carrier frequency (Hz).
pub const B1I_HZ: f64 = 1_561_098_000.0;
/// B1C chip rate (chips/s).
pub const B1C_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// B1C primary-code length (chips).
pub const B1C_CODE_LEN: usize = 10_230;
/// Weil (Legendre) length behind the B1C primary codes.
pub const B1C_WEIL_LEN: usize = 10_243;
/// B1C pilot secondary-code length (chips).
pub const B1C_SECONDARY_LEN: usize = 1800;
/// Weil (Legendre) length behind the B1C secondary codes.
pub const B1C_SECONDARY_WEIL_LEN: usize = 3607;
/// B1I chip rate (chips/s).
pub const B1I_CHIP_RATE_HZ: f64 = 2_046_000.0;
/// B1I code length (chips): a 2047-chip Gold code truncated by its last chip.
pub const B1I_CODE_LEN: usize = 2046;
/// The 20-bit Neuman-Hoffman code on D1 (MEO/IGSO) B1I signals, logic bits
/// (BDS-SIS-ICD-B1I-3.0 §5.2.1).
pub const B1I_NH20: [u8; 20] = [0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0];

/// The Legendre sequence of prime length `n` (BDS-SIS-ICD-B1C-1.0 Eq. 5-2): `L(0) = 0`;
/// `L(k) = 1` when `k` is a non-zero quadratic residue mod `n`; else 0.
pub fn legendre(n: usize) -> Vec<u8> {
    let mut l = vec![0u8; n];
    for x in 1..n {
        l[(x * x) % n] = 1;
    }
    l
}

/// A truncated Weil code (BDS-SIS-ICD-B1C-1.0 Eqs. 5-1 and 5-3), logic bits:
/// `c(k) = L((k + p − 1) mod N) XOR L((k + p − 1 + w) mod N)`, `k = 0..len`.
pub fn weil_bits(n: usize, len: usize, w: usize, p: usize) -> Vec<u8> {
    let l = legendre(n);
    (0..len)
        .map(|k| {
            let i = (k + p - 1) % n;
            l[i] ^ l[(i + w) % n]
        })
        .collect()
}

fn row(
    table: &'static [WeilRow; 63],
    signal: &'static str,
    prn: u16,
) -> Result<&'static WeilRow, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| table.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// B1C data-component primary code (logic bits) for `prn` 1..=63.
pub fn b1c_data_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r = row(&B1C_DATA, "BeiDou B1C data", prn)?;
    Ok(weil_bits(
        B1C_WEIL_LEN,
        B1C_CODE_LEN,
        r.w as usize,
        r.p as usize,
    ))
}

/// B1C pilot-component primary code (logic bits) for `prn` 1..=63.
pub fn b1c_pilot_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r = row(&B1C_PILOT, "BeiDou B1C pilot", prn)?;
    Ok(weil_bits(
        B1C_WEIL_LEN,
        B1C_CODE_LEN,
        r.w as usize,
        r.p as usize,
    ))
}

/// B1C pilot-component secondary code (logic bits) for `prn` 1..=63.
pub fn b1c_pilot_secondary_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r = row(&B1C_PILOT_SECONDARY, "BeiDou B1C pilot secondary", prn)?;
    Ok(weil_bits(
        B1C_SECONDARY_WEIL_LEN,
        B1C_SECONDARY_LEN,
        r.w as usize,
        r.p as usize,
    ))
}

/// BeiDou B1C data component for `prn` 1..=63: Weil primary code with the sine BOC(1,1)
/// subcarrier, no secondary code. VALIDATED: the Weil construction reproduces the printed
/// first and last 24 chips of every PRN (BDS-SIS-ICD-B1C-1.0 Table 5-2).
pub fn b1c_data(prn: u16) -> Result<SignalCode, SignalError> {
    Ok(SignalCode::new(
        format!("BeiDou B1C data PRN {prn}"),
        B1C_CHIP_RATE_HZ,
        B1C_HZ,
        bipolar(&b1c_data_bits(prn)?),
        vec![],
        Modulation::SineBoc { n: 1 },
    ))
}

/// Which part of the B1C pilot's QMBOC(6,1,4/33) subcarrier `value_at` returns.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum QmbocPart {
    /// The BOC(1,1) part (29/33 of the pilot power, in quadrature with the data
    /// component); what a BOC(1,1)-only receiver replica tracks. Unit amplitude.
    Boc11,
    /// The BOC(6,1) part (4/33 of the pilot power, in phase with the data component).
    /// Unit amplitude.
    Boc61,
}

/// BeiDou B1C pilot component: Weil primary code, Weil secondary code and the
/// QMBOC(6,1,4/33) subcarrier `sc = √(29/33)·sc_BOC(1,1) − j·√(4/33)·sc_BOC(6,1)`
/// (BDS-SIS-ICD-B1C-1.0 Eqs. 4-10 and 4-11).
///
/// Because QMBOC is complex, the real-valued [`SpreadingCode::value_at`] returns one
/// unit-amplitude part selected by [`QmbocPart`]; [`ComplexSpreadingCode::complex_at`]
/// returns the full complex subcarrier times the code.
#[derive(Clone, Debug, PartialEq)]
pub struct B1cPilot {
    code: SignalCode,
    part: QmbocPart,
}

impl B1cPilot {
    /// The underlying tiered code (primary x secondary) with the BOC(1,1) subcarrier.
    pub fn code(&self) -> &SignalCode {
        &self.code
    }
    /// The part `value_at` returns.
    pub fn part(&self) -> QmbocPart {
        self.part
    }
    /// The same pilot with `value_at` returning `part`.
    pub fn with_part(mut self, part: QmbocPart) -> Self {
        self.part = part;
        self
    }
    /// The same pilot without its secondary code.
    pub fn primary_only(&self) -> Self {
        Self {
            code: self.code.primary_only(),
            part: self.part,
        }
    }
}

fn split(phase: f64, len: usize) -> (i64, f64) {
    let p = phase.rem_euclid(len as f64);
    let i = p.floor();
    (
        (i as i64).min(len as i64 - 1),
        (p - i).clamp(0.0, 1.0 - f64::EPSILON),
    )
}

impl SpreadingCode for B1cPilot {
    fn name(&self) -> String {
        let part = match self.part {
            QmbocPart::Boc11 => "BOC(1,1) part",
            QmbocPart::Boc61 => "BOC(6,1) part",
        };
        format!("{} [{part}]", self.code.name())
    }
    fn chip_rate_hz(&self) -> f64 {
        self.code.chip_rate_hz()
    }
    fn len_chips(&self) -> usize {
        self.code.len_chips()
    }
    fn carrier_hz(&self) -> f64 {
        self.code.carrier_hz()
    }
    fn value_at(&self, code_phase_chips: f64) -> f64 {
        let (k, frac) = split(code_phase_chips, self.len_chips());
        let n = match self.part {
            QmbocPart::Boc11 => 1,
            QmbocPart::Boc61 => 6,
        };
        self.code.chip(k) * square_subcarrier(n, frac)
    }
}

impl ComplexSpreadingCode for B1cPilot {
    fn complex_at(&self, code_phase_chips: f64) -> Cf64 {
        let (k, frac) = split(code_phase_chips, self.len_chips());
        let c = self.code.chip(k);
        let a = (29.0f64 / 33.0).sqrt() * square_subcarrier(1, frac);
        let b = (4.0f64 / 33.0).sqrt() * square_subcarrier(6, frac);
        Cf64::new(c * a, -c * b)
    }
}

/// BeiDou B1C pilot component for `prn` 1..=63, tiered with its 1800-chip Weil secondary
/// code (18 s period), `value_at` returning the BOC(1,1) part. VALIDATED: primary and
/// secondary codes reproduce the printed first and last 24 chips of every PRN (Tables 5-3
/// and 5-4); the QMBOC power split 29:4 is checked from the waveform.
pub fn b1c_pilot(prn: u16) -> Result<B1cPilot, SignalError> {
    Ok(B1cPilot {
        code: SignalCode::new(
            format!("BeiDou B1C pilot PRN {prn}"),
            B1C_CHIP_RATE_HZ,
            B1C_HZ,
            bipolar(&b1c_pilot_bits(prn)?),
            bipolar(&b1c_pilot_secondary_bits(prn)?),
            Modulation::SineBoc { n: 1 },
        ),
        part: QmbocPart::Boc11,
    })
}

// --- B1I ------------------------------------------------------------------------------

/// G1 polynomial 1 + X + X^7 + X^8 + X^9 + X^10 + X^11 (feedback stages).
const G1_TAPS: [usize; 6] = [1, 7, 8, 9, 10, 11];
/// G2 polynomial 1 + X + X^2 + X^3 + X^4 + X^5 + X^8 + X^9 + X^11 (feedback stages).
const G2_TAPS: [usize; 8] = [1, 2, 3, 4, 5, 8, 9, 11];
/// Initial phase of G1 and G2, stages 1..=11: 01010101010.
const B1I_INIT: [u8; 11] = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0];

/// One step of an 11-stage Fibonacci register (stage 1 receives the feedback).
fn shift11(r: &mut [u8; 11], taps: &[usize]) {
    let fb = taps.iter().fold(0u8, |acc, &t| acc ^ r[t - 1]);
    r.copy_within(0..10, 1);
    r[0] = fb;
}

/// The B1I Gold code for `prn` 1..=63 over `len` chips (2047 for the full Gold period,
/// [`B1I_CODE_LEN`] for the transmitted code), logic bits: G1 stage 11 XOR the G2 stages
/// of BDS-SIS-ICD-B1I-3.0 Table 4-1.
pub fn b1i_bits(prn: u16, len: usize) -> Result<Vec<u8>, SignalError> {
    let taps = (prn as usize)
        .checked_sub(1)
        .and_then(|i| B1I_G2_TAPS.get(i))
        .ok_or(SignalError::UnknownPrn {
            signal: "BeiDou B1I",
            prn,
        })?;
    let (mut g1, mut g2) = (B1I_INIT, B1I_INIT);
    let mut out = Vec::with_capacity(len);
    for _ in 0..len {
        let g2_out = taps
            .iter()
            .filter(|&&t| t != 0)
            .fold(0u8, |acc, &t| acc ^ g2[t as usize - 1]);
        out.push(g1[10] ^ g2_out);
        shift11(&mut g1, &G1_TAPS);
        shift11(&mut g2, &G2_TAPS);
    }
    Ok(out)
}

/// True when ranging code `prn` belongs to a GEO satellite (D2 message, no NH code).
pub fn b1i_is_geo(prn: u16) -> bool {
    B1I_GEO_PRNS.iter().any(|&g| u16::from(g) == prn)
}

/// BeiDou B1I code for `prn` 1..=63 (2046 chips at 2.046 Mchip/s), tiered with the NH20
/// code for MEO/IGSO ranging codes (D1) and plain for GEO (D2). The ICD prints no per-PRN
/// chip table, so this is checked structurally: register polynomials, the shared initial
/// phase, Table 4-1 tap selections, and the Gold-code balance. Label: MODELLED chips,
/// structure VALIDATED.
pub fn b1i(prn: u16) -> Result<SignalCode, SignalError> {
    let bits = b1i_bits(prn, B1I_CODE_LEN)?;
    let secondary = if b1i_is_geo(prn) {
        vec![]
    } else {
        bipolar(&B1I_NH20)
    };
    Ok(SignalCode::new(
        format!("BeiDou B1I PRN {prn}"),
        B1I_CHIP_RATE_HZ,
        B1I_HZ,
        bipolar(&bits),
        secondary,
        Modulation::Bpsk,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn legendre_example_length_7() {
        // Quadratic residues mod 7 are {1, 2, 4}.
        assert_eq!(legendre(7), vec![0, 1, 1, 0, 1, 0, 0]);
    }

    #[test]
    fn prn_range_is_enforced() {
        assert!(b1c_data(0).is_err());
        assert!(b1c_pilot(64).is_err());
        assert!(b1i(64).is_err());
        assert!(b1i_is_geo(1) && b1i_is_geo(63) && !b1i_is_geo(6));
    }
}
