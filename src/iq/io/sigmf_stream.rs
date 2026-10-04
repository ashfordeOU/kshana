// SPDX-License-Identifier: AGPL-3.0-only
//! SigMF recordings as streams: every capture segment and annotation, and multi-file
//! recordings read as one continuous stream.
//!
//! This builds on [`crate::sigmf`], whose [`Meta`], [`Capture`] and [`Annotation`] types
//! it reuses unchanged. That module decodes a whole recording held in memory and reads the
//! three data types `cf32_le`, `ci16_le` and `ci8`; here the data is streamed with
//! [`super::stream::IqReader`] and the byte-aligned types SigMF names for big-endian and
//! real-valued data are read too ([`format_from_sigmf`]).
//!
//! **Captures.** A SigMF `captures` entry marks where a segment with its own centre
//! frequency and start time begins (`core:sample_start`, an index into the data file).
//! Samples before the first capture are not described by the metadata and are skipped,
//! matching [`crate::sigmf::read`].
//!
//! **Multi-file recordings.** [`SigmfStream`] reads several recordings back to back as one
//! continuous sample stream. Every capture of every file becomes a [`CaptureBoundary`] at
//! its sample index within the whole stream, and `read` never returns a chunk that
//! straddles a boundary, so a consumer can retune at each one. The files must share data
//! type and sample rate. A SigMF collection (`.sigmf-collection`) lists recordings in
//! `core:streams`; the SigMF specification leaves the relation between streams open (it is
//! often used for the channels of an array), and this reader takes them as **consecutive
//! segments in time, in the order listed**. Each listed stream's `hash` (SHA-512 of its
//! `.sigmf-meta` file) is checked when present.

use super::format::{Components, Encoding, SampleFormat};
use super::stream::IqReader;
use crate::iq::{Cf64, IqError, IqSource, SampleSpec};
use crate::sigmf::{Annotation, Capture, Meta};
use serde::{Deserialize, Serialize};
use std::io::Read;

/// The sample format of a SigMF `core:datatype`. The three types [`crate::sigmf`] reads
/// are parsed by [`crate::sigmf::DataType::parse`]; this adds `ci16_be`, `cf32_be`, `ri8`,
/// `ri16_le`, `ri16_be`, `rf32_le` and `rf32_be`. Unsigned and 64-bit types are refused.
pub fn format_from_sigmf(datatype: &str) -> Result<SampleFormat, IqError> {
    use crate::sigmf::DataType;
    if let Ok(dt) = DataType::parse(datatype) {
        return Ok(match dt {
            DataType::Cf32Le => SampleFormat::CF32_LE,
            DataType::Ci16Le => SampleFormat::CI16_LE,
            DataType::Ci8 => SampleFormat::CI8,
        });
    }
    let f = SampleFormat::parse(datatype).map_err(|_| {
        IqError::Format(format!(
            "unsupported SigMF core:datatype {datatype:?}: supported are ci8, ci16_le, ci16_be, \
             cf32_le, cf32_be and the real ri8, ri16_le, ri16_be, rf32_le, rf32_be"
        ))
    })?;
    match sigmf_datatype(f) {
        Some(name) if name == datatype => Ok(f),
        _ => Err(IqError::Format(format!(
            "{datatype:?} is not a SigMF core:datatype"
        ))),
    }
}

/// The SigMF `core:datatype` of a format, or `None` when SigMF has no name for it
/// (packed 2-bit, Q-first).
pub fn sigmf_datatype(f: SampleFormat) -> Option<&'static str> {
    let complex = match f.components {
        Components::Iq => true,
        Components::Real => false,
        Components::Qi => return None,
    };
    Some(match (f.encoding, complex) {
        (Encoding::I8, true) => "ci8",
        (Encoding::I16Le, true) => "ci16_le",
        (Encoding::I16Be, true) => "ci16_be",
        (Encoding::F32Le, true) => "cf32_le",
        (Encoding::F32Be, true) => "cf32_be",
        (Encoding::I8, false) => "ri8",
        (Encoding::I16Le, false) => "ri16_le",
        (Encoding::I16Be, false) => "ri16_be",
        (Encoding::F32Le, false) => "rf32_le",
        (Encoding::F32Be, false) => "rf32_be",
        (Encoding::TwoBit { .. }, _) => return None,
    })
}

