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
fn usage() -> String {
    kshana::t!("main-usage")
}

/// `kshana obs convert <log> --format <f> --station <station.toml> [--out <file>]` writes a
/// kshana.obs/1 file from a receiver log; `kshana obs live <file|-|tcp:host:port> --format <f>
/// --station <station.toml> [--out <file>]` does the same for a stream as it arrives;
/// `kshana obs check <file> [--json]` checks one.
fn run_obs_cli(args: &[String]) -> ExitCode {
    let usage = || {
        eprintln!("{}", kshana::terr!("e-obs-cli-usage"));
        ExitCode::from(2)
    };
    let flag = |name: &str| {
        args.iter()
            .position(|a| a == name)
            .and_then(|i| args.get(i + 1))
            .cloned()
    };
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    match args.first().map(String::as_str) {
        Some("convert") if args.len() >= 6 => {
            let log = &args[1];
            let (Some(format), Some(station_path)) = (flag("--format"), flag("--station")) else {
                return usage();
            };
            let bytes = match std::fs::read(log) {
                Ok(b) => b,
                Err(e) => return fail(log, e.to_string()),
            };
            let station_src = match std::fs::read_to_string(&station_path) {
                Ok(s) => s,
                Err(e) => return fail(&station_path, e.to_string()),
            };
            let station: kshana::obs::Station = match toml::from_str(&station_src) {
                Ok(s) => s,
                Err(e) => return fail(&station_path, e.to_string()),
            };
            let text = match kshana::obs::from_log(&format, &bytes, &station)
                .and_then(|r| kshana::obs::to_jsonl(&r))
            {
                Ok(t) => t,
                Err(e) => return fail(log, e),
            };
            match flag("--out") {
                Some(out) => match std::fs::write(&out, text) {
                    Ok(()) => ExitCode::SUCCESS,
                    Err(e) => fail(&out, e.to_string()),
                },
                None => {
                    print!("{text}");
                    ExitCode::SUCCESS
                }
            }
        }
        Some("live") if args.len() >= 6 => {
            let source = &args[1];
            let (Some(format), Some(station_path)) = (flag("--format"), flag("--station")) else {
                return usage();
            };
            let station: kshana::obs::Station = match std::fs::read_to_string(&station_path)
                .map_err(|e| e.to_string())
                .and_then(|s| toml::from_str(&s).map_err(|e| e.to_string()))
            {
                Ok(s) => s,
                Err(e) => return fail(&station_path, e),
            };
            // `-` is standard input, `tcp:host:port` a receiver's TCP port, anything else a file
            // or a device (a serial port: set its speed with stty first).
            let input: Box<dyn std::io::Read> = if source == "-" {
                Box::new(std::io::stdin())
            } else if let Some(addr) = source.strip_prefix("tcp:") {
                match std::net::TcpStream::connect(addr) {
                    Ok(s) => Box::new(s),
                    Err(e) => return fail(source, e.to_string()),
                }
            } else {
                match std::fs::File::open(source) {
                    Ok(f) => Box::new(f),
                    Err(e) => return fail(source, e.to_string()),
                }
            };
            let result = match flag("--out") {
                Some(out) => match std::fs::File::create(&out) {
                    Ok(f) => kshana::obs_live::pump(
                        input,
                        &mut std::io::BufWriter::new(f),
                        &format,
                        &station,
                    ),
                    Err(e) => return fail(&out, e.to_string()),
                },
                None => kshana::obs_live::pump(input, &mut std::io::stdout(), &format, &station),
            };
            match result {
                Ok(_) => ExitCode::SUCCESS,
                Err(e) => fail(source, e),
            }
        }
        Some("check") if args.len() == 2 || (args.len() == 3 && args[2] == "--json") => {
            let path = &args[1];
            let text = match std::fs::read_to_string(path) {
                Ok(t) => t,
                Err(e) => return fail(path, e.to_string()),
            };
            match kshana::obs::check(&text) {
                Ok((_, rep)) => {
                    if args.len() == 3 {
                        println!("{}", serde_json::to_string_pretty(&rep).unwrap_or_default());
                    } else {
                        println!(
                            "{}",
                            kshana::t!(
                                "obs-check-ok",
                                path = path.clone(),
                                station = rep.station.clone(),
                                epochs = rep.epochs.to_string(),
                                alarms = rep.alarms.to_string(),
                                iq = rep.iq_refs.to_string()
                            )
                        );
                    }
                    ExitCode::SUCCESS
                }
                Err(e) => fail(path, e),
            }
        }
        _ => usage(),
    }
}

