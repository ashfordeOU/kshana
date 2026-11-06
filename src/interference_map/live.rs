// SPDX-License-Identifier: AGPL-3.0-only
//! Live ADS-B and AIS feeds (roadmap L4c): `kshana interference-map record`.
//!
//! A local receiver's reports are written, as they arrive, into the CSV files that
//! `interference-map locate`, `adsb` and `ais` read (`docs/INTERFERENCE-MAP.md`), so a live run and
//! its replay read the same rows.
//!
//! * **ADS-B:** the `aircraft.json` that readsb, dump1090-fa and tar1090 write (`--write-json`):
//!   one snapshot of every aircraft heard. Each aircraft with a new position (`now - seen_pos`
//!   later than its last row) becomes one row: `timestamp, aircraft_id, lat, lon, alt_baro_ft, nic,
//!   nacp, source_type`. Aircraft on the ground (`alt_baro` = `"ground"`) and aircraft without a
//!   position are not written.
//! * **AIS:** `!AIVDM`/`!AIVDO` sentences, as AIS-catcher and other AIS receivers send them. The
//!   checksum is checked; position reports (message types 1, 2, 3, 18 and 19, in one sentence or in
//!   fragments) become rows `timestamp, vessel_id, lat, lon, sog_kn`. The time is the sentence's
//!   NMEA 4 TAG block `c:` field (Unix seconds or milliseconds) when it has one, otherwise the time
//!   the sentence arrived. The payload layout is the public one of ITU-R M.1371.
//!
//! The identifiers are written as received (ICAO hex, MMSI): the files stay on the operator's own
//! disk, and the readers that build maps and regions hash them with a random salt, as they do for
//! any other input. Nothing is sent anywhere.

use super::MapError;
use std::collections::HashMap;

/// The header of a recorded ADS-B file.
pub const ADSB_HEADER: &str = "timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type";
/// The header of a recorded AIS file.
pub const AIS_HEADER: &str = "timestamp,vessel_id,lat,lon,sog_kn";

/// Turns readsb `aircraft.json` snapshots into ADS-B rows, each new position once.
#[derive(Default)]
pub struct ReadsbFollower {
    last: HashMap<String, i64>,
}

impl ReadsbFollower {
    /// The rows for the aircraft in `json` whose position is newer than their last row.
    pub fn rows(&mut self, json: &str) -> Result<Vec<String>, MapError> {
        let v: serde_json::Value = serde_json::from_str(json).map_err(|e| {
            MapError::Format(crate::terr!("e-interference-map-live-readsb-json", e = e))
        })?;
        let now = v["now"].as_f64().ok_or_else(|| {
            MapError::Format(crate::terr!(
                "e-interference-map-live-readsb-json",
                e = "now"
            ))
        })?;
        let mut out = Vec::new();
        for a in v["aircraft"].as_array().map(Vec::as_slice).unwrap_or(&[]) {
            let (Some(hex), Some(lat), Some(lon), Some(alt), Some(seen)) = (
                a["hex"].as_str(),
                a["lat"].as_f64(),
                a["lon"].as_f64(),
                a["alt_baro"].as_f64(),
                a["seen_pos"].as_f64(),
            ) else {
                continue;
            };
            let t_ms = ((now - seen) * 1000.0).round() as i64;
            if self.last.get(hex).is_some_and(|&l| t_ms <= l) {
                continue;
            }
            self.last.insert(hex.to_string(), t_ms);
            let code = |k: &str| a[k].as_u64().map(|c| c.to_string()).unwrap_or_default();
            out.push(format!(
                "{}.{:03},{hex},{lat},{lon},{alt},{},{},{}",
                t_ms.div_euclid(1000),
                t_ms.rem_euclid(1000),
                code("nic"),
                code("nac_p"),
                a["type"].as_str().unwrap_or("")
            ));
        }
        Ok(out)
    }
}

