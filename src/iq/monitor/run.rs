// SPDX-License-Identifier: AGPL-3.0-only
//! One streaming pass of every monitor over a recording.
//!
//! [`run_monitors`] reads an [`IqSource`] once, in chunks, feeding the pre-correlation
//! monitors the raw samples and a [`TrackingBank`] the same samples; each loop update of
//! each channel goes straight to that channel's [`EpochMonitors`] and is then dropped, so
//! memory holds the monitors' series (one value per block or loop update) but no IQ and no
//! epoch list. This is the entry point the CLI (`kshana iq monitor`), the Python binding
//! (`kshana.iq_monitor`) and the campaign runner share. [`MonitorConfig`] is its settings
//! file (TOML or JSON): a `[power]` or `[spectral]` table switches that monitor on, and
//! `[epoch.cn0]`, `[epoch.sqm]`, `[epoch.lock]` tune the per-channel monitors.

use super::power::{PowerMonitor, PowerSettings};
use super::spectral::{SpectralMonitor, SpectralSettings};
use super::{EpochMonitorSettings, EpochMonitors, MonitorReport};
use crate::iq::track::{ChannelInit, LoopConfig, TrackingBank};
use crate::iq::{Cf64, IqError, IqSource};
use serde::{Deserialize, Serialize};

/// Which monitors run and how they are tuned.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct MonitorConfig {
    /// The total-power / AGC monitor (`None` = off).
    #[serde(default)]
    pub power: Option<PowerSettings>,
    /// The spectral / kurtosis / pulse monitor (`None` = off).
    #[serde(default)]
    pub spectral: Option<SpectralSettings>,
    /// The per-channel monitors (used when channels are tracked). A C/N0 `stride` of 0
    /// is replaced by the loop's C/N0 estimator length in loop updates, so the CUSUM sees
    /// independent estimates.
    #[serde(default)]
    pub epoch: EpochMonitorSettings,
}

impl Default for MonitorConfig {
    /// Power and spectral monitors on with their defaults; per-channel defaults with an
    /// automatic C/N0 stride.
    fn default() -> Self {
        MonitorConfig {
            power: Some(PowerSettings::default()),
            spectral: Some(SpectralSettings::default()),
            epoch: EpochMonitorSettings::default(),
        }
    }
}

impl MonitorConfig {
    /// Parse a settings file: TOML, or JSON when the text starts with `{`.
    pub fn parse(text: &str) -> Result<Self, IqError> {
        let t = text.trim_start();
        if t.starts_with('{') {
            serde_json::from_str(t).map_err(|e| IqError::Format(format!("monitor settings: {e}")))
        } else {
            toml::from_str(t).map_err(|e| IqError::Format(format!("monitor settings: {e}")))
        }
    }
}

/// The C/N0 estimator length of `cfg` in loop updates (windows × periods per window over
/// the coherent periods per update), at least 1.
pub fn cn0_estimate_updates(cfg: &LoopConfig) -> usize {
    (cfg.cn0_windows * cfg.cn0_window_periods / cfg.coherent_periods.max(1)).max(1)
}

/// Run the configured monitors over `src` in one pass: the pre-correlation monitors on
/// every sample, and, for each `(label, init)` in `channels`, a tracking channel with loop
/// design `loop_cfg` whose loop updates feed that channel's [`EpochMonitors`]. Stops at the
/// end of the stream or after `max_samples`.
pub fn run_monitors(
    src: &mut dyn IqSource,
    channels: &[(String, ChannelInit)],
    loop_cfg: &LoopConfig,
    cfg: &MonitorConfig,
    max_samples: Option<u64>,
) -> Result<MonitorReport, IqError> {
    let spec = src.spec();
    let mut power = cfg.power.map(|s| PowerMonitor::new(spec.fs_hz, s));
    let mut spectral = cfg.spectral.map(|s| SpectralMonitor::new(spec.fs_hz, s));
    let mut epoch_settings = cfg.epoch;
    if epoch_settings.cn0.stride == 0 {
        epoch_settings.cn0.stride = cn0_estimate_updates(loop_cfg);
    }
    let mut bank = if channels.is_empty() {
        None
    } else {
        let list: Vec<(ChannelInit, LoopConfig)> = channels
            .iter()
            .map(|(_, init)| (init.clone(), loop_cfg.clone()))
            .collect();
        Some(TrackingBank::new(spec, &list).map_err(IqError::Format)?)
    };
    let mut mons: Vec<EpochMonitors> = channels
        .iter()
        .map(|(label, _)| EpochMonitors::new(label, loop_cfg.spacing_chips, &epoch_settings))
        .collect();
    let mut buf = vec![Cf64::default(); 1 << 15];
    let mut out = Vec::new();
    let mut done = 0u64;
    loop {
        let want = match max_samples {
            Some(m) if done >= m => break,
            Some(m) => ((m - done) as usize).min(buf.len()),
            None => buf.len(),
        };
        let got = src.read(&mut buf[..want])?;
        if got == 0 {
            break;
        }
        let x = &buf[..got];
        if let Some(p) = power.as_mut() {
            p.push(x);
        }
        if let Some(s) = spectral.as_mut() {
            s.push(x);
        }
        if let Some(b) = bank.as_mut() {
            b.process(x, &mut out);
            for (m, epochs) in mons.iter_mut().zip(out.iter_mut()) {
                for e in epochs.drain(..) {
                    m.push_epoch(&e);
                }
            }
        }
        done += got as u64;
    }
    let mut report = MonitorReport::default();
    if let Some(p) = &power {
        report.extend(p.report());
    }
    if let Some(s) = &spectral {
        report.extend(s.report());
    }
    for m in &mons {
        report.extend(m.report());
    }
    report.notes.push(("samples".into(), done.to_string()));
    report.notes.push((
        "cn0.stride_updates".into(),
        epoch_settings.cn0.stride.to_string(),
    ));
    Ok(report)
}
