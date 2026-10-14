// SPDX-License-Identifier: AGPL-3.0-only
//! **Measured 50 Hz scintillation logs and the Cornell-model comparison harness.**
//!
//! Reads a high-rate GNSS scintillation log of the form published with Zenodo record
//! 16941224 (INGV, Malindi, GPS L1, 50 Hz; columns
//! `tow svid carrier_phase I Q time`, carrier phase in cycles), detrends it the way
//! scintillation monitors do (signal intensity divided by a 0.1 Hz 6th-order Butterworth
//! low-pass; phase through a 0.1 Hz 6th-order Butterworth high-pass), cuts 60 s windows and
//! computes S4, σφ and the intensity decorrelation lag per window. [`compare`] then drives the
//! IQ channel's Cornell model ([`crate::iq::channel::scint`]) at each window's measured S4 and
//! intensity decorrelation lag, runs the model output through the *same* processing, and
//! reports the statistics the model generates beyond its two inputs: the deep-fade
//! probability, the intensity distribution (Kolmogorov–Smirnov distance), the phase
//! scintillation tied to S4, and the fade duration.
//!
//! The processing and the bars are those fixed in `xval/scint-malindi/PREREGISTRATION.md`;
//! the parameters are constants here so they cannot drift per call. The data is not
//! vendored: `scripts/fetch_scint_malindi.sh` fetches it and checks its SHA-256, and
//! `tests/iq_scint_malindi_measured.rs` gates on it.

use crate::iq::channel::scint::{ScintParams, Scintillation, BUTTERWORTH_1_OVER_E_X};
use std::f64::consts::{PI, TAU};

/// Sample rate of the log (Hz).
pub const FS_HZ: f64 = 50.0;
/// Sample interval (s).
pub const DT_S: f64 = 0.02;
/// Cut-off of the detrending filters (Hz).
pub const DETREND_HZ: f64 = 0.1;
/// Samples discarded at the start of every segment (120 s filter transient).
pub const GUARD_SAMPLES: usize = 6000;
/// Samples per window (60 s).
pub const WINDOW_SAMPLES: usize = 3000;
/// Shortest segment kept (300 s).
pub const MIN_SEGMENT_SAMPLES: usize = 15_000;
/// Longest lag searched for the intensity 1/e lag (500 lags, 10 s).
pub const MAX_LAG: usize = 500;
/// Deep-fade threshold on detrended intensity (−10 dB).
pub const FADE_LEVEL: f64 = 0.1;
/// Model realisations per qualifying window.
pub const REALISATIONS: u64 = 10;
/// Qualifying S4 range (inclusive).
pub const S4_RANGE: (f64, f64) = (0.3, 1.0);

/// One line of the log.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LogSample {
    /// GPS time of week (s).
    pub tow: f64,
    /// Satellite number.
    pub svid: u32,
    /// Carrier phase (cycles).
    pub carrier_phase_cyc: f64,
    /// Prompt in-phase correlator output.
    pub i: f64,
    /// Prompt quadrature correlator output.
    pub q: f64,
}

/// Parse the log. Returns the samples and the number of non-header lines that did not
/// parse (skipped).
pub fn parse_log(text: &str) -> (Vec<LogSample>, usize) {
    let mut out = Vec::new();
    let mut bad = 0;
    for line in text.lines() {
        let t = line.trim();
        if t.is_empty() || t.starts_with("tow") {
            continue;
        }
        let f: Vec<&str> = t.split_whitespace().collect();
        let parsed = (f.len() >= 5)
            .then(|| {
                Some(LogSample {
                    tow: f[0].parse().ok()?,
                    svid: f[1].parse().ok()?,
                    carrier_phase_cyc: f[2].parse().ok()?,
                    i: f[3].parse().ok()?,
                    q: f[4].parse().ok()?,
                })
            })
            .flatten();
        match parsed {
            Some(s) => out.push(s),
            None => bad += 1,
        }
    }
    (out, bad)
}

/// Split into contiguous segments (consecutive `tow` steps of 0.02 s ± 0.001 s), keeping
/// segments of at least [`MIN_SEGMENT_SAMPLES`].
pub fn segments(samples: &[LogSample]) -> Vec<&[LogSample]> {
    let mut out = Vec::new();
    let mut start = 0;
    for k in 1..=samples.len() {
        let brk =
            k == samples.len() || ((samples[k].tow - samples[k - 1].tow) - DT_S).abs() > 0.001;
        if brk {
            if k - start >= MIN_SEGMENT_SAMPLES {
                out.push(&samples[start..k]);
            }
            start = k;
        }
    }
    out
}

