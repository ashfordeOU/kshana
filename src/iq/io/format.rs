// SPDX-License-Identifier: AGPL-3.0-only
//! Sample encodings on disk: how the bytes of a recording map to sample values.
//!
//! A [`SampleFormat`] is an element [`Encoding`] (8- or 16-bit signed integer, unsigned
//! 8-bit, 12-bit in a 16-bit word, 32-bit float, packed 4-bit, packed 2-bit or one 2-bit
//! code per byte) plus the [`Components`] layout (I then Q, Q then I, or a single
//! real-valued component per sample). Decoded values are the stored codes as `f64`
//! (integers are *not* normalised), multiplied by the reader's scale; this matches
//! [`crate::realdata::iqif::load_iq`], whose decoder [`decode_samples`] reuses for `ci8`
//! and `ci16_le`.
//!
//! ## Packed 2-bit layouts
//!
//! Many GNSS front ends quantise to two bits and pack four 2-bit elements into a byte.
//! Two choices vary between devices and both are parameters here rather than guesses:
//!
//! * the **code-to-level mapping** ([`TwoBitCode`]), each level being one of ±1, ±3:
//!
//!   | 2-bit code `b1 b0` | `00` | `01` | `10` | `11` |
//!   |---|---|---|---|---|
//!   | [`TwoBitCode::TwosComplement`] (level = 2·s + 1, s the two's-complement value) | +1 | +3 | −3 | −1 |
//!   | [`TwoBitCode::SignMagnitude`] (`b1` sign, 1 = negative; `b0` magnitude, 1 = 3) | +1 | +3 | −1 | −3 |
//!   | [`TwoBitCode::OffsetBinary`] (level = 2·c − 3) | −3 | −1 | +1 | +3 |
//!
//! * the **order within a byte** ([`BitOrder`]): [`BitOrder::MsbFirst`] puts the first
//!   element in bits 7–6, then 5–4, 3–2, 1–0; [`BitOrder::LsbFirst`] puts it in bits
//!   1–0, then 3–2, 5–4, 7–6.
//!
//! Elements are consumed in stream order, so a complex 2-bit byte holds two samples
//! (I₀ Q₀ I₁ Q₁ in packing order, or Q first for [`Components::Qi`]) and a real 2-bit
//! byte holds four. Check the mapping against the front end's datasheet: picking the
//! wrong one flips the sign of a component or swaps the inner and outer levels.
//!
//! [`Encoding::TwoBitPerByte`] stores one 2-bit code per byte, in bits 1–0 (bit 1 the high
//! bit of the code, so sign for [`TwoBitCode::SignMagnitude`]); the upper six bits are
//! ignored on reading and written as zero. Recorders that put sign and magnitude in other
//! bit positions need converting first.
//!
//! ## Other integer layouts
//!
//! * **4-bit** ([`Encoding::I4`], [`Encoding::U4`]): two elements per byte, the first in
//!   bits 7–4 ([`BitOrder::MsbFirst`]) or bits 3–0 ([`BitOrder::LsbFirst`]).
//! * **Unsigned (offset-binary)** codes ([`Encoding::U4`], [`Encoding::U8`]) decode to the
//!   odd symmetric levels `2c − (2ⁿ − 1)` (−255, −253, …, +255 for 8 bits), the convention
//!   of the 2-bit offset-binary mapping above and of the ION SDR reader
//!   ([`crate::realdata::ion_sdr`]). These are the mid-rise levels of the converter, so a
//!   zero-mean input stays zero-mean (an RTL-style `cu8` file read as `c − 128` carries a
//!   −½ LSB DC term); the factor two keeps every level an integer. Divide by 2 (`--scale`)
//!   to get the familiar `c − 127.5`.
//! * **12-bit in 16** ([`Encoding::I12`]): a two's-complement 12-bit value in a 16-bit word
//!   of either byte order, either right-justified (bits 11–0, the upper four bits ignored on
//!   reading and written as sign extension) or left-justified (bits 15–4, the low four bits
//!   ignored on reading and written as zero). Values decode to −2048…2047 either way.

