// SPDX-License-Identifier: AGPL-3.0-only
//! Streaming readers and writers over any [`std::io::Read`] / [`std::io::Write`].
//!
//! [`IqReader`] and [`IqWriter`] hold one staging buffer of a fixed size chosen at
//! construction ([`DEFAULT_CHUNK_BYTES`] unless stated) and never grow it, so reading or
//! writing a recording of any length uses that much memory plus the caller's sample
//! buffer. [`IqReader::staging_capacity`] and [`IqWriter::staging_capacity`] expose the
//! buffer size so tests can assert it.

use super::format::{for_each_element, push_element, sample_elements, Components, SampleFormat};
use crate::iq::{Cf64, IqError, IqSink, IqSource, SampleSpec};
use std::io::{Read, Seek, SeekFrom, Write};

/// Default staging-buffer size of readers and writers (64 KiB).
pub const DEFAULT_CHUNK_BYTES: usize = 1 << 16;

fn io_err(e: std::io::Error) -> IqError {
    IqError::Io(e.to_string())
}

/// Read until `buf` is full or the reader ends; returns the bytes read.
fn read_full<R: Read>(r: &mut R, buf: &mut [u8]) -> Result<usize, IqError> {
    let mut got = 0;
    while got < buf.len() {
        match r.read(&mut buf[got..]) {
            Ok(0) => break,
            Ok(n) => got += n,
            Err(e) if e.kind() == std::io::ErrorKind::Interrupted => {}
            Err(e) => return Err(io_err(e)),
        }
    }
    Ok(got)
}

/// Round a requested chunk size to a whole number of encoding units, at least one.
fn chunk_for(format: SampleFormat, chunk_bytes: usize) -> usize {
    let unit = format.encoding.unit_bytes();
    (chunk_bytes / unit).max(1) * unit
}

/// A streaming [`IqSource`] decoding a byte stream in a [`SampleFormat`].
///
/// Decoded values are the stored codes times the reader's scale (1 unless set with
/// [`IqReader::with_scale`]). Real formats yield samples with `im = 0`; feed them to
/// [`super::resample::RealIfToBaseband`] to get complex baseband. A trailing partial
/// sample at the end of the stream is dropped.
#[derive(Debug)]
pub struct IqReader<R> {
    inner: R,
    format: SampleFormat,
    spec: SampleSpec,
    scale: f64,
    staging: Vec<u8>,
    carry: Vec<f64>,
    carry_pos: usize,
    samples_read: u64,
    data_offset: u64,
    eof: bool,
    channels: usize,
    select: usize,
    frame_pos: usize,
}

impl<R: Read> IqReader<R> {
    /// A reader over `inner` with the default staging size.
    pub fn new(inner: R, format: SampleFormat, spec: SampleSpec) -> Self {
        Self::with_chunk_bytes(inner, format, spec, DEFAULT_CHUNK_BYTES)
    }

    /// A reader whose staging buffer is `chunk_bytes` (rounded down to whole elements,
    /// at least one element).
    pub fn with_chunk_bytes(
        inner: R,
        format: SampleFormat,
        spec: SampleSpec,
        chunk_bytes: usize,
    ) -> Self {
        IqReader {
            inner,
            format,
            spec,
            scale: 1.0,
            staging: vec![0; chunk_for(format, chunk_bytes)],
            carry: Vec::with_capacity(8),
            carry_pos: 0,
            samples_read: 0,
            data_offset: 0,
            eof: false,
            channels: 1,
            select: 0,
            frame_pos: 0,
        }
    }

    /// Read one stream of a file holding `channels` sample-interleaved streams (sample 0
    /// of stream 0, sample 0 of stream 1, …, sample 1 of stream 0, …): only stream
    /// `select` (from 0) is returned, and sample indices ([`IqReader::samples_read`],
    /// [`IqReader::seek_to_sample`]) count that stream's samples. This is the layout of a
    /// SigMF recording with `core:num_channels` above one and of multi-channel raw lab
    /// recordings. Call it before the first read.
    pub fn with_channels(mut self, channels: usize, select: usize) -> Result<Self, IqError> {
        if channels == 0 || select >= channels {
            return Err(IqError::Format(format!(
                "stream {select} of {channels} interleaved streams does not exist \
                 (streams count from 0)"
            )));
        }
        self.channels = channels;
        self.select = select;
        Ok(self)
    }

    /// The number of interleaved streams and the one being read.
    pub fn channels(&self) -> (usize, usize) {
        (self.channels, self.select)
    }

    /// Multiply every decoded value by `scale` (for example `1/32767` to normalise int16).
    pub fn with_scale(mut self, scale: f64) -> Self {
        self.scale = scale;
        self
    }