/// `kshana connect map <input> --mapping <connect.toml> --station <station.toml> [--out <file>]`
/// turns any CSV, TSV, JSON or JSON Lines export into a kshana.obs/1 file through a mapping file
/// (kshana::connect, docs/CONNECT.md).
fn run_connect_cli(args: &[String]) -> ExitCode {
    let usage = || {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        ExitCode::from(2)
    };
    let flag = |name: &str| {
        args.iter()
            .position(|a| a == name)
            .and_then(|i| args.get(i + 1))
            .cloned()
    };
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    if args.first().map(String::as_str) == Some("check") && (2..=3).contains(&args.len()) {
        let bless = args.len() == 3 && args[2] == "--bless";
        if args.len() == 3 && !bless {
            return usage();
        }
        let vectors = kshana::connect::find_vectors(std::path::Path::new(&args[1]));
        if vectors.is_empty() {
            return fail(&args[1], kshana::terr!("e-connect-no-vectors"));
        }
        let mut failed = 0usize;
        for p in &vectors {
            let shown = p.display().to_string();
            match kshana::connect::run_vector(p) {
                Err(e) => {
                    failed += 1;
                    println!("{}", kshana::t!("connect-check-error", path = shown, e = e));
                }
                Ok((v, expected, produced)) => {
                    if bless {
                        if let Err(e) = std::fs::write(&expected, &produced) {
                            return fail(&expected.display().to_string(), e.to_string());
                        }
                        println!("{}", kshana::t!("connect-check-blessed", name = v.name));
                        continue;
                    }
                    let want = std::fs::read_to_string(&expected).unwrap_or_default();
                    match kshana::connect::first_difference(&want, &produced) {
                        None => println!("{}", kshana::t!("connect-check-pass", name = v.name)),
                        Some(line) => {
                            failed += 1;
                            println!(
                                "{}",
                                kshana::t!(
                                    "connect-check-fail",
                                    name = v.name,
                                    line = line.to_string()
                                )
                            );
                        }
                    }
                }
            }
        }
        println!(
            "{}",
            kshana::t!(
                "connect-check-summary",
                passed = (vectors.len() - failed).to_string(),
                total = vectors.len().to_string()
            )
        );
        return if failed == 0 {
            ExitCode::SUCCESS
        } else {
            ExitCode::from(1)
        };
    }
    if args.first().map(String::as_str) == Some("watch") && args.len() >= 6 {
        return run_connect_watch(&args[1], &flag, args.iter().any(|a| a == "--once"));
    }
    if args.first().map(String::as_str) == Some("adapters")
        && matches!(args.get(1).map(String::as_str), Some("list" | "check"))
    {
        let json = args.iter().any(|a| a == "--json");
        let dir = args
            .get(2)
            .filter(|a| !a.starts_with("--"))
            .cloned()
            .unwrap_or_else(|| "adapters".into());
        return run_connect_adapters(&args[1], &dir, json);
    }
    if args.first().map(String::as_str) == Some("load-test") {
        return run_connect_load_test(&flag, args.iter().any(|a| a == "--json"));
    }
    if args.first().map(String::as_str) == Some("check-live") && (2..=3).contains(&args.len()) {
        let json = args.len() == 3 && args[2] == "--json";
        if args.len() == 3 && !json {
            return usage();
        }
        return run_connect_check_live(&args[1], json);
    }
    if args.first().map(String::as_str) == Some("nats") && args.len() >= 8 {
        return run_connect_nats(&args[1], &flag, args.iter().any(|a| a == "--per-topic"));
    }
    if args.first().map(String::as_str) == Some("ws") && args.len() >= 6 {
        return run_connect_ws(&args[1], &flag);
    }
    if args.first().map(String::as_str) == Some("mqtt") && args.len() >= 8 {
        return run_connect_mqtt(&args[1], &flag, args.iter().any(|a| a == "--per-topic"));
    }
    if args.first().map(String::as_str) != Some("map") || args.len() < 6 {
        return usage();
    }
    let input = &args[1];
    let (Some(mapping_path), Some(station_path)) = (flag("--mapping"), flag("--station")) else {
        return usage();
    };
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| e.to_string());
    let mapping = match read(&mapping_path).and_then(|t| kshana::connect::parse_mapping(&t)) {
        Ok(m) => m,
        Err(e) => return fail(&mapping_path, e),
    };
    let station: kshana::obs::Station =
        match read(&station_path).and_then(|t| toml::from_str(&t).map_err(|e| e.to_string())) {
            Ok(s) => s,
            Err(e) => return fail(&station_path, e),
        };
    let text = match read(input)
        .and_then(|t| kshana::connect::map(&mapping, &t, &station))
        .and_then(|r| kshana::obs::to_jsonl(&r))
    {
        Ok(t) => t,
        Err(e) => return fail(input, e),
    };
    match flag("--out") {
        Some(out) => match std::fs::write(&out, text) {
            Ok(()) => ExitCode::SUCCESS,
            Err(e) => fail(&out, e.to_string()),
        },
        None => {
            print!("{text}");
            ExitCode::SUCCESS
        }
    }
}

