// SPDX-License-Identifier: AGPL-3.0-only
//! Environmental baseline per site and hour (0.41 row B8): how disturbed the ionosphere above a GNSS
//! site is expected to be from the space-weather indices alone, so a natural disturbance is not read
//! as interference. Output: a score `b ∈ [0, 1]` and a level, `quiet` (`b < 0.33`), `elevated`
//! (`0.33 ≤ b < 0.67`) or `disturbed` (`b ≥ 0.67`).
//!
//! The definitions are fixed in `docs/design/evidence/b8-environmental-baseline/PREREGISTRATION.md`.
//! Every constant of [`EnvBaselineParams::v1`] comes from published climatology or physics, cited at
//! the constant, and was set and tested on synthetic inputs only, before any scoring data was fetched.
//! The baseline is MODELLED: a climatological expectation, not a measurement.
//!
//! The geomagnetic latitude is the centred-dipole latitude from the IGRF degree-1 coefficients at the
//! date ([`crate::igrf::geomagnetic_north_pole`]). The shipped model is IGRF-14 centred on 2025.0;
//! earlier dates use its secular variation backwards, which moves the dipole pole by a fraction of a
//! degree per decade.

use crate::igrf::geomagnetic_north_pole;
use serde::{Deserialize, Serialize};

/// One site-hour.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct SiteHour {
    /// Geodetic latitude, degrees.
    pub lat_deg: f64,
    /// East longitude, degrees.
    pub lon_deg: f64,
    /// Decimal year of the hour (for the dipole).
    pub year: f64,
    /// Day of year, 1 to 366.
    pub doy: u32,
    /// UTC hour at the middle of the hour, 0 to 24.
    pub ut_hour: f64,
    /// The 3-hourly Kp for the hour, 0 to 9.
    pub kp: f64,
    /// The day's observed F10.7, solar flux units.
    pub f107: f64,
}

/// The baseline's verdict for one site-hour.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Baseline {
    /// Dipole (geomagnetic) latitude, degrees.
    pub mag_lat_deg: f64,
    /// Solar local time, hours.
    pub slt_h: f64,
    /// The score, 0 to 1.
    pub b: f64,
    /// `quiet`, `elevated` or `disturbed`.
    pub level: String,
    /// Which regime set the score: `high`, `low` or `mid`.
    pub regime: String,
}

/// The baseline's constants.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct EnvBaselineParams {
    /// |Φ| at and above which the high-latitude regime applies, degrees (pre-registration).
    pub high_lat_deg: f64,
    /// |Φ| at and below which the low-latitude regime applies, degrees (pre-registration).
    pub low_lat_deg: f64,
    /// Equatorward edge of the auroral oval at Kp = 0, degrees of dipole latitude. Feldstein and
    /// Starkov (1967), Planet. Space Sci. 15, 209: the night-side equatorward boundary near 67° in
    /// quiet conditions.
    pub oval_edge_kp0_deg: f64,
    /// Equatorward motion of that edge per unit Kp, degrees. Starkov (1994), Geomagn. Aeron. 34, 331:
    /// about 2° per unit of Kp on the night side.
    pub oval_edge_per_kp_deg: f64,
    /// Width of the transition across the oval's edge, degrees (the oval's own equatorward diffuse
    /// zone, a few degrees wide; Feldstein and Starkov 1967).
    pub oval_edge_width_deg: f64,
    /// Kp at which high-latitude activity reaches its full weight. Kp 5 is the G1 storm level of the
    /// NOAA space weather scales.
    pub high_kp_full: f64,
    /// Start and end of the post-sunset window, solar local time, hours. Aarons (1993), Space Sci.
    /// Rev. 63, 209: equatorial irregularities develop after sunset and decay after local midnight.
    pub low_slt_window_h: [f64; 2],
    /// F10.7 at which the low-latitude occurrence starts and at which it saturates, sfu. Aarons
    /// (1993) and Burke et al. (2004), J. Geophys. Res. 109, A12301: occurrence rises steeply with
    /// solar flux between solar minimum (about 70) and maximum (about 200).
    pub low_f107_range: [f64; 2],
    /// The low-latitude score's season factor away from the equinoxes (1 at the equinoxes). Burke et
    /// al. (2004): occurrence peaks near the equinoxes at most longitudes.
    pub low_solstice_factor: f64,
    /// Kp at and above which storm time suppresses the post-sunset irregularities, and the factor.
    /// Aarons (1991), Radio Sci. 26, 1131: magnetic storms mostly inhibit their pre-midnight generation.
    pub low_storm_kp: f64,
    /// See `low_storm_kp`.
    pub low_storm_factor: f64,
    /// Mid-latitude storm-time threshold (pre-registration: Kp ≥ 7).
    pub mid_storm_kp: f64,
    /// Mid-latitude score at and above the threshold, and its quiet-time slope per unit Kp.
    pub mid_storm_b: f64,
    /// See `mid_storm_b`.
    pub mid_quiet_per_kp: f64,
}

