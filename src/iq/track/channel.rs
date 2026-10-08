// SPDX-License-Identifier: AGPL-3.0-only
//! One tracking channel: correlators, NCOs and the per-channel bookkeeping around
//! [`LoopCore`].

use super::cn0::{
    beaulieu_cn0_from_term, beaulieu_term, nwpr_cn0_from_ratio, nwpr_power_ratio,
    phase_lock_indicator, BitSync,
};
use super::{Discriminators, FllAssist, LoopConfig, LoopCore};
use crate::iq::acq::AcqResult;
use crate::iq::{Cf64, SampleSpec, SpreadingCode};
use crate::portable_math::PortableFloat;
use std::collections::VecDeque;
use std::f64::consts::TAU;
use std::sync::Arc;

/// Weight of each new window in the smoothed phase lock indicator.
const PLI_SMOOTHING: f64 = 0.25;

/// What a channel tracks and where it starts.
#[derive(Clone)]
pub struct ChannelInit {
    /// The code to track.
    pub code: Arc<dyn SpreadingCode + Send + Sync>,
    /// Code phase of the signal at the first sample of the stream (chips).
    pub code_phase_chips: f64,
    /// Carrier Doppler at the start (Hz, relative to the intermediate frequency).
    pub doppler_hz: f64,
    /// Code periods per data bit (`None` for a data-free signal).
    pub periods_per_bit: Option<usize>,
}

impl std::fmt::Debug for ChannelInit {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("ChannelInit")
            .field("code", &self.code.name())
            .field("code_phase_chips", &self.code_phase_chips)
            .field("doppler_hz", &self.doppler_hz)
            .field("periods_per_bit", &self.periods_per_bit)
            .finish()
    }
}

impl ChannelInit {
    /// Start from an acquisition `r` of `code` whose first searched sample was stream
    /// sample `start_sample` of a stream sampled as `spec`: the code phase is carried back
    /// to stream sample 0 at the acquired Doppler's code rate.
    pub fn from_acquisition(
        code: Arc<dyn SpreadingCode + Send + Sync>,
        r: &AcqResult,
        spec: &SampleSpec,
        start_sample: u64,
        periods_per_bit: Option<usize>,
    ) -> Self {
        let rate = code.chip_rate_hz() * (1.0 + r.doppler_hz / code.carrier_hz());
        let len = code.len_chips() as f64;
        let phase0 = (r.code_phase_chips - start_sample as f64 * rate / spec.fs_hz).rem_euclid(len);
        Self {
            code,
            code_phase_chips: phase0,
            doppler_hz: r.doppler_hz,
            periods_per_bit,
        }
    }
}

/// The output of one loop update of one channel.
#[derive(Clone, Debug, PartialEq)]
pub struct EpochOutput {
    /// Loop update index (0-based).
    pub epoch: u64,
    /// Stream index of the sample that begins the next code period (the first sample after
    /// this integration).
    pub sample_index: u64,
    /// Time (s from stream start) at which the replica's code phase crossed zero, ending
    /// this integration: the receive time of the code epoch, to fractional-sample
    /// resolution.
    pub code_epoch_s: f64,
    /// Integration time of this update (s).
    pub t_coh_s: f64,
    /// Code periods integrated.
    pub periods: usize,
    /// Early correlation.
    pub early: Cf64,
    /// Prompt correlation.
    pub prompt: Cf64,
    /// Late correlation.
    pub late: Cf64,
    /// Discriminator outputs.
    pub disc: Discriminators,
    /// Carrier Doppler the NCO is set to after the update (Hz).
    pub doppler_hz: f64,
    /// Carrier NCO phase at the end of the integration (cycles, accumulated from the
    /// start, including the intermediate frequency).
    pub carrier_phase_cycles: f64,
    /// Code rate the NCO is set to after the update (chips/s).
    pub code_rate_hz: f64,
    /// Replica code phase at `sample_index` (chips).
    pub code_phase_chips: f64,
    /// Smoothed phase lock indicator (`cos 2φ`).
    pub pli: f64,
    /// Whether `pli` is above the configured threshold.
    pub phase_lock: bool,
    /// Whether the latest NWPR C/N0 is at or above the configured threshold.
    pub code_lock: bool,
    /// Latest NWPR C/N0 estimate (dB-Hz), once `M` windows are in.
    pub cn0_nwpr_dbhz: Option<f64>,
    /// Latest Beaulieu C/N0 estimate (dB-Hz), once `M` window pairs are in.
    pub cn0_beaulieu_dbhz: Option<f64>,
    /// Bit edge phase (period index modulo bit length) once synchronised.
    pub bit_edge: Option<usize>,
    /// The sign of a data bit completed since the previous update (`±1`, with the Costas
    /// loop's 180° ambiguity).
    pub bit: Option<i8>,
    /// Whether the FLL path fed this update (see [`FllAssist`]).
    pub fll_active: bool,
    /// The extra correlator taps (`extra_taps_chips`), as `(offset, value)` in design
    /// order: the correlation with the replica `offset` chips ahead of the prompt (a
    /// positive offset is early), over the same span as `early`/`prompt`/`late`. Empty
    /// when the design has no taps.
    pub extra: Vec<(f64, Cf64)>,
}