    /// The byte offset of sample 0 within `inner`, used by [`IqReader::seek_to_sample`].
    /// It does not move `inner`: position it there first.
    pub fn with_data_offset(mut self, offset: u64) -> Self {
        self.data_offset = offset;
        self
    }

    /// The sample format being decoded.
    pub fn format(&self) -> SampleFormat {
        self.format
    }

    /// Size of the staging buffer in bytes; fixed for the reader's lifetime.
    pub fn staging_capacity(&self) -> usize {
        self.staging.capacity()
    }

    /// Index of the next sample [`IqSource::read`] will return.
    pub fn samples_read(&self) -> u64 {
        self.samples_read
    }

    /// The underlying reader.
    pub fn into_inner(self) -> R {
        self.inner
    }
}

impl<R: Read + Seek> IqReader<R> {
    /// Jump to sample `k` without reading the samples before it. The sample must start on
    /// a byte boundary (always true except for some packed 2-bit positions).
    pub fn seek_to_sample(&mut self, k: u64) -> Result<(), IqError> {
        let bits = k * self.channels as u64 * self.format.bits_per_sample() as u64;
        if bits % 8 != 0 {
            return Err(IqError::Format(format!(
                "sample {k} of {} does not start on a byte boundary",
                self.format
            )));
        }
        self.inner
            .seek(SeekFrom::Start(self.data_offset + bits / 8))
            .map_err(io_err)?;
        self.carry.clear();
        self.carry_pos = 0;
        self.frame_pos = 0;
        self.eof = false;
        self.samples_read = k;
        Ok(())
    }
}

impl<R: Read> IqSource for IqReader<R> {
    fn spec(&self) -> SampleSpec {
        self.spec
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let eps = self.format.elements_per_sample();
        let target = buf.len() * eps;
        let comps = self.format.components;
        let scale = self.scale;
        let place = |buf: &mut [Cf64], k: usize, v: f64| {
            let s = &mut buf[k / eps];
            let v = v * scale;
            match (comps, k % 2) {
                (Components::Real, _) => *s = Cf64::new(v, 0.0),
                (Components::Iq, 0) | (Components::Qi, 1) => s.re = v,
                _ => s.im = v,
            }
        };
        let frame = self.channels * eps;
        let select = self.select;
        let mut k = 0usize;
        while k < target {
            if self.carry_pos < self.carry.len() {
                place(buf, k, self.carry[self.carry_pos]);
                self.carry_pos += 1;
                k += 1;
                continue;
            }
            if self.eof {
                break;
            }
            let need = (target - k) * self.channels;
            let enc = self.format.encoding;
            let want = (need * enc.bits()).div_ceil(8);
            let want = want.min(self.staging.len());
            let want = want - want % enc.unit_bytes();
            let got = read_full(&mut self.inner, &mut self.staging[..want])?;
            if got < want {
                self.eof = true;
            }
            self.carry.clear();
            self.carry_pos = 0;
            let (staging, carry, frame_pos) =
                (&self.staging[..got], &mut self.carry, &mut self.frame_pos);
            for_each_element(enc, staging, |v| {
                let selected = *frame_pos / eps == select;
                *frame_pos += 1;
                if *frame_pos == frame {
                    *frame_pos = 0;
                }
                if !selected {
                    return;
                }
                if k < target {
                    place(buf, k, v);
                    k += 1;
                } else {
                    carry.push(v);
                }
            });
        }
        let n = k / eps;
        self.samples_read += n as u64;
        Ok(n)
    }
}

/// A streaming [`IqSink`] encoding samples into a [`SampleFormat`] on any writer.
///
/// Values are divided by the writer's scale (1 unless set with [`IqWriter::with_scale`])
/// and, for integer encodings, rounded half away from zero and saturated; the number of
/// saturated elements is [`IqWriter::clipped`]. 2-bit encodings quantise to the nearest
/// level (thresholds −2, 0, +2). Real formats store `re` only. Call
/// [`IqSink::finish`] at the end: it writes any partly filled 2- or 4-bit byte (padding its
/// unused slots with code `0`) and flushes the writer.
#[derive(Debug)]
pub struct IqWriter<W: Write> {
    inner: W,
    format: SampleFormat,
    scale: f64,
    staging: Vec<u8>,
    chunk: usize,
    acc: u8,
    acc_slots: u8,
    clipped: u64,
    samples_written: u64,
    padded_elements: u64,
}

impl<W: Write> IqWriter<W> {
    /// A writer over `inner` with the default staging size.
    pub fn new(inner: W, format: SampleFormat) -> Self {
        Self::with_chunk_bytes(inner, format, DEFAULT_CHUNK_BYTES)
    }

