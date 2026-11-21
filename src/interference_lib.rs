// SPDX-License-Identifier: AGPL-3.0-only
//! Interference model library, calibrated synthetic interference, a labelled dataset generator
//! and a classifier benchmark (`kshana interference-lib`, docs/INTERFERENCE-LIB.md).
//!
//! **Nothing radiates.** Every waveform is complex baseband written to a file on disk; there is
//! no path to a radio, and the library has no transmit or SDR output.
//!
//! **The library** ([`Class`]): `none` (receiver noise only), `cw`, `chirp` (linear sawtooth
//! sweep), `pulsed` (pulsed CW), `narrowband-noise`, `wideband-noise`, `multitone` and `fm-tone`
//! (sinusoidal frequency modulation). Each example is unit-power complex white Gaussian noise (the
//! receiver noise floor, `N = 1`) plus the interferer scaled to a stated J/N: the interferer's
//! power while it is on equals `10^(J/N/10)` (for `pulsed`, the power during a pulse). The
//! calibration is checked in the tests: the measured interferer power matches the stated J/N to
//! a fraction of a dB on every class.
//!
//! **The dataset** ([`generate`]): `per_class` examples of each class with parameters drawn from
//! a seeded generator (J/N uniform in `[jn_min, jn_max]` dB, frequencies, bandwidths, sweep
//! periods, duty cycles, tone counts within stated ranges), every example assigned to `train` or
//! `test` by a hash of its id. Written as `samples.cf32` (interleaved little-endian f32 I/Q, all
//! examples back to back), `labels.jsonl` (id, offset, length, class, J/N, parameters, split) and
//! `dataset.json` (schema, seed, settings, the SHA-256 of the samples). Same settings, same bytes.
//!
//! **The benchmark** ([`score`]): predictions (CSV `id,label`) are scored on the test split. The
//! **pre-registered primary metric is the macro-averaged F1 over the eight classes**; the report
//! also gives the confusion matrix, per-class precision, recall and F1, balanced accuracy, and
//! accuracy per J/N bin (0-5, 5-10, 10-15, 15-20 dB). A missing prediction counts as wrong.
//!
//! **The baseline** ([`baseline_classify`]): a transparent rule-based classifier on six features
//! (excess power, spectral flatness, spectral peak-to-median ratio, occupied-band fraction,
//! envelope duty cycle, instantaneous-frequency spread), there to show the harness works and to
//! give a floor, not a claim about any product.
//!
//! MODELLED: synthetic waveforms under a stated noise model; a classifier's score here says how it
//! does on this synthetic set.

use crate::portable_math::PortableFloat;
use crate::sdr::Cf64;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use serde_json::Value;
use std::collections::BTreeMap;

/// The honesty label.
pub const LABEL: &str =
    "MODELLED: synthetic complex-baseband interference in unit-power white Gaussian noise at \
stated J/N, written to files only (nothing radiates); scores describe this synthetic set.";

/// Dataset schema id.
pub const SCHEMA: &str = "kshana.interference-dataset/1";

/// The interference classes.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Class {
    /// Noise only.
    None,
    /// Continuous wave.
    Cw,
    /// Linear sawtooth frequency sweep.
    Chirp,
    /// Pulsed CW.
    Pulsed,
    /// Band-limited noise.
    NarrowbandNoise,
    /// White noise over the whole band.
    WidebandNoise,
    /// Several CW tones.
    Multitone,
    /// Sinusoidal frequency modulation.
    FmTone,
}

/// Every class, in label order.
pub const CLASSES: [Class; 8] = [
    Class::None,
    Class::Cw,
    Class::Chirp,
    Class::Pulsed,
    Class::NarrowbandNoise,
    Class::WidebandNoise,
    Class::Multitone,
    Class::FmTone,
];