/// A position report decoded from AIS.
#[derive(Clone, Debug, PartialEq)]
pub struct AisPosition {
    /// The message type (1, 2, 3, 18 or 19).
    pub msg_type: u8,
    /// The vessel's MMSI.
    pub mmsi: u32,
    /// Latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Speed over ground, knots (`None` when the report says it is not available).
    pub sog_kn: Option<f64>,
}

/// Unsigned bits `start..start + len` of a 6-bit payload's bit string.
fn bits(b: &[u8], start: usize, len: usize) -> Option<u64> {
    if start + len > b.len() * 6 {
        return None;
    }
    let mut v = 0u64;
    for i in start..start + len {
        v = (v << 1) | u64::from((b[i / 6] >> (5 - i % 6)) & 1);
    }
    Some(v)
}

/// Signed bits, two's complement.
fn sbits(b: &[u8], start: usize, len: usize) -> Option<i64> {
    let v = bits(b, start, len)? as i64;
    Some(if v >> (len - 1) & 1 == 1 {
        v - (1 << len)
    } else {
        v
    })
}

/// Decode an armoured AIS payload into its position report, if it is one.
pub fn decode_position(payload: &str) -> Option<AisPosition> {
    let six: Vec<u8> = payload
        .bytes()
        .map(|c| {
            let v = c.checked_sub(48)?;
            Some(if v > 40 { v - 8 } else { v })
        })
        .collect::<Option<_>>()?;
    if six.iter().any(|&v| v > 63) {
        return None;
    }
    let t = bits(&six, 0, 6)? as u8;
    let (sog_at, lon_at, lat_at) = match t {
        1..=3 => (50, 61, 89),
        18 | 19 => (46, 57, 85),
        _ => return None,
    };
    let mmsi = bits(&six, 8, 30)? as u32;
    let sog = bits(&six, sog_at, 10)?;
    let lon = sbits(&six, lon_at, 28)? as f64 / 600_000.0;
    let lat = sbits(&six, lat_at, 27)? as f64 / 600_000.0;
    // 181 degrees and 91 degrees mean "not available".
    if lon.abs() > 180.0 || lat.abs() > 90.0 {
        return None;
    }
    Some(AisPosition {
        msg_type: t,
        mmsi,
        lat_deg: lat,
        lon_deg: lon,
        sog_kn: (sog != 1023).then_some(sog as f64 / 10.0),
    })
}

/// Reassembles `!AIVDM` sentences (fragments included) and gives the position rows.
#[derive(Default)]
pub struct AisDecoder {
    frags: HashMap<(String, String), (usize, Vec<String>, f64)>,
    /// Sentences whose checksum did not check, or that did not parse.
    pub bad: u64,
}

/// The time in a TAG block's `c:` field, in seconds (milliseconds when the value is that large).
fn tag_time(tag: &str) -> Option<f64> {
    let body = tag.split('*').next()?;
    body.split(',').find_map(|f| {
        let v: f64 = f.strip_prefix("c:")?.parse().ok()?;
        Some(if v > 1e11 { v / 1000.0 } else { v })
    })
}

