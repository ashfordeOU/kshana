// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq acquire`: FFT parallel-code-phase acquisition of one or more PRNs over a
//! recording.
//!
//! The command opens any recording [`crate::iq::io::inventory::open_recording`] opens (a
//! raw file with a sidecar, a raw file with the `--format`/`--rate` flags, or a SigMF
//! recording), reads the samples one search needs, and runs [`crate::iq::acq::acquire`] for
//! each requested code. It reports, per PRN, the detected Doppler, code phase, the
//! normalised peak statistic, the detection threshold and whether the peak cleared it.

use super::{build_code, open_input, Args, Fail};
use crate::iq::acq::{acquire, samples_needed, AcqConfig, AcqResult};
use crate::iq::signals::SignalCode;
use crate::iq::{Cf64, IqSource, SampleSpec, SpreadingCode};

/// Parse the shared `--signal`/`--prn` arguments into one spreading code per PRN.
pub(crate) fn codes_from_args(a: &Args) -> Result<Vec<SignalCode>, Fail> {
    let signal = a
        .get("--signal")
        .ok_or(Fail::Usage("needs --signal <name>".into()))?;
    let ids: Vec<i64> = a.list("--prn").map_err(Fail::Usage)?;
    if ids.is_empty() {
        return Err(Fail::Usage("needs --prn <list>".into()));
    }
    ids.iter()
        .map(|&id| build_code(signal, id).map_err(Fail::Usage))
        .collect()
}

/// Build an [`AcqConfig`] from the acquisition flags, defaulting the Doppler step to the
/// recommended `2 / (3 · N · T_code)` for the first code's period.
pub(crate) fn acq_config(a: &Args, period_s: f64) -> Result<AcqConfig, Fail> {
    let coherent_periods = a
        .num("--coherent")
        .map_err(Fail::Usage)?
        .unwrap_or(1usize)
        .max(1);
    let noncoherent = a
        .num("--noncoherent")
        .map_err(Fail::Usage)?
        .unwrap_or(1usize)
        .max(1);
    let doppler_max_hz = a
        .num("--doppler-max")
        .map_err(Fail::Usage)?
        .unwrap_or(5000.0);
    let default_step = 2.0 / (3.0 * coherent_periods as f64 * period_s);
    Ok(AcqConfig {
        coherent_periods,
        noncoherent,
        doppler_max_hz,
        doppler_step_hz: a
            .num("--doppler-step")
            .map_err(Fail::Usage)?
            .unwrap_or(default_step),
        pfa: a.num("--pfa").map_err(Fail::Usage)?.unwrap_or(1e-3),
    })
}

/// Read up to `n` samples from `src` into a vector (fewer if the stream ends first).
pub(crate) fn read_samples(src: &mut dyn IqSource, n: usize) -> Result<Vec<Cf64>, Fail> {
    let mut buf = vec![Cf64::default(); n];
    let mut got = 0;
    while got < n {
        let step = src.read(&mut buf[got..])?;
        if step == 0 {
            break;
        }
        got += step;
    }
    buf.truncate(got);
    Ok(buf)
}

/// Run `kshana iq acquire <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let switches: Vec<&str> = super::frontend::FRONTEND_SWITCHES.to_vec();
    let a = Args::parse(args, &switches).map_err(Fail::Usage)?;
    a.need_pos(1, "acquire")?;
    let codes = codes_from_args(&a)?;
    let opened = open_input(&a, 0)?;
    let spec = opened.source.spec();
    let cfg = acq_config(&a, codes[0].period_s())?;

    let mut src = opened.source;
    let needed = codes
        .iter()
        .map(|c| samples_needed(&spec, c, &cfg))
        .collect::<Result<Vec<_>, _>>()
        .map_err(Fail::Run)?;
    let max_needed = needed.iter().copied().max().unwrap_or(0);
    let mut samples = read_samples(src.as_mut(), max_needed)?;

    // Optional receiver front end applied before acquisition.
    let fe = super::frontend::FrontendParams::from_args(&a)?;
    if fe.any() {
        let mut chain = super::frontend::build_chain(&fe, spec.fs_hz).map_err(Fail::Usage)?;
        super::frontend::apply_chain(&mut chain, &mut samples);
    }

    let mut results = Vec::new();
    for (code, need) in codes.iter().zip(&needed) {
        if samples.len() < *need {
            return Err(Fail::Run(format!(
                "{}: recording holds {} samples, {need} needed for this search",
                code.name(),
                samples.len()
            )));
        }
        let grid = acquire(&samples, &spec, code, &cfg).map_err(Fail::Run)?;
        results.push(grid.result);
    }

    write_outputs(&a, &spec, &cfg, &results)?;
    Ok(table(&spec, &cfg, &results))
}

