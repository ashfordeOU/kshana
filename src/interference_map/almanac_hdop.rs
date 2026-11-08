// SPDX-License-Identifier: AGPL-3.0-only
//! An almanac-HDOP scorer for ADS-B reports (D18, item 1;
//! `docs/design/evidence/d18-bench-leftovers/PREREGISTRATION.md`).
//!
//! **Kshana's own method, built from public material only.** It asks the question of the published
//! NACp-versus-almanac-HDOP method (Pleninger, Topkova and Steiner, The Aeronautical Journal 129
//! (1331), 2025, doi 10.1017/aer.2024.67): could the GPS constellation's geometry alone explain an
//! aircraft's low reported accuracy? It does **not** reproduce that paper, whose full text the
//! project has not read; its mapping, HDOP computation and thresholds are unknown to us.
//!
//! What it does, for each report:
//!
//! 1. **HDOP** at the report's position and time from a GPS almanac in the YUMA format published by
//!    the U.S. Coast Guard Navigation Center (<https://www.navcen.uscg.gov/>). Each healthy
//!    satellite is propagated with the almanac equations of IS-GPS-200 (section 20.3.3.5.2.1, Table
//!    20-VI: the user algorithm for ephemeris data without the harmonic corrections, with the
//!    almanac's `toa`), into WGS-84 ECEF. Satellites below a stated elevation mask, taken from the
//!    geodetic (WGS-84 ellipsoid normal) horizon, are dropped. HDOP is
//!    `sqrt(Q_ee + Q_nn)` of `Q = (HᵀH)⁻¹`, the four-state (east, north, up, clock) geometry with
//!    unit line-of-sight rows. No light-time or Earth-rotation correction is applied to the lines of
//!    sight, and the satellites' almanac clock terms are not used.
//! 2. **EPU**, the 95 % horizontal accuracy bound the report's NACp category stands for
//!    ([`super::adsb::nacp_epu_bound_m`]). The public source quoted is J. Sun, *The 1090 Megahertz
//!    Riddle* (open textbook, <https://mode-s.org/1090mhz/content/ads-b/7-uncertainty.html>),
//!    Table 1.9, which gives the DO-260B categories: NACp 11 < 3 m, 10 < 10 m, 9 < 30 m,
//!    8 < 0.05 NM, 7 < 0.1 NM, 6 < 0.3 NM, 5 < 0.5 NM, 4 < 1 NM, 3 < 2 NM, 2 < 4 NM,
//!    1 < 10 NM, 0 > 10 NM or unknown (1 NM = 1852 m). NACp 0 is not scored.
//! 3. **The flag.** The geometry-predicted 95 % horizontal error is `2 · HDOP · σ_UERE` (the 2 drms
//!    convention), with the user equivalent range error `σ_UERE` stated by the caller. A report is
//!    flagged when `EPU > multiple · predicted`. The multiple and `σ_UERE` are parameters with no
//!    default: the caller states them, and no value was chosen from real data.
//!
//! The scorer is a tool. Scoring real data with it is an evidence question with its own
//! pre-registration.

use crate::portable_math::PortableFloat;

/// WGS-84 Earth gravitational parameter used by the GPS user algorithm (IS-GPS-200), m³/s².
const MU: f64 = 3.986_005e14;
/// WGS-84 Earth rotation rate used by the GPS user algorithm (IS-GPS-200), rad/s.
const OMEGA_E_DOT: f64 = 7.292_115_146_7e-5;
/// WGS-84 semi-major axis, m.
const WGS84_A: f64 = 6_378_137.0;
/// WGS-84 flattening.
const WGS84_F: f64 = 1.0 / 298.257_223_563;
/// Seconds in a GPS week.
const WEEK_S: f64 = 604_800.0;

