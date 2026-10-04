// SPDX-License-Identifier: AGPL-3.0-only
//! GPS L1 C/A, L5 (I5, Q5) and L2C (CM, CL) spreading codes.
//!
//! References: IS-GPS-200N (01-AUG-2022) for L1 C/A and L2C; IS-GPS-705J (01-AUG-2022)
//! for L5. Validation status is on each constructor.

use super::tables::{L2C_STATES, L5_PHASES};
use super::{bipolar, Modulation, SignalCode, SignalError};
use crate::sdr::CaCode;

/// GPS L1 carrier frequency (Hz).
pub const L1_HZ: f64 = 1_575_420_000.0;
/// GPS L2 carrier frequency (Hz).
pub const L2_HZ: f64 = 1_227_600_000.0;
/// GPS L5 carrier frequency (Hz).
pub const L5_HZ: f64 = 1_176_450_000.0;
/// L5 chip rate (chips/s).
pub const L5_CHIP_RATE_HZ: f64 = 10_230_000.0;
/// L5 primary-code length (chips).
pub const L5_CODE_LEN: usize = 10_230;
/// L2 CM and L2 CL chip rate, each (chips/s).
pub const L2C_CHIP_RATE_HZ: f64 = 511_500.0;
/// L2 CM code length (chips, 20 ms).
pub const L2_CM_LEN: usize = 10_230;
/// L2 CL code length (chips, 1.5 s).
pub const L2_CL_LEN: usize = 767_250;
/// The 10-bit Neuman-Hofman code on I5 (IS-GPS-705J §3.3.3.1.2), logic bits.
pub const NH10: [u8; 10] = [0, 0, 0, 0, 1, 1, 0, 1, 0, 1];
/// The 20-bit Neuman-Hofman code on Q5 (IS-GPS-705J §3.3.2.3), logic bits.
pub const NH20: [u8; 20] = [0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 0, 1, 1, 1, 0];
/// The L2C code-generator polynomial 1112225171 (octal), degree 27 (IS-GPS-200N §3.3.2.4).
pub const L2C_POLY_OCTAL: u32 = 0o1112225171;

/// GPS L1 C/A code for `prn` 1..=32: a wrapper over [`crate::sdr::CaCode`], whose chips are
/// VALIDATED there against the IS-GPS-200 first-10-chips octal table.
pub fn l1ca(prn: u16) -> Result<SignalCode, SignalError> {
    let code = u8::try_from(prn)
        .ok()
        .and_then(CaCode::new)
        .ok_or(SignalError::UnknownPrn {
            signal: "GPS L1 C/A",
            prn,
        })?;
    Ok(SignalCode::new(
        format!("GPS L1 C/A PRN {prn}"),
        crate::sdr::CA_CHIP_RATE_HZ,
        L1_HZ,
        bipolar(&code.chips),
        vec![],
        Modulation::Bpsk,
    ))
}

// --- L5 -------------------------------------------------------------------------------

/// A 13-stage register as `[stage1, ..., stage13]`, stage 13 being the output.
type Reg13 = [u8; 13];

/// Register from the ICD's printed state word (stage 1 most significant, stage 13 least).
fn reg13_from_word(word: u16) -> Reg13 {
    let mut r = [0u8; 13];
    for (k, s) in r.iter_mut().enumerate() {
        *s = ((word >> (12 - k)) & 1) as u8;
    }
    r
}

fn reg13_to_word(r: &Reg13) -> u16 {
    r.iter().fold(0u16, |acc, &b| (acc << 1) | u16::from(b))
}

/// Shift a 13-stage register once with feedback from the given 1-based stages.
fn shift13(r: &mut Reg13, taps: &[usize]) {
    let fb = taps.iter().fold(0u8, |acc, &t| acc ^ r[t - 1]);
    r.copy_within(0..12, 1);
    r[0] = fb;
}