impl AisDecoder {
    /// Take one line; `arrived` is the Unix time it arrived. A completed position report gives a
    /// row of the AIS file.
    pub fn push(&mut self, line: &str, arrived: f64) -> Option<String> {
        let line = line.trim();
        let (tag, sentence) = match line.strip_prefix('\\') {
            Some(rest) => {
                let (tag, s) = rest.split_once('\\')?;
                (Some(tag), s)
            }
            None => (None, line),
        };
        let t = tag.and_then(tag_time).unwrap_or(arrived);
        let s = sentence.trim();
        if !(s.starts_with("!AIVDM") || s.starts_with("!AIVDO") || s.starts_with("!BSVDM")) {
            return None;
        }
        let Some((body, ck)) = s[1..].split_once('*') else {
            self.bad += 1;
            return None;
        };
        let want = u8::from_str_radix(ck.get(..2).unwrap_or(""), 16).ok();
        if want != Some(body.bytes().fold(0u8, |a, b| a ^ b)) {
            self.bad += 1;
            return None;
        }
        let f: Vec<&str> = body.split(',').collect();
        if f.len() < 7 {
            self.bad += 1;
            return None;
        }
        let (Ok(total), Ok(num)) = (f[1].parse::<usize>(), f[2].parse::<usize>()) else {
            self.bad += 1;
            return None;
        };
        let payload = if total <= 1 {
            f[5].to_string()
        } else {
            let key = (f[3].to_string(), f[4].to_string());
            if num == 1 {
                self.frags.insert(key.clone(), (total, Vec::new(), t));
            }
            let entry = self.frags.get_mut(&key)?;
            if entry.1.len() + 1 != num || entry.0 != total {
                self.frags.remove(&key);
                self.bad += 1;
                return None;
            }
            entry.1.push(f[5].to_string());
            if num < total {
                return None;
            }
            let (_, parts, t0) = self.frags.remove(&key)?;
            return self.row(&parts.concat(), t0);
        };
        self.row(&payload, t)
    }

    fn row(&mut self, payload: &str, t: f64) -> Option<String> {
        let p = decode_position(payload)?;
        Some(format!(
            "{t:.3},{},{:.6},{:.6},{}",
            p.mmsi,
            p.lat_deg,
            p.lon_deg,
            p.sog_kn.map(|s| format!("{s:.1}")).unwrap_or_default()
        ))
    }
}

/// Unix time now, in seconds.
fn unix_now() -> f64 {
    std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_secs_f64())
        .unwrap_or(0.0)
}

/// A line source: standard input, a TCP connection, UDP datagrams or a file.
fn open_lines(from: &str) -> Result<Box<dyn Iterator<Item = String> + Send>, MapError> {
    use std::io::BufRead;
    let io = |e: std::io::Error| MapError::Io(format!("{from}: {e}"));
    let lines = |r: Box<dyn std::io::Read + Send>| -> Box<dyn Iterator<Item = String> + Send> {
        Box::new(std::io::BufReader::new(r).lines().map_while(Result::ok))
    };
    if from == "-" {
        return Ok(lines(Box::new(std::io::stdin())));
    }
    if let Some(addr) = from.strip_prefix("tcp:") {
        return Ok(lines(Box::new(
            std::net::TcpStream::connect(addr).map_err(io)?,
        )));
    }
    if let Some(port) = from.strip_prefix("udp:") {
        // A bare port binds the loopback interface only; give an address to listen wider.
        let bind = if port.contains(':') {
            port.to_string()
        } else {
            format!("127.0.0.1:{port}")
        };
        let sock = std::net::UdpSocket::bind(&bind).map_err(io)?;
        let mut pending: std::collections::VecDeque<String> = Default::default();
        return Ok(Box::new(std::iter::from_fn(move || loop {
            if let Some(l) = pending.pop_front() {
                return Some(l);
            }
            let mut buf = [0u8; 65_536];
            let n = sock.recv(&mut buf).ok()?;
            pending.extend(
                String::from_utf8_lossy(&buf[..n])
                    .lines()
                    .map(str::to_string),
            );
        })));
    }
    Ok(lines(Box::new(std::fs::File::open(from).map_err(io)?)))
}

/// Usage text for `kshana interference-map record`.
pub fn record_usage() -> String {
    crate::t!("interference-map-live-record-usage")
}

