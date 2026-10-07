// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq track`: acquire each requested PRN over a recording, then run the tracking
//! bank (DLL/PLL/FLL) over the whole recording and emit the per-epoch tracking output.
//!
//! Acquisition initialises each channel's code phase and Doppler
//! ([`crate::iq::track::ChannelInit::from_acquisition`]); the recording is then replayed
//! once ([`crate::iq::track::replay`]) through one loop design built from the loop flags
//! (noise bandwidths, integration time, correlator spacing). Each loop update
//! ([`crate::iq::track::EpochOutput`]) is written to the `--csv`/`--json` artifact and a
//! last-epoch summary is printed. The front-end flags (`--bandpass`, `--notch`, `--blank`,
//! `--excise`, `--agc`, `--bits`, as `iq acquire` and `iq frontend` take them) put a fresh
//! front-end chain in front of each pass.

use super::acquire::{codes_from_args, read_samples};
use super::frontend::through_frontend;
use super::{raw_sidecar, Args, Fail};
use crate::iq::acq::acquire;
use crate::iq::acq::{auto_coherent_periods, samples_needed, AcqConfig};
use crate::iq::io::inventory::open_recording;
use crate::iq::signals::SignalCode;
use crate::iq::track::{replay, CarrierLoop, ChannelInit, EpochOutput, LoopConfig};
use crate::iq::{IqSource, SampleSpec, SpreadingCode};
use std::path::Path;
use std::sync::Arc;

/// Build the acquisition config used to initialise tracking from the `--acq-*` flags. The
/// coherent length defaults to auto (≈4 ms, [`auto_coherent_periods`]); `--acq-coherent 1`
/// restores the one-period search of 0.32 and earlier.
pub(crate) fn init_acq_config(a: &Args, period_s: f64) -> Result<AcqConfig, Fail> {
    let coherent_periods = a
        .num("--acq-coherent")
        .map_err(Fail::Usage)?
        .unwrap_or_else(|| auto_coherent_periods(period_s))
        .max(1);
    let noncoherent = a
        .num("--acq-noncoherent")
        .map_err(Fail::Usage)?
        .unwrap_or(1usize)
        .max(1);
    Ok(AcqConfig {
        coherent_periods,
        noncoherent,
        doppler_max_hz: a
            .num("--doppler-max")
            .map_err(Fail::Usage)?
            .unwrap_or(5000.0),
        doppler_step_hz: a
            .num("--doppler-step")
            .map_err(Fail::Usage)?
            .unwrap_or(2.0 / (3.0 * coherent_periods as f64 * period_s)),
        pfa: a.num("--pfa").map_err(Fail::Usage)?.unwrap_or(1e-3),
    })
}

/// Acquire each code over the start of `src` and return a tracking initialisation per code.
/// `periods_per_bit` is carried into every channel (`None` tracks a data-free signal).
pub(crate) fn acquire_inits(
    a: &Args,
    spec: &SampleSpec,
    codes: &[SignalCode],
    src: &mut dyn IqSource,
) -> Result<Vec<ChannelInit>, Fail> {
    let cfg = init_acq_config(a, codes[0].period_s())?;
    let needed = codes
        .iter()
        .map(|c| samples_needed(spec, c, &cfg))
        .collect::<Result<Vec<_>, _>>()
        .map_err(Fail::Run)?;
    let max_needed = needed.iter().copied().max().unwrap_or(0);
    let samples = read_samples(src, max_needed)?;
    let periods_per_bit: Option<usize> = a.num("--periods-per-bit").map_err(Fail::Usage)?;

    let mut inits = Vec::new();
    for (code, need) in codes.iter().zip(&needed) {
        if samples.len() < *need {
            return Err(Fail::Run(format!(
                "{}: recording holds {} samples, {need} needed to acquire",
                code.name(),
                samples.len()
            )));
        }
        let grid = acquire(&samples, spec, code, &cfg).map_err(Fail::Run)?;
        if !grid.result.acquired {
            return Err(Fail::Run(format!(
                "{}: not acquired (statistic {:.2} < threshold {:.2}); raise --doppler-max, \
                 --acq-coherent or --acq-noncoherent, or check the recording",
                code.name(),
                grid.result.statistic,
                grid.result.threshold
            )));
        }
        let arc: Arc<dyn SpreadingCode + Send + Sync> = Arc::new(code.clone());
        inits.push(ChannelInit::from_acquisition(
            arc,
            &grid.result,
            spec,
            0,
            periods_per_bit,
        ));
    }
    Ok(inits)
}

/// Build one loop design from the loop flags, starting from the GPS-L1-C/A-like default.
pub(crate) fn loop_config_from(a: &Args, label: &str) -> Result<LoopConfig, Fail> {
    let mut cfg = LoopConfig {
        label: label.to_string(),
        ..LoopConfig::default()
    };
    if let Some(d) = a.num("--spacing").map_err(Fail::Usage)? {
        cfg.spacing_chips = d;
    }
    if let Some(bn) = a.num("--dll-bw").map_err(Fail::Usage)? {
        cfg.dll_bn_hz = bn;
    }
    if let Some(n) = a.num::<usize>("--coherent").map_err(Fail::Usage)? {
        cfg.coherent_periods = n.max(1);
    }
    let pll_bw: Option<f64> = a.num("--pll-bw").map_err(Fail::Usage)?;
    let fll_bw: Option<f64> = a.num("--fll-bw").map_err(Fail::Usage)?;
    if pll_bw.is_some() || fll_bw.is_some() {
        cfg.carrier = CarrierLoop::FllAssistedPll {
            pll_order: 2,
            pll_bn_hz: pll_bw.unwrap_or(15.0),
            fll_order: 1,
            fll_bn_hz: fll_bw.unwrap_or(10.0),
        };
    }
    Ok(cfg)
}

