// SPDX-License-Identifier: AGPL-3.0-only
use std::path::PathBuf;
use std::process::ExitCode;
use std::time::{SystemTime, UNIX_EPOCH};

mod bundled_scenarios;
mod live_io;

/// The one usage text. Both the no-argument path and `--help` print this, so the two
/// cannot drift apart (they were two separate copies before, one of them a comment).
/// `.github/workflows/release.yml` greps the first line on the no-argument path, so
/// that line stays verbatim.
const USAGE: &str = "usage: kshana <scenario.toml> [--study-name <s>] [--eop <finals2000A>] [--export-sp3 <out.sp3>] [--export-omm <out.omm>] [--export-oem <out.oem>] [--export <czml|kml|geojson|stk|sigmf|all|list>]... [--import-route <route.geojson>]
   or: kshana <scenario.toml> --animate <svg|html|frames|all> [--animate-fps <n>] [--animate-duration <s>]
   or: kshana --study <suite.toml>
   or: kshana --validate <scenario.toml>
   or: kshana receiver-trust <scenario.toml>
   or: kshana receiver-trust live <session.toml> [--stdin | --file <path> [--follow] | --tcp <host:port> | --udp <port>] [--gate] (kshana receiver-trust live --help)
   or: kshana receiver-trust evidence <scenario.toml> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
   or: kshana evidence <keygen|verify|attach-timestamp> ... (kshana evidence --help)
   or: kshana jammertest <import|score> ... (kshana jammertest --help)
   or: kshana evidence round-trip <scenario.toml> --scenario <bench-scenario> --conditions <file> --from <t0> --to <t1> --key <keyfile> --out <dir> (kshana evidence --help)
   or: kshana trust-telemetry [options] (kshana trust-telemetry --help)
   or: kshana imu-fit <imu.csv> [--format csv|euroc] [--axis x|y|z] [--expected-mean <m/s2>] [--id <name>] [--json]
   or: kshana nmea-scenario <scenario.toml> [--out <file.nmea>] [--tcp <addr>|--udp <addr>] (kshana nmea-scenario --help)
   or: kshana interference-map <adsb|ais|fetch-land> ... (kshana interference-map --help)
   or: kshana route-exposure --route <route> --map <map.geojson|dir> [--from <date>] [--to <date>]
   or: kshana bench <spec|truth|cases|score|baseline|seal|reveal-check|manifest|verify-manifest|validate|leaderboard> ... (kshana bench --help)
   or: kshana bench-export <scenario.toml> [--out <base>] [--epoch <YYYY-MM-DDTHH:MM:SS>]
   or: kshana compliance-report [--out <base>] <result.json>... | --mapping | --sources
   or: kshana lunanet-afs-check <spec [--json] [--strict]|symbols <file> [--max-sp-errors <n>] [--json]|generate --frames <n> [--toi0 <t>] --out <file>>
   or: kshana standards-pack <list|run <id> [--json] [--out <base>]|rows <id>|tests <id>>
   or: kshana osnma verify <pages|vectors.csv|stream.ubx> [--merkle-root <hex>] [--public-key <id:type:hex>] [--reference-time <gst-s>] [--json] (kshana osnma --help)
   or: kshana iq <scene|acquire|track|sweep|labfit|campaign|conditions|frontend|monitor|inventory|info|extract|convert|decimate> ... (kshana iq --help)
   or: kshana sky <request.json|request.toml> | --site <lat,lon[,h]> --systems <a,b,...> [--time <s>] [--mask <deg>] [--skyline-preset <name>] [--uere <m>] [--monte-carlo <n> --seed <s>] [--svg] (kshana sky --help)
   or: kshana skyline --preset <name> [--json] | --presets | --profile <skyline.json|toml>
   or: kshana kinds [--json]
   or: kshana example [<name>]
   or: kshana --help | --version";

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

/// Exit status when stdout (or stderr) closes under us: 128 + SIGPIPE, what a shell reports
/// for `yes | head -1`, so a pipeline with `set -o pipefail` sees the conventional value.
const EXIT_CLOSED_PIPE: i32 = 141;

/// True when a panic message is `println!`/`eprintln!` failing because the reader went away
/// (EPIPE on Unix, ERROR_NO_DATA / ERROR_BROKEN_PIPE on Windows), and nothing else: a full
/// disk or any other write error still panics loudly.
fn is_closed_pipe_panic(msg: &str) -> bool {
    (msg.starts_with("failed printing to stdout") || msg.starts_with("failed printing to stderr"))
        && (msg.contains("Broken pipe")
            || msg.contains("os error 32)")
            || msg.contains("os error 232)")
            || msg.contains("os error 109)"))
}

/// Rust ignores SIGPIPE, so a closed stdout (`kshana kinds | head`) turns the next `println!`
/// into a panic with a backtrace hint. Restoring the default signal action would end the
/// process the way other tools end, but would also kill a live feed on a closed socket instead
/// of returning its write error, so only a closed stdout or stderr is handled: the process
/// exits quietly with [`EXIT_CLOSED_PIPE`]. Every other panic keeps the default report.
fn exit_quietly_when_stdout_closes() {
    let default_hook = std::panic::take_hook();
    std::panic::set_hook(Box::new(move |info| {
        let payload = info.payload();
        let msg = payload
            .downcast_ref::<String>()
            .map(String::as_str)
            .or_else(|| payload.downcast_ref::<&str>().copied())
            .unwrap_or("");
        if is_closed_pipe_panic(msg) {
            std::process::exit(EXIT_CLOSED_PIPE);
        }
        default_hook(info);
    }));
}

fn main() -> ExitCode {
    exit_quietly_when_stdout_closes();
    let mut args: Vec<String> = std::env::args().collect();
    // `--lang <tag>` and `--verbose` are global: they are taken out of the arguments wherever they
    // stand, so every subcommand sees the same command line it always did. The language is
    // `--lang`, then KSHANA_LANG, LC_ALL, LC_MESSAGES, LANG, then English.
    let mut lang_flag: Option<String> = None;
    let mut k = 1;
    while k < args.len() {
        if args[k] == "--verbose" {
            kshana::i18n::set_verbose(true);
            args.remove(k);
        } else if args[k] == "--lang" && k + 1 < args.len() {
            lang_flag = Some(args[k + 1].clone());
            args.drain(k..k + 2);
        } else if let Some(v) = args[k].strip_prefix("--lang=") {
            lang_flag = Some(v.to_string());
            args.remove(k);
        } else {
            k += 1;
        }
    }
    let lang = match kshana::i18n::select(lang_flag.as_deref()) {
        Ok(l) => l,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::from(2);
        }
    };
    kshana::i18n::set_default(lang.clone());
    kshana::i18n::with_lang(lang, || main_in_language(args))
}