use crate::iq::{Cf64, IqError};

/// How a 2-bit code maps to a quantisation level (±1, ±3). See the module table.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum TwoBitCode {
    /// Two's-complement code `s` ∈ {0, 1, −2, −1}, level `2·s + 1`: 00→+1, 01→+3,
    /// 10→−3, 11→−1.
    TwosComplement,
    /// High bit is the sign (1 = negative), low bit the magnitude (1 = 3, 0 = 1):
    /// 00→+1, 01→+3, 10→−1, 11→−3.
    SignMagnitude,
    /// Unsigned code `c` offset to level `2·c − 3`: 00→−3, 01→−1, 10→+1, 11→+3.
    OffsetBinary,
}

impl TwoBitCode {
    const fn table(self) -> [i8; 4] {
        match self {
            TwoBitCode::TwosComplement => [1, 3, -3, -1],
            TwoBitCode::SignMagnitude => [1, 3, -1, -3],
            TwoBitCode::OffsetBinary => [-3, -1, 1, 3],
        }
    }

    /// The level of 2-bit code `c` (only the low two bits of `c` are used).
    pub fn level(self, c: u8) -> i8 {
        self.table()[(c & 3) as usize]
    }

    /// The code of the level nearest `v` (decision thresholds at −2, 0 and +2; a value
    /// exactly on a threshold goes to the level above it).
    pub fn code(self, v: f64) -> u8 {
        let level: i8 = if v >= 2.0 {
            3
        } else if v >= 0.0 {
            1
        } else if v >= -2.0 {
            -1
        } else {
            -3
        };
        self.table()
            .iter()
            .position(|&l| l == level)
            .expect("every level appears in each table") as u8
    }

    fn tag(self) -> &'static str {
        match self {
            TwoBitCode::TwosComplement => "tc",
            TwoBitCode::SignMagnitude => "sm",
            TwoBitCode::OffsetBinary => "ob",
        }
    }
}

/// Where the first of the four 2-bit elements of a byte sits.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum BitOrder {
    /// First element in bits 7–6.
    MsbFirst,
    /// First element in bits 1–0.
    LsbFirst,
}

impl BitOrder {
    /// The bit shift of 2-bit element `slot` (0..4) of a byte.
    pub fn shift(self, slot: u8) -> u8 {
        self.shift_for(2, slot)
    }

    /// The bit shift of element `slot` (0..8/bits) of a byte packing `bits`-bit elements.
    pub fn shift_for(self, bits: u8, slot: u8) -> u8 {
        match self {
            BitOrder::MsbFirst => 8 - bits * (slot + 1),
            BitOrder::LsbFirst => bits * slot,
        }
    }

    fn tag(self) -> &'static str {
        match self {
            BitOrder::MsbFirst => "msb",
            BitOrder::LsbFirst => "lsb",
        }
    }
}

/// Byte order of a 16-bit word.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Endian {
    /// Least significant byte first.
    Little,
    /// Most significant byte first.
    Big,
}

/// Where a 12-bit value sits in its 16-bit word.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Justify {
    /// Bits 15–4 (the value times 16; low four bits ignored).
    Left,
    /// Bits 11–0 (upper four bits ignored; written as sign extension).
    Right,
}

