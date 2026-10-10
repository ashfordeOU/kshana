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
use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::iq::channel::cn0_profile::{Cn0Profile, Cn0ProfileChannel, ProfiledTruth};
use crate::iq::io::inventory::{write_sidecar, RawSidecar};
use crate::iq::io::stream::create_raw;
use crate::iq::io::{Encoding, SampleFormat};
use crate::iq::scene::{
    CsvTruthWriter, JsonLinesTruthWriter, NavData, NoiseConfig, RangeProfile, ReceiverClock,
    SatGeometry, Scene, SceneConfig, SceneSatellite, Trajectory, TruthSink, T0_K,
};
use crate::iq::{IqError, SampleSpec, SpreadingCode};
use crate::rinex::parse_nav;
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
    /// Modulate seeded pseudo-random data at the signal's own symbol timing (false leaves
    /// the code data-free). Refused on pilot components and on signals whose data the scene
    /// does not model.
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
        nav.check_modulation(code.data_modulation())
            .map_err(|e| format!("--data: {} {e}", code.name()))?;
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

/// Everything a broadcast-ephemeris scene needs, shared by the CLI and the Python binding.
pub(crate) struct BroadcastParams {
    /// Complex sample rate (Hz).
    pub(crate) fs_hz: f64,
    /// Scene length (s).
    pub(crate) duration_s: f64,
    /// The RINEX navigation file's text.
    pub(crate) nav_text: String,
    /// GPS PRNs to include; empty means every healthy GPS satellite in the file.
    pub(crate) prns: Vec<i64>,
    /// GPS time of week of the first sample (s).
    pub(crate) start_tow_s: f64,
    /// Receiver geodetic position `(lat_deg, lon_deg, alt_m)`.
    pub(crate) rx_llh_deg: (f64, f64, f64),
    /// Baseband centre frequency (Hz); `None` uses the GPS L1 carrier.
    pub(crate) center_hz: Option<f64>,
    /// Residual intermediate frequency (Hz).
    pub(crate) if_hz: f64,
    /// Stated C/N0 (dB-Hz); `None` uses the elevation default.
    pub(crate) cn0_dbhz: Option<f64>,
    /// Add thermal noise.
    pub(crate) noise: bool,
    /// Receiver noise figure (dB).
    pub(crate) noise_figure_db: f64,
    /// Noise seed.
    pub(crate) seed: u64,
    /// Elevation mask (degrees).
    pub(crate) elevation_mask_deg: f64,
    /// Synthesis threads per chunk.
    pub(crate) threads: usize,
}

/// Build a broadcast-ephemeris [`Scene`] from `p`: parse the RINEX navigation file, pick for
/// each requested GPS PRN the healthy ephemeris whose `toe` is closest to the start time, and
/// place each satellite at its true broadcast geometry (so the truth sidecar carries the real
/// per-satellite range, Doppler and code phase over the window). Reuses the engine's RINEX
/// reader and the scene's broadcast geometry/LNAV path.
pub(crate) fn build_broadcast_scene(p: &BroadcastParams) -> Result<Scene, String> {
    let ephs = parse_nav(&p.nav_text)?;
    let prns: Vec<u8> = if p.prns.is_empty() {
        (1..=32).collect()
    } else {
        p.prns
            .iter()
            .map(|&id| u8::try_from(id).map_err(|_| format!("PRN {id} is out of range for GPS")))
            .collect::<Result<Vec<_>, _>>()?
    };
    let mut chosen: Vec<&crate::rinex::RinexEphemeris> = Vec::new();
    for prn in prns {
        if let Some(e) = ephs
            .iter()
            .filter(|e| e.system == 'G' && e.prn == prn && e.sv_health == 0.0)
            .min_by(|a, b| {
                (a.toe - p.start_tow_s)
                    .abs()
                    .total_cmp(&(b.toe - p.start_tow_s).abs())
            })
        {
            chosen.push(e);
        }
    }
    if chosen.is_empty() {
        return Err("no healthy GPS ephemeris found for the requested PRNs".to_string());
    }
    let center = p.center_hz.unwrap_or(crate::gnss_sim::L1_HZ);
    let spec = SampleSpec {
        fs_hz: p.fs_hz,
        center_hz: center,
        if_hz: p.if_hz,
    };
    let mut cfg = SceneConfig::new(spec, p.duration_s);
    cfg.start_tow_s = p.start_tow_s;
    cfg.seed = p.seed;
    cfg.threads = p.threads.max(1);
    cfg.elevation_mask_deg = p.elevation_mask_deg;
    cfg.receiver = Trajectory::Static(geodetic_to_ecef(Geodetic {
        lat_rad: p.rx_llh_deg.0.to_radians(),
        lon_rad: p.rx_llh_deg.1.to_radians(),
        alt_m: p.rx_llh_deg.2,
    }));
    cfg.clock = ReceiverClock::default();
    cfg.noise = if p.noise {
        NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
    } else {
        NoiseConfig {
            enabled: false,
            ..NoiseConfig::from_noise_figure(p.noise_figure_db, T0_K)
        }
    };
    let mut scene = Scene::new(cfg).map_err(|e| e.to_string())?;
    for e in chosen {
        let sat = SceneSatellite::gps_l1ca_broadcast(e, p.cn0_dbhz, Default::default())
            .map_err(|err| err.to_string())?;
        scene.add_satellite(sat);
    }
    Ok(scene)
}

