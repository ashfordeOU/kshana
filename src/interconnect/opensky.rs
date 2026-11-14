// SPDX-License-Identifier: AGPL-3.0-only
//! OpenSky-style ADS-B state vectors, as JSON and as CSV (roadmap 0.42 I1).
//!
//! * **JSON**: the shape of the OpenSky REST API's `/states/all` answer, `{"time": ..., "states":
//!   [[icao24, callsign, origin_country, time_position, last_contact, longitude, latitude,
//!   baro_altitude, on_ground, velocity, true_track, vertical_rate, sensors, geo_altitude, squawk, spi,
//!   position_source, ...], ...]}`, one document, or several as JSON Lines (successive snapshots). A
//!   state becomes a fix at its `time_position` once per aircraft and time.
//! * **CSV**: the columns of the historical state-vector exports (`time`, `icao24`, `lat`, `lon`,
//!   `baroaltitude`, `geoaltitude`, `onground`, `lastposupdate`, `callsign`, ...), found by name. The
//!   time is `lastposupdate` when the file has it, else `time`.
//!
//! State vectors carry no NIC or NACp: the class is `unknown` unless the file adds `nic` and `nacp`
//! columns (CSV) or `nic` and `nacp` keys after the array (JSON objects in a `states_ext` array of the
//! same length), which some exports join from the operational-status tables. Aircraft on the ground and
//! states without a position are left out. Altitudes are metres; `alt_baro_ft` is the barometric
//! altitude in feet.
//!
//! This reads files in the layout only. Whether a given copy of OpenSky Network data may be used is a
//! matter of its own licence: Kshana's public interference observatory does not take OpenSky data
//! (`docs/data/INTERFERENCE-DATA-SOURCES.md`), and no OpenSky data is shipped with Kshana.

use serde_json::Value;
use std::collections::HashSet;

use super::{Decoded, Fix, Quality};

const FT: f64 = 0.3048;

#[allow(clippy::too_many_arguments)]
fn push(
    d: &mut Decoded,
    seen: &mut HashSet<(String, i64)>,
    icao: &str,
    t: f64,
    lat: f64,
    lon: f64,
    baro_m: Option<f64>,
    geo_m: Option<f64>,
    callsign: Option<&str>,
    source: Option<u64>,
    nic: Option<u8>,
    nacp: Option<u8>,
) {
    let id = icao.trim().to_ascii_uppercase();
    if !seen.insert((id.clone(), (t * 1000.0).round() as i64)) {
        return;
    }
    let mut f = Fix::new("adsb", id, Some(t), lat, lon);
    f.alt_m = geo_m.or(baro_m);
    if let Some(b) = baro_m {
        f.extra
            .insert("alt_baro_ft".into(), super::round_to(b / FT, 1.0).into());
    }
    if let Some(c) = callsign.map(str::trim).filter(|c| !c.is_empty()) {
        f.extra.insert("callsign".into(), c.into());
    }
    if let Some(s) = source {
        // 0 ADS-B, 1 ASTERIX, 2 MLAT, 3 FLARM.
        f.quality.insert("position_source".into(), s.into());
    }
    if let Some(v) = nic {
        f.quality.insert("nic".into(), v.into());
    }
    if let Some(v) = nacp {
        f.quality.insert("nacp".into(), v.into());
    }
    f.reported_quality = Quality::of_adsb(nic, nacp);
    d.fixes.push(f);
}

fn small(v: &Value) -> Option<u8> {
    v.as_u64().filter(|x| *x <= 15).map(|x| x as u8)
}

/// Decode OpenSky-style JSON (one document or JSON Lines).
pub fn decode_json(text: &str) -> Result<Decoded, String> {
    let mut d = Decoded::default();
    let mut seen = HashSet::new();
    // One document, JSON Lines, or documents one after another: a streaming parse reads them all.
    let mut docs: Vec<Value> = Vec::new();
    let mut stream = serde_json::Deserializer::from_str(text).into_iter::<Value>();
    loop {
        let at = stream.byte_offset();
        match stream.next() {
            None => break,
            Some(Ok(v)) => docs.push(v),
            Some(Err(e)) => {
                let line = text[..at].matches('\n').count() + 1;
                return Err(crate::terr!("e-interconnect-json", line = line, e = e));
            }
        }
    }
    for doc in &docs {
        let states = doc["states"].as_array().map(Vec::as_slice).unwrap_or(&[]);
        let ext = doc["states_ext"].as_array();
        for (k, s) in states.iter().enumerate() {
            d.read += 1;
            let Some(a) = s.as_array() else {
                d.malformed += 1;
                continue;
            };
            let g = |i: usize| a.get(i).unwrap_or(&Value::Null);
            let (Some(icao), Some(t), Some(lon), Some(lat)) =
                (g(0).as_str(), g(3).as_f64(), g(5).as_f64(), g(6).as_f64())
            else {
                d.other += 1;
                continue;
            };
            if g(8).as_bool() == Some(true) {
                d.other += 1;
                continue;
            }
            let e = ext.and_then(|e| e.get(k));
            push(
                &mut d,
                &mut seen,
                icao,
                t,
                lat,
                lon,
                g(7).as_f64(),
                g(13).as_f64(),
                g(1).as_str(),
                g(16).as_u64(),
                e.and_then(|e| small(&e["nic"])),
                e.and_then(|e| small(&e["nacp"])),
            );
        }
    }
    Ok(d)
}

