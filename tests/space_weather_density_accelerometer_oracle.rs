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
//!
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
//!
//! First run (2026-10-02, commit after 20eed695; the result was seen before the amendment below
//! was written): FAIL. CHAMP 2001 (max) 521 windows, 514 inside, median ratio 0.795, range
//! 0.403-1.516; GRACE-A 2002 (max) 120 windows, 115 inside, median 0.628, range 0.461-0.860;
//! GRACE-FO 1 2024 (max) 547 windows, 546 inside, median 0.721, range 0.472-1.359; GRACE-A 2008
//! (min) 544 windows, 291 inside, median 1.952, range 0.660-3.696; GRACE-FO 1 2019 (min) has no
//! qualifying window (its altitude is about 506 km, above the 500 km band). The calibrated
//! single-coefficient factor over the static profile is about 2x too dense at solar minimum.
//!
//! Amendment 1 (written 2026-10-02 after the first run above, before the engine change below was
//! written and before it was compared with any density file; tolerance, campaigns, windows,
//! indices and lags unchanged). Engine change: the density becomes the Jacchia 1971 model the
//! engine's exospheric temperature already comes from (Jacchia, "Revised static models of the
//! thermosphere and exosphere with empirical temperature profiles", SAO Special Report 332,
//! 1971), implemented from the report's equations (1)-(25) with no parameter fitted to any
//! measurement: the static diffusion profiles from the 90 km boundary (equations 1-13), the
//! diurnal temperature distribution (15)-(17) from the local solar time and the Sun's declination,
//! the geomagnetic increment (18), the semiannual density variation (21)-(23), the
//! seasonal-latitudinal variation of the lower thermosphere (24) and of helium (25). The
//! implementation is first checked against the report's own printed tables (an engine unit test,
//! tolerance fixed now: every Table 7 log10 density used within 0.01 and every Table 1 diurnal
//! ratio used within 2 in its printed units of 1/1000). The comparison here then evaluates
//! `space_weather::jacchia71_density(alt_m, lat_deg, lst_h, mjd_utc, &SpaceWeather)` at each
//! decimated point, so the fixture gains each point's geodetic latitude, local solar time (the
//! product's `local_solar_time`) and UTC Modified Julian Date; the fixture file is
//! `windows_j71.csv` with points `alt_m:f107:f107a:kp:lat_deg:lst_h:mjd`. The original
//! position-free function `space_weather_density` (re-pointed at the Jacchia 1971 profile at the
//! diurnal-mean temperature, equation 26) is still scored by the original test, unchanged.
//! Discrimination, pre-registered: forcing the J71 profile's exospheric temperature to a constant
//! 1000 K (no activity dependence) must turn the amended test red.
//!
//! Result after the engine change (commit 5cac30a8; run 2026-10-02): FAIL, a finding.
//! Amended (J71 point model): CHAMP 2001 521/521 windows inside, median ratio 1.342 (range
//! 0.833-1.951); GRACE-A 2002 120/120, median 1.266 (0.937-1.908); GRACE-FO 1 2024 526/547,
//! median 1.456 (0.807-3.361, the outliers in the recovery from the 2024-10-10 storm and in
//! August 2024); GRACE-A 2008 (solar minimum) 412/544, median 1.738 (0.391-3.500). Original
//! position-free function (J71 profile at the diurnal-mean temperature): CHAMP 2001 507/521,
//! median 1.419; GRACE-A 2002 120/120, median 1.154; GRACE-FO 1 2024 465/547, median 1.462;
//! GRACE-A 2008 351/544, median 1.828. Jacchia 1971, fitted to 1958-1970 drag data, is about
//! 1.7 times too dense in the deep 2008-2009 solar minimum (a known property of the pre-2000
//! empirical models; Emmert et al. 2010 report record-low densities then) and overshoots in
//! storm recovery; at solar maximum outside storms it agrees within the factor 2.

use kshana::space_weather::{space_weather_density, SpaceWeather};
use std::path::PathBuf;

const RATIO_LO: f64 = 0.5;
const RATIO_HI: f64 = 2.0;
const MIN_WINDOWS: usize = 50;

/// The original comparison reads the first four fields of every point of `windows_j71.csv`
/// (identical, byte for byte, to the `windows.csv` the first run used; the generator writes
/// both from the same loop, so only the larger file is committed).
fn fixture() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv")
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
                assert!(v.len() >= 4, "malformed point {p}");
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
        .map(|&(alt, f107, f107a, kp)| {
            space_weather_density(alt, &SpaceWeather { f107, f107a, kp })
        })
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
            let inside = r
                .iter()
                .filter(|x| x.0 >= RATIO_LO && x.0 <= RATIO_HI)
                .count();
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
#[ignore = "pre-registered; FAIL (finding): before the J71 change GRACE-A 2008 median ratio 1.95, 253 of 544 windows outside a factor 2; with the J71 diurnal-mean profile 193 of 544 outside (median 1.83) and GRACE-FO 2024 82 of 547 outside; see the header"]
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
    assert!(
        have_min && have_max,
        "need a counted solar-minimum and solar-maximum campaign"
    );
    assert!(
        pass,
        "some orbit-averaged densities are outside a factor 2 of the measurement"
    );
}

