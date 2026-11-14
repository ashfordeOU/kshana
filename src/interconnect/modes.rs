// SPDX-License-Identifier: AGPL-3.0-only
//! Mode S extended squitter (ADS-B) from the Beast binary format and from AVR hex lines, with NIC and
//! NACp (roadmap 0.42 I1).
//!
//! Framing:
//!
//! * **Beast** (as dump1090, readsb and most receivers serve it on port 30005): `0x1A`, a type
//!   (`'1'` Mode A/C, `'2'` Mode S short, `'3'` Mode S long, `'4'` status), a 48-bit counter of a
//!   12 MHz clock, a signal level octet, then the message; a `0x1A` inside is doubled. The time of a
//!   message is `start=` (the Unix time of the first message) plus the counter's advance at 12 MHz;
//!   without `start=`, fixes carry no time.
//! * **AVR**: one message per line in hex, `*8D4840D6...;`, or `@` and a 12-digit hex counter before
//!   it (also 12 MHz).
//!
//! Decoding follows the public descriptions of DO-260 messages in *The 1090 Megahertz Riddle* (Junzi
//! Sun, TU Delft, 2nd edition): the CRC-24 (generator `0x1FFF409`) must leave no remainder (DF 17 and
//! DF 18; other formats are counted and stepped over); type codes 1–4 give the identification, 9–18 and
//! 20–22 the airborne position (compact position reporting, decoded globally from an even and an odd
//! message at most 10 s apart, then locally from the aircraft's last position), 29 the target state and
//! NACp, 31 the operational status: ADS-B version, NIC supplement A (C for surface) and NACp.
//!
//! The NIC of a position follows its type code and the supplements, per version (DO-260A for version
//! 1, DO-260B for version 2). Version 0 sends no NIC (its type code is a NUCp) and an aircraft whose
//! version is not yet known (no operational status heard) gets no NIC, so a NIC is never guessed.
//! Surface positions (type codes 5–8) are counted and not decoded.

use std::collections::HashMap;

use super::{Decoded, Fix, Options, Quality};
use crate::portable_math::PortableFloat;

/// The CRC-24 remainder of a Mode S message (zero for an intact DF 17 or DF 18).
pub fn crc24(msg: &[u8]) -> u32 {
    let mut crc: u32 = 0;
    for &b in msg {
        crc ^= u32::from(b) << 16;
        for _ in 0..8 {
            crc <<= 1;
            if crc & 0x100_0000 != 0 {
                crc ^= 0x1FF_F409;
            }
        }
    }
    crc & 0xFF_FFFF
}

/// The number of longitude zones at a latitude (`NZ` = 15).
pub fn nl(lat: f64) -> f64 {
    let a = lat.abs();
    if a < 1e-9 {
        return 59.0;
    }
    if (a - 87.0).abs() < 1e-9 {
        return 2.0;
    }
    if a > 87.0 {
        return 1.0;
    }
    let nz = 15.0;
    let pi = std::f64::consts::PI;
    let c = (pi / 180.0 * a).pcos();
    let x = 1.0 - (1.0 - (pi / (2.0 * nz)).pcos()) / (c * c);
    (2.0 * pi / x.pacos()).floor()
}

fn modulo(x: f64, y: f64) -> f64 {
    x - y * (x / y).floor()
}

/// Global decoding of an even and an odd frame (CPR values as fractions of 2^17); `odd_newer` picks the
/// latitude zone of the newer frame. `None` when the two straddle a zone boundary.
pub fn cpr_global(even: (f64, f64), odd: (f64, f64), odd_newer: bool) -> Option<(f64, f64)> {
    let (dlat_e, dlat_o) = (360.0 / 60.0, 360.0 / 59.0);
    let j = (59.0 * even.0 - 60.0 * odd.0 + 0.5).floor();
    let mut lat_e = dlat_e * (modulo(j, 60.0) + even.0);
    let mut lat_o = dlat_o * (modulo(j, 59.0) + odd.0);
    if lat_e >= 270.0 {
        lat_e -= 360.0;
    }
    if lat_o >= 270.0 {
        lat_o -= 360.0;
    }
    if nl(lat_e) != nl(lat_o) {
        return None;
    }
    let (lat, i, cpr_lon) = if odd_newer {
        (lat_o, 1.0, odd.1)
    } else {
        (lat_e, 0.0, even.1)
    };
    let nl_lat = nl(lat);
    let ni = (nl_lat - i).max(1.0);
    let m = (even.1 * (nl_lat - 1.0) - odd.1 * nl_lat + 0.5).floor();
    let mut lon = 360.0 / ni * (modulo(m, ni) + cpr_lon);
    if lon >= 180.0 {
        lon -= 360.0;
    }
    Some((lat, lon))
}

