// SPDX-License-Identifier: AGPL-3.0-only
//! Recordings described by an ION GNSS SDR Metadata Standard `.sdrx` file, streamed.
//!
//! [`crate::realdata::ion_sdr`] parses the `.sdrx` XML into an [`SdrLayout`] and decodes
//! samples from bytes held in memory. [`SdrxSource`] streams the same decoding over any
//! [`std::io::Read`], one layout unit (a whole number of chunks, see
//! [`SdrLayout::chunk_bytes`]) at a time, so a recording of any length is read in memory
//! set by the chunk size. Every sample it returns equals
//! [`crate::realdata::ion_sdr::decode`] on the whole file (checked in `tests/iq_io.rs`).
//!
//! The subset of the standard read is the one [`crate::realdata::ion_sdr::parse_sdrx`]
//! accepts (one lane, one stream, one block); anything else is refused with its reason.
//! Values are the integer levels the stream's coding defines (two's complement as the
//! signed integer, offset binary and sign-magnitude as the odd levels ±1, ±3, …), with no
//! mid-rise correction: apply [`crate::realdata::ion_sdr::to_mid_rise`] downstream when the
//! converter is two's complement with thresholds at the integers.

use crate::iq::{Cf64, IqError, IqSource, SampleSpec};
use crate::realdata::ion_sdr::{self, SdrLayout};
use std::io::Read;

/// A streaming [`IqSource`] over the data of an `.sdrx`-described recording. The reader
/// must be positioned at the start of the data file; the block header is skipped here.
pub struct SdrxSource<R> {
    inner: R,
    layout: SdrLayout,
    spec: SampleSpec,
    unit: Vec<u8>,
    decoded: Vec<Cf64>,
    pos_in_decoded: usize,
    remaining: u64,
    header_left: u64,
}

impl<R: Read> SdrxSource<R> {
    /// A source over `inner` (positioned at byte 0 of the data file, `data_len` bytes
    /// long) laid out as `layout`.
    pub fn new(inner: R, layout: SdrLayout, data_len: u64) -> Result<Self, IqError> {
        if layout.samples_per_chunk() == 0 {
            return Err(IqError::Format(
                ".sdrx layout: a chunk holds no whole lump".into(),
            ));
        }
        let remaining = layout.sample_count(data_len as usize) as u64;
        let spec = SampleSpec {
            fs_hz: layout.sample_rate_hz,
            center_hz: layout.center_freq_hz,
            if_hz: layout.translated_freq_hz,
        };
        let header_left = layout.header_bytes as u64;
        let mut unit_layout = layout.clone();
        unit_layout.header_bytes = 0;
        unit_layout.footer_bytes = 0;
        Ok(SdrxSource {
            inner,
            unit: vec![0; layout.chunk_bytes()],
            layout: unit_layout,
            spec,
            decoded: Vec::new(),
            pos_in_decoded: 0,
            remaining,
            header_left,
        })
    }

    /// Samples not yet returned.
    pub fn remaining(&self) -> u64 {
        self.remaining + (self.decoded.len() - self.pos_in_decoded) as u64
    }

    /// The layout (with its header and footer zeroed: they are handled by the source).
    pub fn layout(&self) -> &SdrLayout {
        &self.layout
    }

    fn refill(&mut self) -> Result<bool, IqError> {
        if self.remaining == 0 {
            return Ok(false);
        }
        if self.header_left > 0 {
            let skipped = std::io::copy(
                &mut (&mut self.inner).take(self.header_left),
                &mut std::io::sink(),
            )
            .map_err(|e| IqError::Io(e.to_string()))?;
            if skipped < self.header_left {
                return Err(IqError::Format(".sdrx data ends inside its header".into()));
            }
            self.header_left = 0;
        }
        self.inner
            .read_exact(&mut self.unit)
            .map_err(|e| IqError::Io(format!(".sdrx data: {e}")))?;
        let per = self.layout.samples_per_chunk();
        let n = (per as u64).min(self.remaining) as usize;
        self.decoded = ion_sdr::decode(&self.layout, &self.unit, 0, n).map_err(IqError::Format)?;
        self.pos_in_decoded = 0;
        self.remaining -= n as u64;
        Ok(true)
    }
}

impl<R: Read> IqSource for SdrxSource<R> {
    fn spec(&self) -> SampleSpec {
        self.spec
    }

    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let mut k = 0;
        while k < buf.len() {
            if self.pos_in_decoded == self.decoded.len() && !self.refill()? {
                break;
            }
            let take = (self.decoded.len() - self.pos_in_decoded).min(buf.len() - k);
            buf[k..k + take]
                .copy_from_slice(&self.decoded[self.pos_in_decoded..self.pos_in_decoded + take]);
            self.pos_in_decoded += take;
            k += take;
        }
        Ok(k)
    }
}

/// A short description of a layout for listings, e.g. `sdrx 4-bit tc iq (8 bits/sample)`.
pub fn layout_label(l: &SdrLayout) -> String {
    use ion_sdr::{Encoding as E, SampleFormat as F};
    let enc = match l.encoding {
        E::TwosComplement => "tc",
        E::OffsetBinary => "ob",
        E::SignMagnitude => "sm",
        E::Sign => "sign",
    };
    let fmt = match l.format {
        F::Iq => "iq",
        F::Qi => "qi",
        F::If => "real",
    };
    format!(
        "sdrx {}-bit {enc} {fmt} ({} bits/sample)",
        l.quantization, l.packed_bits
    )
}

#[cfg(not(target_arch = "wasm32"))]
mod files {
    use super::*;
    use std::path::{Path, PathBuf};

    /// Parse an `.sdrx` file and resolve its data file (the `url`, relative to the
    /// `.sdrx` file's folder).
    pub fn read_sdrx(path: &Path) -> Result<(SdrLayout, PathBuf), IqError> {
        let text = std::fs::read_to_string(path)
            .map_err(|e| IqError::Io(format!("{}: {e}", path.display())))?;
        let layout = ion_sdr::parse_sdrx(&text)
            .map_err(|e| IqError::Format(format!("{}: {e}", path.display())))?;
        let dir = path.parent().unwrap_or(Path::new("."));
        let data = dir.join(&layout.url);
        Ok((layout, data))
    }

    /// Open an `.sdrx`-described recording for streaming; returns the source, the data
    /// file and its length in bytes.
    pub fn open_sdrx(path: &Path) -> Result<(SdrxSource<std::fs::File>, PathBuf, u64), IqError> {
        let (layout, data) = read_sdrx(path)?;
        let f = std::fs::File::open(&data)
            .map_err(|e| IqError::Io(format!("{}: {e}", data.display())))?;
        let len = f
            .metadata()
            .map_err(|e| IqError::Io(format!("{}: {e}", data.display())))?
            .len();
        Ok((SdrxSource::new(f, layout, len)?, data, len))
    }
}

#[cfg(not(target_arch = "wasm32"))]
pub use files::{open_sdrx, read_sdrx};
