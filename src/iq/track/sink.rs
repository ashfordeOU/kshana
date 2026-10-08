// SPDX-License-Identifier: AGPL-3.0-only
//! **Streaming tracking output** (`kshana.track-epoch/1`): per-epoch records written as the
//! loops run, so the memory a run needs does not grow with the recording's length.
//!
//! A [`TrackSession`](super::lock::TrackSession) hands every loop update, with the
//! channel's lock state, to an [`EpochSink`]. Three writers serialise the same record:
//! CSV ([`CsvEpochWriter`]), JSON Lines ([`JsonlEpochWriter`]) and a compact binary form
//! ([`BinaryEpochWriter`], read back by [`BinaryEpochReader`]). [`EventsWriter`] writes the
//! lock-state events as JSON Lines, [`Summary`] keeps per-channel running metrics in
//! bounded memory, and [`Fanout`] feeds several sinks at once. The record's fields are
//! documented in `docs/design/LOOP-DESIGN-TOML.md`.
//!
//! The binary form is a single UTF-8 JSON header line ([`EpochHeader`]: schema, field
//! list, record size, the channels with their code, design and design hash, sample rate
//! and engine version) followed by fixed-size little-endian records of
//! [`BINARY_RECORD_BYTES`] bytes each.

use super::channel::EpochOutput;
use super::lock::{LockEvent, LockState};
use crate::iq::{Cf64, IqError};
use serde::{Deserialize, Serialize};
use std::io::{BufRead, Write};

/// The schema identifier of the epoch record.
pub const EPOCH_SCHEMA: &str = "kshana.track-epoch/1";

/// Size of one binary record (bytes).
pub const BINARY_RECORD_BYTES: usize = 184;

/// The record's columns, in CSV/JSONL order.
pub const EPOCH_FIELDS: &[&str] = &[
    "channel",
    "epoch",
    "sample_index",
    "code_epoch_s",
    "t_coh_s",
    "periods",
    "e_i",
    "e_q",
    "p_i",
    "p_q",
    "l_i",
    "l_q",
    "pll_disc_rad",
    "fll_disc_hz",
    "dll_disc_chips",
    "doppler_hz",
    "carrier_phase_cycles",
    "code_rate_hz",
    "code_phase_chips",
    "pli",
    "phase_lock",
    "code_lock",
    "cn0_nwpr_dbhz",
    "cn0_beaulieu_dbhz",
    "cn0_m2m4_dbhz",
    "bit_edge",
    "bit",
    "state",
];

/// Who a channel index refers to.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct ChannelInfo {
    /// The code tracked, e.g. `GPS L1 C/A PRN 17`.
    pub code: String,
    /// The loop design's name.
    pub design: String,
    /// The loop design's hash ([`super::design::Design::hash`]); empty for an ad-hoc
    /// [`super::LoopConfig`].
    pub design_hash: String,
}

/// The header of an epoch output: the first line of the binary form, and the first line
/// (`{"header": …}`) of the JSON-Lines form. The CSV form has only a column row; its
/// records carry the channel index, and the channel list is in the run's `--summary`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochHeader {
    /// [`EPOCH_SCHEMA`].
    pub schema: String,
    /// [`EPOCH_FIELDS`].
    pub fields: Vec<String>,
    /// Bytes per binary record.
    pub record_bytes: usize,
    /// The channels, by index.
    pub channels: Vec<ChannelInfo>,
    /// Sample rate of the stream (Hz).
    pub sample_rate_hz: f64,
    /// Version of the engine that wrote the file.
    pub engine_version: String,
    /// SHA-256 of the recording, when the caller supplies it.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub recording_sha256: Option<String>,
}

