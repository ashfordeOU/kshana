// SPDX-License-Identifier: AGPL-3.0-only
//! EUROCONTROL ASTERIX Category 021 (ADS-B target reports), read for the GNSS interference map
//! (roadmap A2c, aviation).
//!
//! A data block is `CAT` (21), `LEN` (two octets, the whole block) and records. A record starts with a
//! field specification (FSPEC: octets whose bits 8–2 flag the presence of the User Application
//! Profile's items in order, and whose bit 1 says another FSPEC octet follows), then the items present.
//! Items are read or stepped over by the UAP of CAT021 edition 2.6 (EUROCONTROL-SPEC-0149-12, Table 2),
//! including the variable, repetitive, compound and explicit-length items, so that one unknown field
//! does not lose the rest of the block.
//!
//! What is kept per report: time of message reception of position (I021/073, seconds of the UTC day,
//! LSB 1/128 s), target address (I021/080), position (I021/131 high resolution, LSB 180/2^30 degrees,
//! else I021/130, LSB 180/2^23), flight level (I021/145, LSB 1/4 FL), MOPS version (I021/210), and from
//! the quality indicators (I021/090) the NIC (primary subfield bits 5–2, a NIC only when the MOPS version is
//! 1 or later; version 0 sends NUCp there, which is not kept) and the NACp (first extension, bits 5–2).
//!
//! The item list and the field layouts are from the EUROCONTROL specification, a public document. No
//! text of it is reproduced beyond item names and field positions.
//!
//! MODELLED: checked on blocks built by an independent encoder (`tests/asterix_cat021.rs`); no public
//! CAT021 recording with a clear licence has been checked yet.
use serde::Serialize;

/// How an item of the UAP is laid out.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
enum Len {
    Fixed(usize),
    /// One octet, extended while bit 1 is set.
    Fx,
    /// A repetition count octet, then that many items of the given size.
    Rep(usize),
    /// The first octet is the item's whole length.
    Explicit,
    /// Met information (I021/220): one primary octet, subfields of 2, 2, 2, 1 octets.
    Met,
    /// Trajectory intent (I021/110): primary octet; subfield 1 is FX-extended, subfield 2 repetitive (15).
    Intent,
    /// Data ages (I021/295): primary of up to four FX octets; each present subfield is one octet.
    Ages,
    /// Not used in this UAP.
    None,
}

/// The CAT021 edition 2.6 UAP, by field reference number (FRN 1 first).
const UAP: [(u16, Len); 49] = [
    (10, Len::Fixed(2)),
    (40, Len::Fx),
    (161, Len::Fixed(2)),
    (15, Len::Fixed(1)),
    (71, Len::Fixed(3)),
    (130, Len::Fixed(6)),
    (131, Len::Fixed(8)),
    (72, Len::Fixed(3)),
    (150, Len::Fixed(2)),
    (151, Len::Fixed(2)),
    (80, Len::Fixed(3)),
    (73, Len::Fixed(3)),
    (74, Len::Fixed(4)),
    (75, Len::Fixed(3)),
    (76, Len::Fixed(4)),
    (140, Len::Fixed(2)),
    (90, Len::Fx),
    (210, Len::Fixed(1)),
    (70, Len::Fixed(2)),
    (230, Len::Fixed(2)),
    (145, Len::Fixed(2)),
    (152, Len::Fixed(2)),
    (200, Len::Fixed(1)),
    (155, Len::Fixed(2)),
    (157, Len::Fixed(2)),
    (160, Len::Fixed(4)),
    (165, Len::Fixed(2)),
    (77, Len::Fixed(3)),
    (170, Len::Fixed(6)),
    (20, Len::Fixed(1)),
    (220, Len::Met),
    (146, Len::Fixed(2)),
    (148, Len::Fixed(2)),
    (110, Len::Intent),
    (16, Len::Fixed(1)),
    (8, Len::Fixed(1)),
    (271, Len::Fx),
    (132, Len::Fixed(1)),
    (250, Len::Rep(8)),
    (260, Len::Fixed(7)),
    (400, Len::Fixed(1)),
    (295, Len::Ages),
    (0, Len::None),
    (0, Len::None),
    (0, Len::None),
    (0, Len::None),
    (0, Len::None),
    (1, Len::Explicit), // RE
    (2, Len::Explicit), // SP
];

/// One ADS-B report, as kept.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Report {
    /// Time of message reception of position, seconds of the UTC day.
    pub time_of_day_s: Option<f64>,
    /// 24-bit target address.
    pub address: Option<u32>,
    /// Latitude, degrees.
    pub lat_deg: Option<f64>,
    /// Longitude, degrees.
    pub lon_deg: Option<f64>,
    /// Flight level (hundreds of feet).
    pub flight_level: Option<f64>,
    /// MOPS version (I021/210 bits 6–4).
    pub mops: Option<u8>,
    /// Navigation Integrity Category (MOPS 1 or later).
    pub nic: Option<u8>,
    /// Navigation Accuracy Category for position.
    pub nacp: Option<u8>,
}

/// What a recording held.
#[derive(Clone, Debug, Default, Serialize)]
pub struct Recording {
    /// Reports, in order.
    pub reports: Vec<Report>,
    /// Blocks of other categories, stepped over.
    pub other_category: usize,
    /// Blocks or records cut short (the rest of that block is not read).
    pub truncated: usize,
}

fn signed(v: u64, bits: u32) -> i64 {
    let v = v as i64;
    if v >> (bits - 1) & 1 == 1 {
        v - (1i64 << bits)
    } else {
        v
    }
}