/// The most extra correlator taps a design may ask for.
pub const MAX_EXTRA_TAPS: usize = 16;
/// The largest extra-tap offset magnitude (chips).
pub const MAX_TAP_OFFSET_CHIPS: f64 = 2.0;

/// One tracking channel.
pub struct Channel {
    code: Arc<dyn SpreadingCode + Send + Sync>,
    core: LoopCore,
    fs: f64,
    if_hz: f64,
    len: f64,
    half_d: f64,
    taps: Vec<f64>,
    extra_acc: Vec<Cf64>,
    extra_block: Vec<Cf64>,
    ppb: Option<usize>,
    // NCOs.
    code_phase: f64,
    dcode: f64,
    carrier_phase: f64,
    lo: Cf64,
    lo_step: Cf64,
    // Per-period correlators.
    acc: [Cf64; 3],
    n_in_period: u64,
    partial: bool,
    // Per-block accumulation.
    block: [Cf64; 3],
    block_periods: usize,
    block_samples: u64,
    // Bookkeeping.
    sample_index: u64,
    period_index: u64,
    epoch: u64,
    bitsync: Option<BitSync>,
    window: Vec<Cf64>,
    window_len: usize,
    pli: f64,
    fll_gate_since: Option<f64>,
    nwpr: VecDeque<f64>,
    beaulieu: VecDeque<f64>,
    prev_window_sum: Option<Cf64>,
    cn0_nwpr: Option<f64>,
    cn0_beaulieu: Option<f64>,
    pending_bit: Option<i8>,
}

impl std::fmt::Debug for Channel {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        f.debug_struct("Channel")
            .field("code", &self.code.name())
            .field("label", &self.core.config().label)
            .field("sample_index", &self.sample_index)
            .field("epoch", &self.epoch)
            .finish()
    }
}

