// SPDX-License-Identifier: AGPL-3.0-only
//! The Kshana LEO navigation message binary format: field widths, scale factors, the
//! frame, a CRC-24Q check, and the quantisation-error budget.
//!
//! **This is Kshana's own documented encoding.** It carries the components the published
//! LEO message descriptions name (a Galileo-style Keplerian set with along/cross/radial
//! corrections, a second-order clock polynomial, SVID, health and issue of data, and
//! ionospheric and UTC parameters), modelled on the Galileo OS SIS ICD field set. It is
//! **not** the bit layout of any operational or demonstration LEO system; no such layout
//! is public.
//!
//! The Galileo ICD scale factors were chosen for medium Earth orbit, where a centimetre of
//! quantisation is small against a metre-level signal-in-space error. They are too coarse
//! for a LEO message aiming at centimetres: `Crs` in steps of 2⁻⁵ m (3.1 cm), `Cuc` in
//! steps of 2⁻²⁹ rad (1.3 cm at LEO radius), angles in steps of 2⁻³¹ semicircles (1.0 cm
//! at LEO radius) and `af0` in steps of 2⁻³⁴ s (1.7 cm). Kshana's fields keep the ICD
//! units and semicircle convention and refine the steps so that every field's half-step
//! error stays below 1 mm of position or range over a 15-minute validity window, widening
//! the fields to keep the ranges a LEO fit needs. [`quantisation_budget`] measures it.
//!
//! ## Frame
//!
//! | Part | Bits | Content |
//! |---|---|---|
//! | Preamble | 8 | `0xA7` |
//! | Version | 4 | `1` |
//! | Model | 4 | 1 `kepler16`, 2 `kepler-rac`, 3 `liu22`, 4 `ecef-poly` |
//! | Length | 12 | payload length in bytes |
//! | Payload | 8·Length | the fields of [`field_table`], zero-padded to a byte |
//! | CRC | 24 | CRC-24Q over every preceding byte |
//!
//! CRC-24Q is the check RTCM 10403 and the Galileo ICD use: generator polynomial
//! `0x1864CFB`, initial value 0, no reflection, no final XOR. [`crc24q`] reproduces the
//! catalogue check value `0xCDE703` for the ASCII string `123456789` and the check bytes
//! of the RTCM 10403 message-type 1005 example frame.

use super::elements::{
    ClockPoly, EcefPoly, EphemerisModel, Keplerian, KlobucharSet, LeoNavMessage, Liu22Extra,
    NequickSet, RacPoly, Services, UtcOffset,
};
use serde::Serialize;
use std::f64::consts::PI;

/// Frame preamble.
pub const PREAMBLE: u8 = 0xA7;
/// Format version.
pub const VERSION: u8 = 1;

/// CRC-24Q of `data` (polynomial `0x1864CFB`, init 0).
pub fn crc24q(data: &[u8]) -> u32 {
    let mut crc: u32 = 0;
    for &b in data {
        crc ^= (b as u32) << 16;
        for _ in 0..8 {
            crc <<= 1;
            if crc & 0x0100_0000 != 0 {
                crc ^= 0x0186_4CFB;
            }
        }
    }
    crc & 0x00FF_FFFF
}

/// One field of the layout.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct FieldSpec {
    /// Field name.
    pub name: &'static str,
    /// Width in bits.
    pub bits: u8,
    /// Two's-complement signed.
    pub signed: bool,
    /// Value of one least-significant bit, in `unit`.
    pub lsb: f64,
    /// Transmitted unit.
    pub unit: &'static str,
}

impl FieldSpec {
    const fn new(name: &'static str, bits: u8, signed: bool, lsb: f64, unit: &'static str) -> Self {
        FieldSpec {
            name,
            bits,
            signed,
            lsb,
            unit,
        }
    }

    /// The largest magnitude the field can carry, in its unit.
    pub fn range(&self) -> f64 {
        if self.signed {
            (2f64.powi(self.bits as i32 - 1) - 1.0) * self.lsb
        } else {
            (2f64.powi(self.bits as i32) - 1.0) * self.lsb
        }
    }
}

const fn p2(e: i32) -> f64 {
    // 2^e for |e| < 1023, evaluated at compile time.
    let mut v = 1.0;
    let mut k = 0;
    if e >= 0 {
        while k < e {
            v *= 2.0;
            k += 1;
        }
    } else {
        while k < -e {
            v /= 2.0;
            k += 1;
        }
    }
    v
}

