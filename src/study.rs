// SPDX-License-Identifier: AGPL-3.0-only
//! `study` mode: run a [`crate::suite::Suite`] into one aggregated, comparable
//! artifact.
//!
//! Today a run is one scenario → one report. A *study* is a named SET of
//! scenarios run together into one JSON artifact plus a self-contained
//! side-by-side comparison HTML. This is the spine every commercial "study
//! report" sits on.
//!
//! This module does **not** re-implement scenario running: it calls the existing
//! engine, [`crate::api::run_toml`], once per scenario and parses the per-scenario
//! [`crate::report::RunResult`] back out of the returned JSON. Aggregation is
//! pure and **deterministic** — no clock is read here (a generated timestamp, if
//! any, is the CLI's job, via [`crate::report::StudyMeta`]). Running a suite
//! therefore yields per-scenario figures of merit byte-identical to running each
//! scenario alone through `run_toml`.

use crate::suite::Suite;
use serde::Serialize;
use std::path::Path;

/// The outputs of a study: the aggregated JSON artifact, a self-contained
/// comparison HTML, and a one-line summary. Mirrors the shape/spirit of
/// [`crate::api::RunOutput`].
#[derive(Clone, Debug)]
pub struct StudyOutput {
    pub json: String,
    pub html: String,
    pub summary: String,
}

/// One scenario's contribution to the study artifact: its display label, the
/// scenario-input fingerprint, and its figure-of-merit block(s) — carried
/// verbatim from the per-scenario run so the aggregate cannot drift from the
/// stand-alone run.
#[derive(Clone, Debug, Serialize)]
struct StudyScenario {
    label: String,
    scenario_hash: String,
    /// The per-clock FoM block(s) (`quantum` / `classical`, and/or a top-level
    /// `fom`) exactly as the engine reported them.
    foms: serde_json::Value,
}

/// The aggregated study artifact. Versioned and self-describing like
/// [`crate::report::RunResult`]; fields serialize in declaration order
/// (deterministic). `generated_utc` is omitted by default and only ever stamped
/// by the CLI, keeping [`run_suite`] pure.
#[derive(Clone, Debug, Serialize)]
struct StudyArtifact {
    schema_version: String,
    engine_version: String,
    title: String,
    #[serde(skip_serializing_if = "Option::is_none")]
    description: Option<String>,
    #[serde(skip_serializing_if = "Option::is_none")]
    generated_utc: Option<String>,
    scenarios: Vec<StudyScenario>,
}

/// A resolved per-scenario result, kept around so the HTML comparison table and
/// the JSON artifact read from one source.
struct Resolved {
    label: String,
    scenario_hash: String,
    /// The aggregated `foms` value (the clock FoM blocks).
    foms: serde_json::Value,
}

/// Derive a column label for a scenario: the explicit suite label if given, else
/// the scenario file's stem (e.g. `clock-holdover-labsr.toml` → `clock-holdover-labsr`).
fn label_for(path: &str, label: &Option<String>) -> String {
    if let Some(l) = label {
        return l.clone();
    }
    Path::new(path)
        .file_stem()
        .and_then(|s| s.to_str())
        .unwrap_or(path)
        .to_string()
}

/// Pull the FoM blocks (`quantum.fom` / `classical.fom`, and/or a top-level
/// `fom`) out of a run's parsed JSON into a small object keyed by clock, exactly
/// as the engine reported them. An empty object when the run carries no
/// clock-style FoM block (so non-clock packs aggregate without error).
fn extract_foms(root: &serde_json::Value) -> serde_json::Value {
    let mut map = serde_json::Map::new();
    for clock in ["quantum", "classical"] {
        if let Some(fom) = root.get(clock).and_then(|c| c.get("fom")) {
            map.insert(clock.to_string(), fom.clone());
        }
    }
    if map.is_empty() {
        if let Some(fom) = root.get("fom") {
            map.insert("fom".to_string(), fom.clone());
        }
    }
    serde_json::Value::Object(map)
}

