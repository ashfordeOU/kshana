// SPDX-License-Identifier: AGPL-3.0-only
//! DCX messages (QZSS L1S message type 44).
//!
//! Source, read for this decoder: IS-QZSS-DCX-004, sections 4.2 to 4.3 and 5.6 to 5.7. The
//! 212-bit data field (Figure 4.2-1) holds the Satellite Designation (SD, 10 bits, Table
//! 4.2-2), the Common Alert Message Format (CAMF, 122 bits, Table 4.2-3: A1 to A18), the
//! 74-bit Extended Message (Tables 4.2-20, 4.2-23 and 4.2-26) and 6 reserved bits.
//!
//! The message kind follows section 5.7: A2 other than Japan is information from an
//! organisation outside Japan; with A2 Japan, A3 1 is L-Alert, 2 or 3 J-Alert, 4 local
//! government, and anything else is discarded. An MT44 whose CAMF and extended message are
//! all zero is the NULL message of section 4.3, which only carries the SD field.
//!
//! Decoded: every CAMF field with the names of the document's own small tables (message type,
//! severity, onset week and time of week, duration, library type and version), the Japanese
//! instruction library (Table 4.2-14), the ellipse (A12 to A16: section 4.2.3.12 to 4.2.3.16
//! formulas and the radius formula of Table 4.2-17), the extended message of each kind and
//! the SD satellites (PRN per Table 5.6-3). Left as numbers: the country (Table 4.2-5), the
//! provider (Table 4.2-6), the hazard (Table 4.2-7), the target area codes (applicable
//! document (3) of DCX-004), the instruction lists of the international library (Table
//! 4.2-16) and the Specific Settings field A18 (defined in the CAMF document, not read here).

use super::bits::Cursor;
use serde_json::{json, Value};

/// CAMF country code of Japan (Table 4.2-5).
pub const JAPAN: u64 = 0b0_0110_1111;

/// Prefectures in the order of the J-Alert prefecture code (Table 4.2-25): the flag at bit
/// position 47 (the least significant of the 47) is the first, Hokkaido.
pub const PREFECTURES: [&str; 47] = [
    "Hokkaido",
    "Aomori",
    "Iwate",
    "Miyagi",
    "Akita",
    "Yamagata",
    "Fukushima",
    "Ibaraki",
    "Tochigi",
    "Gunma",
    "Saitama",
    "Chiba",
    "Tokyo",
    "Kanagawa",
    "Niigata",
    "Toyama",
    "Ishikawa",
    "Fukui",
    "Yamanashi",
    "Nagano",
    "Gifu",
    "Shizuoka",
    "Aichi",
    "Mie",
    "Shiga",
    "Kyoto",
    "Osaka",
    "Hyogo",
    "Nara",
    "Wakayama",
    "Tottori",
    "Shimane",
    "Okayama",
    "Hiroshima",
    "Yamaguchi",
    "Tokushima",
    "Kagawa",
    "Ehime",
    "Kochi",
    "Fukuoka",
    "Saga",
    "Nagasaki",
    "Kumamoto",
    "Oita",
    "Miyazaki",
    "Kagoshima",
    "Okinawa",
];

/// SDM bit (1-based) to the L1S PRN it designates (Table 5.6-3); bits 5, 6, 8 and 9 are not
/// assigned.
pub fn sd_prn(bit: usize) -> Option<u16> {
    match bit {
        1..=4 | 7 => Some(182 + bit as u16),
        _ => None,
    }
}

/// Ellipse axis lengths (km) of Table 4.2-17, by 5-bit code.
///
/// The document states a formula for them (logarithmic between 0.216 and 2500 km over 31
/// steps), but its table rows lie up to 0.1 % above that formula (code 3: formula 0.534,
/// table 0.535); the table steps by a ratio of 1.35228, which fits a minimum near 0.21636 km.
/// The decoder uses the table; which of the two is meant is to confirm.
pub const RADII_KM: [f64; 32] = [
    0.216, 0.292, 0.395, 0.535, 0.723, 0.978, 1.322, 1.788, 2.418, 3.269, 4.421, 5.979, 8.085,
    10.933, 14.784, 19.992, 27.035, 36.559, 49.439, 66.855, 90.407, 122.255, 165.324, 223.564,
    302.322, 408.824, 552.846, 747.603, 1010.970, 1367.116, 1848.727, 2500.000,
];

/// Ellipse axis length (km) of a 5-bit code (Tables 4.2-17 and 4.2-18).
pub fn radius_km(a: u64) -> f64 {
    RADII_KM[(a & 31) as usize]
}

fn round(v: f64, d: i32) -> f64 {
    let s = 10f64.powi(d);
    (v * s).round() / s
}

