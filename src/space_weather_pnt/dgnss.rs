// SPDX-License-Identifier: AGPL-3.0-only
//! DGNSS/RTK outage forecaster for planned work windows (for example a subsea operation that needs
//! differential GNSS for its whole duration). MODELLED.
//!
//! For each three-hour interval of Kp and F10.7 (a recorded storm, given intervals, or a NOAA SWPC
//! 3-day forecast) and a site:
//!
//! 1. the environmental baseline score `b` in `[0, 1]` and its regime (high latitude, low
//!    latitude, mid latitude) from [`crate::env_baseline`] at the middle of the interval;
//! 2. the expected vertical ionospheric gradient, interpolated in log space between a nominal and
//!    a storm bound by that score: `g = G_NOMINAL * (G_STORM / G_NOMINAL)^b` (mm of L1 delay per km);
//!    * `G_NOMINAL` = 4 mm/km, the nominal one-sigma vertical ionospheric gradient bound of the
//!      GBAS (LAAS) error model for the conterminous US (Lee, Pullen, Datta-Barua and Enge 2007,
//!      J. Aircraft 44(5));
//!    * `G_STORM` = 425 mm/km, the upper bound of the CONUS ionospheric anomaly threat model
//!      built from the 2000-2004 storms (Datta-Barua et al. 2010, J. Aircraft 47(4));
//!    * the log-linear interpolation by `b` is this module's assumption, not a published model,
//!      and it is not calibrated against outage records;
//! 3. the differential error over the baseline, `g * baseline * M(el)`, with `M` the thin-shell
//!    obliquity factor ([`crate::ionex::obliquity_factor`], 350 km shell) at the reference
//!    elevation, as a one-sigma L1 delay difference (m);
//! 4. scintillation risk when the baseline is `disturbed` in the high- or low-latitude regime
//!    (inside the auroral oval, or post-sunset near the magnetic equator);
//! 5. an outage when the differential error passes the limit, or, for RTK, on scintillation risk
//!    (carrier-phase tracking and ambiguity resolution are lost first). An outage is
//!    `storm_driven` when the same baseline would be within the limit at `b = 0`.
//!
//! The work windows are the runs of intervals with no outage; those at least as long as the
//! operation are marked usable.

use super::{check, noaa_g_level, storms, KpInterval, Utc};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

/// Nominal one-sigma vertical ionospheric gradient (mm/km): Lee et al. (2007).
pub const G_NOMINAL_MM_PER_KM: f64 = 4.0;
/// Storm upper bound of the gradient (mm/km): Datta-Barua et al. (2010).
pub const G_STORM_MM_PER_KM: f64 = 425.0;
/// Thin-shell height (km) for the obliquity factor.
pub const SHELL_KM: f64 = 350.0;

/// The receiver mode.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum Mode {
    /// Code-phase DGNSS (for example maritime beacons or a correction service).
    Dgnss,
    /// Carrier-phase RTK from one base station.
    Rtk,
}

impl Mode {
    /// The default one-sigma differential error limit (m): 1 m for DGNSS; 0.25 m for RTK, about
    /// a quarter of the 0.86 m wide-lane (L1-L2) wavelength whose ambiguities RTK resolves first,
    /// beyond which ambiguity resolution is unreliable. Set `limit_m` for a receiver's own figure.
    pub fn default_limit_m(self) -> f64 {
        match self {
            Mode::Dgnss => 1.0,
            Mode::Rtk => 0.25,
        }
    }
}

/// A site.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Site {
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// East longitude (deg).
    pub lon_deg: f64,
    /// An optional label.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub name: Option<String>,
}

