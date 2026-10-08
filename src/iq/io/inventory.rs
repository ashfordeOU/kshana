// SPDX-License-Identifier: AGPL-3.0-only
//! Dataset inventory and a single opener for every recording kind.
//!
//! A dataset folder holds SigMF recordings (`.sigmf-meta` + `.sigmf-data`), SigMF
//! collections (`.sigmf-collection`), ION GNSS SDR metadata files (`.sdrx`, read through
//! [`super::sdrx`]) and raw sample files (`.bin`, `.dat`, `.raw`) whose format is given by
//! a sidecar ([`RawSidecar`]) named `<file>.json`, `<file>.toml`, `<stem>.json` or
//! `<stem>.toml`.
//!
//! ## The raw sidecar
//!
//! The simplest description of a lab recording is a TOML file next to it, for example
//! `capture.bin.toml`:
//!
//! ```toml
//! format = "ci12r_le"        # any SampleFormat name: ci8, cu8, ci16_le, ci4_msb, c2sm_byte, ...
//! sample_rate_hz = 20e6
//! center_hz = 1575.42e6      # optional
//! if_hz = 0.0                # optional; needed for real-IF data
//! header_bytes = 512         # optional: bytes before the first sample
//! channels = 2               # optional: sample-interleaved streams in the file (default 1)
//! channel = 1                # optional: the stream to read, from 0 (default 0)
//! datetime = "2026-10-01T12:00:00Z"   # optional
//! description = "free text"           # optional
//! ```
//!
//! The same keys work as JSON (`capture.bin.json`). [`scan_dir`] reports, per recording, its format,
//! sample rate, sample count, duration, data size, the SHA-256 of the data file (streamed
//! in 64 KiB blocks, never held whole) and its capture boundaries. Hashing runs on the
//! [`super::batch`] worker pool. [`open_recording`] opens any of the three kinds as one
//! [`IqSource`].

use super::batch::run_batch;
use super::format::SampleFormat;
use super::sdrx::{layout_label, open_sdrx, read_sdrx};
use super::sigmf_stream::{
    open_sigmf_collection, open_sigmf_files, sigmf_paths, CaptureBoundary, SigmfStream,
};
use super::stream::{open_raw, DEFAULT_CHUNK_BYTES};
use crate::iq::{IqError, IqSource, SampleSpec};
use serde::{Deserialize, Serialize};
use std::io::Read;
use std::path::{Path, PathBuf};

/// The sidecar describing a raw sample file. JSON or TOML with these keys.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct RawSidecar {
    /// Sample format name ([`SampleFormat::name`]), e.g. `ci16_le` or `r2sm_msb`.
    pub format: String,
    /// Sample rate (samples/s).
    pub sample_rate_hz: f64,
    /// Centre (radio) frequency (Hz).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub center_hz: Option<f64>,
    /// Intermediate frequency of the signal in the samples (Hz); needed for real IF data.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub if_hz: Option<f64>,
    /// Bytes of header before the first sample.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub header_bytes: Option<u64>,
    /// Number of sample-interleaved streams in the file (1 when absent): sample 0 of
    /// stream 0, sample 0 of stream 1, …, then sample 1 of stream 0, ….
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channels: Option<usize>,
    /// The stream to read, from 0 (0 when absent).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub channel: Option<usize>,
    /// ISO-8601 time of the first sample.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub datetime: Option<String>,
    /// Free text.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub description: Option<String>,
}

impl RawSidecar {
    /// The sample format and spec this sidecar states.
    pub fn resolve(&self) -> Result<(SampleFormat, SampleSpec), IqError> {
        let f = SampleFormat::parse(&self.format)?;
        if !(self.sample_rate_hz.is_finite() && self.sample_rate_hz > 0.0) {
            return Err(IqError::Format(format!(
                "sidecar sample_rate_hz {} is not positive",
                self.sample_rate_hz
            )));
        }
        Ok((
            f,
            SampleSpec {
                fs_hz: self.sample_rate_hz,
                center_hz: self.center_hz.unwrap_or(0.0),
                if_hz: self.if_hz.unwrap_or(0.0),
            },
        ))
    }
}