impl EnvBaselineParams {
    /// The pre-registered constants (version 1).
    pub fn v1() -> EnvBaselineParams {
        EnvBaselineParams {
            high_lat_deg: 55.0,
            low_lat_deg: 20.0,
            oval_edge_kp0_deg: 67.0,
            oval_edge_per_kp_deg: 2.0,
            oval_edge_width_deg: 2.0,
            high_kp_full: 5.0,
            low_slt_window_h: [19.0, 2.0],
            low_f107_range: [70.0, 200.0],
            low_solstice_factor: 0.4,
            low_storm_kp: 6.0,
            low_storm_factor: 0.5,
            mid_storm_kp: 7.0,
            mid_storm_b: 0.8,
            mid_quiet_per_kp: 0.03,
        }
    }
}

/// The dipole latitude of a site at a date, degrees.
pub fn dipole_latitude_deg(lat_deg: f64, lon_deg: f64, year: f64) -> f64 {
    let (plat, plon) = geomagnetic_north_pole(year);
    let unit = |la: f64, lo: f64| {
        let (la, lo) = (la.to_radians(), lo.to_radians());
        [la.cos() * lo.cos(), la.cos() * lo.sin(), la.sin()]
    };
    let (r, m) = (unit(lat_deg, lon_deg), unit(plat, plon));
    (r[0] * m[0] + r[1] * m[1] + r[2] * m[2])
        .clamp(-1.0, 1.0)
        .asin()
        .to_degrees()
}

fn smoothstep(x: f64) -> f64 {
    let x = x.clamp(0.0, 1.0);
    x * x * (3.0 - 2.0 * x)
}

fn in_window(h: f64, [a, b]: [f64; 2]) -> bool {
    if a <= b {
        h >= a && h < b
    } else {
        h >= a || h < b
    }
}

/// The baseline for one site-hour with constants `p`.
pub fn baseline_with(s: &SiteHour, p: &EnvBaselineParams) -> Baseline {
    let phi = dipole_latitude_deg(s.lat_deg, s.lon_deg, s.year);
    let a = phi.abs();
    let slt = (s.ut_hour + s.lon_deg / 15.0).rem_euclid(24.0);
    // Mid latitude: quiet except storm time.
    let mid = if s.kp >= p.mid_storm_kp {
        p.mid_storm_b
    } else {
        (p.mid_quiet_per_kp * s.kp).min(p.mid_storm_b)
    };
    let (b, regime) = if a >= p.high_lat_deg {
        // Inside the oval (poleward of its equatorward edge), weighted by activity.
        let edge = p.oval_edge_kp0_deg - p.oval_edge_per_kp_deg * s.kp;
        let inside = smoothstep(0.5 + (a - edge) / (2.0 * p.oval_edge_width_deg));
        let activity = (s.kp / p.high_kp_full).clamp(0.0, 1.0);
        let hi = inside * activity;
        if hi >= mid {
            (hi, "high")
        } else {
            (mid, "mid")
        }
    } else if a <= p.low_lat_deg {
        let window = if in_window(slt, p.low_slt_window_h) {
            1.0
        } else {
            0.0
        };
        let [f0, f1] = p.low_f107_range;
        let flux = ((s.f107 - f0) / (f1 - f0)).clamp(0.0, 1.0);
        // Season: 1 at the equinoxes (days 80 and 266), the solstice factor at the solstices.
        let w = 2.0 * std::f64::consts::PI * (f64::from(s.doy) - 80.0) / 365.25;
        let season = p.low_solstice_factor + (1.0 - p.low_solstice_factor) * (w.cos() * w.cos());
        let storm = if s.kp >= p.low_storm_kp {
            p.low_storm_factor
        } else {
            1.0
        };
        let lo = window * flux * season * storm;
        if lo >= mid {
            (lo, "low")
        } else {
            (mid, "mid")
        }
    } else {
        (mid, "mid")
    };
    let b = b.clamp(0.0, 1.0);
    let level = if b < 0.33 {
        "quiet"
    } else if b < 0.67 {
        "elevated"
    } else {
        "disturbed"
    };
    Baseline {
        mag_lat_deg: phi,
        slt_h: slt,
        b,
        level: level.into(),
        regime: regime.into(),
    }
}

