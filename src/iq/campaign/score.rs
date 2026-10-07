// SPDX-License-Identifier: AGPL-3.0-only
//! The scoring engine: one tracked satellite's loop updates scored against the stated test
//! conditions, online and in bounded memory.
//!
//! [`SatScorer`] takes one [`ScoreEpoch`] per loop update, in time order, and keeps only
//! running sums, a fixed-size C/N0 histogram per J/S bin and the lock transitions it needs.
//! Its memory does not grow with the recording length. [`SatScorer::finish`] returns a
//! [`SatScore`] with these figures:
//!
//! * **availability**: time locked / time scored. Scored time starts after the recording's
//!   `settle_s`. It is given for the whole run and for each event window.
//! * **time to loss of lock**: the first locked → unlocked transition in
//!   `[onset, offset + reacq_grace_s]`, minus the onset. It is `None` when lock held. The
//!   stated J/S at that moment is reported with it.
//! * **re-acquisition time**: the first unlocked → locked transition at or after
//!   `max(offset, loss)`, minus the offset. The time from the loss itself is reported as
//!   `outage_s`.
//! * **baseline C/N0**: the median NWPR C/N0 over locked updates in
//!   `[onset − baseline_window_s, onset)`. When there are none, the stated nominal C/N0
//!   is used instead.
//! * **C/N0 degradation against stated J/S**: locked updates during the event are binned by
//!   the stated J/S. Each bin reports the median measured C/N0 and its degradation from the
//!   baseline. Next to each bin is a **MODELLED** reference: the spectral-separation
//!   anti-jam equation [`crate::jamming::effective_cn0_dbhz`] at the bin's J/S, with `Q`
//!   from [`crate::jamming::q_factor`] for the stated type or the event's override. The
//!   reference is a closed-form model *of* the stated condition, never a measurement.
//! * **false lock**: an episode is a run of locked updates that the tracker flags as a false
//!   lock, or, when truth is available, a run of at least `false_lock_min_epochs` locked
//!   updates whose Doppler is off the truth by more than the threshold. The rate is given
//!   per hour of locked time.
//! * **PLL / DLL jitter**: the sample standard deviation of the carrier-phase discriminator
//!   (degrees) and the code discriminator (chips) over locked updates. It is given for the
//!   whole run (outside events), for each baseline window and for each event.
//!
//! Medians come from a 0.05 dB histogram over 0–80 dB-Hz, so they are exact to the bin
//! width. The histogram keeps memory fixed however long an event runs.

use super::conditions::{Event, EventKind, TestConditions};
use crate::jamming::{effective_cn0_dbhz, q_factor};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;

/// The label every analytic reference value carries.
pub const MODELLED: &str = "MODELLED";

/// The anti-jam equation the reference curve evaluates, as printed in outputs.
pub const REFERENCE_FORMULA: &str = "(C/N0)eff = [1/(C/N0) + (J/S)/(Q*Rc)]^-1";

/// One loop update as the scorer needs it. Any tracker that can produce this can be scored.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ScoreEpoch {
    /// Time of the update (s from the first sample of the recording).
    pub t_s: f64,
    /// Integration time the update covers (s).
    pub t_coh_s: f64,
    /// Whether the channel counts as locked (the tracker's lock state).
    pub locked: bool,
    /// Phase-lock indicator flag.
    pub phase_lock: bool,
    /// Code-lock indicator flag.
    pub code_lock: bool,
    /// NWPR C/N0 estimate (dB-Hz), once available.
    pub cn0_dbhz: Option<f64>,
    /// Carrier-phase discriminator output (rad).
    pub pll_rad: f64,
    /// Code discriminator output (chips).
    pub dll_chips: f64,
    /// Carrier Doppler of the NCO (Hz).
    pub doppler_hz: f64,
    /// Whether the tracker's own false-lock detector fired on this update.
    pub false_lock_flag: bool,
}

/// Scoring settings (the campaign's `[scoring]` table).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ScoringConfig {
    /// Pre-event window for the baseline C/N0 and jitter (s).
    #[serde(default = "d_baseline")]
    pub baseline_window_s: f64,
    /// J/S bin width of the degradation curve (dB).
    #[serde(default = "d_bin")]
    pub js_bin_db: f64,
    /// Doppler error against truth above which an update counts as false-locked (Hz);
    /// `None` uses `1/(4 T_coh)`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub false_lock_doppler_hz: Option<f64>,
    /// Consecutive off-truth locked updates that make a false-lock episode.
    #[serde(default = "d_fl_epochs")]
    pub false_lock_min_epochs: u32,
    /// How long after an event's offset re-acquisition is looked for (s).
    #[serde(default = "d_grace")]
    pub reacq_grace_s: f64,
    /// Whether to compute the MODELLED reference curve.
    #[serde(default = "d_true")]
    pub reference_curve: bool,
    /// Pass/fail bars, applied when the report is built (not by the scorer).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bars: Option<Bars>,
}