/// One satellite's record of a YUMA almanac.
#[derive(Clone, Debug, PartialEq)]
pub struct AlmanacEntry {
    /// PRN.
    pub prn: u8,
    /// Health word (0 = healthy).
    pub health: u32,
    /// Eccentricity.
    pub e: f64,
    /// Time of applicability, seconds of the GPS week.
    pub toa: f64,
    /// Orbital inclination, rad.
    pub i0: f64,
    /// Rate of right ascension, rad/s.
    pub omega_dot: f64,
    /// Square root of the semi-major axis, m^(1/2).
    pub sqrt_a: f64,
    /// Right ascension at the week epoch, rad.
    pub omega0: f64,
    /// Argument of perigee, rad.
    pub w: f64,
    /// Mean anomaly at `toa`, rad.
    pub m0: f64,
    /// Almanac week as written (modulo 1024 in YUMA files).
    pub week_mod: u32,
}

/// A YUMA almanac with its GPS week resolved.
#[derive(Clone, Debug, PartialEq)]
pub struct Almanac {
    /// The entries, in file order.
    pub entries: Vec<AlmanacEntry>,
    /// The full GPS week of `toa`.
    pub week: u32,
}

fn field(key: &str, v: &str) -> Result<f64, String> {
    v.trim()
        .parse::<f64>()
        .map_err(|_| crate::terr!("e-almanac-hdop-bad-value", k = key, v = v.trim()))
}

impl Almanac {
    /// Read a YUMA almanac. The file's 10-bit week is resolved to the full GPS week nearest to
    /// `near_gps_week` (for example the week of the reports to be scored).
    pub fn parse_yuma(text: &str, near_gps_week: u32) -> Result<Self, String> {
        let mut entries = Vec::new();
        let mut cur: Vec<(String, String)> = Vec::new();
        let flush =
            |cur: &mut Vec<(String, String)>, out: &mut Vec<AlmanacEntry>| -> Result<(), String> {
                if cur.is_empty() {
                    return Ok(());
                }
                let get = |prefix: &str| -> Result<f64, String> {
                    let v = cur
                        .iter()
                        .find(|(k, _)| k.starts_with(prefix))
                        .map(|(_, v)| v.clone())
                        .ok_or_else(|| crate::terr!("e-almanac-hdop-missing-field", k = prefix))?;
                    field(prefix, &v)
                };
                out.push(AlmanacEntry {
                    prn: get("ID")? as u8,
                    health: get("Health")? as u32,
                    e: get("Eccentricity")?,
                    toa: get("Time of Applicability")?,
                    i0: get("Orbital Inclination")?,
                    omega_dot: get("Rate of Right Ascen")?,
                    sqrt_a: get("SQRT(A)")?,
                    omega0: get("Right Ascen at Week")?,
                    w: get("Argument of Perigee")?,
                    m0: get("Mean Anom")?,
                    week_mod: get("week")? as u32,
                });
                cur.clear();
                Ok(())
            };
        for line in text.lines() {
            let l = line.trim();
            if l.starts_with("****") {
                flush(&mut cur, &mut entries)?;
                continue;
            }
            if let Some((k, v)) = l.split_once(':') {
                cur.push((k.trim().to_string(), v.trim().to_string()));
            }
        }
        flush(&mut cur, &mut entries)?;
        let first = entries
            .first()
            .ok_or_else(|| crate::terr!("e-almanac-hdop-no-entries"))?;
        let wm = first.week_mod % 1024;
        if entries.iter().any(|e| e.week_mod % 1024 != wm) {
            return Err(crate::terr!("e-almanac-hdop-mixed-weeks"));
        }
        // The full week ≡ wm (mod 1024) nearest to near_gps_week.
        let base = near_gps_week as i64 - (near_gps_week as i64 - wm as i64).rem_euclid(1024);
        let week = if near_gps_week as i64 - base > 512 {
            base + 1024
        } else {
            base
        };
        Ok(Almanac {
            entries,
            week: week as u32,
        })
    }

    /// The healthy satellites' WGS-84 ECEF positions (m) at `gps_s`, GPS seconds since
    /// 1980-01-06T00:00:00 GPS time.
    pub fn healthy_positions(&self, gps_s: f64) -> Vec<(u8, [f64; 3])> {
        self.entries
            .iter()
            .filter(|e| e.health == 0)
            .map(|e| {
                (
                    e.prn,
                    e.position_ecef(gps_s - (self.week as f64 * WEEK_S + e.toa)),
                )
            })
            .collect()
    }
}

