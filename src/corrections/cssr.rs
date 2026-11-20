// SPDX-License-Identifier: AGPL-3.0-only
//! Compact SSR (RTCM message 4073, sub types 1 to 12) as broadcast on QZSS L6.
//!
//! References (section and table numbers are the documents'):
//! * CLAS: Quasi-Zenith Satellite System Interface Specification, Centimeter Level
//!   Augmentation Service (IS-QZSS-L6-008), Cabinet Office, 18 March 2026, section 4.1.2.2
//!   (sub types 1 to 12, Tables 4.1.2-3 to 4.1.2-42).
//! * MADOCA-PPP: Quasi-Zenith Satellite System Interface Specification, Multi-GNSS Advanced
//!   Orbit and Clock Augmentation - Precise Point Positioning (IS-QZSS-MDC-005), Cabinet
//!   Office, section 4.2.2 (sub types 1 to 5 and 7; GNSS ID 7 for BDS-3, Tables 4.2.2-7 to
//!   4.2.2-9).
//!
//! Layouts read here:
//! * Sub type 1 (mask): message number (12), sub type (4), GPS epoch time (20), update interval
//!   (4), multiple message indicator (1), IOD SSR (4), number of GNSS (4); per GNSS: GNSS ID
//!   (4), satellite mask (40), signal mask (16), cell-mask availability (1), cell mask
//!   (satellites x signals bits when available).
//! * Sub types 2 to 9, 11 and 12 begin with message number, sub type, GNSS hourly epoch time
//!   (12), update interval (4), multiple message indicator (1) and IOD SSR (4). Satellites are
//!   those of the mask, GNSS by GNSS in mask order. Sub type 10 has 22 header bits (message
//!   number, sub type, multiple message indicator, counter, size).
//! * 2: GNSS IODE (10 bits Galileo, 8 others), radial (15, 0.0016 m), along (13, 0.0064 m),
//!   cross (13, 0.0064 m). 3: C0 (15, 0.0016 m). 4: code bias (11, 0.02 m) per cell. 5: phase
//!   bias (15, 0.001 m) and discontinuity (2) per cell. 6: code, phase and network flags,
//!   network ID (5) and network satellite mask when the network flag is set, then per cell
//!   the present biases. 7: URA (6). 8: STEC type (2), network ID (5), network satellite
//!   mask; per network satellite quality (6) and C00 (14, 0.05 TECU), C01 and C10 (12, 0.02
//!   TECU/deg), C11 (10, 0.02 TECU/deg2), C02 and C20 (8, 0.005 TECU/deg2) by type.
//!   9: troposphere type (2), STEC residual range (1), network ID (5), network satellite mask,
//!   troposphere quality (6), number of grids (6); per grid hydrostatic (9, 0.004 m), wet (8,
//!   0.004 m) and per network satellite an STEC residual (7 or 16 bits, 0.04 TECU).
//!   10: auxiliary data (40 x (size + 1) bits) after the counter (3) and data size (2).
//!   11: orbit, clock and network flags, network ID and mask when flagged; per satellite the
//!   orbit and clock fields of sub types 2 and 3 as flagged. 12: troposphere and STEC
//!   availability (2 each), network ID (5), number of grids (6); a troposphere part (quality,
//!   type, T00 9 bits 0.004 m, T01 and T10 7 bits 0.002 m/deg, T11 7 bits 0.001 m/deg by type;
//!   residual size, offset 4 bits 0.02 m, residuals 6 or 8 bits 0.004 m) and an STEC part
//!   (network mask; per satellite quality, type, polynomial, residual size and per-grid
//!   residuals of Table 4.1.2-40).
//!
//! The availability fields of sub type 12 are read as: bit 0 (value 1) the polynomial (or
//! hydrostatic) term, bit 1 (value 2) the residual (or wet) term, with the troposphere quality
//! present whenever either is. The document fixes both bits to one for CLAS; other values are
//! decoded on this reading. Values equal to the most negative code ("data not available")
//! are `null`.

use super::bits::{self, Cursor};
use serde::Serialize;

/// Which service's tables apply (signal names, GNSS ID 7).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "lowercase")]
pub enum Flavour {
    /// CLAS (IS-QZSS-L6-008).
    Clas,
    /// MADOCA-PPP (IS-QZSS-MDC-005).
    Madoca,
}

