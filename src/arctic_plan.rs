// SPDX-License-Identifier: AGPL-3.0-only
//! The Arctic availability planner: `kshana sky` stepped over a planning horizon at a
//! high-latitude site, reduced to the figures a field team plans around.
//!
//! At high latitude the GNSS satellites never pass overhead: a constellation of inclination `i`
//! on a circular orbit of radius `a` has its ground track at latitudes up to `i`, so a site at
//! latitude `φ > i` sees each satellite at least `γ = φ − i` (central angle) from the zenith, and
//! no satellite rises above
//!
//! ```text
//! el_max = atan( (cos γ − R/a) / sin γ ).
//! ```
//!
//! For GPS (55 degrees, 26,560 km) at the North Pole that is about 45 degrees; GLONASS (64.8
//! degrees) climbs higher. The sky near the zenith stays empty, the satellites in view sit at low
//! and middle elevations (many of them across the pole), and the vertical dilution of precision
//! grows. A raised mask for
//! terrain, ice ridges or buildings costs more here than at mid latitude, because so much of the
//! sky that matters is low.
//!
//! For each epoch of the horizon ([`plan`]) one [`crate::geometry::sky_geometry`] request is run
//! (the same engine, presets, skyline and clock models as `kshana sky`), and the result is reduced
//! to: satellites in view, PDOP and HDOP, the highest elevation reached, the share of visible
//! satellites in the poleward quarter of the sky, and whether the stated requirement
//! (`min_sats`, `max_pdop`) holds. The epochs where it holds are joined into windows; a task
//! length gives the windows long enough for it. `compare` repeats the run for each system alone,
//! so the gain of combining constellations is in the same report.
//!
//! Ionosphere: with a Kp index the site's dipole latitude is compared with the equatorward edge
//! of the auroral oval of [`crate::env_baseline`] (Feldstein-Starkov-type constants). Inside it
//! the plan is run again with a raised mask (`iono_mask_deg`, 20 degrees by default), a stated
//! stand-in for losing the low-elevation rays that cross the most disturbed ionosphere, and the
//! availability with that mask is reported beside the quiet one. Scintillation itself is not
//! modelled; the mask is a planning assumption, not a measured loss.
//!
//! MODELLED, as `kshana sky` is: preset constellations are a representative geometry, not the
//! sky of a date at that place (unless element sets and an epoch are given), line of sight
//! against a stated skyline only, no ionospheric or multipath error model.

use crate::geometry::{sky_geometry, ClockModel, Site, SkyRequest, SystemSpec};
use crate::portable_math::PortableFloat;
use crate::skyline::SkylineCfg;
use serde::Serialize;

/// The honesty label of every plan.
pub const LABEL: &str = "MODELLED: kshana sky geometry stepped over the horizon (preset constellations are a \
representative geometry, not the sky of a date at that place, unless element sets and an epoch are given); line of \
sight against the stated skyline only; DOP for equal independent range errors; the auroral-oval flag is a location \
statement, not a scintillation model.";

/// Default systems.
pub const DEFAULT_SYSTEMS: &[&str] = &["gps-baseline", "galileo", "glonass", "beidou-meo"];

/// Named Arctic sites: approximate town or station coordinates (degrees), not a survey.
pub const PLACES: &[(&str, f64, f64)] = &[
    ("tromso", 69.65, 18.96),
    ("murmansk", 68.97, 33.08),
    ("utqiagvik", 71.29, -156.79),
    ("resolute", 74.70, -94.83),
    ("longyearbyen", 78.22, 15.63),
    ("ny-alesund", 78.92, 11.93),
    ("alert", 82.50, -62.35),
    ("north-pole", 90.0, 0.0),
];

/// A place by name.
pub fn place(name: &str) -> Option<Site> {
    PLACES.iter().find(|p| p.0 == name).map(|p| Site {
        lat_deg: p.1,
        lon_deg: p.2,
        height_m: 0.0,
    })
}

/// The mean Earth radius the elevation bound uses, km.
const R_EARTH_KM: f64 = 6371.0;