impl EpochHeader {
    /// A header for `channels` on a stream sampled at `sample_rate_hz`.
    pub fn new(channels: Vec<ChannelInfo>, sample_rate_hz: f64) -> Self {
        Self {
            schema: EPOCH_SCHEMA.into(),
            fields: EPOCH_FIELDS.iter().map(|s| s.to_string()).collect(),
            record_bytes: BINARY_RECORD_BYTES,
            channels,
            sample_rate_hz,
            engine_version: env!("CARGO_PKG_VERSION").into(),
            recording_sha256: None,
        }
    }
}

/// A receiver of tracking output.
pub trait EpochSink {
    /// One loop update of channel `channel`, in lock state `state`.
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError>;
    /// One lock-state event.
    fn event(&mut self, _ev: &LockEvent) -> Result<(), IqError> {
        Ok(())
    }
    /// Flush at the end of the run.
    fn finish(&mut self) -> Result<(), IqError> {
        Ok(())
    }
}

fn io(e: std::io::Error) -> IqError {
    IqError::Io(e.to_string())
}

/// One epoch as an owned, flat record: what every writer serialises and what
/// [`BinaryEpochReader`] returns.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochRecord {
    /// Channel index.
    pub channel: u32,
    /// Loop update index.
    pub epoch: u64,
    /// First stream sample after the integration.
    pub sample_index: u64,
    /// Receive time of the code epoch ending the integration (s).
    pub code_epoch_s: f64,
    /// Integration time (s).
    pub t_coh_s: f64,
    /// Code periods integrated.
    pub periods: u32,
    /// Early correlator, in-phase.
    pub e_i: f64,
    /// Early correlator, quadrature.
    pub e_q: f64,
    /// Prompt correlator, in-phase.
    pub p_i: f64,
    /// Prompt correlator, quadrature.
    pub p_q: f64,
    /// Late correlator, in-phase.
    pub l_i: f64,
    /// Late correlator, quadrature.
    pub l_q: f64,
    /// Carrier-phase discriminator (rad).
    pub pll_disc_rad: f64,
    /// Carrier-frequency discriminator (Hz).
    pub fll_disc_hz: f64,
    /// Code discriminator (chips).
    pub dll_disc_chips: f64,
    /// Carrier NCO Doppler after the update (Hz).
    pub doppler_hz: f64,
    /// Accumulated carrier NCO phase (cycles).
    pub carrier_phase_cycles: f64,
    /// Code NCO rate (chips/s).
    pub code_rate_hz: f64,
    /// Replica code phase at `sample_index` (chips).
    pub code_phase_chips: f64,
    /// Smoothed phase lock indicator.
    pub pli: f64,
    /// Phase lock flag.
    pub phase_lock: bool,
    /// Code lock flag.
    pub code_lock: bool,
    /// NWPR C/N0 (dB-Hz), once available.
    pub cn0_nwpr_dbhz: Option<f64>,
    /// Beaulieu C/N0 (dB-Hz), once available.
    pub cn0_beaulieu_dbhz: Option<f64>,
    /// M2M4 C/N0 (dB-Hz), once available.
    pub cn0_m2m4_dbhz: Option<f64>,
    /// Bit edge phase, once synchronised.
    pub bit_edge: Option<u32>,
    /// Sign of a bit completed since the previous update.
    pub bit: Option<i8>,
    /// Lock state.
    pub state: LockState,
}

impl EpochRecord {
    /// The record for channel `channel`'s update `e` in state `state`.
    pub fn new(channel: usize, e: &EpochOutput, state: LockState) -> Self {
        Self {
            channel: channel as u32,
            epoch: e.epoch,
            sample_index: e.sample_index,
            code_epoch_s: e.code_epoch_s,
            t_coh_s: e.t_coh_s,
            periods: e.periods as u32,
            e_i: e.early.re,
            e_q: e.early.im,
            p_i: e.prompt.re,
            p_q: e.prompt.im,
            l_i: e.late.re,
            l_q: e.late.im,
            pll_disc_rad: e.disc.pll_rad,
            fll_disc_hz: e.disc.fll_hz,
            dll_disc_chips: e.disc.dll_chips,
            doppler_hz: e.doppler_hz,
            carrier_phase_cycles: e.carrier_phase_cycles,
            code_rate_hz: e.code_rate_hz,
            code_phase_chips: e.code_phase_chips,
            pli: e.pli,
            phase_lock: e.phase_lock,
            code_lock: e.code_lock,
            cn0_nwpr_dbhz: e.cn0_nwpr_dbhz,
            cn0_beaulieu_dbhz: e.cn0_beaulieu_dbhz,
            cn0_m2m4_dbhz: e.cn0_m2m4_dbhz,
            bit_edge: e.bit_edge.map(|b| b as u32),
            bit: e.bit,
            state,
        }
    }

