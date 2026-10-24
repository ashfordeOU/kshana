// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-surface-pnt-map`: surface positioning and timing availability by site and season.
//!
//! **What is modelled.** For each site of a list and each season (an epoch with a window after it), three
//! things are evaluated over the window at a stated step, all against the site's own horizon:
//!
//! * **Relay positioning**: the fraction of epochs with at least four relays above the flat mask and the
//!   terrain horizon and a PDOP under the threshold, from the same functions and the same illustrative
//!   LCNS-class constellation as [`crate::lunar_service`] (`moonlight-service-volume`). With a `terrain`
//!   section the horizon is the ray-marched skyline of [`crate::lunar_terrain`] (`lunar-station-coverage`'s
//!   terrain), built exactly as that scenario builds a grid point's. The single-site, single-window result is
//!   asserted equal, to the bit, to what `moonlight-service-volume` returns for a one-point grid.
//! * **Earth and Sun visibility**: the elevation of the Earth and of the Sun from the site at every epoch of
//!   every season, from the crate's analytic Sun and Moon positions and lunar orientation
//!   ([`crate::lunar_od::AnalyticLunarEnvironment`]), against the same horizon. This is the part that moves
//!   with the season: the Keplerian relay set repeats in the Moon-fixed frame, but the libration and the Sun's
//!   declination do not.
//! * **Timing**: a surface clock disciplined by any one relay in view or by the Earth, `relay_timing` or
//!   `earth_visible`, and the longest stretch with neither (the holdover the clock has to ride out).
//!
//! The core is [`LunarSurfaceMapScenario::run_phase`], a function of `(config, carried state)`; the carried
//! state passes through (a map holds no filter), and the report flags `observability_lost` for a site whose
//! positioning is almost never available, which is the thread's cue to inflate the covariance.
//!
//! **Honesty.** MODELLED. The relay set is illustrative and Keplerian, and the Moon turns at the mean rate
//! (no libration) for the relays, as in `moonlight-service-volume`; the Earth and Sun use the analytic
//! lunar orientation (with libration), so the two frames differ by that omission and the report says so. The
//! terrain is the 1200 m LOLA crop: relief below a pixel is gone. Earth visibility ignores the Earth's
//! angular size; Sun visibility is the centre of the disc. Advisory software, not certified navigation
//! equipment.

use crate::lunar::{selenographic_to_mcmf, Selenographic};
use crate::lunar_od::{AnalyticLunarEnvironment, LunarEnvironment};
use crate::lunar_phase::Carried;
use crate::lunar_service::{
    coverage_masked, masked_visible, topocentric, LunarConstellation, LunarSat,
    LunarServiceScenario,
};
use crate::lunar_terrain::{clears_horizon, LunarTerrainCfg};
use crate::skyline::Skyline;
use serde::Deserialize;
use serde_json::{json, Value};

type Vec3 = [f64; 3];

const LABEL: &str = "MODELLED";
/// Julian Date of 2028-01-01 00:00 UTC.
const JD_2028: f64 = 2_461_771.5;
const SEASON_SPACING_DAYS: f64 = 91.3;

/// One surface site.
#[derive(Clone, Debug, Deserialize)]
pub struct SiteIn {
    /// A label for the report.
    pub name: Option<String>,
    /// Selenographic latitude (deg).
    pub lat_deg: f64,
    /// Selenographic longitude (deg). Default 0.
    pub lon_deg: Option<f64>,
}

