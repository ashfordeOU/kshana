// SPDX-License-Identifier: AGPL-3.0-only
//! Navigation-message encoders beyond GPS LNAV: GPS CNAV ([`gps_cnav`]), Galileo I/NAV
//! ([`gal_inav`]) and Galileo F/NAV ([`gal_fnav`]), with the channel coding they share
//! ([`fec`]: CRC-24Q, the rate-1/2 constraint-length-7 convolutional code, block interleaving,
//! and a hard-decision Viterbi decoder used to check the encoders).
//!
//! Every message is a fixed sequence of fields, each an integer of a fixed width and least
//! significant bit (LSB) value, two's complement when signed, sent most significant bit first.
//! A [`Field`] table per message type states the layout; [`pack`] quantises physical values
//! (SI units, angles in radians) into bits and [`unpack`] reads them back. Angles the
//! interface specifications state in semicircles are converted with the value of pi they fix,
//! [`crate::gps_lnav::GPS_PI`] (IS-GPS-200 and the Galileo OS SIS ICD use the same
//! fourteen-digit value). Quantisation rounds to nearest, half away from zero, as
//! [`crate::gps_lnav::quantise`] does, and refuses a value that does not fit.
//!
//! Bits are `u8` values `0` or `1`, one per element, as [`crate::iq::scene`] uses for LNAV.
//!
//! Status: MODELLED. The layouts are transcribed from IS-GPS-200 Appendix III (CNAV) and the
//! Galileo OS SIS ICD sections 4.2 and 4.3; the tests check internal consistency (round
//! trips to half an LSB, field start bits against the specification's bit numbers, CRC and
//! convolutional-code known answers from public references), not agreement with a third-party
//! decoder or with broadcast data.

pub mod fec;
pub mod gal_fnav;
pub mod gal_inav;
pub mod galileo;
pub mod gps_cnav;

use crate::gps_lnav::GPS_PI;

/// How a field's raw integer maps to a physical value: `value = raw * lsb`, times
/// [`GPS_PI`] when the specification's unit is the semicircle.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Field {
    /// Field name.
    pub name: &'static str,
    /// Width in bits.
    pub bits: u32,
    /// Two's complement signed.
    pub signed: bool,
    /// Value of one LSB in the specification's unit (seconds, metres, semicircles, ...).
    pub lsb: f64,
    /// The specification's unit is the semicircle (the physical value is in radians).
    pub semicircles: bool,
}

/// A field with an integer meaning (flags, indices, identifiers): LSB 1, unsigned.
pub(crate) const fn int(name: &'static str, bits: u32) -> Field {
    Field {
        name,
        bits,
        signed: false,
        lsb: 1.0,
        semicircles: false,
    }
}

/// A scaled field with LSB `2^e` in its specification unit.
pub(crate) const fn p2(name: &'static str, bits: u32, signed: bool, lsb: f64) -> Field {
    Field {
        name,
        bits,
        signed,
        lsb,
        semicircles: false,
    }
}

/// A scaled angular field in semicircles (physical value in radians).
pub(crate) const fn sc(name: &'static str, bits: u32, signed: bool, lsb: f64) -> Field {
    Field {
        name,
        bits,
        signed,
        lsb,
        semicircles: true,
    }
}

impl Field {
    /// The LSB in physical units (radians for semicircle fields).
    pub fn lsb_si(&self) -> f64 {
        if self.semicircles {
            self.lsb * GPS_PI
        } else {
            self.lsb
        }
    }

    /// Quantise physical `value` to this field's raw bits (round to nearest, two's
    /// complement when signed). Errors when the value does not fit or is not finite.
    pub fn quantise(&self, value: f64) -> Result<u64, String> {
        let q = (value / self.lsb_si()).round();
        let (lo, hi) = if self.signed {
            (
                -(2f64.powi(self.bits as i32 - 1)),
                2f64.powi(self.bits as i32 - 1) - 1.0,
            )
        } else {
            (0.0, 2f64.powi(self.bits as i32) - 1.0)
        };
        if !(q >= lo && q <= hi) {
            return Err(format!(
                "{}: {value:e} at LSB {:e} does not fit {} {} bits",
                self.name,
                self.lsb_si(),
                self.bits,
                if self.signed { "signed" } else { "unsigned" }
            ));
        }
        Ok((q as i64 as u64) & mask(self.bits))
    }

    /// The raw bits as a signed or unsigned integer.
    pub fn integer(&self, raw: u64) -> i64 {
        if self.signed && self.bits < 64 && (raw >> (self.bits - 1)) & 1 == 1 {
            (raw | !mask(self.bits)) as i64
        } else {
            raw as i64
        }
    }

    /// The physical value of raw bits.
    pub fn value(&self, raw: u64) -> f64 {
        self.integer(raw) as f64 * self.lsb_si()
    }
}

