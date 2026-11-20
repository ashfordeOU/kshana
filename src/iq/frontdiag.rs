// SPDX-License-Identifier: AGPL-3.0-only
//! **SDR front-end diagnostics: what a recording says about the radio that made it.**
//!
//! Software-receiver users who record with low-cost front ends (PlutoSDR, USRP, LabSat and the
//! like) meet the same handful of faults again and again: a DC spike, an I/Q gain or phase
//! imbalance, clipping or too few quantisation levels in use, stretches of zeros where the host
//! dropped buffers, samples written twice, gain steps, a local-oscillator offset far beyond any
//! satellite Doppler, and a sample clock that does not agree with the oscillator. [`diagnose`]
//! reads a recording once, in bounded memory, and reports each as a measured number with the
//! threshold it was compared with, so a user can tell a front-end fault from a receiver fault
//! before tuning loops.
//!
//! What is measured, all on the samples as decoded (integers are not normalised, see
//! [`crate::iq::io::format`]):
//!
//! * **DC offset**: the mean of I and of Q, and its magnitude relative to the RMS amplitude.
//! * **I/Q imbalance**: gain ratio `10·log10(E[I²]/E[Q²])` dB and the quadrature skew
//!   `asin(E[IQ] / sqrt(E[I²]E[Q²]))` degrees, after the DC is removed. For a zero-IF recording of
//!   noise and GNSS signals (which sit below the noise) both are zero for a balanced front end.
//! * **Clipping**: the fraction of components at the format's extreme codes (integer formats of
//!   four or more bits), and the number of distinct I levels seen in the first samples with the
//!   bits that number spans.
//! * **Dropouts**: samples exactly zero in both components, and runs of at least
//!   [`DiagConfig::zero_run_min`] of them.
//! * **Repeated samples**: the fraction of samples equal to the one before (both components),
//!   against the fraction equal to the sample two, three and four before, which is the rate equal
//!   values occur by chance at this quantisation. An excess means samples were written twice; when
//!   the repeats fall on one position of a fixed period the period is reported (a recorder that
//!   repeats every eighth input sample writes nine samples per eight, one of them a repeat).
//! * **Gain steps**: changes of more than [`DiagConfig::gain_step_db`] in power between
//!   consecutive blocks of [`DiagConfig::block_s`].
//! * **Oscillator offset and clock consistency** (optional, with a spreading code): the codes are
//!   acquired ([`crate::iq::acq::acquire_peak`]). For a static receiver every satellite's Doppler
//!   lies within [`DiagConfig::max_sat_doppler_hz`] of the true carrier, so the measured Dopplers
//!   bound the receiver's own frequency offset to an interval (empty interval: the receiver is not
//!   static, or a detection is false). Each acquired code is then acquired again every
//!   [`DiagConfig::step_s`] around its Doppler; the drift of its code phase gives the code's rate
//!   against the sample clock, and the Doppler gives the carrier's. When the oscillator and the
//!   sample clock come from one reference the two agree (an oscillator offset moves both
//!   equally); a difference means the sample clock and the oscillator disagree, or samples were
//!   dropped or repeated, and is reported in parts per million.
//!
//! Every finding is a number against a stated threshold, not a verdict on the radio. MODELLED:
//! the measurements are checked on self-made fixtures with each fault injected
//! (`tests/iq_frontdiag.rs`), not on a set of real faulty recordings.

use super::acq::{acquire_peak, samples_needed, samples_per_period, AcqConfig};
use super::io::format::{Encoding, SampleFormat};
use super::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use serde::Serialize;

