// SPDX-License-Identifier: AGPL-3.0-only
//! QZSS L1S messages after channel decoding: the Sub-meter Level Augmentation Service (SLAS),
//! the JMA DC Report and the DCX message.
//!
//! Sources, read for this decoder: IS-QZSS-L1S-009 section 4.1 (the 250-bit message block:
//! 8-bit preamble, 6-bit message type, 212-bit data field, CRC-24Q; message types 0, 43, 44, 47
//! to 51 and 63), IS-QZSS-DCR-017 section 4.1.2.3 (the JMA DC Report in message type 43: the
//! report classification, disaster category, report time and information type common to every
//! category, the category bodies, and the version number in bits 215 to 220) and
//! IS-QZSS-DCX-004 section 4.2 (message type 44, decoded by [`super::dcx`]). Bit numbers below
//! are the documents' 1-based positions in the 250-bit block.
//!
//! What is decoded: the preamble pattern (A `01010011`, B `10011010`, C `11000110`), the
//! message type and CRC; MT47 monitoring stations (code and name from Table 4.1.2-4, latitude,
//! longitude about 115° E, height about −100 m; L1S-009 states that the location broadcast in
//! MT47 takes precedence over the table, so the decoder reports only the broadcast values);
//! MT48 PRN mask (IODP and the masked satellites: GPS 1–64, QZSS 193–201, GLONASS slots 1–36,
//! Galileo 1–36, BeiDou 1–36); MT49 data issue numbers and MT50 pseudorange corrections
//! (0.04 m, the −81.92 m code marks the satellite unhealthy for 30 s), both mapped to
//! satellites through the last MT48 with the same IODP; MT51 satellite health; MT0 test mode;
//! MT63 null. MT43: the common header of the JMA DC Report and its category body
//! ([`super::dcr`]); the body is also kept as hexadecimal. MT44: the DCX message.
//!
//! Frames are the 250 decoded bits (the 1/2-rate convolutional code already removed), in
//! hexadecimal; trailing pad bits are ignored, so the 63-digit message field of a `$QZQSM`
//! receiver sentence (DCR-017 section 4.3, DCX-004 section 4.4) can be given as it is.

use super::bits::Cursor;
use super::Frame;
use serde::Serialize;
use std::collections::HashMap;

/// Message block length (bits).
pub const BLOCK_BITS: usize = 250;

/// The three preamble patterns, in transmission order.
pub const PREAMBLES: [(char, u8); 3] = [('A', 0b0101_0011), ('B', 0b1001_1010), ('C', 0b1100_0110)];

/// Monitoring stations of IS-QZSS-L1S-009 Table 4.1.2-4 (code, name).
pub const STATIONS: &[(u8, &str)] = &[
    (0, "Sapporo"),
    (1, "Sendai"),
    (3, "Hitachiota"),
    (5, "Komatsu"),
    (6, "Kobe"),
    (7, "Hiroshima"),
    (8, "Fukuoka"),
    (9, "Tanegashima"),
    (10, "Amami"),
    (11, "Itoman"),
    (12, "Miyako"),
    (13, "Ishigaki"),
    (14, "Chichijima"),
];

/// Disaster categories of IS-QZSS-DCR-017 Table 4.1.2-2.
pub const DISASTER_CATEGORIES: &[(u8, &str)] = &[
    (1, "earthquake_early_warning"),
    (2, "hypocenter"),
    (3, "seismic_intensity"),
    (4, "nankai_trough_earthquake"),
    (5, "tsunami"),
    (6, "northwest_pacific_tsunami"),
    (8, "volcano"),
    (9, "ash_fall"),
    (10, "weather"),
    (11, "flood"),
    (12, "typhoon"),
    (14, "marine"),
];

/// Satellite of a PRN-mask number 17..=197 (Table 4.1.2-6); QZSS PRN 193..201 as J01..J09.
pub fn mask_label(n: u32) -> Option<String> {
    Some(match n {
        17..=80 => super::label('G', n - 16),
        81..=89 => super::label('J', n + 112 - 192),
        90..=125 => super::label('R', n - 89),
        126..=161 => super::label('E', n - 125),
        162..=197 => super::label('C', n - 161),
        _ => return None,
    })
}

