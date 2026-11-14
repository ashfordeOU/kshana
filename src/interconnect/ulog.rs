// SPDX-License-Identifier: AGPL-3.0-only
//! PX4 ULog GNSS topics (roadmap 0.42 I6).
//!
//! A ULog file (public format description in the PX4 developer guide) is a 16-octet header (`ULog`,
//! `0x01 0x12 0x35`, a version octet, a 64-bit start time), then messages of a 16-bit size and a type
//! octet. Read here: `F` (a format, `name:type field;type field;...`, nested formats and arrays included,
//! padding fields kept so offsets add up), `A` (a subscription: multi id, message id, format name) and
//! `D` (data of a subscription). Every other message is stepped over by its size.
//!
//! Topics read: `vehicle_gps_position` and `sensor_gps`, with either field set PX4 has used
//! (`lat`/`lon` in 1e-7 degrees and `alt` in millimetres, or `latitude_deg`/`longitude_deg` and
//! `altitude_msl_m`). Trust attributes, as far as the log has them: `fix_type`, `satellites`
//! (`satellites_used`), `eph_m`, `epv_m`, `hdop`, `vdop`, `jamming_indicator`, `jamming_state`,
//! `spoofing_state`, `noise_per_ms`. Class: `degraded` for a 2D fix or when the receiver's jamming or
//! spoofing state is 2 or more (warning, indicated), `good` for a 3D fix or better otherwise. A fix
//! needs a fix type of 2 or more; its time is `time_utc_usec` when that is set, else none (the log's
//! own `timestamp` counts from boot and is kept as `extra.boot_s`).
//!
//! As an observation file (`kshana obs convert --format ulog`), every message of the first instance
//! (multi id 0) is one epoch: the fix (3D or better), satellites used, HDOP and VDOP, the jamming
//! indicator as `jam_ind` and the jamming and spoofing states as the receiver's self report (the codes
//! are the receiver's, as for u-blox `UBX-SEC-SIG`).

use std::collections::HashMap;

use super::{Decoded, Fix, Quality};
use crate::receiver_trust::{LogEpoch, ReceiverSelfReport, ReportedDop, ReportedFix, Timeline};

/// The ULog file magic.
pub const MAGIC: &[u8; 7] = b"ULog\x01\x12\x35";

const TOPICS: [&str; 2] = ["vehicle_gps_position", "sensor_gps"];

fn base_size(t: &str) -> Option<usize> {
    Some(match t {
        "int8_t" | "uint8_t" | "bool" | "char" => 1,
        "int16_t" | "uint16_t" => 2,
        "int32_t" | "uint32_t" | "float" => 4,
        "int64_t" | "uint64_t" | "double" => 8,
        _ => return None,
    })
}

/// A field of a format: type, array length, offset.
#[derive(Clone, Debug)]
struct Field {
    ty: String,
    count: usize,
    offset: usize,
}

fn size_of(t: &str, formats: &HashMap<String, Fields>, depth: u8) -> Option<usize> {
    if let Some(n) = base_size(t) {
        return Some(n);
    }
    if depth > 8 {
        return None;
    }
    formats
        .get(t)?
        .iter()
        .map(|(ty, _, n)| Some(size_of(ty, formats, depth + 1)? * n))
        .sum()
}

/// A format's fields: type, name, array length.
type Fields = Vec<(String, String, usize)>;

fn parse_format(s: &str) -> Option<(String, Fields)> {
    let (name, rest) = s.split_once(':')?;
    let mut fields = Vec::new();
    for f in rest.split(';').filter(|f| !f.trim().is_empty()) {
        let (ty, fname) = f.trim().rsplit_once(' ')?;
        let (ty, n) = match ty.split_once('[') {
            Some((t, n)) => (t, n.trim_end_matches(']').parse().ok()?),
            None => (ty, 1),
        };
        fields.push((ty.to_string(), fname.to_string(), n));
    }
    Some((name.to_string(), fields))
}

fn layout(name: &str, formats: &HashMap<String, Fields>) -> Option<HashMap<String, Field>> {
    let mut out = HashMap::new();
    let mut off = 0;
    for (ty, fname, n) in formats.get(name)? {
        let sz = size_of(ty, formats, 0)?;
        out.insert(
            fname.clone(),
            Field {
                ty: ty.clone(),
                count: *n,
                offset: off,
            },
        );
        off += sz * n;
    }
    Some(out)
}

