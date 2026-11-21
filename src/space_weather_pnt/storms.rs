// SPDX-License-Identifier: AGPL-3.0-only
//! The storm library: recorded geomagnetic storms as three-hourly Kp/ap with the daily F10.7, and
//! one synthetic stress case, embedded from `data/space-weather/storms.json`.
//!
//! The recorded days are copied from the GFZ file `Kp_ap_Ap_SN_F107_since_1932.txt`
//! (https://kp.gfz.de/, CC BY 4.0; Matzka et al. 2021, Space Weather 19, e2020SW002641) by
//! `data/space-weather/make_storms.py`, which also computes the centred 81-day F10.7 mean; the
//! file's SHA-256 on the day it was read is in the JSON. The synthetic case is marked
//! `synthetic: true` and is not an observation.
//!
//! [`timeline`] turns a storm into three-hour rows: the NOAA G level, the equatorward edge of the
//! auroral oval (the constants of [`crate::env_baseline::EnvBaselineParams::v1`]), and the neutral
//! density at chosen altitudes from the Jacchia 1971 diurnal-mean profile
//! ([`crate::space_weather::space_weather_density`]) and from NRLMSISE-00 averaged over latitude
//! and local time with its three-hourly ap history, each also as a ratio to the storm's first
//! interval: how much the storm raised the drag. The densities are MODELLED.

use super::{noaa_g_level, KpInterval, Utc};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};
use std::sync::OnceLock;

const STORMS_JSON: &str = include_str!("../../data/space-weather/storms.json");

/// Altitudes (km) of the density rows when none are asked for: the Starlink deployment altitude
/// of February 2022 (about 210 km) and a typical low-Earth-orbit altitude.
pub const DEFAULT_ALTITUDES_KM: [f64; 2] = [210.0, 400.0];

/// One UT day of a storm record.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StormDay {
    /// `YYYY-MM-DD`.
    pub date: String,
    /// Kp of the eight three-hour intervals (00-03 UT first).
    pub kp: [f64; 8],
    /// ap of the eight intervals (units of 2 nT).
    pub ap: [f64; 8],
    /// Daily Ap.
    pub ap_daily: f64,
    /// Observed F10.7 (sfu).
    pub f107: f64,
    /// Centred 81-day mean of the observed F10.7 (sfu).
    pub f107a: f64,
    /// Whether GFZ marks the day's Kp definitive.
    pub definitive: bool,
}

/// One storm.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Storm {
    /// Library id (`kshana space-weather storm <id>`).
    pub id: String,
    /// Human-readable name.
    pub name: String,
    /// A short factual note with its source.
    pub context: String,
    /// True for a constructed stress case that was never observed.
    pub synthetic: bool,
    /// The UT days, in order.
    pub days: Vec<StormDay>,
}

/// The embedded library.
#[derive(Clone, Debug, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct StormLibrary {
    /// Format tag, `kshana.storms/1`.
    pub format: String,
    /// Data source and licence.
    pub source: String,
    /// SHA-256 of the source file on the day it was read.
    pub source_sha256: String,
    /// The storms.
    pub storms: Vec<Storm>,
}

/// The embedded library, parsed once.
pub fn library() -> &'static StormLibrary {
    static LIB: OnceLock<StormLibrary> = OnceLock::new();
    LIB.get_or_init(|| serde_json::from_str(STORMS_JSON).expect("embedded storms.json parses"))
}

/// The storm with this id.
pub fn storm(id: &str) -> Result<&'static Storm, String> {
    library()
        .storms
        .iter()
        .find(|s| s.id == id)
        .ok_or_else(|| crate::terr!("e-space-weather-pnt-unknown-storm", id = id))
}

impl Storm {
    /// The three-hour intervals of the storm, in order.
    pub fn intervals(&self) -> Vec<KpInterval> {
        let mut out = Vec::with_capacity(self.days.len() * 8);
        for d in &self.days {
            for (j, &kp) in d.kp.iter().enumerate() {
                out.push(KpInterval {
                    start_utc: format!("{}T{:02}:00:00Z", d.date, 3 * j),
                    kp,
                    f107: d.f107,
                    f107a: Some(d.f107a),
                });
            }
        }
        out
    }