/// A monitoring station of MT47.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Station {
    /// Station code (6 bits) as broadcast; 63 marks an empty slot and is not reported.
    pub code: u8,
    /// Station name looked up from [`STATIONS`]; `None` for a code not in the table.
    pub name: Option<&'static str>,
    /// Broadcast latitude, degrees (0.005° steps, rounded to 3 decimals).
    pub lat_deg: Option<f64>,
    /// Broadcast longitude, degrees: 115° plus the signed offset in 0.005° steps, rounded to 3 decimals.
    pub lon_deg: Option<f64>,
    /// Broadcast height, metres: −100 m plus the 6-bit code in 50 m steps.
    pub height_m: Option<f64>,
}

/// One pseudorange correction of MT50.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Prc {
    /// Satellite label (`G01`, `J01`, ...) from the MT48 mask entry this correction belongs to.
    pub sat: String,
    /// Metres; `None` for the −81.92 m "do not use" code.
    pub prc_m: Option<f64>,
    /// Set when the raw value is the −81.92 m code: the satellite is to be treated as unhealthy for 30 s.
    pub unhealthy_30s: bool,
}

/// One decoded message.
#[derive(Clone, Debug, Serialize, PartialEq, Default)]
pub struct Message {
    /// 0-based position of the frame in the decoded input.
    pub index: usize,
    /// Preamble pattern (`A`, `B` or `C`) matched by the first 8 bits; `None` for no match.
    pub preamble: Option<char>,
    /// Message type (6 bits after the preamble).
    pub mt: u8,
    /// Whether the CRC-24Q over bits 1 to 226 matches the last 24 bits; the body is decoded only when it does.
    pub crc_ok: bool,
    /// MT0: `Some(true)` for the test-mode message.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub test_mode: Option<bool>,
    /// MT47: the monitoring stations broadcast (up to 5; empty slots with code 63 skipped).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub stations: Option<Vec<Station>>,
    /// MT48, MT49, MT50: issue of data of the PRN mask (2 bits).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub iodp: Option<u8>,
    /// MT49, MT50: issue of data of the data issue numbers (2 bits).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub iodi: Option<u8>,
    /// MT48: labels of the satellites set in the PRN mask, in mask-number order.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub mask: Option<Vec<String>>,
    /// MT49: (satellite, IOD) for the selected satellites.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub iod: Option<Vec<(String, u8)>>,
    /// MT50: monitoring station code (6 bits) of the corrections.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub gms_code: Option<u8>,
    /// MT50: `true` when the station health flag bit is clear (the decoder stores the inverted bit).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub gms_healthy: Option<bool>,
    /// MT50: pseudorange corrections of the selected satellites, mapped through the MT48 with the same IODP.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub prc: Option<Vec<Prc>>,
    /// MT51: satellites marked unhealthy.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub unhealthy: Option<Vec<String>>,
    /// MT43: the JMA DC Report header and its category body.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dc_report: Option<DcReport>,
    /// MT44: the DCX message.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub dcx: Option<serde_json::Value>,
    /// Why a part was not decoded (no mask with this IODP, an unknown disaster category).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub note: Option<String>,
}

/// The common header of a JMA DC Report (MT43).
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct DcReport {
    /// 1 maximum priority, 2 priority, 3 regular, 7 training/test.
    pub classification: u8,
    /// Name of the report classification code; `None` for a code not listed above.
    pub classification_name: Option<&'static str>,
    /// Disaster category code (4 bits).
    pub disaster_category: u8,
    /// Name of the disaster category from [`DISASTER_CATEGORIES`]; `None` for an unused or unknown code.
    pub disaster_category_name: Option<&'static str>,
    /// Report time (UTC): month, day, hour, minute.
    pub report_time: [u8; 4],
    /// 0 issue, 2 cancellation.
    pub information_type: u8,
    /// Version number read from block bits 215 to 220 (6 bits).
    pub version: u8,
    /// Category-specific bits 44 to 214, hexadecimal.
    pub body_hex: String,
    /// The decoded category body; `None` for an unused or unknown category.
    pub body: Option<serde_json::Value>,
}

