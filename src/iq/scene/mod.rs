// SPDX-License-Identifier: AGPL-3.0-only
//! **Multi-satellite GNSS IQ scene generator** for software-receiver testing.
//!
//! A [`Scene`] is a receiver (trajectory, clock, noise) and a list of
//! [`SceneSatellite`]s, each with a [`SpreadingCode`], a geometry source (a broadcast
//! ephemeris or a stated range profile), a C/N0 and navigation data. Generation writes
//! complex baseband samples through an [`IqSink`] chunk by chunk, so an hours-long scene
//! runs in bounded memory, and writes a truth sidecar ([`TruthRecord`]) through a
//! [`TruthSink`] at a configurable epoch interval.
//!
//! ## Signal model
//!
//! Sample `k` is taken at receiver time `t = k / fs`. For a satellite with pseudorange
//! `P(t)` (geometric range plus `c` times receiver clock offset less satellite clock
//! offset), carrier `f` and a path of extra group delay `τ`, carrier phase `φ`, extra
//! Doppler `f_d` and relative amplitude `a` (a [`PathState`]), the sample is
//!
//! ```text
//! s(t) = Σ_path a·A · d(t_tx) · c(t_tx) · exp(j·2π·[(f − f_center + f_IF)·t − f·P(t)/c
//!                                               + φ/2π + f_d·(t − t_j)])  +  n(t)
//! t_tx = t − P(t)/c − τ
//! ```
//!
//! where `c(·)` is the code (`value_at` of the code phase `R_c · (TOW₀ + t_tx)`), `d(·)` the
//! data bit, `A = √(C/N0 · N0)` and `n` complex white Gaussian noise of power `N0 · fs`
//! (one-sided density `N0` in each of I and Q together). The local oscillator is locked to
//! the receiver clock, so receiver clock drift appears as a pseudorange rate and moves every
//! carrier by `−drift · f`. The carrier Doppler is `−f · Ṗ / c = −Ṗ / λ`.
//!
//! Geometry (pseudorange, its rate, look angles, C/N0, visibility) and any channel
//! snapshot are computed at `geometry_rate_hz` (default 1 kHz) knots `t_j = j / rate`.
//! Between knots the pseudorange is a cubic Hermite interpolant of `P` and `Ṗ` at both ends
//! (exact for a quadratic range, and continuous in phase and frequency); amplitude,
//! visibility and the channel's paths are held from knot `j`, with the path phase advanced
//! by its extra Doppler.
//!
//! ## Determinism and chunking
//!
//! Every sample is a pure function of its index, the knots and the seed: knots are pure
//! functions of their index (the channel hook is called exactly once per satellite per
//! knot, in order), and the noise of sample `k` is drawn from ChaCha8 stream position `4k`
//! with Box-Muller. So the output is bit-identical for any chunk size and thread count,
//! and the same seed gives the same samples. Synthesis within a chunk is split over
//! `threads` scoped threads.
//!
//! ## Labels
//!
//! MODELLED throughout: the scene is a synthetic signal. Checked against independent
//! references in the tests: the existing receiver ([`crate::sdr::acquire`], `track`,
//! `correlate`) recovers each injected code phase, Doppler and C/N0 (the closed-form
//! coherent SNR `C/N0 · T`); the carrier's measured frequency equals `−range_rate / λ`;
//! LNAV frames decode with [`crate::gps_lnav::decode_fields`]; broadcast-ephemeris
//! pseudoranges solve back to the receiver position through [`crate::pvt::solve_spp`].
//! Not modelled: ionosphere, troposphere, multipath (supply them through the channel hook),
//! antenna patterns beyond the [`ElevationCn0`] default, quantisation, and front-end
//! filtering. Output is files for software receivers only.

mod code;
mod geometry;
mod nav;
mod truth;

#[cfg(test)]
mod tests;

