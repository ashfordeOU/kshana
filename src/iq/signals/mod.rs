// SPDX-License-Identifier: AGPL-3.0-only
//! **Spreading codes for open-service GNSS signals, each checked against its ICD.**
//!
//! Every signal here is a [`SignalCode`]: a primary code, an optional secondary
//! (overlay) code and a chip [`Modulation`] (BPSK, sine-phased BOC or Galileo CBOC),
//! evaluated at a fractional code phase through [`SpreadingCode`]. Constructors live in
//! one submodule per constellation:
//!
//! | Signal | Constructor | Primary code | Secondary code | Modulation |
//! |---|---|---|---|---|
//! | GPS L1 C/A | [`gps::l1ca`] | Gold 1023 (wraps [`crate::sdr::CaCode`]) | - | BPSK(1) |
//! | GPS L5 I5 / Q5 | [`gps::l5_i5`], [`gps::l5_q5`] | XA/XB 10230 | NH10 / NH20 | BPSK(10) |
//! | GPS L2C CM / CL | [`gps::l2c_cm`], [`gps::l2c_cl`], [`gps::l2c`] | 10230 / 767250 | - | BPSK, time-multiplexed |
//! | Galileo E1-B / E1-C | [`galileo::e1b`], [`galileo::e1c`] | memory code 4092 | - / CS25 | CBOC(6,1,1/11) |
//! | Galileo E5a-I / E5a-Q | [`galileo::e5a_i`], [`galileo::e5a_q`] | LFSR 10230 | CS20 / CS100_n | BPSK(10) |
//! | BeiDou B1C data / pilot | [`beidou::b1c_data`], [`beidou::b1c_pilot`] | Weil 10230 | - / Weil 1800 | BOC(1,1); QMBOC(6,1,4/33) parts |
//! | BeiDou B1I | [`beidou::b1i`] | Gold 2046 | NH20 (MEO/IGSO) | BPSK(2) |
//! | GLONASS L1OF | [`glonass::l1of`] | m-sequence 511 | - | BPSK, FDMA channel k |
//!
//! ## What is checked, and against what
//!
//! Each code is VALIDATED against a column its ICD prints independently of the generator
//! parameters (see `docs/design/iq-notes/signals.md` for the full list):
//!
//! * GPS L5: the initial XB state of every PRN 1..=210 equals the all-ones state advanced
//!   by the printed XB advance, and the first 13 code chips are the complement of that
//!   state (IS-GPS-705J Tables 3-Ia/3-Ib/6-I).
//! * GPS L2C: running the register from the printed initial state lands on the printed
//!   end state, for CM (all 63 PRNs) and CL (IS-GPS-200N Tables 3-IIa/3-IIb).
//! * Galileo E5a: the LFSR output equals the printed first 24 chips (Tables 16/17) and the
//!   complete Annex C hexadecimal code, for all 50 codes of each component.
//! * Galileo E1: the memory codes are the ICD's own Annex C tables, committed with their
//!   provenance and hash (`data/galileo-os-sis-icd/`).
//! * BeiDou B1C: the Weil construction reproduces the printed first and last 24 chips of
//!   every data, pilot and secondary code (BDS-SIS-ICD-B1C-1.0 Tables 5-2/5-3/5-4).
//! * BeiDou B1I and GLONASS L1OF: their ICDs print no per-PRN chip table, so the checks
//!   are structural: register lengths, the GLONASS first-chip group `111111100`, the
//!   m-sequence / Gold balance, and periodic autocorrelation values from closed forms.
//!
//! The subcarrier waveforms (BOC, CBOC, QMBOC) are checked against the ICDs' stated power
//! splits, measured from the generated waveform.
//!
//! ## Conventions
//!
//! Logic level 0 maps to `+1.0` and 1 to `-1.0` (IS-GPS-200 / Galileo Table 11 /
//! BDS Table 4-3). [`SpreadingCode::value_at`] wraps the code phase into one full period
//! of the *tiered* code (primary length x secondary length) so a receiver replica and a
//! scene generator agree on where the secondary code is. Use [`SignalCode::primary_only`]
//! for a replica without the overlay code.
//!
//! Out of scope here: navigation data, the GLONASS 100 Hz meander, composite multiplexes
//! (E5 AltBOC, the full E1 or B1C complex envelope) and signal power levels.