/// XA polynomial 1 + x^9 + x^10 + x^12 + x^13 (IS-GPS-705J §3.3.2.2).
const XA_TAPS: [usize; 4] = [9, 10, 12, 13];
/// XB polynomial 1 + x + x^3 + x^4 + x^6 + x^7 + x^8 + x^12 + x^13.
const XB_TAPS: [usize; 8] = [1, 3, 4, 6, 7, 8, 12, 13];

/// The XB register state word reached by advancing the all-ones state by `advance` chips,
/// in the ICD's printed convention (stage 1 most significant, stage 13 least). The ICD
/// prints both the advance and the resulting state; their agreement is a test.
pub fn l5_xb_state_after(advance: u32) -> u16 {
    let mut r = [1u8; 13];
    for _ in 0..advance {
        shift13(&mut r, &XB_TAPS);
    }
    reg13_to_word(&r)
}

/// One 10230-chip L5 primary code (logic bits) from the initial XB state word.
fn l5_primary_bits(xb_word: u16) -> Vec<u8> {
    let mut xa = [1u8; 13];
    let mut xb = reg13_from_word(xb_word);
    let mut out = Vec::with_capacity(L5_CODE_LEN);
    for k in 0..L5_CODE_LEN {
        out.push(xa[12] ^ xb[12]);
        // XA is short-cycled: reset to all ones after 8190 chips (state 8190 -> 1).
        if k % 8190 == 8189 {
            xa = [1u8; 13];
        } else {
            shift13(&mut xa, &XA_TAPS);
        }
        // XB runs its natural 8191-chip course within the 1 ms period.
        shift13(&mut xb, &XB_TAPS);
    }
    out
}