/// The sidecar paths tried for a raw file, in order.
pub fn sidecar_candidates(path: &Path) -> Vec<PathBuf> {
    let s = path.as_os_str().to_string_lossy();
    let mut v = vec![
        PathBuf::from(format!("{s}.json")),
        PathBuf::from(format!("{s}.toml")),
    ];
    v.push(path.with_extension("json"));
    v.push(path.with_extension("toml"));
    v
}

/// Read the sidecar of a raw file, if one exists.
pub fn find_sidecar(path: &Path) -> Result<Option<(PathBuf, RawSidecar)>, IqError> {
    for c in sidecar_candidates(path) {
        if !c.is_file() {
            continue;
        }
        let text = std::fs::read_to_string(&c)
            .map_err(|e| IqError::Io(format!("{}: {e}", c.display())))?;
        let parsed: Result<RawSidecar, String> = if c.extension().is_some_and(|e| e == "toml") {
            toml::from_str(&text).map_err(|e| e.to_string())
        } else {
            serde_json::from_str(&text).map_err(|e| e.to_string())
        };
        return parsed
            .map(|s| Some((c.clone(), s)))
            .map_err(|e| IqError::Format(format!("{}: {e}", c.display())));
    }
    Ok(None)
}

/// Write a JSON sidecar for a raw file at `<path>.json`.
pub fn write_sidecar(path: &Path, sidecar: &RawSidecar) -> Result<PathBuf, IqError> {
    let p = PathBuf::from(format!("{}.json", path.display()));
    let json = serde_json::to_string_pretty(sidecar).map_err(|e| IqError::Format(e.to_string()))?;
    std::fs::write(&p, json).map_err(|e| IqError::Io(format!("{}: {e}", p.display())))?;
    Ok(p)
}

/// SHA-256 (lower-case hex) of everything `r` yields, read in 64 KiB blocks.
pub fn sha256_reader<R: Read>(mut r: R) -> Result<String, IqError> {
    use sha2::{Digest, Sha256};
    let mut h = Sha256::new();
    let mut buf = vec![0u8; 1 << 16];
    loop {
        match r.read(&mut buf) {
            Ok(0) => break,
            Ok(n) => h.update(&buf[..n]),
            Err(e) if e.kind() == std::io::ErrorKind::Interrupted => {}
            Err(e) => return Err(IqError::Io(e.to_string())),
        }
    }
    Ok(hex::encode(h.finalize()))
}

/// SHA-256 (lower-case hex) of a file, streamed.
pub fn sha256_file(path: &Path) -> Result<String, IqError> {
    let f =
        std::fs::File::open(path).map_err(|e| IqError::Io(format!("{}: {e}", path.display())))?;
    sha256_reader(f)
}

/// The kind of recording a path holds.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case")]
pub enum RecordingKind {
    /// A SigMF meta/data pair.
    Sigmf,
    /// A SigMF collection of several recordings.
    SigmfCollection,
    /// A raw sample file described by a sidecar.
    Raw,
    /// An ION GNSS SDR Metadata Standard `.sdrx` file and the data file it names.
    Sdrx,
}

/// Classify a path by extension, or `None` if it is not a recording this module reads.
pub fn recording_kind(path: &Path) -> Option<RecordingKind> {
    let name = path.file_name()?.to_string_lossy().to_ascii_lowercase();
    if name.ends_with(".sigmf-meta") || name.ends_with(".sigmf-data") {
        Some(RecordingKind::Sigmf)
    } else if name.ends_with(".sigmf-collection") {
        Some(RecordingKind::SigmfCollection)
    } else if name.ends_with(".sdrx") {
        Some(RecordingKind::Sdrx)
    } else if [".bin", ".dat", ".raw"].iter().any(|e| name.ends_with(e)) {
        Some(RecordingKind::Raw)
    } else {
        None
    }
}

