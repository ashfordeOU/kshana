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
    let mut s = crate::t!(
        "iq-labfit-iqreport-lab-fit-from-iq-campaign",
        r = r.name.as_deref().unwrap_or("(unnamed)"),
        schema = r.schema,
        engine_version = r.engine_version,
        label = r.label,
        statement = r.statement,
        advisory = r.advisory
    );
    s.push_str(&crate::t!(
        "iq-labfit-iqreport-campaign-digest-campaign-json-sha",
        campaign_digest = r.inputs.campaign_digest,
        campaign_json_sha256 = r.inputs.campaign_json_sha256,
        scenario_sha256 = r.inputs.scenario_sha256,
        cells = r.inputs.cells.len(),
        bootstrap = r.settings.bootstrap,
        seed = r.settings.seed
    ));
    for (i, u) in r.fit_units.iter().enumerate() {
        s.push_str(&crate::t!(
            "iq-labfit-iqreport-unit-status-recordings-satellites-events",
            i = i,
            signal = u.signal,
            name = u.design.name,
            name2 = u.frontend.name,
            jammer_type = u.jammer_type,
            status = u.status,
            recordings = u.data.recordings,
            satellites = u.data.satellites,
            events = u.data.events,
            bins_used = u.data.bins_used,
            bins_censored = u.data.bins_censored
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
            s.push_str(&crate::t!(
                "iq-labfit-iqreport-n0-model-delta-eff-db",
                q_mode = c.q_mode,
                ci = ci(&c.delta_eff_db, 3),
                q = q,
                ci2 = ci(&c.delta_db, 3),
                om = om(c.corr_q_delta, 4),
                residual_rms_db =
                    crate::i18n::localise_decimal(format!("{:.3}", c.residual_rms_db)),
                span_db = crate::i18n::localise_decimal(format!("{:.1}", c.span_db))
            ));
            if let Some(why) = &c.q_mode_reason {
                s.push_str(&crate::t!(
                    "iq-labfit-iqreport-held-at-its-stated-value",
                    why = why
                ));
            }
        }
        if let Some(t) = &u.threshold {
            s.push_str(&crate::t!(
                "iq-labfit-iqreport-threshold-direct-median-db-over",
                om = om(t.direct.median_js_db, 2),
                n = t.direct.n,
                t = t
                    .direct
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
            s.push_str(&crate::t!(
                "iq-labfit-iqreport-hold-out-leave-one-recording",
                bins = i.bins,
                om = om(i.cn0_rms_db, 3),
                om2 = om(i.bins_pi90_coverage, 3)
            ));
            for g in &i.events {
                s.push_str(&crate::t!(
                    "iq-labfit-iqreport-events-loss-time-rms-pi90",
                    model = g.model.as_str(),
                    n = g.n,
                    om = om(g.rms_s, 3),
                    om2 = om(g.pi90_coverage, 3)
                ));
            }
            s.push_str(".\n\n");
        }
        if let Some(v) = &u.validation {
            s.push_str(&crate::t!(
                "iq-labfit-iqreport-validation-table-sha-256-registered",
                table_sha256 = v.table_sha256,
                registered = v.registered
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
