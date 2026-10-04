// SPDX-License-Identifier: AGPL-3.0-only
//! Dataset inventory and a single opener for every recording kind.
//!
//! A dataset folder holds SigMF recordings (`.sigmf-meta` + `.sigmf-data`), SigMF
//! collections (`.sigmf-collection`) and raw sample files (`.bin`, `.dat`, `.raw`) whose
//! format is given by a sidecar ([`RawSidecar`]) named `<file>.json`, `<file>.toml`,
//! `<stem>.json` or `<stem>.toml`. [`scan_dir`] reports, per recording, its format,
//! sample rate, sample count, duration, data size, the SHA-256 of the data file (streamed
//! in 64 KiB blocks, never held whole) and its capture boundaries. Hashing runs on the
//! [`super::batch`] worker pool. [`open_recording`] opens any of the three kinds as one
//! [`IqSource`].

use super::batch::run_batch;
use super::format::SampleFormat;
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
}

/// Classify a path by extension, or `None` if it is not a recording this module reads.
pub fn recording_kind(path: &Path) -> Option<RecordingKind> {
    let name = path.file_name()?.to_string_lossy().to_ascii_lowercase();
    if name.ends_with(".sigmf-meta") || name.ends_with(".sigmf-data") {
        Some(RecordingKind::Sigmf)
    } else if name.ends_with(".sigmf-collection") {
        Some(RecordingKind::SigmfCollection)
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
    /// Their format.
    pub format: SampleFormat,
    /// Total samples.
    pub n_samples: u64,
    /// Capture boundaries (one at 0 for a raw file).
    pub boundaries: Vec<CaptureBoundary>,
    /// Number of SigMF annotations.
    pub n_annotations: usize,
    /// The data files read, with their sizes in bytes.
    pub data_files: Vec<(PathBuf, u64)>,
}

fn from_stream(s: SigmfStream, data_files: Vec<(PathBuf, u64)>) -> OpenedRecording {
    OpenedRecording {
        format: s.format(),
        n_samples: s.total_samples(),
        boundaries: s.boundaries().to_vec(),
        n_annotations: s.annotations().len(),
        source: Box::new(s),
        data_files,
    }
}

fn file_len(p: &Path) -> Result<u64, IqError> {
    std::fs::metadata(p)
        .map(|m| m.len())
        .map_err(|e| IqError::Io(format!("{}: {e}", p.display())))
}

/// Open a SigMF recording, SigMF collection or raw file as one stream. A raw file is
/// described by `raw` when given, otherwise by its sidecar.
pub fn open_recording(path: &Path, raw: Option<RawSidecar>) -> Result<OpenedRecording, IqError> {
    match recording_kind(path) {
        Some(RecordingKind::Sigmf) => {
            let (_, dp) = sigmf_paths(path);
            let len = file_len(&dp)?;
            let s = open_sigmf_files(&[path], DEFAULT_CHUNK_BYTES)?;
            Ok(from_stream(s, vec![(dp, len)]))
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
            Ok(from_stream(s, files))
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
            let n = format.samples_in_bytes(len.saturating_sub(header));
            let r = open_raw(path, format, spec, header)?;
            Ok(OpenedRecording {
                source: Box::new(r),
                format,
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
    /// Total samples, when the format is known.
    pub n_samples: Option<u64>,
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
    e.format = Some(opened.format.name());
    e.sample_rate_hz = Some(spec.fs_hz);
    e.center_hz = opened.boundaries.first().and_then(|b| b.frequency_hz);
    e.n_samples = Some(opened.n_samples);
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

/// The recordings in `dir`, sorted by path: every `.sigmf-meta`, `.sigmf-collection` and
/// raw `.bin` / `.dat` / `.raw` file (a `.sigmf-data` is listed through its meta file).
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