fn scalar(data: &[u8], f: &Field) -> Option<f64> {
    if f.count != 1 {
        return None;
    }
    let b = data.get(f.offset..f.offset + base_size(&f.ty)?)?;
    let a = |n: usize| {
        let mut x = [0u8; 8];
        x[..n].copy_from_slice(&b[..n]);
        x
    };
    Some(match f.ty.as_str() {
        "int8_t" => f64::from(b[0] as i8),
        "uint8_t" | "bool" | "char" => f64::from(b[0]),
        "int16_t" => f64::from(i16::from_le_bytes([b[0], b[1]])),
        "uint16_t" => f64::from(u16::from_le_bytes([b[0], b[1]])),
        "int32_t" => f64::from(i32::from_le_bytes([b[0], b[1], b[2], b[3]])),
        "uint32_t" => f64::from(u32::from_le_bytes([b[0], b[1], b[2], b[3]])),
        "float" => f64::from(f32::from_le_bytes([b[0], b[1], b[2], b[3]])),
        "int64_t" => i64::from_le_bytes(a(8)) as f64,
        "uint64_t" => u64::from_le_bytes(a(8)) as f64,
        "double" => f64::from_le_bytes(a(8)),
        _ => return None,
    })
}

/// One GNSS message of a log.
#[derive(Clone, Debug, PartialEq)]
pub struct GpsMsg {
    /// The topic (`vehicle_gps_position` or `sensor_gps`).
    pub topic: String,
    /// The instance (multi id).
    pub multi_id: u8,
    /// Time since boot, seconds.
    pub boot_s: f64,
    /// Values by field name (scalar fields only).
    pub values: HashMap<String, f64>,
}

impl GpsMsg {
    fn v(&self, k: &str) -> Option<f64> {
        self.values.get(k).copied()
    }

    /// Latitude, longitude and height above mean sea level, whichever field set the log uses.
    pub fn position(&self) -> Option<(f64, f64, Option<f64>)> {
        if let (Some(la), Some(lo)) = (self.v("latitude_deg"), self.v("longitude_deg")) {
            return Some((la, lo, self.v("altitude_msl_m")));
        }
        let (la, lo) = (self.v("lat")?, self.v("lon")?);
        Some((la * 1e-7, lo * 1e-7, self.v("alt").map(|a| a / 1000.0)))
    }

    /// The UTC time, when the receiver gave one.
    pub fn utc(&self) -> Option<f64> {
        self.v("time_utc_usec")
            .filter(|t| *t > 0.0)
            .map(|t| t / 1e6)
    }
}

/// Every GNSS message of a ULog file, in file order.
pub fn read(bytes: &[u8]) -> Result<(Vec<GpsMsg>, usize), String> {
    if bytes.len() < 16 || &bytes[..7] != MAGIC {
        return Err(crate::terr!("e-interconnect-ulog-header"));
    }
    let mut formats: HashMap<String, Fields> = HashMap::new();
    let mut subs: HashMap<u16, (u8, String, HashMap<String, Field>)> = HashMap::new();
    let mut out = Vec::new();
    let mut malformed = 0;
    let mut i = 16;
    while i + 3 <= bytes.len() {
        let size = usize::from(u16::from_le_bytes([bytes[i], bytes[i + 1]]));
        let ty = bytes[i + 2];
        let Some(body) = bytes.get(i + 3..i + 3 + size) else {
            malformed += 1;
            break;
        };
        i += 3 + size;
        match ty {
            b'F' => match parse_format(&String::from_utf8_lossy(body)) {
                Some((n, f)) => {
                    formats.insert(n, f);
                }
                None => malformed += 1,
            },
            b'A' if body.len() >= 3 => {
                let id = u16::from_le_bytes([body[1], body[2]]);
                let name = String::from_utf8_lossy(&body[3..]).into_owned();
                if TOPICS.contains(&name.as_str()) {
                    match layout(&name, &formats) {
                        Some(l) => {
                            subs.insert(id, (body[0], name, l));
                        }
                        None => malformed += 1,
                    }
                }
            }
            b'D' if body.len() >= 2 => {
                let id = u16::from_le_bytes([body[0], body[1]]);
                let Some((multi, name, l)) = subs.get(&id) else {
                    continue;
                };
                let data = &body[2..];
                let values: HashMap<String, f64> = l
                    .iter()
                    .filter_map(|(k, f)| Some((k.clone(), scalar(data, f)?)))
                    .collect();
                let Some(ts) = values.get("timestamp").copied() else {
                    malformed += 1;
                    continue;
                };
                out.push(GpsMsg {
                    topic: name.clone(),
                    multi_id: *multi,
                    boot_s: ts / 1e6,
                    values,
                });
            }
            _ => {}
        }
    }
    Ok((out, malformed))
}

