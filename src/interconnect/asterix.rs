// SPDX-License-Identifier: AGPL-3.0-only
//! EUROCONTROL ASTERIX CAT010 (surface movement), CAT048 (monoradar target reports) and CAT062 (system
//! tracks), with CAT021 through [`crate::asterix_cat021`] (roadmap 0.42 I1).
//!
//! A recording is a sequence of data blocks (`CAT`, a two-octet length, records). Each record starts
//! with its field specification; every item present is read or stepped over by the category's User
//! Application Profile, including the variable, repetitive, compound and explicit-length items, so that
//! one item not used here does not lose the rest of the block. The UAPs are those of CAT010 edition 1.1,
//! CAT048 edition 1.21 and CAT062 edition 1.18 (public EUROCONTROL specifications). No text of them is
//! reproduced beyond item numbers, field positions and scale factors.
//!
//! What is kept, per category:
//!
//! * CAT010: time of day (I010/140), position in WGS-84 (I010/041), or polar (I010/040) or Cartesian
//!   (I010/042) from the sensor given as `radar=`; target address (I010/220), track number (I010/161),
//!   flight level (I010/090). Trust attributes: detection type (I010/020 `TYP`) and the standard
//!   deviations of position (I010/500, metres).
//! * CAT048: time of day (I048/140), polar position (I048/040, else Cartesian I048/042) from the radar
//!   given as `radar=`, flight level (I048/090), address (I048/220), track number (I048/161). Trust
//!   attributes: detection type and simulated flag (I048/020), confirmed or tentative track (I048/170
//!   `CNF`), track quality (I048/210, standard deviations in metres and degrees).
//! * CAT062: time of track information (I062/070), WGS-84 position (I062/105), track number (I062/040),
//!   address (I062/380 `ADR`), measured flight level (I062/136), geometric altitude (I062/130). Trust
//!   attributes: track status (I062/080 `CNF`, `SIM`, and when present `CST`, coasting), estimated
//!   accuracies (I062/500 `APC` in metres, `APW` in degrees).
//! * CAT021: as [`crate::asterix_cat021`] (NIC and NACp, classed by [`super::Quality::of_adsb`]).
//!
//! A radar or surface sensor measures the position itself; its plots carry no integrity bound, so their
//! class is `unknown`. The polar conversion uses the slant range as the ground range less the height
//! difference (flat-Earth over the plot's range, from the flight level where there is one), then the
//! WGS-84 ellipsoid around the sensor: adequate for display, not for surveillance accuracy.

use super::{Decoded, Fix, Options, Quality};

/// How an item or a subfield is laid out.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Len {
    /// A fixed number of octets.
    Fixed(usize),
    /// One octet, extended while bit 1 is set.
    Fx,
    /// A repetition count octet, then that many items of the given size.
    Rep(usize),
    /// The first octet is the item's whole length.
    Explicit,
    /// A primary subfield (FX-extended), then the present subfields in order.
    Compound(&'static [Len]),
    /// Units of three octets, extended while bit 1 of a unit's last octet is set (I062/510).
    Ext3,
    /// A spare position of the UAP.
    Spare,
}

const RE: u16 = 1001;
const SP: u16 = 1002;
const F1: Len = Len::Fixed(1);
const F2: Len = Len::Fixed(2);
const F3: Len = Len::Fixed(3);
const F4: Len = Len::Fixed(4);
const F6: Len = Len::Fixed(6);
const F7: Len = Len::Fixed(7);
const F8: Len = Len::Fixed(8);
const X: (u16, Len) = (0, Len::Spare);

/// CAT010 edition 1.1.
pub const UAP010: [(u16, Len); 28] = [
    (10, F2),
    (0, F1),
    (20, Len::Fx),
    (140, F3),
    (41, F8),
    (40, F4),
    (42, F4),
    (200, F4),
    (202, F4),
    (161, F2),
    (170, Len::Fx),
    (60, F2),
    (220, F3),
    (245, F7),
    (250, Len::Rep(8)),
    (300, F1),
    (90, F2),
    (91, F2),
    (270, Len::Fx),
    (550, F1),
    (310, F1),
    (500, F4),
    (280, Len::Rep(2)),
    (131, F1),
    (210, F2),
    X,
    (RE, Len::Explicit),
    (SP, Len::Explicit),
];