// Auxiliary and synchronisation.
const F_SVID: FieldSpec = FieldSpec::new("SVID", 8, false, 1.0, "-");
const F_IOD: FieldSpec = FieldSpec::new("IOD", 10, false, 1.0, "-");
const F_BAND: FieldSpec = FieldSpec::new("Band", 4, false, 1.0, "-");
const F_HEALTH: FieldSpec = FieldSpec::new("Health", 2, false, 1.0, "-");
const F_WEEK: FieldSpec = FieldSpec::new("WeekNumber", 13, false, 1.0, "week");
const F_TOW: FieldSpec = FieldSpec::new("ToW", 20, false, 1.0, "s");
const F_FLAGS: FieldSpec = FieldSpec::new("Flags", 4, false, 1.0, "-");
// Clock.
const F_TOC: FieldSpec = FieldSpec::new("toc", 20, false, 1.0, "s");
const F_AF0: FieldSpec = FieldSpec::new("af0", 34, true, p2(-38), "s");
const F_AF1: FieldSpec = FieldSpec::new("af1", 28, true, p2(-50), "s/s");
const F_AF2: FieldSpec = FieldSpec::new("af2", 20, true, p2(-62), "s/s^2");
// Keplerian.
const F_TOE: FieldSpec = FieldSpec::new("toe", 20, false, 1.0, "s");
const F_M0: FieldSpec = FieldSpec::new("M0", 36, true, p2(-35), "semicircle");
const F_E: FieldSpec = FieldSpec::new("e", 32, false, p2(-33), "-");
const F_SQRTA: FieldSpec = FieldSpec::new("sqrtA", 36, false, p2(-23), "m^0.5");
const F_OMEGA0: FieldSpec = FieldSpec::new("Omega0", 36, true, p2(-35), "semicircle");
const F_I0: FieldSpec = FieldSpec::new("i0", 36, true, p2(-35), "semicircle");
const F_OMEGA: FieldSpec = FieldSpec::new("omega", 36, true, p2(-35), "semicircle");
const F_DN: FieldSpec = FieldSpec::new("deltaN", 29, true, p2(-43), "semicircle/s");
const F_ODOT: FieldSpec = FieldSpec::new("OmegaDot", 29, true, p2(-43), "semicircle/s");
const F_IDOT: FieldSpec = FieldSpec::new("iDot", 22, true, p2(-43), "semicircle/s");
const F_CUC: FieldSpec = FieldSpec::new("Cuc", 26, true, p2(-34), "rad");
const F_CUS: FieldSpec = FieldSpec::new("Cus", 26, true, p2(-34), "rad");
const F_CRC: FieldSpec = FieldSpec::new("Crc", 26, true, p2(-10), "m");
const F_CRS: FieldSpec = FieldSpec::new("Crs", 26, true, p2(-10), "m");
const F_CIC: FieldSpec = FieldSpec::new("Cic", 26, true, p2(-34), "rad");
const F_CIS: FieldSpec = FieldSpec::new("Cis", 26, true, p2(-34), "rad");
// Along/cross/radial corrections.
const F_DEG_A: FieldSpec = FieldSpec::new("degA", 3, false, 1.0, "-");
const F_DEG_C: FieldSpec = FieldSpec::new("degC", 3, false, 1.0, "-");
const F_DEG_R: FieldSpec = FieldSpec::new("degR", 3, false, 1.0, "-");
const F_RAC_TAU: FieldSpec = FieldSpec::new("racTauExp", 4, false, 1.0, "log2(s)");
const RAC_BITS: u8 = 22;
const RAC_LSB: f64 = p2(-14);
const NAMES_A: [&str; 8] = ["a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7"];
const NAMES_C: [&str; 8] = ["c0", "c1", "c2", "c3", "c4", "c5", "c6", "c7"];
const NAMES_R: [&str; 8] = ["r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7"];
// Liu et al. 2025 extras.
const F_ADOT: FieldSpec = FieldSpec::new("aDot", 26, true, p2(-20), "m/s");
const F_NDOT: FieldSpec = FieldSpec::new("nDot", 30, true, p2(-60), "semicircle/s^2");
const F_CRS3: FieldSpec = FieldSpec::new("Crs3", 26, true, p2(-10), "m");
const F_CRC3: FieldSpec = FieldSpec::new("Crc3", 26, true, p2(-10), "m");
const F_CRS1: FieldSpec = FieldSpec::new("Crs1", 26, true, p2(-10), "m");
const F_CRC1: FieldSpec = FieldSpec::new("Crc1", 26, true, p2(-10), "m");
// ECEF polynomial.
const F_TREF: FieldSpec = FieldSpec::new("tref", 20, false, 1.0, "s");
const F_PDEG: FieldSpec = FieldSpec::new("degP", 4, false, 1.0, "-");
const NAMES_X: [&str; 11] = [
    "x0", "x1", "x2", "x3", "x4", "x5", "x6", "x7", "x8", "x9", "x10",
];
const NAMES_Y: [&str; 11] = [
    "y0", "y1", "y2", "y3", "y4", "y5", "y6", "y7", "y8", "y9", "y10",
];
const NAMES_Z: [&str; 11] = [
    "z0", "z1", "z2", "z3", "z4", "z5", "z6", "z7", "z8", "z9", "z10",
];
// Klobuchar (IS-GPS-200 scale factors).
const F_KLOB: [FieldSpec; 8] = [
    FieldSpec::new("alpha0", 8, true, p2(-30), "s"),
    FieldSpec::new("alpha1", 8, true, p2(-27), "s/semicircle"),
    FieldSpec::new("alpha2", 8, true, p2(-24), "s/semicircle^2"),
    FieldSpec::new("alpha3", 8, true, p2(-24), "s/semicircle^3"),
    FieldSpec::new("beta0", 8, true, p2(11), "s"),
    FieldSpec::new("beta1", 8, true, p2(14), "s/semicircle"),
    FieldSpec::new("beta2", 8, true, p2(16), "s/semicircle^2"),
    FieldSpec::new("beta3", 8, true, p2(16), "s/semicircle^3"),
];
// NeQuick-G (Galileo ICD scale factors).
const F_AI0: FieldSpec = FieldSpec::new("ai0", 11, false, p2(-2), "sfu");
const F_AI1: FieldSpec = FieldSpec::new("ai1", 11, true, p2(-8), "sfu/deg");
const F_AI2: FieldSpec = FieldSpec::new("ai2", 14, true, p2(-15), "sfu/deg^2");
const F_STORM: FieldSpec = FieldSpec::new("SF1-5", 5, false, 1.0, "-");
// UTC (Galileo ICD scale factors).
const F_A0: FieldSpec = FieldSpec::new("A0", 32, true, p2(-30), "s");
const F_A1: FieldSpec = FieldSpec::new("A1", 24, true, p2(-50), "s/s");
const F_DTLS: FieldSpec = FieldSpec::new("dtLS", 8, true, 1.0, "s");
const F_TOT: FieldSpec = FieldSpec::new("t0t", 8, false, 3600.0, "s");
const F_WNOT: FieldSpec = FieldSpec::new("WNot", 8, false, 1.0, "week");
const F_WNLSF: FieldSpec = FieldSpec::new("WNLSF", 8, false, 1.0, "week");
const F_DN_LS: FieldSpec = FieldSpec::new("DN", 3, false, 1.0, "day");
const F_DTLSF: FieldSpec = FieldSpec::new("dtLSF", 8, true, 1.0, "s");

