// SPDX-License-Identifier: AGPL-3.0-only
//! GPS civil navigation message (CNAV) of L2C and L5: message types 10 and 11 (ephemeris)
//! and 30 (clock, ionosphere and group delays), as IS-GPS-200 Appendix III (section 30.3.3,
//! Figures 30-1 to 30-3, Tables 30-I to 30-IV) lays them out; IS-GPS-705 uses the same
//! messages on L5.
//!
//! A message is 300 bits sent most significant bit first: the 8-bit preamble `10001011`,
//! the 6-bit PRN, the 6-bit message type, the 17-bit message time-of-week (TOW) count (the
//! time of the start of the NEXT 12 s message, in units of 6 s), the alert flag, 238
//! message-specific bits and the 24-bit CRC-24Q over bits 1 to 276. The ephemeris is stated
//! relative to the reference semi-major axis `A_REF = 26 559 710 m` and the reference rate of
//! right ascension `OMEGA_DOT_REF = -2.6e-9 semicircles/s`.
//!
//! [`fec_encode`] is the L2C and L5 forward error correction: the rate-1/2 constraint-length-7
//! code of [`super::fec`] (`G1 = 171`, `G2 = 133` octal, `G1` symbol first, no inversion),
//! run continuously across messages (no tail bits).
//!
//! Inputs the specification leaves to the operator are explicit: health bits, user range
//! accuracy indices, the integrity and L2C phasing flags, the data predict time `t_op`, the
//! group delays (each optional; an absent one is sent as the specified "not available"
//! pattern `1000000000000`), the ionosphere coefficients and `WN_OP`. Reserved bits are zero.
//!
//! [`ephemeris_from_rinex`] maps a legacy (LNAV) broadcast record to CNAV inputs with
//! `A_dot = 0` and `delta_n0_dot = 0`: a CNAV message carrying LNAV-precision values, not a
//! reproduction of what the control segment uploads. MODELLED.

use super::fec::{conv_encode, crc24q};
use super::{get, int, p2, pack, pow2, push_bits, read_bits, sc, unpack, Decoded, Field};
use crate::gps_lnav::GPS_PI;
use crate::rinex::RinexEphemeris;

/// Preamble `10001011`.
pub const PREAMBLE: u64 = 0x8B;
/// Message length (bits).
pub const MESSAGE_BITS: usize = 300;
/// Reference semi-major axis `A_REF` (m).
pub const A_REF_M: f64 = 26_559_710.0;
/// Reference rate of right ascension `OMEGA_DOT_REF` (semicircles/s).
pub const OMEGA_DOT_REF_SC: f64 = -2.6e-9;
/// The raw 13-bit group-delay pattern meaning "not available".
pub const GROUP_DELAY_NA: u64 = 0x1000;

/// Bits 1 to 38, common to every message.
pub const HEADER: &[Field] = &[
    int("preamble", 8),
    int("prn", 6),
    int("msg_type", 6),
    int("tow_count", 17),
    int("alert", 1),
];

/// Message type 10, bits 39 to 276 (Figure 30-1, Table 30-I).
pub const TYPE10: &[Field] = &[
    int("wn", 13),
    int("l1_health", 1),
    int("l2_health", 1),
    int("l5_health", 1),
    p2("top", 11, false, 300.0),
    p2("ura_ed", 5, true, 1.0),
    p2("toe", 11, false, 300.0),
    p2("delta_a", 26, true, pow2(-9)),
    p2("a_dot", 25, true, pow2(-21)),
    sc("delta_n0", 17, true, pow2(-44)),
    sc("delta_n0_dot", 23, true, pow2(-57)),
    sc("m0", 33, true, pow2(-32)),
    p2("e", 33, false, pow2(-34)),
    sc("omega", 33, true, pow2(-32)),
    int("integrity", 1),
    int("l2c_phasing", 1),
    int("reserved", 3),
];

/// Message type 11, bits 39 to 276 (Figure 30-2, Table 30-I).
pub const TYPE11: &[Field] = &[
    p2("toe", 11, false, 300.0),
    sc("omega0", 33, true, pow2(-32)),
    sc("i0", 33, true, pow2(-32)),
    sc("delta_omega_dot", 17, true, pow2(-44)),
    sc("i0_dot", 15, true, pow2(-44)),
    p2("cis", 16, true, pow2(-30)),
    p2("cic", 16, true, pow2(-30)),
    p2("crs", 24, true, pow2(-8)),
    p2("crc", 24, true, pow2(-8)),
    p2("cus", 21, true, pow2(-30)),
    p2("cuc", 21, true, pow2(-30)),
    int("reserved", 7),
];