/// The forecaster's request (`kshana space-weather dgnss <request.json>`).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Request {
    /// The work site.
    pub site: Site,
    /// The receiver mode.
    pub mode: Mode,
    /// Distance to the reference station (km).
    pub baseline_km: f64,
    /// One-sigma differential error limit (m); the mode's default when absent.
    #[serde(default)]
    pub limit_m: Option<f64>,
    /// Reference elevation (deg) for the obliquity factor; 30 when absent.
    #[serde(default)]
    pub elevation_deg: Option<f64>,
    /// Length of the planned operation (h); 6 when absent.
    #[serde(default)]
    pub operation_hours: Option<f64>,
    /// A storm of the library ([`storms`]).
    #[serde(default)]
    pub storm: Option<String>,
    /// Intervals given directly.
    #[serde(default)]
    pub intervals: Option<Vec<KpInterval>>,
    /// The text of a NOAA SWPC 3-day forecast (or pass it with `--forecast <file>`).
    #[serde(default)]
    pub swpc_forecast: Option<String>,
    /// F10.7 (sfu) to use with a forecast, which carries none; 150 when absent.
    #[serde(default)]
    pub f107: Option<f64>,
}

/// One interval of the forecast.
#[derive(Clone, Debug, Serialize)]
pub struct Row {
    /// Interval start, UTC.
    pub start_utc: String,
    /// Kp of the interval.
    pub kp: f64,
    /// NOAA G level of the Kp.
    pub noaa_level: Option<&'static str>,
    /// Dipole latitude of the site (deg).
    pub mag_lat_deg: f64,
    /// Environmental-baseline score, 0 to 1.
    pub baseline_score: f64,
    /// `quiet`, `elevated` or `disturbed`.
    pub baseline_level: String,
    /// `high`, `low` or `mid` latitude regime.
    pub regime: String,
    /// Modelled vertical ionospheric gradient (mm/km).
    pub gradient_mm_per_km: f64,
    /// Modelled one-sigma differential L1 error over the baseline (m).
    pub differential_error_m: f64,
    /// Scintillation risk (disturbed, high- or low-latitude regime).
    pub scintillation_risk: bool,
    /// Whether the service is out in this interval.
    pub outage: bool,
    /// `gradient`, `scintillation` or `None`.
    pub reason: Option<&'static str>,
    /// An outage that the same baseline would not have at b = 0.
    pub storm_driven: bool,
}

/// A run of intervals with no outage.
#[derive(Clone, Debug, Serialize)]
pub struct Window {
    /// Window start, UTC.
    pub start_utc: String,
    /// Window end, UTC.
    pub end_utc: String,
    /// Length (h).
    pub hours: f64,
    /// Whether it is at least as long as the operation.
    pub usable: bool,
}

/// The gradient (mm/km) at environmental-baseline score `b`.
pub fn gradient_mm_per_km(b: f64) -> f64 {
    let b = b.clamp(0.0, 1.0);
    G_NOMINAL_MM_PER_KM * (G_STORM_MM_PER_KM / G_NOMINAL_MM_PER_KM).ppowf(b)
}

