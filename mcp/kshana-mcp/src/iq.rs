// SPDX-License-Identifier: AGPL-3.0-only
//! The GNSS IQ tools: `kshana iq` (the engine's signal-level layer) served over MCP.
//!
//! IQ recordings run to gigabytes, so **no sample ever crosses the protocol**. The contract:
//!
//! * **A work directory.** The server reads and writes IQ files only inside one directory,
//!   set by [`IQ_DIR_ENV`] (`KSHANA_MCP_IQ_DIR`). Every tool takes paths relative to it (an
//!   absolute path is accepted only when it resolves inside it). Inputs are resolved through
//!   symlinks before the check, outputs must name a file in an existing folder inside it, and
//!   an output that already exists is refused unless the call says `overwrite`. With no work
//!   directory configured, every file tool is refused with the reason and `iq_signals` says
//!   so; the rest of the server is unaffected.
//! * **A sample budget.** No call generates or processes more than [`IQ_MAX_SAMPLES_ENV`]
//!   (`KSHANA_MCP_IQ_MAX_SAMPLES`, default [`DEFAULT_MAX_SAMPLES`]) complex samples. The
//!   check runs before any work, from the request (a scene's `rate_hz × duration_s`) or the
//!   recording's own length, and the refusal names the numbers that fit.
//! * **Compact replies.** Each tool answers with one JSON summary — acquisition peaks, C/N0,
//!   lock state, and every file written with its path (relative to the work directory) and
//!   byte count. Per-epoch tables go to files the caller names, never into the reply.
//!
//! Each tool drives [`kshana::iq::cli::execute`] — the very code path `kshana iq` runs — so
//! an agent gets the CLI's bits, with nothing written to stdout (the JSON-RPC channel). The
//! layer is software only: it writes files for software receivers, drives no radio hardware,
//! and synthesises no interference or spoofing waveform.

use crate::server::KshanaServer;
use kshana::iq::cli::{CommandError, build_code, execute, signal_names};
use kshana::iq::io::inventory::{RawSidecar, inventory_entry, open_recording};
use kshana::iq::{SampleSpec, SpreadingCode};
use rmcp::handler::server::wrapper::Parameters;
use rmcp::model::{CallToolResult, ContentBlock};
use rmcp::{ErrorData as McpError, schemars, tool, tool_router};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicU64, Ordering};

/// Environment variable naming the IQ work directory.
pub const IQ_DIR_ENV: &str = "KSHANA_MCP_IQ_DIR";
/// Environment variable overriding the per-call sample budget.
pub const IQ_MAX_SAMPLES_ENV: &str = "KSHANA_MCP_IQ_MAX_SAMPLES";
/// The default per-call sample budget: 50 million complex samples (10 s at 5 MHz): 400 MB
/// as `cf32_le`, 200 MB as `ci16_le`, 100 MB as `ci8`.
pub const DEFAULT_MAX_SAMPLES: u64 = 50_000_000;
/// The most synthesis threads a scene may ask for.
const MAX_THREADS: usize = 64;

/// Where the IQ tools may read and write, and how much one call may process.
#[derive(Clone, Debug)]
pub struct IqConfig {
    /// The canonical work directory, when one is configured and usable.
    work_dir: Option<PathBuf>,
    /// Why the IQ tools are off, when they are.
    disabled_reason: Option<String>,
    /// The per-call sample budget.
    max_samples: u64,
}

impl IqConfig {
    /// A configuration over `work_dir` (which must exist) with a budget of `max_samples`.
    pub fn new(work_dir: impl AsRef<Path>, max_samples: u64) -> Result<Self, String> {
        let dir = work_dir.as_ref();
        let canon = dir
            .canonicalize()
            .map_err(|e| format!("IQ work directory {}: {e}", dir.display()))?;
        if !canon.is_dir() {
            return Err(format!(
                "IQ work directory {} is not a directory",
                dir.display()
            ));
        }
        if max_samples == 0 {
            return Err("the IQ sample budget must be at least 1".into());
        }
        Ok(Self {
            work_dir: Some(canon),
            disabled_reason: None,
            max_samples,
        })
    }

    /// A configuration with the IQ file tools switched off, for `reason`.
    pub fn disabled(reason: impl Into<String>) -> Self {
        Self {
            work_dir: None,
            disabled_reason: Some(reason.into()),
            max_samples: DEFAULT_MAX_SAMPLES,
        }
    }

    /// Read [`IQ_DIR_ENV`] and [`IQ_MAX_SAMPLES_ENV`]. A missing or unusable setting turns
    /// the IQ file tools off with the reason; it never stops the server.
    pub fn from_env() -> Self {
        let max_samples = match std::env::var(IQ_MAX_SAMPLES_ENV) {
            Err(_) => DEFAULT_MAX_SAMPLES,
            Ok(v) => match v.trim().parse::<u64>() {
                Ok(n) if n > 0 => n,
                _ => {
                    return Self::disabled(format!(
                        "{IQ_MAX_SAMPLES_ENV}={v:?} is not a positive whole number of samples"
                    ));
                }
            },
        };
        match std::env::var_os(IQ_DIR_ENV) {
            None => Self::disabled(format!(
                "no IQ work directory is configured; set {IQ_DIR_ENV} to a folder in the \
                 server's environment to enable the IQ file tools"
            )),
            Some(dir) => Self::new(&dir, max_samples).unwrap_or_else(Self::disabled),
        }
    }

    /// The canonical work directory, when the IQ file tools are on.
    pub fn work_dir(&self) -> Option<&Path> {
        self.work_dir.as_deref()
    }

    /// The per-call sample budget.
    pub fn max_samples(&self) -> u64 {
        self.max_samples
    }

    /// The work directory, or the refusal that says why there is none.
    fn root(&self) -> Result<&Path, McpError> {
        self.work_dir.as_deref().ok_or_else(|| {
            bad(format!(
                "IQ file tools are off: {}",
                self.disabled_reason
                    .as_deref()
                    .unwrap_or("no work directory")
            ))
        })
    }

    /// Resolve an existing input file inside the work directory.
    fn input(&self, rel: &str) -> Result<PathBuf, McpError> {
        let root = self.root()?;
        let joined = join(root, rel)?;
        let canon = joined
            .canonicalize()
            .map_err(|e| bad(format!("input `{rel}`: {e}")))?;
        if !canon.starts_with(root) {
            return Err(outside(rel));
        }
        if !canon.is_file() {
            return Err(bad(format!("input `{rel}` is not a file")));
        }
        Ok(canon)
    }