fn mask(bits: u32) -> u64 {
    if bits >= 64 {
        u64::MAX
    } else {
        (1u64 << bits) - 1
    }
}

/// One field read out of a message.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Decoded {
    /// Field name.
    pub name: &'static str,
    /// Raw bits.
    pub raw: u64,
    /// Signed or unsigned integer.
    pub integer: i64,
    /// Physical value (SI, radians for semicircle fields).
    pub value: f64,
}

/// Total width of a layout.
pub fn layout_bits(layout: &[Field]) -> u32 {
    layout.iter().map(|f| f.bits).sum()
}

/// The first bit of field `name` in `layout`, numbered from `first_bit` for the layout's
/// first bit (so start bits can be compared with a specification's bit numbering).
pub fn start_bit(layout: &[Field], name: &str, first_bit: u32) -> Option<u32> {
    let mut at = first_bit;
    for f in layout {
        if f.name == name {
            return Some(at);
        }
        at += f.bits;
    }
    None
}

/// Append `bits` bits of `v`, most significant first.
pub fn push_bits(out: &mut Vec<u8>, v: u64, bits: u32) {
    for i in (0..bits).rev() {
        out.push(((v >> i) & 1) as u8);
    }
}

/// Read `bits` bits starting at `at`, most significant first.
pub fn read_bits(bits: &[u8], at: usize, n: u32) -> u64 {
    bits[at..at + n as usize]
        .iter()
        .fold(0u64, |v, &b| (v << 1) | u64::from(b & 1))
}

/// Pack physical values into bits per `layout`. `value(name)` gives each field's physical
/// value (SI units, radians for semicircle fields; the integer itself for integer fields).
pub fn pack(
    layout: &[Field],
    value: impl Fn(&str) -> Result<f64, String>,
) -> Result<Vec<u8>, String> {
    let mut out = Vec::with_capacity(layout_bits(layout) as usize);
    for f in layout {
        let raw = f.quantise(value(f.name)?)?;
        push_bits(&mut out, raw, f.bits);
    }
    Ok(out)
}

/// Read every field of `layout` from `bits` (which must hold at least the layout's width).
pub fn unpack(layout: &[Field], bits: &[u8]) -> Result<Vec<Decoded>, String> {
    let need = layout_bits(layout) as usize;
    if bits.len() < need {
        return Err(format!("{} bits, layout needs {need}", bits.len()));
    }
    let mut at = 0usize;
    Ok(layout
        .iter()
        .map(|f| {
            let raw = read_bits(bits, at, f.bits);
            at += f.bits as usize;
            Decoded {
                name: f.name,
                raw,
                integer: f.integer(raw),
                value: f.value(raw),
            }
        })
        .collect())
}

/// The decoded field `name`, or an error naming it.
pub fn get<'a>(fields: &'a [Decoded], name: &str) -> Result<&'a Decoded, String> {
    fields
        .iter()
        .find(|d| d.name == name)
        .ok_or_else(|| format!("no field {name}"))
}

/// Two raised to `e`, exactly (for LSB constants).
pub(crate) const fn pow2(e: i32) -> f64 {
    // Built from the IEEE 754 exponent so it is a `const fn` and exact for -1022..=1023.
    f64::from_bits(((1023 + e) as u64) << 52)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn pow2_is_exact() {
        for e in -100..100 {
            assert_eq!(pow2(e), 2f64.powi(e), "{e}");
        }
    }

    #[test]
    fn quantise_rounds_signs_and_refuses_overflow() {
        let f = p2("x", 8, true, pow2(-5));
        assert_eq!(f.quantise(-(pow2(-5))).unwrap(), 0xFF);
        assert_eq!(f.integer(0xFF), -1);
        assert_eq!(f.value(0x80), -4.0);
        assert!(f.quantise(4.0).is_err());
        assert!(f.quantise(f64::NAN).is_err());
        let u = int("u", 3);
        assert!(u.quantise(-1.0).is_err());
        assert_eq!(u.quantise(7.0).unwrap(), 7);
        let a = sc("a", 32, true, pow2(-31));
        assert!((a.value(a.quantise(1.0).unwrap()) - 1.0).abs() <= 0.5 * a.lsb_si());
    }

    #[test]
    fn pack_unpack_round_trip() {
        let layout = [int("a", 3), p2("b", 10, true, 0.5), int("c", 1)];
        let bits = pack(&layout, |n| {
            Ok(match n {
                "a" => 5.0,
                "b" => -3.4,
                _ => 1.0,
            })
        })
        .unwrap();
        assert_eq!(bits.len(), 14);
        let d = unpack(&layout, &bits).unwrap();
        assert_eq!(get(&d, "a").unwrap().integer, 5);
        assert_eq!(get(&d, "b").unwrap().value, -3.5);
        assert_eq!(start_bit(&layout, "c", 1), Some(14));
    }
}
