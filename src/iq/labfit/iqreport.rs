// SPDX-License-Identifier: AGPL-3.0-only
//! The `kshana.labfit-iq/1` report in its three forms: JSON (the full
//! [`super::iqfit::LabFitIqReport`]), CSV (residuals, one row per bin and per event, and
//! predictions) and a Markdown summary generated from the report (never hand-edited).

use super::iqfit::{Estimate, LabFitIqReport, QReport};

fn o(v: Option<f64>) -> String {
    v.map_or(String::new(), |x| format!("{x:.6}"))
}

fn om(v: Option<f64>, d: usize) -> String {
    v.map_or("—".into(), |x| format!("{x:.d$}"))
}

fn csv(s: &str) -> String {
    if s.contains([',', '"', '\n']) {
        format!("\"{}\"", s.replace('"', "\"\""))
    } else {
        s.to_string()
    }
}

/// The full report as pretty JSON.
pub fn to_json(r: &LabFitIqReport) -> String {
    serde_json::to_string_pretty(r).unwrap_or_default()
}

/// Residuals: one row per bin, and one per event, quantity and lock model.
pub fn residuals_csv(r: &LabFitIqReport) -> String {
    let mut s = String::from(
        "unit,cell,recording,sat,event_id,kind,model,js_db,measured,fitted,residual,censored\n",
    );
    for x in &r.residuals {
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{},{},{},{},{}\n",
            x.unit,
            x.cell,
            csv(&x.recording),
            x.sat,
            csv(&x.event_id),
            x.kind,
            x.model.map_or("", |m| m.as_str()),
            o(x.js_db),
            o(x.measured),
            o(x.fitted),
            o(x.residual),
            x.censored
        ));
    }
    s
}

/// Predictions: one row per unit, query and quantity, each labelled `PREDICTION`.
pub fn predictions_csv(r: &LabFitIqReport) -> String {
    let mut s = String::from(
        "label,unit,query,baseline_cn0_dbhz,peak_js_db,ramp_db_per_s,quantity,js_db,model,value,\
         pi90_lo,pi90_hi,p_loss,nearest_recording,extrapolation_distance,extrapolation\n",
    );
    for p in &r.predictions {
        s.push_str(&format!(
            "{},{},{},{:.6},{:.6},{:.6},{},{},{},{},{},{},{},{},{:.6},{}\n",
            p.label,
            p.unit,
            csv(&p.query),
            p.condition[0],
            p.condition[1],
            p.condition[2],
            p.quantity,
            o(p.js_db),
            p.model.map_or("", |m| m.as_str()),
            o(p.value),
            o(p.pi90.map(|x| x[0])),
            o(p.pi90.map(|x| x[1])),
            o(p.p_loss),
            csv(p.nearest_recording.as_deref().unwrap_or("")),
            p.extrapolation_distance,
            p.extrapolation
        ));
    }
    s
}

fn ci(e: &Estimate, d: usize) -> String {
    match e.ci95 {
        Some([a, b]) => format!(
            "{:.d$} ({:.d$} – {:.d$}; {} replicates, {} failed)",
            e.estimate, a, b, e.boot_n, e.boot_failed
        ),
        None => format!("{:.d$} (no interval)", e.estimate),
    }
}