/// The decoder's report.
#[derive(Clone, Debug, Serialize, PartialEq, Default)]
pub struct Report {
    /// Frames given to the decoder.
    pub frames: usize,
    /// Frames whose CRC-24Q did not match (their bodies are not decoded).
    pub bad_crc: usize,
    /// Frames shorter than [`BLOCK_BITS`], skipped.
    pub short: usize,
    /// One entry per frame of full length, in input order.
    pub messages: Vec<Message>,
}

/// Bits (`0`/`1`) as hexadecimal, the last digit padded with zeros.
pub(crate) fn hex_of(bits: &[u8]) -> String {
    let mut s = String::new();
    for ch in bits.chunks(4) {
        let mut v = 0u8;
        for (i, b) in ch.iter().enumerate() {
            v |= (b & 1) << (3 - i);
        }
        s.push(char::from_digit(u32::from(v), 16).unwrap_or('0'));
    }
    s
}

fn mask_list(bits: &[u8]) -> Vec<u32> {
    // bits[0] is mask number 17.
    bits.iter()
        .enumerate()
        .filter(|(_, b)| **b == 1)
        .map(|(i, _)| i as u32 + 17)
        .collect()
}

/// Decode a sequence of L1S frames, keeping the PRN masks by IODP between messages.
pub fn decode_frames(frames: &[Frame]) -> Report {
    let mut rep = Report {
        frames: frames.len(),
        ..Default::default()
    };
    let mut masks: HashMap<u8, Vec<u32>> = HashMap::new();
    for (index, f) in frames.iter().enumerate() {
        let bits = f.bits();
        if bits.len() < BLOCK_BITS {
            rep.short += 1;
            continue;
        }
        let block = &bits[..BLOCK_BITS];
        let crc_ok = crate::gnss_navmsg::fec::crc24q(&block[..226]) == {
            let mut c = 0u32;
            for b in &block[226..250] {
                c = (c << 1) | u32::from(*b);
            }
            c
        };
        if !crc_ok {
            rep.bad_crc += 1;
        }
        let mut c = Cursor::new(block);
        let pab = c.u(8).unwrap_or(0) as u8;
        let mt = c.u(6).unwrap_or(0) as u8;
        let mut m = Message {
            index,
            preamble: PREAMBLES.iter().find(|p| p.1 == pab).map(|p| p.0),
            mt,
            crc_ok,
            ..Default::default()
        };
        if crc_ok {
            decode_body(mt, &block[14..226], &mut m, &mut masks);
        }
        rep.messages.push(m);
    }
    rep
}