/// Satellite label for a GNSS ID and a 1-based satellite mask position.
pub fn sat_label(f: Flavour, gnss_id: u8, n: u32) -> String {
    match (gnss_id, f) {
        (0, _) => super::label('G', n),
        (1, _) => super::label('R', n),
        (2, _) => super::label('E', n),
        (3, _) => super::label('C', n),
        (4, _) => super::label('J', n),
        (5, _) => super::label('S', n + 119),
        (7, Flavour::Madoca) => super::label('C', n + 18),
        _ => format!("gnss{gnss_id}:{n}"),
    }
}

/// Signal name for a GNSS ID and signal mask index (CLAS Table 4.1.2-10, MADOCA Table
/// 4.2.2-9).
pub fn signal_name(f: Flavour, gnss_id: u8, idx: u8) -> Option<&'static str> {
    const GPS: [&str; 14] = [
        "L1 C/A", "L1 P", "L1 Z", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)", "L2C(L)", "L2C(M+L)",
        "L2 P", "L2 Z", "L5 I", "L5 Q", "L5 I+Q",
    ];
    const GLO: [&str; 13] = [
        "G1 C/A", "G1 P", "G2 C/A", "G2 P", "G1a(D)", "G1a(P)", "G1a(D+P)", "G2a(D)", "G2a(P)",
        "G2a(D+P)", "G3 I", "G3 Q", "G3 I+Q",
    ];
    const GAL_CLAS: [&str; 15] = [
        "E1 B",
        "E1 C",
        "E1 B+C",
        "E5a I",
        "E5a Q",
        "E5a I+Q",
        "E5b I",
        "E5b Q",
        "E5b I+Q",
        "E5 I",
        "E5 Q",
        "E5 I+Q",
        "service 1",
        "service 2",
        "service 3",
    ];
    const GAL_MDC: [&str; 14] = [
        "E1 B", "E1 C", "E1 B+C", "E5a I", "E5a Q", "E5a I+Q", "E5b I", "E5b Q", "E5b I+Q", "E5 I",
        "E5 Q", "E5 I+Q", "E6 B", "E6 C",
    ];
    const BDS_CLAS: [&str; 9] = [
        "B1 I", "B1 Q", "B1 I+Q", "B3 I", "B3 Q", "B3 I+Q", "B2 I", "B2 Q", "B2 I+Q",
    ];
    const BDS_MDC: [&str; 15] = [
        "B1 I",
        "B1 Q",
        "B1 I+Q",
        "B3 I",
        "B3 Q",
        "B3 I+Q",
        "B2/B2b I",
        "B2/B2b Q",
        "B2/B2b I+Q",
        "B1C(D)",
        "B1C(P)",
        "B1C(D+P)",
        "B2a(D)",
        "B2a(P)",
        "B2a(D+P)",
    ];
    const QZS_CLAS: [&str; 10] = [
        "L1 C/A", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)", "L2C(L)", "L2C(M+L)", "L5 I", "L5 Q",
        "L5 I+Q",
    ];
    const QZS_MDC: [&str; 14] = [
        "L1 C/A", "L1C(D)", "L1C(P)", "L1C(D+P)", "L2C(M)", "L2C(L)", "L2C(M+L)", "L5 I", "L5 Q",
        "L5 I+Q", "L6D", "L6P", "L6E", "L1 C/B",
    ];
    const SBAS: [&str; 4] = ["L1 C/A", "L5 I", "L5 Q", "L5 I+Q"];
    let t: &[&str] = match (gnss_id, f) {
        (0, _) => &GPS,
        (1, _) => &GLO,
        (2, Flavour::Clas) => &GAL_CLAS,
        (2, Flavour::Madoca) => &GAL_MDC,
        (3, Flavour::Clas) => &BDS_CLAS,
        (3, Flavour::Madoca) | (7, Flavour::Madoca) => &BDS_MDC,
        (4, Flavour::Clas) => &QZS_CLAS,
        (4, Flavour::Madoca) => &QZS_MDC,
        (5, Flavour::Clas) => &SBAS,
        _ => return None,
    };
    t.get(idx as usize).copied()
}

