// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-correlation spectral and amplitude-statistics monitor.
//!
//! Samples are taken in blocks of `block_s` (held in memory one block at a time). Per
//! block:
//!
//! * the **Welch PSD** ([`crate::spectrum::welch_psd`], `nfft` points, periodic Hann,
//!   `overlap`) is compared bin by bin with the baseline PSD (the mean over the baseline
//!   blocks): `psd_excess_db` is the largest `10·log10(PSD/baseline)` over the bins and
//!   `psd_excess_freq_hz` the bin it falls in; a block above the excess threshold raises a
//!   `spectral_excess` event. The threshold is `excess_db` when that is positive, and
//!   otherwise the level at which the largest bin of white noise exceeds its mean with
//!   probability `excess_pfa` per block ([`super::stats::welch_excess_threshold_db`],
//!   with Welch's equivalent segment count for the block). A max-hold of the excess and the baseline itself are kept as
//!   spectra.
//! * the **complex kurtosis** `mean(|x|⁴)/mean(|x|²)²` (2 for Gaussian noise, 1 for a
//!   constant-envelope signal, larger for pulsed energy) is turned into a z-score against
//!   the baseline mean with standard deviation `max(2/√N, baseline spread)`
//!   ([`super::stats::complex_kurtosis_sd`]); `|z|` above `kurtosis_sigma` raises a
//!   `kurtosis` event.
//! * the **pulse detector** counts samples with `|x|² > pulse_t·σ²` (σ² the baseline
//!   power); for Gaussian noise each does so with probability `p = e^{−pulse_t}`
//!   ([`super::stats::pulse_pfa`]), so the count is Binomial(`N`, `p`). A block raises a
//!   `pulses` event when the exact upper tail `P(X ≥ count)`
//!   ([`super::stats::binomial_upper_tail`]) is below `pulse_pfa`, the per-block
//!   false-event probability. (A z-score of the count is not used: at the small expected
//!   counts of short blocks one sample over threshold is already several "sigma".) The
//!   event's `peak` and `threshold` are `−ln` of the tail and of `pulse_pfa`.
//!   `pulse_fraction` is the fraction of samples over the threshold.

use super::{stats, Baseline, MonitorEvent, MonitorReport, Series, Side, SpanDetector, Spectrum};
use crate::iq::Cf64;
use serde::{Deserialize, Serialize};

/// Settings of [`SpectralMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(default)]
pub struct SpectralSettings {
    /// Block length (s).
    pub block_s: f64,
    /// Length of the baseline at the start of the data (s).
    pub baseline_s: f64,
    /// Welch segment length (a power of two).
    pub nfft: usize,
    /// Welch segment overlap (fraction).
    pub overlap: f64,
    /// Largest per-bin excess over the baseline PSD that counts (dB); 0 or less = set from
    /// `excess_pfa`.
    pub excess_db: f64,
    /// Per-block false-alarm probability that sets the excess threshold when `excess_db`
    /// is not positive.
    pub excess_pfa: f64,
    /// Kurtosis z-score that counts.
    pub kurtosis_sigma: f64,
    /// Pulse threshold on `|x|²/σ²`.
    pub pulse_t: f64,
    /// Per-block false-event probability of the pulse count (exact binomial upper tail).
    pub pulse_pfa: f64,
}

impl Default for SpectralSettings {
    /// 50 ms blocks, 1 s baseline, 256-point Welch with 50 % overlap, the excess threshold
    /// set for a false-alarm probability of 1e-4 per block, a kurtosis z-score of 6, pulse
    /// threshold 12 (`p = 6.1e-6`) and a pulse false-event probability of 1e-4 per block.
    fn default() -> Self {
        SpectralSettings {
            block_s: 0.05,
            baseline_s: 1.0,
            nfft: 256,
            overlap: 0.5,
            excess_db: 0.0,
            excess_pfa: 1e-4,
            kurtosis_sigma: 6.0,
            pulse_t: 12.0,
            pulse_pfa: 1e-4,
        }
    }
}

/// The spectral / kurtosis / pulse monitor (see the module docs).
pub struct SpectralMonitor {
    settings: SpectralSettings,
    fs_hz: f64,
    block_len: usize,
    excess_threshold_db: f64,
    block: Vec<Cf64>,
    sample: u64,
    baseline_blocks: usize,
    seen_blocks: usize,
    base_psd: Vec<f64>,
    base_power: Baseline,
    base_kurt: Baseline,
    freq_hz: Vec<f64>,
    reference: Option<(Vec<f64>, f64, f64, f64)>,
    max_hold_db: Vec<f64>,
    excess: Series,
    excess_f: Series,
    kurt: Series,
    pulse: Series,
    det_excess: Option<SpanDetector>,
    det_kurt: Option<SpanDetector>,
    det_pulse: Option<SpanDetector>,
    error: Option<String>,
}

