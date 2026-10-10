// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana nmea-scenario`.

use super::config::TrainingScenario;
use super::gen::generate;
use super::log::NOT_FOR_NAVIGATION;
use super::stream::{run, Pace, Sink, TcpServer, UdpSink, WriterSink};
use std::fs;
use std::io::BufWriter;
use std::path::PathBuf;
use std::process::ExitCode;
use std::time::Duration;

const HELP: &str = "usage: kshana nmea-scenario <scenario.toml> [options]

Writes or streams a synthetic bridge NMEA 0183 set (GGA RMC VTG GSV GSA GNS ZDA HDT VBW)
for a vessel track with scripted jamming/spoofing events, and an instructor log.
Training and testing only: never feed it to a vessel's live navigation systems.

options:
  --out <file.nmea>          write the stream to a file (default <name>.nmea when no
                             network output is given)
  --instructor-log <prefix>  write <prefix>.json and <prefix>.txt (default: next to the
                             file, else <name> in the current directory)
  --tcp <addr:port|port>     serve the stream over TCP (waits for a client first); a bare
                             port listens on 127.0.0.1 only. There is no authentication:
                             anyone who can reach the address can read the stream
  --udp <addr:port|port>     send one sentence per UDP datagram to this address; a bare
                             port sends to 127.0.0.1
  --broadcast                allow --udp to use a broadcast address
  --wait-clients <n>         clients to wait for before the TCP stream starts (default 1)
  --realtime                 pace at real time (default for network output)
  --speed <x>                pace at x times real time; 0 is as fast as possible
                             (default for files)
  --seed <n>                 replace the scenario seed
  --no-marker                omit the synthetic-data marker sentence";

/// A bare port means this machine only (`127.0.0.1:<port>`); a wider address, such as
/// `0.0.0.0:10110`, has to be asked for in full.
pub fn localise_addr(a: &str) -> String {
    if !a.is_empty() && a.bytes().all(|b| b.is_ascii_digit()) {
        format!("127.0.0.1:{a}")
    } else {
        a.to_string()
    }
}

fn fail(msg: impl std::fmt::Display) -> ExitCode {
    eprintln!("error: {msg}");
    ExitCode::from(2)
}