/// How one element (one component of one sample) is stored.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Encoding {
    /// 8-bit signed integer.
    I8,
    /// 16-bit signed integer, little-endian.
    I16Le,
    /// 16-bit signed integer, big-endian.
    I16Be,
    /// 32-bit IEEE-754 float, little-endian.
    F32Le,
    /// 32-bit IEEE-754 float, big-endian.
    F32Be,
    /// Packed 2-bit elements, four per byte.
    TwoBit {
        /// Code-to-level mapping.
        code: TwoBitCode,
        /// Position of the first element within a byte.
        order: BitOrder,
    },
    /// One 2-bit code per byte, in bits 1–0.
    TwoBitPerByte {
        /// Code-to-level mapping.
        code: TwoBitCode,
    },
    /// Packed 4-bit two's-complement elements (−8…7), two per byte.
    I4 {
        /// Position of the first element within a byte.
        order: BitOrder,
    },
    /// Packed 4-bit offset-binary elements, two per byte, decoded to `2c − 15`.
    U4 {
        /// Position of the first element within a byte.
        order: BitOrder,
    },
    /// 8-bit offset-binary (unsigned) elements, decoded to `2c − 255`.
    U8,
    /// A 12-bit two's-complement value in a 16-bit word.
    I12 {
        /// Byte order of the word.
        endian: Endian,
        /// Where the value sits in the word.
        justify: Justify,
    },
}

impl Encoding {
    /// Bits per element.
    pub fn bits(self) -> usize {
        match self {
            Encoding::I8 => 8,
            Encoding::I16Le | Encoding::I16Be => 16,
            Encoding::F32Le | Encoding::F32Be => 32,
            Encoding::TwoBit { .. } => 2,
            Encoding::I4 { .. } | Encoding::U4 { .. } => 4,
            Encoding::TwoBitPerByte { .. } | Encoding::U8 => 8,
            Encoding::I12 { .. } => 16,
        }
    }

    /// Bytes read or written as one unit: the element size, or one byte for the packed
    /// sub-byte encodings.
    pub fn unit_bytes(self) -> usize {
        self.bits().div_ceil(8)
    }

    /// For the packed sub-byte encodings (2- and 4-bit), the element width in bits;
    /// `None` for the byte-aligned ones.
    pub(crate) fn packed_bits(self) -> Option<u8> {
        match self {
            Encoding::TwoBit { .. } => Some(2),
            Encoding::I4 { .. } | Encoding::U4 { .. } => Some(4),
            _ => None,
        }
    }

    /// The bit shift of element `slot` of a byte, for a packed encoding.
    pub(crate) fn packed_shift(self, slot: u8) -> u8 {
        match self {
            Encoding::TwoBit { order, .. } => order.shift_for(2, slot),
            Encoding::I4 { order } | Encoding::U4 { order } => order.shift_for(4, slot),
            _ => unreachable!("only packed encodings have slots"),
        }
    }

    /// The level of packed code `c` (low bits used), for a packed encoding.
    fn packed_level(self, c: u8) -> f64 {
        match self {
            Encoding::TwoBit { code, .. } => code.level(c) as f64,
            Encoding::I4 { .. } => (((c & 0x0f) << 4) as i8 >> 4) as f64,
            Encoding::U4 { .. } => 2.0 * (c & 0x0f) as f64 - 15.0,
            _ => unreachable!("only packed encodings have codes"),
        }
    }

    /// The packed code nearest `v` and whether it saturated, for a packed encoding.
    /// 2-bit quantisation never counts as saturation (its outer levels are decision
    /// regions, see [`TwoBitCode::code`]).
    pub(crate) fn packed_code(self, v: f64) -> (u8, bool) {
        match self {
            Encoding::TwoBit { code, .. } => (code.code(v), false),
            Encoding::I4 { .. } => {
                let (q, c) = quantise(v, -8.0, 7.0);
                ((q as i8 as u8) & 0x0f, c)
            }
            Encoding::U4 { .. } => {
                let (q, c) = quantise((v + 15.0) / 2.0, 0.0, 15.0);
                (q as u8, c)
            }
            _ => unreachable!("only packed encodings have codes"),
        }
    }
}

/// Which components a sample carries, in storage order.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub enum Components {
    /// Complex: I then Q.
    Iq,
    /// Complex: Q then I.
    Qi,
    /// Real-valued (for example a real IF recording). Decoded samples have `im = 0`.
    Real,
}

/// A sample format: element encoding and component layout.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash)]
pub struct SampleFormat {
    /// How each element is stored.
    pub encoding: Encoding,
    /// Which components each sample carries.
    pub components: Components,
}