/// Local decoding of one frame (`odd`) against a reference position within 180 NM.
pub fn cpr_local(cpr: (f64, f64), odd: bool, reference: (f64, f64)) -> (f64, f64) {
    let i = if odd { 1.0 } else { 0.0 };
    let dlat = 360.0 / (60.0 - i);
    let j = (reference.0 / dlat).floor() + (0.5 + modulo(reference.0, dlat) / dlat - cpr.0).floor();
    let lat = dlat * (j + cpr.0);
    let ni = (nl(lat) - i).max(1.0);
    let dlon = 360.0 / ni;
    let m = (reference.1 / dlon).floor() + (0.5 + modulo(reference.1, dlon) / dlon - cpr.1).floor();
    let mut lon = dlon * (m + cpr.1);
    if lon >= 180.0 {
        lon -= 360.0;
    }
    (lat, lon)
}

/// The NIC of an airborne position, from its type code, the ADS-B version and the supplements
/// (`nic_a` from the operational status, `nic_b` from the position message, version 2 only).
pub fn nic(tc: u8, version: u8, nic_a: Option<u8>, nic_b: u8) -> Option<u8> {
    if version == 0 {
        return None;
    }
    let a = nic_a?;
    Some(match tc {
        9 | 20 => 11,
        10 | 21 => 10,
        11 => match (version, a, nic_b) {
            (1, 1, _) | (_, 1, 1) => 9,
            (1, 0, _) | (_, 0, 0) => 8,
            _ => return None,
        },
        12 => 7,
        13 => 6,
        14 => 5,
        15 => 4,
        16 => match (version, a, nic_b) {
            (1, 1, _) | (_, 1, 1) => 3,
            (1, 0, _) | (_, 0, 0) => 2,
            _ => return None,
        },
        17 => 1,
        18 | 22 => 0,
        _ => return None,
    })
}

#[derive(Default)]
struct Aircraft {
    even: Option<(f64, f64, f64)>,
    odd: Option<(f64, f64, f64)>,
    last: Option<(f64, f64, f64)>,
    version: Option<u8>,
    nic_a: Option<u8>,
    nacp: Option<u8>,
    callsign: Option<String>,
}

/// Decodes Mode S messages, keeping per-aircraft state.
#[derive(Default)]
pub struct Decoder {
    aircraft: HashMap<u32, Aircraft>,
    /// What has been decoded.
    pub out: Decoded,
}

const CHARS: &[u8; 64] = b"#ABCDEFGHIJKLMNOPQRSTUVWXYZ##### ###############0123456789######";

fn bits(me: u64, from: u32, n: u32) -> u64 {
    // ME bits are numbered 1..=56 from the most significant.
    (me >> (56 - (from - 1) - n)) & ((1 << n) - 1)
}