fn rac_spec(name: &'static str) -> FieldSpec {
    FieldSpec::new(name, RAC_BITS, true, RAC_LSB, "m")
}
fn poly_spec(name: &'static str, k: usize) -> FieldSpec {
    if k == 0 {
        FieldSpec::new(name, 38, true, p2(-11), "m")
    } else {
        FieldSpec::new(name, 34, true, p2(-12), "m")
    }
}

/// A block of the documented layout, for the field table.
#[derive(Clone, Debug, Serialize)]
pub struct LayoutBlock {
    /// Block name.
    pub block: &'static str,
    /// Its fields.
    pub fields: Vec<FieldSpec>,
}

/// The documented field table, every block in transmission order (the along/cross/radial
/// and ECEF coefficient rows are shown for their first index; every index shares the
/// width and step shown).
pub fn field_table() -> Vec<LayoutBlock> {
    vec![
        LayoutBlock {
            block: "auxiliary and synchronisation",
            fields: vec![F_SVID, F_IOD, F_BAND, F_HEALTH, F_WEEK, F_TOW, F_FLAGS],
        },
        LayoutBlock {
            block: "clock (flag bit 0)",
            fields: vec![F_TOC, F_AF0, F_AF1, F_AF2],
        },
        LayoutBlock {
            block: "Keplerian (models 1-3)",
            fields: vec![
                F_TOE, F_M0, F_E, F_SQRTA, F_OMEGA0, F_I0, F_OMEGA, F_DN, F_ODOT, F_IDOT, F_CUC,
                F_CUS, F_CRC, F_CRS, F_CIC, F_CIS,
            ],
        },
        LayoutBlock {
            block: "along/cross/radial corrections (model 2)",
            fields: vec![
                F_DEG_A,
                F_DEG_C,
                F_DEG_R,
                F_RAC_TAU,
                rac_spec("a_k, c_k, r_k"),
            ],
        },
        LayoutBlock {
            block: "Liu et al. 2025 extras (model 3)",
            fields: vec![F_ADOT, F_NDOT, F_CRS3, F_CRC3, F_CRS1, F_CRC1],
        },
        LayoutBlock {
            block: "ECEF polynomial (model 4)",
            fields: vec![
                F_TREF,
                F_PDEG,
                poly_spec("x0, y0, z0", 0),
                poly_spec("x_k, y_k, z_k (k >= 1)", 1),
            ],
        },
        LayoutBlock {
            block: "Klobuchar (flag bit 1)",
            fields: F_KLOB.to_vec(),
        },
        LayoutBlock {
            block: "NeQuick-G (flag bit 2)",
            fields: vec![F_AI0, F_AI1, F_AI2, F_STORM],
        },
        LayoutBlock {
            block: "UTC (flag bit 3)",
            fields: vec![F_A0, F_A1, F_DTLS, F_TOT, F_WNOT, F_WNLSF, F_DN_LS, F_DTLSF],
        },
    ]
}

/// Where fields go when a message is written.
pub trait Sink {
    /// Write one field value (in the field's transmitted unit).
    fn put(&mut self, spec: FieldSpec, value: f64) -> Result<(), String>;
}

/// Where fields come from when a message is read.
pub trait Source {
    /// Read one field value (in the field's transmitted unit).
    fn take(&mut self, spec: FieldSpec) -> Result<f64, String>;
}

