// SPDX-License-Identifier: AGPL-3.0-only
//! Thermospheric density-model scorecard, density sensitivity to the space-weather indices, and
//! orbit lifetime with the density uncertainty.
//!
//! **Scorecard.** Four density models of the engine are compared, orbit window by orbit window,
//! with densities measured by satellite accelerometers: the activity-free static profile
//! ([`crate::forces::atmospheric_density`]), the Jacchia 1971 diurnal-mean profile
//! ([`crate::space_weather::space_weather_density`]), Jacchia 1971 at each point
//! ([`crate::space_weather::jacchia71_density`]) and NRLMSISE-00 ([`crate::nrlmsise00::gtd7d`]).
//! The input is the window file of the TOLEOS accelerometer oracle
//! (`tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv`: TOLEOS
//! DNSxACC_2 densities of CHAMP, GRACE-A and GRACE-FO 1, ESA Swarm DISC, with the GFZ indices; see
//! its NOTICE.md). Per model and campaign it reports the median of model/measured, the mean and
//! standard deviation of log10(model/measured), the root mean square of that log ratio, and the
//! shares of windows within a factor 2 and within 25 %. All four models are empirical; no
//! physics-based (general-circulation) model is in the engine, so the scorecard ranks empirical
//! models only. NRLMSISE-00 is given the Ap of the window's (6.7 h lagged) Kp as its daily Ap,
//! because the window file carries Kp only.
//!
//! **Sensitivity.** The derivatives of ln(density) with respect to F10.7 (daily and 81-day mean
//! moved together) and Ap, by central differences, turn an uncertainty of the forecast indices
//! (the surrogate indices the models are driven by) into a density uncertainty.
//!
//! **Lifetime.** A circular orbit decays as `da/dt = -rho B sqrt(mu a)`, `B = Cd A / m`
//! (King-Hele, Satellite Orbits in an Atmosphere, 1987), so the time from `h0` to the re-entry
//! height is `integral dh / (rho(h) B sqrt(mu (R + h)))`. With the indices held constant (no solar
//! cycle), the density is the model's global mean. A density error that multiplies the whole
//! profile by `k` divides the lifetime by `k`, so the lifetime percentiles follow from the
//! log-normal density uncertainty `sigma_ln = sqrt(sigma_model^2 + sigma_index^2)`: the 5th
//! percentile lifetime is the one at `k = exp(+1.645 sigma_ln)`. MODELLED.

use super::check;
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

const MU: f64 = 3.986_004_418e14;
const RE_KM: f64 = 6378.137;

/// The models the scorecard compares.
pub const MODELS: [&str; 4] = ["static", "j71-mean", "j71", "nrlmsise00"];

/// One decimated point of a window.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Point {
    /// Geodetic altitude (m).
    pub alt_m: f64,
    /// Observed F10.7 of the previous UTC day (sfu).
    pub f107: f64,
    /// Centred 81-day mean F10.7 (sfu).
    pub f107a: f64,
    /// Kp of the interval containing t - 6.7 h.
    pub kp: f64,
    /// Geodetic latitude (deg).
    pub lat_deg: f64,
    /// Local solar time (h).
    pub lst_h: f64,
    /// UTC Modified Julian Date.
    pub mjd: f64,
}

/// One orbit window.
#[derive(Clone, Debug, PartialEq)]
pub struct Window {
    /// Campaign name (satellite and year).
    pub campaign: String,
    /// `max` or `min` (solar activity).
    pub phase: String,
    /// Window start, UTC.
    pub start_utc: String,
    /// Measured mean density of the window (kg/m^3).
    pub measured: f64,
    /// The decimated points the models are evaluated at.
    pub points: Vec<Point>,
}

