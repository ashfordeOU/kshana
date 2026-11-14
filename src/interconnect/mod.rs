// SPDX-License-Identifier: AGPL-3.0-only
//! Interconnect readers for maritime, aviation and drone data (roadmap 0.42, items I1 and I6), and the
//! export of what they read as GeoJSON, KML and CZML tracks with their trust attributes.
//!
//! Each reader turns one public format into [`Fix`]es: one position of one vessel, aircraft or vehicle,
//! with the accuracy and integrity fields that the format itself carries (the *trust attributes*) and a
//! [`Quality`] class drawn from those fields by a stated rule. Nothing is inferred that the message does
//! not say.
//!
//! | Format | Module | Trust attributes kept |
//! |---|---|---|
//! | NMEA 0183 `!AIVDM`/`!AIVDO` (AIS types 1, 2, 3, 4, 5, 18, 19, 24), with NMEA 4 TAG blocks and IEC 61162-450 datagram headers | [`ais`] | position accuracy flag, RAIM flag, fix device (EPFD) |
//! | NMEA 2000 as canboat `analyzer -json` lines | [`canboat`] | GNSS method, integrity, satellites, HDOP, PDOP, per-satellite SNR; AIS targets as above |
//! | EUROCONTROL ASTERIX CAT010, CAT021, CAT048, CAT062 | [`asterix`] (CAT021: [`crate::asterix_cat021`]) | detection type, track status, estimated accuracies; for CAT021 NIC and NACp |
//! | Mode S / ADS-B from Beast binary and AVR hex | [`modes`] | NIC (from the type code and the NIC supplements), NACp, ADS-B version |
//! | OpenSky-style state vectors (REST JSON, historical CSV) | [`opensky`] | position source; NIC and NACp when the export has those columns |
//! | MAVLink v1 and v2 `GPS_RAW_INT`, `GPS_STATUS`, `GPS2_RAW` (`.tlog` and live UDP, read only) | [`mavlink`] | fix type, EPH, EPV, accuracies, satellites, per-satellite SNR |
//! | PX4 ULog `vehicle_gps_position` / `sensor_gps` | [`ulog`] | fix type, EPH, EPV, HDOP, VDOP, jamming indicator, jamming and spoofing states |
//!
//! [`export`] writes the fixes of any reader as GeoJSON (RFC 7946), KML 2.2 or CZML, one track per
//! vessel, aircraft or vehicle, every point carrying its trust attributes and its quality class.
//!
//! Every reader is read only: nothing is sent to a receiver, an autopilot or a network. The MAVLink live
//! reader binds a UDP port and listens; it sends no message (no heartbeat, no stream request).
//!
//! MODELLED: each reader is checked on vectors built from the public descriptions of its format, and
//! where a published example exists, on it (`tests/interconnect.rs`, `conformance/connect/`). No reader
//! is validated against a decoder approved for operational use or a recording from operational equipment.

pub mod ais;
pub mod asterix;
pub mod canboat;
pub mod cli;
pub mod export;
pub mod mavlink;
pub mod modes;
pub mod opensky;
pub mod ulog;

use serde::Serialize;
use serde_json::{Map, Value};

/// The schema id of the JSON Lines a decode writes.
pub const SCHEMA: &str = "kshana.tracks/1";

/// What the trust attributes of one fix say, by the rule of its format (see each reader).
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
#[serde(rename_all = "kebab-case")]
pub enum Quality {
    /// The fix's own accuracy or integrity fields are at or above the stated "good" bound.
    Good,
    /// The fields are present but between the "good" and the "degraded" bounds.
    Intermediate,
    /// The fields are at or below the stated "degraded" bound, or the source flags the fix.
    Degraded,
    /// The format carries no bound for this fix, or the fields are absent.
    Unknown,
}

