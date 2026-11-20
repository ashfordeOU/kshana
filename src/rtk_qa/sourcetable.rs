// SPDX-License-Identifier: AGPL-3.0-only
//! NTRIP source-table reader and mountpoint sorting.
//!
//! A caster's source table lists one `STR` record per mountpoint, with `;`-separated fields in the
//! order casters publish them: mountpoint, identifier, format, format details, carrier (0 none,
//! 1 L1, 2 L1 and L2), navigation systems, network, country, latitude, longitude, NMEA (1: the
//! caster wants a GGA position), solution (0 single base, 1 network), generator, compression,
//! authentication (N none, B Basic, D Digest), fee (Y/N), bit rate and free text. `CAS` and `NET`
//! records are counted. [`sorted_by_distance`] orders the mountpoints by great-circle distance from
//! a position, so field software can offer the nearest base first.

use serde::Serialize;

/// One `STR` record.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Mountpoint {
    /// Mountpoint name.
    pub mountpoint: String,
    /// Identifier (usually a place name).
    pub identifier: String,
    /// Data format (`RTCM 3.2`, ...).
    pub format: String,
    /// Message types and rates, as listed.
    pub format_details: String,
    /// 0 none, 1 L1, 2 L1 and L2 (as listed).
    pub carrier: Option<u8>,
    /// Navigation systems (`GPS+GLO+GAL+BDS`).
    pub nav_system: String,
    /// Network name.
    pub network: String,
    /// Country code.
    pub country: String,
    /// Latitude, degrees.
    pub lat_deg: Option<f64>,
    /// Longitude, degrees.
    pub lon_deg: Option<f64>,
    /// The caster wants a GGA position from the client.
    pub needs_gga: bool,
    /// Network solution (VRS and similar) rather than a single base.
    pub network_solution: bool,
    /// Authentication: `N`, `B` or `D`.
    pub authentication: String,
    /// A fee applies.
    pub fee: bool,
    /// Bit rate, as listed (bit/s).
    pub bitrate: Option<u32>,
    /// Great-circle distance from the position asked about, km.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub distance_km: Option<f64>,
}

/// A parsed source table.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct SourceTable {
    /// The `STR` records.
    pub mountpoints: Vec<Mountpoint>,
    /// `CAS` records.
    pub casters: usize,
    /// `NET` records.
    pub networks: usize,
    /// `STR` records too short to read.
    pub malformed: usize,
    /// The table ended with `ENDSOURCETABLE`.
    pub complete: bool,
}

/// Parse a source table (the body of the caster's answer; any HTTP head before it is skipped).
pub fn parse(text: &str) -> SourceTable {
    let mut t = SourceTable::default();
    for line in text.lines() {
        let line = line.trim_end_matches('\r');
        if line.trim() == "ENDSOURCETABLE" {
            t.complete = true;
            continue;
        }
        let f: Vec<&str> = line.split(';').collect();
        match f[0] {
            "CAS" => t.casters += 1,
            "NET" => t.networks += 1,
            "STR" if f.len() >= 18 => {
                let num = |i: usize| f.get(i).and_then(|v| v.trim().parse::<f64>().ok());
                t.mountpoints.push(Mountpoint {
                    mountpoint: f[1].to_string(),
                    identifier: f[2].to_string(),
                    format: f[3].to_string(),
                    format_details: f[4].to_string(),
                    carrier: f[5].trim().parse().ok(),
                    nav_system: f[6].to_string(),
                    network: f[7].to_string(),
                    country: f[8].to_string(),
                    lat_deg: num(9).filter(|v| v.abs() <= 90.0),
                    lon_deg: num(10).map(|v| if v > 180.0 { v - 360.0 } else { v }),
                    needs_gga: f[11].trim() == "1",
                    network_solution: f[12].trim() == "1",
                    authentication: f[15].trim().to_string(),
                    fee: f[16].trim().eq_ignore_ascii_case("Y"),
                    bitrate: f[17].trim().parse().ok(),
                    distance_km: None,
                });
            }
            "STR" => t.malformed += 1,
            _ => {}
        }
    }
    t
}

/// Great-circle distance (km) on a sphere of the mean Earth radius.
pub fn distance_km(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> f64 {
    let (p1, p2) = (lat1.to_radians(), lat2.to_radians());
    let dp = p2 - p1;
    let dl = (lon2 - lon1).to_radians();
    let a = (dp / 2.0).sin().powi(2) + p1.cos() * p2.cos() * (dl / 2.0).sin().powi(2);
    2.0 * 6371.0088 * a.sqrt().min(1.0).asin()
}

/// The mountpoints with their distance from (`lat`, `lon`), nearest first; those without a usable
/// position (none, or 0,0) go last in their listed order.
pub fn sorted_by_distance(t: &SourceTable, lat: f64, lon: f64) -> Vec<Mountpoint> {
    let mut v: Vec<Mountpoint> = t
        .mountpoints
        .iter()
        .cloned()
        .map(|mut m| {
            m.distance_km = match (m.lat_deg, m.lon_deg) {
                (Some(a), Some(b)) if !(a == 0.0 && b == 0.0) => Some(distance_km(lat, lon, a, b)),
                _ => None,
            };
            m
        })
        .collect();
    v.sort_by(|a, b| match (a.distance_km, b.distance_km) {
        (Some(x), Some(y)) => x.total_cmp(&y),
        (Some(_), None) => std::cmp::Ordering::Less,
        (None, Some(_)) => std::cmp::Ordering::Greater,
        (None, None) => std::cmp::Ordering::Equal,
    });
    v
}

#[cfg(test)]
mod tests {
    use super::*;

    const TABLE: &str = "SOURCETABLE 200 OK\r\n\
CAS;caster.example;2101;Example;Org;0;EST;59.40;24.70;0.0.0.0;0;http://example\r\n\
NET;EX;Org;B;N;http://example;none;mail@example;none\r\n\
STR;TLL0;Tallinn;RTCM 3.2;1005(10),1077(1);2;GPS+GAL;EX;EST;59.44;24.75;0;0;sNTRIP;none;B;N;3000;\r\n\
STR;TRT0;Tartu;RTCM 3.2;1006(10),1077(1);2;GPS;EX;EST;58.38;26.72;0;0;sNTRIP;none;B;N;2400;\r\n\
STR;VRS;Network;RTCM 3.2;1077(1);2;GPS;EX;EST;0.00;0.00;1;1;sNTRIP;none;B;Y;9600;\r\n\
STR;BAD;Short\r\n\
ENDSOURCETABLE\r\n";

    #[test]
    fn records_are_read_and_sorted_by_distance() {
        let t = parse(TABLE);
        assert_eq!(
            (t.mountpoints.len(), t.casters, t.networks, t.malformed),
            (3, 1, 1, 1)
        );
        assert!(t.complete);
        let vrs = &t.mountpoints[2];
        assert!(vrs.needs_gga && vrs.network_solution && vrs.fee);
        assert_eq!(vrs.bitrate, Some(9600));
        // from Tartu, Tartu is nearest, Tallinn next, the network stream (no position) last
        let s = sorted_by_distance(&t, 58.4, 26.7);
        let names: Vec<&str> = s.iter().map(|m| m.mountpoint.as_str()).collect();
        assert_eq!(names, ["TRT0", "TLL0", "VRS"]);
        let d = s[1].distance_km.unwrap();
        assert!((160.0..200.0).contains(&d), "{d}");
    }
}