/// Settings of a diagnosis. [`DiagConfig::default`] gives the documented defaults.
#[derive(Clone, Debug, PartialEq)]
pub struct DiagConfig {
    /// Seconds of the recording read; `None` reads all of it.
    pub max_seconds: Option<f64>,
    /// Block length for the power series and gain steps, s (default 0.01).
    pub block_s: f64,
    /// Power change between consecutive blocks reported as a gain step, dB (default 3).
    pub gain_step_db: f64,
    /// A run of exactly-zero samples at least this long counts as a dropout (default 64).
    pub zero_run_min: usize,
    /// DC magnitude over RMS amplitude above which a DC offset is reported (default 0.05).
    pub dc_rel_max: f64,
    /// I/Q gain ratio above which an imbalance is reported, dB (default 0.5).
    pub iq_gain_db_max: f64,
    /// Quadrature skew above which an imbalance is reported, degrees (default 3).
    pub iq_phase_deg_max: f64,
    /// Fraction of clipped components above which clipping is reported (default 0.001).
    pub clip_frac_max: f64,
    /// Excess repeated-sample fraction above which repeats are reported (default 0.001), when it
    /// is also more than five binomial standard deviations above the chance rate.
    pub repeat_excess_min: f64,
    /// Largest Doppler of a satellite seen from a static receiver, Hz (default 5000).
    pub max_sat_doppler_hz: f64,
    /// Interval between the re-acquisitions of the clock check, s (default 0.2).
    pub step_s: f64,
    /// Re-acquisitions per code after the first (default 8).
    pub steps: usize,
    /// Code-against-carrier rate difference reported as a clock inconsistency, ppm (default 1).
    pub clock_mismatch_ppm_max: f64,
}

impl Default for DiagConfig {
    fn default() -> Self {
        Self {
            max_seconds: None,
            block_s: 0.01,
            gain_step_db: 3.0,
            zero_run_min: 64,
            dc_rel_max: 0.05,
            iq_gain_db_max: 0.5,
            iq_phase_deg_max: 3.0,
            clip_frac_max: 1e-3,
            repeat_excess_min: 1e-3,
            max_sat_doppler_hz: 5000.0,
            step_s: 0.2,
            steps: 8,
            clock_mismatch_ppm_max: 1.0,
        }
    }
}

/// Mean of each component and its size against the RMS amplitude.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct DcOffset {
    /// Mean of I.
    pub i: f64,
    /// Mean of Q.
    pub q: f64,
    /// `|mean| / RMS amplitude`.
    pub relative: f64,
}

/// I/Q gain and phase imbalance.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct IqImbalance {
    /// `10·log10(E[I²]/E[Q²])`, dB.
    pub gain_db: f64,
    /// Quadrature skew, degrees.
    pub phase_deg: f64,
}

/// Exactly-repeated samples.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Repeats {
    /// Fraction of samples equal to the one before.
    pub lag1_fraction: f64,
    /// Mean fraction equal to the sample two, three and four before (the chance rate).
    pub chance_fraction: f64,
    /// `lag1_fraction − chance_fraction`.
    pub excess_fraction: f64,
    /// The period, in samples, on whose one position the excess repeats fall, when there is one.
    pub period: Option<usize>,
}

/// A gain step between consecutive blocks.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GainStep {
    /// Start of the later block, s.
    pub t_s: f64,
    /// Power change, dB.
    pub change_db: f64,
}

/// One code's acquisition and clock-check result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CodeCheck {
    /// The code.
    pub code: String,
    /// Whether the first acquisition crossed its threshold.
    pub acquired: bool,
    /// Doppler of the first acquisition, Hz.
    pub doppler_hz: f64,
    /// Acquisition statistic over threshold.
    pub statistic_over_threshold: f64,
    /// Re-acquisitions that crossed the threshold and entered the fit.
    pub points: usize,
    /// Code rate against the sample clock, parts per million (from the code-phase drift).
    pub code_rate_ppm: Option<f64>,
    /// Carrier rate, parts per million (Doppler over carrier frequency).
    pub carrier_rate_ppm: f64,
    /// `code_rate_ppm − carrier_rate_ppm`.
    pub mismatch_ppm: Option<f64>,
}

