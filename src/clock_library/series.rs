// SPDX-License-Identifier: AGPL-3.0-only
//! A uniformly gridded clock phase record with explicit gaps, and the gap-aware Allan and
//! Hadamard variances the device cards are fitted and scored with.
//!
//! Real clock records (International GNSS Service (IGS) clock files, receiver clock solutions,
//! counter logs) miss epochs. Rather than interpolating across a gap, the record keeps every
//! missing epoch as `NaN` and each estimator uses only the differences whose samples are all
//! present, the convention Stable32 uses for gaps. The count of usable differences is returned
//! with every value so the caller can size its degrees of freedom.

/// A phase (time-error) record on a uniform grid: sample `i` is at `t0 + i * tau0` seconds and
/// holds the phase in seconds, or `NaN` when that epoch is missing.
#[derive(Clone, Debug, PartialEq)]
pub struct PhaseSeries {
    /// Time of sample 0 (seconds, any consistent epoch).
    pub t0: f64,
    /// Grid spacing (seconds).
    pub tau0: f64,
    /// Phase samples (seconds); `NaN` marks a missing epoch.
    pub x: Vec<f64>,
}

/// Samples dropped while gridding a record by [`PhaseSeries::from_samples`].
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct GriddingLog {
    /// Samples whose time lay more than 1 % of `tau0` from a grid point.
    pub off_grid: usize,
    /// Samples that fell on an already occupied grid point (the first is kept).
    pub duplicates: usize,
    /// Non-finite samples.
    pub non_finite: usize,
}

impl PhaseSeries {
    /// Grid `(t, x)` samples (seconds, seconds) at spacing `tau0`, starting at the earliest
    /// time. A sample more than 1 % of `tau0` off the grid is dropped and counted; of two
    /// samples on one grid point the first in input order is kept.
    pub fn from_samples(samples: &[(f64, f64)], tau0: f64) -> (PhaseSeries, GriddingLog) {
        let mut log = GriddingLog::default();
        let finite: Vec<(f64, f64)> = samples
            .iter()
            .copied()
            .filter(|(t, x)| {
                let ok = t.is_finite() && x.is_finite();
                if !ok {
                    log.non_finite += 1;
                }
                ok
            })
            .collect();
        let Some(t0) = finite.iter().map(|s| s.0).reduce(f64::min) else {
            return (
                PhaseSeries {
                    t0: 0.0,
                    tau0,
                    x: Vec::new(),
                },
                log,
            );
        };
        let t1 = finite.iter().map(|s| s.0).fold(t0, f64::max);
        let n = ((t1 - t0) / tau0).round() as usize + 1;
        let mut x = vec![f64::NAN; n];
        for (t, v) in finite {
            let k = (t - t0) / tau0;
            let i = k.round();
            if (k - i).abs() > 0.01 {
                log.off_grid += 1;
                continue;
            }
            let i = i as usize;
            if x[i].is_nan() {
                x[i] = v;
            } else {
                log.duplicates += 1;
            }
        }
        (PhaseSeries { t0, tau0, x }, log)
    }

    /// Number of grid epochs (present or missing).
    pub fn len(&self) -> usize {
        self.x.len()
    }

    /// Whether the record has no grid epochs.
    pub fn is_empty(&self) -> bool {
        self.x.is_empty()
    }

    /// Number of present (finite) samples.
    pub fn valid(&self) -> usize {
        self.x.iter().filter(|v| v.is_finite()).count()
    }

    /// The sub-record of grid indices `a..b` (clamped), with its own `t0`.
    pub fn slice(&self, a: usize, b: usize) -> PhaseSeries {
        let b = b.min(self.x.len());
        let a = a.min(b);
        PhaseSeries {
            t0: self.t0 + a as f64 * self.tau0,
            tau0: self.tau0,
            x: self.x[a..b].to_vec(),
        }
    }

    /// The fit/score split of the device cards: the first third of the grid epochs
    /// (`0..len/3`, integer division) and the remaining two thirds.
    pub fn split_thirds(&self) -> (PhaseSeries, PhaseSeries) {
        let k = self.x.len() / 3;
        (self.slice(0, k), self.slice(k, self.x.len()))
    }

