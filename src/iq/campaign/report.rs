// SPDX-License-Identifier: AGPL-3.0-only
//! Scorecards, the HTML report and the digest, built from a campaign's output directory.
//!
//! [`build`] reads `campaign.json` and every finished `cells/<key>.json`, then writes:
//!
//! * `scorecard.csv` and `scorecard.json`: one row per (cell, satellite) for the whole
//!   run and one per (cell, satellite, event). `scorecard.json` also carries the
//!   C/N0-against-J/S curves.
//! * `report.html`: a self-contained page with inline CSS and SVG, no scripts and no
//!   network. Each event with a stated power profile gets a C/N0-degradation chart against
//!   stated J/S. Each (front end, design) pair is a measured series. The analytic reference
//!   is a dashed line labelled MODELLED.
//! * `DIGEST`: the SHA-256 over the sorted lines `<key> <sha256 of the cell file>`. It is
//!   written only when every planned cell is done, so equal digests mean equal results
//!   (B8.3).
//!
//! Pass/fail bars are applied here: the campaign's `[scoring.bars]`, overridden field by
//! field by each recording's `[bars]`. Changing a bar therefore re-judges results without
//! re-running anything.

use super::hash::{sha256_file, sha256_hex};
use super::runner::{cell_path, CellResult, Plan};
use super::score::{Bars, EventScore, MODELLED, REFERENCE_FORMULA};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use std::fmt::Write as _;
use std::path::Path;

/// The schema tag of `scorecard.json`.
pub const SCORECARD_SCHEMA: &str = "kshana.campaign-scorecard/1";

/// One scorecard row.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Row {
    /// Recording id.
    pub recording: String,
    /// Front-end chain.
    pub frontend: String,
    /// Loop design.
    pub design: String,
    /// Signal.
    pub signal: String,
    /// Satellite id.
    pub sat: i64,
    /// `"run"` (whole run) or `"event"`.
    pub scope: String,
    /// Event id (empty for the whole run).
    pub event_id: String,
    /// Event type label (empty for the whole run).
    pub event_type: String,
    /// Hand-off source.
    pub handoff: String,
    /// Availability.
    pub availability: Option<f64>,
    /// Time to loss of lock (s).
    pub time_to_loss_s: Option<f64>,
    /// Stated J/S at the loss (dB).
    pub js_at_loss_db: Option<f64>,
    /// Re-acquisition time from the event offset (s).
    pub reacq_time_s: Option<f64>,
    /// Re-acquisition time from the loss of lock (s).
    pub outage_s: Option<f64>,
    /// Baseline C/N0 (event rows) or median C/N0 (run rows) (dB-Hz), by `cn0_estimator`.
    pub cn0_dbhz: Option<f64>,
    /// The estimator behind `cn0_dbhz`: `"m2m4"` or `"nwpr"`.
    pub cn0_estimator: String,
    /// The same figure by NWPR (dB-Hz).
    pub cn0_nwpr_dbhz: Option<f64>,
    /// The same figure by M2M4 (dB-Hz).
    pub cn0_m2m4_dbhz: Option<f64>,
    /// Carrier jitter (deg).
    pub pll_jitter_deg: Option<f64>,
    /// Code jitter (chips).
    pub dll_jitter_chips: Option<f64>,
    /// False-lock episodes.
    pub false_lock_episodes: u32,
    /// False-lock episodes per locked hour (run rows).
    pub false_lock_per_hour: Option<f64>,
    /// `"PASS"`, `"FAIL"` or empty when no bar applies.
    pub verdict: String,
    /// The bars that failed.
    pub failed_bars: Vec<String>,
    /// The cell key.
    pub cell: String,
}

/// One C/N0-against-J/S curve.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Curve {
    /// Recording id.
    pub recording: String,
    /// Event id.
    pub event_id: String,
    /// Event type label.
    pub event_type: String,
    /// Front-end chain.
    pub frontend: String,
    /// Loop design.
    pub design: String,
    /// Satellite id.
    pub sat: i64,
    /// The event's figures (curve bins and MODELLED provenance included).
    pub event: EventScore,
}

