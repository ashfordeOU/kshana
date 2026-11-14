// SPDX-License-Identifier: AGPL-3.0-only
//! AIS from NMEA 0183 `!AIVDM` / `!AIVDO` sentences (roadmap 0.42 I1).
//!
//! A sentence is `!xxVDM,<count>,<number>,<sequential id>,<channel>,<payload>,<fill bits>*hh`. The
//! checksum (XOR of the characters between `!` and `*`) is checked and a sentence that fails is
//! dropped and counted. A message spread over several sentences is reassembled by sequential id and
//! channel; fragments out of order or missing drop the message (counted as malformed). An NMEA 4 TAG
//! block before the sentence (`\c:1700000000*hh\!AIVDM,...`) is checked the same way and its `c:`
//! field (Unix seconds, or milliseconds when larger than 10^11) is the message's time. An IEC 61162-450
//! datagram header (`UdPbC` and a NUL) before the line is stepped over.
//!
//! Decoded message types, with the bit layouts of ITU-R M.1371 as the public gpsd "AIVDM/AIVDO
//! protocol decoding" notes describe them:
//!
//! * 1, 2, 3 (class A position), 4 (base station report), 18 (class B position) and 19 (class B
//!   extended position): a [`super::Fix`] when the position is available (latitude 91 and longitude
//!   181 mean "not available"). Trust attributes: `position_accuracy` (1: better than 10 m, a
//!   differential fix), `raim` (the RAIM flag) and, for 4 and 19, `epfd` (the fix device). AIS carries
//!   no integrity bound, so the class is always `unknown`.
//! * 5 (static and voyage data), 19 (its static part) and 24 (class B static data, parts A and B):
//!   a `static` record with the name, call sign, ship type, dimensions and fix device.
//!
//! Other message types are counted and stepped over.

use serde_json::{json, Map, Value};
use std::collections::HashMap;

use super::{Decoded, Fix};

/// The XOR checksum of the text between the start character and `*`, against the two hex digits after
/// it: `Some(true)` when they agree, `Some(false)` when not, `None` when there is no `*hh`.
pub fn checksum_ok(body_with_start: &str) -> Option<bool> {
    let star = body_with_start.rfind('*')?;
    let want = u8::from_str_radix(body_with_start.get(star + 1..star + 3)?, 16).ok()?;
    let got = body_with_start
        .get(1..star)?
        .bytes()
        .fold(0u8, |a, b| a ^ b);
    Some(got == want)
}

/// The 6-bit values of an armoured payload, or `None` for a character outside the armour.
pub fn dearmour(payload: &str) -> Option<Vec<u8>> {
    payload
        .bytes()
        .map(|c| {
            if !(48..=119).contains(&c) || (88..=95).contains(&c) {
                return None;
            }
            let v = c - 48;
            Some(if v > 40 { v - 8 } else { v })
        })
        .collect()
}

/// A payload's bits, most significant first.
pub struct Bits {
    six: Vec<u8>,
    len: usize,
}

impl Bits {
    /// From 6-bit values and the fill-bit count of the last sentence.
    pub fn new(six: Vec<u8>, fill: usize) -> Bits {
        let len = (six.len() * 6).saturating_sub(fill);
        Bits { six, len }
    }

    /// Number of bits.
    pub fn len(&self) -> usize {
        self.len
    }

    /// True when there are no bits.
    pub fn is_empty(&self) -> bool {
        self.len == 0
    }

    /// Unsigned bits `start..start + n` (n ≤ 64).
    pub fn u(&self, start: usize, n: usize) -> Option<u64> {
        if start + n > self.len {
            return None;
        }
        let mut v = 0u64;
        for i in start..start + n {
            let bit = (self.six[i / 6] >> (5 - i % 6)) & 1;
            v = (v << 1) | u64::from(bit);
        }
        Some(v)
    }

    /// Two's-complement signed bits.
    pub fn s(&self, start: usize, n: usize) -> Option<i64> {
        let v = self.u(start, n)? as i64;
        Some(if v >> (n - 1) & 1 == 1 {
            v - (1 << n)
        } else {
            v
        })
    }