    /// A writer whose staging buffer is `chunk_bytes` (rounded down to whole elements, at
    /// least one element).
    pub fn with_chunk_bytes(inner: W, format: SampleFormat, chunk_bytes: usize) -> Self {
        let chunk = chunk_for(format, chunk_bytes);
        IqWriter {
            inner,
            format,
            scale: 1.0,
            staging: Vec::with_capacity(chunk),
            chunk,
            acc: 0,
            acc_slots: 0,
            clipped: 0,
            samples_written: 0,
            padded_elements: 0,
        }
    }

    /// Divide every value by `scale` before encoding.
    pub fn with_scale(mut self, scale: f64) -> Self {
        self.scale = scale;
        self
    }

    /// Number of integer elements that saturated so far.
    pub fn clipped(&self) -> u64 {
        self.clipped
    }

    /// Samples written so far.
    pub fn samples_written(&self) -> u64 {
        self.samples_written
    }

    /// Packed 2- or 4-bit slots padded with code `0` by [`IqSink::finish`] (0 when the
    /// element count filled the last byte).
    pub fn padded_elements(&self) -> u64 {
        self.padded_elements
    }

    /// Size of the staging buffer in bytes; fixed for the writer's lifetime.
    pub fn staging_capacity(&self) -> usize {
        self.staging.capacity()
    }

    /// The underlying writer (call [`IqSink::finish`] first).
    pub fn into_inner(self) -> W {
        self.inner
    }

    fn flush_staging(&mut self) -> Result<(), IqError> {
        if !self.staging.is_empty() {
            self.inner.write_all(&self.staging).map_err(io_err)?;
            self.staging.clear();
        }
        Ok(())
    }
}

impl<W: Write> IqSink for IqWriter<W> {
    fn write(&mut self, block: &[Cf64]) -> Result<(), IqError> {
        let enc = self.format.encoding;
        for &s in block {
            let (els, n) = sample_elements(self.format.components, s);
            for &v in &els[..n] {
                let v = v / self.scale;
                if self.staging.len() + enc.unit_bytes() > self.chunk {
                    self.flush_staging()?;
                }
                match enc.packed_bits() {
                    Some(bits) => {
                        let (code, clipped) = enc.packed_code(v);
                        self.clipped += clipped as u64;
                        self.acc |= code << enc.packed_shift(self.acc_slots);
                        self.acc_slots += 1;
                        if self.acc_slots == 8 / bits {
                            self.staging.push(self.acc);
                            self.acc = 0;
                            self.acc_slots = 0;
                        }
                    }
                    None => {
                        if push_element(enc, v, &mut self.staging) {
                            self.clipped += 1;
                        }
                    }
                }
            }
        }
        self.samples_written += block.len() as u64;
        Ok(())
    }

    fn finish(&mut self) -> Result<(), IqError> {
        if self.acc_slots > 0 {
            let per_byte = 8 / self.format.encoding.packed_bits().unwrap_or(8);
            self.padded_elements += (per_byte - self.acc_slots) as u64;
            if self.staging.len() + 1 > self.chunk {
                self.flush_staging()?;
            }
            self.staging.push(self.acc);
            self.acc = 0;
            self.acc_slots = 0;
        }
        self.flush_staging()?;
        self.inner.flush().map_err(io_err)
    }
}

/// Read and discard `n` samples from `src` through a buffer of `chunk` samples; returns
/// how many were skipped (fewer if the stream ended).
pub fn skip_samples(src: &mut dyn IqSource, n: u64, chunk: usize) -> Result<u64, IqError> {
    let mut buf = vec![Cf64::default(); chunk.max(1)];
    let mut done = 0u64;
    while done < n {
        let want = ((n - done) as usize).min(buf.len());
        let got = src.read(&mut buf[..want])?;
        if got == 0 {
            break;
        }
        done += got as u64;
    }
    Ok(done)
}

/// Copy up to `n` samples (`None` = to the end) from `src` to `sink` through a buffer of
/// `chunk` samples; returns the number copied. Does not call [`IqSink::finish`].
pub fn copy_samples(
    src: &mut dyn IqSource,
    sink: &mut dyn IqSink,
    n: Option<u64>,
    chunk: usize,
) -> Result<u64, IqError> {
    let mut buf = vec![Cf64::default(); chunk.max(1)];
    let mut done = 0u64;
    loop {
        let want = match n {
            Some(n) if done >= n => break,
            Some(n) => ((n - done) as usize).min(buf.len()),
            None => buf.len(),
        };
        let got = src.read(&mut buf[..want])?;
        if got == 0 {
            break;
        }
        sink.write(&buf[..got])?;
        done += got as u64;
    }
    Ok(done)
}

