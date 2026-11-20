// SPDX-License-Identifier: AGPL-3.0-only
//! Space weather for positioning, navigation and timing (PNT) and for drag: a library of recorded
//! storms, a differential-GNSS (DGNSS/RTK) outage forecaster, a four-dimensional ionosphere that
//! serves both GNSS and low-frequency (LF) skywave propagation, and a scorecard of thermospheric
//! density models against measured densities with a lifetime estimate that carries the density
//! uncertainty. Command: `kshana space-weather` ([`run`]); guide: `docs/SPACE-WEATHER-PNT.md`.
//!
//! * [`storms`]: recorded storms (GFZ Kp, ap and F10.7, CC BY 4.0) and one synthetic stress case,
//!   each as a three-hourly timeline with the NOAA G level, the auroral-oval edge and the
//!   thermospheric density response at chosen altitudes.
//! * [`dgnss`]: per three-hour interval, the expected ionospheric gradient over a site, the
//!   differential error it gives over a baseline, scintillation risk and the work windows in
//!   which neither stops the service. Driven by a storm, by given intervals or by a NOAA SWPC
//!   3-day forecast. MODELLED.
//! * [`iono4d`]: one electron-density field `Ne(lat, lon, h, t)`: a Chapman F layer scaled to a
//!   vertical TEC source (Klobuchar coefficients, a constant, or an IONEX map) and the Wait
//!   exponential D region. Slant TEC is integrated along GNSS rays; the LF reflection height and
//!   the one-hop skywave delay come from the D region of the same field. MODELLED.
//! * [`density`]: the density-model scorecard (static, Jacchia 1971 and NRLMSISE-00 against the
//!   TOLEOS accelerometer densities), the density sensitivity to the solar and geomagnetic
//!   indices, and the orbit lifetime with the combined density uncertainty.
//!
//! Everything this module writes is a machine document (JSON); the evidence label in each says
//! what is modelled and what is compared with measurements.

pub mod density;
pub mod dgnss;
pub mod iono4d;
pub mod storms;

use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// One three-hour interval of geomagnetic and solar activity.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct KpInterval {
    /// Start of the interval, UTC, `YYYY-MM-DDTHH:MM[:SS][Z]`.
    pub start_utc: String,
    /// Planetary Kp over the interval, 0 to 9.
    pub kp: f64,
    /// Daily observed F10.7 (sfu) for the interval's day.
    pub f107: f64,
    /// Centred 81-day mean of F10.7 (sfu); `f107` when absent.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub f107a: Option<f64>,
}

/// A UTC civil time parsed from `YYYY-MM-DD[THH:MM[:SS[.f]]][Z]`.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Utc {
    /// Year.
    pub year: i32,
    /// Month, 1 to 12.
    pub month: u32,
    /// Day of the month.
    pub day: u32,
    /// Hour, 0 to 24.
    pub hour: u32,
    /// Minute.
    pub minute: u32,
    /// Second (may be fractional).
    pub second: f64,
}

impl Utc {
    /// Parse `YYYY-MM-DD`, `YYYY-MM-DDTHH:MM`, `YYYY-MM-DDTHH:MM:SS` (optionally fractional),
    /// each optionally ending in `Z`. `None` for anything else or an impossible date.
    pub fn parse(s: &str) -> Option<Utc> {
        let s = s.trim();
        let s = s.strip_suffix('Z').unwrap_or(s);
        let (date, time) = match s.split_once(['T', ' ']) {
            Some((d, t)) => (d, Some(t)),
            None => (s, None),
        };
        let mut d = date.split('-');
        let year: i32 = d.next()?.parse().ok()?;
        let month: u32 = d.next()?.parse().ok()?;
        let day: u32 = d.next()?.parse().ok()?;
        if d.next().is_some() || !(1..=12).contains(&month) || day == 0 {
            return None;
        }
        if day > days_in_month(year, month) {
            return None;
        }
        let (mut hour, mut minute, mut second) = (0u32, 0u32, 0.0f64);
        if let Some(t) = time {
            let mut p = t.split(':');
            hour = p.next()?.parse().ok()?;
            minute = p.next()?.parse().ok()?;
            if let Some(sec) = p.next() {
                second = sec.parse().ok()?;
            }
            if p.next().is_some() || hour > 24 || minute > 59 || !(0.0..61.0).contains(&second) {
                return None;
            }
        }
        Some(Utc {
            year,
            month,
            day,
            hour,
            minute,
            second,
        })
    }

