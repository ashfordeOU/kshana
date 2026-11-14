// SPDX-License-Identifier: AGPL-3.0-only
//! NMEA 2000 as the open `canboat` project's `analyzer -json` writes it (roadmap 0.42 I1).
//!
//! One JSON object per line: `{"timestamp": ..., "src": 3, "pgn": 129029, "fields": {...}}`. Field names
//! are canboat's; a value is a number, or a text (an enumeration name, or a number in a text, as some
//! canboat versions write them). Read parameter groups:
//!
//! * 129029 GNSS Position Data: a fix of the vessel's own receiver (`source` `canboat`, id `src<address>`)
//!   with `method`, `integrity`, `satellites`, `hdop` and `pdop` as trust attributes. The class is
//!   `good` when the receiver states integrity "Safe", `degraded` for "Caution" or "Unsafe", otherwise
//!   `unknown`. A method of "no GNSS" gives no fix.
//! * 129025 Position, Rapid Update: a fix with no trust attributes (`unknown`).
//! * 129539 GNSS DOPs and 129540 GNSS Sats in View: the VDOP and the per-satellite SNR of the next
//!   receiver epoch (observation files only).
//! * 129038 and 129039 AIS class A and class B position reports: an `ais` fix of the other vessel, with
//!   `position_accuracy` and `raim` as in [`super::ais`].
//!
//! The PGN field names are the publicly documented canboat ones; the NMEA 2000 standard is not
//! reproduced or consulted. For the CAN frames themselves (SocketCAN `candump`), see [`crate::n2k`].
//!
//! As an observation file (`kshana obs convert --format canboat`), every 129029 with a fix is one epoch:
//! the fix, the satellites used, HDOP and PDOP, the VDOP of the latest 129539 and the SNR of the latest
//! 129540 received within two seconds before it. SNR is carried as C/N0 in dB-Hz on `L1`.

use serde_json::{Map, Value};

use super::{Decoded, Fix, Quality};
use crate::receiver_trust::{LogEpoch, ReportedDop, ReportedFix, SatCn0, SatSky, Timeline};

/// Unix seconds of a canboat timestamp: `2022-09-28T11:36:59.668Z`, `2022-09-28-11:36:59.668` or
/// `2022-09-28 11:36:59.668`.
pub fn parse_timestamp(s: &str) -> Option<f64> {
    let s = s.trim().trim_end_matches('Z');
    let date = s.get(..10)?;
    let time = s.get(11..)?;
    let d: Vec<i64> = date
        .split(['-', '.'])
        .map(|p| p.parse().ok())
        .collect::<Option<_>>()?;
    let t = parse_time_of_day(time)?;
    if d.len() != 3 || !(1..=12).contains(&d[1]) || !(1..=31).contains(&d[2]) {
        return None;
    }
    let days = crate::interference_map::time::days_from_civil(d[0], d[1] as u32, d[2] as u32);
    Some(days as f64 * 86_400.0 + t)
}

fn parse_time_of_day(s: &str) -> Option<f64> {
    let p: Vec<&str> = s.split(':').collect();
    if p.len() != 3 {
        return None;
    }
    let h: f64 = p[0].parse().ok()?;
    let m: f64 = p[1].parse().ok()?;
    let sec: f64 = p[2].parse().ok()?;
    Some(h * 3600.0 + m * 60.0 + sec)
}

fn num(fields: &Map<String, Value>, k: &str) -> Option<f64> {
    match fields.get(k)? {
        Value::Number(n) => n.as_f64(),
        Value::String(s) => s.trim().parse().ok(),
        _ => None,
    }
}

fn text(fields: &Map<String, Value>, k: &str) -> Option<String> {
    match fields.get(k)? {
        Value::String(s) => Some(s.clone()),
        Value::Number(n) => Some(n.to_string()),
        _ => None,
    }
}