/// Parse `.sigmf-meta` JSON accepting every data type of [`format_from_sigmf`] (where
/// [`crate::sigmf::parse_meta`] accepts three). Multi-channel recordings are refused.
pub fn parse_meta_any(json: &str) -> Result<(Meta, SampleFormat), IqError> {
    let meta: Meta = serde_json::from_str(json)
        .map_err(|e| IqError::Format(format!("invalid SigMF metadata: {e}")))?;
    if let Some(ch) = meta.global.num_channels {
        if ch != 1 {
            return Err(IqError::Format(format!(
                "SigMF core:num_channels = {ch}: only single-channel recordings are read"
            )));
        }
    }
    let f = format_from_sigmf(&meta.global.datatype)?;
    Ok((meta, f))
}

/// A metadata document for a recording in `format` at `fs_hz`, with one capture per entry
/// of `captures` (sample index, centre frequency, ISO-8601 time).
pub fn meta_for(
    format: SampleFormat,
    fs_hz: f64,
    captures: &[(u64, Option<f64>, Option<String>)],
    description: &str,
) -> Result<Meta, IqError> {
    let dt = sigmf_datatype(format).ok_or_else(|| {
        IqError::Format(format!(
            "{format} has no SigMF core:datatype; write it as raw"
        ))
    })?;
    let mut m = Meta::new(crate::sigmf::DataType::Ci8, fs_hz, 0.0, description);
    m.global.datatype = dt.to_string();
    m.captures = captures
        .iter()
        .map(|(s, f, d)| Capture {
            sample_start: *s,
            frequency: *f,
            datetime: d.clone(),
        })
        .collect();
    Ok(m)
}

/// Where a capture segment begins within a (possibly multi-file) stream.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct CaptureBoundary {
    /// Sample index within the whole stream.
    pub sample: u64,
    /// Which file (part) of the stream the capture belongs to, from 0.
    pub file_index: usize,
    /// The capture's `core:sample_start` within its own data file.
    pub file_sample: u64,
    /// `core:frequency` (Hz), if stated.
    pub frequency_hz: Option<f64>,
    /// `core:datetime`, if stated.
    pub datetime: Option<String>,
}

/// An annotation placed on the whole stream.
#[derive(Clone, Debug, PartialEq)]
pub struct StreamAnnotation {
    /// First annotated sample within the whole stream.
    pub sample: u64,
    /// Which file the annotation came from.
    pub file_index: usize,
    /// The annotation as written (its `sample_start` is relative to its own file).
    pub annotation: Annotation,
}

/// One recording of a [`SigmfStream`]: its metadata, its data reader and the data length.
pub struct SigmfPart {
    /// A name for messages (for example the file path).
    pub name: String,
    /// The parsed metadata.
    pub meta: Meta,
    /// The data bytes, positioned at the start of the data file.
    pub data: Box<dyn Read + Send>,
    /// Length of the data in bytes.
    pub data_len_bytes: u64,
}

/// Several SigMF recordings read back to back as one stream (see the module docs).
pub struct SigmfStream {
    parts: std::collections::VecDeque<(Box<dyn Read + Send>, u64)>,
    current: Option<IqReader<Box<dyn Read + Send>>>,
    format: SampleFormat,
    spec: SampleSpec,
    boundaries: Vec<CaptureBoundary>,
    annotations: Vec<StreamAnnotation>,
    part_starts: Vec<u64>,
    total: u64,
    pos: u64,
    next_boundary: usize,
    chunk_bytes: usize,
}