fn name<'a>(names: &[&'a str], i: u64) -> &'a str {
    names.get(i as usize).copied().unwrap_or("reserved")
}

/// Onset time of week (A7): `None` for 0 (not used) and reserved codes above 10080.
fn onset(code: u64) -> Value {
    if !(1..=10080).contains(&code) {
        return Value::Null;
    }
    const DAYS: [&str; 7] = [
        "monday",
        "tuesday",
        "wednesday",
        "thursday",
        "friday",
        "saturday",
        "sunday",
    ];
    let m = code - 1;
    json!({"weekday": DAYS[(m / 1440) as usize], "hour": m % 1440 / 60, "minute": m % 60})
}

/// The Japanese instruction library (Table 4.2-14): basic instruction and its information.
/// When the basic instruction is `00` the 10-bit value is a pattern of Table 4.2-15 (not
/// transcribed), so only the code is given.
fn instruction_japan(code: u64) -> Value {
    const BASIC: [&str; 4] = ["", "stay", "move_to", "keep_away_from"];
    const INFO: [&str; 8] = [
        "",
        "under_or_inside_solid_structure",
        "third_floor_or_higher",
        "underground",
        "mountain",
        "water_area",
        "building_handling_chemicals",
        "cliffs_and_collapse_risk_areas",
    ];
    let (b, i) = (code >> 8, code & 0xFF);
    if b == 0 {
        return json!({"code": code});
    }
    json!({"code": code, "basic": BASIC[b as usize], "information": name(&INFO, i)})
}