impl Channel {
    /// A channel on a stream sampled as `spec`, tracking `init` with loop design `cfg`.
    pub fn new(spec: &SampleSpec, init: &ChannelInit, cfg: &LoopConfig) -> Result<Self, String> {
        let code = init.code.clone();
        if spec.fs_hz.is_nan() || spec.fs_hz <= 0.0 {
            return Err("sample rate must be positive".into());
        }
        if cfg.coherent_periods == 0 {
            return Err("coherent_periods must be positive".into());
        }
        if cfg.cn0_windows == 0 {
            return Err("cn0_windows must be positive".into());
        }
        if let Some(ppb) = init.periods_per_bit {
            if ppb == 0 || ppb % cfg.coherent_periods != 0 {
                return Err(format!(
                    "coherent_periods {} must divide the bit length {ppb}",
                    cfg.coherent_periods
                ));
            }
        }
        if cfg.extra_taps_chips.len() > MAX_EXTRA_TAPS {
            return Err(format!(
                "at most {MAX_EXTRA_TAPS} extra taps are supported (got {})",
                cfg.extra_taps_chips.len()
            ));
        }
        if let Some(t) = cfg
            .extra_taps_chips
            .iter()
            .find(|t| !(t.is_finite() && t.abs() <= MAX_TAP_OFFSET_CHIPS))
        {
            return Err(format!(
                "extra tap offsets must be finite and within ±{MAX_TAP_OFFSET_CHIPS} chips (got {t})"
            ));
        }
        let core = LoopCore::new(cfg, code.chip_rate_hz(), code.carrier_hz(), init.doppler_hz)?;
        let len = code.len_chips() as f64;
        let window_len = match init.periods_per_bit {
            Some(ppb) if ppb > 1 => ppb,
            _ => cfg.cn0_window_periods,
        };
        if window_len < 2 {
            return Err("a C/N0 window needs at least 2 prompts".into());
        }
        let mut ch = Self {
            core,
            fs: spec.fs_hz,
            if_hz: spec.if_hz,
            len,
            half_d: 0.5 * cfg.spacing_chips,
            taps: cfg.extra_taps_chips.clone(),
            extra_acc: vec![Cf64::default(); cfg.extra_taps_chips.len()],
            extra_block: vec![Cf64::default(); cfg.extra_taps_chips.len()],
            ppb: init.periods_per_bit.filter(|&p| p > 1),
            code_phase: init.code_phase_chips.rem_euclid(len),
            dcode: 0.0,
            carrier_phase: 0.0,
            lo: Cf64::new(1.0, 0.0),
            lo_step: Cf64::new(1.0, 0.0),
            acc: [Cf64::default(); 3],
            n_in_period: 0,
            partial: true,
            block: [Cf64::default(); 3],
            block_periods: 0,
            block_samples: 0,
            sample_index: 0,
            period_index: 0,
            epoch: 0,
            bitsync: init
                .periods_per_bit
                .filter(|&p| p > 1)
                .map(|p| BitSync::new(p, cfg.bit_sync)),
            window: Vec::with_capacity(window_len),
            window_len,
            pli: 0.0,
            fll_gate_since: None,
            nwpr: VecDeque::new(),
            beaulieu: VecDeque::new(),
            prev_window_sum: None,
            cn0_nwpr: None,
            cn0_beaulieu: None,
            pending_bit: None,
            code,
        };
        ch.set_ncos();
        Ok(ch)
    }

    /// A channel that joins the stream at absolute sample `start_sample` (its first loop
    /// update numbered `first_epoch`), tracking `init`, whose code phase is given at stream
    /// sample 0 (as [`ChannelInit::from_acquisition`] returns it). The code phase is carried
    /// forward to `start_sample` at the hand-off Doppler's code rate; the carrier NCO starts
    /// at phase 0 there. Re-acquisition uses it to restart a channel mid-stream.
    pub fn new_at(
        spec: &SampleSpec,
        init: &ChannelInit,
        cfg: &LoopConfig,
        start_sample: u64,
        first_epoch: u64,
    ) -> Result<Self, String> {
        let mut ch = Self::new(spec, init, cfg)?;
        let rate = ch.code.chip_rate_hz() * (1.0 + init.doppler_hz / ch.code.carrier_hz());
        ch.code_phase =
            (init.code_phase_chips + start_sample as f64 * rate / spec.fs_hz).rem_euclid(ch.len);
        ch.sample_index = start_sample;
        ch.epoch = first_epoch;
        Ok(ch)
    }

    /// The loop core (filters and NCO settings).
    pub fn core(&self) -> &LoopCore {
        &self.core
    }

    /// Stream samples consumed so far.
    pub fn samples_consumed(&self) -> u64 {
        self.sample_index
    }