    /// Resolve an output file inside the work directory: its folder must exist inside it,
    /// and the file must not exist unless `overwrite` (a symlink is never written through).
    fn output(&self, rel: &str, overwrite: bool) -> Result<PathBuf, McpError> {
        let root = self.root()?;
        let joined = join(root, rel)?;
        let name = joined
            .file_name()
            .filter(|n| *n != "." && *n != "..")
            .ok_or_else(|| bad(format!("output `{rel}` does not name a file")))?
            .to_owned();
        let parent = joined.parent().unwrap_or(root);
        let parent = parent
            .canonicalize()
            .map_err(|e| bad(format!("output `{rel}`: its folder: {e}")))?;
        if !parent.starts_with(root) {
            return Err(outside(rel));
        }
        let full = parent.join(name);
        self.writable(&full, overwrite)?;
        Ok(full)
    }

    /// Refuse to write `path` when it exists (unless `overwrite`) or is a symlink.
    fn writable(&self, path: &Path, overwrite: bool) -> Result<(), McpError> {
        if let Ok(meta) = std::fs::symlink_metadata(path) {
            let shown = self.rel(path);
            if meta.file_type().is_symlink() {
                return Err(bad(format!(
                    "output `{shown}` is a symlink; refusing to write"
                )));
            }
            if !overwrite {
                return Err(bad(format!(
                    "output `{shown}` already exists; pass overwrite: true to replace it"
                )));
            }
            if !meta.is_file() {
                return Err(bad(format!("output `{shown}` exists and is not a file")));
            }
        }
        Ok(())
    }

    /// `path` relative to the work directory, for replies (absolute when outside it).
    fn rel(&self, path: &Path) -> String {
        self.work_dir
            .as_deref()
            .and_then(|root| path.strip_prefix(root).ok())
            .unwrap_or(path)
            .display()
            .to_string()
    }

    /// Open `path` (already resolved), check every data file it reads lies inside the work
    /// directory, and return its spec and length in samples.
    fn open(&self, path: &Path, raw: Option<&RawInput>) -> Result<Opened, McpError> {
        let root = self.root()?;
        let opened = open_recording(path, raw.map(RawInput::sidecar))
            .map_err(|e| bad(format!("{}: {e}", self.rel(path))))?;
        for (data, _) in &opened.data_files {
            let canon = data
                .canonicalize()
                .map_err(|e| bad(format!("{}: {e}", data.display())))?;
            if !canon.starts_with(root) {
                return Err(bad(format!(
                    "{}: its data file lies outside the IQ work directory",
                    self.rel(path)
                )));
            }
        }
        Ok(Opened {
            spec: opened.source.spec(),
            samples: opened.n_samples,
            format: opened.format.name(),
        })
    }

    /// Refuse a call that would touch more than the budget.
    fn budget(&self, samples: u64, what: &str, remedy: &str) -> Result<(), McpError> {
        if samples > self.max_samples {
            return Err(bad(format!(
                "{what} is {samples} samples and one call may process at most {} \
                 ({IQ_MAX_SAMPLES_ENV}); {remedy}",
                self.max_samples
            )));
        }
        Ok(())
    }

    /// A fresh scratch path in the work directory for an artifact read back and deleted.
    fn scratch(&self, ext: &str) -> Result<PathBuf, McpError> {
        static NEXT: AtomicU64 = AtomicU64::new(0);
        let n = NEXT.fetch_add(1, Ordering::Relaxed);
        Ok(self
            .root()?
            .join(format!(".kshana-mcp-{}-{n}.{ext}", std::process::id())))
    }

    /// `{path, bytes}` for each file in `paths` that exists.
    fn written(&self, paths: &[PathBuf]) -> Vec<serde_json::Value> {
        paths
            .iter()
            .filter_map(|p| {
                std::fs::metadata(p)
                    .ok()
                    .map(|m| serde_json::json!({ "path": self.rel(p), "bytes": m.len() }))
            })
            .collect()
    }
}

/// What [`IqConfig::open`] learns about a recording.
struct Opened {
    spec: SampleSpec,
    samples: u64,
    format: String,
}

/// An `invalid_params` error, the shape every tool of this server reports.
fn bad(message: String) -> McpError {
    McpError::invalid_params(message, None)
}

fn outside(rel: &str) -> McpError {
    bad(format!("`{rel}` lies outside the IQ work directory"))
}

/// `rel` joined onto `root`; an absolute `rel` is taken as is (and checked by the caller).
fn join(root: &Path, rel: &str) -> Result<PathBuf, McpError> {
    let rel = rel.trim();
    if rel.is_empty() {
        return Err(bad("an empty path was given".into()));
    }
    let p = Path::new(rel);
    Ok(if p.is_absolute() {
        p.to_path_buf()
    } else {
        root.join(p)
    })
}

/// Run one `kshana iq` processing command in-process.
fn run_cli(args: Vec<String>) -> Result<String, McpError> {
    execute(&args).map_err(|e| match e {
        CommandError::Usage(m) => bad(format!("iq {}: {m}", args[0])),
        CommandError::Run(m) => bad(format!("iq {} failed: {m}", args[0])),
    })
}

/// Read a JSON artifact the CLI wrote; delete it afterwards when it was scratch.
fn read_json(path: &Path, scratch: bool) -> Result<serde_json::Value, McpError> {
    let text = std::fs::read_to_string(path);
    if scratch {
        let _ = std::fs::remove_file(path);
    }
    let text = text.map_err(|e| bad(format!("{}: {e}", path.display())))?;
    serde_json::from_str(&text).map_err(|e| bad(format!("{}: {e}", path.display())))
}

/// Pretty JSON reply.
fn reply(v: serde_json::Value) -> Result<CallToolResult, McpError> {
    Ok(CallToolResult::success(vec![ContentBlock::text(
        serde_json::to_string_pretty(&v).unwrap_or_else(|_| v.to_string()),
    )]))
}

/// A comma-separated CLI list.
fn list<T: ToString>(xs: &[T]) -> String {
    xs.iter().map(T::to_string).collect::<Vec<_>>().join(",")
}

/// Argument builder: `--flag value` pairs and switches, in CLI order.
#[derive(Default)]
struct Argv(Vec<String>);

impl Argv {
    fn new(cmd: &str) -> Self {
        Self(vec![cmd.to_string()])
    }
    fn pos(&mut self, p: &Path) -> &mut Self {
        self.0.push(p.display().to_string());
        self
    }
    fn opt(&mut self, flag: &str, v: Option<impl ToString>) -> &mut Self {
        if let Some(v) = v {
            self.0.push(flag.to_string());
            self.0.push(v.to_string());
        }
        self
    }
    fn switch(&mut self, flag: &str, on: bool) -> &mut Self {
        if on {
            self.0.push(flag.to_string());
        }
        self
    }
    fn raw(&mut self, raw: Option<&RawInput>) -> &mut Self {
        if let Some(r) = raw {
            self.opt("--format", Some(&r.format))
                .opt("--rate", Some(r.rate_hz))
                .opt("--center", r.center_hz)
                .opt("--if", r.if_hz)
                .opt("--header", r.header_bytes);
        }
        self
    }
}