    /// The prompt correlation.
    pub fn prompt(&self) -> Cf64 {
        Cf64::new(self.p_i, self.p_q)
    }

    fn csv_row(&self) -> String {
        let o = |v: Option<f64>| v.map(|x| x.to_string()).unwrap_or_default();
        format!(
            "{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{},{}",
            self.channel,
            self.epoch,
            self.sample_index,
            self.code_epoch_s,
            self.t_coh_s,
            self.periods,
            self.e_i,
            self.e_q,
            self.p_i,
            self.p_q,
            self.l_i,
            self.l_q,
            self.pll_disc_rad,
            self.fll_disc_hz,
            self.dll_disc_chips,
            self.doppler_hz,
            self.carrier_phase_cycles,
            self.code_rate_hz,
            self.code_phase_chips,
            self.pli,
            self.phase_lock,
            self.code_lock,
            o(self.cn0_nwpr_dbhz),
            o(self.cn0_beaulieu_dbhz),
            o(self.cn0_m2m4_dbhz),
            self.bit_edge.map(|b| b.to_string()).unwrap_or_default(),
            self.bit.map(|b| b.to_string()).unwrap_or_default(),
            self.state.as_str(),
        )
    }

    /// The fixed-size little-endian binary form.
    pub fn to_bytes(&self) -> [u8; BINARY_RECORD_BYTES] {
        let mut b = [0u8; BINARY_RECORD_BYTES];
        let mut flags = 0u8;
        for (bit, on) in [
            self.phase_lock,
            self.code_lock,
            self.cn0_nwpr_dbhz.is_some(),
            self.cn0_beaulieu_dbhz.is_some(),
            self.bit_edge.is_some(),
            self.bit.is_some(),
            self.cn0_m2m4_dbhz.is_some(),
        ]
        .into_iter()
        .enumerate()
        {
            if on {
                flags |= 1 << bit;
            }
        }
        b[0..4].copy_from_slice(&self.channel.to_le_bytes());
        b[4] = self.state.code();
        b[5] = flags;
        b[6] = self.bit.unwrap_or(0) as u8;
        // b[7] reserved.
        b[8..16].copy_from_slice(&self.epoch.to_le_bytes());
        b[16..24].copy_from_slice(&self.sample_index.to_le_bytes());
        b[24..28].copy_from_slice(&self.periods.to_le_bytes());
        b[28..32].copy_from_slice(&self.bit_edge.unwrap_or(0).to_le_bytes());
        let floats = [
            self.code_epoch_s,
            self.t_coh_s,
            self.e_i,
            self.e_q,
            self.p_i,
            self.p_q,
            self.l_i,
            self.l_q,
            self.pll_disc_rad,
            self.fll_disc_hz,
            self.dll_disc_chips,
            self.doppler_hz,
            self.carrier_phase_cycles,
            self.code_rate_hz,
            self.code_phase_chips,
            self.pli,
            self.cn0_nwpr_dbhz.unwrap_or(0.0),
            self.cn0_beaulieu_dbhz.unwrap_or(0.0),
            self.cn0_m2m4_dbhz.unwrap_or(0.0),
        ];
        for (i, v) in floats.iter().enumerate() {
            let at = 32 + 8 * i;
            b[at..at + 8].copy_from_slice(&v.to_le_bytes());
        }
        b
    }