impl SpectralMonitor {
    /// A monitor for samples at `fs_hz`.
    pub fn new(fs_hz: f64, settings: SpectralSettings) -> Self {
        let block_len = ((settings.block_s * fs_hz).round() as usize).max(settings.nfft);
        let baseline_blocks =
            ((settings.baseline_s / (block_len as f64 / fs_hz)).round() as usize).max(1);
        let excess_threshold_db = if settings.excess_db > 0.0 {
            settings.excess_db
        } else {
            let k_eff = Self::k_eff(&settings, block_len);
            stats::welch_excess_threshold_db(k_eff, settings.nfft, settings.excess_pfa)
        };
        SpectralMonitor {
            settings,
            fs_hz,
            block_len,
            excess_threshold_db,
            block: Vec::with_capacity(block_len),
            sample: 0,
            baseline_blocks,
            seen_blocks: 0,
            base_psd: Vec::new(),
            base_power: Baseline::default(),
            base_kurt: Baseline::default(),
            freq_hz: Vec::new(),
            reference: None,
            max_hold_db: Vec::new(),
            excess: Series::new("psd_excess_db", "dB", None),
            excess_f: Series::new("psd_excess_freq_hz", "Hz", None),
            kurt: Series::new("kurtosis", "1", None),
            pulse: Series::new("pulse_fraction", "1", None),
            det_excess: None,
            det_kurt: None,
            det_pulse: None,
            error: None,
        }
    }

    /// Samples per block.
    pub fn block_len(&self) -> usize {
        self.block_len
    }

    /// The spectral-excess threshold in use (dB).
    pub fn excess_threshold_db(&self) -> f64 {
        self.excess_threshold_db
    }

    /// Welch's equivalent segment count for one block, as `welch_psd` steps it.
    fn k_eff(st: &SpectralSettings, block_len: usize) -> f64 {
        let ov = st.overlap.clamp(0.0, 0.95);
        let step = ((st.nfft as f64) * (1.0 - ov)).round().max(1.0) as usize;
        let segments = if block_len >= st.nfft {
            (block_len - st.nfft) / step + 1
        } else {
            1
        };
        stats::welch_equivalent_segments(st.nfft, step, segments)
    }

    /// The closed-form per-block false-alarm probability of the spectral-excess test on
    /// white noise at the threshold in use.
    pub fn excess_pfa_closed_form(&self) -> f64 {
        stats::welch_max_excess_pfa(
            Self::k_eff(&self.settings, self.block_len),
            self.settings.nfft,
            self.excess_threshold_db,
        )
    }

    /// Feed samples.
    pub fn push(&mut self, x: &[Cf64]) {
        for &s in x {
            self.block.push(s);
            self.sample += 1;
            if self.block.len() == self.block_len {
                let t = (self.sample as f64 - self.block_len as f64 / 2.0) / self.fs_hz;
                let b = std::mem::take(&mut self.block);
                self.process(t, &b);
                self.block = b;
                self.block.clear();
            }
        }
    }