/// The `lunar-surface-pnt-map` scenario. Every field is optional.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarSurfaceMapScenario {
    /// Sites. Default four south-polar sites at longitude 0: -89.9, -89.5, -88.5 and -85.0 deg.
    pub sites: Option<Vec<SiteIn>>,
    /// Season start dates, `YYYY-MM-DD` (00:00 UTC, 1901 to 2099). Default four dates 91.3 days apart from
    /// 2028-01-01.
    pub season_dates: Option<Vec<String>>,
    /// Window after each season start (days). Default one sidereal month, 27.3217.
    pub window_days: Option<f64>,
    /// Epoch step (minutes). Default 30.
    pub step_min: Option<f64>,
    /// Relays in the illustrative constellation (1 to 24).
    pub n_sats: Option<usize>,
    /// Semi-major axis (km).
    pub sma_km: Option<f64>,
    /// Eccentricity.
    pub eccentricity: Option<f64>,
    /// Inclination (deg).
    pub inc_deg: Option<f64>,
    /// Argument of perilune (deg).
    pub argp_deg: Option<f64>,
    /// Flat elevation mask for relays (deg). Default 5.
    pub mask_deg: Option<f64>,
    /// PDOP under which positioning counts as available. Default as `moonlight-service-volume`.
    pub pdop_threshold: Option<f64>,
    /// Flat elevation mask for the Earth (deg). Default 0.
    pub earth_mask_deg: Option<f64>,
    /// Flat elevation mask for the Sun (deg). Default 0.
    pub sun_mask_deg: Option<f64>,
    /// The terrain horizon section, as in `moonlight-service-volume` and `lunar-station-coverage`.
    pub terrain: Option<LunarTerrainCfg>,
}

/// A phase's result.
#[derive(Clone, Debug)]
pub struct MapOut {
    /// The carried state, unchanged: a map holds no filter.
    pub carried_out: Carried,
    /// The result document.
    pub report: Value,
    /// One line for the terminal.
    pub summary: String,
    /// The long-form table.
    pub csv: String,
}

struct Resolved {
    sites: Vec<(String, f64, f64)>,
    seasons: Vec<(String, f64)>,
    window_s: f64,
    step_s: f64,
    mask_deg: f64,
    pdop: f64,
    earth_mask_deg: f64,
    sun_mask_deg: f64,
    svc: LunarServiceScenario,
}

fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

fn mat_vec(m: &[[f64; 3]; 3], v: Vec3) -> Vec3 {
    [dot(m[0], v), dot(m[1], v), dot(m[2], v)]
}

/// Julian Date of 00:00 UTC on a Gregorian date, 1901 to 2099.
fn jd_of(y: i32, m: u32, d: u32) -> f64 {
    let (y, m, d) = (y as i64, m as i64, d as i64);
    let a = 367 * y - (7 * (y + (m + 9) / 12)) / 4 + (275 * m) / 9 + d;
    a as f64 + 1_721_013.5
}

/// Calendar date `YYYY-MM-DD` of a Julian Date (Meeus, chapter 7), for labels.
fn ymd_of(jd: f64) -> String {
    let z = (jd + 0.5).floor();
    let a = if z < 2_299_161.0 {
        z
    } else {
        let al = ((z - 1_867_216.25) / 36_524.25).floor();
        z + 1.0 + al - (al / 4.0).floor()
    };
    let b = a + 1524.0;
    let c = ((b - 122.1) / 365.25).floor();
    let d = (365.25 * c).floor();
    let e = ((b - d) / 30.6001).floor();
    let day = b - d - (30.6001 * e).floor();
    let month = if e < 14.0 { e - 1.0 } else { e - 13.0 };
    let year = if month > 2.0 { c - 4716.0 } else { c - 4715.0 };
    format!("{:04}-{:02}-{:02}", year as i64, month as i64, day as i64)
}

fn parse_date(s: &str) -> Result<f64, String> {
    let p: Vec<&str> = s.split('-').collect();
    if p.len() != 3 {
        return Err(format!("season date `{s}` is not YYYY-MM-DD"));
    }
    let y: i32 = p[0]
        .parse()
        .map_err(|_| format!("season date `{s}`: bad year"))?;
    let m: u32 = p[1]
        .parse()
        .map_err(|_| format!("season date `{s}`: bad month"))?;
    let d: u32 = p[2]
        .parse()
        .map_err(|_| format!("season date `{s}`: bad day"))?;
    if !(1901..=2099).contains(&y) || !(1..=12).contains(&m) || !(1..=31).contains(&d) {
        return Err(format!(
            "season date `{s}` is outside 1901-2099 or not a date"
        ));
    }
    Ok(jd_of(y, m, d))
}