/// One recording opened for streaming.
pub struct OpenedRecording {
    /// The samples.
    pub source: Box<dyn IqSource + Send>,
    /// Their format. For an `.sdrx` recording, whose layout need not be one of
    /// [`SampleFormat`]'s, this is `cf32_le` (the samples are decoded by
    /// [`super::sdrx::SdrxSource`]) and [`OpenedRecording::format_label`] describes the
    /// layout.
    pub format: SampleFormat,
    /// The format as listings show it: [`SampleFormat::name`], or the `.sdrx` layout.
    pub format_label: String,
    /// Interleaved streams in the data and the one read (`(1, 0)` for a single stream).
    pub channels: (usize, usize),
    /// Total samples.
    pub n_samples: u64,
    /// Capture boundaries (one at 0 for a raw file).
    pub boundaries: Vec<CaptureBoundary>,
    /// Number of SigMF annotations.
    pub n_annotations: usize,
    /// The data files read, with their sizes in bytes.
    pub data_files: Vec<(PathBuf, u64)>,
}

fn from_stream(
    s: SigmfStream,
    data_files: Vec<(PathBuf, u64)>,
    channel: Option<usize>,
) -> Result<OpenedRecording, IqError> {
    let s = match channel {
        Some(c) => s.select_channel(c)?,
        None => s,
    };
    Ok(OpenedRecording {
        format: s.format(),
        format_label: s.format().name(),
        channels: s.channels(),
        n_samples: s.total_samples(),
        boundaries: s.boundaries().to_vec(),
        n_annotations: s.annotations().len(),
        source: Box::new(s),
        data_files,
    })
}

fn file_len(p: &Path) -> Result<u64, IqError> {
    std::fs::metadata(p)
        .map(|m| m.len())
        .map_err(|e| IqError::Io(format!("{}: {e}", p.display())))
}

/// Open a SigMF recording, SigMF collection, `.sdrx` recording or raw file as one stream.
/// A raw file is described by `raw` when given, otherwise by its sidecar. A multi-channel
/// recording yields channel 0, or the sidecar's `channel`; see [`open_recording_with`] to
/// choose.
pub fn open_recording(path: &Path, raw: Option<RawSidecar>) -> Result<OpenedRecording, IqError> {
    open_recording_with(path, raw, None)
}

/// [`open_recording`], reading stream `channel` (from 0) of a multi-channel recording: a
/// SigMF recording with `core:num_channels` above one, or a raw file whose sidecar states
/// `channels`. `channel` overrides the sidecar's `channel`. Asking for a channel the
/// recording does not have is an error; so is asking for any channel but 0 of an `.sdrx`
/// recording (one stream is all that format's reader takes).
pub fn open_recording_with(
    path: &Path,
    raw: Option<RawSidecar>,
    channel: Option<usize>,
) -> Result<OpenedRecording, IqError> {
    match recording_kind(path) {
        Some(RecordingKind::Sigmf) => {
            let (_, dp) = sigmf_paths(path);
            let len = file_len(&dp)?;
            let s = open_sigmf_files(&[path], DEFAULT_CHUNK_BYTES)?;
            from_stream(s, vec![(dp, len)], channel)
        }
        Some(RecordingKind::Sdrx) => {
            if channel.is_some_and(|c| c != 0) {
                return Err(IqError::Format(format!(
                    "{}: .sdrx recordings hold one stream; channel {} does not exist",
                    path.display(),
                    channel.unwrap_or(0)
                )));
            }
            let (src, data, len) = open_sdrx(path)?;
            let label = layout_label(src.layout());
            let spec = src.spec();
            Ok(OpenedRecording {
                format: SampleFormat::CF32_LE,
                format_label: label,
                channels: (1, 0),
                n_samples: src.remaining(),
                boundaries: vec![CaptureBoundary {
                    sample: 0,
                    file_index: 0,
                    file_sample: 0,
                    frequency_hz: Some(spec.center_hz),
                    datetime: None,
                }],
                n_annotations: 0,
                source: Box::new(src),
                data_files: vec![(data, len)],
            })
        }
        Some(RecordingKind::SigmfCollection) => {
            let s = open_sigmf_collection(path, DEFAULT_CHUNK_BYTES)?;
            let json = std::fs::read_to_string(path)
                .map_err(|e| IqError::Io(format!("{}: {e}", path.display())))?;
            let dir = path.parent().unwrap_or(Path::new("."));
            let mut files = Vec::new();
            for st in super::sigmf_stream::parse_collection(&json)?.streams {
                let (_, dp) = sigmf_paths(&dir.join(&st.name));
                let len = file_len(&dp)?;
                files.push((dp, len));
            }
            from_stream(s, files, channel)
        }
        _ => {
            let sc = match raw {
                Some(s) => s,
                None => find_sidecar(path)?.map(|(_, s)| s).ok_or_else(|| {
                    IqError::Format(format!(
                        "{}: raw file with no sidecar; state its format, or write {}",
                        path.display(),
                        sidecar_candidates(path)[0].display()
                    ))
                })?,
            };
            let (format, spec) = sc.resolve()?;
            let header = sc.header_bytes.unwrap_or(0);
            let len = file_len(path)?;
            let channels = sc.channels.unwrap_or(1);
            let select = channel.or(sc.channel).unwrap_or(0);
            let r = open_raw(path, format, spec, header)?.with_channels(channels, select)?;
            let n = format.samples_in_bytes(len.saturating_sub(header)) / channels as u64;
            Ok(OpenedRecording {
                source: Box::new(r),
                format,
                format_label: format.name(),
                channels: (channels, select),
                n_samples: n,
                boundaries: vec![CaptureBoundary {
                    sample: 0,
                    file_index: 0,
                    file_sample: 0,
                    frequency_hz: sc.center_hz,
                    datetime: sc.datetime.clone(),
                }],
                n_annotations: 0,
                data_files: vec![(path.to_path_buf(), len)],
            })
        }
    }
}