/// Run the subcommand; `args` excludes the program name and the subcommand.
pub fn run_cli(args: &[String]) -> ExitCode {
    let mut path: Option<String> = None;
    let (mut out, mut log_prefix, mut tcp, mut udp): (
        Option<PathBuf>,
        Option<PathBuf>,
        Option<String>,
        Option<String>,
    ) = (None, None, None, None);
    let (mut broadcast, mut no_marker) = (false, false);
    let mut wait_clients = 1usize;
    let mut speed: Option<f64> = None;
    let mut seed: Option<u64> = None;
    let mut it = args.iter();
    while let Some(a) = it.next() {
        let mut val = |name: &str| it.next().cloned().ok_or(format!("{name} needs a value"));
        let r: Result<(), String> = (|| {
            match a.as_str() {
                "-h" | "--help" => {
                    println!("{HELP}");
                    std::process::exit(0);
                }
                "--out" => out = Some(PathBuf::from(val("--out")?)),
                "--instructor-log" => log_prefix = Some(PathBuf::from(val("--instructor-log")?)),
                "--tcp" => tcp = Some(val("--tcp")?),
                "--udp" => udp = Some(val("--udp")?),
                "--broadcast" => broadcast = true,
                "--no-marker" => no_marker = true,
                "--realtime" => speed = Some(1.0),
                "--wait-clients" => {
                    wait_clients = val("--wait-clients")?
                        .parse()
                        .map_err(|_| "--wait-clients: not a number")?
                }
                "--speed" => {
                    let x: f64 = val("--speed")?
                        .parse()
                        .map_err(|_| "--speed: not a number")?;
                    if !(x >= 0.0 && x.is_finite()) {
                        return Err("--speed must be 0 or positive".into());
                    }
                    speed = Some(x)
                }
                "--seed" => {
                    seed = Some(
                        val("--seed")?
                            .parse()
                            .map_err(|_| "--seed: not an integer")?,
                    )
                }
                s if s.starts_with('-') => return Err(format!("unknown option {s}")),
                s if path.is_none() => path = Some(s.to_string()),
                s => return Err(format!("unexpected argument {s}")),
            }
            Ok(())
        })();
        if let Err(e) = r {
            return fail(e);
        }
    }
    let Some(path) = path else {
        eprintln!("{HELP}");
        return ExitCode::from(2);
    };
    let text = match fs::read_to_string(&path) {
        Ok(t) => t,
        Err(e) => return fail(format!("{path}: {e}")),
    };
    let mut scn = match TrainingScenario::parse(&text) {
        Ok(s) => s,
        Err(e) => return fail(format!("{path}: {e}")),
    };
    if let Some(s) = seed {
        scn.scenario.seed = s;
    }
    if no_marker {
        scn.output.marker = false;
    }
    let g = match generate(&scn) {
        Ok(g) => g,
        Err(e) => return fail(e),
    };

    let (tcp, udp) = (
        tcp.map(|a| localise_addr(&a)),
        udp.map(|a| localise_addr(&a)),
    );
    let networked = tcp.is_some() || udp.is_some();
    let mut sinks: Vec<Box<dyn Sink>> = Vec::new();
    let file_path = match (&out, networked) {
        (Some(p), _) => Some(p.clone()),
        (None, false) => Some(PathBuf::from(format!("{}.nmea", scn.scenario.name))),
        (None, true) => None,
    };
    if let Some(p) = &file_path {
        match fs::File::create(p) {
            Ok(f) => sinks.push(Box::new(WriterSink(BufWriter::new(f)))),
            Err(e) => return fail(format!("{}: {e}", p.display())),
        }
    }
    let prefix = log_prefix.unwrap_or_else(|| match &file_path {
        Some(p) => p.with_extension(""),
        None => PathBuf::from(&scn.scenario.name),
    });
    let (jp, tp) = (
        PathBuf::from(format!("{}.instructor.json", prefix.display())),
        PathBuf::from(format!("{}.instructor.txt", prefix.display())),
    );
    if let Err(e) = fs::write(&jp, g.log.to_json()).and_then(|_| fs::write(&tp, g.log.to_text())) {
        return fail(format!("instructor log: {e}"));
    }
    eprintln!("{NOT_FOR_NAVIGATION}");
    eprintln!("instructor log: {} and {}", jp.display(), tp.display());

    let mut server_keepalive = None;
    if let Some(addr) = &tcp {
        match TcpServer::bind(addr.as_str()) {
            Ok(s) => {
                eprintln!(
                    "TCP server listening on {}; waiting for {wait_clients} client(s)",
                    s.local_addr()
                );
                if !s.wait_for_clients(wait_clients, Some(Duration::from_secs(3600))) {
                    return fail("no client connected within an hour");
                }
                server_keepalive = Some(s);
            }
            Err(e) => return fail(format!("--tcp {addr}: {e}")),
        }
    }
    if let Some(s) = server_keepalive {
        sinks.push(Box::new(s));
    }
    if let Some(addr) = &udp {
        match UdpSink::new(addr.as_str(), broadcast) {
            Ok(s) => sinks.push(Box::new(s)),
            Err(e) => return fail(format!("--udp {addr}: {e}")),
        }
    }
    let pace = match speed {
        Some(x) if x > 0.0 => Pace::Speed(x),
        Some(_) => Pace::Max,
        None if networked => Pace::Speed(1.0),
        None => Pace::Max,
    };
    if let Err(e) = run(&g.epochs, &mut sinks, pace) {
        return fail(format!("stream: {e}"));
    }
    if let Some(p) = &file_path {
        eprintln!("wrote {}", p.display());
    }
    ExitCode::SUCCESS
}
