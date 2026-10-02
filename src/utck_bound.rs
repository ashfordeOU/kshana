// SPDX-License-Identifier: AGPL-3.0-only
//! A pooled, hierarchical ageing bound for UTC(k), each national laboratory's realisation of
//! Coordinated Universal Time: how far a laboratory's `[UTC - UTC(k)]` offset can move over a
//! staleness interval, when the laboratory's own history is short or gappy.
//!
//! # Model
//!
//! For a lag `L` (days), a laboratory's ageing increments are `D = x(t + L) - x(t)` over every
//! pair of its training MJDs (Modified Julian Dates) `L` apart; its own mean-square increment is
//! `s_k^2(L)` from `n_k(L)` pairs.
//!
//! **Prior (pooled across laboratories).** On a set of prior laboratories and months,
//! `ln s_k^2(L)` is treated as normally distributed across laboratories with mean `mu(L)` and
//! standard deviation `tau(L)`, estimated from every prior laboratory with at least
//! `min_pairs` pairs at that lag. The prior predictive variance for a new laboratory is taken at
//! an upper quantile, `sigma_p^2(L) = exp(mu(L) + z_p tau(L))`, so a laboratory with no history
//! is bounded as a fairly poor laboratory rather than a typical one.
//!
//! **Shrinkage.** A laboratory's variance is the precision-weighted combination
//! `s~^2 = (n_k s_k^2 + nu0 sigma_p^2) / (n_k + nu0)`: a long history dominates, a short one
//! leans on the prior, none at all takes the prior.
//!
//! **Bound.** At lag `L` after its last training value `x_last`, the offset is bounded by
//! `b = |x_last| + z s~`, `z` the two-sided normal quantile of the allocated tail.
//!
//! The prior must be fitted on laboratories and months disjoint from the ones it is scored on;
//! [`fit_prior`] takes the prior's laboratories and MJD range explicitly so a caller states the
//! split. Status: MODELLED, an engine for a pre-registered prospective comparison; nothing here
//! has been scored against Circular T.

use std::collections::BTreeMap;

/// A laboratory's offset history: MJD -> `[UTC - UTC(k)]` (ns).
pub type LabSeries = BTreeMap<i64, f64>;

/// The pooled prior over lags.
#[derive(Clone, Debug, PartialEq)]
pub struct PooledAgeingPrior {
    /// The lags (days) the prior is tabulated at, increasing.
    pub lags: Vec<i64>,
    /// `mu(L)`: mean of `ln s_k^2(L)` (ns^2) over the prior laboratories.
    pub mu: Vec<f64>,
    /// `tau(L)`: standard deviation of `ln s_k^2(L)`.
    pub tau: Vec<f64>,
    /// Number of prior laboratories at each lag.
    pub n_labs: Vec<usize>,
    /// The upper quantile `z_p` of the prior predictive variance.
    pub z_p: f64,
    /// The prior strength `nu0` (equivalent number of pairs).
    pub nu0: f64,
}

/// Mean-square increment `s^2(L)` and its pair count, over pairs with both MJDs in `range`.
pub fn mean_square_increment(series: &LabSeries, lag: i64, range: (i64, i64)) -> (f64, usize) {
    let (mut s, mut n) = (0.0, 0usize);
    for (&t, &x) in series.range(range.0..=range.1) {
        if t + lag > range.1 {
            break;
        }
        if let Some(&y) = series.get(&(t + lag)) {
            let d = y - x;
            s += d * d;
            n += 1;
        }
    }
    if n == 0 {
        (f64::NAN, 0)
    } else {
        (s / n as f64, n)
    }
}

/// Fit the pooled prior at `lags` from `labs` restricted to the MJD `range`, using every
/// laboratory with at least `min_pairs` pairs at a lag. A lag with fewer than two such
/// laboratories is dropped.
pub fn fit_prior(
    labs: &[&LabSeries],
    range: (i64, i64),
    lags: &[i64],
    min_pairs: usize,
    z_p: f64,
    nu0: f64,
) -> PooledAgeingPrior {
    let mut p = PooledAgeingPrior {
        lags: Vec::new(),
        mu: Vec::new(),
        tau: Vec::new(),
        n_labs: Vec::new(),
        z_p,
        nu0,
    };
    for &lag in lags {
        let ls: Vec<f64> = labs
            .iter()
            .filter_map(|s| {
                let (v, n) = mean_square_increment(s, lag, range);
                (n >= min_pairs && v > 0.0).then(|| v.ln())
            })
            .collect();
        if ls.len() < 2 {
            continue;
        }
        let k = ls.len() as f64;
        let mu = ls.iter().sum::<f64>() / k;
        let tau = (ls.iter().map(|v| (v - mu) * (v - mu)).sum::<f64>() / (k - 1.0)).sqrt();
        p.lags.push(lag);
        p.mu.push(mu);
        p.tau.push(tau);
        p.n_labs.push(ls.len());
    }
    p
}

