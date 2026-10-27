// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana jammertest import` and `kshana jammertest score`.

use super::plan::import_attack_log;
use super::plan::{
    events_toml, import, parse_catalog, parse_plan, sha256_hex, ImportOptions, SCHEDULED_TRUTH,
};
use super::score::{ScoreOptions, Scorecard};
use super::{score_log, score_pack, Schedule, ScoreRequest};
use crate::evidence::cli::{flag_value, now_rfc3339, read_seed, write_dir};
use crate::receiver_trust::ingest::read_log;
use crate::receiver_trust::scenario::{self, ReceiverTrustScenario};
use crate::receiver_trust::LogFormat;
use crate::telemetry::time::parse_rfc3339_utc;
use std::path::Path;
use std::process::ExitCode;

fn usage() -> String {
    crate::t!("jammertest-cli-usage")
}

fn all_values(args: &[String], name: &str) -> Result<Vec<String>, String> {
    let mut v = Vec::new();
    let mut i = 0;
    while i < args.len() {
        if args[i] == name {
            v.push(
                args.get(i + 1)
                    .cloned()
                    .ok_or_else(|| crate::terr!("e-evidence-cli-needs-value", name = name))?,
            );
            i += 1;
        }
        i += 1;
    }
    Ok(v)
}

fn num<T: std::str::FromStr>(args: &[String], name: &str) -> Result<Option<T>, String> {
    flag_value(args, name)?
        .map(|s| {
            s.parse::<T>()
                .map_err(|_| crate::terr!("e-jammertest-cli-is-not-number", name = name, s = s))
        })
        .transpose()
}

fn read(path: &str) -> Result<Vec<u8>, String> {
    std::fs::read(path)
        .map_err(|e| crate::terr!("e-interference-map-cli-cannot-read", path = path, e = e))
}

fn read_text(path: &str) -> Result<String, String> {
    String::from_utf8(read(path)?)
        .map_err(|_| crate::terr!("e-jammertest-cli-is-not-utf-text", path = path))
}

/// Entry point; `args` are those after `jammertest`.
pub fn run_cli(args: &[String]) -> ExitCode {
    let r = match args.first().map(String::as_str) {
        Some("import") => run_import(&args[1..]),
        Some("score") => run_score(&args[1..]),
        _ => Err(String::new()),
    };
    match r {
        Ok(()) => ExitCode::SUCCESS,
        Err(e) => {
            if !e.is_empty() {
                eprintln!("{}", crate::t!("main-fail", e = e));
            }
            eprintln!("{}", usage());
            ExitCode::from(2)
        }
    }
}

struct Sources {
    catalog_json: String,
    plan_jsons: Vec<String>,
    names: Vec<(String, String)>,
}

fn sources(args: &[String]) -> Result<Sources, String> {
    let cat = flag_value(args, "--catalog")?
        .ok_or_else(|| crate::terr!("e-jammertest-cli-needs-catalog"))?;
    let plans = all_values(args, "--plan")?;
    if plans.is_empty() {
        return Err(crate::terr!("e-jammertest-cli-needs-at-least-one-plan"));
    }
    let mut names = Vec::new();
    let cb = read(&cat)?;
    names.push((file_name(&cat), sha256_hex(&cb)));
    let catalog_json = String::from_utf8(cb)
        .map_err(|_| crate::terr!("e-jammertest-cli-is-not-utf", cat = cat))?;
    let mut plan_jsons = Vec::new();
    for p in &plans {
        let b = read(p)?;
        names.push((file_name(p), sha256_hex(&b)));
        plan_jsons.push(
            String::from_utf8(b)
                .map_err(|_| crate::terr!("e-jammertest-cli-is-not-utf-2", p = p))?,
        );
    }
    Ok(Sources {
        catalog_json,
        plan_jsons,
        names,
    })
}

fn file_name(p: &str) -> String {
    Path::new(p)
        .file_name()
        .map_or_else(|| p.to_string(), |n| n.to_string_lossy().into_owned())
}

fn parse_format(s: &str) -> Result<LogFormat, String> {
    serde_json::from_value(serde_json::Value::String(s.to_string()))
        .map_err(|_| crate::terr!("e-jammertest-cli-format-is-not-one-of", s = s))
}