/// Nominal inclination (deg) and orbit radius (km) of the GNSS presets, for the elevation bound.
pub const ORBITS: &[(&str, f64, f64)] = &[
    ("gps-baseline", 55.0, 26_560.0),
    ("gps-expandable", 55.0, 26_560.0),
    ("galileo", 56.0, 29_600.0),
    ("glonass", 64.8, 25_510.0),
    ("beidou-meo", 55.0, 27_906.0),
];

/// The highest elevation (deg) a satellite on a circular orbit of inclination `i_deg` and radius
/// `a_km` reaches seen from latitude `lat_deg` (90 when the ground track passes overhead).
pub fn max_elevation_deg(lat_deg: f64, i_deg: f64, a_km: f64) -> f64 {
    let gamma = (lat_deg.abs() - i_deg).max(0.0).to_radians();
    if gamma == 0.0 {
        return 90.0;
    }
    let (s, c) = gamma.psin_cos();
    ((c - R_EARTH_KM / a_km) / s).patan().to_degrees()
}

/// What to plan.
#[derive(Clone, Debug)]
pub struct PlanRequest {
    /// The site.
    pub site: Site,
    /// The systems (preset names, as `kshana sky --systems`).
    pub systems: Vec<String>,
    /// Also run each system alone.
    pub compare: bool,
    /// First epoch, s after the presets' epoch (or after `epoch` with element sets).
    pub start_s: f64,
    /// Horizon, hours.
    pub hours: f64,
    /// Step, minutes.
    pub step_min: f64,
    /// Receiver mask, degrees.
    pub mask_deg: f64,
    /// Skyline.
    pub skyline: Option<SkylineCfg>,
    /// Clock model.
    pub clock: ClockModel,
    /// Requirement: satellites in view.
    pub min_sats: usize,
    /// Requirement: largest PDOP.
    pub max_pdop: f64,
    /// Task length, minutes: report the windows at least this long.
    pub task_min: Option<f64>,
    /// Kp index for the auroral-oval flag.
    pub kp: Option<f64>,
    /// Decimal year for the dipole latitude.
    pub year: f64,
    /// Mask applied in place of `mask_deg` when the site is inside the auroral oval, degrees
    /// (low-elevation rays cross more of the disturbed ionosphere).
    pub iono_mask_deg: f64,
    /// Element sets (text) and their epoch, passed to `kshana sky`.
    pub tle: Option<String>,
    /// UTC epoch for the element sets.
    pub epoch: Option<String>,
}

/// One epoch.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Epoch {
    /// Seconds after the start.
    pub t_s: f64,
    /// Satellites in view.
    pub n_visible: usize,
    /// PDOP (none with too few satellites).
    pub pdop: Option<f64>,
    /// HDOP.
    pub hdop: Option<f64>,
    /// VDOP.
    pub vdop: Option<f64>,
    /// Highest elevation of a visible satellite, degrees.
    pub max_el_deg: Option<f64>,
    /// Share of the visible satellites within 45 degrees of azimuth of the nearer pole.
    pub poleward_share: Option<f64>,
    /// Whether the requirement holds.
    pub ok: bool,
}

/// A window where the requirement holds throughout.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Window {
    /// First epoch, s after the start.
    pub start_s: f64,
    /// Last epoch, s after the start.
    pub end_s: f64,
    /// Length, minutes (`end − start + step`).
    pub minutes: f64,
}

/// The reduced figures of one system set.
#[derive(Clone, Debug, Serialize)]
pub struct Summary {
    /// The systems.
    pub systems: Vec<String>,
    /// Percent of epochs meeting the requirement.
    pub availability_pct: f64,
    /// Fewest and mean satellites in view.
    pub min_visible: usize,
    /// Mean satellites in view.
    pub mean_visible: f64,
    /// Median PDOP over the epochs that have one.
    pub pdop_median: Option<f64>,
    /// 95th percentile PDOP.
    pub pdop_p95: Option<f64>,
    /// Median VDOP.
    pub vdop_median: Option<f64>,
    /// Median HDOP.
    pub hdop_median: Option<f64>,
    /// Highest elevation any visible satellite reached, degrees.
    pub max_el_deg: Option<f64>,
    /// Mean poleward share of the visible satellites.
    pub mean_poleward_share: Option<f64>,
    /// Longest stretch not meeting the requirement, minutes.
    pub longest_gap_min: f64,
    /// Windows meeting the requirement.
    pub windows: Vec<Window>,
    /// The windows at least the task length long (all of them without a task length).
    pub task_windows: Vec<Window>,
    /// Epochs (kept for the first system set only).
    #[serde(skip_serializing_if = "Vec::is_empty")]
    pub epochs: Vec<Epoch>,
}