fn l5_row(signal: &'static str, prn: u16) -> Result<&'static super::tables::L5Phase, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| L5_PHASES.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// GPS L5 in-phase code I5 for `prn` 1..=210, tiered with the 10-bit Neuman-Hofman code
/// (10 ms period). VALIDATED: the generator's initial XB state equals the printed state
/// reached by the printed XB advance, and its first 13 chips equal the complement of that
/// state, for every PRN in IS-GPS-705J Tables 3-Ia, 3-Ib and 6-I.
pub fn l5_i5(prn: u16) -> Result<SignalCode, SignalError> {
    let row = l5_row("GPS L5 I5", prn)?;
    Ok(SignalCode::new(
        format!("GPS L5 I5 PRN {prn}"),
        L5_CHIP_RATE_HZ,
        L5_HZ,
        bipolar(&l5_primary_bits(row.xb_i5)),
        bipolar(&NH10),
        Modulation::Bpsk,
    ))
}

/// GPS L5 quadrature (pilot) code Q5 for `prn` 1..=210, tiered with the 20-bit
/// Neuman-Hofman code (20 ms period). VALIDATED as for [`l5_i5`].
pub fn l5_q5(prn: u16) -> Result<SignalCode, SignalError> {
    let row = l5_row("GPS L5 Q5", prn)?;
    Ok(SignalCode::new(
        format!("GPS L5 Q5 PRN {prn}"),
        L5_CHIP_RATE_HZ,
        L5_HZ,
        bipolar(&l5_primary_bits(row.xb_q5)),
        bipolar(&NH20),
        Modulation::Bpsk,
    ))
}

// --- L2C ------------------------------------------------------------------------------

/// Run the L2C modular (Galois) shift register for `chips` clocks from `state` and return
/// the logic output bits and the final state. The register shifts towards the least
/// significant bit, which is the output; when the output is 1 the polynomial's feedback
/// taps are XORed in (IS-GPS-200N Figure 3-13).
pub fn l2c_run(state: u32, chips: usize) -> (Vec<u8>, u32) {
    let fb = L2C_POLY_OCTAL >> 1;
    let mut s = state;
    let mut out = Vec::with_capacity(chips);
    for _ in 0..chips {
        let o = (s & 1) as u8;
        out.push(o);
        s >>= 1;
        if o == 1 {
            s ^= fb;
        }
    }
    (out, s)
}

fn l2c_row(
    signal: &'static str,
    prn: u16,
) -> Result<&'static super::tables::L2cStates, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| L2C_STATES.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// GPS L2 CM code (10230 chips at 511.5 kchip/s, 20 ms) for `prn` 1..=63. VALIDATED:
/// running the register from the printed initial state for 10229 clocks (to the state that
/// produces the last chip) gives the printed end state, every PRN in IS-GPS-200N Tables
/// 3-IIa/3-IIb. Navigation data (on CM) is not applied.
pub fn l2c_cm(prn: u16) -> Result<SignalCode, SignalError> {
    let row = l2c_row("GPS L2 CM", prn)?;
    let (bits, _) = l2c_run(row.cm_initial, L2_CM_LEN);
    Ok(SignalCode::new(
        format!("GPS L2 CM PRN {prn}"),
        L2C_CHIP_RATE_HZ,
        L2_HZ,
        bipolar(&bits),
        vec![],
        Modulation::Bpsk,
    ))
}

/// GPS L2 CL code (767250 chips at 511.5 kchip/s, 1.5 s) for `prn` 1..=63. VALIDATED as
/// for [`l2c_cm`] against the printed CL end states.
pub fn l2c_cl(prn: u16) -> Result<SignalCode, SignalError> {
    let row = l2c_row("GPS L2 CL", prn)?;
    let (bits, _) = l2c_run(row.cl_initial, L2_CL_LEN);
    Ok(SignalCode::new(
        format!("GPS L2 CL PRN {prn}"),
        L2C_CHIP_RATE_HZ,
        L2_HZ,
        bipolar(&bits),
        vec![],
        Modulation::Bpsk,
    ))
}

/// The transmitted L2C chip stream for `prn` 1..=63: CM and CL time-multiplexed chip by
/// chip at 1.023 Mchip/s, a CM chip first (IS-GPS-200N §3.2.2 and Figure 3-12), period
/// 1.5 s = 1 534 500 chips. The code chips follow [`l2c_cm`] and [`l2c_cl`]; the
/// interleaving order is MODELLED from the ICD text (the ICD prints no interleaved chips).
pub fn l2c(prn: u16) -> Result<SignalCode, SignalError> {
    let row = l2c_row("GPS L2C", prn)?;
    let (cm, _) = l2c_run(row.cm_initial, L2_CM_LEN);
    let (cl, _) = l2c_run(row.cl_initial, L2_CL_LEN);
    let mut bits = Vec::with_capacity(2 * L2_CL_LEN);
    for (k, &cl_bit) in cl.iter().enumerate() {
        bits.push(cm[k % L2_CM_LEN]);
        bits.push(cl_bit);
    }
    Ok(SignalCode::new(
        format!("GPS L2C PRN {prn}"),
        2.0 * L2C_CHIP_RATE_HZ,
        L2_HZ,
        bipolar(&bits),
        vec![],
        Modulation::Bpsk,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::iq::SpreadingCode;

    #[test]
    fn xb_state_word_round_trips() {
        for w in [0u16, 1, 0x1FFF, 0b0101011100100] {
            assert_eq!(reg13_to_word(&reg13_from_word(w)), w);
        }
    }

    #[test]
    fn out_of_range_prns_are_refused() {
        assert!(l1ca(0).is_err());
        assert!(l1ca(33).is_err());
        assert!(l5_i5(0).is_err());
        assert!(l5_q5(211).is_err());
        assert!(l2c_cm(64).is_err());
    }

    #[test]
    fn l1ca_wrapper_matches_sdr_code() {
        let c = l1ca(7).unwrap();
        let sdr = CaCode::new(7).unwrap();
        assert_eq!(c.len_chips(), 1023);
        for k in 0..1023 {
            assert_eq!(c.value_at(k as f64 + 0.5), sdr.bipolar[k]);
        }
    }
}
