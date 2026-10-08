// SPDX-License-Identifier: AGPL-3.0-only
//! **FFT parallel code-phase acquisition for any [`SpreadingCode`].**
//!
//! For every Doppler bin the carrier (intermediate frequency plus the bin's Doppler) is
//! wiped off the samples, each coherent block of `N` code periods is folded onto one
//! period (the sum of its periods, which is the coherent integration because the replica
//! repeats every period), and the circular correlation against one sampled period of the
//! code is formed for every code phase at once with a fast Fourier transform:
//! `IFFT(FFT(fold) · conj(FFT(replica)))`. The squared magnitudes of `M` consecutive
//! blocks are summed (non-coherent integration).
//!
//! The FFT is the crate's existing mixed-radix transform ([`crate::acquisition::fft_forward`]
//! and its plan in `crate::portable_math`), so a search returns the same bits on every
//! platform. The detector statistics are the existing square-law / Marcum-Q ones in
//! [`crate::acquisition`]: each cell is normalised by the measured sample power `σ²` to
//! `2·G/(L·σ²)`, which under noise alone is chi-square with `2M` degrees of freedom and with
//! a signal is non-central chi-square with non-centrality `2M·ρ`, `ρ = (C/N0)·N·T_code`.
//! The threshold is [`crate::acquisition::threshold_for_pfa`] at the per-cell false-alarm
//! probability that gives the requested probability over the whole grid,
//! `1 − (1 − P_fa)^(1/N_cells)`, and [`predicted_pd`] is
//! [`crate::acquisition::pd_square_law`] at that threshold.
//!
//! The code is evaluated through [`SpreadingCode::value_at`] at the sample instants
//! (point sampling, no front-end filter), so BPSK and BOC codes both work. A sample rate
//! must hold a whole number of samples per code period.
//!
//! Scope, stated: no code-Doppler compensation across non-coherent blocks, no data-bit
//! wipe-off (a bit edge inside a coherent block loses correlation), no straddle-loss
//! recovery beyond choosing a fine Doppler step, no cell-averaging CFAR. MODELLED: the
//! detector identities are checked against the analytic Marcum-Q values by seeded Monte
//! Carlo in `tests/iq_receiver.rs`, not against an external dataset.

use super::{Cf64, IqError, IqSource, SampleSpec, SpreadingCode};
use crate::acquisition::{pd_square_law, threshold_for_pfa};
use crate::portable_math::{FftPlan, PortableFloat};

/// The parameters of one acquisition search.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AcqConfig {
    /// Coherent integration in whole code periods (`N`).
    pub coherent_periods: usize,
    /// Number of consecutive coherent blocks whose powers are summed (`M`).
    pub noncoherent: usize,
    /// The Doppler grid is `j · doppler_step_hz` for every integer `j` with
    /// `|j · doppler_step_hz| ≤ doppler_max_hz` (symmetric, always containing 0).
    pub doppler_max_hz: f64,
    /// Doppler bin spacing (Hz). A common choice is `2 / (3 · N · T_code)`.
    pub doppler_step_hz: f64,
    /// False-alarm probability for the whole search grid.
    pub pfa: f64,
}

/// Coherent integration time (s) the tracking hand-off searches with by default: about
/// 4 ms. See [`auto_coherent_periods`].
pub const AUTO_COHERENT_S: f64 = 4.0e-3;