impl SigmfStream {
    /// Build a stream from recordings in time order. Each part's data reader is read
    /// lazily, one part at a time, through a staging buffer of `chunk_bytes`.
    pub fn from_parts(parts: Vec<SigmfPart>, chunk_bytes: usize) -> Result<Self, IqError> {
        if parts.is_empty() {
            return Err(IqError::Format(
                "a SigMF stream needs at least one recording".into(),
            ));
        }
        let mut format = None;
        let mut fs = None;
        let mut boundaries = Vec::new();
        let mut annotations = Vec::new();
        let mut part_starts = Vec::new();
        let mut readers = std::collections::VecDeque::new();
        let mut total = 0u64;
        for (i, p) in parts.into_iter().enumerate() {
            let f = format_from_sigmf(&p.meta.global.datatype)
                .map_err(|e| IqError::Format(format!("{}: {e}", p.name)))?;
            let rate = p
                .meta
                .global
                .sample_rate
                .ok_or_else(|| IqError::Format(format!("{}: no core:sample_rate", p.name)))?;
            if !(rate.is_finite() && rate > 0.0) {
                return Err(IqError::Format(format!(
                    "{}: core:sample_rate {rate} is not positive",
                    p.name
                )));
            }
            match (format, fs) {
                (None, None) => {
                    format = Some(f);
                    fs = Some(rate);
                }
                (Some(f0), Some(r0)) if f0 == f && r0 == rate => {}
                (Some(f0), Some(r0)) => {
                    return Err(IqError::Format(format!(
                        "{}: {} at {rate} Hz does not match the first recording's {f0} at {r0} Hz",
                        p.name, f
                    )))
                }
                _ => unreachable!(),
            }
            let n_file = f.samples_in_bytes(p.data_len_bytes);
            let s0 = p.meta.captures.first().map(|c| c.sample_start).unwrap_or(0);
            let mut prev = s0;
            for c in &p.meta.captures {
                if c.sample_start < prev || c.sample_start > n_file {
                    return Err(IqError::Format(format!(
                        "{}: capture at sample {} is out of order or beyond the {n_file} samples \
                         in the data",
                        p.name, c.sample_start
                    )));
                }
                prev = c.sample_start;
            }
            if s0 * f.bits_per_sample() as u64 % 8 != 0 {
                return Err(IqError::Format(format!(
                    "{}: first capture does not start on a byte boundary",
                    p.name
                )));
            }
            if p.meta.captures.is_empty() {
                boundaries.push(CaptureBoundary {
                    sample: total,
                    file_index: i,
                    file_sample: 0,
                    frequency_hz: None,
                    datetime: None,
                });
            }
            for c in &p.meta.captures {
                boundaries.push(CaptureBoundary {
                    sample: total + c.sample_start - s0,
                    file_index: i,
                    file_sample: c.sample_start,
                    frequency_hz: c.frequency,
                    datetime: c.datetime.clone(),
                });
            }
            for a in &p.meta.annotations {
                if a.sample_start >= s0 {
                    annotations.push(StreamAnnotation {
                        sample: total + a.sample_start - s0,
                        file_index: i,
                        annotation: a.clone(),
                    });
                }
            }
            part_starts.push(total);
            readers.push_back((p.data, s0 * f.bits_per_sample() as u64 / 8));
            total += n_file - s0;
        }
        let format = format.expect("at least one part");
        let spec = SampleSpec {
            fs_hz: fs.expect("at least one part"),
            center_hz: boundaries
                .first()
                .and_then(|b| b.frequency_hz)
                .unwrap_or(0.0),
            if_hz: 0.0,
        };
        annotations.sort_by_key(|a| a.sample);
        Ok(SigmfStream {
            parts: readers,
            current: None,
            format,
            spec,
            boundaries,
            annotations,
            part_starts,
            total,
            pos: 0,
            next_boundary: 1,
            chunk_bytes,
        })
    }

    /// Every capture boundary, in stream order (the first is at sample 0).
    pub fn boundaries(&self) -> &[CaptureBoundary] {
        &self.boundaries
    }

    /// Every annotation, sorted by stream sample index.
    pub fn annotations(&self) -> &[StreamAnnotation] {
        &self.annotations
    }

    /// Stream sample index at which each file starts.
    pub fn file_starts(&self) -> &[u64] {
        &self.part_starts
    }

    /// Total samples in the stream (from the data lengths).
    pub fn total_samples(&self) -> u64 {
        self.total
    }

    /// Index of the next sample `read` returns.
    pub fn position(&self) -> u64 {
        self.pos
    }

    /// The sample format shared by every file.
    pub fn format(&self) -> SampleFormat {
        self.format
    }

    /// The capture segment containing stream sample `k`.
    pub fn capture_at(&self, k: u64) -> Option<&CaptureBoundary> {
        let i = self.boundaries.partition_point(|b| b.sample <= k);
        i.checked_sub(1).map(|i| &self.boundaries[i])
    }

