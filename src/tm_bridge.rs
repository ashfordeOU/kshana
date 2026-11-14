// SPDX-License-Identifier: AGPL-3.0-only
//! The trust stream as spacecraft-style telemetry for mission control systems (roadmap 0.42 I8;
//! docs/SPACE-OPS-BRIDGES.md): one CCSDS Space Packet (133.0-B-2, through
//! [`crate::space_packet`]) per epoch, and the packet's definition in the forms the ground
//! systems read: XTCE 1.2 (OMG; also Yamcs's mission database format), an OpenC3 COSMOS
//! `cmd_tlm` telemetry definition, and an Open MCT telemetry dictionary with realtime datums.
//!
//! The packet has no secondary header. User data, big-endian, in this order: `T_S` (IEEE 754
//! double, seconds since the first epoch), `SCORE` (single; NaN when absent), `BAND` (unsigned 8:
//! 0 calibrating, 1 nominal, 2 degraded, 3 untrusted, 4 unknown), `N_REASONS` (unsigned 8), then
//! `LAT_DEG`, `LON_DEG`, `HEIGHT_M` (doubles; NaN when the stream carries no position).

use crate::space_packet::{decode_packet, encode_packet, SequenceFlags};
use crate::telemetry::sample::TrustSample;
use std::fmt::Write;

/// (name, bits, kind: f float, u unsigned, unit, description).
pub const PARAMS: [(&str, u32, char, &str, &str); 7] = [
    ("T_S", 64, 'f', "s", "seconds since the first epoch"),
    ("SCORE", 32, 'f', "", "trust score 0 to 100"),
    ("BAND", 8, 'u', "", "trust band"),
    ("N_REASONS", 8, 'u', "", "reasons named"),
    ("LAT_DEG", 64, 'f', "deg", "latitude"),
    ("LON_DEG", 64, 'f', "deg", "longitude"),
    ("HEIGHT_M", 64, 'f', "m", "height above the ellipsoid"),
];

/// The band names in their enumeration order.
pub const BANDS: [&str; 5] = ["calibrating", "nominal", "degraded", "untrusted", "unknown"];

/// The user data of one sample's packet.
pub fn user_data(s: &TrustSample) -> Vec<u8> {
    let p = s.position.as_ref();
    let mut d = s.t_s.to_be_bytes().to_vec();
    d.extend((s.score.unwrap_or(f64::NAN) as f32).to_be_bytes());
    d.push(s.band.index() as u8);
    d.push(s.reasons.len().min(255) as u8);
    for v in [
        p.map(|p| p.lat_deg),
        p.map(|p| p.lon_deg),
        p.map(|p| p.height_m),
    ] {
        d.extend(v.unwrap_or(f64::NAN).to_be_bytes());
    }
    d
}

/// One telemetry packet (unsegmented, no secondary header).
pub fn packet(s: &TrustSample, apid: u16, count: u16) -> Result<Vec<u8>, String> {
    encode_packet(
        0,
        false,
        false,
        apid,
        SequenceFlags::Unsegmented,
        count & 0x3FFF,
        &user_data(s),
    )
}

/// Decode a packet written by [`packet`]: the APID and the parameter values in [`PARAMS`] order.
pub fn decode(bytes: &[u8]) -> Result<(u16, Vec<f64>), String> {
    let (h, d) = decode_packet(bytes)?;
    let mut out = Vec::new();
    let mut i = 0;
    for (_, bits, kind, _, _) in PARAMS {
        let n = bits as usize / 8;
        let b = d
            .get(i..i + n)
            .ok_or_else(|| crate::terr!("e-connect-ops-failed", proto = "ccsds", why = "short"))?;
        i += n;
        out.push(match (kind, n) {
            ('f', 8) => f64::from_be_bytes(b.try_into().unwrap_or_default()),
            ('f', _) => f64::from(f32::from_be_bytes(b.try_into().unwrap_or_default())),
            _ => f64::from(b[0]),
        });
    }
    Ok((h.apid, out))
}

/// The CCSDS primary header fields (name, bits).
const HEADER: [(&str, u32); 7] = [
    ("CCSDS_VERSION", 3),
    ("CCSDS_TYPE", 1),
    ("CCSDS_SEC_HDR", 1),
    ("CCSDS_APID", 11),
    ("CCSDS_SEQ_FLAGS", 2),
    ("CCSDS_SEQ_COUNT", 14),
    ("CCSDS_LENGTH", 16),
];

