// SPDX-License-Identifier: AGPL-3.0-only
//! Outputs of `kshana interference-map locate`: a GeoJSON of regions, a JSON summary, a sessions table (CSV) and
//! a figure (SVG), each carrying the licence, attribution, method id, assumptions and limits, and the evidence
//! label of the ledger row behind it.
//!
//! Aggregate only: no aircraft or vessel identifier appears in any output, a session is published only with at
//! least [`PUBLICATION_MIN_DISTINCT`] distinct aircraft or vessels, and the wording is neutral: an estimated
//! emitter region says where, under stated assumptions, a source of the degraded reports could be, and nothing
//! about who or what is behind it.

use serde_json::{json, Value};

use super::emitter::{
    affected_area_km2, build_units, estimate, profile, sessions, EmitterParams, EmitterStats,
    Estimate, GaussianFix, Proj, Report, Session, Source, METHOD_ID,
};
use super::sources::Dataset;
use super::time::day_of;
use super::{MapError, PUBLICATION_MIN_DISTINCT};

/// Name of the output schema.
pub const SCHEMA: &str = "kshana-emitter-region/v1";
/// Integer form of the schema version.
pub const FORMAT_VERSION: u32 = 1;
/// The evidence-label tool key of these outputs.
pub const TOOL: &str = "interference-map-locate";

/// All four outputs of a run, as labelled text, and the stem of their file names.
#[derive(Debug, Clone, PartialEq)]
pub struct LocateOutput {
    /// `emitter-<source>-<dataset>-<first day>[_<last day>]`; the writer adds `.geojson`, `-summary.json`,
    /// `-sessions.csv` and `-figure.svg`.
    pub stem: String,
    /// GeoJSON FeatureCollection of the regions, centroids and ellipses.
    pub geojson: String,
    /// The JSON summary.
    pub summary: String,
    /// One row per published session.
    pub csv: String,
    /// The figure.
    pub svg: String,
    /// Published sessions.
    pub sessions_published: usize,
    /// Candidate sessions withheld below the publication minimum.
    pub sessions_withheld: usize,
    /// One human-readable line per published session (localised).
    pub lines: Vec<String>,
}

fn minute(t: f64) -> String {
    let m = (t / 60.0).floor() * 60.0;
    format!(
        "{}T{:02}:{:02}Z",
        day_of(m),
        (m.rem_euclid(86_400.0) / 3600.0) as u32,
        (m.rem_euclid(3600.0) / 60.0) as u32
    )
}

fn round(x: f64, d: i32) -> f64 {
    let f = 10f64.powi(d);
    (x * f).round() / f
}

fn withheld_below_min(n: usize) -> Value {
    if n >= PUBLICATION_MIN_DISTINCT {
        json!(n)
    } else {
        Value::Null
    }
}

fn session_json(k: usize, s: &Session, e: &Estimate) -> Value {
    json!({
        "session": k,
        "start_utc": minute(s.start),
        "end_utc": minute(s.end),
        "duration_min": round((s.end - s.start) / 60.0, 0),
        "affected_distinct": s.distinct_affected(),
        "observed_distinct": s.distinct_observed(),
        "affected_area_km2": round(affected_area_km2(s), 0),
        "affected_mean_position": {"lat": round(s.affected.iter().map(|u| u.lat).sum::<f64>() / s.affected.len() as f64, 3), "lon": round(s.affected.iter().map(|u| u.lon).sum::<f64>() / s.affected.len() as f64, 3)},
        "status": if e.unconstrained { "unconstrained" } else { "constrained" },
        "centroid": if e.unconstrained { Value::Null } else { json!({"lat": round(e.centroid.0, 3), "lon": round(e.centroid.1, 3)}) },
        "uncertainty_ellipse_95": {
            "semi_major_km": round(e.ellipse.0, 1),
            "semi_minor_km": round(e.ellipse.1, 1),
            "azimuth_deg": round(e.ellipse.2, 0),
        },
        "regions": e.regions.iter().map(|r| json!({"confidence": r.level, "area_km2": round(r.area_km2, 0)})).collect::<Vec<_>>(),
        "search": {
            "domain_area_km2": round(e.domain_area_km2, 0),
            "cell_km": round(e.cell_km, 2),
            "units_affected": e.units.0,
            "units_unaffected_used": e.units.1,
            "units_unaffected_thinned": e.units.2,
            "unaffected_distinct_with_line_of_sight_to_centroid": withheld_below_min(e.unaffected_with_los),
        },
    })
}