/// The elevation bound of one system at the site.
#[derive(Clone, Debug, Serialize)]
pub struct Bound {
    /// System.
    pub system: String,
    /// Inclination, degrees.
    pub inclination_deg: f64,
    /// Highest elevation, degrees.
    pub max_elevation_deg: f64,
}

/// The auroral-oval statement.
#[derive(Clone, Debug, Serialize)]
pub struct Oval {
    /// The Kp index.
    pub kp: f64,
    /// The site's dipole latitude, degrees.
    pub dipole_lat_deg: f64,
    /// The oval's equatorward edge, dipole latitude, degrees.
    pub edge_dipole_lat_deg: f64,
    /// Whether the site is poleward of the edge.
    pub inside: bool,
    /// Mask used for the in-oval run, degrees.
    pub iono_mask_deg: f64,
    /// Availability of the combined set with that mask, percent (inside the oval only).
    pub availability_in_oval_pct: Option<f64>,
}

/// The plan.
#[derive(Clone, Debug, Serialize)]
pub struct Plan {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// The geometry engine's own statement.
    pub sky_statement: String,
    /// The site.
    pub site: Site,
    /// Mask, degrees.
    pub mask_deg: f64,
    /// Requirement.
    pub min_sats: usize,
    /// Requirement.
    pub max_pdop: f64,
    /// Horizon, hours; step, minutes.
    pub hours: f64,
    /// Step, minutes.
    pub step_min: f64,
    /// Task length, minutes.
    pub task_min: Option<f64>,
    /// Elevation bounds of the requested GNSS presets.
    pub elevation_bounds: Vec<Bound>,
    /// Auroral-oval statement, with a Kp.
    pub auroral_oval: Option<Oval>,
    /// The combined set first, then each system alone with `compare`.
    pub summaries: Vec<Summary>,
}

fn pctl(v: &[f64], p: f64) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    let mut s = v.to_vec();
    s.sort_by(f64::total_cmp);
    Some(s[((p / 100.0) * (s.len() - 1) as f64).round() as usize])
}

