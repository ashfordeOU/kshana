// SPDX-License-Identifier: AGPL-3.0-only
//! Rain-fade availability: the slant-path rain attenuation of ITU-R P.618-14 section 2.2.1.1
//! ([`crate::leo_link::itu::p618_rain_attenuation_db`], validated in the engine against the ITU-R
//! Study Group 3 examples) at each band and elevation, and the availability a stated link margin buys.
//!
//! The availability is `100 − p` where `p` is the time percentage at which the attenuation equals the
//! margin, found by bisection on `log p` over the procedure's range, 0.001 % to 5 % of an average
//! year (the attenuation falls as `p` grows). Outside that range the report gives the range end and
//! says which side it is on (`at_least` or `at_most`). The rain height (ITU-R P.839) and the rain rate
//! exceeded for 0.01 % of the year (ITU-R P.837) are inputs because the engine carries neither map.
//!
//! This is the C-band question for LEO-PNT: a C-band signal's rain loss, set against its margin, next
//! to the same geometry in L band. MODELLED for a stated site; the procedure itself is the validated one.

use super::{list_len, within};
use crate::leo_link::itu::{p618_rain_attenuation_db, RainPath};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// The lowest time percentage of the P.618 procedure.
pub const P_MIN: f64 = 0.001;
/// The highest time percentage of the P.618 procedure.
pub const P_MAX: f64 = 5.0;
/// Minutes in an average year.
pub const MINUTES_PER_YEAR: f64 = 525_960.0;

/// One band.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RainBand {
    /// A short name.
    pub id: String,
    /// Frequency (GHz), 1 to 55.
    pub f_ghz: f64,
    /// Link margin available for rain (dB).
    pub margin_db: f64,
}

fn d_tilt() -> f64 {
    45.0
}
fn d_els() -> Vec<f64> {
    vec![10.0, 20.0, 30.0, 45.0, 60.0, 90.0]
}
fn d_ps() -> Vec<f64> {
    vec![0.001, 0.01, 0.1, 1.0, 5.0]
}

/// Input of `kshana leo-verify rain-fade`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RainInput {
    /// Station latitude (deg).
    pub lat_deg: f64,
    /// Station height above mean sea level (km).
    #[serde(default)]
    pub station_height_km: f64,
    /// Rain height h_R (km), the ITU-R P.839 value at the site.
    pub rain_height_km: f64,
    /// Rain rate exceeded for 0.01 % of an average year, R0.01 (mm/h), the ITU-R P.837 value.
    pub r001_mm_h: f64,
    /// Polarisation tilt from the horizontal (deg); 45 for circular polarisation.
    #[serde(default = "d_tilt")]
    pub polarisation_tilt_deg: f64,
    /// The bands.
    pub bands: Vec<RainBand>,
    /// Elevations (deg).
    #[serde(default = "d_els")]
    pub elevations_deg: Vec<f64>,
    /// Time percentages to tabulate (0.001 to 5).
    #[serde(default = "d_ps")]
    pub percentages: Vec<f64>,
}

/// Attenuation at one time percentage.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Exceedance {
    /// Time percentage of an average year.
    pub p_percent: f64,
    /// Attenuation exceeded for that percentage (dB).
    pub a_db: f64,
}

/// One band at one elevation.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RainRow {
    /// Band.
    pub band: String,
    /// Frequency (GHz).
    pub f_ghz: f64,
    /// Elevation (deg).
    pub elevation_deg: f64,
    /// Attenuation against time percentage.
    pub exceedance: Vec<Exceedance>,
    /// Margin (dB).
    pub margin_db: f64,
    /// Time percentage at which the attenuation equals the margin (range end when outside).
    pub outage_percent: f64,
    /// Availability, `100 − outage_percent`.
    pub availability_percent: f64,
    /// `exact`, `at_least` (the margin covers even 0.001 %) or `at_most` (it fails even at 5 %).
    pub bound: &'static str,
    /// Outage per average year (min).
    pub outage_minutes_per_year: f64,
}

/// Report of `kshana leo-verify rain-fade`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct RainReport {
    /// Every band and elevation.
    pub rows: Vec<RainRow>,
}

/// The time percentage (0.001 to 5) at which `path`'s attenuation equals `margin_db`, with
/// `exact`, `at_least` or `at_most`.
pub fn outage_percent(path: &RainPath, margin_db: f64) -> (f64, &'static str) {
    let a = |p: f64| p618_rain_attenuation_db(path, p);
    if a(P_MIN) <= margin_db {
        return (P_MIN, "at_least");
    }
    if a(P_MAX) > margin_db {
        return (P_MAX, "at_most");
    }
    let (mut lo, mut hi) = (P_MIN.pln(), P_MAX.pln());
    for _ in 0..100 {
        let mid = 0.5 * (lo + hi);
        if a(mid.pexp()) > margin_db {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    ((0.5 * (lo + hi)).pexp(), "exact")
}

/// Run the availability table.
pub fn run(inp: &RainInput) -> Result<RainReport, String> {
    within("lat_deg", inp.lat_deg, -90.0, 90.0)?;
    within("station_height_km", inp.station_height_km, -0.5, 9.0)?;
    within("rain_height_km", inp.rain_height_km, 0.0, 10.0)?;
    within("r001_mm_h", inp.r001_mm_h, 0.0, 300.0)?;
    within(
        "polarisation_tilt_deg",
        inp.polarisation_tilt_deg,
        0.0,
        90.0,
    )?;
    list_len("bands", inp.bands.len(), 20)?;
    list_len("elevations_deg", inp.elevations_deg.len(), 90)?;
    list_len("percentages", inp.percentages.len(), 50)?;
    for &p in &inp.percentages {
        within("percentages", p, P_MIN, P_MAX)?;
    }
    for &e in &inp.elevations_deg {
        within("elevations_deg", e, 1.0, 90.0)?;
    }
    let mut rows = Vec::new();
    for b in &inp.bands {
        within("bands.f_ghz", b.f_ghz, 1.0, 55.0)?;
        within("bands.margin_db", b.margin_db, 0.0, 100.0)?;
        for &el in &inp.elevations_deg {
            let path = RainPath {
                f_ghz: b.f_ghz,
                el_deg: el,
                lat_deg: inp.lat_deg,
                hs_km: inp.station_height_km,
                rain_height_km: inp.rain_height_km,
                r001_mm_h: inp.r001_mm_h,
                tau_deg: inp.polarisation_tilt_deg,
            };
            let (p, bound) = outage_percent(&path, b.margin_db);
            rows.push(RainRow {
                band: b.id.clone(),
                f_ghz: b.f_ghz,
                elevation_deg: el,
                exceedance: inp
                    .percentages
                    .iter()
                    .map(|&p| Exceedance {
                        p_percent: p,
                        a_db: p618_rain_attenuation_db(&path, p),
                    })
                    .collect(),
                margin_db: b.margin_db,
                outage_percent: p,
                availability_percent: 100.0 - p,
                bound,
                outage_minutes_per_year: p / 100.0 * MINUTES_PER_YEAR,
            });
        }
    }
    Ok(RainReport { rows })
}