/// Parse a `lat,lon,alt` triple (degrees, degrees, metres).
fn parse_llh(v: &str) -> Result<(f64, f64, f64), Fail> {
    let parts: Vec<f64> = v
        .split(',')
        .map(|s| s.trim().parse::<f64>())
        .collect::<Result<_, _>>()
        .map_err(|_| Fail::Usage(format!("--rx-pos wants lat,lon,alt (got {v:?})")))?;
    if parts.len() != 3 {
        return Err(Fail::Usage(
            "--rx-pos wants three values: lat,lon,alt (deg,deg,m)".into(),
        ));
    }
    Ok((parts[0], parts[1], parts[2]))
}

/// Run `kshana iq scene <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let switches: Vec<&str> = ["--no-noise", "--data"]
        .into_iter()
        .chain(super::channel::CHANNEL_SWITCHES.iter().copied())
        .collect();
    let a = Args::parse(args, &switches).map_err(Fail::Usage)?;
    a.need_pos(1, "scene")?;
    let out = Path::new(&a.pos[0]);

    let fs_hz = a
        .num("--rate")
        .map_err(Fail::Usage)?
        .ok_or(Fail::Usage("iq scene needs --rate <hz>".into()))?;
    // The scene length: --duration, or --window (its alias in broadcast mode).
    let duration_s = a
        .num("--duration")
        .map_err(Fail::Usage)?
        .or(a.num("--window").map_err(Fail::Usage)?)
        .ok_or(Fail::Usage(
            "iq scene needs --duration <s> (or --window)".into(),
        ))?;
    let seed = a.num("--seed").map_err(Fail::Usage)?.unwrap_or(1);
    let threads = a.num("--threads").map_err(Fail::Usage)?.unwrap_or(1);
    let cn0_dbhz = a.num("--cn0").map_err(Fail::Usage)?;
    let noise = !a.has("--no-noise");
    let noise_figure_db = a.num("--noise-figure").map_err(Fail::Usage)?.unwrap_or(2.0);
    let center_hz = a.num("--center").map_err(Fail::Usage)?;
    let if_hz = a.num("--if").map_err(Fail::Usage)?.unwrap_or(0.0);

    // Broadcast-ephemeris scene (`--nav <rinex_nav>`) or stated-profile scene.
    let mut scene = if let Some(nav) = a.get("--nav") {
        let text = std::fs::read_to_string(nav).map_err(|e| Fail::Run(format!("{nav}: {e}")))?;
        let rx_llh_deg = match a.get("--rx-pos") {
            Some(v) => parse_llh(v)?,
            None => {
                return Err(Fail::Usage(
                    "iq scene --nav needs --rx-pos lat,lon,alt".into(),
                ))
            }
        };
        let bp = BroadcastParams {
            fs_hz,
            duration_s,
            nav_text: text,
            prns: a.list("--prn").map_err(Fail::Usage)?,
            start_tow_s: a.num("--start").map_err(Fail::Usage)?.unwrap_or(0.0),
            rx_llh_deg,
            center_hz,
            if_hz,
            cn0_dbhz,
            noise,
            noise_figure_db,
            seed,
            elevation_mask_deg: a.num("--mask").map_err(Fail::Usage)?.unwrap_or(5.0),
            threads,
        };
        build_broadcast_scene(&bp).map_err(Fail::Usage)?
    } else {
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
            center_hz,
            if_hz,
            cn0_dbhz,
            noise_figure_db,
            noise,
            seed,
            data: a.has("--data"),
            threads,
        };
        build_scene(&params).map_err(Fail::Usage)?
    };
    let spec = scene.config().spec;

    // Optional propagation channel applied to every satellite.
    let chan = super::channel::ChannelParams::from_args(&a)?;
    let mut chan_desc = chan.describe();
    let mut inner = None;
    if chan.any() {
        let carrier = scene
            .satellites()
            .first()
            .map(|s| s.code.carrier_hz())
            .unwrap_or(spec.center_hz);
        let start_tow = scene.config().start_tow_s;
        inner =
            super::channel::build_channel(&chan, carrier, seed, start_tow).map_err(Fail::Usage)?;
    }
    // Optional C/N0 profile (time-varying signal strength), applied over the channel.
    let cn0_profile = match a.get("--cn0-profile") {
        Some(p) => {
            let text = std::fs::read_to_string(p).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
            Some(Cn0Profile::parse(&text).map_err(|e| Fail::Usage(e.to_string()))?)
        }
        None => None,
    };
    match (&cn0_profile, inner) {
        (Some(prof), inner) => {
            chan_desc = format!(
                "{chan_desc}; C/N0 profile ({} segment(s))",
                prof.segments.len()
            );
            scene.set_channel(Box::new(Cn0ProfileChannel::new(prof.clone(), inner)));
        }
        (None, Some(ch)) => scene.set_channel(ch),
        (None, None) => {}
    }

    // SigMF output: `--format sigmf`, or an out path ending in a SigMF suffix. The samples
    // are written to the `.sigmf-data` file as cf32_le and described by a `.sigmf-meta`
    // document (captures + per-satellite annotations) in place of the raw JSON sidecar.
    let want_sigmf = a
        .get("--format")
        .map(|f| f.eq_ignore_ascii_case("sigmf"))
        .unwrap_or(false)
        || is_sigmf_path(&a.pos[0]);

    // Per-satellite metadata for the SigMF annotations, captured before the scene is consumed.
    let sat_meta: Vec<SatMeta> = scene
        .satellites()
        .iter()
        .map(|s| SatMeta {
            id: s.id,
            carrier_hz: s.code.carrier_hz(),
            chip_rate_hz: s.code.chip_rate_hz(),
            cn0_dbhz: s.cn0_dbhz,
        })
        .collect();

    let format = if want_sigmf {
        SampleFormat::CF32_LE
    } else {
        match a.get("--format") {
            Some(f) => SampleFormat::parse(f)?,
            None => SampleFormat::CF32_LE,
        }
    };

    // Truth sidecar: CSV by default, JSON Lines on request.
    let truth_fmt = a.get("--truth-format").unwrap_or("csv").to_string();
    let truth_path = a
        .get("--truth")
        .map(|s| s.to_string())
        .unwrap_or_else(|| default_truth_path(out, &truth_fmt));

    let data_path = if want_sigmf {
        sigmf_data_path(&a.pos[0])
    } else {
        a.pos[0].clone()
    };

    // Integer outputs are scaled so the scene's expected RMS sits at a stated fraction of
    // the integer range (see [`integer_scale`]); float outputs keep the scene's own units.
    let rms = expected_rms_per_component(&scene);
    let scale = integer_target_rms(format).map(|target| rms / target);
    let mut iq = create_raw(Path::new(&data_path), format)?.with_scale(scale.unwrap_or(1.0));
    let truth_file = BufWriter::new(
        File::create(&truth_path).map_err(|e| Fail::Run(format!("{truth_path}: {e}")))?,
    );
    let mut truth_writer: Box<dyn TruthSink> = match truth_fmt.as_str() {
        "csv" => Box::new(CsvTruthWriter::new(truth_file)),
        "jsonl" | "jsonlines" => Box::new(JsonLinesTruthWriter::new(truth_file)),
        other => {
            return Err(Fail::Usage(format!(
                "--truth-format must be csv or jsonl (got {other:?})"
            )))
        }
    };
    let summary = match cn0_profile {
        // The truth states the profiled C/N0.
        Some(prof) => generate(
            scene,
            &mut iq,
            &mut ProfiledTruth::new(prof, truth_writer.as_mut()),
        )?,
        None => generate(scene, &mut iq, truth_writer.as_mut())?,
    };

    let clipped = iq.clipped();
    let scale_note = match scale {
        Some(sc) => format!(
            "; integer scale: 1 LSB = {sc:.6e} noise-normalised units (expected RMS {:.4} LSB per component), {clipped} element(s) clipped",
            rms / sc
        ),
        None => String::new(),
    };

    let meta_note = if want_sigmf {
        let meta_path = write_sigmf_meta(&a.pos[0], &spec, &sat_meta, &chan_desc, summary.samples)?;
        format!("SigMF data {data_path}, meta {meta_path}")
    } else {
        let sidecar = RawSidecar {
            format: format.name(),
            sample_rate_hz: spec.fs_hz,
            center_hz: Some(spec.center_hz),
            if_hz: (spec.if_hz != 0.0).then_some(spec.if_hz),
            header_bytes: None,
            channels: None,
            channel: None,
            datetime: None,
            description: Some(format!("written by kshana iq scene{scale_note}")),
        };
        let sidecar_path = write_sidecar(out, &sidecar)?;
        format!("sidecar {}", sidecar_path.display())
    };

    Ok(format!(
        "wrote {} samples ({}, {} Hz) to {}; {} truth records to {}; {}; channel: {}{}",
        summary.samples,
        format.name(),
        spec.fs_hz,
        data_path,
        summary.truth_records,
        truth_path,
        meta_note,
        chan_desc,
        scale_note,
    ))
}