fn fixture_j71() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv")
}

/// One orbit window of the amended comparison: the measured orbit average and the decimated
/// points (alt_m, f107, f107a, kp, lat_deg, lst_h, mjd).
struct WindowJ71 {
    campaign: String,
    phase: String,
    start: String,
    measured: f64,
    points: Vec<[f64; 7]>,
}

fn load_j71() -> Option<Vec<WindowJ71>> {
    let text = std::fs::read_to_string(fixture_j71()).ok()?;
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
                assert_eq!(v.len(), 7, "malformed point {p}");
                [v[0], v[1], v[2], v[3], v[4], v[5], v[6]]
            })
            .collect();
        out.push(WindowJ71 {
            campaign: f[0].to_string(),
            phase: f[1].to_string(),
            start: f[2].to_string(),
            measured: f[5].parse().expect("measured"),
            points,
        });
    }
    Some(out)
}

fn engine_mean_j71(w: &WindowJ71) -> f64 {
    let s: f64 = w
        .points
        .iter()
        .map(|p| {
            let sw = SpaceWeather {
                f107: p[1],
                f107a: p[2],
                kp: p[3],
            };
            kshana::space_weather::jacchia71_density(p[0], p[4], p[5], p[6], &sw)
        })
        .sum();
    s / w.points.len() as f64
}

#[test]
#[ignore = "pre-registered (amendment 1); FAIL (finding): GRACE-A 2008 132 of 544 windows outside a factor 2 (median ratio 1.74, up to 3.50), GRACE-FO 2024 21 of 547 (up to 3.36); CHAMP 2001 and GRACE-A 2002 all inside"]
fn jacchia71_density_within_factor_two() {
    let Some(windows) = load_j71() else {
        eprintln!("SKIP: fixture windows_j71.csv absent (run make_fixture.py --j71)");
        return;
    };
    let mut names: Vec<(String, String)> = Vec::new();
    for w in &windows {
        if !names.iter().any(|(c, _)| *c == w.campaign) {
            names.push((w.campaign.clone(), w.phase.clone()));
        }
    }
    let mut pass = true;
    let (mut have_min, mut have_max) = (false, false);
    for (c, phase) in names {
        let mut r: Vec<(f64, String)> = windows
            .iter()
            .filter(|w| w.campaign == c && !w.points.is_empty())
            .map(|w| (engine_mean_j71(w) / w.measured, w.start.clone()))
            .collect();
        r.sort_by(|a, b| a.0.partial_cmp(&b.0).expect("finite"));
        let n = r.len();
        let inside = r
            .iter()
            .filter(|x| x.0 >= RATIO_LO && x.0 <= RATIO_HI)
            .count();
        if n > 0 {
            eprintln!(
                "{c} ({phase}): {n} windows, {inside} inside [0.5, 2], median ratio {:.3}, lowest {:.3} at {}, highest {:.3} at {}",
                r[n / 2].0, r[0].0, r[0].1, r[n - 1].0, r[n - 1].1
            );
        }
        if n < MIN_WINDOWS {
            continue;
        }
        have_min |= phase == "min";
        have_max |= phase == "max";
        pass &= inside == n;
    }
    assert!(
        have_min && have_max,
        "need a counted solar-minimum and solar-maximum campaign"
    );
    assert!(
        pass,
        "some orbit-averaged densities are outside a factor 2 of the measurement"
    );
}

/// Pins the finding of the amended comparison so a change to the density model is noticed:
/// the J71 point model keeps every CHAMP 2001 and GRACE-A 2002 orbit average inside a factor 2
/// and sits 1.6-1.9 times above the measured GRACE-A 2008 solar-minimum density (median).
#[test]
fn jacchia71_finding_is_pinned() {
    let Some(windows) = load_j71() else {
        eprintln!("SKIP: fixture windows_j71.csv absent (run make_fixture.py --j71)");
        return;
    };
    let ratios = |c: &str| -> Vec<f64> {
        let mut r: Vec<f64> = windows
            .iter()
            .filter(|w| w.campaign == c)
            .map(|w| engine_mean_j71(w) / w.measured)
            .collect();
        r.sort_by(|a, b| a.partial_cmp(b).expect("finite"));
        r
    };
    for c in ["CHAMP-2001", "GRACE-A-2002"] {
        let r = ratios(c);
        assert!(r.len() >= 100, "{c}: {} windows", r.len());
        assert!(
            r[0] >= RATIO_LO && r[r.len() - 1] <= RATIO_HI,
            "{c}: {:?}",
            (r[0], r[r.len() - 1])
        );
    }
    let r = ratios("GRACE-A-2008");
    let median = r[r.len() / 2];
    assert!(
        (1.6..=1.9).contains(&median),
        "GRACE-A 2008 median ratio {median}"
    );
}