/// Parse the Kp breakdown of a NOAA SWPC 3-day forecast (`:Product: 3-Day Forecast`) into
/// intervals with F10.7 `f107`. The year comes from the `:Issued:` line; a forecast that runs into
/// January of the next year is handled.
pub fn parse_swpc_3day(text: &str, f107: f64) -> Result<Vec<KpInterval>, String> {
    let bad = || crate::terr!("e-space-weather-pnt-not-a-forecast");
    const MONTHS: [&str; 12] = [
        "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec",
    ];
    let year: i32 = text
        .lines()
        .find_map(|l| l.strip_prefix(":Issued:"))
        .and_then(|l| l.split_whitespace().next())
        .and_then(|y| y.parse().ok())
        .ok_or_else(bad)?;
    let mut lines = text.lines();
    let mut days: Vec<(u32, u32)> = Vec::new();
    for l in lines.by_ref() {
        if l.trim_start().starts_with("NOAA Kp index breakdown") {
            break;
        }
    }
    for l in lines.by_ref() {
        let t: Vec<&str> = l.split_whitespace().collect();
        if t.is_empty() {
            continue;
        }
        if t.len().is_multiple_of(2) && t.chunks(2).all(|c| MONTHS.contains(&c[0])) {
            for c in t.chunks(2) {
                let m = MONTHS.iter().position(|x| *x == c[0]).ok_or_else(bad)? as u32 + 1;
                days.push((m, c[1].parse().map_err(|_| bad())?));
            }
            break;
        }
        return Err(bad());
    }
    if days.is_empty() {
        return Err(bad());
    }
    let mut table: Vec<Vec<f64>> = Vec::new();
    for l in lines {
        let l = l.trim();
        let Some((slot, rest)) = l.split_once("UT") else {
            if table.is_empty() {
                continue;
            }
            break;
        };
        if slot.len() != 5 || !slot.as_bytes()[2].eq(&b'-') {
            break;
        }
        // Values may carry a NOAA scale note, as in "5.00 (G1)".
        let vals: Vec<f64> = rest
            .split_whitespace()
            .filter(|w| !w.starts_with('('))
            .map(|w| w.parse::<f64>())
            .collect::<Result<_, _>>()
            .map_err(|_| bad())?;
        if vals.len() != days.len() {
            return Err(bad());
        }
        table.push(vals);
    }
    if table.len() != 8 {
        return Err(bad());
    }
    let mut out = Vec::with_capacity(8 * days.len());
    let mut y = year;
    let mut last_month = days[0].0;
    for (k, &(m, d)) in days.iter().enumerate() {
        if m < last_month {
            y += 1;
        }
        last_month = m;
        for (j, row) in table.iter().enumerate() {
            let kp = check("kp", row[k], 0.0, 9.0)?;
            out.push(KpInterval {
                start_utc: format!("{y:04}-{m:02}-{d:02}T{:02}:00:00Z", 3 * j),
                kp,
                f107,
                f107a: None,
            });
        }
    }
    Ok(out)
}

/// The forecast rows for `intervals` at a request's site and receiver settings.
pub fn forecast(req: &Request, intervals: &[KpInterval]) -> Result<Vec<Row>, String> {
    check("site.lat_deg", req.site.lat_deg, -90.0, 90.0)?;
    check("site.lon_deg", req.site.lon_deg, -180.0, 360.0)?;
    let baseline = check("baseline_km", req.baseline_km, 0.0, 5000.0)?;
    let limit = check(
        "limit_m",
        req.limit_m.unwrap_or(req.mode.default_limit_m()),
        1e-6,
        1e6,
    )?;
    let el = check(
        "elevation_deg",
        req.elevation_deg.unwrap_or(30.0),
        0.0,
        90.0,
    )?;
    let m = crate::ionex::obliquity_factor(90.0 - el, SHELL_KM);
    let quiet_err = gradient_mm_per_km(0.0) * 1e-3 * baseline * m;
    let mut rows = Vec::with_capacity(intervals.len());
    for iv in intervals {
        let t = Utc::parse(&iv.start_utc).ok_or_else(|| {
            crate::terr!("e-space-weather-pnt-bad-time", value = iv.start_utc.clone())
        })?;
        let kp = check("kp", iv.kp, 0.0, 9.0)?;
        let f107 = check("f107", iv.f107, 0.0, 1000.0)?;
        let mid = Utc::from_mjd(t.mjd() + 1.5 / 24.0);
        let b = crate::env_baseline::baseline(&crate::env_baseline::SiteHour {
            lat_deg: req.site.lat_deg,
            lon_deg: req.site.lon_deg,
            year: mid.decimal_year(),
            doy: mid.doy() as u32,
            ut_hour: mid.seconds_of_day() / 3600.0,
            kp,
            f107,
        });
        let g = gradient_mm_per_km(b.b);
        let err = g * 1e-3 * baseline * m;
        let scint = b.level == "disturbed" && (b.regime == "high" || b.regime == "low");
        let reason = if err > limit {
            Some("gradient")
        } else if scint && req.mode == Mode::Rtk {
            Some("scintillation")
        } else {
            None
        };
        rows.push(Row {
            start_utc: t.iso(),
            kp,
            noaa_level: noaa_g_level(kp),
            mag_lat_deg: b.mag_lat_deg,
            baseline_score: b.b,
            baseline_level: b.level,
            regime: b.regime,
            gradient_mm_per_km: g,
            differential_error_m: err,
            scintillation_risk: scint,
            outage: reason.is_some(),
            reason,
            storm_driven: reason.is_some()
                && (reason == Some("scintillation") || quiet_err <= limit),
        });
    }
    Ok(rows)
}