/// The default coherent length, in whole code periods, of the acquisition that initialises
/// tracking: `ceil(4 ms / T_code)`, at least one period.
///
/// `T_code` is the code's FULL period, [`SpreadingCode::period_s`] (primary length times
/// secondary length for a tiered code), because that is the unit [`acquire`] integrates
/// over: its replica is the whole tiered code. So every signal gets at least ~4 ms of
/// coherent integration. The untiered 1 ms codes (GPS L1 C/A, BeiDou B1I, GLONASS L1OF) get
/// 4 periods (4 ms, ~167 Hz bins with the default Doppler step `2 / (3 · N · T_code)`).
/// Every code whose full period is already 4 ms or longer gets 1: Galileo E1-B (4 ms),
/// BeiDou B1C (10 ms), GPS L5-I/L5-Q (10/20 ms with their Neuman-Hofman overlay), Galileo
/// E5a-I/E5a-Q (20/100 ms), Galileo E1-C (100 ms with CS25) and GPS L2C. That is the same
/// one tiered period those codes searched before, and finer bins than 167 Hz.
///
/// Why not one period: a 1 ms search has ~667 Hz Doppler bins, and a hand-off up to
/// ~333 Hz off leaves the FLL outside its pull-in. On a seeded sweep of 180 GPS L1 C/A
/// channels (±5 kHz, 38 to 47 dB-Hz; `docs/design/evidence/iq-track-acq-default/`) one
/// period false-locked 27 channels ~500 Hz off and missed 102; this default false-locked 1
/// (36 Hz off at 38 dB-Hz) and missed 11, for ~40 ms more search per PRN.
pub fn auto_coherent_periods(code_period_s: f64) -> usize {
    if !(code_period_s.is_finite() && code_period_s > 0.0) {
        return 1;
    }
    // The small tolerance keeps 4 ms / 1 ms (4.000…01 in binary) at 4, not 5.
    ((AUTO_COHERENT_S / code_period_s - 1e-9).ceil() as usize).max(1)
}

impl AcqConfig {
    /// The Doppler grid (Hz), ascending.
    pub fn doppler_bins(&self) -> Vec<f64> {
        let n = (self.doppler_max_hz / self.doppler_step_hz + 1e-9).floor() as i64;
        (-n..=n).map(|j| j as f64 * self.doppler_step_hz).collect()
    }
}

/// Samples in one period of `code` at the sample rate of `spec`, or an error when that is
/// not a whole number (within 1e-6 of a sample).
pub fn samples_per_period(spec: &SampleSpec, code: &dyn SpreadingCode) -> Result<usize, String> {
    let spc = spec.fs_hz * code.period_s();
    if !(spc.is_finite() && spc >= 2.0) || (spc - spc.round()).abs() > 1e-6 {
        return Err(format!(
            "{} Hz does not hold a whole number of samples per {} period ({spc} samples)",
            spec.fs_hz,
            code.name()
        ));
    }
    Ok(spc.round() as usize)
}

/// Number of samples one search of `cfg` consumes: `N · M` code periods.
pub fn samples_needed(
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<usize, String> {
    Ok(samples_per_period(spec, code)? * cfg.coherent_periods * cfg.noncoherent)
}

/// The outcome of one search.
#[derive(Clone, Debug, PartialEq)]
pub struct AcqResult {
    /// Name of the code searched.
    pub code_name: String,
    /// Doppler of the peak bin (Hz), relative to the intermediate frequency.
    pub doppler_hz: f64,
    /// Index of the peak Doppler bin in [`AcqConfig::doppler_bins`].
    pub doppler_index: usize,
    /// Lag of the peak (samples, `0 .. samples_per_period`): the sample, counted from the
    /// first sample searched, at which a code period starts.
    pub delay_samples: usize,
    /// Code phase of the signal at the first sample searched (chips, `0 .. len`).
    pub code_phase_chips: f64,
    /// Normalised peak `2·G_max/(L·σ²)` (chi-square with `2M` degrees of freedom under noise).
    pub statistic: f64,
    /// Largest normalised cell in the peak's Doppler bin more than one chip (plus one
    /// sample) from the peak.
    pub second_peak: f64,
    /// `statistic / second_peak`: the peak-to-second-peak ratio.
    pub peak_ratio: f64,
    /// Per-cell false-alarm probability the threshold was set for.
    pub pfa_cell: f64,
    /// The normalised threshold `statistic` is compared with.
    pub threshold: f64,
    /// Whether `statistic` exceeded `threshold`.
    pub acquired: bool,
    /// Samples per code period (`L / N`).
    pub samples_per_period: usize,
    /// Number of Doppler bins searched.
    pub n_doppler_bins: usize,
    /// Mean sample power `σ²` used to normalise.
    pub sample_power: f64,
}

/// A search together with its full normalised grid `grid[doppler_index][lag]`.
#[derive(Clone, Debug, PartialEq)]
pub struct AcqGrid {
    /// The search outcome.
    pub result: AcqResult,
    /// Normalised cell values `2·G/(L·σ²)`, one row per Doppler bin.
    pub grid: Vec<Vec<f64>>,
}

/// The per-search state the correlation rows share: the FFT plan, the conjugated code
/// spectrum and the normalisation. One [`RowEngine::row`] is one Doppler bin's lag
/// profile, so a caller can keep every row (the grid) or only a running best.
struct RowEngine<'a> {
    samples: &'a [Cf64],
    fs: f64,
    base_hz: f64,
    spc: usize,
    block: usize,
    noncoherent: usize,
    plan: FftPlan,
    code_fft: Vec<(f64, f64)>,
    norm: f64,
    sigma2: f64,
}

