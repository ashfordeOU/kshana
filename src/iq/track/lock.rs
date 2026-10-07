// SPDX-License-Identifier: AGPL-3.0-only
//! **Lock state machine and streaming tracking sessions.**
//!
//! A [`TrackSession`] runs a set of channels over a sample stream in bounded memory. Every
//! loop update goes to an [`EpochSink`] as it happens, so nothing grows with the recording's
//! length. Each channel carries a lock state ([`LockState`]):
//!
//! * `PULL_IN` → `LOCKED` once phase and code lock have both held for `loss_dwell_s`;
//! * `LOCKED` → `LOST` once phase or code lock has been lost for `loss_dwell_s`;
//!   `PULL_IN` → `LOST` after `pull_in_max_s` without lock;
//! * a **false-lock check** runs on every tracking channel (pull-in, locked or lost): every
//!   `cn0_windows` updates the next few milliseconds of samples are searched at the tracked
//!   Doppler and at the ±1/(2T) FLL/PLL ambiguity, `T` being the loop's integration time.
//!   An alias bin stronger than the tracked bin by `false_lock_margin_db` is a false lock:
//!   the channel goes to `LOST`, and its re-acquisition (if enabled) is centred on the
//!   alias;
//! * with `reacquire` on, a `LOST` channel goes to `REACQ`: the next samples are searched
//!   ±`reacq_doppler_window_hz` around its last (or alias) Doppler, and on detection the
//!   channel restarts from that hand-off (`PULL_IN`). After `max_reacq_attempts` failed
//!   searches in a row it is `RETIRED` and stops. With `reacquire` off (the built-in
//!   default) the state machine only observes: the loops run exactly as without it, and a
//!   `LOST` channel returns to `LOCKED` when its locks hold again and no false lock is
//!   suspected.
//!
//! Every transition is an event ([`LockEvent`]) with its reason.

use super::channel::{Channel, ChannelInit, EpochOutput};
use super::design::{AcquisitionDesign, Design, LockConfig};
use super::sink::EpochSink;
use super::LoopConfig;
use crate::iq::acq::{acquire, samples_needed, AcqConfig};
use crate::iq::{Cf64, IqError, IqSource, SampleSpec};
use serde::{Deserialize, Serialize};

/// Samples read from a source per chunk.
const CHUNK: usize = 1 << 16;

/// A channel's lock state.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "SCREAMING_SNAKE_CASE")]
pub enum LockState {
    /// Loops converging after a hand-off.
    PullIn,
    /// Phase and code lock held.
    Locked,
    /// Lock lost, or a false lock detected.
    Lost,
    /// Re-acquisition search under way (the previous loops keep running meanwhile).
    Reacq,
    /// Given up after too many failed re-acquisitions; the channel stops.
    Retired,
}

impl LockState {
    /// `PULL_IN`, `LOCKED`, `LOST`, `REACQ` or `RETIRED`.
    pub fn as_str(self) -> &'static str {
        match self {
            LockState::PullIn => "PULL_IN",
            LockState::Locked => "LOCKED",
            LockState::Lost => "LOST",
            LockState::Reacq => "REACQ",
            LockState::Retired => "RETIRED",
        }
    }
    /// The binary record's code (0..=4).
    pub fn code(self) -> u8 {
        self as u8
    }
    /// The state a binary code names.
    pub fn from_code(c: u8) -> Option<Self> {
        Some(match c {
            0 => LockState::PullIn,
            1 => LockState::Locked,
            2 => LockState::Lost,
            3 => LockState::Reacq,
            4 => LockState::Retired,
            _ => return None,
        })
    }
}

/// One lock-state transition or check result.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct LockEvent {
    /// Channel index.
    pub channel: u32,
    /// The channel's next loop-update index when the event happened.
    pub epoch: u64,
    /// Stream sample at which the event was decided.
    pub sample_index: u64,
    /// Time of the last code epoch (s).
    pub code_epoch_s: f64,
    /// State before.
    pub from: LockState,
    /// State after.
    pub to: LockState,
    /// `locked`, `recovered`, `loss-of-lock`, `pull-in-timeout`, `false-lock`,
    /// `reacq-start`, `reacquired`, `reacq-failed` or `retired`.
    pub reason: String,
    /// Doppler involved (Hz): the alias of a false lock, the result of a re-acquisition.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub doppler_hz: Option<f64>,
    /// Code phase found by a re-acquisition (chips, at its first searched sample).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub code_phase_chips: Option<f64>,
    /// The search's peak statistic (a re-acquisition), or the alias-to-tracked power ratio
    /// in dB (a false-lock check).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub statistic: Option<f64>,
    /// The search's threshold (a re-acquisition), or the margin in dB (a false-lock check).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub threshold: Option<f64>,
}

