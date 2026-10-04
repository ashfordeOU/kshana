// SPDX-License-Identifier: AGPL-3.0-only
//! GLONASS L1OF (open, FDMA) ranging code.
//!
//! Reference: GLONASS Interface Control Document, Edition 5.1 (2008), Russian Institute
//! of Space Device Engineering, §3.3.1 (carrier frequencies) and §3.3.2.1 (ranging code).

use super::{bipolar, Modulation, SignalCode, SignalError};

/// L1 sub-band base frequency f01 (Hz).
pub const L1_BASE_HZ: f64 = 1_602_000_000.0;
/// L1 channel spacing Δf1 (Hz).
pub const L1_SPACING_HZ: f64 = 562_500.0;
/// Ranging-code chip rate (chips/s).
pub const CHIP_RATE_HZ: f64 = 511_000.0;
/// Ranging-code length (chips, 1 ms).
pub const CODE_LEN: usize = 511;
/// Lowest frequency channel in ICD Table 3.1.
pub const MIN_CHANNEL: i8 = -7;
/// Highest frequency channel in ICD Table 3.1.
pub const MAX_CHANNEL: i8 = 6;

/// L1 carrier of frequency channel `k`: `f = 1602 MHz + k · 0.5625 MHz`.
pub fn l1_carrier_hz(k: i8) -> Result<f64, SignalError> {
    if !(MIN_CHANNEL..=MAX_CHANNEL).contains(&k) {
        return Err(SignalError::FrequencyChannel(k));
    }
    Ok(L1_BASE_HZ + f64::from(k) * L1_SPACING_HZ)
}

/// The 511-chip ranging code, logic bits: the m-sequence of `G(X) = 1 + X^5 + X^9` from
/// the all-ones state, read at the 7th stage of the 9-stage register (ICD §3.3.2.1).
pub fn ranging_code_bits() -> Vec<u8> {
    let mut r = [1u8; 9];
    let mut out = Vec::with_capacity(CODE_LEN);
    for _ in 0..CODE_LEN {
        out.push(r[6]);
        let fb = r[4] ^ r[8];
        r.copy_within(0..8, 1);
        r[0] = fb;
    }
    out
}

/// GLONASS L1OF signal on frequency channel `k` (-7..=6). Every satellite transmits the
/// same code; satellites are separated by carrier. VALIDATED: the code begins with the ICD's
/// stated group `111111100` and has the m-sequence balance and two-valued autocorrelation.
/// The 100 Hz meander and navigation data are not applied.
pub fn l1of(k: i8) -> Result<SignalCode, SignalError> {
    let f = l1_carrier_hz(k)?;
    Ok(SignalCode::new(
        format!("GLONASS L1OF k={k:+}"),
        CHIP_RATE_HZ,
        f,
        bipolar(&ranging_code_bits()),
        vec![],
        Modulation::Bpsk,
    ))
}