/// How to read a raw recording that has no sidecar (`<file>.json`) beside it.
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct RawInput {
    /// Sample format, e.g. `ci8`, `ci16_le`, `cf32_le`, `ri16_le`, `c2tc_msb` (a Q-first
    /// complex layout ends in `_qi`).
    pub format: String,
    /// Sample rate (samples/s).
    pub rate_hz: f64,
    /// Centre (radio) frequency (Hz).
    #[serde(default)]
    pub center_hz: Option<f64>,
    /// Intermediate frequency of the signal in the samples (Hz); needed for real IF data.
    #[serde(default)]
    pub if_hz: Option<f64>,
    /// Bytes of header before the first sample.
    #[serde(default)]
    pub header_bytes: Option<u64>,
}

impl RawInput {
    fn sidecar(&self) -> RawSidecar {
        RawSidecar {
            format: self.format.clone(),
            sample_rate_hz: self.rate_hz,
            center_hz: self.center_hz,
            if_hz: self.if_hz,
            header_bytes: self.header_bytes,
            datetime: None,
            description: None,
        }
    }
}

/// A propagation channel applied at the signal level to every satellite of a scene.
#[derive(Debug, Default, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct ChannelKnobs {
    /// Slant total electron content (TECU) for a first-order ionospheric delay.
    #[serde(default)]
    pub iono_stec_tecu: Option<f64>,
    /// Vertical total electron content (TECU), mapped to the slant.
    #[serde(default)]
    pub iono_vtec_tecu: Option<f64>,
    /// Use the Klobuchar broadcast ionosphere model.
    #[serde(default)]
    pub iono_klobuchar: bool,
    /// Apply the tropospheric delay.
    #[serde(default)]
    pub tropo: bool,
    /// Day of year for the tropospheric model.
    #[serde(default)]
    pub tropo_doy: Option<f64>,
    /// Amplitude scintillation index S4.
    #[serde(default)]
    pub s4: Option<f64>,
    /// Scintillation decorrelation time (s).
    #[serde(default)]
    pub scint_tau0_s: Option<f64>,
    /// Phase scintillation standard deviation (rad).
    #[serde(default)]
    pub sigma_phi_rad: Option<f64>,
    /// Antenna height for a two-ray ground multipath (m).
    #[serde(default)]
    pub multipath_height_m: Option<f64>,
    /// Ground for the multipath reflection: `dry`, `wet` or `sea`.
    #[serde(default)]
    pub multipath_ground: Option<String>,
    /// Land-mobile shadowing.
    #[serde(default)]
    pub land_mobile: bool,
    /// Non-line-of-sight reception (direct path blocked, a reflection arrives).
    #[serde(default)]
    pub nlos: bool,
}

impl ChannelKnobs {
    fn push(&self, a: &mut Argv) {
        a.opt("--iono-stec", self.iono_stec_tecu)
            .opt("--iono-vtec", self.iono_vtec_tecu)
            .switch("--iono-klobuchar", self.iono_klobuchar)
            .switch("--tropo", self.tropo)
            .opt("--tropo-doy", self.tropo_doy)
            .opt("--s4", self.s4)
            .opt("--scint-tau0", self.scint_tau0_s)
            .opt("--sigma-phi", self.sigma_phi_rad)
            .opt("--multipath-height", self.multipath_height_m)
            .opt("--multipath-ground", self.multipath_ground.as_deref())
            .switch("--land-mobile", self.land_mobile)
            .switch("--nlos", self.nlos);
    }
}

/// Receiver front-end / interference-mitigation stages, applied in the fixed order
/// band-pass, notch, pulse blanking, frequency excision, AGC, quantiser.
#[derive(Debug, Default, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct FrontendStages {
    /// Band-pass passband `[lo_hz, hi_hz]` relative to baseband.
    #[serde(default)]
    pub bandpass_hz: Option<[f64; 2]>,
    /// Band-pass transition width (Hz); default half the passband width.
    #[serde(default)]
    pub bandpass_transition_hz: Option<f64>,
    /// Band-pass stopband attenuation (dB); default 60.
    #[serde(default)]
    pub bandpass_atten_db: Option<f64>,
    /// Adaptive notch filter (removes a narrowband tone).
    #[serde(default)]
    pub notch: bool,
    /// Notch pole contraction in (0, 1); default 0.95.
    #[serde(default)]
    pub notch_r: Option<f64>,
    /// Notch normalised LMS step in (0, 1); default 0.05.
    #[serde(default)]
    pub notch_mu: Option<f64>,
    /// Pulse-blanking magnitude threshold.
    #[serde(default)]
    pub blank: Option<f64>,
    /// Pulse-blanking hold (samples).
    #[serde(default)]
    pub blank_hold: Option<usize>,
    /// Frequency-domain excision.
    #[serde(default)]
    pub excise: bool,
    /// Excision FFT length; default 256.
    #[serde(default)]
    pub excise_fft: Option<usize>,
    /// Excision false-alarm probability per bin; default 1e-3.
    #[serde(default)]
    pub excise_pfa: Option<f64>,
    /// Automatic gain control.
    #[serde(default)]
    pub agc: bool,
    /// AGC time constant (s); default 1e-3.
    #[serde(default)]
    pub agc_tau_s: Option<f64>,
    /// Quantiser bits per component (1 to 16), preceded by an automatic AGC unless `no_agc`.
    #[serde(default)]
    pub bits: Option<u32>,
    /// Quantiser step; default 1.0.
    #[serde(default)]
    pub quant_step: Option<f64>,
    /// Suppress the automatic AGC before a quantiser.
    #[serde(default)]
    pub no_agc: bool,
}

impl FrontendStages {
    fn push(&self, a: &mut Argv) {
        a.opt(
            "--bandpass",
            self.bandpass_hz.map(|[lo, hi]| format!("{lo},{hi}")),
        )
        .opt("--bandpass-transition", self.bandpass_transition_hz)
        .opt("--bandpass-atten", self.bandpass_atten_db)
        .switch("--notch", self.notch)
        .opt("--notch-r", self.notch_r)
        .opt("--notch-mu", self.notch_mu)
        .opt("--blank", self.blank)
        .opt("--blank-hold", self.blank_hold)
        .switch("--excise", self.excise)
        .opt("--excise-fft", self.excise_fft)
        .opt("--excise-pfa", self.excise_pfa)
        .switch("--agc", self.agc)
        .opt("--agc-tau", self.agc_tau_s)
        .opt("--bits", self.bits)
        .opt("--quant-step", self.quant_step)
        .switch("--no-agc", self.no_agc);
    }
}