/// Parse the TOLEOS oracle window file.
pub fn parse_windows(text: &str) -> Result<Vec<Window>, String> {
    let mut out = Vec::new();
    for (i, line) in text.lines().enumerate() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') || (i == 0 && line.starts_with("campaign,")) {
            continue;
        }
        let bad = || crate::terr!("e-space-weather-pnt-window-row", line = i + 1);
        let f: Vec<&str> = line.splitn(7, ',').collect();
        if f.len() != 7 {
            return Err(bad());
        }
        let measured: f64 = f[5].parse().map_err(|_| bad())?;
        let mut points = Vec::new();
        for p in f[6].split(';').filter(|p| !p.is_empty()) {
            let v: Vec<f64> = p
                .split(':')
                .map(str::parse)
                .collect::<Result<_, _>>()
                .map_err(|_| bad())?;
            if v.len() != 7 || v.iter().any(|x| !x.is_finite()) {
                return Err(bad());
            }
            points.push(Point {
                alt_m: v[0],
                f107: v[1],
                f107a: v[2],
                kp: v[3],
                lat_deg: v[4],
                lst_h: v[5],
                mjd: v[6],
            });
        }
        if !(measured.is_finite() && measured > 0.0) || points.is_empty() {
            return Err(bad());
        }
        out.push(Window {
            campaign: f[0].to_string(),
            phase: f[1].to_string(),
            start_utc: f[2].to_string(),
            measured,
            points,
        });
    }
    if out.is_empty() {
        return Err(crate::terr!("e-space-weather-pnt-window-row", line = 1));
    }
    Ok(out)
}

/// A model's density (kg/m^3) at a point.
pub fn model_density(model: &str, p: &Point) -> f64 {
    let sw = crate::space_weather::SpaceWeather {
        f107: p.f107,
        f107a: p.f107a,
        kp: p.kp,
    };
    match model {
        "static" => crate::forces::atmospheric_density(p.alt_m),
        "j71-mean" => crate::space_weather::space_weather_density(p.alt_m, &sw),
        "j71" => crate::space_weather::jacchia71_density(p.alt_m, p.lat_deg, p.lst_h, p.mjd, &sw),
        _ => {
            let t = super::Utc::from_mjd(p.mjd);
            let sec = (p.mjd - p.mjd.floor()) * 86_400.0;
            let lon = ((p.lst_h - sec / 3600.0) * 15.0).rem_euclid(360.0);
            crate::nrlmsise00::density_kg_m3(
                t.doy(),
                sec,
                p.alt_m / 1000.0,
                p.lat_deg,
                lon,
                p.f107a,
                p.f107,
                crate::space_weather::ap_from_kp(p.kp),
            )
        }
    }
}

/// Scores of one model on a set of windows.
#[derive(Clone, Debug, Serialize)]
pub struct Score {
    /// The model's name, one of [`MODELS`].
    pub model: &'static str,
    /// Campaign name, or `all`.
    pub campaign: String,
    /// `max`, `min` or `all`.
    pub phase: String,
    /// Number of windows.
    pub windows: usize,
    /// Median of model/measured.
    pub median_ratio: f64,
    /// Mean of log10(model/measured).
    pub mean_log10_ratio: f64,
    /// Standard deviation of log10(model/measured).
    pub std_log10_ratio: f64,
    /// Root mean square of log10(model/measured).
    pub rms_log10_ratio: f64,
    /// Share of windows with the ratio in [0.5, 2].
    pub share_within_factor_2: f64,
    /// Share of windows with the ratio in [0.75, 1.25].
    pub share_within_25_percent: f64,
}

fn score(model: &'static str, campaign: &str, phase: &str, ratios: &mut [f64]) -> Score {
    ratios.sort_by(f64::total_cmp);
    let n = ratios.len();
    let logs: Vec<f64> = ratios.iter().map(|r| r.plog10()).collect();
    let mean = logs.iter().sum::<f64>() / n as f64;
    let var = logs.iter().map(|l| (l - mean) * (l - mean)).sum::<f64>() / n as f64;
    let ms = logs.iter().map(|l| l * l).sum::<f64>() / n as f64;
    let median = if n % 2 == 1 {
        ratios[n / 2]
    } else {
        0.5 * (ratios[n / 2 - 1] + ratios[n / 2])
    };
    let share = |lo: f64, hi: f64| {
        ratios.iter().filter(|r| **r >= lo && **r <= hi).count() as f64 / n as f64
    };
    Score {
        model,
        campaign: campaign.to_string(),
        phase: phase.to_string(),
        windows: n,
        median_ratio: median,
        mean_log10_ratio: mean,
        std_log10_ratio: var.sqrt(),
        rms_log10_ratio: ms.sqrt(),
        share_within_factor_2: share(0.5, 2.0),
        share_within_25_percent: share(0.75, 1.25),
    }
}