/// The mask of one GNSS.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SysMask {
    /// GNSS ID.
    pub gnss_id: u8,
    /// Satellites.
    pub satellites: Vec<String>,
    /// Signal mask indices.
    pub signals: Vec<u8>,
    /// Signal names (`null` for an index the tables leave undefined).
    pub signal_names: Vec<Option<&'static str>>,
    /// Cell mask rows, when sent.
    pub cell_mask: Option<Vec<Vec<u8>>>,
}

/// The mask state sub types 2 to 12 depend on.
#[derive(Clone, Debug, PartialEq)]
pub struct Mask {
    /// IOD SSR of the mask.
    pub iod_ssr: u8,
    /// Systems in mask order.
    pub systems: Vec<SysMask>,
}

impl Mask {
    /// All satellites: (label, GNSS ID, system index, satellite index in the system).
    fn sats(&self) -> Vec<(String, u8, usize, usize)> {
        let mut v = Vec::new();
        for (si, s) in self.systems.iter().enumerate() {
            for (i, l) in s.satellites.iter().enumerate() {
                v.push((l.clone(), s.gnss_id, si, i));
            }
        }
        v
    }
    fn cells(&self, si: usize, i: usize) -> Vec<u8> {
        let s = &self.systems[si];
        match &s.cell_mask {
            Some(cm) => s
                .signals
                .iter()
                .zip(&cm[i])
                .filter(|(_, c)| **c == 1)
                .map(|(x, _)| *x)
                .collect(),
            None => s.signals.clone(),
        }
    }
}

/// Orbit correction of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct OrbitSat {
    /// Satellite.
    pub sat: String,
    /// GNSS IODE.
    pub iode: u32,
    /// Radial (m).
    pub radial_m: Option<f64>,
    /// Along-track (m).
    pub along_m: Option<f64>,
    /// Cross-track (m).
    pub cross_m: Option<f64>,
}

/// Clock correction of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockSat {
    /// Satellite.
    pub sat: String,
    /// C0 (m).
    pub c0_m: Option<f64>,
}

/// Biases of one signal.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct SigBias {
    /// Signal mask index.
    pub signal: u8,
    /// Code bias (m), when the message carries one (`null`: not available).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub code_bias_m: Option<Option<f64>>,
    /// Phase bias (m), when the message carries one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub phase_bias_m: Option<Option<f64>>,
    /// Phase discontinuity indicator.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub discontinuity: Option<u8>,
}

/// Biases of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct BiasSat {
    /// Satellite.
    pub sat: String,
    /// Biases per cell.
    pub biases: Vec<SigBias>,
}

/// URA of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct UraSat {
    /// Satellite.
    pub sat: String,
    /// Raw 6-bit class and value.
    pub ura: u8,
    /// URA (mm), `null` when unknown or above 5466.5 mm.
    pub ura_mm: Option<f64>,
}

/// STEC data of one satellite (sub types 8 and 12).
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct StecSat {
    /// Satellite.
    pub sat: String,
    /// Quality indicator (raw 6 bits).
    pub quality: u8,
    /// STEC correction type.
    pub correction_type: u8,
    /// Polynomial coefficients C00, C01, C10, C11, C02, C20 as far as the type sends (TECU,
    /// TECU/deg, TECU/deg2).
    pub coefficients: Vec<Option<f64>>,
    /// Residual size (sub type 12).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub residual_size: Option<u8>,
    /// Residual per grid (TECU, sub type 12).
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub residuals_tecu: Vec<Option<f64>>,
}

/// One grid point of sub type 9.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GridPoint {
    /// Hydrostatic vertical delay variation (m).
    pub hydrostatic_m: Option<f64>,
    /// Wet vertical delay variation (m).
    pub wet_m: Option<f64>,
    /// STEC residual per network satellite (TECU).
    pub stec_residuals_tecu: Vec<Option<f64>>,
}

/// Troposphere part of sub type 12.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Troposphere {
    /// Quality indicator (raw 6 bits).
    pub quality: u8,
    /// Correction type, when the hydrostatic term is present.
    pub correction_type: Option<u8>,
    /// T00, T01, T10, T11 as far as the type sends (m, m/deg).
    pub coefficients: Vec<Option<f64>>,
    /// Residual size (0: 6 bits, 1: 8 bits), when the wet term is present.
    pub residual_size: Option<u8>,
    /// Residual offset (m).
    pub residual_offset_m: Option<f64>,
    /// Residual per grid (m).
    pub residuals_m: Vec<Option<f64>>,
}