/// Write the optional `--json` and `--csv` artifacts.
fn write_outputs(
    a: &Args,
    spec: &SampleSpec,
    cfg: &AcqConfig,
    r: &[AcqResult],
) -> Result<(), Fail> {
    if let Some(p) = a.get("--json") {
        std::fs::write(p, to_json(spec, cfg, r)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(p) = a.get("--csv") {
        std::fs::write(p, to_csv(r)).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    Ok(())
}

/// One detection as a JSON value.
fn result_json(r: &AcqResult) -> serde_json::Value {
    serde_json::json!({
        "code": r.code_name,
        "acquired": r.acquired,
        "doppler_hz": r.doppler_hz,
        "code_phase_chips": r.code_phase_chips,
        "delay_samples": r.delay_samples,
        "statistic": r.statistic,
        "threshold": r.threshold,
        "peak_ratio": r.peak_ratio,
        "second_peak": r.second_peak,
        "pfa_cell": r.pfa_cell,
        "n_doppler_bins": r.n_doppler_bins,
        "sample_power": r.sample_power,
    })
}

/// The full result set as pretty JSON.
fn to_json(spec: &SampleSpec, cfg: &AcqConfig, r: &[AcqResult]) -> String {
    let v = serde_json::json!({
        "sample_rate_hz": spec.fs_hz,
        "if_hz": spec.if_hz,
        "coherent_periods": cfg.coherent_periods,
        "noncoherent": cfg.noncoherent,
        "pfa": cfg.pfa,
        "detections": r.iter().map(result_json).collect::<Vec<_>>(),
    });
    serde_json::to_string_pretty(&v).unwrap_or_default()
}

/// The result set as CSV.
fn to_csv(r: &[AcqResult]) -> String {
    let mut s = String::from(
        "code,acquired,doppler_hz,code_phase_chips,delay_samples,statistic,threshold,peak_ratio\n",
    );
    for d in r {
        s.push_str(&format!(
            "{},{},{},{},{},{},{},{}\n",
            d.code_name,
            d.acquired,
            d.doppler_hz,
            d.code_phase_chips,
            d.delay_samples,
            d.statistic,
            d.threshold,
            d.peak_ratio
        ));
    }
    s
}

/// A human-readable table.
fn table(spec: &SampleSpec, cfg: &AcqConfig, r: &[AcqResult]) -> String {
    let mut out = format!(
        "acquisition: {} Hz, {} coherent period(s) x {} non-coherent, pfa {}\n",
        spec.fs_hz, cfg.coherent_periods, cfg.noncoherent, cfg.pfa
    );
    out.push_str(
        "code\tacquired\tdoppler_hz\tcode_phase_chips\tstatistic\tthreshold\tpeak_ratio\n",
    );
    for d in r {
        out.push_str(&format!(
            "{}\t{}\t{:.1}\t{:.3}\t{:.2}\t{:.2}\t{:.2}\n",
            d.code_name,
            d.acquired,
            d.doppler_hz,
            d.code_phase_chips,
            d.statistic,
            d.threshold,
            d.peak_ratio
        ));
    }
    out.pop();
    out
}