/// The epochs `moonlight-service-volume` evaluates for a horizon and a step, reproduced here so a window of
/// this kind has exactly its epochs (asserted equal in the tests).
fn epochs(horizon_s: f64, step_s: f64) -> Vec<f64> {
    let mut ts = Vec::new();
    let mut t = 0.0;
    let n_t = (((horizon_s - 1e-6) / step_s).ceil().max(0.0) as usize).saturating_add(2);
    for _ in 0..n_t {
        if t >= horizon_s - 1e-6 {
            break;
        }
        ts.push(t);
        t += step_s;
    }
    if ts.is_empty() {
        ts.push(0.0);
    }
    ts
}

/// The illustrative constellation exactly as `moonlight-service-volume` lays it out for these parameters.
fn constellation_of(s: &LunarServiceScenario) -> LunarConstellation {
    let n = s.n_sats.clamp(1, 24);
    let sma_m = s.sma_km * 1000.0;
    LunarConstellation::new(
        (0..n)
            .map(|k| LunarSat {
                sma_m,
                eccentricity: s.eccentricity,
                inc_deg: s.inc_deg,
                raan_deg: 360.0 * (k as f64) / (n as f64),
                argp_deg: s.argp_deg,
                mean_anom_deg: 360.0 * (k as f64) / (n as f64),
            })
            .collect(),
    )
}

/// Longest run of `false` in `flags`, in epochs.
fn longest_gap(flags: &[bool]) -> usize {
    let (mut best, mut cur) = (0usize, 0usize);
    for &f in flags {
        if f {
            cur = 0;
        } else {
            cur += 1;
            best = best.max(cur);
        }
    }
    best
}

fn frac(flags: &[bool]) -> f64 {
    flags.iter().filter(|&&f| f).count() as f64 / flags.len().max(1) as f64
}

impl LunarSurfaceMapScenario {
    fn resolve(&self) -> Result<Resolved, String> {
        let sites_in = self.sites.clone().unwrap_or_else(|| {
            [-89.9, -89.5, -88.5, -85.0]
                .iter()
                .map(|&l| SiteIn {
                    name: None,
                    lat_deg: l,
                    lon_deg: Some(0.0),
                })
                .collect()
        });
        if sites_in.is_empty() || sites_in.len() > 64 {
            return Err("sites must hold between 1 and 64 entries".into());
        }
        let mut sites = Vec::new();
        for (i, s) in sites_in.iter().enumerate() {
            let lon = s.lon_deg.unwrap_or(0.0);
            if !((-90.0..=90.0).contains(&s.lat_deg) && (-180.0..=360.0).contains(&lon)) {
                return Err(format!(
                    "site {i}: latitude must be in [-90, 90] and longitude in [-180, 360]"
                ));
            }
            sites.push((
                s.name.clone().unwrap_or_else(|| format!("site {i}")),
                s.lat_deg,
                lon,
            ));
        }
        let seasons: Vec<(String, f64)> = match &self.season_dates {
            Some(d) if d.is_empty() => {
                return Err("season_dates must hold at least one date".into())
            }
            Some(d) if d.len() > 16 => return Err("season_dates must hold at most 16 dates".into()),
            Some(d) => d
                .iter()
                .map(|s| parse_date(s).map(|jd| (s.clone(), jd)))
                .collect::<Result<_, _>>()?,
            None => (0..4)
                .map(|k| {
                    let jd = JD_2028 + SEASON_SPACING_DAYS * k as f64;
                    (ymd_of(jd), jd)
                })
                .collect(),
        };
        let window_days = self.window_days.unwrap_or(27.3217);
        let step_min = self.step_min.unwrap_or(30.0);
        if !(window_days > 0.0 && window_days <= 400.0 && step_min >= 1.0 && step_min <= 720.0) {
            return Err("window_days must be in (0, 400] and step_min in [1, 720]".into());
        }
        let mut svc = LunarServiceScenario::default();
        if let Some(v) = self.n_sats {
            svc.n_sats = v;
        }
        if let Some(v) = self.sma_km {
            svc.sma_km = v;
        }
        if let Some(v) = self.eccentricity {
            svc.eccentricity = v;
        }
        if let Some(v) = self.inc_deg {
            svc.inc_deg = v;
        }
        if let Some(v) = self.argp_deg {
            svc.argp_deg = v;
        }
        if let Some(v) = self.mask_deg {
            svc.elev_mask_deg = v;
        }
        if let Some(v) = self.pdop_threshold {
            svc.pdop_threshold = v;
        }
        svc.horizon_hours = window_days * 24.0;
        svc.step_min = step_min;
        svc.terrain = self.terrain.clone();
        Ok(Resolved {
            sites,
            seasons,
            window_s: window_days * 86_400.0,
            step_s: step_min * 60.0,
            mask_deg: svc.elev_mask_deg,
            pdop: svc.pdop_threshold,
            earth_mask_deg: self.earth_mask_deg.unwrap_or(0.0),
            sun_mask_deg: self.sun_mask_deg.unwrap_or(0.0),
            svc,
        })
    }