/// The runs of intervals with no outage, each three hours per interval; usable when at least
/// `operation_hours` long. Consecutive intervals must be three hours apart to join one run.
pub fn windows(rows: &[Row], operation_hours: f64) -> Vec<Window> {
    let mut out: Vec<Window> = Vec::new();
    let mut prev_end: Option<f64> = None;
    for r in rows {
        let start = Utc::parse(&r.start_utc)
            .map(|t| t.mjd())
            .unwrap_or(f64::NAN);
        let end = start + 0.125;
        if r.outage {
            prev_end = None;
            continue;
        }
        match (out.last_mut(), prev_end) {
            (Some(w), Some(pe)) if (pe - start).abs() < 1e-6 => {
                w.end_utc = Utc::from_mjd(end).iso();
                w.hours += 3.0;
            }
            _ => out.push(Window {
                start_utc: r.start_utc.clone(),
                end_utc: Utc::from_mjd(end).iso(),
                hours: 3.0,
                usable: false,
            }),
        }
        prev_end = Some(end);
    }
    for w in &mut out {
        w.usable = w.hours + 1e-9 >= operation_hours;
    }
    out
}

/// `kshana space-weather dgnss <request.json> [--forecast <file>]`: the forecast as JSON.
pub fn forecast_json(request_json: &str, forecast_text: Option<&str>) -> Result<String, String> {
    let req: Request = serde_json::from_str(request_json)
        .map_err(|e| crate::terr!("e-space-weather-pnt-request", e = e.to_string()))?;
    let f107 = check("f107", req.f107.unwrap_or(150.0), 0.0, 1000.0)?;
    let op_h = check(
        "operation_hours",
        req.operation_hours.unwrap_or(6.0),
        0.0,
        1e4,
    )?;
    let text = forecast_text.or(req.swpc_forecast.as_deref());
    let (source, intervals) = match (&req.storm, &req.intervals, text) {
        (Some(id), None, None) => (
            format!("storm library: {id}"),
            storms::storm(id)?.intervals(),
        ),
        (None, Some(iv), None) => ("intervals given in the request".to_string(), iv.clone()),
        (None, None, Some(t)) => (
            "NOAA SWPC 3-day forecast".to_string(),
            parse_swpc_3day(t, f107)?,
        ),
        _ => return Err(crate::terr!("e-space-weather-pnt-one-source")),
    };
    if intervals.is_empty() {
        return Err(crate::terr!("e-space-weather-pnt-one-source"));
    }
    let rows = forecast(&req, &intervals)?;
    let wins = windows(&rows, op_h);
    let doc = serde_json::json!({
        "format": "kshana.space-weather.dgnss/1",
        "label": "MODELLED: the gradient is interpolated in log space between the GBAS nominal \
                  bound (4 mm/km) and the CONUS storm threat bound (425 mm/km) by the \
                  environmental-baseline score; the interpolation is an assumption, not \
                  calibrated against outage records",
        "source": source,
        "site": req.site,
        "mode": req.mode,
        "baseline_km": req.baseline_km,
        "limit_m": req.limit_m.unwrap_or(req.mode.default_limit_m()),
        "elevation_deg": req.elevation_deg.unwrap_or(30.0),
        "operation_hours": op_h,
        "intervals": rows.len(),
        "outages": rows.iter().filter(|r| r.outage).count(),
        "storm_driven_outages": rows.iter().filter(|r| r.storm_driven).count(),
        "rows": rows,
        "windows": wins,
        "first_usable_window": wins.iter().find(|w| w.usable),
    });
    Ok(serde_json::to_string_pretty(&doc).expect("serialise"))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn req(lat: f64, lon: f64, mode: Mode, baseline_km: f64) -> Request {
        Request {
            site: Site {
                lat_deg: lat,
                lon_deg: lon,
                name: None,
            },
            mode,
            baseline_km,
            limit_m: None,
            elevation_deg: None,
            operation_hours: None,
            storm: None,
            intervals: None,
            swpc_forecast: None,
            f107: None,
        }
    }

    #[test]
    fn the_gradient_runs_from_the_nominal_to_the_storm_bound() {
        assert!((gradient_mm_per_km(0.0) - 4.0).abs() < 1e-12);
        assert!((gradient_mm_per_km(1.0) - 425.0).abs() < 1e-9);
        assert!(gradient_mm_per_km(0.5) > 4.0 && gradient_mm_per_km(0.5) < 425.0);
        // Geometric mean at b = 1/2.
        assert!((gradient_mm_per_km(0.5) - (4.0f64 * 425.0).sqrt()).abs() < 1e-9);
    }

    #[test]
    fn the_swpc_forecast_parses_with_scale_notes_and_a_year_end() {
        let text = include_str!("../../tests/fixtures/space_weather_pnt/3-day-forecast.txt");
        let iv = parse_swpc_3day(text, 120.0).unwrap();
        assert_eq!(iv.len(), 24);
        assert_eq!(iv[0].start_utc, "2026-11-20T00:00:00Z");
        assert_eq!(iv[0].kp, 3.0);
        assert_eq!(iv[23].start_utc, "2026-11-22T21:00:00Z");
        assert_eq!(iv[23].kp, 3.0);
        let noted = "\
:Product: 3-Day Forecast
:Issued: 2025 Dec 30 1230 UTC
NOAA Kp index breakdown Dec 31-Jan 02 2026

             Dec 31       Jan 01       Jan 02
00-03UT       5.00 (G1)    2.33         2.33
03-06UT       6.00 (G2)    2.67         2.00
06-09UT       2.67         2.00         2.00
09-12UT       2.33         2.00         2.67
12-15UT       1.67         1.33         3.67
15-18UT       2.67         2.00         2.67
18-21UT       2.67         2.00         2.67
21-00UT       3.00         2.33         3.00

Rationale: none.
";
        let iv = parse_swpc_3day(noted, 150.0).unwrap();
        assert_eq!(iv[0].start_utc, "2025-12-31T00:00:00Z");
        assert_eq!(iv[1].kp, 6.0);
        assert_eq!(iv[8].start_utc, "2026-01-01T00:00:00Z");
        assert!(parse_swpc_3day("not a forecast", 150.0).is_err());
    }

    #[test]
    fn the_november_2025_superstorm_is_reproduced_qualitatively_for_us_farm_rtk() {
        // Acceptance (B3601): a central-Iowa farm on 20 km single-base RTK. The forecaster must
        // flag storm-driven outages in the main phase (00-06 UT on 12 November 2025, the evening
        // of the 11th locally) with metre-level modelled differential errors, the order of the
        // ~30 ft errors reported (RNTF, 10 Sep 2026), and none on the quiet 11 November.
        let r = req(42.0, -93.6, Mode::Rtk, 20.0);
        let rows = forecast(&r, &storms::storm("2025-11-12").unwrap().intervals()).unwrap();
        let at = |s: &str| rows.iter().find(|x| x.start_utc == s).unwrap();
        for s in ["2025-11-12T00:00:00Z", "2025-11-12T03:00:00Z"] {
            let x = at(s);
            assert!(x.outage && x.storm_driven, "{x:?}");
            assert!(x.differential_error_m > 1.0, "{x:?}");
        }
        for x in rows
            .iter()
            .filter(|x| x.start_utc.starts_with("2025-11-11"))
        {
            assert!(!x.outage, "{x:?}");
            assert!(x.differential_error_m < 0.25, "{x:?}");
        }
        let w = windows(&rows, 12.0);
        assert!(w.iter().any(|w| w.usable));
        assert!(w
            .iter()
            .all(|w| !(w.start_utc.as_str() <= "2025-11-12T00:00:00Z"
                && w.end_utc.as_str() > "2025-11-12T00:00:00Z")));
    }

    #[test]
    fn a_high_latitude_site_loses_rtk_to_scintillation_inside_the_oval() {
        // Tromso, Kp 6 at local night: inside the oval, disturbed, scintillation risk. A 200 m
        // baseline keeps the differential error itself inside the RTK limit.
        let r = req(69.65, 18.96, Mode::Rtk, 0.2);
        let iv = vec![KpInterval {
            start_utc: "2024-03-20T21:00Z".into(),
            kp: 6.0,
            f107: 150.0,
            f107a: None,
        }];
        let x = &forecast(&r, &iv).unwrap()[0];
        assert!(x.scintillation_risk && x.outage, "{x:?}");
        assert_eq!(x.reason, Some("scintillation"));
        // Code DGNSS on the same short baseline keeps working: the risk is flagged only.
        let mut d = r.clone_for(Mode::Dgnss);
        d.limit_m = Some(1.0);
        let y = &forecast(&d, &iv).unwrap()[0];
        assert!(y.scintillation_risk && !y.outage, "{y:?}");
    }

    impl Request {
        fn clone_for(&self, mode: Mode) -> Request {
            let mut r = req(self.site.lat_deg, self.site.lon_deg, mode, self.baseline_km);
            r.limit_m = self.limit_m;
            r
        }
    }

    #[test]
    fn windows_join_consecutive_clear_intervals_only() {
        let row = |s: &str, outage: bool| Row {
            start_utc: s.into(),
            kp: 0.0,
            noaa_level: None,
            mag_lat_deg: 0.0,
            baseline_score: 0.0,
            baseline_level: "quiet".into(),
            regime: "mid".into(),
            gradient_mm_per_km: 4.0,
            differential_error_m: 0.0,
            scintillation_risk: false,
            outage,
            reason: None,
            storm_driven: false,
        };
        let rows = vec![
            row("2025-01-01T00:00:00Z", false),
            row("2025-01-01T03:00:00Z", false),
            row("2025-01-01T06:00:00Z", true),
            row("2025-01-01T09:00:00Z", false),
            row("2025-01-01T15:00:00Z", false),
        ];
        let w = windows(&rows, 6.0);
        assert_eq!(w.len(), 3);
        assert_eq!(w[0].hours, 6.0);
        assert!(w[0].usable);
        assert_eq!(w[0].end_utc, "2025-01-01T06:00:00Z");
        assert!(!w[1].usable && !w[2].usable);
    }

    #[test]
    fn exactly_one_source_is_required() {
        let base = r#"{"site":{"lat_deg":50,"lon_deg":0},"mode":"dgnss","baseline_km":100"#;
        assert!(forecast_json(&format!("{base}}}"), None).is_err());
        let both = format!(r#"{base},"storm":"2025-11-12","intervals":[]}}"#);
        assert!(forecast_json(&both, None).is_err());
        let ok = forecast_json(&format!(r#"{base},"storm":"2025-11-12"}}"#), None).unwrap();
        let v: serde_json::Value = serde_json::from_str(&ok).unwrap();
        assert_eq!(v["intervals"], 40);
        assert!(forecast_json(&format!(r#"{base},"storm":"nope"}}"#), None).is_err());
    }
}