fn main_in_language(args: Vec<String>) -> ExitCode {
    // `kshana kinds [--json]` is a terminal subcommand, resolved before the flag loop
    // because that loop's positional arm would otherwise read `kinds` as a scenario
    // path. The engine's unknown-kind error tells the user "`kshana kinds` lists all N
    // built-in kinds", so the CLI has to be able to answer it. The cost is that a file
    // literally named `kinds` can no longer be run by that bare name; `./kinds` can.
    if args.get(1).map(String::as_str) == Some("kinds") {
        return print_kinds(&args[2..]);
    }
    // `kshana example [<name>]` is terminal for the same reason: a registry install has
    // no scenarios/ directory, so this is how its user gets a scenario to run.
    if args.get(1).map(String::as_str) == Some("example") {
        return print_example(&args[2..]);
    }
    // `kshana evidence <keygen|verify|attach-timestamp>` and `kshana receiver-trust
    // evidence` make and check signed evidence packs (`kshana::evidence`).
    if args.get(1).map(String::as_str) == Some("evidence") {
        return ExitCode::from(kshana::evidence::cli::run_evidence(&args[2..]) as u8);
    }
    if args.get(1).map(String::as_str) == Some("receiver-trust")
        && args.get(2).map(String::as_str) == Some("evidence")
    {
        return ExitCode::from(
            kshana::evidence::cli::run_receiver_trust_evidence(&args[3..]) as u8,
        );
    }
    // `kshana jammertest <import|score>` reads the published Jammertest plan as scheduled truth
    // and scores a receiver log against it (docs/JAMMERTEST.md). Terminal, local files only.
    if args.get(1).map(String::as_str) == Some("jammertest") {
        return kshana::jammertest::cli::run_cli(&args[2..]);
    }
    // `kshana trust-telemetry` feeds the per-epoch trust stream to Prometheus, syslog
    // (CEF/LEEF) and, with the `otlp` feature, OpenTelemetry.
    if args.get(1).map(String::as_str) == Some("trust-telemetry") {
        return ExitCode::from(kshana::telemetry::cli::run(&args[2..]) as u8);
    }
    // `kshana imu-fit <imu.csv>` fits hybrid/fusion sensor parameters from a stationary IMU log.
    if args.get(1).map(String::as_str) == Some("imu-fit") {
        return run_imu_fit_cli(&args[2..]);
    }
    // `kshana receiver-trust <scenario.toml>` assesses a real receiver log. It is terminal
    // and outside the scenario-kind dispatch: its scenario names a log file instead of
    // describing a simulation.
    if args.get(1).map(String::as_str) == Some("receiver-trust") {
        return run_receiver_trust_cli(&args[2..]);
    }
    // `kshana nmea-scenario <scenario.toml>` writes or streams synthetic bridge NMEA for
    // crew training (kshana::nmea_synth). Terminal, text output only.
    if args.get(1).map(String::as_str) == Some("nmea-scenario") {
        return kshana::nmea_synth::cli::run_cli(&args[2..]);
    }
    // `kshana interference-map ...` and `kshana route-exposure ...` work on local files only
    // (see docs/INTERFERENCE-MAP.md); both are terminal subcommands.
    if args.get(1).map(String::as_str) == Some("interference-map") {
        return ExitCode::from(kshana::interference_map::cli::run_map(&args[2..]) as u8);
    }
    if args.get(1).map(String::as_str) == Some("route-exposure") {
        return ExitCode::from(kshana::interference_map::cli::run_route(&args[2..]) as u8);
    }
    // `kshana bench ...` scores kshana-bench result files (bench/SPEC.md); local files only.
    if args.get(1).map(String::as_str) == Some("bench") {
        return ExitCode::from(kshana::bench::cli::run(&args[2..]) as u8);
    }
    // `kshana bench-export <scenario.toml>` writes a scenario's vehicle motion and events
    // for a laboratory GNSS simulator (docs/TEST-BENCH.md). Terminal, like the others.
    if args.get(1).map(String::as_str) == Some("bench-export") {
        return run_bench_export_cli(&args[2..]);
    }
    // `kshana compliance-report <result.json>...` fills the public-framework mapping from
    // the runs given (docs/compliance/README.md). Terminal, like the others.
    // `kshana lunanet-afs-check ...` checks the LunaNet Augmented Forward Signal (LSIS-AFS V1.0).
    if args.get(1).map(String::as_str) == Some("lunanet-afs-check") {
        return run_lunanet_afs_cli(&args[2..]);
    }
    // `kshana standards-pack ...` lists and runs the scored standards packs (`standards/`).
    if args.get(1).map(String::as_str) == Some("standards-pack") {
        return run_standards_pack_cli(&args[2..]);
    }
    if args.get(1).map(String::as_str) == Some("compliance-report") {
        return run_compliance_report_cli(&args[2..]);
    }
    // `kshana iq <command>` handles the GNSS IQ layer: the signal-processing commands
    // (scene, acquire, track, sweep, labfit) in `kshana::iq::cli`, which hands the
    // data-handling ones (inventory, info, extract, convert, decimate) on to
    // `kshana::iq::io::cli`. Terminal for the same reason as the others.
    if args.get(1).map(String::as_str) == Some("iq") {
        return ExitCode::from(kshana::iq::cli::run(&args[2..]) as u8);
    }
    // `kshana osnma verify <input>` checks Galileo OSNMA authentication of I/NAV pages.
    if args.get(1).map(String::as_str) == Some("osnma") {
        return ExitCode::from(kshana::osnma::cli::run(&args[2..]) as u8);
    }
    // `kshana sky` and `kshana skyline` run the sky-geometry functions (docs/SKYLINE.md).
    // Terminal, JSON (or SVG) to standard output.
    if args.get(1).map(String::as_str) == Some("sky") {
        return run_sky_cli(&args[2..]);
    }
    if args.get(1).map(String::as_str) == Some("skyline") {
        return run_skyline_cli(&args[2..]);
    }
    let mut positional: Option<String> = None;
    let mut export_sp3_path: Option<PathBuf> = None;
    let mut export_omm_path: Option<PathBuf> = None;
    let mut export_oem_path: Option<PathBuf> = None;
    let mut eop_path: Option<PathBuf> = None;
    // `--export <fmt>` may be given more than once; `all` asks for every format that
    // applies and `list` only reports which apply.
    let mut exports: Vec<String> = Vec::new();
    let mut route_path: Option<PathBuf> = None;
    let mut study_name: Option<String> = None;
    let mut study_suite_path: Option<PathBuf> = None;
    let mut validate_path: Option<PathBuf> = None;
    let mut animate_formats: Vec<kshana::animation::AnimationFormat> = Vec::new();
    let mut animate_opts = kshana::animation::AnimationOptions::default();
    let mut animate_tuned = false;
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            // Help and version are the first two things typed at a newly installed
            // binary. Before these arms they fell through to the positional catch-all
            // and came back as `error: cannot read --help: No such file or directory`.
            "--help" | "-h" | "help" => {
                println!("{USAGE}");
                return ExitCode::SUCCESS;
            }
            // `--version` is how a result file gets tied back to the engine build that
            // wrote it: not every result JSON carries an engine_version of its own.
            "--version" | "-V" => {
                println!("kshana {}", env!("CARGO_PKG_VERSION"));
                return ExitCode::SUCCESS;
            }
            "--validate" => {
                i += 1;
                match args.get(i) {
                    Some(p) => validate_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-validate-needs-scenario-path"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--study" => {
                i += 1;
                match args.get(i) {
                    Some(p) => study_suite_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-study-needs-suite-manifest"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--study-name" => {
                i += 1;
                match args.get(i) {
                    Some(s) => study_name = Some(s.to_string()),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-study-name-needs-value"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-sp3" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_sp3_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-export-sp3-needs-path"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-omm" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_omm_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-export-omm-needs-path"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--export-oem" => {
                i += 1;
                match args.get(i) {
                    Some(p) => export_oem_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-export-oem-needs-path"));
                        return ExitCode::from(2);
                    }
                }
            }
            // `--animate <svg|html|frames|all>`: also export the run's time series as an
            // animation. Repeatable, and a comma list works (`--animate svg,html`).
            "--animate" => {
                i += 1;
                let Some(v) = args.get(i) else {
                    eprintln!("{}", kshana::t!("main-error-animate-needs-format-svg"));
                    return ExitCode::from(2);
                };
                match kshana::animation::AnimationFormat::parse_list(v) {
                    Ok(list) => {
                        for f in list {
                            if !animate_formats.contains(&f) {
                                animate_formats.push(f);
                            }
                        }
                    }
                    Err(e) => {
                        eprintln!("{}", kshana::t!("main-error-animate", e = e));
                        return ExitCode::from(2);
                    }
                }
            }
            "--animate-fps" => {
                i += 1;
                match args.get(i).and_then(|v| v.parse::<u32>().ok()) {
                    Some(n) => {
                        animate_opts.fps = n;
                        animate_tuned = true;
                    }
                    None => {
                        eprintln!("{}", kshana::t!("main-error-animate-fps-needs-whole"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--export" => {
                i += 1;
                match args.get(i) {
                    Some(f) => exports.push(f.to_string()),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-export-needs-format-czml"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--animate-duration" => {
                i += 1;
                match args.get(i).and_then(|v| v.parse::<f64>().ok()) {
                    Some(d) => {
                        animate_opts.duration_s = d;
                        animate_tuned = true;
                    }
                    None => {
                        eprintln!("{}", kshana::t!("main-error-animate-duration-needs-length"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--import-route" => {
                i += 1;
                match args.get(i) {
                    Some(p) => route_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-import-route-needs-geojson"));
                        return ExitCode::from(2);
                    }
                }
            }
            "--eop" => {
                i += 1;
                match args.get(i) {
                    Some(p) => eop_path = Some(PathBuf::from(p)),
                    None => {
                        eprintln!("{}", kshana::t!("main-error-eop-needs-finals2000a-file"));
                        return ExitCode::from(2);
                    }
                }
            }
            // A token starting with '-' that matched no arm above is a misspelled or
            // unsupported option, not a scenario path. Without this arm it became the
            // positional and the NEXT token was blamed, so `--exprot-sp3 out.sp3 s.toml`
            // reported "unexpected argument 'out.sp3'" and pointed away from the typo.
            // Flag VALUES never reach here: each flag arm consumes its own value.
            other if other.starts_with('-') => {
                eprintln!("{}", kshana::t!("main-error-unknown-option", other = other));
                eprintln!("{USAGE}");
                return ExitCode::from(2);
            }
            other if positional.is_none() => positional = Some(other.to_string()),
            other => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-unexpected-argument-one-scenario", other = other)
                );
                eprintln!("{USAGE}");
                return ExitCode::from(2);
            }
        }
        i += 1;
    }
    // The animation options are checked before anything runs, so a bad `--animate-fps`
    // costs nothing. Tuning them without `--animate` would do nothing; say so.
    if !animate_formats.is_empty() {
        if let Err(e) = animate_opts.validate() {
            eprintln!("error: {e}");
            return ExitCode::from(2);
        }
    } else if animate_tuned {
        eprintln!("{}", kshana::t!("main-warning-animate-fps-and-animate"));
    }
    if !animate_formats.is_empty() && (validate_path.is_some() || study_suite_path.is_some()) {
        eprintln!("{}", kshana::t!("main-error-animate-exports-one-scenario"));
        return ExitCode::from(2);
    }

    // `--validate <scenario.toml>`: lint a scenario against the crate's own
    // introspection (kind + required fields) and report problems WITHOUT running it,
    // so a user catches a misconfigured scenario before a (possibly long) run. This
    // flag is terminal: each violation is printed to stderr and the process exits 1
    // when there are any, 0 when the scenario lints clean.
    if let Some(validate_file) = validate_path {
        if positional.is_some() {
            eprintln!("{}", kshana::t!("main-error-validate-lints-one-scenario"));
            return ExitCode::from(2);
        }
        let src = match std::fs::read_to_string(&validate_file) {
            Ok(s) => s,
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-cannot-read",
                        validate_file = validate_file.display(),
                        e = e
                    )
                );
                return ExitCode::FAILURE;
            }
        };
        let violations = kshana::api::validate_scenario(&src);
        if violations.is_empty() {
            // Name what passed AND what was never looked at. The lint resolves the kind
            // and checks that the kind's published required top-level fields are
            // present; it does not check any field's VALUE, so `time.step_s = -10` lints
            // clean here and then fails the run. Silence was the only success signal
            // before, which reads as a full check.
            let kind = kshana::api::ScenarioKind::classify(&src)
                .map(|k| k.as_str())
                .unwrap_or("scenario");
            // For about two thirds of the catalogue the kind publishes NO required field:
            // the pack runs its reference configuration from an empty body. "ok" is true
            // there too, but it must not read as though fields were checked when there were
            // none to check — say which of the two the caller got.
            let n_required = kshana::api::list_scenario_kinds()
                .into_iter()
                .find(|m| m.name == kind)
                .map(|m| m.required_fields.len())
                .unwrap_or(0);
            if n_required == 0 {
                println!(
                    "{}",
                    kshana::t!("main-ok-kind-resolves-this-kind", kind = kind)
                );
            } else {
                println!(
                    "{}",
                    kshana::t!(
                        "main-ok-kind-resolves-and-all",
                        kind = kind,
                        n_required = n_required
                    )
                );
            }
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
            eprintln!("{}", kshana::t!("main-error-study-runs-suite-do"));
            return ExitCode::from(2);
        }
        // `--study-name` is a single-scenario flag: it slugs the output name and stamps
        // StudyMeta into the result JSON. A study takes its title from the manifest's
        // `title =` instead, and run_study never reads this variable. Say the flag was
        // dropped rather than dropping it in silence.
        if study_name.is_some() {
            eprintln!("{}", kshana::t!("main-warning-study-name-is-ignored"));
        }
        return run_study(&suite_path);
    }

    let Some(scenario_arg) = positional else {
        eprintln!("{USAGE}");
        return ExitCode::from(2);
    };
    let path = PathBuf::from(&scenario_arg);
    let mut src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::t!("main-error-cannot-read-2", path = path.display(), e = e)
            );
            // A registry install has no scenarios/ directory; say where one comes from.
            if e.kind() == std::io::ErrorKind::NotFound {
                eprintln!("{}", kshana::t!("main-hint-kshana-example-lists-the"));
            }
            return ExitCode::FAILURE;
        }
    };

    // The scenario file's exact bytes, before any `--eop` injection: the report's
    // reproducibility record digests these, because they are what a reader re-runs.
    let scenario_src = src.clone();
    let mut report_extra_args: Vec<String> = Vec::new();
    let mut report_input_files: Vec<(String, String)> = Vec::new();

    // `--eop <finals2000A>`: inline a real IERS Earth-orientation file into the
    // scenario so the ephemeris ground track is reduced through real UT1/pole rather
    // than the nominal scalars. The data travels in the scenario, keeping the run
    // reproducible from the (now self-contained) TOML alone.
    if let Some(eop_file) = &eop_path {
        let body = match std::fs::read_to_string(eop_file) {
            Ok(b) => b,
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-cannot-read-3",
                        eop_file = eop_file.display(),
                        e = e
                    )
                );
                return ExitCode::FAILURE;
            }
        };
        let eop_arg = eop_file.display().to_string();
        report_extra_args.push("--eop".to_string());
        report_extra_args.push(eop_arg.clone());
        report_input_files.push((
            eop_arg,
            kshana::advanced_report::sha256_hex(body.as_bytes()),
        ));
        match kshana::api::inject_eop(&src, &body) {
            Ok(merged) => src = merged,
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-eop", e = e));
                return ExitCode::FAILURE;
            }
        }
    }
    // `--import-route <route.geojson>`: write a GeoJSON LineString into the scenario's
    // straight-track inputs before the run, so the run and every export use it.
    if let Some(route_file) = &route_path {
        let body = match std::fs::read_to_string(route_file) {
            Ok(b) => b,
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-cannot-read-4",
                        route_file = route_file.display(),
                        e = e
                    )
                );
                return ExitCode::FAILURE;
            }
        };
        match kshana::interop::geojson::apply_route(&src, &body) {
            Ok(merged) => src = merged,
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-import-route", e = e));
                return ExitCode::FAILURE;
            }
        }
    }

    // Resolve the `--export` requests before the run, so a misspelt format fails fast.
    let mut export_all = false;
    let mut export_formats: Vec<kshana::interop::Format> = Vec::new();
    for f in &exports {
        match f.to_ascii_lowercase().as_str() {
            "all" => export_all = true,
            "list" => {
                // Terminal: report which formats apply and why the others do not.
                for (fmt, r) in kshana::interop::plan(&src) {
                    match r {
                        Ok(()) => println!("{}: applies", fmt.as_str()),
                        Err(why) => println!(
                            "{}",
                            kshana::t!("main-does-not-apply", fmt = fmt.as_str(), why = why)
                        ),
                    }
                }
                return ExitCode::SUCCESS;
            }
            other => match kshana::interop::Format::parse(other) {
                Ok(fmt) => {
                    if !export_formats.contains(&fmt) {
                        export_formats.push(fmt)
                    }
                }
                Err(e) => {
                    eprintln!("{}", kshana::t!("main-error-export", e = e));
                    return ExitCode::from(2);
                }
            },
        }
    }

    // The result files come from an English run whatever the language; the language is for the
    // summary, the chart text and the messages (kshana::api::run_toml_lang).
    let lang = kshana::i18n::current();
    kshana::i18n::set_default(kshana::i18n::Lang::english());
    let ran = kshana::api::run_toml_bilingual(&src, lang.tag());
    kshana::i18n::set_default(lang);
    let (mut out, human) = match ran {
        Ok(o) => o,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::i18n::error_report(&kshana::t!("main-fail", e = e))
            );
            return ExitCode::FAILURE;
        }
    };

    // `--study-name <s>`: stamp additive study metadata (title + a UTC generation
    // time, the only clock read in the crate) into the result JSON, and name the
    // output files after a slug of the study instead of the scenario path stem. With
    // no `--study-name`, nothing below runs and the output stays byte-identical.
    let output_base: PathBuf = match &study_name {
        Some(name) => {
            report_extra_args.push("--study-name".to_string());
            report_extra_args.push(name.clone());
            let meta = kshana::report::study_meta_with_title(name, &utc_iso8601_now());
            out.json = kshana::api::with_study_meta(&out.json, &meta);
            // Write the study-named outputs in the scenario file's directory.
            let dir = path.parent().unwrap_or_else(|| std::path::Path::new("."));
            dir.join(kshana::report::slugify(name))
        }
        None => path.clone(),
    };

    // `--animate`: render every requested format from the run's own result before
    // anything is written, so a kind with no time series fails without leaving a
    // half-written set of outputs. The result JSON then gains an `animation` block
    // naming what was drawn; without `--animate` it stays byte-identical.
    let mut animations: Vec<(PathBuf, kshana::animation::Animation)> = Vec::new();
    if !animate_formats.is_empty() {
        let kind = kshana::api::ScenarioKind::classify(&src)
            .map(|k| k.as_str().to_string())
            .ok();
        let mut written: Vec<String> = Vec::new();
        for f in &animate_formats {
            match kshana::animation::animate_result(&out.json, kind.as_deref(), *f, &animate_opts) {
                Ok(a) => {
                    let target = match f {
                        kshana::animation::AnimationFormat::Svg => {
                            output_base.with_extension("animation.svg")
                        }
                        kshana::animation::AnimationFormat::Html => {
                            output_base.with_extension("animation.html")
                        }
                        kshana::animation::AnimationFormat::Frames => {
                            output_base.with_extension("frames")
                        }
                    };
                    written.push(
                        target
                            .file_name()
                            .map(|n| n.to_string_lossy().into_owned())
                            .unwrap_or_default(),
                    );
                    animations.push((target, a));
                }
                Err(e) => {
                    eprintln!(
                        "{}",
                        kshana::t!("main-error-animate-2", f = f.as_str(), e = e)
                    );
                    return ExitCode::FAILURE;
                }
            }
        }
        match kshana::animation::animation_meta(
            &out.json,
            kind.as_deref(),
            &animate_formats,
            &animate_opts,
            &written,
        ) {
            Ok(meta) => out.json = kshana::animation::with_animation_meta(&out.json, &meta),
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-animate", e = e));
                return ExitCode::FAILURE;
            }
        }
    }

    // Interoperability exports (`--export`): CZML, KML, GeoJSON, STK `.e` and SigMF. They
    // are rendered here, before anything is written, so the report and the animation
    // player can name the files; they are written after the other outputs. An explicitly
    // named format that does not apply is an error that names the reason; under `all` it
    // is reported and skipped.
    let mut export_outputs: Vec<(PathBuf, Vec<u8>, String)> = Vec::new();
    let mut export_skipped: Vec<String> = Vec::new();
    let mut export_errors: Vec<String> = Vec::new();
    let requested: Vec<(kshana::interop::Format, bool)> = if export_all {
        kshana::interop::Format::ALL
            .iter()
            .map(|&f| (f, false))
            .collect()
    } else {
        export_formats.iter().map(|&f| (f, true)).collect()
    };
    for (fmt, explicit) in requested {
        match kshana::interop::export(&src, fmt) {
            Ok(files) => {
                for f in files {
                    let target = output_base.with_extension(f.suffix.trim_start_matches('.'));
                    export_outputs.push((target, f.bytes, fmt.as_str().to_string()));
                }
            }
            Err(kshana::interop::ExportError::NotApplicable(why)) if !explicit => {
                export_skipped.push(format!("skipped {}: {why}", fmt.as_str()));
            }
            Err(e) => {
                export_errors.push(kshana::t!("main-error-export-2", fmt = fmt.as_str(), e = e))
            }
        }
    }
    let base_name = |p: &std::path::Path| {
        p.file_name()
            .map(|n| n.to_string_lossy().into_owned())
            .unwrap_or_default()
    };
    let export_files: Vec<(String, String)> = export_outputs
        .iter()
        .map(|(t, _, f)| (f.clone(), base_name(t)))
        .collect();
    let animation_files: Vec<String> = animations.iter().map(|(t, _)| base_name(t)).collect();
    // The HTML player offers the export files written beside it.
    if !export_files.is_empty() {
        for (_, anim) in animations.iter_mut() {
            if anim.format == kshana::animation::AnimationFormat::Html {
                for f in anim.files.iter_mut() {
                    f.content = kshana::animation::with_companion_links(&f.content, &export_files);
                }
            }
        }
    }

    let json_path = output_base.with_extension("result.json");
    if let Err(e) = std::fs::write(&json_path, &out.json) {
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write",
                json_path = json_path.display(),
                e = e
            )
        );
        return ExitCode::FAILURE;
    }
    let svg_path = output_base.with_extension("chart.svg");
    if let Err(e) = std::fs::write(&svg_path, human.as_ref().map_or(&out.svg, |h| &h.svg)) {
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write-2",
                svg_path = svg_path.display(),
                e = e
            )
        );
        return ExitCode::FAILURE;
    }
    // The advanced report: report.html (printable) and report.json (the same content,
    // machine-readable). Both are pure functions of the run, the scenario bytes and the
    // invocation, so a re-run writes them byte for byte.
    let html_path = output_base.with_extension("report.html");
    let report_json_path = output_base.with_extension("report.json");
    let file_name =
        |p: &std::path::Path| p.file_name().and_then(|n| n.to_str()).map(str::to_string);
    let invocation = kshana::advanced_report::Invocation {
        scenario_arg: scenario_arg.clone(),
        extra_args: report_extra_args,
        input_files: report_input_files,
        result_file: file_name(&json_path),
        chart_file: file_name(&svg_path),
        animation_files,
        export_files,
    };
    // report.json is a machine file and is built in English; report.html is built in the language.
    let report = match kshana::i18n::with_lang(kshana::i18n::Lang::english(), || {
        kshana::advanced_report::build(&out, &scenario_src, &invocation)
    }) {
        Ok(r) => r,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::t!("main-error-cannot-build-the-report", e = e)
            );
            return ExitCode::FAILURE;
        }
    };
    let html = match &human {
        None => report.to_html(&out.svg),
        Some(h) => {
            let shown = kshana::api::RunOutput {
                json: out.json.clone(),
                svg: h.svg.clone(),
                summary: h.summary.clone(),
                csv: out.csv.clone(),
            };
            match kshana::advanced_report::build(&shown, &scenario_src, &invocation) {
                Ok(r) => r.to_html(&shown.svg),
                Err(_) => report.to_html(&out.svg),
            }
        }
    };
    if let Err(e) = std::fs::write(&html_path, html) {
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write-3",
                html_path = html_path.display(),
                e = e
            )
        );
        return ExitCode::FAILURE;
    }
    if let Err(e) = std::fs::write(&report_json_path, report.to_json()) {
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write-4",
                report_json_path = report_json_path.display(),
                e = e
            )
        );
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
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-write-5",
                    csv_path = csv_path.display(),
                    e = e
                )
            );
            return ExitCode::FAILURE;
        }
    }
    println!("{}", human.as_ref().map_or(&out.summary, |h| &h.summary));
    if wrote_csv {
        println!(
            "{}",
            kshana::t!(
                "main-wrote-and",
                json_path = json_path.display(),
                svg_path = svg_path.display(),
                html_path = html_path.display(),
                report_json_path = report_json_path.display(),
                csv_path = csv_path.display()
            )
        );
    } else {
        println!(
            "{}",
            kshana::t!(
                "main-wrote-and-2",
                json_path = json_path.display(),
                svg_path = svg_path.display(),
                html_path = html_path.display(),
                report_json_path = report_json_path.display()
            )
        );
    }

    for (target, anim) in &animations {
        match write_animation(target, anim) {
            Ok(()) => println!("wrote {}", target.display()),
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-cannot-write-6",
                        target = target.display(),
                        e = e
                    )
                );
                return ExitCode::FAILURE;
            }
        }
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
                    eprintln!(
                        "{}",
                        kshana::t!(
                            "main-error-cannot-write-7",
                            sp3_path = sp3_path.display(),
                            e = e
                        )
                    );
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", sp3_path.display());
            }
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-sp3-export-failed", e = e));
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
                    eprintln!(
                        "{}",
                        kshana::t!(
                            "main-error-cannot-write-8",
                            omm_path = omm_path.display(),
                            e = e
                        )
                    );
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", omm_path.display());
            }
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-omm-export-failed", e = e));
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
                    eprintln!(
                        "{}",
                        kshana::t!(
                            "main-error-cannot-write-9",
                            oem_path = oem_path.display(),
                            e = e
                        )
                    );
                    return ExitCode::FAILURE;
                }
                println!("wrote {}", oem_path.display());
            }
            Err(e) => {
                eprintln!("{}", kshana::t!("main-error-oem-export-failed", e = e));
                return ExitCode::FAILURE;
            }
        }
    }
    // Interoperability exports, rendered above, are written last.
    for (target, bytes, _) in &export_outputs {
        if let Err(e) = std::fs::write(target, bytes) {
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-write-6",
                    target = target.display(),
                    e = e
                )
            );
            return ExitCode::FAILURE;
        }
        println!("wrote {}", target.display());
    }
    for m in &export_skipped {
        println!("{m}");
    }
    for m in &export_errors {
        eprintln!("{m}");
    }
    if !export_errors.is_empty() {
        return ExitCode::FAILURE;
    }
    ExitCode::SUCCESS
}