/// What [`build`] produced.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct ReportSummary {
    /// Cells in the plan.
    pub cells_total: usize,
    /// Cells with a result.
    pub cells_present: usize,
    /// Scorecard rows.
    pub rows: usize,
    /// Rows that failed a bar.
    pub rows_failed: usize,
    /// The digest, when every cell is present.
    pub digest: Option<String>,
}

/// The digest over `lines` (each `"<key> <sha256 of the cell file>\n"`): the SHA-256 hex
/// of the lines sorted and concatenated.
fn digest_of(mut lines: Vec<String>) -> String {
    lines.sort();
    sha256_hex(lines.concat().as_bytes())
}

/// The digest of the campaign in `out_dir`, computed from `campaign.json` and the cell
/// files exactly as [`build`] writes it to `DIGEST`; `None` while any planned cell is
/// missing. A cell file that does not parse, or carries another key, counts as missing.
pub fn digest(out_dir: &Path) -> Result<Option<String>, String> {
    let plan_path = out_dir.join("campaign.json");
    let plan: Plan = serde_json::from_str(
        &std::fs::read_to_string(&plan_path)
            .map_err(|e| format!("{}: {e}", plan_path.display()))?,
    )
    .map_err(|e| format!("{}: {e}", plan_path.display()))?;
    let mut lines = Vec::new();
    for pc in &plan.cells {
        if !super::runner::cell_done(out_dir, &pc.key) {
            return Ok(None);
        }
        lines.push(format!(
            "{} {}\n",
            pc.key,
            sha256_file(&cell_path(out_dir, &pc.key))?
        ));
    }
    Ok(Some(digest_of(lines)))
}

fn opt(x: Option<f64>) -> String {
    x.map(|v| v.to_string()).unwrap_or_default()
}

fn csv_field(s: &str) -> String {
    if s.contains([',', '"', '\n']) {
        format!("\"{}\"", s.replace('"', "\"\""))
    } else {
        s.to_string()
    }
}

fn verdict(m: &BTreeMap<String, bool>) -> (String, Vec<String>) {
    if m.is_empty() {
        return (String::new(), Vec::new());
    }
    let failed: Vec<String> = m
        .iter()
        .filter(|(_, ok)| !**ok)
        .map(|(k, _)| k.clone())
        .collect();
    (
        if failed.is_empty() { "PASS" } else { "FAIL" }.into(),
        failed,
    )
}