#[derive(Clone, Copy, Debug)]
struct Biquad {
    b: [f64; 3],
    a: [f64; 2],
    z: [f64; 2],
}

impl Biquad {
    fn step(&mut self, x: f64) -> f64 {
        let y = self.b[0] * x + self.z[0];
        self.z[0] = self.b[1] * x - self.a[0] * y + self.z[1];
        self.z[1] = self.b[2] * x - self.a[1] * y;
        y
    }
}

/// A causal 6th-order Butterworth filter at `fc` (bilinear transform pre-warped at `fs`),
/// three cascaded biquads.
fn butter6(fc: f64, fs: f64, high_pass: bool) -> [Biquad; 3] {
    let k = (PI * fc / fs).tan();
    let mk = |idx: usize| {
        let zeta = (PI * (2 * idx + 1) as f64 / 12.0).sin();
        let norm = 1.0 / (1.0 + 2.0 * zeta * k + k * k);
        let a = [
            2.0 * (k * k - 1.0) * norm,
            (1.0 - 2.0 * zeta * k + k * k) * norm,
        ];
        let b = if high_pass {
            [norm, -2.0 * norm, norm]
        } else {
            let b0 = k * k * norm;
            [b0, 2.0 * b0, b0]
        };
        Biquad { b, a, z: [0.0; 2] }
    };
    [mk(0), mk(1), mk(2)]
}

/// Low-pass at [`DETREND_HZ`], started in steady state at `x[0]`.
pub fn lowpass6(x: &[f64]) -> Vec<f64> {
    let mut f = butter6(DETREND_HZ, FS_HZ, false);
    if let Some(&x0) = x.first() {
        for s in &mut f {
            s.z[0] = (s.b[1] + s.b[2] - s.a[0] - s.a[1]) * x0;
            s.z[1] = (s.b[2] - s.a[1]) * x0;
        }
    }
    x.iter()
        .map(|&v| f.iter_mut().fold(v, |acc, s| s.step(acc)))
        .collect()
}

/// High-pass at [`DETREND_HZ`], started from rest.
pub fn highpass6(x: &[f64]) -> Vec<f64> {
    let mut f = butter6(DETREND_HZ, FS_HZ, true);
    x.iter()
        .map(|&v| f.iter_mut().fold(v, |acc, s| s.step(acc)))
        .collect()
}

/// Statistics of one 60 s window.
#[derive(Clone, Debug)]
pub struct WindowStats {
    /// Amplitude scintillation index of the detrended intensity.
    pub s4: f64,
    /// Standard deviation of the detrended phase (rad).
    pub sigma_phi_rad: f64,
    /// 1/e lag of the detrended-intensity autocovariance (s), if reached within 10 s.
    pub tau_i_s: Option<f64>,
    /// Largest sample-to-sample step of the detrended phase (rad).
    pub max_dphi_rad: f64,
    /// The detrended intensity samples.
    pub id: Vec<f64>,
}

impl WindowStats {
    /// The pre-registered qualification: S4 in range, τI found, no cycle slip.
    pub fn qualifies(&self) -> bool {
        self.s4 >= S4_RANGE.0
            && self.s4 <= S4_RANGE.1
            && self.tau_i_s.is_some()
            && self.max_dphi_rad < PI
    }
}

fn mean(x: &[f64]) -> f64 {
    x.iter().sum::<f64>() / x.len() as f64
}

/// 1/e lag (s) of the biased normalised autocovariance of `x`, linearly interpolated.
pub fn one_over_e_lag_s(x: &[f64]) -> Option<f64> {
    let m = mean(x);
    let d: Vec<f64> = x.iter().map(|v| v - m).collect();
    let c = |lag: usize| {
        d[..d.len() - lag]
            .iter()
            .zip(&d[lag..])
            .map(|(a, b)| a * b)
            .sum::<f64>()
    };
    let c0 = c(0);
    if c0 <= 0.0 {
        return None;
    }
    let target = (-1f64).exp();
    let mut prev = 1.0;
    for lag in 1..=MAX_LAG.min(d.len() - 1) {
        let r = c(lag) / c0;
        if r < target {
            return Some(((lag - 1) as f64 + (prev - target) / (prev - r)) * DT_S);
        }
        prev = r;
    }
    None
}

