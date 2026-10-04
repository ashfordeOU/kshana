// SPDX-License-Identifier: AGPL-3.0-only
//! **GNSS IQ: the shared contract for signal-level simulation and receiver processing.**
//!
//! [`crate::sdr`] holds a single-satellite GPS L1 C/A front end (code generation, one
//! correlator, acquisition and a DLL+PLL loop) validated on short synthetic blocks. This
//! module is the contract the larger IQ layer is built on: long multi-satellite scenes for
//! software-receiver testing, propagation effects applied at the signal level, a fuller
//! receiver (front end, acquisition, tracking), more signals, and data handling for large
//! recorded IQ datasets. The plan and the rules every submodule follows are in
//! `docs/design/GNSS-IQ-PLAN.md`.
//!
//! The types here are deliberately small and stable so the submodules can be built in
//! parallel and agree at the seams:
//!
//! * [`SampleSpec`] - how a stream of complex baseband samples is sampled.
//! * [`SpreadingCode`] - a ranging code and its modulation, evaluated at a code phase.
//! * [`PathState`] / [`ChannelSnapshot`] - the propagation state of one signal at one
//!   instant: the direct path and any reflected paths, each with its own delay, carrier
//!   phase and amplitude. Channel models produce these; the scene generator consumes them.
//! * [`IqSource`] / [`IqSink`] - chunked, memory-bounded reading and writing of sample
//!   streams, so a multi-gigabyte recording or an hours-long scene never has to sit in
//!   memory at once.
//!
//! Scope: everything in this layer is a **software** simulation and analysis layer. Output
//! is written to files for software receivers; nothing here drives radio hardware.

pub use crate::sdr::Cf64;

/// Speed of light in vacuum (m/s), as used throughout the IQ layer.
pub const C_M_PER_S: f64 = 299_792_458.0;

/// How a stream of complex baseband samples is sampled.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SampleSpec {
    /// Complex sample rate (samples/s).
    pub fs_hz: f64,
    /// Radio frequency the baseband is centred on (Hz), for example 1 575.42 MHz for L1.
    pub center_hz: f64,
    /// Residual intermediate frequency of the signal within the baseband (Hz); 0 for a
    /// zero-IF recording.
    pub if_hz: f64,
}

impl SampleSpec {
    /// Number of whole samples in `seconds` of signal.
    pub fn samples_in(&self, seconds: f64) -> usize {
        (seconds * self.fs_hz).round().max(0.0) as usize
    }
    /// Time (s) of sample index `k` from the start of the stream.
    pub fn time_of(&self, k: u64) -> f64 {
        k as f64 / self.fs_hz
    }
}

/// A ranging code and its modulation, evaluated at a code phase.
///
/// `value_at` returns the baseband chip value including any subcarrier (BOC, CBOC) at a
/// fractional code phase, so one interface covers BPSK and BOC signals. Implementations
/// wrap the phase into one code period themselves.
pub trait SpreadingCode {
    /// Short identifier, for example `"GPS L1 C/A PRN 7"`.
    fn name(&self) -> String;
    /// Chip rate (chips/s).
    fn chip_rate_hz(&self) -> f64;
    /// Code length in chips (one period).
    fn len_chips(&self) -> usize;
    /// Nominal carrier frequency of the signal (Hz).
    fn carrier_hz(&self) -> f64;
    /// Baseband value at `code_phase_chips` (any real number; wrapped internally).
    fn value_at(&self, code_phase_chips: f64) -> f64;
    /// Code period (s).
    fn period_s(&self) -> f64 {
        self.len_chips() as f64 / self.chip_rate_hz()
    }
}

/// The propagation state of one path of one signal at one instant.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PathState {
    /// Group delay of the path (s), including any excess over the direct geometric range.
    pub group_delay_s: f64,
    /// Carrier phase of the path (rad), which may differ from `-2π f τ` by the ionosphere's
    /// phase advance (code-carrier divergence) and by scintillation.
    pub carrier_phase_rad: f64,
    /// Amplitude relative to the unobstructed direct signal (linear; 0 means blocked).
    pub amplitude: f64,
    /// Additional Doppler of the path relative to the direct path (Hz).
    pub extra_doppler_hz: f64,
}

/// The propagation state of one signal at one instant: the direct path first, then any
/// reflected paths. Non-line-of-sight reception is a direct path with amplitude 0 and at
/// least one reflected path.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct ChannelSnapshot {
    /// Time of the snapshot (s from scene start).
    pub t_s: f64,
    /// Direct path followed by reflected paths.
    pub paths: Vec<PathState>,
}

