// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq track`: acquire each requested PRN over a recording, then run the tracking
//! bank (DLL/PLL/FLL) over the whole recording, streaming the per-epoch output.
//!
//! The loops come from a loop design ([`crate::iq::track::design`]): `--design <file.toml>`
//! (`--design-name` picks one; the first is the default) or the built-in default, with any
//! explicit loop or acquisition flag (`--pll-bw`, `--dll-bw`, `--spacing`, `--coherent`,
//! `--acq-coherent`, ...) applied on top. Acquisition initialises each channel's code phase
//! and Doppler ([`crate::iq::track::ChannelInit::from_acquisition`]); the recording is then
//! replayed once through a [`TrackSession`], which runs the lock state machine (and, with
//! `--reacquire` or a design that asks for it, re-acquisition) and hands every loop update
//! to the outputs as it happens, so memory does not grow with the recording's length:
//!
//! * `--epochs <path>` — every epoch in the `kshana.track-epoch/1` record, as CSV, JSON
//!   Lines or binary (by `--epochs-format`, else the path's suffix);
//! * `--events <path>` — the lock-state events as JSON Lines;
//! * `--summary <path>` — per-channel metrics, the resolved design and its hash, as JSON;
//! * `--csv <path>` — the 0.32 per-epoch CSV (streamed);
//! * `--json <path>` — the 0.32 per-epoch JSON (held in memory: prefer `--epochs`).
//!
//! The front-end flags (`--bandpass`, `--notch`, `--blank`, `--excise`, `--agc`, `--bits`, as
//! `iq acquire` and `iq frontend` take them) put a fresh front-end chain in front of the
//! acquisition pass and of the tracking pass.

use super::acquire::{codes_from_args, read_samples};
use super::frontend::through_frontend;
use super::{open_input, Args, Fail};
use crate::iq::acq::acquire_peak;
use crate::iq::acq::samples_needed;
use crate::iq::signals::SignalCode;
use crate::iq::track::design::{Design, DesignFile};
use crate::iq::track::sink::{
    ChannelInfo, ChannelSummary, CollectSink, EpochFormat, EpochHeader, EpochSink, EventsWriter,
    Fanout, ResolvedRun, Summary,
};
use crate::iq::track::{
    commensurate_samples_per_chip, ChannelInit, EpochOutput, LockState, SessionChannel,
    TrackSession,
};
use crate::iq::{IqError, IqSource, SampleSpec, SpreadingCode};
use std::fs::File;
use std::io::{BufWriter, Write};
use std::sync::Arc;

/// The switches `track` and `sweep` take.
pub(crate) const TRACK_SWITCHES: &[&str] = &["--reacquire"];

/// Every value-less switch `iq track` and `iq sweep` take: their own and the front end's.
pub(crate) fn track_switches() -> Vec<&'static str> {
    TRACK_SWITCHES
        .iter()
        .chain(super::frontend::FRONTEND_SWITCHES)
        .copied()
        .collect()
}

/// The loop design the flags select: `--design` (and `--design-name`) or the built-in
/// default, with every explicit loop and acquisition flag applied on top. Returns the
/// design and the flags that overrode it.
pub(crate) fn design_from_args(a: &Args) -> Result<(Design, Vec<String>), Fail> {
    design_with(a, false)
}

/// The built-in default with only the acquisition flags applied: the hand-off of a
/// `sweep` whose loop flags are lists.
pub(crate) fn handoff_from_args(a: &Args) -> Result<Design, Fail> {
    let (toml, overridden) = overrides_from_args(a, true)?;
    if overridden.is_empty() {
        return Ok(Design::builtin_default());
    }
    Design::builtin_default()
        .with_overrides(&toml)
        .map_err(Fail::Usage)
}