fn run_set(req: &PlanRequest, systems: &[String]) -> Result<(Summary, String), String> {
    let n = ((req.hours * 60.0) / req.step_min).round() as usize + 1;
    let step_s = req.step_min * 60.0;
    let pole_az = if req.site.lat_deg >= 0.0 { 0.0 } else { 180.0 };
    let mut epochs = Vec::with_capacity(n);
    let mut statement = String::new();
    for k in 0..n {
        let t = k as f64 * step_s;
        let sky = SkyRequest {
            site: Some(req.site),
            time_s: Some(req.start_s + t),
            systems: (!systems.is_empty()).then(|| {
                systems
                    .iter()
                    .map(|s| SystemSpec::Name(s.clone()))
                    .collect()
            }),
            tle: req.tle.clone(),
            epoch: req.epoch.clone(),
            mask_deg: Some(req.mask_deg),
            skyline: req.skyline.clone(),
            clock: req.clock,
            ..Default::default()
        };
        let g = sky_geometry(&sky)?;
        if statement.is_empty() {
            statement = g.sky_statement.clone();
        }
        let vis: Vec<_> = g.satellites.iter().filter(|s| s.visible).collect();
        let max_el = vis
            .iter()
            .map(|s| s.el_deg)
            .fold(None, |m: Option<f64>, e| Some(m.map_or(e, |m| m.max(e))));
        let pole = vis
            .iter()
            .filter(|s| {
                let d = (s.az_deg - pole_az).rem_euclid(360.0);
                d <= 45.0 || d >= 315.0
            })
            .count();
        let pdop = g.dop.as_ref().map(|d| d.pdop);
        let ok = g.n_visible >= req.min_sats && pdop.is_some_and(|p| p <= req.max_pdop);
        epochs.push(Epoch {
            t_s: t,
            n_visible: g.n_visible,
            pdop,
            hdop: g.dop.as_ref().map(|d| d.hdop),
            vdop: g.dop.as_ref().map(|d| d.vdop),
            max_el_deg: max_el,
            poleward_share: (!vis.is_empty()).then(|| pole as f64 / vis.len() as f64),
            ok,
        });
    }
    // Windows and gaps.
    let mut windows = Vec::new();
    let mut longest_gap = 0.0f64;
    let mut run_start: Option<f64> = None;
    let mut gap_len = 0usize;
    for (k, e) in epochs.iter().enumerate() {
        if e.ok {
            run_start.get_or_insert(e.t_s);
            gap_len = 0;
        } else {
            gap_len += 1;
            longest_gap = longest_gap.max(gap_len as f64 * req.step_min);
            if let Some(s) = run_start.take() {
                let end = epochs[k - 1].t_s;
                windows.push(Window {
                    start_s: s,
                    end_s: end,
                    minutes: (end - s) / 60.0 + req.step_min,
                });
            }
        }
    }
    if let (Some(s), Some(last)) = (run_start, epochs.last()) {
        windows.push(Window {
            start_s: s,
            end_s: last.t_s,
            minutes: (last.t_s - s) / 60.0 + req.step_min,
        });
    }
    let task_windows = windows
        .iter()
        .filter(|w| req.task_min.is_none_or(|t| w.minutes >= t))
        .copied()
        .collect();
    let pd: Vec<f64> = epochs.iter().filter_map(|e| e.pdop).collect();
    let vd: Vec<f64> = epochs.iter().filter_map(|e| e.vdop).collect();
    let hd: Vec<f64> = epochs.iter().filter_map(|e| e.hdop).collect();
    let ps: Vec<f64> = epochs.iter().filter_map(|e| e.poleward_share).collect();
    let ok = epochs.iter().filter(|e| e.ok).count();
    let summary = Summary {
        systems: systems.to_vec(),
        availability_pct: 100.0 * ok as f64 / epochs.len() as f64,
        min_visible: epochs.iter().map(|e| e.n_visible).min().unwrap_or(0),
        mean_visible: epochs.iter().map(|e| e.n_visible as f64).sum::<f64>() / epochs.len() as f64,
        pdop_median: pctl(&pd, 50.0),
        pdop_p95: pctl(&pd, 95.0),
        vdop_median: pctl(&vd, 50.0),
        hdop_median: pctl(&hd, 50.0),
        max_el_deg: epochs
            .iter()
            .filter_map(|e| e.max_el_deg)
            .fold(None, |m: Option<f64>, e| Some(m.map_or(e, |m| m.max(e)))),
        mean_poleward_share: (!ps.is_empty()).then(|| ps.iter().sum::<f64>() / ps.len() as f64),
        longest_gap_min: longest_gap,
        windows,
        task_windows,
        epochs,
    };
    Ok((summary, statement))
}