/// One row of a dataset inventory.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct InventoryEntry {
    /// The recording's path (the `.sigmf-meta`, `.sigmf-collection` or raw file).
    pub path: String,
    /// What kind of recording it is.
    pub kind: RecordingKind,
    /// Sample format name, when known.
    pub format: Option<String>,
    /// Sample rate (samples/s), when known.
    pub sample_rate_hz: Option<f64>,
    /// Centre frequency of the first capture (Hz), when stated.
    pub center_hz: Option<f64>,
    /// Total samples, when the format is known (per stream for a multi-stream file).
    pub n_samples: Option<u64>,
    /// Interleaved streams (channels) in the data; 1 for a single-stream recording.
    #[serde(default = "one")]
    pub channels: usize,
    /// `n_samples / sample_rate_hz` (s).
    pub duration_s: Option<f64>,
    /// Total size of the data file(s) in bytes.
    pub size_bytes: u64,
    /// SHA-256 of each data file (hex, one per file, in stream order); empty when hashing
    /// was switched off.
    pub sha256: Vec<String>,
    /// The data file(s) read.
    pub data_files: Vec<String>,
    /// Capture boundaries.
    pub captures: Vec<CaptureBoundary>,
    /// Number of SigMF annotations.
    pub n_annotations: usize,
    /// Why the recording could not be read, if it could not.
    pub error: Option<String>,
}

fn one() -> usize {
    1
}

/// Options for [`scan_dir`].
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct InventoryOptions {
    /// Descend into sub-folders.
    pub recursive: bool,
    /// Compute SHA-256 of every data file.
    pub hash: bool,
    /// Worker threads (0 = available parallelism).
    pub workers: usize,
}

impl Default for InventoryOptions {
    fn default() -> Self {
        InventoryOptions {
            recursive: false,
            hash: true,
            workers: 0,
        }
    }
}