/// Detrend one contiguous record (signal intensity and phase in rad, from the record's own
/// start) and cut it into windows after the guard.
pub fn windows(si: &[f64], phase_rad: &[f64]) -> Vec<WindowStats> {
    let trend = lowpass6(si);
    let id: Vec<f64> = si.iter().zip(&trend).map(|(s, t)| s / t).collect();
    let p0 = phase_rad.first().copied().unwrap_or(0.0);
    let ph: Vec<f64> = phase_rad.iter().map(|p| p - p0).collect();
    let phd = highpass6(&ph);
    let mut out = Vec::new();
    let mut k = GUARD_SAMPLES;
    while k + WINDOW_SAMPLES <= si.len() {
        let w = &id[k..k + WINDOW_SAMPLES];
        let p = &phd[k..k + WINDOW_SAMPLES];
        let m1 = mean(w);
        let m2 = w.iter().map(|v| v * v).sum::<f64>() / w.len() as f64;
        let pm = mean(p);
        let sd = (p.iter().map(|v| (v - pm).powi(2)).sum::<f64>() / p.len() as f64).sqrt();
        let max_dphi = p
            .windows(2)
            .map(|q| (q[1] - q[0]).abs())
            .fold(0.0, f64::max);
        out.push(WindowStats {
            s4: (m2 - m1 * m1).max(0.0).sqrt() / m1,
            sigma_phi_rad: sd,
            tau_i_s: one_over_e_lag_s(w),
            max_dphi_rad: max_dphi,
            id: w.to_vec(),
        });
        k += WINDOW_SAMPLES;
    }
    out
}

/// Windows of a measured segment (intensity `I² + Q²`, phase `2π·carrier_phase`).
pub fn measured_windows(seg: &[LogSample]) -> Vec<WindowStats> {
    let si: Vec<f64> = seg.iter().map(|s| s.i * s.i + s.q * s.q).collect();
    let ph: Vec<f64> = seg
        .iter()
        .map(|s| TAU * (s.carrier_phase_cyc - seg[0].carrier_phase_cyc))
        .collect();
    windows(&si, &ph)
}