fn fix_of(m: &GpsMsg) -> Option<Fix> {
    let fix_type = m.v("fix_type")? as u8;
    let (lat, lon, alt) = m.position()?;
    if fix_type < 2 || (lat == 0.0 && lon == 0.0) {
        return None;
    }
    let mut x = Fix::new(
        "ulog",
        format!("{}/{}", m.topic, m.multi_id),
        m.utc(),
        lat,
        lon,
    );
    x.alt_m = alt;
    let q = &mut x.quality;
    q.insert("fix_type".into(), fix_type.into());
    for (k, out) in [
        ("satellites_used", "satellites"),
        ("eph", "eph_m"),
        ("epv", "epv_m"),
        ("hdop", "hdop"),
        ("vdop", "vdop"),
        ("jamming_indicator", "jamming_indicator"),
        ("jamming_state", "jamming_state"),
        ("spoofing_state", "spoofing_state"),
        ("noise_per_ms", "noise_per_ms"),
    ] {
        if let Some(v) = m.v(k) {
            let v = if v.fract() == 0.0 {
                serde_json::Value::from(v as i64)
            } else {
                serde_json::Value::from(super::round_to(v, 1e6))
            };
            q.insert(out.into(), v);
        }
    }
    let flagged = m.v("jamming_state").is_some_and(|v| v >= 2.0)
        || m.v("spoofing_state").is_some_and(|v| v >= 2.0);
    x.reported_quality = if fix_type < 3 || flagged {
        Quality::Degraded
    } else {
        Quality::Good
    };
    x.extra.insert("boot_s".into(), m.boot_s.into());
    Some(x)
}

/// Decode a ULog file into fixes.
pub fn decode(bytes: &[u8]) -> Result<Decoded, String> {
    let (msgs, malformed) = read(bytes)?;
    let mut d = Decoded {
        read: msgs.len(),
        malformed,
        ..Decoded::default()
    };
    for m in &msgs {
        match fix_of(m) {
            Some(x) => d.fixes.push(x),
            None => d.other += 1,
        }
    }
    Ok(d)
}

/// The first receiver instance of a ULog file as a timeline (see the module notes).
pub fn timeline(bytes: &[u8]) -> Result<Timeline, String> {
    let (msgs, malformed) = read(bytes)?;
    let mut epochs = Vec::new();
    let mut first = None;
    for m in msgs.iter().filter(|m| m.multi_id == 0) {
        let t0 = *first.get_or_insert(m.boot_s);
        let fix_type = m.v("fix_type").unwrap_or(0.0) as u8;
        let n_used = m.v("satellites_used").map(|v| v as u32);
        let fix = m
            .position()
            .filter(|_| fix_type >= 3)
            .map(|(la, lo, h)| ReportedFix {
                lat_deg: super::round_to(la, 1e7),
                lon_deg: super::round_to(lo, 1e7),
                height_m: h.unwrap_or(0.0),
                n_used,
            });
        let state = |k: &str| m.v(k).map(|v| v as u8);
        let self_report = (state("jamming_state").is_some() || state("spoofing_state").is_some())
            .then_some(ReceiverSelfReport {
                spoofing: state("spoofing_state"),
                jamming: state("jamming_state"),
                rf_bands_reported: None,
            });
        let (hdop, vdop) = (m.v("hdop"), m.v("vdop"));
        let r = |v: f64| super::round_to(v, 1e6);
        epochs.push(LogEpoch {
            t_s: r(m.boot_s - t0),
            time_label: m.utc().map(super::iso),
            jam_ind: m.v("jamming_indicator"),
            fix,
            reported_dop: (hdop.is_some() || vdop.is_some()).then_some(ReportedDop {
                pdop: None,
                hdop: hdop.map(r),
                vdop: vdop.map(r),
                n_used: n_used.unwrap_or(0),
            }),
            self_report,
            ..LogEpoch::default()
        });
    }
    Ok(crate::receiver_trust::ingest::timeline_from(
        epochs, malformed,
    ))
}

