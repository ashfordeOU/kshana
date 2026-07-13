// SPDX-License-Identifier: AGPL-3.0-only
use std::path::PathBuf;
use std::process::ExitCode;
use std::time::{SystemTime, UNIX_EPOCH};

/// Format the current system time as a UTC ISO-8601 second-precision stamp
/// (e.g. `2026-06-23T14:05:09Z`). This is the ONLY clock read in the whole crate:
/// the library/engine/api stay pure and deterministic, and the timestamp is passed
/// in to them as data. Implemented with `std` only (no chrono) via a civil-date
/// conversion of the Unix epoch seconds.
fn utc_iso8601_now() -> String {
    let secs = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| d.as_secs())
        .unwrap_or(0);
    let days = (secs / 86_400) as i64;
    let tod = secs % 86_400;
    let (hour, min, sec) = (tod / 3600, (tod % 3600) / 60, tod % 60);
    let (year, month, day) = civil_from_days(days);
    format!("{year:04}-{month:02}-{day:02}T{hour:02}:{min:02}:{sec:02}Z")
}

/// Convert days since the Unix epoch (1970-01-01) to a proleptic-Gregorian
/// (year, month, day). Howard Hinnant's well-known `civil_from_days` algorithm.
fn civil_from_days(z: i64) -> (i64, u32, u32) {
    let z = z + 719_468;
    let era = if z >= 0 { z } else { z - 146_096 } / 146_097;
    let doe = (z - era * 146_097) as u64; // [0, 146096]
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365; // [0, 399]
    let y = yoe as i64 + era * 400;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100); // [0, 365]
    let mp = (5 * doy + 2) / 153; // [0, 11]
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32; // [1, 31]
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32; // [1, 12]
    (if m <= 2 { y + 1 } else { y }, m, d)
}