/// Most-significant-bit-first bit packer that quantises each field.
#[derive(Default)]
pub struct BitWriter {
    bytes: Vec<u8>,
    nbits: usize,
}

impl BitWriter {
    fn push_bits(&mut self, v: u64, bits: u8) {
        for k in (0..bits).rev() {
            let bit = (v >> k) & 1;
            if self.nbits % 8 == 0 {
                self.bytes.push(0);
            }
            if bit == 1 {
                let idx = self.nbits / 8;
                self.bytes[idx] |= 0x80 >> (self.nbits % 8);
            }
            self.nbits += 1;
        }
    }

    /// Bits written.
    pub fn len_bits(&self) -> usize {
        self.nbits
    }

    /// The bytes, zero-padded to a byte boundary.
    pub fn into_bytes(self) -> Vec<u8> {
        self.bytes
    }
}

/// Quantise a value to a field's integer code, refusing values outside its range.
pub fn quantise(spec: &FieldSpec, value: f64) -> Result<i64, String> {
    if !value.is_finite() {
        return Err(format!("field {} is not finite", spec.name));
    }
    let q = (value / spec.lsb).round();
    let (lo, hi) = if spec.signed {
        (
            -(2f64.powi(spec.bits as i32 - 1)),
            2f64.powi(spec.bits as i32 - 1) - 1.0,
        )
    } else {
        (0.0, 2f64.powi(spec.bits as i32) - 1.0)
    };
    if q < lo || q > hi {
        return Err(format!(
            "field {} = {value:e} {} is outside its {}-bit range (|x| <= {:e})",
            spec.name,
            spec.unit,
            spec.bits,
            spec.range()
        ));
    }
    Ok(q as i64)
}

impl Sink for BitWriter {
    fn put(&mut self, spec: FieldSpec, value: f64) -> Result<(), String> {
        let q = quantise(&spec, value)?;
        let mask = if spec.bits == 64 {
            u64::MAX
        } else {
            (1u64 << spec.bits) - 1
        };
        self.push_bits((q as u64) & mask, spec.bits);
        Ok(())
    }
}

/// Bit reader matching [`BitWriter`].
pub struct BitReader<'a> {
    bytes: &'a [u8],
    pos: usize,
}

impl<'a> BitReader<'a> {
    /// A reader over `bytes`.
    pub fn new(bytes: &'a [u8]) -> Self {
        BitReader { bytes, pos: 0 }
    }

    fn pull(&mut self, bits: u8) -> Result<u64, String> {
        if self.pos + bits as usize > self.bytes.len() * 8 {
            return Err("message truncated".to_string());
        }
        let mut v = 0u64;
        for _ in 0..bits {
            let b = (self.bytes[self.pos / 8] >> (7 - self.pos % 8)) & 1;
            v = (v << 1) | b as u64;
            self.pos += 1;
        }
        Ok(v)
    }
}

impl Source for BitReader<'_> {
    fn take(&mut self, spec: FieldSpec) -> Result<f64, String> {
        let raw = self.pull(spec.bits)?;
        let q = if spec.signed && spec.bits < 64 && raw & (1u64 << (spec.bits - 1)) != 0 {
            raw as i64 - (1i64 << spec.bits)
        } else {
            raw as i64
        };
        Ok(q as f64 * spec.lsb)
    }
}

/// The unquantised field list of a message: every field with its exact value.
#[derive(Default, Clone, Debug)]
pub struct FieldList {
    /// `(spec, value)` in transmission order.
    pub fields: Vec<(FieldSpec, f64)>,
    cursor: usize,
}

impl Sink for FieldList {
    fn put(&mut self, spec: FieldSpec, value: f64) -> Result<(), String> {
        self.fields.push((spec, value));
        Ok(())
    }
}

impl Source for FieldList {
    fn take(&mut self, spec: FieldSpec) -> Result<f64, String> {
        let (s, v) = *self.fields.get(self.cursor).ok_or("field list exhausted")?;
        if s.name != spec.name {
            return Err(format!("field order mismatch: {} vs {}", s.name, spec.name));
        }
        self.cursor += 1;
        Ok(v)
    }
}

/// Model code on the wire.
pub fn model_id(m: &EphemerisModel) -> u8 {
    match m {
        EphemerisModel::Kepler16 { .. } => 1,
        EphemerisModel::KeplerRac { .. } => 2,
        EphemerisModel::Liu22 { .. } => 3,
        EphemerisModel::EcefPoly { .. } => 4,
    }
}

fn put_kepler<S: Sink>(s: &mut S, k: &Keplerian) -> Result<(), String> {
    s.put(F_TOE, k.toe)?;
    s.put(F_M0, k.m0 / PI)?;
    s.put(F_E, k.e)?;
    s.put(F_SQRTA, k.sqrt_a)?;
    s.put(F_OMEGA0, k.omega0 / PI)?;
    s.put(F_I0, k.i0 / PI)?;
    s.put(F_OMEGA, k.omega / PI)?;
    s.put(F_DN, k.delta_n / PI)?;
    s.put(F_ODOT, k.omega_dot / PI)?;
    s.put(F_IDOT, k.i_dot / PI)?;
    s.put(F_CUC, k.cuc)?;
    s.put(F_CUS, k.cus)?;
    s.put(F_CRC, k.crc)?;
    s.put(F_CRS, k.crs)?;
    s.put(F_CIC, k.cic)?;
    s.put(F_CIS, k.cis)
}

