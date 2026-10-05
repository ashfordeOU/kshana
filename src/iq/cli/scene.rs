// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq scene`: generate a long multi-satellite IQ scene to a file with a truth
//! sidecar.
//!
//! The command builds a [`Scene`] of several satellites of one signal, each on a stated
//! range profile with a chosen Doppler and C/N0, and streams it through an
//! [`crate::iq::io::stream::IqWriter`] (so the duration, not memory, sets the cost) with a
//! JSON sidecar describing the format. The truth sidecar ([`TruthRecord`]) is written
//! alongside as CSV or JSON Lines, so a software receiver's acquisition and tracking output
//! can be scored against exactly what went in.

use super::{build_code, Args, Fail};
use crate::iq::io::inventory::{write_sidecar, RawSidecar};
use crate::iq::io::stream::create_raw;
use crate::iq::io::SampleFormat;
use crate::iq::scene::{
    CsvTruthWriter, JsonLinesTruthWriter, NavData, NoiseConfig, RangeProfile, SatGeometry, Scene,
    SceneConfig, SceneSatellite, TruthSink, T0_K,
};
use crate::iq::{IqError, SampleSpec, SpreadingCode};
use std::fs::File;
use std::io::BufWriter;
use std::path::Path;

/// Everything the scene generator needs, shared by the CLI and the Python binding.
pub(crate) struct SceneParams {
    /// Complex sample rate (Hz).
    pub(crate) fs_hz: f64,
    /// Scene length (s).
    pub(crate) duration_s: f64,
    /// Signal name (see [`super::signal::SIGNAL_NAMES`]).
    pub(crate) signal: String,
    /// One identifier per satellite (PRN, or GLONASS frequency channel).
    pub(crate) ids: Vec<i64>,
    /// Doppler of each satellite (Hz); a single value applies to all, empty means 0.
    pub(crate) dopplers: Vec<f64>,
    /// Baseband centre frequency (Hz); `None` uses the signal's own carrier.
    pub(crate) center_hz: Option<f64>,
    /// Residual intermediate frequency (Hz).
    pub(crate) if_hz: f64,
    /// Stated C/N0 for every satellite (dB-Hz); `None` uses the elevation default.
    pub(crate) cn0_dbhz: Option<f64>,
    /// Receiver noise figure (dB) used for the thermal noise density.
    pub(crate) noise_figure_db: f64,
    /// Add thermal noise (false gives a noise-free scene).
    pub(crate) noise: bool,
    /// Noise seed.
    pub(crate) seed: u64,
    /// Modulate seeded pseudo-random 50 bit/s data (false leaves the code data-free).
    pub(crate) data: bool,
    /// Synthesis threads per chunk.
    pub(crate) threads: usize,
}