fn d_baseline() -> f64 {
    10.0
}
fn d_bin() -> f64 {
    1.0
}
fn d_fl_epochs() -> u32 {
    50
}
fn d_grace() -> f64 {
    30.0
}
fn d_true() -> bool {
    true
}

impl Default for ScoringConfig {
    fn default() -> Self {
        Self {
            baseline_window_s: d_baseline(),
            js_bin_db: d_bin(),
            false_lock_doppler_hz: None,
            false_lock_min_epochs: d_fl_epochs(),
            reacq_grace_s: d_grace(),
            reference_curve: true,
            bars: None,
        }
    }
}

impl ScoringConfig {
    /// Check the settings.
    pub fn validate(&self) -> Result<(), String> {
        if !(self.baseline_window_s.is_finite() && self.baseline_window_s > 0.0) {
            return Err("scoring.baseline_window_s must be positive".into());
        }
        if !(self.js_bin_db.is_finite() && self.js_bin_db > 0.0) {
            return Err("scoring.js_bin_db must be positive".into());
        }
        if !(self.reacq_grace_s.is_finite() && self.reacq_grace_s >= 0.0) {
            return Err("scoring.reacq_grace_s must be >= 0".into());
        }
        if let Some(h) = self.false_lock_doppler_hz {
            if !(h.is_finite() && h > 0.0) {
                return Err("scoring.false_lock_doppler_hz must be positive".into());
            }
        }
        if self.false_lock_min_epochs == 0 {
            return Err("scoring.false_lock_min_epochs must be at least 1".into());
        }
        Ok(())
    }
}

/// Pass/fail bars. Every bar is optional; an unset bar is not judged. A metric that is
/// absent (for example no loss of lock, so no re-acquisition time) passes a bar that only
/// limits its size, except where noted.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Bars {
    /// Lock must hold at least this long after an event's onset (s); holding lock through
    /// the event passes.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub min_time_to_loss_s: Option<f64>,
    /// Lock must return within this time of an event's offset (s); a channel that lost lock
    /// and never returned fails.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub max_reacq_s: Option<f64>,
    /// Whole-run availability floor.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub min_availability: Option<f64>,
    /// Availability floor within each event window.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub min_event_availability: Option<f64>,
    /// Whole-run false-lock rate ceiling (episodes per locked hour).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub max_false_lock_per_hour: Option<f64>,
    /// Carrier-jitter ceiling (deg), whole run and per event.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub max_pll_jitter_deg: Option<f64>,
    /// Code-jitter ceiling (chips), whole run and per event.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub max_dll_jitter_chips: Option<f64>,
}

impl Bars {
    /// `self` with every bar `over` sets replaced by `over`'s value.
    pub fn merged(&self, over: Option<&Bars>) -> Bars {
        let Some(o) = over else {
            return self.clone();
        };
        Bars {
            min_time_to_loss_s: o.min_time_to_loss_s.or(self.min_time_to_loss_s),
            max_reacq_s: o.max_reacq_s.or(self.max_reacq_s),
            min_availability: o.min_availability.or(self.min_availability),
            min_event_availability: o.min_event_availability.or(self.min_event_availability),
            max_false_lock_per_hour: o.max_false_lock_per_hour.or(self.max_false_lock_per_hour),
            max_pll_jitter_deg: o.max_pll_jitter_deg.or(self.max_pll_jitter_deg),
            max_dll_jitter_chips: o.max_dll_jitter_chips.or(self.max_dll_jitter_chips),
        }
    }

    /// Whether any bar is set.
    pub fn any(&self) -> bool {
        *self != Bars::default()
    }