    /// Size of the active reader's staging buffer in bytes (the configured chunk size
    /// rounded to whole elements).
    pub fn staging_capacity(&self) -> usize {
        self.current
            .as_ref()
            .map(|r| r.staging_capacity())
            .unwrap_or(self.chunk_bytes)
    }
}

impl IqSource for SigmfStream {
    fn spec(&self) -> SampleSpec {
        self.spec
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        while self.next_boundary < self.boundaries.len()
            && self.boundaries[self.next_boundary].sample <= self.pos
        {
            self.next_boundary += 1;
        }
        let limit = match self.boundaries.get(self.next_boundary) {
            Some(b) => ((b.sample - self.pos) as usize).min(buf.len()),
            None => buf.len(),
        };
        if limit == 0 {
            return Ok(0);
        }
        loop {
            if self.current.is_none() {
                let Some((mut data, skip)) = self.parts.pop_front() else {
                    return Ok(0);
                };
                let copied = std::io::copy(&mut (&mut data).take(skip), &mut std::io::sink())
                    .map_err(|e| IqError::Io(e.to_string()))?;
                if copied < skip {
                    return Err(IqError::Format(
                        "SigMF data ends before its first capture".into(),
                    ));
                }
                self.current = Some(IqReader::with_chunk_bytes(
                    data,
                    self.format,
                    self.spec,
                    self.chunk_bytes,
                ));
            }
            let r = self.current.as_mut().expect("set above");
            let n = r.read(&mut buf[..limit])?;
            if n > 0 {
                self.pos += n as u64;
                return Ok(n);
            }
            self.current = None;
        }
    }
}

/// The `collection` object of a `.sigmf-collection` file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Collection {
    /// `core:version`.
    #[serde(rename = "core:version")]
    pub version: String,
    /// `core:description`.
    #[serde(
        rename = "core:description",
        default,
        skip_serializing_if = "Option::is_none"
    )]
    pub description: Option<String>,
    /// `core:streams`: the recordings, by base name relative to the collection file.
    #[serde(rename = "core:streams", default)]
    pub streams: Vec<CollectionStream>,
}

/// One `core:streams` entry of a SigMF collection.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct CollectionStream {
    /// Base name of the recording (without `.sigmf-meta`).
    pub name: String,
    /// SHA-512 (hex) of the recording's `.sigmf-meta` file.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub hash: Option<String>,
}

#[derive(Serialize, Deserialize)]
struct CollectionDoc {
    collection: Collection,
}

/// Parse a `.sigmf-collection` JSON document.
pub fn parse_collection(json: &str) -> Result<Collection, IqError> {
    serde_json::from_str::<CollectionDoc>(json)
        .map(|d| d.collection)
        .map_err(|e| IqError::Format(format!("invalid SigMF collection: {e}")))
}

/// Serialise a collection as `.sigmf-collection` JSON.
pub fn collection_to_json(c: &Collection) -> Result<String, IqError> {
    serde_json::to_string_pretty(&CollectionDoc {
        collection: c.clone(),
    })
    .map_err(|e| IqError::Format(e.to_string()))
}

/// SHA-512 (lower-case hex) of `bytes`, the hash a SigMF collection records per stream.
pub fn sha512_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha512};
    hex::encode(Sha512::digest(bytes))
}

#[cfg(not(target_arch = "wasm32"))]
mod files {
    use super::*;
    use std::path::{Path, PathBuf};

    fn io(path: &Path, e: std::io::Error) -> IqError {
        IqError::Io(format!("{}: {e}", path.display()))
    }

    /// The `.sigmf-meta` and `.sigmf-data` paths of a recording named by either file or
    /// by its base path.
    pub fn sigmf_paths(path: &Path) -> (PathBuf, PathBuf) {
        let s = path.to_string_lossy();
        let base = s
            .strip_suffix(".sigmf-meta")
            .or_else(|| s.strip_suffix(".sigmf-data"))
            .or_else(|| s.strip_suffix(".sigmf"))
            .unwrap_or(&s)
            .to_string();
        (
            PathBuf::from(format!("{base}.sigmf-meta")),
            PathBuf::from(format!("{base}.sigmf-data")),
        )
    }