impl SampleFormat {
    /// Complex 8-bit signed I/Q (SigMF `ci8`).
    pub const CI8: SampleFormat = SampleFormat::iq(Encoding::I8);
    /// Complex 16-bit signed little-endian I/Q (SigMF `ci16_le`).
    pub const CI16_LE: SampleFormat = SampleFormat::iq(Encoding::I16Le);
    /// Complex 16-bit signed big-endian I/Q (SigMF `ci16_be`).
    pub const CI16_BE: SampleFormat = SampleFormat::iq(Encoding::I16Be);
    /// Complex 32-bit float little-endian I/Q (SigMF `cf32_le`).
    pub const CF32_LE: SampleFormat = SampleFormat::iq(Encoding::F32Le);
    /// Complex 32-bit float big-endian I/Q (SigMF `cf32_be`).
    pub const CF32_BE: SampleFormat = SampleFormat::iq(Encoding::F32Be);

    /// A complex I-then-Q format with encoding `e`.
    pub const fn iq(e: Encoding) -> Self {
        SampleFormat {
            encoding: e,
            components: Components::Iq,
        }
    }

    /// A real-valued format with encoding `e`.
    pub const fn real(e: Encoding) -> Self {
        SampleFormat {
            encoding: e,
            components: Components::Real,
        }
    }

    /// True for the complex layouts.
    pub fn is_complex(self) -> bool {
        self.components != Components::Real
    }

    /// Elements per sample: 2 for complex, 1 for real.
    pub fn elements_per_sample(self) -> usize {
        if self.is_complex() {
            2
        } else {
            1
        }
    }

    /// Bits per sample.
    pub fn bits_per_sample(self) -> usize {
        self.encoding.bits() * self.elements_per_sample()
    }

    /// Whole samples in `bytes` bytes of data (a trailing partial sample is not counted).
    pub fn samples_in_bytes(self, bytes: u64) -> u64 {
        bytes * 8 / self.bits_per_sample() as u64
    }

    /// The format's name. Complex formats start with `c`, real with `r`; then `i8`,
    /// `u8`, `i16_le`, `i16_be`, `f32_le`, `f32_be`, `i12<j>_<e>` for 12-bit in 16
    /// (`<j>` = `l` or `r` justified, `<e>` = `le` or `be`), `i4_<order>` / `u4_<order>`
    /// for packed 4-bit, `2<code>_<order>` for packed 2-bit (`<code>` = `tc`, `sm` or `ob`,
    /// `<order>` = `msb` or `lsb`), or `2<code>_byte` for one 2-bit code per byte; a
    /// Q-first complex format ends in `_qi`. The names of the 8-, 16- and 32-bit formats
    /// equal the SigMF `core:datatype`.
    pub fn name(self) -> String {
        let p = if self.is_complex() { "c" } else { "r" };
        let e = match self.encoding {
            Encoding::I8 => "i8".to_string(),
            Encoding::I16Le => "i16_le".to_string(),
            Encoding::I16Be => "i16_be".to_string(),
            Encoding::F32Le => "f32_le".to_string(),
            Encoding::F32Be => "f32_be".to_string(),
            Encoding::TwoBit { code, order } => format!("2{}_{}", code.tag(), order.tag()),
            Encoding::TwoBitPerByte { code } => format!("2{}_byte", code.tag()),
            Encoding::I4 { order } => format!("i4_{}", order.tag()),
            Encoding::U4 { order } => format!("u4_{}", order.tag()),
            Encoding::U8 => "u8".to_string(),
            Encoding::I12 { endian, justify } => format!(
                "i12{}_{}",
                if justify == Justify::Left { "l" } else { "r" },
                if endian == Endian::Little { "le" } else { "be" }
            ),
        };
        let s = if self.components == Components::Qi {
            "_qi"
        } else {
            ""
        };
        format!("{p}{e}{s}")
    }

