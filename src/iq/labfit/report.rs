// SPDX-License-Identifier: AGPL-3.0-only
//! The report in three forms: JSON (the full [`LabFitReport`]), CSV (one row per
//! satellite, run and model, and one per prediction) and a markdown summary. Every row
//! carries its run's SHA-256 so each number traces to the log it came from.

use super::fit::{BootStats, LabFitReport, ParamEstimate};

fn o(v: Option<f64>) -> String {
    v.map_or(String::new(), |x| format!("{x:.6}"))
}

fn om(v: Option<f64>, digits: usize) -> String {
    v.map_or("—".into(), |x| format!("{x:.digits$}"))
}

/// The full report as pretty JSON.
pub fn to_json(r: &LabFitReport) -> String {
    serde_json::to_string_pretty(r).unwrap_or_default()
}

/// Residuals: one row per model, run and satellite.
pub fn residuals_csv(r: &LabFitReport) -> String {
    let mut s = String::from(
        "model,run,sha256,sat,nominal_cn0_dbhz,obs_loss_s,pred_loss_s,loss_residual_s,\
         obs_reacq_s,pred_reacq_s,reacq_residual_s\n",
    );
    for m in &r.models {
        for x in &m.residuals {
            s.push_str(&format!(
                "{},{},{},{},{:.6},{},{},{},{},{},{}\n",
                m.model.as_str(),
                x.run,
                x.sha256,
                x.sat,
                x.nominal_cn0_dbhz,
                o(x.obs_loss_s),
                o(x.pred_loss_s),
                o(x.loss_residual_s),
                o(x.obs_reacq_s),
                o(x.pred_reacq_s),
                o(x.reacq_residual_s)
            ));
        }
    }
    s
}

/// Predictions: one row per query and model, each labelled `PREDICTION`.
pub fn predictions_csv(r: &LabFitReport) -> String {
    let mut s = String::from(
        "label,query,model,nominal_cn0_dbhz,drop_cn0_dbhz,relock_cn0_dbhz,\
         time_to_lose_lock_s,boot_p025_s,boot_p975_s,boot_loss_fraction,reacq_s,\
         nearest_tested_run,nearest_tested_distance,extrapolation_distance,within_tested_range\n",
    );
    for p in &r.predictions {
        s.push_str(&format!(
            "{},{},{},{:.6},{},{},{},{},{},{},{},{},{},{},{}\n",
            p.label,
            p.query.replace(',', ";"),
            p.model.as_str(),
            p.nominal_cn0_dbhz,
            o(p.drop_cn0_dbhz),
            o(p.relock_cn0_dbhz),
            o(p.time_to_lose_lock_s),
            o(p.boot_time_to_lose_lock.map(|b| b.p025)),
            o(p.boot_time_to_lose_lock.map(|b| b.p975)),
            o(p.boot_loss_fraction),
            o(p.reacq_s),
            p.nearest_tested_run.clone().unwrap_or_default(),
            o(p.nearest_tested_distance),
            o(p.extrapolation_distance),
            p.within_tested_range
        ));
    }
    s
}

fn ci(b: &Option<BootStats>) -> String {
    b.map_or("—".into(), |b| {
        format!("{:.3} ({:.3} – {:.3})", b.sd, b.p025, b.p975)
    })
}

fn param_row(p: &ParamEstimate) -> String {
    format!(
        "| `{}` | {:.4} | [{}, {}] | {} | {} |\n",
        p.name,
        p.value,
        p.lower_bound,
        p.upper_bound,
        if p.at_bound { "**yes**" } else { "no" },
        ci(&p.bootstrap)
    )
}