fn design_with(a: &Args, acq_only: bool) -> Result<(Design, Vec<String>), Fail> {
    let base = match a.get("--design") {
        Some(p) => {
            let text = std::fs::read_to_string(p).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            let file = DesignFile::parse(&text).map_err(|e| Fail::Usage(format!("{p}: {e}")))?;
            file.select(a.get("--design-name"))
                .map_err(|e| Fail::Usage(format!("{p}: {e}")))?
                .clone()
        }
        None => {
            if a.get("--design-name").is_some() {
                return Err(Fail::Usage(
                    "--design-name needs --design <file.toml>".into(),
                ));
            }
            Design::builtin_default()
        }
    };
    let (toml, overridden) = overrides_from_args(a, acq_only)?;
    if overridden.is_empty() {
        return Ok((base, overridden));
    }
    let d = base.with_overrides(&toml).map_err(Fail::Usage)?;
    Ok((d, overridden))
}

/// The explicit flags as a design table in the file format, and their names.
pub(crate) fn overrides_from_args(a: &Args, acq_only: bool) -> Result<(String, Vec<String>), Fail> {
    let mut sections: Vec<(&str, Vec<String>)> = Vec::new();
    let mut flags = Vec::new();
    let mut put = |section: &'static str, key: &str, value: String, flag: &str| {
        flags.push(flag.to_string());
        match sections.iter_mut().find(|(s, _)| *s == section) {
            Some((_, v)) => v.push(format!("{key} = {value}")),
            None => sections.push((section, vec![format!("{key} = {value}")])),
        }
    };
    let f = |k: &str| a.num::<f64>(k).map_err(Fail::Usage);
    let u = |k: &str| a.num::<usize>(k).map_err(Fail::Usage);
    let float = |v: f64| format!("{v:?}");
    if !acq_only {
        if let Some(v) = f("--pll-bw")? {
            put("carrier", "pll_bw_hz", float(v), "--pll-bw");
        }
        if let Some(v) = f("--fll-bw")? {
            put("carrier", "fll_bw_hz", float(v), "--fll-bw");
        }
        if let Some(v) = f("--dll-bw")? {
            put("code", "bw_hz", float(v), "--dll-bw");
        }
        if let Some(v) = f("--spacing")? {
            put("integration", "spacing_chips", float(v), "--spacing");
        }
        if a.get("--extra-taps").is_some() {
            let taps = a.list::<f64>("--extra-taps").map_err(Fail::Usage)?;
            let body: Vec<String> = taps.iter().map(|v| float(*v)).collect();
            put(
                "integration",
                "extra_taps_chips",
                format!("[{}]", body.join(", ")),
                "--extra-taps",
            );
        }
        if let Some(v) = u("--coherent")? {
            put(
                "integration",
                "coherent_periods",
                v.max(1).to_string(),
                "--coherent",
            );
        }
        if a.has("--reacquire") {
            put("lock", "reacquire", "true".into(), "--reacquire");
        }
    }
    if let Some(v) = u("--acq-coherent")? {
        put(
            "acquisition",
            "coherent_periods",
            v.max(1).to_string(),
            "--acq-coherent",
        );
    }
    if let Some(v) = u("--acq-noncoherent")? {
        put(
            "acquisition",
            "noncoherent",
            v.max(1).to_string(),
            "--acq-noncoherent",
        );
    }
    if let Some(v) = f("--doppler-max")? {
        put("acquisition", "doppler_max_hz", float(v), "--doppler-max");
    }
    if let Some(v) = f("--doppler-step")? {
        put("acquisition", "doppler_step_hz", float(v), "--doppler-step");
    }
    if let Some(v) = f("--pfa")? {
        put("acquisition", "pfa", float(v), "--pfa");
    }
    let toml = sections
        .iter()
        .map(|(s, kv)| format!("[{s}]\n{}\n", kv.join("\n")))
        .collect::<String>();
    Ok((toml, flags))
}