    /// Parse the binary form.
    pub fn from_bytes(b: &[u8; BINARY_RECORD_BYTES]) -> Result<Self, IqError> {
        let u32_at = |at: usize| u32::from_le_bytes(b[at..at + 4].try_into().unwrap_or([0; 4]));
        let u64_at = |at: usize| u64::from_le_bytes(b[at..at + 8].try_into().unwrap_or([0; 8]));
        let f = |i: usize| {
            let at = 32 + 8 * i;
            f64::from_le_bytes(b[at..at + 8].try_into().unwrap_or([0; 8]))
        };
        let flags = b[5];
        let has = |bit: u8| flags & (1 << bit) != 0;
        let state = LockState::from_code(b[4])
            .ok_or_else(|| IqError::Format(format!("unknown lock-state code {}", b[4])))?;
        Ok(Self {
            channel: u32_at(0),
            epoch: u64_at(8),
            sample_index: u64_at(16),
            periods: u32_at(24),
            code_epoch_s: f(0),
            t_coh_s: f(1),
            e_i: f(2),
            e_q: f(3),
            p_i: f(4),
            p_q: f(5),
            l_i: f(6),
            l_q: f(7),
            pll_disc_rad: f(8),
            fll_disc_hz: f(9),
            dll_disc_chips: f(10),
            doppler_hz: f(11),
            carrier_phase_cycles: f(12),
            code_rate_hz: f(13),
            code_phase_chips: f(14),
            pli: f(15),
            phase_lock: has(0),
            code_lock: has(1),
            cn0_nwpr_dbhz: has(2).then(|| f(16)),
            cn0_beaulieu_dbhz: has(3).then(|| f(17)),
            bit_edge: has(4).then(|| u32_at(28)),
            bit: has(5).then_some(b[6] as i8),
            cn0_m2m4_dbhz: has(6).then(|| f(18)),
            state,
        })
    }
}

/// Writes epochs as CSV: a header row of [`EPOCH_FIELDS`], then one row per epoch.
pub struct CsvEpochWriter<W: Write> {
    w: W,
}

impl<W: Write> CsvEpochWriter<W> {
    /// A writer on `w`; writes the header row at once.
    pub fn new(mut w: W) -> Result<Self, IqError> {
        writeln!(w, "{}", EPOCH_FIELDS.join(",")).map_err(io)?;
        Ok(Self { w })
    }
}

impl<W: Write> EpochSink for CsvEpochWriter<W> {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        writeln!(self.w, "{}", EpochRecord::new(channel, e, state).csv_row()).map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.w.flush().map_err(io)
    }
}

/// Writes epochs as JSON Lines: a first line holding the [`EpochHeader`] (as
/// `{"header": ...}`), then one [`EpochRecord`] object per line.
pub struct JsonlEpochWriter<W: Write> {
    w: W,
}

impl<W: Write> JsonlEpochWriter<W> {
    /// A writer on `w`; writes the header line at once.
    pub fn new(mut w: W, header: &EpochHeader) -> Result<Self, IqError> {
        let line = serde_json::to_string(&serde_json::json!({ "header": header }))
            .map_err(|e| IqError::Format(e.to_string()))?;
        writeln!(w, "{line}").map_err(io)?;
        Ok(Self { w })
    }
}

impl<W: Write> EpochSink for JsonlEpochWriter<W> {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        let line = serde_json::to_string(&EpochRecord::new(channel, e, state))
            .map_err(|e| IqError::Format(e.to_string()))?;
        writeln!(self.w, "{line}").map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.w.flush().map_err(io)
    }
}

/// Writes epochs in the binary form: the [`EpochHeader`] as one JSON line, then
/// [`BINARY_RECORD_BYTES`]-byte records.
pub struct BinaryEpochWriter<W: Write> {
    w: W,
}