    /// The verdicts on a satellite's whole-run figures, keyed by bar name.
    pub fn judge_run(&self, w: &WholeRunScore) -> BTreeMap<String, bool> {
        let mut out = BTreeMap::new();
        let le = |x: Option<f64>, b: f64| x.is_none_or(|x| x <= b);
        if let Some(b) = self.min_availability {
            out.insert(
                "min_availability".into(),
                w.availability.is_some_and(|a| a >= b),
            );
        }
        if let Some(b) = self.max_false_lock_per_hour {
            out.insert(
                "max_false_lock_per_hour".into(),
                le(w.false_lock_per_hour, b),
            );
        }
        if let Some(b) = self.max_pll_jitter_deg {
            out.insert("max_pll_jitter_deg".into(), le(w.pll_jitter_deg, b));
        }
        if let Some(b) = self.max_dll_jitter_chips {
            out.insert("max_dll_jitter_chips".into(), le(w.dll_jitter_chips, b));
        }
        out
    }

    /// The verdicts on one event's figures, keyed by bar name.
    pub fn judge_event(&self, e: &EventScore) -> BTreeMap<String, bool> {
        let mut out = BTreeMap::new();
        let le = |x: Option<f64>, b: f64| x.is_none_or(|x| x <= b);
        if let Some(b) = self.min_time_to_loss_s {
            out.insert(
                "min_time_to_loss_s".into(),
                e.locked_at_onset && e.time_to_loss_s.is_none_or(|t| t >= b),
            );
        }
        if let Some(b) = self.max_reacq_s {
            let ok = if e.lost || !e.locked_at_onset {
                e.reacq_time_s.is_some_and(|t| t <= b)
            } else {
                true
            };
            out.insert("max_reacq_s".into(), ok);
        }
        if let Some(b) = self.min_event_availability {
            out.insert(
                "min_event_availability".into(),
                e.availability.is_some_and(|a| a >= b),
            );
        }
        if let Some(b) = self.max_pll_jitter_deg {
            out.insert("max_pll_jitter_deg".into(), le(e.pll_jitter_deg, b));
        }
        if let Some(b) = self.max_dll_jitter_chips {
            out.insert("max_dll_jitter_chips".into(), le(e.dll_jitter_chips, b));
        }
        out
    }
}

/// Running mean and variance (Welford).
#[derive(Clone, Copy, Debug, Default)]
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

    /// Sample standard deviation; `None` for fewer than two values.
    fn std(&self) -> Option<f64> {
        (self.n >= 2).then(|| (self.m2 / (self.n - 1) as f64).sqrt())
    }
}

/// Histogram resolution (dB) and range of C/N0 values kept for medians.
const HIST_RES_DB: f64 = 0.05;
const HIST_MAX_DB: f64 = 80.0;
const HIST_BINS: usize = (HIST_MAX_DB / HIST_RES_DB) as usize;

/// A fixed-size C/N0 histogram for medians.
#[derive(Clone, Debug)]
struct Hist {
    counts: Vec<u32>,
    n: u64,
}

impl Hist {
    fn new() -> Self {
        Self {
            counts: vec![0; HIST_BINS],
            n: 0,
        }
    }

    fn push(&mut self, x: f64) {
        if !x.is_finite() {
            return;
        }
        let i = ((x / HIST_RES_DB).floor().max(0.0) as usize).min(HIST_BINS - 1);
        self.counts[i] += 1;
        self.n += 1;
    }

    /// The median, at the centre of the bin holding it.
    fn median(&self) -> Option<f64> {
        if self.n == 0 {
            return None;
        }
        let half = self.n.div_ceil(2);
        let mut acc = 0u64;
        for (i, &c) in self.counts.iter().enumerate() {
            acc += c as u64;
            if acc >= half {
                return Some((i as f64 + 0.5) * HIST_RES_DB);
            }
        }
        None
    }
}

/// The whole-run figures of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct WholeRunScore {
    /// Time scored after the settle time (s).
    pub scored_s: f64,
    /// Time locked within it (s).
    pub locked_s: f64,
    /// `locked_s / scored_s`.
    pub availability: Option<f64>,
    /// Fraction of scored time with the phase-lock flag up.
    pub phase_lock_frac: Option<f64>,
    /// Fraction of scored time with the code-lock flag up.
    pub code_lock_frac: Option<f64>,
    /// Median C/N0 over locked updates outside events (dB-Hz).
    pub median_cn0_dbhz: Option<f64>,
    /// Carrier-phase discriminator std over locked updates outside events (deg).
    pub pll_jitter_deg: Option<f64>,
    /// Code discriminator std over locked updates outside events (chips).
    pub dll_jitter_chips: Option<f64>,
    /// False-lock episodes.
    pub false_lock_episodes: u32,
    /// False-lock episodes per hour of locked time.
    pub false_lock_per_hour: Option<f64>,
    /// Locked → unlocked transitions.
    pub loss_count: u32,
    /// Unlocked → locked transitions after the first lock.
    pub reacq_count: u32,
}