/// Everything one session channel needs: what it tracks, its loops, its lock state machine
/// and its (re-)acquisition search.
#[derive(Clone, Debug)]
pub struct SessionChannel {
    /// The hand-off.
    pub init: ChannelInit,
    /// The loop design.
    pub config: LoopConfig,
    /// The lock state machine.
    pub lock: LockConfig,
    /// The re-acquisition search (Doppler window from `lock`).
    pub acquisition: AcquisitionDesign,
}

impl SessionChannel {
    /// A channel tracking `init` with loop design `d`.
    pub fn from_design(init: ChannelInit, d: &Design) -> Self {
        Self {
            init,
            config: d.loop_config(),
            lock: d.lock_config(),
            acquisition: d.acquisition().clone(),
        }
    }

    /// A channel with an ad-hoc loop configuration and the default lock state machine
    /// (observing only) and acquisition.
    pub fn from_config(init: ChannelInit, config: LoopConfig) -> Self {
        Self {
            init,
            config,
            lock: LockConfig::default(),
            acquisition: AcquisitionDesign::default(),
        }
    }
}

/// What a sample collection is for.
#[derive(Clone, Copy, Debug, PartialEq)]
enum Purpose {
    /// Check the tracked Doppler `center` against its ±`alias_hz` aliases.
    FalseLock { center: f64, alias_hz: f64 },
    /// Search ±window around `center`.
    Reacq { center: f64 },
}

/// Samples gathered for a search, from absolute stream sample `start`.
#[derive(Clone, Debug)]
struct Collect {
    purpose: Purpose,
    start: u64,
    cfg: AcqConfig,
    need: usize,
    buf: Vec<Cf64>,
}

/// One channel under the state machine.
struct Managed {
    setup: SessionChannel,
    ch: Option<Channel>,
    state: LockState,
    state_since_s: f64,
    good_since: Option<f64>,
    bad_since: Option<f64>,
    updates_since_check: usize,
    attempts: u32,
    suspect: bool,
    check_unavailable: bool,
    reacq_center: f64,
    next_epoch: u64,
    last_t: f64,
    loop_t: f64,
    collect: Option<Collect>,
}

/// A set of channels run over one stream in bounded memory, with the lock state machine.
pub struct TrackSession {
    spec: SampleSpec,
    chans: Vec<Managed>,
    consumed: u64,
    scratch: Vec<EpochOutput>,
}

impl TrackSession {
    /// A session on a stream sampled as `spec`.
    pub fn new(spec: SampleSpec, channels: Vec<SessionChannel>) -> Result<Self, String> {
        let chans = channels
            .into_iter()
            .map(|setup| {
                let ch = Channel::new(&spec, &setup.init, &setup.config)?;
                Ok(Managed {
                    reacq_center: setup.init.doppler_hz,
                    setup,
                    ch: Some(ch),
                    state: LockState::PullIn,
                    state_since_s: 0.0,
                    good_since: None,
                    bad_since: None,
                    updates_since_check: 0,
                    attempts: 0,
                    suspect: false,
                    check_unavailable: false,
                    next_epoch: 0,
                    last_t: 0.0,
                    loop_t: 0.0,
                    collect: None,
                })
            })
            .collect::<Result<Vec<_>, String>>()?;
        Ok(Self {
            spec,
            chans,
            consumed: 0,
            scratch: Vec::new(),
        })
    }

    /// The stream's sampling.
    pub fn spec(&self) -> SampleSpec {
        self.spec
    }

    /// Stream samples consumed so far.
    pub fn samples_consumed(&self) -> u64 {
        self.consumed
    }