impl<'a> RowEngine<'a> {
    /// `samples` must hold [`samples_needed`] samples.
    fn new(
        samples: &'a [Cf64],
        spec: &SampleSpec,
        code: &dyn SpreadingCode,
        cfg: &AcqConfig,
    ) -> Result<Self, String> {
        let spc = samples_per_period(spec, code)?;
        let block = spc * cfg.coherent_periods;
        let needed = block * cfg.noncoherent;
        if samples.len() < needed {
            return Err(format!(
                "{} samples supplied, {needed} needed",
                samples.len()
            ));
        }
        let fs = spec.fs_hz;
        // Where the code's carrier sits in this baseband (an FDMA channel's offset included).
        let base_hz = spec.baseband_hz(code.carrier_hz());
        let chips_per_sample = code.chip_rate_hz() / fs;

        let plan = FftPlan::new(spc);
        let code_fft: Vec<(f64, f64)> = {
            let rep: Vec<(f64, f64)> = (0..spc)
                .map(|i| (code.value_at(i as f64 * chips_per_sample), 0.0))
                .collect();
            plan.forward(&rep)
                .into_iter()
                .map(|(r, i)| (r, -i))
                .collect()
        };

        let power: f64 = samples[..needed]
            .iter()
            .map(|x| x.re * x.re + x.im * x.im)
            .sum();
        let sigma2 = power / needed as f64;
        if sigma2.is_nan() || sigma2 <= 0.0 {
            return Err("the samples carry no power".into());
        }
        Ok(Self {
            samples,
            fs,
            base_hz,
            spc,
            block,
            noncoherent: cfg.noncoherent,
            plan,
            code_fft,
            norm: 2.0 / (block as f64 * sigma2),
            sigma2,
        })
    }

    /// The normalised power at every lag for Doppler `d` (Hz).
    fn row(&self, d: f64) -> Vec<f64> {
        let (spc, block, fs) = (self.spc, self.block, self.fs);
        let f = self.base_hz + d;
        let mut row = vec![0.0_f64; spc];
        for m in 0..self.noncoherent {
            let start = m * block;
            let mut fold = vec![(0.0_f64, 0.0_f64); spc];
            for i in 0..block {
                let n = start + i;
                let cyc = (f * n as f64 / fs).fract();
                let (sn, cs) = (-core::f64::consts::TAU * cyc).psin_cos();
                let s = self.samples[n];
                let r = &mut fold[i % spc];
                r.0 += s.re * cs - s.im * sn;
                r.1 += s.re * sn + s.im * cs;
            }
            let mut y = self.plan.forward(&fold);
            drop(fold);
            for (v, &(c, e)) in y.iter_mut().zip(&self.code_fft) {
                let (a, b) = *v;
                *v = (a * c - b * e, a * e + b * c);
            }
            for (cell, (re, im)) in row.iter_mut().zip(self.plan.inverse_owned(y)) {
                *cell += re * re + im * im;
            }
        }
        for cell in &mut row {
            *cell *= self.norm;
        }
        row
    }
}