/// Oscillator offset and clock consistency from acquired codes.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ClockCheck {
    /// Per code.
    pub codes: Vec<CodeCheck>,
    /// Interval holding the receiver's own frequency offset if it is static, Hz (`None` with no
    /// acquisition or an empty interval).
    pub offset_interval_hz: Option<[f64; 2]>,
    /// The same, parts per million of the carrier.
    pub offset_interval_ppm: Option<[f64; 2]>,
    /// Median of the codes' mismatches, ppm.
    pub mismatch_ppm: Option<f64>,
    /// Why the check did not run, as a stable code: `no-window` (the recording is shorter than
    /// one acquisition, or the sample rate holds no whole number of samples per code period).
    pub note: Option<String>,
}

/// A measured value that crossed its threshold.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Finding {
    /// Stable machine name: `dc-offset`, `iq-gain-imbalance`, `iq-phase-imbalance`, `clipping`,
    /// `dropouts`, `repeated-samples`, `gain-steps`, `oscillator-offset`, `clock-mismatch`,
    /// `no-acquisition`.
    pub code: String,
    /// The measured value.
    pub value: f64,
    /// The threshold it was compared with.
    pub threshold: f64,
}

/// What [`diagnose`] measured.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct FrontendDiagnosis {
    /// Always `MODELLED` (see the module note).
    pub evidence: String,
    /// Sample rate, Hz.
    pub sample_rate_hz: f64,
    /// Centre frequency, Hz (0 when unknown).
    pub center_hz: f64,
    /// Samples read.
    pub n_samples: u64,
    /// Seconds read.
    pub duration_s: f64,
    /// Mean power of the samples.
    pub mean_power: f64,
    /// DC offset.
    pub dc: DcOffset,
    /// I/Q imbalance.
    pub iq_imbalance: IqImbalance,
    /// Fraction of components at the format's extreme codes (`None` for float and 2-bit formats).
    pub clip_fraction: Option<f64>,
    /// Distinct I levels in the first samples.
    pub levels_used: usize,
    /// `log2` of [`FrontendDiagnosis::levels_used`].
    pub bits_used: f64,
    /// Fraction of samples exactly zero.
    pub zero_fraction: f64,
    /// Runs of at least [`DiagConfig::zero_run_min`] zeros.
    pub zero_runs: usize,
    /// Longest run of zeros, samples.
    pub longest_zero_run: usize,
    /// Repeated samples.
    pub repeats: Repeats,
    /// Gain steps (the first 100).
    pub gain_steps: Vec<GainStep>,
    /// Number of gain steps.
    pub n_gain_steps: usize,
    /// Oscillator and clock check, when codes were given.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub clock: Option<ClockCheck>,
    /// Values that crossed their thresholds.
    pub findings: Vec<Finding>,
}

/// The extreme codes of an integer format of four or more bits, as decoded.
fn extremes(f: SampleFormat) -> Option<(f64, f64)> {
    let signed = |n: i32| Some((-(2f64.powi(n - 1)), 2f64.powi(n - 1) - 1.0));
    let unsigned = |n: i32| Some((-(2f64.powi(n) - 1.0), 2f64.powi(n) - 1.0));
    match f.encoding {
        Encoding::I8 => signed(8),
        Encoding::I16Le | Encoding::I16Be => signed(16),
        Encoding::I12 { .. } => signed(12),
        Encoding::I4 { .. } => signed(4),
        Encoding::U4 { .. } => unsigned(4),
        Encoding::U8 => unsigned(8),
        Encoding::U12 { .. } => unsigned(12),
        Encoding::U16 { .. } => unsigned(16),
        _ => None,
    }
}

/// Samples whose distinct I levels are counted.
const LEVEL_SAMPLES: usize = 1 << 16;
/// Largest period searched for repeats.
const MAX_PERIOD: usize = 64;
/// Gain steps listed.
const MAX_STEPS_LISTED: usize = 100;
/// Samples read at a time.
const CHUNK: usize = 1 << 15;