impl ChannelSnapshot {
    /// True when the direct path is blocked (amplitude 0) but some other path arrives.
    pub fn is_nlos(&self) -> bool {
        match self.paths.split_first() {
            Some((direct, rest)) => {
                direct.amplitude == 0.0 && rest.iter().any(|p| p.amplitude > 0.0)
            }
            None => false,
        }
    }
}

/// Errors from reading or writing a sample stream.
#[derive(Debug)]
pub enum IqError {
    /// An I/O failure, with its message.
    Io(String),
    /// Malformed data or metadata, with a description.
    Format(String),
}

impl std::fmt::Display for IqError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            IqError::Io(m) => write!(f, "I/O error: {m}"),
            IqError::Format(m) => write!(f, "format error: {m}"),
        }
    }
}

impl std::error::Error for IqError {}

/// A chunked source of complex samples. `read` fills as much of `buf` as it can and
/// returns how many samples it wrote; 0 means the stream has ended.
pub trait IqSource {
    /// How the stream is sampled.
    fn spec(&self) -> SampleSpec;
    /// Read up to `buf.len()` samples into `buf`.
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError>;
}

/// A chunked sink of complex samples.
pub trait IqSink {
    /// Write every sample in `block`.
    fn write(&mut self, block: &[Cf64]) -> Result<(), IqError>;
    /// Flush and finish the stream.
    fn finish(&mut self) -> Result<(), IqError> {
        Ok(())
    }
}

/// An in-memory sink, for tests and short runs.
#[derive(Clone, Debug, Default)]
pub struct VecSink {
    /// Every sample written so far.
    pub samples: Vec<Cf64>,
}

impl IqSink for VecSink {
    fn write(&mut self, block: &[Cf64]) -> Result<(), IqError> {
        self.samples.extend_from_slice(block);
        Ok(())
    }
}

/// An in-memory source over a sample vector, for tests and short runs.
#[derive(Clone, Debug)]
pub struct VecSource {
    spec: SampleSpec,
    samples: Vec<Cf64>,
    pos: usize,
}

impl VecSource {
    /// A source that yields `samples` sampled as `spec`.
    pub fn new(spec: SampleSpec, samples: Vec<Cf64>) -> Self {
        Self {
            spec,
            samples,
            pos: 0,
        }
    }
}

impl IqSource for VecSource {
    fn spec(&self) -> SampleSpec {
        self.spec
    }
    fn read(&mut self, buf: &mut [Cf64]) -> Result<usize, IqError> {
        let n = buf.len().min(self.samples.len() - self.pos);
        buf[..n].copy_from_slice(&self.samples[self.pos..self.pos + n]);
        self.pos += n;
        Ok(n)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn spec() -> SampleSpec {
        SampleSpec {
            fs_hz: 5.0e6,
            center_hz: 1_575_420_000.0,
            if_hz: 0.0,
        }
    }

    #[test]
    fn sample_spec_counts_and_times() {
        let s = spec();
        assert_eq!(s.samples_in(0.001), 5000);
        assert!((s.time_of(5000) - 0.001).abs() < 1e-15);
    }

    #[test]
    fn vec_source_reads_in_chunks_then_ends() {
        let data: Vec<Cf64> = (0..10).map(|k| Cf64::new(k as f64, 0.0)).collect();
        let mut src = VecSource::new(spec(), data.clone());
        let mut buf = [Cf64::default(); 4];
        let mut sink = VecSink::default();
        loop {
            let n = src.read(&mut buf).unwrap();
            if n == 0 {
                break;
            }
            sink.write(&buf[..n]).unwrap();
        }
        assert_eq!(sink.samples, data);
    }

    #[test]
    fn nlos_needs_a_blocked_direct_path_and_a_live_reflection() {
        let p = |a: f64| PathState {
            group_delay_s: 0.0,
            carrier_phase_rad: 0.0,
            amplitude: a,
            extra_doppler_hz: 0.0,
        };
        assert!(ChannelSnapshot {
            t_s: 0.0,
            paths: vec![p(0.0), p(0.3)]
        }
        .is_nlos());
        assert!(!ChannelSnapshot {
            t_s: 0.0,
            paths: vec![p(1.0), p(0.3)]
        }
        .is_nlos());
        assert!(!ChannelSnapshot {
            t_s: 0.0,
            paths: vec![p(0.0)]
        }
        .is_nlos());
        assert!(!ChannelSnapshot::default().is_nlos());
    }
}