pub mod beidou;
pub mod galileo;
pub mod glonass;
pub mod gps;
pub mod tables;

use super::{Cf64, SpreadingCode};

/// Errors from building a spreading code.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum SignalError {
    /// The PRN (or code number) is outside the range the ICD defines for the signal.
    UnknownPrn {
        /// Signal identifier, for example `"GPS L5 I5"`.
        signal: &'static str,
        /// The PRN that was asked for.
        prn: u16,
    },
    /// The GLONASS FDMA frequency channel is outside -7..=6.
    FrequencyChannel(i8),
    /// A code table could not be parsed, with a description.
    Table(String),
}

impl std::fmt::Display for SignalError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            SignalError::UnknownPrn { signal, prn } => {
                write!(f, "{signal}: PRN {prn} is not defined by the ICD")
            }
            SignalError::FrequencyChannel(k) => {
                write!(f, "GLONASS frequency channel {k} is outside -7..=6")
            }
            SignalError::Table(m) => write!(f, "code table: {m}"),
        }
    }
}

impl std::error::Error for SignalError {}

/// The chip waveform: how one code chip is shaped in time.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum Modulation {
    /// Rectangular chips (BPSK-R).
    Bpsk,
    /// Sine-phased binary offset carrier BOC(n, 1) relative to a 1.023 Mchip/s code:
    /// the subcarrier `sign(sin(2π n f_c t))` completes `n` periods per chip.
    SineBoc {
        /// Subcarrier periods per chip.
        n: u32,
    },
    /// Galileo E1 CBOC(6,1,1/11): `α·sc_a ± β·sc_b` with `sc_a` the BOC(1,1) and `sc_b`
    /// the BOC(6,1) subcarrier, `α = √(10/11)`, `β = √(1/11)` (Galileo OS SIS ICD Eq. 11).
    /// `plus` is true for E1-B (in-phase) and false for E1-C (anti-phase).
    Cboc {
        /// True for `α·sc_a + β·sc_b` (E1-B), false for `α·sc_a − β·sc_b` (E1-C).
        plus: bool,
    },
}

/// Value of the sine-phased square subcarrier with `n` periods per chip at chip fraction
/// `frac` in `[0, 1)`: `+1` on the first half of each period, `-1` on the second.
pub fn square_subcarrier(n: u32, frac: f64) -> f64 {
    let half_periods = (frac * 2.0 * n as f64).floor() as i64;
    if half_periods.rem_euclid(2) == 0 {
        1.0
    } else {
        -1.0
    }
}

impl Modulation {
    /// The subcarrier value at chip fraction `frac` in `[0, 1)` (1 for BPSK).
    pub fn subcarrier(&self, frac: f64) -> f64 {
        match *self {
            Modulation::Bpsk => 1.0,
            Modulation::SineBoc { n } => square_subcarrier(n, frac),
            Modulation::Cboc { plus } => {
                let alpha = (10.0f64 / 11.0).sqrt();
                let beta = (1.0f64 / 11.0).sqrt();
                let a = square_subcarrier(1, frac);
                let b = square_subcarrier(6, frac);
                if plus {
                    alpha * a + beta * b
                } else {
                    alpha * a - beta * b
                }
            }
        }
    }
}

/// Map logic bits `{0, 1}` to signal levels `{+1, -1}`.
pub fn bipolar(bits: &[u8]) -> Vec<i8> {
    bits.iter().map(|&b| if b == 0 { 1 } else { -1 }).collect()
}