/// Running sums of the streaming pass.
#[derive(Default)]
struct Acc {
    n: u64,
    si: f64,
    sq: f64,
    sii: f64,
    sqq: f64,
    siq: f64,
    clipped: u64,
    zeros: u64,
    zero_run: usize,
    zero_runs: usize,
    longest_zero: usize,
    lag: [u64; 4],
    hist: Vec<Vec<u64>>,
    prev: [Option<Cf64>; 4],
    levels: std::collections::BTreeSet<i64>,
    block_pow: f64,
    block_n: usize,
    last_block_pow: Option<f64>,
    steps: Vec<GainStep>,
    n_steps: usize,
}

/// Diagnose a recording: read up to `cfg.max_seconds` of `src` once, measuring the front-end
/// statistics, and, when `codes` is not empty, acquire each code at the start and every
/// [`DiagConfig::step_s`] after it for the oscillator and clock check. `format` is the recording's
/// sample format (for the clipping levels).
pub fn diagnose(
    src: &mut dyn IqSource,
    format: SampleFormat,
    codes: &[&dyn SpreadingCode],
    acq: &AcqConfig,
    cfg: &DiagConfig,
) -> Result<FrontendDiagnosis, IqError> {
    let spec = src.spec();
    let limit = cfg
        .max_seconds
        .map(|s| spec.samples_in(s) as u64)
        .unwrap_or(u64::MAX);
    let block_len = spec.samples_in(cfg.block_s).max(1);
    let ext = extremes(format);
    // The windows the clock check needs, gathered during the one pass.
    let plan = ClockPlan::new(&spec, codes, acq, cfg);
    let mut windows: Vec<Vec<Cf64>> = vec![Vec::new(); plan.starts.len()];
    let mut a = Acc {
        hist: (0..=MAX_PERIOD).map(|p| vec![0; p.max(1)]).collect(),
        ..Default::default()
    };
    let mut buf = vec![Cf64::default(); CHUNK];
    while a.n < limit {
        let want = CHUNK.min((limit - a.n) as usize);
        let got = src.read(&mut buf[..want])?;
        if got == 0 {
            break;
        }
        for (w, &start) in windows.iter_mut().zip(&plan.starts) {
            let (lo, hi) = (a.n, a.n + got as u64);
            let end = start + plan.window as u64;
            if hi > start && lo < end && w.len() < plan.window {
                let from = start.max(lo) - lo;
                let to = end.min(hi) - lo;
                w.extend_from_slice(&buf[from as usize..to as usize]);
            }
        }
        for &s in &buf[..got] {
            step(&mut a, s, ext, block_len, &spec, cfg);
        }
    }
    if a.n == 0 {
        return Err(IqError::Format(crate::terr!("e-iq-frontdiag-no-samples")));
    }
    finish_zero_run(&mut a, cfg);
    let clock = (!codes.is_empty()).then(|| clock_check(&spec, codes, acq, cfg, &plan, &windows));
    Ok(summarise(a, &spec, ext, clock, cfg))
}

fn finish_zero_run(a: &mut Acc, cfg: &DiagConfig) {
    if a.zero_run >= cfg.zero_run_min {
        a.zero_runs += 1;
    }
    a.longest_zero = a.longest_zero.max(a.zero_run);
    a.zero_run = 0;
}