/// Rebuild the scorecards, report and digest of the campaign in `out_dir`.
pub fn build(out_dir: &Path) -> Result<ReportSummary, String> {
    let plan_path = out_dir.join("campaign.json");
    let plan: Plan = serde_json::from_str(
        &std::fs::read_to_string(&plan_path)
            .map_err(|e| format!("{}: {e}", plan_path.display()))?,
    )
    .map_err(|e| format!("{}: {e}", plan_path.display()))?;
    let base_bars = plan.scoring.bars.clone().unwrap_or_default();

    let mut cells: Vec<CellResult> = Vec::new();
    let mut digest_lines = Vec::new();
    for pc in &plan.cells {
        let p = cell_path(out_dir, &pc.key);
        let Ok(text) = std::fs::read_to_string(&p) else {
            continue;
        };
        let Ok(c) = serde_json::from_str::<CellResult>(&text) else {
            continue;
        };
        if c.key != pc.key {
            continue;
        }
        digest_lines.push(format!("{} {}\n", pc.key, sha256_file(&p)?));
        cells.push(c);
    }
    let complete = cells.len() == plan.cells.len();
    let digest = complete.then(|| digest_of(digest_lines));

    let mut rows = Vec::new();
    let mut curves = Vec::new();
    for c in &cells {
        let rec = plan.recordings.iter().find(|r| r.id == c.recording.id);
        let bars: Bars = base_bars.merged(rec.and_then(|r| r.conditions.bars.as_ref()));
        for s in &c.satellites {
            let w = &s.score.whole_run;
            let (v, failed) = verdict(&bars.judge_run(w));
            rows.push(Row {
                recording: c.recording.id.clone(),
                frontend: c.frontend.name.clone(),
                design: c.design.name.clone(),
                signal: s.score.signal.clone(),
                sat: s.score.id,
                scope: "run".into(),
                event_id: String::new(),
                event_type: String::new(),
                handoff: s.handoff.source.clone(),
                availability: w.availability,
                time_to_loss_s: None,
                js_at_loss_db: None,
                reacq_time_s: None,
                outage_s: None,
                cn0_dbhz: w.median_cn0_dbhz,
                cn0_estimator: c.cn0_estimator.clone(),
                cn0_nwpr_dbhz: w.median_cn0_nwpr_dbhz,
                cn0_m2m4_dbhz: w.median_cn0_m2m4_dbhz,
                pll_jitter_deg: w.pll_jitter_deg,
                dll_jitter_chips: w.dll_jitter_chips,
                false_lock_episodes: w.false_lock_episodes,
                false_lock_per_hour: w.false_lock_per_hour,
                verdict: v,
                failed_bars: failed,
                cell: c.key.clone(),
            });
            for e in &s.score.events {
                let (v, failed) = verdict(&bars.judge_event(e));
                rows.push(Row {
                    recording: c.recording.id.clone(),
                    frontend: c.frontend.name.clone(),
                    design: c.design.name.clone(),
                    signal: s.score.signal.clone(),
                    sat: s.score.id,
                    scope: "event".into(),
                    event_id: e.event_id.clone(),
                    event_type: e.event_type.clone(),
                    handoff: s.handoff.source.clone(),
                    availability: e.availability,
                    time_to_loss_s: e.time_to_loss_s,
                    js_at_loss_db: e.js_at_loss_db,
                    reacq_time_s: e.reacq_time_s,
                    outage_s: e.outage_s,
                    cn0_dbhz: e.baseline_cn0_dbhz,
                    cn0_estimator: c.cn0_estimator.clone(),
                    cn0_nwpr_dbhz: e.baseline_cn0_nwpr_dbhz,
                    cn0_m2m4_dbhz: e.baseline_cn0_m2m4_dbhz,
                    pll_jitter_deg: e.pll_jitter_deg,
                    dll_jitter_chips: e.dll_jitter_chips,
                    false_lock_episodes: e.false_lock_episodes,
                    false_lock_per_hour: None,
                    verdict: v,
                    failed_bars: failed,
                    cell: c.key.clone(),
                });
                if !e.cn0_curve.is_empty() {
                    curves.push(Curve {
                        recording: c.recording.id.clone(),
                        event_id: e.event_id.clone(),
                        event_type: e.event_type.clone(),
                        frontend: c.frontend.name.clone(),
                        design: c.design.name.clone(),
                        sat: s.score.id,
                        event: e.clone(),
                    });
                }
            }
        }
    }

    // CSV.
    let mut csv = String::from(
        "recording,frontend,design,signal,sat,scope,event_id,event_type,handoff,availability,time_to_loss_s,js_at_loss_db,reacq_time_s,outage_s,cn0_dbhz,cn0_estimator,cn0_nwpr_dbhz,cn0_m2m4_dbhz,pll_jitter_deg,dll_jitter_chips,false_lock_episodes,false_lock_per_hour,verdict,failed_bars,cell\n",
    );
    for r in &rows {
        let fields = [
            csv_field(&r.recording),
            csv_field(&r.frontend),
            csv_field(&r.design),
            csv_field(&r.signal),
            r.sat.to_string(),
            r.scope.clone(),
            csv_field(&r.event_id),
            r.event_type.clone(),
            r.handoff.clone(),
            opt(r.availability),
            opt(r.time_to_loss_s),
            opt(r.js_at_loss_db),
            opt(r.reacq_time_s),
            opt(r.outage_s),
            opt(r.cn0_dbhz),
            r.cn0_estimator.clone(),
            opt(r.cn0_nwpr_dbhz),
            opt(r.cn0_m2m4_dbhz),
            opt(r.pll_jitter_deg),
            opt(r.dll_jitter_chips),
            r.false_lock_episodes.to_string(),
            opt(r.false_lock_per_hour),
            r.verdict.clone(),
            r.failed_bars.join(";"),
            r.cell.clone(),
        ];
        csv.push_str(&fields.join(","));
        csv.push('\n');
    }
    let rows_failed = rows.iter().filter(|r| r.verdict == "FAIL").count();
    super::runner::write_atomic(&out_dir.join("scorecard.csv"), csv.as_bytes())?;
    let json = serde_json::json!({
        "schema": SCORECARD_SCHEMA,
        "campaign": plan.name,
        "data_class": plan.data_class,
        "engine_version": plan.engine_version,
        "complete": complete,
        "cells_total": plan.cells.len(),
        "cells_present": cells.len(),
        "digest": digest,
        "modelled_reference": { "label": MODELLED, "formula": REFERENCE_FORMULA },
        "rows": rows,
        "curves": curves,
    });
    super::runner::write_atomic(
        &out_dir.join("scorecard.json"),
        format!(
            "{}\n",
            serde_json::to_string_pretty(&json).unwrap_or_default()
        )
        .as_bytes(),
    )?;
    super::runner::write_atomic(
        &out_dir.join("report.html"),
        html(&plan, &rows, &curves, cells.len(), digest.as_deref()).as_bytes(),
    )?;
    let dpath = out_dir.join("DIGEST");
    match &digest {
        Some(d) => super::runner::write_atomic(&dpath, format!("{d}\n").as_bytes())?,
        None => {
            let _ = std::fs::remove_file(&dpath);
        }
    }
    Ok(ReportSummary {
        cells_total: plan.cells.len(),
        cells_present: cells.len(),
        rows: rows.len(),
        rows_failed,
        digest,
    })
}