/// Expand a hexadecimal code string (first chip in the most significant bit of the first
/// symbol, as in Galileo OS SIS ICD Annex C.2) into `len` logic bits; padding bits beyond
/// `len` are dropped.
pub fn hex_to_bits(hex: &str, len: usize) -> Result<Vec<u8>, SignalError> {
    let mut bits = Vec::with_capacity(hex.len() * 4);
    for c in hex.trim().chars() {
        let v = c
            .to_digit(16)
            .ok_or_else(|| SignalError::Table(format!("non-hex character {c:?}")))?;
        for k in (0..4).rev() {
            bits.push(((v >> k) & 1) as u8);
        }
    }
    if bits.len() < len || bits.len() >= len + 4 {
        return Err(SignalError::Table(format!(
            "{} hex symbols cannot hold exactly {len} chips",
            hex.trim().len()
        )));
    }
    bits.truncate(len);
    Ok(bits)
}

/// Pack up to 32 logic bits into an integer, first bit most significant, so they compare
/// directly with the octal or hexadecimal "first chips" columns of the ICDs.
pub fn pack_bits(bits: &[u8]) -> u32 {
    bits.iter()
        .fold(0u32, |acc, &b| (acc << 1) | (b & 1) as u32)
}

/// A spreading code: primary code, secondary (overlay) code and chip modulation.
///
/// The secondary code holds one chip per primary-code period; a code with no overlay has
/// the one-chip secondary `[+1]`. Validation status of each constructor is stated on it.
#[derive(Clone, Debug, PartialEq)]
pub struct SignalCode {
    name: String,
    chip_rate_hz: f64,
    carrier_hz: f64,
    primary: Vec<i8>,
    secondary: Vec<i8>,
    modulation: Modulation,
}

impl SignalCode {
    /// Assemble a code from its parts. `primary` and `secondary` are signal levels
    /// (`±1`); an empty `secondary` means no overlay code.
    ///
    /// # Panics
    /// If `primary` is empty.
    pub fn new(
        name: impl Into<String>,
        chip_rate_hz: f64,
        carrier_hz: f64,
        primary: Vec<i8>,
        secondary: Vec<i8>,
        modulation: Modulation,
    ) -> Self {
        assert!(
            !primary.is_empty(),
            "a spreading code needs at least one chip"
        );
        let secondary = if secondary.is_empty() {
            vec![1]
        } else {
            secondary
        };
        Self {
            name: name.into(),
            chip_rate_hz,
            carrier_hz,
            primary,
            secondary,
            modulation,
        }
    }

    /// The primary-code chips as signal levels (`±1`).
    pub fn primary(&self) -> &[i8] {
        &self.primary
    }

    /// The secondary-code chips as signal levels (`[1]` when there is no overlay).
    pub fn secondary(&self) -> &[i8] {
        &self.secondary
    }

    /// The primary-code chips as logic bits (`+1 -> 0`, `-1 -> 1`).
    pub fn primary_bits(&self) -> Vec<u8> {
        self.primary.iter().map(|&c| u8::from(c < 0)).collect()
    }

    /// The chip modulation.
    pub fn modulation(&self) -> Modulation {
        self.modulation
    }

    /// Primary-code length in chips.
    pub fn primary_len(&self) -> usize {
        self.primary.len()
    }

    /// The same code without its secondary code (a primary-only replica).
    pub fn primary_only(&self) -> Self {
        Self {
            name: format!("{} (primary only)", self.name),
            secondary: vec![1],
            ..self.clone()
        }
    }

    /// The same code with a different carrier frequency (for example a GLONASS FDMA
    /// channel or a deliberately offset test signal).
    pub fn with_carrier_hz(mut self, carrier_hz: f64) -> Self {
        self.carrier_hz = carrier_hz;
        self
    }

    /// Tiered chip value (primary x secondary, without subcarrier) at integer chip index
    /// `k`, wrapped into one tiered period.
    pub fn chip(&self, k: i64) -> f64 {
        let total = (self.primary.len() * self.secondary.len()) as i64;
        let k = k.rem_euclid(total) as usize;
        let n = self.primary.len();
        f64::from(self.primary[k % n] * self.secondary[k / n])
    }
}