    /// Six-bit text of `chars` characters, trailing `@` and spaces removed.
    pub fn text(&self, start: usize, chars: usize) -> Option<String> {
        let mut s = String::with_capacity(chars);
        for k in 0..chars {
            let c = self.u(start + 6 * k, 6)? as u8;
            s.push(char::from(if c < 32 { c + 64 } else { c }));
        }
        let t = s.trim_end_matches(['@', ' ']);
        Some(t.split('@').next().unwrap_or("").to_string())
    }
}

/// The Unix time of a TAG block's `c:` field (seconds, or milliseconds above 10^11).
fn tag_time(tag: &str) -> Option<f64> {
    let body = tag.split('*').next()?;
    body.split(',').find_map(|f| {
        let v = f.strip_prefix("c:")?.parse::<f64>().ok()?;
        Some(if v > 1e11 { v / 1000.0 } else { v })
    })
}

#[derive(Default)]
struct Pending {
    count: u32,
    next: u32,
    payload: String,
    t: Option<f64>,
}

/// Reassembles sentences into whole messages and decodes them.
#[derive(Default)]
pub struct Reader {
    pending: HashMap<(String, String), Pending>,
    /// What has been decoded so far.
    pub out: Decoded,
}

impl Reader {
    /// Read one line: an optional IEC 61162-450 header, an optional TAG block, the sentence.
    pub fn push_line(&mut self, raw: &str) {
        let mut line = raw.trim_matches(|c: char| c.is_whitespace() || c == '\0');
        if let Some(rest) = line.strip_prefix("UdPbC") {
            line = rest.trim_start_matches('\0');
        }
        let mut t = None;
        if let Some(rest) = line.strip_prefix('\\') {
            let Some(end) = rest.find('\\') else {
                self.out.malformed += 1;
                return;
            };
            let tag = &rest[..end];
            if checksum_ok(&format!("\\{tag}")) != Some(true) {
                self.out.bad_checksum += 1;
                return;
            }
            t = tag_time(tag);
            line = &rest[end + 1..];
        }
        if !line.starts_with('!') || line.len() < 7 || !matches!(&line[3..6], "VDM" | "VDO") {
            return;
        }
        self.out.read += 1;
        if checksum_ok(line) != Some(true) {
            self.out.bad_checksum += 1;
            return;
        }
        let body = &line[1..line.rfind('*').unwrap_or(line.len())];
        let f: Vec<&str> = body.split(',').collect();
        if f.len() < 7 {
            self.out.malformed += 1;
            return;
        }
        let own = &f[0][2..5] == "VDO";
        let (Ok(count), Ok(num)) = (f[1].parse::<u32>(), f[2].parse::<u32>()) else {
            self.out.malformed += 1;
            return;
        };
        let fill = f[6].parse::<usize>().unwrap_or(0);
        if count <= 1 {
            self.message(f[5], fill, t, own);
            return;
        }
        let key = (f[3].to_string(), f[4].to_string());
        if num == 1 {
            if self.pending.contains_key(&key) {
                self.out.malformed += 1;
            }
            self.pending.insert(
                key.clone(),
                Pending {
                    count,
                    next: 2,
                    payload: f[5].to_string(),
                    t,
                },
            );
            return;
        }
        let Some(p) = self.pending.get_mut(&key) else {
            self.out.malformed += 1;
            return;
        };
        if p.count != count || p.next != num {
            self.pending.remove(&key);
            self.out.malformed += 1;
            return;
        }
        p.payload.push_str(f[5]);
        p.next += 1;
        if num == count {
            if let Some(p) = self.pending.remove(&key) {
                self.message(&p.payload, fill, p.t.or(t), own);
            }
        }
    }

    fn message(&mut self, payload: &str, fill: usize, t: Option<f64>, own: bool) {
        let Some(six) = dearmour(payload) else {
            self.out.malformed += 1;
            return;
        };
        let b = Bits::new(six, fill);
        match decode_bits(&b, t, own) {
            Some(Decodedmsg::Fix(f)) => self.out.fixes.push(*f),
            Some(Decodedmsg::Record(r)) => self.out.records.push(r),
            Some(Decodedmsg::Both(f, r)) => {
                self.out.fixes.push(*f);
                self.out.records.push(r);
            }
            Some(Decodedmsg::Nothing) => {}
            Some(Decodedmsg::Other) => self.out.other += 1,
            None => self.out.malformed += 1,
        }
    }

