// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana interference-map locate`: an estimated emitter region from ADS-B or AIS reports in local files.
//! No network. Files are never overwritten.

use std::path::{Path, PathBuf};

use super::cli::{check_args, dataset_from, flag_value, positional, read, read_adsb_input};
use super::emitter::{ais_reports, AdsbReports, EmitterParams, GaussianFix, Source};
use super::emitter_out::{locate, write_outputs};
use super::land::LandMask;
use super::sources::Kind;
use super::MapError;

/// Usage text for `kshana interference-map locate`.
pub fn locate_usage() -> String {
    crate::t!("interference-map-locate-usage")
}

const VALUED: [&str; 13] = [
    "--source",
    "--dataset",
    "--out",
    "--land",
    "--levels",
    "--cell-km",
    "--session-gap-min",
    "--emitter-height-m",
    "--ship-height-m",
    "--tdoa",
    "--licence",
    "--licence-url",
    "--attribution",
];

fn parse_f64(args: &[String], name: &str) -> Result<Option<f64>, MapError> {
    flag_value(args, name)?
        .map(|v| {
            v.parse::<f64>()
                .ok()
                .filter(|x| x.is_finite())
                .ok_or_else(|| {
                    MapError::Format(crate::terr!(
                        "e-interference-map-locate-bad-number",
                        name = name
                    ))
                })
        })
        .transpose()
}

/// The estimator's parameters from the options, and whether any differs from the pre-registered ones.
fn params_from(args: &[String]) -> Result<(EmitterParams, bool), MapError> {
    let mut p = EmitterParams::preregistered_v1();
    let base = p.clone();
    if let Some(v) = flag_value(args, "--levels")? {
        let mut l: Vec<f64> = v
            .split(',')
            .filter_map(|x| x.trim().parse::<f64>().ok())
            .collect();
        l.sort_by(|a, b| a.total_cmp(b));
        if l.is_empty() || l.iter().any(|x| !(*x > 0.0 && *x < 1.0)) {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-locate-bad-levels"
            )));
        }
        p.confidence_levels = l;
    }
    if let Some(v) = parse_f64(args, "--cell-km")? {
        if !(0.5..=100.0).contains(&v) {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-locate-bad-cell-km"
            )));
        }
        p.cell_km = v;
    }
    if let Some(v) = parse_f64(args, "--session-gap-min")? {
        if !(1.0..=720.0).contains(&v) {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-locate-bad-gap"
            )));
        }
        p.session_gap_s = v * 60.0;
    }
    if let Some(v) = flag_value(args, "--emitter-height-m")? {
        let h: Vec<f64> = v
            .split(',')
            .filter_map(|x| x.trim().parse::<f64>().ok())
            .collect();
        if h.len() != 2 || !(h[0] >= 0.0 && h[1] >= h[0] && h[1] <= 5000.0) {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-locate-bad-height"
            )));
        }
        p.emitter_height_m = (h[0].max(0.5), h[1].max(0.5));
    }
    let changed = p != base;
    Ok((p, changed))
}

fn tdoa_fix(path: &str) -> Result<GaussianFix, MapError> {
    let bad = || {
        MapError::Format(crate::terr!(
            "e-interference-map-locate-bad-tdoa",
            path = path
        ))
    };
    let v: serde_json::Value = serde_json::from_str(&read(path)?).map_err(|_| bad())?;
    let rx: Vec<(f64, f64, f64)> = v["receivers"]
        .as_array()
        .ok_or_else(bad)?
        .iter()
        .map(|r| Some((r[0].as_f64()?, r[1].as_f64()?, r[2].as_f64().unwrap_or(0.0))))
        .collect::<Option<_>>()
        .ok_or_else(bad)?;
    let tdoa: Vec<f64> = v["tdoa_s"]
        .as_array()
        .ok_or_else(bad)?
        .iter()
        .filter_map(serde_json::Value::as_f64)
        .collect();
    let sigma = v["sigma_s"].as_f64().ok_or_else(bad)?;
    let start = (
        v["start"][0].as_f64().ok_or_else(bad)?,
        v["start"][1].as_f64().ok_or_else(bad)?,
    );
    GaussianFix::from_tdoa(&rx, &tdoa, sigma, start).ok_or_else(bad)
}

/// `kshana interference-map locate ...` (the arguments after `locate`).
pub fn run_locate(args: &[String]) -> Result<(), MapError> {
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", locate_usage());
        return Ok(());
    }
    check_args(args, &VALUED, &[], 1)?;
    let input = positional(args, &VALUED).ok_or_else(|| {
        MapError::Format(crate::terr!("e-interference-map-cli-input-file-missing"))
    })?;
    let source = match flag_value(args, "--source")? {
        Some("adsb") => Source::Adsb,
        Some("ais") => Source::Ais,
        _ => {
            return Err(MapError::Format(crate::terr!(
                "e-interference-map-locate-source-required"
            )))
        }
    };
    let ds = dataset_from(
        args,
        if source == Source::Adsb {
            Kind::Adsb
        } else {
            Kind::Ais
        },
    )?;
    let out =
        PathBuf::from(flag_value(args, "--out")?.ok_or_else(|| {
            MapError::Format(crate::terr!("e-interference-map-cli-out-is-required"))
        })?);
    let (params, changed) = params_from(args)?;
    if changed {
        eprintln!(
            "{}",
            crate::t!("interference-map-locate-note-not-preregistered")
        );
    }
    let external = flag_value(args, "--tdoa")?.map(tdoa_fix).transpose()?;
    let (reports, rows) = match source {
        Source::Adsb => {
            let mut r = AdsbReports::new();
            read_adsb_input(r.aggregator(), Path::new(input))?;
            r.finish(params.min_alt_ft)
        }
        Source::Ais => {
            let mut land = match flag_value(args, "--land")? {
                Some(p) => Some(LandMask::from_geojson_str(&read(p)?, 2000.0)?),
                None => None,
            };
            let h = parse_f64(args, "--ship-height-m")?.unwrap_or(15.0);
            ais_reports(&read(input)?, land.as_mut(), h)?
        }
    };
    let o = locate(source, &reports, rows, &ds, &params, external.as_ref())?;
    for p in write_outputs(&o, &out)? {
        println!(
            "{}",
            crate::t!("interference-map-locate-wrote", path = p.display())
        );
    }
    println!(
        "{}",
        crate::t!(
            "interference-map-locate-summary",
            n_sessions = o.sessions_published,
            n_withheld = o.sessions_withheld,
            min = super::PUBLICATION_MIN_DISTINCT
        )
    );
    for l in &o.lines {
        println!("{l}");
    }
    Ok(())
}
