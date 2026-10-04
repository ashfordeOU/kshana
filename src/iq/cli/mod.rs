// SPDX-License-Identifier: AGPL-3.0-only
//! The processing half of the `kshana iq` command group: `scene`, `acquire`, `track`,
//! `sweep`, `labfit` and `frontend`.
//!
//! [`run`] takes the arguments after `iq` and returns a process exit code (0 success,
//! 1 failure, 2 usage error). It owns the five signal-processing commands and hands every
//! other command (the data-handling `inventory`, `info`, `extract`, `convert`, `decimate`)
//! straight to [`super::io::cli::run`], so the two halves share one `kshana iq` namespace
//! and one help screen. The commands expose, without a line of Rust:
//!
//! * `scene` — generate a long multi-satellite IQ scene to a file with a truth sidecar
//!   ([`scene`]);
//! * `acquire` — FFT acquisition of one or more PRNs over a recording ([`acquire`]);
//! * `track` — run the tracking bank over a recording and emit per-epoch output
//!   ([`track`]);
//! * `sweep` — replay one recording across several loop designs and report lock metrics
//!   ([`sweep`]);
//! * `labfit` — fit the tracking-loop loss-of-lock model to a receiver-trust timeline
//!   ([`labfit`]);
//! * `frontend` — apply receiver front-end and interference-mitigation DSP to a recording
//!   ([`frontend`]).
//!
//! The parsing style, the exit codes and the `--format`/`--rate`/`--center` raw-input flags
//! mirror [`super::io::cli`] exactly.

mod acquire;
mod channel;
mod frontend;
mod labfit;
mod scene;
mod signal;
mod sweep;
mod track;

pub(crate) use signal::build_code;
// Re-exported for the Python bindings, which build and generate a scene in-process.
#[cfg(feature = "python")]
pub(crate) use channel::{build_channel, ChannelParams};
#[cfg(feature = "python")]
pub(crate) use frontend::{build_chain, FrontendParams};
#[cfg(feature = "python")]
pub(crate) use scene::{build_scene, SceneParams};
#[cfg(feature = "python")]
pub(crate) use signal::signal_names;

use std::collections::HashMap;

/// Usage text of the processing commands, printed above [`super::io::cli::USAGE`].
pub(crate) const USAGE: &str = "usage: kshana iq scene   <out> --rate <hz> --duration <s> --signal <name> --prn <list> [--doppler <list>] [--cn0 <dbhz>] [--noise-figure <db> | --no-noise] [--seed <n>] [--data] [--center <hz>] [--if <hz>] [--format <fmt>] [--truth <path>] [--truth-format csv|jsonl] [--threads <n>]
   or: kshana iq acquire <recording> --signal <name> --prn <list> [--coherent <N>] [--noncoherent <M>] [--doppler-max <hz>] [--doppler-step <hz>] [--pfa <p>] [--json <out>] [--csv <out>]
   or: kshana iq track   <recording> --signal <name> --prn <list> [--pll-bw <hz>] [--fll-bw <hz>] [--dll-bw <hz>] [--spacing <chips>] [--coherent <N>] [--max-seconds <s>] [--acq-coherent <N>] [--acq-noncoherent <M>] [--doppler-max <hz>] [--json <out>] [--csv <out>]
   or: kshana iq sweep   <recording> --signal <name> --prn <list> [--pll-bw <list>] [--dll-bw <list>] [--spacing <list>] [--coherent <list>] [--max-seconds <s>] [--doppler-max <hz>] [--json <out>] [--csv <out>]
   or: kshana iq labfit  <scenario.toml> [--out-prefix <prefix>]
   or: kshana iq frontend <in> <out> [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>] [--out-format <fmt>]
 acquire/track also take the front-end flags [--bandpass lo,hi] [--notch] [--blank <thr>] [--excise] [--agc] [--bits <n>], applied before processing
 scene channel knobs: [--iono-stec <tecu> | --iono-vtec <tecu> | --iono-klobuchar] [--tropo [--tropo-doy <n>]] [--s4 <v> [--scint-tau0 <s>]] [--sigma-phi <rad>] [--multipath-height <m> [--multipath-ground dry|wet|sea]] [--land-mobile] [--nlos]
 recording/raw inputs without a sidecar also take: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>]
 signals: gps-l1ca gps-l5i gps-l5q gps-l2c galileo-e1b galileo-e1c galileo-e5a-i galileo-e5a-q beidou-b1i beidou-b1c glonass-l1of
 <list> is a comma-separated list (one per --prn, or a single value applied to all)";

/// A failure from a command: a usage error (exit 2) or a run error (exit 1).
pub(crate) enum Fail {
    /// A usage error: the command was invoked wrongly (exit code 2).
    Usage(String),
    /// A run error: the command was valid but could not complete (exit code 1).
    Run(String),
}

impl From<crate::iq::IqError> for Fail {
    fn from(e: crate::iq::IqError) -> Self {
        Fail::Run(e.to_string())
    }
}