impl Class {
    /// The label.
    pub fn name(self) -> &'static str {
        match self {
            Class::None => "none",
            Class::Cw => "cw",
            Class::Chirp => "chirp",
            Class::Pulsed => "pulsed",
            Class::NarrowbandNoise => "narrowband-noise",
            Class::WidebandNoise => "wideband-noise",
            Class::Multitone => "multitone",
            Class::FmTone => "fm-tone",
        }
    }
    /// Parse a label.
    pub fn parse(s: &str) -> Option<Class> {
        CLASSES.into_iter().find(|c| c.name() == s)
    }
}

/// Generator settings.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Settings {
    /// Seed.
    pub seed: u64,
    /// Examples per class.
    pub per_class: usize,
    /// Samples per example.
    pub samples: usize,
    /// Sample rate, Hz.
    pub fs_hz: f64,
    /// J/N range, dB.
    pub jn_min_db: f64,
    /// Upper end.
    pub jn_max_db: f64,
    /// Share of examples in the test split.
    pub test_share: f64,
}

impl Default for Settings {
    fn default() -> Self {
        Self {
            seed: 1,
            per_class: 40,
            samples: 4096,
            fs_hz: 4.0e6,
            jn_min_db: 0.0,
            jn_max_db: 20.0,
            test_share: 0.5,
        }
    }
}

/// One example's label.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Label {
    /// Id.
    pub id: String,
    /// Offset in samples into `samples.cf32`.
    pub offset: usize,
    /// Length in samples.
    pub len: usize,
    /// Class.
    pub class: Class,
    /// J/N, dB (none for `none`).
    pub jn_db: Option<f64>,
    /// Waveform parameters.
    pub params: BTreeMap<String, f64>,
    /// `train` or `test`.
    pub split: String,
}

fn gauss(rng: &mut ChaCha8Rng) -> f64 {
    // Box-Muller, portable.
    let u1: f64 = rng.gen::<f64>().max(1e-300);
    let u2: f64 = rng.gen::<f64>();
    (-2.0 * u1.pln()).sqrt() * (2.0 * std::f64::consts::PI * u2).pcos()
}

/// Unit-power complex white Gaussian noise.
pub fn noise(rng: &mut ChaCha8Rng, n: usize) -> Vec<Cf64> {
    let s = std::f64::consts::FRAC_1_SQRT_2;
    (0..n)
        .map(|_| Cf64::new(gauss(rng) * s, gauss(rng) * s))
        .collect()
}

fn tone(f: f64, fs: f64, k: usize, ph: f64) -> Cf64 {
    let (s, c) = (2.0 * std::f64::consts::PI * f * k as f64 / fs + ph).psin_cos();
    Cf64::new(c, s)
}