impl AlmanacEntry {
    /// ECEF position (m) at `tk` seconds from the time of applicability (IS-GPS-200 Table 20-IV
    /// with the almanac's elements and no harmonic corrections; the node longitude referred to
    /// `toa`, as the almanac's right ascension is given at the week epoch).
    pub fn position_ecef(&self, tk: f64) -> [f64; 3] {
        let a = self.sqrt_a * self.sqrt_a;
        let n = (MU / (a * a * a)).sqrt();
        let m = self.m0 + n * tk;
        let mut ek = m;
        for _ in 0..50 {
            let d = (ek - self.e * ek.psin() - m) / (1.0 - self.e * ek.pcos());
            ek -= d;
            if d.abs() < 1e-15 {
                break;
            }
        }
        let nu = ((1.0 - self.e * self.e).sqrt() * ek.psin()).patan2(ek.pcos() - self.e);
        let u = nu + self.w;
        let r = a * (1.0 - self.e * ek.pcos());
        let (xp, yp) = (r * u.pcos(), r * u.psin());
        let om = self.omega0 + (self.omega_dot - OMEGA_E_DOT) * tk - OMEGA_E_DOT * self.toa;
        let (so, co) = (om.psin(), om.pcos());
        let (si, ci) = (self.i0.psin(), self.i0.pcos());
        [xp * co - yp * ci * so, xp * so + yp * ci * co, yp * si]
    }
}

/// WGS-84 ECEF (m) of geodetic latitude and longitude (deg) and height above the ellipsoid (m).
pub fn geodetic_to_ecef(lat_deg: f64, lon_deg: f64, h_m: f64) -> [f64; 3] {
    let (lat, lon) = (lat_deg.to_radians(), lon_deg.to_radians());
    let e2 = WGS84_F * (2.0 - WGS84_F);
    let n = WGS84_A / (1.0 - e2 * lat.psin() * lat.psin()).sqrt();
    [
        (n + h_m) * lat.pcos() * lon.pcos(),
        (n + h_m) * lat.pcos() * lon.psin(),
        (n * (1.0 - e2) + h_m) * lat.psin(),
    ]
}

/// The geometry at a point.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Geometry {
    /// Satellites above the mask.
    pub satellites: usize,
    /// HDOP; `None` below four satellites or for a singular geometry.
    pub hdop: Option<f64>,
}

/// HDOP at geodetic `lat_deg`, `lon_deg`, `h_m` and GPS time `gps_s` from `alm`'s healthy
/// satellites above `mask_deg` (geodetic horizon).
pub fn hdop_at(
    alm: &Almanac,
    lat_deg: f64,
    lon_deg: f64,
    h_m: f64,
    gps_s: f64,
    mask_deg: f64,
) -> Geometry {
    let user = geodetic_to_ecef(lat_deg, lon_deg, h_m);
    let (lat, lon) = (lat_deg.to_radians(), lon_deg.to_radians());
    let east = [-lon.psin(), lon.pcos(), 0.0];
    let north = [
        -lat.psin() * lon.pcos(),
        -lat.psin() * lon.psin(),
        lat.pcos(),
    ];
    let up = [lat.pcos() * lon.pcos(), lat.pcos() * lon.psin(), lat.psin()];
    let dot = |a: [f64; 3], b: [f64; 3]| a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
    let mut rows: Vec<[f64; 4]> = Vec::new();
    for (_, s) in alm.healthy_positions(gps_s) {
        let d = [s[0] - user[0], s[1] - user[1], s[2] - user[2]];
        let r = dot(d, d).sqrt();
        let los = [d[0] / r, d[1] / r, d[2] / r];
        let (le, ln, lu) = (dot(los, east), dot(los, north), dot(los, up));
        if lu.clamp(-1.0, 1.0).asin().to_degrees() < mask_deg {
            continue;
        }
        rows.push([-le, -ln, -lu, 1.0]);
    }
    let n = rows.len();
    let mut hdop = None;
    if n >= 4 {
        let mut m = [[0.0f64; 4]; 4];
        for r in &rows {
            for i in 0..4 {
                for j in 0..4 {
                    m[i][j] += r[i] * r[j];
                }
            }
        }
        if let Some(q) = invert4(m) {
            let v = q[0][0] + q[1][1];
            if v.is_finite() && v > 0.0 {
                hdop = Some(v.sqrt());
            }
        }
    }
    Geometry {
        satellites: n,
        hdop,
    }
}