fn esc(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
}

fn fmt(x: Option<f64>, digits: usize) -> String {
    x.map(|v| format!("{v:.digits$}"))
        .unwrap_or_else(|| "—".into())
}

/// Categorical series slots defined in the page style (`--s1`..`--s8`).
const SERIES_SLOTS: usize = 8;

/// The page style: the custom properties come from the Observatory palette
/// ([`crate::palette::theme_css`]), the rest is layout.
fn style() -> String {
    use crate::palette::{dark, light, theme_css};
    let mut css = theme_css(&[
        ("surface", light::BG, dark::BG),
        ("ink", light::INK, dark::INK),
        ("ink2", light::INK_2, dark::INK_2),
        ("grid", light::GRID, dark::GRID),
        ("rule", light::RULE, dark::RULE),
        ("pass", light::LIME, dark::LIME),
        ("fail", light::CORAL, dark::CORAL),
        ("s1", light::CYAN, dark::CYAN),
        ("s2", light::AMBER, dark::AMBER),
        ("s3", light::MAGENTA, dark::MAGENTA),
        ("s4", light::LIME, dark::LIME),
        ("s5", light::CORAL, dark::CORAL),
        ("s6", light::BLUE, dark::BLUE),
        ("s7", light::INK_2, dark::INK_2),
        ("s8", light::INK_3, dark::INK_3),
    ]);
    css.push_str(LAYOUT);
    css
}

const LAYOUT: &str = r#"
body{margin:0;background:var(--surface);color:var(--ink);font:14px/1.45 system-ui,-apple-system,"Segoe UI",sans-serif}
main{max-width:1100px;margin:0 auto;padding:24px 16px 64px}
h1{font-size:22px;margin:0 0 4px}h2{font-size:17px;margin:32px 0 8px}h3{font-size:15px;margin:20px 0 6px}
.meta{color:var(--ink2);font-size:13px}.meta code{word-break:break-all}
.note{border-left:3px solid var(--rule);padding:6px 12px;color:var(--ink2);margin:12px 0}
.wrap{overflow-x:auto}table{border-collapse:collapse;font-size:12.5px;width:100%}
th,td{padding:4px 8px;border-bottom:1px solid var(--grid);text-align:right;white-space:nowrap}
th{color:var(--ink2);font-weight:600;position:sticky;top:0;background:var(--surface)}
td.l,th.l{text-align:left}.PASS{color:var(--pass);font-weight:600}.FAIL{color:var(--fail);font-weight:600}
svg{max-width:100%;height:auto}svg text{fill:var(--ink2);font-size:11px}
.legend{display:flex;flex-wrap:wrap;gap:6px 16px;font-size:12px;color:var(--ink2);margin:4px 0 0}
.legend span{display:inline-flex;align-items:center;gap:6px}.sw{width:14px;height:3px;border-radius:2px;display:inline-block}
.sw.mod{background:none;border-top:2px dashed var(--ink2);height:0}
"#;