/// `kshana interference-map record --source <adsb|ais> --from <...> --out <file.csv>
/// [--poll-s <s>] [--max-seconds <s>]`.
pub fn run_record(args: &[String]) -> Result<(), MapError> {
    super::cli::check_args(
        args,
        &["--source", "--from", "--out", "--poll-s", "--max-seconds"],
        &[],
        0,
    )?;
    let flag = |k: &str| super::cli::flag_value(args, k);
    let usage = || MapError::Format(record_usage());
    let source = flag("--source")?.ok_or_else(usage)?;
    let from = flag("--from")?.ok_or_else(usage)?;
    let out = flag("--out")?.ok_or_else(usage)?;
    let num = |k: &str| -> Result<Option<f64>, MapError> {
        flag(k)?
            .map(|v| {
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite() && *x > 0.0)
                    .ok_or_else(|| {
                        MapError::Format(crate::terr!(
                            "e-interference-map-live-positive",
                            name = k.to_string()
                        ))
                    })
            })
            .transpose()
    };
    let poll = num("--poll-s")?.unwrap_or(1.0);
    let max_s = num("--max-seconds")?;
    let header = match source {
        "adsb" => ADSB_HEADER,
        "ais" => AIS_HEADER,
        _ => return Err(usage()),
    };
    let file = std::fs::OpenOptions::new()
        .write(true)
        .create_new(true)
        .open(out)
        .map_err(|e| MapError::Io(format!("{out}: {e}")))?;
    let mut w = std::io::BufWriter::new(file);
    let write = |w: &mut std::io::BufWriter<std::fs::File>, rows: &[String]| {
        use std::io::Write;
        for r in rows {
            writeln!(w, "{r}")?;
        }
        w.flush()
    };
    let wio = |e: std::io::Error| MapError::Io(format!("{out}: {e}"));
    write(&mut w, &[header.to_string()]).map_err(wio)?;
    let start = std::time::Instant::now();
    let over = || max_s.is_some_and(|m| start.elapsed().as_secs_f64() >= m);
    let mut rows = 0u64;
    let mut bad = 0u64;
    let polled_file =
        source == "adsb" && from != "-" && !from.starts_with("tcp:") && !from.starts_with("udp:");
    if polled_file {
        // readsb rewrites aircraft.json in place (write and rename): read it every `poll` seconds.
        let mut f = ReadsbFollower::default();
        while !over() {
            if let Ok(text) = std::fs::read_to_string(from) {
                match f.rows(&text) {
                    Ok(r) => {
                        write(&mut w, &r).map_err(wio)?;
                        rows += r.len() as u64;
                    }
                    // A snapshot caught half-written is read again at the next poll.
                    Err(_) => bad += 1,
                }
            }
            if max_s.is_none() && !std::path::Path::new(from).exists() {
                break;
            }
            std::thread::sleep(std::time::Duration::from_secs_f64(poll));
        }
    } else if source == "adsb" {
        let mut f = ReadsbFollower::default();
        for line in open_lines(from)? {
            if line.trim().is_empty() {
                continue;
            }
            match f.rows(&line) {
                Ok(r) => {
                    write(&mut w, &r).map_err(wio)?;
                    rows += r.len() as u64;
                }
                Err(_) => bad += 1,
            }
            if over() {
                break;
            }
        }
    } else {
        let mut d = AisDecoder::default();
        for line in open_lines(from)? {
            if let Some(r) = d.push(&line, unix_now()) {
                write(&mut w, &[r]).map_err(wio)?;
                rows += 1;
            }
            if over() {
                break;
            }
        }
        bad = d.bad;
    }
    eprintln!(
        "{}",
        crate::t!(
            "interference-map-live-record-done",
            rows = rows,
            out = out.to_string(),
            bad = bad
        )
    );
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Armour a bit string as an AIS payload.
    fn armour(bits: &[u8]) -> String {
        bits.chunks(6)
            .map(|c| {
                let mut v = 0u8;
                for (i, &b) in c.iter().enumerate() {
                    v |= b << (5 - i);
                }
                (if v < 40 { v + 48 } else { v + 56 }) as char
            })
            .collect()
    }

    fn put(b: &mut Vec<u8>, v: i64, n: usize) {
        for i in (0..n).rev() {
            b.push(((v >> i) & 1) as u8);
        }
    }

    /// A self-written type 1 report.
    fn type1(mmsi: i64, lat: f64, lon: f64, sog: i64) -> String {
        let mut b = Vec::new();
        put(&mut b, 1, 6);
        put(&mut b, 0, 2);
        put(&mut b, mmsi, 30);
        put(&mut b, 0, 4);
        put(&mut b, 0, 8);
        put(&mut b, sog, 10);
        put(&mut b, 1, 1);
        put(&mut b, (lon * 600_000.0).round() as i64, 28);
        put(&mut b, (lat * 600_000.0).round() as i64, 27);
        let pad = 168 - b.len();
        put(&mut b, 0, pad);
        armour(&b)
    }

    fn sentence(body: &str) -> String {
        format!("!{body}*{:02X}", body.bytes().fold(0u8, |a, b| a ^ b))
    }

    #[test]
    fn a_type_1_report_round_trips() {
        let p = decode_position(&type1(230_123_456, 59.4375, -24.7536, 123)).unwrap();
        assert_eq!(p.msg_type, 1);
        assert_eq!(p.mmsi, 230_123_456);
        assert!((p.lat_deg - 59.4375).abs() < 1e-6 && (p.lon_deg + 24.7536).abs() < 1e-6);
        assert_eq!(p.sog_kn, Some(12.3));
    }

    #[test]
    fn a_published_example_decodes() {
        // The example payload of the public AIVDM/AIVDO protocol notes (gpsd), checked for its
        // message type and MMSI.
        let p = decode_position("177KQJ5000G?tO`K>RA1wUbN0TKH").unwrap();
        assert_eq!((p.msg_type, p.mmsi), (1, 477_553_000));
    }

    #[test]
    fn checksum_tag_time_and_fragments() {
        let mut d = AisDecoder::default();
        let s = sentence(&format!("AIVDM,1,1,,A,{},0", type1(1, 10.0, 20.0, 50)));
        let row = d.push(&format!("\\c:1700000000*00\\{s}"), 5.0).unwrap();
        assert!(
            row.starts_with("1700000000.000,1,10.000000,20.000000,5.0"),
            "{row}"
        );
        assert!(d.push(&s, 7.25).unwrap().starts_with("7.250,"));
        let bad = s.replace("AIVDM,1", "AIVDM,9");
        assert!(d.push(&bad, 0.0).is_none());
        assert_eq!(d.bad, 1);
        let p = type1(2, -33.9, 151.2, 1023);
        let (a, b) = p.split_at(10);
        assert!(d
            .push(&sentence(&format!("AIVDM,2,1,7,B,{a},0")), 1.0)
            .is_none());
        let row = d
            .push(&sentence(&format!("AIVDM,2,2,7,B,{b},0")), 2.0)
            .unwrap();
        assert_eq!(row, "1.000,2,-33.900000,151.200000,");
    }

    #[test]
    fn readsb_snapshots_give_each_new_position_once() {
        let mut f = ReadsbFollower::default();
        let snap = |now: f64, seen: f64| {
            format!(
                r#"{{"now":{now},"aircraft":[{{"hex":"4ca1f2","type":"adsb_icao","alt_baro":35000,"lat":59.1,"lon":24.2,"nic":8,"nac_p":9,"seen_pos":{seen}}},{{"hex":"abc123","alt_baro":"ground","lat":59.0,"lon":24.0,"seen_pos":0.1}},{{"hex":"def456","alt_baro":12000}}]}}"#
            )
        };
        let r = f.rows(&snap(1_700_000_001.0, 0.5)).unwrap();
        assert_eq!(r, ["1700000000.500,4ca1f2,59.1,24.2,35000,8,9,adsb_icao"]);
        // The same position seen again a second later is not a new row.
        assert!(f.rows(&snap(1_700_000_002.0, 1.5)).unwrap().is_empty());
        assert_eq!(f.rows(&snap(1_700_000_003.0, 0.2)).unwrap().len(), 1);
    }
}