/// Write one animation export: a single file for `svg` and `html`, or a directory of
/// numbered frames plus `manifest.json` for `frames`.
fn write_animation(
    target: &std::path::Path,
    anim: &kshana::animation::Animation,
) -> std::io::Result<()> {
    match anim.format {
        kshana::animation::AnimationFormat::Frames => {
            std::fs::create_dir_all(target)?;
            // A shorter re-export must not leave frames of an earlier one behind: a
            // `frame_%04d.svg` encoder reads on through every contiguous number, so a
            // stale tail would play after the new frames. Only frame files are removed.
            for entry in std::fs::read_dir(target)? {
                let entry = entry?;
                let name = entry.file_name();
                let name = name.to_string_lossy();
                let is_frame = name.len() == "frame_0000.svg".len()
                    && name.starts_with("frame_")
                    && name.ends_with(".svg")
                    && name[6..10].bytes().all(|b| b.is_ascii_digit());
                if is_frame && entry.file_type()?.is_file() {
                    std::fs::remove_file(entry.path())?;
                }
            }
            for f in &anim.files {
                std::fs::write(target.join(&f.name), &f.content)?;
            }
            Ok(())
        }
        _ => match anim.files.first() {
            Some(f) => std::fs::write(target, &f.content),
            None => Ok(()),
        },
    }
}