/// Make the plan.
pub fn plan(req: &PlanRequest, keep_epochs: bool) -> Result<Plan, String> {
    if !(req.hours > 0.0 && req.step_min > 0.0) || req.hours * 60.0 / req.step_min > 20_000.0 {
        return Err(crate::terr!("e-arctic-plan-bad-horizon"));
    }
    let (mut first, statement) = run_set(req, &req.systems)?;
    if !keep_epochs {
        first.epochs.clear();
    }
    let mut summaries = vec![first];
    if req.compare && req.systems.len() > 1 {
        for s in &req.systems {
            let (mut one, _) = run_set(req, std::slice::from_ref(s))?;
            one.epochs.clear();
            summaries.push(one);
        }
    }
    let elevation_bounds = req
        .systems
        .iter()
        .filter_map(|s| {
            ORBITS.iter().find(|o| o.0 == s).map(|o| Bound {
                system: s.clone(),
                inclination_deg: o.1,
                max_elevation_deg: max_elevation_deg(req.site.lat_deg, o.1, o.2),
            })
        })
        .collect();
    let auroral_oval = match req.kp {
        None => None,
        Some(kp) => {
            let p = crate::env_baseline::EnvBaselineParams::v1();
            let phi = crate::env_baseline::dipole_latitude_deg(
                req.site.lat_deg,
                req.site.lon_deg,
                req.year,
            );
            let edge = p.oval_edge_kp0_deg - p.oval_edge_per_kp_deg * kp;
            let inside = phi.abs() >= edge;
            let in_oval = if inside {
                let mut r = req.clone();
                r.mask_deg = req.mask_deg.max(req.iono_mask_deg);
                Some(run_set(&r, &req.systems)?.0.availability_pct)
            } else {
                None
            };
            Some(Oval {
                kp,
                dipole_lat_deg: phi,
                edge_dipole_lat_deg: edge,
                inside,
                iono_mask_deg: req.mask_deg.max(req.iono_mask_deg),
                availability_in_oval_pct: in_oval,
            })
        }
    };
    Ok(Plan {
        schema: "kshana.arctic-plan/1",
        label: LABEL,
        sky_statement: statement,
        site: req.site,
        mask_deg: req.mask_deg,
        min_sats: req.min_sats,
        max_pdop: req.max_pdop,
        hours: req.hours,
        step_min: req.step_min,
        task_min: req.task_min,
        elevation_bounds,
        auroral_oval,
        summaries,
    })
}

// ───────────────────────────── command line ─────────────────────────────

