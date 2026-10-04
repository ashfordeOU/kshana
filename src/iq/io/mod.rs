// SPDX-License-Identifier: AGPL-3.0-only
//! **Large recorded IQ datasets in bounded memory.**
//!
//! Everything here streams: a recording of any length is read and written through fixed
//! staging buffers, so memory use is set by the chunk size, not the file size.
//!
//! * [`format`] - sample encodings: int8, int16 (little- and big-endian), float32, packed
//!   2-bit (three code mappings, two bit orders); complex I/Q, Q/I, or real.
//! * [`stream`] - [`IqReader`] / [`IqWriter`], an [`crate::iq::IqSource`] and
//!   [`crate::iq::IqSink`] over any `std::io::Read` / `Write`, plus time-window extraction.
//! * [`resample`] - polyphase decimation and rational resampling, and real-IF to complex
//!   baseband conversion.
//! * [`sigmf_stream`] - SigMF recordings streamed with every capture and annotation, and
//!   multi-file recordings (SigMF collections) read as one stream with capture boundaries
//!   reported. Builds on [`crate::sigmf`].
//! * [`report`] - CSV and JSON writers for per-file results.
//! * `inventory`, `batch`, `cli` (native only) - a dataset-folder inventory with streamed
//!   SHA-256, a bounded worker-thread batch runner, and the `kshana iq` command group.
//!
//! Status: the encoders and decoders are checked bit-exact by round trips and against
//! hand-built 2-bit vectors; the resampler and real-IF converter are MODELLED DSP checked
//! against the closed-form response of a tone through a linear filter (see
//! `tests/iq_io.rs`).

pub mod format;
pub mod report;
pub mod resample;
pub mod sigmf_stream;
pub mod stream;

#[cfg(not(target_arch = "wasm32"))]
pub mod batch;
#[cfg(not(target_arch = "wasm32"))]
pub mod cli;
#[cfg(not(target_arch = "wasm32"))]
pub mod inventory;

pub use format::{
    decode_samples, encode_samples, BitOrder, Components, Encoding, SampleFormat, TwoBitCode,
};
pub use report::BatchResult;
pub use resample::{PolyphaseResampler, RealIfToBaseband, ResampledSource};
pub use sigmf_stream::{CaptureBoundary, SigmfStream};
pub use stream::{extract_window, IqReader, IqWriter, DEFAULT_CHUNK_BYTES};