/// `kshana kinds [--json]`: list the built-in scenario kinds.
///
/// The engine's unknown-kind error has always said "`kshana kinds` lists all N
/// built-in kinds" while no such subcommand existed, so the one remediation the CLI
/// printed could not be followed. Plain output is one kind name per line, which is
/// what that sentence promises and is greppable; `--json` emits the same
/// [`kshana::api::list_scenario_kinds_json`] metadata the Python, WASM and MCP faces
/// already serve, so every surface lists from one source.
fn print_kinds(rest: &[String]) -> ExitCode {
    match rest {
        [] => {
            for meta in kshana::api::list_scenario_kinds() {
                println!("{}", meta.name);
            }
            ExitCode::SUCCESS
        }
        [flag] if flag == "--json" => {
            println!("{}", kshana::api::list_scenario_kinds_json());
            ExitCode::SUCCESS
        }
        [other, ..] => {
            eprintln!(
                "{}",
                kshana::t!("main-error-unexpected-argument-after-kinds", other = other)
            );
            ExitCode::from(2)
        }
    }
}

/// `kshana example [<name>]`: print a bundled reference scenario to stdout, or, with no
/// name, list the bundled names one per line.
///
/// Every quickstart needs a scenario file, and a registry install ships none, so
/// `kshana example clock-holdover > clock-holdover.toml` is the first command a new user
/// types. The listing goes to stdout and its explanatory lines to stderr, so
/// `kshana example | while read n; do …` sees names only.
fn print_example(rest: &[String]) -> ExitCode {
    match rest {
        [] => {
            eprintln!(
                "{}",
                kshana::t!(
                    "main-bundled-reference-scenarios-write-one",
                    v1 = bundled_scenarios::BUNDLED.len()
                )
            );
            for (name, _) in bundled_scenarios::BUNDLED {
                println!("{name}");
            }
            for (name, _) in bundled_scenarios::REPO_ONLY {
                eprintln!(
                    "{}",
                    kshana::t!("main-not-bundled-run-kshana-example", name = name)
                );
            }
            ExitCode::SUCCESS
        }
        [name] => {
            if let Some(toml) = bundled_scenarios::get(name) {
                print!("{toml}");
                return ExitCode::SUCCESS;
            }
            if let Some(why) = bundled_scenarios::repo_only_reason(name) {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-is-not-bundled-it", name = name, why = why)
                );
                return ExitCode::from(2);
            }
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-no-bundled-scenario-named",
                    name = name,
                    v1 = bundled_scenarios::BUNDLED.len()
                )
            );
            ExitCode::from(2)
        }
        [_, extra, ..] => {
            eprintln!(
                "error: unexpected argument '{extra}' after `example <name>`; it takes one name"
            );
            ExitCode::from(2)
        }
    }
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
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-read-5",
                    suite_path = suite_path.display(),
                    e = e
                )
            );
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
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write",
                json_path = json_path.display(),
                e = e
            )
        );
        return ExitCode::FAILURE;
    }
    let html_path = base.with_extension("study.html");
    if let Err(e) = std::fs::write(&html_path, &out.html) {
        eprintln!(
            "{}",
            kshana::t!(
                "main-error-cannot-write-3",
                html_path = html_path.display(),
                e = e
            )
        );
        return ExitCode::FAILURE;
    }
    println!("{}", out.summary);
    println!(
        "{}",
        kshana::t!(
            "main-wrote-and-3",
            json_path = json_path.display(),
            html_path = html_path.display()
        )
    );
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