    /// The three-hourly ap series, in the order of [`Storm::intervals`].
    pub fn ap_series(&self) -> Vec<f64> {
        self.days.iter().flat_map(|d| d.ap).collect()
    }

    /// The largest Kp of the storm.
    pub fn peak_kp(&self) -> f64 {
        self.days.iter().flat_map(|d| d.kp).fold(0.0, f64::max)
    }
}

/// `kshana space-weather storms`: the library's storms with their peak Kp and NOAA level.
pub fn list_json() -> String {
    let lib = library();
    let storms: Vec<serde_json::Value> = lib
        .storms
        .iter()
        .map(|s| {
            serde_json::json!({
                "id": s.id,
                "name": s.name,
                "first_day": s.days.first().map(|d| d.date.as_str()),
                "last_day": s.days.last().map(|d| d.date.as_str()),
                "peak_kp": s.peak_kp(),
                "noaa_level": noaa_g_level(s.peak_kp()),
                "synthetic": s.synthetic,
                "context": s.context,
            })
        })
        .collect();
    let doc = serde_json::json!({
        "format": "kshana.space-weather.storms/1",
        "source": lib.source,
        "source_sha256": lib.source_sha256,
        "storms": storms,
    });
    serde_json::to_string_pretty(&doc).expect("serialise")
}

/// The NRLMSISE-00 3-hourly ap history (switch 9 = -1) at interval `i` of the series `ap`, with
/// the daily Ap `ap_daily`: the daily Ap; the ap now and 3, 6 and 9 hours before; the mean of the
/// eight ap from 12 to 33 hours before; and of the eight from 36 to 57 hours before. Before the
/// start of the series the first value stands in.
pub fn msis_ap_array(ap: &[f64], i: usize, ap_daily: f64) -> [f64; 7] {
    let at = |k: usize| ap[i.saturating_sub(k)];
    let mean = |a: usize| (a..a + 8).map(at).sum::<f64>() / 8.0;
    [ap_daily, at(0), at(1), at(2), at(3), mean(4), mean(12)]
}

/// NRLMSISE-00 total mass density (kg/m^3) at `alt_km`, averaged over latitude (-60 to 60 degrees
/// in steps of 30, weighted by the cosine of latitude) and local solar time (every 3 hours), at
/// UTC `mjd`, with the 3-hourly ap history `ap_array` (switch 9 = -1).
pub fn msis_global_mean(alt_km: f64, mjd: f64, f107: f64, f107a: f64, ap_array: [f64; 7]) -> f64 {
    let t = Utc::from_mjd(mjd);
    let sec = t.seconds_of_day();
    let mut flags = crate::nrlmsise00::Flags::default();
    flags.switches[9] = -1;
    let (mut sum, mut wsum) = (0.0, 0.0);
    for lat in [-60.0f64, -30.0, 0.0, 30.0, 60.0] {
        let w = lat.to_radians().pcos();
        for k in 0..8 {
            let lst = 3.0 * f64::from(k);
            let lon = ((lst - sec / 3600.0) * 15.0).rem_euclid(360.0);
            let input = crate::nrlmsise00::Input {
                doy: t.doy(),
                sec,
                alt_km,
                g_lat_deg: lat,
                g_long_deg: lon,
                lst_h: lst,
                f107a,
                f107,
                ap: ap_array[0],
                ap_array: Some(ap_array),
            };
            sum += w * crate::nrlmsise00::gtd7d(&input, &flags).d[5];
            wsum += w;
        }
    }
    sum / wsum
}