/// The interferer alone (power while on normalised to 1) and its parameters.
pub fn interferer(
    class: Class,
    rng: &mut ChaCha8Rng,
    n: usize,
    fs: f64,
) -> (Vec<Cf64>, BTreeMap<String, f64>) {
    let mut p = BTreeMap::new();
    let mut put = |k: &str, v: f64| {
        p.insert(k.to_string(), v);
    };
    let ph0 = rng.gen::<f64>() * 2.0 * std::f64::consts::PI;
    let sig: Vec<Cf64> = match class {
        Class::None => vec![Cf64::new(0.0, 0.0); n],
        Class::Cw => {
            let f = (rng.gen::<f64>() - 0.5) * 0.8 * fs;
            put("freq_hz", f);
            (0..n).map(|k| tone(f, fs, k, ph0)).collect()
        }
        Class::Chirp => {
            let bw = (0.2 + 0.6 * rng.gen::<f64>()) * fs;
            let period = (8.0 + 24.0 * rng.gen::<f64>()) * 1e-6;
            put("sweep_bw_hz", bw);
            put("sweep_period_s", period);
            let mut ph = ph0;
            (0..n)
                .map(|k| {
                    let t = k as f64 / fs;
                    let frac = (t / period).fract();
                    let f = -bw / 2.0 + bw * frac;
                    ph += 2.0 * std::f64::consts::PI * f / fs;
                    let (s, c) = ph.psin_cos();
                    Cf64::new(c, s)
                })
                .collect()
        }
        Class::Pulsed => {
            let f = (rng.gen::<f64>() - 0.5) * 0.8 * fs;
            let duty = 0.05 + 0.25 * rng.gen::<f64>();
            let pri = (64.0 + 448.0 * rng.gen::<f64>()).round();
            put("freq_hz", f);
            put("duty", duty);
            put("pri_samples", pri);
            (0..n)
                .map(|k| {
                    if (k as f64 % pri) < duty * pri {
                        tone(f, fs, k, ph0)
                    } else {
                        Cf64::new(0.0, 0.0)
                    }
                })
                .collect()
        }
        Class::NarrowbandNoise | Class::WidebandNoise => {
            let w = noise(rng, n);
            if class == Class::WidebandNoise {
                w
            } else {
                // A moving average of `m` samples, shifted to an offset frequency.
                let m = (8.0 + 24.0 * rng.gen::<f64>()).round() as usize;
                let f = (rng.gen::<f64>() - 0.5) * 0.6 * fs;
                put("avg_samples", m as f64);
                put("centre_hz", f);
                let mut out = Vec::with_capacity(n);
                let mut acc = Cf64::new(0.0, 0.0);
                for k in 0..n {
                    acc = acc + w[k];
                    if k >= m {
                        acc = acc + w[k - m] * -1.0;
                    }
                    out.push(acc * tone(f, fs, k, 0.0));
                }
                out
            }
        }
        Class::Multitone => {
            let k_tones = 3 + (rng.gen::<f64>() * 3.0) as usize;
            put("tones", k_tones as f64);
            let fr: Vec<(f64, f64)> = (0..k_tones)
                .map(|_| {
                    (
                        (rng.gen::<f64>() - 0.5) * 0.8 * fs,
                        rng.gen::<f64>() * 2.0 * std::f64::consts::PI,
                    )
                })
                .collect();
            (0..n)
                .map(|k| {
                    fr.iter()
                        .fold(Cf64::new(0.0, 0.0), |a, &(f, ph)| a + tone(f, fs, k, ph))
                })
                .collect()
        }
        Class::FmTone => {
            let dev = (0.05 + 0.2 * rng.gen::<f64>()) * fs;
            let fm = (2e3 + 48e3 * rng.gen::<f64>()).min(fs / 8.0);
            put("deviation_hz", dev);
            put("mod_freq_hz", fm);
            (0..n)
                .map(|k| {
                    let t = k as f64 / fs;
                    let ph = ph0 + dev / fm * (2.0 * std::f64::consts::PI * fm * t).psin();
                    let (s, c) = ph.psin_cos();
                    Cf64::new(c, s)
                })
                .collect()
        }
    };
    // Normalise the power while on to 1.
    let on: Vec<f64> = sig
        .iter()
        .map(|z| z.re * z.re + z.im * z.im)
        .filter(|&q| q > 0.0)
        .collect();
    let pwr = if on.is_empty() {
        1.0
    } else {
        on.iter().sum::<f64>() / on.len() as f64
    };
    let g = 1.0 / pwr.sqrt();
    (sig.into_iter().map(|z| z * g).collect(), p)
}

fn split_of(id: &str, share: f64) -> &'static str {
    let h = crate::advanced_report::sha256_hex(id.as_bytes());
    let v = u32::from_str_radix(&h[..8], 16).unwrap_or(0) as f64 / u32::MAX as f64;
    if v < share {
        "test"
    } else {
        "train"
    }
}

/// A generated dataset in memory.
#[derive(Clone, Debug)]
pub struct Dataset {
    /// Settings.
    pub settings: Settings,
    /// All examples back to back.
    pub samples: Vec<Cf64>,
    /// Labels.
    pub labels: Vec<Label>,
}