pub use code::GpsL1Ca;
pub use geometry::{
    ElevationCn0, GeomPoint, RangeProfile, ReceiverClock, SatGeometry, Trajectory, Vec3,
};
pub use nav::{lnav_frame_bits, lnav_from_rinex, NavData, LNAV_BIT_S, LNAV_FRAME_BITS};
pub use truth::{
    truth_from_csv, truth_from_json, truth_to_csv, truth_to_json, CsvTruthWriter,
    JsonLinesTruthWriter, NullTruth, TruthRecord, TruthSink,
};

use crate::gps_lnav::LnavConventions;
use crate::iq::{
    ChannelSnapshot, DataModulation, IqError, IqSink, IqSource, PathState, SampleSpec,
    SpreadingCode, C_M_PER_S,
};
use crate::rinex::RinexEphemeris;
use nav::{BitWindow, NavState};
use rand::RngCore;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use std::collections::VecDeque;
use std::f64::consts::TAU;

/// Boltzmann's constant (J/K), CODATA exact value.
pub const BOLTZMANN_J_PER_K: f64 = 1.380_649e-23;
/// IEEE reference noise temperature `T0` (K).
pub const T0_K: f64 = 290.0;

/// A spreading code a scene can use: any [`SpreadingCode`] that can be shared across the
/// synthesis threads.
pub type SceneCode = Box<dyn SpreadingCode + Send + Sync>;

/// Thermal noise of the scene.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct NoiseConfig {
    /// One-sided noise power spectral density `N0` (dBW/Hz). C/N0 values are relative to it.
    pub n0_dbw_per_hz: f64,
    /// Add the noise (false gives a noise-free scene at the same signal amplitudes).
    pub enabled: bool,
    /// Scale the output so the noise power per complex sample is 1 (`N0 · fs → 1`);
    /// false leaves samples in √W.
    pub normalise: bool,
}

impl NoiseConfig {
    /// `N0 = k · (T_ant + T0 · (F − 1))` for a receiver of noise figure `nf_db` behind an
    /// antenna of noise temperature `antenna_temp_k` (closed form, Friis/IEEE definition).
    pub fn from_noise_figure(nf_db: f64, antenna_temp_k: f64) -> Self {
        let f = 10f64.powf(nf_db / 10.0);
        let n0 = BOLTZMANN_J_PER_K * (antenna_temp_k + T0_K * (f - 1.0));
        Self {
            n0_dbw_per_hz: 10.0 * n0.log10(),
            enabled: true,
            normalise: true,
        }
    }
    /// `N0` in W/Hz.
    pub fn n0_w_per_hz(&self) -> f64 {
        10f64.powf(self.n0_dbw_per_hz / 10.0)
    }
}

impl Default for NoiseConfig {
    /// A 2 dB noise figure behind a 290 K antenna: `N0 ≈ −202 dBW/Hz`.
    fn default() -> Self {
        Self::from_noise_figure(2.0, T0_K)
    }
}

/// Everything about a scene except its satellites and channel.
#[derive(Clone, Debug, PartialEq)]
pub struct SceneConfig {
    /// How the output is sampled; `center_hz` and `if_hz` place each carrier in baseband.
    pub spec: SampleSpec,
    /// Scene length (s of receiver time).
    pub duration_s: f64,
    /// GPS time of week the receiver clock reads at the first sample (s). Sets the code
    /// and data epochs and the broadcast-ephemeris evaluation time. A scene should not
    /// cross the end of the week: the LNAV time of week wraps, but the ephemeris time does
    /// not.
    pub start_tow_s: f64,
    /// Geometry and channel update rate (Hz).
    pub geometry_rate_hz: f64,
    /// Truth epoch interval (s): epochs at `0, Δ, 2Δ, …` strictly before the scene end.
    pub truth_interval_s: f64,
    /// Receiver trajectory.
    pub receiver: Trajectory,
    /// Receiver clock.
    pub clock: ReceiverClock,
    /// Thermal noise.
    pub noise: NoiseConfig,
    /// Seed of the noise.
    pub seed: u64,
    /// Satellites below this elevation (degrees) are not generated.
    pub elevation_mask_deg: f64,
    /// The C/N0 a satellite gets when it states none.
    pub cn0_model: ElevationCn0,
    /// Samples generated per chunk by [`Scene::generate`] (bounds memory).
    pub chunk_samples: usize,
    /// Synthesis threads per chunk (1 for none).
    pub threads: usize,
}

