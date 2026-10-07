// SPDX-License-Identifier: AGPL-3.0-only
//! The `kshana iq` command group: inventory, info, extract, convert, decimate.
//!
//! [`run`] takes the arguments after `iq` and returns a process exit code (0 success,
//! 1 failure, 2 usage error); the binary only dispatches to it. Inputs are anything
//! [`super::inventory::open_recording`] opens. An output path ending in `.sigmf-meta`,
//! `.sigmf-data` or `.sigmf` is written as a SigMF pair (one capture, at the source's
//! centre frequency); any other path is written raw with a JSON sidecar at `<out>.json`.

use super::format::SampleFormat;
use super::inventory::{
    open_recording_with, scan_dir, write_sidecar, InventoryEntry, InventoryOptions, RawSidecar,
};
use super::report::{rows_to_csv, rows_to_json};
use super::resample::{PolyphaseResampler, RealIfToBaseband, ResampledSource};
use super::sigmf_stream::{meta_for, sigmf_paths};
use super::stream::{copy_samples, create_raw, skip_samples};
use crate::iq::{IqError, IqSink, IqSource};
use std::collections::HashMap;
use std::path::{Path, PathBuf};

/// Usage text of the `kshana iq` command group.
pub const USAGE: &str = "usage: kshana iq inventory <dir> [--recursive] [--no-hash] [--workers <n>] [--json <out.json>] [--csv <out.csv>]
   or: kshana iq info <recording>
   or: kshana iq extract <in> <out> --start <s> --duration <s> [--to <format>]
   or: kshana iq convert <in> <out> --to <format> [--gain <g>]
   or: kshana iq decimate <in> <out> (--factor <d> | --up <l> --down <m>) [--to <format>] [--if-hz <hz>] [--invert]
 raw inputs without a sidecar also take: --format <format> --rate <hz> [--center <hz>] [--if <hz>] [--header <bytes>] [--channels <n>]
 multi-stream inputs (multi-channel SigMF, interleaved raw) take --channel <k> (from 0; default 0)
 formats: ci8 cu8 ci16_le ci16_be cf32_le cf32_be, 12-bit in 16 ci12r_le ci12l_be ..., packed 4-bit ci4_msb cu4_lsb ..., packed 2-bit c2tc_msb c2sm_lsb r2ob_msb ..., 2-bit per byte c2sm_byte ..., real r..., Q-first ..._qi";

const CHUNK_SAMPLES: usize = 1 << 14;
const VALUE_FLAGS: &[&str] = &[
    "--workers",
    "--json",
    "--csv",
    "--start",
    "--duration",
    "--to",
    "--gain",
    "--factor",
    "--up",
    "--down",
    "--if-hz",
    "--format",
    "--rate",
    "--center",
    "--if",
    "--header",
    "--channels",
    "--channel",
];
const SWITCHES: &[&str] = &["--recursive", "--no-hash", "--invert"];

struct Args {
    pos: Vec<String>,
    opts: HashMap<String, String>,
    switches: Vec<String>,
}

impl Args {
    fn parse(args: &[String]) -> Result<Args, String> {
        let mut a = Args {
            pos: Vec::new(),
            opts: HashMap::new(),
            switches: Vec::new(),
        };
        let mut i = 0;
        while i < args.len() {
            let s = args[i].as_str();
            if VALUE_FLAGS.contains(&s) {
                let v = args.get(i + 1).ok_or(format!("{s} needs a value"))?;
                a.opts.insert(s.to_string(), v.clone());
                i += 2;
            } else if SWITCHES.contains(&s) {
                a.switches.push(s.to_string());
                i += 1;
            } else if s.starts_with("--") {
                return Err(format!("unknown option {s}"));
            } else {
                a.pos.push(s.to_string());
                i += 1;
            }
        }
        Ok(a)
    }

    fn num<T: std::str::FromStr>(&self, k: &str) -> Result<Option<T>, String> {
        self.opts
            .get(k)
            .map(|v| {
                v.parse::<T>()
                    .map_err(|_| format!("{k}: cannot parse {v:?}"))
            })
            .transpose()
    }

    fn has(&self, k: &str) -> bool {
        self.switches.iter().any(|s| s == k)
    }

    fn raw(&self) -> Result<Option<RawSidecar>, String> {
        let Some(format) = self.opts.get("--format") else {
            return Ok(None);
        };
        Ok(Some(RawSidecar {
            format: format.clone(),
            sample_rate_hz: self.num("--rate")?.ok_or("--format needs --rate")?,
            center_hz: self.num("--center")?,
            if_hz: self.num("--if")?,
            header_bytes: self.num("--header")?,
            channels: self.num("--channels")?,
            channel: None,
            datetime: None,
            description: None,
        }))
    }
}