/// One bin of the C/N0-against-J/S curve.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Cn0Bin {
    /// Centre of the stated-J/S bin (dB).
    pub js_db: f64,
    /// Locked updates in the bin.
    pub n: u64,
    /// Median measured C/N0 (dB-Hz).
    pub measured_cn0_dbhz: Option<f64>,
    /// Baseline minus measured (dB).
    pub measured_degradation_db: Option<f64>,
    /// MODELLED C/N0 at the bin's J/S (dB-Hz).
    pub modelled_cn0_dbhz: Option<f64>,
    /// Baseline minus MODELLED (dB).
    pub modelled_degradation_db: Option<f64>,
}

/// How the MODELLED reference was computed.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct ModelledReference {
    /// Always [`MODELLED`].
    pub label: String,
    /// The spectral-separation factor used.
    pub q: f64,
    /// Where `q` came from: `"type-table"` or `"event-override"`.
    pub q_source: String,
    /// Chip rate of the signal (chips/s).
    pub chip_rate_hz: f64,
    /// The equation.
    pub formula: String,
}

/// The figures of one satellite for one event.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EventScore {
    /// Event id.
    pub event_id: String,
    /// Event kind.
    pub kind: EventKind,
    /// Stated type label.
    #[serde(rename = "type")]
    pub event_type: String,
    /// Onset (s).
    pub onset_s: f64,
    /// Offset (s).
    pub offset_s: f64,
    /// Whether the channel was locked at the onset.
    pub locked_at_onset: bool,
    /// Whether lock was lost in `[onset, offset + grace]`.
    pub lost: bool,
    /// Loss time minus onset (s).
    pub time_to_loss_s: Option<f64>,
    /// Stated J/S at the loss (dB).
    pub js_at_loss_db: Option<f64>,
    /// Whether lock returned within the grace time after the offset.
    pub reacquired: bool,
    /// Relock time minus offset (s).
    pub reacq_time_s: Option<f64>,
    /// Relock time minus loss time (s).
    pub outage_s: Option<f64>,
    /// Locked fraction of the event window.
    pub availability: Option<f64>,
    /// Baseline C/N0 (dB-Hz).
    pub baseline_cn0_dbhz: Option<f64>,
    /// Where the baseline came from: `"measured"` or `"stated-nominal"`.
    pub baseline_source: Option<String>,
    /// Baseline-window carrier jitter (deg).
    pub baseline_pll_jitter_deg: Option<f64>,
    /// Baseline-window code jitter (chips).
    pub baseline_dll_jitter_chips: Option<f64>,
    /// Event-window carrier jitter (deg).
    pub pll_jitter_deg: Option<f64>,
    /// Event-window code jitter (chips).
    pub dll_jitter_chips: Option<f64>,
    /// False-lock episodes starting in the event window.
    pub false_lock_episodes: u32,
    /// The C/N0-against-stated-J/S curve (empty without a stated power profile).
    pub cn0_curve: Vec<Cn0Bin>,
    /// The MODELLED reference's provenance, when it was drawn.
    pub modelled: Option<ModelledReference>,
}

/// All figures of one satellite.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct SatScore {
    /// Signal name.
    pub signal: String,
    /// Satellite id.
    pub id: i64,
    /// Whole-run figures.
    pub whole_run: WholeRunScore,
    /// Per-event figures, in onset order.
    pub events: Vec<EventScore>,
}

/// Running state for one event.
struct EventAcc {
    ev: Event,
    baseline_hist: Hist,
    baseline_pll: Welford,
    baseline_dll: Welford,
    locked_at_onset: Option<bool>,
    loss_t: Option<f64>,
    relock_t: Option<f64>,
    in_s: f64,
    in_locked_s: f64,
    pll: Welford,
    dll: Welford,
    false_locks: u32,
    bins: BTreeMap<i64, Hist>,
}

/// The online scorer for one satellite.
pub struct SatScorer {
    signal: String,
    id: i64,
    chip_rate_hz: f64,
    nominal_cn0_dbhz: Option<f64>,
    settle_s: f64,
    cfg: ScoringConfig,
    events: Vec<EventAcc>,
    // Whole run.
    scored_s: f64,
    locked_s: f64,
    phase_s: f64,
    code_s: f64,
    hist: Hist,
    pll: Welford,
    dll: Welford,
    prev_locked: Option<bool>,
    ever_locked: bool,
    last_t: Option<f64>,
    loss_count: u32,
    reacq_count: u32,
    // False lock.
    fl_run: u32,
    fl_in_episode: bool,
    fl_episodes: u32,
}