fn step(
    a: &mut Acc,
    s: Cf64,
    ext: Option<(f64, f64)>,
    block_len: usize,
    spec: &SampleSpec,
    cfg: &DiagConfig,
) {
    let k = a.n;
    a.n += 1;
    a.si += s.re;
    a.sq += s.im;
    a.sii += s.re * s.re;
    a.sqq += s.im * s.im;
    a.siq += s.re * s.im;
    if let Some((lo, hi)) = ext {
        a.clipped += u64::from(s.re <= lo || s.re >= hi) + u64::from(s.im <= lo || s.im >= hi);
    }
    if s.re == 0.0 && s.im == 0.0 {
        a.zeros += 1;
        a.zero_run += 1;
    } else if a.zero_run > 0 {
        finish_zero_run(a, cfg);
    }
    for (lag, p) in a.prev.iter().enumerate() {
        if p.is_some_and(|p| p == s) {
            a.lag[lag] += 1;
            if lag == 0 {
                for (period, h) in a.hist.iter_mut().enumerate().skip(2) {
                    h[(k % period as u64) as usize] += 1;
                }
            }
        }
    }
    a.prev.rotate_right(1);
    a.prev[0] = Some(s);
    if (k as usize) < LEVEL_SAMPLES && s.re.is_finite() && a.levels.len() < 1 << 16 {
        a.levels.insert((s.re * 1024.0).round() as i64);
    }
    a.block_pow += s.re * s.re + s.im * s.im;
    a.block_n += 1;
    if a.block_n == block_len {
        let p = a.block_pow / block_len as f64;
        if let Some(prev) = a.last_block_pow {
            if prev > 0.0 && p > 0.0 {
                let d = 10.0 * (p / prev).log10();
                if d.abs() > cfg.gain_step_db {
                    a.n_steps += 1;
                    if a.steps.len() < MAX_STEPS_LISTED {
                        a.steps.push(GainStep {
                            t_s: spec.time_of(k + 1 - block_len as u64),
                            change_db: d,
                        });
                    }
                }
            }
        }
        a.last_block_pow = Some(p);
        a.block_pow = 0.0;
        a.block_n = 0;
    }
}

fn summarise(
    a: Acc,
    spec: &SampleSpec,
    ext: Option<(f64, f64)>,
    clock: Option<ClockCheck>,
    cfg: &DiagConfig,
) -> FrontendDiagnosis {
    let n = a.n as f64;
    let (mi, mq) = (a.si / n, a.sq / n);
    let (vi, vq) = (
        (a.sii / n - mi * mi).max(0.0),
        (a.sqq / n - mq * mq).max(0.0),
    );
    let ciq = a.siq / n - mi * mq;
    let mean_power = (a.sii + a.sqq) / n;
    let rms = mean_power.sqrt();
    let dc = DcOffset {
        i: mi,
        q: mq,
        relative: if rms > 0.0 { mi.hypot(mq) / rms } else { 0.0 },
    };
    let (gain_db, phase_deg) = if vi > 0.0 && vq > 0.0 {
        (
            10.0 * (vi / vq).log10(),
            (ciq / (vi * vq).sqrt())
                .clamp(-1.0, 1.0)
                .asin()
                .to_degrees(),
        )
    } else {
        (0.0, 0.0)
    };
    let pairs = |lag: usize| (a.n.saturating_sub(lag as u64 + 1)).max(1) as f64;
    let lag1 = a.lag[0] as f64 / pairs(0);
    let chance = (1..4).map(|l| a.lag[l] as f64 / pairs(l)).sum::<f64>() / 3.0;
    let excess = lag1 - chance;
    let sigma = (chance.max(1.0 / n) * (1.0 - chance) / n).sqrt();
    let significant = excess > cfg.repeat_excess_min && excess > 5.0 * sigma;
    let period = significant.then(|| repeat_period(&a, chance)).flatten();
    let levels = a.levels.len().max(1);
    let clip_fraction = ext.map(|_| a.clipped as f64 / (2.0 * n));
    let mut findings = Vec::new();
    let mut flag = |code: &str, value: f64, threshold: f64, hit: bool| {
        if hit {
            findings.push(Finding {
                code: code.to_string(),
                value,
                threshold,
            });
        }
    };
    flag(
        "dc-offset",
        dc.relative,
        cfg.dc_rel_max,
        dc.relative > cfg.dc_rel_max,
    );
    flag(
        "iq-gain-imbalance",
        gain_db,
        cfg.iq_gain_db_max,
        gain_db.abs() > cfg.iq_gain_db_max,
    );
    flag(
        "iq-phase-imbalance",
        phase_deg,
        cfg.iq_phase_deg_max,
        phase_deg.abs() > cfg.iq_phase_deg_max,
    );
    if let Some(c) = clip_fraction {
        flag("clipping", c, cfg.clip_frac_max, c > cfg.clip_frac_max);
    }
    flag("dropouts", a.zero_runs as f64, 0.0, a.zero_runs > 0);
    flag(
        "repeated-samples",
        excess,
        cfg.repeat_excess_min,
        significant,
    );
    flag("gain-steps", a.n_steps as f64, 0.0, a.n_steps > 0);
    if let Some(c) = &clock {
        if c.codes.iter().all(|x| !x.acquired) && c.note.is_none() {
            flag("no-acquisition", 0.0, 0.0, true);
        }
        if let Some([lo, hi]) = c.offset_interval_hz {
            // Reported when the interval excludes zero: the oscillator is off by at least that much.
            let least = if lo > 0.0 {
                lo
            } else if hi < 0.0 {
                hi
            } else {
                0.0
            };
            flag("oscillator-offset", least, 0.0, least != 0.0);
        }
        if let Some(m) = c.mismatch_ppm {
            flag(
                "clock-mismatch",
                m,
                cfg.clock_mismatch_ppm_max,
                m.abs() > cfg.clock_mismatch_ppm_max,
            );
        }
    }
    FrontendDiagnosis {
        evidence: "MODELLED".to_string(),
        sample_rate_hz: spec.fs_hz,
        center_hz: spec.center_hz,
        n_samples: a.n,
        duration_s: n / spec.fs_hz,
        mean_power,
        dc,
        iq_imbalance: IqImbalance { gain_db, phase_deg },
        clip_fraction,
        levels_used: levels,
        bits_used: (levels as f64).log2(),
        zero_fraction: a.zeros as f64 / n,
        zero_runs: a.zero_runs,
        longest_zero_run: a.longest_zero,
        repeats: Repeats {
            lag1_fraction: lag1,
            chance_fraction: chance,
            excess_fraction: excess,
            period,
        },
        gain_steps: a.steps,
        n_gain_steps: a.n_steps,
        clock,
        findings,
    }
}