impl SceneConfig {
    /// A scene of `duration_s` sampled as `spec`, with defaults: start of week, 1 kHz
    /// geometry, 1 ms truth, a static receiver on the equator at 0° longitude (set
    /// `receiver` for broadcast satellites), a perfect clock, the default noise, seed 1,
    /// 5° mask, 2^16-sample chunks, one thread.
    pub fn new(spec: SampleSpec, duration_s: f64) -> Self {
        Self {
            spec,
            duration_s,
            start_tow_s: 0.0,
            geometry_rate_hz: 1000.0,
            truth_interval_s: 1e-3,
            receiver: Trajectory::Static([6_378_137.0, 0.0, 0.0]),
            clock: ReceiverClock::default(),
            noise: NoiseConfig::default(),
            seed: 1,
            elevation_mask_deg: 5.0,
            cn0_model: ElevationCn0::default(),
            chunk_samples: 1 << 16,
            threads: 1,
        }
    }

    /// Total samples in the scene.
    pub fn total_samples(&self) -> u64 {
        (self.duration_s * self.spec.fs_hz).round().max(0.0) as u64
    }

    fn validate(&self) -> Result<(), IqError> {
        let bad = |m: &str| Err(IqError::Format(m.to_string()));
        if !(self.spec.fs_hz.is_finite() && self.spec.fs_hz > 0.0) {
            return bad("sample rate must be positive");
        }
        if !(self.duration_s.is_finite() && self.duration_s >= 0.0) {
            return bad("duration must be non-negative");
        }
        if !(self.geometry_rate_hz.is_finite() && self.geometry_rate_hz > 0.0) {
            return bad("geometry rate must be positive");
        }
        if !(self.truth_interval_s.is_finite() && self.truth_interval_s > 0.0) {
            return bad("truth interval must be positive");
        }
        if self.chunk_samples == 0 || self.threads == 0 {
            return bad("chunk size and thread count must be at least 1");
        }
        if !self.start_tow_s.is_finite() || !self.noise.n0_dbw_per_hz.is_finite() {
            return bad("start time and noise density must be finite");
        }
        if !self.clock.drift_s_per_s.is_finite() || self.clock.drift_s_per_s.abs() >= 1e-3 {
            return bad("receiver clock drift must be below 1e-3 s/s");
        }
        self.receiver.validate().map_err(IqError::Format)
    }
}

/// One satellite of a scene.
pub struct SceneSatellite {
    /// Identifier reported in the truth and to the channel hook (the PRN for GPS).
    pub id: u32,
    /// Ranging code and carrier.
    pub code: SceneCode,
    /// Where the geometry comes from.
    pub geometry: SatGeometry,
    /// Stated C/N0 (dB-Hz); `None` uses the scene's elevation-based default.
    pub cn0_dbhz: Option<f64>,
    /// Navigation data.
    pub nav: NavData,
}

impl SceneSatellite {
    /// A GPS L1 C/A satellite on a stated range profile.
    pub fn gps_l1ca_profile(
        prn: u8,
        profile: RangeProfile,
        cn0_dbhz: Option<f64>,
        nav: NavData,
    ) -> Result<Self, IqError> {
        let code = GpsL1Ca::new(prn)
            .ok_or_else(|| IqError::Format(format!("PRN {prn} is not a GPS C/A PRN")))?;
        Ok(Self {
            id: prn as u32,
            code: Box::new(code),
            geometry: SatGeometry::Profile(profile),
            cn0_dbhz,
            nav,
        })
    }