/// The Cornell-model τ0 whose Rice *intensity* autocorrelation reaches 1/e at `tau_i_s`
/// for amplitude index `s4` (0 < S4 ≤ 1).
pub fn tau0_for_intensity_lag(s4: f64, tau_i_s: f64) -> f64 {
    let p = ScintParams::new(s4, 1.0).diffuse_power();
    let zh2 = 1.0 - p;
    let c = (-1f64).exp() * (2.0 * zh2 * p + p * p);
    let rho = (-zh2 + (zh2 * zh2 + c).sqrt()) / p;
    let f = |x: f64| (-x).exp() * (x.cos() + x.sin());
    let (mut lo, mut hi) = (0.0, 0.75 * PI);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if f(mid) > rho {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    tau_i_s * BUTTERWORTH_1_OVER_E_X / (0.5 * (lo + hi))
}

/// The model's windows for one measured window: realisation `r` uses seed `1000·w + r`,
/// 180 s at 50 Hz through the same processing (the last 3000 samples after the guard).
pub fn model_windows(w_index: u64, s4: f64, tau_i_s: f64) -> Vec<WindowStats> {
    let tau0 = tau0_for_intensity_lag(s4, tau_i_s);
    (0..REALISATIONS)
        .flat_map(|r| {
            let mut sc = Scintillation::new(ScintParams::new(s4, tau0), 1000 * w_index + r);
            let xs = sc.series(1, DT_S, GUARD_SAMPLES + WINDOW_SAMPLES);
            let si: Vec<f64> = xs.iter().map(|s| s.amplitude * s.amplitude).collect();
            let ph: Vec<f64> = xs.iter().map(|s| s.phase_rad).collect();
            windows(&si, &ph)
        })
        .collect()
}

/// Lengths (samples) of the maximal runs below [`FADE_LEVEL`] inside a window.
pub fn fade_runs(id: &[f64]) -> Vec<usize> {
    let mut out = Vec::new();
    let mut run = 0;
    for &v in id {
        if v < FADE_LEVEL {
            run += 1;
        } else if run > 0 {
            out.push(run);
            run = 0;
        }
    }
    if run > 0 {
        out.push(run);
    }
    out
}

/// Two-sample Kolmogorov–Smirnov distance.
pub fn ks_distance(a: &[f64], b: &[f64]) -> f64 {
    let mut a = a.to_vec();
    let mut b = b.to_vec();
    a.sort_by(f64::total_cmp);
    b.sort_by(f64::total_cmp);
    let (na, nb) = (a.len() as f64, b.len() as f64);
    let (mut i, mut j, mut d) = (0usize, 0usize, 0f64);
    while i < a.len() && j < b.len() {
        let x = a[i].min(b[j]);
        while i < a.len() && a[i] <= x {
            i += 1;
        }
        while j < b.len() && b[j] <= x {
            j += 1;
        }
        d = d.max((i as f64 / na - j as f64 / nb).abs());
    }
    d
}

/// The pre-registered comparison's numbers.
#[derive(Clone, Debug, Default)]
pub struct Comparison {
    /// Windows cut from all segments.
    pub windows_total: usize,
    /// Qualifying windows (N1).
    pub windows_qualifying: usize,
    /// Qualifying windows rejected only for a cycle slip.
    pub windows_slipped: usize,
    /// Measured samples below −10 dB (N1).
    pub meas_fade_samples: usize,
    /// Measured fades (N1).
    pub meas_fades: usize,
    /// Median measured S4 and τI (s) of the qualifying windows (context).
    pub median_s4: f64,
    /// Median measured intensity 1/e lag (s).
    pub median_tau_i_s: f64,
    /// B1: pooled deep-fade fraction, measured and model.
    pub fade_frac_meas: f64,
    /// B1 model value.
    pub fade_frac_model: f64,
    /// B2: KS distance of the pooled detrended intensity.
    pub ks_d: f64,
    /// B3: median over windows of σφ_meas / σφ_model.
    pub sigma_phi_ratio_median: f64,
    /// B4: mean fade duration (s), measured and model.
    pub fade_dur_meas_s: f64,
    /// B4 model value.
    pub fade_dur_model_s: f64,
}

impl Comparison {
    /// N1 non-vacuity.
    pub fn n1(&self) -> bool {
        self.windows_qualifying >= 20 && self.meas_fade_samples >= 200 && self.meas_fades >= 50
    }
    /// B1 ratio model/measured.
    pub fn b1_ratio(&self) -> f64 {
        self.fade_frac_model / self.fade_frac_meas
    }
    /// B1 bar.
    pub fn b1(&self) -> bool {
        (0.5..=2.0).contains(&self.b1_ratio())
    }
    /// B2 bar.
    pub fn b2(&self) -> bool {
        self.ks_d <= 0.05
    }
    /// B3 bar.
    pub fn b3(&self) -> bool {
        (2.0 / 3.0..=1.5).contains(&self.sigma_phi_ratio_median)
    }
    /// B4 ratio model/measured.
    pub fn b4_ratio(&self) -> f64 {
        self.fade_dur_model_s / self.fade_dur_meas_s
    }
    /// B4 bar.
    pub fn b4(&self) -> bool {
        (2.0 / 3.0..=1.5).contains(&self.b4_ratio())
    }
}

fn median(mut v: Vec<f64>) -> f64 {
    if v.is_empty() {
        return f64::NAN;
    }
    v.sort_by(f64::total_cmp);
    let n = v.len();
    if n % 2 == 1 {
        v[n / 2]
    } else {
        0.5 * (v[n / 2 - 1] + v[n / 2])
    }
}

/// Run the pre-registered comparison on measured windows (in time order).
pub fn compare(measured: &[WindowStats]) -> Comparison {
    let mut c = Comparison {
        windows_total: measured.len(),
        ..Default::default()
    };
    let (mut meas_id, mut model_id) = (Vec::new(), Vec::new());
    let (mut meas_runs, mut model_runs) = (Vec::new(), Vec::new());
    let (mut ratios, mut s4s, mut taus) = (Vec::new(), Vec::new(), Vec::new());
    let mut w_index = 0u64;
    for w in measured {
        if !w.qualifies() {
            let slip_only = w.s4 >= S4_RANGE.0
                && w.s4 <= S4_RANGE.1
                && w.tau_i_s.is_some()
                && w.max_dphi_rad >= PI;
            c.windows_slipped += usize::from(slip_only);
            continue;
        }
        let tau_i = w.tau_i_s.expect("qualifying window has τI");
        let model = model_windows(w_index, w.s4, tau_i);
        w_index += 1;
        meas_id.extend_from_slice(&w.id);
        meas_runs.extend(fade_runs(&w.id));
        for m in &model {
            model_id.extend_from_slice(&m.id);
            model_runs.extend(fade_runs(&m.id));
        }
        let sp_model = model.iter().map(|m| m.sigma_phi_rad).sum::<f64>() / model.len() as f64;
        ratios.push(w.sigma_phi_rad / sp_model);
        s4s.push(w.s4);
        taus.push(tau_i);
    }
    c.windows_qualifying = ratios.len();
    if c.windows_qualifying == 0 {
        return c;
    }
    let below = |x: &[f64]| x.iter().filter(|&&v| v < FADE_LEVEL).count();
    c.meas_fade_samples = below(&meas_id);
    c.meas_fades = meas_runs.len();
    c.fade_frac_meas = c.meas_fade_samples as f64 / meas_id.len() as f64;
    c.fade_frac_model = below(&model_id) as f64 / model_id.len() as f64;
    c.ks_d = ks_distance(&meas_id, &model_id);
    c.sigma_phi_ratio_median = median(ratios);
    let mean_dur = |r: &[usize]| r.iter().sum::<usize>() as f64 * DT_S / r.len() as f64;
    c.fade_dur_meas_s = mean_dur(&meas_runs);
    c.fade_dur_model_s = mean_dur(&model_runs);
    c.median_s4 = median(s4s);
    c.median_tau_i_s = median(taus);
    c
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn parses_the_published_columns_and_counts_bad_lines() {
        let text = "tow svid carrier_phase I Q time\n\
                    576000 26 114813880.067 -351 -3 16:00:00.000\n\
                    576000.02 26 114813846.79 -343 4 16:00:00.020\n\
                    garbage line\n";
        let (s, bad) = parse_log(text);
        assert_eq!(bad, 1);
        assert_eq!(s.len(), 2);
        assert_eq!(s[1].svid, 26);
        assert_eq!(s[1].i, -343.0);
        assert!((s[1].carrier_phase_cyc - 114_813_846.79).abs() < 1e-6);
    }

    #[test]
    fn segments_break_on_gaps_and_drop_short_ones() {
        let mk = |tow: f64| LogSample {
            tow,
            svid: 1,
            carrier_phase_cyc: 0.0,
            i: 1.0,
            q: 0.0,
        };
        let mut v: Vec<LogSample> = (0..MIN_SEGMENT_SAMPLES)
            .map(|k| mk(k as f64 * DT_S))
            .collect();
        v.extend((0..100).map(|k| mk(1000.0 + k as f64 * DT_S)));
        let segs = segments(&v);
        assert_eq!(segs.len(), 1);
        assert_eq!(segs[0].len(), MIN_SEGMENT_SAMPLES);
    }

    #[test]
    fn butterworth_lowpass_has_unit_dc_gain_and_minus_3db_at_cutoff() {
        // Constant input stays constant from the steady-state start.
        let y = lowpass6(&[2.5; 500]);
        assert!(y.iter().all(|v| (v - 2.5).abs() < 1e-9));
        // A sinusoid at the cut-off comes out at 1/√2 (after the transient).
        let n = 40_000;
        let x: Vec<f64> = (0..n)
            .map(|k| (TAU * DETREND_HZ * k as f64 * DT_S).sin())
            .collect();
        for (y, want) in [
            (lowpass6(&x), 0.5f64.sqrt()),
            (highpass6(&x), 0.5f64.sqrt()),
        ] {
            let tail = &y[n / 2..];
            let rms = (tail.iter().map(|v| v * v).sum::<f64>() / tail.len() as f64).sqrt();
            assert!((rms * 2f64.sqrt() - want).abs() < 2e-3, "{rms}");
        }
        // High-pass rejects a ramp (a constant Doppler) once the transient has gone.
        let ramp: Vec<f64> = (0..20_000).map(|k| 1e3 * k as f64 * DT_S).collect();
        let h = highpass6(&ramp);
        assert!(h[GUARD_SAMPLES..].iter().all(|v| v.abs() < 1e-3));
    }

    #[test]
    fn tau0_inversion_reproduces_the_intensity_lag_of_the_model() {
        let (s4, tau_i) = (0.6, 0.5);
        let tau0 = tau0_for_intensity_lag(s4, tau_i);
        assert!(tau0 > tau_i, "intensity decorrelates faster than the field");
        let mut sc = Scintillation::new(ScintParams::new(s4, tau0), 5);
        let xs = sc.series(1, DT_S, 400_000);
        let i: Vec<f64> = xs.iter().map(|s| s.amplitude * s.amplitude).collect();
        // Average the lag over 40 blocks of 10 000 samples.
        let lags: Vec<f64> = i.chunks(10_000).filter_map(one_over_e_lag_s).collect();
        let got = lags.iter().sum::<f64>() / lags.len() as f64;
        assert!((got - tau_i).abs() / tau_i < 0.05, "{got}");
    }

    #[test]
    fn fade_runs_and_ks_distance_on_hand_cases() {
        assert_eq!(
            fade_runs(&[0.05, 0.05, 1.0, 0.01, 1.0, 0.09]),
            vec![2, 1, 1]
        );
        assert_eq!(ks_distance(&[1.0, 2.0, 3.0], &[1.0, 2.0, 3.0]), 0.0);
        assert!((ks_distance(&[0.0, 1.0], &[2.0, 3.0]) - 1.0).abs() < 1e-12);
    }

    /// Model output as "measured" data, 4 S4 values × 8 windows (seeds differ from those
    /// the comparison uses), with the model phase as given or unwrapped.
    fn self_check(unwrap: bool) -> Comparison {
        let mut meas = Vec::new();
        for (k, s4) in [0.4, 0.55, 0.7, 0.85].into_iter().enumerate() {
            let tau0 = 0.6;
            let mut sc = Scintillation::new(ScintParams::new(s4, tau0), 900_000 + k as u64);
            let xs = sc.series(3, DT_S, GUARD_SAMPLES + 8 * WINDOW_SAMPLES);
            let si: Vec<f64> = xs.iter().map(|s| s.amplitude * s.amplitude).collect();
            let mut ph: Vec<f64> = xs.iter().map(|s| s.phase_rad).collect();
            if unwrap {
                for k in 1..ph.len() {
                    let d = ph[k] - ph[k - 1];
                    ph[k] -= TAU * (d / TAU).round();
                }
            }
            meas.extend(windows(&si, &ph));
        }
        compare(&meas)
    }

    /// Harness self-check as first written: model output treated as "measured" data should
    /// pass every bar against the model. It does not (finding F2): the model's `phase_rad` is
    /// the wrapped `atan2` in (−π, π], so each wrap is a 2π step of the detrended phase and
    /// reads as a cycle slip. The registered processing is left as registered; this test
    /// asserts the recorded outcome (5 windows rejected as slips, 22 of 32 qualifying), and the
    /// effect on B3 is reported post hoc in `xval/scint-malindi/RESULTS.md`.
    #[test]
    fn model_data_through_the_harness_shows_the_wrapped_phase_finding() {
        let c = self_check(false);
        assert_eq!((c.windows_slipped, c.windows_qualifying), (5, 22), "{c:?}");
    }

    /// The same self-check with the model phase unwrapped (a continuous phase, as a tracking
    /// receiver reports): no window reads as a cycle slip, N1 holds and every bar passes, so
    /// the rest of the harness is consistent with the model. (Five of the 32 windows fall
    /// outside the S4 range or reach no 1/e lag with either phase.)
    #[test]
    fn model_data_with_unwrapped_phase_passes_its_own_bars() {
        let c = self_check(true);
        let wrapped = self_check(false);
        eprintln!("wrapped: {wrapped:?}\nunwrapped: {c:?}");
        assert_eq!(c.windows_slipped, 0, "{c:?}");
        assert!(c.n1(), "{c:?}");
        assert!(c.b1() && c.b2() && c.b3() && c.b4(), "{c:?}");
    }
}