/// CAT048 edition 1.21.
pub const UAP048: [(u16, Len); 28] = [
    (10, F2),
    (140, F3),
    (20, Len::Fx),
    (40, F4),
    (70, F2),
    (90, F2),
    (130, Len::Compound(&[F1, F1, F1, F1, F1, F1, F1])),
    (220, F3),
    (240, F6),
    (250, Len::Rep(8)),
    (161, F2),
    (42, F4),
    (200, F4),
    (170, Len::Fx),
    (210, F4),
    (30, Len::Fx),
    (80, F2),
    (100, F4),
    (110, F2),
    (120, Len::Compound(&[F2, Len::Rep(6)])),
    (230, F2),
    (260, F7),
    (55, F1),
    (50, F2),
    (65, F1),
    (60, F2),
    (SP, Len::Explicit),
    (RE, Len::Explicit),
];

const I062_380: [Len; 28] = [
    F3,
    F6,
    F2,
    F2,
    F2,
    F2,
    F2,
    Len::Fx,
    Len::Rep(15),
    F2,
    F2,
    F7,
    F2,
    F2,
    F2,
    F2,
    F2,
    F2,
    F1,
    F8,
    F1,
    F6,
    F2,
    F1,
    Len::Rep(8),
    F2,
    F2,
    F2,
];
const I062_290: [Len; 10] = [F1, F1, F1, F1, F2, F1, F1, F1, F1, F1];
const I062_295: [Len; 31] = [F1; 31];
const I062_390: [Len; 18] = [
    F2,
    F7,
    F4,
    F1,
    F4,
    F1,
    F4,
    F4,
    F3,
    F2,
    F2,
    Len::Rep(4),
    F6,
    F1,
    F7,
    F7,
    F2,
    F7,
];
const I062_110: [Len; 7] = [F1, F4, F6, F2, F2, F1, F1];
const I062_500: [Len; 8] = [F4, F2, F4, F1, F1, F2, F2, F1];
const I062_340: [Len; 6] = [F2, F4, F2, F2, F2, F1];

/// CAT062 edition 1.18.
pub const UAP062: [(u16, Len); 35] = [
    (10, F2),
    X,
    (15, F1),
    (70, F3),
    (105, F8),
    (100, F6),
    (185, F4),
    (210, F2),
    (60, F2),
    (245, F7),
    (380, Len::Compound(&I062_380)),
    (40, F2),
    (80, Len::Fx),
    (290, Len::Compound(&I062_290)),
    (200, F1),
    (295, Len::Compound(&I062_295)),
    (136, F2),
    (130, F2),
    (135, F2),
    (220, F2),
    (390, Len::Compound(&I062_390)),
    (270, Len::Fx),
    (300, F1),
    (110, Len::Compound(&I062_110)),
    (120, F2),
    (510, Len::Ext3),
    (500, Len::Compound(&I062_500)),
    (340, Len::Compound(&I062_340)),
    X,
    X,
    X,
    X,
    X,
    (RE, Len::Explicit),
    (SP, Len::Explicit),
];

/// A present subfield of a compound item: its index, offset and length.
pub type Subfield = (usize, usize, usize);
/// An item of a record: its number and its octets.
pub type Item<'a> = (u16, &'a [u8]);

fn fx_len(b: &[u8], at: usize) -> Option<usize> {
    let mut n = 0;
    loop {
        let o = *b.get(at + n)?;
        n += 1;
        if o & 1 == 0 {
            return Some(n);
        }
    }
}