    /// Parse a name written by [`SampleFormat::name`].
    pub fn parse(name: &str) -> Result<Self, IqError> {
        let bad = || {
            IqError::Format(format!(
                "unknown sample format {name:?}: expected e.g. ci8, cu8, ci16_le, ci16_be, \
                 cf32_le, cf32_be, ri16_le, ci12r_le, ci12l_be, ci4_msb, cu4_lsb, c2tc_msb, \
                 r2sm_lsb, c2sm_byte, optionally ending _qi for complex"
            ))
        };
        let (body, qi) = match name.strip_suffix("_qi") {
            Some(b) => (b, true),
            None => (name, false),
        };
        let (components, rest) = match body.split_at_checked(1) {
            Some(("c", r)) => (if qi { Components::Qi } else { Components::Iq }, r),
            Some(("r", r)) if !qi => (Components::Real, r),
            _ => return Err(bad()),
        };
        let encoding = match rest {
            "i8" => Encoding::I8,
            "i16_le" => Encoding::I16Le,
            "i16_be" => Encoding::I16Be,
            "f32_le" => Encoding::F32Le,
            "f32_be" => Encoding::F32Be,
            "u8" => Encoding::U8,
            "i12l_le" | "i12l_be" | "i12r_le" | "i12r_be" => Encoding::I12 {
                justify: if &rest[3..4] == "l" {
                    Justify::Left
                } else {
                    Justify::Right
                },
                endian: if rest.ends_with("le") {
                    Endian::Little
                } else {
                    Endian::Big
                },
            },
            other => {
                let order_of = |o: &str| match o {
                    "msb" => Some(BitOrder::MsbFirst),
                    "lsb" => Some(BitOrder::LsbFirst),
                    _ => None,
                };
                if let Some(o) = other.strip_prefix("i4_") {
                    Encoding::I4 {
                        order: order_of(o).ok_or_else(bad)?,
                    }
                } else if let Some(o) = other.strip_prefix("u4_") {
                    Encoding::U4 {
                        order: order_of(o).ok_or_else(bad)?,
                    }
                } else {
                    let t = other.strip_prefix('2').ok_or_else(bad)?;
                    let (c, o) = t.split_once('_').ok_or_else(bad)?;
                    let code = match c {
                        "tc" => TwoBitCode::TwosComplement,
                        "sm" => TwoBitCode::SignMagnitude,
                        "ob" => TwoBitCode::OffsetBinary,
                        _ => return Err(bad()),
                    };
                    if o == "byte" {
                        Encoding::TwoBitPerByte { code }
                    } else {
                        Encoding::TwoBit {
                            code,
                            order: order_of(o).ok_or_else(bad)?,
                        }
                    }
                }
            }
        };
        Ok(SampleFormat {
            encoding,
            components,
        })
    }

    /// Every format this module reads and writes, for tests and listings (each 2-bit
    /// mapping and order, each 4-bit order, each 12-bit justification and byte order,
    /// complex I/Q, complex Q/I and real).
    pub fn all() -> Vec<SampleFormat> {
        let mut encs = vec![
            Encoding::I8,
            Encoding::U8,
            Encoding::I16Le,
            Encoding::I16Be,
            Encoding::F32Le,
            Encoding::F32Be,
        ];
        for endian in [Endian::Little, Endian::Big] {
            for justify in [Justify::Left, Justify::Right] {
                encs.push(Encoding::I12 { endian, justify });
            }
        }
        for code in [
            TwoBitCode::TwosComplement,
            TwoBitCode::SignMagnitude,
            TwoBitCode::OffsetBinary,
        ] {
            for order in [BitOrder::MsbFirst, BitOrder::LsbFirst] {
                encs.push(Encoding::TwoBit { code, order });
            }
            encs.push(Encoding::TwoBitPerByte { code });
        }
        for order in [BitOrder::MsbFirst, BitOrder::LsbFirst] {
            encs.push(Encoding::I4 { order });
            encs.push(Encoding::U4 { order });
        }
        let mut out = Vec::new();
        for e in encs {
            for components in [Components::Iq, Components::Qi, Components::Real] {
                out.push(SampleFormat {
                    encoding: e,
                    components,
                });
            }
        }
        out
    }
}

