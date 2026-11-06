// SPDX-License-Identifier: AGPL-3.0-only
//! Live IQ capture to SigMF (roadmap L4b), receive only.
//!
//! [`record`] takes raw samples as a capture tool writes them (`rtl_sdr`, `hackrf_transfer -r`,
//! `airspy_rx -r`, or `rx_sdr` for any SoapySDR device, on standard output or a TCP port) and
//! writes them unchanged, byte for byte, into a SigMF recording. The `.sigmf-meta` file is written
//! first, so `kshana iq monitor --follow` can read the recording while it grows.
//!
//! Kshana never opens or configures the radio. Frequency, rate and gain are set on the capture
//! tool's own command line; Kshana records the values it is told in the metadata.
//!
//! A reader thread hands chunks to the writer through a bounded queue (the ring buffer), so a
//! slow disk write does not stall the read. The queue's high-water mark is reported, so a capture
//! that came close to filling it is visible. Samples a radio drops before they reach the pipe are
//! the capture tool's to report (`rtl_sdr` and the others print their own overflow warnings). At
//! the end, a trailing partial sample is cut, so the data file holds whole samples only.

use super::format::SampleFormat;
use super::sigmf_stream::{meta_for, sigmf_paths};
use crate::iq::IqError;
use std::io::{Read, Write};
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicUsize, Ordering};
use std::sync::{mpsc, Arc};

/// Bytes per chunk handed from the reader thread to the writer.
const CHUNK_BYTES: usize = 256 * 1024;

/// What to record and how to describe it.
#[derive(Clone, Debug)]
pub struct RecordOptions {
    /// The sample layout the capture tool writes (for example `cu8` for `rtl_sdr`, `ci8` for
    /// `hackrf_transfer`).
    pub format: SampleFormat,
    /// Sample rate in Hz, as set on the capture tool.
    pub rate_hz: f64,
    /// Centre frequency in Hz, as set on the capture tool.
    pub centre_hz: Option<f64>,
    /// Stop after this many samples (`None`: at the end of the input).
    pub max_samples: Option<u64>,
    /// The hardware, written to `core:hw` (for example `RTL-SDR v4, gain 40 dB`).
    pub hw: Option<String>,
    /// The capture's start time, ISO 8601 UTC, written to the capture's `core:datetime`.
    pub datetime: Option<String>,
    /// Chunks the queue holds before the reader waits for the writer (at least 1).
    pub queue_chunks: usize,
}

/// What a recording run did.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct RecordStats {
    /// Whole samples written.
    pub samples: u64,
    /// Bytes written to the data file.
    pub bytes: u64,
    /// Bytes of a trailing partial sample that were cut.
    pub cut_bytes: u64,
    /// The most chunks that waited in the queue at once.
    pub queue_high_water: usize,
    /// The queue's size in chunks.
    pub queue_capacity: usize,
    /// The data and metadata files.
    pub files: (PathBuf, PathBuf),
}

/// Bytes in the smallest whole unit of `f` (one sample, or one byte for packed formats).
fn unit_bytes(f: SampleFormat) -> u64 {
    let bits = f.bits_per_sample() as u64;
    if bits.is_multiple_of(8) {
        bits / 8
    } else {
        1
    }
}