    /// A GPS L1 C/A satellite from a broadcast ephemeris, sending LNAV built from the same
    /// ephemeris with the given operator conventions.
    pub fn gps_l1ca_broadcast(
        eph: &RinexEphemeris,
        cn0_dbhz: Option<f64>,
        conv: LnavConventions,
    ) -> Result<Self, IqError> {
        if eph.system != 'G' {
            return Err(IqError::Format(format!(
                "ephemeris system {} is not GPS",
                eph.system
            )));
        }
        let code = GpsL1Ca::new(eph.prn)
            .ok_or_else(|| IqError::Format(format!("PRN {} is not a GPS C/A PRN", eph.prn)))?;
        Ok(Self {
            id: eph.prn as u32,
            code: Box::new(code),
            geometry: SatGeometry::Broadcast(Box::new(*eph)),
            cn0_dbhz,
            nav: NavData::Lnav {
                eph: Box::new(lnav_from_rinex(eph)),
                conv,
            },
        })
    }
}

/// What a channel hook is told about a satellite at a knot.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SatView {
    /// Pseudorange (m).
    pub pseudorange_m: f64,
    /// Pseudorange rate (m/s).
    pub pseudorange_rate_mps: f64,
    /// Elevation (degrees).
    pub elevation_deg: f64,
    /// Azimuth (degrees).
    pub azimuth_deg: f64,
    /// Receiver position (ECEF m) at the knot.
    pub receiver_ecef: Vec3,
}

/// A propagation channel the scene applies per satellite per knot.
///
/// Each [`PathState`] of the returned snapshot is generated as a separate copy of the
/// signal: `group_delay_s` is added to the transmit-time delay of the code and data (an
/// excess over the geometric pseudorange), `carrier_phase_rad` is added to the geometric
/// carrier phase (so a non-dispersive delay `τ` should come with `−2π f τ`, and the
/// ionosphere with the opposite sign), `amplitude` scales the direct-path amplitude and
/// `extra_doppler_hz` advances the path's phase between knots. An empty snapshot means no
/// signal. Called exactly once per satellite per knot, in time order (all satellites at
/// one knot, in scene order, before the next knot).
pub trait SceneChannel: Send {
    /// The paths of satellite `sat_id` at receiver time `t_s`.
    fn snapshot(&mut self, sat_id: u32, t_s: f64, view: &SatView) -> ChannelSnapshot;
}

impl<F> SceneChannel for F
where
    F: FnMut(u32, f64) -> ChannelSnapshot + Send,
{
    fn snapshot(&mut self, sat_id: u32, t_s: f64, _view: &SatView) -> ChannelSnapshot {
        self(sat_id, t_s)
    }
}

/// The direct path alone: no extra delay, phase or Doppler, unit amplitude.
pub fn direct_path() -> PathState {
    PathState {
        group_delay_s: 0.0,
        carrier_phase_rad: 0.0,
        amplitude: 1.0,
        extra_doppler_hz: 0.0,
    }
}

/// A scene: configuration, satellites and an optional channel.
pub struct Scene {
    config: SceneConfig,
    sats: Vec<SceneSatellite>,
    channel: Option<Box<dyn SceneChannel>>,
}

/// Counts from a finished generation.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct SceneSummary {
    /// Samples written.
    pub samples: u64,
    /// Truth records written.
    pub truth_records: u64,
}

impl Scene {
    /// A scene with no satellites; `Err` if the configuration is invalid.
    pub fn new(config: SceneConfig) -> Result<Self, IqError> {
        config.validate()?;
        Ok(Self {
            config,
            sats: Vec::new(),
            channel: None,
        })
    }
    /// Add a satellite.
    pub fn add_satellite(&mut self, sat: SceneSatellite) {
        self.sats.push(sat);
    }
    /// Apply `channel` to every satellite (replacing the default direct path).
    pub fn set_channel(&mut self, channel: Box<dyn SceneChannel>) {
        self.channel = Some(channel);
    }
    /// The configuration.
    pub fn config(&self) -> &SceneConfig {
        &self.config
    }
    /// The satellites.
    pub fn satellites(&self) -> &[SceneSatellite] {
        &self.sats
    }
    /// A streaming reader over the scene's samples.
    pub fn into_stream(self) -> SceneStream {
        SceneStream::new(self)
    }
    /// Generate the whole scene into `sink` in chunks of `chunk_samples`, writing truth to
    /// `truth`. Memory is bounded by the chunk size, independent of the duration.
    pub fn generate(
        self,
        sink: &mut dyn IqSink,
        truth: &mut dyn TruthSink,
    ) -> Result<SceneSummary, IqError> {
        let chunk = self.config.chunk_samples;
        let mut stream = self.into_stream();
        let mut buf = vec![crate::iq::Cf64::default(); chunk];
        let mut summary = SceneSummary::default();
        loop {
            let n = stream.read(&mut buf)?;
            for r in stream.truth.drain(..) {
                truth.record(&r)?;
                summary.truth_records += 1;
            }
            if n == 0 {
                break;
            }
            sink.write(&buf[..n])?;
            summary.samples += n as u64;
        }
        sink.finish()?;
        truth.finish()?;
        Ok(summary)
    }
}