impl std::fmt::Display for SampleFormat {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.write_str(&self.name())
    }
}

/// Call `f` with each element value stored in `bytes` (a trailing partial element of a
/// multi-byte encoding is ignored).
pub(crate) fn for_each_element(enc: Encoding, bytes: &[u8], mut f: impl FnMut(f64)) {
    match enc {
        Encoding::I8 => bytes.iter().for_each(|&b| f(b as i8 as f64)),
        Encoding::I16Le => bytes
            .chunks_exact(2)
            .for_each(|c| f(i16::from_le_bytes([c[0], c[1]]) as f64)),
        Encoding::I16Be => bytes
            .chunks_exact(2)
            .for_each(|c| f(i16::from_be_bytes([c[0], c[1]]) as f64)),
        Encoding::F32Le => bytes
            .chunks_exact(4)
            .for_each(|c| f(f32::from_le_bytes([c[0], c[1], c[2], c[3]]) as f64)),
        Encoding::F32Be => bytes
            .chunks_exact(4)
            .for_each(|c| f(f32::from_be_bytes([c[0], c[1], c[2], c[3]]) as f64)),
        Encoding::TwoBitPerByte { code } => bytes.iter().for_each(|&b| f(code.level(b) as f64)),
        Encoding::U8 => bytes.iter().for_each(|&b| f(2.0 * b as f64 - 255.0)),
        Encoding::I12 { endian, justify } => bytes.chunks_exact(2).for_each(|c| {
            let w = match endian {
                Endian::Little => u16::from_le_bytes([c[0], c[1]]),
                Endian::Big => u16::from_be_bytes([c[0], c[1]]),
            };
            let v = match justify {
                Justify::Left => (w as i16) >> 4,
                Justify::Right => ((w << 4) as i16) >> 4,
            };
            f(v as f64)
        }),
        Encoding::TwoBit { .. } | Encoding::I4 { .. } | Encoding::U4 { .. } => {
            let bits = enc.packed_bits().expect("packed");
            for &b in bytes {
                for slot in 0..8 / bits {
                    f(enc.packed_level(b >> enc.packed_shift(slot)));
                }
            }
        }
    }
}

/// Quantise `v` to a signed integer in `[lo, hi]` (round half away from zero),
/// reporting whether it saturated (non-finite values become 0 and count as saturated).
fn quantise(v: f64, lo: f64, hi: f64) -> (f64, bool) {
    if !v.is_finite() {
        return (0.0, true);
    }
    let q = v.round();
    (q.clamp(lo, hi), q < lo || q > hi)
}

/// Append one byte-aligned element to `out`; returns true if it saturated. Panics on a
/// packed 2- or 4-bit encoding, which the writers pack themselves.
pub(crate) fn push_element(enc: Encoding, v: f64, out: &mut Vec<u8>) -> bool {
    match enc {
        Encoding::I8 => {
            let (q, c) = quantise(v, -128.0, 127.0);
            out.push(q as i8 as u8);
            c
        }
        Encoding::I16Le | Encoding::I16Be => {
            let (q, c) = quantise(v, -32_768.0, 32_767.0);
            let q = q as i16;
            out.extend_from_slice(&if enc == Encoding::I16Le {
                q.to_le_bytes()
            } else {
                q.to_be_bytes()
            });
            c
        }
        Encoding::F32Le => {
            out.extend_from_slice(&(v as f32).to_le_bytes());
            false
        }
        Encoding::F32Be => {
            out.extend_from_slice(&(v as f32).to_be_bytes());
            false
        }
        Encoding::U8 => {
            let (q, c) = quantise((v + 255.0) / 2.0, 0.0, 255.0);
            out.push(q as u8);
            c
        }
        Encoding::TwoBitPerByte { code } => {
            out.push(code.code(v));
            false
        }
        Encoding::I12 { endian, justify } => {
            let (q, c) = quantise(v, -2048.0, 2047.0);
            let w = match justify {
                Justify::Left => ((q as i16) << 4) as u16,
                Justify::Right => q as i16 as u16,
            };
            out.extend_from_slice(&match endian {
                Endian::Little => w.to_le_bytes(),
                Endian::Big => w.to_be_bytes(),
            });
            c
        }
        Encoding::TwoBit { .. } | Encoding::I4 { .. } | Encoding::U4 { .. } => {
            unreachable!("packed sub-byte elements are packed by the caller")
        }
    }
}