/// Inverse of a symmetric 4 × 4 matrix by Gauss-Jordan elimination with partial pivoting.
fn invert4(mut a: [[f64; 4]; 4]) -> Option<[[f64; 4]; 4]> {
    let mut inv = [[0.0f64; 4]; 4];
    for (i, row) in inv.iter_mut().enumerate() {
        row[i] = 1.0;
    }
    for col in 0..4 {
        let p = (col..4).max_by(|&x, &y| a[x][col].abs().total_cmp(&a[y][col].abs()))?;
        if a[p][col].abs() < 1e-12 {
            return None;
        }
        a.swap(col, p);
        inv.swap(col, p);
        let d = a[col][col];
        for j in 0..4 {
            a[col][j] /= d;
            inv[col][j] /= d;
        }
        for r in 0..4 {
            if r != col {
                let f = a[r][col];
                for j in 0..4 {
                    a[r][j] -= f * a[col][j];
                    inv[r][j] -= f * inv[col][j];
                }
            }
        }
    }
    Some(inv)
}

/// The caller's parameters. None has a default.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct ScoreParams {
    /// Elevation mask, degrees above the geodetic horizon.
    pub mask_deg: f64,
    /// User equivalent range error, 1 sigma, metres.
    pub uere_m: f64,
    /// A report is flagged when its EPU exceeds this multiple of the geometry-predicted 95 %
    /// horizontal error.
    pub multiple: f64,
}

/// One ADS-B report to score.
#[derive(Clone, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
pub struct Report {
    /// GPS seconds since 1980-01-06T00:00:00 GPS time.
    pub gps_s: f64,
    /// Geodetic latitude, degrees.
    pub lat_deg: f64,
    /// Longitude, degrees.
    pub lon_deg: f64,
    /// Height above the WGS-84 ellipsoid, metres.
    pub h_m: f64,
    /// NACp category, 0 to 11.
    pub nacp: u8,
}

/// What the scorer says about one report.
#[derive(Clone, Debug, PartialEq, serde::Serialize)]
pub struct Outcome {
    /// Satellites above the mask.
    pub satellites: usize,
    /// HDOP, when the geometry gives one.
    pub hdop: Option<f64>,
    /// The NACp category's 95 % horizontal bound, m; `None` for NACp 0 or a code above 11.
    pub epu_m: Option<f64>,
    /// The geometry-predicted 95 % horizontal error `2 · HDOP · σ_UERE`, m.
    pub predicted_95_m: Option<f64>,
    /// `epu_m / predicted_95_m`.
    pub ratio: Option<f64>,
    /// Flagged: the EPU exceeds `multiple` times the predicted error. `None` when the report is
    /// not scored (no EPU, or no HDOP).
    pub flagged: Option<bool>,
}

/// Score `reports` against `alm` with `p`.
pub fn score(alm: &Almanac, reports: &[Report], p: &ScoreParams) -> Result<Vec<Outcome>, String> {
    let positive = |x: f64| x.is_finite() && x > 0.0;
    if !positive(p.uere_m) || !positive(p.multiple) || !(-90.0..90.0).contains(&p.mask_deg) {
        return Err(crate::terr!("e-almanac-hdop-bad-params"));
    }
    Ok(reports
        .iter()
        .map(|r| {
            let g = hdop_at(alm, r.lat_deg, r.lon_deg, r.h_m, r.gps_s, p.mask_deg);
            let epu = super::adsb::nacp_epu_bound_m(r.nacp);
            let predicted = g.hdop.map(|h| 2.0 * h * p.uere_m);
            let ratio = epu.zip(predicted).map(|(e, pr)| e / pr);
            Outcome {
                satellites: g.satellites,
                hdop: g.hdop,
                epu_m: epu,
                predicted_95_m: predicted,
                ratio,
                flagged: epu.zip(predicted).map(|(e, pr)| e > p.multiple * pr),
            }
        })
        .collect())
}