/// One row of a storm timeline.
#[derive(Clone, Debug, Serialize)]
pub struct TimelineRow {
    /// Interval start, UTC.
    pub start_utc: String,
    /// Kp of the interval.
    pub kp: f64,
    /// ap of the interval.
    pub ap: f64,
    /// NOAA G level of the Kp.
    pub noaa_level: Option<&'static str>,
    /// F10.7 of the previous UT day (the day's own on the first day), sfu.
    pub f107_previous_day: f64,
    /// Centred 81-day mean F10.7 (sfu).
    pub f107a: f64,
    /// Equatorward edge of the auroral oval, dipole latitude (deg).
    pub oval_edge_mag_lat_deg: f64,
    /// Jacchia 1971 nighttime-minimum exospheric temperature (K).
    pub exospheric_temperature_k: f64,
    /// Per altitude: `[altitude_km, j71_mean_kg_m3, j71_ratio, msis_mean_kg_m3, msis_ratio]`.
    pub density: Vec<[f64; 5]>,
}

/// The timeline of a storm at the given altitudes (km).
pub fn timeline(s: &Storm, altitudes_km: &[f64]) -> Vec<TimelineRow> {
    let p = crate::env_baseline::EnvBaselineParams::v1();
    let ap = s.ap_series();
    let ivs = s.intervals();
    let mut rows: Vec<TimelineRow> = Vec::with_capacity(ivs.len());
    for (i, iv) in ivs.iter().enumerate() {
        let day = i / 8;
        let d = &s.days[day];
        let f107_prev = if day == 0 {
            d.f107
        } else {
            s.days[day - 1].f107
        };
        let mjd = Utc::parse(&iv.start_utc)
            .expect("library dates parse")
            .mjd()
            + 1.5 / 24.0;
        let sw = crate::space_weather::SpaceWeather {
            f107: f107_prev,
            f107a: d.f107a,
            kp: iv.kp,
        };
        let ap_arr = msis_ap_array(&ap, i, d.ap_daily);
        let density = altitudes_km
            .iter()
            .map(|&h| {
                let j = crate::space_weather::space_weather_density(h * 1000.0, &sw);
                let m = msis_global_mean(h, mjd, f107_prev, d.f107a, ap_arr);
                [h, j, 1.0, m, 1.0]
            })
            .collect();
        rows.push(TimelineRow {
            start_utc: iv.start_utc.clone(),
            kp: iv.kp,
            ap: ap[i],
            noaa_level: noaa_g_level(iv.kp),
            f107_previous_day: f107_prev,
            f107a: d.f107a,
            oval_edge_mag_lat_deg: p.oval_edge_kp0_deg - p.oval_edge_per_kp_deg * iv.kp,
            exospheric_temperature_k: sw.exospheric_temperature(),
            density,
        });
    }
    if let Some(first) = rows.first().map(|r| r.density.clone()) {
        for r in &mut rows {
            for (row, f) in r.density.iter_mut().zip(&first) {
                row[2] = row[1] / f[1];
                row[4] = row[3] / f[3];
            }
        }
    }
    rows
}