impl Quality {
    /// The class as written in the outputs.
    pub fn as_str(self) -> &'static str {
        match self {
            Quality::Good => "good",
            Quality::Intermediate => "intermediate",
            Quality::Degraded => "degraded",
            Quality::Unknown => "unknown",
        }
    }

    /// The ADS-B rule: the interference map's pre-registered NIC and NACp bounds
    /// ([`crate::interference_map::adsb::AdsbParams::PREREGISTERED_V1`]).
    pub fn of_adsb(nic: Option<u8>, nacp: Option<u8>) -> Quality {
        if nic.is_none() && nacp.is_none() {
            return Quality::Unknown;
        }
        let (low, good) =
            crate::interference_map::adsb::AdsbParams::PREREGISTERED_V1.classify(nic, nacp);
        if low {
            Quality::Degraded
        } else if good {
            Quality::Good
        } else {
            Quality::Intermediate
        }
    }
}

/// One position of one vessel, aircraft or vehicle.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Fix {
    /// The format that gave it (`ais`, `adsb`, `asterix-cat048`, `mavlink`, ...).
    pub source: String,
    /// The object's identifier as the format states it (MMSI, ICAO 24-bit address in hex, system id, track number).
    pub id: String,
    /// UTC time, seconds since 1970-01-01, when the input gives a calendar time.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub t_unix_s: Option<f64>,
    /// Latitude, degrees (WGS-84).
    pub lat_deg: f64,
    /// Longitude, degrees (WGS-84).
    pub lon_deg: f64,
    /// Height, metres, where the format gives one (see the reader for its reference).
    #[serde(skip_serializing_if = "Option::is_none")]
    pub alt_m: Option<f64>,
    /// The trust attributes, as the format states them.
    pub quality: Map<String, Value>,
    /// The class drawn from them.
    pub reported_quality: Quality,
    /// Other fields of the message (speed, course, callsign, time of day, ...).
    #[serde(skip_serializing_if = "Map::is_empty")]
    pub extra: Map<String, Value>,
}

impl Fix {
    /// A fix with no attributes yet; latitude and longitude rounded to 1e-7 degree.
    pub fn new(source: &str, id: String, t_unix_s: Option<f64>, lat: f64, lon: f64) -> Fix {
        Fix {
            source: source.to_string(),
            id,
            t_unix_s,
            lat_deg: round_to(lat, 1e7),
            lon_deg: round_to(lon, 1e7),
            alt_m: None,
            quality: Map::new(),
            reported_quality: Quality::Unknown,
            extra: Map::new(),
        }
    }
}

/// What a decode found.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct Decoded {
    /// The fixes, in input order.
    pub fixes: Vec<Fix>,
    /// Other decoded records (AIS static and voyage data, aircraft identification), each with a `kind`.
    pub records: Vec<Value>,
    /// Messages or frames read.
    pub read: usize,
    /// Messages dropped because a checksum or a CRC failed.
    pub bad_checksum: usize,
    /// Messages that were cut short or malformed.
    pub malformed: usize,
    /// Messages of a type this reader does not decode, stepped over.
    pub other: usize,
}

/// Options some formats need: the UTC day of ASTERIX times of day, the start of a Beast or AVR
/// counter, the position of a radar for polar plots.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Options {
    /// Start of the UTC day (Unix seconds) for formats that carry only the time of day.
    pub day_start_unix_s: Option<i64>,
    /// Unix time of the first message, for formats with a free-running counter (Beast, AVR `@`).
    pub start_unix_s: Option<f64>,
    /// The sensor's position (latitude and longitude in degrees, height in metres) for polar and
    /// Cartesian ASTERIX plots.
    pub radar: Option<(f64, f64, f64)>,
}

impl Options {
    /// Parse `key=value` options: `day=YYYY-MM-DD`, `start=<unix seconds>`, `radar=<lat>,<lon>,<height m>`.
    pub fn parse(pairs: &[(String, String)]) -> Result<Options, String> {
        let mut o = Options::default();
        let bad = |k: &str, v: &str| crate::terr!("e-interconnect-option", key = k, value = v);
        for (k, v) in pairs {
            match k.as_str() {
                "day" => {
                    let p: Vec<&str> = v.split('-').collect();
                    let n = |s: &str| s.parse::<i64>().ok();
                    let (Some(y), Some(m), Some(d)) = (
                        p.first().and_then(|s| n(s)),
                        p.get(1).and_then(|s| n(s)),
                        p.get(2).and_then(|s| n(s)),
                    ) else {
                        return Err(bad(k, v));
                    };
                    if p.len() != 3 || !(1..=12).contains(&m) || !(1..=31).contains(&d) {
                        return Err(bad(k, v));
                    }
                    o.day_start_unix_s = Some(
                        crate::interference_map::time::days_from_civil(y, m as u32, d as u32)
                            * 86_400,
                    );
                }
                "start" => {
                    o.start_unix_s = Some(v.parse::<f64>().map_err(|_| bad(k, v))?);
                }
                "radar" => {
                    let p: Vec<f64> = v
                        .split(',')
                        .map(|s| s.trim().parse::<f64>())
                        .collect::<Result<_, _>>()
                        .map_err(|_| bad(k, v))?;
                    if p.len() != 3 || p[0].abs() > 90.0 || p[1].abs() > 180.0 {
                        return Err(bad(k, v));
                    }
                    o.radar = Some((p[0], p[1], p[2]));
                }
                _ => return Err(bad(k, v)),
            }
        }
        Ok(o)
    }
}