    /// Finish: fragments still waiting count as malformed.
    pub fn finish(mut self) -> Decoded {
        self.out.malformed += self.pending.len();
        self.out
    }
}

/// Decode every line of a text.
pub fn decode_text(text: &str) -> Decoded {
    let mut r = Reader::default();
    for l in text.lines() {
        r.push_line(l);
    }
    r.finish()
}

enum Decodedmsg {
    Fix(Box<Fix>),
    Record(Value),
    Both(Box<Fix>, Value),
    /// A position report whose position is "not available".
    Nothing,
    Other,
}

fn dims(b: &Bits, at: usize) -> Option<Value> {
    Some(json!({
        "to_bow_m": b.u(at, 9)?,
        "to_stern_m": b.u(at + 9, 9)?,
        "to_port_m": b.u(at + 18, 6)?,
        "to_starboard_m": b.u(at + 24, 6)?,
    }))
}

/// The fix of a position report, from the offsets of its fields.
#[allow(clippy::too_many_arguments)]
fn position(
    b: &Bits,
    ty: u64,
    mmsi: u64,
    t: Option<f64>,
    acc_at: usize,
    lon_at: usize,
    raim_at: usize,
    sog_at: Option<usize>,
) -> Option<Option<Fix>> {
    let lon = b.s(lon_at, 28)?;
    let lat = b.s(lon_at + 28, 27)?;
    if lon == 181 * 600_000 || lat == 91 * 600_000 {
        return Some(None);
    }
    let (lat, lon) = (lat as f64 / 600_000.0, lon as f64 / 600_000.0);
    if lat.abs() > 90.0 || lon.abs() > 180.0 {
        return Some(None);
    }
    let mut f = Fix::new("ais", mmsi.to_string(), t, lat, lon);
    f.quality
        .insert("position_accuracy".into(), b.u(acc_at, 1)?.into());
    f.quality.insert("raim".into(), b.u(raim_at, 1)?.into());
    let mut e = Map::new();
    e.insert("msg_type".into(), ty.into());
    if let Some(at) = sog_at {
        let sog = b.u(at, 10)?;
        if sog != 1023 {
            e.insert("sog_kn".into(), (sog as f64 / 10.0).into());
        }
        let cog = b.u(lon_at + 55, 12)?;
        if cog < 3600 {
            e.insert("cog_deg".into(), (cog as f64 / 10.0).into());
        }
        let hdg = b.u(lon_at + 67, 9)?;
        if hdg < 360 {
            e.insert("heading_deg".into(), hdg.into());
        }
        e.insert("second".into(), b.u(lon_at + 76, 6)?.into());
    }
    f.extra = e;
    Some(Some(f))
}