/// The Markdown summary.
pub fn to_markdown(r: &LabFitIqReport) -> String {
    let mut s = format!(
        "# Lab fit from IQ campaign: {}\n\nSchema `{}`, engine {}. Label: **{}**.\n\n{}\n\n{}\n\n",
        r.name.as_deref().unwrap_or("(unnamed)"),
        r.schema,
        r.engine_version,
        r.label,
        r.statement,
        r.advisory
    );
    s.push_str(&format!(
        "Campaign DIGEST `{}`; `campaign.json` SHA-256 `{}`; scenario SHA-256 `{}`; {} cells; \
         {} bootstrap replicates (seed {}).\n\n",
        r.inputs.campaign_digest,
        r.inputs.campaign_json_sha256,
        r.inputs.scenario_sha256,
        r.inputs.cells.len(),
        r.settings.bootstrap,
        r.settings.seed
    ));
    for (i, u) in r.fit_units.iter().enumerate() {
        s.push_str(&format!(
            "## Unit {i}: {} / {} / {} / {}\n\nStatus: {}. {} recordings, {} satellites, {} \
             events; {} bins fitted, {} censored.\n\n",
            u.signal,
            u.design.name,
            u.frontend.name,
            u.jammer_type,
            u.status,
            u.data.recordings,
            u.data.satellites,
            u.data.events,
            u.data.bins_used,
            u.data.bins_censored
        ));
        if let Some(c) = &u.cn0_model {
            let q = match &c.q_eff {
                QReport::Fitted(e) => ci(e, 3),
                QReport::Stated {
                    value,
                    status,
                    source,
                } => format!("{value} ({status}; {source})"),
            };
            s.push_str(&format!(
                "C/N0 model ({}): `delta_eff` = {} dB (the identifiable offset, referred to Q = 1); \
                 `Q_eff` = {q}; `delta` at that Q = {} dB; corr(Q, delta) {}; residual RMS \
                 {:.3} dB over a {:.1} dB J/S span. Q_eff is not identifiable from C/N0 data \
                 without an independent power measurement.\n\n",
                c.q_mode,
                ci(&c.delta_eff_db, 3),
                ci(&c.delta_db, 3),
                om(c.corr_q_delta, 4),
                c.residual_rms_db,
                c.span_db
            ));
            if let Some(why) = &c.q_mode_reason {
                s.push_str(&format!("Q held at its stated value: {why}.\n\n"));
            }
        }
        if let Some(t) = &u.threshold {
            s.push_str(&format!(
                "Threshold J/S, direct: median {} dB over {} losses (IQR {}).\n\n",
                om(t.direct.median_js_db, 2),
                t.direct.n,
                t.direct
                    .iqr
                    .map_or("—".into(), |[a, b]| format!("{a:.2} – {b:.2} dB"))
            ));
            if !t.via_model.is_empty() {
                s.push_str("| model | drop C/N0 dB-Hz | at lost events (median) dB | per baseline |\n|---|---|---|---|\n");
                for v in &t.via_model {
                    let per: Vec<String> = v
                        .per_baseline
                        .iter()
                        .map(|p| format!("{:.1} dB-Hz: {}", p.baseline_cn0_dbhz, om(p.js_db, 2)))
                        .collect();
                    s.push_str(&format!(
                        "| {} | {} | {} | {} |\n",
                        v.model.as_str(),
                        om(v.drop_cn0_dbhz, 2),
                        om(v.median_at_lost_events_db, 2),
                        per.join("; ")
                    ));
                }
                s.push('\n');
            }
        }
        if !u.lock_model.is_empty() {
            s.push_str(
                "| model | parameter | estimate (95 % interval) | at bound |\n|---|---|---|---|\n",
            );
            for m in &u.lock_model {
                for p in &m.params {
                    s.push_str(&format!(
                        "| {} | `{}` | {} | {} |\n",
                        m.model.as_str(),
                        p.name,
                        ci(&p.value, 3),
                        if p.at_bound { "**yes**" } else { "no" }
                    ));
                }
            }
            s.push_str(&format!("\nRe-acquisition: {}.\n\n", u.reacq));
        }
        if let Some(h) = &u.holdout {
            let i = &h.interpolation;
            s.push_str(&format!(
                "Hold-out (leave one recording out), interpolation: {} bins, C/N0 RMS {} dB, \
                 PI90 coverage {}",
                i.bins,
                om(i.cn0_rms_db, 3),
                om(i.bins_pi90_coverage, 3)
            ));
            for g in &i.events {
                s.push_str(&format!(
                    "; {}: {} events, loss-time RMS {} s, PI90 coverage {}",
                    g.model.as_str(),
                    g.n,
                    om(g.rms_s, 3),
                    om(g.pi90_coverage, 3)
                ));
            }
            s.push_str(".\n\n");
        }
        if let Some(v) = &u.validation {
            s.push_str(&format!(
                "Validation table SHA-256 `{}` (registered {}):\n\n| bar | limit | value | verdict |\n|---|---|---|---|\n",
                v.table_sha256, v.registered
            ));
            for b in &v.bars {
                s.push_str(&format!(
                    "| {} | {} | {} | **{}** |\n",
                    b.bar,
                    b.limit,
                    om(b.value, 4),
                    b.verdict
                ));
            }
            s.push('\n');
        }
    }
    if !r.predictions.is_empty() {
        s.push_str("## Predictions\n\n| unit | query | quantity | model | value | 90 % PI | p(loss) | nearest | extrapolation |\n|---|---|---|---|---|---|---|---|---|\n");
        for p in &r.predictions {
            let q = match p.js_db {
                Some(j) => format!("{} @ {j} dB", p.quantity),
                None => p.quantity.clone(),
            };
            s.push_str(&format!(
                "| {} | {} | {q} | {} | {} | {} | {} | {} | {} |\n",
                p.unit,
                p.query,
                p.model.map_or("—", |m| m.as_str()),
                om(p.value, 3),
                p.pi90
                    .map_or("—".into(), |[a, b]| format!("{a:.3} – {b:.3}")),
                om(p.p_loss, 3),
                p.nearest_recording.as_deref().unwrap_or("—"),
                if p.extrapolation {
                    format!("yes ({:.2})", p.extrapolation_distance)
                } else {
                    "no".into()
                }
            ));
        }
        s.push('\n');
    }
    s.push_str("## Notes\n\n");
    for n in &r.notes {
        s.push_str(&format!("- {n}\n"));
    }
    s
}