/// Run `kshana iq track <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, super::frontend::FRONTEND_SWITCHES).map_err(Fail::Usage)?;
    a.need_pos(1, "track")?;
    // Optional receiver front end, applied to both passes as `iq acquire` applies it.
    let fe = super::frontend::FrontendParams::from_args(&a)?;
    let path = Path::new(&a.pos[0]);
    let codes = codes_from_args(&a)?;

    // One pass to acquire, a fresh pass to track the whole recording.
    let opened = open_recording(path, raw_sidecar(&a)?)?;
    let spec = opened.source.spec();
    let mut acq_src = through_frontend(&fe, opened.source)?;
    let inits = acquire_inits(&a, &spec, &codes, acq_src.as_mut())?;

    let cfg = loop_config_from(&a, "track")?;
    let max_samples = a
        .num::<f64>("--max-seconds")
        .map_err(Fail::Usage)?
        .map(|s| (s * spec.fs_hz).round() as u64);

    let mut track_src = through_frontend(&fe, open_recording(path, raw_sidecar(&a)?)?.source)?;
    let results = replay(
        track_src.as_mut(),
        &inits,
        std::slice::from_ref(&cfg),
        max_samples,
    )?;
    let channels = &results[0].channels;

    write_outputs(&a, &spec, &codes, channels)?;
    Ok(summary(&codes, channels))
}

/// Write the optional `--json` and `--csv` per-epoch artifacts.
fn write_outputs(
    a: &Args,
    spec: &SampleSpec,
    codes: &[SignalCode],
    channels: &[Vec<EpochOutput>],
) -> Result<(), Fail> {
    if let Some(p) = a.get("--csv") {
        std::fs::write(p, to_csv(codes, channels)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(p) = a.get("--json") {
        std::fs::write(p, to_json(spec, codes, channels))
            .map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    Ok(())
}

/// Every channel's epochs as CSV, one row per epoch with a leading `code` column.
pub(crate) fn to_csv(codes: &[SignalCode], channels: &[Vec<EpochOutput>]) -> String {
    let mut s = String::from(
        "code,epoch,sample_index,code_epoch_s,t_coh_s,doppler_hz,code_rate_hz,code_phase_chips,\
         i_prompt,q_prompt,dll_chips,pll_rad,fll_hz,pli,phase_lock,code_lock,cn0_nwpr_dbhz,cn0_beaulieu_dbhz\n",
    );
    for (code, epochs) in codes.iter().zip(channels) {
        for e in epochs {
            s.push_str(&epoch_row(&code.name(), e));
            s.push('\n');
        }
    }
    s
}

/// One CSV row for an epoch.
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

/// Every channel's epochs as pretty JSON.
fn to_json(spec: &SampleSpec, codes: &[SignalCode], channels: &[Vec<EpochOutput>]) -> String {
    let chans: Vec<serde_json::Value> = codes
        .iter()
        .zip(channels)
        .map(|(code, epochs)| {
            serde_json::json!({
                "code": code.name(),
                "epochs": epochs.iter().map(epoch_json).collect::<Vec<_>>(),
            })
        })
        .collect();
    let v = serde_json::json!({
        "sample_rate_hz": spec.fs_hz,
        "channels": chans,
    });
    serde_json::to_string_pretty(&v).unwrap_or_default()
}

/// One epoch as a JSON value.
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
fn summary(codes: &[SignalCode], channels: &[Vec<EpochOutput>]) -> String {
    let mut out = String::from(
        "code\tepochs\tfinal_doppler_hz\tfinal_cn0_nwpr\tphase_lock_frac\tcode_lock_frac\n",
    );
    for (code, epochs) in codes.iter().zip(channels) {
        let n = epochs.len();
        let last = epochs.last();
        let plf = frac(epochs, |e| e.phase_lock);
        let clf = frac(epochs, |e| e.code_lock);
        out.push_str(&format!(
            "{}\t{}\t{}\t{}\t{:.3}\t{:.3}\n",
            code.name(),
            n,
            last.map(|e| format!("{:.1}", e.doppler_hz))
                .unwrap_or_else(|| "-".into()),
            last.and_then(|e| e.cn0_nwpr_dbhz)
                .map(|c| format!("{c:.1}"))
                .unwrap_or_else(|| "-".into()),
            plf,
            clf,
        ));
    }
    out.pop();
    out
}

/// Fraction of epochs for which `f` is true.
pub(crate) fn frac(epochs: &[EpochOutput], f: impl Fn(&EpochOutput) -> bool) -> f64 {
    if epochs.is_empty() {
        return 0.0;
    }
    epochs.iter().filter(|e| f(e)).count() as f64 / epochs.len() as f64
}