/// The present subfields of a compound item at `at`: (subfield index, offset, length), and the item's length.
pub fn compound(b: &[u8], at: usize, subs: &[Len]) -> Option<(Vec<Subfield>, usize)> {
    let p = fx_len(b, at)?;
    let mut i = at + p;
    let mut out = Vec::new();
    for k in 0..p {
        let o = b[at + k];
        for bit in 0..7 {
            if o & (0x80 >> bit) == 0 {
                continue;
            }
            let idx = k * 7 + bit;
            let n = item_len(b, i, *subs.get(idx)?)?;
            out.push((idx, i, n));
            i += n;
        }
    }
    Some((out, i - at))
}

/// Length of the item at `at`.
pub fn item_len(b: &[u8], at: usize, len: Len) -> Option<usize> {
    Some(match len {
        Len::Fixed(n) => n,
        Len::Fx => fx_len(b, at)?,
        Len::Rep(n) => 1 + n * usize::from(*b.get(at)?),
        Len::Explicit => {
            let n = usize::from(*b.get(at)?);
            if n == 0 {
                return None;
            }
            n
        }
        Len::Compound(subs) => compound(b, at, subs)?.1,
        Len::Ext3 => {
            let mut n = 0;
            loop {
                let o = *b.get(at + n + 2)?;
                n += 3;
                if o & 1 == 0 {
                    break n;
                }
            }
        }
        Len::Spare => return None,
    })
}

/// One record's items: (item number, the item's octets).
pub fn record<'a>(b: &'a [u8], at: usize, uap: &[(u16, Len)]) -> Option<(Vec<Item<'a>>, usize)> {
    let fspec = fx_len(b, at)?;
    let mut i = at + fspec;
    let mut items = Vec::new();
    for k in 0..fspec {
        let o = b[at + k];
        for bit in 0..7 {
            if o & (0x80 >> bit) == 0 {
                continue;
            }
            let (item, len) = *uap.get(k * 7 + bit)?;
            let n = item_len(b, i, len)?;
            items.push((item, b.get(i..i + n)?));
            i += n;
        }
    }
    Some((items, i - at))
}

fn be(b: &[u8]) -> u64 {
    b.iter().fold(0u64, |a, &x| (a << 8) | u64::from(x))
}

fn signed(v: u64, bits: u32) -> i64 {
    let v = v as i64;
    if v >> (bits - 1) & 1 == 1 {
        v - (1i64 << bits)
    } else {
        v
    }
}

/// Latitude, longitude and height of a point east, north and up of the sensor (metres), on WGS-84.
pub fn from_enu(radar: (f64, f64, f64), e: f64, n: f64, u: f64) -> (f64, f64, f64) {
    use crate::frames::{ecef_to_geodetic, geodetic_to_ecef, Geodetic};
    use crate::portable_math::PortableFloat;
    let (lat, lon) = (radar.0.to_radians(), radar.1.to_radians());
    let o = geodetic_to_ecef(Geodetic {
        lat_rad: lat,
        lon_rad: lon,
        alt_m: radar.2,
    });
    let (sp, cp) = lat.psin_cos();
    let (sl, cl) = lon.psin_cos();
    let d = [
        -sl * e - sp * cl * n + cp * cl * u,
        cl * e - sp * sl * n + cp * sl * u,
        cp * n + sp * u,
    ];
    let g = ecef_to_geodetic([o[0] + d[0], o[1] + d[1], o[2] + d[2]]);
    (g.lat_rad.to_degrees(), g.lon_rad.to_degrees(), g.alt_m)
}

/// A polar plot (slant range in metres, azimuth in degrees) around the sensor, at a target height when known.
pub fn from_polar(
    radar: (f64, f64, f64),
    range_m: f64,
    azimuth_deg: f64,
    height_m: Option<f64>,
) -> (f64, f64) {
    use crate::portable_math::PortableFloat;
    let dh = height_m.map_or(0.0, |h| h - radar.2);
    let ground = (range_m * range_m - dh * dh).max(0.0).sqrt();
    let (s, c) = azimuth_deg.to_radians().psin_cos();
    let (lat, lon, _) = from_enu(radar, ground * s, ground * c, 0.0);
    (lat, lon)
}