    /// The longest run of consecutive present samples, as a sub-record.
    pub fn longest_run(&self) -> PhaseSeries {
        let (mut best_a, mut best_len) = (0usize, 0usize);
        let mut a = 0usize;
        for i in 0..=self.x.len() {
            let present = i < self.x.len() && self.x[i].is_finite();
            if !present {
                if i - a > best_len {
                    best_a = a;
                    best_len = i - a;
                }
                a = i + 1;
            }
        }
        self.slice(best_a, best_a + best_len)
    }
}

/// Gap-aware overlapping Allan variance at averaging factor `m`: the mean of
/// `(x[i+2m] - 2x[i+m] + x[i])^2 / (2 (m tau0)^2)` over every `i` whose three samples are
/// present, with the number of such terms. `None` when fewer than one term exists.
pub fn gappy_oavar(x: &[f64], tau0: f64, m: usize) -> Option<(f64, usize)> {
    if m == 0 || x.len() <= 2 * m {
        return None;
    }
    let tau = m as f64 * tau0;
    let (mut s, mut c) = (0.0, 0usize);
    for i in 0..x.len() - 2 * m {
        let d = x[i + 2 * m] - 2.0 * x[i + m] + x[i];
        if d.is_finite() {
            s += d * d;
            c += 1;
        }
    }
    (c > 0).then(|| (s / (2.0 * c as f64 * tau * tau), c))
}

/// Gap-aware overlapping Hadamard variance at averaging factor `m`: the mean of
/// `(x[i+3m] - 3x[i+2m] + 3x[i+m] - x[i])^2 / (6 (m tau0)^2)` over every `i` whose four samples
/// are present, with the number of such terms.
pub fn gappy_ohvar(x: &[f64], tau0: f64, m: usize) -> Option<(f64, usize)> {
    if m == 0 || x.len() <= 3 * m {
        return None;
    }
    let tau = m as f64 * tau0;
    let (mut s, mut c) = (0.0, 0usize);
    for i in 0..x.len() - 3 * m {
        let d = x[i + 3 * m] - 3.0 * x[i + 2 * m] + 3.0 * x[i + m] - x[i];
        if d.is_finite() {
            s += d * d;
            c += 1;
        }
    }
    (c > 0).then(|| (s / (6.0 * c as f64 * tau * tau), c))
}

/// Least-squares quadratic `x ≈ c0 + c1 t + c2 t^2` (t in seconds from the record start) over
/// the present samples, and the record with it removed. Returns `[c0, c1, c2]`; the fractional
/// frequency drift rate is `2 c2` (per second).
pub fn remove_quadratic(s: &PhaseSeries) -> (PhaseSeries, [f64; 3]) {
    let pts: Vec<(f64, f64)> =
        s.x.iter()
            .enumerate()
            .filter(|(_, v)| v.is_finite())
            .map(|(i, v)| (i as f64 * s.tau0, *v))
            .collect();
    if pts.len() < 3 {
        return (s.clone(), [0.0; 3]);
    }
    // Centre and scale the abscissa for conditioning, then map back.
    let tc = pts.iter().map(|p| p.0).sum::<f64>() / pts.len() as f64;
    let sc = pts
        .iter()
        .map(|p| (p.0 - tc).abs())
        .fold(0.0_f64, f64::max)
        .max(1.0);
    let mut a = [[0.0f64; 3]; 3];
    let mut b = [0.0f64; 3];
    for &(t, v) in &pts {
        let u = (t - tc) / sc;
        let p = [1.0, u, u * u];
        for r in 0..3 {
            b[r] += p[r] * v;
            for c in 0..3 {
                a[r][c] += p[r] * p[c];
            }
        }
    }
    let Some(k) = solve3(a, b) else {
        return (s.clone(), [0.0; 3]);
    };
    // x = k0 + k1 u + k2 u^2 with u = (t - tc)/sc.
    let c2 = k[2] / (sc * sc);
    let c1 = k[1] / sc - 2.0 * k[2] * tc / (sc * sc);
    let c0 = k[0] - k[1] * tc / sc + k[2] * tc * tc / (sc * sc);
    let x =
        s.x.iter()
            .enumerate()
            .map(|(i, v)| {
                let u = (i as f64 * s.tau0 - tc) / sc;
                v - (k[0] + k[1] * u + k[2] * u * u)
            })
            .collect();
    (
        PhaseSeries {
            t0: s.t0,
            tau0: s.tau0,
            x,
        },
        [c0, c1, c2],
    )
}