/// The baseline with the pre-registered constants.
pub fn baseline(s: &SiteHour) -> Baseline {
    baseline_with(s, &EnvBaselineParams::v1())
}

/// A JSON list of site-hours to a JSON list of baselines: the bytes every surface gives.
pub fn baseline_json(site_hours_json: &str) -> Result<String, String> {
    let v: Vec<SiteHour> = serde_json::from_str(site_hours_json)
        .map_err(|e| crate::terr!("e-env-baseline-input", e = e))?;
    let out: Vec<Baseline> = v.iter().map(baseline).collect();
    serde_json::to_string(&out).map_err(|e| e.to_string())
}

#[cfg(test)]
mod tests {
    use super::*;

    fn hour(lat: f64, lon: f64, doy: u32, ut: f64, kp: f64, f107: f64) -> SiteHour {
        SiteHour {
            lat_deg: lat,
            lon_deg: lon,
            year: 2024.5,
            doy,
            ut_hour: ut,
            kp,
            f107,
        }
    }

    #[test]
    fn dipole_latitude_is_90_at_the_pole_and_near_geographic_elsewhere() {
        let (plat, plon) = geomagnetic_north_pole(2024.5);
        assert!((dipole_latitude_deg(plat, plon, 2024.5) - 90.0).abs() < 1e-9);
        // Western Europe sits a few degrees below its geographic latitude (dipole tilt toward Canada).
        let ph = dipole_latitude_deg(52.0, 0.0, 2024.5);
        assert!(ph > 45.0 && ph < 55.0, "{ph}");
    }

    #[test]
    fn regimes_on_synthetic_inputs() {
        // High latitude (Tromsø-like): quiet at Kp 1, disturbed at Kp 6.
        let q = baseline(&hour(69.7, 19.0, 100, 22.0, 1.0, 120.0));
        let s = baseline(&hour(69.7, 19.0, 100, 22.0, 6.0, 120.0));
        assert_eq!(q.level, "quiet");
        assert_eq!(s.level, "disturbed");
        // The oval moves equatorward with Kp: a 60° dipole-latitude site joins it only at high Kp.
        let lo = baseline(&hour(58.0, 100.0, 100, 22.0, 2.0, 120.0));
        assert_eq!(lo.level, "quiet", "{lo:?}");
        // Mid latitude: quiet below Kp 7, disturbed... elevated at least, at Kp 8.
        assert_eq!(
            baseline(&hour(45.0, 10.0, 100, 12.0, 5.0, 120.0)).level,
            "quiet"
        );
        assert_ne!(
            baseline(&hour(45.0, 10.0, 100, 12.0, 8.0, 120.0)).level,
            "quiet"
        );
        // Low latitude: post-sunset at the equinox with high flux, quiet at noon and at low flux.
        let (lat, lon) = (-12.0, -77.0); // near the dip equator in Peru
        let ut_for_slt = |slt: f64| (slt - lon / 15.0).rem_euclid(24.0);
        let night = baseline(&hour(lat, lon, 80, ut_for_slt(21.0), 2.0, 200.0));
        assert_eq!(night.regime, "low");
        assert_eq!(night.level, "disturbed", "{night:?}");
        assert_eq!(
            baseline(&hour(lat, lon, 80, ut_for_slt(12.0), 2.0, 200.0)).level,
            "quiet"
        );
        assert_eq!(
            baseline(&hour(lat, lon, 80, ut_for_slt(21.0), 2.0, 70.0)).level,
            "quiet"
        );
        // Solstice and storm time lower it.
        let sol = baseline(&hour(lat, lon, 172, ut_for_slt(21.0), 2.0, 200.0));
        assert!(sol.b < night.b);
        let storm = baseline(&hour(lat, lon, 80, ut_for_slt(21.0), 6.0, 200.0));
        assert!(storm.b < night.b);
    }

    #[test]
    fn json_round_trip_is_deterministic() {
        let input = serde_json::to_string(&vec![hour(69.7, 19.0, 100, 22.0, 6.0, 120.0)]).unwrap();
        assert_eq!(
            baseline_json(&input).unwrap(),
            baseline_json(&input).unwrap()
        );
        assert!(baseline_json("{").is_err());
    }
}
