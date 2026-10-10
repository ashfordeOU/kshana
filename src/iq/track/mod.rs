// SPDX-License-Identifier: AGPL-3.0-only
//! **A multi-channel software tracking bank for any [`SpreadingCode`](crate::iq::SpreadingCode)
//! on any [`IqSource`](crate::iq::IqSource).**
//!
//! Each channel runs early, prompt and late correlators against a replica generated
//! sample by sample from [`SpreadingCode::value_at`](crate::iq::SpreadingCode::value_at), a
//! carrier loop (PLL of order 1, 2 or 3, FLL of order 1 or 2, or an FLL-assisted PLL) and
//! a code loop (DLL of order 1 or 2, optionally carrier-aided), with loop filters designed
//! from a noise bandwidth and the integration time ([`filter`]), the discriminators of
//! [`discrim`], lock detectors, two C/N0 estimators and histogram bit synchronisation
//! ([`cn0`]).
//!
//! * **NCOs.** The code NCO carries the replica's code phase as a real number of chips and
//!   advances it by `code_rate/fs` every sample; an integration (one code period) starts
//!   at the first sample whose phase has wrapped, and the fractional phase left over is
//!   carried into the next period, so the replica is sampled at its exact phase rather than
//!   a phase rounded to the epoch boundary (no zero-order-hold staircase). The carrier NCO
//!   likewise carries its phase in cycles; within a period the local oscillator is rotated
//!   by a fixed phasor and re-anchored to the exact phase at every period start.
//! * **Integration.** The loops close every `coherent_periods` code periods. On a
//!   data-modulated signal the channel integrates one period at a time until the bit edge
//!   is found, then aligns its integrations to the bit edges.
//! * **Outputs** per loop update ([`EpochOutput`]): E/P/L, the three discriminator outputs,
//!   the loop states (carrier Doppler, carrier phase, code rate, code phase and the time the
//!   replica's code period started), the phase lock indicator and lock flags, both C/N0
//!   estimates, the bit edge and decoded bits.
//! * **Replay.** [`replay`] runs one [`IqSource`](crate::iq::IqSource) once through a bank holding every
//!   (channel, loop configuration) pair and returns the results per configuration, so many
//!   loop designs can be compared on one recording.
//! * **Streaming, lock states and designs.** [`TrackSession`] runs the same channels in
//!   bounded memory, handing every update to an [`sink::EpochSink`] as it happens
//!   (CSV/JSON-Lines/binary `kshana.track-epoch/1` writers and a reader, running
//!   [`sink::Summary`] metrics), under the [`lock`] state machine: pull-in, locked, lost,
//!   re-acquisition, with a ±1/(2T) false-lock check. [`design`] reads loop designs from
//!   `kshana.loop-design/1` TOML (`docs/design/LOOP-DESIGN-TOML.md`).
//!
//! Honest label: MODELLED. The loop designs, jitter, steady-state error and C/N0
//! estimators are checked against closed forms (Kaplan & Hegarty; Van Dierendonck;
//! Pauluzzi & Beaulieu) by seeded simulation in `tests/iq_receiver.rs`; no comparison with
//! an external receiver's output is claimed here. No front-end filter or quantisation is
//! modelled (that is `iq::frontend`), the discriminator scalings assume the ideal BPSK
//! triangle, and there is no vector tracking, multipath-mitigating correlator or
//! navigation-message decoding beyond bit signs.

pub mod cn0;
pub mod design;
pub mod discrim;
pub mod filter;

mod bank;
mod channel;
pub mod lock;
pub mod sink;

pub use bank::{replay, ReplayResult, TrackingBank};
pub use channel::{Channel, ChannelInit, EpochOutput, MAX_EXTRA_TAPS, MAX_TAP_OFFSET_CHIPS};
pub use lock::{LockEvent, LockState, SessionChannel, TrackSession};

use self::cn0::BitSyncConfig;
use self::discrim::{DllDiscriminator, FllDiscriminator, PllDiscriminator};
use self::filter::LoopFilter;
use super::Cf64;
use std::f64::consts::TAU;