/// Run every scenario in `suite` (resolved against `base_dir`) through the engine
/// and aggregate the results into a [`StudyOutput`].
///
/// Each entry's `path` is joined onto `base_dir`, read from disk, and run via
/// [`crate::api::run_toml`]; the returned JSON is parsed for its `scenario_hash`
/// and FoM block(s). The aggregate is deterministic: no clock is read, and the
/// per-scenario figures are carried verbatim, so they match running each scenario
/// alone. Returns an `Err` with a path-qualified message when a scenario file
/// cannot be read or fails to run.
pub fn run_suite(suite: &Suite, base_dir: &Path) -> Result<StudyOutput, String> {
    if suite.scenarios.is_empty() {
        return Err("study has no scenarios to run".to_string());
    }
    let mut resolved: Vec<Resolved> = Vec::with_capacity(suite.scenarios.len());
    for entry in &suite.scenarios {
        let path = base_dir.join(&entry.path);
        let src = std::fs::read_to_string(&path)
            .map_err(|e| format!("cannot read scenario {}: {e}", path.display()))?;
        let out = crate::api::run_toml(&src)
            .map_err(|e| format!("scenario {} failed: {e}", path.display()))?;
        let root: serde_json::Value = serde_json::from_str(&out.json)
            .map_err(|e| format!("scenario {} produced unparseable JSON: {e}", path.display()))?;
        let scenario_hash = root
            .get("scenario_hash")
            .and_then(|v| v.as_str())
            .unwrap_or_default()
            .to_string();
        let foms = extract_foms(&root);
        resolved.push(Resolved {
            label: label_for(&entry.path, &entry.label),
            scenario_hash,
            foms,
        });
    }

    let artifact = StudyArtifact {
        schema_version: crate::interchange::SCHEMA_VERSION.to_string(),
        engine_version: env!("CARGO_PKG_VERSION").to_string(),
        title: suite.title.clone(),
        description: suite.description.clone(),
        // Pure/deterministic: never stamped here. The CLI may add a stamp.
        generated_utc: None,
        scenarios: resolved
            .iter()
            .map(|r| StudyScenario {
                label: r.label.clone(),
                scenario_hash: r.scenario_hash.clone(),
                foms: r.foms.clone(),
            })
            .collect(),
    };
    // `StudyArtifact` is Strings/`Option<String>`s plus `Vec<StudyScenario>`, whose only
    // non-trivial field is a `serde_json::Value` (whose object keys are `String`). There
    // is no non-string-keyed map and no fallible custom `Serialize`, so this cannot fail.
    let json = serde_json::to_string_pretty(&artifact)
        .expect("StudyArtifact (Strings + serde_json::Value) always serialises");

    let html = render_html(&suite.title, suite.description.as_deref(), &resolved);
    let summary = format!(
        "study \"{}\": {} scenarios",
        suite.title,
        suite.scenarios.len()
    );

    Ok(StudyOutput {
        json,
        html,
        summary,
    })
}

/// Escape the five characters that matter in an HTML text/attribute context.
fn html_escape(s: &str) -> String {
    s.replace('&', "&amp;")
        .replace('<', "&lt;")
        .replace('>', "&gt;")
        .replace('"', "&quot;")
        .replace('\'', "&#39;")
}

/// The timing-domain figures of merit, in report order, paired with a human label
/// and unit — the same set the per-scenario report uses, so the comparison table
/// and the scorecard never drift on the FoM names. (Mirrors `FOM_LABELS` in
/// [`crate::api`]; kept here to avoid widening that module's surface.)
const FOM_LABELS: &[(&str, &str, &str)] = &[
    ("holdover_s", "Holdover", "s"),
    ("timing_rms_ns", "Timing RMS", "ns"),
    ("timing_p95_ns", "Timing p95", "ns"),
    ("resilience_slope_ns_per_s", "Resilience slope", "ns/s"),
    ("availability", "Availability", ""),
    ("integrity", "Integrity", ""),
    ("security", "Security", ""),
];