/// `kshana connect adapters <list|check> [<dir>] [--json]`: the adapter registry
/// (`kshana::adapters`). `check` validates every manifest and runs every conformance vector; exit 1
/// when any adapter fails. `list` prints the adapters that pass.
fn run_connect_adapters(cmd: &str, dir: &str, json: bool) -> ExitCode {
    let entries = kshana::adapters::check(std::path::Path::new(dir));
    if entries.is_empty() {
        eprintln!("{dir}: {}", kshana::terr!("e-connect-no-vectors"));
        return ExitCode::from(1);
    }
    let passed = entries.iter().filter(|e| e.ok()).count();
    if json {
        println!(
            "{}",
            serde_json::to_string_pretty(&entries).unwrap_or_default()
        );
    } else if cmd == "list" {
        for m in entries
            .iter()
            .filter(|e| e.ok())
            .filter_map(|e| e.manifest.as_ref())
        {
            println!(
                "{}",
                kshana::t!(
                    "adapter-list-line",
                    name = m.name.clone(),
                    status = m.status.clone(),
                    title = m.title.clone()
                )
            );
        }
    } else {
        for e in &entries {
            let line = match (&e.manifest, e.ok()) {
                (Some(m), true) => kshana::t!("adapter-check-pass", name = m.name.clone()),
                _ => kshana::t!(
                    "adapter-check-fail",
                    dir = e.dir.clone(),
                    problems = e.problems.join("; ")
                ),
            };
            println!("{line}");
        }
        println!(
            "{}",
            kshana::t!(
                "adapter-check-summary",
                passed = passed.to_string(),
                total = entries.len().to_string()
            )
        );
    }
    if cmd == "check" && passed != entries.len() {
        ExitCode::from(1)
    } else {
        ExitCode::SUCCESS
    }
}

/// `kshana connect load-test [--stations <n>] [--rate <Hz>] [--seconds <s>] [--via memory|mqtt] [--json]`:
/// many synthetic stations through the live feeds (`kshana::connect_load`); exit 1 when the run does
/// not keep up with the offered load. Defaults: 1000 stations at 1 Hz for 10 s, in memory.
fn run_connect_load_test(flag: &dyn Fn(&str) -> Option<String>, json: bool) -> ExitCode {
    let usage = || {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        ExitCode::from(2)
    };
    let num = |name: &str, d: f64| match flag(name).map(|v| v.parse::<f64>()) {
        None => Some(d),
        Some(Ok(v)) if v.is_finite() && v > 0.0 => Some(v),
        Some(_) => None,
    };
    let (Some(stations), Some(rate), Some(seconds)) = (
        num("--stations", 1000.0),
        num("--rate", 1.0),
        num("--seconds", 10.0),
    ) else {
        return usage();
    };
    let r = match flag("--via").as_deref() {
        None | Some("memory") => {
            kshana::connect_load::run_memory(stations as usize, rate, seconds as usize)
        }
        Some("mqtt") => kshana::connect_load::run_mqtt(stations as usize, rate, seconds as usize),
        Some(_) => return usage(),
    };
    let r = match r {
        Ok(r) => r,
        Err(e) => {
            eprintln!("{e}");
            return ExitCode::from(1);
        }
    };
    if json {
        println!("{}", serde_json::to_string_pretty(&r).unwrap_or_default());
    } else {
        let f1 = |v: f64| format!("{v:.1}");
        let f3 = |v: f64| format!("{v:.3}");
        println!(
            "{}",
            kshana::t!(
                "connect-load-report",
                verdict = if r.pass { "PASS" } else { "FAIL" },
                stations = r.stations.to_string(),
                rate = r.rate_hz.to_string(),
                seconds = r.seconds.to_string(),
                via = r.via.clone(),
                messages = r.messages.to_string(),
                epochs = r.epochs.to_string(),
                capacity = f1(r.capacity_msgs_per_s),
                offered = f1(r.offered_msgs_per_s),
                p50 = f3(r.latency_ms[0]),
                p99 = f3(r.latency_ms[1]),
                max = f3(r.latency_ms[2])
            )
        );
    }
    if r.pass {
        ExitCode::SUCCESS
    } else {
        ExitCode::from(1)
    }
}

/// `kshana connect check-live <vector.toml|dir> [--json]`: replay the conformance vectors over MQTT,
/// WebSocket and the directory watch (`kshana::connect_live`); exit 1 when any path fails.
fn run_connect_check_live(dir: &str, json: bool) -> ExitCode {
    let vectors = kshana::connect::find_vectors(std::path::Path::new(dir));
    if vectors.is_empty() {
        eprintln!("{dir}: {}", kshana::terr!("e-connect-no-vectors"));
        return ExitCode::from(1);
    }
    // PATH-UNIQUE-WAIVER: one call per `kshana connect check-live` process (a CLI command, never a test thread).
    let scratch = std::env::temp_dir().join(format!("kshana-live-{}", std::process::id()));
    let mut results = Vec::new();
    for p in &vectors {
        match kshana::connect_live::check_vector(p, &scratch) {
            Ok(r) => results.push(r),
            Err(e) => {
                eprintln!("{}: {e}", p.display());
                return ExitCode::from(1);
            }
        }
    }
    let paths: Vec<_> = results.iter().flat_map(|r| &r.paths).collect();
    let passed = paths.iter().filter(|p| p.pass).count();
    if json {
        println!(
            "{}",
            serde_json::to_string_pretty(&results).unwrap_or_default()
        );
    } else {
        let ms = |v: f64| format!("{v:.1}");
        for r in &results {
            if let Some(why) = &r.skipped {
                println!(
                    "{}",
                    kshana::t!(
                        "connect-live-skip",
                        name = r.name.clone(),
                        why = why.clone()
                    )
                );
            }
            for p in &r.paths {
                let line = if p.pass {
                    kshana::t!(
                        "connect-live-pass",
                        name = r.name.clone(),
                        path = p.path,
                        got = p.epochs_produced.to_string(),
                        want = p.epochs_expected.to_string(),
                        p50 = ms(p.latency_ms[0]),
                        p99 = ms(p.latency_ms[1]),
                        reconnects = p.reconnects.to_string()
                    )
                } else {
                    kshana::t!(
                        "connect-live-fail",
                        name = r.name.clone(),
                        path = p.path,
                        got = p.epochs_produced.to_string(),
                        want = p.epochs_expected.to_string(),
                        diff = p.first_difference.map_or("-".into(), |d| d.to_string()),
                        released = p.released_at_end.to_string(),
                        p99 = ms(p.latency_ms[1]),
                        reconnects = p.reconnects.to_string()
                    )
                };
                println!("{line}");
            }
        }
        println!(
            "{}",
            kshana::t!(
                "connect-live-summary",
                passed = passed.to_string(),
                total = paths.len().to_string()
            )
        );
    }
    if passed == paths.len() {
        ExitCode::SUCCESS
    } else {
        ExitCode::from(1)
    }
}