/// Samples per chip, when a stream sampled at `fs_hz` is **commensurate** with a code of
/// `chip_rate_hz`: the ratio lies within 1e-6 (relative) of a multiple of 1/2. The samples then
/// fall on the same few chip phases in every chip, the early and late correlators see a
/// staircase instead of the correlation triangle, and the code loop's discriminator has flat
/// steps (a dead zone). At exactly 2 samples per chip with 0.5-chip spacing the S-curve is a
/// single step and the DLL dithers bang-bang (≈ 0.09 chip, ≈ 26 m, RMS code error on GPS L1
/// C/A at 45 dB-Hz against ≈ 0.004 chip at an incommensurate rate); 2.5, 3 and 5 samples per
/// chip are milder but biased. Evidence: `docs/design/evidence/dll-jitter/`. Real front ends
/// avoid such rates; a recording made at one should not be used to judge code-loop
/// performance. Returns `None` for an incommensurate rate.
pub fn commensurate_samples_per_chip(fs_hz: f64, chip_rate_hz: f64) -> Option<f64> {
    if !(fs_hz > 0.0 && chip_rate_hz > 0.0) {
        return None;
    }
    let r = fs_hz / chip_rate_hz;
    let nearest = (2.0 * r).round() / 2.0;
    (nearest > 0.0 && (r - nearest).abs() <= 1e-6 * r).then_some(r)
}

/// When the FLL path of an FLL-assisted PLL feeds the loop.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum FllAssist {
    /// Only during pull-in: the FLL pulls the carrier in, hands over to the PLL once the
    /// channel is phase-locked, and comes back when phase lock is lost (with hysteresis,
    /// see [`FllGate`]). Left on, a 10 Hz FLL path injects enough frequency noise to break
    /// phase lock below about 38 dB-Hz (`docs/design/evidence/carrier-lock/`).
    PullIn(FllGate),
    /// On at every update.
    Always,
}

impl Default for FllAssist {
    fn default() -> Self {
        FllAssist::PullIn(FllGate::default())
    }
}

/// The hand-over between the FLL and the PLL of [`FllAssist::PullIn`]. The FLL path is
/// switched off once the smoothed PLI has stayed at or above `off_pli` for `dwell_s`, and
/// back on once it has stayed below `on_pli` for `dwell_s`. `on_pli < off_pli` and the
/// dwell keep the gate from chattering around one threshold.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct FllGate {
    /// Smoothed PLI at or above which the FLL hands over to the PLL.
    pub off_pli: f64,
    /// Smoothed PLI below which the FLL comes back.
    pub on_pli: f64,
    /// How long (s) either condition must hold.
    pub dwell_s: f64,
}

impl Default for FllGate {
    fn default() -> Self {
        Self {
            off_pli: 0.8,
            on_pli: 0.6,
            dwell_s: 0.1,
        }
    }
}

/// The carrier loop of a channel.
#[derive(Clone, Copy, Debug, PartialEq)]
pub enum CarrierLoop {
    /// Phase-locked loop of `order` 1, 2 or 3 with noise bandwidth `bn_hz`.
    Pll {
        /// Loop order (1, 2 or 3).
        order: u8,
        /// Noise bandwidth (Hz).
        bn_hz: f64,
    },
    /// Frequency-locked loop of `order` 1 or 2 with noise bandwidth `bn_hz`.
    Fll {
        /// Loop order (1 or 2).
        order: u8,
        /// Noise bandwidth (Hz).
        bn_hz: f64,
    },
    /// FLL-assisted PLL (Ward): a PLL with an FLL feeding its integrators. Ward's pairings
    /// are a second-order PLL with a first-order FLL and a third-order PLL with a
    /// second-order FLL.
    FllAssistedPll {
        /// PLL order (1, 2 or 3).
        pll_order: u8,
        /// PLL noise bandwidth (Hz).
        pll_bn_hz: f64,
        /// FLL order (1 or 2).
        fll_order: u8,
        /// FLL noise bandwidth (Hz).
        fll_bn_hz: f64,
    },
}

impl CarrierLoop {
    /// The loop filter this design calls for.
    pub fn filter(&self) -> Result<LoopFilter, String> {
        match *self {
            CarrierLoop::Pll { order, bn_hz } => LoopFilter::pll(order, bn_hz),
            CarrierLoop::Fll { order, bn_hz } => LoopFilter::fll(order, bn_hz),
            CarrierLoop::FllAssistedPll {
                pll_order,
                pll_bn_hz,
                fll_order,
                fll_bn_hz,
            } => LoopFilter::new(Some((pll_order, pll_bn_hz)), Some((fll_order, fll_bn_hz))),
        }
    }