/// XTCE 1.2 SpaceSystem: the CCSDS primary header as an abstract container, and the trust packet
/// inheriting it, restricted to `apid`.
pub fn xtce(name: &str, apid: u16) -> String {
    let mut o = String::from("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    let _ = writeln!(
        o,
        "<xtce:SpaceSystem xmlns:xtce=\"http://www.omg.org/spec/XTCE/20180204\" name=\"{name}\">"
    );
    o.push_str(" <xtce:TelemetryMetaData>\n  <xtce:ParameterTypeSet>\n");
    let int = |bits: u32| {
        format!("<xtce:UnitSet/><xtce:IntegerDataEncoding sizeInBits=\"{bits}\" encoding=\"unsigned\"/>")
    };
    for (n, bits) in HEADER {
        let _ = writeln!(o, "   <xtce:IntegerParameterType name=\"{n}_T\" signed=\"false\">{}</xtce:IntegerParameterType>", int(bits));
    }
    for (n, bits, kind, unit, _) in PARAMS {
        let u = if unit.is_empty() {
            "<xtce:UnitSet/>".to_string()
        } else {
            format!("<xtce:UnitSet><xtce:Unit>{unit}</xtce:Unit></xtce:UnitSet>")
        };
        let _ = match (n, kind) {
            ("BAND", _) => {
                let e: String = BANDS.iter().enumerate().map(|(i, b)| format!("<xtce:Enumeration value=\"{i}\" label=\"{b}\"/>")).collect();
                writeln!(o, "   <xtce:EnumeratedParameterType name=\"{n}_T\">{}<xtce:EnumerationList>{e}</xtce:EnumerationList></xtce:EnumeratedParameterType>", int(bits))
            }
            (_, 'f') => writeln!(o, "   <xtce:FloatParameterType name=\"{n}_T\" sizeInBits=\"{bits}\">{u}<xtce:FloatDataEncoding sizeInBits=\"{bits}\" encoding=\"IEEE754_1985\"/></xtce:FloatParameterType>"),
            _ => writeln!(o, "   <xtce:IntegerParameterType name=\"{n}_T\" signed=\"false\">{}</xtce:IntegerParameterType>", int(bits)),
        };
    }
    o.push_str("  </xtce:ParameterTypeSet>\n  <xtce:ParameterSet>\n");
    for (n, _) in HEADER {
        let _ = writeln!(
            o,
            "   <xtce:Parameter name=\"{n}\" parameterTypeRef=\"{n}_T\"/>"
        );
    }
    for (n, _, _, _, desc) in PARAMS {
        let _ = writeln!(o, "   <xtce:Parameter name=\"{n}\" parameterTypeRef=\"{n}_T\" shortDescription=\"{desc}\"/>");
    }
    o.push_str("  </xtce:ParameterSet>\n  <xtce:ContainerSet>\n   <xtce:SequenceContainer name=\"CCSDSPacket\" abstract=\"true\"><xtce:EntryList>\n");
    for (n, _) in HEADER {
        let _ = writeln!(o, "    <xtce:ParameterRefEntry parameterRef=\"{n}\"/>");
    }
    o.push_str("   </xtce:EntryList></xtce:SequenceContainer>\n   <xtce:SequenceContainer name=\"TRUST\"><xtce:EntryList>\n");
    for (n, ..) in PARAMS {
        let _ = writeln!(o, "    <xtce:ParameterRefEntry parameterRef=\"{n}\"/>");
    }
    let _ = writeln!(o, "   </xtce:EntryList><xtce:BaseContainer containerRef=\"CCSDSPacket\"><xtce:RestrictionCriteria><xtce:Comparison parameterRef=\"CCSDS_APID\" value=\"{apid}\"/></xtce:RestrictionCriteria></xtce:BaseContainer></xtce:SequenceContainer>");
    o.push_str("  </xtce:ContainerSet>\n </xtce:TelemetryMetaData>\n</xtce:SpaceSystem>\n");
    o
}

/// An OpenC3 COSMOS telemetry definition (`cmd_tlm` file) for target `target`.
pub fn cosmos(target: &str, apid: u16) -> String {
    let mut o = format!("TELEMETRY {target} TRUST BIG_ENDIAN \"Kshana GNSS trust\"\n");
    let mut bit = 0;
    for (n, bits) in HEADER {
        let kw = if n == "CCSDS_APID" {
            format!("ID_ITEM {n} {bit} {bits} UINT {apid}")
        } else {
            format!("ITEM {n} {bit} {bits} UINT")
        };
        let _ = writeln!(o, "  {kw}");
        bit += bits;
    }
    for (n, bits, kind, unit, desc) in PARAMS {
        let t = if kind == 'f' { "FLOAT" } else { "UINT" };
        let _ = writeln!(o, "  ITEM {n} {bit} {bits} {t} \"{desc}\"");
        if !unit.is_empty() {
            let _ = writeln!(o, "    UNITS {unit} {unit}");
        }
        if n == "BAND" {
            for (i, b) in BANDS.iter().enumerate() {
                let _ = writeln!(o, "    STATE {} {i}", b.to_ascii_uppercase());
            }
        }
        bit += bits;
    }
    o
}

/// An Open MCT telemetry dictionary (the shape of Open MCT's telemetry tutorial: measurements with
/// a `utc` domain and a `value` range).
pub fn openmct_dictionary(name: &str) -> serde_json::Value {
    let m: Vec<_> = PARAMS
        .iter()
        .map(|(n, _, kind, unit, desc)| {
            let key = format!("kshana.{}", n.to_ascii_lowercase());
            let mut value = serde_json::json!({ "key": "value", "name": desc, "format": if *kind == 'f' { "float" } else { "integer" }, "hints": { "range": 1 } });
            if !unit.is_empty() {
                value["units"] = (*unit).into();
            }
            if *n == "BAND" {
                value["format"] = "enum".into();
                value["enumerations"] = BANDS.iter().enumerate().map(|(i, b)| serde_json::json!({ "value": i, "string": b })).collect();
            }
            serde_json::json!({ "name": n, "key": key, "values": [value,
                { "key": "utc", "source": "timestamp", "name": "Timestamp", "format": "utc", "hints": { "domain": 1 } }] })
        })
        .collect();
    serde_json::json!({ "name": name, "key": "kshana", "measurements": m })
}

/// The Open MCT realtime datums of one sample (`{timestamp, value, id}`, timestamp in UNIX ms);
/// absent values are left out.
pub fn openmct_datums(s: &TrustSample, unix: f64) -> Vec<serde_json::Value> {
    let (_, v) = decode(&packet(s, 0, 0).unwrap_or_default()).unwrap_or_default();
    PARAMS
        .iter()
        .zip(v)
        .filter(|(_, x)| x.is_finite())
        .map(|((n, ..), x)| serde_json::json!({ "timestamp": (unix * 1000.0).round() as i64, "value": x, "id": format!("kshana.{}", n.to_ascii_lowercase()) }))
        .collect()
}