/// The largest period (up to [`MAX_PERIOD`]) on one of whose positions at least 80 % of the excess
/// repeats fall. Every divisor of the true period concentrates them too, and no multiple of it does,
/// so the largest is the period itself.
fn repeat_period(a: &Acc, chance: f64) -> Option<usize> {
    let total = a.lag[0] as f64;
    let excess = total - chance * a.n as f64;
    if excess <= 0.0 {
        return None;
    }
    (2..=MAX_PERIOD).rev().find(|&p| {
        let h = &a.hist[p];
        let max = *h.iter().max().unwrap_or(&0) as f64;
        let others = (total - max) / (p - 1) as f64;
        max - others >= 0.8 * excess
    })
}

/// Where the clock check's windows start, and how long each is.
struct ClockPlan {
    starts: Vec<u64>,
    window: usize,
}

impl ClockPlan {
    fn new(
        spec: &SampleSpec,
        codes: &[&dyn SpreadingCode],
        acq: &AcqConfig,
        cfg: &DiagConfig,
    ) -> Self {
        let window = codes
            .iter()
            .filter_map(|c| samples_needed(spec, *c, acq).ok())
            .max()
            .unwrap_or(0);
        if window == 0 {
            return Self {
                starts: Vec::new(),
                window: 0,
            };
        }
        let step = spec.samples_in(cfg.step_s) as u64;
        Self {
            starts: (0..=cfg.steps as u64).map(|k| k * step).collect(),
            window,
        }
    }
}

fn median(v: &mut [f64]) -> Option<f64> {
    if v.is_empty() {
        return None;
    }
    v.sort_by(f64::total_cmp);
    let m = v.len() / 2;
    Some(if v.len() % 2 == 1 {
        v[m]
    } else {
        (v[m - 1] + v[m]) / 2.0
    })
}