fn take_kepler<S: Source>(s: &mut S) -> Result<Keplerian, String> {
    Ok(Keplerian {
        toe: s.take(F_TOE)?,
        m0: s.take(F_M0)? * PI,
        e: s.take(F_E)?,
        sqrt_a: s.take(F_SQRTA)?,
        omega0: s.take(F_OMEGA0)? * PI,
        i0: s.take(F_I0)? * PI,
        omega: s.take(F_OMEGA)? * PI,
        delta_n: s.take(F_DN)? * PI,
        omega_dot: s.take(F_ODOT)? * PI,
        i_dot: s.take(F_IDOT)? * PI,
        cuc: s.take(F_CUC)?,
        cus: s.take(F_CUS)?,
        crc: s.take(F_CRC)?,
        crs: s.take(F_CRS)?,
        cic: s.take(F_CIC)?,
        cis: s.take(F_CIS)?,
    })
}

/// Write every payload field of `msg` into `s`, in transmission order.
pub fn write_payload<S: Sink>(s: &mut S, msg: &LeoNavMessage) -> Result<(), String> {
    if msg.svid == 0 {
        return Err("SVID must be 1-255".to_string());
    }
    s.put(F_SVID, msg.svid as f64)?;
    s.put(F_IOD, msg.iod as f64)?;
    s.put(F_BAND, msg.band as f64)?;
    s.put(F_HEALTH, msg.health as f64)?;
    s.put(F_WEEK, msg.week as f64)?;
    s.put(F_TOW, msg.tow.round())?;
    let flags = msg.clock.is_some() as u8
        | (msg.services.klobuchar.is_some() as u8) << 1
        | (msg.services.nequick.is_some() as u8) << 2
        | (msg.services.utc.is_some() as u8) << 3;
    s.put(F_FLAGS, flags as f64)?;
    if let Some(c) = &msg.clock {
        s.put(F_TOC, c.toc)?;
        s.put(F_AF0, c.af0)?;
        s.put(F_AF1, c.af1)?;
        s.put(F_AF2, c.af2)?;
    }
    match &msg.ephemeris {
        EphemerisModel::Kepler16 { kepler } => put_kepler(s, kepler)?,
        EphemerisModel::KeplerRac { kepler, rac } => {
            put_kepler(s, kepler)?;
            for (list, spec) in [
                (&rac.along, F_DEG_A),
                (&rac.cross, F_DEG_C),
                (&rac.radial, F_DEG_R),
            ] {
                if list.is_empty() || list.len() > 8 {
                    return Err("each correction polynomial needs 1-8 coefficients".to_string());
                }
                s.put(spec, (list.len() - 1) as f64)?;
            }
            let e = rac.tau_s.log2();
            if !(0.0..=15.0).contains(&e) || e.fract() != 0.0 {
                return Err(format!(
                    "correction time scale must be a power of two from 1 s to 32768 s; got {}",
                    rac.tau_s
                ));
            }
            s.put(F_RAC_TAU, e)?;
            for (list, names) in [
                (&rac.along, NAMES_A),
                (&rac.cross, NAMES_C),
                (&rac.radial, NAMES_R),
            ] {
                for (k, v) in list.iter().enumerate() {
                    s.put(rac_spec(names[k]), *v)?;
                }
            }
        }
        EphemerisModel::Liu22 { kepler, extra } => {
            put_kepler(s, kepler)?;
            s.put(F_ADOT, extra.a_dot)?;
            s.put(F_NDOT, extra.n_dot / PI)?;
            s.put(F_CRS3, extra.crs3)?;
            s.put(F_CRC3, extra.crc3)?;
            s.put(F_CRS1, extra.crs1)?;
            s.put(F_CRC1, extra.crc1)?;
        }
        EphemerisModel::EcefPoly { poly } => {
            let n = poly.coeffs[0].len();
            if n == 0 || n > 11 || poly.coeffs.iter().any(|c| c.len() != n) {
                return Err("ECEF polynomial needs 1-11 coefficients, equal per axis".to_string());
            }
            s.put(F_TREF, poly.t_ref)?;
            s.put(F_PDEG, (n - 1) as f64)?;
            for (ax, names) in [NAMES_X, NAMES_Y, NAMES_Z].iter().enumerate() {
                for (k, v) in poly.coeffs[ax].iter().enumerate() {
                    s.put(poly_spec(names[k], k), *v)?;
                }
            }
        }
    }
    if let Some(k) = &msg.services.klobuchar {
        for (i, spec) in F_KLOB.iter().enumerate() {
            let v = if i < 4 { k.alpha[i] } else { k.beta[i - 4] };
            s.put(*spec, v)?;
        }
    }
    if let Some(nq) = &msg.services.nequick {
        s.put(F_AI0, nq.ai0)?;
        s.put(F_AI1, nq.ai1)?;
        s.put(F_AI2, nq.ai2)?;
        let f = nq
            .storm_flags
            .iter()
            .enumerate()
            .fold(0u8, |acc, (i, &b)| acc | ((b as u8) << (4 - i)));
        s.put(F_STORM, f as f64)?;
    }
    if let Some(u) = &msg.services.utc {
        s.put(F_A0, u.a0)?;
        s.put(F_A1, u.a1)?;
        s.put(F_DTLS, u.dt_ls as f64)?;
        s.put(F_TOT, u.t_ot)?;
        s.put(F_WNOT, (u.wn_ot % 256) as f64)?;
        s.put(F_WNLSF, (u.wn_lsf % 256) as f64)?;
        s.put(F_DN_LS, u.dn as f64)?;
        s.put(F_DTLSF, u.dt_lsf as f64)?;
    }
    Ok(())
}