/// Generate a dataset.
pub fn generate(s: &Settings) -> Result<Dataset, String> {
    if s.per_class == 0
        || s.per_class > 10_000
        || !(256..=1_048_576).contains(&s.samples)
        || s.fs_hz <= 0.0
        || s.fs_hz.is_nan()
        || s.jn_max_db < s.jn_min_db
        || !(0.0..=1.0).contains(&s.test_share)
    {
        return Err(crate::terr!("e-interference-lib-bad-settings"));
    }
    let mut rng = ChaCha8Rng::seed_from_u64(s.seed);
    let mut samples = Vec::with_capacity(CLASSES.len() * s.per_class * s.samples);
    let mut labels = Vec::new();
    for c in CLASSES {
        for i in 0..s.per_class {
            let id = format!("{}-{i:05}", c.name());
            let jn = s.jn_min_db + (s.jn_max_db - s.jn_min_db) * rng.gen::<f64>();
            let mut x = noise(&mut rng, s.samples);
            let (j, params) = interferer(c, &mut rng, s.samples, s.fs_hz);
            let a = 10f64.powf(jn / 20.0);
            for (xk, jk) in x.iter_mut().zip(&j) {
                *xk = *xk + *jk * a;
            }
            labels.push(Label {
                split: split_of(&id, s.test_share).to_string(),
                id,
                offset: samples.len(),
                len: s.samples,
                class: c,
                jn_db: (c != Class::None).then_some(jn),
                params,
            });
            samples.extend(x);
        }
    }
    Ok(Dataset {
        settings: s.clone(),
        samples,
        labels,
    })
}

/// The `samples.cf32` bytes.
pub fn cf32_bytes(x: &[Cf64]) -> Vec<u8> {
    let mut b = Vec::with_capacity(x.len() * 8);
    for z in x {
        b.extend_from_slice(&(z.re as f32).to_le_bytes());
        b.extend_from_slice(&(z.im as f32).to_le_bytes());
    }
    b
}

/// Read `samples.cf32` bytes.
pub fn cf32_read(b: &[u8]) -> Vec<Cf64> {
    b.chunks_exact(8)
        .map(|c| {
            Cf64::new(
                f64::from(f32::from_le_bytes([c[0], c[1], c[2], c[3]])),
                f64::from(f32::from_le_bytes([c[4], c[5], c[6], c[7]])),
            )
        })
        .collect()
}

/// Write the dataset to `dir`.
pub fn write(d: &Dataset, dir: &std::path::Path) -> Result<(), String> {
    let w = |name: &str, bytes: &[u8]| {
        let p = dir.join(name);
        std::fs::write(&p, bytes).map_err(|e| {
            crate::terr!(
                "e-interference-lib-cannot-write",
                path = p.display().to_string(),
                e = e
            )
        })
    };
    std::fs::create_dir_all(dir).map_err(|e| {
        crate::terr!(
            "e-interference-lib-cannot-write",
            path = dir.display().to_string(),
            e = e
        )
    })?;
    let bytes = cf32_bytes(&d.samples);
    w("samples.cf32", &bytes)?;
    let mut jl = String::new();
    for l in &d.labels {
        jl += &(serde_json::to_string(l).map_err(|e| e.to_string())? + "\n");
    }
    w("labels.jsonl", jl.as_bytes())?;
    let meta = serde_json::json!({
        "schema": SCHEMA,
        "label": LABEL,
        "settings": d.settings,
        "classes": CLASSES.iter().map(|c| c.name()).collect::<Vec<_>>(),
        "examples": d.labels.len(),
        "samples_sha256": crate::advanced_report::sha256_hex(&bytes),
        "format": "samples.cf32: interleaved little-endian f32 I/Q; labels.jsonl: one label per example",
    });
    w(
        "dataset.json",
        (serde_json::to_string_pretty(&meta).map_err(|e| e.to_string())? + "\n").as_bytes(),
    )
}