/// `kshana connect nats <host:port> --subject <s> --mapping <connect.toml> --station <station.toml>
/// [--header <row>] [--per-topic] [--user <name> --password-env <VAR> | --token-env <VAR>]
/// [--max-messages <n>]`: subscribe to a NATS subject and print `kshana.obs/1` records as JSON lines
/// (`kshana::connect_nats`). Secrets come from environment variables only.
fn run_connect_nats(
    addr: &str,
    flag: &dyn Fn(&str) -> Option<String>,
    per_subject: bool,
) -> ExitCode {
    use std::io::Write;
    let usage = || {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        ExitCode::from(2)
    };
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    let (Some(subject), Some(mapping_path), Some(station_path)) =
        (flag("--subject"), flag("--mapping"), flag("--station"))
    else {
        return usage();
    };
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| e.to_string());
    let mapping = match read(&mapping_path).and_then(|t| kshana::connect::parse_mapping(&t)) {
        Ok(m) => m,
        Err(e) => return fail(&mapping_path, e),
    };
    let station: kshana::obs::Station =
        match read(&station_path).and_then(|t| toml::from_str(&t).map_err(|e| e.to_string())) {
            Ok(s) => s,
            Err(e) => return fail(&station_path, e),
        };
    let max = match flag("--max-messages").map(|v| v.parse::<u64>()) {
        None => None,
        Some(Ok(n)) if n > 0 => Some(n),
        Some(_) => return usage(),
    };
    let env = |var: String| std::env::var(var).unwrap_or_default();
    let (credentials, token) = match (flag("--user"), flag("--password-env"), flag("--token-env")) {
        (None, None, None) => (None, None),
        (Some(u), Some(v), None) => (Some((u, env(v))), None),
        (None, None, Some(v)) => (None, Some(env(v))),
        _ => return usage(),
    };
    let cfg = kshana::connect_nats::NatsConfig {
        addr: addr.to_string(),
        subject,
        credentials,
        token,
    };
    let header = flag("--header");
    let mut out = std::io::stdout().lock();
    let mut bad = None;
    let mut write = |recs: Vec<kshana::obs::Record>| match kshana::obs::to_jsonl(&recs) {
        // A closed standard output (a reader that went away) ends the run quietly.
        Ok(t) => out
            .write_all(t.as_bytes())
            .and_then(|()| out.flush())
            .is_ok(),
        Err(e) => {
            bad = Some(e);
            false
        }
    };
    let r = if per_subject {
        match kshana::connect_mqtt::TopicFeeds::new(&mapping, header.as_deref()) {
            Ok(f) => {
                let mut feeds = f.label("connect-nats");
                kshana::connect_nats::run_per_subject(
                    &cfg, &mapping, &station, &mut feeds, max, &mut write,
                )
            }
            Err(e) => return fail(&mapping_path, e),
        }
    } else {
        match kshana::connect_mqtt::Feed::new(&mapping, header.as_deref()) {
            Ok(f) => {
                let mut feed = f.label("connect-nats");
                kshana::connect_nats::run(&cfg, &mapping, &station, &mut feed, max, &mut write)
            }
            Err(e) => return fail(&mapping_path, e),
        }
    };
    match r.and_then(|_| bad.map_or(Ok(()), Err)) {
        Err(e) => fail(addr, e),
        Ok(()) => ExitCode::SUCCESS,
    }
}