/// Resolve an 8-bit week number to the full week nearest `reference`.
fn resolve_week8(w8: u32, reference: u32) -> u32 {
    let base = reference - reference % 256;
    let mut best = base + w8;
    for cand in [base.saturating_sub(256) + w8, base + w8, base + 256 + w8] {
        if (cand as i64 - reference as i64).abs() < (best as i64 - reference as i64).abs() {
            best = cand;
        }
    }
    best
}

/// Read a payload written by [`write_payload`] for wire model `model`.
pub fn read_payload<S: Source>(s: &mut S, model: u8) -> Result<LeoNavMessage, String> {
    let svid = s.take(F_SVID)? as u8;
    let iod = s.take(F_IOD)? as u16;
    let band = s.take(F_BAND)? as u8;
    let health = s.take(F_HEALTH)? as u8;
    let week = s.take(F_WEEK)? as u32;
    let tow = s.take(F_TOW)?;
    let flags = s.take(F_FLAGS)? as u8;
    let clock = if flags & 1 != 0 {
        Some(ClockPoly {
            toc: s.take(F_TOC)?,
            af0: s.take(F_AF0)?,
            af1: s.take(F_AF1)?,
            af2: s.take(F_AF2)?,
        })
    } else {
        None
    };
    let ephemeris = match model {
        1 => EphemerisModel::Kepler16 {
            kepler: take_kepler(s)?,
        },
        2 => {
            let kepler = take_kepler(s)?;
            let na = s.take(F_DEG_A)? as usize + 1;
            let nc = s.take(F_DEG_C)? as usize + 1;
            let nr = s.take(F_DEG_R)? as usize + 1;
            let mut rac = RacPoly {
                tau_s: 2f64.powi(s.take(F_RAC_TAU)? as i32),
                ..RacPoly::default()
            };
            for name in NAMES_A.iter().take(na) {
                rac.along.push(s.take(rac_spec(name))?);
            }
            for name in NAMES_C.iter().take(nc) {
                rac.cross.push(s.take(rac_spec(name))?);
            }
            for name in NAMES_R.iter().take(nr) {
                rac.radial.push(s.take(rac_spec(name))?);
            }
            EphemerisModel::KeplerRac { kepler, rac }
        }
        3 => {
            let kepler = take_kepler(s)?;
            let extra = Liu22Extra {
                a_dot: s.take(F_ADOT)?,
                n_dot: s.take(F_NDOT)? * PI,
                crs3: s.take(F_CRS3)?,
                crc3: s.take(F_CRC3)?,
                crs1: s.take(F_CRS1)?,
                crc1: s.take(F_CRC1)?,
            };
            EphemerisModel::Liu22 { kepler, extra }
        }
        4 => {
            let t_ref = s.take(F_TREF)?;
            let n = s.take(F_PDEG)? as usize + 1;
            if n > 11 {
                return Err(format!("ECEF polynomial degree {} exceeds 10", n - 1));
            }
            let mut coeffs: [Vec<f64>; 3] = Default::default();
            for (ax, names) in [NAMES_X, NAMES_Y, NAMES_Z].iter().enumerate() {
                for (k, name) in names.iter().enumerate().take(n) {
                    coeffs[ax].push(s.take(poly_spec(name, k))?);
                }
            }
            EphemerisModel::EcefPoly {
                poly: EcefPoly { t_ref, coeffs },
            }
        }
        m => return Err(format!("unknown model id {m}")),
    };
    let mut services = Services::default();
    if flags & 2 != 0 {
        let mut v = [0.0; 8];
        for (i, spec) in F_KLOB.iter().enumerate() {
            v[i] = s.take(*spec)?;
        }
        services.klobuchar = Some(KlobucharSet {
            alpha: [v[0], v[1], v[2], v[3]],
            beta: [v[4], v[5], v[6], v[7]],
        });
    }
    if flags & 4 != 0 {
        let ai0 = s.take(F_AI0)?;
        let ai1 = s.take(F_AI1)?;
        let ai2 = s.take(F_AI2)?;
        let f = s.take(F_STORM)? as u8;
        let mut storm_flags = [false; 5];
        for (i, sf) in storm_flags.iter_mut().enumerate() {
            *sf = (f >> (4 - i)) & 1 == 1;
        }
        services.nequick = Some(NequickSet {
            ai0,
            ai1,
            ai2,
            storm_flags,
        });
    }
    if flags & 8 != 0 {
        let a0 = s.take(F_A0)?;
        let a1 = s.take(F_A1)?;
        let dt_ls = s.take(F_DTLS)? as i32;
        let t_ot = s.take(F_TOT)?;
        let wn_ot = resolve_week8(s.take(F_WNOT)? as u32, week);
        let wn_lsf = resolve_week8(s.take(F_WNLSF)? as u32, week);
        let dn = s.take(F_DN_LS)? as u8;
        let dt_lsf = s.take(F_DTLSF)? as i32;
        services.utc = Some(UtcOffset {
            a0,
            a1,
            dt_ls,
            t_ot,
            wn_ot,
            wn_lsf,
            dn,
            dt_lsf,
        });
    }
    Ok(LeoNavMessage {
        svid,
        iod,
        band,
        health,
        week,
        tow,
        clock,
        ephemeris,
        services,
    })
}