/// The scorecard: per model, one score per campaign and one over all windows (`campaign` "all").
pub fn scorecard(windows: &[Window]) -> Vec<Score> {
    let mut campaigns: Vec<(String, String)> = Vec::new();
    for w in windows {
        if !campaigns.iter().any(|(c, _)| *c == w.campaign) {
            campaigns.push((w.campaign.clone(), w.phase.clone()));
        }
    }
    let mut out = Vec::new();
    for model in MODELS {
        let ratios: Vec<f64> = windows
            .iter()
            .map(|w| {
                w.points
                    .iter()
                    .map(|p| model_density(model, p))
                    .sum::<f64>()
                    / w.points.len() as f64
                    / w.measured
            })
            .collect();
        for (c, ph) in &campaigns {
            let mut r: Vec<f64> = windows
                .iter()
                .zip(&ratios)
                .filter(|(w, _)| w.campaign == *c)
                .map(|(_, r)| *r)
                .collect();
            out.push(score(model, c, ph, &mut r));
        }
        let mut all = ratios.clone();
        out.push(score(model, "all", "all", &mut all));
    }
    out
}

/// `kshana space-weather density-scorecard <windows.csv>`.
pub fn scorecard_json(text: &str) -> Result<String, String> {
    let w = parse_windows(text)?;
    let s = scorecard(&w);
    let mut ranking: Vec<&Score> = s.iter().filter(|x| x.campaign == "all").collect();
    ranking.sort_by(|a, b| a.rms_log10_ratio.total_cmp(&b.rms_log10_ratio));
    let doc = serde_json::json!({
        "format": "kshana.space-weather.density-scorecard/1",
        "label": "MEASURED comparison: each model's orbit-window mean against the measured \
                  accelerometer density of the same window; the models themselves are MODELLED \
                  (empirical; no physics-based model is in the engine)",
        "windows": w.len(),
        "models": MODELS,
        "ranking_by_rms_log10": ranking.iter().map(|x| x.model).collect::<Vec<_>>(),
        "scores": s,
    });
    Ok(serde_json::to_string_pretty(&doc).expect("serialise"))
}

/// The density model of a lifetime run.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum LifetimeModel {
    /// NRLMSISE-00 averaged over latitude, local time and four days of the year.
    Nrlmsise00,
    /// The Jacchia 1971 diurnal-mean profile.
    J71,
}

/// Global-mean density (kg/m^3) at `h_km` for constant indices.
pub fn global_mean_density(model: LifetimeModel, h_km: f64, f107: f64, f107a: f64, ap: f64) -> f64 {
    match model {
        LifetimeModel::J71 => crate::space_weather::space_weather_density(
            h_km * 1000.0,
            &crate::space_weather::SpaceWeather {
                f107,
                f107a,
                kp: crate::space_weather::kp_from_ap(ap),
            },
        ),
        LifetimeModel::Nrlmsise00 => {
            let (mut s, mut w) = (0.0, 0.0);
            for doy in [80, 172, 266, 355] {
                for lat in [-60.0f64, -30.0, 0.0, 30.0, 60.0] {
                    let c = lat.to_radians().pcos();
                    for k in 0..8 {
                        let lst = 3.0 * f64::from(k);
                        s += c * crate::nrlmsise00::density_kg_m3(
                            doy,
                            43_200.0,
                            h_km,
                            lat,
                            (lst - 12.0) * 15.0,
                            f107a,
                            f107,
                            ap,
                        );
                        w += c;
                    }
                }
            }
            s / w
        }
    }
}

/// Lifetime (s) of a circular orbit from `h0_km` down to `h_end_km` for ballistic coefficient
/// `b_m2_kg` (`Cd A / m`) in the density `rho(h_km)`: the integral of
/// `dh / (rho B sqrt(mu (R + h)))`, by the midpoint rule on 0.1 km steps.
pub fn lifetime_s(h0_km: f64, h_end_km: f64, b_m2_kg: f64, rho: impl Fn(f64) -> f64) -> f64 {
    let n = ((h0_km - h_end_km) / 0.1).ceil().max(1.0) as usize;
    let dh = (h0_km - h_end_km) / n as f64;
    (0..n)
        .map(|i| {
            let h = h_end_km + (i as f64 + 0.5) * dh;
            dh * 1e3 / (rho(h) * b_m2_kg * (MU * (RE_KM + h) * 1e3).sqrt())
        })
        .sum()
}