impl SatScorer {
    /// A scorer for satellite `id` of `signal` (chip rate `chip_rate_hz`) under `tc`.
    pub fn new(
        tc: &TestConditions,
        signal: &str,
        id: i64,
        chip_rate_hz: f64,
        cfg: &ScoringConfig,
    ) -> Self {
        let nominal_cn0_dbhz = tc
            .expected
            .iter()
            .find(|g| g.signal == signal && g.ids.contains(&id))
            .and_then(|g| g.nominal_cn0_dbhz);
        let events = tc
            .events_for(id)
            .into_iter()
            .map(|ev| EventAcc {
                ev: ev.clone(),
                baseline_hist: Hist::new(),
                baseline_pll: Welford::default(),
                baseline_dll: Welford::default(),
                locked_at_onset: None,
                loss_t: None,
                relock_t: None,
                in_s: 0.0,
                in_locked_s: 0.0,
                pll: Welford::default(),
                dll: Welford::default(),
                false_locks: 0,
                bins: BTreeMap::new(),
            })
            .collect();
        Self {
            signal: signal.to_string(),
            id,
            chip_rate_hz,
            nominal_cn0_dbhz,
            settle_s: tc.recording.settle_s,
            cfg: cfg.clone(),
            events,
            scored_s: 0.0,
            locked_s: 0.0,
            phase_s: 0.0,
            code_s: 0.0,
            hist: Hist::new(),
            pll: Welford::default(),
            dll: Welford::default(),
            prev_locked: None,
            ever_locked: false,
            last_t: None,
            loss_count: 0,
            reacq_count: 0,
            fl_run: 0,
            fl_in_episode: false,
            fl_episodes: 0,
        }
    }

    /// Feed one loop update. `truth_doppler_hz` is the true Doppler at `e.t_s`, when known.
    pub fn push(&mut self, e: &ScoreEpoch, truth_doppler_hz: Option<f64>) {
        let t = e.t_s;
        let dt = e.t_coh_s.max(0.0);
        let transition = self.prev_locked.map(|p| (p, e.locked));
        let lost_now = transition == Some((true, false));
        let relocked_now = transition == Some((false, true));
        if lost_now {
            self.loss_count += 1;
        }
        if relocked_now && self.ever_locked {
            self.reacq_count += 1;
        }
        self.ever_locked |= e.locked;
        self.prev_locked = Some(e.locked);
        self.last_t = Some(self.last_t.map_or(t, |l| l.max(t)));

        let new_episode = self.false_lock_update(e, truth_doppler_hz);
        let in_any_event = self.events.iter().any(|a| a.ev.contains(t));

        if t >= self.settle_s {
            self.scored_s += dt;
            if e.locked {
                self.locked_s += dt;
            }
            if e.phase_lock {
                self.phase_s += dt;
            }
            if e.code_lock {
                self.code_s += dt;
            }
            if e.locked && !in_any_event {
                if let Some(c) = e.cn0_dbhz {
                    self.hist.push(c);
                }
                self.pll.push(e.pll_rad.to_degrees());
                self.dll.push(e.dll_chips);
            }
        }

        let (bw, grace, bin_w) = (
            self.cfg.baseline_window_s,
            self.cfg.reacq_grace_s,
            self.cfg.js_bin_db,
        );
        for a in &mut self.events {
            let (on, off) = (a.ev.onset_s, a.ev.offset_s);
            // Baseline window.
            if t >= on - bw && t < on && t >= self.settle_s && e.locked {
                if let Some(c) = e.cn0_dbhz {
                    a.baseline_hist.push(c);
                }
                a.baseline_pll.push(e.pll_rad.to_degrees());
                a.baseline_dll.push(e.dll_chips);
            }
            if t >= on && a.locked_at_onset.is_none() {
                a.locked_at_onset = Some(e.locked);
            }
            // Loss and relock.
            if t >= on && t <= off + grace {
                if a.loss_t.is_none() && a.locked_at_onset == Some(true) && lost_now {
                    a.loss_t = Some(t);
                }
                // Relock counts from max(offset, loss); a channel unlocked at the onset
                // counts from the offset.
                let from = match (a.loss_t, a.locked_at_onset) {
                    (Some(l), _) => Some(l.max(off)),
                    (None, Some(false)) => Some(off),
                    _ => None,
                };
                if a.relock_t.is_none() && e.locked && from.is_some_and(|f| t >= f) {
                    a.relock_t = Some(t);
                }
            }
            // Event window.
            if a.ev.contains(t) {
                a.in_s += dt;
                if new_episode {
                    a.false_locks += 1;
                }
                if e.locked {
                    a.in_locked_s += dt;
                    a.pll.push(e.pll_rad.to_degrees());
                    a.dll.push(e.dll_chips);
                    if let (Some(c), Some(js)) = (e.cn0_dbhz, a.ev.js_db_at(t)) {
                        if js.is_finite() {
                            let k = (js / bin_w).round() as i64;
                            a.bins.entry(k).or_insert_with(Hist::new).push(c);
                        }
                    }
                }
            }
        }
    }