/// The clock block of message types 30 to 37, bits 39 to 127 (Table 30-III).
pub const CLOCK: &[Field] = &[
    p2("top", 11, false, 300.0),
    p2("ura_ned0", 5, true, 1.0),
    int("ura_ned1", 3),
    int("ura_ned2", 3),
    p2("toc", 11, false, 300.0),
    p2("af0", 26, true, pow2(-35)),
    p2("af1", 20, true, pow2(-48)),
    p2("af2", 10, true, pow2(-60)),
];

/// The rest of message type 30, bits 128 to 276 (Figure 30-3, Table 30-IV). The Klobuchar
/// coefficients keep the specification's units (s, s/semicircle, ...; s, s/semicircle, ...),
/// as the LNAV ones do.
pub const TYPE30_REST: &[Field] = &[
    p2("tgd", 13, true, pow2(-35)),
    p2("isc_l1ca", 13, true, pow2(-35)),
    p2("isc_l2c", 13, true, pow2(-35)),
    p2("isc_l5i5", 13, true, pow2(-35)),
    p2("isc_l5q5", 13, true, pow2(-35)),
    p2("alpha0", 8, true, pow2(-30)),
    p2("alpha1", 8, true, pow2(-27)),
    p2("alpha2", 8, true, pow2(-24)),
    p2("alpha3", 8, true, pow2(-24)),
    p2("beta0", 8, true, pow2(11)),
    p2("beta1", 8, true, pow2(14)),
    p2("beta2", 8, true, pow2(16)),
    p2("beta3", 8, true, pow2(16)),
    int("wnop", 8),
    int("reserved", 12),
];

/// The full message-type-30 body (clock block then the rest), bits 39 to 276.
pub fn type30_layout() -> Vec<Field> {
    CLOCK.iter().chain(TYPE30_REST).copied().collect()
}

/// The fields of bits 1 to 38.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct CnavHeader {
    /// PRN (1 to 63).
    pub prn: u32,
    /// 17-bit message TOW count: the GPS time of week of the start of the next message in
    /// units of 6 s.
    pub tow_count: u32,
    /// Alert flag.
    pub alert: bool,
}

/// The ephemeris messages 10 and 11 carry, in SI units (angles in radians).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CnavEphemeris {
    /// GPS week number (continuous; sent modulo 8192).
    pub week: u32,
    /// Ephemeris reference time of week `t_oe` (s).
    pub toe_s: f64,
    /// Data predict time of week `t_op` (s).
    pub top_s: f64,
    /// Elevation-dependent user range accuracy index `URA_ED` (-16 to 15).
    pub ura_ed: i32,
    /// L1, L2 and L5 health bits (true = some or all signals bad).
    pub health: [bool; 3],
    /// Semi-major axis at reference time `A` (m).
    pub a_m: f64,
    /// Rate of change of semi-major axis `A_dot` (m/s).
    pub a_dot: f64,
    /// Mean motion difference `delta_n0` (rad/s).
    pub delta_n0: f64,
    /// Rate of mean motion difference `delta_n0_dot` (rad/s²).
    pub delta_n0_dot: f64,
    /// Mean anomaly `M_0` (rad).
    pub m0: f64,
    /// Eccentricity.
    pub e: f64,
    /// Argument of perigee `omega` (rad).
    pub omega: f64,
    /// Longitude of ascending node at the weekly epoch `Omega_0` (rad).
    pub omega0: f64,
    /// Inclination `i_0` (rad).
    pub i0: f64,
    /// Rate of right ascension `Omega_dot` (rad/s), the full rate (the message sends its
    /// difference from `OMEGA_DOT_REF`).
    pub omega_dot: f64,
    /// Rate of inclination `i_0_dot` (rad/s).
    pub i0_dot: f64,
    /// Inclination sine correction `C_is` (rad).
    pub cis: f64,
    /// Inclination cosine correction `C_ic` (rad).
    pub cic: f64,
    /// Orbit radius sine correction `C_rs` (m).
    pub crs: f64,
    /// Orbit radius cosine correction `C_rc` (m).
    pub crc: f64,
    /// Argument of latitude sine correction `C_us` (rad).
    pub cus: f64,
    /// Argument of latitude cosine correction `C_uc` (rad).
    pub cuc: f64,
    /// Integrity status flag.
    pub integrity: bool,
    /// L2C phasing flag.
    pub l2c_phasing: bool,
}

