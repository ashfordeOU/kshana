// SPDX-License-Identifier: AGPL-3.0-only
//! GPS L1 C/A, L1C (L1CP, L1CD, L1CO), L5 (I5, Q5) and L2C (CM, CL) spreading codes.
//!
//! References: IS-GPS-200N (01-AUG-2022) for L1 C/A and L2C; IS-GPS-800J (01-AUG-2022)
//! for L1C; IS-GPS-705J (01-AUG-2022) for L5. Validation status is on each constructor.

use super::beidou::legendre;
use super::tables::{L1cRow, L1coRow, L1C_D, L1C_O, L1C_P, L2C_STATES, L5_PHASES};
use super::{bipolar, Modulation, SignalCode, SignalError};
use crate::iq::DataModulation;
use crate::sdr::CaCode;

/// GPS L1 carrier frequency (Hz).
pub const L1_HZ: f64 = 1_575_420_000.0;
/// GPS L2 carrier frequency (Hz).
pub const L2_HZ: f64 = 1_227_600_000.0;
/// GPS L5 carrier frequency (Hz).
pub const L5_HZ: f64 = 1_176_450_000.0;
/// L1C chip rate, L1CP and L1CD (chips/s).
pub const L1C_CHIP_RATE_HZ: f64 = 1_023_000.0;
/// L1CP / L1CD ranging-code length (chips, 10 ms).
pub const L1C_CODE_LEN: usize = 10_230;
/// Length of the Legendre sequence the L1C Weil codes are built on (IS-GPS-800J §3.2.2.1.1).
pub const L1C_WEIL_LEN: usize = 10_223;
/// The 7-chip expansion sequence inserted into every L1C Weil code (IS-GPS-800J §3.2.2.1.1).
pub const L1C_EXPANSION: [u8; 7] = [0, 1, 1, 0, 1, 0, 0];
/// L1CO overlay-code length (bits, 18 s at 100 bit/s): one bit per L1CP code period.
pub const L1C_OVERLAY_LEN: usize = 1800;
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
    )
    .with_data_modulation(DataModulation::Lnav))
}

// --- L1C ------------------------------------------------------------------------------

/// The L1C Weil code `W(t; w) = L(t) xor L((t + w) mod 10223)`, `t = 0..=10222`, over the
/// Legendre sequence `L` of length 10223 (IS-GPS-800J §3.2.2.1.1), logic bits.
pub fn l1c_weil(w: u16) -> Vec<u8> {
    let l = legendre(L1C_WEIL_LEN);
    let w = w as usize % L1C_WEIL_LEN;
    (0..L1C_WEIL_LEN)
        .map(|t| l[t] ^ l[(t + w) % L1C_WEIL_LEN])
        .collect()
}

/// An L1C ranging code (L1CP or L1CD), 10230 logic bits, from Weil index `w` and insertion
/// index `p` (IS-GPS-800J §3.2.2.1.1): `W(t; w)` for `t = 0..=p-2`, the expansion
/// sequence `0110100` at `t = p-1..=p+5`, then `W(t - 7; w)` up to `t = 10229`.
///
/// # Panics
/// If `p` is outside `1..=10223`.
pub fn l1c_ranging_bits(w: u16, p: u16) -> Vec<u8> {
    let p = p as usize;
    assert!(
        (1..=L1C_WEIL_LEN).contains(&p),
        "L1C insertion index {p} outside 1..=10223"
    );
    let weil = l1c_weil(w);
    let mut code = Vec::with_capacity(L1C_CODE_LEN);
    code.extend_from_slice(&weil[..p - 1]);
    code.extend_from_slice(&L1C_EXPANSION);
    code.extend_from_slice(&weil[p - 1..]);
    code
}

fn l1c_row(
    table: &'static [L1cRow; 63],
    signal: &'static str,
    prn: u16,
) -> Result<&'static L1cRow, SignalError> {
    (prn as usize)
        .checked_sub(1)
        .and_then(|i| table.get(i))
        .ok_or(SignalError::UnknownPrn { signal, prn })
}

