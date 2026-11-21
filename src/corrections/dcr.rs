// SPDX-License-Identifier: AGPL-3.0-only
//! The category bodies of the JMA DC Report (QZSS L1S message type 43).
//!
//! Source, read for this decoder: IS-QZSS-DCR-017, section 4.1.2.3 (Figures 4.1.2-1 to
//! 4.1.2-12 and the parameter-definition tables 4.1.2-5, -12, -14, -18, -21, -26, -30, -35,
//! -38, -43, -47 and -51). Every category body fills bits 44 to 214 of the 250-bit block
//! (171 bits) after the common header that [`super::l1s`] reads.
//!
//! Only the field layouts are transcribed. Codes that the document resolves through its
//! own lookup tables (notifications, epicentre, region, prefecture, volcano, warning codes
//! and the like, in Japanese) are reported as numbers: look them up in the cited table of
//! IS-QZSS-DCR-017. Region lists stop at the first all-zero group, as the document marks
//! unused trailing regions with zeros.

use super::bits::Cursor;
use serde_json::{json, Map, Value};

/// Bits of a category body (block bits 44 to 214).
pub const BODY_BITS: usize = 171;

/// One field of a body layout.
#[derive(Clone, Copy, Debug)]
enum F {
    /// Unsigned integer.
    U(&'static str, usize),
    /// Spare bits (expected zero).
    Spare(usize),
    /// Day (5), hour (5), minute (6), UTC.
    Dhm(&'static str),
    /// Hemisphere flag and degrees, minutes, seconds of latitude (1, 7, 6, 6) and longitude
    /// (1, 8, 6, 6): 41 bits.
    LatLon(&'static str),
    /// `count` codes of `bits` each; zero codes are dropped.
    Codes(&'static str, usize, usize),
    /// A flag list; the 1-based positions of the set flags.
    Flags(&'static str, usize),
    /// Depth of hypocentre, 9 bits: km, 501 more than 500 km, 511 unknown.
    Depth,
    /// Magnitude, 7 bits of 0.1: 101 above 10.0, 126 above 8.0 (moment magnitude unknown),
    /// 127 unknown.
    Mag,
    /// Expected tsunami arrival: next-day flag (1), hour (5), minute (6). `true` for the
    /// north-west Pacific reading of hour 31 / minute 63 (arrived or unknown).
    Arrival(bool),
    /// UTF-8 text of `n` bytes.
    Text(&'static str, usize),
    /// `count` groups of fields; trailing all-zero groups are dropped.
    Rep(&'static str, usize, &'static [F]),
}

use F::*;

const EEW: &[F] = &[
    Spare(4),
    U("long_period_lower", 3),
    U("long_period_upper", 3),
    Codes("notifications", 3, 9),
    Dhm("occurrence_time"),
    Depth,
    Mag,
    U("epicenter", 10),
    U("intensity_lower", 4),
    U("intensity_upper", 4),
    Flags("forecast_regions", 80),
    Spare(4),
];

const HYPOCENTER: &[F] = &[
    Spare(10),
    Codes("notifications", 3, 9),
    Dhm("occurrence_time"),
    Depth,
    Mag,
    U("epicenter", 10),
    LatLon("position"),
    Spare(51),
];

const SEISMIC: &[F] = &[
    Spare(10),
    Dhm("occurrence_time"),
    Rep("regions", 16, &[U("intensity", 3), U("prefecture", 6)]),
    Spare(1),
];

const NANKAI: &[F] = &[
    Spare(10),
    U("information_serial", 4),
    Text("text", 18),
    U("page", 6),
    U("pages", 6),
    Spare(1),
];

const TSUNAMI: &[F] = &[
    Spare(10),
    Codes("notifications", 3, 9),
    U("warning", 4),
    Rep(
        "regions",
        5,
        &[Arrival(false), U("height", 4), U("region", 10)],
    ),
];

const NW_PACIFIC: &[F] = &[
    Spare(10),
    U("tsunamigenic_potential", 3),
    Rep(
        "regions",
        5,
        &[Arrival(true), U("height", 9), U("coastal_region", 7)],
    ),
    Spare(18),
];

const VOLCANO: &[F] = &[
    Spare(7),
    U("time_ambiguity", 3),
    Dhm("activity_time"),
    U("warning", 7),
    U("volcano", 12),
    Codes("local_governments", 5, 23),
    Spare(11),
];

const ASH_FALL: &[F] = &[
    Spare(10),
    Dhm("activity_time"),
    U("warning_type", 2),
    U("volcano", 12),
    Rep(
        "regions",
        4,
        &[
            U("expected_hours", 3),
            U("warning", 3),
            U("local_government", 23),
        ],
    ),
    Spare(15),
];

const WEATHER: &[F] = &[
    Spare(10),
    U("warning_state", 3),
    Rep("regions", 6, &[U("sub_category", 5), U("region", 19)]),
    Spare(14),
];

const FLOOD: &[F] = &[
    Spare(10),
    Rep("regions", 3, &[U("level", 4), U("region", 40)]),
    Spare(29),
];

const TYPHOON: &[F] = &[
    Spare(10),
    Dhm("reference_time"),
    U("reference_type", 3),
    Spare(8),
    U("elapsed_hours", 7),
    U("typhoon_number", 7),
    U("scale", 4),
    U("intensity", 4),
    LatLon("position"),
    U("pressure_hpa", 11),
    U("max_wind_ms", 7),
    U("max_gust_ms", 7),
    Spare(46),
];

const MARINE: &[F] = &[
    Spare(10),
    Rep("regions", 8, &[U("warning", 5), U("region", 14)]),
    Spare(9),
];

/// The body layout of a disaster category and the IS-QZSS-DCR-017 table defining it.
fn layout(category: u8) -> Option<(&'static [F], &'static str)> {
    Some(match category {
        1 => (EEW, "Table 4.1.2-5"),
        2 => (HYPOCENTER, "Table 4.1.2-12"),
        3 => (SEISMIC, "Table 4.1.2-14"),
        4 => (NANKAI, "Table 4.1.2-18"),
        5 => (TSUNAMI, "Table 4.1.2-21"),
        6 => (NW_PACIFIC, "Table 4.1.2-26"),
        8 => (VOLCANO, "Table 4.1.2-30"),
        9 => (ASH_FALL, "Table 4.1.2-35"),
        10 => (WEATHER, "Table 4.1.2-38"),
        11 => (FLOOD, "Table 4.1.2-43"),
        12 => (TYPHOON, "Table 4.1.2-47"),
        14 => (MARINE, "Table 4.1.2-51"),
        _ => return None,
    })
}

fn width(f: &F) -> usize {
    match *f {
        U(_, n) | Spare(n) | Flags(_, n) => n,
        Dhm(_) => 16,
        LatLon(_) => 41,
        Codes(_, c, n) => c * n,
        Depth => 9,
        Mag => 7,
        Arrival(_) => 12,
        Text(_, n) => 8 * n,
        Rep(_, c, fs) => c * fs.iter().map(width).sum::<usize>(),
    }
}

fn round(v: f64, d: i32) -> f64 {
    let s = 10f64.powi(d);
    (v * s).round() / s
}

/// Read `fields` into `out`; `false` when a spare field is not zero.
fn read(c: &mut Cursor, fields: &[F], out: &mut Map<String, Value>) -> Option<bool> {
    let mut spare_zero = true;
    for f in fields {
        match *f {
            U(name, n) => {
                out.insert(name.into(), json!(c.u(n)?));
            }
            Spare(n) => spare_zero &= c.u(n)? == 0,
            Dhm(name) => {
                let (d, h, m) = (c.u(5)?, c.u(5)?, c.u(6)?);
                out.insert(name.into(), json!({"day": d, "hour": h, "minute": m}));
            }
            LatLon(name) => {
                let south = c.flag()?;
                let lat = c.u(7)? as f64 + c.u(6)? as f64 / 60.0 + c.u(6)? as f64 / 3600.0;
                let west = c.flag()?;
                let lon = c.u(8)? as f64 + c.u(6)? as f64 / 60.0 + c.u(6)? as f64 / 3600.0;
                out.insert(
                    name.into(),
                    json!({
                        "lat_deg": round(if south { -lat } else { lat }, 6),
                        "lon_deg": round(if west { -lon } else { lon }, 6),
                    }),
                );
            }
            Codes(name, count, n) => {
                let mut v = Vec::new();
                for _ in 0..count {
                    let x = c.u(n)?;
                    if x != 0 {
                        v.push(x);
                    }
                }
                out.insert(name.into(), json!(v));
            }
            Flags(name, n) => {
                let bits = c.take(n)?;
                let set: Vec<usize> = (0..n).filter(|i| bits[*i] == 1).map(|i| i + 1).collect();
                out.insert(name.into(), json!(set));
            }
            Depth => {
                let d = c.u(9)?;
                out.insert("depth_code".into(), json!(d));
                out.insert("depth_km".into(), json!((d <= 500).then_some(d)));
            }
            Mag => {
                let m = c.u(7)?;
                out.insert("magnitude_code".into(), json!(m));
                let v = (1..=100).contains(&m).then(|| round(m as f64 * 0.1, 1));
                out.insert("magnitude".into(), json!(v));
            }
            Arrival(nwp) => {
                let next_day = c.flag()?;
                let (h, m) = (c.u(5)?, c.u(6)?);
                let status = match (h, m) {
                    (31, 63) if nwp => "arrived_or_unknown",
                    (31, 63) => "arrived",
                    (30, 62) if !nwp => "no_data",
                    _ => "expected",
                };
                out.insert(
                    "arrival".into(),
                    json!({"next_day": next_day, "hour": h, "minute": m, "status": status}),
                );
            }
            Text(name, n) => {
                let bytes: Vec<u8> = (0..n)
                    .map(|_| c.u(8).map(|b| b as u8))
                    .collect::<Option<_>>()?;
                out.insert(name.into(), json!(hex::encode(&bytes)));
                let trimmed: &[u8] = {
                    let end = bytes.iter().rposition(|b| *b != 0).map_or(0, |i| i + 1);
                    &bytes[..end]
                };
                // A page may end inside a multi-byte character; keep text only when whole.
                if let Ok(s) = std::str::from_utf8(trimmed) {
                    out.insert(format!("{name}_utf8"), json!(s));
                }
            }
            Rep(name, count, fs) => {
                let group_bits: usize = fs.iter().map(width).sum();
                let mut groups = Vec::new();
                for _ in 0..count {
                    let zero = c.clone().take(group_bits)?.iter().all(|b| *b == 0);
                    let mut g = Map::new();
                    spare_zero &= read(c, fs, &mut g)?;
                    // The document fills unused regions with zeros; they are not reported.
                    if !zero {
                        groups.push(Value::Object(g));
                    }
                }
                out.insert(name.into(), Value::Array(groups));
            }
        }
    }
    Some(spare_zero)
}

/// Decode the 171-bit body of disaster `category`; `None` for an unused or unknown category
/// (the caller keeps the hexadecimal). The object names the defining table and flags spare
/// bits that are not zero.
pub fn decode_body(category: u8, body: &[u8]) -> Option<Value> {
    let (fields, table) = layout(category)?;
    if body.len() < BODY_BITS {
        return None;
    }
    let mut c = Cursor::new(&body[..BODY_BITS]);
    let mut out = Map::new();
    let spare_zero = read(&mut c, fields, &mut out)?;
    out.insert("table".into(), json!(format!("IS-QZSS-DCR-017 {table}")));
    if !spare_zero {
        out.insert("spare_nonzero".into(), json!(true));
    }
    Some(Value::Object(out))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_layout_fills_the_body_exactly() {
        for cat in 0..16u8 {
            if let Some((fs, _)) = layout(cat) {
                assert_eq!(
                    fs.iter().map(width).sum::<usize>(),
                    BODY_BITS,
                    "category {cat}"
                );
            }
        }
        assert!(layout(7).is_none() && layout(13).is_none());
    }

    #[test]
    fn all_zero_body_reads_without_regions() {
        let v = decode_body(14, &[0u8; BODY_BITS]).unwrap();
        assert_eq!(v["regions"], json!([]));
        assert!(v.get("spare_nonzero").is_none());
        assert!(decode_body(1, &[0u8; 100]).is_none());
    }
}