/// The inventory row for one recording. Errors are reported in the row, not returned.
pub fn inventory_entry(path: &Path, hash: bool) -> InventoryEntry {
    let kind = recording_kind(path).unwrap_or(RecordingKind::Raw);
    let shown = match kind {
        RecordingKind::Sigmf => sigmf_paths(path).0,
        _ => path.to_path_buf(),
    };
    let mut e = InventoryEntry {
        path: shown.display().to_string(),
        kind,
        format: None,
        sample_rate_hz: None,
        center_hz: None,
        n_samples: None,
        channels: 1,
        duration_s: None,
        size_bytes: 0,
        sha256: Vec::new(),
        data_files: Vec::new(),
        captures: Vec::new(),
        n_annotations: 0,
        error: None,
    };
    let opened = match open_recording(path, None) {
        Ok(o) => o,
        Err(err) => {
            if kind == RecordingKind::Raw {
                e.size_bytes = file_len(path).unwrap_or(0);
                e.data_files = vec![path.display().to_string()];
                if hash {
                    e.sha256 = sha256_file(path).into_iter().collect();
                }
            }
            e.error = Some(err.to_string());
            return e;
        }
    };
    let spec = opened.source.spec();
    e.format = Some(opened.format_label.clone());
    e.sample_rate_hz = Some(spec.fs_hz);
    e.center_hz = opened.boundaries.first().and_then(|b| b.frequency_hz);
    e.n_samples = Some(opened.n_samples);
    e.channels = opened.channels.0;
    e.duration_s = Some(opened.n_samples as f64 / spec.fs_hz);
    e.size_bytes = opened.data_files.iter().map(|(_, n)| n).sum();
    e.data_files = opened
        .data_files
        .iter()
        .map(|(p, _)| p.display().to_string())
        .collect();
    e.captures = opened.boundaries;
    e.n_annotations = opened.n_annotations;
    if hash {
        for (p, _) in &opened.data_files {
            match sha256_file(p) {
                Ok(h) => e.sha256.push(h),
                Err(err) => {
                    e.error = Some(err.to_string());
                    break;
                }
            }
        }
    }
    e
}

/// The recordings in `dir`, sorted by path: every `.sigmf-meta`, `.sigmf-collection`,
/// `.sdrx` and raw `.bin` / `.dat` / `.raw` file (a `.sigmf-data` is listed through its
/// meta file, and the data file an `.sdrx` names through the `.sdrx`).
pub fn list_recordings(dir: &Path, recursive: bool) -> Result<Vec<PathBuf>, IqError> {
    let mut out = Vec::new();
    let mut stack = vec![dir.to_path_buf()];
    while let Some(d) = stack.pop() {
        let rd = std::fs::read_dir(&d).map_err(|e| IqError::Io(format!("{}: {e}", d.display())))?;
        for ent in rd {
            let p = ent.map_err(|e| IqError::Io(e.to_string()))?.path();
            if p.is_dir() {
                if recursive {
                    stack.push(p);
                }
                continue;
            }
            let name = p.to_string_lossy().to_ascii_lowercase();
            if recording_kind(&p).is_some() && !name.ends_with(".sigmf-data") {
                out.push(p);
            }
        }
    }
    // The data file an `.sdrx` names is read through the `.sdrx`; do not list it again
    // as a raw file with no sidecar.
    let sdrx_data: std::collections::HashSet<PathBuf> = out
        .iter()
        .filter(|p| recording_kind(p) == Some(RecordingKind::Sdrx))
        .filter_map(|p| read_sdrx(p).ok().map(|(_, d)| d))
        .collect();
    out.retain(|p| !sdrx_data.contains(p));
    out.sort();
    Ok(out)
}

/// Inventory every recording in `dir` (see the module docs). Rows are in path order; the
/// per-file work runs on [`super::batch::run_batch`].
pub fn scan_dir(dir: &Path, opts: InventoryOptions) -> Result<Vec<InventoryEntry>, IqError> {
    let paths = list_recordings(dir, opts.recursive)?;
    Ok(
        run_batch(&paths, opts.workers, |p| Ok(inventory_entry(p, opts.hash)))
            .into_iter()
            .map(|r| {
                r.outcome.unwrap_or_else(|err| {
                    let mut e = inventory_entry(Path::new(&r.input), false);
                    e.error = Some(err);
                    e
                })
            })
            .collect(),
    )
}