/// Read a dataset written by [`write`].
pub fn read(dir: &std::path::Path) -> Result<Dataset, String> {
    let r = |name: &str| {
        let p = dir.join(name);
        std::fs::read(&p).map_err(|e| {
            crate::terr!(
                "e-interference-lib-cannot-read",
                path = p.display().to_string(),
                e = e
            )
        })
    };
    let meta: Value = serde_json::from_slice(&r("dataset.json")?)
        .map_err(|e| crate::terr!("e-interference-lib-bad-dataset", e = e))?;
    if meta["schema"] != SCHEMA {
        return Err(crate::terr!("e-interference-lib-bad-dataset", e = SCHEMA));
    }
    let settings: Settings = serde_json::from_value(meta["settings"].clone())
        .map_err(|e| crate::terr!("e-interference-lib-bad-dataset", e = e))?;
    let bytes = r("samples.cf32")?;
    if meta["samples_sha256"].as_str() != Some(&crate::advanced_report::sha256_hex(&bytes)) {
        return Err(crate::terr!(
            "e-interference-lib-bad-dataset",
            e = "samples_sha256"
        ));
    }
    let samples = cf32_read(&bytes);
    let mut labels = Vec::new();
    for l in String::from_utf8_lossy(&r("labels.jsonl")?).lines() {
        if l.trim().is_empty() {
            continue;
        }
        let lab: Label = serde_json::from_str(l)
            .map_err(|e| crate::terr!("e-interference-lib-bad-dataset", e = e))?;
        if lab.offset + lab.len > samples.len() {
            return Err(crate::terr!("e-interference-lib-bad-dataset", e = lab.id));
        }
        labels.push(lab);
    }
    Ok(Dataset {
        settings,
        samples,
        labels,
    })
}

// ───────────────────────────── baseline classifier ─────────────────────────────

/// The baseline's features of one example.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Features {
    /// Total power over the unit noise floor, dB.
    pub excess_db: f64,
    /// Spectral flatness (geometric over arithmetic mean of a 256-bin averaged spectrum).
    pub flatness: f64,
    /// Largest bin over the median bin, dB.
    pub peak_db: f64,
    /// Share of bins over three times the median.
    pub occupied: f64,
    /// Share of samples whose power is over 1.5 times the noise-only level.
    pub duty: f64,
    /// Number of separate spectral peaks over 10 dB above the median.
    pub peaks: f64,
}

/// Compute the features.
pub fn features(x: &[Cf64]) -> Features {
    let n = x.len();
    let p: Vec<f64> = x.iter().map(|z| z.re * z.re + z.im * z.im).collect();
    let mean = p.iter().sum::<f64>() / n as f64;
    let nfft = 256usize;
    let mut psd = vec![0.0f64; nfft];
    let segs = (n / nfft).max(1);
    for s in 0..segs {
        let mut buf: Vec<Cf64> = (0..nfft)
            .map(|k| x.get(s * nfft + k).copied().unwrap_or(Cf64::new(0.0, 0.0)))
            .collect();
        crate::spectrum::fft_in_place(&mut buf, false);
        for (a, b) in psd.iter_mut().zip(&buf) {
            *a += (b.re * b.re + b.im * b.im) / segs as f64;
        }
    }
    let mut sorted = psd.clone();
    sorted.sort_by(f64::total_cmp);
    let med = sorted[nfft / 2].max(1e-300);
    let am = psd.iter().sum::<f64>() / nfft as f64;
    let gm = (psd.iter().map(|v| v.max(1e-300).pln()).sum::<f64>() / nfft as f64).pexp();
    let mut peaks = 0usize;
    for k in 0..nfft {
        let v = psd[k];
        let (l, r) = (psd[(k + nfft - 1) % nfft], psd[(k + 1) % nfft]);
        if v > 10.0 * med && v >= l && v > r {
            peaks += 1;
        }
    }
    let thr = 1.5 * (mean.min(1.0) + 1.0);
    Features {
        excess_db: 10.0 * mean.max(1e-12).plog10(),
        flatness: gm / am,
        peak_db: 10.0 * (sorted[nfft - 1] / med).plog10(),
        occupied: psd.iter().filter(|&&v| v > 3.0 * med).count() as f64 / nfft as f64,
        duty: p.iter().filter(|&&v| v > thr).count() as f64 / n as f64,
        peaks: peaks as f64,
    }
}