    /// Modified Julian Date (UTC days; a leap second is not counted).
    pub fn mjd(&self) -> f64 {
        days_from_civil(self.year, self.month, self.day) as f64
            + 40_587.0
            + (f64::from(self.hour) * 3600.0 + f64::from(self.minute) * 60.0 + self.second)
                / 86_400.0
    }

    /// Day of year, 1 to 366.
    pub fn doy(&self) -> i32 {
        (days_from_civil(self.year, self.month, self.day) - days_from_civil(self.year, 1, 1) + 1)
            as i32
    }

    /// Seconds of the UTC day.
    pub fn seconds_of_day(&self) -> f64 {
        f64::from(self.hour) * 3600.0 + f64::from(self.minute) * 60.0 + self.second
    }

    /// Decimal year (for the geomagnetic dipole).
    pub fn decimal_year(&self) -> f64 {
        let len = if days_in_month(self.year, 2) == 29 {
            366.0
        } else {
            365.0
        };
        f64::from(self.year) + (f64::from(self.doy() - 1) + self.seconds_of_day() / 86_400.0) / len
    }

    /// The civil time `mjd` days after the MJD epoch (whole seconds).
    pub fn from_mjd(mjd: f64) -> Utc {
        let day = mjd.floor();
        let mut sec = ((mjd - day) * 86_400.0).round();
        let mut z = day as i64 - 40_587;
        if sec >= 86_400.0 {
            sec -= 86_400.0;
            z += 1;
        }
        let (year, month, d) = civil_from_days(z);
        let s = sec as u32;
        Utc {
            year,
            month,
            day: d,
            hour: s / 3600,
            minute: (s % 3600) / 60,
            second: f64::from(s % 60),
        }
    }

    /// `YYYY-MM-DDTHH:MM:SSZ` (whole seconds).
    pub fn iso(&self) -> String {
        format!(
            "{:04}-{:02}-{:02}T{:02}:{:02}:{:02}Z",
            self.year,
            self.month,
            self.day,
            self.hour,
            self.minute,
            self.second.floor() as u32
        )
    }
}

fn days_in_month(y: i32, m: u32) -> u32 {
    match m {
        1 | 3 | 5 | 7 | 8 | 10 | 12 => 31,
        4 | 6 | 9 | 11 => 30,
        _ if (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 => 29,
        _ => 28,
    }
}

/// Days since 1970-01-01 of a proleptic Gregorian date (H. Hinnant's algorithm).
fn days_from_civil(y: i32, m: u32, d: u32) -> i64 {
    let y = i64::from(y) - i64::from(m <= 2);
    let era = y.div_euclid(400);
    let yoe = y - era * 400;
    let mp = (i64::from(m) + 9) % 12;
    let doy = (153 * mp + 2) / 5 + i64::from(d) - 1;
    let doe = yoe * 365 + yoe / 4 - yoe / 100 + doy;
    era * 146_097 + doe - 719_468
}

fn civil_from_days(z: i64) -> (i32, u32, u32) {
    let z = z + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z - era * 146_097;
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    let y = yoe + era * 400 + i64::from(m <= 2);
    (y as i32, m, d)
}

/// The NOAA geomagnetic storm level of a Kp value: `G1` at Kp 5, `G2` at 6, `G3` at 7, `G4` at 8
/// including 9-, `G5` at 9 (NOAA Space Weather Scales). A Kp in thirds counts at its nearest
/// whole step (5- is G1), except 9- which the scale puts in G4. `None` below Kp 5-.
pub fn noaa_g_level(kp: f64) -> Option<&'static str> {
    // Thirds: 4.667 = 5-, 8.667 = 9-, 9.0 = 9o.
    if kp >= 8.9 {
        Some("G5")
    } else if kp >= 7.5 {
        Some("G4")
    } else if kp >= 6.5 {
        Some("G3")
    } else if kp >= 5.5 {
        Some("G2")
    } else if kp >= 4.5 {
        Some("G1")
    } else {
        None
    }
}

/// Cosine of the solar zenith angle at a place and UTC Modified Julian Date (low-precision Sun,
/// [`crate::space_weather::sun_declination_rad`]; the hour angle from the mean solar time, without
/// the equation of time, so up to about 4 degrees of hour angle off).
pub fn cos_solar_zenith(lat_deg: f64, lon_deg: f64, mjd: f64) -> f64 {
    let decl = crate::space_weather::sun_declination_rad(mjd);
    let ut_h = (mjd - mjd.floor()) * 24.0;
    let hour_angle = ((ut_h + lon_deg / 15.0) - 12.0) * std::f64::consts::PI / 12.0;
    let lat = lat_deg.to_radians();
    lat.psin() * decl.psin() + lat.pcos() * decl.pcos() * hour_angle.pcos()
}