/// `kshana bench-export <scenario.toml> [--out <base>] [--epoch <YYYY-MM-DDTHH:MM:SS>]`:
/// write the test-bench files (`<base>.motion.csv`, `.nmea`, `.events.csv`, ...). The
/// default base is the scenario path without its extension; the default epoch is
/// 2024-01-01T00:00:00Z.
/// `kshana imu-fit`: print the `[accel_classical]` table (or `--json` the whole report).
fn run_imu_fit_cli(args: &[String]) -> ExitCode {
    let (mut path, mut format, mut axis, mut id) = (
        None,
        "csv".to_string(),
        "x".to_string(),
        "imu-fit".to_string(),
    );
    let (mut mean, mut json) = (0.0f64, false);
    let mut i = 0;
    while i < args.len() {
        let a = args[i].as_str();
        let needs = matches!(a, "--format" | "--axis" | "--expected-mean" | "--id");
        if needs && i + 1 >= args.len() {
            eprintln!("{}", kshana::t!("main-error-needs-value", a = a));
            return ExitCode::from(2);
        }
        match a {
            "--format" => format = args[i + 1].clone(),
            "--axis" => axis = args[i + 1].clone(),
            "--id" => id = args[i + 1].clone(),
            "--expected-mean" => match args[i + 1].parse() {
                Ok(v) => mean = v,
                Err(_) => {
                    eprintln!("{}", kshana::t!("main-error-expected-mean-needs-number"));
                    return ExitCode::from(2);
                }
            },
            "--json" => json = true,
            x if x.starts_with("--") => {
                eprintln!("{}", kshana::t!("main-error-unknown-imu-fit-option", x = x));
                return ExitCode::from(2);
            }
            x => path = Some(PathBuf::from(x)),
        }
        i += if needs { 2 } else { 1 };
    }
    let Some(path) = path else {
        eprintln!("{}", kshana::t!("main-error-imu-fit-needs-an"));
        return ExitCode::from(2);
    };
    let text = match std::fs::read_to_string(&path) {
        Ok(t) => t,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::t!("main-error-cannot-read-2", path = path.display(), e = e)
            );
            return ExitCode::from(1);
        }
    };
    match kshana::surface::imu_fit(
        &text,
        &format,
        &axis,
        mean,
        &id,
        kshana::surface::MAX_INPUT_BYTES,
    ) {
        Ok(out) if json => {
            println!("{out}");
            ExitCode::SUCCESS
        }
        Ok(out) => {
            let v: serde_json::Value = serde_json::from_str(&out).unwrap_or_default();
            print!("{}", v["toml"].as_str().unwrap_or_default());
            for n in v["fit"]["notes"].as_array().into_iter().flatten() {
                eprintln!("note: {}", n.as_str().unwrap_or_default());
            }
            ExitCode::SUCCESS
        }
        Err(e) => {
            eprintln!("error: {e}");
            ExitCode::from(1)
        }
    }
}

fn run_bench_export_cli(args: &[String]) -> ExitCode {
    let mut path: Option<PathBuf> = None;
    let mut out: Option<String> = None;
    let mut epoch: Option<kshana::interop::UtcEpoch> = None;
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--out" | "--epoch" if i + 1 >= args.len() => {
                eprintln!("{}", kshana::t!("main-error-needs-value-2", args = args[i]));
                return ExitCode::from(2);
            }
            "--out" => {
                out = Some(args[i + 1].clone());
                i += 1;
            }
            "--epoch" => {
                // YYYY-MM-DDTHH:MM:SS[Z], UTC, every field range-checked.
                match kshana::interop::UtcEpoch::parse_iso(&args[i + 1]) {
                    Ok(e) => epoch = Some(e),
                    Err(e) => {
                        eprintln!("{}", kshana::t!("main-error-epoch", e = e));
                        return ExitCode::from(2);
                    }
                }
                i += 1;
            }
            a if a.starts_with("--") => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-unknown-bench-export-option", a = a)
                );
                return ExitCode::from(2);
            }
            a => path = Some(PathBuf::from(a)),
        }
        i += 1;
    }
    let Some(path) = path else {
        eprintln!("{}", kshana::t!("main-error-bench-export-needs-scenario"));
        return ExitCode::from(2);
    };
    let src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::t!("main-error-cannot-read-2", path = path.display(), e = e)
            );
            return ExitCode::from(2);
        }
    };
    let (files, notes) = match kshana::interop::testbench::export_with_notes(&src, epoch) {
        Ok(f) => f,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };
    let base = out.unwrap_or_else(|| path.with_extension("").display().to_string());
    for f in files {
        let target = PathBuf::from(format!("{base}{}", f.suffix));
        if let Err(e) = std::fs::write(&target, &f.bytes) {
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-write-6",
                    target = target.display(),
                    e = e
                )
            );
            return ExitCode::FAILURE;
        }
        println!("wrote {}", target.display());
    }
    for n in notes {
        eprintln!("note: {n}");
    }
    ExitCode::SUCCESS
}