/// A flag written as a name or a number: true for `1`, "High", "in use", "true".
fn flag(fields: &Map<String, Value>, k: &str) -> Option<u64> {
    Some(match fields.get(k)? {
        Value::Number(n) => u64::from(n.as_u64()? != 0),
        Value::Bool(b) => u64::from(*b),
        Value::String(s) => {
            let s = s.to_ascii_lowercase();
            u64::from(s == "1" || s.starts_with("high") || s == "in use" || s == "true")
        }
        _ => return None,
    })
}

struct Frame {
    t: Option<f64>,
    src: u64,
    pgn: u64,
    fields: Map<String, Value>,
}

fn frames(text: &str) -> Result<(Vec<Frame>, usize), String> {
    let mut out = Vec::new();
    let mut bad = 0;
    for (i, l) in text.lines().enumerate() {
        let l = l.trim();
        if l.is_empty() {
            continue;
        }
        let v: Value = match serde_json::from_str(l) {
            Ok(v) => v,
            Err(e) => {
                if out.is_empty() && bad == 0 && i == 0 {
                    return Err(crate::terr!("e-interconnect-json", line = 1, e = e));
                }
                bad += 1;
                continue;
            }
        };
        let (Some(pgn), Some(fields)) = (v["pgn"].as_u64(), v["fields"].as_object()) else {
            bad += 1;
            continue;
        };
        out.push(Frame {
            t: v["timestamp"].as_str().and_then(parse_timestamp),
            src: v["src"].as_u64().unwrap_or(0),
            pgn,
            fields: fields.clone(),
        });
    }
    Ok((out, bad))
}

/// The epoch time of a 129029: its own date and time, else the frame's.
fn gnss_time(f: &Frame) -> Option<f64> {
    let d = text(&f.fields, "Date");
    let t = text(&f.fields, "Time");
    match (d, t) {
        (Some(d), Some(t)) => parse_timestamp(&format!("{d} {t}")).or(f.t),
        _ => f.t,
    }
}

fn gnss_fix(f: &Frame) -> Option<Fix> {
    let method = text(&f.fields, "Method").unwrap_or_default();
    if method.to_ascii_lowercase().starts_with("no gnss") || method == "0" {
        return None;
    }
    let (lat, lon) = (num(&f.fields, "Latitude")?, num(&f.fields, "Longitude")?);
    let mut x = Fix::new("canboat", format!("src{}", f.src), gnss_time(f), lat, lon);
    x.alt_m = num(&f.fields, "Altitude");
    let q = &mut x.quality;
    if !method.is_empty() {
        q.insert("method".into(), method.into());
    }
    let integrity = text(&f.fields, "Integrity");
    if let Some(i) = &integrity {
        q.insert("integrity".into(), i.clone().into());
    }
    for (k, out) in [
        ("Number of SVs", "satellites"),
        ("HDOP", "hdop"),
        ("PDOP", "pdop"),
    ] {
        if let Some(v) = num(&f.fields, k) {
            q.insert(out.into(), v.into());
        }
    }
    x.reported_quality = match integrity.as_deref().map(str::to_ascii_lowercase).as_deref() {
        Some("safe") | Some("1") => Quality::Good,
        Some("caution") | Some("unsafe") | Some("2") | Some("3") => Quality::Degraded,
        _ => Quality::Unknown,
    };
    Some(x)
}