/// The baseline: fixed rules on the features (stated in docs/INTERFERENCE-LIB.md).
pub fn baseline_classify(f: &Features) -> Class {
    if f.excess_db < 0.8 {
        return Class::None;
    }
    if f.flatness > 0.6 {
        return Class::WidebandNoise;
    }
    if f.peak_db > 25.0 && f.peaks <= 1.0 {
        return if f.duty < 0.5 && f.excess_db < 6.0 {
            Class::Pulsed
        } else {
            Class::Cw
        };
    }
    if f.peaks >= 2.0 && f.peaks <= 8.0 && f.peak_db > 20.0 {
        return Class::Multitone;
    }
    if f.occupied < 0.25 {
        return Class::NarrowbandNoise;
    }
    if f.flatness > 0.25 {
        Class::Chirp
    } else {
        Class::FmTone
    }
}

/// Run the baseline over the test split: CSV `id,label`.
pub fn baseline(d: &Dataset) -> String {
    let mut out = String::from("id,label\n");
    for l in d.labels.iter().filter(|l| l.split == "test") {
        let x = &d.samples[l.offset..l.offset + l.len];
        out += &format!("{},{}\n", l.id, baseline_classify(&features(x)).name());
    }
    out
}

// ───────────────────────────── scoring ─────────────────────────────

/// The score report.
#[derive(Clone, Debug, Serialize)]
pub struct Score {
    /// Document schema.
    pub schema: &'static str,
    /// Label.
    pub label: &'static str,
    /// The pre-registered primary metric.
    pub primary_metric: &'static str,
    /// Macro-averaged F1 over the classes.
    pub macro_f1: f64,
    /// Balanced accuracy (mean recall).
    pub balanced_accuracy: f64,
    /// Test examples scored.
    pub test_examples: usize,
    /// Test examples with no prediction (counted wrong).
    pub missing: usize,
    /// Confusion matrix: rows truth, columns predicted, in [`CLASSES`] order.
    pub confusion: Vec<Vec<usize>>,
    /// `(class, precision, recall, f1)`.
    pub per_class: Vec<(String, f64, f64, f64)>,
    /// `(J/N bin, accuracy, count)`; the `none` class is outside the bins.
    pub accuracy_by_jn: Vec<(String, f64, usize)>,
}

/// Score predictions (CSV `id,label`) against the dataset's test split.
pub fn score(d: &Dataset, predictions: &str) -> Result<Score, String> {
    let mut pred: BTreeMap<String, Class> = BTreeMap::new();
    for (n, l) in predictions.lines().enumerate() {
        let l = l.trim();
        if l.is_empty() || (n == 0 && l.starts_with("id,")) {
            continue;
        }
        let (id, lab) = l
            .split_once(',')
            .ok_or_else(|| crate::terr!("e-interference-lib-bad-prediction", line = n + 1))?;
        let c = Class::parse(lab.trim())
            .ok_or_else(|| crate::terr!("e-interference-lib-bad-prediction", line = n + 1))?;
        pred.insert(id.trim().to_string(), c);
    }
    let k = CLASSES.len();
    let idx = |c: Class| CLASSES.iter().position(|x| *x == c).unwrap_or(0);
    let mut cm = vec![vec![0usize; k]; k];
    let mut missing = 0usize;
    let bins = [(0.0, 5.0), (5.0, 10.0), (10.0, 15.0), (15.0, 20.0)];
    let mut by_bin = vec![(0usize, 0usize); bins.len()];
    let test: Vec<&Label> = d.labels.iter().filter(|l| l.split == "test").collect();
    for l in &test {
        let p = pred.get(&l.id).copied();
        if p.is_none() {
            missing += 1;
        }
        let ok = p == Some(l.class);
        if let Some(p) = p {
            cm[idx(l.class)][idx(p)] += 1;
        }
        if let Some(jn) = l.jn_db {
            if let Some(b) = bins.iter().position(|(lo, hi)| jn >= *lo && jn < *hi) {
                by_bin[b].1 += 1;
                if ok {
                    by_bin[b].0 += 1;
                }
            }
        }
    }
    let mut per = Vec::new();
    let (mut f1s, mut recs) = (0.0, 0.0);
    for (i, c) in CLASSES.iter().enumerate() {
        let tp = cm[i][i] as f64;
        let truth_n = test.iter().filter(|l| l.class == *c).count() as f64;
        let pred_n: f64 = (0..k).map(|r| cm[r][i] as f64).sum();
        let prec = if pred_n > 0.0 { tp / pred_n } else { 0.0 };
        let rec = if truth_n > 0.0 { tp / truth_n } else { 0.0 };
        let f1 = if prec + rec > 0.0 {
            2.0 * prec * rec / (prec + rec)
        } else {
            0.0
        };
        f1s += f1;
        recs += rec;
        per.push((c.name().to_string(), prec, rec, f1));
    }
    Ok(Score {
        schema: "kshana.interference-score/1",
        label: LABEL,
        primary_metric:
            "macro-averaged F1 over the eight classes on the test split (pre-registered)",
        macro_f1: f1s / k as f64,
        balanced_accuracy: recs / k as f64,
        test_examples: test.len(),
        missing,
        confusion: cm,
        per_class: per,
        accuracy_by_jn: bins
            .iter()
            .zip(&by_bin)
            .map(|((lo, hi), (ok, n))| {
                (
                    format!("{lo:.0}-{hi:.0} dB"),
                    if *n > 0 { *ok as f64 / *n as f64 } else { 0.0 },
                    *n,
                )
            })
            .collect(),
    })
}