#[cfg(test)]
pub(crate) mod tests {
    use super::*;

    fn msg(ty: u8, body: &[u8]) -> Vec<u8> {
        let mut m = (body.len() as u16).to_le_bytes().to_vec();
        m.push(ty);
        m.extend_from_slice(body);
        m
    }

    /// Test encoder: a ULog with one `vehicle_gps_position` subscription (the older field set) and the
    /// given (boot µs, utc µs, lat, lon, fix type, jamming state).
    pub(crate) fn file(rows: &[(u64, u64, f64, f64, u8, u8)]) -> Vec<u8> {
        let mut b = MAGIC.to_vec();
        b.push(1);
        b.extend_from_slice(&0u64.to_le_bytes());
        b.extend(msg(b'F', b"vehicle_gps_position:uint64_t timestamp;uint64_t time_utc_usec;int32_t lat;int32_t lon;int32_t alt;float eph;float epv;float hdop;float vdop;int32_t jamming_indicator;uint8_t jamming_state;uint8_t spoofing_state;uint8_t fix_type;uint8_t satellites_used;uint8_t[4] _padding0;"));
        b.extend(msg(b'I', b"\x0bchar[3] ver123"));
        let mut a = vec![0u8];
        a.extend_from_slice(&7u16.to_le_bytes());
        a.extend_from_slice(b"vehicle_gps_position");
        b.extend(msg(b'A', &a));
        for &(boot, utc, lat, lon, fix, jam) in rows {
            let mut d = 7u16.to_le_bytes().to_vec();
            d.extend_from_slice(&boot.to_le_bytes());
            d.extend_from_slice(&utc.to_le_bytes());
            d.extend_from_slice(&((lat * 1e7).round() as i32).to_le_bytes());
            d.extend_from_slice(&((lon * 1e7).round() as i32).to_le_bytes());
            d.extend_from_slice(&488_123i32.to_le_bytes());
            for v in [0.8f32, 1.25, 0.9, 1.5] {
                d.extend_from_slice(&v.to_le_bytes());
            }
            d.extend_from_slice(&40i32.to_le_bytes());
            d.extend_from_slice(&[jam, 1, fix, 11]);
            // The trailing padding is not logged.
            b.extend(msg(b'D', &d));
        }
        b
    }

    #[test]
    fn fixes_states_and_timeline_round_trip() {
        let f = file(&[
            (
                10_000_000,
                1_700_000_000_000_000,
                47.3977419,
                8.5455938,
                3,
                1,
            ),
            (
                10_200_000,
                1_700_000_000_200_000,
                47.3977420,
                8.5455939,
                3,
                2,
            ),
            (10_400_000, 0, 0.0, 0.0, 0, 0),
        ]);
        let d = decode(&f).unwrap();
        assert_eq!(d.read, 3);
        assert_eq!(d.fixes.len(), 2);
        assert_eq!(d.fixes[0].lat_deg, 47.3977419);
        assert_eq!(d.fixes[0].alt_m, Some(488.123));
        assert_eq!(d.fixes[0].quality["jamming_indicator"], 40);
        assert_eq!(d.fixes[0].quality["hdop"], 0.9);
        assert_eq!(d.fixes[0].reported_quality, Quality::Good);
        assert_eq!(d.fixes[1].reported_quality, Quality::Degraded);
        assert_eq!(d.fixes[1].t_unix_s, Some(1_700_000_000.2));
        let tl = timeline(&f).unwrap();
        assert_eq!(tl.epochs.len(), 3);
        assert_eq!(tl.observables, ["jam_ind", "fix"]);
        assert_eq!(tl.epochs[1].self_report.unwrap().jamming, Some(2));
        assert_eq!(tl.epochs[2].t_s, 0.4);
        assert!(read(b"NotULog...........").is_err());
    }
}