/// Decode an OpenSky-style CSV of state vectors.
pub fn decode_csv(text: &str) -> Result<Decoded, String> {
    let mut d = Decoded::default();
    let mut seen = HashSet::new();
    let mut lines = text.lines().filter(|l| !l.trim().is_empty());
    let Some(head) = lines.next() else {
        return Ok(d);
    };
    let cols: Vec<String> = head
        .split(',')
        .map(|c| c.trim().trim_matches('"').to_ascii_lowercase())
        .collect();
    let at = |n: &str| cols.iter().position(|c| c == n);
    let (Some(ci), Some(clat), Some(clon)) = (at("icao24"), at("lat"), at("lon")) else {
        return Err(crate::terr!(
            "e-interconnect-columns",
            need = "icao24, lat, lon, time or lastposupdate"
        ));
    };
    let Some(ct) = at("lastposupdate").or(at("time")) else {
        return Err(crate::terr!(
            "e-interconnect-columns",
            need = "icao24, lat, lon, time or lastposupdate"
        ));
    };
    let (cb, cg, cg0, ccs) = (
        at("baroaltitude"),
        at("geoaltitude"),
        at("onground"),
        at("callsign"),
    );
    let (cnic, cnacp) = (at("nic"), at("nacp"));
    for l in lines {
        d.read += 1;
        let f: Vec<&str> = l.split(',').map(|c| c.trim().trim_matches('"')).collect();
        let num = |i: Option<usize>| i.and_then(|i| f.get(i)).and_then(|s| s.parse::<f64>().ok());
        let (Some(icao), Some(t), Some(lat), Some(lon)) =
            (f.get(ci), num(Some(ct)), num(Some(clat)), num(Some(clon)))
        else {
            d.other += 1;
            continue;
        };
        let ground = cg0
            .and_then(|i| f.get(i))
            .is_some_and(|s| matches!(s.to_ascii_lowercase().as_str(), "true" | "1"));
        if ground {
            d.other += 1;
            continue;
        }
        let small = |i: Option<usize>| num(i).filter(|v| (0.0..=15.0).contains(v)).map(|v| v as u8);
        push(
            &mut d,
            &mut seen,
            icao,
            t,
            lat,
            lon,
            num(cb),
            num(cg),
            ccs.and_then(|i| f.get(i)).copied(),
            None,
            small(cnic),
            small(cnacp),
        );
    }
    Ok(d)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn json_states_once_per_time_and_ground_left_out() {
        let doc = r#"{"time":1700000010,"states":[
 ["4ca7b4","RYR1AB  ","Ireland",1700000009,1700000010,-6.25,53.42,10668.0,false,230.1,90.0,0.0,null,10900.0,"1000",false,0],
 ["3c6444","DLH2AA  ","Germany",1700000008,1700000010,8.56,50.03,null,true,0.0,0.0,0.0,null,null,null,false,0],
 ["abcdef",null,"US",null,1700000010,null,null,null,false,null,null,null,null,null,null,false,0]]}
{"time":1700000011,"states":[["4ca7b4","RYR1AB  ","Ireland",1700000009,1700000011,-6.25,53.42,10668.0,false,230.1,90.0,0.0,null,10900.0,"1000",false,0]],
 "states_ext":[{"nic":8,"nacp":9}]}"#;
        let d = decode_json(doc).unwrap();
        assert_eq!(d.read, 4);
        assert_eq!(d.fixes.len(), 1);
        let f = &d.fixes[0];
        assert_eq!(f.id, "4CA7B4");
        assert_eq!(f.extra["alt_baro_ft"], 35000.0);
        assert_eq!(f.alt_m, Some(10900.0));
        assert_eq!(f.reported_quality, Quality::Unknown);
    }

    #[test]
    fn csv_by_column_name_with_nic_and_nacp() {
        let csv = "time,icao24,lat,lon,velocity,heading,vertrate,callsign,onground,alert,spi,squawk,baroaltitude,geoaltitude,lastposupdate,lastcontact,nic,nacp\n\
1700000010,4ca7b4,53.42,-6.25,230.1,90.0,0.0,RYR1AB,false,false,false,1000,10668.0,10900.0,1700000009.5,1700000010,8,9\n\
1700000010,4ca7b5,53.50,-6.20,230.1,90.0,0.0,RYR2AB,false,false,false,1000,10668.0,10900.0,1700000009.5,1700000010,5,6\n";
        let d = decode_csv(csv).unwrap();
        assert_eq!(d.fixes.len(), 2);
        assert_eq!(d.fixes[0].t_unix_s, Some(1_700_000_009.5));
        assert_eq!(d.fixes[0].reported_quality, Quality::Good);
        assert_eq!(d.fixes[1].reported_quality, Quality::Degraded);
        assert!(decode_csv("a,b\n1,2\n").is_err());
    }
}
