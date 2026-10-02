// SPDX-License-Identifier: AGPL-3.0-only
//! Conditioning of a measured clock record with a visible log of every gap, outlier, phase step,
//! burst and frequency step: the step between ingesting a record and fitting a device card to it.
//!
//! # The detector (design fixed in the clock-library pre-registration)
//!
//! It works on the first differences of phase, the fractional frequencies
//! `y_i = (x_{i+1} - x_i) / tau0`, defined where both samples are present.
//!
//! 1. **Gaps.** Every run of missing epochs in the input is logged with its length. Nothing is
//!    interpolated.
//! 2. **Residuals.** `e_i = y_i - median(y_{i-H} .. y_{i+H})` over the present values, with
//!    `H =` [`MEDIAN_HALF_WINDOW`]. The robust scale is `s = 1.4826 * MAD(e)` over the whole
//!    record (MAD, median absolute deviation about the median).
//! 3. **Flags.** `y_i` is flagged when `|e_i| > K s`, `K =` [`K_OUTLIER`]. Runs of consecutive
//!    flagged differences are classified:
//!    * one flagged difference: a **phase step** between `x_i` and `x_{i+1}` of size
//!      `e_i * tau0`, removed by subtracting it from every later sample;
//!    * two flagged differences of opposite sign whose residuals cancel to within half the
//!      larger one: a **phase outlier** at the shared sample, which is set missing;
//!    * anything else (two or more flags): a **burst**; the samples inside the run are set
//!      missing.
//! 4. **Frequency steps.** On the cleaned record, at each boundary `i` with at least 80 % of
//!    the [`FSTEP_WINDOW`] differences present on both sides, `D = median(after) -
//!    median(before)` and `z = |D| / (1.2533 s sqrt(2 / L))`. A boundary with `z >`
//!    [`K_FSTEP`] that is the largest `z` within `L` either side is logged as a **frequency
//!    step** of size `D`. Frequency steps are logged, not removed: they are part of the clock.
//!
//! The design treats a record as a whole. It knows nothing of file or day boundaries: a jump
//! at a boundary is found because it is a jump, which is what distinguishes it from the
//! day-boundary-specific repair tried earlier on the onboard-clock-state comparison.

use super::series::PhaseSeries;
use serde::Serialize;

/// Half width (samples) of the running median the residuals are taken against.
pub const MEDIAN_HALF_WINDOW: usize = 30;
/// Outlier threshold in robust standard deviations.
pub const K_OUTLIER: f64 = 6.0;
/// Window (differences) either side of a candidate frequency step.
pub const FSTEP_WINDOW: usize = 60;
/// Frequency-step threshold in standard errors of the median difference.
pub const K_FSTEP: f64 = 10.0;

/// What the detector found at one place in the record.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub enum AnomalyKind {
    /// A run of `len` missing epochs in the input.
    Gap {
        /// Number of missing epochs.
        len: usize,
    },
    /// One sample set missing (an isolated phase outlier).
    PhaseOutlier,
    /// A phase jump of `size_s` seconds, removed from every later sample.
    PhaseStep {
        /// Size of the jump (s).
        size_s: f64,
    },
    /// `len` samples set missing inside a run of anomalous differences.
    Burst {
        /// Number of samples set missing.
        len: usize,
    },
    /// A logged (not removed) change of fractional frequency by `size`.
    FrequencyStep {
        /// Change of fractional frequency.
        size: f64,
    },
}

/// One logged anomaly: its grid index, its time and its kind.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Anomaly {
    /// Index on the record's regular grid.
    pub index: usize,
    /// Time of that grid point (s from the record start).
    pub t: f64,
    /// What was found.
    pub kind: AnomalyKind,
}

/// The visible log of a conditioning pass.
#[derive(Clone, Debug, Default, PartialEq, Serialize)]
pub struct ConditioningLog {
    /// Robust standard deviation `s` of the frequency residuals.
    pub sigma_y: f64,
    /// Every anomaly, in record order within each kind.
    pub anomalies: Vec<Anomaly>,
}

impl ConditioningLog {
    /// `(gaps, phase outliers, phase steps, bursts, frequency steps)`.
    pub fn counts(&self) -> (usize, usize, usize, usize, usize) {
        let mut c = (0, 0, 0, 0, 0);
        for a in &self.anomalies {
            match a.kind {
                AnomalyKind::Gap { .. } => c.0 += 1,
                AnomalyKind::PhaseOutlier => c.1 += 1,
                AnomalyKind::PhaseStep { .. } => c.2 += 1,
                AnomalyKind::Burst { .. } => c.3 += 1,
                AnomalyKind::FrequencyStep { .. } => c.4 += 1,
            }
        }
        c
    }