impl<W: Write> BinaryEpochWriter<W> {
    /// A writer on `w`; writes the header line at once.
    pub fn new(mut w: W, header: &EpochHeader) -> Result<Self, IqError> {
        let line = serde_json::to_string(header).map_err(|e| IqError::Format(e.to_string()))?;
        writeln!(w, "{line}").map_err(io)?;
        Ok(Self { w })
    }
}

impl<W: Write> EpochSink for BinaryEpochWriter<W> {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        self.w
            .write_all(&EpochRecord::new(channel, e, state).to_bytes())
            .map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.w.flush().map_err(io)
    }
}

/// Reads the binary form back, record by record, in bounded memory.
pub struct BinaryEpochReader<R: BufRead> {
    header: EpochHeader,
    r: R,
}

impl<R: BufRead> BinaryEpochReader<R> {
    /// Read the header line and check the schema and record size.
    pub fn new(mut r: R) -> Result<Self, IqError> {
        let mut line = Vec::new();
        r.read_until(b'\n', &mut line).map_err(io)?;
        let header: EpochHeader = serde_json::from_slice(&line)
            .map_err(|e| IqError::Format(format!("epoch file header: {e}")))?;
        if header.schema != EPOCH_SCHEMA {
            return Err(IqError::Format(format!(
                "epoch file schema {:?}; expected {EPOCH_SCHEMA:?}",
                header.schema
            )));
        }
        if header.record_bytes != BINARY_RECORD_BYTES {
            return Err(IqError::Format(format!(
                "epoch file records are {} bytes; this reader expects {BINARY_RECORD_BYTES}",
                header.record_bytes
            )));
        }
        Ok(Self { header, r })
    }

    /// The file's header.
    pub fn header(&self) -> &EpochHeader {
        &self.header
    }
}

impl<R: BufRead> Iterator for BinaryEpochReader<R> {
    type Item = Result<EpochRecord, IqError>;
    fn next(&mut self) -> Option<Self::Item> {
        let mut b = [0u8; BINARY_RECORD_BYTES];
        let mut got = 0;
        while got < b.len() {
            match self.r.read(&mut b[got..]) {
                Ok(0) if got == 0 => return None,
                Ok(0) => {
                    return Some(Err(IqError::Format(format!(
                        "epoch file ends inside a record ({got} of {BINARY_RECORD_BYTES} bytes)"
                    ))))
                }
                Ok(n) => got += n,
                Err(e) => return Some(Err(io(e))),
            }
        }
        Some(EpochRecord::from_bytes(&b))
    }
}

/// Writes lock-state events as JSON Lines.
pub struct EventsWriter<W: Write> {
    w: W,
}

impl<W: Write> EventsWriter<W> {
    /// A writer on `w`.
    pub fn new(w: W) -> Self {
        Self { w }
    }
}

impl<W: Write> EpochSink for EventsWriter<W> {
    fn epoch(&mut self, _: usize, _: &EpochOutput, _: LockState) -> Result<(), IqError> {
        Ok(())
    }
    fn event(&mut self, ev: &LockEvent) -> Result<(), IqError> {
        let line = serde_json::to_string(ev).map_err(|e| IqError::Format(e.to_string()))?;
        writeln!(self.w, "{line}").map_err(io)
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.w.flush().map_err(io)
    }
}

/// Feeds every sink it holds.
#[derive(Default)]
pub struct Fanout<'a> {
    sinks: Vec<&'a mut dyn EpochSink>,
}

impl<'a> Fanout<'a> {
    /// An empty fan-out.
    pub fn new() -> Self {
        Self { sinks: Vec::new() }
    }
    /// Add a sink.
    pub fn push(&mut self, s: &'a mut dyn EpochSink) {
        self.sinks.push(s);
    }
}