fn be(b: &[u8]) -> u64 {
    b.iter().fold(0u64, |a, &x| (a << 8) | u64::from(x))
}

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

/// Length of the item at `at`, by its UAP layout.
fn item_len(b: &[u8], at: usize, len: Len) -> Option<usize> {
    Some(match len {
        Len::Fixed(n) => n,
        Len::Fx => fx_len(b, at)?,
        Len::Rep(n) => 1 + n * usize::from(*b.get(at)?),
        Len::Explicit => usize::from(*b.get(at)?).max(1),
        Len::Met => {
            let p = *b.get(at)?;
            1 + [(0x80, 2), (0x40, 2), (0x20, 2), (0x10, 1)]
                .iter()
                .filter(|(m, _)| p & m != 0)
                .map(|(_, s)| s)
                .sum::<usize>()
        }
        Len::Intent => {
            let p = *b.get(at)?;
            let mut n = 1;
            if p & 0x80 != 0 {
                n += fx_len(b, at + n)?;
            }
            if p & 0x40 != 0 {
                n += 1 + 15 * usize::from(*b.get(at + n)?);
            }
            n
        }
        Len::Ages => {
            let p = fx_len(b, at)?;
            let present: u32 = (0..p).map(|k| (b[at + k] & 0xFE).count_ones()).sum();
            p + present as usize
        }
        Len::None => return None,
    })
}

fn record(b: &[u8], at: usize) -> Option<(Report, usize)> {
    let fspec = fx_len(b, at)?;
    let mut i = at + fspec;
    let mut r = Report {
        time_of_day_s: None,
        address: None,
        lat_deg: None,
        lon_deg: None,
        flight_level: None,
        mops: None,
        nic: None,
        nacp: None,
    };
    let mut nic_raw = None;
    let mut hi_res = false;
    for k in 0..fspec {
        let o = b[at + k];
        for bit in 0..7 {
            if o & (0x80 >> bit) == 0 {
                continue;
            }
            let (item, len) = *UAP.get(k * 7 + bit)?;
            let n = item_len(b, i, len)?;
            let v = b.get(i..i + n)?;
            match item {
                73 => r.time_of_day_s = Some(be(v) as f64 / 128.0),
                80 => r.address = Some(be(v) as u32),
                130 if !hi_res => {
                    r.lat_deg = Some(signed(be(&v[0..3]), 24) as f64 * 180.0 / (1u64 << 23) as f64);
                    r.lon_deg = Some(signed(be(&v[3..6]), 24) as f64 * 180.0 / (1u64 << 23) as f64);
                }
                131 => {
                    hi_res = true;
                    r.lat_deg = Some(signed(be(&v[0..4]), 32) as f64 * 180.0 / (1u64 << 30) as f64);
                    r.lon_deg = Some(signed(be(&v[4..8]), 32) as f64 * 180.0 / (1u64 << 30) as f64);
                }
                145 => r.flight_level = Some(signed(be(v), 16) as f64 / 4.0),
                210 => r.mops = Some((v[0] >> 3) & 0x7),
                90 => {
                    nic_raw = Some((v[0] >> 1) & 0xF);
                    if v.len() > 1 {
                        r.nacp = Some((v[1] >> 1) & 0xF);
                    }
                }
                _ => {}
            }
            i += n;
        }
    }
    if r.mops.unwrap_or(0) >= 1 {
        r.nic = nic_raw;
    }
    Some((r, i - at))
}

/// Read a recording of ASTERIX data blocks (concatenated, as a capture of their payloads).
pub fn read(bytes: &[u8]) -> Recording {
    let mut out = Recording::default();
    let mut i = 0;
    while i + 3 <= bytes.len() {
        let cat = bytes[i];
        let len = usize::from(u16::from_be_bytes([bytes[i + 1], bytes[i + 2]]));
        if len < 3 || i + len > bytes.len() {
            out.truncated += 1;
            break;
        }
        if cat != 21 {
            out.other_category += 1;
            i += len;
            continue;
        }
        let block = &bytes[i..i + len];
        let mut j = 3;
        while j < len {
            match record(block, j) {
                Some((r, n)) if n > 0 => {
                    out.reports.push(r);
                    j += n;
                }
                _ => {
                    out.truncated += 1;
                    break;
                }
            }
        }
        i += len;
    }
    out
}

/// The reports as the interference map's ADS-B CSV (`docs/INTERFERENCE-MAP.md`), for the UTC day that
/// starts at `day_start_unix_s` (CAT021 carries the time of day only). Rows without a time, an address or
/// a position are left out. The address is written as six hex digits; the map hashes it and never stores it.
pub fn to_adsb_csv(r: &Recording, day_start_unix_s: i64) -> String {
    let mut s = String::from("timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type\n");
    for p in &r.reports {
        let (Some(t), Some(a), Some(lat), Some(lon)) =
            (p.time_of_day_s, p.address, p.lat_deg, p.lon_deg)
        else {
            continue;
        };
        let alt = p
            .flight_level
            .map(|f| format!("{}", f * 100.0))
            .unwrap_or_default();
        let opt = |v: Option<u8>| v.map(|x| x.to_string()).unwrap_or_default();
        s.push_str(&format!(
            "{:.3},{a:06X},{lat:.7},{lon:.7},{alt},{},{},adsb\n",
            day_start_unix_s as f64 + t,
            opt(p.nic),
            opt(p.nacp)
        ));
    }
    s
}