/// The L1CP (pilot) ranging code of `prn` 1..=63, logic bits (IS-GPS-800J Table 3.2-2).
pub fn l1c_p_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r = l1c_row(&L1C_P, "GPS L1CP", prn)?;
    Ok(l1c_ranging_bits(r.w, r.p))
}

/// The L1CD (data) ranging code of `prn` 1..=63, logic bits (IS-GPS-800J Table 3.2-2).
pub fn l1c_d_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r = l1c_row(&L1C_D, "GPS L1CD", prn)?;
    Ok(l1c_ranging_bits(r.w, r.p))
}

/// Run the L1CO S1 generator of IS-GPS-800J Figure 3.2-2 for `len` output bits: an
/// 11-stage register shifting from stage 1 towards stage 11, output at stage 11, stage 1
/// fed with the exclusive-or of the stages `j` whose coefficient `m_j` is 1 (`m_j` is bit
/// `j` of `s1_poly`, `m_11 = 1`). `initial` holds `n11 ... n1` with `n11` in the most
/// significant of its 11 bits, so the first output bit is that most significant bit.
pub fn l1co_s1_run(s1_poly: u16, initial: u16, len: usize) -> Vec<u8> {
    // reg[j - 1] is stage j.
    let mut reg = [0u8; 11];
    for (j, s) in reg.iter_mut().enumerate() {
        *s = ((initial >> j) & 1) as u8;
    }
    let taps: Vec<usize> = (1..=11).filter(|&j| (s1_poly >> j) & 1 == 1).collect();
    let mut out = Vec::with_capacity(len);
    for _ in 0..len {
        out.push(reg[10]);
        let fb = taps.iter().fold(0u8, |acc, &j| acc ^ reg[j - 1]);
        reg.copy_within(0..10, 1);
        reg[0] = fb;
    }
    out
}

/// The 1800-bit L1CO overlay code of `prn` 1..=63, logic bits: the S1 sequence alone, as
/// IS-GPS-800J §3.2.2.1.2 specifies for PRNs 1-63 (Table 3.2-3).
pub fn l1c_o_bits(prn: u16) -> Result<Vec<u8>, SignalError> {
    let r: &L1coRow = (prn as usize)
        .checked_sub(1)
        .and_then(|i| L1C_O.get(i))
        .ok_or(SignalError::UnknownPrn {
            signal: "GPS L1CO",
            prn,
        })?;
    Ok(l1co_s1_run(r.s1_poly, r.initial, L1C_OVERLAY_LEN))
}

/// GPS L1C data component L1CD for `prn` 1..=63: the Weil ranging code with the
/// sine-phased BOC(1,1) subcarrier, no overlay code, 100 symbol/s CNAV-2 symbols (one per
/// 10 ms code period; IS-GPS-800J §3.3). The chips are checked against the printed initial
/// and final 24 chips of Table 3.2-2 (`tests/iq_signals_gps_l1c.rs`).
pub fn l1c_d(prn: u16) -> Result<SignalCode, SignalError> {
    Ok(SignalCode::new(
        format!("GPS L1CD PRN {prn}"),
        L1C_CHIP_RATE_HZ,
        L1_HZ,
        bipolar(&l1c_d_bits(prn)?),
        vec![],
        Modulation::SineBoc { n: 1 },
    )
    .with_data_modulation(DataModulation::Symbols { symbol_s: 0.01 }))
}