/// The lifetime request (`kshana space-weather lifetime <request.json>`).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LifetimeRequest {
    /// Initial circular-orbit altitude (km).
    pub altitude_km: f64,
    /// Mass (kg).
    pub mass_kg: f64,
    /// Drag reference area (m^2).
    pub area_m2: f64,
    /// Drag coefficient; 2.2 when absent.
    #[serde(default)]
    pub cd: Option<f64>,
    /// Daily F10.7 held over the lifetime (sfu).
    pub f107: f64,
    /// 81-day mean F10.7 (sfu); `f107` when absent.
    #[serde(default)]
    pub f107a: Option<f64>,
    /// Daily Ap held over the lifetime.
    pub ap: f64,
    #[serde(default)]
    /// The density model; NRLMSISE-00 when absent.
    pub model: Option<LifetimeModel>,
    /// One-sigma model error of ln(density), for example the scorecard's rms log10 ratio times
    /// ln 10; 0 when absent.
    #[serde(default)]
    pub density_sigma_ln: Option<f64>,
    /// One-sigma error of the F10.7 forecast (sfu); 0 when absent.
    #[serde(default)]
    pub f107_sigma: Option<f64>,
    /// One-sigma error of the Ap forecast; 0 when absent.
    #[serde(default)]
    pub ap_sigma: Option<f64>,
    /// Re-entry altitude where the lifetime ends (km); 120 when absent.
    #[serde(default)]
    pub reentry_altitude_km: Option<f64>,
}