fn clock_check(
    spec: &SampleSpec,
    codes: &[&dyn SpreadingCode],
    acq: &AcqConfig,
    cfg: &DiagConfig,
    plan: &ClockPlan,
    windows: &[Vec<Cf64>],
) -> ClockCheck {
    let none = |note: String| ClockCheck {
        codes: Vec::new(),
        offset_interval_hz: None,
        offset_interval_ppm: None,
        mismatch_ppm: None,
        note: Some(note),
    };
    if plan.window == 0 || windows.first().is_none_or(|w| w.len() < plan.window) {
        return none("no-window".to_string());
    }
    let carrier = codes[0].carrier_hz();
    let mut out = Vec::new();
    for code in codes {
        let Ok(spc) = samples_per_period(spec, *code) else {
            continue;
        };
        let Ok(r0) = acquire_peak(&windows[0], spec, *code, acq) else {
            continue;
        };
        let fd = r0.doppler_hz;
        let carrier_rate_ppm = fd / code.carrier_hz() * 1e6;
        let mut check = CodeCheck {
            code: code.name(),
            acquired: r0.acquired,
            doppler_hz: fd,
            statistic_over_threshold: r0.statistic / r0.threshold,
            points: 0,
            code_rate_ppm: None,
            carrier_rate_ppm,
            mismatch_ppm: None,
        };
        if r0.acquired {
            // Narrow searches around the first Doppler: the carrier moves the baseband frequency.
            let mut near = *spec;
            near.if_hz += fd;
            let narrow = AcqConfig {
                doppler_max_hz: 2.0 * acq.doppler_step_hz,
                ..*acq
            };
            let p = spc as f64;
            let mut pts: Vec<(f64, f64)> = vec![(0.0, 0.0)];
            let mut last = 0.0f64;
            for (w, &start) in windows.iter().zip(&plan.starts).skip(1) {
                if w.len() < plan.window {
                    break;
                }
                let Ok(r) = acquire_peak(w, &near, *code, &narrow) else {
                    continue;
                };
                if !r.acquired {
                    continue;
                }
                // Code epochs fall every P(1 − ν) samples; the epoch seen at the start of a
                // window `n` samples later has moved by −n·ν modulo P.
                let raw = r.delay_samples as f64 - r0.delay_samples as f64 + start as f64;
                let wrapped = raw - p * (raw / p).round();
                // Unwrap against the previous point.
                let d = wrapped + p * ((last - wrapped) / p).round();
                last = d;
                pts.push((start as f64, d));
            }
            check.points = pts.len() - 1;
            if pts.len() >= 3 {
                let slope = fit_slope(&pts);
                let code_rate = -slope * 1e6;
                check.code_rate_ppm = Some(code_rate);
                check.mismatch_ppm = Some(code_rate - carrier_rate_ppm);
            }
        }
        out.push(check);
    }
    let acquired: Vec<f64> = out
        .iter()
        .filter(|c| c.acquired)
        .map(|c| c.doppler_hz)
        .collect();
    let interval = if acquired.is_empty() {
        None
    } else {
        let lo =
            acquired.iter().copied().fold(f64::NEG_INFINITY, f64::max) - cfg.max_sat_doppler_hz;
        let hi = acquired.iter().copied().fold(f64::INFINITY, f64::min) + cfg.max_sat_doppler_hz;
        (lo <= hi).then_some([lo, hi])
    };
    let mut mm: Vec<f64> = out.iter().filter_map(|c| c.mismatch_ppm).collect();
    ClockCheck {
        offset_interval_ppm: interval.map(|[a, b]| [a / carrier * 1e6, b / carrier * 1e6]),
        offset_interval_hz: interval,
        mismatch_ppm: median(&mut mm),
        codes: out,
        note: None,
    }
}