/// Record `input` into the SigMF recording at `out` (`.sigmf-data`, `.sigmf-meta` or the base
/// name). The metadata is written before the first sample.
pub fn record(
    input: Box<dyn Read + Send>,
    out: &Path,
    opts: &RecordOptions,
) -> Result<RecordStats, IqError> {
    if !(opts.rate_hz.is_finite() && opts.rate_hz > 0.0) {
        return Err(IqError::Format(crate::terr!("e-iq-io-record-rate")));
    }
    let (meta_path, data_path) = sigmf_paths(out);
    let mut meta = meta_for(
        opts.format,
        opts.rate_hz,
        &[(0, opts.centre_hz, opts.datetime.clone())],
        "recorded by kshana iq record",
    )?;
    meta.global.hw = opts.hw.clone();
    let json = crate::sigmf::meta_to_json(&meta).map_err(IqError::Format)?;
    let io = |p: &Path, e: std::io::Error| IqError::Format(format!("{}: {e}", p.display()));
    std::fs::write(&meta_path, json).map_err(|e| io(&meta_path, e))?;
    let mut data = std::fs::File::create(&data_path).map_err(|e| io(&data_path, e))?;

    let unit = unit_bytes(opts.format);
    let max_bytes = opts.max_samples.map(|n| {
        if opts.format.bits_per_sample().is_multiple_of(8) {
            n * unit
        } else {
            (n * opts.format.bits_per_sample() as u64).div_ceil(8)
        }
    });
    let capacity = opts.queue_chunks.max(1);
    let (tx, rx) = mpsc::sync_channel::<Result<Vec<u8>, String>>(capacity);
    let waiting = Arc::new(AtomicUsize::new(0));
    let high = Arc::new(AtomicUsize::new(0));
    {
        let (waiting, high) = (Arc::clone(&waiting), Arc::clone(&high));
        let mut input = input;
        std::thread::spawn(move || loop {
            let mut buf = vec![0u8; CHUNK_BYTES];
            let msg = match input.read(&mut buf) {
                Ok(0) => break,
                Ok(n) => {
                    buf.truncate(n);
                    Ok(buf)
                }
                Err(e) if e.kind() == std::io::ErrorKind::Interrupted => continue,
                Err(e) => Err(e.to_string()),
            };
            let stop = msg.is_err();
            let w = waiting.fetch_add(1, Ordering::SeqCst) + 1;
            high.fetch_max(w, Ordering::SeqCst);
            if tx.send(msg).is_err() || stop {
                break;
            }
        });
    }
    let mut bytes = 0u64;
    for msg in rx.iter() {
        waiting.fetch_sub(1, Ordering::SeqCst);
        let chunk = msg.map_err(IqError::Format)?;
        let take = match max_bytes {
            Some(m) => (m - bytes).min(chunk.len() as u64) as usize,
            None => chunk.len(),
        };
        data.write_all(&chunk[..take])
            .and_then(|()| data.flush())
            .map_err(|e| io(&data_path, e))?;
        bytes += take as u64;
        if max_bytes.is_some_and(|m| bytes >= m) {
            break;
        }
    }
    let cut = bytes % unit;
    if cut > 0 {
        bytes -= cut;
        data.set_len(bytes).map_err(|e| io(&data_path, e))?;
    }
    data.sync_all().map_err(|e| io(&data_path, e))?;
    Ok(RecordStats {
        samples: opts.format.samples_in_bytes(bytes),
        bytes,
        cut_bytes: cut,
        queue_high_water: high.load(Ordering::SeqCst),
        queue_capacity: capacity,
        files: (data_path, meta_path),
    })
}

/// The input named on the command line: `-` is standard input, `tcp:host:port` a capture tool's
/// TCP output, anything else a file or a named pipe.
pub fn open_input(source: &str) -> Result<Box<dyn Read + Send>, IqError> {
    let fail = |e: std::io::Error| IqError::Format(format!("{source}: {e}"));
    if source == "-" {
        Ok(Box::new(std::io::stdin()))
    } else if let Some(addr) = source.strip_prefix("tcp:") {
        Ok(Box::new(std::net::TcpStream::connect(addr).map_err(fail)?))
    } else {
        Ok(Box::new(std::fs::File::open(source).map_err(fail)?))
    }
}

/// The current time as ISO 8601 UTC with milliseconds (`2026-11-06T12:00:00.000Z`).
pub fn now_iso() -> String {
    let ms = std::time::SystemTime::now()
        .duration_since(std::time::UNIX_EPOCH)
        .map(|d| d.as_millis() as i64)
        .unwrap_or(0);
    let (days, rem) = (ms.div_euclid(86_400_000), ms.rem_euclid(86_400_000));
    // Civil date from days since 1970-01-01 (Howard Hinnant's algorithm).
    let z = days + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = doy - (153 * mp + 2) / 5 + 1;
    let m = if mp < 10 { mp + 3 } else { mp - 9 };
    let y = yoe + era * 400 + i64::from(m <= 2);
    format!(
        "{y:04}-{m:02}-{d:02}T{:02}:{:02}:{:02}.{:03}Z",
        rem / 3_600_000,
        rem / 60_000 % 60,
        rem / 1000 % 60,
        rem % 1000
    )
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn unit_sizes() {
        assert_eq!(unit_bytes(SampleFormat::parse("cu8").unwrap()), 2);
        assert_eq!(unit_bytes(SampleFormat::parse("ci16_le").unwrap()), 4);
        assert_eq!(unit_bytes(SampleFormat::parse("cf32_le").unwrap()), 8);
        assert_eq!(unit_bytes(SampleFormat::parse("ci4_msb").unwrap()), 1);
    }

    #[test]
    fn the_time_label_has_the_iso_shape() {
        let t = now_iso();
        assert_eq!(t.len(), 24, "{t}");
        assert!(
            t.ends_with('Z') && &t[4..5] == "-" && &t[10..11] == "T",
            "{t}"
        );
    }
}
