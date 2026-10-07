// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq sweep`: replay one recording across several tracking-loop designs and report
//! the resulting jitter and lock metrics per design.
//!
//! The recording is read once, streamed through a [`crate::iq::track::TrackSession`] that
//! holds one channel per (design, PRN) pair, so each design's result is exactly that of
//! running it alone and memory does not grow with the recording's length. The designs are
//! every design of a loop-design file (`--design <file.toml>`), or the full product of the
//! carrier (PLL) bandwidth, code (DLL) bandwidth, early-late spacing and integration-length
//! lists on the built-in default. Per design and PRN the command reports the steady-state
//! carrier-phase and code jitter (over the updates in the second half of the run's
//! duration), the phase- and code-lock fractions, the mean C/N0 and the design's hash;
//! `--epochs`/`--events` stream the per-epoch records and lock events as `iq track` does.

use super::acquire::codes_from_args;
use super::track::{
    acquire_inits, create, epochs_writer, handoff_from_args, sampling_warnings, warning_lines,
    TRACK_SWITCHES,
};
use super::{raw_sidecar, Args, Fail};
use crate::iq::io::inventory::open_recording;
use crate::iq::track::design::{Design, DesignFile};
use crate::iq::track::sink::{ChannelInfo, EpochHeader, EventsWriter, Fanout, Summary};
use crate::iq::track::{SessionChannel, TrackSession};
use crate::iq::SpreadingCode;
use std::path::Path;

/// A list flag, or a single default value when the flag is absent.
fn axis(a: &Args, key: &str, default: f64) -> Result<Vec<f64>, Fail> {
    let v: Vec<f64> = a.list(key).map_err(Fail::Usage)?;
    Ok(if v.is_empty() { vec![default] } else { v })
}

/// The designs to sweep: every design of `--design <file.toml>`, or the full product of
/// the `--pll-bw`, `--dll-bw`, `--spacing` and `--coherent` lists on the built-in default.
pub(crate) fn designs(a: &Args) -> Result<Vec<Design>, Fail> {
    if let Some(p) = a.get("--design") {
        for k in [
            "--pll-bw",
            "--dll-bw",
            "--spacing",
            "--coherent",
            "--design-name",
        ] {
            if a.get(k).is_some() {
                return Err(Fail::Usage(format!(
                    "{k} cannot be combined with --design: sweep runs every design in the file"
                )));
            }
        }
        let text = std::fs::read_to_string(p).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
        let file = DesignFile::parse(&text).map_err(|e| Fail::Usage(format!("{p}: {e}")))?;
        return Ok(file.designs().to_vec());
    }
    let base = Design::builtin_default();
    let pll_bws = axis(a, "--pll-bw", 15.0)?;
    let dll_bws = axis(a, "--dll-bw", base.loop_config().dll_bn_hz)?;
    let spacings = axis(a, "--spacing", base.loop_config().spacing_chips)?;
    let coherents: Vec<usize> = {
        let v: Vec<usize> = a.list("--coherent").map_err(Fail::Usage)?;
        if v.is_empty() {
            vec![base.loop_config().coherent_periods]
        } else {
            v
        }
    };
    let mut out = Vec::new();
    for &pll in &pll_bws {
        for &dll in &dll_bws {
            for &sp in &spacings {
                for &coh in &coherents {
                    let coh = coh.max(1);
                    let d = base
                        .with_overrides(&format!(
                            "[carrier]\npll_bw_hz = {pll:?}\n[code]\nbw_hz = {dll:?}\n\
                             [integration]\nspacing_chips = {sp:?}\ncoherent_periods = {coh}\n"
                        ))
                        .map_err(Fail::Usage)?;
                    out.push(d.renamed(&format!("pll{pll}_dll{dll}_sp{sp}_coh{coh}")));
                }
            }
        }
    }
    Ok(out)
}

/// The steady-state metrics of one (design, PRN) channel.
pub(crate) struct Metrics {
    design: String,
    design_hash: String,
    code: String,
    epochs: u64,
    phase_jitter_deg: f64,
    code_jitter_chips: f64,
    phase_lock_frac: f64,
    code_lock_frac: f64,
    mean_cn0_dbhz: f64,
}