/// Copy the samples of the time window `[start_s, start_s + duration_s)` (seconds from
/// the start of `src`, converted with [`SampleSpec::samples_in`]) to `sink`, reading
/// through the samples before it in bounded memory. Returns the samples copied, fewer
/// than the window if the stream ends inside it.
pub fn extract_window(
    src: &mut dyn IqSource,
    start_s: f64,
    duration_s: f64,
    sink: &mut dyn IqSink,
    chunk: usize,
) -> Result<u64, IqError> {
    if !(start_s >= 0.0 && duration_s >= 0.0) {
        return Err(IqError::Format(format!(
            "time window start {start_s} s, duration {duration_s} s: both must be non-negative"
        )));
    }
    let spec = src.spec();
    let first = spec.samples_in(start_s) as u64;
    let n = spec.samples_in(duration_s) as u64;
    if skip_samples(src, first, chunk)? < first {
        return Ok(0);
    }
    copy_samples(src, sink, Some(n), chunk)
}

#[cfg(not(target_arch = "wasm32"))]
mod files {
    use super::*;
    use std::fs::File;
    use std::path::Path;

    fn open_err(path: &Path, e: std::io::Error) -> IqError {
        IqError::Io(format!("{}: {e}", path.display()))
    }

    /// Open a raw sample file for streaming, skipping `header_bytes` at its start.
    pub fn open_raw(
        path: &Path,
        format: SampleFormat,
        spec: SampleSpec,
        header_bytes: u64,
    ) -> Result<IqReader<File>, IqError> {
        let mut f = File::open(path).map_err(|e| open_err(path, e))?;
        f.seek(SeekFrom::Start(header_bytes))
            .map_err(|e| open_err(path, e))?;
        Ok(IqReader::new(f, format, spec).with_data_offset(header_bytes))
    }

    /// Create (or truncate) a raw sample file for streaming writes.
    pub fn create_raw(path: &Path, format: SampleFormat) -> Result<IqWriter<File>, IqError> {
        let f = File::create(path).map_err(|e| open_err(path, e))?;
        Ok(IqWriter::new(f, format))
    }
}

#[cfg(not(target_arch = "wasm32"))]
pub use files::{create_raw, open_raw};

#[cfg(test)]
mod tests {
    use super::*;
    use crate::iq::VecSink;

    fn spec() -> SampleSpec {
        SampleSpec {
            fs_hz: 1000.0,
            center_hz: 0.0,
            if_hz: 0.0,
        }
    }

    #[test]
    fn odd_buffer_sizes_and_tiny_chunks_read_every_sample() {
        let data: Vec<Cf64> = (0..37)
            .map(|k| Cf64::new(k as f64 - 18.0, 3.0 - k as f64 / 4.0))
            .collect();
        for f in SampleFormat::all() {
            let (bytes, _) = super::super::format::encode_samples(f, &data, 1.0);
            let whole = super::super::format::decode_samples(f, &bytes, 1.0);
            for chunk in [1, 3, 7, 64] {
                let mut r = IqReader::with_chunk_bytes(&bytes[..], f, spec(), chunk);
                let mut sink = VecSink::default();
                let mut buf = [Cf64::default(); 5];
                loop {
                    let n = r.read(&mut buf).unwrap();
                    if n == 0 {
                        break;
                    }
                    sink.write(&buf[..n]).unwrap();
                }
                assert_eq!(sink.samples, whole, "{f} chunk {chunk}");
            }
        }
    }

    #[test]
    fn window_extraction_counts_from_the_sample_rate() {
        let data: Vec<Cf64> = (0..3000).map(|k| Cf64::new(k as f64, 0.0)).collect();
        let mut src = crate::iq::VecSource::new(spec(), data);
        let mut sink = VecSink::default();
        let n = extract_window(&mut src, 0.5, 1.25, &mut sink, 64).unwrap();
        assert_eq!(n, 1250);
        assert_eq!(sink.samples[0].re, 500.0);
        assert_eq!(sink.samples[1249].re, 1749.0);
    }

    #[test]
    fn seek_lands_on_the_requested_sample() {
        let data: Vec<Cf64> = (0..100).map(|k| Cf64::new(k as f64, -(k as f64))).collect();
        let (bytes, _) = super::super::format::encode_samples(SampleFormat::CI16_BE, &data, 1.0);
        let mut r = IqReader::new(std::io::Cursor::new(bytes), SampleFormat::CI16_BE, spec());
        r.seek_to_sample(42).unwrap();
        let mut b = [Cf64::default(); 2];
        assert_eq!(r.read(&mut b).unwrap(), 2);
        assert_eq!(b[0], data[42]);
        assert_eq!(r.samples_read(), 44);
    }
}