/// Least-squares slope of `y` on `x`.
fn fit_slope(p: &[(f64, f64)]) -> f64 {
    let n = p.len() as f64;
    let mx = p.iter().map(|q| q.0).sum::<f64>() / n;
    let my = p.iter().map(|q| q.1).sum::<f64>() / n;
    let sxy: f64 = p.iter().map(|q| (q.0 - mx) * (q.1 - my)).sum();
    let sxx: f64 = p.iter().map(|q| (q.0 - mx) * (q.0 - mx)).sum();
    if sxx > 0.0 {
        sxy / sxx
    } else {
        0.0
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::iq::VecSource;

    fn spec() -> SampleSpec {
        SampleSpec {
            fs_hz: 1.0e6,
            center_hz: 0.0,
            if_hz: 0.0,
        }
    }

    /// A deterministic sequence of small integers (xorshift), as an 8-bit front end gives.
    fn noise(n: usize, seed: u64) -> Vec<Cf64> {
        let mut x = seed | 1;
        let mut next = || {
            x ^= x << 13;
            x ^= x >> 7;
            x ^= x << 17;
            ((x >> 33) % 41) as f64 - 20.0
        };
        (0..n).map(|_| Cf64::new(next(), next())).collect()
    }

    fn run(samples: Vec<Cf64>) -> FrontendDiagnosis {
        let mut src = VecSource::new(spec(), samples);
        let acq = AcqConfig {
            coherent_periods: 1,
            noncoherent: 1,
            doppler_max_hz: 0.0,
            doppler_step_hz: 1.0,
            pfa: 1e-3,
        };
        diagnose(
            &mut src,
            SampleFormat::CI8,
            &[],
            &acq,
            &DiagConfig::default(),
        )
        .unwrap()
    }

    #[test]
    fn clean_noise_raises_nothing() {
        let d = run(noise(200_000, 7));
        assert!(d.findings.is_empty(), "{:?}", d.findings);
        assert!(d.repeats.excess_fraction.abs() < 1e-3);
        assert_eq!(d.levels_used, 41);
    }

    #[test]
    fn dc_and_imbalance_are_measured() {
        let s: Vec<Cf64> = noise(200_000, 3)
            .into_iter()
            .map(|c| Cf64::new(c.re * 1.3 + 4.0, c.im + 0.4 * c.re))
            .collect();
        let d = run(s);
        let codes: Vec<&str> = d.findings.iter().map(|f| f.code.as_str()).collect();
        assert!(codes.contains(&"dc-offset"), "{codes:?}");
        assert!(codes.contains(&"iq-gain-imbalance"));
        assert!(codes.contains(&"iq-phase-imbalance"));
        assert!((d.dc.i - 4.0).abs() < 0.2);
    }

    #[test]
    fn every_ninth_sample_a_repeat_is_found_with_its_period() {
        // One input sample in eight written twice: nine output samples per eight.
        let mut s = Vec::new();
        for (k, c) in noise(160_000, 11).into_iter().enumerate() {
            s.push(c);
            if k % 8 == 7 {
                s.push(c);
            }
        }
        let d = run(s);
        assert!(d.findings.iter().any(|f| f.code == "repeated-samples"));
        assert!((d.repeats.excess_fraction - 1.0 / 9.0).abs() < 0.01);
        assert_eq!(d.repeats.period, Some(9));
    }

    #[test]
    fn zero_runs_clipping_and_gain_steps() {
        let mut s = noise(100_000, 5);
        for x in &mut s[40_000..40_500] {
            *x = Cf64::new(0.0, 0.0);
        }
        // a 10 dB gain step at 0.06 s, clipping to the 8-bit extremes
        for x in &mut s[60_000..] {
            *x = Cf64::new(
                (x.re * 3.2).clamp(-128.0, 127.0),
                (x.im * 3.2).clamp(-128.0, 127.0),
            );
        }
        for x in s.iter_mut().skip(60_000).step_by(50) {
            *x = Cf64::new(127.0, -128.0);
        }
        let d = run(s);
        let codes: Vec<&str> = d.findings.iter().map(|f| f.code.as_str()).collect();
        assert!(codes.contains(&"dropouts"), "{codes:?}");
        assert!(codes.contains(&"clipping"));
        assert!(codes.contains(&"gain-steps"));
        assert_eq!(d.longest_zero_run, 500);
        assert!(d.gain_steps.iter().any(|g| (g.t_s - 0.06).abs() < 1e-9));
    }
}