/// Acquire each code over the start of `src` with `design`'s hand-off search and return a
/// tracking initialisation per code. `periods_per_bit` is carried into every channel
/// (`None` tracks a data-free signal).
pub(crate) fn acquire_inits(
    design: &Design,
    periods_per_bit: Option<usize>,
    spec: &SampleSpec,
    codes: &[SignalCode],
    src: &mut dyn IqSource,
) -> Result<Vec<ChannelInit>, Fail> {
    let cfg = design.acq_config(codes[0].period_s());
    let needed = codes
        .iter()
        .map(|c| samples_needed(spec, c, &cfg))
        .collect::<Result<Vec<_>, _>>()
        .map_err(Fail::Run)?;
    let max_needed = needed.iter().copied().max().unwrap_or(0);
    let samples = read_samples(src, max_needed)?;

    let mut inits = Vec::new();
    for (code, need) in codes.iter().zip(&needed) {
        if samples.len() < *need {
            return Err(Fail::Run(format!(
                "{}: recording holds {} samples, {need} needed to acquire",
                code.name(),
                samples.len()
            )));
        }
        let found = acquire_peak(&samples, spec, code, &cfg).map_err(Fail::Run)?;
        if !found.acquired {
            return Err(Fail::Run(format!(
                "{}: not acquired (statistic {:.2} < threshold {:.2}); raise --doppler-max, \
                 --acq-coherent or --acq-noncoherent, or check the recording",
                code.name(),
                found.statistic,
                found.threshold
            )));
        }
        let arc: Arc<dyn SpreadingCode + Send + Sync> = Arc::new(code.clone());
        inits.push(ChannelInit::from_acquisition(
            arc,
            &found,
            spec,
            0,
            periods_per_bit,
        ));
    }
    Ok(inits)
}

/// Open a file for writing, buffered.
pub(crate) fn create(p: &str) -> Result<BufWriter<File>, Fail> {
    File::create(p)
        .map(BufWriter::new)
        .map_err(|e| Fail::Run(format!("{p}: {e}")))
}

/// The extra correlator taps every design of a run asks for. One output file has one
/// column set, so the designs must agree.
pub(crate) fn run_extra_taps<'a>(
    designs: impl IntoIterator<Item = &'a Design>,
) -> Result<Vec<f64>, Fail> {
    let mut found: Option<(String, Vec<f64>)> = None;
    for d in designs {
        let taps = d.loop_config().extra_taps_chips;
        match &found {
            None => found = Some((d.name().to_string(), taps)),
            Some((first, t)) if *t != taps => {
                return Err(Fail::Usage(format!(
                    "designs {first:?} and {:?} differ in integration.extra_taps_chips; the \
                     designs of one run must agree so every output record has the same columns",
                    d.name()
                )))
            }
            Some(_) => {}
        }
    }
    Ok(found.map(|(_, t)| t).unwrap_or_default())
}

/// `--threads <N|auto>`: threads for the per-chunk channel correlation (default 1). The
/// output does not depend on it.
pub(crate) fn threads_from_args(a: &Args) -> Result<usize, Fail> {
    match a.get("--threads") {
        None => Ok(1),
        Some("auto") => Ok(std::thread::available_parallelism().map_or(1, |n| n.get())),
        Some(_) => match a.num::<usize>("--threads").map_err(Fail::Usage)? {
            Some(n) if n >= 1 => Ok(n),
            _ => Err(Fail::Usage(
                "--threads must be a positive integer or auto".into(),
            )),
        },
    }
}

/// The `--epochs` writer the flags ask for, if any.
pub(crate) fn epochs_writer(
    a: &Args,
    header: &EpochHeader,
) -> Result<Option<Box<dyn EpochSink>>, Fail> {
    let Some(p) = a.get("--epochs") else {
        if a.get("--epochs-format").is_some() {
            return Err(Fail::Usage("--epochs-format needs --epochs <path>".into()));
        }
        return Ok(None);
    };
    let fmt = match a.get("--epochs-format") {
        Some(f) => EpochFormat::parse(f).map_err(Fail::Usage)?,
        None => EpochFormat::from_path(p).ok_or_else(|| {
            Fail::Usage(format!(
                "--epochs {p}: name the format with --epochs-format csv|jsonl|bin, or end the \
                 path in .csv, .jsonl or .bin"
            ))
        })?,
    };
    Ok(Some(fmt.writer(create(p)?, header)?))
}

/// The 0.32 per-epoch CSV, streamed: a `code` column then the epoch's fields.
struct LegacyCsv<W: Write> {
    w: W,
    codes: Vec<String>,
}