/// One Compact SSR message.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Message {
    /// Sub type.
    pub subtype: u8,
    /// GPS epoch time (sub type 1, s of week) or GNSS hourly epoch time (s of hour).
    pub epoch_s: u32,
    /// SSR update interval code.
    pub update_interval: u8,
    /// Multiple message indicator.
    pub multiple: bool,
    /// IOD SSR.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub iod_ssr: Option<u8>,
    /// Mask (sub type 1).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub mask: Option<Vec<SysMask>>,
    /// Compact network ID.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub network_id: Option<u8>,
    /// Satellites of the network satellite mask.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub network_sats: Option<Vec<String>>,
    /// Orbit corrections.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub orbits: Vec<OrbitSat>,
    /// Clock corrections.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub clocks: Vec<ClockSat>,
    /// Code and/or phase biases.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub biases: Vec<BiasSat>,
    /// URAs.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub uras: Vec<UraSat>,
    /// STEC data.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub stec: Vec<StecSat>,
    /// Sub type 9 troposphere type, STEC residual range and quality.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub grid_header: Option<(u8, u8, u8)>,
    /// Sub type 9 grid points.
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub grids: Vec<GridPoint>,
    /// Sub type 12 troposphere.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub troposphere: Option<Troposphere>,
    /// Sub type 10 counter, data size and auxiliary data (hex).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub service_info: Option<(u8, u8, String)>,
}

fn new_msg(subtype: u8, epoch_s: u32, update_interval: u8, multiple: bool) -> Message {
    Message {
        subtype,
        epoch_s,
        update_interval,
        multiple,
        iod_ssr: None,
        mask: None,
        network_id: None,
        network_sats: None,
        orbits: Vec::new(),
        clocks: Vec::new(),
        biases: Vec::new(),
        uras: Vec::new(),
        stec: Vec::new(),
        grid_header: None,
        grids: Vec::new(),
        troposphere: None,
        service_info: None,
    }
}

/// Why parsing a subframe stopped early.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "snake_case")]
pub enum Stop {
    /// A message ran past the end of the data.
    Truncated,
    /// A sub type 2 to 12 arrived with no mask.
    NoMask,
    /// Its IOD SSR differs from the mask's.
    IodSsrMismatch,
    /// A sub type this decoder does not define.
    UnknownSubtype,
}

fn stec_coeffs(c: &mut Cursor, ty: u8) -> Option<Vec<Option<f64>>> {
    const F: [(usize, f64); 6] = [
        (14, 0.05),
        (12, 0.02),
        (12, 0.02),
        (10, 0.02),
        (8, 0.005),
        (8, 0.005),
    ];
    let n = [1, 3, 4, 6][ty as usize & 3];
    let mut v = Vec::with_capacity(n);
    for (bits, lsb) in &F[..n] {
        v.push(c.scaled_na(*bits, *lsb)?);
    }
    Some(v)
}

fn network(c: &mut Cursor, sats: &[(String, u8, usize, usize)]) -> Option<(u8, Vec<usize>)> {
    let id = c.u(5)? as u8;
    let m = c.take(sats.len())?;
    Some((
        id,
        m.iter()
            .enumerate()
            .filter(|(_, b)| **b == 1)
            .map(|(i, _)| i)
            .collect(),
    ))
}