    /// Whether the design has a phase path.
    pub fn has_pll(&self) -> bool {
        !matches!(self, CarrierLoop::Fll { .. })
    }

    /// Whether the design has a frequency path.
    pub fn has_fll(&self) -> bool {
        !matches!(self, CarrierLoop::Pll { .. })
    }
}

/// The loop design of one channel. One recording can be replayed through many of these.
#[derive(Clone, Debug, PartialEq)]
pub struct LoopConfig {
    /// A label carried into the results.
    pub label: String,
    /// Code periods per loop update once bit-synchronised (1 before, on a data signal).
    /// On a data signal it must divide the bit length.
    pub coherent_periods: usize,
    /// Early-late correlator spacing `d` (chips); the early and late replicas sit `d/2`
    /// either side of the prompt.
    pub spacing_chips: f64,
    /// Extra correlator taps: offsets (chips) relative to the prompt, a positive offset
    /// being early. Each is correlated alongside E/P/L and returned in
    /// `EpochOutput::extra`; the loops never use them.
    /// Empty by default.
    pub extra_taps_chips: Vec<f64>,
    /// Code discriminator.
    pub dll: DllDiscriminator,
    /// Code loop order (1 or 2).
    pub dll_order: u8,
    /// Code loop noise bandwidth (Hz).
    pub dll_bn_hz: f64,
    /// Whether the code rate follows the carrier loop's Doppler, scaled by
    /// `chip_rate/carrier_hz` (carrier aiding). Without aiding the code rate keeps the
    /// initial Doppler's code rate plus the code loop's correction.
    pub carrier_aiding: bool,
    /// Carrier loop design.
    pub carrier: CarrierLoop,
    /// Carrier-phase discriminator (a Costas form for a data-modulated signal).
    pub pll_discriminator: PllDiscriminator,
    /// Carrier-frequency discriminator.
    pub fll_discriminator: FllDiscriminator,
    /// When the FLL path of an FLL-assisted PLL is used (ignored by the other kinds).
    pub fll_assist: FllAssist,
    /// Smoothed phase lock indicator above which phase lock is declared.
    pub pli_threshold: f64,
    /// NWPR C/N0 (dB-Hz) at or above which code lock is declared.
    pub code_lock_cn0_dbhz: f64,
    /// Number of windows `M` each C/N0 estimate averages (sliding).
    pub cn0_windows: usize,
    /// Prompts per window on a data-free signal (a data signal uses the bit length).
    pub cn0_window_periods: usize,
    /// Bit synchroniser settings.
    pub bit_sync: BitSyncConfig,
}

impl Default for LoopConfig {
    /// A GPS-L1-C/A-like design: 1-period integration, 0.5-chip spacing, carrier-aided
    /// first-order 2 Hz early-minus-late-power DLL, second-order 15 Hz Costas PLL assisted
    /// by a first-order 10 Hz FLL during pull-in, PLI threshold 0.8, code lock at 26 dB-Hz, C/N0 over 50
    /// windows.
    fn default() -> Self {
        Self {
            label: "default".into(),
            coherent_periods: 1,
            spacing_chips: 0.5,
            extra_taps_chips: Vec::new(),
            dll: DllDiscriminator::EarlyMinusLatePower,
            dll_order: 1,
            dll_bn_hz: 2.0,
            carrier_aiding: true,
            carrier: CarrierLoop::FllAssistedPll {
                pll_order: 2,
                pll_bn_hz: 15.0,
                fll_order: 1,
                fll_bn_hz: 10.0,
            },
            pll_discriminator: PllDiscriminator::CostasAtan,
            fll_discriminator: FllDiscriminator::Atan2,
            fll_assist: FllAssist::default(),
            pli_threshold: 0.8,
            code_lock_cn0_dbhz: 26.0,
            cn0_windows: 50,
            cn0_window_periods: 20,
            bit_sync: BitSyncConfig::default(),
        }
    }
}

/// The three discriminator outputs of one loop update.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct Discriminators {
    /// Carrier-phase error (rad); 0 for an FLL-only loop.
    pub pll_rad: f64,
    /// Carrier-frequency error (Hz); 0 on the first update.
    pub fll_hz: f64,
    /// Code-phase error (chips).
    pub dll_chips: f64,
}