/// Fraction of the integer full scale the expected per-component RMS is placed at: 1/4,
/// so a Gaussian scene clips on `2·Q(4) ≈ 6.3e-5` of its elements while the noise still
/// spans ±32 levels in ci8 and ±8192 in ci16.
const INTEGER_RMS_FRACTION: f64 = 0.25;

/// The per-component RMS, in output LSB, an integer `format` is scaled to; `None` for
/// float formats, which keep the scene's own (noise-normalised) units.
///
/// 8- and 16-bit encodings place the RMS at [`INTEGER_RMS_FRACTION`] of full scale
/// (127 and 32767); the other integer widths do the same against their own decoded full
/// scale. The 2-bit encodings (levels ±1, ±3, thresholds 0 and ±2) place it at
/// 2 LSB, so the ±2 thresholds sit at one standard deviation: the near-optimal 2-bit
/// quantiser for Gaussian input (threshold ≈ 1.0 σ).
pub(crate) fn integer_target_rms(format: SampleFormat) -> Option<f64> {
    match format.encoding {
        Encoding::I8 => Some(INTEGER_RMS_FRACTION * f64::from(i8::MAX)),
        Encoding::I16Le | Encoding::I16Be => Some(INTEGER_RMS_FRACTION * f64::from(i16::MAX)),
        Encoding::TwoBit { .. } | Encoding::TwoBitPerByte { .. } => Some(2.0),
        // The other integer encodings follow the same rule against their decoded full
        // scale: ±(2ⁿ − 1) for the offset-binary codes (levels `2c − (2ⁿ − 1)`), −2ⁿ⁻¹…2ⁿ⁻¹ − 1
        // for the two's-complement ones.
        Encoding::I4 { .. } => Some(INTEGER_RMS_FRACTION * 7.0),
        Encoding::U4 { .. } => Some(INTEGER_RMS_FRACTION * 15.0),
        Encoding::U8 => Some(INTEGER_RMS_FRACTION * 255.0),
        Encoding::I12 { .. } => Some(INTEGER_RMS_FRACTION * 2047.0),
        Encoding::U12 { .. } => Some(INTEGER_RMS_FRACTION * 4095.0),
        Encoding::U16 { .. } => Some(INTEGER_RMS_FRACTION * 65535.0),
        Encoding::F32Le | Encoding::F32Be => None,
    }
}