/// The geometry and channel state of one satellite at one knot.
#[derive(Clone, Debug)]
struct Knot {
    p: f64,
    pdot: f64,
    visible: bool,
    amp: f64,
    cn0: f64,
    el: f64,
    az: f64,
    paths: Vec<PathState>,
}

/// Knots `first ..` of one satellite.
#[derive(Clone, Debug, Default)]
struct KnotWindow {
    first: i64,
    knots: VecDeque<Knot>,
}

impl KnotWindow {
    #[inline]
    fn get(&self, j: i64) -> &Knot {
        &self.knots[(j - self.first) as usize]
    }
}

/// Constants of one satellite used per sample.
#[derive(Clone, Copy, Debug)]
struct SatConst {
    f_carrier: f64,
    /// Baseband offset of the carrier: `f − f_center + f_IF` (Hz).
    f_offset: f64,
    chip_rate: f64,
    len: f64,
    /// Code phase (chips) at transmit time `t_tx = 0` (from the start time of week).
    code_offset: f64,
    /// Time from bit 0's start to `t_tx = 0` (s).
    bit_offset: f64,
    /// Duration of one data bit or symbol (s), from the code's [`DataModulation`].
    bit_s: f64,
    /// Each bit is split into two half-bit symbols of opposite sign (GLONASS meander).
    meander: bool,
}

/// A streaming source over a scene's samples ([`IqSource`]); the truth records of each
/// read accumulate until taken with [`SceneStream::take_truth`].
pub struct SceneStream {
    scene: Scene,
    total: u64,
    next_k: u64,
    next_truth: u64,
    windows: Vec<KnotWindow>,
    consts: Vec<SatConst>,
    nav: Vec<NavState>,
    /// Per satellite, why its navigation data does not fit its signal (refused on read).
    nav_errors: Vec<Option<String>>,
    gain: f64,
    noise_sigma: f64,
    truth: Vec<TruthRecord>,
}

impl SceneStream {
    fn new(scene: Scene) -> Self {
        let cfg = &scene.config;
        let fs = cfg.spec.fs_hz;
        let n0 = cfg.noise.n0_w_per_hz();
        let gain = if cfg.noise.normalise {
            1.0 / (n0 * fs).sqrt()
        } else {
            1.0
        };
        let frame0 = (cfg.start_tow_s / 30.0).floor() * 30.0;
        let consts = scene
            .sats
            .iter()
            .map(|s| {
                let (bit_s, meander) = match s.code.data_modulation() {
                    DataModulation::Symbols { symbol_s } => (symbol_s, false),
                    // The meander is part of the data: a data-free scene has neither.
                    DataModulation::Meander { bit_s } => (bit_s, s.nav != NavData::None),
                    DataModulation::Lnav | DataModulation::Pilot | DataModulation::NotModelled => {
                        (LNAV_BIT_S, false)
                    }
                };
                let chip_rate = s.code.chip_rate_hz();
                let len = s.code.len_chips() as f64;
                SatConst {
                    f_carrier: s.code.carrier_hz(),
                    f_offset: s.code.carrier_hz() - cfg.spec.center_hz + cfg.spec.if_hz,
                    chip_rate,
                    len,
                    code_offset: (cfg.start_tow_s * chip_rate).rem_euclid(len),
                    bit_offset: cfg.start_tow_s - frame0,
                    bit_s,
                    meander,
                }
            })
            .collect();
        let nav = scene
            .sats
            .iter()
            .map(|s| NavState::new(s.nav.clone(), frame0))
            .collect();
        // Data a satellite's signal cannot carry is refused on the first read.
        let nav_errors = scene
            .sats
            .iter()
            .map(|s| {
                s.nav
                    .check_modulation(s.code.data_modulation())
                    .err()
                    .map(|e| format!("satellite {} ({}) {e}", s.id, s.code.name()))
            })
            .collect();
        Self {
            total: cfg.total_samples(),
            windows: vec![KnotWindow::default(); scene.sats.len()],
            consts,
            nav,
            nav_errors,
            gain,
            noise_sigma: (n0 * fs / 2.0).sqrt() * gain,
            truth: Vec::new(),
            next_k: 0,
            next_truth: 0,
            scene,
        }
    }