fn ring_json(r: &[[f64; 2]]) -> Value {
    json!(r
        .iter()
        .map(|p| [round(p[0], 5), round(p[1], 5)])
        .collect::<Vec<_>>())
}

fn features(k: usize, e: &Estimate) -> Vec<Value> {
    let mut out = Vec::new();
    for r in e.regions.iter().rev() {
        let polys: Vec<Value> = r
            .polygons
            .iter()
            .map(|p| json!(p.iter().map(|ring| ring_json(ring)).collect::<Vec<_>>()))
            .collect();
        out.push(json!({
            "type": "Feature",
            "properties": {
                "kind": "estimated_emitter_region",
                "session": k,
                "confidence": r.level,
                "area_km2": round(r.area_km2, 0),
                "unconstrained": e.unconstrained,
            },
            "geometry": {"type": "MultiPolygon", "coordinates": polys},
        }));
    }
    out.push(json!({
        "type": "Feature",
        "properties": {
            "kind": "uncertainty_ellipse_95",
            "session": k,
            "semi_major_km": round(e.ellipse.0, 1),
            "semi_minor_km": round(e.ellipse.1, 1),
            "azimuth_deg": round(e.ellipse.2, 0),
        },
        "geometry": {"type": "Polygon", "coordinates": [ring_json(&e.ellipse_ring)]},
    }));
    if !e.unconstrained {
        out.push(json!({
            "type": "Feature",
            "properties": {
                "kind": "estimated_emitter_centroid",
                "session": k,
                "semi_major_km": round(e.ellipse.0, 1),
                "semi_minor_km": round(e.ellipse.1, 1),
                "azimuth_deg": round(e.ellipse.2, 0),
                "note": "centroid of the posterior, always read with its uncertainty ellipse; not a position fix",
            },
            "geometry": {"type": "Point", "coordinates": [round(e.centroid.1, 4), round(e.centroid.0, 4)]},
        }));
    }
    out
}

const NOTICE: &str = "Estimated emitter regions: where, under the stated assumptions, a source of the degraded position reports could be. A region is not the position of any aircraft, vessel, person or organisation, is not a finding of the cause, and says nothing about who or what is behind a source. A region can be wrong when the assumptions fail. No aircraft or vessel identifiers appear in this file; a session is published only with at least the minimum number of distinct aircraft or vessels.";

fn method_block(
    params: &EmitterParams,
    stats: &EmitterStats,
    rows_read: u64,
    source: Source,
) -> Value {
    json!({
        "id": METHOD_ID,
        "summary": "Posterior over candidate emitter positions from radio line of sight to affected and unaffected aircraft or vessels, per session; highest-density regions at stated confidence levels, a posterior centroid and a moment ellipse.",
        "parameters": params.to_json(),
        "assumptions": [
            "Radio horizon on a 4/3-earth radius from the report height and an emitter antenna height range; terrain is not modelled (it can only remove line of sight).",
            "The emitter's power is unknown: an effective range is marginalised over a fixed list, up to line of sight only.",
            "Each aircraft or vessel is susceptible with a fixed probability; a unit of a susceptible one within reach is affected with a fixed probability, and any other unit at a background rate.",
            "One source per session; sessions are split in time by a gap and in space by reach overlap.",
            "Susceptibility and a persistent equipment fault are latent properties of the aircraft or vessel and are summed out per aircraft, so the units of one aircraft are not counted as independent evidence and an unaffected aircraft with line of sight counts against a position by at most one aircraft.",
            "The posterior is uniform a priori over the search domain, the cells within reach of at least one affected unit.",
        ],
        "limits": [
            "Confidence levels are credibility under this model, not a measured coverage of real sources; the calibration is checked on synthetic data only.",
            "Coverage bias: a region is wide where few aircraft or vessels were present, and a source with no traffic in reach cannot be located; a region that fills the domain is reported as unconstrained.",
            "Terrain, ducting and diffraction are not modelled, so a source beyond the horizon or in a shadow can be missed.",
            "Several simultaneous sources close together look like one, with a larger region.",
            "A regional cause (a constellation or augmentation outage, space weather) gives a region that is not a source.",
            "Aggregate only; a session below the publication minimum of distinct aircraft or vessels is withheld.",
        ],
        "guards": [
            "airborne ADS-B reports above the altitude floor only",
            "an aircraft or vessel counts only with good reports elsewhere in the input (equipment baseline)",
            "distinct aircraft or vessels are counted, not reports",
            "sessions with fewer than the publication minimum of distinct aircraft or vessels are not published",
            "hour-of-day counts below the publication minimum are null",
        ],
        "input_stats": {
            "source_kind": source.as_str(),
            "rows_read": rows_read,
            "reports_used": stats.reports_used,
            "aircraft_or_vessels_without_baseline": stats.excluded_no_baseline,
            "units": stats.units,
            "units_affected": stats.units_affected,
            "sessions_withheld_below_min_distinct": stats.sessions_suppressed_below_min_distinct,
        },
    })
}