impl EpochSink for Fanout<'_> {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        self.sinks
            .iter_mut()
            .try_for_each(|s| s.epoch(channel, e, state))
    }
    fn event(&mut self, ev: &LockEvent) -> Result<(), IqError> {
        self.sinks.iter_mut().try_for_each(|s| s.event(ev))
    }
    fn finish(&mut self) -> Result<(), IqError> {
        self.sinks.iter_mut().try_for_each(|s| s.finish())
    }
}

/// Keeps every epoch in memory, per channel. For tests and short runs; a long run should
/// stream to a writer instead.
#[derive(Default)]
pub struct CollectSink {
    /// Per channel, every epoch with its state.
    pub channels: Vec<Vec<(EpochOutput, LockState)>>,
    /// Every event.
    pub events: Vec<LockEvent>,
}

impl EpochSink for CollectSink {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        if self.channels.len() <= channel {
            self.channels.resize_with(channel + 1, Vec::new);
        }
        self.channels[channel].push((e.clone(), state));
        Ok(())
    }
    fn event(&mut self, ev: &LockEvent) -> Result<(), IqError> {
        self.events.push(ev.clone());
        Ok(())
    }
}

/// Welford running mean and variance.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
struct Welford {
    n: u64,
    mean: f64,
    m2: f64,
}

impl Welford {
    fn push(&mut self, x: f64) {
        self.n += 1;
        let d = x - self.mean;
        self.mean += d / self.n as f64;
        self.m2 += d * (x - self.mean);
    }
    /// Sample standard deviation (0 for fewer than two values).
    fn std(&self) -> f64 {
        if self.n < 2 {
            0.0
        } else {
            (self.m2 / (self.n - 1) as f64).sqrt()
        }
    }
}

/// Running metrics of one channel.
#[derive(Clone, Debug, Default, PartialEq)]
pub struct ChannelSummary {
    /// Loop updates seen.
    pub epochs: u64,
    /// Updates with phase lock.
    pub phase_lock_epochs: u64,
    /// Updates with code lock.
    pub code_lock_epochs: u64,
    /// Updates in [`LockState::Locked`].
    pub locked_epochs: u64,
    /// Lock-state transitions.
    pub transitions: u64,
    /// False locks detected.
    pub false_locks: u64,
    /// Re-acquisitions that succeeded.
    pub reacquisitions: u64,
    /// The last update.
    pub last: Option<EpochRecord>,
    /// The channel's lock state at the end: the later of the last update's state and the
    /// last transition (a channel retired after its last update ends `RETIRED`).
    pub final_state: Option<LockState>,
    /// Mean NWPR C/N0 over every update that has one (dB-Hz).
    pub mean_cn0_dbhz: Option<f64>,
    /// Carrier-phase discriminator standard deviation over the steady-state part (deg).
    pub phase_jitter_deg: f64,
    /// Code discriminator standard deviation over the steady-state part (chips).
    pub code_jitter_chips: f64,
    cn0_sum: f64,
    cn0_n: u64,
    pll: Welford,
    dll: Welford,
}

impl ChannelSummary {
    /// Fraction of updates with phase lock.
    pub fn phase_lock_fraction(&self) -> f64 {
        ratio(self.phase_lock_epochs, self.epochs)
    }
    /// Fraction of updates with code lock.
    pub fn code_lock_fraction(&self) -> f64 {
        ratio(self.code_lock_epochs, self.epochs)
    }
    /// Fraction of updates in [`LockState::Locked`].
    pub fn locked_fraction(&self) -> f64 {
        ratio(self.locked_epochs, self.epochs)
    }
    /// Whether the last update had both phase and code lock.
    pub fn locked_at_end(&self) -> bool {
        self.last
            .as_ref()
            .is_some_and(|l| l.phase_lock && l.code_lock)
    }
}

fn ratio(a: u64, b: u64) -> f64 {
    if b == 0 {
        0.0
    } else {
        a as f64 / b as f64
    }
}

