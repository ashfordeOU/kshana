// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq sweep`: replay one recording across several tracking-loop designs and report
//! the resulting jitter and lock metrics per design.
//!
//! The recording is read once ([`crate::iq::track::replay`]): the bank holds one channel
//! per (design, PRN) pair, so each design's result is exactly that of running it alone. The
//! swept axes are the carrier (PLL) bandwidth, the code (DLL) bandwidth, the early-late
//! spacing and the integration length; a list on any axis is expanded into the full product
//! of designs. Per design and PRN the command reports the steady-state carrier-phase and
//! code jitter (over the second half of the run), the phase- and code-lock fractions and the
//! mean C/N0. The front-end flags (as `iq track` takes them) filter the recording before
//! both the acquisition and the replay, so every design sees the same front end.

use super::acquire::codes_from_args;
use super::frontend::through_frontend;
use super::track::{acquire_inits, frac};
use super::{open_input, Args, Fail};
use crate::iq::signals::SignalCode;
use crate::iq::track::{replay, CarrierLoop, EpochOutput, LoopConfig, ReplayResult};
use crate::iq::SpreadingCode;

/// A list flag, or a single default value when the flag is absent.
fn axis(a: &Args, key: &str, default: f64) -> Result<Vec<f64>, Fail> {
    let v: Vec<f64> = a.list(key).map_err(Fail::Usage)?;
    Ok(if v.is_empty() { vec![default] } else { v })
}

/// Expand the swept axes into the full set of loop designs.
pub(crate) fn designs(a: &Args) -> Result<Vec<LoopConfig>, Fail> {
    let base = LoopConfig::default();
    let pll_bws = axis(a, "--pll-bw", 15.0)?;
    let dll_bws = axis(a, "--dll-bw", base.dll_bn_hz)?;
    let spacings = axis(a, "--spacing", base.spacing_chips)?;
    let coherents: Vec<usize> = {
        let v: Vec<usize> = a.list("--coherent").map_err(Fail::Usage)?;
        if v.is_empty() {
            vec![base.coherent_periods]
        } else {
            v
        }
    };
    let mut out = Vec::new();
    for &pll in &pll_bws {
        for &dll in &dll_bws {
            for &sp in &spacings {
                for &coh in &coherents {
                    out.push(LoopConfig {
                        label: format!("pll{pll}_dll{dll}_sp{sp}_coh{coh}"),
                        coherent_periods: coh.max(1),
                        spacing_chips: sp,
                        dll_bn_hz: dll,
                        carrier: CarrierLoop::FllAssistedPll {
                            pll_order: 2,
                            pll_bn_hz: pll,
                            fll_order: 1,
                            fll_bn_hz: 10.0,
                        },
                        ..base.clone()
                    });
                }
            }
        }
    }
    Ok(out)
}

/// The steady-state metrics of one (design, PRN) channel.
pub(crate) struct Metrics {
    design: String,
    code: String,
    epochs: usize,
    phase_jitter_deg: f64,
    code_jitter_chips: f64,
    phase_lock_frac: f64,
    code_lock_frac: f64,
    mean_cn0_dbhz: f64,
}

/// Sample standard deviation of `xs` (0 for fewer than two values).
fn std(xs: &[f64]) -> f64 {
    let n = xs.len();
    if n < 2 {
        return 0.0;
    }
    let mean = xs.iter().sum::<f64>() / n as f64;
    let var = xs.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (n - 1) as f64;
    var.sqrt()
}

/// Metrics for one channel, measured over the steady-state (second) half of the run.
fn metrics(design: &str, code: &str, epochs: &[EpochOutput]) -> Metrics {
    let tail = &epochs[epochs.len() / 2..];
    let pll: Vec<f64> = tail.iter().map(|e| e.disc.pll_rad).collect();
    let dll: Vec<f64> = tail.iter().map(|e| e.disc.dll_chips).collect();
    let cn0: Vec<f64> = tail.iter().filter_map(|e| e.cn0_nwpr_dbhz).collect();
    Metrics {
        design: design.to_string(),
        code: code.to_string(),
        epochs: epochs.len(),
        phase_jitter_deg: std(&pll).to_degrees(),
        code_jitter_chips: std(&dll),
        phase_lock_frac: frac(epochs, |e| e.phase_lock),
        code_lock_frac: frac(epochs, |e| e.code_lock),
        mean_cn0_dbhz: if cn0.is_empty() {
            f64::NAN
        } else {
            cn0.iter().sum::<f64>() / cn0.len() as f64
        },
    }
}

/// Collect metrics for every (design, PRN) pair.
fn collect(codes: &[SignalCode], results: &[ReplayResult]) -> Vec<Metrics> {
    let mut rows = Vec::new();
    for r in results {
        for (code, epochs) in codes.iter().zip(&r.channels) {
            rows.push(metrics(&r.config.label, &code.name(), epochs));
        }
    }
    rows
}

/// Run `kshana iq sweep <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, super::frontend::FRONTEND_SWITCHES).map_err(Fail::Usage)?;
    a.need_pos(1, "sweep")?;
    // Optional receiver front end, applied to both passes as `iq acquire` applies it.
    let fe = super::frontend::FrontendParams::from_args(&a)?;
    let codes = codes_from_args(&a)?;

    let opened = open_input(&a, 0)?;
    let spec = opened.source.spec();
    let mut acq_src = through_frontend(&fe, opened.source)?;
    let inits = acquire_inits(&a, &spec, &codes, acq_src.as_mut())?;

    let designs = designs(&a)?;
    let max_samples = a
        .num::<f64>("--max-seconds")
        .map_err(Fail::Usage)?
        .map(|s| (s * spec.fs_hz).round() as u64);

    let mut track_src = through_frontend(&fe, open_input(&a, 0)?.source)?;
    let results = replay(track_src.as_mut(), &inits, &designs, max_samples)?;
    let rows = collect(&codes, &results);

    write_outputs(&a, &rows)?;
    Ok(table(&rows))
}

/// Write the optional `--json` and `--csv` artifacts.
fn write_outputs(a: &Args, rows: &[Metrics]) -> Result<(), Fail> {
    if let Some(p) = a.get("--json") {
        std::fs::write(p, to_json(rows)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(p) = a.get("--csv") {
        std::fs::write(p, to_csv(rows)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    Ok(())
}

/// Metrics as CSV.
fn to_csv(rows: &[Metrics]) -> String {
    let mut s = String::from(
        "design,code,epochs,phase_jitter_deg,code_jitter_chips,phase_lock_frac,code_lock_frac,mean_cn0_dbhz\n",
    );
    for m in rows {
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{}\n",
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
    s
}

/// Metrics as pretty JSON.
fn to_json(rows: &[Metrics]) -> String {
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
            })
        })
        .collect();
    serde_json::to_string_pretty(&serde_json::json!({ "designs": v })).unwrap_or_default()
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
