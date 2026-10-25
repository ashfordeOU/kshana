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

pub(crate) use crate::iq::scene::synthetic::{build_scene, SceneParams};
use crate::portable_math::PortableFloat;

use super::{Args, Fail};
use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::iq::channel::cn0_profile::{Cn0Profile, Cn0ProfileChannel, ProfiledTruth};
use crate::iq::io::inventory::{write_sidecar, RawSidecar};
use crate::iq::io::stream::create_raw;
use crate::iq::io::{Encoding, SampleFormat};
use crate::iq::scene::{
    CsvTruthWriter, JsonLinesTruthWriter, NoiseConfig, ReceiverClock, Scene, SceneConfig,
    SceneSatellite, Trajectory, TruthSink, T0_K,
};
use crate::iq::{IqError, SampleSpec};
use crate::rinex::parse_nav;
use std::fs::File;
use std::io::BufWriter;
use std::path::Path;

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
            .map(|&id| {
                u8::try_from(id)
                    .map_err(|_| crate::terr!("e-iq-cli-scene-prn-is-out-of-range", id = id))
            })
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
        return Err(crate::terr!(
            "e-iq-cli-scene-no-healthy-gps-ephemeris-found"
        ));
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
        .map_err(|_| {
            Fail::Usage(crate::t!(
                "iq-cli-scene-rx-pos-wants-lat-lon",
                v = format!("{:?}", v)
            ))
        })?;
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
    // The same description for the files (the SigMF annotation): English in every language.
    let mut chan_desc_en = crate::i18n::in_english(|| chan.describe());
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
            chan_desc = crate::t!(
                "iq-cli-scene-n0-profile-segment",
                chan_desc = chan_desc,
                segments = prof.segments.len()
            );
            chan_desc_en = crate::i18n::in_english(|| {
                crate::t!(
                    "iq-cli-scene-n0-profile-segment",
                    chan_desc = chan_desc_en,
                    segments = prof.segments.len()
                )
            });
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

    // ION GNSS SDR metadata output: `--format sdrx` (ci8) or `--format sdrx:ci16_le`, or an
    // out path ending `.sdrx`. The samples go to `<base>.bin`, described by `<base>.sdrx`.
    let sdrx_format = sdrx_sample_format(a.get("--format"), &a.pos[0])?;
    let want_sdrx = sdrx_format.is_some();
    if want_sdrx && want_sigmf {
        return Err(Fail::Usage("--format takes sigmf or sdrx, not both".into()));
    }

    let format = if want_sigmf {
        SampleFormat::CF32_LE
    } else if let Some(f) = sdrx_format {
        f
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
    } else if want_sdrx {
        sdrx_data_path(&a.pos[0])
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
            return Err(Fail::Usage(crate::t!(
                "iq-cli-scene-truth-format-must-be-csv",
                other = format!("{:?}", other)
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
    // The integer scale, stated when the format is an integer one: (scale, expected RMS, clipped).
    let scale_note = scale.map(|sc| {
        (
            crate::i18n::localise_decimal(format!("{:.6e}", sc)),
            crate::i18n::localise_decimal(format!("{:.4}", rms / sc)),
        )
    });
    // The note written into the sidecar and the metadata files: English in every language.
    let scale_note_en = crate::i18n::in_english(|| {
        scale.map(|sc| {
            (
                crate::i18n::localise_decimal(format!("{:.6e}", sc)),
                crate::i18n::localise_decimal(format!("{:.4}", rms / sc)),
            )
        })
    });

    let meta_note = if want_sdrx {
        let comment = match &scale_note_en {
            Some((sc, v1)) => crate::i18n::in_english(|| {
                crate::t!(
                    "iq-cli-scene-written-by-kshana-iq-scene-integer-scale",
                    sc = sc,
                    v1 = v1,
                    clipped = clipped
                )
            }),
            None => {
                crate::i18n::in_english(|| crate::t!("iq-cli-scene-written-by-kshana-iq-scene"))
            }
        };
        let path = write_sdrx_meta(&a.pos[0], &data_path, format, &spec, &comment)?;
        crate::t!("iq-cli-scene-ion-sdr-metadata", path = path)
    } else if want_sigmf {
        let meta_path =
            write_sigmf_meta(&a.pos[0], &spec, &sat_meta, &chan_desc_en, summary.samples)?;
        crate::t!(
            "iq-cli-scene-sigmf-data-meta",
            data_path = data_path,
            meta_path = meta_path
        )
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
            description: Some(match &scale_note_en {
                Some((sc, v1)) => crate::i18n::in_english(|| {
                    crate::t!(
                        "iq-cli-scene-written-by-kshana-iq-scene-2-integer-scale",
                        sc = sc,
                        v1 = v1,
                        clipped = clipped
                    )
                }),
                None => crate::i18n::in_english(|| {
                    crate::t!("iq-cli-scene-written-by-kshana-iq-scene-2")
                }),
            }),
        };
        let sidecar_path = write_sidecar(out, &sidecar)?;
        format!("sidecar {}", sidecar_path.display())
    };

    Ok(match &scale_note {
        Some((sc, v1)) => crate::t!(
            "iq-cli-scene-wrote-samples-hz-to-truth-integer-scale",
            samples = summary.samples,
            format = format.name(),
            fs_hz = spec.fs_hz,
            data_path = data_path,
            truth_records = summary.truth_records,
            truth_path = truth_path,
            meta_note = meta_note,
            chan_desc = chan_desc,
            sc = sc,
            v1 = v1,
            clipped = clipped
        ),
        None => crate::t!(
            "iq-cli-scene-wrote-samples-hz-to-truth",
            samples = summary.samples,
            format = format.name(),
            fs_hz = spec.fs_hz,
            data_path = data_path,
            truth_records = summary.truth_records,
            truth_path = truth_path,
            meta_note = meta_note,
            chan_desc = chan_desc
        ),
    })
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
            10f64.ppowf(cn0 / 10.0) * n0
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

/// The sample format `iq scene` writes for ION metadata output, or `None` when the output
/// is not `.sdrx`: `--format sdrx` is 8-bit two's-complement I/Q (`ci8`), `--format
/// sdrx:ci16_le` names 16-bit. The metadata standard has no float coding, so those are
/// refused.
fn sdrx_sample_format(flag: Option<&str>, out: &str) -> Result<Option<SampleFormat>, Fail> {
    let lower = flag.map(str::to_ascii_lowercase);
    // `Some(None)`: plain `sdrx`; `Some(Some(name))`: `sdrx:<name>`; `None`: not named.
    let named: Option<Option<String>> = match lower.as_deref() {
        Some("sdrx") => Some(None),
        Some(f) => f.strip_prefix("sdrx:").map(|r| Some(r.to_string())),
        None => None,
    };
    if named.is_none() && !out.ends_with(".sdrx") {
        return Ok(None);
    }
    let name = match (named, lower) {
        (Some(n), _) => n,
        (None, Some(f)) if f == "sigmf" => {
            return Err(Fail::Usage("--format takes sigmf or sdrx, not both".into()))
        }
        (None, f) => f,
    };
    let fmt = match name {
        None => SampleFormat::CI8,
        Some(n) => SampleFormat::parse(&n)?,
    };
    if fmt != SampleFormat::CI8 && fmt != SampleFormat::CI16_LE {
        return Err(Fail::Usage(
            "--format sdrx writes ci8 (the default) or ci16_le (sdrx:ci16_le); the ION \
             metadata standard has no floating-point coding"
                .into(),
        ));
    }
    Ok(Some(fmt))
}

/// `path` without a `.sdrx` suffix.
fn sdrx_base(path: &str) -> &str {
    path.strip_suffix(".sdrx").unwrap_or(path)
}

/// The data file written beside an `.sdrx`.
fn sdrx_data_path(path: &str) -> String {
    format!("{}.bin", sdrx_base(path))
}

/// Write `<base>.sdrx` describing the `format` samples in `data_path`. The reader of
/// `crate::realdata::ion_sdr` gives the layout back (checked in `tests/iq_formats.rs`).
fn write_sdrx_meta(
    out: &str,
    data_path: &str,
    format: SampleFormat,
    spec: &SampleSpec,
    comment: &str,
) -> Result<String, Fail> {
    use crate::realdata::ion_sdr::{write_sdrx, Encoding as E, SampleFormat as F, SdrLayout};
    let (word_bytes, q) = if format == SampleFormat::CI8 {
        (1, 8)
    } else {
        (2, 16)
    };
    let layout = SdrLayout {
        url: Path::new(data_path)
            .file_name()
            .map(|n| n.to_string_lossy().into_owned())
            .unwrap_or_else(|| data_path.to_string()),
        sample_rate_hz: spec.fs_hz,
        center_freq_hz: spec.center_hz,
        translated_freq_hz: spec.if_hz,
        quantization: q,
        packed_bits: 2 * q,
        align_left: false,
        format: F::Iq,
        encoding: E::TwosComplement,
        word_bytes,
        // A sample is two words: I, then Q, in file order. Words are little-endian.
        words_per_chunk: 2,
        little_endian: true,
        fill_lsb_first: false,
        mid_rise: false,
        pad_head: false,
        samples_per_lump: 1,
        header_bytes: 0,
        footer_bytes: 0,
    };
    let text = write_sdrx(&layout, comment).map_err(Fail::Run)?;
    let path = format!("{}.sdrx", sdrx_base(out));
    std::fs::write(&path, text).map_err(|e| Fail::Run(format!("{path}: {e}")))?;
    Ok(path)
}

/// The `.sigmf-data` path for `path`.
fn sigmf_data_path(path: &str) -> String {
    crate::i18n::in_english(|| crate::t!("iq-cli-scene-sigmf-data", sigmf_base = sigmf_base(path)))
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
    let meta_path = crate::i18n::in_english(|| {
        crate::t!("iq-cli-scene-sigmf-meta", sigmf_base = sigmf_base(path))
    });
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