/// Encode a message into a frame (header, payload, CRC-24Q).
pub fn encode(msg: &LeoNavMessage) -> Result<Vec<u8>, String> {
    let mut w = BitWriter::default();
    write_payload(&mut w, msg)?;
    let payload = w.into_bytes();
    if payload.len() > 4095 {
        return Err("payload exceeds 4095 bytes".to_string());
    }
    let mut frame = Vec::with_capacity(payload.len() + 6);
    frame.push(PREAMBLE);
    frame.push((VERSION << 4) | model_id(&msg.ephemeris));
    frame.push((payload.len() >> 4) as u8);
    // The 12-bit length's low nibble shares a byte with four zero bits.
    frame.push(((payload.len() & 0x0F) as u8) << 4);
    frame.extend_from_slice(&payload);
    let crc = crc24q(&frame);
    frame.extend_from_slice(&[(crc >> 16) as u8, (crc >> 8) as u8, crc as u8]);
    Ok(frame)
}

/// Payload length in bits (before byte padding) of a message.
pub fn payload_bits(msg: &LeoNavMessage) -> Result<usize, String> {
    let mut w = BitWriter::default();
    write_payload(&mut w, msg)?;
    Ok(w.len_bits())
}

/// Ephemeris-and-clock bits only (the part that scales with the model), for comparison
/// with published message sizes.
pub fn ephemeris_clock_bits(msg: &LeoNavMessage) -> Result<usize, String> {
    let mut l = FieldList::default();
    write_payload(&mut l, msg)?;
    let aux = [
        "SVID",
        "IOD",
        "Band",
        "Health",
        "WeekNumber",
        "ToW",
        "Flags",
    ];
    let svc: Vec<&str> = F_KLOB
        .iter()
        .map(|f| f.name)
        .chain([
            "ai0", "ai1", "ai2", "SF1-5", "A0", "A1", "dtLS", "t0t", "WNot", "WNLSF", "DN", "dtLSF",
        ])
        .collect();
    Ok(l.fields
        .iter()
        .filter(|(s, _)| !aux.contains(&s.name) && !svc.contains(&s.name))
        .map(|(s, _)| s.bits as usize)
        .sum())
}

/// Decode a frame, checking the preamble, version, length and CRC-24Q.
pub fn decode(frame: &[u8]) -> Result<LeoNavMessage, String> {
    if frame.len() < 7 {
        return Err("frame shorter than header and CRC".to_string());
    }
    if frame[0] != PREAMBLE {
        return Err(format!("bad preamble 0x{:02X}", frame[0]));
    }
    let version = frame[1] >> 4;
    if version != VERSION {
        return Err(format!("unsupported version {version}"));
    }
    let model = frame[1] & 0x0F;
    let len = ((frame[2] as usize) << 4) | (frame[3] as usize >> 4);
    if frame.len() != 4 + len + 3 {
        return Err(format!(
            "frame length {} does not match the declared payload of {len} bytes",
            frame.len()
        ));
    }
    let body = &frame[..4 + len];
    let crc = crc24q(body);
    let got =
        ((frame[4 + len] as u32) << 16) | ((frame[5 + len] as u32) << 8) | frame[6 + len] as u32;
    if crc != got {
        return Err(format!(
            "CRC-24Q mismatch: computed 0x{crc:06X}, frame carries 0x{got:06X}"
        ));
    }
    let mut r = BitReader::new(&frame[4..4 + len]);
    read_payload(&mut r, model)
}

/// One row of the quantisation budget.
#[derive(Clone, Debug, Serialize)]
pub struct BudgetRow {
    /// Field name.
    pub field: &'static str,
    /// Width (bits).
    pub bits: u8,
    /// Step (in `unit`).
    pub lsb: f64,
    /// Transmitted unit.
    pub unit: &'static str,
    /// Largest 3D position change over the window from a half-step change (m).
    pub half_lsb_pos_m: f64,
    /// Largest clock change times c over the window from a half-step change (m).
    pub half_lsb_clock_m: f64,
}