    fn set_ncos(&mut self) {
        self.dcode = self.core.code_rate_hz() / self.fs;
        let f = self.if_hz + self.core.doppler_hz();
        let (s, c) = (-TAU * self.carrier_phase.fract()).psin_cos();
        self.lo = Cf64::new(c, s);
        let (s, c) = (-TAU * f / self.fs).psin_cos();
        self.lo_step = Cf64::new(c, s);
    }

    /// Correlate the next `samples` of the stream, appending an [`EpochOutput`] to `out`
    /// for every loop update completed.
    pub fn process(&mut self, samples: &[Cf64], out: &mut Vec<EpochOutput>) {
        for &s in samples {
            if self.code_phase >= self.len {
                self.code_phase -= self.len;
                self.end_period(out);
            }
            let x = s * self.lo;
            let p = self.code_phase;
            let ce = self.code.value_at(p + self.half_d);
            let cp = self.code.value_at(p);
            let cl = self.code.value_at(p - self.half_d);
            self.acc[0] = self.acc[0] + x * ce;
            self.acc[1] = self.acc[1] + x * cp;
            self.acc[2] = self.acc[2] + x * cl;
            for (a, &off) in self.extra_acc.iter_mut().zip(&self.taps) {
                *a = *a + x * self.code.value_at(p + off);
            }
            self.lo = self.lo * self.lo_step;
            self.code_phase += self.dcode;
            self.n_in_period += 1;
            self.sample_index += 1;
        }
    }

    fn end_period(&mut self, out: &mut Vec<EpochOutput>) {
        let n = self.n_in_period;
        let f = self.if_hz + self.core.doppler_hz();
        self.carrier_phase += n as f64 * f / self.fs;
        let [e, p, l] = std::mem::take(&mut self.acc);
        self.n_in_period = 0;
        if self.partial {
            self.partial = false;
            self.extra_acc.fill(Cf64::default());
            self.set_ncos();
            return;
        }
        for (b, a) in self.extra_block.iter_mut().zip(self.extra_acc.iter_mut()) {
            *b = *b + std::mem::take(a);
        }
        for (b, v) in self.block.iter_mut().zip([e, p, l]) {
            *b = *b + v;
        }
        self.block_periods += 1;
        self.block_samples += n;
        let k = self.period_index;
        self.period_index += 1;

        // Bit synchronisation.
        let mut edge = self.bitsync.as_ref().and_then(BitSync::edge);
        if edge.is_none() {
            if let Some(bs) = self.bitsync.as_mut() {
                edge = bs.push(k, p);
                if edge.is_some() {
                    self.window.clear();
                    self.nwpr.clear();
                    self.beaulieu.clear();
                    self.prev_window_sum = None;
                }
            }
        }
        self.window_step(k, p, edge);

        let close = match (self.ppb, edge) {
            (Some(ppb), Some(edge)) => {
                let rel = (k + 1 + ppb as u64 - edge as u64) % ppb as u64;
                rel % self.core.config().coherent_periods as u64 == 0
            }
            (Some(_), None) => true,
            (None, _) => self.block_periods >= self.core.config().coherent_periods,
        };
        if close {
            let t = self.block_samples as f64 / self.fs;
            let code_epoch_s = (self.sample_index as f64 - self.code_phase / self.dcode) / self.fs;
            let [be, bp, bl] = std::mem::take(&mut self.block);
            let extra: Vec<(f64, Cf64)> = self
                .taps
                .iter()
                .zip(self.extra_block.iter_mut())
                .map(|(&off, b)| (off, std::mem::take(b)))
                .collect();
            self.fll_gate_step();
            let fll_active = self.core.fll_enabled();
            let disc = self.core.update(be, bp, bl, t);
            let cfg = self.core.config();
            out.push(EpochOutput {
                epoch: self.epoch,
                sample_index: self.sample_index,
                code_epoch_s,
                t_coh_s: t,
                periods: self.block_periods,
                early: be,
                prompt: bp,
                late: bl,
                disc,
                doppler_hz: self.core.doppler_hz(),
                carrier_phase_cycles: self.carrier_phase,
                code_rate_hz: self.core.code_rate_hz(),
                code_phase_chips: self.code_phase,
                pli: self.pli,
                phase_lock: self.pli >= cfg.pli_threshold,
                code_lock: self.cn0_nwpr.is_some_and(|c| c >= cfg.code_lock_cn0_dbhz),
                cn0_nwpr_dbhz: self.cn0_nwpr,
                cn0_beaulieu_dbhz: self.cn0_beaulieu,
                bit_edge: edge,
                bit: self.pending_bit.take(),
                fll_active,
                extra,
            });
            self.epoch += 1;
            self.block_periods = 0;
            self.block_samples = 0;
        }
        self.set_ncos();
    }