fn html(
    plan: &Plan,
    rows: &[Row],
    curves: &[Curve],
    present: usize,
    digest: Option<&str>,
) -> String {
    let mut h = String::new();
    let _ = write!(
        h,
        "<!doctype html><html lang=\"en\"><head><meta charset=\"utf-8\"><meta name=\"viewport\" content=\"width=device-width,initial-scale=1\"><title>Campaign {}</title><style>{}</style></head><body><main>",
        esc(&plan.name),
        style()
    );
    let _ = write!(
        h,
        "<h1>Lab replay campaign: {}</h1><p class=\"meta\">Data class <b>{}</b> · Kshana {} · {} recording(s) × {} front end(s) × {} design(s) = {} cells, {} done · digest <code>{}</code></p>",
        esc(&plan.name),
        plan.data_class.as_str(),
        esc(&plan.engine_version),
        plan.recordings.len(),
        plan.frontends.len(),
        plan.designs.len(),
        plan.cells.len(),
        present,
        digest.unwrap_or("(incomplete: not every cell is done)")
    );
    let _ = write!(
        h,
        "<p class=\"note\">Measured values come from tracking the recordings. Dashed lines labelled <b>{MODELLED}</b> are the analytic spectral-separation reference <code>{}</code> at the lab's stated J/S, with Q from the stated interference type. They are a model of the stated condition, not a measurement and not a simulation of the interference.</p>",
        esc(REFERENCE_FORMULA)
    );

    // Summary per (recording, frontend, design).
    h.push_str("<h2>Summary</h2><div class=\"wrap\"><table><thead><tr><th class=\"l\">Recording</th><th class=\"l\">Front end</th><th class=\"l\">Design</th><th>Satellites</th><th>Mean availability</th><th>Events lost</th><th>Median re-acq (s)</th><th>Pass</th><th>Fail</th></tr></thead><tbody>");
    let mut groups: BTreeMap<(String, String, String), Vec<&Row>> = BTreeMap::new();
    for r in rows {
        groups
            .entry((r.recording.clone(), r.frontend.clone(), r.design.clone()))
            .or_default()
            .push(r);
    }
    for ((rec, fe, d), rs) in &groups {
        let run: Vec<&&Row> = rs.iter().filter(|r| r.scope == "run").collect();
        let ev: Vec<&&Row> = rs.iter().filter(|r| r.scope == "event").collect();
        let av: Vec<f64> = run.iter().filter_map(|r| r.availability).collect();
        let mean_av = (!av.is_empty()).then(|| av.iter().sum::<f64>() / av.len() as f64);
        let lost = ev.iter().filter(|r| r.time_to_loss_s.is_some()).count();
        let mut re: Vec<f64> = ev.iter().filter_map(|r| r.reacq_time_s).collect();
        re.sort_by(f64::total_cmp);
        let med = (!re.is_empty()).then(|| re[re.len() / 2]);
        let pass = rs.iter().filter(|r| r.verdict == "PASS").count();
        let fail = rs.iter().filter(|r| r.verdict == "FAIL").count();
        let _ = write!(
            h,
            "<tr><td class=\"l\">{}</td><td class=\"l\">{}</td><td class=\"l\">{}</td><td>{}</td><td>{}</td><td>{lost} / {}</td><td>{}</td><td class=\"PASS\">{pass}</td><td class=\"FAIL\">{fail}</td></tr>",
            esc(rec),
            esc(fe),
            esc(d),
            run.len(),
            fmt(mean_av, 3),
            ev.len(),
            fmt(med, 2)
        );
    }
    h.push_str("</tbody></table></div>");

    // Degradation charts per (recording, event).
    let mut by_event: BTreeMap<(String, String), Vec<&Curve>> = BTreeMap::new();
    for c in curves {
        by_event
            .entry((c.recording.clone(), c.event_id.clone()))
            .or_default()
            .push(c);
    }
    if !by_event.is_empty() {
        h.push_str("<h2>C/N0 degradation against stated J/S</h2>");
    }
    for ((rec, ev), cs) in &by_event {
        h.push_str(&chart(rec, ev, cs));
    }

    // Full scorecard.
    let note = match plan.scoring.cn0_estimator.name() {
        "nwpr" => "NWPR (reads low by about 8 dB \u{b7} Bn\u{b7}T under the loop's own jitter, so its readings depend on the loop design)",
        _ => "M2M4 (insensitive to the loop's own jitter)",
    };
    let _ = write!(h, "<h2>Scorecard</h2><p class=\"meta\">The same rows as <code>scorecard.csv</code>. Re-acquisition is measured from the event offset; outage is measured from the loss of lock. The C/N0 column and the degradation curves use the {note} estimate; both estimates are in <code>scorecard.json</code>.</p><div class=\"wrap\"><table><thead><tr><th class=\"l\">Recording</th><th class=\"l\">Front end</th><th class=\"l\">Design</th><th>Sat</th><th class=\"l\">Scope</th><th class=\"l\">Event</th><th>Avail.</th><th>Loss (s)</th><th>J/S at loss</th><th>Re-acq (s)</th><th>Outage (s)</th><th>C/N0</th><th>PLL σ (°)</th><th>DLL σ (chip)</th><th>False locks</th><th class=\"l\">Verdict</th></tr></thead><tbody>");
    for r in rows {
        let ev = if r.scope == "event" {
            format!("{} ({})", esc(&r.event_id), esc(&r.event_type))
        } else {
            String::new()
        };
        let _ = write!(
            h,
            "<tr><td class=\"l\">{}</td><td class=\"l\">{}</td><td class=\"l\">{}</td><td>{}</td><td class=\"l\">{}</td><td class=\"l\">{ev}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td>{}</td><td class=\"l {}\" title=\"{}\">{}</td></tr>",
            esc(&r.recording),
            esc(&r.frontend),
            esc(&r.design),
            r.sat,
            r.scope,
            fmt(r.availability, 3),
            fmt(r.time_to_loss_s, 2),
            fmt(r.js_at_loss_db, 1),
            fmt(r.reacq_time_s, 2),
            fmt(r.outage_s, 2),
            fmt(r.cn0_dbhz, 1),
            fmt(r.pll_jitter_deg, 2),
            fmt(r.dll_jitter_chips, 4),
            r.false_lock_episodes,
            r.verdict,
            esc(&r.failed_bars.join(", ")),
            if r.verdict.is_empty() { "—" } else { &r.verdict }
        );
    }
    h.push_str("</tbody></table></div></main></body></html>\n");
    h
}