    /// The phase core.
    pub fn run_phase(&self, carried: &Carried) -> Result<MapOut, String> {
        let cfg = self.resolve()?;
        let constellation = constellation_of(&cfg.svc);
        let times = epochs(cfg.window_s, cfg.step_s);
        let env = AnalyticLunarEnvironment;
        let mut cells: Vec<Value> = Vec::new();
        let mut site_rows: Vec<Value> = Vec::new();
        let mut csv = String::from(
            "# lunar-surface-pnt-map long-form table (MODELLED; advisory software, not certified navigation equipment)\n\
             site_index,lat_deg,lon_deg,season,season_start_jd_utc,position_availability,relay_timing_availability,earth_visible,sun_visible,timing_availability,longest_timing_gap_h,longest_position_gap_h\n",
        );
        let mut min_pos = f64::INFINITY;
        for (si, (name, lat, lon)) in cfg.sites.iter().enumerate() {
            let g = Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            };
            let user = selenographic_to_mcmf(g);
            // Terrain skyline, built as a grid point's is, and the same relays the service volume uses.
            let mask = match &cfg.svc.terrain {
                Some(t) => Some(t.resolve_site(*lat, *lon, cfg.mask_deg)?),
                None => None,
            };
            let sky: Option<&Skyline> = mask.as_ref().map(|m| &m.skyline);
            let stats = coverage_masked(
                &constellation,
                &[g],
                &times,
                cfg.mask_deg.to_radians(),
                cfg.pdop,
                sky.map(std::slice::from_ref),
            );
            // Per-epoch relay flags by the rule `coverage_masked` applies.
            let (mut pos_ok, mut relay_time_ok) = (
                Vec::with_capacity(times.len()),
                Vec::with_capacity(times.len()),
            );
            for &t in &times {
                let sats = constellation.positions_mcmf(t);
                let vis = masked_visible(user, &sats, cfg.mask_deg.to_radians(), sky);
                relay_time_ok.push(!vis.is_empty());
                pos_ok.push(
                    vis.len() >= 4
                        && crate::orbit::dop(user, &vis).is_some_and(|d| d.pdop < cfg.pdop),
                );
            }
            let flag_frac = frac(&pos_ok);
            debug_assert!((flag_frac - stats.coverage_fraction).abs() < 1e-12);
            let pos_gap_h = longest_gap(&pos_ok) as f64 * cfg.step_s / 3600.0;
            min_pos = min_pos.min(stats.coverage_fraction);
            let empty_sky = Skyline::none();
            let sk = sky.unwrap_or(&empty_sky);
            for (sname, jd0) in &cfg.seasons {
                let (mut earth, mut sun) = (
                    Vec::with_capacity(times.len()),
                    Vec::with_capacity(times.len()),
                );
                for &t in &times {
                    let jd = jd0 + t / 86_400.0;
                    let (sun_geo, moon_geo) = env.geocentric_sun_moon(jd);
                    let m = env.icrf_to_moon_pa(jd);
                    let earth_pa = mat_vec(&m, [-moon_geo[0], -moon_geo[1], -moon_geo[2]]);
                    let sun_pa = mat_vec(
                        &m,
                        [
                            sun_geo[0] - moon_geo[0],
                            sun_geo[1] - moon_geo[1],
                            sun_geo[2] - moon_geo[2],
                        ],
                    );
                    let vis = |target: Vec3, mask_deg: f64| {
                        let (_, el, _) = topocentric(user, target);
                        clears_horizon(sk, user, target, el >= mask_deg)
                    };
                    earth.push(vis(earth_pa, cfg.earth_mask_deg));
                    sun.push(vis(sun_pa, cfg.sun_mask_deg));
                }
                let timing: Vec<bool> = relay_time_ok
                    .iter()
                    .zip(&earth)
                    .map(|(a, b)| *a || *b)
                    .collect();
                let row = json!({
                    "site_index": si,
                    "site": name,
                    "lat_deg": lat,
                    "lon_deg": lon,
                    "season": sname,
                    "season_start_jd_utc": jd0,
                    "position_availability": stats.coverage_fraction,
                    "relay_timing_availability": frac(&relay_time_ok),
                    "earth_visible": frac(&earth),
                    "sun_visible": frac(&sun),
                    "timing_availability": frac(&timing),
                    "longest_timing_gap_h": longest_gap(&timing) as f64 * cfg.step_s / 3600.0,
                    "longest_position_gap_h": pos_gap_h,
                });
                csv.push_str(&format!(
                    "{si},{lat:.4},{lon:.4},{sname},{jd0:.3},{:.7},{:.7},{:.7},{:.7},{:.7},{:.7},{:.7}\n",
                    stats.coverage_fraction,
                    frac(&relay_time_ok),
                    frac(&earth),
                    frac(&sun),
                    frac(&timing),
                    longest_gap(&timing) as f64 * cfg.step_s / 3600.0,
                    pos_gap_h
                ));
                cells.push(row);
            }
            site_rows.push(json!({
                "site_index": si,
                "name": name,
                "lat_deg": lat,
                "lon_deg": lon,
                "min_sats": stats.min_sats,
                "max_sats": stats.max_sats,
                "pdop_mean": stats.pdop_mean,
                "pdop_max": stats.pdop_max,
                "horizon_max_deg": mask.as_ref().map(|m| m.echo.horizon_max_deg),
                "sky_open_fraction": mask.as_ref().map(|m| m.echo.sky_open_fraction),
            }));
        }
        let observability_lost = min_pos < 0.05;
        let mut report = json!({
            "kind": "lunar-surface-pnt-map",
            "label": LABEL,
            "advisory": "Advisory software, not certified navigation equipment. MODELLED: an illustrative relay set and an analytic Sun and Moon; not a service prediction for any site.",
            "n_sites": cfg.sites.len(),
            "n_seasons": cfg.seasons.len(),
            "n_epochs_per_window": times.len(),
            "window_days": cfg.window_s / 86_400.0,
            "step_min": cfg.step_s / 60.0,
            "n_relays": cfg.svc.n_sats.clamp(1, 24),
            "mask_deg": cfg.mask_deg,
            "pdop_threshold": cfg.pdop,
            "terrain": cfg.svc.terrain.is_some(),
            "observability_lost": observability_lost,
            "frames_note": "relays: mean-rotation Moon (no libration); Earth and Sun: analytic lunar orientation (with libration)",
        });
        let part2 = json!({
            "sites": site_rows,
            "cells": cells,
            "carried_out": { "frame": "mci", "evidence": "MODELLED", "passes_through": true },
            "units": units(),
        });
        if let (Some(base), Value::Object(p2)) = (report.as_object_mut(), part2) {
            base.extend(p2);
        }
        let worst_t = cells
            .iter()
            .filter_map(|c| c["timing_availability"].as_f64())
            .fold(f64::INFINITY, f64::min);
        let summary = format!(
            "lunar-surface-pnt-map | {} sites x {} seasons | positioning {:.0}% to {:.0}% | worst timing availability {:.1}% | longest timing gap {:.1} h (MODELLED)",
            cfg.sites.len(),
            cfg.seasons.len(),
            100.0
                * cells
                    .iter()
                    .filter_map(|c| c["position_availability"].as_f64())
                    .fold(f64::INFINITY, f64::min),
            100.0
                * cells
                    .iter()
                    .filter_map(|c| c["position_availability"].as_f64())
                    .fold(0.0, f64::max),
            100.0 * worst_t,
            cells
                .iter()
                .filter_map(|c| c["longest_timing_gap_h"].as_f64())
                .fold(0.0, f64::max),
        );
        Ok(MapOut {
            carried_out: carried.clone(),
            report,
            summary,
            csv,
        })
    }

    /// The result's chart: positioning and timing availability by site, worst season.
    pub fn chart_svg(&self, json: &str) -> String {
        use crate::lunar_phase::{line_chart_svg, ChartSeries};
        let v: Value = serde_json::from_str(json).unwrap_or(Value::Null);
        let cells = v["cells"].as_array().cloned().unwrap_or_default();
        let n_sites = v["n_sites"].as_u64().unwrap_or(0) as usize;
        let series = |key: &str, name: &'static str| -> ChartSeries<'static> {
            let pts: Vec<(f64, f64)> = (0..n_sites)
                .filter_map(|si| {
                    let worst = cells
                        .iter()
                        .filter(|c| c["site_index"].as_u64() == Some(si as u64))
                        .filter_map(|c| c[key].as_f64())
                        .fold(f64::INFINITY, f64::min);
                    worst.is_finite().then_some((si as f64, 100.0 * worst))
                })
                .collect();
            ChartSeries { name, points: pts }
        };
        line_chart_svg(
            "Lunar surface PNT map: availability by site (worst season, %)",
            "positioning = 4+ relays and PDOP under the threshold; timing = one relay or the Earth | MODELLED, advisory only",
            "site index",
            "percent of the window",
            &[
                series("position_availability", "positioning"),
                series("timing_availability", "timing"),
                series("earth_visible", "Earth visible"),
            ],
        )
    }

    /// Standalone entry.
    pub fn run_json(&self) -> Result<(String, String, String), String> {
        let out = self.run_phase(&Carried::default_llo())?;
        let json = serde_json::to_string_pretty(&out.report).map_err(|e| e.to_string())?;
        Ok((json, out.summary, out.csv))
    }
}