    /// Update the false-lock state; returns whether a new episode began on this update.
    fn false_lock_update(&mut self, e: &ScoreEpoch, truth: Option<f64>) -> bool {
        let thr = self
            .cfg
            .false_lock_doppler_hz
            .unwrap_or_else(|| 1.0 / (4.0 * e.t_coh_s.max(1e-6)));
        let off_truth = truth.is_some_and(|d| (e.doppler_hz - d).abs() > thr);
        if !e.locked {
            self.fl_run = 0;
            self.fl_in_episode = false;
            return false;
        }
        if e.false_lock_flag {
            // The tracker's detector reports one episode per firing.
            self.fl_episodes += 1;
            self.fl_in_episode = true;
            return true;
        }
        if off_truth {
            self.fl_run += 1;
            if !self.fl_in_episode && self.fl_run >= self.cfg.false_lock_min_epochs {
                self.fl_in_episode = true;
                self.fl_episodes += 1;
                return true;
            }
        } else {
            self.fl_run = 0;
            self.fl_in_episode = false;
        }
        false
    }

    /// The figures, for a stream that ended at `end_s`. Time after the last update (a
    /// channel that was retired, stopped or never started) counts as unlocked, in the
    /// whole run and in every event window it overlaps.
    pub fn finish(mut self, end_s: f64) -> SatScore {
        let from = self.last_t.unwrap_or(0.0);
        let whole_from = from.max(self.settle_s);
        if end_s > whole_from {
            self.scored_s += end_s - whole_from;
        }
        for a in &mut self.events {
            let lo = from.max(a.ev.onset_s);
            let hi = end_s.min(a.ev.offset_s);
            if hi > lo {
                a.in_s += hi - lo;
            }
        }
        let ratio = |a: f64, b: f64| (b > 0.0).then(|| a / b);
        let whole_run = WholeRunScore {
            scored_s: self.scored_s,
            locked_s: self.locked_s,
            availability: ratio(self.locked_s, self.scored_s),
            phase_lock_frac: ratio(self.phase_s, self.scored_s),
            code_lock_frac: ratio(self.code_s, self.scored_s),
            median_cn0_dbhz: self.hist.median(),
            pll_jitter_deg: self.pll.std(),
            dll_jitter_chips: self.dll.std(),
            false_lock_episodes: self.fl_episodes,
            false_lock_per_hour: ratio(self.fl_episodes as f64 * 3600.0, self.locked_s),
            loss_count: self.loss_count,
            reacq_count: self.reacq_count,
        };
        let (chip_rate, nominal, cfg) = (self.chip_rate_hz, self.nominal_cn0_dbhz, &self.cfg);
        let events = self
            .events
            .into_iter()
            .map(|a| finish_event(a, chip_rate, nominal, cfg))
            .collect();
        SatScore {
            signal: self.signal,
            id: self.id,
            whole_run,
            events,
        }
    }
}

/// The `Q` the MODELLED reference uses for an event, and where it came from; `None` for a
/// type with no stated spectral-separation factor (pulsed, chirp, spoofing, ...) and no
/// override.
pub fn reference_q(ev: &Event) -> Option<(f64, &'static str)> {
    use super::conditions::EventType as T;
    if let Some(q) = ev.q {
        return Some((q, "event-override"));
    }
    match ev.event_type {
        T::Cw | T::Narrowband | T::Broadband | T::Swept => {
            Some((q_factor(ev.event_type.name(), None), "type-table"))
        }
        _ => None,
    }
}