/// The quantisation-error budget of a message over `[from, from + len]`: per field, the
/// largest position and range effect of a half-step change; and the whole-message effect
/// of quantising every field (largest 3D position and clock difference, quantised minus
/// exact).
pub fn quantisation_budget(
    msg: &LeoNavMessage,
    from: &super::elements::SysTime,
    len: f64,
    step_s: f64,
) -> Result<(Vec<BudgetRow>, f64, f64), String> {
    use super::elements::{sat_state, sub, C_LIGHT};
    let mut list = FieldList::default();
    write_payload(&mut list, msg)?;
    let model = model_id(&msg.ephemeris);
    let n = (len / step_s).round().max(1.0) as usize;
    let times: Vec<_> = (0..=n)
        .map(|k| from.plus(len * k as f64 / n as f64))
        .collect();
    let base: Vec<_> = times.iter().map(|t| sat_state(msg, t)).collect();
    let effect = |m: &LeoNavMessage| -> (f64, f64) {
        let (mut dp, mut dc) = (0.0f64, 0.0f64);
        for (t, b) in times.iter().zip(&base) {
            let s = sat_state(m, t);
            let d = sub(s.pos, b.pos);
            dp = dp.max((d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt());
            dc = dc.max(((s.clock_s - b.clock_s) * C_LIGHT).abs());
        }
        (dp, dc)
    };
    let skip = [
        "SVID",
        "IOD",
        "Band",
        "Health",
        "WeekNumber",
        "ToW",
        "Flags",
        "degA",
        "degC",
        "degR",
        "racTauExp",
        "degP",
        "toe",
        "toc",
        "tref",
    ];
    let mut rows = Vec::new();
    for i in 0..list.fields.len() {
        let (spec, v) = list.fields[i];
        if skip.contains(&spec.name) || F_KLOB.iter().any(|f| f.name == spec.name) {
            continue;
        }
        if matches!(
            spec.name,
            "ai0"
                | "ai1"
                | "ai2"
                | "SF1-5"
                | "A0"
                | "A1"
                | "dtLS"
                | "t0t"
                | "WNot"
                | "WNLSF"
                | "DN"
                | "dtLSF"
        ) {
            continue;
        }
        let mut l2 = list.clone();
        l2.fields[i].1 = v + 0.5 * spec.lsb;
        l2.cursor = 0;
        let m2 = read_payload(&mut l2, model)?;
        let (dp, dc) = effect(&m2);
        rows.push(BudgetRow {
            field: spec.name,
            bits: spec.bits,
            lsb: spec.lsb,
            unit: spec.unit,
            half_lsb_pos_m: dp,
            half_lsb_clock_m: dc,
        });
    }
    let q = decode(&encode(msg)?)?;
    let (dp, dc) = effect(&q);
    Ok((rows, dp, dc))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn crc24q_matches_the_catalogue_check_value() {
        // CRC-24Q parameters (poly 0x864CFB, init 0, no reflection, no XOR out) are the
        // catalogue's CRC-24/LTE-A entry, whose check value for "123456789" is 0xCDE703.
        assert_eq!(crc24q(b"123456789"), 0xCDE703);
    }

    #[test]
    fn crc24q_matches_the_rtcm_1005_example_frame() {
        // RTCM 10403 message-type 1005 example frame; its last three bytes are the
        // CRC-24Q of everything before them, and the CRC of the whole frame is zero.
        let frame: [u8; 25] = [
            0xD3, 0x00, 0x13, 0x3E, 0xD7, 0xD3, 0x02, 0x02, 0x98, 0x0E, 0xDE, 0xEF, 0x34, 0xB4,
            0xBD, 0x62, 0xAC, 0x09, 0x41, 0x98, 0x6F, 0x33, 0x36, 0x0B, 0x98,
        ];
        assert_eq!(crc24q(&frame[..22]), 0x360B98);
        assert_eq!(crc24q(&frame), 0);
    }

    #[test]
    fn signed_fields_round_trip_through_the_bit_packer() {
        let spec = FieldSpec::new("t", 13, true, 0.5, "-");
        let mut w = BitWriter::default();
        for v in [-2048.0, -0.5, 0.0, 3.5, 2047.5] {
            w.put(spec, v).unwrap();
        }
        assert!(w.put(spec, 2048.0).is_err());
        let bytes = w.into_bytes();
        let mut r = BitReader::new(&bytes);
        for v in [-2048.0, -0.5, 0.0, 3.5, 2047.5] {
            assert_eq!(r.take(spec).unwrap(), v);
        }
    }

    #[test]
    fn week8_resolves_near_the_reference() {
        assert_eq!(resolve_week8(2437 % 256, 2437), 2437);
        assert_eq!(resolve_week8(250, 2437), 2554); // 117 weeks away; 2298 is 139
        assert_eq!(resolve_week8(10, 2550), 2570);
    }
}