/// `kshana space-weather lifetime <request.json>`.
pub fn lifetime_json(request_json: &str) -> Result<String, String> {
    let r: LifetimeRequest = serde_json::from_str(request_json)
        .map_err(|e| crate::terr!("e-space-weather-pnt-request", e = e.to_string()))?;
    let h0 = check("altitude_km", r.altitude_km, 150.0, 1000.0)?;
    let h_end = check(
        "reentry_altitude_km",
        r.reentry_altitude_km.unwrap_or(120.0),
        90.0,
        h0 - 1.0,
    )?;
    let b = check("cd", r.cd.unwrap_or(2.2), 0.5, 5.0)? * check("area_m2", r.area_m2, 1e-6, 1e4)?
        / check("mass_kg", r.mass_kg, 1e-3, 1e6)?;
    let f107 = check("f107", r.f107, 60.0, 400.0)?;
    let f107a = check("f107a", r.f107a.unwrap_or(f107), 60.0, 400.0)?;
    let ap = check("ap", r.ap, 0.0, 400.0)?;
    let model = r.model.unwrap_or(LifetimeModel::Nrlmsise00);
    let s_model = check(
        "density_sigma_ln",
        r.density_sigma_ln.unwrap_or(0.0),
        0.0,
        5.0,
    )?;
    let s_f = check("f107_sigma", r.f107_sigma.unwrap_or(0.0), 0.0, 200.0)?;
    let s_ap = check("ap_sigma", r.ap_sigma.unwrap_or(0.0), 0.0, 200.0)?;
    // Elasticities at the starting height, by central differences.
    let lnrho = |f: f64, fa: f64, a: f64| global_mean_density(model, h0, f, fa, a).pln();
    let df = 5.0;
    let d_f107 = (lnrho(f107 + df, f107a + df, ap) - lnrho(f107 - df, f107a - df, ap)) / (2.0 * df);
    let da = 2.0f64.min(ap);
    let d_ap = if da > 0.0 {
        (lnrho(f107, f107a, ap + da) - lnrho(f107, f107a, ap - da)) / (2.0 * da)
    } else {
        (lnrho(f107, f107a, ap + 2.0) - lnrho(f107, f107a, ap)) / 2.0
    };
    let s_index = ((d_f107 * s_f).ppowi(2) + (d_ap * s_ap).ppowi(2)).sqrt();
    let s_total = (s_model * s_model + s_index * s_index).sqrt();
    // The density profile on a 1 km grid, interpolated in log.
    let lo = h_end.floor();
    let n = (h0.ceil() - lo) as usize + 1;
    let grid: Vec<f64> = (0..=n)
        .map(|i| global_mean_density(model, lo + i as f64, f107, f107a, ap).pln())
        .collect();
    let rho = |h: f64| {
        let x = (h - lo).clamp(0.0, n as f64);
        let i = (x.floor() as usize).min(n - 1);
        let w = x - i as f64;
        (grid[i] * (1.0 - w) + grid[i + 1] * w).pexp()
    };
    let t50 = lifetime_s(h0, h_end, b, rho) / 86_400.0;
    let z = 1.644_853_626_951_472_2;
    let k = (z * s_total).pexp();
    let doc = serde_json::json!({
        "format": "kshana.space-weather.lifetime/1",
        "label": "MODELLED: circular-orbit decay through the model's global-mean density with \
                  constant indices (no solar cycle); the percentiles assume a log-normal density \
                  error that scales the whole profile",
        "model": model,
        "ballistic_coefficient_m2_kg": b,
        "f107": f107,
        "f107a": f107a,
        "ap": ap,
        "density_at_start_kg_m3": rho(h0),
        "dln_rho_d_f107": d_f107,
        "dln_rho_d_ap": d_ap,
        "sigma_ln_model": s_model,
        "sigma_ln_indices": s_index,
        "sigma_ln_total": s_total,
        "lifetime_days_p50": t50,
        "lifetime_days_p05": t50 / k,
        "lifetime_days_p95": t50 * k,
        "reentry_altitude_km": h_end,
    });
    Ok(serde_json::to_string_pretty(&doc).expect("serialise"))
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_lifetime_integral_matches_its_closed_form() {
        // rho(h) = rho0 exp(-(h - h0)/H) sqrt(R + h0)/sqrt(R + h) makes the integrand a pure
        // exponential: t = H (1 - exp(-(h0 - h1)/H)) / (rho0 B sqrt(mu (R + h0))).
        let (h0, h1, hs, rho0, b) = (400.0, 200.0, 50.0, 3e-12, 0.01);
        let rho = |h: f64| rho0 * (-(h - h0) / hs).pexp() * ((RE_KM + h0) / (RE_KM + h)).sqrt();
        let want = hs * 1e3 * (1.0 - (-(h0 - h1) / hs).pexp())
            / (rho0 * b * (MU * (RE_KM + h0) * 1e3).sqrt());
        let got = lifetime_s(h0, h1, b, rho);
        assert!((got / want - 1.0).abs() < 1e-5, "{got} {want}");
    }

    fn req(extra: &str) -> serde_json::Value {
        let j = format!(
            r#"{{"altitude_km":400,"mass_kg":100,"area_m2":1,"f107":150,"ap":10,"model":"j71"{extra}}}"#
        );
        serde_json::from_str(&lifetime_json(&j).unwrap()).unwrap()
    }

    #[test]
    fn lifetime_percentiles_bracket_the_median_and_a_quieter_sun_lengthens_it() {
        let v = req(r#","density_sigma_ln":0.3,"f107_sigma":20,"ap_sigma":5"#);
        let (p5, p50, p95) = (
            v["lifetime_days_p05"].as_f64().unwrap(),
            v["lifetime_days_p50"].as_f64().unwrap(),
            v["lifetime_days_p95"].as_f64().unwrap(),
        );
        assert!(p5 < p50 && p50 < p95, "{p5} {p50} {p95}");
        assert!(v["dln_rho_d_f107"].as_f64().unwrap() > 0.0);
        assert!(v["dln_rho_d_ap"].as_f64().unwrap() > 0.0);
        assert!(v["sigma_ln_total"].as_f64().unwrap() > 0.3);
        let quiet = req("");
        let low: serde_json::Value = serde_json::from_str(
            &lifetime_json(
                r#"{"altitude_km":400,"mass_kg":100,"area_m2":1,"f107":80,"ap":10,"model":"j71"}"#,
            )
            .unwrap(),
        )
        .unwrap();
        assert!(
            low["lifetime_days_p50"].as_f64().unwrap()
                > quiet["lifetime_days_p50"].as_f64().unwrap()
        );
        assert!(
            lifetime_json(r#"{"altitude_km":40,"mass_kg":1,"area_m2":1,"f107":150,"ap":4}"#)
                .is_err()
        );
    }

    #[test]
    fn the_window_parser_rejects_broken_rows_with_their_line() {
        let ok = "campaign,phase,start_utc,mean_alt_km,n_valid,measured_mean,points\n\
                  X,max,2001-01-05T00:00:00,450,500,2e-12,450000:150:150:3:10:12:51914.0\n";
        let w = parse_windows(ok).unwrap();
        assert_eq!(w.len(), 1);
        assert_eq!(w[0].points[0].lst_h, 12.0);
        let e = parse_windows("campaign,x\nX,max,t,450,500,2e-12,1:2:3\n").unwrap_err();
        assert!(e.contains('2'), "{e}");
        assert!(parse_windows("").is_err());
        let s = scorecard(&w);
        assert_eq!(s.len(), MODELS.len() * 2);
    }
}
