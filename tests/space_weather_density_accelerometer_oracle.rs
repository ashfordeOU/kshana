// SPDX-License-Identifier: AGPL-3.0-only
//! Measured oracle for the activity-corrected thermospheric density of the space-weather row
//! ("Space-weather environment & activity-driven thermospheric density", module `space_weather`).
//!
//! Pre-registration (validation 0.30, round 2, batch "sweepA"; written 2026-10-02 before any
//! density file below was fetched and before any comparison was run). The tolerance is the one
//! the 0.30 plan wrote for this row on 2026-09-30, unchanged.
//!
//! Quantity: the orbit-averaged neutral mass density at 400 to 500 km, as predicted by
//! `space_weather::space_weather_density(altitude_m, &SpaceWeather { f107, f107a, kp })` (the
//! static US Standard Atmosphere 1976 profile times the engine's activity factor), against the
//! density measured by satellite accelerometers.
//!
//! Oracle (Measured): the TOLEOS (Thermosphere Observations from Low-Earth Orbiting Satellites)
//! accelerometer-derived density products DNSxACC_2 of Delft University of Technology, CNES, DLR
//! and the University of Bonn, distributed by the ESA (European Space Agency) Swarm DISC (Data,
//! Innovation and Science Cluster) server, https://swarm-diss.eo.esa.int/ under
//! `swarm/Multimission/{CHAMP,GRACE,GRACE-FO}/DNS/` (format: TOLEOS Product Definition Document
//! SW-TN-DUT-GS-129_01 revision 3, 2022-07-12). Variables used: `time`, `altitude` (GRS80, m),
//! `density` (kg/m^3) and `validity_flag` (0 = nominal).
//!
//! Space-weather inputs (fixed now, before any data is read): the GFZ (German Research Centre for
//! Geosciences) file `Kp_ap_Ap_SN_F107_since_1932.txt` (https://kp.gfz.de/, CC BY 4.0).
//! `f107` = observed F10.7 (column F10.7obs) of the previous UTC day; `f107a` = the engine's
//! `space_weather::f107a_centered` (81-day centred mean) of the observed daily series at that
//! previous day; `kp` = the three-hourly Kp of the interval containing t - 6.7 h. The one-day
//! F10.7 lag and the 6.7 h Kp lag are those of the Jacchia 1971 model the engine's exospheric
//! temperature comes from (Jacchia, SAO Special Report 332, 1971).
//!
//! Campaigns (fixed now): days of year 5, 15, 25, ..., 365 (every tenth day) of
//! - solar maximum: CHAMP 2001; GRACE-A (Sat_1) 2002; GRACE-FO 1 (Sat_1) 2024;
//! - solar minimum: GRACE-A (Sat_1) 2008; GRACE-FO 1 (Sat_1) 2019.
//! A day the server does not hold is skipped and listed in the fixture's NOTICE.md.
//!
//! Orbit windows (fixed now): each day is cut into consecutive windows of one Keplerian period
//! P = 2 pi sqrt((6371 km + h_day)^3 / mu), mu = 3.986004418e14 m^3/s^2, h_day the day's mean
//! altitude of valid samples, starting at 00:00 UTC; a trailing partial window is dropped. A
//! window qualifies when at least 80 % of its native-rate samples are valid (flag 0, finite,
//! positive density) and its mean altitude of valid samples lies in [400, 500] km. Measured
//! orbit average = mean of the valid native-rate `density` samples of the window. Engine orbit
//! average = mean of the engine density at the altitudes (and indices) of the valid samples that
//! fall on whole five-minute marks of UTC within the window (decimated to keep the committed
//! fixture small; the engine model is smooth in altitude and time).
//!
//! Tolerance (the plan's, unchanged): every qualifying window of every counted campaign has
//! engine / measured in [0.5, 2.0]. A campaign counts when it has at least 50 qualifying windows;
//! PASS also needs at least one counted solar-minimum and one counted solar-maximum campaign.
//! Reported, not graded: per-campaign median ratio and share of windows inside the factor 2.
//!
//! Discrimination, pre-registered: removing the activity correction (the factor forced to 1, the
//! bare static profile) must turn the test red.
//!
//! Fixture: `tests/fixtures/space_weather_density_accelerometer_oracle/windows.csv`, built by
//! `make_fixture.py` there from the files above (only derived window averages and the decimated
//! altitudes and indices are committed; sources and SHA-256 in NOTICE.md).