/// The normalised correlation power `2·G/(L·σ²)` of `samples` against `code` at every
/// Doppler in `dopplers` (Hz, relative to the carrier's place in the baseband) and every
/// lag: `rows[doppler][lag]`, with the mean sample power `σ²`. [`acquire`] searches
/// `cfg.doppler_bins()` with it; the surface export evaluates finer Dopplers with the same
/// arithmetic. `samples` must hold [`samples_needed`] samples.
pub(crate) fn power_rows(
    samples: &[Cf64],
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
    dopplers: &[f64],
) -> Result<(Vec<Vec<f64>>, f64), String> {
    let eng = RowEngine::new(samples, spec, code, cfg)?;
    let grid = dopplers.iter().map(|&d| eng.row(d)).collect();
    Ok((grid, eng.sigma2))
}

fn check_cfg(cfg: &AcqConfig) -> Result<(), String> {
    if cfg.coherent_periods == 0 || cfg.noncoherent == 0 {
        return Err("coherent_periods and noncoherent must be positive".into());
    }
    if !(cfg.doppler_step_hz > 0.0 && cfg.doppler_max_hz >= 0.0) {
        return Err("the Doppler grid needs a positive step and a non-negative maximum".into());
    }
    if !(cfg.pfa > 0.0 && cfg.pfa < 1.0) {
        return Err("pfa must lie in (0, 1)".into());
    }
    Ok(())
}

/// The result from the peak `(power, doppler index, lag)` and the peak's row.
#[allow(clippy::too_many_arguments)]
fn result_from_peak(
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
    bins: &[f64],
    spc: usize,
    sigma2: f64,
    chips_per_sample: f64,
    best: (f64, usize, usize),
    peak_row: &[f64],
) -> AcqResult {
    let (peak, jb, tb) = best;
    let guard = (1.0 / chips_per_sample).ceil() as usize + 1;
    let second_peak = peak_row
        .iter()
        .enumerate()
        .filter(|&(t, _)| {
            let d = t.abs_diff(tb);
            d.min(spc - d) > guard
        })
        .map(|(_, &v)| v)
        .fold(0.0_f64, f64::max);

    let n_cells = (spc * bins.len()) as f64;
    // Per-cell false-alarm probability 1 − (1 − P_fa)^(1/N), formed without cancellation.
    let pfa_cell = -((-cfg.pfa).ln_1p() / n_cells).exp_m1();
    let threshold = threshold_for_pfa(pfa_cell, cfg.noncoherent as f64);
    let len = code.len_chips() as f64;
    let code_phase_chips = (-(tb as f64) * chips_per_sample).rem_euclid(len);
    AcqResult {
        code_name: code.name(),
        doppler_hz: bins[jb],
        doppler_index: jb,
        delay_samples: tb,
        code_phase_chips,
        statistic: peak,
        second_peak,
        peak_ratio: if second_peak > 0.0 {
            peak / second_peak
        } else {
            f64::INFINITY
        },
        pfa_cell,
        threshold,
        acquired: peak > threshold,
        samples_per_period: spc,
        n_doppler_bins: bins.len(),
        sample_power: sigma2,
    }
}