    fn part(path: &Path, expect_sha512: Option<&str>) -> Result<SigmfPart, IqError> {
        let (mp, dp) = sigmf_paths(path);
        let json_bytes = std::fs::read(&mp).map_err(|e| io(&mp, e))?;
        if let Some(h) = expect_sha512 {
            let got = sha512_hex(&json_bytes);
            if !got.eq_ignore_ascii_case(h) {
                return Err(IqError::Format(format!(
                    "{}: SHA-512 {got} does not match the collection's {h}",
                    mp.display()
                )));
            }
        }
        let json = String::from_utf8(json_bytes)
            .map_err(|e| IqError::Format(format!("{}: {e}", mp.display())))?;
        let (meta, _) =
            parse_meta_any(&json).map_err(|e| IqError::Format(format!("{}: {e}", mp.display())))?;
        let f = std::fs::File::open(&dp).map_err(|e| io(&dp, e))?;
        let len = f.metadata().map_err(|e| io(&dp, e))?.len();
        Ok(SigmfPart {
            name: dp.display().to_string(),
            meta,
            data: Box::new(f),
            data_len_bytes: len,
        })
    }

    /// Open recordings (each named by its meta file, data file or base path) as one
    /// stream, in the order given.
    pub fn open_sigmf_files<P: AsRef<Path>>(
        paths: &[P],
        chunk_bytes: usize,
    ) -> Result<SigmfStream, IqError> {
        let parts = paths
            .iter()
            .map(|p| part(p.as_ref(), None))
            .collect::<Result<Vec<_>, _>>()?;
        SigmfStream::from_parts(parts, chunk_bytes)
    }

    /// Open a `.sigmf-collection`: its streams, in the order listed, as one stream (hashes
    /// checked when present).
    pub fn open_sigmf_collection(path: &Path, chunk_bytes: usize) -> Result<SigmfStream, IqError> {
        let json = std::fs::read_to_string(path).map_err(|e| io(path, e))?;
        let c = parse_collection(&json)?;
        let dir = path.parent().unwrap_or(Path::new("."));
        let parts = c
            .streams
            .iter()
            .map(|s| part(&dir.join(&s.name), s.hash.as_deref()))
            .collect::<Result<Vec<_>, _>>()?;
        SigmfStream::from_parts(parts, chunk_bytes)
    }

    /// Write a `.sigmf-collection` listing `recordings` (base paths in the same directory
    /// as `path`) with each meta file's SHA-512.
    pub fn write_sigmf_collection(
        path: &Path,
        recordings: &[&str],
        description: Option<&str>,
    ) -> Result<(), IqError> {
        let dir = path.parent().unwrap_or(Path::new("."));
        let mut streams = Vec::new();
        for name in recordings {
            let (mp, _) = sigmf_paths(&dir.join(name));
            let bytes = std::fs::read(&mp).map_err(|e| io(&mp, e))?;
            streams.push(CollectionStream {
                name: name.to_string(),
                hash: Some(sha512_hex(&bytes)),
            });
        }
        let c = Collection {
            version: crate::sigmf::SIGMF_VERSION.to_string(),
            description: description.map(str::to_string),
            streams,
        };
        std::fs::write(path, collection_to_json(&c)?).map_err(|e| io(path, e))
    }
}

#[cfg(not(target_arch = "wasm32"))]
pub use files::{open_sigmf_collection, open_sigmf_files, sigmf_paths, write_sigmf_collection};

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn datatypes_extend_the_sigmf_module_without_disagreeing() {
        for (dt, f) in [
            ("ci8", SampleFormat::CI8),
            ("ci16_le", SampleFormat::CI16_LE),
            ("cf32_le", SampleFormat::CF32_LE),
            ("ci16_be", SampleFormat::CI16_BE),
            ("rf32_le", SampleFormat::real(Encoding::F32Le)),
        ] {
            assert_eq!(format_from_sigmf(dt).unwrap(), f);
            assert_eq!(sigmf_datatype(f), Some(dt));
        }
        assert!(format_from_sigmf("cu8").is_err());
        assert!(format_from_sigmf("c2tc_msb").is_err());
        assert!(format_from_sigmf("ci16_le_qi").is_err());
    }
}