/// `kshana connect ws <ws://host:port/path> --mapping <connect.toml> --station <station.toml>
/// [--header <row>] [--max-messages <n>]`: read rows streamed over a WebSocket and print `kshana.obs/1`
/// records as JSON lines (`kshana::connect_ws`). The run ends when the server closes the stream (the held
/// epoch is released then) or after `--max-messages`.
fn run_connect_ws(url: &str, flag: &dyn Fn(&str) -> Option<String>) -> ExitCode {
    use std::io::Write;
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    let usage = || {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        ExitCode::from(2)
    };
    let (Some(mapping_path), Some(station_path)) = (flag("--mapping"), flag("--station")) else {
        return usage();
    };
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| e.to_string());
    let mapping = match read(&mapping_path).and_then(|t| kshana::connect::parse_mapping(&t)) {
        Ok(m) => m,
        Err(e) => return fail(&mapping_path, e),
    };
    let station: kshana::obs::Station =
        match read(&station_path).and_then(|t| toml::from_str(&t).map_err(|e| e.to_string())) {
            Ok(s) => s,
            Err(e) => return fail(&station_path, e),
        };
    let max = match flag("--max-messages").map(|v| v.parse::<u64>()) {
        None => None,
        Some(Ok(n)) if n > 0 => Some(n),
        Some(_) => return usage(),
    };
    let mut feed = match kshana::connect_mqtt::Feed::new(&mapping, flag("--header").as_deref()) {
        Ok(f) => f.label("connect-ws"),
        Err(e) => return fail(&mapping_path, e),
    };
    let mut ws = match kshana::connect_ws::WsClient::connect(url) {
        Ok(w) => w,
        Err(e) => return fail(url, e),
    };
    let mut out = std::io::stdout().lock();
    let mut seen = 0u64;
    loop {
        let (recs, end) = match ws.next_message() {
            Ok(None) => (feed.flush(&mapping, &station), true),
            Ok(Some(p)) => {
                seen += 1;
                let end = max == Some(seen);
                let mut r = feed.push(&p, &mapping, &station);
                if end {
                    r = r.and_then(|mut a| {
                        a.extend(feed.flush(&mapping, &station)?);
                        Ok(a)
                    });
                }
                (r, end)
            }
            Err(e) => (Err(e), true),
        };
        let text = match recs.and_then(|r| kshana::obs::to_jsonl(&r)) {
            Ok(t) => t,
            Err(e) => return fail(url, e),
        };
        if out
            .write_all(text.as_bytes())
            .and_then(|()| out.flush())
            .is_err()
            || end
        {
            ws.close();
            return ExitCode::SUCCESS;
        }
    }
}

/// `kshana connect mqtt <host:port> --topic <filter> --mapping <connect.toml> --station <station.toml>
/// [--header <row>] [--qos 0|1] [--user <name> --password-env <VAR>] [--client-id <id>]
/// [--max-messages <n>]`: subscribe to a broker topic and print `kshana.obs/1` records as JSON lines
/// (`kshana::connect_mqtt`). The password is read from the named environment variable, never from the
/// command line. With `--max-messages` the run ends after that many messages and releases the held epoch.
fn run_connect_mqtt(
    addr: &str,
    flag: &dyn Fn(&str) -> Option<String>,
    per_topic: bool,
) -> ExitCode {
    use std::io::Write;
    let usage = || {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        ExitCode::from(2)
    };
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    let (Some(topic), Some(mapping_path), Some(station_path)) =
        (flag("--topic"), flag("--mapping"), flag("--station"))
    else {
        return usage();
    };
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| e.to_string());
    let mapping = match read(&mapping_path).and_then(|t| kshana::connect::parse_mapping(&t)) {
        Ok(m) => m,
        Err(e) => return fail(&mapping_path, e),
    };
    let station: kshana::obs::Station =
        match read(&station_path).and_then(|t| toml::from_str(&t).map_err(|e| e.to_string())) {
            Ok(s) => s,
            Err(e) => return fail(&station_path, e),
        };
    let qos = match flag("--qos").as_deref() {
        None | Some("0") => 0,
        Some("1") => 1,
        Some(_) => return usage(),
    };
    let max = match flag("--max-messages").map(|v| v.parse::<u64>()) {
        None => None,
        Some(Ok(n)) if n > 0 => Some(n),
        Some(_) => return usage(),
    };
    let credentials = match (flag("--user"), flag("--password-env")) {
        (None, None) => None,
        (Some(u), Some(var)) => Some((u, std::env::var(var).unwrap_or_default())),
        _ => return usage(),
    };
    let cfg = kshana::connect_mqtt::MqttConfig {
        addr: addr.to_string(),
        client_id: flag("--client-id").unwrap_or_else(|| format!("kshana-{}", std::process::id())),
        topic,
        qos,
        credentials,
        keep_alive_s: 60,
    };
    let mut feed = match kshana::connect_mqtt::Feed::new(&mapping, flag("--header").as_deref()) {
        Ok(f) => f,
        Err(e) => return fail(&mapping_path, e),
    };
    let mut out = std::io::stdout().lock();
    let mut bad = None;
    let mut write = |recs: Vec<kshana::obs::Record>| match kshana::obs::to_jsonl(&recs) {
        // A closed standard output (a reader that went away) ends the run quietly.
        Ok(t) => out
            .write_all(t.as_bytes())
            .and_then(|()| out.flush())
            .is_ok(),
        Err(e) => {
            bad = Some(e);
            false
        }
    };
    if per_topic {
        let mut feeds =
            match kshana::connect_mqtt::TopicFeeds::new(&mapping, flag("--header").as_deref()) {
                Ok(f) => f,
                Err(e) => return fail(&mapping_path, e),
            };
        let r = kshana::connect_mqtt::run_per_topic(
            &cfg, &mapping, &station, &mut feeds, max, &mut write,
        );
        return match r.and_then(|_| bad.map_or(Ok(()), Err)) {
            Err(e) => fail(addr, e),
            Ok(()) => ExitCode::SUCCESS,
        };
    }
    let r = kshana::connect_mqtt::run(&cfg, &mapping, &station, &mut feed, max, &mut write);
    match r.and_then(|_| bad.map_or(Ok(()), Err)) {
        Err(e) => fail(addr, e),
        Ok(()) => ExitCode::SUCCESS,
    }
}