const SKY_USAGE: &str =
    "usage: kshana sky <request.json|request.toml> [--monte-carlo <n> --seed <s>] [--svg]
   or: kshana sky --site <lat,lon[,height_m]> (--systems <preset,...> | --tle <file>)
                  [--epoch <YYYY-MM-DDTHH:MM:SSZ>] [--tle-system <label>] [--time <s>]
                  [--mask <deg>] [--skyline-preset <name>] [--uere <m>]
                  [--clock per-system|common] [--monte-carlo <n> --seed <s>] [--svg]

Prints the satellites the site sees under the skyline, their DOP, the east-north-up cofactor
and covariance and the horizontal error ellipse as JSON (sky_geometry); with --monte-carlo,
n (at most 5000) seeded least-squares errors (sky_monte_carlo); with --svg, the skyplot.
Systems are engine presets (gps-baseline, galileo, beidou-meo, glonass, xona-pulsar, ...):
a representative geometry, not the sky of a date at a place. --tle reads two-line element
sets (at most 4 MiB) and propagates them by SGP4 to --epoch (UTC) plus --time: the sky those
element sets give at that epoch, not a measurement. Without --epoch they go to the newest
element set's epoch, a representative sky. MODELLED; docs/SKYLINE.md.";

const SKYLINE_USAGE: &str = "usage: kshana skyline --preset <name> [--json]
   or: kshana skyline --presets
   or: kshana skyline --profile <skyline.json|skyline.toml>

Prints a skyline preset (city-street, harbour-approach, fjord, container-terminal) with its
provenance and the cut every degree of azimuth, the list of presets, or a skyline section
reduced to the 360-entry table the engine uses. REPRESENTATIVE presets; docs/SKYLINE.md.";

fn print_or_fail(out: Result<String, String>) -> ExitCode {
    match out {
        Ok(text) => {
            println!("{text}");
            ExitCode::SUCCESS
        }
        Err(e) => {
            eprintln!("error: {e}");
            ExitCode::FAILURE
        }
    }
}

/// `kshana sky`: the sky-geometry functions on a request file or on flags.
fn run_sky_cli(args: &[String]) -> ExitCode {
    let mut path: Option<PathBuf> = None;
    let mut req = serde_json::Map::new();
    let mut mc: Option<usize> = None;
    let mut seed: u64 = 0;
    let mut svg = false;
    let mut i = 0;
    let usage_err = |e: String| {
        eprintln!("error: {e}\n{SKY_USAGE}");
        ExitCode::from(2)
    };
    while i < args.len() {
        let a = args[i].as_str();
        let val = || {
            args.get(i + 1)
                .cloned()
                .ok_or(kshana::t!("main-needs-value", a = a))
        };
        let num = |v: Result<String, String>| -> Result<f64, String> {
            v?.parse::<f64>().map_err(|e| format!("{a}: {e}"))
        };
        match a {
            "--help" | "-h" => {
                println!("{SKY_USAGE}");
                return ExitCode::SUCCESS;
            }
            "--svg" => svg = true,
            "--json" => {}
            "--site" => {
                let v = match val() {
                    Ok(v) => v,
                    Err(e) => return usage_err(e),
                };
                let parts: Result<Vec<f64>, _> =
                    v.split(',').map(|p| p.trim().parse::<f64>()).collect();
                match parts {
                    Ok(p) if p.len() == 2 || p.len() == 3 => {
                        req.insert(
                            "site".into(),
                            serde_json::json!({"lat_deg": p[0], "lon_deg": p[1], "height_m": p.get(2).copied().unwrap_or(0.0)}),
                        );
                    }
                    _ => return usage_err(kshana::t!("main-site-takes-lat-lon-height", v = v)),
                }
                i += 1;
            }
            "--systems" => {
                let v = match val() {
                    Ok(v) => v,
                    Err(e) => return usage_err(e),
                };
                let list: Vec<serde_json::Value> = v
                    .split(',')
                    .filter(|p| !p.trim().is_empty())
                    .map(|p| serde_json::Value::String(p.trim().to_string()))
                    .collect();
                req.insert("systems".into(), serde_json::Value::Array(list));
                i += 1;
            }
            "--time" | "--mask" | "--uere" => {
                let key = match a {
                    "--time" => "time_s",
                    "--mask" => "mask_deg",
                    _ => "sigma_uere_m",
                };
                match num(val()) {
                    Ok(x) => {
                        req.insert(key.into(), serde_json::json!(x));
                    }
                    Err(e) => return usage_err(e),
                }
                i += 1;
            }
            "--skyline-preset" => {
                match val() {
                    Ok(v) => {
                        req.insert("skyline".into(), serde_json::json!({ "preset": v }));
                    }
                    Err(e) => return usage_err(e),
                }
                i += 1;
            }
            "--clock" | "--epoch" | "--tle-system" => {
                let key = match a {
                    "--clock" => "clock",
                    "--epoch" => "epoch",
                    _ => "tle_system",
                };
                match val() {
                    Ok(v) => {
                        req.insert(key.into(), serde_json::Value::String(v));
                    }
                    Err(e) => return usage_err(e),
                }
                i += 1;
            }
            "--tle" => {
                let p = match val() {
                    Ok(v) => v,
                    Err(e) => return usage_err(e),
                };
                let cap = kshana::geometry::MAX_TLE_BYTES as u64;
                match std::fs::metadata(&p) {
                    Ok(m) if m.len() > cap => {
                        eprintln!(
                            "{}",
                            kshana::t!(
                                "main-error-is-bytes-the-tle",
                                p = p,
                                m = m.len(),
                                cap = cap
                            )
                        );
                        return ExitCode::FAILURE;
                    }
                    Ok(_) => {}
                    Err(e) => {
                        eprintln!("{}", kshana::t!("main-error-cannot-read-6", p = p, e = e));
                        return ExitCode::FAILURE;
                    }
                }
                match std::fs::read_to_string(&p) {
                    Ok(t) => {
                        req.insert("tle".into(), serde_json::Value::String(t));
                    }
                    Err(e) => {
                        eprintln!("{}", kshana::t!("main-error-cannot-read-6", p = p, e = e));
                        return ExitCode::FAILURE;
                    }
                }
                i += 1;
            }
            "--monte-carlo" => {
                match val().and_then(|v| {
                    v.parse::<usize>()
                        .map_err(|e| kshana::terr!("e-main-monte-carlo", e = e))
                }) {
                    Ok(n) => mc = Some(n),
                    Err(e) => return usage_err(e),
                }
                i += 1;
            }
            "--seed" => {
                match val().and_then(|v| {
                    v.parse::<u64>()
                        .map_err(|e| kshana::terr!("e-main-seed", e = e))
                }) {
                    Ok(s) => seed = s,
                    Err(e) => return usage_err(e),
                }
                i += 1;
            }
            a if a.starts_with("--") => {
                return usage_err(kshana::t!("main-unknown-sky-option", a = a))
            }
            a => path = Some(PathBuf::from(a)),
        }
        i += 1;
    }
    let text = match (path, req.is_empty()) {
        (Some(p), true) => match std::fs::read_to_string(&p) {
            Ok(t) => t,
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-cannot-read-6", p = p.display(), e = e)
                );
                return ExitCode::FAILURE;
            }
        },
        (None, false) => serde_json::Value::Object(req).to_string(),
        (Some(_), false) => return usage_err("give a request file or flags, not both".into()),
        (None, true) => return usage_err("no request".into()),
    };
    let max = kshana::surface::MAX_INPUT_BYTES;
    print_or_fail(match (mc, svg) {
        (Some(n), false) => kshana::surface::sky_monte_carlo(&text, seed, n, max),
        (None, true) => kshana::surface::skyplot_svg(&text, max),
        (None, false) => kshana::surface::sky_geometry(&text, max),
        (Some(_), true) => Err(kshana::terr!("e-main-svg-and-monte-carlo-are")),
    })
}