/// The formats [`decode`] reads.
pub const FORMATS: [&str; 10] = [
    "ais",
    "canboat",
    "asterix",
    "beast",
    "avr",
    "opensky-json",
    "opensky-csv",
    "mavlink",
    "mavlink-tlog",
    "ulog",
];

/// Decode `bytes` in `format` (one of [`FORMATS`]).
pub fn decode(format: &str, bytes: &[u8], opt: &Options) -> Result<Decoded, String> {
    let text = || String::from_utf8_lossy(bytes);
    Ok(match format {
        "ais" => ais::decode_text(&text()),
        "canboat" => canboat::decode(&text())?,
        "asterix" => asterix::decode(bytes, opt),
        "beast" => modes::decode_beast(bytes, opt),
        "avr" => modes::decode_avr(&text(), opt),
        "opensky-json" => opensky::decode_json(&text())?,
        "opensky-csv" => opensky::decode_csv(&text())?,
        "mavlink" => mavlink::decode_stream(bytes),
        "mavlink-tlog" => mavlink::decode_tlog(bytes),
        "ulog" => ulog::decode(bytes)?,
        _ => {
            return Err(crate::terr!(
                "e-interconnect-format",
                format = format,
                known = FORMATS.join(", ")
            ))
        }
    })
}

/// The decode as JSON Lines: a header line (`schema`, `source_format`, counts), then one line per fix
/// (`"kind": "fix"`) and one per other record, in input order within each kind.
pub fn to_jsonl(d: &Decoded, format: &str) -> String {
    let mut out = String::new();
    let head = serde_json::json!({
        "schema": SCHEMA,
        "source_format": format,
        "read": d.read,
        "fixes": d.fixes.len(),
        "records": d.records.len(),
        "bad_checksum": d.bad_checksum,
        "malformed": d.malformed,
        "other": d.other,
    });
    out.push_str(&head.to_string());
    out.push('\n');
    for f in &d.fixes {
        let mut v = serde_json::to_value(f).unwrap_or(Value::Null);
        if let Value::Object(m) = &mut v {
            m.insert("kind".into(), Value::from("fix"));
        }
        out.push_str(&v.to_string());
        out.push('\n');
    }
    for r in &d.records {
        out.push_str(&r.to_string());
        out.push('\n');
    }
    out
}

/// The ADS-B fixes as the interference map's ADS-B CSV (`docs/INTERFERENCE-MAP.md`): rows with a time
/// only. `alt_baro_ft` comes from `extra.alt_baro_ft` where the format gives a barometric altitude.
pub fn to_adsb_csv(d: &Decoded) -> String {
    let mut s = String::from(crate::interference_map::live::ADSB_HEADER);
    s.push('\n');
    for f in &d.fixes {
        let Some(t) = f.t_unix_s else { continue };
        let num = |k: &str| {
            f.quality
                .get(k)
                .and_then(Value::as_u64)
                .map(|v| v.to_string())
                .unwrap_or_default()
        };
        let alt = f
            .extra
            .get("alt_baro_ft")
            .and_then(Value::as_f64)
            .map(|v| format!("{v}"))
            .unwrap_or_default();
        s.push_str(&format!(
            "{t:.3},{},{:.7},{:.7},{alt},{},{},adsb\n",
            f.id,
            f.lat_deg,
            f.lon_deg,
            num("nic"),
            num("nacp")
        ));
    }
    s
}