/// Decode canboat JSON lines into fixes.
pub fn decode(text: &str) -> Result<Decoded, String> {
    let (frames, bad) = frames(text)?;
    let mut d = Decoded {
        malformed: bad,
        ..Decoded::default()
    };
    for f in &frames {
        d.read += 1;
        match f.pgn {
            129029 => {
                if let Some(x) = gnss_fix(f) {
                    d.fixes.push(x);
                }
            }
            129025 => {
                if let (Some(lat), Some(lon)) =
                    (num(&f.fields, "Latitude"), num(&f.fields, "Longitude"))
                {
                    d.fixes
                        .push(Fix::new("canboat", format!("src{}", f.src), f.t, lat, lon));
                }
            }
            129038 | 129039 => {
                let (Some(mmsi), Some(lat), Some(lon)) = (
                    num(&f.fields, "User ID"),
                    num(&f.fields, "Latitude"),
                    num(&f.fields, "Longitude"),
                ) else {
                    d.malformed += 1;
                    continue;
                };
                let mut x = Fix::new("ais", format!("{}", mmsi as u64), f.t, lat, lon);
                if let Some(v) = flag(&f.fields, "Position Accuracy") {
                    x.quality.insert("position_accuracy".into(), v.into());
                }
                if let Some(v) = flag(&f.fields, "RAIM") {
                    x.quality.insert("raim".into(), v.into());
                }
                x.extra.insert(
                    "msg_type".into(),
                    (if f.pgn == 129038 { 1 } else { 18 }).into(),
                );
                if let Some(v) = num(&f.fields, "SOG") {
                    x.extra.insert(
                        "sog_kn".into(),
                        super::round_to(v * 1.943_844_492, 10.0).into(),
                    );
                }
                if let Some(v) = num(&f.fields, "COG") {
                    x.extra.insert("cog_deg".into(), v.into());
                }
                d.fixes.push(x);
            }
            129539 | 129540 | 129026 => {}
            _ => d.other += 1,
        }
    }
    Ok(d)
}

/// The vessel's own receiver as a timeline (see the module notes).
pub fn timeline(text: &str) -> Result<Timeline, String> {
    let (frames, bad) = frames(text)?;
    let mut epochs = Vec::new();
    let mut vdop: Option<(f64, f64)> = None;
    let mut sats: Option<(f64, Vec<SatCn0>, Vec<SatSky>)> = None;
    let mut first = None;
    let mut skipped = bad;
    for f in &frames {
        match f.pgn {
            129539 => {
                if let (Some(t), Some(v)) = (f.t, num(&f.fields, "VDOP")) {
                    vdop = Some((t, v));
                }
            }
            129540 => {
                let Some(t) = f.t else { continue };
                let mut cn0 = Vec::new();
                let mut sky = Vec::new();
                for s in f
                    .fields
                    .get("list")
                    .and_then(Value::as_array)
                    .into_iter()
                    .flatten()
                {
                    let Some(m) = s.as_object() else { continue };
                    let Some(sat) = num(m, "PRN").and_then(|p| super::sat_of_nmea_prn(p as u32))
                    else {
                        continue;
                    };
                    let snr = num(m, "SNR").filter(|v| *v > 0.0);
                    if let Some(snr) = snr {
                        cn0.push(SatCn0 {
                            sat: sat.clone(),
                            band: "L1".into(),
                            cn0_dbhz: snr,
                        });
                    }
                    if let (Some(e), Some(a)) = (num(m, "Elevation"), num(m, "Azimuth")) {
                        sky.push(SatSky {
                            sat,
                            elev_deg: e,
                            azim_deg: a.rem_euclid(360.0),
                            tracked: snr.is_some(),
                        });
                    }
                }
                sats = Some((t, cn0, sky));
            }
            129029 => {
                let Some(x) = gnss_fix(f) else {
                    skipped += 1;
                    continue;
                };
                let Some(t) = x.t_unix_s else {
                    skipped += 1;
                    continue;
                };
                let t0 = *first.get_or_insert(t);
                let ft = f.t.unwrap_or(t);
                let recent = |at: f64| ft - at <= 2.0 && ft >= at;
                let n_used = num(&f.fields, "Number of SVs").map(|v| v as u32);
                let (cn0, sky) = match &sats {
                    Some((at, c, s)) if recent(*at) => (c.clone(), s.clone()),
                    _ => (Vec::new(), Vec::new()),
                };
                let hdop = num(&f.fields, "HDOP");
                let pdop = num(&f.fields, "PDOP");
                let v = vdop.filter(|(at, _)| recent(*at)).map(|(_, v)| v);
                epochs.push(LogEpoch {
                    t_s: t - t0,
                    time_label: Some(super::iso(t)),
                    cn0,
                    fix: Some(ReportedFix {
                        lat_deg: x.lat_deg,
                        lon_deg: x.lon_deg,
                        height_m: x.alt_m.unwrap_or(0.0),
                        n_used,
                    }),
                    sky,
                    reported_dop: (hdop.is_some() || pdop.is_some() || v.is_some()).then_some(
                        ReportedDop {
                            pdop,
                            hdop,
                            vdop: v,
                            n_used: n_used.unwrap_or(0),
                        },
                    ),
                    ..LogEpoch::default()
                });
            }
            _ => {}
        }
    }
    Ok(crate::receiver_trust::ingest::timeline_from(
        epochs, skipped,
    ))
}