#[allow(clippy::needless_range_loop)]
fn solve3(mut a: [[f64; 3]; 3], mut b: [f64; 3]) -> Option<[f64; 3]> {
    for col in 0..3 {
        let piv = (col..3).max_by(|&i, &j| a[i][col].abs().total_cmp(&a[j][col].abs()))?;
        if a[piv][col].abs() < 1e-300 {
            return None;
        }
        a.swap(col, piv);
        b.swap(col, piv);
        for row in col + 1..3 {
            let f = a[row][col] / a[col][col];
            for c in col..3 {
                a[row][c] -= f * a[col][c];
            }
            b[row] -= f * b[col];
        }
    }
    let mut x = [0.0; 3];
    for i in (0..3).rev() {
        let mut acc = b[i];
        for j in i + 1..3 {
            acc -= a[i][j] * x[j];
        }
        x[i] = acc / a[i][i];
    }
    Some(x)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gridding_keeps_gaps_and_counts_rejects() {
        let s = [
            (0.0, 1.0),
            (30.0, 2.0),
            (30.0, 9.0),
            (90.0, 4.0),
            (100.0, 5.0),
            (120.0, f64::NAN),
        ];
        let (p, log) = PhaseSeries::from_samples(&s, 30.0);
        assert_eq!(p.len(), 4);
        assert_eq!(p.x[1], 2.0);
        assert!(p.x[2].is_nan());
        assert_eq!(
            log,
            GriddingLog {
                off_grid: 1,
                duplicates: 1,
                non_finite: 1
            }
        );
        assert_eq!(p.valid(), 3);
    }

    #[test]
    fn gap_free_variances_match_the_allan_module() {
        let x: Vec<f64> = (0..200)
            .map(|i| ((i * 7919) % 101) as f64 * 1e-9 + i as f64 * 1e-10)
            .collect();
        for m in [1, 2, 4, 8] {
            let (v, c) = gappy_oavar(&x, 1.0, m).unwrap();
            let a = crate::allan::overlapping_adev(&x, 1.0, m);
            assert!((v.sqrt() - a).abs() / a < 1e-12);
            assert_eq!(c, 200 - 2 * m);
            let (h, _) = gappy_ohvar(&x, 1.0, m).unwrap();
            let ha = crate::allan::hadamard_adev(&x, 1.0, m);
            assert!((h.sqrt() - ha).abs() / ha < 1e-12);
        }
    }

    #[test]
    fn a_gap_removes_exactly_the_terms_that_touch_it() {
        let mut x: Vec<f64> = (0..50).map(|i| (i as f64).sin()).collect();
        x[20] = f64::NAN;
        let (_, c1) = gappy_oavar(&x, 1.0, 1).unwrap();
        assert_eq!(c1, 48 - 3);
        let (_, c4) = gappy_oavar(&x, 1.0, 4).unwrap();
        assert_eq!(c4, 42 - 3);
    }

    #[test]
    fn quadratic_removal_recovers_the_drift() {
        let s = PhaseSeries {
            t0: 0.0,
            tau0: 10.0,
            x: (0..500)
                .map(|i| {
                    let t = i as f64 * 10.0;
                    1e-6 + 2e-9 * t + 0.5 * 3e-14 * t * t
                })
                .collect(),
        };
        let (r, c) = remove_quadratic(&s);
        assert!((2.0 * c[2] - 3e-14).abs() / 3e-14 < 1e-6, "{c:?}");
        assert!((c[1] - 2e-9).abs() / 2e-9 < 1e-6);
        assert!(r.x.iter().all(|v| v.abs() < 1e-15));
    }

    #[test]
    fn thirds_and_longest_run() {
        let mut s = PhaseSeries {
            t0: 100.0,
            tau0: 1.0,
            x: (0..10).map(|i| i as f64).collect(),
        };
        let (a, b) = s.split_thirds();
        assert_eq!((a.len(), b.len()), (3, 7));
        assert_eq!(b.t0, 103.0);
        s.x[4] = f64::NAN;
        let r = s.longest_run();
        assert_eq!(r.x, vec![5.0, 6.0, 7.0, 8.0, 9.0]);
    }
}