/// `kshana space-weather <command> ...`: see [`USAGE_ID`]. Prints a JSON document on standard
/// output.
#[cfg(not(target_arch = "wasm32"))]
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("space-weather-pnt-usage");
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| format!("{p}: {e}"));
    let flag = |name: &str| -> Option<&String> {
        args.iter()
            .position(|a| a == name)
            .and_then(|i| args.get(i + 1))
    };
    let doc = match args.first().map(String::as_str) {
        Some("storms") if args.len() == 1 => storms::list_json(),
        Some("storm") => {
            let id = args
                .get(1)
                .filter(|a| !a.starts_with("--"))
                .ok_or_else(usage)?;
            let alts = match flag("--altitudes") {
                Some(s) => parse_list(s).ok_or_else(usage)?,
                None => storms::DEFAULT_ALTITUDES_KM.to_vec(),
            };
            storms::timeline_json(id, &alts)?
        }
        Some("dgnss") => {
            let path = args
                .get(1)
                .filter(|a| !a.starts_with("--"))
                .ok_or_else(usage)?;
            let forecast = match flag("--forecast") {
                Some(p) => Some(read(p)?),
                None => None,
            };
            dgnss::forecast_json(&read(path)?, forecast.as_deref())?
        }
        Some("iono") => {
            let path = args
                .get(1)
                .filter(|a| !a.starts_with("--"))
                .ok_or_else(usage)?;
            let ionex = match flag("--ionex") {
                Some(p) => Some(read(p)?),
                None => None,
            };
            iono4d::model_json(&read(path)?, ionex.as_deref())?
        }
        Some("density-scorecard") if args.len() == 2 => density::scorecard_json(&read(&args[1])?)?,
        Some("lifetime") if args.len() == 2 => density::lifetime_json(&read(&args[1])?)?,
        _ => return Err(usage()),
    };
    println!("{doc}");
    Ok(())
}

/// The message id of the command's usage text.
pub const USAGE_ID: &str = "space-weather-pnt-usage";

fn parse_list(s: &str) -> Option<Vec<f64>> {
    let v: Option<Vec<f64>> = s.split(',').map(|x| x.trim().parse().ok()).collect();
    v.filter(|v| !v.is_empty() && v.iter().all(|x| x.is_finite() && *x > 0.0))
}

/// A finite number in `[lo, hi]`, or the out-of-range error naming the field.
pub(crate) fn check(field: &str, v: f64, lo: f64, hi: f64) -> Result<f64, String> {
    if v.is_finite() && v >= lo && v <= hi {
        Ok(v)
    } else {
        Err(crate::terr!(
            "e-space-weather-pnt-out-of-range",
            field = field,
            lo = lo,
            hi = hi
        ))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn utc_parses_and_round_trips_through_mjd() {
        let t = Utc::parse("2025-11-12T03:00Z").unwrap();
        assert_eq!(t.doy(), 316);
        // MJD of 2025-11-12 00:00 UTC is 60991.
        assert!((t.mjd() - 60_991.125).abs() < 1e-9, "{}", t.mjd());
        assert_eq!(Utc::from_mjd(t.mjd()).iso(), "2025-11-12T03:00:00Z");
        assert_eq!(Utc::parse("2000-01-01").unwrap().mjd(), 51_544.0);
        assert_eq!(Utc::parse("2024-02-29T23:59:59").unwrap().doy(), 60);
        for bad in [
            "2023-02-29",
            "2025-13-01",
            "2025-11-12T25:00",
            "x",
            "2025-11",
        ] {
            assert!(Utc::parse(bad).is_none(), "{bad}");
        }
    }

    #[test]
    fn noaa_levels_follow_the_scale() {
        assert_eq!(noaa_g_level(4.333), None);
        assert_eq!(noaa_g_level(4.667), Some("G1"));
        assert_eq!(noaa_g_level(6.0), Some("G2"));
        assert_eq!(noaa_g_level(7.333), Some("G3"));
        assert_eq!(noaa_g_level(8.667), Some("G4"));
        assert_eq!(noaa_g_level(9.0), Some("G5"));
    }

    #[test]
    fn solar_zenith_is_overhead_at_the_subsolar_point() {
        // Equinox noon on the Greenwich meridian: the Sun is within a few degrees of the zenith.
        let mjd = Utc::parse("2024-03-20T12:00Z").unwrap().mjd();
        assert!(cos_solar_zenith(0.0, 0.0, mjd) > 0.99);
        assert!(cos_solar_zenith(0.0, 180.0, mjd) < -0.99);
    }
}