    /// Each channel's current lock state.
    pub fn states(&self) -> Vec<LockState> {
        self.chans.iter().map(|m| m.state).collect()
    }

    /// Feed the next `samples` of the stream to every channel, writing every loop update
    /// and event to `sink` as it happens.
    pub fn process(&mut self, samples: &[Cf64], sink: &mut dyn EpochSink) -> Result<(), IqError> {
        let chunk_start = self.consumed;
        let chunk_end = chunk_start + samples.len() as u64;
        for (idx, m) in self.chans.iter_mut().enumerate() {
            if let Some(ch) = m.ch.as_mut() {
                self.scratch.clear();
                ch.process(samples, &mut self.scratch);
                for e in &self.scratch {
                    m.on_epoch(idx, e, chunk_end, &self.spec, sink)?;
                    sink.epoch(idx, e, m.state)?;
                }
            }
            // Gather samples for a pending search; a search requested during this chunk
            // starts at the next one.
            if let Some(c) = m.collect.as_mut() {
                if c.start >= chunk_start && c.start < chunk_end {
                    let from = (c.start - chunk_start) as usize;
                    let take = (c.need - c.buf.len()).min(samples.len() - from);
                    c.buf.extend_from_slice(&samples[from..from + take]);
                } else if c.start < chunk_start && c.buf.len() < c.need {
                    let take = (c.need - c.buf.len()).min(samples.len());
                    c.buf.extend_from_slice(&samples[..take]);
                }
            }
            if m.collect.as_ref().is_some_and(|c| c.buf.len() >= c.need) {
                let c = m.collect.take().expect("checked above");
                m.on_search(idx, c, chunk_end, &self.spec, sink)?;
            }
        }
        self.consumed = chunk_end;
        Ok(())
    }

    /// Read `src` to its end (or to `max_samples`), writing to `sink`, then flush `sink`.
    pub fn run(
        &mut self,
        src: &mut dyn IqSource,
        max_samples: Option<u64>,
        sink: &mut dyn EpochSink,
    ) -> Result<(), IqError> {
        let mut buf = vec![Cf64::default(); CHUNK];
        let mut done = 0u64;
        loop {
            let want = match max_samples {
                Some(m) => (m.saturating_sub(done)).min(CHUNK as u64) as usize,
                None => CHUNK,
            };
            if want == 0 {
                break;
            }
            let n = src.read(&mut buf[..want])?;
            if n == 0 {
                break;
            }
            self.process(&buf[..n], sink)?;
            done += n as u64;
        }
        sink.finish()
    }
}

impl Managed {
    #[allow(clippy::too_many_arguments)]
    fn transition(
        &mut self,
        idx: usize,
        to: LockState,
        reason: &str,
        at_sample: u64,
        extra: (Option<f64>, Option<f64>, Option<f64>, Option<f64>),
        sink: &mut dyn EpochSink,
    ) -> Result<(), IqError> {
        let from = self.state;
        self.state = to;
        self.state_since_s = self.last_t;
        self.good_since = None;
        self.bad_since = None;
        if to == LockState::Locked {
            self.attempts = 0;
        }
        sink.event(&LockEvent {
            channel: idx as u32,
            epoch: self.next_epoch,
            sample_index: at_sample,
            code_epoch_s: self.last_t,
            from,
            to,
            reason: reason.into(),
            doppler_hz: extra.0,
            code_phase_chips: extra.1,
            statistic: extra.2,
            threshold: extra.3,
        })
    }