    /// A one-line human summary.
    pub fn summary(&self) -> String {
        let (g, o, p, b, f) = self.counts();
        format!(
            "gaps {g}, phase outliers {o}, phase steps {p}, bursts {b}, frequency steps {f} (robust sigma_y {:.3e})",
            self.sigma_y
        )
    }
}

fn median(v: &mut [f64]) -> f64 {
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

fn freqs(x: &[f64], tau0: f64) -> Vec<f64> {
    x.windows(2).map(|w| (w[1] - w[0]) / tau0).collect()
}

/// Condition `series`: returns the cleaned record and the log. See the module documentation
/// for the fixed design.
pub fn condition(series: &PhaseSeries) -> (PhaseSeries, ConditioningLog) {
    let tau0 = series.tau0;
    let t_of = |i: usize| series.t0 + i as f64 * tau0;
    let mut log = ConditioningLog::default();
    let mut x = series.x.clone();

    // 1. Gaps.
    let mut i = 0;
    while i < x.len() {
        if x[i].is_nan() {
            let a = i;
            while i < x.len() && x[i].is_nan() {
                i += 1;
            }
            log.anomalies.push(Anomaly {
                index: a,
                t: t_of(a),
                kind: AnomalyKind::Gap { len: i - a },
            });
        } else {
            i += 1;
        }
    }

    // 2. Residuals against the running median.
    let y = freqs(&x, tau0);
    let n = y.len();
    let h = MEDIAN_HALF_WINDOW;
    let mut e = vec![f64::NAN; n];
    let mut buf = Vec::with_capacity(2 * h + 1);
    for k in 0..n {
        if !y[k].is_finite() {
            continue;
        }
        buf.clear();
        buf.extend(
            y[k.saturating_sub(h)..(k + h + 1).min(n)]
                .iter()
                .copied()
                .filter(|v| v.is_finite()),
        );
        e[k] = y[k] - median(&mut buf);
    }
    let mut fe: Vec<f64> = e.iter().copied().filter(|v| v.is_finite()).collect();
    let med_e = median(&mut fe);
    let mut dev: Vec<f64> = fe.iter().map(|v| (v - med_e).abs()).collect();
    let s = 1.4826 * median(&mut dev);
    log.sigma_y = s;
    if !(s.is_finite() && s > 0.0) {
        return (
            PhaseSeries {
                t0: series.t0,
                tau0,
                x,
            },
            log,
        );
    }

    // 3. Flags and their classification.
    let flagged: Vec<bool> = e
        .iter()
        .map(|v| v.is_finite() && v.abs() > K_OUTLIER * s)
        .collect();
    let mut k = 0;
    let mut steps: Vec<(usize, f64)> = Vec::new();
    while k < n {
        if !flagged[k] {
            k += 1;
            continue;
        }
        let a = k;
        while k < n && flagged[k] {
            k += 1;
        }
        let b = k - 1;
        if a == b {
            let size = e[a] * tau0;
            steps.push((a, size));
            log.anomalies.push(Anomaly {
                index: a + 1,
                t: t_of(a + 1),
                kind: AnomalyKind::PhaseStep { size_s: size },
            });
        } else if b == a + 1
            && e[a].signum() != e[b].signum()
            && (e[a] + e[b]).abs() <= 0.5 * e[a].abs().max(e[b].abs())
        {
            x[a + 1] = f64::NAN;
            log.anomalies.push(Anomaly {
                index: a + 1,
                t: t_of(a + 1),
                kind: AnomalyKind::PhaseOutlier,
            });
        } else {
            for v in x.iter_mut().take(b + 1).skip(a + 1) {
                *v = f64::NAN;
            }
            log.anomalies.push(Anomaly {
                index: a + 1,
                t: t_of(a + 1),
                kind: AnomalyKind::Burst { len: b - a },
            });
        }
    }
    // Remove the phase steps (cumulative, later samples only).
    if !steps.is_empty() {
        let mut acc = 0.0;
        let mut si = 0;
        for (j, v) in x.iter_mut().enumerate() {
            while si < steps.len() && steps[si].0 < j {
                acc += steps[si].1;
                si += 1;
            }
            *v -= acc;
        }
    }

    // 4. Frequency steps (logged only).
    let y = freqs(&x, tau0);
    let l = FSTEP_WINDOW;
    let need = (0.8 * l as f64).ceil() as usize;
    let se = 1.2533 * s * (2.0 / l as f64).sqrt();
    let mut z = vec![0.0f64; y.len() + 1];
    let mut dsz = vec![0.0f64; y.len() + 1];
    if y.len() >= 2 * l {
        let mut before = Vec::with_capacity(l);
        let mut after = Vec::with_capacity(l);
        for b in l..=(y.len() - l) {
            before.clear();
            after.clear();
            before.extend(y[b - l..b].iter().copied().filter(|v| v.is_finite()));
            after.extend(y[b..b + l].iter().copied().filter(|v| v.is_finite()));
            if before.len() < need || after.len() < need {
                continue;
            }
            let d = median(&mut after) - median(&mut before);
            dsz[b] = d;
            z[b] = d.abs() / se;
        }
        for b in l..=(y.len() - l) {
            if z[b] <= K_FSTEP {
                continue;
            }
            let lo = b.saturating_sub(l);
            let hi = (b + l).min(z.len() - 1);
            let is_max = (lo..=hi).all(|j| j == b || z[j] < z[b] || (z[j] == z[b] && j > b));
            if is_max {
                log.anomalies.push(Anomaly {
                    index: b,
                    t: t_of(b),
                    kind: AnomalyKind::FrequencyStep { size: dsz[b] },
                });
            }
        }
    }

    (
        PhaseSeries {
            t0: series.t0,
            tau0,
            x,
        },
        log,
    )
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    fn white_fm(n: usize, sigma: f64, seed: u64) -> Vec<f64> {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let d = Normal::new(0.0, sigma).unwrap();
        let mut acc = 0.0;
        (0..n)
            .map(|_| {
                acc += d.sample(&mut rng);
                acc
            })
            .collect()
    }

    fn series(x: Vec<f64>) -> PhaseSeries {
        PhaseSeries {
            t0: 0.0,
            tau0: 1.0,
            x,
        }
    }

    #[test]
    fn clean_white_fm_raises_nothing() {
        let (_, log) = condition(&series(white_fm(5000, 1e-11, 1)));
        assert_eq!(log.counts(), (0, 0, 0, 0, 0), "{}", log.summary());
    }

    #[test]
    fn a_phase_step_is_found_sized_and_removed() {
        let mut x = white_fm(3000, 1e-11, 2);
        let clean = x.clone();
        for v in x.iter_mut().skip(1500) {
            *v += 5e-9;
        }
        let (c, log) = condition(&series(x));
        let steps: Vec<_> = log
            .anomalies
            .iter()
            .filter_map(|a| match a.kind {
                AnomalyKind::PhaseStep { size_s } => Some((a.index, size_s)),
                _ => None,
            })
            .collect();
        assert_eq!(steps.len(), 1, "{}", log.summary());
        assert_eq!(steps[0].0, 1500);
        assert!((steps[0].1 - 5e-9).abs() < 1e-10);
        // The cleaned record is the original to within the median residual (one sample's
        // noise).
        let off = c.x[2999] - clean[2999];
        assert!(off.abs() < 1e-10, "{off}");
    }

    #[test]
    fn an_isolated_outlier_is_removed_not_treated_as_a_step() {
        let mut x = white_fm(3000, 1e-11, 3);
        x[800] += 3e-9;
        let (c, log) = condition(&series(x));
        assert_eq!(log.counts(), (0, 1, 0, 0, 0), "{}", log.summary());
        assert!(c.x[800].is_nan());
    }

    #[test]
    fn gaps_are_logged_and_a_burst_is_cut_out() {
        let mut x = white_fm(3000, 1e-11, 4);
        for v in x.iter_mut().take(1210).skip(1200) {
            *v = f64::NAN;
        }
        x[2000] += 4e-9;
        x[2001] -= 6e-9;
        x[2002] += 9e-9;
        let (c, log) = condition(&series(x));
        let (g, _, _, b, _) = log.counts();
        assert_eq!(g, 1);
        assert_eq!(b, 1, "{}", log.summary());
        assert!(c.x[2001].is_nan());
        assert!(log
            .anomalies
            .iter()
            .any(|a| a.kind == AnomalyKind::Gap { len: 10 }));
    }

    #[test]
    fn a_frequency_step_is_logged_and_kept() {
        let mut x = white_fm(4000, 1e-11, 5);
        for (i, v) in x.iter_mut().enumerate().skip(2000) {
            *v += 3e-11 * (i - 2000) as f64;
        }
        let (c, log) = condition(&series(x.clone()));
        let f: Vec<_> = log
            .anomalies
            .iter()
            .filter(|a| matches!(a.kind, AnomalyKind::FrequencyStep { .. }))
            .collect();
        assert_eq!(f.len(), 1, "{}", log.summary());
        assert!((f[0].index as i64 - 2000).abs() <= 3);
        assert_eq!(c.x, x, "a frequency step must not alter the record");
    }
}