/// Run the estimator on reports and write the four labelled outputs in memory.
pub fn locate(
    source: Source,
    reports: &[Report],
    rows_read: u64,
    dataset: &Dataset,
    params: &EmitterParams,
    external: Option<&GaussianFix>,
) -> Result<LocateOutput, MapError> {
    let mut stats = EmitterStats::default();
    let units = build_units(reports, params, &mut stats);
    let sess = sessions(&units, params, &mut stats);
    let mut estimates = Vec::new();
    for s in &sess {
        match estimate(s, params, external) {
            Some(e) => estimates.push((s, e)),
            None => stats.sessions_suppressed_below_min_distinct += 1,
        }
    }
    let pub_sessions: Vec<Session> = estimates.iter().map(|(s, _)| (*s).clone()).collect();
    let prof = profile(&pub_sessions);
    let mut feats = Vec::new();
    let mut sj = Vec::new();
    let mut lines = Vec::new();
    let mut csv = String::from("session,start_utc,end_utc,duration_min,affected_distinct,observed_distinct,affected_area_km2,status,centroid_lat,centroid_lon,ellipse_semi_major_km,ellipse_semi_minor_km,ellipse_azimuth_deg");
    for l in &params.confidence_levels {
        csv.push_str(&format!(",area_km2_{}", (l * 100.0).round() as u32));
    }
    csv.push('\n');
    for (k, (s, e)) in estimates.iter().enumerate() {
        let k = k + 1;
        let j = session_json(k, s, e);
        feats.extend(features(k, e));
        let g = |p: &str| j[p].clone();
        let c = |v: &Value| {
            if v.is_null() {
                String::new()
            } else {
                v.to_string()
            }
        };
        csv.push_str(&format!(
            "{k},{},{},{},{},{},{},{},{},{},{},{},{}",
            g("start_utc").as_str().unwrap_or(""),
            g("end_utc").as_str().unwrap_or(""),
            g("duration_min"),
            g("affected_distinct"),
            g("observed_distinct"),
            g("affected_area_km2"),
            g("status").as_str().unwrap_or(""),
            c(&j["centroid"]["lat"]),
            c(&j["centroid"]["lon"]),
            j["uncertainty_ellipse_95"]["semi_major_km"],
            j["uncertainty_ellipse_95"]["semi_minor_km"],
            j["uncertainty_ellipse_95"]["azimuth_deg"],
        ));
        for r in &e.regions {
            csv.push_str(&format!(",{}", round(r.area_km2, 0)));
        }
        csv.push('\n');
        let (start, end) = (minute(s.start), minute(s.end));
        let top = e.regions.last().map_or(0.0, |r| r.area_km2);
        lines.push(if e.unconstrained {
            crate::t!(
                "interference-map-locate-line-unconstrained",
                k = k,
                start = start,
                end = end,
                affected = s.distinct_affected()
            )
        } else {
            crate::t!(
                "interference-map-locate-line-session",
                k = k,
                start = start,
                end = end,
                affected = s.distinct_affected(),
                level = (params.confidence_levels.last().copied().unwrap_or(0.0) * 100.0).round()
                    as u32,
                area = crate::i18n::num(top, 0),
                lat = crate::i18n::num(e.centroid.0, 3),
                lon = crate::i18n::num(e.centroid.1, 3),
                a = crate::i18n::num(e.ellipse.0, 1),
                b = crate::i18n::num(e.ellipse.1, 1)
            )
        });
        sj.push(j);
    }
    let first = reports.iter().map(|r| r.t).fold(f64::INFINITY, f64::min);
    let last = reports
        .iter()
        .map(|r| r.t)
        .fold(f64::NEG_INFINITY, f64::max);
    let (d0, d1) = if reports.is_empty() {
        ("none".to_string(), "none".to_string())
    } else {
        (day_of(first), day_of(last))
    };
    let stem = if d0 == d1 {
        format!("emitter-{}-{}-{}", source.as_str(), dataset.key, d0)
    } else {
        format!("emitter-{}-{}-{}_{}", source.as_str(), dataset.key, d0, d1)
    };
    let member = json!({
        "schema": SCHEMA,
        "format_version": FORMAT_VERSION,
        "kshana_version": env!("CARGO_PKG_VERSION"),
        "notice": NOTICE,
        "source_kind": source.as_str(),
        "first_day": d0,
        "last_day": d1,
        "data": dataset.to_json(),
        "method": method_block(params, &stats, rows_read, source),
        "sessions": sj,
        "sessions_published": estimates.len(),
        "sessions_withheld": stats.sessions_suppressed_below_min_distinct,
        "profile": {
            "utc_hour_distinct_affected": prof.distinct_by_hour,
            "utc_hour_session_minutes": prof.minutes_by_hour.iter().map(|m| round(*m, 0)).collect::<Vec<_>>(),
            "hours_per_day": prof.hours_per_day.iter().map(|(d, h)| (d.clone(), json!(round(*h, 2)))).collect::<serde_json::Map<_, _>>(),
            "note": "hour counts below the publication minimum are null (withheld), never zero",
        },
    });
    let ser = |v: &Value| {
        serde_json::to_string_pretty(v)
            .map(|t| t + "\n")
            .map_err(|e| MapError::Format(e.to_string()))
    };
    let geo =
        json!({"type": "FeatureCollection", "kshana_emitter_region": member, "features": feats});
    let sum = json!({"kshana_emitter_region": member});
    let label = |e: String| MapError::Format(e);
    let geojson = crate::evidence_label::label_json(TOOL, &ser(&geo)?).map_err(label)?;
    let summary = crate::evidence_label::label_json(TOOL, &ser(&sum)?).map_err(label)?;
    let csv = crate::evidence_label::label_csv(TOOL, &csv).map_err(label)?;
    let svg = figure(&estimates, params);
    let svg = crate::evidence_label::EvidenceLabel::for_tool(TOOL)
        .ok_or_else(|| {
            MapError::Format(crate::terr!("e-interference-map-locate-no-evidence-rows"))
        })?
        .apply_svg(svg);
    Ok(LocateOutput {
        stem,
        geojson,
        summary,
        csv,
        svg,
        sessions_published: estimates.len(),
        sessions_withheld: stats.sessions_suppressed_below_min_distinct as usize,
        lines,
    })
}