fn run_import(args: &[String]) -> Result<(), String> {
    let offset = num::<f64>(args, "--local-offset-h")?.unwrap_or(2.0);
    let (log_start_utc, duration) = match flag_value(args, "--log-start")? {
        Some(t) => (
            parse_rfc3339_utc(&t)
                .ok_or_else(|| crate::terr!("e-jammertest-cli-log-start-is-not-utc", t = t))?,
            None,
        ),
        None => {
            let log = flag_value(args, "--log")?
                .ok_or_else(|| crate::terr!("e-jammertest-cli-needs-log-start-or-log"))?;
            let fmt = parse_format(
                &flag_value(args, "--format")?
                    .ok_or_else(|| crate::terr!("e-jammertest-cli-log-needs-format"))?,
            )?;
            let tl = read_log(fmt, &read(&log)?)?;
            let label = tl
                .start_label
                .ok_or_else(|| crate::terr!("e-jammertest-cli-the-log-does-not-state"))?;
            (
                parse_rfc3339_utc(&label).ok_or_else(|| {
                    crate::terr!("e-jammertest-cli-the-log-states-its-start", label = label)
                })?,
                tl.epochs.last().map(|e| e.t_s),
            )
        }
    };
    let (imp, names) = match flag_value(args, "--attack-log")? {
        Some(a) => {
            let b = read(&a)?;
            let shift = num::<f64>(args, "--time-shift-h")?.unwrap_or(-2.0) * 3600.0;
            let text = String::from_utf8(b.clone())
                .map_err(|_| crate::terr!("e-jammertest-cli-is-not-utf-3", a = a))?;
            (
                crate::i18n::in_english_or_localised_error(|| {
                    import_attack_log(&text, shift, log_start_utc, duration)
                })?,
                vec![(file_name(&a), sha256_hex(&b))],
            )
        }
        None => {
            let src = sources(args)?;
            let catalog = parse_catalog(&src.catalog_json)?;
            let mut slots = Vec::new();
            for p in &src.plan_jsons {
                slots.extend(parse_plan(p, offset)?);
            }
            let options = ImportOptions {
                location: num::<u32>(args, "--location")?,
                log_start_utc,
                log_duration_s: duration,
                year: num::<u32>(args, "--year")?,
            };
            // The events are a machine file: English in every language.
            let imp =
                crate::i18n::in_english_or_localised_error(|| import(&slots, &catalog, &options))?;
            (imp, src.names)
        }
    };
    let text = crate::i18n::in_english(|| events_toml(&imp, &names));
    match flag_value(args, "--out")? {
        Some(o) => {
            std::fs::write(&o, &text)
                .map_err(|e| crate::terr!("e-jammertest-cli-cannot-write", o = o, e = e))?;
            println!(
                "{}",
                crate::t!(
                    "jammertest-cli-events-written-to-non-rf",
                    events = imp.events.len(),
                    SCHEDULED_TRUTH = SCHEDULED_TRUTH,
                    o = o,
                    skipped_non_rf = imp.skipped_non_rf,
                    outside_log = imp.outside_log,
                    unknown_ids = imp.unknown_ids.len()
                )
            );
        }
        None => print!("{text}"),
    }
    if !imp.unknown_ids.is_empty() {
        eprintln!(
            "{}",
            crate::t!(
                "jammertest-cli-note-ids-not-in-the",
                unknown_ids = imp.unknown_ids.join(", ")
            )
        );
    }
    eprintln!("{}", crate::t!("jammertest-cli-note-these-are-the-plan"));
    Ok(())
}

fn fmt_opt(v: Option<f64>, unit: &str) -> String {
    v.map_or_else(|| "-".into(), |x| format!("{x:.1}{unit}"))
}

fn print_card(c: &Scorecard) {
    println!("{}", c.label);
    println!(
        "{}",
        crate::t!(
            "jammertest-cli-test-name",
            v1 = format!("{:<8}", "test"),
            v2 = format!("{:<9}", "kind"),
            v3 = format!("{:>9}", "onset s"),
            v4 = format!("{:>9}", "end s"),
            v5 = format!("{:<13}", "outcome"),
            v6 = format!("{:>9}", "latency s"),
            v7 = format!("{:>9}", "recover s")
        )
    );
    for t in &c.tests {
        println!(
            "{:<8} {:<9} {:>9.0} {:>9.0} {:<13} {:>9} {:>9}  {}",
            t.test_id,
            format!("{:?}", t.kind).to_lowercase(),
            t.onset_s,
            t.end_s,
            t.outcome,
            fmt_opt(t.latency_s, ""),
            fmt_opt(t.time_to_recover_s, ""),
            t.test_name
        );
    }
    let s = &c.summary;
    println!(
        "{}",
        crate::t!(
            "jammertest-cli-tests-evaluable-detected-within-tolerance",
            tests = s.tests,
            evaluable = s.evaluable,
            detected = s.detected,
            late = s.late,
            missed = s.missed,
            fmt_opt = fmt_opt(s.median_latency_s, " s"),
            fmt_opt2 = fmt_opt(s.median_time_to_recover_s, " s")
        )
    );
    println!(
        "{}",
        crate::t!(
            "jammertest-cli-false-alarms-outside-every-slot",
            false_alarm_runs = s.false_alarm_runs,
            false_alarm_epochs = s.false_alarm_epochs,
            clean_epochs = s.clean_epochs
        )
    );
    println!("{}", c.advisory);
}

