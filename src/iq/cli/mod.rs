// SPDX-License-Identifier: AGPL-3.0-only
//! The processing half of the `kshana iq` command group: `scene`, `acquire`, `track`,
//! `sweep`, `labfit` and `frontend`.
//!
//! [`run`] takes the arguments after `iq` and returns a process exit code (0 success,
//! 1 failure, 2 usage error). It owns the signal-processing commands and hands every
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
//!   ([`frontend`]);
//! * `monitor` — run the interference and spoofing detection monitors over a recording
//!   and write their time series and events ([`monitor`]).
//!
//! The parsing style, the exit codes and the `--format`/`--rate`/`--center` raw-input flags
//! mirror [`super::io::cli`] exactly.

mod acquire;
mod campaign;
mod channel;
mod frontend;
mod labfit;
mod monitor;
mod scene;
mod sweep;
mod track;

pub use crate::iq::signals::by_name::build_code;
// Re-exported for the Python bindings, which build and generate a scene in-process.
#[cfg(feature = "python")]
pub(crate) use channel::{build_channel, ChannelParams};
// Also used by the campaign runner, which applies the same front-end chains.
pub(crate) use frontend::{apply_chain, build_chain, FrontendParams};
#[cfg(feature = "python")]
pub(crate) use monitor::{parse_args as monitor_parse_args, report_from_args as monitor_report};
#[cfg(feature = "python")]
pub(crate) use scene::{build_broadcast_scene, build_scene, BroadcastParams, SceneParams};
#[cfg(feature = "python")]
pub(crate) use track::sampling_warnings;
#[cfg(feature = "python")]
pub(crate) use Fail as CliFail;

use std::collections::HashMap;

/// Usage text of the processing commands, printed above [`super::io::cli::USAGE`].
pub(crate) fn usage() -> String {
    crate::t!("iq-cli-usage")
}

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
                let v = args
                    .get(i + 1)
                    .ok_or(crate::t!("iq-cli-needs-value", s = s))?;
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
                v.parse::<T>().map_err(|_| {
                    crate::terr!("e-iq-cli-cannot-parse", k = k, v = format!("{:?}", v))
                })
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
            return Err(Fail::Usage(crate::t!(
                "iq-cli-iq-takes-positional-argument-got",
                cmd = cmd,
                n = n,
                pos = self.pos.len()
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
                    p.trim().parse::<T>().map_err(|_| {
                        crate::terr!("e-iq-cli-cannot-parse-2", k = k, p = format!("{:?}", p))
                    })
                })
                .collect(),
        }
    }
}

/// The GNSS signal names the `scene`, `acquire`, `track` and `sweep` commands (and the
/// Python and MCP surfaces) accept, in help-text order.
pub fn signal_names() -> &'static [&'static str] {
    crate::iq::signals::by_name::SIGNAL_NAMES
}

/// Why [`execute`] did not complete a command.
#[derive(Clone, Debug, PartialEq, Eq)]
pub enum CommandError {
    /// The command was invoked wrongly (the CLI's exit code 2).
    Usage(String),
    /// The command was valid but could not complete (the CLI's exit code 1).
    Run(String),
}

impl std::fmt::Display for CommandError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CommandError::Usage(m) => f.write_str(&crate::t!("iq-cli-usage-error", m = m)),
            CommandError::Run(m) => f.write_str(m),
        }
    }
}

impl std::error::Error for CommandError {}

/// Run one processing command (`scene`, `acquire`, `track`, `sweep`, `labfit`, `frontend`,
/// `campaign` or `conditions`, then its arguments exactly as the CLI takes them) in-process, and return
/// the message the CLI would print instead of printing it. Files are written exactly as
/// the CLI writes them. This is the seam an embedding surface (the MCP server) drives, so
/// it runs the same code path as `kshana iq` with nothing on stdout or stderr.
///
/// The argument grammar is public API: it is exactly the CLI's (see `kshana iq --help`),
/// and changes to it are CLI-compatible and additive only, so a caller written against one
/// release keeps working on the next.
pub fn execute(args: &[String]) -> Result<String, CommandError> {
    let rest = args.get(1..).unwrap_or_default();
    let r = match args.first().map(String::as_str) {
        Some("scene") => scene::run(rest),
        Some("acquire") => acquire::run(rest),
        Some("track") => track::run(rest),
        Some("sweep") => sweep::run(rest),
        Some("labfit") => labfit::run(rest),
        Some("frontend") => frontend::run(rest),
        Some("monitor") => monitor::run(rest),
        Some("campaign") => campaign::run(rest),
        Some("conditions") => campaign::conditions(rest),
        Some(other) => Err(Fail::Usage(crate::t!(
            "iq-cli-unknown-iq-processing-command-expected",
            other = format!("{:?}", other)
        ))),
        None => Err(Fail::Usage(crate::terr!(
            "e-iq-cli-no-iq-processing-command-given"
        ))),
    };
    r.map_err(|f| match f {
        Fail::Usage(m) => CommandError::Usage(m),
        Fail::Run(m) => CommandError::Run(m),
    })
}

/// Run a `kshana iq` processing command; delegate every other command to
/// [`super::io::cli::run`]. Returns the process exit code (0, 1 or 2).
pub fn run(args: &[String]) -> i32 {
    match args.first().map(String::as_str) {
        None => {
            eprintln!("{}\n{}", usage(), super::io::cli::usage());
            2
        }
        Some("--help" | "-h" | "help") => {
            println!("{}\n{}", usage(), super::io::cli::usage());
            0
        }
        Some(
            "scene" | "acquire" | "track" | "sweep" | "labfit" | "frontend" | "monitor"
            | "campaign" | "conditions",
        ) => finish(execute(args)),
        // Every data-handling command belongs to the io half of the group.
        Some(_) => super::io::cli::run(args),
    }
}

/// Turn a command's result into an exit code, printing the message or the error.
fn finish(r: Result<String, CommandError>) -> i32 {
    match r {
        Ok(msg) => {
            println!("{msg}");
            0
        }
        Err(CommandError::Usage(m)) => {
            eprintln!("{}\n{}", crate::t!("main-fail", e = m), usage());
            2
        }
        Err(CommandError::Run(m)) => {
            eprintln!("{}", crate::t!("main-fail", e = m));
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
            .ok_or(Fail::Usage(crate::terr!("e-iq-io-cli-format-needs-rate")))?,
        center_hz: a.num("--center").map_err(Fail::Usage)?,
        if_hz: a.num("--if").map_err(Fail::Usage)?,
        header_bytes: a.num("--header").map_err(Fail::Usage)?,
        channels: a.num("--channels").map_err(Fail::Usage)?,
        channel: None,
        datetime: None,
        description: None,
    }))
}

/// Open the recording named by positional argument `pos`, honouring the raw-input flags
/// ([`raw_sidecar`]) and `--channel <k>` (the stream of a multi-channel recording).
pub(crate) fn open_input(
    a: &Args,
    pos: usize,
) -> Result<crate::iq::io::inventory::OpenedRecording, Fail> {
    let path = a
        .pos
        .get(pos)
        .ok_or_else(|| Fail::Usage(crate::terr!("e-iq-cli-missing-recording-path")))?;
    Ok(crate::iq::io::inventory::open_recording_with(
        std::path::Path::new(path),
        raw_sidecar(a)?,
        a.num("--channel").map_err(Fail::Usage)?,
    )?)
}