/// Build a [`Scene`] from `p`. The satellites are spread over distinct ranges (so their
/// code phases differ) at a fixed 45° elevation; each carries the Doppler given for it.
pub(crate) fn build_scene(p: &SceneParams) -> Result<Scene, String> {
    if p.ids.is_empty() {
        return Err("a scene needs at least one satellite (--prn)".into());
    }
    if !p.dopplers.is_empty() && p.dopplers.len() != 1 && p.dopplers.len() != p.ids.len() {
        return Err(format!(
            "--doppler lists {} value(s); give one per --prn ({}) or a single value",
            p.dopplers.len(),
            p.ids.len()
        ));
    }
    let codes = p
        .ids
        .iter()
        .map(|&id| build_code(&p.signal, id))
        .collect::<Result<Vec<_>, _>>()?;
    let center = p.center_hz.unwrap_or_else(|| codes[0].carrier_hz());
    let spec = SampleSpec {
        fs_hz: p.fs_hz,
        center_hz: center,
        if_hz: p.if_hz,
    };
    let mut cfg = SceneConfig::new(spec, p.duration_s);
    cfg.seed = p.seed;
    cfg.threads = p.threads.max(1);
    cfg.noise = if p.noise {
        NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
    } else {
        NoiseConfig {
            enabled: false,
            ..NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
        }
    };
    let mut scene = Scene::new(cfg).map_err(|e| e.to_string())?;
    for (i, (id, code)) in p.ids.iter().zip(codes).enumerate() {
        let doppler = match p.dopplers.len() {
            0 => 0.0,
            1 => p.dopplers[0],
            _ => p.dopplers[i],
        };
        let lambda = crate::iq::C_M_PER_S / code.carrier_hz();
        let profile = RangeProfile {
            range_m: 2.0e7 + i as f64 * 3.0e5,
            range_rate_mps: -doppler * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        let nav = if p.data {
            NavData::Seeded {
                seed: *id as u64 + 1,
            }
        } else {
            NavData::None
        };
        scene.add_satellite(SceneSatellite {
            id: *id as u32,
            code: Box::new(code),
            geometry: SatGeometry::Profile(profile),
            cn0_dbhz: p.cn0_dbhz,
            nav,
        });
    }
    Ok(scene)
}

/// Run `kshana iq scene <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &["--no-noise", "--data"]).map_err(Fail::Usage)?;
    a.need_pos(1, "scene")?;
    let out = Path::new(&a.pos[0]);

    let fs_hz = a
        .num("--rate")
        .map_err(Fail::Usage)?
        .ok_or(Fail::Usage("iq scene needs --rate <hz>".into()))?;
    let duration_s = a
        .num("--duration")
        .map_err(Fail::Usage)?
        .ok_or(Fail::Usage("iq scene needs --duration <s>".into()))?;
    let signal = a
        .get("--signal")
        .ok_or(Fail::Usage("iq scene needs --signal <name>".into()))?
        .to_string();
    let ids: Vec<i64> = a.list("--prn").map_err(Fail::Usage)?;
    if ids.is_empty() {
        return Err(Fail::Usage("iq scene needs --prn <list>".into()));
    }
    let params = SceneParams {
        fs_hz,
        duration_s,
        signal,
        ids,
        dopplers: a.list("--doppler").map_err(Fail::Usage)?,
        center_hz: a.num("--center").map_err(Fail::Usage)?,
        if_hz: a.num("--if").map_err(Fail::Usage)?.unwrap_or(0.0),
        cn0_dbhz: a.num("--cn0").map_err(Fail::Usage)?,
        noise_figure_db: a.num("--noise-figure").map_err(Fail::Usage)?.unwrap_or(2.0),
        noise: !a.has("--no-noise"),
        seed: a.num("--seed").map_err(Fail::Usage)?.unwrap_or(1),
        data: a.has("--data"),
        threads: a.num("--threads").map_err(Fail::Usage)?.unwrap_or(1),
    };
    let scene = build_scene(&params).map_err(Fail::Usage)?;
    let spec = scene.config().spec;

    let format = match a.get("--format") {
        Some(f) => SampleFormat::parse(f)?,
        None => SampleFormat::CF32_LE,
    };

    // Truth sidecar: CSV by default, JSON Lines on request.
    let truth_fmt = a.get("--truth-format").unwrap_or("csv").to_string();
    let truth_path = a
        .get("--truth")
        .map(|s| s.to_string())
        .unwrap_or_else(|| default_truth_path(out, &truth_fmt));

    let mut iq = create_raw(out, format)?;
    let truth_file = BufWriter::new(
        File::create(&truth_path).map_err(|e| Fail::Run(format!("{truth_path}: {e}")))?,
    );
    let summary = match truth_fmt.as_str() {
        "csv" => generate(scene, &mut iq, &mut CsvTruthWriter::new(truth_file))?,
        "jsonl" | "jsonlines" => {
            generate(scene, &mut iq, &mut JsonLinesTruthWriter::new(truth_file))?
        }
        other => {
            return Err(Fail::Usage(format!(
                "--truth-format must be csv or jsonl (got {other:?})"
            )))
        }
    };

    let sidecar = RawSidecar {
        format: format.name(),
        sample_rate_hz: spec.fs_hz,
        center_hz: Some(spec.center_hz),
        if_hz: (spec.if_hz != 0.0).then_some(spec.if_hz),
        header_bytes: None,
        datetime: None,
        description: Some("written by kshana iq scene".into()),
    };
    let sidecar_path = write_sidecar(out, &sidecar)?;

    Ok(format!(
        "wrote {} samples ({}, {} Hz) to {}; {} truth records to {}; sidecar {}",
        summary.samples,
        format.name(),
        spec.fs_hz,
        out.display(),
        summary.truth_records,
        truth_path,
        sidecar_path.display(),
    ))
}

/// Default truth path: `<out>.truth.csv` or `.truth.jsonl`.
fn default_truth_path(out: &Path, fmt: &str) -> String {
    let ext = if fmt.starts_with("json") {
        "jsonl"
    } else {
        "csv"
    };
    format!("{}.truth.{ext}", out.display())
}

/// Generate `scene` into `iq` and `truth`, mapping the error type.
fn generate(
    scene: Scene,
    iq: &mut dyn crate::iq::IqSink,
    truth: &mut dyn TruthSink,
) -> Result<crate::iq::scene::SceneSummary, IqError> {
    scene.generate(iq, truth)
}