const NM: f64 = 1852.0;
const FT: f64 = 0.3048;

fn fl(v: &[u8]) -> f64 {
    signed(be(v) & 0x3FFF, 14) as f64 / 4.0
}

fn typ010(t: u64) -> &'static str {
    [
        "ssr-multilateration",
        "mode-s-multilateration",
        "ads-b",
        "psr",
        "magnetic-loop",
        "hf-multilateration",
        "not-defined",
        "other",
    ][t as usize & 7]
}

fn typ048(t: u64) -> &'static str {
    [
        "no-detection",
        "single-psr",
        "single-ssr",
        "ssr-psr",
        "mode-s-all-call",
        "mode-s-roll-call",
        "mode-s-all-call-psr",
        "mode-s-roll-call-psr",
    ][t as usize & 7]
}

/// One target report of CAT010, CAT048 or CAT062.
fn report(cat: u8, items: &[(u16, &[u8])], opt: &Options, d: &mut Decoded) {
    let get = |n: u16| items.iter().find(|(i, _)| *i == n).map(|(_, v)| *v);
    let tod;
    let mut addr = None;
    let track;
    let flight_level;
    let mut pos: Option<(f64, f64)> = None;
    let mut alt_m = None;
    let mut q = serde_json::Map::new();
    let source = match cat {
        10 => "asterix-cat010",
        48 => "asterix-cat048",
        _ => "asterix-cat062",
    };
    let sac_sic = get(10).map(|v| format!("{}/{}", v[0], v[1]));
    match cat {
        10 | 48 => {
            tod = get(140).map(|v| be(v) as f64 / 128.0);
            addr = get(220).map(|v| be(v) as u32);
            track = get(161).map(|v| be(v) & 0x0FFF);
            flight_level = get(90).map(fl);
            if let Some(v) = get(20) {
                let t = u64::from(v[0] >> 5);
                q.insert(
                    "detection".into(),
                    (if cat == 10 { typ010(t) } else { typ048(t) }).into(),
                );
                // SIM: CAT048 bit 5 of the first octet; CAT010 bit 8 of the first extension.
                let sim = if cat == 10 {
                    v.get(1).map(|o| o >> 7)
                } else {
                    Some(v[0] >> 4 & 1)
                };
                if let Some(s) = sim {
                    q.insert("simulated".into(), u64::from(s).into());
                }
            }
            let h = flight_level.map(|f| f * 100.0 * FT);
            if cat == 10 {
                if let Some(v) = get(41) {
                    let k = 180.0 / 2f64.powi(31);
                    pos = Some((
                        signed(be(&v[0..4]), 32) as f64 * k,
                        signed(be(&v[4..8]), 32) as f64 * k,
                    ));
                } else if let (Some(v), Some(r)) = (get(40), opt.radar) {
                    let rho = be(&v[0..2]) as f64;
                    let th = be(&v[2..4]) as f64 * 360.0 / 65536.0;
                    pos = Some(from_polar(r, rho, th, h));
                } else if let (Some(v), Some(r)) = (get(42), opt.radar) {
                    let x = signed(be(&v[0..2]), 16) as f64;
                    let y = signed(be(&v[2..4]), 16) as f64;
                    let (la, lo, _) = from_enu(r, x, y, 0.0);
                    pos = Some((la, lo));
                }
                if let Some(v) = get(500) {
                    q.insert("sd_x_m".into(), (f64::from(v[0]) * 0.25).into());
                    q.insert("sd_y_m".into(), (f64::from(v[1]) * 0.25).into());
                    q.insert(
                        "cov_xy_m2".into(),
                        (signed(be(&v[2..4]), 16) as f64 * 0.25).into(),
                    );
                }
            } else {
                if let (Some(v), Some(r)) = (get(40), opt.radar) {
                    let rho = be(&v[0..2]) as f64 / 256.0 * NM;
                    let th = be(&v[2..4]) as f64 * 360.0 / 65536.0;
                    pos = Some(from_polar(r, rho, th, h));
                } else if let (Some(v), Some(r)) = (get(42), opt.radar) {
                    let x = signed(be(&v[0..2]), 16) as f64 / 128.0 * NM;
                    let y = signed(be(&v[2..4]), 16) as f64 / 128.0 * NM;
                    let (la, lo, _) = from_enu(r, x, y, 0.0);
                    pos = Some((la, lo));
                }
                if let Some(v) = get(170) {
                    q.insert("tentative".into(), u64::from(v[0] >> 7).into());
                }
                if let Some(v) = get(210) {
                    q.insert("sd_x_m".into(), (f64::from(v[0]) / 128.0 * NM).into());
                    q.insert("sd_y_m".into(), (f64::from(v[1]) / 128.0 * NM).into());
                    q.insert(
                        "sd_heading_deg".into(),
                        (f64::from(v[3]) * 360.0 / 4096.0).into(),
                    );
                }
            }
        }
        _ => {
            tod = get(70).map(|v| be(v) as f64 / 128.0);
            track = get(40).map(be);
            if let Some(v) = get(105) {
                let k = 180.0 / 2f64.powi(25);
                pos = Some((
                    signed(be(&v[0..4]), 32) as f64 * k,
                    signed(be(&v[4..8]), 32) as f64 * k,
                ));
            }
            if let Some(v) = get(380) {
                if let Some((subs, _)) = compound(v, 0, &I062_380) {
                    if let Some((_, at, _)) = subs.iter().find(|s| s.0 == 0) {
                        addr = Some(be(&v[*at..at + 3]) as u32);
                    }
                }
            }
            flight_level = get(136).map(|v| signed(be(v), 16) as f64 / 4.0);
            alt_m = get(130).map(|v| signed(be(v), 16) as f64 * 6.25 * FT);
            if let Some(v) = get(80) {
                q.insert("tentative".into(), u64::from(v[0] >> 1 & 1).into());
                if let Some(o) = v.get(1) {
                    q.insert("simulated".into(), u64::from(o >> 7).into());
                }
                if let Some(o) = v.get(3) {
                    q.insert("coasting".into(), u64::from(o >> 7).into());
                }
            }
            if let Some(v) = get(500) {
                if let Some((subs, _)) = compound(v, 0, &I062_500) {
                    for (idx, at, _) in subs {
                        let w = |k: usize| be(&v[at + k..at + k + 2]) as f64;
                        match idx {
                            0 => {
                                q.insert("sd_x_m".into(), (w(0) * 0.5).into());
                                q.insert("sd_y_m".into(), (w(2) * 0.5).into());
                            }
                            2 => {
                                let k = 180.0 / 2f64.powi(25);
                                q.insert(
                                    "sd_lat_deg".into(),
                                    super::round_to(w(0) * k, 1e9).into(),
                                );
                                q.insert(
                                    "sd_lon_deg".into(),
                                    super::round_to(w(2) * k, 1e9).into(),
                                );
                            }
                            _ => {}
                        }
                    }
                }
            }
        }
    }
    let Some((lat, lon)) = pos else {
        d.other += 1;
        return;
    };
    let id = match (addr, track) {
        (Some(a), _) => format!("{a:06X}"),
        (None, Some(t)) => format!("{}/{t}", sac_sic.clone().unwrap_or_default()),
        (None, None) => sac_sic.clone().unwrap_or_default(),
    };
    let t = match (tod, opt.day_start_unix_s) {
        (Some(s), Some(day)) => Some(day as f64 + s),
        _ => None,
    };
    let mut f = Fix::new(source, id, t, lat, lon);
    f.alt_m = alt_m
        .or(flight_level.map(|v| v * 100.0 * FT))
        .map(|h| super::round_to(h, 1e3));
    f.quality = q;
    if let Some(s) = tod {
        f.extra.insert("time_of_day_s".into(), s.into());
    }
    if let Some(t) = track {
        f.extra.insert("track_number".into(), t.into());
    }
    if let Some(v) = flight_level {
        f.extra.insert("alt_baro_ft".into(), (v * 100.0).into());
    }
    if let Some(s) = sac_sic {
        f.extra.insert("sac_sic".into(), s.into());
    }
    d.fixes.push(f);
}