/// Parsed command-line arguments: positionals, `--key value` options and `--switch` flags.
pub(crate) struct Args {
    pub(crate) pos: Vec<String>,
    pub(crate) opts: HashMap<String, String>,
    switches: Vec<String>,
}

impl Args {
    /// Parse `args`, treating any name in `switches` as a value-less flag and every other
    /// `--name value` as an option.
    pub(crate) fn parse(args: &[String], switches: &[&str]) -> Result<Args, String> {
        let mut a = Args {
            pos: Vec::new(),
            opts: HashMap::new(),
            switches: Vec::new(),
        };
        let mut i = 0;
        while i < args.len() {
            let s = args[i].as_str();
            if switches.contains(&s) {
                a.switches.push(s.to_string());
                i += 1;
            } else if s.starts_with("--") {
                let v = args.get(i + 1).ok_or(format!("{s} needs a value"))?;
                a.opts.insert(s.to_string(), v.clone());
                i += 2;
            } else {
                a.pos.push(s.to_string());
                i += 1;
            }
        }
        Ok(a)
    }

    /// Parse the value of option `k`, or `None` when it is absent.
    pub(crate) fn num<T: std::str::FromStr>(&self, k: &str) -> Result<Option<T>, String> {
        self.opts
            .get(k)
            .map(|v| {
                v.parse::<T>()
                    .map_err(|_| format!("{k}: cannot parse {v:?}"))
            })
            .transpose()
    }

    /// Whether switch `k` was given.
    pub(crate) fn has(&self, k: &str) -> bool {
        self.switches.iter().any(|s| s == k)
    }

    /// The raw string value of option `k`.
    pub(crate) fn get(&self, k: &str) -> Option<&str> {
        self.opts.get(k).map(String::as_str)
    }

    /// Require exactly `n` positional arguments.
    pub(crate) fn need_pos(&self, n: usize, cmd: &str) -> Result<(), Fail> {
        if self.pos.len() != n {
            return Err(Fail::Usage(format!(
                "iq {cmd} takes {n} positional argument(s), got {}",
                self.pos.len()
            )));
        }
        Ok(())
    }

    /// Parse a comma-separated list of `T` from option `k`.
    pub(crate) fn list<T: std::str::FromStr>(&self, k: &str) -> Result<Vec<T>, String> {
        match self.opts.get(k) {
            None => Ok(Vec::new()),
            Some(v) => v
                .split(',')
                .map(|p| {
                    p.trim()
                        .parse::<T>()
                        .map_err(|_| format!("{k}: cannot parse {p:?}"))
                })
                .collect(),
        }
    }
}

/// Run a `kshana iq` processing command; delegate every other command to
/// [`super::io::cli::run`]. Returns the process exit code (0, 1 or 2).
pub fn run(args: &[String]) -> i32 {
    match args.first().map(String::as_str) {
        None => {
            eprintln!("{USAGE}\n{}", super::io::cli::USAGE);
            2
        }
        Some("--help" | "-h" | "help") => {
            println!("{USAGE}\n{}", super::io::cli::USAGE);
            0
        }
        Some("scene") => finish(scene::run(&args[1..])),
        Some("acquire") => finish(acquire::run(&args[1..])),
        Some("track") => finish(track::run(&args[1..])),
        Some("sweep") => finish(sweep::run(&args[1..])),
        Some("labfit") => finish(labfit::run(&args[1..])),
        Some("frontend") => finish(frontend::run(&args[1..])),
        // Every data-handling command belongs to the io half of the group.
        Some(_) => super::io::cli::run(args),
    }
}

/// Turn a command's result into an exit code, printing the message or the error.
fn finish(r: Result<String, Fail>) -> i32 {
    match r {
        Ok(msg) => {
            println!("{msg}");
            0
        }
        Err(Fail::Usage(m)) => {
            eprintln!("error: {m}\n{USAGE}");
            2
        }
        Err(Fail::Run(m)) => {
            eprintln!("error: {m}");
            1
        }
    }
}

/// Parse the raw-input sidecar flags (`--format`, `--rate`, ...) shared with the io
/// commands, so a raw recording with no sidecar can be opened by these commands too.
pub(crate) fn raw_sidecar(a: &Args) -> Result<Option<crate::iq::io::inventory::RawSidecar>, Fail> {
    let Some(format) = a.get("--format") else {
        return Ok(None);
    };
    Ok(Some(crate::iq::io::inventory::RawSidecar {
        format: format.to_string(),
        sample_rate_hz: a
            .num("--rate")
            .map_err(Fail::Usage)?
            .ok_or(Fail::Usage("--format needs --rate".into()))?,
        center_hz: a.num("--center").map_err(Fail::Usage)?,
        if_hz: a.num("--if").map_err(Fail::Usage)?,
        header_bytes: a.num("--header").map_err(Fail::Usage)?,
        datetime: None,
        description: None,
    }))
}