fn decode_bits(b: &Bits, t: Option<f64>, own: bool) -> Option<Decodedmsg> {
    let ty = b.u(0, 6)?;
    let mmsi = b.u(8, 30)?;
    let wrap = |f: Option<Fix>, own: bool| match f {
        Some(mut f) => {
            if own {
                f.extra.insert("own_vessel".into(), true.into());
            }
            Decodedmsg::Fix(Box::new(f))
        }
        None => Decodedmsg::Nothing,
    };
    Some(match ty {
        1..=3 => {
            let mut f = position(b, ty, mmsi, t, 60, 61, 148, Some(50))?;
            if let Some(f) = f.as_mut() {
                f.extra.insert("nav_status".into(), b.u(38, 4)?.into());
            }
            wrap(f, own)
        }
        4 => {
            let mut f = position(b, ty, mmsi, t, 78, 79, 148, None)?;
            if let Some(f) = f.as_mut() {
                f.quality.insert("epfd".into(), b.u(134, 4)?.into());
                f.extra.insert(
                    "utc".into(),
                    format!(
                        "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}Z",
                        b.u(38, 14)?,
                        b.u(52, 4)?,
                        b.u(56, 5)?,
                        b.u(61, 5)?,
                        b.u(66, 6)?,
                        b.u(72, 6)?
                    )
                    .into(),
                );
            }
            wrap(f, own)
        }
        5 => {
            if b.len() < 420 {
                return None;
            }
            Decodedmsg::Record(json!({
                "kind": "static",
                "source": "ais",
                "msg_type": ty,
                "id": mmsi.to_string(),
                "ais_version": b.u(38, 2)?,
                "imo": b.u(40, 30)?,
                "callsign": b.text(70, 7)?,
                "name": b.text(112, 20)?,
                "ship_type": b.u(232, 8)?,
                "dimensions": dims(b, 240)?,
                "epfd": b.u(270, 4)?,
                "draught_m": b.u(294, 8)? as f64 / 10.0,
                "destination": b.text(302, 20)?,
            }))
        }
        18 => wrap(position(b, ty, mmsi, t, 56, 57, 147, Some(46))?, own),
        19 => {
            let mut f = position(b, ty, mmsi, t, 56, 57, 305, Some(46))?;
            let epfd = b.u(301, 4)?;
            if let Some(f) = f.as_mut() {
                f.quality.insert("epfd".into(), epfd.into());
            }
            let r = json!({
                "kind": "static",
                "source": "ais",
                "msg_type": ty,
                "id": mmsi.to_string(),
                "name": b.text(143, 20)?,
                "ship_type": b.u(263, 8)?,
                "dimensions": dims(b, 271)?,
                "epfd": epfd,
            });
            match wrap(f, own) {
                Decodedmsg::Fix(f) => Decodedmsg::Both(f, r),
                _ => Decodedmsg::Record(r),
            }
        }
        24 => {
            let part = b.u(38, 2)?;
            match part {
                0 => Decodedmsg::Record(json!({
                    "kind": "static",
                    "source": "ais",
                    "msg_type": ty,
                    "part": "A",
                    "id": mmsi.to_string(),
                    "name": b.text(40, 20)?,
                })),
                1 => {
                    let mut r = json!({
                        "kind": "static",
                        "source": "ais",
                        "msg_type": ty,
                        "part": "B",
                        "id": mmsi.to_string(),
                        "ship_type": b.u(40, 8)?,
                        "vendor_id": b.text(48, 3)?,
                        "callsign": b.text(90, 7)?,
                    });
                    // An auxiliary craft (MMSI 98xxxxxxx) gives its mother ship here instead of dimensions.
                    if (980_000_000..990_000_000).contains(&mmsi) {
                        r["mothership_mmsi"] = b.u(132, 30)?.into();
                    } else {
                        r["dimensions"] = dims(b, 132)?;
                    }
                    Decodedmsg::Record(r)
                }
                _ => return None,
            }
        }
        _ => Decodedmsg::Other,
    })
}

#[cfg(test)]
pub(crate) mod tests {
    use super::*;

    /// Test encoder: put `v` in `n` bits.
    pub(crate) fn put(b: &mut Vec<u8>, v: i64, n: usize) {
        for i in (0..n).rev() {
            b.push(((v >> i) & 1) as u8);
        }
    }

    /// Test encoder: armour bits (padded to a multiple of 6); returns the payload and the fill.
    pub(crate) fn armour(bits: &[u8]) -> (String, usize) {
        let fill = (6 - bits.len() % 6) % 6;
        let mut b = bits.to_vec();
        b.extend(std::iter::repeat_n(0, fill));
        let s = b
            .chunks(6)
            .map(|c| {
                let v = c.iter().fold(0u8, |a, &x| (a << 1) | x);
                char::from(if v < 40 { v + 48 } else { v + 56 })
            })
            .collect();
        (s, fill)
    }

    pub(crate) fn sentence(body: &str) -> String {
        let ck = body.bytes().fold(0u8, |a, b| a ^ b);
        format!("!{body}*{ck:02X}")
    }

    fn text6(b: &mut Vec<u8>, s: &str, n: usize) {
        for k in 0..n {
            let c = s.as_bytes().get(k).copied().unwrap_or(b'@');
            let v = if c >= 64 { c - 64 } else { c };
            put(b, i64::from(v), 6);
        }
    }

    pub(crate) fn type1(mmsi: i64, lat: f64, lon: f64, sog10: i64, acc: i64, raim: i64) -> Vec<u8> {
        let mut b = Vec::new();
        put(&mut b, 1, 6);
        put(&mut b, 0, 2);
        put(&mut b, mmsi, 30);
        put(&mut b, 5, 4);
        put(&mut b, -128, 8);
        put(&mut b, sog10, 10);
        put(&mut b, acc, 1);
        put(&mut b, (lon * 600_000.0).round() as i64, 28);
        put(&mut b, (lat * 600_000.0).round() as i64, 27);
        put(&mut b, 1234, 12);
        put(&mut b, 271, 9);
        put(&mut b, 42, 6);
        put(&mut b, 0, 2);
        put(&mut b, 0, 3);
        put(&mut b, raim, 1);
        put(&mut b, 0, 19);
        b
    }