/// `kshana ntrip <host:port> [--mount <m>] [--user <u> --password-env <VAR>] [--gga <lat,lon[,h]>]
/// [--out <file>] [--max-bytes <n>] [--seconds <s>]`: fetch a mountpoint's stream (or, with no
/// `--mount`, print the source table). The bytes go to `--out` or standard output unchanged; a
/// count of the RTCM 3 frames goes to standard error at the end.
fn run_ntrip_cli(args: &[String]) -> ExitCode {
    use std::io::{Read, Write};
    let usage = || {
        eprintln!("{}", kshana::terr!("e-ntrip-usage"));
        ExitCode::from(2)
    };
    let Some(addr) = args.first().filter(|a| !a.starts_with("--")) else {
        return usage();
    };
    let flag = |name: &str| {
        args.iter()
            .position(|a| a == name)
            .and_then(|i| args.get(i + 1))
            .cloned()
    };
    let credentials = match (flag("--user"), flag("--password-env")) {
        (None, None) => None,
        (Some(u), Some(v)) => Some((u, std::env::var(v).unwrap_or_default())),
        _ => return usage(),
    };
    let gga = match flag("--gga") {
        None => None,
        Some(v) => {
            let n: Vec<f64> = v.split(',').filter_map(|x| x.trim().parse().ok()).collect();
            match n.as_slice() {
                [lat, lon] => Some(kshana::ntrip::gga(*lat, *lon, 0.0)),
                [lat, lon, h] => Some(kshana::ntrip::gga(*lat, *lon, *h)),
                _ => return usage(),
            }
        }
    };
    let num = |name: &str| flag(name).map(|v| v.parse::<f64>().ok().filter(|x| *x > 0.0));
    let (max_bytes, seconds) = match (num("--max-bytes"), num("--seconds")) {
        (Some(None), _) | (_, Some(None)) => return usage(),
        (a, b) => (a.flatten(), b.flatten()),
    };
    let cfg = kshana::ntrip::NtripConfig {
        addr: addr.clone(),
        mountpoint: flag("--mount").unwrap_or_default(),
        credentials,
        gga,
    };
    let mut stream = match kshana::ntrip::NtripStream::open(&cfg) {
        Ok(s) => s,
        Err(e) => {
            eprintln!("{addr}: {e}");
            return ExitCode::from(1);
        }
    };
    let mut out: Box<dyn Write> = match flag("--out") {
        Some(p) => match std::fs::File::create(&p) {
            Ok(f) => Box::new(std::io::BufWriter::new(f)),
            Err(e) => {
                eprintln!("{p}: {e}");
                return ExitCode::from(1);
            }
        },
        None => Box::new(std::io::stdout().lock()),
    };
    let started = std::time::Instant::now();
    let mut count = kshana::ntrip::RtcmCounter::default();
    let mut total = 0u64;
    let mut buf = vec![0u8; 16 * 1024];
    loop {
        if seconds.is_some_and(|s| started.elapsed().as_secs_f64() >= s)
            || max_bytes.is_some_and(|m| total as f64 >= m)
        {
            break;
        }
        let n = match stream.read(&mut buf) {
            Ok(0) => break,
            Ok(n) => n,
            Err(e) => {
                eprintln!("{addr}: {e}");
                return ExitCode::from(1);
            }
        };
        let n = max_bytes.map_or(n, |m| n.min((m as u64).saturating_sub(total) as usize));
        if out.write_all(&buf[..n]).is_err() {
            break;
        }
        if stream.answer != kshana::ntrip::Answer::SourceTable {
            count.push(&buf[..n]);
        }
        total += n as u64;
    }
    let _ = out.flush();
    if stream.answer != kshana::ntrip::Answer::SourceTable {
        let messages: Vec<String> = count
            .messages
            .iter()
            .map(|(m, n)| format!("{m}x{n}"))
            .collect();
        eprintln!(
            "{}",
            kshana::t!(
                "ntrip-summary",
                bytes = total.to_string(),
                frames = count.frames.to_string(),
                bad = count.bad_crc.to_string(),
                messages = messages.join(" ")
            )
        );
    }
    ExitCode::SUCCESS
}