fn run_score(args: &[String]) -> Result<(), String> {
    let scn_path = args
        .first()
        .filter(|a| !a.starts_with("--"))
        .ok_or_else(|| crate::terr!("e-jammertest-cli-needs-session-path"))?;
    let toml_text = read_text(scn_path)?;
    let mut scn: ReceiverTrustScenario = toml::from_str(&toml_text)
        .map_err(|e| crate::terr!("e-evidence-cli-invalid-receiver-trust-scenario", e = e))?;
    scenario::resolve_paths(
        &mut scn,
        Path::new(scn_path).parent().unwrap_or(Path::new("")),
    );
    let log_bytes = scenario::load_source(&scn.log.source, "log")?;
    let log_name = scn
        .log
        .source
        .path
        .clone()
        .unwrap_or_else(|| "inline".into());
    let dflt = ScoreOptions::default();
    let attack_json = match flag_value(args, "--attack-log")? {
        Some(a) => Some(read_text(&a)?),
        None => None,
    };
    let src = match attack_json {
        Some(_) => None,
        None => Some(sources(&args[1..])?),
    };
    let plan_refs: Vec<&str> = src
        .iter()
        .flat_map(|s| s.plan_jsons.iter().map(String::as_str))
        .collect();
    let schedule = match (&attack_json, &src) {
        (Some(j), _) => Schedule::AttackLog {
            scenario_json: j,
            shift_s: num::<f64>(args, "--time-shift-h")?.unwrap_or(-2.0) * 3600.0,
        },
        (None, Some(s)) => Schedule::Plan {
            catalog_json: &s.catalog_json,
            plan_jsons: &plan_refs,
            location: num::<u32>(args, "--location")?,
            local_offset_h: num::<f64>(args, "--local-offset-h")?.unwrap_or(2.0),
            year: num::<u32>(args, "--year")?,
        },
        (None, None) => return Err(crate::terr!("e-jammertest-cli-needs-catalog-and-plan-or")),
    };
    let req = ScoreRequest {
        scenario: &scn,
        log_bytes: &log_bytes,
        schedule,
        log_start_utc: match flag_value(args, "--log-start")? {
            Some(t) => Some(
                parse_rfc3339_utc(&t)
                    .ok_or_else(|| crate::terr!("e-jammertest-cli-log-start-is-not-utc", t = t))?,
            ),
            None => None,
        },
        options: ScoreOptions {
            recover_hold_s: num::<f64>(args, "--recover-hold-s")?.unwrap_or(dflt.recover_hold_s),
            guard_s: num::<f64>(args, "--guard-s")?.unwrap_or(dflt.guard_s),
        },
    };
    let card = match flag_value(args, "--key")? {
        Some(key) => {
            let out = flag_value(args, "--out")?
                .ok_or_else(|| crate::terr!("e-jammertest-cli-key-needs-out-dir"))?;
            let seed = read_seed(&key)?;
            let created = match flag_value(args, "--created-utc")?.as_deref() {
                Some("none") => None,
                Some(v) => Some(v.to_string()),
                None => Some(now_rfc3339()),
            };
            let title = flag_value(args, "--title")?.unwrap_or_else(|| "Jammertest score".into());
            let (o, pack) = crate::i18n::in_english_or_localised_error(|| {
                score_pack(&req, &log_name, &title, created.as_deref(), &seed)
            })?;
            write_dir(Path::new(&out), &pack.files)?;
            eprintln!(
                "{}",
                crate::t!(
                    "jammertest-cli-evidence-pack-written-to-signer",
                    out = out,
                    signer_fingerprint = pack.signer_fingerprint
                )
            );
            eprintln!("{}", crate::t!("evidence-cli-verify-with", out = out));
            o.scorecard
        }
        None => crate::i18n::in_english_or_localised_error(|| score_log(&req))?.scorecard,
    };
    if args.iter().any(|a| a == "--json") {
        println!(
            "{}",
            serde_json::to_string_pretty(&card).map_err(|e| e.to_string())?
        );
    } else {
        print_card(&card);
    }
    Ok(())
}