/// Run `kshana iq sweep <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, TRACK_SWITCHES).map_err(Fail::Usage)?;
    a.need_pos(1, "sweep")?;
    let path = Path::new(&a.pos[0]);
    let codes = codes_from_args(&a)?;
    let designs = designs(&a)?;

    // The hand-off uses the first design's acquisition (with any acquisition flags).
    let mut opened = open_recording(path, raw_sidecar(&a)?)?;
    let spec = opened.source.spec();
    let handoff = if a.get("--design").is_some() {
        designs[0].clone()
    } else {
        handoff_from_args(&a)?
    };
    let periods_per_bit: Option<usize> = a.num("--periods-per-bit").map_err(Fail::Usage)?;
    let inits = acquire_inits(
        &handoff,
        periods_per_bit,
        &spec,
        &codes,
        opened.source.as_mut(),
    )?;

    let max_samples = a
        .num::<f64>("--max-seconds")
        .map_err(Fail::Usage)?
        .map(|s| (s * spec.fs_hz).round() as u64);
    let mut track_src = open_recording(path, raw_sidecar(&a)?)?;
    let tracked = max_samples.map_or(track_src.n_samples, |m| m.min(track_src.n_samples));

    // One channel per (design, PRN), design-major, all on one read of the recording.
    let mut channels = Vec::new();
    let mut infos = Vec::new();
    for d in &designs {
        let d = if a.has("--reacquire") {
            d.with_overrides("[lock]\nreacquire = true\n")
                .map_err(Fail::Usage)?
        } else {
            d.clone()
        };
        for (init, code) in inits.iter().zip(&codes) {
            channels.push(SessionChannel::from_design(init.clone(), &d));
            infos.push(ChannelInfo {
                code: code.name(),
                design: d.name().to_string(),
                design_hash: d.hash().to_string(),
            });
        }
    }
    let mut session = TrackSession::new(spec, channels).map_err(Fail::Usage)?;
    let header = EpochHeader::new(infos.clone(), spec.fs_hz);
    let mut summary = Summary::new(0.5 * tracked as f64 / spec.fs_hz);
    let mut epochs = epochs_writer(&a, &header)?;
    let mut events = a
        .get("--events")
        .map(|p| create(p).map(EventsWriter::new))
        .transpose()?;
    {
        let mut fan = Fanout::new();
        fan.push(&mut summary);
        if let Some(w) = epochs.as_deref_mut() {
            fan.push(w);
        }
        if let Some(w) = events.as_mut() {
            fan.push(w);
        }
        session.run(track_src.source.as_mut(), max_samples, &mut fan)?;
    }

    let rows: Vec<Metrics> = infos
        .iter()
        .enumerate()
        .map(|(i, info)| {
            let c = summary.channels.get(i).cloned().unwrap_or_default();
            Metrics {
                design: info.design.clone(),
                design_hash: info.design_hash.clone(),
                code: info.code.clone(),
                epochs: c.epochs,
                phase_jitter_deg: c.phase_jitter_deg,
                code_jitter_chips: c.code_jitter_chips,
                phase_lock_frac: c.phase_lock_fraction(),
                code_lock_frac: c.code_lock_fraction(),
                mean_cn0_dbhz: c.mean_cn0_dbhz.unwrap_or(f64::NAN),
            }
        })
        .collect();
    let warnings = sampling_warnings(&spec, &codes);
    write_outputs(&a, &rows, &warnings)?;
    Ok(table(&rows) + &warning_lines(&warnings))
}

/// Write the optional `--json` and `--csv` artifacts.
fn write_outputs(a: &Args, rows: &[Metrics], warnings: &[serde_json::Value]) -> Result<(), Fail> {
    if let Some(p) = a.get("--json") {
        std::fs::write(p, to_json(rows, warnings)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(p) = a.get("--csv") {
        std::fs::write(p, to_csv(rows)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    Ok(())
}

/// Metrics as CSV.
fn to_csv(rows: &[Metrics]) -> String {
    let mut s = String::from(
        "design,code,epochs,phase_jitter_deg,code_jitter_chips,phase_lock_frac,code_lock_frac,mean_cn0_dbhz,design_hash\n",
    );
    for m in rows {
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{},{}\n",
            m.design,
            m.code,
            m.epochs,
            m.phase_jitter_deg,
            m.code_jitter_chips,
            m.phase_lock_frac,
            m.code_lock_frac,
            m.mean_cn0_dbhz,
            m.design_hash
        ));
    }
    s
}

/// Metrics as pretty JSON.
fn to_json(rows: &[Metrics], warnings: &[serde_json::Value]) -> String {
    let v: Vec<serde_json::Value> = rows
        .iter()
        .map(|m| {
            serde_json::json!({
                "design": m.design,
                "code": m.code,
                "epochs": m.epochs,
                "phase_jitter_deg": m.phase_jitter_deg,
                "code_jitter_chips": m.code_jitter_chips,
                "phase_lock_frac": m.phase_lock_frac,
                "code_lock_frac": m.code_lock_frac,
                "mean_cn0_dbhz": m.mean_cn0_dbhz,
                "design_hash": m.design_hash,
            })
        })
        .collect();
    serde_json::to_string_pretty(&serde_json::json!({ "designs": v, "warnings": warnings }))
        .unwrap_or_default()
}

/// A human-readable table.
fn table(rows: &[Metrics]) -> String {
    let mut out = format!(
        "loop-design sweep: {} (design, PRN) result(s)\n",
        rows.len()
    );
    out.push_str(
        "design\tcode\tepochs\tphase_jitter_deg\tcode_jitter_chips\tphase_lock\tcode_lock\tmean_cn0\n",
    );
    for m in rows {
        out.push_str(&format!(
            "{}\t{}\t{}\t{:.2}\t{:.4}\t{:.3}\t{:.3}\t{:.1}\n",
            m.design,
            m.code,
            m.epochs,
            m.phase_jitter_deg,
            m.code_jitter_chips,
            m.phase_lock_frac,
            m.code_lock_frac,
            m.mean_cn0_dbhz
        ));
    }
    out.pop();
    out
}