/// `kshana connect watch <dir> --mapping <connect.toml> --station <station.toml> [--suffix <.csv>]
/// [--interval <s>] [--once]`: follow a directory of growing or rotating logs and print new
/// `kshana.obs/1` records as JSON lines (`kshana::connect_watch`). `--once` reads what is there, releases
/// the held last epoch and exits.
fn run_connect_watch(dir: &str, flag: &dyn Fn(&str) -> Option<String>, once: bool) -> ExitCode {
    use std::io::Write;
    let fail = |path: &str, e: String| {
        eprintln!("{path}: {e}");
        ExitCode::from(1)
    };
    let (Some(mapping_path), Some(station_path)) = (flag("--mapping"), flag("--station")) else {
        eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
        return ExitCode::from(2);
    };
    let read = |p: &str| std::fs::read_to_string(p).map_err(|e| e.to_string());
    let mapping = match read(&mapping_path).and_then(|t| kshana::connect::parse_mapping(&t)) {
        Ok(m) => m,
        Err(e) => return fail(&mapping_path, e),
    };
    let station: kshana::obs::Station =
        match read(&station_path).and_then(|t| toml::from_str(&t).map_err(|e| e.to_string())) {
            Ok(s) => s,
            Err(e) => return fail(&station_path, e),
        };
    let suffix = flag("--suffix").unwrap_or_else(|| format!(".{}", mapping.source.format));
    let interval = match flag("--interval").map(|v| v.parse::<f64>()) {
        None => 2.0,
        Some(Ok(v)) if v.is_finite() && v > 0.0 => v,
        Some(_) => {
            eprintln!("{}", kshana::terr!("e-connect-cli-usage"));
            return ExitCode::from(2);
        }
    };
    let path = std::path::Path::new(dir);
    let mut st = kshana::connect_watch::WatchState::default();
    let mut out = std::io::stdout().lock();
    loop {
        let step = if once {
            kshana::connect_watch::step(path, &suffix, &mapping, &station, &mut st).and_then(
                |mut a| {
                    a.extend(kshana::connect_watch::flush(
                        path, &suffix, &mapping, &station, &mut st,
                    )?);
                    Ok(a)
                },
            )
        } else {
            kshana::connect_watch::step(path, &suffix, &mapping, &station, &mut st)
        };
        let recs = match step.and_then(|r| kshana::obs::to_jsonl(&r)) {
            Ok(t) => t,
            Err(e) => return fail(dir, e),
        };
        if out
            .write_all(recs.as_bytes())
            .and_then(|()| out.flush())
            .is_err()
        {
            return ExitCode::SUCCESS;
        }
        if once {
            return ExitCode::SUCCESS;
        }
        std::thread::sleep(std::time::Duration::from_secs_f64(interval));
    }
}

/// `kshana scenario version` prints the scenario schema version this engine reads;
/// `kshana scenario migrate <file> [--in-place]` upgrades a file to it (stdout, or the file itself).
fn run_scenario_cli(args: &[String]) -> ExitCode {
    use kshana::scenario_version as sv;
    match args.first().map(String::as_str) {
        Some("version") if args.len() == 1 => {
            println!("{}", sv::CURRENT);
            ExitCode::SUCCESS
        }
        Some("migrate") if args.len() == 2 || (args.len() == 3 && args[2] == "--in-place") => {
            let path = &args[1];
            let src = match std::fs::read_to_string(path) {
                Ok(s) => s,
                Err(e) => {
                    eprintln!("{path}: {e}");
                    return ExitCode::from(1);
                }
            };
            let m = match sv::migrate(&src) {
                Ok(m) => m,
                Err(e) => {
                    eprintln!("{path}: {e}");
                    return ExitCode::from(1);
                }
            };
            if args.len() == 3 {
                if m.changed {
                    if let Err(e) = std::fs::write(path, &m.source) {
                        eprintln!("{path}: {e}");
                        return ExitCode::from(1);
                    }
                    eprintln!(
                        "{}",
                        kshana::t!(
                            "scenario-cli-migrated",
                            path = path.clone(),
                            to = m.to.to_string()
                        )
                    );
                } else {
                    eprintln!(
                        "{}",
                        kshana::t!(
                            "scenario-cli-unchanged",
                            path = path.clone(),
                            to = m.to.to_string()
                        )
                    );
                }
            } else {
                print!("{}", m.source);
            }
            ExitCode::SUCCESS
        }
        _ => {
            eprintln!("{}", kshana::terr!("e-scenario-cli-usage"));
            ExitCode::from(2)
        }
    }
}

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
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
    // `kshana partner check <submission.toml>` checks a data-partner submission's format and
    // metadata (docs/PARTNER-DATA.md). Terminal; it reads local files and scores nothing.
    if args.get(1).map(String::as_str) == Some("partner") {
        return kshana::partner::cli::run(&args[2..]);
    }
    // `kshana scenario <migrate|version>` states and upgrades a scenario file's schema version
    // (kshana::scenario_version, docs/SCENARIO-VERSIONS.md). Terminal, local files only.
    if args.get(1).map(String::as_str) == Some("scenario") {
        return run_scenario_cli(&args[2..]);
    }
    // `kshana obs <convert|check>` writes and checks kshana.obs/1 observation files
    // (kshana::obs, docs/OBS-SCHEMA.md). Terminal, local files only.
    if args.get(1).map(String::as_str) == Some("obs") {
        return run_obs_cli(&args[2..]);
    }
    // `kshana connect map` maps any tabular or JSON log to kshana.obs/1 through a mapping file
    // (kshana::connect, docs/CONNECT.md). Terminal, local files only.
    // `kshana ntrip <host:port> --mount <m>` fetches an NTRIP stream (RTCM 3) from a caster
    // (kshana::ntrip; docs/NTRIP.md). Terminal; the bytes go to a file or standard output.
    if args.get(1).map(String::as_str) == Some("ntrip") {
        return run_ntrip_cli(&args[2..]);
    }
    if args.get(1).map(String::as_str) == Some("connect") {
        return run_connect_cli(&args[2..]);
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
                println!("{}", usage());
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
                eprintln!("{}", usage());
                return ExitCode::from(2);
            }
            other if positional.is_none() => positional = Some(other.to_string()),
            other => {
                eprintln!(
                    "{}",
                    kshana::t!("main-error-unexpected-argument-one-scenario", other = other)
                );
                eprintln!("{}", usage());
                return ExitCode::from(2);
            }
        }
        i += 1;
    }
    // The animation options are checked before anything runs, so a bad `--animate-fps`
    // costs nothing. Tuning them without `--animate` would do nothing; say so.
    if !animate_formats.is_empty() {
        if let Err(e) = animate_opts.validate() {
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
        eprintln!("{}", usage());
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
                        Ok(()) => println!("{}", kshana::t!("main-applies", fmt = fmt.as_str())),
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
            Ok(()) => println!("{}", kshana::t!("main-wrote", path = target.display())),
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
                println!("{}", kshana::t!("main-wrote", path = sp3_path.display()));
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
                println!("{}", kshana::t!("main-wrote", path = omm_path.display()));
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
                println!("{}", kshana::t!("main-wrote", path = oem_path.display()));
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
        println!("{}", kshana::t!("main-wrote", path = target.display()));
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
                "{}",
                kshana::t!("main-error-example-extra-argument", extra = extra)
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
            eprintln!("{}", kshana::t!("main-fail", e = e));
            return ExitCode::FAILURE;
        }
    };
    let base_dir = suite_path
        .parent()
        .unwrap_or_else(|| std::path::Path::new("."));
    let out = match kshana::study::run_suite(&suite, base_dir) {
        Ok(o) => o,
        Err(e) => {
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
                eprintln!(
                    "{}",
                    kshana::t!("main-note", n = n.as_str().unwrap_or_default())
                );
            }
            ExitCode::SUCCESS
        }
        Err(e) => {
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
        println!("{}", kshana::t!("main-wrote", path = target.display()));
    }
    for n in notes {
        eprintln!("{}", kshana::t!("main-note", n = n));
    }
    ExitCode::SUCCESS
}