#[cfg(test)]
mod tests {
    use super::*;

    const LOG: &str = r#"{"timestamp":"2026-03-01T10:00:00.000Z","prio":3,"src":7,"dst":255,"pgn":129540,"description":"GNSS Sats in View","fields":{"SID":1,"Sats in View":2,"list":[{"PRN":5,"Elevation":45.0,"Azimuth":120.0,"SNR":42.0,"Status":"Used"},{"PRN":12,"Elevation":20.0,"Azimuth":300.0,"SNR":35.5,"Status":"Used"}]}}
{"timestamp":"2026-03-01T10:00:00.100Z","prio":3,"src":7,"dst":255,"pgn":129539,"description":"GNSS DOPs","fields":{"SID":1,"HDOP":0.9,"VDOP":1.4,"TDOP":1.0}}
{"timestamp":"2026-03-01T10:00:00.200Z","prio":3,"src":7,"dst":255,"pgn":129029,"description":"GNSS Position Data","fields":{"SID":1,"Date":"2026.03.01","Time":"10:00:00.00000","Latitude":59.4372,"Longitude":24.7536,"Altitude":31.2,"GNSS type":"GPS+GLONASS","Method":"GNSS fix","Integrity":"Safe","Number of SVs":9,"HDOP":0.9,"PDOP":1.6}}
{"timestamp":"2026-03-01T10:00:00.300Z","prio":4,"src":40,"dst":255,"pgn":129038,"description":"AIS Class A Position Report","fields":{"Message ID":1,"User ID":276000001,"Longitude":24.70,"Latitude":59.45,"Position Accuracy":"Low","RAIM":"in use","SOG":5.14,"COG":87.0}}
{"timestamp":"2026-03-01T10:00:01.200Z","prio":3,"src":7,"dst":255,"pgn":129029,"description":"GNSS Position Data","fields":{"SID":2,"Date":"2026.03.01","Time":"10:00:01.00000","Latitude":59.4373,"Longitude":24.7537,"Altitude":31.0,"Method":"GNSS fix","Integrity":"Caution","Number of SVs":7,"HDOP":2.5,"PDOP":3.1}}
"#;

    #[test]
    fn fixes_and_ais_targets() {
        let d = decode(LOG).unwrap();
        assert_eq!(d.fixes.len(), 3);
        assert_eq!(d.fixes[0].reported_quality, Quality::Good);
        assert_eq!(d.fixes[0].quality["satellites"], 9.0);
        assert_eq!(d.fixes[0].t_unix_s, Some(1_772_359_200.0));
        assert_eq!(d.fixes[1].source, "ais");
        assert_eq!(d.fixes[1].quality["position_accuracy"], 0);
        assert_eq!(d.fixes[1].quality["raim"], 1);
        assert_eq!(d.fixes[1].extra["sog_kn"], 10.0);
        assert_eq!(d.fixes[2].reported_quality, Quality::Degraded);
    }

    #[test]
    fn the_receiver_timeline_carries_snr_and_dop() {
        let tl = timeline(LOG).unwrap();
        assert_eq!(tl.epochs.len(), 2);
        let e = &tl.epochs[0];
        assert_eq!(e.cn0.len(), 2);
        assert_eq!(e.cn0[0].sat, "G05");
        assert_eq!(e.reported_dop.unwrap().vdop, Some(1.4));
        assert_eq!(e.fix.unwrap().n_used, Some(9));
        assert_eq!(tl.epochs[1].t_s, 1.0);
        // The 129540 is 1.2 s old at the second epoch: still within the two seconds.
        assert_eq!(tl.epochs[1].cn0.len(), 2);
        assert_eq!(tl.observables, ["cn0", "fix"]);
    }
}