enum Fail {
    Usage(String),
    Run(String),
}

impl From<IqError> for Fail {
    fn from(e: IqError) -> Self {
        Fail::Run(e.to_string())
    }
}

/// Run `kshana iq <args>`; returns the exit code.
pub fn run(args: &[String]) -> i32 {
    let r = match args.first().map(String::as_str) {
        None | Some("--help" | "-h" | "help") => {
            println!("{USAGE}");
            return if args.is_empty() { 2 } else { 0 };
        }
        Some(cmd) => Args::parse(&args[1..])
            .map_err(Fail::Usage)
            .and_then(|a| dispatch(cmd, &a)),
    };
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

fn need_pos(a: &Args, n: usize, cmd: &str) -> Result<(), Fail> {
    if a.pos.len() != n {
        return Err(Fail::Usage(format!(
            "iq {cmd} takes {n} path argument(s), got {}",
            a.pos.len()
        )));
    }
    Ok(())
}

fn dispatch(cmd: &str, a: &Args) -> Result<String, Fail> {
    match cmd {
        "inventory" => {
            need_pos(a, 1, cmd)?;
            let opts = InventoryOptions {
                recursive: a.has("--recursive"),
                hash: !a.has("--no-hash"),
                workers: a.num("--workers").map_err(Fail::Usage)?.unwrap_or(0),
            };
            let rows = scan_dir(Path::new(&a.pos[0]), opts)?;
            if let Some(p) = a.opts.get("--json") {
                std::fs::write(p, rows_to_json(&rows)?)
                    .map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            }
            if let Some(p) = a.opts.get("--csv") {
                std::fs::write(p, rows_to_csv(&rows)?)
                    .map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            }
            Ok(inventory_table(&rows))
        }
        "info" => {
            need_pos(a, 1, cmd)?;
            let p = Path::new(&a.pos[0]);
            let mut e = super::inventory::inventory_entry(p, true);
            let channel = a.num("--channel").map_err(Fail::Usage)?;
            let raw = a.raw().map_err(Fail::Usage)?;
            if (e.format.is_none() && raw.is_some()) || channel.is_some() {
                let o = open_recording_with(p, raw, channel)?;
                let spec = o.source.spec();
                e.format = Some(o.format_label.clone());
                e.channels = o.channels.0;
                e.sample_rate_hz = Some(spec.fs_hz);
                e.n_samples = Some(o.n_samples);
                e.duration_s = Some(o.n_samples as f64 / spec.fs_hz);
                e.captures = o.boundaries;
                e.error = None;
            }
            serde_json::to_string_pretty(&e).map_err(|e| Fail::Run(e.to_string()))
        }
        "extract" | "convert" | "decimate" => {
            need_pos(a, 2, cmd)?;
            let input = open_recording_with(
                Path::new(&a.pos[0]),
                a.raw().map_err(Fail::Usage)?,
                a.num("--channel").map_err(Fail::Usage)?,
            )?;
            let to = match a.opts.get("--to") {
                Some(t) => SampleFormat::parse(t)?,
                None if cmd == "convert" => {
                    return Err(Fail::Usage("iq convert needs --to <format>".into()))
                }
                None => input.format,
            };
            let gain: f64 = a.num("--gain").map_err(Fail::Usage)?.unwrap_or(1.0);
            let mut src = input.source;
            let mut limit = None;
            if cmd == "extract" {
                let start: f64 = a
                    .num("--start")
                    .map_err(Fail::Usage)?
                    .ok_or(Fail::Usage("iq extract needs --start".into()))?;
                let dur: f64 = a
                    .num("--duration")
                    .map_err(Fail::Usage)?
                    .ok_or(Fail::Usage("iq extract needs --duration".into()))?;
                if !(start >= 0.0 && dur >= 0.0) {
                    return Err(Fail::Usage(
                        "--start and --duration must be non-negative".into(),
                    ));
                }
                let spec = src.spec();
                skip_samples(src.as_mut(), spec.samples_in(start) as u64, CHUNK_SAMPLES)?;
                limit = Some(spec.samples_in(dur) as u64);
            }
            if cmd == "decimate" {
                src = decimator(src, input.format.is_complex(), a)?;
            }
            write_output(Path::new(&a.pos[1]), src.as_mut(), to, gain, limit)
        }
        other => Err(Fail::Usage(format!("unknown iq command {other:?}"))),
    }
}

/// A boxed source as a sized [`IqSource`], so the generic adapters can wrap it.
struct Boxed(Box<dyn IqSource + Send>);

impl IqSource for Boxed {
    fn spec(&self) -> crate::iq::SampleSpec {
        self.0.spec()
    }
    fn read(&mut self, buf: &mut [crate::iq::Cf64]) -> Result<usize, IqError> {
        self.0.read(buf)
    }
}

fn decimator(
    src: Box<dyn IqSource + Send>,
    complex: bool,
    a: &Args,
) -> Result<Box<dyn IqSource + Send>, Fail> {
    let factor: Option<usize> = a.num("--factor").map_err(Fail::Usage)?;
    let up: Option<usize> = a.num("--up").map_err(Fail::Usage)?;
    let down: Option<usize> = a.num("--down").map_err(Fail::Usage)?;
    if !complex {
        let d = factor.ok_or(Fail::Usage(
            "a real input is converted to complex baseband: give --factor <d> (>= 2)".into(),
        ))?;
        let if_hz = match a.num::<f64>("--if-hz").map_err(Fail::Usage)? {
            Some(f) => f,
            None => src.spec().if_hz,
        };
        let c =
            RealIfToBaseband::new(Boxed(src), if_hz, d, CHUNK_SAMPLES)?.inverted(a.has("--invert"));
        return Ok(Box::new(c));
    }
    let rs = match (factor, up, down) {
        (Some(d), None, None) => PolyphaseResampler::decimator(d)?,
        (None, Some(l), Some(m)) => PolyphaseResampler::new(l, m)?,
        _ => {
            return Err(Fail::Usage(
                "iq decimate needs --factor <d>, or --up <l> and --down <m>".into(),
            ))
        }
    };
    Ok(Box::new(ResampledSource::new(
        Boxed(src),
        rs,
        CHUNK_SAMPLES,
    )))
}

fn write_output(
    out: &Path,
    src: &mut (dyn IqSource + Send),
    to: SampleFormat,
    gain: f64,
    limit: Option<u64>,
) -> Result<String, Fail> {
    let spec = src.spec();
    let s = out.to_string_lossy();
    let sigmf = [".sigmf-meta", ".sigmf-data", ".sigmf"]
        .iter()
        .any(|e| s.ends_with(e));
    let (data_path, meta) = if sigmf {
        let (mp, dp) = sigmf_paths(out);
        let m = meta_for(
            to,
            spec.fs_hz,
            &[(0, Some(spec.center_hz), None)],
            "written by kshana iq",
        )?;
        (dp, Some((mp, m)))
    } else {
        (out.to_path_buf(), None)
    };
    let mut w = create_raw(&data_path, to)?.with_scale(1.0 / gain);
    let n = copy_samples(src, &mut w, limit, CHUNK_SAMPLES)?;
    w.finish()?;
    let mut files: Vec<PathBuf> = vec![data_path.clone()];
    match meta {
        Some((mp, m)) => {
            let json = crate::sigmf::meta_to_json(&m).map_err(Fail::Run)?;
            std::fs::write(&mp, json).map_err(|e| Fail::Run(format!("{}: {e}", mp.display())))?;
            files.push(mp);
        }
        None => {
            let sc = RawSidecar {
                format: to.name(),
                sample_rate_hz: spec.fs_hz,
                center_hz: Some(spec.center_hz),
                if_hz: (spec.if_hz != 0.0).then_some(spec.if_hz),
                header_bytes: None,
                channels: None,
                channel: None,
                datetime: None,
                description: Some("written by kshana iq".into()),
            };
            files.push(write_sidecar(&data_path, &sc)?);
        }
    }
    Ok(format!(
        "wrote {n} samples ({to}, {} Hz) to {}; {} saturated element(s){}",
        spec.fs_hz,
        files
            .iter()
            .map(|p| p.display().to_string())
            .collect::<Vec<_>>()
            .join(", "),
        w.clipped(),
        if w.padded_elements() > 0 {
            format!(
                "; last byte padded with {} packed slot(s)",
                w.padded_elements()
            )
        } else {
            String::new()
        }
    ))
}

fn inventory_table(rows: &[InventoryEntry]) -> String {
    let mut out = format!("{} recording(s)\n", rows.len());
    out.push_str("path\tformat\trate_hz\tduration_s\tsize_bytes\tcaptures\tsha256\terror\n");
    for r in rows {
        out.push_str(&format!(
            "{}\t{}\t{}\t{}\t{}\t{}\t{}\t{}\n",
            r.path,
            r.format.as_deref().unwrap_or("-"),
            r.sample_rate_hz
                .map(|v| v.to_string())
                .unwrap_or("-".into()),
            r.duration_s
                .map(|v| format!("{v:.6}"))
                .unwrap_or("-".into()),
            r.size_bytes,
            r.captures.len(),
            if r.sha256.is_empty() {
                "-".to_string()
            } else {
                r.sha256.join("+")
            },
            r.error.as_deref().unwrap_or("")
        ));
    }
    out.pop();
    out
}