/// Read one message at the cursor; `Ok(None)` at the end of the messages (a message number
/// other than 4073, or fewer than 16 bits left).
pub fn read_message(
    c: &mut Cursor,
    f: Flavour,
    mask: &mut Option<Mask>,
) -> Result<Option<Message>, Stop> {
    if c.remaining() < 16 {
        return Ok(None);
    }
    let start = c.pos;
    if c.u(12) != Some(4073) {
        c.pos = start;
        return Ok(None);
    }
    let t = |v: Option<u64>| v.ok_or(Stop::Truncated);
    let st = t(c.u(4))? as u8;
    if st == 1 {
        let epoch = t(c.u(20))? as u32;
        let ui = t(c.u(4))? as u8;
        let mm = t(c.u(1))? == 1;
        let iod = t(c.u(4))? as u8;
        let nsys = t(c.u(4))?;
        let mut systems = Vec::new();
        for _ in 0..nsys {
            let gnss_id = t(c.u(4))? as u8;
            let satm = c.take(40).ok_or(Stop::Truncated)?;
            let sigm = c.take(16).ok_or(Stop::Truncated)?;
            let cmaf = t(c.u(1))? == 1;
            let sats = bits::set_positions(&satm);
            let signals: Vec<u8> = bits::set_positions(&sigm)
                .into_iter()
                .map(|p| (p - 1) as u8)
                .collect();
            let cell_mask = if cmaf {
                let mut rows = Vec::new();
                for _ in 0..sats.len() {
                    rows.push(c.take(signals.len()).ok_or(Stop::Truncated)?);
                }
                Some(rows)
            } else {
                None
            };
            systems.push(SysMask {
                gnss_id,
                satellites: sats.iter().map(|n| sat_label(f, gnss_id, *n)).collect(),
                signal_names: signals
                    .iter()
                    .map(|s| signal_name(f, gnss_id, *s))
                    .collect(),
                signals,
                cell_mask,
            });
        }
        let mut m = new_msg(1, epoch, ui, mm);
        m.iod_ssr = Some(iod);
        m.mask = Some(systems.clone());
        *mask = Some(Mask {
            iod_ssr: iod,
            systems,
        });
        return Ok(Some(m));
    }
    if !(2..=12).contains(&st) {
        return Err(Stop::UnknownSubtype);
    }
    if st == 10 {
        // 22 + 40 x (size + 1) bits: no epoch, update interval or IOD SSR.
        let mm = t(c.u(1))? == 1;
        let mut m = new_msg(st, 0, 0, mm);
        let counter = t(c.u(3))? as u8;
        let size = t(c.u(2))? as u8;
        let data = c
            .take(40 * (usize::from(size) + 1))
            .ok_or(Stop::Truncated)?;
        let hex: String = bits::to_bytes(&data)
            .iter()
            .map(|b| format!("{b:02x}"))
            .collect();
        m.service_info = Some((counter, size, hex));
        return Ok(Some(m));
    }
    let epoch = t(c.u(12))? as u32;
    let ui = t(c.u(4))? as u8;
    let mm = t(c.u(1))? == 1;
    let mut m = new_msg(st, epoch, ui, mm);
    let iod = t(c.u(4))? as u8;
    m.iod_ssr = Some(iod);
    let Some(mk) = mask.as_ref() else {
        return Err(Stop::NoMask);
    };
    if mk.iod_ssr != iod {
        return Err(Stop::IodSsrMismatch);
    }
    let sats = mk.sats();
    let label_of = |i: usize| sats[i].0.clone();
    let all: Vec<usize> = (0..sats.len()).collect();
    let tr = Stop::Truncated;
    match st {
        2 => {
            for (l, g, _, _) in &sats {
                m.orbits.push(read_orbit(c, l, *g).ok_or(tr)?);
            }
        }
        3 => {
            for (l, _, _, _) in &sats {
                m.clocks.push(ClockSat {
                    sat: l.clone(),
                    c0_m: c.scaled_na(15, 0.0016).ok_or(tr)?,
                });
            }
        }
        4 | 5 => {
            for (l, _, si, i) in &sats {
                let mut biases = Vec::new();
                for sig in mk.cells(*si, *i) {
                    let mut b = SigBias {
                        signal: sig,
                        code_bias_m: None,
                        phase_bias_m: None,
                        discontinuity: None,
                    };
                    if st == 4 {
                        b.code_bias_m = Some(c.scaled_na(11, 0.02).ok_or(tr)?);
                    } else {
                        b.phase_bias_m = Some(c.scaled_na(15, 0.001).ok_or(tr)?);
                        b.discontinuity = Some(c.u(2).ok_or(tr)? as u8);
                    }
                    biases.push(b);
                }
                m.biases.push(BiasSat {
                    sat: l.clone(),
                    biases,
                });
            }
        }
        6 => {
            let cb = t(c.u(1))? == 1;
            let pb = t(c.u(1))? == 1;
            let nb = t(c.u(1))? == 1;
            let which = if nb {
                let (id, w) = network(c, &sats).ok_or(tr)?;
                m.network_id = Some(id);
                m.network_sats = Some(w.iter().map(|i| label_of(*i)).collect());
                w
            } else {
                all.clone()
            };
            for i in which {
                let (l, _, si, k) = &sats[i];
                let mut biases = Vec::new();
                for sig in mk.cells(*si, *k) {
                    let mut b = SigBias {
                        signal: sig,
                        code_bias_m: None,
                        phase_bias_m: None,
                        discontinuity: None,
                    };
                    if cb {
                        b.code_bias_m = Some(c.scaled_na(11, 0.02).ok_or(tr)?);
                    }
                    if pb {
                        b.phase_bias_m = Some(c.scaled_na(15, 0.001).ok_or(tr)?);
                        b.discontinuity = Some(c.u(2).ok_or(tr)? as u8);
                    }
                    biases.push(b);
                }
                m.biases.push(BiasSat {
                    sat: l.clone(),
                    biases,
                });
            }
        }
        7 => {
            for (l, _, _, _) in &sats {
                let ura = c.u(6).ok_or(tr)? as u8;
                m.uras.push(UraSat {
                    sat: l.clone(),
                    ura,
                    ura_mm: super::b2b::ura_mm(ura),
                });
            }
        }
        8 => {
            let ty = t(c.u(2))? as u8;
            let (id, w) = network(c, &sats).ok_or(tr)?;
            m.network_id = Some(id);
            m.network_sats = Some(w.iter().map(|i| label_of(*i)).collect());
            for i in w {
                let quality = c.u(6).ok_or(tr)? as u8;
                m.stec.push(StecSat {
                    sat: label_of(i),
                    quality,
                    correction_type: ty,
                    coefficients: stec_coeffs(c, ty).ok_or(tr)?,
                    residual_size: None,
                    residuals_tecu: Vec::new(),
                });
            }
        }
        9 => {
            let trop_type = t(c.u(2))? as u8;
            let range = t(c.u(1))? as u8;
            let (id, w) = network(c, &sats).ok_or(tr)?;
            m.network_id = Some(id);
            m.network_sats = Some(w.iter().map(|i| label_of(*i)).collect());
            let q = t(c.u(6))? as u8;
            m.grid_header = Some((trop_type, range, q));
            let ngrid = t(c.u(6))?;
            let rbits = if range == 1 { 16 } else { 7 };
            for _ in 0..ngrid {
                let hydrostatic_m = c.scaled_na(9, 0.004).ok_or(tr)?;
                let wet_m = c.scaled_na(8, 0.004).ok_or(tr)?;
                let mut res = Vec::new();
                for _ in &w {
                    res.push(c.scaled_na(rbits, 0.04).ok_or(tr)?);
                }
                m.grids.push(GridPoint {
                    hydrostatic_m,
                    wet_m,
                    stec_residuals_tecu: res,
                });
            }
        }
        11 => {
            let ob = t(c.u(1))? == 1;
            let cl = t(c.u(1))? == 1;
            let nw = t(c.u(1))? == 1;
            let which = if nw {
                let (id, w) = network(c, &sats).ok_or(tr)?;
                m.network_id = Some(id);
                m.network_sats = Some(w.iter().map(|i| label_of(*i)).collect());
                w
            } else {
                all.clone()
            };
            for i in which {
                let (l, g, _, _) = &sats[i];
                if ob {
                    m.orbits.push(read_orbit(c, l, *g).ok_or(tr)?);
                }
                if cl {
                    m.clocks.push(ClockSat {
                        sat: l.clone(),
                        c0_m: c.scaled_na(15, 0.0016).ok_or(tr)?,
                    });
                }
            }
        }
        12 => {
            let trop_avail = t(c.u(2))? as u8;
            let stec_avail = t(c.u(2))? as u8;
            m.network_id = Some(t(c.u(5))? as u8);
            let ngrid = t(c.u(6))? as usize;
            if trop_avail != 0 {
                let quality = t(c.u(6))? as u8;
                let mut tp = Troposphere {
                    quality,
                    correction_type: None,
                    coefficients: Vec::new(),
                    residual_size: None,
                    residual_offset_m: None,
                    residuals_m: Vec::new(),
                };
                if trop_avail & 1 == 1 {
                    let ty = t(c.u(2))? as u8;
                    tp.correction_type = Some(ty);
                    tp.coefficients.push(c.scaled_na(9, 0.004).ok_or(tr)?);
                    let more: &[(usize, f64)] = match ty {
                        1 => &[(7, 0.002), (7, 0.002)],
                        2 => &[(7, 0.002), (7, 0.002), (7, 0.001)],
                        _ => &[],
                    };
                    for (b, l) in more {
                        tp.coefficients.push(c.scaled_na(*b, *l).ok_or(tr)?);
                    }
                }
                if trop_avail & 2 == 2 {
                    let size = t(c.u(1))? as u8;
                    tp.residual_size = Some(size);
                    tp.residual_offset_m = Some(t(c.u(4))? as f64 * 0.02);
                    let rb = if size == 1 { 8 } else { 6 };
                    for _ in 0..ngrid {
                        tp.residuals_m.push(c.scaled_na(rb, 0.004).ok_or(tr)?);
                    }
                }
                m.troposphere = Some(tp);
            }
            if stec_avail != 0 {
                let m_sats = c.take(sats.len()).ok_or(tr)?;
                let w: Vec<usize> = m_sats
                    .iter()
                    .enumerate()
                    .filter(|(_, b)| **b == 1)
                    .map(|(i, _)| i)
                    .collect();
                m.network_sats = Some(w.iter().map(|i| label_of(*i)).collect());
                for i in w {
                    let quality = t(c.u(6))? as u8;
                    let ty = t(c.u(2))? as u8;
                    let coefficients = if stec_avail & 1 == 1 {
                        stec_coeffs(c, ty).ok_or(tr)?
                    } else {
                        Vec::new()
                    };
                    let mut s = StecSat {
                        sat: label_of(i),
                        quality,
                        correction_type: ty,
                        coefficients,
                        residual_size: None,
                        residuals_tecu: Vec::new(),
                    };
                    if stec_avail & 2 == 2 {
                        let size = t(c.u(2))? as u8;
                        let (b, lsb) = [(4, 0.04), (4, 0.12), (5, 0.16), (7, 0.24)][size as usize];
                        s.residual_size = Some(size);
                        for _ in 0..ngrid {
                            s.residuals_tecu.push(c.scaled_na(b, lsb).ok_or(tr)?);
                        }
                    }
                    m.stec.push(s);
                }
            }
        }
        _ => return Err(Stop::UnknownSubtype),
    }
    Ok(Some(m))
}