/// Running per-channel metrics, kept in O(channels) memory. Jitter is measured over the
/// updates whose code epoch falls at or after `steady_from_s` (the steady-state part).
#[derive(Clone, Debug, Default, PartialEq)]
pub struct Summary {
    /// Per channel.
    pub channels: Vec<ChannelSummary>,
    steady_from_s: f64,
}

impl Summary {
    /// A summary that measures jitter from `steady_from_s` (s) on.
    pub fn new(steady_from_s: f64) -> Self {
        Self {
            channels: Vec::new(),
            steady_from_s,
        }
    }
}

impl EpochSink for Summary {
    fn epoch(&mut self, channel: usize, e: &EpochOutput, state: LockState) -> Result<(), IqError> {
        if self.channels.len() <= channel {
            self.channels
                .resize_with(channel + 1, ChannelSummary::default);
        }
        let c = &mut self.channels[channel];
        c.epochs += 1;
        c.phase_lock_epochs += u64::from(e.phase_lock);
        c.code_lock_epochs += u64::from(e.code_lock);
        c.locked_epochs += u64::from(state == LockState::Locked);
        if let Some(cn0) = e.cn0_nwpr_dbhz {
            c.cn0_sum += cn0;
            c.cn0_n += 1;
            c.mean_cn0_dbhz = Some(c.cn0_sum / c.cn0_n as f64);
        }
        if e.code_epoch_s >= self.steady_from_s {
            c.pll.push(e.disc.pll_rad);
            c.dll.push(e.disc.dll_chips);
            c.phase_jitter_deg = c.pll.std().to_degrees();
            c.code_jitter_chips = c.dll.std();
        }
        c.last = Some(EpochRecord::new(channel, e, state));
        c.final_state = Some(state);
        Ok(())
    }
    fn event(&mut self, ev: &LockEvent) -> Result<(), IqError> {
        let ch = ev.channel as usize;
        if self.channels.len() <= ch {
            self.channels.resize_with(ch + 1, ChannelSummary::default);
        }
        let c = &mut self.channels[ch];
        if ev.from != ev.to {
            c.transitions += 1;
        }
        if ev.reason == "false-lock" {
            c.false_locks += 1;
        }
        if ev.reason == "reacquired" {
            c.reacquisitions += 1;
        }
        c.final_state = Some(ev.to);
        Ok(())
    }
}

/// The epoch-file format, by name or by path suffix.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum EpochFormat {
    /// CSV with a header row.
    Csv,
    /// JSON Lines with a header line.
    Jsonl,
    /// JSON header line plus fixed little-endian records.
    Binary,
}

impl EpochFormat {
    /// Parse `csv`, `jsonl` or `bin`/`binary`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.to_ascii_lowercase().as_str() {
            "csv" => Ok(Self::Csv),
            "jsonl" | "jsonlines" => Ok(Self::Jsonl),
            "bin" | "binary" => Ok(Self::Binary),
            o => Err(format!("epoch format {o:?}: expected csv, jsonl or bin")),
        }
    }

    /// The format a path's suffix names (`.csv`, `.jsonl`, `.bin`/`.epochs`), if any.
    pub fn from_path(p: &str) -> Option<Self> {
        let l = p.to_ascii_lowercase();
        if l.ends_with(".csv") {
            Some(Self::Csv)
        } else if l.ends_with(".jsonl") {
            Some(Self::Jsonl)
        } else if l.ends_with(".bin") || l.ends_with(".epochs") {
            Some(Self::Binary)
        } else {
            None
        }
    }

    /// A boxed writer of this format on `w`.
    pub fn writer<'w, W: Write + 'w>(
        self,
        w: W,
        header: &EpochHeader,
    ) -> Result<Box<dyn EpochSink + 'w>, IqError> {
        Ok(match self {
            Self::Csv => Box::new(CsvEpochWriter::new(w)?),
            Self::Jsonl => Box::new(JsonlEpochWriter::new(w, header)?),
            Self::Binary => Box::new(BinaryEpochWriter::new(w, header)?),
        })
    }
}