/// The loop filters and discriminators of one channel, apart from its correlators: give it
/// E/P/L and the integration time and it returns the next NCO settings. The channel uses
/// it; it is public so loop designs can be studied on synthetic correlator outputs.
#[derive(Clone, Debug, PartialEq)]
pub struct LoopCore {
    cfg: LoopConfig,
    carrier: LoopFilter,
    code: LoopFilter,
    chip_rate_hz: f64,
    carrier_hz: f64,
    init_doppler_hz: f64,
    doppler_hz: f64,
    code_rate_hz: f64,
    prev_prompt: Option<Cf64>,
    fll_enabled: bool,
}

impl LoopCore {
    /// A loop core for a code of `chip_rate_hz` on a carrier of `carrier_hz`, starting at
    /// Doppler `init_doppler_hz`.
    pub fn new(
        cfg: &LoopConfig,
        chip_rate_hz: f64,
        carrier_hz: f64,
        init_doppler_hz: f64,
    ) -> Result<Self, String> {
        if !(cfg.spacing_chips > 0.0 && cfg.spacing_chips <= 2.0) {
            return Err(format!(
                "early-late spacing must lie in (0, 2] chips (got {})",
                cfg.spacing_chips
            ));
        }
        if cfg.dll_order == 0 || cfg.dll_order > 2 {
            return Err(format!("DLL order must be 1 or 2 (got {})", cfg.dll_order));
        }
        if !(chip_rate_hz > 0.0 && carrier_hz > 0.0) {
            return Err("chip rate and carrier frequency must be positive".into());
        }
        let mut s = Self {
            cfg: cfg.clone(),
            carrier: cfg.carrier.filter()?,
            code: LoopFilter::pll(cfg.dll_order, cfg.dll_bn_hz)?,
            chip_rate_hz,
            carrier_hz,
            init_doppler_hz,
            doppler_hz: init_doppler_hz,
            code_rate_hz: 0.0,
            prev_prompt: None,
            fll_enabled: true,
        };
        s.code_rate_hz = s.base_code_rate();
        Ok(s)
    }

    fn base_code_rate(&self) -> f64 {
        let d = if self.cfg.carrier_aiding {
            self.doppler_hz
        } else {
            self.init_doppler_hz
        };
        self.chip_rate_hz * (1.0 + d / self.carrier_hz)
    }

    /// One loop update on early, prompt and late correlations integrated over `t_s`.
    pub fn update(&mut self, e: Cf64, p: Cf64, l: Cf64, t_s: f64) -> Discriminators {
        let pll_rad = if self.cfg.carrier.has_pll() {
            self.cfg.pll_discriminator.discriminate(p)
        } else {
            0.0
        };
        let fll_hz = match self.prev_prompt {
            Some(prev) => self.cfg.fll_discriminator.discriminate(prev, p, t_s),
            None => 0.0,
        };
        let fe = if self.cfg.carrier.has_fll() && self.fll_enabled {
            TAU * fll_hz
        } else {
            0.0
        };
        let w = self.carrier.update(pll_rad, fe, t_s);
        self.doppler_hz = self.init_doppler_hz + w / TAU;
        let dll_chips = self.cfg.dll.discriminate(e, p, l, self.cfg.spacing_chips);
        let corr = self.code.update(dll_chips, 0.0, t_s);
        self.code_rate_hz = self.base_code_rate() + corr;
        self.prev_prompt = Some(p);
        Discriminators {
            pll_rad,
            fll_hz,
            dll_chips,
        }
    }

    /// Switch the FLL path of an FLL-assisted PLL on or off (the channel does this under
    /// [`FllAssist::PullIn`]). A core that is never told keeps it on. An FLL-only loop
    /// ignores it.
    pub fn set_fll_enabled(&mut self, on: bool) {
        self.fll_enabled = on || !self.cfg.carrier.has_pll();
    }

    /// Whether the FLL path feeds the loop.
    pub fn fll_enabled(&self) -> bool {
        self.cfg.carrier.has_fll() && self.fll_enabled
    }

    /// Carrier Doppler the NCO is set to (Hz, relative to the intermediate frequency).
    pub fn doppler_hz(&self) -> f64 {
        self.doppler_hz
    }

    /// Code rate the NCO is set to (chips/s).
    pub fn code_rate_hz(&self) -> f64 {
        self.code_rate_hz
    }

    /// The configuration.
    pub fn config(&self) -> &LoopConfig {
        &self.cfg
    }
}