fn sky_usage() -> String {
    kshana::t!("main-usage-sky")
}

fn skyline_usage() -> String {
    kshana::t!("main-usage-skyline")
}

fn print_or_fail(out: Result<String, String>) -> ExitCode {
    match out {
        Ok(text) => {
            println!("{text}");
            ExitCode::SUCCESS
        }
        Err(e) => {
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
        eprintln!("{}\n{}", kshana::t!("main-fail", e = e), sky_usage());
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
                println!("{}", sky_usage());
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
            println!("{}", skyline_usage());
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
                        SKYLINE_USAGE = skyline_usage()
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
                        SKYLINE_USAGE = skyline_usage()
                    )
                );
                ExitCode::from(2)
            }
        },
        _ => {
            eprintln!("{}", skyline_usage());
            ExitCode::from(2)
        }
    }
}

fn lunanet_afs_usage() -> String {
    kshana::t!("main-usage-lunanet-afs-check")
}

/// `kshana lunanet-afs-check <spec|symbols|generate>`.
fn run_lunanet_afs_cli(args: &[String]) -> ExitCode {
    let fail = |m: &str| {
        eprintln!(
            "{}\n{}",
            kshana::t!("main-fail", e = m),
            lunanet_afs_usage()
        );
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
            println!("{}", lunanet_afs_usage());
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
                return fail(&kshana::t!("main-lunanet-afs-generate-needs"));
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

fn standards_pack_usage() -> String {
    kshana::t!("main-usage-standards-pack")
}

/// `kshana standards-pack <list|run|rows|tests>`.
fn run_standards_pack_cli(args: &[String]) -> ExitCode {
    let fail = |m: &str| {
        eprintln!(
            "{}\n{}",
            kshana::t!("main-fail", e = m),
            standards_pack_usage()
        );
        ExitCode::from(2)
    };
    let Some(cmd) = args.first().map(String::as_str) else {
        return fail("standards-pack needs a subcommand");
    };
    match cmd {
        "--help" | "-h" | "help" => {
            println!("{}", standards_pack_usage());
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
                    println!("{}", kshana::t!("main-wrote", path = target));
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
                    println!(
                        "## {}\n\n{}",
                        fw.title_localised(),
                        mapping::framework_table_md(fw)
                    );
                }
                return ExitCode::SUCCESS;
            }
            "--sources" => {
                println!("> {}\n", kshana::legal::text("legal-compliance-statement"));
                for fw in mapping::Framework::ALL {
                    println!("## {}\n\n{}", fw.title_localised(), mapping::sources_md(fw));
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
        println!("{}", kshana::t!("main-wrote", path = target.display()));
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
            eprintln!("{}", kshana::t!("main-fail", e = e));
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
