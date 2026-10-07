// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq monitor`: run the interference and spoofing detection monitors
//! ([`crate::iq::monitor`]) over a recording and write their time series and events.
//!
//! Without `--signal`, only the pre-correlation monitors run (total power / AGC gain, and
//! the spectral, kurtosis and pulse monitor). With `--signal --prn`, each PRN is acquired
//! over the start of the recording and tracked through the whole of it, and its loop
//! updates feed the C/N0 change, SQM and lock monitors. Everything runs in one streaming
//! pass ([`crate::iq::monitor::run::run_monitors`]). `--power` / `--spectral` pick the
//! pre-correlation monitors (both when neither is given); `--settings <file>` takes a
//! [`crate::iq::monitor::run::MonitorConfig`] TOML or JSON file instead, in which a
//! `[power]` or `[spectral]` table switches that monitor on.

use super::acquire::codes_from_args;
use super::track::acquire_inits;
use super::{raw_sidecar, Args, Fail};
use crate::iq::io::inventory::open_recording;
use crate::iq::monitor::run::{run_monitors, MonitorConfig};
use crate::iq::monitor::MonitorReport;
use crate::iq::track::{CarrierLoop, LoopConfig};
use crate::iq::SpreadingCode;
use std::collections::BTreeMap;
use std::path::Path;

/// The value-less flags of `iq monitor`.
const SWITCHES: &[&str] = &["--power", "--spectral"];

/// The loop design: the default GPS-L1-C/A-like loop with the loop flags applied.
fn loop_design(a: &Args) -> Result<LoopConfig, Fail> {
    let mut cfg = LoopConfig {
        label: "monitor".into(),
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
    if let Some(n) = a.num::<usize>("--cn0-windows").map_err(Fail::Usage)? {
        cfg.cn0_windows = n.max(1);
    }
    let pll: Option<f64> = a.num("--pll-bw").map_err(Fail::Usage)?;
    let fll: Option<f64> = a.num("--fll-bw").map_err(Fail::Usage)?;
    if pll.is_some() || fll.is_some() {
        cfg.carrier = CarrierLoop::FllAssistedPll {
            pll_order: 2,
            pll_bn_hz: pll.unwrap_or(15.0),
            fll_order: 1,
            fll_bn_hz: fll.unwrap_or(10.0),
        };
    }
    Ok(cfg)
}

/// The monitor settings from `settings_text`, else `--settings`, else the defaults, then
/// the switches.
fn config(a: &Args, settings_text: Option<&str>) -> Result<MonitorConfig, Fail> {
    let mut cfg = match (settings_text, a.get("--settings")) {
        (Some(t), _) => MonitorConfig::parse(t)?,
        (None, Some(p)) => {
            let text = std::fs::read_to_string(p).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            MonitorConfig::parse(&text)?
        }
        (None, None) => MonitorConfig::default(),
    };
    let (pw, sp) = (a.has("--power"), a.has("--spectral"));
    if pw || sp {
        cfg.power = if pw {
            Some(cfg.power.unwrap_or_default())
        } else {
            None
        };
        cfg.spectral = if sp {
            Some(cfg.spectral.unwrap_or_default())
        } else {
            None
        };
    }
    if let Some(b) = a.num::<f64>("--baseline").map_err(Fail::Usage)? {
        if let Some(p) = cfg.power.as_mut() {
            p.baseline_s = b;
        }
        if let Some(s) = cfg.spectral.as_mut() {
            s.baseline_s = b;
        }
        cfg.epoch.cn0.baseline_s = b;
        cfg.epoch.sqm.baseline_s = b;
    }
    Ok(cfg)
}

/// Parse `iq monitor` arguments.
pub(crate) fn parse_args(args: &[String]) -> Result<Args, Fail> {
    let a = Args::parse(args, SWITCHES).map_err(Fail::Usage)?;
    a.need_pos(1, "monitor")?;
    Ok(a)
}

/// Run the monitors the arguments describe and return the report (no files written).
/// `settings_text`, when given, takes the place of `--settings <file>`.
pub(crate) fn report_from_args(
    a: &Args,
    settings_text: Option<&str>,
) -> Result<MonitorReport, Fail> {
    let path = Path::new(&a.pos[0]);
    let cfg = config(a, settings_text)?;
    let design = loop_design(a)?;

    let mut channels = Vec::new();
    if a.get("--signal").is_some() || a.get("--prn").is_some() {
        let codes = codes_from_args(a)?;
        let mut opened = open_recording(path, raw_sidecar(a)?)?;
        let spec = opened.source.spec();
        let inits = acquire_inits(a, &spec, &codes, opened.source.as_mut())?;
        for (code, init) in codes.iter().zip(inits) {
            channels.push((code.name(), init));
        }
    }
    let mut src = open_recording(path, raw_sidecar(a)?)?;
    let max = a
        .num::<f64>("--max-seconds")
        .map_err(Fail::Usage)?
        .map(|s| (s * src.source.spec().fs_hz).round() as u64);
    Ok(run_monitors(
        src.source.as_mut(),
        &channels,
        &design,
        &cfg,
        max,
    )?)
}

/// Run `kshana iq monitor <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = parse_args(args)?;
    let report = report_from_args(&a, None)?;

    if let Some(p) = a.get("--json") {
        std::fs::write(p, report.to_json()?).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    if let Some(prefix) = a.get("--csv") {
        for (suffix, body) in [
            ("series.csv", report.series_csv()),
            ("events.csv", report.events_csv()),
        ] {
            let p = format!("{prefix}.{suffix}");
            std::fs::write(&p, body).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
        }
    }
    Ok(summary(&report))
}

/// A short summary: events per kind with the first alarm, then the notes.
fn summary(r: &MonitorReport) -> String {
    let mut by_kind: BTreeMap<(String, String), (usize, f64)> = BTreeMap::new();
    for e in &r.events {
        let k = (e.kind.clone(), e.channel.clone().unwrap_or_default());
        let v = by_kind.entry(k).or_insert((0, e.t_alarm_s));
        v.0 += 1;
        v.1 = v.1.min(e.t_alarm_s);
    }
    let mut out = format!("{} event(s)\n", r.events.len());
    if !by_kind.is_empty() {
        out.push_str("kind\tchannel\tcount\tfirst_alarm_s\n");
        for ((kind, ch), (n, t)) in &by_kind {
            out.push_str(&format!(
                "{kind}\t{}\t{n}\t{t:.3}\n",
                if ch.is_empty() { "-" } else { ch }
            ));
        }
    }
    for (k, v) in &r.notes {
        out.push_str(&format!("{k} = {v}\n"));
    }
    out
}