fn read_orbit(c: &mut Cursor, l: &str, gnss_id: u8) -> Option<OrbitSat> {
    let iode = c.u(if gnss_id == 2 { 10 } else { 8 })? as u32;
    Some(OrbitSat {
        sat: l.to_string(),
        iode,
        radial_m: c.scaled_na(15, 0.0016)?,
        along_m: c.scaled_na(13, 0.0064)?,
        cross_m: c.scaled_na(13, 0.0064)?,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn labels_and_signal_tables() {
        assert_eq!(sat_label(Flavour::Clas, 4, 1), "J01");
        assert_eq!(sat_label(Flavour::Madoca, 7, 1), "C19");
        assert_eq!(sat_label(Flavour::Clas, 7, 1), "gnss7:1");
        assert_eq!(sat_label(Flavour::Clas, 5, 1), "S120");
        assert_eq!(signal_name(Flavour::Madoca, 2, 12), Some("E6 B"));
        assert_eq!(signal_name(Flavour::Clas, 2, 12), Some("service 1"));
        assert_eq!(signal_name(Flavour::Madoca, 7, 12), Some("B2a(D)"));
        assert_eq!(signal_name(Flavour::Clas, 3, 9), None);
    }

    #[test]
    fn a_non_4073_number_ends_the_messages() {
        let b = bits::of_bytes(&[0u8; 8]);
        let mut c = Cursor::new(&b);
        let mut mask = None;
        assert_eq!(read_message(&mut c, Flavour::Clas, &mut mask), Ok(None));
        assert_eq!(c.pos, 0);
    }
}