/// Decode a recording of ASTERIX data blocks (their payloads, concatenated).
pub fn decode(bytes: &[u8], opt: &Options) -> Decoded {
    let mut d = Decoded::default();
    let mut i = 0;
    while i + 3 <= bytes.len() {
        let cat = bytes[i];
        let len = usize::from(u16::from_be_bytes([bytes[i + 1], bytes[i + 2]]));
        if len < 3 || i + len > bytes.len() {
            d.malformed += 1;
            break;
        }
        let block = &bytes[i..i + len];
        i += len;
        let uap: &[(u16, Len)] = match cat {
            10 => &UAP010,
            48 => &UAP048,
            62 => &UAP062,
            21 => {
                let r = crate::asterix_cat021::read(block);
                d.malformed += r.truncated;
                for p in &r.reports {
                    d.read += 1;
                    let (Some(lat), Some(lon), Some(a)) = (p.lat_deg, p.lon_deg, p.address) else {
                        d.other += 1;
                        continue;
                    };
                    let t = match (p.time_of_day_s, opt.day_start_unix_s) {
                        (Some(s), Some(day)) => Some(day as f64 + s),
                        _ => None,
                    };
                    let mut f = Fix::new("asterix-cat021", format!("{a:06X}"), t, lat, lon);
                    f.alt_m = p.flight_level.map(|v| super::round_to(v * 100.0 * FT, 1e3));
                    for (k, v) in [("nic", p.nic), ("nacp", p.nacp), ("mops", p.mops)] {
                        if let Some(v) = v {
                            f.quality.insert(k.into(), v.into());
                        }
                    }
                    f.reported_quality = Quality::of_adsb(p.nic, p.nacp);
                    if let Some(s) = p.time_of_day_s {
                        f.extra.insert("time_of_day_s".into(), s.into());
                    }
                    if let Some(v) = p.flight_level {
                        f.extra.insert("alt_baro_ft".into(), (v * 100.0).into());
                    }
                    d.fixes.push(f);
                }
                continue;
            }
            _ => {
                d.other += 1;
                continue;
            }
        };
        let mut j = 3;
        while j < len {
            match record(block, j, uap) {
                Some((items, n)) if n > 0 => {
                    d.read += 1;
                    report(cat, &items, opt, &mut d);
                    j += n;
                }
                _ => {
                    d.malformed += 1;
                    break;
                }
            }
        }
    }
    d
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn polar_north_and_east_of_a_radar() {
        let r = (52.0, 4.0, 0.0);
        let (lat, lon) = from_polar(r, 10_000.0, 0.0, None);
        assert!(
            (lat - 52.0898).abs() < 1e-3 && (lon - 4.0).abs() < 1e-9,
            "{lat} {lon}"
        );
        let (lat, lon) = from_polar(r, 10_000.0, 90.0, None);
        assert!(
            (lat - 52.0).abs() < 1e-3 && (lon - 4.146).abs() < 1e-3,
            "{lat} {lon}"
        );
    }

    #[test]
    fn compound_and_extended_lengths() {
        // I062/500 with APC and APW: primary 0b1010_0000, then 4 + 4 octets.
        let v = [0xA0, 0, 10, 0, 20, 0, 1, 0, 2];
        let (subs, n) = compound(&v, 0, &I062_500).unwrap();
        assert_eq!(n, 9);
        assert_eq!(subs, vec![(0, 1, 4), (2, 5, 4)]);
        // I062/510: two units of three octets.
        assert_eq!(item_len(&[1, 2, 3, 4, 5, 6], 0, Len::Ext3), Some(6));
        assert_eq!(item_len(&[1, 2, 2], 0, Len::Ext3), Some(3));
    }
}