    /// Samples not yet read.
    pub fn remaining(&self) -> u64 {
        self.total - self.next_k
    }

    /// Take the truth records produced so far.
    pub fn take_truth(&mut self) -> Vec<TruthRecord> {
        std::mem::take(&mut self.truth)
    }

    #[inline]
    fn knot_index(&self, t: f64) -> i64 {
        (t * self.scene.config.geometry_rate_hz).floor() as i64
    }

    fn compute_knot(&mut self, i: usize, j: i64) -> Knot {
        let cfg = &self.scene.config;
        let sat = &self.scene.sats[i];
        let t = j as f64 / cfg.geometry_rate_hz;
        let g = sat
            .geometry
            .point(t, cfg.start_tow_s, &cfg.receiver, &cfg.clock);
        let pdot = sat
            .geometry
            .pseudorange_rate(t, cfg.start_tow_s, &cfg.receiver, &cfg.clock);
        let visible = g.elevation_deg >= cfg.elevation_mask_deg;
        let cn0 = sat
            .cn0_dbhz
            .unwrap_or_else(|| cfg.cn0_model.cn0_dbhz(g.elevation_deg));
        let amp = (10f64.powf(cn0 / 10.0) * cfg.noise.n0_w_per_hz()).sqrt() * self.gain;
        let view = SatView {
            pseudorange_m: g.pseudorange_m,
            pseudorange_rate_mps: pdot,
            elevation_deg: g.elevation_deg,
            azimuth_deg: g.azimuth_deg,
            receiver_ecef: cfg.receiver.position(cfg.clock.true_time(t)),
        };
        let id = sat.id;
        let paths = match self.scene.channel.as_mut() {
            Some(ch) => ch.snapshot(id, t, &view).paths,
            None => vec![direct_path()],
        };
        Knot {
            p: g.pseudorange_m,
            pdot,
            visible,
            amp,
            cn0,
            el: g.elevation_deg,
            az: g.azimuth_deg,
            paths,
        }
    }

    /// Make knots `lo ..= hi` of every satellite available, dropping older ones. Knots are
    /// computed time-major (every satellite at knot `j` before any at `j + 1`), so a
    /// stateful channel sees the same call sequence however the scene is chunked.
    fn ensure_knots(&mut self, lo: i64, hi: i64) {
        for w in &mut self.windows {
            while w.first < lo && !w.knots.is_empty() {
                w.knots.pop_front();
                w.first += 1;
            }
            if w.knots.is_empty() {
                w.first = lo;
            }
        }
        let Some(w0) = self.windows.first() else {
            return;
        };
        let next = w0.first + w0.knots.len() as i64;
        for j in next..=hi {
            for i in 0..self.windows.len() {
                let k = self.compute_knot(i, j);
                self.windows[i].knots.push_back(k);
            }
        }
    }

