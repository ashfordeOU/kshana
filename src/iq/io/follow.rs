// SPDX-License-Identifier: AGPL-3.0-only
//! A SigMF recording that is still being written, read as it grows.
//!
//! [`open_sigmf_follow`] opens the data file read-only and returns an
//! [`crate::iq::IqSource`] whose `read` waits for the file to grow instead of ending at its
//! current length. The stream ends when the file has not grown for the idle time, which is
//! how a monitor learns the recorder has stopped. Nothing is written, moved or locked: the
//! recorder keeps appending to its own file, and this only reads it. This is a receive-only
//! path: no signal of any kind is produced.
//!
//! Scope, stated so it is not mistaken for more: one recording, one channel, at most one
//! `captures` entry. The `.sigmf-meta` is read once, at the start; a recorder that rewrites
//! it later (a second capture, a changed rate) is not followed, and a metadata file with
//! more than one capture or channel is refused. The bytes are decoded as they arrive, so a
//! sample cut in two by a write is completed by the next read and never dropped.

use super::sigmf_stream::{format_from_sigmf, parse_meta_any, sigmf_paths};
use super::stream::IqReader;
use crate::iq::{IqError, IqSource, SampleSpec};
use std::fs::File;
use std::io::{Read, Seek, SeekFrom};
use std::path::Path;
use std::time::{Duration, Instant};

/// How a followed file is polled.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct FollowOptions {
    /// End the stream when the file has not grown for this long.
    pub idle: Duration,
    /// Time between looks at a file that has not grown.
    pub poll: Duration,
}

impl Default for FollowOptions {
    fn default() -> Self {
        FollowOptions {
            idle: Duration::from_secs(5),
            poll: Duration::from_millis(50),
        }
    }
}

/// A reader over a file that is still growing: `read` waits for more bytes, and returns
/// `Ok(0)` (the end) only after the file has not grown for [`FollowOptions::idle`].
struct TailReader {
    file: File,
    opts: FollowOptions,
}

impl Read for TailReader {
    fn read(&mut self, buf: &mut [u8]) -> std::io::Result<usize> {
        // The idle time runs from this call: a read that finds bytes returns at once, so the
        // clock restarts with every growth.
        let waiting_since = Instant::now();
        loop {
            let n = self.file.read(buf)?;
            if n > 0 {
                return Ok(n);
            }
            if waiting_since.elapsed() >= self.opts.idle {
                return Ok(0);
            }
            std::thread::sleep(self.opts.poll);
            // A file replaced by a shorter one (truncated and rewritten) ends the stream
            // rather than being read from the middle.
            if self.file.metadata()?.len() < self.file.stream_position()? {
                return Ok(0);
            }
        }
    }
}

fn io(path: &Path, e: std::io::Error) -> IqError {
    IqError::Io(format!("{}: {e}", path.display()))
}

/// Open the SigMF recording named by `path` (its meta file, data file or base path) for
/// reading while it grows. See the module documentation for what is and is not followed.
pub fn open_sigmf_follow(
    path: &Path,
    opts: FollowOptions,
) -> Result<Box<dyn IqSource + Send>, IqError> {
    let (meta_path, data_path) = sigmf_paths(path);
    let json = std::fs::read_to_string(&meta_path).map_err(|e| io(&meta_path, e))?;
    let (meta, _) = parse_meta_any(&json)
        .map_err(|e| IqError::Format(format!("{}: {e}", meta_path.display())))?;
    if meta.global.num_channels.unwrap_or(1) > 1 {
        return Err(IqError::Format(crate::terr!(
            "e-iq-io-follow-follow-reads-single-channel-recordings",
            meta_path = meta_path.display()
        )));
    }
    if meta.captures.len() > 1 {
        return Err(IqError::Format(crate::terr!(
            "e-iq-io-follow-follow-reads-recording-with-one",
            meta_path = meta_path.display(),
            captures = meta.captures.len()
        )));
    }
    let format = format_from_sigmf(&meta.global.datatype)
        .map_err(|e| IqError::Format(format!("{}: {e}", meta_path.display())))?;
    let fs_hz = meta
        .global
        .sample_rate
        .filter(|r| r.is_finite() && *r > 0.0)
        .ok_or_else(|| {
            IqError::Format(crate::terr!(
                "e-iq-io-follow-no-positive-core-sample-rate",
                meta_path = meta_path.display()
            ))
        })?;
    let capture = meta.captures.first();
    let start = capture.map(|c| c.sample_start).unwrap_or(0);
    let bits = start * format.bits_per_sample() as u64;
    if !bits.is_multiple_of(8) {
        return Err(IqError::Format(crate::terr!(
            "e-iq-io-follow-the-capture-does-not-start",
            meta_path = meta_path.display()
        )));
    }
    let mut file = File::open(&data_path).map_err(|e| io(&data_path, e))?;
    file.seek(SeekFrom::Start(bits / 8))
        .map_err(|e| io(&data_path, e))?;
    let spec = SampleSpec {
        fs_hz,
        center_hz: capture.and_then(|c| c.frequency).unwrap_or(0.0),
        if_hz: 0.0,
    };
    Ok(Box::new(IqReader::new(
        TailReader { file, opts },
        format,
        spec,
    )))
}