/// Parameters for [`KshanaServer::iq_info`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct IqInfoRequest {
    /// The recording, relative to the IQ work directory: a raw file with a sidecar, a
    /// `.sigmf-meta`, or a `.sigmf-collection`.
    pub recording: String,
    /// How to read a raw file with no sidecar.
    #[serde(default)]
    pub raw: Option<RawInput>,
    /// Also compute the SHA-256 of every data file (reads the whole recording). Default
    /// false.
    #[serde(default)]
    pub hash: bool,
}

/// Parameters for [`KshanaServer::iq_scene`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct IqSceneRequest {
    /// Output recording, relative to the IQ work directory. A raw file gets a JSON sidecar
    /// at `<out>.json`; a name ending `.sigmf-meta`/`.sigmf-data`/`.sigmf` (or `format:
    /// "sigmf"`) writes a SigMF pair. The truth sidecar goes to `<out>.truth.csv` (or
    /// `.truth.jsonl`).
    pub out: String,
    /// Complex sample rate (Hz).
    pub rate_hz: f64,
    /// Scene length (s). `rate_hz × duration_s` must fit the sample budget.
    pub duration_s: f64,
    /// Signal name (see `iq_signals`). Required unless `nav` is given (broadcast mode is GPS
    /// L1 C/A).
    #[serde(default)]
    pub signal: Option<String>,
    /// One PRN per satellite (the FDMA frequency channel for GLONASS). Required unless
    /// `nav` is given, where it narrows the healthy satellites used.
    #[serde(default)]
    pub prns: Vec<i64>,
    /// Doppler per satellite (Hz): one per PRN, a single value for all, or empty for 0.
    #[serde(default)]
    pub dopplers_hz: Vec<f64>,
    /// C/N0 for every satellite (dB-Hz); default the elevation model.
    #[serde(default)]
    pub cn0_dbhz: Option<f64>,
    /// Receiver noise figure (dB); default 2.
    #[serde(default)]
    pub noise_figure_db: Option<f64>,
    /// Leave thermal noise out (a noise-free scene).
    #[serde(default)]
    pub no_noise: bool,
    /// Noise seed; default 1.
    #[serde(default)]
    pub seed: Option<u64>,
    /// Modulate seeded 50 bit/s navigation data.
    #[serde(default)]
    pub data: bool,
    /// Baseband centre frequency (Hz); default the signal's carrier.
    #[serde(default)]
    pub center_hz: Option<f64>,
    /// Residual intermediate frequency (Hz); default 0.
    #[serde(default)]
    pub if_hz: Option<f64>,
    /// Sample format of the output (default `cf32_le`), or `sigmf`.
    #[serde(default)]
    pub format: Option<String>,
    /// Truth sidecar format: `csv` (default) or `jsonl`.
    #[serde(default)]
    pub truth_format: Option<String>,
    /// Synthesis threads, 1 to 64; default 1.
    #[serde(default)]
    pub threads: Option<usize>,
    /// Broadcast-ephemeris mode: a RINEX navigation file in the work directory. Each GPS
    /// satellite is placed at its true broadcast geometry for the receiver at `rx_pos`.
    #[serde(default)]
    pub nav: Option<String>,
    /// Receiver position `[lat_deg, lon_deg, alt_m]` (broadcast mode).
    #[serde(default)]
    pub rx_pos: Option<[f64; 3]>,
    /// GPS time of week of the first sample (s, broadcast mode); default 0.
    #[serde(default)]
    pub start_tow_s: Option<f64>,
    /// Elevation mask (degrees, broadcast mode); default 5.
    #[serde(default)]
    pub mask_deg: Option<f64>,
    /// Signal-level propagation channel applied to every satellite.
    #[serde(default)]
    pub channel: Option<ChannelKnobs>,
    /// Replace output files that already exist. Default false.
    #[serde(default)]
    pub overwrite: bool,
}

/// Parameters for [`KshanaServer::iq_acquire`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct IqAcquireRequest {
    /// The recording, relative to the IQ work directory.
    pub recording: String,
    /// Signal name (see `iq_signals`).
    pub signal: String,
    /// PRNs to search (the FDMA frequency channel for GLONASS).
    pub prns: Vec<i64>,
    /// Coherent integration, in code periods; default 1.
    #[serde(default)]
    pub coherent: Option<usize>,
    /// Non-coherent sums; default 1.
    #[serde(default)]
    pub noncoherent: Option<usize>,
    /// Doppler search half-width (Hz); default 5000.
    #[serde(default)]
    pub doppler_max_hz: Option<f64>,
    /// Doppler bin (Hz); default `2 / (3 · coherent · T_code)`.
    #[serde(default)]
    pub doppler_step_hz: Option<f64>,
    /// False-alarm probability of the detection threshold; default 1e-3.
    #[serde(default)]
    pub pfa: Option<f64>,
    /// How to read a raw file with no sidecar.
    #[serde(default)]
    pub raw: Option<RawInput>,
    /// Front-end stages applied to the samples before acquisition.
    #[serde(default)]
    pub frontend: Option<FrontendStages>,
    /// Also keep the full acquisition result as JSON at this path in the work directory.
    #[serde(default)]
    pub json_out: Option<String>,
    /// Also write the acquisition table as CSV at this path in the work directory.
    #[serde(default)]
    pub csv_out: Option<String>,
    /// Replace output files that already exist. Default false.
    #[serde(default)]
    pub overwrite: bool,
}