    /// Bit windows covering every transmit time a sample in knots `lo ..= hi` can use.
    fn bit_windows(&mut self, lo: i64, hi: i64) -> Result<Vec<BitWindow>, IqError> {
        let rate = self.scene.config.geometry_rate_hz;
        let mut out = Vec::with_capacity(self.windows.len());
        for i in 0..self.windows.len() {
            let (mut tmin, mut tmax) = (f64::INFINITY, f64::NEG_INFINITY);
            for j in lo..=hi {
                let k = self.windows[i].get(j);
                let base = j as f64 / rate - k.p / C_M_PER_S;
                for p in &k.paths {
                    tmin = tmin.min(base - p.group_delay_s);
                    tmax = tmax.max(base - p.group_delay_s);
                }
                tmin = tmin.min(base);
                tmax = tmax.max(base);
            }
            if let Some(e) = &self.nav_errors[i] {
                return Err(IqError::Format(e.clone()));
            }
            let (off, bit_s) = (self.consts[i].bit_offset, self.consts[i].bit_s);
            let first = ((off + tmin) / bit_s).floor() as i64 - 1;
            let last = ((off + tmax) / bit_s).floor() as i64 + 1;
            out.push(self.nav[i].window(first, last).map_err(|e| {
                IqError::Format(format!("satellite {}: {e}", self.scene.sats[i].id))
            })?);
        }
        Ok(out)
    }

    fn emit_truth(&mut self, t_end: f64) {
        let cfg = &self.scene.config;
        let rate = cfg.geometry_rate_hz;
        let dur = self.total as f64 / cfg.spec.fs_hz;
        loop {
            let t = self.next_truth as f64 * cfg.truth_interval_s;
            if t >= t_end || t >= dur {
                break;
            }
            let j = (t * rate).floor() as i64;
            let s = t * rate - j as f64;
            for (i, sat) in self.scene.sats.iter().enumerate() {
                let w = &self.windows[i];
                let (k0, k1) = (w.get(j), w.get(j + 1));
                let (p, pdot) = hermite(k0, k1, s, 1.0 / rate);
                let c = &self.consts[i];
                let code = (c.code_offset + c.chip_rate * (t - p / C_M_PER_S)).rem_euclid(c.len);
                self.truth.push(TruthRecord {
                    t_s: t,
                    sat_id: sat.id,
                    visible: k0.visible,
                    elevation_deg: k0.el,
                    azimuth_deg: k0.az,
                    cn0_dbhz: k0.cn0,
                    pseudorange_m: p,
                    code_phase_chips: if code >= c.len { 0.0 } else { code },
                    doppler_hz: -c.f_carrier * pdot / C_M_PER_S,
                    carrier_phase_cycles: -c.f_carrier * p / C_M_PER_S,
                });
            }
            self.next_truth += 1;
        }
    }
}

impl IqSource for SceneStream {
    fn spec(&self) -> SampleSpec {
        self.scene.config.spec
    }

    fn read(&mut self, buf: &mut [crate::iq::Cf64]) -> Result<usize, IqError> {
        let n = (buf.len() as u64).min(self.remaining()) as usize;
        let fs = self.scene.config.spec.fs_hz;
        if n == 0 {
            return Ok(0);
        }
        let k0 = self.next_k;
        let k1 = k0 + n as u64;
        let t0 = k0 as f64 / fs;
        let t1 = k1 as f64 / fs;
        let lo = self.knot_index(t0);
        let hi = self.knot_index(t1) + 1;
        self.ensure_knots(lo, hi);
        let bits = self.bit_windows(lo, hi)?;
        let ctx = Synth {
            sats: &self.scene.sats,
            windows: &self.windows,
            consts: &self.consts,
            bits: &bits,
            fs,
            rate: self.scene.config.geometry_rate_hz,
            noise: self.scene.config.noise.enabled,
            sigma: self.noise_sigma,
            seed: self.scene.config.seed,
        };
        let out = &mut buf[..n];
        let threads = self.scene.config.threads.min(n.div_ceil(4096)).max(1);
        if threads == 1 {
            ctx.fill(k0, out);
        } else {
            let per = n.div_ceil(threads);
            std::thread::scope(|s| {
                for (c, part) in out.chunks_mut(per).enumerate() {
                    let ctx = &ctx;
                    s.spawn(move || ctx.fill(k0 + (c * per) as u64, part));
                }
            });
        }
        self.next_k = k1;
        self.emit_truth(t1);
        Ok(n)
    }
}