/// `kshana skyline`: the skyline presets and profiles.
fn run_skyline_cli(args: &[String]) -> ExitCode {
    match args.first().map(String::as_str) {
        Some("--help" | "-h") => {
            println!("{SKYLINE_USAGE}");
            ExitCode::SUCCESS
        }
        Some("--presets") => print_or_fail(Ok(kshana::surface::skyline_presets())),
        Some("--preset") => match args.get(1).filter(|a| !a.starts_with("--")) {
            // The document is machine output: English in every language.
            Some(name) => print_or_fail(kshana::i18n::in_english_or_localised_error(|| {
                kshana::geometry::skyline_profile(&kshana::skyline::SkylineCfg {
                    preset: Some(name.clone()),
                    ..Default::default()
                })
                .and_then(|p| {
                    let info = kshana::skyline::preset(name)?;
                    serde_json::to_string_pretty(&serde_json::json!({
                        "name": info.name,
                        "label": kshana::skyline::PRESET_LABEL,
                        "description": info.description,
                        "provenance": info.provenance,
                        "table": p.table,
                        "open_fraction": p.open_fraction,
                    }))
                    .map_err(|e| e.to_string())
                })
            })),
            None => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-preset-needs-name",
                        SKYLINE_USAGE = SKYLINE_USAGE
                    )
                );
                ExitCode::from(2)
            }
        },
        Some("--profile") => match args.get(1) {
            Some(p) => match std::fs::read_to_string(p) {
                Ok(text) => print_or_fail(kshana::surface::skyline_profile(
                    &text,
                    kshana::surface::MAX_INPUT_BYTES,
                )),
                Err(e) => {
                    eprintln!("{}", kshana::t!("main-error-cannot-read-6", p = p, e = e));
                    ExitCode::FAILURE
                }
            },
            None => {
                eprintln!(
                    "{}",
                    kshana::t!(
                        "main-error-profile-needs-file",
                        SKYLINE_USAGE = SKYLINE_USAGE
                    )
                );
                ExitCode::from(2)
            }
        },
        _ => {
            eprintln!("{SKYLINE_USAGE}");
            ExitCode::from(2)
        }
    }
}

const LUNANET_AFS_USAGE: &str = "usage: kshana lunanet-afs-check spec [--json] [--strict]
   or: kshana lunanet-afs-check symbols <file> [--max-sp-errors <n>] [--json]
   or: kshana lunanet-afs-check generate --frames <n> [--toi0 <t>] --out <file>

Pinned to LunaNet Interoperability Specification V5, Applicable Document 1 Volume A (LSIS-AFS
V1.0, 29 January 2025). `spec` checks this implementation against the document's printed code
tables and worked examples (bars B1 to B10 of xval/lunanet-afs/PREREGISTRATION.md; with --strict
the exit status is 1 unless every bar is met). `symbols` checks a hard-decision symbol stream
(text of 0 and 1) for the synchronisation pattern, SB1 decoding, FID, TOI continuity and frame
spacing; subframes 2 to 4 (LDPC, CRC-24Q) are NOT verified. `generate` writes a test stream of
symbols with placeholder subframes; it is not a waveform, and Kshana writes no signal. To
acquire or track the AFS waveform in a recording use `kshana iq acquire --signal lunanet-afs-i`
(or lunanet-afs-q). Advisory only. docs/LUNANET-AFS.md.";

/// `kshana lunanet-afs-check <spec|symbols|generate>`.
fn run_lunanet_afs_cli(args: &[String]) -> ExitCode {
    let fail = |m: &str| {
        eprintln!("error: {m}\n{LUNANET_AFS_USAGE}");
        ExitCode::from(2)
    };
    let flag = |name: &str| -> Result<Option<String>, String> {
        match args.iter().position(|a| a == name) {
            None => Ok(None),
            Some(i) => args
                .get(i + 1)
                .cloned()
                .map(Some)
                .ok_or_else(|| kshana::terr!("e-evidence-cli-needs-value", name = name)),
        }
    };
    match args.first().map(String::as_str) {
        Some("--help" | "-h" | "help") => {
            println!("{LUNANET_AFS_USAGE}");
            ExitCode::SUCCESS
        }
        Some("spec") => {
            let r = kshana::surface::lunanet_afs_check_spec();
            if args.iter().any(|a| a == "--json") {
                println!("{}", serde_json::to_string_pretty(&r).unwrap_or_default());
            } else {
                println!("{}", r["specification"].as_str().unwrap_or(""));
                for b in r["bars"].as_array().into_iter().flatten() {
                    println!(
                        "{:<4} {:<7} {}/{}  {}",
                        b["bar"].as_str().unwrap_or(""),
                        b["status"].as_str().unwrap_or(""),
                        b["matched"],
                        b["total"],
                        b["claim"].as_str().unwrap_or("")
                    );
                    if let Some(n) = b["note"].as_str().filter(|n| !n.is_empty()) {
                        println!("       {n}");
                    }
                }
                println!("{}", r["advisory"].as_str().unwrap_or(""));
            }
            if args.iter().any(|a| a == "--strict") && r["all_met"] != true {
                return ExitCode::FAILURE;
            }
            ExitCode::SUCCESS
        }
        Some("symbols") => {
            let Some(path) = args.get(1).filter(|a| !a.starts_with("--")) else {
                return fail("symbols needs a file");
            };
            let max_err = match flag("--max-sp-errors") {
                Ok(v) => v.map_or(Ok(0), |v| v.parse::<usize>().map_err(|e| e.to_string())),
                Err(e) => Err(e),
            };
            let Ok(max_err) = max_err else {
                return fail("--max-sp-errors needs a whole number");
            };
            let text = match std::fs::read_to_string(path) {
                Ok(t) => t,
                Err(e) => {
                    return fail(&kshana::t!("iq-cli-labfit-cannot-read", path = path, e = e))
                }
            };
            match kshana::surface::lunanet_afs_check_symbols(
                &text,
                max_err,
                8 * kshana::surface::MAX_INPUT_BYTES,
            ) {
                Ok(r) => {
                    if args.iter().any(|a| a == "--json") {
                        println!("{}", serde_json::to_string_pretty(&r).unwrap_or_default());
                    } else {
                        println!(
                            "{}",
                            kshana::t!(
                                "main-symbols-frame-found",
                                r = r["symbols"],
                                r2 = r["frames_found"],
                                v3 = if r["ok"] == true {
                                    "no problems"
                                } else {
                                    "problems:"
                                }
                            )
                        );
                        for p in r["problems"].as_array().into_iter().flatten() {
                            println!("  {}", p.as_str().unwrap_or(""));
                        }
                        for f in r["frames"].as_array().into_iter().flatten() {
                            println!(
                                "{}",
                                kshana::t!(
                                    "main-frame-at-fid-toi-sb1",
                                    f = f["offset"],
                                    f2 = f["fid"],
                                    f3 = f["toi"],
                                    f4 = kshana::i18n::localise_decimal(format!(
                                        "{:.2}",
                                        f["sb1_metric"].as_f64().unwrap_or(0.0)
                                    )),
                                    f5 = f["sp_errors"],
                                    f6 = f["sb1_symbol_errors"]
                                )
                            );
                            for p in f["problems"].as_array().into_iter().flatten() {
                                println!("    {}", p.as_str().unwrap_or(""));
                            }
                        }
                        println!(
                            "{}",
                            kshana::t!(
                                "main-not-checked",
                                r = r["not_checked"].as_str().unwrap_or("")
                            )
                        );
                    }
                    if r["ok"] == true {
                        ExitCode::SUCCESS
                    } else {
                        ExitCode::FAILURE
                    }
                }
                Err(e) => fail(&e),
            }
        }
        Some("generate") => {
            let frames = match flag("--frames") {
                Ok(Some(v)) => v.parse::<usize>().ok(),
                _ => None,
            };
            let toi0 = match flag("--toi0") {
                Ok(Some(v)) => v.parse::<u8>().ok(),
                Ok(None) => Some(0),
                Err(_) => None,
            };
            let (Some(frames), Some(toi0), Ok(Some(out))) = (frames, toi0, flag("--out")) else {
                return fail(
                    "generate needs --frames <n> and --out <file> (and a whole-number --toi0)",
                );
            };
            match kshana::surface::lunanet_afs_generate(frames, toi0) {
                Ok(text) => match std::fs::write(&out, format!("{text}\n")) {
                    Ok(()) => {
                        println!(
                            "{}",
                            kshana::t!(
                                "main-wrote-frame-of-6000-symbols",
                                out = out,
                                frames = frames
                            )
                        );
                        ExitCode::SUCCESS
                    }
                    Err(e) => {
                        eprintln!(
                            "{}",
                            kshana::t!("main-error-cannot-write-10", out = out, e = e)
                        );
                        ExitCode::FAILURE
                    }
                },
                Err(e) => fail(&e),
            }
        }
        Some(other) => fail(&kshana::t!(
            "main-unknown-lunanet-afs-check-subcommand",
            other = other
        )),
        None => fail("lunanet-afs-check needs a subcommand"),
    }
}