impl Decoder {
    /// Decode one message. `t` is the receive time in seconds (absolute when known; only differences are
    /// used for pairing), `abs` whether it is a Unix time.
    pub fn message(&mut self, msg: &[u8], t: f64, abs: bool) {
        self.out.read += 1;
        if msg.len() != 14 {
            self.out.other += 1;
            return;
        }
        let df = msg[0] >> 3;
        if df != 17 && df != 18 {
            self.out.other += 1;
            return;
        }
        if crc24(msg) != 0 {
            self.out.bad_checksum += 1;
            return;
        }
        let icao = (u32::from(msg[1]) << 16) | (u32::from(msg[2]) << 8) | u32::from(msg[3]);
        let me = msg[4..11]
            .iter()
            .fold(0u64, |a, &b| (a << 8) | u64::from(b));
        let tc = bits(me, 1, 5) as u8;
        let ac = self.aircraft.entry(icao).or_default();
        match tc {
            1..=4 => {
                let cs: String = (0..8)
                    .map(|k| char::from(CHARS[bits(me, 9 + 6 * k, 6) as usize]))
                    .collect::<String>()
                    .trim_end_matches(['#', ' '])
                    .to_string();
                if ac.callsign.as_deref() != Some(cs.as_str()) {
                    self.out.records.push(serde_json::json!({
                        "kind": "identification",
                        "source": "adsb",
                        "id": format!("{icao:06X}"),
                        "callsign": cs,
                    }));
                    ac.callsign = Some(cs);
                }
            }
            9..=18 | 20..=22 => {
                let alt12 = bits(me, 9, 12);
                let alt_ft = if tc <= 18 {
                    if alt12 >> 4 & 1 == 1 {
                        let n = ((alt12 & 0xFE0) >> 1) | (alt12 & 0xF);
                        Some(n as f64 * 25.0 - 1000.0)
                    } else {
                        None
                    }
                } else {
                    None
                };
                let gnss_h_m = (tc >= 20).then_some(alt12 as f64);
                let odd = bits(me, 22, 1) == 1;
                let cpr = (
                    bits(me, 23, 17) as f64 / 131_072.0,
                    bits(me, 40, 17) as f64 / 131_072.0,
                );
                if odd {
                    ac.odd = Some((cpr.0, cpr.1, t));
                } else {
                    ac.even = Some((cpr.0, cpr.1, t));
                }
                let mut pos = None;
                if let (Some(e), Some(o)) = (ac.even, ac.odd) {
                    if (e.2 - o.2).abs() <= 10.0 {
                        pos = cpr_global((e.0, e.1), (o.0, o.1), odd);
                    }
                }
                if pos.is_none() {
                    if let Some(l) = ac.last.filter(|l| t - l.2 <= 60.0) {
                        pos = Some(cpr_local(cpr, odd, (l.0, l.1)));
                    }
                }
                let Some((lat, lon)) = pos else {
                    return;
                };
                if lat.abs() > 90.0 {
                    return;
                }
                ac.last = Some((lat, lon, t));
                let version = ac.version.unwrap_or(0);
                let nic_b = bits(me, 8, 1) as u8;
                let n = if ac.version.is_some() {
                    nic(tc, version, ac.nic_a, nic_b)
                } else {
                    None
                };
                let mut f = Fix::new("adsb", format!("{icao:06X}"), abs.then_some(t), lat, lon);
                if let Some(v) = n {
                    f.quality.insert("nic".into(), v.into());
                }
                if let Some(v) = ac.nacp {
                    f.quality.insert("nacp".into(), v.into());
                }
                if let Some(v) = ac.version {
                    f.quality.insert("version".into(), v.into());
                }
                f.quality.insert("type_code".into(), tc.into());
                f.reported_quality = Quality::of_adsb(n, ac.nacp);
                f.alt_m = alt_ft
                    .map(|a| super::round_to(a * 0.3048, 1e3))
                    .or(gnss_h_m);
                if let Some(a) = alt_ft {
                    f.extra.insert("alt_baro_ft".into(), a.into());
                }
                if let Some(c) = &ac.callsign {
                    f.extra.insert("callsign".into(), c.clone().into());
                }
                self.out.fixes.push(f);
            }
            29 => {
                // Target state and status, version 2 (subtype 1): NACp at ME bits 40–43.
                if bits(me, 6, 2) == 1 {
                    ac.nacp = Some(bits(me, 40, 4) as u8);
                }
            }
            31 => {
                let sub = bits(me, 6, 3);
                if sub <= 1 {
                    let v = bits(me, 41, 3) as u8;
                    ac.version = Some(v);
                    if v >= 1 {
                        ac.nic_a = Some(bits(me, 44, 1) as u8);
                        ac.nacp = Some(bits(me, 45, 4) as u8);
                    }
                }
            }
            5..=8 => self.out.other += 1,
            _ => self.out.other += 1,
        }
    }
}

/// Decode a Beast binary stream.
pub fn decode_beast(bytes: &[u8], opt: &Options) -> Decoded {
    let mut dec = Decoder::default();
    let mut i = 0;
    let mut first: Option<u64> = None;
    while i < bytes.len() {
        if bytes[i] != 0x1A {
            i += 1;
            continue;
        }
        let Some(&ty) = bytes.get(i + 1) else { break };
        let n = match ty {
            b'1' => 2,
            b'2' => 7,
            b'3' => 14,
            b'4' => 14,
            _ => {
                i += 1;
                continue;
            }
        };
        // Unescape the counter, the signal level and the message.
        let mut body = Vec::with_capacity(7 + n);
        let mut j = i + 2;
        while body.len() < 7 + n && j < bytes.len() {
            if bytes[j] == 0x1A {
                if bytes.get(j + 1) == Some(&0x1A) {
                    body.push(0x1A);
                    j += 2;
                    continue;
                }
                break;
            }
            body.push(bytes[j]);
            j += 1;
        }
        if body.len() < 7 + n {
            dec.out.malformed += 1;
            i = j;
            continue;
        }
        i = j;
        if ty != b'3' {
            if ty == b'2' || ty == b'1' {
                dec.out.read += 1;
                dec.out.other += 1;
            }
            continue;
        }
        let counter = body[..6].iter().fold(0u64, |a, &b| (a << 8) | u64::from(b));
        let c0 = *first.get_or_insert(counter);
        let rel = counter.wrapping_sub(c0) as f64 / 12e6;
        let (t, abs) = match opt.start_unix_s {
            Some(s) => (s + rel, true),
            None => (rel, false),
        };
        dec.message(&body[7..], t, abs);
    }
    dec.out
}