/// `kshana space-weather storm <id> [--altitudes a,b,...]`: the storm's timeline as JSON.
pub fn timeline_json(id: &str, altitudes_km: &[f64]) -> Result<String, String> {
    let s = storm(id)?;
    for &h in altitudes_km {
        super::check("altitudes", h, 100.0, 1000.0)?;
    }
    let rows = timeline(s, altitudes_km);
    let peak = |col: usize| {
        altitudes_km
            .iter()
            .enumerate()
            .map(|(k, &h)| {
                let (r, at) = rows
                    .iter()
                    .map(|r| (r.density[k][col], r.start_utc.as_str()))
                    .fold((0.0, ""), |a, b| if b.0 > a.0 { b } else { a });
                serde_json::json!({"altitude_km": h, "ratio": r, "at": at})
            })
            .collect::<Vec<_>>()
    };
    let doc = serde_json::json!({
        "format": "kshana.space-weather.storm/1",
        "label": if s.synthetic {
            "MODELLED on SYNTHETIC indices: a constructed stress case, not an observed storm"
        } else {
            "MODELLED on recorded indices: the Kp, ap and F10.7 are GFZ's; the oval edge and the \
             densities are models (Jacchia 1971 diurnal mean; NRLMSISE-00 averaged over latitude \
             and local time), not measurements"
        },
        "id": s.id,
        "name": s.name,
        "context": s.context,
        "synthetic": s.synthetic,
        "source": library().source,
        "peak_kp": s.peak_kp(),
        "noaa_level": noaa_g_level(s.peak_kp()),
        "density_columns": ["altitude_km", "j71_mean_kg_m3", "j71_ratio_to_first",
                            "msis_mean_kg_m3", "msis_ratio_to_first"],
        "peak_density_ratio_j71": peak(2),
        "peak_density_ratio_msis": peak(4),
        "rows": rows,
    });
    Ok(serde_json::to_string_pretty(&doc).expect("serialise"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_library_parses_and_every_storm_is_complete() {
        let lib = library();
        assert_eq!(lib.format, "kshana.storms/1");
        assert!(lib.storms.len() >= 8);
        for s in &lib.storms {
            assert!(!s.days.is_empty(), "{}", s.id);
            for d in &s.days {
                assert!(Utc::parse(&d.date).is_some(), "{} {}", s.id, d.date);
                assert!(d.kp.iter().all(|k| (0.0..=9.0).contains(k)));
                // ap is the definitional table value of each Kp.
                for (k, a) in d.kp.iter().zip(d.ap) {
                    assert_eq!(
                        crate::space_weather::ap_from_kp(*k),
                        a,
                        "{} {}",
                        s.id,
                        d.date
                    );
                }
                assert!(d.f107 > 50.0 && d.f107a > 50.0);
            }
            assert_eq!(s.intervals().len(), 8 * s.days.len());
        }
        assert!(storm("synthetic-extreme").unwrap().synthetic);
        assert!(storm("no-such-storm").is_err());
    }

    #[test]
    fn the_november_2025_storm_peaks_at_g4_on_the_twelfth() {
        let s = storm("2025-11-12").unwrap();
        assert_eq!(noaa_g_level(s.peak_kp()), Some("G4"));
        let ivs = s.intervals();
        let peak = ivs.iter().max_by(|a, b| a.kp.total_cmp(&b.kp)).unwrap();
        assert!(
            peak.start_utc.starts_with("2025-11-12T0"),
            "{}",
            peak.start_utc
        );
        assert_eq!(
            noaa_g_level(storm("2024-05-gannon").unwrap().peak_kp()),
            Some("G5")
        );
        assert_eq!(
            noaa_g_level(storm("2022-02-starlink").unwrap().peak_kp()),
            Some("G1")
        );
    }

    #[test]
    fn the_ap_history_follows_the_series_and_clamps_at_its_start() {
        let ap: Vec<f64> = (0..20).map(f64::from).collect();
        let a = msis_ap_array(&ap, 19, 7.0);
        assert_eq!(&a[..5], &[7.0, 19.0, 18.0, 17.0, 16.0]);
        assert_eq!(a[5], (8..16).sum::<i32>() as f64 / 8.0);
        let b = msis_ap_array(&ap, 2, 7.0);
        assert_eq!(&b[1..5], &[2.0, 1.0, 0.0, 0.0]);
    }

    #[test]
    fn the_february_2022_minor_storm_raises_the_density_at_210_km() {
        // MODELLED: both models put the storm-time density at the 2022 Starlink deployment
        // altitude above the quiet 1 February value.
        let s = storm("2022-02-starlink").unwrap();
        let rows = timeline(s, &[210.0]);
        let max_msis = rows.iter().map(|r| r.density[0][4]).fold(0.0, f64::max);
        let max_j71 = rows.iter().map(|r| r.density[0][2]).fold(0.0, f64::max);
        assert!(max_msis > 1.1, "NRLMSISE-00 storm/quiet {max_msis}");
        assert!(max_j71 > 1.1, "J71 storm/quiet {max_j71}");
        // And a quiet reference stays near 1.
        let q = timeline(storm("2008-06-quiet").unwrap(), &[210.0]);
        let spread = q
            .iter()
            .map(|r| r.density[0][4])
            .fold(0.0f64, |a, x| a.max((x - 1.0).abs()));
        assert!(spread < 0.25, "quiet spread {spread}");
    }
}