const STANDARDS_PACK_USAGE: &str = "usage: kshana standards-pack list
   or: kshana standards-pack run <id> [--json] [--out <base>]
   or: kshana standards-pack rows <id>
   or: kshana standards-pack tests <id>

A standards pack is a set of scenarios scored against bars stated before the run, tied to the
compliance-report rows it supports evidence for. `run` prints a table (or --json) and, with
--out, writes <base>.pack.json and <base>.pack.md; give the JSON to `kshana compliance-report`
to see the rows. A test that needs a receiver log is listed as NEEDS INPUT and not scored.
MODELLED: a MET bar says a modelled scenario met a stated bar, not that any product meets a
requirement. docs/compliance/README.md.";

/// `kshana standards-pack <list|run|rows|tests>`.
fn run_standards_pack_cli(args: &[String]) -> ExitCode {
    let fail = |m: &str| {
        eprintln!("error: {m}\n{STANDARDS_PACK_USAGE}");
        ExitCode::from(2)
    };
    let Some(cmd) = args.first().map(String::as_str) else {
        return fail("standards-pack needs a subcommand");
    };
    match cmd {
        "--help" | "-h" | "help" => {
            println!("{STANDARDS_PACK_USAGE}");
            ExitCode::SUCCESS
        }
        "list" => {
            println!(
                "{}",
                serde_json::to_string_pretty(&kshana::standards_pack::list()).unwrap_or_default()
            );
            ExitCode::SUCCESS
        }
        "rows" | "tests" => {
            let Some(id) = args.get(1) else {
                return fail(&kshana::t!("main-needs-pack-id", cmd = cmd));
            };
            match kshana::standards_pack::load(id) {
                Ok(p) => {
                    print!(
                        "{}",
                        if cmd == "rows" {
                            kshana::standards_pack::rows_markdown(&p)
                        } else {
                            kshana::standards_pack::tests_markdown(&p)
                        }
                    );
                    ExitCode::SUCCESS
                }
                Err(e) => fail(&e),
            }
        }
        "run" => {
            let Some(id) = args.get(1) else {
                return fail("run needs a pack id");
            };
            let mut json = false;
            let mut out: Option<String> = None;
            let mut i = 2;
            while i < args.len() {
                match args[i].as_str() {
                    "--json" => json = true,
                    "--out" if i + 1 < args.len() => {
                        out = Some(args[i + 1].clone());
                        i += 1;
                    }
                    a => return fail(&kshana::t!("main-unknown-standards-pack-run-option", a = a)),
                }
                i += 1;
            }
            let report = match kshana::standards_pack::run(id) {
                Ok(r) => r,
                Err(e) => return fail(&e),
            };
            let text = serde_json::to_string_pretty(&report).unwrap_or_default();
            if let Some(base) = out {
                // The files are English in every language; the report printed below is in the language.
                let md =
                    kshana::i18n::in_english(|| kshana::standards_pack::report_markdown(&report));
                for (ext, body) in [(".pack.json", &text), (".pack.md", &md)] {
                    let target = format!("{base}{ext}");
                    if let Err(e) = std::fs::write(&target, body) {
                        eprintln!(
                            "{}",
                            kshana::t!("main-error-cannot-write-6", target = target, e = e)
                        );
                        return ExitCode::FAILURE;
                    }
                    println!("wrote {target}");
                }
            } else if json {
                println!("{text}");
            } else {
                print!("{}", kshana::standards_pack::report_markdown(&report));
            }
            ExitCode::SUCCESS
        }
        other => fail(&kshana::t!(
            "main-unknown-standards-pack-subcommand",
            other = other
        )),
    }
}

/// `kshana compliance-report [--out <base>] <result.json>...`: write `<base>.compliance.md`
/// and `<base>.compliance.json` (default base `compliance-report`). `--mapping` prints the
/// static mapping tables only, `--sources` the source documents.
fn run_compliance_report_cli(args: &[String]) -> ExitCode {
    use kshana::compliance::{self, mapping};
    let mut out = String::from("compliance-report");
    let mut paths: Vec<PathBuf> = Vec::new();
    let mut i = 0;
    while i < args.len() {
        match args[i].as_str() {
            "--mapping" => {
                println!("> {}\n", kshana::legal::text("legal-compliance-statement"));
                for fw in mapping::Framework::ALL {
                    println!("## {}\n\n{}", fw.title(), mapping::framework_table_md(fw));
                }
                return ExitCode::SUCCESS;
            }
            "--sources" => {
                println!("> {}\n", kshana::legal::text("legal-compliance-statement"));
                for fw in mapping::Framework::ALL {
                    println!("## {}\n\n{}", fw.title(), mapping::sources_md(fw));
                }
                return ExitCode::SUCCESS;
            }
            "--out" if i + 1 < args.len() => {
                out = args[i + 1].clone();
                i += 1;
            }
            "--out" => {
                eprintln!("{}", kshana::t!("main-error-out-needs-value"));
                return ExitCode::from(2);
            }
            a if a.starts_with("--") => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-unknown-compliance-report-option", a = a)
                );
                return ExitCode::from(2);
            }
            a => paths.push(PathBuf::from(a)),
        }
        i += 1;
    }
    if paths.is_empty() {
        eprintln!("{}", kshana::t!("main-error-compliance-report-needs-at"));
        return ExitCode::from(2);
    }
    let (runs, bad) = compliance::load_runs(&paths);
    let report = compliance::assess(&runs, bad);
    for (ext, body) in [
        ("compliance.md", report.to_markdown()),
        ("compliance.json", report.to_json()),
    ] {
        let target = PathBuf::from(format!("{out}.{ext}"));
        if let Err(e) = std::fs::write(&target, body) {
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-write-6",
                    target = target.display(),
                    e = e
                )
            );
            return ExitCode::FAILURE;
        }
        println!("wrote {}", target.display());
    }
    let n = |s: compliance::Status| report.rows.iter().filter(|r| r.status == s).count();
    println!(
        "{}",
        kshana::t!(
            "main-runs-read-not-used-rows",
            runs = runs.len(),
            unrecognised = report.unrecognised.len(),
            n = n(compliance::Status::Evidenced),
            n2 = n(compliance::Status::PartlyEvidenced),
            n3 = n(compliance::Status::NotEvidenced),
            n4 = n(compliance::Status::OutOfScope)
        )
    );
    ExitCode::SUCCESS
}

/// `kshana receiver-trust <scenario.toml>`: read the receiver log the scenario names, run
/// the trust monitors, and write `<stem>.result.json`, `<stem>.trust.csv` and
/// `<stem>.trust.svg` next to the scenario.
fn run_receiver_trust_cli(args: &[String]) -> ExitCode {
    if args.first().map(String::as_str) == Some("live") {
        return live_io::run(&args[1..]);
    }
    let Some(path) = args.first() else {
        eprintln!("{}", kshana::t!("main-error-receiver-trust-needs-scenario"));
        return ExitCode::from(2);
    };
    let path = PathBuf::from(path);
    let src = match std::fs::read_to_string(&path) {
        Ok(s) => s,
        Err(e) => {
            eprintln!(
                "{}",
                kshana::t!("main-error-cannot-read-2", path = path.display(), e = e)
            );
            return ExitCode::from(2);
        }
    };
    let mut scn: kshana::receiver_trust::scenario::ReceiverTrustScenario =
        match toml::from_str(&src) {
            Ok(s) => s,
            Err(e) => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-invalid-receiver-trust-scenario", e = e)
                );
                return ExitCode::from(2);
            }
        };
    let base = path.parent().map(PathBuf::from).unwrap_or_default();
    kshana::receiver_trust::scenario::resolve_paths(&mut scn, &base);
    let out = match kshana::receiver_trust::scenario::run_scenario(&scn) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("error: {e}");
            return ExitCode::FAILURE;
        }
    };
    let stem = path.with_extension("");
    for (ext, body) in [
        ("result.json", &out.json),
        ("trust.csv", &out.csv),
        ("trust.svg", &out.svg),
    ] {
        let target = PathBuf::from(format!("{}.{ext}", stem.display()));
        if let Err(e) = std::fs::write(&target, body) {
            eprintln!(
                "{}",
                kshana::t!(
                    "main-error-cannot-write-6",
                    target = target.display(),
                    e = e
                )
            );
            return ExitCode::FAILURE;
        }
    }
    println!("{}", out.summary);
    ExitCode::SUCCESS
}