    fn process(&mut self, t: f64, b: &[Cf64]) {
        let n = b.len() as f64;
        let (s2, s4) = b.iter().fold((0.0, 0.0), |(a2, a4), s| {
            let p = super::norm_sqr(*s);
            (a2 + p, a4 + p * p)
        });
        let power = s2 / n;
        let kurt = if s2 > 0.0 {
            (s4 / n) / (power * power)
        } else {
            0.0
        };
        let psd = match crate::spectrum::welch_psd(
            b,
            self.fs_hz,
            self.settings.nfft,
            self.settings.overlap,
        ) {
            Ok(p) => p,
            Err(e) => {
                self.error = Some(e);
                return;
            }
        };
        self.kurt.push(t, kurt);
        match &self.reference {
            None => {
                if self.base_psd.is_empty() {
                    self.base_psd = vec![0.0; psd.psd.len()];
                    self.freq_hz = psd.freq_hz.clone();
                }
                for (a, v) in self.base_psd.iter_mut().zip(&psd.psd) {
                    *a += v;
                }
                self.base_power.push(power);
                self.base_kurt.push(kurt);
                self.seen_blocks += 1;
                if self.seen_blocks >= self.baseline_blocks {
                    let k = self.seen_blocks as f64;
                    let base: Vec<f64> = self.base_psd.iter().map(|v| v / k).collect();
                    let sd_k = stats::complex_kurtosis_sd(self.block_len).max(self.base_kurt.std());
                    self.reference =
                        Some((base, self.base_power.mean(), self.base_kurt.mean(), sd_k));
                    self.max_hold_db = vec![f64::NEG_INFINITY; self.freq_hz.len()];
                    let st = self.settings;
                    self.det_excess = Some(SpanDetector::new(
                        "spectral_excess",
                        None,
                        Side::Above,
                        self.excess_threshold_db,
                        1,
                    ));
                    self.det_kurt = Some(SpanDetector::new(
                        "kurtosis",
                        None,
                        Side::Above,
                        st.kurtosis_sigma,
                        1,
                    ));
                    self.det_pulse = Some(SpanDetector::new(
                        "pulses",
                        None,
                        Side::Above,
                        -st.pulse_pfa.ln(),
                        1,
                    ));
                }
            }
            Some((base, sigma2, k0, sd_k)) => {
                let (mut best, mut best_f) = (f64::NEG_INFINITY, 0.0);
                for (i, (v, r)) in psd.psd.iter().zip(base).enumerate() {
                    let db = 10.0 * (v / r.max(1e-300)).max(1e-300).log10();
                    if db > self.max_hold_db[i] {
                        self.max_hold_db[i] = db;
                    }
                    if db > best {
                        best = db;
                        best_f = psd.freq_hz[i];
                    }
                }
                self.excess.push(t, best);
                self.excess_f.push(t, best_f);
                let thr = self.settings.pulse_t * sigma2;
                let count = b.iter().filter(|s| super::norm_sqr(**s) > thr).count() as f64;
                self.pulse.push(t, count / n);
                let p = stats::pulse_pfa(self.settings.pulse_t);
                let tail = stats::binomial_upper_tail(b.len() as u64, p, count as u64);
                let surprise = -tail.max(1e-300).ln();
                let z_kurt = ((kurt - k0) / sd_k).abs();
                if let Some(d) = self.det_excess.as_mut() {
                    d.push(t, best);
                }
                if let Some(d) = self.det_kurt.as_mut() {
                    d.push(t, z_kurt);
                }
                if let Some(d) = self.det_pulse.as_mut() {
                    d.push(t, surprise);
                }
            }
        }
    }

    /// The events so far.
    pub fn events(&self) -> Vec<MonitorEvent> {
        let mut v = Vec::new();
        for d in [&self.det_excess, &self.det_kurt, &self.det_pulse]
            .into_iter()
            .flatten()
        {
            v.extend(d.events());
        }
        v
    }

    /// The series, events, spectra and notes.
    pub fn report(&self) -> MonitorReport {
        let mut spectra = Vec::new();
        let mut notes = vec![
            ("spectral.block_samples".into(), self.block_len.to_string()),
            ("spectral.nfft".into(), self.settings.nfft.to_string()),
            (
                "spectral.excess_threshold_db".into(),
                format!("{:.3}", self.excess_threshold_db),
            ),
            (
                "spectral.excess_pfa_per_block_white_noise".into(),
                format!("{:.3e}", self.excess_pfa_closed_form()),
            ),
            (
                "spectral.pulse_pfa_per_sample_white_noise".into(),
                format!("{:.3e}", stats::pulse_pfa(self.settings.pulse_t)),
            ),
        ];
        if let Some((base, sigma2, k0, sd_k)) = &self.reference {
            spectra.push(Spectrum {
                name: "psd_baseline_db".into(),
                freq_hz: self.freq_hz.clone(),
                value_db: base.iter().map(|v| 10.0 * v.max(1e-300).log10()).collect(),
            });
            spectra.push(Spectrum {
                name: "psd_excess_max_hold_db".into(),
                freq_hz: self.freq_hz.clone(),
                value_db: self.max_hold_db.clone(),
            });
            notes.push(("spectral.baseline_power".into(), format!("{sigma2:.6e}")));
            notes.push(("spectral.baseline_kurtosis".into(), format!("{k0:.5}")));
            notes.push(("spectral.kurtosis_sd".into(), format!("{sd_k:.3e}")));
        } else {
            notes.push(("spectral.baseline".into(), "not reached".into()));
        }
        if let Some(e) = &self.error {
            notes.push(("spectral.error".into(), e.clone()));
        }
        let mut r = MonitorReport {
            series: vec![
                self.excess.clone(),
                self.excess_f.clone(),
                self.kurt.clone(),
                self.pulse.clone(),
            ],
            events: self.events(),
            spectra,
            notes,
        };
        r.events.sort_by(|a, b| a.t_start_s.total_cmp(&b.t_start_s));
        r
    }
}