/// GPS L1C pilot component L1CP for `prn` 1..=63: the Weil ranging code tiered with the
/// 1800-bit L1CO overlay code (one overlay bit per 10 ms code period, 18 s in all) and the
/// TMBOC(6,1,4/33) subcarrier ([`Modulation::Tmboc`]: BOC(6,1) symbols at positions 0, 4,
/// 6 and 29 of every 33, IS-GPS-800J §3.3). The chips are checked against Tables 3.2-2 and
/// 3.2-3 (`tests/iq_signals_gps_l1c.rs`); the TMBOC pattern is MODELLED from the §3.3 text.
pub fn l1c_p(prn: u16) -> Result<SignalCode, SignalError> {
    Ok(SignalCode::new(
        format!("GPS L1CP PRN {prn}"),
        L1C_CHIP_RATE_HZ,
        L1_HZ,
        bipolar(&l1c_p_bits(prn)?),
        bipolar(&l1c_o_bits(prn)?),
        Modulation::Tmboc,
    )
    .with_data_modulation(DataModulation::Pilot))
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
    )
    .with_data_modulation(DataModulation::Symbols { symbol_s: 0.01 }))
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
    )
    .with_data_modulation(DataModulation::Pilot))
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
    )
    .with_data_modulation(DataModulation::Symbols { symbol_s: 0.02 }))
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
    )
    .with_data_modulation(DataModulation::Pilot))
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
    )
    .with_data_modulation(DataModulation::NotModelled))
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
    fn l1c_prn_range_is_1_to_63() {
        assert!(l1c_p(0).is_err());
        assert!(l1c_d(64).is_err());
        assert!(l1c_o_bits(64).is_err());
        assert!(l1c_p_bits(63).is_ok() && l1c_o_bits(1).is_ok());
    }

    #[test]
    fn l1c_expansion_is_inserted_before_the_pth_weil_chip() {
        // Structure of IS-GPS-800J §3.2.2.1.1 on arbitrary indices (not a table check).
        let weil = l1c_weil(1234);
        assert_eq!(weil.len(), L1C_WEIL_LEN);
        for p in [1u16, 2, 412, 10_223] {
            let c = l1c_ranging_bits(1234, p);
            let p = p as usize;
            assert_eq!(c.len(), L1C_CODE_LEN);
            assert_eq!(&c[..p - 1], &weil[..p - 1]);
            assert_eq!(&c[p - 1..p + 6], &L1C_EXPANSION);
            assert_eq!(&c[p + 6..], &weil[p - 1..]);
        }
    }

    #[test]
    fn l1co_register_emits_its_initial_state_first_and_has_period_2047() {
        // Structure of Figure 3.2-2: the first 11 output bits are n11 ... n1 (the initial
        // state, most significant first). 1 + x^9 + x^11 is the ICD's own S2 polynomial;
        // as a primitive polynomial its sequence repeats after 2047 bits and not before.
        let init = 0b101_1001_0111u16;
        let poly = (1 << 11) | (1 << 9) | 1;
        let out = l1co_s1_run(poly, init, 2047 * 2);
        let first: u16 = out[..11].iter().fold(0, |a, &b| (a << 1) | u16::from(b));
        assert_eq!(first, init);
        assert_eq!(&out[..2047], &out[2047..]);
        assert!((1..2047).all(|s| out[s..s + 11] != out[..11]));
        assert_eq!(out[..2047].iter().filter(|&&b| b == 1).count(), 1024);
    }

    #[test]
    fn l1c_components_lengths_rates_and_modulations() {
        let d = l1c_d(5).unwrap();
        let p = l1c_p(5).unwrap();
        assert_eq!(d.len_chips(), L1C_CODE_LEN);
        assert_eq!(p.len_chips(), L1C_CODE_LEN * L1C_OVERLAY_LEN);
        assert!((d.period_s() - 0.010).abs() < 1e-12);
        assert!((p.period_s() - 18.0).abs() < 1e-9);
        assert_eq!(d.modulation(), Modulation::SineBoc { n: 1 });
        assert_eq!(p.modulation(), Modulation::Tmboc);
        assert_eq!(
            d.data_modulation(),
            DataModulation::Symbols { symbol_s: 0.01 }
        );
        assert_eq!(p.data_modulation(), DataModulation::Pilot);
        assert_eq!(p.carrier_hz(), L1_HZ);
        // The overlay holds one bit per 10 ms primary period.
        let o = l1c_o_bits(5).unwrap();
        let m = o.iter().position(|&b| b != o[0]).unwrap() as i64;
        let k = m * L1C_CODE_LEN as i64 + 17;
        assert_eq!(p.chip(k), -p.chip(17));
    }

    #[test]
    fn l1cp_tmboc_symbols_follow_the_33_slot_pattern() {
        // IS-GPS-800J §3.3: BOC(6,1) at t = 0, 4, 6, 29, 33, 37, 39, 62, ..., 10197, 10201,
        // 10203, 10226 of each code period; BOC(1,1) elsewhere. MODELLED from the text.
        let p = l1c_p(9).unwrap();
        let listed = [
            0usize, 4, 6, 29, 33, 37, 39, 62, 10_197, 10_201, 10_203, 10_226,
        ];
        let boc61: Vec<usize> = (0..L1C_CODE_LEN)
            .filter(|&t| super::super::tmboc_is_boc61(t))
            .collect();
        assert_eq!(boc61.len(), 4 * 310);
        for t in listed {
            assert!(boc61.contains(&t), "t = {t}");
        }
        // Chip-level waveform: 12 half-periods on a BOC(6,1) symbol, 2 on BOC(1,1).
        let sign_changes = |t: usize| {
            let v: Vec<f64> = (0..24)
                .map(|s| p.value_at(t as f64 + (s as f64 + 0.5) / 24.0))
                .collect();
            v.windows(2).filter(|w| w[0] != w[1]).count()
        };
        for period in [0usize, 1, 1799] {
            let base = period * L1C_CODE_LEN;
            assert_eq!(sign_changes(base), 11);
            assert_eq!(sign_changes(base + 29), 11);
            assert_eq!(sign_changes(base + 1), 1);
            assert_eq!(sign_changes(base + 32), 1);
            assert_eq!(sign_changes(base + 33), 11);
        }
        // Sine phasing: every symbol starts positive relative to its chip value.
        for t in [0usize, 1, 4, 5] {
            assert_eq!(p.value_at(t as f64 + 0.01), p.chip(t as i64));
        }
    }

    #[test]
    fn l1cp_tmboc_power_is_4_33_boc61_and_29_33_boc11_from_the_waveform() {
        // Project one full code period of the L1CP waveform on the BOC(6,1) and BOC(1,1)
        // replicas of the same code. The two square subcarriers are orthogonal over a chip,
        // so the projections are the shares of symbols of each kind: 4/33 and 29/33.
        const SPC: usize = 48;
        let p = l1c_p(21).unwrap();
        let (mut a6, mut a1, mut e) = (0.0, 0.0, 0.0);
        for k in 0..L1C_CODE_LEN {
            let c = p.chip(k as i64);
            for s in 0..SPC {
                let f = (s as f64 + 0.5) / SPC as f64;
                let v = p.value_at(k as f64 + f);
                a6 += v * c * crate::iq::signals::square_subcarrier(6, f);
                a1 += v * c * crate::iq::signals::square_subcarrier(1, f);
                e += v * v;
            }
        }
        let n = (L1C_CODE_LEN * SPC) as f64;
        assert!((a6 / n - 4.0 / 33.0).abs() < 1e-12, "{}", a6 / n);
        assert!((a1 / n - 29.0 / 33.0).abs() < 1e-12, "{}", a1 / n);
        assert!((e / n - 1.0).abs() < 1e-12);
    }

    #[test]
    fn non_tmboc_modulations_ignore_the_chip_index() {
        for m in [
            Modulation::Bpsk,
            Modulation::SineBoc { n: 1 },
            Modulation::Cboc { plus: true },
        ] {
            for chip in [0usize, 4, 29, 33] {
                for f in [0.03, 0.3, 0.7] {
                    assert_eq!(m.subcarrier_at(chip, f), m.subcarrier(f));
                }
            }
        }
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