/// Cubic Hermite interpolation of the pseudorange between two knots `h` apart at fraction
/// `s`: `(P, dP/dt)`.
#[inline]
fn hermite(k0: &Knot, k1: &Knot, s: f64, h: f64) -> (f64, f64) {
    let (s2, s3) = (s * s, s * s * s);
    let dp = k1.p - k0.p;
    let p = k0.p
        + dp * (3.0 * s2 - 2.0 * s3)
        + h * (k0.pdot * (s - 2.0 * s2 + s3) + k1.pdot * (s3 - s2));
    let pdot = dp * (6.0 * s - 6.0 * s2) / h
        + k0.pdot * (1.0 - 4.0 * s + 3.0 * s2)
        + k1.pdot * (3.0 * s2 - 2.0 * s);
    (p, pdot)
}

/// Read-only state shared by the synthesis threads of one chunk.
struct Synth<'a> {
    sats: &'a [SceneSatellite],
    windows: &'a [KnotWindow],
    consts: &'a [SatConst],
    bits: &'a [BitWindow],
    fs: f64,
    rate: f64,
    noise: bool,
    sigma: f64,
    seed: u64,
}

impl Synth<'_> {
    /// Fill `out` with samples `k0 ..`.
    fn fill(&self, k0: u64, out: &mut [crate::iq::Cf64]) {
        let mut rng = ChaCha8Rng::seed_from_u64(self.seed);
        if self.noise {
            rng.set_word_pos(k0 as u128 * 4);
        }
        let h = 1.0 / self.rate;
        for (o, slot) in out.iter_mut().enumerate() {
            let t = (k0 + o as u64) as f64 / self.fs;
            let j = (t * self.rate).floor() as i64;
            let s = t * self.rate - j as f64;
            let (mut re, mut im) = (0.0, 0.0);
            for (i, sat) in self.sats.iter().enumerate() {
                let w = &self.windows[i];
                let k = w.get(j);
                if !k.visible {
                    continue;
                }
                let c = &self.consts[i];
                let (p, _) = hermite(k, w.get(j + 1), s, h);
                let geo_cycles = c.f_offset * t - c.f_carrier * p / C_M_PER_S;
                let t_geo = t - p / C_M_PER_S;
                for path in &k.paths {
                    let a = k.amp * path.amplitude;
                    if a == 0.0 {
                        continue;
                    }
                    let t_tx = t_geo - path.group_delay_s;
                    let chip = sat.code.value_at(c.code_offset + c.chip_rate * t_tx);
                    let u = (c.bit_offset + t_tx) / c.bit_s;
                    let bit = self.bits[i].sign(u.floor() as i64)
                        * if c.meander && u - u.floor() >= 0.5 {
                            -1.0
                        } else {
                            1.0
                        };
                    let cyc = geo_cycles
                        + path.carrier_phase_rad / TAU
                        + path.extra_doppler_hz * (t - j as f64 * h);
                    let (sn, cs) = (TAU * (cyc - cyc.floor())).sin_cos();
                    let v = a * chip * bit;
                    re += v * cs;
                    im += v * sn;
                }
            }
            if self.noise {
                let (nr, ni) = box_muller(rng.next_u64(), rng.next_u64());
                re += self.sigma * nr;
                im += self.sigma * ni;
            }
            *slot = crate::iq::Cf64::new(re, im);
        }
    }
}

/// Two independent standard normals from two uniform 64-bit words (Box-Muller).
#[inline]
fn box_muller(a: u64, b: u64) -> (f64, f64) {
    const SCALE: f64 = 1.0 / (1u64 << 53) as f64;
    let u1 = ((a >> 11) as f64 + 1.0) * SCALE; // (0, 1]
    let u2 = (b >> 11) as f64 * SCALE; // [0, 1)
    let r = (-2.0 * u1.ln()).sqrt();
    let (s, c) = (TAU * u2).sin_cos();
    (r * c, r * s)
}