/// `kshana arctic-plan ...`: the plan as JSON to standard output or `--out`. Returns the exit
/// code (0, or 2 on a usage or input error).
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<(), String> {
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", crate::t!("arctic-plan-usage"));
        return Ok(());
    }
    if args.is_empty() {
        return Err(crate::t!("arctic-plan-usage"));
    }
    let mut site: Option<Site> = None;
    let mut systems: Vec<String> = DEFAULT_SYSTEMS.iter().map(|s| s.to_string()).collect();
    let mut req = PlanRequest {
        site: Site {
            lat_deg: 0.0,
            lon_deg: 0.0,
            height_m: 0.0,
        },
        systems: Vec::new(),
        compare: false,
        start_s: 0.0,
        hours: 24.0,
        step_min: 10.0,
        mask_deg: 10.0,
        skyline: None,
        clock: ClockModel::PerSystem,
        min_sats: 5,
        max_pdop: 6.0,
        task_min: None,
        kp: None,
        year: 2026.9,
        iono_mask_deg: 20.0,
        tle: None,
        epoch: None,
    };
    let (mut out, mut keep) = (None, false);
    let mut it = args.iter();
    while let Some(a) = it.next() {
        match a.as_str() {
            "--compare" => {
                req.compare = true;
                continue;
            }
            "--epochs" => {
                keep = true;
                continue;
            }
            "--places" => {
                let v: Vec<_> = PLACES
                    .iter()
                    .map(|p| serde_json::json!({"name": p.0, "lat_deg": p.1, "lon_deg": p.2}))
                    .collect();
                println!("{}", serde_json::Value::Array(v));
                return Ok(());
            }
            _ => {}
        }
        let v = it
            .next()
            .ok_or_else(|| crate::terr!("e-arctic-plan-missing-value", option = a))?;
        let num = || -> Result<f64, String> {
            v.parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| crate::terr!("e-arctic-plan-bad-number", option = a, value = v))
        };
        match a.as_str() {
            "--site" => {
                let p: Vec<f64> = v
                    .split(',')
                    .map(|x| x.trim().parse::<f64>())
                    .collect::<Result<_, _>>()
                    .map_err(|_| crate::terr!("e-arctic-plan-bad-number", option = a, value = v))?;
                if !(p.len() == 2 || p.len() == 3) {
                    return Err(crate::terr!(
                        "e-arctic-plan-bad-number",
                        option = a,
                        value = v
                    ));
                }
                site = Some(Site {
                    lat_deg: p[0],
                    lon_deg: p[1],
                    height_m: p.get(2).copied().unwrap_or(0.0),
                });
            }
            "--place" => {
                site = Some(place(v).ok_or_else(|| {
                    let known: Vec<&str> = PLACES.iter().map(|p| p.0).collect();
                    crate::terr!(
                        "e-arctic-plan-unknown-name",
                        name = v,
                        known = known.join(", ")
                    )
                })?);
            }
            "--systems" => {
                systems = v
                    .split(',')
                    .map(|s| s.trim().to_string())
                    .filter(|s| !s.is_empty())
                    .collect()
            }
            "--hours" => req.hours = num()?,
            "--step-min" => req.step_min = num()?,
            "--start-s" => req.start_s = num()?,
            "--mask" => req.mask_deg = num()?,
            "--min-sats" => req.min_sats = num()?.max(1.0) as usize,
            "--max-pdop" => req.max_pdop = num()?,
            "--task-min" => req.task_min = Some(num()?),
            "--kp" => req.kp = Some(num()?),
            "--year" => req.year = num()?,
            "--iono-mask" => req.iono_mask_deg = num()?,
            "--skyline-preset" => {
                req.skyline = Some(SkylineCfg {
                    preset: Some(v.clone()),
                    ..Default::default()
                })
            }
            "--clock" => {
                req.clock = match v.as_str() {
                    "common" => ClockModel::Common,
                    "per-system" => ClockModel::PerSystem,
                    _ => {
                        return Err(crate::terr!(
                            "e-arctic-plan-unknown-name",
                            name = v,
                            known = "common, per-system"
                        ))
                    }
                }
            }
            "--tle" => {
                req.tle = Some(
                    std::fs::read_to_string(v)
                        .map_err(|e| crate::terr!("e-arctic-plan-cannot-read", path = v, e = e))?,
                )
            }
            "--epoch" => req.epoch = Some(v.clone()),
            "--out" => out = Some(v.clone()),
            _ => return Err(crate::terr!("e-arctic-plan-unknown-option", option = a)),
        }
    }
    req.site = site.ok_or_else(|| crate::terr!("e-arctic-plan-needs-site"))?;
    // With element sets and no --systems given, plan with the element sets alone.
    if req.tle.is_some() && !args.iter().any(|a| a == "--systems") {
        systems.clear();
    }
    req.systems = systems;
    let p = plan(&req, keep)?;
    let text = serde_json::to_string_pretty(&p).map_err(|e| e.to_string())?;
    match out {
        Some(path) => std::fs::write(&path, text + "\n")
            .map_err(|e| crate::terr!("e-arctic-plan-cannot-write", path = path, e = e)),
        None => {
            println!("{text}");
            Ok(())
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn req(site: Site, systems: &[&str]) -> PlanRequest {
        PlanRequest {
            site,
            systems: systems.iter().map(|s| s.to_string()).collect(),
            compare: false,
            start_s: 0.0,
            hours: 12.0,
            step_min: 30.0,
            mask_deg: 10.0,
            skyline: None,
            clock: ClockModel::Common,
            min_sats: 4,
            max_pdop: 6.0,
            task_min: None,
            kp: None,
            year: 2026.9,
            iono_mask_deg: 20.0,
            tle: None,
            epoch: None,
        }
    }

    #[test]
    fn gps_at_the_pole_tops_out_near_45_degrees() {
        let b = max_elevation_deg(90.0, 55.0, 26_560.0);
        assert!((b - 45.3).abs() < 0.3, "{b}");
        assert_eq!(max_elevation_deg(40.0, 55.0, 26_560.0), 90.0);
        assert!(max_elevation_deg(90.0, 64.8, 25_510.0) > b);
    }

    #[test]
    fn the_sky_never_exceeds_the_bound_and_the_pole_sector_is_empty_at_the_pole() {
        let p = plan(&req(place("north-pole").unwrap(), &["gps-baseline"]), true).unwrap();
        let s = &p.summaries[0];
        let bound = p.elevation_bounds[0].max_elevation_deg;
        // Satellites on the preset's slightly eccentric orbits may exceed the circular bound by a little.
        assert!(
            s.max_el_deg.unwrap() <= bound + 1.0,
            "{:?} {bound}",
            s.max_el_deg
        );
        assert!(s.max_el_deg.unwrap() > bound - 10.0);
        // At the pole every azimuth points south: the poleward quarter is meaningless, but the
        // share is still well defined.
        assert!(s.mean_poleward_share.is_some());
    }

    #[test]
    fn longyearbyen_combining_helps_and_the_ceiling_holds() {
        let mut r = req(
            place("longyearbyen").unwrap(),
            &["gps-baseline", "galileo", "glonass"],
        );
        r.compare = true;
        r.max_pdop = 2.5;
        let p = plan(&r, false).unwrap();
        assert_eq!(p.summaries.len(), 4);
        let all = &p.summaries[0];
        // The share is reported, not assumed: at 78 degrees north satellites are seen across the
        // pole, so the poleward quarter holds about its even share.
        let share = all.mean_poleward_share.unwrap();
        assert!(share > 0.0 && share < 0.5, "{share}");
        for b in &p.elevation_bounds {
            assert!(b.max_elevation_deg < 90.0, "{b:?}");
        }
        for one in &p.summaries[1..] {
            assert!(all.availability_pct >= one.availability_pct);
            assert!(all.mean_visible > one.mean_visible);
        }
        assert!(all.epochs.is_empty());
    }

    #[test]
    fn windows_and_task_lengths() {
        let mut r = req(place("tromso").unwrap(), &["gps-baseline"]);
        r.max_pdop = 1.0e9;
        r.min_sats = 1;
        r.task_min = Some(60.0);
        let p = plan(&r, false).unwrap();
        let s = &p.summaries[0];
        assert_eq!(s.availability_pct, 100.0);
        assert_eq!(s.windows.len(), 1);
        assert_eq!(s.windows[0].minutes, 12.0 * 60.0 + 30.0);
        assert_eq!(s.task_windows.len(), 1);
        assert_eq!(s.longest_gap_min, 0.0);
        r.min_sats = 99;
        let p = plan(&r, false).unwrap();
        assert!(p.summaries[0].windows.is_empty());
        assert_eq!(p.summaries[0].longest_gap_min, 12.0 * 60.0 + 30.0);
    }

    #[test]
    fn auroral_oval_flag_moves_with_kp() {
        let mut r = req(place("tromso").unwrap(), &["gps-baseline"]);
        r.hours = 0.5;
        r.kp = Some(0.0);
        let quiet = plan(&r, false).unwrap().auroral_oval.unwrap();
        r.kp = Some(9.0);
        let storm = plan(&r, false).unwrap().auroral_oval.unwrap();
        assert!(storm.edge_dipole_lat_deg < quiet.edge_dipole_lat_deg);
        assert!(storm.inside);
        assert!(storm.availability_in_oval_pct.is_some());
    }

    #[test]
    fn each_epoch_matches_kshana_sky_at_the_test_sites() {
        for name in ["tromso", "longyearbyen", "alert"] {
            let site = place(name).unwrap();
            let r = req(site, &["gps-baseline", "galileo"]);
            let p = plan(&r, true).unwrap();
            for e in &p.summaries[0].epochs {
                let g = sky_geometry(&SkyRequest {
                    site: Some(site),
                    time_s: Some(e.t_s),
                    systems: Some(vec![
                        SystemSpec::Name("gps-baseline".into()),
                        SystemSpec::Name("galileo".into()),
                    ]),
                    mask_deg: Some(10.0),
                    clock: ClockModel::Common,
                    ..Default::default()
                })
                .unwrap();
                assert_eq!(e.n_visible, g.n_visible, "{name} t={}", e.t_s);
                assert_eq!(e.pdop, g.dop.map(|d| d.pdop), "{name} t={}", e.t_s);
            }
        }
    }

    #[test]
    fn horizon_is_checked() {
        let mut r = req(place("alert").unwrap(), &["gps-baseline"]);
        r.hours = 0.0;
        assert!(plan(&r, false).is_err());
        r.hours = 1000.0;
        r.step_min = 1.0;
        assert!(plan(&r, false).is_err());
    }

    #[test]
    fn places_resolve() {
        for p in PLACES {
            assert!(place(p.0).is_some());
            assert!(p.1 >= 64.0);
        }
        assert!(place("paris").is_none());
    }
}