/// Expected RMS of one output component (I or Q) of `scene`, in the scene's output units,
/// from its configuration alone (the scene is streamed, so it cannot be measured first).
///
/// Thermal noise contributes `N0·fs/2` per component when enabled; satellite `i` adds
/// `A_i²/2` with `A_i² = (C/N0)_i · N0`, its stated C/N0 or, without one, the elevation
/// model's zenith value (an upper bound). Both are multiplied by the scene's output gain
/// (`1/(N0·fs)` when normalised). Channel fading, multipath and scintillation are not
/// included: they change the signal power by a few dB on signals that, at GNSS C/N0 and
/// MHz rates, sit tens of dB below the noise.
pub(crate) fn expected_rms_per_component(scene: &Scene) -> f64 {
    let cfg = scene.config();
    let n0 = cfg.noise.n0_w_per_hz();
    let fs = cfg.spec.fs_hz;
    let gain2 = if cfg.noise.normalise {
        1.0 / (n0 * fs)
    } else {
        1.0
    };
    let noise = if cfg.noise.enabled { n0 * fs } else { 0.0 };
    let signals: f64 = scene
        .satellites()
        .iter()
        .map(|s| {
            let cn0 = s.cn0_dbhz.unwrap_or(cfg.cn0_model.zenith_dbhz);
            10f64.powf(cn0 / 10.0) * n0
        })
        .sum();
    ((noise + signals) * gain2 / 2.0).sqrt()
}