/// A markdown summary.
pub fn to_markdown(r: &LabFitReport) -> String {
    let mut s = String::new();
    s.push_str(&format!(
        "# Lab fit: {}\n\nLabel: **{}**. Settings SHA-256 `{}`.\n\n",
        r.name.as_deref().unwrap_or("(unnamed)"),
        r.label,
        r.settings_sha256
    ));
    s.push_str("## Runs\n\n| run | SHA-256 | used | sats | losses | reacq | C/N0 at loss (median) | C/N0 resid RMS dB | note |\n|---|---|---|---|---|---|---|---|---|\n");
    for run in &r.runs {
        let losses = run
            .observation
            .sats
            .iter()
            .filter(|x| x.loss_s.is_some())
            .count();
        let reacq = run
            .observation
            .sats
            .iter()
            .filter(|x| x.reacq_s.is_some())
            .count();
        s.push_str(&format!(
            "| {} | `{}` | {} | {} | {} | {} | {} | {} | {} |\n",
            run.label,
            run.sha256,
            if run.used_in_fit { "yes" } else { "no" },
            run.observation.sats.len(),
            losses,
            reacq,
            om(run.median_cn0_at_loss_dbhz, 1),
            om(run.cn0_residual_rms_db, 2),
            run.note.as_deref().unwrap_or("")
        ));
    }
    s.push_str("\n## Level calibration\n\n| parameter | value | bounds | at bound | bootstrap sd (95 %) |\n|---|---|---|---|---|\n");
    s.push_str(&param_row(&r.level_offset.estimate));
    s.push_str(&format!(
        "\n{} C/N0 samples, residual RMS {} dB.{}\n",
        r.level_offset.n_samples,
        om(r.level_offset.rms_db, 3),
        r.level_offset
            .note
            .as_ref()
            .map_or(String::new(), |n| format!(" {n}."))
    ));
    for m in &r.models {
        s.push_str(&format!(
            "\n## Model: {} ({})\n\n| parameter | value | bounds | at bound | bootstrap sd (95 %) |\n|---|---|---|---|---|\n",
            m.model.as_str(),
            m.label
        ));
        for p in &m.params {
            s.push_str(&param_row(p));
        }
        s.push_str(&format!(
            "\nEvent-time RMS {} s over {} events; losses missed {} / extra {}, reacquisitions missed {} / extra {}.\n\n| run | drop dB-Hz | re-lock dB-Hz | events | RMS s |\n|---|---|---|---|---|\n",
            om(m.rms_s, 3),
            m.n_events,
            m.loss_missed,
            m.loss_extra,
            m.reacq_missed,
            m.reacq_extra
        ));
        for pr in &m.per_run {
            s.push_str(&format!(
                "| {} | {} | {} | {} | {} |\n",
                pr.run,
                om(pr.drop_cn0_dbhz, 2),
                om(pr.relock_cn0_dbhz, 2),
                pr.n_events,
                om(pr.rms_s, 3)
            ));
        }
        if let Some(cv) = &m.cv {
            s.push_str(&format!(
                "\nHold-out ({}, {} folds): all {} s, interpolation {} s, extrapolation {} s.\n\n| held-out run | class | distance | nearest training run | RMS s |\n|---|---|---|---|---|\n",
                cv.scheme,
                cv.folds,
                om(cv.rms_all_s, 3),
                om(cv.rms_interpolation_s, 3),
                om(cv.rms_extrapolation_s, 3)
            ));
            for h in &cv.holdout {
                s.push_str(&format!(
                    "| {} | {} | {:.3} | {} | {} |\n",
                    h.run,
                    h.class,
                    h.extrapolation_distance,
                    h.nearest_training_run,
                    om(h.rms_s, 3)
                ));
            }
        }
    }
    if !r.predictions.is_empty() {
        s.push_str("\n## Predictions\n\n| label | query | model | time to lose lock s | bootstrap 95 % | nearest tested run | extrapolation distance |\n|---|---|---|---|---|---|---|\n");
        for p in &r.predictions {
            s.push_str(&format!(
                "| {} | {} | {} | {} | {} | {} | {} |\n",
                p.label,
                p.query,
                p.model.as_str(),
                om(p.time_to_lose_lock_s, 2),
                p.boot_time_to_lose_lock
                    .map_or("—".into(), |b| format!("{:.2} – {:.2}", b.p025, b.p975)),
                p.nearest_tested_run.as_deref().unwrap_or("—"),
                om(p.extrapolation_distance, 3)
            ));
        }
    }
    s.push_str("\n## Notes\n\n");
    for n in &r.notes {
        s.push_str(&format!("- {n}\n"));
    }
    s
}