impl<W: Write> EpochSink for LegacyCsv<W> {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, _: LockState) -> Result<(), IqError> {
        writeln!(self.w, "{}", epoch_row(&self.codes[channel], e))
            .map_err(|err| IqError::Io(err.to_string()))
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.w.flush().map_err(|e| IqError::Io(e.to_string()))
    }
}

/// The 0.32 CSV header.
const LEGACY_CSV_HEADER: &str = "code,epoch,sample_index,code_epoch_s,t_coh_s,doppler_hz,code_rate_hz,code_phase_chips,\
     i_prompt,q_prompt,dll_chips,pll_rad,fll_hz,pli,phase_lock,code_lock,cn0_nwpr_dbhz,cn0_beaulieu_dbhz";

/// One 0.32 CSV row for an epoch.
fn epoch_row(code: &str, e: &EpochOutput) -> String {
    let opt = |v: Option<f64>| v.map(|x| x.to_string()).unwrap_or_default();
    format!(
        "{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}",
        code,
        e.epoch,
        e.sample_index,
        e.code_epoch_s,
        e.t_coh_s,
        e.doppler_hz,
        e.code_rate_hz,
        e.code_phase_chips,
        e.prompt.re,
        e.prompt.im,
        e.disc.dll_chips,
        e.disc.pll_rad,
        e.disc.fll_hz,
        e.pli,
        e.phase_lock,
        e.code_lock,
        opt(e.cn0_nwpr_dbhz),
        opt(e.cn0_beaulieu_dbhz),
    )
}