    /// The state machine's step on one loop update.
    fn on_epoch(
        &mut self,
        idx: usize,
        e: &EpochOutput,
        chunk_end: u64,
        spec: &SampleSpec,
        sink: &mut dyn EpochSink,
    ) -> Result<(), IqError> {
        let lk = self.setup.lock.clone();
        let t = e.code_epoch_s;
        self.last_t = t;
        self.loop_t = e.t_coh_s;
        self.next_epoch = e.epoch + 1;
        let both = e.phase_lock && e.code_lock;
        let held = |since: &mut Option<f64>, cond: bool| -> bool {
            if cond {
                let s = *since.get_or_insert(t);
                t - s >= lk.loss_dwell_s
            } else {
                *since = None;
                false
            }
        };
        match self.state {
            LockState::PullIn => {
                if held(&mut self.good_since, both) {
                    self.transition(
                        idx,
                        LockState::Locked,
                        "locked",
                        e.sample_index,
                        (None, None, None, None),
                        sink,
                    )?;
                } else if t - self.state_since_s > lk.pull_in_max_s {
                    self.reacq_center = e.doppler_hz;
                    self.transition(
                        idx,
                        LockState::Lost,
                        "pull-in-timeout",
                        e.sample_index,
                        (None, None, None, None),
                        sink,
                    )?;
                }
            }
            LockState::Locked => {
                if held(&mut self.bad_since, !both) {
                    self.reacq_center = e.doppler_hz;
                    self.transition(
                        idx,
                        LockState::Lost,
                        "loss-of-lock",
                        e.sample_index,
                        (None, None, None, None),
                        sink,
                    )?;
                }
            }
            LockState::Lost => {
                if lk.reacquire {
                    if self.collect.is_none() {
                        let searchable = self.start(
                            Purpose::Reacq {
                                center: self.reacq_center,
                            },
                            chunk_end,
                            spec,
                        )?;
                        if !searchable {
                            // No search can run at this sample rate: stop the channel.
                            self.ch = None;
                            return self.transition(
                                idx,
                                LockState::Retired,
                                "retired",
                                e.sample_index,
                                (None, None, None, None),
                                sink,
                            );
                        }
                        self.transition(
                            idx,
                            LockState::Reacq,
                            "reacq-start",
                            e.sample_index,
                            (Some(self.reacq_center), None, None, None),
                            sink,
                        )?;
                    }
                } else if !self.suspect && held(&mut self.good_since, both) {
                    self.transition(
                        idx,
                        LockState::Locked,
                        "recovered",
                        e.sample_index,
                        (None, None, None, None),
                        sink,
                    )?;
                }
            }
            LockState::Reacq | LockState::Retired => {}
        }
        // The false-lock check, on every channel that is tracking. A false lock rarely
        // shows lock indicators, so it is looked for in pull-in and while lost too.
        let watching = matches!(
            self.state,
            LockState::PullIn | LockState::Locked | LockState::Lost
        );
        if lk.false_lock_check && watching && !self.check_unavailable {
            self.updates_since_check += 1;
            if self.updates_since_check >= self.setup.config.cn0_windows && self.collect.is_none() {
                self.updates_since_check = 0;
                let alias_hz = 1.0 / (2.0 * e.t_coh_s);
                let searchable = self.start(
                    Purpose::FalseLock {
                        center: e.doppler_hz,
                        alias_hz,
                    },
                    chunk_end,
                    spec,
                )?;
                if !searchable {
                    self.check_unavailable = true;
                }
            }
        }
        Ok(())
    }

    /// A re-acquisition found nothing (or could not run): try again, or retire the channel
    /// after `max_reacq_attempts` failures in a row.
    fn reacq_failed(
        &mut self,
        idx: usize,
        now: u64,
        stat: Option<(f64, f64)>,
        sink: &mut dyn EpochSink,
    ) -> Result<(), IqError> {
        self.attempts += 1;
        let extra = (None, None, stat.map(|s| s.0), stat.map(|s| s.1));
        if self.attempts >= self.setup.lock.max_reacq_attempts {
            self.ch = None;
            self.transition(idx, LockState::Retired, "retired", now, extra, sink)
        } else {
            self.transition(idx, LockState::Lost, "reacq-failed", now, extra, sink)
        }
    }

    /// Begin gathering samples for a search starting at stream sample `start`.
    fn start(&mut self, purpose: Purpose, start: u64, spec: &SampleSpec) -> Result<bool, IqError> {
        let code = self.setup.init.code.as_ref();
        let period = code.period_s();
        let base = self.setup.acquisition.acq_config(period);
        let cfg = match purpose {
            Purpose::Reacq { .. } => AcqConfig {
                doppler_max_hz: self.setup.lock.reacq_doppler_window_hz,
                ..base
            },
            Purpose::FalseLock { alias_hz, .. } => {
                // Resolve ±alias_hz: a coherent block of at least 2T, bins at 0, ±alias/2,
                // ±alias.
                let need_s = 2.0 / alias_hz;
                let n = ((need_s / period - 1e-9).ceil() as usize).max(base.coherent_periods);
                AcqConfig {
                    coherent_periods: n,
                    noncoherent: 1,
                    doppler_max_hz: alias_hz,
                    doppler_step_hz: alias_hz / 2.0,
                    pfa: base.pfa,
                }
            }
        };
        // A rate with no whole number of samples per code period cannot be searched; the
        // caller then goes on without the search.
        let Ok(need) = samples_needed(spec, code, &cfg) else {
            return Ok(false);
        };
        self.collect = Some(Collect {
            purpose,
            start,
            cfg,
            need,
            buf: Vec::with_capacity(need),
        });
        Ok(true)
    }