fn finish_event(
    a: EventAcc,
    chip_rate_hz: f64,
    nominal: Option<f64>,
    cfg: &ScoringConfig,
) -> EventScore {
    let measured_base = a.baseline_hist.median();
    let (baseline, source) = match (measured_base, nominal) {
        (Some(b), _) => (Some(b), Some("measured".to_string())),
        (None, Some(n)) => (Some(n), Some("stated-nominal".to_string())),
        (None, None) => (None, None),
    };
    let model = if cfg.reference_curve && a.ev.power.is_some() {
        reference_q(&a.ev)
    } else {
        None
    };
    let cn0_curve = a
        .bins
        .iter()
        .map(|(&k, h)| {
            let js = k as f64 * cfg.js_bin_db;
            let measured = h.median();
            let modelled = match (model, baseline) {
                (Some((q, _)), Some(b)) => Some(effective_cn0_dbhz(b, js, q, chip_rate_hz)),
                _ => None,
            };
            let deg = |x: Option<f64>| baseline.zip(x).map(|(b, x)| b - x);
            Cn0Bin {
                js_db: js,
                n: h.n,
                measured_cn0_dbhz: measured,
                measured_degradation_db: deg(measured),
                modelled_cn0_dbhz: modelled,
                modelled_degradation_db: deg(modelled),
            }
        })
        .collect();
    let lost = a.loss_t.is_some();
    EventScore {
        event_id: a.ev.id.clone(),
        kind: a.ev.kind,
        event_type: a.ev.event_type.name().to_string(),
        onset_s: a.ev.onset_s,
        offset_s: a.ev.offset_s,
        locked_at_onset: a.locked_at_onset == Some(true),
        lost,
        time_to_loss_s: a.loss_t.map(|l| l - a.ev.onset_s),
        js_at_loss_db: a.loss_t.and_then(|l| a.ev.js_db_at(l)),
        reacquired: a.relock_t.is_some(),
        reacq_time_s: a.relock_t.map(|r| r - a.ev.offset_s),
        outage_s: a.relock_t.zip(a.loss_t).map(|(r, l)| r - l),
        availability: (a.in_s > 0.0).then(|| a.in_locked_s / a.in_s),
        baseline_cn0_dbhz: baseline,
        baseline_source: source,
        baseline_pll_jitter_deg: a.baseline_pll.std(),
        baseline_dll_jitter_chips: a.baseline_dll.std(),
        pll_jitter_deg: a.pll.std(),
        dll_jitter_chips: a.dll.std(),
        false_lock_episodes: a.false_locks,
        cn0_curve,
        modelled: model
            .filter(|_| baseline.is_some())
            .map(|(q, src)| ModelledReference {
                label: MODELLED.into(),
                q,
                q_source: src.into(),
                chip_rate_hz,
                formula: REFERENCE_FORMULA.into(),
            }),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn tc() -> TestConditions {
        TestConditions::parse(
            r#"
schema = "kshana.test-conditions/1"
[recording]
id = "r"
path = "r.bin"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [5]
nominal_cn0_dbhz = 45.0
[[event]]
id = "e1"
kind = "interference"
type = "broadband"
onset_s = 20.0
offset_s = 40.0
[event.power]
quantity = "js_db"
interpolation = "step"
points = [[20.0, 30.0], [30.0, 40.0]]
"#,
        )
        .unwrap()
    }

    fn ep(t: f64, locked: bool, cn0: f64) -> ScoreEpoch {
        ScoreEpoch {
            t_s: t,
            t_coh_s: 0.001,
            locked,
            phase_lock: locked,
            code_lock: locked,
            cn0_dbhz: Some(cn0),
            pll_rad: 0.0,
            dll_chips: 0.0,
            doppler_hz: 0.0,
            false_lock_flag: false,
        }
    }

    #[test]
    fn loss_reacquisition_and_availability_follow_the_lock_timeline() {
        let cfg = ScoringConfig::default();
        let mut s = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg);
        // 0-60 s at 1 ms: locked until 33 s, unlocked until 42.5 s, locked again.
        for i in 0..60_000 {
            let t = i as f64 * 1e-3;
            let locked = !(33.0..42.5).contains(&t);
            s.push(&ep(t, locked, 45.0), None);
        }
        let r = s.finish(60.0);
        let e = &r.events[0];
        assert!(e.lost && e.reacquired && e.locked_at_onset);
        assert!((e.time_to_loss_s.unwrap() - 13.0).abs() < 1e-6);
        assert_eq!(e.js_at_loss_db, Some(40.0));
        assert!((e.reacq_time_s.unwrap() - 2.5).abs() < 1e-6);
        assert!((e.outage_s.unwrap() - 9.5).abs() < 1e-6);
        assert!((e.availability.unwrap() - 13.0 / 20.0).abs() < 1e-3);
        assert_eq!(r.whole_run.loss_count, 1);
        assert_eq!(r.whole_run.reacq_count, 1);
        assert!((r.whole_run.availability.unwrap() - (59.0 - 9.5) / 59.0).abs() < 1e-3);
        assert_eq!(e.baseline_source.as_deref(), Some("measured"));
    }

    #[test]
    fn degradation_bins_match_measured_and_modelled_values() {
        let cfg = ScoringConfig::default();
        let mut s = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg);
        let q = q_factor("broadband", None);
        let model = |js: f64| effective_cn0_dbhz(45.0, js, q, 1.023e6);
        for i in 0..50_000 {
            let t = i as f64 * 1e-3;
            let cn0 = if (20.0..40.0).contains(&t) {
                model(if t < 30.0 { 30.0 } else { 40.0 })
            } else {
                45.0
            };
            s.push(&ep(t, true, cn0), None);
        }
        let e = &s.finish(60.0).events[0];
        assert_eq!(e.cn0_curve.len(), 2);
        for b in &e.cn0_curve {
            let m = b.measured_cn0_dbhz.unwrap();
            assert!((m - model(b.js_db)).abs() <= HIST_RES_DB, "{b:?}");
            assert!(
                (b.modelled_cn0_dbhz.unwrap() - effective_cn0_dbhz(45.025, b.js_db, q, 1.023e6))
                    .abs()
                    < 1e-9
            );
        }
        let m = e.modelled.as_ref().unwrap();
        assert_eq!(m.label, MODELLED);
        assert_eq!(m.q_source, "type-table");
    }

    #[test]
    fn false_lock_episodes_from_truth_and_from_the_tracker_flag() {
        let cfg = ScoringConfig::default();
        let mut s = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg);
        for i in 0..10_000 {
            let t = i as f64 * 1e-3;
            let mut e = ep(t, true, 45.0);
            // Off truth by 500 Hz for 2-3 s and 5-6 s: two episodes.
            if (2.0..3.0).contains(&t) || (5.0..6.0).contains(&t) {
                e.doppler_hz = 500.0;
            }
            e.false_lock_flag = (t - 8.0).abs() < 1e-9;
            s.push(&e, Some(0.0));
        }
        let r = s.finish(60.0);
        assert_eq!(r.whole_run.false_lock_episodes, 3);
        assert!(r.whole_run.false_lock_per_hour.unwrap() > 0.0);
    }

    #[test]
    fn time_after_the_last_update_counts_as_unlocked() {
        let cfg = ScoringConfig::default();
        let mut s = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg);
        // Locked from 0 to 25 s, then the channel stops (retired) in a 60 s stream.
        for i in 0..25_000 {
            s.push(&ep(i as f64 * 1e-3, true, 45.0), None);
        }
        let r = s.finish(60.0);
        let a = r.whole_run.availability.unwrap();
        assert!((a - 24.0 / 59.0).abs() < 1e-3, "{a}");
        let e = &r.events[0];
        assert!((e.availability.unwrap() - 0.25).abs() < 1e-3, "{e:?}");
        assert!(
            !e.lost && !e.reacquired,
            "a stopped channel records no transition"
        );
        // A channel that never started is unavailable for the whole scored time.
        let none = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg).finish(60.0);
        assert_eq!(none.whole_run.availability, Some(0.0));
        assert_eq!(none.events[0].availability, Some(0.0));
    }

    #[test]
    fn jitter_is_the_sample_std_of_locked_discriminators() {
        let cfg = ScoringConfig::default();
        let mut s = SatScorer::new(&tc(), "gps-l1ca", 5, 1.023e6, &cfg);
        for i in 0..10_000 {
            let t = i as f64 * 1e-3;
            let mut e = ep(t, true, 45.0);
            let sgn = if i % 2 == 0 { 1.0 } else { -1.0 };
            e.pll_rad = sgn * 0.1;
            e.dll_chips = sgn * 0.01;
            s.push(&e, None);
        }
        let r = s.finish(60.0);
        assert!((r.whole_run.pll_jitter_deg.unwrap() - 0.1f64.to_degrees()).abs() < 1e-3);
        assert!((r.whole_run.dll_jitter_chips.unwrap() - 0.01).abs() < 1e-5);
    }
}