/// Run `kshana iq track <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &track_switches()).map_err(Fail::Usage)?;
    a.need_pos(1, "track")?;
    // Optional receiver front end: a fresh chain in front of each pass, as `iq acquire`
    // applies it.
    let fe = super::frontend::FrontendParams::from_args(&a)?;
    let codes = codes_from_args(&a)?;
    let (design, overridden) = design_from_args(&a)?;

    // One pass to acquire, a fresh pass to track the whole recording.
    let opened = open_input(&a, 0)?;
    let spec = opened.source.spec();
    let mut acq_src = through_frontend(&fe, opened.source)?;
    let periods_per_bit: Option<usize> = a.num("--periods-per-bit").map_err(Fail::Usage)?;
    let inits = acquire_inits(&design, periods_per_bit, &spec, &codes, acq_src.as_mut())?;

    let max_samples = a
        .num::<f64>("--max-seconds")
        .map_err(Fail::Usage)?
        .map(|s| (s * spec.fs_hz).round() as u64);
    let track_rec = open_input(&a, 0)?;
    let tracked = max_samples.map_or(track_rec.n_samples, |m| m.min(track_rec.n_samples));
    let mut track_src = through_frontend(&fe, track_rec.source)?;

    let channels: Vec<SessionChannel> = inits
        .into_iter()
        .map(|i| SessionChannel::from_design(i, &design))
        .collect();
    let mut session = TrackSession::new(spec, channels)
        .map_err(Fail::Usage)?
        .with_threads(threads_from_args(&a)?);
    let names: Vec<String> = codes.iter().map(SignalCode::name).collect();
    let resolved: Vec<ResolvedRun> = codes
        .iter()
        .map(|c| design.resolved_run(c.period_s()))
        .collect();
    let header = EpochHeader::new(
        names
            .iter()
            .map(|c| ChannelInfo {
                code: c.clone(),
                design: design.name().to_string(),
                design_hash: design.hash().to_string(),
            })
            .collect(),
        spec.fs_hz,
    )
    .with_extra_taps(&run_extra_taps([&design])?)
    .with_resolved(resolved.clone());

    let warnings = sampling_warnings(&spec, &codes);
    let mut summary = Summary::new(0.5 * tracked as f64 / spec.fs_hz);
    let mut epochs = epochs_writer(&a, &header)?;
    let mut events = a
        .get("--events")
        .map(|p| create(p).map(EventsWriter::new))
        .transpose()?;
    let mut legacy_csv = match a.get("--csv") {
        Some(p) => {
            let mut w = create(p)?;
            writeln!(w, "{LEGACY_CSV_HEADER}").map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            Some(LegacyCsv {
                w,
                codes: names.clone(),
            })
        }
        None => None,
    };
    let mut collect = a.get("--json").map(|_| CollectSink::default());
    {
        let mut fan = Fanout::new();
        fan.push(&mut summary);
        if let Some(w) = epochs.as_deref_mut() {
            fan.push(w);
        }
        if let Some(w) = events.as_mut() {
            fan.push(w);
        }
        if let Some(w) = legacy_csv.as_mut() {
            fan.push(w);
        }
        if let Some(c) = collect.as_mut() {
            fan.push(c);
        }
        session.run(track_src.as_mut(), max_samples, &mut fan)?;
    }

    if let (Some(p), Some(c)) = (a.get("--json"), collect) {
        std::fs::write(p, legacy_json(&spec, &names, &c))
            .map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(p) = a.get("--summary") {
        let v = summary_json(
            &spec,
            tracked,
            &[(&design, &names)],
            &resolved,
            &overridden,
            &summary,
            &warnings,
        );
        std::fs::write(p, serde_json::to_string_pretty(&v).unwrap_or_default())
            .map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    Ok(table(&names, &summary.channels) + &warning_lines(&warnings))
}

/// The `commensurate_sampling` warnings for `codes` on a stream sampled as `spec`: one per
/// distinct chip rate whose samples per chip is a multiple of 1/2 (see
/// [`commensurate_samples_per_chip`]).
pub(crate) fn sampling_warnings(spec: &SampleSpec, codes: &[SignalCode]) -> Vec<serde_json::Value> {
    let mut seen: Vec<f64> = Vec::new();
    let mut out = Vec::new();
    for c in codes {
        let rate = c.chip_rate_hz();
        if seen.contains(&rate) {
            continue;
        }
        seen.push(rate);
        if let Some(r) = commensurate_samples_per_chip(spec.fs_hz, rate) {
            out.push(serde_json::json!({
                "kind": "commensurate_sampling",
                "fs_hz": spec.fs_hz,
                "chip_rate_hz": rate,
                "samples_per_chip": r,
                "message": format!(
                    "{} Hz is {r} samples per chip of {}: commensurate sampling turns the code \
                     discriminator into a staircase (at 2 samples/chip the DLL dithers, about \
                     0.09 chip RMS code error at 45 dB-Hz); code-loop jitter and bias from this \
                     recording are not representative. Use a rate that is not a multiple of half \
                     the chip rate to judge code loops.",
                    spec.fs_hz,
                    c.name()
                ),
            }));
        }
    }
    out
}

/// The warnings as lines for the command's printed output.
pub(crate) fn warning_lines(w: &[serde_json::Value]) -> String {
    w.iter()
        .filter_map(|v| v["message"].as_str())
        .map(|m| format!("\nwarning: {m}"))
        .collect()
}

/// One channel's summary as JSON.
pub(crate) fn channel_json(
    channel: usize,
    code: &str,
    design: &Design,
    resolved: Option<&ResolvedRun>,
    c: &ChannelSummary,
) -> serde_json::Value {
    let last = c.last.as_ref();
    serde_json::json!({
        "channel": channel,
        "code": code,
        "design": design.name(),
        "design_hash": design.hash(),
        "resolved": resolved,
        "epochs": c.epochs,
        "tracked_s": last.map(|l| l.code_epoch_s),
        "final_doppler_hz": last.map(|l| l.doppler_hz),
        "final_code_phase_chips": last.map(|l| l.code_phase_chips),
        "final_cn0_dbhz": last.and_then(|l| l.cn0_nwpr_dbhz),
        "mean_cn0_dbhz": c.mean_cn0_dbhz,
        "phase_lock_fraction": c.phase_lock_fraction(),
        "code_lock_fraction": c.code_lock_fraction(),
        "locked_fraction": c.locked_fraction(),
        "locked_at_end": c.locked_at_end(),
        "final_state": c.final_state.map(|s| s.as_str()),
        "transitions": c.transitions,
        "false_locks": c.false_locks,
        "reacquisitions": c.reacquisitions,
        "phase_jitter_deg": c.phase_jitter_deg,
        "code_jitter_chips": c.code_jitter_chips,
    })
}

/// The `--summary` document. `groups` lists each design with the codes it tracked, in
/// channel order.
pub(crate) fn summary_json(
    spec: &SampleSpec,
    tracked: u64,
    groups: &[(&Design, &[String])],
    resolved: &[ResolvedRun],
    overridden: &[String],
    summary: &Summary,
    warnings: &[serde_json::Value],
) -> serde_json::Value {
    let mut chans = Vec::new();
    let mut idx = 0;
    for (design, codes) in groups {
        for code in codes.iter() {
            let c = summary.channels.get(idx).cloned().unwrap_or_default();
            chans.push(channel_json(idx, code, design, resolved.get(idx), &c));
            idx += 1;
        }
    }
    serde_json::json!({
        "schema": "kshana.track-summary/1",
        "engine_version": env!("CARGO_PKG_VERSION"),
        "sample_rate_hz": spec.fs_hz,
        "samples_tracked": tracked,
        "designs": groups.iter().map(|(d, _)| d.to_json()).collect::<Vec<_>>(),
        "overridden_by_flags": overridden,
        "warnings": warnings,
        "channels": chans,
    })
}

/// The 0.32 per-epoch JSON.
fn legacy_json(spec: &SampleSpec, names: &[String], c: &CollectSink) -> String {
    let chans: Vec<serde_json::Value> = names
        .iter()
        .enumerate()
        .map(|(i, code)| {
            let epochs: Vec<serde_json::Value> = c
                .channels
                .get(i)
                .map(|v| v.iter().map(|(e, _)| epoch_json(e)).collect())
                .unwrap_or_default();
            serde_json::json!({ "code": code, "epochs": epochs })
        })
        .collect();
    let v = serde_json::json!({
        "sample_rate_hz": spec.fs_hz,
        "channels": chans,
    });
    serde_json::to_string_pretty(&v).unwrap_or_default()
}

/// One epoch as a JSON value (the 0.32 shape).
fn epoch_json(e: &EpochOutput) -> serde_json::Value {
    serde_json::json!({
        "epoch": e.epoch,
        "sample_index": e.sample_index,
        "code_epoch_s": e.code_epoch_s,
        "t_coh_s": e.t_coh_s,
        "doppler_hz": e.doppler_hz,
        "code_rate_hz": e.code_rate_hz,
        "code_phase_chips": e.code_phase_chips,
        "i_prompt": e.prompt.re,
        "q_prompt": e.prompt.im,
        "dll_chips": e.disc.dll_chips,
        "pll_rad": e.disc.pll_rad,
        "fll_hz": e.disc.fll_hz,
        "pli": e.pli,
        "phase_lock": e.phase_lock,
        "code_lock": e.code_lock,
        "cn0_nwpr_dbhz": e.cn0_nwpr_dbhz,
        "cn0_beaulieu_dbhz": e.cn0_beaulieu_dbhz,
    })
}

/// A last-epoch summary table across the channels.
fn table(names: &[String], channels: &[ChannelSummary]) -> String {
    let mut out = String::from(
        "code\tepochs\tfinal_doppler_hz\tfinal_cn0_nwpr\tphase_lock_frac\tcode_lock_frac\tfinal_state\n",
    );
    for (i, code) in names.iter().enumerate() {
        let c = channels.get(i).cloned().unwrap_or_default();
        let last = c.last.as_ref();
        out.push_str(&format!(
            "{}\t{}\t{}\t{}\t{:.3}\t{:.3}\t{}\n",
            code,
            c.epochs,
            last.map(|e| format!("{:.1}", e.doppler_hz))
                .unwrap_or_else(|| "-".into()),
            last.and_then(|e| e.cn0_nwpr_dbhz)
                .map(|v| format!("{v:.1}"))
                .unwrap_or_else(|| "-".into()),
            c.phase_lock_fraction(),
            c.code_lock_fraction(),
            c.final_state.map(|s| s.as_str()).unwrap_or("-"),
        ));
    }
    out.pop();
    out
}