impl PooledAgeingPrior {
    /// The prior predictive variance `sigma_p^2(L)` (ns^2). Between tabulated lags `ln
    /// sigma_p^2` is interpolated linearly in `ln L`; beyond the last it grows as `L^2` (a
    /// constant frequency offset), before the first it is held. `None` for an empty prior.
    pub fn prior_variance(&self, lag: i64) -> Option<f64> {
        let lv: Vec<f64> = self
            .mu
            .iter()
            .zip(&self.tau)
            .map(|(m, t)| m + self.z_p * t)
            .collect();
        let first = *self.lags.first()?;
        let last = *self.lags.last()?;
        let l = lag as f64;
        if lag <= first {
            return Some(lv[0].exp());
        }
        if lag >= last {
            return Some((lv[lv.len() - 1] + 2.0 * (l / last as f64).ln()).exp());
        }
        let i = self.lags.partition_point(|&x| x <= lag);
        let (a, b) = (self.lags[i - 1] as f64, self.lags[i] as f64);
        let w = (l.ln() - a.ln()) / (b.ln() - a.ln());
        Some((lv[i - 1] + w * (lv[i] - lv[i - 1])).exp())
    }

    /// The shrunk ageing standard deviation (ns) of a laboratory whose training history is
    /// `history` restricted to `range`, at `lag`.
    pub fn ageing_sigma(&self, history: &LabSeries, range: (i64, i64), lag: i64) -> Option<f64> {
        let sp2 = self.prior_variance(lag)?;
        let (s2, n) = mean_square_increment(history, lag, range);
        let own = if n > 0 { n as f64 * s2 } else { 0.0 };
        Some(((own + self.nu0 * sp2) / (n as f64 + self.nu0)).sqrt())
    }

    /// The bound `|x_last| + z s~` (ns) on the laboratory's offset `lag` days after its last
    /// training value `x_last`, at two-sided tail probability `tail`.
    pub fn bound(
        &self,
        history: &LabSeries,
        range: (i64, i64),
        x_last: f64,
        lag: i64,
        tail: f64,
    ) -> Option<f64> {
        let z = crate::raim::normal_quantile(1.0 - 0.5 * tail);
        Some(x_last.abs() + z * self.ageing_sigma(history, range, lag)?)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn walk(step: f64, n: i64, wobble: u64) -> LabSeries {
        // Deterministic alternating increments of size `step`, sign by a simple hash.
        let mut x = 0.0;
        let mut s = LabSeries::new();
        let mut h = wobble;
        for k in 0..n {
            h = h
                .wrapping_mul(6364136223846793005)
                .wrapping_add(1442695040888963407);
            x += if h >> 63 == 1 { step } else { -step };
            s.insert(60_000 + 5 * k, x);
        }
        s
    }

    #[test]
    fn increments_and_prior() {
        let a = walk(1.0, 400, 1);
        let b = walk(2.0, 400, 2);
        let c = walk(4.0, 400, 3);
        let (s2, n) = mean_square_increment(&a, 5, (60_000, 62_000));
        assert_eq!(s2, 1.0);
        assert_eq!(n, 399);
        let p = fit_prior(&[&a, &b, &c], (60_000, 62_000), &[5, 10, 20], 20, 1.0, 10.0);
        assert_eq!(p.lags, vec![5, 10, 20]);
        assert!((p.mu[0] - (1f64.ln() + 4f64.ln() + 16f64.ln()) / 3.0).abs() < 1e-12);
        assert_eq!(p.n_labs, vec![3, 3, 3]);
        // A lab with no history takes the prior; a long history dominates it.
        let empty = LabSeries::new();
        let sp = p.prior_variance(5).unwrap().sqrt();
        assert!((p.ageing_sigma(&empty, (60_000, 62_000), 5).unwrap() - sp).abs() < 1e-12);
        let own = p.ageing_sigma(&a, (60_000, 62_000), 5).unwrap();
        assert!(own < sp && own > 1.0);
        // Interpolation and extrapolation are monotone here.
        let v = |l| p.prior_variance(l).unwrap();
        assert!(v(5) <= v(7) && v(7) <= v(10) && v(20) < v(40));
        assert!((v(40) / v(20) - 4.0).abs() < 1e-9);
        let b0 = p.bound(&empty, (60_000, 62_000), -3.0, 5, 1e-2).unwrap();
        assert!((b0 - (3.0 + 2.5758 * sp)).abs() < 1e-3 * sp);
    }
}