/// Per-satellite data for a SigMF annotation.
struct SatMeta {
    id: u32,
    carrier_hz: f64,
    chip_rate_hz: f64,
    cn0_dbhz: Option<f64>,
}

/// Whether `path` names a SigMF recording by one of its suffixes.
fn is_sigmf_path(path: &str) -> bool {
    path.ends_with(".sigmf-meta") || path.ends_with(".sigmf-data") || path.ends_with(".sigmf")
}

/// The base of a SigMF path (stripping any SigMF suffix).
fn sigmf_base(path: &str) -> &str {
    path.strip_suffix(".sigmf-meta")
        .or_else(|| path.strip_suffix(".sigmf-data"))
        .or_else(|| path.strip_suffix(".sigmf"))
        .unwrap_or(path)
}

/// The `.sigmf-data` path for `path`.
fn sigmf_data_path(path: &str) -> String {
    format!("{}.sigmf-data", sigmf_base(path))
}

/// Write the `.sigmf-meta` document (one capture, one annotation per satellite plus one for
/// the channel) and return its path.
fn write_sigmf_meta(
    path: &str,
    spec: &SampleSpec,
    sats: &[SatMeta],
    chan_desc: &str,
    samples: u64,
) -> Result<String, Fail> {
    use crate::sigmf::{meta_to_json, Annotation, DataType, Meta};
    let mut meta = Meta::new(
        DataType::Cf32Le,
        spec.fs_hz,
        spec.center_hz,
        "written by kshana iq scene",
    );
    for s in sats {
        let cn0 = s
            .cn0_dbhz
            .map(|c| format!("{c} dB-Hz"))
            .unwrap_or_else(|| "elevation default".to_string());
        meta.annotations.push(Annotation {
            sample_start: 0,
            sample_count: Some(samples),
            freq_lower_edge: Some(s.carrier_hz - s.chip_rate_hz),
            freq_upper_edge: Some(s.carrier_hz + s.chip_rate_hz),
            label: Some(format!("PRN {}", s.id)),
            comment: Some(format!("C/N0 {cn0}")),
        });
    }
    meta.annotations.push(Annotation {
        sample_start: 0,
        sample_count: Some(samples),
        freq_lower_edge: None,
        freq_upper_edge: None,
        label: Some("channel".to_string()),
        comment: Some(chan_desc.to_string()),
    });
    let json = meta_to_json(&meta).map_err(Fail::Run)?;
    let meta_path = format!("{}.sigmf-meta", sigmf_base(path));
    std::fs::write(&meta_path, json).map_err(|e| Fail::Run(format!("{meta_path}: {e}")))?;
    Ok(meta_path)
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