/// The clock block of messages 30 to 37.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct CnavClock {
    /// Data predict time of week `t_op` (s).
    pub top_s: f64,
    /// `URA_NED0` index (-16 to 15).
    pub ura_ned0: i32,
    /// `URA_NED1` index (0 to 7).
    pub ura_ned1: u32,
    /// `URA_NED2` index (0 to 7).
    pub ura_ned2: u32,
    /// Clock reference time of week `t_oc` (s).
    pub toc_s: f64,
    /// Clock bias `a_f0` (s).
    pub af0: f64,
    /// Clock drift `a_f1` (s/s).
    pub af1: f64,
    /// Clock drift rate `a_f2` (s/s²).
    pub af2: f64,
}

/// Group delay and inter-signal corrections (s); `None` is sent as "not available".
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct CnavGroupDelays {
    /// `T_GD`.
    pub tgd: Option<f64>,
    /// `ISC_L1C/A`.
    pub isc_l1ca: Option<f64>,
    /// `ISC_L2C`.
    pub isc_l2c: Option<f64>,
    /// `ISC_L5I5`.
    pub isc_l5i5: Option<f64>,
    /// `ISC_L5Q5`.
    pub isc_l5q5: Option<f64>,
}

/// Klobuchar coefficients in the specification's units: `alpha_n` in s/semicircle^n,
/// `beta_n` in s/semicircle^n.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Klobuchar {
    /// `alpha_0 .. alpha_3`.
    pub alpha: [f64; 4],
    /// `beta_0 .. beta_3`.
    pub beta: [f64; 4],
}

fn b(x: bool) -> f64 {
    f64::from(u8::from(x))
}

/// The physical value of every message-type-10 field.
pub fn type10_value(e: &CnavEphemeris, name: &str) -> Result<f64, String> {
    Ok(match name {
        "wn" => f64::from(e.week % 8192),
        "l1_health" => b(e.health[0]),
        "l2_health" => b(e.health[1]),
        "l5_health" => b(e.health[2]),
        "top" => e.top_s,
        "ura_ed" => f64::from(e.ura_ed),
        "toe" => e.toe_s,
        "delta_a" => e.a_m - A_REF_M,
        "a_dot" => e.a_dot,
        "delta_n0" => e.delta_n0,
        "delta_n0_dot" => e.delta_n0_dot,
        "m0" => e.m0,
        "e" => e.e,
        "omega" => e.omega,
        "integrity" => b(e.integrity),
        "l2c_phasing" => b(e.l2c_phasing),
        "reserved" => 0.0,
        _ => return Err(format!("type 10 has no field {name}")),
    })
}

/// The physical value of every message-type-11 field.
pub fn type11_value(e: &CnavEphemeris, name: &str) -> Result<f64, String> {
    Ok(match name {
        "toe" => e.toe_s,
        "omega0" => e.omega0,
        "i0" => e.i0,
        "delta_omega_dot" => e.omega_dot - OMEGA_DOT_REF_SC * GPS_PI,
        "i0_dot" => e.i0_dot,
        "cis" => e.cis,
        "cic" => e.cic,
        "crs" => e.crs,
        "crc" => e.crc,
        "cus" => e.cus,
        "cuc" => e.cuc,
        "reserved" => 0.0,
        _ => return Err(format!("type 11 has no field {name}")),
    })
}