use kshana::space_weather::{space_weather_density, SpaceWeather};
use std::path::PathBuf;

const RATIO_LO: f64 = 0.5;
const RATIO_HI: f64 = 2.0;
const MIN_WINDOWS: usize = 50;

fn fixture() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/space_weather_density_accelerometer_oracle/windows.csv")
}

/// One orbit window: the campaign, the phase (`min`/`max`), the measured orbit average and the
/// decimated (altitude, f107, f107a, kp) points the engine is evaluated on.
struct Window {
    campaign: String,
    phase: String,
    start: String,
    measured: f64,
    points: Vec<(f64, f64, f64, f64)>,
}

/// Parses the fixture: one line per window,
/// `campaign,phase,start_utc,mean_alt_km,n_valid,measured_mean,points` where `points` is a
/// `;`-separated list of `alt_m:f107:f107a:kp`.
fn load() -> Option<Vec<Window>> {
    let text = std::fs::read_to_string(fixture()).ok()?;
    let mut out = Vec::new();
    for line in text.lines() {
        if line.starts_with('#') || line.starts_with("campaign") || line.trim().is_empty() {
            continue;
        }
        let f: Vec<&str> = line.split(',').collect();
        assert_eq!(f.len(), 7, "malformed window line: {line}");
        let points = f[6]
            .split(';')
            .map(|p| {
                let v: Vec<f64> = p.split(':').map(|x| x.parse().expect("number")).collect();
                assert_eq!(v.len(), 4, "malformed point {p}");
                (v[0], v[1], v[2], v[3])
            })
            .collect();
        out.push(Window {
            campaign: f[0].to_string(),
            phase: f[1].to_string(),
            start: f[2].to_string(),
            measured: f[5].parse().expect("measured"),
            points,
        });
    }
    Some(out)
}

fn engine_mean(w: &Window) -> f64 {
    let s: f64 = w
        .points
        .iter()
        .map(|&(alt, f107, f107a, kp)| space_weather_density(alt, &SpaceWeather { f107, f107a, kp }))
        .sum();
    s / w.points.len() as f64
}

struct CampaignStat {
    campaign: String,
    phase: String,
    n: usize,
    inside: usize,
    median: f64,
    worst_lo: (f64, String),
    worst_hi: (f64, String),
}

fn stats(windows: &[Window]) -> Vec<CampaignStat> {
    let mut names: Vec<(String, String)> = Vec::new();
    for w in windows {
        if !names.iter().any(|(c, _)| *c == w.campaign) {
            names.push((w.campaign.clone(), w.phase.clone()));
        }
    }
    names
        .into_iter()
        .map(|(c, phase)| {
            let mut r: Vec<(f64, String)> = windows
                .iter()
                .filter(|w| w.campaign == c && !w.points.is_empty())
                .map(|w| (engine_mean(w) / w.measured, w.start.clone()))
                .collect();
            r.sort_by(|a, b| a.0.partial_cmp(&b.0).expect("finite"));
            let n = r.len();
            let inside = r.iter().filter(|x| x.0 >= RATIO_LO && x.0 <= RATIO_HI).count();
            let median = if n > 0 { r[n / 2].0 } else { f64::NAN };
            CampaignStat {
                campaign: c,
                phase,
                n,
                inside,
                median,
                worst_lo: r.first().cloned().unwrap_or((f64::NAN, String::new())),
                worst_hi: r.last().cloned().unwrap_or((f64::NAN, String::new())),
            }
        })
        .collect()
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn activity_corrected_density_within_factor_two() {
    let Some(windows) = load() else {
        eprintln!("SKIP: fixture windows.csv absent (run make_fixture.py)");
        return;
    };
    let st = stats(&windows);
    let mut pass = true;
    let (mut have_min, mut have_max) = (false, false);
    for s in &st {
        eprintln!(
            "{} ({}): {} windows, {} inside [0.5, 2], median ratio {:.3}, lowest {:.3} at {}, highest {:.3} at {}",
            s.campaign, s.phase, s.n, s.inside, s.median, s.worst_lo.0, s.worst_lo.1, s.worst_hi.0, s.worst_hi.1
        );
        if s.n < MIN_WINDOWS {
            continue;
        }
        have_min |= s.phase == "min";
        have_max |= s.phase == "max";
        pass &= s.inside == s.n;
    }
    assert!(have_min && have_max, "need a counted solar-minimum and solar-maximum campaign");
    assert!(pass, "some orbit-averaged densities are outside a factor 2 of the measurement");
}