/// Split a code phase into the wrapped integer chip index and the fraction within the chip.
fn split_phase(phase: f64, len: usize) -> (usize, f64) {
    let p = phase.rem_euclid(len as f64);
    let i = p.floor();
    let idx = (i as usize).min(len - 1);
    (idx, (p - i).clamp(0.0, 1.0 - f64::EPSILON))
}

impl SpreadingCode for SignalCode {
    fn name(&self) -> String {
        self.name.clone()
    }
    fn chip_rate_hz(&self) -> f64 {
        self.chip_rate_hz
    }
    fn len_chips(&self) -> usize {
        self.primary.len() * self.secondary.len()
    }
    fn carrier_hz(&self) -> f64 {
        self.carrier_hz
    }
    fn value_at(&self, code_phase_chips: f64) -> f64 {
        let (k, frac) = split_phase(code_phase_chips, self.len_chips());
        self.chip(k as i64) * self.modulation.subcarrier(frac)
    }
}

/// Complex-valued evaluation for signals whose subcarrier is complex (BeiDou B1C pilot
/// QMBOC). Real signals return a zero imaginary part.
pub trait ComplexSpreadingCode: SpreadingCode {
    /// Complex baseband value at `code_phase_chips` (wrapped internally).
    fn complex_at(&self, code_phase_chips: f64) -> Cf64;
}

impl ComplexSpreadingCode for SignalCode {
    fn complex_at(&self, code_phase_chips: f64) -> Cf64 {
        Cf64::new(self.value_at(code_phase_chips), 0.0)
    }
}

/// Periodic autocorrelation of a `±1` sequence at integer lag `lag` (unnormalised sum).
pub fn periodic_autocorrelation(chips: &[i8], lag: usize) -> i64 {
    let n = chips.len();
    (0..n)
        .map(|k| i64::from(chips[k]) * i64::from(chips[(k + lag) % n]))
        .sum()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn hex_expansion_follows_galileo_annex_c2_example() {
        // Galileo OS SIS ICD Table 105: 10 chips 1110110001 are written "EC4".
        let bits = hex_to_bits("EC4", 10).unwrap();
        assert_eq!(bits, vec![1, 1, 1, 0, 1, 1, 0, 0, 0, 1]);
        assert!(hex_to_bits("EC4", 13).is_err());
        assert!(hex_to_bits("EG4", 10).is_err());
    }

    #[test]
    fn secondary_cs25_matches_icd_binary_example() {
        // Galileo OS SIS ICD §3.5.1 prints CS25_1 = 380AD90 and its binary form.
        let bits = hex_to_bits("380AD90", 25).unwrap();
        // PIN-SCOPE:    the binary form of Galileo CS25_1 = 380AD90 (OS SIS ICD §3.5.1).
        // PIN-EXCLUDES: nothing — the ICD's own worked value for this secondary code.
        let want = "0011100000001010110110010";
        let got: String = bits.iter().map(|b| char::from(b'0' + b)).collect();
        assert_eq!(got, want);
    }

    #[test]
    fn phase_wraps_and_fraction_is_in_chip() {
        let c = SignalCode::new("t", 1.0, 1.0, vec![1, -1, 1], vec![], Modulation::Bpsk);
        assert_eq!(c.value_at(1.5), -1.0);
        assert_eq!(c.value_at(-1.5), -1.0);
        assert_eq!(c.value_at(3.0 + 0.25), 1.0);
        assert_eq!(c.value_at(-1e-18), 1.0);
    }

    #[test]
    fn boc_subcarrier_halves() {
        assert_eq!(square_subcarrier(1, 0.0), 1.0);
        assert_eq!(square_subcarrier(1, 0.49), 1.0);
        assert_eq!(square_subcarrier(1, 0.5), -1.0);
        assert_eq!(square_subcarrier(6, 1.0 / 12.0 + 1e-9), -1.0);
        assert_eq!(square_subcarrier(6, 2.0 / 12.0 + 1e-9), 1.0);
    }
}