/// Write the four outputs of a run into `out`, refusing to overwrite any of them.
pub fn write_outputs(
    o: &LocateOutput,
    out: &std::path::Path,
) -> Result<Vec<std::path::PathBuf>, MapError> {
    use std::io::Write;
    let files = [
        (format!("{}.geojson", o.stem), &o.geojson),
        (format!("{}-summary.json", o.stem), &o.summary),
        (format!("{}-sessions.csv", o.stem), &o.csv),
        (format!("{}-figure.svg", o.stem), &o.svg),
    ];
    let targets: Vec<std::path::PathBuf> = files.iter().map(|(n, _)| out.join(n)).collect();
    if let Some(existing) = targets.iter().find(|p| p.exists()) {
        return Err(MapError::Io(crate::terr!(
            "e-interference-map-cli-already-exists-kshana-does-not",
            existing = existing.display()
        )));
    }
    std::fs::create_dir_all(out).map_err(|e| {
        MapError::Io(crate::terr!(
            "e-interference-map-cli-cannot-create",
            out = out.display(),
            e = e
        ))
    })?;
    for (path, (_, text)) in targets.iter().zip(&files) {
        let mut f = std::fs::OpenOptions::new()
            .write(true)
            .create_new(true)
            .open(path)
            .map_err(|e| {
                MapError::Io(crate::terr!(
                    "e-evidence-cli-cannot-create",
                    path = path.display(),
                    e = e
                ))
            })?;
        f.write_all(text.as_bytes()).map_err(|e| {
            MapError::Io(crate::terr!(
                "e-evidence-cli-cannot-write",
                path = path.display(),
                e = e
            ))
        })?;
    }
    Ok(targets)
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

/// The figure: every published session's regions in a local projection, with a scale bar. Aggregate only:
/// no report position is drawn.
fn figure(est: &[(&Session, Estimate)], params: &EmitterParams) -> String {
    let (w, h, m): (f64, f64, f64) = (760.0, 640.0, 60.0);
    use crate::palette::map as pm;
    let fill = [pm::REGION_50, pm::REGION_90, pm::REGION_95, pm::ELLIPSE];
    let (ink, muted, note, plot, frame) = (pm::INK, pm::MUTED, pm::NOTE, pm::PLOT, pm::FRAME);
    let mut svg = format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w}\" height=\"{h}\" viewBox=\"0 0 {w} {h}\" font-family=\"sans-serif\"><rect width=\"{w}\" height=\"{h}\" fill=\"{}\"/>",
        pm::GROUND
    );
    svg.push_str(&format!(
        "<text x=\"{m}\" y=\"28\" font-size=\"18\" font-weight=\"bold\" fill=\"{ink}\">{}</text>",
        esc(&crate::t!("interference-map-locate-fig-title"))
    ));
    svg.push_str(&format!(
        "<text x=\"{m}\" y=\"46\" font-size=\"11\" fill=\"{muted}\">{}</text>",
        esc(&crate::t!(
            "interference-map-locate-fig-subtitle",
            n = est.len()
        ))
    ));
    if est.is_empty() {
        svg.push_str(&format!(
            "<text x=\"{m}\" y=\"{}\" font-size=\"14\" fill=\"{muted}\">{}</text></svg>",
            h / 2.0,
            esc(&crate::t!("interference-map-locate-fig-none"))
        ));
        return svg;
    }
    // Projection about the mean centroid; extent from every region ring.
    let (mut la, mut lo) = (0.0, 0.0);
    for (_, e) in est {
        la += e.centroid.0 / est.len() as f64;
        lo += e.centroid.1 / est.len() as f64;
    }
    let proj = Proj::new(la, lo);
    let (mut x0, mut x1, mut y0, mut y1) = (f64::MAX, f64::MIN, f64::MAX, f64::MIN);
    type Rings = Vec<Vec<(f64, f64)>>;
    let mut pts: Vec<Vec<Vec<Rings>>> = Vec::new();
    for (_, e) in est {
        let mut per_level = Vec::new();
        for r in &e.regions {
            let mut polys = Vec::new();
            for p in &r.polygons {
                let rings: Vec<Vec<(f64, f64)>> = p
                    .iter()
                    .map(|ring| ring.iter().map(|q| proj.forward(q[1], q[0])).collect())
                    .collect();
                for ring in &rings {
                    for &(x, y) in ring {
                        x0 = x0.min(x);
                        x1 = x1.max(x);
                        y0 = y0.min(y);
                        y1 = y1.max(y);
                    }
                }
                polys.push(rings);
            }
            per_level.push(polys);
        }
        pts.push(per_level);
    }
    let span = (x1 - x0).max(y1 - y0).max(1.0) * 1.1;
    let (cx, cy) = ((x0 + x1) / 2.0, (y0 + y1) / 2.0);
    let side = (w - 2.0 * m).min(h - 2.0 * m - 60.0);
    let sc = side / span;
    let px = |x: f64| m + side / 2.0 + (x - cx) * sc;
    let py = |y: f64| 80.0 + side / 2.0 - (y - cy) * sc;
    svg.push_str(&format!(
        "<rect x=\"{m}\" y=\"80\" width=\"{side}\" height=\"{side}\" fill=\"{plot}\" stroke=\"{frame}\"/>"
    ));
    for (k, (_, e)) in est.iter().enumerate() {
        for li in (0..e.regions.len()).rev() {
            let col = fill[li.min(2)];
            for poly in &pts[k][li] {
                let mut d = String::new();
                for ring in poly {
                    for (i, &(x, y)) in ring.iter().enumerate() {
                        d.push_str(&format!(
                            "{}{:.1},{:.1} ",
                            if i == 0 { "M" } else { "L" },
                            px(x),
                            py(y)
                        ));
                    }
                    d.push('Z');
                }
                svg.push_str(&format!("<path d=\"{d}\" fill=\"{col}\" fill-opacity=\"0.35\" fill-rule=\"evenodd\" stroke=\"{col}\" stroke-width=\"1\"/>"));
            }
        }
        let ring: Vec<String> = e
            .ellipse_ring
            .iter()
            .enumerate()
            .map(|(i, q)| {
                let (x, y) = proj.forward(q[1], q[0]);
                format!(
                    "{}{:.1},{:.1}",
                    if i == 0 { "M" } else { "L" },
                    px(x),
                    py(y)
                )
            })
            .collect();
        svg.push_str(&format!("<path d=\"{} Z\" fill=\"none\" stroke=\"{}\" stroke-width=\"1.5\" stroke-dasharray=\"5 3\"/>", ring.join(" "), fill[3]));
        if !e.unconstrained {
            let (x, y) = proj.forward(e.centroid.0, e.centroid.1);
            let (cxp, cyp) = (px(x), py(y));
            svg.push_str(&format!(
                "<path d=\"M{:.1},{:.1}L{:.1},{:.1}M{:.1},{:.1}L{:.1},{:.1}\" stroke=\"{ink}\" stroke-width=\"2\"/><text x=\"{:.1}\" y=\"{:.1}\" font-size=\"11\" fill=\"{ink}\">{}</text>",
                cxp - 6.0, cyp, cxp + 6.0, cyp, cxp, cyp - 6.0, cxp, cyp + 6.0, cxp + 8.0, cyp - 8.0, k + 1
            ));
        }
    }
    // Scale bar and axes captions.
    let nice = [1.0, 2.0, 5.0, 10.0, 20.0, 50.0, 100.0, 200.0, 500.0, 1000.0];
    let bar = nice
        .iter()
        .cloned()
        .filter(|b| b * sc < side / 3.0)
        .fold(1.0, f64::max);
    svg.push_str(&format!(
        "<path d=\"M{m},{y}L{x:.1},{y}\" stroke=\"{ink}\" stroke-width=\"3\"/><text x=\"{m}\" y=\"{t}\" font-size=\"11\" fill=\"{ink}\">{}</text>",
        esc(&crate::t!("interference-map-locate-fig-scale", km = crate::i18n::num(bar, 0))),
        y = 80.0 + side + 16.0,
        x = m + bar * sc,
        t = 80.0 + side + 32.0,
    ));
    let mut ly = 100.0;
    let lx = m + side + 14.0;
    for (li, l) in params.confidence_levels.iter().enumerate() {
        svg.push_str(&format!(
            "<rect x=\"{lx}\" y=\"{ly}\" width=\"12\" height=\"12\" fill=\"{}\" fill-opacity=\"0.5\" stroke=\"{}\"/><text x=\"{}\" y=\"{}\" font-size=\"11\" fill=\"{ink}\">{}</text>",
            fill[li.min(2)], fill[li.min(2)], lx + 18.0, ly + 10.0,
            esc(&crate::t!("interference-map-locate-fig-legend-region", pct = (l * 100.0).round() as u32))
        ));
        ly += 20.0;
    }
    svg.push_str(&format!(
        "<path d=\"M{lx},{}L{},{}\" stroke=\"{}\" stroke-width=\"1.5\" stroke-dasharray=\"5 3\"/><text x=\"{}\" y=\"{}\" font-size=\"11\" fill=\"{ink}\">{}</text>",
        ly + 6.0, lx + 12.0, ly + 6.0, fill[3], lx + 18.0, ly + 10.0,
        esc(&crate::t!("interference-map-locate-fig-legend-ellipse"))
    ));
    let notes = [
        crate::t!("interference-map-locate-fig-note-1"),
        crate::t!("interference-map-locate-fig-note-2"),
    ];
    for (i, n) in notes.iter().enumerate() {
        svg.push_str(&format!(
            "<text x=\"{m}\" y=\"{}\" font-size=\"10\" fill=\"{note}\">{}</text>",
            80.0 + side + 52.0 + 13.0 * i as f64,
            esc(n)
        ));
    }
    svg.push_str("</svg>");
    svg
}