fn decode_body(mt: u8, data: &[u8], m: &mut Message, masks: &mut HashMap<u8, Vec<u32>>) {
    let mut c = Cursor::new(data);
    match mt {
        0 => m.test_mode = Some(true),
        43 => {
            let rc = c.u(3).unwrap_or(0) as u8;
            let dc = c.u(4).unwrap_or(0) as u8;
            let t = [
                c.u(4).unwrap_or(0) as u8,
                c.u(5).unwrap_or(0) as u8,
                c.u(5).unwrap_or(0) as u8,
                c.u(6).unwrap_or(0) as u8,
            ];
            let it = c.u(2).unwrap_or(0) as u8;
            // Body: block bits 44..=214 are data indices 29..200; version: bits 215..=220.
            let body = &data[29..200];
            let mut v = Cursor::new(&data[200..206]);
            let decoded = super::dcr::decode_body(dc, body);
            if decoded.is_none() {
                m.note = Some(format!("disaster category {dc} is unused or unknown"));
            }
            m.dc_report = Some(DcReport {
                classification: rc,
                classification_name: match rc {
                    1 => Some("maximum_priority"),
                    2 => Some("priority"),
                    3 => Some("regular"),
                    7 => Some("training_test"),
                    _ => None,
                },
                disaster_category: dc,
                disaster_category_name: DISASTER_CATEGORIES.iter().find(|d| d.0 == dc).map(|d| d.1),
                report_time: t,
                information_type: it,
                version: v.u(6).unwrap_or(0) as u8,
                body_hex: hex_of(body),
                body: decoded,
            });
        }
        44 => m.dcx = super::dcx::decode(data),
        47 => {
            let mut st = Vec::new();
            for _ in 0..5 {
                let code = c.u(6).unwrap_or(63) as u8;
                let lat = c.i(15).unwrap_or(0) as f64 * 0.005;
                let lon = c.i(15).unwrap_or(0) as f64 * 0.005 + 115.0;
                let h = c.u(6).unwrap_or(0) as f64 * 50.0 - 100.0;
                if code == 63 {
                    continue;
                }
                st.push(Station {
                    code,
                    name: STATIONS.iter().find(|s| s.0 == code).map(|s| s.1),
                    lat_deg: Some(round(lat, 3)),
                    lon_deg: Some(round(lon, 3)),
                    height_m: Some(h),
                });
            }
            m.stations = Some(st);
        }
        48 => {
            let iodp = c.u(2).unwrap_or(0) as u8;
            let list = mask_list(&data[2..183]);
            m.iodp = Some(iodp);
            m.mask = Some(list.iter().filter_map(|n| mask_label(*n)).collect());
            masks.insert(iodp, list);
        }
        49 => {
            let iodi = c.u(2).unwrap_or(0) as u8;
            let sel = c.take(23).unwrap_or_default();
            let iods: Vec<u8> = (0..23).map(|_| c.u(8).unwrap_or(0) as u8).collect();
            let iodp = c.u(2).unwrap_or(0) as u8;
            m.iodi = Some(iodi);
            m.iodp = Some(iodp);
            match masks.get(&iodp) {
                Some(list) => {
                    let mut out = Vec::new();
                    for (k, n) in list.iter().take(23).enumerate() {
                        if sel.get(k) == Some(&1) {
                            if let Some(l) = mask_label(*n) {
                                out.push((l, iods[k]));
                            }
                        }
                    }
                    m.iod = Some(out);
                }
                None => m.note = Some(format!("no MT48 with IODP {iodp} received before")),
            }
        }
        50 => {
            let iodp = c.u(2).unwrap_or(0) as u8;
            let iodi = c.u(2).unwrap_or(0) as u8;
            let gms = c.u(6).unwrap_or(63) as u8;
            let gms_unhealthy = c.flag().unwrap_or(true);
            let sel = c.take(23).unwrap_or_default();
            let prcs: Vec<i64> = (0..14).map(|_| c.i(12).unwrap_or(-2048)).collect();
            m.iodp = Some(iodp);
            m.iodi = Some(iodi);
            m.gms_code = Some(gms);
            m.gms_healthy = Some(!gms_unhealthy);
            match masks.get(&iodp) {
                Some(list) => {
                    let mut out = Vec::new();
                    let mut k_prc = 0;
                    for (k, n) in list.iter().take(23).enumerate() {
                        if sel.get(k) != Some(&1) {
                            continue;
                        }
                        let Some(raw) = prcs.get(k_prc).copied() else {
                            break;
                        };
                        k_prc += 1;
                        if let Some(l) = mask_label(*n) {
                            out.push(Prc {
                                sat: l,
                                prc_m: (raw != -2048).then(|| round(raw as f64 * 0.04, 2)),
                                unhealthy_30s: raw == -2048,
                            });
                        }
                    }
                    m.prc = Some(out);
                }
                None => m.note = Some(format!("no MT48 with IODP {iodp} received before")),
            }
        }
        51 => {
            let list = mask_list(&data[2..183]);
            m.unhealthy = Some(list.iter().filter_map(|n| mask_label(*n)).collect());
        }
        _ => {}
    }
}

fn round(v: f64, d: i32) -> f64 {
    let s = 10f64.powi(d);
    (v * s).round() / s
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn mask_numbers_map_to_satellites() {
        assert_eq!(mask_label(17).as_deref(), Some("G01"));
        assert_eq!(mask_label(80).as_deref(), Some("G64"));
        assert_eq!(mask_label(81).as_deref(), Some("J01"));
        assert_eq!(mask_label(89).as_deref(), Some("J09"));
        assert_eq!(mask_label(90).as_deref(), Some("R01"));
        assert_eq!(mask_label(161).as_deref(), Some("E36"));
        assert_eq!(mask_label(197).as_deref(), Some("C36"));
        assert!(mask_label(16).is_none() && mask_label(198).is_none());
    }
}