/// A FoM value, looked up across the clock blocks of one scenario. Returns the
/// first present-and-numeric value found (preferring `quantum`, then `classical`,
/// then a top-level `fom`), or `None` if the scenario does not report it.
fn fom_value(foms: &serde_json::Value, key: &str) -> Option<f64> {
    for clock in ["quantum", "classical", "fom"] {
        if let Some(v) = foms
            .get(clock)
            .and_then(|b| b.get(key))
            .and_then(|v| v.as_f64())
        {
            return Some(v);
        }
    }
    None
}

/// Render the self-contained comparison report: the study title, an optional
/// description, and a side-by-side table (rows = FoMs, columns = scenarios) where
/// every FoM row carries its [`crate::fom_label::tier_for`] VALIDATED/MODELLED
/// tag. Plain and dependency-free; the MODELLED labels are surfaced verbatim so
/// the honesty surface survives aggregation. No overclaims.
fn render_html(title: &str, description: Option<&str>, scenarios: &[Resolved]) -> String {
    let title_e = html_escape(title);

    // Column headers: one per scenario.
    let mut head_cols = String::from("<th>Metric</th><th>Validation</th>");
    for r in scenarios {
        head_cols.push_str(&format!("<th class=\"num\">{}</th>", html_escape(&r.label)));
    }

    // One row per FoM that at least one scenario reports.
    let mut body = String::new();
    for (key, label, unit) in FOM_LABELS {
        let any = scenarios.iter().any(|r| fom_value(&r.foms, key).is_some());
        if !any {
            continue;
        }
        let Some(tier) = crate::fom_label::tier_for(key) else {
            continue;
        };
        let metric = if unit.is_empty() {
            (*label).to_string()
        } else {
            format!("{label} ({unit})")
        };
        let mut row = format!(
            "<tr><td>{}</td><td><span class=\"tier\">{}</span></td>",
            html_escape(&metric),
            tier.tag(),
        );
        for r in scenarios {
            match fom_value(&r.foms, key) {
                Some(v) => row.push_str(&format!("<td class=\"num\">{v:.3}</td>")),
                None => row.push_str("<td class=\"num\">&mdash;</td>"),
            }
        }
        row.push_str("</tr>");
        body.push_str(&row);
    }

    let desc_block = match description {
        Some(d) if !d.trim().is_empty() => {
            format!("<p class=\"desc\">{}</p>\n", html_escape(d))
        }
        _ => String::new(),
    };

    format!(
        "<!doctype html>\n<html lang=\"en\">\n<head>\n<meta charset=\"utf-8\"/>\n\
         <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"/>\n\
         <title>{title_e} \u{2014} Kshana study</title>\n<style>\n\
         :root{{color-scheme:light dark}}\
         body{{font-family:system-ui,-apple-system,Segoe UI,Roboto,sans-serif;line-height:1.55;\
         max-width:1000px;margin:0 auto;padding:2rem 1.25rem 3rem}}\
         .eyebrow{{letter-spacing:.18em;text-transform:uppercase;font-size:.72rem;opacity:.6;text-align:center}}\
         h1{{text-align:center;font-size:2.1rem;margin:.1rem 0;\
         background:linear-gradient(135deg,#2dd4bf,#6366f1,#a855f7);-webkit-background-clip:text;\
         background-clip:text;color:transparent}}\
         .desc{{text-align:center;opacity:.78;margin:.2rem 0 1.2rem}}\
         h2{{font-size:1.15rem;margin:1.6rem 0 .6rem;border-bottom:1px solid #8884;padding-bottom:.2rem}}\
         table{{border-collapse:collapse;width:100%;font-size:.9rem}}\
         th,td{{border:1px solid #8884;padding:.35rem .6rem;text-align:left}}\
         td.num,th.num{{text-align:right;font-variant-numeric:tabular-nums}}\
         .tier{{font-size:.72rem;letter-spacing:.06em;font-weight:600;padding:.05rem .4rem;\
         border:1px solid #8886;border-radius:4px;white-space:nowrap}}\
         .tier-note{{font-size:.8rem;opacity:.75;margin:.5rem 0 1rem}}\
         footer{{margin-top:2rem;padding-top:1rem;border-top:1px solid #8884;font-size:.85rem;opacity:.75}}\
         </style>\n</head>\n<body>\n\
         <p class=\"eyebrow\">\u{915}\u{94d}\u{937}\u{923} \u{b7} the precise instant</p>\n\
         <h1>{title_e}</h1>\n\
         {desc_block}\
         <h2>Side-by-side comparison</h2>\n\
         <table><thead><tr>{head_cols}</tr></thead><tbody>{body}</tbody></table>\n\
         <p class=\"tier-note\">Each figure of merit is tagged VALIDATED (checked against an \
         external oracle) or MODELLED (first-principles, internally tested), derived from the \
         verification matrix. Columns are independent scenarios; values are not normalised \
         across scenarios.</p>\n\
         <footer>Generated by Kshana {version} as an aggregated study of {n} scenarios. \
         Each scenario is reproducible from its scenario + seed + engine version. \
         Free and open source (AGPL-3.0) \u{2014} \
         <a href=\"https://github.com/AshfordeOU/kshana\">source &amp; docs</a>.</footer>\n\
         </body>\n</html>\n",
        version = env!("CARGO_PKG_VERSION"),
        n = scenarios.len(),
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn label_falls_back_to_path_stem() {
        assert_eq!(
            label_for("a/b/clock-holdover.toml", &None),
            "clock-holdover"
        );
        assert_eq!(
            label_for("a.toml", &Some("Explicit".to_string())),
            "Explicit"
        );
    }

    #[test]
    fn extract_foms_pulls_clock_blocks() {
        let root = serde_json::json!({
            "quantum": {"fom": {"holdover_s": 1.0}},
            "classical": {"fom": {"holdover_s": 2.0}},
        });
        let foms = extract_foms(&root);
        assert_eq!(foms["quantum"]["holdover_s"], 1.0);
        assert_eq!(foms["classical"]["holdover_s"], 2.0);
    }

    #[test]
    fn extract_foms_handles_top_level_fom() {
        let root = serde_json::json!({ "fom": {"availability": 0.9} });
        let foms = extract_foms(&root);
        assert_eq!(foms["fom"]["availability"], 0.9);
        assert!(foms.get("quantum").is_none());
    }

    #[test]
    fn fom_value_prefers_quantum_then_classical() {
        let foms = serde_json::json!({
            "quantum": {"holdover_s": 10.0},
            "classical": {"holdover_s": 20.0},
        });
        assert_eq!(fom_value(&foms, "holdover_s"), Some(10.0));
        let only_classical = serde_json::json!({ "classical": {"availability": 0.5} });
        assert_eq!(fom_value(&only_classical, "availability"), Some(0.5));
        assert_eq!(fom_value(&foms, "not_a_fom"), None);
    }

    #[test]
    fn render_html_has_table_title_and_tier() {
        let scenarios = vec![Resolved {
            label: "Alpha".to_string(),
            scenario_hash: "abc".to_string(),
            foms: serde_json::json!({ "quantum": {"holdover_s": 3.0, "availability": 1.0} }),
        }];
        let html = render_html("My Study", Some("desc"), &scenarios);
        assert!(html.contains("My Study"));
        assert!(html.contains("desc"));
        assert!(html.contains("<table"));
        assert!(html.contains("Alpha"));
        assert!(html.contains("Holdover"));
        assert!(html.contains("MODELLED"));
    }
}