    /// Act on a completed search. `now` is the first stream sample not yet given to the
    /// channels: a re-acquired channel restarts there.
    fn on_search(
        &mut self,
        idx: usize,
        c: Collect,
        now: u64,
        spec: &SampleSpec,
        sink: &mut dyn EpochSink,
    ) -> Result<(), IqError> {
        let code = self.setup.init.code.clone();
        let center = match c.purpose {
            Purpose::FalseLock { center, .. } | Purpose::Reacq { center } => center,
        };
        // Centre the search on `center` by shifting the intermediate frequency.
        let shifted = SampleSpec {
            if_hz: spec.if_hz + center,
            ..*spec
        };
        // A search that cannot run (for example a sample rate with no whole number of
        // samples per code period) never stops tracking: the false-lock check is switched
        // off for the channel, and a re-acquisition counts as a failed attempt.
        let grid = match acquire(&c.buf, &shifted, code.as_ref(), &c.cfg) {
            Ok(g) => g,
            Err(_) => {
                return match c.purpose {
                    Purpose::FalseLock { .. } => {
                        self.check_unavailable = true;
                        Ok(())
                    }
                    Purpose::Reacq { .. } => self.reacq_failed(idx, now, None, sink),
                };
            }
        };
        match c.purpose {
            Purpose::FalseLock { alias_hz, .. } => {
                let row_max = |r: &Vec<f64>| r.iter().copied().fold(0.0_f64, f64::max);
                let mid = grid.grid.len() / 2;
                let tracked = row_max(&grid.grid[mid]);
                let (alias_idx, alias) = [0, grid.grid.len() - 1]
                    .into_iter()
                    .map(|i| (i, row_max(&grid.grid[i])))
                    .fold((0, 0.0), |a, b| if b.1 > a.1 { b } else { a });
                let ratio_db = 10.0 * (alias / tracked.max(f64::MIN_POSITIVE)).log10();
                let margin = self.setup.lock.false_lock_margin_db;
                if ratio_db > margin {
                    let alias_doppler = center + if alias_idx == 0 { -alias_hz } else { alias_hz };
                    self.reacq_center = alias_doppler;
                    self.suspect = true;
                    let to = match self.state {
                        LockState::PullIn | LockState::Locked => LockState::Lost,
                        s => s,
                    };
                    self.transition(
                        idx,
                        to,
                        "false-lock",
                        now,
                        (Some(alias_doppler), None, Some(ratio_db), Some(margin)),
                        sink,
                    )?;
                } else {
                    self.suspect = false;
                }
            }
            Purpose::Reacq { .. } => {
                let mut r = grid.result.clone();
                if r.acquired {
                    r.doppler_hz += center;
                    let init = ChannelInit::from_acquisition(
                        code,
                        &r,
                        spec,
                        c.start,
                        self.setup.init.periods_per_bit,
                    );
                    let ch = Channel::new_at(spec, &init, &self.setup.config, now, self.next_epoch)
                        .map_err(IqError::Format)?;
                    self.ch = Some(ch);
                    self.suspect = false;
                    self.updates_since_check = 0;
                    self.transition(
                        idx,
                        LockState::PullIn,
                        "reacquired",
                        now,
                        (
                            Some(r.doppler_hz),
                            Some(r.code_phase_chips),
                            Some(r.statistic),
                            Some(r.threshold),
                        ),
                        sink,
                    )?;
                } else {
                    self.reacq_failed(idx, now, Some((r.statistic, r.threshold)), sink)?;
                }
            }
        }
        Ok(())
    }
}