/// One event's chart: mean measured degradation across satellites per (front end,
/// design), and the MODELLED reference (taken from the first curve that carries one; every
/// series shares the event's stated J/S and Q).
fn chart(rec: &str, ev: &str, cs: &[&Curve]) -> String {
    let mut series: BTreeMap<(String, String), BTreeMap<i64, Vec<f64>>> = BTreeMap::new();
    let mut model: BTreeMap<i64, Vec<f64>> = BTreeMap::new();
    let ty = cs.first().map(|c| c.event_type.clone()).unwrap_or_default();
    let mut q = None;
    for c in cs {
        let s = series
            .entry((c.frontend.clone(), c.design.clone()))
            .or_default();
        for b in &c.event.cn0_curve {
            let k = (b.js_db * 1000.0).round() as i64;
            if let Some(d) = b.measured_degradation_db {
                s.entry(k).or_default().push(d);
            }
            if let Some(d) = b.modelled_degradation_db {
                model.entry(k).or_default().push(d);
            }
        }
        if q.is_none() {
            q = c.event.modelled.as_ref().map(|m| m.q);
        }
    }
    let mean = |v: &Vec<f64>| v.iter().sum::<f64>() / v.len() as f64;
    let pts = |m: &BTreeMap<i64, Vec<f64>>| -> Vec<(f64, f64)> {
        m.iter()
            .map(|(k, v)| (*k as f64 / 1000.0, mean(v)))
            .collect()
    };
    let all: Vec<(f64, f64)> = series.values().flat_map(pts).chain(pts(&model)).collect();
    if all.is_empty() {
        return String::new();
    }
    let (mut x0, mut x1) = all
        .iter()
        .fold((f64::INFINITY, f64::NEG_INFINITY), |(a, b), p| {
            (a.min(p.0), b.max(p.0))
        });
    let y1 = all.iter().map(|p| p.1).fold(1.0f64, f64::max).ceil();
    let y0 = all.iter().map(|p| p.1).fold(0.0f64, f64::min).floor();
    if x1 - x0 < 1.0 {
        x0 -= 0.5;
        x1 += 0.5;
    }
    let (w, ht, ml, mr, mt, mb) = (640.0, 300.0, 48.0, 16.0, 12.0, 36.0);
    let sx = |x: f64| ml + (x - x0) / (x1 - x0) * (w - ml - mr);
    let sy = |y: f64| mt + (y1 - y) / (y1 - y0).max(1e-9) * (ht - mt - mb);
    let mut s = String::new();
    let _ = write!(
        s,
        "<h3>{} · {} ({})</h3><svg viewBox=\"0 0 {w} {ht}\" role=\"img\" aria-label=\"C/N0 degradation against stated J/S for {} event {}\">",
        esc(rec),
        esc(ev),
        esc(&ty),
        esc(rec),
        esc(ev)
    );
    // Grid and axes.
    let ystep = ((y1 - y0) / 5.0).max(1.0).ceil();
    let mut y = y0;
    while y <= y1 + 1e-9 {
        let _ = write!(
            s,
            "<line x1=\"{ml}\" x2=\"{}\" y1=\"{:.1}\" y2=\"{:.1}\" stroke=\"var(--grid)\"/><text x=\"{}\" y=\"{:.1}\" text-anchor=\"end\">{y}</text>",
            w - mr,
            sy(y),
            sy(y),
            ml - 6.0,
            sy(y) + 4.0
        );
        y += ystep;
    }
    let xstep = ((x1 - x0) / 6.0).max(1.0).ceil();
    let mut x = (x0 / xstep).ceil() * xstep;
    while x <= x1 + 1e-9 {
        let _ = write!(
            s,
            "<text x=\"{:.1}\" y=\"{}\" text-anchor=\"middle\">{x}</text>",
            sx(x),
            ht - mb + 16.0
        );
        x += xstep;
    }
    let _ = write!(
        s,
        "<text x=\"{:.1}\" y=\"{}\" text-anchor=\"middle\">stated J/S (dB)</text><text x=\"12\" y=\"{:.1}\" text-anchor=\"middle\" transform=\"rotate(-90 12 {:.1})\">C/N0 degradation (dB)</text>",
        (ml + w - mr) / 2.0,
        ht - 4.0,
        (mt + ht - mb) / 2.0,
        (mt + ht - mb) / 2.0
    );
    let path = |p: &[(f64, f64)]| -> String {
        p.iter()
            .enumerate()
            .map(|(i, (x, y))| {
                format!(
                    "{}{:.1},{:.1}",
                    if i == 0 { "M" } else { "L" },
                    sx(*x),
                    sy(*y)
                )
            })
            .collect()
    };
    let mut legend = String::new();
    let mp = pts(&model);
    if !mp.is_empty() {
        let _ = write!(
            s,
            "<path d=\"{}\" fill=\"none\" stroke=\"var(--ink2)\" stroke-width=\"2\" stroke-dasharray=\"6 4\"><title>{MODELLED}: SSC reference, Q = {}</title></path>",
            path(&mp),
            fmt(q, 2)
        );
        let _ = write!(
            legend,
            "<span><i class=\"sw mod\"></i>{MODELLED} reference (Q = {})</span>",
            fmt(q, 2)
        );
    }
    for (i, ((fe, d), m)) in series.iter().enumerate() {
        if i >= SERIES_SLOTS {
            let _ = write!(
                legend,
                "<span>+{} more series in the scorecard table</span>",
                series.len() - SERIES_SLOTS
            );
            break;
        }
        let var = format!("var(--s{})", i + 1);
        let p = pts(m);
        let _ = write!(
            s,
            "<path d=\"{}\" fill=\"none\" stroke=\"{var}\" stroke-width=\"2\"/>",
            path(&p)
        );
        for (x, y) in &p {
            let _ = write!(
                s,
                "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"4\" fill=\"{var}\" stroke=\"var(--surface)\" stroke-width=\"2\"><title>{} / {}: J/S {x} dB, measured degradation {y:.2} dB</title></circle>",
                sx(*x),
                sy(*y),
                esc(fe),
                esc(d)
            );
        }
        let _ = write!(
            legend,
            "<span><i class=\"sw\" style=\"background:{var}\"></i>{} / {} (measured)</span>",
            esc(fe),
            esc(d)
        );
    }
    let _ = write!(s, "</svg><div class=\"legend\">{legend}</div>");
    s
}