/// Parameters for [`KshanaServer::iq_track`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct IqTrackRequest {
    /// The recording, relative to the IQ work directory.
    pub recording: String,
    /// Signal name (see `iq_signals`).
    pub signal: String,
    /// PRNs to acquire and track.
    pub prns: Vec<i64>,
    /// PLL noise bandwidth (Hz); setting it or `fll_bw_hz` selects an FLL-assisted PLL.
    #[serde(default)]
    pub pll_bw_hz: Option<f64>,
    /// FLL noise bandwidth (Hz).
    #[serde(default)]
    pub fll_bw_hz: Option<f64>,
    /// DLL noise bandwidth (Hz).
    #[serde(default)]
    pub dll_bw_hz: Option<f64>,
    /// Early-late correlator spacing (chips).
    #[serde(default)]
    pub spacing_chips: Option<f64>,
    /// Coherent integration, in code periods.
    #[serde(default)]
    pub coherent: Option<usize>,
    /// Code periods per navigation bit (omit for a data-free signal).
    #[serde(default)]
    pub periods_per_bit: Option<usize>,
    /// Track only the first `max_seconds` of the recording.
    #[serde(default)]
    pub max_seconds: Option<f64>,
    /// Coherent periods of the initialising acquisition; default auto (≈4 ms coherent: 4
    /// periods of an untiered 1 ms code such as GPS L1 C/A, 1 period of a code whose full,
    /// overlay-included period is 4 ms or longer). 1 restores the 0.32 one-period search.
    #[serde(default)]
    pub acq_coherent: Option<usize>,
    /// Non-coherent sums of the initialising acquisition; default 1.
    #[serde(default)]
    pub acq_noncoherent: Option<usize>,
    /// Doppler search half-width of the initialising acquisition (Hz); default 5000.
    #[serde(default)]
    pub doppler_max_hz: Option<f64>,
    /// How to read a raw file with no sidecar.
    #[serde(default)]
    pub raw: Option<RawInput>,
    /// A `kshana.loop-design/1` TOML file in the work directory (see
    /// `docs/design/LOOP-DESIGN-TOML.md`); the loop arguments above override it. Default:
    /// the built-in design.
    #[serde(default)]
    pub design: Option<String>,
    /// Which design of the file; default its first.
    #[serde(default)]
    pub design_name: Option<String>,
    /// Re-acquire a channel that loses lock (or false-locks) around its last Doppler.
    /// Default false.
    #[serde(default)]
    pub reacquire: bool,
    /// Stream every epoch (`kshana.track-epoch/1`: E/P/L, discriminators, loop states,
    /// C/N0, lock state) to this path in the work directory; the format follows the suffix
    /// (`.csv`, `.jsonl`, `.bin`). Bounded memory, whatever the recording's length.
    #[serde(default)]
    pub epochs_out: Option<String>,
    /// Write the lock-state events (JSON Lines) to this path in the work directory.
    #[serde(default)]
    pub events_out: Option<String>,
    /// Also keep the per-epoch output as JSON (the 0.32 shape, built in memory) at this
    /// path in the work directory.
    #[serde(default)]
    pub json_out: Option<String>,
    /// Also write the per-epoch output as CSV (the 0.32 columns, streamed) at this path in
    /// the work directory.
    #[serde(default)]
    pub csv_out: Option<String>,
    /// Replace output files that already exist. Default false.
    #[serde(default)]
    pub overwrite: bool,
}

/// Parameters for [`KshanaServer::iq_frontend`].
#[derive(Debug, serde::Deserialize, schemars::JsonSchema)]
#[serde(deny_unknown_fields)]
pub struct IqFrontendRequest {
    /// The input recording, relative to the IQ work directory.
    pub input: String,
    /// The filtered output, a raw file with a JSON sidecar at `<out>.json`.
    pub out: String,
    /// The stages to apply; at least one must be on.
    pub stages: FrontendStages,
    /// Output sample format; default `cf32_le`.
    #[serde(default)]
    pub out_format: Option<String>,
    /// How to read a raw input with no sidecar.
    #[serde(default)]
    pub raw: Option<RawInput>,
    /// Replace output files that already exist. Default false.
    #[serde(default)]
    pub overwrite: bool,
}

/// The truth sidecar's first epoch: what each satellite put into the scene at t = 0.
fn truth_first_epoch(path: &Path, jsonl: bool) -> (u64, Vec<serde_json::Value>) {
    use std::io::BufRead;
    let Ok(file) = std::fs::File::open(path) else {
        return (0, Vec::new());
    };
    let mut lines = std::io::BufReader::new(file).lines().map_while(Result::ok);
    let header: Vec<String> = if jsonl {
        Vec::new()
    } else {
        match lines.next() {
            Some(h) => h.split(',').map(str::to_string).collect(),
            None => return (0, Vec::new()),
        }
    };
    let keep = [
        "sat_id",
        "visible",
        "cn0_dbhz",
        "code_phase_chips",
        "doppler_hz",
    ];
    let mut count = 0u64;
    let mut first_t: Option<f64> = None;
    let mut first = Vec::new();
    for line in lines.filter(|l| !l.trim().is_empty()) {
        count += 1;
        let rec: serde_json::Map<String, serde_json::Value> = if jsonl {
            serde_json::from_str(&line).unwrap_or_default()
        } else {
            header
                .iter()
                .zip(line.split(','))
                .map(|(k, v)| {
                    let n = v.parse::<f64>().ok().map(serde_json::Value::from);
                    (k.clone(), n.unwrap_or_else(|| v.into()))
                })
                .collect()
        };
        let t = rec.get("t_s").and_then(serde_json::Value::as_f64);
        if first_t.is_none() {
            first_t = t;
        }
        if t == first_t {
            first.push(serde_json::Value::Object(
                keep.iter()
                    .filter_map(|k| rec.get(*k).map(|v| (k.to_string(), v.clone())))
                    .collect(),
            ));
        }
    }
    (count, first)
}

/// One acquisition detection, trimmed to what a caller decides on.
fn detection(d: &serde_json::Value) -> serde_json::Value {
    let pick = |k: &str| d.get(k).cloned().unwrap_or(serde_json::Value::Null);
    serde_json::json!({
        "code": pick("code"),
        "acquired": pick("acquired"),
        "doppler_hz": pick("doppler_hz"),
        "code_phase_chips": pick("code_phase_chips"),
        "statistic": pick("statistic"),
        "threshold": pick("threshold"),
        "peak_ratio": pick("peak_ratio"),
    })
}