fn main() -> ExitCode {
    let args: Vec<String> = std::env::args().collect();
    // usage: kshana <scenario.toml> [--study-name <s>] [--eop <finals2000A>] [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>]
    //    or: kshana --study <suite.toml>
    //    or: kshana --validate <scenario.toml>
    let mut positional: Option<String> = None;
    let mut export_sp3_path: Option<PathBuf> = None;
    let mut export_omm_path: Option<PathBuf> = None;
    let mut export_oem_path: Option<PathBuf> = None;
    let mut eop_path: Option<PathBuf> = None;
    let mut study_name: Option<String> = None;
    let mut study_suite_path: Option<PathBuf> = None;
    let mut validate_path: Option<PathBuf> = None;
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--validate" => {
                i += 1;
                match args.get(i) {
                    Some(p) => validate_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --validate needs a scenario path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--study" => {
                i += 1;
                match args.get(i) {
                    Some(p) => study_suite_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --study needs a suite manifest path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--study-name" => {
                i += 1;
                match args.get(i) {
                    Some(s) => study_name = Some(s.to_string()),
                    None => {
                        eprintln!("error: --study-name needs a value");
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-sp3" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_sp3_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-sp3 needs a path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-omm" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_omm_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-omm needs a path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-oem" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_oem_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --export-oem needs a path");
                        return ExitCode::from(2);
                    }
                }
            }
            "--eop" => {
                i += 1;
                match args.get(i) {
                    Some(p) => eop_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("error: --eop needs a finals2000A file path");
                        return ExitCode::from(2);
                    }
                }
            }
            other if positional.is_none() => positional = Some(other.to_string()),
            other => {
                eprintln!("error: unexpected argument '{other}'");
                return ExitCode::from(2);
            }
        }
        i += 1;
    }
    // `--validate <scenario.toml>`: lint a scenario against the crate's own
    // introspection (kind + required fields) and report problems WITHOUT running it,
    // so a user catches a misconfigured scenario before a (possibly long) run. This
    // flag is terminal: each violation is printed to stderr and the process exits 1
    // when there are any, 0 when the scenario lints clean.
    if let Some(validate_file) = validate_path {
        if positional.is_some() {
            eprintln!("error: --validate lints one scenario; do not also pass a scenario file");
            return ExitCode::from(2);
        }
        let src = match std::fs::read_to_string(&validate_file) {
            Ok(s) => s,
            Err(e) => {
                eprintln!("error: cannot read {}: {e}", validate_file.display());
                return ExitCode::FAILURE;
            }
        };
        let violations = kshana::api::validate_scenario(&src);
        if violations.is_empty() {
            return ExitCode::SUCCESS;
        }
        for v in &violations {
            eprintln!("{v}");
        }
        return ExitCode::FAILURE;
    }

    // `--study <suite.toml>`: run a named SET of scenarios together into one
    // aggregated, comparable artifact. The manifest is parsed, each scenario is
    // resolved against the manifest's parent directory and run through the same
    // engine the single-scenario path uses, and a `<suite_stem>.study.json` +
    // `<suite_stem>.study.html` pair is written. The library aggregation is pure;
    // only here (the CLI) may a generation timestamp be stamped onto the artifact.
    if let Some(suite_path) = study_suite_path {
        if positional.is_some() {
            eprintln!("error: --study runs a suite; do not also pass a single scenario file");
            return ExitCode::from(2);
        }
        return run_study(&suite_path);
    }

    let Some(scenario_arg) = positional else {
        eprintln!(
            "usage: kshana <scenario.toml> [--study-name <s>] [--eop <finals2000A>] [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>]\n   or: kshana --study <suite.toml>\n   or: kshana --validate <scenario.toml>"
        );
        return ExitCode::from(2);
    };
    let path = PathBuf::from(&scenario_arg);
    let mut src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: cannot read {}: {e}", path.display());
            return ExitCode::FAILURE;
        }
    };

    // `--eop <finals2000A>`: inline a real IERS Earth-orientation file into the
    // scenario so the ephemeris ground track is reduced through real UT1/pole rather
    // than the nominal scalars. The data travels in the scenario, keeping the run
    // reproducible from the (now self-contained) TOML alone.
    if let Some(eop_file) = &eop_path {
        let body = match std::fs::read_to_string(eop_file) {
            Ok(b) => b,
            Err(e) => {
                eprintln!("error: cannot read {}: {e}", eop_file.display());
                return ExitCode::FAILURE;
            }
        };
        match kshana::api::inject_eop(&src, &body) {
            Ok(merged) => src = merged,
            Err(e) => {
                eprintln!("error: --eop: {e}");
                return ExitCode::FAILURE;
            }
        }
    }
    let mut out = match kshana::api::run_toml(&src) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };

    // `--study-name <s>`: stamp additive study metadata (title + a UTC generation
    // time, the only clock read in the crate) into the result JSON, and name the
    // output files after a slug of the study instead of the scenario path stem. With
    // no `--study-name`, nothing below runs and the output stays byte-identical.
    let output_base: PathBuf = match &study_name {
        Some(name) => {
            let meta = kshana::report::study_meta_with_title(name, &utc_iso8601_now());
            out.json = kshana::api::with_study_meta(&out.json, &meta);
            // Write the study-named outputs in the scenario file's directory.
            let dir = path.parent().unwrap_or_else(|| std::path::Path::new("."));
            dir.join(kshana::report::slugify(name))
        }
        None => path.clone(),
    };

    let json_path = output_base.with_extension("result.json");
    if let Err(e) = std::fs::write(&json_path, &out.json) {
        eprintln!("error: cannot write {}: {e}", json_path.display());
        return ExitCode::FAILURE;
    }
    let svg_path = output_base.with_extension("chart.svg");
    if let Err(e) = std::fs::write(&svg_path, &out.svg) {
        eprintln!("error: cannot write {}: {e}", svg_path.display());
        return ExitCode::FAILURE;
    }
    let html_path = output_base.with_extension("report.html");
    if let Err(e) = std::fs::write(&html_path, out.html_report()) {
        eprintln!("error: cannot write {}: {e}", html_path.display());
        return ExitCode::FAILURE;
    }
    // CSV reproducibility artifact, when the scenario publishes one (e.g.
    // realtime-frame-eop's P4 Table 1 + Table 2). A plain run now emits the CSV the
    // paper cites, not only the golden-regen test.
    let csv_path = output_base.with_extension("table.csv");
    let wrote_csv = out.csv.is_some();
    match out.write_csv(&csv_path) {
        Ok(_) => {}
        Err(e) => {
            eprintln!("error: cannot write {}: {e}", csv_path.display());
            return ExitCode::FAILURE;
        }
    }
    println!("{}", out.summary);
    if wrote_csv {
        println!(
            "wrote {}, {}, {}, and {}",
            json_path.display(),
            svg_path.display(),
            html_path.display(),
            csv_path.display()
        );
    } else {
        println!(
            "wrote {}, {}, and {}",
            json_path.display(),
            svg_path.display(),
            html_path.display()
        );
    }

    // SP3 export: an explicit `--export-sp3 <path>`, or the scenario's `export_sp3`
    // option which auto-writes `<scenario>.sp3`. Both require an orbit scenario.
    let sp3_target = match (&export_sp3_path, kshana::api::auto_export_sp3(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_sp3(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("sp3"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("sp3"), Err(e))),
    };
    if let Some((sp3_path, result)) = sp3_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&sp3_path, text) {
                    eprintln!("error: cannot write {}: {e}", sp3_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", sp3_path.display());
            }
            Err(e) => {
                eprintln!("error: SP3 export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }

    // OMM export: an explicit `--export-omm <path>`, or the scenario's `export_omm`
    // option which auto-writes `<scenario>.omm`. Both require an orbit scenario with
    // a TLE-defined constellation.
    let omm_target = match (&export_omm_path, kshana::api::auto_export_omm(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_omm(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("omm"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("omm"), Err(e))),
    };
    if let Some((omm_path, result)) = omm_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&omm_path, text) {
                    eprintln!("error: cannot write {}: {e}", omm_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", omm_path.display());
            }
            Err(e) => {
                eprintln!("error: OMM export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }

    // OEM export: an explicit `--export-oem <path>`, or the scenario's `export_oem`
    // option which auto-writes `<scenario>.oem`. Both require an orbit scenario. OEM
    // carries the full inertial state (position AND velocity), unlike SP3.
    let oem_target = match (&export_oem_path, kshana::api::auto_export_oem(&src)) {
        (Some(p), _) => Some((p.clone(), kshana::api::export_oem(&src))),
        (None, Ok(Some(text))) => Some((path.with_extension("oem"), Ok(text))),
        (None, Ok(None)) => None,
        (None, Err(e)) => Some((path.with_extension("oem"), Err(e))),
    };
    if let Some((oem_path, result)) = oem_target {
        match result {
            Ok(text) => {
                if let Err(e) = std::fs::write(&oem_path, text) {
                    eprintln!("error: cannot write {}: {e}", oem_path.display());
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", oem_path.display());
            }
            Err(e) => {
                eprintln!("error: OEM export failed: {e}");
                return ExitCode::FAILURE;
            }
        }
    }
    ExitCode::SUCCESS
}

/// `--study <suite.toml>` handler: parse the suite manifest, run every scenario it
/// names (resolved against the manifest's parent directory) through the same
/// engine the single-scenario path uses, and write a `<suite_stem>.study.json`
/// plus `<suite_stem>.study.html` next to the manifest. The library aggregation
/// ([`kshana::study::run_suite`]) is pure; the CLI is the only place allowed to
/// stamp a generation timestamp, so it injects `generated_utc` into the artifact
/// here (the HTML/JSON the library produced stay byte-deterministic without it).
fn run_study(suite_path: &std::path::Path) -> ExitCode {
    let src = match std::fs::read_to_string(suite_path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: cannot read {}: {e}", suite_path.display());
            return ExitCode::FAILURE;
        }
    };
    let suite = match kshana::suite::parse_suite(&src) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };
    let base_dir = suite_path
        .parent()
        .unwrap_or_else(|| std::path::Path::new("."));
    let out = match kshana::study::run_suite(&suite, base_dir) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };

    // Stamp a CLI-supplied generation time into the study JSON (the only clock
    // read in the crate). Pure aggregation never reads a clock, so the stamp is
    // added here, after the fact.
    let json = stamp_study_generated(&out.json, &utc_iso8601_now());

    let base = output_base_for_suite(suite_path);
    let json_path = base.with_extension("study.json");
    if let Err(e) = std::fs::write(&json_path, &json) {
        eprintln!("error: cannot write {}: {e}", json_path.display());
        return ExitCode::FAILURE;
    }
    let html_path = base.with_extension("study.html");
    if let Err(e) = std::fs::write(&html_path, &out.html) {
        eprintln!("error: cannot write {}: {e}", html_path.display());
        return ExitCode::FAILURE;
    }
    println!("{}", out.summary);
    println!("wrote {} and {}", json_path.display(), html_path.display());
    ExitCode::SUCCESS
}

/// The output base for a suite manifest: the manifest path with any extension
/// stripped, so `holdover.toml` → `holdover` and the writers append
/// `.study.json` / `.study.html`.
fn output_base_for_suite(suite_path: &std::path::Path) -> PathBuf {
    suite_path.with_extension("")
}

/// Inject a `generated_utc` field into the study artifact JSON. Parses the
/// document, sets the field on the top-level object, and re-serializes; a parse
/// failure (should not happen for our own output) leaves the JSON unchanged so a
/// study is still written.
fn stamp_study_generated(json: &str, stamp: &str) -> String {
    match serde_json::from_str::<serde_json::Value>(json) {
        Ok(mut v) => {
            if let Some(obj) = v.as_object_mut() {
                obj.insert(
                    "generated_utc".to_string(),
                    serde_json::Value::String(stamp.to_string()),
                );
            }
            serde_json::to_string_pretty(&v).unwrap_or_else(|_| json.to_string())
        }
        Err(_) => json.to_string(),
    }
}