// ───────────────────────────── command line ─────────────────────────────

/// `kshana interference-lib <generate|baseline|score|classes> ...`.
pub fn run_cli(args: &[String]) -> i32 {
    match cli(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn cli(args: &[String]) -> Result<(), String> {
    let Some(sub) = args.first() else {
        return Err(crate::t!("interference-lib-usage"));
    };
    if sub == "--help" || sub == "-h" || args.iter().any(|a| a == "--help") {
        println!("{}", crate::t!("interference-lib-usage"));
        return Ok(());
    }
    let mut kv: Vec<(String, String)> = Vec::new();
    let mut it = args[1..].iter();
    while let Some(a) = it.next() {
        if !a.starts_with("--") {
            return Err(crate::t!("interference-lib-usage"));
        }
        let v = it
            .next()
            .ok_or_else(|| crate::terr!("e-interference-lib-missing-value", option = a))?;
        kv.push((a.clone(), v.clone()));
    }
    let known: &[&str] = match sub.as_str() {
        "generate" => &[
            "--out",
            "--seed",
            "--per-class",
            "--samples",
            "--fs",
            "--jn-min",
            "--jn-max",
            "--test-share",
        ],
        "baseline" => &["--dataset", "--out"],
        "score" => &["--dataset", "--predictions"],
        "classes" => &[],
        _ => return Err(crate::t!("interference-lib-usage")),
    };
    if let Some((k, _)) = kv.iter().find(|(k, _)| !known.contains(&k.as_str())) {
        return Err(crate::terr!(
            "e-interference-lib-unknown-option",
            option = k
        ));
    }
    let get = |k: &str| kv.iter().rev().find(|p| p.0 == k).map(|p| p.1.clone());
    let num = |k: &str| -> Result<Option<f64>, String> {
        get(k)
            .map(|v| {
                v.parse::<f64>()
                    .ok()
                    .filter(|x| x.is_finite())
                    .ok_or_else(|| {
                        crate::terr!("e-interference-lib-bad-number", option = k, value = v)
                    })
            })
            .transpose()
    };
    let need = |k: &str| get(k).ok_or_else(|| crate::t!("interference-lib-usage"));
    match sub.as_str() {
        "classes" => {
            println!(
                "{}",
                serde_json::json!(CLASSES.iter().map(|c| c.name()).collect::<Vec<_>>())
            );
        }
        "generate" => {
            let mut s = Settings::default();
            if let Some(v) = num("--seed")? {
                s.seed = v as u64;
            }
            if let Some(v) = num("--per-class")? {
                s.per_class = v as usize;
            }
            if let Some(v) = num("--samples")? {
                s.samples = v as usize;
            }
            if let Some(v) = num("--fs")? {
                s.fs_hz = v;
            }
            if let Some(v) = num("--jn-min")? {
                s.jn_min_db = v;
            }
            if let Some(v) = num("--jn-max")? {
                s.jn_max_db = v;
            }
            if let Some(v) = num("--test-share")? {
                s.test_share = v;
            }
            let d = generate(&s)?;
            write(&d, std::path::Path::new(&need("--out")?))?;
        }
        "baseline" => {
            let d = read(std::path::Path::new(&need("--dataset")?))?;
            let csv = baseline(&d);
            match get("--out") {
                Some(p) => std::fs::write(&p, csv).map_err(|e| {
                    crate::terr!("e-interference-lib-cannot-write", path = p, e = e)
                })?,
                None => print!("{csv}"),
            }
        }
        "score" => {
            let d = read(std::path::Path::new(&need("--dataset")?))?;
            let p = need("--predictions")?;
            let text = std::fs::read_to_string(&p)
                .map_err(|e| crate::terr!("e-interference-lib-cannot-read", path = p, e = e))?;
            let s = score(&d, &text)?;
            println!(
                "{}",
                serde_json::to_string_pretty(&s).map_err(|e| e.to_string())?
            );
        }
        _ => unreachable!(),
    }
    Ok(())
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn every_class_is_calibrated_to_its_stated_power() {
        let mut rng = ChaCha8Rng::seed_from_u64(9);
        for c in CLASSES.into_iter().filter(|c| *c != Class::None) {
            let (j, _) = interferer(c, &mut rng, 8192, 4e6);
            let on: Vec<f64> = j
                .iter()
                .map(|z| z.re * z.re + z.im * z.im)
                .filter(|&q| q > 0.0)
                .collect();
            let p = on.iter().sum::<f64>() / on.len() as f64;
            assert!((10.0 * p.log10()).abs() < 0.05, "{c:?}: {p}");
        }
        let n = noise(&mut rng, 100_000);
        let p = n.iter().map(|z| z.re * z.re + z.im * z.im).sum::<f64>() / n.len() as f64;
        assert!((p - 1.0).abs() < 0.02, "{p}");
    }

    #[test]
    fn deterministic_and_round_trips_through_cf32() {
        let s = Settings {
            per_class: 3,
            samples: 512,
            ..Settings::default()
        };
        let a = generate(&s).unwrap();
        let b = generate(&s).unwrap();
        assert_eq!(cf32_bytes(&a.samples), cf32_bytes(&b.samples));
        assert_eq!(a.labels, b.labels);
        let back = cf32_read(&cf32_bytes(&a.samples));
        assert_eq!(back.len(), a.samples.len());
        assert!((back[7].re - a.samples[7].re).abs() < 1e-6);
        assert!(generate(&Settings {
            per_class: 0,
            ..s.clone()
        })
        .is_err());
    }

    #[test]
    fn the_baseline_beats_chance_and_a_perfect_oracle_scores_one() {
        let s = Settings {
            per_class: 30,
            samples: 2048,
            ..Settings::default()
        };
        let d = generate(&s).unwrap();
        let oracle: String = d
            .labels
            .iter()
            .map(|l| format!("{},{}\n", l.id, l.class.name()))
            .collect();
        let o = score(&d, &oracle).unwrap();
        assert!((o.macro_f1 - 1.0).abs() < 1e-12);
        let b = score(&d, &baseline(&d)).unwrap();
        // Chance is 1/8. The baseline must beat it clearly; its exact figure is recorded in
        // docs/INTERFERENCE-LIB.md.
        assert!(b.macro_f1 > 0.4, "{}", b.macro_f1);
        assert_eq!(b.missing, 0);
        let empty = score(&d, "id,label\n").unwrap();
        assert_eq!(empty.missing, empty.test_examples);
        assert!(score(&d, "x,laser\n").is_err());
    }
}