/// The physical value of every message-type-30 field; group delays that are `None` give
/// `NaN` (packed as the "not available" pattern by [`encode_type30`]).
pub fn type30_value(
    c: &CnavClock,
    g: &CnavGroupDelays,
    k: &Klobuchar,
    wnop: u32,
    name: &str,
) -> Result<f64, String> {
    let gd = |x: Option<f64>| x.unwrap_or(f64::NAN);
    Ok(match name {
        "top" => c.top_s,
        "ura_ned0" => f64::from(c.ura_ned0),
        "ura_ned1" => f64::from(c.ura_ned1),
        "ura_ned2" => f64::from(c.ura_ned2),
        "toc" => c.toc_s,
        "af0" => c.af0,
        "af1" => c.af1,
        "af2" => c.af2,
        "tgd" => gd(g.tgd),
        "isc_l1ca" => gd(g.isc_l1ca),
        "isc_l2c" => gd(g.isc_l2c),
        "isc_l5i5" => gd(g.isc_l5i5),
        "isc_l5q5" => gd(g.isc_l5q5),
        "alpha0" => k.alpha[0],
        "alpha1" => k.alpha[1],
        "alpha2" => k.alpha[2],
        "alpha3" => k.alpha[3],
        "beta0" => k.beta[0],
        "beta1" => k.beta[1],
        "beta2" => k.beta[2],
        "beta3" => k.beta[3],
        "wnop" => f64::from(wnop & 0xFF),
        "reserved" => 0.0,
        _ => return Err(format!("type 30 has no field {name}")),
    })
}

/// Assemble a 300-bit message from its header, type and body bits (238), adding the CRC.
pub fn assemble(h: &CnavHeader, msg_type: u32, body: &[u8]) -> Result<Vec<u8>, String> {
    if body.len() != 238 {
        return Err(format!("CNAV body has {} bits, expected 238", body.len()));
    }
    if h.prn > 63 || h.tow_count >= 100_800 {
        return Err(format!(
            "PRN {} or TOW count {} out of range",
            h.prn, h.tow_count
        ));
    }
    let mut m = Vec::with_capacity(MESSAGE_BITS);
    push_bits(&mut m, PREAMBLE, 8);
    push_bits(&mut m, u64::from(h.prn), 6);
    push_bits(&mut m, u64::from(msg_type), 6);
    push_bits(&mut m, u64::from(h.tow_count), 17);
    push_bits(&mut m, u64::from(h.alert), 1);
    m.extend_from_slice(body);
    let crc = crc24q(&m);
    push_bits(&mut m, u64::from(crc), 24);
    Ok(m)
}

/// Message type 10.
pub fn encode_type10(h: &CnavHeader, e: &CnavEphemeris) -> Result<Vec<u8>, String> {
    assemble(h, 10, &pack(TYPE10, |n| type10_value(e, n))?)
}

/// Message type 11.
pub fn encode_type11(h: &CnavHeader, e: &CnavEphemeris) -> Result<Vec<u8>, String> {
    assemble(h, 11, &pack(TYPE11, |n| type11_value(e, n))?)
}

/// Message type 30.
pub fn encode_type30(
    h: &CnavHeader,
    c: &CnavClock,
    g: &CnavGroupDelays,
    k: &Klobuchar,
    wnop: u32,
) -> Result<Vec<u8>, String> {
    let mut body = Vec::with_capacity(238);
    for f in type30_layout() {
        let v = type30_value(c, g, k, wnop, f.name)?;
        let raw = if v.is_nan() {
            GROUP_DELAY_NA
        } else {
            f.quantise(v)?
        };
        push_bits(&mut body, raw, f.bits);
    }
    assemble(h, 30, &body)
}

/// Forward error correction of a CNAV bit stream from encoder `state` (kept across calls,
/// since the encoding is continuous): two symbols per bit, `G1` first.
pub fn fec_encode(bits: &[u8], state: &mut u8) -> Vec<u8> {
    conv_encode(bits, state, false)
}

/// A decoded message: the header fields and the body fields of its type.
#[derive(Clone, Debug, PartialEq)]
pub struct CnavMessage {
    /// PRN, TOW count and alert flag.
    pub header: CnavHeader,
    /// Message type.
    pub msg_type: u32,
    /// Body fields (bits 39 to 276).
    pub fields: Vec<Decoded>,
}

/// Decode a 300-bit message of type 10, 11 or 30, checking the preamble and the CRC.
pub fn decode_message(bits: &[u8]) -> Result<CnavMessage, String> {
    if bits.len() != MESSAGE_BITS {
        return Err(format!("{} bits, expected {MESSAGE_BITS}", bits.len()));
    }
    if read_bits(bits, 0, 8) != PREAMBLE {
        return Err("preamble is not 10001011".into());
    }
    let crc = read_bits(bits, 276, 24) as u32;
    if crc24q(&bits[..276]) != crc {
        return Err("CRC-24Q mismatch".into());
    }
    let h = unpack(HEADER, bits)?;
    let header = CnavHeader {
        prn: get(&h, "prn")?.raw as u32,
        tow_count: get(&h, "tow_count")?.raw as u32,
        alert: get(&h, "alert")?.raw == 1,
    };
    let msg_type = get(&h, "msg_type")?.raw as u32;
    let body = &bits[38..276];
    let fields = match msg_type {
        10 => unpack(TYPE10, body)?,
        11 => unpack(TYPE11, body)?,
        30 => unpack(&type30_layout(), body)?,
        t => return Err(format!("message type {t} is not decoded here")),
    };
    Ok(CnavMessage {
        header,
        msg_type,
        fields,
    })
}