/// The AIS fixes as the interference map's AIS CSV: rows with a time only.
pub fn to_ais_csv(d: &Decoded) -> String {
    let mut s = String::from(crate::interference_map::live::AIS_HEADER);
    s.push('\n');
    for f in d.fixes.iter().filter(|f| f.source == "ais") {
        let Some(t) = f.t_unix_s else { continue };
        let sog = f
            .extra
            .get("sog_kn")
            .and_then(Value::as_f64)
            .map(|v| format!("{v}"))
            .unwrap_or_default();
        s.push_str(&format!(
            "{t:.3},{},{:.7},{:.7},{sog}\n",
            f.id, f.lat_deg, f.lon_deg
        ));
    }
    s
}

/// The observation-file readers this module adds to `kshana obs convert --format` and to Connect
/// vectors (`reader = ...`): a receiver's own fixes and signal levels from a drone or vessel log.
pub const OBS_READERS: [&str; 3] = ["mavlink-tlog", "ulog", "canboat"];

/// A receiver timeline from a drone or vessel log (one of [`OBS_READERS`]), or `None` for another format.
pub fn obs_timeline(
    format: &str,
    bytes: &[u8],
) -> Option<Result<crate::receiver_trust::Timeline, String>> {
    match format {
        "mavlink-tlog" => Some(Ok(mavlink::timeline(bytes))),
        "ulog" => Some(ulog::timeline(bytes)),
        "canboat" => Some(canboat::timeline(&String::from_utf8_lossy(bytes))),
        _ => None,
    }
}

pub(crate) fn round_to(x: f64, scale: f64) -> f64 {
    (x * scale).round() / scale
}

/// RINEX-style satellite id from an NMEA-style PRN (1–32 GPS, 33–64 SBAS as PRN + 87, 65–96 GLONASS
/// slots); `None` for numbers outside those ranges.
pub(crate) fn sat_of_nmea_prn(prn: u32) -> Option<String> {
    match prn {
        1..=32 => Some(format!("G{prn:02}")),
        33..=64 => Some(format!("S{:02}", prn + 87 - 100)),
        65..=96 => Some(format!("R{:02}", prn - 64)),
        _ => None,
    }
}

/// `YYYY-MM-DDTHH:MM:SS.mmmZ` (or whole seconds) of a Unix time.
pub(crate) fn iso(t_unix_s: f64) -> String {
    crate::nmea_synth::clock::iso((t_unix_s * 1000.0).round() as i64)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn options_parse_and_reject() {
        let o = Options::parse(&[
            ("day".into(), "2026-01-02".into()),
            ("radar".into(), "52.0,4.5,10".into()),
            ("start".into(), "1700000000.5".into()),
        ])
        .unwrap();
        assert_eq!(o.day_start_unix_s, Some(1_767_312_000));
        assert_eq!(o.radar, Some((52.0, 4.5, 10.0)));
        assert_eq!(o.start_unix_s, Some(1_700_000_000.5));
        assert!(Options::parse(&[("day".into(), "2026-13-01".into())]).is_err());
        assert!(Options::parse(&[("radar".into(), "95,0,0".into())]).is_err());
        assert!(Options::parse(&[("colour".into(), "red".into())]).is_err());
    }

    #[test]
    fn adsb_quality_follows_the_interference_map_bounds() {
        assert_eq!(Quality::of_adsb(Some(8), Some(9)), Quality::Good);
        assert_eq!(Quality::of_adsb(Some(8), Some(6)), Quality::Degraded);
        assert_eq!(Quality::of_adsb(Some(6), Some(7)), Quality::Intermediate);
        assert_eq!(Quality::of_adsb(None, None), Quality::Unknown);
    }

    #[test]
    fn sbas_and_glonass_prns() {
        assert_eq!(sat_of_nmea_prn(5).as_deref(), Some("G05"));
        assert_eq!(sat_of_nmea_prn(33).as_deref(), Some("S20"));
        assert_eq!(sat_of_nmea_prn(65).as_deref(), Some("R01"));
        assert_eq!(sat_of_nmea_prn(200), None);
    }
}