    /// The FLL/PLL hand-over of [`FllAssist::PullIn`] on an FLL-assisted PLL: switch the
    /// FLL path off once the smoothed PLI has held at or above `off_pli` for the dwell, back
    /// on once it has held below `on_pli` for the dwell.
    fn fll_gate_step(&mut self) {
        let gate = match self.core.config().fll_assist {
            FllAssist::PullIn(g) => g,
            FllAssist::Always => return,
        };
        if !(self.core.config().carrier.has_pll() && self.core.config().carrier.has_fll()) {
            return;
        }
        let now = self.sample_index as f64 / self.fs;
        let on = self.core.fll_enabled();
        let wants_change = if on {
            self.pli >= gate.off_pli
        } else {
            self.pli < gate.on_pli
        };
        if !wants_change {
            self.fll_gate_since = None;
            return;
        }
        let since = *self.fll_gate_since.get_or_insert(now);
        if now - since >= gate.dwell_s {
            self.core.set_fll_enabled(!on);
            self.fll_gate_since = None;
        }
    }

    /// Window bookkeeping for the lock indicator, the C/N0 estimators and the bits.
    fn window_step(&mut self, k: u64, p: Cf64, edge: Option<usize>) {
        self.window.push(p);
        let (closes, valid) = match (self.ppb, edge) {
            (Some(ppb), Some(edge)) => {
                let last = (k + 1 + ppb as u64 - edge as u64) % ppb as u64 == 0;
                (last, last && self.window.len() == self.window_len)
            }
            (Some(_), None) => (self.window.len() >= self.window_len, false),
            (None, _) => {
                let full = self.window.len() >= self.window_len;
                (full, full)
            }
        };
        if !closes {
            return;
        }
        if self.window.len() == self.window_len {
            let pli = phase_lock_indicator(&self.window);
            self.pli += PLI_SMOOTHING * (pli - self.pli);
        }
        if valid {
            let m = self.core.config().cn0_windows;
            let period_s = self.code.period_s();
            if let Some(r) = nwpr_power_ratio(&self.window) {
                self.nwpr.push_back(r);
                if self.nwpr.len() > m {
                    self.nwpr.pop_front();
                }
                if self.nwpr.len() == m {
                    let mu = self.nwpr.iter().sum::<f64>() / m as f64;
                    self.cn0_nwpr = nwpr_cn0_from_ratio(mu, self.window_len, period_s);
                }
            }
            let sum = self.window.iter().fold(Cf64::default(), |a, &v| a + v);
            if let Some(prev) = self.prev_window_sum {
                if let Some(term) = beaulieu_term(prev, sum) {
                    self.beaulieu.push_back(term);
                    if self.beaulieu.len() > m {
                        self.beaulieu.pop_front();
                    }
                    if self.beaulieu.len() == m {
                        let mean = self.beaulieu.iter().sum::<f64>() / m as f64;
                        self.cn0_beaulieu =
                            beaulieu_cn0_from_term(mean, self.window_len as f64 * period_s);
                    }
                }
            }
            self.prev_window_sum = Some(sum);
            if self.ppb.is_some() {
                self.pending_bit = Some(if sum.re >= 0.0 { 1 } else { -1 });
            }
        }
        self.window.clear();
    }
}