/// The ephemeris carried by a decoded type-10 and type-11 pair (health, flags and indices
/// as sent; the semi-major axis and node rate restored from their reference values).
pub fn ephemeris_from_messages(
    m10: &CnavMessage,
    m11: &CnavMessage,
) -> Result<CnavEphemeris, String> {
    if m10.msg_type != 10 || m11.msg_type != 11 {
        return Err("need a type 10 and a type 11 message".into());
    }
    let a = |n: &str| get(&m10.fields, n).map(|d| d.value);
    let c = |n: &str| get(&m11.fields, n).map(|d| d.value);
    Ok(CnavEphemeris {
        week: a("wn")? as u32,
        toe_s: a("toe")?,
        top_s: a("top")?,
        ura_ed: a("ura_ed")? as i32,
        health: [
            a("l1_health")? == 1.0,
            a("l2_health")? == 1.0,
            a("l5_health")? == 1.0,
        ],
        a_m: A_REF_M + a("delta_a")?,
        a_dot: a("a_dot")?,
        delta_n0: a("delta_n0")?,
        delta_n0_dot: a("delta_n0_dot")?,
        m0: a("m0")?,
        e: a("e")?,
        omega: a("omega")?,
        omega0: c("omega0")?,
        i0: c("i0")?,
        omega_dot: OMEGA_DOT_REF_SC * GPS_PI + c("delta_omega_dot")?,
        i0_dot: c("i0_dot")?,
        cis: c("cis")?,
        cic: c("cic")?,
        crs: c("crs")?,
        crc: c("crc")?,
        cus: c("cus")?,
        cuc: c("cuc")?,
        integrity: a("integrity")? == 1.0,
        l2c_phasing: a("l2c_phasing")? == 1.0,
    })
}

/// CNAV ephemeris inputs from a legacy broadcast record: `A = sqrt_a^2`, `A_dot = 0`,
/// `delta_n0_dot = 0`, `t_op = t_oe`, healthy on all three carriers when the LNAV health is
/// zero, `URA_ED` index 0. MODELLED: LNAV values sent in the CNAV format.
pub fn ephemeris_from_rinex(r: &RinexEphemeris) -> CnavEphemeris {
    let bad = r.sv_health != 0.0;
    CnavEphemeris {
        week: r.gps_week.max(0.0) as u32,
        toe_s: r.toe,
        top_s: r.toe,
        ura_ed: 0,
        health: [bad; 3],
        a_m: r.sqrt_a * r.sqrt_a,
        a_dot: 0.0,
        delta_n0: r.delta_n,
        delta_n0_dot: 0.0,
        m0: r.m0,
        e: r.e,
        omega: r.omega,
        omega0: r.omega0,
        i0: r.i0,
        omega_dot: r.omega_dot,
        i0_dot: r.idot,
        cis: r.cis,
        cic: r.cic,
        crs: r.crs,
        crc: r.crc,
        cus: r.cus,
        cuc: r.cuc,
        integrity: false,
        l2c_phasing: false,
    }
}

/// The clock block from a legacy broadcast record (`t_op = t_oc`, indices zero).
pub fn clock_from_rinex(r: &RinexEphemeris) -> CnavClock {
    let toc = r.toc.gps_time_of_week();
    CnavClock {
        top_s: toc,
        ura_ned0: 0,
        ura_ned1: 0,
        ura_ned2: 0,
        toc_s: toc,
        af0: r.af0,
        af1: r.af1,
        af2: r.af2,
    }
}

#[cfg(test)]
mod tests {
    use super::super::layout_bits;
    use super::*;

    #[test]
    fn bodies_fill_bits_39_to_276() {
        assert_eq!(layout_bits(HEADER), 38);
        assert_eq!(layout_bits(TYPE10), 238);
        assert_eq!(layout_bits(TYPE11), 238);
        assert_eq!(layout_bits(&type30_layout()), 238);
    }
}