/// GPS seconds since 1980-01-06T00:00:00 GPS time of a UTC instant given as Unix seconds (leap
/// seconds from the engine's table).
pub fn gps_seconds_from_unix(unix_s: f64) -> f64 {
    let jd = unix_s / 86_400.0 + 2_440_587.5;
    unix_s - 315_964_800.0 + (crate::timescales::tai_minus_utc(jd) - 19.0)
}

#[cfg(test)]
mod tests {
    use super::*;

    const ONE: &str = "******** Week 396 almanac for PRN-01 ********
ID:                         01
Health:                     000
Eccentricity:               0.2202510834E-002
Time of Applicability(s):  233472.0000
Orbital Inclination(rad):   0.9556724277
Rate of Right Ascen(r/s):  -0.8320346576E-008
SQRT(A)  (m 1/2):           5153.678711
Right Ascen at Week(rad):  -0.1376823782E+001
Argument of Perigee(rad):   0.147686098
Mean Anom(rad):            -0.2912897690E+001
Af0(s):                     0.1306533813E-003
Af1(s/s):                  -0.7275957614E-011
week:                        396
";

    #[test]
    fn reads_a_yuma_record_and_resolves_the_week() {
        let a = Almanac::parse_yuma(ONE, 2444).unwrap();
        assert_eq!(a.week, 2444);
        assert_eq!(Almanac::parse_yuma(ONE, 2444 + 400).unwrap().week, 2444);
        assert_eq!(
            Almanac::parse_yuma(ONE, 2444 + 600).unwrap().week,
            2444 + 1024
        );
        let e = &a.entries[0];
        assert_eq!((e.prn, e.health, e.week_mod), (1, 0, 396));
        assert_eq!(e.sqrt_a, 5153.678711);
        // A GPS orbit radius at any time.
        let r = e.position_ecef(1000.0);
        let rr = (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt();
        assert!(
            (rr - 5153.678711f64.powi(2)).abs() < 0.003 * 5153.678711f64.powi(2),
            "{rr}"
        );
        assert!(Almanac::parse_yuma("", 2444).is_err());
    }

    #[test]
    fn refuses_parameters_it_cannot_use() {
        let a = Almanac::parse_yuma(ONE, 2444).unwrap();
        for p in [
            (5.0, 0.0, 1.0),
            (5.0, 1.0, 0.0),
            (95.0, 1.0, 1.0),
            (5.0, f64::NAN, 1.0),
        ] {
            let p = ScoreParams {
                mask_deg: p.0,
                uere_m: p.1,
                multiple: p.2,
            };
            assert!(score(&a, &[], &p).is_err());
        }
    }

    #[test]
    fn gps_time_of_a_unix_instant() {
        // 2026-11-07T00:00:00Z: 18 leap seconds since 1980.
        let g = gps_seconds_from_unix(1_794_355_200.0);
        assert_eq!(g, 1_794_355_200.0 - 315_964_800.0 + 18.0);
    }

    #[test]
    fn the_nacp_mapping_is_the_quoted_table() {
        // J. Sun, The 1090 Megahertz Riddle, Table 1.9 (1 NM = 1852 m).
        let nm = 1852.0;
        let table: [(u8, Option<f64>); 13] = [
            (0, None),
            (1, Some(10.0 * nm)),
            (2, Some(4.0 * nm)),
            (3, Some(2.0 * nm)),
            (4, Some(1.0 * nm)),
            (5, Some(0.5 * nm)),
            (6, Some(0.3 * nm)),
            (7, Some(0.1 * nm)),
            (8, Some(0.05 * nm)),
            (9, Some(30.0)),
            (10, Some(10.0)),
            (11, Some(3.0)),
            (12, None),
        ];
        for (code, want) in table {
            let got = crate::interference_map::adsb::nacp_epu_bound_m(code);
            match (got, want) {
                (Some(g), Some(w)) => assert!((g - w).abs() < 1e-9, "NACp {code}: {g} vs {w}"),
                (None, None) => {}
                _ => panic!("NACp {code}: {got:?} vs {want:?}"),
            }
        }
    }
}