fn units() -> Value {
    const ROWS: &[(&str, &str, &str, &str)] = &[
        ("n_sites", "1", "input", "sites mapped"),
        ("n_seasons", "1", "input", "seasons mapped"),
        (
            "n_epochs_per_window",
            "1",
            "computed",
            "epochs in each window",
        ),
        (
            "window_days",
            "d",
            "input",
            "window after each season start",
        ),
        ("step_min", "min", "input", "epoch step"),
        (
            "n_relays",
            "1",
            "input",
            "relays in the illustrative constellation",
        ),
        ("mask_deg", "deg", "input", "flat elevation mask for relays"),
        (
            "pdop_threshold",
            "1",
            "input",
            "PDOP under which positioning counts as available",
        ),
        ("sites.site_index", "1", "input", "index of the site"),
        ("sites.lat_deg", "deg", "input", "site latitude"),
        ("sites.lon_deg", "deg", "input", "site longitude"),
        (
            "sites.min_sats",
            "1",
            "computed",
            "fewest relays in view over the window",
        ),
        (
            "sites.max_sats",
            "1",
            "computed",
            "most relays in view over the window",
        ),
        (
            "sites.pdop_mean",
            "1",
            "computed",
            "mean PDOP over epochs with four or more relays",
        ),
        (
            "sites.pdop_max",
            "1",
            "computed",
            "largest PDOP over epochs with four or more relays",
        ),
        (
            "sites.horizon_max_deg",
            "deg",
            "computed",
            "highest terrain horizon at the site",
        ),
        (
            "sites.sky_open_fraction",
            "1",
            "computed",
            "share of the upper sky above the mask and the horizon",
        ),
        ("cells.site_index", "1", "input", "index of the site"),
        ("cells.lat_deg", "deg", "input", "site latitude"),
        ("cells.lon_deg", "deg", "input", "site longitude"),
        (
            "cells.season_start_jd_utc",
            "d",
            "input",
            "Julian Date of the season start, 00:00 UTC",
        ),
        (
            "cells.position_availability",
            "1",
            "computed",
            "fraction of epochs with four or more relays in view and PDOP under the threshold",
        ),
        (
            "cells.relay_timing_availability",
            "1",
            "computed",
            "fraction of epochs with at least one relay in view",
        ),
        (
            "cells.earth_visible",
            "1",
            "computed",
            "fraction of epochs with the Earth above the mask and the horizon",
        ),
        (
            "cells.sun_visible",
            "1",
            "computed",
            "fraction of epochs with the Sun's centre above the mask and the horizon",
        ),
        (
            "cells.timing_availability",
            "1",
            "computed",
            "fraction of epochs with a relay or the Earth in view",
        ),
        (
            "cells.longest_timing_gap_h",
            "h",
            "computed",
            "longest stretch with neither a relay nor the Earth in view",
        ),
        (
            "cells.longest_position_gap_h",
            "h",
            "computed",
            "longest stretch without positioning",
        ),
    ];
    let mut m = serde_json::Map::new();
    for (path, unit, prov, note) in ROWS {
        m.insert(
            (*path).to_string(),
            json!({ "unit": unit, "provenance": prov, "note": note }),
        );
    }
    Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn small() -> LunarSurfaceMapScenario {
        LunarSurfaceMapScenario {
            sites: Some(vec![
                SiteIn {
                    name: Some("a".into()),
                    lat_deg: -89.5,
                    lon_deg: Some(0.0),
                },
                SiteIn {
                    name: None,
                    lat_deg: -85.0,
                    lon_deg: Some(30.0),
                },
            ]),
            season_dates: Some(vec!["2028-01-01".into(), "2028-07-01".into()]),
            window_days: Some(5.0),
            step_min: Some(30.0),
            ..Default::default()
        }
    }

    fn c() -> Carried {
        Carried::default_llo()
    }

    #[test]
    fn default_runs_modelled_with_the_advisory_line() {
        let out = small().run_phase(&c()).unwrap();
        assert_eq!(out.report["kind"], "lunar-surface-pnt-map");
        assert_eq!(out.report["label"], "MODELLED");
        assert!(out.report["advisory"]
            .as_str()
            .unwrap()
            .contains("not certified navigation equipment"));
        assert_eq!(out.report["cells"].as_array().unwrap().len(), 4);
        assert!(out.csv.contains("not certified navigation equipment"));
    }

    #[test]
    fn dates_round_trip_and_the_default_seasons_are_91_days_apart() {
        assert_eq!(jd_of(2028, 1, 1), JD_2028);
        assert_eq!(ymd_of(JD_2028), "2028-01-01");
        assert_eq!(ymd_of(JD_2028 + SEASON_SPACING_DAYS), "2028-04-01");
        assert!(
            parse_date("2028-13-01").is_err()
                && parse_date("x").is_err()
                && parse_date("1800-01-01").is_err()
        );
        let s = LunarSurfaceMapScenario::default().resolve().unwrap();
        assert_eq!(s.seasons.len(), 4);
        assert_eq!(s.sites.len(), 4);
    }

    /// B5: for the same inputs the positioning availability is bit for bit what `moonlight-service-volume`
    /// returns for a one-point grid, with and without a terrain section.
    #[test]
    fn b5_equals_the_service_volume_for_a_single_site() {
        for (lat, lon) in [(-89.5, 0.0), (-85.0, 30.0)] {
            let scn = LunarSurfaceMapScenario {
                sites: Some(vec![SiteIn {
                    name: None,
                    lat_deg: lat,
                    lon_deg: Some(lon),
                }]),
                season_dates: Some(vec!["2028-01-01".into()]),
                window_days: Some(3.0),
                step_min: Some(20.0),
                ..Default::default()
            };
            let out = scn.run_phase(&c()).unwrap();
            let mine = out.report["cells"][0]["position_availability"]
                .as_f64()
                .unwrap();
            let mut svc = scn.resolve().unwrap().svc;
            svc.lat_min_deg = lat;
            svc.lat_max_deg = lat;
            svc.lat_step_deg = 1.0;
            svc.lon_min_deg = lon;
            svc.lon_max_deg = lon;
            svc.lon_step_deg = 1.0;
            let rep = svc.try_run().unwrap();
            assert_eq!(rep.n_grid_points, 1);
            assert_eq!(
                rep.n_epochs,
                out.report["n_epochs_per_window"].as_u64().unwrap() as usize
            );
            assert_eq!(mine * 100.0, rep.coverage_pct, "({lat}, {lon})");
        }
    }

    /// B5 with terrain: the real LOLA crop, a one-point grid, equal to the bit.
    #[test]
    fn b5_equals_the_service_volume_with_the_real_terrain() {
        let terrain = LunarTerrainCfg {
            dem_path: Some("data/lunar-dem/lola_ldem_75s_1200m_crop.toml".into()),
            dem_tile_path: None,
            antenna_height_m: 2.0,
            azimuth_step_deg: 2.0,
            range_step_m: None,
            max_range_km: 60.0,
            station_horizon: None,
            user_horizon: None,
        };
        let (lat, lon) = (-89.5, 0.0);
        let scn = LunarSurfaceMapScenario {
            sites: Some(vec![SiteIn {
                name: None,
                lat_deg: lat,
                lon_deg: Some(lon),
            }]),
            season_dates: Some(vec!["2028-01-01".into()]),
            window_days: Some(3.0),
            step_min: Some(20.0),
            terrain: Some(terrain),
            ..Default::default()
        };
        let out = scn.run_phase(&c()).unwrap();
        let mine = out.report["cells"][0]["position_availability"]
            .as_f64()
            .unwrap();
        let mut svc = scn.resolve().unwrap().svc;
        svc.lat_min_deg = lat;
        svc.lat_max_deg = lat;
        svc.lat_step_deg = 1.0;
        svc.lon_min_deg = lon;
        svc.lon_max_deg = lon;
        svc.lon_step_deg = 1.0;
        let rep = svc.try_run().unwrap();
        assert_eq!(mine * 100.0, rep.coverage_pct);
        assert!(out.report["sites"][0]["horizon_max_deg"].as_f64().is_some());
    }

    #[test]
    fn terrain_never_adds_availability() {
        let flat = small().run_phase(&c()).unwrap();
        let mut t = small();
        t.terrain = Some(LunarTerrainCfg {
            dem_path: Some("data/lunar-dem/lola_ldem_75s_1200m_crop.toml".into()),
            dem_tile_path: None,
            antenna_height_m: 2.0,
            azimuth_step_deg: 2.0,
            range_step_m: None,
            max_range_km: 60.0,
            station_horizon: None,
            user_horizon: None,
        });
        let rough = t.run_phase(&c()).unwrap();
        for (a, b) in flat.report["cells"]
            .as_array()
            .unwrap()
            .iter()
            .zip(rough.report["cells"].as_array().unwrap())
        {
            for k in [
                "position_availability",
                "relay_timing_availability",
                "earth_visible",
                "sun_visible",
            ] {
                assert!(
                    b[k].as_f64().unwrap() <= a[k].as_f64().unwrap() + 1e-12,
                    "{k}"
                );
            }
        }
    }

    #[test]
    fn timing_is_at_least_either_source_and_the_season_moves_the_earth_and_sun() {
        let out = small().run_phase(&c()).unwrap();
        let cells = out.report["cells"].as_array().unwrap();
        for x in cells {
            let t = x["timing_availability"].as_f64().unwrap();
            assert!(t >= x["relay_timing_availability"].as_f64().unwrap() - 1e-12);
            assert!(t >= x["earth_visible"].as_f64().unwrap() - 1e-12);
            assert!(t <= 1.0 + 1e-12);
        }
        // The relay positioning figure does not depend on the season (Keplerian set, mean rotation).
        assert_eq!(
            cells[0]["position_availability"],
            cells[1]["position_availability"]
        );
    }

    #[test]
    fn same_inputs_give_identical_documents() {
        assert_eq!(small().run_json().unwrap().0, small().run_json().unwrap().0);
    }

    #[test]
    fn bad_inputs_are_rejected() {
        for s in [
            LunarSurfaceMapScenario {
                sites: Some(vec![]),
                ..Default::default()
            },
            LunarSurfaceMapScenario {
                season_dates: Some(vec![]),
                ..Default::default()
            },
            LunarSurfaceMapScenario {
                season_dates: Some(vec!["nope".into()]),
                ..Default::default()
            },
            LunarSurfaceMapScenario {
                window_days: Some(0.0),
                ..Default::default()
            },
            LunarSurfaceMapScenario {
                step_min: Some(0.5),
                ..Default::default()
            },
        ] {
            assert!(s.run_phase(&c()).is_err());
        }
    }
}