    #[test]
    fn a_type_1_report_round_trips() {
        let (p, fill) = armour(&type1(244_123_456, 52.123456, -4.5, 123, 1, 1));
        let d = decode_text(&sentence(&format!("AIVDM,1,1,,A,{p},{fill}")));
        assert_eq!(d.fixes.len(), 1, "{d:?}");
        let f = &d.fixes[0];
        assert_eq!(f.id, "244123456");
        assert!((f.lat_deg - 52.123456).abs() < 2e-6 && (f.lon_deg + 4.5).abs() < 2e-6);
        assert_eq!(f.quality["position_accuracy"], 1);
        assert_eq!(f.quality["raim"], 1);
        assert_eq!(f.extra["sog_kn"], 12.3);
        assert_eq!(f.extra["cog_deg"], 123.4);
        assert_eq!(f.extra["heading_deg"], 271);
        assert_eq!(f.extra["nav_status"], 5);
    }

    #[test]
    fn a_type_5_over_two_sentences_round_trips_and_a_bad_checksum_is_dropped() {
        let mut b = Vec::new();
        put(&mut b, 5, 6);
        put(&mut b, 0, 2);
        put(&mut b, 351_759_000, 30);
        put(&mut b, 0, 2);
        put(&mut b, 9_134_270, 30);
        text6(&mut b, "3FOF8", 7);
        text6(&mut b, "EVER DIADEM", 20);
        put(&mut b, 70, 8);
        put(&mut b, 225, 9);
        put(&mut b, 70, 9);
        put(&mut b, 1, 6);
        put(&mut b, 31, 6);
        put(&mut b, 1, 4);
        put(&mut b, 5, 4);
        put(&mut b, 15, 5);
        put(&mut b, 14, 5);
        put(&mut b, 0, 6);
        put(&mut b, 122, 8);
        text6(&mut b, "NEW YORK", 20);
        put(&mut b, 0, 2);
        assert_eq!(b.len(), 424);
        let (p, fill) = armour(&b);
        let (a, c) = p.split_at(60);
        let s1 = sentence(&format!("AIVDM,2,1,3,B,{a},0"));
        let s2 = sentence(&format!("AIVDM,2,2,3,B,{c},{fill}"));
        let d = decode_text(&format!("{s1}\n{s2}\n"));
        assert_eq!(d.records.len(), 1, "{d:?}");
        let r = &d.records[0];
        assert_eq!(r["name"], "EVER DIADEM");
        assert_eq!(r["callsign"], "3FOF8");
        assert_eq!(r["destination"], "NEW YORK");
        assert_eq!(r["dimensions"]["to_bow_m"], 225);
        assert_eq!(r["draught_m"], 12.2);
        let bad = s2.replace("AIVDM,2,2", "AIVDM,2,2,");
        let d = decode_text(&format!("{s1}\n{bad}\n"));
        assert_eq!(d.bad_checksum, 1);
        assert_eq!(d.malformed, 1); // the first fragment is left waiting
    }

    #[test]
    fn tag_time_and_the_61162_450_header() {
        let (p, fill) = armour(&type1(1, 10.0, 20.0, 50, 0, 0));
        let s = sentence(&format!("AIVDM,1,1,,A,{p},{fill}"));
        let tag = "c:1700000000123";
        let ck = tag.bytes().fold(0u8, |a, b| a ^ b);
        let line = format!("UdPbC\0\\{tag}*{ck:02X}\\{s}");
        let d = decode_text(&line);
        assert_eq!(d.fixes[0].t_unix_s, Some(1_700_000_000.123));
        let badtag = format!("\\{tag}*00\\{s}");
        assert_eq!(decode_text(&badtag).bad_checksum, 1);
    }

    #[test]
    fn position_not_available_gives_no_fix() {
        let (p, fill) = armour(&type1(1, 91.0, 181.0, 1023, 0, 0));
        let d = decode_text(&sentence(&format!("AIVDM,1,1,,A,{p},{fill}")));
        assert!(d.fixes.is_empty());
        assert_eq!(d.malformed, 0);
    }
}