/// The elements of one sample in storage order.
pub(crate) fn sample_elements(c: Components, s: Cf64) -> ([f64; 2], usize) {
    match c {
        Components::Iq => ([s.re, s.im], 2),
        Components::Qi => ([s.im, s.re], 2),
        Components::Real => ([s.re, 0.0], 1),
    }
}

/// Decode a whole in-memory buffer at once (values times `scale`). A trailing partial
/// sample is ignored. `ci8` and `ci16_le` go through
/// [`crate::realdata::iqif::load_iq`], the crate's raw-IF loader, so the streaming
/// reader can be checked against it.
pub fn decode_samples(format: SampleFormat, bytes: &[u8], scale: f64) -> Vec<Cf64> {
    use crate::realdata::iqif::{load_iq, IqFormat};
    let legacy = match format {
        SampleFormat::CI8 => Some(IqFormat::Int8),
        SampleFormat::CI16_LE => Some(IqFormat::Int16Le),
        _ => None,
    };
    if let Some(f) = legacy {
        return load_iq(bytes, f).into_iter().map(|s| s * scale).collect();
    }
    let mut elems = Vec::with_capacity(bytes.len() * 8 / format.encoding.bits());
    for_each_element(format.encoding, bytes, |v| elems.push(v * scale));
    match format.components {
        Components::Iq => elems
            .chunks_exact(2)
            .map(|c| Cf64::new(c[0], c[1]))
            .collect(),
        Components::Qi => elems
            .chunks_exact(2)
            .map(|c| Cf64::new(c[1], c[0]))
            .collect(),
        Components::Real => elems.into_iter().map(|v| Cf64::new(v, 0.0)).collect(),
    }
}

/// Encode a whole in-memory sample block at once (values divided by `scale`), returning
/// the bytes and the number of saturated integer elements. A packed 2- or 4-bit stream
/// whose elements do not fill the last byte is padded with code `0` in it.
pub fn encode_samples(format: SampleFormat, samples: &[Cf64], scale: f64) -> (Vec<u8>, u64) {
    let mut w = super::stream::IqWriter::new(Vec::new(), format).with_scale(scale);
    crate::iq::IqSink::write(&mut w, samples).expect("writing to a Vec cannot fail");
    crate::iq::IqSink::finish(&mut w).expect("writing to a Vec cannot fail");
    let clipped = w.clipped();
    (w.into_inner(), clipped)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn names_round_trip_for_every_format() {
        for f in SampleFormat::all() {
            assert_eq!(SampleFormat::parse(&f.name()).unwrap(), f, "{}", f.name());
        }
        assert_eq!(SampleFormat::CI16_LE.name(), "ci16_le");
        assert!(SampleFormat::parse("ri8_qi").is_err());
        assert!(SampleFormat::parse("cu16_le").is_err());
        assert!(SampleFormat::parse("ci4_mid").is_err());
        assert!(SampleFormat::parse("ci12x_le").is_err());
    }

    #[test]
    fn two_bit_quantiser_inverts_every_level() {
        for code in [
            TwoBitCode::TwosComplement,
            TwoBitCode::SignMagnitude,
            TwoBitCode::OffsetBinary,
        ] {
            for c in 0..4u8 {
                assert_eq!(code.code(code.level(c) as f64), c);
            }
            assert_eq!(code.level(code.code(0.4)), 1);
            assert_eq!(code.level(code.code(-7.0)), -3);
        }
    }
}