/// Decode AVR hex lines (`*...;` or `@<12 hex counter>...;`).
pub fn decode_avr(text: &str, opt: &Options) -> Decoded {
    let mut dec = Decoder::default();
    let mut first: Option<u64> = None;
    for (k, l) in text.lines().enumerate() {
        let l = l.trim();
        let (counter, hex) = if let Some(r) = l.strip_prefix('@') {
            let Some(c) = r.get(..12).and_then(|c| u64::from_str_radix(c, 16).ok()) else {
                dec.out.malformed += 1;
                continue;
            };
            (Some(c), &r[12..])
        } else if let Some(r) = l.strip_prefix('*') {
            (None, r)
        } else {
            continue;
        };
        let hex = hex.trim_end_matches(';');
        let Ok(msg) = hex::decode(hex) else {
            dec.out.malformed += 1;
            continue;
        };
        let rel = match counter {
            Some(c) => c.wrapping_sub(*first.get_or_insert(c)) as f64 / 12e6,
            // No counter: the line number stands for the order only.
            None => k as f64 * 1e-3,
        };
        let (t, abs) = match (opt.start_unix_s, counter) {
            (Some(s), Some(_)) => (s + rel, true),
            _ => (rel, false),
        };
        dec.message(&msg, t, abs);
    }
    dec.out
}

#[cfg(test)]
mod tests {
    use super::*;

    fn avr(lines: &[&str]) -> Decoded {
        let text: String = lines.iter().map(|l| format!("*{l};\n")).collect();
        decode_avr(&text, &Options::default())
    }

    #[test]
    fn published_examples_of_the_1090_megahertz_riddle() {
        // Identification: KLM1023 from 4840D6.
        let d = avr(&["8D4840D6202CC371C32CE0576098"]);
        assert_eq!(d.records[0]["callsign"], "KLM1023");
        // Airborne position, even then odd: 52.2572 N, 3.91937 E at 38 000 ft (the book's worked
        // example takes the even message as the newer one).
        let d = avr(&[
            "8D40621D58C386435CC412692AD6",
            "8D40621D58C382D690C8AC2863A7",
        ]);
        assert_eq!(d.bad_checksum, 0);
        let f = d.fixes.last().unwrap();
        assert!((f.lat_deg - 52.25720).abs() < 1e-4, "{}", f.lat_deg);
        assert!((f.lon_deg - 3.91937).abs() < 1e-4, "{}", f.lon_deg);
        assert_eq!(f.extra["alt_baro_ft"], 38000.0);
        // No operational status heard: no NIC is guessed.
        assert!(f.quality.get("nic").is_none());
    }

    #[test]
    fn a_damaged_message_fails_the_crc() {
        let d = avr(&["8D4840D6202CC371C32CE0576099"]);
        assert_eq!(d.bad_checksum, 1);
        assert!(d.records.is_empty());
    }

    #[test]
    fn zone_count_matches_its_transition_latitudes() {
        assert_eq!(nl(0.0), 59.0);
        assert_eq!(nl(10.47), 59.0);
        assert_eq!(nl(10.48), 58.0);
        assert_eq!(nl(52.2572), 36.0);
        assert_eq!(nl(86.6), 2.0);
        assert_eq!(nl(88.0), 1.0);
    }

    #[test]
    fn nic_by_version_and_supplements() {
        assert_eq!(nic(11, 2, Some(1), 1), Some(9));
        assert_eq!(nic(11, 2, Some(0), 0), Some(8));
        assert_eq!(nic(11, 2, Some(1), 0), None);
        assert_eq!(nic(11, 1, Some(1), 0), Some(9));
        assert_eq!(nic(16, 2, Some(0), 0), Some(2));
        assert_eq!(nic(9, 0, Some(1), 0), None);
        assert_eq!(nic(9, 2, None, 0), None);
        assert_eq!(nic(18, 2, Some(0), 0), Some(0));
    }
}