/// Search `samples` (at least [`samples_needed`] long; the first that many are used),
/// sampled as `spec`, for `code`, keeping the whole grid. The grid is
/// `Doppler bins × samples per period` f64 cells, which is gigabytes for the long tiered
/// codes at high rates: use [`acquire_peak`] when only the result is needed.
pub fn acquire(
    samples: &[Cf64],
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<AcqGrid, String> {
    check_cfg(cfg)?;
    let bins = cfg.doppler_bins();
    let chips_per_sample = code.chip_rate_hz() / spec.fs_hz;
    let (grid, sigma2) = power_rows(samples, spec, code, cfg, &bins)?;
    let spc = samples_per_period(spec, code)?;

    let mut best = (f64::NEG_INFINITY, 0usize, 0usize);
    for (j, row) in grid.iter().enumerate() {
        for (t, &cell) in row.iter().enumerate() {
            if cell > best.0 {
                best = (cell, j, t);
            }
        }
    }
    let result = result_from_peak(
        code,
        cfg,
        &bins,
        spc,
        sigma2,
        chips_per_sample,
        best,
        &grid[best.1],
    );
    Ok(AcqGrid { result, grid })
}

/// The same search as [`acquire`] without keeping the grid: a running best and the row it
/// lies in (recomputed at the end), so memory is O(samples + samples per period), not
/// O(bins × samples). The result
/// is bit-identical to `acquire(..).result` (the cells come from the same arithmetic and ties
/// resolve to the first cell in the same order).
pub fn acquire_peak(
    samples: &[Cf64],
    spec: &SampleSpec,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<AcqResult, String> {
    check_cfg(cfg)?;
    let bins = cfg.doppler_bins();
    let chips_per_sample = code.chip_rate_hz() / spec.fs_hz;
    let eng = RowEngine::new(samples, spec, code, cfg)?;
    let mut best = (f64::NEG_INFINITY, 0usize, 0usize);
    for (j, &d) in bins.iter().enumerate() {
        let row = eng.row(d);
        for (t, &cell) in row.iter().enumerate() {
            if cell > best.0 {
                best = (cell, j, t);
            }
        }
    }
    // The peak's row is recomputed (the arithmetic is deterministic) rather than held for
    // the whole search: one more row of work instead of one more row of memory.
    let best_row = eng.row(bins[best.1]);
    Ok(result_from_peak(
        code,
        cfg,
        &bins,
        eng.spc,
        eng.sigma2,
        chips_per_sample,
        best,
        &best_row,
    ))
}

/// Read [`samples_needed`] samples from `src` and search them for `code`. The search is
/// relative to the first sample read.
pub fn acquire_source(
    src: &mut dyn IqSource,
    code: &dyn SpreadingCode,
    cfg: &AcqConfig,
) -> Result<AcqGrid, IqError> {
    let spec = src.spec();
    let needed = samples_needed(&spec, code, cfg).map_err(IqError::Format)?;
    let mut buf = vec![Cf64::default(); needed];
    let mut got = 0;
    while got < needed {
        let n = src.read(&mut buf[got..])?;
        if n == 0 {
            break;
        }
        got += n;
    }
    if got < needed {
        return Err(IqError::Format(format!(
            "stream ended after {got} of {needed} samples"
        )));
    }
    acquire(&buf, &spec, code, cfg).map_err(IqError::Format)
}

/// Analytic detection probability of one correctly aligned cell of a search with `cfg`
/// on a code of period `period_s` at carrier-to-noise density `cn0_dbhz`, at per-cell
/// false-alarm probability `pfa_cell`: [`crate::acquisition::pd_square_law`] with
/// `ρ = (C/N0)·N·T_code` and `M` non-coherent blocks. No straddle or bit-edge loss.
pub fn predicted_pd(cfg: &AcqConfig, period_s: f64, cn0_dbhz: f64, pfa_cell: f64) -> f64 {
    let m = cfg.noncoherent as f64;
    let rho = 10f64.powf(cn0_dbhz / 10.0) * cfg.coherent_periods as f64 * period_s;
    pd_square_law(threshold_for_pfa(pfa_cell, m), m, rho)
}

#[cfg(test)]
mod tests {
    use super::auto_coherent_periods;

    #[test]
    fn the_auto_coherent_length_is_about_four_milliseconds() {
        assert_eq!(auto_coherent_periods(1.0e-3), 4); // GPS L1 C/A, B1I, L1OF
        assert_eq!(auto_coherent_periods(4.0e-3), 1); // Galileo E1-B
        assert_eq!(auto_coherent_periods(10.0e-3), 1); // BeiDou B1C, GPS L5-I (tiered)
        assert_eq!(auto_coherent_periods(100.0e-3), 1); // Galileo E1-C, E5a-Q (tiered)
        assert_eq!(auto_coherent_periods(1.5e-3), 3);
        assert_eq!(auto_coherent_periods(0.0), 1);
    }
}
