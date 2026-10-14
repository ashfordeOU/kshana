// SPDX-License-Identifier: AGPL-3.0-only
//! A short, bounded scene to acquisition to tracking run held entirely in memory.
//!
//! The WebAssembly build exposes it (`iq_run_short`), and it is plain Rust so a native test
//! can run the same request and compare the answers. It builds the scene with
//! `crate::iq::scene::synthetic`, searches each requested code with [`acquire_peak`], and
//! tracks the acquired codes with the built-in loop design. Nothing is read from or written
//! to a file, and the sizes are capped so a browser tab cannot be asked for more than a
//! fraction of a second of a few satellites.

use crate::iq::acq::{acquire_peak, AcqConfig};
use crate::iq::scene::synthetic::{build_scene, SceneParams};
use crate::iq::signals::by_name::{build_code, SIGNAL_NAMES};
use crate::iq::track::design::Design;
use crate::iq::track::sink::CollectSink;
use crate::iq::track::{ChannelInit, SessionChannel, TrackSession};
use crate::iq::{SampleSpec, SpreadingCode, VecSink, VecSource};
use serde_json::{json, Value};
use std::sync::Arc;

/// Longest scene, seconds.
pub const MAX_DURATION_S: f64 = 0.25;
/// Most samples in one scene.
pub const MAX_SAMPLES: usize = 1_000_000;
/// Most satellites in one scene.
pub const MAX_SATELLITES: usize = 8;

/// The signal names a short run accepts, as a JSON array.
pub fn signals_json() -> Value {
    json!(SIGNAL_NAMES)
}

/// What a short run is asked to do. The unset fields take the defaults of `kshana iq scene`.
#[derive(Clone, Debug)]
pub struct ShortRequest {
    /// Complex sample rate (Hz).
    pub fs_hz: f64,
    /// Scene length (s).
    pub duration_s: f64,
    /// Signal name, one of [`SIGNAL_NAMES`].
    pub signal: String,
    /// PRN (or GLONASS frequency channel) of each satellite.
    pub ids: Vec<i64>,
    /// Doppler of each satellite (Hz); one value applies to all.
    pub dopplers: Vec<f64>,
    /// Stated C/N0 (dB-Hz); `None` uses the elevation default.
    pub cn0_dbhz: Option<f64>,
    /// Noise seed.
    pub seed: u64,
}

/// Check the request against the caps, before any work is done.
fn check(r: &ShortRequest) -> Result<(), String> {
    if !(r.fs_hz.is_finite() && r.fs_hz > 0.0) {
        return Err("fs_hz must be a positive number".into());
    }
    if !(r.duration_s.is_finite() && r.duration_s > 0.0 && r.duration_s <= MAX_DURATION_S) {
        return Err(format!("duration_s must be in (0, {MAX_DURATION_S}]"));
    }
    if r.ids.is_empty() || r.ids.len() > MAX_SATELLITES {
        return Err(format!("ids must hold 1 to {MAX_SATELLITES} satellites"));
    }
    if r.dopplers.iter().any(|d| !d.is_finite()) {
        return Err("dopplers must be finite".into());
    }
    let n = r.fs_hz * r.duration_s;
    if n > MAX_SAMPLES as f64 {
        return Err(format!(
            "{n:.0} samples requested; a short run holds at most {MAX_SAMPLES}"
        ));
    }
    Ok(())
}

/// Run the scene, the acquisition and the tracking, and summarise them as JSON:
/// `{fs_hz, samples, acquisition: [..], tracking: [..]}`.
pub fn run_short(r: &ShortRequest) -> Result<Value, String> {
    check(r)?;
    let params = SceneParams {
        fs_hz: r.fs_hz,
        duration_s: r.duration_s,
        signal: r.signal.clone(),
        ids: r.ids.clone(),
        dopplers: r.dopplers.clone(),
        center_hz: None,
        if_hz: 0.0,
        cn0_dbhz: r.cn0_dbhz,
        noise_figure_db: 2.0,
        noise: true,
        seed: r.seed,
        data: false,
        threads: 1,
    };
    let scene = build_scene(&params)?;
    let spec: SampleSpec = scene.config().spec;
    let mut sink = VecSink::default();
    let mut truth = Vec::new();
    scene
        .generate(&mut sink, &mut truth)
        .map_err(|e| e.to_string())?;
    let samples = sink.samples;

    let codes = r
        .ids
        .iter()
        .map(|&id| build_code(&r.signal, id))
        .collect::<Result<Vec<_>, _>>()?;
    let design = Design::builtin_default();
    let cfg: AcqConfig = design.acq_config(codes[0].period_s());
    let mut acquisition = Vec::new();
    let mut inits = Vec::new();
    for (id, code) in r.ids.iter().zip(&codes) {
        let found = acquire_peak(&samples, &spec, code, &cfg)?;
        acquisition.push(json!({
            "id": id,
            "code": found.code_name,
            "acquired": found.acquired,
            "doppler_hz": found.doppler_hz,
            "code_phase_chips": found.code_phase_chips,
            "statistic": found.statistic,
            "threshold": found.threshold,
        }));
        if found.acquired {
            let arc: Arc<dyn SpreadingCode + Send + Sync> = Arc::new(code.clone());
            inits.push((
                *id,
                ChannelInit::from_acquisition(arc, &found, &spec, 0, None),
            ));
        }
    }

    let ids: Vec<i64> = inits.iter().map(|(id, _)| *id).collect();
    let channels = inits
        .into_iter()
        .map(|(_, init)| SessionChannel::from_design(init, &design))
        .collect();
    let mut tracking = Vec::new();
    if !ids.is_empty() {
        let mut session = TrackSession::new(spec, channels)?.with_threads(1);
        let mut src = VecSource::new(spec, samples.clone());
        let mut out = CollectSink::default();
        session
            .run(&mut src, None, &mut out)
            .map_err(|e| e.to_string())?;
        for (k, id) in ids.iter().enumerate() {
            let epochs = out.channels.get(k).map(Vec::as_slice).unwrap_or(&[]);
            let last = epochs.last();
            tracking.push(json!({
                "id": id,
                "epochs": epochs.len(),
                "final_state": last.map(|(_, s)| s.as_str()),
                "final_doppler_hz": last.map(|(e, _)| e.doppler_hz),
                "final_cn0_dbhz": last.map(|(e, _)| e.cn0_nwpr_dbhz),
            }));
        }
    }
    Ok(json!({
        "fs_hz": spec.fs_hz,
        "samples": samples.len(),
        "acquisition": acquisition,
        "tracking": tracking,
    }))
}