#[tool_router(router = iq_tool_router, vis = "pub(crate)")]
impl KshanaServer {
    #[tool(
        description = "The GNSS IQ layer's set-up, as JSON: `signals` (the signal names iq_scene, iq_acquire and iq_track accept), `enabled` (whether the IQ file tools are on), `work_dir` (the only folder they read and write; every path argument is relative to it), `max_samples` (the most complex samples one call may generate or process) and, when off, `reason`. IQ samples never travel through the protocol: tools take file paths in the work directory and reply with compact JSON summaries. Software only: no transmit, no interference or spoofing synthesis. Call this first."
    )]
    fn iq_signals(&self) -> Result<CallToolResult, McpError> {
        let iq = &self.iq;
        reply(serde_json::json!({
            "signals": signal_names(),
            "enabled": iq.work_dir().is_some(),
            "work_dir": iq.work_dir().map(|p| p.display().to_string()),
            "max_samples": iq.max_samples(),
            "reason": iq.disabled_reason,
            "work_dir_env": IQ_DIR_ENV,
            "max_samples_env": IQ_MAX_SAMPLES_ENV,
        }))
    }

    #[tool(
        description = "Describe one IQ recording in the work directory without processing it: kind (raw with sidecar, SigMF, SigMF collection), sample format, sample rate, centre frequency, total samples, duration, data files and their size, capture boundaries and annotation count, as JSON (the same row `kshana iq info` prints). Optional `raw` describes a raw file with no sidecar; optional `hash` adds each data file's SHA-256 (reads the whole file)."
    )]
    fn iq_info(
        &self,
        Parameters(IqInfoRequest {
            recording,
            raw,
            hash,
        }): Parameters<IqInfoRequest>,
    ) -> Result<CallToolResult, McpError> {
        let path = self.iq.input(&recording)?;
        // Opening first checks every data file lies inside the work directory.
        let opened = self.iq.open(&path, raw.as_ref())?;
        let mut e = inventory_entry(&path, hash);
        if raw.is_some() && e.format.is_none() {
            // As `kshana iq info` does: a raw file read through stated flags.
            e.sample_rate_hz = Some(opened.spec.fs_hz);
            e.n_samples = Some(opened.samples);
            e.duration_s = Some(opened.samples as f64 / opened.spec.fs_hz);
            e.format = Some(opened.format);
            e.error = None;
        }
        let mut v = serde_json::to_value(&e).map_err(|err| bad(err.to_string()))?;
        if let Some(obj) = v.as_object_mut() {
            obj.insert("path".into(), self.iq.rel(Path::new(&e.path)).into());
            obj.insert(
                "data_files".into(),
                e.data_files
                    .iter()
                    .map(|p| self.iq.rel(Path::new(p)))
                    .collect::<Vec<_>>()
                    .into(),
            );
        }
        reply(v)
    }

    #[tool(
        description = "Generate a multi-satellite GNSS IQ scene into a file in the work directory (`kshana iq scene`). Stated-profile mode: `signal` + `prns` (+ optional `dopplers_hz`, `cn0_dbhz`, `data`). Broadcast mode: `nav` (a RINEX navigation file in the work directory) + `rx_pos` [lat, lon, alt] places each healthy GPS satellite at its true broadcast geometry. Optional `channel` applies ionosphere, troposphere, scintillation, multipath, land-mobile shadowing or NLOS at the signal level. `rate_hz × duration_s` must fit the sample budget (see iq_signals). Writes the recording (raw + `<out>.json` sidecar, or a SigMF pair) and a truth sidecar; replies with the files written and their byte counts, the sample count and sampling, and the truth's first epoch per satellite (code phase, Doppler, C/N0) to score iq_acquire against. Software only: no interference or spoofing waveform is synthesised."
    )]
    fn iq_scene(
        &self,
        Parameters(r): Parameters<IqSceneRequest>,
    ) -> Result<CallToolResult, McpError> {
        let iq = &self.iq;
        if !(r.rate_hz.is_finite() && r.rate_hz > 0.0) {
            return Err(bad("rate_hz must be a positive number".into()));
        }
        if !(r.duration_s.is_finite() && r.duration_s > 0.0) {
            return Err(bad("duration_s must be a positive number".into()));
        }
        let samples = (r.rate_hz * r.duration_s).round() as u64;
        iq.budget(
            samples,
            "rate_hz × duration_s",
            &format!(
                "shorten duration_s to at most {:.6} s at this rate",
                iq.max_samples() as f64 / r.rate_hz
            ),
        )?;
        let threads = r.threads.unwrap_or(1);
        if !(1..=MAX_THREADS).contains(&threads) {
            return Err(bad(format!("threads must be 1 to {MAX_THREADS}")));
        }
        let out = iq.output(&r.out, r.overwrite)?;
        let out_s = out.display().to_string();
        let sigmf = r
            .format
            .as_deref()
            .is_some_and(|f| f.eq_ignore_ascii_case("sigmf"))
            || [".sigmf-meta", ".sigmf-data", ".sigmf"]
                .iter()
                .any(|s| out_s.ends_with(s));
        let jsonl = match r.truth_format.as_deref().unwrap_or("csv") {
            "csv" => false,
            "jsonl" | "jsonlines" => true,
            other => {
                return Err(bad(format!(
                    "truth_format must be csv or jsonl (got {other:?})"
                )));
            }
        };
        // Every companion file the CLI writes, checked before anything is written.
        let truth = PathBuf::from(format!(
            "{out_s}.truth.{}",
            if jsonl { "jsonl" } else { "csv" }
        ));
        let (data, meta) = if sigmf {
            let base = ["sigmf-meta", "sigmf-data", "sigmf"]
                .iter()
                .find_map(|s| out_s.strip_suffix(&format!(".{s}")))
                .unwrap_or(&out_s);
            (
                PathBuf::from(format!("{base}.sigmf-data")),
                PathBuf::from(format!("{base}.sigmf-meta")),
            )
        } else {
            (out.clone(), PathBuf::from(format!("{out_s}.json")))
        };
        for p in [&data, &meta, &truth] {
            iq.writable(p, r.overwrite)?;
        }

        let mut a = Argv::new("scene");
        a.pos(&out)
            .opt("--rate", Some(r.rate_hz))
            .opt("--duration", Some(r.duration_s))
            .opt("--seed", r.seed)
            .opt("--threads", Some(threads))
            .opt("--cn0", r.cn0_dbhz)
            .opt("--noise-figure", r.noise_figure_db)
            .switch("--no-noise", r.no_noise)
            .opt("--center", r.center_hz)
            .opt("--if", r.if_hz)
            .opt("--format", r.format.as_deref())
            .opt("--truth-format", Some(if jsonl { "jsonl" } else { "csv" }));
        if let Some(nav) = &r.nav {
            let nav = iq.input(nav)?;
            let [lat, lon, alt] = r
                .rx_pos
                .ok_or_else(|| bad("broadcast mode (nav) needs rx_pos [lat, lon, alt]".into()))?;
            a.opt("--nav", Some(nav.display()))
                .opt("--rx-pos", Some(format!("{lat},{lon},{alt}")))
                .opt("--start", r.start_tow_s)
                .opt("--mask", r.mask_deg);
            if !r.prns.is_empty() {
                a.opt("--prn", Some(list(&r.prns)));
            }
        } else {
            let signal = r.signal.as_deref().ok_or_else(|| {
                bad("a scene needs `signal` (or `nav` for broadcast mode)".into())
            })?;
            if r.prns.is_empty() {
                return Err(bad("a scene needs at least one PRN in `prns`".into()));
            }
            a.opt("--signal", Some(signal))
                .opt("--prn", Some(list(&r.prns)))
                .switch("--data", r.data);
            if !r.dopplers_hz.is_empty() {
                a.opt("--doppler", Some(list(&r.dopplers_hz)));
            }
        }
        if let Some(ch) = &r.channel {
            ch.push(&mut a);
        }
        let message = run_cli(a.0)?;

        let Opened {
            spec, samples: n, ..
        } = iq.open(if sigmf { &meta } else { &data }, None)?;
        let (records, first_epoch) = truth_first_epoch(&truth, jsonl);
        reply(serde_json::json!({
            "recording": iq.rel(if sigmf { &meta } else { &data }),
            "samples": n,
            "sample_rate_hz": spec.fs_hz,
            "center_hz": spec.center_hz,
            "if_hz": spec.if_hz,
            "duration_s": n as f64 / spec.fs_hz,
            "truth_records": records,
            "truth_first_epoch": first_epoch,
            "files": iq.written(&[data, meta, truth]),
            "message": message.replace(&format!("{}/", iq.root()?.display()), ""),
        }))
    }

    #[tool(
        description = "FFT acquisition of one or more PRNs over an IQ recording in the work directory (`kshana iq acquire`). Reads only the samples one search needs (coherent × noncoherent code periods), which must fit the sample budget. Optional `frontend` stages (band-pass, notch, blanking, excision, AGC, quantiser) run first. Replies with one detection per PRN: `acquired`, `doppler_hz`, `code_phase_chips`, the normalised peak `statistic`, its detection `threshold` and the `peak_ratio`; `json_out` / `csv_out` also keep the full result as files."
    )]
    fn iq_acquire(
        &self,
        Parameters(r): Parameters<IqAcquireRequest>,
    ) -> Result<CallToolResult, McpError> {
        let iq = &self.iq;
        if r.prns.is_empty() {
            return Err(bad("prns must list at least one PRN".into()));
        }
        let rec = iq.input(&r.recording)?;
        let spec = iq.open(&rec, r.raw.as_ref())?.spec;
        let code = build_code(&r.signal, r.prns[0]).map_err(bad)?;
        let periods =
            r.coherent.unwrap_or(1).max(1) as u64 * r.noncoherent.unwrap_or(1).max(1) as u64;
        let needed = (spec.fs_hz * code.period_s()).ceil() as u64 * periods;
        iq.budget(
            needed,
            "this search (coherent × noncoherent code periods)",
            "lower coherent or noncoherent",
        )?;
        let json_out = r
            .json_out
            .as_deref()
            .map(|p| iq.output(p, r.overwrite))
            .transpose()?;
        let csv_out = r
            .csv_out
            .as_deref()
            .map(|p| iq.output(p, r.overwrite))
            .transpose()?;
        let (json_path, scratch) = match &json_out {
            Some(p) => (p.clone(), false),
            None => (iq.scratch("json")?, true),
        };

        let mut a = Argv::new("acquire");
        a.pos(&rec)
            .opt("--signal", Some(&r.signal))
            .opt("--prn", Some(list(&r.prns)))
            .opt("--coherent", r.coherent)
            .opt("--noncoherent", r.noncoherent)
            .opt("--doppler-max", r.doppler_max_hz)
            .opt("--doppler-step", r.doppler_step_hz)
            .opt("--pfa", r.pfa)
            .raw(r.raw.as_ref())
            .opt("--json", Some(json_path.display()))
            .opt("--csv", csv_out.as_ref().map(|p| p.display()));
        if let Some(fe) = &r.frontend {
            fe.push(&mut a);
        }
        let run = run_cli(a.0);
        if run.is_err() && scratch {
            let _ = std::fs::remove_file(&json_path);
        }
        run?;
        let full = read_json(&json_path, scratch)?;
        let detections: Vec<serde_json::Value> = full
            .get("detections")
            .and_then(serde_json::Value::as_array)
            .map(|d| d.iter().map(detection).collect())
            .unwrap_or_default();
        let acquired = detections
            .iter()
            .filter(|d| d["acquired"].as_bool() == Some(true))
            .count();
        let files: Vec<PathBuf> = json_out.into_iter().chain(csv_out).collect();
        reply(serde_json::json!({
            "recording": iq.rel(&rec),
            "sample_rate_hz": spec.fs_hz,
            "coherent_periods": full.get("coherent_periods"),
            "noncoherent": full.get("noncoherent"),
            "pfa": full.get("pfa"),
            "acquired": acquired,
            "searched": detections.len(),
            "detections": detections,
            "files": iq.written(&files),
        }))
    }

    #[tool(
        description = "Acquire then track one or more PRNs over an IQ recording in the work directory (`kshana iq track`): acquisition initialises each channel, then the DLL/PLL (optionally FLL-assisted) loop bank replays the recording once. The samples tracked (the whole recording, or its first `max_seconds`) must fit the sample budget. The loops come from `design` (a `kshana.loop-design/1` TOML file in the work directory, `design_name` to pick one) or the built-in design, with the loop arguments overriding it; `reacquire` re-acquires a channel that loses lock or false-locks. Tracking streams, so memory does not grow with the recording. Replies with the design's name and hash, any `warnings` (`commensurate_sampling`: a sample rate that is a multiple of half the chip rate makes code-loop jitter and bias unrepresentative) and, per channel, the epoch count, seconds tracked, final Doppler and code phase, final and mean C/N0 (dB-Hz), the fractions of epochs in phase and code lock, `locked_at_end`, the final lock state, false locks detected and re-acquisitions. Per-epoch output goes to files only: `epochs_out` (E/P/L, discriminators, loop states, C/N0, lock state; .csv/.jsonl/.bin), `events_out`, `json_out` / `csv_out`. A PRN that is not acquired is refused with its statistic and threshold."
    )]
    fn iq_track(
        &self,
        Parameters(r): Parameters<IqTrackRequest>,
    ) -> Result<CallToolResult, McpError> {
        let iq = &self.iq;
        if r.prns.is_empty() {
            return Err(bad("prns must list at least one PRN".into()));
        }
        let rec = iq.input(&r.recording)?;
        let Opened {
            spec, samples: n, ..
        } = iq.open(&rec, r.raw.as_ref())?;
        if let Some(s) = r.max_seconds
            && !(s.is_finite() && s > 0.0)
        {
            return Err(bad("max_seconds must be a positive number".into()));
        }
        let tracked = r
            .max_seconds
            .map(|s| ((s * spec.fs_hz).round() as u64).min(n))
            .unwrap_or(n);
        iq.budget(
            tracked,
            "the span to track",
            &format!(
                "set max_seconds to at most {:.6} s",
                iq.max_samples() as f64 / spec.fs_hz
            ),
        )?;
        let out = |p: &Option<String>| -> Result<Option<PathBuf>, McpError> {
            p.as_deref().map(|p| iq.output(p, r.overwrite)).transpose()
        };
        let json_out = out(&r.json_out)?;
        let csv_out = out(&r.csv_out)?;
        let epochs_out = out(&r.epochs_out)?;
        let events_out = out(&r.events_out)?;
        if let Some(p) = &epochs_out
            && kshana::iq::track::sink::EpochFormat::from_path(&p.display().to_string()).is_none()
        {
            return Err(bad(
                "epochs_out must end in .csv, .jsonl or .bin (the format follows the suffix)"
                    .into(),
            ));
        }
        let design = r.design.as_deref().map(|p| iq.input(p)).transpose()?;
        if r.design_name.is_some() && design.is_none() {
            return Err(bad("design_name needs design".into()));
        }
        // The summary comes from the run's own bounded-memory accumulators.
        let summary_path = iq.scratch("json")?;

        let mut a = Argv::new("track");
        a.pos(&rec)
            .opt("--signal", Some(&r.signal))
            .opt("--prn", Some(list(&r.prns)))
            .opt("--design", design.as_ref().map(|p| p.display()))
            .opt("--design-name", r.design_name.as_deref())
            .opt("--pll-bw", r.pll_bw_hz)
            .opt("--fll-bw", r.fll_bw_hz)
            .opt("--dll-bw", r.dll_bw_hz)
            .opt("--spacing", r.spacing_chips)
            .opt("--coherent", r.coherent)
            .switch("--reacquire", r.reacquire)
            .opt("--periods-per-bit", r.periods_per_bit)
            .opt("--max-seconds", r.max_seconds)
            .opt("--acq-coherent", r.acq_coherent)
            .opt("--acq-noncoherent", r.acq_noncoherent)
            .opt("--doppler-max", r.doppler_max_hz)
            .raw(r.raw.as_ref())
            .opt("--summary", Some(summary_path.display()))
            .opt("--epochs", epochs_out.as_ref().map(|p| p.display()))
            .opt("--events", events_out.as_ref().map(|p| p.display()))
            .opt("--json", json_out.as_ref().map(|p| p.display()))
            .opt("--csv", csv_out.as_ref().map(|p| p.display()));
        let run = run_cli(a.0);
        if run.is_err() {
            let _ = std::fs::remove_file(&summary_path);
        }
        run?;
        let summary = read_json(&summary_path, true)?;
        let keep = [
            "code",
            "epochs",
            "tracked_s",
            "final_doppler_hz",
            "final_code_phase_chips",
            "final_cn0_dbhz",
            "mean_cn0_dbhz",
            "phase_lock_fraction",
            "code_lock_fraction",
            "locked_at_end",
            "final_state",
            "false_locks",
            "reacquisitions",
        ];
        let channels: Vec<serde_json::Value> = summary
            .get("channels")
            .and_then(serde_json::Value::as_array)
            .map(|c| {
                c.iter()
                    .map(|ch| {
                        serde_json::Value::Object(
                            keep.iter()
                                .filter_map(|k| ch.get(*k).map(|v| (k.to_string(), v.clone())))
                                .collect(),
                        )
                    })
                    .collect()
            })
            .unwrap_or_default();
        let design_info = summary
            .get("designs")
            .and_then(|d| d.get(0))
            .map(|d| serde_json::json!({ "name": d.get("name"), "hash": d.get("hash") }));
        let files: Vec<PathBuf> = [epochs_out, events_out, json_out, csv_out]
            .into_iter()
            .flatten()
            .collect();
        reply(serde_json::json!({
            "recording": iq.rel(&rec),
            "sample_rate_hz": spec.fs_hz,
            "samples_tracked": tracked,
            "design": design_info,
            "warnings": summary.get("warnings").cloned().unwrap_or_default(),
            "channels": channels,
            "files": iq.written(&files),
        }))
    }

    #[tool(
        description = "Apply receiver front-end and interference-mitigation DSP to an IQ recording in the work directory and write the result as a new raw recording with a `<out>.json` sidecar (`kshana iq frontend`). `stages` picks any of: `bandpass_hz` [lo, hi] FIR, adaptive `notch`, pulse `blank`ing, frequency-domain `excise`, `agc`, and a `bits`-bit quantiser (preceded by an automatic AGC unless `no_agc`), always in that order. The whole input must fit the sample budget. Replies with the samples processed and the files written with their byte counts. This processes a recording; it synthesises nothing."
    )]
    fn iq_frontend(
        &self,
        Parameters(r): Parameters<IqFrontendRequest>,
    ) -> Result<CallToolResult, McpError> {
        let iq = &self.iq;
        let input = iq.input(&r.input)?;
        let Opened {
            spec, samples: n, ..
        } = iq.open(&input, r.raw.as_ref())?;
        iq.budget(
            n,
            "the input recording",
            "cut a shorter window first (kshana iq extract)",
        )?;
        let out = iq.output(&r.out, r.overwrite)?;
        if out == input {
            return Err(bad("out must differ from input".into()));
        }
        let sidecar = PathBuf::from(format!("{}.json", out.display()));
        iq.writable(&sidecar, r.overwrite)?;

        let mut a = Argv::new("frontend");
        a.pos(&input)
            .pos(&out)
            .opt("--out-format", r.out_format.as_deref())
            .raw(r.raw.as_ref());
        r.stages.push(&mut a);
        run_cli(a.0)?;
        reply(serde_json::json!({
            "input": iq.rel(&input),
            "recording": iq.rel(&out),
            "samples": n,
            "sample_rate_hz": spec.fs_hz,
            "files": iq.written(&[out, sidecar]),
        }))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn paths_resolve_inside_the_work_dir_only() {
        let dir = std::env::temp_dir().join(format!("kshana-mcp-iq-unit-{}", std::process::id()));
        std::fs::create_dir_all(dir.join("sub")).unwrap();
        std::fs::write(dir.join("a.bin"), b"").unwrap();
        let cfg = IqConfig::new(&dir, 10).unwrap();
        assert!(cfg.input("a.bin").is_ok());
        assert!(cfg.input("../a.bin").is_err());
        assert!(cfg.input("/etc/hostname").is_err());
        assert!(cfg.output("sub/b.bin", false).is_ok());
        assert!(cfg.output("a.bin", false).is_err(), "exists, no overwrite");
        assert!(cfg.output("a.bin", true).is_ok());
        assert!(cfg.output("../escape.bin", false).is_err());
        assert!(cfg.output("missing/b.bin", false).is_err());
        assert!(cfg.output("sub/..", false).is_err());
        assert!(cfg.budget(10, "x", "y").is_ok());
        assert!(cfg.budget(11, "x", "y").is_err());
        std::fs::remove_dir_all(&dir).unwrap();
    }

    #[test]
    fn a_disabled_config_refuses_with_its_reason() {
        let cfg = IqConfig::disabled("because");
        let err = cfg.input("a.bin").unwrap_err();
        assert!(err.message.contains("because"), "{}", err.message);
    }
}