/// Decode the 212-bit MT44 data field (block bits 15 to 226).
pub fn decode(data: &[u8]) -> Option<Value> {
    let mut c = Cursor::new(data);
    let sdmt = c.flag()?;
    let sdm = c.take(9)?;
    let sats: Vec<Value> = (1..=9)
        .filter_map(|b| sd_prn(b).map(|prn| json!({"prn": prn, "flag": sdm[b - 1]})))
        .collect();
    let sd = json!({
        "kind": if sdmt { "transmission_status" } else { "service_type" },
        "flags": sdm,
        "satellites": sats,
    });
    let camf_start = c.pos;
    let a1 = c.u(2)?;
    let a2 = c.u(9)?;
    let a3 = c.u(5)?;
    let a4 = c.u(7)?;
    let a5 = c.u(2)?;
    let a6 = c.u(1)?;
    let a7 = c.u(14)?;
    let a8 = c.u(2)?;
    let a9 = c.u(1)?;
    let a10 = c.u(3)?;
    let a11 = c.u(10)?;
    let (a12, a13, a14, a15, a16) = (c.u(16)?, c.u(17)?, c.u(5)?, c.u(5)?, c.u(6)?);
    let a17 = c.u(2)?;
    let a18 = c.u(15)?;
    let ex_start = c.pos;
    // NULL message (Table 4.3-1): A2 Japan (or zero) and every other CAMF and extended bit zero.
    let null = a1 == 0
        && (a2 == JAPAN || a2 == 0)
        && data[camf_start + 11..ex_start + 74].iter().all(|b| *b == 0);
    let kind = if null {
        "null"
    } else if a2 != JAPAN {
        "outside_japan"
    } else {
        match a3 {
            1 => "l_alert",
            2 | 3 => "j_alert",
            4 => "local_government",
            _ => "discarded",
        }
    };
    let ellipse = if (a12 | a13 | a14 | a15 | a16) == 0 {
        Value::Null
    } else {
        json!({
            "lat_deg": round(-90.0 + 180.0 / 65535.0 * a12 as f64, 6),
            "lon_deg": round(-180.0 + 360.0 / 131071.0 * a13 as f64, 6),
            "semi_major_km": radius_km(a14),
            "semi_minor_km": radius_km(a15),
            "azimuth_deg": round(-90.0 + 180.0 / 64.0 * a16 as f64, 2),
        })
    };
    let japan = matches!(kind, "l_alert" | "j_alert" | "local_government");
    let instruction = if japan {
        instruction_japan(a11)
    } else if a9 == 0 {
        json!({"code": a11, "list_a": a11 >> 5, "list_b": a11 & 31})
    } else {
        json!({"code": a11})
    };
    let camf = json!({
        "message_type": name(&["test", "alert", "update", "all_clear"], a1),
        "country": a2,
        "provider": a3,
        "hazard": a4,
        "severity": name(&["unknown", "moderate", "severe", "extreme"], a5),
        "onset_week": if a6 == 0 { "current" } else { "next" },
        "onset_time_code": a7,
        "onset_time": onset(a7),
        "duration": name(&["unknown", "under_6h", "6h_to_12h", "12h_to_24h"], a8),
        "library": if a9 == 0 { "international" } else { "country_region" },
        "library_version": a10 + 1,
        "instruction": instruction,
        "ellipse": ellipse,
        "specific_settings_type": name(&["b1_main_ellipse_resolution", "b2_hazard_centre",
                                          "b3_secondary_ellipse", "b4_hazard_details"], a17),
        "specific_settings": a18,
    });
    let extended = match kind {
        "l_alert" | "local_government" => {
            let area = c.u(16)?;
            let direction = c.u(1)?;
            let (lat, lon, maj, min, az) = (c.u(17)?, c.u(17)?, c.u(5)?, c.u(5)?, c.u(7)?);
            let vn = c.u(6)?;
            let mut e = json!({"target_area": area, "version": vn});
            // EX2 to EX7 are used by information from local government only (4.2.4.1.2).
            if kind == "local_government" {
                e["evacuate_direction"] = json!(if direction == 0 {
                    "leave_area"
                } else {
                    "head_to_area"
                });
                e["additional_ellipse"] = json!({
                    "lat_deg": round(-90.0 + 180.0 / 131071.0 * lat as f64, 6),
                    "lon_deg": round(45.0 + 180.0 / 131071.0 * lon as f64, 6),
                    "semi_major_km": radius_km(maj),
                    "semi_minor_km": radius_km(min),
                    "azimuth_deg": round(-90.0 + 180.0 / 128.0 * az as f64, 2),
                });
            }
            e
        }
        "j_alert" => {
            let municipal = c.flag()?;
            let list = c.take(64)?;
            let _reserved = c.u(3)?;
            let vn = c.u(6)?;
            if municipal {
                let codes: Vec<u64> = list
                    .chunks(16)
                    .map(|ch| ch.iter().fold(0u64, |v, b| (v << 1) | u64::from(*b)))
                    .filter(|v| *v != 0)
                    .collect();
                json!({"list_type": "municipality", "target_areas": codes, "version": vn})
            } else {
                // Bit position p (1-based, most significant first) of the 47 flags is
                // prefecture 48 - p.
                let prefs: Vec<&str> = (1..=47usize)
                    .rev()
                    .filter(|p| list[p - 1] == 1)
                    .map(|p| PREFECTURES[47 - p])
                    .collect();
                json!({"list_type": "prefecture", "prefectures": prefs, "version": vn})
            }
        }
        "outside_japan" => {
            let area = c.take(68)?;
            let vn = c.u(6)?;
            json!({"organization_specific_hex": super::l1s::hex_of(&area), "version": vn})
        }
        _ => Value::Null,
    };
    Some(json!({"kind": kind, "sd": sd, "camf": camf, "extended": extended}))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn document_calculation_examples() {
        // IS-QZSS-DCX-004 4.2.3.12 to 4.2.3.16 and 4.2.4.1.3 to 4.2.4.1.7 worked examples.
        assert_eq!(round(-90.0 + 180.0 / 65535.0 * 45761.0, 6), 35.688258);
        assert_eq!(round(-180.0 + 360.0 / 131071.0 * 116395.0, 6), 139.690855);
        assert_eq!(round(-90.0 + 180.0 / 131071.0 * 91522.0, 6), 35.687299);
        assert_eq!(round(45.0 + 180.0 / 131071.0 * 68950.0, 6), 139.689138);
        assert_eq!(round(-90.0 + 180.0 / 64.0 * 48.0, 2), 45.0);
        assert_eq!(round(-90.0 + 180.0 / 128.0 * 96.0, 2), 45.0);
        // Table 4.2-17 end points and the rows the document's examples use (13 and 11).
        assert_eq!(radius_km(0), 0.216);
        assert_eq!(radius_km(13), 10.933);
        assert_eq!(radius_km(11), 5.979);
        assert_eq!(radius_km(31), 2500.0);
        // The stated formula agrees with the table at both ends only.
        let f =
            |a: f64| 10f64.powf(0.216f64.log10() + a * (2500f64.log10() - 0.216f64.log10()) / 31.0);
        assert!((f(31.0) - 2500.0).abs() < 1e-9 && (f(3.0) - 0.535).abs() > 5e-4);
        // Table 4.2-10 end points.
        assert_eq!(
            onset(1),
            json!({"weekday": "monday", "hour": 0, "minute": 0})
        );
        assert_eq!(
            onset(10080),
            json!({"weekday": "sunday", "hour": 23, "minute": 59})
        );
        assert_eq!(onset(10081), Value::Null);
        assert_eq!(sd_prn(1), Some(183));
        assert_eq!(sd_prn(7), Some(189));
        assert_eq!(sd_prn(5), None);
    }
}
